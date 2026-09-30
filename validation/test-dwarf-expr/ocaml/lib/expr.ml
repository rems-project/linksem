(* Claude: textual DWARF expressions, one per line:

     NAME[@loclist|@loclist-base][@fb=KIND]: OP [ARG ...]; OP [ARG ...]; ...      # comment

   An ARG is a decimal or 0x-hex integer (possibly negative), a symbol with an
   optional +/- offset (dw_mem+16; only allowed for DW_OP_addr, where the
   assembler resolves it), or a byte block {01,ff} for DW_OP_implicit_value.
   For DW_OP_skip and DW_OP_bra the integer operand counts operations, not
   bytes: k skips the k operations that follow (k < 0 branches back); the byte
   offset is computed when the expression is encoded.

   The annotations on the name say how the expression is attached to the
   variable (see Dwarf_asm):
     @loclist        as a location list (.debug_loc) whose entry at the stop
                     address is the expression, with other entries elsewhere
     @loclist-base   the same, after a base address selection entry
     @fb=KIND        in the function whose DW_AT_frame_base is of that kind:
                     cfa (the default, DW_OP_call_frame_cfa), reg (DW_OP_regN of
                     the frame pointer), breg (DW_OP_bregN 32), expr (a longer
                     expression) or loclist (a location list) *)

type arg = Int of Z.t | Sym of string * int | Block of int list
type op = { name : string; args : arg list }
type t = op list
type loc_kind = Exprloc | Loclist | LoclistBase
type named = { var : string; ops : t; loc : loc_kind; fb : string }

let frame_kinds = ["cfa"; "reg"; "breg"; "expr"; "loclist"]

let string_of_arg = function
  | Int z -> if Z.geq z (Z.of_int 4096) then "0x" ^ Z.format "x" z else Z.to_string z
  | Sym (s, 0) -> s
  | Sym (s, o) -> Printf.sprintf "%s%+d" s o
  | Block bs -> "{" ^ String.concat "," (List.map (Printf.sprintf "%02x") bs) ^ "}"

let string_of_op op = String.concat " " (op.name :: List.map string_of_arg op.args)
let to_string ops = String.concat "; " (List.map string_of_op ops)

let annotations n =
  (match n.loc with Exprloc -> "" | Loclist -> "@loclist" | LoclistBase -> "@loclist-base")
  ^ (if n.fb = "cfa" then "" else "@fb=" ^ n.fb)

let string_of_named n = n.var ^ annotations n ^ ": " ^ to_string n.ops

let is_ident_start c = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c = '_' || c = '.'

let parse_arg s =
  let n = String.length s in
  if n >= 2 && s.[0] = '{' && s.[n - 1] = '}' then
    Block (List.filter_map (fun h -> if h = "" then None else Some (int_of_string ("0x" ^ h)))
             (String.split_on_char ',' (String.sub s 1 (n - 2))))
  else if is_ident_start s.[0] then
    (* symbol, optionally followed by +k or -k *)
    let rec find i = if i >= n then None else if s.[i] = '+' || s.[i] = '-' then Some i else find (i + 1) in
    match find 1 with
    | None -> Sym (s, 0)
    | Some i -> Sym (String.sub s 0 i, int_of_string (String.sub s i (n - i)))
  else Int (Z.of_string s)

let parse_op s =
  match List.filter (( <> ) "") (String.split_on_char ' ' (String.trim s)) with
  | [] -> None
  | name :: args -> Some { name; args = List.map parse_arg args }

let strip_comment line = match String.index_opt line '#' with Some i -> String.sub line 0 i | None -> line

(* "v12@loclist@fb=reg" -> the variable name and its annotations *)
let parse_name s =
  match String.split_on_char '@' (String.trim s) with
  | [] -> failwith "empty variable name"
  | var :: anns ->
    List.fold_left (fun n a ->
        match a with
        | "loclist" -> { n with loc = Loclist }
        | "loclist-base" -> { n with loc = LoclistBase }
        | _ when String.length a > 3 && String.sub a 0 3 = "fb=" ->
          let k = String.sub a 3 (String.length a - 3) in
          if not (List.mem k frame_kinds) then failwith ("unknown frame-base kind " ^ k);
          { n with fb = k }
        | _ -> failwith ("unknown annotation @" ^ a ^ " on " ^ var))
      { var; ops = []; loc = Exprloc; fb = "cfa" } anns

let parse_line line =
  let line = String.trim (strip_comment line) in
  if line = "" then None
  else
    match String.index_opt line ':' with
    | None -> failwith ("expression line without NAME: " ^ line)
    | Some i ->
      let n = parse_name (String.sub line 0 i) in
      let body = String.sub line (i + 1) (String.length line - i - 1) in
      Some { n with ops = List.filter_map parse_op (String.split_on_char ';' body) }

let read_file path =
  let ic = open_in path in
  let rec go acc = match input_line ic with
    | l -> go (match parse_line l with Some n -> n :: acc | None -> acc)
    | exception End_of_file -> close_in ic; List.rev acc in
  go []

let write_file path (ns : named list) =
  let oc = open_out path in
  List.iter (fun n -> output_string oc (string_of_named n ^ "\n")) ns;
  close_out oc
