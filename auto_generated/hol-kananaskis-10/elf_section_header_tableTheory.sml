structure elf_section_header_tableTheory :> elf_section_header_tableTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading elf_section_header_tableTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open elf_headerTheory elf_program_header_tableTheory lem_mapTheory
             string_tableTheory
  in end;
  val _ = Theory.link_parents
          ("elf_section_header_table",
          Arbnum.fromString "1445438821",
          Arbnum.fromString "375061")
          [("string_table",
           Arbnum.fromString "1445438794",
           Arbnum.fromString "925999"),
           ("lem_map",
           Arbnum.fromString "1445005533",
           Arbnum.fromString "833263"),
           ("elf_program_header_table",
           Arbnum.fromString "1445438804",
           Arbnum.fromString "927331"),
           ("elf_header",
           Arbnum.fromString "1445438753",
           Arbnum.fromString "972064")];
  val _ = Theory.incorporate_types "elf_section_header_table"
       [("elf64_section_header_table_entry", 0),
        ("elf64_compression_header", 0),
        ("elf32_section_header_table_entry", 0),
        ("elf32_compression_header", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("num", "num"), ID("min", "fun"),
   ID("elf_section_header_table", "elf64_section_header_table_entry"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
   ID("min", "bool"),
   ID("elf_section_header_table", "elf64_compression_header"),
   ID("elf_section_header_table", "elf32_section_header_table_entry"),
   ID("elf_section_header_table", "elf32_compression_header"),
   ID("error", "error"), ID("pair", "prod"),
   ID("byte_sequence", "byte_sequence"), ID("endianness", "endianness"),
   ID("list", "list"),
   ID("elf_program_header_table", "elf64_program_header_table_entry"),
   ID("elf_program_header_table", "elf32_program_header_table_entry"),
   ID("lem_basic_classes", "Ord_class"), ID("string", "char"),
   ID("string_table", "string_table"), ID("finite_map", "fmap"),
   ID("lem_basic_classes", "ordering"), ID("ind_type", "recspace"),
   ID("min", "ind"), ID("bool", "!"), ID("arithmetic", "*"),
   ID("arithmetic", "+"), ID("pair", ","), ID("bool", "/\\"),
   ID("num", "0"), ID("prim_rec", "<"), ID("min", "="), ID("min", "==>"),
   ID("bool", "?"), ID("min", "@"), ID("bool", "ARB"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("arithmetic", "DIV"), ID("pred_set", "EMPTY"),
   ID("lem_basic_classes", "EQ"), ID("bool", "F"),
   ID("finite_map", "FEMPTY"), ID("list", "FILTER"),
   ID("finite_map", "FUPDATE_LIST"), ID("lem_basic_classes", "GT"),
   ID("combin", "I"), ID("bool", "IN"), ID("pred_set", "INSERT"),
   ID("combin", "K"), ID("list", "LENGTH"), ID("bool", "LET"),
   ID("lem_basic_classes", "LT"), ID("list", "MAP"),
   ID("arithmetic", "MOD"), ID("list", "NIL"), ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("bool", "T"), ID("bool", "TYPE_DEFINITION"), ID("pair", "UNCURRY"),
   ID("relation", "WF"), ID("relation", "WFREC"), ID("arithmetic", "ZERO"),
   ID("bool", "\\/"), ID("elf_types_native_uint", "bytes_of_elf32_addr"),
   ID("elf_types_native_uint", "bytes_of_elf32_off"),
   ID("elf_section_header_table", "bytes_of_elf32_section_header_table"),
   ID("elf_section_header_table", "bytes_of_elf32_section_header_table_entry"),
   ID("elf_types_native_uint", "bytes_of_elf32_word"),
   ID("elf_types_native_uint", "bytes_of_elf64_addr"),
   ID("elf_types_native_uint", "bytes_of_elf64_off"),
   ID("elf_section_header_table", "bytes_of_elf64_section_header_table"),
   ID("elf_section_header_table", "bytes_of_elf64_section_header_table_entry"),
   ID("elf_types_native_uint", "bytes_of_elf64_word"),
   ID("elf_types_native_uint", "bytes_of_elf64_xword"),
   ID("elf_section_header_table", "compare_elf32_section_header_table_entry"),
   ID("elf_section_header_table", "compare_elf64_section_header_table_entry"),
   ID("byte_sequence", "concat0"),
   ID("elf_section_header_table", "elf32_compression_header_CASE"),
   ID("elf_section_header_table", "elf32_compression_header_elf32_chdr_addralign"),
   ID("elf_section_header_table", "elf32_compression_header_elf32_chdr_addralign_fupd"),
   ID("elf_section_header_table", "elf32_compression_header_elf32_chdr_size"),
   ID("elf_section_header_table", "elf32_compression_header_elf32_chdr_size_fupd"),
   ID("elf_section_header_table", "elf32_compression_header_elf32_chdr_type"),
   ID("elf_section_header_table", "elf32_compression_header_elf32_chdr_type_fupd"),
   ID("elf_section_header_table", "elf32_compression_header_size"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_type"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_CASE"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_addr"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_addr_fupd"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_addralign"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_addralign_fupd"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_entsize"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_entsize_fupd"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_flags"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_flags_fupd"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_info"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_info_fupd"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_link"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_link_fupd"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_name"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_name_fupd"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_offset"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_offset_fupd"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_size"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_size_fupd"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_type"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_elf32_sh_type_fupd"),
   ID("elf_section_header_table", "elf32_section_header_table_entry_size"),
   ID("elf_section_header_table", "elf32_size_correct"),
   ID("elf_section_header_table", "elf64_compression_header_CASE"),
   ID("elf_section_header_table", "elf64_compression_header_elf64_chdr_addralign"),
   ID("elf_section_header_table", "elf64_compression_header_elf64_chdr_addralign_fupd"),
   ID("elf_section_header_table", "elf64_compression_header_elf64_chdr_reserved"),
   ID("elf_section_header_table", "elf64_compression_header_elf64_chdr_reserved_fupd"),
   ID("elf_section_header_table", "elf64_compression_header_elf64_chdr_size"),
   ID("elf_section_header_table", "elf64_compression_header_elf64_chdr_size_fupd"),
   ID("elf_section_header_table", "elf64_compression_header_elf64_chdr_type"),
   ID("elf_section_header_table", "elf64_compression_header_elf64_chdr_type_fupd"),
   ID("elf_section_header_table", "elf64_compression_header_size"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_type"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_CASE"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_addr"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_addr_fupd"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_addralign"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_addralign_fupd"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_entsize"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_entsize_fupd"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_flags"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_flags_fupd"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_info"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_info_fupd"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_link"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_link_fupd"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_name"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_name_fupd"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_offset"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_offset_fupd"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_size"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_size_fupd"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_type"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_type_fupd"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_size"),
   ID("elf_section_header_table", "elf64_size_correct"),
   ID("elf_program_header_table", "elf_pt_tls"),
   ID("elf_section_header_table", "elf_special_sections"),
   ID("elf_section_header_table", "elfcompress_hios"),
   ID("elf_section_header_table", "elfcompress_hiproc"),
   ID("elf_section_header_table", "elfcompress_loos"),
   ID("elf_section_header_table", "elfcompress_loproc"),
   ID("elf_section_header_table", "elfcompress_zlib"),
   ID("error", "error_bind"), ID("error", "fail0"),
   ID("byte_sequence", "from_byte_lists"),
   ID("lem_basic_classes", "genericCompare"),
   ID("elf_section_header_table", "get_elf32_section_to_segment_mapping"),
   ID("elf_section_header_table", "get_elf32_section_to_segment_mapping_tupled"),
   ID("elf_section_header_table", "get_elf64_section_to_segment_mapping"),
   ID("elf_section_header_table", "get_elf64_section_to_segment_mapping_tupled"),
   ID("string_table", "get_string_at"),
   ID("elf_section_header_table", "grp_comdat"),
   ID("elf_section_header_table", "grp_maskos"),
   ID("elf_section_header_table", "grp_maskproc"),
   ID("elf_section_header_table", "instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict"),
   ID("elf_section_header_table", "instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict"),
   ID("elf_section_header_table", "is_elf32_addr_addralign_correct"),
   ID("elf_section_header_table", "is_elf32_tbss_special"),
   ID("elf_section_header_table", "is_elf64_addr_addralign_correct"),
   ID("elf_section_header_table", "is_elf64_tbss_special"),
   ID("elf_section_header_table", "is_valid_elf32_section_header_table"),
   ID("elf_section_header_table", "is_valid_elf64_section_header_table"),
   ID("byte_sequence", "length0"), ID("lem_list", "lexicographic_compare"),
   ID("list", "list_CASE"), ID("error", "mapM"), ID("words", "n2w"),
   ID("combin", "o"),
   ID("elf_section_header_table", "obtain_elf32_hash_table"),
   ID("elf_section_header_table", "obtain_elf32_section_group_indices"),
   ID("elf_section_header_table", "obtain_elf32_tls_template"),
   ID("elf_section_header_table", "obtain_elf64_hash_table"),
   ID("elf_section_header_table", "obtain_elf64_section_group_indices"),
   ID("elf_section_header_table", "obtain_elf64_tls_template"),
   ID("byte_sequence", "offset_and_cut"), ID("pair", "pair_CASE"),
   ID("byte_sequence", "partition0"),
   ID("elf_types_native_uint", "read_elf32_addr"),
   ID("elf_section_header_table", "read_elf32_compression_header"),
   ID("elf_types_native_uint", "read_elf32_off"),
   ID("elf_section_header_table", "read_elf32_section_header_table"),
   ID("elf_section_header_table", "read_elf32_section_header_table'"),
   ID("elf_section_header_table", "read_elf32_section_header_table'_tupled"),
   ID("elf_section_header_table", "read_elf32_section_header_table_entry"),
   ID("elf_types_native_uint", "read_elf32_word"),
   ID("elf_types_native_uint", "read_elf64_addr"),
   ID("elf_section_header_table", "read_elf64_compression_header"),
   ID("elf_types_native_uint", "read_elf64_off"),
   ID("elf_section_header_table", "read_elf64_section_header_table"),
   ID("elf_section_header_table", "read_elf64_section_header_table'"),
   ID("elf_section_header_table", "read_elf64_section_header_table'_tupled"),
   ID("elf_section_header_table", "read_elf64_section_header_table_entry"),
   ID("elf_types_native_uint", "read_elf64_word"),
   ID("elf_types_native_uint", "read_elf64_xword"),
   ID("elf_section_header_table", "recordtype.elf32_compression_header"),
   ID("elf_section_header_table", "recordtype.elf32_section_header_table_entry"),
   ID("elf_section_header_table", "recordtype.elf64_compression_header"),
   ID("elf_section_header_table", "recordtype.elf64_section_header_table_entry"),
   ID("error", "repeatM'"), ID("error", "return"),
   ID("elf_section_header_table", "shf_alloc"),
   ID("elf_section_header_table", "shf_compressed"),
   ID("elf_section_header_table", "shf_execinstr"),
   ID("elf_section_header_table", "shf_group"),
   ID("elf_section_header_table", "shf_info_link"),
   ID("elf_section_header_table", "shf_link_order"),
   ID("elf_section_header_table", "shf_mask_os"),
   ID("elf_section_header_table", "shf_mask_proc"),
   ID("elf_section_header_table", "shf_merge"),
   ID("elf_section_header_table", "shf_os_nonconforming"),
   ID("elf_section_header_table", "shf_strings"),
   ID("elf_section_header_table", "shf_tls"),
   ID("elf_section_header_table", "shf_write"),
   ID("elf_section_header_table", "shn_abs"),
   ID("elf_section_header_table", "shn_common"),
   ID("elf_section_header_table", "shn_hios"),
   ID("elf_section_header_table", "shn_hiproc"),
   ID("elf_section_header_table", "shn_hireserve"),
   ID("elf_section_header_table", "shn_loos"),
   ID("elf_section_header_table", "shn_loproc"),
   ID("elf_section_header_table", "shn_loreserve"),
   ID("elf_section_header_table", "sht_dynamic"),
   ID("elf_section_header_table", "sht_dynsym"),
   ID("elf_section_header_table", "sht_fini_array"),
   ID("elf_section_header_table", "sht_group"),
   ID("elf_section_header_table", "sht_hash"),
   ID("elf_section_header_table", "sht_hios"),
   ID("elf_section_header_table", "sht_hiproc"),
   ID("elf_section_header_table", "sht_hiuser"),
   ID("elf_section_header_table", "sht_init_array"),
   ID("elf_section_header_table", "sht_loos"),
   ID("elf_section_header_table", "sht_loproc"),
   ID("elf_section_header_table", "sht_louser"),
   ID("elf_section_header_table", "sht_nobits"),
   ID("elf_section_header_table", "sht_note"),
   ID("elf_section_header_table", "sht_null"),
   ID("elf_section_header_table", "sht_preinit_array"),
   ID("elf_section_header_table", "sht_progbits"),
   ID("elf_section_header_table", "sht_rel"),
   ID("elf_section_header_table", "sht_rela"),
   ID("elf_section_header_table", "sht_shlib"),
   ID("elf_section_header_table", "sht_strtab"),
   ID("elf_section_header_table", "sht_symtab"),
   ID("elf_section_header_table", "sht_symtab_shndx"),
   ID("elf_types_native_uint", "unsafe_natural_land"), ID("words", "w2n"),
   ID("words", "word_and"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYOP [2], TYOP [5], TYOP [4, 2], TYOP [4, 3], TYOP [4, 4],
   TYOP [4, 5], TYOP [4, 6], TYOP [4, 7], TYOP [6], TYOP [3, 9, 8],
   TYOP [1, 10, 1], TYOP [1, 10, 11], TYOP [3, 9, 7], TYOP [1, 13, 12],
   TYOP [1, 13, 14], TYOP [1, 10, 15], TYOP [1, 10, 16], TYOP [1, 10, 17],
   TYOP [1, 10, 18], TYOP [1, 13, 19], TYOP [1, 13, 20], TYOP [7],
   TYOP [1, 10, 22], TYOP [1, 10, 23], TYOP [1, 13, 24], TYOP [1, 13, 25],
   TYOP [8], TYOP [1, 13, 27], TYOP [1, 13, 28], TYOP [1, 13, 29],
   TYOP [1, 13, 30], TYOP [1, 13, 31], TYOP [1, 13, 32], TYOP [1, 13, 33],
   TYOP [1, 13, 34], TYOP [1, 13, 35], TYOP [1, 13, 36], TYOP [9],
   TYOP [1, 13, 38], TYOP [1, 13, 39], TYOP [1, 13, 40], TYOP [12],
   TYOP [11, 1, 42], TYOP [10, 43], TYOP [1, 42, 44], TYOP [13],
   TYOP [1, 46, 45], TYOP [14, 1], TYOP [10, 48], TYOP [11, 46, 42],
   TYOP [1, 50, 49], TYOP [1, 42, 49], TYOP [1, 46, 52], TYOP [11, 48, 42],
   TYOP [10, 54], TYOP [1, 42, 55], TYOP [1, 46, 56], TYOP [1, 0, 57],
   TYOP [11, 22, 42], TYOP [10, 59], TYOP [1, 42, 60], TYOP [1, 46, 61],
   TYOP [11, 27, 42], TYOP [10, 63], TYOP [1, 42, 64], TYOP [1, 46, 65],
   TYOP [14, 27], TYOP [10, 67], TYOP [1, 50, 68], TYOP [1, 42, 68],
   TYOP [1, 46, 70], TYOP [11, 67, 42], TYOP [10, 72], TYOP [1, 42, 73],
   TYOP [1, 46, 74], TYOP [1, 0, 75], TYOP [11, 38, 42], TYOP [10, 77],
   TYOP [1, 42, 78], TYOP [1, 46, 79], TYOP [1, 48, 48], TYV "'a",
   TYOP [3, 9, 82], TYOP [14, 83], TYOP [11, 0, 84], TYOP [14, 85],
   TYOP [10, 86], TYOP [1, 42, 87], TYOP [1, 48, 88], TYOP [1, 46, 89],
   TYV "'d", TYOP [14, 91], TYV "'c", TYOP [14, 93], TYOP [11, 94, 92],
   TYV "'b", TYOP [3, 9, 96], TYOP [11, 97, 95], TYOP [11, 83, 98],
   TYOP [10, 99], TYOP [1, 42, 100], TYOP [1, 48, 101], TYOP [1, 46, 102],
   TYOP [1, 67, 67], TYOP [1, 67, 88], TYOP [1, 46, 105],
   TYOP [1, 67, 101], TYOP [1, 46, 107], TYOP [1, 48, 9], TYOP [1, 67, 9],
   TYOP [15], TYOP [1, 111, 9], TYOP [1, 1, 112], TYOP [1, 1, 9],
   TYOP [16], TYOP [1, 115, 9], TYOP [1, 27, 116], TYOP [1, 27, 9],
   TYOP [17, 1], TYOP [17, 27], TYOP [18], TYOP [14, 121], TYOP [14, 122],
   TYOP [10, 123], TYOP [19], TYOP [1, 82, 113], TYOP [11, 126, 125],
   TYOP [11, 111, 127], TYOP [11, 48, 128], TYOP [11, 82, 129],
   TYOP [1, 130, 124], TYOP [1, 125, 124], TYOP [1, 126, 132],
   TYOP [1, 111, 133], TYOP [1, 48, 134], TYOP [1, 82, 135],
   TYOP [1, 82, 117], TYOP [11, 137, 125], TYOP [11, 115, 138],
   TYOP [11, 67, 139], TYOP [11, 82, 140], TYOP [1, 141, 124],
   TYOP [1, 137, 132], TYOP [1, 115, 143], TYOP [1, 67, 144],
   TYOP [1, 82, 145], TYOP [11, 0, 0], TYOP [20, 122, 147], TYOP [14, 82],
   TYOP [1, 149, 9], TYOP [1, 1, 150], TYOP [1, 1, 0], TYOP [1, 1, 1],
   TYOP [1, 13, 13], TYOP [1, 154, 153], TYOP [1, 1, 13], TYOP [1, 10, 10],
   TYOP [1, 157, 153], TYOP [1, 1, 10], TYOP [1, 10, 82],
   TYOP [1, 10, 160], TYOP [1, 13, 161], TYOP [1, 13, 162],
   TYOP [1, 10, 163], TYOP [1, 10, 164], TYOP [1, 10, 165],
   TYOP [1, 10, 166], TYOP [1, 13, 167], TYOP [1, 13, 168],
   TYOP [1, 169, 82], TYOP [1, 1, 170], TYOP [1, 22, 0], TYOP [1, 22, 22],
   TYOP [1, 154, 173], TYOP [1, 22, 13], TYOP [1, 157, 173],
   TYOP [1, 22, 10], TYOP [1, 163, 82], TYOP [1, 22, 178],
   TYOP [1, 27, 150], TYOP [1, 27, 0], TYOP [1, 27, 27],
   TYOP [1, 154, 182], TYOP [1, 27, 13], TYOP [1, 13, 82],
   TYOP [1, 13, 185], TYOP [1, 13, 186], TYOP [1, 13, 187],
   TYOP [1, 13, 188], TYOP [1, 13, 189], TYOP [1, 13, 190],
   TYOP [1, 13, 191], TYOP [1, 13, 192], TYOP [1, 13, 193],
   TYOP [1, 194, 82], TYOP [1, 27, 195], TYOP [1, 38, 0], TYOP [1, 38, 38],
   TYOP [1, 154, 198], TYOP [1, 38, 13], TYOP [1, 187, 82],
   TYOP [1, 38, 201], TYOP [21], TYOP [1, 1, 203], TYOP [1, 1, 204],
   TYOP [1, 27, 203], TYOP [1, 27, 206], TYOP [1, 1, 42],
   TYOP [1, 46, 208], TYOP [1, 48, 42], TYOP [1, 46, 210],
   TYOP [1, 27, 42], TYOP [1, 46, 212], TYOP [1, 67, 42],
   TYOP [1, 46, 214], TYOP [11, 13, 13], TYOP [11, 13, 216],
   TYOP [22, 217], TYOP [1, 218, 9], TYOP [11, 13, 217],
   TYOP [11, 13, 220], TYOP [11, 13, 221], TYOP [11, 13, 222],
   TYOP [11, 13, 223], TYOP [11, 13, 224], TYOP [11, 13, 225],
   TYOP [22, 226], TYOP [1, 227, 9], TYOP [11, 10, 10], TYOP [11, 13, 229],
   TYOP [11, 13, 230], TYOP [22, 231], TYOP [1, 232, 9],
   TYOP [11, 10, 231], TYOP [11, 10, 234], TYOP [11, 10, 235],
   TYOP [11, 10, 236], TYOP [11, 13, 237], TYOP [11, 13, 238],
   TYOP [22, 239], TYOP [1, 240, 9], TYOP [1, 125, 9], TYOP [1, 137, 242],
   TYOP [1, 115, 243], TYOP [1, 67, 244], TYOP [1, 82, 245],
   TYOP [1, 126, 242], TYOP [1, 111, 247], TYOP [1, 48, 248],
   TYOP [1, 82, 249], TYOP [1, 38, 9], TYOP [1, 22, 9], TYOP [1, 42, 9],
   TYOP [1, 46, 253], TYOP [1, 141, 9], TYOP [1, 141, 255],
   TYOP [1, 130, 9], TYOP [1, 130, 257], TYOP [1, 50, 9],
   TYOP [1, 50, 259], TYOP [23], TYOP [1, 38, 82], TYOP [1, 27, 82],
   TYOP [1, 22, 82], TYOP [1, 1, 82], TYOP [1, 82, 38], TYOP [1, 82, 27],
   TYOP [1, 82, 22], TYOP [1, 82, 1], TYOP [11, 92, 42], TYOP [11, 84, 42],
   TYOP [1, 10, 9], TYOP [1, 10, 272], TYOP [1, 13, 273],
   TYOP [1, 13, 274], TYOP [1, 261, 275], TYOP [1, 10, 275],
   TYOP [1, 10, 277], TYOP [1, 10, 278], TYOP [1, 10, 279],
   TYOP [1, 13, 280], TYOP [1, 13, 281], TYOP [1, 261, 282],
   TYOP [1, 13, 9], TYOP [1, 13, 284], TYOP [1, 13, 285],
   TYOP [1, 261, 286], TYOP [1, 13, 286], TYOP [1, 13, 288],
   TYOP [1, 13, 289], TYOP [1, 13, 290], TYOP [1, 13, 291],
   TYOP [1, 13, 292], TYOP [1, 13, 293], TYOP [1, 261, 294],
   TYOP [1, 38, 218], TYOP [1, 27, 227], TYOP [1, 22, 232],
   TYOP [1, 1, 240], TYOP [1, 82, 9], TYOP [1, 300, 9], TYOP [1, 253, 9],
   TYOP [1, 272, 9], TYOP [1, 284, 9], TYOP [1, 251, 9], TYOP [1, 116, 9],
   TYOP [1, 118, 9], TYOP [1, 252, 9], TYOP [1, 112, 9], TYOP [1, 114, 9],
   TYOP [1, 46, 9], TYOP [1, 311, 9], TYOP [1, 266, 9], TYOP [1, 313, 9],
   TYOP [1, 267, 9], TYOP [1, 315, 9], TYOP [1, 268, 9], TYOP [1, 317, 9],
   TYOP [1, 269, 9], TYOP [1, 319, 9], TYOP [1, 137, 9], TYOP [1, 321, 9],
   TYOP [1, 126, 9], TYOP [1, 323, 9], TYOP [1, 246, 9], TYOP [1, 325, 9],
   TYOP [1, 250, 9], TYOP [1, 327, 9], TYOP [1, 157, 9], TYOP [1, 329, 9],
   TYOP [1, 154, 9], TYOP [1, 331, 9], TYOP [1, 163, 9], TYOP [1, 333, 9],
   TYOP [1, 169, 9], TYOP [1, 335, 9], TYOP [1, 187, 9], TYOP [1, 337, 9],
   TYOP [1, 194, 9], TYOP [1, 339, 9], TYOP [1, 305, 9], TYOP [1, 307, 9],
   TYOP [1, 308, 9], TYOP [1, 310, 9], TYOP [1, 254, 9], TYOP [1, 345, 9],
   TYOP [1, 219, 9], TYOP [1, 347, 9], TYOP [1, 233, 9], TYOP [1, 349, 9],
   TYOP [1, 241, 9], TYOP [1, 351, 9], TYOP [1, 228, 9], TYOP [1, 353, 9],
   TYOP [1, 150, 9], TYOP [1, 110, 9], TYOP [1, 109, 9], TYOP [1, 0, 9],
   TYOP [1, 358, 9], TYOP [1, 242, 9], TYOP [1, 0, 0], TYOP [1, 0, 361],
   TYOP [1, 140, 141], TYOP [1, 82, 363], TYOP [1, 129, 130],
   TYOP [1, 82, 365], TYOP [1, 98, 99], TYOP [1, 83, 367],
   TYOP [1, 95, 98], TYOP [1, 97, 369], TYOP [1, 10, 229],
   TYOP [1, 10, 371], TYOP [1, 236, 237], TYOP [1, 10, 373],
   TYOP [1, 235, 236], TYOP [1, 10, 375], TYOP [1, 234, 235],
   TYOP [1, 10, 377], TYOP [1, 231, 234], TYOP [1, 10, 379],
   TYOP [1, 13, 216], TYOP [1, 13, 381], TYOP [1, 229, 230],
   TYOP [1, 13, 383], TYOP [1, 237, 238], TYOP [1, 13, 385],
   TYOP [1, 216, 217], TYOP [1, 13, 387], TYOP [1, 230, 231],
   TYOP [1, 13, 389], TYOP [1, 238, 239], TYOP [1, 13, 391],
   TYOP [1, 217, 220], TYOP [1, 13, 393], TYOP [1, 220, 221],
   TYOP [1, 13, 395], TYOP [1, 221, 222], TYOP [1, 13, 397],
   TYOP [1, 222, 223], TYOP [1, 13, 399], TYOP [1, 223, 224],
   TYOP [1, 13, 401], TYOP [1, 224, 225], TYOP [1, 13, 403],
   TYOP [1, 225, 226], TYOP [1, 13, 405], TYOP [1, 42, 77],
   TYOP [1, 38, 407], TYOP [1, 138, 139], TYOP [1, 115, 409],
   TYOP [1, 42, 63], TYOP [1, 27, 411], TYOP [1, 42, 59],
   TYOP [1, 22, 413], TYOP [1, 127, 128], TYOP [1, 111, 415],
   TYOP [1, 42, 43], TYOP [1, 1, 417], TYOP [1, 42, 50], TYOP [1, 46, 419],
   TYOP [1, 125, 138], TYOP [1, 137, 421], TYOP [1, 125, 127],
   TYOP [1, 126, 423], TYOP [1, 92, 95], TYOP [1, 94, 425],
   TYOP [11, 122, 147], TYOP [1, 147, 427], TYOP [1, 122, 428],
   TYOP [1, 42, 72], TYOP [1, 67, 430], TYOP [1, 139, 140],
   TYOP [1, 67, 432], TYOP [1, 42, 54], TYOP [1, 48, 434],
   TYOP [1, 128, 129], TYOP [1, 48, 436], TYOP [1, 84, 85],
   TYOP [1, 0, 438], TYOP [1, 0, 147], TYOP [1, 0, 440], TYOP [1, 9, 9],
   TYOP [1, 9, 442], TYOP [1, 0, 358], TYOP [1, 82, 300], TYOP [1, 120, 9],
   TYOP [1, 120, 446], TYOP [1, 119, 9], TYOP [1, 119, 448],
   TYOP [1, 42, 253], TYOP [1, 38, 251], TYOP [1, 27, 118],
   TYOP [1, 22, 252], TYOP [1, 1, 114], TYOP [1, 68, 9], TYOP [1, 68, 455],
   TYOP [1, 49, 9], TYOP [1, 49, 457], TYOP [1, 124, 9],
   TYOP [1, 124, 459], TYOP [1, 87, 9], TYOP [1, 87, 461],
   TYOP [1, 100, 9], TYOP [1, 100, 463], TYOP [1, 78, 9],
   TYOP [1, 78, 465], TYOP [1, 64, 9], TYOP [1, 64, 467], TYOP [1, 60, 9],
   TYOP [1, 60, 469], TYOP [1, 44, 9], TYOP [1, 44, 471], TYOP [1, 73, 9],
   TYOP [1, 73, 473], TYOP [1, 55, 9], TYOP [1, 55, 475], TYOP [1, 148, 9],
   TYOP [1, 148, 477], TYOP [1, 266, 313], TYOP [1, 267, 315],
   TYOP [1, 268, 317], TYOP [1, 269, 319], TYOP [1, 198, 9],
   TYOP [1, 198, 483], TYOP [1, 182, 9], TYOP [1, 182, 485],
   TYOP [1, 173, 9], TYOP [1, 173, 487], TYOP [1, 153, 9],
   TYOP [1, 153, 489], TYOP [1, 142, 9], TYOP [1, 142, 491],
   TYOP [1, 131, 9], TYOP [1, 131, 493], TYOP [1, 69, 9],
   TYOP [1, 69, 495], TYOP [1, 51, 9], TYOP [1, 51, 497],
   TYOP [1, 67, 110], TYOP [1, 48, 109], TYOP [1, 203, 9],
   TYOP [1, 203, 501], TYOP [1, 218, 219], TYOP [1, 232, 233],
   TYOP [1, 240, 241], TYOP [1, 227, 228], TYOP [1, 262, 9],
   TYOP [1, 507, 9], TYOP [1, 296, 9], TYOP [1, 509, 9], TYOP [1, 263, 9],
   TYOP [1, 511, 9], TYOP [1, 297, 9], TYOP [1, 513, 9], TYOP [1, 264, 9],
   TYOP [1, 515, 9], TYOP [1, 298, 9], TYOP [1, 517, 9], TYOP [1, 265, 9],
   TYOP [1, 519, 9], TYOP [1, 299, 9], TYOP [1, 521, 9], TYOP [1, 256, 9],
   TYOP [1, 523, 256], TYOP [1, 258, 9], TYOP [1, 525, 258],
   TYOP [1, 260, 9], TYOP [1, 527, 260], TYOP [1, 0, 121],
   TYOP [1, 9, 443], TYOP [1, 68, 68], TYOP [1, 68, 531], TYOP [1, 9, 532],
   TYOP [1, 49, 49], TYOP [1, 49, 534], TYOP [1, 9, 535],
   TYOP [1, 124, 124], TYOP [1, 124, 537], TYOP [1, 9, 538],
   TYOP [1, 122, 122], TYOP [1, 121, 540], TYOP [1, 27, 104],
   TYOP [1, 1, 81], TYOP [3, 9, 5], TYOP [14, 544], TYOP [14, 545],
   TYOP [1, 546, 546], TYOP [1, 545, 547], TYOP [1, 123, 123],
   TYOP [1, 122, 549], TYOP [14, 0], TYOP [1, 551, 551], TYOP [1, 0, 552],
   TYOP [14, 427], TYOP [1, 554, 554], TYOP [1, 427, 555],
   TYOP [1, 0, 218], TYOP [1, 557, 218], TYOP [1, 217, 558],
   TYOP [1, 0, 559], TYOP [1, 0, 232], TYOP [1, 561, 232],
   TYOP [1, 231, 562], TYOP [1, 0, 563], TYOP [1, 0, 240],
   TYOP [1, 565, 240], TYOP [1, 239, 566], TYOP [1, 0, 567],
   TYOP [1, 0, 227], TYOP [1, 569, 227], TYOP [1, 226, 570],
   TYOP [1, 0, 571], TYOP [1, 118, 104], TYOP [1, 114, 81],
   TYOP [1, 554, 148], TYOP [1, 148, 575], TYOP [1, 501, 9],
   TYOP [1, 203, 577], TYOP [1, 501, 501], TYOP [1, 203, 579],
   TYOP [1, 10, 157], TYOP [1, 13, 154], TYOP [1, 452, 452],
   TYOP [1, 452, 583], TYOP [1, 207, 207], TYOP [1, 207, 585],
   TYOP [1, 454, 454], TYOP [1, 454, 587], TYOP [1, 205, 205],
   TYOP [1, 205, 589], TYOP [1, 149, 0], TYOP [1, 67, 87],
   TYOP [1, 592, 592], TYOP [1, 67, 100], TYOP [1, 594, 594],
   TYOP [1, 48, 87], TYOP [1, 596, 596], TYOP [1, 48, 100],
   TYOP [1, 598, 598], TYOP [1, 358, 358], TYOP [1, 0, 124],
   TYOP [1, 601, 601], TYOP [1, 0, 100], TYOP [1, 603, 603], TYOP [10, 85],
   TYOP [1, 0, 605], TYOP [1, 606, 606], TYOP [14, 42], TYOP [1, 67, 608],
   TYOP [1, 212, 609], TYOP [1, 48, 608], TYOP [1, 208, 611],
   TYOP [1, 120, 120], TYOP [1, 585, 613], TYOP [1, 119, 119],
   TYOP [1, 589, 615], TYOP [1, 583, 613], TYOP [1, 587, 615],
   TYOP [1, 219, 509], TYOP [1, 233, 517], TYOP [1, 241, 521],
   TYOP [1, 228, 513], TYOP [11, 42, 42], TYOP [1, 623, 73],
   TYOP [1, 42, 74], TYOP [1, 625, 624], TYOP [1, 623, 55],
   TYOP [1, 42, 56], TYOP [1, 628, 627], TYOP [11, 83, 42],
   TYOP [1, 630, 100], TYOP [1, 83, 101], TYOP [1, 632, 631],
   TYOP [11, 97, 42], TYOP [1, 634, 100], TYOP [1, 97, 101],
   TYOP [1, 636, 635], TYOP [11, 10, 42], TYOP [1, 638, 60],
   TYOP [1, 10, 61], TYOP [1, 640, 639], TYOP [1, 638, 44],
   TYOP [1, 10, 45], TYOP [1, 643, 642], TYOP [11, 13, 42],
   TYOP [1, 645, 78], TYOP [1, 13, 79], TYOP [1, 647, 646],
   TYOP [1, 645, 64], TYOP [1, 13, 65], TYOP [1, 650, 649],
   TYOP [1, 645, 60], TYOP [1, 13, 61], TYOP [1, 653, 652],
   TYOP [1, 645, 44], TYOP [1, 13, 45], TYOP [1, 656, 655],
   TYOP [1, 63, 68], TYOP [1, 27, 70], TYOP [1, 659, 658],
   TYOP [1, 43, 49], TYOP [1, 1, 52], TYOP [1, 662, 661],
   TYOP [11, 94, 42], TYOP [1, 664, 100], TYOP [1, 94, 101],
   TYOP [1, 666, 665], TYOP [1, 142, 142], TYOP [1, 668, 142],
   TYOP [1, 256, 669], TYOP [1, 131, 131], TYOP [1, 671, 131],
   TYOP [1, 258, 672], TYOP [1, 69, 69], TYOP [1, 674, 69],
   TYOP [1, 260, 675], TYOP [1, 51, 51], TYOP [1, 677, 51],
   TYOP [1, 260, 678], TYOP [1, 13, 545], TYOP [1, 46, 680],
   TYOP [1, 10, 545], TYOP [1, 46, 682], TYOP [1, 608, 42],
   TYOP [1, 115, 13], TYOP [1, 27, 110], TYOP [1, 111, 13],
   TYOP [1, 1, 109], TYOP [1, 101, 100], TYOP [10, 42], TYOP [1, 690, 689],
   TYOP [1, 42, 605], TYOP [1, 692, 605], TYOP [1, 690, 693],
   TYOP [1, 122, 124], TYOP [1, 695, 124], TYOP [10, 122],
   TYOP [1, 697, 696], TYOP [1, 67, 68], TYOP [1, 699, 68],
   TYOP [1, 68, 700], TYOP [1, 67, 73], TYOP [1, 702, 73],
   TYOP [1, 68, 703], TYOP [1, 48, 49], TYOP [1, 705, 49],
   TYOP [1, 49, 706], TYOP [1, 48, 55], TYOP [1, 708, 55],
   TYOP [1, 49, 709], TYOP [1, 123, 124], TYOP [1, 711, 124],
   TYOP [1, 124, 712], TYOP [1, 624, 73], TYOP [10, 623],
   TYOP [1, 715, 714], TYOP [1, 627, 55], TYOP [1, 715, 717],
   TYOP [1, 631, 100], TYOP [10, 630], TYOP [1, 720, 719],
   TYOP [1, 635, 100], TYOP [10, 634], TYOP [1, 723, 722],
   TYOP [1, 639, 60], TYOP [10, 638], TYOP [1, 726, 725],
   TYOP [1, 642, 44], TYOP [1, 726, 728], TYOP [1, 646, 78],
   TYOP [10, 645], TYOP [1, 731, 730], TYOP [1, 649, 64],
   TYOP [1, 731, 733], TYOP [1, 652, 60], TYOP [1, 731, 735],
   TYOP [1, 655, 44], TYOP [1, 731, 737], TYOP [1, 658, 68],
   TYOP [1, 64, 739], TYOP [1, 661, 49], TYOP [1, 44, 741],
   TYOP [1, 665, 100], TYOP [10, 664], TYOP [1, 744, 743],
   TYOP [1, 270, 100], TYOP [1, 746, 100], TYOP [10, 270],
   TYOP [1, 748, 747], TYOP [1, 271, 605], TYOP [1, 750, 605],
   TYOP [10, 271], TYOP [1, 752, 751], TYOP [1, 122, 100],
   TYOP [1, 122, 605], TYOP [1, 546, 42], TYOP [1, 0, 203],
   TYOP [1, 0, 757], TYOP [1, 444, 758], TYOP [1, 444, 759],
   TYOP [1, 125, 697], TYOP [1, 0, 761], TYOP [1, 42, 0],
   TYOP [1, 551, 203], TYOP [1, 551, 764], TYOP [1, 758, 765],
   TYOP [1, 84, 605], TYOP [1, 83, 767], TYOP [1, 768, 605],
   TYOP [1, 605, 769], TYOP [1, 84, 770], TYOP [1, 686, 9],
   TYOP [1, 9, 772], TYOP [1, 67, 773], TYOP [1, 67, 124],
   TYOP [1, 27, 775], TYOP [1, 776, 124], TYOP [1, 124, 777],
   TYOP [1, 67, 778], TYOP [1, 27, 594], TYOP [1, 780, 100],
   TYOP [1, 100, 781], TYOP [1, 67, 782], TYOP [1, 688, 9],
   TYOP [1, 9, 784], TYOP [1, 48, 785], TYOP [1, 48, 124],
   TYOP [1, 1, 787], TYOP [1, 788, 124], TYOP [1, 124, 789],
   TYOP [1, 48, 790], TYOP [1, 1, 598], TYOP [1, 792, 100],
   TYOP [1, 100, 793], TYOP [1, 48, 794], TYOP [1, 27, 605],
   TYOP [1, 796, 592], TYOP [1, 1, 605], TYOP [1, 798, 596],
   TYOP [1, 0, 10], TYOP [1, 0, 13], TYOP [1, 157, 157],
   TYOP [1, 157, 802], TYOP [1, 154, 154], TYOP [1, 154, 804],
   TYOP [1, 266, 266], TYOP [1, 198, 806], TYOP [1, 198, 198],
   TYOP [1, 198, 808], TYOP [1, 267, 267], TYOP [1, 182, 810],
   TYOP [1, 182, 182], TYOP [1, 182, 812], TYOP [1, 268, 268],
   TYOP [1, 173, 814], TYOP [1, 173, 173], TYOP [1, 173, 816],
   TYOP [1, 269, 269], TYOP [1, 153, 818], TYOP [1, 153, 153],
   TYOP [1, 153, 820], TYOP [1, 42, 690], TYOP [1, 0, 822],
   TYOP [1, 0, 823], TYOP [1, 140, 124], TYOP [1, 82, 825],
   TYOP [1, 826, 124], TYOP [1, 141, 827], TYOP [1, 129, 124],
   TYOP [1, 82, 829], TYOP [1, 830, 124], TYOP [1, 130, 831],
   TYOP [1, 138, 124], TYOP [1, 115, 833], TYOP [1, 834, 124],
   TYOP [1, 139, 835], TYOP [1, 127, 124], TYOP [1, 111, 837],
   TYOP [1, 838, 124], TYOP [1, 128, 839], TYOP [1, 71, 68],
   TYOP [1, 50, 841], TYOP [1, 53, 49], TYOP [1, 50, 843],
   TYOP [1, 143, 124], TYOP [1, 138, 845], TYOP [1, 133, 124],
   TYOP [1, 127, 847], TYOP [1, 92, 101], TYOP [1, 849, 100],
   TYOP [1, 270, 850], TYOP [1, 84, 692], TYOP [1, 852, 605],
   TYOP [1, 271, 853], TYOP [1, 139, 124], TYOP [1, 67, 855],
   TYOP [1, 856, 124], TYOP [1, 140, 857], TYOP [1, 128, 124],
   TYOP [1, 48, 859], TYOP [1, 860, 124], TYOP [1, 129, 861],
   TYOP [1, 42, 715], TYOP [1, 0, 863], TYOP [1, 42, 731],
   TYOP [1, 46, 865], TYOP [11, 93, 42], TYOP [10, 867], TYOP [1, 42, 868],
   TYOP [1, 46, 869], TYOP [11, 91, 42], TYOP [10, 871], TYOP [1, 42, 872],
   TYOP [1, 46, 873], TYOP [1, 42, 720], TYOP [1, 46, 875],
   TYOP [1, 42, 723], TYOP [1, 46, 877], TYOP [1, 42, 726],
   TYOP [1, 46, 879], TYOP [1, 869, 744], TYOP [1, 42, 881],
   TYOP [1, 0, 882], TYOP [1, 873, 748], TYOP [1, 42, 884],
   TYOP [1, 0, 885], TYOP [1, 875, 752], TYOP [1, 42, 887],
   TYOP [1, 0, 888], TYOP [1, 99, 100], TYOP [1, 77, 78], TYOP [1, 63, 64],
   TYOP [1, 59, 60], TYOP [1, 43, 44], TYOP [1, 72, 73], TYOP [1, 54, 55],
   TYOP [1, 85, 605], TYOP [1, 83, 0], TYOP [1, 97, 0], TYOP [1, 10, 0],
   TYOP [1, 13, 0]]
  end
  val _ = Theory.incorporate_consts "elf_section_header_table" tyvector
     [("sht_symtab_shndx", 0), ("sht_symtab", 0), ("sht_strtab", 0),
      ("sht_shlib", 0), ("sht_rela", 0), ("sht_rel", 0),
      ("sht_progbits", 0), ("sht_preinit_array", 0), ("sht_null", 0),
      ("sht_note", 0), ("sht_nobits", 0), ("sht_louser", 0),
      ("sht_loproc", 0), ("sht_loos", 0), ("sht_init_array", 0),
      ("sht_hiuser", 0), ("sht_hiproc", 0), ("sht_hios", 0),
      ("sht_hash", 0), ("sht_group", 0), ("sht_fini_array", 0),
      ("sht_dynsym", 0), ("sht_dynamic", 0), ("shn_loreserve", 0),
      ("shn_loproc", 0), ("shn_loos", 0), ("shn_hireserve", 0),
      ("shn_hiproc", 0), ("shn_hios", 0), ("shn_common", 0),
      ("shn_abs", 0), ("shf_write", 0), ("shf_tls", 0), ("shf_strings", 0),
      ("shf_os_nonconforming", 0), ("shf_merge", 0), ("shf_mask_proc", 0),
      ("shf_mask_os", 0), ("shf_link_order", 0), ("shf_info_link", 0),
      ("shf_group", 0), ("shf_execinstr", 0), ("shf_compressed", 0),
      ("shf_alloc", 0),
      ("recordtype.elf64_section_header_table_entry", 21),
      ("recordtype.elf64_compression_header", 26),
      ("recordtype.elf32_section_header_table_entry", 37),
      ("recordtype.elf32_compression_header", 41),
      ("read_elf64_section_header_table_entry", 47),
      ("read_elf64_section_header_table'_tupled", 51),
      ("read_elf64_section_header_table'", 53),
      ("read_elf64_section_header_table", 58),
      ("read_elf64_compression_header", 62),
      ("read_elf32_section_header_table_entry", 66),
      ("read_elf32_section_header_table'_tupled", 69),
      ("read_elf32_section_header_table'", 71),
      ("read_elf32_section_header_table", 76),
      ("read_elf32_compression_header", 80),
      ("obtain_elf64_tls_template", 81),
      ("obtain_elf64_section_group_indices", 90),
      ("obtain_elf64_hash_table", 103), ("obtain_elf32_tls_template", 104),
      ("obtain_elf32_section_group_indices", 106),
      ("obtain_elf32_hash_table", 108),
      ("is_valid_elf64_section_header_table", 109),
      ("is_valid_elf32_section_header_table", 110),
      ("is_elf64_tbss_special", 113),
      ("is_elf64_addr_addralign_correct", 114),
      ("is_elf32_tbss_special", 117),
      ("is_elf32_addr_addralign_correct", 118),
      ("instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict", 119),
      ("instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict", 120),
      ("grp_maskproc", 0), ("grp_maskos", 0), ("grp_comdat", 0),
      ("get_elf64_section_to_segment_mapping_tupled", 131),
      ("get_elf64_section_to_segment_mapping", 136),
      ("get_elf32_section_to_segment_mapping_tupled", 142),
      ("get_elf32_section_to_segment_mapping", 146),
      ("elfcompress_zlib", 0), ("elfcompress_loproc", 0),
      ("elfcompress_loos", 0), ("elfcompress_hiproc", 0),
      ("elfcompress_hios", 0), ("elf_special_sections", 148),
      ("elf64_size_correct", 151),
      ("elf64_section_header_table_entry_size", 152),
      ("elf64_section_header_table_entry_elf64_sh_type_fupd", 155),
      ("elf64_section_header_table_entry_elf64_sh_type", 156),
      ("elf64_section_header_table_entry_elf64_sh_size_fupd", 158),
      ("elf64_section_header_table_entry_elf64_sh_size", 159),
      ("elf64_section_header_table_entry_elf64_sh_offset_fupd", 158),
      ("elf64_section_header_table_entry_elf64_sh_offset", 159),
      ("elf64_section_header_table_entry_elf64_sh_name_fupd", 155),
      ("elf64_section_header_table_entry_elf64_sh_name", 156),
      ("elf64_section_header_table_entry_elf64_sh_link_fupd", 155),
      ("elf64_section_header_table_entry_elf64_sh_link", 156),
      ("elf64_section_header_table_entry_elf64_sh_info_fupd", 155),
      ("elf64_section_header_table_entry_elf64_sh_info", 156),
      ("elf64_section_header_table_entry_elf64_sh_flags_fupd", 158),
      ("elf64_section_header_table_entry_elf64_sh_flags", 159),
      ("elf64_section_header_table_entry_elf64_sh_entsize_fupd", 158),
      ("elf64_section_header_table_entry_elf64_sh_entsize", 159),
      ("elf64_section_header_table_entry_elf64_sh_addralign_fupd", 158),
      ("elf64_section_header_table_entry_elf64_sh_addralign", 159),
      ("elf64_section_header_table_entry_elf64_sh_addr_fupd", 158),
      ("elf64_section_header_table_entry_elf64_sh_addr", 159),
      ("elf64_section_header_table_entry_CASE", 171),
      ("elf64_compression_header_size", 172),
      ("elf64_compression_header_elf64_chdr_type_fupd", 174),
      ("elf64_compression_header_elf64_chdr_type", 175),
      ("elf64_compression_header_elf64_chdr_size_fupd", 176),
      ("elf64_compression_header_elf64_chdr_size", 177),
      ("elf64_compression_header_elf64_chdr_reserved_fupd", 174),
      ("elf64_compression_header_elf64_chdr_reserved", 175),
      ("elf64_compression_header_elf64_chdr_addralign_fupd", 176),
      ("elf64_compression_header_elf64_chdr_addralign", 177),
      ("elf64_compression_header_CASE", 179), ("elf32_size_correct", 180),
      ("elf32_section_header_table_entry_size", 181),
      ("elf32_section_header_table_entry_elf32_sh_type_fupd", 183),
      ("elf32_section_header_table_entry_elf32_sh_type", 184),
      ("elf32_section_header_table_entry_elf32_sh_size_fupd", 183),
      ("elf32_section_header_table_entry_elf32_sh_size", 184),
      ("elf32_section_header_table_entry_elf32_sh_offset_fupd", 183),
      ("elf32_section_header_table_entry_elf32_sh_offset", 184),
      ("elf32_section_header_table_entry_elf32_sh_name_fupd", 183),
      ("elf32_section_header_table_entry_elf32_sh_name", 184),
      ("elf32_section_header_table_entry_elf32_sh_link_fupd", 183),
      ("elf32_section_header_table_entry_elf32_sh_link", 184),
      ("elf32_section_header_table_entry_elf32_sh_info_fupd", 183),
      ("elf32_section_header_table_entry_elf32_sh_info", 184),
      ("elf32_section_header_table_entry_elf32_sh_flags_fupd", 183),
      ("elf32_section_header_table_entry_elf32_sh_flags", 184),
      ("elf32_section_header_table_entry_elf32_sh_entsize_fupd", 183),
      ("elf32_section_header_table_entry_elf32_sh_entsize", 184),
      ("elf32_section_header_table_entry_elf32_sh_addralign_fupd", 183),
      ("elf32_section_header_table_entry_elf32_sh_addralign", 184),
      ("elf32_section_header_table_entry_elf32_sh_addr_fupd", 183),
      ("elf32_section_header_table_entry_elf32_sh_addr", 184),
      ("elf32_section_header_table_entry_CASE", 196),
      ("elf32_compression_header_size", 197),
      ("elf32_compression_header_elf32_chdr_type_fupd", 199),
      ("elf32_compression_header_elf32_chdr_type", 200),
      ("elf32_compression_header_elf32_chdr_size_fupd", 199),
      ("elf32_compression_header_elf32_chdr_size", 200),
      ("elf32_compression_header_elf32_chdr_addralign_fupd", 199),
      ("elf32_compression_header_elf32_chdr_addralign", 200),
      ("elf32_compression_header_CASE", 202),
      ("compare_elf64_section_header_table_entry", 205),
      ("compare_elf32_section_header_table_entry", 207),
      ("bytes_of_elf64_section_header_table_entry", 209),
      ("bytes_of_elf64_section_header_table", 211),
      ("bytes_of_elf32_section_header_table_entry", 213),
      ("bytes_of_elf32_section_header_table", 215)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'elf32_compression_header'", 219),
   TMV("'elf32_section_header_table_entry'", 228),
   TMV("'elf64_compression_header'", 233),
   TMV("'elf64_section_header_table_entry'", 241), TMV("M", 38),
   TMV("M", 27), TMV("M", 22), TMV("M", 1), TMV("M'", 38), TMV("M'", 27),
   TMV("M'", 22), TMV("M'", 1), TMV("P", 246), TMV("P", 250),
   TMV("P", 251), TMV("P", 118), TMV("P", 252), TMV("P", 114),
   TMV("P", 254), TMV("R", 256), TMV("R", 258), TMV("R", 260),
   TMV("a", 141), TMV("a", 130), TMV("a", 50), TMV("a0", 13),
   TMV("a0'", 13), TMV("a0'", 218), TMV("a0'", 232), TMV("a0'", 240),
   TMV("a0'", 227), TMV("a1", 13), TMV("a1'", 13), TMV("a2", 10),
   TMV("a2", 13), TMV("a2'", 10), TMV("a2'", 13), TMV("a3", 10),
   TMV("a3", 13), TMV("a3'", 10), TMV("a3'", 13), TMV("a4", 10),
   TMV("a4", 13), TMV("a4'", 10), TMV("a4'", 13), TMV("a5", 10),
   TMV("a5", 13), TMV("a5'", 10), TMV("a5'", 13), TMV("a6", 13),
   TMV("a6'", 13), TMV("a7", 13), TMV("a7'", 13), TMV("a8", 10),
   TMV("a8", 13), TMV("a8'", 10), TMV("a8'", 13), TMV("a9", 10),
   TMV("a9", 13), TMV("a9'", 10), TMV("a9'", 13), TMV("addr", 0),
   TMV("ali", 10), TMV("ali", 13), TMV("align", 0), TMV("bs", 42),
   TMV("bs0", 42), TMV("bs1", 42), TMV("bs2", 42), TMV("bs3", 42),
   TMV("bs4", 42), TMV("buckets", 94), TMV("c", 10), TMV("c", 13),
   TMV("c0", 10), TMV("c0", 13), TMV("c01", 10), TMV("c01", 13),
   TMV("c02", 10), TMV("c02", 13), TMV("c1", 10), TMV("c1", 13),
   TMV("c11", 13), TMV("c12", 13), TMV("c2", 10), TMV("c2", 13),
   TMV("c21", 13), TMV("c22", 13), TMV("c3", 10), TMV("c3", 13),
   TMV("c31", 10), TMV("c31", 13), TMV("c32", 10), TMV("c32", 13),
   TMV("c4", 10), TMV("c4", 13), TMV("c41", 10), TMV("c41", 13),
   TMV("c42", 10), TMV("c42", 13), TMV("c5", 10), TMV("c5", 13),
   TMV("c51", 10), TMV("c51", 13), TMV("c52", 10), TMV("c52", 13),
   TMV("c6", 10), TMV("c6", 13), TMV("c61", 10), TMV("c61", 13),
   TMV("c62", 10), TMV("c62", 13), TMV("c7", 10), TMV("c7", 13),
   TMV("c71", 13), TMV("c72", 13), TMV("c8", 10), TMV("c8", 13),
   TMV("c81", 13), TMV("c82", 13), TMV("chain1", 92), TMV("cnt", 0),
   TMV("e", 38), TMV("e", 27), TMV("e", 22), TMV("e", 1), TMV("e1", 38),
   TMV("e1", 27), TMV("e1", 22), TMV("e1", 1), TMV("e2", 38),
   TMV("e2", 27), TMV("e2", 22), TMV("e2", 1), TMV("eat", 42),
   TMV("ed", 46), TMV("ee", 38), TMV("ee", 27), TMV("ee", 22),
   TMV("ee", 1), TMV("elf32_chdr_addralign", 13),
   TMV("elf32_chdr_size", 13), TMV("elf32_chdr_type", 13),
   TMV("elf32_compression_header", 261),
   TMV("elf32_section_header_table_entry", 261), TMV("elf32_sh_addr", 13),
   TMV("elf32_sh_addralign", 13), TMV("elf32_sh_entsize", 13),
   TMV("elf32_sh_flags", 13), TMV("elf32_sh_info", 13),
   TMV("elf32_sh_link", 13), TMV("elf32_sh_name", 13),
   TMV("elf32_sh_offset", 13), TMV("elf32_sh_size", 13),
   TMV("elf32_sh_type", 13), TMV("elf64_chdr_addralign", 10),
   TMV("elf64_chdr_reserved", 13), TMV("elf64_chdr_size", 10),
   TMV("elf64_chdr_type", 13), TMV("elf64_compression_header", 261),
   TMV("elf64_section_header_table_entry", 261), TMV("elf64_sh_addr", 10),
   TMV("elf64_sh_addralign", 10), TMV("elf64_sh_entsize", 10),
   TMV("elf64_sh_flags", 10), TMV("elf64_sh_info", 13),
   TMV("elf64_sh_link", 13), TMV("elf64_sh_name", 13),
   TMV("elf64_sh_offset", 10), TMV("elf64_sh_size", 10),
   TMV("elf64_sh_type", 13), TMV("endian", 46), TMV("ent", 27),
   TMV("ent", 1), TMV("entries", 67), TMV("entries", 48), TMV("entry", 27),
   TMV("entry", 1), TMV("f", 157), TMV("f", 154), TMV("f", 163),
   TMV("f", 169), TMV("f", 187), TMV("f", 194), TMV("f'", 163),
   TMV("f'", 169), TMV("f'", 187), TMV("f'", 194), TMV("f1", 27),
   TMV("f1", 1), TMV("f2", 27), TMV("f2", 1), TMV("filtered", 67),
   TMV("filtered", 48), TMV("flag", 0), TMV("flags", 0), TMV("fn", 262),
   TMV("fn", 263), TMV("fn", 264), TMV("fn", 265), TMV("g", 157),
   TMV("g", 154), TMV("get_elf32_section_to_segment_mapping_tupled", 142),
   TMV("get_elf64_section_to_segment_mapping_tupled", 131), TMV("grp", 27),
   TMV("grp", 1), TMV("h", 266), TMV("h", 267), TMV("h", 268),
   TMV("h", 269), TMV("h1", 27), TMV("h1", 1), TMV("h2", 27), TMV("h2", 1),
   TMV("hdr", 82), TMV("hdr", 27), TMV("hdr", 1), TMV("isin", 137),
   TMV("isin", 126), TMV("m", 0), TMV("n", 0), TMV("nbucket", 83),
   TMV("nchain", 97), TMV("nm", 0), TMV("off", 0), TMV("p", 270),
   TMV("p", 271), TMV("pent", 115), TMV("pent", 111),
   TMV("read_elf32_section_header_table'_tupled", 69),
   TMV("read_elf64_section_header_table'_tupled", 51), TMV("record", 276),
   TMV("record", 283), TMV("record", 287), TMV("record", 295),
   TMV("rel", 42), TMV("rep", 296), TMV("rep", 297), TMV("rep", 298),
   TMV("rep", 299), TMV("res", 13), TMV("rest", 42), TMV("sec_hdr", 27),
   TMV("sec_hdr", 1), TMV("sects", 67), TMV("sects", 48),
   TMV("segment", 115), TMV("segment", 111), TMV("sh_addr", 10),
   TMV("sh_addr", 13), TMV("sh_addralign", 10), TMV("sh_addralign", 13),
   TMV("sh_entsize", 10), TMV("sh_entsize", 13), TMV("sh_flags", 10),
   TMV("sh_flags", 13), TMV("sh_info", 13), TMV("sh_link", 13),
   TMV("sh_name", 13), TMV("sh_offset", 10), TMV("sh_offset", 13),
   TMV("sh_size", 10), TMV("sh_size", 13), TMV("sh_type", 13),
   TMV("sht", 67), TMV("sht", 48), TMV("siz", 10), TMV("siz", 13),
   TMV("siz", 0), TMV("stbl", 125), TMV("str", 122), TMV("table_size", 0),
   TMV("tail", 67), TMV("tail", 48), TMV("tbl", 149), TMV("tbl", 67),
   TMV("tbl", 48), TMV("tl", 123), TMV("typ", 13), TMV("v", 82),
   TMV("v", 46), TMV("v", 84), TMV("v1", 42), TMV("v1", 67), TMV("v1", 48),
   TMV("v1", 140), TMV("v1", 129), TMV("v2", 115), TMV("v2", 111),
   TMV("v3", 137), TMV("v3", 126), TMV("v3", 67), TMV("v3", 48),
   TMV("v3", 139), TMV("v3", 128), TMV("v4", 125), TMV("v5", 138),
   TMV("v5", 127), TMV("v6", 27), TMV("v6", 1), TMV("v7", 67),
   TMV("v7", 48), TMV("x", 82), TMV("x", 83), TMV("x", 27), TMV("x", 1),
   TMV("x", 46), TMV("x1", 42), TMV("x1", 67), TMV("x1", 48),
   TMV("x2", 115), TMV("x2", 111), TMV("x3", 137), TMV("x3", 126),
   TMV("x4", 125), TMV("xs", 84), TMV("xs", 67), TMV("xs", 48),
   TMC(24, 301), TMC(24, 302), TMC(24, 303), TMC(24, 304), TMC(24, 305),
   TMC(24, 306), TMC(24, 307), TMC(24, 308), TMC(24, 309), TMC(24, 310),
   TMC(24, 312), TMC(24, 314), TMC(24, 316), TMC(24, 318), TMC(24, 320),
   TMC(24, 322), TMC(24, 324), TMC(24, 326), TMC(24, 328), TMC(24, 330),
   TMC(24, 332), TMC(24, 334), TMC(24, 336), TMC(24, 338), TMC(24, 340),
   TMC(24, 341), TMC(24, 342), TMC(24, 343), TMC(24, 344), TMC(24, 346),
   TMC(24, 348), TMC(24, 350), TMC(24, 352), TMC(24, 354), TMC(24, 355),
   TMC(24, 356), TMC(24, 357), TMC(24, 359), TMC(24, 347), TMC(24, 349),
   TMC(24, 351), TMC(24, 353), TMC(24, 360), TMC(25, 362), TMC(26, 362),
   TMC(27, 364), TMC(27, 366), TMC(27, 368), TMC(27, 370), TMC(27, 372),
   TMC(27, 374), TMC(27, 376), TMC(27, 378), TMC(27, 380), TMC(27, 382),
   TMC(27, 384), TMC(27, 386), TMC(27, 388), TMC(27, 390), TMC(27, 392),
   TMC(27, 394), TMC(27, 396), TMC(27, 398), TMC(27, 400), TMC(27, 402),
   TMC(27, 404), TMC(27, 406), TMC(27, 408), TMC(27, 410), TMC(27, 412),
   TMC(27, 414), TMC(27, 416), TMC(27, 418), TMC(27, 420), TMC(27, 422),
   TMC(27, 424), TMC(27, 426), TMC(27, 429), TMC(27, 431), TMC(27, 433),
   TMC(27, 435), TMC(27, 437), TMC(27, 439), TMC(27, 441), TMC(28, 443),
   TMC(29, 0), TMC(30, 444), TMC(31, 445), TMC(31, 447), TMC(31, 449),
   TMC(31, 443), TMC(31, 450), TMC(31, 273), TMC(31, 285), TMC(31, 451),
   TMC(31, 452), TMC(31, 453), TMC(31, 454), TMC(31, 456), TMC(31, 458),
   TMC(31, 460), TMC(31, 462), TMC(31, 464), TMC(31, 466), TMC(31, 468),
   TMC(31, 470), TMC(31, 472), TMC(31, 474), TMC(31, 476), TMC(31, 478),
   TMC(31, 479), TMC(31, 480), TMC(31, 481), TMC(31, 482), TMC(31, 484),
   TMC(31, 486), TMC(31, 488), TMC(31, 490), TMC(31, 492), TMC(31, 494),
   TMC(31, 496), TMC(31, 498), TMC(31, 499), TMC(31, 500), TMC(31, 444),
   TMC(31, 502), TMC(31, 503), TMC(31, 504), TMC(31, 505), TMC(31, 506),
   TMC(32, 443), TMC(33, 303), TMC(33, 304), TMC(33, 305), TMC(33, 307),
   TMC(33, 308), TMC(33, 310), TMC(33, 508), TMC(33, 510), TMC(33, 512),
   TMC(33, 514), TMC(33, 516), TMC(33, 518), TMC(33, 520), TMC(33, 522),
   TMC(34, 524), TMC(34, 526), TMC(34, 528), TMC(35, 120), TMC(35, 119),
   TMC(35, 38), TMC(35, 27), TMC(35, 22), TMC(35, 1), TMC(36, 361),
   TMC(37, 361), TMC(38, 218), TMC(38, 232), TMC(38, 240), TMC(38, 227),
   TMC(39, 529), TMC(40, 530), TMC(40, 533), TMC(40, 536), TMC(40, 539),
   TMC(41, 541), TMC(41, 542), TMC(41, 543), TMC(41, 548), TMC(41, 550),
   TMC(41, 553), TMC(41, 556), TMC(42, 560), TMC(42, 564), TMC(42, 568),
   TMC(42, 572), TMC(43, 442), TMC(44, 362), TMC(45, 501), TMC(46, 203),
   TMC(47, 9), TMC(48, 148), TMC(49, 573), TMC(49, 574), TMC(50, 576),
   TMC(51, 203), TMC(52, 531), TMC(52, 534), TMC(52, 537), TMC(53, 578),
   TMC(54, 580), TMC(55, 581), TMC(55, 582), TMC(55, 584), TMC(55, 586),
   TMC(55, 588), TMC(55, 590), TMC(56, 591), TMC(57, 593), TMC(57, 595),
   TMC(57, 597), TMC(57, 599), TMC(57, 600), TMC(57, 602), TMC(57, 604),
   TMC(57, 607), TMC(58, 203), TMC(59, 610), TMC(59, 612), TMC(60, 362),
   TMC(61, 122), TMC(61, 67), TMC(61, 48), TMC(61, 546), TMC(61, 123),
   TMC(61, 551), TMC(61, 554), TMC(62, 361), TMC(63, 614), TMC(63, 616),
   TMC(64, 617), TMC(64, 618), TMC(65, 617), TMC(65, 618), TMC(66, 617),
   TMC(66, 618), TMC(67, 617), TMC(67, 618), TMC(68, 9), TMC(69, 619),
   TMC(69, 620), TMC(69, 621), TMC(69, 622), TMC(70, 626), TMC(70, 629),
   TMC(70, 633), TMC(70, 637), TMC(70, 641), TMC(70, 644), TMC(70, 648),
   TMC(70, 651), TMC(70, 654), TMC(70, 657), TMC(70, 660), TMC(70, 663),
   TMC(70, 667), TMC(71, 523), TMC(71, 525), TMC(71, 527), TMC(72, 670),
   TMC(72, 673), TMC(72, 676), TMC(72, 679), TMC(73, 0), TMC(74, 443),
   TMC(75, 681), TMC(76, 681), TMC(77, 215), TMC(78, 213), TMC(79, 681),
   TMC(80, 683), TMC(81, 683), TMC(82, 211), TMC(83, 209), TMC(84, 681),
   TMC(85, 683), TMC(86, 207), TMC(87, 205), TMC(88, 684), TMC(89, 202),
   TMC(90, 200), TMC(91, 199), TMC(92, 200), TMC(93, 199), TMC(94, 200),
   TMC(95, 199), TMC(96, 197), TMC(97, 685), TMC(98, 196), TMC(99, 184),
   TMC(100, 183), TMC(101, 184), TMC(102, 183), TMC(103, 184),
   TMC(104, 183), TMC(105, 184), TMC(106, 183), TMC(107, 184),
   TMC(108, 183), TMC(109, 184), TMC(110, 183), TMC(111, 184),
   TMC(112, 183), TMC(113, 184), TMC(114, 183), TMC(115, 184),
   TMC(116, 183), TMC(117, 184), TMC(118, 183), TMC(119, 181),
   TMC(120, 180), TMC(120, 686), TMC(121, 179), TMC(122, 177),
   TMC(123, 176), TMC(124, 175), TMC(125, 174), TMC(126, 177),
   TMC(127, 176), TMC(128, 175), TMC(129, 174), TMC(130, 172),
   TMC(131, 687), TMC(132, 171), TMC(133, 159), TMC(134, 158),
   TMC(135, 159), TMC(136, 158), TMC(137, 159), TMC(138, 158),
   TMC(139, 159), TMC(140, 158), TMC(141, 156), TMC(142, 155),
   TMC(143, 156), TMC(144, 155), TMC(145, 156), TMC(146, 155),
   TMC(147, 159), TMC(148, 158), TMC(149, 159), TMC(150, 158),
   TMC(151, 156), TMC(152, 155), TMC(153, 152), TMC(154, 151),
   TMC(154, 688), TMC(155, 0), TMC(156, 148), TMC(157, 0), TMC(158, 0),
   TMC(159, 0), TMC(160, 0), TMC(161, 0), TMC(162, 691), TMC(162, 694),
   TMC(162, 698), TMC(162, 701), TMC(162, 704), TMC(162, 707),
   TMC(162, 710), TMC(162, 713), TMC(162, 716), TMC(162, 718),
   TMC(162, 721), TMC(162, 724), TMC(162, 727), TMC(162, 729),
   TMC(162, 732), TMC(162, 734), TMC(162, 736), TMC(162, 738),
   TMC(162, 740), TMC(162, 742), TMC(162, 745), TMC(162, 749),
   TMC(162, 753), TMC(163, 754), TMC(163, 755), TMC(164, 756),
   TMC(165, 760), TMC(166, 146), TMC(167, 142), TMC(168, 136),
   TMC(169, 131), TMC(170, 762), TMC(171, 0), TMC(172, 0), TMC(173, 0),
   TMC(174, 120), TMC(175, 119), TMC(176, 118), TMC(177, 117),
   TMC(178, 114), TMC(179, 113), TMC(180, 110), TMC(181, 109),
   TMC(182, 763), TMC(183, 766), TMC(184, 771), TMC(184, 774),
   TMC(184, 779), TMC(184, 783), TMC(184, 786), TMC(184, 791),
   TMC(184, 795), TMC(185, 797), TMC(185, 799), TMC(186, 800),
   TMC(186, 801), TMC(187, 803), TMC(187, 805), TMC(187, 807),
   TMC(187, 809), TMC(187, 811), TMC(187, 813), TMC(187, 815),
   TMC(187, 817), TMC(187, 819), TMC(187, 821), TMC(188, 108),
   TMC(189, 106), TMC(190, 104), TMC(191, 103), TMC(192, 90), TMC(193, 81),
   TMC(194, 824), TMC(195, 828), TMC(195, 832), TMC(195, 836),
   TMC(195, 840), TMC(195, 842), TMC(195, 844), TMC(195, 846),
   TMC(195, 848), TMC(195, 851), TMC(195, 854), TMC(195, 858),
   TMC(195, 862), TMC(196, 864), TMC(197, 866), TMC(198, 80),
   TMC(199, 866), TMC(200, 76), TMC(201, 71), TMC(202, 69), TMC(203, 66),
   TMC(204, 870), TMC(204, 874), TMC(204, 876), TMC(204, 878),
   TMC(204, 866), TMC(205, 880), TMC(206, 62), TMC(207, 880), TMC(208, 58),
   TMC(209, 53), TMC(210, 51), TMC(211, 47), TMC(212, 870), TMC(212, 874),
   TMC(212, 876), TMC(212, 878), TMC(212, 866), TMC(213, 880),
   TMC(214, 41), TMC(215, 37), TMC(216, 26), TMC(217, 21), TMC(218, 883),
   TMC(218, 886), TMC(218, 889), TMC(219, 699), TMC(219, 705),
   TMC(219, 711), TMC(219, 890), TMC(219, 891), TMC(219, 892),
   TMC(219, 893), TMC(219, 894), TMC(219, 895), TMC(219, 896),
   TMC(219, 897), TMC(220, 0), TMC(221, 0), TMC(222, 0), TMC(223, 0),
   TMC(224, 0), TMC(225, 0), TMC(226, 0), TMC(227, 0), TMC(228, 0),
   TMC(229, 0), TMC(230, 0), TMC(231, 0), TMC(232, 0), TMC(233, 0),
   TMC(234, 0), TMC(235, 0), TMC(236, 0), TMC(237, 0), TMC(238, 0),
   TMC(239, 0), TMC(240, 0), TMC(241, 0), TMC(242, 0), TMC(243, 0),
   TMC(244, 0), TMC(245, 0), TMC(246, 0), TMC(247, 0), TMC(248, 0),
   TMC(249, 0), TMC(250, 0), TMC(251, 0), TMC(252, 0), TMC(253, 0),
   TMC(254, 0), TMC(255, 0), TMC(256, 0), TMC(257, 0), TMC(258, 0),
   TMC(259, 0), TMC(260, 0), TMC(261, 0), TMC(262, 0), TMC(263, 0),
   TMC(264, 362), TMC(265, 898), TMC(265, 899), TMC(265, 900),
   TMC(265, 901), TMC(266, 581), TMC(266, 582), TMC(267, 442)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op shn_loreserve_def x = x
    val op shn_loreserve_def =
    DT(((("elf_section_header_table",0),[]),[]),
       [read"%442%811@%535%473%472%472%472%472%472%472%472%473%473%473%473%473%473%473%571@@@@@@@@@@@@@@@@@"])
  fun op shn_loproc_def x = x
    val op shn_loproc_def =
    DT(((("elf_section_header_table",1),[]),[]),
       [read"%442%810@%535%473%472%472%472%472%472%472%472%473%473%473%473%473%473%473%571@@@@@@@@@@@@@@@@@"])
  fun op shn_hiproc_def x = x
    val op shn_hiproc_def =
    DT(((("elf_section_header_table",2),[]),[]),
       [read"%442%807@%535%472%472%472%472%472%473%472%472%473%473%473%473%473%473%473%571@@@@@@@@@@@@@@@@@"])
  fun op shn_loos_def x = x
    val op shn_loos_def =
    DT(((("elf_section_header_table",3),[]),[]),
       [read"%442%809@%535%473%472%472%472%472%473%472%472%473%473%473%473%473%473%473%571@@@@@@@@@@@@@@@@@"])
  fun op shn_hios_def x = x
    val op shn_hios_def =
    DT(((("elf_section_header_table",4),[]),[]),
       [read"%442%806@%535%472%472%472%472%472%472%473%472%473%473%473%473%473%473%473%571@@@@@@@@@@@@@@@@@"])
  fun op shn_abs_def x = x
    val op shn_abs_def =
    DT(((("elf_section_header_table",5),[]),[]),
       [read"%442%804@%535%472%473%472%472%473%473%473%473%473%473%473%473%473%473%473%571@@@@@@@@@@@@@@@@@"])
  fun op shn_common_def x = x
    val op shn_common_def =
    DT(((("elf_section_header_table",6),[]),[]),
       [read"%442%805@%535%473%473%472%472%473%473%473%473%473%473%473%473%473%473%473%571@@@@@@@@@@@@@@@@@"])
  fun op shn_hireserve_def x = x
    val op shn_hireserve_def =
    DT(((("elf_section_header_table",7),[]),[]),
       [read"%442%808@%535%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%571@@@@@@@@@@@@@@@@@@"])
  fun op sht_null_def x = x
    val op sht_null_def =
    DT(((("elf_section_header_table",8),[]),[]), [read"%442%826@%403@"])
  fun op sht_progbits_def x = x
    val op sht_progbits_def =
    DT(((("elf_section_header_table",9),[]),[]),
       [read"%442%828@%535%472%571@@@"])
  fun op sht_symtab_def x = x
    val op sht_symtab_def =
    DT(((("elf_section_header_table",10),[]),[]),
       [read"%442%833@%535%473%571@@@"])
  fun op sht_dynsym_def x = x
    val op sht_dynsym_def =
    DT(((("elf_section_header_table",11),[]),[]),
       [read"%442%813@%535%472%472%473%571@@@@@"])
  fun op sht_strtab_def x = x
    val op sht_strtab_def =
    DT(((("elf_section_header_table",12),[]),[]),
       [read"%442%832@%535%472%472%571@@@@"])
  fun op sht_rela_def x = x
    val op sht_rela_def =
    DT(((("elf_section_header_table",13),[]),[]),
       [read"%442%830@%535%473%472%571@@@@"])
  fun op sht_hash_def x = x
    val op sht_hash_def =
    DT(((("elf_section_header_table",14),[]),[]),
       [read"%442%816@%535%472%473%571@@@@"])
  fun op sht_dynamic_def x = x
    val op sht_dynamic_def =
    DT(((("elf_section_header_table",15),[]),[]),
       [read"%442%812@%535%473%473%571@@@@"])
  fun op sht_note_def x = x
    val op sht_note_def =
    DT(((("elf_section_header_table",16),[]),[]),
       [read"%442%825@%535%472%472%472%571@@@@@"])
  fun op sht_nobits_def x = x
    val op sht_nobits_def =
    DT(((("elf_section_header_table",17),[]),[]),
       [read"%442%824@%535%473%472%472%571@@@@@"])
  fun op sht_rel_def x = x
    val op sht_rel_def =
    DT(((("elf_section_header_table",18),[]),[]),
       [read"%442%829@%535%472%473%472%571@@@@@"])
  fun op sht_shlib_def x = x
    val op sht_shlib_def =
    DT(((("elf_section_header_table",19),[]),[]),
       [read"%442%831@%535%473%473%472%571@@@@@"])
  fun op sht_init_array_def x = x
    val op sht_init_array_def =
    DT(((("elf_section_header_table",20),[]),[]),
       [read"%442%820@%535%473%473%473%571@@@@@"])
  fun op sht_fini_array_def x = x
    val op sht_fini_array_def =
    DT(((("elf_section_header_table",21),[]),[]),
       [read"%442%814@%535%472%472%472%472%571@@@@@@"])
  fun op sht_preinit_array_def x = x
    val op sht_preinit_array_def =
    DT(((("elf_section_header_table",22),[]),[]),
       [read"%442%827@%535%473%472%472%472%571@@@@@@"])
  fun op sht_group_def x = x
    val op sht_group_def =
    DT(((("elf_section_header_table",23),[]),[]),
       [read"%442%815@%535%472%473%472%472%571@@@@@@"])
  fun op sht_symtab_shndx_def x = x
    val op sht_symtab_shndx_def =
    DT(((("elf_section_header_table",24),[]),[]),
       [read"%442%834@%535%473%473%472%472%571@@@@@@"])
  fun op sht_loos_def x = x
    val op sht_loos_def =
    DT(((("elf_section_header_table",25),[]),[]),
       [read"%442%821@%361%361%361%535%472%472%571@@@@%535%473%472%472%472%472%472%472%472%472%472%571@@@@@@@@@@@@@%535%473%472%472%472%472%472%472%472%472%472%571@@@@@@@@@@@@@%535%473%472%472%472%472%472%472%472%472%571@@@@@@@@@@@@"])
  fun op sht_hios_def x = x
    val op sht_hios_def =
    DT(((("elf_section_header_table",26),[]),[]),
       [read"%442%817@%362%361%535%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%473%473%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%535%473%472%571@@@@@%535%472%472%571@@@@@"])
  fun op sht_loproc_def x = x
    val op sht_loproc_def =
    DT(((("elf_section_header_table",27),[]),[]),
       [read"%442%822@%361%535%473%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%473%473%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%535%473%472%571@@@@@"])
  fun op sht_hiproc_def x = x
    val op sht_hiproc_def =
    DT(((("elf_section_header_table",28),[]),[]),
       [read"%442%818@%362%361%535%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%535%473%472%571@@@@@%535%472%472%571@@@@@"])
  fun op sht_louser_def x = x
    val op sht_louser_def =
    DT(((("elf_section_header_table",29),[]),[]),
       [read"%442%823@%361%535%473%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%535%473%472%571@@@@@"])
  fun op sht_hiuser_def x = x
    val op sht_hiuser_def =
    DT(((("elf_section_header_table",30),[]),[]),
       [read"%442%819@%362%361%535%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%473%472%472%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%535%473%472%571@@@@@%535%472%472%571@@@@@"])
  fun op shf_write_def x = x
    val op shf_write_def =
    DT(((("elf_section_header_table",31),[]),[]),
       [read"%442%803@%535%472%571@@@"])
  fun op shf_alloc_def x = x
    val op shf_alloc_def =
    DT(((("elf_section_header_table",32),[]),[]),
       [read"%442%791@%535%473%571@@@"])
  fun op shf_execinstr_def x = x
    val op shf_execinstr_def =
    DT(((("elf_section_header_table",33),[]),[]),
       [read"%442%793@%535%473%472%571@@@@"])
  fun op shf_merge_def x = x
    val op shf_merge_def =
    DT(((("elf_section_header_table",34),[]),[]),
       [read"%442%799@%535%473%472%472%472%571@@@@@@"])
  fun op shf_strings_def x = x
    val op shf_strings_def =
    DT(((("elf_section_header_table",35),[]),[]),
       [read"%442%801@%535%473%472%472%472%472%571@@@@@@@"])
  fun op shf_info_link_def x = x
    val op shf_info_link_def =
    DT(((("elf_section_header_table",36),[]),[]),
       [read"%442%795@%535%473%472%472%472%472%472%571@@@@@@@@"])
  fun op shf_link_order_def x = x
    val op shf_link_order_def =
    DT(((("elf_section_header_table",37),[]),[]),
       [read"%442%796@%535%473%472%472%472%472%472%472%571@@@@@@@@@"])
  fun op shf_os_nonconforming_def x = x
    val op shf_os_nonconforming_def =
    DT(((("elf_section_header_table",38),[]),[]),
       [read"%442%800@%535%473%472%472%472%472%472%472%472%571@@@@@@@@@@"])
  fun op shf_group_def x = x
    val op shf_group_def =
    DT(((("elf_section_header_table",39),[]),[]),
       [read"%442%794@%535%473%472%472%472%472%472%472%472%472%571@@@@@@@@@@@"])
  fun op shf_tls_def x = x
    val op shf_tls_def =
    DT(((("elf_section_header_table",40),[]),[]),
       [read"%442%802@%535%473%472%472%472%472%472%472%472%472%472%571@@@@@@@@@@@@"])
  fun op shf_compressed_def x = x
    val op shf_compressed_def =
    DT(((("elf_section_header_table",41),[]),[]),
       [read"%442%792@%535%473%472%472%472%472%472%472%472%472%472%472%571@@@@@@@@@@@@@"])
  fun op shf_mask_os_def x = x
    val op shf_mask_os_def =
    DT(((("elf_section_header_table",42),[]),[]),
       [read"%442%797@%535%473%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%473%473%473%473%473%473%473%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op shf_mask_proc_def x = x
    val op shf_mask_proc_def =
    DT(((("elf_section_header_table",43),[]),[]),
       [read"%442%798@%361%535%473%472%571@@@@%535%473%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%473%473%473%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_compression_header_TY_DEF x = x
    val op elf32_compression_header_TY_DEF =
    DT(((("elf_section_header_table",44),[("bool",[26])]),["DISK_THM"]),
       [read"%456%236%547%27%348%0%448%356%27%448%450%25%450%31%450%34%444$3@%25%31%34%490%403@%375$2@%372$1@$0@@@%220%474|@|||$2@$1@$0@@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_compression_header_case_def x = x
    val op elf32_compression_header_case_def =
    DT(((("elf_section_header_table",48),
        [("bool",[26,181]),("elf_section_header_table",[45,46,47]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%25%321%31%321%34%341%182%405%587%773$3@$2@$1@@$0@@$0$3@$2@$1@@|@|@|@|@"])
  fun op elf32_compression_header_size_def x = x
    val op elf32_compression_header_size_def =
    DT(((("elf_section_header_table",49),
        [("bool",[26,181]),("elf_section_header_table",[45,46,47]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%25%321%31%321%34%442%594%773$2@$1@$0@@@%535%472%571@@@|@|@|@"])
  fun op elf32_compression_header_elf32_chdr_type x = x
    val op elf32_compression_header_elf32_chdr_type =
    DT(((("elf_section_header_table",50),
        [("bool",[26,181]),("elf_section_header_table",[45,46,47]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%411%592%773$2@$1@$0@@@$2@|@|@|@"])
  fun op elf32_compression_header_elf32_chdr_size x = x
    val op elf32_compression_header_elf32_chdr_size =
    DT(((("elf_section_header_table",51),
        [("bool",[26,181]),("elf_section_header_table",[45,46,47]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%411%590%773$2@$1@$0@@@$1@|@|@|@"])
  fun op elf32_compression_header_elf32_chdr_addralign x = x
    val op elf32_compression_header_elf32_chdr_addralign =
    DT(((("elf_section_header_table",52),
        [("bool",[26,181]),("elf_section_header_table",[45,46,47]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%411%588%773$2@$1@$0@@@$0@|@|@|@"])
  fun op elf32_compression_header_elf32_chdr_type_fupd x = x
    val op elf32_compression_header_elf32_chdr_type_fupd =
    DT(((("elf_section_header_table",54),
        [("bool",[26,181]),("elf_section_header_table",[45,46,47]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%412%593$3@%773$2@$1@$0@@@%773$3$2@@$1@$0@@|@|@|@|@"])
  fun op elf32_compression_header_elf32_chdr_size_fupd x = x
    val op elf32_compression_header_elf32_chdr_size_fupd =
    DT(((("elf_section_header_table",55),
        [("bool",[26,181]),("elf_section_header_table",[45,46,47]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%412%591$3@%773$2@$1@$0@@@%773$2@$3$1@@$0@@|@|@|@|@"])
  fun op elf32_compression_header_elf32_chdr_addralign_fupd x = x
    val op elf32_compression_header_elf32_chdr_addralign_fupd =
    DT(((("elf_section_header_table",56),
        [("bool",[26,181]),("elf_section_header_table",[45,46,47]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%412%589$3@%773$2@$1@$0@@@%773$2@$1@$3$0@@@|@|@|@|@"])
  fun op elf64_compression_header_TY_DEF x = x
    val op elf64_compression_header_TY_DEF =
    DT(((("elf_section_header_table",75),[("bool",[26])]),["DISK_THM"]),
       [read"%460%238%548%28%349%2%448%357%28%448%450%25%450%31%449%33%449%37%445$4@%25%31%33%37%491%403@%376$3@%373$2@%367$1@$0@@@@%220%475|@||||$3@$2@$1@$0@@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_compression_header_case_def x = x
    val op elf64_compression_header_case_def =
    DT(((("elf_section_header_table",79),
        [("bool",[26,181]),("elf_section_header_table",[76,77,78]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%25%321%31%320%33%320%37%339%180%405%620%775$4@$3@$2@$1@@$0@@$0$4@$3@$2@$1@@|@|@|@|@|@"])
  fun op elf64_compression_header_size_def x = x
    val op elf64_compression_header_size_def =
    DT(((("elf_section_header_table",80),
        [("bool",[26,181]),("elf_section_header_table",[76,77,78]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%25%321%31%320%33%320%37%442%629%775$3@$2@$1@$0@@@%535%472%571@@@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_type x = x
    val op elf64_compression_header_elf64_chdr_type =
    DT(((("elf_section_header_table",81),
        [("bool",[26,181]),("elf_section_header_table",[76,77,78]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%411%627%775$3@$2@$1@$0@@@$3@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_reserved x = x
    val op elf64_compression_header_elf64_chdr_reserved =
    DT(((("elf_section_header_table",82),
        [("bool",[26,181]),("elf_section_header_table",[76,77,78]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%411%623%775$3@$2@$1@$0@@@$2@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_size x = x
    val op elf64_compression_header_elf64_chdr_size =
    DT(((("elf_section_header_table",83),
        [("bool",[26,181]),("elf_section_header_table",[76,77,78]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%410%625%775$3@$2@$1@$0@@@$1@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_addralign x = x
    val op elf64_compression_header_elf64_chdr_addralign =
    DT(((("elf_section_header_table",84),
        [("bool",[26,181]),("elf_section_header_table",[76,77,78]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%410%621%775$3@$2@$1@$0@@@$0@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_type_fupd x = x
    val op elf64_compression_header_elf64_chdr_type_fupd =
    DT(((("elf_section_header_table",86),
        [("bool",[26,181]),("elf_section_header_table",[76,77,78]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%320%80%320%84%414%628$4@%775$3@$2@$1@$0@@@%775$4$3@@$2@$1@$0@@|@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_reserved_fupd x = x
    val op elf64_compression_header_elf64_chdr_reserved_fupd =
    DT(((("elf_section_header_table",87),
        [("bool",[26,181]),("elf_section_header_table",[76,77,78]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%320%80%320%84%414%624$4@%775$3@$2@$1@$0@@@%775$3@$4$2@@$1@$0@@|@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_size_fupd x = x
    val op elf64_compression_header_elf64_chdr_size_fupd =
    DT(((("elf_section_header_table",88),
        [("bool",[26,181]),("elf_section_header_table",[76,77,78]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%337%178%321%73%321%75%320%80%320%84%414%626$4@%775$3@$2@$1@$0@@@%775$3@$2@$4$1@@$0@@|@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_addralign_fupd x = x
    val op elf64_compression_header_elf64_chdr_addralign_fupd =
    DT(((("elf_section_header_table",89),
        [("bool",[26,181]),("elf_section_header_table",[76,77,78]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%337%178%321%73%321%75%320%80%320%84%414%622$4@%775$3@$2@$1@$0@@@%775$3@$2@$1@$4$0@@@|@|@|@|@|@"])
  fun op elfcompress_zlib_def x = x
    val op elfcompress_zlib_def =
    DT(((("elf_section_header_table",108),[]),[]),
       [read"%442%661@%535%472%571@@@"])
  fun op elfcompress_loos_def x = x
    val op elfcompress_loos_def =
    DT(((("elf_section_header_table",109),[]),[]),
       [read"%442%659@%361%535%473%472%571@@@@%535%473%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%473%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elfcompress_hios_def x = x
    val op elfcompress_hios_def =
    DT(((("elf_section_header_table",110),[]),[]),
       [read"%442%657@%362%361%535%473%571@@@%535%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%473%473%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%535%472%571@@@@"])
  fun op elfcompress_loproc_def x = x
    val op elfcompress_loproc_def =
    DT(((("elf_section_header_table",111),[]),[]),
       [read"%442%660@%361%535%473%472%571@@@@%535%473%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%473%473%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elfcompress_hiproc_def x = x
    val op elfcompress_hiproc_def =
    DT(((("elf_section_header_table",112),[]),[]),
       [read"%442%658@%362%361%535%473%571@@@%535%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%535%472%571@@@@"])
  fun op read_elf32_compression_header_def x = x
    val op read_elf32_compression_header_def =
    DT(((("elf_section_header_table",113),[]),[]),
       [read"%328%135%319%66%421%749$1@$0@@%676%759$1@$0@@%557%278%67%676%759$3@$0@@%557%267%68%676%759$5@$0@@%557%63%69%784%385%593%510$5@@%591%510$3@@%589%510$1@@%468@@@@$0@@||@@||@@||@@@|@|@"])
  fun op read_elf64_compression_header_def x = x
    val op read_elf64_compression_header_def =
    DT(((("elf_section_header_table",114),[]),[]),
       [read"%328%135%319%66%423%761$1@$0@@%678%771$1@$0@@%559%278%67%678%771$3@$0@@%559%240%68%674%772$5@$0@@%555%266%69%674%772$7@$0@@%555%62%70%786%388%628%510$7@@%624%510$5@@%626%509$3@@%622%509$1@@%470@@@@@$0@@||@@||@@||@@||@@@|@|@"])
  fun op elf32_section_header_table_entry_TY_DEF x = x
    val op elf32_section_header_table_entry_TY_DEF =
    DT(((("elf_section_header_table",115),[("bool",[26])]),["DISK_THM"]),
       [read"%458%237%550%30%351%1%448%359%30%448%450%25%450%31%450%34%450%38%450%42%450%46%450%49%450%51%450%54%450%58%447$10@%25%31%34%38%42%46%49%51%54%58%493%403@%384$9@%383$8@%382$7@%381$6@%380$5@%379$4@%378$3@%375$2@%372$1@$0@@@@@@@@@@%220%477|@||||||||||$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_section_header_table_entry_case_def x = x
    val op elf32_section_header_table_entry_case_def =
    DT(((("elf_section_header_table",119),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%25%321%31%321%34%321%38%321%42%321%46%321%49%321%51%321%54%321%58%342%183%405%596%774$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_size_def x = x
    val op elf32_section_header_table_entry_size_def =
    DT(((("elf_section_header_table",120),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%25%321%31%321%34%321%38%321%42%321%46%321%49%321%51%321%54%321%58%442%617%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%535%472%571@@@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_name x = x
    val op elf32_section_header_table_entry_elf32_sh_name =
    DT(((("elf_section_header_table",121),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%609%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_type x = x
    val op elf32_section_header_table_entry_elf32_sh_type =
    DT(((("elf_section_header_table",122),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%615%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_flags x = x
    val op elf32_section_header_table_entry_elf32_sh_flags =
    DT(((("elf_section_header_table",123),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%603%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_addr x = x
    val op elf32_section_header_table_entry_elf32_sh_addr =
    DT(((("elf_section_header_table",124),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%597%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_offset x = x
    val op elf32_section_header_table_entry_elf32_sh_offset =
    DT(((("elf_section_header_table",125),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%611%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_size x = x
    val op elf32_section_header_table_entry_elf32_sh_size =
    DT(((("elf_section_header_table",126),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%613%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_link x = x
    val op elf32_section_header_table_entry_elf32_sh_link =
    DT(((("elf_section_header_table",127),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%607%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_info x = x
    val op elf32_section_header_table_entry_elf32_sh_info =
    DT(((("elf_section_header_table",128),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%605%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_addralign x = x
    val op elf32_section_header_table_entry_elf32_sh_addralign =
    DT(((("elf_section_header_table",129),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%599%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_entsize x = x
    val op elf32_section_header_table_entry_elf32_sh_entsize =
    DT(((("elf_section_header_table",130),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%601%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_name_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_name_fupd =
    DT(((("elf_section_header_table",132),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%610$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$10$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_type_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_type_fupd =
    DT(((("elf_section_header_table",133),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%616$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$10$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_flags_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_flags_fupd =
    DT(((("elf_section_header_table",134),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%604$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$10$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_addr_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_addr_fupd =
    DT(((("elf_section_header_table",135),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%598$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$10$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_offset_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_offset_fupd =
    DT(((("elf_section_header_table",136),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%612$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$6@$10$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_size_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_size_fupd =
    DT(((("elf_section_header_table",137),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%614$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$6@$5@$10$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_link_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_link_fupd =
    DT(((("elf_section_header_table",138),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%608$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$6@$5@$4@$10$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_info_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_info_fupd =
    DT(((("elf_section_header_table",139),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%606$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$6@$5@$4@$3@$10$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_addralign_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_addralign_fupd =
    DT(((("elf_section_header_table",140),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%600$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$6@$5@$4@$3@$2@$10$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_entsize_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_entsize_fupd =
    DT(((("elf_section_header_table",141),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%602$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$10$0@@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op compare_elf32_section_header_table_entry_def x = x
    val op compare_elf32_section_header_table_entry_def =
    DT(((("elf_section_header_table",160),[]),[]),
       [read"%324%210%324%212%443%584$1@$0@@%706%688%404@%442@@%488%839%609$1@@@%488%839%615$1@@@%488%839%603$1@@@%488%839%597$1@@@%488%839%611$1@@@%488%839%613$1@@@%488%839%607$1@@@%488%839%605$1@@@%488%839%599$1@@@%488%839%601$1@@@%533@@@@@@@@@@@%488%839%609$0@@@%488%839%615$0@@@%488%839%603$0@@@%488%839%597$0@@@%488%839%611$0@@@%488%839%613$0@@@%488%839%607$0@@@%488%839%605$0@@@%488%839%599$0@@@%488%839%601$0@@@%533@@@@@@@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict_def
    =
    DT(((("elf_section_header_table",161),[]),[]),
       [read"%406%697@%536%512%584@@%544%511%188%190%443%584$1@$0@@%524@||@@%542%511%188%190%507%584$1@$0@@%508%524@%508%497@%496@@@||@@%540%511%188%190%443%584$1@$0@@%503@||@@%538%511%188%190%507%584$1@$0@@%508%503@%508%497@%496@@@||@@%466@@@@@@"])
  fun op elf64_section_header_table_entry_TY_DEF x = x
    val op elf64_section_header_table_entry_TY_DEF =
    DT(((("elf_section_header_table",162),[("bool",[26])]),["DISK_THM"]),
       [read"%462%239%549%29%350%3%448%358%29%448%450%25%450%31%449%33%449%37%449%41%449%45%450%49%450%51%449%53%449%57%446$10@%25%31%33%37%41%45%49%51%53%57%492%403@%377$9@%374$8@%368$7@%369$6@%370$5@%371$4@%376$3@%373$2@%367$1@$0@@@@@@@@@@%220%476|@||||||||||$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_section_header_table_entry_case_def x = x
    val op elf64_section_header_table_entry_case_def =
    DT(((("elf_section_header_table",166),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%25%321%31%320%33%320%37%320%41%320%45%321%49%321%51%320%53%320%57%340%181%405%631%776$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_size_def x = x
    val op elf64_section_header_table_entry_size_def =
    DT(((("elf_section_header_table",167),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%25%321%31%320%33%320%37%320%41%320%45%321%49%321%51%320%53%320%57%442%652%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%535%472%571@@@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_name x = x
    val op elf64_section_header_table_entry_elf64_sh_name =
    DT(((("elf_section_header_table",168),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%411%644%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_type x = x
    val op elf64_section_header_table_entry_elf64_sh_type =
    DT(((("elf_section_header_table",169),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%411%650%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_flags x = x
    val op elf64_section_header_table_entry_elf64_sh_flags =
    DT(((("elf_section_header_table",170),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%410%638%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_addr x = x
    val op elf64_section_header_table_entry_elf64_sh_addr =
    DT(((("elf_section_header_table",171),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%410%632%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_offset x = x
    val op elf64_section_header_table_entry_elf64_sh_offset =
    DT(((("elf_section_header_table",172),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%410%646%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_size x = x
    val op elf64_section_header_table_entry_elf64_sh_size =
    DT(((("elf_section_header_table",173),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%410%648%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_link x = x
    val op elf64_section_header_table_entry_elf64_sh_link =
    DT(((("elf_section_header_table",174),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%411%642%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_info x = x
    val op elf64_section_header_table_entry_elf64_sh_info =
    DT(((("elf_section_header_table",175),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%411%640%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_addralign x = x
    val op elf64_section_header_table_entry_elf64_sh_addralign =
    DT(((("elf_section_header_table",176),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%410%634%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_entsize x = x
    val op elf64_section_header_table_entry_elf64_sh_entsize =
    DT(((("elf_section_header_table",177),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%410%636%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_name_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_name_fupd =
    DT(((("elf_section_header_table",179),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%645$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$10$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_type_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_type_fupd =
    DT(((("elf_section_header_table",180),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%651$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$10$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_flags_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_flags_fupd =
    DT(((("elf_section_header_table",181),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%337%178%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%639$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$10$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_addr_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_addr_fupd =
    DT(((("elf_section_header_table",182),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%337%178%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%633$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$10$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_offset_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_offset_fupd =
    DT(((("elf_section_header_table",183),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%337%178%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%647$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$6@$10$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_size_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_size_fupd =
    DT(((("elf_section_header_table",184),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%337%178%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%649$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$6@$5@$10$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_link_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_link_fupd =
    DT(((("elf_section_header_table",185),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%643$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$6@$5@$4@$10$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_info_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_info_fupd =
    DT(((("elf_section_header_table",186),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%338%179%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%641$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$6@$5@$4@$3@$10$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_addralign_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_addralign_fupd =
    DT(((("elf_section_header_table",187),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%337%178%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%635$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$6@$5@$4@$3@$2@$10$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_entsize_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_entsize_fupd =
    DT(((("elf_section_header_table",188),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%337%178%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%637$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$10$0@@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op compare_elf64_section_header_table_entry_def x = x
    val op compare_elf64_section_header_table_entry_def =
    DT(((("elf_section_header_table",207),[]),[]),
       [read"%327%211%327%213%443%585$1@$0@@%706%688%404@%442@@%488%839%644$1@@@%488%839%650$1@@@%488%838%638$1@@@%488%838%632$1@@@%488%838%646$1@@@%488%838%648$1@@@%488%839%642$1@@@%488%839%640$1@@@%488%838%634$1@@@%488%838%636$1@@@%533@@@@@@@@@@@%488%839%644$0@@@%488%839%650$0@@@%488%838%638$0@@@%488%838%632$0@@@%488%838%646$0@@@%488%838%648$0@@@%488%839%642$0@@@%488%839%640$0@@@%488%838%634$0@@@%488%838%636$0@@@%533@@@@@@@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict_def
    =
    DT(((("elf_section_header_table",208),[]),[]),
       [read"%407%698@%537%514%585@@%545%513%189%191%443%585$1@$0@@%524@||@@%543%513%189%191%507%585$1@$0@@%508%524@%508%497@%496@@@||@@%541%513%189%191%443%585$1@$0@@%503@||@@%539%513%189%191%507%585$1@$0@@%508%503@%508%497@%496@@@||@@%467@@@@@@"])
  fun op bytes_of_elf32_section_header_table_entry_def x = x
    val op bytes_of_elf32_section_header_table_entry_def =
    DT(((("elf_section_header_table",209),[]),[]),
       [read"%328%171%324%176%409%576$1@$0@@%687%486%577$1@%609$0@@@%486%577$1@%615$0@@@%486%577$1@%603$0@@@%486%573$1@%597$0@@@%486%574$1@%611$0@@@%486%577$1@%613$0@@@%486%577$1@%607$0@@@%486%577$1@%605$0@@@%486%577$1@%599$0@@@%486%577$1@%601$0@@@%531@@@@@@@@@@@@|@|@"])
  fun op read_elf32_section_header_table_entry_def x = x
    val op read_elf32_section_header_table_entry_def =
    DT(((("elf_section_header_table",210),[]),[]),
       [read"%328%171%319%65%422%754$1@$0@@%677%759$1@$0@@%558%258%65%677%759$3@$0@@%558%263%65%677%759$5@$0@@%558%255%65%677%748$7@$0@@%558%249%65%677%750$9@$0@@%558%260%65%677%759$11@$0@@%558%262%65%677%759$13@$0@@%558%257%65%677%759$15@$0@@%558%256%65%677%759$17@$0@@%558%251%65%677%759$19@$0@@%558%253%65%785%387%610%510$19@@%616%510$17@@%604%510$15@@%598%510$13@@%612%510$11@@%614%510$9@@%608%510$7@@%606%510$5@@%600%510$3@@%602%510$1@@%469@@@@@@@@@@@$0@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@@|@|@"])
  fun op bytes_of_elf64_section_header_table_entry_def x = x
    val op bytes_of_elf64_section_header_table_entry_def =
    DT(((("elf_section_header_table",211),[]),[]),
       [read"%328%171%327%177%409%581$1@$0@@%687%486%582$1@%644$0@@@%486%582$1@%650$0@@@%486%583$1@%638$0@@@%486%578$1@%632$0@@@%486%579$1@%646$0@@@%486%583$1@%648$0@@@%486%582$1@%642$0@@@%486%582$1@%640$0@@@%486%583$1@%634$0@@@%486%583$1@%636$0@@@%531@@@@@@@@@@@@|@|@"])
  fun op read_elf64_section_header_table_entry_def x = x
    val op read_elf64_section_header_table_entry_def =
    DT(((("elf_section_header_table",212),[]),[]),
       [read"%328%171%319%65%424%766$1@$0@@%679%771$1@$0@@%560%258%65%679%771$3@$0@@%560%263%65%675%772$5@$0@@%556%254%65%675%760$7@$0@@%556%248%65%675%762$9@$0@@%556%259%65%675%772$11@$0@@%556%261%65%679%771$13@$0@@%560%257%65%679%771$15@$0@@%560%256%65%675%772$17@$0@@%556%250%65%675%772$19@$0@@%556%252%65%787%390%645%510$19@@%651%510$17@@%639%509$15@@%633%509$13@@%647%509$11@@%649%509$9@@%643%510$7@@%641%510$5@@%635%509$3@@%637%509$1@@%471@@@@@@@@@@@$0@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@@|@|@"])
  fun op bytes_of_elf32_section_header_table_def x = x
    val op bytes_of_elf32_section_header_table_def =
    DT(((("elf_section_header_table",213),[]),[]),
       [read"%328%171%353%275%409%575$1@$0@@%586%525%576$1@@$0@@@|@|@"])
  fun op bytes_of_elf64_section_header_table_def x = x
    val op bytes_of_elf64_section_header_table_def =
    DT(((("elf_section_header_table",214),[]),[]),
       [read"%328%171%354%276%409%580$1@$0@@%586%526%581$1@@$0@@@|@|@"])
  fun op read_elf32_section_header_table'_tupled_primitive_def x = x
    val op read_elf32_section_header_table'_tupled_primitive_def =
    DT(((("elf_section_header_table",215),[]),[]),
       [read"%438%753@%569%465%21%402%566$0@@%328%171%319%66%319%67%448%842%442%705$1@@%403@@@$3%391$2@$0@@%391$2@$1@@@|@|@|@@|@@%229%24%739$0@%171%66%504%480%442%705$0@@%403@@%780%529@@%680%754$1@$0@@%561%176%67%665$5%391$3@$0@@@%272%780%484$2@$0@@|@||@@@@||@||@@"])
  fun op read_elf32_section_header_table'_curried_def x = x
    val op read_elf32_section_header_table'_curried_def =
    DT(((("elf_section_header_table",216),[]),[]),
       [read"%328%306%319%307%416%752$1@$0@@%753%391$1@$0@@@|@|@"])
  fun op read_elf64_section_header_table'_tupled_primitive_def x = x
    val op read_elf64_section_header_table'_tupled_primitive_def =
    DT(((("elf_section_header_table",219),[]),[]),
       [read"%439%765@%570%465%21%402%566$0@@%328%171%319%66%319%67%448%842%442%705$1@@%403@@@$3%391$2@$0@@%391$2@$1@@@|@|@|@@|@@%230%24%740$0@%171%66%505%481%442%705$0@@%403@@%781%530@@%681%766$1@$0@@%562%177%67%667$5%391$3@$0@@@%273%781%485$2@$0@@|@||@@@@||@||@@"])
  fun op read_elf64_section_header_table'_curried_def x = x
    val op read_elf64_section_header_table'_curried_def =
    DT(((("elf_section_header_table",220),[]),[]),
       [read"%328%306%319%307%417%764$1@$0@@%765%391$1@$0@@@|@|@"])
  fun op read_elf32_section_header_table_def x = x
    val op read_elf32_section_header_table_def =
    DT(((("elf_section_header_table",223),[]),[]),
       [read"%355%271%328%171%319%66%425%751$2@$1@$0@@%670%747$2@$0@@%551%134%241%666%752$3@$1@@%174%788%396$0@$1@@|@||@@@|@|@|@"])
  fun op read_elf64_section_header_table_def x = x
    val op read_elf64_section_header_table_def =
    DT(((("elf_section_header_table",224),[]),[]),
       [read"%355%271%328%171%319%66%426%763$2@$1@$0@@%671%747$2@$0@@%552%134%241%668%764$3@$1@@%175%789%398$0@$1@@|@||@@@|@|@|@"])
  fun op elf32_size_correct_def x = x
    val op elf32_size_correct_def =
    DT(((("elf_section_header_table",225),[]),[]),
       [read"%324%215%352%274%408%618$1@$0@@%520%219%479%442$0@%403@@%546@%442$0@%515$1@@@|@%839%613$1@@@@|@|@"])
  fun op elf64_size_correct_def x = x
    val op elf64_size_correct_def =
    DT(((("elf_section_header_table",226),[]),[]),
       [read"%327%216%352%274%408%653$1@$0@@%520%219%479%442$0@%403@@%546@%442$0@%515$1@@@|@%838%648$1@@@@|@|@"])
  fun op is_elf32_addr_addralign_correct_def x = x
    val op is_elf32_addr_addralign_correct_def =
    DT(((("elf_section_header_table",227),[]),[]),
       [read"%324%172%408%699$0@@%520%64%520%61%479%442%527$0@$1@@%403@@%572%442$1@%403@@%442$1@%535%472%571@@@@@%498@|@%839%597$1@@@|@%839%599$0@@@@|@"])
  fun op is_elf64_addr_addralign_correct_def x = x
    val op is_elf64_addr_addralign_correct_def =
    DT(((("elf_section_header_table",228),[]),[]),
       [read"%327%173%408%701$0@@%520%64%520%61%479%442%527$0@$1@@%403@@%572%442$1@%403@@%442$1@%535%472%571@@@@@%498@|@%838%632$1@@@|@%838%634$0@@@@|@"])
  fun op is_valid_elf32_section_header_table_def x = x
    val op is_valid_elf32_section_header_table_def =
    DT(((("elf_section_header_table",229),[]),[]),
       [read"%353%275%408%703$0@@%708$0@%546@%304%316%402%442%839%609$1@@@%403@@%402%442%839%615$1@@@%826@@%402%442%839%603$1@@@%403@@%402%442%839%597$1@@@%403@@%402%442%839%611$1@@@%403@@%402%442%839%605$1@@@%403@@%402%442%839%599$1@@@%403@@%402%442%839%601$1@@@%403@@%619$1@$2@@@@@@@@@||@@|@"])
  fun op is_valid_elf64_section_header_table_def x = x
    val op is_valid_elf64_section_header_table_def =
    DT(((("elf_section_header_table",230),[]),[]),
       [read"%354%276%408%704$0@@%711$0@%546@%305%317%402%442%839%644$1@@@%403@@%402%442%839%650$1@@@%826@@%402%442%838%638$1@@@%403@@%402%442%838%632$1@@@%403@@%402%442%838%646$1@@@%403@@%402%442%839%640$1@@@%403@@%402%442%838%634$1@@@%403@@%402%442%838%636$1@@@%403@@%654$1@$2@@@@@@@@@||@@|@"])
  fun op is_elf32_tbss_special_def x = x
    val op is_elf32_tbss_special_def =
    DT(((("elf_section_header_table",231),[]),[]),
       [read"%324%242%323%246%408%700$1@$0@@%402%842%411%841%603$1@@%717%802@@@%717%403@@@@%402%442%839%615$1@@@%824@@%842%442%839%595$0@@@%655@@@@@|@|@"])
  fun op is_elf64_tbss_special_def x = x
    val op is_elf64_tbss_special_def =
    DT(((("elf_section_header_table",232),[]),[]),
       [read"%327%243%326%247%408%702$1@$0@@%402%842%410%840%638$1@@%716%802@@@%716%403@@@@%402%442%839%650$1@@@%824@@%842%442%839%630$0@@@%655@@@@@|@|@"])
  fun op get_elf32_section_to_segment_mapping_tupled_primitive_def x = x
    val op get_elf32_section_to_segment_mapping_tupled_primitive_def =
    DT(((("elf_section_header_table",233),[]),[]),
       [read"%436%690@%567%463%19%402%564$0@@%402%360%269%318%214%333%217%323%227%353%244%324%304%353%316%355%223%448%402%440$3@%484$2@$1@@@%402%842%700$2@$4@@@%402%842%842$5$6@$2@$4@@@@%442$0@%839%609$2@@@@@@@$8%363$6@%397$1@%386$4@%392$5@$7@@@@@%363$6@%397$3@%386$4@%392$5@$7@@@@@@|@|@|@|@|@|@|@|@@%402%360%269%318%214%333%217%323%227%353%244%324%304%353%316%448%402%440$2@%484$1@$0@@@%402%842%700$1@$3@@@%842$4$5@$1@$3@@@@@$7%363$5@%397$0@%386$3@%392$4@$6@@@@@%363$5@%397$2@%386$3@%392$4@$6@@@@@@|@|@|@|@|@|@|@@%360%269%333%217%318%214%323%227%353%244%324%304%353%316%448%402%440$2@%484$1@$0@@@%700$1@$3@@@$7%363$4@%397$0@%386$3@%392$5@$6@@@@@%363$4@%397$2@%386$3@%392$5@$6@@@@@@|@|@|@|@|@|@|@@@@|@@%202%22%735$0@%214%285%745$0@%244%293%737$0@%227%296%741$0@%217%269%506%709$5@%782%532@@%304%316%482%700$1@$5@@$11%363$9@%397$0@%386$5@%392$3@$2@@@@@@%482%842$3$9@$1@$5@@@$11%363$9@%397$0@%386$5@%392$3@$2@@@@@@%521%223%664%693$0@$3@@%270%669$13%363$11@%397$2@%386$7@%392$5@$4@@@@@@%277%782%487$1@$0@@|@|@|@%839%609$1@@@@@||@@||@||@||@||@||@@"])
  fun op get_elf32_section_to_segment_mapping_curried_def x = x
    val op get_elf32_section_to_segment_mapping_curried_def =
    DT(((("elf_section_header_table",234),[]),[]),
       [read"%318%302%353%308%323%310%333%312%360%314%418%689$4@$3@$2@$1@$0@@%690%363$4@%397$3@%386$2@%392$1@$0@@@@@@|@|@|@|@|@"])
  fun op get_elf64_section_to_segment_mapping_tupled_primitive_def x = x
    val op get_elf64_section_to_segment_mapping_tupled_primitive_def =
    DT(((("elf_section_header_table",237),[]),[]),
       [read"%437%692@%568%464%20%402%565$0@@%402%360%269%326%228%318%214%334%218%354%245%327%305%354%317%355%223%448%402%441$3@%485$2@$1@@@%402%842%842$4$5@$2@$6@@@@%402%842%702$2@$6@@@%442$0@%839%644$2@@@@@@@$8%364$5@%399$1@%389$6@%393$4@$7@@@@@%364$5@%399$3@%389$6@%393$4@$7@@@@@@|@|@|@|@|@|@|@|@@%402%360%269%326%228%318%214%334%218%354%245%327%305%354%317%448%402%441$2@%485$1@$0@@@%842$3$4@$1@$5@@@@$7%364$4@%399$0@%389$5@%393$3@$6@@@@@%364$4@%399$2@%389$5@%393$3@$6@@@@@@|@|@|@|@|@|@|@@%360%269%326%228%318%214%334%218%354%245%327%305%354%317%448%402%441$2@%485$1@$0@@@%402%842%842$3$4@$1@$5@@@@%702$1@$5@@@@$7%364$4@%399$0@%389$5@%393$3@$6@@@@@%364$4@%399$2@%389$5@%393$3@$6@@@@@@|@|@|@|@|@|@|@@@@|@@%203%23%736$0@%214%286%746$0@%245%294%738$0@%228%297%742$0@%218%269%506%712$5@%782%532@@%305%317%482%842$3$9@$1@$5@@@$11%364$9@%399$0@%389$5@%393$3@$2@@@@@@%482%702$1@$5@@$11%364$9@%399$0@%389$5@%393$3@$2@@@@@@%521%223%664%693$0@$3@@%270%669$13%364$11@%399$2@%389$7@%393$5@$4@@@@@@%277%782%487$1@$0@@|@|@|@%839%644$1@@@@@||@@||@||@||@||@||@@"])
  fun op get_elf64_section_to_segment_mapping_curried_def x = x
    val op get_elf64_section_to_segment_mapping_curried_def =
    DT(((("elf_section_header_table",238),[]),[]),
       [read"%318%302%354%309%326%311%334%313%360%314%418%691$4@$3@$2@$1@$0@@%692%364$4@%399$3@%389$2@%393$1@$0@@@@@@|@|@|@|@|@"])
  fun op grp_comdat_def x = x
    val op grp_comdat_def =
    DT(((("elf_section_header_table",241),[]),[]),
       [read"%442%694@%535%472%571@@@"])
  fun op grp_maskos_def x = x
    val op grp_maskos_def =
    DT(((("elf_section_header_table",242),[]),[]),
       [read"%442%695@%535%473%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%473%473%473%473%473%473%473%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op grp_maskproc_def x = x
    val op grp_maskproc_def =
    DT(((("elf_section_header_table",243),[]),[]),
       [read"%442%696@%361%535%473%472%571@@@@%535%473%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%472%473%473%473%571@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op obtain_elf32_section_group_indices_def x = x
    val op obtain_elf32_section_group_indices_def =
    DT(((("elf_section_header_table",244),[]),[]),
       [read"%328%171%353%264%319%66%419%729$2@$1@$0@@%516%192%714%204%523%224%523%268%523%121%663%734$2@$1@$5@@%235%684%779$1@$0@%757$8@@@%226%744$0@%281%282%707$1@%686%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%571@@@@@@@@%483%478%535%473%473%472%472%473%571@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%473%473%571@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%473%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%571@@@@@@@@%483%478%535%473%473%472%472%473%571@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%472%473%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%528@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%303%315%523%194%790%400$0@$1@@|@%836$1@@||@||@|@|@|@%495$0@%535%473%472%571@@@@@|@%839%613$1@@@|@%839%611$0@@@|@$0@|@%500%172%442%839%615$0@@@%815@|@$1@@@|@|@|@"])
  fun op obtain_elf64_section_group_indices_def x = x
    val op obtain_elf64_section_group_indices_def =
    DT(((("elf_section_header_table",245),[]),[]),
       [read"%328%171%354%265%319%66%419%732$2@$1@$0@@%518%193%715%205%523%224%523%268%523%121%663%734$2@$1@$5@@%235%684%779$1@$0@%769$8@@@%226%744$0@%281%282%707$1@%686%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%473%472%473%571@@@@@@@@%483%478%535%473%472%473%472%473%571@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%473%473%571@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%473%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%473%472%473%571@@@@@@@@%483%478%535%473%472%473%472%473%571@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%472%473%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%528@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%303%315%523%194%790%400$0@$1@@|@%836$1@@||@||@|@|@|@%495$0@%535%473%472%571@@@@@|@%838%648$1@@@|@%838%646$0@@@|@$0@|@%501%173%442%839%650$0@@@%815@|@$1@@@|@|@|@"])
  fun op obtain_elf32_tls_template_def x = x
    val op obtain_elf32_tls_template_def =
    DT(((("elf_section_header_table",246),[]),[]),
       [read"%353%264%440%730$0@@%500%172%520%195%842%442%835$0@%802@@%403@@|@%839%603$0@@@|@$0@@|@"])
  fun op obtain_elf64_tls_template_def x = x
    val op obtain_elf64_tls_template_def =
    DT(((("elf_section_header_table",247),[]),[]),
       [read"%354%265%441%733$0@@%501%173%520%195%842%442%835$0@%802@@%403@@|@%838%638$0@@@|@$0@@|@"])
  fun op obtain_elf32_hash_table_def x = x
    val op obtain_elf32_hash_table_def =
    DT(((("elf_section_header_table",248),[]),[]),
       [read"%328%171%353%264%319%66%420%728$2@$1@$0@@%517%192%710$0@%685%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%571@@@@@@@@%483%478%535%473%473%472%472%473%571@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%473%473%571@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%528@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%304%291%710$0@%522%268%522%224%662%734$1@$0@$5@@%235%672%757$8@$0@@%553%221%235%673%758$10@$0@@%554%222%235%682%777%836$3@@$0@%755$12@@@%563%71%235%683%778%837$3@@$0@%756$14@@@%225%743$0@%120%282%783%365$8@%366$6@%394$4@$1@@@@||@|@||@@||@@||@@|@|@%839%611$2@@@|@%839%613$1@@@@%298%300%685%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%571@@@@@@@@%483%478%535%473%473%472%472%473%571@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%473%473%571@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%528@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@||@||@|@%500%172%442%839%615$0@@@%816@|@$1@@@|@|@|@"])
  fun op obtain_elf64_hash_table_def x = x
    val op obtain_elf64_hash_table_def =
    DT(((("elf_section_header_table",249),[]),[]),
       [read"%328%171%354%265%319%66%420%731$2@$1@$0@@%519%193%713$0@%685%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%473%472%473%571@@@@@@@@%483%478%535%473%472%473%472%473%571@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%473%473%571@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%528@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%305%292%713$0@%522%268%522%224%662%734$1@$0@$5@@%235%672%769$8@$0@@%553%221%235%673%770$10@$0@@%554%222%235%682%777%836$3@@$0@%767$12@@@%563%71%235%683%778%837$3@@$0@%768$14@@@%225%743$0@%120%282%783%365$8@%366$6@%394$4@$1@@@@||@|@||@@||@@||@@|@|@%838%646$2@@@|@%838%648$1@@@@%299%301%685%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%473%472%473%571@@@@@@@@%483%478%535%473%472%473%472%473%571@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%473%473%571@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%473%473%571@@@@@@@@@%483%478%535%473%472%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%472%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%528@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@||@||@|@%501%173%442%839%650$0@@@%816@|@$1@@@|@|@|@"])
  fun op elf_special_sections_def x = x
    val op elf_special_sections_def =
    DT(((("elf_section_header_table",250),[]),[]),
       [read"%427%656@%502%499@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%528@@@@@%401%824@%362%791@%803@@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%472%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%528@@@@@@@@@%401%828@%403@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%528@@@@@@%401%828@%362%791@%803@@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%473%571@@@@@@@@%528@@@@@@@%401%828@%362%791@%803@@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%473%472%473%571@@@@@@@@@%528@@@@@@@%401%828@%403@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%528@@@@@@@@%401%832@%791@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%473%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%473%473%473%571@@@@@@@@@%483%478%535%472%473%473%473%472%473%571@@@@@@@@@%528@@@@@@@@%401%813@%791@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%528@@@@@@%401%828@%362%791@%793@@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%473%473%571@@@@@@@@@%528@@@@@@@@@@@@%401%814@%362%791@%803@@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%528@@@@@@%401%816@%791@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%528@@@@@@%401%828@%362%791@%793@@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%473%473%571@@@@@@@@@%528@@@@@@@@@@@@%401%820@%362%791@%803@@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%472%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%528@@@@@@%401%828@%403@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%528@@@@@@%401%825@%403@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%473%473%473%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%473%473%473%571@@@@@@@@@%528@@@@@@@@@@@@@@@%401%827@%362%791@%803@@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%528@@@@@@@@%401%828@%791@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%472%472%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%473%571@@@@@@@@%528@@@@@@@@@%401%828@%791@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%472%473%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%528@@@@@@@@@@%401%832@%403@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%472%473%472%473%473%571@@@@@@@@@%528@@@@@@%401%824@%362%362%791@%803@@%802@@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%528@@@@@@@%401%828@%362%362%791@%803@@%802@@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%472%472%472%473%571@@@@@@@@@%483%478%535%472%473%472%472%473%571@@@@@@@@%528@@@@@@@@%401%828@%362%362%791@%803@@%802@@@@%489%395%483%478%535%473%473%473%473%472%571@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%483%478%535%472%473%473%472%472%473%571@@@@@@@@@%483%478%535%473%472%472%473%473%473%571@@@@@@@@@%483%478%535%473%472%473%472%473%473%571@@@@@@@@@%528@@@@@@%401%828@%362%791@%793@@@@%534@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_compression_header_accessors x = x
    val op elf32_compression_header_accessors =
    DT(((("elf_section_header_table",53),
        [("elf_section_header_table",[50,51,52])]),["DISK_THM"]),
       [read"%402%321%73%321%75%321%81%411%592%773$2@$1@$0@@@$2@|@|@|@@%402%321%73%321%75%321%81%411%590%773$2@$1@$0@@@$1@|@|@|@@%321%73%321%75%321%81%411%588%773$2@$1@$0@@@$0@|@|@|@@@"])
  fun op elf32_compression_header_fn_updates x = x
    val op elf32_compression_header_fn_updates =
    DT(((("elf_section_header_table",57),
        [("elf_section_header_table",[54,55,56])]),["DISK_THM"]),
       [read"%402%338%179%321%73%321%75%321%81%412%593$3@%773$2@$1@$0@@@%773$3$2@@$1@$0@@|@|@|@|@@%402%338%179%321%73%321%75%321%81%412%591$3@%773$2@$1@$0@@@%773$2@$3$1@@$0@@|@|@|@|@@%338%179%321%73%321%75%321%81%412%589$3@%773$2@$1@$0@@@%773$2@$1@$3$0@@@|@|@|@|@@@"])
  fun op elf32_compression_header_accfupds x = x
    val op elf32_compression_header_accfupds =
    DT(((("elf_section_header_table",58),
        [("bool",[25,26,56,181]),
         ("elf_section_header_table",[45,46,47,53,57])]),["DISK_THM"]),
       [read"%402%338%179%322%122%411%592%591$1@$0@@@%592$0@@|@|@@%402%338%179%322%122%411%592%589$1@$0@@@%592$0@@|@|@@%402%338%179%322%122%411%590%593$1@$0@@@%590$0@@|@|@@%402%338%179%322%122%411%590%589$1@$0@@@%590$0@@|@|@@%402%338%179%322%122%411%588%593$1@$0@@@%588$0@@|@|@@%402%338%179%322%122%411%588%591$1@$0@@@%588$0@@|@|@@%402%338%179%322%122%411%592%593$1@$0@@@$1%592$0@@@|@|@@%402%338%179%322%122%411%590%591$1@$0@@@$1%590$0@@@|@|@@%338%179%322%122%411%588%589$1@$0@@@$1%588$0@@@|@|@@@@@@@@@"])
  fun op elf32_compression_header_fupdfupds x = x
    val op elf32_compression_header_fupdfupds =
    DT(((("elf_section_header_table",59),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_section_header_table",[45,46,47,57])]),["DISK_THM"]),
       [read"%402%338%201%338%179%322%122%412%593$1@%593$2@$0@@@%593%719$1@$2@@$0@@|@|@|@@%402%338%201%338%179%322%122%412%591$1@%591$2@$0@@@%591%719$1@$2@@$0@@|@|@|@@%338%201%338%179%322%122%412%589$1@%589$2@$0@@@%589%719$1@$2@@$0@@|@|@|@@@"])
  fun op elf32_compression_header_fupdfupds_comp x = x
    val op elf32_compression_header_fupdfupds_comp =
    DT(((("elf_section_header_table",60),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_section_header_table",[45,46,47,57])]),["DISK_THM"]),
       [read"%402%402%338%201%338%179%432%721%593$0@@%593$1@@@%593%719$0@$1@@@|@|@@%329%206%338%201%338%179%428%720%593$0@@%720%593$1@@$2@@@%720%593%719$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%432%721%591$0@@%591$1@@@%591%719$0@$1@@@|@|@@%329%206%338%201%338%179%428%720%591$0@@%720%591$1@@$2@@@%720%591%719$0@$1@@@$2@@|@|@|@@@%402%338%201%338%179%432%721%589$0@@%589$1@@@%589%719$0@$1@@@|@|@@%329%206%338%201%338%179%428%720%589$0@@%720%589$1@@$2@@@%720%589%719$0@$1@@@$2@@|@|@|@@@@"])
  fun op elf32_compression_header_fupdcanon x = x
    val op elf32_compression_header_fupdcanon =
    DT(((("elf_section_header_table",61),
        [("bool",[25,26,56,181]),
         ("elf_section_header_table",[45,46,47,57])]),["DISK_THM"]),
       [read"%402%338%201%338%179%322%122%412%591$1@%593$2@$0@@@%593$2@%591$1@$0@@@|@|@|@@%402%338%201%338%179%322%122%412%589$1@%593$2@$0@@@%593$2@%589$1@$0@@@|@|@|@@%338%201%338%179%322%122%412%589$1@%591$2@$0@@@%591$2@%589$1@$0@@@|@|@|@@@"])
  fun op elf32_compression_header_fupdcanon_comp x = x
    val op elf32_compression_header_fupdcanon_comp =
    DT(((("elf_section_header_table",62),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_section_header_table",[45,46,47,57])]),["DISK_THM"]),
       [read"%402%402%338%201%338%179%432%721%591$0@@%593$1@@@%721%593$1@@%591$0@@@|@|@@%329%206%338%201%338%179%428%720%591$0@@%720%593$1@@$2@@@%720%593$1@@%720%591$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%432%721%589$0@@%593$1@@@%721%593$1@@%589$0@@@|@|@@%329%206%338%201%338%179%428%720%589$0@@%720%593$1@@$2@@@%720%593$1@@%720%589$0@@$2@@@|@|@|@@@%402%338%201%338%179%432%721%589$0@@%591$1@@@%721%591$1@@%589$0@@@|@|@@%329%206%338%201%338%179%428%720%589$0@@%720%591$1@@$2@@@%720%591$1@@%720%589$0@@$2@@@|@|@|@@@@"])
  fun op elf32_compression_header_component_equality x = x
    val op elf32_compression_header_component_equality =
    DT(((("elf_section_header_table",63),
        [("bool",[25,26,51,56,63,181]),
         ("elf_section_header_table",[45,46,47,53]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%322%126%322%130%408%412$1@$0@@%402%411%592$1@@%592$0@@@%402%411%590$1@@%590$0@@@%411%588$1@@%588$0@@@@@|@|@"])
  fun op elf32_compression_header_updates_eq_literal x = x
    val op elf32_compression_header_updates_eq_literal =
    DT(((("elf_section_header_table",64),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_section_header_table",[45,46,47,57])]),["DISK_THM"]),
       [read"%322%122%321%81%321%75%321%73%412%593%510$2@@%591%510$1@@%589%510$0@@$3@@@@%593%510$2@@%591%510$1@@%589%510$0@@%468@@@@|@|@|@|@"])
  fun op elf32_compression_header_literal_nchotomy x = x
    val op elf32_compression_header_literal_nchotomy =
    DT(((("elf_section_header_table",65),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_section_header_table",[45,46,47,57]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%322%122%450%81%450%75%450%73%412$3@%593%510$2@@%591%510$1@@%589%510$0@@%468@@@@|@|@|@|@"])
  fun op FORALL_elf32_compression_header x = x
    val op FORALL_elf32_compression_header =
    DT(((("elf_section_header_table",66),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_section_header_table",[45,46,47,57]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%343%14%408%322%122$1$0@|@@%321%81%321%75%321%73$3%593%510$2@@%591%510$1@@%589%510$0@@%468@@@@|@|@|@@|@"])
  fun op EXISTS_elf32_compression_header x = x
    val op EXISTS_elf32_compression_header =
    DT(((("elf_section_header_table",67),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_section_header_table",[45,46,47,57]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%343%14%408%451%122$1$0@|@@%450%81%450%75%450%73$3%593%510$2@@%591%510$1@@%589%510$0@@%468@@@@|@|@|@@|@"])
  fun op elf32_compression_header_literal_11 x = x
    val op elf32_compression_header_literal_11 =
    DT(((("elf_section_header_table",68),
        [("combin",[12]),
         ("elf_section_header_table",[58,63])]),["DISK_THM"]),
       [read"%321%82%321%77%321%81%321%83%321%79%321%85%408%412%593%510$5@@%591%510$4@@%589%510$3@@%468@@@@%593%510$2@@%591%510$1@@%589%510$0@@%468@@@@@%402%411$5@$2@@%402%411$4@$1@@%411$3@$0@@@@|@|@|@|@|@|@"])
  fun op datatype_elf32_compression_header x = x
    val op datatype_elf32_compression_header =
    DT(((("elf_section_header_table",69),
        [("bool",[25,171])]),["DISK_THM"]),
       [read"%494%233%143@%142@%141@%140@@"])
  fun op elf32_compression_header_11 x = x
    val op elf32_compression_header_11 =
    DT(((("elf_section_header_table",70),
        [("bool",[26,51,56,63,181]),
         ("elf_section_header_table",[45,46,47]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%321%25%321%31%321%34%321%26%321%32%321%36%408%412%773$5@$4@$3@@%773$2@$1@$0@@@%402%411$5@$2@@%402%411$4@$1@@%411$3@$0@@@@|@|@|@|@|@|@"])
  fun op elf32_compression_header_case_cong x = x
    val op elf32_compression_header_case_cong =
    DT(((("elf_section_header_table",71),
        [("bool",[26,181]),
         ("elf_section_header_table",[45,46,47,48])]),["DISK_THM"]),
       [read"%322%4%322%8%341%182%448%402%412$2@$1@@%321%25%321%31%321%34%448%412$4@%773$2@$1@$0@@@%405$3$2@$1@$0@@%186$2@$1@$0@@@|@|@|@@@%405%587$2@$0@@%587$1@%186@@@|@|@|@"])
  fun op elf32_compression_header_nchotomy x = x
    val op elf32_compression_header_nchotomy =
    DT(((("elf_section_header_table",72),
        [("bool",[26,181]),
         ("elf_section_header_table",[45,46,47])]),["DISK_THM"]),
       [read"%322%136%450%73%450%75%450%81%412$3@%773$2@$1@$0@@|@|@|@|@"])
  fun op elf32_compression_header_Axiom x = x
    val op elf32_compression_header_Axiom =
    DT(((("elf_section_header_table",73),
        [("bool",[26,181]),("elf_section_header_table",[45,46,47]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%341%182%455%196%321%25%321%31%321%34%405$3%773$2@$1@$0@@@$4$2@$1@$0@@|@|@|@|@|@"])
  fun op elf32_compression_header_induction x = x
    val op elf32_compression_header_induction =
    DT(((("elf_section_header_table",74),
        [("bool",[26]),
         ("elf_section_header_table",[45,46,47])]),["DISK_THM"]),
       [read"%343%14%448%321%73%321%75%321%81$3%773$2@$1@$0@@|@|@|@@%322%122$1$0@|@@|@"])
  fun op elf64_compression_header_accessors x = x
    val op elf64_compression_header_accessors =
    DT(((("elf_section_header_table",85),
        [("elf_section_header_table",[81,82,83,84])]),["DISK_THM"]),
       [read"%402%321%73%321%75%320%80%320%84%411%627%775$3@$2@$1@$0@@@$3@|@|@|@|@@%402%321%73%321%75%320%80%320%84%411%623%775$3@$2@$1@$0@@@$2@|@|@|@|@@%402%321%73%321%75%320%80%320%84%410%625%775$3@$2@$1@$0@@@$1@|@|@|@|@@%321%73%321%75%320%80%320%84%410%621%775$3@$2@$1@$0@@@$0@|@|@|@|@@@@"])
  fun op elf64_compression_header_fn_updates x = x
    val op elf64_compression_header_fn_updates =
    DT(((("elf_section_header_table",90),
        [("elf_section_header_table",[86,87,88,89])]),["DISK_THM"]),
       [read"%402%338%179%321%73%321%75%320%80%320%84%414%628$4@%775$3@$2@$1@$0@@@%775$4$3@@$2@$1@$0@@|@|@|@|@|@@%402%338%179%321%73%321%75%320%80%320%84%414%624$4@%775$3@$2@$1@$0@@@%775$3@$4$2@@$1@$0@@|@|@|@|@|@@%402%337%178%321%73%321%75%320%80%320%84%414%626$4@%775$3@$2@$1@$0@@@%775$3@$2@$4$1@@$0@@|@|@|@|@|@@%337%178%321%73%321%75%320%80%320%84%414%622$4@%775$3@$2@$1@$0@@@%775$3@$2@$1@$4$0@@@|@|@|@|@|@@@@"])
  fun op elf64_compression_header_accfupds x = x
    val op elf64_compression_header_accfupds =
    DT(((("elf_section_header_table",91),
        [("bool",[25,26,56,181]),
         ("elf_section_header_table",[76,77,78,85,90])]),["DISK_THM"]),
       [read"%402%338%179%325%124%411%627%624$1@$0@@@%627$0@@|@|@@%402%337%178%325%124%411%627%626$1@$0@@@%627$0@@|@|@@%402%337%178%325%124%411%627%622$1@$0@@@%627$0@@|@|@@%402%338%179%325%124%411%623%628$1@$0@@@%623$0@@|@|@@%402%337%178%325%124%411%623%626$1@$0@@@%623$0@@|@|@@%402%337%178%325%124%411%623%622$1@$0@@@%623$0@@|@|@@%402%338%179%325%124%410%625%628$1@$0@@@%625$0@@|@|@@%402%338%179%325%124%410%625%624$1@$0@@@%625$0@@|@|@@%402%337%178%325%124%410%625%622$1@$0@@@%625$0@@|@|@@%402%338%179%325%124%410%621%628$1@$0@@@%621$0@@|@|@@%402%338%179%325%124%410%621%624$1@$0@@@%621$0@@|@|@@%402%337%178%325%124%410%621%626$1@$0@@@%621$0@@|@|@@%402%338%179%325%124%411%627%628$1@$0@@@$1%627$0@@@|@|@@%402%338%179%325%124%411%623%624$1@$0@@@$1%623$0@@@|@|@@%402%337%178%325%124%410%625%626$1@$0@@@$1%625$0@@@|@|@@%337%178%325%124%410%621%622$1@$0@@@$1%621$0@@@|@|@@@@@@@@@@@@@@@@"])
  fun op elf64_compression_header_fupdfupds x = x
    val op elf64_compression_header_fupdfupds =
    DT(((("elf_section_header_table",92),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_section_header_table",[76,77,78,90])]),["DISK_THM"]),
       [read"%402%338%201%338%179%325%124%414%628$1@%628$2@$0@@@%628%719$1@$2@@$0@@|@|@|@@%402%338%201%338%179%325%124%414%624$1@%624$2@$0@@@%624%719$1@$2@@$0@@|@|@|@@%402%337%200%337%178%325%124%414%626$1@%626$2@$0@@@%626%718$1@$2@@$0@@|@|@|@@%337%200%337%178%325%124%414%622$1@%622$2@$0@@@%622%718$1@$2@@$0@@|@|@|@@@@"])
  fun op elf64_compression_header_fupdfupds_comp x = x
    val op elf64_compression_header_fupdfupds_comp =
    DT(((("elf_section_header_table",93),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_section_header_table",[76,77,78,90])]),["DISK_THM"]),
       [read"%402%402%338%201%338%179%434%725%628$0@@%628$1@@@%628%719$0@$1@@@|@|@@%331%208%338%201%338%179%430%724%628$0@@%724%628$1@@$2@@@%724%628%719$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%434%725%624$0@@%624$1@@@%624%719$0@$1@@@|@|@@%331%208%338%201%338%179%430%724%624$0@@%724%624$1@@$2@@@%724%624%719$0@$1@@@$2@@|@|@|@@@%402%402%337%200%337%178%434%725%626$0@@%626$1@@@%626%718$0@$1@@@|@|@@%331%208%337%200%337%178%430%724%626$0@@%724%626$1@@$2@@@%724%626%718$0@$1@@@$2@@|@|@|@@@%402%337%200%337%178%434%725%622$0@@%622$1@@@%622%718$0@$1@@@|@|@@%331%208%337%200%337%178%430%724%622$0@@%724%622$1@@$2@@@%724%622%718$0@$1@@@$2@@|@|@|@@@@@"])
  fun op elf64_compression_header_fupdcanon x = x
    val op elf64_compression_header_fupdcanon =
    DT(((("elf_section_header_table",94),
        [("bool",[25,26,56,181]),
         ("elf_section_header_table",[76,77,78,90])]),["DISK_THM"]),
       [read"%402%338%201%338%179%325%124%414%624$1@%628$2@$0@@@%628$2@%624$1@$0@@@|@|@|@@%402%338%201%337%178%325%124%414%626$1@%628$2@$0@@@%628$2@%626$1@$0@@@|@|@|@@%402%338%201%337%178%325%124%414%626$1@%624$2@$0@@@%624$2@%626$1@$0@@@|@|@|@@%402%338%201%337%178%325%124%414%622$1@%628$2@$0@@@%628$2@%622$1@$0@@@|@|@|@@%402%338%201%337%178%325%124%414%622$1@%624$2@$0@@@%624$2@%622$1@$0@@@|@|@|@@%337%200%337%178%325%124%414%622$1@%626$2@$0@@@%626$2@%622$1@$0@@@|@|@|@@@@@@"])
  fun op elf64_compression_header_fupdcanon_comp x = x
    val op elf64_compression_header_fupdcanon_comp =
    DT(((("elf_section_header_table",95),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_section_header_table",[76,77,78,90])]),["DISK_THM"]),
       [read"%402%402%338%201%338%179%434%725%624$0@@%628$1@@@%725%628$1@@%624$0@@@|@|@@%331%208%338%201%338%179%430%724%624$0@@%724%628$1@@$2@@@%724%628$1@@%724%624$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%434%725%626$0@@%628$1@@@%725%628$1@@%626$0@@@|@|@@%331%208%338%201%337%178%430%724%626$0@@%724%628$1@@$2@@@%724%628$1@@%724%626$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%434%725%626$0@@%624$1@@@%725%624$1@@%626$0@@@|@|@@%331%208%338%201%337%178%430%724%626$0@@%724%624$1@@$2@@@%724%624$1@@%724%626$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%434%725%622$0@@%628$1@@@%725%628$1@@%622$0@@@|@|@@%331%208%338%201%337%178%430%724%622$0@@%724%628$1@@$2@@@%724%628$1@@%724%622$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%434%725%622$0@@%624$1@@@%725%624$1@@%622$0@@@|@|@@%331%208%338%201%337%178%430%724%622$0@@%724%624$1@@$2@@@%724%624$1@@%724%622$0@@$2@@@|@|@|@@@%402%337%200%337%178%434%725%622$0@@%626$1@@@%725%626$1@@%622$0@@@|@|@@%331%208%337%200%337%178%430%724%622$0@@%724%626$1@@$2@@@%724%626$1@@%724%622$0@@$2@@@|@|@|@@@@@@@"])
  fun op elf64_compression_header_component_equality x = x
    val op elf64_compression_header_component_equality =
    DT(((("elf_section_header_table",96),
        [("bool",[25,26,51,56,63,181]),
         ("elf_section_header_table",[76,77,78,85]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%325%128%325%132%408%414$1@$0@@%402%411%627$1@@%627$0@@@%402%411%623$1@@%623$0@@@%402%410%625$1@@%625$0@@@%410%621$1@@%621$0@@@@@@|@|@"])
  fun op elf64_compression_header_updates_eq_literal x = x
    val op elf64_compression_header_updates_eq_literal =
    DT(((("elf_section_header_table",97),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_section_header_table",[76,77,78,90])]),["DISK_THM"]),
       [read"%325%124%321%85%321%81%320%74%320%72%414%628%510$3@@%624%510$2@@%626%509$1@@%622%509$0@@$4@@@@@%628%510$3@@%624%510$2@@%626%509$1@@%622%509$0@@%470@@@@@|@|@|@|@|@"])
  fun op elf64_compression_header_literal_nchotomy x = x
    val op elf64_compression_header_literal_nchotomy =
    DT(((("elf_section_header_table",98),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_section_header_table",[76,77,78,90]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%325%124%450%85%450%81%449%74%449%72%414$4@%628%510$3@@%624%510$2@@%626%509$1@@%622%509$0@@%470@@@@@|@|@|@|@|@"])
  fun op FORALL_elf64_compression_header x = x
    val op FORALL_elf64_compression_header =
    DT(((("elf_section_header_table",99),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_section_header_table",[76,77,78,90]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%345%16%408%325%124$1$0@|@@%321%85%321%81%320%74%320%72$4%628%510$3@@%624%510$2@@%626%509$1@@%622%509$0@@%470@@@@@|@|@|@|@@|@"])
  fun op EXISTS_elf64_compression_header x = x
    val op EXISTS_elf64_compression_header =
    DT(((("elf_section_header_table",100),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_section_header_table",[76,77,78,90]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%345%16%408%453%124$1$0@|@@%450%85%450%81%449%74%449%72$4%628%510$3@@%624%510$2@@%626%509$1@@%622%509$0@@%470@@@@@|@|@|@|@@|@"])
  fun op elf64_compression_header_literal_11 x = x
    val op elf64_compression_header_literal_11 =
    DT(((("elf_section_header_table",101),
        [("combin",[12]),
         ("elf_section_header_table",[91,96])]),["DISK_THM"]),
       [read"%321%86%321%82%320%76%320%80%321%87%321%83%320%78%320%84%408%414%628%510$7@@%624%510$6@@%626%509$5@@%622%509$4@@%470@@@@@%628%510$3@@%624%510$2@@%626%509$1@@%622%509$0@@%470@@@@@@%402%411$7@$3@@%402%411$6@$2@@%402%410$5@$1@@%410$4@$0@@@@@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf64_compression_header x = x
    val op datatype_elf64_compression_header =
    DT(((("elf_section_header_table",102),
        [("bool",[25,171])]),["DISK_THM"]),
       [read"%494%231%159@%158@%156@%157@%155@@"])
  fun op elf64_compression_header_11 x = x
    val op elf64_compression_header_11 =
    DT(((("elf_section_header_table",103),
        [("bool",[26,51,56,63,181]),
         ("elf_section_header_table",[76,77,78]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%321%25%321%31%320%33%320%37%321%26%321%32%320%35%320%39%408%414%775$7@$6@$5@$4@@%775$3@$2@$1@$0@@@%402%411$7@$3@@%402%411$6@$2@@%402%410$5@$1@@%410$4@$0@@@@@|@|@|@|@|@|@|@|@"])
  fun op elf64_compression_header_case_cong x = x
    val op elf64_compression_header_case_cong =
    DT(((("elf_section_header_table",104),
        [("bool",[26,181]),
         ("elf_section_header_table",[76,77,78,79])]),["DISK_THM"]),
       [read"%325%6%325%10%339%180%448%402%414$2@$1@@%321%25%321%31%320%33%320%37%448%414$5@%775$3@$2@$1@$0@@@%405$4$3@$2@$1@$0@@%184$3@$2@$1@$0@@@|@|@|@|@@@%405%620$2@$0@@%620$1@%184@@@|@|@|@"])
  fun op elf64_compression_header_nchotomy x = x
    val op elf64_compression_header_nchotomy =
    DT(((("elf_section_header_table",105),
        [("bool",[26,181]),
         ("elf_section_header_table",[76,77,78])]),["DISK_THM"]),
       [read"%325%138%450%73%450%75%449%80%449%84%414$4@%775$3@$2@$1@$0@@|@|@|@|@|@"])
  fun op elf64_compression_header_Axiom x = x
    val op elf64_compression_header_Axiom =
    DT(((("elf_section_header_table",106),
        [("bool",[26,181]),("elf_section_header_table",[76,77,78]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%339%180%459%198%321%25%321%31%320%33%320%37%405$4%775$3@$2@$1@$0@@@$5$3@$2@$1@$0@@|@|@|@|@|@|@"])
  fun op elf64_compression_header_induction x = x
    val op elf64_compression_header_induction =
    DT(((("elf_section_header_table",107),
        [("bool",[26]),
         ("elf_section_header_table",[76,77,78])]),["DISK_THM"]),
       [read"%345%16%448%321%73%321%75%320%80%320%84$4%775$3@$2@$1@$0@@|@|@|@|@@%325%124$1$0@|@@|@"])
  fun op elf32_section_header_table_entry_accessors x = x
    val op elf32_section_header_table_entry_accessors =
    DT(((("elf_section_header_table",131),
        [("elf_section_header_table",
         [121,122,123,124,125,126,127,128,129,130])]),["DISK_THM"]),
       [read"%402%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%609%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%615%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%603%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%597%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%611%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%613%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%607%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%605%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%599%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@@%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%411%601%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_fn_updates x = x
    val op elf32_section_header_table_entry_fn_updates =
    DT(((("elf_section_header_table",142),
        [("elf_section_header_table",
         [132,133,134,135,136,137,138,139,140,141])]),["DISK_THM"]),
       [read"%402%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%610$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$10$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%616$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$10$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%604$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$10$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%598$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$10$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%612$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$6@$10$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%614$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$6@$5@$10$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%608$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$6@$5@$4@$10$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%606$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$6@$5@$4@$3@$10$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%600$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$6@$5@$4@$3@$2@$10$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@@%338%179%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117%413%602$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$10$0@@@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_accfupds x = x
    val op elf32_section_header_table_entry_accfupds =
    DT(((("elf_section_header_table",143),
        [("bool",[25,26,56,181]),
         ("elf_section_header_table",
         [116,117,118,131,142])]),["DISK_THM"]),
       [read"%402%338%179%324%123%411%609%616$1@$0@@@%609$0@@|@|@@%402%338%179%324%123%411%609%604$1@$0@@@%609$0@@|@|@@%402%338%179%324%123%411%609%598$1@$0@@@%609$0@@|@|@@%402%338%179%324%123%411%609%612$1@$0@@@%609$0@@|@|@@%402%338%179%324%123%411%609%614$1@$0@@@%609$0@@|@|@@%402%338%179%324%123%411%609%608$1@$0@@@%609$0@@|@|@@%402%338%179%324%123%411%609%606$1@$0@@@%609$0@@|@|@@%402%338%179%324%123%411%609%600$1@$0@@@%609$0@@|@|@@%402%338%179%324%123%411%609%602$1@$0@@@%609$0@@|@|@@%402%338%179%324%123%411%615%610$1@$0@@@%615$0@@|@|@@%402%338%179%324%123%411%615%604$1@$0@@@%615$0@@|@|@@%402%338%179%324%123%411%615%598$1@$0@@@%615$0@@|@|@@%402%338%179%324%123%411%615%612$1@$0@@@%615$0@@|@|@@%402%338%179%324%123%411%615%614$1@$0@@@%615$0@@|@|@@%402%338%179%324%123%411%615%608$1@$0@@@%615$0@@|@|@@%402%338%179%324%123%411%615%606$1@$0@@@%615$0@@|@|@@%402%338%179%324%123%411%615%600$1@$0@@@%615$0@@|@|@@%402%338%179%324%123%411%615%602$1@$0@@@%615$0@@|@|@@%402%338%179%324%123%411%603%610$1@$0@@@%603$0@@|@|@@%402%338%179%324%123%411%603%616$1@$0@@@%603$0@@|@|@@%402%338%179%324%123%411%603%598$1@$0@@@%603$0@@|@|@@%402%338%179%324%123%411%603%612$1@$0@@@%603$0@@|@|@@%402%338%179%324%123%411%603%614$1@$0@@@%603$0@@|@|@@%402%338%179%324%123%411%603%608$1@$0@@@%603$0@@|@|@@%402%338%179%324%123%411%603%606$1@$0@@@%603$0@@|@|@@%402%338%179%324%123%411%603%600$1@$0@@@%603$0@@|@|@@%402%338%179%324%123%411%603%602$1@$0@@@%603$0@@|@|@@%402%338%179%324%123%411%597%610$1@$0@@@%597$0@@|@|@@%402%338%179%324%123%411%597%616$1@$0@@@%597$0@@|@|@@%402%338%179%324%123%411%597%604$1@$0@@@%597$0@@|@|@@%402%338%179%324%123%411%597%612$1@$0@@@%597$0@@|@|@@%402%338%179%324%123%411%597%614$1@$0@@@%597$0@@|@|@@%402%338%179%324%123%411%597%608$1@$0@@@%597$0@@|@|@@%402%338%179%324%123%411%597%606$1@$0@@@%597$0@@|@|@@%402%338%179%324%123%411%597%600$1@$0@@@%597$0@@|@|@@%402%338%179%324%123%411%597%602$1@$0@@@%597$0@@|@|@@%402%338%179%324%123%411%611%610$1@$0@@@%611$0@@|@|@@%402%338%179%324%123%411%611%616$1@$0@@@%611$0@@|@|@@%402%338%179%324%123%411%611%604$1@$0@@@%611$0@@|@|@@%402%338%179%324%123%411%611%598$1@$0@@@%611$0@@|@|@@%402%338%179%324%123%411%611%614$1@$0@@@%611$0@@|@|@@%402%338%179%324%123%411%611%608$1@$0@@@%611$0@@|@|@@%402%338%179%324%123%411%611%606$1@$0@@@%611$0@@|@|@@%402%338%179%324%123%411%611%600$1@$0@@@%611$0@@|@|@@%402%338%179%324%123%411%611%602$1@$0@@@%611$0@@|@|@@%402%338%179%324%123%411%613%610$1@$0@@@%613$0@@|@|@@%402%338%179%324%123%411%613%616$1@$0@@@%613$0@@|@|@@%402%338%179%324%123%411%613%604$1@$0@@@%613$0@@|@|@@%402%338%179%324%123%411%613%598$1@$0@@@%613$0@@|@|@@%402%338%179%324%123%411%613%612$1@$0@@@%613$0@@|@|@@%402%338%179%324%123%411%613%608$1@$0@@@%613$0@@|@|@@%402%338%179%324%123%411%613%606$1@$0@@@%613$0@@|@|@@%402%338%179%324%123%411%613%600$1@$0@@@%613$0@@|@|@@%402%338%179%324%123%411%613%602$1@$0@@@%613$0@@|@|@@%402%338%179%324%123%411%607%610$1@$0@@@%607$0@@|@|@@%402%338%179%324%123%411%607%616$1@$0@@@%607$0@@|@|@@%402%338%179%324%123%411%607%604$1@$0@@@%607$0@@|@|@@%402%338%179%324%123%411%607%598$1@$0@@@%607$0@@|@|@@%402%338%179%324%123%411%607%612$1@$0@@@%607$0@@|@|@@%402%338%179%324%123%411%607%614$1@$0@@@%607$0@@|@|@@%402%338%179%324%123%411%607%606$1@$0@@@%607$0@@|@|@@%402%338%179%324%123%411%607%600$1@$0@@@%607$0@@|@|@@%402%338%179%324%123%411%607%602$1@$0@@@%607$0@@|@|@@%402%338%179%324%123%411%605%610$1@$0@@@%605$0@@|@|@@%402%338%179%324%123%411%605%616$1@$0@@@%605$0@@|@|@@%402%338%179%324%123%411%605%604$1@$0@@@%605$0@@|@|@@%402%338%179%324%123%411%605%598$1@$0@@@%605$0@@|@|@@%402%338%179%324%123%411%605%612$1@$0@@@%605$0@@|@|@@%402%338%179%324%123%411%605%614$1@$0@@@%605$0@@|@|@@%402%338%179%324%123%411%605%608$1@$0@@@%605$0@@|@|@@%402%338%179%324%123%411%605%600$1@$0@@@%605$0@@|@|@@%402%338%179%324%123%411%605%602$1@$0@@@%605$0@@|@|@@%402%338%179%324%123%411%599%610$1@$0@@@%599$0@@|@|@@%402%338%179%324%123%411%599%616$1@$0@@@%599$0@@|@|@@%402%338%179%324%123%411%599%604$1@$0@@@%599$0@@|@|@@%402%338%179%324%123%411%599%598$1@$0@@@%599$0@@|@|@@%402%338%179%324%123%411%599%612$1@$0@@@%599$0@@|@|@@%402%338%179%324%123%411%599%614$1@$0@@@%599$0@@|@|@@%402%338%179%324%123%411%599%608$1@$0@@@%599$0@@|@|@@%402%338%179%324%123%411%599%606$1@$0@@@%599$0@@|@|@@%402%338%179%324%123%411%599%602$1@$0@@@%599$0@@|@|@@%402%338%179%324%123%411%601%610$1@$0@@@%601$0@@|@|@@%402%338%179%324%123%411%601%616$1@$0@@@%601$0@@|@|@@%402%338%179%324%123%411%601%604$1@$0@@@%601$0@@|@|@@%402%338%179%324%123%411%601%598$1@$0@@@%601$0@@|@|@@%402%338%179%324%123%411%601%612$1@$0@@@%601$0@@|@|@@%402%338%179%324%123%411%601%614$1@$0@@@%601$0@@|@|@@%402%338%179%324%123%411%601%608$1@$0@@@%601$0@@|@|@@%402%338%179%324%123%411%601%606$1@$0@@@%601$0@@|@|@@%402%338%179%324%123%411%601%600$1@$0@@@%601$0@@|@|@@%402%338%179%324%123%411%609%610$1@$0@@@$1%609$0@@@|@|@@%402%338%179%324%123%411%615%616$1@$0@@@$1%615$0@@@|@|@@%402%338%179%324%123%411%603%604$1@$0@@@$1%603$0@@@|@|@@%402%338%179%324%123%411%597%598$1@$0@@@$1%597$0@@@|@|@@%402%338%179%324%123%411%611%612$1@$0@@@$1%611$0@@@|@|@@%402%338%179%324%123%411%613%614$1@$0@@@$1%613$0@@@|@|@@%402%338%179%324%123%411%607%608$1@$0@@@$1%607$0@@@|@|@@%402%338%179%324%123%411%605%606$1@$0@@@$1%605$0@@@|@|@@%402%338%179%324%123%411%599%600$1@$0@@@$1%599$0@@@|@|@@%338%179%324%123%411%601%602$1@$0@@@$1%601$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_fupdfupds x = x
    val op elf32_section_header_table_entry_fupdfupds =
    DT(((("elf_section_header_table",144),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_section_header_table",[116,117,118,142])]),["DISK_THM"]),
       [read"%402%338%201%338%179%324%123%413%610$1@%610$2@$0@@@%610%719$1@$2@@$0@@|@|@|@@%402%338%201%338%179%324%123%413%616$1@%616$2@$0@@@%616%719$1@$2@@$0@@|@|@|@@%402%338%201%338%179%324%123%413%604$1@%604$2@$0@@@%604%719$1@$2@@$0@@|@|@|@@%402%338%201%338%179%324%123%413%598$1@%598$2@$0@@@%598%719$1@$2@@$0@@|@|@|@@%402%338%201%338%179%324%123%413%612$1@%612$2@$0@@@%612%719$1@$2@@$0@@|@|@|@@%402%338%201%338%179%324%123%413%614$1@%614$2@$0@@@%614%719$1@$2@@$0@@|@|@|@@%402%338%201%338%179%324%123%413%608$1@%608$2@$0@@@%608%719$1@$2@@$0@@|@|@|@@%402%338%201%338%179%324%123%413%606$1@%606$2@$0@@@%606%719$1@$2@@$0@@|@|@|@@%402%338%201%338%179%324%123%413%600$1@%600$2@$0@@@%600%719$1@$2@@$0@@|@|@|@@%338%201%338%179%324%123%413%602$1@%602$2@$0@@@%602%719$1@$2@@$0@@|@|@|@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_fupdfupds_comp x = x
    val op elf32_section_header_table_entry_fupdfupds_comp =
    DT(((("elf_section_header_table",145),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_section_header_table",[116,117,118,142])]),["DISK_THM"]),
       [read"%402%402%338%201%338%179%433%723%610$0@@%610$1@@@%610%719$0@$1@@@|@|@@%330%207%338%201%338%179%429%722%610$0@@%722%610$1@@$2@@@%722%610%719$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%433%723%616$0@@%616$1@@@%616%719$0@$1@@@|@|@@%330%207%338%201%338%179%429%722%616$0@@%722%616$1@@$2@@@%722%616%719$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%433%723%604$0@@%604$1@@@%604%719$0@$1@@@|@|@@%330%207%338%201%338%179%429%722%604$0@@%722%604$1@@$2@@@%722%604%719$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%433%723%598$0@@%598$1@@@%598%719$0@$1@@@|@|@@%330%207%338%201%338%179%429%722%598$0@@%722%598$1@@$2@@@%722%598%719$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%433%723%612$0@@%612$1@@@%612%719$0@$1@@@|@|@@%330%207%338%201%338%179%429%722%612$0@@%722%612$1@@$2@@@%722%612%719$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%433%723%614$0@@%614$1@@@%614%719$0@$1@@@|@|@@%330%207%338%201%338%179%429%722%614$0@@%722%614$1@@$2@@@%722%614%719$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%433%723%608$0@@%608$1@@@%608%719$0@$1@@@|@|@@%330%207%338%201%338%179%429%722%608$0@@%722%608$1@@$2@@@%722%608%719$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%433%723%606$0@@%606$1@@@%606%719$0@$1@@@|@|@@%330%207%338%201%338%179%429%722%606$0@@%722%606$1@@$2@@@%722%606%719$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%433%723%600$0@@%600$1@@@%600%719$0@$1@@@|@|@@%330%207%338%201%338%179%429%722%600$0@@%722%600$1@@$2@@@%722%600%719$0@$1@@@$2@@|@|@|@@@%402%338%201%338%179%433%723%602$0@@%602$1@@@%602%719$0@$1@@@|@|@@%330%207%338%201%338%179%429%722%602$0@@%722%602$1@@$2@@@%722%602%719$0@$1@@@$2@@|@|@|@@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_fupdcanon x = x
    val op elf32_section_header_table_entry_fupdcanon =
    DT(((("elf_section_header_table",146),
        [("bool",[25,26,56,181]),
         ("elf_section_header_table",[116,117,118,142])]),["DISK_THM"]),
       [read"%402%338%201%338%179%324%123%413%616$1@%610$2@$0@@@%610$2@%616$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%604$1@%610$2@$0@@@%610$2@%604$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%604$1@%616$2@$0@@@%616$2@%604$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%598$1@%610$2@$0@@@%610$2@%598$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%598$1@%616$2@$0@@@%616$2@%598$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%598$1@%604$2@$0@@@%604$2@%598$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%612$1@%610$2@$0@@@%610$2@%612$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%612$1@%616$2@$0@@@%616$2@%612$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%612$1@%604$2@$0@@@%604$2@%612$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%612$1@%598$2@$0@@@%598$2@%612$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%614$1@%610$2@$0@@@%610$2@%614$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%614$1@%616$2@$0@@@%616$2@%614$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%614$1@%604$2@$0@@@%604$2@%614$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%614$1@%598$2@$0@@@%598$2@%614$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%614$1@%612$2@$0@@@%612$2@%614$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%608$1@%610$2@$0@@@%610$2@%608$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%608$1@%616$2@$0@@@%616$2@%608$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%608$1@%604$2@$0@@@%604$2@%608$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%608$1@%598$2@$0@@@%598$2@%608$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%608$1@%612$2@$0@@@%612$2@%608$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%608$1@%614$2@$0@@@%614$2@%608$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%606$1@%610$2@$0@@@%610$2@%606$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%606$1@%616$2@$0@@@%616$2@%606$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%606$1@%604$2@$0@@@%604$2@%606$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%606$1@%598$2@$0@@@%598$2@%606$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%606$1@%612$2@$0@@@%612$2@%606$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%606$1@%614$2@$0@@@%614$2@%606$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%606$1@%608$2@$0@@@%608$2@%606$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%600$1@%610$2@$0@@@%610$2@%600$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%600$1@%616$2@$0@@@%616$2@%600$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%600$1@%604$2@$0@@@%604$2@%600$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%600$1@%598$2@$0@@@%598$2@%600$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%600$1@%612$2@$0@@@%612$2@%600$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%600$1@%614$2@$0@@@%614$2@%600$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%600$1@%608$2@$0@@@%608$2@%600$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%600$1@%606$2@$0@@@%606$2@%600$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%602$1@%610$2@$0@@@%610$2@%602$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%602$1@%616$2@$0@@@%616$2@%602$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%602$1@%604$2@$0@@@%604$2@%602$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%602$1@%598$2@$0@@@%598$2@%602$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%602$1@%612$2@$0@@@%612$2@%602$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%602$1@%614$2@$0@@@%614$2@%602$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%602$1@%608$2@$0@@@%608$2@%602$1@$0@@@|@|@|@@%402%338%201%338%179%324%123%413%602$1@%606$2@$0@@@%606$2@%602$1@$0@@@|@|@|@@%338%201%338%179%324%123%413%602$1@%600$2@$0@@@%600$2@%602$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_fupdcanon_comp x = x
    val op elf32_section_header_table_entry_fupdcanon_comp =
    DT(((("elf_section_header_table",147),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_section_header_table",[116,117,118,142])]),["DISK_THM"]),
       [read"%402%402%338%201%338%179%433%723%616$0@@%610$1@@@%723%610$1@@%616$0@@@|@|@@%330%207%338%201%338%179%429%722%616$0@@%722%610$1@@$2@@@%722%610$1@@%722%616$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%604$0@@%610$1@@@%723%610$1@@%604$0@@@|@|@@%330%207%338%201%338%179%429%722%604$0@@%722%610$1@@$2@@@%722%610$1@@%722%604$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%604$0@@%616$1@@@%723%616$1@@%604$0@@@|@|@@%330%207%338%201%338%179%429%722%604$0@@%722%616$1@@$2@@@%722%616$1@@%722%604$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%598$0@@%610$1@@@%723%610$1@@%598$0@@@|@|@@%330%207%338%201%338%179%429%722%598$0@@%722%610$1@@$2@@@%722%610$1@@%722%598$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%598$0@@%616$1@@@%723%616$1@@%598$0@@@|@|@@%330%207%338%201%338%179%429%722%598$0@@%722%616$1@@$2@@@%722%616$1@@%722%598$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%598$0@@%604$1@@@%723%604$1@@%598$0@@@|@|@@%330%207%338%201%338%179%429%722%598$0@@%722%604$1@@$2@@@%722%604$1@@%722%598$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%612$0@@%610$1@@@%723%610$1@@%612$0@@@|@|@@%330%207%338%201%338%179%429%722%612$0@@%722%610$1@@$2@@@%722%610$1@@%722%612$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%612$0@@%616$1@@@%723%616$1@@%612$0@@@|@|@@%330%207%338%201%338%179%429%722%612$0@@%722%616$1@@$2@@@%722%616$1@@%722%612$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%612$0@@%604$1@@@%723%604$1@@%612$0@@@|@|@@%330%207%338%201%338%179%429%722%612$0@@%722%604$1@@$2@@@%722%604$1@@%722%612$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%612$0@@%598$1@@@%723%598$1@@%612$0@@@|@|@@%330%207%338%201%338%179%429%722%612$0@@%722%598$1@@$2@@@%722%598$1@@%722%612$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%614$0@@%610$1@@@%723%610$1@@%614$0@@@|@|@@%330%207%338%201%338%179%429%722%614$0@@%722%610$1@@$2@@@%722%610$1@@%722%614$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%614$0@@%616$1@@@%723%616$1@@%614$0@@@|@|@@%330%207%338%201%338%179%429%722%614$0@@%722%616$1@@$2@@@%722%616$1@@%722%614$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%614$0@@%604$1@@@%723%604$1@@%614$0@@@|@|@@%330%207%338%201%338%179%429%722%614$0@@%722%604$1@@$2@@@%722%604$1@@%722%614$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%614$0@@%598$1@@@%723%598$1@@%614$0@@@|@|@@%330%207%338%201%338%179%429%722%614$0@@%722%598$1@@$2@@@%722%598$1@@%722%614$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%614$0@@%612$1@@@%723%612$1@@%614$0@@@|@|@@%330%207%338%201%338%179%429%722%614$0@@%722%612$1@@$2@@@%722%612$1@@%722%614$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%608$0@@%610$1@@@%723%610$1@@%608$0@@@|@|@@%330%207%338%201%338%179%429%722%608$0@@%722%610$1@@$2@@@%722%610$1@@%722%608$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%608$0@@%616$1@@@%723%616$1@@%608$0@@@|@|@@%330%207%338%201%338%179%429%722%608$0@@%722%616$1@@$2@@@%722%616$1@@%722%608$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%608$0@@%604$1@@@%723%604$1@@%608$0@@@|@|@@%330%207%338%201%338%179%429%722%608$0@@%722%604$1@@$2@@@%722%604$1@@%722%608$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%608$0@@%598$1@@@%723%598$1@@%608$0@@@|@|@@%330%207%338%201%338%179%429%722%608$0@@%722%598$1@@$2@@@%722%598$1@@%722%608$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%608$0@@%612$1@@@%723%612$1@@%608$0@@@|@|@@%330%207%338%201%338%179%429%722%608$0@@%722%612$1@@$2@@@%722%612$1@@%722%608$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%608$0@@%614$1@@@%723%614$1@@%608$0@@@|@|@@%330%207%338%201%338%179%429%722%608$0@@%722%614$1@@$2@@@%722%614$1@@%722%608$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%606$0@@%610$1@@@%723%610$1@@%606$0@@@|@|@@%330%207%338%201%338%179%429%722%606$0@@%722%610$1@@$2@@@%722%610$1@@%722%606$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%606$0@@%616$1@@@%723%616$1@@%606$0@@@|@|@@%330%207%338%201%338%179%429%722%606$0@@%722%616$1@@$2@@@%722%616$1@@%722%606$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%606$0@@%604$1@@@%723%604$1@@%606$0@@@|@|@@%330%207%338%201%338%179%429%722%606$0@@%722%604$1@@$2@@@%722%604$1@@%722%606$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%606$0@@%598$1@@@%723%598$1@@%606$0@@@|@|@@%330%207%338%201%338%179%429%722%606$0@@%722%598$1@@$2@@@%722%598$1@@%722%606$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%606$0@@%612$1@@@%723%612$1@@%606$0@@@|@|@@%330%207%338%201%338%179%429%722%606$0@@%722%612$1@@$2@@@%722%612$1@@%722%606$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%606$0@@%614$1@@@%723%614$1@@%606$0@@@|@|@@%330%207%338%201%338%179%429%722%606$0@@%722%614$1@@$2@@@%722%614$1@@%722%606$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%606$0@@%608$1@@@%723%608$1@@%606$0@@@|@|@@%330%207%338%201%338%179%429%722%606$0@@%722%608$1@@$2@@@%722%608$1@@%722%606$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%600$0@@%610$1@@@%723%610$1@@%600$0@@@|@|@@%330%207%338%201%338%179%429%722%600$0@@%722%610$1@@$2@@@%722%610$1@@%722%600$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%600$0@@%616$1@@@%723%616$1@@%600$0@@@|@|@@%330%207%338%201%338%179%429%722%600$0@@%722%616$1@@$2@@@%722%616$1@@%722%600$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%600$0@@%604$1@@@%723%604$1@@%600$0@@@|@|@@%330%207%338%201%338%179%429%722%600$0@@%722%604$1@@$2@@@%722%604$1@@%722%600$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%600$0@@%598$1@@@%723%598$1@@%600$0@@@|@|@@%330%207%338%201%338%179%429%722%600$0@@%722%598$1@@$2@@@%722%598$1@@%722%600$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%600$0@@%612$1@@@%723%612$1@@%600$0@@@|@|@@%330%207%338%201%338%179%429%722%600$0@@%722%612$1@@$2@@@%722%612$1@@%722%600$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%600$0@@%614$1@@@%723%614$1@@%600$0@@@|@|@@%330%207%338%201%338%179%429%722%600$0@@%722%614$1@@$2@@@%722%614$1@@%722%600$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%600$0@@%608$1@@@%723%608$1@@%600$0@@@|@|@@%330%207%338%201%338%179%429%722%600$0@@%722%608$1@@$2@@@%722%608$1@@%722%600$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%600$0@@%606$1@@@%723%606$1@@%600$0@@@|@|@@%330%207%338%201%338%179%429%722%600$0@@%722%606$1@@$2@@@%722%606$1@@%722%600$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%602$0@@%610$1@@@%723%610$1@@%602$0@@@|@|@@%330%207%338%201%338%179%429%722%602$0@@%722%610$1@@$2@@@%722%610$1@@%722%602$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%602$0@@%616$1@@@%723%616$1@@%602$0@@@|@|@@%330%207%338%201%338%179%429%722%602$0@@%722%616$1@@$2@@@%722%616$1@@%722%602$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%602$0@@%604$1@@@%723%604$1@@%602$0@@@|@|@@%330%207%338%201%338%179%429%722%602$0@@%722%604$1@@$2@@@%722%604$1@@%722%602$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%602$0@@%598$1@@@%723%598$1@@%602$0@@@|@|@@%330%207%338%201%338%179%429%722%602$0@@%722%598$1@@$2@@@%722%598$1@@%722%602$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%602$0@@%612$1@@@%723%612$1@@%602$0@@@|@|@@%330%207%338%201%338%179%429%722%602$0@@%722%612$1@@$2@@@%722%612$1@@%722%602$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%602$0@@%614$1@@@%723%614$1@@%602$0@@@|@|@@%330%207%338%201%338%179%429%722%602$0@@%722%614$1@@$2@@@%722%614$1@@%722%602$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%602$0@@%608$1@@@%723%608$1@@%602$0@@@|@|@@%330%207%338%201%338%179%429%722%602$0@@%722%608$1@@$2@@@%722%608$1@@%722%602$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%433%723%602$0@@%606$1@@@%723%606$1@@%602$0@@@|@|@@%330%207%338%201%338%179%429%722%602$0@@%722%606$1@@$2@@@%722%606$1@@%722%602$0@@$2@@@|@|@|@@@%402%338%201%338%179%433%723%602$0@@%600$1@@@%723%600$1@@%602$0@@@|@|@@%330%207%338%201%338%179%429%722%602$0@@%722%600$1@@$2@@@%722%600$1@@%722%602$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_component_equality x = x
    val op elf32_section_header_table_entry_component_equality =
    DT(((("elf_section_header_table",148),
        [("bool",[25,26,51,56,63,181]),
         ("elf_section_header_table",[116,117,118,131]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%324%127%324%131%408%413$1@$0@@%402%411%609$1@@%609$0@@@%402%411%615$1@@%615$0@@@%402%411%603$1@@%603$0@@@%402%411%597$1@@%597$0@@@%402%411%611$1@@%611$0@@@%402%411%613$1@@%613$0@@@%402%411%607$1@@%607$0@@@%402%411%605$1@@%605$0@@@%402%411%599$1@@%599$0@@@%411%601$1@@%601$0@@@@@@@@@@@@|@|@"])
  fun op elf32_section_header_table_entry_updates_eq_literal x = x
    val op elf32_section_header_table_entry_updates_eq_literal =
    DT(((("elf_section_header_table",149),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_section_header_table",[116,117,118,142])]),["DISK_THM"]),
       [read"%324%123%321%117%321%113%321%107%321%101%321%95%321%89%321%85%321%81%321%75%321%73%413%610%510$9@@%616%510$8@@%604%510$7@@%598%510$6@@%612%510$5@@%614%510$4@@%608%510$3@@%606%510$2@@%600%510$1@@%602%510$0@@$10@@@@@@@@@@@%610%510$9@@%616%510$8@@%604%510$7@@%598%510$6@@%612%510$5@@%614%510$4@@%608%510$3@@%606%510$2@@%600%510$1@@%602%510$0@@%469@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_literal_nchotomy x = x
    val op elf32_section_header_table_entry_literal_nchotomy =
    DT(((("elf_section_header_table",150),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_section_header_table",[116,117,118,142]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%324%123%450%117%450%113%450%107%450%101%450%95%450%89%450%85%450%81%450%75%450%73%413$10@%610%510$9@@%616%510$8@@%604%510$7@@%598%510$6@@%612%510$5@@%614%510$4@@%608%510$3@@%606%510$2@@%600%510$1@@%602%510$0@@%469@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf32_section_header_table_entry x = x
    val op FORALL_elf32_section_header_table_entry =
    DT(((("elf_section_header_table",151),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_section_header_table",[116,117,118,142]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%344%15%408%324%123$1$0@|@@%321%117%321%113%321%107%321%101%321%95%321%89%321%85%321%81%321%75%321%73$10%610%510$9@@%616%510$8@@%604%510$7@@%598%510$6@@%612%510$5@@%614%510$4@@%608%510$3@@%606%510$2@@%600%510$1@@%602%510$0@@%469@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf32_section_header_table_entry x = x
    val op EXISTS_elf32_section_header_table_entry =
    DT(((("elf_section_header_table",152),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_section_header_table",[116,117,118,142]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%344%15%408%452%123$1$0@|@@%450%117%450%113%450%107%450%101%450%95%450%89%450%85%450%81%450%75%450%73$10%610%510$9@@%616%510$8@@%604%510$7@@%598%510$6@@%612%510$5@@%614%510$4@@%608%510$3@@%606%510$2@@%600%510$1@@%602%510$0@@%469@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op elf32_section_header_table_entry_literal_11 x = x
    val op elf32_section_header_table_entry_literal_11 =
    DT(((("elf_section_header_table",153),
        [("combin",[12]),
         ("elf_section_header_table",[143,148])]),["DISK_THM"]),
       [read"%321%118%321%114%321%109%321%103%321%97%321%91%321%86%321%82%321%77%321%81%321%119%321%115%321%111%321%105%321%99%321%93%321%87%321%83%321%79%321%85%408%413%610%510$19@@%616%510$18@@%604%510$17@@%598%510$16@@%612%510$15@@%614%510$14@@%608%510$13@@%606%510$12@@%600%510$11@@%602%510$10@@%469@@@@@@@@@@@%610%510$9@@%616%510$8@@%604%510$7@@%598%510$6@@%612%510$5@@%614%510$4@@%608%510$3@@%606%510$2@@%600%510$1@@%602%510$0@@%469@@@@@@@@@@@@%402%411$19@$9@@%402%411$18@$8@@%402%411$17@$7@@%402%411$16@$6@@%402%411$15@$5@@%402%411$14@$4@@%402%411$13@$3@@%402%411$12@$2@@%402%411$11@$1@@%411$10@$0@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf32_section_header_table_entry x = x
    val op datatype_elf32_section_header_table_entry =
    DT(((("elf_section_header_table",154),
        [("bool",[25,171])]),["DISK_THM"]),
       [read"%494%234%144@%151@%154@%148@%145@%152@%153@%150@%149@%146@%147@@"])
  fun op elf32_section_header_table_entry_11 x = x
    val op elf32_section_header_table_entry_11 =
    DT(((("elf_section_header_table",155),
        [("bool",[26,51,56,63,181]),
         ("elf_section_header_table",[116,117,118]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%321%25%321%31%321%34%321%38%321%42%321%46%321%49%321%51%321%54%321%58%321%26%321%32%321%36%321%40%321%44%321%48%321%50%321%52%321%56%321%60%408%413%774$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%402%411$19@$9@@%402%411$18@$8@@%402%411$17@$7@@%402%411$16@$6@@%402%411$15@$5@@%402%411$14@$4@@%402%411$13@$3@@%402%411$12@$2@@%402%411$11@$1@@%411$10@$0@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_case_cong x = x
    val op elf32_section_header_table_entry_case_cong =
    DT(((("elf_section_header_table",156),
        [("bool",[26,181]),
         ("elf_section_header_table",[116,117,118,119])]),["DISK_THM"]),
       [read"%324%5%324%9%342%183%448%402%413$2@$1@@%321%25%321%31%321%34%321%38%321%42%321%46%321%49%321%51%321%54%321%58%448%413$11@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%405$10$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%187$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@|@|@@@%405%596$2@$0@@%596$1@%187@@@|@|@|@"])
  fun op elf32_section_header_table_entry_nchotomy x = x
    val op elf32_section_header_table_entry_nchotomy =
    DT(((("elf_section_header_table",157),
        [("bool",[26,181]),
         ("elf_section_header_table",[116,117,118])]),["DISK_THM"]),
       [read"%324%137%450%73%450%75%450%81%450%85%450%89%450%95%450%101%450%107%450%113%450%117%413$10@%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_Axiom x = x
    val op elf32_section_header_table_entry_Axiom =
    DT(((("elf_section_header_table",158),
        [("bool",[26,181]),("elf_section_header_table",[116,117,118]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%342%183%457%197%321%25%321%31%321%34%321%38%321%42%321%46%321%49%321%51%321%54%321%58%405$10%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_induction x = x
    val op elf32_section_header_table_entry_induction =
    DT(((("elf_section_header_table",159),
        [("bool",[26]),
         ("elf_section_header_table",[116,117,118])]),["DISK_THM"]),
       [read"%344%15%448%321%73%321%75%321%81%321%85%321%89%321%95%321%101%321%107%321%113%321%117$10%774$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@@%324%123$1$0@|@@|@"])
  fun op elf64_section_header_table_entry_accessors x = x
    val op elf64_section_header_table_entry_accessors =
    DT(((("elf_section_header_table",178),
        [("elf_section_header_table",
         [168,169,170,171,172,173,174,175,176,177])]),["DISK_THM"]),
       [read"%402%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%411%644%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%411%650%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%410%638%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%410%632%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%410%646%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%410%648%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%411%642%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%411%640%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@@%402%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%410%634%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@@%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%410%636%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_fn_updates x = x
    val op elf64_section_header_table_entry_fn_updates =
    DT(((("elf_section_header_table",189),
        [("elf_section_header_table",
         [179,180,181,182,183,184,185,186,187,188])]),["DISK_THM"]),
       [read"%402%338%179%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%645$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$10$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%338%179%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%651$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$10$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%337%178%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%639$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$10$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%337%178%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%633$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$10$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%337%178%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%647$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$6@$10$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%337%178%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%649$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$6@$5@$10$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%338%179%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%643$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$6@$5@$4@$10$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%338%179%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%641$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$6@$5@$4@$3@$10$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%402%337%178%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%635$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$6@$5@$4@$3@$2@$10$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@@%337%178%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116%415%637$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$10$0@@@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_accfupds x = x
    val op elf64_section_header_table_entry_accfupds =
    DT(((("elf_section_header_table",190),
        [("bool",[25,26,56,181]),
         ("elf_section_header_table",
         [163,164,165,178,189])]),["DISK_THM"]),
       [read"%402%338%179%327%125%411%644%651$1@$0@@@%644$0@@|@|@@%402%337%178%327%125%411%644%639$1@$0@@@%644$0@@|@|@@%402%337%178%327%125%411%644%633$1@$0@@@%644$0@@|@|@@%402%337%178%327%125%411%644%647$1@$0@@@%644$0@@|@|@@%402%337%178%327%125%411%644%649$1@$0@@@%644$0@@|@|@@%402%338%179%327%125%411%644%643$1@$0@@@%644$0@@|@|@@%402%338%179%327%125%411%644%641$1@$0@@@%644$0@@|@|@@%402%337%178%327%125%411%644%635$1@$0@@@%644$0@@|@|@@%402%337%178%327%125%411%644%637$1@$0@@@%644$0@@|@|@@%402%338%179%327%125%411%650%645$1@$0@@@%650$0@@|@|@@%402%337%178%327%125%411%650%639$1@$0@@@%650$0@@|@|@@%402%337%178%327%125%411%650%633$1@$0@@@%650$0@@|@|@@%402%337%178%327%125%411%650%647$1@$0@@@%650$0@@|@|@@%402%337%178%327%125%411%650%649$1@$0@@@%650$0@@|@|@@%402%338%179%327%125%411%650%643$1@$0@@@%650$0@@|@|@@%402%338%179%327%125%411%650%641$1@$0@@@%650$0@@|@|@@%402%337%178%327%125%411%650%635$1@$0@@@%650$0@@|@|@@%402%337%178%327%125%411%650%637$1@$0@@@%650$0@@|@|@@%402%338%179%327%125%410%638%645$1@$0@@@%638$0@@|@|@@%402%338%179%327%125%410%638%651$1@$0@@@%638$0@@|@|@@%402%337%178%327%125%410%638%633$1@$0@@@%638$0@@|@|@@%402%337%178%327%125%410%638%647$1@$0@@@%638$0@@|@|@@%402%337%178%327%125%410%638%649$1@$0@@@%638$0@@|@|@@%402%338%179%327%125%410%638%643$1@$0@@@%638$0@@|@|@@%402%338%179%327%125%410%638%641$1@$0@@@%638$0@@|@|@@%402%337%178%327%125%410%638%635$1@$0@@@%638$0@@|@|@@%402%337%178%327%125%410%638%637$1@$0@@@%638$0@@|@|@@%402%338%179%327%125%410%632%645$1@$0@@@%632$0@@|@|@@%402%338%179%327%125%410%632%651$1@$0@@@%632$0@@|@|@@%402%337%178%327%125%410%632%639$1@$0@@@%632$0@@|@|@@%402%337%178%327%125%410%632%647$1@$0@@@%632$0@@|@|@@%402%337%178%327%125%410%632%649$1@$0@@@%632$0@@|@|@@%402%338%179%327%125%410%632%643$1@$0@@@%632$0@@|@|@@%402%338%179%327%125%410%632%641$1@$0@@@%632$0@@|@|@@%402%337%178%327%125%410%632%635$1@$0@@@%632$0@@|@|@@%402%337%178%327%125%410%632%637$1@$0@@@%632$0@@|@|@@%402%338%179%327%125%410%646%645$1@$0@@@%646$0@@|@|@@%402%338%179%327%125%410%646%651$1@$0@@@%646$0@@|@|@@%402%337%178%327%125%410%646%639$1@$0@@@%646$0@@|@|@@%402%337%178%327%125%410%646%633$1@$0@@@%646$0@@|@|@@%402%337%178%327%125%410%646%649$1@$0@@@%646$0@@|@|@@%402%338%179%327%125%410%646%643$1@$0@@@%646$0@@|@|@@%402%338%179%327%125%410%646%641$1@$0@@@%646$0@@|@|@@%402%337%178%327%125%410%646%635$1@$0@@@%646$0@@|@|@@%402%337%178%327%125%410%646%637$1@$0@@@%646$0@@|@|@@%402%338%179%327%125%410%648%645$1@$0@@@%648$0@@|@|@@%402%338%179%327%125%410%648%651$1@$0@@@%648$0@@|@|@@%402%337%178%327%125%410%648%639$1@$0@@@%648$0@@|@|@@%402%337%178%327%125%410%648%633$1@$0@@@%648$0@@|@|@@%402%337%178%327%125%410%648%647$1@$0@@@%648$0@@|@|@@%402%338%179%327%125%410%648%643$1@$0@@@%648$0@@|@|@@%402%338%179%327%125%410%648%641$1@$0@@@%648$0@@|@|@@%402%337%178%327%125%410%648%635$1@$0@@@%648$0@@|@|@@%402%337%178%327%125%410%648%637$1@$0@@@%648$0@@|@|@@%402%338%179%327%125%411%642%645$1@$0@@@%642$0@@|@|@@%402%338%179%327%125%411%642%651$1@$0@@@%642$0@@|@|@@%402%337%178%327%125%411%642%639$1@$0@@@%642$0@@|@|@@%402%337%178%327%125%411%642%633$1@$0@@@%642$0@@|@|@@%402%337%178%327%125%411%642%647$1@$0@@@%642$0@@|@|@@%402%337%178%327%125%411%642%649$1@$0@@@%642$0@@|@|@@%402%338%179%327%125%411%642%641$1@$0@@@%642$0@@|@|@@%402%337%178%327%125%411%642%635$1@$0@@@%642$0@@|@|@@%402%337%178%327%125%411%642%637$1@$0@@@%642$0@@|@|@@%402%338%179%327%125%411%640%645$1@$0@@@%640$0@@|@|@@%402%338%179%327%125%411%640%651$1@$0@@@%640$0@@|@|@@%402%337%178%327%125%411%640%639$1@$0@@@%640$0@@|@|@@%402%337%178%327%125%411%640%633$1@$0@@@%640$0@@|@|@@%402%337%178%327%125%411%640%647$1@$0@@@%640$0@@|@|@@%402%337%178%327%125%411%640%649$1@$0@@@%640$0@@|@|@@%402%338%179%327%125%411%640%643$1@$0@@@%640$0@@|@|@@%402%337%178%327%125%411%640%635$1@$0@@@%640$0@@|@|@@%402%337%178%327%125%411%640%637$1@$0@@@%640$0@@|@|@@%402%338%179%327%125%410%634%645$1@$0@@@%634$0@@|@|@@%402%338%179%327%125%410%634%651$1@$0@@@%634$0@@|@|@@%402%337%178%327%125%410%634%639$1@$0@@@%634$0@@|@|@@%402%337%178%327%125%410%634%633$1@$0@@@%634$0@@|@|@@%402%337%178%327%125%410%634%647$1@$0@@@%634$0@@|@|@@%402%337%178%327%125%410%634%649$1@$0@@@%634$0@@|@|@@%402%338%179%327%125%410%634%643$1@$0@@@%634$0@@|@|@@%402%338%179%327%125%410%634%641$1@$0@@@%634$0@@|@|@@%402%337%178%327%125%410%634%637$1@$0@@@%634$0@@|@|@@%402%338%179%327%125%410%636%645$1@$0@@@%636$0@@|@|@@%402%338%179%327%125%410%636%651$1@$0@@@%636$0@@|@|@@%402%337%178%327%125%410%636%639$1@$0@@@%636$0@@|@|@@%402%337%178%327%125%410%636%633$1@$0@@@%636$0@@|@|@@%402%337%178%327%125%410%636%647$1@$0@@@%636$0@@|@|@@%402%337%178%327%125%410%636%649$1@$0@@@%636$0@@|@|@@%402%338%179%327%125%410%636%643$1@$0@@@%636$0@@|@|@@%402%338%179%327%125%410%636%641$1@$0@@@%636$0@@|@|@@%402%337%178%327%125%410%636%635$1@$0@@@%636$0@@|@|@@%402%338%179%327%125%411%644%645$1@$0@@@$1%644$0@@@|@|@@%402%338%179%327%125%411%650%651$1@$0@@@$1%650$0@@@|@|@@%402%337%178%327%125%410%638%639$1@$0@@@$1%638$0@@@|@|@@%402%337%178%327%125%410%632%633$1@$0@@@$1%632$0@@@|@|@@%402%337%178%327%125%410%646%647$1@$0@@@$1%646$0@@@|@|@@%402%337%178%327%125%410%648%649$1@$0@@@$1%648$0@@@|@|@@%402%338%179%327%125%411%642%643$1@$0@@@$1%642$0@@@|@|@@%402%338%179%327%125%411%640%641$1@$0@@@$1%640$0@@@|@|@@%402%337%178%327%125%410%634%635$1@$0@@@$1%634$0@@@|@|@@%337%178%327%125%410%636%637$1@$0@@@$1%636$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_fupdfupds x = x
    val op elf64_section_header_table_entry_fupdfupds =
    DT(((("elf_section_header_table",191),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_section_header_table",[163,164,165,189])]),["DISK_THM"]),
       [read"%402%338%201%338%179%327%125%415%645$1@%645$2@$0@@@%645%719$1@$2@@$0@@|@|@|@@%402%338%201%338%179%327%125%415%651$1@%651$2@$0@@@%651%719$1@$2@@$0@@|@|@|@@%402%337%200%337%178%327%125%415%639$1@%639$2@$0@@@%639%718$1@$2@@$0@@|@|@|@@%402%337%200%337%178%327%125%415%633$1@%633$2@$0@@@%633%718$1@$2@@$0@@|@|@|@@%402%337%200%337%178%327%125%415%647$1@%647$2@$0@@@%647%718$1@$2@@$0@@|@|@|@@%402%337%200%337%178%327%125%415%649$1@%649$2@$0@@@%649%718$1@$2@@$0@@|@|@|@@%402%338%201%338%179%327%125%415%643$1@%643$2@$0@@@%643%719$1@$2@@$0@@|@|@|@@%402%338%201%338%179%327%125%415%641$1@%641$2@$0@@@%641%719$1@$2@@$0@@|@|@|@@%402%337%200%337%178%327%125%415%635$1@%635$2@$0@@@%635%718$1@$2@@$0@@|@|@|@@%337%200%337%178%327%125%415%637$1@%637$2@$0@@@%637%718$1@$2@@$0@@|@|@|@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_fupdfupds_comp x = x
    val op elf64_section_header_table_entry_fupdfupds_comp =
    DT(((("elf_section_header_table",192),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_section_header_table",[163,164,165,189])]),["DISK_THM"]),
       [read"%402%402%338%201%338%179%435%727%645$0@@%645$1@@@%645%719$0@$1@@@|@|@@%332%209%338%201%338%179%431%726%645$0@@%726%645$1@@$2@@@%726%645%719$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%435%727%651$0@@%651$1@@@%651%719$0@$1@@@|@|@@%332%209%338%201%338%179%431%726%651$0@@%726%651$1@@$2@@@%726%651%719$0@$1@@@$2@@|@|@|@@@%402%402%337%200%337%178%435%727%639$0@@%639$1@@@%639%718$0@$1@@@|@|@@%332%209%337%200%337%178%431%726%639$0@@%726%639$1@@$2@@@%726%639%718$0@$1@@@$2@@|@|@|@@@%402%402%337%200%337%178%435%727%633$0@@%633$1@@@%633%718$0@$1@@@|@|@@%332%209%337%200%337%178%431%726%633$0@@%726%633$1@@$2@@@%726%633%718$0@$1@@@$2@@|@|@|@@@%402%402%337%200%337%178%435%727%647$0@@%647$1@@@%647%718$0@$1@@@|@|@@%332%209%337%200%337%178%431%726%647$0@@%726%647$1@@$2@@@%726%647%718$0@$1@@@$2@@|@|@|@@@%402%402%337%200%337%178%435%727%649$0@@%649$1@@@%649%718$0@$1@@@|@|@@%332%209%337%200%337%178%431%726%649$0@@%726%649$1@@$2@@@%726%649%718$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%435%727%643$0@@%643$1@@@%643%719$0@$1@@@|@|@@%332%209%338%201%338%179%431%726%643$0@@%726%643$1@@$2@@@%726%643%719$0@$1@@@$2@@|@|@|@@@%402%402%338%201%338%179%435%727%641$0@@%641$1@@@%641%719$0@$1@@@|@|@@%332%209%338%201%338%179%431%726%641$0@@%726%641$1@@$2@@@%726%641%719$0@$1@@@$2@@|@|@|@@@%402%402%337%200%337%178%435%727%635$0@@%635$1@@@%635%718$0@$1@@@|@|@@%332%209%337%200%337%178%431%726%635$0@@%726%635$1@@$2@@@%726%635%718$0@$1@@@$2@@|@|@|@@@%402%337%200%337%178%435%727%637$0@@%637$1@@@%637%718$0@$1@@@|@|@@%332%209%337%200%337%178%431%726%637$0@@%726%637$1@@$2@@@%726%637%718$0@$1@@@$2@@|@|@|@@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_fupdcanon x = x
    val op elf64_section_header_table_entry_fupdcanon =
    DT(((("elf_section_header_table",193),
        [("bool",[25,26,56,181]),
         ("elf_section_header_table",[163,164,165,189])]),["DISK_THM"]),
       [read"%402%338%201%338%179%327%125%415%651$1@%645$2@$0@@@%645$2@%651$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%639$1@%645$2@$0@@@%645$2@%639$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%639$1@%651$2@$0@@@%651$2@%639$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%633$1@%645$2@$0@@@%645$2@%633$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%633$1@%651$2@$0@@@%651$2@%633$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%633$1@%639$2@$0@@@%639$2@%633$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%647$1@%645$2@$0@@@%645$2@%647$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%647$1@%651$2@$0@@@%651$2@%647$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%647$1@%639$2@$0@@@%639$2@%647$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%647$1@%633$2@$0@@@%633$2@%647$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%649$1@%645$2@$0@@@%645$2@%649$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%649$1@%651$2@$0@@@%651$2@%649$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%649$1@%639$2@$0@@@%639$2@%649$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%649$1@%633$2@$0@@@%633$2@%649$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%649$1@%647$2@$0@@@%647$2@%649$1@$0@@@|@|@|@@%402%338%201%338%179%327%125%415%643$1@%645$2@$0@@@%645$2@%643$1@$0@@@|@|@|@@%402%338%201%338%179%327%125%415%643$1@%651$2@$0@@@%651$2@%643$1@$0@@@|@|@|@@%402%337%200%338%179%327%125%415%643$1@%639$2@$0@@@%639$2@%643$1@$0@@@|@|@|@@%402%337%200%338%179%327%125%415%643$1@%633$2@$0@@@%633$2@%643$1@$0@@@|@|@|@@%402%337%200%338%179%327%125%415%643$1@%647$2@$0@@@%647$2@%643$1@$0@@@|@|@|@@%402%337%200%338%179%327%125%415%643$1@%649$2@$0@@@%649$2@%643$1@$0@@@|@|@|@@%402%338%201%338%179%327%125%415%641$1@%645$2@$0@@@%645$2@%641$1@$0@@@|@|@|@@%402%338%201%338%179%327%125%415%641$1@%651$2@$0@@@%651$2@%641$1@$0@@@|@|@|@@%402%337%200%338%179%327%125%415%641$1@%639$2@$0@@@%639$2@%641$1@$0@@@|@|@|@@%402%337%200%338%179%327%125%415%641$1@%633$2@$0@@@%633$2@%641$1@$0@@@|@|@|@@%402%337%200%338%179%327%125%415%641$1@%647$2@$0@@@%647$2@%641$1@$0@@@|@|@|@@%402%337%200%338%179%327%125%415%641$1@%649$2@$0@@@%649$2@%641$1@$0@@@|@|@|@@%402%338%201%338%179%327%125%415%641$1@%643$2@$0@@@%643$2@%641$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%635$1@%645$2@$0@@@%645$2@%635$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%635$1@%651$2@$0@@@%651$2@%635$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%635$1@%639$2@$0@@@%639$2@%635$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%635$1@%633$2@$0@@@%633$2@%635$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%635$1@%647$2@$0@@@%647$2@%635$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%635$1@%649$2@$0@@@%649$2@%635$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%635$1@%643$2@$0@@@%643$2@%635$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%635$1@%641$2@$0@@@%641$2@%635$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%637$1@%645$2@$0@@@%645$2@%637$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%637$1@%651$2@$0@@@%651$2@%637$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%637$1@%639$2@$0@@@%639$2@%637$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%637$1@%633$2@$0@@@%633$2@%637$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%637$1@%647$2@$0@@@%647$2@%637$1@$0@@@|@|@|@@%402%337%200%337%178%327%125%415%637$1@%649$2@$0@@@%649$2@%637$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%637$1@%643$2@$0@@@%643$2@%637$1@$0@@@|@|@|@@%402%338%201%337%178%327%125%415%637$1@%641$2@$0@@@%641$2@%637$1@$0@@@|@|@|@@%337%200%337%178%327%125%415%637$1@%635$2@$0@@@%635$2@%637$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_fupdcanon_comp x = x
    val op elf64_section_header_table_entry_fupdcanon_comp =
    DT(((("elf_section_header_table",194),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_section_header_table",[163,164,165,189])]),["DISK_THM"]),
       [read"%402%402%338%201%338%179%435%727%651$0@@%645$1@@@%727%645$1@@%651$0@@@|@|@@%332%209%338%201%338%179%431%726%651$0@@%726%645$1@@$2@@@%726%645$1@@%726%651$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%639$0@@%645$1@@@%727%645$1@@%639$0@@@|@|@@%332%209%338%201%337%178%431%726%639$0@@%726%645$1@@$2@@@%726%645$1@@%726%639$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%639$0@@%651$1@@@%727%651$1@@%639$0@@@|@|@@%332%209%338%201%337%178%431%726%639$0@@%726%651$1@@$2@@@%726%651$1@@%726%639$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%633$0@@%645$1@@@%727%645$1@@%633$0@@@|@|@@%332%209%338%201%337%178%431%726%633$0@@%726%645$1@@$2@@@%726%645$1@@%726%633$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%633$0@@%651$1@@@%727%651$1@@%633$0@@@|@|@@%332%209%338%201%337%178%431%726%633$0@@%726%651$1@@$2@@@%726%651$1@@%726%633$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%633$0@@%639$1@@@%727%639$1@@%633$0@@@|@|@@%332%209%337%200%337%178%431%726%633$0@@%726%639$1@@$2@@@%726%639$1@@%726%633$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%647$0@@%645$1@@@%727%645$1@@%647$0@@@|@|@@%332%209%338%201%337%178%431%726%647$0@@%726%645$1@@$2@@@%726%645$1@@%726%647$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%647$0@@%651$1@@@%727%651$1@@%647$0@@@|@|@@%332%209%338%201%337%178%431%726%647$0@@%726%651$1@@$2@@@%726%651$1@@%726%647$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%647$0@@%639$1@@@%727%639$1@@%647$0@@@|@|@@%332%209%337%200%337%178%431%726%647$0@@%726%639$1@@$2@@@%726%639$1@@%726%647$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%647$0@@%633$1@@@%727%633$1@@%647$0@@@|@|@@%332%209%337%200%337%178%431%726%647$0@@%726%633$1@@$2@@@%726%633$1@@%726%647$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%649$0@@%645$1@@@%727%645$1@@%649$0@@@|@|@@%332%209%338%201%337%178%431%726%649$0@@%726%645$1@@$2@@@%726%645$1@@%726%649$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%649$0@@%651$1@@@%727%651$1@@%649$0@@@|@|@@%332%209%338%201%337%178%431%726%649$0@@%726%651$1@@$2@@@%726%651$1@@%726%649$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%649$0@@%639$1@@@%727%639$1@@%649$0@@@|@|@@%332%209%337%200%337%178%431%726%649$0@@%726%639$1@@$2@@@%726%639$1@@%726%649$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%649$0@@%633$1@@@%727%633$1@@%649$0@@@|@|@@%332%209%337%200%337%178%431%726%649$0@@%726%633$1@@$2@@@%726%633$1@@%726%649$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%649$0@@%647$1@@@%727%647$1@@%649$0@@@|@|@@%332%209%337%200%337%178%431%726%649$0@@%726%647$1@@$2@@@%726%647$1@@%726%649$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%435%727%643$0@@%645$1@@@%727%645$1@@%643$0@@@|@|@@%332%209%338%201%338%179%431%726%643$0@@%726%645$1@@$2@@@%726%645$1@@%726%643$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%435%727%643$0@@%651$1@@@%727%651$1@@%643$0@@@|@|@@%332%209%338%201%338%179%431%726%643$0@@%726%651$1@@$2@@@%726%651$1@@%726%643$0@@$2@@@|@|@|@@@%402%402%337%200%338%179%435%727%643$0@@%639$1@@@%727%639$1@@%643$0@@@|@|@@%332%209%337%200%338%179%431%726%643$0@@%726%639$1@@$2@@@%726%639$1@@%726%643$0@@$2@@@|@|@|@@@%402%402%337%200%338%179%435%727%643$0@@%633$1@@@%727%633$1@@%643$0@@@|@|@@%332%209%337%200%338%179%431%726%643$0@@%726%633$1@@$2@@@%726%633$1@@%726%643$0@@$2@@@|@|@|@@@%402%402%337%200%338%179%435%727%643$0@@%647$1@@@%727%647$1@@%643$0@@@|@|@@%332%209%337%200%338%179%431%726%643$0@@%726%647$1@@$2@@@%726%647$1@@%726%643$0@@$2@@@|@|@|@@@%402%402%337%200%338%179%435%727%643$0@@%649$1@@@%727%649$1@@%643$0@@@|@|@@%332%209%337%200%338%179%431%726%643$0@@%726%649$1@@$2@@@%726%649$1@@%726%643$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%435%727%641$0@@%645$1@@@%727%645$1@@%641$0@@@|@|@@%332%209%338%201%338%179%431%726%641$0@@%726%645$1@@$2@@@%726%645$1@@%726%641$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%435%727%641$0@@%651$1@@@%727%651$1@@%641$0@@@|@|@@%332%209%338%201%338%179%431%726%641$0@@%726%651$1@@$2@@@%726%651$1@@%726%641$0@@$2@@@|@|@|@@@%402%402%337%200%338%179%435%727%641$0@@%639$1@@@%727%639$1@@%641$0@@@|@|@@%332%209%337%200%338%179%431%726%641$0@@%726%639$1@@$2@@@%726%639$1@@%726%641$0@@$2@@@|@|@|@@@%402%402%337%200%338%179%435%727%641$0@@%633$1@@@%727%633$1@@%641$0@@@|@|@@%332%209%337%200%338%179%431%726%641$0@@%726%633$1@@$2@@@%726%633$1@@%726%641$0@@$2@@@|@|@|@@@%402%402%337%200%338%179%435%727%641$0@@%647$1@@@%727%647$1@@%641$0@@@|@|@@%332%209%337%200%338%179%431%726%641$0@@%726%647$1@@$2@@@%726%647$1@@%726%641$0@@$2@@@|@|@|@@@%402%402%337%200%338%179%435%727%641$0@@%649$1@@@%727%649$1@@%641$0@@@|@|@@%332%209%337%200%338%179%431%726%641$0@@%726%649$1@@$2@@@%726%649$1@@%726%641$0@@$2@@@|@|@|@@@%402%402%338%201%338%179%435%727%641$0@@%643$1@@@%727%643$1@@%641$0@@@|@|@@%332%209%338%201%338%179%431%726%641$0@@%726%643$1@@$2@@@%726%643$1@@%726%641$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%635$0@@%645$1@@@%727%645$1@@%635$0@@@|@|@@%332%209%338%201%337%178%431%726%635$0@@%726%645$1@@$2@@@%726%645$1@@%726%635$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%635$0@@%651$1@@@%727%651$1@@%635$0@@@|@|@@%332%209%338%201%337%178%431%726%635$0@@%726%651$1@@$2@@@%726%651$1@@%726%635$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%635$0@@%639$1@@@%727%639$1@@%635$0@@@|@|@@%332%209%337%200%337%178%431%726%635$0@@%726%639$1@@$2@@@%726%639$1@@%726%635$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%635$0@@%633$1@@@%727%633$1@@%635$0@@@|@|@@%332%209%337%200%337%178%431%726%635$0@@%726%633$1@@$2@@@%726%633$1@@%726%635$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%635$0@@%647$1@@@%727%647$1@@%635$0@@@|@|@@%332%209%337%200%337%178%431%726%635$0@@%726%647$1@@$2@@@%726%647$1@@%726%635$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%635$0@@%649$1@@@%727%649$1@@%635$0@@@|@|@@%332%209%337%200%337%178%431%726%635$0@@%726%649$1@@$2@@@%726%649$1@@%726%635$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%635$0@@%643$1@@@%727%643$1@@%635$0@@@|@|@@%332%209%338%201%337%178%431%726%635$0@@%726%643$1@@$2@@@%726%643$1@@%726%635$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%635$0@@%641$1@@@%727%641$1@@%635$0@@@|@|@@%332%209%338%201%337%178%431%726%635$0@@%726%641$1@@$2@@@%726%641$1@@%726%635$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%637$0@@%645$1@@@%727%645$1@@%637$0@@@|@|@@%332%209%338%201%337%178%431%726%637$0@@%726%645$1@@$2@@@%726%645$1@@%726%637$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%637$0@@%651$1@@@%727%651$1@@%637$0@@@|@|@@%332%209%338%201%337%178%431%726%637$0@@%726%651$1@@$2@@@%726%651$1@@%726%637$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%637$0@@%639$1@@@%727%639$1@@%637$0@@@|@|@@%332%209%337%200%337%178%431%726%637$0@@%726%639$1@@$2@@@%726%639$1@@%726%637$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%637$0@@%633$1@@@%727%633$1@@%637$0@@@|@|@@%332%209%337%200%337%178%431%726%637$0@@%726%633$1@@$2@@@%726%633$1@@%726%637$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%637$0@@%647$1@@@%727%647$1@@%637$0@@@|@|@@%332%209%337%200%337%178%431%726%637$0@@%726%647$1@@$2@@@%726%647$1@@%726%637$0@@$2@@@|@|@|@@@%402%402%337%200%337%178%435%727%637$0@@%649$1@@@%727%649$1@@%637$0@@@|@|@@%332%209%337%200%337%178%431%726%637$0@@%726%649$1@@$2@@@%726%649$1@@%726%637$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%637$0@@%643$1@@@%727%643$1@@%637$0@@@|@|@@%332%209%338%201%337%178%431%726%637$0@@%726%643$1@@$2@@@%726%643$1@@%726%637$0@@$2@@@|@|@|@@@%402%402%338%201%337%178%435%727%637$0@@%641$1@@@%727%641$1@@%637$0@@@|@|@@%332%209%338%201%337%178%431%726%637$0@@%726%641$1@@$2@@@%726%641$1@@%726%637$0@@$2@@@|@|@|@@@%402%337%200%337%178%435%727%637$0@@%635$1@@@%727%635$1@@%637$0@@@|@|@@%332%209%337%200%337%178%431%726%637$0@@%726%635$1@@$2@@@%726%635$1@@%726%637$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_component_equality x = x
    val op elf64_section_header_table_entry_component_equality =
    DT(((("elf_section_header_table",195),
        [("bool",[25,26,51,56,63,181]),
         ("elf_section_header_table",[163,164,165,178]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%327%129%327%133%408%415$1@$0@@%402%411%644$1@@%644$0@@@%402%411%650$1@@%650$0@@@%402%410%638$1@@%638$0@@@%402%410%632$1@@%632$0@@@%402%410%646$1@@%646$0@@@%402%410%648$1@@%648$0@@@%402%411%642$1@@%642$0@@@%402%411%640$1@@%640$0@@@%402%410%634$1@@%634$0@@@%410%636$1@@%636$0@@@@@@@@@@@@|@|@"])
  fun op elf64_section_header_table_entry_updates_eq_literal x = x
    val op elf64_section_header_table_entry_updates_eq_literal =
    DT(((("elf_section_header_table",196),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_section_header_table",[163,164,165,189])]),["DISK_THM"]),
       [read"%327%125%321%117%321%113%320%106%320%100%320%94%320%88%321%85%321%81%320%74%320%72%415%645%510$9@@%651%510$8@@%639%509$7@@%633%509$6@@%647%509$5@@%649%509$4@@%643%510$3@@%641%510$2@@%635%509$1@@%637%509$0@@$10@@@@@@@@@@@%645%510$9@@%651%510$8@@%639%509$7@@%633%509$6@@%647%509$5@@%649%509$4@@%643%510$3@@%641%510$2@@%635%509$1@@%637%509$0@@%471@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_literal_nchotomy x = x
    val op elf64_section_header_table_entry_literal_nchotomy =
    DT(((("elf_section_header_table",197),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_section_header_table",[163,164,165,189]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%327%125%450%117%450%113%449%106%449%100%449%94%449%88%450%85%450%81%449%74%449%72%415$10@%645%510$9@@%651%510$8@@%639%509$7@@%633%509$6@@%647%509$5@@%649%509$4@@%643%510$3@@%641%510$2@@%635%509$1@@%637%509$0@@%471@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf64_section_header_table_entry x = x
    val op FORALL_elf64_section_header_table_entry =
    DT(((("elf_section_header_table",198),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_section_header_table",[163,164,165,189]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%346%17%408%327%125$1$0@|@@%321%117%321%113%320%106%320%100%320%94%320%88%321%85%321%81%320%74%320%72$10%645%510$9@@%651%510$8@@%639%509$7@@%633%509$6@@%647%509$5@@%649%509$4@@%643%510$3@@%641%510$2@@%635%509$1@@%637%509$0@@%471@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf64_section_header_table_entry x = x
    val op EXISTS_elf64_section_header_table_entry =
    DT(((("elf_section_header_table",199),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_section_header_table",[163,164,165,189]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%346%17%408%454%125$1$0@|@@%450%117%450%113%449%106%449%100%449%94%449%88%450%85%450%81%449%74%449%72$10%645%510$9@@%651%510$8@@%639%509$7@@%633%509$6@@%647%509$5@@%649%509$4@@%643%510$3@@%641%510$2@@%635%509$1@@%637%509$0@@%471@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op elf64_section_header_table_entry_literal_11 x = x
    val op elf64_section_header_table_entry_literal_11 =
    DT(((("elf_section_header_table",200),
        [("combin",[12]),
         ("elf_section_header_table",[190,195])]),["DISK_THM"]),
       [read"%321%118%321%114%320%108%320%102%320%96%320%90%321%86%321%82%320%76%320%80%321%119%321%115%320%110%320%104%320%98%320%92%321%87%321%83%320%78%320%84%408%415%645%510$19@@%651%510$18@@%639%509$17@@%633%509$16@@%647%509$15@@%649%509$14@@%643%510$13@@%641%510$12@@%635%509$11@@%637%509$10@@%471@@@@@@@@@@@%645%510$9@@%651%510$8@@%639%509$7@@%633%509$6@@%647%509$5@@%649%509$4@@%643%510$3@@%641%510$2@@%635%509$1@@%637%509$0@@%471@@@@@@@@@@@@%402%411$19@$9@@%402%411$18@$8@@%402%410$17@$7@@%402%410$16@$6@@%402%410$15@$5@@%402%410$14@$4@@%402%411$13@$3@@%402%411$12@$2@@%402%410$11@$1@@%410$10@$0@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf64_section_header_table_entry x = x
    val op datatype_elf64_section_header_table_entry =
    DT(((("elf_section_header_table",201),
        [("bool",[25,171])]),["DISK_THM"]),
       [read"%494%232%160@%167@%170@%164@%161@%168@%169@%166@%165@%162@%163@@"])
  fun op elf64_section_header_table_entry_11 x = x
    val op elf64_section_header_table_entry_11 =
    DT(((("elf_section_header_table",202),
        [("bool",[26,51,56,63,181]),
         ("elf_section_header_table",[163,164,165]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%321%25%321%31%320%33%320%37%320%41%320%45%321%49%321%51%320%53%320%57%321%26%321%32%320%35%320%39%320%43%320%47%321%50%321%52%320%55%320%59%408%415%776$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%402%411$19@$9@@%402%411$18@$8@@%402%410$17@$7@@%402%410$16@$6@@%402%410$15@$5@@%402%410$14@$4@@%402%411$13@$3@@%402%411$12@$2@@%402%410$11@$1@@%410$10@$0@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_case_cong x = x
    val op elf64_section_header_table_entry_case_cong =
    DT(((("elf_section_header_table",203),
        [("bool",[26,181]),
         ("elf_section_header_table",[163,164,165,166])]),["DISK_THM"]),
       [read"%327%7%327%11%340%181%448%402%415$2@$1@@%321%25%321%31%320%33%320%37%320%41%320%45%321%49%321%51%320%53%320%57%448%415$11@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%405$10$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%185$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@|@|@@@%405%631$2@$0@@%631$1@%185@@@|@|@|@"])
  fun op elf64_section_header_table_entry_nchotomy x = x
    val op elf64_section_header_table_entry_nchotomy =
    DT(((("elf_section_header_table",204),
        [("bool",[26,181]),
         ("elf_section_header_table",[163,164,165])]),["DISK_THM"]),
       [read"%327%139%450%73%450%75%449%80%449%84%449%88%449%94%450%101%450%107%449%112%449%116%415$10@%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_Axiom x = x
    val op elf64_section_header_table_entry_Axiom =
    DT(((("elf_section_header_table",205),
        [("bool",[26,181]),("elf_section_header_table",[163,164,165]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%340%181%461%199%321%25%321%31%320%33%320%37%320%41%320%45%321%49%321%51%320%53%320%57%405$10%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_induction x = x
    val op elf64_section_header_table_entry_induction =
    DT(((("elf_section_header_table",206),
        [("bool",[26]),
         ("elf_section_header_table",[163,164,165])]),["DISK_THM"]),
       [read"%346%17%448%321%73%321%75%320%80%320%84%320%88%320%94%321%101%321%107%320%112%320%116$10%776$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@@%327%125$1$0@|@@|@"])
  fun op read_elf32_section_header_table'_ind x = x
    val op read_elf32_section_header_table'_ind =
    DT(((("elf_section_header_table",217),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%347%18%448%328%171%319%66%448%319%67%448%842%442%705$1@@%403@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%328%280%319%282$2$1@$0@|@|@@|@",
        read"%328%171%319%66%319%67%448%842%442%705$1@@%403@@@%21%391$2@$0@@%391$2@$1@@@|@|@|@",
        read"%566%21@"])
  fun op read_elf32_section_header_table'_def x = x
    val op read_elf32_section_header_table'_def =
    DT(((("elf_section_header_table",218),
        [("bool",[15,58,129]),("combin",[19]),
         ("elf_section_header_table",[215,216]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%328%171%319%66%416%752$1@$0@@%480%442%705$0@@%403@@%780%529@@%680%754$1@$0@@%561%176%67%665%752$3@$0@@%272%780%484$2@$0@@|@||@@@@|@|@",
        read"%328%171%319%66%319%67%448%842%442%705$1@@%403@@@%21%391$2@$0@@%391$2@$1@@@|@|@|@",
        read"%566%21@"])
  fun op read_elf64_section_header_table'_ind x = x
    val op read_elf64_section_header_table'_ind =
    DT(((("elf_section_header_table",221),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%347%18%448%328%171%319%66%448%319%67%448%842%442%705$1@@%403@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%328%280%319%282$2$1@$0@|@|@@|@",
        read"%328%171%319%66%319%67%448%842%442%705$1@@%403@@@%21%391$2@$0@@%391$2@$1@@@|@|@|@",
        read"%566%21@"])
  fun op read_elf64_section_header_table'_def x = x
    val op read_elf64_section_header_table'_def =
    DT(((("elf_section_header_table",222),
        [("bool",[15,58,129]),("combin",[19]),
         ("elf_section_header_table",[219,220]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%328%171%319%66%417%764$1@$0@@%481%442%705$0@@%403@@%781%530@@%681%766$1@$0@@%562%177%67%667%764$3@$0@@%273%781%485$2@$0@@|@||@@@@|@|@",
        read"%328%171%319%66%319%67%448%842%442%705$1@@%403@@@%21%391$2@$0@@%391$2@$1@@@|@|@|@",
        read"%566%21@"])
  fun op get_elf32_section_to_segment_mapping_ind x = x
    val op get_elf32_section_to_segment_mapping_ind =
    DT(((("elf_section_header_table",235),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%335%12%448%318%214%353%244%323%227%333%217%360%269%448%402%324%304%353%316%355%223%448%402%440$6@%484$2@$1@@@%402%842%700$2@$5@@@%402%842%842$4$7@$2@$5@@@@%442$0@%839%609$2@@@@@@@$8$7@$1@$5@$4@$3@@|@|@|@@%402%324%304%353%316%448%402%440$5@%484$1@$0@@@%402%842%700$1@$4@@@%842$3$6@$1@$4@@@@@$7$6@$0@$4@$3@$2@@|@|@@%324%304%353%316%448%402%440$5@%484$1@$0@@@%700$1@$4@@@$7$6@$0@$4@$3@$2@@|@|@@@@$5$4@$3@$2@$1@$0@@|@|@|@|@|@@%318%279%353%283%323%287%333%289%360%295$5$4@$3@$2@$1@$0@|@|@|@|@|@@|@",
        read"%360%269%318%214%333%217%323%227%353%244%324%304%353%316%355%223%448%402%440$3@%484$2@$1@@@%402%842%700$2@$4@@@%402%842%842$5$6@$2@$4@@@@%442$0@%839%609$2@@@@@@@%19%363$6@%397$1@%386$4@%392$5@$7@@@@@%363$6@%397$3@%386$4@%392$5@$7@@@@@@|@|@|@|@|@|@|@|@",
        read"%360%269%318%214%333%217%323%227%353%244%324%304%353%316%448%402%440$2@%484$1@$0@@@%402%842%700$1@$3@@@%842$4$5@$1@$3@@@@@%19%363$5@%397$0@%386$3@%392$4@$6@@@@@%363$5@%397$2@%386$3@%392$4@$6@@@@@@|@|@|@|@|@|@|@",
        read"%360%269%333%217%318%214%323%227%353%244%324%304%353%316%448%402%440$2@%484$1@$0@@@%700$1@$3@@@%19%363$4@%397$0@%386$3@%392$5@$6@@@@@%363$4@%397$2@%386$3@%392$5@$6@@@@@@|@|@|@|@|@|@|@",
        read"%564%19@"])
  fun op get_elf32_section_to_segment_mapping_def x = x
    val op get_elf32_section_to_segment_mapping_def =
    DT(((("elf_section_header_table",236),
        [("bool",[15,58,123,129]),("combin",[19]),
         ("elf_section_header_table",[233,234]),("list",[11]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%360%269%353%244%323%227%333%217%318%214%418%689$0@$3@$2@$1@$4@@%709$3@%782%532@@%304%316%482%700$1@$4@@%689$2@$0@$4@$3@$6@@%482%842$3$2@$1@$4@@@%689$2@$0@$4@$3@$6@@%521%223%664%693$0@$7@@%270%669%689$4@$2@$6@$5@$8@@%277%782%487$1@$0@@|@|@|@%839%609$1@@@@@||@@|@|@|@|@|@",
        read"%360%269%318%214%333%217%323%227%353%244%324%304%353%316%355%223%448%402%440$3@%484$2@$1@@@%402%842%700$2@$4@@@%402%842%842$5$6@$2@$4@@@@%442$0@%839%609$2@@@@@@@%19%363$6@%397$1@%386$4@%392$5@$7@@@@@%363$6@%397$3@%386$4@%392$5@$7@@@@@@|@|@|@|@|@|@|@|@",
        read"%360%269%318%214%333%217%323%227%353%244%324%304%353%316%448%402%440$2@%484$1@$0@@@%402%842%700$1@$3@@@%842$4$5@$1@$3@@@@@%19%363$5@%397$0@%386$3@%392$4@$6@@@@@%363$5@%397$2@%386$3@%392$4@$6@@@@@@|@|@|@|@|@|@|@",
        read"%360%269%333%217%318%214%323%227%353%244%324%304%353%316%448%402%440$2@%484$1@$0@@@%700$1@$3@@@%19%363$4@%397$0@%386$3@%392$5@$6@@@@@%363$4@%397$2@%386$3@%392$5@$6@@@@@@|@|@|@|@|@|@|@",
        read"%564%19@"])
  fun op get_elf64_section_to_segment_mapping_ind x = x
    val op get_elf64_section_to_segment_mapping_ind =
    DT(((("elf_section_header_table",239),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%336%13%448%318%214%354%245%326%228%334%218%360%269%448%402%327%305%354%317%355%223%448%402%441$6@%485$2@$1@@@%402%842%842$4$7@$2@$5@@@@%402%842%702$2@$5@@@%442$0@%839%644$2@@@@@@@$8$7@$1@$5@$4@$3@@|@|@|@@%402%327%305%354%317%448%402%441$5@%485$1@$0@@@%842$3$6@$1@$4@@@@$7$6@$0@$4@$3@$2@@|@|@@%327%305%354%317%448%402%441$5@%485$1@$0@@@%402%842%842$3$6@$1@$4@@@@%702$1@$4@@@@$7$6@$0@$4@$3@$2@@|@|@@@@$5$4@$3@$2@$1@$0@@|@|@|@|@|@@%318%279%354%284%326%288%334%290%360%295$5$4@$3@$2@$1@$0@|@|@|@|@|@@|@",
        read"%360%269%326%228%318%214%334%218%354%245%327%305%354%317%355%223%448%402%441$3@%485$2@$1@@@%402%842%842$4$5@$2@$6@@@@%402%842%702$2@$6@@@%442$0@%839%644$2@@@@@@@%20%364$5@%399$1@%389$6@%393$4@$7@@@@@%364$5@%399$3@%389$6@%393$4@$7@@@@@@|@|@|@|@|@|@|@|@",
        read"%360%269%326%228%318%214%334%218%354%245%327%305%354%317%448%402%441$2@%485$1@$0@@@%842$3$4@$1@$5@@@@%20%364$4@%399$0@%389$5@%393$3@$6@@@@@%364$4@%399$2@%389$5@%393$3@$6@@@@@@|@|@|@|@|@|@|@",
        read"%360%269%326%228%318%214%334%218%354%245%327%305%354%317%448%402%441$2@%485$1@$0@@@%402%842%842$3$4@$1@$5@@@@%702$1@$5@@@@%20%364$4@%399$0@%389$5@%393$3@$6@@@@@%364$4@%399$2@%389$5@%393$3@$6@@@@@@|@|@|@|@|@|@|@",
        read"%565%20@"])
  fun op get_elf64_section_to_segment_mapping_def x = x
    val op get_elf64_section_to_segment_mapping_def =
    DT(((("elf_section_header_table",240),
        [("bool",[15,58,123,129]),("combin",[19]),
         ("elf_section_header_table",[237,238]),("list",[11]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%360%269%354%245%326%228%334%218%318%214%418%691$0@$3@$2@$1@$4@@%712$3@%782%532@@%305%317%482%842$3$2@$1@$4@@@%691$2@$0@$4@$3@$6@@%482%702$1@$4@@%691$2@$0@$4@$3@$6@@%521%223%664%693$0@$7@@%270%669%691$4@$2@$6@$5@$8@@%277%782%487$1@$0@@|@|@|@%839%644$1@@@@@||@@|@|@|@|@|@",
        read"%360%269%326%228%318%214%334%218%354%245%327%305%354%317%355%223%448%402%441$3@%485$2@$1@@@%402%842%842$4$5@$2@$6@@@@%402%842%702$2@$6@@@%442$0@%839%644$2@@@@@@@%20%364$5@%399$1@%389$6@%393$4@$7@@@@@%364$5@%399$3@%389$6@%393$4@$7@@@@@@|@|@|@|@|@|@|@|@",
        read"%360%269%326%228%318%214%334%218%354%245%327%305%354%317%448%402%441$2@%485$1@$0@@@%842$3$4@$1@$5@@@@%20%364$4@%399$0@%389$5@%393$3@$6@@@@@%364$4@%399$2@%389$5@%393$3@$6@@@@@@|@|@|@|@|@|@|@",
        read"%360%269%326%228%318%214%334%218%354%245%327%305%354%317%448%402%441$2@%485$1@$0@@@%402%842%842$3$4@$1@$5@@@@%702$1@$5@@@@%20%364$4@%399$0@%389$5@%393$3@$6@@@@@%364$4@%399$2@%389$5@%393$3@$6@@@@@@|@|@|@|@|@|@|@",
        read"%565%20@"])
  end
  val _ = DB.bindl "elf_section_header_table"
  [("shn_loreserve_def",shn_loreserve_def,DB.Def),
   ("shn_loproc_def",shn_loproc_def,DB.Def),
   ("shn_hiproc_def",shn_hiproc_def,DB.Def),
   ("shn_loos_def",shn_loos_def,DB.Def),
   ("shn_hios_def",shn_hios_def,DB.Def),
   ("shn_abs_def",shn_abs_def,DB.Def),
   ("shn_common_def",shn_common_def,DB.Def),
   ("shn_hireserve_def",shn_hireserve_def,DB.Def),
   ("sht_null_def",sht_null_def,DB.Def),
   ("sht_progbits_def",sht_progbits_def,DB.Def),
   ("sht_symtab_def",sht_symtab_def,DB.Def),
   ("sht_dynsym_def",sht_dynsym_def,DB.Def),
   ("sht_strtab_def",sht_strtab_def,DB.Def),
   ("sht_rela_def",sht_rela_def,DB.Def),
   ("sht_hash_def",sht_hash_def,DB.Def),
   ("sht_dynamic_def",sht_dynamic_def,DB.Def),
   ("sht_note_def",sht_note_def,DB.Def),
   ("sht_nobits_def",sht_nobits_def,DB.Def),
   ("sht_rel_def",sht_rel_def,DB.Def),
   ("sht_shlib_def",sht_shlib_def,DB.Def),
   ("sht_init_array_def",sht_init_array_def,DB.Def),
   ("sht_fini_array_def",sht_fini_array_def,DB.Def),
   ("sht_preinit_array_def",sht_preinit_array_def,DB.Def),
   ("sht_group_def",sht_group_def,DB.Def),
   ("sht_symtab_shndx_def",sht_symtab_shndx_def,DB.Def),
   ("sht_loos_def",sht_loos_def,DB.Def),
   ("sht_hios_def",sht_hios_def,DB.Def),
   ("sht_loproc_def",sht_loproc_def,DB.Def),
   ("sht_hiproc_def",sht_hiproc_def,DB.Def),
   ("sht_louser_def",sht_louser_def,DB.Def),
   ("sht_hiuser_def",sht_hiuser_def,DB.Def),
   ("shf_write_def",shf_write_def,DB.Def),
   ("shf_alloc_def",shf_alloc_def,DB.Def),
   ("shf_execinstr_def",shf_execinstr_def,DB.Def),
   ("shf_merge_def",shf_merge_def,DB.Def),
   ("shf_strings_def",shf_strings_def,DB.Def),
   ("shf_info_link_def",shf_info_link_def,DB.Def),
   ("shf_link_order_def",shf_link_order_def,DB.Def),
   ("shf_os_nonconforming_def",shf_os_nonconforming_def,DB.Def),
   ("shf_group_def",shf_group_def,DB.Def),
   ("shf_tls_def",shf_tls_def,DB.Def),
   ("shf_compressed_def",shf_compressed_def,DB.Def),
   ("shf_mask_os_def",shf_mask_os_def,DB.Def),
   ("shf_mask_proc_def",shf_mask_proc_def,DB.Def),
   ("elf32_compression_header_TY_DEF",
    elf32_compression_header_TY_DEF,
    DB.Def),
   ("elf32_compression_header_case_def",
    elf32_compression_header_case_def,
    DB.Def),
   ("elf32_compression_header_size_def",
    elf32_compression_header_size_def,
    DB.Def),
   ("elf32_compression_header_elf32_chdr_type",
    elf32_compression_header_elf32_chdr_type,
    DB.Def),
   ("elf32_compression_header_elf32_chdr_size",
    elf32_compression_header_elf32_chdr_size,
    DB.Def),
   ("elf32_compression_header_elf32_chdr_addralign",
    elf32_compression_header_elf32_chdr_addralign,
    DB.Def),
   ("elf32_compression_header_elf32_chdr_type_fupd",
    elf32_compression_header_elf32_chdr_type_fupd,
    DB.Def),
   ("elf32_compression_header_elf32_chdr_size_fupd",
    elf32_compression_header_elf32_chdr_size_fupd,
    DB.Def),
   ("elf32_compression_header_elf32_chdr_addralign_fupd",
    elf32_compression_header_elf32_chdr_addralign_fupd,
    DB.Def),
   ("elf64_compression_header_TY_DEF",
    elf64_compression_header_TY_DEF,
    DB.Def),
   ("elf64_compression_header_case_def",
    elf64_compression_header_case_def,
    DB.Def),
   ("elf64_compression_header_size_def",
    elf64_compression_header_size_def,
    DB.Def),
   ("elf64_compression_header_elf64_chdr_type",
    elf64_compression_header_elf64_chdr_type,
    DB.Def),
   ("elf64_compression_header_elf64_chdr_reserved",
    elf64_compression_header_elf64_chdr_reserved,
    DB.Def),
   ("elf64_compression_header_elf64_chdr_size",
    elf64_compression_header_elf64_chdr_size,
    DB.Def),
   ("elf64_compression_header_elf64_chdr_addralign",
    elf64_compression_header_elf64_chdr_addralign,
    DB.Def),
   ("elf64_compression_header_elf64_chdr_type_fupd",
    elf64_compression_header_elf64_chdr_type_fupd,
    DB.Def),
   ("elf64_compression_header_elf64_chdr_reserved_fupd",
    elf64_compression_header_elf64_chdr_reserved_fupd,
    DB.Def),
   ("elf64_compression_header_elf64_chdr_size_fupd",
    elf64_compression_header_elf64_chdr_size_fupd,
    DB.Def),
   ("elf64_compression_header_elf64_chdr_addralign_fupd",
    elf64_compression_header_elf64_chdr_addralign_fupd,
    DB.Def), ("elfcompress_zlib_def",elfcompress_zlib_def,DB.Def),
   ("elfcompress_loos_def",elfcompress_loos_def,DB.Def),
   ("elfcompress_hios_def",elfcompress_hios_def,DB.Def),
   ("elfcompress_loproc_def",elfcompress_loproc_def,DB.Def),
   ("elfcompress_hiproc_def",elfcompress_hiproc_def,DB.Def),
   ("read_elf32_compression_header_def",
    read_elf32_compression_header_def,
    DB.Def),
   ("read_elf64_compression_header_def",
    read_elf64_compression_header_def,
    DB.Def),
   ("elf32_section_header_table_entry_TY_DEF",
    elf32_section_header_table_entry_TY_DEF,
    DB.Def),
   ("elf32_section_header_table_entry_case_def",
    elf32_section_header_table_entry_case_def,
    DB.Def),
   ("elf32_section_header_table_entry_size_def",
    elf32_section_header_table_entry_size_def,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_name",
    elf32_section_header_table_entry_elf32_sh_name,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_type",
    elf32_section_header_table_entry_elf32_sh_type,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_flags",
    elf32_section_header_table_entry_elf32_sh_flags,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_addr",
    elf32_section_header_table_entry_elf32_sh_addr,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_offset",
    elf32_section_header_table_entry_elf32_sh_offset,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_size",
    elf32_section_header_table_entry_elf32_sh_size,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_link",
    elf32_section_header_table_entry_elf32_sh_link,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_info",
    elf32_section_header_table_entry_elf32_sh_info,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_addralign",
    elf32_section_header_table_entry_elf32_sh_addralign,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_entsize",
    elf32_section_header_table_entry_elf32_sh_entsize,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_name_fupd",
    elf32_section_header_table_entry_elf32_sh_name_fupd,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_type_fupd",
    elf32_section_header_table_entry_elf32_sh_type_fupd,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_flags_fupd",
    elf32_section_header_table_entry_elf32_sh_flags_fupd,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_addr_fupd",
    elf32_section_header_table_entry_elf32_sh_addr_fupd,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_offset_fupd",
    elf32_section_header_table_entry_elf32_sh_offset_fupd,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_size_fupd",
    elf32_section_header_table_entry_elf32_sh_size_fupd,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_link_fupd",
    elf32_section_header_table_entry_elf32_sh_link_fupd,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_info_fupd",
    elf32_section_header_table_entry_elf32_sh_info_fupd,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_addralign_fupd",
    elf32_section_header_table_entry_elf32_sh_addralign_fupd,
    DB.Def),
   ("elf32_section_header_table_entry_elf32_sh_entsize_fupd",
    elf32_section_header_table_entry_elf32_sh_entsize_fupd,
    DB.Def),
   ("compare_elf32_section_header_table_entry_def",
    compare_elf32_section_header_table_entry_def,
    DB.Def),
   ("instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict_def",
    instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict_def,
    DB.Def),
   ("elf64_section_header_table_entry_TY_DEF",
    elf64_section_header_table_entry_TY_DEF,
    DB.Def),
   ("elf64_section_header_table_entry_case_def",
    elf64_section_header_table_entry_case_def,
    DB.Def),
   ("elf64_section_header_table_entry_size_def",
    elf64_section_header_table_entry_size_def,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_name",
    elf64_section_header_table_entry_elf64_sh_name,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_type",
    elf64_section_header_table_entry_elf64_sh_type,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_flags",
    elf64_section_header_table_entry_elf64_sh_flags,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_addr",
    elf64_section_header_table_entry_elf64_sh_addr,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_offset",
    elf64_section_header_table_entry_elf64_sh_offset,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_size",
    elf64_section_header_table_entry_elf64_sh_size,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_link",
    elf64_section_header_table_entry_elf64_sh_link,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_info",
    elf64_section_header_table_entry_elf64_sh_info,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_addralign",
    elf64_section_header_table_entry_elf64_sh_addralign,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_entsize",
    elf64_section_header_table_entry_elf64_sh_entsize,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_name_fupd",
    elf64_section_header_table_entry_elf64_sh_name_fupd,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_type_fupd",
    elf64_section_header_table_entry_elf64_sh_type_fupd,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_flags_fupd",
    elf64_section_header_table_entry_elf64_sh_flags_fupd,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_addr_fupd",
    elf64_section_header_table_entry_elf64_sh_addr_fupd,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_offset_fupd",
    elf64_section_header_table_entry_elf64_sh_offset_fupd,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_size_fupd",
    elf64_section_header_table_entry_elf64_sh_size_fupd,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_link_fupd",
    elf64_section_header_table_entry_elf64_sh_link_fupd,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_info_fupd",
    elf64_section_header_table_entry_elf64_sh_info_fupd,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_addralign_fupd",
    elf64_section_header_table_entry_elf64_sh_addralign_fupd,
    DB.Def),
   ("elf64_section_header_table_entry_elf64_sh_entsize_fupd",
    elf64_section_header_table_entry_elf64_sh_entsize_fupd,
    DB.Def),
   ("compare_elf64_section_header_table_entry_def",
    compare_elf64_section_header_table_entry_def,
    DB.Def),
   ("instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict_def",
    instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict_def,
    DB.Def),
   ("bytes_of_elf32_section_header_table_entry_def",
    bytes_of_elf32_section_header_table_entry_def,
    DB.Def),
   ("read_elf32_section_header_table_entry_def",
    read_elf32_section_header_table_entry_def,
    DB.Def),
   ("bytes_of_elf64_section_header_table_entry_def",
    bytes_of_elf64_section_header_table_entry_def,
    DB.Def),
   ("read_elf64_section_header_table_entry_def",
    read_elf64_section_header_table_entry_def,
    DB.Def),
   ("bytes_of_elf32_section_header_table_def",
    bytes_of_elf32_section_header_table_def,
    DB.Def),
   ("bytes_of_elf64_section_header_table_def",
    bytes_of_elf64_section_header_table_def,
    DB.Def),
   ("read_elf32_section_header_table'_tupled_primitive_def",
    read_elf32_section_header_table'_tupled_primitive_def,
    DB.Def),
   ("read_elf32_section_header_table'_curried_def",
    read_elf32_section_header_table'_curried_def,
    DB.Def),
   ("read_elf64_section_header_table'_tupled_primitive_def",
    read_elf64_section_header_table'_tupled_primitive_def,
    DB.Def),
   ("read_elf64_section_header_table'_curried_def",
    read_elf64_section_header_table'_curried_def,
    DB.Def),
   ("read_elf32_section_header_table_def",
    read_elf32_section_header_table_def,
    DB.Def),
   ("read_elf64_section_header_table_def",
    read_elf64_section_header_table_def,
    DB.Def), ("elf32_size_correct_def",elf32_size_correct_def,DB.Def),
   ("elf64_size_correct_def",elf64_size_correct_def,DB.Def),
   ("is_elf32_addr_addralign_correct_def",
    is_elf32_addr_addralign_correct_def,
    DB.Def),
   ("is_elf64_addr_addralign_correct_def",
    is_elf64_addr_addralign_correct_def,
    DB.Def),
   ("is_valid_elf32_section_header_table_def",
    is_valid_elf32_section_header_table_def,
    DB.Def),
   ("is_valid_elf64_section_header_table_def",
    is_valid_elf64_section_header_table_def,
    DB.Def),
   ("is_elf32_tbss_special_def",is_elf32_tbss_special_def,DB.Def),
   ("is_elf64_tbss_special_def",is_elf64_tbss_special_def,DB.Def),
   ("get_elf32_section_to_segment_mapping_tupled_primitive_def",
    get_elf32_section_to_segment_mapping_tupled_primitive_def,
    DB.Def),
   ("get_elf32_section_to_segment_mapping_curried_def",
    get_elf32_section_to_segment_mapping_curried_def,
    DB.Def),
   ("get_elf64_section_to_segment_mapping_tupled_primitive_def",
    get_elf64_section_to_segment_mapping_tupled_primitive_def,
    DB.Def),
   ("get_elf64_section_to_segment_mapping_curried_def",
    get_elf64_section_to_segment_mapping_curried_def,
    DB.Def), ("grp_comdat_def",grp_comdat_def,DB.Def),
   ("grp_maskos_def",grp_maskos_def,DB.Def),
   ("grp_maskproc_def",grp_maskproc_def,DB.Def),
   ("obtain_elf32_section_group_indices_def",
    obtain_elf32_section_group_indices_def,
    DB.Def),
   ("obtain_elf64_section_group_indices_def",
    obtain_elf64_section_group_indices_def,
    DB.Def),
   ("obtain_elf32_tls_template_def",obtain_elf32_tls_template_def,DB.Def),
   ("obtain_elf64_tls_template_def",obtain_elf64_tls_template_def,DB.Def),
   ("obtain_elf32_hash_table_def",obtain_elf32_hash_table_def,DB.Def),
   ("obtain_elf64_hash_table_def",obtain_elf64_hash_table_def,DB.Def),
   ("elf_special_sections_def",elf_special_sections_def,DB.Def),
   ("elf32_compression_header_accessors",
    elf32_compression_header_accessors,
    DB.Thm),
   ("elf32_compression_header_fn_updates",
    elf32_compression_header_fn_updates,
    DB.Thm),
   ("elf32_compression_header_accfupds",
    elf32_compression_header_accfupds,
    DB.Thm),
   ("elf32_compression_header_fupdfupds",
    elf32_compression_header_fupdfupds,
    DB.Thm),
   ("elf32_compression_header_fupdfupds_comp",
    elf32_compression_header_fupdfupds_comp,
    DB.Thm),
   ("elf32_compression_header_fupdcanon",
    elf32_compression_header_fupdcanon,
    DB.Thm),
   ("elf32_compression_header_fupdcanon_comp",
    elf32_compression_header_fupdcanon_comp,
    DB.Thm),
   ("elf32_compression_header_component_equality",
    elf32_compression_header_component_equality,
    DB.Thm),
   ("elf32_compression_header_updates_eq_literal",
    elf32_compression_header_updates_eq_literal,
    DB.Thm),
   ("elf32_compression_header_literal_nchotomy",
    elf32_compression_header_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf32_compression_header",
    FORALL_elf32_compression_header,
    DB.Thm),
   ("EXISTS_elf32_compression_header",
    EXISTS_elf32_compression_header,
    DB.Thm),
   ("elf32_compression_header_literal_11",
    elf32_compression_header_literal_11,
    DB.Thm),
   ("datatype_elf32_compression_header",
    datatype_elf32_compression_header,
    DB.Thm),
   ("elf32_compression_header_11",elf32_compression_header_11,DB.Thm),
   ("elf32_compression_header_case_cong",
    elf32_compression_header_case_cong,
    DB.Thm),
   ("elf32_compression_header_nchotomy",
    elf32_compression_header_nchotomy,
    DB.Thm),
   ("elf32_compression_header_Axiom",
    elf32_compression_header_Axiom,
    DB.Thm),
   ("elf32_compression_header_induction",
    elf32_compression_header_induction,
    DB.Thm),
   ("elf64_compression_header_accessors",
    elf64_compression_header_accessors,
    DB.Thm),
   ("elf64_compression_header_fn_updates",
    elf64_compression_header_fn_updates,
    DB.Thm),
   ("elf64_compression_header_accfupds",
    elf64_compression_header_accfupds,
    DB.Thm),
   ("elf64_compression_header_fupdfupds",
    elf64_compression_header_fupdfupds,
    DB.Thm),
   ("elf64_compression_header_fupdfupds_comp",
    elf64_compression_header_fupdfupds_comp,
    DB.Thm),
   ("elf64_compression_header_fupdcanon",
    elf64_compression_header_fupdcanon,
    DB.Thm),
   ("elf64_compression_header_fupdcanon_comp",
    elf64_compression_header_fupdcanon_comp,
    DB.Thm),
   ("elf64_compression_header_component_equality",
    elf64_compression_header_component_equality,
    DB.Thm),
   ("elf64_compression_header_updates_eq_literal",
    elf64_compression_header_updates_eq_literal,
    DB.Thm),
   ("elf64_compression_header_literal_nchotomy",
    elf64_compression_header_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf64_compression_header",
    FORALL_elf64_compression_header,
    DB.Thm),
   ("EXISTS_elf64_compression_header",
    EXISTS_elf64_compression_header,
    DB.Thm),
   ("elf64_compression_header_literal_11",
    elf64_compression_header_literal_11,
    DB.Thm),
   ("datatype_elf64_compression_header",
    datatype_elf64_compression_header,
    DB.Thm),
   ("elf64_compression_header_11",elf64_compression_header_11,DB.Thm),
   ("elf64_compression_header_case_cong",
    elf64_compression_header_case_cong,
    DB.Thm),
   ("elf64_compression_header_nchotomy",
    elf64_compression_header_nchotomy,
    DB.Thm),
   ("elf64_compression_header_Axiom",
    elf64_compression_header_Axiom,
    DB.Thm),
   ("elf64_compression_header_induction",
    elf64_compression_header_induction,
    DB.Thm),
   ("elf32_section_header_table_entry_accessors",
    elf32_section_header_table_entry_accessors,
    DB.Thm),
   ("elf32_section_header_table_entry_fn_updates",
    elf32_section_header_table_entry_fn_updates,
    DB.Thm),
   ("elf32_section_header_table_entry_accfupds",
    elf32_section_header_table_entry_accfupds,
    DB.Thm),
   ("elf32_section_header_table_entry_fupdfupds",
    elf32_section_header_table_entry_fupdfupds,
    DB.Thm),
   ("elf32_section_header_table_entry_fupdfupds_comp",
    elf32_section_header_table_entry_fupdfupds_comp,
    DB.Thm),
   ("elf32_section_header_table_entry_fupdcanon",
    elf32_section_header_table_entry_fupdcanon,
    DB.Thm),
   ("elf32_section_header_table_entry_fupdcanon_comp",
    elf32_section_header_table_entry_fupdcanon_comp,
    DB.Thm),
   ("elf32_section_header_table_entry_component_equality",
    elf32_section_header_table_entry_component_equality,
    DB.Thm),
   ("elf32_section_header_table_entry_updates_eq_literal",
    elf32_section_header_table_entry_updates_eq_literal,
    DB.Thm),
   ("elf32_section_header_table_entry_literal_nchotomy",
    elf32_section_header_table_entry_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf32_section_header_table_entry",
    FORALL_elf32_section_header_table_entry,
    DB.Thm),
   ("EXISTS_elf32_section_header_table_entry",
    EXISTS_elf32_section_header_table_entry,
    DB.Thm),
   ("elf32_section_header_table_entry_literal_11",
    elf32_section_header_table_entry_literal_11,
    DB.Thm),
   ("datatype_elf32_section_header_table_entry",
    datatype_elf32_section_header_table_entry,
    DB.Thm),
   ("elf32_section_header_table_entry_11",
    elf32_section_header_table_entry_11,
    DB.Thm),
   ("elf32_section_header_table_entry_case_cong",
    elf32_section_header_table_entry_case_cong,
    DB.Thm),
   ("elf32_section_header_table_entry_nchotomy",
    elf32_section_header_table_entry_nchotomy,
    DB.Thm),
   ("elf32_section_header_table_entry_Axiom",
    elf32_section_header_table_entry_Axiom,
    DB.Thm),
   ("elf32_section_header_table_entry_induction",
    elf32_section_header_table_entry_induction,
    DB.Thm),
   ("elf64_section_header_table_entry_accessors",
    elf64_section_header_table_entry_accessors,
    DB.Thm),
   ("elf64_section_header_table_entry_fn_updates",
    elf64_section_header_table_entry_fn_updates,
    DB.Thm),
   ("elf64_section_header_table_entry_accfupds",
    elf64_section_header_table_entry_accfupds,
    DB.Thm),
   ("elf64_section_header_table_entry_fupdfupds",
    elf64_section_header_table_entry_fupdfupds,
    DB.Thm),
   ("elf64_section_header_table_entry_fupdfupds_comp",
    elf64_section_header_table_entry_fupdfupds_comp,
    DB.Thm),
   ("elf64_section_header_table_entry_fupdcanon",
    elf64_section_header_table_entry_fupdcanon,
    DB.Thm),
   ("elf64_section_header_table_entry_fupdcanon_comp",
    elf64_section_header_table_entry_fupdcanon_comp,
    DB.Thm),
   ("elf64_section_header_table_entry_component_equality",
    elf64_section_header_table_entry_component_equality,
    DB.Thm),
   ("elf64_section_header_table_entry_updates_eq_literal",
    elf64_section_header_table_entry_updates_eq_literal,
    DB.Thm),
   ("elf64_section_header_table_entry_literal_nchotomy",
    elf64_section_header_table_entry_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf64_section_header_table_entry",
    FORALL_elf64_section_header_table_entry,
    DB.Thm),
   ("EXISTS_elf64_section_header_table_entry",
    EXISTS_elf64_section_header_table_entry,
    DB.Thm),
   ("elf64_section_header_table_entry_literal_11",
    elf64_section_header_table_entry_literal_11,
    DB.Thm),
   ("datatype_elf64_section_header_table_entry",
    datatype_elf64_section_header_table_entry,
    DB.Thm),
   ("elf64_section_header_table_entry_11",
    elf64_section_header_table_entry_11,
    DB.Thm),
   ("elf64_section_header_table_entry_case_cong",
    elf64_section_header_table_entry_case_cong,
    DB.Thm),
   ("elf64_section_header_table_entry_nchotomy",
    elf64_section_header_table_entry_nchotomy,
    DB.Thm),
   ("elf64_section_header_table_entry_Axiom",
    elf64_section_header_table_entry_Axiom,
    DB.Thm),
   ("elf64_section_header_table_entry_induction",
    elf64_section_header_table_entry_induction,
    DB.Thm),
   ("read_elf32_section_header_table'_ind",
    read_elf32_section_header_table'_ind,
    DB.Thm),
   ("read_elf32_section_header_table'_def",
    read_elf32_section_header_table'_def,
    DB.Thm),
   ("read_elf64_section_header_table'_ind",
    read_elf64_section_header_table'_ind,
    DB.Thm),
   ("read_elf64_section_header_table'_def",
    read_elf64_section_header_table'_def,
    DB.Thm),
   ("get_elf32_section_to_segment_mapping_ind",
    get_elf32_section_to_segment_mapping_ind,
    DB.Thm),
   ("get_elf32_section_to_segment_mapping_def",
    get_elf32_section_to_segment_mapping_def,
    DB.Thm),
   ("get_elf64_section_to_segment_mapping_ind",
    get_elf64_section_to_segment_mapping_ind,
    DB.Thm),
   ("get_elf64_section_to_segment_mapping_def",
    get_elf64_section_to_segment_mapping_def,
    DB.Thm)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("string_tableTheory.string_table_grammars",
                          string_tableTheory.string_table_grammars),
                         ("lem_mapTheory.lem_map_grammars",
                          lem_mapTheory.lem_map_grammars),
                         ("elf_program_header_tableTheory.elf_program_header_table_grammars",
                          elf_program_header_tableTheory.elf_program_header_table_grammars),
                         ("elf_headerTheory.elf_header_grammars",
                          elf_headerTheory.elf_header_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_loreserve", (Term.prim_mk_const { Name = "shn_loreserve", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_loreserve", (Term.prim_mk_const { Name = "shn_loreserve", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_loproc", (Term.prim_mk_const { Name = "shn_loproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_loproc", (Term.prim_mk_const { Name = "shn_loproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_hiproc", (Term.prim_mk_const { Name = "shn_hiproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_hiproc", (Term.prim_mk_const { Name = "shn_hiproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_loos", (Term.prim_mk_const { Name = "shn_loos", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_loos", (Term.prim_mk_const { Name = "shn_loos", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_hios", (Term.prim_mk_const { Name = "shn_hios", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_hios", (Term.prim_mk_const { Name = "shn_hios", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_abs", (Term.prim_mk_const { Name = "shn_abs", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_abs", (Term.prim_mk_const { Name = "shn_abs", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_common", (Term.prim_mk_const { Name = "shn_common", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_common", (Term.prim_mk_const { Name = "shn_common", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_hireserve", (Term.prim_mk_const { Name = "shn_hireserve", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_hireserve", (Term.prim_mk_const { Name = "shn_hireserve", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_null", (Term.prim_mk_const { Name = "sht_null", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_null", (Term.prim_mk_const { Name = "sht_null", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_progbits", (Term.prim_mk_const { Name = "sht_progbits", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_progbits", (Term.prim_mk_const { Name = "sht_progbits", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_symtab", (Term.prim_mk_const { Name = "sht_symtab", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_symtab", (Term.prim_mk_const { Name = "sht_symtab", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_dynsym", (Term.prim_mk_const { Name = "sht_dynsym", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_dynsym", (Term.prim_mk_const { Name = "sht_dynsym", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_strtab", (Term.prim_mk_const { Name = "sht_strtab", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_strtab", (Term.prim_mk_const { Name = "sht_strtab", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_rela", (Term.prim_mk_const { Name = "sht_rela", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_rela", (Term.prim_mk_const { Name = "sht_rela", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_hash", (Term.prim_mk_const { Name = "sht_hash", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_hash", (Term.prim_mk_const { Name = "sht_hash", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_dynamic", (Term.prim_mk_const { Name = "sht_dynamic", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_dynamic", (Term.prim_mk_const { Name = "sht_dynamic", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_note", (Term.prim_mk_const { Name = "sht_note", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_note", (Term.prim_mk_const { Name = "sht_note", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_nobits", (Term.prim_mk_const { Name = "sht_nobits", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_nobits", (Term.prim_mk_const { Name = "sht_nobits", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_rel", (Term.prim_mk_const { Name = "sht_rel", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_rel", (Term.prim_mk_const { Name = "sht_rel", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_shlib", (Term.prim_mk_const { Name = "sht_shlib", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_shlib", (Term.prim_mk_const { Name = "sht_shlib", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_init_array", (Term.prim_mk_const { Name = "sht_init_array", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_init_array", (Term.prim_mk_const { Name = "sht_init_array", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_fini_array", (Term.prim_mk_const { Name = "sht_fini_array", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_fini_array", (Term.prim_mk_const { Name = "sht_fini_array", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_preinit_array", (Term.prim_mk_const { Name = "sht_preinit_array", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_preinit_array", (Term.prim_mk_const { Name = "sht_preinit_array", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_group", (Term.prim_mk_const { Name = "sht_group", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_group", (Term.prim_mk_const { Name = "sht_group", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_symtab_shndx", (Term.prim_mk_const { Name = "sht_symtab_shndx", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_symtab_shndx", (Term.prim_mk_const { Name = "sht_symtab_shndx", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_loos", (Term.prim_mk_const { Name = "sht_loos", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_loos", (Term.prim_mk_const { Name = "sht_loos", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_hios", (Term.prim_mk_const { Name = "sht_hios", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_hios", (Term.prim_mk_const { Name = "sht_hios", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_loproc", (Term.prim_mk_const { Name = "sht_loproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_loproc", (Term.prim_mk_const { Name = "sht_loproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_hiproc", (Term.prim_mk_const { Name = "sht_hiproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_hiproc", (Term.prim_mk_const { Name = "sht_hiproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_louser", (Term.prim_mk_const { Name = "sht_louser", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_louser", (Term.prim_mk_const { Name = "sht_louser", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_hiuser", (Term.prim_mk_const { Name = "sht_hiuser", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_hiuser", (Term.prim_mk_const { Name = "sht_hiuser", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_write", (Term.prim_mk_const { Name = "shf_write", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_write", (Term.prim_mk_const { Name = "shf_write", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_alloc", (Term.prim_mk_const { Name = "shf_alloc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_alloc", (Term.prim_mk_const { Name = "shf_alloc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_execinstr", (Term.prim_mk_const { Name = "shf_execinstr", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_execinstr", (Term.prim_mk_const { Name = "shf_execinstr", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_merge", (Term.prim_mk_const { Name = "shf_merge", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_merge", (Term.prim_mk_const { Name = "shf_merge", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_strings", (Term.prim_mk_const { Name = "shf_strings", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_strings", (Term.prim_mk_const { Name = "shf_strings", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_info_link", (Term.prim_mk_const { Name = "shf_info_link", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_info_link", (Term.prim_mk_const { Name = "shf_info_link", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_link_order", (Term.prim_mk_const { Name = "shf_link_order", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_link_order", (Term.prim_mk_const { Name = "shf_link_order", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_os_nonconforming", (Term.prim_mk_const { Name = "shf_os_nonconforming", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_os_nonconforming", (Term.prim_mk_const { Name = "shf_os_nonconforming", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_group", (Term.prim_mk_const { Name = "shf_group", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_group", (Term.prim_mk_const { Name = "shf_group", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_tls", (Term.prim_mk_const { Name = "shf_tls", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_tls", (Term.prim_mk_const { Name = "shf_tls", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_compressed", (Term.prim_mk_const { Name = "shf_compressed", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_compressed", (Term.prim_mk_const { Name = "shf_compressed", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_mask_os", (Term.prim_mk_const { Name = "shf_mask_os", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_mask_os", (Term.prim_mk_const { Name = "shf_mask_os", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_mask_proc", (Term.prim_mk_const { Name = "shf_mask_proc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_mask_proc", (Term.prim_mk_const { Name = "shf_mask_proc", Thy = "elf_section_header_table"}))
  val _ = update_grms temp_add_type "elf32_compression_header"
  val _ = update_grms temp_add_type "elf32_compression_header"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_compression_header", (Term.prim_mk_const { Name = "recordtype.elf32_compression_header", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_compression_header", (Term.prim_mk_const { Name = "recordtype.elf32_compression_header", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_compression_header_CASE", (Term.prim_mk_const { Name = "elf32_compression_header_CASE", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_compression_header_size", (Term.prim_mk_const { Name = "elf32_compression_header_size", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_compression_header_elf32_chdr_type", (Term.prim_mk_const { Name = "elf32_compression_header_elf32_chdr_type", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_compression_header_elf32_chdr_size", (Term.prim_mk_const { Name = "elf32_compression_header_elf32_chdr_size", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_compression_header_elf32_chdr_addralign", (Term.prim_mk_const { Name = "elf32_compression_header_elf32_chdr_addralign", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_compression_header_elf32_chdr_type_fupd", (Term.prim_mk_const { Name = "elf32_compression_header_elf32_chdr_type_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_compression_header_elf32_chdr_size_fupd", (Term.prim_mk_const { Name = "elf32_compression_header_elf32_chdr_size_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_compression_header_elf32_chdr_addralign_fupd", (Term.prim_mk_const { Name = "elf32_compression_header_elf32_chdr_addralign_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_chdr_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_compression_header)). elf_section_header_table$elf32_compression_header_elf32_chdr_type rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_chdr_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_compression_header)). elf_section_header_table$elf32_compression_header_elf32_chdr_size rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_chdr_addralign", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_compression_header)). elf_section_header_table$elf32_compression_header_elf32_chdr_addralign rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_chdr_type_fupd", (Term.prim_mk_const { Name = "elf32_compression_header_elf32_chdr_type_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_chdr_size_fupd", (Term.prim_mk_const { Name = "elf32_compression_header_elf32_chdr_size_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_chdr_addralign_fupd", (Term.prim_mk_const { Name = "elf32_compression_header_elf32_chdr_addralign_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_chdr_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_compression_header)). elf_section_header_table$elf32_compression_header_elf32_chdr_type_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_chdr_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_compression_header)). elf_section_header_table$elf32_compression_header_elf32_chdr_size_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_chdr_addralign", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_compression_header)). elf_section_header_table$elf32_compression_header_elf32_chdr_addralign_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_compression_header", (Term.prim_mk_const { Name = "recordtype.elf32_compression_header", Thy = "elf_section_header_table"}))
  val _ = update_grms temp_add_type "elf64_compression_header"
  val _ = update_grms temp_add_type "elf64_compression_header"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_compression_header", (Term.prim_mk_const { Name = "recordtype.elf64_compression_header", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_compression_header", (Term.prim_mk_const { Name = "recordtype.elf64_compression_header", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_compression_header_CASE", (Term.prim_mk_const { Name = "elf64_compression_header_CASE", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_compression_header_size", (Term.prim_mk_const { Name = "elf64_compression_header_size", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_compression_header_elf64_chdr_type", (Term.prim_mk_const { Name = "elf64_compression_header_elf64_chdr_type", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_compression_header_elf64_chdr_reserved", (Term.prim_mk_const { Name = "elf64_compression_header_elf64_chdr_reserved", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_compression_header_elf64_chdr_size", (Term.prim_mk_const { Name = "elf64_compression_header_elf64_chdr_size", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_compression_header_elf64_chdr_addralign", (Term.prim_mk_const { Name = "elf64_compression_header_elf64_chdr_addralign", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_compression_header_elf64_chdr_type_fupd", (Term.prim_mk_const { Name = "elf64_compression_header_elf64_chdr_type_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_compression_header_elf64_chdr_reserved_fupd", (Term.prim_mk_const { Name = "elf64_compression_header_elf64_chdr_reserved_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_compression_header_elf64_chdr_size_fupd", (Term.prim_mk_const { Name = "elf64_compression_header_elf64_chdr_size_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_compression_header_elf64_chdr_addralign_fupd", (Term.prim_mk_const { Name = "elf64_compression_header_elf64_chdr_addralign_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_chdr_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_compression_header)). elf_section_header_table$elf64_compression_header_elf64_chdr_type rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_chdr_reserved", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_compression_header)). elf_section_header_table$elf64_compression_header_elf64_chdr_reserved rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_chdr_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_compression_header)). elf_section_header_table$elf64_compression_header_elf64_chdr_size rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_chdr_addralign", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_compression_header)). elf_section_header_table$elf64_compression_header_elf64_chdr_addralign rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_chdr_type_fupd", (Term.prim_mk_const { Name = "elf64_compression_header_elf64_chdr_type_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_chdr_reserved_fupd", (Term.prim_mk_const { Name = "elf64_compression_header_elf64_chdr_reserved_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_chdr_size_fupd", (Term.prim_mk_const { Name = "elf64_compression_header_elf64_chdr_size_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_chdr_addralign_fupd", (Term.prim_mk_const { Name = "elf64_compression_header_elf64_chdr_addralign_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_chdr_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf64_compression_header)). elf_section_header_table$elf64_compression_header_elf64_chdr_type_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_chdr_reserved", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf64_compression_header)). elf_section_header_table$elf64_compression_header_elf64_chdr_reserved_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_chdr_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_section_header_table$elf64_compression_header)). elf_section_header_table$elf64_compression_header_elf64_chdr_size_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_chdr_addralign", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_section_header_table$elf64_compression_header)). elf_section_header_table$elf64_compression_header_elf64_chdr_addralign_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_compression_header", (Term.prim_mk_const { Name = "recordtype.elf64_compression_header", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elfcompress_zlib", (Term.prim_mk_const { Name = "elfcompress_zlib", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elfcompress_zlib", (Term.prim_mk_const { Name = "elfcompress_zlib", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elfcompress_loos", (Term.prim_mk_const { Name = "elfcompress_loos", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elfcompress_loos", (Term.prim_mk_const { Name = "elfcompress_loos", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elfcompress_hios", (Term.prim_mk_const { Name = "elfcompress_hios", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elfcompress_hios", (Term.prim_mk_const { Name = "elfcompress_hios", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elfcompress_loproc", (Term.prim_mk_const { Name = "elfcompress_loproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elfcompress_loproc", (Term.prim_mk_const { Name = "elfcompress_loproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elfcompress_hiproc", (Term.prim_mk_const { Name = "elfcompress_hiproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elfcompress_hiproc", (Term.prim_mk_const { Name = "elfcompress_hiproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_compression_header", (Term.prim_mk_const { Name = "read_elf32_compression_header", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_compression_header", (Term.prim_mk_const { Name = "read_elf32_compression_header", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_compression_header", (Term.prim_mk_const { Name = "read_elf64_compression_header", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_compression_header", (Term.prim_mk_const { Name = "read_elf64_compression_header", Thy = "elf_section_header_table"}))
  val _ = update_grms temp_add_type "elf32_section_header_table_entry"
  val _ = update_grms temp_add_type "elf32_section_header_table_entry"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_section_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf32_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_section_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf32_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_CASE", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_CASE", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_size", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_size", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_name", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_name", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_type", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_type", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_flags", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_flags", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_addr", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_addr", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_offset", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_offset", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_size", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_size", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_link", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_link", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_info", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_info", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_addralign", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_addralign", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_entsize", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_entsize", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_name_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_name_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_type_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_type_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_flags_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_flags_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_addr_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_addr_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_offset_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_offset_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_size_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_size_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_link_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_link_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_info_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_info_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_addralign_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_addralign_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry_elf32_sh_entsize_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_entsize_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_sh_name", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_name rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_sh_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_type rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_sh_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_flags rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_sh_addr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_addr rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_sh_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_offset rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_sh_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_size rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_sh_link", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_link rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_sh_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_info rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_sh_addralign", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_addralign rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_sh_entsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_entsize rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_sh_name_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_name_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_sh_type_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_type_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_sh_flags_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_flags_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_sh_addr_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_addr_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_sh_offset_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_offset_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_sh_size_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_size_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_sh_link_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_link_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_sh_info_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_info_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_sh_addralign_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_addralign_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_sh_entsize_fupd", (Term.prim_mk_const { Name = "elf32_section_header_table_entry_elf32_sh_entsize_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_sh_name", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_name_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_sh_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_type_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_sh_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_flags_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_sh_addr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_addr_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_sh_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_offset_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_sh_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_size_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_sh_link", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_link_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_sh_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_info_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_sh_addralign", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_addralign_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_sh_entsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf32_section_header_table_entry)). elf_section_header_table$elf32_section_header_table_entry_elf32_sh_entsize_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf32_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf32_section_header_table_entry", (Term.prim_mk_const { Name = "compare_elf32_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf32_section_header_table_entry", (Term.prim_mk_const { Name = "compare_elf32_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict", Thy = "elf_section_header_table"}))
  val _ = update_grms temp_add_type "elf64_section_header_table_entry"
  val _ = update_grms temp_add_type "elf64_section_header_table_entry"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_section_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf64_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_section_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf64_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_CASE", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_CASE", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_size", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_size", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_name", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_name", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_type", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_type", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_flags", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_flags", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_addr", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_addr", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_offset", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_offset", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_size", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_size", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_link", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_link", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_info", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_info", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_addralign", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_addralign", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_entsize", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_entsize", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_name_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_name_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_type_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_type_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_flags_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_flags_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_addr_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_addr_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_offset_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_offset_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_size_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_size_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_link_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_link_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_info_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_info_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_addralign_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_addralign_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry_elf64_sh_entsize_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_entsize_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_sh_name", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_name rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_sh_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_type rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_sh_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_flags rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_sh_addr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_addr rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_sh_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_offset rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_sh_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_size rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_sh_link", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_link rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_sh_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_info rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_sh_addralign", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_addralign rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_sh_entsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_entsize rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_sh_name_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_name_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_sh_type_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_type_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_sh_flags_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_flags_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_sh_addr_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_addr_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_sh_offset_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_offset_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_sh_size_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_size_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_sh_link_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_link_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_sh_info_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_info_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_sh_addralign_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_addralign_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_sh_entsize_fupd", (Term.prim_mk_const { Name = "elf64_section_header_table_entry_elf64_sh_entsize_fupd", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_sh_name", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_name_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_sh_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_type_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_sh_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_flags_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_sh_addr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_addr_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_sh_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_offset_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_sh_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_size_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_sh_link", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_link_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_sh_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_info_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_sh_addralign", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_addralign_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_sh_entsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_section_header_table$elf64_section_header_table_entry)). elf_section_header_table$elf64_section_header_table_entry_elf64_sh_entsize_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf64_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf64_section_header_table_entry", (Term.prim_mk_const { Name = "compare_elf64_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf64_section_header_table_entry", (Term.prim_mk_const { Name = "compare_elf64_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict", Thy = "elf_section_header_table"}))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_section_header_table",Name="elf32_section_header_table"}, T"list" "list"
 [T"elf32_section_header_table_entry" "elf_section_header_table" []])
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_section_header_table",Name="elf64_section_header_table"}, T"list" "list"
 [T"elf64_section_header_table_entry" "elf_section_header_table" []])
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_section_header_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf32_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_section_header_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf32_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_section_header_table_entry", (Term.prim_mk_const { Name = "read_elf32_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_section_header_table_entry", (Term.prim_mk_const { Name = "read_elf32_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_section_header_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf64_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_section_header_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf64_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_section_header_table_entry", (Term.prim_mk_const { Name = "read_elf64_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_section_header_table_entry", (Term.prim_mk_const { Name = "read_elf64_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_section_header_table", (Term.prim_mk_const { Name = "bytes_of_elf32_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_section_header_table", (Term.prim_mk_const { Name = "bytes_of_elf32_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_section_header_table", (Term.prim_mk_const { Name = "bytes_of_elf64_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_section_header_table", (Term.prim_mk_const { Name = "bytes_of_elf64_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_section_header_table'_tupled", (Term.prim_mk_const { Name = "read_elf32_section_header_table'_tupled", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_section_header_table'_tupled", (Term.prim_mk_const { Name = "read_elf32_section_header_table'_tupled", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_section_header_table'", (Term.prim_mk_const { Name = "read_elf32_section_header_table'", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_section_header_table'", (Term.prim_mk_const { Name = "read_elf32_section_header_table'", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_section_header_table'_tupled", (Term.prim_mk_const { Name = "read_elf64_section_header_table'_tupled", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_section_header_table'_tupled", (Term.prim_mk_const { Name = "read_elf64_section_header_table'_tupled", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_section_header_table'", (Term.prim_mk_const { Name = "read_elf64_section_header_table'", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_section_header_table'", (Term.prim_mk_const { Name = "read_elf64_section_header_table'", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_section_header_table", (Term.prim_mk_const { Name = "read_elf32_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_section_header_table", (Term.prim_mk_const { Name = "read_elf32_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_section_header_table", (Term.prim_mk_const { Name = "read_elf64_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_section_header_table", (Term.prim_mk_const { Name = "read_elf64_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_size_correct", (Term.prim_mk_const { Name = "elf32_size_correct", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_size_correct", (Term.prim_mk_const { Name = "elf32_size_correct", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_size_correct", (Term.prim_mk_const { Name = "elf64_size_correct", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_size_correct", (Term.prim_mk_const { Name = "elf64_size_correct", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_addr_addralign_correct", (Term.prim_mk_const { Name = "is_elf32_addr_addralign_correct", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_addr_addralign_correct", (Term.prim_mk_const { Name = "is_elf32_addr_addralign_correct", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_addr_addralign_correct", (Term.prim_mk_const { Name = "is_elf64_addr_addralign_correct", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_addr_addralign_correct", (Term.prim_mk_const { Name = "is_elf64_addr_addralign_correct", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf32_section_header_table", (Term.prim_mk_const { Name = "is_valid_elf32_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf32_section_header_table", (Term.prim_mk_const { Name = "is_valid_elf32_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf64_section_header_table", (Term.prim_mk_const { Name = "is_valid_elf64_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf64_section_header_table", (Term.prim_mk_const { Name = "is_valid_elf64_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_section_header_table",Name="sht_print_bundle"}, T"prod" "pair"
 [(T"num" "num" [] --> T"list" "list" [T"char" "string" []]),
  T"prod" "pair"
   [(T"num" "num" [] --> T"list" "list" [T"char" "string" []]),
    (T"num" "num" [] --> T"list" "list" [T"char" "string" []])]])
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_tbss_special", (Term.prim_mk_const { Name = "is_elf32_tbss_special", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_tbss_special", (Term.prim_mk_const { Name = "is_elf32_tbss_special", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_tbss_special", (Term.prim_mk_const { Name = "is_elf64_tbss_special", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_tbss_special", (Term.prim_mk_const { Name = "is_elf64_tbss_special", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_section_to_segment_mapping_tupled", (Term.prim_mk_const { Name = "get_elf32_section_to_segment_mapping_tupled", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_section_to_segment_mapping_tupled", (Term.prim_mk_const { Name = "get_elf32_section_to_segment_mapping_tupled", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_section_to_segment_mapping", (Term.prim_mk_const { Name = "get_elf32_section_to_segment_mapping", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_section_to_segment_mapping", (Term.prim_mk_const { Name = "get_elf32_section_to_segment_mapping", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_section_to_segment_mapping_tupled", (Term.prim_mk_const { Name = "get_elf64_section_to_segment_mapping_tupled", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_section_to_segment_mapping_tupled", (Term.prim_mk_const { Name = "get_elf64_section_to_segment_mapping_tupled", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_section_to_segment_mapping", (Term.prim_mk_const { Name = "get_elf64_section_to_segment_mapping", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_section_to_segment_mapping", (Term.prim_mk_const { Name = "get_elf64_section_to_segment_mapping", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("grp_comdat", (Term.prim_mk_const { Name = "grp_comdat", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("grp_comdat", (Term.prim_mk_const { Name = "grp_comdat", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("grp_maskos", (Term.prim_mk_const { Name = "grp_maskos", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("grp_maskos", (Term.prim_mk_const { Name = "grp_maskos", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("grp_maskproc", (Term.prim_mk_const { Name = "grp_maskproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("grp_maskproc", (Term.prim_mk_const { Name = "grp_maskproc", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("obtain_elf32_section_group_indices", (Term.prim_mk_const { Name = "obtain_elf32_section_group_indices", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("obtain_elf32_section_group_indices", (Term.prim_mk_const { Name = "obtain_elf32_section_group_indices", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("obtain_elf64_section_group_indices", (Term.prim_mk_const { Name = "obtain_elf64_section_group_indices", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("obtain_elf64_section_group_indices", (Term.prim_mk_const { Name = "obtain_elf64_section_group_indices", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("obtain_elf32_tls_template", (Term.prim_mk_const { Name = "obtain_elf32_tls_template", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("obtain_elf32_tls_template", (Term.prim_mk_const { Name = "obtain_elf32_tls_template", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("obtain_elf64_tls_template", (Term.prim_mk_const { Name = "obtain_elf64_tls_template", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("obtain_elf64_tls_template", (Term.prim_mk_const { Name = "obtain_elf64_tls_template", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("obtain_elf32_hash_table", (Term.prim_mk_const { Name = "obtain_elf32_hash_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("obtain_elf32_hash_table", (Term.prim_mk_const { Name = "obtain_elf32_hash_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("obtain_elf64_hash_table", (Term.prim_mk_const { Name = "obtain_elf64_hash_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("obtain_elf64_hash_table", (Term.prim_mk_const { Name = "obtain_elf64_hash_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_special_sections", (Term.prim_mk_const { Name = "elf_special_sections", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_special_sections", (Term.prim_mk_const { Name = "elf_special_sections", Thy = "elf_section_header_table"}))
  val elf_section_header_table_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG elf32_compression_header_Axiom,
           case_def=elf32_compression_header_case_def,
           case_cong=elf32_compression_header_case_cong,
           induction=ORIG elf32_compression_header_induction,
           nchotomy=elf32_compression_header_nchotomy,
           size=SOME(Parse.Term`(elf_section_header_table$elf32_compression_header_size) :(elf_section_header_table$elf32_compression_header) -> (num$num)`,
                     ORIG elf32_compression_header_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf32_compression_header_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf32_chdr_type",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]),
 ("elf32_chdr_size",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]),
 ("elf32_chdr_addralign",T"fcp" "cart"
                          [bool,
                           T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"fcp" "bit0"
                                  [T"fcp" "bit0"
                                    [T"one" "one"
                                      []]]]]]])] end,
           accessors=Drule.CONJUNCTS elf32_compression_header_accessors,
           updates=Drule.CONJUNCTS elf32_compression_header_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf32_compression_header_accessors, elf32_compression_header_updates_eq_literal, elf32_compression_header_accfupds, elf32_compression_header_fupdfupds, elf32_compression_header_literal_11, elf32_compression_header_fupdfupds_comp, elf32_compression_header_fupdcanon, elf32_compression_header_fupdcanon_comp] tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG elf64_compression_header_Axiom,
           case_def=elf64_compression_header_case_def,
           case_cong=elf64_compression_header_case_cong,
           induction=ORIG elf64_compression_header_induction,
           nchotomy=elf64_compression_header_nchotomy,
           size=SOME(Parse.Term`(elf_section_header_table$elf64_compression_header_size) :(elf_section_header_table$elf64_compression_header) -> (num$num)`,
                     ORIG elf64_compression_header_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf64_compression_header_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf64_chdr_type",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]),
 ("elf64_chdr_reserved",T"fcp" "cart"
                         [bool,
                          T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"fcp" "bit0"
                                 [T"fcp" "bit0"
                                   [T"one" "one" []]]]]]]),
 ("elf64_chdr_size",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"fcp" "bit0"
                                 [T"one" "one" []]]]]]]]),
 ("elf64_chdr_addralign",T"fcp" "cart"
                          [bool,
                           T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"fcp" "bit0"
                                  [T"fcp" "bit0"
                                    [T"fcp" "bit0"
                                      [T"one" "one"
                                        []]]]]]]])] end,
           accessors=Drule.CONJUNCTS elf64_compression_header_accessors,
           updates=Drule.CONJUNCTS elf64_compression_header_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf64_compression_header_accessors, elf64_compression_header_updates_eq_literal, elf64_compression_header_accfupds, elf64_compression_header_fupdfupds, elf64_compression_header_literal_11, elf64_compression_header_fupdfupds_comp, elf64_compression_header_fupdcanon, elf64_compression_header_fupdcanon_comp] tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG elf32_section_header_table_entry_Axiom,
           case_def=elf32_section_header_table_entry_case_def,
           case_cong=elf32_section_header_table_entry_case_cong,
           induction=ORIG elf32_section_header_table_entry_induction,
           nchotomy=elf32_section_header_table_entry_nchotomy,
           size=SOME(Parse.Term`(elf_section_header_table$elf32_section_header_table_entry_size) :(elf_section_header_table$elf32_section_header_table_entry) ->
(num$num)`,
                     ORIG elf32_section_header_table_entry_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf32_section_header_table_entry_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf32_sh_name",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_sh_type",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_sh_flags",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"one" "one" []]]]]]]),
 ("elf32_sh_addr",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_sh_offset",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]),
 ("elf32_sh_size",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_sh_link",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_sh_info",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_sh_addralign",T"fcp" "cart"
                        [bool,
                         T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"fcp" "bit0"
                                  [T"one" "one" []]]]]]]),
 ("elf32_sh_entsize",T"fcp" "cart"
                      [bool,
                       T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"one" "one" []]]]]]])] end,
           accessors=Drule.CONJUNCTS elf32_section_header_table_entry_accessors,
           updates=Drule.CONJUNCTS elf32_section_header_table_entry_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf32_section_header_table_entry_accessors, elf32_section_header_table_entry_updates_eq_literal, elf32_section_header_table_entry_accfupds, elf32_section_header_table_entry_fupdfupds, elf32_section_header_table_entry_literal_11, elf32_section_header_table_entry_fupdfupds_comp, elf32_section_header_table_entry_fupdcanon, elf32_section_header_table_entry_fupdcanon_comp] tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG elf64_section_header_table_entry_Axiom,
           case_def=elf64_section_header_table_entry_case_def,
           case_cong=elf64_section_header_table_entry_case_cong,
           induction=ORIG elf64_section_header_table_entry_induction,
           nchotomy=elf64_section_header_table_entry_nchotomy,
           size=SOME(Parse.Term`(elf_section_header_table$elf64_section_header_table_entry_size) :(elf_section_header_table$elf64_section_header_table_entry) ->
(num$num)`,
                     ORIG elf64_section_header_table_entry_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf64_section_header_table_entry_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf64_sh_name",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf64_sh_type",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf64_sh_flags",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"one" "one" []]]]]]]]),
 ("elf64_sh_addr",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]]),
 ("elf64_sh_offset",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"fcp" "bit0"
                                 [T"one" "one" []]]]]]]]),
 ("elf64_sh_size",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]]),
 ("elf64_sh_link",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf64_sh_info",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf64_sh_addralign",T"fcp" "cart"
                        [bool,
                         T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"fcp" "bit0"
                                  [T"fcp" "bit0"
                                    [T"one" "one"
                                      []]]]]]]]),
 ("elf64_sh_entsize",T"fcp" "cart"
                      [bool,
                       T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"fcp" "bit0"
                                  [T"one" "one"
                                    []]]]]]]])] end,
           accessors=Drule.CONJUNCTS elf64_section_header_table_entry_accessors,
           updates=Drule.CONJUNCTS elf64_section_header_table_entry_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf64_section_header_table_entry_accessors, elf64_section_header_table_entry_updates_eq_literal, elf64_section_header_table_entry_accfupds, elf64_section_header_table_entry_fupdfupds, elf64_section_header_table_entry_literal_11, elf64_section_header_table_entry_fupdfupds_comp, elf64_section_header_table_entry_fupdcanon, elf64_section_header_table_entry_fupdcanon_comp] tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "elf_section_header_table",
    thydataty = "compute",
    data =
        "elf_section_header_table.shn_loreserve_def elf_section_header_table.sht_symtab_shndx_def elf_section_header_table.elf_special_sections_def elf_section_header_table.obtain_elf64_hash_table_def elf_section_header_table.obtain_elf32_hash_table_def elf_section_header_table.obtain_elf64_tls_template_def elf_section_header_table.obtain_elf32_tls_template_def elf_section_header_table.obtain_elf64_section_group_indices_def elf_section_header_table.obtain_elf32_section_group_indices_def elf_section_header_table.grp_maskproc_def elf_section_header_table.grp_maskos_def elf_section_header_table.grp_comdat_def elf_section_header_table.is_elf64_tbss_special_def elf_section_header_table.is_elf32_tbss_special_def elf_section_header_table.is_valid_elf64_section_header_table_def elf_section_header_table.is_valid_elf32_section_header_table_def elf_section_header_table.is_elf64_addr_addralign_correct_def elf_section_header_table.is_elf32_addr_addralign_correct_def elf_section_header_table.elf64_size_correct_def elf_section_header_table.elf32_size_correct_def elf_section_header_table.read_elf64_section_header_table_def elf_section_header_table.read_elf32_section_header_table_def elf_section_header_table.bytes_of_elf64_section_header_table_def elf_section_header_table.bytes_of_elf32_section_header_table_def elf_section_header_table.read_elf64_section_header_table_entry_def elf_section_header_table.bytes_of_elf64_section_header_table_entry_def elf_section_header_table.read_elf32_section_header_table_entry_def elf_section_header_table.bytes_of_elf32_section_header_table_entry_def elf_section_header_table.instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict_def elf_section_header_table.compare_elf64_section_header_table_entry_def elf_section_header_table.instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict_def elf_section_header_table.compare_elf32_section_header_table_entry_def elf_section_header_table.read_elf64_compression_header_def elf_section_header_table.read_elf32_compression_header_def elf_section_header_table.elfcompress_hiproc_def elf_section_header_table.elfcompress_loproc_def elf_section_header_table.elfcompress_hios_def elf_section_header_table.elfcompress_loos_def elf_section_header_table.elfcompress_zlib_def elf_section_header_table.shf_mask_proc_def elf_section_header_table.shf_mask_os_def elf_section_header_table.shf_compressed_def elf_section_header_table.shf_tls_def elf_section_header_table.shf_group_def elf_section_header_table.shf_os_nonconforming_def elf_section_header_table.shf_link_order_def elf_section_header_table.shf_info_link_def elf_section_header_table.shf_strings_def elf_section_header_table.shf_merge_def elf_section_header_table.shf_execinstr_def elf_section_header_table.shf_alloc_def elf_section_header_table.shf_write_def elf_section_header_table.sht_hiuser_def elf_section_header_table.sht_louser_def elf_section_header_table.sht_hiproc_def elf_section_header_table.sht_loproc_def elf_section_header_table.sht_hios_def elf_section_header_table.sht_loos_def elf_section_header_table.sht_shlib_def elf_section_header_table.sht_group_def elf_section_header_table.sht_preinit_array_def elf_section_header_table.sht_fini_array_def elf_section_header_table.sht_init_array_def elf_section_header_table.sht_rel_def elf_section_header_table.sht_rela_def elf_section_header_table.sht_nobits_def elf_section_header_table.sht_note_def elf_section_header_table.sht_dynamic_def elf_section_header_table.sht_hash_def elf_section_header_table.sht_strtab_def elf_section_header_table.sht_symtab_def elf_section_header_table.sht_dynsym_def elf_section_header_table.sht_null_def elf_section_header_table.sht_progbits_def elf_section_header_table.shn_hireserve_def elf_section_header_table.shn_abs_def elf_section_header_table.shn_common_def elf_section_header_table.shn_hios_def elf_section_header_table.shn_hiproc_def elf_section_header_table.shn_loos_def elf_section_header_table.shn_loproc_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "elf_section_header_table"
end
