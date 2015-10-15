theory
  ELF_Relocation_Proof
imports
  Main
  (* X86 model imports *)
  "x86-64_model/L3_Theory"
  "x86-64_model/X64"
  (* ELF model imports *)
  "../auto_generated/isabelle/Elf_relocation"
  "../auto_generated/isabelle/Abi_amd64_relocation"
begin

fun apply_relocation :: "elf64_relocation_a \<Rightarrow> 8 word list \<Rightarrow> 8 word list error" where
  "apply_relocation reloc strm =
     case "

end