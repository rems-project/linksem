(* Claude: from textual expressions to linksem [Dwarf.operation]s, to bytes (via the
   Lem encoder in dwarf_expr_encode.lem), and to assembler directives. *)

let en = Endianness.Little
let cuh = Dwarf_expr_encode.cuh_dwarf4_addr8
let c : Dwarf.p_context = { Dwarf.endianness = en }

let get = function Error.Success x -> x | Error.Fail m -> failwith m
let num = Sym_ocaml.Num.of_num

let arg_types name =
  match Dwarf_expr_encode.operation_encoding_of_name name with
  | Some (_, oats, _) -> oats
  | None -> failwith ("unknown DWARF operation " ^ name)

let is_signed = function
  | Dwarf.OAT_sint8 | OAT_sint16 | OAT_sint32 | OAT_sint64 | OAT_SLEB128 -> true
  | _ -> false

let oav oat ~resolve (a : Expr.arg) : Dwarf.operation_argument_value =
  match oat, a with
  | (Dwarf.OAT_block | Dwarf.OAT_block1), Expr.Block bs ->
    Dwarf.OAV_block (num (Z.of_int (List.length bs)), Dwarf.sym_byte_sequence_of_byte_list (List.map Char.chr bs))
  | _, Expr.Block _ -> failwith "block argument given to a non-block operand"
  | _, Expr.Int i -> if is_signed oat then Dwarf.OAV_integer (num i) else Dwarf.OAV_natural (num i)
  | _, Expr.Sym (s, off) ->
    let v = Z.add (resolve s) (Z.of_int off) in
    if is_signed oat then Dwarf.OAV_integer (num v) else Dwarf.OAV_natural (num v)

(* the linksem operation for one textual operation *)
let operation ~resolve (op : Expr.op) : Dwarf.operation =
  let oats = arg_types op.name in
  if List.length oats <> List.length op.args then
    failwith (Printf.sprintf "%s takes %d operand(s), given %d" op.name (List.length oats) (List.length op.args));
  get (Dwarf_expr_encode.operation_of_name op.name (List.map2 (fun oat a -> oav oat ~resolve a) oats op.args))

let bytes_of_operation (o : Dwarf.operation) : int list =
  List.map Char.code (get (Dwarf_expr_encode.encode_operation en cuh o))

let is_branch name = name = "DW_OP_bra" || name = "DW_OP_skip"

(* the linksem operations of an expression, with symbols resolved by [resolve] and
   branch operands converted from operation counts to byte offsets *)
let operations ~resolve (e : Expr.t) : Dwarf.operation list =
  let ops = Array.of_list e in
  let n = Array.length ops in
  let sizes = Array.map (fun (op : Expr.op) ->
      if is_branch op.name then 3 else List.length (bytes_of_operation (operation ~resolve op))) ops in
  let sum lo hi = let s = ref 0 in for j = lo to hi do s := !s + sizes.(j) done; !s in
  Array.to_list (Array.mapi (fun i (op : Expr.op) ->
      if is_branch op.name then begin
        let k = match op.args with [Expr.Int k] -> Z.to_int k | _ -> failwith (op.name ^ " takes one integer operand") in
        if i + k < 0 || i + k >= n then failwith (Printf.sprintf "%s %d at operation %d leaves the expression" op.name k i);
        (* the offset is from the end of the branch operation (3 bytes) to the start of operation i+k *)
        let off = if k >= 0 then sum (i + 1) (i + k) else - (sum (i + k) i) in
        operation ~resolve { op with args = [Expr.Int (Z.of_int off)] }
      end else operation ~resolve op) ops)

let bytes ~resolve e = List.concat_map bytes_of_operation (operations ~resolve e)

let has_sym args = List.exists (function Expr.Sym _ -> true | _ -> false) args

(* Claude: base-type symbols (T_uc .. T_l, see Expr and Dwarf_asm) are ULEB128
   operands whose value is the unit-relative offset of the type's DIE; the assembler
   computes it (.uleb128 T_x-.Lcu_start).  Dwarf_asm keeps those offsets below 128 so
   that the encoding is one byte, as [operations] assumes when it resolves such a
   symbol to a small placeholder for the branch-offset computation. *)
let is_type_sym s = String.length s > 2 && String.sub s 0 2 = "T_"

let placeholder_resolve s = if is_type_sym s then Z.of_int 0x40 else Z.zero

(* the bytes of one operand of the given type, for an operation with a symbolic
   operand elsewhere (the whole-operation encoder cannot be used then) *)
let rec uleb z = let b = Z.to_int (Z.logand z (Z.of_int 0x7f)) and r = Z.shift_right z 7 in
  if Z.equal r Z.zero then [b] else (b lor 0x80) :: uleb r
let rec sleb z =
  let b = Z.to_int (Z.logand z (Z.of_int 0x7f)) and r = Z.shift_right z 7 in
  let sign = b land 0x40 <> 0 in
  if (Z.equal r Z.zero && not sign) || (Z.equal r Z.minus_one && sign) then [b] else (b lor 0x80) :: sleb r
let fixed n z = List.init n (fun i -> Z.to_int (Z.logand (Z.shift_right z (8 * i)) (Z.of_int 0xff)))
let bytes_of_arg (oat : Dwarf.operation_argument_type) (a : Expr.arg) : int list =
  match oat, a with
  | Dwarf.OAT_uint8, Expr.Int z | Dwarf.OAT_sint8, Expr.Int z -> fixed 1 z
  | Dwarf.OAT_uint16, Expr.Int z | Dwarf.OAT_sint16, Expr.Int z -> fixed 2 z
  | Dwarf.OAT_uint32, Expr.Int z | Dwarf.OAT_sint32, Expr.Int z | Dwarf.OAT_dwarf_format_t, Expr.Int z -> fixed 4 z
  | Dwarf.OAT_uint64, Expr.Int z | Dwarf.OAT_sint64, Expr.Int z | Dwarf.OAT_addr, Expr.Int z -> fixed 8 z
  | Dwarf.OAT_ULEB128, Expr.Int z -> uleb z
  | Dwarf.OAT_SLEB128, Expr.Int z -> sleb z
  | Dwarf.OAT_block, Expr.Block bs -> uleb (Z.of_int (List.length bs)) @ bs
  | Dwarf.OAT_block1, Expr.Block bs -> [List.length bs] @ bs
  | _ -> failwith "bytes_of_arg: operand kind and argument do not match"

let opcode name =
  match Dwarf_expr_encode.operation_encoding_of_name name with
  | Some (code, _, _) -> Z.to_int (Sym_ocaml.Num.to_num code)
  | None -> failwith ("unknown DWARF operation " ^ name)

(* assembler directives for an expression; a DW_OP_addr with a symbol operand is left
   to the assembler and linker (.8byte SYM+OFF), a base-type symbol operand becomes
   .uleb128 SYM-.Lcu_start, everything else is encoded here *)
let asm_directives (e : Expr.t) : string list =
  let ops = operations ~resolve:placeholder_resolve e in
  List.map2 (fun (top : Expr.op) o ->
      match top.name, top.args with
      | "DW_OP_addr", [Expr.Sym (s, off)] -> Printf.sprintf "\t.byte 0x03\n\t.8byte %s%+d" s off
      | name, args when has_sym args ->
        let oats = arg_types name in
        String.concat "\n"
          (Printf.sprintf "\t.byte 0x%02x" (opcode name)
           :: List.map2 (fun oat a ->
               match oat, a with
               | Dwarf.OAT_ULEB128, Expr.Sym (s, off) when is_type_sym s -> Printf.sprintf "\t.uleb128 %s%+d-.Lcu_start" s off
               | _, Expr.Sym _ -> failwith (name ^ ": symbol operands are only supported for DW_OP_addr and for base-type (T_*) ULEB128 operands")
               | _ -> "\t.byte " ^ String.concat "," (List.map (Printf.sprintf "0x%02x") (bytes_of_arg oat a))) oats args)
      | _ -> "\t.byte " ^ String.concat "," (List.map (Printf.sprintf "0x%02x") (bytes_of_operation o)))
    e ops

(* does linksem's parser read back exactly what the Lem encoder wrote? *)
let round_trip_ok (e : Expr.t) : bool =
  let resolve s = if is_type_sym s then Z.of_int 0x40 else Z.of_string "0x400000" in
  get (Dwarf_expr_encode.round_trip_ok c cuh (operations ~resolve e))
