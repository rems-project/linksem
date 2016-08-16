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
          Arbnum.fromString "1471355220",
          Arbnum.fromString "107187")
          [("string_table",
           Arbnum.fromString "1471355139",
           Arbnum.fromString "3264"),
           ("elf_program_header_table",
           Arbnum.fromString "1471355165",
           Arbnum.fromString "897438"),
           ("elf_header",
           Arbnum.fromString "1471355161",
           Arbnum.fromString "843300"),
           ("lem_map",
           Arbnum.fromString "1471269260",
           Arbnum.fromString "740684")];
  val _ = Theory.incorporate_types "elf_section_header_table"
       [("elf64_section_header_table_entry", 0),
        ("elf64_compression_header", 0),
        ("elf32_section_header_table_entry", 0),
        ("elf32_compression_header", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("list", "list"), ID("string", "char"),
   ID("num", "num"),
   ID("elf_section_header_table", "elf64_section_header_table_entry"),
   ID("string_table", "string_table"), ID("pair", "prod"),
   ID("elf_section_header_table", "elf32_section_header_table_entry"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
   ID("min", "bool"),
   ID("elf_section_header_table", "elf64_compression_header"),
   ID("elf_section_header_table", "elf32_compression_header"),
   ID("error", "error"), ID("byte_sequence", "byte_sequence"),
   ID("endianness", "endianness"),
   ID("elf_program_header_table", "elf64_program_header_table_entry"),
   ID("elf_program_header_table", "elf32_program_header_table_entry"),
   ID("show", "Show_class"), ID("lem_basic_classes", "Ord_class"),
   ID("finite_map", "fmap"), ID("lem_basic_classes", "ordering"),
   ID("ind_type", "recspace"), ID("min", "ind"), ID("bool", "!"),
   ID("arithmetic", "*"), ID("arithmetic", "+"), ID("pair", ","),
   ID("bool", "/\\"), ID("num", "0"), ID("prim_rec", "<"),
   ID("arithmetic", "<="), ID("min", "="), ID("min", "==>"),
   ID("arithmetic", ">="), ID("bool", "?"), ID("list", "APPEND"),
   ID("bool", "ARB"), ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("arithmetic", "DIV"), ID("pred_set", "EMPTY"),
   ID("lem_basic_classes", "EQ"), ID("bool", "F"),
   ID("finite_map", "FEMPTY"), ID("list", "FILTER"),
   ID("finite_map", "FUPDATE_LIST"), ID("lem_basic_classes", "GT"),
   ID("bool", "IN"), ID("pred_set", "INSERT"), ID("combin", "K"),
   ID("list", "LENGTH"), ID("bool", "LET"), ID("lem_basic_classes", "LT"),
   ID("list", "MAP"), ID("arithmetic", "MOD"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("show", "Show_class_show_method_fupd"), ID("bool", "T"),
   ID("bool", "TYPE_DEFINITION"), ID("pair", "UNCURRY"),
   ID("relation", "WF"), ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("elf_types_native_uint", "bytes_of_elf32_addr"),
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
   ID("elf_section_header_table", "elf32_null_section_header"),
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
   ID("elf_section_header_table", "elf64_null_section_header"),
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
   ID("error", "error_CASE"), ID("error", "error_bind"),
   ID("error", "fail0"), ID("byte_sequence", "from_byte_lists"),
   ID("lem_basic_classes", "genericCompare"),
   ID("elf_section_header_table", "get_elf32_section_to_segment_mapping"),
   ID("elf_section_header_table", "get_elf64_section_to_segment_mapping"),
   ID("string_table", "get_string_at"),
   ID("elf_section_header_table", "grp_comdat"),
   ID("elf_section_header_table", "grp_maskos"),
   ID("elf_section_header_table", "grp_maskproc"),
   ID("elf_section_header_table", "instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict"),
   ID("elf_section_header_table", "instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict"),
   ID("elf_section_header_table", "instance_Show_Show_Elf_section_header_table_elf32_section_header_table_entry_dict"),
   ID("elf_section_header_table", "instance_Show_Show_Elf_section_header_table_elf64_section_header_table_entry_dict"),
   ID("elf_section_header_table", "is_elf32_addr_addralign_correct"),
   ID("elf_section_header_table", "is_elf32_tbss_special"),
   ID("elf_section_header_table", "is_elf64_addr_addralign_correct"),
   ID("elf_section_header_table", "is_elf64_tbss_special"),
   ID("elf_section_header_table", "is_valid_elf32_section_header_table"),
   ID("elf_section_header_table", "is_valid_elf64_section_header_table"),
   ID("byte_sequence", "length0"), ID("lem_list", "lexicographic_compare"),
   ID("list", "list_CASE"), ID("error", "mapM"), ID("words", "n2w"),
   ID("elf_types_native_uint", "natural_land"),
   ID("ASCIInumbers", "num_to_dec_string"), ID("combin", "o"),
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
   ID("elf_section_header_table", "read_elf32_section_header_table_entry"),
   ID("elf_types_native_uint", "read_elf32_word"),
   ID("elf_types_native_uint", "read_elf64_addr"),
   ID("elf_section_header_table", "read_elf64_compression_header"),
   ID("elf_types_native_uint", "read_elf64_off"),
   ID("elf_section_header_table", "read_elf64_section_header_table"),
   ID("elf_section_header_table", "read_elf64_section_header_table'"),
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
   ID("elf_header", "shn_undef"), ID("elf_header", "shn_xindex"),
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
   ID("elf_section_header_table", "string_of_elf32_section_header_table"),
   ID("elf_section_header_table", "string_of_elf32_section_header_table'"),
   ID("elf_section_header_table", "string_of_elf32_section_header_table_default"),
   ID("elf_section_header_table", "string_of_elf32_section_header_table_entry"),
   ID("elf_section_header_table", "string_of_elf32_section_header_table_entry'"),
   ID("elf_section_header_table", "string_of_elf32_section_header_table_entry_default"),
   ID("elf_section_header_table", "string_of_elf64_section_header_table"),
   ID("elf_section_header_table", "string_of_elf64_section_header_table'"),
   ID("elf_section_header_table", "string_of_elf64_section_header_table_default"),
   ID("elf_section_header_table", "string_of_elf64_section_header_table_entry"),
   ID("elf_section_header_table", "string_of_elf64_section_header_table_entry'"),
   ID("elf_section_header_table", "string_of_elf64_section_header_table_entry_default"),
   ID("elf_section_header_table", "string_of_section_flags"),
   ID("elf_section_header_table", "string_of_section_type"),
   ID("elf_section_header_table", "string_of_special_section_index"),
   ID("missing_pervasives", "unlines"), ID("words", "w2n"),
   ID("words", "word_and"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [2], TYOP [1, 0], TYOP [3], TYOP [0, 2, 1], TYOP [0, 3, 3],
   TYOP [0, 3, 4], TYOP [0, 3, 5], TYV "'b", TYOP [0, 7, 3], TYV "'a",
   TYOP [0, 9, 8], TYOP [4], TYOP [0, 11, 1], TYOP [5], TYOP [0, 13, 12],
   TYOP [6, 3, 3], TYOP [6, 3, 15], TYOP [0, 16, 14], TYOP [0, 16, 12],
   TYOP [1, 11], TYOP [0, 19, 1], TYOP [0, 13, 20], TYOP [0, 16, 21],
   TYOP [0, 16, 20], TYOP [7], TYOP [0, 24, 1], TYOP [0, 13, 25],
   TYOP [0, 16, 26], TYOP [0, 16, 25], TYOP [1, 24], TYOP [0, 29, 1],
   TYOP [0, 13, 30], TYOP [0, 16, 31], TYOP [0, 16, 30], TYOP [10],
   TYOP [9, 34], TYOP [9, 35], TYOP [9, 36], TYOP [9, 37], TYOP [9, 38],
   TYOP [9, 39], TYOP [11], TYOP [8, 41, 40], TYOP [0, 42, 11],
   TYOP [0, 42, 43], TYOP [8, 41, 39], TYOP [0, 45, 44], TYOP [0, 45, 46],
   TYOP [0, 42, 47], TYOP [0, 42, 48], TYOP [0, 42, 49], TYOP [0, 42, 50],
   TYOP [0, 45, 51], TYOP [0, 45, 52], TYOP [12], TYOP [0, 42, 54],
   TYOP [0, 42, 55], TYOP [0, 45, 56], TYOP [0, 45, 57], TYOP [0, 45, 24],
   TYOP [0, 45, 59], TYOP [0, 45, 60], TYOP [0, 45, 61], TYOP [0, 45, 62],
   TYOP [0, 45, 63], TYOP [0, 45, 64], TYOP [0, 45, 65], TYOP [0, 45, 66],
   TYOP [0, 45, 67], TYOP [13], TYOP [0, 45, 69], TYOP [0, 45, 70],
   TYOP [0, 45, 71], TYOP [15], TYOP [6, 11, 73], TYOP [14, 74],
   TYOP [0, 73, 75], TYOP [16], TYOP [0, 77, 76], TYOP [14, 19],
   TYOP [0, 73, 79], TYOP [0, 77, 80], TYOP [6, 19, 73], TYOP [14, 82],
   TYOP [0, 73, 83], TYOP [0, 77, 84], TYOP [0, 2, 85], TYOP [6, 54, 73],
   TYOP [14, 87], TYOP [0, 73, 88], TYOP [0, 77, 89], TYOP [6, 24, 73],
   TYOP [14, 91], TYOP [0, 73, 92], TYOP [0, 77, 93], TYOP [14, 29],
   TYOP [0, 73, 95], TYOP [0, 77, 96], TYOP [6, 29, 73], TYOP [14, 98],
   TYOP [0, 73, 99], TYOP [0, 77, 100], TYOP [0, 2, 101], TYOP [6, 69, 73],
   TYOP [14, 103], TYOP [0, 73, 104], TYOP [0, 77, 105], TYOP [0, 19, 19],
   TYOP [1, 45], TYOP [6, 2, 108], TYOP [1, 109], TYOP [14, 110],
   TYOP [0, 73, 111], TYOP [0, 19, 112], TYOP [0, 77, 113],
   TYOP [6, 108, 108], TYOP [6, 45, 115], TYOP [6, 45, 116],
   TYOP [14, 117], TYOP [0, 73, 118], TYOP [0, 19, 119], TYOP [0, 77, 120],
   TYOP [0, 29, 29], TYOP [0, 29, 112], TYOP [0, 77, 123],
   TYOP [0, 29, 119], TYOP [0, 77, 125], TYOP [0, 19, 41],
   TYOP [0, 29, 41], TYOP [17], TYOP [0, 129, 41], TYOP [0, 11, 130],
   TYOP [0, 11, 41], TYOP [18], TYOP [0, 133, 41], TYOP [0, 24, 134],
   TYOP [0, 24, 41], TYOP [19, 11], TYOP [19, 24], TYOP [20, 11],
   TYOP [20, 24], TYOP [1, 1], TYOP [14, 141], TYOP [0, 13, 142],
   TYOP [0, 9, 131], TYOP [0, 144, 143], TYOP [0, 129, 145],
   TYOP [0, 19, 146], TYOP [0, 9, 147], TYOP [0, 9, 135],
   TYOP [0, 149, 143], TYOP [0, 133, 150], TYOP [0, 29, 151],
   TYOP [0, 9, 152], TYOP [6, 2, 2], TYOP [21, 1, 154], TYOP [1, 9],
   TYOP [0, 156, 41], TYOP [0, 11, 157], TYOP [0, 11, 2], TYOP [0, 11, 11],
   TYOP [0, 45, 45], TYOP [0, 161, 160], TYOP [0, 11, 45],
   TYOP [0, 42, 42], TYOP [0, 164, 160], TYOP [0, 11, 42], TYOP [0, 42, 9],
   TYOP [0, 42, 167], TYOP [0, 45, 168], TYOP [0, 45, 169],
   TYOP [0, 42, 170], TYOP [0, 42, 171], TYOP [0, 42, 172],
   TYOP [0, 42, 173], TYOP [0, 45, 174], TYOP [0, 45, 175],
   TYOP [0, 176, 9], TYOP [0, 11, 177], TYOP [0, 54, 2], TYOP [0, 54, 54],
   TYOP [0, 161, 180], TYOP [0, 54, 45], TYOP [0, 164, 180],
   TYOP [0, 54, 42], TYOP [0, 170, 9], TYOP [0, 54, 185],
   TYOP [0, 24, 157], TYOP [0, 24, 2], TYOP [0, 24, 24],
   TYOP [0, 161, 189], TYOP [0, 24, 45], TYOP [0, 45, 9],
   TYOP [0, 45, 192], TYOP [0, 45, 193], TYOP [0, 45, 194],
   TYOP [0, 45, 195], TYOP [0, 45, 196], TYOP [0, 45, 197],
   TYOP [0, 45, 198], TYOP [0, 45, 199], TYOP [0, 45, 200],
   TYOP [0, 201, 9], TYOP [0, 24, 202], TYOP [0, 69, 2], TYOP [0, 69, 69],
   TYOP [0, 161, 205], TYOP [0, 69, 45], TYOP [0, 194, 9],
   TYOP [0, 69, 208], TYOP [22], TYOP [0, 11, 210], TYOP [0, 11, 211],
   TYOP [0, 24, 210], TYOP [0, 24, 213], TYOP [0, 11, 73],
   TYOP [0, 77, 215], TYOP [0, 19, 73], TYOP [0, 77, 217],
   TYOP [0, 24, 73], TYOP [0, 77, 219], TYOP [0, 29, 73],
   TYOP [0, 77, 221], TYOP [6, 45, 45], TYOP [6, 45, 223], TYOP [23, 224],
   TYOP [0, 225, 41], TYOP [6, 45, 224], TYOP [6, 45, 227],
   TYOP [6, 45, 228], TYOP [6, 45, 229], TYOP [6, 45, 230],
   TYOP [6, 45, 231], TYOP [6, 45, 232], TYOP [23, 233], TYOP [0, 234, 41],
   TYOP [6, 42, 42], TYOP [6, 45, 236], TYOP [6, 45, 237], TYOP [23, 238],
   TYOP [0, 239, 41], TYOP [6, 42, 238], TYOP [6, 42, 241],
   TYOP [6, 42, 242], TYOP [6, 42, 243], TYOP [6, 45, 244],
   TYOP [6, 45, 245], TYOP [23, 246], TYOP [0, 247, 41], TYOP [0, 13, 41],
   TYOP [0, 149, 249], TYOP [0, 133, 250], TYOP [0, 29, 251],
   TYOP [0, 9, 252], TYOP [0, 144, 249], TYOP [0, 129, 254],
   TYOP [0, 19, 255], TYOP [0, 9, 256], TYOP [0, 69, 41], TYOP [0, 54, 41],
   TYOP [0, 73, 41], TYOP [0, 77, 260], TYOP [6, 149, 13],
   TYOP [6, 133, 262], TYOP [6, 29, 263], TYOP [6, 9, 264],
   TYOP [0, 265, 41], TYOP [0, 265, 266], TYOP [6, 144, 13],
   TYOP [6, 129, 268], TYOP [6, 19, 269], TYOP [6, 9, 270],
   TYOP [0, 271, 41], TYOP [0, 271, 272], TYOP [6, 77, 73],
   TYOP [0, 274, 41], TYOP [0, 274, 275], TYOP [24], TYOP [0, 69, 9],
   TYOP [0, 24, 9], TYOP [0, 54, 9], TYOP [0, 11, 9], TYOP [0, 9, 69],
   TYOP [0, 9, 24], TYOP [0, 9, 54], TYOP [0, 9, 11], TYOP [6, 108, 73],
   TYOP [0, 42, 41], TYOP [0, 42, 287], TYOP [0, 45, 288],
   TYOP [0, 45, 289], TYOP [0, 277, 290], TYOP [0, 42, 290],
   TYOP [0, 42, 292], TYOP [0, 42, 293], TYOP [0, 42, 294],
   TYOP [0, 45, 295], TYOP [0, 45, 296], TYOP [0, 277, 297],
   TYOP [0, 45, 41], TYOP [0, 45, 299], TYOP [0, 45, 300],
   TYOP [0, 277, 301], TYOP [0, 45, 301], TYOP [0, 45, 303],
   TYOP [0, 45, 304], TYOP [0, 45, 305], TYOP [0, 45, 306],
   TYOP [0, 45, 307], TYOP [0, 45, 308], TYOP [0, 277, 309],
   TYOP [0, 69, 225], TYOP [0, 24, 234], TYOP [0, 54, 239],
   TYOP [0, 11, 247], TYOP [0, 9, 41], TYOP [0, 315, 41], TYOP [0, 7, 41],
   TYOP [0, 317, 41], TYOP [0, 260, 41], TYOP [0, 287, 41],
   TYOP [0, 299, 41], TYOP [0, 258, 41], TYOP [0, 134, 41],
   TYOP [0, 136, 41], TYOP [0, 259, 41], TYOP [0, 130, 41],
   TYOP [0, 132, 41], TYOP [0, 77, 41], TYOP [0, 328, 41],
   TYOP [0, 282, 41], TYOP [0, 330, 41], TYOP [0, 283, 41],
   TYOP [0, 332, 41], TYOP [0, 284, 41], TYOP [0, 334, 41],
   TYOP [0, 285, 41], TYOP [0, 336, 41], TYOP [0, 149, 41],
   TYOP [0, 338, 41], TYOP [0, 144, 41], TYOP [0, 340, 41],
   TYOP [0, 253, 41], TYOP [0, 342, 41], TYOP [0, 257, 41],
   TYOP [0, 344, 41], TYOP [0, 164, 41], TYOP [0, 346, 41],
   TYOP [0, 161, 41], TYOP [0, 348, 41], TYOP [0, 170, 41],
   TYOP [0, 350, 41], TYOP [0, 176, 41], TYOP [0, 352, 41],
   TYOP [0, 194, 41], TYOP [0, 354, 41], TYOP [0, 201, 41],
   TYOP [0, 356, 41], TYOP [0, 322, 41], TYOP [0, 324, 41],
   TYOP [0, 325, 41], TYOP [0, 327, 41], TYOP [0, 261, 41],
   TYOP [0, 362, 41], TYOP [0, 3, 41], TYOP [0, 364, 41],
   TYOP [0, 226, 41], TYOP [0, 366, 41], TYOP [0, 240, 41],
   TYOP [0, 368, 41], TYOP [0, 248, 41], TYOP [0, 370, 41],
   TYOP [0, 235, 41], TYOP [0, 372, 41], TYOP [0, 157, 41],
   TYOP [0, 128, 41], TYOP [0, 127, 41], TYOP [0, 2, 41],
   TYOP [0, 377, 41], TYOP [0, 16, 41], TYOP [0, 379, 41],
   TYOP [0, 249, 41], TYOP [0, 2, 2], TYOP [0, 2, 382], TYOP [0, 264, 265],
   TYOP [0, 9, 384], TYOP [0, 270, 271], TYOP [0, 9, 386],
   TYOP [0, 42, 236], TYOP [0, 42, 388], TYOP [0, 243, 244],
   TYOP [0, 42, 390], TYOP [0, 242, 243], TYOP [0, 42, 392],
   TYOP [0, 241, 242], TYOP [0, 42, 394], TYOP [0, 238, 241],
   TYOP [0, 42, 396], TYOP [0, 45, 223], TYOP [0, 45, 398],
   TYOP [0, 236, 237], TYOP [0, 45, 400], TYOP [0, 244, 245],
   TYOP [0, 45, 402], TYOP [0, 223, 224], TYOP [0, 45, 404],
   TYOP [0, 237, 238], TYOP [0, 45, 406], TYOP [0, 245, 246],
   TYOP [0, 45, 408], TYOP [0, 224, 227], TYOP [0, 45, 410],
   TYOP [0, 227, 228], TYOP [0, 45, 412], TYOP [0, 228, 229],
   TYOP [0, 45, 414], TYOP [0, 229, 230], TYOP [0, 45, 416],
   TYOP [0, 230, 231], TYOP [0, 45, 418], TYOP [0, 231, 232],
   TYOP [0, 45, 420], TYOP [0, 232, 233], TYOP [0, 45, 422],
   TYOP [0, 116, 117], TYOP [0, 45, 424], TYOP [0, 115, 116],
   TYOP [0, 45, 426], TYOP [0, 73, 103], TYOP [0, 69, 428],
   TYOP [0, 262, 263], TYOP [0, 133, 430], TYOP [0, 73, 91],
   TYOP [0, 24, 432], TYOP [0, 73, 87], TYOP [0, 54, 434],
   TYOP [0, 268, 269], TYOP [0, 129, 436], TYOP [0, 73, 74],
   TYOP [0, 11, 438], TYOP [0, 73, 274], TYOP [0, 77, 440],
   TYOP [0, 13, 262], TYOP [0, 149, 442], TYOP [0, 13, 268],
   TYOP [0, 144, 444], TYOP [0, 3, 15], TYOP [0, 3, 446], TYOP [0, 15, 16],
   TYOP [0, 3, 448], TYOP [0, 108, 115], TYOP [0, 108, 450],
   TYOP [6, 1, 154], TYOP [0, 154, 452], TYOP [0, 1, 453],
   TYOP [0, 73, 98], TYOP [0, 29, 455], TYOP [0, 263, 264],
   TYOP [0, 29, 457], TYOP [0, 73, 82], TYOP [0, 19, 459],
   TYOP [0, 269, 270], TYOP [0, 19, 461], TYOP [0, 108, 109],
   TYOP [0, 2, 463], TYOP [0, 2, 154], TYOP [0, 2, 465], TYOP [0, 41, 41],
   TYOP [0, 41, 467], TYOP [0, 2, 377], TYOP [0, 9, 315],
   TYOP [0, 140, 41], TYOP [0, 140, 471], TYOP [0, 139, 41],
   TYOP [0, 139, 473], TYOP [0, 138, 41], TYOP [0, 138, 475],
   TYOP [0, 137, 41], TYOP [0, 137, 477], TYOP [0, 73, 260],
   TYOP [0, 69, 258], TYOP [0, 24, 136], TYOP [0, 54, 259],
   TYOP [0, 11, 132], TYOP [0, 95, 41], TYOP [0, 95, 484],
   TYOP [0, 79, 41], TYOP [0, 79, 486], TYOP [0, 142, 41],
   TYOP [0, 142, 488], TYOP [0, 111, 41], TYOP [0, 111, 490],
   TYOP [0, 118, 41], TYOP [0, 118, 492], TYOP [0, 104, 41],
   TYOP [0, 104, 494], TYOP [0, 92, 41], TYOP [0, 92, 496],
   TYOP [0, 88, 41], TYOP [0, 88, 498], TYOP [0, 75, 41],
   TYOP [0, 75, 500], TYOP [0, 99, 41], TYOP [0, 99, 502],
   TYOP [0, 83, 41], TYOP [0, 83, 504], TYOP [0, 155, 41],
   TYOP [0, 155, 506], TYOP [0, 282, 330], TYOP [0, 283, 332],
   TYOP [0, 284, 334], TYOP [0, 285, 336], TYOP [0, 205, 41],
   TYOP [0, 205, 512], TYOP [0, 189, 41], TYOP [0, 189, 514],
   TYOP [0, 25, 41], TYOP [0, 25, 516], TYOP [0, 180, 41],
   TYOP [0, 180, 518], TYOP [0, 160, 41], TYOP [0, 160, 520],
   TYOP [0, 12, 41], TYOP [0, 12, 522], TYOP [0, 30, 41],
   TYOP [0, 30, 524], TYOP [0, 20, 41], TYOP [0, 20, 526], TYOP [0, 1, 41],
   TYOP [0, 1, 528], TYOP [0, 29, 128], TYOP [0, 19, 127],
   TYOP [0, 210, 41], TYOP [0, 210, 532], TYOP [0, 225, 226],
   TYOP [0, 239, 240], TYOP [0, 247, 248], TYOP [0, 234, 235],
   TYOP [0, 278, 41], TYOP [0, 538, 41], TYOP [0, 311, 41],
   TYOP [0, 540, 41], TYOP [0, 279, 41], TYOP [0, 542, 41],
   TYOP [0, 312, 41], TYOP [0, 544, 41], TYOP [0, 280, 41],
   TYOP [0, 546, 41], TYOP [0, 313, 41], TYOP [0, 548, 41],
   TYOP [0, 281, 41], TYOP [0, 550, 41], TYOP [0, 314, 41],
   TYOP [0, 552, 41], TYOP [0, 1, 1], TYOP [0, 1, 554], TYOP [0, 2, 0],
   TYOP [0, 41, 468], TYOP [0, 95, 95], TYOP [0, 95, 558],
   TYOP [0, 41, 559], TYOP [0, 79, 79], TYOP [0, 79, 561],
   TYOP [0, 41, 562], TYOP [0, 142, 142], TYOP [0, 142, 564],
   TYOP [0, 41, 565], TYOP [0, 41, 555], TYOP [0, 0, 554],
   TYOP [0, 24, 122], TYOP [0, 11, 107], TYOP [8, 41, 37], TYOP [1, 571],
   TYOP [1, 572], TYOP [0, 573, 573], TYOP [0, 572, 574],
   TYOP [0, 141, 141], TYOP [0, 1, 576], TYOP [1, 2], TYOP [0, 578, 578],
   TYOP [0, 2, 579], TYOP [1, 452], TYOP [0, 581, 581], TYOP [0, 452, 582],
   TYOP [0, 2, 225], TYOP [0, 584, 225], TYOP [0, 224, 585],
   TYOP [0, 2, 586], TYOP [0, 2, 239], TYOP [0, 588, 239],
   TYOP [0, 238, 589], TYOP [0, 2, 590], TYOP [0, 2, 247],
   TYOP [0, 592, 247], TYOP [0, 246, 593], TYOP [0, 2, 594],
   TYOP [0, 2, 234], TYOP [0, 596, 234], TYOP [0, 233, 597],
   TYOP [0, 2, 598], TYOP [0, 136, 122], TYOP [0, 132, 107],
   TYOP [0, 581, 155], TYOP [0, 155, 602], TYOP [0, 532, 41],
   TYOP [0, 210, 604], TYOP [0, 532, 532], TYOP [0, 210, 606],
   TYOP [0, 42, 164], TYOP [0, 45, 161], TYOP [0, 481, 481],
   TYOP [0, 481, 610], TYOP [0, 214, 214], TYOP [0, 214, 612],
   TYOP [0, 25, 25], TYOP [0, 25, 614], TYOP [0, 483, 483],
   TYOP [0, 483, 616], TYOP [0, 212, 212], TYOP [0, 212, 618],
   TYOP [0, 12, 12], TYOP [0, 12, 620], TYOP [0, 1, 3], TYOP [0, 156, 2],
   TYOP [0, 554, 554], TYOP [0, 29, 111], TYOP [0, 625, 625],
   TYOP [0, 29, 118], TYOP [0, 627, 627], TYOP [0, 19, 111],
   TYOP [0, 629, 629], TYOP [0, 19, 118], TYOP [0, 631, 631],
   TYOP [0, 377, 377], TYOP [0, 2, 142], TYOP [0, 634, 634],
   TYOP [0, 2, 118], TYOP [0, 636, 636], TYOP [14, 109], TYOP [0, 2, 638],
   TYOP [0, 639, 639], TYOP [1, 73], TYOP [0, 29, 641], TYOP [0, 219, 642],
   TYOP [0, 29, 141], TYOP [0, 25, 644], TYOP [0, 19, 641],
   TYOP [0, 215, 646], TYOP [0, 19, 141], TYOP [0, 12, 648],
   TYOP [0, 140, 140], TYOP [0, 612, 650], TYOP [0, 139, 139],
   TYOP [0, 618, 652], TYOP [0, 610, 650], TYOP [0, 616, 652],
   TYOP [0, 138, 138], TYOP [0, 614, 656], TYOP [0, 137, 137],
   TYOP [0, 620, 658], TYOP [0, 226, 540], TYOP [0, 240, 548],
   TYOP [0, 248, 552], TYOP [0, 235, 544], TYOP [6, 73, 73],
   TYOP [0, 664, 99], TYOP [0, 73, 100], TYOP [0, 666, 665],
   TYOP [0, 664, 83], TYOP [0, 73, 84], TYOP [0, 669, 668],
   TYOP [6, 42, 73], TYOP [0, 671, 88], TYOP [0, 42, 89],
   TYOP [0, 673, 672], TYOP [0, 671, 75], TYOP [0, 42, 76],
   TYOP [0, 676, 675], TYOP [6, 45, 73], TYOP [0, 678, 118],
   TYOP [0, 45, 119], TYOP [0, 680, 679], TYOP [0, 678, 104],
   TYOP [0, 45, 105], TYOP [0, 683, 682], TYOP [0, 678, 92],
   TYOP [0, 45, 93], TYOP [0, 686, 685], TYOP [0, 678, 88],
   TYOP [0, 45, 89], TYOP [0, 689, 688], TYOP [0, 678, 75],
   TYOP [0, 45, 76], TYOP [0, 692, 691], TYOP [0, 91, 95],
   TYOP [0, 24, 96], TYOP [0, 695, 694], TYOP [0, 74, 79],
   TYOP [0, 11, 80], TYOP [0, 698, 697], TYOP [0, 286, 118],
   TYOP [0, 108, 119], TYOP [0, 701, 700], TYOP [0, 267, 41],
   TYOP [0, 273, 41], TYOP [0, 276, 41], TYOP [0, 45, 572],
   TYOP [0, 77, 706], TYOP [0, 42, 572], TYOP [0, 77, 708],
   TYOP [0, 641, 73], TYOP [0, 133, 45], TYOP [0, 24, 128],
   TYOP [0, 129, 45], TYOP [0, 11, 127], TYOP [0, 554, 1],
   TYOP [0, 554, 715], TYOP [14, 1], TYOP [0, 717, 716],
   TYOP [0, 119, 118], TYOP [14, 73], TYOP [0, 720, 719],
   TYOP [0, 73, 638], TYOP [0, 722, 638], TYOP [0, 720, 723],
   TYOP [0, 1, 142], TYOP [0, 725, 142], TYOP [0, 717, 726],
   TYOP [0, 29, 95], TYOP [0, 728, 95], TYOP [0, 95, 729],
   TYOP [0, 29, 99], TYOP [0, 731, 99], TYOP [0, 95, 732],
   TYOP [0, 19, 79], TYOP [0, 734, 79], TYOP [0, 79, 735],
   TYOP [0, 19, 83], TYOP [0, 737, 83], TYOP [0, 79, 738],
   TYOP [0, 141, 142], TYOP [0, 740, 142], TYOP [0, 142, 741],
   TYOP [0, 665, 99], TYOP [14, 664], TYOP [0, 744, 743],
   TYOP [0, 668, 83], TYOP [0, 744, 746], TYOP [0, 672, 88],
   TYOP [14, 671], TYOP [0, 749, 748], TYOP [0, 675, 75],
   TYOP [0, 749, 751], TYOP [0, 679, 118], TYOP [14, 678],
   TYOP [0, 754, 753], TYOP [0, 682, 104], TYOP [0, 754, 756],
   TYOP [0, 685, 92], TYOP [0, 754, 758], TYOP [0, 688, 88],
   TYOP [0, 754, 760], TYOP [0, 691, 75], TYOP [0, 754, 762],
   TYOP [0, 694, 95], TYOP [0, 92, 764], TYOP [0, 697, 79],
   TYOP [0, 75, 766], TYOP [0, 700, 118], TYOP [14, 286],
   TYOP [0, 769, 768], TYOP [0, 286, 638], TYOP [0, 771, 638],
   TYOP [0, 769, 772], TYOP [0, 1, 118], TYOP [0, 1, 638],
   TYOP [0, 573, 73], TYOP [0, 2, 210], TYOP [0, 2, 777],
   TYOP [0, 469, 778], TYOP [0, 469, 779], TYOP [0, 13, 717],
   TYOP [0, 2, 781], TYOP [0, 73, 2], TYOP [0, 578, 210],
   TYOP [0, 578, 784], TYOP [0, 778, 785], TYOP [0, 108, 638],
   TYOP [0, 45, 787], TYOP [0, 788, 638], TYOP [0, 638, 789],
   TYOP [0, 108, 790], TYOP [0, 712, 41], TYOP [0, 41, 792],
   TYOP [0, 29, 793], TYOP [0, 29, 142], TYOP [0, 24, 795],
   TYOP [0, 796, 142], TYOP [0, 142, 797], TYOP [0, 29, 798],
   TYOP [0, 24, 627], TYOP [0, 800, 118], TYOP [0, 118, 801],
   TYOP [0, 29, 802], TYOP [0, 714, 41], TYOP [0, 41, 804],
   TYOP [0, 19, 805], TYOP [0, 19, 142], TYOP [0, 11, 807],
   TYOP [0, 808, 142], TYOP [0, 142, 809], TYOP [0, 19, 810],
   TYOP [0, 11, 631], TYOP [0, 812, 118], TYOP [0, 118, 813],
   TYOP [0, 19, 814], TYOP [0, 24, 638], TYOP [0, 816, 625],
   TYOP [0, 11, 638], TYOP [0, 818, 629], TYOP [0, 2, 42], TYOP [0, 2, 45],
   TYOP [0, 164, 164], TYOP [0, 164, 822], TYOP [0, 161, 161],
   TYOP [0, 161, 824], TYOP [0, 282, 282], TYOP [0, 205, 826],
   TYOP [0, 205, 205], TYOP [0, 205, 828], TYOP [0, 283, 283],
   TYOP [0, 189, 830], TYOP [0, 189, 189], TYOP [0, 189, 832],
   TYOP [0, 284, 284], TYOP [0, 180, 834], TYOP [0, 180, 180],
   TYOP [0, 180, 836], TYOP [0, 285, 285], TYOP [0, 160, 838],
   TYOP [0, 160, 160], TYOP [0, 160, 840], TYOP [0, 42, 1],
   TYOP [0, 42, 2], TYOP [0, 843, 842], TYOP [0, 3, 844], TYOP [0, 45, 1],
   TYOP [0, 45, 2], TYOP [0, 847, 846], TYOP [0, 3, 848],
   TYOP [0, 73, 720], TYOP [0, 2, 850], TYOP [0, 2, 851],
   TYOP [0, 701, 118], TYOP [0, 286, 853], TYOP [0, 108, 722],
   TYOP [0, 855, 638], TYOP [0, 286, 856], TYOP [0, 73, 744],
   TYOP [0, 2, 858], TYOP [0, 73, 754], TYOP [0, 77, 860],
   TYOP [0, 73, 749], TYOP [0, 77, 862], TYOP [0, 860, 769],
   TYOP [0, 73, 864], TYOP [0, 2, 865], TYOP [0, 117, 118],
   TYOP [0, 103, 104], TYOP [0, 91, 92], TYOP [0, 87, 88],
   TYOP [0, 74, 75], TYOP [0, 98, 99], TYOP [0, 82, 83],
   TYOP [0, 109, 638], TYOP [0, 141, 1]]
  end
  val _ = Theory.incorporate_consts "elf_section_header_table" tyvector
     [("string_of_special_section_index", 3),
      ("string_of_section_type", 6), ("string_of_section_flags", 10),
      ("string_of_elf64_section_header_table_entry_default", 12),
      ("string_of_elf64_section_header_table_entry'", 17),
      ("string_of_elf64_section_header_table_entry", 18),
      ("string_of_elf64_section_header_table_default", 20),
      ("string_of_elf64_section_header_table'", 22),
      ("string_of_elf64_section_header_table", 23),
      ("string_of_elf32_section_header_table_entry_default", 25),
      ("string_of_elf32_section_header_table_entry'", 27),
      ("string_of_elf32_section_header_table_entry", 28),
      ("string_of_elf32_section_header_table_default", 30),
      ("string_of_elf32_section_header_table'", 32),
      ("string_of_elf32_section_header_table", 33),
      ("sht_symtab_shndx", 2), ("sht_symtab", 2), ("sht_strtab", 2),
      ("sht_shlib", 2), ("sht_rela", 2), ("sht_rel", 2),
      ("sht_progbits", 2), ("sht_preinit_array", 2), ("sht_null", 2),
      ("sht_note", 2), ("sht_nobits", 2), ("sht_louser", 2),
      ("sht_loproc", 2), ("sht_loos", 2), ("sht_init_array", 2),
      ("sht_hiuser", 2), ("sht_hiproc", 2), ("sht_hios", 2),
      ("sht_hash", 2), ("sht_group", 2), ("sht_fini_array", 2),
      ("sht_dynsym", 2), ("sht_dynamic", 2), ("shn_loreserve", 2),
      ("shn_loproc", 2), ("shn_loos", 2), ("shn_hireserve", 2),
      ("shn_hiproc", 2), ("shn_hios", 2), ("shn_common", 2),
      ("shn_abs", 2), ("shf_write", 2), ("shf_tls", 2), ("shf_strings", 2),
      ("shf_os_nonconforming", 2), ("shf_merge", 2), ("shf_mask_proc", 2),
      ("shf_mask_os", 2), ("shf_link_order", 2), ("shf_info_link", 2),
      ("shf_group", 2), ("shf_execinstr", 2), ("shf_compressed", 2),
      ("shf_alloc", 2),
      ("recordtype.elf64_section_header_table_entry", 53),
      ("recordtype.elf64_compression_header", 58),
      ("recordtype.elf32_section_header_table_entry", 68),
      ("recordtype.elf32_compression_header", 72),
      ("read_elf64_section_header_table_entry", 78),
      ("read_elf64_section_header_table'", 81),
      ("read_elf64_section_header_table", 86),
      ("read_elf64_compression_header", 90),
      ("read_elf32_section_header_table_entry", 94),
      ("read_elf32_section_header_table'", 97),
      ("read_elf32_section_header_table", 102),
      ("read_elf32_compression_header", 106),
      ("obtain_elf64_tls_template", 107),
      ("obtain_elf64_section_group_indices", 114),
      ("obtain_elf64_hash_table", 121), ("obtain_elf32_tls_template", 122),
      ("obtain_elf32_section_group_indices", 124),
      ("obtain_elf32_hash_table", 126),
      ("is_valid_elf64_section_header_table", 127),
      ("is_valid_elf32_section_header_table", 128),
      ("is_elf64_tbss_special", 131),
      ("is_elf64_addr_addralign_correct", 132),
      ("is_elf32_tbss_special", 135),
      ("is_elf32_addr_addralign_correct", 136),
      ("instance_Show_Show_Elf_section_header_table_elf64_section_header_table_entry_dict", 137),
      ("instance_Show_Show_Elf_section_header_table_elf32_section_header_table_entry_dict", 138),
      ("instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict", 139),
      ("instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict", 140),
      ("grp_maskproc", 2), ("grp_maskos", 2), ("grp_comdat", 2),
      ("get_elf64_section_to_segment_mapping", 148),
      ("get_elf32_section_to_segment_mapping", 153),
      ("elfcompress_zlib", 2), ("elfcompress_loproc", 2),
      ("elfcompress_loos", 2), ("elfcompress_hiproc", 2),
      ("elfcompress_hios", 2), ("elf_special_sections", 155),
      ("elf64_size_correct", 158),
      ("elf64_section_header_table_entry_size", 159),
      ("elf64_section_header_table_entry_elf64_sh_type_fupd", 162),
      ("elf64_section_header_table_entry_elf64_sh_type", 163),
      ("elf64_section_header_table_entry_elf64_sh_size_fupd", 165),
      ("elf64_section_header_table_entry_elf64_sh_size", 166),
      ("elf64_section_header_table_entry_elf64_sh_offset_fupd", 165),
      ("elf64_section_header_table_entry_elf64_sh_offset", 166),
      ("elf64_section_header_table_entry_elf64_sh_name_fupd", 162),
      ("elf64_section_header_table_entry_elf64_sh_name", 163),
      ("elf64_section_header_table_entry_elf64_sh_link_fupd", 162),
      ("elf64_section_header_table_entry_elf64_sh_link", 163),
      ("elf64_section_header_table_entry_elf64_sh_info_fupd", 162),
      ("elf64_section_header_table_entry_elf64_sh_info", 163),
      ("elf64_section_header_table_entry_elf64_sh_flags_fupd", 165),
      ("elf64_section_header_table_entry_elf64_sh_flags", 166),
      ("elf64_section_header_table_entry_elf64_sh_entsize_fupd", 165),
      ("elf64_section_header_table_entry_elf64_sh_entsize", 166),
      ("elf64_section_header_table_entry_elf64_sh_addralign_fupd", 165),
      ("elf64_section_header_table_entry_elf64_sh_addralign", 166),
      ("elf64_section_header_table_entry_elf64_sh_addr_fupd", 165),
      ("elf64_section_header_table_entry_elf64_sh_addr", 166),
      ("elf64_section_header_table_entry_CASE", 178),
      ("elf64_null_section_header", 11),
      ("elf64_compression_header_size", 179),
      ("elf64_compression_header_elf64_chdr_type_fupd", 181),
      ("elf64_compression_header_elf64_chdr_type", 182),
      ("elf64_compression_header_elf64_chdr_size_fupd", 183),
      ("elf64_compression_header_elf64_chdr_size", 184),
      ("elf64_compression_header_elf64_chdr_reserved_fupd", 181),
      ("elf64_compression_header_elf64_chdr_reserved", 182),
      ("elf64_compression_header_elf64_chdr_addralign_fupd", 183),
      ("elf64_compression_header_elf64_chdr_addralign", 184),
      ("elf64_compression_header_CASE", 186), ("elf32_size_correct", 187),
      ("elf32_section_header_table_entry_size", 188),
      ("elf32_section_header_table_entry_elf32_sh_type_fupd", 190),
      ("elf32_section_header_table_entry_elf32_sh_type", 191),
      ("elf32_section_header_table_entry_elf32_sh_size_fupd", 190),
      ("elf32_section_header_table_entry_elf32_sh_size", 191),
      ("elf32_section_header_table_entry_elf32_sh_offset_fupd", 190),
      ("elf32_section_header_table_entry_elf32_sh_offset", 191),
      ("elf32_section_header_table_entry_elf32_sh_name_fupd", 190),
      ("elf32_section_header_table_entry_elf32_sh_name", 191),
      ("elf32_section_header_table_entry_elf32_sh_link_fupd", 190),
      ("elf32_section_header_table_entry_elf32_sh_link", 191),
      ("elf32_section_header_table_entry_elf32_sh_info_fupd", 190),
      ("elf32_section_header_table_entry_elf32_sh_info", 191),
      ("elf32_section_header_table_entry_elf32_sh_flags_fupd", 190),
      ("elf32_section_header_table_entry_elf32_sh_flags", 191),
      ("elf32_section_header_table_entry_elf32_sh_entsize_fupd", 190),
      ("elf32_section_header_table_entry_elf32_sh_entsize", 191),
      ("elf32_section_header_table_entry_elf32_sh_addralign_fupd", 190),
      ("elf32_section_header_table_entry_elf32_sh_addralign", 191),
      ("elf32_section_header_table_entry_elf32_sh_addr_fupd", 190),
      ("elf32_section_header_table_entry_elf32_sh_addr", 191),
      ("elf32_section_header_table_entry_CASE", 203),
      ("elf32_null_section_header", 24),
      ("elf32_compression_header_size", 204),
      ("elf32_compression_header_elf32_chdr_type_fupd", 206),
      ("elf32_compression_header_elf32_chdr_type", 207),
      ("elf32_compression_header_elf32_chdr_size_fupd", 206),
      ("elf32_compression_header_elf32_chdr_size", 207),
      ("elf32_compression_header_elf32_chdr_addralign_fupd", 206),
      ("elf32_compression_header_elf32_chdr_addralign", 207),
      ("elf32_compression_header_CASE", 209),
      ("compare_elf64_section_header_table_entry", 212),
      ("compare_elf32_section_header_table_entry", 214),
      ("bytes_of_elf64_section_header_table_entry", 216),
      ("bytes_of_elf64_section_header_table", 218),
      ("bytes_of_elf32_section_header_table_entry", 220),
      ("bytes_of_elf32_section_header_table", 222)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'elf32_compression_header'", 226),
   TMV("'elf32_section_header_table_entry'", 235),
   TMV("'elf64_compression_header'", 240),
   TMV("'elf64_section_header_table_entry'", 248), TMV("M", 69),
   TMV("M", 24), TMV("M", 54), TMV("M", 11), TMV("M'", 69), TMV("M'", 24),
   TMV("M'", 54), TMV("M'", 11), TMV("P", 253), TMV("P", 257),
   TMV("P", 258), TMV("P", 136), TMV("P", 259), TMV("P", 132),
   TMV("P", 261), TMV("R", 267), TMV("R", 273), TMV("R", 276),
   TMV("a0", 45), TMV("a0'", 45), TMV("a0'", 225), TMV("a0'", 239),
   TMV("a0'", 247), TMV("a0'", 234), TMV("a1", 45), TMV("a1'", 45),
   TMV("a2", 42), TMV("a2", 45), TMV("a2'", 42), TMV("a2'", 45),
   TMV("a3", 42), TMV("a3", 45), TMV("a3'", 42), TMV("a3'", 45),
   TMV("a4", 42), TMV("a4", 45), TMV("a4'", 42), TMV("a4'", 45),
   TMV("a5", 42), TMV("a5", 45), TMV("a5'", 42), TMV("a5'", 45),
   TMV("a6", 45), TMV("a6'", 45), TMV("a7", 45), TMV("a7'", 45),
   TMV("a8", 42), TMV("a8", 45), TMV("a8'", 42), TMV("a8'", 45),
   TMV("a9", 42), TMV("a9", 45), TMV("a9'", 42), TMV("a9'", 45),
   TMV("addr", 2), TMV("ali", 42), TMV("ali", 45), TMV("align", 2),
   TMV("bs", 73), TMV("bs0", 73), TMV("bs1", 73), TMV("bs2", 73),
   TMV("bs3", 73), TMV("bs4", 73), TMV("buckets", 108), TMV("c", 42),
   TMV("c", 45), TMV("c0", 42), TMV("c0", 45), TMV("c01", 42),
   TMV("c01", 45), TMV("c02", 42), TMV("c02", 45), TMV("c1", 42),
   TMV("c1", 45), TMV("c11", 45), TMV("c12", 45), TMV("c2", 42),
   TMV("c2", 45), TMV("c21", 45), TMV("c22", 45), TMV("c3", 42),
   TMV("c3", 45), TMV("c31", 42), TMV("c31", 45), TMV("c32", 42),
   TMV("c32", 45), TMV("c4", 42), TMV("c4", 45), TMV("c41", 42),
   TMV("c41", 45), TMV("c42", 42), TMV("c42", 45), TMV("c5", 42),
   TMV("c5", 45), TMV("c51", 42), TMV("c51", 45), TMV("c52", 42),
   TMV("c52", 45), TMV("c6", 42), TMV("c6", 45), TMV("c61", 42),
   TMV("c61", 45), TMV("c62", 42), TMV("c62", 45), TMV("c7", 42),
   TMV("c7", 45), TMV("c71", 45), TMV("c72", 45), TMV("c8", 42),
   TMV("c8", 45), TMV("c81", 45), TMV("c82", 45), TMV("chain1", 108),
   TMV("cnt", 2), TMV("e", 69), TMV("e", 24), TMV("e", 54), TMV("e", 11),
   TMV("e1", 69), TMV("e1", 24), TMV("e1", 54), TMV("e1", 11),
   TMV("e2", 69), TMV("e2", 24), TMV("e2", 54), TMV("e2", 11),
   TMV("eat", 73), TMV("ed", 77), TMV("ee", 69), TMV("ee", 24),
   TMV("ee", 54), TMV("ee", 11), TMV("elf32_chdr_addralign", 45),
   TMV("elf32_chdr_size", 45), TMV("elf32_chdr_type", 45),
   TMV("elf32_compression_header", 277),
   TMV("elf32_section_header_table_entry", 277), TMV("elf32_sh_addr", 45),
   TMV("elf32_sh_addralign", 45), TMV("elf32_sh_entsize", 45),
   TMV("elf32_sh_flags", 45), TMV("elf32_sh_info", 45),
   TMV("elf32_sh_link", 45), TMV("elf32_sh_name", 45),
   TMV("elf32_sh_offset", 45), TMV("elf32_sh_size", 45),
   TMV("elf32_sh_type", 45), TMV("elf64_chdr_addralign", 42),
   TMV("elf64_chdr_reserved", 45), TMV("elf64_chdr_size", 42),
   TMV("elf64_chdr_type", 45), TMV("elf64_compression_header", 277),
   TMV("elf64_section_header_table_entry", 277), TMV("elf64_sh_addr", 42),
   TMV("elf64_sh_addralign", 42), TMV("elf64_sh_entsize", 42),
   TMV("elf64_sh_flags", 42), TMV("elf64_sh_info", 45),
   TMV("elf64_sh_link", 45), TMV("elf64_sh_name", 45),
   TMV("elf64_sh_offset", 42), TMV("elf64_sh_size", 42),
   TMV("elf64_sh_type", 45), TMV("endian", 77), TMV("ent", 24),
   TMV("ent", 11), TMV("entries", 29), TMV("entries", 19),
   TMV("entry", 24), TMV("entry", 11), TMV("f", 164), TMV("f", 161),
   TMV("f", 170), TMV("f", 176), TMV("f", 194), TMV("f", 201), TMV("f", 2),
   TMV("f'", 170), TMV("f'", 176), TMV("f'", 194), TMV("f'", 201),
   TMV("f1", 24), TMV("f1", 11), TMV("f2", 24), TMV("f2", 11),
   TMV("filtered", 29), TMV("filtered", 19), TMV("flag", 2),
   TMV("flags", 2), TMV("fn", 278), TMV("fn", 279), TMV("fn", 280),
   TMV("fn", 281), TMV("g", 164), TMV("g", 161), TMV("grp", 24),
   TMV("grp", 11), TMV("h", 282), TMV("h", 283), TMV("h", 284),
   TMV("h", 285), TMV("h1", 24), TMV("h1", 11), TMV("h2", 24),
   TMV("h2", 11), TMV("hdr", 9), TMV("hdr", 24), TMV("hdr", 11),
   TMV("i", 1), TMV("i", 2), TMV("isin", 149), TMV("isin", 144),
   TMV("m", 2), TMV("n", 2), TMV("name", 1), TMV("nbucket", 45),
   TMV("nchain", 45), TMV("nm", 2), TMV("off", 2), TMV("os", 9),
   TMV("os", 3), TMV("p", 286), TMV("pent", 133), TMV("pent", 129),
   TMV("proc", 7), TMV("proc", 3), TMV("record", 291), TMV("record", 298),
   TMV("record", 302), TMV("record", 310), TMV("rel", 73), TMV("rep", 311),
   TMV("rep", 312), TMV("rep", 313), TMV("rep", 314), TMV("res", 45),
   TMV("rest", 73), TMV("sec_hdr", 24), TMV("sec_hdr", 11),
   TMV("sects", 29), TMV("sects", 19), TMV("segment", 133),
   TMV("segment", 129), TMV("sh_addr", 42), TMV("sh_addr", 45),
   TMV("sh_addralign", 42), TMV("sh_addralign", 45), TMV("sh_entsize", 42),
   TMV("sh_entsize", 45), TMV("sh_flags", 42), TMV("sh_flags", 45),
   TMV("sh_info", 45), TMV("sh_link", 45), TMV("sh_name", 45),
   TMV("sh_offset", 42), TMV("sh_offset", 45), TMV("sh_size", 42),
   TMV("sh_size", 45), TMV("sh_type", 45), TMV("sht", 29), TMV("sht", 19),
   TMV("sht_bdl", 16), TMV("siz", 42), TMV("siz", 45), TMV("siz", 2),
   TMV("stbl", 13), TMV("str", 1), TMV("table_size", 2), TMV("tail", 29),
   TMV("tail", 19), TMV("tbl", 156), TMV("tbl", 29), TMV("tbl", 19),
   TMV("tl", 141), TMV("typ", 45), TMV("user", 3), TMV("v", 9),
   TMV("v", 77), TMV("v", 108), TMV("v1", 73), TMV("v1", 1), TMV("v1", 29),
   TMV("v1", 19), TMV("v2", 133), TMV("v2", 129), TMV("v3", 149),
   TMV("v3", 144), TMV("v3", 29), TMV("v3", 19), TMV("v4", 13),
   TMV("v6", 24), TMV("v6", 11), TMV("v7", 29), TMV("v7", 19),
   TMV("x", 45), TMV("x", 24), TMV("x", 11), TMV("xs", 108), TMV("xs", 29),
   TMV("xs", 19), TMC(25, 316), TMC(25, 318), TMC(25, 319), TMC(25, 320),
   TMC(25, 321), TMC(25, 322), TMC(25, 323), TMC(25, 324), TMC(25, 325),
   TMC(25, 326), TMC(25, 327), TMC(25, 329), TMC(25, 331), TMC(25, 333),
   TMC(25, 335), TMC(25, 337), TMC(25, 339), TMC(25, 341), TMC(25, 343),
   TMC(25, 345), TMC(25, 347), TMC(25, 349), TMC(25, 351), TMC(25, 353),
   TMC(25, 355), TMC(25, 357), TMC(25, 358), TMC(25, 359), TMC(25, 360),
   TMC(25, 361), TMC(25, 363), TMC(25, 365), TMC(25, 367), TMC(25, 369),
   TMC(25, 371), TMC(25, 373), TMC(25, 374), TMC(25, 375), TMC(25, 376),
   TMC(25, 378), TMC(25, 380), TMC(25, 366), TMC(25, 368), TMC(25, 370),
   TMC(25, 372), TMC(25, 381), TMC(26, 383), TMC(27, 383), TMC(28, 385),
   TMC(28, 387), TMC(28, 389), TMC(28, 391), TMC(28, 393), TMC(28, 395),
   TMC(28, 397), TMC(28, 399), TMC(28, 401), TMC(28, 403), TMC(28, 405),
   TMC(28, 407), TMC(28, 409), TMC(28, 411), TMC(28, 413), TMC(28, 415),
   TMC(28, 417), TMC(28, 419), TMC(28, 421), TMC(28, 423), TMC(28, 425),
   TMC(28, 427), TMC(28, 429), TMC(28, 431), TMC(28, 433), TMC(28, 435),
   TMC(28, 437), TMC(28, 439), TMC(28, 441), TMC(28, 443), TMC(28, 445),
   TMC(28, 447), TMC(28, 449), TMC(28, 451), TMC(28, 454), TMC(28, 456),
   TMC(28, 458), TMC(28, 460), TMC(28, 462), TMC(28, 464), TMC(28, 466),
   TMC(29, 468), TMC(30, 2), TMC(31, 469), TMC(32, 469), TMC(33, 470),
   TMC(33, 472), TMC(33, 474), TMC(33, 476), TMC(33, 478), TMC(33, 468),
   TMC(33, 479), TMC(33, 288), TMC(33, 300), TMC(33, 480), TMC(33, 481),
   TMC(33, 482), TMC(33, 483), TMC(33, 485), TMC(33, 487), TMC(33, 489),
   TMC(33, 491), TMC(33, 493), TMC(33, 495), TMC(33, 497), TMC(33, 499),
   TMC(33, 501), TMC(33, 503), TMC(33, 505), TMC(33, 507), TMC(33, 508),
   TMC(33, 509), TMC(33, 510), TMC(33, 511), TMC(33, 513), TMC(33, 515),
   TMC(33, 517), TMC(33, 519), TMC(33, 521), TMC(33, 523), TMC(33, 525),
   TMC(33, 527), TMC(33, 529), TMC(33, 530), TMC(33, 531), TMC(33, 469),
   TMC(33, 533), TMC(33, 534), TMC(33, 535), TMC(33, 536), TMC(33, 537),
   TMC(34, 468), TMC(35, 469), TMC(36, 320), TMC(36, 321), TMC(36, 322),
   TMC(36, 324), TMC(36, 325), TMC(36, 327), TMC(36, 539), TMC(36, 541),
   TMC(36, 543), TMC(36, 545), TMC(36, 547), TMC(36, 549), TMC(36, 551),
   TMC(36, 553), TMC(37, 555), TMC(38, 140), TMC(38, 139), TMC(38, 138),
   TMC(38, 137), TMC(38, 69), TMC(38, 24), TMC(38, 54), TMC(38, 11),
   TMC(39, 382), TMC(40, 382), TMC(41, 225), TMC(41, 239), TMC(41, 247),
   TMC(41, 234), TMC(42, 556), TMC(43, 557), TMC(43, 560), TMC(43, 563),
   TMC(43, 566), TMC(43, 567), TMC(44, 568), TMC(44, 569), TMC(44, 570),
   TMC(44, 575), TMC(44, 577), TMC(44, 580), TMC(44, 583), TMC(45, 587),
   TMC(45, 591), TMC(45, 595), TMC(45, 599), TMC(46, 467), TMC(47, 383),
   TMC(48, 532), TMC(49, 210), TMC(50, 41), TMC(51, 155), TMC(52, 600),
   TMC(52, 601), TMC(53, 603), TMC(54, 210), TMC(55, 605), TMC(56, 607),
   TMC(57, 608), TMC(57, 609), TMC(57, 611), TMC(57, 613), TMC(57, 615),
   TMC(57, 617), TMC(57, 619), TMC(57, 621), TMC(57, 622), TMC(58, 623),
   TMC(59, 624), TMC(59, 626), TMC(59, 628), TMC(59, 630), TMC(59, 632),
   TMC(59, 633), TMC(59, 635), TMC(59, 637), TMC(59, 640), TMC(60, 210),
   TMC(61, 643), TMC(61, 645), TMC(61, 647), TMC(61, 649), TMC(62, 383),
   TMC(63, 1), TMC(63, 29), TMC(63, 19), TMC(63, 573), TMC(63, 141),
   TMC(63, 578), TMC(63, 581), TMC(64, 382), TMC(65, 651), TMC(65, 653),
   TMC(66, 654), TMC(66, 655), TMC(67, 654), TMC(67, 655), TMC(68, 654),
   TMC(68, 655), TMC(69, 654), TMC(69, 655), TMC(70, 657), TMC(70, 659),
   TMC(71, 41), TMC(72, 660), TMC(72, 661), TMC(72, 662), TMC(72, 663),
   TMC(73, 667), TMC(73, 670), TMC(73, 674), TMC(73, 677), TMC(73, 681),
   TMC(73, 684), TMC(73, 687), TMC(73, 690), TMC(73, 693), TMC(73, 696),
   TMC(73, 699), TMC(73, 702), TMC(74, 703), TMC(74, 704), TMC(74, 705),
   TMC(75, 2), TMC(76, 468), TMC(77, 707), TMC(78, 707), TMC(79, 222),
   TMC(80, 220), TMC(81, 707), TMC(82, 709), TMC(83, 709), TMC(84, 218),
   TMC(85, 216), TMC(86, 707), TMC(87, 709), TMC(88, 214), TMC(89, 212),
   TMC(90, 710), TMC(91, 209), TMC(92, 207), TMC(93, 206), TMC(94, 207),
   TMC(95, 206), TMC(96, 207), TMC(97, 206), TMC(98, 204), TMC(99, 24),
   TMC(100, 711), TMC(101, 203), TMC(102, 191), TMC(103, 190),
   TMC(104, 191), TMC(105, 190), TMC(106, 191), TMC(107, 190),
   TMC(108, 191), TMC(109, 190), TMC(110, 191), TMC(111, 190),
   TMC(112, 191), TMC(113, 190), TMC(114, 191), TMC(115, 190),
   TMC(116, 191), TMC(117, 190), TMC(118, 191), TMC(119, 190),
   TMC(120, 191), TMC(121, 190), TMC(122, 188), TMC(123, 187),
   TMC(123, 712), TMC(124, 186), TMC(125, 184), TMC(126, 183),
   TMC(127, 182), TMC(128, 181), TMC(129, 184), TMC(130, 183),
   TMC(131, 182), TMC(132, 181), TMC(133, 179), TMC(134, 11),
   TMC(135, 713), TMC(136, 178), TMC(137, 166), TMC(138, 165),
   TMC(139, 166), TMC(140, 165), TMC(141, 166), TMC(142, 165),
   TMC(143, 166), TMC(144, 165), TMC(145, 163), TMC(146, 162),
   TMC(147, 163), TMC(148, 162), TMC(149, 163), TMC(150, 162),
   TMC(151, 166), TMC(152, 165), TMC(153, 166), TMC(154, 165),
   TMC(155, 163), TMC(156, 162), TMC(157, 159), TMC(158, 158),
   TMC(158, 714), TMC(159, 2), TMC(160, 155), TMC(161, 2), TMC(162, 2),
   TMC(163, 2), TMC(164, 2), TMC(165, 2), TMC(166, 718), TMC(167, 721),
   TMC(167, 724), TMC(167, 727), TMC(167, 730), TMC(167, 733),
   TMC(167, 736), TMC(167, 739), TMC(167, 742), TMC(167, 745),
   TMC(167, 747), TMC(167, 750), TMC(167, 752), TMC(167, 755),
   TMC(167, 757), TMC(167, 759), TMC(167, 761), TMC(167, 763),
   TMC(167, 765), TMC(167, 767), TMC(167, 770), TMC(167, 773),
   TMC(168, 774), TMC(168, 775), TMC(169, 776), TMC(170, 780),
   TMC(171, 153), TMC(172, 148), TMC(173, 782), TMC(174, 2), TMC(175, 2),
   TMC(176, 2), TMC(177, 140), TMC(178, 139), TMC(179, 138), TMC(180, 137),
   TMC(181, 136), TMC(182, 135), TMC(183, 132), TMC(184, 131),
   TMC(185, 128), TMC(186, 127), TMC(187, 783), TMC(188, 786),
   TMC(189, 791), TMC(189, 794), TMC(189, 799), TMC(189, 803),
   TMC(189, 806), TMC(189, 811), TMC(189, 815), TMC(190, 817),
   TMC(190, 819), TMC(191, 820), TMC(191, 821), TMC(192, 383), TMC(193, 3),
   TMC(194, 823), TMC(194, 825), TMC(194, 827), TMC(194, 829),
   TMC(194, 831), TMC(194, 833), TMC(194, 835), TMC(194, 837),
   TMC(194, 839), TMC(194, 841), TMC(194, 845), TMC(194, 849),
   TMC(195, 126), TMC(196, 124), TMC(197, 122), TMC(198, 121),
   TMC(199, 114), TMC(200, 107), TMC(201, 852), TMC(202, 854),
   TMC(202, 857), TMC(203, 859), TMC(204, 861), TMC(205, 106),
   TMC(206, 861), TMC(207, 102), TMC(208, 97), TMC(209, 94), TMC(210, 861),
   TMC(211, 863), TMC(212, 90), TMC(213, 863), TMC(214, 86), TMC(215, 81),
   TMC(216, 78), TMC(217, 861), TMC(218, 863), TMC(219, 72), TMC(220, 68),
   TMC(221, 58), TMC(222, 53), TMC(223, 866), TMC(224, 728), TMC(224, 734),
   TMC(224, 740), TMC(224, 867), TMC(224, 868), TMC(224, 869),
   TMC(224, 870), TMC(224, 871), TMC(224, 872), TMC(224, 873),
   TMC(224, 874), TMC(225, 2), TMC(226, 2), TMC(227, 2), TMC(228, 2),
   TMC(229, 2), TMC(230, 2), TMC(231, 2), TMC(232, 2), TMC(233, 2),
   TMC(234, 2), TMC(235, 2), TMC(236, 2), TMC(237, 2), TMC(238, 2),
   TMC(239, 2), TMC(240, 2), TMC(241, 2), TMC(242, 2), TMC(243, 2),
   TMC(244, 2), TMC(245, 2), TMC(246, 2), TMC(247, 2), TMC(248, 2),
   TMC(249, 2), TMC(250, 2), TMC(251, 2), TMC(252, 2), TMC(253, 2),
   TMC(254, 2), TMC(255, 2), TMC(256, 2), TMC(257, 2), TMC(258, 2),
   TMC(259, 2), TMC(260, 2), TMC(261, 2), TMC(262, 2), TMC(263, 2),
   TMC(264, 2), TMC(265, 2), TMC(266, 2), TMC(267, 2), TMC(268, 2),
   TMC(269, 2), TMC(270, 2), TMC(271, 33), TMC(272, 32), TMC(273, 30),
   TMC(274, 28), TMC(275, 27), TMC(276, 25), TMC(277, 23), TMC(278, 22),
   TMC(279, 20), TMC(280, 18), TMC(281, 17), TMC(282, 12), TMC(283, 10),
   TMC(284, 6), TMC(285, 3), TMC(286, 875), TMC(287, 843), TMC(287, 847),
   TMC(288, 608), TMC(288, 609), TMC(289, 467)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op shn_loreserve_def x = x
    val op shn_loreserve_def =
    DT(((("elf_section_header_table",0),[]),[]),
       [read"%438%792@%536%470%469%469%469%469%469%469%469%470%470%470%470%470%470%470%569@@@@@@@@@@@@@@@@@"])
  fun op shn_loproc_def x = x
    val op shn_loproc_def =
    DT(((("elf_section_header_table",1),[]),[]),
       [read"%438%791@%536%470%469%469%469%469%469%469%469%470%470%470%470%470%470%470%569@@@@@@@@@@@@@@@@@"])
  fun op shn_hiproc_def x = x
    val op shn_hiproc_def =
    DT(((("elf_section_header_table",2),[]),[]),
       [read"%438%788@%536%469%469%469%469%469%470%469%469%470%470%470%470%470%470%470%569@@@@@@@@@@@@@@@@@"])
  fun op shn_loos_def x = x
    val op shn_loos_def =
    DT(((("elf_section_header_table",3),[]),[]),
       [read"%438%790@%536%470%469%469%469%469%470%469%469%470%470%470%470%470%470%470%569@@@@@@@@@@@@@@@@@"])
  fun op shn_hios_def x = x
    val op shn_hios_def =
    DT(((("elf_section_header_table",4),[]),[]),
       [read"%438%787@%536%469%469%469%469%469%469%470%469%470%470%470%470%470%470%470%569@@@@@@@@@@@@@@@@@"])
  fun op shn_abs_def x = x
    val op shn_abs_def =
    DT(((("elf_section_header_table",5),[]),[]),
       [read"%438%785@%536%469%470%469%469%470%470%470%470%470%470%470%470%470%470%470%569@@@@@@@@@@@@@@@@@"])
  fun op shn_common_def x = x
    val op shn_common_def =
    DT(((("elf_section_header_table",6),[]),[]),
       [read"%438%786@%536%470%470%469%469%470%470%470%470%470%470%470%470%470%470%470%569@@@@@@@@@@@@@@@@@"])
  fun op shn_hireserve_def x = x
    val op shn_hireserve_def =
    DT(((("elf_section_header_table",7),[]),[]),
       [read"%438%789@%536%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%569@@@@@@@@@@@@@@@@@@"])
  fun op string_of_special_section_index_def x = x
    val op string_of_special_section_index_def =
    DT(((("elf_section_header_table",8),[]),[]),
       [read"%344%214%435%832$0@@%480%438$0@%793@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%470%470%470%469%469%469%569@@@@@@@@@%529@@@@@@@@@@%480%438$0@%792@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%470%470%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%529@@@@@@@@@@@@@@%480%394%445$0@%791@@%397$0@%788@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%469%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%469%469%569@@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@%480%394%445$0@%790@@%397$0@%787@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%469%469%569@@@@@@@@@%529@@@@@@@@@@@@@@@@%480%438$0@%785@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%529@@@@@@@@%480%438$0@%786@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%529@@@@@@@@@@@%480%438$0@%794@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%470%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%470%469%469%470%470%469%569@@@@@@@@@%529@@@@@@@@@@@%480%438$0@%789@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%470%470%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%529@@@@@@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%469%470%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%470%470%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op sht_null_def x = x
    val op sht_null_def =
    DT(((("elf_section_header_table",9),[]),[]), [read"%438%809@%395@"])
  fun op sht_progbits_def x = x
    val op sht_progbits_def =
    DT(((("elf_section_header_table",10),[]),[]),
       [read"%438%811@%536%469%569@@@"])
  fun op sht_symtab_def x = x
    val op sht_symtab_def =
    DT(((("elf_section_header_table",11),[]),[]),
       [read"%438%816@%536%470%569@@@"])
  fun op sht_dynsym_def x = x
    val op sht_dynsym_def =
    DT(((("elf_section_header_table",12),[]),[]),
       [read"%438%796@%536%469%469%470%569@@@@@"])
  fun op sht_strtab_def x = x
    val op sht_strtab_def =
    DT(((("elf_section_header_table",13),[]),[]),
       [read"%438%815@%536%469%469%569@@@@"])
  fun op sht_rela_def x = x
    val op sht_rela_def =
    DT(((("elf_section_header_table",14),[]),[]),
       [read"%438%813@%536%470%469%569@@@@"])
  fun op sht_hash_def x = x
    val op sht_hash_def =
    DT(((("elf_section_header_table",15),[]),[]),
       [read"%438%799@%536%469%470%569@@@@"])
  fun op sht_dynamic_def x = x
    val op sht_dynamic_def =
    DT(((("elf_section_header_table",16),[]),[]),
       [read"%438%795@%536%470%470%569@@@@"])
  fun op sht_note_def x = x
    val op sht_note_def =
    DT(((("elf_section_header_table",17),[]),[]),
       [read"%438%808@%536%469%469%469%569@@@@@"])
  fun op sht_nobits_def x = x
    val op sht_nobits_def =
    DT(((("elf_section_header_table",18),[]),[]),
       [read"%438%807@%536%470%469%469%569@@@@@"])
  fun op sht_rel_def x = x
    val op sht_rel_def =
    DT(((("elf_section_header_table",19),[]),[]),
       [read"%438%812@%536%469%470%469%569@@@@@"])
  fun op sht_shlib_def x = x
    val op sht_shlib_def =
    DT(((("elf_section_header_table",20),[]),[]),
       [read"%438%814@%536%470%470%469%569@@@@@"])
  fun op sht_init_array_def x = x
    val op sht_init_array_def =
    DT(((("elf_section_header_table",21),[]),[]),
       [read"%438%803@%536%470%470%470%569@@@@@"])
  fun op sht_fini_array_def x = x
    val op sht_fini_array_def =
    DT(((("elf_section_header_table",22),[]),[]),
       [read"%438%797@%536%469%469%469%469%569@@@@@@"])
  fun op sht_preinit_array_def x = x
    val op sht_preinit_array_def =
    DT(((("elf_section_header_table",23),[]),[]),
       [read"%438%810@%536%470%469%469%469%569@@@@@@"])
  fun op sht_group_def x = x
    val op sht_group_def =
    DT(((("elf_section_header_table",24),[]),[]),
       [read"%438%798@%536%469%470%469%469%569@@@@@@"])
  fun op sht_symtab_shndx_def x = x
    val op sht_symtab_shndx_def =
    DT(((("elf_section_header_table",25),[]),[]),
       [read"%438%817@%536%470%470%469%469%569@@@@@@"])
  fun op sht_loos_def x = x
    val op sht_loos_def =
    DT(((("elf_section_header_table",26),[]),[]),
       [read"%438%804@%351%351%351%536%469%469%569@@@@%536%470%469%469%469%469%469%469%469%469%469%569@@@@@@@@@@@@@%536%470%469%469%469%469%469%469%469%469%469%569@@@@@@@@@@@@@%536%470%469%469%469%469%469%469%469%469%569@@@@@@@@@@@@"])
  fun op sht_hios_def x = x
    val op sht_hios_def =
    DT(((("elf_section_header_table",27),[]),[]),
       [read"%438%800@%352%351%536%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%470%470%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%536%470%469%569@@@@@%536%469%469%569@@@@@"])
  fun op sht_loproc_def x = x
    val op sht_loproc_def =
    DT(((("elf_section_header_table",28),[]),[]),
       [read"%438%805@%351%536%470%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%470%470%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%536%470%469%569@@@@@"])
  fun op sht_hiproc_def x = x
    val op sht_hiproc_def =
    DT(((("elf_section_header_table",29),[]),[]),
       [read"%438%801@%352%351%536%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%536%470%469%569@@@@@%536%469%469%569@@@@@"])
  fun op sht_louser_def x = x
    val op sht_louser_def =
    DT(((("elf_section_header_table",30),[]),[]),
       [read"%438%806@%351%536%470%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%536%470%469%569@@@@@"])
  fun op sht_hiuser_def x = x
    val op sht_hiuser_def =
    DT(((("elf_section_header_table",31),[]),[]),
       [read"%438%802@%352%351%536%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%470%469%469%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%536%470%469%569@@@@@%536%469%469%569@@@@@"])
  fun op string_of_section_type_def x = x
    val op string_of_section_type_def =
    DT(((("elf_section_header_table",32),[]),[]),
       [read"%336%225%336%230%336%280%344%214%435%831$3@$2@$1@$0@@%480%438$0@%809@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%470%470%469%469%569@@@@@@@@@%481%475%536%470%469%470%470%469%469%569@@@@@@@@@%529@@@@@%480%438$0@%811@@%481%475%536%470%469%469%469%470%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%469%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%529@@@@@@@@@%480%438$0@%816@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%470%470%469%569@@@@@@@@@%481%475%536%469%470%470%470%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%469%469%569@@@@@@@@@%529@@@@@@@%480%438$0@%815@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%469%469%569@@@@@@@@@%529@@@@@@@%480%438$0@%813@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%529@@@@@%480%438$0@%799@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%529@@@@@%480%438$0@%795@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%470%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%469%469%569@@@@@@@@@%529@@@@@@@@%480%438$0@%808@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%529@@@@@%480%438$0@%807@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%470%470%469%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%529@@@@@@@%480%438$0@%812@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%470%469%469%569@@@@@@@@@%529@@@@%480%438$0@%814@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%469%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%469%469%569@@@@@@@@@%529@@@@@@%480%438$0@%796@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%470%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%470%470%469%569@@@@@@@@@%481%475%536%469%470%470%470%469%469%569@@@@@@@@@%529@@@@@@@%480%438$0@%803@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%470%469%569@@@@@@@@@%529@@@@@@@@@@@%480%438$0@%797@@%481%475%536%470%470%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%470%469%569@@@@@@@@@%529@@@@@@@@@@@%480%438$0@%810@@%481%475%536%470%469%469%469%470%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%470%469%569@@@@@@@@@%529@@@@@@@@@@@@@@%480%438$0@%798@@%481%475%536%469%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%470%469%569@@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%469%470%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%469%470%469%569@@@@@@@@@%529@@@@@@%480%438$0@%817@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%470%470%469%569@@@@@@@@@%481%475%536%469%470%470%470%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%470%469%469%469%469%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%470%469%469%470%470%469%569@@@@@@@@@%529@@@@@@@@@@@@@%480%394%445$0@%804@@%397$0@%800@@@$3$0@@%480%394%445$0@%805@@%397$0@%801@@@$2$0@@%480%394%445$0@%806@@%397$0@%802@@@$1$0@@%481%475%536%469%470%470%469%470%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@|@|@"])
  fun op shf_write_def x = x
    val op shf_write_def =
    DT(((("elf_section_header_table",33),[]),[]),
       [read"%438%784@%536%469%569@@@"])
  fun op shf_alloc_def x = x
    val op shf_alloc_def =
    DT(((("elf_section_header_table",34),[]),[]),
       [read"%438%772@%536%470%569@@@"])
  fun op shf_execinstr_def x = x
    val op shf_execinstr_def =
    DT(((("elf_section_header_table",35),[]),[]),
       [read"%438%774@%536%470%469%569@@@@"])
  fun op shf_merge_def x = x
    val op shf_merge_def =
    DT(((("elf_section_header_table",36),[]),[]),
       [read"%438%780@%536%470%469%469%469%569@@@@@@"])
  fun op shf_strings_def x = x
    val op shf_strings_def =
    DT(((("elf_section_header_table",37),[]),[]),
       [read"%438%782@%536%470%469%469%469%469%569@@@@@@@"])
  fun op shf_info_link_def x = x
    val op shf_info_link_def =
    DT(((("elf_section_header_table",38),[]),[]),
       [read"%438%776@%536%470%469%469%469%469%469%569@@@@@@@@"])
  fun op shf_link_order_def x = x
    val op shf_link_order_def =
    DT(((("elf_section_header_table",39),[]),[]),
       [read"%438%777@%536%470%469%469%469%469%469%469%569@@@@@@@@@"])
  fun op shf_os_nonconforming_def x = x
    val op shf_os_nonconforming_def =
    DT(((("elf_section_header_table",40),[]),[]),
       [read"%438%781@%536%470%469%469%469%469%469%469%469%569@@@@@@@@@@"])
  fun op shf_group_def x = x
    val op shf_group_def =
    DT(((("elf_section_header_table",41),[]),[]),
       [read"%438%775@%536%470%469%469%469%469%469%469%469%469%569@@@@@@@@@@@"])
  fun op shf_tls_def x = x
    val op shf_tls_def =
    DT(((("elf_section_header_table",42),[]),[]),
       [read"%438%783@%536%470%469%469%469%469%469%469%469%469%469%569@@@@@@@@@@@@"])
  fun op shf_compressed_def x = x
    val op shf_compressed_def =
    DT(((("elf_section_header_table",43),[]),[]),
       [read"%438%773@%536%470%469%469%469%469%469%469%469%469%469%469%569@@@@@@@@@@@@@"])
  fun op shf_mask_os_def x = x
    val op shf_mask_os_def =
    DT(((("elf_section_header_table",44),[]),[]),
       [read"%438%778@%536%470%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%470%470%470%470%470%470%470%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op shf_mask_proc_def x = x
    val op shf_mask_proc_def =
    DT(((("elf_section_header_table",45),[]),[]),
       [read"%438%779@%351%536%470%469%569@@@@%536%470%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%470%470%470%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op string_of_section_flags_def x = x
    val op string_of_section_flags_def =
    DT(((("elf_section_header_table",46),[]),[]),
       [read"%305%224%306%229%344%181%435%830$2@$1@$0@@%480%438$0@%784@@%481%475%536%469%469%469%470%470%469%569@@@@@@@@@%529@@%480%438$0@%772@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%529@@@@%480%438$0@%774@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%470%470%469%569@@@@@@@@@%529@@@@%480%438$0@%352%772@%774@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%469%469%470%470%469%569@@@@@@@@@%529@@@@%480%438$0@%352%784@%772@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%470%470%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%529@@@@%480%438$0@%780@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%470%469%469%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@%480%438$0@%352%780@%772@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%470%469%469%569@@@@@@@@@%529@@@@%480%438$0@%352%352%780@%772@@%782@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%529@@@@%480%438$0@%352%352%772@%774@@%775@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%469%469%470%470%469%569@@@@@@@@@%481%475%536%469%469%469%470%469%469%569@@@@@@@@@%529@@@@%480%438$0@%782@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%529@@@@%480%438$0@%352%780@%782@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%529@@@@%480%438$0@%783@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%529@@@@%480%438$0@%352%783@%772@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%529@@@@%480%438$0@%352%352%784@%772@@%783@@@%481%475%536%469%469%469%470%470%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%529@@@@%480%438$0@%776@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%529@@@@%480%438$0@%352%772@%776@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%529@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@|@|@|@"])
  fun op elf32_compression_header_TY_DEF x = x
    val op elf32_compression_header_TY_DEF =
    DT(((("elf_section_header_table",47),[("bool",[26])]),["DISK_THM"]),
       [read"%453%236%550%24%337%0%444%346%24%444%447%22%447%28%447%31%440$3@%22%28%31%488%395@%363$2@%360$1@$0@@@%218%471|@|||$2@$1@$0@@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_compression_header_case_def x = x
    val op elf32_compression_header_case_def =
    DT(((("elf_section_header_table",51),
        [("bool",[26,180]),("elf_section_header_table",[48,49,50]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%22%309%28%309%31%329%179%398%585%756$3@$2@$1@@$0@@$0$3@$2@$1@@|@|@|@|@"])
  fun op elf32_compression_header_size_def x = x
    val op elf32_compression_header_size_def =
    DT(((("elf_section_header_table",52),
        [("bool",[26,180]),("elf_section_header_table",[48,49,50]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%22%309%28%309%31%438%592%756$2@$1@$0@@@%536%469%569@@@|@|@|@"])
  fun op elf32_compression_header_elf32_chdr_type x = x
    val op elf32_compression_header_elf32_chdr_type =
    DT(((("elf_section_header_table",53),
        [("bool",[26,180]),("elf_section_header_table",[48,49,50]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%406%590%756$2@$1@$0@@@$2@|@|@|@"])
  fun op elf32_compression_header_elf32_chdr_size x = x
    val op elf32_compression_header_elf32_chdr_size =
    DT(((("elf_section_header_table",54),
        [("bool",[26,180]),("elf_section_header_table",[48,49,50]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%406%588%756$2@$1@$0@@@$1@|@|@|@"])
  fun op elf32_compression_header_elf32_chdr_addralign x = x
    val op elf32_compression_header_elf32_chdr_addralign =
    DT(((("elf_section_header_table",55),
        [("bool",[26,180]),("elf_section_header_table",[48,49,50]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%406%586%756$2@$1@$0@@@$0@|@|@|@"])
  fun op elf32_compression_header_elf32_chdr_type_fupd x = x
    val op elf32_compression_header_elf32_chdr_type_fupd =
    DT(((("elf_section_header_table",57),
        [("bool",[26,180]),("elf_section_header_table",[48,49,50]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%407%591$3@%756$2@$1@$0@@@%756$3$2@@$1@$0@@|@|@|@|@"])
  fun op elf32_compression_header_elf32_chdr_size_fupd x = x
    val op elf32_compression_header_elf32_chdr_size_fupd =
    DT(((("elf_section_header_table",58),
        [("bool",[26,180]),("elf_section_header_table",[48,49,50]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%407%589$3@%756$2@$1@$0@@@%756$2@$3$1@@$0@@|@|@|@|@"])
  fun op elf32_compression_header_elf32_chdr_addralign_fupd x = x
    val op elf32_compression_header_elf32_chdr_addralign_fupd =
    DT(((("elf_section_header_table",59),
        [("bool",[26,180]),("elf_section_header_table",[48,49,50]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%407%587$3@%756$2@$1@$0@@@%756$2@$1@$3$0@@@|@|@|@|@"])
  fun op elf64_compression_header_TY_DEF x = x
    val op elf64_compression_header_TY_DEF =
    DT(((("elf_section_header_table",78),[("bool",[26])]),["DISK_THM"]),
       [read"%457%238%551%25%338%2%444%347%25%444%447%22%447%28%446%30%446%34%441$4@%22%28%30%34%489%395@%364$3@%361$2@%355$1@$0@@@@%218%472|@||||$3@$2@$1@$0@@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_compression_header_case_def x = x
    val op elf64_compression_header_case_def =
    DT(((("elf_section_header_table",82),
        [("bool",[26,180]),("elf_section_header_table",[79,80,81]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%22%309%28%308%30%308%34%327%177%398%619%758$4@$3@$2@$1@@$0@@$0$4@$3@$2@$1@@|@|@|@|@|@"])
  fun op elf64_compression_header_size_def x = x
    val op elf64_compression_header_size_def =
    DT(((("elf_section_header_table",83),
        [("bool",[26,180]),("elf_section_header_table",[79,80,81]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%22%309%28%308%30%308%34%438%628%758$3@$2@$1@$0@@@%536%469%569@@@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_type x = x
    val op elf64_compression_header_elf64_chdr_type =
    DT(((("elf_section_header_table",84),
        [("bool",[26,180]),("elf_section_header_table",[79,80,81]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%406%626%758$3@$2@$1@$0@@@$3@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_reserved x = x
    val op elf64_compression_header_elf64_chdr_reserved =
    DT(((("elf_section_header_table",85),
        [("bool",[26,180]),("elf_section_header_table",[79,80,81]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%406%622%758$3@$2@$1@$0@@@$2@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_size x = x
    val op elf64_compression_header_elf64_chdr_size =
    DT(((("elf_section_header_table",86),
        [("bool",[26,180]),("elf_section_header_table",[79,80,81]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%405%624%758$3@$2@$1@$0@@@$1@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_addralign x = x
    val op elf64_compression_header_elf64_chdr_addralign =
    DT(((("elf_section_header_table",87),
        [("bool",[26,180]),("elf_section_header_table",[79,80,81]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%405%620%758$3@$2@$1@$0@@@$0@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_type_fupd x = x
    val op elf64_compression_header_elf64_chdr_type_fupd =
    DT(((("elf_section_header_table",89),
        [("bool",[26,180]),("elf_section_header_table",[79,80,81]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%308%77%308%81%409%627$4@%758$3@$2@$1@$0@@@%758$4$3@@$2@$1@$0@@|@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_reserved_fupd x = x
    val op elf64_compression_header_elf64_chdr_reserved_fupd =
    DT(((("elf_section_header_table",90),
        [("bool",[26,180]),("elf_section_header_table",[79,80,81]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%308%77%308%81%409%623$4@%758$3@$2@$1@$0@@@%758$3@$4$2@@$1@$0@@|@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_size_fupd x = x
    val op elf64_compression_header_elf64_chdr_size_fupd =
    DT(((("elf_section_header_table",91),
        [("bool",[26,180]),("elf_section_header_table",[79,80,81]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%325%175%309%70%309%72%308%77%308%81%409%625$4@%758$3@$2@$1@$0@@@%758$3@$2@$4$1@@$0@@|@|@|@|@|@"])
  fun op elf64_compression_header_elf64_chdr_addralign_fupd x = x
    val op elf64_compression_header_elf64_chdr_addralign_fupd =
    DT(((("elf_section_header_table",92),
        [("bool",[26,180]),("elf_section_header_table",[79,80,81]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%325%175%309%70%309%72%308%77%308%81%409%621$4@%758$3@$2@$1@$0@@@%758$3@$2@$1@$4$0@@@|@|@|@|@|@"])
  fun op elfcompress_zlib_def x = x
    val op elfcompress_zlib_def =
    DT(((("elf_section_header_table",111),[]),[]),
       [read"%438%661@%536%469%569@@@"])
  fun op elfcompress_loos_def x = x
    val op elfcompress_loos_def =
    DT(((("elf_section_header_table",112),[]),[]),
       [read"%438%659@%351%536%470%469%569@@@@%536%470%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%470%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elfcompress_hios_def x = x
    val op elfcompress_hios_def =
    DT(((("elf_section_header_table",113),[]),[]),
       [read"%438%657@%352%351%536%470%569@@@%536%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%470%470%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%536%469%569@@@@"])
  fun op elfcompress_loproc_def x = x
    val op elfcompress_loproc_def =
    DT(((("elf_section_header_table",114),[]),[]),
       [read"%438%660@%351%536%470%469%569@@@@%536%470%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%470%470%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elfcompress_hiproc_def x = x
    val op elfcompress_hiproc_def =
    DT(((("elf_section_header_table",115),[]),[]),
       [read"%438%658@%352%351%536%470%569@@@%536%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%536%469%569@@@@"])
  fun op read_elf32_compression_header_def x = x
    val op read_elf32_compression_header_def =
    DT(((("elf_section_header_table",116),[]),[]),
       [read"%316%132%307%63%416%742$1@$0@@%676%747$1@$0@@%559%279%64%676%747$3@$0@@%559%268%65%676%747$5@$0@@%559%60%66%765%375%591%505$5@@%589%505$3@@%587%505$1@@%465@@@@$0@@||@@||@@||@@@|@|@"])
  fun op read_elf64_compression_header_def x = x
    val op read_elf64_compression_header_def =
    DT(((("elf_section_header_table",117),[]),[]),
       [read"%316%132%307%63%418%749$1@$0@@%678%754$1@$0@@%561%279%64%678%754$3@$0@@%561%240%65%673%755$5@$0@@%556%267%66%673%755$7@$0@@%556%59%67%767%378%627%505$7@@%623%505$5@@%625%504$3@@%621%504$1@@%467@@@@@$0@@||@@||@@||@@||@@@|@|@"])
  fun op elf32_section_header_table_entry_TY_DEF x = x
    val op elf32_section_header_table_entry_TY_DEF =
    DT(((("elf_section_header_table",118),[("bool",[26])]),["DISK_THM"]),
       [read"%455%237%553%27%340%1%444%349%27%444%447%22%447%28%447%31%447%35%447%39%447%43%447%46%447%48%447%51%447%55%443$10@%22%28%31%35%39%43%46%48%51%55%491%395@%372$9@%371$8@%370$7@%369$6@%368$5@%367$4@%366$3@%363$2@%360$1@$0@@@@@@@@@@%218%474|@||||||||||$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_section_header_table_entry_case_def x = x
    val op elf32_section_header_table_entry_case_def =
    DT(((("elf_section_header_table",122),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%22%309%28%309%31%309%35%309%39%309%43%309%46%309%48%309%51%309%55%330%180%398%595%757$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_size_def x = x
    val op elf32_section_header_table_entry_size_def =
    DT(((("elf_section_header_table",123),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%22%309%28%309%31%309%35%309%39%309%43%309%46%309%48%309%51%309%55%438%616%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%536%469%569@@@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_name x = x
    val op elf32_section_header_table_entry_elf32_sh_name =
    DT(((("elf_section_header_table",124),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%608%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_type x = x
    val op elf32_section_header_table_entry_elf32_sh_type =
    DT(((("elf_section_header_table",125),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%614%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_flags x = x
    val op elf32_section_header_table_entry_elf32_sh_flags =
    DT(((("elf_section_header_table",126),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%602%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_addr x = x
    val op elf32_section_header_table_entry_elf32_sh_addr =
    DT(((("elf_section_header_table",127),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%596%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_offset x = x
    val op elf32_section_header_table_entry_elf32_sh_offset =
    DT(((("elf_section_header_table",128),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%610%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_size x = x
    val op elf32_section_header_table_entry_elf32_sh_size =
    DT(((("elf_section_header_table",129),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%612%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_link x = x
    val op elf32_section_header_table_entry_elf32_sh_link =
    DT(((("elf_section_header_table",130),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%606%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_info x = x
    val op elf32_section_header_table_entry_elf32_sh_info =
    DT(((("elf_section_header_table",131),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%604%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_addralign x = x
    val op elf32_section_header_table_entry_elf32_sh_addralign =
    DT(((("elf_section_header_table",132),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%598%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_entsize x = x
    val op elf32_section_header_table_entry_elf32_sh_entsize =
    DT(((("elf_section_header_table",133),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%600%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_name_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_name_fupd =
    DT(((("elf_section_header_table",135),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%609$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$10$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_type_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_type_fupd =
    DT(((("elf_section_header_table",136),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%615$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$10$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_flags_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_flags_fupd =
    DT(((("elf_section_header_table",137),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%603$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$10$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_addr_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_addr_fupd =
    DT(((("elf_section_header_table",138),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%597$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$10$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_offset_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_offset_fupd =
    DT(((("elf_section_header_table",139),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%611$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$6@$10$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_size_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_size_fupd =
    DT(((("elf_section_header_table",140),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%613$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$6@$5@$10$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_link_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_link_fupd =
    DT(((("elf_section_header_table",141),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%607$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$6@$5@$4@$10$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_info_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_info_fupd =
    DT(((("elf_section_header_table",142),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%605$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$6@$5@$4@$3@$10$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_addralign_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_addralign_fupd =
    DT(((("elf_section_header_table",143),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%599$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$6@$5@$4@$3@$2@$10$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_elf32_sh_entsize_fupd x = x
    val op elf32_section_header_table_entry_elf32_sh_entsize_fupd =
    DT(((("elf_section_header_table",144),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%601$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$10$0@@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_null_section_header_def x = x
    val op elf32_null_section_header_def =
    DT(((("elf_section_header_table",163),[]),[]),
       [read"%408%593@%609%505%716%395@@@%615%505%716%395@@@%603%505%716%395@@@%597%505%716%395@@@%611%505%716%395@@@%613%505%716%395@@@%607%505%716%395@@@%605%505%716%395@@@%599%505%716%395@@@%601%505%716%395@@@%466@@@@@@@@@@@"])
  fun op compare_elf32_section_header_table_entry_def x = x
    val op compare_elf32_section_header_table_entry_def =
    DT(((("elf_section_header_table",164),[]),[]),
       [read"%312%206%312%208%439%582$1@$0@@%705%687%396@%438@@%486%835%608$1@@@%486%835%614$1@@@%486%835%602$1@@@%486%835%596$1@@@%486%835%610$1@@@%486%835%612$1@@@%486%835%606$1@@@%486%835%604$1@@@%486%835%598$1@@@%486%835%600$1@@@%534@@@@@@@@@@@%486%835%608$0@@@%486%835%614$0@@@%486%835%602$0@@@%486%835%596$0@@@%486%835%610$0@@@%486%835%612$0@@@%486%835%606$0@@@%486%835%604$0@@@%486%835%598$0@@@%486%835%600$0@@@%534@@@@@@@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict_def
    =
    DT(((("elf_section_header_table",165),[]),[]),
       [read"%399%694@%537%507%582@@%545%506%186%188%439%582$1@$0@@%523@||@@%543%506%186%188%502%582$1@$0@@%503%523@%503%495@%494@@@||@@%541%506%186%188%439%582$1@$0@@%501@||@@%539%506%186%188%502%582$1@$0@@%503%501@%503%495@%494@@@||@@%461@@@@@@"])
  fun op elf64_section_header_table_entry_TY_DEF x = x
    val op elf64_section_header_table_entry_TY_DEF =
    DT(((("elf_section_header_table",166),[("bool",[26])]),["DISK_THM"]),
       [read"%459%239%552%26%339%3%444%348%26%444%447%22%447%28%446%30%446%34%446%38%446%42%447%46%447%48%446%50%446%54%442$10@%22%28%30%34%38%42%46%48%50%54%490%395@%365$9@%362$8@%356$7@%357$6@%358$5@%359$4@%364$3@%361$2@%355$1@$0@@@@@@@@@@%218%473|@||||||||||$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_section_header_table_entry_case_def x = x
    val op elf64_section_header_table_entry_case_def =
    DT(((("elf_section_header_table",170),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%22%309%28%308%30%308%34%308%38%308%42%309%46%309%48%308%50%308%54%328%178%398%631%759$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_size_def x = x
    val op elf64_section_header_table_entry_size_def =
    DT(((("elf_section_header_table",171),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%22%309%28%308%30%308%34%308%38%308%42%309%46%309%48%308%50%308%54%438%652%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%536%469%569@@@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_name x = x
    val op elf64_section_header_table_entry_elf64_sh_name =
    DT(((("elf_section_header_table",172),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%406%644%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_type x = x
    val op elf64_section_header_table_entry_elf64_sh_type =
    DT(((("elf_section_header_table",173),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%406%650%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_flags x = x
    val op elf64_section_header_table_entry_elf64_sh_flags =
    DT(((("elf_section_header_table",174),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%405%638%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_addr x = x
    val op elf64_section_header_table_entry_elf64_sh_addr =
    DT(((("elf_section_header_table",175),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%405%632%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_offset x = x
    val op elf64_section_header_table_entry_elf64_sh_offset =
    DT(((("elf_section_header_table",176),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%405%646%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_size x = x
    val op elf64_section_header_table_entry_elf64_sh_size =
    DT(((("elf_section_header_table",177),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%405%648%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_link x = x
    val op elf64_section_header_table_entry_elf64_sh_link =
    DT(((("elf_section_header_table",178),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%406%642%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_info x = x
    val op elf64_section_header_table_entry_elf64_sh_info =
    DT(((("elf_section_header_table",179),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%406%640%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_addralign x = x
    val op elf64_section_header_table_entry_elf64_sh_addralign =
    DT(((("elf_section_header_table",180),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%405%634%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_entsize x = x
    val op elf64_section_header_table_entry_elf64_sh_entsize =
    DT(((("elf_section_header_table",181),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%405%636%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_name_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_name_fupd =
    DT(((("elf_section_header_table",183),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%645$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$10$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_type_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_type_fupd =
    DT(((("elf_section_header_table",184),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%651$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$10$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_flags_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_flags_fupd =
    DT(((("elf_section_header_table",185),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%325%175%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%639$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$10$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_addr_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_addr_fupd =
    DT(((("elf_section_header_table",186),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%325%175%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%633$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$10$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_offset_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_offset_fupd =
    DT(((("elf_section_header_table",187),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%325%175%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%647$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$6@$10$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_size_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_size_fupd =
    DT(((("elf_section_header_table",188),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%325%175%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%649$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$6@$5@$10$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_link_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_link_fupd =
    DT(((("elf_section_header_table",189),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%643$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$6@$5@$4@$10$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_info_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_info_fupd =
    DT(((("elf_section_header_table",190),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%326%176%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%641$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$6@$5@$4@$3@$10$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_addralign_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_addralign_fupd =
    DT(((("elf_section_header_table",191),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%325%175%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%635$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$6@$5@$4@$3@$2@$10$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_elf64_sh_entsize_fupd x = x
    val op elf64_section_header_table_entry_elf64_sh_entsize_fupd =
    DT(((("elf_section_header_table",192),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%325%175%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%637$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$10$0@@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_null_section_header_def x = x
    val op elf64_null_section_header_def =
    DT(((("elf_section_header_table",211),[]),[]),
       [read"%410%629@%645%505%716%395@@@%651%505%716%395@@@%639%504%715%395@@@%633%504%715%395@@@%647%504%715%395@@@%649%504%715%395@@@%643%505%716%395@@@%641%505%716%395@@@%635%504%715%395@@@%637%504%715%395@@@%468@@@@@@@@@@@"])
  fun op compare_elf64_section_header_table_entry_def x = x
    val op compare_elf64_section_header_table_entry_def =
    DT(((("elf_section_header_table",212),[]),[]),
       [read"%315%207%315%209%439%583$1@$0@@%705%687%396@%438@@%486%835%644$1@@@%486%835%650$1@@@%486%834%638$1@@@%486%834%632$1@@@%486%834%646$1@@@%486%834%648$1@@@%486%835%642$1@@@%486%835%640$1@@@%486%834%634$1@@@%486%834%636$1@@@%534@@@@@@@@@@@%486%835%644$0@@@%486%835%650$0@@@%486%834%638$0@@@%486%834%632$0@@@%486%834%646$0@@@%486%834%648$0@@@%486%835%642$0@@@%486%835%640$0@@@%486%834%634$0@@@%486%834%636$0@@@%534@@@@@@@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict_def
    =
    DT(((("elf_section_header_table",213),[]),[]),
       [read"%400%695@%538%510%583@@%546%509%187%189%439%583$1@$0@@%523@||@@%544%509%187%189%502%583$1@$0@@%503%523@%503%495@%494@@@||@@%542%509%187%189%439%583$1@$0@@%501@||@@%540%509%187%189%502%583$1@$0@@%503%501@%503%495@%494@@@||@@%462@@@@@@"])
  fun op bytes_of_elf32_section_header_table_entry_def x = x
    val op bytes_of_elf32_section_header_table_entry_def =
    DT(((("elf_section_header_table",214),[]),[]),
       [read"%316%168%312%173%404%574$1@$0@@%686%484%575$1@%608$0@@@%484%575$1@%614$0@@@%484%575$1@%602$0@@@%484%571$1@%596$0@@@%484%572$1@%610$0@@@%484%575$1@%612$0@@@%484%575$1@%606$0@@@%484%575$1@%604$0@@@%484%575$1@%598$0@@@%484%575$1@%600$0@@@%532@@@@@@@@@@@@|@|@"])
  fun op read_elf32_section_header_table_entry_def x = x
    val op read_elf32_section_header_table_entry_def =
    DT(((("elf_section_header_table",215),[]),[]),
       [read"%316%168%307%62%417%746$1@$0@@%677%747$1@$0@@%560%258%62%677%747$3@$0@@%560%263%62%677%747$5@$0@@%560%255%62%677%741$7@$0@@%560%249%62%677%743$9@$0@@%560%260%62%677%747$11@$0@@%560%262%62%677%747$13@$0@@%560%257%62%677%747$15@$0@@%560%256%62%677%747$17@$0@@%560%251%62%677%747$19@$0@@%560%253%62%766%377%609%505$19@@%615%505$17@@%603%505$15@@%597%505$13@@%611%505$11@@%613%505$9@@%607%505$7@@%605%505$5@@%599%505$3@@%601%505$1@@%466@@@@@@@@@@@$0@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@@|@|@"])
  fun op bytes_of_elf64_section_header_table_entry_def x = x
    val op bytes_of_elf64_section_header_table_entry_def =
    DT(((("elf_section_header_table",216),[]),[]),
       [read"%316%168%315%174%404%579$1@$0@@%686%484%580$1@%644$0@@@%484%580$1@%650$0@@@%484%581$1@%638$0@@@%484%576$1@%632$0@@@%484%577$1@%646$0@@@%484%581$1@%648$0@@@%484%580$1@%642$0@@@%484%580$1@%640$0@@@%484%581$1@%634$0@@@%484%581$1@%636$0@@@%532@@@@@@@@@@@@|@|@"])
  fun op read_elf64_section_header_table_entry_def x = x
    val op read_elf64_section_header_table_entry_def =
    DT(((("elf_section_header_table",217),[]),[]),
       [read"%316%168%307%62%419%753$1@$0@@%679%754$1@$0@@%562%258%62%679%754$3@$0@@%562%263%62%674%755$5@$0@@%557%254%62%674%748$7@$0@@%557%248%62%674%750$9@$0@@%557%259%62%674%755$11@$0@@%557%261%62%679%754$13@$0@@%562%257%62%679%754$15@$0@@%562%256%62%674%755$17@$0@@%557%250%62%674%755$19@$0@@%557%252%62%768%380%645%505$19@@%651%505$17@@%639%504$15@@%633%504$13@@%647%504$11@@%649%504$9@@%643%505$7@@%641%505$5@@%635%504$3@@%637%504$1@@%468@@@@@@@@@@@$0@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@@|@|@"])
  fun op bytes_of_elf32_section_header_table_def x = x
    val op bytes_of_elf32_section_header_table_def =
    DT(((("elf_section_header_table",218),[]),[]),
       [read"%316%168%342%276%404%573$1@$0@@%584%524%574$1@@$0@@@|@|@"])
  fun op bytes_of_elf64_section_header_table_def x = x
    val op bytes_of_elf64_section_header_table_def =
    DT(((("elf_section_header_table",219),[]),[]),
       [read"%316%168%343%277%404%578$1@$0@@%584%526%579$1@@$0@@@|@|@"])
  fun op read_elf32_section_header_table_def x = x
    val op read_elf32_section_header_table_def =
    DT(((("elf_section_header_table",228),[]),[]),
       [read"%344%272%316%168%307%63%420%744$2@$1@$0@@%671%740$2@$0@@%554%131%241%667%745$3@$1@@%171%769%388$0@$1@@|@||@@@|@|@|@"])
  fun op read_elf64_section_header_table_def x = x
    val op read_elf64_section_header_table_def =
    DT(((("elf_section_header_table",229),[]),[]),
       [read"%344%272%316%168%307%63%421%751$2@$1@$0@@%672%740$2@$0@@%555%131%241%669%752$3@$1@@%172%770%390$0@$1@@|@||@@@|@|@|@"])
  fun op elf32_size_correct_def x = x
    val op elf32_size_correct_def =
    DT(((("elf_section_header_table",230),[]),[]),
       [read"%312%211%341%275%403%617$1@$0@@%519%217%476%438$0@%395@@%549@%438$0@%513$1@@@|@%835%612$1@@@@|@|@"])
  fun op elf64_size_correct_def x = x
    val op elf64_size_correct_def =
    DT(((("elf_section_header_table",231),[]),[]),
       [read"%315%212%341%275%403%653$1@$0@@%519%217%476%438$0@%395@@%549@%438$0@%513$1@@@|@%834%648$1@@@@|@|@"])
  fun op is_elf32_addr_addralign_correct_def x = x
    val op is_elf32_addr_addralign_correct_def =
    DT(((("elf_section_header_table",232),[]),[]),
       [read"%312%169%403%698$0@@%519%61%519%58%476%438%528$0@$1@@%395@@%570%438$1@%395@@%438$1@%536%469%569@@@@@%496@|@%835%596$1@@@|@%835%598$0@@@@|@"])
  fun op is_elf64_addr_addralign_correct_def x = x
    val op is_elf64_addr_addralign_correct_def =
    DT(((("elf_section_header_table",233),[]),[]),
       [read"%315%170%403%700$0@@%519%61%519%58%476%438%528$0@$1@@%395@@%570%438$1@%395@@%438$1@%536%469%569@@@@@%496@|@%834%632$1@@@|@%834%634$0@@@@|@"])
  fun op is_valid_elf32_section_header_table_def x = x
    val op is_valid_elf32_section_header_table_def =
    DT(((("elf_section_header_table",234),[]),[]),
       [read"%342%276%403%702$0@@%707$0@%549@%300%303%394%438%835%608$1@@@%395@@%394%438%835%614$1@@@%809@@%394%438%835%602$1@@@%395@@%394%438%835%596$1@@@%395@@%394%438%835%610$1@@@%395@@%394%438%835%604$1@@@%395@@%394%438%835%598$1@@@%395@@%394%438%835%600$1@@@%395@@%618$1@$2@@@@@@@@@||@@|@"])
  fun op is_valid_elf64_section_header_table_def x = x
    val op is_valid_elf64_section_header_table_def =
    DT(((("elf_section_header_table",235),[]),[]),
       [read"%343%277%403%703$0@@%710$0@%549@%301%304%394%438%835%644$1@@@%395@@%394%438%835%650$1@@@%809@@%394%438%834%638$1@@@%395@@%394%438%834%632$1@@@%395@@%394%438%834%646$1@@@%395@@%394%438%835%640$1@@@%395@@%394%438%834%634$1@@@%395@@%394%438%834%636$1@@@%395@@%654$1@$2@@@@@@@@@||@@|@"])
  fun op string_of_elf32_section_header_table_entry_def x = x
    val op string_of_elf32_section_header_table_entry_def =
    DT(((("elf_section_header_table",236),[("pair",[16])]),["DISK_THM"]),
       [read"%336%225%336%230%336%280%312%173%435%821%385$3@%384$2@$1@@@$0@@%833%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@%730%718@%835@%608$0@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@%831$3@$2@$1@%835%614$0@@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%470%470%470%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@@%730%718@%835@%602$0@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@@@@%730%718@%835@%596$0@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@%730%718@%835@%612$0@@@@@%533@@@@@@@|@|@|@|@"])
  fun op string_of_elf64_section_header_table_entry_def x = x
    val op string_of_elf64_section_header_table_entry_def =
    DT(((("elf_section_header_table",237),[("pair",[16])]),["DISK_THM"]),
       [read"%336%225%336%230%336%280%315%174%435%827%385$3@%384$2@$1@@@$0@@%833%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@%730%718@%835@%644$0@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@%831$3@$2@$1@%835%650$0@@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%470%470%470%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@@%729%718@%834@%638$0@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@@@@%729%718@%834@%632$0@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@%729%718@%834@%648$0@@@@@%533@@@@@@@|@|@|@|@"])
  fun op string_of_elf32_section_header_table_entry'_def x = x
    val op string_of_elf32_section_header_table_entry'_def =
    DT(((("elf_section_header_table",238),[("pair",[16])]),["DISK_THM"]),
       [read"%336%225%336%230%336%280%350%270%312%173%435%822%385$4@%384$3@$2@@@$1@$0@@%514%219%833%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@$0@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@%831$5@$4@$3@%835%614$1@@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%470%470%470%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@@%730%718@%835@%602$1@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@@@@%730%718@%835@%596$1@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@%730%718@%835@%612$1@@@@@%533@@@@@@|@%662%690%835%608$0@@@$1@@%213$0|@%285%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@@@|@|@|@|@|@"])
  fun op string_of_elf64_section_header_table_entry'_def x = x
    val op string_of_elf64_section_header_table_entry'_def =
    DT(((("elf_section_header_table",239),[("pair",[16])]),["DISK_THM"]),
       [read"%336%225%336%230%336%280%350%270%315%174%435%828%385$4@%384$3@$2@@@$1@$0@@%514%219%833%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%470%470%470%470%469%469%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@$0@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%470%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@%831$5@$4@$3@%835%650$1@@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%470%470%470%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@@%729%718@%834@%638$1@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%469%470%469%469%469%469%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@@@@%729%718@%834@%632$1@@@@@%485%460%481%475%536%469%470%469%569@@@@@@%529@@%460%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%529@@@@@@@%729%718@%834@%648$1@@@@@%533@@@@@@|@%662%690%835%644$0@@@$1@@%213$0|@%285%481%475%536%469%470%469%470%469%469%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@@@|@|@|@|@|@"])
  fun op string_of_elf32_section_header_table_entry_default_def x = x
    val op string_of_elf32_section_header_table_entry_default_def =
    DT(((("elf_section_header_table",240),[]),[]),
       [read"%429%823@%821%385%512%481%475%536%470%470%469%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%384%512%481%475%536%470%470%469%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%512%481%475%536%470%470%469%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun
    op instance_Show_Show_Elf_section_header_table_elf32_section_header_table_entry_dict_def
    x = x
    val
    op instance_Show_Show_Elf_section_header_table_elf32_section_header_table_entry_dict_def
    =
    DT(((("elf_section_header_table",241),[]),[]),
       [read"%401%696@%547%508%823@@%463@@"])
  fun op string_of_elf64_section_header_table_entry_default_def x = x
    val op string_of_elf64_section_header_table_entry_default_def =
    DT(((("elf_section_header_table",242),[]),[]),
       [read"%432%829@%827%385%512%481%475%536%470%470%469%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%384%512%481%475%536%470%470%469%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%512%481%475%536%470%470%469%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun
    op instance_Show_Show_Elf_section_header_table_elf64_section_header_table_entry_dict_def
    x = x
    val
    op instance_Show_Show_Elf_section_header_table_elf64_section_header_table_entry_dict_def
    =
    DT(((("elf_section_header_table",243),[]),[]),
       [read"%402%697@%548%511%829@@%464@@"])
  fun op string_of_elf32_section_header_table_def x = x
    val op string_of_elf32_section_header_table_def =
    DT(((("elf_section_header_table",244),[]),[]),
       [read"%345%266%342%276%435%818$1@$0@@%833%525%821$1@@$0@@@|@|@"])
  fun op string_of_elf32_section_header_table_default_def x = x
    val op string_of_elf32_section_header_table_default_def =
    DT(((("elf_section_header_table",245),[]),[]),
       [read"%433%820@%818%385%512%481%475%536%470%470%469%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%384%512%481%475%536%470%470%469%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%512%481%475%536%470%470%469%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op string_of_elf64_section_header_table_def x = x
    val op string_of_elf64_section_header_table_def =
    DT(((("elf_section_header_table",246),[]),[]),
       [read"%345%266%343%277%435%824$1@$0@@%833%527%827$1@@$0@@@|@|@"])
  fun op string_of_elf64_section_header_table_default_def x = x
    val op string_of_elf64_section_header_table_default_def =
    DT(((("elf_section_header_table",247),[]),[]),
       [read"%434%826@%824%385%512%481%475%536%470%470%469%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%469%569@@@@@@@@@%481%475%536%469%469%470%469%470%469%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%384%512%481%475%536%470%470%469%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%512%481%475%536%470%470%469%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%469%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%469%569@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op string_of_elf32_section_header_table'_def x = x
    val op string_of_elf32_section_header_table'_def =
    DT(((("elf_section_header_table",248),[]),[]),
       [read"%345%266%350%270%342%276%435%819$2@$1@$0@@%833%525%822$2@$1@@$0@@@|@|@|@"])
  fun op string_of_elf64_section_header_table'_def x = x
    val op string_of_elf64_section_header_table'_def =
    DT(((("elf_section_header_table",249),[]),[]),
       [read"%345%266%350%270%343%277%435%825$2@$1@$0@@%833%527%828$2@$1@@$0@@@|@|@|@"])
  fun op is_elf32_tbss_special_def x = x
    val op is_elf32_tbss_special_def =
    DT(((("elf_section_header_table",250),[]),[]),
       [read"%312%242%311%246%403%699$1@$0@@%394%838%406%837%602$1@@%716%783@@@%716%395@@@@%394%438%835%614$1@@@%807@@%838%438%835%594$0@@@%655@@@@@|@|@"])
  fun op is_elf64_tbss_special_def x = x
    val op is_elf64_tbss_special_def =
    DT(((("elf_section_header_table",251),[]),[]),
       [read"%315%243%314%247%403%701$1@$0@@%394%838%405%836%638$1@@%715%783@@@%715%395@@@@%394%438%835%650$1@@@%807@@%838%438%835%630$0@@@%655@@@@@|@|@"])
  fun op grp_comdat_def x = x
    val op grp_comdat_def =
    DT(((("elf_section_header_table",260),[]),[]),
       [read"%438%691@%536%469%569@@@"])
  fun op grp_maskos_def x = x
    val op grp_maskos_def =
    DT(((("elf_section_header_table",261),[]),[]),
       [read"%438%692@%536%470%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%470%470%470%470%470%470%470%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op grp_maskproc_def x = x
    val op grp_maskproc_def =
    DT(((("elf_section_header_table",262),[]),[]),
       [read"%438%693@%351%536%470%469%569@@@@%536%470%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%469%470%470%470%569@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op obtain_elf32_section_group_indices_def x = x
    val op obtain_elf32_section_group_indices_def =
    DT(((("elf_section_header_table",263),[]),[]),
       [read"%316%168%342%264%307%63%414%732$2@$1@$0@@%515%190%713%200%522%223%522%269%522%118%664%737$2@$1@$5@@%235%683%760$1@$0@%747$8@@@%226%739$0@%283%284%706$1@%685%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%569@@@@@@@@%481%475%536%470%470%469%469%470%569@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%569@@@@@@@@%481%475%536%470%470%469%469%470%569@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%469%470%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%299%302%522%192%771%392$0@$1@@|@%835$1@@||@||@|@|@|@%493$0@%536%470%469%569@@@@@|@%835%612$1@@@|@%835%610$0@@@|@$0@|@%498%169%438%835%614$0@@@%798@|@$1@@@|@|@|@"])
  fun op obtain_elf64_section_group_indices_def x = x
    val op obtain_elf64_section_group_indices_def =
    DT(((("elf_section_header_table",264),[]),[]),
       [read"%316%168%343%265%307%63%414%735$2@$1@$0@@%517%191%714%201%522%223%522%269%522%118%664%737$2@$1@$5@@%235%683%760$1@$0@%754$8@@@%226%739$0@%283%284%706$1@%685%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%470%569@@@@@@@@%481%475%536%470%469%470%469%470%569@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%470%569@@@@@@@@%481%475%536%470%469%470%469%470%569@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%469%470%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%299%302%522%192%771%392$0@$1@@|@%835$1@@||@||@|@|@|@%493$0@%536%470%469%569@@@@@|@%834%648$1@@@|@%834%646$0@@@|@$0@|@%499%170%438%835%650$0@@@%798@|@$1@@@|@|@|@"])
  fun op obtain_elf32_tls_template_def x = x
    val op obtain_elf32_tls_template_def =
    DT(((("elf_section_header_table",265),[]),[]),
       [read"%342%264%436%733$0@@%498%169%519%193%838%438%717$0@%783@@%395@@|@%835%602$0@@@|@$0@@|@"])
  fun op obtain_elf64_tls_template_def x = x
    val op obtain_elf64_tls_template_def =
    DT(((("elf_section_header_table",266),[]),[]),
       [read"%343%265%437%736$0@@%499%170%519%193%838%438%717$0@%783@@%395@@|@%834%638$0@@@|@$0@@|@"])
  fun op obtain_elf32_hash_table_def x = x
    val op obtain_elf32_hash_table_def =
    DT(((("elf_section_header_table",267),[]),[]),
       [read"%316%168%342%264%307%63%415%731$2@$1@$0@@%516%190%709$0@%684%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%569@@@@@@@@%481%475%536%470%470%469%469%470%569@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%300%292%709$0@%521%269%521%223%663%737$1@$0@$5@@%235%675%747$8@$0@@%558%220%235%675%747$10@$0@@%558%221%235%682%760%835$3@@$0@%747$12@@@%565%68%235%682%760%835$3@@$0@%747$14@@@%226%738$0@%117%284%764%373$8@%374$6@%386$4@$1@@@@||@|@||@@||@@||@@|@|@%835%610$2@@@|@%835%612$1@@@@%295%297%684%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%569@@@@@@@@%481%475%536%470%470%469%469%470%569@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@||@||@|@%498%169%438%835%614$0@@@%799@|@$1@@@|@|@|@"])
  fun op obtain_elf64_hash_table_def x = x
    val op obtain_elf64_hash_table_def =
    DT(((("elf_section_header_table",268),[]),[]),
       [read"%316%168%343%265%307%63%415%734$2@$1@$0@@%518%191%712$0@%684%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%470%569@@@@@@@@%481%475%536%470%469%470%469%470%569@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%301%293%712$0@%521%269%521%223%663%737$1@$0@$5@@%235%675%754$8@$0@@%558%220%235%675%754$10@$0@@%558%221%235%682%760%835$3@@$0@%754$12@@@%565%68%235%682%760%835$3@@$0@%754$14@@@%226%738$0@%117%284%764%373$8@%374$6@%386$4@$1@@@@||@|@||@@||@@||@@|@|@%834%646$2@@@|@%834%648$1@@@@%296%298%684%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%469%470%569@@@@@@@@%481%475%536%470%469%470%469%470%569@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%470%470%569@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%469%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%529@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@||@||@|@%499%170%438%835%650$0@@@%799@|@$1@@@|@|@|@"])
  fun op elf_special_sections_def x = x
    val op elf_special_sections_def =
    DT(((("elf_section_header_table",269),[]),[]),
       [read"%422%656@%500%497@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%529@@@@@%393%807@%352%772@%784@@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%469%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%529@@@@@@@@@%393%811@%395@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%529@@@@@@%393%811@%352%772@%784@@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%470%569@@@@@@@@%529@@@@@@@%393%811@%352%772@%784@@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%470%469%470%569@@@@@@@@@%529@@@@@@@%393%811@%395@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%529@@@@@@@@%393%815@%772@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%481%475%536%469%470%470%470%469%470%569@@@@@@@@@%529@@@@@@@@%393%796@%772@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%529@@@@@@%393%811@%352%772@%774@@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%529@@@@@@@@@@@@%393%797@%352%772@%784@@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%529@@@@@@%393%799@%772@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%529@@@@@@%393%811@%352%772@%774@@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%529@@@@@@@@@@@@%393%803@%352%772@%784@@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%469%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%529@@@@@@%393%811@%395@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%529@@@@@@%393%808@%395@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%470%470%470%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%470%470%470%569@@@@@@@@@%529@@@@@@@@@@@@@@@%393%810@%352%772@%784@@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%529@@@@@@@@%393%811@%772@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%469%469%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%470%569@@@@@@@@%529@@@@@@@@@%393%811@%772@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%469%470%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%529@@@@@@@@@@%393%815@%395@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%469%470%469%470%470%569@@@@@@@@@%529@@@@@@%393%807@%352%352%772@%784@@%783@@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%529@@@@@@@%393%811@%352%352%772@%784@@%783@@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%469%469%469%470%569@@@@@@@@@%481%475%536%469%470%469%469%470%569@@@@@@@@%529@@@@@@@@%393%811@%352%352%772@%784@@%783@@@@%487%387%481%475%536%470%470%470%470%469%569@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%481%475%536%469%470%470%469%469%470%569@@@@@@@@@%481%475%536%470%469%469%470%470%470%569@@@@@@@@@%481%475%536%470%469%470%469%470%470%569@@@@@@@@@%529@@@@@@%393%811@%352%772@%774@@@@%535@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_compression_header_accessors x = x
    val op elf32_compression_header_accessors =
    DT(((("elf_section_header_table",56),
        [("elf_section_header_table",[53,54,55])]),["DISK_THM"]),
       [read"%394%309%70%309%72%309%78%406%590%756$2@$1@$0@@@$2@|@|@|@@%394%309%70%309%72%309%78%406%588%756$2@$1@$0@@@$1@|@|@|@@%309%70%309%72%309%78%406%586%756$2@$1@$0@@@$0@|@|@|@@@"])
  fun op elf32_compression_header_fn_updates x = x
    val op elf32_compression_header_fn_updates =
    DT(((("elf_section_header_table",60),
        [("elf_section_header_table",[57,58,59])]),["DISK_THM"]),
       [read"%394%326%176%309%70%309%72%309%78%407%591$3@%756$2@$1@$0@@@%756$3$2@@$1@$0@@|@|@|@|@@%394%326%176%309%70%309%72%309%78%407%589$3@%756$2@$1@$0@@@%756$2@$3$1@@$0@@|@|@|@|@@%326%176%309%70%309%72%309%78%407%587$3@%756$2@$1@$0@@@%756$2@$1@$3$0@@@|@|@|@|@@@"])
  fun op elf32_compression_header_accfupds x = x
    val op elf32_compression_header_accfupds =
    DT(((("elf_section_header_table",61),
        [("bool",[25,26,55,180]),
         ("elf_section_header_table",[48,49,50,56,60])]),["DISK_THM"]),
       [read"%394%326%176%310%119%406%590%589$1@$0@@@%590$0@@|@|@@%394%326%176%310%119%406%590%587$1@$0@@@%590$0@@|@|@@%394%326%176%310%119%406%588%591$1@$0@@@%588$0@@|@|@@%394%326%176%310%119%406%588%587$1@$0@@@%588$0@@|@|@@%394%326%176%310%119%406%586%591$1@$0@@@%586$0@@|@|@@%394%326%176%310%119%406%586%589$1@$0@@@%586$0@@|@|@@%394%326%176%310%119%406%590%591$1@$0@@@$1%590$0@@@|@|@@%394%326%176%310%119%406%588%589$1@$0@@@$1%588$0@@@|@|@@%326%176%310%119%406%586%587$1@$0@@@$1%586$0@@@|@|@@@@@@@@@"])
  fun op elf32_compression_header_fupdfupds x = x
    val op elf32_compression_header_fupdfupds =
    DT(((("elf_section_header_table",62),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_section_header_table",[48,49,50,60])]),["DISK_THM"]),
       [read"%394%326%199%326%176%310%119%407%591$1@%591$2@$0@@@%591%720$1@$2@@$0@@|@|@|@@%394%326%199%326%176%310%119%407%589$1@%589$2@$0@@@%589%720$1@$2@@$0@@|@|@|@@%326%199%326%176%310%119%407%587$1@%587$2@$0@@@%587%720$1@$2@@$0@@|@|@|@@@"])
  fun op elf32_compression_header_fupdfupds_comp x = x
    val op elf32_compression_header_fupdfupds_comp =
    DT(((("elf_section_header_table",63),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_section_header_table",[48,49,50,60])]),["DISK_THM"]),
       [read"%394%394%326%199%326%176%427%722%591$0@@%591$1@@@%591%720$0@$1@@@|@|@@%317%202%326%199%326%176%423%721%591$0@@%721%591$1@@$2@@@%721%591%720$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%427%722%589$0@@%589$1@@@%589%720$0@$1@@@|@|@@%317%202%326%199%326%176%423%721%589$0@@%721%589$1@@$2@@@%721%589%720$0@$1@@@$2@@|@|@|@@@%394%326%199%326%176%427%722%587$0@@%587$1@@@%587%720$0@$1@@@|@|@@%317%202%326%199%326%176%423%721%587$0@@%721%587$1@@$2@@@%721%587%720$0@$1@@@$2@@|@|@|@@@@"])
  fun op elf32_compression_header_fupdcanon x = x
    val op elf32_compression_header_fupdcanon =
    DT(((("elf_section_header_table",64),
        [("bool",[25,26,55,180]),
         ("elf_section_header_table",[48,49,50,60])]),["DISK_THM"]),
       [read"%394%326%199%326%176%310%119%407%589$1@%591$2@$0@@@%591$2@%589$1@$0@@@|@|@|@@%394%326%199%326%176%310%119%407%587$1@%591$2@$0@@@%591$2@%587$1@$0@@@|@|@|@@%326%199%326%176%310%119%407%587$1@%589$2@$0@@@%589$2@%587$1@$0@@@|@|@|@@@"])
  fun op elf32_compression_header_fupdcanon_comp x = x
    val op elf32_compression_header_fupdcanon_comp =
    DT(((("elf_section_header_table",65),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_section_header_table",[48,49,50,60])]),["DISK_THM"]),
       [read"%394%394%326%199%326%176%427%722%589$0@@%591$1@@@%722%591$1@@%589$0@@@|@|@@%317%202%326%199%326%176%423%721%589$0@@%721%591$1@@$2@@@%721%591$1@@%721%589$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%427%722%587$0@@%591$1@@@%722%591$1@@%587$0@@@|@|@@%317%202%326%199%326%176%423%721%587$0@@%721%591$1@@$2@@@%721%591$1@@%721%587$0@@$2@@@|@|@|@@@%394%326%199%326%176%427%722%587$0@@%589$1@@@%722%589$1@@%587$0@@@|@|@@%317%202%326%199%326%176%423%721%587$0@@%721%589$1@@$2@@@%721%589$1@@%721%587$0@@$2@@@|@|@|@@@@"])
  fun op elf32_compression_header_component_equality x = x
    val op elf32_compression_header_component_equality =
    DT(((("elf_section_header_table",66),
        [("bool",[25,26,50,55,62,180]),
         ("elf_section_header_table",[48,49,50,56]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%310%123%310%127%403%407$1@$0@@%394%406%590$1@@%590$0@@@%394%406%588$1@@%588$0@@@%406%586$1@@%586$0@@@@@|@|@"])
  fun op elf32_compression_header_updates_eq_literal x = x
    val op elf32_compression_header_updates_eq_literal =
    DT(((("elf_section_header_table",67),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_section_header_table",[48,49,50,60])]),["DISK_THM"]),
       [read"%310%119%309%78%309%72%309%70%407%591%505$2@@%589%505$1@@%587%505$0@@$3@@@@%591%505$2@@%589%505$1@@%587%505$0@@%465@@@@|@|@|@|@"])
  fun op elf32_compression_header_literal_nchotomy x = x
    val op elf32_compression_header_literal_nchotomy =
    DT(((("elf_section_header_table",68),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_section_header_table",[48,49,50,60]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%310%119%447%78%447%72%447%70%407$3@%591%505$2@@%589%505$1@@%587%505$0@@%465@@@@|@|@|@|@"])
  fun op FORALL_elf32_compression_header x = x
    val op FORALL_elf32_compression_header =
    DT(((("elf_section_header_table",69),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_section_header_table",[48,49,50,60]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%331%14%403%310%119$1$0@|@@%309%78%309%72%309%70$3%591%505$2@@%589%505$1@@%587%505$0@@%465@@@@|@|@|@@|@"])
  fun op EXISTS_elf32_compression_header x = x
    val op EXISTS_elf32_compression_header =
    DT(((("elf_section_header_table",70),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_section_header_table",[48,49,50,60]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%331%14%403%448%119$1$0@|@@%447%78%447%72%447%70$3%591%505$2@@%589%505$1@@%587%505$0@@%465@@@@|@|@|@@|@"])
  fun op elf32_compression_header_literal_11 x = x
    val op elf32_compression_header_literal_11 =
    DT(((("elf_section_header_table",71),
        [("combin",[12]),
         ("elf_section_header_table",[61,66])]),["DISK_THM"]),
       [read"%309%79%309%74%309%78%309%80%309%76%309%82%403%407%591%505$5@@%589%505$4@@%587%505$3@@%465@@@@%591%505$2@@%589%505$1@@%587%505$0@@%465@@@@@%394%406$5@$2@@%394%406$4@$1@@%406$3@$0@@@@|@|@|@|@|@|@"])
  fun op datatype_elf32_compression_header x = x
    val op datatype_elf32_compression_header =
    DT(((("elf_section_header_table",72),
        [("bool",[25,170])]),["DISK_THM"]),
       [read"%492%233%140@%139@%138@%137@@"])
  fun op elf32_compression_header_11 x = x
    val op elf32_compression_header_11 =
    DT(((("elf_section_header_table",73),
        [("bool",[26,50,55,62,180]),
         ("elf_section_header_table",[48,49,50]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%309%22%309%28%309%31%309%23%309%29%309%33%403%407%756$5@$4@$3@@%756$2@$1@$0@@@%394%406$5@$2@@%394%406$4@$1@@%406$3@$0@@@@|@|@|@|@|@|@"])
  fun op elf32_compression_header_case_cong x = x
    val op elf32_compression_header_case_cong =
    DT(((("elf_section_header_table",74),
        [("bool",[26,180]),
         ("elf_section_header_table",[48,49,50,51])]),["DISK_THM"]),
       [read"%310%4%310%8%329%179%444%394%407$2@$1@@%309%22%309%28%309%31%444%407$4@%756$2@$1@$0@@@%398$3$2@$1@$0@@%184$2@$1@$0@@@|@|@|@@@%398%585$2@$0@@%585$1@%184@@@|@|@|@"])
  fun op elf32_compression_header_nchotomy x = x
    val op elf32_compression_header_nchotomy =
    DT(((("elf_section_header_table",75),
        [("bool",[26,180]),
         ("elf_section_header_table",[48,49,50])]),["DISK_THM"]),
       [read"%310%133%447%70%447%72%447%78%407$3@%756$2@$1@$0@@|@|@|@|@"])
  fun op elf32_compression_header_Axiom x = x
    val op elf32_compression_header_Axiom =
    DT(((("elf_section_header_table",76),
        [("bool",[26,180]),("elf_section_header_table",[48,49,50]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%329%179%452%194%309%22%309%28%309%31%398$3%756$2@$1@$0@@@$4$2@$1@$0@@|@|@|@|@|@"])
  fun op elf32_compression_header_induction x = x
    val op elf32_compression_header_induction =
    DT(((("elf_section_header_table",77),
        [("bool",[26]),
         ("elf_section_header_table",[48,49,50])]),["DISK_THM"]),
       [read"%331%14%444%309%70%309%72%309%78$3%756$2@$1@$0@@|@|@|@@%310%119$1$0@|@@|@"])
  fun op elf64_compression_header_accessors x = x
    val op elf64_compression_header_accessors =
    DT(((("elf_section_header_table",88),
        [("elf_section_header_table",[84,85,86,87])]),["DISK_THM"]),
       [read"%394%309%70%309%72%308%77%308%81%406%626%758$3@$2@$1@$0@@@$3@|@|@|@|@@%394%309%70%309%72%308%77%308%81%406%622%758$3@$2@$1@$0@@@$2@|@|@|@|@@%394%309%70%309%72%308%77%308%81%405%624%758$3@$2@$1@$0@@@$1@|@|@|@|@@%309%70%309%72%308%77%308%81%405%620%758$3@$2@$1@$0@@@$0@|@|@|@|@@@@"])
  fun op elf64_compression_header_fn_updates x = x
    val op elf64_compression_header_fn_updates =
    DT(((("elf_section_header_table",93),
        [("elf_section_header_table",[89,90,91,92])]),["DISK_THM"]),
       [read"%394%326%176%309%70%309%72%308%77%308%81%409%627$4@%758$3@$2@$1@$0@@@%758$4$3@@$2@$1@$0@@|@|@|@|@|@@%394%326%176%309%70%309%72%308%77%308%81%409%623$4@%758$3@$2@$1@$0@@@%758$3@$4$2@@$1@$0@@|@|@|@|@|@@%394%325%175%309%70%309%72%308%77%308%81%409%625$4@%758$3@$2@$1@$0@@@%758$3@$2@$4$1@@$0@@|@|@|@|@|@@%325%175%309%70%309%72%308%77%308%81%409%621$4@%758$3@$2@$1@$0@@@%758$3@$2@$1@$4$0@@@|@|@|@|@|@@@@"])
  fun op elf64_compression_header_accfupds x = x
    val op elf64_compression_header_accfupds =
    DT(((("elf_section_header_table",94),
        [("bool",[25,26,55,180]),
         ("elf_section_header_table",[79,80,81,88,93])]),["DISK_THM"]),
       [read"%394%326%176%313%121%406%626%623$1@$0@@@%626$0@@|@|@@%394%325%175%313%121%406%626%625$1@$0@@@%626$0@@|@|@@%394%325%175%313%121%406%626%621$1@$0@@@%626$0@@|@|@@%394%326%176%313%121%406%622%627$1@$0@@@%622$0@@|@|@@%394%325%175%313%121%406%622%625$1@$0@@@%622$0@@|@|@@%394%325%175%313%121%406%622%621$1@$0@@@%622$0@@|@|@@%394%326%176%313%121%405%624%627$1@$0@@@%624$0@@|@|@@%394%326%176%313%121%405%624%623$1@$0@@@%624$0@@|@|@@%394%325%175%313%121%405%624%621$1@$0@@@%624$0@@|@|@@%394%326%176%313%121%405%620%627$1@$0@@@%620$0@@|@|@@%394%326%176%313%121%405%620%623$1@$0@@@%620$0@@|@|@@%394%325%175%313%121%405%620%625$1@$0@@@%620$0@@|@|@@%394%326%176%313%121%406%626%627$1@$0@@@$1%626$0@@@|@|@@%394%326%176%313%121%406%622%623$1@$0@@@$1%622$0@@@|@|@@%394%325%175%313%121%405%624%625$1@$0@@@$1%624$0@@@|@|@@%325%175%313%121%405%620%621$1@$0@@@$1%620$0@@@|@|@@@@@@@@@@@@@@@@"])
  fun op elf64_compression_header_fupdfupds x = x
    val op elf64_compression_header_fupdfupds =
    DT(((("elf_section_header_table",95),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_section_header_table",[79,80,81,93])]),["DISK_THM"]),
       [read"%394%326%199%326%176%313%121%409%627$1@%627$2@$0@@@%627%720$1@$2@@$0@@|@|@|@@%394%326%199%326%176%313%121%409%623$1@%623$2@$0@@@%623%720$1@$2@@$0@@|@|@|@@%394%325%198%325%175%313%121%409%625$1@%625$2@$0@@@%625%719$1@$2@@$0@@|@|@|@@%325%198%325%175%313%121%409%621$1@%621$2@$0@@@%621%719$1@$2@@$0@@|@|@|@@@@"])
  fun op elf64_compression_header_fupdfupds_comp x = x
    val op elf64_compression_header_fupdfupds_comp =
    DT(((("elf_section_header_table",96),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_section_header_table",[79,80,81,93])]),["DISK_THM"]),
       [read"%394%394%326%199%326%176%430%726%627$0@@%627$1@@@%627%720$0@$1@@@|@|@@%319%204%326%199%326%176%425%725%627$0@@%725%627$1@@$2@@@%725%627%720$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%430%726%623$0@@%623$1@@@%623%720$0@$1@@@|@|@@%319%204%326%199%326%176%425%725%623$0@@%725%623$1@@$2@@@%725%623%720$0@$1@@@$2@@|@|@|@@@%394%394%325%198%325%175%430%726%625$0@@%625$1@@@%625%719$0@$1@@@|@|@@%319%204%325%198%325%175%425%725%625$0@@%725%625$1@@$2@@@%725%625%719$0@$1@@@$2@@|@|@|@@@%394%325%198%325%175%430%726%621$0@@%621$1@@@%621%719$0@$1@@@|@|@@%319%204%325%198%325%175%425%725%621$0@@%725%621$1@@$2@@@%725%621%719$0@$1@@@$2@@|@|@|@@@@@"])
  fun op elf64_compression_header_fupdcanon x = x
    val op elf64_compression_header_fupdcanon =
    DT(((("elf_section_header_table",97),
        [("bool",[25,26,55,180]),
         ("elf_section_header_table",[79,80,81,93])]),["DISK_THM"]),
       [read"%394%326%199%326%176%313%121%409%623$1@%627$2@$0@@@%627$2@%623$1@$0@@@|@|@|@@%394%326%199%325%175%313%121%409%625$1@%627$2@$0@@@%627$2@%625$1@$0@@@|@|@|@@%394%326%199%325%175%313%121%409%625$1@%623$2@$0@@@%623$2@%625$1@$0@@@|@|@|@@%394%326%199%325%175%313%121%409%621$1@%627$2@$0@@@%627$2@%621$1@$0@@@|@|@|@@%394%326%199%325%175%313%121%409%621$1@%623$2@$0@@@%623$2@%621$1@$0@@@|@|@|@@%325%198%325%175%313%121%409%621$1@%625$2@$0@@@%625$2@%621$1@$0@@@|@|@|@@@@@@"])
  fun op elf64_compression_header_fupdcanon_comp x = x
    val op elf64_compression_header_fupdcanon_comp =
    DT(((("elf_section_header_table",98),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_section_header_table",[79,80,81,93])]),["DISK_THM"]),
       [read"%394%394%326%199%326%176%430%726%623$0@@%627$1@@@%726%627$1@@%623$0@@@|@|@@%319%204%326%199%326%176%425%725%623$0@@%725%627$1@@$2@@@%725%627$1@@%725%623$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%430%726%625$0@@%627$1@@@%726%627$1@@%625$0@@@|@|@@%319%204%326%199%325%175%425%725%625$0@@%725%627$1@@$2@@@%725%627$1@@%725%625$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%430%726%625$0@@%623$1@@@%726%623$1@@%625$0@@@|@|@@%319%204%326%199%325%175%425%725%625$0@@%725%623$1@@$2@@@%725%623$1@@%725%625$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%430%726%621$0@@%627$1@@@%726%627$1@@%621$0@@@|@|@@%319%204%326%199%325%175%425%725%621$0@@%725%627$1@@$2@@@%725%627$1@@%725%621$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%430%726%621$0@@%623$1@@@%726%623$1@@%621$0@@@|@|@@%319%204%326%199%325%175%425%725%621$0@@%725%623$1@@$2@@@%725%623$1@@%725%621$0@@$2@@@|@|@|@@@%394%325%198%325%175%430%726%621$0@@%625$1@@@%726%625$1@@%621$0@@@|@|@@%319%204%325%198%325%175%425%725%621$0@@%725%625$1@@$2@@@%725%625$1@@%725%621$0@@$2@@@|@|@|@@@@@@@"])
  fun op elf64_compression_header_component_equality x = x
    val op elf64_compression_header_component_equality =
    DT(((("elf_section_header_table",99),
        [("bool",[25,26,50,55,62,180]),
         ("elf_section_header_table",[79,80,81,88]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%313%125%313%129%403%409$1@$0@@%394%406%626$1@@%626$0@@@%394%406%622$1@@%622$0@@@%394%405%624$1@@%624$0@@@%405%620$1@@%620$0@@@@@@|@|@"])
  fun op elf64_compression_header_updates_eq_literal x = x
    val op elf64_compression_header_updates_eq_literal =
    DT(((("elf_section_header_table",100),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_section_header_table",[79,80,81,93])]),["DISK_THM"]),
       [read"%313%121%309%82%309%78%308%71%308%69%409%627%505$3@@%623%505$2@@%625%504$1@@%621%504$0@@$4@@@@@%627%505$3@@%623%505$2@@%625%504$1@@%621%504$0@@%467@@@@@|@|@|@|@|@"])
  fun op elf64_compression_header_literal_nchotomy x = x
    val op elf64_compression_header_literal_nchotomy =
    DT(((("elf_section_header_table",101),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_section_header_table",[79,80,81,93]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%313%121%447%82%447%78%446%71%446%69%409$4@%627%505$3@@%623%505$2@@%625%504$1@@%621%504$0@@%467@@@@@|@|@|@|@|@"])
  fun op FORALL_elf64_compression_header x = x
    val op FORALL_elf64_compression_header =
    DT(((("elf_section_header_table",102),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_section_header_table",[79,80,81,93]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%333%16%403%313%121$1$0@|@@%309%82%309%78%308%71%308%69$4%627%505$3@@%623%505$2@@%625%504$1@@%621%504$0@@%467@@@@@|@|@|@|@@|@"])
  fun op EXISTS_elf64_compression_header x = x
    val op EXISTS_elf64_compression_header =
    DT(((("elf_section_header_table",103),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_section_header_table",[79,80,81,93]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%333%16%403%450%121$1$0@|@@%447%82%447%78%446%71%446%69$4%627%505$3@@%623%505$2@@%625%504$1@@%621%504$0@@%467@@@@@|@|@|@|@@|@"])
  fun op elf64_compression_header_literal_11 x = x
    val op elf64_compression_header_literal_11 =
    DT(((("elf_section_header_table",104),
        [("combin",[12]),
         ("elf_section_header_table",[94,99])]),["DISK_THM"]),
       [read"%309%83%309%79%308%73%308%77%309%84%309%80%308%75%308%81%403%409%627%505$7@@%623%505$6@@%625%504$5@@%621%504$4@@%467@@@@@%627%505$3@@%623%505$2@@%625%504$1@@%621%504$0@@%467@@@@@@%394%406$7@$3@@%394%406$6@$2@@%394%405$5@$1@@%405$4@$0@@@@@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf64_compression_header x = x
    val op datatype_elf64_compression_header =
    DT(((("elf_section_header_table",105),
        [("bool",[25,170])]),["DISK_THM"]),
       [read"%492%231%156@%155@%153@%154@%152@@"])
  fun op elf64_compression_header_11 x = x
    val op elf64_compression_header_11 =
    DT(((("elf_section_header_table",106),
        [("bool",[26,50,55,62,180]),
         ("elf_section_header_table",[79,80,81]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%309%22%309%28%308%30%308%34%309%23%309%29%308%32%308%36%403%409%758$7@$6@$5@$4@@%758$3@$2@$1@$0@@@%394%406$7@$3@@%394%406$6@$2@@%394%405$5@$1@@%405$4@$0@@@@@|@|@|@|@|@|@|@|@"])
  fun op elf64_compression_header_case_cong x = x
    val op elf64_compression_header_case_cong =
    DT(((("elf_section_header_table",107),
        [("bool",[26,180]),
         ("elf_section_header_table",[79,80,81,82])]),["DISK_THM"]),
       [read"%313%6%313%10%327%177%444%394%409$2@$1@@%309%22%309%28%308%30%308%34%444%409$5@%758$3@$2@$1@$0@@@%398$4$3@$2@$1@$0@@%182$3@$2@$1@$0@@@|@|@|@|@@@%398%619$2@$0@@%619$1@%182@@@|@|@|@"])
  fun op elf64_compression_header_nchotomy x = x
    val op elf64_compression_header_nchotomy =
    DT(((("elf_section_header_table",108),
        [("bool",[26,180]),
         ("elf_section_header_table",[79,80,81])]),["DISK_THM"]),
       [read"%313%135%447%70%447%72%446%77%446%81%409$4@%758$3@$2@$1@$0@@|@|@|@|@|@"])
  fun op elf64_compression_header_Axiom x = x
    val op elf64_compression_header_Axiom =
    DT(((("elf_section_header_table",109),
        [("bool",[26,180]),("elf_section_header_table",[79,80,81]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%327%177%456%196%309%22%309%28%308%30%308%34%398$4%758$3@$2@$1@$0@@@$5$3@$2@$1@$0@@|@|@|@|@|@|@"])
  fun op elf64_compression_header_induction x = x
    val op elf64_compression_header_induction =
    DT(((("elf_section_header_table",110),
        [("bool",[26]),
         ("elf_section_header_table",[79,80,81])]),["DISK_THM"]),
       [read"%333%16%444%309%70%309%72%308%77%308%81$4%758$3@$2@$1@$0@@|@|@|@|@@%313%121$1$0@|@@|@"])
  fun op elf32_section_header_table_entry_accessors x = x
    val op elf32_section_header_table_entry_accessors =
    DT(((("elf_section_header_table",134),
        [("elf_section_header_table",
         [124,125,126,127,128,129,130,131,132,133])]),["DISK_THM"]),
       [read"%394%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%608%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%614%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%602%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%596%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%610%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%612%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%606%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%604%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%598%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@@%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%406%600%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_fn_updates x = x
    val op elf32_section_header_table_entry_fn_updates =
    DT(((("elf_section_header_table",145),
        [("elf_section_header_table",
         [135,136,137,138,139,140,141,142,143,144])]),["DISK_THM"]),
       [read"%394%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%609$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$10$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%615$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$10$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%603$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$10$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%597$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$10$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%611$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$6@$10$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%613$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$6@$5@$10$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%607$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$6@$5@$4@$10$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%605$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$6@$5@$4@$3@$10$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%599$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$6@$5@$4@$3@$2@$10$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@@%326%176%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114%408%601$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$10$0@@@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_accfupds x = x
    val op elf32_section_header_table_entry_accfupds =
    DT(((("elf_section_header_table",146),
        [("bool",[25,26,55,180]),
         ("elf_section_header_table",
         [119,120,121,134,145])]),["DISK_THM"]),
       [read"%394%326%176%312%120%406%608%615$1@$0@@@%608$0@@|@|@@%394%326%176%312%120%406%608%603$1@$0@@@%608$0@@|@|@@%394%326%176%312%120%406%608%597$1@$0@@@%608$0@@|@|@@%394%326%176%312%120%406%608%611$1@$0@@@%608$0@@|@|@@%394%326%176%312%120%406%608%613$1@$0@@@%608$0@@|@|@@%394%326%176%312%120%406%608%607$1@$0@@@%608$0@@|@|@@%394%326%176%312%120%406%608%605$1@$0@@@%608$0@@|@|@@%394%326%176%312%120%406%608%599$1@$0@@@%608$0@@|@|@@%394%326%176%312%120%406%608%601$1@$0@@@%608$0@@|@|@@%394%326%176%312%120%406%614%609$1@$0@@@%614$0@@|@|@@%394%326%176%312%120%406%614%603$1@$0@@@%614$0@@|@|@@%394%326%176%312%120%406%614%597$1@$0@@@%614$0@@|@|@@%394%326%176%312%120%406%614%611$1@$0@@@%614$0@@|@|@@%394%326%176%312%120%406%614%613$1@$0@@@%614$0@@|@|@@%394%326%176%312%120%406%614%607$1@$0@@@%614$0@@|@|@@%394%326%176%312%120%406%614%605$1@$0@@@%614$0@@|@|@@%394%326%176%312%120%406%614%599$1@$0@@@%614$0@@|@|@@%394%326%176%312%120%406%614%601$1@$0@@@%614$0@@|@|@@%394%326%176%312%120%406%602%609$1@$0@@@%602$0@@|@|@@%394%326%176%312%120%406%602%615$1@$0@@@%602$0@@|@|@@%394%326%176%312%120%406%602%597$1@$0@@@%602$0@@|@|@@%394%326%176%312%120%406%602%611$1@$0@@@%602$0@@|@|@@%394%326%176%312%120%406%602%613$1@$0@@@%602$0@@|@|@@%394%326%176%312%120%406%602%607$1@$0@@@%602$0@@|@|@@%394%326%176%312%120%406%602%605$1@$0@@@%602$0@@|@|@@%394%326%176%312%120%406%602%599$1@$0@@@%602$0@@|@|@@%394%326%176%312%120%406%602%601$1@$0@@@%602$0@@|@|@@%394%326%176%312%120%406%596%609$1@$0@@@%596$0@@|@|@@%394%326%176%312%120%406%596%615$1@$0@@@%596$0@@|@|@@%394%326%176%312%120%406%596%603$1@$0@@@%596$0@@|@|@@%394%326%176%312%120%406%596%611$1@$0@@@%596$0@@|@|@@%394%326%176%312%120%406%596%613$1@$0@@@%596$0@@|@|@@%394%326%176%312%120%406%596%607$1@$0@@@%596$0@@|@|@@%394%326%176%312%120%406%596%605$1@$0@@@%596$0@@|@|@@%394%326%176%312%120%406%596%599$1@$0@@@%596$0@@|@|@@%394%326%176%312%120%406%596%601$1@$0@@@%596$0@@|@|@@%394%326%176%312%120%406%610%609$1@$0@@@%610$0@@|@|@@%394%326%176%312%120%406%610%615$1@$0@@@%610$0@@|@|@@%394%326%176%312%120%406%610%603$1@$0@@@%610$0@@|@|@@%394%326%176%312%120%406%610%597$1@$0@@@%610$0@@|@|@@%394%326%176%312%120%406%610%613$1@$0@@@%610$0@@|@|@@%394%326%176%312%120%406%610%607$1@$0@@@%610$0@@|@|@@%394%326%176%312%120%406%610%605$1@$0@@@%610$0@@|@|@@%394%326%176%312%120%406%610%599$1@$0@@@%610$0@@|@|@@%394%326%176%312%120%406%610%601$1@$0@@@%610$0@@|@|@@%394%326%176%312%120%406%612%609$1@$0@@@%612$0@@|@|@@%394%326%176%312%120%406%612%615$1@$0@@@%612$0@@|@|@@%394%326%176%312%120%406%612%603$1@$0@@@%612$0@@|@|@@%394%326%176%312%120%406%612%597$1@$0@@@%612$0@@|@|@@%394%326%176%312%120%406%612%611$1@$0@@@%612$0@@|@|@@%394%326%176%312%120%406%612%607$1@$0@@@%612$0@@|@|@@%394%326%176%312%120%406%612%605$1@$0@@@%612$0@@|@|@@%394%326%176%312%120%406%612%599$1@$0@@@%612$0@@|@|@@%394%326%176%312%120%406%612%601$1@$0@@@%612$0@@|@|@@%394%326%176%312%120%406%606%609$1@$0@@@%606$0@@|@|@@%394%326%176%312%120%406%606%615$1@$0@@@%606$0@@|@|@@%394%326%176%312%120%406%606%603$1@$0@@@%606$0@@|@|@@%394%326%176%312%120%406%606%597$1@$0@@@%606$0@@|@|@@%394%326%176%312%120%406%606%611$1@$0@@@%606$0@@|@|@@%394%326%176%312%120%406%606%613$1@$0@@@%606$0@@|@|@@%394%326%176%312%120%406%606%605$1@$0@@@%606$0@@|@|@@%394%326%176%312%120%406%606%599$1@$0@@@%606$0@@|@|@@%394%326%176%312%120%406%606%601$1@$0@@@%606$0@@|@|@@%394%326%176%312%120%406%604%609$1@$0@@@%604$0@@|@|@@%394%326%176%312%120%406%604%615$1@$0@@@%604$0@@|@|@@%394%326%176%312%120%406%604%603$1@$0@@@%604$0@@|@|@@%394%326%176%312%120%406%604%597$1@$0@@@%604$0@@|@|@@%394%326%176%312%120%406%604%611$1@$0@@@%604$0@@|@|@@%394%326%176%312%120%406%604%613$1@$0@@@%604$0@@|@|@@%394%326%176%312%120%406%604%607$1@$0@@@%604$0@@|@|@@%394%326%176%312%120%406%604%599$1@$0@@@%604$0@@|@|@@%394%326%176%312%120%406%604%601$1@$0@@@%604$0@@|@|@@%394%326%176%312%120%406%598%609$1@$0@@@%598$0@@|@|@@%394%326%176%312%120%406%598%615$1@$0@@@%598$0@@|@|@@%394%326%176%312%120%406%598%603$1@$0@@@%598$0@@|@|@@%394%326%176%312%120%406%598%597$1@$0@@@%598$0@@|@|@@%394%326%176%312%120%406%598%611$1@$0@@@%598$0@@|@|@@%394%326%176%312%120%406%598%613$1@$0@@@%598$0@@|@|@@%394%326%176%312%120%406%598%607$1@$0@@@%598$0@@|@|@@%394%326%176%312%120%406%598%605$1@$0@@@%598$0@@|@|@@%394%326%176%312%120%406%598%601$1@$0@@@%598$0@@|@|@@%394%326%176%312%120%406%600%609$1@$0@@@%600$0@@|@|@@%394%326%176%312%120%406%600%615$1@$0@@@%600$0@@|@|@@%394%326%176%312%120%406%600%603$1@$0@@@%600$0@@|@|@@%394%326%176%312%120%406%600%597$1@$0@@@%600$0@@|@|@@%394%326%176%312%120%406%600%611$1@$0@@@%600$0@@|@|@@%394%326%176%312%120%406%600%613$1@$0@@@%600$0@@|@|@@%394%326%176%312%120%406%600%607$1@$0@@@%600$0@@|@|@@%394%326%176%312%120%406%600%605$1@$0@@@%600$0@@|@|@@%394%326%176%312%120%406%600%599$1@$0@@@%600$0@@|@|@@%394%326%176%312%120%406%608%609$1@$0@@@$1%608$0@@@|@|@@%394%326%176%312%120%406%614%615$1@$0@@@$1%614$0@@@|@|@@%394%326%176%312%120%406%602%603$1@$0@@@$1%602$0@@@|@|@@%394%326%176%312%120%406%596%597$1@$0@@@$1%596$0@@@|@|@@%394%326%176%312%120%406%610%611$1@$0@@@$1%610$0@@@|@|@@%394%326%176%312%120%406%612%613$1@$0@@@$1%612$0@@@|@|@@%394%326%176%312%120%406%606%607$1@$0@@@$1%606$0@@@|@|@@%394%326%176%312%120%406%604%605$1@$0@@@$1%604$0@@@|@|@@%394%326%176%312%120%406%598%599$1@$0@@@$1%598$0@@@|@|@@%326%176%312%120%406%600%601$1@$0@@@$1%600$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_fupdfupds x = x
    val op elf32_section_header_table_entry_fupdfupds =
    DT(((("elf_section_header_table",147),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_section_header_table",[119,120,121,145])]),["DISK_THM"]),
       [read"%394%326%199%326%176%312%120%408%609$1@%609$2@$0@@@%609%720$1@$2@@$0@@|@|@|@@%394%326%199%326%176%312%120%408%615$1@%615$2@$0@@@%615%720$1@$2@@$0@@|@|@|@@%394%326%199%326%176%312%120%408%603$1@%603$2@$0@@@%603%720$1@$2@@$0@@|@|@|@@%394%326%199%326%176%312%120%408%597$1@%597$2@$0@@@%597%720$1@$2@@$0@@|@|@|@@%394%326%199%326%176%312%120%408%611$1@%611$2@$0@@@%611%720$1@$2@@$0@@|@|@|@@%394%326%199%326%176%312%120%408%613$1@%613$2@$0@@@%613%720$1@$2@@$0@@|@|@|@@%394%326%199%326%176%312%120%408%607$1@%607$2@$0@@@%607%720$1@$2@@$0@@|@|@|@@%394%326%199%326%176%312%120%408%605$1@%605$2@$0@@@%605%720$1@$2@@$0@@|@|@|@@%394%326%199%326%176%312%120%408%599$1@%599$2@$0@@@%599%720$1@$2@@$0@@|@|@|@@%326%199%326%176%312%120%408%601$1@%601$2@$0@@@%601%720$1@$2@@$0@@|@|@|@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_fupdfupds_comp x = x
    val op elf32_section_header_table_entry_fupdfupds_comp =
    DT(((("elf_section_header_table",148),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_section_header_table",[119,120,121,145])]),["DISK_THM"]),
       [read"%394%394%326%199%326%176%428%724%609$0@@%609$1@@@%609%720$0@$1@@@|@|@@%318%203%326%199%326%176%424%723%609$0@@%723%609$1@@$2@@@%723%609%720$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%428%724%615$0@@%615$1@@@%615%720$0@$1@@@|@|@@%318%203%326%199%326%176%424%723%615$0@@%723%615$1@@$2@@@%723%615%720$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%428%724%603$0@@%603$1@@@%603%720$0@$1@@@|@|@@%318%203%326%199%326%176%424%723%603$0@@%723%603$1@@$2@@@%723%603%720$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%428%724%597$0@@%597$1@@@%597%720$0@$1@@@|@|@@%318%203%326%199%326%176%424%723%597$0@@%723%597$1@@$2@@@%723%597%720$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%428%724%611$0@@%611$1@@@%611%720$0@$1@@@|@|@@%318%203%326%199%326%176%424%723%611$0@@%723%611$1@@$2@@@%723%611%720$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%428%724%613$0@@%613$1@@@%613%720$0@$1@@@|@|@@%318%203%326%199%326%176%424%723%613$0@@%723%613$1@@$2@@@%723%613%720$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%428%724%607$0@@%607$1@@@%607%720$0@$1@@@|@|@@%318%203%326%199%326%176%424%723%607$0@@%723%607$1@@$2@@@%723%607%720$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%428%724%605$0@@%605$1@@@%605%720$0@$1@@@|@|@@%318%203%326%199%326%176%424%723%605$0@@%723%605$1@@$2@@@%723%605%720$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%428%724%599$0@@%599$1@@@%599%720$0@$1@@@|@|@@%318%203%326%199%326%176%424%723%599$0@@%723%599$1@@$2@@@%723%599%720$0@$1@@@$2@@|@|@|@@@%394%326%199%326%176%428%724%601$0@@%601$1@@@%601%720$0@$1@@@|@|@@%318%203%326%199%326%176%424%723%601$0@@%723%601$1@@$2@@@%723%601%720$0@$1@@@$2@@|@|@|@@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_fupdcanon x = x
    val op elf32_section_header_table_entry_fupdcanon =
    DT(((("elf_section_header_table",149),
        [("bool",[25,26,55,180]),
         ("elf_section_header_table",[119,120,121,145])]),["DISK_THM"]),
       [read"%394%326%199%326%176%312%120%408%615$1@%609$2@$0@@@%609$2@%615$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%603$1@%609$2@$0@@@%609$2@%603$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%603$1@%615$2@$0@@@%615$2@%603$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%597$1@%609$2@$0@@@%609$2@%597$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%597$1@%615$2@$0@@@%615$2@%597$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%597$1@%603$2@$0@@@%603$2@%597$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%611$1@%609$2@$0@@@%609$2@%611$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%611$1@%615$2@$0@@@%615$2@%611$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%611$1@%603$2@$0@@@%603$2@%611$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%611$1@%597$2@$0@@@%597$2@%611$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%613$1@%609$2@$0@@@%609$2@%613$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%613$1@%615$2@$0@@@%615$2@%613$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%613$1@%603$2@$0@@@%603$2@%613$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%613$1@%597$2@$0@@@%597$2@%613$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%613$1@%611$2@$0@@@%611$2@%613$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%607$1@%609$2@$0@@@%609$2@%607$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%607$1@%615$2@$0@@@%615$2@%607$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%607$1@%603$2@$0@@@%603$2@%607$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%607$1@%597$2@$0@@@%597$2@%607$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%607$1@%611$2@$0@@@%611$2@%607$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%607$1@%613$2@$0@@@%613$2@%607$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%605$1@%609$2@$0@@@%609$2@%605$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%605$1@%615$2@$0@@@%615$2@%605$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%605$1@%603$2@$0@@@%603$2@%605$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%605$1@%597$2@$0@@@%597$2@%605$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%605$1@%611$2@$0@@@%611$2@%605$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%605$1@%613$2@$0@@@%613$2@%605$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%605$1@%607$2@$0@@@%607$2@%605$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%599$1@%609$2@$0@@@%609$2@%599$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%599$1@%615$2@$0@@@%615$2@%599$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%599$1@%603$2@$0@@@%603$2@%599$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%599$1@%597$2@$0@@@%597$2@%599$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%599$1@%611$2@$0@@@%611$2@%599$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%599$1@%613$2@$0@@@%613$2@%599$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%599$1@%607$2@$0@@@%607$2@%599$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%599$1@%605$2@$0@@@%605$2@%599$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%601$1@%609$2@$0@@@%609$2@%601$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%601$1@%615$2@$0@@@%615$2@%601$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%601$1@%603$2@$0@@@%603$2@%601$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%601$1@%597$2@$0@@@%597$2@%601$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%601$1@%611$2@$0@@@%611$2@%601$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%601$1@%613$2@$0@@@%613$2@%601$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%601$1@%607$2@$0@@@%607$2@%601$1@$0@@@|@|@|@@%394%326%199%326%176%312%120%408%601$1@%605$2@$0@@@%605$2@%601$1@$0@@@|@|@|@@%326%199%326%176%312%120%408%601$1@%599$2@$0@@@%599$2@%601$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_fupdcanon_comp x = x
    val op elf32_section_header_table_entry_fupdcanon_comp =
    DT(((("elf_section_header_table",150),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_section_header_table",[119,120,121,145])]),["DISK_THM"]),
       [read"%394%394%326%199%326%176%428%724%615$0@@%609$1@@@%724%609$1@@%615$0@@@|@|@@%318%203%326%199%326%176%424%723%615$0@@%723%609$1@@$2@@@%723%609$1@@%723%615$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%603$0@@%609$1@@@%724%609$1@@%603$0@@@|@|@@%318%203%326%199%326%176%424%723%603$0@@%723%609$1@@$2@@@%723%609$1@@%723%603$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%603$0@@%615$1@@@%724%615$1@@%603$0@@@|@|@@%318%203%326%199%326%176%424%723%603$0@@%723%615$1@@$2@@@%723%615$1@@%723%603$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%597$0@@%609$1@@@%724%609$1@@%597$0@@@|@|@@%318%203%326%199%326%176%424%723%597$0@@%723%609$1@@$2@@@%723%609$1@@%723%597$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%597$0@@%615$1@@@%724%615$1@@%597$0@@@|@|@@%318%203%326%199%326%176%424%723%597$0@@%723%615$1@@$2@@@%723%615$1@@%723%597$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%597$0@@%603$1@@@%724%603$1@@%597$0@@@|@|@@%318%203%326%199%326%176%424%723%597$0@@%723%603$1@@$2@@@%723%603$1@@%723%597$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%611$0@@%609$1@@@%724%609$1@@%611$0@@@|@|@@%318%203%326%199%326%176%424%723%611$0@@%723%609$1@@$2@@@%723%609$1@@%723%611$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%611$0@@%615$1@@@%724%615$1@@%611$0@@@|@|@@%318%203%326%199%326%176%424%723%611$0@@%723%615$1@@$2@@@%723%615$1@@%723%611$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%611$0@@%603$1@@@%724%603$1@@%611$0@@@|@|@@%318%203%326%199%326%176%424%723%611$0@@%723%603$1@@$2@@@%723%603$1@@%723%611$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%611$0@@%597$1@@@%724%597$1@@%611$0@@@|@|@@%318%203%326%199%326%176%424%723%611$0@@%723%597$1@@$2@@@%723%597$1@@%723%611$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%613$0@@%609$1@@@%724%609$1@@%613$0@@@|@|@@%318%203%326%199%326%176%424%723%613$0@@%723%609$1@@$2@@@%723%609$1@@%723%613$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%613$0@@%615$1@@@%724%615$1@@%613$0@@@|@|@@%318%203%326%199%326%176%424%723%613$0@@%723%615$1@@$2@@@%723%615$1@@%723%613$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%613$0@@%603$1@@@%724%603$1@@%613$0@@@|@|@@%318%203%326%199%326%176%424%723%613$0@@%723%603$1@@$2@@@%723%603$1@@%723%613$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%613$0@@%597$1@@@%724%597$1@@%613$0@@@|@|@@%318%203%326%199%326%176%424%723%613$0@@%723%597$1@@$2@@@%723%597$1@@%723%613$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%613$0@@%611$1@@@%724%611$1@@%613$0@@@|@|@@%318%203%326%199%326%176%424%723%613$0@@%723%611$1@@$2@@@%723%611$1@@%723%613$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%607$0@@%609$1@@@%724%609$1@@%607$0@@@|@|@@%318%203%326%199%326%176%424%723%607$0@@%723%609$1@@$2@@@%723%609$1@@%723%607$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%607$0@@%615$1@@@%724%615$1@@%607$0@@@|@|@@%318%203%326%199%326%176%424%723%607$0@@%723%615$1@@$2@@@%723%615$1@@%723%607$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%607$0@@%603$1@@@%724%603$1@@%607$0@@@|@|@@%318%203%326%199%326%176%424%723%607$0@@%723%603$1@@$2@@@%723%603$1@@%723%607$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%607$0@@%597$1@@@%724%597$1@@%607$0@@@|@|@@%318%203%326%199%326%176%424%723%607$0@@%723%597$1@@$2@@@%723%597$1@@%723%607$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%607$0@@%611$1@@@%724%611$1@@%607$0@@@|@|@@%318%203%326%199%326%176%424%723%607$0@@%723%611$1@@$2@@@%723%611$1@@%723%607$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%607$0@@%613$1@@@%724%613$1@@%607$0@@@|@|@@%318%203%326%199%326%176%424%723%607$0@@%723%613$1@@$2@@@%723%613$1@@%723%607$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%605$0@@%609$1@@@%724%609$1@@%605$0@@@|@|@@%318%203%326%199%326%176%424%723%605$0@@%723%609$1@@$2@@@%723%609$1@@%723%605$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%605$0@@%615$1@@@%724%615$1@@%605$0@@@|@|@@%318%203%326%199%326%176%424%723%605$0@@%723%615$1@@$2@@@%723%615$1@@%723%605$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%605$0@@%603$1@@@%724%603$1@@%605$0@@@|@|@@%318%203%326%199%326%176%424%723%605$0@@%723%603$1@@$2@@@%723%603$1@@%723%605$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%605$0@@%597$1@@@%724%597$1@@%605$0@@@|@|@@%318%203%326%199%326%176%424%723%605$0@@%723%597$1@@$2@@@%723%597$1@@%723%605$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%605$0@@%611$1@@@%724%611$1@@%605$0@@@|@|@@%318%203%326%199%326%176%424%723%605$0@@%723%611$1@@$2@@@%723%611$1@@%723%605$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%605$0@@%613$1@@@%724%613$1@@%605$0@@@|@|@@%318%203%326%199%326%176%424%723%605$0@@%723%613$1@@$2@@@%723%613$1@@%723%605$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%605$0@@%607$1@@@%724%607$1@@%605$0@@@|@|@@%318%203%326%199%326%176%424%723%605$0@@%723%607$1@@$2@@@%723%607$1@@%723%605$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%599$0@@%609$1@@@%724%609$1@@%599$0@@@|@|@@%318%203%326%199%326%176%424%723%599$0@@%723%609$1@@$2@@@%723%609$1@@%723%599$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%599$0@@%615$1@@@%724%615$1@@%599$0@@@|@|@@%318%203%326%199%326%176%424%723%599$0@@%723%615$1@@$2@@@%723%615$1@@%723%599$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%599$0@@%603$1@@@%724%603$1@@%599$0@@@|@|@@%318%203%326%199%326%176%424%723%599$0@@%723%603$1@@$2@@@%723%603$1@@%723%599$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%599$0@@%597$1@@@%724%597$1@@%599$0@@@|@|@@%318%203%326%199%326%176%424%723%599$0@@%723%597$1@@$2@@@%723%597$1@@%723%599$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%599$0@@%611$1@@@%724%611$1@@%599$0@@@|@|@@%318%203%326%199%326%176%424%723%599$0@@%723%611$1@@$2@@@%723%611$1@@%723%599$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%599$0@@%613$1@@@%724%613$1@@%599$0@@@|@|@@%318%203%326%199%326%176%424%723%599$0@@%723%613$1@@$2@@@%723%613$1@@%723%599$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%599$0@@%607$1@@@%724%607$1@@%599$0@@@|@|@@%318%203%326%199%326%176%424%723%599$0@@%723%607$1@@$2@@@%723%607$1@@%723%599$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%599$0@@%605$1@@@%724%605$1@@%599$0@@@|@|@@%318%203%326%199%326%176%424%723%599$0@@%723%605$1@@$2@@@%723%605$1@@%723%599$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%601$0@@%609$1@@@%724%609$1@@%601$0@@@|@|@@%318%203%326%199%326%176%424%723%601$0@@%723%609$1@@$2@@@%723%609$1@@%723%601$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%601$0@@%615$1@@@%724%615$1@@%601$0@@@|@|@@%318%203%326%199%326%176%424%723%601$0@@%723%615$1@@$2@@@%723%615$1@@%723%601$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%601$0@@%603$1@@@%724%603$1@@%601$0@@@|@|@@%318%203%326%199%326%176%424%723%601$0@@%723%603$1@@$2@@@%723%603$1@@%723%601$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%601$0@@%597$1@@@%724%597$1@@%601$0@@@|@|@@%318%203%326%199%326%176%424%723%601$0@@%723%597$1@@$2@@@%723%597$1@@%723%601$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%601$0@@%611$1@@@%724%611$1@@%601$0@@@|@|@@%318%203%326%199%326%176%424%723%601$0@@%723%611$1@@$2@@@%723%611$1@@%723%601$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%601$0@@%613$1@@@%724%613$1@@%601$0@@@|@|@@%318%203%326%199%326%176%424%723%601$0@@%723%613$1@@$2@@@%723%613$1@@%723%601$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%601$0@@%607$1@@@%724%607$1@@%601$0@@@|@|@@%318%203%326%199%326%176%424%723%601$0@@%723%607$1@@$2@@@%723%607$1@@%723%601$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%428%724%601$0@@%605$1@@@%724%605$1@@%601$0@@@|@|@@%318%203%326%199%326%176%424%723%601$0@@%723%605$1@@$2@@@%723%605$1@@%723%601$0@@$2@@@|@|@|@@@%394%326%199%326%176%428%724%601$0@@%599$1@@@%724%599$1@@%601$0@@@|@|@@%318%203%326%199%326%176%424%723%601$0@@%723%599$1@@$2@@@%723%599$1@@%723%601$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_section_header_table_entry_component_equality x = x
    val op elf32_section_header_table_entry_component_equality =
    DT(((("elf_section_header_table",151),
        [("bool",[25,26,50,55,62,180]),
         ("elf_section_header_table",[119,120,121,134]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%312%124%312%128%403%408$1@$0@@%394%406%608$1@@%608$0@@@%394%406%614$1@@%614$0@@@%394%406%602$1@@%602$0@@@%394%406%596$1@@%596$0@@@%394%406%610$1@@%610$0@@@%394%406%612$1@@%612$0@@@%394%406%606$1@@%606$0@@@%394%406%604$1@@%604$0@@@%394%406%598$1@@%598$0@@@%406%600$1@@%600$0@@@@@@@@@@@@|@|@"])
  fun op elf32_section_header_table_entry_updates_eq_literal x = x
    val op elf32_section_header_table_entry_updates_eq_literal =
    DT(((("elf_section_header_table",152),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_section_header_table",[119,120,121,145])]),["DISK_THM"]),
       [read"%312%120%309%114%309%110%309%104%309%98%309%92%309%86%309%82%309%78%309%72%309%70%408%609%505$9@@%615%505$8@@%603%505$7@@%597%505$6@@%611%505$5@@%613%505$4@@%607%505$3@@%605%505$2@@%599%505$1@@%601%505$0@@$10@@@@@@@@@@@%609%505$9@@%615%505$8@@%603%505$7@@%597%505$6@@%611%505$5@@%613%505$4@@%607%505$3@@%605%505$2@@%599%505$1@@%601%505$0@@%466@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_literal_nchotomy x = x
    val op elf32_section_header_table_entry_literal_nchotomy =
    DT(((("elf_section_header_table",153),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_section_header_table",[119,120,121,145]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%312%120%447%114%447%110%447%104%447%98%447%92%447%86%447%82%447%78%447%72%447%70%408$10@%609%505$9@@%615%505$8@@%603%505$7@@%597%505$6@@%611%505$5@@%613%505$4@@%607%505$3@@%605%505$2@@%599%505$1@@%601%505$0@@%466@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf32_section_header_table_entry x = x
    val op FORALL_elf32_section_header_table_entry =
    DT(((("elf_section_header_table",154),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_section_header_table",[119,120,121,145]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%332%15%403%312%120$1$0@|@@%309%114%309%110%309%104%309%98%309%92%309%86%309%82%309%78%309%72%309%70$10%609%505$9@@%615%505$8@@%603%505$7@@%597%505$6@@%611%505$5@@%613%505$4@@%607%505$3@@%605%505$2@@%599%505$1@@%601%505$0@@%466@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf32_section_header_table_entry x = x
    val op EXISTS_elf32_section_header_table_entry =
    DT(((("elf_section_header_table",155),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_section_header_table",[119,120,121,145]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%332%15%403%449%120$1$0@|@@%447%114%447%110%447%104%447%98%447%92%447%86%447%82%447%78%447%72%447%70$10%609%505$9@@%615%505$8@@%603%505$7@@%597%505$6@@%611%505$5@@%613%505$4@@%607%505$3@@%605%505$2@@%599%505$1@@%601%505$0@@%466@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op elf32_section_header_table_entry_literal_11 x = x
    val op elf32_section_header_table_entry_literal_11 =
    DT(((("elf_section_header_table",156),
        [("combin",[12]),
         ("elf_section_header_table",[146,151])]),["DISK_THM"]),
       [read"%309%115%309%111%309%106%309%100%309%94%309%88%309%83%309%79%309%74%309%78%309%116%309%112%309%108%309%102%309%96%309%90%309%84%309%80%309%76%309%82%403%408%609%505$19@@%615%505$18@@%603%505$17@@%597%505$16@@%611%505$15@@%613%505$14@@%607%505$13@@%605%505$12@@%599%505$11@@%601%505$10@@%466@@@@@@@@@@@%609%505$9@@%615%505$8@@%603%505$7@@%597%505$6@@%611%505$5@@%613%505$4@@%607%505$3@@%605%505$2@@%599%505$1@@%601%505$0@@%466@@@@@@@@@@@@%394%406$19@$9@@%394%406$18@$8@@%394%406$17@$7@@%394%406$16@$6@@%394%406$15@$5@@%394%406$14@$4@@%394%406$13@$3@@%394%406$12@$2@@%394%406$11@$1@@%406$10@$0@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf32_section_header_table_entry x = x
    val op datatype_elf32_section_header_table_entry =
    DT(((("elf_section_header_table",157),
        [("bool",[25,170])]),["DISK_THM"]),
       [read"%492%234%141@%148@%151@%145@%142@%149@%150@%147@%146@%143@%144@@"])
  fun op elf32_section_header_table_entry_11 x = x
    val op elf32_section_header_table_entry_11 =
    DT(((("elf_section_header_table",158),
        [("bool",[26,50,55,62,180]),
         ("elf_section_header_table",[119,120,121]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%309%22%309%28%309%31%309%35%309%39%309%43%309%46%309%48%309%51%309%55%309%23%309%29%309%33%309%37%309%41%309%45%309%47%309%49%309%53%309%57%403%408%757$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%394%406$19@$9@@%394%406$18@$8@@%394%406$17@$7@@%394%406$16@$6@@%394%406$15@$5@@%394%406$14@$4@@%394%406$13@$3@@%394%406$12@$2@@%394%406$11@$1@@%406$10@$0@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_case_cong x = x
    val op elf32_section_header_table_entry_case_cong =
    DT(((("elf_section_header_table",159),
        [("bool",[26,180]),
         ("elf_section_header_table",[119,120,121,122])]),["DISK_THM"]),
       [read"%312%5%312%9%330%180%444%394%408$2@$1@@%309%22%309%28%309%31%309%35%309%39%309%43%309%46%309%48%309%51%309%55%444%408$11@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%398$10$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%185$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@|@|@@@%398%595$2@$0@@%595$1@%185@@@|@|@|@"])
  fun op elf32_section_header_table_entry_nchotomy x = x
    val op elf32_section_header_table_entry_nchotomy =
    DT(((("elf_section_header_table",160),
        [("bool",[26,180]),
         ("elf_section_header_table",[119,120,121])]),["DISK_THM"]),
       [read"%312%134%447%70%447%72%447%78%447%82%447%86%447%92%447%98%447%104%447%110%447%114%408$10@%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_Axiom x = x
    val op elf32_section_header_table_entry_Axiom =
    DT(((("elf_section_header_table",161),
        [("bool",[26,180]),("elf_section_header_table",[119,120,121]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%330%180%454%195%309%22%309%28%309%31%309%35%309%39%309%43%309%46%309%48%309%51%309%55%398$10%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_section_header_table_entry_induction x = x
    val op elf32_section_header_table_entry_induction =
    DT(((("elf_section_header_table",162),
        [("bool",[26]),
         ("elf_section_header_table",[119,120,121])]),["DISK_THM"]),
       [read"%332%15%444%309%70%309%72%309%78%309%82%309%86%309%92%309%98%309%104%309%110%309%114$10%757$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@@%312%120$1$0@|@@|@"])
  fun op elf64_section_header_table_entry_accessors x = x
    val op elf64_section_header_table_entry_accessors =
    DT(((("elf_section_header_table",182),
        [("elf_section_header_table",
         [172,173,174,175,176,177,178,179,180,181])]),["DISK_THM"]),
       [read"%394%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%406%644%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%406%650%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%405%638%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%405%632%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%405%646%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%405%648%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%406%642%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%406%640%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@@%394%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%405%634%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@@%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%405%636%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_fn_updates x = x
    val op elf64_section_header_table_entry_fn_updates =
    DT(((("elf_section_header_table",193),
        [("elf_section_header_table",
         [183,184,185,186,187,188,189,190,191,192])]),["DISK_THM"]),
       [read"%394%326%176%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%645$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$10$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%326%176%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%651$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$10$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%325%175%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%639$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$10$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%325%175%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%633$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$10$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%325%175%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%647$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$6@$10$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%325%175%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%649$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$6@$5@$10$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%326%176%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%643$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$6@$5@$4@$10$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%326%176%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%641$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$6@$5@$4@$3@$10$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@@%394%325%175%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%635$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$6@$5@$4@$3@$2@$10$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@@%325%175%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113%410%637$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$10$0@@@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_accfupds x = x
    val op elf64_section_header_table_entry_accfupds =
    DT(((("elf_section_header_table",194),
        [("bool",[25,26,55,180]),
         ("elf_section_header_table",
         [167,168,169,182,193])]),["DISK_THM"]),
       [read"%394%326%176%315%122%406%644%651$1@$0@@@%644$0@@|@|@@%394%325%175%315%122%406%644%639$1@$0@@@%644$0@@|@|@@%394%325%175%315%122%406%644%633$1@$0@@@%644$0@@|@|@@%394%325%175%315%122%406%644%647$1@$0@@@%644$0@@|@|@@%394%325%175%315%122%406%644%649$1@$0@@@%644$0@@|@|@@%394%326%176%315%122%406%644%643$1@$0@@@%644$0@@|@|@@%394%326%176%315%122%406%644%641$1@$0@@@%644$0@@|@|@@%394%325%175%315%122%406%644%635$1@$0@@@%644$0@@|@|@@%394%325%175%315%122%406%644%637$1@$0@@@%644$0@@|@|@@%394%326%176%315%122%406%650%645$1@$0@@@%650$0@@|@|@@%394%325%175%315%122%406%650%639$1@$0@@@%650$0@@|@|@@%394%325%175%315%122%406%650%633$1@$0@@@%650$0@@|@|@@%394%325%175%315%122%406%650%647$1@$0@@@%650$0@@|@|@@%394%325%175%315%122%406%650%649$1@$0@@@%650$0@@|@|@@%394%326%176%315%122%406%650%643$1@$0@@@%650$0@@|@|@@%394%326%176%315%122%406%650%641$1@$0@@@%650$0@@|@|@@%394%325%175%315%122%406%650%635$1@$0@@@%650$0@@|@|@@%394%325%175%315%122%406%650%637$1@$0@@@%650$0@@|@|@@%394%326%176%315%122%405%638%645$1@$0@@@%638$0@@|@|@@%394%326%176%315%122%405%638%651$1@$0@@@%638$0@@|@|@@%394%325%175%315%122%405%638%633$1@$0@@@%638$0@@|@|@@%394%325%175%315%122%405%638%647$1@$0@@@%638$0@@|@|@@%394%325%175%315%122%405%638%649$1@$0@@@%638$0@@|@|@@%394%326%176%315%122%405%638%643$1@$0@@@%638$0@@|@|@@%394%326%176%315%122%405%638%641$1@$0@@@%638$0@@|@|@@%394%325%175%315%122%405%638%635$1@$0@@@%638$0@@|@|@@%394%325%175%315%122%405%638%637$1@$0@@@%638$0@@|@|@@%394%326%176%315%122%405%632%645$1@$0@@@%632$0@@|@|@@%394%326%176%315%122%405%632%651$1@$0@@@%632$0@@|@|@@%394%325%175%315%122%405%632%639$1@$0@@@%632$0@@|@|@@%394%325%175%315%122%405%632%647$1@$0@@@%632$0@@|@|@@%394%325%175%315%122%405%632%649$1@$0@@@%632$0@@|@|@@%394%326%176%315%122%405%632%643$1@$0@@@%632$0@@|@|@@%394%326%176%315%122%405%632%641$1@$0@@@%632$0@@|@|@@%394%325%175%315%122%405%632%635$1@$0@@@%632$0@@|@|@@%394%325%175%315%122%405%632%637$1@$0@@@%632$0@@|@|@@%394%326%176%315%122%405%646%645$1@$0@@@%646$0@@|@|@@%394%326%176%315%122%405%646%651$1@$0@@@%646$0@@|@|@@%394%325%175%315%122%405%646%639$1@$0@@@%646$0@@|@|@@%394%325%175%315%122%405%646%633$1@$0@@@%646$0@@|@|@@%394%325%175%315%122%405%646%649$1@$0@@@%646$0@@|@|@@%394%326%176%315%122%405%646%643$1@$0@@@%646$0@@|@|@@%394%326%176%315%122%405%646%641$1@$0@@@%646$0@@|@|@@%394%325%175%315%122%405%646%635$1@$0@@@%646$0@@|@|@@%394%325%175%315%122%405%646%637$1@$0@@@%646$0@@|@|@@%394%326%176%315%122%405%648%645$1@$0@@@%648$0@@|@|@@%394%326%176%315%122%405%648%651$1@$0@@@%648$0@@|@|@@%394%325%175%315%122%405%648%639$1@$0@@@%648$0@@|@|@@%394%325%175%315%122%405%648%633$1@$0@@@%648$0@@|@|@@%394%325%175%315%122%405%648%647$1@$0@@@%648$0@@|@|@@%394%326%176%315%122%405%648%643$1@$0@@@%648$0@@|@|@@%394%326%176%315%122%405%648%641$1@$0@@@%648$0@@|@|@@%394%325%175%315%122%405%648%635$1@$0@@@%648$0@@|@|@@%394%325%175%315%122%405%648%637$1@$0@@@%648$0@@|@|@@%394%326%176%315%122%406%642%645$1@$0@@@%642$0@@|@|@@%394%326%176%315%122%406%642%651$1@$0@@@%642$0@@|@|@@%394%325%175%315%122%406%642%639$1@$0@@@%642$0@@|@|@@%394%325%175%315%122%406%642%633$1@$0@@@%642$0@@|@|@@%394%325%175%315%122%406%642%647$1@$0@@@%642$0@@|@|@@%394%325%175%315%122%406%642%649$1@$0@@@%642$0@@|@|@@%394%326%176%315%122%406%642%641$1@$0@@@%642$0@@|@|@@%394%325%175%315%122%406%642%635$1@$0@@@%642$0@@|@|@@%394%325%175%315%122%406%642%637$1@$0@@@%642$0@@|@|@@%394%326%176%315%122%406%640%645$1@$0@@@%640$0@@|@|@@%394%326%176%315%122%406%640%651$1@$0@@@%640$0@@|@|@@%394%325%175%315%122%406%640%639$1@$0@@@%640$0@@|@|@@%394%325%175%315%122%406%640%633$1@$0@@@%640$0@@|@|@@%394%325%175%315%122%406%640%647$1@$0@@@%640$0@@|@|@@%394%325%175%315%122%406%640%649$1@$0@@@%640$0@@|@|@@%394%326%176%315%122%406%640%643$1@$0@@@%640$0@@|@|@@%394%325%175%315%122%406%640%635$1@$0@@@%640$0@@|@|@@%394%325%175%315%122%406%640%637$1@$0@@@%640$0@@|@|@@%394%326%176%315%122%405%634%645$1@$0@@@%634$0@@|@|@@%394%326%176%315%122%405%634%651$1@$0@@@%634$0@@|@|@@%394%325%175%315%122%405%634%639$1@$0@@@%634$0@@|@|@@%394%325%175%315%122%405%634%633$1@$0@@@%634$0@@|@|@@%394%325%175%315%122%405%634%647$1@$0@@@%634$0@@|@|@@%394%325%175%315%122%405%634%649$1@$0@@@%634$0@@|@|@@%394%326%176%315%122%405%634%643$1@$0@@@%634$0@@|@|@@%394%326%176%315%122%405%634%641$1@$0@@@%634$0@@|@|@@%394%325%175%315%122%405%634%637$1@$0@@@%634$0@@|@|@@%394%326%176%315%122%405%636%645$1@$0@@@%636$0@@|@|@@%394%326%176%315%122%405%636%651$1@$0@@@%636$0@@|@|@@%394%325%175%315%122%405%636%639$1@$0@@@%636$0@@|@|@@%394%325%175%315%122%405%636%633$1@$0@@@%636$0@@|@|@@%394%325%175%315%122%405%636%647$1@$0@@@%636$0@@|@|@@%394%325%175%315%122%405%636%649$1@$0@@@%636$0@@|@|@@%394%326%176%315%122%405%636%643$1@$0@@@%636$0@@|@|@@%394%326%176%315%122%405%636%641$1@$0@@@%636$0@@|@|@@%394%325%175%315%122%405%636%635$1@$0@@@%636$0@@|@|@@%394%326%176%315%122%406%644%645$1@$0@@@$1%644$0@@@|@|@@%394%326%176%315%122%406%650%651$1@$0@@@$1%650$0@@@|@|@@%394%325%175%315%122%405%638%639$1@$0@@@$1%638$0@@@|@|@@%394%325%175%315%122%405%632%633$1@$0@@@$1%632$0@@@|@|@@%394%325%175%315%122%405%646%647$1@$0@@@$1%646$0@@@|@|@@%394%325%175%315%122%405%648%649$1@$0@@@$1%648$0@@@|@|@@%394%326%176%315%122%406%642%643$1@$0@@@$1%642$0@@@|@|@@%394%326%176%315%122%406%640%641$1@$0@@@$1%640$0@@@|@|@@%394%325%175%315%122%405%634%635$1@$0@@@$1%634$0@@@|@|@@%325%175%315%122%405%636%637$1@$0@@@$1%636$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_fupdfupds x = x
    val op elf64_section_header_table_entry_fupdfupds =
    DT(((("elf_section_header_table",195),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_section_header_table",[167,168,169,193])]),["DISK_THM"]),
       [read"%394%326%199%326%176%315%122%410%645$1@%645$2@$0@@@%645%720$1@$2@@$0@@|@|@|@@%394%326%199%326%176%315%122%410%651$1@%651$2@$0@@@%651%720$1@$2@@$0@@|@|@|@@%394%325%198%325%175%315%122%410%639$1@%639$2@$0@@@%639%719$1@$2@@$0@@|@|@|@@%394%325%198%325%175%315%122%410%633$1@%633$2@$0@@@%633%719$1@$2@@$0@@|@|@|@@%394%325%198%325%175%315%122%410%647$1@%647$2@$0@@@%647%719$1@$2@@$0@@|@|@|@@%394%325%198%325%175%315%122%410%649$1@%649$2@$0@@@%649%719$1@$2@@$0@@|@|@|@@%394%326%199%326%176%315%122%410%643$1@%643$2@$0@@@%643%720$1@$2@@$0@@|@|@|@@%394%326%199%326%176%315%122%410%641$1@%641$2@$0@@@%641%720$1@$2@@$0@@|@|@|@@%394%325%198%325%175%315%122%410%635$1@%635$2@$0@@@%635%719$1@$2@@$0@@|@|@|@@%325%198%325%175%315%122%410%637$1@%637$2@$0@@@%637%719$1@$2@@$0@@|@|@|@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_fupdfupds_comp x = x
    val op elf64_section_header_table_entry_fupdfupds_comp =
    DT(((("elf_section_header_table",196),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_section_header_table",[167,168,169,193])]),["DISK_THM"]),
       [read"%394%394%326%199%326%176%431%728%645$0@@%645$1@@@%645%720$0@$1@@@|@|@@%320%205%326%199%326%176%426%727%645$0@@%727%645$1@@$2@@@%727%645%720$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%431%728%651$0@@%651$1@@@%651%720$0@$1@@@|@|@@%320%205%326%199%326%176%426%727%651$0@@%727%651$1@@$2@@@%727%651%720$0@$1@@@$2@@|@|@|@@@%394%394%325%198%325%175%431%728%639$0@@%639$1@@@%639%719$0@$1@@@|@|@@%320%205%325%198%325%175%426%727%639$0@@%727%639$1@@$2@@@%727%639%719$0@$1@@@$2@@|@|@|@@@%394%394%325%198%325%175%431%728%633$0@@%633$1@@@%633%719$0@$1@@@|@|@@%320%205%325%198%325%175%426%727%633$0@@%727%633$1@@$2@@@%727%633%719$0@$1@@@$2@@|@|@|@@@%394%394%325%198%325%175%431%728%647$0@@%647$1@@@%647%719$0@$1@@@|@|@@%320%205%325%198%325%175%426%727%647$0@@%727%647$1@@$2@@@%727%647%719$0@$1@@@$2@@|@|@|@@@%394%394%325%198%325%175%431%728%649$0@@%649$1@@@%649%719$0@$1@@@|@|@@%320%205%325%198%325%175%426%727%649$0@@%727%649$1@@$2@@@%727%649%719$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%431%728%643$0@@%643$1@@@%643%720$0@$1@@@|@|@@%320%205%326%199%326%176%426%727%643$0@@%727%643$1@@$2@@@%727%643%720$0@$1@@@$2@@|@|@|@@@%394%394%326%199%326%176%431%728%641$0@@%641$1@@@%641%720$0@$1@@@|@|@@%320%205%326%199%326%176%426%727%641$0@@%727%641$1@@$2@@@%727%641%720$0@$1@@@$2@@|@|@|@@@%394%394%325%198%325%175%431%728%635$0@@%635$1@@@%635%719$0@$1@@@|@|@@%320%205%325%198%325%175%426%727%635$0@@%727%635$1@@$2@@@%727%635%719$0@$1@@@$2@@|@|@|@@@%394%325%198%325%175%431%728%637$0@@%637$1@@@%637%719$0@$1@@@|@|@@%320%205%325%198%325%175%426%727%637$0@@%727%637$1@@$2@@@%727%637%719$0@$1@@@$2@@|@|@|@@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_fupdcanon x = x
    val op elf64_section_header_table_entry_fupdcanon =
    DT(((("elf_section_header_table",197),
        [("bool",[25,26,55,180]),
         ("elf_section_header_table",[167,168,169,193])]),["DISK_THM"]),
       [read"%394%326%199%326%176%315%122%410%651$1@%645$2@$0@@@%645$2@%651$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%639$1@%645$2@$0@@@%645$2@%639$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%639$1@%651$2@$0@@@%651$2@%639$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%633$1@%645$2@$0@@@%645$2@%633$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%633$1@%651$2@$0@@@%651$2@%633$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%633$1@%639$2@$0@@@%639$2@%633$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%647$1@%645$2@$0@@@%645$2@%647$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%647$1@%651$2@$0@@@%651$2@%647$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%647$1@%639$2@$0@@@%639$2@%647$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%647$1@%633$2@$0@@@%633$2@%647$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%649$1@%645$2@$0@@@%645$2@%649$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%649$1@%651$2@$0@@@%651$2@%649$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%649$1@%639$2@$0@@@%639$2@%649$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%649$1@%633$2@$0@@@%633$2@%649$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%649$1@%647$2@$0@@@%647$2@%649$1@$0@@@|@|@|@@%394%326%199%326%176%315%122%410%643$1@%645$2@$0@@@%645$2@%643$1@$0@@@|@|@|@@%394%326%199%326%176%315%122%410%643$1@%651$2@$0@@@%651$2@%643$1@$0@@@|@|@|@@%394%325%198%326%176%315%122%410%643$1@%639$2@$0@@@%639$2@%643$1@$0@@@|@|@|@@%394%325%198%326%176%315%122%410%643$1@%633$2@$0@@@%633$2@%643$1@$0@@@|@|@|@@%394%325%198%326%176%315%122%410%643$1@%647$2@$0@@@%647$2@%643$1@$0@@@|@|@|@@%394%325%198%326%176%315%122%410%643$1@%649$2@$0@@@%649$2@%643$1@$0@@@|@|@|@@%394%326%199%326%176%315%122%410%641$1@%645$2@$0@@@%645$2@%641$1@$0@@@|@|@|@@%394%326%199%326%176%315%122%410%641$1@%651$2@$0@@@%651$2@%641$1@$0@@@|@|@|@@%394%325%198%326%176%315%122%410%641$1@%639$2@$0@@@%639$2@%641$1@$0@@@|@|@|@@%394%325%198%326%176%315%122%410%641$1@%633$2@$0@@@%633$2@%641$1@$0@@@|@|@|@@%394%325%198%326%176%315%122%410%641$1@%647$2@$0@@@%647$2@%641$1@$0@@@|@|@|@@%394%325%198%326%176%315%122%410%641$1@%649$2@$0@@@%649$2@%641$1@$0@@@|@|@|@@%394%326%199%326%176%315%122%410%641$1@%643$2@$0@@@%643$2@%641$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%635$1@%645$2@$0@@@%645$2@%635$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%635$1@%651$2@$0@@@%651$2@%635$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%635$1@%639$2@$0@@@%639$2@%635$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%635$1@%633$2@$0@@@%633$2@%635$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%635$1@%647$2@$0@@@%647$2@%635$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%635$1@%649$2@$0@@@%649$2@%635$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%635$1@%643$2@$0@@@%643$2@%635$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%635$1@%641$2@$0@@@%641$2@%635$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%637$1@%645$2@$0@@@%645$2@%637$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%637$1@%651$2@$0@@@%651$2@%637$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%637$1@%639$2@$0@@@%639$2@%637$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%637$1@%633$2@$0@@@%633$2@%637$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%637$1@%647$2@$0@@@%647$2@%637$1@$0@@@|@|@|@@%394%325%198%325%175%315%122%410%637$1@%649$2@$0@@@%649$2@%637$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%637$1@%643$2@$0@@@%643$2@%637$1@$0@@@|@|@|@@%394%326%199%325%175%315%122%410%637$1@%641$2@$0@@@%641$2@%637$1@$0@@@|@|@|@@%325%198%325%175%315%122%410%637$1@%635$2@$0@@@%635$2@%637$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_fupdcanon_comp x = x
    val op elf64_section_header_table_entry_fupdcanon_comp =
    DT(((("elf_section_header_table",198),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_section_header_table",[167,168,169,193])]),["DISK_THM"]),
       [read"%394%394%326%199%326%176%431%728%651$0@@%645$1@@@%728%645$1@@%651$0@@@|@|@@%320%205%326%199%326%176%426%727%651$0@@%727%645$1@@$2@@@%727%645$1@@%727%651$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%639$0@@%645$1@@@%728%645$1@@%639$0@@@|@|@@%320%205%326%199%325%175%426%727%639$0@@%727%645$1@@$2@@@%727%645$1@@%727%639$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%639$0@@%651$1@@@%728%651$1@@%639$0@@@|@|@@%320%205%326%199%325%175%426%727%639$0@@%727%651$1@@$2@@@%727%651$1@@%727%639$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%633$0@@%645$1@@@%728%645$1@@%633$0@@@|@|@@%320%205%326%199%325%175%426%727%633$0@@%727%645$1@@$2@@@%727%645$1@@%727%633$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%633$0@@%651$1@@@%728%651$1@@%633$0@@@|@|@@%320%205%326%199%325%175%426%727%633$0@@%727%651$1@@$2@@@%727%651$1@@%727%633$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%633$0@@%639$1@@@%728%639$1@@%633$0@@@|@|@@%320%205%325%198%325%175%426%727%633$0@@%727%639$1@@$2@@@%727%639$1@@%727%633$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%647$0@@%645$1@@@%728%645$1@@%647$0@@@|@|@@%320%205%326%199%325%175%426%727%647$0@@%727%645$1@@$2@@@%727%645$1@@%727%647$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%647$0@@%651$1@@@%728%651$1@@%647$0@@@|@|@@%320%205%326%199%325%175%426%727%647$0@@%727%651$1@@$2@@@%727%651$1@@%727%647$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%647$0@@%639$1@@@%728%639$1@@%647$0@@@|@|@@%320%205%325%198%325%175%426%727%647$0@@%727%639$1@@$2@@@%727%639$1@@%727%647$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%647$0@@%633$1@@@%728%633$1@@%647$0@@@|@|@@%320%205%325%198%325%175%426%727%647$0@@%727%633$1@@$2@@@%727%633$1@@%727%647$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%649$0@@%645$1@@@%728%645$1@@%649$0@@@|@|@@%320%205%326%199%325%175%426%727%649$0@@%727%645$1@@$2@@@%727%645$1@@%727%649$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%649$0@@%651$1@@@%728%651$1@@%649$0@@@|@|@@%320%205%326%199%325%175%426%727%649$0@@%727%651$1@@$2@@@%727%651$1@@%727%649$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%649$0@@%639$1@@@%728%639$1@@%649$0@@@|@|@@%320%205%325%198%325%175%426%727%649$0@@%727%639$1@@$2@@@%727%639$1@@%727%649$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%649$0@@%633$1@@@%728%633$1@@%649$0@@@|@|@@%320%205%325%198%325%175%426%727%649$0@@%727%633$1@@$2@@@%727%633$1@@%727%649$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%649$0@@%647$1@@@%728%647$1@@%649$0@@@|@|@@%320%205%325%198%325%175%426%727%649$0@@%727%647$1@@$2@@@%727%647$1@@%727%649$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%431%728%643$0@@%645$1@@@%728%645$1@@%643$0@@@|@|@@%320%205%326%199%326%176%426%727%643$0@@%727%645$1@@$2@@@%727%645$1@@%727%643$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%431%728%643$0@@%651$1@@@%728%651$1@@%643$0@@@|@|@@%320%205%326%199%326%176%426%727%643$0@@%727%651$1@@$2@@@%727%651$1@@%727%643$0@@$2@@@|@|@|@@@%394%394%325%198%326%176%431%728%643$0@@%639$1@@@%728%639$1@@%643$0@@@|@|@@%320%205%325%198%326%176%426%727%643$0@@%727%639$1@@$2@@@%727%639$1@@%727%643$0@@$2@@@|@|@|@@@%394%394%325%198%326%176%431%728%643$0@@%633$1@@@%728%633$1@@%643$0@@@|@|@@%320%205%325%198%326%176%426%727%643$0@@%727%633$1@@$2@@@%727%633$1@@%727%643$0@@$2@@@|@|@|@@@%394%394%325%198%326%176%431%728%643$0@@%647$1@@@%728%647$1@@%643$0@@@|@|@@%320%205%325%198%326%176%426%727%643$0@@%727%647$1@@$2@@@%727%647$1@@%727%643$0@@$2@@@|@|@|@@@%394%394%325%198%326%176%431%728%643$0@@%649$1@@@%728%649$1@@%643$0@@@|@|@@%320%205%325%198%326%176%426%727%643$0@@%727%649$1@@$2@@@%727%649$1@@%727%643$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%431%728%641$0@@%645$1@@@%728%645$1@@%641$0@@@|@|@@%320%205%326%199%326%176%426%727%641$0@@%727%645$1@@$2@@@%727%645$1@@%727%641$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%431%728%641$0@@%651$1@@@%728%651$1@@%641$0@@@|@|@@%320%205%326%199%326%176%426%727%641$0@@%727%651$1@@$2@@@%727%651$1@@%727%641$0@@$2@@@|@|@|@@@%394%394%325%198%326%176%431%728%641$0@@%639$1@@@%728%639$1@@%641$0@@@|@|@@%320%205%325%198%326%176%426%727%641$0@@%727%639$1@@$2@@@%727%639$1@@%727%641$0@@$2@@@|@|@|@@@%394%394%325%198%326%176%431%728%641$0@@%633$1@@@%728%633$1@@%641$0@@@|@|@@%320%205%325%198%326%176%426%727%641$0@@%727%633$1@@$2@@@%727%633$1@@%727%641$0@@$2@@@|@|@|@@@%394%394%325%198%326%176%431%728%641$0@@%647$1@@@%728%647$1@@%641$0@@@|@|@@%320%205%325%198%326%176%426%727%641$0@@%727%647$1@@$2@@@%727%647$1@@%727%641$0@@$2@@@|@|@|@@@%394%394%325%198%326%176%431%728%641$0@@%649$1@@@%728%649$1@@%641$0@@@|@|@@%320%205%325%198%326%176%426%727%641$0@@%727%649$1@@$2@@@%727%649$1@@%727%641$0@@$2@@@|@|@|@@@%394%394%326%199%326%176%431%728%641$0@@%643$1@@@%728%643$1@@%641$0@@@|@|@@%320%205%326%199%326%176%426%727%641$0@@%727%643$1@@$2@@@%727%643$1@@%727%641$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%635$0@@%645$1@@@%728%645$1@@%635$0@@@|@|@@%320%205%326%199%325%175%426%727%635$0@@%727%645$1@@$2@@@%727%645$1@@%727%635$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%635$0@@%651$1@@@%728%651$1@@%635$0@@@|@|@@%320%205%326%199%325%175%426%727%635$0@@%727%651$1@@$2@@@%727%651$1@@%727%635$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%635$0@@%639$1@@@%728%639$1@@%635$0@@@|@|@@%320%205%325%198%325%175%426%727%635$0@@%727%639$1@@$2@@@%727%639$1@@%727%635$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%635$0@@%633$1@@@%728%633$1@@%635$0@@@|@|@@%320%205%325%198%325%175%426%727%635$0@@%727%633$1@@$2@@@%727%633$1@@%727%635$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%635$0@@%647$1@@@%728%647$1@@%635$0@@@|@|@@%320%205%325%198%325%175%426%727%635$0@@%727%647$1@@$2@@@%727%647$1@@%727%635$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%635$0@@%649$1@@@%728%649$1@@%635$0@@@|@|@@%320%205%325%198%325%175%426%727%635$0@@%727%649$1@@$2@@@%727%649$1@@%727%635$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%635$0@@%643$1@@@%728%643$1@@%635$0@@@|@|@@%320%205%326%199%325%175%426%727%635$0@@%727%643$1@@$2@@@%727%643$1@@%727%635$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%635$0@@%641$1@@@%728%641$1@@%635$0@@@|@|@@%320%205%326%199%325%175%426%727%635$0@@%727%641$1@@$2@@@%727%641$1@@%727%635$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%637$0@@%645$1@@@%728%645$1@@%637$0@@@|@|@@%320%205%326%199%325%175%426%727%637$0@@%727%645$1@@$2@@@%727%645$1@@%727%637$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%637$0@@%651$1@@@%728%651$1@@%637$0@@@|@|@@%320%205%326%199%325%175%426%727%637$0@@%727%651$1@@$2@@@%727%651$1@@%727%637$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%637$0@@%639$1@@@%728%639$1@@%637$0@@@|@|@@%320%205%325%198%325%175%426%727%637$0@@%727%639$1@@$2@@@%727%639$1@@%727%637$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%637$0@@%633$1@@@%728%633$1@@%637$0@@@|@|@@%320%205%325%198%325%175%426%727%637$0@@%727%633$1@@$2@@@%727%633$1@@%727%637$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%637$0@@%647$1@@@%728%647$1@@%637$0@@@|@|@@%320%205%325%198%325%175%426%727%637$0@@%727%647$1@@$2@@@%727%647$1@@%727%637$0@@$2@@@|@|@|@@@%394%394%325%198%325%175%431%728%637$0@@%649$1@@@%728%649$1@@%637$0@@@|@|@@%320%205%325%198%325%175%426%727%637$0@@%727%649$1@@$2@@@%727%649$1@@%727%637$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%637$0@@%643$1@@@%728%643$1@@%637$0@@@|@|@@%320%205%326%199%325%175%426%727%637$0@@%727%643$1@@$2@@@%727%643$1@@%727%637$0@@$2@@@|@|@|@@@%394%394%326%199%325%175%431%728%637$0@@%641$1@@@%728%641$1@@%637$0@@@|@|@@%320%205%326%199%325%175%426%727%637$0@@%727%641$1@@$2@@@%727%641$1@@%727%637$0@@$2@@@|@|@|@@@%394%325%198%325%175%431%728%637$0@@%635$1@@@%728%635$1@@%637$0@@@|@|@@%320%205%325%198%325%175%426%727%637$0@@%727%635$1@@$2@@@%727%635$1@@%727%637$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_section_header_table_entry_component_equality x = x
    val op elf64_section_header_table_entry_component_equality =
    DT(((("elf_section_header_table",199),
        [("bool",[25,26,50,55,62,180]),
         ("elf_section_header_table",[167,168,169,182]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%315%126%315%130%403%410$1@$0@@%394%406%644$1@@%644$0@@@%394%406%650$1@@%650$0@@@%394%405%638$1@@%638$0@@@%394%405%632$1@@%632$0@@@%394%405%646$1@@%646$0@@@%394%405%648$1@@%648$0@@@%394%406%642$1@@%642$0@@@%394%406%640$1@@%640$0@@@%394%405%634$1@@%634$0@@@%405%636$1@@%636$0@@@@@@@@@@@@|@|@"])
  fun op elf64_section_header_table_entry_updates_eq_literal x = x
    val op elf64_section_header_table_entry_updates_eq_literal =
    DT(((("elf_section_header_table",200),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_section_header_table",[167,168,169,193])]),["DISK_THM"]),
       [read"%315%122%309%114%309%110%308%103%308%97%308%91%308%85%309%82%309%78%308%71%308%69%410%645%505$9@@%651%505$8@@%639%504$7@@%633%504$6@@%647%504$5@@%649%504$4@@%643%505$3@@%641%505$2@@%635%504$1@@%637%504$0@@$10@@@@@@@@@@@%645%505$9@@%651%505$8@@%639%504$7@@%633%504$6@@%647%504$5@@%649%504$4@@%643%505$3@@%641%505$2@@%635%504$1@@%637%504$0@@%468@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_literal_nchotomy x = x
    val op elf64_section_header_table_entry_literal_nchotomy =
    DT(((("elf_section_header_table",201),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_section_header_table",[167,168,169,193]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%315%122%447%114%447%110%446%103%446%97%446%91%446%85%447%82%447%78%446%71%446%69%410$10@%645%505$9@@%651%505$8@@%639%504$7@@%633%504$6@@%647%504$5@@%649%504$4@@%643%505$3@@%641%505$2@@%635%504$1@@%637%504$0@@%468@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf64_section_header_table_entry x = x
    val op FORALL_elf64_section_header_table_entry =
    DT(((("elf_section_header_table",202),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_section_header_table",[167,168,169,193]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%334%17%403%315%122$1$0@|@@%309%114%309%110%308%103%308%97%308%91%308%85%309%82%309%78%308%71%308%69$10%645%505$9@@%651%505$8@@%639%504$7@@%633%504$6@@%647%504$5@@%649%504$4@@%643%505$3@@%641%505$2@@%635%504$1@@%637%504$0@@%468@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf64_section_header_table_entry x = x
    val op EXISTS_elf64_section_header_table_entry =
    DT(((("elf_section_header_table",203),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_section_header_table",[167,168,169,193]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%334%17%403%451%122$1$0@|@@%447%114%447%110%446%103%446%97%446%91%446%85%447%82%447%78%446%71%446%69$10%645%505$9@@%651%505$8@@%639%504$7@@%633%504$6@@%647%504$5@@%649%504$4@@%643%505$3@@%641%505$2@@%635%504$1@@%637%504$0@@%468@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op elf64_section_header_table_entry_literal_11 x = x
    val op elf64_section_header_table_entry_literal_11 =
    DT(((("elf_section_header_table",204),
        [("combin",[12]),
         ("elf_section_header_table",[194,199])]),["DISK_THM"]),
       [read"%309%115%309%111%308%105%308%99%308%93%308%87%309%83%309%79%308%73%308%77%309%116%309%112%308%107%308%101%308%95%308%89%309%84%309%80%308%75%308%81%403%410%645%505$19@@%651%505$18@@%639%504$17@@%633%504$16@@%647%504$15@@%649%504$14@@%643%505$13@@%641%505$12@@%635%504$11@@%637%504$10@@%468@@@@@@@@@@@%645%505$9@@%651%505$8@@%639%504$7@@%633%504$6@@%647%504$5@@%649%504$4@@%643%505$3@@%641%505$2@@%635%504$1@@%637%504$0@@%468@@@@@@@@@@@@%394%406$19@$9@@%394%406$18@$8@@%394%405$17@$7@@%394%405$16@$6@@%394%405$15@$5@@%394%405$14@$4@@%394%406$13@$3@@%394%406$12@$2@@%394%405$11@$1@@%405$10@$0@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf64_section_header_table_entry x = x
    val op datatype_elf64_section_header_table_entry =
    DT(((("elf_section_header_table",205),
        [("bool",[25,170])]),["DISK_THM"]),
       [read"%492%232%157@%164@%167@%161@%158@%165@%166@%163@%162@%159@%160@@"])
  fun op elf64_section_header_table_entry_11 x = x
    val op elf64_section_header_table_entry_11 =
    DT(((("elf_section_header_table",206),
        [("bool",[26,50,55,62,180]),
         ("elf_section_header_table",[167,168,169]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%309%22%309%28%308%30%308%34%308%38%308%42%309%46%309%48%308%50%308%54%309%23%309%29%308%32%308%36%308%40%308%44%309%47%309%49%308%52%308%56%403%410%759$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%394%406$19@$9@@%394%406$18@$8@@%394%405$17@$7@@%394%405$16@$6@@%394%405$15@$5@@%394%405$14@$4@@%394%406$13@$3@@%394%406$12@$2@@%394%405$11@$1@@%405$10@$0@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_case_cong x = x
    val op elf64_section_header_table_entry_case_cong =
    DT(((("elf_section_header_table",207),
        [("bool",[26,180]),
         ("elf_section_header_table",[167,168,169,170])]),["DISK_THM"]),
       [read"%315%7%315%11%328%178%444%394%410$2@$1@@%309%22%309%28%308%30%308%34%308%38%308%42%309%46%309%48%308%50%308%54%444%410$11@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%398$10$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%183$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@|@|@@@%398%631$2@$0@@%631$1@%183@@@|@|@|@"])
  fun op elf64_section_header_table_entry_nchotomy x = x
    val op elf64_section_header_table_entry_nchotomy =
    DT(((("elf_section_header_table",208),
        [("bool",[26,180]),
         ("elf_section_header_table",[167,168,169])]),["DISK_THM"]),
       [read"%315%136%447%70%447%72%446%77%446%81%446%85%446%91%447%98%447%104%446%109%446%113%410$10@%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_Axiom x = x
    val op elf64_section_header_table_entry_Axiom =
    DT(((("elf_section_header_table",209),
        [("bool",[26,180]),("elf_section_header_table",[167,168,169]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%328%178%458%197%309%22%309%28%308%30%308%34%308%38%308%42%309%46%309%48%308%50%308%54%398$10%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_section_header_table_entry_induction x = x
    val op elf64_section_header_table_entry_induction =
    DT(((("elf_section_header_table",210),
        [("bool",[26]),
         ("elf_section_header_table",[167,168,169])]),["DISK_THM"]),
       [read"%334%17%444%309%70%309%72%308%77%308%81%308%85%308%91%309%98%309%104%308%109%308%113$10%759$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@@%315%122$1$0@|@@|@"])
  fun op read_elf32_section_header_table'_ind x = x
    val op read_elf32_section_header_table'_ind =
    DT(((("elf_section_header_table",222),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%335%18%444%316%168%307%63%444%307%64%444%838%438%704$1@@%395@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%316%282%307%284$2$1@$0@|@|@@|@",
        read"%316%168%307%63%307%64%444%838%438%704$1@@%395@@@%21%381$2@$0@@%381$2@$1@@@|@|@|@",
        read"%568%21@"])
  fun op read_elf32_section_header_table'_def x = x
    val op read_elf32_section_header_table'_def =
    DT(((("elf_section_header_table",223),
        [("bool",[15,57,128]),("combin",[19]),
         ("elf_section_header_table",[220,221]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%316%168%307%63%411%745$1@$0@@%477%438%704$0@@%395@@%761%530@@%680%746$1@$0@@%563%173%64%666%745$3@$0@@%273%761%482$2@$0@@|@||@@@@|@|@",
        read"%316%168%307%63%307%64%444%838%438%704$1@@%395@@@%21%381$2@$0@@%381$2@$1@@@|@|@|@",
        read"%568%21@"])
  fun op read_elf64_section_header_table'_ind x = x
    val op read_elf64_section_header_table'_ind =
    DT(((("elf_section_header_table",226),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%335%18%444%316%168%307%63%444%307%64%444%838%438%704$1@@%395@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%316%282%307%284$2$1@$0@|@|@@|@",
        read"%316%168%307%63%307%64%444%838%438%704$1@@%395@@@%21%381$2@$0@@%381$2@$1@@@|@|@|@",
        read"%568%21@"])
  fun op read_elf64_section_header_table'_def x = x
    val op read_elf64_section_header_table'_def =
    DT(((("elf_section_header_table",227),
        [("bool",[15,57,128]),("combin",[19]),
         ("elf_section_header_table",[224,225]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%316%168%307%63%412%752$1@$0@@%478%438%704$0@@%395@@%762%531@@%681%753$1@$0@@%564%174%64%668%752$3@$0@@%274%762%483$2@$0@@|@||@@@@|@|@",
        read"%316%168%307%63%307%64%444%838%438%704$1@@%395@@@%21%381$2@$0@@%381$2@$1@@@|@|@|@",
        read"%568%21@"])
  fun op get_elf32_section_to_segment_mapping_ind x = x
    val op get_elf32_section_to_segment_mapping_ind =
    DT(((("elf_section_header_table",254),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%323%12%444%305%210%342%244%311%227%321%215%350%270%444%394%312%300%342%303%344%222%444%394%436$6@%482$2@$1@@@%394%838%699$2@$5@@@%394%838%838$4$7@$2@$5@@@@%438$0@%835%608$2@@@@@@@$8$7@$1@$5@$4@$3@@|@|@|@@%394%312%300%342%303%444%394%436$5@%482$1@$0@@@%394%838%699$1@$4@@@%838$3$6@$1@$4@@@@@$7$6@$0@$4@$3@$2@@|@|@@%312%300%342%303%444%394%436$5@%482$1@$0@@@%699$1@$4@@@$7$6@$0@$4@$3@$2@@|@|@@@@$5$4@$3@$2@$1@$0@@|@|@|@|@|@@%305%281%342%286%311%288%321%290%350%294$5$4@$3@$2@$1@$0@|@|@|@|@|@@|@",
        read"%350%270%305%210%321%215%311%227%342%244%312%300%342%303%344%222%444%394%436$3@%482$2@$1@@@%394%838%699$2@$4@@@%394%838%838$5$6@$2@$4@@@@%438$0@%835%608$2@@@@@@@%19%353$6@%389$1@%376$4@%382$5@$7@@@@@%353$6@%389$3@%376$4@%382$5@$7@@@@@@|@|@|@|@|@|@|@|@",
        read"%350%270%305%210%321%215%311%227%342%244%312%300%342%303%444%394%436$2@%482$1@$0@@@%394%838%699$1@$3@@@%838$4$5@$1@$3@@@@@%19%353$5@%389$0@%376$3@%382$4@$6@@@@@%353$5@%389$2@%376$3@%382$4@$6@@@@@@|@|@|@|@|@|@|@",
        read"%350%270%321%215%305%210%311%227%342%244%312%300%342%303%444%394%436$2@%482$1@$0@@@%699$1@$3@@@%19%353$4@%389$0@%376$3@%382$5@$6@@@@@%353$4@%389$2@%376$3@%382$5@$6@@@@@@|@|@|@|@|@|@|@",
        read"%566%19@"])
  fun op get_elf32_section_to_segment_mapping_def x = x
    val op get_elf32_section_to_segment_mapping_def =
    DT(((("elf_section_header_table",255),
        [("bool",[15,57,122,128]),("combin",[19]),
         ("elf_section_header_table",[252,253]),("list",[11]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%350%270%342%244%311%227%321%215%305%210%413%688$0@$3@$2@$1@$4@@%708$3@%763%533@@%300%303%479%699$1@$4@@%688$2@$0@$4@$3@$6@@%479%838$3$2@$1@$4@@@%688$2@$0@$4@$3@$6@@%520%222%665%690$0@$7@@%271%670%688$4@$2@$6@$5@$8@@%278%763%485$1@$0@@|@|@|@%835%608$1@@@@@||@@|@|@|@|@|@",
        read"%350%270%305%210%321%215%311%227%342%244%312%300%342%303%344%222%444%394%436$3@%482$2@$1@@@%394%838%699$2@$4@@@%394%838%838$5$6@$2@$4@@@@%438$0@%835%608$2@@@@@@@%19%353$6@%389$1@%376$4@%382$5@$7@@@@@%353$6@%389$3@%376$4@%382$5@$7@@@@@@|@|@|@|@|@|@|@|@",
        read"%350%270%305%210%321%215%311%227%342%244%312%300%342%303%444%394%436$2@%482$1@$0@@@%394%838%699$1@$3@@@%838$4$5@$1@$3@@@@@%19%353$5@%389$0@%376$3@%382$4@$6@@@@@%353$5@%389$2@%376$3@%382$4@$6@@@@@@|@|@|@|@|@|@|@",
        read"%350%270%321%215%305%210%311%227%342%244%312%300%342%303%444%394%436$2@%482$1@$0@@@%699$1@$3@@@%19%353$4@%389$0@%376$3@%382$5@$6@@@@@%353$4@%389$2@%376$3@%382$5@$6@@@@@@|@|@|@|@|@|@|@",
        read"%566%19@"])
  fun op get_elf64_section_to_segment_mapping_ind x = x
    val op get_elf64_section_to_segment_mapping_ind =
    DT(((("elf_section_header_table",258),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%324%13%444%305%210%343%245%314%228%322%216%350%270%444%394%315%301%343%304%344%222%444%394%437$6@%483$2@$1@@@%394%838%838$4$7@$2@$5@@@@%394%838%701$2@$5@@@%438$0@%835%644$2@@@@@@@$8$7@$1@$5@$4@$3@@|@|@|@@%394%315%301%343%304%444%394%437$5@%483$1@$0@@@%838$3$6@$1@$4@@@@$7$6@$0@$4@$3@$2@@|@|@@%315%301%343%304%444%394%437$5@%483$1@$0@@@%394%838%838$3$6@$1@$4@@@@%701$1@$4@@@@$7$6@$0@$4@$3@$2@@|@|@@@@$5$4@$3@$2@$1@$0@@|@|@|@|@|@@%305%281%343%287%314%289%322%291%350%294$5$4@$3@$2@$1@$0@|@|@|@|@|@@|@",
        read"%350%270%314%228%305%210%322%216%343%245%315%301%343%304%344%222%444%394%437$3@%483$2@$1@@@%394%838%838$4$5@$2@$6@@@@%394%838%701$2@$6@@@%438$0@%835%644$2@@@@@@@%20%354$5@%391$1@%379$6@%383$4@$7@@@@@%354$5@%391$3@%379$6@%383$4@$7@@@@@@|@|@|@|@|@|@|@|@",
        read"%350%270%314%228%305%210%322%216%343%245%315%301%343%304%444%394%437$2@%483$1@$0@@@%838$3$4@$1@$5@@@@%20%354$4@%391$0@%379$5@%383$3@$6@@@@@%354$4@%391$2@%379$5@%383$3@$6@@@@@@|@|@|@|@|@|@|@",
        read"%350%270%314%228%305%210%322%216%343%245%315%301%343%304%444%394%437$2@%483$1@$0@@@%394%838%838$3$4@$1@$5@@@@%701$1@$5@@@@%20%354$4@%391$0@%379$5@%383$3@$6@@@@@%354$4@%391$2@%379$5@%383$3@$6@@@@@@|@|@|@|@|@|@|@",
        read"%567%20@"])
  fun op get_elf64_section_to_segment_mapping_def x = x
    val op get_elf64_section_to_segment_mapping_def =
    DT(((("elf_section_header_table",259),
        [("bool",[15,57,122,128]),("combin",[19]),
         ("elf_section_header_table",[256,257]),("list",[11]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%350%270%343%245%314%228%322%216%305%210%413%689$0@$3@$2@$1@$4@@%711$3@%763%533@@%301%304%479%838$3$2@$1@$4@@@%689$2@$0@$4@$3@$6@@%479%701$1@$4@@%689$2@$0@$4@$3@$6@@%520%222%665%690$0@$7@@%271%670%689$4@$2@$6@$5@$8@@%278%763%485$1@$0@@|@|@|@%835%644$1@@@@@||@@|@|@|@|@|@",
        read"%350%270%314%228%305%210%322%216%343%245%315%301%343%304%344%222%444%394%437$3@%483$2@$1@@@%394%838%838$4$5@$2@$6@@@@%394%838%701$2@$6@@@%438$0@%835%644$2@@@@@@@%20%354$5@%391$1@%379$6@%383$4@$7@@@@@%354$5@%391$3@%379$6@%383$4@$7@@@@@@|@|@|@|@|@|@|@|@",
        read"%350%270%314%228%305%210%322%216%343%245%315%301%343%304%444%394%437$2@%483$1@$0@@@%838$3$4@$1@$5@@@@%20%354$4@%391$0@%379$5@%383$3@$6@@@@@%354$4@%391$2@%379$5@%383$3@$6@@@@@@|@|@|@|@|@|@|@",
        read"%350%270%314%228%305%210%322%216%343%245%315%301%343%304%444%394%437$2@%483$1@$0@@@%394%838%838$3$4@$1@$5@@@@%701$1@$5@@@@%20%354$4@%391$0@%379$5@%383$3@$6@@@@@%354$4@%391$2@%379$5@%383$3@$6@@@@@@|@|@|@|@|@|@|@",
        read"%567%20@"])
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
   ("string_of_special_section_index_def",
    string_of_special_section_index_def,
    DB.Def), ("sht_null_def",sht_null_def,DB.Def),
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
   ("string_of_section_type_def",string_of_section_type_def,DB.Def),
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
   ("string_of_section_flags_def",string_of_section_flags_def,DB.Def),
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
   ("elf32_null_section_header_def",elf32_null_section_header_def,DB.Def),
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
   ("elf64_null_section_header_def",elf64_null_section_header_def,DB.Def),
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
   ("string_of_elf32_section_header_table_entry_def",
    string_of_elf32_section_header_table_entry_def,
    DB.Def),
   ("string_of_elf64_section_header_table_entry_def",
    string_of_elf64_section_header_table_entry_def,
    DB.Def),
   ("string_of_elf32_section_header_table_entry'_def",
    string_of_elf32_section_header_table_entry'_def,
    DB.Def),
   ("string_of_elf64_section_header_table_entry'_def",
    string_of_elf64_section_header_table_entry'_def,
    DB.Def),
   ("string_of_elf32_section_header_table_entry_default_def",
    string_of_elf32_section_header_table_entry_default_def,
    DB.Def),
   ("instance_Show_Show_Elf_section_header_table_elf32_section_header_table_entry_dict_def",
    instance_Show_Show_Elf_section_header_table_elf32_section_header_table_entry_dict_def,
    DB.Def),
   ("string_of_elf64_section_header_table_entry_default_def",
    string_of_elf64_section_header_table_entry_default_def,
    DB.Def),
   ("instance_Show_Show_Elf_section_header_table_elf64_section_header_table_entry_dict_def",
    instance_Show_Show_Elf_section_header_table_elf64_section_header_table_entry_dict_def,
    DB.Def),
   ("string_of_elf32_section_header_table_def",
    string_of_elf32_section_header_table_def,
    DB.Def),
   ("string_of_elf32_section_header_table_default_def",
    string_of_elf32_section_header_table_default_def,
    DB.Def),
   ("string_of_elf64_section_header_table_def",
    string_of_elf64_section_header_table_def,
    DB.Def),
   ("string_of_elf64_section_header_table_default_def",
    string_of_elf64_section_header_table_default_def,
    DB.Def),
   ("string_of_elf32_section_header_table'_def",
    string_of_elf32_section_header_table'_def,
    DB.Def),
   ("string_of_elf64_section_header_table'_def",
    string_of_elf64_section_header_table'_def,
    DB.Def),
   ("is_elf32_tbss_special_def",is_elf32_tbss_special_def,DB.Def),
   ("is_elf64_tbss_special_def",is_elf64_tbss_special_def,DB.Def),
   ("grp_comdat_def",grp_comdat_def,DB.Def),
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

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("string_tableTheory.string_table_grammars",
                          string_tableTheory.string_table_grammars),
                         ("elf_program_header_tableTheory.elf_program_header_table_grammars",
                          elf_program_header_tableTheory.elf_program_header_table_grammars),
                         ("elf_headerTheory.elf_header_grammars",
                          elf_headerTheory.elf_header_grammars),
                         ("lem_mapTheory.lem_map_grammars",
                          lem_mapTheory.lem_map_grammars)]
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
       ("string_of_special_section_index", (Term.prim_mk_const { Name = "string_of_special_section_index", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_special_section_index", (Term.prim_mk_const { Name = "string_of_special_section_index", Thy = "elf_section_header_table"}))
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
       ("string_of_section_type", (Term.prim_mk_const { Name = "string_of_section_type", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_section_type", (Term.prim_mk_const { Name = "string_of_section_type", Thy = "elf_section_header_table"}))
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
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_section_flags", (Term.prim_mk_const { Name = "string_of_section_flags", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_section_flags", (Term.prim_mk_const { Name = "string_of_section_flags", Thy = "elf_section_header_table"}))
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
       ("elf32_null_section_header", (Term.prim_mk_const { Name = "elf32_null_section_header", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_null_section_header", (Term.prim_mk_const { Name = "elf32_null_section_header", Thy = "elf_section_header_table"}))
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
       ("elf64_null_section_header", (Term.prim_mk_const { Name = "elf64_null_section_header", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_null_section_header", (Term.prim_mk_const { Name = "elf64_null_section_header", Thy = "elf_section_header_table"}))
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
       ("read_elf32_section_header_table'", (Term.prim_mk_const { Name = "read_elf32_section_header_table'", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_section_header_table'", (Term.prim_mk_const { Name = "read_elf32_section_header_table'", Thy = "elf_section_header_table"}))


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
       ("string_of_elf32_section_header_table_entry", (Term.prim_mk_const { Name = "string_of_elf32_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_section_header_table_entry", (Term.prim_mk_const { Name = "string_of_elf32_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_section_header_table_entry", (Term.prim_mk_const { Name = "string_of_elf64_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_section_header_table_entry", (Term.prim_mk_const { Name = "string_of_elf64_section_header_table_entry", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_section_header_table_entry'", (Term.prim_mk_const { Name = "string_of_elf32_section_header_table_entry'", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_section_header_table_entry'", (Term.prim_mk_const { Name = "string_of_elf32_section_header_table_entry'", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_section_header_table_entry'", (Term.prim_mk_const { Name = "string_of_elf64_section_header_table_entry'", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_section_header_table_entry'", (Term.prim_mk_const { Name = "string_of_elf64_section_header_table_entry'", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_section_header_table_entry_default", (Term.prim_mk_const { Name = "string_of_elf32_section_header_table_entry_default", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_section_header_table_entry_default", (Term.prim_mk_const { Name = "string_of_elf32_section_header_table_entry_default", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_section_header_table_elf32_section_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_section_header_table_elf32_section_header_table_entry_dict", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_section_header_table_elf32_section_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_section_header_table_elf32_section_header_table_entry_dict", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_section_header_table_entry_default", (Term.prim_mk_const { Name = "string_of_elf64_section_header_table_entry_default", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_section_header_table_entry_default", (Term.prim_mk_const { Name = "string_of_elf64_section_header_table_entry_default", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_section_header_table_elf64_section_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_section_header_table_elf64_section_header_table_entry_dict", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_section_header_table_elf64_section_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_section_header_table_elf64_section_header_table_entry_dict", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_section_header_table", (Term.prim_mk_const { Name = "string_of_elf32_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_section_header_table", (Term.prim_mk_const { Name = "string_of_elf32_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_section_header_table_default", (Term.prim_mk_const { Name = "string_of_elf32_section_header_table_default", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_section_header_table_default", (Term.prim_mk_const { Name = "string_of_elf32_section_header_table_default", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_section_header_table", (Term.prim_mk_const { Name = "string_of_elf64_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_section_header_table", (Term.prim_mk_const { Name = "string_of_elf64_section_header_table", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_section_header_table_default", (Term.prim_mk_const { Name = "string_of_elf64_section_header_table_default", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_section_header_table_default", (Term.prim_mk_const { Name = "string_of_elf64_section_header_table_default", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_section_header_table'", (Term.prim_mk_const { Name = "string_of_elf32_section_header_table'", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_section_header_table'", (Term.prim_mk_const { Name = "string_of_elf32_section_header_table'", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_section_header_table'", (Term.prim_mk_const { Name = "string_of_elf64_section_header_table'", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_section_header_table'", (Term.prim_mk_const { Name = "string_of_elf64_section_header_table'", Thy = "elf_section_header_table"}))
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
       ("get_elf32_section_to_segment_mapping", (Term.prim_mk_const { Name = "get_elf32_section_to_segment_mapping", Thy = "elf_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_section_to_segment_mapping", (Term.prim_mk_const { Name = "get_elf32_section_to_segment_mapping", Thy = "elf_section_header_table"}))


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
        "elf_section_header_table.shn_loreserve_def elf_section_header_table.string_of_elf64_section_header_table_entry_default_def elf_section_header_table.elf_special_sections_def elf_section_header_table.obtain_elf64_hash_table_def elf_section_header_table.obtain_elf32_hash_table_def elf_section_header_table.obtain_elf64_tls_template_def elf_section_header_table.obtain_elf32_tls_template_def elf_section_header_table.obtain_elf64_section_group_indices_def elf_section_header_table.obtain_elf32_section_group_indices_def elf_section_header_table.grp_maskproc_def elf_section_header_table.grp_maskos_def elf_section_header_table.grp_comdat_def elf_section_header_table.is_elf64_tbss_special_def elf_section_header_table.is_elf32_tbss_special_def elf_section_header_table.string_of_elf64_section_header_table'_def elf_section_header_table.string_of_elf32_section_header_table'_def elf_section_header_table.string_of_elf64_section_header_table_default_def elf_section_header_table.string_of_elf64_section_header_table_def elf_section_header_table.string_of_elf32_section_header_table_default_def elf_section_header_table.string_of_elf32_section_header_table_def elf_section_header_table.instance_Show_Show_Elf_section_header_table_elf64_section_header_table_entry_dict_def elf_section_header_table.string_of_elf32_section_header_table_entry_default_def elf_section_header_table.instance_Show_Show_Elf_section_header_table_elf32_section_header_table_entry_dict_def elf_section_header_table.string_of_elf64_section_header_table_entry'_def elf_section_header_table.string_of_elf64_section_header_table_entry_def elf_section_header_table.string_of_elf32_section_header_table_entry'_def elf_section_header_table.sht_symtab_shndx_def elf_section_header_table.string_of_elf32_section_header_table_entry_def elf_section_header_table.is_valid_elf64_section_header_table_def elf_section_header_table.is_valid_elf32_section_header_table_def elf_section_header_table.is_elf64_addr_addralign_correct_def elf_section_header_table.is_elf32_addr_addralign_correct_def elf_section_header_table.elf64_size_correct_def elf_section_header_table.elf32_size_correct_def elf_section_header_table.read_elf64_section_header_table_def elf_section_header_table.read_elf32_section_header_table_def elf_section_header_table.bytes_of_elf64_section_header_table_def elf_section_header_table.bytes_of_elf32_section_header_table_def elf_section_header_table.read_elf64_section_header_table_entry_def elf_section_header_table.bytes_of_elf64_section_header_table_entry_def elf_section_header_table.read_elf32_section_header_table_entry_def elf_section_header_table.bytes_of_elf32_section_header_table_entry_def elf_section_header_table.instance_Basic_classes_Ord_Elf_section_header_table_elf64_section_header_table_entry_dict_def elf_section_header_table.compare_elf64_section_header_table_entry_def elf_section_header_table.elf64_null_section_header_def elf_section_header_table.instance_Basic_classes_Ord_Elf_section_header_table_elf32_section_header_table_entry_dict_def elf_section_header_table.compare_elf32_section_header_table_entry_def elf_section_header_table.elf32_null_section_header_def elf_section_header_table.read_elf64_compression_header_def elf_section_header_table.read_elf32_compression_header_def elf_section_header_table.elfcompress_hiproc_def elf_section_header_table.elfcompress_loproc_def elf_section_header_table.elfcompress_hios_def elf_section_header_table.elfcompress_loos_def elf_section_header_table.elfcompress_zlib_def elf_section_header_table.string_of_section_flags_def elf_section_header_table.shf_mask_proc_def elf_section_header_table.shf_mask_os_def elf_section_header_table.shf_compressed_def elf_section_header_table.shf_tls_def elf_section_header_table.shf_group_def elf_section_header_table.shf_os_nonconforming_def elf_section_header_table.shf_link_order_def elf_section_header_table.shf_info_link_def elf_section_header_table.shf_strings_def elf_section_header_table.shf_merge_def elf_section_header_table.shf_execinstr_def elf_section_header_table.shf_alloc_def elf_section_header_table.shf_write_def elf_section_header_table.string_of_section_type_def elf_section_header_table.sht_hiuser_def elf_section_header_table.sht_louser_def elf_section_header_table.sht_hiproc_def elf_section_header_table.sht_loproc_def elf_section_header_table.sht_hios_def elf_section_header_table.sht_loos_def elf_section_header_table.sht_shlib_def elf_section_header_table.sht_group_def elf_section_header_table.sht_preinit_array_def elf_section_header_table.sht_fini_array_def elf_section_header_table.sht_init_array_def elf_section_header_table.sht_rel_def elf_section_header_table.sht_rela_def elf_section_header_table.sht_nobits_def elf_section_header_table.sht_note_def elf_section_header_table.sht_dynamic_def elf_section_header_table.sht_hash_def elf_section_header_table.sht_strtab_def elf_section_header_table.sht_symtab_def elf_section_header_table.sht_dynsym_def elf_section_header_table.sht_null_def elf_section_header_table.sht_progbits_def elf_section_header_table.string_of_special_section_index_def elf_section_header_table.shn_hireserve_def elf_section_header_table.shn_abs_def elf_section_header_table.shn_common_def elf_section_header_table.shn_hios_def elf_section_header_table.shn_hiproc_def elf_section_header_table.shn_loos_def elf_section_header_table.shn_loproc_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "elf_section_header_table"
end
