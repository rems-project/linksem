structure elf_symbol_tableTheory :> elf_symbol_tableTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading elf_symbol_tableTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open elf_headerTheory string_tableTheory
  in end;
  val _ = Theory.link_parents
          ("elf_symbol_table",
          Arbnum.fromString "1471355220",
          Arbnum.fromString "286029")
          [("string_table",
           Arbnum.fromString "1471355139",
           Arbnum.fromString "3264"),
           ("elf_header",
           Arbnum.fromString "1471355161",
           Arbnum.fromString "843300")];
  val _ = Theory.incorporate_types "elf_symbol_table"
       [("elf64_symbol_table_entry", 0), ("elf32_symbol_table_entry", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("num", "num"), ID("min", "fun"), ID("list", "list"),
   ID("string", "char"),
   ID("elf_symbol_table", "elf64_symbol_table_entry"),
   ID("elf_symbol_table", "elf32_symbol_table_entry"), ID("fcp", "cart"),
   ID("fcp", "bit0"), ID("one", "one"), ID("min", "bool"),
   ID("error", "error"), ID("pair", "prod"),
   ID("byte_sequence", "byte_sequence"), ID("endianness", "endianness"),
   ID("show", "Show_class"), ID("lem_basic_classes", "Ord_class"),
   ID("string_table", "string_table"), ID("lem_basic_classes", "ordering"),
   ID("ind_type", "recspace"), ID("min", "ind"), ID("bool", "!"),
   ID("arithmetic", "*"), ID("pair", ","), ID("bool", "/\\"),
   ID("num", "0"), ID("prim_rec", "<"), ID("arithmetic", "<="),
   ID("min", "="), ID("min", "==>"), ID("arithmetic", ">="),
   ID("bool", "?"), ID("list", "APPEND"), ID("bool", "ARB"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("pred_set", "EMPTY"), ID("lem_basic_classes", "EQ"),
   ID("lem_basic_classes", "GT"), ID("bool", "IN"),
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
   ID("elf_types_native_uint", "bytes_of_elf32_addr"),
   ID("elf_types_native_uint", "bytes_of_elf32_half"),
   ID("elf_symbol_table", "bytes_of_elf32_symbol_table_entry"),
   ID("elf_types_native_uint", "bytes_of_elf32_word"),
   ID("elf_types_native_uint", "bytes_of_elf64_addr"),
   ID("elf_types_native_uint", "bytes_of_elf64_half"),
   ID("elf_symbol_table", "bytes_of_elf64_symbol_table_entry"),
   ID("elf_types_native_uint", "bytes_of_elf64_word"),
   ID("elf_types_native_uint", "bytes_of_elf64_xword"),
   ID("elf_types_native_uint", "bytes_of_unsigned_char"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_CASE"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_compare"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_elf32_st_info"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_elf32_st_info_fupd"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_elf32_st_name"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_elf32_st_name_fupd"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_elf32_st_other"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_elf32_st_other_fupd"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_elf32_st_shndx"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_elf32_st_shndx_fupd"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_elf32_st_size"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_elf32_st_size_fupd"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_elf32_st_value"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_elf32_st_value_fupd"),
   ID("elf_symbol_table", "elf32_symbol_table_entry_size"),
   ID("elf_symbol_table", "elf64_null_symbol_table_entry"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_CASE"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_compare"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_info"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_info_fupd"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_name"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_name_fupd"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_other"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_other_fupd"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_shndx"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_shndx_fupd"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_size"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_size_fupd"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_value"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_value_fupd"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_size"),
   ID("error", "error_bind"),
   ID("elf_symbol_table", "extract_symbol_binding"),
   ID("elf_symbol_table", "extract_symbol_type"),
   ID("byte_sequence", "from_byte_lists"),
   ID("lem_basic_classes", "genericCompare"),
   ID("elf_symbol_table", "get_elf32_symbol_binding"),
   ID("elf_symbol_table", "get_elf32_symbol_image_address"),
   ID("elf_symbol_table", "get_elf32_symbol_type"),
   ID("elf_symbol_table", "get_elf64_symbol_binding"),
   ID("elf_symbol_table", "get_elf64_symbol_image_address"),
   ID("elf_symbol_table", "get_elf64_symbol_type"),
   ID("string_table", "get_string_at"),
   ID("elf_symbol_table", "get_symbol_visibility"),
   ID("elf_symbol_table", "instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict"),
   ID("elf_symbol_table", "instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict"),
   ID("elf_symbol_table", "instance_Show_Show_Elf_symbol_table_elf32_symbol_table_entry_dict"),
   ID("elf_symbol_table", "instance_Show_Show_Elf_symbol_table_elf64_symbol_table_entry_dict"),
   ID("elf_symbol_table", "is_elf32_null_entry"),
   ID("elf_symbol_table", "is_elf32_shndx_too_large"),
   ID("elf_symbol_table", "is_elf64_null_entry"),
   ID("elf_symbol_table", "is_elf64_shndx_too_large"),
   ID("byte_sequence", "length0"),
   ID("elf_symbol_table", "make_symbol_info"),
   ID("elf_symbol_table", "make_symbol_other"), ID("error", "mapM"),
   ID("words", "n2w"), ID("ASCIInumbers", "num_to_dec_string"),
   ID("combin", "o"), ID("elf_types_native_uint", "read_elf32_addr"),
   ID("elf_types_native_uint", "read_elf32_half"),
   ID("elf_symbol_table", "read_elf32_symbol_table"),
   ID("elf_symbol_table", "read_elf32_symbol_table_entry"),
   ID("elf_types_native_uint", "read_elf32_word"),
   ID("elf_types_native_uint", "read_elf64_addr"),
   ID("elf_types_native_uint", "read_elf64_half"),
   ID("elf_symbol_table", "read_elf64_symbol_table"),
   ID("elf_symbol_table", "read_elf64_symbol_table_entry"),
   ID("elf_types_native_uint", "read_elf64_word"),
   ID("elf_types_native_uint", "read_elf64_xword"),
   ID("elf_types_native_uint", "read_unsigned_char"),
   ID("elf_symbol_table", "recordtype.elf32_symbol_table_entry"),
   ID("elf_symbol_table", "recordtype.elf64_symbol_table_entry"),
   ID("error", "return"), ID("lem_basic_classes", "sextupleCompare"),
   ID("elf_header", "shn_xindex"), ID("elf_symbol_table", "stb_global"),
   ID("elf_symbol_table", "stb_hios"),
   ID("elf_symbol_table", "stb_hiproc"),
   ID("elf_symbol_table", "stb_local"), ID("elf_symbol_table", "stb_loos"),
   ID("elf_symbol_table", "stb_loproc"),
   ID("elf_symbol_table", "stb_weak"), ID("elf_symbol_table", "stn_undef"),
   ID("elf_symbol_table", "string_of_elf32_symbol_table"),
   ID("elf_symbol_table", "string_of_elf32_symbol_table_entry"),
   ID("elf_symbol_table", "string_of_elf64_symbol_table"),
   ID("elf_symbol_table", "string_of_elf64_symbol_table_entry"),
   ID("elf_symbol_table", "string_of_symbol_binding"),
   ID("elf_symbol_table", "string_of_symbol_type"),
   ID("elf_symbol_table", "string_of_symbol_visibility"),
   ID("elf_symbol_table", "stt_common"),
   ID("elf_symbol_table", "stt_file"), ID("elf_symbol_table", "stt_func"),
   ID("elf_symbol_table", "stt_hios"),
   ID("elf_symbol_table", "stt_hiproc"),
   ID("elf_symbol_table", "stt_loos"),
   ID("elf_symbol_table", "stt_loproc"),
   ID("elf_symbol_table", "stt_notype"),
   ID("elf_symbol_table", "stt_object"),
   ID("elf_symbol_table", "stt_section"),
   ID("elf_symbol_table", "stt_tls"),
   ID("elf_symbol_table", "stv_default"),
   ID("elf_symbol_table", "stv_hidden"),
   ID("elf_symbol_table", "stv_internal"),
   ID("elf_symbol_table", "stv_protected"),
   ID("missing_pervasives", "unlines"), ID("words", "w2n"),
   ID("words", "word_add"), ID("words", "word_and"),
   ID("words", "word_lsl"), ID("words", "word_lsr"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYOP [3], TYOP [2, 1], TYOP [1, 0, 2], TYOP [1, 3, 2],
   TYOP [1, 3, 4], TYOP [1, 0, 5], TYOP [4], TYOP [1, 7, 2], TYOP [2, 7],
   TYOP [1, 9, 2], TYOP [5], TYOP [1, 11, 2], TYOP [2, 11],
   TYOP [1, 13, 2], TYOP [8], TYOP [7, 15], TYOP [7, 16], TYOP [7, 17],
   TYOP [7, 18], TYOP [7, 19], TYOP [7, 20], TYOP [9], TYOP [6, 22, 21],
   TYOP [1, 23, 7], TYOP [1, 23, 24], TYOP [6, 22, 19], TYOP [1, 26, 25],
   TYOP [6, 22, 18], TYOP [1, 28, 27], TYOP [1, 28, 29], TYOP [6, 22, 20],
   TYOP [1, 31, 30], TYOP [1, 26, 11], TYOP [1, 28, 33], TYOP [1, 28, 34],
   TYOP [1, 31, 35], TYOP [1, 31, 36], TYOP [1, 31, 37], TYOP [12],
   TYOP [11, 7, 39], TYOP [10, 40], TYOP [1, 39, 41], TYOP [13],
   TYOP [1, 43, 42], TYOP [10, 9], TYOP [1, 39, 45], TYOP [1, 43, 46],
   TYOP [11, 11, 39], TYOP [10, 48], TYOP [1, 39, 49], TYOP [1, 43, 50],
   TYOP [10, 13], TYOP [1, 39, 52], TYOP [1, 43, 53], TYOP [1, 0, 28],
   TYOP [1, 0, 55], TYOP [1, 7, 22], TYOP [1, 11, 22], TYOP [14, 7],
   TYOP [14, 11], TYOP [15, 7], TYOP [15, 11], TYOP [1, 28, 0],
   TYOP [1, 7, 0], TYOP [11, 0, 0], TYOP [11, 0, 65], TYOP [11, 0, 66],
   TYOP [11, 2, 67], TYOP [2, 68], TYOP [10, 69], TYOP [16],
   TYOP [1, 71, 70], TYOP [1, 9, 72], TYOP [1, 11, 0], TYOP [1, 13, 72],
   TYV "'a", TYOP [6, 22, 76], TYOP [1, 77, 0], TYOP [1, 7, 7],
   TYOP [1, 23, 23], TYOP [1, 80, 79], TYOP [1, 7, 23], TYOP [1, 26, 26],
   TYOP [1, 83, 79], TYOP [1, 7, 26], TYOP [1, 28, 28], TYOP [1, 86, 79],
   TYOP [1, 7, 28], TYOP [1, 31, 31], TYOP [1, 89, 79], TYOP [1, 7, 31],
   TYOP [17], TYOP [1, 7, 92], TYOP [1, 7, 93], TYOP [1, 23, 76],
   TYOP [1, 23, 95], TYOP [1, 26, 96], TYOP [1, 28, 97], TYOP [1, 28, 98],
   TYOP [1, 31, 99], TYOP [1, 100, 76], TYOP [1, 7, 101], TYOP [1, 11, 11],
   TYOP [1, 89, 103], TYOP [1, 11, 31], TYOP [1, 83, 103],
   TYOP [1, 11, 26], TYOP [1, 86, 103], TYOP [1, 11, 28], TYOP [1, 11, 92],
   TYOP [1, 11, 110], TYOP [1, 26, 76], TYOP [1, 28, 112],
   TYOP [1, 28, 113], TYOP [1, 31, 114], TYOP [1, 31, 115],
   TYOP [1, 31, 116], TYOP [1, 117, 76], TYOP [1, 11, 118],
   TYOP [1, 7, 39], TYOP [1, 43, 120], TYOP [1, 11, 39], TYOP [1, 43, 122],
   TYOP [11, 28, 26], TYOP [11, 28, 124], TYOP [11, 31, 125],
   TYOP [11, 31, 126], TYOP [11, 31, 127], TYOP [18, 128],
   TYOP [1, 129, 22], TYOP [11, 23, 23], TYOP [11, 26, 131],
   TYOP [11, 28, 132], TYOP [11, 28, 133], TYOP [11, 31, 134],
   TYOP [18, 135], TYOP [1, 136, 22], TYOP [1, 39, 22], TYOP [1, 43, 138],
   TYOP [11, 43, 39], TYOP [1, 140, 22], TYOP [1, 140, 141], TYOP [19],
   TYOP [1, 11, 76], TYOP [1, 7, 76], TYOP [1, 76, 11], TYOP [1, 76, 7],
   TYOP [1, 26, 22], TYOP [1, 28, 148], TYOP [1, 28, 149],
   TYOP [1, 31, 150], TYOP [1, 31, 151], TYOP [1, 31, 152],
   TYOP [1, 143, 153], TYOP [1, 23, 22], TYOP [1, 23, 155],
   TYOP [1, 26, 156], TYOP [1, 28, 157], TYOP [1, 28, 158],
   TYOP [1, 31, 159], TYOP [1, 143, 160], TYOP [1, 11, 129],
   TYOP [1, 7, 136], TYOP [1, 138, 22], TYOP [1, 77, 22],
   TYOP [1, 165, 22], TYOP [1, 155, 22], TYOP [1, 31, 22],
   TYOP [1, 168, 22], TYOP [1, 148, 22], TYOP [1, 28, 22],
   TYOP [1, 171, 22], TYOP [1, 58, 22], TYOP [1, 57, 22], TYOP [1, 43, 22],
   TYOP [1, 175, 22], TYOP [1, 146, 22], TYOP [1, 177, 22],
   TYOP [1, 147, 22], TYOP [1, 179, 22], TYOP [1, 80, 22],
   TYOP [1, 181, 22], TYOP [1, 89, 22], TYOP [1, 183, 22],
   TYOP [1, 117, 22], TYOP [1, 185, 22], TYOP [1, 100, 22],
   TYOP [1, 187, 22], TYOP [1, 83, 22], TYOP [1, 189, 22],
   TYOP [1, 86, 22], TYOP [1, 191, 22], TYOP [1, 173, 22],
   TYOP [1, 174, 22], TYOP [1, 139, 22], TYOP [1, 195, 22],
   TYOP [1, 3, 22], TYOP [1, 197, 22], TYOP [1, 130, 22],
   TYOP [1, 199, 22], TYOP [1, 137, 22], TYOP [1, 201, 22],
   TYOP [1, 13, 22], TYOP [1, 203, 22], TYOP [1, 9, 22], TYOP [1, 205, 22],
   TYOP [1, 0, 22], TYOP [1, 207, 22], TYOP [1, 71, 22], TYOP [1, 209, 22],
   TYOP [1, 0, 0], TYOP [1, 0, 211], TYOP [1, 23, 131], TYOP [1, 23, 213],
   TYOP [1, 127, 128], TYOP [1, 31, 215], TYOP [1, 126, 127],
   TYOP [1, 31, 217], TYOP [1, 125, 126], TYOP [1, 31, 219],
   TYOP [1, 134, 135], TYOP [1, 31, 221], TYOP [1, 131, 132],
   TYOP [1, 26, 223], TYOP [1, 26, 124], TYOP [1, 28, 225],
   TYOP [1, 132, 133], TYOP [1, 28, 227], TYOP [1, 124, 125],
   TYOP [1, 28, 229], TYOP [1, 133, 134], TYOP [1, 28, 231],
   TYOP [1, 39, 48], TYOP [1, 11, 233], TYOP [1, 39, 40], TYOP [1, 7, 235],
   TYOP [1, 39, 140], TYOP [1, 43, 237], TYOP [1, 67, 68],
   TYOP [1, 2, 239], TYOP [1, 0, 65], TYOP [1, 0, 241], TYOP [1, 65, 66],
   TYOP [1, 0, 243], TYOP [1, 66, 67], TYOP [1, 0, 245], TYOP [11, 0, 67],
   TYOP [1, 67, 247], TYOP [1, 0, 248], TYOP [11, 0, 247],
   TYOP [1, 247, 250], TYOP [1, 0, 251], TYOP [1, 22, 22],
   TYOP [1, 22, 253], TYOP [1, 0, 207], TYOP [1, 76, 22],
   TYOP [1, 76, 256], TYOP [1, 62, 22], TYOP [1, 62, 258],
   TYOP [1, 61, 22], TYOP [1, 61, 260], TYOP [1, 60, 22],
   TYOP [1, 60, 262], TYOP [1, 59, 22], TYOP [1, 59, 264],
   TYOP [1, 39, 138], TYOP [1, 31, 168], TYOP [1, 26, 148],
   TYOP [1, 28, 171], TYOP [1, 11, 58], TYOP [1, 7, 57], TYOP [1, 52, 22],
   TYOP [1, 52, 272], TYOP [1, 45, 22], TYOP [1, 45, 274],
   TYOP [1, 70, 22], TYOP [1, 70, 276], TYOP [1, 49, 22],
   TYOP [1, 49, 278], TYOP [1, 41, 22], TYOP [1, 41, 280],
   TYOP [1, 146, 177], TYOP [1, 147, 179], TYOP [1, 103, 22],
   TYOP [1, 103, 284], TYOP [1, 79, 22], TYOP [1, 79, 286],
   TYOP [1, 2, 22], TYOP [1, 2, 288], TYOP [1, 92, 22], TYOP [1, 92, 290],
   TYOP [1, 129, 130], TYOP [1, 136, 137], TYOP [1, 144, 22],
   TYOP [1, 294, 22], TYOP [1, 162, 22], TYOP [1, 296, 22],
   TYOP [1, 145, 22], TYOP [1, 298, 22], TYOP [1, 163, 22],
   TYOP [1, 300, 22], TYOP [1, 2, 2], TYOP [1, 2, 302], TYOP [1, 0, 1],
   TYOP [1, 52, 52], TYOP [1, 52, 305], TYOP [1, 22, 306],
   TYOP [1, 45, 45], TYOP [1, 45, 308], TYOP [1, 22, 309],
   TYOP [1, 22, 303], TYOP [1, 1, 302], TYOP [1, 13, 13],
   TYOP [1, 11, 313], TYOP [1, 9, 9], TYOP [1, 7, 315], TYOP [2, 28],
   TYOP [2, 317], TYOP [1, 318, 318], TYOP [1, 317, 319], TYOP [2, 2],
   TYOP [1, 321, 321], TYOP [1, 2, 322], TYOP [1, 0, 129],
   TYOP [1, 324, 129], TYOP [1, 128, 325], TYOP [1, 0, 326],
   TYOP [1, 0, 136], TYOP [1, 328, 136], TYOP [1, 135, 329],
   TYOP [1, 0, 330], TYOP [1, 290, 22], TYOP [1, 92, 332],
   TYOP [1, 290, 290], TYOP [1, 92, 334], TYOP [1, 23, 80],
   TYOP [1, 31, 89], TYOP [1, 26, 83], TYOP [1, 28, 86],
   TYOP [1, 270, 270], TYOP [1, 270, 340], TYOP [1, 111, 111],
   TYOP [1, 111, 342], TYOP [1, 12, 12], TYOP [1, 12, 344],
   TYOP [1, 271, 271], TYOP [1, 271, 346], TYOP [1, 94, 94],
   TYOP [1, 94, 348], TYOP [1, 8, 8], TYOP [1, 8, 350], TYOP [10, 68],
   TYOP [1, 0, 352], TYOP [1, 353, 353], TYOP [1, 13, 321],
   TYOP [1, 12, 355], TYOP [1, 9, 321], TYOP [1, 8, 357], TYOP [1, 62, 62],
   TYOP [1, 342, 359], TYOP [1, 61, 61], TYOP [1, 348, 361],
   TYOP [1, 340, 359], TYOP [1, 346, 361], TYOP [1, 60, 60],
   TYOP [1, 344, 365], TYOP [1, 59, 59], TYOP [1, 350, 367],
   TYOP [1, 130, 296], TYOP [1, 137, 300], TYOP [11, 23, 39],
   TYOP [1, 371, 41], TYOP [1, 23, 42], TYOP [1, 373, 372],
   TYOP [11, 31, 39], TYOP [1, 375, 49], TYOP [1, 31, 50],
   TYOP [1, 377, 376], TYOP [1, 375, 41], TYOP [1, 31, 42],
   TYOP [1, 380, 379], TYOP [11, 26, 39], TYOP [1, 382, 49],
   TYOP [1, 26, 50], TYOP [1, 384, 383], TYOP [1, 382, 41],
   TYOP [1, 26, 42], TYOP [1, 387, 386], TYOP [11, 28, 39],
   TYOP [1, 389, 49], TYOP [1, 28, 50], TYOP [1, 391, 390],
   TYOP [1, 389, 41], TYOP [1, 28, 42], TYOP [1, 394, 393],
   TYOP [1, 48, 52], TYOP [1, 11, 53], TYOP [1, 397, 396],
   TYOP [1, 40, 45], TYOP [1, 7, 46], TYOP [1, 400, 399],
   TYOP [1, 142, 22], TYOP [1, 31, 317], TYOP [1, 43, 403],
   TYOP [1, 26, 317], TYOP [1, 43, 405], TYOP [1, 23, 317],
   TYOP [1, 43, 407], TYOP [1, 28, 317], TYOP [1, 2, 352],
   TYOP [1, 410, 352], TYOP [10, 2], TYOP [1, 412, 411], TYOP [1, 13, 52],
   TYOP [1, 414, 52], TYOP [1, 52, 415], TYOP [1, 9, 45],
   TYOP [1, 417, 45], TYOP [1, 45, 418], TYOP [1, 372, 41], TYOP [10, 371],
   TYOP [1, 421, 420], TYOP [1, 376, 49], TYOP [10, 375],
   TYOP [1, 424, 423], TYOP [1, 379, 41], TYOP [1, 424, 426],
   TYOP [1, 383, 49], TYOP [10, 382], TYOP [1, 429, 428],
   TYOP [1, 386, 41], TYOP [1, 429, 431], TYOP [1, 390, 49],
   TYOP [10, 389], TYOP [1, 434, 433], TYOP [1, 393, 41],
   TYOP [1, 434, 436], TYOP [1, 396, 52], TYOP [1, 49, 438],
   TYOP [1, 399, 45], TYOP [1, 41, 440], TYOP [1, 318, 39],
   TYOP [1, 0, 92], TYOP [1, 0, 443], TYOP [1, 255, 444],
   TYOP [1, 255, 445], TYOP [1, 71, 412], TYOP [1, 0, 447],
   TYOP [1, 39, 0], TYOP [1, 13, 70], TYOP [1, 11, 352],
   TYOP [1, 451, 450], TYOP [1, 9, 70], TYOP [1, 7, 352],
   TYOP [1, 454, 453], TYOP [1, 0, 23], TYOP [1, 0, 31], TYOP [1, 0, 26],
   TYOP [1, 80, 80], TYOP [1, 80, 459], TYOP [1, 89, 89],
   TYOP [1, 89, 461], TYOP [1, 83, 83], TYOP [1, 83, 463],
   TYOP [1, 86, 86], TYOP [1, 86, 465], TYOP [1, 146, 146],
   TYOP [1, 103, 467], TYOP [1, 103, 103], TYOP [1, 103, 469],
   TYOP [1, 147, 147], TYOP [1, 79, 471], TYOP [1, 79, 79],
   TYOP [1, 79, 473], TYOP [1, 23, 2], TYOP [1, 23, 0], TYOP [1, 476, 475],
   TYOP [1, 3, 477], TYOP [1, 31, 2], TYOP [1, 31, 0], TYOP [1, 480, 479],
   TYOP [1, 3, 481], TYOP [1, 26, 2], TYOP [1, 26, 0], TYOP [1, 484, 483],
   TYOP [1, 3, 485], TYOP [1, 28, 2], TYOP [1, 63, 487], TYOP [1, 3, 488],
   TYOP [1, 39, 424], TYOP [1, 43, 490], TYOP [1, 39, 429],
   TYOP [1, 43, 492], TYOP [1, 39, 421], TYOP [1, 43, 494],
   TYOP [1, 39, 434], TYOP [1, 43, 496], TYOP [1, 48, 49],
   TYOP [1, 40, 41], TYOP [1, 68, 352], TYOP [1, 250, 92],
   TYOP [1, 250, 501], TYOP [1, 444, 502], TYOP [1, 444, 503],
   TYOP [1, 444, 504], TYOP [1, 444, 505], TYOP [1, 444, 506],
   TYOP [1, 444, 507], TYOP [1, 321, 2], TYOP [1, 28, 55], TYOP [1, 0, 77],
   TYOP [1, 77, 511]]
  end
  val _ = Theory.incorporate_consts "elf_symbol_table" tyvector
     [("stv_protected", 0), ("stv_internal", 0), ("stv_hidden", 0),
      ("stv_default", 0), ("stt_tls", 0), ("stt_section", 0),
      ("stt_object", 0), ("stt_notype", 0), ("stt_loproc", 0),
      ("stt_loos", 0), ("stt_hiproc", 0), ("stt_hios", 0), ("stt_func", 0),
      ("stt_file", 0), ("stt_common", 0),
      ("string_of_symbol_visibility", 3), ("string_of_symbol_type", 6),
      ("string_of_symbol_binding", 6),
      ("string_of_elf64_symbol_table_entry", 8),
      ("string_of_elf64_symbol_table", 10),
      ("string_of_elf32_symbol_table_entry", 12),
      ("string_of_elf32_symbol_table", 14), ("stn_undef", 0),
      ("stb_weak", 0), ("stb_loproc", 0), ("stb_loos", 0),
      ("stb_local", 0), ("stb_hiproc", 0), ("stb_hios", 0),
      ("stb_global", 0), ("recordtype.elf64_symbol_table_entry", 32),
      ("recordtype.elf32_symbol_table_entry", 38),
      ("read_elf64_symbol_table_entry", 44),
      ("read_elf64_symbol_table", 47),
      ("read_elf32_symbol_table_entry", 51),
      ("read_elf32_symbol_table", 54), ("make_symbol_other", 55),
      ("make_symbol_info", 56), ("is_elf64_shndx_too_large", 57),
      ("is_elf64_null_entry", 57), ("is_elf32_shndx_too_large", 58),
      ("is_elf32_null_entry", 58),
      ("instance_Show_Show_Elf_symbol_table_elf64_symbol_table_entry_dict", 59),
      ("instance_Show_Show_Elf_symbol_table_elf32_symbol_table_entry_dict", 60),
      ("instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict", 61),
      ("instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict", 62),
      ("get_symbol_visibility", 63), ("get_elf64_symbol_type", 64),
      ("get_elf64_symbol_image_address", 73),
      ("get_elf64_symbol_binding", 64), ("get_elf32_symbol_type", 74),
      ("get_elf32_symbol_image_address", 75),
      ("get_elf32_symbol_binding", 74), ("extract_symbol_type", 63),
      ("extract_symbol_binding", 78),
      ("elf64_symbol_table_entry_size", 64),
      ("elf64_symbol_table_entry_elf64_st_value_fupd", 81),
      ("elf64_symbol_table_entry_elf64_st_value", 82),
      ("elf64_symbol_table_entry_elf64_st_size_fupd", 81),
      ("elf64_symbol_table_entry_elf64_st_size", 82),
      ("elf64_symbol_table_entry_elf64_st_shndx_fupd", 84),
      ("elf64_symbol_table_entry_elf64_st_shndx", 85),
      ("elf64_symbol_table_entry_elf64_st_other_fupd", 87),
      ("elf64_symbol_table_entry_elf64_st_other", 88),
      ("elf64_symbol_table_entry_elf64_st_name_fupd", 90),
      ("elf64_symbol_table_entry_elf64_st_name", 91),
      ("elf64_symbol_table_entry_elf64_st_info_fupd", 87),
      ("elf64_symbol_table_entry_elf64_st_info", 88),
      ("elf64_symbol_table_entry_compare", 94),
      ("elf64_symbol_table_entry_CASE", 102),
      ("elf64_null_symbol_table_entry", 7),
      ("elf32_symbol_table_entry_size", 74),
      ("elf32_symbol_table_entry_elf32_st_value_fupd", 104),
      ("elf32_symbol_table_entry_elf32_st_value", 105),
      ("elf32_symbol_table_entry_elf32_st_size_fupd", 104),
      ("elf32_symbol_table_entry_elf32_st_size", 105),
      ("elf32_symbol_table_entry_elf32_st_shndx_fupd", 106),
      ("elf32_symbol_table_entry_elf32_st_shndx", 107),
      ("elf32_symbol_table_entry_elf32_st_other_fupd", 108),
      ("elf32_symbol_table_entry_elf32_st_other", 109),
      ("elf32_symbol_table_entry_elf32_st_name_fupd", 104),
      ("elf32_symbol_table_entry_elf32_st_name", 105),
      ("elf32_symbol_table_entry_elf32_st_info_fupd", 108),
      ("elf32_symbol_table_entry_elf32_st_info", 109),
      ("elf32_symbol_table_entry_compare", 111),
      ("elf32_symbol_table_entry_CASE", 119),
      ("bytes_of_elf64_symbol_table_entry", 121),
      ("bytes_of_elf32_symbol_table_entry", 123)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'elf32_symbol_table_entry'", 130),
   TMV("'elf64_symbol_table_entry'", 137), TMV("M", 11), TMV("M", 7),
   TMV("M'", 11), TMV("M'", 7), TMV("P", 58), TMV("P", 57), TMV("P", 139),
   TMV("R", 142), TMV("a0", 31), TMV("a0'", 31), TMV("a0'", 129),
   TMV("a0'", 136), TMV("a1", 31), TMV("a1", 28), TMV("a1'", 31),
   TMV("a1'", 28), TMV("a2", 31), TMV("a2", 28), TMV("a2'", 31),
   TMV("a2'", 28), TMV("a3", 26), TMV("a3", 28), TMV("a3'", 26),
   TMV("a3'", 28), TMV("a4", 23), TMV("a4", 28), TMV("a4'", 23),
   TMV("a4'", 28), TMV("a5", 23), TMV("a5", 26), TMV("a5'", 23),
   TMV("a5'", 26), TMV("addr", 0), TMV("binding", 0), TMV("bnd", 0),
   TMV("bs0", 39), TMV("bs0'", 39), TMV("c", 23), TMV("c", 31),
   TMV("c", 26), TMV("c0", 23), TMV("c0", 31), TMV("c0", 28),
   TMV("c01", 23), TMV("c01", 28), TMV("c02", 23), TMV("c02", 28),
   TMV("c1", 23), TMV("c1", 31), TMV("c1", 26), TMV("c1", 28),
   TMV("c11", 26), TMV("c11", 28), TMV("c12", 26), TMV("c12", 28),
   TMV("c2", 23), TMV("c2", 31), TMV("c2", 26), TMV("c2", 28),
   TMV("c21", 31), TMV("c21", 28), TMV("c22", 31), TMV("c22", 28),
   TMV("c3", 23), TMV("c3", 31), TMV("c3", 28), TMV("c31", 31),
   TMV("c31", 28), TMV("c32", 31), TMV("c32", 28), TMV("c4", 23),
   TMV("c4", 31), TMV("c4", 26), TMV("c41", 31), TMV("c42", 31),
   TMV("e", 11), TMV("e", 7), TMV("e1", 11), TMV("e1", 7), TMV("e2", 11),
   TMV("e2", 7), TMV("ee", 11), TMV("ee", 7), TMV("elf32_st_info", 28),
   TMV("elf32_st_name", 31), TMV("elf32_st_other", 28),
   TMV("elf32_st_shndx", 26), TMV("elf32_st_size", 31),
   TMV("elf32_st_value", 31), TMV("elf32_symbol_table_entry", 143),
   TMV("elf64_st_info", 28), TMV("elf64_st_name", 31),
   TMV("elf64_st_other", 28), TMV("elf64_st_shndx", 26),
   TMV("elf64_st_size", 23), TMV("elf64_st_value", 23),
   TMV("elf64_symbol_table_entry", 143), TMV("endian", 43), TMV("ent", 11),
   TMV("ent", 7), TMV("ent1", 11), TMV("ent1", 7), TMV("ent2", 11),
   TMV("ent2", 7), TMV("entry", 77), TMV("entry", 28), TMV("entry", 11),
   TMV("entry", 7), TMV("f", 80), TMV("f", 89), TMV("f", 117),
   TMV("f", 100), TMV("f", 83), TMV("f", 86), TMV("f'", 117),
   TMV("f'", 100), TMV("f1", 11), TMV("f1", 7), TMV("f2", 11),
   TMV("f2", 7), TMV("fn", 144), TMV("fn", 145), TMV("g", 80),
   TMV("g", 89), TMV("g", 83), TMV("g", 86), TMV("h", 146), TMV("h", 147),
   TMV("head", 11), TMV("head", 7), TMV("info", 28), TMV("m", 0),
   TMV("n", 0), TMV("name", 0), TMV("os", 3), TMV("proc", 3),
   TMV("record", 154), TMV("record", 161), TMV("rep", 162),
   TMV("rep", 163), TMV("size1", 0), TMV("st_info", 28),
   TMV("st_name", 31), TMV("st_other", 28), TMV("st_shndx", 26),
   TMV("st_size", 23), TMV("st_size", 31), TMV("st_value", 23),
   TMV("st_value", 31), TMV("str", 2), TMV("strtab", 71),
   TMV("syment", 11), TMV("syment", 7), TMV("symtab", 13),
   TMV("symtab", 9), TMV("symtype", 0), TMV("tail", 13), TMV("tail", 9),
   TMV("typ", 0), TMV("v", 43), TMV("v1", 39), TMV("visibility", 0),
   TMC(20, 164), TMC(20, 166), TMC(20, 167), TMC(20, 169), TMC(20, 170),
   TMC(20, 172), TMC(20, 173), TMC(20, 174), TMC(20, 176), TMC(20, 178),
   TMC(20, 180), TMC(20, 182), TMC(20, 184), TMC(20, 186), TMC(20, 188),
   TMC(20, 190), TMC(20, 192), TMC(20, 193), TMC(20, 194), TMC(20, 196),
   TMC(20, 198), TMC(20, 200), TMC(20, 202), TMC(20, 204), TMC(20, 206),
   TMC(20, 208), TMC(20, 199), TMC(20, 201), TMC(20, 210), TMC(21, 212),
   TMC(22, 214), TMC(22, 216), TMC(22, 218), TMC(22, 220), TMC(22, 222),
   TMC(22, 224), TMC(22, 226), TMC(22, 228), TMC(22, 230), TMC(22, 232),
   TMC(22, 234), TMC(22, 236), TMC(22, 238), TMC(22, 240), TMC(22, 242),
   TMC(22, 244), TMC(22, 246), TMC(22, 249), TMC(22, 252), TMC(23, 254),
   TMC(24, 0), TMC(25, 255), TMC(26, 255), TMC(27, 257), TMC(27, 259),
   TMC(27, 261), TMC(27, 263), TMC(27, 265), TMC(27, 254), TMC(27, 266),
   TMC(27, 156), TMC(27, 267), TMC(27, 268), TMC(27, 269), TMC(27, 270),
   TMC(27, 271), TMC(27, 273), TMC(27, 275), TMC(27, 277), TMC(27, 279),
   TMC(27, 281), TMC(27, 282), TMC(27, 283), TMC(27, 285), TMC(27, 287),
   TMC(27, 289), TMC(27, 255), TMC(27, 291), TMC(27, 292), TMC(27, 293),
   TMC(28, 254), TMC(29, 255), TMC(30, 167), TMC(30, 169), TMC(30, 170),
   TMC(30, 172), TMC(30, 173), TMC(30, 174), TMC(30, 295), TMC(30, 297),
   TMC(30, 299), TMC(30, 301), TMC(31, 303), TMC(32, 62), TMC(32, 61),
   TMC(32, 60), TMC(32, 59), TMC(32, 11), TMC(32, 7), TMC(33, 211),
   TMC(34, 211), TMC(35, 129), TMC(35, 136), TMC(36, 304), TMC(37, 307),
   TMC(37, 310), TMC(37, 311), TMC(38, 312), TMC(38, 314), TMC(38, 316),
   TMC(38, 320), TMC(38, 323), TMC(39, 327), TMC(39, 331), TMC(40, 253),
   TMC(41, 290), TMC(42, 92), TMC(43, 92), TMC(44, 333), TMC(45, 335),
   TMC(46, 336), TMC(46, 337), TMC(46, 338), TMC(46, 339), TMC(46, 341),
   TMC(46, 343), TMC(46, 345), TMC(46, 347), TMC(46, 349), TMC(46, 351),
   TMC(47, 354), TMC(48, 92), TMC(49, 356), TMC(49, 358), TMC(50, 2),
   TMC(50, 13), TMC(50, 9), TMC(50, 318), TMC(50, 321), TMC(51, 211),
   TMC(52, 360), TMC(52, 362), TMC(53, 363), TMC(53, 364), TMC(54, 363),
   TMC(54, 364), TMC(55, 363), TMC(55, 364), TMC(56, 363), TMC(56, 364),
   TMC(57, 366), TMC(57, 368), TMC(58, 369), TMC(58, 370), TMC(59, 374),
   TMC(59, 378), TMC(59, 381), TMC(59, 385), TMC(59, 388), TMC(59, 392),
   TMC(59, 395), TMC(59, 398), TMC(59, 401), TMC(60, 402), TMC(61, 0),
   TMC(62, 404), TMC(63, 406), TMC(64, 123), TMC(65, 404), TMC(66, 408),
   TMC(67, 406), TMC(68, 121), TMC(69, 404), TMC(70, 408), TMC(71, 409),
   TMC(72, 119), TMC(73, 111), TMC(74, 109), TMC(75, 108), TMC(76, 105),
   TMC(77, 104), TMC(78, 109), TMC(79, 108), TMC(80, 107), TMC(81, 106),
   TMC(82, 105), TMC(83, 104), TMC(84, 105), TMC(85, 104), TMC(86, 74),
   TMC(87, 7), TMC(88, 102), TMC(89, 94), TMC(90, 88), TMC(91, 87),
   TMC(92, 91), TMC(93, 90), TMC(94, 88), TMC(95, 87), TMC(96, 85),
   TMC(97, 84), TMC(98, 82), TMC(99, 81), TMC(100, 82), TMC(101, 81),
   TMC(102, 64), TMC(103, 413), TMC(103, 416), TMC(103, 419),
   TMC(103, 422), TMC(103, 425), TMC(103, 427), TMC(103, 430),
   TMC(103, 432), TMC(103, 435), TMC(103, 437), TMC(103, 439),
   TMC(103, 441), TMC(104, 78), TMC(104, 63), TMC(105, 63), TMC(106, 442),
   TMC(107, 446), TMC(108, 74), TMC(109, 75), TMC(110, 74), TMC(111, 64),
   TMC(112, 73), TMC(113, 64), TMC(114, 448), TMC(115, 63), TMC(116, 62),
   TMC(117, 61), TMC(118, 60), TMC(119, 59), TMC(120, 58), TMC(121, 58),
   TMC(122, 57), TMC(123, 57), TMC(124, 449), TMC(125, 56), TMC(126, 55),
   TMC(127, 452), TMC(127, 455), TMC(128, 456), TMC(128, 457),
   TMC(128, 458), TMC(128, 55), TMC(129, 3), TMC(130, 460), TMC(130, 462),
   TMC(130, 464), TMC(130, 466), TMC(130, 468), TMC(130, 470),
   TMC(130, 472), TMC(130, 474), TMC(130, 478), TMC(130, 482),
   TMC(130, 486), TMC(130, 489), TMC(131, 491), TMC(132, 493),
   TMC(133, 54), TMC(134, 51), TMC(135, 491), TMC(136, 495), TMC(137, 493),
   TMC(138, 47), TMC(139, 44), TMC(140, 491), TMC(141, 495), TMC(142, 497),
   TMC(143, 38), TMC(144, 32), TMC(145, 414), TMC(145, 417), TMC(145, 498),
   TMC(145, 499), TMC(145, 500), TMC(146, 508), TMC(147, 0), TMC(148, 0),
   TMC(149, 0), TMC(150, 0), TMC(151, 0), TMC(152, 0), TMC(153, 0),
   TMC(154, 0), TMC(155, 0), TMC(156, 14), TMC(157, 12), TMC(158, 10),
   TMC(159, 8), TMC(160, 6), TMC(161, 6), TMC(162, 3), TMC(163, 0),
   TMC(164, 0), TMC(165, 0), TMC(166, 0), TMC(167, 0), TMC(168, 0),
   TMC(169, 0), TMC(170, 0), TMC(171, 0), TMC(172, 0), TMC(173, 0),
   TMC(174, 0), TMC(175, 0), TMC(176, 0), TMC(177, 0), TMC(178, 509),
   TMC(179, 78), TMC(179, 476), TMC(179, 480), TMC(179, 484), TMC(179, 63),
   TMC(180, 339), TMC(181, 339), TMC(182, 510), TMC(183, 512),
   TMC(184, 253)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op stn_undef_def x = x
    val op stn_undef_def =
    DT(((("elf_symbol_table",0),[]),[]), [read"%240%453@%214@"])
  fun op stb_local_def x = x
    val op stb_local_def =
    DT(((("elf_symbol_table",1),[]),[]), [read"%240%449@%214@"])
  fun op stb_global_def x = x
    val op stb_global_def =
    DT(((("elf_symbol_table",2),[]),[]), [read"%240%446@%303%263%328@@@"])
  fun op stb_weak_def x = x
    val op stb_weak_def =
    DT(((("elf_symbol_table",3),[]),[]), [read"%240%452@%303%264%328@@@"])
  fun op stb_loos_def x = x
    val op stb_loos_def =
    DT(((("elf_symbol_table",4),[]),[]),
       [read"%240%450@%303%264%264%263%328@@@@@"])
  fun op stb_hios_def x = x
    val op stb_hios_def =
    DT(((("elf_symbol_table",5),[]),[]),
       [read"%240%447@%303%264%263%264%328@@@@@"])
  fun op stb_loproc_def x = x
    val op stb_loproc_def =
    DT(((("elf_symbol_table",6),[]),[]),
       [read"%240%451@%303%263%264%264%328@@@@@"])
  fun op stb_hiproc_def x = x
    val op stb_hiproc_def =
    DT(((("elf_symbol_table",7),[]),[]),
       [read"%240%448@%303%263%263%263%263%328@@@@@@"])
  fun op string_of_symbol_binding_def x = x
    val op string_of_symbol_binding_def =
    DT(((("elf_symbol_table",8),[]),[]),
       [read"%189%133%184%136%184%137%239%458$2@$1@$0@@%270%240$2@%449@@%271%267%303%264%263%264%264%263%263%328@@@@@@@@@%271%267%303%263%263%263%263%264%263%328@@@@@@@@@%271%267%303%263%263%264%263%263%263%328@@@@@@@@@%271%267%303%263%264%263%263%263%263%328@@@@@@@@@%271%267%303%264%263%264%264%263%263%328@@@@@@@@@%298@@@@@@%270%240$2@%446@@%271%267%303%263%263%263%264%263%263%328@@@@@@@@@%271%267%303%264%263%264%264%263%263%328@@@@@@@@@%271%267%303%263%263%263%263%264%263%328@@@@@@@@@%271%267%303%264%264%263%263%263%263%328@@@@@@@@@%271%267%303%263%264%263%263%263%263%328@@@@@@@@@%271%267%303%264%263%264%264%263%263%328@@@@@@@@@%298@@@@@@@%270%240$2@%452@@%271%267%303%263%263%263%264%264%263%328@@@@@@@@@%271%267%303%263%264%264%263%263%263%328@@@@@@@@@%271%267%303%263%264%263%263%263%263%328@@@@@@@@@%271%267%303%263%263%264%264%263%263%328@@@@@@@@@%298@@@@@%270%213%245$2@%450@@%216$2@%447@@@$1$2@@%270%213%245$2@%451@@%216$2@%448@@@$0$2@@%271%267%303%263%264%263%264%263%263%328@@@@@@@@@%271%267%303%264%264%264%264%263%264%328@@@@@@@@@%271%267%303%264%264%264%263%264%264%328@@@@@@@@@%271%267%303%263%264%263%263%263%264%328@@@@@@@@@%271%267%303%264%263%264%264%263%264%328@@@@@@@@@%271%267%303%263%264%263%264%263%264%328@@@@@@@@@%271%267%303%264%263%264%263%263%264%328@@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%271%267%303%263%263%264%263%264%264%328@@@@@@@@@%271%267%303%263%264%263%264%264%264%328@@@@@@@@@%271%267%303%263%264%264%264%263%264%328@@@@@@@@@%271%267%303%264%264%263%263%263%264%328@@@@@@@@@%271%267%303%263%263%263%263%264%264%328@@@@@@@@@%271%267%303%264%263%264%264%263%264%328@@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%271%267%303%264%264%263%263%263%264%328@@@@@@@@@%271%267%303%263%264%263%264%263%264%328@@@@@@@@@%271%267%303%264%264%264%264%263%264%328@@@@@@@@@%271%267%303%264%263%264%263%263%264%328@@@@@@@@@%271%267%303%263%264%263%264%263%264%328@@@@@@@@@%271%267%303%264%264%264%264%263%264%328@@@@@@@@@%271%267%303%263%263%263%264%263%264%328@@@@@@@@@%298@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@|@"])
  fun op stt_notype_def x = x
    val op stt_notype_def =
    DT(((("elf_symbol_table",9),[]),[]), [read"%240%468@%214@"])
  fun op stt_object_def x = x
    val op stt_object_def =
    DT(((("elf_symbol_table",10),[]),[]), [read"%240%469@%303%263%328@@@"])
  fun op stt_func_def x = x
    val op stt_func_def =
    DT(((("elf_symbol_table",11),[]),[]), [read"%240%463@%303%264%328@@@"])
  fun op stt_section_def x = x
    val op stt_section_def =
    DT(((("elf_symbol_table",12),[]),[]),
       [read"%240%470@%303%263%263%328@@@@"])
  fun op stt_file_def x = x
    val op stt_file_def =
    DT(((("elf_symbol_table",13),[]),[]),
       [read"%240%462@%303%264%263%328@@@@"])
  fun op stt_common_def x = x
    val op stt_common_def =
    DT(((("elf_symbol_table",14),[]),[]),
       [read"%240%461@%303%263%264%328@@@@"])
  fun op stt_tls_def x = x
    val op stt_tls_def =
    DT(((("elf_symbol_table",15),[]),[]),
       [read"%240%471@%303%264%264%328@@@@"])
  fun op stt_loos_def x = x
    val op stt_loos_def =
    DT(((("elf_symbol_table",16),[]),[]),
       [read"%240%466@%303%264%264%263%328@@@@@"])
  fun op stt_hios_def x = x
    val op stt_hios_def =
    DT(((("elf_symbol_table",17),[]),[]),
       [read"%240%464@%303%264%263%264%328@@@@@"])
  fun op stt_loproc_def x = x
    val op stt_loproc_def =
    DT(((("elf_symbol_table",18),[]),[]),
       [read"%240%467@%303%263%264%264%328@@@@@"])
  fun op stt_hiproc_def x = x
    val op stt_hiproc_def =
    DT(((("elf_symbol_table",19),[]),[]),
       [read"%240%465@%303%263%263%263%263%328@@@@@@"])
  fun op string_of_symbol_type_def x = x
    val op string_of_symbol_type_def =
    DT(((("elf_symbol_table",20),[]),[]),
       [read"%189%133%184%136%184%137%239%459$2@$1@$0@@%270%240$2@%468@@%271%267%303%264%264%264%264%263%263%328@@@@@@@@@%271%267%303%263%263%263%263%264%263%328@@@@@@@@@%271%267%303%264%263%264%263%264%263%328@@@@@@@@@%271%267%303%263%264%263%264%264%263%328@@@@@@@@@%271%267%303%264%263%263%263%264%263%328@@@@@@@@@%271%267%303%263%264%264%263%263%263%328@@@@@@@@@%298@@@@@@@%270%240$2@%469@@%271%267%303%263%263%263%263%264%263%328@@@@@@@@@%271%267%303%264%264%263%263%263%263%328@@@@@@@@@%271%267%303%264%264%263%264%263%263%328@@@@@@@@@%271%267%303%263%264%264%263%263%263%328@@@@@@@@@%271%267%303%263%263%264%263%263%263%328@@@@@@@@@%271%267%303%264%263%264%263%264%263%328@@@@@@@@@%298@@@@@@@%270%240$2@%463@@%271%267%303%264%264%264%263%263%263%328@@@@@@@@@%271%267%303%263%264%264%263%264%263%328@@@@@@@@@%271%267%303%264%264%264%264%263%263%328@@@@@@@@@%271%267%303%263%263%264%263%263%263%328@@@@@@@@@%298@@@@@%270%240$2@%470@@%271%267%303%263%263%264%263%264%263%328@@@@@@@@@%271%267%303%263%264%264%263%263%263%328@@@@@@@@@%271%267%303%263%263%264%263%263%263%328@@@@@@@@@%271%267%303%264%263%264%263%264%263%328@@@@@@@@@%271%267%303%263%264%263%264%263%263%328@@@@@@@@@%271%267%303%263%263%263%263%264%263%328@@@@@@@@@%271%267%303%264%264%264%264%263%263%328@@@@@@@@@%298@@@@@@@@%270%240$2@%462@@%271%267%303%264%264%264%263%263%263%328@@@@@@@@@%271%267%303%263%264%263%264%263%263%328@@@@@@@@@%271%267%303%264%263%264%264%263%263%328@@@@@@@@@%271%267%303%263%264%264%263%263%263%328@@@@@@@@@%298@@@@@%270%240$2@%461@@%271%267%303%263%263%264%263%263%263%328@@@@@@@@@%271%267%303%263%263%263%263%264%263%328@@@@@@@@@%271%267%303%263%264%264%264%263%263%328@@@@@@@@@%271%267%303%263%264%264%264%263%263%328@@@@@@@@@%271%267%303%263%263%263%263%264%263%328@@@@@@@@@%271%267%303%264%264%264%264%263%263%328@@@@@@@@@%298@@@@@@@%270%240$2@%471@@%271%267%303%264%263%264%263%264%263%328@@@@@@@@@%271%267%303%264%263%264%264%263%263%328@@@@@@@@@%271%267%303%263%263%264%263%264%263%328@@@@@@@@@%298@@@@%270%213%245$2@%466@@%216$2@%464@@@$1$2@@%270%213%245$2@%467@@%216$2@%465@@@$0$2@@%271%267%303%263%264%263%264%263%263%328@@@@@@@@@%271%267%303%264%264%264%264%263%264%328@@@@@@@@@%271%267%303%264%264%264%263%264%264%328@@@@@@@@@%271%267%303%263%264%263%263%263%264%328@@@@@@@@@%271%267%303%264%263%264%264%263%264%328@@@@@@@@@%271%267%303%263%264%263%264%263%264%328@@@@@@@@@%271%267%303%264%263%264%263%263%264%328@@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%271%267%303%263%263%264%263%264%264%328@@@@@@@@@%271%267%303%263%264%263%264%264%264%328@@@@@@@@@%271%267%303%263%264%264%264%263%264%328@@@@@@@@@%271%267%303%264%264%263%263%263%264%328@@@@@@@@@%271%267%303%263%263%263%263%264%264%328@@@@@@@@@%271%267%303%264%263%264%264%263%264%328@@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%271%267%303%264%263%264%263%264%264%328@@@@@@@@@%271%267%303%263%264%263%264%264%264%328@@@@@@@@@%271%267%303%264%263%263%263%264%264%328@@@@@@@@@%271%267%303%263%264%264%263%263%264%328@@@@@@@@@%298@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@|@"])
  fun op stv_default_def x = x
    val op stv_default_def =
    DT(((("elf_symbol_table",21),[]),[]), [read"%240%472@%214@"])
  fun op stv_internal_def x = x
    val op stv_internal_def =
    DT(((("elf_symbol_table",22),[]),[]), [read"%240%474@%303%263%328@@@"])
  fun op stv_hidden_def x = x
    val op stv_hidden_def =
    DT(((("elf_symbol_table",23),[]),[]), [read"%240%473@%303%264%328@@@"])
  fun op stv_protected_def x = x
    val op stv_protected_def =
    DT(((("elf_symbol_table",24),[]),[]),
       [read"%240%475@%303%263%263%328@@@@"])
  fun op string_of_symbol_visibility_def x = x
    val op string_of_symbol_visibility_def =
    DT(((("elf_symbol_table",25),[]),[]),
       [read"%189%133%239%460$0@@%270%240$0@%472@@%271%267%303%264%263%264%263%263%263%328@@@@@@@@@%271%267%303%263%264%264%263%263%263%328@@@@@@@@@%271%267%303%264%264%264%263%263%263%328@@@@@@@@@%271%267%303%263%264%263%263%263%263%328@@@@@@@@@%271%267%303%263%264%264%263%264%263%328@@@@@@@@@%271%267%303%264%263%264%264%263%263%328@@@@@@@@@%271%267%303%264%263%264%263%264%263%328@@@@@@@@@%298@@@@@@@@%270%240$0@%474@@%271%267%303%263%264%263%264%263%263%328@@@@@@@@@%271%267%303%264%264%264%264%263%263%328@@@@@@@@@%271%267%303%264%263%264%263%264%263%328@@@@@@@@@%271%267%303%263%264%264%263%263%263%328@@@@@@@@@%271%267%303%264%264%263%263%264%263%328@@@@@@@@@%271%267%303%264%264%264%264%263%263%328@@@@@@@@@%271%267%303%263%264%263%263%263%263%328@@@@@@@@@%271%267%303%264%263%264%264%263%263%328@@@@@@@@@%298@@@@@@@@@%270%240$0@%473@@%271%267%303%264%263%263%264%263%263%328@@@@@@@@@%271%267%303%263%264%263%264%263%263%328@@@@@@@@@%271%267%303%264%263%264%263%263%263%328@@@@@@@@@%271%267%303%264%263%264%263%263%263%328@@@@@@@@@%271%267%303%263%264%264%263%263%263%328@@@@@@@@@%271%267%303%264%264%264%264%263%263%328@@@@@@@@@%298@@@@@@@%270%240$0@%475@@%271%267%303%264%263%263%263%264%263%328@@@@@@@@@%271%267%303%264%264%263%263%264%263%328@@@@@@@@@%271%267%303%263%263%263%263%264%263%328@@@@@@@@@%271%267%303%264%263%264%263%264%263%328@@@@@@@@@%271%267%303%263%264%264%263%263%263%328@@@@@@@@@%271%267%303%263%263%264%263%263%263%328@@@@@@@@@%271%267%303%264%263%264%263%264%263%328@@@@@@@@@%271%267%303%263%264%264%263%263%263%328@@@@@@@@@%271%267%303%264%263%264%263%263%263%328@@@@@@@@@%298@@@@@@@@@@%271%267%303%263%264%263%264%263%263%328@@@@@@@@@%271%267%303%264%264%264%264%263%264%328@@@@@@@@@%271%267%303%264%264%264%263%264%264%328@@@@@@@@@%271%267%303%263%264%263%263%263%264%328@@@@@@@@@%271%267%303%264%263%264%264%263%264%328@@@@@@@@@%271%267%303%263%264%263%264%263%264%328@@@@@@@@@%271%267%303%264%263%264%263%263%264%328@@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%271%267%303%263%263%264%263%264%264%328@@@@@@@@@%271%267%303%263%264%263%264%264%264%328@@@@@@@@@%271%267%303%263%264%264%264%263%264%328@@@@@@@@@%271%267%303%264%264%263%263%263%264%328@@@@@@@@@%271%267%303%263%263%263%263%264%264%328@@@@@@@@@%271%267%303%264%263%264%264%263%264%328@@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%271%267%303%264%264%264%263%264%264%328@@@@@@@@@%271%267%303%263%264%263%264%263%264%328@@@@@@@@@%271%267%303%263%263%264%263%264%264%328@@@@@@@@@%271%267%303%263%264%263%264%263%264%328@@@@@@@@@%271%267%303%264%264%263%263%263%264%328@@@@@@@@@%271%267%303%263%264%263%264%263%264%328@@@@@@@@@%271%267%303%264%263%264%264%263%264%328@@@@@@@@@%271%267%303%263%264%263%264%263%264%328@@@@@@@@@%271%267%303%264%263%264%263%264%264%328@@@@@@@@@%271%267%303%263%264%263%264%264%264%328@@@@@@@@@%298@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op elf32_symbol_table_entry_TY_DEF x = x
    val op elf32_symbol_table_entry_TY_DEF =
    DT(((("elf_symbol_table",26),[("bool",[26])]),["DISK_THM"]),
       [read"%253%140%316%12%185%0%244%190%12%244%247%10%247%14%247%18%249%23%249%27%248%31%242$6@%10%14%18%23%27%31%276%214@%195$5@%196$4@%197$3@%202$2@%200$1@$0@@@@@@%134%265|@||||||$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_symbol_table_entry_case_def x = x
    val op elf32_symbol_table_entry_case_def =
    DT(((("elf_symbol_table",30),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%10%167%14%167%18%169%23%169%27%168%31%177%112%217%339%437$6@$5@$4@$3@$2@$1@@$0@@$0$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_size_def x = x
    val op elf32_symbol_table_entry_size_def =
    DT(((("elf_symbol_table",31),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%10%167%14%167%18%169%23%169%27%168%31%240%353%437$5@$4@$3@$2@$1@$0@@@%303%263%328@@@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_name x = x
    val op elf32_symbol_table_entry_elf32_st_name =
    DT(((("elf_symbol_table",32),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%40%167%43%167%50%169%60%169%67%168%74%225%343%437$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_value x = x
    val op elf32_symbol_table_entry_elf32_st_value =
    DT(((("elf_symbol_table",33),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%40%167%43%167%50%169%60%169%67%168%74%225%351%437$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_size x = x
    val op elf32_symbol_table_entry_elf32_st_size =
    DT(((("elf_symbol_table",34),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%40%167%43%167%50%169%60%169%67%168%74%225%349%437$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_info x = x
    val op elf32_symbol_table_entry_elf32_st_info =
    DT(((("elf_symbol_table",35),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%40%167%43%167%50%169%60%169%67%168%74%227%341%437$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_other x = x
    val op elf32_symbol_table_entry_elf32_st_other =
    DT(((("elf_symbol_table",36),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%40%167%43%167%50%169%60%169%67%168%74%227%345%437$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_shndx x = x
    val op elf32_symbol_table_entry_elf32_st_shndx =
    DT(((("elf_symbol_table",37),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%40%167%43%167%50%169%60%169%67%168%74%226%347%437$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_name_fupd x = x
    val op elf32_symbol_table_entry_elf32_st_name_fupd =
    DT(((("elf_symbol_table",39),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%176%111%167%40%167%43%167%50%169%60%169%67%168%74%228%344$6@%437$5@$4@$3@$2@$1@$0@@@%437$6$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_value_fupd x = x
    val op elf32_symbol_table_entry_elf32_st_value_fupd =
    DT(((("elf_symbol_table",40),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%176%111%167%40%167%43%167%50%169%60%169%67%168%74%228%352$6@%437$5@$4@$3@$2@$1@$0@@@%437$5@$6$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_size_fupd x = x
    val op elf32_symbol_table_entry_elf32_st_size_fupd =
    DT(((("elf_symbol_table",41),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%176%111%167%40%167%43%167%50%169%60%169%67%168%74%228%350$6@%437$5@$4@$3@$2@$1@$0@@@%437$5@$4@$6$3@@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_info_fupd x = x
    val op elf32_symbol_table_entry_elf32_st_info_fupd =
    DT(((("elf_symbol_table",42),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%180%115%167%40%167%43%167%50%169%60%169%67%168%74%228%342$6@%437$5@$4@$3@$2@$1@$0@@@%437$5@$4@$3@$6$2@@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_other_fupd x = x
    val op elf32_symbol_table_entry_elf32_st_other_fupd =
    DT(((("elf_symbol_table",43),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%180%115%167%40%167%43%167%50%169%60%169%67%168%74%228%346$6@%437$5@$4@$3@$2@$1@$0@@@%437$5@$4@$3@$2@$6$1@@$0@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_shndx_fupd x = x
    val op elf32_symbol_table_entry_elf32_st_shndx_fupd =
    DT(((("elf_symbol_table",44),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%114%167%40%167%43%167%50%169%60%169%67%168%74%228%348$6@%437$5@$4@$3@$2@$1@$0@@@%437$5@$4@$3@$2@$1@$6$0@@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_compare_def x = x
    val op elf32_symbol_table_entry_compare_def =
    DT(((("elf_symbol_table",63),[]),[]),
       [read"%170%102%170%104%241%340$1@$0@@%444%386%215@%240@@%386%215@%240@@%386%215@%240@@%386%215@%240@@%386%215@%240@@%386%215@%240@@%212%479%343$1@@@%211%479%351$1@@@%210%479%349$1@@@%209%481%341$1@@@%208%481%345$1@@@%480%347$1@@@@@@@@%212%479%343$0@@@%211%479%351$0@@@%210%479%349$0@@@%209%481%341$0@@@%208%481%345$0@@@%480%347$0@@@@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict_def
    =
    DT(((("elf_symbol_table",64),[]),[]),
       [read"%218%395@%304%289%340@@%312%288%118%120%241%340$1@$0@@%295@||@@%310%288%118%120%282%340$1@$0@@%283%295@%283%280@%279@@@||@@%308%288%118%120%241%340$1@$0@@%281@||@@%306%288%118%120%282%340$1@$0@@%283%281@%283%280@%279@@@||@@%257@@@@@@"])
  fun op elf64_symbol_table_entry_TY_DEF x = x
    val op elf64_symbol_table_entry_TY_DEF =
    DT(((("elf_symbol_table",65),[("bool",[26])]),["DISK_THM"]),
       [read"%255%141%317%13%186%1%244%191%13%244%247%10%249%15%249%19%248%22%246%26%246%30%243$6@%10%15%19%22%26%30%277%214@%198$5@%203$4@%201$3@%199$2@%194$1@$0@@@@@@%134%266|@||||||$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_symbol_table_entry_case_def x = x
    val op elf64_symbol_table_entry_case_def =
    DT(((("elf_symbol_table",69),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%10%169%15%169%19%168%22%166%26%166%30%178%113%217%355%438$6@$5@$4@$3@$2@$1@@$0@@$0$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_size_def x = x
    val op elf64_symbol_table_entry_size_def =
    DT(((("elf_symbol_table",70),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%10%169%15%169%19%168%22%166%26%166%30%240%369%438$5@$4@$3@$2@$1@$0@@@%303%263%328@@@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_name x = x
    val op elf64_symbol_table_entry_elf64_st_name =
    DT(((("elf_symbol_table",71),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%40%169%44%169%52%168%59%166%65%166%72%225%359%438$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_info x = x
    val op elf64_symbol_table_entry_elf64_st_info =
    DT(((("elf_symbol_table",72),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%40%169%44%169%52%168%59%166%65%166%72%227%357%438$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_other x = x
    val op elf64_symbol_table_entry_elf64_st_other =
    DT(((("elf_symbol_table",73),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%40%169%44%169%52%168%59%166%65%166%72%227%361%438$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_shndx x = x
    val op elf64_symbol_table_entry_elf64_st_shndx =
    DT(((("elf_symbol_table",74),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%40%169%44%169%52%168%59%166%65%166%72%226%363%438$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_value x = x
    val op elf64_symbol_table_entry_elf64_st_value =
    DT(((("elf_symbol_table",75),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%40%169%44%169%52%168%59%166%65%166%72%224%367%438$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_size x = x
    val op elf64_symbol_table_entry_elf64_st_size =
    DT(((("elf_symbol_table",76),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%40%169%44%169%52%168%59%166%65%166%72%224%365%438$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_name_fupd x = x
    val op elf64_symbol_table_entry_elf64_st_name_fupd =
    DT(((("elf_symbol_table",78),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%176%111%167%40%169%44%169%52%168%59%166%65%166%72%229%360$6@%438$5@$4@$3@$2@$1@$0@@@%438$6$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_info_fupd x = x
    val op elf64_symbol_table_entry_elf64_st_info_fupd =
    DT(((("elf_symbol_table",79),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%180%115%167%40%169%44%169%52%168%59%166%65%166%72%229%358$6@%438$5@$4@$3@$2@$1@$0@@@%438$5@$6$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_other_fupd x = x
    val op elf64_symbol_table_entry_elf64_st_other_fupd =
    DT(((("elf_symbol_table",80),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%180%115%167%40%169%44%169%52%168%59%166%65%166%72%229%362$6@%438$5@$4@$3@$2@$1@$0@@@%438$5@$4@$6$3@@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_shndx_fupd x = x
    val op elf64_symbol_table_entry_elf64_st_shndx_fupd =
    DT(((("elf_symbol_table",81),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%114%167%40%169%44%169%52%168%59%166%65%166%72%229%364$6@%438$5@$4@$3@$2@$1@$0@@@%438$5@$4@$3@$6$2@@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_value_fupd x = x
    val op elf64_symbol_table_entry_elf64_st_value_fupd =
    DT(((("elf_symbol_table",82),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%175%110%167%40%169%44%169%52%168%59%166%65%166%72%229%368$6@%438$5@$4@$3@$2@$1@$0@@@%438$5@$4@$3@$2@$6$1@@$0@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_size_fupd x = x
    val op elf64_symbol_table_entry_elf64_st_size_fupd =
    DT(((("elf_symbol_table",83),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%175%110%167%40%169%44%169%52%168%59%166%65%166%72%229%366$6@%438$5@$4@$3@$2@$1@$0@@@%438$5@$4@$3@$2@$1@$6$0@@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_compare_def x = x
    val op elf64_symbol_table_entry_compare_def =
    DT(((("elf_symbol_table",102),[]),[]),
       [read"%171%103%171%105%241%356$1@$0@@%444%386%215@%240@@%386%215@%240@@%386%215@%240@@%386%215@%240@@%386%215@%240@@%386%215@%240@@%212%479%359$1@@@%211%478%367$1@@@%210%478%365$1@@@%209%481%357$1@@@%208%481%361$1@@@%480%363$1@@@@@@@@%212%479%359$0@@@%211%478%367$0@@@%210%478%365$0@@@%209%481%357$0@@@%208%481%361$0@@@%480%363$0@@@@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict_def
    =
    DT(((("elf_symbol_table",103),[]),[]),
       [read"%219%396@%305%292%356@@%313%291%119%121%241%356$1@$0@@%295@||@@%311%291%119%121%282%356$1@$0@@%283%295@%283%280@%279@@@||@@%309%291%119%121%241%356$1@$0@@%281@||@@%307%291%119%121%282%356$1@$0@@%283%281@%283%280@%279@@@||@@%258@@@@@@"])
  fun op extract_symbol_binding_def x = x
    val op extract_symbol_binding_def =
    DT(((("elf_symbol_table",104),[]),[]),
       [read"%165%106%240%382$0@@%477%485$0@%303%264%263%328@@@@@@|@"])
  fun op extract_symbol_type_def x = x
    val op extract_symbol_type_def =
    DT(((("elf_symbol_table",105),[]),[]),
       [read"%169%107%240%384$0@@%481%483$0@%411%303%263%263%263%263%328@@@@@@@@@|@"])
  fun op make_symbol_info_def x = x
    val op make_symbol_info_def =
    DT(((("elf_symbol_table",106),[]),[]),
       [read"%189%35%189%157%227%404$1@$0@@%482%484%411$1@@%303%264%263%328@@@@@%483%411$0@@%411%303%263%263%263%263%328@@@@@@@@@|@|@"])
  fun op get_symbol_visibility_def x = x
    val op get_symbol_visibility_def =
    DT(((("elf_symbol_table",107),[]),[]),
       [read"%169%132%240%394$0@@%481%483$0@%411%303%263%263%328@@@@@@@|@"])
  fun op make_symbol_other_def x = x
    val op make_symbol_other_def =
    DT(((("elf_symbol_table",108),[]),[]),
       [read"%189%163%227%405$0@@%411$0@@|@"])
  fun op is_elf32_shndx_too_large_def x = x
    val op is_elf32_shndx_too_large_def =
    DT(((("elf_symbol_table",109),[]),[]),
       [read"%170%153%222%400$0@@%240%480%347$0@@@%445@@|@"])
  fun op is_elf64_shndx_too_large_def x = x
    val op is_elf64_shndx_too_large_def =
    DT(((("elf_symbol_table",110),[]),[]),
       [read"%171%154%222%402$0@@%240%480%363$0@@@%445@@|@"])
  fun op is_elf32_null_entry_def x = x
    val op is_elf32_null_entry_def =
    DT(((("elf_symbol_table",111),[]),[]),
       [read"%170%100%222%399$0@@%213%240%479%343$0@@@%214@@%213%240%479%351$0@@@%214@@%213%240%479%349$0@@@%214@@%213%240%481%341$0@@@%214@@%213%240%481%345$0@@@%214@@%240%480%347$0@@@%214@@@@@@@|@"])
  fun op is_elf64_null_entry_def x = x
    val op is_elf64_null_entry_def =
    DT(((("elf_symbol_table",112),[]),[]),
       [read"%171%101%222%401$0@@%213%240%479%359$0@@@%214@@%213%240%478%367$0@@@%214@@%213%240%478%365$0@@@%214@@%213%240%481%357$0@@@%214@@%213%240%481%361$0@@@%214@@%240%480%363$0@@@%214@@@@@@@|@"])
  fun op string_of_elf32_symbol_table_entry_def x = x
    val op string_of_elf32_symbol_table_entry_def =
    DT(((("elf_symbol_table",113),[]),[]),
       [read"%170%108%239%455$0@@%476%275%256%271%267%303%263%264%263%328@@@@@@%298@@%256%271%267%303%264%264%264%264%263%263%328@@@@@@@@@%271%267%303%263%264%263%263%263%264%328@@@@@@@@@%271%267%303%263%264%264%264%263%264%328@@@@@@@@@%271%267%303%263%264%264%263%263%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%328@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%298@@@@@@@%422%412@%479@%343$0@@@@@%275%256%271%267%303%263%264%263%328@@@@@@%298@@%256%271%267%303%264%264%264%263%264%263%328@@@@@@@@@%271%267%303%263%264%263%263%263%264%328@@@@@@@@@%271%267%303%264%263%264%264%263%264%328@@@@@@@@@%271%267%303%263%264%264%263%264%264%328@@@@@@@@@%271%267%303%263%264%264%263%263%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%328@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%298@@@@@@@@%422%412@%479@%351$0@@@@@%275%256%271%267%303%263%264%263%328@@@@@@%298@@%256%271%267%303%263%263%264%263%264%263%328@@@@@@@@@%271%267%303%263%264%263%264%263%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%264%328@@@@@@@@@%271%267%303%263%264%264%263%263%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%328@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%298@@@@@@@%422%412@%479@%349$0@@@@@%275%256%271%267%303%263%264%263%328@@@@@@%298@@%256%271%267%303%263%264%263%264%263%263%328@@@@@@@@@%271%267%303%264%264%264%264%263%264%328@@@@@@@@@%271%267%303%264%264%264%263%263%264%328@@@@@@@@@%271%267%303%263%263%263%263%264%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%328@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%298@@@@@@@%424%412@%481@%341$0@@@@@%275%256%271%267%303%263%264%263%328@@@@@@%298@@%256%271%267%303%263%263%263%263%264%263%328@@@@@@@@@%271%267%303%264%263%264%263%264%264%328@@@@@@@@@%271%267%303%264%263%263%264%263%264%328@@@@@@@@@%271%267%303%263%264%264%263%263%264%328@@@@@@@@@%271%267%303%264%264%263%263%264%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%328@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%298@@@@@@@@%424%412@%481@%345$0@@@@@%275%256%271%267%303%263%264%263%328@@@@@@%298@@%256%271%267%303%263%263%264%263%264%263%328@@@@@@@@@%271%267%303%264%263%263%264%263%264%328@@@@@@@@@%271%267%303%264%264%264%264%263%264%328@@@@@@@@@%271%267%303%264%263%264%263%263%264%328@@@@@@@@@%271%267%303%264%263%263%264%264%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%328@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%298@@@@@@@@%423%412@%480@%347$0@@@@@%302@@@@@@@@|@"])
  fun op string_of_elf64_symbol_table_entry_def x = x
    val op string_of_elf64_symbol_table_entry_def =
    DT(((("elf_symbol_table",114),[]),[]),
       [read"%171%109%239%457$0@@%476%275%256%271%267%303%263%264%263%328@@@@@@%298@@%256%271%267%303%264%264%264%264%263%263%328@@@@@@@@@%271%267%303%263%264%263%263%263%264%328@@@@@@@@@%271%267%303%263%264%264%264%263%264%328@@@@@@@@@%271%267%303%263%264%264%263%263%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%328@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%298@@@@@@@%422%412@%479@%359$0@@@@@%275%256%271%267%303%263%264%263%328@@@@@@%298@@%256%271%267%303%263%264%263%264%263%263%328@@@@@@@@@%271%267%303%264%264%264%264%263%264%328@@@@@@@@@%271%267%303%264%264%264%263%263%264%328@@@@@@@@@%271%267%303%263%263%263%263%264%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%328@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%298@@@@@@@%424%412@%481@%357$0@@@@@%275%256%271%267%303%263%264%263%328@@@@@@%298@@%256%271%267%303%263%263%263%263%264%263%328@@@@@@@@@%271%267%303%264%263%264%263%264%264%328@@@@@@@@@%271%267%303%264%263%263%264%263%264%328@@@@@@@@@%271%267%303%263%264%264%263%263%264%328@@@@@@@@@%271%267%303%264%264%263%263%264%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%328@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%298@@@@@@@@%424%412@%481@%361$0@@@@@%275%256%271%267%303%263%264%263%328@@@@@@%298@@%256%271%267%303%263%263%264%263%264%263%328@@@@@@@@@%271%267%303%264%263%263%264%263%264%328@@@@@@@@@%271%267%303%264%264%264%264%263%264%328@@@@@@@@@%271%267%303%264%263%264%263%263%264%328@@@@@@@@@%271%267%303%264%263%263%264%264%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%328@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%298@@@@@@@@%423%412@%480@%363$0@@@@@%275%256%271%267%303%263%264%263%328@@@@@@%298@@%256%271%267%303%264%264%264%263%264%263%328@@@@@@@@@%271%267%303%263%264%263%263%263%264%328@@@@@@@@@%271%267%303%264%263%264%264%263%264%328@@@@@@@@@%271%267%303%263%264%264%263%264%264%328@@@@@@@@@%271%267%303%263%264%264%263%263%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%328@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%298@@@@@@@@%421%412@%478@%367$0@@@@@%275%256%271%267%303%263%264%263%328@@@@@@%298@@%256%271%267%303%263%263%264%263%264%263%328@@@@@@@@@%271%267%303%263%264%263%264%263%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%264%328@@@@@@@@@%271%267%303%263%264%264%263%263%264%328@@@@@@@@@%271%267%303%264%264%263%264%264%328@@@@@@@@%271%267%303%264%263%263%263%263%328@@@@@@@@%298@@@@@@@%421%412@%478@%365$0@@@@@%302@@@@@@@@|@"])
  fun op string_of_elf32_symbol_table_def x = x
    val op string_of_elf32_symbol_table_def =
    DT(((("elf_symbol_table",115),[]),[]),
       [read"%187%155%239%454$0@@%476%296%455@$0@@@|@"])
  fun op elf64_null_symbol_table_entry_def x = x
    val op elf64_null_symbol_table_entry_def =
    DT(((("elf_symbol_table",116),[]),[]),
       [read"%229%354@%360%285%409%214@@@%358%287%411%214@@@%362%287%411%214@@@%364%286%410%214@@@%368%284%408%214@@@%366%284%408%214@@@%262@@@@@@@"])
  fun op string_of_elf64_symbol_table_def x = x
    val op string_of_elf64_symbol_table_def =
    DT(((("elf_symbol_table",117),[]),[]),
       [read"%188%156%239%456$0@@%476%297%457@$0@@@|@"])
  fun
    op instance_Show_Show_Elf_symbol_table_elf32_symbol_table_entry_dict_def
    x = x
    val
    op instance_Show_Show_Elf_symbol_table_elf32_symbol_table_entry_dict_def
    =
    DT(((("elf_symbol_table",118),[]),[]),
       [read"%220%397@%314%290%455@@%259@@"])
  fun
    op instance_Show_Show_Elf_symbol_table_elf64_symbol_table_entry_dict_def
    x = x
    val
    op instance_Show_Show_Elf_symbol_table_elf64_symbol_table_entry_dict_def
    =
    DT(((("elf_symbol_table",119),[]),[]),
       [read"%221%398@%315%293%457@@%260@@"])
  fun op read_elf32_symbol_table_entry_def x = x
    val op read_elf32_symbol_table_entry_def =
    DT(((("elf_symbol_table",120),[]),[]),
       [read"%172%99%164%37%233%428$1@$0@@%374%429$1@$0@@%319%144%37%374%425$3@$0@@%319%150%37%374%429$5@$0@@%319%148%37%378%436$7@$0@@%323%143%37%378%436$9@$0@@%323%145%37%376%426$11@$0@@%321%146%37%441%204%344%285$11@@%352%285$9@@%350%285$7@@%342%287$5@@%346%287$3@@%348%286$1@@%261@@@@@@@$0@@||@@||@@||@@||@@||@@||@@@|@|@"])
  fun op bytes_of_elf32_symbol_table_entry_def x = x
    val op bytes_of_elf32_symbol_table_entry_def =
    DT(((("elf_symbol_table",121),[]),[]),
       [read"%172%99%170%108%223%331$1@$0@@%385%274%332$1@%343$0@@@%274%329$1@%351$0@@@%274%332$1@%349$0@@@%274%338%341$0@@@%274%338%345$0@@@%274%330$1@%347$0@@@%301@@@@@@@@|@|@"])
  fun op read_elf64_symbol_table_entry_def x = x
    val op read_elf64_symbol_table_entry_def =
    DT(((("elf_symbol_table",122),[]),[]),
       [read"%172%99%164%37%234%433$1@$0@@%375%434$1@$0@@%320%144%37%379%436$3@$0@@%324%143%37%379%436$5@$0@@%324%145%37%377%431$7@$0@@%322%146%37%373%430$9@$0@@%318%149%37%373%435$11@$0@@%318%147%37%442%205%360%285$11@@%358%287$9@@%362%287$7@@%364%286$5@@%368%284$3@@%366%284$1@@%262@@@@@@@$0@@||@@||@@||@@||@@||@@||@@@|@|@"])
  fun op bytes_of_elf64_symbol_table_entry_def x = x
    val op bytes_of_elf64_symbol_table_entry_def =
    DT(((("elf_symbol_table",123),[]),[]),
       [read"%172%99%171%109%223%335$1@$0@@%385%274%336$1@%359$0@@@%274%338%357$0@@@%274%338%361$0@@@%274%334$1@%363$0@@@%274%333$1@%367$0@@@%274%337$1@%365$0@@@%301@@@@@@@@|@|@"])
  fun op get_elf32_symbol_image_address_def x = x
    val op get_elf32_symbol_image_address_def =
    DT(((("elf_symbol_table",132),[]),[]),
       [read"%187%155%192%152%232%388$1@$0@@%406%108%294%135%294%34%294%142%294%160%294%36%370%393$4@$6@@%151%443%207$0@%210$2@%209$3@%208$4@$1@@@@@|@|@%383%341$4@@@|@%384%341$3@@@|@%193%479%349$2@@@%303%264%263%263%328@@@@@@|@%479%351$1@@@|@%479%343$0@@@|@$1@@|@|@"])
  fun op get_elf64_symbol_image_address_def x = x
    val op get_elf64_symbol_image_address_def =
    DT(((("elf_symbol_table",133),[]),[]),
       [read"%188%156%192%152%232%391$1@$0@@%407%109%294%135%294%34%294%142%294%160%294%36%370%393$4@$6@@%151%443%207$0@%210$2@%209$3@%208$4@$1@@@@@|@|@%383%357$4@@@|@%384%357$3@@@|@%478%365$2@@@|@%478%367$1@@@|@%479%359$0@@@|@$1@@|@|@"])
  fun op get_elf32_symbol_type_def x = x
    val op get_elf32_symbol_type_def =
    DT(((("elf_symbol_table",134),[]),[]),
       [read"%170%153%240%389$0@@%384%341$0@@@|@"])
  fun op get_elf64_symbol_type_def x = x
    val op get_elf64_symbol_type_def =
    DT(((("elf_symbol_table",135),[]),[]),
       [read"%171%154%240%392$0@@%384%357$0@@@|@"])
  fun op get_elf32_symbol_binding_def x = x
    val op get_elf32_symbol_binding_def =
    DT(((("elf_symbol_table",136),[]),[]),
       [read"%170%153%240%387$0@@%383%341$0@@@|@"])
  fun op get_elf64_symbol_binding_def x = x
    val op get_elf64_symbol_binding_def =
    DT(((("elf_symbol_table",137),[]),[]),
       [read"%171%154%240%390$0@@%383%357$0@@@|@"])
  fun op elf32_symbol_table_entry_accessors x = x
    val op elf32_symbol_table_entry_accessors =
    DT(((("elf_symbol_table",38),
        [("elf_symbol_table",[32,33,34,35,36,37])]),["DISK_THM"]),
       [read"%213%167%40%167%43%167%50%169%60%169%67%168%74%225%343%437$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@@%213%167%40%167%43%167%50%169%60%169%67%168%74%225%351%437$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@@%213%167%40%167%43%167%50%169%60%169%67%168%74%225%349%437$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@@%213%167%40%167%43%167%50%169%60%169%67%168%74%227%341%437$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@@%213%167%40%167%43%167%50%169%60%169%67%168%74%227%345%437$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@@%167%40%167%43%167%50%169%60%169%67%168%74%226%347%437$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@@@@@@"])
  fun op elf32_symbol_table_entry_fn_updates x = x
    val op elf32_symbol_table_entry_fn_updates =
    DT(((("elf_symbol_table",45),
        [("elf_symbol_table",[39,40,41,42,43,44])]),["DISK_THM"]),
       [read"%213%176%111%167%40%167%43%167%50%169%60%169%67%168%74%228%344$6@%437$5@$4@$3@$2@$1@$0@@@%437$6$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@@%213%176%111%167%40%167%43%167%50%169%60%169%67%168%74%228%352$6@%437$5@$4@$3@$2@$1@$0@@@%437$5@$6$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@@%213%176%111%167%40%167%43%167%50%169%60%169%67%168%74%228%350$6@%437$5@$4@$3@$2@$1@$0@@@%437$5@$4@$6$3@@$2@$1@$0@@|@|@|@|@|@|@|@@%213%180%115%167%40%167%43%167%50%169%60%169%67%168%74%228%342$6@%437$5@$4@$3@$2@$1@$0@@@%437$5@$4@$3@$6$2@@$1@$0@@|@|@|@|@|@|@|@@%213%180%115%167%40%167%43%167%50%169%60%169%67%168%74%228%346$6@%437$5@$4@$3@$2@$1@$0@@@%437$5@$4@$3@$2@$6$1@@$0@@|@|@|@|@|@|@|@@%179%114%167%40%167%43%167%50%169%60%169%67%168%74%228%348$6@%437$5@$4@$3@$2@$1@$0@@@%437$5@$4@$3@$2@$1@$6$0@@@|@|@|@|@|@|@|@@@@@@"])
  fun op elf32_symbol_table_entry_accfupds x = x
    val op elf32_symbol_table_entry_accfupds =
    DT(((("elf_symbol_table",46),
        [("bool",[25,26,55,180]),
         ("elf_symbol_table",[27,28,29,38,45])]),["DISK_THM"]),
       [read"%213%176%111%170%77%225%343%352$1@$0@@@%343$0@@|@|@@%213%176%111%170%77%225%343%350$1@$0@@@%343$0@@|@|@@%213%180%115%170%77%225%343%342$1@$0@@@%343$0@@|@|@@%213%180%115%170%77%225%343%346$1@$0@@@%343$0@@|@|@@%213%179%114%170%77%225%343%348$1@$0@@@%343$0@@|@|@@%213%176%111%170%77%225%351%344$1@$0@@@%351$0@@|@|@@%213%176%111%170%77%225%351%350$1@$0@@@%351$0@@|@|@@%213%180%115%170%77%225%351%342$1@$0@@@%351$0@@|@|@@%213%180%115%170%77%225%351%346$1@$0@@@%351$0@@|@|@@%213%179%114%170%77%225%351%348$1@$0@@@%351$0@@|@|@@%213%176%111%170%77%225%349%344$1@$0@@@%349$0@@|@|@@%213%176%111%170%77%225%349%352$1@$0@@@%349$0@@|@|@@%213%180%115%170%77%225%349%342$1@$0@@@%349$0@@|@|@@%213%180%115%170%77%225%349%346$1@$0@@@%349$0@@|@|@@%213%179%114%170%77%225%349%348$1@$0@@@%349$0@@|@|@@%213%176%111%170%77%227%341%344$1@$0@@@%341$0@@|@|@@%213%176%111%170%77%227%341%352$1@$0@@@%341$0@@|@|@@%213%176%111%170%77%227%341%350$1@$0@@@%341$0@@|@|@@%213%180%115%170%77%227%341%346$1@$0@@@%341$0@@|@|@@%213%179%114%170%77%227%341%348$1@$0@@@%341$0@@|@|@@%213%176%111%170%77%227%345%344$1@$0@@@%345$0@@|@|@@%213%176%111%170%77%227%345%352$1@$0@@@%345$0@@|@|@@%213%176%111%170%77%227%345%350$1@$0@@@%345$0@@|@|@@%213%180%115%170%77%227%345%342$1@$0@@@%345$0@@|@|@@%213%179%114%170%77%227%345%348$1@$0@@@%345$0@@|@|@@%213%176%111%170%77%226%347%344$1@$0@@@%347$0@@|@|@@%213%176%111%170%77%226%347%352$1@$0@@@%347$0@@|@|@@%213%176%111%170%77%226%347%350$1@$0@@@%347$0@@|@|@@%213%180%115%170%77%226%347%342$1@$0@@@%347$0@@|@|@@%213%180%115%170%77%226%347%346$1@$0@@@%347$0@@|@|@@%213%176%111%170%77%225%343%344$1@$0@@@$1%343$0@@@|@|@@%213%176%111%170%77%225%351%352$1@$0@@@$1%351$0@@@|@|@@%213%176%111%170%77%225%349%350$1@$0@@@$1%349$0@@@|@|@@%213%180%115%170%77%227%341%342$1@$0@@@$1%341$0@@@|@|@@%213%180%115%170%77%227%345%346$1@$0@@@$1%345$0@@@|@|@@%179%114%170%77%226%347%348$1@$0@@@$1%347$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_symbol_table_entry_fupdfupds x = x
    val op elf32_symbol_table_entry_fupdfupds =
    DT(((("elf_symbol_table",47),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_symbol_table",[27,28,29,45])]),["DISK_THM"]),
       [read"%213%176%125%176%111%170%77%228%344$1@%344$2@$0@@@%344%414$1@$2@@$0@@|@|@|@@%213%176%125%176%111%170%77%228%352$1@%352$2@$0@@@%352%414$1@$2@@$0@@|@|@|@@%213%176%125%176%111%170%77%228%350$1@%350$2@$0@@@%350%414$1@$2@@$0@@|@|@|@@%213%180%127%180%115%170%77%228%342$1@%342$2@$0@@@%342%416$1@$2@@$0@@|@|@|@@%213%180%127%180%115%170%77%228%346$1@%346$2@$0@@@%346%416$1@$2@@$0@@|@|@|@@%179%126%179%114%170%77%228%348$1@%348$2@$0@@@%348%415$1@$2@@$0@@|@|@|@@@@@@"])
  fun op elf32_symbol_table_entry_fupdfupds_comp x = x
    val op elf32_symbol_table_entry_fupdfupds_comp =
    DT(((("elf_symbol_table",48),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_symbol_table",[27,28,29,45])]),["DISK_THM"]),
       [read"%213%213%176%125%176%111%237%418%344$0@@%344$1@@@%344%414$0@$1@@@|@|@@%173%128%176%125%176%111%235%417%344$0@@%417%344$1@@$2@@@%417%344%414$0@$1@@@$2@@|@|@|@@@%213%213%176%125%176%111%237%418%352$0@@%352$1@@@%352%414$0@$1@@@|@|@@%173%128%176%125%176%111%235%417%352$0@@%417%352$1@@$2@@@%417%352%414$0@$1@@@$2@@|@|@|@@@%213%213%176%125%176%111%237%418%350$0@@%350$1@@@%350%414$0@$1@@@|@|@@%173%128%176%125%176%111%235%417%350$0@@%417%350$1@@$2@@@%417%350%414$0@$1@@@$2@@|@|@|@@@%213%213%180%127%180%115%237%418%342$0@@%342$1@@@%342%416$0@$1@@@|@|@@%173%128%180%127%180%115%235%417%342$0@@%417%342$1@@$2@@@%417%342%416$0@$1@@@$2@@|@|@|@@@%213%213%180%127%180%115%237%418%346$0@@%346$1@@@%346%416$0@$1@@@|@|@@%173%128%180%127%180%115%235%417%346$0@@%417%346$1@@$2@@@%417%346%416$0@$1@@@$2@@|@|@|@@@%213%179%126%179%114%237%418%348$0@@%348$1@@@%348%415$0@$1@@@|@|@@%173%128%179%126%179%114%235%417%348$0@@%417%348$1@@$2@@@%417%348%415$0@$1@@@$2@@|@|@|@@@@@@@"])
  fun op elf32_symbol_table_entry_fupdcanon x = x
    val op elf32_symbol_table_entry_fupdcanon =
    DT(((("elf_symbol_table",49),
        [("bool",[25,26,55,180]),
         ("elf_symbol_table",[27,28,29,45])]),["DISK_THM"]),
       [read"%213%176%125%176%111%170%77%228%352$1@%344$2@$0@@@%344$2@%352$1@$0@@@|@|@|@@%213%176%125%176%111%170%77%228%350$1@%344$2@$0@@@%344$2@%350$1@$0@@@|@|@|@@%213%176%125%176%111%170%77%228%350$1@%352$2@$0@@@%352$2@%350$1@$0@@@|@|@|@@%213%176%125%180%115%170%77%228%342$1@%344$2@$0@@@%344$2@%342$1@$0@@@|@|@|@@%213%176%125%180%115%170%77%228%342$1@%352$2@$0@@@%352$2@%342$1@$0@@@|@|@|@@%213%176%125%180%115%170%77%228%342$1@%350$2@$0@@@%350$2@%342$1@$0@@@|@|@|@@%213%176%125%180%115%170%77%228%346$1@%344$2@$0@@@%344$2@%346$1@$0@@@|@|@|@@%213%176%125%180%115%170%77%228%346$1@%352$2@$0@@@%352$2@%346$1@$0@@@|@|@|@@%213%176%125%180%115%170%77%228%346$1@%350$2@$0@@@%350$2@%346$1@$0@@@|@|@|@@%213%180%127%180%115%170%77%228%346$1@%342$2@$0@@@%342$2@%346$1@$0@@@|@|@|@@%213%176%125%179%114%170%77%228%348$1@%344$2@$0@@@%344$2@%348$1@$0@@@|@|@|@@%213%176%125%179%114%170%77%228%348$1@%352$2@$0@@@%352$2@%348$1@$0@@@|@|@|@@%213%176%125%179%114%170%77%228%348$1@%350$2@$0@@@%350$2@%348$1@$0@@@|@|@|@@%213%180%127%179%114%170%77%228%348$1@%342$2@$0@@@%342$2@%348$1@$0@@@|@|@|@@%180%127%179%114%170%77%228%348$1@%346$2@$0@@@%346$2@%348$1@$0@@@|@|@|@@@@@@@@@@@@@@@"])
  fun op elf32_symbol_table_entry_fupdcanon_comp x = x
    val op elf32_symbol_table_entry_fupdcanon_comp =
    DT(((("elf_symbol_table",50),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_symbol_table",[27,28,29,45])]),["DISK_THM"]),
       [read"%213%213%176%125%176%111%237%418%352$0@@%344$1@@@%418%344$1@@%352$0@@@|@|@@%173%128%176%125%176%111%235%417%352$0@@%417%344$1@@$2@@@%417%344$1@@%417%352$0@@$2@@@|@|@|@@@%213%213%176%125%176%111%237%418%350$0@@%344$1@@@%418%344$1@@%350$0@@@|@|@@%173%128%176%125%176%111%235%417%350$0@@%417%344$1@@$2@@@%417%344$1@@%417%350$0@@$2@@@|@|@|@@@%213%213%176%125%176%111%237%418%350$0@@%352$1@@@%418%352$1@@%350$0@@@|@|@@%173%128%176%125%176%111%235%417%350$0@@%417%352$1@@$2@@@%417%352$1@@%417%350$0@@$2@@@|@|@|@@@%213%213%176%125%180%115%237%418%342$0@@%344$1@@@%418%344$1@@%342$0@@@|@|@@%173%128%176%125%180%115%235%417%342$0@@%417%344$1@@$2@@@%417%344$1@@%417%342$0@@$2@@@|@|@|@@@%213%213%176%125%180%115%237%418%342$0@@%352$1@@@%418%352$1@@%342$0@@@|@|@@%173%128%176%125%180%115%235%417%342$0@@%417%352$1@@$2@@@%417%352$1@@%417%342$0@@$2@@@|@|@|@@@%213%213%176%125%180%115%237%418%342$0@@%350$1@@@%418%350$1@@%342$0@@@|@|@@%173%128%176%125%180%115%235%417%342$0@@%417%350$1@@$2@@@%417%350$1@@%417%342$0@@$2@@@|@|@|@@@%213%213%176%125%180%115%237%418%346$0@@%344$1@@@%418%344$1@@%346$0@@@|@|@@%173%128%176%125%180%115%235%417%346$0@@%417%344$1@@$2@@@%417%344$1@@%417%346$0@@$2@@@|@|@|@@@%213%213%176%125%180%115%237%418%346$0@@%352$1@@@%418%352$1@@%346$0@@@|@|@@%173%128%176%125%180%115%235%417%346$0@@%417%352$1@@$2@@@%417%352$1@@%417%346$0@@$2@@@|@|@|@@@%213%213%176%125%180%115%237%418%346$0@@%350$1@@@%418%350$1@@%346$0@@@|@|@@%173%128%176%125%180%115%235%417%346$0@@%417%350$1@@$2@@@%417%350$1@@%417%346$0@@$2@@@|@|@|@@@%213%213%180%127%180%115%237%418%346$0@@%342$1@@@%418%342$1@@%346$0@@@|@|@@%173%128%180%127%180%115%235%417%346$0@@%417%342$1@@$2@@@%417%342$1@@%417%346$0@@$2@@@|@|@|@@@%213%213%176%125%179%114%237%418%348$0@@%344$1@@@%418%344$1@@%348$0@@@|@|@@%173%128%176%125%179%114%235%417%348$0@@%417%344$1@@$2@@@%417%344$1@@%417%348$0@@$2@@@|@|@|@@@%213%213%176%125%179%114%237%418%348$0@@%352$1@@@%418%352$1@@%348$0@@@|@|@@%173%128%176%125%179%114%235%417%348$0@@%417%352$1@@$2@@@%417%352$1@@%417%348$0@@$2@@@|@|@|@@@%213%213%176%125%179%114%237%418%348$0@@%350$1@@@%418%350$1@@%348$0@@@|@|@@%173%128%176%125%179%114%235%417%348$0@@%417%350$1@@$2@@@%417%350$1@@%417%348$0@@$2@@@|@|@|@@@%213%213%180%127%179%114%237%418%348$0@@%342$1@@@%418%342$1@@%348$0@@@|@|@@%173%128%180%127%179%114%235%417%348$0@@%417%342$1@@$2@@@%417%342$1@@%417%348$0@@$2@@@|@|@|@@@%213%180%127%179%114%237%418%348$0@@%346$1@@@%418%346$1@@%348$0@@@|@|@@%173%128%180%127%179%114%235%417%348$0@@%417%346$1@@$2@@@%417%346$1@@%417%348$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@"])
  fun op elf32_symbol_table_entry_component_equality x = x
    val op elf32_symbol_table_entry_component_equality =
    DT(((("elf_symbol_table",51),
        [("bool",[25,26,50,55,62,180]),("elf_symbol_table",[27,28,29,38]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%170%79%170%81%222%228$1@$0@@%213%225%343$1@@%343$0@@@%213%225%351$1@@%351$0@@@%213%225%349$1@@%349$0@@@%213%227%341$1@@%341$0@@@%213%227%345$1@@%345$0@@@%226%347$1@@%347$0@@@@@@@@|@|@"])
  fun op elf32_symbol_table_entry_updates_eq_literal x = x
    val op elf32_symbol_table_entry_updates_eq_literal =
    DT(((("elf_symbol_table",52),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_symbol_table",[27,28,29,45])]),["DISK_THM"]),
       [read"%170%77%167%73%167%66%167%58%169%52%169%44%168%41%228%344%285$5@@%352%285$4@@%350%285$3@@%342%287$2@@%346%287$1@@%348%286$0@@$6@@@@@@@%344%285$5@@%352%285$4@@%350%285$3@@%342%287$2@@%346%287$1@@%348%286$0@@%261@@@@@@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_literal_nchotomy x = x
    val op elf32_symbol_table_entry_literal_nchotomy =
    DT(((("elf_symbol_table",53),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_symbol_table",[27,28,29,45]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%170%77%247%73%247%66%247%58%249%52%249%44%248%41%228$6@%344%285$5@@%352%285$4@@%350%285$3@@%342%287$2@@%346%287$1@@%348%286$0@@%261@@@@@@@|@|@|@|@|@|@|@"])
  fun op FORALL_elf32_symbol_table_entry x = x
    val op FORALL_elf32_symbol_table_entry =
    DT(((("elf_symbol_table",54),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_symbol_table",[27,28,29,45]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%181%6%222%170%77$1$0@|@@%167%73%167%66%167%58%169%52%169%44%168%41$6%344%285$5@@%352%285$4@@%350%285$3@@%342%287$2@@%346%287$1@@%348%286$0@@%261@@@@@@@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf32_symbol_table_entry x = x
    val op EXISTS_elf32_symbol_table_entry =
    DT(((("elf_symbol_table",55),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_symbol_table",[27,28,29,45]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%181%6%222%250%77$1$0@|@@%247%73%247%66%247%58%249%52%249%44%248%41$6%344%285$5@@%352%285$4@@%350%285$3@@%342%287$2@@%346%287$1@@%348%286$0@@%261@@@@@@@|@|@|@|@|@|@@|@"])
  fun op elf32_symbol_table_entry_literal_11 x = x
    val op elf32_symbol_table_entry_literal_11 =
    DT(((("elf_symbol_table",56),
        [("combin",[12]),("elf_symbol_table",[46,51])]),["DISK_THM"]),
       [read"%167%75%167%68%167%61%169%54%169%46%168%51%167%76%167%70%167%63%169%56%169%48%168%59%222%228%344%285$11@@%352%285$10@@%350%285$9@@%342%287$8@@%346%287$7@@%348%286$6@@%261@@@@@@@%344%285$5@@%352%285$4@@%350%285$3@@%342%287$2@@%346%287$1@@%348%286$0@@%261@@@@@@@@%213%225$11@$5@@%213%225$10@$4@@%213%225$9@$3@@%213%227$8@$2@@%213%227$7@$1@@%226$6@$0@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf32_symbol_table_entry x = x
    val op datatype_elf32_symbol_table_entry =
    DT(((("elf_symbol_table",57),[("bool",[25,170])]),["DISK_THM"]),
       [read"%278%138%91@%86@%90@%89@%85@%87@%88@@"])
  fun op elf32_symbol_table_entry_11 x = x
    val op elf32_symbol_table_entry_11 =
    DT(((("elf_symbol_table",58),
        [("bool",[26,50,55,62,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%10%167%14%167%18%169%23%169%27%168%31%167%11%167%16%167%20%169%25%169%29%168%33%222%228%437$11@$10@$9@$8@$7@$6@@%437$5@$4@$3@$2@$1@$0@@@%213%225$11@$5@@%213%225$10@$4@@%213%225$9@$3@@%213%227$8@$2@@%213%227$7@$1@@%226$6@$0@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_case_cong x = x
    val op elf32_symbol_table_entry_case_cong =
    DT(((("elf_symbol_table",59),
        [("bool",[26,180]),
         ("elf_symbol_table",[27,28,29,30])]),["DISK_THM"]),
       [read"%170%2%170%4%177%112%244%213%228$2@$1@@%167%10%167%14%167%18%169%23%169%27%168%31%244%228$7@%437$5@$4@$3@$2@$1@$0@@@%217$6$5@$4@$3@$2@$1@$0@@%116$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@@@%217%339$2@$0@@%339$1@%116@@@|@|@|@"])
  fun op elf32_symbol_table_entry_nchotomy x = x
    val op elf32_symbol_table_entry_nchotomy =
    DT(((("elf_symbol_table",60),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29])]),["DISK_THM"]),
       [read"%170%83%247%40%247%43%247%50%249%60%249%67%248%74%228$6@%437$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_Axiom x = x
    val op elf32_symbol_table_entry_Axiom =
    DT(((("elf_symbol_table",61),
        [("bool",[26,180]),("elf_symbol_table",[27,28,29]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%177%112%252%122%167%10%167%14%167%18%169%23%169%27%168%31%217$6%437$5@$4@$3@$2@$1@$0@@@$7$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_induction x = x
    val op elf32_symbol_table_entry_induction =
    DT(((("elf_symbol_table",62),
        [("bool",[26]),("elf_symbol_table",[27,28,29])]),["DISK_THM"]),
       [read"%181%6%244%167%40%167%43%167%50%169%60%169%67%168%74$6%437$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@@%170%77$1$0@|@@|@"])
  fun op elf64_symbol_table_entry_accessors x = x
    val op elf64_symbol_table_entry_accessors =
    DT(((("elf_symbol_table",77),
        [("elf_symbol_table",[71,72,73,74,75,76])]),["DISK_THM"]),
       [read"%213%167%40%169%44%169%52%168%59%166%65%166%72%225%359%438$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@@%213%167%40%169%44%169%52%168%59%166%65%166%72%227%357%438$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@@%213%167%40%169%44%169%52%168%59%166%65%166%72%227%361%438$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@@%213%167%40%169%44%169%52%168%59%166%65%166%72%226%363%438$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@@%213%167%40%169%44%169%52%168%59%166%65%166%72%224%367%438$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@@%167%40%169%44%169%52%168%59%166%65%166%72%224%365%438$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@@@@@@"])
  fun op elf64_symbol_table_entry_fn_updates x = x
    val op elf64_symbol_table_entry_fn_updates =
    DT(((("elf_symbol_table",84),
        [("elf_symbol_table",[78,79,80,81,82,83])]),["DISK_THM"]),
       [read"%213%176%111%167%40%169%44%169%52%168%59%166%65%166%72%229%360$6@%438$5@$4@$3@$2@$1@$0@@@%438$6$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@@%213%180%115%167%40%169%44%169%52%168%59%166%65%166%72%229%358$6@%438$5@$4@$3@$2@$1@$0@@@%438$5@$6$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@@%213%180%115%167%40%169%44%169%52%168%59%166%65%166%72%229%362$6@%438$5@$4@$3@$2@$1@$0@@@%438$5@$4@$6$3@@$2@$1@$0@@|@|@|@|@|@|@|@@%213%179%114%167%40%169%44%169%52%168%59%166%65%166%72%229%364$6@%438$5@$4@$3@$2@$1@$0@@@%438$5@$4@$3@$6$2@@$1@$0@@|@|@|@|@|@|@|@@%213%175%110%167%40%169%44%169%52%168%59%166%65%166%72%229%368$6@%438$5@$4@$3@$2@$1@$0@@@%438$5@$4@$3@$2@$6$1@@$0@@|@|@|@|@|@|@|@@%175%110%167%40%169%44%169%52%168%59%166%65%166%72%229%366$6@%438$5@$4@$3@$2@$1@$0@@@%438$5@$4@$3@$2@$1@$6$0@@@|@|@|@|@|@|@|@@@@@@"])
  fun op elf64_symbol_table_entry_accfupds x = x
    val op elf64_symbol_table_entry_accfupds =
    DT(((("elf_symbol_table",85),
        [("bool",[25,26,55,180]),
         ("elf_symbol_table",[66,67,68,77,84])]),["DISK_THM"]),
       [read"%213%180%115%171%78%225%359%358$1@$0@@@%359$0@@|@|@@%213%180%115%171%78%225%359%362$1@$0@@@%359$0@@|@|@@%213%179%114%171%78%225%359%364$1@$0@@@%359$0@@|@|@@%213%175%110%171%78%225%359%368$1@$0@@@%359$0@@|@|@@%213%175%110%171%78%225%359%366$1@$0@@@%359$0@@|@|@@%213%176%111%171%78%227%357%360$1@$0@@@%357$0@@|@|@@%213%180%115%171%78%227%357%362$1@$0@@@%357$0@@|@|@@%213%179%114%171%78%227%357%364$1@$0@@@%357$0@@|@|@@%213%175%110%171%78%227%357%368$1@$0@@@%357$0@@|@|@@%213%175%110%171%78%227%357%366$1@$0@@@%357$0@@|@|@@%213%176%111%171%78%227%361%360$1@$0@@@%361$0@@|@|@@%213%180%115%171%78%227%361%358$1@$0@@@%361$0@@|@|@@%213%179%114%171%78%227%361%364$1@$0@@@%361$0@@|@|@@%213%175%110%171%78%227%361%368$1@$0@@@%361$0@@|@|@@%213%175%110%171%78%227%361%366$1@$0@@@%361$0@@|@|@@%213%176%111%171%78%226%363%360$1@$0@@@%363$0@@|@|@@%213%180%115%171%78%226%363%358$1@$0@@@%363$0@@|@|@@%213%180%115%171%78%226%363%362$1@$0@@@%363$0@@|@|@@%213%175%110%171%78%226%363%368$1@$0@@@%363$0@@|@|@@%213%175%110%171%78%226%363%366$1@$0@@@%363$0@@|@|@@%213%176%111%171%78%224%367%360$1@$0@@@%367$0@@|@|@@%213%180%115%171%78%224%367%358$1@$0@@@%367$0@@|@|@@%213%180%115%171%78%224%367%362$1@$0@@@%367$0@@|@|@@%213%179%114%171%78%224%367%364$1@$0@@@%367$0@@|@|@@%213%175%110%171%78%224%367%366$1@$0@@@%367$0@@|@|@@%213%176%111%171%78%224%365%360$1@$0@@@%365$0@@|@|@@%213%180%115%171%78%224%365%358$1@$0@@@%365$0@@|@|@@%213%180%115%171%78%224%365%362$1@$0@@@%365$0@@|@|@@%213%179%114%171%78%224%365%364$1@$0@@@%365$0@@|@|@@%213%175%110%171%78%224%365%368$1@$0@@@%365$0@@|@|@@%213%176%111%171%78%225%359%360$1@$0@@@$1%359$0@@@|@|@@%213%180%115%171%78%227%357%358$1@$0@@@$1%357$0@@@|@|@@%213%180%115%171%78%227%361%362$1@$0@@@$1%361$0@@@|@|@@%213%179%114%171%78%226%363%364$1@$0@@@$1%363$0@@@|@|@@%213%175%110%171%78%224%367%368$1@$0@@@$1%367$0@@@|@|@@%175%110%171%78%224%365%366$1@$0@@@$1%365$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_symbol_table_entry_fupdfupds x = x
    val op elf64_symbol_table_entry_fupdfupds =
    DT(((("elf_symbol_table",86),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_symbol_table",[66,67,68,84])]),["DISK_THM"]),
       [read"%213%176%125%176%111%171%78%229%360$1@%360$2@$0@@@%360%414$1@$2@@$0@@|@|@|@@%213%180%127%180%115%171%78%229%358$1@%358$2@$0@@@%358%416$1@$2@@$0@@|@|@|@@%213%180%127%180%115%171%78%229%362$1@%362$2@$0@@@%362%416$1@$2@@$0@@|@|@|@@%213%179%126%179%114%171%78%229%364$1@%364$2@$0@@@%364%415$1@$2@@$0@@|@|@|@@%213%175%124%175%110%171%78%229%368$1@%368$2@$0@@@%368%413$1@$2@@$0@@|@|@|@@%175%124%175%110%171%78%229%366$1@%366$2@$0@@@%366%413$1@$2@@$0@@|@|@|@@@@@@"])
  fun op elf64_symbol_table_entry_fupdfupds_comp x = x
    val op elf64_symbol_table_entry_fupdfupds_comp =
    DT(((("elf_symbol_table",87),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_symbol_table",[66,67,68,84])]),["DISK_THM"]),
       [read"%213%213%176%125%176%111%238%420%360$0@@%360$1@@@%360%414$0@$1@@@|@|@@%174%129%176%125%176%111%236%419%360$0@@%419%360$1@@$2@@@%419%360%414$0@$1@@@$2@@|@|@|@@@%213%213%180%127%180%115%238%420%358$0@@%358$1@@@%358%416$0@$1@@@|@|@@%174%129%180%127%180%115%236%419%358$0@@%419%358$1@@$2@@@%419%358%416$0@$1@@@$2@@|@|@|@@@%213%213%180%127%180%115%238%420%362$0@@%362$1@@@%362%416$0@$1@@@|@|@@%174%129%180%127%180%115%236%419%362$0@@%419%362$1@@$2@@@%419%362%416$0@$1@@@$2@@|@|@|@@@%213%213%179%126%179%114%238%420%364$0@@%364$1@@@%364%415$0@$1@@@|@|@@%174%129%179%126%179%114%236%419%364$0@@%419%364$1@@$2@@@%419%364%415$0@$1@@@$2@@|@|@|@@@%213%213%175%124%175%110%238%420%368$0@@%368$1@@@%368%413$0@$1@@@|@|@@%174%129%175%124%175%110%236%419%368$0@@%419%368$1@@$2@@@%419%368%413$0@$1@@@$2@@|@|@|@@@%213%175%124%175%110%238%420%366$0@@%366$1@@@%366%413$0@$1@@@|@|@@%174%129%175%124%175%110%236%419%366$0@@%419%366$1@@$2@@@%419%366%413$0@$1@@@$2@@|@|@|@@@@@@@"])
  fun op elf64_symbol_table_entry_fupdcanon x = x
    val op elf64_symbol_table_entry_fupdcanon =
    DT(((("elf_symbol_table",88),
        [("bool",[25,26,55,180]),
         ("elf_symbol_table",[66,67,68,84])]),["DISK_THM"]),
       [read"%213%176%125%180%115%171%78%229%358$1@%360$2@$0@@@%360$2@%358$1@$0@@@|@|@|@@%213%176%125%180%115%171%78%229%362$1@%360$2@$0@@@%360$2@%362$1@$0@@@|@|@|@@%213%180%127%180%115%171%78%229%362$1@%358$2@$0@@@%358$2@%362$1@$0@@@|@|@|@@%213%176%125%179%114%171%78%229%364$1@%360$2@$0@@@%360$2@%364$1@$0@@@|@|@|@@%213%180%127%179%114%171%78%229%364$1@%358$2@$0@@@%358$2@%364$1@$0@@@|@|@|@@%213%180%127%179%114%171%78%229%364$1@%362$2@$0@@@%362$2@%364$1@$0@@@|@|@|@@%213%176%125%175%110%171%78%229%368$1@%360$2@$0@@@%360$2@%368$1@$0@@@|@|@|@@%213%180%127%175%110%171%78%229%368$1@%358$2@$0@@@%358$2@%368$1@$0@@@|@|@|@@%213%180%127%175%110%171%78%229%368$1@%362$2@$0@@@%362$2@%368$1@$0@@@|@|@|@@%213%179%126%175%110%171%78%229%368$1@%364$2@$0@@@%364$2@%368$1@$0@@@|@|@|@@%213%176%125%175%110%171%78%229%366$1@%360$2@$0@@@%360$2@%366$1@$0@@@|@|@|@@%213%180%127%175%110%171%78%229%366$1@%358$2@$0@@@%358$2@%366$1@$0@@@|@|@|@@%213%180%127%175%110%171%78%229%366$1@%362$2@$0@@@%362$2@%366$1@$0@@@|@|@|@@%213%179%126%175%110%171%78%229%366$1@%364$2@$0@@@%364$2@%366$1@$0@@@|@|@|@@%175%124%175%110%171%78%229%366$1@%368$2@$0@@@%368$2@%366$1@$0@@@|@|@|@@@@@@@@@@@@@@@"])
  fun op elf64_symbol_table_entry_fupdcanon_comp x = x
    val op elf64_symbol_table_entry_fupdcanon_comp =
    DT(((("elf_symbol_table",89),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_symbol_table",[66,67,68,84])]),["DISK_THM"]),
       [read"%213%213%176%125%180%115%238%420%358$0@@%360$1@@@%420%360$1@@%358$0@@@|@|@@%174%129%176%125%180%115%236%419%358$0@@%419%360$1@@$2@@@%419%360$1@@%419%358$0@@$2@@@|@|@|@@@%213%213%176%125%180%115%238%420%362$0@@%360$1@@@%420%360$1@@%362$0@@@|@|@@%174%129%176%125%180%115%236%419%362$0@@%419%360$1@@$2@@@%419%360$1@@%419%362$0@@$2@@@|@|@|@@@%213%213%180%127%180%115%238%420%362$0@@%358$1@@@%420%358$1@@%362$0@@@|@|@@%174%129%180%127%180%115%236%419%362$0@@%419%358$1@@$2@@@%419%358$1@@%419%362$0@@$2@@@|@|@|@@@%213%213%176%125%179%114%238%420%364$0@@%360$1@@@%420%360$1@@%364$0@@@|@|@@%174%129%176%125%179%114%236%419%364$0@@%419%360$1@@$2@@@%419%360$1@@%419%364$0@@$2@@@|@|@|@@@%213%213%180%127%179%114%238%420%364$0@@%358$1@@@%420%358$1@@%364$0@@@|@|@@%174%129%180%127%179%114%236%419%364$0@@%419%358$1@@$2@@@%419%358$1@@%419%364$0@@$2@@@|@|@|@@@%213%213%180%127%179%114%238%420%364$0@@%362$1@@@%420%362$1@@%364$0@@@|@|@@%174%129%180%127%179%114%236%419%364$0@@%419%362$1@@$2@@@%419%362$1@@%419%364$0@@$2@@@|@|@|@@@%213%213%176%125%175%110%238%420%368$0@@%360$1@@@%420%360$1@@%368$0@@@|@|@@%174%129%176%125%175%110%236%419%368$0@@%419%360$1@@$2@@@%419%360$1@@%419%368$0@@$2@@@|@|@|@@@%213%213%180%127%175%110%238%420%368$0@@%358$1@@@%420%358$1@@%368$0@@@|@|@@%174%129%180%127%175%110%236%419%368$0@@%419%358$1@@$2@@@%419%358$1@@%419%368$0@@$2@@@|@|@|@@@%213%213%180%127%175%110%238%420%368$0@@%362$1@@@%420%362$1@@%368$0@@@|@|@@%174%129%180%127%175%110%236%419%368$0@@%419%362$1@@$2@@@%419%362$1@@%419%368$0@@$2@@@|@|@|@@@%213%213%179%126%175%110%238%420%368$0@@%364$1@@@%420%364$1@@%368$0@@@|@|@@%174%129%179%126%175%110%236%419%368$0@@%419%364$1@@$2@@@%419%364$1@@%419%368$0@@$2@@@|@|@|@@@%213%213%176%125%175%110%238%420%366$0@@%360$1@@@%420%360$1@@%366$0@@@|@|@@%174%129%176%125%175%110%236%419%366$0@@%419%360$1@@$2@@@%419%360$1@@%419%366$0@@$2@@@|@|@|@@@%213%213%180%127%175%110%238%420%366$0@@%358$1@@@%420%358$1@@%366$0@@@|@|@@%174%129%180%127%175%110%236%419%366$0@@%419%358$1@@$2@@@%419%358$1@@%419%366$0@@$2@@@|@|@|@@@%213%213%180%127%175%110%238%420%366$0@@%362$1@@@%420%362$1@@%366$0@@@|@|@@%174%129%180%127%175%110%236%419%366$0@@%419%362$1@@$2@@@%419%362$1@@%419%366$0@@$2@@@|@|@|@@@%213%213%179%126%175%110%238%420%366$0@@%364$1@@@%420%364$1@@%366$0@@@|@|@@%174%129%179%126%175%110%236%419%366$0@@%419%364$1@@$2@@@%419%364$1@@%419%366$0@@$2@@@|@|@|@@@%213%175%124%175%110%238%420%366$0@@%368$1@@@%420%368$1@@%366$0@@@|@|@@%174%129%175%124%175%110%236%419%366$0@@%419%368$1@@$2@@@%419%368$1@@%419%366$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@"])
  fun op elf64_symbol_table_entry_component_equality x = x
    val op elf64_symbol_table_entry_component_equality =
    DT(((("elf_symbol_table",90),
        [("bool",[25,26,50,55,62,180]),("elf_symbol_table",[66,67,68,77]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%171%80%171%82%222%229$1@$0@@%213%225%359$1@@%359$0@@@%213%227%357$1@@%357$0@@@%213%227%361$1@@%361$0@@@%213%226%363$1@@%363$0@@@%213%224%367$1@@%367$0@@@%224%365$1@@%365$0@@@@@@@@|@|@"])
  fun op elf64_symbol_table_entry_updates_eq_literal x = x
    val op elf64_symbol_table_entry_updates_eq_literal =
    DT(((("elf_symbol_table",91),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_symbol_table",[66,67,68,84])]),["DISK_THM"]),
       [read"%171%78%167%73%169%67%169%60%168%51%166%42%166%39%229%360%285$5@@%358%287$4@@%362%287$3@@%364%286$2@@%368%284$1@@%366%284$0@@$6@@@@@@@%360%285$5@@%358%287$4@@%362%287$3@@%364%286$2@@%368%284$1@@%366%284$0@@%262@@@@@@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_literal_nchotomy x = x
    val op elf64_symbol_table_entry_literal_nchotomy =
    DT(((("elf_symbol_table",92),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_symbol_table",[66,67,68,84]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%171%78%247%73%249%67%249%60%248%51%246%42%246%39%229$6@%360%285$5@@%358%287$4@@%362%287$3@@%364%286$2@@%368%284$1@@%366%284$0@@%262@@@@@@@|@|@|@|@|@|@|@"])
  fun op FORALL_elf64_symbol_table_entry x = x
    val op FORALL_elf64_symbol_table_entry =
    DT(((("elf_symbol_table",93),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_symbol_table",[66,67,68,84]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%182%7%222%171%78$1$0@|@@%167%73%169%67%169%60%168%51%166%42%166%39$6%360%285$5@@%358%287$4@@%362%287$3@@%364%286$2@@%368%284$1@@%366%284$0@@%262@@@@@@@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf64_symbol_table_entry x = x
    val op EXISTS_elf64_symbol_table_entry =
    DT(((("elf_symbol_table",94),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_symbol_table",[66,67,68,84]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%182%7%222%251%78$1$0@|@@%247%73%249%67%249%60%248%51%246%42%246%39$6%360%285$5@@%358%287$4@@%362%287$3@@%364%286$2@@%368%284$1@@%366%284$0@@%262@@@@@@@|@|@|@|@|@|@@|@"])
  fun op elf64_symbol_table_entry_literal_11 x = x
    val op elf64_symbol_table_entry_literal_11 =
    DT(((("elf_symbol_table",95),
        [("combin",[12]),("elf_symbol_table",[85,90])]),["DISK_THM"]),
       [read"%167%75%169%69%169%62%168%53%166%45%166%49%167%76%169%71%169%64%168%55%166%47%166%57%222%229%360%285$11@@%358%287$10@@%362%287$9@@%364%286$8@@%368%284$7@@%366%284$6@@%262@@@@@@@%360%285$5@@%358%287$4@@%362%287$3@@%364%286$2@@%368%284$1@@%366%284$0@@%262@@@@@@@@%213%225$11@$5@@%213%227$10@$4@@%213%227$9@$3@@%213%226$8@$2@@%213%224$7@$1@@%224$6@$0@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf64_symbol_table_entry x = x
    val op datatype_elf64_symbol_table_entry =
    DT(((("elf_symbol_table",96),[("bool",[25,170])]),["DISK_THM"]),
       [read"%278%139%98@%93@%92@%94@%95@%97@%96@@"])
  fun op elf64_symbol_table_entry_11 x = x
    val op elf64_symbol_table_entry_11 =
    DT(((("elf_symbol_table",97),
        [("bool",[26,50,55,62,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%10%169%15%169%19%168%22%166%26%166%30%167%11%169%17%169%21%168%24%166%28%166%32%222%229%438$11@$10@$9@$8@$7@$6@@%438$5@$4@$3@$2@$1@$0@@@%213%225$11@$5@@%213%227$10@$4@@%213%227$9@$3@@%213%226$8@$2@@%213%224$7@$1@@%224$6@$0@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_case_cong x = x
    val op elf64_symbol_table_entry_case_cong =
    DT(((("elf_symbol_table",98),
        [("bool",[26,180]),
         ("elf_symbol_table",[66,67,68,69])]),["DISK_THM"]),
       [read"%171%3%171%5%178%113%244%213%229$2@$1@@%167%10%169%15%169%19%168%22%166%26%166%30%244%229$7@%438$5@$4@$3@$2@$1@$0@@@%217$6$5@$4@$3@$2@$1@$0@@%117$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@@@%217%355$2@$0@@%355$1@%117@@@|@|@|@"])
  fun op elf64_symbol_table_entry_nchotomy x = x
    val op elf64_symbol_table_entry_nchotomy =
    DT(((("elf_symbol_table",99),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68])]),["DISK_THM"]),
       [read"%171%84%247%40%249%44%249%52%248%59%246%65%246%72%229$6@%438$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_Axiom x = x
    val op elf64_symbol_table_entry_Axiom =
    DT(((("elf_symbol_table",100),
        [("bool",[26,180]),("elf_symbol_table",[66,67,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%178%113%254%123%167%10%169%15%169%19%168%22%166%26%166%30%217$6%438$5@$4@$3@$2@$1@$0@@@$7$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_induction x = x
    val op elf64_symbol_table_entry_induction =
    DT(((("elf_symbol_table",101),
        [("bool",[26]),("elf_symbol_table",[66,67,68])]),["DISK_THM"]),
       [read"%182%7%244%167%40%169%44%169%52%168%59%166%65%166%72$6%438$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@@%171%78$1$0@|@@|@"])
  fun op read_elf32_symbol_table_ind x = x
    val op read_elf32_symbol_table_ind =
    DT(((("elf_symbol_table",126),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%183%8%244%172%99%164%37%244%164%38%244%486%240%403$1@@%214@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%172%161%164%162$2$1@$0@|@|@@|@",
        read"%172%99%164%37%164%38%244%486%240%403$1@@%214@@@%9%206$2@$0@@%206$2@$1@@@|@|@|@",
        read"%327%9@"])
  fun op read_elf32_symbol_table_def x = x
    val op read_elf32_symbol_table_def =
    DT(((("elf_symbol_table",127),
        [("bool",[15,57,128]),("combin",[19]),
         ("elf_symbol_table",[124,125]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%172%99%164%37%230%427$1@$0@@%268%240%403$0@@%214@@%439%299@@%380%428$1@$0@@%325%130%38%371%427$3@$0@@%158%439%272$2@$0@@|@||@@@@|@|@",
        read"%172%99%164%37%164%38%244%486%240%403$1@@%214@@@%9%206$2@$0@@%206$2@$1@@@|@|@|@",
        read"%327%9@"])
  fun op read_elf64_symbol_table_ind x = x
    val op read_elf64_symbol_table_ind =
    DT(((("elf_symbol_table",130),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%183%8%244%172%99%164%37%244%164%38%244%486%240%403$1@@%214@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%172%161%164%162$2$1@$0@|@|@@|@",
        read"%172%99%164%37%164%38%244%486%240%403$1@@%214@@@%9%206$2@$0@@%206$2@$1@@@|@|@|@",
        read"%327%9@"])
  fun op read_elf64_symbol_table_def x = x
    val op read_elf64_symbol_table_def =
    DT(((("elf_symbol_table",131),
        [("bool",[15,57,128]),("combin",[19]),
         ("elf_symbol_table",[128,129]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%172%99%164%37%231%432$1@$0@@%269%240%403$0@@%214@@%440%300@@%381%433$1@$0@@%326%131%38%372%432$3@$0@@%159%440%273$2@$0@@|@||@@@@|@|@",
        read"%172%99%164%37%164%38%244%486%240%403$1@@%214@@@%9%206$2@$0@@%206$2@$1@@@|@|@|@",
        read"%327%9@"])
  end
  val _ = DB.bindl "elf_symbol_table"
  [("stn_undef_def",stn_undef_def,DB.Def),
   ("stb_local_def",stb_local_def,DB.Def),
   ("stb_global_def",stb_global_def,DB.Def),
   ("stb_weak_def",stb_weak_def,DB.Def),
   ("stb_loos_def",stb_loos_def,DB.Def),
   ("stb_hios_def",stb_hios_def,DB.Def),
   ("stb_loproc_def",stb_loproc_def,DB.Def),
   ("stb_hiproc_def",stb_hiproc_def,DB.Def),
   ("string_of_symbol_binding_def",string_of_symbol_binding_def,DB.Def),
   ("stt_notype_def",stt_notype_def,DB.Def),
   ("stt_object_def",stt_object_def,DB.Def),
   ("stt_func_def",stt_func_def,DB.Def),
   ("stt_section_def",stt_section_def,DB.Def),
   ("stt_file_def",stt_file_def,DB.Def),
   ("stt_common_def",stt_common_def,DB.Def),
   ("stt_tls_def",stt_tls_def,DB.Def),
   ("stt_loos_def",stt_loos_def,DB.Def),
   ("stt_hios_def",stt_hios_def,DB.Def),
   ("stt_loproc_def",stt_loproc_def,DB.Def),
   ("stt_hiproc_def",stt_hiproc_def,DB.Def),
   ("string_of_symbol_type_def",string_of_symbol_type_def,DB.Def),
   ("stv_default_def",stv_default_def,DB.Def),
   ("stv_internal_def",stv_internal_def,DB.Def),
   ("stv_hidden_def",stv_hidden_def,DB.Def),
   ("stv_protected_def",stv_protected_def,DB.Def),
   ("string_of_symbol_visibility_def",
    string_of_symbol_visibility_def,
    DB.Def),
   ("elf32_symbol_table_entry_TY_DEF",
    elf32_symbol_table_entry_TY_DEF,
    DB.Def),
   ("elf32_symbol_table_entry_case_def",
    elf32_symbol_table_entry_case_def,
    DB.Def),
   ("elf32_symbol_table_entry_size_def",
    elf32_symbol_table_entry_size_def,
    DB.Def),
   ("elf32_symbol_table_entry_elf32_st_name",
    elf32_symbol_table_entry_elf32_st_name,
    DB.Def),
   ("elf32_symbol_table_entry_elf32_st_value",
    elf32_symbol_table_entry_elf32_st_value,
    DB.Def),
   ("elf32_symbol_table_entry_elf32_st_size",
    elf32_symbol_table_entry_elf32_st_size,
    DB.Def),
   ("elf32_symbol_table_entry_elf32_st_info",
    elf32_symbol_table_entry_elf32_st_info,
    DB.Def),
   ("elf32_symbol_table_entry_elf32_st_other",
    elf32_symbol_table_entry_elf32_st_other,
    DB.Def),
   ("elf32_symbol_table_entry_elf32_st_shndx",
    elf32_symbol_table_entry_elf32_st_shndx,
    DB.Def),
   ("elf32_symbol_table_entry_elf32_st_name_fupd",
    elf32_symbol_table_entry_elf32_st_name_fupd,
    DB.Def),
   ("elf32_symbol_table_entry_elf32_st_value_fupd",
    elf32_symbol_table_entry_elf32_st_value_fupd,
    DB.Def),
   ("elf32_symbol_table_entry_elf32_st_size_fupd",
    elf32_symbol_table_entry_elf32_st_size_fupd,
    DB.Def),
   ("elf32_symbol_table_entry_elf32_st_info_fupd",
    elf32_symbol_table_entry_elf32_st_info_fupd,
    DB.Def),
   ("elf32_symbol_table_entry_elf32_st_other_fupd",
    elf32_symbol_table_entry_elf32_st_other_fupd,
    DB.Def),
   ("elf32_symbol_table_entry_elf32_st_shndx_fupd",
    elf32_symbol_table_entry_elf32_st_shndx_fupd,
    DB.Def),
   ("elf32_symbol_table_entry_compare_def",
    elf32_symbol_table_entry_compare_def,
    DB.Def),
   ("instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict_def",
    instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict_def,
    DB.Def),
   ("elf64_symbol_table_entry_TY_DEF",
    elf64_symbol_table_entry_TY_DEF,
    DB.Def),
   ("elf64_symbol_table_entry_case_def",
    elf64_symbol_table_entry_case_def,
    DB.Def),
   ("elf64_symbol_table_entry_size_def",
    elf64_symbol_table_entry_size_def,
    DB.Def),
   ("elf64_symbol_table_entry_elf64_st_name",
    elf64_symbol_table_entry_elf64_st_name,
    DB.Def),
   ("elf64_symbol_table_entry_elf64_st_info",
    elf64_symbol_table_entry_elf64_st_info,
    DB.Def),
   ("elf64_symbol_table_entry_elf64_st_other",
    elf64_symbol_table_entry_elf64_st_other,
    DB.Def),
   ("elf64_symbol_table_entry_elf64_st_shndx",
    elf64_symbol_table_entry_elf64_st_shndx,
    DB.Def),
   ("elf64_symbol_table_entry_elf64_st_value",
    elf64_symbol_table_entry_elf64_st_value,
    DB.Def),
   ("elf64_symbol_table_entry_elf64_st_size",
    elf64_symbol_table_entry_elf64_st_size,
    DB.Def),
   ("elf64_symbol_table_entry_elf64_st_name_fupd",
    elf64_symbol_table_entry_elf64_st_name_fupd,
    DB.Def),
   ("elf64_symbol_table_entry_elf64_st_info_fupd",
    elf64_symbol_table_entry_elf64_st_info_fupd,
    DB.Def),
   ("elf64_symbol_table_entry_elf64_st_other_fupd",
    elf64_symbol_table_entry_elf64_st_other_fupd,
    DB.Def),
   ("elf64_symbol_table_entry_elf64_st_shndx_fupd",
    elf64_symbol_table_entry_elf64_st_shndx_fupd,
    DB.Def),
   ("elf64_symbol_table_entry_elf64_st_value_fupd",
    elf64_symbol_table_entry_elf64_st_value_fupd,
    DB.Def),
   ("elf64_symbol_table_entry_elf64_st_size_fupd",
    elf64_symbol_table_entry_elf64_st_size_fupd,
    DB.Def),
   ("elf64_symbol_table_entry_compare_def",
    elf64_symbol_table_entry_compare_def,
    DB.Def),
   ("instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict_def",
    instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict_def,
    DB.Def),
   ("extract_symbol_binding_def",extract_symbol_binding_def,DB.Def),
   ("extract_symbol_type_def",extract_symbol_type_def,DB.Def),
   ("make_symbol_info_def",make_symbol_info_def,DB.Def),
   ("get_symbol_visibility_def",get_symbol_visibility_def,DB.Def),
   ("make_symbol_other_def",make_symbol_other_def,DB.Def),
   ("is_elf32_shndx_too_large_def",is_elf32_shndx_too_large_def,DB.Def),
   ("is_elf64_shndx_too_large_def",is_elf64_shndx_too_large_def,DB.Def),
   ("is_elf32_null_entry_def",is_elf32_null_entry_def,DB.Def),
   ("is_elf64_null_entry_def",is_elf64_null_entry_def,DB.Def),
   ("string_of_elf32_symbol_table_entry_def",
    string_of_elf32_symbol_table_entry_def,
    DB.Def),
   ("string_of_elf64_symbol_table_entry_def",
    string_of_elf64_symbol_table_entry_def,
    DB.Def),
   ("string_of_elf32_symbol_table_def",
    string_of_elf32_symbol_table_def,
    DB.Def),
   ("elf64_null_symbol_table_entry_def",
    elf64_null_symbol_table_entry_def,
    DB.Def),
   ("string_of_elf64_symbol_table_def",
    string_of_elf64_symbol_table_def,
    DB.Def),
   ("instance_Show_Show_Elf_symbol_table_elf32_symbol_table_entry_dict_def",
    instance_Show_Show_Elf_symbol_table_elf32_symbol_table_entry_dict_def,
    DB.Def),
   ("instance_Show_Show_Elf_symbol_table_elf64_symbol_table_entry_dict_def",
    instance_Show_Show_Elf_symbol_table_elf64_symbol_table_entry_dict_def,
    DB.Def),
   ("read_elf32_symbol_table_entry_def",
    read_elf32_symbol_table_entry_def,
    DB.Def),
   ("bytes_of_elf32_symbol_table_entry_def",
    bytes_of_elf32_symbol_table_entry_def,
    DB.Def),
   ("read_elf64_symbol_table_entry_def",
    read_elf64_symbol_table_entry_def,
    DB.Def),
   ("bytes_of_elf64_symbol_table_entry_def",
    bytes_of_elf64_symbol_table_entry_def,
    DB.Def),
   ("get_elf32_symbol_image_address_def",
    get_elf32_symbol_image_address_def,
    DB.Def),
   ("get_elf64_symbol_image_address_def",
    get_elf64_symbol_image_address_def,
    DB.Def),
   ("get_elf32_symbol_type_def",get_elf32_symbol_type_def,DB.Def),
   ("get_elf64_symbol_type_def",get_elf64_symbol_type_def,DB.Def),
   ("get_elf32_symbol_binding_def",get_elf32_symbol_binding_def,DB.Def),
   ("get_elf64_symbol_binding_def",get_elf64_symbol_binding_def,DB.Def),
   ("elf32_symbol_table_entry_accessors",
    elf32_symbol_table_entry_accessors,
    DB.Thm),
   ("elf32_symbol_table_entry_fn_updates",
    elf32_symbol_table_entry_fn_updates,
    DB.Thm),
   ("elf32_symbol_table_entry_accfupds",
    elf32_symbol_table_entry_accfupds,
    DB.Thm),
   ("elf32_symbol_table_entry_fupdfupds",
    elf32_symbol_table_entry_fupdfupds,
    DB.Thm),
   ("elf32_symbol_table_entry_fupdfupds_comp",
    elf32_symbol_table_entry_fupdfupds_comp,
    DB.Thm),
   ("elf32_symbol_table_entry_fupdcanon",
    elf32_symbol_table_entry_fupdcanon,
    DB.Thm),
   ("elf32_symbol_table_entry_fupdcanon_comp",
    elf32_symbol_table_entry_fupdcanon_comp,
    DB.Thm),
   ("elf32_symbol_table_entry_component_equality",
    elf32_symbol_table_entry_component_equality,
    DB.Thm),
   ("elf32_symbol_table_entry_updates_eq_literal",
    elf32_symbol_table_entry_updates_eq_literal,
    DB.Thm),
   ("elf32_symbol_table_entry_literal_nchotomy",
    elf32_symbol_table_entry_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf32_symbol_table_entry",
    FORALL_elf32_symbol_table_entry,
    DB.Thm),
   ("EXISTS_elf32_symbol_table_entry",
    EXISTS_elf32_symbol_table_entry,
    DB.Thm),
   ("elf32_symbol_table_entry_literal_11",
    elf32_symbol_table_entry_literal_11,
    DB.Thm),
   ("datatype_elf32_symbol_table_entry",
    datatype_elf32_symbol_table_entry,
    DB.Thm),
   ("elf32_symbol_table_entry_11",elf32_symbol_table_entry_11,DB.Thm),
   ("elf32_symbol_table_entry_case_cong",
    elf32_symbol_table_entry_case_cong,
    DB.Thm),
   ("elf32_symbol_table_entry_nchotomy",
    elf32_symbol_table_entry_nchotomy,
    DB.Thm),
   ("elf32_symbol_table_entry_Axiom",
    elf32_symbol_table_entry_Axiom,
    DB.Thm),
   ("elf32_symbol_table_entry_induction",
    elf32_symbol_table_entry_induction,
    DB.Thm),
   ("elf64_symbol_table_entry_accessors",
    elf64_symbol_table_entry_accessors,
    DB.Thm),
   ("elf64_symbol_table_entry_fn_updates",
    elf64_symbol_table_entry_fn_updates,
    DB.Thm),
   ("elf64_symbol_table_entry_accfupds",
    elf64_symbol_table_entry_accfupds,
    DB.Thm),
   ("elf64_symbol_table_entry_fupdfupds",
    elf64_symbol_table_entry_fupdfupds,
    DB.Thm),
   ("elf64_symbol_table_entry_fupdfupds_comp",
    elf64_symbol_table_entry_fupdfupds_comp,
    DB.Thm),
   ("elf64_symbol_table_entry_fupdcanon",
    elf64_symbol_table_entry_fupdcanon,
    DB.Thm),
   ("elf64_symbol_table_entry_fupdcanon_comp",
    elf64_symbol_table_entry_fupdcanon_comp,
    DB.Thm),
   ("elf64_symbol_table_entry_component_equality",
    elf64_symbol_table_entry_component_equality,
    DB.Thm),
   ("elf64_symbol_table_entry_updates_eq_literal",
    elf64_symbol_table_entry_updates_eq_literal,
    DB.Thm),
   ("elf64_symbol_table_entry_literal_nchotomy",
    elf64_symbol_table_entry_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf64_symbol_table_entry",
    FORALL_elf64_symbol_table_entry,
    DB.Thm),
   ("EXISTS_elf64_symbol_table_entry",
    EXISTS_elf64_symbol_table_entry,
    DB.Thm),
   ("elf64_symbol_table_entry_literal_11",
    elf64_symbol_table_entry_literal_11,
    DB.Thm),
   ("datatype_elf64_symbol_table_entry",
    datatype_elf64_symbol_table_entry,
    DB.Thm),
   ("elf64_symbol_table_entry_11",elf64_symbol_table_entry_11,DB.Thm),
   ("elf64_symbol_table_entry_case_cong",
    elf64_symbol_table_entry_case_cong,
    DB.Thm),
   ("elf64_symbol_table_entry_nchotomy",
    elf64_symbol_table_entry_nchotomy,
    DB.Thm),
   ("elf64_symbol_table_entry_Axiom",
    elf64_symbol_table_entry_Axiom,
    DB.Thm),
   ("elf64_symbol_table_entry_induction",
    elf64_symbol_table_entry_induction,
    DB.Thm),
   ("read_elf32_symbol_table_ind",read_elf32_symbol_table_ind,DB.Thm),
   ("read_elf32_symbol_table_def",read_elf32_symbol_table_def,DB.Thm),
   ("read_elf64_symbol_table_ind",read_elf64_symbol_table_ind,DB.Thm),
   ("read_elf64_symbol_table_def",read_elf64_symbol_table_def,DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("string_tableTheory.string_table_grammars",
                          string_tableTheory.string_table_grammars),
                         ("elf_headerTheory.elf_header_grammars",
                          elf_headerTheory.elf_header_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stn_undef", (Term.prim_mk_const { Name = "stn_undef", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stn_undef", (Term.prim_mk_const { Name = "stn_undef", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_local", (Term.prim_mk_const { Name = "stb_local", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_local", (Term.prim_mk_const { Name = "stb_local", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_global", (Term.prim_mk_const { Name = "stb_global", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_global", (Term.prim_mk_const { Name = "stb_global", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_weak", (Term.prim_mk_const { Name = "stb_weak", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_weak", (Term.prim_mk_const { Name = "stb_weak", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_loos", (Term.prim_mk_const { Name = "stb_loos", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_loos", (Term.prim_mk_const { Name = "stb_loos", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_hios", (Term.prim_mk_const { Name = "stb_hios", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_hios", (Term.prim_mk_const { Name = "stb_hios", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_loproc", (Term.prim_mk_const { Name = "stb_loproc", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_loproc", (Term.prim_mk_const { Name = "stb_loproc", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_hiproc", (Term.prim_mk_const { Name = "stb_hiproc", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stb_hiproc", (Term.prim_mk_const { Name = "stb_hiproc", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_symbol_binding", (Term.prim_mk_const { Name = "string_of_symbol_binding", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_symbol_binding", (Term.prim_mk_const { Name = "string_of_symbol_binding", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_notype", (Term.prim_mk_const { Name = "stt_notype", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_notype", (Term.prim_mk_const { Name = "stt_notype", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_object", (Term.prim_mk_const { Name = "stt_object", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_object", (Term.prim_mk_const { Name = "stt_object", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_func", (Term.prim_mk_const { Name = "stt_func", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_func", (Term.prim_mk_const { Name = "stt_func", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_section", (Term.prim_mk_const { Name = "stt_section", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_section", (Term.prim_mk_const { Name = "stt_section", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_file", (Term.prim_mk_const { Name = "stt_file", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_file", (Term.prim_mk_const { Name = "stt_file", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_common", (Term.prim_mk_const { Name = "stt_common", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_common", (Term.prim_mk_const { Name = "stt_common", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_tls", (Term.prim_mk_const { Name = "stt_tls", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_tls", (Term.prim_mk_const { Name = "stt_tls", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_loos", (Term.prim_mk_const { Name = "stt_loos", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_loos", (Term.prim_mk_const { Name = "stt_loos", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_hios", (Term.prim_mk_const { Name = "stt_hios", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_hios", (Term.prim_mk_const { Name = "stt_hios", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_loproc", (Term.prim_mk_const { Name = "stt_loproc", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_loproc", (Term.prim_mk_const { Name = "stt_loproc", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_hiproc", (Term.prim_mk_const { Name = "stt_hiproc", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_hiproc", (Term.prim_mk_const { Name = "stt_hiproc", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_symbol_type", (Term.prim_mk_const { Name = "string_of_symbol_type", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_symbol_type", (Term.prim_mk_const { Name = "string_of_symbol_type", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stv_default", (Term.prim_mk_const { Name = "stv_default", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stv_default", (Term.prim_mk_const { Name = "stv_default", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stv_internal", (Term.prim_mk_const { Name = "stv_internal", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stv_internal", (Term.prim_mk_const { Name = "stv_internal", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stv_hidden", (Term.prim_mk_const { Name = "stv_hidden", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stv_hidden", (Term.prim_mk_const { Name = "stv_hidden", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stv_protected", (Term.prim_mk_const { Name = "stv_protected", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stv_protected", (Term.prim_mk_const { Name = "stv_protected", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_symbol_visibility", (Term.prim_mk_const { Name = "string_of_symbol_visibility", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_symbol_visibility", (Term.prim_mk_const { Name = "string_of_symbol_visibility", Thy = "elf_symbol_table"}))
  val _ = update_grms temp_add_type "elf32_symbol_table_entry"
  val _ = update_grms temp_add_type "elf32_symbol_table_entry"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_symbol_table_entry", (Term.prim_mk_const { Name = "recordtype.elf32_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_symbol_table_entry", (Term.prim_mk_const { Name = "recordtype.elf32_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_CASE", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_CASE", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_size", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_size", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_elf32_st_name", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_name", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_elf32_st_value", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_value", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_elf32_st_size", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_size", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_elf32_st_info", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_info", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_elf32_st_other", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_other", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_elf32_st_shndx", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_shndx", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_elf32_st_name_fupd", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_name_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_elf32_st_value_fupd", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_value_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_elf32_st_size_fupd", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_size_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_elf32_st_info_fupd", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_info_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_elf32_st_other_fupd", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_other_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_elf32_st_shndx_fupd", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_shndx_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_st_name", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_symbol_table$elf32_symbol_table_entry)). elf_symbol_table$elf32_symbol_table_entry_elf32_st_name rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_st_value", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_symbol_table$elf32_symbol_table_entry)). elf_symbol_table$elf32_symbol_table_entry_elf32_st_value rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_st_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_symbol_table$elf32_symbol_table_entry)). elf_symbol_table$elf32_symbol_table_entry_elf32_st_size rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_st_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_symbol_table$elf32_symbol_table_entry)). elf_symbol_table$elf32_symbol_table_entry_elf32_st_info rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_st_other", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_symbol_table$elf32_symbol_table_entry)). elf_symbol_table$elf32_symbol_table_entry_elf32_st_other rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_st_shndx", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_symbol_table$elf32_symbol_table_entry)). elf_symbol_table$elf32_symbol_table_entry_elf32_st_shndx rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_st_name_fupd", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_name_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_st_value_fupd", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_value_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_st_size_fupd", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_size_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_st_info_fupd", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_info_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_st_other_fupd", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_other_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_st_shndx_fupd", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_elf32_st_shndx_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_st_name", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_symbol_table$elf32_symbol_table_entry)). elf_symbol_table$elf32_symbol_table_entry_elf32_st_name_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_st_value", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_symbol_table$elf32_symbol_table_entry)). elf_symbol_table$elf32_symbol_table_entry_elf32_st_value_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_st_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_symbol_table$elf32_symbol_table_entry)). elf_symbol_table$elf32_symbol_table_entry_elf32_st_size_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_st_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[8] -> bool[8]) (x :(elf_symbol_table$elf32_symbol_table_entry)). elf_symbol_table$elf32_symbol_table_entry_elf32_st_info_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_st_other", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[8] -> bool[8]) (x :(elf_symbol_table$elf32_symbol_table_entry)). elf_symbol_table$elf32_symbol_table_entry_elf32_st_other_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_st_shndx", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_symbol_table$elf32_symbol_table_entry)). elf_symbol_table$elf32_symbol_table_entry_elf32_st_shndx_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry", (Term.prim_mk_const { Name = "recordtype.elf32_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_compare", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_compare", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_symbol_table_entry_compare", (Term.prim_mk_const { Name = "elf32_symbol_table_entry_compare", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict", Thy = "elf_symbol_table"}))
  val _ = update_grms temp_add_type "elf64_symbol_table_entry"
  val _ = update_grms temp_add_type "elf64_symbol_table_entry"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_symbol_table_entry", (Term.prim_mk_const { Name = "recordtype.elf64_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_symbol_table_entry", (Term.prim_mk_const { Name = "recordtype.elf64_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_CASE", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_CASE", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_size", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_size", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_elf64_st_name", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_name", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_elf64_st_info", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_info", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_elf64_st_other", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_other", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_elf64_st_shndx", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_shndx", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_elf64_st_value", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_value", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_elf64_st_size", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_size", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_elf64_st_name_fupd", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_name_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_elf64_st_info_fupd", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_info_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_elf64_st_other_fupd", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_other_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_elf64_st_shndx_fupd", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_shndx_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_elf64_st_value_fupd", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_value_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_elf64_st_size_fupd", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_size_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_st_name", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_symbol_table$elf64_symbol_table_entry)). elf_symbol_table$elf64_symbol_table_entry_elf64_st_name rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_st_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_symbol_table$elf64_symbol_table_entry)). elf_symbol_table$elf64_symbol_table_entry_elf64_st_info rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_st_other", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_symbol_table$elf64_symbol_table_entry)). elf_symbol_table$elf64_symbol_table_entry_elf64_st_other rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_st_shndx", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_symbol_table$elf64_symbol_table_entry)). elf_symbol_table$elf64_symbol_table_entry_elf64_st_shndx rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_st_value", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_symbol_table$elf64_symbol_table_entry)). elf_symbol_table$elf64_symbol_table_entry_elf64_st_value rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_st_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_symbol_table$elf64_symbol_table_entry)). elf_symbol_table$elf64_symbol_table_entry_elf64_st_size rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_st_name_fupd", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_name_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_st_info_fupd", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_info_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_st_other_fupd", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_other_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_st_shndx_fupd", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_shndx_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_st_value_fupd", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_value_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_st_size_fupd", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_elf64_st_size_fupd", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_st_name", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_symbol_table$elf64_symbol_table_entry)). elf_symbol_table$elf64_symbol_table_entry_elf64_st_name_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_st_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[8] -> bool[8]) (x :(elf_symbol_table$elf64_symbol_table_entry)). elf_symbol_table$elf64_symbol_table_entry_elf64_st_info_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_st_other", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[8] -> bool[8]) (x :(elf_symbol_table$elf64_symbol_table_entry)). elf_symbol_table$elf64_symbol_table_entry_elf64_st_other_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_st_shndx", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_symbol_table$elf64_symbol_table_entry)). elf_symbol_table$elf64_symbol_table_entry_elf64_st_shndx_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_st_value", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_symbol_table$elf64_symbol_table_entry)). elf_symbol_table$elf64_symbol_table_entry_elf64_st_value_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_st_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_symbol_table$elf64_symbol_table_entry)). elf_symbol_table$elf64_symbol_table_entry_elf64_st_size_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry", (Term.prim_mk_const { Name = "recordtype.elf64_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_compare", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_compare", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_symbol_table_entry_compare", (Term.prim_mk_const { Name = "elf64_symbol_table_entry_compare", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict", Thy = "elf_symbol_table"}))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_symbol_table",Name="elf32_symbol_table"}, T"list" "list" [T"elf32_symbol_table_entry" "elf_symbol_table" []])
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_symbol_table",Name="elf64_symbol_table"}, T"list" "list" [T"elf64_symbol_table_entry" "elf_symbol_table" []])
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("extract_symbol_binding", (Term.prim_mk_const { Name = "extract_symbol_binding", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("extract_symbol_binding", (Term.prim_mk_const { Name = "extract_symbol_binding", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("extract_symbol_type", (Term.prim_mk_const { Name = "extract_symbol_type", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("extract_symbol_type", (Term.prim_mk_const { Name = "extract_symbol_type", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("make_symbol_info", (Term.prim_mk_const { Name = "make_symbol_info", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("make_symbol_info", (Term.prim_mk_const { Name = "make_symbol_info", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_symbol_visibility", (Term.prim_mk_const { Name = "get_symbol_visibility", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_symbol_visibility", (Term.prim_mk_const { Name = "get_symbol_visibility", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("make_symbol_other", (Term.prim_mk_const { Name = "make_symbol_other", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("make_symbol_other", (Term.prim_mk_const { Name = "make_symbol_other", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_shndx_too_large", (Term.prim_mk_const { Name = "is_elf32_shndx_too_large", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_shndx_too_large", (Term.prim_mk_const { Name = "is_elf32_shndx_too_large", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_shndx_too_large", (Term.prim_mk_const { Name = "is_elf64_shndx_too_large", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_shndx_too_large", (Term.prim_mk_const { Name = "is_elf64_shndx_too_large", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_null_entry", (Term.prim_mk_const { Name = "is_elf32_null_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_null_entry", (Term.prim_mk_const { Name = "is_elf32_null_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_null_entry", (Term.prim_mk_const { Name = "is_elf64_null_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_null_entry", (Term.prim_mk_const { Name = "is_elf64_null_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_symbol_table",Name="symtab_print_bundle"}, T"prod" "pair"
 [(T"num" "num" [] --> T"list" "list" [T"char" "string" []]),
  (T"num" "num" [] --> T"list" "list" [T"char" "string" []])])
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_symbol_table_entry", (Term.prim_mk_const { Name = "string_of_elf32_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_symbol_table_entry", (Term.prim_mk_const { Name = "string_of_elf32_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_symbol_table_entry", (Term.prim_mk_const { Name = "string_of_elf64_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_symbol_table_entry", (Term.prim_mk_const { Name = "string_of_elf64_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_symbol_table", (Term.prim_mk_const { Name = "string_of_elf32_symbol_table", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_symbol_table", (Term.prim_mk_const { Name = "string_of_elf32_symbol_table", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_null_symbol_table_entry", (Term.prim_mk_const { Name = "elf64_null_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_null_symbol_table_entry", (Term.prim_mk_const { Name = "elf64_null_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_symbol_table", (Term.prim_mk_const { Name = "string_of_elf64_symbol_table", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_symbol_table", (Term.prim_mk_const { Name = "string_of_elf64_symbol_table", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_symbol_table_elf32_symbol_table_entry_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_symbol_table_elf32_symbol_table_entry_dict", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_symbol_table_elf32_symbol_table_entry_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_symbol_table_elf32_symbol_table_entry_dict", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_symbol_table_elf64_symbol_table_entry_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_symbol_table_elf64_symbol_table_entry_dict", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_symbol_table_elf64_symbol_table_entry_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_symbol_table_elf64_symbol_table_entry_dict", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_symbol_table_entry", (Term.prim_mk_const { Name = "read_elf32_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_symbol_table_entry", (Term.prim_mk_const { Name = "read_elf32_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_symbol_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf32_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_symbol_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf32_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_symbol_table_entry", (Term.prim_mk_const { Name = "read_elf64_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_symbol_table_entry", (Term.prim_mk_const { Name = "read_elf64_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_symbol_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf64_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_symbol_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf64_symbol_table_entry", Thy = "elf_symbol_table"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_symbol_table", (Term.prim_mk_const { Name = "read_elf32_symbol_table", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_symbol_table", (Term.prim_mk_const { Name = "read_elf32_symbol_table", Thy = "elf_symbol_table"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_symbol_table", (Term.prim_mk_const { Name = "read_elf64_symbol_table", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_symbol_table", (Term.prim_mk_const { Name = "read_elf64_symbol_table", Thy = "elf_symbol_table"}))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_symbol_table",Name="symbol_address_map"}, T"list" "list"
 [T"prod" "pair"
   [T"list" "list" [T"char" "string" []],
    T"prod" "pair"
     [T"num" "num" [],
      T"prod" "pair"
       [T"num" "num" [],
        T"prod" "pair" [T"num" "num" [], T"num" "num" []]]]]])
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_symbol_image_address", (Term.prim_mk_const { Name = "get_elf32_symbol_image_address", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_symbol_image_address", (Term.prim_mk_const { Name = "get_elf32_symbol_image_address", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_symbol_image_address", (Term.prim_mk_const { Name = "get_elf64_symbol_image_address", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_symbol_image_address", (Term.prim_mk_const { Name = "get_elf64_symbol_image_address", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_symbol_type", (Term.prim_mk_const { Name = "get_elf32_symbol_type", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_symbol_type", (Term.prim_mk_const { Name = "get_elf32_symbol_type", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_symbol_type", (Term.prim_mk_const { Name = "get_elf64_symbol_type", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_symbol_type", (Term.prim_mk_const { Name = "get_elf64_symbol_type", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_symbol_binding", (Term.prim_mk_const { Name = "get_elf32_symbol_binding", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_symbol_binding", (Term.prim_mk_const { Name = "get_elf32_symbol_binding", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_symbol_binding", (Term.prim_mk_const { Name = "get_elf64_symbol_binding", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_symbol_binding", (Term.prim_mk_const { Name = "get_elf64_symbol_binding", Thy = "elf_symbol_table"}))
  val elf_symbol_table_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG elf32_symbol_table_entry_Axiom,
           case_def=elf32_symbol_table_entry_case_def,
           case_cong=elf32_symbol_table_entry_case_cong,
           induction=ORIG elf32_symbol_table_entry_induction,
           nchotomy=elf32_symbol_table_entry_nchotomy,
           size=SOME(Parse.Term`(elf_symbol_table$elf32_symbol_table_entry_size) :(elf_symbol_table$elf32_symbol_table_entry) -> (num$num)`,
                     ORIG elf32_symbol_table_entry_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf32_symbol_table_entry_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf32_st_name",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_st_value",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"one" "one" []]]]]]]),
 ("elf32_st_size",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_st_info",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0" [T"one" "one" []]]]]),
 ("elf32_st_other",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"one" "one" []]]]]),
 ("elf32_st_shndx",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"one" "one" []]]]]])] end,
           accessors=Drule.CONJUNCTS elf32_symbol_table_entry_accessors,
           updates=Drule.CONJUNCTS elf32_symbol_table_entry_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf32_symbol_table_entry_accessors, elf32_symbol_table_entry_updates_eq_literal, elf32_symbol_table_entry_accfupds, elf32_symbol_table_entry_fupdfupds, elf32_symbol_table_entry_literal_11, elf32_symbol_table_entry_fupdfupds_comp, elf32_symbol_table_entry_fupdcanon, elf32_symbol_table_entry_fupdcanon_comp] tyinfo0
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
          {ax=ORIG elf64_symbol_table_entry_Axiom,
           case_def=elf64_symbol_table_entry_case_def,
           case_cong=elf64_symbol_table_entry_case_cong,
           induction=ORIG elf64_symbol_table_entry_induction,
           nchotomy=elf64_symbol_table_entry_nchotomy,
           size=SOME(Parse.Term`(elf_symbol_table$elf64_symbol_table_entry_size) :(elf_symbol_table$elf64_symbol_table_entry) -> (num$num)`,
                     ORIG elf64_symbol_table_entry_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf64_symbol_table_entry_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf64_st_name",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf64_st_info",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0" [T"one" "one" []]]]]),
 ("elf64_st_other",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"one" "one" []]]]]),
 ("elf64_st_shndx",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"one" "one" []]]]]]),
 ("elf64_st_value",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"one" "one" []]]]]]]]),
 ("elf64_st_size",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]])] end,
           accessors=Drule.CONJUNCTS elf64_symbol_table_entry_accessors,
           updates=Drule.CONJUNCTS elf64_symbol_table_entry_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf64_symbol_table_entry_accessors, elf64_symbol_table_entry_updates_eq_literal, elf64_symbol_table_entry_accfupds, elf64_symbol_table_entry_fupdfupds, elf64_symbol_table_entry_literal_11, elf64_symbol_table_entry_fupdfupds_comp, elf64_symbol_table_entry_fupdcanon, elf64_symbol_table_entry_fupdcanon_comp] tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "elf_symbol_table",
    thydataty = "compute",
    data =
        "elf_symbol_table.stn_undef_def elf_symbol_table.stv_protected_def elf_symbol_table.get_elf64_symbol_binding_def elf_symbol_table.get_elf32_symbol_binding_def elf_symbol_table.get_elf64_symbol_type_def elf_symbol_table.get_elf32_symbol_type_def elf_symbol_table.get_elf64_symbol_image_address_def elf_symbol_table.get_elf32_symbol_image_address_def elf_symbol_table.bytes_of_elf64_symbol_table_entry_def elf_symbol_table.read_elf64_symbol_table_entry_def elf_symbol_table.bytes_of_elf32_symbol_table_entry_def elf_symbol_table.read_elf32_symbol_table_entry_def elf_symbol_table.instance_Show_Show_Elf_symbol_table_elf64_symbol_table_entry_dict_def elf_symbol_table.instance_Show_Show_Elf_symbol_table_elf32_symbol_table_entry_dict_def elf_symbol_table.string_of_elf64_symbol_table_def elf_symbol_table.elf64_null_symbol_table_entry_def elf_symbol_table.string_of_elf32_symbol_table_def elf_symbol_table.string_of_elf64_symbol_table_entry_def elf_symbol_table.string_of_elf32_symbol_table_entry_def elf_symbol_table.is_elf64_null_entry_def elf_symbol_table.is_elf32_null_entry_def elf_symbol_table.is_elf64_shndx_too_large_def elf_symbol_table.is_elf32_shndx_too_large_def elf_symbol_table.make_symbol_other_def elf_symbol_table.get_symbol_visibility_def elf_symbol_table.make_symbol_info_def elf_symbol_table.extract_symbol_type_def elf_symbol_table.extract_symbol_binding_def elf_symbol_table.instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict_def elf_symbol_table.elf64_symbol_table_entry_compare_def elf_symbol_table.instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict_def elf_symbol_table.elf32_symbol_table_entry_compare_def elf_symbol_table.string_of_symbol_visibility_def elf_symbol_table.stv_hidden_def elf_symbol_table.stv_internal_def elf_symbol_table.stt_tls_def elf_symbol_table.stv_default_def elf_symbol_table.string_of_symbol_type_def elf_symbol_table.stt_hiproc_def elf_symbol_table.stt_loproc_def elf_symbol_table.stt_hios_def elf_symbol_table.stt_loos_def elf_symbol_table.stt_object_def elf_symbol_table.stt_common_def elf_symbol_table.stt_file_def elf_symbol_table.stt_section_def elf_symbol_table.stt_func_def elf_symbol_table.string_of_symbol_binding_def elf_symbol_table.stt_notype_def elf_symbol_table.stb_loos_def elf_symbol_table.stb_hiproc_def elf_symbol_table.stb_loproc_def elf_symbol_table.stb_hios_def elf_symbol_table.stb_weak_def elf_symbol_table.stb_global_def elf_symbol_table.stb_local_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "elf_symbol_table"
end
