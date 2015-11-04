theory
  RelocationProof
imports
  Labelled_X64
  X64
  Main
begin

type_synonym labelled_program = "(string option \<times> Labelled_X64.instruction) list"
type_synonym program = "X64.instruction list"

fun compute_label_offsets :: "nat \<Rightarrow> labelled_program \<Rightarrow> (string \<rightharpoonup> nat)" where
  "compute_label_offsets start [] = (\<lambda>x. None)" |
  "compute_label_offsets start ((None, i)#xs) = compute_label_offsets (Suc start) xs" |
  "compute_label_offsets start ((Some l, i)#xs) =
     Map.map_add (\<lambda>x. if x = l then Some start else None) (compute_label_offsets (Suc start) xs)"

fun assemble' :: "labelled_program \<Rightarrow> (string \<rightharpoonup> nat) \<Rightarrow> program" where

end