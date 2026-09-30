(* Claude: dwexpr_eval PROG STATE.txt EXPRS.txt
   Evaluates the DW_AT_location of each variable named in EXPRS.txt, in the linked
   program PROG, with linksem's DWARF expression interpreter (Dwarf.evaluate_location_description),
   in the register state of STATE.txt at the stop label of the variable's function,
   reading memory from the ELF image.  Prints one line per variable:

     v3 = addr 0x4010a0       a memory location
     v4 = reg 5               a register location
     v5 = value 0x10          an implicit value (DW_OP_stack_value / DW_OP_implicit_value; a
                              value shorter than 8 bytes is zero-extended, as gdb reads it)
     v6 = composite ...       a composite location
     v7 = error: MESSAGE      evaluation failed (linksem's message) *)
open Dwexpr

let get = function Error.Success x -> x | Error.Fail m -> failwith m
let z_of_sym = Sym_ocaml.Num.to_num
let sym_of_z = Sym_ocaml.Num.of_num

type sec = { s_addr : Z.t; s_size : Z.t; s_bytes : string }

let () =
  match Array.to_list Sys.argv with
  | [_; prog; state_path; exprs_path] ->
    let f = get (Error.bind (Byte_sequence.acquire prog) Elf_file.read_elf64_file) in
    (* symbols by name *)
    let (tab, strtab) = get (Elf_file.get_elf64_file_symbol_table f) in
    let syms = List.filter_map (fun (e : Elf_symbol_table.elf64_symbol_table_entry) ->
        let name = get (String_table.get_string_at (Uint32_wrapper.to_bigint e.elf64_st_name) strtab) in
        if name = "" then None else Some (name, Ml_bindings.nat_big_num_of_uint64 e.elf64_st_value)) tab in
    let sym name = match List.assoc_opt name syms with Some v -> v | None -> failwith ("no symbol " ^ name) in
    (* memory: the allocated PROGBITS sections of the image *)
    let secs = List.filter_map (fun (s : Elf_interpreted_section.elf64_interpreted_section) ->
        let flag = Z.logand s.elf64_section_flags Elf_section_header_table.shf_alloc in
        if Z.equal flag Elf_section_header_table.shf_alloc && not (Z.equal s.elf64_section_type Elf_section_header_table.sht_nobits)
        then Some { s_addr = s.elf64_section_addr; s_size = s.elf64_section_size; s_bytes = Byte_sequence_wrapper.to_string s.elf64_section_body }
        else None) f.elf64_file_interpreted_sections in
    let read_memory a n =
      let a = z_of_sym a and n = Z.to_int (z_of_sym n) in
      match List.find_opt (fun s -> Z.geq a s.s_addr && Z.leq (Z.add a (Z.of_int n)) (Z.add s.s_addr s.s_size)) secs with
      | None -> Dwarf.MRR_bad_address
      | Some s ->
        let off = Z.to_int (Z.sub a s.s_addr) in
        let v = ref Z.zero in
        for i = n - 1 downto 0 do v := Z.add (Z.shift_left !v 8) (Z.of_int (Char.code s.s_bytes.[off + i])) done;
        Dwarf.MRR_result (sym_of_z !v) in
    (* registers, from the state file *)
    let st = State.read state_path in
    let regs = List.map (fun (r, v) -> (r, match v with Arch.Const c -> c | Arch.Mem off -> Z.add (sym "dw_mem") (Z.of_int off))) st.regs in
    let read_register r =
      match List.assoc_opt (Z.to_int (z_of_sym r)) regs with
      | Some v -> Dwarf.RRR_result (sym_of_z v)
      | None -> Dwarf.RRR_bad_register_number in
    let ev : Dwarf.evaluation_context = { Dwarf.read_register; read_memory } in
    (* the pc for a variable is the stop label of the subprogram it belongs to *)
    let tag_subprogram = Dwarf.tag_encode "DW_TAG_subprogram" in
    let pc_of_parents d (cu : Dwarf.compilation_unit) (parents : Dwarf.die list) =
      let str = Dwarf.unit_context_of_cu d cu in
      let func = List.find_map (fun (die : Dwarf.die) ->
          if Sym_ocaml.Num.to_num die.die_abbreviation_declaration.ad_tag = Sym_ocaml.Num.to_num tag_subprogram
          then Dwarf.find_name_of_die str die else None) parents in
      let label = match func with
        | Some f -> (match List.assoc_opt f st.stops with Some l -> l | None -> failwith ("no stop label for function " ^ f))
        | None -> st.pc in
      sym_of_z (sym label) in
    (* the DWARF *)
    let d = match Dwarf.extract_dwarf (Elf_file.ELF_File_64 f) Abi_aarch64_symbolic_relocation.aarch64_data_relocation_interpreter with
      | Some d -> d | None -> failwith "extract_dwarf failed" in
    let efi = Dwarf.evaluate_frame_info d in
    let c = Dwarf.p_context_of_d d in
    let hex z = "0x" ^ Z.format "x" z in
    let render_simple = function
      | Dwarf.SL_memory_address a -> "addr " ^ hex (z_of_sym a)
      | Dwarf.SL_register r -> "reg " ^ Z.to_string (z_of_sym r)
      | Dwarf.SL_implicit bs ->
        let bl = Dwarf_byte_sequence.byte_list_of_sym_byte_sequence bs in
        let v = List.fold_right (fun b acc -> Z.add (Z.shift_left acc 8) (Z.of_int (Char.code b))) bl Z.zero in
        (* Claude: a value shorter than the 8-byte variable is its low-order bytes,
           zero-filled above, which is how gdb reads such a DW_OP_implicit_value or a
           DWARF 5 typed DW_OP_stack_value; a longer one is shown as bytes *)
        if List.length bl <= 8 then "value " ^ hex v
        else "implicit {" ^ String.concat "," (List.map (fun b -> Printf.sprintf "%02x" (Char.code b)) bl) ^ "}"
      | Dwarf.SL_empty -> "empty" in
    let render = function
      | Dwarf.SL_simple s -> render_simple s
      | Dwarf.SL_composite ps ->
        "composite " ^ String.concat " " (List.map (function
            | Dwarf.CLP_piece (n, s) -> Printf.sprintf "piece(%s,%s)" (Z.to_string (z_of_sym n)) (render_simple s)
            | Dwarf.CLP_bit_piece (n, o, s) -> Printf.sprintf "bit_piece(%s,%s,%s)" (Z.to_string (z_of_sym n)) (Z.to_string (z_of_sym o)) (render_simple s)) ps) in
    let named = Expr.read_file exprs_path in
    (* Claude: the variables' DIEs, indexed by name once (a search per variable was
       quadratic in the number of expressions) *)
    let by_name = Hashtbl.create 1024 in
    List.iter (fun ((cu, _, die) as cupdie) ->
        match Dwarf.find_name_of_die (Dwarf.unit_context_of_cu d cu) die with
        | Some name -> if not (Hashtbl.mem by_name name) then Hashtbl.add by_name name cupdie
        | None -> ())
      (Dwarf.find_dies (fun die -> Dwarf.find_attribute_value "DW_AT_location" die <> None) d);
    List.iter (fun (n : Expr.named) ->
        let result =
          match Hashtbl.find_opt by_name n.var with
          | None -> "error: no DIE named " ^ n.var
          | Some (cu, parents, die) ->
            let ac = Dwarf.arithmetic_context_of_cuh cu.cu_header in
            let str = Dwarf.unit_context_of_cu d cu in
            let mfbloc = Dwarf.closest_enclosing_frame_base parents in
            match Dwarf.find_attribute_value "DW_AT_location" die with
            | None -> "error: no DW_AT_location"
            | Some loc ->
              (try match Dwarf.evaluate_location_description c str efi cu.cu_header ac ev mfbloc (pc_of_parents d cu parents) loc with
                 | Error.Success sl -> render sl
                 | Error.Fail m -> "error: " ^ m
               with Failure m -> "error: exception " ^ m
                  | e -> "error: exception " ^ Printexc.to_string e) in
        Printf.printf "%s = %s\n" n.var result) named
  | _ -> prerr_endline "usage: dwexpr_eval PROG STATE.txt EXPRS.txt"; exit 2
