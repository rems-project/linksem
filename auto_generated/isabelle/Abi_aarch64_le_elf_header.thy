chapter {* Generated by Lem from abis/aarch64/abi_aarch64_le_elf_header.lem. *}

theory "Abi_aarch64_le_elf_header" 

imports 
 	 Main
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_num" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_list" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_basic_classes" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_bool" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_maybe" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Missing_pervasives" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Endianness" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_types_native_uint" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_header" 

begin 

(** [abi_aarch64_le_elf_header] contains types and definitions relating to ABI
  * specific ELF header functionality for the AArch64 ABI (little-endian).
  *)

(*open import Basic_classes*)
(*open import Bool*)
(*open import List*)
(*open import Num*)
(*open import Maybe*)
(*open import Missing_pervasives*)

(*open import Elf_header*)
(*open import Elf_types_native_uint*)

(*open import Endianness*)

(*val abi_aarch64_le_data_encoding : natural*)
definition abi_aarch64_le_data_encoding  :: " nat "  where 
     " abi_aarch64_le_data_encoding = ( elf_data_2lsb )"


(*val abi_aarch64_le_endianness : endianness*)
definition abi_aarch64_le_endianness  :: " endianness "  where 
     " abi_aarch64_le_endianness = ( Little )"
 (* Must match above *)

(*val abi_aarch64_le_file_class : natural*)
definition abi_aarch64_le_file_class  :: " nat "  where 
     " abi_aarch64_le_file_class = ( elf_class_64 )"


(*val abi_aarch64_le_file_version : natural*)
definition abi_aarch64_le_file_version  :: " nat "  where 
     " abi_aarch64_le_file_version = ( elf_ev_current )"


(*val abi_aarch64_le_page_size_min : natural*)
definition abi_aarch64_le_page_size_min  :: " nat "  where 
     " abi_aarch64_le_page_size_min = (( 4096 :: nat))"


(*val abi_aarch64_le_page_size_max : natural*)
definition abi_aarch64_le_page_size_max  :: " nat "  where 
     " abi_aarch64_le_page_size_max = (( 65536 :: nat))"


(** [is_valid_abi_aarch64_le_machine_architecture m] checks whether the ELF header's
  * machine architecture is valid according to the ABI-specific specification.
  * Machine architecture must be AArch64 (pg 60)
  *)
(*val is_valid_abi_aarch64_le_machine_architecture : natural -> bool*)
definition is_valid_abi_aarch64_le_machine_architecture  :: " nat \<Rightarrow> bool "  where 
     " is_valid_abi_aarch64_le_machine_architecture m = (
  m = elf_ma_aarch64 )"


(** [is_valid_abi_aarch64_le_magic_number magic] checks whether the ELF header's
  * magic number is valid according to the ABI-specific specification.
  * File class must be 64-bit (pg 60)
  * Data encoding must be little endian (pg 60)
  *)
(*val is_valid_abi_aarch64_le_magic_number : list unsigned_char -> bool*)
definition is_valid_abi_aarch64_le_magic_number  :: "(Elf_Types_Local.unsigned_char)list \<Rightarrow> bool "  where 
     " is_valid_abi_aarch64_le_magic_number magic = (
  (case  index magic ( elf_ii_class) of
      None  => False
    | Some cls =>
      (case  index magic ( elf_ii_data) of
          None   => False
        | Some data =>
            (unat cls = abi_aarch64_le_file_class) \<and>
              (unat data = abi_aarch64_le_data_encoding)
      )
  ))"

end
