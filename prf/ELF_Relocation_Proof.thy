theory
  ELF_Relocation_Proof
imports
  Main
  (* X86 model imports *)
  "x86-64_model/L3_Theory"
  "x86-64_model/X64"
  (* ELF model imports *)
  "../auto_generated/isabelle/Import_everything"
  "../auto_generated/isabelle/Termination"
  "../auto_generated/isabelle/Test_image"
begin

definition mov_constant_to_mem :: "64 word \<Rightarrow> 64 word \<Rightarrow> instruction" where
  "mov_constant_to_mem constant addr \<equiv> Zmov (Z_ALWAYS, (Z64, Zrm_i (Zm (None, (ZnoBase, addr)), constant)))"

definition mov_constant_from_mem :: "64 word \<Rightarrow> instruction" where
  "mov_constant_from_mem addr \<equiv> Zmov (Z_ALWAYS, (Z64, Zr_rm (RAX, Zm (None, (ZnoBase, addr)))))"

definition program :: "8 word list" where
  "program \<equiv>
    List.concat (List.map encode [
      mov_constant_to_mem (5 :: 64 word) (100 :: 64 word)
    , mov_constant_from_mem (100 :: 64 word)
    ])"

definition relocation_image :: "Abis.any_abi_feature annotated_memory_image" where
  "relocation_image \<equiv> img1 program"

end