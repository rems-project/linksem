(* Generated by Lem from elf_memory_image.lem. *)

Require Import Arith.
Require Import Bool.
Require Import List.
Require Import String.
Require Import Program.Wf.

Require Import coqharness.

Open Scope nat_scope.
Open Scope string_scope.

Require Import lem_basic_classes.
Require Export lem_basic_classes.

Require Import lem_function.
Require Export lem_function.

Require Import lem_string.
Require Export lem_string.

Require Import lem_tuple.
Require Export lem_tuple.

Require Import lem_bool.
Require Export lem_bool.

Require Import lem_list.
Require Export lem_list.

Require Import lem_sorting.
Require Export lem_sorting.

Require Import lem_map.
Require Export lem_map.

Require Import lem_set.
Require Export lem_set.

Require Import lem_num.
Require Export lem_num.

Require Import lem_maybe.
Require Export lem_maybe.

Require Import lem_assert_extra.
Require Export lem_assert_extra.


Require Import byte_sequence.
Require Export byte_sequence.

Require Import default_printing.
Require Export default_printing.

Require Import error.
Require Export error.

Require Import missing_pervasives.
Require Export missing_pervasives.

Require Import show.
Require Export show.

Require Import endianness.
Require Export endianness.


Require Import elf_header.
Require Export elf_header.

Require Import elf_file.
Require Export elf_file.

Require Import elf_interpreted_section.
Require Export elf_interpreted_section.

Require Import elf_interpreted_segment.
Require Export elf_interpreted_segment.

Require Import elf_section_header_table.
Require Export elf_section_header_table.

Require Import elf_program_header_table.
Require Export elf_program_header_table.

Require Import elf_symbol_table.
Require Export elf_symbol_table.

Require Import elf_types_native_uint.
Require Export elf_types_native_uint.

Require Import elf_relocation.
Require Export elf_relocation.

Require Import string_table.
Require Export string_table.


Require Import memory_image.
Require Export memory_image.

Require Import abis.
Require Export abis.


Definition elf_memory_image : Type :=  annotated_memory_image  any_abi_feature .
Definition elf_memory_image_default: elf_memory_image  := DAEMON.

Definition elf_section_is_special0 {a : Type}  (s : elf64_interpreted_section ) (f : a)  : bool :=  negb (beq_nat(elf64_section_type s) sht_progbits)
                     && negb (beq_nat(elf64_section_type s) sht_nobits).
(* [?]: removed value specification. *)

Definition noop_reloc0 {abifeature : Type}  (r : nat )  : ((option (elf64_symbol_table_entry )  -> nat )*(annotated_memory_image abifeature -> option (nat ) )) % type:=  ((fun (r_type : option (elf64_symbol_table_entry ) ) => 8), (fun (sym_val : annotated_memory_image abifeature) => None)).

Definitionempty_elf_memory_image   : annotated_memory_image (any_abi_feature ):=  {|elements         := fmap_empty
    ;by_range         := set_empty
    ;by_tag           := set_empty
|}.

(* HMM. For the elf_ident, I don't really want to express it this way.
 * I want something more bidirectional: something that can tell me 
 * not only that a given ident is valid for a given ABI, but also, 
 * to *construct* an ident for a given abstract ELF file satisfying x.
 * This is very much like a lens. 
 * 
 * Similarly for relocs, I might want a way to map back to an allowable
 * *concrete* representation, from some *abstract* description of the 
 * reloc's intent (i.e. a symbol binding: "point this reference at symbol
 * Foo"), given the constraints imposed by the ABI (such as "use only 
 * RELA, not rel". FIXME: figure out how to lensify what we're doing. *) 

Definition elf_range_tag : Type :=  range_tag  any_abi_feature .
Definition elf_range_tag_default: elf_range_tag  := DAEMON.

Definition null_section_header_table   : elf_file_feature :=  ElfSectionHeaderTable([]).
Definition null_program_header_table   : elf_file_feature :=  ElfProgramHeaderTable([]).
Definition null_elf_header   : elf64_header :=  {|elf64_ident    := []
   ;elf64_type     := (elf64_half_of_nat( 0))  
   ;elf64_machine  := (elf64_half_of_nat( 0))  
   ;elf64_version  := (elf64_word_of_nat( 0))  
   ;elf64_entry    := (elf64_addr_of_nat( 0))  
   ;elf64_phoff    := (elf64_off_of_nat( 0))   
   ;elf64_shoff    := (elf64_off_of_nat( 0))   
   ;elf64_flags    := (elf64_word_of_nat( 0))  
   ;elf64_ehsize   := (elf64_half_of_nat( 0))  
   ;elf64_phentsize:= (elf64_half_of_nat( 0))  
   ;elf64_phnum    := (elf64_half_of_nat( 0))  
   ;elf64_shentsize:= (elf64_half_of_nat( 0))  
   ;elf64_shnum    := (elf64_half_of_nat( 0))  
   ;elf64_shstrndx := (elf64_half_of_nat( 0))  
   |}.
(* [?]: removed value specification. *)

Definition offset_to_vaddr_mappings  (f : elf64_file ) (off : nat )  : list ((nat *elf64_interpreted_segment ) % type):=  
    lem_list.mapMaybe (fun (ph : elf64_interpreted_segment ) =>
        if nat_gteb off(elf64_segment_offset ph)
            && nat_ltb off (Coq.Init.Peano.plus(elf64_segment_base ph)(elf64_segment_size ph))
        then Some ( Coq.Init.Peano.plus(elf64_segment_baseph) ( Coq.Init.Peano.minus off(elf64_segment_offset ph)), ph)
        else None
    )(elf64_file_interpreted_segments f).
(* [?]: removed value specification. *)

Definition gensym  (hint : string )  : string :=  hint.
(* [?]: removed value specification. *)

Definition extract_symbol  (symtab_triple : (list (elf64_symbol_table_entry )*string_table *nat ) % type) (symidx : nat )  : option ((string *elf64_symbol_table_entry ) % type) :=  
  match ( symtab_triple) with (symtab,  strtab,  scnidx) =>
    match ( index0 symidx symtab) with Some ent =>
      match ( (get_string_at (nat_of_elf64_word (elf64_st_name ent)) strtab)) with
          Success str => Some (str, ent) | Fail _ =>
        Some ("", ent) (* ELF doesn't distinguish "no string" from "empty string" *)
      end | None => None end end.
(* [?]: removed value specification. *)

Definition extract_satisfying_symbols  (symtab_triple : (list (elf64_symbol_table_entry )*string_table *nat ) % type) (pred : elf64_symbol_table_entry  -> bool )  : list ((string *elf64_symbol_table_entry *nat *nat ) % type):=  
  match ( symtab_triple) with (symtab,  strtab,  scnidx) =>
    (*let _ = Missing_pervasives.errln ("extracting satisfying symbols from symtab index " ^ (show scnidx) ^ ", size "
        ^ (show (length symtab)) )
    in*)
    mapMaybei
      (fun (symidx : nat ) =>
         (fun (ent : elf64_symbol_table_entry ) =>
            (match ( (get_string_at (nat_of_elf64_word (elf64_st_name ent))
                        strtab)) with Success str =>
               (* exclude those that don't match *) if (pred ent) then
                 Some (str, ent, scnidx, symidx) else None | Fail s =>
               (*let _ = Missing_pervasives.errln ("couldn't get string from strtab of symtab with index " ^ (show scnidx)
                ^ ": " ^ s) in *)
             None end) )) symtab end.
(* [?]: removed value specification. *)

Definition extract_all_symbols  (symtab_triple : (elf64_symbol_table *string_table *nat ) % type)  : list ((string *elf64_symbol_table_entry *nat *nat ) % type):=  extract_satisfying_symbols symtab_triple (fun  _ : elf64_symbol_table_entry  => true). 

Definition definitions_pred   : elf64_symbol_table_entry  -> bool :=  fun (ent : elf64_symbol_table_entry ) => negb (beq_nat (nat_of_elf64_half(elf64_st_shndx ent)) stn_undef). 
Definition references_pred   : elf64_symbol_table_entry  -> bool :=  fun (ent : elf64_symbol_table_entry ) => beq_nat (nat_of_elf64_half(elf64_st_shndx ent)) stn_undef && (negb (is_elf64_null_entry ent)).
(* [?]: removed value specification. *)

Definition extract_definitions_from_symtab_of_type  (t : nat ) (e : elf64_file )  : list (symbol_definition ):=  
    match ( (find_elf64_symtab_by_type t e >>= (fun (symtab : (elf64_symbol_table *string_table *nat ) % type) => (
        let allsyms
         := extract_satisfying_symbols symtab definitions_pred
        in
        let extracted
         := mapMaybei (fun (i : nat ) => (
  fun (p : (string *elf64_symbol_table_entry *nat *nat ) % type) =>
    match ( (p) ) with ( (str,  ent,  scnidx,  symidx)) =>
      Some
        {|def_symname := str ;def_syment := ent ;def_sym_scn := scnidx
        ;def_sym_idx := symidx ;def_linkable_idx :=( 0) |} end)) allsyms
        in return0 extracted
    )))) with  Fail _ => [] | Success x => x end.
(* [?]: removed value specification. *)

Definition extract_references_from_symtab_of_type  (t : nat ) (e : elf64_file )  : list (symbol_reference ):=  
    match ( (find_elf64_symtab_by_type t e >>= (fun (symtab : (elf64_symbol_table *string_table *nat ) % type) => (
    let allsyms
     := extract_satisfying_symbols symtab references_pred
    in
    let extracted := 
        mapMaybei (fun (symidx : nat ) => (
  fun (p : (string *elf64_symbol_table_entry *nat *nat ) % type) =>
    match ( (p) ) with ( (str,  ent,  scnidx,  symidx)) =>
      Some
        {|ref_symname := str ;ref_syment := ent ;ref_sym_scn := scnidx
        ;ref_sym_idx := symidx |} end)) allsyms
    in 
    (*let _ = Missing_pervasives.errs ("Extracted " ^ (show (length allsyms)) ^ " undefined references: "
        ^ (show (List.map (fun (str, _, scnidx, symidx) -> (str, scnidx, symidx)) allsyms)) ^ "\n")
(*       ^ " (syminds "
        ^ (show (List.map (fun extracted -> extracted.ref_sym_idx) x)) ^ ", symnames "
        ^ (show (List.map (fun extracted -> extracted.ref_symname) x)) ^ ")") *)
    
    in*) return0 extracted
    )))) with  Fail _ => [] | Success x => x end.
(* [?]: removed value specification. *)

Definition extract_all_relocs  (fname1 : string ) (e : elf64_file )  : list ((nat *nat *nat *elf64_relocation_a ) % type):=  
    let all_rel_sections := mapMaybei (fun (i : nat ) => (fun (isec1 : elf64_interpreted_section ) => 
        if beq_nat(elf64_section_type isec1) sht_rel then Some (i, isec1) else None
    ))(elf64_file_interpreted_sections e)
    in
    (*let _ = Missing_pervasives.errln ("File " ^ fname ^ " has " ^ (show (length all_rel_sections)) ^ 
        " rel sections (indices " ^ (show (List.map (fun (scn, _) -> scn) all_rel_sections)) ^ ")")
    in*)
    let all_rela_sections := mapMaybei (fun (i : nat ) => (fun (isec1 : elf64_interpreted_section ) => 
        if beq_nat(elf64_section_type isec1) sht_rela then Some (i, isec1) else None
    ))(elf64_file_interpreted_sections e) 
    in
    (*let _ = Missing_pervasives.errln ("File " ^ fname ^ " has " ^ (show (length all_rela_sections)) ^ 
        " rela sections (indices " ^ (show (List.map (fun (scn, _) -> scn) all_rela_sections)) ^ ")")
    in*)
    let rel_to_rela := fun (rel : elf64_relocation ) => {|elf64_ra_offset :=(elf64_r_offset rel)
       ;elf64_ra_info   :=(elf64_r_info rel)
       ;elf64_ra_addend := (elf64_sxword_of_int((Zpred (Zpos (P_of_succ_nat 0)))))
    |}
    in
    let endian := get_elf64_header_endianness(elf64_file_header e)
    in
    (* Build per-section lists of rels paired with their originating section id.
     * We also pair each element with its index *in that section*, and then flatten
     * the whole lot using mapConcat. *)
    let all_rels_list := list_reverse_concat_map (
  fun (p : (nat *elf64_interpreted_section ) % type) =>
    match ( (p) ) with ( (scn,  isec1)) =>
      match ( read_elf64_relocation_section (elf64_section_size isec1) 
              endian (elf64_section_body isec1)) with Success (relocs,  _) =>
        (*let _ = Missing_pervasives.errln ("Rel section with index " ^ (show scn) ^ " has " ^ (show (length relocs)) ^ 
                    " entries")
                in*)
        mapMaybei
          (fun (idx1 : nat ) =>
             (fun (rel : elf64_relocation ) =>
                Some (scn, idx1,(elf64_section_info isec1), rel_to_rela rel)))
          relocs | Fail _ => [] end end) all_rel_sections
    in 
    let all_relas_list := list_reverse_concat_map (
  fun (p : (nat *elf64_interpreted_section ) % type) =>
    match ( (p) ) with ( (scn,  isec1)) =>
      match ( read_elf64_relocation_a_section (elf64_section_size isec1)
                endian (elf64_section_body isec1)) with
          Success (relocs,  _) =>
        (*let _ = Missing_pervasives.errln ("Rela section with index " ^ (show scn) ^ " has " ^ (show (length relocs)) ^ 
                " entries")
            in*)
        mapMaybei
          (fun (idx1 : nat ) =>
             (fun (rela : elf64_relocation_a ) =>
                Some (scn, idx1,(elf64_section_info isec1), rela))) relocs
        | Fail _ => [] end end) all_rela_sections
    in
     (@ List.app _)all_rels_list all_relas_list.
(* [?]: removed value specification. *)

Definition extract_all_relocs_as_symbol_references  (fname1 : string ) (e : elf64_file )
 : list (symbol_reference_and_reloc_site ):=    let all_relocs := extract_all_relocs fname1 e
    in
    let all_symtab_triples_by_scnidx := mapMaybei (fun (scnidx : nat ) => (fun (isec1 : elf64_interpreted_section ) =>
        if beq_nat(elf64_section_type isec1) sht_symtab
        then
            let found := find_elf64_symbols_by_symtab_idx scnidx e
            in
            match ( found) with  
                Fail _ => None
                | Success triple => Some (scnidx, triple)
            end
        else None
    ))(elf64_file_interpreted_sections e)
    in
    let all_extracted_symtabs_by_scnidx
     := List.fold_left (fun (acc : fmap (nat ) (list ((string *elf64_symbol_table_entry *nat *nat ) % type))) => (
  fun (p : (nat *((elf64_symbol_table *string_table *nat ) % type)) % type) =>
    match ( (p) ) with ( (scnidx,  triple)) =>
      fmap_add scnidx (extract_all_symbols triple) acc end)) all_symtab_triples_by_scnidx fmap_empty
    in
    (*let _ = Missing_pervasives.errln ("All extracted symtabs by scnidx: " ^ (show (Set_extra.toList (Map.toSet all_extracted_symtabs_by_scnidx))))
    in*)
    let ref_for_relocation_a_in_section_index := fun (rel_scn_idx : nat ) => (fun (rel_idx : nat ) => (fun (rela : elf64_relocation_a ) => 
        let rela_isec := match ( index0 rel_scn_idx(elf64_file_interpreted_sections e)) with 
            Some x => x
            | None => DAEMON
        end
        in
        let symtab_idx :=(elf64_section_link rela_isec)
        in
        match ( (fmap_lookup_by (genericCompare nat_ltb beq_nat) symtab_idx all_extracted_symtabs_by_scnidx)) with 
            None => DAEMON
            | Some quads =>
                let sym_idx := get_elf64_relocation_a_sym rela
                in
                let maybe_quad := missing_pervasives.index0 sym_idx quads
                in
                match ( maybe_quad) with 
                    Some(symname,  syment,  scnidx,  symidx) => {|ref_symname := symname
                         ;ref_syment := syment
                         ;ref_sym_scn := symtab_idx
                         ;ref_sym_idx := sym_idx
                         |}
                    | None => DAEMON (*("reloc at index " ^ (show rel_idx) ^ " references symbol (index " ^ (show sym_idx) ^ 
                        ") that does not exist: symtab (index " ^ (show symtab_idx) ^ ") has " ^ (show (length quads)) ^ " entries")*)
                end
        end
    ))
    in
    (*let _ = Missing_pervasives.errs ("Extracted " ^ (show (length all_relocs)) ^ " reloc references (rel_scn, rel_idx, src_scn): "
        ^ (show (List.map (fun (rel_scn, rel_idx, srcscn, rela) -> (rel_scn, rel_idx, srcscn)) all_relocs)) ^ "\n")
    in*)
    List.map (fun (p : (nat *nat *nat *elf64_relocation_a ) % type) =>
  match ( (p) ) with ( (scn,  idx1,  srcscn,  rela)) =>
    {|ref := ( (* NOTE that a reference is not necessarily to an undefined symbol! *) ref_for_relocation_a_in_section_index
                 scn idx1 rela)
  ;maybe_reloc := (Some
                     {|ref_relent := rela ;ref_rel_scn := scn
                     ;ref_rel_idx := idx1
                     ;ref_src_scn := srcscn (* what section does the reference come from? it's the 'info' link of the rel section header *)
                     |}) ;maybe_def_bound_to := None |} end) all_relocs.
