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
          Arbnum.fromString "1445438870",
          Arbnum.fromString "16827")
          [("string_table",
           Arbnum.fromString "1445438794",
           Arbnum.fromString "925999"),
           ("elf_header",
           Arbnum.fromString "1445438753",
           Arbnum.fromString "972064")];
  val _ = Theory.incorporate_types "elf_symbol_table"
       [("elf64_symbol_table_entry", 0), ("elf32_symbol_table_entry", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("num", "num"), ID("min", "fun"), ID("list", "list"),
   ID("string", "char"),
   ID("elf_symbol_table", "elf64_symbol_table_entry"), ID("fcp", "cart"),
   ID("fcp", "bit0"), ID("one", "one"), ID("min", "bool"),
   ID("elf_symbol_table", "elf32_symbol_table_entry"),
   ID("error", "error"), ID("pair", "prod"),
   ID("byte_sequence", "byte_sequence"), ID("endianness", "endianness"),
   ID("lem_basic_classes", "Ord_class"),
   ID("string_table", "string_table"), ID("lem_basic_classes", "ordering"),
   ID("ind_type", "recspace"), ID("min", "ind"), ID("bool", "!"),
   ID("arithmetic", "*"), ID("pair", ","), ID("bool", "/\\"),
   ID("num", "0"), ID("prim_rec", "<"), ID("arithmetic", "<="),
   ID("min", "="), ID("min", "==>"), ID("arithmetic", ">="),
   ID("bool", "?"), ID("min", "@"), ID("bool", "ARB"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("pred_set", "EMPTY"), ID("lem_basic_classes", "EQ"),
   ID("lem_basic_classes", "GT"), ID("combin", "I"), ID("bool", "IN"),
   ID("pred_set", "INSERT"), ID("combin", "K"), ID("bool", "LET"),
   ID("lem_basic_classes", "LT"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("bool", "TYPE_DEFINITION"), ID("pair", "UNCURRY"),
   ID("relation", "WF"), ID("relation", "WFREC"), ID("arithmetic", "ZERO"),
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
   ID("error", "error_bind"), ID("lem_basic_classes", "genericCompare"),
   ID("elf_symbol_table", "get_elf32_symbol_image_address"),
   ID("elf_symbol_table", "get_elf32_symbol_type"),
   ID("elf_symbol_table", "get_elf64_symbol_image_address"),
   ID("elf_symbol_table", "get_elf64_symbol_type"),
   ID("string_table", "get_string_at"),
   ID("elf_symbol_table", "get_symbol_binding"),
   ID("elf_symbol_table", "get_symbol_type"),
   ID("elf_symbol_table", "get_symbol_visibility"),
   ID("elf_symbol_table", "instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict"),
   ID("elf_symbol_table", "instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict"),
   ID("elf_symbol_table", "is_elf32_null_entry"),
   ID("elf_symbol_table", "is_elf32_shndx_too_large"),
   ID("elf_symbol_table", "is_elf64_null_entry"),
   ID("elf_symbol_table", "is_elf64_shndx_too_large"),
   ID("byte_sequence", "length0"),
   ID("elf_symbol_table", "make_symbol_info"),
   ID("elf_symbol_table", "make_symbol_other"), ID("error", "mapM"),
   ID("words", "n2w"), ID("combin", "o"), ID("pair", "pair_CASE"),
   ID("elf_types_native_uint", "read_elf32_addr"),
   ID("elf_types_native_uint", "read_elf32_half"),
   ID("elf_symbol_table", "read_elf32_symbol_table"),
   ID("elf_symbol_table", "read_elf32_symbol_table_entry"),
   ID("elf_symbol_table", "read_elf32_symbol_table_tupled"),
   ID("elf_types_native_uint", "read_elf32_word"),
   ID("elf_types_native_uint", "read_elf64_addr"),
   ID("elf_types_native_uint", "read_elf64_half"),
   ID("elf_symbol_table", "read_elf64_symbol_table"),
   ID("elf_symbol_table", "read_elf64_symbol_table_entry"),
   ID("elf_symbol_table", "read_elf64_symbol_table_tupled"),
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
   ID("elf_symbol_table", "stv_protected"), ID("words", "w2n"),
   ID("words", "word_add"), ID("words", "word_and"),
   ID("words", "word_lsl"), ID("words", "word_lsr"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYOP [3], TYOP [2, 1], TYOP [1, 0, 2], TYOP [1, 3, 2],
   TYOP [1, 3, 4], TYOP [1, 0, 5], TYOP [4], TYOP [7], TYOP [6, 8],
   TYOP [6, 9], TYOP [6, 10], TYOP [6, 11], TYOP [6, 12], TYOP [6, 13],
   TYOP [8], TYOP [5, 15, 14], TYOP [1, 16, 7], TYOP [1, 16, 17],
   TYOP [5, 15, 12], TYOP [1, 19, 18], TYOP [5, 15, 11], TYOP [1, 21, 20],
   TYOP [1, 21, 22], TYOP [5, 15, 13], TYOP [1, 24, 23], TYOP [9],
   TYOP [1, 19, 26], TYOP [1, 21, 27], TYOP [1, 21, 28], TYOP [1, 24, 29],
   TYOP [1, 24, 30], TYOP [1, 24, 31], TYOP [2, 7], TYOP [10, 33],
   TYOP [12], TYOP [13], TYOP [11, 36, 35], TYOP [1, 37, 34],
   TYOP [11, 7, 35], TYOP [10, 39], TYOP [1, 35, 40], TYOP [1, 36, 41],
   TYOP [1, 35, 34], TYOP [1, 36, 43], TYOP [2, 26], TYOP [10, 45],
   TYOP [1, 37, 46], TYOP [11, 26, 35], TYOP [10, 48], TYOP [1, 35, 49],
   TYOP [1, 36, 50], TYOP [1, 35, 46], TYOP [1, 36, 52], TYOP [1, 0, 21],
   TYOP [1, 0, 54], TYOP [1, 7, 15], TYOP [1, 26, 15], TYOP [14, 7],
   TYOP [14, 26], TYOP [1, 21, 0], TYV "'a", TYOP [5, 15, 61],
   TYOP [1, 62, 0], TYOP [1, 7, 0], TYOP [11, 0, 0], TYOP [11, 0, 65],
   TYOP [11, 0, 66], TYOP [11, 2, 67], TYOP [2, 68], TYOP [10, 69],
   TYOP [15], TYOP [1, 71, 70], TYOP [1, 33, 72], TYOP [1, 26, 0],
   TYOP [1, 45, 72], TYOP [1, 7, 7], TYOP [1, 16, 16], TYOP [1, 77, 76],
   TYOP [1, 7, 16], TYOP [1, 19, 19], TYOP [1, 80, 76], TYOP [1, 7, 19],
   TYOP [1, 21, 21], TYOP [1, 83, 76], TYOP [1, 7, 21], TYOP [1, 24, 24],
   TYOP [1, 86, 76], TYOP [1, 7, 24], TYOP [16], TYOP [1, 7, 89],
   TYOP [1, 7, 90], TYOP [1, 16, 61], TYOP [1, 16, 92], TYOP [1, 19, 93],
   TYOP [1, 21, 94], TYOP [1, 21, 95], TYOP [1, 24, 96], TYOP [1, 97, 61],
   TYOP [1, 7, 98], TYOP [1, 26, 26], TYOP [1, 86, 100], TYOP [1, 26, 24],
   TYOP [1, 80, 100], TYOP [1, 26, 19], TYOP [1, 83, 100],
   TYOP [1, 26, 21], TYOP [1, 26, 89], TYOP [1, 26, 107], TYOP [1, 19, 61],
   TYOP [1, 21, 109], TYOP [1, 21, 110], TYOP [1, 24, 111],
   TYOP [1, 24, 112], TYOP [1, 24, 113], TYOP [1, 114, 61],
   TYOP [1, 26, 115], TYOP [11, 21, 19], TYOP [11, 21, 117],
   TYOP [11, 24, 118], TYOP [11, 24, 119], TYOP [11, 24, 120],
   TYOP [17, 121], TYOP [1, 122, 15], TYOP [11, 16, 16],
   TYOP [11, 19, 124], TYOP [11, 21, 125], TYOP [11, 21, 126],
   TYOP [11, 24, 127], TYOP [17, 128], TYOP [1, 129, 15], TYOP [1, 35, 15],
   TYOP [1, 36, 131], TYOP [1, 37, 15], TYOP [1, 37, 133], TYOP [18],
   TYOP [1, 26, 61], TYOP [1, 7, 61], TYOP [1, 61, 26], TYOP [1, 61, 7],
   TYOP [1, 19, 15], TYOP [1, 21, 140], TYOP [1, 21, 141],
   TYOP [1, 24, 142], TYOP [1, 24, 143], TYOP [1, 24, 144],
   TYOP [1, 135, 145], TYOP [1, 16, 15], TYOP [1, 16, 147],
   TYOP [1, 19, 148], TYOP [1, 21, 149], TYOP [1, 21, 150],
   TYOP [1, 24, 151], TYOP [1, 135, 152], TYOP [1, 26, 122],
   TYOP [1, 7, 129], TYOP [1, 131, 15], TYOP [1, 62, 15],
   TYOP [1, 157, 15], TYOP [1, 147, 15], TYOP [1, 24, 15],
   TYOP [1, 160, 15], TYOP [1, 140, 15], TYOP [1, 21, 15],
   TYOP [1, 163, 15], TYOP [1, 57, 15], TYOP [1, 56, 15], TYOP [1, 36, 15],
   TYOP [1, 167, 15], TYOP [1, 138, 15], TYOP [1, 169, 15],
   TYOP [1, 139, 15], TYOP [1, 171, 15], TYOP [1, 77, 15],
   TYOP [1, 173, 15], TYOP [1, 86, 15], TYOP [1, 175, 15],
   TYOP [1, 114, 15], TYOP [1, 177, 15], TYOP [1, 97, 15],
   TYOP [1, 179, 15], TYOP [1, 80, 15], TYOP [1, 181, 15],
   TYOP [1, 83, 15], TYOP [1, 183, 15], TYOP [1, 165, 15],
   TYOP [1, 166, 15], TYOP [1, 132, 15], TYOP [1, 187, 15],
   TYOP [1, 3, 15], TYOP [1, 189, 15], TYOP [1, 123, 15],
   TYOP [1, 191, 15], TYOP [1, 130, 15], TYOP [1, 193, 15],
   TYOP [1, 45, 15], TYOP [1, 195, 15], TYOP [1, 33, 15],
   TYOP [1, 197, 15], TYOP [1, 0, 15], TYOP [1, 199, 15], TYOP [1, 71, 15],
   TYOP [1, 201, 15], TYOP [1, 0, 0], TYOP [1, 0, 203], TYOP [1, 16, 124],
   TYOP [1, 16, 205], TYOP [1, 120, 121], TYOP [1, 24, 207],
   TYOP [1, 119, 120], TYOP [1, 24, 209], TYOP [1, 118, 119],
   TYOP [1, 24, 211], TYOP [1, 127, 128], TYOP [1, 24, 213],
   TYOP [1, 124, 125], TYOP [1, 19, 215], TYOP [1, 19, 117],
   TYOP [1, 21, 217], TYOP [1, 125, 126], TYOP [1, 21, 219],
   TYOP [1, 117, 118], TYOP [1, 21, 221], TYOP [1, 126, 127],
   TYOP [1, 21, 223], TYOP [1, 35, 48], TYOP [1, 26, 225],
   TYOP [1, 35, 39], TYOP [1, 7, 227], TYOP [1, 35, 37], TYOP [1, 36, 229],
   TYOP [1, 67, 68], TYOP [1, 2, 231], TYOP [1, 0, 65], TYOP [1, 0, 233],
   TYOP [1, 65, 66], TYOP [1, 0, 235], TYOP [1, 66, 67], TYOP [1, 0, 237],
   TYOP [11, 0, 67], TYOP [1, 67, 239], TYOP [1, 0, 240],
   TYOP [11, 0, 239], TYOP [1, 239, 242], TYOP [1, 0, 243],
   TYOP [1, 15, 15], TYOP [1, 15, 245], TYOP [1, 0, 199], TYOP [1, 61, 15],
   TYOP [1, 61, 248], TYOP [1, 59, 15], TYOP [1, 59, 250],
   TYOP [1, 58, 15], TYOP [1, 58, 252], TYOP [1, 24, 160],
   TYOP [1, 19, 140], TYOP [1, 21, 163], TYOP [1, 26, 57], TYOP [1, 7, 56],
   TYOP [1, 46, 15], TYOP [1, 46, 259], TYOP [1, 34, 15],
   TYOP [1, 34, 261], TYOP [1, 70, 15], TYOP [1, 70, 263],
   TYOP [1, 49, 15], TYOP [1, 49, 265], TYOP [1, 40, 15],
   TYOP [1, 40, 267], TYOP [1, 138, 169], TYOP [1, 139, 171],
   TYOP [1, 100, 15], TYOP [1, 100, 271], TYOP [1, 76, 15],
   TYOP [1, 76, 273], TYOP [1, 47, 15], TYOP [1, 47, 275],
   TYOP [1, 38, 15], TYOP [1, 38, 277], TYOP [1, 2, 15], TYOP [1, 2, 279],
   TYOP [1, 89, 15], TYOP [1, 89, 281], TYOP [1, 122, 123],
   TYOP [1, 129, 130], TYOP [1, 136, 15], TYOP [1, 285, 15],
   TYOP [1, 154, 15], TYOP [1, 287, 15], TYOP [1, 137, 15],
   TYOP [1, 289, 15], TYOP [1, 155, 15], TYOP [1, 291, 15],
   TYOP [1, 134, 15], TYOP [1, 293, 134], TYOP [1, 0, 1], TYOP [1, 46, 46],
   TYOP [1, 46, 296], TYOP [1, 15, 297], TYOP [1, 34, 34],
   TYOP [1, 34, 299], TYOP [1, 15, 300], TYOP [1, 2, 2], TYOP [1, 2, 302],
   TYOP [1, 15, 303], TYOP [1, 1, 302], TYOP [1, 45, 45],
   TYOP [1, 26, 306], TYOP [1, 33, 33], TYOP [1, 7, 308], TYOP [1, 0, 122],
   TYOP [1, 310, 122], TYOP [1, 121, 311], TYOP [1, 0, 312],
   TYOP [1, 0, 129], TYOP [1, 314, 129], TYOP [1, 128, 315],
   TYOP [1, 0, 316], TYOP [1, 281, 15], TYOP [1, 89, 318],
   TYOP [1, 281, 281], TYOP [1, 89, 320], TYOP [1, 16, 77],
   TYOP [1, 24, 86], TYOP [1, 19, 80], TYOP [1, 21, 83],
   TYOP [1, 257, 257], TYOP [1, 257, 326], TYOP [1, 108, 108],
   TYOP [1, 108, 328], TYOP [1, 258, 258], TYOP [1, 258, 330],
   TYOP [1, 91, 91], TYOP [1, 91, 332], TYOP [10, 68], TYOP [1, 0, 334],
   TYOP [1, 335, 335], TYOP [1, 59, 59], TYOP [1, 328, 337],
   TYOP [1, 58, 58], TYOP [1, 332, 339], TYOP [1, 326, 337],
   TYOP [1, 330, 339], TYOP [1, 123, 287], TYOP [1, 130, 291],
   TYOP [11, 16, 35], TYOP [1, 345, 40], TYOP [1, 16, 41],
   TYOP [1, 347, 346], TYOP [11, 24, 35], TYOP [1, 349, 49],
   TYOP [1, 24, 50], TYOP [1, 351, 350], TYOP [1, 349, 40],
   TYOP [1, 24, 41], TYOP [1, 354, 353], TYOP [11, 19, 35],
   TYOP [1, 356, 49], TYOP [1, 19, 50], TYOP [1, 358, 357],
   TYOP [1, 356, 40], TYOP [1, 19, 41], TYOP [1, 361, 360],
   TYOP [11, 21, 35], TYOP [1, 363, 49], TYOP [1, 21, 50],
   TYOP [1, 365, 364], TYOP [1, 363, 40], TYOP [1, 21, 41],
   TYOP [1, 368, 367], TYOP [1, 48, 46], TYOP [1, 26, 52],
   TYOP [1, 371, 370], TYOP [1, 39, 34], TYOP [1, 7, 43],
   TYOP [1, 374, 373], TYOP [1, 47, 47], TYOP [1, 376, 47],
   TYOP [1, 134, 377], TYOP [1, 38, 38], TYOP [1, 379, 38],
   TYOP [1, 134, 380], TYOP [1, 2, 334], TYOP [1, 382, 334], TYOP [10, 2],
   TYOP [1, 384, 383], TYOP [1, 45, 46], TYOP [1, 386, 46],
   TYOP [1, 46, 387], TYOP [1, 33, 34], TYOP [1, 389, 34],
   TYOP [1, 34, 390], TYOP [1, 346, 40], TYOP [10, 345],
   TYOP [1, 393, 392], TYOP [1, 350, 49], TYOP [10, 349],
   TYOP [1, 396, 395], TYOP [1, 353, 40], TYOP [1, 396, 398],
   TYOP [1, 357, 49], TYOP [10, 356], TYOP [1, 401, 400],
   TYOP [1, 360, 40], TYOP [1, 401, 403], TYOP [1, 364, 49],
   TYOP [10, 363], TYOP [1, 406, 405], TYOP [1, 367, 40],
   TYOP [1, 406, 408], TYOP [1, 370, 46], TYOP [1, 49, 410],
   TYOP [1, 373, 34], TYOP [1, 40, 412], TYOP [1, 0, 89], TYOP [1, 0, 414],
   TYOP [1, 247, 415], TYOP [1, 247, 416], TYOP [1, 71, 384],
   TYOP [1, 0, 418], TYOP [1, 35, 0], TYOP [1, 45, 70], TYOP [1, 26, 334],
   TYOP [1, 422, 421], TYOP [1, 33, 70], TYOP [1, 7, 334],
   TYOP [1, 425, 424], TYOP [1, 0, 16], TYOP [1, 0, 24], TYOP [1, 0, 19],
   TYOP [1, 77, 77], TYOP [1, 77, 430], TYOP [1, 86, 86],
   TYOP [1, 86, 432], TYOP [1, 80, 80], TYOP [1, 80, 434],
   TYOP [1, 83, 83], TYOP [1, 83, 436], TYOP [1, 138, 138],
   TYOP [1, 100, 438], TYOP [1, 100, 100], TYOP [1, 100, 440],
   TYOP [1, 139, 139], TYOP [1, 76, 442], TYOP [1, 76, 76],
   TYOP [1, 76, 444], TYOP [1, 53, 46], TYOP [1, 37, 446],
   TYOP [1, 44, 34], TYOP [1, 37, 448], TYOP [1, 35, 396],
   TYOP [1, 36, 450], TYOP [1, 35, 401], TYOP [1, 36, 452],
   TYOP [1, 35, 393], TYOP [1, 36, 454], TYOP [1, 35, 406],
   TYOP [1, 36, 456], TYOP [1, 48, 49], TYOP [1, 39, 40],
   TYOP [1, 68, 334], TYOP [1, 242, 89], TYOP [1, 242, 461],
   TYOP [1, 415, 462], TYOP [1, 415, 463], TYOP [1, 415, 464],
   TYOP [1, 415, 465], TYOP [1, 415, 466], TYOP [1, 415, 467],
   TYOP [1, 16, 0], TYOP [1, 24, 0], TYOP [1, 19, 0], TYOP [1, 21, 54],
   TYOP [1, 0, 62], TYOP [1, 62, 473]]
  end
  val _ = Theory.incorporate_consts "elf_symbol_table" tyvector
     [("stv_protected", 0), ("stv_internal", 0), ("stv_hidden", 0),
      ("stv_default", 0), ("stt_tls", 0), ("stt_section", 0),
      ("stt_object", 0), ("stt_notype", 0), ("stt_loproc", 0),
      ("stt_loos", 0), ("stt_hiproc", 0), ("stt_hios", 0), ("stt_func", 0),
      ("stt_file", 0), ("stt_common", 0),
      ("string_of_symbol_visibility", 3), ("string_of_symbol_type", 6),
      ("stn_undef", 0), ("stb_weak", 0), ("stb_loproc", 0),
      ("stb_loos", 0), ("stb_local", 0), ("stb_hiproc", 0),
      ("stb_hios", 0), ("stb_global", 0),
      ("recordtype.elf64_symbol_table_entry", 25),
      ("recordtype.elf32_symbol_table_entry", 32),
      ("read_elf64_symbol_table_tupled", 38),
      ("read_elf64_symbol_table_entry", 42),
      ("read_elf64_symbol_table", 44),
      ("read_elf32_symbol_table_tupled", 47),
      ("read_elf32_symbol_table_entry", 51),
      ("read_elf32_symbol_table", 53), ("make_symbol_other", 54),
      ("make_symbol_info", 55), ("is_elf64_shndx_too_large", 56),
      ("is_elf64_null_entry", 56), ("is_elf32_shndx_too_large", 57),
      ("is_elf32_null_entry", 57),
      ("instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict", 58),
      ("instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict", 59),
      ("get_symbol_visibility", 60), ("get_symbol_type", 60),
      ("get_symbol_binding", 63), ("get_elf64_symbol_type", 64),
      ("get_elf64_symbol_image_address", 73),
      ("get_elf32_symbol_type", 74),
      ("get_elf32_symbol_image_address", 75),
      ("elf64_symbol_table_entry_size", 64),
      ("elf64_symbol_table_entry_elf64_st_value_fupd", 78),
      ("elf64_symbol_table_entry_elf64_st_value", 79),
      ("elf64_symbol_table_entry_elf64_st_size_fupd", 78),
      ("elf64_symbol_table_entry_elf64_st_size", 79),
      ("elf64_symbol_table_entry_elf64_st_shndx_fupd", 81),
      ("elf64_symbol_table_entry_elf64_st_shndx", 82),
      ("elf64_symbol_table_entry_elf64_st_other_fupd", 84),
      ("elf64_symbol_table_entry_elf64_st_other", 85),
      ("elf64_symbol_table_entry_elf64_st_name_fupd", 87),
      ("elf64_symbol_table_entry_elf64_st_name", 88),
      ("elf64_symbol_table_entry_elf64_st_info_fupd", 84),
      ("elf64_symbol_table_entry_elf64_st_info", 85),
      ("elf64_symbol_table_entry_compare", 91),
      ("elf64_symbol_table_entry_CASE", 99),
      ("elf64_null_symbol_table_entry", 7),
      ("elf32_symbol_table_entry_size", 74),
      ("elf32_symbol_table_entry_elf32_st_value_fupd", 101),
      ("elf32_symbol_table_entry_elf32_st_value", 102),
      ("elf32_symbol_table_entry_elf32_st_size_fupd", 101),
      ("elf32_symbol_table_entry_elf32_st_size", 102),
      ("elf32_symbol_table_entry_elf32_st_shndx_fupd", 103),
      ("elf32_symbol_table_entry_elf32_st_shndx", 104),
      ("elf32_symbol_table_entry_elf32_st_other_fupd", 105),
      ("elf32_symbol_table_entry_elf32_st_other", 106),
      ("elf32_symbol_table_entry_elf32_st_name_fupd", 101),
      ("elf32_symbol_table_entry_elf32_st_name", 102),
      ("elf32_symbol_table_entry_elf32_st_info_fupd", 105),
      ("elf32_symbol_table_entry_elf32_st_info", 106),
      ("elf32_symbol_table_entry_compare", 108),
      ("elf32_symbol_table_entry_CASE", 116)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'elf32_symbol_table_entry'", 123),
   TMV("'elf64_symbol_table_entry'", 130), TMV("M", 26), TMV("M", 7),
   TMV("M'", 26), TMV("M'", 7), TMV("P", 57), TMV("P", 56), TMV("P", 132),
   TMV("R", 134), TMV("a", 37), TMV("a0", 24), TMV("a0'", 24),
   TMV("a0'", 122), TMV("a0'", 129), TMV("a1", 24), TMV("a1", 21),
   TMV("a1'", 24), TMV("a1'", 21), TMV("a2", 24), TMV("a2", 21),
   TMV("a2'", 24), TMV("a2'", 21), TMV("a3", 19), TMV("a3", 21),
   TMV("a3'", 19), TMV("a3'", 21), TMV("a4", 16), TMV("a4", 21),
   TMV("a4'", 16), TMV("a4'", 21), TMV("a5", 16), TMV("a5", 19),
   TMV("a5'", 16), TMV("a5'", 19), TMV("addr", 0), TMV("binding", 0),
   TMV("bnd", 0), TMV("bs0", 35), TMV("bs0'", 35), TMV("c", 16),
   TMV("c", 24), TMV("c", 19), TMV("c0", 16), TMV("c0", 24), TMV("c0", 21),
   TMV("c01", 16), TMV("c01", 21), TMV("c02", 16), TMV("c02", 21),
   TMV("c1", 16), TMV("c1", 24), TMV("c1", 19), TMV("c1", 21),
   TMV("c11", 19), TMV("c11", 21), TMV("c12", 19), TMV("c12", 21),
   TMV("c2", 16), TMV("c2", 24), TMV("c2", 19), TMV("c2", 21),
   TMV("c21", 24), TMV("c21", 21), TMV("c22", 24), TMV("c22", 21),
   TMV("c3", 16), TMV("c3", 24), TMV("c3", 21), TMV("c31", 24),
   TMV("c31", 21), TMV("c32", 24), TMV("c32", 21), TMV("c4", 16),
   TMV("c4", 24), TMV("c4", 19), TMV("c41", 24), TMV("c42", 24),
   TMV("e", 26), TMV("e", 7), TMV("e1", 26), TMV("e1", 7), TMV("e2", 26),
   TMV("e2", 7), TMV("ee", 26), TMV("ee", 7), TMV("elf32_st_info", 21),
   TMV("elf32_st_name", 24), TMV("elf32_st_other", 21),
   TMV("elf32_st_shndx", 19), TMV("elf32_st_size", 24),
   TMV("elf32_st_value", 24), TMV("elf32_symbol_table_entry", 135),
   TMV("elf64_st_info", 21), TMV("elf64_st_name", 24),
   TMV("elf64_st_other", 21), TMV("elf64_st_shndx", 19),
   TMV("elf64_st_size", 16), TMV("elf64_st_value", 16),
   TMV("elf64_symbol_table_entry", 135), TMV("endian", 36), TMV("ent", 26),
   TMV("ent", 7), TMV("ent1", 26), TMV("ent1", 7), TMV("ent2", 26),
   TMV("ent2", 7), TMV("entry", 62), TMV("entry", 21), TMV("entry", 26),
   TMV("entry", 7), TMV("f", 77), TMV("f", 86), TMV("f", 114),
   TMV("f", 97), TMV("f", 80), TMV("f", 83), TMV("f'", 114), TMV("f'", 97),
   TMV("f1", 26), TMV("f1", 7), TMV("f2", 26), TMV("f2", 7),
   TMV("fn", 136), TMV("fn", 137), TMV("g", 77), TMV("g", 86),
   TMV("g", 80), TMV("g", 83), TMV("h", 138), TMV("h", 139),
   TMV("head", 26), TMV("head", 7), TMV("info", 21), TMV("m", 0),
   TMV("n", 0), TMV("name", 0), TMV("os", 3), TMV("proc", 3),
   TMV("read_elf32_symbol_table_tupled", 47),
   TMV("read_elf64_symbol_table_tupled", 38), TMV("record", 146),
   TMV("record", 153), TMV("rep", 154), TMV("rep", 155), TMV("size1", 0),
   TMV("st_info", 21), TMV("st_name", 24), TMV("st_other", 21),
   TMV("st_shndx", 19), TMV("st_size", 16), TMV("st_size", 24),
   TMV("st_value", 16), TMV("st_value", 24), TMV("str", 2),
   TMV("strtab", 71), TMV("syment", 26), TMV("syment", 7),
   TMV("symtab", 45), TMV("symtab", 33), TMV("symtype", 0),
   TMV("tail", 45), TMV("tail", 33), TMV("typ", 0), TMV("v", 36),
   TMV("v1", 35), TMV("visibility", 0), TMV("x", 36), TMV("x1", 35),
   TMC(19, 156), TMC(19, 158), TMC(19, 159), TMC(19, 161), TMC(19, 162),
   TMC(19, 164), TMC(19, 165), TMC(19, 166), TMC(19, 168), TMC(19, 170),
   TMC(19, 172), TMC(19, 174), TMC(19, 176), TMC(19, 178), TMC(19, 180),
   TMC(19, 182), TMC(19, 184), TMC(19, 185), TMC(19, 186), TMC(19, 188),
   TMC(19, 190), TMC(19, 192), TMC(19, 194), TMC(19, 196), TMC(19, 198),
   TMC(19, 200), TMC(19, 191), TMC(19, 193), TMC(19, 202), TMC(20, 204),
   TMC(21, 206), TMC(21, 208), TMC(21, 210), TMC(21, 212), TMC(21, 214),
   TMC(21, 216), TMC(21, 218), TMC(21, 220), TMC(21, 222), TMC(21, 224),
   TMC(21, 226), TMC(21, 228), TMC(21, 230), TMC(21, 232), TMC(21, 234),
   TMC(21, 236), TMC(21, 238), TMC(21, 241), TMC(21, 244), TMC(22, 246),
   TMC(23, 0), TMC(24, 247), TMC(25, 247), TMC(26, 249), TMC(26, 251),
   TMC(26, 253), TMC(26, 246), TMC(26, 148), TMC(26, 254), TMC(26, 255),
   TMC(26, 256), TMC(26, 257), TMC(26, 258), TMC(26, 260), TMC(26, 262),
   TMC(26, 264), TMC(26, 266), TMC(26, 268), TMC(26, 269), TMC(26, 270),
   TMC(26, 272), TMC(26, 274), TMC(26, 276), TMC(26, 278), TMC(26, 280),
   TMC(26, 247), TMC(26, 282), TMC(26, 283), TMC(26, 284), TMC(27, 246),
   TMC(28, 247), TMC(29, 159), TMC(29, 161), TMC(29, 162), TMC(29, 164),
   TMC(29, 165), TMC(29, 166), TMC(29, 286), TMC(29, 288), TMC(29, 290),
   TMC(29, 292), TMC(30, 294), TMC(31, 59), TMC(31, 58), TMC(31, 26),
   TMC(31, 7), TMC(32, 203), TMC(33, 203), TMC(34, 122), TMC(34, 129),
   TMC(35, 295), TMC(36, 298), TMC(36, 301), TMC(36, 304), TMC(37, 305),
   TMC(37, 307), TMC(37, 309), TMC(38, 313), TMC(38, 317), TMC(39, 245),
   TMC(40, 281), TMC(41, 89), TMC(42, 89), TMC(43, 296), TMC(43, 299),
   TMC(44, 319), TMC(45, 321), TMC(46, 322), TMC(46, 323), TMC(46, 324),
   TMC(46, 325), TMC(46, 327), TMC(46, 329), TMC(46, 331), TMC(46, 333),
   TMC(47, 336), TMC(48, 89), TMC(49, 2), TMC(49, 45), TMC(49, 33),
   TMC(50, 203), TMC(51, 338), TMC(51, 340), TMC(52, 341), TMC(52, 342),
   TMC(53, 341), TMC(53, 342), TMC(54, 341), TMC(54, 342), TMC(55, 341),
   TMC(55, 342), TMC(56, 343), TMC(56, 344), TMC(57, 348), TMC(57, 352),
   TMC(57, 355), TMC(57, 359), TMC(57, 362), TMC(57, 366), TMC(57, 369),
   TMC(57, 372), TMC(57, 375), TMC(58, 293), TMC(59, 378), TMC(59, 381),
   TMC(60, 0), TMC(61, 116), TMC(62, 108), TMC(63, 106), TMC(64, 105),
   TMC(65, 102), TMC(66, 101), TMC(67, 106), TMC(68, 105), TMC(69, 104),
   TMC(70, 103), TMC(71, 102), TMC(72, 101), TMC(73, 102), TMC(74, 101),
   TMC(75, 74), TMC(76, 7), TMC(77, 99), TMC(78, 91), TMC(79, 85),
   TMC(80, 84), TMC(81, 88), TMC(82, 87), TMC(83, 85), TMC(84, 84),
   TMC(85, 82), TMC(86, 81), TMC(87, 79), TMC(88, 78), TMC(89, 79),
   TMC(90, 78), TMC(91, 64), TMC(92, 385), TMC(92, 388), TMC(92, 391),
   TMC(92, 394), TMC(92, 397), TMC(92, 399), TMC(92, 402), TMC(92, 404),
   TMC(92, 407), TMC(92, 409), TMC(92, 411), TMC(92, 413), TMC(93, 417),
   TMC(94, 75), TMC(95, 74), TMC(96, 73), TMC(97, 64), TMC(98, 419),
   TMC(99, 63), TMC(99, 60), TMC(100, 60), TMC(101, 60), TMC(102, 59),
   TMC(103, 58), TMC(104, 57), TMC(105, 57), TMC(106, 56), TMC(107, 56),
   TMC(108, 420), TMC(109, 55), TMC(110, 54), TMC(111, 423), TMC(111, 426),
   TMC(112, 427), TMC(112, 428), TMC(112, 429), TMC(112, 54),
   TMC(113, 431), TMC(113, 433), TMC(113, 435), TMC(113, 437),
   TMC(113, 439), TMC(113, 441), TMC(113, 443), TMC(113, 445),
   TMC(114, 447), TMC(114, 449), TMC(115, 451), TMC(116, 453),
   TMC(117, 53), TMC(118, 51), TMC(119, 47), TMC(120, 451), TMC(121, 455),
   TMC(122, 453), TMC(123, 44), TMC(124, 42), TMC(125, 38), TMC(126, 451),
   TMC(127, 455), TMC(128, 457), TMC(129, 32), TMC(130, 25), TMC(131, 386),
   TMC(131, 389), TMC(131, 458), TMC(131, 459), TMC(131, 460),
   TMC(132, 468), TMC(133, 0), TMC(134, 0), TMC(135, 0), TMC(136, 0),
   TMC(137, 0), TMC(138, 0), TMC(139, 0), TMC(140, 0), TMC(141, 0),
   TMC(142, 6), TMC(143, 3), TMC(144, 0), TMC(145, 0), TMC(146, 0),
   TMC(147, 0), TMC(148, 0), TMC(149, 0), TMC(150, 0), TMC(151, 0),
   TMC(152, 0), TMC(153, 0), TMC(154, 0), TMC(155, 0), TMC(156, 0),
   TMC(157, 0), TMC(158, 0), TMC(159, 63), TMC(159, 469), TMC(159, 470),
   TMC(159, 471), TMC(159, 60), TMC(160, 325), TMC(161, 325),
   TMC(162, 472), TMC(163, 474), TMC(164, 245)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op stn_undef_def x = x
    val op stn_undef_def =
    DT(((("elf_symbol_table",0),[]),[]), [read"%244%433@%219@"])
  fun op stb_local_def x = x
    val op stb_local_def =
    DT(((("elf_symbol_table",1),[]),[]), [read"%244%429@%219@"])
  fun op stb_global_def x = x
    val op stb_global_def =
    DT(((("elf_symbol_table",2),[]),[]), [read"%244%426@%299%265%324@@@"])
  fun op stb_weak_def x = x
    val op stb_weak_def =
    DT(((("elf_symbol_table",3),[]),[]), [read"%244%432@%299%266%324@@@"])
  fun op stb_loos_def x = x
    val op stb_loos_def =
    DT(((("elf_symbol_table",4),[]),[]),
       [read"%244%430@%299%266%266%265%324@@@@@"])
  fun op stb_hios_def x = x
    val op stb_hios_def =
    DT(((("elf_symbol_table",5),[]),[]),
       [read"%244%427@%299%266%265%266%324@@@@@"])
  fun op stb_loproc_def x = x
    val op stb_loproc_def =
    DT(((("elf_symbol_table",6),[]),[]),
       [read"%244%431@%299%265%266%266%324@@@@@"])
  fun op stb_hiproc_def x = x
    val op stb_hiproc_def =
    DT(((("elf_symbol_table",7),[]),[]),
       [read"%244%428@%299%265%265%265%265%324@@@@@@"])
  fun op stt_notype_def x = x
    val op stt_notype_def =
    DT(((("elf_symbol_table",8),[]),[]), [read"%244%443@%219@"])
  fun op stt_object_def x = x
    val op stt_object_def =
    DT(((("elf_symbol_table",9),[]),[]), [read"%244%444@%299%265%324@@@"])
  fun op stt_func_def x = x
    val op stt_func_def =
    DT(((("elf_symbol_table",10),[]),[]), [read"%244%438@%299%266%324@@@"])
  fun op stt_section_def x = x
    val op stt_section_def =
    DT(((("elf_symbol_table",11),[]),[]),
       [read"%244%445@%299%265%265%324@@@@"])
  fun op stt_file_def x = x
    val op stt_file_def =
    DT(((("elf_symbol_table",12),[]),[]),
       [read"%244%437@%299%266%265%324@@@@"])
  fun op stt_common_def x = x
    val op stt_common_def =
    DT(((("elf_symbol_table",13),[]),[]),
       [read"%244%436@%299%265%266%324@@@@"])
  fun op stt_tls_def x = x
    val op stt_tls_def =
    DT(((("elf_symbol_table",14),[]),[]),
       [read"%244%446@%299%266%266%324@@@@"])
  fun op stt_loos_def x = x
    val op stt_loos_def =
    DT(((("elf_symbol_table",15),[]),[]),
       [read"%244%441@%299%266%266%265%324@@@@@"])
  fun op stt_hios_def x = x
    val op stt_hios_def =
    DT(((("elf_symbol_table",16),[]),[]),
       [read"%244%439@%299%266%265%266%324@@@@@"])
  fun op stt_loproc_def x = x
    val op stt_loproc_def =
    DT(((("elf_symbol_table",17),[]),[]),
       [read"%244%442@%299%265%266%266%324@@@@@"])
  fun op stt_hiproc_def x = x
    val op stt_hiproc_def =
    DT(((("elf_symbol_table",18),[]),[]),
       [read"%244%440@%299%265%265%265%265%324@@@@@@"])
  fun op string_of_symbol_type_def x = x
    val op string_of_symbol_type_def =
    DT(((("elf_symbol_table",19),[]),[]),
       [read"%194%134%189%137%189%138%243%434$2@$1@$0@@%272%244$2@%443@@%273%269%299%266%266%266%266%265%265%324@@@@@@@@@%273%269%299%265%265%265%265%266%265%324@@@@@@@@@%273%269%299%266%265%266%265%266%265%324@@@@@@@@@%273%269%299%265%266%265%266%266%265%324@@@@@@@@@%273%269%299%266%265%265%265%266%265%324@@@@@@@@@%273%269%299%265%266%266%265%265%265%324@@@@@@@@@%296@@@@@@@%272%244$2@%444@@%273%269%299%265%265%265%265%266%265%324@@@@@@@@@%273%269%299%266%266%265%265%265%265%324@@@@@@@@@%273%269%299%266%266%265%266%265%265%324@@@@@@@@@%273%269%299%265%266%266%265%265%265%324@@@@@@@@@%273%269%299%265%265%266%265%265%265%324@@@@@@@@@%273%269%299%266%265%266%265%266%265%324@@@@@@@@@%296@@@@@@@%272%244$2@%438@@%273%269%299%266%266%266%265%265%265%324@@@@@@@@@%273%269%299%265%266%266%265%266%265%324@@@@@@@@@%273%269%299%266%266%266%266%265%265%324@@@@@@@@@%273%269%299%265%265%266%265%265%265%324@@@@@@@@@%296@@@@@%272%244$2@%445@@%273%269%299%265%265%266%265%266%265%324@@@@@@@@@%273%269%299%265%266%266%265%265%265%324@@@@@@@@@%273%269%299%265%265%266%265%265%265%324@@@@@@@@@%273%269%299%266%265%266%265%266%265%324@@@@@@@@@%273%269%299%265%266%265%266%265%265%324@@@@@@@@@%273%269%299%265%265%265%265%266%265%324@@@@@@@@@%273%269%299%266%266%266%266%265%265%324@@@@@@@@@%296@@@@@@@@%272%244$2@%437@@%273%269%299%266%266%266%265%265%265%324@@@@@@@@@%273%269%299%265%266%265%266%265%265%324@@@@@@@@@%273%269%299%266%265%266%266%265%265%324@@@@@@@@@%273%269%299%265%266%266%265%265%265%324@@@@@@@@@%296@@@@@%272%244$2@%436@@%273%269%299%265%265%266%265%265%265%324@@@@@@@@@%273%269%299%265%265%265%265%266%265%324@@@@@@@@@%273%269%299%265%266%266%266%265%265%324@@@@@@@@@%273%269%299%265%266%266%266%265%265%324@@@@@@@@@%273%269%299%265%265%265%265%266%265%324@@@@@@@@@%273%269%299%266%266%266%266%265%265%324@@@@@@@@@%296@@@@@@@%272%244$2@%446@@%273%269%299%266%265%266%265%266%265%324@@@@@@@@@%273%269%299%266%265%266%266%265%265%324@@@@@@@@@%273%269%299%265%265%266%265%266%265%324@@@@@@@@@%296@@@@%272%218%249$2@%441@@%221$2@%439@@@$1$2@@%272%218%249$2@%442@@%221$2@%440@@@$0$2@@%273%269%299%265%266%265%266%265%265%324@@@@@@@@@%273%269%299%266%266%266%266%265%266%324@@@@@@@@@%273%269%299%266%266%266%265%266%266%324@@@@@@@@@%273%269%299%265%266%265%265%265%266%324@@@@@@@@@%273%269%299%266%265%266%266%265%266%324@@@@@@@@@%273%269%299%265%266%265%266%265%266%324@@@@@@@@@%273%269%299%266%265%266%265%265%266%324@@@@@@@@@%273%269%299%266%265%265%265%265%324@@@@@@@@%273%269%299%265%265%266%265%266%266%324@@@@@@@@@%273%269%299%265%266%265%266%266%266%324@@@@@@@@@%273%269%299%265%266%266%266%265%266%324@@@@@@@@@%273%269%299%266%266%265%265%265%266%324@@@@@@@@@%273%269%299%265%265%265%265%266%266%324@@@@@@@@@%273%269%299%266%265%266%266%265%266%324@@@@@@@@@%273%269%299%266%265%265%265%265%324@@@@@@@@%273%269%299%266%265%266%265%266%266%324@@@@@@@@@%273%269%299%265%266%265%266%266%266%324@@@@@@@@@%273%269%299%266%265%265%265%266%266%324@@@@@@@@@%273%269%299%265%266%266%265%265%266%324@@@@@@@@@%296@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@|@"])
  fun op stv_default_def x = x
    val op stv_default_def =
    DT(((("elf_symbol_table",20),[]),[]), [read"%244%447@%219@"])
  fun op stv_internal_def x = x
    val op stv_internal_def =
    DT(((("elf_symbol_table",21),[]),[]), [read"%244%449@%299%265%324@@@"])
  fun op stv_hidden_def x = x
    val op stv_hidden_def =
    DT(((("elf_symbol_table",22),[]),[]), [read"%244%448@%299%266%324@@@"])
  fun op stv_protected_def x = x
    val op stv_protected_def =
    DT(((("elf_symbol_table",23),[]),[]),
       [read"%244%450@%299%265%265%324@@@@"])
  fun op string_of_symbol_visibility_def x = x
    val op string_of_symbol_visibility_def =
    DT(((("elf_symbol_table",24),[]),[]),
       [read"%194%134%243%435$0@@%272%244$0@%447@@%273%269%299%266%265%266%265%265%265%324@@@@@@@@@%273%269%299%265%266%266%265%265%265%324@@@@@@@@@%273%269%299%266%266%266%265%265%265%324@@@@@@@@@%273%269%299%265%266%265%265%265%265%324@@@@@@@@@%273%269%299%265%266%266%265%266%265%324@@@@@@@@@%273%269%299%266%265%266%266%265%265%324@@@@@@@@@%273%269%299%266%265%266%265%266%265%324@@@@@@@@@%296@@@@@@@@%272%244$0@%449@@%273%269%299%265%266%265%266%265%265%324@@@@@@@@@%273%269%299%266%266%266%266%265%265%324@@@@@@@@@%273%269%299%266%265%266%265%266%265%324@@@@@@@@@%273%269%299%265%266%266%265%265%265%324@@@@@@@@@%273%269%299%266%266%265%265%266%265%324@@@@@@@@@%273%269%299%266%266%266%266%265%265%324@@@@@@@@@%273%269%299%265%266%265%265%265%265%324@@@@@@@@@%273%269%299%266%265%266%266%265%265%324@@@@@@@@@%296@@@@@@@@@%272%244$0@%448@@%273%269%299%266%265%265%266%265%265%324@@@@@@@@@%273%269%299%265%266%265%266%265%265%324@@@@@@@@@%273%269%299%266%265%266%265%265%265%324@@@@@@@@@%273%269%299%266%265%266%265%265%265%324@@@@@@@@@%273%269%299%265%266%266%265%265%265%324@@@@@@@@@%273%269%299%266%266%266%266%265%265%324@@@@@@@@@%296@@@@@@@%272%244$0@%450@@%273%269%299%266%265%265%265%266%265%324@@@@@@@@@%273%269%299%266%266%265%265%266%265%324@@@@@@@@@%273%269%299%265%265%265%265%266%265%324@@@@@@@@@%273%269%299%266%265%266%265%266%265%324@@@@@@@@@%273%269%299%265%266%266%265%265%265%324@@@@@@@@@%273%269%299%265%265%266%265%265%265%324@@@@@@@@@%273%269%299%266%265%266%265%266%265%324@@@@@@@@@%273%269%299%265%266%266%265%265%265%324@@@@@@@@@%273%269%299%266%265%266%265%265%265%324@@@@@@@@@%296@@@@@@@@@@%273%269%299%265%266%265%266%265%265%324@@@@@@@@@%273%269%299%266%266%266%266%265%266%324@@@@@@@@@%273%269%299%266%266%266%265%266%266%324@@@@@@@@@%273%269%299%265%266%265%265%265%266%324@@@@@@@@@%273%269%299%266%265%266%266%265%266%324@@@@@@@@@%273%269%299%265%266%265%266%265%266%324@@@@@@@@@%273%269%299%266%265%266%265%265%266%324@@@@@@@@@%273%269%299%266%265%265%265%265%324@@@@@@@@%273%269%299%265%265%266%265%266%266%324@@@@@@@@@%273%269%299%265%266%265%266%266%266%324@@@@@@@@@%273%269%299%265%266%266%266%265%266%324@@@@@@@@@%273%269%299%266%266%265%265%265%266%324@@@@@@@@@%273%269%299%265%265%265%265%266%266%324@@@@@@@@@%273%269%299%266%265%266%266%265%266%324@@@@@@@@@%273%269%299%266%265%265%265%265%324@@@@@@@@%273%269%299%266%266%266%265%266%266%324@@@@@@@@@%273%269%299%265%266%265%266%265%266%324@@@@@@@@@%273%269%299%265%265%266%265%266%266%324@@@@@@@@@%273%269%299%265%266%265%266%265%266%324@@@@@@@@@%273%269%299%266%266%265%265%265%266%324@@@@@@@@@%273%269%299%265%266%265%266%265%266%324@@@@@@@@@%273%269%299%266%265%266%266%265%266%324@@@@@@@@@%273%269%299%265%266%265%266%265%266%324@@@@@@@@@%273%269%299%266%265%266%265%266%266%324@@@@@@@@@%273%269%299%265%266%265%266%266%266%324@@@@@@@@@%296@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op elf32_symbol_table_entry_TY_DEF x = x
    val op elf32_symbol_table_entry_TY_DEF =
    DT(((("elf_symbol_table",25),[("bool",[26])]),["DISK_THM"]),
       [read"%257%143%310%13%190%0%248%195%13%248%251%11%251%15%251%19%253%24%253%28%252%32%246$6@%11%15%19%24%28%32%276%219@%200$5@%201$4@%202$3@%207$2@%205$1@$0@@@@@@%135%267|@||||||$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_symbol_table_entry_case_def x = x
    val op elf32_symbol_table_entry_case_def =
    DT(((("elf_symbol_table",29),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%11%172%15%172%19%174%24%174%28%173%32%182%113%222%325%417$6@$5@$4@$3@$2@$1@@$0@@$0$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_size_def x = x
    val op elf32_symbol_table_entry_size_def =
    DT(((("elf_symbol_table",30),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%11%172%15%172%19%174%24%174%28%173%32%244%339%417$5@$4@$3@$2@$1@$0@@@%299%265%324@@@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_name x = x
    val op elf32_symbol_table_entry_elf32_st_name =
    DT(((("elf_symbol_table",31),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%41%172%44%172%51%174%61%174%68%173%75%227%329%417$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_value x = x
    val op elf32_symbol_table_entry_elf32_st_value =
    DT(((("elf_symbol_table",32),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%41%172%44%172%51%174%61%174%68%173%75%227%337%417$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_size x = x
    val op elf32_symbol_table_entry_elf32_st_size =
    DT(((("elf_symbol_table",33),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%41%172%44%172%51%174%61%174%68%173%75%227%335%417$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_info x = x
    val op elf32_symbol_table_entry_elf32_st_info =
    DT(((("elf_symbol_table",34),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%41%172%44%172%51%174%61%174%68%173%75%229%327%417$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_other x = x
    val op elf32_symbol_table_entry_elf32_st_other =
    DT(((("elf_symbol_table",35),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%41%172%44%172%51%174%61%174%68%173%75%229%331%417$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_shndx x = x
    val op elf32_symbol_table_entry_elf32_st_shndx =
    DT(((("elf_symbol_table",36),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%41%172%44%172%51%174%61%174%68%173%75%228%333%417$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_name_fupd x = x
    val op elf32_symbol_table_entry_elf32_st_name_fupd =
    DT(((("elf_symbol_table",38),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%181%112%172%41%172%44%172%51%174%61%174%68%173%75%230%330$6@%417$5@$4@$3@$2@$1@$0@@@%417$6$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_value_fupd x = x
    val op elf32_symbol_table_entry_elf32_st_value_fupd =
    DT(((("elf_symbol_table",39),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%181%112%172%41%172%44%172%51%174%61%174%68%173%75%230%338$6@%417$5@$4@$3@$2@$1@$0@@@%417$5@$6$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_size_fupd x = x
    val op elf32_symbol_table_entry_elf32_st_size_fupd =
    DT(((("elf_symbol_table",40),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%181%112%172%41%172%44%172%51%174%61%174%68%173%75%230%336$6@%417$5@$4@$3@$2@$1@$0@@@%417$5@$4@$6$3@@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_info_fupd x = x
    val op elf32_symbol_table_entry_elf32_st_info_fupd =
    DT(((("elf_symbol_table",41),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%185%116%172%41%172%44%172%51%174%61%174%68%173%75%230%328$6@%417$5@$4@$3@$2@$1@$0@@@%417$5@$4@$3@$6$2@@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_other_fupd x = x
    val op elf32_symbol_table_entry_elf32_st_other_fupd =
    DT(((("elf_symbol_table",42),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%185%116%172%41%172%44%172%51%174%61%174%68%173%75%230%332$6@%417$5@$4@$3@$2@$1@$0@@@%417$5@$4@$3@$2@$6$1@@$0@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_elf32_st_shndx_fupd x = x
    val op elf32_symbol_table_entry_elf32_st_shndx_fupd =
    DT(((("elf_symbol_table",43),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%184%115%172%41%172%44%172%51%174%61%174%68%173%75%230%334$6@%417$5@$4@$3@$2@$1@$0@@@%417$5@$4@$3@$2@$1@$6$0@@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_compare_def x = x
    val op elf32_symbol_table_entry_compare_def =
    DT(((("elf_symbol_table",62),[]),[]),
       [read"%175%103%175%105%245%326$1@$0@@%424%368%220@%244@@%368%220@%244@@%368%220@%244@@%368%220@%244@@%368%220@%244@@%368%220@%244@@%217%453%329$1@@@%216%453%337$1@@@%215%453%335$1@@@%214%455%327$1@@@%213%455%331$1@@@%454%333$1@@@@@@@@%217%453%329$0@@@%216%453%337$0@@@%215%453%335$0@@@%214%455%327$0@@@%213%455%331$0@@@%454%333$0@@@@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict_def
    =
    DT(((("elf_symbol_table",63),[]),[]),
       [read"%223%378@%300%291%326@@%308%290%119%121%245%326$1@$0@@%295@||@@%306%290%119%121%284%326$1@$0@@%285%295@%285%280@%279@@@||@@%304%290%119%121%245%326$1@$0@@%281@||@@%302%290%119%121%284%326$1@$0@@%285%281@%285%280@%279@@@||@@%261@@@@@@"])
  fun op elf64_symbol_table_entry_TY_DEF x = x
    val op elf64_symbol_table_entry_TY_DEF =
    DT(((("elf_symbol_table",64),[("bool",[26])]),["DISK_THM"]),
       [read"%259%144%311%14%191%1%248%196%14%248%251%11%253%16%253%20%252%23%250%27%250%31%247$6@%11%16%20%23%27%31%277%219@%203$5@%208$4@%206$3@%204$2@%199$1@$0@@@@@@%135%268|@||||||$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_symbol_table_entry_case_def x = x
    val op elf64_symbol_table_entry_case_def =
    DT(((("elf_symbol_table",68),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%11%174%16%174%20%173%23%171%27%171%31%183%114%222%341%418$6@$5@$4@$3@$2@$1@@$0@@$0$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_size_def x = x
    val op elf64_symbol_table_entry_size_def =
    DT(((("elf_symbol_table",69),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%11%174%16%174%20%173%23%171%27%171%31%244%355%418$5@$4@$3@$2@$1@$0@@@%299%265%324@@@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_name x = x
    val op elf64_symbol_table_entry_elf64_st_name =
    DT(((("elf_symbol_table",70),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%41%174%45%174%53%173%60%171%66%171%73%227%345%418$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_info x = x
    val op elf64_symbol_table_entry_elf64_st_info =
    DT(((("elf_symbol_table",71),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%41%174%45%174%53%173%60%171%66%171%73%229%343%418$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_other x = x
    val op elf64_symbol_table_entry_elf64_st_other =
    DT(((("elf_symbol_table",72),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%41%174%45%174%53%173%60%171%66%171%73%229%347%418$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_shndx x = x
    val op elf64_symbol_table_entry_elf64_st_shndx =
    DT(((("elf_symbol_table",73),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%41%174%45%174%53%173%60%171%66%171%73%228%349%418$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_value x = x
    val op elf64_symbol_table_entry_elf64_st_value =
    DT(((("elf_symbol_table",74),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%41%174%45%174%53%173%60%171%66%171%73%226%353%418$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_size x = x
    val op elf64_symbol_table_entry_elf64_st_size =
    DT(((("elf_symbol_table",75),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%41%174%45%174%53%173%60%171%66%171%73%226%351%418$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_name_fupd x = x
    val op elf64_symbol_table_entry_elf64_st_name_fupd =
    DT(((("elf_symbol_table",77),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%181%112%172%41%174%45%174%53%173%60%171%66%171%73%231%346$6@%418$5@$4@$3@$2@$1@$0@@@%418$6$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_info_fupd x = x
    val op elf64_symbol_table_entry_elf64_st_info_fupd =
    DT(((("elf_symbol_table",78),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%185%116%172%41%174%45%174%53%173%60%171%66%171%73%231%344$6@%418$5@$4@$3@$2@$1@$0@@@%418$5@$6$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_other_fupd x = x
    val op elf64_symbol_table_entry_elf64_st_other_fupd =
    DT(((("elf_symbol_table",79),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%185%116%172%41%174%45%174%53%173%60%171%66%171%73%231%348$6@%418$5@$4@$3@$2@$1@$0@@@%418$5@$4@$6$3@@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_shndx_fupd x = x
    val op elf64_symbol_table_entry_elf64_st_shndx_fupd =
    DT(((("elf_symbol_table",80),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%184%115%172%41%174%45%174%53%173%60%171%66%171%73%231%350$6@%418$5@$4@$3@$2@$1@$0@@@%418$5@$4@$3@$6$2@@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_value_fupd x = x
    val op elf64_symbol_table_entry_elf64_st_value_fupd =
    DT(((("elf_symbol_table",81),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%180%111%172%41%174%45%174%53%173%60%171%66%171%73%231%354$6@%418$5@$4@$3@$2@$1@$0@@@%418$5@$4@$3@$2@$6$1@@$0@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_elf64_st_size_fupd x = x
    val op elf64_symbol_table_entry_elf64_st_size_fupd =
    DT(((("elf_symbol_table",82),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%180%111%172%41%174%45%174%53%173%60%171%66%171%73%231%352$6@%418$5@$4@$3@$2@$1@$0@@@%418$5@$4@$3@$2@$1@$6$0@@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_compare_def x = x
    val op elf64_symbol_table_entry_compare_def =
    DT(((("elf_symbol_table",101),[]),[]),
       [read"%176%104%176%106%245%342$1@$0@@%424%368%220@%244@@%368%220@%244@@%368%220@%244@@%368%220@%244@@%368%220@%244@@%368%220@%244@@%217%453%345$1@@@%216%452%353$1@@@%215%452%351$1@@@%214%455%343$1@@@%213%455%347$1@@@%454%349$1@@@@@@@@%217%453%345$0@@@%216%452%353$0@@@%215%452%351$0@@@%214%455%343$0@@@%213%455%347$0@@@%454%349$0@@@@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict_def
    =
    DT(((("elf_symbol_table",102),[]),[]),
       [read"%224%379@%301%293%342@@%309%292%120%122%245%342$1@$0@@%295@||@@%307%292%120%122%284%342$1@$0@@%285%295@%285%280@%279@@@||@@%305%292%120%122%245%342$1@$0@@%281@||@@%303%292%120%122%284%342$1@$0@@%285%281@%285%280@%279@@@||@@%262@@@@@@"])
  fun op get_symbol_binding_def x = x
    val op get_symbol_binding_def =
    DT(((("elf_symbol_table",103),[]),[]),
       [read"%170%107%244%374$0@@%451%459$0@%299%266%265%324@@@@@@|@"])
  fun op get_symbol_type_def x = x
    val op get_symbol_type_def =
    DT(((("elf_symbol_table",104),[]),[]),
       [read"%174%108%244%376$0@@%455%457$0@%392%299%265%265%265%265%324@@@@@@@@@|@"])
  fun op make_symbol_info_def x = x
    val op make_symbol_info_def =
    DT(((("elf_symbol_table",105),[]),[]),
       [read"%194%36%194%160%229%385$1@$0@@%456%458%392$1@@%299%266%265%324@@@@@%457%392$0@@%392%299%265%265%265%265%324@@@@@@@@@|@|@"])
  fun op get_symbol_visibility_def x = x
    val op get_symbol_visibility_def =
    DT(((("elf_symbol_table",106),[]),[]),
       [read"%174%133%244%377$0@@%455%457$0@%392%299%265%265%324@@@@@@@|@"])
  fun op make_symbol_other_def x = x
    val op make_symbol_other_def =
    DT(((("elf_symbol_table",107),[]),[]),
       [read"%194%166%229%386$0@@%392$0@@|@"])
  fun op is_elf32_shndx_too_large_def x = x
    val op is_elf32_shndx_too_large_def =
    DT(((("elf_symbol_table",108),[]),[]),
       [read"%175%156%225%381$0@@%244%454%333$0@@@%425@@|@"])
  fun op is_elf64_shndx_too_large_def x = x
    val op is_elf64_shndx_too_large_def =
    DT(((("elf_symbol_table",109),[]),[]),
       [read"%176%157%225%383$0@@%244%454%349$0@@@%425@@|@"])
  fun op is_elf32_null_entry_def x = x
    val op is_elf32_null_entry_def =
    DT(((("elf_symbol_table",110),[]),[]),
       [read"%175%101%225%380$0@@%218%244%453%329$0@@@%219@@%218%244%453%337$0@@@%219@@%218%244%453%335$0@@@%219@@%218%244%455%327$0@@@%219@@%218%244%455%331$0@@@%219@@%244%454%333$0@@@%219@@@@@@@|@"])
  fun op is_elf64_null_entry_def x = x
    val op is_elf64_null_entry_def =
    DT(((("elf_symbol_table",111),[]),[]),
       [read"%176%102%225%382$0@@%218%244%453%345$0@@@%219@@%218%244%452%353$0@@@%219@@%218%244%452%351$0@@@%219@@%218%244%455%343$0@@@%219@@%218%244%455%347$0@@@%219@@%244%454%349$0@@@%219@@@@@@@|@"])
  fun op elf64_null_symbol_table_entry_def x = x
    val op elf64_null_symbol_table_entry_def =
    DT(((("elf_symbol_table",112),[]),[]),
       [read"%231%340@%346%287%390%219@@@%344%289%392%219@@@%348%289%392%219@@@%350%288%391%219@@@%354%286%389%219@@@%352%286%389%219@@@%264@@@@@@@"])
  fun op read_elf32_symbol_table_entry_def x = x
    val op read_elf32_symbol_table_entry_def =
    DT(((("elf_symbol_table",113),[]),[]),
       [read"%177%100%169%38%235%406$1@$0@@%360%408$1@$0@@%313%147%38%360%403$3@$0@@%313%153%38%360%408$5@$0@@%313%151%38%364%416$7@$0@@%317%146%38%364%416$9@$0@@%317%148%38%362%404$11@$0@@%315%149%38%421%209%330%287$11@@%338%287$9@@%336%287$7@@%328%289$5@@%332%289$3@@%334%288$1@@%263@@@@@@@$0@@||@@||@@||@@||@@||@@||@@@|@|@"])
  fun op read_elf64_symbol_table_entry_def x = x
    val op read_elf64_symbol_table_entry_def =
    DT(((("elf_symbol_table",114),[]),[]),
       [read"%177%100%169%38%236%412$1@$0@@%361%414$1@$0@@%314%147%38%365%416$3@$0@@%318%146%38%365%416$5@$0@@%318%148%38%363%410$7@$0@@%316%149%38%359%409$9@$0@@%312%152%38%359%415$11@$0@@%312%150%38%422%210%346%287$11@@%344%289$9@@%348%289$7@@%350%288$5@@%354%286$3@@%352%286$1@@%264@@@@@@@$0@@||@@||@@||@@||@@||@@||@@@|@|@"])
  fun op read_elf32_symbol_table_tupled_primitive_def x = x
    val op read_elf32_symbol_table_tupled_primitive_def =
    DT(((("elf_symbol_table",115),[]),[]),
       [read"%241%407@%322%260%9%218%321$0@@%177%100%169%38%169%39%248%460%244%384$1@@%219@@@$3%211$2@$0@@%211$2@$1@@@|@|@|@@|@@%139%10%401$0@%100%38%282%270%244%384$0@@%219@@%419%297@@%366%406$1@$0@@%319%131%38%357$5%211$3@$0@@@%161%419%274$2@$0@@|@||@@@@||@||@@"])
  fun op read_elf32_symbol_table_curried_def x = x
    val op read_elf32_symbol_table_curried_def =
    DT(((("elf_symbol_table",116),[]),[]),
       [read"%177%167%169%168%232%405$1@$0@@%407%211$1@$0@@@|@|@"])
  fun op read_elf64_symbol_table_tupled_primitive_def x = x
    val op read_elf64_symbol_table_tupled_primitive_def =
    DT(((("elf_symbol_table",119),[]),[]),
       [read"%242%413@%323%260%9%218%321$0@@%177%100%169%38%169%39%248%460%244%384$1@@%219@@@$3%211$2@$0@@%211$2@$1@@@|@|@|@@|@@%140%10%402$0@%100%38%283%271%244%384$0@@%219@@%420%298@@%367%412$1@$0@@%320%132%38%358$5%211$3@$0@@@%162%420%275$2@$0@@|@||@@@@||@||@@"])
  fun op read_elf64_symbol_table_curried_def x = x
    val op read_elf64_symbol_table_curried_def =
    DT(((("elf_symbol_table",120),[]),[]),
       [read"%177%167%169%168%233%411$1@$0@@%413%211$1@$0@@@|@|@"])
  fun op get_elf32_symbol_image_address_def x = x
    val op get_elf32_symbol_image_address_def =
    DT(((("elf_symbol_table",123),[]),[]),
       [read"%192%158%197%155%234%369$1@$0@@%387%109%294%136%294%35%294%145%294%163%294%37%356%373$4@$6@@%154%423%212$0@%215$2@%214$3@%213$4@$1@@@@@|@|@%375%327$4@@@|@%376%327$3@@@|@%198%453%335$2@@@%299%266%265%265%324@@@@@@|@%453%337$1@@@|@%453%329$0@@@|@$1@@|@|@"])
  fun op get_elf64_symbol_image_address_def x = x
    val op get_elf64_symbol_image_address_def =
    DT(((("elf_symbol_table",124),[]),[]),
       [read"%193%159%197%155%234%371$1@$0@@%388%110%294%136%294%35%294%145%294%163%294%37%356%373$4@$6@@%154%423%212$0@%215$2@%214$3@%213$4@$1@@@@@|@|@%375%343$4@@@|@%376%343$3@@@|@%452%351$2@@@|@%452%353$1@@@|@%453%345$0@@@|@$1@@|@|@"])
  fun op get_elf32_symbol_type_def x = x
    val op get_elf32_symbol_type_def =
    DT(((("elf_symbol_table",125),[]),[]),
       [read"%175%156%244%370$0@@%376%327$0@@@|@"])
  fun op get_elf64_symbol_type_def x = x
    val op get_elf64_symbol_type_def =
    DT(((("elf_symbol_table",126),[]),[]),
       [read"%176%157%244%372$0@@%376%343$0@@@|@"])
  fun op elf32_symbol_table_entry_accessors x = x
    val op elf32_symbol_table_entry_accessors =
    DT(((("elf_symbol_table",37),
        [("elf_symbol_table",[31,32,33,34,35,36])]),["DISK_THM"]),
       [read"%218%172%41%172%44%172%51%174%61%174%68%173%75%227%329%417$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@@%218%172%41%172%44%172%51%174%61%174%68%173%75%227%337%417$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@@%218%172%41%172%44%172%51%174%61%174%68%173%75%227%335%417$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@@%218%172%41%172%44%172%51%174%61%174%68%173%75%229%327%417$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@@%218%172%41%172%44%172%51%174%61%174%68%173%75%229%331%417$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@@%172%41%172%44%172%51%174%61%174%68%173%75%228%333%417$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@@@@@@"])
  fun op elf32_symbol_table_entry_fn_updates x = x
    val op elf32_symbol_table_entry_fn_updates =
    DT(((("elf_symbol_table",44),
        [("elf_symbol_table",[38,39,40,41,42,43])]),["DISK_THM"]),
       [read"%218%181%112%172%41%172%44%172%51%174%61%174%68%173%75%230%330$6@%417$5@$4@$3@$2@$1@$0@@@%417$6$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@@%218%181%112%172%41%172%44%172%51%174%61%174%68%173%75%230%338$6@%417$5@$4@$3@$2@$1@$0@@@%417$5@$6$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@@%218%181%112%172%41%172%44%172%51%174%61%174%68%173%75%230%336$6@%417$5@$4@$3@$2@$1@$0@@@%417$5@$4@$6$3@@$2@$1@$0@@|@|@|@|@|@|@|@@%218%185%116%172%41%172%44%172%51%174%61%174%68%173%75%230%328$6@%417$5@$4@$3@$2@$1@$0@@@%417$5@$4@$3@$6$2@@$1@$0@@|@|@|@|@|@|@|@@%218%185%116%172%41%172%44%172%51%174%61%174%68%173%75%230%332$6@%417$5@$4@$3@$2@$1@$0@@@%417$5@$4@$3@$2@$6$1@@$0@@|@|@|@|@|@|@|@@%184%115%172%41%172%44%172%51%174%61%174%68%173%75%230%334$6@%417$5@$4@$3@$2@$1@$0@@@%417$5@$4@$3@$2@$1@$6$0@@@|@|@|@|@|@|@|@@@@@@"])
  fun op elf32_symbol_table_entry_accfupds x = x
    val op elf32_symbol_table_entry_accfupds =
    DT(((("elf_symbol_table",45),
        [("bool",[25,26,56,181]),
         ("elf_symbol_table",[26,27,28,37,44])]),["DISK_THM"]),
       [read"%218%181%112%175%78%227%329%338$1@$0@@@%329$0@@|@|@@%218%181%112%175%78%227%329%336$1@$0@@@%329$0@@|@|@@%218%185%116%175%78%227%329%328$1@$0@@@%329$0@@|@|@@%218%185%116%175%78%227%329%332$1@$0@@@%329$0@@|@|@@%218%184%115%175%78%227%329%334$1@$0@@@%329$0@@|@|@@%218%181%112%175%78%227%337%330$1@$0@@@%337$0@@|@|@@%218%181%112%175%78%227%337%336$1@$0@@@%337$0@@|@|@@%218%185%116%175%78%227%337%328$1@$0@@@%337$0@@|@|@@%218%185%116%175%78%227%337%332$1@$0@@@%337$0@@|@|@@%218%184%115%175%78%227%337%334$1@$0@@@%337$0@@|@|@@%218%181%112%175%78%227%335%330$1@$0@@@%335$0@@|@|@@%218%181%112%175%78%227%335%338$1@$0@@@%335$0@@|@|@@%218%185%116%175%78%227%335%328$1@$0@@@%335$0@@|@|@@%218%185%116%175%78%227%335%332$1@$0@@@%335$0@@|@|@@%218%184%115%175%78%227%335%334$1@$0@@@%335$0@@|@|@@%218%181%112%175%78%229%327%330$1@$0@@@%327$0@@|@|@@%218%181%112%175%78%229%327%338$1@$0@@@%327$0@@|@|@@%218%181%112%175%78%229%327%336$1@$0@@@%327$0@@|@|@@%218%185%116%175%78%229%327%332$1@$0@@@%327$0@@|@|@@%218%184%115%175%78%229%327%334$1@$0@@@%327$0@@|@|@@%218%181%112%175%78%229%331%330$1@$0@@@%331$0@@|@|@@%218%181%112%175%78%229%331%338$1@$0@@@%331$0@@|@|@@%218%181%112%175%78%229%331%336$1@$0@@@%331$0@@|@|@@%218%185%116%175%78%229%331%328$1@$0@@@%331$0@@|@|@@%218%184%115%175%78%229%331%334$1@$0@@@%331$0@@|@|@@%218%181%112%175%78%228%333%330$1@$0@@@%333$0@@|@|@@%218%181%112%175%78%228%333%338$1@$0@@@%333$0@@|@|@@%218%181%112%175%78%228%333%336$1@$0@@@%333$0@@|@|@@%218%185%116%175%78%228%333%328$1@$0@@@%333$0@@|@|@@%218%185%116%175%78%228%333%332$1@$0@@@%333$0@@|@|@@%218%181%112%175%78%227%329%330$1@$0@@@$1%329$0@@@|@|@@%218%181%112%175%78%227%337%338$1@$0@@@$1%337$0@@@|@|@@%218%181%112%175%78%227%335%336$1@$0@@@$1%335$0@@@|@|@@%218%185%116%175%78%229%327%328$1@$0@@@$1%327$0@@@|@|@@%218%185%116%175%78%229%331%332$1@$0@@@$1%331$0@@@|@|@@%184%115%175%78%228%333%334$1@$0@@@$1%333$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_symbol_table_entry_fupdfupds x = x
    val op elf32_symbol_table_entry_fupdfupds =
    DT(((("elf_symbol_table",46),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_symbol_table",[26,27,28,44])]),["DISK_THM"]),
       [read"%218%181%126%181%112%175%78%230%330$1@%330$2@$0@@@%330%394$1@$2@@$0@@|@|@|@@%218%181%126%181%112%175%78%230%338$1@%338$2@$0@@@%338%394$1@$2@@$0@@|@|@|@@%218%181%126%181%112%175%78%230%336$1@%336$2@$0@@@%336%394$1@$2@@$0@@|@|@|@@%218%185%128%185%116%175%78%230%328$1@%328$2@$0@@@%328%396$1@$2@@$0@@|@|@|@@%218%185%128%185%116%175%78%230%332$1@%332$2@$0@@@%332%396$1@$2@@$0@@|@|@|@@%184%127%184%115%175%78%230%334$1@%334$2@$0@@@%334%395$1@$2@@$0@@|@|@|@@@@@@"])
  fun op elf32_symbol_table_entry_fupdfupds_comp x = x
    val op elf32_symbol_table_entry_fupdfupds_comp =
    DT(((("elf_symbol_table",47),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_symbol_table",[26,27,28,44])]),["DISK_THM"]),
       [read"%218%218%181%126%181%112%239%398%330$0@@%330$1@@@%330%394$0@$1@@@|@|@@%178%129%181%126%181%112%237%397%330$0@@%397%330$1@@$2@@@%397%330%394$0@$1@@@$2@@|@|@|@@@%218%218%181%126%181%112%239%398%338$0@@%338$1@@@%338%394$0@$1@@@|@|@@%178%129%181%126%181%112%237%397%338$0@@%397%338$1@@$2@@@%397%338%394$0@$1@@@$2@@|@|@|@@@%218%218%181%126%181%112%239%398%336$0@@%336$1@@@%336%394$0@$1@@@|@|@@%178%129%181%126%181%112%237%397%336$0@@%397%336$1@@$2@@@%397%336%394$0@$1@@@$2@@|@|@|@@@%218%218%185%128%185%116%239%398%328$0@@%328$1@@@%328%396$0@$1@@@|@|@@%178%129%185%128%185%116%237%397%328$0@@%397%328$1@@$2@@@%397%328%396$0@$1@@@$2@@|@|@|@@@%218%218%185%128%185%116%239%398%332$0@@%332$1@@@%332%396$0@$1@@@|@|@@%178%129%185%128%185%116%237%397%332$0@@%397%332$1@@$2@@@%397%332%396$0@$1@@@$2@@|@|@|@@@%218%184%127%184%115%239%398%334$0@@%334$1@@@%334%395$0@$1@@@|@|@@%178%129%184%127%184%115%237%397%334$0@@%397%334$1@@$2@@@%397%334%395$0@$1@@@$2@@|@|@|@@@@@@@"])
  fun op elf32_symbol_table_entry_fupdcanon x = x
    val op elf32_symbol_table_entry_fupdcanon =
    DT(((("elf_symbol_table",48),
        [("bool",[25,26,56,181]),
         ("elf_symbol_table",[26,27,28,44])]),["DISK_THM"]),
       [read"%218%181%126%181%112%175%78%230%338$1@%330$2@$0@@@%330$2@%338$1@$0@@@|@|@|@@%218%181%126%181%112%175%78%230%336$1@%330$2@$0@@@%330$2@%336$1@$0@@@|@|@|@@%218%181%126%181%112%175%78%230%336$1@%338$2@$0@@@%338$2@%336$1@$0@@@|@|@|@@%218%181%126%185%116%175%78%230%328$1@%330$2@$0@@@%330$2@%328$1@$0@@@|@|@|@@%218%181%126%185%116%175%78%230%328$1@%338$2@$0@@@%338$2@%328$1@$0@@@|@|@|@@%218%181%126%185%116%175%78%230%328$1@%336$2@$0@@@%336$2@%328$1@$0@@@|@|@|@@%218%181%126%185%116%175%78%230%332$1@%330$2@$0@@@%330$2@%332$1@$0@@@|@|@|@@%218%181%126%185%116%175%78%230%332$1@%338$2@$0@@@%338$2@%332$1@$0@@@|@|@|@@%218%181%126%185%116%175%78%230%332$1@%336$2@$0@@@%336$2@%332$1@$0@@@|@|@|@@%218%185%128%185%116%175%78%230%332$1@%328$2@$0@@@%328$2@%332$1@$0@@@|@|@|@@%218%181%126%184%115%175%78%230%334$1@%330$2@$0@@@%330$2@%334$1@$0@@@|@|@|@@%218%181%126%184%115%175%78%230%334$1@%338$2@$0@@@%338$2@%334$1@$0@@@|@|@|@@%218%181%126%184%115%175%78%230%334$1@%336$2@$0@@@%336$2@%334$1@$0@@@|@|@|@@%218%185%128%184%115%175%78%230%334$1@%328$2@$0@@@%328$2@%334$1@$0@@@|@|@|@@%185%128%184%115%175%78%230%334$1@%332$2@$0@@@%332$2@%334$1@$0@@@|@|@|@@@@@@@@@@@@@@@"])
  fun op elf32_symbol_table_entry_fupdcanon_comp x = x
    val op elf32_symbol_table_entry_fupdcanon_comp =
    DT(((("elf_symbol_table",49),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_symbol_table",[26,27,28,44])]),["DISK_THM"]),
       [read"%218%218%181%126%181%112%239%398%338$0@@%330$1@@@%398%330$1@@%338$0@@@|@|@@%178%129%181%126%181%112%237%397%338$0@@%397%330$1@@$2@@@%397%330$1@@%397%338$0@@$2@@@|@|@|@@@%218%218%181%126%181%112%239%398%336$0@@%330$1@@@%398%330$1@@%336$0@@@|@|@@%178%129%181%126%181%112%237%397%336$0@@%397%330$1@@$2@@@%397%330$1@@%397%336$0@@$2@@@|@|@|@@@%218%218%181%126%181%112%239%398%336$0@@%338$1@@@%398%338$1@@%336$0@@@|@|@@%178%129%181%126%181%112%237%397%336$0@@%397%338$1@@$2@@@%397%338$1@@%397%336$0@@$2@@@|@|@|@@@%218%218%181%126%185%116%239%398%328$0@@%330$1@@@%398%330$1@@%328$0@@@|@|@@%178%129%181%126%185%116%237%397%328$0@@%397%330$1@@$2@@@%397%330$1@@%397%328$0@@$2@@@|@|@|@@@%218%218%181%126%185%116%239%398%328$0@@%338$1@@@%398%338$1@@%328$0@@@|@|@@%178%129%181%126%185%116%237%397%328$0@@%397%338$1@@$2@@@%397%338$1@@%397%328$0@@$2@@@|@|@|@@@%218%218%181%126%185%116%239%398%328$0@@%336$1@@@%398%336$1@@%328$0@@@|@|@@%178%129%181%126%185%116%237%397%328$0@@%397%336$1@@$2@@@%397%336$1@@%397%328$0@@$2@@@|@|@|@@@%218%218%181%126%185%116%239%398%332$0@@%330$1@@@%398%330$1@@%332$0@@@|@|@@%178%129%181%126%185%116%237%397%332$0@@%397%330$1@@$2@@@%397%330$1@@%397%332$0@@$2@@@|@|@|@@@%218%218%181%126%185%116%239%398%332$0@@%338$1@@@%398%338$1@@%332$0@@@|@|@@%178%129%181%126%185%116%237%397%332$0@@%397%338$1@@$2@@@%397%338$1@@%397%332$0@@$2@@@|@|@|@@@%218%218%181%126%185%116%239%398%332$0@@%336$1@@@%398%336$1@@%332$0@@@|@|@@%178%129%181%126%185%116%237%397%332$0@@%397%336$1@@$2@@@%397%336$1@@%397%332$0@@$2@@@|@|@|@@@%218%218%185%128%185%116%239%398%332$0@@%328$1@@@%398%328$1@@%332$0@@@|@|@@%178%129%185%128%185%116%237%397%332$0@@%397%328$1@@$2@@@%397%328$1@@%397%332$0@@$2@@@|@|@|@@@%218%218%181%126%184%115%239%398%334$0@@%330$1@@@%398%330$1@@%334$0@@@|@|@@%178%129%181%126%184%115%237%397%334$0@@%397%330$1@@$2@@@%397%330$1@@%397%334$0@@$2@@@|@|@|@@@%218%218%181%126%184%115%239%398%334$0@@%338$1@@@%398%338$1@@%334$0@@@|@|@@%178%129%181%126%184%115%237%397%334$0@@%397%338$1@@$2@@@%397%338$1@@%397%334$0@@$2@@@|@|@|@@@%218%218%181%126%184%115%239%398%334$0@@%336$1@@@%398%336$1@@%334$0@@@|@|@@%178%129%181%126%184%115%237%397%334$0@@%397%336$1@@$2@@@%397%336$1@@%397%334$0@@$2@@@|@|@|@@@%218%218%185%128%184%115%239%398%334$0@@%328$1@@@%398%328$1@@%334$0@@@|@|@@%178%129%185%128%184%115%237%397%334$0@@%397%328$1@@$2@@@%397%328$1@@%397%334$0@@$2@@@|@|@|@@@%218%185%128%184%115%239%398%334$0@@%332$1@@@%398%332$1@@%334$0@@@|@|@@%178%129%185%128%184%115%237%397%334$0@@%397%332$1@@$2@@@%397%332$1@@%397%334$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@"])
  fun op elf32_symbol_table_entry_component_equality x = x
    val op elf32_symbol_table_entry_component_equality =
    DT(((("elf_symbol_table",50),
        [("bool",[25,26,51,56,63,181]),("elf_symbol_table",[26,27,28,37]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%175%80%175%82%225%230$1@$0@@%218%227%329$1@@%329$0@@@%218%227%337$1@@%337$0@@@%218%227%335$1@@%335$0@@@%218%229%327$1@@%327$0@@@%218%229%331$1@@%331$0@@@%228%333$1@@%333$0@@@@@@@@|@|@"])
  fun op elf32_symbol_table_entry_updates_eq_literal x = x
    val op elf32_symbol_table_entry_updates_eq_literal =
    DT(((("elf_symbol_table",51),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_symbol_table",[26,27,28,44])]),["DISK_THM"]),
       [read"%175%78%172%74%172%67%172%59%174%53%174%45%173%42%230%330%287$5@@%338%287$4@@%336%287$3@@%328%289$2@@%332%289$1@@%334%288$0@@$6@@@@@@@%330%287$5@@%338%287$4@@%336%287$3@@%328%289$2@@%332%289$1@@%334%288$0@@%263@@@@@@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_literal_nchotomy x = x
    val op elf32_symbol_table_entry_literal_nchotomy =
    DT(((("elf_symbol_table",52),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_symbol_table",[26,27,28,44]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%175%78%251%74%251%67%251%59%253%53%253%45%252%42%230$6@%330%287$5@@%338%287$4@@%336%287$3@@%328%289$2@@%332%289$1@@%334%288$0@@%263@@@@@@@|@|@|@|@|@|@|@"])
  fun op FORALL_elf32_symbol_table_entry x = x
    val op FORALL_elf32_symbol_table_entry =
    DT(((("elf_symbol_table",53),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_symbol_table",[26,27,28,44]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%186%6%225%175%78$1$0@|@@%172%74%172%67%172%59%174%53%174%45%173%42$6%330%287$5@@%338%287$4@@%336%287$3@@%328%289$2@@%332%289$1@@%334%288$0@@%263@@@@@@@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf32_symbol_table_entry x = x
    val op EXISTS_elf32_symbol_table_entry =
    DT(((("elf_symbol_table",54),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_symbol_table",[26,27,28,44]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%186%6%225%254%78$1$0@|@@%251%74%251%67%251%59%253%53%253%45%252%42$6%330%287$5@@%338%287$4@@%336%287$3@@%328%289$2@@%332%289$1@@%334%288$0@@%263@@@@@@@|@|@|@|@|@|@@|@"])
  fun op elf32_symbol_table_entry_literal_11 x = x
    val op elf32_symbol_table_entry_literal_11 =
    DT(((("elf_symbol_table",55),
        [("combin",[12]),("elf_symbol_table",[45,50])]),["DISK_THM"]),
       [read"%172%76%172%69%172%62%174%55%174%47%173%52%172%77%172%71%172%64%174%57%174%49%173%60%225%230%330%287$11@@%338%287$10@@%336%287$9@@%328%289$8@@%332%289$7@@%334%288$6@@%263@@@@@@@%330%287$5@@%338%287$4@@%336%287$3@@%328%289$2@@%332%289$1@@%334%288$0@@%263@@@@@@@@%218%227$11@$5@@%218%227$10@$4@@%218%227$9@$3@@%218%229$8@$2@@%218%229$7@$1@@%228$6@$0@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf32_symbol_table_entry x = x
    val op datatype_elf32_symbol_table_entry =
    DT(((("elf_symbol_table",56),[("bool",[25,171])]),["DISK_THM"]),
       [read"%278%141%92@%87@%91@%90@%86@%88@%89@@"])
  fun op elf32_symbol_table_entry_11 x = x
    val op elf32_symbol_table_entry_11 =
    DT(((("elf_symbol_table",57),
        [("bool",[26,51,56,63,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%11%172%15%172%19%174%24%174%28%173%32%172%12%172%17%172%21%174%26%174%30%173%34%225%230%417$11@$10@$9@$8@$7@$6@@%417$5@$4@$3@$2@$1@$0@@@%218%227$11@$5@@%218%227$10@$4@@%218%227$9@$3@@%218%229$8@$2@@%218%229$7@$1@@%228$6@$0@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_case_cong x = x
    val op elf32_symbol_table_entry_case_cong =
    DT(((("elf_symbol_table",58),
        [("bool",[26,181]),
         ("elf_symbol_table",[26,27,28,29])]),["DISK_THM"]),
       [read"%175%2%175%4%182%113%248%218%230$2@$1@@%172%11%172%15%172%19%174%24%174%28%173%32%248%230$7@%417$5@$4@$3@$2@$1@$0@@@%222$6$5@$4@$3@$2@$1@$0@@%117$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@@@%222%325$2@$0@@%325$1@%117@@@|@|@|@"])
  fun op elf32_symbol_table_entry_nchotomy x = x
    val op elf32_symbol_table_entry_nchotomy =
    DT(((("elf_symbol_table",59),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28])]),["DISK_THM"]),
       [read"%175%84%251%41%251%44%251%51%253%61%253%68%252%75%230$6@%417$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_Axiom x = x
    val op elf32_symbol_table_entry_Axiom =
    DT(((("elf_symbol_table",60),
        [("bool",[26,181]),("elf_symbol_table",[26,27,28]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%182%113%256%123%172%11%172%15%172%19%174%24%174%28%173%32%222$6%417$5@$4@$3@$2@$1@$0@@@$7$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@"])
  fun op elf32_symbol_table_entry_induction x = x
    val op elf32_symbol_table_entry_induction =
    DT(((("elf_symbol_table",61),
        [("bool",[26]),("elf_symbol_table",[26,27,28])]),["DISK_THM"]),
       [read"%186%6%248%172%41%172%44%172%51%174%61%174%68%173%75$6%417$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@@%175%78$1$0@|@@|@"])
  fun op elf64_symbol_table_entry_accessors x = x
    val op elf64_symbol_table_entry_accessors =
    DT(((("elf_symbol_table",76),
        [("elf_symbol_table",[70,71,72,73,74,75])]),["DISK_THM"]),
       [read"%218%172%41%174%45%174%53%173%60%171%66%171%73%227%345%418$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@@%218%172%41%174%45%174%53%173%60%171%66%171%73%229%343%418$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@@%218%172%41%174%45%174%53%173%60%171%66%171%73%229%347%418$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@@%218%172%41%174%45%174%53%173%60%171%66%171%73%228%349%418$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@@%218%172%41%174%45%174%53%173%60%171%66%171%73%226%353%418$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@@%172%41%174%45%174%53%173%60%171%66%171%73%226%351%418$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@@@@@@"])
  fun op elf64_symbol_table_entry_fn_updates x = x
    val op elf64_symbol_table_entry_fn_updates =
    DT(((("elf_symbol_table",83),
        [("elf_symbol_table",[77,78,79,80,81,82])]),["DISK_THM"]),
       [read"%218%181%112%172%41%174%45%174%53%173%60%171%66%171%73%231%346$6@%418$5@$4@$3@$2@$1@$0@@@%418$6$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@@%218%185%116%172%41%174%45%174%53%173%60%171%66%171%73%231%344$6@%418$5@$4@$3@$2@$1@$0@@@%418$5@$6$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@@%218%185%116%172%41%174%45%174%53%173%60%171%66%171%73%231%348$6@%418$5@$4@$3@$2@$1@$0@@@%418$5@$4@$6$3@@$2@$1@$0@@|@|@|@|@|@|@|@@%218%184%115%172%41%174%45%174%53%173%60%171%66%171%73%231%350$6@%418$5@$4@$3@$2@$1@$0@@@%418$5@$4@$3@$6$2@@$1@$0@@|@|@|@|@|@|@|@@%218%180%111%172%41%174%45%174%53%173%60%171%66%171%73%231%354$6@%418$5@$4@$3@$2@$1@$0@@@%418$5@$4@$3@$2@$6$1@@$0@@|@|@|@|@|@|@|@@%180%111%172%41%174%45%174%53%173%60%171%66%171%73%231%352$6@%418$5@$4@$3@$2@$1@$0@@@%418$5@$4@$3@$2@$1@$6$0@@@|@|@|@|@|@|@|@@@@@@"])
  fun op elf64_symbol_table_entry_accfupds x = x
    val op elf64_symbol_table_entry_accfupds =
    DT(((("elf_symbol_table",84),
        [("bool",[25,26,56,181]),
         ("elf_symbol_table",[65,66,67,76,83])]),["DISK_THM"]),
       [read"%218%185%116%176%79%227%345%344$1@$0@@@%345$0@@|@|@@%218%185%116%176%79%227%345%348$1@$0@@@%345$0@@|@|@@%218%184%115%176%79%227%345%350$1@$0@@@%345$0@@|@|@@%218%180%111%176%79%227%345%354$1@$0@@@%345$0@@|@|@@%218%180%111%176%79%227%345%352$1@$0@@@%345$0@@|@|@@%218%181%112%176%79%229%343%346$1@$0@@@%343$0@@|@|@@%218%185%116%176%79%229%343%348$1@$0@@@%343$0@@|@|@@%218%184%115%176%79%229%343%350$1@$0@@@%343$0@@|@|@@%218%180%111%176%79%229%343%354$1@$0@@@%343$0@@|@|@@%218%180%111%176%79%229%343%352$1@$0@@@%343$0@@|@|@@%218%181%112%176%79%229%347%346$1@$0@@@%347$0@@|@|@@%218%185%116%176%79%229%347%344$1@$0@@@%347$0@@|@|@@%218%184%115%176%79%229%347%350$1@$0@@@%347$0@@|@|@@%218%180%111%176%79%229%347%354$1@$0@@@%347$0@@|@|@@%218%180%111%176%79%229%347%352$1@$0@@@%347$0@@|@|@@%218%181%112%176%79%228%349%346$1@$0@@@%349$0@@|@|@@%218%185%116%176%79%228%349%344$1@$0@@@%349$0@@|@|@@%218%185%116%176%79%228%349%348$1@$0@@@%349$0@@|@|@@%218%180%111%176%79%228%349%354$1@$0@@@%349$0@@|@|@@%218%180%111%176%79%228%349%352$1@$0@@@%349$0@@|@|@@%218%181%112%176%79%226%353%346$1@$0@@@%353$0@@|@|@@%218%185%116%176%79%226%353%344$1@$0@@@%353$0@@|@|@@%218%185%116%176%79%226%353%348$1@$0@@@%353$0@@|@|@@%218%184%115%176%79%226%353%350$1@$0@@@%353$0@@|@|@@%218%180%111%176%79%226%353%352$1@$0@@@%353$0@@|@|@@%218%181%112%176%79%226%351%346$1@$0@@@%351$0@@|@|@@%218%185%116%176%79%226%351%344$1@$0@@@%351$0@@|@|@@%218%185%116%176%79%226%351%348$1@$0@@@%351$0@@|@|@@%218%184%115%176%79%226%351%350$1@$0@@@%351$0@@|@|@@%218%180%111%176%79%226%351%354$1@$0@@@%351$0@@|@|@@%218%181%112%176%79%227%345%346$1@$0@@@$1%345$0@@@|@|@@%218%185%116%176%79%229%343%344$1@$0@@@$1%343$0@@@|@|@@%218%185%116%176%79%229%347%348$1@$0@@@$1%347$0@@@|@|@@%218%184%115%176%79%228%349%350$1@$0@@@$1%349$0@@@|@|@@%218%180%111%176%79%226%353%354$1@$0@@@$1%353$0@@@|@|@@%180%111%176%79%226%351%352$1@$0@@@$1%351$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_symbol_table_entry_fupdfupds x = x
    val op elf64_symbol_table_entry_fupdfupds =
    DT(((("elf_symbol_table",85),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_symbol_table",[65,66,67,83])]),["DISK_THM"]),
       [read"%218%181%126%181%112%176%79%231%346$1@%346$2@$0@@@%346%394$1@$2@@$0@@|@|@|@@%218%185%128%185%116%176%79%231%344$1@%344$2@$0@@@%344%396$1@$2@@$0@@|@|@|@@%218%185%128%185%116%176%79%231%348$1@%348$2@$0@@@%348%396$1@$2@@$0@@|@|@|@@%218%184%127%184%115%176%79%231%350$1@%350$2@$0@@@%350%395$1@$2@@$0@@|@|@|@@%218%180%125%180%111%176%79%231%354$1@%354$2@$0@@@%354%393$1@$2@@$0@@|@|@|@@%180%125%180%111%176%79%231%352$1@%352$2@$0@@@%352%393$1@$2@@$0@@|@|@|@@@@@@"])
  fun op elf64_symbol_table_entry_fupdfupds_comp x = x
    val op elf64_symbol_table_entry_fupdfupds_comp =
    DT(((("elf_symbol_table",86),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_symbol_table",[65,66,67,83])]),["DISK_THM"]),
       [read"%218%218%181%126%181%112%240%400%346$0@@%346$1@@@%346%394$0@$1@@@|@|@@%179%130%181%126%181%112%238%399%346$0@@%399%346$1@@$2@@@%399%346%394$0@$1@@@$2@@|@|@|@@@%218%218%185%128%185%116%240%400%344$0@@%344$1@@@%344%396$0@$1@@@|@|@@%179%130%185%128%185%116%238%399%344$0@@%399%344$1@@$2@@@%399%344%396$0@$1@@@$2@@|@|@|@@@%218%218%185%128%185%116%240%400%348$0@@%348$1@@@%348%396$0@$1@@@|@|@@%179%130%185%128%185%116%238%399%348$0@@%399%348$1@@$2@@@%399%348%396$0@$1@@@$2@@|@|@|@@@%218%218%184%127%184%115%240%400%350$0@@%350$1@@@%350%395$0@$1@@@|@|@@%179%130%184%127%184%115%238%399%350$0@@%399%350$1@@$2@@@%399%350%395$0@$1@@@$2@@|@|@|@@@%218%218%180%125%180%111%240%400%354$0@@%354$1@@@%354%393$0@$1@@@|@|@@%179%130%180%125%180%111%238%399%354$0@@%399%354$1@@$2@@@%399%354%393$0@$1@@@$2@@|@|@|@@@%218%180%125%180%111%240%400%352$0@@%352$1@@@%352%393$0@$1@@@|@|@@%179%130%180%125%180%111%238%399%352$0@@%399%352$1@@$2@@@%399%352%393$0@$1@@@$2@@|@|@|@@@@@@@"])
  fun op elf64_symbol_table_entry_fupdcanon x = x
    val op elf64_symbol_table_entry_fupdcanon =
    DT(((("elf_symbol_table",87),
        [("bool",[25,26,56,181]),
         ("elf_symbol_table",[65,66,67,83])]),["DISK_THM"]),
       [read"%218%181%126%185%116%176%79%231%344$1@%346$2@$0@@@%346$2@%344$1@$0@@@|@|@|@@%218%181%126%185%116%176%79%231%348$1@%346$2@$0@@@%346$2@%348$1@$0@@@|@|@|@@%218%185%128%185%116%176%79%231%348$1@%344$2@$0@@@%344$2@%348$1@$0@@@|@|@|@@%218%181%126%184%115%176%79%231%350$1@%346$2@$0@@@%346$2@%350$1@$0@@@|@|@|@@%218%185%128%184%115%176%79%231%350$1@%344$2@$0@@@%344$2@%350$1@$0@@@|@|@|@@%218%185%128%184%115%176%79%231%350$1@%348$2@$0@@@%348$2@%350$1@$0@@@|@|@|@@%218%181%126%180%111%176%79%231%354$1@%346$2@$0@@@%346$2@%354$1@$0@@@|@|@|@@%218%185%128%180%111%176%79%231%354$1@%344$2@$0@@@%344$2@%354$1@$0@@@|@|@|@@%218%185%128%180%111%176%79%231%354$1@%348$2@$0@@@%348$2@%354$1@$0@@@|@|@|@@%218%184%127%180%111%176%79%231%354$1@%350$2@$0@@@%350$2@%354$1@$0@@@|@|@|@@%218%181%126%180%111%176%79%231%352$1@%346$2@$0@@@%346$2@%352$1@$0@@@|@|@|@@%218%185%128%180%111%176%79%231%352$1@%344$2@$0@@@%344$2@%352$1@$0@@@|@|@|@@%218%185%128%180%111%176%79%231%352$1@%348$2@$0@@@%348$2@%352$1@$0@@@|@|@|@@%218%184%127%180%111%176%79%231%352$1@%350$2@$0@@@%350$2@%352$1@$0@@@|@|@|@@%180%125%180%111%176%79%231%352$1@%354$2@$0@@@%354$2@%352$1@$0@@@|@|@|@@@@@@@@@@@@@@@"])
  fun op elf64_symbol_table_entry_fupdcanon_comp x = x
    val op elf64_symbol_table_entry_fupdcanon_comp =
    DT(((("elf_symbol_table",88),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_symbol_table",[65,66,67,83])]),["DISK_THM"]),
       [read"%218%218%181%126%185%116%240%400%344$0@@%346$1@@@%400%346$1@@%344$0@@@|@|@@%179%130%181%126%185%116%238%399%344$0@@%399%346$1@@$2@@@%399%346$1@@%399%344$0@@$2@@@|@|@|@@@%218%218%181%126%185%116%240%400%348$0@@%346$1@@@%400%346$1@@%348$0@@@|@|@@%179%130%181%126%185%116%238%399%348$0@@%399%346$1@@$2@@@%399%346$1@@%399%348$0@@$2@@@|@|@|@@@%218%218%185%128%185%116%240%400%348$0@@%344$1@@@%400%344$1@@%348$0@@@|@|@@%179%130%185%128%185%116%238%399%348$0@@%399%344$1@@$2@@@%399%344$1@@%399%348$0@@$2@@@|@|@|@@@%218%218%181%126%184%115%240%400%350$0@@%346$1@@@%400%346$1@@%350$0@@@|@|@@%179%130%181%126%184%115%238%399%350$0@@%399%346$1@@$2@@@%399%346$1@@%399%350$0@@$2@@@|@|@|@@@%218%218%185%128%184%115%240%400%350$0@@%344$1@@@%400%344$1@@%350$0@@@|@|@@%179%130%185%128%184%115%238%399%350$0@@%399%344$1@@$2@@@%399%344$1@@%399%350$0@@$2@@@|@|@|@@@%218%218%185%128%184%115%240%400%350$0@@%348$1@@@%400%348$1@@%350$0@@@|@|@@%179%130%185%128%184%115%238%399%350$0@@%399%348$1@@$2@@@%399%348$1@@%399%350$0@@$2@@@|@|@|@@@%218%218%181%126%180%111%240%400%354$0@@%346$1@@@%400%346$1@@%354$0@@@|@|@@%179%130%181%126%180%111%238%399%354$0@@%399%346$1@@$2@@@%399%346$1@@%399%354$0@@$2@@@|@|@|@@@%218%218%185%128%180%111%240%400%354$0@@%344$1@@@%400%344$1@@%354$0@@@|@|@@%179%130%185%128%180%111%238%399%354$0@@%399%344$1@@$2@@@%399%344$1@@%399%354$0@@$2@@@|@|@|@@@%218%218%185%128%180%111%240%400%354$0@@%348$1@@@%400%348$1@@%354$0@@@|@|@@%179%130%185%128%180%111%238%399%354$0@@%399%348$1@@$2@@@%399%348$1@@%399%354$0@@$2@@@|@|@|@@@%218%218%184%127%180%111%240%400%354$0@@%350$1@@@%400%350$1@@%354$0@@@|@|@@%179%130%184%127%180%111%238%399%354$0@@%399%350$1@@$2@@@%399%350$1@@%399%354$0@@$2@@@|@|@|@@@%218%218%181%126%180%111%240%400%352$0@@%346$1@@@%400%346$1@@%352$0@@@|@|@@%179%130%181%126%180%111%238%399%352$0@@%399%346$1@@$2@@@%399%346$1@@%399%352$0@@$2@@@|@|@|@@@%218%218%185%128%180%111%240%400%352$0@@%344$1@@@%400%344$1@@%352$0@@@|@|@@%179%130%185%128%180%111%238%399%352$0@@%399%344$1@@$2@@@%399%344$1@@%399%352$0@@$2@@@|@|@|@@@%218%218%185%128%180%111%240%400%352$0@@%348$1@@@%400%348$1@@%352$0@@@|@|@@%179%130%185%128%180%111%238%399%352$0@@%399%348$1@@$2@@@%399%348$1@@%399%352$0@@$2@@@|@|@|@@@%218%218%184%127%180%111%240%400%352$0@@%350$1@@@%400%350$1@@%352$0@@@|@|@@%179%130%184%127%180%111%238%399%352$0@@%399%350$1@@$2@@@%399%350$1@@%399%352$0@@$2@@@|@|@|@@@%218%180%125%180%111%240%400%352$0@@%354$1@@@%400%354$1@@%352$0@@@|@|@@%179%130%180%125%180%111%238%399%352$0@@%399%354$1@@$2@@@%399%354$1@@%399%352$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@"])
  fun op elf64_symbol_table_entry_component_equality x = x
    val op elf64_symbol_table_entry_component_equality =
    DT(((("elf_symbol_table",89),
        [("bool",[25,26,51,56,63,181]),("elf_symbol_table",[65,66,67,76]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%176%81%176%83%225%231$1@$0@@%218%227%345$1@@%345$0@@@%218%229%343$1@@%343$0@@@%218%229%347$1@@%347$0@@@%218%228%349$1@@%349$0@@@%218%226%353$1@@%353$0@@@%226%351$1@@%351$0@@@@@@@@|@|@"])
  fun op elf64_symbol_table_entry_updates_eq_literal x = x
    val op elf64_symbol_table_entry_updates_eq_literal =
    DT(((("elf_symbol_table",90),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_symbol_table",[65,66,67,83])]),["DISK_THM"]),
       [read"%176%79%172%74%174%68%174%61%173%52%171%43%171%40%231%346%287$5@@%344%289$4@@%348%289$3@@%350%288$2@@%354%286$1@@%352%286$0@@$6@@@@@@@%346%287$5@@%344%289$4@@%348%289$3@@%350%288$2@@%354%286$1@@%352%286$0@@%264@@@@@@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_literal_nchotomy x = x
    val op elf64_symbol_table_entry_literal_nchotomy =
    DT(((("elf_symbol_table",91),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_symbol_table",[65,66,67,83]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%176%79%251%74%253%68%253%61%252%52%250%43%250%40%231$6@%346%287$5@@%344%289$4@@%348%289$3@@%350%288$2@@%354%286$1@@%352%286$0@@%264@@@@@@@|@|@|@|@|@|@|@"])
  fun op FORALL_elf64_symbol_table_entry x = x
    val op FORALL_elf64_symbol_table_entry =
    DT(((("elf_symbol_table",92),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_symbol_table",[65,66,67,83]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%187%7%225%176%79$1$0@|@@%172%74%174%68%174%61%173%52%171%43%171%40$6%346%287$5@@%344%289$4@@%348%289$3@@%350%288$2@@%354%286$1@@%352%286$0@@%264@@@@@@@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf64_symbol_table_entry x = x
    val op EXISTS_elf64_symbol_table_entry =
    DT(((("elf_symbol_table",93),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_symbol_table",[65,66,67,83]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%187%7%225%255%79$1$0@|@@%251%74%253%68%253%61%252%52%250%43%250%40$6%346%287$5@@%344%289$4@@%348%289$3@@%350%288$2@@%354%286$1@@%352%286$0@@%264@@@@@@@|@|@|@|@|@|@@|@"])
  fun op elf64_symbol_table_entry_literal_11 x = x
    val op elf64_symbol_table_entry_literal_11 =
    DT(((("elf_symbol_table",94),
        [("combin",[12]),("elf_symbol_table",[84,89])]),["DISK_THM"]),
       [read"%172%76%174%70%174%63%173%54%171%46%171%50%172%77%174%72%174%65%173%56%171%48%171%58%225%231%346%287$11@@%344%289$10@@%348%289$9@@%350%288$8@@%354%286$7@@%352%286$6@@%264@@@@@@@%346%287$5@@%344%289$4@@%348%289$3@@%350%288$2@@%354%286$1@@%352%286$0@@%264@@@@@@@@%218%227$11@$5@@%218%229$10@$4@@%218%229$9@$3@@%218%228$8@$2@@%218%226$7@$1@@%226$6@$0@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf64_symbol_table_entry x = x
    val op datatype_elf64_symbol_table_entry =
    DT(((("elf_symbol_table",95),[("bool",[25,171])]),["DISK_THM"]),
       [read"%278%142%99@%94@%93@%95@%96@%98@%97@@"])
  fun op elf64_symbol_table_entry_11 x = x
    val op elf64_symbol_table_entry_11 =
    DT(((("elf_symbol_table",96),
        [("bool",[26,51,56,63,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%11%174%16%174%20%173%23%171%27%171%31%172%12%174%18%174%22%173%25%171%29%171%33%225%231%418$11@$10@$9@$8@$7@$6@@%418$5@$4@$3@$2@$1@$0@@@%218%227$11@$5@@%218%229$10@$4@@%218%229$9@$3@@%218%228$8@$2@@%218%226$7@$1@@%226$6@$0@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_case_cong x = x
    val op elf64_symbol_table_entry_case_cong =
    DT(((("elf_symbol_table",97),
        [("bool",[26,181]),
         ("elf_symbol_table",[65,66,67,68])]),["DISK_THM"]),
       [read"%176%3%176%5%183%114%248%218%231$2@$1@@%172%11%174%16%174%20%173%23%171%27%171%31%248%231$7@%418$5@$4@$3@$2@$1@$0@@@%222$6$5@$4@$3@$2@$1@$0@@%118$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@@@%222%341$2@$0@@%341$1@%118@@@|@|@|@"])
  fun op elf64_symbol_table_entry_nchotomy x = x
    val op elf64_symbol_table_entry_nchotomy =
    DT(((("elf_symbol_table",98),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67])]),["DISK_THM"]),
       [read"%176%85%251%41%253%45%253%53%252%60%250%66%250%73%231$6@%418$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_Axiom x = x
    val op elf64_symbol_table_entry_Axiom =
    DT(((("elf_symbol_table",99),
        [("bool",[26,181]),("elf_symbol_table",[65,66,67]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%183%114%258%124%172%11%174%16%174%20%173%23%171%27%171%31%222$6%418$5@$4@$3@$2@$1@$0@@@$7$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@"])
  fun op elf64_symbol_table_entry_induction x = x
    val op elf64_symbol_table_entry_induction =
    DT(((("elf_symbol_table",100),
        [("bool",[26]),("elf_symbol_table",[65,66,67])]),["DISK_THM"]),
       [read"%187%7%248%172%41%174%45%174%53%173%60%171%66%171%73$6%418$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@@%176%79$1$0@|@@|@"])
  fun op read_elf32_symbol_table_ind x = x
    val op read_elf32_symbol_table_ind =
    DT(((("elf_symbol_table",117),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%188%8%248%177%100%169%38%248%169%39%248%460%244%384$1@@%219@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%177%164%169%165$2$1@$0@|@|@@|@",
        read"%177%100%169%38%169%39%248%460%244%384$1@@%219@@@%9%211$2@$0@@%211$2@$1@@@|@|@|@",
        read"%321%9@"])
  fun op read_elf32_symbol_table_def x = x
    val op read_elf32_symbol_table_def =
    DT(((("elf_symbol_table",118),
        [("bool",[15,58,129]),("combin",[19]),
         ("elf_symbol_table",[115,116]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%177%100%169%38%232%405$1@$0@@%270%244%384$0@@%219@@%419%297@@%366%406$1@$0@@%319%131%39%357%405$3@$0@@%161%419%274$2@$0@@|@||@@@@|@|@",
        read"%177%100%169%38%169%39%248%460%244%384$1@@%219@@@%9%211$2@$0@@%211$2@$1@@@|@|@|@",
        read"%321%9@"])
  fun op read_elf64_symbol_table_ind x = x
    val op read_elf64_symbol_table_ind =
    DT(((("elf_symbol_table",121),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%188%8%248%177%100%169%38%248%169%39%248%460%244%384$1@@%219@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%177%164%169%165$2$1@$0@|@|@@|@",
        read"%177%100%169%38%169%39%248%460%244%384$1@@%219@@@%9%211$2@$0@@%211$2@$1@@@|@|@|@",
        read"%321%9@"])
  fun op read_elf64_symbol_table_def x = x
    val op read_elf64_symbol_table_def =
    DT(((("elf_symbol_table",122),
        [("bool",[15,58,129]),("combin",[19]),
         ("elf_symbol_table",[119,120]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%177%100%169%38%233%411$1@$0@@%271%244%384$0@@%219@@%420%298@@%367%412$1@$0@@%320%132%39%358%411$3@$0@@%162%420%275$2@$0@@|@||@@@@|@|@",
        read"%177%100%169%38%169%39%248%460%244%384$1@@%219@@@%9%211$2@$0@@%211$2@$1@@@|@|@|@",
        read"%321%9@"])
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
    DB.Def), ("get_symbol_binding_def",get_symbol_binding_def,DB.Def),
   ("get_symbol_type_def",get_symbol_type_def,DB.Def),
   ("make_symbol_info_def",make_symbol_info_def,DB.Def),
   ("get_symbol_visibility_def",get_symbol_visibility_def,DB.Def),
   ("make_symbol_other_def",make_symbol_other_def,DB.Def),
   ("is_elf32_shndx_too_large_def",is_elf32_shndx_too_large_def,DB.Def),
   ("is_elf64_shndx_too_large_def",is_elf64_shndx_too_large_def,DB.Def),
   ("is_elf32_null_entry_def",is_elf32_null_entry_def,DB.Def),
   ("is_elf64_null_entry_def",is_elf64_null_entry_def,DB.Def),
   ("elf64_null_symbol_table_entry_def",
    elf64_null_symbol_table_entry_def,
    DB.Def),
   ("read_elf32_symbol_table_entry_def",
    read_elf32_symbol_table_entry_def,
    DB.Def),
   ("read_elf64_symbol_table_entry_def",
    read_elf64_symbol_table_entry_def,
    DB.Def),
   ("read_elf32_symbol_table_tupled_primitive_def",
    read_elf32_symbol_table_tupled_primitive_def,
    DB.Def),
   ("read_elf32_symbol_table_curried_def",
    read_elf32_symbol_table_curried_def,
    DB.Def),
   ("read_elf64_symbol_table_tupled_primitive_def",
    read_elf64_symbol_table_tupled_primitive_def,
    DB.Def),
   ("read_elf64_symbol_table_curried_def",
    read_elf64_symbol_table_curried_def,
    DB.Def),
   ("get_elf32_symbol_image_address_def",
    get_elf32_symbol_image_address_def,
    DB.Def),
   ("get_elf64_symbol_image_address_def",
    get_elf64_symbol_image_address_def,
    DB.Def),
   ("get_elf32_symbol_type_def",get_elf32_symbol_type_def,DB.Def),
   ("get_elf64_symbol_type_def",get_elf64_symbol_type_def,DB.Def),
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

  local open Portable GrammarSpecials Parse
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
       ("get_symbol_binding", (Term.prim_mk_const { Name = "get_symbol_binding", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_symbol_binding", (Term.prim_mk_const { Name = "get_symbol_binding", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_symbol_type", (Term.prim_mk_const { Name = "get_symbol_type", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_symbol_type", (Term.prim_mk_const { Name = "get_symbol_type", Thy = "elf_symbol_table"}))
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
       ("elf64_null_symbol_table_entry", (Term.prim_mk_const { Name = "elf64_null_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_null_symbol_table_entry", (Term.prim_mk_const { Name = "elf64_null_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_symbol_table_entry", (Term.prim_mk_const { Name = "read_elf32_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_symbol_table_entry", (Term.prim_mk_const { Name = "read_elf32_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_symbol_table_entry", (Term.prim_mk_const { Name = "read_elf64_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_symbol_table_entry", (Term.prim_mk_const { Name = "read_elf64_symbol_table_entry", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_symbol_table_tupled", (Term.prim_mk_const { Name = "read_elf32_symbol_table_tupled", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_symbol_table_tupled", (Term.prim_mk_const { Name = "read_elf32_symbol_table_tupled", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_symbol_table", (Term.prim_mk_const { Name = "read_elf32_symbol_table", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_symbol_table", (Term.prim_mk_const { Name = "read_elf32_symbol_table", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_symbol_table_tupled", (Term.prim_mk_const { Name = "read_elf64_symbol_table_tupled", Thy = "elf_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_symbol_table_tupled", (Term.prim_mk_const { Name = "read_elf64_symbol_table_tupled", Thy = "elf_symbol_table"}))
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
        "elf_symbol_table.stn_undef_def elf_symbol_table.stv_protected_def elf_symbol_table.get_elf64_symbol_type_def elf_symbol_table.get_elf32_symbol_type_def elf_symbol_table.get_elf64_symbol_image_address_def elf_symbol_table.get_elf32_symbol_image_address_def elf_symbol_table.read_elf64_symbol_table_entry_def elf_symbol_table.read_elf32_symbol_table_entry_def elf_symbol_table.elf64_null_symbol_table_entry_def elf_symbol_table.is_elf64_null_entry_def elf_symbol_table.is_elf32_null_entry_def elf_symbol_table.is_elf64_shndx_too_large_def elf_symbol_table.is_elf32_shndx_too_large_def elf_symbol_table.make_symbol_other_def elf_symbol_table.get_symbol_visibility_def elf_symbol_table.make_symbol_info_def elf_symbol_table.get_symbol_type_def elf_symbol_table.get_symbol_binding_def elf_symbol_table.instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict_def elf_symbol_table.elf64_symbol_table_entry_compare_def elf_symbol_table.instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict_def elf_symbol_table.elf32_symbol_table_entry_compare_def elf_symbol_table.string_of_symbol_visibility_def elf_symbol_table.stv_default_def elf_symbol_table.stv_hidden_def elf_symbol_table.stv_internal_def elf_symbol_table.stt_section_def elf_symbol_table.string_of_symbol_type_def elf_symbol_table.stt_hiproc_def elf_symbol_table.stt_loproc_def elf_symbol_table.stt_hios_def elf_symbol_table.stt_loos_def elf_symbol_table.stt_tls_def elf_symbol_table.stt_common_def elf_symbol_table.stt_file_def elf_symbol_table.stt_func_def elf_symbol_table.stt_notype_def elf_symbol_table.stt_object_def elf_symbol_table.stb_loos_def elf_symbol_table.stb_hiproc_def elf_symbol_table.stb_loproc_def elf_symbol_table.stb_hios_def elf_symbol_table.stb_weak_def elf_symbol_table.stb_global_def elf_symbol_table.stb_local_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "elf_symbol_table"
end
