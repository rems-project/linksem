chapter {* Generated by Lem from elf_memory_image.lem. *}

theory "Elf_memory_image" 

imports 
 	 Main
	 "../../lem-libs/isabelle-lib/Lem_num" 
	 "../../lem-libs/isabelle-lib/Lem_list" 
	 "../../lem-libs/isabelle-lib/Lem_set" 
	 "../../lem-libs/isabelle-lib/Lem_function" 
	 "../../lem-libs/isabelle-lib/Lem_basic_classes" 
	 "../../lem-libs/isabelle-lib/Lem_bool" 
	 "../../lem-libs/isabelle-lib/Lem_maybe" 
	 "../../lem-libs/isabelle-lib/Lem_string" 
	 "../../lem-libs/isabelle-lib/Lem_assert_extra" 
	 "Show" 
	 "../../lem-libs/isabelle-lib/Lem_sorting" 
	 "Missing_pervasives" 
	 "Error" 
	 "Byte_sequence" 
	 "Endianness" 
	 "Elf_types_native_uint" 
	 "Default_printing" 
	 "../../lem-libs/isabelle-lib/Lem_tuple" 
	 "Elf_header" 
	 "String_table" 
	 "../../lem-libs/isabelle-lib/Lem_map" 
	 "Elf_program_header_table" 
	 "Elf_section_header_table" 
	 "Elf_interpreted_section" 
	 "Elf_interpreted_segment" 
	 "Elf_symbol_table" 
	 "Elf_file" 
	 "Elf_relocation" 
	 "Memory_image" 
	 "Abis" 

begin 

(*open import Basic_classes*)
(*open import Function*)
(*open import String*)
(*open import Tuple*)
(*open import Bool*)
(*open import List*)
(*open import Sorting*)
(*open import Map*)
(*import Set*)
(*open import Num*)
(*open import Maybe*)
(*open import Assert_extra*)

(*open import Byte_sequence*)
(*open import Default_printing*)
(*open import Error*)
(*open import Missing_pervasives*)
(*open import Show*)
(*open import Endianness*)

(*open import Elf_header*)
(*open import Elf_file*)
(*open import Elf_interpreted_section*)
(*open import Elf_interpreted_segment*)
(*open import Elf_section_header_table*)
(*open import Elf_program_header_table*)
(*open import Elf_symbol_table*)
(*open import Elf_types_native_uint*)
(*open import Elf_relocation*)
(*open import String_table*)

(*open import Memory_image*)
(*open import Abis*)

type_synonym elf_memory_image =" any_abi_feature annotated_memory_image "

definition elf_section_is_special0  :: " elf64_interpreted_section \<Rightarrow> 'a \<Rightarrow> bool "  where 
     " elf_section_is_special0 s f = ( \<not> ((elf64_section_type   s) = sht_progbits)
                     \<and> \<not> ((elf64_section_type   s) = sht_nobits))"


(*val noop_reloc : forall 'abifeature. natural -> ((maybe elf64_symbol_table_entry -> natural) * (annotated_memory_image 'abifeature -> maybe natural))*)
definition noop_reloc0  :: " nat \<Rightarrow>((elf64_symbol_table_entry)option \<Rightarrow> nat)*('abifeature annotated_memory_image \<Rightarrow>(nat)option)"  where 
     " noop_reloc0 r = ( ((\<lambda> r_type . ( 8 :: nat)), (\<lambda> sym_val .  None)))"


definition empty_elf_memory_image  :: "(any_abi_feature)annotated_memory_image "  where 
     " empty_elf_memory_image = ( (|
      elements         = Map.empty
    , by_range         = {}
    , by_tag           = {}
|) )"


(* HMM. For the elf_ident, I don't really want to express it this way.
 * I want something more bidirectional: something that can tell me 
 * not only that a given ident is valid for a given ABI, but also, 
 * to *construct* an ident for a given abstract ELF file satisfying x.
 * This is very much like a lens. 
 * 
 * Similarly for relocs, I might want a way to map back to an allowable
 * *concrete* representation, from some *abstract* description of the 
 * reloc's intent (i.e. a symbol binding: point this reference at symbol
 * Foo), given the constraints imposed by the ABI (such as use only 
 * RELA, not rel. FIXME: figure out how to lensify what we're doing. *) 

type_synonym elf_range_tag =" any_abi_feature range_tag "

definition null_section_header_table  :: " elf_file_feature "  where 
     " null_section_header_table = ( ElfSectionHeaderTable([]))"

definition null_program_header_table  :: " elf_file_feature "  where 
     " null_program_header_table = ( ElfProgramHeaderTable([]))"

definition null_elf_header  :: " elf64_header "  where 
     " null_elf_header = ( (| 
     elf64_ident    = []
   , elf64_type     = (Elf_Types_Local.uint16_of_nat(( 0 :: nat)))  
   , elf64_machine  = (Elf_Types_Local.uint16_of_nat(( 0 :: nat)))  
   , elf64_version  = (Elf_Types_Local.uint32_of_nat(( 0 :: nat)))  
   , elf64_entry    = (Elf_Types_Local.uint64_of_nat(( 0 :: nat)))  
   , elf64_phoff    = (Elf_Types_Local.uint64_of_nat(( 0 :: nat)))   
   , elf64_shoff    = (Elf_Types_Local.uint64_of_nat(( 0 :: nat)))   
   , elf64_flags    = (Elf_Types_Local.uint32_of_nat(( 0 :: nat)))  
   , elf64_ehsize   = (Elf_Types_Local.uint16_of_nat(( 0 :: nat)))  
   , elf64_phentsize= (Elf_Types_Local.uint16_of_nat(( 0 :: nat)))  
   , elf64_phnum    = (Elf_Types_Local.uint16_of_nat(( 0 :: nat)))  
   , elf64_shentsize= (Elf_Types_Local.uint16_of_nat(( 0 :: nat)))  
   , elf64_shnum    = (Elf_Types_Local.uint16_of_nat(( 0 :: nat)))  
   , elf64_shstrndx = (Elf_Types_Local.uint16_of_nat(( 0 :: nat)))  
   |) )"


(* Here we build the image of a file in file offset space. 
 * To transform to memory space, we
 * 
 * - switch positions to be addresses
 * - switch lengths of nobits etc. to be memory lengths
 * - PROBLEM: an offset might map to >1 virtual address.
 *   So we have to clone it as multiple elements.
 *   Each gets a label identifying the file feature it came from
 *   -- i.e. sections, ELF header, SHT and PHT are all file features.
 * - PROBLEM: the memory image might only contain part of an element.
 *   We need to reflect this truncatedness somehow in the label.
 * 
 * Is the offset-space view really useful?
 * SORT OF: want to be able to make an image out of relocatable ELF files
 * that have no address assignments or phdrs yet.
 * AHA. NO. This is not an offset-space view; it's a sectionwise memory view.
 * All allocatable sections become elements with Nothing as their address.
 * The remainder of the ELF file *should* be represented as labels.
 * But, hmm, some stuff like the ELF header and SHT will likely get discarded.
 * 
 * In short, we should work entirely with memory space.
 * Then
 * 
 * - do we want to encode the aliasing of multiple virtual addresses
 *   down to single features in offset-space, like multiple mappings
 *   of the ELF header, say?
 *)

(*val offset_to_vaddr_mappings : elf64_file -> natural -> list (natural * elf64_interpreted_segment)*)
definition offset_to_vaddr_mappings  :: " elf64_file \<Rightarrow> nat \<Rightarrow>(nat*elf64_interpreted_segment)list "  where 
     " offset_to_vaddr_mappings f off = ( 
    Lem_list.mapMaybe (\<lambda> ph . 
        if (off \<ge>(elf64_segment_offset   ph))
            \<and> (off < ((elf64_segment_base   ph) +(elf64_segment_size   ph)))
        then Some (((elf64_segment_base   ph) + (off -(elf64_segment_offset   ph))), ph)
        else None
    )(elf64_file_interpreted_segments   f))"


(*val gensym : string -> string*)
definition gensym  :: " string \<Rightarrow> string "  where 
     " gensym hint = ( hint )"
 (* FIXME: remember duplicates *)

(*val extract_symbol : (elf64_symbol_table * string_table * natural) -> natural -> maybe (string * elf64_symbol_table_entry)*)
definition extract_symbol  :: "(elf64_symbol_table_entry)list*string_table*nat \<Rightarrow> nat \<Rightarrow>(string*elf64_symbol_table_entry)option "  where 
     " extract_symbol symtab_triple symidx = ( 
    (let (symtab, strtab, scnidx) = symtab_triple
    in
    (case  Elf_Types_Local.index symtab symidx of
        Some ent => 
            (case  (get_string_at (unat(elf64_st_name   ent)) strtab) of
                Success str => Some (str, ent)
                | Fail _ => Some ((''''), ent)    (* ELF doesn't distinguish no string from empty string *)
            )
      | None => None
    )))"


(*val extract_satisfying_symbols : (elf64_symbol_table * string_table * natural) ->
    (elf64_symbol_table_entry -> bool) -> list (string * elf64_symbol_table_entry * natural (* scnidx *) * natural (* symidx *))*)
definition extract_satisfying_symbols  :: "(elf64_symbol_table_entry)list*string_table*nat \<Rightarrow>(elf64_symbol_table_entry \<Rightarrow> bool)\<Rightarrow>(string*elf64_symbol_table_entry*nat*nat)list "  where 
     " extract_satisfying_symbols symtab_triple pred = (
    (let (symtab, strtab, scnidx) = symtab_triple
    in
    (*let _ = Missing_pervasives.errln (extracting satisfying symbols from symtab index  ^ (show scnidx) ^ , size 
        ^ (show (length symtab)) )
    in*)
    mapMaybei (\<lambda> symidx .  (\<lambda> ent . 
        ((case  (get_string_at (unat(elf64_st_name   ent)) strtab) of
            Success str =>
                (* exclude those that don't match *) 
                if (pred ent)
                then Some(str, ent, scnidx, symidx)
                else None
            | Fail s => (*let _ = Missing_pervasives.errln (couldn't get string from strtab of symtab with index  ^ (show scnidx)
                ^ :  ^ s) in *)
                None
        ))
        )) symtab))"

        
(*val extract_all_symbols : (elf64_symbol_table * string_table * natural) -> list (string * elf64_symbol_table_entry * natural (* scnidx *) * natural (* symidx *))*)
definition extract_all_symbols  :: " elf64_symbol_table*string_table*nat \<Rightarrow>(string*elf64_symbol_table_entry*nat*nat)list "  where 
     " extract_all_symbols symtab_triple = ( extract_satisfying_symbols symtab_triple (\<lambda> _ .  True))"
 

definition definitions_pred  :: " elf64_symbol_table_entry \<Rightarrow> bool "  where 
     " definitions_pred = ( \<lambda> ent .  \<not> ((unat(elf64_st_shndx   ent)) = stn_undef))"
 
definition references_pred  :: " elf64_symbol_table_entry \<Rightarrow> bool "  where 
     " references_pred = ( \<lambda> ent .  ((unat(elf64_st_shndx   ent)) = stn_undef) \<and> (\<not> (is_elf64_null_entry ent)))"


(*val extract_definitions_from_symtab_of_type : natural -> elf64_file -> list symbol_definition*)
definition extract_definitions_from_symtab_of_type  :: " nat \<Rightarrow> elf64_file \<Rightarrow>(symbol_definition)list "  where 
     " extract_definitions_from_symtab_of_type t e = ( 
    (case  (find_elf64_symtab_by_type t e >>= (\<lambda> symtab .  (
        (let (allsyms :: (string * elf64_symbol_table_entry * nat (* scnidx *) * nat (* symidx *)) list)
         = (extract_satisfying_symbols symtab definitions_pred)
        in
        (let (extracted :: symbol_definition list)
         = (mapMaybei (\<lambda> i .  (\<lambda> (str, ent, scnidx, symidx) .  Some (|
                   def_symname = str
                 , def_syment = ent
                 , def_sym_scn = scnidx
                 , def_sym_idx = symidx
                 , def_linkable_idx =(( 0 :: nat))
                 |))) allsyms)
        in error_return extracted))
    ))) of Fail _ => [] | Success x => x ))"


(*val extract_references_from_symtab_of_type : natural -> elf64_file -> list symbol_reference*)
definition extract_references_from_symtab_of_type  :: " nat \<Rightarrow> elf64_file \<Rightarrow>(symbol_reference)list "  where 
     " extract_references_from_symtab_of_type t e = ( 
    (case  (find_elf64_symtab_by_type t e >>= (\<lambda> symtab .  (
    (let (allsyms :: (string * elf64_symbol_table_entry * nat (* scnidx *) * nat (* symidx *)) list)
     = (extract_satisfying_symbols symtab references_pred)
    in
    (let (extracted :: symbol_reference list) =        
 (mapMaybei (\<lambda> symidx .  (\<lambda> (str, ent, scnidx, symidx) .  Some (|
                   ref_symname = str
                 , ref_syment = ent
                 , ref_sym_scn = scnidx
                 , ref_sym_idx = symidx
                 |))) allsyms)
    in 
    (*let _ = Missing_pervasives.errs (Extracted  ^ (show (length allsyms)) ^  undefined references: 
        ^ (show (List.map (fun (str, _, scnidx, symidx) -> (str, scnidx, symidx)) allsyms)) ^ n)
(*       ^  (syminds 
        ^ (show (List.map (fun extracted -> extracted.ref_sym_idx) x)) ^ , symnames 
        ^ (show (List.map (fun extracted -> extracted.ref_symname) x)) ^ )) *)
    
    in*) error_return extracted))
    ))) of Fail _ => [] | Success x => x ))"


(*val extract_all_relocs : string -> elf64_file -> list (natural (* scn *) * natural (* rel idx *) * natural (* rel src scn *) * elf64_relocation_a)*)
definition extract_all_relocs  :: " string \<Rightarrow> elf64_file \<Rightarrow>(nat*nat*nat*elf64_relocation_a)list "  where 
     " extract_all_relocs fname1 e = ( 
    (let (all_rel_sections :: (nat * elf64_interpreted_section) list) = (mapMaybei (\<lambda> i .  (\<lambda> isec1 .  
        if(elf64_section_type   isec1) = sht_rel then Some (i, isec1) else None
    ))(elf64_file_interpreted_sections   e))
    in
    (*let _ = Missing_pervasives.errln (File  ^ fname ^  has  ^ (show (length all_rel_sections)) ^ 
         rel sections (indices  ^ (show (List.map (fun (scn, _) -> scn) all_rel_sections)) ^ ))
    in*)
    (let (all_rela_sections :: (nat * elf64_interpreted_section) list) = (mapMaybei (\<lambda> i .  (\<lambda> isec1 .  
        if(elf64_section_type   isec1) = sht_rela then Some (i, isec1) else None
    ))(elf64_file_interpreted_sections   e)) 
    in
    (*let _ = Missing_pervasives.errln (File  ^ fname ^  has  ^ (show (length all_rela_sections)) ^ 
         rela sections (indices  ^ (show (List.map (fun (scn, _) -> scn) all_rela_sections)) ^ ))
    in*)
    (let rel_to_rela = (\<lambda> rel .  (|
         elf64_ra_offset =(elf64_r_offset   rel)
       , elf64_ra_info   =(elf64_r_info   rel)
       , elf64_ra_addend = (of_int(( 0 :: int)))
    |))
    in
    (let endian = (get_elf64_header_endianness(elf64_file_header   e))
    in
    (* Build per-section lists of rels paired with their originating section id.
     * We also pair each element with its index *in that section*, and then flatten
     * the whole lot using mapConcat. *)
    (let (all_rels_list :: (nat * nat * nat * elf64_relocation_a) list) = (list_reverse_concat_map (\<lambda> (scn, isec1) .  
        (case  read_elf64_relocation_section(elf64_section_size     isec1) endian(elf64_section_body   isec1)
        of
            Success (relocs, _) => 
                (*let _ = Missing_pervasives.errln (Rel section with index  ^ (show scn) ^  has  ^ (show (length relocs)) ^ 
                     entries)
                in*)
                mapMaybei (\<lambda> idx1 .  (\<lambda> rel .  Some (scn, idx1,(elf64_section_info   isec1), rel_to_rela rel))) relocs
            | Fail _ => []
        )) all_rel_sections)
    in 
    (let (all_relas_list :: (nat * nat * nat * elf64_relocation_a) list) = (list_reverse_concat_map (\<lambda> (scn, isec1) .  
        (case  read_elf64_relocation_a_section(elf64_section_size   isec1) endian(elf64_section_body   isec1)
        of
            Success (relocs, _) => 
            (*let _ = Missing_pervasives.errln (Rela section with index  ^ (show scn) ^  has  ^ (show (length relocs)) ^ 
                 entries)
            in*)
            mapMaybei (\<lambda> idx1 .  (\<lambda> rela .  Some (scn, idx1,(elf64_section_info   isec1), rela))) relocs
            | Fail _ => []
        )) all_rela_sections)
    in
    all_rels_list @ all_relas_list)))))))"


(*val extract_all_relocs_as_symbol_references : string -> elf64_file -> list symbol_reference_and_reloc_site*)
definition extract_all_relocs_as_symbol_references  :: " string \<Rightarrow> elf64_file \<Rightarrow>(symbol_reference_and_reloc_site)list " 
where 
     " extract_all_relocs_as_symbol_references fname1 e
= (   (let all_relocs = (extract_all_relocs fname1 e)
    in
    (let all_symtab_triples_by_scnidx = (mapMaybei (\<lambda> scnidx .  (\<lambda> isec1 . 
        if(elf64_section_type   isec1) = sht_symtab
        then
            (let found = (find_elf64_symbols_by_symtab_idx scnidx e)
            in
            (case  found of 
                Fail _ => None
                | Success triple => Some (scnidx, triple)
            ))
        else None
    ))(elf64_file_interpreted_sections   e))
    in
    (let (all_extracted_symtabs_by_scnidx :: ( (nat, ( (string * elf64_symbol_table_entry * nat (* scnidx *) * nat (* symidx *))list))Map.map))
     = (List.foldl (\<lambda> acc1 .  (\<lambda> (scnidx, triple) .  map_update scnidx (extract_all_symbols triple) acc1)) Map.empty all_symtab_triples_by_scnidx)
    in
    (*let _ = Missing_pervasives.errln (All extracted symtabs by scnidx:  ^ (show (Set_extra.toList (Map.toSet all_extracted_symtabs_by_scnidx))))
    in*)
    (let ref_for_relocation_a_in_section_index = (\<lambda> rel_scn_idx .  (\<lambda> rel_idx .  (\<lambda> rela .  
        (let rela_isec = ((case  Elf_Types_Local.index(elf64_file_interpreted_sections   e) rel_scn_idx of
            Some x => x
            | None => failwith (''relocation references nonexistent section'')
        ))
        in
        (let symtab_idx = ((elf64_section_link   rela_isec))
        in
        (case   all_extracted_symtabs_by_scnidx symtab_idx of
            None => failwith (''referenced symtab does not exist'')
            | Some quads =>
                (let sym_idx = (get_elf64_relocation_a_sym rela)
                in
                (let maybe_quad = (Elf_Types_Local.index quads sym_idx)
                in
                (case  maybe_quad of
                    Some(symname, syment, scnidx, symidx) => (|
                           ref_symname = symname
                         , ref_syment = syment
                         , ref_sym_scn = symtab_idx
                         , ref_sym_idx = sym_idx
                         |)
                    | None => failwith (''reloc references symbol that does not exist'') (*(reloc at index  ^ (show rel_idx) ^  references symbol (index  ^ (show sym_idx) ^ 
                        ) that does not exist: symtab (index  ^ (show symtab_idx) ^ ) has  ^ (show (length quads)) ^  entries)*)
                )))
        )))
    )))
    in
    (*let _ = Missing_pervasives.errs (Extracted  ^ (show (length all_relocs)) ^  reloc references (rel_scn, rel_idx, src_scn): 
        ^ (show (List.map (fun (rel_scn, rel_idx, srcscn, rela) -> (rel_scn, rel_idx, srcscn)) all_relocs)) ^ n)
    in*)
    List.map (\<lambda> (scn, idx1, srcscn, rela) .  (|
          ref = ( (* NOTE that a reference is not necessarily to an undefined symbol! *)ref_for_relocation_a_in_section_index scn idx1 rela)
        , maybe_reloc = (Some 
           (| ref_relent = rela
            , ref_rel_scn = scn
            , ref_rel_idx = idx1
            , ref_src_scn = srcscn (* what section does the reference come from? it's the 'info' link of the rel section header *)
            |))
        , maybe_def_bound_to = None
        |)) all_relocs)))))"

end
