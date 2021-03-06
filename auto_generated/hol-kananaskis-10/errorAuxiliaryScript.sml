(*Generated by Lem from error.lem.*)
open HolKernel Parse boolLib bossLib;
open lem_numTheory lem_listTheory lem_basic_classesTheory lem_maybeTheory lem_stringTheory showTheory errorTheory;

val _ = numLib.prefer_num();



open lemLib;
(* val _ = lemLib.run_interactive := true; *)
val _ = new_theory "errorAuxiliary"


(****************************************************)
(*                                                  *)
(* Termination Proofs                               *)
(*                                                  *)
(****************************************************)

(* val gst = Defn.tgoal_no_defn (repeatM''_def, repeatM''_ind) *)
val (repeatM''_rw, repeatM''_ind_rw) =
  Defn.tprove_no_defn ((repeatM''_def, repeatM''_ind),
    cheat (* the termination proof *)
  )
val repeatM''_rw = save_thm ("repeatM''_rw", repeatM''_rw);
val repeatM''_ind_rw = save_thm ("repeatM''_ind_rw", repeatM''_ind_rw);


(* val gst = Defn.tgoal_no_defn (repeatM'_def, repeatM'_ind) *)
val (repeatM'_rw, repeatM'_ind_rw) =
  Defn.tprove_no_defn ((repeatM'_def, repeatM'_ind),
    cheat (* the termination proof *)
  )
val repeatM'_rw = save_thm ("repeatM'_rw", repeatM'_rw);
val repeatM'_ind_rw = save_thm ("repeatM'_ind_rw", repeatM'_ind_rw);


(* val gst = Defn.tgoal_no_defn (mapM'_def, mapM'_ind) *)
val (mapM'_rw, mapM'_ind_rw) =
  Defn.tprove_no_defn ((mapM'_def, mapM'_ind),
    cheat (* the termination proof *)
  )
val mapM'_rw = save_thm ("mapM'_rw", mapM'_rw);
val mapM'_ind_rw = save_thm ("mapM'_ind_rw", mapM'_ind_rw);


(* val gst = Defn.tgoal_no_defn (foldM_def, foldM_ind) *)
val (foldM_rw, foldM_ind_rw) =
  Defn.tprove_no_defn ((foldM_def, foldM_ind),
    cheat (* the termination proof *)
  )
val foldM_rw = save_thm ("foldM_rw", foldM_rw);
val foldM_ind_rw = save_thm ("foldM_ind_rw", foldM_ind_rw);




val _ = export_theory()

