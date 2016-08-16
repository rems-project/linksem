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
          Arbnum.fromString "1471355162",
          Arbnum.fromString "221266")
          [("elf_types_native_uint",
           Arbnum.fromString "1471355144",
           Arbnum.fromString "97434"),
           ("lem_set",
           Arbnum.fromString "1471269250",
           Arbnum.fromString "313480")];
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
   ID("list", "list"), ID("byte_sequence", "byte_sequence"),
   ID("endianness", "endianness"), ID("pair", "prod"), ID("num", "num"),
   ID("lem_basic_classes", "Ord_class"),
   ID("lem_basic_classes", "ordering"), ID("ind_type", "recspace"),
   ID("min", "ind"), ID("bool", "!"), ID("arithmetic", "*"),
   ID("pair", ","), ID("integer", "int"), ID("arithmetic", "-"),
   ID("bool", "/\\"), ID("num", "0"), ID("prim_rec", "<"), ID("min", "="),
   ID("min", "==>"), ID("bool", "?"), ID("bool", "ARB"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("bool", "COND"), ID("list", "CONS"),
   ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("pred_set", "EMPTY"), ID("lem_basic_classes", "EQ"),
   ID("lem_basic_classes", "GT"), ID("bool", "IN"),
   ID("pred_set", "INSERT"), ID("combin", "K"), ID("bool", "LET"),
   ID("lem_basic_classes", "LT"), ID("arithmetic", "MOD"),
   ID("list", "NIL"), ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("bool", "TYPE_DEFINITION"), ID("pair", "UNCURRY"),
   ID("relation", "WF"), ID("arithmetic", "ZERO"),
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
   ID("words", "n2w"), ID("combin", "o"),
   ID("byte_sequence", "partition0"),
   ID("elf_types_native_uint", "read_elf32_addr"),
   ID("elf_relocation", "read_elf32_relocation"),
   ID("elf_relocation", "read_elf32_relocation_a"),
   ID("elf_relocation", "read_elf32_relocation_a_section"),
   ID("elf_relocation", "read_elf32_relocation_a_section'"),
   ID("elf_relocation", "read_elf32_relocation_section"),
   ID("elf_relocation", "read_elf32_relocation_section'"),
   ID("elf_types_native_uint", "read_elf32_sword"),
   ID("elf_types_native_uint", "read_elf32_word"),
   ID("elf_types_native_uint", "read_elf64_addr"),
   ID("elf_relocation", "read_elf64_relocation"),
   ID("elf_relocation", "read_elf64_relocation_a"),
   ID("elf_relocation", "read_elf64_relocation_a_section"),
   ID("elf_relocation", "read_elf64_relocation_a_section'"),
   ID("elf_relocation", "read_elf64_relocation_section"),
   ID("elf_relocation", "read_elf64_relocation_section'"),
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
   TYOP [0, 17, 22], TYOP [10, 13], TYOP [9, 24], TYOP [11],
   TYOP [0, 26, 25], TYOP [12], TYOP [0, 28, 27], TYOP [13, 24, 26],
   TYOP [9, 30], TYOP [0, 26, 31], TYOP [0, 28, 32], TYOP [14],
   TYOP [0, 34, 33], TYOP [10, 0], TYOP [9, 36], TYOP [0, 26, 37],
   TYOP [0, 28, 38], TYOP [13, 36, 26], TYOP [9, 40], TYOP [0, 26, 41],
   TYOP [0, 28, 42], TYOP [0, 34, 43], TYOP [13, 0, 26], TYOP [9, 45],
   TYOP [0, 26, 46], TYOP [0, 28, 47], TYOP [13, 13, 26], TYOP [9, 49],
   TYOP [0, 26, 50], TYOP [0, 28, 51], TYOP [10, 21], TYOP [9, 53],
   TYOP [0, 26, 54], TYOP [0, 28, 55], TYOP [13, 53, 26], TYOP [9, 57],
   TYOP [0, 26, 58], TYOP [0, 28, 59], TYOP [0, 34, 60], TYOP [10, 16],
   TYOP [9, 62], TYOP [0, 26, 63], TYOP [0, 28, 64], TYOP [13, 62, 26],
   TYOP [9, 66], TYOP [0, 26, 67], TYOP [0, 28, 68], TYOP [0, 34, 69],
   TYOP [13, 16, 26], TYOP [9, 71], TYOP [0, 26, 72], TYOP [0, 28, 73],
   TYOP [13, 21, 26], TYOP [9, 75], TYOP [0, 26, 76], TYOP [0, 28, 77],
   TYOP [15, 0], TYOP [0, 13, 34], TYOP [0, 0, 34], TYOP [0, 21, 34],
   TYOP [0, 16, 34], TYOP [0, 9, 34], TYV "'a", TYOP [2, 8, 85],
   TYOP [0, 86, 34], TYOP [0, 13, 13], TYOP [0, 9, 9], TYOP [0, 89, 88],
   TYOP [0, 13, 9], TYOP [0, 0, 0], TYOP [0, 89, 92], TYOP [0, 0, 9],
   TYOP [16], TYOP [0, 0, 95], TYOP [0, 0, 96], TYOP [0, 9, 85],
   TYOP [0, 9, 98], TYOP [0, 9, 99], TYOP [0, 100, 85], TYOP [0, 0, 101],
   TYOP [0, 99, 85], TYOP [0, 13, 103], TYOP [0, 21, 21], TYOP [0, 17, 17],
   TYOP [0, 106, 105], TYOP [0, 21, 17], TYOP [0, 16, 16],
   TYOP [0, 106, 109], TYOP [0, 16, 17], TYOP [0, 17, 85],
   TYOP [0, 17, 112], TYOP [0, 17, 113], TYOP [0, 114, 85],
   TYOP [0, 16, 115], TYOP [0, 113, 85], TYOP [0, 21, 117],
   TYOP [13, 17, 17], TYOP [17, 119], TYOP [0, 120, 8], TYOP [13, 17, 119],
   TYOP [17, 122], TYOP [0, 123, 8], TYOP [13, 9, 9], TYOP [17, 125],
   TYOP [0, 126, 8], TYOP [13, 9, 125], TYOP [17, 128], TYOP [0, 129, 8],
   TYOP [0, 21, 8], TYOP [0, 16, 8], TYOP [0, 13, 8], TYOP [0, 0, 8],
   TYOP [0, 26, 8], TYOP [0, 28, 135], TYOP [13, 28, 26], TYOP [0, 137, 8],
   TYOP [0, 137, 138], TYOP [18], TYOP [0, 21, 85], TYOP [0, 16, 85],
   TYOP [0, 13, 85], TYOP [0, 0, 85], TYOP [0, 85, 21], TYOP [0, 85, 16],
   TYOP [0, 85, 13], TYOP [0, 85, 0], TYOP [0, 9, 8], TYOP [0, 9, 149],
   TYOP [0, 140, 150], TYOP [0, 9, 150], TYOP [0, 140, 152],
   TYOP [0, 17, 8], TYOP [0, 17, 154], TYOP [0, 140, 155],
   TYOP [0, 17, 155], TYOP [0, 140, 157], TYOP [0, 21, 120],
   TYOP [0, 16, 123], TYOP [0, 13, 126], TYOP [0, 0, 129],
   TYOP [0, 135, 8], TYOP [0, 86, 8], TYOP [0, 164, 8], TYOP [0, 149, 8],
   TYOP [0, 154, 8], TYOP [0, 131, 8], TYOP [0, 132, 8], TYOP [0, 133, 8],
   TYOP [0, 134, 8], TYOP [0, 28, 8], TYOP [0, 172, 8], TYOP [0, 145, 8],
   TYOP [0, 174, 8], TYOP [0, 146, 8], TYOP [0, 176, 8], TYOP [0, 147, 8],
   TYOP [0, 178, 8], TYOP [0, 148, 8], TYOP [0, 180, 8], TYOP [0, 89, 8],
   TYOP [0, 182, 8], TYOP [0, 99, 8], TYOP [0, 184, 8], TYOP [0, 100, 8],
   TYOP [0, 186, 8], TYOP [0, 106, 8], TYOP [0, 188, 8], TYOP [0, 113, 8],
   TYOP [0, 190, 8], TYOP [0, 114, 8], TYOP [0, 192, 8], TYOP [0, 168, 8],
   TYOP [0, 169, 8], TYOP [0, 170, 8], TYOP [0, 171, 8], TYOP [0, 136, 8],
   TYOP [0, 198, 8], TYOP [0, 127, 8], TYOP [0, 200, 8], TYOP [0, 130, 8],
   TYOP [0, 202, 8], TYOP [0, 121, 8], TYOP [0, 204, 8], TYOP [0, 124, 8],
   TYOP [0, 206, 8], TYOP [0, 34, 8], TYOP [0, 208, 8], TYOP [0, 34, 34],
   TYOP [0, 34, 210], TYOP [0, 9, 125], TYOP [0, 9, 212],
   TYOP [0, 125, 128], TYOP [0, 9, 214], TYOP [0, 17, 119],
   TYOP [0, 17, 216], TYOP [0, 119, 122], TYOP [0, 17, 218],
   TYOP [0, 26, 75], TYOP [0, 21, 220], TYOP [0, 26, 71],
   TYOP [0, 16, 222], TYOP [0, 26, 49], TYOP [0, 13, 224],
   TYOP [0, 26, 45], TYOP [0, 0, 226], TYOP [0, 26, 137],
   TYOP [0, 28, 228], TYOP [0, 26, 57], TYOP [0, 53, 230],
   TYOP [0, 26, 66], TYOP [0, 62, 232], TYOP [0, 26, 30],
   TYOP [0, 24, 234], TYOP [0, 26, 40], TYOP [0, 36, 236], TYOP [22],
   TYOP [13, 34, 238], TYOP [0, 238, 239], TYOP [0, 34, 240],
   TYOP [13, 34, 239], TYOP [0, 239, 242], TYOP [0, 34, 243],
   TYOP [0, 8, 8], TYOP [0, 8, 245], TYOP [0, 34, 208], TYOP [0, 85, 8],
   TYOP [0, 85, 248], TYOP [0, 79, 8], TYOP [0, 79, 250],
   TYOP [0, 21, 131], TYOP [0, 16, 132], TYOP [0, 13, 133],
   TYOP [0, 0, 134], TYOP [0, 54, 8], TYOP [0, 54, 256], TYOP [0, 63, 8],
   TYOP [0, 63, 258], TYOP [0, 25, 8], TYOP [0, 25, 260], TYOP [0, 37, 8],
   TYOP [0, 37, 262], TYOP [0, 76, 8], TYOP [0, 76, 264], TYOP [0, 72, 8],
   TYOP [0, 72, 266], TYOP [0, 50, 8], TYOP [0, 50, 268], TYOP [0, 46, 8],
   TYOP [0, 46, 270], TYOP [0, 58, 8], TYOP [0, 58, 272], TYOP [0, 67, 8],
   TYOP [0, 67, 274], TYOP [0, 31, 8], TYOP [0, 31, 276], TYOP [0, 41, 8],
   TYOP [0, 41, 278], TYOP [0, 145, 174], TYOP [0, 146, 176],
   TYOP [0, 147, 178], TYOP [0, 148, 180], TYOP [0, 105, 8],
   TYOP [0, 105, 284], TYOP [0, 109, 8], TYOP [0, 109, 286],
   TYOP [0, 88, 8], TYOP [0, 88, 288], TYOP [0, 92, 8], TYOP [0, 92, 290],
   TYOP [0, 238, 8], TYOP [0, 238, 292], TYOP [0, 95, 8],
   TYOP [0, 95, 294], TYOP [0, 126, 127], TYOP [0, 129, 130],
   TYOP [0, 120, 121], TYOP [0, 123, 124], TYOP [0, 141, 8],
   TYOP [0, 300, 8], TYOP [0, 159, 8], TYOP [0, 302, 8], TYOP [0, 142, 8],
   TYOP [0, 304, 8], TYOP [0, 160, 8], TYOP [0, 306, 8], TYOP [0, 143, 8],
   TYOP [0, 308, 8], TYOP [0, 161, 8], TYOP [0, 310, 8], TYOP [0, 144, 8],
   TYOP [0, 312, 8], TYOP [0, 162, 8], TYOP [0, 314, 8], TYOP [0, 54, 54],
   TYOP [0, 54, 316], TYOP [0, 8, 317], TYOP [0, 63, 63],
   TYOP [0, 63, 319], TYOP [0, 8, 320], TYOP [0, 25, 25],
   TYOP [0, 25, 322], TYOP [0, 8, 323], TYOP [0, 37, 37],
   TYOP [0, 37, 325], TYOP [0, 8, 326], TYOP [0, 53, 53],
   TYOP [0, 21, 328], TYOP [0, 62, 62], TYOP [0, 16, 330],
   TYOP [0, 24, 24], TYOP [0, 13, 332], TYOP [0, 36, 36], TYOP [0, 0, 334],
   TYOP [0, 34, 126], TYOP [0, 336, 126], TYOP [0, 125, 337],
   TYOP [0, 34, 338], TYOP [0, 34, 129], TYOP [0, 340, 129],
   TYOP [0, 128, 341], TYOP [0, 34, 342], TYOP [0, 34, 120],
   TYOP [0, 344, 120], TYOP [0, 119, 345], TYOP [0, 34, 346],
   TYOP [0, 34, 123], TYOP [0, 348, 123], TYOP [0, 122, 349],
   TYOP [0, 34, 350], TYOP [0, 294, 8], TYOP [0, 95, 352],
   TYOP [0, 294, 294], TYOP [0, 95, 354], TYOP [0, 9, 89],
   TYOP [0, 17, 106], TYOP [0, 255, 255], TYOP [0, 255, 358],
   TYOP [0, 97, 97], TYOP [0, 97, 360], TYOP [0, 210, 210],
   TYOP [0, 79, 79], TYOP [0, 360, 363], TYOP [0, 358, 363],
   TYOP [0, 127, 310], TYOP [0, 130, 314], TYOP [0, 121, 302],
   TYOP [0, 124, 306], TYOP [13, 26, 26], TYOP [0, 370, 58],
   TYOP [0, 26, 59], TYOP [0, 372, 371], TYOP [0, 370, 67],
   TYOP [0, 26, 68], TYOP [0, 375, 374], TYOP [0, 370, 31],
   TYOP [0, 26, 32], TYOP [0, 378, 377], TYOP [0, 370, 41],
   TYOP [0, 26, 42], TYOP [0, 381, 380], TYOP [13, 9, 26],
   TYOP [0, 383, 50], TYOP [0, 9, 51], TYOP [0, 385, 384],
   TYOP [0, 383, 46], TYOP [0, 9, 47], TYOP [0, 388, 387],
   TYOP [13, 17, 26], TYOP [0, 390, 76], TYOP [0, 17, 77],
   TYOP [0, 392, 391], TYOP [0, 390, 72], TYOP [0, 17, 73],
   TYOP [0, 395, 394], TYOP [0, 75, 54], TYOP [0, 21, 55],
   TYOP [0, 398, 397], TYOP [0, 71, 63], TYOP [0, 16, 64],
   TYOP [0, 401, 400], TYOP [0, 49, 25], TYOP [0, 13, 27],
   TYOP [0, 404, 403], TYOP [0, 45, 37], TYOP [0, 0, 38],
   TYOP [0, 407, 406], TYOP [0, 139, 8], TYOP [0, 53, 54],
   TYOP [0, 410, 54], TYOP [0, 54, 411], TYOP [0, 53, 58],
   TYOP [0, 413, 58], TYOP [0, 54, 414], TYOP [0, 62, 63],
   TYOP [0, 416, 63], TYOP [0, 63, 417], TYOP [0, 62, 67],
   TYOP [0, 419, 67], TYOP [0, 63, 420], TYOP [0, 24, 25],
   TYOP [0, 422, 25], TYOP [0, 25, 423], TYOP [0, 24, 31],
   TYOP [0, 425, 31], TYOP [0, 25, 426], TYOP [0, 36, 37],
   TYOP [0, 428, 37], TYOP [0, 37, 429], TYOP [0, 36, 41],
   TYOP [0, 431, 41], TYOP [0, 37, 432], TYOP [0, 371, 58], TYOP [9, 370],
   TYOP [0, 435, 434], TYOP [0, 374, 67], TYOP [0, 435, 437],
   TYOP [0, 377, 31], TYOP [0, 435, 439], TYOP [0, 380, 41],
   TYOP [0, 435, 441], TYOP [0, 384, 50], TYOP [9, 383],
   TYOP [0, 444, 443], TYOP [0, 387, 46], TYOP [0, 444, 446],
   TYOP [0, 391, 76], TYOP [9, 390], TYOP [0, 449, 448], TYOP [0, 394, 72],
   TYOP [0, 449, 451], TYOP [0, 397, 54], TYOP [0, 76, 453],
   TYOP [0, 400, 63], TYOP [0, 72, 455], TYOP [0, 403, 25],
   TYOP [0, 50, 457], TYOP [0, 406, 37], TYOP [0, 46, 459],
   TYOP [0, 17, 34], TYOP [0, 238, 95], TYOP [0, 238, 462],
   TYOP [0, 293, 463], TYOP [0, 293, 464], TYOP [0, 34, 95],
   TYOP [0, 34, 466], TYOP [0, 247, 467], TYOP [0, 247, 468],
   TYOP [0, 26, 34], TYOP [0, 34, 9], TYOP [0, 89, 89], TYOP [0, 89, 472],
   TYOP [0, 106, 106], TYOP [0, 106, 474], TYOP [0, 145, 145],
   TYOP [0, 105, 476], TYOP [0, 105, 105], TYOP [0, 105, 478],
   TYOP [0, 146, 146], TYOP [0, 109, 480], TYOP [0, 109, 109],
   TYOP [0, 109, 482], TYOP [0, 147, 147], TYOP [0, 88, 484],
   TYOP [0, 88, 88], TYOP [0, 88, 486], TYOP [0, 148, 148],
   TYOP [0, 92, 488], TYOP [0, 92, 92], TYOP [0, 92, 490],
   TYOP [0, 26, 435], TYOP [0, 34, 492], TYOP [0, 26, 449],
   TYOP [0, 28, 494], TYOP [0, 26, 444], TYOP [0, 28, 496],
   TYOP [0, 75, 76], TYOP [0, 71, 72], TYOP [0, 49, 50], TYOP [0, 45, 46],
   TYOP [0, 57, 58], TYOP [0, 66, 67], TYOP [0, 30, 31], TYOP [0, 40, 41],
   TYOP [0, 242, 95], TYOP [0, 242, 506], TYOP [0, 463, 507],
   TYOP [0, 467, 508], TYOP [0, 467, 509], TYOP [0, 9, 238],
   TYOP [0, 34, 86], TYOP [0, 86, 512]]
  end
  val _ = Theory.incorporate_consts "elf_relocation" tyvector
     [("recordtype.elf64_relocation_a", 12),
      ("recordtype.elf64_relocation", 15),
      ("recordtype.elf32_relocation_a", 20),
      ("recordtype.elf32_relocation", 23),
      ("read_elf64_relocation_section'", 29),
      ("read_elf64_relocation_section", 35),
      ("read_elf64_relocation_a_section'", 39),
      ("read_elf64_relocation_a_section", 44),
      ("read_elf64_relocation_a", 48), ("read_elf64_relocation", 52),
      ("read_elf32_relocation_section'", 56),
      ("read_elf32_relocation_section", 61),
      ("read_elf32_relocation_a_section'", 65),
      ("read_elf32_relocation_a_section", 70),
      ("read_elf32_relocation_a", 74), ("read_elf32_relocation", 78),
      ("instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict", 79),
      ("get_elf64_relocation_type", 80), ("get_elf64_relocation_sym", 80),
      ("get_elf64_relocation_a_type", 81),
      ("get_elf64_relocation_a_sym", 81),
      ("get_elf32_relocation_type", 82),
      ("get_elf32_relocation_r_sym", 82),
      ("get_elf32_relocation_a_type", 83),
      ("get_elf32_relocation_a_sym", 83),
      ("extract_elf64_relocation_r_type", 84),
      ("extract_elf64_relocation_r_sym", 87),
      ("extract_elf32_relocation_r_type", 87),
      ("extract_elf32_relocation_r_sym", 87),
      ("elf64_relocation_size", 80),
      ("elf64_relocation_elf64_r_offset_fupd", 90),
      ("elf64_relocation_elf64_r_offset", 91),
      ("elf64_relocation_elf64_r_info_fupd", 90),
      ("elf64_relocation_elf64_r_info", 91),
      ("elf64_relocation_a_size", 81),
      ("elf64_relocation_a_elf64_ra_offset_fupd", 93),
      ("elf64_relocation_a_elf64_ra_offset", 94),
      ("elf64_relocation_a_elf64_ra_info_fupd", 93),
      ("elf64_relocation_a_elf64_ra_info", 94),
      ("elf64_relocation_a_elf64_ra_addend_fupd", 93),
      ("elf64_relocation_a_elf64_ra_addend", 94),
      ("elf64_relocation_a_compare", 97), ("elf64_relocation_a_CASE", 102),
      ("elf64_relocation_CASE", 104), ("elf32_relocation_size", 82),
      ("elf32_relocation_elf32_r_offset_fupd", 107),
      ("elf32_relocation_elf32_r_offset", 108),
      ("elf32_relocation_elf32_r_info_fupd", 107),
      ("elf32_relocation_elf32_r_info", 108),
      ("elf32_relocation_a_size", 83),
      ("elf32_relocation_a_elf32_ra_offset_fupd", 110),
      ("elf32_relocation_a_elf32_ra_offset", 111),
      ("elf32_relocation_a_elf32_ra_info_fupd", 110),
      ("elf32_relocation_a_elf32_ra_info", 111),
      ("elf32_relocation_a_elf32_ra_addend_fupd", 110),
      ("elf32_relocation_a_elf32_ra_addend", 111),
      ("elf32_relocation_a_CASE", 116), ("elf32_relocation_CASE", 118)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'elf32_relocation'", 121), TMV("'elf32_relocation_a'", 124),
   TMV("'elf64_relocation'", 127), TMV("'elf64_relocation_a'", 130),
   TMV("M", 21), TMV("M", 16), TMV("M", 13), TMV("M", 0), TMV("M'", 21),
   TMV("M'", 16), TMV("M'", 13), TMV("M'", 0), TMV("P", 131),
   TMV("P", 132), TMV("P", 133), TMV("P", 134), TMV("P", 136),
   TMV("R", 139), TMV("a0", 9), TMV("a0", 17), TMV("a0'", 9),
   TMV("a0'", 17), TMV("a0'", 126), TMV("a0'", 129), TMV("a0'", 120),
   TMV("a0'", 123), TMV("a1", 9), TMV("a1", 17), TMV("a1'", 9),
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
   TMV("elf32_ra_offset", 17), TMV("elf32_relocation", 140),
   TMV("elf32_relocation_a", 140), TMV("elf64_r_info", 9),
   TMV("elf64_r_offset", 9), TMV("elf64_ra_addend", 9),
   TMV("elf64_ra_info", 9), TMV("elf64_ra_offset", 9),
   TMV("elf64_relocation", 140), TMV("elf64_relocation_a", 140),
   TMV("endian", 28), TMV("ent1", 0), TMV("ent2", 0), TMV("entries", 53),
   TMV("entries", 62), TMV("entries", 24), TMV("entries", 36),
   TMV("entry", 21), TMV("entry", 16), TMV("entry", 13), TMV("entry", 0),
   TMV("f", 89), TMV("f", 99), TMV("f", 100), TMV("f", 106), TMV("f", 113),
   TMV("f", 114), TMV("f'", 99), TMV("f'", 100), TMV("f'", 113),
   TMV("f'", 114), TMV("f1", 0), TMV("f2", 0), TMV("fn", 141),
   TMV("fn", 142), TMV("fn", 143), TMV("fn", 144), TMV("g", 89),
   TMV("g", 106), TMV("h", 145), TMV("h", 146), TMV("h", 147),
   TMV("h", 148), TMV("magic", 34), TMV("n", 34), TMV("r", 21),
   TMV("r", 16), TMV("r", 13), TMV("r", 0), TMV("r_addend", 9),
   TMV("r_addend", 17), TMV("r_info", 9), TMV("r_info", 17),
   TMV("r_offset", 9), TMV("r_offset", 17), TMV("record", 151),
   TMV("record", 153), TMV("record", 156), TMV("record", 158),
   TMV("rep", 159), TMV("rep", 160), TMV("rep", 161), TMV("rep", 162),
   TMV("rest", 26), TMV("table_size", 34), TMV("tail", 53),
   TMV("tail", 62), TMV("tail", 24), TMV("tail", 36), TMV("v", 28),
   TMV("v1", 26), TMV("w", 86), TMV("w", 9), TMC(19, 163), TMC(19, 165),
   TMC(19, 166), TMC(19, 167), TMC(19, 168), TMC(19, 169), TMC(19, 170),
   TMC(19, 171), TMC(19, 173), TMC(19, 175), TMC(19, 177), TMC(19, 179),
   TMC(19, 181), TMC(19, 183), TMC(19, 185), TMC(19, 187), TMC(19, 189),
   TMC(19, 191), TMC(19, 193), TMC(19, 194), TMC(19, 195), TMC(19, 196),
   TMC(19, 197), TMC(19, 199), TMC(19, 201), TMC(19, 203), TMC(19, 205),
   TMC(19, 207), TMC(19, 209), TMC(19, 200), TMC(19, 202), TMC(19, 204),
   TMC(19, 206), TMC(20, 211), TMC(21, 213), TMC(21, 215), TMC(21, 217),
   TMC(21, 219), TMC(21, 221), TMC(21, 223), TMC(21, 225), TMC(21, 227),
   TMC(21, 229), TMC(21, 231), TMC(21, 233), TMC(21, 235), TMC(21, 237),
   TMC(21, 241), TMC(21, 244), TMC(23, 211), TMC(24, 246), TMC(25, 34),
   TMC(26, 247), TMC(27, 249), TMC(27, 251), TMC(27, 246), TMC(27, 150),
   TMC(27, 155), TMC(27, 252), TMC(27, 253), TMC(27, 254), TMC(27, 255),
   TMC(27, 257), TMC(27, 259), TMC(27, 261), TMC(27, 263), TMC(27, 265),
   TMC(27, 267), TMC(27, 269), TMC(27, 271), TMC(27, 273), TMC(27, 275),
   TMC(27, 277), TMC(27, 279), TMC(27, 280), TMC(27, 281), TMC(27, 282),
   TMC(27, 283), TMC(27, 285), TMC(27, 287), TMC(27, 289), TMC(27, 291),
   TMC(27, 293), TMC(27, 247), TMC(27, 295), TMC(27, 296), TMC(27, 297),
   TMC(27, 298), TMC(27, 299), TMC(28, 246), TMC(29, 166), TMC(29, 167),
   TMC(29, 168), TMC(29, 169), TMC(29, 170), TMC(29, 171), TMC(29, 301),
   TMC(29, 303), TMC(29, 305), TMC(29, 307), TMC(29, 309), TMC(29, 311),
   TMC(29, 313), TMC(29, 315), TMC(30, 79), TMC(30, 21), TMC(30, 16),
   TMC(30, 13), TMC(30, 0), TMC(31, 210), TMC(32, 210), TMC(33, 126),
   TMC(33, 129), TMC(33, 120), TMC(33, 123), TMC(34, 318), TMC(34, 321),
   TMC(34, 324), TMC(34, 327), TMC(35, 329), TMC(35, 331), TMC(35, 333),
   TMC(35, 335), TMC(36, 339), TMC(36, 343), TMC(36, 347), TMC(36, 351),
   TMC(37, 245), TMC(38, 294), TMC(39, 95), TMC(40, 95), TMC(41, 353),
   TMC(42, 355), TMC(43, 356), TMC(43, 357), TMC(43, 359), TMC(43, 361),
   TMC(44, 362), TMC(45, 95), TMC(46, 211), TMC(47, 53), TMC(47, 62),
   TMC(47, 24), TMC(47, 36), TMC(48, 210), TMC(49, 364), TMC(50, 365),
   TMC(51, 365), TMC(52, 365), TMC(53, 365), TMC(54, 366), TMC(54, 367),
   TMC(54, 368), TMC(54, 369), TMC(55, 373), TMC(55, 376), TMC(55, 379),
   TMC(55, 382), TMC(55, 386), TMC(55, 389), TMC(55, 393), TMC(55, 396),
   TMC(55, 399), TMC(55, 402), TMC(55, 405), TMC(55, 408), TMC(56, 409),
   TMC(57, 34), TMC(58, 118), TMC(59, 116), TMC(60, 111), TMC(61, 110),
   TMC(62, 111), TMC(63, 110), TMC(64, 111), TMC(65, 110), TMC(66, 83),
   TMC(67, 108), TMC(68, 107), TMC(69, 108), TMC(70, 107), TMC(71, 82),
   TMC(72, 104), TMC(73, 102), TMC(74, 97), TMC(75, 94), TMC(76, 93),
   TMC(77, 94), TMC(78, 93), TMC(79, 94), TMC(80, 93), TMC(81, 81),
   TMC(82, 91), TMC(83, 90), TMC(84, 91), TMC(85, 90), TMC(86, 80),
   TMC(87, 412), TMC(87, 415), TMC(87, 418), TMC(87, 421), TMC(87, 424),
   TMC(87, 427), TMC(87, 430), TMC(87, 433), TMC(87, 436), TMC(87, 438),
   TMC(87, 440), TMC(87, 442), TMC(87, 445), TMC(87, 447), TMC(87, 450),
   TMC(87, 452), TMC(87, 454), TMC(87, 456), TMC(87, 458), TMC(87, 460),
   TMC(88, 87), TMC(88, 461), TMC(89, 87), TMC(89, 461), TMC(90, 87),
   TMC(90, 84), TMC(91, 84), TMC(92, 465), TMC(92, 469), TMC(93, 83),
   TMC(94, 83), TMC(95, 82), TMC(96, 82), TMC(97, 81), TMC(98, 81),
   TMC(99, 80), TMC(100, 80), TMC(101, 79), TMC(102, 293), TMC(103, 470),
   TMC(104, 471), TMC(105, 473), TMC(105, 475), TMC(105, 477),
   TMC(105, 479), TMC(105, 481), TMC(105, 483), TMC(105, 485),
   TMC(105, 487), TMC(105, 489), TMC(105, 491), TMC(106, 493),
   TMC(107, 495), TMC(108, 78), TMC(109, 74), TMC(110, 70), TMC(111, 65),
   TMC(112, 61), TMC(113, 56), TMC(114, 495), TMC(115, 495), TMC(116, 497),
   TMC(117, 52), TMC(118, 48), TMC(119, 44), TMC(120, 39), TMC(121, 35),
   TMC(122, 29), TMC(123, 497), TMC(124, 497), TMC(125, 23), TMC(126, 20),
   TMC(127, 15), TMC(128, 12), TMC(129, 410), TMC(129, 416), TMC(129, 422),
   TMC(129, 428), TMC(129, 498), TMC(129, 499), TMC(129, 500),
   TMC(129, 501), TMC(129, 502), TMC(129, 503), TMC(129, 504),
   TMC(129, 505), TMC(130, 510), TMC(131, 511), TMC(132, 87), TMC(132, 84),
   TMC(133, 356), TMC(134, 513), TMC(135, 245)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op elf32_relocation_TY_DEF x = x
    val op elf32_relocation_TY_DEF =
    DT(((("elf_relocation",0),[("bool",[26])]),["DISK_THM"]),
       [read"%244%133%299%24%173%0%236%178%24%236%238%19%238%27%234$2@%19%27%272%198@%183$1@$0@@%118%260|@||$1@$0@@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_relocation_case_def x = x
    val op elf32_relocation_case_def =
    DT(((("elf_relocation",4),
        [("bool",[26,180]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%150%19%150%27%164%99%200%315%414$2@$1@@$0@@$0$2@$1@@|@|@|@"])
  fun op elf32_relocation_size_def x = x
    val op elf32_relocation_size_def =
    DT(((("elf_relocation",5),
        [("bool",[26,180]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%150%19%150%27%230%328%414$1@$0@@@%291%256%314@@@|@|@"])
  fun op elf32_relocation_elf32_r_offset x = x
    val op elf32_relocation_elf32_r_offset =
    DT(((("elf_relocation",6),
        [("bool",[26,180]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%150%38%150%40%204%326%414$1@$0@@@$1@|@|@"])
  fun op elf32_relocation_elf32_r_info x = x
    val op elf32_relocation_elf32_r_info =
    DT(((("elf_relocation",7),
        [("bool",[26,180]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%150%38%150%40%204%324%414$1@$0@@@$0@|@|@"])
  fun op elf32_relocation_elf32_r_offset_fupd x = x
    val op elf32_relocation_elf32_r_offset_fupd =
    DT(((("elf_relocation",9),
        [("bool",[26,180]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%163%98%150%38%150%40%205%327$2@%414$1@$0@@@%414$2$1@@$0@@|@|@|@"])
  fun op elf32_relocation_elf32_r_info_fupd x = x
    val op elf32_relocation_elf32_r_info_fupd =
    DT(((("elf_relocation",10),
        [("bool",[26,180]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%163%98%150%38%150%40%205%325$2@%414$1@$0@@@%414$1@$2$0@@@|@|@|@"])
  fun op elf32_relocation_a_TY_DEF x = x
    val op elf32_relocation_a_TY_DEF =
    DT(((("elf_relocation",29),[("bool",[26])]),["DISK_THM"]),
       [read"%246%134%300%25%174%1%236%179%25%236%238%19%238%27%238%31%235$3@%19%27%31%273%198@%184$2@%183$1@$0@@@%118%261|@|||$2@$1@$0@@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_relocation_a_case_def x = x
    val op elf32_relocation_a_case_def =
    DT(((("elf_relocation",33),
        [("bool",[26,180]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%150%19%150%27%150%31%165%100%200%316%415$3@$2@$1@@$0@@$0$3@$2@$1@@|@|@|@|@"])
  fun op elf32_relocation_a_size_def x = x
    val op elf32_relocation_a_size_def =
    DT(((("elf_relocation",34),
        [("bool",[26,180]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%150%19%150%27%150%31%230%323%415$2@$1@$0@@@%291%256%314@@@|@|@|@"])
  fun op elf32_relocation_a_elf32_ra_offset x = x
    val op elf32_relocation_a_elf32_ra_offset =
    DT(((("elf_relocation",35),
        [("bool",[26,180]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%150%38%150%40%150%46%204%321%415$2@$1@$0@@@$2@|@|@|@"])
  fun op elf32_relocation_a_elf32_ra_info x = x
    val op elf32_relocation_a_elf32_ra_info =
    DT(((("elf_relocation",36),
        [("bool",[26,180]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%150%38%150%40%150%46%204%319%415$2@$1@$0@@@$1@|@|@|@"])
  fun op elf32_relocation_a_elf32_ra_addend x = x
    val op elf32_relocation_a_elf32_ra_addend =
    DT(((("elf_relocation",37),
        [("bool",[26,180]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%150%38%150%40%150%46%204%317%415$2@$1@$0@@@$0@|@|@|@"])
  fun op elf32_relocation_a_elf32_ra_offset_fupd x = x
    val op elf32_relocation_a_elf32_ra_offset_fupd =
    DT(((("elf_relocation",39),
        [("bool",[26,180]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%163%98%150%38%150%40%150%46%206%322$3@%415$2@$1@$0@@@%415$3$2@@$1@$0@@|@|@|@|@"])
  fun op elf32_relocation_a_elf32_ra_info_fupd x = x
    val op elf32_relocation_a_elf32_ra_info_fupd =
    DT(((("elf_relocation",40),
        [("bool",[26,180]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%163%98%150%38%150%40%150%46%206%320$3@%415$2@$1@$0@@@%415$2@$3$1@@$0@@|@|@|@|@"])
  fun op elf32_relocation_a_elf32_ra_addend_fupd x = x
    val op elf32_relocation_a_elf32_ra_addend_fupd =
    DT(((("elf_relocation",41),
        [("bool",[26,180]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%163%98%150%38%150%40%150%46%206%318$3@%415$2@$1@$0@@@%415$2@$1@$3$0@@@|@|@|@|@"])
  fun op elf64_relocation_TY_DEF x = x
    val op elf64_relocation_TY_DEF =
    DT(((("elf_relocation",60),[("bool",[26])]),["DISK_THM"]),
       [read"%248%135%297%22%171%2%236%176%22%236%237%18%237%26%232$2@%18%26%270%198@%181$1@$0@@%118%258|@||$1@$0@@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_relocation_case_def x = x
    val op elf64_relocation_case_def =
    DT(((("elf_relocation",64),
        [("bool",[26,180]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%149%18%149%26%161%96%200%329%416$2@$1@@$0@@$0$2@$1@@|@|@|@"])
  fun op elf64_relocation_size_def x = x
    val op elf64_relocation_size_def =
    DT(((("elf_relocation",65),
        [("bool",[26,180]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%149%18%149%26%230%343%416$1@$0@@@%291%256%314@@@|@|@"])
  fun op elf64_relocation_elf64_r_offset x = x
    val op elf64_relocation_elf64_r_offset =
    DT(((("elf_relocation",66),
        [("bool",[26,180]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%149%37%149%39%203%341%416$1@$0@@@$1@|@|@"])
  fun op elf64_relocation_elf64_r_info x = x
    val op elf64_relocation_elf64_r_info =
    DT(((("elf_relocation",67),
        [("bool",[26,180]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%149%37%149%39%203%339%416$1@$0@@@$0@|@|@"])
  fun op elf64_relocation_elf64_r_offset_fupd x = x
    val op elf64_relocation_elf64_r_offset_fupd =
    DT(((("elf_relocation",69),
        [("bool",[26,180]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%160%95%149%37%149%39%207%342$2@%416$1@$0@@@%416$2$1@@$0@@|@|@|@"])
  fun op elf64_relocation_elf64_r_info_fupd x = x
    val op elf64_relocation_elf64_r_info_fupd =
    DT(((("elf_relocation",70),
        [("bool",[26,180]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%160%95%149%37%149%39%207%340$2@%416$1@$0@@@%416$1@$2$0@@@|@|@|@"])
  fun op elf64_relocation_a_TY_DEF x = x
    val op elf64_relocation_a_TY_DEF =
    DT(((("elf_relocation",89),[("bool",[26])]),["DISK_THM"]),
       [read"%250%136%298%23%172%3%236%177%23%236%237%18%237%26%237%30%233$3@%18%26%30%271%198@%182$2@%181$1@$0@@@%118%259|@|||$2@$1@$0@@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_relocation_a_case_def x = x
    val op elf64_relocation_a_case_def =
    DT(((("elf_relocation",93),
        [("bool",[26,180]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%149%18%149%26%149%30%162%97%200%330%417$3@$2@$1@@$0@@$0$3@$2@$1@@|@|@|@|@"])
  fun op elf64_relocation_a_size_def x = x
    val op elf64_relocation_a_size_def =
    DT(((("elf_relocation",94),
        [("bool",[26,180]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%149%18%149%26%149%30%230%338%417$2@$1@$0@@@%291%256%314@@@|@|@|@"])
  fun op elf64_relocation_a_elf64_ra_offset x = x
    val op elf64_relocation_a_elf64_ra_offset =
    DT(((("elf_relocation",95),
        [("bool",[26,180]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%149%37%149%39%149%45%203%336%417$2@$1@$0@@@$2@|@|@|@"])
  fun op elf64_relocation_a_elf64_ra_info x = x
    val op elf64_relocation_a_elf64_ra_info =
    DT(((("elf_relocation",96),
        [("bool",[26,180]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%149%37%149%39%149%45%203%334%417$2@$1@$0@@@$1@|@|@|@"])
  fun op elf64_relocation_a_elf64_ra_addend x = x
    val op elf64_relocation_a_elf64_ra_addend =
    DT(((("elf_relocation",97),
        [("bool",[26,180]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%149%37%149%39%149%45%203%332%417$2@$1@$0@@@$0@|@|@|@"])
  fun op elf64_relocation_a_elf64_ra_offset_fupd x = x
    val op elf64_relocation_a_elf64_ra_offset_fupd =
    DT(((("elf_relocation",99),
        [("bool",[26,180]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%160%95%149%37%149%39%149%45%208%337$3@%417$2@$1@$0@@@%417$3$2@@$1@$0@@|@|@|@|@"])
  fun op elf64_relocation_a_elf64_ra_info_fupd x = x
    val op elf64_relocation_a_elf64_ra_info_fupd =
    DT(((("elf_relocation",100),
        [("bool",[26,180]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%160%95%149%37%149%39%149%45%208%335$3@%417$2@$1@$0@@@%417$2@$3$1@@$0@@|@|@|@|@"])
  fun op elf64_relocation_a_elf64_ra_addend_fupd x = x
    val op elf64_relocation_a_elf64_ra_addend_fupd =
    DT(((("elf_relocation",101),
        [("bool",[26,180]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%160%95%149%37%149%39%149%45%208%333$3@%417$2@$1@$0@@@%417$2@$1@$3$0@@@|@|@|@|@"])
  fun op elf64_relocation_a_compare_def x = x
    val op elf64_relocation_a_compare_def =
    DT(((("elf_relocation",120),[]),[]),
       [read"%154%85%154%86%231%331$1@$0@@%430%372%199@%230@@%372%199@%230@@%371%382@%229@@%195%433%336$1@@@%194%433%334$1@@@%431%332$1@@@@@%195%433%336$0@@@%194%433%334$0@@@%431%332$0@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_relocation_elf64_relocation_a_dict_def
    =
    DT(((("elf_relocation",121),[]),[]),
       [read"%201%381@%292%283%331@@%296%282%105%106%231%331$1@$0@@%285@||@@%295%282%105%106%278%331$1@$0@@%279%285@%279%276@%275@@@||@@%294%282%105%106%231%331$1@$0@@%277@||@@%293%282%105%106%278%331$1@$0@@%279%277@%279%276@%275@@@||@@%251@@@@@@"])
  fun op extract_elf32_relocation_r_sym_def x = x
    val op extract_elf32_relocation_r_sym_def =
    DT(((("elf_relocation",122),[]),[]),
       [read"%148%145%230%364$0@@%432%435$0@%291%257%256%256%314@@@@@@@|@"])
  fun op extract_elf64_relocation_r_sym_def x = x
    val op extract_elf64_relocation_r_sym_def =
    DT(((("elf_relocation",123),[]),[]),
       [read"%148%145%230%368$0@@%432%435$0@%291%257%256%256%256%256%314@@@@@@@@@|@"])
  fun op extract_elf32_relocation_r_type_def x = x
    val op extract_elf32_relocation_r_type_def =
    DT(((("elf_relocation",124),[]),[]),
       [read"%148%145%230%366$0@@%286%432$0@@%291%257%256%256%256%256%256%256%256%314@@@@@@@@@@@|@"])
  fun op extract_elf64_relocation_r_type_def x = x
    val op extract_elf64_relocation_r_type_def =
    DT(((("elf_relocation",125),[]),[]),
       [read"%149%146%230%370$0@@%284%117%433%434$1@%384$0@@@|@%196%180%291%257%256%256%256%256%256%256%256%256%256%256%256%256%256%256%256%314@@@@@@@@@@@@@@@@@@%291%257%256%256%256%256%256%256%256%256%256%256%256%256%256%256%256%314@@@@@@@@@@@@@@@@@@@%291%256%314@@@@@|@"])
  fun op get_elf32_relocation_r_sym_def x = x
    val op get_elf32_relocation_r_sym_def =
    DT(((("elf_relocation",126),[]),[]),
       [read"%151%119%230%375$0@@%365%324$0@@@|@"])
  fun op get_elf32_relocation_a_sym_def x = x
    val op get_elf32_relocation_a_sym_def =
    DT(((("elf_relocation",127),[]),[]),
       [read"%152%120%230%373$0@@%365%319$0@@@|@"])
  fun op get_elf64_relocation_sym_def x = x
    val op get_elf64_relocation_sym_def =
    DT(((("elf_relocation",128),[]),[]),
       [read"%153%121%230%379$0@@%369%339$0@@@|@"])
  fun op get_elf64_relocation_a_sym_def x = x
    val op get_elf64_relocation_a_sym_def =
    DT(((("elf_relocation",129),[]),[]),
       [read"%154%122%230%377$0@@%369%334$0@@@|@"])
  fun op get_elf32_relocation_type_def x = x
    val op get_elf32_relocation_type_def =
    DT(((("elf_relocation",130),[]),[]),
       [read"%151%119%230%376$0@@%367%324$0@@@|@"])
  fun op get_elf32_relocation_a_type_def x = x
    val op get_elf32_relocation_a_type_def =
    DT(((("elf_relocation",131),[]),[]),
       [read"%152%120%230%374$0@@%367%319$0@@@|@"])
  fun op get_elf64_relocation_type_def x = x
    val op get_elf64_relocation_type_def =
    DT(((("elf_relocation",132),[]),[]),
       [read"%153%121%230%380$0@@%370%339$0@@@|@"])
  fun op get_elf64_relocation_a_type_def x = x
    val op get_elf64_relocation_a_type_def =
    DT(((("elf_relocation",133),[]),[]),
       [read"%154%122%230%378$0@@%370%334$0@@@|@"])
  fun op read_elf32_relocation_def x = x
    val op read_elf32_relocation_def =
    DT(((("elf_relocation",134),[]),[]),
       [read"%155%84%147%34%213%397$1@$0@@%358%396$1@$0@@%307%128%34%358%404$3@$0@@%307%126%34%422%185%327%281$3@@%325%281$1@@%252@@@$0@@||@@||@@@|@|@"])
  fun op read_elf64_relocation_def x = x
    val op read_elf64_relocation_def =
    DT(((("elf_relocation",135),[]),[]),
       [read"%155%84%147%34%215%406$1@$0@@%356%405$1@$0@@%305%127%34%356%413$3@$0@@%305%125%34%424%187%342%280$3@@%340%280$1@@%254@@@$0@@||@@||@@@|@|@"])
  fun op read_elf32_relocation_a_def x = x
    val op read_elf32_relocation_a_def =
    DT(((("elf_relocation",136),[]),[]),
       [read"%155%84%147%34%214%398$1@$0@@%359%396$1@$0@@%308%128%34%359%404$3@$0@@%308%126%34%359%403$5@$0@@%308%124%34%423%186%322%281$5@@%320%281$3@@%318%281$1@@%253@@@@$0@@||@@||@@||@@@|@|@"])
  fun op read_elf64_relocation_a_def x = x
    val op read_elf64_relocation_a_def =
    DT(((("elf_relocation",137),[]),[]),
       [read"%155%84%147%34%216%407$1@$0@@%357%405$1@$0@@%306%127%34%357%413$3@$0@@%306%125%34%357%412$5@$0@@%306%123%34%425%188%337%280$5@@%335%280$3@@%333%280$1@@%255@@@@$0@@||@@||@@||@@@|@|@"])
  fun op read_elf32_relocation_section_def x = x
    val op read_elf32_relocation_section_def =
    DT(((("elf_relocation",154),[]),[]),
       [read"%175%138%155%84%147%35%217%401$2@$1@$0@@%352%395$2@$0@@%301%65%137%345%402$3@$1@@%87%426%190$0@$1@@|@||@@@|@|@|@"])
  fun op read_elf64_relocation_section_def x = x
    val op read_elf64_relocation_section_def =
    DT(((("elf_relocation",155),[]),[]),
       [read"%175%138%155%84%147%35%219%410$2@$1@$0@@%354%395$2@$0@@%303%65%137%349%411$3@$1@@%89%428%192$0@$1@@|@||@@@|@|@|@"])
  fun op read_elf32_relocation_a_section_def x = x
    val op read_elf32_relocation_a_section_def =
    DT(((("elf_relocation",156),[]),[]),
       [read"%175%138%155%84%147%35%218%399$2@$1@$0@@%353%395$2@$0@@%302%65%137%347%400$3@$1@@%88%427%191$0@$1@@|@||@@@|@|@|@"])
  fun op read_elf64_relocation_a_section_def x = x
    val op read_elf64_relocation_a_section_def =
    DT(((("elf_relocation",157),[]),[]),
       [read"%175%138%155%84%147%35%220%408$2@$1@$0@@%355%395$2@$0@@%304%65%137%351%409$3@$1@@%90%429%193$0@$1@@|@||@@@|@|@|@"])
  fun op elf32_relocation_accessors x = x
    val op elf32_relocation_accessors =
    DT(((("elf_relocation",8),[("elf_relocation",[6,7])]),["DISK_THM"]),
       [read"%197%150%38%150%40%204%326%414$1@$0@@@$1@|@|@@%150%38%150%40%204%324%414$1@$0@@@$0@|@|@@"])
  fun op elf32_relocation_fn_updates x = x
    val op elf32_relocation_fn_updates =
    DT(((("elf_relocation",11),[("elf_relocation",[9,10])]),["DISK_THM"]),
       [read"%197%163%98%150%38%150%40%205%327$2@%414$1@$0@@@%414$2$1@@$0@@|@|@|@@%163%98%150%38%150%40%205%325$2@%414$1@$0@@@%414$1@$2$0@@@|@|@|@@"])
  fun op elf32_relocation_accfupds x = x
    val op elf32_relocation_accfupds =
    DT(((("elf_relocation",12),
        [("bool",[25,26,55,180]),
         ("elf_relocation",[1,2,3,8,11])]),["DISK_THM"]),
       [read"%197%163%98%151%53%204%326%325$1@$0@@@%326$0@@|@|@@%197%163%98%151%53%204%324%327$1@$0@@@%324$0@@|@|@@%197%163%98%151%53%204%326%327$1@$0@@@$1%326$0@@@|@|@@%163%98%151%53%204%324%325$1@$0@@@$1%324$0@@@|@|@@@@"])
  fun op elf32_relocation_fupdfupds x = x
    val op elf32_relocation_fupdfupds =
    DT(((("elf_relocation",13),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_relocation",[1,2,3,11])]),["DISK_THM"]),
       [read"%197%163%112%163%98%151%53%205%327$1@%327$2@$0@@@%327%386$1@$2@@$0@@|@|@|@@%163%112%163%98%151%53%205%325$1@%325$2@$0@@@%325%386$1@$2@@$0@@|@|@|@@"])
  fun op elf32_relocation_fupdfupds_comp x = x
    val op elf32_relocation_fupdfupds_comp =
    DT(((("elf_relocation",14),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_relocation",[1,2,3,11])]),["DISK_THM"]),
       [read"%197%197%163%112%163%98%225%388%327$0@@%327$1@@@%327%386$0@$1@@@|@|@@%156%113%163%112%163%98%221%387%327$0@@%387%327$1@@$2@@@%387%327%386$0@$1@@@$2@@|@|@|@@@%197%163%112%163%98%225%388%325$0@@%325$1@@@%325%386$0@$1@@@|@|@@%156%113%163%112%163%98%221%387%325$0@@%387%325$1@@$2@@@%387%325%386$0@$1@@@$2@@|@|@|@@@"])
  fun op elf32_relocation_fupdcanon x = x
    val op elf32_relocation_fupdcanon =
    DT(((("elf_relocation",15),
        [("bool",[25,26,55,180]),
         ("elf_relocation",[1,2,3,11])]),["DISK_THM"]),
       [read"%163%112%163%98%151%53%205%325$1@%327$2@$0@@@%327$2@%325$1@$0@@@|@|@|@"])
  fun op elf32_relocation_fupdcanon_comp x = x
    val op elf32_relocation_fupdcanon_comp =
    DT(((("elf_relocation",16),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_relocation",[1,2,3,11])]),["DISK_THM"]),
       [read"%197%163%112%163%98%225%388%325$0@@%327$1@@@%388%327$1@@%325$0@@@|@|@@%156%113%163%112%163%98%221%387%325$0@@%387%327$1@@$2@@@%387%327$1@@%387%325$0@@$2@@@|@|@|@@"])
  fun op elf32_relocation_component_equality x = x
    val op elf32_relocation_component_equality =
    DT(((("elf_relocation",17),
        [("bool",[25,26,50,55,62,180]),("elf_relocation",[1,2,3,8]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%151%57%151%61%202%205$1@$0@@%197%204%326$1@@%326$0@@@%204%324$1@@%324$0@@@@|@|@"])
  fun op elf32_relocation_updates_eq_literal x = x
    val op elf32_relocation_updates_eq_literal =
    DT(((("elf_relocation",18),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_relocation",[1,2,3,11])]),["DISK_THM"]),
       [read"%151%53%150%40%150%38%205%327%281$1@@%325%281$0@@$2@@@%327%281$1@@%325%281$0@@%252@@@|@|@|@"])
  fun op elf32_relocation_literal_nchotomy x = x
    val op elf32_relocation_literal_nchotomy =
    DT(((("elf_relocation",19),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_relocation",[1,2,3,11]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%151%53%238%40%238%38%205$2@%327%281$1@@%325%281$0@@%252@@@|@|@|@"])
  fun op FORALL_elf32_relocation x = x
    val op FORALL_elf32_relocation =
    DT(((("elf_relocation",20),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_relocation",[1,2,3,11]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%166%12%202%151%53$1$0@|@@%150%40%150%38$2%327%281$1@@%325%281$0@@%252@@@|@|@@|@"])
  fun op EXISTS_elf32_relocation x = x
    val op EXISTS_elf32_relocation =
    DT(((("elf_relocation",21),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_relocation",[1,2,3,11]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%166%12%202%239%53$1$0@|@@%238%40%238%38$2%327%281$1@@%325%281$0@@%252@@@|@|@@|@"])
  fun op elf32_relocation_literal_11 x = x
    val op elf32_relocation_literal_11 =
    DT(((("elf_relocation",22),
        [("combin",[12]),("elf_relocation",[12,17])]),["DISK_THM"]),
       [read"%150%42%150%46%150%44%150%52%202%205%327%281$3@@%325%281$2@@%252@@@%327%281$1@@%325%281$0@@%252@@@@%197%204$3@$1@@%204$2@$0@@@|@|@|@|@"])
  fun op datatype_elf32_relocation x = x
    val op datatype_elf32_relocation =
    DT(((("elf_relocation",23),[("bool",[25,170])]),["DISK_THM"]),
       [read"%274%131%75@%71@%70@@"])
  fun op elf32_relocation_11 x = x
    val op elf32_relocation_11 =
    DT(((("elf_relocation",24),
        [("bool",[26,50,55,62,180]),("elf_relocation",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%150%19%150%27%150%21%150%29%202%205%414$3@$2@@%414$1@$0@@@%197%204$3@$1@@%204$2@$0@@@|@|@|@|@"])
  fun op elf32_relocation_case_cong x = x
    val op elf32_relocation_case_cong =
    DT(((("elf_relocation",25),
        [("bool",[26,180]),("elf_relocation",[1,2,3,4])]),["DISK_THM"]),
       [read"%151%4%151%8%164%99%236%197%205$2@$1@@%150%19%150%27%236%205$3@%414$1@$0@@@%200$2$1@$0@@%103$1@$0@@@|@|@@@%200%315$2@$0@@%315$1@%103@@@|@|@|@"])
  fun op elf32_relocation_nchotomy x = x
    val op elf32_relocation_nchotomy =
    DT(((("elf_relocation",26),
        [("bool",[26,180]),("elf_relocation",[1,2,3])]),["DISK_THM"]),
       [read"%151%66%238%38%238%40%205$2@%414$1@$0@@|@|@|@"])
  fun op elf32_relocation_Axiom x = x
    val op elf32_relocation_Axiom =
    DT(((("elf_relocation",27),
        [("bool",[26,180]),("elf_relocation",[1,2,3]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%164%99%243%107%150%19%150%27%200$2%414$1@$0@@@$3$1@$0@@|@|@|@|@"])
  fun op elf32_relocation_induction x = x
    val op elf32_relocation_induction =
    DT(((("elf_relocation",28),
        [("bool",[26]),("elf_relocation",[1,2,3])]),["DISK_THM"]),
       [read"%166%12%236%150%38%150%40$2%414$1@$0@@|@|@@%151%53$1$0@|@@|@"])
  fun op elf32_relocation_a_accessors x = x
    val op elf32_relocation_a_accessors =
    DT(((("elf_relocation",38),
        [("elf_relocation",[35,36,37])]),["DISK_THM"]),
       [read"%197%150%38%150%40%150%46%204%321%415$2@$1@$0@@@$2@|@|@|@@%197%150%38%150%40%150%46%204%319%415$2@$1@$0@@@$1@|@|@|@@%150%38%150%40%150%46%204%317%415$2@$1@$0@@@$0@|@|@|@@@"])
  fun op elf32_relocation_a_fn_updates x = x
    val op elf32_relocation_a_fn_updates =
    DT(((("elf_relocation",42),
        [("elf_relocation",[39,40,41])]),["DISK_THM"]),
       [read"%197%163%98%150%38%150%40%150%46%206%322$3@%415$2@$1@$0@@@%415$3$2@@$1@$0@@|@|@|@|@@%197%163%98%150%38%150%40%150%46%206%320$3@%415$2@$1@$0@@@%415$2@$3$1@@$0@@|@|@|@|@@%163%98%150%38%150%40%150%46%206%318$3@%415$2@$1@$0@@@%415$2@$1@$3$0@@@|@|@|@|@@@"])
  fun op elf32_relocation_a_accfupds x = x
    val op elf32_relocation_a_accfupds =
    DT(((("elf_relocation",43),
        [("bool",[25,26,55,180]),
         ("elf_relocation",[30,31,32,38,42])]),["DISK_THM"]),
       [read"%197%163%98%152%54%204%321%320$1@$0@@@%321$0@@|@|@@%197%163%98%152%54%204%321%318$1@$0@@@%321$0@@|@|@@%197%163%98%152%54%204%319%322$1@$0@@@%319$0@@|@|@@%197%163%98%152%54%204%319%318$1@$0@@@%319$0@@|@|@@%197%163%98%152%54%204%317%322$1@$0@@@%317$0@@|@|@@%197%163%98%152%54%204%317%320$1@$0@@@%317$0@@|@|@@%197%163%98%152%54%204%321%322$1@$0@@@$1%321$0@@@|@|@@%197%163%98%152%54%204%319%320$1@$0@@@$1%319$0@@@|@|@@%163%98%152%54%204%317%318$1@$0@@@$1%317$0@@@|@|@@@@@@@@@"])
  fun op elf32_relocation_a_fupdfupds x = x
    val op elf32_relocation_a_fupdfupds =
    DT(((("elf_relocation",44),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_relocation",[30,31,32,42])]),["DISK_THM"]),
       [read"%197%163%112%163%98%152%54%206%322$1@%322$2@$0@@@%322%386$1@$2@@$0@@|@|@|@@%197%163%112%163%98%152%54%206%320$1@%320$2@$0@@@%320%386$1@$2@@$0@@|@|@|@@%163%112%163%98%152%54%206%318$1@%318$2@$0@@@%318%386$1@$2@@$0@@|@|@|@@@"])
  fun op elf32_relocation_a_fupdfupds_comp x = x
    val op elf32_relocation_a_fupdfupds_comp =
    DT(((("elf_relocation",45),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_relocation",[30,31,32,42])]),["DISK_THM"]),
       [read"%197%197%163%112%163%98%226%390%322$0@@%322$1@@@%322%386$0@$1@@@|@|@@%157%114%163%112%163%98%222%389%322$0@@%389%322$1@@$2@@@%389%322%386$0@$1@@@$2@@|@|@|@@@%197%197%163%112%163%98%226%390%320$0@@%320$1@@@%320%386$0@$1@@@|@|@@%157%114%163%112%163%98%222%389%320$0@@%389%320$1@@$2@@@%389%320%386$0@$1@@@$2@@|@|@|@@@%197%163%112%163%98%226%390%318$0@@%318$1@@@%318%386$0@$1@@@|@|@@%157%114%163%112%163%98%222%389%318$0@@%389%318$1@@$2@@@%389%318%386$0@$1@@@$2@@|@|@|@@@@"])
  fun op elf32_relocation_a_fupdcanon x = x
    val op elf32_relocation_a_fupdcanon =
    DT(((("elf_relocation",46),
        [("bool",[25,26,55,180]),
         ("elf_relocation",[30,31,32,42])]),["DISK_THM"]),
       [read"%197%163%112%163%98%152%54%206%320$1@%322$2@$0@@@%322$2@%320$1@$0@@@|@|@|@@%197%163%112%163%98%152%54%206%318$1@%322$2@$0@@@%322$2@%318$1@$0@@@|@|@|@@%163%112%163%98%152%54%206%318$1@%320$2@$0@@@%320$2@%318$1@$0@@@|@|@|@@@"])
  fun op elf32_relocation_a_fupdcanon_comp x = x
    val op elf32_relocation_a_fupdcanon_comp =
    DT(((("elf_relocation",47),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_relocation",[30,31,32,42])]),["DISK_THM"]),
       [read"%197%197%163%112%163%98%226%390%320$0@@%322$1@@@%390%322$1@@%320$0@@@|@|@@%157%114%163%112%163%98%222%389%320$0@@%389%322$1@@$2@@@%389%322$1@@%389%320$0@@$2@@@|@|@|@@@%197%197%163%112%163%98%226%390%318$0@@%322$1@@@%390%322$1@@%318$0@@@|@|@@%157%114%163%112%163%98%222%389%318$0@@%389%322$1@@$2@@@%389%322$1@@%389%318$0@@$2@@@|@|@|@@@%197%163%112%163%98%226%390%318$0@@%320$1@@@%390%320$1@@%318$0@@@|@|@@%157%114%163%112%163%98%222%389%318$0@@%389%320$1@@$2@@@%389%320$1@@%389%318$0@@$2@@@|@|@|@@@@"])
  fun op elf32_relocation_a_component_equality x = x
    val op elf32_relocation_a_component_equality =
    DT(((("elf_relocation",48),
        [("bool",[25,26,50,55,62,180]),("elf_relocation",[30,31,32,38]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%152%58%152%62%202%206$1@$0@@%197%204%321$1@@%321$0@@@%197%204%319$1@@%319$0@@@%204%317$1@@%317$0@@@@@|@|@"])
  fun op elf32_relocation_a_updates_eq_literal x = x
    val op elf32_relocation_a_updates_eq_literal =
    DT(((("elf_relocation",49),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_relocation",[30,31,32,42])]),["DISK_THM"]),
       [read"%152%54%150%46%150%40%150%38%206%322%281$2@@%320%281$1@@%318%281$0@@$3@@@@%322%281$2@@%320%281$1@@%318%281$0@@%253@@@@|@|@|@|@"])
  fun op elf32_relocation_a_literal_nchotomy x = x
    val op elf32_relocation_a_literal_nchotomy =
    DT(((("elf_relocation",50),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_relocation",[30,31,32,42]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%152%54%238%46%238%40%238%38%206$3@%322%281$2@@%320%281$1@@%318%281$0@@%253@@@@|@|@|@|@"])
  fun op FORALL_elf32_relocation_a x = x
    val op FORALL_elf32_relocation_a =
    DT(((("elf_relocation",51),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_relocation",[30,31,32,42]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%167%13%202%152%54$1$0@|@@%150%46%150%40%150%38$3%322%281$2@@%320%281$1@@%318%281$0@@%253@@@@|@|@|@@|@"])
  fun op EXISTS_elf32_relocation_a x = x
    val op EXISTS_elf32_relocation_a =
    DT(((("elf_relocation",52),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_relocation",[30,31,32,42]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%167%13%202%240%54$1$0@|@@%238%46%238%40%238%38$3%322%281$2@@%320%281$1@@%318%281$0@@%253@@@@|@|@|@@|@"])
  fun op elf32_relocation_a_literal_11 x = x
    val op elf32_relocation_a_literal_11 =
    DT(((("elf_relocation",53),
        [("combin",[12]),("elf_relocation",[43,48])]),["DISK_THM"]),
       [read"%150%48%150%42%150%46%150%50%150%44%150%52%202%206%322%281$5@@%320%281$4@@%318%281$3@@%253@@@@%322%281$2@@%320%281$1@@%318%281$0@@%253@@@@@%197%204$5@$2@@%197%204$4@$1@@%204$3@$0@@@@|@|@|@|@|@|@"])
  fun op datatype_elf32_relocation_a x = x
    val op datatype_elf32_relocation_a =
    DT(((("elf_relocation",54),[("bool",[25,170])]),["DISK_THM"]),
       [read"%274%132%76@%74@%73@%72@@"])
  fun op elf32_relocation_a_11 x = x
    val op elf32_relocation_a_11 =
    DT(((("elf_relocation",55),
        [("bool",[26,50,55,62,180]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%150%19%150%27%150%31%150%21%150%29%150%33%202%206%415$5@$4@$3@@%415$2@$1@$0@@@%197%204$5@$2@@%197%204$4@$1@@%204$3@$0@@@@|@|@|@|@|@|@"])
  fun op elf32_relocation_a_case_cong x = x
    val op elf32_relocation_a_case_cong =
    DT(((("elf_relocation",56),
        [("bool",[26,180]),
         ("elf_relocation",[30,31,32,33])]),["DISK_THM"]),
       [read"%152%5%152%9%165%100%236%197%206$2@$1@@%150%19%150%27%150%31%236%206$4@%415$2@$1@$0@@@%200$3$2@$1@$0@@%104$2@$1@$0@@@|@|@|@@@%200%316$2@$0@@%316$1@%104@@@|@|@|@"])
  fun op elf32_relocation_a_nchotomy x = x
    val op elf32_relocation_a_nchotomy =
    DT(((("elf_relocation",57),
        [("bool",[26,180]),("elf_relocation",[30,31,32])]),["DISK_THM"]),
       [read"%152%67%238%38%238%40%238%46%206$3@%415$2@$1@$0@@|@|@|@|@"])
  fun op elf32_relocation_a_Axiom x = x
    val op elf32_relocation_a_Axiom =
    DT(((("elf_relocation",58),
        [("bool",[26,180]),("elf_relocation",[30,31,32]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%165%100%245%108%150%19%150%27%150%31%200$3%415$2@$1@$0@@@$4$2@$1@$0@@|@|@|@|@|@"])
  fun op elf32_relocation_a_induction x = x
    val op elf32_relocation_a_induction =
    DT(((("elf_relocation",59),
        [("bool",[26]),("elf_relocation",[30,31,32])]),["DISK_THM"]),
       [read"%167%13%236%150%38%150%40%150%46$3%415$2@$1@$0@@|@|@|@@%152%54$1$0@|@@|@"])
  fun op elf64_relocation_accessors x = x
    val op elf64_relocation_accessors =
    DT(((("elf_relocation",68),[("elf_relocation",[66,67])]),["DISK_THM"]),
       [read"%197%149%37%149%39%203%341%416$1@$0@@@$1@|@|@@%149%37%149%39%203%339%416$1@$0@@@$0@|@|@@"])
  fun op elf64_relocation_fn_updates x = x
    val op elf64_relocation_fn_updates =
    DT(((("elf_relocation",71),[("elf_relocation",[69,70])]),["DISK_THM"]),
       [read"%197%160%95%149%37%149%39%207%342$2@%416$1@$0@@@%416$2$1@@$0@@|@|@|@@%160%95%149%37%149%39%207%340$2@%416$1@$0@@@%416$1@$2$0@@@|@|@|@@"])
  fun op elf64_relocation_accfupds x = x
    val op elf64_relocation_accfupds =
    DT(((("elf_relocation",72),
        [("bool",[25,26,55,180]),
         ("elf_relocation",[61,62,63,68,71])]),["DISK_THM"]),
       [read"%197%160%95%153%55%203%341%340$1@$0@@@%341$0@@|@|@@%197%160%95%153%55%203%339%342$1@$0@@@%339$0@@|@|@@%197%160%95%153%55%203%341%342$1@$0@@@$1%341$0@@@|@|@@%160%95%153%55%203%339%340$1@$0@@@$1%339$0@@@|@|@@@@"])
  fun op elf64_relocation_fupdfupds x = x
    val op elf64_relocation_fupdfupds =
    DT(((("elf_relocation",73),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_relocation",[61,62,63,71])]),["DISK_THM"]),
       [read"%197%160%111%160%95%153%55%207%342$1@%342$2@$0@@@%342%385$1@$2@@$0@@|@|@|@@%160%111%160%95%153%55%207%340$1@%340$2@$0@@@%340%385$1@$2@@$0@@|@|@|@@"])
  fun op elf64_relocation_fupdfupds_comp x = x
    val op elf64_relocation_fupdfupds_comp =
    DT(((("elf_relocation",74),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_relocation",[61,62,63,71])]),["DISK_THM"]),
       [read"%197%197%160%111%160%95%227%392%342$0@@%342$1@@@%342%385$0@$1@@@|@|@@%158%115%160%111%160%95%223%391%342$0@@%391%342$1@@$2@@@%391%342%385$0@$1@@@$2@@|@|@|@@@%197%160%111%160%95%227%392%340$0@@%340$1@@@%340%385$0@$1@@@|@|@@%158%115%160%111%160%95%223%391%340$0@@%391%340$1@@$2@@@%391%340%385$0@$1@@@$2@@|@|@|@@@"])
  fun op elf64_relocation_fupdcanon x = x
    val op elf64_relocation_fupdcanon =
    DT(((("elf_relocation",75),
        [("bool",[25,26,55,180]),
         ("elf_relocation",[61,62,63,71])]),["DISK_THM"]),
       [read"%160%111%160%95%153%55%207%340$1@%342$2@$0@@@%342$2@%340$1@$0@@@|@|@|@"])
  fun op elf64_relocation_fupdcanon_comp x = x
    val op elf64_relocation_fupdcanon_comp =
    DT(((("elf_relocation",76),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_relocation",[61,62,63,71])]),["DISK_THM"]),
       [read"%197%160%111%160%95%227%392%340$0@@%342$1@@@%392%342$1@@%340$0@@@|@|@@%158%115%160%111%160%95%223%391%340$0@@%391%342$1@@$2@@@%391%342$1@@%391%340$0@@$2@@@|@|@|@@"])
  fun op elf64_relocation_component_equality x = x
    val op elf64_relocation_component_equality =
    DT(((("elf_relocation",77),
        [("bool",[25,26,50,55,62,180]),("elf_relocation",[61,62,63,68]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%59%153%63%202%207$1@$0@@%197%203%341$1@@%341$0@@@%203%339$1@@%339$0@@@@|@|@"])
  fun op elf64_relocation_updates_eq_literal x = x
    val op elf64_relocation_updates_eq_literal =
    DT(((("elf_relocation",78),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_relocation",[61,62,63,71])]),["DISK_THM"]),
       [read"%153%55%149%39%149%37%207%342%280$1@@%340%280$0@@$2@@@%342%280$1@@%340%280$0@@%254@@@|@|@|@"])
  fun op elf64_relocation_literal_nchotomy x = x
    val op elf64_relocation_literal_nchotomy =
    DT(((("elf_relocation",79),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_relocation",[61,62,63,71]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%153%55%237%39%237%37%207$2@%342%280$1@@%340%280$0@@%254@@@|@|@|@"])
  fun op FORALL_elf64_relocation x = x
    val op FORALL_elf64_relocation =
    DT(((("elf_relocation",80),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_relocation",[61,62,63,71]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%168%14%202%153%55$1$0@|@@%149%39%149%37$2%342%280$1@@%340%280$0@@%254@@@|@|@@|@"])
  fun op EXISTS_elf64_relocation x = x
    val op EXISTS_elf64_relocation =
    DT(((("elf_relocation",81),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_relocation",[61,62,63,71]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%168%14%202%241%55$1$0@|@@%237%39%237%37$2%342%280$1@@%340%280$0@@%254@@@|@|@@|@"])
  fun op elf64_relocation_literal_11 x = x
    val op elf64_relocation_literal_11 =
    DT(((("elf_relocation",82),
        [("combin",[12]),("elf_relocation",[72,77])]),["DISK_THM"]),
       [read"%149%41%149%45%149%43%149%51%202%207%342%280$3@@%340%280$2@@%254@@@%342%280$1@@%340%280$0@@%254@@@@%197%203$3@$1@@%203$2@$0@@@|@|@|@|@"])
  fun op datatype_elf64_relocation x = x
    val op datatype_elf64_relocation =
    DT(((("elf_relocation",83),[("bool",[25,170])]),["DISK_THM"]),
       [read"%274%129%82@%78@%77@@"])
  fun op elf64_relocation_11 x = x
    val op elf64_relocation_11 =
    DT(((("elf_relocation",84),
        [("bool",[26,50,55,62,180]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%149%18%149%26%149%20%149%28%202%207%416$3@$2@@%416$1@$0@@@%197%203$3@$1@@%203$2@$0@@@|@|@|@|@"])
  fun op elf64_relocation_case_cong x = x
    val op elf64_relocation_case_cong =
    DT(((("elf_relocation",85),
        [("bool",[26,180]),
         ("elf_relocation",[61,62,63,64])]),["DISK_THM"]),
       [read"%153%6%153%10%161%96%236%197%207$2@$1@@%149%18%149%26%236%207$3@%416$1@$0@@@%200$2$1@$0@@%101$1@$0@@@|@|@@@%200%329$2@$0@@%329$1@%101@@@|@|@|@"])
  fun op elf64_relocation_nchotomy x = x
    val op elf64_relocation_nchotomy =
    DT(((("elf_relocation",86),
        [("bool",[26,180]),("elf_relocation",[61,62,63])]),["DISK_THM"]),
       [read"%153%68%237%37%237%39%207$2@%416$1@$0@@|@|@|@"])
  fun op elf64_relocation_Axiom x = x
    val op elf64_relocation_Axiom =
    DT(((("elf_relocation",87),
        [("bool",[26,180]),("elf_relocation",[61,62,63]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%161%96%247%109%149%18%149%26%200$2%416$1@$0@@@$3$1@$0@@|@|@|@|@"])
  fun op elf64_relocation_induction x = x
    val op elf64_relocation_induction =
    DT(((("elf_relocation",88),
        [("bool",[26]),("elf_relocation",[61,62,63])]),["DISK_THM"]),
       [read"%168%14%236%149%37%149%39$2%416$1@$0@@|@|@@%153%55$1$0@|@@|@"])
  fun op elf64_relocation_a_accessors x = x
    val op elf64_relocation_a_accessors =
    DT(((("elf_relocation",98),
        [("elf_relocation",[95,96,97])]),["DISK_THM"]),
       [read"%197%149%37%149%39%149%45%203%336%417$2@$1@$0@@@$2@|@|@|@@%197%149%37%149%39%149%45%203%334%417$2@$1@$0@@@$1@|@|@|@@%149%37%149%39%149%45%203%332%417$2@$1@$0@@@$0@|@|@|@@@"])
  fun op elf64_relocation_a_fn_updates x = x
    val op elf64_relocation_a_fn_updates =
    DT(((("elf_relocation",102),
        [("elf_relocation",[99,100,101])]),["DISK_THM"]),
       [read"%197%160%95%149%37%149%39%149%45%208%337$3@%417$2@$1@$0@@@%417$3$2@@$1@$0@@|@|@|@|@@%197%160%95%149%37%149%39%149%45%208%335$3@%417$2@$1@$0@@@%417$2@$3$1@@$0@@|@|@|@|@@%160%95%149%37%149%39%149%45%208%333$3@%417$2@$1@$0@@@%417$2@$1@$3$0@@@|@|@|@|@@@"])
  fun op elf64_relocation_a_accfupds x = x
    val op elf64_relocation_a_accfupds =
    DT(((("elf_relocation",103),
        [("bool",[25,26,55,180]),
         ("elf_relocation",[90,91,92,98,102])]),["DISK_THM"]),
       [read"%197%160%95%154%56%203%336%335$1@$0@@@%336$0@@|@|@@%197%160%95%154%56%203%336%333$1@$0@@@%336$0@@|@|@@%197%160%95%154%56%203%334%337$1@$0@@@%334$0@@|@|@@%197%160%95%154%56%203%334%333$1@$0@@@%334$0@@|@|@@%197%160%95%154%56%203%332%337$1@$0@@@%332$0@@|@|@@%197%160%95%154%56%203%332%335$1@$0@@@%332$0@@|@|@@%197%160%95%154%56%203%336%337$1@$0@@@$1%336$0@@@|@|@@%197%160%95%154%56%203%334%335$1@$0@@@$1%334$0@@@|@|@@%160%95%154%56%203%332%333$1@$0@@@$1%332$0@@@|@|@@@@@@@@@"])
  fun op elf64_relocation_a_fupdfupds x = x
    val op elf64_relocation_a_fupdfupds =
    DT(((("elf_relocation",104),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_relocation",[90,91,92,102])]),["DISK_THM"]),
       [read"%197%160%111%160%95%154%56%208%337$1@%337$2@$0@@@%337%385$1@$2@@$0@@|@|@|@@%197%160%111%160%95%154%56%208%335$1@%335$2@$0@@@%335%385$1@$2@@$0@@|@|@|@@%160%111%160%95%154%56%208%333$1@%333$2@$0@@@%333%385$1@$2@@$0@@|@|@|@@@"])
  fun op elf64_relocation_a_fupdfupds_comp x = x
    val op elf64_relocation_a_fupdfupds_comp =
    DT(((("elf_relocation",105),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_relocation",[90,91,92,102])]),["DISK_THM"]),
       [read"%197%197%160%111%160%95%228%394%337$0@@%337$1@@@%337%385$0@$1@@@|@|@@%159%116%160%111%160%95%224%393%337$0@@%393%337$1@@$2@@@%393%337%385$0@$1@@@$2@@|@|@|@@@%197%197%160%111%160%95%228%394%335$0@@%335$1@@@%335%385$0@$1@@@|@|@@%159%116%160%111%160%95%224%393%335$0@@%393%335$1@@$2@@@%393%335%385$0@$1@@@$2@@|@|@|@@@%197%160%111%160%95%228%394%333$0@@%333$1@@@%333%385$0@$1@@@|@|@@%159%116%160%111%160%95%224%393%333$0@@%393%333$1@@$2@@@%393%333%385$0@$1@@@$2@@|@|@|@@@@"])
  fun op elf64_relocation_a_fupdcanon x = x
    val op elf64_relocation_a_fupdcanon =
    DT(((("elf_relocation",106),
        [("bool",[25,26,55,180]),
         ("elf_relocation",[90,91,92,102])]),["DISK_THM"]),
       [read"%197%160%111%160%95%154%56%208%335$1@%337$2@$0@@@%337$2@%335$1@$0@@@|@|@|@@%197%160%111%160%95%154%56%208%333$1@%337$2@$0@@@%337$2@%333$1@$0@@@|@|@|@@%160%111%160%95%154%56%208%333$1@%335$2@$0@@@%335$2@%333$1@$0@@@|@|@|@@@"])
  fun op elf64_relocation_a_fupdcanon_comp x = x
    val op elf64_relocation_a_fupdcanon_comp =
    DT(((("elf_relocation",107),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_relocation",[90,91,92,102])]),["DISK_THM"]),
       [read"%197%197%160%111%160%95%228%394%335$0@@%337$1@@@%394%337$1@@%335$0@@@|@|@@%159%116%160%111%160%95%224%393%335$0@@%393%337$1@@$2@@@%393%337$1@@%393%335$0@@$2@@@|@|@|@@@%197%197%160%111%160%95%228%394%333$0@@%337$1@@@%394%337$1@@%333$0@@@|@|@@%159%116%160%111%160%95%224%393%333$0@@%393%337$1@@$2@@@%393%337$1@@%393%333$0@@$2@@@|@|@|@@@%197%160%111%160%95%228%394%333$0@@%335$1@@@%394%335$1@@%333$0@@@|@|@@%159%116%160%111%160%95%224%393%333$0@@%393%335$1@@$2@@@%393%335$1@@%393%333$0@@$2@@@|@|@|@@@@"])
  fun op elf64_relocation_a_component_equality x = x
    val op elf64_relocation_a_component_equality =
    DT(((("elf_relocation",108),
        [("bool",[25,26,50,55,62,180]),("elf_relocation",[90,91,92,98]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%154%60%154%64%202%208$1@$0@@%197%203%336$1@@%336$0@@@%197%203%334$1@@%334$0@@@%203%332$1@@%332$0@@@@@|@|@"])
  fun op elf64_relocation_a_updates_eq_literal x = x
    val op elf64_relocation_a_updates_eq_literal =
    DT(((("elf_relocation",109),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_relocation",[90,91,92,102])]),["DISK_THM"]),
       [read"%154%56%149%45%149%39%149%37%208%337%280$2@@%335%280$1@@%333%280$0@@$3@@@@%337%280$2@@%335%280$1@@%333%280$0@@%255@@@@|@|@|@|@"])
  fun op elf64_relocation_a_literal_nchotomy x = x
    val op elf64_relocation_a_literal_nchotomy =
    DT(((("elf_relocation",110),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_relocation",[90,91,92,102]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%154%56%237%45%237%39%237%37%208$3@%337%280$2@@%335%280$1@@%333%280$0@@%255@@@@|@|@|@|@"])
  fun op FORALL_elf64_relocation_a x = x
    val op FORALL_elf64_relocation_a =
    DT(((("elf_relocation",111),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_relocation",[90,91,92,102]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%169%15%202%154%56$1$0@|@@%149%45%149%39%149%37$3%337%280$2@@%335%280$1@@%333%280$0@@%255@@@@|@|@|@@|@"])
  fun op EXISTS_elf64_relocation_a x = x
    val op EXISTS_elf64_relocation_a =
    DT(((("elf_relocation",112),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_relocation",[90,91,92,102]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%169%15%202%242%56$1$0@|@@%237%45%237%39%237%37$3%337%280$2@@%335%280$1@@%333%280$0@@%255@@@@|@|@|@@|@"])
  fun op elf64_relocation_a_literal_11 x = x
    val op elf64_relocation_a_literal_11 =
    DT(((("elf_relocation",113),
        [("combin",[12]),("elf_relocation",[103,108])]),["DISK_THM"]),
       [read"%149%47%149%41%149%45%149%49%149%43%149%51%202%208%337%280$5@@%335%280$4@@%333%280$3@@%255@@@@%337%280$2@@%335%280$1@@%333%280$0@@%255@@@@@%197%203$5@$2@@%197%203$4@$1@@%203$3@$0@@@@|@|@|@|@|@|@"])
  fun op datatype_elf64_relocation_a x = x
    val op datatype_elf64_relocation_a =
    DT(((("elf_relocation",114),[("bool",[25,170])]),["DISK_THM"]),
       [read"%274%130%83@%81@%80@%79@@"])
  fun op elf64_relocation_a_11 x = x
    val op elf64_relocation_a_11 =
    DT(((("elf_relocation",115),
        [("bool",[26,50,55,62,180]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%149%18%149%26%149%30%149%20%149%28%149%32%202%208%417$5@$4@$3@@%417$2@$1@$0@@@%197%203$5@$2@@%197%203$4@$1@@%203$3@$0@@@@|@|@|@|@|@|@"])
  fun op elf64_relocation_a_case_cong x = x
    val op elf64_relocation_a_case_cong =
    DT(((("elf_relocation",116),
        [("bool",[26,180]),
         ("elf_relocation",[90,91,92,93])]),["DISK_THM"]),
       [read"%154%7%154%11%162%97%236%197%208$2@$1@@%149%18%149%26%149%30%236%208$4@%417$2@$1@$0@@@%200$3$2@$1@$0@@%102$2@$1@$0@@@|@|@|@@@%200%330$2@$0@@%330$1@%102@@@|@|@|@"])
  fun op elf64_relocation_a_nchotomy x = x
    val op elf64_relocation_a_nchotomy =
    DT(((("elf_relocation",117),
        [("bool",[26,180]),("elf_relocation",[90,91,92])]),["DISK_THM"]),
       [read"%154%69%237%37%237%39%237%45%208$3@%417$2@$1@$0@@|@|@|@|@"])
  fun op elf64_relocation_a_Axiom x = x
    val op elf64_relocation_a_Axiom =
    DT(((("elf_relocation",118),
        [("bool",[26,180]),("elf_relocation",[90,91,92]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%162%97%249%110%149%18%149%26%149%30%200$3%417$2@$1@$0@@@$4$2@$1@$0@@|@|@|@|@|@"])
  fun op elf64_relocation_a_induction x = x
    val op elf64_relocation_a_induction =
    DT(((("elf_relocation",119),
        [("bool",[26]),("elf_relocation",[90,91,92])]),["DISK_THM"]),
       [read"%169%15%236%149%37%149%39%149%45$3%417$2@$1@$0@@|@|@|@@%154%56$1$0@|@@|@"])
  fun op read_elf32_relocation_section'_ind x = x
    val op read_elf32_relocation_section'_ind =
    DT(((("elf_relocation",140),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%170%16%236%155%84%147%35%236%147%36%236%436%230%383$1@@%198@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%155%143%147%144$2$1@$0@|@|@@|@",
        read"%155%84%147%35%147%36%236%436%230%383$1@@%198@@@%17%189$2@$0@@%189$2@$1@@@|@|@|@",
        read"%313%17@"])
  fun op read_elf32_relocation_section'_def x = x
    val op read_elf32_relocation_section'_def =
    DT(((("elf_relocation",141),
        [("bool",[15,57,128]),("combin",[19]),("elf_relocation",[138,139]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%155%84%147%35%209%402$1@$0@@%262%230%383$0@@%198@@%418%287@@%360%397$1@$0@@%309%91%36%344%402$3@$0@@%139%418%266$2@$0@@|@||@@@@|@|@",
        read"%155%84%147%35%147%36%236%436%230%383$1@@%198@@@%17%189$2@$0@@%189$2@$1@@@|@|@|@",
        read"%313%17@"])
  fun op read_elf64_relocation_section'_ind x = x
    val op read_elf64_relocation_section'_ind =
    DT(((("elf_relocation",144),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%170%16%236%155%84%147%35%236%147%36%236%436%230%383$1@@%198@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%155%143%147%144$2$1@$0@|@|@@|@",
        read"%155%84%147%35%147%36%236%436%230%383$1@@%198@@@%17%189$2@$0@@%189$2@$1@@@|@|@|@",
        read"%313%17@"])
  fun op read_elf64_relocation_section'_def x = x
    val op read_elf64_relocation_section'_def =
    DT(((("elf_relocation",145),
        [("bool",[15,57,128]),("combin",[19]),("elf_relocation",[142,143]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%155%84%147%35%211%411$1@$0@@%264%230%383$0@@%198@@%420%289@@%362%406$1@$0@@%311%93%36%348%411$3@$0@@%141%420%268$2@$0@@|@||@@@@|@|@",
        read"%155%84%147%35%147%36%236%436%230%383$1@@%198@@@%17%189$2@$0@@%189$2@$1@@@|@|@|@",
        read"%313%17@"])
  fun op read_elf32_relocation_a_section'_ind x = x
    val op read_elf32_relocation_a_section'_ind =
    DT(((("elf_relocation",148),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%170%16%236%155%84%147%35%236%147%36%236%436%230%383$1@@%198@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%155%143%147%144$2$1@$0@|@|@@|@",
        read"%155%84%147%35%147%36%236%436%230%383$1@@%198@@@%17%189$2@$0@@%189$2@$1@@@|@|@|@",
        read"%313%17@"])
  fun op read_elf32_relocation_a_section'_def x = x
    val op read_elf32_relocation_a_section'_def =
    DT(((("elf_relocation",149),
        [("bool",[15,57,128]),("combin",[19]),("elf_relocation",[146,147]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%155%84%147%35%210%400$1@$0@@%263%230%383$0@@%198@@%419%288@@%361%398$1@$0@@%310%92%36%346%400$3@$0@@%140%419%267$2@$0@@|@||@@@@|@|@",
        read"%155%84%147%35%147%36%236%436%230%383$1@@%198@@@%17%189$2@$0@@%189$2@$1@@@|@|@|@",
        read"%313%17@"])
  fun op read_elf64_relocation_a_section'_ind x = x
    val op read_elf64_relocation_a_section'_ind =
    DT(((("elf_relocation",152),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%170%16%236%155%84%147%35%236%147%36%236%436%230%383$1@@%198@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%155%143%147%144$2$1@$0@|@|@@|@",
        read"%155%84%147%35%147%36%236%436%230%383$1@@%198@@@%17%189$2@$0@@%189$2@$1@@@|@|@|@",
        read"%313%17@"])
  fun op read_elf64_relocation_a_section'_def x = x
    val op read_elf64_relocation_a_section'_def =
    DT(((("elf_relocation",153),
        [("bool",[15,57,128]),("combin",[19]),("elf_relocation",[150,151]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%155%84%147%35%212%409$1@$0@@%265%230%383$0@@%198@@%421%290@@%363%407$1@$0@@%312%94%36%350%409$3@$0@@%142%421%269$2@$0@@|@||@@@@|@|@",
        read"%155%84%147%35%147%36%236%436%230%383$1@@%198@@@%17%189$2@$0@@%189$2@$1@@@|@|@|@",
        read"%313%17@"])
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

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("elf_types_native_uintTheory.elf_types_native_uint_grammars",
                          elf_types_native_uintTheory.elf_types_native_uint_grammars),
                         ("lem_setTheory.lem_set_grammars",
                          lem_setTheory.lem_set_grammars)]
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
       ("read_elf32_relocation_section'", (Term.prim_mk_const { Name = "read_elf32_relocation_section'", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_section'", (Term.prim_mk_const { Name = "read_elf32_relocation_section'", Thy = "elf_relocation"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_section'", (Term.prim_mk_const { Name = "read_elf64_relocation_section'", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_relocation_section'", (Term.prim_mk_const { Name = "read_elf64_relocation_section'", Thy = "elf_relocation"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_a_section'", (Term.prim_mk_const { Name = "read_elf32_relocation_a_section'", Thy = "elf_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_relocation_a_section'", (Term.prim_mk_const { Name = "read_elf32_relocation_a_section'", Thy = "elf_relocation"}))


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
