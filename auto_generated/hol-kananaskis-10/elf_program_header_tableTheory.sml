structure elf_program_header_tableTheory :> elf_program_header_tableTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading elf_program_header_tableTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open elf_types_native_uintTheory lem_setTheory
  in end;
  val _ = Theory.link_parents
          ("elf_program_header_table",
          Arbnum.fromString "1471355165",
          Arbnum.fromString "897438")
          [("elf_types_native_uint",
           Arbnum.fromString "1471355144",
           Arbnum.fromString "97434"),
           ("lem_set",
           Arbnum.fromString "1471269250",
           Arbnum.fromString "313480")];
  val _ = Theory.incorporate_types "elf_program_header_table"
       [("elf64_program_header_table_entry", 0),
        ("elf32_program_header_table_entry", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("list", "list"), ID("string", "char"),
   ID("num", "num"),
   ID("elf_program_header_table", "elf64_program_header_table_entry"),
   ID("pair", "prod"),
   ID("elf_program_header_table", "elf32_program_header_table_entry"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
   ID("min", "bool"), ID("error", "error"),
   ID("byte_sequence", "byte_sequence"), ID("endianness", "endianness"),
   ID("show", "Show_class"), ID("lem_basic_classes", "Ord_class"),
   ID("lem_basic_classes", "ordering"), ID("ind_type", "recspace"),
   ID("min", "ind"), ID("bool", "!"), ID("arithmetic", "*"),
   ID("arithmetic", "+"), ID("pair", ","), ID("arithmetic", "-"),
   ID("bool", "/\\"), ID("num", "0"), ID("prim_rec", "<"),
   ID("arithmetic", "<="), ID("min", "="), ID("min", "==>"),
   ID("arithmetic", ">="), ID("bool", "?"), ID("list", "APPEND"),
   ID("bool", "ARB"), ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("pred_set", "EMPTY"), ID("lem_basic_classes", "EQ"),
   ID("list", "EXISTS"), ID("lem_basic_classes", "GT"), ID("bool", "IN"),
   ID("pred_set", "INSERT"), ID("combin", "K"), ID("bool", "LET"),
   ID("lem_basic_classes", "LT"), ID("list", "MAP"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("show", "Show_class_show_method_fupd"),
   ID("bool", "TYPE_DEFINITION"), ID("pair", "UNCURRY"),
   ID("relation", "WF"), ID("arithmetic", "ZERO"),
   ID("elf_program_header_table", "allowable_permissions_of_permission"),
   ID("elf_types_native_uint", "bytes_of_elf32_addr"),
   ID("elf_types_native_uint", "bytes_of_elf32_off"),
   ID("elf_program_header_table", "bytes_of_elf32_program_header_table"),
   ID("elf_program_header_table", "bytes_of_elf32_program_header_table_entry"),
   ID("elf_types_native_uint", "bytes_of_elf32_word"),
   ID("elf_types_native_uint", "bytes_of_elf64_addr"),
   ID("elf_types_native_uint", "bytes_of_elf64_off"),
   ID("elf_program_header_table", "bytes_of_elf64_program_header_table"),
   ID("elf_program_header_table", "bytes_of_elf64_program_header_table_entry"),
   ID("elf_types_native_uint", "bytes_of_elf64_word"),
   ID("elf_types_native_uint", "bytes_of_elf64_xword"),
   ID("elf_program_header_table", "compare_elf32_program_header_table_entry"),
   ID("elf_program_header_table", "compare_elf64_program_header_table_entry"),
   ID("byte_sequence", "concat0"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_CASE"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_align"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_align_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_filesz"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_filesz_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_flags"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_flags_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_memsz"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_memsz_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_offset"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_offset_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_paddr"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_paddr_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_type"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_type_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_vaddr"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_vaddr_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_size"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_CASE"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_align"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_align_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_filesz"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_filesz_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_flags"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_flags_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_memsz"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_memsz_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_offset"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_offset_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_paddr"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_paddr_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_type"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_type_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_vaddr"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_vaddr_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_size"),
   ID("elf_program_header_table", "elf_pf_maskos"),
   ID("elf_program_header_table", "elf_pf_maskproc"),
   ID("elf_program_header_table", "elf_pf_r"),
   ID("elf_program_header_table", "elf_pf_w"),
   ID("elf_program_header_table", "elf_pf_x"),
   ID("elf_program_header_table", "elf_pt_dynamic"),
   ID("elf_program_header_table", "elf_pt_hios"),
   ID("elf_program_header_table", "elf_pt_hiproc"),
   ID("elf_program_header_table", "elf_pt_interp"),
   ID("elf_program_header_table", "elf_pt_load"),
   ID("elf_program_header_table", "elf_pt_loos"),
   ID("elf_program_header_table", "elf_pt_loproc"),
   ID("elf_program_header_table", "elf_pt_note"),
   ID("elf_program_header_table", "elf_pt_null"),
   ID("elf_program_header_table", "elf_pt_phdr"),
   ID("elf_program_header_table", "elf_pt_shlib"),
   ID("elf_program_header_table", "elf_pt_tls"), ID("error", "error_bind"),
   ID("elf_program_header_table", "exact_permissions_of_permission"),
   ID("error", "fail0"), ID("byte_sequence", "from_byte_lists"),
   ID("lem_basic_classes", "genericCompare"),
   ID("elf_program_header_table", "get_elf32_dynamic_linked"),
   ID("elf_program_header_table", "get_elf32_requested_interpreter"),
   ID("elf_program_header_table", "get_elf32_static_linked"),
   ID("elf_program_header_table", "get_elf64_dynamic_linked"),
   ID("elf_program_header_table", "get_elf64_requested_interpreter"),
   ID("elf_program_header_table", "get_elf64_static_linked"),
   ID("elf_program_header_table", "instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict"),
   ID("elf_program_header_table", "instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict"),
   ID("elf_program_header_table", "instance_Show_Show_Elf_program_header_table_elf32_program_header_table_entry_dict"),
   ID("elf_program_header_table", "instance_Show_Show_Elf_program_header_table_elf64_program_header_table_entry_dict"),
   ID("byte_sequence", "length0"), ID("lem_list", "lexicographic_compare"),
   ID("ASCIInumbers", "num_to_dec_string"), ID("combin", "o"),
   ID("byte_sequence", "offset_and_cut"),
   ID("byte_sequence", "partition0"),
   ID("elf_types_native_uint", "read_elf32_addr"),
   ID("elf_types_native_uint", "read_elf32_off"),
   ID("elf_program_header_table", "read_elf32_program_header_table"),
   ID("elf_program_header_table", "read_elf32_program_header_table'"),
   ID("elf_program_header_table", "read_elf32_program_header_table_entry"),
   ID("elf_types_native_uint", "read_elf32_word"),
   ID("elf_types_native_uint", "read_elf64_addr"),
   ID("elf_types_native_uint", "read_elf64_off"),
   ID("elf_program_header_table", "read_elf64_program_header_table"),
   ID("elf_program_header_table", "read_elf64_program_header_table'"),
   ID("elf_program_header_table", "read_elf64_program_header_table_entry"),
   ID("elf_types_native_uint", "read_elf64_word"),
   ID("elf_types_native_uint", "read_elf64_xword"),
   ID("elf_program_header_table", "recordtype.elf32_program_header_table_entry"),
   ID("elf_program_header_table", "recordtype.elf64_program_header_table_entry"),
   ID("error", "return"), ID("byte_sequence", "string_of_byte_sequence"),
   ID("elf_program_header_table", "string_of_elf32_program_header_table"),
   ID("elf_program_header_table", "string_of_elf32_program_header_table_entry"),
   ID("elf_program_header_table", "string_of_elf32_program_header_table_entry_default"),
   ID("elf_program_header_table", "string_of_elf64_program_header_table"),
   ID("elf_program_header_table", "string_of_elf64_program_header_table_entry"),
   ID("elf_program_header_table", "string_of_elf64_program_header_table_entry_default"),
   ID("elf_program_header_table", "string_of_elf_segment_permissions"),
   ID("elf_program_header_table", "string_of_segment_type"),
   ID("missing_pervasives", "unlines"), ID("words", "w2n"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [2], TYOP [1, 0], TYOP [3], TYOP [0, 2, 1], TYOP [0, 3, 3],
   TYOP [0, 3, 4], TYOP [4], TYOP [0, 6, 1], TYOP [0, 3, 7],
   TYOP [0, 3, 8], TYOP [1, 6], TYOP [0, 10, 1], TYOP [5, 3, 3],
   TYOP [0, 12, 11], TYOP [6], TYOP [0, 14, 1], TYOP [0, 3, 15],
   TYOP [0, 3, 16], TYOP [1, 14], TYOP [0, 18, 1], TYOP [0, 12, 19],
   TYOP [9], TYOP [8, 21], TYOP [8, 22], TYOP [8, 23], TYOP [8, 24],
   TYOP [8, 25], TYOP [8, 26], TYOP [10], TYOP [7, 28, 27],
   TYOP [0, 29, 6], TYOP [0, 29, 30], TYOP [0, 29, 31], TYOP [0, 29, 32],
   TYOP [0, 29, 33], TYOP [0, 29, 34], TYOP [7, 28, 26], TYOP [0, 36, 35],
   TYOP [0, 36, 37], TYOP [0, 36, 14], TYOP [0, 36, 39], TYOP [0, 36, 40],
   TYOP [0, 36, 41], TYOP [0, 36, 42], TYOP [0, 36, 43], TYOP [0, 36, 44],
   TYOP [0, 36, 45], TYOP [12], TYOP [5, 6, 47], TYOP [11, 48],
   TYOP [0, 47, 49], TYOP [13], TYOP [0, 51, 50], TYOP [11, 10],
   TYOP [0, 47, 53], TYOP [0, 51, 54], TYOP [5, 10, 47], TYOP [11, 56],
   TYOP [0, 47, 57], TYOP [0, 51, 58], TYOP [0, 2, 59], TYOP [5, 14, 47],
   TYOP [11, 61], TYOP [0, 47, 62], TYOP [0, 51, 63], TYOP [11, 18],
   TYOP [0, 47, 65], TYOP [0, 51, 66], TYOP [5, 18, 47], TYOP [11, 68],
   TYOP [0, 47, 69], TYOP [0, 51, 70], TYOP [0, 2, 71], TYOP [14, 6],
   TYOP [14, 14], TYOP [15, 6], TYOP [15, 14], TYOP [0, 10, 28],
   TYOP [11, 1], TYOP [0, 47, 78], TYOP [0, 6, 79], TYOP [0, 18, 28],
   TYOP [0, 14, 79], TYOP [11, 2], TYOP [0, 2, 83], TYOP [0, 6, 2],
   TYOP [0, 6, 6], TYOP [0, 29, 29], TYOP [0, 87, 86], TYOP [0, 6, 29],
   TYOP [0, 36, 36], TYOP [0, 90, 86], TYOP [0, 6, 36], TYV "'a",
   TYOP [0, 29, 93], TYOP [0, 29, 94], TYOP [0, 29, 95], TYOP [0, 29, 96],
   TYOP [0, 29, 97], TYOP [0, 29, 98], TYOP [0, 36, 99], TYOP [0, 36, 100],
   TYOP [0, 101, 93], TYOP [0, 6, 102], TYOP [0, 14, 2], TYOP [0, 14, 14],
   TYOP [0, 90, 105], TYOP [0, 14, 36], TYOP [0, 36, 93],
   TYOP [0, 36, 108], TYOP [0, 36, 109], TYOP [0, 36, 110],
   TYOP [0, 36, 111], TYOP [0, 36, 112], TYOP [0, 36, 113],
   TYOP [0, 36, 114], TYOP [0, 115, 93], TYOP [0, 14, 116], TYOP [16],
   TYOP [0, 6, 118], TYOP [0, 6, 119], TYOP [0, 14, 118],
   TYOP [0, 14, 121], TYOP [0, 6, 47], TYOP [0, 51, 123], TYOP [0, 10, 47],
   TYOP [0, 51, 125], TYOP [0, 14, 47], TYOP [0, 51, 127],
   TYOP [0, 18, 47], TYOP [0, 51, 129], TYOP [5, 36, 36],
   TYOP [5, 36, 131], TYOP [5, 36, 132], TYOP [5, 36, 133],
   TYOP [5, 36, 134], TYOP [5, 36, 135], TYOP [5, 36, 136], TYOP [17, 137],
   TYOP [0, 138, 28], TYOP [5, 29, 29], TYOP [5, 29, 140],
   TYOP [5, 29, 141], TYOP [5, 29, 142], TYOP [5, 29, 143],
   TYOP [5, 36, 144], TYOP [5, 36, 145], TYOP [17, 146], TYOP [0, 147, 28],
   TYOP [0, 14, 28], TYOP [0, 6, 28], TYOP [0, 47, 28], TYOP [0, 51, 151],
   TYOP [5, 51, 47], TYOP [0, 153, 28], TYOP [0, 153, 154], TYOP [18],
   TYOP [0, 14, 93], TYOP [0, 6, 93], TYOP [0, 93, 14], TYOP [0, 93, 6],
   TYOP [0, 29, 28], TYOP [0, 29, 161], TYOP [0, 29, 162],
   TYOP [0, 29, 163], TYOP [0, 29, 164], TYOP [0, 29, 165],
   TYOP [0, 36, 166], TYOP [0, 36, 167], TYOP [0, 156, 168],
   TYOP [0, 36, 28], TYOP [0, 36, 170], TYOP [0, 36, 171],
   TYOP [0, 36, 172], TYOP [0, 36, 173], TYOP [0, 36, 174],
   TYOP [0, 36, 175], TYOP [0, 36, 176], TYOP [0, 156, 177],
   TYOP [0, 14, 138], TYOP [0, 6, 147], TYOP [0, 151, 28],
   TYOP [0, 161, 28], TYOP [0, 170, 28], TYOP [0, 149, 28],
   TYOP [0, 150, 28], TYOP [0, 51, 28], TYOP [0, 186, 28],
   TYOP [0, 159, 28], TYOP [0, 188, 28], TYOP [0, 160, 28],
   TYOP [0, 190, 28], TYOP [0, 87, 28], TYOP [0, 192, 28],
   TYOP [0, 90, 28], TYOP [0, 194, 28], TYOP [0, 101, 28],
   TYOP [0, 196, 28], TYOP [0, 115, 28], TYOP [0, 198, 28],
   TYOP [0, 184, 28], TYOP [0, 185, 28], TYOP [0, 152, 28],
   TYOP [0, 202, 28], TYOP [0, 3, 28], TYOP [0, 204, 28],
   TYOP [0, 148, 28], TYOP [0, 206, 28], TYOP [0, 139, 28],
   TYOP [0, 208, 28], TYOP [0, 81, 28], TYOP [0, 77, 28], TYOP [0, 2, 28],
   TYOP [0, 212, 28], TYOP [0, 2, 2], TYOP [0, 2, 214], TYOP [0, 29, 140],
   TYOP [0, 29, 216], TYOP [0, 140, 141], TYOP [0, 29, 218],
   TYOP [0, 141, 142], TYOP [0, 29, 220], TYOP [0, 142, 143],
   TYOP [0, 29, 222], TYOP [0, 143, 144], TYOP [0, 29, 224],
   TYOP [0, 36, 131], TYOP [0, 36, 226], TYOP [0, 144, 145],
   TYOP [0, 36, 228], TYOP [0, 131, 132], TYOP [0, 36, 230],
   TYOP [0, 145, 146], TYOP [0, 36, 232], TYOP [0, 132, 133],
   TYOP [0, 36, 234], TYOP [0, 133, 134], TYOP [0, 36, 236],
   TYOP [0, 134, 135], TYOP [0, 36, 238], TYOP [0, 135, 136],
   TYOP [0, 36, 240], TYOP [0, 136, 137], TYOP [0, 36, 242],
   TYOP [0, 47, 61], TYOP [0, 14, 244], TYOP [0, 47, 48], TYOP [0, 6, 246],
   TYOP [0, 47, 153], TYOP [0, 51, 248], TYOP [0, 3, 12], TYOP [0, 3, 250],
   TYOP [0, 47, 68], TYOP [0, 18, 252], TYOP [0, 47, 56],
   TYOP [0, 10, 254], TYOP [0, 28, 28], TYOP [0, 28, 256],
   TYOP [0, 2, 212], TYOP [0, 93, 28], TYOP [0, 93, 259], TYOP [0, 76, 28],
   TYOP [0, 76, 261], TYOP [0, 75, 28], TYOP [0, 75, 263],
   TYOP [0, 74, 28], TYOP [0, 74, 265], TYOP [0, 73, 28],
   TYOP [0, 73, 267], TYOP [0, 47, 151], TYOP [0, 14, 149],
   TYOP [0, 6, 150], TYOP [0, 78, 28], TYOP [0, 78, 272], TYOP [0, 65, 28],
   TYOP [0, 65, 274], TYOP [0, 53, 28], TYOP [0, 53, 276],
   TYOP [0, 83, 28], TYOP [0, 83, 278], TYOP [0, 62, 28],
   TYOP [0, 62, 280], TYOP [0, 49, 28], TYOP [0, 49, 282],
   TYOP [0, 69, 28], TYOP [0, 69, 284], TYOP [0, 57, 28],
   TYOP [0, 57, 286], TYOP [0, 159, 188], TYOP [0, 160, 190],
   TYOP [0, 105, 28], TYOP [0, 105, 290], TYOP [0, 15, 28],
   TYOP [0, 15, 292], TYOP [0, 86, 28], TYOP [0, 86, 294], TYOP [0, 7, 28],
   TYOP [0, 7, 296], TYOP [0, 1, 28], TYOP [0, 1, 298], TYOP [0, 118, 28],
   TYOP [0, 118, 300], TYOP [0, 147, 148], TYOP [0, 138, 139],
   TYOP [0, 157, 28], TYOP [0, 304, 28], TYOP [0, 179, 28],
   TYOP [0, 306, 28], TYOP [0, 158, 28], TYOP [0, 308, 28],
   TYOP [0, 180, 28], TYOP [0, 310, 28], TYOP [0, 1, 1], TYOP [0, 1, 312],
   TYOP [0, 2, 0], TYOP [0, 78, 78], TYOP [0, 78, 315], TYOP [0, 28, 316],
   TYOP [0, 65, 65], TYOP [0, 65, 318], TYOP [0, 28, 319],
   TYOP [0, 53, 53], TYOP [0, 53, 321], TYOP [0, 28, 322],
   TYOP [0, 83, 83], TYOP [0, 83, 324], TYOP [0, 28, 325],
   TYOP [0, 28, 313], TYOP [0, 0, 312], TYOP [0, 18, 18],
   TYOP [0, 14, 329], TYOP [0, 10, 10], TYOP [0, 6, 331], TYOP [7, 28, 24],
   TYOP [1, 333], TYOP [1, 334], TYOP [0, 335, 335], TYOP [0, 334, 336],
   TYOP [1, 1], TYOP [0, 338, 338], TYOP [0, 1, 339], TYOP [1, 2],
   TYOP [0, 341, 341], TYOP [0, 2, 342], TYOP [0, 2, 147],
   TYOP [0, 344, 147], TYOP [0, 146, 345], TYOP [0, 2, 346],
   TYOP [0, 2, 138], TYOP [0, 348, 138], TYOP [0, 137, 349],
   TYOP [0, 2, 350], TYOP [0, 149, 81], TYOP [0, 150, 77],
   TYOP [0, 300, 28], TYOP [0, 118, 354], TYOP [0, 300, 300],
   TYOP [0, 118, 356], TYOP [0, 29, 87], TYOP [0, 36, 90],
   TYOP [0, 270, 270], TYOP [0, 270, 360], TYOP [0, 122, 122],
   TYOP [0, 122, 362], TYOP [0, 15, 15], TYOP [0, 15, 364],
   TYOP [0, 271, 271], TYOP [0, 271, 366], TYOP [0, 120, 120],
   TYOP [0, 120, 368], TYOP [0, 7, 7], TYOP [0, 7, 370], TYOP [0, 1, 3],
   TYOP [0, 2, 78], TYOP [0, 373, 373], TYOP [1, 47], TYOP [0, 18, 375],
   TYOP [0, 127, 376], TYOP [0, 18, 338], TYOP [0, 15, 378],
   TYOP [0, 10, 375], TYOP [0, 123, 380], TYOP [0, 10, 338],
   TYOP [0, 7, 382], TYOP [0, 76, 76], TYOP [0, 362, 384],
   TYOP [0, 75, 75], TYOP [0, 368, 386], TYOP [0, 360, 384],
   TYOP [0, 366, 386], TYOP [0, 74, 74], TYOP [0, 364, 390],
   TYOP [0, 73, 73], TYOP [0, 370, 392], TYOP [0, 148, 310],
   TYOP [0, 139, 306], TYOP [5, 47, 47], TYOP [0, 396, 69],
   TYOP [0, 47, 70], TYOP [0, 398, 397], TYOP [0, 396, 57],
   TYOP [0, 47, 58], TYOP [0, 401, 400], TYOP [5, 29, 47],
   TYOP [0, 403, 49], TYOP [0, 29, 50], TYOP [0, 405, 404],
   TYOP [5, 36, 47], TYOP [0, 407, 62], TYOP [0, 36, 63],
   TYOP [0, 409, 408], TYOP [0, 407, 49], TYOP [0, 36, 50],
   TYOP [0, 412, 411], TYOP [0, 61, 65], TYOP [0, 14, 66],
   TYOP [0, 415, 414], TYOP [0, 48, 53], TYOP [0, 6, 54],
   TYOP [0, 418, 417], TYOP [0, 155, 28], TYOP [0, 36, 334],
   TYOP [0, 51, 421], TYOP [0, 29, 334], TYOP [0, 51, 423],
   TYOP [0, 375, 47], TYOP [0, 79, 78], TYOP [11, 47], TYOP [0, 427, 426],
   TYOP [0, 18, 65], TYOP [0, 429, 65], TYOP [0, 65, 430],
   TYOP [0, 18, 69], TYOP [0, 432, 69], TYOP [0, 65, 433],
   TYOP [0, 10, 53], TYOP [0, 435, 53], TYOP [0, 53, 436],
   TYOP [0, 10, 57], TYOP [0, 438, 57], TYOP [0, 53, 439],
   TYOP [0, 397, 69], TYOP [11, 396], TYOP [0, 442, 441],
   TYOP [0, 400, 57], TYOP [0, 442, 444], TYOP [0, 404, 49],
   TYOP [11, 403], TYOP [0, 447, 446], TYOP [0, 408, 62], TYOP [11, 407],
   TYOP [0, 450, 449], TYOP [0, 411, 49], TYOP [0, 450, 452],
   TYOP [0, 414, 65], TYOP [0, 62, 454], TYOP [0, 417, 53],
   TYOP [0, 49, 456], TYOP [0, 1, 78], TYOP [0, 1, 83], TYOP [0, 335, 47],
   TYOP [0, 2, 118], TYOP [0, 2, 461], TYOP [0, 258, 462],
   TYOP [0, 258, 463], TYOP [0, 47, 2], TYOP [0, 341, 118],
   TYOP [0, 341, 466], TYOP [0, 462, 467], TYOP [0, 87, 87],
   TYOP [0, 87, 469], TYOP [0, 90, 90], TYOP [0, 90, 471],
   TYOP [0, 159, 159], TYOP [0, 105, 473], TYOP [0, 105, 105],
   TYOP [0, 105, 475], TYOP [0, 160, 160], TYOP [0, 86, 477],
   TYOP [0, 86, 86], TYOP [0, 86, 479], TYOP [0, 29, 1], TYOP [0, 29, 2],
   TYOP [0, 482, 481], TYOP [0, 3, 483], TYOP [0, 36, 1], TYOP [0, 36, 2],
   TYOP [0, 486, 485], TYOP [0, 3, 487], TYOP [0, 47, 427],
   TYOP [0, 2, 489], TYOP [0, 2, 490], TYOP [0, 47, 442], TYOP [0, 2, 492],
   TYOP [0, 47, 450], TYOP [0, 51, 494], TYOP [0, 47, 447],
   TYOP [0, 51, 496], TYOP [0, 61, 62], TYOP [0, 48, 49], TYOP [0, 68, 69],
   TYOP [0, 56, 57], TYOP [0, 47, 1], TYOP [0, 338, 1]]
  end
  val _ = Theory.incorporate_consts "elf_program_header_table" tyvector
     [("string_of_segment_type", 5),
      ("string_of_elf_segment_permissions", 3),
      ("string_of_elf64_program_header_table_entry_default", 7),
      ("string_of_elf64_program_header_table_entry", 9),
      ("string_of_elf64_program_header_table", 13),
      ("string_of_elf32_program_header_table_entry_default", 15),
      ("string_of_elf32_program_header_table_entry", 17),
      ("string_of_elf32_program_header_table", 20),
      ("recordtype.elf64_program_header_table_entry", 38),
      ("recordtype.elf32_program_header_table_entry", 46),
      ("read_elf64_program_header_table_entry", 52),
      ("read_elf64_program_header_table'", 55),
      ("read_elf64_program_header_table", 60),
      ("read_elf32_program_header_table_entry", 64),
      ("read_elf32_program_header_table'", 67),
      ("read_elf32_program_header_table", 72),
      ("instance_Show_Show_Elf_program_header_table_elf64_program_header_table_entry_dict", 73),
      ("instance_Show_Show_Elf_program_header_table_elf32_program_header_table_entry_dict", 74),
      ("instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict", 75),
      ("instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict", 76),
      ("get_elf64_static_linked", 77),
      ("get_elf64_requested_interpreter", 80),
      ("get_elf64_dynamic_linked", 77), ("get_elf32_static_linked", 81),
      ("get_elf32_requested_interpreter", 82),
      ("get_elf32_dynamic_linked", 81),
      ("exact_permissions_of_permission", 84), ("elf_pt_tls", 2),
      ("elf_pt_shlib", 2), ("elf_pt_phdr", 2), ("elf_pt_null", 2),
      ("elf_pt_note", 2), ("elf_pt_loproc", 2), ("elf_pt_loos", 2),
      ("elf_pt_load", 2), ("elf_pt_interp", 2), ("elf_pt_hiproc", 2),
      ("elf_pt_hios", 2), ("elf_pt_dynamic", 2), ("elf_pf_x", 2),
      ("elf_pf_w", 2), ("elf_pf_r", 2), ("elf_pf_maskproc", 2),
      ("elf_pf_maskos", 2), ("elf64_program_header_table_entry_size", 85),
      ("elf64_program_header_table_entry_elf64_p_vaddr_fupd", 88),
      ("elf64_program_header_table_entry_elf64_p_vaddr", 89),
      ("elf64_program_header_table_entry_elf64_p_type_fupd", 91),
      ("elf64_program_header_table_entry_elf64_p_type", 92),
      ("elf64_program_header_table_entry_elf64_p_paddr_fupd", 88),
      ("elf64_program_header_table_entry_elf64_p_paddr", 89),
      ("elf64_program_header_table_entry_elf64_p_offset_fupd", 88),
      ("elf64_program_header_table_entry_elf64_p_offset", 89),
      ("elf64_program_header_table_entry_elf64_p_memsz_fupd", 88),
      ("elf64_program_header_table_entry_elf64_p_memsz", 89),
      ("elf64_program_header_table_entry_elf64_p_flags_fupd", 91),
      ("elf64_program_header_table_entry_elf64_p_flags", 92),
      ("elf64_program_header_table_entry_elf64_p_filesz_fupd", 88),
      ("elf64_program_header_table_entry_elf64_p_filesz", 89),
      ("elf64_program_header_table_entry_elf64_p_align_fupd", 88),
      ("elf64_program_header_table_entry_elf64_p_align", 89),
      ("elf64_program_header_table_entry_CASE", 103),
      ("elf32_program_header_table_entry_size", 104),
      ("elf32_program_header_table_entry_elf32_p_vaddr_fupd", 106),
      ("elf32_program_header_table_entry_elf32_p_vaddr", 107),
      ("elf32_program_header_table_entry_elf32_p_type_fupd", 106),
      ("elf32_program_header_table_entry_elf32_p_type", 107),
      ("elf32_program_header_table_entry_elf32_p_paddr_fupd", 106),
      ("elf32_program_header_table_entry_elf32_p_paddr", 107),
      ("elf32_program_header_table_entry_elf32_p_offset_fupd", 106),
      ("elf32_program_header_table_entry_elf32_p_offset", 107),
      ("elf32_program_header_table_entry_elf32_p_memsz_fupd", 106),
      ("elf32_program_header_table_entry_elf32_p_memsz", 107),
      ("elf32_program_header_table_entry_elf32_p_flags_fupd", 106),
      ("elf32_program_header_table_entry_elf32_p_flags", 107),
      ("elf32_program_header_table_entry_elf32_p_filesz_fupd", 106),
      ("elf32_program_header_table_entry_elf32_p_filesz", 107),
      ("elf32_program_header_table_entry_elf32_p_align_fupd", 106),
      ("elf32_program_header_table_entry_elf32_p_align", 107),
      ("elf32_program_header_table_entry_CASE", 117),
      ("compare_elf64_program_header_table_entry", 120),
      ("compare_elf32_program_header_table_entry", 122),
      ("bytes_of_elf64_program_header_table_entry", 124),
      ("bytes_of_elf64_program_header_table", 126),
      ("bytes_of_elf32_program_header_table_entry", 128),
      ("bytes_of_elf32_program_header_table", 130),
      ("allowable_permissions_of_permission", 84)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'elf32_program_header_table_entry'", 139),
   TMV("'elf64_program_header_table_entry'", 148), TMV("M", 14),
   TMV("M", 6), TMV("M'", 14), TMV("M'", 6), TMV("P", 149), TMV("P", 150),
   TMV("P", 152), TMV("R", 155), TMV("a0", 36), TMV("a0'", 36),
   TMV("a0'", 147), TMV("a0'", 138), TMV("a1", 36), TMV("a1'", 36),
   TMV("a2", 29), TMV("a2", 36), TMV("a2'", 29), TMV("a2'", 36),
   TMV("a3", 29), TMV("a3", 36), TMV("a3'", 29), TMV("a3'", 36),
   TMV("a4", 29), TMV("a4", 36), TMV("a4'", 29), TMV("a4'", 36),
   TMV("a5", 29), TMV("a5", 36), TMV("a5'", 29), TMV("a5'", 36),
   TMV("a6", 29), TMV("a6", 36), TMV("a6'", 29), TMV("a6'", 36),
   TMV("a7", 29), TMV("a7", 36), TMV("a7'", 29), TMV("a7'", 36),
   TMV("align", 29), TMV("align", 36), TMV("bs", 47), TMV("bs0", 47),
   TMV("bs1", 47), TMV("c", 29), TMV("c", 36), TMV("c0", 29),
   TMV("c0", 36), TMV("c01", 29), TMV("c01", 36), TMV("c02", 29),
   TMV("c02", 36), TMV("c1", 29), TMV("c1", 36), TMV("c11", 29),
   TMV("c11", 36), TMV("c12", 29), TMV("c12", 36), TMV("c2", 29),
   TMV("c2", 36), TMV("c21", 29), TMV("c21", 36), TMV("c22", 29),
   TMV("c22", 36), TMV("c3", 29), TMV("c3", 36), TMV("c31", 29),
   TMV("c31", 36), TMV("c32", 29), TMV("c32", 36), TMV("c4", 29),
   TMV("c4", 36), TMV("c41", 29), TMV("c41", 36), TMV("c42", 29),
   TMV("c42", 36), TMV("c5", 29), TMV("c5", 36), TMV("c51", 36),
   TMV("c52", 36), TMV("c6", 29), TMV("c6", 36), TMV("c61", 36),
   TMV("c62", 36), TMV("cut", 47), TMV("e", 14), TMV("e", 6),
   TMV("e1", 14), TMV("e1", 6), TMV("e2", 14), TMV("e2", 6),
   TMV("eat", 47), TMV("ee", 14), TMV("ee", 6), TMV("elf32_p_align", 36),
   TMV("elf32_p_filesz", 36), TMV("elf32_p_flags", 36),
   TMV("elf32_p_memsz", 36), TMV("elf32_p_offset", 36),
   TMV("elf32_p_paddr", 36), TMV("elf32_p_type", 36),
   TMV("elf32_p_vaddr", 36), TMV("elf32_program_header_table_entry", 156),
   TMV("elf64_p_align", 29), TMV("elf64_p_filesz", 29),
   TMV("elf64_p_flags", 36), TMV("elf64_p_memsz", 29),
   TMV("elf64_p_offset", 29), TMV("elf64_p_paddr", 29),
   TMV("elf64_p_type", 36), TMV("elf64_p_vaddr", 29),
   TMV("elf64_program_header_table_entry", 156), TMV("endian", 51),
   TMV("entry", 14), TMV("entry", 6), TMV("f", 87), TMV("f", 90),
   TMV("f", 101), TMV("f", 115), TMV("f'", 101), TMV("f'", 115),
   TMV("f1", 14), TMV("f1", 6), TMV("f2", 14), TMV("f2", 6),
   TMV("filesz", 29), TMV("filesz", 36), TMV("flags", 36), TMV("fn", 157),
   TMV("fn", 158), TMV("g", 87), TMV("g", 90), TMV("h", 159),
   TMV("h", 160), TMV("h1", 14), TMV("h1", 6), TMV("h2", 14), TMV("h2", 6),
   TMV("m", 2), TMV("memsz", 29), TMV("memsz", 36), TMV("n", 2),
   TMV("off", 2), TMV("offset", 29), TMV("offset", 36), TMV("os", 3),
   TMV("p", 14), TMV("p", 6), TMV("paddr", 29), TMV("paddr", 36),
   TMV("pent", 14), TMV("pent", 6), TMV("pht", 18), TMV("pht", 10),
   TMV("proc", 3), TMV("pt", 2), TMV("record", 169), TMV("record", 178),
   TMV("rep", 179), TMV("rep", 180), TMV("rest", 47), TMV("siz", 2),
   TMV("table", 18), TMV("table", 10), TMV("table_size", 2),
   TMV("tail", 18), TMV("tail", 10), TMV("tbl", 18), TMV("tbl", 10),
   TMV("typ", 36), TMV("v", 51), TMV("v1", 47), TMV("vaddr", 29),
   TMV("vaddr", 36), TMC(19, 181), TMC(19, 182), TMC(19, 183),
   TMC(19, 184), TMC(19, 185), TMC(19, 187), TMC(19, 189), TMC(19, 191),
   TMC(19, 193), TMC(19, 195), TMC(19, 197), TMC(19, 199), TMC(19, 200),
   TMC(19, 201), TMC(19, 203), TMC(19, 205), TMC(19, 207), TMC(19, 209),
   TMC(19, 210), TMC(19, 211), TMC(19, 213), TMC(19, 206), TMC(19, 208),
   TMC(20, 215), TMC(21, 215), TMC(22, 217), TMC(22, 219), TMC(22, 221),
   TMC(22, 223), TMC(22, 225), TMC(22, 227), TMC(22, 229), TMC(22, 231),
   TMC(22, 233), TMC(22, 235), TMC(22, 237), TMC(22, 239), TMC(22, 241),
   TMC(22, 243), TMC(22, 245), TMC(22, 247), TMC(22, 249), TMC(22, 251),
   TMC(22, 253), TMC(22, 255), TMC(23, 215), TMC(24, 257), TMC(25, 2),
   TMC(26, 258), TMC(27, 258), TMC(28, 260), TMC(28, 262), TMC(28, 264),
   TMC(28, 266), TMC(28, 268), TMC(28, 257), TMC(28, 269), TMC(28, 162),
   TMC(28, 171), TMC(28, 270), TMC(28, 271), TMC(28, 273), TMC(28, 275),
   TMC(28, 277), TMC(28, 279), TMC(28, 281), TMC(28, 283), TMC(28, 285),
   TMC(28, 287), TMC(28, 288), TMC(28, 289), TMC(28, 291), TMC(28, 293),
   TMC(28, 295), TMC(28, 297), TMC(28, 299), TMC(28, 258), TMC(28, 301),
   TMC(28, 302), TMC(28, 303), TMC(29, 257), TMC(30, 258), TMC(31, 182),
   TMC(31, 183), TMC(31, 184), TMC(31, 185), TMC(31, 305), TMC(31, 307),
   TMC(31, 309), TMC(31, 311), TMC(32, 313), TMC(33, 76), TMC(33, 75),
   TMC(33, 74), TMC(33, 73), TMC(33, 14), TMC(33, 6), TMC(34, 214),
   TMC(35, 214), TMC(36, 147), TMC(36, 138), TMC(37, 314), TMC(38, 317),
   TMC(38, 320), TMC(38, 323), TMC(38, 326), TMC(38, 327), TMC(39, 328),
   TMC(39, 330), TMC(39, 332), TMC(39, 337), TMC(39, 340), TMC(39, 343),
   TMC(40, 347), TMC(40, 351), TMC(41, 256), TMC(42, 300), TMC(43, 118),
   TMC(44, 352), TMC(44, 353), TMC(45, 118), TMC(46, 355), TMC(47, 357),
   TMC(48, 358), TMC(48, 359), TMC(48, 361), TMC(48, 363), TMC(48, 365),
   TMC(48, 367), TMC(48, 369), TMC(48, 371), TMC(48, 372), TMC(49, 374),
   TMC(50, 118), TMC(51, 377), TMC(51, 379), TMC(51, 381), TMC(51, 383),
   TMC(52, 1), TMC(52, 18), TMC(52, 10), TMC(52, 335), TMC(52, 338),
   TMC(52, 341), TMC(53, 214), TMC(54, 385), TMC(54, 387), TMC(55, 388),
   TMC(55, 389), TMC(56, 388), TMC(56, 389), TMC(57, 388), TMC(57, 389),
   TMC(58, 388), TMC(58, 389), TMC(59, 391), TMC(59, 393), TMC(60, 394),
   TMC(60, 395), TMC(61, 399), TMC(61, 402), TMC(61, 406), TMC(61, 410),
   TMC(61, 413), TMC(61, 416), TMC(61, 419), TMC(62, 420), TMC(63, 2),
   TMC(64, 84), TMC(65, 422), TMC(66, 422), TMC(67, 130), TMC(68, 128),
   TMC(69, 422), TMC(70, 424), TMC(71, 424), TMC(72, 126), TMC(73, 124),
   TMC(74, 422), TMC(75, 424), TMC(76, 122), TMC(77, 120), TMC(78, 425),
   TMC(79, 117), TMC(80, 107), TMC(81, 106), TMC(82, 107), TMC(83, 106),
   TMC(84, 107), TMC(85, 106), TMC(86, 107), TMC(87, 106), TMC(88, 107),
   TMC(89, 106), TMC(90, 107), TMC(91, 106), TMC(92, 107), TMC(93, 106),
   TMC(94, 107), TMC(95, 106), TMC(96, 104), TMC(97, 103), TMC(98, 89),
   TMC(99, 88), TMC(100, 89), TMC(101, 88), TMC(102, 92), TMC(103, 91),
   TMC(104, 89), TMC(105, 88), TMC(106, 89), TMC(107, 88), TMC(108, 89),
   TMC(109, 88), TMC(110, 92), TMC(111, 91), TMC(112, 89), TMC(113, 88),
   TMC(114, 85), TMC(115, 2), TMC(116, 2), TMC(117, 2), TMC(118, 2),
   TMC(119, 2), TMC(120, 2), TMC(121, 2), TMC(122, 2), TMC(123, 2),
   TMC(124, 2), TMC(125, 2), TMC(126, 2), TMC(127, 2), TMC(128, 2),
   TMC(129, 2), TMC(130, 2), TMC(131, 2), TMC(132, 428), TMC(132, 431),
   TMC(132, 434), TMC(132, 437), TMC(132, 440), TMC(132, 443),
   TMC(132, 445), TMC(132, 448), TMC(132, 451), TMC(132, 453),
   TMC(132, 455), TMC(132, 457), TMC(133, 84), TMC(134, 458),
   TMC(134, 459), TMC(135, 460), TMC(136, 464), TMC(137, 81), TMC(138, 82),
   TMC(139, 81), TMC(140, 77), TMC(141, 80), TMC(142, 77), TMC(143, 76),
   TMC(144, 75), TMC(145, 74), TMC(146, 73), TMC(147, 465), TMC(148, 468),
   TMC(149, 3), TMC(150, 470), TMC(150, 472), TMC(150, 474), TMC(150, 476),
   TMC(150, 478), TMC(150, 480), TMC(150, 484), TMC(150, 488),
   TMC(151, 491), TMC(152, 493), TMC(153, 495), TMC(154, 495),
   TMC(155, 72), TMC(156, 67), TMC(157, 64), TMC(158, 495), TMC(159, 497),
   TMC(160, 497), TMC(161, 60), TMC(162, 55), TMC(163, 52), TMC(164, 495),
   TMC(165, 497), TMC(166, 46), TMC(167, 38), TMC(168, 458), TMC(168, 429),
   TMC(168, 435), TMC(168, 84), TMC(168, 498), TMC(168, 499),
   TMC(168, 500), TMC(168, 501), TMC(169, 502), TMC(170, 20), TMC(171, 17),
   TMC(172, 15), TMC(173, 13), TMC(174, 9), TMC(175, 7), TMC(176, 3),
   TMC(177, 5), TMC(178, 503), TMC(179, 482), TMC(179, 486), TMC(180, 256)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op elf_pt_null_def x = x
    val op elf_pt_null_def =
    DT(((("elf_program_header_table",0),[]),[]), [read"%251%407@%222@"])
  fun op elf_pt_load_def x = x
    val op elf_pt_load_def =
    DT(((("elf_program_header_table",1),[]),[]),
       [read"%251%403@%319%272%342@@@"])
  fun op elf_pt_dynamic_def x = x
    val op elf_pt_dynamic_def =
    DT(((("elf_program_header_table",2),[]),[]),
       [read"%251%399@%319%273%342@@@"])
  fun op elf_pt_interp_def x = x
    val op elf_pt_interp_def =
    DT(((("elf_program_header_table",3),[]),[]),
       [read"%251%402@%319%272%272%342@@@@"])
  fun op elf_pt_note_def x = x
    val op elf_pt_note_def =
    DT(((("elf_program_header_table",4),[]),[]),
       [read"%251%406@%319%273%272%342@@@@"])
  fun op elf_pt_shlib_def x = x
    val op elf_pt_shlib_def =
    DT(((("elf_program_header_table",5),[]),[]),
       [read"%251%409@%319%272%273%342@@@@"])
  fun op elf_pt_phdr_def x = x
    val op elf_pt_phdr_def =
    DT(((("elf_program_header_table",6),[]),[]),
       [read"%251%408@%319%273%273%342@@@@"])
  fun op elf_pt_tls_def x = x
    val op elf_pt_tls_def =
    DT(((("elf_program_header_table",7),[]),[]),
       [read"%251%410@%319%272%272%272%342@@@@@"])
  fun op elf_pt_loos_def x = x
    val op elf_pt_loos_def =
    DT(((("elf_program_header_table",8),[]),[]),
       [read"%251%404@%198%198%198%198%319%273%272%272%272%272%272%272%342@@@@@@@@@%319%273%272%272%272%272%272%272%342@@@@@@@@@@%319%273%272%272%272%272%272%272%342@@@@@@@@@@%319%273%272%272%272%272%272%272%272%342@@@@@@@@@@@%319%272%272%342@@@@@"])
  fun op elf_pt_hios_def x = x
    val op elf_pt_hios_def =
    DT(((("elf_program_header_table",9),[]),[]),
       [read"%251%400@%199%198%319%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%273%273%342@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%319%273%272%342@@@@@%319%272%272%342@@@@@"])
  fun op elf_pt_loproc_def x = x
    val op elf_pt_loproc_def =
    DT(((("elf_program_header_table",10),[]),[]),
       [read"%251%405@%198%319%273%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%273%273%342@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%319%273%272%342@@@@@"])
  fun op elf_pt_hiproc_def x = x
    val op elf_pt_hiproc_def =
    DT(((("elf_program_header_table",11),[]),[]),
       [read"%251%401@%199%198%319%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%342@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%319%273%272%342@@@@@%319%272%272%342@@@@@"])
  fun op string_of_segment_type_def x = x
    val op string_of_segment_type_def =
    DT(((("elf_program_header_table",12),[]),[]),
       [read"%190%146%190%155%195%156%250%482$2@$1@$0@@%281%251$0@%407@@%282%276%319%273%273%273%273%272%272%342@@@@@@@@@%282%276%319%272%273%273%272%273%272%342@@@@@@@@@%282%276%319%273%272%273%273%272%272%342@@@@@@@@@%282%276%319%273%272%273%273%272%272%342@@@@@@@@@%313@@@@@%281%251$0@%403@@%282%276%319%273%272%273%273%272%272%342@@@@@@@@@%282%276%319%272%272%272%272%273%272%342@@@@@@@@@%282%276%319%272%273%272%272%272%272%342@@@@@@@@@%282%276%319%273%272%273%272%272%272%342@@@@@@@@@%313@@@@@%281%251$0@%399@@%282%276%319%273%272%273%272%272%272%342@@@@@@@@@%282%276%319%272%273%272%273%273%272%342@@@@@@@@@%282%276%319%273%273%273%273%272%272%342@@@@@@@@@%282%276%319%272%273%272%272%272%272%342@@@@@@@@@%282%276%319%272%273%273%273%272%272%342@@@@@@@@@%282%276%319%272%273%272%273%272%272%342@@@@@@@@@%282%276%319%272%272%273%272%272%272%342@@@@@@@@@%313@@@@@@@@%281%251$0@%402@@%282%276%319%272%273%272%273%272%272%342@@@@@@@@@%282%276%319%273%273%273%273%272%272%342@@@@@@@@@%282%276%319%273%272%273%272%273%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%272%342@@@@@@@@@%282%276%319%273%273%272%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%272%273%272%342@@@@@@@@@%313@@@@@@@%281%251$0@%406@@%282%276%319%273%273%273%273%272%272%342@@@@@@@@@%282%276%319%272%272%272%272%273%272%342@@@@@@@@@%282%276%319%273%272%273%272%273%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%272%342@@@@@@@@@%313@@@@@%281%251$0@%409@@%282%276%319%272%272%273%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%273%272%272%342@@@@@@@@@%282%276%319%273%272%273%273%272%272%342@@@@@@@@@%282%276%319%272%273%272%273%272%272%342@@@@@@@@@%282%276%319%273%273%272%272%272%272%342@@@@@@@@@%313@@@@@@%281%251$0@%408@@%282%276%319%273%272%272%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%273%272%272%342@@@@@@@@@%282%276%319%273%272%273%272%272%272%342@@@@@@@@@%282%276%319%273%273%272%272%273%272%342@@@@@@@@@%313@@@@@%281%251$0@%410@@%282%276%319%273%272%273%272%273%272%342@@@@@@@@@%282%276%319%273%272%273%273%272%272%342@@@@@@@@@%282%276%319%272%272%273%272%273%272%342@@@@@@@@@%313@@@@%281%221%256$0@%404@@%224$0@%400@@@$2$0@@%281%221%256$0@%405@@%224$0@%401@@@$1$0@@%282%276%319%272%273%273%272%273%272%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@|@"])
  fun op elf_pf_x_def x = x
    val op elf_pf_x_def =
    DT(((("elf_program_header_table",13),[]),[]),
       [read"%251%398@%319%272%342@@@"])
  fun op elf_pf_w_def x = x
    val op elf_pf_w_def =
    DT(((("elf_program_header_table",14),[]),[]),
       [read"%251%397@%319%273%342@@@"])
  fun op elf_pf_r_def x = x
    val op elf_pf_r_def =
    DT(((("elf_program_header_table",15),[]),[]),
       [read"%251%396@%319%273%272%342@@@@"])
  fun op elf_pf_maskos_def x = x
    val op elf_pf_maskos_def =
    DT(((("elf_program_header_table",16),[]),[]),
       [read"%251%394@%319%273%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%273%273%273%273%273%273%273%342@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf_pf_maskproc_def x = x
    val op elf_pf_maskproc_def =
    DT(((("elf_program_header_table",17),[]),[]),
       [read"%251%395@%198%319%273%272%342@@@@%319%273%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%272%273%273%273%342@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op exact_permissions_of_permission_def x = x
    val op exact_permissions_of_permission_def =
    DT(((("elf_program_header_table",18),[]),[]),
       [read"%195%139%239%423$0@@%280%251$0@%222@@%469%222@@%280%251$0@%398@@%469%319%272%342@@@@%280%251$0@%397@@%469%319%273%342@@@@%280%251$0@%396@@%469%319%273%272%342@@@@@%280%251$0@%199%398@%397@@@%469%319%272%272%342@@@@@%280%251$0@%199%398@%396@@@%469%319%272%273%342@@@@@%280%251$0@%199%397@%396@@@%469%319%273%273%342@@@@@%280%251$0@%199%199%398@%396@@%397@@@%469%319%272%272%272%342@@@@@@%425%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%273%273%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op allowable_permissions_of_permission_def x = x
    val op allowable_permissions_of_permission_def =
    DT(((("elf_program_header_table",19),[]),[]),
       [read"%195%139%239%343$0@@%280%251$0@%222@@%469%222@@%280%251$0@%398@@%469%319%272%273%342@@@@@%280%251$0@%397@@%469%319%272%272%272%342@@@@@@%280%251$0@%396@@%469%319%272%273%342@@@@@%280%251$0@%199%398@%397@@@%469%319%272%272%272%342@@@@@@%280%251$0@%199%398@%396@@@%469%319%272%273%342@@@@@%280%251$0@%199%397@%396@@@%469%319%272%272%272%342@@@@@@%280%251$0@%199%199%398@%396@@%397@@@%469%319%272%272%272%342@@@@@@%425%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%273%273%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op string_of_elf_segment_permissions_def x = x
    val op string_of_elf_segment_permissions_def =
    DT(((("elf_program_header_table",20),[]),[]),
       [read"%195%139%250%481$0@@%281%251$0@%222@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@%281%251$0@%398@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%273%272%272%272%342@@@@@@@@@%313@@@@%281%251$0@%397@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%272%273%273%272%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@%281%251$0@%396@@%282%276%319%273%273%272%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@%281%251$0@%199%398@%397@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%272%273%273%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%272%342@@@@@@@@@%313@@@@%281%251$0@%199%398@%396@@@%282%276%319%273%273%272%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%273%272%272%272%342@@@@@@@@@%313@@@@%281%251$0@%199%397@%396@@@%282%276%319%273%273%272%272%273%272%342@@@@@@@@@%282%276%319%272%272%272%273%273%272%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@%281%251$0@%199%199%398@%396@@%397@@@%282%276%319%273%273%272%272%273%272%342@@@@@@@@@%282%276%319%272%272%272%273%273%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%272%342@@@@@@@@@%313@@@@%282%276%319%272%273%272%273%272%272%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op elf32_program_header_table_entry_TY_DEF x = x
    val op elf32_program_header_table_entry_TY_DEF =
    DT(((("elf_program_header_table",21),[("bool",[26])]),["DISK_THM"]),
       [read"%262%159%333%13%192%0%255%197%13%255%258%10%258%14%258%17%258%21%258%25%258%29%258%33%258%37%254$8@%10%14%17%21%25%29%33%37%289%222@%213$7@%212$6@%211$5@%210$4@%209$3@%207$2@%205$1@$0@@@@@@@@%142%275|@||||||||$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_program_header_table_entry_case_def x = x
    val op elf32_program_header_table_entry_case_def =
    DT(((("elf_program_header_table",25),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%10%177%14%177%17%177%21%177%25%177%29%177%33%177%37%186%119%225%358%464$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_size_def x = x
    val op elf32_program_header_table_entry_size_def =
    DT(((("elf_program_header_table",26),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%10%177%14%177%17%177%21%177%25%177%29%177%33%177%37%251%375%464$7@$6@$5@$4@$3@$2@$1@$0@@@%319%272%342@@@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_type x = x
    val op elf32_program_header_table_entry_elf32_p_type =
    DT(((("elf_program_header_table",27),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%371%464$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_offset x = x
    val op elf32_program_header_table_entry_elf32_p_offset =
    DT(((("elf_program_header_table",28),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%367%464$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_vaddr x = x
    val op elf32_program_header_table_entry_elf32_p_vaddr =
    DT(((("elf_program_header_table",29),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%373%464$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_paddr x = x
    val op elf32_program_header_table_entry_elf32_p_paddr =
    DT(((("elf_program_header_table",30),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%369%464$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_filesz x = x
    val op elf32_program_header_table_entry_elf32_p_filesz =
    DT(((("elf_program_header_table",31),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%361%464$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_memsz x = x
    val op elf32_program_header_table_entry_elf32_p_memsz =
    DT(((("elf_program_header_table",32),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%365%464$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_flags x = x
    val op elf32_program_header_table_entry_elf32_p_flags =
    DT(((("elf_program_header_table",33),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%363%464$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_align x = x
    val op elf32_program_header_table_entry_elf32_p_align =
    DT(((("elf_program_header_table",34),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%359%464$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_type_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_type_fupd =
    DT(((("elf_program_header_table",36),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%372$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$8$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_offset_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_offset_fupd =
    DT(((("elf_program_header_table",37),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%368$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$8$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_vaddr_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_vaddr_fupd =
    DT(((("elf_program_header_table",38),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%374$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$6@$8$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_paddr_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_paddr_fupd =
    DT(((("elf_program_header_table",39),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%370$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$6@$5@$8$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_filesz_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_filesz_fupd =
    DT(((("elf_program_header_table",40),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%362$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$6@$5@$4@$8$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_memsz_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_memsz_fupd =
    DT(((("elf_program_header_table",41),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%366$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$6@$5@$4@$3@$8$2@@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_flags_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_flags_fupd =
    DT(((("elf_program_header_table",42),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%364$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$6@$5@$4@$3@$2@$8$1@@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_align_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_align_fupd =
    DT(((("elf_program_header_table",43),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%360$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$6@$5@$4@$3@$2@$1@$8$0@@@|@|@|@|@|@|@|@|@|@"])
  fun op compare_elf32_program_header_table_entry_def x = x
    val op compare_elf32_program_header_table_entry_def =
    DT(((("elf_program_header_table",62),[]),[]),
       [read"%178%135%178%137%252%355$1@$0@@%439%427%223@%251@@%287%485%371$1@@@%287%485%367$1@@@%287%485%373$1@@@%287%485%369$1@@@%287%485%361$1@@@%287%485%365$1@@@%287%485%363$1@@@%287%485%359$1@@@%318@@@@@@@@@%287%485%371$0@@@%287%485%367$0@@@%287%485%373$0@@@%287%485%369$0@@@%287%485%361$0@@@%287%485%365$0@@@%287%485%363$0@@@%287%485%359$0@@@%318@@@@@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict_def
    =
    DT(((("elf_program_header_table",63),[]),[]),
       [read"%226%434@%320%301%355@@%328%300%122%124%252%355$1@$0@@%308@||@@%326%300%122%124%296%355$1@$0@@%297%308@%297%292@%291@@@||@@%324%300%122%124%252%355$1@$0@@%295@||@@%322%300%122%124%296%355$1@$0@@%297%295@%297%292@%291@@@||@@%266@@@@@@"])
  fun op elf64_program_header_table_entry_TY_DEF x = x
    val op elf64_program_header_table_entry_TY_DEF =
    DT(((("elf_program_header_table",64),[("bool",[26])]),["DISK_THM"]),
       [read"%264%160%332%12%191%1%255%196%12%255%258%10%258%14%257%16%257%20%257%24%257%28%257%32%257%36%253$8@%10%14%16%20%24%28%32%36%288%222@%208$7@%206$6@%204$5@%203$4@%202$3@%201$2@%200$1@$0@@@@@@@@%142%274|@||||||||$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_program_header_table_entry_case_def x = x
    val op elf64_program_header_table_entry_case_def =
    DT(((("elf_program_header_table",68),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%10%177%14%176%16%176%20%176%24%176%28%176%32%176%36%185%118%225%376%465$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_size_def x = x
    val op elf64_program_header_table_entry_size_def =
    DT(((("elf_program_header_table",69),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%10%177%14%176%16%176%20%176%24%176%28%176%32%176%36%251%393%465$7@$6@$5@$4@$3@$2@$1@$0@@@%319%272%342@@@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_type x = x
    val op elf64_program_header_table_entry_elf64_p_type =
    DT(((("elf_program_header_table",70),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%233%389%465$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_flags x = x
    val op elf64_program_header_table_entry_elf64_p_flags =
    DT(((("elf_program_header_table",71),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%233%381%465$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_offset x = x
    val op elf64_program_header_table_entry_elf64_p_offset =
    DT(((("elf_program_header_table",72),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%232%385%465$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_vaddr x = x
    val op elf64_program_header_table_entry_elf64_p_vaddr =
    DT(((("elf_program_header_table",73),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%232%391%465$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_paddr x = x
    val op elf64_program_header_table_entry_elf64_p_paddr =
    DT(((("elf_program_header_table",74),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%232%387%465$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_filesz x = x
    val op elf64_program_header_table_entry_elf64_p_filesz =
    DT(((("elf_program_header_table",75),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%232%379%465$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_memsz x = x
    val op elf64_program_header_table_entry_elf64_p_memsz =
    DT(((("elf_program_header_table",76),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%232%383%465$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_align x = x
    val op elf64_program_header_table_entry_elf64_p_align =
    DT(((("elf_program_header_table",77),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%232%377%465$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_type_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_type_fupd =
    DT(((("elf_program_header_table",79),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%184%117%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%390$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$8$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_flags_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_flags_fupd =
    DT(((("elf_program_header_table",80),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%184%117%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%382$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$8$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_offset_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_offset_fupd =
    DT(((("elf_program_header_table",81),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%183%116%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%386$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$6@$8$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_vaddr_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_vaddr_fupd =
    DT(((("elf_program_header_table",82),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%183%116%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%392$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$6@$5@$8$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_paddr_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_paddr_fupd =
    DT(((("elf_program_header_table",83),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%183%116%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%388$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$6@$5@$4@$8$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_filesz_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_filesz_fupd =
    DT(((("elf_program_header_table",84),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%183%116%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%380$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$6@$5@$4@$3@$8$2@@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_memsz_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_memsz_fupd =
    DT(((("elf_program_header_table",85),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%183%116%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%384$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$6@$5@$4@$3@$2@$8$1@@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_align_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_align_fupd =
    DT(((("elf_program_header_table",86),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%183%116%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%378$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$6@$5@$4@$3@$2@$1@$8$0@@@|@|@|@|@|@|@|@|@|@"])
  fun op compare_elf64_program_header_table_entry_def x = x
    val op compare_elf64_program_header_table_entry_def =
    DT(((("elf_program_header_table",105),[]),[]),
       [read"%179%136%179%138%252%356$1@$0@@%439%427%223@%251@@%287%485%389$1@@@%287%484%385$1@@@%287%484%391$1@@@%287%484%387$1@@@%287%484%379$1@@@%287%484%383$1@@@%287%485%381$1@@@%287%484%377$1@@@%318@@@@@@@@@%287%485%389$0@@@%287%484%385$0@@@%287%484%391$0@@@%287%484%387$0@@@%287%484%379$0@@@%287%484%383$0@@@%287%485%381$0@@@%287%484%377$0@@@%318@@@@@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict_def
    =
    DT(((("elf_program_header_table",106),[]),[]),
       [read"%227%435@%321%304%356@@%329%303%123%125%252%356$1@$0@@%308@||@@%327%303%123%125%296%356$1@$0@@%297%308@%297%292@%291@@@||@@%325%303%123%125%252%356$1@$0@@%295@||@@%323%303%123%125%296%356$1@$0@@%297%295@%297%292@%291@@@||@@%267@@@@@@"])
  fun op string_of_elf32_program_header_table_entry_def x = x
    val op string_of_elf32_program_header_table_entry_def =
    DT(((("elf_program_header_table",107),[]),[]),
       [read"%190%146%190%155%178%114%250%476$2@$1@$0@@%483%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%272%272%273%272%273%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@@@@@@@%482$2@$1@%485%371$0@@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%272%272%272%272%273%272%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@%448%440@%485@%367$0@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%273%273%273%272%273%272%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@@@@@@@@@@%448%440@%485@%373$0@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%273%272%272%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@@@@@@@@@@@%448%440@%485@%369$0@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%272%272%273%272%273%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%273%272%342@@@@@@@@%282%276%319%273%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%273%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%342@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@%448%440@%485@%361$0@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%272%272%273%272%273%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%273%272%342@@@@@@@@%282%276%319%273%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%273%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%342@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%448%440@%485@%365$0@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%273%273%273%272%272%272%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@%448%440@%485@%363$0@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%272%273%272%272%272%272%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@@@@%448%440@%485@%359$0@@@@@%317@@@@@@@@@@|@|@|@"])
  fun op string_of_elf64_program_header_table_entry_def x = x
    val op string_of_elf64_program_header_table_entry_def =
    DT(((("elf_program_header_table",108),[]),[]),
       [read"%190%146%190%155%179%115%250%479$2@$1@$0@@%483%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%272%272%273%272%273%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@@@@@@@%482$2@$1@%485%389$0@@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%272%272%272%272%273%272%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@%447%440@%484@%385$0@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%273%273%273%272%273%272%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@@@@@@@@@@%447%440@%484@%391$0@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%273%272%272%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@@@@@@@@@@@%447%440@%484@%387$0@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%272%272%273%272%273%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%273%272%342@@@@@@@@%282%276%319%273%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%273%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%342@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@%447%440@%484@%379$0@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%272%272%273%272%273%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%273%272%342@@@@@@@@%282%276%319%273%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%273%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%342@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%447%440@%484@%383$0@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%273%273%273%272%272%272%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@%448%440@%485@%381$0@@@@@%286%265%282%276%319%272%273%272%342@@@@@@%313@@%265%282%276%319%272%273%272%272%272%272%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%313@@@@@@@@@@@@%447%440@%484@%377$0@@@@@%317@@@@@@@@@@|@|@|@"])
  fun op string_of_elf32_program_header_table_entry_default_def x = x
    val op string_of_elf32_program_header_table_entry_default_def =
    DT(((("elf_program_header_table",109),[]),[]),
       [read"%247%477@%476%306%282%276%319%273%273%272%273%272%342@@@@@@@@%282%276%319%273%272%273%272%272%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%272%272%273%272%342@@@@@@@@@%282%276%319%272%272%273%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%272%342@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%306%282%276%319%273%273%272%273%272%342@@@@@@@@%282%276%319%273%272%273%272%272%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%272%342@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op string_of_elf64_program_header_table_entry_default_def x = x
    val op string_of_elf64_program_header_table_entry_default_def =
    DT(((("elf_program_header_table",110),[]),[]),
       [read"%249%480@%479%306%282%276%319%273%273%272%273%272%342@@@@@@@@%282%276%319%273%272%273%272%272%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%272%272%273%272%342@@@@@@@@@%282%276%319%272%272%273%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%272%342@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%306%282%276%319%273%273%272%273%272%342@@@@@@@@%282%276%319%273%272%273%272%272%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%272%342@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun
    op instance_Show_Show_Elf_program_header_table_elf32_program_header_table_entry_dict_def
    x = x
    val
    op instance_Show_Show_Elf_program_header_table_elf32_program_header_table_entry_dict_def
    =
    DT(((("elf_program_header_table",111),[]),[]),
       [read"%228%436@%330%302%477@@%268@@"])
  fun
    op instance_Show_Show_Elf_program_header_table_elf64_program_header_table_entry_dict_def
    x = x
    val
    op instance_Show_Show_Elf_program_header_table_elf64_program_header_table_entry_dict_def
    =
    DT(((("elf_program_header_table",112),[]),[]),
       [read"%229%437@%331%305%480@@%269@@"])
  fun op bytes_of_elf32_program_header_table_entry_def x = x
    val op bytes_of_elf32_program_header_table_entry_def =
    DT(((("elf_program_header_table",113),[]),[]),
       [read"%180%113%178%114%231%347$1@$0@@%426%285%348$1@%371$0@@@%285%345$1@%367$0@@@%285%344$1@%373$0@@@%285%344$1@%369$0@@@%285%348$1@%361$0@@@%285%348$1@%365$0@@@%285%348$1@%363$0@@@%285%348$1@%359$0@@@%316@@@@@@@@@@|@|@"])
  fun op bytes_of_elf64_program_header_table_entry_def x = x
    val op bytes_of_elf64_program_header_table_entry_def =
    DT(((("elf_program_header_table",114),[]),[]),
       [read"%180%113%179%115%231%352$1@$0@@%426%285%353$1@%389$0@@@%285%353$1@%381$0@@@%285%350$1@%385$0@@@%285%349$1@%391$0@@@%285%349$1@%387$0@@@%285%354$1@%379$0@@@%285%354$1@%383$0@@@%285%354$1@%377$0@@@%316@@@@@@@@@@|@|@"])
  fun op read_elf32_program_header_table_entry_def x = x
    val op read_elf32_program_header_table_entry_def =
    DT(((("elf_program_header_table",115),[]),[]),
       [read"%180%113%175%42%240%455$1@$0@@%419%456$1@$0@@%337%170%42%419%452$3@$0@@%337%145%42%419%451$5@$0@@%337%174%42%419%451$7@$0@@%337%150%42%419%456$9@$0@@%337%127%42%419%456$11@$0@@%337%141%42%419%456$13@$0@@%337%128%42%419%456$15@$0@@%337%41%42%470%214%372%299$15@@%368%299$13@@%374%299$11@@%370%299$9@@%362%299$7@@%366%299$5@@%364%299$3@@%360%299$1@@%270@@@@@@@@@$0@@||@@||@@||@@||@@||@@||@@||@@||@@@|@|@"])
  fun op read_elf64_program_header_table_entry_def x = x
    val op read_elf64_program_header_table_entry_def =
    DT(((("elf_program_header_table",116),[]),[]),
       [read"%180%113%175%42%241%461$1@$0@@%420%462$1@$0@@%338%170%42%420%462$3@$0@@%338%128%42%418%458$5@$0@@%336%144%42%418%457$7@$0@@%336%173%42%418%457$9@$0@@%336%149%42%418%463$11@$0@@%336%126%42%418%463$13@$0@@%336%140%42%418%463$15@$0@@%336%40%42%471%215%390%299$15@@%386%298$11@@%392%298$9@@%388%298$7@@%380%298$5@@%384%298$3@@%382%299$13@@%378%298$1@@%271@@@@@@@@@$0@@||@@||@@||@@||@@||@@||@@||@@||@@@|@|@"])
  fun op bytes_of_elf32_program_header_table_def x = x
    val op bytes_of_elf32_program_header_table_def =
    DT(((("elf_program_header_table",117),[]),[]),
       [read"%180%113%193%168%231%346$1@$0@@%357%309%347$1@@$0@@@|@|@"])
  fun op bytes_of_elf64_program_header_table_def x = x
    val op bytes_of_elf64_program_header_table_def =
    DT(((("elf_program_header_table",118),[]),[]),
       [read"%180%113%194%169%231%351$1@$0@@%357%311%352$1@@$0@@@|@|@"])
  fun op read_elf32_program_header_table_def x = x
    val op read_elf32_program_header_table_def =
    DT(((("elf_program_header_table",127),[]),[]),
       [read"%195%165%180%113%175%43%242%453$2@$1@$0@@%416%450$2@$0@@%334%92%161%413%454$3@$1@@%163%472%218$0@$1@@|@||@@@|@|@|@"])
  fun op read_elf64_program_header_table_def x = x
    val op read_elf64_program_header_table_def =
    DT(((("elf_program_header_table",128),[]),[]),
       [read"%195%165%180%113%175%43%243%459$2@$1@$0@@%417%450$2@$0@@%335%92%161%415%460$3@$1@@%164%473%219$0@$1@@|@||@@@|@|@|@"])
  fun op string_of_elf32_program_header_table_def x = x
    val op string_of_elf32_program_header_table_def =
    DT(((("elf_program_header_table",129),[("pair",[16])]),["DISK_THM"]),
       [read"%190%146%190%155%193%168%250%475%217$2@$1@@$0@@%483%310%476$2@$1@@$0@@@|@|@|@"])
  fun op string_of_elf64_program_header_table_def x = x
    val op string_of_elf64_program_header_table_def =
    DT(((("elf_program_header_table",130),[("pair",[16])]),["DISK_THM"]),
       [read"%190%146%190%155%194%169%250%478%217$2@$1@@$0@@%483%312%479$2@$1@@$0@@@|@|@|@"])
  fun op get_elf32_dynamic_linked_def x = x
    val op get_elf32_dynamic_linked_def =
    DT(((("elf_program_header_table",131),[]),[]),
       [read"%193%153%230%428$0@@%293%147%251%485%371$0@@@%402@|@$0@@|@"])
  fun op get_elf64_dynamic_linked_def x = x
    val op get_elf64_dynamic_linked_def =
    DT(((("elf_program_header_table",132),[]),[]),
       [read"%194%154%230%431$0@@%294%148%251%485%389$0@@@%402@|@$0@@|@"])
  fun op get_elf32_static_linked_def x = x
    val op get_elf32_static_linked_def =
    DT(((("elf_program_header_table",133),[]),[]),
       [read"%193%153%230%430$0@@%486%428$0@@@|@"])
  fun op get_elf64_static_linked_def x = x
    val op get_elf64_static_linked_def =
    DT(((("elf_program_header_table",134),[]),[]),
       [read"%194%154%230%433$0@@%486%431$0@@@|@"])
  fun op get_elf32_requested_interpreter_def x = x
    val op get_elf32_requested_interpreter_def =
    DT(((("elf_program_header_table",135),[]),[]),
       [read"%178%151%175%43%236%429$1@$0@@%277%251%485%371$1@@@%402@@%307%143%307%162%411%449$1@%220$0@%319%272%342@@@@$2@@%85%466%474$0@@|@|@%485%361$2@@@|@%485%367$1@@@@%424%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%272%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%342@@@@@@@@%282%276%319%273%273%272%272%273%342@@@@@@@@%282%276%319%272%272%272%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%273%272%272%342@@@@@@@@@%282%276%319%273%273%273%273%272%272%342@@@@@@@@@%282%276%319%273%272%273%272%273%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%272%342@@@@@@@@@%282%276%319%273%273%272%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@"])
  fun op get_elf64_requested_interpreter_def x = x
    val op get_elf64_requested_interpreter_def =
    DT(((("elf_program_header_table",136),[]),[]),
       [read"%179%152%175%43%236%432$1@$0@@%277%251%485%389$1@@@%402@@%307%143%307%162%411%449$1@%220$0@%319%272%342@@@@$2@@%85%466%474$0@@|@|@%484%379$2@@@|@%484%385$1@@@@%424%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%272%272%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%272%273%342@@@@@@@@%282%276%319%273%272%273%272%273%342@@@@@@@@%282%276%319%272%272%272%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%273%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%282%276%319%273%273%272%273%273%342@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%272%272%272%273%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%273%272%273%272%272%342@@@@@@@@@%282%276%319%273%273%273%273%272%272%342@@@@@@@@@%282%276%319%273%272%273%272%273%272%342@@@@@@@@@%282%276%319%272%273%273%272%272%272%342@@@@@@@@@%282%276%319%273%273%272%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%272%273%272%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%272%272%273%272%273%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%273%273%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%273%273%342@@@@@@@@@%282%276%319%273%272%272%272%272%342@@@@@@@@%282%276%319%273%272%272%273%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%272%272%272%273%342@@@@@@@@@%282%276%319%273%272%273%272%272%273%342@@@@@@@@@%282%276%319%272%273%273%272%272%273%342@@@@@@@@@%282%276%319%273%273%272%272%273%273%342@@@@@@@@@%313@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@"])
  fun op elf32_program_header_table_entry_accessors x = x
    val op elf32_program_header_table_entry_accessors =
    DT(((("elf_program_header_table",35),
        [("elf_program_header_table",
         [27,28,29,30,31,32,33,34])]),["DISK_THM"]),
       [read"%221%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%371%464$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@@%221%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%367%464$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@@%221%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%373%464$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@@%221%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%369%464$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@@%221%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%361%464$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@@%221%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%365%464$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@@%221%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%363%464$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@@%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%233%359%464$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@@@@@@@@"])
  fun op elf32_program_header_table_entry_fn_updates x = x
    val op elf32_program_header_table_entry_fn_updates =
    DT(((("elf_program_header_table",44),
        [("elf_program_header_table",
         [36,37,38,39,40,41,42,43])]),["DISK_THM"]),
       [read"%221%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%372$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$8$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%368$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$8$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%374$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$6@$8$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%370$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$6@$5@$8$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%362$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$6@$5@$4@$8$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%366$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$6@$5@$4@$3@$8$2@@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%364$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$6@$5@$4@$3@$2@$8$1@@$0@@|@|@|@|@|@|@|@|@|@@%184%117%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82%234%360$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%464$7@$6@$5@$4@$3@$2@$1@$8$0@@@|@|@|@|@|@|@|@|@|@@@@@@@@"])
  fun op elf32_program_header_table_entry_accfupds x = x
    val op elf32_program_header_table_entry_accfupds =
    DT(((("elf_program_header_table",45),
        [("bool",[25,26,55,180]),
         ("elf_program_header_table",[22,23,24,35,44])]),["DISK_THM"]),
       [read"%221%184%117%178%86%233%371%368$1@$0@@@%371$0@@|@|@@%221%184%117%178%86%233%371%374$1@$0@@@%371$0@@|@|@@%221%184%117%178%86%233%371%370$1@$0@@@%371$0@@|@|@@%221%184%117%178%86%233%371%362$1@$0@@@%371$0@@|@|@@%221%184%117%178%86%233%371%366$1@$0@@@%371$0@@|@|@@%221%184%117%178%86%233%371%364$1@$0@@@%371$0@@|@|@@%221%184%117%178%86%233%371%360$1@$0@@@%371$0@@|@|@@%221%184%117%178%86%233%367%372$1@$0@@@%367$0@@|@|@@%221%184%117%178%86%233%367%374$1@$0@@@%367$0@@|@|@@%221%184%117%178%86%233%367%370$1@$0@@@%367$0@@|@|@@%221%184%117%178%86%233%367%362$1@$0@@@%367$0@@|@|@@%221%184%117%178%86%233%367%366$1@$0@@@%367$0@@|@|@@%221%184%117%178%86%233%367%364$1@$0@@@%367$0@@|@|@@%221%184%117%178%86%233%367%360$1@$0@@@%367$0@@|@|@@%221%184%117%178%86%233%373%372$1@$0@@@%373$0@@|@|@@%221%184%117%178%86%233%373%368$1@$0@@@%373$0@@|@|@@%221%184%117%178%86%233%373%370$1@$0@@@%373$0@@|@|@@%221%184%117%178%86%233%373%362$1@$0@@@%373$0@@|@|@@%221%184%117%178%86%233%373%366$1@$0@@@%373$0@@|@|@@%221%184%117%178%86%233%373%364$1@$0@@@%373$0@@|@|@@%221%184%117%178%86%233%373%360$1@$0@@@%373$0@@|@|@@%221%184%117%178%86%233%369%372$1@$0@@@%369$0@@|@|@@%221%184%117%178%86%233%369%368$1@$0@@@%369$0@@|@|@@%221%184%117%178%86%233%369%374$1@$0@@@%369$0@@|@|@@%221%184%117%178%86%233%369%362$1@$0@@@%369$0@@|@|@@%221%184%117%178%86%233%369%366$1@$0@@@%369$0@@|@|@@%221%184%117%178%86%233%369%364$1@$0@@@%369$0@@|@|@@%221%184%117%178%86%233%369%360$1@$0@@@%369$0@@|@|@@%221%184%117%178%86%233%361%372$1@$0@@@%361$0@@|@|@@%221%184%117%178%86%233%361%368$1@$0@@@%361$0@@|@|@@%221%184%117%178%86%233%361%374$1@$0@@@%361$0@@|@|@@%221%184%117%178%86%233%361%370$1@$0@@@%361$0@@|@|@@%221%184%117%178%86%233%361%366$1@$0@@@%361$0@@|@|@@%221%184%117%178%86%233%361%364$1@$0@@@%361$0@@|@|@@%221%184%117%178%86%233%361%360$1@$0@@@%361$0@@|@|@@%221%184%117%178%86%233%365%372$1@$0@@@%365$0@@|@|@@%221%184%117%178%86%233%365%368$1@$0@@@%365$0@@|@|@@%221%184%117%178%86%233%365%374$1@$0@@@%365$0@@|@|@@%221%184%117%178%86%233%365%370$1@$0@@@%365$0@@|@|@@%221%184%117%178%86%233%365%362$1@$0@@@%365$0@@|@|@@%221%184%117%178%86%233%365%364$1@$0@@@%365$0@@|@|@@%221%184%117%178%86%233%365%360$1@$0@@@%365$0@@|@|@@%221%184%117%178%86%233%363%372$1@$0@@@%363$0@@|@|@@%221%184%117%178%86%233%363%368$1@$0@@@%363$0@@|@|@@%221%184%117%178%86%233%363%374$1@$0@@@%363$0@@|@|@@%221%184%117%178%86%233%363%370$1@$0@@@%363$0@@|@|@@%221%184%117%178%86%233%363%362$1@$0@@@%363$0@@|@|@@%221%184%117%178%86%233%363%366$1@$0@@@%363$0@@|@|@@%221%184%117%178%86%233%363%360$1@$0@@@%363$0@@|@|@@%221%184%117%178%86%233%359%372$1@$0@@@%359$0@@|@|@@%221%184%117%178%86%233%359%368$1@$0@@@%359$0@@|@|@@%221%184%117%178%86%233%359%374$1@$0@@@%359$0@@|@|@@%221%184%117%178%86%233%359%370$1@$0@@@%359$0@@|@|@@%221%184%117%178%86%233%359%362$1@$0@@@%359$0@@|@|@@%221%184%117%178%86%233%359%366$1@$0@@@%359$0@@|@|@@%221%184%117%178%86%233%359%364$1@$0@@@%359$0@@|@|@@%221%184%117%178%86%233%371%372$1@$0@@@$1%371$0@@@|@|@@%221%184%117%178%86%233%367%368$1@$0@@@$1%367$0@@@|@|@@%221%184%117%178%86%233%373%374$1@$0@@@$1%373$0@@@|@|@@%221%184%117%178%86%233%369%370$1@$0@@@$1%369$0@@@|@|@@%221%184%117%178%86%233%361%362$1@$0@@@$1%361$0@@@|@|@@%221%184%117%178%86%233%365%366$1@$0@@@$1%365$0@@@|@|@@%221%184%117%178%86%233%363%364$1@$0@@@$1%363$0@@@|@|@@%184%117%178%86%233%359%360$1@$0@@@$1%359$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_program_header_table_entry_fupdfupds x = x
    val op elf32_program_header_table_entry_fupdfupds =
    DT(((("elf_program_header_table",46),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_program_header_table",[22,23,24,44])]),["DISK_THM"]),
       [read"%221%184%132%184%117%178%86%234%372$1@%372$2@$0@@@%372%442$1@$2@@$0@@|@|@|@@%221%184%132%184%117%178%86%234%368$1@%368$2@$0@@@%368%442$1@$2@@$0@@|@|@|@@%221%184%132%184%117%178%86%234%374$1@%374$2@$0@@@%374%442$1@$2@@$0@@|@|@|@@%221%184%132%184%117%178%86%234%370$1@%370$2@$0@@@%370%442$1@$2@@$0@@|@|@|@@%221%184%132%184%117%178%86%234%362$1@%362$2@$0@@@%362%442$1@$2@@$0@@|@|@|@@%221%184%132%184%117%178%86%234%366$1@%366$2@$0@@@%366%442$1@$2@@$0@@|@|@|@@%221%184%132%184%117%178%86%234%364$1@%364$2@$0@@@%364%442$1@$2@@$0@@|@|@|@@%184%132%184%117%178%86%234%360$1@%360$2@$0@@@%360%442$1@$2@@$0@@|@|@|@@@@@@@@"])
  fun op elf32_program_header_table_entry_fupdfupds_comp x = x
    val op elf32_program_header_table_entry_fupdfupds_comp =
    DT(((("elf_program_header_table",47),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_program_header_table",[22,23,24,44])]),["DISK_THM"]),
       [read"%221%221%184%132%184%117%246%444%372$0@@%372$1@@@%372%442$0@$1@@@|@|@@%181%133%184%132%184%117%244%443%372$0@@%443%372$1@@$2@@@%443%372%442$0@$1@@@$2@@|@|@|@@@%221%221%184%132%184%117%246%444%368$0@@%368$1@@@%368%442$0@$1@@@|@|@@%181%133%184%132%184%117%244%443%368$0@@%443%368$1@@$2@@@%443%368%442$0@$1@@@$2@@|@|@|@@@%221%221%184%132%184%117%246%444%374$0@@%374$1@@@%374%442$0@$1@@@|@|@@%181%133%184%132%184%117%244%443%374$0@@%443%374$1@@$2@@@%443%374%442$0@$1@@@$2@@|@|@|@@@%221%221%184%132%184%117%246%444%370$0@@%370$1@@@%370%442$0@$1@@@|@|@@%181%133%184%132%184%117%244%443%370$0@@%443%370$1@@$2@@@%443%370%442$0@$1@@@$2@@|@|@|@@@%221%221%184%132%184%117%246%444%362$0@@%362$1@@@%362%442$0@$1@@@|@|@@%181%133%184%132%184%117%244%443%362$0@@%443%362$1@@$2@@@%443%362%442$0@$1@@@$2@@|@|@|@@@%221%221%184%132%184%117%246%444%366$0@@%366$1@@@%366%442$0@$1@@@|@|@@%181%133%184%132%184%117%244%443%366$0@@%443%366$1@@$2@@@%443%366%442$0@$1@@@$2@@|@|@|@@@%221%221%184%132%184%117%246%444%364$0@@%364$1@@@%364%442$0@$1@@@|@|@@%181%133%184%132%184%117%244%443%364$0@@%443%364$1@@$2@@@%443%364%442$0@$1@@@$2@@|@|@|@@@%221%184%132%184%117%246%444%360$0@@%360$1@@@%360%442$0@$1@@@|@|@@%181%133%184%132%184%117%244%443%360$0@@%443%360$1@@$2@@@%443%360%442$0@$1@@@$2@@|@|@|@@@@@@@@@"])
  fun op elf32_program_header_table_entry_fupdcanon x = x
    val op elf32_program_header_table_entry_fupdcanon =
    DT(((("elf_program_header_table",48),
        [("bool",[25,26,55,180]),
         ("elf_program_header_table",[22,23,24,44])]),["DISK_THM"]),
       [read"%221%184%132%184%117%178%86%234%368$1@%372$2@$0@@@%372$2@%368$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%374$1@%372$2@$0@@@%372$2@%374$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%374$1@%368$2@$0@@@%368$2@%374$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%370$1@%372$2@$0@@@%372$2@%370$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%370$1@%368$2@$0@@@%368$2@%370$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%370$1@%374$2@$0@@@%374$2@%370$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%362$1@%372$2@$0@@@%372$2@%362$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%362$1@%368$2@$0@@@%368$2@%362$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%362$1@%374$2@$0@@@%374$2@%362$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%362$1@%370$2@$0@@@%370$2@%362$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%366$1@%372$2@$0@@@%372$2@%366$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%366$1@%368$2@$0@@@%368$2@%366$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%366$1@%374$2@$0@@@%374$2@%366$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%366$1@%370$2@$0@@@%370$2@%366$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%366$1@%362$2@$0@@@%362$2@%366$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%364$1@%372$2@$0@@@%372$2@%364$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%364$1@%368$2@$0@@@%368$2@%364$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%364$1@%374$2@$0@@@%374$2@%364$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%364$1@%370$2@$0@@@%370$2@%364$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%364$1@%362$2@$0@@@%362$2@%364$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%364$1@%366$2@$0@@@%366$2@%364$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%360$1@%372$2@$0@@@%372$2@%360$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%360$1@%368$2@$0@@@%368$2@%360$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%360$1@%374$2@$0@@@%374$2@%360$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%360$1@%370$2@$0@@@%370$2@%360$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%360$1@%362$2@$0@@@%362$2@%360$1@$0@@@|@|@|@@%221%184%132%184%117%178%86%234%360$1@%366$2@$0@@@%366$2@%360$1@$0@@@|@|@|@@%184%132%184%117%178%86%234%360$1@%364$2@$0@@@%364$2@%360$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_program_header_table_entry_fupdcanon_comp x = x
    val op elf32_program_header_table_entry_fupdcanon_comp =
    DT(((("elf_program_header_table",49),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_program_header_table",[22,23,24,44])]),["DISK_THM"]),
       [read"%221%221%184%132%184%117%246%444%368$0@@%372$1@@@%444%372$1@@%368$0@@@|@|@@%181%133%184%132%184%117%244%443%368$0@@%443%372$1@@$2@@@%443%372$1@@%443%368$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%374$0@@%372$1@@@%444%372$1@@%374$0@@@|@|@@%181%133%184%132%184%117%244%443%374$0@@%443%372$1@@$2@@@%443%372$1@@%443%374$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%374$0@@%368$1@@@%444%368$1@@%374$0@@@|@|@@%181%133%184%132%184%117%244%443%374$0@@%443%368$1@@$2@@@%443%368$1@@%443%374$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%370$0@@%372$1@@@%444%372$1@@%370$0@@@|@|@@%181%133%184%132%184%117%244%443%370$0@@%443%372$1@@$2@@@%443%372$1@@%443%370$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%370$0@@%368$1@@@%444%368$1@@%370$0@@@|@|@@%181%133%184%132%184%117%244%443%370$0@@%443%368$1@@$2@@@%443%368$1@@%443%370$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%370$0@@%374$1@@@%444%374$1@@%370$0@@@|@|@@%181%133%184%132%184%117%244%443%370$0@@%443%374$1@@$2@@@%443%374$1@@%443%370$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%362$0@@%372$1@@@%444%372$1@@%362$0@@@|@|@@%181%133%184%132%184%117%244%443%362$0@@%443%372$1@@$2@@@%443%372$1@@%443%362$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%362$0@@%368$1@@@%444%368$1@@%362$0@@@|@|@@%181%133%184%132%184%117%244%443%362$0@@%443%368$1@@$2@@@%443%368$1@@%443%362$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%362$0@@%374$1@@@%444%374$1@@%362$0@@@|@|@@%181%133%184%132%184%117%244%443%362$0@@%443%374$1@@$2@@@%443%374$1@@%443%362$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%362$0@@%370$1@@@%444%370$1@@%362$0@@@|@|@@%181%133%184%132%184%117%244%443%362$0@@%443%370$1@@$2@@@%443%370$1@@%443%362$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%366$0@@%372$1@@@%444%372$1@@%366$0@@@|@|@@%181%133%184%132%184%117%244%443%366$0@@%443%372$1@@$2@@@%443%372$1@@%443%366$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%366$0@@%368$1@@@%444%368$1@@%366$0@@@|@|@@%181%133%184%132%184%117%244%443%366$0@@%443%368$1@@$2@@@%443%368$1@@%443%366$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%366$0@@%374$1@@@%444%374$1@@%366$0@@@|@|@@%181%133%184%132%184%117%244%443%366$0@@%443%374$1@@$2@@@%443%374$1@@%443%366$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%366$0@@%370$1@@@%444%370$1@@%366$0@@@|@|@@%181%133%184%132%184%117%244%443%366$0@@%443%370$1@@$2@@@%443%370$1@@%443%366$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%366$0@@%362$1@@@%444%362$1@@%366$0@@@|@|@@%181%133%184%132%184%117%244%443%366$0@@%443%362$1@@$2@@@%443%362$1@@%443%366$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%364$0@@%372$1@@@%444%372$1@@%364$0@@@|@|@@%181%133%184%132%184%117%244%443%364$0@@%443%372$1@@$2@@@%443%372$1@@%443%364$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%364$0@@%368$1@@@%444%368$1@@%364$0@@@|@|@@%181%133%184%132%184%117%244%443%364$0@@%443%368$1@@$2@@@%443%368$1@@%443%364$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%364$0@@%374$1@@@%444%374$1@@%364$0@@@|@|@@%181%133%184%132%184%117%244%443%364$0@@%443%374$1@@$2@@@%443%374$1@@%443%364$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%364$0@@%370$1@@@%444%370$1@@%364$0@@@|@|@@%181%133%184%132%184%117%244%443%364$0@@%443%370$1@@$2@@@%443%370$1@@%443%364$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%364$0@@%362$1@@@%444%362$1@@%364$0@@@|@|@@%181%133%184%132%184%117%244%443%364$0@@%443%362$1@@$2@@@%443%362$1@@%443%364$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%364$0@@%366$1@@@%444%366$1@@%364$0@@@|@|@@%181%133%184%132%184%117%244%443%364$0@@%443%366$1@@$2@@@%443%366$1@@%443%364$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%360$0@@%372$1@@@%444%372$1@@%360$0@@@|@|@@%181%133%184%132%184%117%244%443%360$0@@%443%372$1@@$2@@@%443%372$1@@%443%360$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%360$0@@%368$1@@@%444%368$1@@%360$0@@@|@|@@%181%133%184%132%184%117%244%443%360$0@@%443%368$1@@$2@@@%443%368$1@@%443%360$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%360$0@@%374$1@@@%444%374$1@@%360$0@@@|@|@@%181%133%184%132%184%117%244%443%360$0@@%443%374$1@@$2@@@%443%374$1@@%443%360$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%360$0@@%370$1@@@%444%370$1@@%360$0@@@|@|@@%181%133%184%132%184%117%244%443%360$0@@%443%370$1@@$2@@@%443%370$1@@%443%360$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%360$0@@%362$1@@@%444%362$1@@%360$0@@@|@|@@%181%133%184%132%184%117%244%443%360$0@@%443%362$1@@$2@@@%443%362$1@@%443%360$0@@$2@@@|@|@|@@@%221%221%184%132%184%117%246%444%360$0@@%366$1@@@%444%366$1@@%360$0@@@|@|@@%181%133%184%132%184%117%244%443%360$0@@%443%366$1@@$2@@@%443%366$1@@%443%360$0@@$2@@@|@|@|@@@%221%184%132%184%117%246%444%360$0@@%364$1@@@%444%364$1@@%360$0@@@|@|@@%181%133%184%132%184%117%244%443%360$0@@%443%364$1@@$2@@@%443%364$1@@%443%360$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_program_header_table_entry_component_equality x = x
    val op elf32_program_header_table_entry_component_equality =
    DT(((("elf_program_header_table",50),
        [("bool",[25,26,50,55,62,180]),
         ("elf_program_header_table",[22,23,24,35]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%178%88%178%90%230%234$1@$0@@%221%233%371$1@@%371$0@@@%221%233%367$1@@%367$0@@@%221%233%373$1@@%373$0@@@%221%233%369$1@@%369$0@@@%221%233%361$1@@%361$0@@@%221%233%365$1@@%365$0@@@%221%233%363$1@@%363$0@@@%233%359$1@@%359$0@@@@@@@@@@|@|@"])
  fun op elf32_program_header_table_entry_updates_eq_literal x = x
    val op elf32_program_header_table_entry_updates_eq_literal =
    DT(((("elf_program_header_table",51),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_program_header_table",[22,23,24,44])]),["DISK_THM"]),
       [read"%178%86%177%82%177%78%177%72%177%66%177%60%177%54%177%48%177%46%234%372%299$7@@%368%299$6@@%374%299$5@@%370%299$4@@%362%299$3@@%366%299$2@@%364%299$1@@%360%299$0@@$8@@@@@@@@@%372%299$7@@%368%299$6@@%374%299$5@@%370%299$4@@%362%299$3@@%366%299$2@@%364%299$1@@%360%299$0@@%270@@@@@@@@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_literal_nchotomy x = x
    val op elf32_program_header_table_entry_literal_nchotomy =
    DT(((("elf_program_header_table",52),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_program_header_table",[22,23,24,44]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%178%86%258%82%258%78%258%72%258%66%258%60%258%54%258%48%258%46%234$8@%372%299$7@@%368%299$6@@%374%299$5@@%370%299$4@@%362%299$3@@%366%299$2@@%364%299$1@@%360%299$0@@%270@@@@@@@@@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf32_program_header_table_entry x = x
    val op FORALL_elf32_program_header_table_entry =
    DT(((("elf_program_header_table",53),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_program_header_table",[22,23,24,44]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%187%6%230%178%86$1$0@|@@%177%82%177%78%177%72%177%66%177%60%177%54%177%48%177%46$8%372%299$7@@%368%299$6@@%374%299$5@@%370%299$4@@%362%299$3@@%366%299$2@@%364%299$1@@%360%299$0@@%270@@@@@@@@@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf32_program_header_table_entry x = x
    val op EXISTS_elf32_program_header_table_entry =
    DT(((("elf_program_header_table",54),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_program_header_table",[22,23,24,44]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%187%6%230%259%86$1$0@|@@%258%82%258%78%258%72%258%66%258%60%258%54%258%48%258%46$8%372%299$7@@%368%299$6@@%374%299$5@@%370%299$4@@%362%299$3@@%366%299$2@@%364%299$1@@%360%299$0@@%270@@@@@@@@@|@|@|@|@|@|@|@|@@|@"])
  fun op elf32_program_header_table_entry_literal_11 x = x
    val op elf32_program_header_table_entry_literal_11 =
    DT(((("elf_program_header_table",55),
        [("combin",[12]),
         ("elf_program_header_table",[45,50])]),["DISK_THM"]),
       [read"%177%83%177%79%177%74%177%68%177%62%177%56%177%50%177%54%177%84%177%80%177%76%177%70%177%64%177%58%177%52%177%60%230%234%372%299$15@@%368%299$14@@%374%299$13@@%370%299$12@@%362%299$11@@%366%299$10@@%364%299$9@@%360%299$8@@%270@@@@@@@@@%372%299$7@@%368%299$6@@%374%299$5@@%370%299$4@@%362%299$3@@%366%299$2@@%364%299$1@@%360%299$0@@%270@@@@@@@@@@%221%233$15@$7@@%221%233$14@$6@@%221%233$13@$5@@%221%233$12@$4@@%221%233$11@$3@@%221%233$10@$2@@%221%233$9@$1@@%233$8@$0@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf32_program_header_table_entry x = x
    val op datatype_elf32_program_header_table_entry =
    DT(((("elf_program_header_table",56),
        [("bool",[25,170])]),["DISK_THM"]),
       [read"%290%158%103@%101@%99@%102@%100@%96@%98@%97@%95@@"])
  fun op elf32_program_header_table_entry_11 x = x
    val op elf32_program_header_table_entry_11 =
    DT(((("elf_program_header_table",57),
        [("bool",[26,50,55,62,180]),
         ("elf_program_header_table",[22,23,24]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%177%10%177%14%177%17%177%21%177%25%177%29%177%33%177%37%177%11%177%15%177%19%177%23%177%27%177%31%177%35%177%39%230%234%464$15@$14@$13@$12@$11@$10@$9@$8@@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%221%233$15@$7@@%221%233$14@$6@@%221%233$13@$5@@%221%233$12@$4@@%221%233$11@$3@@%221%233$10@$2@@%221%233$9@$1@@%233$8@$0@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_case_cong x = x
    val op elf32_program_header_table_entry_case_cong =
    DT(((("elf_program_header_table",58),
        [("bool",[26,180]),
         ("elf_program_header_table",[22,23,24,25])]),["DISK_THM"]),
       [read"%178%2%178%4%186%119%255%221%234$2@$1@@%177%10%177%14%177%17%177%21%177%25%177%29%177%33%177%37%255%234$9@%464$7@$6@$5@$4@$3@$2@$1@$0@@@%225$8$7@$6@$5@$4@$3@$2@$1@$0@@%121$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@@@%225%358$2@$0@@%358$1@%121@@@|@|@|@"])
  fun op elf32_program_header_table_entry_nchotomy x = x
    val op elf32_program_header_table_entry_nchotomy =
    DT(((("elf_program_header_table",59),
        [("bool",[26,180]),
         ("elf_program_header_table",[22,23,24])]),["DISK_THM"]),
       [read"%178%93%258%46%258%48%258%54%258%60%258%66%258%72%258%78%258%82%234$8@%464$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_Axiom x = x
    val op elf32_program_header_table_entry_Axiom =
    DT(((("elf_program_header_table",60),
        [("bool",[26,180]),("elf_program_header_table",[22,23,24]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%186%119%261%129%177%10%177%14%177%17%177%21%177%25%177%29%177%33%177%37%225$8%464$7@$6@$5@$4@$3@$2@$1@$0@@@$9$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_induction x = x
    val op elf32_program_header_table_entry_induction =
    DT(((("elf_program_header_table",61),
        [("bool",[26]),
         ("elf_program_header_table",[22,23,24])]),["DISK_THM"]),
       [read"%187%6%255%177%46%177%48%177%54%177%60%177%66%177%72%177%78%177%82$8%464$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@@%178%86$1$0@|@@|@"])
  fun op elf64_program_header_table_entry_accessors x = x
    val op elf64_program_header_table_entry_accessors =
    DT(((("elf_program_header_table",78),
        [("elf_program_header_table",
         [70,71,72,73,74,75,76,77])]),["DISK_THM"]),
       [read"%221%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%233%389%465$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@@%221%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%233%381%465$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@@%221%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%232%385%465$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@@%221%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%232%391%465$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@@%221%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%232%387%465$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@@%221%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%232%379%465$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@@%221%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%232%383%465$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@@%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%232%377%465$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@@@@@@@@"])
  fun op elf64_program_header_table_entry_fn_updates x = x
    val op elf64_program_header_table_entry_fn_updates =
    DT(((("elf_program_header_table",87),
        [("elf_program_header_table",
         [79,80,81,82,83,84,85,86])]),["DISK_THM"]),
       [read"%221%184%117%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%390$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$8$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%184%117%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%382$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$8$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%183%116%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%386$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$6@$8$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%183%116%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%392$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$6@$5@$8$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%183%116%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%388$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$6@$5@$4@$8$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%183%116%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%380$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$6@$5@$4@$3@$8$2@@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%183%116%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%384$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$6@$5@$4@$3@$2@$8$1@@$0@@|@|@|@|@|@|@|@|@|@@%183%116%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81%235%378$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%465$7@$6@$5@$4@$3@$2@$1@$8$0@@@|@|@|@|@|@|@|@|@|@@@@@@@@"])
  fun op elf64_program_header_table_entry_accfupds x = x
    val op elf64_program_header_table_entry_accfupds =
    DT(((("elf_program_header_table",88),
        [("bool",[25,26,55,180]),
         ("elf_program_header_table",[65,66,67,78,87])]),["DISK_THM"]),
       [read"%221%184%117%179%87%233%389%382$1@$0@@@%389$0@@|@|@@%221%183%116%179%87%233%389%386$1@$0@@@%389$0@@|@|@@%221%183%116%179%87%233%389%392$1@$0@@@%389$0@@|@|@@%221%183%116%179%87%233%389%388$1@$0@@@%389$0@@|@|@@%221%183%116%179%87%233%389%380$1@$0@@@%389$0@@|@|@@%221%183%116%179%87%233%389%384$1@$0@@@%389$0@@|@|@@%221%183%116%179%87%233%389%378$1@$0@@@%389$0@@|@|@@%221%184%117%179%87%233%381%390$1@$0@@@%381$0@@|@|@@%221%183%116%179%87%233%381%386$1@$0@@@%381$0@@|@|@@%221%183%116%179%87%233%381%392$1@$0@@@%381$0@@|@|@@%221%183%116%179%87%233%381%388$1@$0@@@%381$0@@|@|@@%221%183%116%179%87%233%381%380$1@$0@@@%381$0@@|@|@@%221%183%116%179%87%233%381%384$1@$0@@@%381$0@@|@|@@%221%183%116%179%87%233%381%378$1@$0@@@%381$0@@|@|@@%221%184%117%179%87%232%385%390$1@$0@@@%385$0@@|@|@@%221%184%117%179%87%232%385%382$1@$0@@@%385$0@@|@|@@%221%183%116%179%87%232%385%392$1@$0@@@%385$0@@|@|@@%221%183%116%179%87%232%385%388$1@$0@@@%385$0@@|@|@@%221%183%116%179%87%232%385%380$1@$0@@@%385$0@@|@|@@%221%183%116%179%87%232%385%384$1@$0@@@%385$0@@|@|@@%221%183%116%179%87%232%385%378$1@$0@@@%385$0@@|@|@@%221%184%117%179%87%232%391%390$1@$0@@@%391$0@@|@|@@%221%184%117%179%87%232%391%382$1@$0@@@%391$0@@|@|@@%221%183%116%179%87%232%391%386$1@$0@@@%391$0@@|@|@@%221%183%116%179%87%232%391%388$1@$0@@@%391$0@@|@|@@%221%183%116%179%87%232%391%380$1@$0@@@%391$0@@|@|@@%221%183%116%179%87%232%391%384$1@$0@@@%391$0@@|@|@@%221%183%116%179%87%232%391%378$1@$0@@@%391$0@@|@|@@%221%184%117%179%87%232%387%390$1@$0@@@%387$0@@|@|@@%221%184%117%179%87%232%387%382$1@$0@@@%387$0@@|@|@@%221%183%116%179%87%232%387%386$1@$0@@@%387$0@@|@|@@%221%183%116%179%87%232%387%392$1@$0@@@%387$0@@|@|@@%221%183%116%179%87%232%387%380$1@$0@@@%387$0@@|@|@@%221%183%116%179%87%232%387%384$1@$0@@@%387$0@@|@|@@%221%183%116%179%87%232%387%378$1@$0@@@%387$0@@|@|@@%221%184%117%179%87%232%379%390$1@$0@@@%379$0@@|@|@@%221%184%117%179%87%232%379%382$1@$0@@@%379$0@@|@|@@%221%183%116%179%87%232%379%386$1@$0@@@%379$0@@|@|@@%221%183%116%179%87%232%379%392$1@$0@@@%379$0@@|@|@@%221%183%116%179%87%232%379%388$1@$0@@@%379$0@@|@|@@%221%183%116%179%87%232%379%384$1@$0@@@%379$0@@|@|@@%221%183%116%179%87%232%379%378$1@$0@@@%379$0@@|@|@@%221%184%117%179%87%232%383%390$1@$0@@@%383$0@@|@|@@%221%184%117%179%87%232%383%382$1@$0@@@%383$0@@|@|@@%221%183%116%179%87%232%383%386$1@$0@@@%383$0@@|@|@@%221%183%116%179%87%232%383%392$1@$0@@@%383$0@@|@|@@%221%183%116%179%87%232%383%388$1@$0@@@%383$0@@|@|@@%221%183%116%179%87%232%383%380$1@$0@@@%383$0@@|@|@@%221%183%116%179%87%232%383%378$1@$0@@@%383$0@@|@|@@%221%184%117%179%87%232%377%390$1@$0@@@%377$0@@|@|@@%221%184%117%179%87%232%377%382$1@$0@@@%377$0@@|@|@@%221%183%116%179%87%232%377%386$1@$0@@@%377$0@@|@|@@%221%183%116%179%87%232%377%392$1@$0@@@%377$0@@|@|@@%221%183%116%179%87%232%377%388$1@$0@@@%377$0@@|@|@@%221%183%116%179%87%232%377%380$1@$0@@@%377$0@@|@|@@%221%183%116%179%87%232%377%384$1@$0@@@%377$0@@|@|@@%221%184%117%179%87%233%389%390$1@$0@@@$1%389$0@@@|@|@@%221%184%117%179%87%233%381%382$1@$0@@@$1%381$0@@@|@|@@%221%183%116%179%87%232%385%386$1@$0@@@$1%385$0@@@|@|@@%221%183%116%179%87%232%391%392$1@$0@@@$1%391$0@@@|@|@@%221%183%116%179%87%232%387%388$1@$0@@@$1%387$0@@@|@|@@%221%183%116%179%87%232%379%380$1@$0@@@$1%379$0@@@|@|@@%221%183%116%179%87%232%383%384$1@$0@@@$1%383$0@@@|@|@@%183%116%179%87%232%377%378$1@$0@@@$1%377$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_program_header_table_entry_fupdfupds x = x
    val op elf64_program_header_table_entry_fupdfupds =
    DT(((("elf_program_header_table",89),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_program_header_table",[65,66,67,87])]),["DISK_THM"]),
       [read"%221%184%132%184%117%179%87%235%390$1@%390$2@$0@@@%390%442$1@$2@@$0@@|@|@|@@%221%184%132%184%117%179%87%235%382$1@%382$2@$0@@@%382%442$1@$2@@$0@@|@|@|@@%221%183%131%183%116%179%87%235%386$1@%386$2@$0@@@%386%441$1@$2@@$0@@|@|@|@@%221%183%131%183%116%179%87%235%392$1@%392$2@$0@@@%392%441$1@$2@@$0@@|@|@|@@%221%183%131%183%116%179%87%235%388$1@%388$2@$0@@@%388%441$1@$2@@$0@@|@|@|@@%221%183%131%183%116%179%87%235%380$1@%380$2@$0@@@%380%441$1@$2@@$0@@|@|@|@@%221%183%131%183%116%179%87%235%384$1@%384$2@$0@@@%384%441$1@$2@@$0@@|@|@|@@%183%131%183%116%179%87%235%378$1@%378$2@$0@@@%378%441$1@$2@@$0@@|@|@|@@@@@@@@"])
  fun op elf64_program_header_table_entry_fupdfupds_comp x = x
    val op elf64_program_header_table_entry_fupdfupds_comp =
    DT(((("elf_program_header_table",90),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_program_header_table",[65,66,67,87])]),["DISK_THM"]),
       [read"%221%221%184%132%184%117%248%446%390$0@@%390$1@@@%390%442$0@$1@@@|@|@@%182%134%184%132%184%117%245%445%390$0@@%445%390$1@@$2@@@%445%390%442$0@$1@@@$2@@|@|@|@@@%221%221%184%132%184%117%248%446%382$0@@%382$1@@@%382%442$0@$1@@@|@|@@%182%134%184%132%184%117%245%445%382$0@@%445%382$1@@$2@@@%445%382%442$0@$1@@@$2@@|@|@|@@@%221%221%183%131%183%116%248%446%386$0@@%386$1@@@%386%441$0@$1@@@|@|@@%182%134%183%131%183%116%245%445%386$0@@%445%386$1@@$2@@@%445%386%441$0@$1@@@$2@@|@|@|@@@%221%221%183%131%183%116%248%446%392$0@@%392$1@@@%392%441$0@$1@@@|@|@@%182%134%183%131%183%116%245%445%392$0@@%445%392$1@@$2@@@%445%392%441$0@$1@@@$2@@|@|@|@@@%221%221%183%131%183%116%248%446%388$0@@%388$1@@@%388%441$0@$1@@@|@|@@%182%134%183%131%183%116%245%445%388$0@@%445%388$1@@$2@@@%445%388%441$0@$1@@@$2@@|@|@|@@@%221%221%183%131%183%116%248%446%380$0@@%380$1@@@%380%441$0@$1@@@|@|@@%182%134%183%131%183%116%245%445%380$0@@%445%380$1@@$2@@@%445%380%441$0@$1@@@$2@@|@|@|@@@%221%221%183%131%183%116%248%446%384$0@@%384$1@@@%384%441$0@$1@@@|@|@@%182%134%183%131%183%116%245%445%384$0@@%445%384$1@@$2@@@%445%384%441$0@$1@@@$2@@|@|@|@@@%221%183%131%183%116%248%446%378$0@@%378$1@@@%378%441$0@$1@@@|@|@@%182%134%183%131%183%116%245%445%378$0@@%445%378$1@@$2@@@%445%378%441$0@$1@@@$2@@|@|@|@@@@@@@@@"])
  fun op elf64_program_header_table_entry_fupdcanon x = x
    val op elf64_program_header_table_entry_fupdcanon =
    DT(((("elf_program_header_table",91),
        [("bool",[25,26,55,180]),
         ("elf_program_header_table",[65,66,67,87])]),["DISK_THM"]),
       [read"%221%184%132%184%117%179%87%235%382$1@%390$2@$0@@@%390$2@%382$1@$0@@@|@|@|@@%221%184%132%183%116%179%87%235%386$1@%390$2@$0@@@%390$2@%386$1@$0@@@|@|@|@@%221%184%132%183%116%179%87%235%386$1@%382$2@$0@@@%382$2@%386$1@$0@@@|@|@|@@%221%184%132%183%116%179%87%235%392$1@%390$2@$0@@@%390$2@%392$1@$0@@@|@|@|@@%221%184%132%183%116%179%87%235%392$1@%382$2@$0@@@%382$2@%392$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%392$1@%386$2@$0@@@%386$2@%392$1@$0@@@|@|@|@@%221%184%132%183%116%179%87%235%388$1@%390$2@$0@@@%390$2@%388$1@$0@@@|@|@|@@%221%184%132%183%116%179%87%235%388$1@%382$2@$0@@@%382$2@%388$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%388$1@%386$2@$0@@@%386$2@%388$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%388$1@%392$2@$0@@@%392$2@%388$1@$0@@@|@|@|@@%221%184%132%183%116%179%87%235%380$1@%390$2@$0@@@%390$2@%380$1@$0@@@|@|@|@@%221%184%132%183%116%179%87%235%380$1@%382$2@$0@@@%382$2@%380$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%380$1@%386$2@$0@@@%386$2@%380$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%380$1@%392$2@$0@@@%392$2@%380$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%380$1@%388$2@$0@@@%388$2@%380$1@$0@@@|@|@|@@%221%184%132%183%116%179%87%235%384$1@%390$2@$0@@@%390$2@%384$1@$0@@@|@|@|@@%221%184%132%183%116%179%87%235%384$1@%382$2@$0@@@%382$2@%384$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%384$1@%386$2@$0@@@%386$2@%384$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%384$1@%392$2@$0@@@%392$2@%384$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%384$1@%388$2@$0@@@%388$2@%384$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%384$1@%380$2@$0@@@%380$2@%384$1@$0@@@|@|@|@@%221%184%132%183%116%179%87%235%378$1@%390$2@$0@@@%390$2@%378$1@$0@@@|@|@|@@%221%184%132%183%116%179%87%235%378$1@%382$2@$0@@@%382$2@%378$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%378$1@%386$2@$0@@@%386$2@%378$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%378$1@%392$2@$0@@@%392$2@%378$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%378$1@%388$2@$0@@@%388$2@%378$1@$0@@@|@|@|@@%221%183%131%183%116%179%87%235%378$1@%380$2@$0@@@%380$2@%378$1@$0@@@|@|@|@@%183%131%183%116%179%87%235%378$1@%384$2@$0@@@%384$2@%378$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_program_header_table_entry_fupdcanon_comp x = x
    val op elf64_program_header_table_entry_fupdcanon_comp =
    DT(((("elf_program_header_table",92),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_program_header_table",[65,66,67,87])]),["DISK_THM"]),
       [read"%221%221%184%132%184%117%248%446%382$0@@%390$1@@@%446%390$1@@%382$0@@@|@|@@%182%134%184%132%184%117%245%445%382$0@@%445%390$1@@$2@@@%445%390$1@@%445%382$0@@$2@@@|@|@|@@@%221%221%184%132%183%116%248%446%386$0@@%390$1@@@%446%390$1@@%386$0@@@|@|@@%182%134%184%132%183%116%245%445%386$0@@%445%390$1@@$2@@@%445%390$1@@%445%386$0@@$2@@@|@|@|@@@%221%221%184%132%183%116%248%446%386$0@@%382$1@@@%446%382$1@@%386$0@@@|@|@@%182%134%184%132%183%116%245%445%386$0@@%445%382$1@@$2@@@%445%382$1@@%445%386$0@@$2@@@|@|@|@@@%221%221%184%132%183%116%248%446%392$0@@%390$1@@@%446%390$1@@%392$0@@@|@|@@%182%134%184%132%183%116%245%445%392$0@@%445%390$1@@$2@@@%445%390$1@@%445%392$0@@$2@@@|@|@|@@@%221%221%184%132%183%116%248%446%392$0@@%382$1@@@%446%382$1@@%392$0@@@|@|@@%182%134%184%132%183%116%245%445%392$0@@%445%382$1@@$2@@@%445%382$1@@%445%392$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%392$0@@%386$1@@@%446%386$1@@%392$0@@@|@|@@%182%134%183%131%183%116%245%445%392$0@@%445%386$1@@$2@@@%445%386$1@@%445%392$0@@$2@@@|@|@|@@@%221%221%184%132%183%116%248%446%388$0@@%390$1@@@%446%390$1@@%388$0@@@|@|@@%182%134%184%132%183%116%245%445%388$0@@%445%390$1@@$2@@@%445%390$1@@%445%388$0@@$2@@@|@|@|@@@%221%221%184%132%183%116%248%446%388$0@@%382$1@@@%446%382$1@@%388$0@@@|@|@@%182%134%184%132%183%116%245%445%388$0@@%445%382$1@@$2@@@%445%382$1@@%445%388$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%388$0@@%386$1@@@%446%386$1@@%388$0@@@|@|@@%182%134%183%131%183%116%245%445%388$0@@%445%386$1@@$2@@@%445%386$1@@%445%388$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%388$0@@%392$1@@@%446%392$1@@%388$0@@@|@|@@%182%134%183%131%183%116%245%445%388$0@@%445%392$1@@$2@@@%445%392$1@@%445%388$0@@$2@@@|@|@|@@@%221%221%184%132%183%116%248%446%380$0@@%390$1@@@%446%390$1@@%380$0@@@|@|@@%182%134%184%132%183%116%245%445%380$0@@%445%390$1@@$2@@@%445%390$1@@%445%380$0@@$2@@@|@|@|@@@%221%221%184%132%183%116%248%446%380$0@@%382$1@@@%446%382$1@@%380$0@@@|@|@@%182%134%184%132%183%116%245%445%380$0@@%445%382$1@@$2@@@%445%382$1@@%445%380$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%380$0@@%386$1@@@%446%386$1@@%380$0@@@|@|@@%182%134%183%131%183%116%245%445%380$0@@%445%386$1@@$2@@@%445%386$1@@%445%380$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%380$0@@%392$1@@@%446%392$1@@%380$0@@@|@|@@%182%134%183%131%183%116%245%445%380$0@@%445%392$1@@$2@@@%445%392$1@@%445%380$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%380$0@@%388$1@@@%446%388$1@@%380$0@@@|@|@@%182%134%183%131%183%116%245%445%380$0@@%445%388$1@@$2@@@%445%388$1@@%445%380$0@@$2@@@|@|@|@@@%221%221%184%132%183%116%248%446%384$0@@%390$1@@@%446%390$1@@%384$0@@@|@|@@%182%134%184%132%183%116%245%445%384$0@@%445%390$1@@$2@@@%445%390$1@@%445%384$0@@$2@@@|@|@|@@@%221%221%184%132%183%116%248%446%384$0@@%382$1@@@%446%382$1@@%384$0@@@|@|@@%182%134%184%132%183%116%245%445%384$0@@%445%382$1@@$2@@@%445%382$1@@%445%384$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%384$0@@%386$1@@@%446%386$1@@%384$0@@@|@|@@%182%134%183%131%183%116%245%445%384$0@@%445%386$1@@$2@@@%445%386$1@@%445%384$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%384$0@@%392$1@@@%446%392$1@@%384$0@@@|@|@@%182%134%183%131%183%116%245%445%384$0@@%445%392$1@@$2@@@%445%392$1@@%445%384$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%384$0@@%388$1@@@%446%388$1@@%384$0@@@|@|@@%182%134%183%131%183%116%245%445%384$0@@%445%388$1@@$2@@@%445%388$1@@%445%384$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%384$0@@%380$1@@@%446%380$1@@%384$0@@@|@|@@%182%134%183%131%183%116%245%445%384$0@@%445%380$1@@$2@@@%445%380$1@@%445%384$0@@$2@@@|@|@|@@@%221%221%184%132%183%116%248%446%378$0@@%390$1@@@%446%390$1@@%378$0@@@|@|@@%182%134%184%132%183%116%245%445%378$0@@%445%390$1@@$2@@@%445%390$1@@%445%378$0@@$2@@@|@|@|@@@%221%221%184%132%183%116%248%446%378$0@@%382$1@@@%446%382$1@@%378$0@@@|@|@@%182%134%184%132%183%116%245%445%378$0@@%445%382$1@@$2@@@%445%382$1@@%445%378$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%378$0@@%386$1@@@%446%386$1@@%378$0@@@|@|@@%182%134%183%131%183%116%245%445%378$0@@%445%386$1@@$2@@@%445%386$1@@%445%378$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%378$0@@%392$1@@@%446%392$1@@%378$0@@@|@|@@%182%134%183%131%183%116%245%445%378$0@@%445%392$1@@$2@@@%445%392$1@@%445%378$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%378$0@@%388$1@@@%446%388$1@@%378$0@@@|@|@@%182%134%183%131%183%116%245%445%378$0@@%445%388$1@@$2@@@%445%388$1@@%445%378$0@@$2@@@|@|@|@@@%221%221%183%131%183%116%248%446%378$0@@%380$1@@@%446%380$1@@%378$0@@@|@|@@%182%134%183%131%183%116%245%445%378$0@@%445%380$1@@$2@@@%445%380$1@@%445%378$0@@$2@@@|@|@|@@@%221%183%131%183%116%248%446%378$0@@%384$1@@@%446%384$1@@%378$0@@@|@|@@%182%134%183%131%183%116%245%445%378$0@@%445%384$1@@$2@@@%445%384$1@@%445%378$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_program_header_table_entry_component_equality x = x
    val op elf64_program_header_table_entry_component_equality =
    DT(((("elf_program_header_table",93),
        [("bool",[25,26,50,55,62,180]),
         ("elf_program_header_table",[65,66,67,78]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%179%89%179%91%230%235$1@$0@@%221%233%389$1@@%389$0@@@%221%233%381$1@@%381$0@@@%221%232%385$1@@%385$0@@@%221%232%391$1@@%391$0@@@%221%232%387$1@@%387$0@@@%221%232%379$1@@%379$0@@@%221%232%383$1@@%383$0@@@%232%377$1@@%377$0@@@@@@@@@@|@|@"])
  fun op elf64_program_header_table_entry_updates_eq_literal x = x
    val op elf64_program_header_table_entry_updates_eq_literal =
    DT(((("elf_program_header_table",94),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_program_header_table",[65,66,67,87])]),["DISK_THM"]),
       [read"%179%87%177%82%177%78%176%71%176%65%176%59%176%53%176%47%176%45%235%390%299$7@@%382%299$6@@%386%298$5@@%392%298$4@@%388%298$3@@%380%298$2@@%384%298$1@@%378%298$0@@$8@@@@@@@@@%390%299$7@@%382%299$6@@%386%298$5@@%392%298$4@@%388%298$3@@%380%298$2@@%384%298$1@@%378%298$0@@%271@@@@@@@@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_literal_nchotomy x = x
    val op elf64_program_header_table_entry_literal_nchotomy =
    DT(((("elf_program_header_table",95),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_program_header_table",[65,66,67,87]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%179%87%258%82%258%78%257%71%257%65%257%59%257%53%257%47%257%45%235$8@%390%299$7@@%382%299$6@@%386%298$5@@%392%298$4@@%388%298$3@@%380%298$2@@%384%298$1@@%378%298$0@@%271@@@@@@@@@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf64_program_header_table_entry x = x
    val op FORALL_elf64_program_header_table_entry =
    DT(((("elf_program_header_table",96),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_program_header_table",[65,66,67,87]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%188%7%230%179%87$1$0@|@@%177%82%177%78%176%71%176%65%176%59%176%53%176%47%176%45$8%390%299$7@@%382%299$6@@%386%298$5@@%392%298$4@@%388%298$3@@%380%298$2@@%384%298$1@@%378%298$0@@%271@@@@@@@@@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf64_program_header_table_entry x = x
    val op EXISTS_elf64_program_header_table_entry =
    DT(((("elf_program_header_table",97),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_program_header_table",[65,66,67,87]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%188%7%230%260%87$1$0@|@@%258%82%258%78%257%71%257%65%257%59%257%53%257%47%257%45$8%390%299$7@@%382%299$6@@%386%298$5@@%392%298$4@@%388%298$3@@%380%298$2@@%384%298$1@@%378%298$0@@%271@@@@@@@@@|@|@|@|@|@|@|@|@@|@"])
  fun op elf64_program_header_table_entry_literal_11 x = x
    val op elf64_program_header_table_entry_literal_11 =
    DT(((("elf_program_header_table",98),
        [("combin",[12]),
         ("elf_program_header_table",[88,93])]),["DISK_THM"]),
       [read"%177%83%177%79%176%73%176%67%176%61%176%55%176%49%176%53%177%84%177%80%176%75%176%69%176%63%176%57%176%51%176%59%230%235%390%299$15@@%382%299$14@@%386%298$13@@%392%298$12@@%388%298$11@@%380%298$10@@%384%298$9@@%378%298$8@@%271@@@@@@@@@%390%299$7@@%382%299$6@@%386%298$5@@%392%298$4@@%388%298$3@@%380%298$2@@%384%298$1@@%378%298$0@@%271@@@@@@@@@@%221%233$15@$7@@%221%233$14@$6@@%221%232$13@$5@@%221%232$12@$4@@%221%232$11@$3@@%221%232$10@$2@@%221%232$9@$1@@%232$8@$0@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf64_program_header_table_entry x = x
    val op datatype_elf64_program_header_table_entry =
    DT(((("elf_program_header_table",99),
        [("bool",[25,170])]),["DISK_THM"]),
       [read"%290%157%112@%110@%106@%108@%111@%109@%105@%107@%104@@"])
  fun op elf64_program_header_table_entry_11 x = x
    val op elf64_program_header_table_entry_11 =
    DT(((("elf_program_header_table",100),
        [("bool",[26,50,55,62,180]),
         ("elf_program_header_table",[65,66,67]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%177%10%177%14%176%16%176%20%176%24%176%28%176%32%176%36%177%11%177%15%176%18%176%22%176%26%176%30%176%34%176%38%230%235%465$15@$14@$13@$12@$11@$10@$9@$8@@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%221%233$15@$7@@%221%233$14@$6@@%221%232$13@$5@@%221%232$12@$4@@%221%232$11@$3@@%221%232$10@$2@@%221%232$9@$1@@%232$8@$0@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_case_cong x = x
    val op elf64_program_header_table_entry_case_cong =
    DT(((("elf_program_header_table",101),
        [("bool",[26,180]),
         ("elf_program_header_table",[65,66,67,68])]),["DISK_THM"]),
       [read"%179%3%179%5%185%118%255%221%235$2@$1@@%177%10%177%14%176%16%176%20%176%24%176%28%176%32%176%36%255%235$9@%465$7@$6@$5@$4@$3@$2@$1@$0@@@%225$8$7@$6@$5@$4@$3@$2@$1@$0@@%120$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@@@%225%376$2@$0@@%376$1@%120@@@|@|@|@"])
  fun op elf64_program_header_table_entry_nchotomy x = x
    val op elf64_program_header_table_entry_nchotomy =
    DT(((("elf_program_header_table",102),
        [("bool",[26,180]),
         ("elf_program_header_table",[65,66,67])]),["DISK_THM"]),
       [read"%179%94%258%46%258%48%257%53%257%59%257%65%257%71%257%77%257%81%235$8@%465$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_Axiom x = x
    val op elf64_program_header_table_entry_Axiom =
    DT(((("elf_program_header_table",103),
        [("bool",[26,180]),("elf_program_header_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%185%118%263%130%177%10%177%14%176%16%176%20%176%24%176%28%176%32%176%36%225$8%465$7@$6@$5@$4@$3@$2@$1@$0@@@$9$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_induction x = x
    val op elf64_program_header_table_entry_induction =
    DT(((("elf_program_header_table",104),
        [("bool",[26]),
         ("elf_program_header_table",[65,66,67])]),["DISK_THM"]),
       [read"%188%7%255%177%46%177%48%176%53%176%59%176%65%176%71%176%77%176%81$8%465$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@@%179%87$1$0@|@@|@"])
  fun op read_elf32_program_header_table'_ind x = x
    val op read_elf32_program_header_table'_ind =
    DT(((("elf_program_header_table",121),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%189%8%255%180%113%175%43%255%175%44%255%486%251%438$1@@%222@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%180%171%175%172$2$1@$0@|@|@@|@",
        read"%180%113%175%43%175%44%255%486%251%438$1@@%222@@@%9%216$2@$0@@%216$2@$1@@@|@|@|@",
        read"%341%9@"])
  fun op read_elf32_program_header_table'_def x = x
    val op read_elf32_program_header_table'_def =
    DT(((("elf_program_header_table",122),
        [("bool",[15,57,128]),("combin",[19]),
         ("elf_program_header_table",[119,120]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%180%113%175%43%237%454$1@$0@@%278%251%438$0@@%222@@%467%314@@%421%455$1@$0@@%339%114%44%412%454$3@$0@@%166%467%283$2@$0@@|@||@@@@|@|@",
        read"%180%113%175%43%175%44%255%486%251%438$1@@%222@@@%9%216$2@$0@@%216$2@$1@@@|@|@|@",
        read"%341%9@"])
  fun op read_elf64_program_header_table'_ind x = x
    val op read_elf64_program_header_table'_ind =
    DT(((("elf_program_header_table",125),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%189%8%255%180%113%175%43%255%175%44%255%486%251%438$1@@%222@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%180%171%175%172$2$1@$0@|@|@@|@",
        read"%180%113%175%43%175%44%255%486%251%438$1@@%222@@@%9%216$2@$0@@%216$2@$1@@@|@|@|@",
        read"%341%9@"])
  fun op read_elf64_program_header_table'_def x = x
    val op read_elf64_program_header_table'_def =
    DT(((("elf_program_header_table",126),
        [("bool",[15,57,128]),("combin",[19]),
         ("elf_program_header_table",[123,124]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%180%113%175%43%238%460$1@$0@@%279%251%438$0@@%222@@%468%315@@%422%461$1@$0@@%340%115%44%414%460$3@$0@@%167%468%284$2@$0@@|@||@@@@|@|@",
        read"%180%113%175%43%175%44%255%486%251%438$1@@%222@@@%9%216$2@$0@@%216$2@$1@@@|@|@|@",
        read"%341%9@"])
  end
  val _ = DB.bindl "elf_program_header_table"
  [("elf_pt_null_def",elf_pt_null_def,DB.Def),
   ("elf_pt_load_def",elf_pt_load_def,DB.Def),
   ("elf_pt_dynamic_def",elf_pt_dynamic_def,DB.Def),
   ("elf_pt_interp_def",elf_pt_interp_def,DB.Def),
   ("elf_pt_note_def",elf_pt_note_def,DB.Def),
   ("elf_pt_shlib_def",elf_pt_shlib_def,DB.Def),
   ("elf_pt_phdr_def",elf_pt_phdr_def,DB.Def),
   ("elf_pt_tls_def",elf_pt_tls_def,DB.Def),
   ("elf_pt_loos_def",elf_pt_loos_def,DB.Def),
   ("elf_pt_hios_def",elf_pt_hios_def,DB.Def),
   ("elf_pt_loproc_def",elf_pt_loproc_def,DB.Def),
   ("elf_pt_hiproc_def",elf_pt_hiproc_def,DB.Def),
   ("string_of_segment_type_def",string_of_segment_type_def,DB.Def),
   ("elf_pf_x_def",elf_pf_x_def,DB.Def),
   ("elf_pf_w_def",elf_pf_w_def,DB.Def),
   ("elf_pf_r_def",elf_pf_r_def,DB.Def),
   ("elf_pf_maskos_def",elf_pf_maskos_def,DB.Def),
   ("elf_pf_maskproc_def",elf_pf_maskproc_def,DB.Def),
   ("exact_permissions_of_permission_def",
    exact_permissions_of_permission_def,
    DB.Def),
   ("allowable_permissions_of_permission_def",
    allowable_permissions_of_permission_def,
    DB.Def),
   ("string_of_elf_segment_permissions_def",
    string_of_elf_segment_permissions_def,
    DB.Def),
   ("elf32_program_header_table_entry_TY_DEF",
    elf32_program_header_table_entry_TY_DEF,
    DB.Def),
   ("elf32_program_header_table_entry_case_def",
    elf32_program_header_table_entry_case_def,
    DB.Def),
   ("elf32_program_header_table_entry_size_def",
    elf32_program_header_table_entry_size_def,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_type",
    elf32_program_header_table_entry_elf32_p_type,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_offset",
    elf32_program_header_table_entry_elf32_p_offset,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_vaddr",
    elf32_program_header_table_entry_elf32_p_vaddr,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_paddr",
    elf32_program_header_table_entry_elf32_p_paddr,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_filesz",
    elf32_program_header_table_entry_elf32_p_filesz,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_memsz",
    elf32_program_header_table_entry_elf32_p_memsz,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_flags",
    elf32_program_header_table_entry_elf32_p_flags,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_align",
    elf32_program_header_table_entry_elf32_p_align,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_type_fupd",
    elf32_program_header_table_entry_elf32_p_type_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_offset_fupd",
    elf32_program_header_table_entry_elf32_p_offset_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_vaddr_fupd",
    elf32_program_header_table_entry_elf32_p_vaddr_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_paddr_fupd",
    elf32_program_header_table_entry_elf32_p_paddr_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_filesz_fupd",
    elf32_program_header_table_entry_elf32_p_filesz_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_memsz_fupd",
    elf32_program_header_table_entry_elf32_p_memsz_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_flags_fupd",
    elf32_program_header_table_entry_elf32_p_flags_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_align_fupd",
    elf32_program_header_table_entry_elf32_p_align_fupd,
    DB.Def),
   ("compare_elf32_program_header_table_entry_def",
    compare_elf32_program_header_table_entry_def,
    DB.Def),
   ("instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict_def",
    instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict_def,
    DB.Def),
   ("elf64_program_header_table_entry_TY_DEF",
    elf64_program_header_table_entry_TY_DEF,
    DB.Def),
   ("elf64_program_header_table_entry_case_def",
    elf64_program_header_table_entry_case_def,
    DB.Def),
   ("elf64_program_header_table_entry_size_def",
    elf64_program_header_table_entry_size_def,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_type",
    elf64_program_header_table_entry_elf64_p_type,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_flags",
    elf64_program_header_table_entry_elf64_p_flags,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_offset",
    elf64_program_header_table_entry_elf64_p_offset,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_vaddr",
    elf64_program_header_table_entry_elf64_p_vaddr,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_paddr",
    elf64_program_header_table_entry_elf64_p_paddr,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_filesz",
    elf64_program_header_table_entry_elf64_p_filesz,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_memsz",
    elf64_program_header_table_entry_elf64_p_memsz,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_align",
    elf64_program_header_table_entry_elf64_p_align,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_type_fupd",
    elf64_program_header_table_entry_elf64_p_type_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_flags_fupd",
    elf64_program_header_table_entry_elf64_p_flags_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_offset_fupd",
    elf64_program_header_table_entry_elf64_p_offset_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_vaddr_fupd",
    elf64_program_header_table_entry_elf64_p_vaddr_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_paddr_fupd",
    elf64_program_header_table_entry_elf64_p_paddr_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_filesz_fupd",
    elf64_program_header_table_entry_elf64_p_filesz_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_memsz_fupd",
    elf64_program_header_table_entry_elf64_p_memsz_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_align_fupd",
    elf64_program_header_table_entry_elf64_p_align_fupd,
    DB.Def),
   ("compare_elf64_program_header_table_entry_def",
    compare_elf64_program_header_table_entry_def,
    DB.Def),
   ("instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict_def",
    instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict_def,
    DB.Def),
   ("string_of_elf32_program_header_table_entry_def",
    string_of_elf32_program_header_table_entry_def,
    DB.Def),
   ("string_of_elf64_program_header_table_entry_def",
    string_of_elf64_program_header_table_entry_def,
    DB.Def),
   ("string_of_elf32_program_header_table_entry_default_def",
    string_of_elf32_program_header_table_entry_default_def,
    DB.Def),
   ("string_of_elf64_program_header_table_entry_default_def",
    string_of_elf64_program_header_table_entry_default_def,
    DB.Def),
   ("instance_Show_Show_Elf_program_header_table_elf32_program_header_table_entry_dict_def",
    instance_Show_Show_Elf_program_header_table_elf32_program_header_table_entry_dict_def,
    DB.Def),
   ("instance_Show_Show_Elf_program_header_table_elf64_program_header_table_entry_dict_def",
    instance_Show_Show_Elf_program_header_table_elf64_program_header_table_entry_dict_def,
    DB.Def),
   ("bytes_of_elf32_program_header_table_entry_def",
    bytes_of_elf32_program_header_table_entry_def,
    DB.Def),
   ("bytes_of_elf64_program_header_table_entry_def",
    bytes_of_elf64_program_header_table_entry_def,
    DB.Def),
   ("read_elf32_program_header_table_entry_def",
    read_elf32_program_header_table_entry_def,
    DB.Def),
   ("read_elf64_program_header_table_entry_def",
    read_elf64_program_header_table_entry_def,
    DB.Def),
   ("bytes_of_elf32_program_header_table_def",
    bytes_of_elf32_program_header_table_def,
    DB.Def),
   ("bytes_of_elf64_program_header_table_def",
    bytes_of_elf64_program_header_table_def,
    DB.Def),
   ("read_elf32_program_header_table_def",
    read_elf32_program_header_table_def,
    DB.Def),
   ("read_elf64_program_header_table_def",
    read_elf64_program_header_table_def,
    DB.Def),
   ("string_of_elf32_program_header_table_def",
    string_of_elf32_program_header_table_def,
    DB.Def),
   ("string_of_elf64_program_header_table_def",
    string_of_elf64_program_header_table_def,
    DB.Def),
   ("get_elf32_dynamic_linked_def",get_elf32_dynamic_linked_def,DB.Def),
   ("get_elf64_dynamic_linked_def",get_elf64_dynamic_linked_def,DB.Def),
   ("get_elf32_static_linked_def",get_elf32_static_linked_def,DB.Def),
   ("get_elf64_static_linked_def",get_elf64_static_linked_def,DB.Def),
   ("get_elf32_requested_interpreter_def",
    get_elf32_requested_interpreter_def,
    DB.Def),
   ("get_elf64_requested_interpreter_def",
    get_elf64_requested_interpreter_def,
    DB.Def),
   ("elf32_program_header_table_entry_accessors",
    elf32_program_header_table_entry_accessors,
    DB.Thm),
   ("elf32_program_header_table_entry_fn_updates",
    elf32_program_header_table_entry_fn_updates,
    DB.Thm),
   ("elf32_program_header_table_entry_accfupds",
    elf32_program_header_table_entry_accfupds,
    DB.Thm),
   ("elf32_program_header_table_entry_fupdfupds",
    elf32_program_header_table_entry_fupdfupds,
    DB.Thm),
   ("elf32_program_header_table_entry_fupdfupds_comp",
    elf32_program_header_table_entry_fupdfupds_comp,
    DB.Thm),
   ("elf32_program_header_table_entry_fupdcanon",
    elf32_program_header_table_entry_fupdcanon,
    DB.Thm),
   ("elf32_program_header_table_entry_fupdcanon_comp",
    elf32_program_header_table_entry_fupdcanon_comp,
    DB.Thm),
   ("elf32_program_header_table_entry_component_equality",
    elf32_program_header_table_entry_component_equality,
    DB.Thm),
   ("elf32_program_header_table_entry_updates_eq_literal",
    elf32_program_header_table_entry_updates_eq_literal,
    DB.Thm),
   ("elf32_program_header_table_entry_literal_nchotomy",
    elf32_program_header_table_entry_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf32_program_header_table_entry",
    FORALL_elf32_program_header_table_entry,
    DB.Thm),
   ("EXISTS_elf32_program_header_table_entry",
    EXISTS_elf32_program_header_table_entry,
    DB.Thm),
   ("elf32_program_header_table_entry_literal_11",
    elf32_program_header_table_entry_literal_11,
    DB.Thm),
   ("datatype_elf32_program_header_table_entry",
    datatype_elf32_program_header_table_entry,
    DB.Thm),
   ("elf32_program_header_table_entry_11",
    elf32_program_header_table_entry_11,
    DB.Thm),
   ("elf32_program_header_table_entry_case_cong",
    elf32_program_header_table_entry_case_cong,
    DB.Thm),
   ("elf32_program_header_table_entry_nchotomy",
    elf32_program_header_table_entry_nchotomy,
    DB.Thm),
   ("elf32_program_header_table_entry_Axiom",
    elf32_program_header_table_entry_Axiom,
    DB.Thm),
   ("elf32_program_header_table_entry_induction",
    elf32_program_header_table_entry_induction,
    DB.Thm),
   ("elf64_program_header_table_entry_accessors",
    elf64_program_header_table_entry_accessors,
    DB.Thm),
   ("elf64_program_header_table_entry_fn_updates",
    elf64_program_header_table_entry_fn_updates,
    DB.Thm),
   ("elf64_program_header_table_entry_accfupds",
    elf64_program_header_table_entry_accfupds,
    DB.Thm),
   ("elf64_program_header_table_entry_fupdfupds",
    elf64_program_header_table_entry_fupdfupds,
    DB.Thm),
   ("elf64_program_header_table_entry_fupdfupds_comp",
    elf64_program_header_table_entry_fupdfupds_comp,
    DB.Thm),
   ("elf64_program_header_table_entry_fupdcanon",
    elf64_program_header_table_entry_fupdcanon,
    DB.Thm),
   ("elf64_program_header_table_entry_fupdcanon_comp",
    elf64_program_header_table_entry_fupdcanon_comp,
    DB.Thm),
   ("elf64_program_header_table_entry_component_equality",
    elf64_program_header_table_entry_component_equality,
    DB.Thm),
   ("elf64_program_header_table_entry_updates_eq_literal",
    elf64_program_header_table_entry_updates_eq_literal,
    DB.Thm),
   ("elf64_program_header_table_entry_literal_nchotomy",
    elf64_program_header_table_entry_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf64_program_header_table_entry",
    FORALL_elf64_program_header_table_entry,
    DB.Thm),
   ("EXISTS_elf64_program_header_table_entry",
    EXISTS_elf64_program_header_table_entry,
    DB.Thm),
   ("elf64_program_header_table_entry_literal_11",
    elf64_program_header_table_entry_literal_11,
    DB.Thm),
   ("datatype_elf64_program_header_table_entry",
    datatype_elf64_program_header_table_entry,
    DB.Thm),
   ("elf64_program_header_table_entry_11",
    elf64_program_header_table_entry_11,
    DB.Thm),
   ("elf64_program_header_table_entry_case_cong",
    elf64_program_header_table_entry_case_cong,
    DB.Thm),
   ("elf64_program_header_table_entry_nchotomy",
    elf64_program_header_table_entry_nchotomy,
    DB.Thm),
   ("elf64_program_header_table_entry_Axiom",
    elf64_program_header_table_entry_Axiom,
    DB.Thm),
   ("elf64_program_header_table_entry_induction",
    elf64_program_header_table_entry_induction,
    DB.Thm),
   ("read_elf32_program_header_table'_ind",
    read_elf32_program_header_table'_ind,
    DB.Thm),
   ("read_elf32_program_header_table'_def",
    read_elf32_program_header_table'_def,
    DB.Thm),
   ("read_elf64_program_header_table'_ind",
    read_elf64_program_header_table'_ind,
    DB.Thm),
   ("read_elf64_program_header_table'_def",
    read_elf64_program_header_table'_def,
    DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("elf_types_native_uintTheory.elf_types_native_uint_grammars",
                          elf_types_native_uintTheory.elf_types_native_uint_grammars),
                         ("lem_setTheory.lem_set_grammars",
                          lem_setTheory.lem_set_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_null", (Term.prim_mk_const { Name = "elf_pt_null", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_null", (Term.prim_mk_const { Name = "elf_pt_null", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_load", (Term.prim_mk_const { Name = "elf_pt_load", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_load", (Term.prim_mk_const { Name = "elf_pt_load", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_dynamic", (Term.prim_mk_const { Name = "elf_pt_dynamic", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_dynamic", (Term.prim_mk_const { Name = "elf_pt_dynamic", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_interp", (Term.prim_mk_const { Name = "elf_pt_interp", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_interp", (Term.prim_mk_const { Name = "elf_pt_interp", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_note", (Term.prim_mk_const { Name = "elf_pt_note", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_note", (Term.prim_mk_const { Name = "elf_pt_note", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_shlib", (Term.prim_mk_const { Name = "elf_pt_shlib", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_shlib", (Term.prim_mk_const { Name = "elf_pt_shlib", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_phdr", (Term.prim_mk_const { Name = "elf_pt_phdr", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_phdr", (Term.prim_mk_const { Name = "elf_pt_phdr", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_tls", (Term.prim_mk_const { Name = "elf_pt_tls", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_tls", (Term.prim_mk_const { Name = "elf_pt_tls", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_loos", (Term.prim_mk_const { Name = "elf_pt_loos", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_loos", (Term.prim_mk_const { Name = "elf_pt_loos", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_hios", (Term.prim_mk_const { Name = "elf_pt_hios", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_hios", (Term.prim_mk_const { Name = "elf_pt_hios", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_loproc", (Term.prim_mk_const { Name = "elf_pt_loproc", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_loproc", (Term.prim_mk_const { Name = "elf_pt_loproc", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_hiproc", (Term.prim_mk_const { Name = "elf_pt_hiproc", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_hiproc", (Term.prim_mk_const { Name = "elf_pt_hiproc", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_segment_type", (Term.prim_mk_const { Name = "string_of_segment_type", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_segment_type", (Term.prim_mk_const { Name = "string_of_segment_type", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_x", (Term.prim_mk_const { Name = "elf_pf_x", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_x", (Term.prim_mk_const { Name = "elf_pf_x", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_w", (Term.prim_mk_const { Name = "elf_pf_w", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_w", (Term.prim_mk_const { Name = "elf_pf_w", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_r", (Term.prim_mk_const { Name = "elf_pf_r", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_r", (Term.prim_mk_const { Name = "elf_pf_r", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_maskos", (Term.prim_mk_const { Name = "elf_pf_maskos", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_maskos", (Term.prim_mk_const { Name = "elf_pf_maskos", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_maskproc", (Term.prim_mk_const { Name = "elf_pf_maskproc", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_maskproc", (Term.prim_mk_const { Name = "elf_pf_maskproc", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("exact_permissions_of_permission", (Term.prim_mk_const { Name = "exact_permissions_of_permission", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("exact_permissions_of_permission", (Term.prim_mk_const { Name = "exact_permissions_of_permission", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("allowable_permissions_of_permission", (Term.prim_mk_const { Name = "allowable_permissions_of_permission", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("allowable_permissions_of_permission", (Term.prim_mk_const { Name = "allowable_permissions_of_permission", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf_segment_permissions", (Term.prim_mk_const { Name = "string_of_elf_segment_permissions", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf_segment_permissions", (Term.prim_mk_const { Name = "string_of_elf_segment_permissions", Thy = "elf_program_header_table"}))
  val _ = update_grms temp_add_type "elf32_program_header_table_entry"
  val _ = update_grms temp_add_type "elf32_program_header_table_entry"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_program_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_program_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_CASE", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_CASE", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_size", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_size", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_type", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_type", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_offset", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_offset", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_vaddr", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_vaddr", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_paddr", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_paddr", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_filesz", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_filesz", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_memsz", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_memsz", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_flags", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_flags", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_align", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_align", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_type_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_type_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_offset_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_offset_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_vaddr_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_vaddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_paddr_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_paddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_filesz_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_filesz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_memsz_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_memsz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_flags_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_flags_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_align_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_align_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_type rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_offset rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_vaddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_vaddr rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_paddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_paddr rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_filesz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_filesz rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_memsz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_memsz rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_flags rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_align", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_align rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_type_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_type_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_offset_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_offset_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_vaddr_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_vaddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_paddr_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_paddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_filesz_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_filesz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_memsz_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_memsz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_flags_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_flags_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_align_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_align_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_type_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_offset_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_vaddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_vaddr_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_paddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_paddr_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_filesz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_filesz_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_memsz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_memsz_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_flags_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_align", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_align_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "compare_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "compare_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict", Thy = "elf_program_header_table"}))
  val _ = update_grms temp_add_type "elf64_program_header_table_entry"
  val _ = update_grms temp_add_type "elf64_program_header_table_entry"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_program_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_program_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_CASE", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_CASE", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_size", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_size", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_type", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_type", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_flags", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_flags", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_offset", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_offset", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_vaddr", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_vaddr", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_paddr", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_paddr", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_filesz", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_filesz", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_memsz", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_memsz", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_align", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_align", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_type_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_type_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_flags_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_flags_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_offset_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_offset_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_vaddr_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_vaddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_paddr_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_paddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_filesz_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_filesz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_memsz_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_memsz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_align_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_align_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_type rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_flags rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_offset rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_vaddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_vaddr rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_paddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_paddr rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_filesz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_filesz rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_memsz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_memsz rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_align", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_align rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_type_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_type_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_flags_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_flags_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_offset_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_offset_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_vaddr_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_vaddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_paddr_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_paddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_filesz_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_filesz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_memsz_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_memsz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_align_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_align_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_type_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_flags_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_offset_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_vaddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_vaddr_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_paddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_paddr_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_filesz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_filesz_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_memsz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_memsz_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_align", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_align_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "compare_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "compare_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "string_of_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "string_of_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "string_of_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "string_of_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_program_header_table_entry_default", (Term.prim_mk_const { Name = "string_of_elf32_program_header_table_entry_default", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_program_header_table_entry_default", (Term.prim_mk_const { Name = "string_of_elf32_program_header_table_entry_default", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_program_header_table_entry_default", (Term.prim_mk_const { Name = "string_of_elf64_program_header_table_entry_default", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_program_header_table_entry_default", (Term.prim_mk_const { Name = "string_of_elf64_program_header_table_entry_default", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_program_header_table_elf32_program_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_program_header_table_elf32_program_header_table_entry_dict", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_program_header_table_elf32_program_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_program_header_table_elf32_program_header_table_entry_dict", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_program_header_table_elf64_program_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_program_header_table_elf64_program_header_table_entry_dict", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_program_header_table_elf64_program_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_program_header_table_elf64_program_header_table_entry_dict", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "read_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "read_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "read_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "read_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_program_header_table",Name="elf32_program_header_table"}, T"list" "list"
 [T"elf32_program_header_table_entry" "elf_program_header_table" []])
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_program_header_table",Name="elf64_program_header_table"}, T"list" "list"
 [T"elf64_program_header_table_entry" "elf_program_header_table" []])
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_program_header_table", (Term.prim_mk_const { Name = "bytes_of_elf32_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_program_header_table", (Term.prim_mk_const { Name = "bytes_of_elf32_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_program_header_table", (Term.prim_mk_const { Name = "bytes_of_elf64_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_program_header_table", (Term.prim_mk_const { Name = "bytes_of_elf64_program_header_table", Thy = "elf_program_header_table"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table'", (Term.prim_mk_const { Name = "read_elf32_program_header_table'", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table'", (Term.prim_mk_const { Name = "read_elf32_program_header_table'", Thy = "elf_program_header_table"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table'", (Term.prim_mk_const { Name = "read_elf64_program_header_table'", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table'", (Term.prim_mk_const { Name = "read_elf64_program_header_table'", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table", (Term.prim_mk_const { Name = "read_elf32_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table", (Term.prim_mk_const { Name = "read_elf32_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table", (Term.prim_mk_const { Name = "read_elf64_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table", (Term.prim_mk_const { Name = "read_elf64_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_program_header_table",Name="pht_print_bundle"}, T"prod" "pair"
 [(T"num" "num" [] --> T"list" "list" [T"char" "string" []]),
  (T"num" "num" [] --> T"list" "list" [T"char" "string" []])])
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_program_header_table", (Term.prim_mk_const { Name = "string_of_elf32_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_program_header_table", (Term.prim_mk_const { Name = "string_of_elf32_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_program_header_table", (Term.prim_mk_const { Name = "string_of_elf64_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_program_header_table", (Term.prim_mk_const { Name = "string_of_elf64_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_dynamic_linked", (Term.prim_mk_const { Name = "get_elf32_dynamic_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_dynamic_linked", (Term.prim_mk_const { Name = "get_elf32_dynamic_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_dynamic_linked", (Term.prim_mk_const { Name = "get_elf64_dynamic_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_dynamic_linked", (Term.prim_mk_const { Name = "get_elf64_dynamic_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_static_linked", (Term.prim_mk_const { Name = "get_elf32_static_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_static_linked", (Term.prim_mk_const { Name = "get_elf32_static_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_static_linked", (Term.prim_mk_const { Name = "get_elf64_static_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_static_linked", (Term.prim_mk_const { Name = "get_elf64_static_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_requested_interpreter", (Term.prim_mk_const { Name = "get_elf32_requested_interpreter", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_requested_interpreter", (Term.prim_mk_const { Name = "get_elf32_requested_interpreter", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_requested_interpreter", (Term.prim_mk_const { Name = "get_elf64_requested_interpreter", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_requested_interpreter", (Term.prim_mk_const { Name = "get_elf64_requested_interpreter", Thy = "elf_program_header_table"}))
  val elf_program_header_table_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG elf32_program_header_table_entry_Axiom,
           case_def=elf32_program_header_table_entry_case_def,
           case_cong=elf32_program_header_table_entry_case_cong,
           induction=ORIG elf32_program_header_table_entry_induction,
           nchotomy=elf32_program_header_table_entry_nchotomy,
           size=SOME(Parse.Term`(elf_program_header_table$elf32_program_header_table_entry_size) :(elf_program_header_table$elf32_program_header_table_entry) ->
(num$num)`,
                     ORIG elf32_program_header_table_entry_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf32_program_header_table_entry_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf32_p_type",T"fcp" "cart"
                  [bool,
                   T"fcp" "bit0"
                    [T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"one" "one" []]]]]]]),
 ("elf32_p_offset",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"one" "one" []]]]]]]),
 ("elf32_p_vaddr",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_p_paddr",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_p_filesz",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"one" "one" []]]]]]]),
 ("elf32_p_memsz",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_p_flags",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_p_align",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]])] end,
           accessors=Drule.CONJUNCTS elf32_program_header_table_entry_accessors,
           updates=Drule.CONJUNCTS elf32_program_header_table_entry_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf32_program_header_table_entry_accessors, elf32_program_header_table_entry_updates_eq_literal, elf32_program_header_table_entry_accfupds, elf32_program_header_table_entry_fupdfupds, elf32_program_header_table_entry_literal_11, elf32_program_header_table_entry_fupdfupds_comp, elf32_program_header_table_entry_fupdcanon, elf32_program_header_table_entry_fupdcanon_comp] tyinfo0
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
          {ax=ORIG elf64_program_header_table_entry_Axiom,
           case_def=elf64_program_header_table_entry_case_def,
           case_cong=elf64_program_header_table_entry_case_cong,
           induction=ORIG elf64_program_header_table_entry_induction,
           nchotomy=elf64_program_header_table_entry_nchotomy,
           size=SOME(Parse.Term`(elf_program_header_table$elf64_program_header_table_entry_size) :(elf_program_header_table$elf64_program_header_table_entry) ->
(num$num)`,
                     ORIG elf64_program_header_table_entry_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf64_program_header_table_entry_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf64_p_type",T"fcp" "cart"
                  [bool,
                   T"fcp" "bit0"
                    [T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"one" "one" []]]]]]]),
 ("elf64_p_flags",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf64_p_offset",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"one" "one" []]]]]]]]),
 ("elf64_p_vaddr",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]]),
 ("elf64_p_paddr",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]]),
 ("elf64_p_filesz",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"one" "one" []]]]]]]]),
 ("elf64_p_memsz",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]]),
 ("elf64_p_align",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]])] end,
           accessors=Drule.CONJUNCTS elf64_program_header_table_entry_accessors,
           updates=Drule.CONJUNCTS elf64_program_header_table_entry_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf64_program_header_table_entry_accessors, elf64_program_header_table_entry_updates_eq_literal, elf64_program_header_table_entry_accfupds, elf64_program_header_table_entry_fupdfupds, elf64_program_header_table_entry_literal_11, elf64_program_header_table_entry_fupdfupds_comp, elf64_program_header_table_entry_fupdcanon, elf64_program_header_table_entry_fupdcanon_comp] tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "elf_program_header_table",
    thydataty = "compute",
    data =
        "elf_program_header_table.elf_pt_null_def elf_program_header_table.string_of_elf64_program_header_table_entry_default_def elf_program_header_table.get_elf64_requested_interpreter_def elf_program_header_table.get_elf32_requested_interpreter_def elf_program_header_table.get_elf64_static_linked_def elf_program_header_table.get_elf32_static_linked_def elf_program_header_table.get_elf64_dynamic_linked_def elf_program_header_table.get_elf32_dynamic_linked_def elf_program_header_table.string_of_elf64_program_header_table_def elf_program_header_table.string_of_elf32_program_header_table_def elf_program_header_table.read_elf64_program_header_table_def elf_program_header_table.read_elf32_program_header_table_def elf_program_header_table.bytes_of_elf64_program_header_table_def elf_program_header_table.bytes_of_elf32_program_header_table_def elf_program_header_table.read_elf64_program_header_table_entry_def elf_program_header_table.read_elf32_program_header_table_entry_def elf_program_header_table.bytes_of_elf64_program_header_table_entry_def elf_program_header_table.bytes_of_elf32_program_header_table_entry_def elf_program_header_table.instance_Show_Show_Elf_program_header_table_elf64_program_header_table_entry_dict_def elf_program_header_table.instance_Show_Show_Elf_program_header_table_elf32_program_header_table_entry_dict_def elf_program_header_table.string_of_elf32_program_header_table_entry_def elf_program_header_table.string_of_elf32_program_header_table_entry_default_def elf_program_header_table.string_of_elf64_program_header_table_entry_def elf_program_header_table.instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict_def elf_program_header_table.instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict_def elf_program_header_table.compare_elf64_program_header_table_entry_def elf_program_header_table.string_of_elf_segment_permissions_def elf_program_header_table.compare_elf32_program_header_table_entry_def elf_program_header_table.elf_pt_tls_def elf_program_header_table.allowable_permissions_of_permission_def elf_program_header_table.exact_permissions_of_permission_def elf_program_header_table.elf_pf_maskproc_def elf_program_header_table.elf_pf_maskos_def elf_program_header_table.elf_pf_r_def elf_program_header_table.elf_pf_w_def elf_program_header_table.elf_pf_x_def elf_program_header_table.string_of_segment_type_def elf_program_header_table.elf_pt_hiproc_def elf_program_header_table.elf_pt_loproc_def elf_program_header_table.elf_pt_hios_def elf_program_header_table.elf_pt_loos_def elf_program_header_table.elf_pt_phdr_def elf_program_header_table.elf_pt_shlib_def elf_program_header_table.elf_pt_note_def elf_program_header_table.elf_pt_dynamic_def elf_program_header_table.elf_pt_interp_def elf_program_header_table.elf_pt_load_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "elf_program_header_table"
end
