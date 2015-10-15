(*Generated by Lem from abis/aarch64/abi_aarch64_le.lem.*)
open HolKernel Parse boolLib bossLib;
open lem_numTheory lem_listTheory lem_basic_classesTheory lem_boolTheory lem_maybeTheory lem_assert_extraTheory missing_pervasivesTheory errorTheory endiannessTheory elf_types_native_uintTheory elf_headerTheory elf_interpreted_sectionTheory elf_interpreted_segmentTheory elf_fileTheory memory_imageTheory abi_aarch64_le_elf_headerTheory abi_aarch64_relocationTheory;

val _ = numLib.prefer_num();



val _ = new_theory "abi_aarch64_le"

(** [abi_aarch64_le] contains top-level definition for the AArch64 ABI (little-endian case).
  *)

(*open import Basic_classes*)
(*open import Bool*)
(*open import List*)
(*open import Num*)
(*open import Maybe*)
(*open import Assert_extra*)
(*open import Error*)
(*open import Missing_pervasives*)

(*open import Elf_header*)
(*open import Elf_types_native_uint*)
(*open import Elf_file*)
(*open import Elf_interpreted_segment*)
(*open import Elf_interpreted_section*)

(*open import Endianness*)
(* open import Elf_memory_image *)
(*open import Memory_image*)
(*open import Abi_aarch64_relocation*)
(*open import Abi_aarch64_le_elf_header*)

(** [abi_aarch64_le_compute_program_entry_point segs entry] computes the program
  * entry point using ABI-specific conventions.  On AArch64 the entry point in
  * the ELF header ([entry] here) is the real entry point.  On other ABIs, e.g.
  * PowerPC64, the entry point [entry] is a pointer into one of the segments
  * constituting the process image (passed in as [segs] here for a uniform
  * interface).
  *)
(*val abi_aarch64_le_compute_program_entry_point : list elf64_interpreted_segments -> elf64_addr -> error elf64_addr*)
val _ = Define `
 (abi_aarch64_le_compute_program_entry_point segs entry =	
(return entry))`;


(*val header_is_aarch64_le : elf64_header -> bool*)
val _ = Define `
 (header_is_aarch64_le h =    
 (is_valid_elf64_header h
    /\ (lem_list$list_index h.elf64_ident (id elf_ii_data) = SOME (n2w elf_data_2lsb))
    /\ is_valid_abi_aarch64_le_machine_architecture (w2n h.elf64_machine)
    /\ is_valid_abi_aarch64_le_magic_number h.elf64_ident))`;

    
val _ = Hol_datatype `
 aarch64_le_abi_feature = GOT | PLT`;
 (* placeholder / FIXME *)

(*val aarch64LeAbiFeatureConstructorToNaturalList : aarch64_le_abi_feature -> list natural*)
val _ = Define `
 (aarch64LeAbiFeatureConstructorToNaturalList af = ((case af of
    GOT => [ 0]
    | PLT => [ 1]
)))`;


(*val abiFeatureCompare : aarch64_le_abi_feature -> aarch64_le_abi_feature -> Basic_classes.ordering*)
val _ = Define `
 (abiFeatureCompare f1 f2 =    
 ((case (aarch64LeAbiFeatureConstructorToNaturalList f1, aarch64LeAbiFeatureConstructorToNaturalList f2) of
        ([], []) => failwith "impossible: ABI feature has empty natural list (case 0)"
    |   (_, [])  => failwith "impossible: ABI feature has empty natural list (case 1)"
    |   ([], _)  => failwith "impossible: ABI feature has empty natural list (case 2)"
    |   ((hd1 :: tl1), (hd2 :: tl2)) => 
            if hd1 < hd2 then LT else if hd1 > hd2 then GT else
                (case (f1, f2) of
                    (GOT, GOT) => EQ
                    | (PLT, PLT) => EQ
                    | _ => failwith "impossible: tag constructors not equal but natural list heads were equal"
                )
    )))`;


val _ = Define `
(instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict =(<|

  compare_method := abiFeatureCompare;

  isLess_method := (\ f1 .  (\ f2 .  (abiFeatureCompare f1 f2 = LT)));

  isLessEqual_method := (\ f1 .  (\ f2 .  (IN) (abiFeatureCompare f1 f2) ({LT; EQ})));

  isGreater_method := (\ f1 .  (\ f2 .  (abiFeatureCompare f1 f2 = GT)));

  isGreaterEqual_method := (\ f1 .  (\ f2 .  (IN) (abiFeatureCompare f1 f2) ({GT; EQ})))|>))`;


val _ = Define `
(instance_Memory_image_ToNaturalList_Abi_aarch64_le_aarch64_le_abi_feature_dict =(<|

  toNaturalList_method := aarch64LeAbiFeatureConstructorToNaturalList|>))`;


(*val section_is_special : forall 'abifeature. elf64_interpreted_section -> annotated_memory_image 'abifeature -> bool*)
val _ = Define `
 (section_is_special0 s f =    
 (elf_section_is_special s f \/ (* FIXME *) F))`;

val _ = export_theory()
