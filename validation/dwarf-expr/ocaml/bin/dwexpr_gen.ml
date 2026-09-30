(* Claude: dwexpr_gen ARCH N SEED [MAXOPS] [--frames] > EXPRS.txt
   Generates N random well-formed DWARF 4 expressions of up to MAXOPS operations
   (default 8), named v0..v(N-1), tracking the stack depth so that every operation
   finds its operands.  With --frames, each variable also gets random location
   and frame-base annotations (@loclist, @loclist-base, @fb=KIND; see Expr), drawn
   from a second generator so that the expressions themselves are those of the run
   without --frames.  Memory is only dereferenced inside dw_mem, so all three
   evaluators see the same bytes.  Some expressions are whole register locations
   (DW_OP_regN, DW_OP_regx), some end in DW_OP_stack_value; the rest denote memory
   addresses.  The operand values are biased towards boundary values. *)
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

(* one step: operations to append and the new depth *)
let gen_step (a : Arch.t) depth : Expr.op list * int =
  let choices = ref [] in
  let add w f = choices := (w, f) :: !choices in
  add 5 (fun () -> (gen_push a, depth + 1));
  if depth >= 1 then begin
    add 3 (fun () -> ([op0 (pick unary_ops)], depth));
    add 1 (fun () -> ([op "DW_OP_plus_uconst" [Expr.Int (unsigned (if Random.bool () then 8 else 64))]], depth));
    add 1 (fun () -> ([op0 "DW_OP_dup"], depth + 1));
    add 1 (fun () -> ([op0 "DW_OP_drop"], depth - 1));
    add 1 (fun () -> ([op "DW_OP_pick" [int_arg (Random.int depth)]], depth + 1));
    add 1 (fun () -> ([op0 "DW_OP_nop"], depth));
    add 1 (fun () -> ([op "DW_OP_skip" [int_arg 1]; op0 (pick unary_ops)], depth));   (* the unary is skipped *)
  end;
  if depth >= 2 then begin
    add 6 (fun () -> ([op0 (pick binary_ops)], depth - 1));
    add 1 (fun () -> ([op0 "DW_OP_over"], depth + 1));
    add 1 (fun () -> ([op0 "DW_OP_swap"], depth));
    add 1 (fun () -> ([op "DW_OP_bra" [int_arg 1]; op0 (pick unary_ops)], depth - 1)); (* condition popped; the unary is conditional *)
  end;
  if depth >= 3 then add 1 (fun () -> ([op0 "DW_OP_rot"], depth));
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
    let rec go acc depth count =
      if count >= n then (acc, depth)
      else let (ops, depth') = gen_step a depth in go (acc @ ops) depth' (count + List.length ops) in
    let (ops, depth) = go [] 0 0 in
    let ops = if depth = 0 then ops @ gen_push a else ops in
    if Random.int 4 = 0 then ops @ [op0 "DW_OP_stack_value"] else ops

let () =
  match Array.to_list Sys.argv with
  | _ :: arch :: n :: seed :: rest ->
    let a = Arch.of_name arch in
    let frames = List.mem "--frames" rest in
    let maxops = match List.filter (( <> ) "--frames") rest with [m] -> int_of_string m | _ -> 8 in
    Random.init (int_of_string seed);
    let ann = Random.State.make [| int_of_string seed; 1 |] in
    Printf.printf "# Claude: %s random DWARF expressions for %s, seed %s, up to %d operations%s (dwexpr_gen)\n" n arch seed maxops (if frames then ", with location-list and frame-base annotations" else "");
    for i = 0 to int_of_string n - 1 do
      let ops = gen_expr a maxops in
      let loc, fb =
        if not frames then (Expr.Exprloc, "cfa")
        else ((match Random.State.int ann 10 with 0 | 1 -> Expr.Loclist | 2 -> Expr.LoclistBase | _ -> Expr.Exprloc),
              List.nth Expr.frame_kinds (Random.State.int ann (List.length Expr.frame_kinds))) in
      print_endline (Expr.string_of_named { Expr.var = Printf.sprintf "v%d" i; ops; loc; fb })
    done
  | _ -> prerr_endline "usage: dwexpr_gen ARCH N SEED [MAXOPS] [--frames]"; exit 2
