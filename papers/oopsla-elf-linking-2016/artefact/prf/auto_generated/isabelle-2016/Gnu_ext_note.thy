chapter {* Generated by Lem from gnu_extensions/gnu_ext_note.lem. *}

theory "Gnu_ext_note" 

imports 
 	 Main
	 "../../lem-libs/isabelle-lib/Lem_list" 
	 "../../lem-libs/isabelle-lib/Lem_basic_classes" 
	 "../../lem-libs/isabelle-lib/Lem_bool" 
	 "../../lem-libs/isabelle-lib/Lem_maybe" 
	 "../../lem-libs/isabelle-lib/Lem_string" 
	 "Missing_pervasives" 
	 "Error" 
	 "Byte_sequence" 
	 "Endianness" 
	 "Elf_types_native_uint" 
	 "String_table" 
	 "Elf_section_header_table" 
	 "Gnu_ext_section_header_table" 
	 "Elf_note" 

begin 

(** [gnu_ext_note] contains GNU extension specific definitions relating to the
  * .note section/segment of an ELF file.
  *)

(*open import Basic_classes*)
(*open import Bool*)
(*open import List*)
(*open import Maybe*)
(*open import String*)

(*open import Byte_sequence*)
(*open import Endianness*)
(*open import Error*)
(*open import Missing_pervasives*)
(*open import String_table*)

(*open import Elf_note*)
(*open import Elf_section_header_table*)
(*open import Elf_types_native_uint*)

(*open import Gnu_ext_section_header_table*)

(** The following two functions are utility functions to convert a list of bytes
  * into words, ready for further processing into strings.
  *)
  
(*val group_elf32_words : endianness -> list byte -> error (list elf32_word)*)
function (sequential,domintros)  group_elf32_words  :: " endianness \<Rightarrow>(Elf_Types_Local.byte)list \<Rightarrow>((uint32)list)error "  where 
     " group_elf32_words endian ([]) = ( error_return [])"
|" group_elf32_words endian (x1 # x2 # x3 # x4 # xs) = (
      (let bs0 = (Byte_sequence.from_byte_lists [[x1,x2,x3,x4]]) in
      read_elf32_word   endian bs0 >>= (\<lambda> (w, _) . 
      group_elf32_words endian xs  >>= (\<lambda> ws . 
      error_return (w # ws)))))"
|" group_elf32_words endian xs = ( error_fail (''group_elf32_words: the impossible happened''))" 
by pat_completeness auto

  
(*val group_elf64_words : endianness -> list byte -> error (list elf64_word)*)
function (sequential,domintros)  group_elf64_words  :: " endianness \<Rightarrow>(Elf_Types_Local.byte)list \<Rightarrow>((uint32)list)error "  where 
     " group_elf64_words endian ([]) = ( error_return [])"
|" group_elf64_words endian (x1 # x2 # x3 # x4 # xs) = (
      (let bs0 = (Byte_sequence.from_byte_lists [[x1,x2,x3,x4]]) in
      read_elf64_word   endian bs0 >>= (\<lambda> (w, _) . 
      group_elf64_words endian xs  >>= (\<lambda> ws . 
      error_return (w # ws)))))"
|" group_elf64_words endian xs = ( error_fail (''group_elf64_words: the impossible happened''))" 
by pat_completeness auto


(** [gnu_ext_check_elf32_abi_note_tag_section endain sht stbl bs0] checks the
  * .note.ABI-tag section of an ELF file to ensure conformance with the GNU
  * extensions.  The string in this note should contain the string GNU.
  *)
(*val gnu_ext_check_elf32_abi_note_tag_section : endianness -> elf32_section_header_table ->
  string_table -> byte_sequence -> bool*)
definition gnu_ext_check_elf32_abi_note_tag_section  :: " endianness \<Rightarrow>(elf32_section_header_table_entry)list \<Rightarrow> string_table \<Rightarrow> byte_sequence \<Rightarrow> bool "  where 
     " gnu_ext_check_elf32_abi_note_tag_section endian sht sect_hdr_tbl bs0 = (
  (let abi_note_sects =    
(List.filter (\<lambda> x . 
      if unat(elf32_sh_type   x) = sht_note then
        (let nm = (unat(elf32_sh_name   x)) in
          (case  String_table.get_string_at nm sect_hdr_tbl of
              Success name1 => name1 = (''.note.ABI-tag'')
            | Fail _       => False
          ))
      else
        False
    ) sht)
  in
    (case  abi_note_sects of
        [note1] =>
        (let off = (unat(elf32_sh_offset   note1)) in
        (let siz = (unat(elf32_sh_size   note1)) in
        (let abi_tag =          
(Byte_sequence.offset_and_cut off siz bs0 >>= (\<lambda> rel . 
          Elf_note.read_elf32_note endian rel >>= (\<lambda> (abi_tag, _) . 
          error_return abi_tag)))
        in
          (case  abi_tag of
              Fail _          => False
            | Success abi_tag =>
              (let str = (name_string_of_elf32_note abi_tag) in
                if str = ([(CHR ''G''), (CHR ''N''), (CHR ''U''), (Char Nibble0 Nibble0)]) then
                  if unat(elf32_note_descsz   abi_tag) \<ge>( 16 :: nat) then
                    (let take1 = (List.take(( 16 :: nat))(elf32_note_desc   abi_tag)) in
                      if List.length take1 <( 16 :: nat) then
                        False
                      else
                        True)
                  else
                    False
                else
                  False)
          ))))
      | _      =>
          False
    )))"


(** [gnu_ext_check_elf64_abi_note_tag_section endain sht stbl bs0] checks the
  * .note.ABI-tag section of an ELF file to ensure conformance with the GNU
  * extensions.  The string in this note should contain the string GNU.
  *)
(*val gnu_ext_check_elf64_abi_note_tag_section : endianness -> elf64_section_header_table ->
  string_table -> byte_sequence -> bool*)
definition gnu_ext_check_elf64_abi_note_tag_section  :: " endianness \<Rightarrow>(elf64_section_header_table_entry)list \<Rightarrow> string_table \<Rightarrow> byte_sequence \<Rightarrow> bool "  where 
     " gnu_ext_check_elf64_abi_note_tag_section endian sht sect_hdr_tbl bs0 = (
  (let abi_note_sects =    
(List.filter (\<lambda> x . 
      if unat(elf64_sh_type   x) = sht_note then
        (let nm = (unat(elf64_sh_name   x)) in
          (case  String_table.get_string_at nm sect_hdr_tbl of
              Success name1 => name1 = (''.note.ABI-tag'')
            | Fail _       => False
          ))
      else
        False
    ) sht)
  in
    (case  abi_note_sects of
        [note1] =>
        (let off = (unat(elf64_sh_offset   note1)) in
        (let siz = (unat(elf64_sh_size   note1)) in
        (let abi_tag =          
(Byte_sequence.offset_and_cut off siz bs0 >>= (\<lambda> rel . 
          Elf_note.read_elf64_note endian rel >>= (\<lambda> (abi_tag, _) . 
          error_return abi_tag)))
        in
          (case  abi_tag of
              Fail _          => False
            | Success abi_tag =>
              (let str = (name_string_of_elf64_note abi_tag) in
                if str = ([(CHR ''G''), (CHR ''N''), (CHR ''U''), (Char Nibble0 Nibble0)]) then
                  if unat(elf64_note_descsz   abi_tag) \<ge>( 16 :: nat) then
                    (let take1 = (List.take(( 16 :: nat))(elf64_note_desc   abi_tag)) in
                      if List.length take1 <( 16 :: nat) then
                        False
                      else
                        True)
                  else
                    False
                else
                  False)
          ))))
      | _      =>
          False
    )))"

    
(** [gnu_ext_extract_elf32_earliest_compatible_kernel end sht stab bs0] extracts
  * the earliest compatible Linux kernel with the given ELF file from its section
  * header table [sht], and string table [stbl], assuming endianness [endian].
  * NB: marked as OCaml only as need to extract a string from integers.
  * TODO: implement some string parsing functions in Isabelle/HOL so things like
  * this can be extracted.
  *)
(*val gnu_ext_extract_elf32_earliest_compatible_kernel : endianness -> elf32_section_header_table ->
  string_table -> byte_sequence -> error string*)
    
(** [gnu_ext_extract_elf64_earliest_compatible_kernel end sht stab bs0] extracts
  * the earliest compatible Linux kernel with the given ELF file from its section
  * header table [sht], and string table [stbl], assuming endianness [endian].
  * NB: marked as OCaml only as need to extract a string from integers.
  * TODO: implement some string parsing functions in Isabelle/HOL so things like
  * this can be extracted.
  *)
(*val gnu_ext_extract_elf64_earliest_compatible_kernel : endianness -> elf64_section_header_table ->
  string_table -> byte_sequence -> error string*)
end
