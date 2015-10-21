structure elf_relocationTheory :> elf_relocationTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading elf_relocationTheory ... " else ()
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
          ("elf_relocation",
          Arbnum.fromString "1445346217",
          Arbnum.fromString "464985")
          [("lem_set",
           Arbnum.fromString "1445005525",
           Arbnum.fromString "352564"),
           ("elf_types_native_uint",
           Arbnum.fromString "1445345916",
           Arbnum.fromString "991129")];
  val _ = Theory.incorporate_types "elf_relocation"
       [("elf64_relocation_a", 0), ("elf64_relocation", 0),
        ("elf32_relocation_a", 0), ("elf32_relocation", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("elf_relocation", "elf64_relocation_a"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
   ID("min", "bool"), ID("elf_relocation", "elf64_relocation"),
   ID("elf_relocation", "elf32_relocation_a"),
   ID("elf_relocation", "elf32_relocation"), ID("error", "error"),
   ID("list", "list"), ID("pair", "prod"),
   ID("byte_sequence", "byte_sequence"), ID("endianness", "endianness"),
   ID("num", "num"), ID("lem_basic_classes", "Ord_class"),
   ID("lem_basic_classes", "ordering"), ID("ind_type", "recspace"),
   ID("min", "ind"), ID("bool", "!"), ID("arithmetic", "*"),
   ID("pair", ","), ID("integer", "int"), ID("arithmetic", "-"),
   ID("bool", "/\\"), ID("num", "0"), ID("prim_rec", "<"), ID("min", "="),
   ID("min", "==>"), ID("bool", "?"), ID("min", "@"), ID("bool", "ARB"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("bool", "COND"), ID("list", "CONS"),
   ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("pred_set", "EMPTY"), ID("lem_basic_classes", "EQ"),
   ID("lem_basic_classes", "GT"), ID("combin", "I"), ID("bool", "IN"),
   ID("pred_set", "INSERT"), ID("combin", "K"), ID("bool", "LET"),
   ID("lem_basic_classes", "LT"), ID("arithmetic", "MOD"),
   ID("list", "NIL"), ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("bool", "TYPE_DEFINITION"), ID("pair", "UNCURRY"),
   ID("relation", "WF"), ID("relation", "WFREC"), ID("arithmetic", "ZERO"),
   ID("elf_relocation", "elf32_relocation_CASE"),
   ID("elf_relocation", "elf32_relocation_a_CASE"),
   ID("elf_relocation", "elf32_relocation_a_elf32_ra_addend"),
   ID("elf_relocation", "elf32_relocation_a_elf32_ra_addend_fupd"),
   ID("elf_relocation", "elf32_relocation_a_elf32_ra_info"),
   ID("elf_relocation", "elf32_relocation_a_elf32_ra_info_fupd"),
   ID("elf_relocation", "elf32_relocation_a_elf32_ra_offset"),
   ID("elf_relocation", "elf32_relocation_a_elf32_ra_offset_fupd"),
   ID("elf_relocation", "elf32_relocation_a_size"),
   ID("elf_relocation", "elf32_relocation_elf32_r_info"),
   ID("elf_relocation", "elf32_relocation_elf32_r_info_fupd"),
   ID("elf_relocation", "elf32_relocation_elf32_r_offset"),
   ID("elf_relocation", "elf32_relocation_elf32_r_offset_fupd"),
   ID("elf_relocation", "elf32_relocation_size"),
   ID("elf_relocation", "elf64_relocation_CASE"),
   ID("elf_relocation", "elf64_relocation_a_CASE"),
   ID("elf_relocation", "elf64_relocation_a_compare"),
   ID("elf_relocation", "elf64_relocation_a_elf64_ra_addend"),
   ID("elf_relocation", "elf64_relocation_a_elf64_ra_addend_fupd"),
   ID("elf_relocation", "elf64_relocation_a_elf64_ra_info"),
   ID("elf_relocation", "elf64_relocation_a_elf64_ra_info_fupd"),
   ID("elf_relocation", "elf64_relocation_a_elf64_ra_offset"),
   ID("elf_relocation", "elf64_relocation_a_elf64_ra_offset_fupd"),
   ID("elf_relocation", "elf64_relocation_a_size"),
   ID("elf_relocation", "elf64_relocation_elf64_r_info"),
   ID("elf_relocation", "elf64_relocation_elf64_r_info_fupd"),
   ID("elf_relocation", "elf64_relocation_elf64_r_offset"),
   ID("elf_relocation", "elf64_relocation_elf64_r_offset_fupd"),
   ID("elf_relocation", "elf64_relocation_size"),
   ID("error", "error_bind"),
   ID("elf_relocation", "extract_elf32_relocation_r_sym"),
   ID("elf_relocation", "extract_elf32_relocation_r_type"),
   ID("elf_relocation", "extract_elf64_relocation_r_sym"),
   ID("elf_relocation", "extract_elf64_relocation_r_type"),
   ID("lem_basic_classes", "genericCompare"),
   ID("elf_relocation", "get_elf32_relocation_a_sym"),
   ID("elf_relocation", "get_elf32_relocation_a_type"),
   ID("elf_relocation", "get_elf32_relocation_r_sym"),
   ID("elf_relocation", "get_elf32_relocation_type"),
   ID("elf_relocation", "get_elf64_relocation_a_sym"),
   ID("elf_relocation", "get_elf64_relocation_a_type"),
   ID("elf_relocation", "get_elf64_relocation_sym"),
   ID("elf_relocation", "get_elf64_relocation_type"),
   ID("elf_relocation", "instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict"),
   ID("integer", "int_lt"), ID("byte_sequence", "length0"),
   ID("words", "n2w"), ID("combin", "o"), ID("pair", "pair_CASE"),
   ID("byte_sequence", "partition0"),
   ID("elf_types_native_uint", "read_elf32_addr"),
   ID("elf_relocation", "read_elf32_relocation"),
   ID("elf_relocation", "read_elf32_relocation_a"),
   ID("elf_relocation", "read_elf32_relocation_a_section"),
   ID("elf_relocation", "read_elf32_relocation_a_section'"),
   ID("elf_relocation", "read_elf32_relocation_a_section'_tupled"),
   ID("elf_relocation", "read_elf32_relocation_section"),
   ID("elf_relocation", "read_elf32_relocation_section'"),
   ID("elf_relocation", "read_elf32_relocation_section'_tupled"),
   ID("elf_types_native_uint", "read_elf32_sword"),
   ID("elf_types_native_uint", "read_elf32_word"),
   ID("elf_types_native_uint", "read_elf64_addr"),
   ID("elf_relocation", "read_elf64_relocation"),
   ID("elf_relocation", "read_elf64_relocation_a"),
   ID("elf_relocation", "read_elf64_relocation_a_section"),
   ID("elf_relocation", "read_elf64_relocation_a_section'"),
   ID("elf_relocation", "read_elf64_relocation_a_section'_tupled"),
   ID("elf_relocation", "read_elf64_relocation_section"),
   ID("elf_relocation", "read_elf64_relocation_section'"),
   ID("elf_relocation", "read_elf64_relocation_section'_tupled"),
   ID("elf_types_native_uint", "read_elf64_sxword"),
   ID("elf_types_native_uint", "read_elf64_xword"),
   ID("elf_relocation", "recordtype.elf32_relocation"),
   ID("elf_relocation", "recordtype.elf32_relocation_a"),
   ID("elf_relocation", "recordtype.elf64_relocation"),
   ID("elf_relocation", "recordtype.elf64_relocation_a"),
   ID("error", "return"), ID("lem_basic_classes", "tripleCompare"),
   ID("integer_word", "w2i"), ID("words", "w2n"), ID("words", "word_and"),
   ID("words", "word_lsr"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [4], TYOP [3, 1], TYOP [3, 2], TYOP [3, 3], TYOP [3, 4],
   TYOP [3, 5], TYOP [3, 6], TYOP [5], TYOP [2, 8, 7], TYOP [0, 9, 0],
   TYOP [0, 9, 10], TYOP [0, 9, 11], TYOP [6], TYOP [0, 9, 13],
   TYOP [0, 9, 14], TYOP [7], TYOP [2, 8, 6], TYOP [0, 17, 16],
   TYOP [0, 17, 18], TYOP [0, 17, 19], TYOP [8], TYOP [0, 17, 21],
   TYOP [0, 17, 22], TYOP [10, 13], TYOP [9, 24], TYOP [12], TYOP [13],
   TYOP [11, 27, 26], TYOP [0, 28, 25], TYOP [0, 26, 25], TYOP [0, 27, 30],
   TYOP [11, 24, 26], TYOP [9, 32], TYOP [0, 26, 33], TYOP [0, 27, 34],
   TYOP [14], TYOP [0, 36, 35], TYOP [10, 0], TYOP [9, 38],
   TYOP [0, 28, 39], TYOP [0, 26, 39], TYOP [0, 27, 41], TYOP [11, 38, 26],
   TYOP [9, 43], TYOP [0, 26, 44], TYOP [0, 27, 45], TYOP [0, 36, 46],
   TYOP [11, 0, 26], TYOP [9, 48], TYOP [0, 26, 49], TYOP [0, 27, 50],
   TYOP [11, 13, 26], TYOP [9, 52], TYOP [0, 26, 53], TYOP [0, 27, 54],
   TYOP [10, 21], TYOP [9, 56], TYOP [0, 28, 57], TYOP [0, 26, 57],
   TYOP [0, 27, 59], TYOP [11, 56, 26], TYOP [9, 61], TYOP [0, 26, 62],
   TYOP [0, 27, 63], TYOP [0, 36, 64], TYOP [10, 16], TYOP [9, 66],
   TYOP [0, 28, 67], TYOP [0, 26, 67], TYOP [0, 27, 69], TYOP [11, 66, 26],
   TYOP [9, 71], TYOP [0, 26, 72], TYOP [0, 27, 73], TYOP [0, 36, 74],
   TYOP [11, 16, 26], TYOP [9, 76], TYOP [0, 26, 77], TYOP [0, 27, 78],
   TYOP [11, 21, 26], TYOP [9, 80], TYOP [0, 26, 81], TYOP [0, 27, 82],
   TYOP [15, 0], TYOP [0, 13, 36], TYOP [0, 0, 36], TYOP [0, 21, 36],
   TYOP [0, 16, 36], TYOP [0, 9, 36], TYV "'a", TYOP [2, 8, 90],
   TYOP [0, 91, 36], TYOP [0, 13, 13], TYOP [0, 9, 9], TYOP [0, 94, 93],
   TYOP [0, 13, 9], TYOP [0, 0, 0], TYOP [0, 94, 97], TYOP [0, 0, 9],
   TYOP [16], TYOP [0, 0, 100], TYOP [0, 0, 101], TYOP [0, 9, 90],
   TYOP [0, 9, 103], TYOP [0, 9, 104], TYOP [0, 105, 90], TYOP [0, 0, 106],
   TYOP [0, 104, 90], TYOP [0, 13, 108], TYOP [0, 21, 21],
   TYOP [0, 17, 17], TYOP [0, 111, 110], TYOP [0, 21, 17],
   TYOP [0, 16, 16], TYOP [0, 111, 114], TYOP [0, 16, 17],
   TYOP [0, 17, 90], TYOP [0, 17, 117], TYOP [0, 17, 118],
   TYOP [0, 119, 90], TYOP [0, 16, 120], TYOP [0, 118, 90],
   TYOP [0, 21, 122], TYOP [11, 17, 17], TYOP [17, 124], TYOP [0, 125, 8],
   TYOP [11, 17, 124], TYOP [17, 127], TYOP [0, 128, 8], TYOP [11, 9, 9],
   TYOP [17, 130], TYOP [0, 131, 8], TYOP [11, 9, 130], TYOP [17, 133],
   TYOP [0, 134, 8], TYOP [0, 21, 8], TYOP [0, 16, 8], TYOP [0, 13, 8],
   TYOP [0, 0, 8], TYOP [0, 26, 8], TYOP [0, 27, 140], TYOP [0, 28, 8],
   TYOP [0, 28, 142], TYOP [18], TYOP [0, 21, 90], TYOP [0, 16, 90],
   TYOP [0, 13, 90], TYOP [0, 0, 90], TYOP [0, 90, 21], TYOP [0, 90, 16],
   TYOP [0, 90, 13], TYOP [0, 90, 0], TYOP [0, 9, 8], TYOP [0, 9, 153],
   TYOP [0, 144, 154], TYOP [0, 9, 154], TYOP [0, 144, 156],
   TYOP [0, 17, 8], TYOP [0, 17, 158], TYOP [0, 144, 159],
   TYOP [0, 17, 159], TYOP [0, 144, 161], TYOP [0, 21, 125],
   TYOP [0, 16, 128], TYOP [0, 13, 131], TYOP [0, 0, 134],
   TYOP [0, 140, 8], TYOP [0, 91, 8], TYOP [0, 168, 8], TYOP [0, 153, 8],
   TYOP [0, 158, 8], TYOP [0, 136, 8], TYOP [0, 137, 8], TYOP [0, 138, 8],
   TYOP [0, 139, 8], TYOP [0, 27, 8], TYOP [0, 176, 8], TYOP [0, 149, 8],
   TYOP [0, 178, 8], TYOP [0, 150, 8], TYOP [0, 180, 8], TYOP [0, 151, 8],
   TYOP [0, 182, 8], TYOP [0, 152, 8], TYOP [0, 184, 8], TYOP [0, 94, 8],
   TYOP [0, 186, 8], TYOP [0, 104, 8], TYOP [0, 188, 8], TYOP [0, 105, 8],
   TYOP [0, 190, 8], TYOP [0, 111, 8], TYOP [0, 192, 8], TYOP [0, 118, 8],
   TYOP [0, 194, 8], TYOP [0, 119, 8], TYOP [0, 196, 8], TYOP [0, 172, 8],
   TYOP [0, 173, 8], TYOP [0, 174, 8], TYOP [0, 175, 8], TYOP [0, 141, 8],
   TYOP [0, 202, 8], TYOP [0, 132, 8], TYOP [0, 204, 8], TYOP [0, 135, 8],
   TYOP [0, 206, 8], TYOP [0, 126, 8], TYOP [0, 208, 8], TYOP [0, 129, 8],
   TYOP [0, 210, 8], TYOP [0, 36, 8], TYOP [0, 212, 8], TYOP [0, 36, 36],
   TYOP [0, 36, 214], TYOP [0, 9, 130], TYOP [0, 9, 216],
   TYOP [0, 130, 133], TYOP [0, 9, 218], TYOP [0, 17, 124],
   TYOP [0, 17, 220], TYOP [0, 124, 127], TYOP [0, 17, 222],
   TYOP [0, 26, 80], TYOP [0, 21, 224], TYOP [0, 26, 76],
   TYOP [0, 16, 226], TYOP [0, 26, 52], TYOP [0, 13, 228],
   TYOP [0, 26, 48], TYOP [0, 0, 230], TYOP [0, 26, 28], TYOP [0, 27, 232],
   TYOP [0, 26, 61], TYOP [0, 56, 234], TYOP [0, 26, 71],
   TYOP [0, 66, 236], TYOP [0, 26, 32], TYOP [0, 24, 238],
   TYOP [0, 26, 43], TYOP [0, 38, 240], TYOP [22], TYOP [11, 36, 242],
   TYOP [0, 242, 243], TYOP [0, 36, 244], TYOP [11, 36, 243],
   TYOP [0, 243, 246], TYOP [0, 36, 247], TYOP [0, 8, 8], TYOP [0, 8, 249],
   TYOP [0, 36, 212], TYOP [0, 90, 8], TYOP [0, 90, 252], TYOP [0, 84, 8],
   TYOP [0, 84, 254], TYOP [0, 21, 136], TYOP [0, 16, 137],
   TYOP [0, 13, 138], TYOP [0, 0, 139], TYOP [0, 57, 8], TYOP [0, 57, 260],
   TYOP [0, 67, 8], TYOP [0, 67, 262], TYOP [0, 25, 8], TYOP [0, 25, 264],
   TYOP [0, 39, 8], TYOP [0, 39, 266], TYOP [0, 81, 8], TYOP [0, 81, 268],
   TYOP [0, 77, 8], TYOP [0, 77, 270], TYOP [0, 53, 8], TYOP [0, 53, 272],
   TYOP [0, 49, 8], TYOP [0, 49, 274], TYOP [0, 62, 8], TYOP [0, 62, 276],
   TYOP [0, 72, 8], TYOP [0, 72, 278], TYOP [0, 33, 8], TYOP [0, 33, 280],
   TYOP [0, 44, 8], TYOP [0, 44, 282], TYOP [0, 149, 178],
   TYOP [0, 150, 180], TYOP [0, 151, 182], TYOP [0, 152, 184],
   TYOP [0, 110, 8], TYOP [0, 110, 288], TYOP [0, 114, 8],
   TYOP [0, 114, 290], TYOP [0, 93, 8], TYOP [0, 93, 292], TYOP [0, 97, 8],
   TYOP [0, 97, 294], TYOP [0, 58, 8], TYOP [0, 58, 296], TYOP [0, 68, 8],
   TYOP [0, 68, 298], TYOP [0, 29, 8], TYOP [0, 29, 300], TYOP [0, 40, 8],
   TYOP [0, 40, 302], TYOP [0, 242, 8], TYOP [0, 242, 304],
   TYOP [0, 100, 8], TYOP [0, 100, 306], TYOP [0, 131, 132],
   TYOP [0, 134, 135], TYOP [0, 125, 126], TYOP [0, 128, 129],
   TYOP [0, 145, 8], TYOP [0, 312, 8], TYOP [0, 163, 8], TYOP [0, 314, 8],
   TYOP [0, 146, 8], TYOP [0, 316, 8], TYOP [0, 164, 8], TYOP [0, 318, 8],
   TYOP [0, 147, 8], TYOP [0, 320, 8], TYOP [0, 165, 8], TYOP [0, 322, 8],
   TYOP [0, 148, 8], TYOP [0, 324, 8], TYOP [0, 166, 8], TYOP [0, 326, 8],
   TYOP [0, 143, 8], TYOP [0, 328, 143], TYOP [0, 57, 57],
   TYOP [0, 57, 330], TYOP [0, 8, 331], TYOP [0, 67, 67],
   TYOP [0, 67, 333], TYOP [0, 8, 334], TYOP [0, 25, 25],
   TYOP [0, 25, 336], TYOP [0, 8, 337], TYOP [0, 39, 39],
   TYOP [0, 39, 339], TYOP [0, 8, 340], TYOP [0, 56, 56],
   TYOP [0, 21, 342], TYOP [0, 66, 66], TYOP [0, 16, 344],
   TYOP [0, 24, 24], TYOP [0, 13, 346], TYOP [0, 38, 38], TYOP [0, 0, 348],
   TYOP [0, 36, 131], TYOP [0, 350, 131], TYOP [0, 130, 351],
   TYOP [0, 36, 352], TYOP [0, 36, 134], TYOP [0, 354, 134],
   TYOP [0, 133, 355], TYOP [0, 36, 356], TYOP [0, 36, 125],
   TYOP [0, 358, 125], TYOP [0, 124, 359], TYOP [0, 36, 360],
   TYOP [0, 36, 128], TYOP [0, 362, 128], TYOP [0, 127, 363],
   TYOP [0, 36, 364], TYOP [0, 306, 8], TYOP [0, 100, 366],
   TYOP [0, 306, 306], TYOP [0, 100, 368], TYOP [0, 9, 94],
   TYOP [0, 17, 111], TYOP [0, 259, 259], TYOP [0, 259, 372],
   TYOP [0, 102, 102], TYOP [0, 102, 374], TYOP [0, 214, 214],
   TYOP [0, 84, 84], TYOP [0, 374, 377], TYOP [0, 372, 377],
   TYOP [0, 132, 322], TYOP [0, 135, 326], TYOP [0, 126, 314],
   TYOP [0, 129, 318], TYOP [11, 26, 26], TYOP [0, 384, 62],
   TYOP [0, 26, 63], TYOP [0, 386, 385], TYOP [0, 384, 72],
   TYOP [0, 26, 73], TYOP [0, 389, 388], TYOP [0, 384, 33],
   TYOP [0, 26, 34], TYOP [0, 392, 391], TYOP [0, 384, 44],
   TYOP [0, 26, 45], TYOP [0, 395, 394], TYOP [11, 9, 26],
   TYOP [0, 397, 53], TYOP [0, 9, 54], TYOP [0, 399, 398],
   TYOP [0, 397, 49], TYOP [0, 9, 50], TYOP [0, 402, 401],
   TYOP [11, 17, 26], TYOP [0, 404, 81], TYOP [0, 17, 82],
   TYOP [0, 406, 405], TYOP [0, 404, 77], TYOP [0, 17, 78],
   TYOP [0, 409, 408], TYOP [0, 80, 57], TYOP [0, 21, 59],
   TYOP [0, 412, 411], TYOP [0, 76, 67], TYOP [0, 16, 69],
   TYOP [0, 415, 414], TYOP [0, 52, 25], TYOP [0, 13, 30],
   TYOP [0, 418, 417], TYOP [0, 48, 39], TYOP [0, 0, 41],
   TYOP [0, 421, 420], TYOP [0, 58, 58], TYOP [0, 423, 58],
   TYOP [0, 143, 424], TYOP [0, 68, 68], TYOP [0, 426, 68],
   TYOP [0, 143, 427], TYOP [0, 29, 29], TYOP [0, 429, 29],
   TYOP [0, 143, 430], TYOP [0, 40, 40], TYOP [0, 432, 40],
   TYOP [0, 143, 433], TYOP [0, 56, 57], TYOP [0, 435, 57],
   TYOP [0, 57, 436], TYOP [0, 56, 62], TYOP [0, 438, 62],
   TYOP [0, 57, 439], TYOP [0, 66, 67], TYOP [0, 441, 67],
   TYOP [0, 67, 442], TYOP [0, 66, 72], TYOP [0, 444, 72],
   TYOP [0, 67, 445], TYOP [0, 24, 25], TYOP [0, 447, 25],
   TYOP [0, 25, 448], TYOP [0, 24, 33], TYOP [0, 450, 33],
   TYOP [0, 25, 451], TYOP [0, 38, 39], TYOP [0, 453, 39],
   TYOP [0, 39, 454], TYOP [0, 38, 44], TYOP [0, 456, 44],
   TYOP [0, 39, 457], TYOP [0, 385, 62], TYOP [9, 384], TYOP [0, 460, 459],
   TYOP [0, 388, 72], TYOP [0, 460, 462], TYOP [0, 391, 33],
   TYOP [0, 460, 464], TYOP [0, 394, 44], TYOP [0, 460, 466],
   TYOP [0, 398, 53], TYOP [9, 397], TYOP [0, 469, 468], TYOP [0, 401, 49],
   TYOP [0, 469, 471], TYOP [0, 405, 81], TYOP [9, 404],
   TYOP [0, 474, 473], TYOP [0, 408, 77], TYOP [0, 474, 476],
   TYOP [0, 411, 57], TYOP [0, 81, 478], TYOP [0, 414, 67],
   TYOP [0, 77, 480], TYOP [0, 417, 25], TYOP [0, 53, 482],
   TYOP [0, 420, 39], TYOP [0, 49, 484], TYOP [0, 17, 36],
   TYOP [0, 242, 100], TYOP [0, 242, 487], TYOP [0, 305, 488],
   TYOP [0, 305, 489], TYOP [0, 36, 100], TYOP [0, 36, 491],
   TYOP [0, 251, 492], TYOP [0, 251, 493], TYOP [0, 26, 36],
   TYOP [0, 36, 9], TYOP [0, 94, 94], TYOP [0, 94, 497],
   TYOP [0, 111, 111], TYOP [0, 111, 499], TYOP [0, 149, 149],
   TYOP [0, 110, 501], TYOP [0, 110, 110], TYOP [0, 110, 503],
   TYOP [0, 150, 150], TYOP [0, 114, 505], TYOP [0, 114, 114],
   TYOP [0, 114, 507], TYOP [0, 151, 151], TYOP [0, 93, 509],
   TYOP [0, 93, 93], TYOP [0, 93, 511], TYOP [0, 152, 152],
   TYOP [0, 97, 513], TYOP [0, 97, 97], TYOP [0, 97, 515],
   TYOP [0, 60, 57], TYOP [0, 28, 517], TYOP [0, 70, 67],
   TYOP [0, 28, 519], TYOP [0, 31, 25], TYOP [0, 28, 521],
   TYOP [0, 42, 39], TYOP [0, 28, 523], TYOP [0, 26, 460],
   TYOP [0, 36, 525], TYOP [0, 26, 474], TYOP [0, 27, 527],
   TYOP [0, 26, 469], TYOP [0, 27, 529], TYOP [0, 80, 81],
   TYOP [0, 76, 77], TYOP [0, 52, 53], TYOP [0, 48, 49], TYOP [0, 61, 62],
   TYOP [0, 71, 72], TYOP [0, 32, 33], TYOP [0, 43, 44],
   TYOP [0, 246, 100], TYOP [0, 246, 539], TYOP [0, 488, 540],
   TYOP [0, 492, 541], TYOP [0, 492, 542], TYOP [0, 9, 242],
   TYOP [0, 36, 91], TYOP [0, 91, 545]]
  end
  val _ = Theory.incorporate_consts "elf_relocation" tyvector
     [("recordtype.elf64_relocation_a", 12),
      ("recordtype.elf64_relocation", 15),
      ("recordtype.elf32_relocation_a", 20),
      ("recordtype.elf32_relocation", 23),
      ("read_elf64_relocation_section'_tupled", 29),
      ("read_elf64_relocation_section'", 31),
      ("read_elf64_relocation_section", 37),
      ("read_elf64_relocation_a_section'_tupled", 40),
      ("read_elf64_relocation_a_section'", 42),
      ("read_elf64_relocation_a_section", 47),
      ("read_elf64_relocation_a", 51), ("read_elf64_relocation", 55),
      ("read_elf32_relocation_section'_tupled", 58),
      ("read_elf32_relocation_section'", 60),
      ("read_elf32_relocation_section", 65),
      ("read_elf32_relocation_a_section'_tupled", 68),
      ("read_elf32_relocation_a_section'", 70),
      ("read_elf32_relocation_a_section", 75),
      ("read_elf32_relocation_a", 79), ("read_elf32_relocation", 83),
      ("instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict", 84),
      ("get_elf64_relocation_type", 85), ("get_elf64_relocation_sym", 85),
      ("get_elf64_relocation_a_type", 86),
      ("get_elf64_relocation_a_sym", 86),
      ("get_elf32_relocation_type", 87),
      ("get_elf32_relocation_r_sym", 87),
      ("get_elf32_relocation_a_type", 88),
      ("get_elf32_relocation_a_sym", 88),
      ("extract_elf64_relocation_r_type", 89),
      ("extract_elf64_relocation_r_sym", 92),
      ("extract_elf32_relocation_r_type", 92),
      ("extract_elf32_relocation_r_sym", 92),
      ("elf64_relocation_size", 85),
      ("elf64_relocation_elf64_r_offset_fupd", 95),
      ("elf64_relocation_elf64_r_offset", 96),
      ("elf64_relocation_elf64_r_info_fupd", 95),
      ("elf64_relocation_elf64_r_info", 96),
      ("elf64_relocation_a_size", 86),
      ("elf64_relocation_a_elf64_ra_offset_fupd", 98),
      ("elf64_relocation_a_elf64_ra_offset", 99),
      ("elf64_relocation_a_elf64_ra_info_fupd", 98),
      ("elf64_relocation_a_elf64_ra_info", 99),
      ("elf64_relocation_a_elf64_ra_addend_fupd", 98),
      ("elf64_relocation_a_elf64_ra_addend", 99),
      ("elf64_relocation_a_compare", 102),
      ("elf64_relocation_a_CASE", 107), ("elf64_relocation_CASE", 109),
      ("elf32_relocation_size", 87),
      ("elf32_relocation_elf32_r_offset_fupd", 112),
      ("elf32_relocation_elf32_r_offset", 113),
      ("elf32_relocation_elf32_r_info_fupd", 112),
      ("elf32_relocation_elf32_r_info", 113),
      ("elf32_relocation_a_size", 88),
      ("elf32_relocation_a_elf32_ra_offset_fupd", 115),
      ("elf32_relocation_a_elf32_ra_offset", 116),
      ("elf32_relocation_a_elf32_ra_info_fupd", 115),
      ("elf32_relocation_a_elf32_ra_info", 116),
      ("elf32_relocation_a_elf32_ra_addend_fupd", 115),
      ("elf32_relocation_a_elf32_ra_addend", 116),
      ("elf32_relocation_a_CASE", 121), ("elf32_relocation_CASE", 123)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'elf32_relocation'", 126), TMV("'elf32_relocation_a'", 129),
   TMV("'elf64_relocation'", 132), TMV("'elf64_relocation_a'", 135),
   TMV("M", 21), TMV("M", 16), TMV("M", 13), TMV("M", 0), TMV("M'", 21),
   TMV("M'", 16), TMV("M'", 13), TMV("M'", 0), TMV("P", 136),
   TMV("P", 137), TMV("P", 138), TMV("P", 139), TMV("P", 141),
   TMV("R", 143), TMV("a", 28), TMV("a0", 9), TMV("a0", 17), TMV("a0'", 9),
   TMV("a0'", 17), TMV("a0'", 131), TMV("a0'", 134), TMV("a0'", 125),
   TMV("a0'", 128), TMV("a1", 9), TMV("a1", 17), TMV("a1'", 9),
   TMV("a1'", 17), TMV("a2", 9), TMV("a2", 17), TMV("a2'", 9),
   TMV("a2'", 17), TMV("bs", 26), TMV("bs0", 26), TMV("bs1", 26),
   TMV("c", 9), TMV("c", 17), TMV("c0", 9), TMV("c0", 17), TMV("c01", 9),
   TMV("c01", 17), TMV("c02", 9), TMV("c02", 17), TMV("c1", 9),
   TMV("c1", 17), TMV("c11", 9), TMV("c11", 17), TMV("c12", 9),
   TMV("c12", 17), TMV("c2", 9), TMV("c2", 17), TMV("e", 21), TMV("e", 16),
   TMV("e", 13), TMV("e", 0), TMV("e1", 21), TMV("e1", 16), TMV("e1", 13),
   TMV("e1", 0), TMV("e2", 21), TMV("e2", 16), TMV("e2", 13), TMV("e2", 0),
   TMV("eat", 26), TMV("ee", 21), TMV("ee", 16), TMV("ee", 13),
   TMV("ee", 0), TMV("elf32_r_info", 17), TMV("elf32_r_offset", 17),
   TMV("elf32_ra_addend", 17), TMV("elf32_ra_info", 17),
   TMV("elf32_ra_offset", 17), TMV("elf32_relocation", 144),
   TMV("elf32_relocation_a", 144), TMV("elf64_r_info", 9),
   TMV("elf64_r_offset", 9), TMV("elf64_ra_addend", 9),
   TMV("elf64_ra_info", 9), TMV("elf64_ra_offset", 9),
   TMV("elf64_relocation", 144), TMV("elf64_relocation_a", 144),
   TMV("endian", 27), TMV("ent1", 0), TMV("ent2", 0), TMV("entries", 56),
   TMV("entries", 66), TMV("entries", 24), TMV("entries", 38),
   TMV("entry", 21), TMV("entry", 16), TMV("entry", 13), TMV("entry", 0),
   TMV("f", 94), TMV("f", 104), TMV("f", 105), TMV("f", 111),
   TMV("f", 118), TMV("f", 119), TMV("f'", 104), TMV("f'", 105),
   TMV("f'", 118), TMV("f'", 119), TMV("f1", 0), TMV("f2", 0),
   TMV("fn", 145), TMV("fn", 146), TMV("fn", 147), TMV("fn", 148),
   TMV("g", 94), TMV("g", 111), TMV("h", 149), TMV("h", 150),
   TMV("h", 151), TMV("h", 152), TMV("magic", 36), TMV("n", 36),
   TMV("r", 21), TMV("r", 16), TMV("r", 13), TMV("r", 0),
   TMV("r_addend", 9), TMV("r_addend", 17), TMV("r_info", 9),
   TMV("r_info", 17), TMV("r_offset", 9), TMV("r_offset", 17),
   TMV("read_elf32_relocation_a_section'_tupled", 68),
   TMV("read_elf32_relocation_section'_tupled", 58),
   TMV("read_elf64_relocation_a_section'_tupled", 40),
   TMV("read_elf64_relocation_section'_tupled", 29), TMV("record", 155),
   TMV("record", 157), TMV("record", 160), TMV("record", 162),
   TMV("rep", 163), TMV("rep", 164), TMV("rep", 165), TMV("rep", 166),
   TMV("rest", 26), TMV("table_size", 36), TMV("tail", 56),
   TMV("tail", 66), TMV("tail", 24), TMV("tail", 38), TMV("v", 27),
   TMV("v1", 26), TMV("w", 91), TMV("w", 9), TMV("x", 27), TMV("x1", 26),
   TMC(19, 167), TMC(19, 169), TMC(19, 170), TMC(19, 171), TMC(19, 172),
   TMC(19, 173), TMC(19, 174), TMC(19, 175), TMC(19, 177), TMC(19, 179),
   TMC(19, 181), TMC(19, 183), TMC(19, 185), TMC(19, 187), TMC(19, 189),
   TMC(19, 191), TMC(19, 193), TMC(19, 195), TMC(19, 197), TMC(19, 198),
   TMC(19, 199), TMC(19, 200), TMC(19, 201), TMC(19, 203), TMC(19, 205),
   TMC(19, 207), TMC(19, 209), TMC(19, 211), TMC(19, 213), TMC(19, 204),
   TMC(19, 206), TMC(19, 208), TMC(19, 210), TMC(20, 215), TMC(21, 217),
   TMC(21, 219), TMC(21, 221), TMC(21, 223), TMC(21, 225), TMC(21, 227),
   TMC(21, 229), TMC(21, 231), TMC(21, 233), TMC(21, 235), TMC(21, 237),
   TMC(21, 239), TMC(21, 241), TMC(21, 245), TMC(21, 248), TMC(23, 215),
   TMC(24, 250), TMC(25, 36), TMC(26, 251), TMC(27, 253), TMC(27, 255),
   TMC(27, 250), TMC(27, 154), TMC(27, 159), TMC(27, 256), TMC(27, 257),
   TMC(27, 258), TMC(27, 259), TMC(27, 261), TMC(27, 263), TMC(27, 265),
   TMC(27, 267), TMC(27, 269), TMC(27, 271), TMC(27, 273), TMC(27, 275),
   TMC(27, 277), TMC(27, 279), TMC(27, 281), TMC(27, 283), TMC(27, 284),
   TMC(27, 285), TMC(27, 286), TMC(27, 287), TMC(27, 289), TMC(27, 291),
   TMC(27, 293), TMC(27, 295), TMC(27, 297), TMC(27, 299), TMC(27, 301),
   TMC(27, 303), TMC(27, 305), TMC(27, 251), TMC(27, 307), TMC(27, 308),
   TMC(27, 309), TMC(27, 310), TMC(27, 311), TMC(28, 250), TMC(29, 170),
   TMC(29, 171), TMC(29, 172), TMC(29, 173), TMC(29, 174), TMC(29, 175),
   TMC(29, 313), TMC(29, 315), TMC(29, 317), TMC(29, 319), TMC(29, 321),
   TMC(29, 323), TMC(29, 325), TMC(29, 327), TMC(30, 329), TMC(31, 84),
   TMC(31, 21), TMC(31, 16), TMC(31, 13), TMC(31, 0), TMC(32, 214),
   TMC(33, 214), TMC(34, 131), TMC(34, 134), TMC(34, 125), TMC(34, 128),
   TMC(35, 332), TMC(35, 335), TMC(35, 338), TMC(35, 341), TMC(36, 343),
   TMC(36, 345), TMC(36, 347), TMC(36, 349), TMC(37, 353), TMC(37, 357),
   TMC(37, 361), TMC(37, 365), TMC(38, 249), TMC(39, 306), TMC(40, 100),
   TMC(41, 100), TMC(42, 330), TMC(42, 333), TMC(42, 336), TMC(42, 339),
   TMC(43, 367), TMC(44, 369), TMC(45, 370), TMC(45, 371), TMC(45, 373),
   TMC(45, 375), TMC(46, 376), TMC(47, 100), TMC(48, 215), TMC(49, 56),
   TMC(49, 66), TMC(49, 24), TMC(49, 38), TMC(50, 214), TMC(51, 378),
   TMC(52, 379), TMC(53, 379), TMC(54, 379), TMC(55, 379), TMC(56, 380),
   TMC(56, 381), TMC(56, 382), TMC(56, 383), TMC(57, 387), TMC(57, 390),
   TMC(57, 393), TMC(57, 396), TMC(57, 400), TMC(57, 403), TMC(57, 407),
   TMC(57, 410), TMC(57, 413), TMC(57, 416), TMC(57, 419), TMC(57, 422),
   TMC(58, 328), TMC(59, 425), TMC(59, 428), TMC(59, 431), TMC(59, 434),
   TMC(60, 36), TMC(61, 123), TMC(62, 121), TMC(63, 116), TMC(64, 115),
   TMC(65, 116), TMC(66, 115), TMC(67, 116), TMC(68, 115), TMC(69, 88),
   TMC(70, 113), TMC(71, 112), TMC(72, 113), TMC(73, 112), TMC(74, 87),
   TMC(75, 109), TMC(76, 107), TMC(77, 102), TMC(78, 99), TMC(79, 98),
   TMC(80, 99), TMC(81, 98), TMC(82, 99), TMC(83, 98), TMC(84, 86),
   TMC(85, 96), TMC(86, 95), TMC(87, 96), TMC(88, 95), TMC(89, 85),
   TMC(90, 437), TMC(90, 440), TMC(90, 443), TMC(90, 446), TMC(90, 449),
   TMC(90, 452), TMC(90, 455), TMC(90, 458), TMC(90, 461), TMC(90, 463),
   TMC(90, 465), TMC(90, 467), TMC(90, 470), TMC(90, 472), TMC(90, 475),
   TMC(90, 477), TMC(90, 479), TMC(90, 481), TMC(90, 483), TMC(90, 485),
   TMC(91, 92), TMC(91, 486), TMC(92, 92), TMC(92, 486), TMC(93, 92),
   TMC(93, 89), TMC(94, 89), TMC(95, 490), TMC(95, 494), TMC(96, 88),
   TMC(97, 88), TMC(98, 87), TMC(99, 87), TMC(100, 86), TMC(101, 86),
   TMC(102, 85), TMC(103, 85), TMC(104, 84), TMC(105, 305), TMC(106, 495),
   TMC(107, 496), TMC(108, 498), TMC(108, 500), TMC(108, 502),
   TMC(108, 504), TMC(108, 506), TMC(108, 508), TMC(108, 510),
   TMC(108, 512), TMC(108, 514), TMC(108, 516), TMC(109, 518),
   TMC(109, 520), TMC(109, 522), TMC(109, 524), TMC(110, 526),
   TMC(111, 528), TMC(112, 83), TMC(113, 79), TMC(114, 75), TMC(115, 70),
   TMC(116, 68), TMC(117, 65), TMC(118, 60), TMC(119, 58), TMC(120, 528),
   TMC(121, 528), TMC(122, 530), TMC(123, 55), TMC(124, 51), TMC(125, 47),
   TMC(126, 42), TMC(127, 40), TMC(128, 37), TMC(129, 31), TMC(130, 29),
   TMC(131, 530), TMC(132, 530), TMC(133, 23), TMC(134, 20), TMC(135, 15),
   TMC(136, 12), TMC(137, 435), TMC(137, 441), TMC(137, 447),
   TMC(137, 453), TMC(137, 531), TMC(137, 532), TMC(137, 533),
   TMC(137, 534), TMC(137, 535), TMC(137, 536), TMC(137, 537),
   TMC(137, 538), TMC(138, 543), TMC(139, 544), TMC(140, 92), TMC(140, 89),
   TMC(141, 370), TMC(142, 546), TMC(143, 249)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op elf32_relocation_TY_DEF x = x
    val op elf32_relocation_TY_DEF =
    DT(((("elf_relocation",0),[("bool",[26])]),["DISK_THM"]),
       [read"%255%138%315%25%180%0%247%185%25%247%249%20%249%28%245$2@%20%28%284%205@%190$1@$0@@%119%272|@||$1@$0@@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_relocation_case_def x = x
    val op elf32_relocation_case_def =
    DT(((("elf_relocation",4),
        [("bool",[26,181]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%157%20%157%28%171%100%207%335%442$2@$1@@$0@@$0$2@$1@@|@|@|@"])
  fun op elf32_relocation_size_def x = x
    val op elf32_relocation_size_def =
    DT(((("elf_relocation",5),
        [("bool",[26,181]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%157%20%157%28%241%348%442$1@$0@@@%307%268%334@@@|@|@"])
  fun op elf32_relocation_elf32_r_offset x = x
    val op elf32_relocation_elf32_r_offset =
    DT(((("elf_relocation",6),
        [("bool",[26,181]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%157%39%157%41%211%346%442$1@$0@@@$1@|@|@"])
  fun op elf32_relocation_elf32_r_info x = x
    val op elf32_relocation_elf32_r_info =
    DT(((("elf_relocation",7),
        [("bool",[26,181]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%157%39%157%41%211%344%442$1@$0@@@$0@|@|@"])
  fun op elf32_relocation_elf32_r_offset_fupd x = x
    val op elf32_relocation_elf32_r_offset_fupd =
    DT(((("elf_relocation",9),
        [("bool",[26,181]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%170%99%157%39%157%41%212%347$2@%442$1@$0@@@%442$2$1@@$0@@|@|@|@"])
  fun op elf32_relocation_elf32_r_info_fupd x = x
    val op elf32_relocation_elf32_r_info_fupd =
    DT(((("elf_relocation",10),
        [("bool",[26,181]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%170%99%157%39%157%41%212%345$2@%442$1@$0@@@%442$1@$2$0@@@|@|@|@"])
  fun op elf32_relocation_a_TY_DEF x = x
    val op elf32_relocation_a_TY_DEF =
    DT(((("elf_relocation",29),[("bool",[26])]),["DISK_THM"]),
       [read"%257%139%316%26%181%1%247%186%26%247%249%20%249%28%249%32%246$3@%20%28%32%285%205@%191$2@%190$1@$0@@@%119%273|@|||$2@$1@$0@@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_relocation_a_case_def x = x
    val op elf32_relocation_a_case_def =
    DT(((("elf_relocation",33),
        [("bool",[26,181]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%157%20%157%28%157%32%172%101%207%336%443$3@$2@$1@@$0@@$0$3@$2@$1@@|@|@|@|@"])
  fun op elf32_relocation_a_size_def x = x
    val op elf32_relocation_a_size_def =
    DT(((("elf_relocation",34),
        [("bool",[26,181]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%157%20%157%28%157%32%241%343%443$2@$1@$0@@@%307%268%334@@@|@|@|@"])
  fun op elf32_relocation_a_elf32_ra_offset x = x
    val op elf32_relocation_a_elf32_ra_offset =
    DT(((("elf_relocation",35),
        [("bool",[26,181]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%157%39%157%41%157%47%211%341%443$2@$1@$0@@@$2@|@|@|@"])
  fun op elf32_relocation_a_elf32_ra_info x = x
    val op elf32_relocation_a_elf32_ra_info =
    DT(((("elf_relocation",36),
        [("bool",[26,181]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%157%39%157%41%157%47%211%339%443$2@$1@$0@@@$1@|@|@|@"])
  fun op elf32_relocation_a_elf32_ra_addend x = x
    val op elf32_relocation_a_elf32_ra_addend =
    DT(((("elf_relocation",37),
        [("bool",[26,181]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%157%39%157%41%157%47%211%337%443$2@$1@$0@@@$0@|@|@|@"])
  fun op elf32_relocation_a_elf32_ra_offset_fupd x = x
    val op elf32_relocation_a_elf32_ra_offset_fupd =
    DT(((("elf_relocation",39),
        [("bool",[26,181]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%170%99%157%39%157%41%157%47%213%342$3@%443$2@$1@$0@@@%443$3$2@@$1@$0@@|@|@|@|@"])
  fun op elf32_relocation_a_elf32_ra_info_fupd x = x
    val op elf32_relocation_a_elf32_ra_info_fupd =
    DT(((("elf_relocation",40),
        [("bool",[26,181]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%170%99%157%39%157%41%157%47%213%340$3@%443$2@$1@$0@@@%443$2@$3$1@@$0@@|@|@|@|@"])
  fun op elf32_relocation_a_elf32_ra_addend_fupd x = x
    val op elf32_relocation_a_elf32_ra_addend_fupd =
    DT(((("elf_relocation",41),
        [("bool",[26,181]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%170%99%157%39%157%41%157%47%213%338$3@%443$2@$1@$0@@@%443$2@$1@$3$0@@@|@|@|@|@"])
  fun op elf64_relocation_TY_DEF x = x
    val op elf64_relocation_TY_DEF =
    DT(((("elf_relocation",60),[("bool",[26])]),["DISK_THM"]),
       [read"%259%140%313%23%178%2%247%183%23%247%248%19%248%27%243$2@%19%27%282%205@%188$1@$0@@%119%270|@||$1@$0@@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_relocation_case_def x = x
    val op elf64_relocation_case_def =
    DT(((("elf_relocation",64),
        [("bool",[26,181]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%156%19%156%27%168%97%207%349%444$2@$1@@$0@@$0$2@$1@@|@|@|@"])
  fun op elf64_relocation_size_def x = x
    val op elf64_relocation_size_def =
    DT(((("elf_relocation",65),
        [("bool",[26,181]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%156%19%156%27%241%363%444$1@$0@@@%307%268%334@@@|@|@"])
  fun op elf64_relocation_elf64_r_offset x = x
    val op elf64_relocation_elf64_r_offset =
    DT(((("elf_relocation",66),
        [("bool",[26,181]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%156%38%156%40%210%361%444$1@$0@@@$1@|@|@"])
  fun op elf64_relocation_elf64_r_info x = x
    val op elf64_relocation_elf64_r_info =
    DT(((("elf_relocation",67),
        [("bool",[26,181]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%156%38%156%40%210%359%444$1@$0@@@$0@|@|@"])
  fun op elf64_relocation_elf64_r_offset_fupd x = x
    val op elf64_relocation_elf64_r_offset_fupd =
    DT(((("elf_relocation",69),
        [("bool",[26,181]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%96%156%38%156%40%214%362$2@%444$1@$0@@@%444$2$1@@$0@@|@|@|@"])
  fun op elf64_relocation_elf64_r_info_fupd x = x
    val op elf64_relocation_elf64_r_info_fupd =
    DT(((("elf_relocation",70),
        [("bool",[26,181]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%96%156%38%156%40%214%360$2@%444$1@$0@@@%444$1@$2$0@@@|@|@|@"])
  fun op elf64_relocation_a_TY_DEF x = x
    val op elf64_relocation_a_TY_DEF =
    DT(((("elf_relocation",89),[("bool",[26])]),["DISK_THM"]),
       [read"%261%141%314%24%179%3%247%184%24%247%248%19%248%27%248%31%244$3@%19%27%31%283%205@%189$2@%188$1@$0@@@%119%271|@|||$2@$1@$0@@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_relocation_a_case_def x = x
    val op elf64_relocation_a_case_def =
    DT(((("elf_relocation",93),
        [("bool",[26,181]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%156%19%156%27%156%31%169%98%207%350%445$3@$2@$1@@$0@@$0$3@$2@$1@@|@|@|@|@"])
  fun op elf64_relocation_a_size_def x = x
    val op elf64_relocation_a_size_def =
    DT(((("elf_relocation",94),
        [("bool",[26,181]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%156%19%156%27%156%31%241%358%445$2@$1@$0@@@%307%268%334@@@|@|@|@"])
  fun op elf64_relocation_a_elf64_ra_offset x = x
    val op elf64_relocation_a_elf64_ra_offset =
    DT(((("elf_relocation",95),
        [("bool",[26,181]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%156%38%156%40%156%46%210%356%445$2@$1@$0@@@$2@|@|@|@"])
  fun op elf64_relocation_a_elf64_ra_info x = x
    val op elf64_relocation_a_elf64_ra_info =
    DT(((("elf_relocation",96),
        [("bool",[26,181]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%156%38%156%40%156%46%210%354%445$2@$1@$0@@@$1@|@|@|@"])
  fun op elf64_relocation_a_elf64_ra_addend x = x
    val op elf64_relocation_a_elf64_ra_addend =
    DT(((("elf_relocation",97),
        [("bool",[26,181]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%156%38%156%40%156%46%210%352%445$2@$1@$0@@@$0@|@|@|@"])
  fun op elf64_relocation_a_elf64_ra_offset_fupd x = x
    val op elf64_relocation_a_elf64_ra_offset_fupd =
    DT(((("elf_relocation",99),
        [("bool",[26,181]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%96%156%38%156%40%156%46%215%357$3@%445$2@$1@$0@@@%445$3$2@@$1@$0@@|@|@|@|@"])
  fun op elf64_relocation_a_elf64_ra_info_fupd x = x
    val op elf64_relocation_a_elf64_ra_info_fupd =
    DT(((("elf_relocation",100),
        [("bool",[26,181]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%96%156%38%156%40%156%46%215%355$3@%445$2@$1@$0@@@%445$2@$3$1@@$0@@|@|@|@|@"])
  fun op elf64_relocation_a_elf64_ra_addend_fupd x = x
    val op elf64_relocation_a_elf64_ra_addend_fupd =
    DT(((("elf_relocation",101),
        [("bool",[26,181]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%167%96%156%38%156%40%156%46%215%353$3@%445$2@$1@$0@@@%445$2@$1@$3$0@@@|@|@|@|@"])
  fun op elf64_relocation_a_compare_def x = x
    val op elf64_relocation_a_compare_def =
    DT(((("elf_relocation",120),[]),[]),
       [read"%161%86%161%87%242%351$1@$0@@%458%392%206@%241@@%392%206@%241@@%391%402@%240@@%202%461%356$1@@@%201%461%354$1@@@%459%352$1@@@@@%202%461%356$0@@@%201%461%354$0@@@%459%352$0@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict_def
    =
    DT(((("elf_relocation",121),[]),[]),
       [read"%208%401@%308%299%351@@%312%298%106%107%242%351$1@$0@@%301@||@@%311%298%106%107%294%351$1@$0@@%295%301@%295%288@%287@@@||@@%310%298%106%107%242%351$1@$0@@%289@||@@%309%298%106%107%294%351$1@$0@@%295%289@%295%288@%287@@@||@@%263@@@@@@"])
  fun op extract_elf32_relocation_r_sym_def x = x
    val op extract_elf32_relocation_r_sym_def =
    DT(((("elf_relocation",122),[]),[]),
       [read"%155%150%241%384$0@@%460%463$0@%307%269%268%268%334@@@@@@@|@"])
  fun op extract_elf64_relocation_r_sym_def x = x
    val op extract_elf64_relocation_r_sym_def =
    DT(((("elf_relocation",123),[]),[]),
       [read"%155%150%241%388$0@@%460%463$0@%307%269%268%268%268%268%334@@@@@@@@@|@"])
  fun op extract_elf32_relocation_r_type_def x = x
    val op extract_elf32_relocation_r_type_def =
    DT(((("elf_relocation",124),[]),[]),
       [read"%155%150%241%386$0@@%302%460$0@@%307%269%268%268%268%268%268%268%268%334@@@@@@@@@@@|@"])
  fun op extract_elf64_relocation_r_type_def x = x
    val op extract_elf64_relocation_r_type_def =
    DT(((("elf_relocation",125),[]),[]),
       [read"%156%151%241%390$0@@%300%118%461%462$1@%404$0@@@|@%203%187%307%269%268%268%268%268%268%268%268%268%268%268%268%268%268%268%268%334@@@@@@@@@@@@@@@@@@%307%269%268%268%268%268%268%268%268%268%268%268%268%268%268%268%268%334@@@@@@@@@@@@@@@@@@@%307%268%334@@@@@|@"])
  fun op get_elf32_relocation_r_sym_def x = x
    val op get_elf32_relocation_r_sym_def =
    DT(((("elf_relocation",126),[]),[]),
       [read"%158%120%241%395$0@@%385%344$0@@@|@"])
  fun op get_elf32_relocation_a_sym_def x = x
    val op get_elf32_relocation_a_sym_def =
    DT(((("elf_relocation",127),[]),[]),
       [read"%159%121%241%393$0@@%385%339$0@@@|@"])
  fun op get_elf64_relocation_sym_def x = x
    val op get_elf64_relocation_sym_def =
    DT(((("elf_relocation",128),[]),[]),
       [read"%160%122%241%399$0@@%389%359$0@@@|@"])
  fun op get_elf64_relocation_a_sym_def x = x
    val op get_elf64_relocation_a_sym_def =
    DT(((("elf_relocation",129),[]),[]),
       [read"%161%123%241%397$0@@%389%354$0@@@|@"])
  fun op get_elf32_relocation_type_def x = x
    val op get_elf32_relocation_type_def =
    DT(((("elf_relocation",130),[]),[]),
       [read"%158%120%241%396$0@@%387%344$0@@@|@"])
  fun op get_elf32_relocation_a_type_def x = x
    val op get_elf32_relocation_a_type_def =
    DT(((("elf_relocation",131),[]),[]),
       [read"%159%121%241%394$0@@%387%339$0@@@|@"])
  fun op get_elf64_relocation_type_def x = x
    val op get_elf64_relocation_type_def =
    DT(((("elf_relocation",132),[]),[]),
       [read"%160%122%241%400$0@@%390%359$0@@@|@"])
  fun op get_elf64_relocation_a_type_def x = x
    val op get_elf64_relocation_a_type_def =
    DT(((("elf_relocation",133),[]),[]),
       [read"%161%123%241%398$0@@%390%354$0@@@|@"])
  fun op read_elf32_relocation_def x = x
    val op read_elf32_relocation_def =
    DT(((("elf_relocation",134),[]),[]),
       [read"%162%85%154%35%220%421$1@$0@@%378%420$1@$0@@%323%129%35%378%430$3@$0@@%323%127%35%450%192%347%297$3@@%345%297$1@@%264@@@$0@@||@@||@@@|@|@"])
  fun op read_elf64_relocation_def x = x
    val op read_elf64_relocation_def =
    DT(((("elf_relocation",135),[]),[]),
       [read"%162%85%154%35%222%432$1@$0@@%376%431$1@$0@@%321%128%35%376%441$3@$0@@%321%126%35%452%194%362%296$3@@%360%296$1@@%266@@@$0@@||@@||@@@|@|@"])
  fun op read_elf32_relocation_a_def x = x
    val op read_elf32_relocation_a_def =
    DT(((("elf_relocation",136),[]),[]),
       [read"%162%85%154%35%221%422$1@$0@@%379%420$1@$0@@%324%129%35%379%430$3@$0@@%324%127%35%379%429$5@$0@@%324%125%35%451%193%342%297$5@@%340%297$3@@%338%297$1@@%265@@@@$0@@||@@||@@||@@@|@|@"])
  fun op read_elf64_relocation_a_def x = x
    val op read_elf64_relocation_a_def =
    DT(((("elf_relocation",137),[]),[]),
       [read"%162%85%154%35%223%433$1@$0@@%377%431$1@$0@@%322%128%35%377%441$3@$0@@%322%126%35%377%440$5@$0@@%322%124%35%453%195%357%296$5@@%355%296$3@@%353%296$1@@%267@@@@$0@@||@@||@@||@@@|@|@"])
  fun op read_elf32_relocation_section'_tupled_primitive_def x = x
    val op read_elf32_relocation_section'_tupled_primitive_def =
    DT(((("elf_relocation",138),[]),[]),
       [read"%236%428@%330%262%17%204%329$0@@%162%85%154%36%154%37%247%464%241%403$1@@%205@@@$3%196$2@$0@@%196$2@$1@@@|@|@|@@|@@%131%18%415$0@%85%36%290%274%241%403$0@@%205@@%446%303@@%380%421$1@$0@@%325%92%37%364$5%196$3@$0@@@%144%446%278$2@$0@@|@||@@@@||@||@@"])
  fun op read_elf32_relocation_section'_curried_def x = x
    val op read_elf32_relocation_section'_curried_def =
    DT(((("elf_relocation",139),[]),[]),
       [read"%162%152%154%153%216%427$1@$0@@%428%196$1@$0@@@|@|@"])
  fun op read_elf64_relocation_section'_tupled_primitive_def x = x
    val op read_elf64_relocation_section'_tupled_primitive_def =
    DT(((("elf_relocation",142),[]),[]),
       [read"%238%439@%332%262%17%204%329$0@@%162%85%154%36%154%37%247%464%241%403$1@@%205@@@$3%196$2@$0@@%196$2@$1@@@|@|@|@@|@@%133%18%417$0@%85%36%292%276%241%403$0@@%205@@%448%305@@%382%432$1@$0@@%327%94%37%368$5%196$3@$0@@@%146%448%280$2@$0@@|@||@@@@||@||@@"])
  fun op read_elf64_relocation_section'_curried_def x = x
    val op read_elf64_relocation_section'_curried_def =
    DT(((("elf_relocation",143),[]),[]),
       [read"%162%152%154%153%218%438$1@$0@@%439%196$1@$0@@@|@|@"])
  fun op read_elf32_relocation_a_section'_tupled_primitive_def x = x
    val op read_elf32_relocation_a_section'_tupled_primitive_def =
    DT(((("elf_relocation",146),[]),[]),
       [read"%237%425@%331%262%17%204%329$0@@%162%85%154%36%154%37%247%464%241%403$1@@%205@@@$3%196$2@$0@@%196$2@$1@@@|@|@|@@|@@%130%18%416$0@%85%36%291%275%241%403$0@@%205@@%447%304@@%381%422$1@$0@@%326%93%37%366$5%196$3@$0@@@%145%447%279$2@$0@@|@||@@@@||@||@@"])
  fun op read_elf32_relocation_a_section'_curried_def x = x
    val op read_elf32_relocation_a_section'_curried_def =
    DT(((("elf_relocation",147),[]),[]),
       [read"%162%152%154%153%217%424$1@$0@@%425%196$1@$0@@@|@|@"])
  fun op read_elf64_relocation_a_section'_tupled_primitive_def x = x
    val op read_elf64_relocation_a_section'_tupled_primitive_def =
    DT(((("elf_relocation",150),[]),[]),
       [read"%239%436@%333%262%17%204%329$0@@%162%85%154%36%154%37%247%464%241%403$1@@%205@@@$3%196$2@$0@@%196$2@$1@@@|@|@|@@|@@%132%18%418$0@%85%36%293%277%241%403$0@@%205@@%449%306@@%383%433$1@$0@@%328%95%37%370$5%196$3@$0@@@%147%449%281$2@$0@@|@||@@@@||@||@@"])
  fun op read_elf64_relocation_a_section'_curried_def x = x
    val op read_elf64_relocation_a_section'_curried_def =
    DT(((("elf_relocation",151),[]),[]),
       [read"%162%152%154%153%219%435$1@$0@@%436%196$1@$0@@@|@|@"])
  fun op read_elf32_relocation_section_def x = x
    val op read_elf32_relocation_section_def =
    DT(((("elf_relocation",154),[]),[]),
       [read"%182%143%162%85%154%36%224%426$2@$1@$0@@%372%419$2@$0@@%317%66%142%365%427$3@$1@@%88%454%197$0@$1@@|@||@@@|@|@|@"])
  fun op read_elf64_relocation_section_def x = x
    val op read_elf64_relocation_section_def =
    DT(((("elf_relocation",155),[]),[]),
       [read"%182%143%162%85%154%36%226%437$2@$1@$0@@%374%419$2@$0@@%319%66%142%369%438$3@$1@@%90%456%199$0@$1@@|@||@@@|@|@|@"])
  fun op read_elf32_relocation_a_section_def x = x
    val op read_elf32_relocation_a_section_def =
    DT(((("elf_relocation",156),[]),[]),
       [read"%182%143%162%85%154%36%225%423$2@$1@$0@@%373%419$2@$0@@%318%66%142%367%424$3@$1@@%89%455%198$0@$1@@|@||@@@|@|@|@"])
  fun op read_elf64_relocation_a_section_def x = x
    val op read_elf64_relocation_a_section_def =
    DT(((("elf_relocation",157),[]),[]),
       [read"%182%143%162%85%154%36%227%434$2@$1@$0@@%375%419$2@$0@@%320%66%142%371%435$3@$1@@%91%457%200$0@$1@@|@||@@@|@|@|@"])
  fun op elf32_relocation_accessors x = x
    val op elf32_relocation_accessors =
    DT(((("elf_relocation",8),[("elf_relocation",[6,7])]),["DISK_THM"]),
       [read"%204%157%39%157%41%211%346%442$1@$0@@@$1@|@|@@%157%39%157%41%211%344%442$1@$0@@@$0@|@|@@"])
  fun op elf32_relocation_fn_updates x = x
    val op elf32_relocation_fn_updates =
    DT(((("elf_relocation",11),[("elf_relocation",[9,10])]),["DISK_THM"]),
       [read"%204%170%99%157%39%157%41%212%347$2@%442$1@$0@@@%442$2$1@@$0@@|@|@|@@%170%99%157%39%157%41%212%345$2@%442$1@$0@@@%442$1@$2$0@@@|@|@|@@"])
  fun op elf32_relocation_accfupds x = x
    val op elf32_relocation_accfupds =
    DT(((("elf_relocation",12),
        [("bool",[25,26,56,181]),
         ("elf_relocation",[1,2,3,8,11])]),["DISK_THM"]),
       [read"%204%170%99%158%54%211%346%345$1@$0@@@%346$0@@|@|@@%204%170%99%158%54%211%344%347$1@$0@@@%344$0@@|@|@@%204%170%99%158%54%211%346%347$1@$0@@@$1%346$0@@@|@|@@%170%99%158%54%211%344%345$1@$0@@@$1%344$0@@@|@|@@@@"])
  fun op elf32_relocation_fupdfupds x = x
    val op elf32_relocation_fupdfupds =
    DT(((("elf_relocation",13),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_relocation",[1,2,3,11])]),["DISK_THM"]),
       [read"%204%170%113%170%99%158%54%212%347$1@%347$2@$0@@@%347%406$1@$2@@$0@@|@|@|@@%170%113%170%99%158%54%212%345$1@%345$2@$0@@@%345%406$1@$2@@$0@@|@|@|@@"])
  fun op elf32_relocation_fupdfupds_comp x = x
    val op elf32_relocation_fupdfupds_comp =
    DT(((("elf_relocation",14),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_relocation",[1,2,3,11])]),["DISK_THM"]),
       [read"%204%204%170%113%170%99%232%408%347$0@@%347$1@@@%347%406$0@$1@@@|@|@@%163%114%170%113%170%99%228%407%347$0@@%407%347$1@@$2@@@%407%347%406$0@$1@@@$2@@|@|@|@@@%204%170%113%170%99%232%408%345$0@@%345$1@@@%345%406$0@$1@@@|@|@@%163%114%170%113%170%99%228%407%345$0@@%407%345$1@@$2@@@%407%345%406$0@$1@@@$2@@|@|@|@@@"])
  fun op elf32_relocation_fupdcanon x = x
    val op elf32_relocation_fupdcanon =
    DT(((("elf_relocation",15),
        [("bool",[25,26,56,181]),
         ("elf_relocation",[1,2,3,11])]),["DISK_THM"]),
       [read"%170%113%170%99%158%54%212%345$1@%347$2@$0@@@%347$2@%345$1@$0@@@|@|@|@"])
  fun op elf32_relocation_fupdcanon_comp x = x
    val op elf32_relocation_fupdcanon_comp =
    DT(((("elf_relocation",16),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_relocation",[1,2,3,11])]),["DISK_THM"]),
       [read"%204%170%113%170%99%232%408%345$0@@%347$1@@@%408%347$1@@%345$0@@@|@|@@%163%114%170%113%170%99%228%407%345$0@@%407%347$1@@$2@@@%407%347$1@@%407%345$0@@$2@@@|@|@|@@"])
  fun op elf32_relocation_component_equality x = x
    val op elf32_relocation_component_equality =
    DT(((("elf_relocation",17),
        [("bool",[25,26,51,56,63,181]),("elf_relocation",[1,2,3,8]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%158%58%158%62%209%212$1@$0@@%204%211%346$1@@%346$0@@@%211%344$1@@%344$0@@@@|@|@"])
  fun op elf32_relocation_updates_eq_literal x = x
    val op elf32_relocation_updates_eq_literal =
    DT(((("elf_relocation",18),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_relocation",[1,2,3,11])]),["DISK_THM"]),
       [read"%158%54%157%41%157%39%212%347%297$1@@%345%297$0@@$2@@@%347%297$1@@%345%297$0@@%264@@@|@|@|@"])
  fun op elf32_relocation_literal_nchotomy x = x
    val op elf32_relocation_literal_nchotomy =
    DT(((("elf_relocation",19),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_relocation",[1,2,3,11]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%158%54%249%41%249%39%212$2@%347%297$1@@%345%297$0@@%264@@@|@|@|@"])
  fun op FORALL_elf32_relocation x = x
    val op FORALL_elf32_relocation =
    DT(((("elf_relocation",20),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_relocation",[1,2,3,11]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%173%12%209%158%54$1$0@|@@%157%41%157%39$2%347%297$1@@%345%297$0@@%264@@@|@|@@|@"])
  fun op EXISTS_elf32_relocation x = x
    val op EXISTS_elf32_relocation =
    DT(((("elf_relocation",21),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_relocation",[1,2,3,11]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%173%12%209%250%54$1$0@|@@%249%41%249%39$2%347%297$1@@%345%297$0@@%264@@@|@|@@|@"])
  fun op elf32_relocation_literal_11 x = x
    val op elf32_relocation_literal_11 =
    DT(((("elf_relocation",22),
        [("combin",[12]),("elf_relocation",[12,17])]),["DISK_THM"]),
       [read"%157%43%157%47%157%45%157%53%209%212%347%297$3@@%345%297$2@@%264@@@%347%297$1@@%345%297$0@@%264@@@@%204%211$3@$1@@%211$2@$0@@@|@|@|@|@"])
  fun op datatype_elf32_relocation x = x
    val op datatype_elf32_relocation =
    DT(((("elf_relocation",23),[("bool",[25,171])]),["DISK_THM"]),
       [read"%286%136%76@%72@%71@@"])
  fun op elf32_relocation_11 x = x
    val op elf32_relocation_11 =
    DT(((("elf_relocation",24),
        [("bool",[26,51,56,63,181]),("elf_relocation",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%157%20%157%28%157%22%157%30%209%212%442$3@$2@@%442$1@$0@@@%204%211$3@$1@@%211$2@$0@@@|@|@|@|@"])
  fun op elf32_relocation_case_cong x = x
    val op elf32_relocation_case_cong =
    DT(((("elf_relocation",25),
        [("bool",[26,181]),("elf_relocation",[1,2,3,4])]),["DISK_THM"]),
       [read"%158%4%158%8%171%100%247%204%212$2@$1@@%157%20%157%28%247%212$3@%442$1@$0@@@%207$2$1@$0@@%104$1@$0@@@|@|@@@%207%335$2@$0@@%335$1@%104@@@|@|@|@"])
  fun op elf32_relocation_nchotomy x = x
    val op elf32_relocation_nchotomy =
    DT(((("elf_relocation",26),
        [("bool",[26,181]),("elf_relocation",[1,2,3])]),["DISK_THM"]),
       [read"%158%67%249%39%249%41%212$2@%442$1@$0@@|@|@|@"])
  fun op elf32_relocation_Axiom x = x
    val op elf32_relocation_Axiom =
    DT(((("elf_relocation",27),
        [("bool",[26,181]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%171%100%254%108%157%20%157%28%207$2%442$1@$0@@@$3$1@$0@@|@|@|@|@"])
  fun op elf32_relocation_induction x = x
    val op elf32_relocation_induction =
    DT(((("elf_relocation",28),
        [("bool",[26]),("elf_relocation",[1,2,3])]),["DISK_THM"]),
       [read"%173%12%247%157%39%157%41$2%442$1@$0@@|@|@@%158%54$1$0@|@@|@"])
  fun op elf32_relocation_a_accessors x = x
    val op elf32_relocation_a_accessors =
    DT(((("elf_relocation",38),
        [("elf_relocation",[35,36,37])]),["DISK_THM"]),
       [read"%204%157%39%157%41%157%47%211%341%443$2@$1@$0@@@$2@|@|@|@@%204%157%39%157%41%157%47%211%339%443$2@$1@$0@@@$1@|@|@|@@%157%39%157%41%157%47%211%337%443$2@$1@$0@@@$0@|@|@|@@@"])
  fun op elf32_relocation_a_fn_updates x = x
    val op elf32_relocation_a_fn_updates =
    DT(((("elf_relocation",42),
        [("elf_relocation",[39,40,41])]),["DISK_THM"]),
       [read"%204%170%99%157%39%157%41%157%47%213%342$3@%443$2@$1@$0@@@%443$3$2@@$1@$0@@|@|@|@|@@%204%170%99%157%39%157%41%157%47%213%340$3@%443$2@$1@$0@@@%443$2@$3$1@@$0@@|@|@|@|@@%170%99%157%39%157%41%157%47%213%338$3@%443$2@$1@$0@@@%443$2@$1@$3$0@@@|@|@|@|@@@"])
  fun op elf32_relocation_a_accfupds x = x
    val op elf32_relocation_a_accfupds =
    DT(((("elf_relocation",43),
        [("bool",[25,26,56,181]),
         ("elf_relocation",[30,31,32,38,42])]),["DISK_THM"]),
       [read"%204%170%99%159%55%211%341%340$1@$0@@@%341$0@@|@|@@%204%170%99%159%55%211%341%338$1@$0@@@%341$0@@|@|@@%204%170%99%159%55%211%339%342$1@$0@@@%339$0@@|@|@@%204%170%99%159%55%211%339%338$1@$0@@@%339$0@@|@|@@%204%170%99%159%55%211%337%342$1@$0@@@%337$0@@|@|@@%204%170%99%159%55%211%337%340$1@$0@@@%337$0@@|@|@@%204%170%99%159%55%211%341%342$1@$0@@@$1%341$0@@@|@|@@%204%170%99%159%55%211%339%340$1@$0@@@$1%339$0@@@|@|@@%170%99%159%55%211%337%338$1@$0@@@$1%337$0@@@|@|@@@@@@@@@"])
  fun op elf32_relocation_a_fupdfupds x = x
    val op elf32_relocation_a_fupdfupds =
    DT(((("elf_relocation",44),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_relocation",[30,31,32,42])]),["DISK_THM"]),
       [read"%204%170%113%170%99%159%55%213%342$1@%342$2@$0@@@%342%406$1@$2@@$0@@|@|@|@@%204%170%113%170%99%159%55%213%340$1@%340$2@$0@@@%340%406$1@$2@@$0@@|@|@|@@%170%113%170%99%159%55%213%338$1@%338$2@$0@@@%338%406$1@$2@@$0@@|@|@|@@@"])
  fun op elf32_relocation_a_fupdfupds_comp x = x
    val op elf32_relocation_a_fupdfupds_comp =
    DT(((("elf_relocation",45),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_relocation",[30,31,32,42])]),["DISK_THM"]),
       [read"%204%204%170%113%170%99%233%410%342$0@@%342$1@@@%342%406$0@$1@@@|@|@@%164%115%170%113%170%99%229%409%342$0@@%409%342$1@@$2@@@%409%342%406$0@$1@@@$2@@|@|@|@@@%204%204%170%113%170%99%233%410%340$0@@%340$1@@@%340%406$0@$1@@@|@|@@%164%115%170%113%170%99%229%409%340$0@@%409%340$1@@$2@@@%409%340%406$0@$1@@@$2@@|@|@|@@@%204%170%113%170%99%233%410%338$0@@%338$1@@@%338%406$0@$1@@@|@|@@%164%115%170%113%170%99%229%409%338$0@@%409%338$1@@$2@@@%409%338%406$0@$1@@@$2@@|@|@|@@@@"])
  fun op elf32_relocation_a_fupdcanon x = x
    val op elf32_relocation_a_fupdcanon =
    DT(((("elf_relocation",46),
        [("bool",[25,26,56,181]),
         ("elf_relocation",[30,31,32,42])]),["DISK_THM"]),
       [read"%204%170%113%170%99%159%55%213%340$1@%342$2@$0@@@%342$2@%340$1@$0@@@|@|@|@@%204%170%113%170%99%159%55%213%338$1@%342$2@$0@@@%342$2@%338$1@$0@@@|@|@|@@%170%113%170%99%159%55%213%338$1@%340$2@$0@@@%340$2@%338$1@$0@@@|@|@|@@@"])
  fun op elf32_relocation_a_fupdcanon_comp x = x
    val op elf32_relocation_a_fupdcanon_comp =
    DT(((("elf_relocation",47),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_relocation",[30,31,32,42])]),["DISK_THM"]),
       [read"%204%204%170%113%170%99%233%410%340$0@@%342$1@@@%410%342$1@@%340$0@@@|@|@@%164%115%170%113%170%99%229%409%340$0@@%409%342$1@@$2@@@%409%342$1@@%409%340$0@@$2@@@|@|@|@@@%204%204%170%113%170%99%233%410%338$0@@%342$1@@@%410%342$1@@%338$0@@@|@|@@%164%115%170%113%170%99%229%409%338$0@@%409%342$1@@$2@@@%409%342$1@@%409%338$0@@$2@@@|@|@|@@@%204%170%113%170%99%233%410%338$0@@%340$1@@@%410%340$1@@%338$0@@@|@|@@%164%115%170%113%170%99%229%409%338$0@@%409%340$1@@$2@@@%409%340$1@@%409%338$0@@$2@@@|@|@|@@@@"])
  fun op elf32_relocation_a_component_equality x = x
    val op elf32_relocation_a_component_equality =
    DT(((("elf_relocation",48),
        [("bool",[25,26,51,56,63,181]),("elf_relocation",[30,31,32,38]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%159%59%159%63%209%213$1@$0@@%204%211%341$1@@%341$0@@@%204%211%339$1@@%339$0@@@%211%337$1@@%337$0@@@@@|@|@"])
  fun op elf32_relocation_a_updates_eq_literal x = x
    val op elf32_relocation_a_updates_eq_literal =
    DT(((("elf_relocation",49),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_relocation",[30,31,32,42])]),["DISK_THM"]),
       [read"%159%55%157%47%157%41%157%39%213%342%297$2@@%340%297$1@@%338%297$0@@$3@@@@%342%297$2@@%340%297$1@@%338%297$0@@%265@@@@|@|@|@|@"])
  fun op elf32_relocation_a_literal_nchotomy x = x
    val op elf32_relocation_a_literal_nchotomy =
    DT(((("elf_relocation",50),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_relocation",[30,31,32,42]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%159%55%249%47%249%41%249%39%213$3@%342%297$2@@%340%297$1@@%338%297$0@@%265@@@@|@|@|@|@"])
  fun op FORALL_elf32_relocation_a x = x
    val op FORALL_elf32_relocation_a =
    DT(((("elf_relocation",51),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_relocation",[30,31,32,42]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%174%13%209%159%55$1$0@|@@%157%47%157%41%157%39$3%342%297$2@@%340%297$1@@%338%297$0@@%265@@@@|@|@|@@|@"])
  fun op EXISTS_elf32_relocation_a x = x
    val op EXISTS_elf32_relocation_a =
    DT(((("elf_relocation",52),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_relocation",[30,31,32,42]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%174%13%209%251%55$1$0@|@@%249%47%249%41%249%39$3%342%297$2@@%340%297$1@@%338%297$0@@%265@@@@|@|@|@@|@"])
  fun op elf32_relocation_a_literal_11 x = x
    val op elf32_relocation_a_literal_11 =
    DT(((("elf_relocation",53),
        [("combin",[12]),("elf_relocation",[43,48])]),["DISK_THM"]),
       [read"%157%49%157%43%157%47%157%51%157%45%157%53%209%213%342%297$5@@%340%297$4@@%338%297$3@@%265@@@@%342%297$2@@%340%297$1@@%338%297$0@@%265@@@@@%204%211$5@$2@@%204%211$4@$1@@%211$3@$0@@@@|@|@|@|@|@|@"])
  fun op datatype_elf32_relocation_a x = x
    val op datatype_elf32_relocation_a =
    DT(((("elf_relocation",54),[("bool",[25,171])]),["DISK_THM"]),
       [read"%286%137%77@%75@%74@%73@@"])
  fun op elf32_relocation_a_11 x = x
    val op elf32_relocation_a_11 =
    DT(((("elf_relocation",55),
        [("bool",[26,51,56,63,181]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%157%20%157%28%157%32%157%22%157%30%157%34%209%213%443$5@$4@$3@@%443$2@$1@$0@@@%204%211$5@$2@@%204%211$4@$1@@%211$3@$0@@@@|@|@|@|@|@|@"])
  fun op elf32_relocation_a_case_cong x = x
    val op elf32_relocation_a_case_cong =
    DT(((("elf_relocation",56),
        [("bool",[26,181]),
         ("elf_relocation",[30,31,32,33])]),["DISK_THM"]),
       [read"%159%5%159%9%172%101%247%204%213$2@$1@@%157%20%157%28%157%32%247%213$4@%443$2@$1@$0@@@%207$3$2@$1@$0@@%105$2@$1@$0@@@|@|@|@@@%207%336$2@$0@@%336$1@%105@@@|@|@|@"])
  fun op elf32_relocation_a_nchotomy x = x
    val op elf32_relocation_a_nchotomy =
    DT(((("elf_relocation",57),
        [("bool",[26,181]),("elf_relocation",[30,31,32])]),["DISK_THM"]),
       [read"%159%68%249%39%249%41%249%47%213$3@%443$2@$1@$0@@|@|@|@|@"])
  fun op elf32_relocation_a_Axiom x = x
    val op elf32_relocation_a_Axiom =
    DT(((("elf_relocation",58),
        [("bool",[26,181]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%172%101%256%109%157%20%157%28%157%32%207$3%443$2@$1@$0@@@$4$2@$1@$0@@|@|@|@|@|@"])
  fun op elf32_relocation_a_induction x = x
    val op elf32_relocation_a_induction =
    DT(((("elf_relocation",59),
        [("bool",[26]),("elf_relocation",[30,31,32])]),["DISK_THM"]),
       [read"%174%13%247%157%39%157%41%157%47$3%443$2@$1@$0@@|@|@|@@%159%55$1$0@|@@|@"])
  fun op elf64_relocation_accessors x = x
    val op elf64_relocation_accessors =
    DT(((("elf_relocation",68),[("elf_relocation",[66,67])]),["DISK_THM"]),
       [read"%204%156%38%156%40%210%361%444$1@$0@@@$1@|@|@@%156%38%156%40%210%359%444$1@$0@@@$0@|@|@@"])
  fun op elf64_relocation_fn_updates x = x
    val op elf64_relocation_fn_updates =
    DT(((("elf_relocation",71),[("elf_relocation",[69,70])]),["DISK_THM"]),
       [read"%204%167%96%156%38%156%40%214%362$2@%444$1@$0@@@%444$2$1@@$0@@|@|@|@@%167%96%156%38%156%40%214%360$2@%444$1@$0@@@%444$1@$2$0@@@|@|@|@@"])
  fun op elf64_relocation_accfupds x = x
    val op elf64_relocation_accfupds =
    DT(((("elf_relocation",72),
        [("bool",[25,26,56,181]),
         ("elf_relocation",[61,62,63,68,71])]),["DISK_THM"]),
       [read"%204%167%96%160%56%210%361%360$1@$0@@@%361$0@@|@|@@%204%167%96%160%56%210%359%362$1@$0@@@%359$0@@|@|@@%204%167%96%160%56%210%361%362$1@$0@@@$1%361$0@@@|@|@@%167%96%160%56%210%359%360$1@$0@@@$1%359$0@@@|@|@@@@"])
  fun op elf64_relocation_fupdfupds x = x
    val op elf64_relocation_fupdfupds =
    DT(((("elf_relocation",73),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_relocation",[61,62,63,71])]),["DISK_THM"]),
       [read"%204%167%112%167%96%160%56%214%362$1@%362$2@$0@@@%362%405$1@$2@@$0@@|@|@|@@%167%112%167%96%160%56%214%360$1@%360$2@$0@@@%360%405$1@$2@@$0@@|@|@|@@"])
  fun op elf64_relocation_fupdfupds_comp x = x
    val op elf64_relocation_fupdfupds_comp =
    DT(((("elf_relocation",74),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_relocation",[61,62,63,71])]),["DISK_THM"]),
       [read"%204%204%167%112%167%96%234%412%362$0@@%362$1@@@%362%405$0@$1@@@|@|@@%165%116%167%112%167%96%230%411%362$0@@%411%362$1@@$2@@@%411%362%405$0@$1@@@$2@@|@|@|@@@%204%167%112%167%96%234%412%360$0@@%360$1@@@%360%405$0@$1@@@|@|@@%165%116%167%112%167%96%230%411%360$0@@%411%360$1@@$2@@@%411%360%405$0@$1@@@$2@@|@|@|@@@"])
  fun op elf64_relocation_fupdcanon x = x
    val op elf64_relocation_fupdcanon =
    DT(((("elf_relocation",75),
        [("bool",[25,26,56,181]),
         ("elf_relocation",[61,62,63,71])]),["DISK_THM"]),
       [read"%167%112%167%96%160%56%214%360$1@%362$2@$0@@@%362$2@%360$1@$0@@@|@|@|@"])
  fun op elf64_relocation_fupdcanon_comp x = x
    val op elf64_relocation_fupdcanon_comp =
    DT(((("elf_relocation",76),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_relocation",[61,62,63,71])]),["DISK_THM"]),
       [read"%204%167%112%167%96%234%412%360$0@@%362$1@@@%412%362$1@@%360$0@@@|@|@@%165%116%167%112%167%96%230%411%360$0@@%411%362$1@@$2@@@%411%362$1@@%411%360$0@@$2@@@|@|@|@@"])
  fun op elf64_relocation_component_equality x = x
    val op elf64_relocation_component_equality =
    DT(((("elf_relocation",77),
        [("bool",[25,26,51,56,63,181]),("elf_relocation",[61,62,63,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%160%60%160%64%209%214$1@$0@@%204%210%361$1@@%361$0@@@%210%359$1@@%359$0@@@@|@|@"])
  fun op elf64_relocation_updates_eq_literal x = x
    val op elf64_relocation_updates_eq_literal =
    DT(((("elf_relocation",78),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_relocation",[61,62,63,71])]),["DISK_THM"]),
       [read"%160%56%156%40%156%38%214%362%296$1@@%360%296$0@@$2@@@%362%296$1@@%360%296$0@@%266@@@|@|@|@"])
  fun op elf64_relocation_literal_nchotomy x = x
    val op elf64_relocation_literal_nchotomy =
    DT(((("elf_relocation",79),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_relocation",[61,62,63,71]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%160%56%248%40%248%38%214$2@%362%296$1@@%360%296$0@@%266@@@|@|@|@"])
  fun op FORALL_elf64_relocation x = x
    val op FORALL_elf64_relocation =
    DT(((("elf_relocation",80),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_relocation",[61,62,63,71]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%175%14%209%160%56$1$0@|@@%156%40%156%38$2%362%296$1@@%360%296$0@@%266@@@|@|@@|@"])
  fun op EXISTS_elf64_relocation x = x
    val op EXISTS_elf64_relocation =
    DT(((("elf_relocation",81),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_relocation",[61,62,63,71]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%175%14%209%252%56$1$0@|@@%248%40%248%38$2%362%296$1@@%360%296$0@@%266@@@|@|@@|@"])
  fun op elf64_relocation_literal_11 x = x
    val op elf64_relocation_literal_11 =
    DT(((("elf_relocation",82),
        [("combin",[12]),("elf_relocation",[72,77])]),["DISK_THM"]),
       [read"%156%42%156%46%156%44%156%52%209%214%362%296$3@@%360%296$2@@%266@@@%362%296$1@@%360%296$0@@%266@@@@%204%210$3@$1@@%210$2@$0@@@|@|@|@|@"])
  fun op datatype_elf64_relocation x = x
    val op datatype_elf64_relocation =
    DT(((("elf_relocation",83),[("bool",[25,171])]),["DISK_THM"]),
       [read"%286%134%83@%79@%78@@"])
  fun op elf64_relocation_11 x = x
    val op elf64_relocation_11 =
    DT(((("elf_relocation",84),
        [("bool",[26,51,56,63,181]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%156%19%156%27%156%21%156%29%209%214%444$3@$2@@%444$1@$0@@@%204%210$3@$1@@%210$2@$0@@@|@|@|@|@"])
  fun op elf64_relocation_case_cong x = x
    val op elf64_relocation_case_cong =
    DT(((("elf_relocation",85),
        [("bool",[26,181]),
         ("elf_relocation",[61,62,63,64])]),["DISK_THM"]),
       [read"%160%6%160%10%168%97%247%204%214$2@$1@@%156%19%156%27%247%214$3@%444$1@$0@@@%207$2$1@$0@@%102$1@$0@@@|@|@@@%207%349$2@$0@@%349$1@%102@@@|@|@|@"])
  fun op elf64_relocation_nchotomy x = x
    val op elf64_relocation_nchotomy =
    DT(((("elf_relocation",86),
        [("bool",[26,181]),("elf_relocation",[61,62,63])]),["DISK_THM"]),
       [read"%160%69%248%38%248%40%214$2@%444$1@$0@@|@|@|@"])
  fun op elf64_relocation_Axiom x = x
    val op elf64_relocation_Axiom =
    DT(((("elf_relocation",87),
        [("bool",[26,181]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%168%97%258%110%156%19%156%27%207$2%444$1@$0@@@$3$1@$0@@|@|@|@|@"])
  fun op elf64_relocation_induction x = x
    val op elf64_relocation_induction =
    DT(((("elf_relocation",88),
        [("bool",[26]),("elf_relocation",[61,62,63])]),["DISK_THM"]),
       [read"%175%14%247%156%38%156%40$2%444$1@$0@@|@|@@%160%56$1$0@|@@|@"])
  fun op elf64_relocation_a_accessors x = x
    val op elf64_relocation_a_accessors =
    DT(((("elf_relocation",98),
        [("elf_relocation",[95,96,97])]),["DISK_THM"]),
       [read"%204%156%38%156%40%156%46%210%356%445$2@$1@$0@@@$2@|@|@|@@%204%156%38%156%40%156%46%210%354%445$2@$1@$0@@@$1@|@|@|@@%156%38%156%40%156%46%210%352%445$2@$1@$0@@@$0@|@|@|@@@"])
  fun op elf64_relocation_a_fn_updates x = x
    val op elf64_relocation_a_fn_updates =
    DT(((("elf_relocation",102),
        [("elf_relocation",[99,100,101])]),["DISK_THM"]),
       [read"%204%167%96%156%38%156%40%156%46%215%357$3@%445$2@$1@$0@@@%445$3$2@@$1@$0@@|@|@|@|@@%204%167%96%156%38%156%40%156%46%215%355$3@%445$2@$1@$0@@@%445$2@$3$1@@$0@@|@|@|@|@@%167%96%156%38%156%40%156%46%215%353$3@%445$2@$1@$0@@@%445$2@$1@$3$0@@@|@|@|@|@@@"])
  fun op elf64_relocation_a_accfupds x = x
    val op elf64_relocation_a_accfupds =
    DT(((("elf_relocation",103),
        [("bool",[25,26,56,181]),
         ("elf_relocation",[90,91,92,98,102])]),["DISK_THM"]),
       [read"%204%167%96%161%57%210%356%355$1@$0@@@%356$0@@|@|@@%204%167%96%161%57%210%356%353$1@$0@@@%356$0@@|@|@@%204%167%96%161%57%210%354%357$1@$0@@@%354$0@@|@|@@%204%167%96%161%57%210%354%353$1@$0@@@%354$0@@|@|@@%204%167%96%161%57%210%352%357$1@$0@@@%352$0@@|@|@@%204%167%96%161%57%210%352%355$1@$0@@@%352$0@@|@|@@%204%167%96%161%57%210%356%357$1@$0@@@$1%356$0@@@|@|@@%204%167%96%161%57%210%354%355$1@$0@@@$1%354$0@@@|@|@@%167%96%161%57%210%352%353$1@$0@@@$1%352$0@@@|@|@@@@@@@@@"])
  fun op elf64_relocation_a_fupdfupds x = x
    val op elf64_relocation_a_fupdfupds =
    DT(((("elf_relocation",104),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_relocation",[90,91,92,102])]),["DISK_THM"]),
       [read"%204%167%112%167%96%161%57%215%357$1@%357$2@$0@@@%357%405$1@$2@@$0@@|@|@|@@%204%167%112%167%96%161%57%215%355$1@%355$2@$0@@@%355%405$1@$2@@$0@@|@|@|@@%167%112%167%96%161%57%215%353$1@%353$2@$0@@@%353%405$1@$2@@$0@@|@|@|@@@"])
  fun op elf64_relocation_a_fupdfupds_comp x = x
    val op elf64_relocation_a_fupdfupds_comp =
    DT(((("elf_relocation",105),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_relocation",[90,91,92,102])]),["DISK_THM"]),
       [read"%204%204%167%112%167%96%235%414%357$0@@%357$1@@@%357%405$0@$1@@@|@|@@%166%117%167%112%167%96%231%413%357$0@@%413%357$1@@$2@@@%413%357%405$0@$1@@@$2@@|@|@|@@@%204%204%167%112%167%96%235%414%355$0@@%355$1@@@%355%405$0@$1@@@|@|@@%166%117%167%112%167%96%231%413%355$0@@%413%355$1@@$2@@@%413%355%405$0@$1@@@$2@@|@|@|@@@%204%167%112%167%96%235%414%353$0@@%353$1@@@%353%405$0@$1@@@|@|@@%166%117%167%112%167%96%231%413%353$0@@%413%353$1@@$2@@@%413%353%405$0@$1@@@$2@@|@|@|@@@@"])
  fun op elf64_relocation_a_fupdcanon x = x
    val op elf64_relocation_a_fupdcanon =
    DT(((("elf_relocation",106),
        [("bool",[25,26,56,181]),
         ("elf_relocation",[90,91,92,102])]),["DISK_THM"]),
       [read"%204%167%112%167%96%161%57%215%355$1@%357$2@$0@@@%357$2@%355$1@$0@@@|@|@|@@%204%167%112%167%96%161%57%215%353$1@%357$2@$0@@@%357$2@%353$1@$0@@@|@|@|@@%167%112%167%96%161%57%215%353$1@%355$2@$0@@@%355$2@%353$1@$0@@@|@|@|@@@"])
  fun op elf64_relocation_a_fupdcanon_comp x = x
    val op elf64_relocation_a_fupdcanon_comp =
    DT(((("elf_relocation",107),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_relocation",[90,91,92,102])]),["DISK_THM"]),
       [read"%204%204%167%112%167%96%235%414%355$0@@%357$1@@@%414%357$1@@%355$0@@@|@|@@%166%117%167%112%167%96%231%413%355$0@@%413%357$1@@$2@@@%413%357$1@@%413%355$0@@$2@@@|@|@|@@@%204%204%167%112%167%96%235%414%353$0@@%357$1@@@%414%357$1@@%353$0@@@|@|@@%166%117%167%112%167%96%231%413%353$0@@%413%357$1@@$2@@@%413%357$1@@%413%353$0@@$2@@@|@|@|@@@%204%167%112%167%96%235%414%353$0@@%355$1@@@%414%355$1@@%353$0@@@|@|@@%166%117%167%112%167%96%231%413%353$0@@%413%355$1@@$2@@@%413%355$1@@%413%353$0@@$2@@@|@|@|@@@@"])
  fun op elf64_relocation_a_component_equality x = x
    val op elf64_relocation_a_component_equality =
    DT(((("elf_relocation",108),
        [("bool",[25,26,51,56,63,181]),("elf_relocation",[90,91,92,98]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%161%61%161%65%209%215$1@$0@@%204%210%356$1@@%356$0@@@%204%210%354$1@@%354$0@@@%210%352$1@@%352$0@@@@@|@|@"])
  fun op elf64_relocation_a_updates_eq_literal x = x
    val op elf64_relocation_a_updates_eq_literal =
    DT(((("elf_relocation",109),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_relocation",[90,91,92,102])]),["DISK_THM"]),
       [read"%161%57%156%46%156%40%156%38%215%357%296$2@@%355%296$1@@%353%296$0@@$3@@@@%357%296$2@@%355%296$1@@%353%296$0@@%267@@@@|@|@|@|@"])
  fun op elf64_relocation_a_literal_nchotomy x = x
    val op elf64_relocation_a_literal_nchotomy =
    DT(((("elf_relocation",110),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_relocation",[90,91,92,102]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%161%57%248%46%248%40%248%38%215$3@%357%296$2@@%355%296$1@@%353%296$0@@%267@@@@|@|@|@|@"])
  fun op FORALL_elf64_relocation_a x = x
    val op FORALL_elf64_relocation_a =
    DT(((("elf_relocation",111),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_relocation",[90,91,92,102]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%176%15%209%161%57$1$0@|@@%156%46%156%40%156%38$3%357%296$2@@%355%296$1@@%353%296$0@@%267@@@@|@|@|@@|@"])
  fun op EXISTS_elf64_relocation_a x = x
    val op EXISTS_elf64_relocation_a =
    DT(((("elf_relocation",112),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_relocation",[90,91,92,102]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%176%15%209%253%57$1$0@|@@%248%46%248%40%248%38$3%357%296$2@@%355%296$1@@%353%296$0@@%267@@@@|@|@|@@|@"])
  fun op elf64_relocation_a_literal_11 x = x
    val op elf64_relocation_a_literal_11 =
    DT(((("elf_relocation",113),
        [("combin",[12]),("elf_relocation",[103,108])]),["DISK_THM"]),
       [read"%156%48%156%42%156%46%156%50%156%44%156%52%209%215%357%296$5@@%355%296$4@@%353%296$3@@%267@@@@%357%296$2@@%355%296$1@@%353%296$0@@%267@@@@@%204%210$5@$2@@%204%210$4@$1@@%210$3@$0@@@@|@|@|@|@|@|@"])
  fun op datatype_elf64_relocation_a x = x
    val op datatype_elf64_relocation_a =
    DT(((("elf_relocation",114),[("bool",[25,171])]),["DISK_THM"]),
       [read"%286%135%84@%82@%81@%80@@"])
  fun op elf64_relocation_a_11 x = x
    val op elf64_relocation_a_11 =
    DT(((("elf_relocation",115),
        [("bool",[26,51,56,63,181]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%156%19%156%27%156%31%156%21%156%29%156%33%209%215%445$5@$4@$3@@%445$2@$1@$0@@@%204%210$5@$2@@%204%210$4@$1@@%210$3@$0@@@@|@|@|@|@|@|@"])
  fun op elf64_relocation_a_case_cong x = x
    val op elf64_relocation_a_case_cong =
    DT(((("elf_relocation",116),
        [("bool",[26,181]),
         ("elf_relocation",[90,91,92,93])]),["DISK_THM"]),
       [read"%161%7%161%11%169%98%247%204%215$2@$1@@%156%19%156%27%156%31%247%215$4@%445$2@$1@$0@@@%207$3$2@$1@$0@@%103$2@$1@$0@@@|@|@|@@@%207%350$2@$0@@%350$1@%103@@@|@|@|@"])
  fun op elf64_relocation_a_nchotomy x = x
    val op elf64_relocation_a_nchotomy =
    DT(((("elf_relocation",117),
        [("bool",[26,181]),("elf_relocation",[90,91,92])]),["DISK_THM"]),
       [read"%161%70%248%38%248%40%248%46%215$3@%445$2@$1@$0@@|@|@|@|@"])
  fun op elf64_relocation_a_Axiom x = x
    val op elf64_relocation_a_Axiom =
    DT(((("elf_relocation",118),
        [("bool",[26,181]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%169%98%260%111%156%19%156%27%156%31%207$3%445$2@$1@$0@@@$4$2@$1@$0@@|@|@|@|@|@"])
  fun op elf64_relocation_a_induction x = x
    val op elf64_relocation_a_induction =
    DT(((("elf_relocation",119),
        [("bool",[26]),("elf_relocation",[90,91,92])]),["DISK_THM"]),
       [read"%176%15%247%156%38%156%40%156%46$3%445$2@$1@$0@@|@|@|@@%161%57$1$0@|@@|@"])
  fun op read_elf32_relocation_section'_ind x = x
    val op read_elf32_relocation_section'_ind =
    DT(((("elf_relocation",140),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%177%16%247%162%85%154%36%247%154%37%247%464%241%403$1@@%205@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%162%148%154%149$2$1@$0@|@|@@|@",
        read"%162%85%154%36%154%37%247%464%241%403$1@@%205@@@%17%196$2@$0@@%196$2@$1@@@|@|@|@",
        read"%329%17@"])
  fun op read_elf32_relocation_section'_def x = x
    val op read_elf32_relocation_section'_def =
    DT(((("elf_relocation",141),
        [("bool",[15,58,129]),("combin",[19]),("elf_relocation",[138,139]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%162%85%154%36%216%427$1@$0@@%274%241%403$0@@%205@@%446%303@@%380%421$1@$0@@%325%92%37%364%427$3@$0@@%144%446%278$2@$0@@|@||@@@@|@|@",
        read"%162%85%154%36%154%37%247%464%241%403$1@@%205@@@%17%196$2@$0@@%196$2@$1@@@|@|@|@",
        read"%329%17@"])
  fun op read_elf64_relocation_section'_ind x = x
    val op read_elf64_relocation_section'_ind =
    DT(((("elf_relocation",144),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%177%16%247%162%85%154%36%247%154%37%247%464%241%403$1@@%205@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%162%148%154%149$2$1@$0@|@|@@|@",
        read"%162%85%154%36%154%37%247%464%241%403$1@@%205@@@%17%196$2@$0@@%196$2@$1@@@|@|@|@",
        read"%329%17@"])
  fun op read_elf64_relocation_section'_def x = x
    val op read_elf64_relocation_section'_def =
    DT(((("elf_relocation",145),
        [("bool",[15,58,129]),("combin",[19]),("elf_relocation",[142,143]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%162%85%154%36%218%438$1@$0@@%276%241%403$0@@%205@@%448%305@@%382%432$1@$0@@%327%94%37%368%438$3@$0@@%146%448%280$2@$0@@|@||@@@@|@|@",
        read"%162%85%154%36%154%37%247%464%241%403$1@@%205@@@%17%196$2@$0@@%196$2@$1@@@|@|@|@",
        read"%329%17@"])
  fun op read_elf32_relocation_a_section'_ind x = x
    val op read_elf32_relocation_a_section'_ind =
    DT(((("elf_relocation",148),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%177%16%247%162%85%154%36%247%154%37%247%464%241%403$1@@%205@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%162%148%154%149$2$1@$0@|@|@@|@",
        read"%162%85%154%36%154%37%247%464%241%403$1@@%205@@@%17%196$2@$0@@%196$2@$1@@@|@|@|@",
        read"%329%17@"])
  fun op read_elf32_relocation_a_section'_def x = x
    val op read_elf32_relocation_a_section'_def =
    DT(((("elf_relocation",149),
        [("bool",[15,58,129]),("combin",[19]),("elf_relocation",[146,147]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%162%85%154%36%217%424$1@$0@@%275%241%403$0@@%205@@%447%304@@%381%422$1@$0@@%326%93%37%366%424$3@$0@@%145%447%279$2@$0@@|@||@@@@|@|@",
        read"%162%85%154%36%154%37%247%464%241%403$1@@%205@@@%17%196$2@$0@@%196$2@$1@@@|@|@|@",
        read"%329%17@"])
  fun op read_elf64_relocation_a_section'_ind x = x
    val op read_elf64_relocation_a_section'_ind =
    DT(((("elf_relocation",152),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%177%16%247%162%85%154%36%247%154%37%247%464%241%403$1@@%205@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%162%148%154%149$2$1@$0@|@|@@|@",
        read"%162%85%154%36%154%37%247%464%241%403$1@@%205@@@%17%196$2@$0@@%196$2@$1@@@|@|@|@",
        read"%329%17@"])
  fun op read_elf64_relocation_a_section'_def x = x
    val op read_elf64_relocation_a_section'_def =
    DT(((("elf_relocation",153),
        [("bool",[15,58,129]),("combin",[19]),("elf_relocation",[150,151]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%162%85%154%36%219%435$1@$0@@%277%241%403$0@@%205@@%449%306@@%383%433$1@$0@@%328%95%37%370%435$3@$0@@%147%449%281$2@$0@@|@||@@@@|@|@",
        read"%162%85%154%36%154%37%247%464%241%403$1@@%205@@@%17%196$2@$0@@%196$2@$1@@@|@|@|@",
        read"%329%17@"])
  end
  val _ = DB.bindl "elf_relocation"
  [("elf32_relocation_TY_DEF",elf32_relocation_TY_DEF,DB.Def),
   ("elf32_relocation_case_def",elf32_relocation_case_def,DB.Def),
   ("elf32_relocation_size_def",elf32_relocation_size_def,DB.Def),
   ("elf32_relocation_elf32_r_offset",
    elf32_relocation_elf32_r_offset,
    DB.Def),
   ("elf32_relocation_elf32_r_info",elf32_relocation_elf32_r_info,DB.Def),
   ("elf32_relocation_elf32_r_offset_fupd",
    elf32_relocation_elf32_r_offset_fupd,
    DB.Def),
   ("elf32_relocation_elf32_r_info_fupd",
    elf32_relocation_elf32_r_info_fupd,
    DB.Def),
   ("elf32_relocation_a_TY_DEF",elf32_relocation_a_TY_DEF,DB.Def),
   ("elf32_relocation_a_case_def",elf32_relocation_a_case_def,DB.Def),
   ("elf32_relocation_a_size_def",elf32_relocation_a_size_def,DB.Def),
   ("elf32_relocation_a_elf32_ra_offset",
    elf32_relocation_a_elf32_ra_offset,
    DB.Def),
   ("elf32_relocation_a_elf32_ra_info",
    elf32_relocation_a_elf32_ra_info,
    DB.Def),
   ("elf32_relocation_a_elf32_ra_addend",
    elf32_relocation_a_elf32_ra_addend,
    DB.Def),
   ("elf32_relocation_a_elf32_ra_offset_fupd",
    elf32_relocation_a_elf32_ra_offset_fupd,
    DB.Def),
   ("elf32_relocation_a_elf32_ra_info_fupd",
    elf32_relocation_a_elf32_ra_info_fupd,
    DB.Def),
   ("elf32_relocation_a_elf32_ra_addend_fupd",
    elf32_relocation_a_elf32_ra_addend_fupd,
    DB.Def), ("elf64_relocation_TY_DEF",elf64_relocation_TY_DEF,DB.Def),
   ("elf64_relocation_case_def",elf64_relocation_case_def,DB.Def),
   ("elf64_relocation_size_def",elf64_relocation_size_def,DB.Def),
   ("elf64_relocation_elf64_r_offset",
    elf64_relocation_elf64_r_offset,
    DB.Def),
   ("elf64_relocation_elf64_r_info",elf64_relocation_elf64_r_info,DB.Def),
   ("elf64_relocation_elf64_r_offset_fupd",
    elf64_relocation_elf64_r_offset_fupd,
    DB.Def),
   ("elf64_relocation_elf64_r_info_fupd",
    elf64_relocation_elf64_r_info_fupd,
    DB.Def),
   ("elf64_relocation_a_TY_DEF",elf64_relocation_a_TY_DEF,DB.Def),
   ("elf64_relocation_a_case_def",elf64_relocation_a_case_def,DB.Def),
   ("elf64_relocation_a_size_def",elf64_relocation_a_size_def,DB.Def),
   ("elf64_relocation_a_elf64_ra_offset",
    elf64_relocation_a_elf64_ra_offset,
    DB.Def),
   ("elf64_relocation_a_elf64_ra_info",
    elf64_relocation_a_elf64_ra_info,
    DB.Def),
   ("elf64_relocation_a_elf64_ra_addend",
    elf64_relocation_a_elf64_ra_addend,
    DB.Def),
   ("elf64_relocation_a_elf64_ra_offset_fupd",
    elf64_relocation_a_elf64_ra_offset_fupd,
    DB.Def),
   ("elf64_relocation_a_elf64_ra_info_fupd",
    elf64_relocation_a_elf64_ra_info_fupd,
    DB.Def),
   ("elf64_relocation_a_elf64_ra_addend_fupd",
    elf64_relocation_a_elf64_ra_addend_fupd,
    DB.Def),
   ("elf64_relocation_a_compare_def",
    elf64_relocation_a_compare_def,
    DB.Def),
   ("instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict_def",
    instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict_def,
    DB.Def),
   ("extract_elf32_relocation_r_sym_def",
    extract_elf32_relocation_r_sym_def,
    DB.Def),
   ("extract_elf64_relocation_r_sym_def",
    extract_elf64_relocation_r_sym_def,
    DB.Def),
   ("extract_elf32_relocation_r_type_def",
    extract_elf32_relocation_r_type_def,
    DB.Def),
   ("extract_elf64_relocation_r_type_def",
    extract_elf64_relocation_r_type_def,
    DB.Def),
   ("get_elf32_relocation_r_sym_def",
    get_elf32_relocation_r_sym_def,
    DB.Def),
   ("get_elf32_relocation_a_sym_def",
    get_elf32_relocation_a_sym_def,
    DB.Def),
   ("get_elf64_relocation_sym_def",get_elf64_relocation_sym_def,DB.Def),
   ("get_elf64_relocation_a_sym_def",
    get_elf64_relocation_a_sym_def,
    DB.Def),
   ("get_elf32_relocation_type_def",get_elf32_relocation_type_def,DB.Def),
   ("get_elf32_relocation_a_type_def",
    get_elf32_relocation_a_type_def,
    DB.Def),
   ("get_elf64_relocation_type_def",get_elf64_relocation_type_def,DB.Def),
   ("get_elf64_relocation_a_type_def",
    get_elf64_relocation_a_type_def,
    DB.Def),
   ("read_elf32_relocation_def",read_elf32_relocation_def,DB.Def),
   ("read_elf64_relocation_def",read_elf64_relocation_def,DB.Def),
   ("read_elf32_relocation_a_def",read_elf32_relocation_a_def,DB.Def),
   ("read_elf64_relocation_a_def",read_elf64_relocation_a_def,DB.Def),
   ("read_elf32_relocation_section'_tupled_primitive_def",
    read_elf32_relocation_section'_tupled_primitive_def,
    DB.Def),
   ("read_elf32_relocation_section'_curried_def",
    read_elf32_relocation_section'_curried_def,
    DB.Def),
   ("read_elf64_relocation_section'_tupled_primitive_def",
    read_elf64_relocation_section'_tupled_primitive_def,
    DB.Def),
   ("read_elf64_relocation_section'_curried_def",
    read_elf64_relocation_section'_curried_def,
    DB.Def),
   ("read_elf32_relocation_a_section'_tupled_primitive_def",
    read_elf32_relocation_a_section'_tupled_primitive_def,
    DB.Def),
   ("read_elf32_relocation_a_section'_curried_def",
    read_elf32_relocation_a_section'_curried_def,
    DB.Def),
   ("read_elf64_relocation_a_section'_tupled_primitive_def",
    read_elf64_relocation_a_section'_tupled_primitive_def,
    DB.Def),
   ("read_elf64_relocation_a_section'_curried_def",
    read_elf64_relocation_a_section'_curried_def,
    DB.Def),
   ("read_elf32_relocation_section_def",
    read_elf32_relocation_section_def,
    DB.Def),
   ("read_elf64_relocation_section_def",
    read_elf64_relocation_section_def,
    DB.Def),
   ("read_elf32_relocation_a_section_def",
    read_elf32_relocation_a_section_def,
    DB.Def),
   ("read_elf64_relocation_a_section_def",
    read_elf64_relocation_a_section_def,
    DB.Def),
   ("elf32_relocation_accessors",elf32_relocation_accessors,DB.Thm),
   ("elf32_relocation_fn_updates",elf32_relocation_fn_updates,DB.Thm),
   ("elf32_relocation_accfupds",elf32_relocation_accfupds,DB.Thm),
   ("elf32_relocation_fupdfupds",elf32_relocation_fupdfupds,DB.Thm),
   ("elf32_relocation_fupdfupds_comp",
    elf32_relocation_fupdfupds_comp,
    DB.Thm),
   ("elf32_relocation_fupdcanon",elf32_relocation_fupdcanon,DB.Thm),
   ("elf32_relocation_fupdcanon_comp",
    elf32_relocation_fupdcanon_comp,
    DB.Thm),
   ("elf32_relocation_component_equality",
    elf32_relocation_component_equality,
    DB.Thm),
   ("elf32_relocation_updates_eq_literal",
    elf32_relocation_updates_eq_literal,
    DB.Thm),
   ("elf32_relocation_literal_nchotomy",
    elf32_relocation_literal_nchotomy,
    DB.Thm), ("FORALL_elf32_relocation",FORALL_elf32_relocation,DB.Thm),
   ("EXISTS_elf32_relocation",EXISTS_elf32_relocation,DB.Thm),
   ("elf32_relocation_literal_11",elf32_relocation_literal_11,DB.Thm),
   ("datatype_elf32_relocation",datatype_elf32_relocation,DB.Thm),
   ("elf32_relocation_11",elf32_relocation_11,DB.Thm),
   ("elf32_relocation_case_cong",elf32_relocation_case_cong,DB.Thm),
   ("elf32_relocation_nchotomy",elf32_relocation_nchotomy,DB.Thm),
   ("elf32_relocation_Axiom",elf32_relocation_Axiom,DB.Thm),
   ("elf32_relocation_induction",elf32_relocation_induction,DB.Thm),
   ("elf32_relocation_a_accessors",elf32_relocation_a_accessors,DB.Thm),
   ("elf32_relocation_a_fn_updates",elf32_relocation_a_fn_updates,DB.Thm),
   ("elf32_relocation_a_accfupds",elf32_relocation_a_accfupds,DB.Thm),
   ("elf32_relocation_a_fupdfupds",elf32_relocation_a_fupdfupds,DB.Thm),
   ("elf32_relocation_a_fupdfupds_comp",
    elf32_relocation_a_fupdfupds_comp,
    DB.Thm),
   ("elf32_relocation_a_fupdcanon",elf32_relocation_a_fupdcanon,DB.Thm),
   ("elf32_relocation_a_fupdcanon_comp",
    elf32_relocation_a_fupdcanon_comp,
    DB.Thm),
   ("elf32_relocation_a_component_equality",
    elf32_relocation_a_component_equality,
    DB.Thm),
   ("elf32_relocation_a_updates_eq_literal",
    elf32_relocation_a_updates_eq_literal,
    DB.Thm),
   ("elf32_relocation_a_literal_nchotomy",
    elf32_relocation_a_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf32_relocation_a",FORALL_elf32_relocation_a,DB.Thm),
   ("EXISTS_elf32_relocation_a",EXISTS_elf32_relocation_a,DB.Thm),
   ("elf32_relocation_a_literal_11",elf32_relocation_a_literal_11,DB.Thm),
   ("datatype_elf32_relocation_a",datatype_elf32_relocation_a,DB.Thm),
   ("elf32_relocation_a_11",elf32_relocation_a_11,DB.Thm),
   ("elf32_relocation_a_case_cong",elf32_relocation_a_case_cong,DB.Thm),
   ("elf32_relocation_a_nchotomy",elf32_relocation_a_nchotomy,DB.Thm),
   ("elf32_relocation_a_Axiom",elf32_relocation_a_Axiom,DB.Thm),
   ("elf32_relocation_a_induction",elf32_relocation_a_induction,DB.Thm),
   ("elf64_relocation_accessors",elf64_relocation_accessors,DB.Thm),
   ("elf64_relocation_fn_updates",elf64_relocation_fn_updates,DB.Thm),
   ("elf64_relocation_accfupds",elf64_relocation_accfupds,DB.Thm),
   ("elf64_relocation_fupdfupds",elf64_relocation_fupdfupds,DB.Thm),
   ("elf64_relocation_fupdfupds_comp",
    elf64_relocation_fupdfupds_comp,
    DB.Thm),
   ("elf64_relocation_fupdcanon",elf64_relocation_fupdcanon,DB.Thm),
   ("elf64_relocation_fupdcanon_comp",
    elf64_relocation_fupdcanon_comp,
    DB.Thm),
   ("elf64_relocation_component_equality",
    elf64_relocation_component_equality,
    DB.Thm),
   ("elf64_relocation_updates_eq_literal",
    elf64_relocation_updates_eq_literal,
    DB.Thm),
   ("elf64_relocation_literal_nchotomy",
    elf64_relocation_literal_nchotomy,
    DB.Thm), ("FORALL_elf64_relocation",FORALL_elf64_relocation,DB.Thm),
   ("EXISTS_elf64_relocation",EXISTS_elf64_relocation,DB.Thm),
   ("elf64_relocation_literal_11",elf64_relocation_literal_11,DB.Thm),
   ("datatype_elf64_relocation",datatype_elf64_relocation,DB.Thm),
   ("elf64_relocation_11",elf64_relocation_11,DB.Thm),
   ("elf64_relocation_case_cong",elf64_relocation_case_cong,DB.Thm),
   ("elf64_relocation_nchotomy",elf64_relocation_nchotomy,DB.Thm),
   ("elf64_relocation_Axiom",elf64_relocation_Axiom,DB.Thm),
   ("elf64_relocation_induction",elf64_relocation_induction,DB.Thm),
   ("elf64_relocation_a_accessors",elf64_relocation_a_accessors,DB.Thm),
   ("elf64_relocation_a_fn_updates",elf64_relocation_a_fn_updates,DB.Thm),
   ("elf64_relocation_a_accfupds",elf64_relocation_a_accfupds,DB.Thm),
   ("elf64_relocation_a_fupdfupds",elf64_relocation_a_fupdfupds,DB.Thm),
   ("elf64_relocation_a_fupdfupds_comp",
    elf64_relocation_a_fupdfupds_comp,
    DB.Thm),
   ("elf64_relocation_a_fupdcanon",elf64_relocation_a_fupdcanon,DB.Thm),
   ("elf64_relocation_a_fupdcanon_comp",
    elf64_relocation_a_fupdcanon_comp,
    DB.Thm),
   ("elf64_relocation_a_component_equality",
    elf64_relocation_a_component_equality,
    DB.Thm),
   ("elf64_relocation_a_updates_eq_literal",
    elf64_relocation_a_updates_eq_literal,
    DB.Thm),
   ("elf64_relocation_a_literal_nchotomy",
    elf64_relocation_a_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf64_relocation_a",FORALL_elf64_relocation_a,DB.Thm),
   ("EXISTS_elf64_relocation_a",EXISTS_elf64_relocation_a,DB.Thm),
   ("elf64_relocation_a_literal_11",elf64_relocation_a_literal_11,DB.Thm),
   ("datatype_elf64_relocation_a",datatype_elf64_relocation_a,DB.Thm),
   ("elf64_relocation_a_11",elf64_relocation_a_11,DB.Thm),
   ("elf64_relocation_a_case_cong",elf64_relocation_a_case_cong,DB.Thm),
   ("elf64_relocation_a_nchotomy",elf64_relocation_a_nchotomy,DB.Thm),
   ("elf64_relocation_a_Axiom",elf64_relocation_a_Axiom,DB.Thm),
   ("elf64_relocation_a_induction",elf64_relocation_a_induction,DB.Thm),
   ("read_elf32_relocation_section'_ind",
    read_elf32_relocation_section'_ind,
    DB.Thm),
   ("read_elf32_relocation_section'_def",
    read_elf32_relocation_section'_def,
    DB.Thm),
   ("read_elf64_relocation_section'_ind",
    read_elf64_relocation_section'_ind,
    DB.Thm),
   ("read_elf64_relocation_section'_def",
    read_elf64_relocation_section'_def,
    DB.Thm),
   ("read_elf32_relocation_a_section'_ind",
    read_elf32_relocation_a_section'_ind,
    DB.Thm),
   ("read_elf32_relocation_a_section'_def",
    read_elf32_relocation_a_section'_def,
    DB.Thm),
   ("read_elf64_relocation_a_section'_ind",
    read_elf64_relocation_a_section'_ind,
    DB.Thm),
   ("read_elf64_relocation_a_section'_def",
    read_elf64_relocation_a_section'_def,
    DB.Thm)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("lem_setTheory.lem_set_grammars",
                          lem_setTheory.lem_set_grammars),
                         ("elf_types_native_uintTheory.elf_types_native_uint_grammars",
                          elf_types_native_uintTheory.elf_types_native_uint_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms temp_add_type "elf32_relocation"
  val _ = update_grms temp_add_type "elf32_relocation"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_relocation", (Term.prim_mk_const { Name = "recordtype.elf32_relocation", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_relocation", (Term.prim_mk_const { Name = "recordtype.elf32_relocation", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_CASE", (Term.prim_mk_const { Name = "elf32_relocation_CASE", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_size", (Term.prim_mk_const { Name = "elf32_relocation_size", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_elf32_r_offset", (Term.prim_mk_const { Name = "elf32_relocation_elf32_r_offset", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_elf32_r_info", (Term.prim_mk_const { Name = "elf32_relocation_elf32_r_info", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_elf32_r_offset_fupd", (Term.prim_mk_const { Name = "elf32_relocation_elf32_r_offset_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_elf32_r_info_fupd", (Term.prim_mk_const { Name = "elf32_relocation_elf32_r_info_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_r_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_relocation$elf32_relocation)). elf_relocation$elf32_relocation_elf32_r_offset rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_r_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_relocation$elf32_relocation)). elf_relocation$elf32_relocation_elf32_r_info rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_r_offset_fupd", (Term.prim_mk_const { Name = "elf32_relocation_elf32_r_offset_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_r_info_fupd", (Term.prim_mk_const { Name = "elf32_relocation_elf32_r_info_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_r_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_relocation$elf32_relocation)). elf_relocation$elf32_relocation_elf32_r_offset_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_r_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_relocation$elf32_relocation)). elf_relocation$elf32_relocation_elf32_r_info_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation", (Term.prim_mk_const { Name = "recordtype.elf32_relocation", Thy = "elf_relocation"}))
  val _ = update_grms temp_add_type "elf32_relocation_a"
  val _ = update_grms temp_add_type "elf32_relocation_a"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_relocation_a", (Term.prim_mk_const { Name = "recordtype.elf32_relocation_a", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_relocation_a", (Term.prim_mk_const { Name = "recordtype.elf32_relocation_a", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_a_CASE", (Term.prim_mk_const { Name = "elf32_relocation_a_CASE", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_a_size", (Term.prim_mk_const { Name = "elf32_relocation_a_size", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_a_elf32_ra_offset", (Term.prim_mk_const { Name = "elf32_relocation_a_elf32_ra_offset", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_a_elf32_ra_info", (Term.prim_mk_const { Name = "elf32_relocation_a_elf32_ra_info", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_a_elf32_ra_addend", (Term.prim_mk_const { Name = "elf32_relocation_a_elf32_ra_addend", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_a_elf32_ra_offset_fupd", (Term.prim_mk_const { Name = "elf32_relocation_a_elf32_ra_offset_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_a_elf32_ra_info_fupd", (Term.prim_mk_const { Name = "elf32_relocation_a_elf32_ra_info_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_a_elf32_ra_addend_fupd", (Term.prim_mk_const { Name = "elf32_relocation_a_elf32_ra_addend_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_ra_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_relocation$elf32_relocation_a)). elf_relocation$elf32_relocation_a_elf32_ra_offset rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_ra_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_relocation$elf32_relocation_a)). elf_relocation$elf32_relocation_a_elf32_ra_info rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_ra_addend", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_relocation$elf32_relocation_a)). elf_relocation$elf32_relocation_a_elf32_ra_addend rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_ra_offset_fupd", (Term.prim_mk_const { Name = "elf32_relocation_a_elf32_ra_offset_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_ra_info_fupd", (Term.prim_mk_const { Name = "elf32_relocation_a_elf32_ra_info_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_ra_addend_fupd", (Term.prim_mk_const { Name = "elf32_relocation_a_elf32_ra_addend_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_ra_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_relocation$elf32_relocation_a)). elf_relocation$elf32_relocation_a_elf32_ra_offset_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_ra_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_relocation$elf32_relocation_a)). elf_relocation$elf32_relocation_a_elf32_ra_info_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_ra_addend", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_relocation$elf32_relocation_a)). elf_relocation$elf32_relocation_a_elf32_ra_addend_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_relocation_a", (Term.prim_mk_const { Name = "recordtype.elf32_relocation_a", Thy = "elf_relocation"}))
  val _ = update_grms temp_add_type "elf64_relocation"
  val _ = update_grms temp_add_type "elf64_relocation"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_relocation", (Term.prim_mk_const { Name = "recordtype.elf64_relocation", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_relocation", (Term.prim_mk_const { Name = "recordtype.elf64_relocation", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_CASE", (Term.prim_mk_const { Name = "elf64_relocation_CASE", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_size", (Term.prim_mk_const { Name = "elf64_relocation_size", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_elf64_r_offset", (Term.prim_mk_const { Name = "elf64_relocation_elf64_r_offset", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_elf64_r_info", (Term.prim_mk_const { Name = "elf64_relocation_elf64_r_info", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_elf64_r_offset_fupd", (Term.prim_mk_const { Name = "elf64_relocation_elf64_r_offset_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_elf64_r_info_fupd", (Term.prim_mk_const { Name = "elf64_relocation_elf64_r_info_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_r_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_relocation$elf64_relocation)). elf_relocation$elf64_relocation_elf64_r_offset rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_r_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_relocation$elf64_relocation)). elf_relocation$elf64_relocation_elf64_r_info rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_r_offset_fupd", (Term.prim_mk_const { Name = "elf64_relocation_elf64_r_offset_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_r_info_fupd", (Term.prim_mk_const { Name = "elf64_relocation_elf64_r_info_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_r_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_relocation$elf64_relocation)). elf_relocation$elf64_relocation_elf64_r_offset_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_r_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_relocation$elf64_relocation)). elf_relocation$elf64_relocation_elf64_r_info_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation", (Term.prim_mk_const { Name = "recordtype.elf64_relocation", Thy = "elf_relocation"}))
  val _ = update_grms temp_add_type "elf64_relocation_a"
  val _ = update_grms temp_add_type "elf64_relocation_a"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_relocation_a", (Term.prim_mk_const { Name = "recordtype.elf64_relocation_a", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_relocation_a", (Term.prim_mk_const { Name = "recordtype.elf64_relocation_a", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_a_CASE", (Term.prim_mk_const { Name = "elf64_relocation_a_CASE", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_a_size", (Term.prim_mk_const { Name = "elf64_relocation_a_size", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_a_elf64_ra_offset", (Term.prim_mk_const { Name = "elf64_relocation_a_elf64_ra_offset", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_a_elf64_ra_info", (Term.prim_mk_const { Name = "elf64_relocation_a_elf64_ra_info", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_a_elf64_ra_addend", (Term.prim_mk_const { Name = "elf64_relocation_a_elf64_ra_addend", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_a_elf64_ra_offset_fupd", (Term.prim_mk_const { Name = "elf64_relocation_a_elf64_ra_offset_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_a_elf64_ra_info_fupd", (Term.prim_mk_const { Name = "elf64_relocation_a_elf64_ra_info_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_a_elf64_ra_addend_fupd", (Term.prim_mk_const { Name = "elf64_relocation_a_elf64_ra_addend_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_ra_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_relocation$elf64_relocation_a)). elf_relocation$elf64_relocation_a_elf64_ra_offset rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_ra_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_relocation$elf64_relocation_a)). elf_relocation$elf64_relocation_a_elf64_ra_info rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_ra_addend", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_relocation$elf64_relocation_a)). elf_relocation$elf64_relocation_a_elf64_ra_addend rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_ra_offset_fupd", (Term.prim_mk_const { Name = "elf64_relocation_a_elf64_ra_offset_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_ra_info_fupd", (Term.prim_mk_const { Name = "elf64_relocation_a_elf64_ra_info_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_ra_addend_fupd", (Term.prim_mk_const { Name = "elf64_relocation_a_elf64_ra_addend_fupd", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_ra_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_relocation$elf64_relocation_a)). elf_relocation$elf64_relocation_a_elf64_ra_offset_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_ra_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_relocation$elf64_relocation_a)). elf_relocation$elf64_relocation_a_elf64_ra_info_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_ra_addend", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_relocation$elf64_relocation_a)). elf_relocation$elf64_relocation_a_elf64_ra_addend_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_a", (Term.prim_mk_const { Name = "recordtype.elf64_relocation_a", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_a_compare", (Term.prim_mk_const { Name = "elf64_relocation_a_compare", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_relocation_a_compare", (Term.prim_mk_const { Name = "elf64_relocation_a_compare", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("extract_elf32_relocation_r_sym", (Term.prim_mk_const { Name = "extract_elf32_relocation_r_sym", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("extract_elf32_relocation_r_sym", (Term.prim_mk_const { Name = "extract_elf32_relocation_r_sym", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("extract_elf64_relocation_r_sym", (Term.prim_mk_const { Name = "extract_elf64_relocation_r_sym", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("extract_elf64_relocation_r_sym", (Term.prim_mk_const { Name = "extract_elf64_relocation_r_sym", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("extract_elf32_relocation_r_type", (Term.prim_mk_const { Name = "extract_elf32_relocation_r_type", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("extract_elf32_relocation_r_type", (Term.prim_mk_const { Name = "extract_elf32_relocation_r_type", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("extract_elf64_relocation_r_type", (Term.prim_mk_const { Name = "extract_elf64_relocation_r_type", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("extract_elf64_relocation_r_type", (Term.prim_mk_const { Name = "extract_elf64_relocation_r_type", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_relocation_r_sym", (Term.prim_mk_const { Name = "get_elf32_relocation_r_sym", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_relocation_r_sym", (Term.prim_mk_const { Name = "get_elf32_relocation_r_sym", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_relocation_a_sym", (Term.prim_mk_const { Name = "get_elf32_relocation_a_sym", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_relocation_a_sym", (Term.prim_mk_const { Name = "get_elf32_relocation_a_sym", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_relocation_sym", (Term.prim_mk_const { Name = "get_elf64_relocation_sym", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_relocation_sym", (Term.prim_mk_const { Name = "get_elf64_relocation_sym", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_relocation_a_sym", (Term.prim_mk_const { Name = "get_elf64_relocation_a_sym", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_relocation_a_sym", (Term.prim_mk_const { Name = "get_elf64_relocation_a_sym", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_relocation_type", (Term.prim_mk_const { Name = "get_elf32_relocation_type", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_relocation_type", (Term.prim_mk_const { Name = "get_elf32_relocation_type", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_relocation_a_type", (Term.prim_mk_const { Name = "get_elf32_relocation_a_type", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_relocation_a_type", (Term.prim_mk_const { Name = "get_elf32_relocation_a_type", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_relocation_type", (Term.prim_mk_const { Name = "get_elf64_relocation_type", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_relocation_type", (Term.prim_mk_const { Name = "get_elf64_relocation_type", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_relocation_a_type", (Term.prim_mk_const { Name = "get_elf64_relocation_a_type", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_relocation_a_type", (Term.prim_mk_const { Name = "get_elf64_relocation_a_type", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation", (Term.prim_mk_const { Name = "read_elf32_relocation", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation", (Term.prim_mk_const { Name = "read_elf32_relocation", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation", (Term.prim_mk_const { Name = "read_elf64_relocation", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation", (Term.prim_mk_const { Name = "read_elf64_relocation", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_a", (Term.prim_mk_const { Name = "read_elf32_relocation_a", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_a", (Term.prim_mk_const { Name = "read_elf32_relocation_a", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_a", (Term.prim_mk_const { Name = "read_elf64_relocation_a", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_a", (Term.prim_mk_const { Name = "read_elf64_relocation_a", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_section'_tupled", (Term.prim_mk_const { Name = "read_elf32_relocation_section'_tupled", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_section'_tupled", (Term.prim_mk_const { Name = "read_elf32_relocation_section'_tupled", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_section'", (Term.prim_mk_const { Name = "read_elf32_relocation_section'", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_section'", (Term.prim_mk_const { Name = "read_elf32_relocation_section'", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_section'_tupled", (Term.prim_mk_const { Name = "read_elf64_relocation_section'_tupled", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_section'_tupled", (Term.prim_mk_const { Name = "read_elf64_relocation_section'_tupled", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_section'", (Term.prim_mk_const { Name = "read_elf64_relocation_section'", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_section'", (Term.prim_mk_const { Name = "read_elf64_relocation_section'", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_a_section'_tupled", (Term.prim_mk_const { Name = "read_elf32_relocation_a_section'_tupled", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_a_section'_tupled", (Term.prim_mk_const { Name = "read_elf32_relocation_a_section'_tupled", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_a_section'", (Term.prim_mk_const { Name = "read_elf32_relocation_a_section'", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_a_section'", (Term.prim_mk_const { Name = "read_elf32_relocation_a_section'", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_a_section'_tupled", (Term.prim_mk_const { Name = "read_elf64_relocation_a_section'_tupled", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_a_section'_tupled", (Term.prim_mk_const { Name = "read_elf64_relocation_a_section'_tupled", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_a_section'", (Term.prim_mk_const { Name = "read_elf64_relocation_a_section'", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_a_section'", (Term.prim_mk_const { Name = "read_elf64_relocation_a_section'", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_section", (Term.prim_mk_const { Name = "read_elf32_relocation_section", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_section", (Term.prim_mk_const { Name = "read_elf32_relocation_section", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_section", (Term.prim_mk_const { Name = "read_elf64_relocation_section", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_section", (Term.prim_mk_const { Name = "read_elf64_relocation_section", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_a_section", (Term.prim_mk_const { Name = "read_elf32_relocation_a_section", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_a_section", (Term.prim_mk_const { Name = "read_elf32_relocation_a_section", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_a_section", (Term.prim_mk_const { Name = "read_elf64_relocation_a_section", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_a_section", (Term.prim_mk_const { Name = "read_elf64_relocation_a_section", Thy = "elf_relocation"}))
  val elf_relocation_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG elf32_relocation_Axiom,
           case_def=elf32_relocation_case_def,
           case_cong=elf32_relocation_case_cong,
           induction=ORIG elf32_relocation_induction,
           nchotomy=elf32_relocation_nchotomy,
           size=SOME(Parse.Term`(elf_relocation$elf32_relocation_size) :(elf_relocation$elf32_relocation) -> (num$num)`,
                     ORIG elf32_relocation_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf32_relocation_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf32_r_offset",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"one" "one" []]]]]]]),
 ("elf32_r_info",T"fcp" "cart"
                  [bool,
                   T"fcp" "bit0"
                    [T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"one" "one" []]]]]]])] end,
           accessors=Drule.CONJUNCTS elf32_relocation_accessors,
           updates=Drule.CONJUNCTS elf32_relocation_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf32_relocation_accessors, elf32_relocation_updates_eq_literal, elf32_relocation_accfupds, elf32_relocation_fupdfupds, elf32_relocation_literal_11, elf32_relocation_fupdfupds_comp, elf32_relocation_fupdcanon, elf32_relocation_fupdcanon_comp] tyinfo0
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
          {ax=ORIG elf32_relocation_a_Axiom,
           case_def=elf32_relocation_a_case_def,
           case_cong=elf32_relocation_a_case_cong,
           induction=ORIG elf32_relocation_a_induction,
           nchotomy=elf32_relocation_a_nchotomy,
           size=SOME(Parse.Term`(elf_relocation$elf32_relocation_a_size) :(elf_relocation$elf32_relocation_a) -> (num$num)`,
                     ORIG elf32_relocation_a_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf32_relocation_a_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf32_ra_offset",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]),
 ("elf32_ra_info",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_ra_addend",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]])] end,
           accessors=Drule.CONJUNCTS elf32_relocation_a_accessors,
           updates=Drule.CONJUNCTS elf32_relocation_a_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf32_relocation_a_accessors, elf32_relocation_a_updates_eq_literal, elf32_relocation_a_accfupds, elf32_relocation_a_fupdfupds, elf32_relocation_a_literal_11, elf32_relocation_a_fupdfupds_comp, elf32_relocation_a_fupdcanon, elf32_relocation_a_fupdcanon_comp] tyinfo0
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
          {ax=ORIG elf64_relocation_Axiom,
           case_def=elf64_relocation_case_def,
           case_cong=elf64_relocation_case_cong,
           induction=ORIG elf64_relocation_induction,
           nchotomy=elf64_relocation_nchotomy,
           size=SOME(Parse.Term`(elf_relocation$elf64_relocation_size) :(elf_relocation$elf64_relocation) -> (num$num)`,
                     ORIG elf64_relocation_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf64_relocation_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf64_r_offset",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"one" "one" []]]]]]]]),
 ("elf64_r_info",T"fcp" "cart"
                  [bool,
                   T"fcp" "bit0"
                    [T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"one" "one" []]]]]]]])] end,
           accessors=Drule.CONJUNCTS elf64_relocation_accessors,
           updates=Drule.CONJUNCTS elf64_relocation_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf64_relocation_accessors, elf64_relocation_updates_eq_literal, elf64_relocation_accfupds, elf64_relocation_fupdfupds, elf64_relocation_literal_11, elf64_relocation_fupdfupds_comp, elf64_relocation_fupdcanon, elf64_relocation_fupdcanon_comp] tyinfo0
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
          {ax=ORIG elf64_relocation_a_Axiom,
           case_def=elf64_relocation_a_case_def,
           case_cong=elf64_relocation_a_case_cong,
           induction=ORIG elf64_relocation_a_induction,
           nchotomy=elf64_relocation_a_nchotomy,
           size=SOME(Parse.Term`(elf_relocation$elf64_relocation_a_size) :(elf_relocation$elf64_relocation_a) -> (num$num)`,
                     ORIG elf64_relocation_a_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf64_relocation_a_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf64_ra_offset",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"fcp" "bit0"
                                 [T"one" "one" []]]]]]]]),
 ("elf64_ra_info",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]]),
 ("elf64_ra_addend",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"fcp" "bit0"
                                 [T"one" "one"
                                   []]]]]]]])] end,
           accessors=Drule.CONJUNCTS elf64_relocation_a_accessors,
           updates=Drule.CONJUNCTS elf64_relocation_a_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf64_relocation_a_accessors, elf64_relocation_a_updates_eq_literal, elf64_relocation_a_accfupds, elf64_relocation_a_fupdfupds, elf64_relocation_a_literal_11, elf64_relocation_a_fupdfupds_comp, elf64_relocation_a_fupdcanon, elf64_relocation_a_fupdcanon_comp] tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "elf_relocation",
    thydataty = "compute",
    data =
        "elf_relocation.elf64_relocation_a_compare_def elf_relocation.read_elf64_relocation_section_def elf_relocation.read_elf64_relocation_a_section_def elf_relocation.read_elf32_relocation_a_section_def elf_relocation.read_elf32_relocation_section_def elf_relocation.read_elf64_relocation_a_def elf_relocation.read_elf32_relocation_a_def elf_relocation.read_elf32_relocation_def elf_relocation.read_elf64_relocation_def elf_relocation.get_elf64_relocation_type_def elf_relocation.get_elf64_relocation_a_type_def elf_relocation.get_elf32_relocation_type_def elf_relocation.get_elf32_relocation_a_type_def elf_relocation.get_elf64_relocation_a_sym_def elf_relocation.get_elf64_relocation_sym_def elf_relocation.extract_elf64_relocation_r_type_def elf_relocation.get_elf32_relocation_a_sym_def elf_relocation.get_elf32_relocation_r_sym_def elf_relocation.extract_elf32_relocation_r_sym_def elf_relocation.extract_elf32_relocation_r_type_def elf_relocation.extract_elf64_relocation_r_sym_def elf_relocation.instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "elf_relocation"
end
