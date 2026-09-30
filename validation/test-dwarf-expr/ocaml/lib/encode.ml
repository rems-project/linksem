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
  | Dwarf.OAT_block, Expr.Block bs ->
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

(* assembler directives for an expression; a DW_OP_addr with a symbol operand is left
   to the assembler and linker (.8byte SYM+OFF), everything else is encoded here *)
let asm_directives (e : Expr.t) : string list =
  let resolve _ = Z.zero in
  let ops = operations ~resolve e in
  List.map2 (fun (top : Expr.op) o ->
      match top.name, top.args with
      | "DW_OP_addr", [Expr.Sym (s, off)] -> Printf.sprintf "\t.byte 0x03\n\t.8byte %s%+d" s off
      | _, args when has_sym args -> failwith (top.name ^ ": symbol operands are only supported for DW_OP_addr")
      | _ -> "\t.byte " ^ String.concat "," (List.map (Printf.sprintf "0x%02x") (bytes_of_operation o)))
    e ops

(* does linksem's parser read back exactly what the Lem encoder wrote? *)
let round_trip_ok (e : Expr.t) : bool =
  let resolve _ = Z.of_string "0x400000" in
  get (Dwarf_expr_encode.round_trip_ok c cuh (operations ~resolve e))
