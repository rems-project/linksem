(* Claude: the assembler source of a test program.  `_start` sets the registers and
   then runs through one "function" per frame-base kind, each a few nops with a stop
   label (`dw_here` for main, `dw_here_<kind>` for the others), and exits; `dw_mem` is
   a known 256-byte block.  DWARF 4 `.debug_info` describes each function as a
   subprogram with a `DW_AT_frame_base` of its kind and, as its variables, the
   expressions under test attached to it, each with a `DW_AT_location` that is an
   exprloc or (for the @loclist annotations) a location list in `.debug_loc` whose
   entry at the stop label is the expression, with decoy entries before and after.
   `.debug_frame` comes from the .cfi directives (one FDE for the whole of `_start`).
   With ~version:5 the unit is a DWARF 5 one: a version 5 header, the location lists
   in `.debug_loclists` (DW_LLE_offset_pair entries, after a DW_LLE_base_address entry
   for the @loclist-base annotation, with DW_LLE_start_length / DW_LLE_start_end decoys),
   and a `.debug_addr` table (dw_mem, dw_mem+16, _start) for DW_OP_addrx/constx.  Both
   versions define base types (T_uc .. T_l, see [base_types]) that the typed operations
   name by their unit-relative offsets, which are kept below 128 (see Encode). *)

let op0 name : Expr.op = { Expr.name; args = [] }
let op1 name k : Expr.op = { Expr.name; args = [Expr.Int (Z.of_int k)] }

(* a frame-base kind: its annotation name, the subprogram's name, its stop label, and
   the frame-base expression (for `loclist`, the location list's entry at the label) *)
type frame_kind = { fk_name : string; fk_func : string; fk_label : string; fk_base : Expr.t; fk_loclist : bool }

let frame_kinds (arch : Arch.t) =
  let fp = arch.cfa_reg in
  let breg n = op1 (Printf.sprintf "DW_OP_breg%d" fp) n in
  [ { fk_name = "cfa"; fk_func = "main"; fk_label = "dw_here"; fk_base = [op0 "DW_OP_call_frame_cfa"]; fk_loclist = false };
    { fk_name = "reg"; fk_func = "f_reg"; fk_label = "dw_here_reg"; fk_base = [op0 (Printf.sprintf "DW_OP_reg%d" fp)]; fk_loclist = false };
    { fk_name = "breg"; fk_func = "f_breg"; fk_label = "dw_here_breg"; fk_base = [breg 32]; fk_loclist = false };
    { fk_name = "expr"; fk_func = "f_expr"; fk_label = "dw_here_expr"; fk_base = [breg 0; op1 "DW_OP_const1u" 48; op0 "DW_OP_plus"]; fk_loclist = false };
    { fk_name = "loclist"; fk_func = "f_loclist"; fk_label = "dw_here_loclist"; fk_base = [breg 64]; fk_loclist = true } ]

let frame_kind arch name = List.find (fun k -> k.fk_name = name) (frame_kinds arch)

(* the base types: symbol (also the DIE's label), size, DW_ATE encoding; T_ul is the
   variables' type *)
let base_types = [ ("T_ul", 8, 0x07); ("T_l", 8, 0x05); ("T_ui", 4, 0x07); ("T_i", 4, 0x05);
                   ("T_us", 2, 0x07); ("T_s", 2, 0x05); ("T_uc", 1, 0x08); ("T_sc", 1, 0x06) ]

(* the function's first address and end label *)
let func_start k = if k.fk_func = "main" then "_start" else k.fk_func
let func_end k = ".L" ^ k.fk_func ^ "_end"
let label_end k = ".L" ^ k.fk_label ^ "_end"

(* a location list in .debug_loc: [start, label) -> decoy_before, [label, label_end) ->
   the expression, [label_end, end) -> decoy_after, all relative to `base` (the CU's
   DW_AT_low_pc, `_start`, or after a base address selection entry the function's start) *)
let loclist b ~name ~with_base k (directives : string list) (decoy_before : string) (decoy_after : string) =
  let p fmt = Printf.bprintf b fmt in
  let base = if with_base then func_start k else "_start" in
  p ".Lloc_%s:\n" name;
  if with_base then p "\t.8byte 0xffffffffffffffff, %s\n" (func_start k);
  let entry lo hi body =
    p "\t.8byte %s-%s, %s-%s\n\t.2byte .Lloc_%s_%s_e-.Lloc_%s_%s_s\n.Lloc_%s_%s_s:\n" lo base hi base name lo name lo name lo;
    List.iter (fun d -> p "%s\n" d) body;
    p ".Lloc_%s_%s_e:\n" name lo in
  entry (func_start k) k.fk_label [decoy_before];
  entry k.fk_label (label_end k) directives;
  entry (label_end k) (func_end k) [decoy_after];
  p "\t.8byte 0, 0\n"

(* the same list in .debug_loclists (DWARF 5, section 2.6.2): offset pairs relative to
   the CU base (`_start`) or, with a base address entry, to the function's start; the
   decoys are a DW_LLE_start_length and a DW_LLE_start_end entry *)
let loclist5 b ~name ~with_base k (directives : string list) (decoy_before : string) (decoy_after : string) =
  let p fmt = Printf.bprintf b fmt in
  let base = if with_base then func_start k else "_start" in
  p ".Lloc_%s:\n" name;
  if with_base then p "\t.byte 0x06\n\t.8byte %s\n" (func_start k);                  (* DW_LLE_base_address *)
  let body tag body =
    p "\t.uleb128 .Lloc_%s_%s_e-.Lloc_%s_%s_s\n.Lloc_%s_%s_s:\n" name tag name tag name tag;
    List.iter (fun d -> p "%s\n" d) body;
    p ".Lloc_%s_%s_e:\n" name tag in
  p "\t.byte 0x08\n\t.8byte %s\n\t.uleb128 %s-%s\n" (func_start k) k.fk_label (func_start k);   (* DW_LLE_start_length *)
  body "a" [decoy_before];
  p "\t.byte 0x04\n\t.uleb128 %s-%s\n\t.uleb128 %s-%s\n" k.fk_label base (label_end k) base;   (* DW_LLE_offset_pair *)
  body "b" directives;
  p "\t.byte 0x07\n\t.8byte %s\n\t.8byte %s\n" (label_end k) (func_end k);                  (* DW_LLE_start_end *)
  body "c" [decoy_after];
  p "\t.byte 0\n"                                                                        (* DW_LLE_end_of_list *)

let emit (arch : Arch.t) ?(version = 4) (vars : (Expr.named * string list) list) : string =
  let b = Buffer.create 65536 in
  let p fmt = Printf.bprintf b fmt in
  let kinds = frame_kinds arch in
  let bytes_of ops = Encode.asm_directives ops in
  let v5 = version = 5 in
  p "# Claude: generated by dwexpr_build for %s, DWARF %d; do not edit\n" arch.name version;
  p "\t.cfi_sections .debug_frame\n\t.text\n\t.globl _start\n\t.type _start, %s\n_start:\n\t.cfi_startproc\n" arch.fn_type;
  Buffer.add_string b arch.prologue;
  List.iter (fun (r, v) -> if r <> arch.cfa_reg then Buffer.add_string b (arch.set_reg r v)) arch.regs;
  List.iter (fun (r, v) -> if r = arch.cfa_reg then Buffer.add_string b (arch.set_reg r v)) arch.regs;
  List.iter (fun k ->
      if k.fk_func <> "main" then p "\t.globl %s\n%s:\n\tnop\n" k.fk_func k.fk_func;
      p "\t.globl %s\n%s:\n\tnop\n%s:\n\tnop\n%s:\n" k.fk_label k.fk_label (label_end k) (func_end k)) kinds;
  Buffer.add_string b arch.exit_seq;
  p "\t.cfi_endproc\n.Lend_start:\n\t.size _start, .Lend_start-_start\n";
  (* page-aligned so that its address does not move when the code changes size *)
  p "\n\t.data\n\t.globl dw_mem\n\t.p2align 12\ndw_mem:\n";
  for i = 0 to Arch.mem_size / 16 - 1 do
    p "\t.byte %s\n" (String.concat "," (List.init 16 (fun j -> Printf.sprintf "0x%02x" (Arch.mem_byte (16 * i + j)))))
  done;
  p "\t.size dw_mem, %d\n" Arch.mem_size;
  (* abbreviations *)
  p "\n\t.section .debug_abbrev,\"\",%s\n.Labbrev:\n" arch.progbits;
  p "\t.uleb128 1\n\t.uleb128 0x11\n\t.byte 1\n";                       (* DW_TAG_compile_unit, has children *)
  p "\t.uleb128 0x25\n\t.uleb128 0x08\n";                               (* DW_AT_producer string *)
  p "\t.uleb128 0x13\n\t.uleb128 0x0b\n";                               (* DW_AT_language data1 *)
  p "\t.uleb128 0x03\n\t.uleb128 0x08\n";                               (* DW_AT_name string *)
  p "\t.uleb128 0x11\n\t.uleb128 0x01\n";                               (* DW_AT_low_pc addr *)
  p "\t.uleb128 0x12\n\t.uleb128 0x07\n";                               (* DW_AT_high_pc data8 (length) *)
  if v5 then p "\t.uleb128 0x73\n\t.uleb128 0x17\n";                     (* DW_AT_addr_base sec_offset *)
  p "\t.byte 0,0\n";
  p "\t.uleb128 2\n\t.uleb128 0x24\n\t.byte 0\n";                       (* DW_TAG_base_type *)
  p "\t.uleb128 0x03\n\t.uleb128 0x08\n";                               (* name *)
  p "\t.uleb128 0x3e\n\t.uleb128 0x0b\n";                               (* DW_AT_encoding data1 *)
  p "\t.uleb128 0x0b\n\t.uleb128 0x0b\n";                               (* DW_AT_byte_size data1 *)
  p "\t.byte 0,0\n";
  let subprogram code fb_form =
    p "\t.uleb128 %d\n\t.uleb128 0x2e\n\t.byte 1\n" code;               (* DW_TAG_subprogram, has children *)
    p "\t.uleb128 0x03\n\t.uleb128 0x08\n";                             (* name *)
    p "\t.uleb128 0x3f\n\t.uleb128 0x19\n";                             (* DW_AT_external flag_present *)
    p "\t.uleb128 0x11\n\t.uleb128 0x01\n";                             (* low_pc *)
    p "\t.uleb128 0x12\n\t.uleb128 0x07\n";                             (* high_pc data8 *)
    p "\t.uleb128 0x40\n\t.uleb128 0x%02x\n" fb_form;                   (* DW_AT_frame_base *)
    p "\t.byte 0,0\n" in
  subprogram 3 0x18;                                                    (* frame base: exprloc *)
  subprogram 6 0x17;                                                    (* frame base: sec_offset *)
  let variable code loc_form =
    p "\t.uleb128 %d\n\t.uleb128 0x34\n\t.byte 0\n" code;               (* DW_TAG_variable *)
    p "\t.uleb128 0x03\n\t.uleb128 0x08\n";                             (* name *)
    p "\t.uleb128 0x49\n\t.uleb128 0x13\n";                             (* DW_AT_type ref4 *)
    p "\t.uleb128 0x02\n\t.uleb128 0x%02x\n" loc_form;                  (* DW_AT_location *)
    p "\t.byte 0,0\n" in
  variable 4 0x18;                                                      (* location: exprloc *)
  variable 5 0x17;                                                      (* location: sec_offset *)
  p "\t.byte 0\n";
  (* the compilation unit *)
  p "\n\t.section .debug_info,\"\",%s\n.Lcu_start:\n" arch.progbits;
  if v5 then p "\t.4byte .Lcu_end-.Lcu_start-4\n\t.2byte 5\n\t.byte 1\n\t.byte 8\n\t.4byte .Labbrev\n"   (* DW_UT_compile *)
  else p "\t.4byte .Lcu_end-.Lcu_start-4\n\t.2byte 4\n\t.4byte .Labbrev\n\t.byte 8\n";
  (* short strings keep the base types' offsets below 128 (see Encode) *)
  p "\t.uleb128 1\n\t.asciz \"dwexpr\"\n\t.byte 0x0c\n\t.asciz \"dwexpr.c\"\n\t.8byte _start\n\t.8byte .Lend_start-_start\n";
  if v5 then p "\t.4byte .Laddr_base\n";
  List.iter (fun (sym, size, enc) -> p "%s:\n\t.uleb128 2\n\t.asciz \"%s\"\n\t.byte 0x%02x\n\t.byte %d\n" sym (String.sub sym 2 (String.length sym - 2)) enc size) base_types;
  List.iter (fun k ->
      let fstart = func_start k in
      if k.fk_loclist then
        p "\t.uleb128 6\n\t.asciz \"%s\"\n\t.8byte %s\n\t.8byte %s-%s\n\t.4byte .Lloc_fb_%s\n" k.fk_func fstart (func_end k) fstart k.fk_func
      else begin
        p "\t.uleb128 3\n\t.asciz \"%s\"\n\t.8byte %s\n\t.8byte %s-%s\n\t.uleb128 .Lfb_%s_end-.Lfb_%s_start\n.Lfb_%s_start:\n" k.fk_func fstart (func_end k) fstart k.fk_func k.fk_func k.fk_func;
        List.iter (fun d -> p "%s\n" d) (bytes_of k.fk_base);
        p ".Lfb_%s_end:\n" k.fk_func
      end;
      List.iter (fun ((n : Expr.named), directives) ->
          if n.fb = k.fk_name then begin
            match n.loc with
            | Expr.Exprloc ->
              p "\t.uleb128 4\n\t.asciz \"%s\"\n\t.4byte T_ul-.Lcu_start\n\t.uleb128 .L%s_end-.L%s_start\n.L%s_start:\n" n.var n.var n.var n.var;
              List.iter (fun d -> p "%s\n" d) directives;
              p ".L%s_end:\n" n.var
            | _ ->
              p "\t.uleb128 5\n\t.asciz \"%s\"\n\t.4byte T_ul-.Lcu_start\n\t.4byte .Lloc_%s\n" n.var n.var
          end) vars;
      p "\t.byte 0\n") kinds;
  p "\t.byte 0\n.Lcu_end:\n";
  (* the location lists *)
  let loclist = if v5 then loclist5 else loclist in
  if v5 then p "\n\t.section .debug_loclists,\"\",%s\n.Lloclists_start:\n\t.4byte .Lloclists_end-.Lloclists_start-4\n\t.2byte 5\n\t.byte 8\n\t.byte 0\n\t.4byte 0\n" arch.progbits
  else p "\n\t.section .debug_loc,\"\",%s\n" arch.progbits;
  List.iter (fun k ->
      if k.fk_loclist then begin
        let decoy = String.concat "\n" (bytes_of [op1 (Printf.sprintf "DW_OP_breg%d" arch.cfa_reg) 0]) in
        loclist b ~name:("fb_" ^ k.fk_func) ~with_base:false k (bytes_of k.fk_base) decoy decoy
      end;
      List.iter (fun ((n : Expr.named), directives) ->
          if n.fb = k.fk_name && n.loc <> Expr.Exprloc then
            loclist b ~name:n.var ~with_base:(n.loc = Expr.LoclistBase) k directives
              (String.concat "\n" (bytes_of [op0 "DW_OP_lit1"])) (String.concat "\n" (bytes_of [op0 "DW_OP_lit2"]))) vars) kinds;
  if v5 then p ".Lloclists_end:\n";
  (* the address table: index 0 dw_mem, 1 dw_mem+16, 2 _start *)
  if v5 then p "\n\t.section .debug_addr,\"\",%s\n.Laddr_start:\n\t.4byte .Laddr_end-.Laddr_start-4\n\t.2byte 5\n\t.byte 8\n\t.byte 0\n.Laddr_base:\n\t.8byte dw_mem\n\t.8byte dw_mem+16\n\t.8byte _start\n.Laddr_end:\n" arch.progbits;
  Buffer.contents b
