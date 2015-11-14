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

definition fixed_program :: "instruction list" where
  "fixed_program \<equiv>
    [
      mov_constant_to_mem (5 :: 64 word) (100 :: 64 word)
    , mov_constant_from_mem (100 :: 64 word)
    ]"

definition relocatable_program :: "8 word list" where
  "relocatable_program \<equiv>
     List.concat (List.map encode [
       mov_constant_to_mem (5 :: 64 word) (0 :: 64 word)
     , mov_constant_from_mem (0 :: 64 word)
     ])"

definition relocation_image :: "Abis.any_abi_feature annotated_memory_image" where
  "relocation_image \<equiv> img1 relocatable_program"

fun run_program :: "instruction list \<Rightarrow> X64_state \<Rightarrow> X64_state" where
  "run_program [] \<sigma> = \<sigma>" |
  "run_program (x#xs) \<sigma> =
     (let (_, \<sigma>') = Run x \<sigma> in
       run_program xs \<sigma>')"

fun load_image :: "8 word list \<Rightarrow> X64_state" where
  "load_image instrs = undefined"

(* Theorem statement is something like:
 *
 * let ef = elf64_file_of_memory_image relocation_image in
 * let im = obtain_executable_image ef in
 * let \<sigma>0 = load_image im in
 *   run_program fixed_program empty_state \<simeq> execute_two_steps \<sigma>0
 *)

end