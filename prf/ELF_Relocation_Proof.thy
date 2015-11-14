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

(* record X64_state =
  EFLAGS :: "Zeflags \<Rightarrow> (bool option)"
  MEM :: "64 word \<Rightarrow> 8 word"
  REG :: "Zreg \<Rightarrow> 64 word"
  RIP :: "64 word"
  exception :: exception *)

fun X64_memory_of_elf64_interpreted_segments :: "elf64_interpreted_segment list \<Rightarrow> 64 word \<Rightarrow> 8 word" where
  "X64_memory_of_elf64_interpreted_segments segs addr = undefined"

definition load_image :: "elf64_interpreted_segment list \<Rightarrow> nat \<Rightarrow> X64_state" where
  "load_image segs entry_point \<equiv>
     \<lparr> EFLAGS = \<lambda>x. None (* XXX: or False? *)
     , MEM = X64_memory_of_elf64_interpreted_segments segs
     , REG = \<lambda>x. (0 :: 64 word)
     , RIP = of_nat entry_point
     , exception = NoException \<rparr>"

fun execute_two_steps :: "X64_state \<Rightarrow> X64_state" where
  "execute_two_steps \<sigma> = undefined"

definition initial_state :: "X64_state" where
  "initial_state \<equiv> undefined"

(* Theorem statement is something like:
 *
 * let ef = elf64_file_of_memory_image relocation_image in
 * let im = obtain_executable_image ef in
 * let \<sigma>0 = load_image im in
 *   run_program fixed_program empty_state \<simeq> execute_two_steps \<sigma>0
 *)
theorem at_least_some_relocations_relocate:
    fixes ef :: elf64_file and segs_and_provenance :: "(elf64_interpreted_segment \<times> segment_provenance) list" and entry :: "nat"
            and rstate final_fixed_state final_relocatable_state :: "X64_state"
  assumes "ef = elf64_file_of_elf_memory_image sysv_amd64_std_abi id ''at_least_some_relocations_relocate.out'' relocation_image"
      and "Success (segs_and_provenance, entry, elf_ma_x86_64) = get_elf64_executable_image ef"
      and "rstate = load_image (List.map fst segs_and_provenance) entry"
      and "final_fixed_state = run_program fixed_program initial_state"
      and "final_relocatable_state = execute_two_steps rstate"
    shows "REG final_fixed_state = REG final_relocatable_state" (* XXX: probably want to say something about the contents of memory here, too! *)
using assms

end