(* Claude: dwexpr_build ARCH EXPRS.txt OUT.s STATE.txt
   Turns a file of textual expressions into the assembler source of the test program
   and the evaluation-state file.  Every expression is first checked to survive the
   round trip through the Lem encoder and linksem's parser. *)
open Dwexpr

let () =
  match Array.to_list Sys.argv with
  | [_; arch; exprs; out_s; out_state] ->
    let arch = Arch.of_name arch in
    let named = Expr.read_file exprs in
    let version = Expr.dwarf_version_of_file exprs in
    let bad = List.filter (fun (n : Expr.named) ->
        try not (Encode.round_trip_ok n.ops) with Failure m -> prerr_endline (n.var ^ ": " ^ m); true) named in
    if bad <> [] then begin
      List.iter (fun (n : Expr.named) -> prerr_endline ("round trip failed: " ^ Expr.string_of_named n)) bad;
      exit 1
    end;
    let vars = List.map (fun (n : Expr.named) -> (n, Encode.asm_directives n.ops)) named in
    let oc = open_out out_s in
    output_string oc (Dwarf_asm.emit arch ~version vars);
    close_out oc;
    State.write out_state (State.of_arch arch (List.map (fun (k : Dwarf_asm.frame_kind) -> (k.fk_func, k.fk_label)) (Dwarf_asm.frame_kinds arch)));
    Printf.printf "%d expressions (DWARF %d), all round-trip through linksem's parser; wrote %s and %s\n" (List.length named) version out_s out_state
  | _ -> prerr_endline "usage: dwexpr_build ARCH EXPRS.txt OUT.s STATE.txt"; exit 2
