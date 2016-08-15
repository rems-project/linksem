(*Generated by Lem from elf_program_header_table.lem.*)
open HolKernel Parse boolLib bossLib;
open lem_numTheory lem_listTheory lem_setTheory lem_functionTheory lem_basic_classesTheory lem_boolTheory lem_maybeTheory lem_stringTheory showTheory missing_pervasivesTheory errorTheory byte_sequenceTheory endiannessTheory elf_types_native_uintTheory;

val _ = numLib.prefer_num();



val _ = new_theory "elf_program_header_table"

(** [elf_program_header_table] contains type, functions and other definitions
  * for working with program header tables and their entries and ELF segments.
  * Related files are [elf_interpreted_segments] which extracts information
  * derived from PHTs presented in this file and converts it into a more usable
  * format for processing.
  *
  * FIXME:
  * Bug in Lem as Lem codebase uses [int] type throughout where [BigInt.t]
  * is really needed, hence chokes on huge constants below, which is why they are
  * written in the way that they are.
  *)

(*open import Basic_classes*)
(*open import Bool*)
(*open import Function*)
(*open import List*)
(*open import Maybe*)
(*open import Num*)
(*open import String*)
(*import Set*)

(*open import Elf_types_native_uint*)
(*open import Endianness*)

(*open import Byte_sequence*)
(*open import Error*)
(*open import Missing_pervasives*)
(*open import Show*)

(** Segment types *)

(** Unused array element.  All other members of the structure are undefined. *)
val _ = Define `
 (elf_pt_null : num= (I 0))`;

(** A loadable segment. *)
val _ = Define `
 (elf_pt_load : num= (I 1))`;

(** Dynamic linking information. *)
val _ = Define `
 (elf_pt_dynamic : num= (I 2))`;

(** Specifies the location and size of a null-terminated path name to be used to
  * invoke an interpreter.
  *)
val _ = Define `
 (elf_pt_interp : num= (I 3))`;

(** Specifies location and size of auxiliary information. *)
val _ = Define `
 (elf_pt_note : num= (I 4))`;

(** Reserved but with unspecified semantics.  If the file contains a segment of
  * this type then it is to be regarded as non-conformant with the ABI.
  *)
val _ = Define `
 (elf_pt_shlib : num= (I 5))`;

(** Specifies the location and size of the program header table. *)
val _ = Define `
 (elf_pt_phdr : num= (I 6))`;

(** Specifies the thread local storage (TLS) template.  Need not be supported. *)
val _ = Define `
 (elf_pt_tls : num= (I 7))`;

(** Start of reserved indices for operating system specific semantics. *)
val _ = Define `
 (elf_pt_loos : num= ((((I 128 *I 128) *I 128) *I 256) *I 3))`;
 (* 1610612736 (* 0x60000000 *) *)
(** End of reserved indices for operating system specific semantics. *)
val _ = Define `
 (elf_pt_hios : num=  ((I 469762047 *I 4) +I 3))`;
 (* 1879048191 (* 0x6fffffff *) *)
(** Start of reserved indices for processor specific semantics. *)
val _ = Define `
 (elf_pt_loproc : num=  (I 469762048 *I 4))`;
 (* 1879048192 (* 0x70000000 *) *)
(** End of reserved indices for processor specific semantics. *)
val _ = Define `
 (elf_pt_hiproc : num=  ((I 536870911 *I 4) +I 3))`;
 (* 2147483647 (* 0x7fffffff *) *)

(** [string_of_elf_segment_type os proc st] produces a string representation of
  * the coding of an ELF segment type [st] using [os] and [proc] to render OS-
  * and processor-specific codings.
  *)
(* XXX: is GNU stuff supposed to be hardcoded here? *)
(*val string_of_segment_type : (natural -> string) -> (natural -> string) -> natural -> string*)
val _ = Define `
 (string_of_segment_type os proc pt=	
 (if pt = elf_pt_null then
		"NULL"
	else if pt = elf_pt_load then
		"LOAD"
	else if pt = elf_pt_dynamic then
		"DYNAMIC"
	else if pt = elf_pt_interp then
		"INTERP"
	else if pt = elf_pt_note then
		"NOTE"
	else if pt = elf_pt_shlib then
		"SHLIB"
	else if pt = elf_pt_phdr then
		"PHDR"
	else if pt = elf_pt_tls then
		"TLS"
	else if (pt >= elf_pt_loos) /\ (pt <= elf_pt_hios) then
		os pt
	else if (pt >= elf_pt_loproc) /\ (pt <= elf_pt_hiproc) then
		proc pt
	else
		"Undefined or invalid segment type"))`;

		
(** Segments permission flags *)

(** Execute bit *)
val _ = Define `
 (elf_pf_x        : num= (I 1))`;

(** Write bit *)
val _ = Define `
 (elf_pf_w        : num= (I 2))`;

(** Read bit *)
val _ = Define `
 (elf_pf_r        : num= (I 4))`;

(** The following two bit ranges are reserved for OS- and processor-specific
  * flags respectively.
  *)
val _ = Define `
 (elf_pf_maskos   : num= (I 267386880))`;
      (* 0x0ff00000 *)
val _ = Define `
 (elf_pf_maskproc : num= (I 4 *I 1006632960))`;
 (* 0xf0000000 *)

(** [exact_permission_of_permission m]: ELF has two interpretations of a RWX-style
  * permission bit [m], an exact permission and an allowable permission.  These
  * permissions allow us to interpret a flag as an upper bound for behaviour and
  * an ABI-compliant implementation can choose to interpret the flag [m] as either.
  *
  * In the exact interpretation, the upper bound is exactly the natural interpretation
  * of the flag.  This is encoded in [exact_permission_of_permission], which is
  * a glorified identity function, though included for completeness.
  *)
(*val exact_permissions_of_permission : natural -> error natural*)
val _ = Define `
 (exact_permissions_of_permission m=  
 (if m =I 0 then
    return(I 0)
  else if m = elf_pf_x then
    return(I 1)
  else if m = elf_pf_w then
    return(I 2)
  else if m = elf_pf_r then
    return(I 4)
  else if m = (elf_pf_x + elf_pf_w) then
    return(I 3)
  else if m = (elf_pf_x + elf_pf_r) then
    return(I 5)
  else if m = (elf_pf_w + elf_pf_r) then
    return(I 6)
  else if m = ((elf_pf_x + elf_pf_r) + elf_pf_w) then
    return(I 7)
  else
    fail0 "exact_permission_of_permission: invalid permission flag"))`;


(** [allowable_permission_of_permission m]: ELF has two interpretations of a RWX-style
  * permission bit [m], an exact permission and an allowable permission.  These
  * permissions allow us to interpret a flag as an upper bound for behaviour and
  * an ABI-compliant implementation can choose to interpret the flag [m] as either.
  *
  * In the allowable interpretation, the upper bound is more lax than the natural
  * interpretation of the flag.
  *)
(*val allowable_permissions_of_permission : natural -> error natural*)
val _ = Define `
 (allowable_permissions_of_permission m=  
 (if m =I 0 then
    return(I 0)
  else if m = elf_pf_x then
    return(I 5)
  else if m = elf_pf_w then
    return(I 7)
  else if m = elf_pf_r then
    return(I 5)
  else if m = (elf_pf_x + elf_pf_w) then
    return(I 7)
  else if m = (elf_pf_x + elf_pf_r) then
    return(I 5)
  else if m = (elf_pf_w + elf_pf_r) then
    return(I 7)
  else if m = ((elf_pf_x + elf_pf_r) + elf_pf_w) then
    return(I 7)
  else
    fail0 "exact_permission_of_permission: invalid permission flag"))`;

    
(** [string_of_elf_segment_permissions m] produces a string-based representation
  * of an ELF segment's permission field.
  * TODO: expand this as is needed by the validation tests.
  *)
(*val string_of_elf_segment_permissions : natural -> string*)
val _ = Define `
 (string_of_elf_segment_permissions m=  
 (if m =I 0 then
    "  "
  else if m = elf_pf_x then
    "  E"
  else if m = elf_pf_w then
    " W "
  else if m = elf_pf_r then
    "R  "
  else if m = (elf_pf_x + elf_pf_w) then
    " WE"
  else if m = (elf_pf_x + elf_pf_r) then
    "R E"
  else if m = (elf_pf_w + elf_pf_r) then
    "RW "
  else if m = ((elf_pf_x + elf_pf_r) + elf_pf_w) then
    "RWE"
  else
    "Invalid permisssion flag"))`;


(** Program header table entry type *)

(** Type [elf32_program_header_table_entry] encodes a program header table entry
  * for 32-bit platforms.  Each entry describes a segment in an executable or
  * shared object file.
  *)
val _ = Hol_datatype `
 elf32_program_header_table_entry =
  <| elf32_p_type   : word32 (** Type of the segment *)
   ; elf32_p_offset : word32  (** Offset from beginning of file for segment *)
   ; elf32_p_vaddr  : word32 (** Virtual address for segment in memory *)
   ; elf32_p_paddr  : word32 (** Physical address for segment *)
   ; elf32_p_filesz : word32 (** Size of segment in file, in bytes *)
   ; elf32_p_memsz  : word32 (** Size of segment in memory image, in bytes *)
   ; elf32_p_flags  : word32 (** Segment flags *)
   ; elf32_p_align  : word32 (** Segment alignment memory for memory and file *)
   |>`;


(** [compare_elf32_program_header_table_entry ent1 ent2] is an ordering-comparison
  * function on program header table entries suitable for constructing sets,
  * finite maps, and other ordered data types with.
  *)
(*val compare_elf32_program_header_table_entry : elf32_program_header_table_entry ->
  elf32_program_header_table_entry -> ordering*)
val _ = Define `
 (compare_elf32_program_header_table_entry h1 h2=     
 (lexicographic_compare (genericCompare (<) (=)) [w2n h1.elf32_p_type;
    w2n h1.elf32_p_offset;
    w2n h1.elf32_p_vaddr;
    w2n h1.elf32_p_paddr;
    w2n h1.elf32_p_filesz;
    w2n h1.elf32_p_memsz; 
    w2n h1.elf32_p_flags;
    w2n h1.elf32_p_align]
    [w2n h2.elf32_p_type;
    w2n h2.elf32_p_offset;
    w2n h2.elf32_p_vaddr;
    w2n h2.elf32_p_paddr;
    w2n h2.elf32_p_filesz;
    w2n h2.elf32_p_memsz; 
    w2n h2.elf32_p_flags;
    w2n h2.elf32_p_align]))`;


val _ = Define `
(instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict= (<|

  compare_method := compare_elf32_program_header_table_entry;

  isLess_method := (\ f1 .  (\ f2 .  (compare_elf32_program_header_table_entry f1 f2 = LT)));

  isLessEqual_method := (\ f1 .  (\ f2 .  (IN) (compare_elf32_program_header_table_entry f1 f2) ({LT; EQ})));

  isGreater_method := (\ f1 .  (\ f2 .  (compare_elf32_program_header_table_entry f1 f2 = GT)));

  isGreaterEqual_method := (\ f1 .  (\ f2 .  (IN) (compare_elf32_program_header_table_entry f1 f2) ({GT; EQ})))|>))`;


(** Type [elf64_program_header_table_entry] encodes a program header table entry
  * for 64-bit platforms.  Each entry describes a segment in an executable or
  * shared object file.
  *)
val _ = Hol_datatype `
 elf64_program_header_table_entry =
  <| elf64_p_type   : word32  (** Type of the segment *)
   ; elf64_p_flags  : word32  (** Segment flags *)
   ; elf64_p_offset : word64   (** Offset from beginning of file for segment *)
   ; elf64_p_vaddr  : word64  (** Virtual address for segment in memory *)
   ; elf64_p_paddr  : word64  (** Physical address for segment *)
   ; elf64_p_filesz : word64 (** Size of segment in file, in bytes *)
   ; elf64_p_memsz  : word64 (** Size of segment in memory image, in bytes *)
   ; elf64_p_align  : word64 (** Segment alignment memory for memory and file *)
   |>`;


(** [compare_elf64_program_header_table_entry ent1 ent2] is an ordering-comparison
  * function on program header table entries suitable for constructing sets,
  * finite maps, and other ordered data types with.
  *)
(*val compare_elf64_program_header_table_entry : elf64_program_header_table_entry ->
  elf64_program_header_table_entry -> ordering*)
val _ = Define `
 (compare_elf64_program_header_table_entry h1 h2=     
 (lexicographic_compare (genericCompare (<) (=)) [w2n h1.elf64_p_type;
    w2n h1.elf64_p_offset;
    w2n h1.elf64_p_vaddr;
    w2n h1.elf64_p_paddr;
    w2n h1.elf64_p_filesz;
    w2n h1.elf64_p_memsz; 
    w2n h1.elf64_p_flags;
    w2n h1.elf64_p_align]
    [w2n h2.elf64_p_type;
    w2n h2.elf64_p_offset;
    w2n h2.elf64_p_vaddr;
    w2n h2.elf64_p_paddr;
    w2n h2.elf64_p_filesz;
    w2n h2.elf64_p_memsz; 
    w2n h2.elf64_p_flags;
    w2n h2.elf64_p_align]))`;


val _ = Define `
(instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict= (<|

  compare_method := compare_elf64_program_header_table_entry;

  isLess_method := (\ f1 .  (\ f2 .  (compare_elf64_program_header_table_entry f1 f2 = LT)));

  isLessEqual_method := (\ f1 .  (\ f2 .  (IN) (compare_elf64_program_header_table_entry f1 f2) ({LT; EQ})));

  isGreater_method := (\ f1 .  (\ f2 .  (compare_elf64_program_header_table_entry f1 f2 = GT)));

  isGreaterEqual_method := (\ f1 .  (\ f2 .  (IN) (compare_elf64_program_header_table_entry f1 f2) ({GT; EQ})))|>))`;


  
(** [string_of_elf32_program_header_table_entry os proc et] produces a string
  * representation of a 32-bit program header table entry using [os] and [proc]
  * to render OS- and processor-specific entries.
  *)
(*val string_of_elf32_program_header_table_entry : (natural -> string) -> (natural -> string) -> elf32_program_header_table_entry -> string*)
val _ = Define `
 (string_of_elf32_program_header_table_entry os proc entry=	
 (unlines [
		 STRCAT"\t"  (STRCAT"Segment type: " (string_of_segment_type os proc (w2n entry.elf32_p_type)))
	;  STRCAT"\t"  (STRCAT"Offset: " ((num_to_dec_string o w2n entry.elf32_p_offset)))
	;  STRCAT"\t"  (STRCAT"Virtual address: " ((num_to_dec_string o w2n entry.elf32_p_vaddr)))
	;  STRCAT"\t"  (STRCAT"Physical address: " ((num_to_dec_string o w2n entry.elf32_p_paddr)))
	;  STRCAT"\t"  (STRCAT"Segment size (bytes): " ((num_to_dec_string o w2n entry.elf32_p_filesz)))
	;  STRCAT"\t"  (STRCAT"Segment size in memory image (bytes): " ((num_to_dec_string o w2n entry.elf32_p_memsz)))
	;  STRCAT"\t"  (STRCAT"Flags: " ((num_to_dec_string o w2n entry.elf32_p_flags)))
  ;  STRCAT"\t"  (STRCAT"Alignment: " ((num_to_dec_string o w2n entry.elf32_p_align)))
	]))`;


(** [string_of_elf64_program_header_table_entry os proc et] produces a string
  * representation of a 64-bit program header table entry using [os] and [proc]
  * to render OS- and processor-specific entries.
  *)
(*val string_of_elf64_program_header_table_entry : (natural -> string) -> (natural -> string) -> elf64_program_header_table_entry -> string*)
val _ = Define `
 (string_of_elf64_program_header_table_entry os proc entry=  
 (unlines [
     STRCAT"\t"  (STRCAT"Segment type: " (string_of_segment_type os proc (w2n entry.elf64_p_type)))
  ;  STRCAT"\t"  (STRCAT"Offset: " ((num_to_dec_string o w2n entry.elf64_p_offset)))
  ;  STRCAT"\t"  (STRCAT"Virtual address: " ((num_to_dec_string o w2n entry.elf64_p_vaddr)))
  ;  STRCAT"\t"  (STRCAT"Physical address: " ((num_to_dec_string o w2n entry.elf64_p_paddr)))
  ;  STRCAT"\t"  (STRCAT"Segment size (bytes): " ((num_to_dec_string o w2n entry.elf64_p_filesz)))
  ;  STRCAT"\t"  (STRCAT"Segment size in memory image (bytes): " ((num_to_dec_string o w2n entry.elf64_p_memsz)))
  ;  STRCAT"\t"  (STRCAT"Flags: " ((num_to_dec_string o w2n entry.elf64_p_flags)))
  ;  STRCAT"\t"  (STRCAT"Alignment: " ((num_to_dec_string o w2n entry.elf64_p_align)))
  ]))`;


(** [string_of_elf32_program_header_table_entry_default et] produces a string representation
  * of table entry [et] where OS- and processor-specific entries are replaced with
  * default strings.
  *)
(*val string_of_elf32_program_header_table_entry_default : elf32_program_header_table_entry -> string*)
val _ = Define `
 (string_of_elf32_program_header_table_entry_default=	
 (string_of_elf32_program_header_table_entry
    (K "*Default OS specific print*")
      (K "*Default processor specific print*")))`;


(** [string_of_elf64_program_header_table_entry_default et] produces a string representation
  * of table entry [et] where OS- and processor-specific entries are replaced with
  * default strings.
  *)
(*val string_of_elf64_program_header_table_entry_default : elf64_program_header_table_entry -> string*)
val _ = Define `
 (string_of_elf64_program_header_table_entry_default=  
 (string_of_elf64_program_header_table_entry
    (K "*Default OS specific print*")
      (K "*Default processor specific print*")))`;

	
val _ = Define `
(instance_Show_Show_Elf_program_header_table_elf32_program_header_table_entry_dict= (<|

  show_method := string_of_elf32_program_header_table_entry_default|>))`;


val _ = Define `
(instance_Show_Show_Elf_program_header_table_elf64_program_header_table_entry_dict= (<|

  show_method := string_of_elf64_program_header_table_entry_default|>))`;


(** Parsing and blitting *)

(** [bytes_of_elf32_program_header_table_entry ed ent] blits a 32-bit program
  * header table entry [ent] into a byte sequence assuming endianness [ed].
  *)
(*val bytes_of_elf32_program_header_table_entry : endianness -> elf32_program_header_table_entry -> byte_sequence*)
val _ = Define `
 (bytes_of_elf32_program_header_table_entry endian entry=  
 (byte_sequence$from_byte_lists [
    bytes_of_elf32_word endian entry.elf32_p_type
  ; bytes_of_elf32_off  endian entry.elf32_p_offset
  ; bytes_of_elf32_addr endian entry.elf32_p_vaddr
  ; bytes_of_elf32_addr endian entry.elf32_p_paddr
  ; bytes_of_elf32_word endian entry.elf32_p_filesz
  ; bytes_of_elf32_word endian entry.elf32_p_memsz
  ; bytes_of_elf32_word endian entry.elf32_p_flags
  ; bytes_of_elf32_word endian entry.elf32_p_align
  ]))`;

  
(** [bytes_of_elf64_program_header_table_entry ed ent] blits a 64-bit program
  * header table entry [ent] into a byte sequence assuming endianness [ed].
  *)
(*val bytes_of_elf64_program_header_table_entry : endianness -> elf64_program_header_table_entry -> byte_sequence*)
val _ = Define `
 (bytes_of_elf64_program_header_table_entry endian entry=  
 (byte_sequence$from_byte_lists [
    bytes_of_elf64_word  endian entry.elf64_p_type
  ; bytes_of_elf64_word  endian entry.elf64_p_flags
  ; bytes_of_elf64_off   endian entry.elf64_p_offset
  ; bytes_of_elf64_addr  endian entry.elf64_p_vaddr
  ; bytes_of_elf64_addr  endian entry.elf64_p_paddr
  ; bytes_of_elf64_xword endian entry.elf64_p_filesz
  ; bytes_of_elf64_xword endian entry.elf64_p_memsz
  ; bytes_of_elf64_xword endian entry.elf64_p_align
  ]))`;


(** [read_elf32_program_header_table_entry endian bs0] reads an ELF32 program header table
  * entry from byte sequence [bs0] assuming endianness [endian].  If [bs0] is larger
  * than necessary, the excess is returned from the function, too.
  * Fails if the entry cannot be read.
  *)
(*val read_elf32_program_header_table_entry : endianness -> byte_sequence ->
  error (elf32_program_header_table_entry * byte_sequence)*)
val _ = Define `
 (read_elf32_program_header_table_entry endian bs=	
 (read_elf32_word endian bs >>= (\ (typ, bs) . 
	read_elf32_off  endian bs >>= (\ (offset, bs) . 
	read_elf32_addr endian bs >>= (\ (vaddr, bs) . 
	read_elf32_addr endian bs >>= (\ (paddr, bs) . 
	read_elf32_word endian bs >>= (\ (filesz, bs) . 
	read_elf32_word endian bs >>= (\ (memsz, bs) . 
	read_elf32_word endian bs >>= (\ (flags, bs) . 
	read_elf32_word endian bs >>= (\ (align, bs) . 
		return (<| elf32_p_type := typ; elf32_p_offset := offset;
                elf32_p_vaddr := vaddr; elf32_p_paddr := paddr;
                elf32_p_filesz := filesz; elf32_p_memsz := memsz;
                elf32_p_flags := flags; elf32_p_align := align |>, bs)))))))))))`;


(** [read_elf64_program_header_table_entry endian bs0] reads an ELF64 program header table
  * entry from byte sequence [bs0] assuming endianness [endian].  If [bs0] is larger
  * than necessary, the excess is returned from the function, too.
  * Fails if the entry cannot be read.
  *)
(*val read_elf64_program_header_table_entry : endianness -> byte_sequence ->
  error (elf64_program_header_table_entry * byte_sequence)*)
val _ = Define `
 (read_elf64_program_header_table_entry endian bs=  
 (read_elf64_word endian bs >>= (\ (typ, bs) . 
  read_elf64_word endian bs >>= (\ (flags, bs) . 
  read_elf64_off  endian bs >>= (\ (offset, bs) . 
  read_elf64_addr endian bs >>= (\ (vaddr, bs) . 
  read_elf64_addr endian bs >>= (\ (paddr, bs) . 
  read_elf64_xword endian bs >>= (\ (filesz, bs) . 
  read_elf64_xword endian bs >>= (\ (memsz, bs) . 
  read_elf64_xword endian bs >>= (\ (align, bs) . 
    return (<| elf64_p_type := typ; elf64_p_offset := offset;
                elf64_p_vaddr := vaddr; elf64_p_paddr := paddr;
                elf64_p_filesz := filesz; elf64_p_memsz := memsz;
                elf64_p_flags := flags; elf64_p_align := align |>, bs)))))))))))`;


(** Program header table type *)

(** Type [elf32_program_header_table] represents a program header table for 32-bit
  * ELF files.  A program header table is an array (implemented as a list, here)
  * of program header table entries.
  *)
val _ = type_abbrev( "elf32_program_header_table" , ``: elf32_program_header_table_entry
  list``);

(** Type [elf64_program_header_table] represents a program header table for 64-bit
  * ELF files.  A program header table is an array (implemented as a list, here)
  * of program header table entries.
  *)
val _ = type_abbrev( "elf64_program_header_table" , ``: elf64_program_header_table_entry
  list``);

(** [bytes_of_elf32_program_header_table ed tbl] blits an ELF32 program header
  * table into a byte sequence assuming endianness [ed].
  *)
val _ = Define `
 (bytes_of_elf32_program_header_table endian tbl=  
 (byte_sequence$concat0 (MAP (bytes_of_elf32_program_header_table_entry endian) tbl)))`;


(** [bytes_of_elf64_program_header_table ed tbl] blits an ELF64 program header
  * table into a byte sequence assuming endianness [ed].
  *)  
val _ = Define `
 (bytes_of_elf64_program_header_table endian tbl=  
 (byte_sequence$concat0 (MAP (bytes_of_elf64_program_header_table_entry endian) tbl)))`;


(** [read_elf32_program_header_table' endian bs0] reads an ELF32 program header table from
  * byte_sequence [bs0] assuming endianness [endian].  The byte_sequence [bs0] is assumed
  * to have exactly the correct size for the table.  For internal use, only.  Use
  * [read_elf32_program_header_table] below instead.
  *)
 val read_elf32_program_header_table'_defn = Hol_defn "read_elf32_program_header_table'" `
 (read_elf32_program_header_table' endian bs0=	
 (if byte_sequence$length0 bs0 =I 0 then
  	return []
  else
  	read_elf32_program_header_table_entry endian bs0 >>= (\ (entry, bs1) . 
    read_elf32_program_header_table' endian bs1 >>= (\ tail . 
    return (entry::tail)))))`;

val _ = Lib.with_flag (computeLib.auto_import_definitions, false) Defn.save_defn read_elf32_program_header_table'_defn;

(** [read_elf64_program_header_table' endian bs0] reads an ELF64 program header table from
  * byte_sequence [bs0] assuming endianness [endian].  The byte_sequence [bs0] is assumed
  * to have exactly the correct size for the table.  For internal use, only.  Use
  * [read_elf32_program_header_table] below instead.
  *)
 val read_elf64_program_header_table'_defn = Hol_defn "read_elf64_program_header_table'" `
 (read_elf64_program_header_table' endian bs0=  
 (if byte_sequence$length0 bs0 =I 0 then
    return []
  else
    read_elf64_program_header_table_entry endian bs0 >>= (\ (entry, bs1) . 
    read_elf64_program_header_table' endian bs1 >>= (\ tail . 
    return (entry::tail)))))`;

val _ = Lib.with_flag (computeLib.auto_import_definitions, false) Defn.save_defn read_elf64_program_header_table'_defn;

(** [read_elf32_program_header_table table_size endian bs0] reads an ELF32 program header
  * table from byte_sequence [bs0] assuming endianness [endian] based on the size (in bytes) passed in via [table_size].
  * This [table_size] argument should be equal to the number of entries in the
  * table multiplied by the fixed entry size.  Bitstring [bs0] may be larger than
  * necessary, in which case the excess is returned.
  *)
(*val read_elf32_program_header_table : natural -> endianness -> byte_sequence ->
  error (elf32_program_header_table * byte_sequence)*)
val _ = Define `
 (read_elf32_program_header_table table_size endian bs0=	
 (partition0 table_size bs0 >>= (\ (eat, rest) . 
	read_elf32_program_header_table' endian eat >>= (\ table . 
	return (table, rest)))))`;


(** [read_elf64_program_header_table table_size endian bs0] reads an ELF64 program header
  * table from byte_sequence [bs0] assuming endianness [endian] based on the size (in bytes) passed in via [table_size].
  * This [table_size] argument should be equal to the number of entries in the
  * table multiplied by the fixed entry size.  Bitstring [bs0] may be larger than
  * necessary, in which case the excess is returned.
  *)
(*val read_elf64_program_header_table : natural -> endianness -> byte_sequence ->
  error (elf64_program_header_table * byte_sequence)*)
val _ = Define `
 (read_elf64_program_header_table table_size endian bs0=  
 (partition0 table_size bs0 >>= (\ (eat, rest) . 
  read_elf64_program_header_table' endian eat >>= (\ table . 
  return (table, rest)))))`;


(** The [pht_print_bundle] type is used to tidy up other type signatures.  Some of the
  * top-level string_of_ functions require six or more functions passed to them,
  * which quickly gets out of hand.  This type is used to reduce that complexity.
  * The first component of the type is an OS specific print function, the second is
  * a processor specific print function.
  *)
val _ = type_abbrev( "pht_print_bundle" , ``: (num -> string) # (num -> string)``);

(** [string_of_elf32_program_header_table os proc tbl] produces a string representation
  * of program header table [tbl] using [os] and [proc] to render OS- and processor-
  * specific entries.
  *)
(*val string_of_elf32_program_header_table : pht_print_bundle -> elf32_program_header_table -> string*)
val _ = Define `
 (string_of_elf32_program_header_table (os, proc) tbl=  
 (unlines (MAP (string_of_elf32_program_header_table_entry os proc) tbl)))`;


(** [string_of_elf64_program_header_table os proc tbl] produces a string representation
  * of program header table [tbl] using [os] and [proc] to render OS- and processor-
  * specific entries.
  *)
(*val string_of_elf64_program_header_table : pht_print_bundle -> elf64_program_header_table -> string*)
val _ = Define `
 (string_of_elf64_program_header_table (os, proc) tbl=  
 (unlines (MAP (string_of_elf64_program_header_table_entry os proc) tbl)))`;


(** Static/dynamic linkage *)

(** [get_elf32_dynamic_linked pht] tests whether an ELF32 file is a dynamically
  * linked object by traversing the program header table and attempting to find
  * a header describing a segment with the name of an associated interpreter.
  * Returns [true] if any such header is found, [false] --- indicating static
  * linkage --- otherwise.
  *)
(*val get_elf32_dynamic_linked : elf32_program_header_table -> bool*)
val _ = Define `
 (get_elf32_dynamic_linked pht=  
 (EXISTS (\ p .  w2n p.elf32_p_type = elf_pt_interp) pht))`;


(** [get_elf64_dynamic_linked pht] tests whether an ELF64 file is a dynamically
  * linked object by traversing the program header table and attempting to find
  * a header describing a segment with the name of an associated interpreter.
  * Returns [true] if any such header is found, [false] --- indicating static
  * linkage --- otherwise.
  *)
(*val get_elf64_dynamic_linked : elf64_program_header_table -> bool*)
val _ = Define `
 (get_elf64_dynamic_linked pht=  
 (EXISTS (\ p .  w2n p.elf64_p_type = elf_pt_interp) pht))`;


(** [get_elf32_static_linked] is a utility function defined as the inverse
  * of [get_elf32_dynamic_linked].
  *)
(*val get_elf32_static_linked : elf32_program_header_table -> bool*)
val _ = Define `
 (get_elf32_static_linked pht=  
 (~ (get_elf32_dynamic_linked pht)))`;


(** [get_elf64_static_linked] is a utility function defined as the inverse
  * of [get_elf64_dynamic_linked].
  *)
(*val get_elf64_static_linked : elf64_program_header_table -> bool*)
val _ = Define `
 (get_elf64_static_linked pht=  
 (~ (get_elf64_dynamic_linked pht)))`;

  
(** [get_elf32_requested_interpreter ent bs0] extracts the requested interpreter
  * of a dynamically linkable ELF file from that file's program header table
  * entry of type PT_INTERP, [ent].  Interpreter string is extracted from byte
  * sequence [bs0].
  * Fails if [ent] is not of type PT_INTERP, or if transcription otherwise fails.
  *)
(*val get_elf32_requested_interpreter : elf32_program_header_table_entry ->
  byte_sequence -> error string*)
val _ = Define `
 (get_elf32_requested_interpreter pent bs0=  
 (if w2n pent.elf32_p_type = elf_pt_interp then
    let off = (w2n  pent.elf32_p_offset) in
    let siz = (w2n pent.elf32_p_filesz) in
      byte_sequence$offset_and_cut off (siz - I 1) bs0 >>= (\ cut . 
      return (byte_sequence$string_of_byte_sequence cut))
  else
    fail0 "get_elf32_requested_interpreter: not an INTERP segment header"))`;

  
(** [get_elf64_requested_interpreter ent bs0] extracts the requested interpreter
  * of a dynamically linkable ELF file from that file's program header table
  * entry of type PT_INTERP, [ent].  Interpreter string is extracted from byte
  * sequence [bs0].
  * Fails if [ent] is not of type PT_INTERP, or if transcription otherwise fails.
  *)
(*val get_elf64_requested_interpreter : elf64_program_header_table_entry ->
  byte_sequence -> error string*)
val _ = Define `
 (get_elf64_requested_interpreter pent bs0=  
 (if w2n pent.elf64_p_type = elf_pt_interp then
    let off = (w2n   pent.elf64_p_offset) in
    let siz = (w2n pent.elf64_p_filesz) in
      byte_sequence$offset_and_cut off (siz - I 1) bs0 >>= (\ cut . 
      return (byte_sequence$string_of_byte_sequence cut))
  else
    fail0 "get_elf64_requested_interpreter: not an INTERP segment header"))`;

val _ = export_theory()

