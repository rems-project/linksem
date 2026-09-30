(* Claude: dwexpr_gen ARCH N SEED [MAXOPS] [--frames] [--typed] > EXPRS.txt
   Generates N random well-formed DWARF 4 expressions of up to MAXOPS operations
   (default 8), named v0..v(N-1), tracking the stack (each entry's type: the generic
   type or a base type) so that every operation finds its operands and binary
   operations see operands of one type.  With --frames, each variable also gets
   random location and frame-base annotations (@loclist, @loclist-base, @fb=KIND;
   see Expr), drawn from a second generator so that the expressions themselves are
   those of the run without --frames.  With --typed the file is a DWARF 5 one
   ("# dwarf 5") and the expressions also use the DWARF 5 operations: DW_OP_addrx,
   DW_OP_constx, DW_OP_const_type, DW_OP_regval_type, DW_OP_deref_type,
   DW_OP_convert and DW_OP_reinterpret on the base types T_uc .. T_l of Dwarf_asm;
   a typed value left on top is usually converted back to the generic type first,
   but one in eight expressions ends with a typed value, to see what the debuggers
   make of it.  Memory is only dereferenced inside dw_mem, so all three evaluators
   see the same bytes.  Some expressions are whole register locations (DW_OP_regN,
   DW_OP_regx), some end in DW_OP_stack_value; the rest denote memory addresses.
   The operand values are biased towards boundary values. *)
open Dwexpr

let z = Z.of_string
let int_arg i = Expr.Int (Z.of_int i)
let op name args : Expr.op = { Expr.name; args }
let op0 name = op name []

(* interesting constants *)
let edge_values = [ "0"; "1"; "2"; "3"; "7"; "8"; "15"; "16"; "31"; "32"; "33"; "63"; "64"; "65"; "127"; "128"; "255"; "256";
                    "0x7fffffffffffffff"; "0x8000000000000000"; "0xffffffffffffffff"; "0xfffffffffffffffe"; "0xfffffffffffffff0";
                    "0x100000000"; "0xffffffff"; "0x80000000"; "0x7fffffff" ]

let pick l = List.nth l (Random.int (List.length l))

(* an unsigned value of the given bit width, biased to edges *)
let unsigned bits =
  let m = Z.sub (Z.shift_left Z.one bits) Z.one in
  match Random.int 3 with
  | 0 -> Z.logand (z (pick edge_values)) m
  | 1 -> Z.of_int (Random.int 256)
  | _ -> Z.logand (Z.of_int64 (Random.int64 Int64.max_int)) m

(* a signed value of the given bit width *)
let signed bits =
  let half = Z.shift_left Z.one (bits - 1) in
  let u = unsigned bits in
  if Z.geq u half then Z.sub u (Z.shift_left half 1) else u

(* the base types of Dwarf_asm: symbol, size in bytes, signed?; a stack entry's type
   is None (generic) or Some symbol *)
let base_types = [ ("T_ul", 8, false); ("T_l", 8, true); ("T_ui", 4, false); ("T_i", 4, true);
                   ("T_us", 2, false); ("T_s", 2, true); ("T_uc", 1, false); ("T_sc", 1, true) ]
let type_size = function None -> 8 | Some t -> let (_, sz, _) = List.find (fun (n, _, _) -> n = t) base_types in sz
let pick_type () = let (t, _, _) = pick base_types in t
let type_arg = function None -> Expr.Int Z.zero | Some t -> Expr.Sym (t, 0)
let typed = ref false

(* the registers with known values, by DWARF number, and those holding dw_mem addresses *)
let regs (a : Arch.t) = List.map fst a.regs
let mem_regs (a : Arch.t) = List.filter_map (fun (r, v) -> match v with Arch.Mem off -> Some (r, off) | _ -> None) a.regs

(* operations that push one value *)
let gen_push (a : Arch.t) : Expr.op list =
  match Random.int 14 with
  | 0 -> [op0 (Printf.sprintf "DW_OP_lit%d" (Random.int 32))]
  | 1 -> [op "DW_OP_const1u" [Expr.Int (unsigned 8)]]
  | 2 -> [op "DW_OP_const1s" [Expr.Int (signed 8)]]
  | 3 -> [op "DW_OP_const2u" [Expr.Int (unsigned 16)]]
  | 4 -> [op "DW_OP_const2s" [Expr.Int (signed 16)]]
  | 5 -> if Random.bool () then [op "DW_OP_const4u" [Expr.Int (unsigned 32)]] else [op "DW_OP_const8u" [Expr.Int (unsigned 64)]]
  | 6 -> if Random.bool () then [op "DW_OP_const4s" [Expr.Int (signed 32)]] else [op "DW_OP_const8s" [Expr.Int (signed 64)]]
  | 7 -> [op "DW_OP_constu" [Expr.Int (unsigned 64)]]
  | 8 -> [op "DW_OP_consts" [Expr.Int (signed 64)]]
  | 9 -> [op "DW_OP_addr" [Expr.Sym ("dw_mem", Random.int 256)]]
  | 10 -> let r = pick (regs a) in
          if r < 32 && Random.bool () then [op (Printf.sprintf "DW_OP_breg%d" r) [int_arg (Random.int 512 - 256)]]
          else [op "DW_OP_bregx" [int_arg r; int_arg (Random.int 512 - 256)]]
  | 11 -> [op "DW_OP_fbreg" [int_arg (Random.int 512 - 256)]]
  | 12 -> [op0 "DW_OP_call_frame_cfa"]
  | _ ->
    (* a load from dw_mem: address then deref, or deref_size *)
    let size = if Random.bool () then 8 else 1 + Random.int 8 in
    let k = Random.int (256 - size + 1) in
    let addr =
      if Random.bool () then op "DW_OP_addr" [Expr.Sym ("dw_mem", k)]
      else let (r, off) = pick (mem_regs a) in
        if r < 32 && Random.bool () then op (Printf.sprintf "DW_OP_breg%d" r) [int_arg (k - off)]
        else op "DW_OP_bregx" [int_arg r; int_arg (k - off)] in
    if size = 8 && Random.bool () then [addr; op0 "DW_OP_deref"] else [addr; op "DW_OP_deref_size" [int_arg size]]

let unary_ops = ["DW_OP_abs"; "DW_OP_neg"; "DW_OP_not"]
let binary_ops = ["DW_OP_and"; "DW_OP_or"; "DW_OP_xor"; "DW_OP_plus"; "DW_OP_minus"; "DW_OP_mul"; "DW_OP_div"; "DW_OP_mod";
                  "DW_OP_shl"; "DW_OP_shr"; "DW_OP_shra"; "DW_OP_eq"; "DW_OP_ge"; "DW_OP_gt"; "DW_OP_le"; "DW_OP_lt"; "DW_OP_ne"]

(* the typed operations that push one typed value *)
let gen_typed_push (a : Arch.t) : Expr.op list * string option =
  let t = pick_type () in
  let sz = type_size (Some t) in
  match Random.int 3 with
  | 0 -> ([op "DW_OP_const_type" [type_arg (Some t); Expr.Block (List.init sz (fun _ -> Random.int 256))]], Some t)
  | 1 -> ([op "DW_OP_regval_type" [int_arg (pick (regs a)); type_arg (Some t)]], Some t)
  | _ ->
    let k = Random.int (256 - sz + 1) in
    ([op "DW_OP_addr" [Expr.Sym ("dw_mem", k)]; op "DW_OP_deref_type" [int_arg sz; type_arg (Some t)]], Some t)

(* one step: operations to append and the new stack of types (top first) *)
let gen_step (a : Arch.t) (stack : string option list) : Expr.op list * string option list =
  let depth = List.length stack in
  let choices = ref [] in
  let add w f = choices := (w, f) :: !choices in
  let top () = List.hd stack and rest () = List.tl stack in
  add 5 (fun () -> (gen_push a, None :: stack));
  if !typed then begin
    add 3 (fun () -> let (ops, t) = gen_typed_push a in (ops, t :: stack));
    (* not DW_OP_constx: gdb 15 does not implement it ("Unhandled DWARF expression
       opcode 0xa2"), so it would only add noise here; tests/typed.txt has it *)
    add 1 (fun () -> ([op "DW_OP_addrx" [int_arg (Random.int 3)]], None :: stack))
  end;
  if depth >= 1 then begin
    add 3 (fun () -> ([op0 (pick unary_ops)], stack));
    add 1 (fun () -> ([op "DW_OP_plus_uconst" [Expr.Int (unsigned (if Random.bool () then 8 else 64))]], stack));
    add 1 (fun () -> ([op0 "DW_OP_dup"], top () :: stack));
    add 1 (fun () -> ([op0 "DW_OP_drop"], rest ()));
    add 1 (fun () -> let i = Random.int depth in ([op "DW_OP_pick" [int_arg i]], List.nth stack i :: stack));
    add 1 (fun () -> ([op0 "DW_OP_nop"], stack));
    add 1 (fun () -> ([op "DW_OP_skip" [int_arg 1]; op0 (pick unary_ops)], stack));   (* the unary is skipped *)
    if !typed then begin
      add 3 (fun () -> let t = if Random.int 4 = 0 then None else Some (pick_type ()) in ([op "DW_OP_convert" [type_arg t]], t :: rest ()));
      add 1 (fun () ->
          (* reinterpretation needs a type of the same size *)
          let sz = type_size (top ()) in
          let same = List.filter (fun (_, s, _) -> s = sz) base_types in
          let t = if sz = 8 && Random.bool () then None else Some (let (n, _, _) = pick same in n) in
          ([op "DW_OP_reinterpret" [type_arg t]], t :: rest ()))
    end
  end;
  if depth >= 2 then begin
    let t1 = List.hd stack and t2 = List.nth stack 1 in
    (* a binary operation needs operands of one type: convert the top to the second's *)
    let unify = if t1 = t2 then [] else [op "DW_OP_convert" [type_arg t2]] in
    add 6 (fun () -> let o = pick binary_ops in
            let result = if List.mem o ["DW_OP_eq"; "DW_OP_ge"; "DW_OP_gt"; "DW_OP_le"; "DW_OP_lt"; "DW_OP_ne"] then None else t2 in
            (unify @ [op0 o], result :: List.tl (List.tl stack)));
    add 1 (fun () -> ([op0 "DW_OP_over"], t2 :: stack));
    add 1 (fun () -> ([op0 "DW_OP_swap"], t2 :: t1 :: List.tl (List.tl stack)));
    add 1 (fun () -> ([op "DW_OP_bra" [int_arg 1]; op0 (pick unary_ops)], List.tl stack)); (* condition popped; the unary is conditional *)
  end;
  if depth >= 3 then add 1 (fun () -> match stack with t1 :: t2 :: t3 :: r -> ([op0 "DW_OP_rot"], t2 :: t3 :: t1 :: r) | _ -> assert false);
  let total = List.fold_left (fun s (w, _) -> s + w) 0 !choices in
  let rec choose n = function
    | [] -> assert false
    | [(_, f)] -> f ()
    | (w, f) :: rest -> if n < w then f () else choose (n - w) rest in
  choose (Random.int total) !choices

let gen_expr (a : Arch.t) maxops : Expr.t =
  match Random.int 20 with
  | 0 -> [op0 (Printf.sprintf "DW_OP_reg%d" (pick (List.filter (fun r -> r < 32) (regs a))))]
  | 1 -> [op "DW_OP_regx" [int_arg (pick (regs a))]]
  | _ ->
    let n = 1 + Random.int maxops in
    let rec go acc stack count =
      if count >= n then (acc, stack)
      else let (ops, stack') = gen_step a stack in go (acc @ ops) stack' (count + List.length ops) in
    let (ops, stack) = go [] [] 0 in
    let (ops, stack) = if stack = [] then (ops @ gen_push a, [None]) else (ops, stack) in
    (* a typed result is usually converted back to the generic type *)
    let ops = if List.hd stack <> None && Random.int 8 <> 0 then ops @ [op "DW_OP_convert" [type_arg None]] else ops in
    if Random.int 4 = 0 then ops @ [op0 "DW_OP_stack_value"] else ops

let () =
  match Array.to_list Sys.argv with
  | _ :: arch :: n :: seed :: rest ->
    let a = Arch.of_name arch in
    let frames = List.mem "--frames" rest in
    typed := List.mem "--typed" rest;
    let maxops = match List.filter (fun x -> x <> "--frames" && x <> "--typed") rest with [m] -> int_of_string m | _ -> 8 in
    Random.init (int_of_string seed);
    let ann = Random.State.make [| int_of_string seed; 1 |] in
    Printf.printf "# Claude: %s random DWARF expressions for %s, seed %s, up to %d operations%s%s (dwexpr_gen)\n" n arch seed maxops
      (if frames then ", with location-list and frame-base annotations" else "") (if !typed then ", with the DWARF 5 typed and indexed operations" else "");
    if !typed then print_endline "# dwarf 5";
    for i = 0 to int_of_string n - 1 do
      let ops = gen_expr a maxops in
      let loc, fb =
        if not frames then (Expr.Exprloc, "cfa")
        else ((match Random.State.int ann 10 with 0 | 1 -> Expr.Loclist | 2 -> Expr.LoclistBase | _ -> Expr.Exprloc),
              List.nth Expr.frame_kinds (Random.State.int ann (List.length Expr.frame_kinds))) in
      print_endline (Expr.string_of_named { Expr.var = Printf.sprintf "v%d" i; ops; loc; fb })
    done
  | _ -> prerr_endline "usage: dwexpr_gen ARCH N SEED [MAXOPS] [--frames] [--typed]"; exit 2
