structure missing_pervasivesTheory :> missing_pervasivesTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading missing_pervasivesTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open lem_sortingTheory showTheory
  in end;
  val _ = Theory.link_parents
          ("missing_pervasives",
          Arbnum.fromString "1471355106",
          Arbnum.fromString "934043")
          [("show",
           Arbnum.fromString "1471355094",
           Arbnum.fromString "275066"),
           ("lem_sorting",
           Arbnum.fromString "1471353329",
           Arbnum.fromString "675733")];
  val _ = Theory.incorporate_types "missing_pervasives" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("list", "list"), ID("pair", "prod"),
   ID("string", "char"), ID("num", "num"), ID("option", "option"),
   ID("show", "Show_class"), ID("lem_basic_classes", "ordering"),
   ID("min", "bool"), ID("fcp", "cart"),
   ID("lem_basic_classes", "Ord_class"), ID("bool", "!"),
   ID("arithmetic", "*"), ID("arithmetic", "+"), ID("pair", ","),
   ID("arithmetic", "-"), ID("bool", "/\\"), ID("num", "0"),
   ID("prim_rec", "<"), ID("arithmetic", "<="), ID("min", "="),
   ID("min", "==>"), ID("arithmetic", ">"), ID("min", "@"),
   ID("list", "APPEND"), ID("bool", "ARB"), ID("arithmetic", "BIT1"),
   ID("arithmetic", "BIT2"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("arithmetic", "DIV"), ID("list", "DROP"),
   ID("lem_basic_classes", "EQ"), ID("string", "EXPLODE"),
   ID("list", "FOLDL"), ID("list", "GENLIST"),
   ID("lem_basic_classes", "GT"), ID("combin", "I"),
   ID("string", "IMPLODE"), ID("combin", "K"), ID("list", "LENGTH"),
   ID("bool", "LET"), ID("lem_basic_classes", "LT"), ID("list", "MAP"),
   ID("arithmetic", "MOD"), ID("list", "NIL"), ID("option", "NONE"),
   ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("sorting", "QSORT"), ID("list", "REV"), ID("list", "REVERSE"),
   ID("option", "SOME"), ID("num", "SUC"),
   ID("show", "Show_class_show_method"),
   ID("show", "Show_class_show_method_fupd"), ID("list", "TAKE"),
   ID("pair", "UNCURRY"), ID("list", "UNZIP"), ID("relation", "WF"),
   ID("relation", "WFREC"), ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("missing_pervasives", "bracket"),
   ID("missing_pervasives", "compare_byte"),
   ID("missing_pervasives", "drop"), ID("lem_assert_extra", "fail"),
   ID("lem", "failwith"), ID("missing_pervasives", "filteri"),
   ID("missing_pervasives", "filterii"),
   ID("missing_pervasives", "find_index0"),
   ID("missing_pervasives", "find_index_helper"),
   ID("lem_basic_classes", "genericCompare"),
   ID("missing_pervasives", "hex_char_of_nibble"),
   ID("missing_pervasives", "hex_string_of_byte"),
   ID("missing_pervasives", "hex_string_of_natural"),
   ID("missing_pervasives", "id"), ID("missing_pervasives", "index"),
   ID("missing_pervasives", "instance_Basic_classes_Ord_Missing_pervasives_byte_dict"),
   ID("missing_pervasives", "instance_Show_Show_Missing_pervasives_byte_dict"),
   ID("missing_pervasives", "instance_Show_Show_list_dict"),
   ID("missing_pervasives", "intercalate"),
   ID("missing_pervasives", "intercalate'"),
   ID("missing_pervasives", "left_padded_to"),
   ID("missing_pervasives", "left_space_padded_to"),
   ID("missing_pervasives", "left_zero_padded_to"),
   ID("missing_pervasives", "length"), ID("list", "list_CASE"),
   ID("missing_pervasives", "list_append"), ID("lem_list", "list_combine"),
   ID("missing_pervasives", "list_concat"),
   ID("missing_pervasives", "list_concat_map"),
   ID("missing_pervasives", "list_reverse_concat_map"),
   ID("missing_pervasives", "list_reverse_concat_map_helper"),
   ID("missing_pervasives", "list_take_with_accum"),
   ID("missing_pervasives", "mapMaybei"),
   ID("missing_pervasives", "mapMaybei'"),
   ID("missing_pervasives", "merge_by"),
   ID("missing_pervasives", "naturalZero"),
   ID("missing_pervasives", "natural_of_bool"),
   ID("missing_pervasives", "natural_of_decimal_digit"),
   ID("missing_pervasives", "natural_of_decimal_string"),
   ID("missing_pervasives", "natural_of_decimal_string_helper"),
   ID("missing_pervasives", "natural_ordering"),
   ID("arithmetic", "num_CASE"), ID("option", "option_CASE"),
   ID("missing_pervasives", "padded_and_maybe_newline"),
   ID("missing_pervasives", "padding_and_maybe_newline"),
   ID("missing_pervasives", "padding_to"), ID("pair", "pair_CASE"),
   ID("missing_pervasives", "partitioni"),
   ID("missing_pervasives", "partitionii"),
   ID("missing_pervasives", "partitionii'"),
   ID("missing_pervasives", "replicate"),
   ID("missing_pervasives", "replicate_revacc"),
   ID("missing_pervasives", "right_padded_to"),
   ID("missing_pervasives", "right_space_padded_to"),
   ID("missing_pervasives", "sort_by"),
   ID("missing_pervasives", "space_padded_and_maybe_newline"),
   ID("missing_pervasives", "space_padding_and_maybe_newline"),
   ID("missing_pervasives", "string_index_of"),
   ID("missing_pervasives", "string_index_of'"),
   ID("missing_pervasives", "string_of_list"),
   ID("missing_pervasives", "string_prefix"),
   ID("missing_pervasives", "take"),
   ID("missing_pervasives", "takeRevAcc"),
   ID("missing_pervasives", "unlines"),
   ID("missing_pervasives", "unsafe_string_take"),
   ID("missing_pervasives", "unzip3"), ID("words", "w2n"),
   ID("missing_pervasives", "zip3"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'c", TYV "'b", TYOP [2, 1, 0], TYV "'a", TYOP [2, 3, 2],
   TYOP [1, 4], TYOP [1, 0], TYOP [0, 6, 5], TYOP [1, 1], TYOP [0, 8, 7],
   TYOP [1, 3], TYOP [0, 10, 9], TYOP [2, 8, 6], TYOP [2, 10, 12],
   TYOP [0, 5, 13], TYOP [3], TYOP [1, 15], TYOP [0, 16, 16], TYOP [4],
   TYOP [0, 18, 17], TYOP [1, 16], TYOP [0, 20, 16], TYOP [0, 10, 10],
   TYOP [0, 10, 22], TYOP [0, 18, 23], TYOP [0, 18, 22], TYOP [5, 16],
   TYOP [0, 16, 26], TYOP [0, 18, 27], TYOP [0, 10, 16], TYOP [6, 3],
   TYOP [0, 30, 29], TYOP [5, 18], TYOP [0, 18, 32], TYOP [0, 10, 33],
   TYOP [0, 3, 34], TYOP [0, 16, 32], TYOP [0, 15, 36], TYOP [7],
   TYOP [0, 3, 38], TYOP [0, 3, 39], TYOP [0, 40, 22], TYOP [0, 15, 19],
   TYOP [0, 3, 10], TYOP [0, 18, 43], TYOP [0, 10, 44], TYOP [2, 18, 3],
   TYOP [1, 46], TYOP [2, 47, 47], TYOP [0, 47, 48], TYOP [0, 47, 49],
   TYOP [0, 10, 50], TYOP [1, 18], TYOP [0, 52, 51], TYOP [0, 18, 53],
   TYOP [0, 10, 48], TYOP [0, 52, 55], TYOP [2, 10, 10], TYOP [0, 10, 57],
   TYOP [0, 52, 58], TYOP [0, 18, 38], TYOP [0, 18, 60], TYOP [0, 16, 18],
   TYOP [0, 18, 62], TYOP [0, 15, 32], TYOP [8], TYOP [0, 65, 18],
   TYOP [0, 40, 23], TYOP [0, 8, 10], TYOP [0, 18, 68], TYOP [5, 3],
   TYOP [0, 1, 70], TYOP [0, 18, 71], TYOP [0, 72, 69], TYOP [0, 72, 68],
   TYOP [0, 10, 68], TYOP [0, 1, 10], TYOP [0, 76, 75], TYOP [0, 76, 68],
   TYOP [1, 10], TYOP [0, 79, 10], TYOP [0, 10, 18], TYOP [0, 3, 23],
   TYOP [0, 3, 22], TYOP [6, 10], TYOP [0, 30, 84], TYOP [9, 65, 3],
   TYOP [6, 86], TYOP [10, 86], TYOP [0, 10, 70], TYOP [0, 18, 89],
   TYOP [0, 3, 3], TYOP [0, 18, 16], TYOP [0, 86, 16], TYOP [0, 18, 15],
   TYOP [0, 10, 32], TYOP [0, 3, 65], TYOP [0, 96, 95], TYOP [0, 18, 97],
   TYOP [0, 10, 47], TYOP [0, 52, 99], TYOP [0, 52, 22], TYOP [9, 65, 1],
   TYOP [0, 102, 38], TYOP [0, 86, 103], TYOP [0, 10, 65],
   TYOP [0, 10, 105], TYOP [0, 3, 106], TYOP [0, 18, 65],
   TYOP [0, 10, 108], TYOP [0, 3, 109], TYOP [0, 40, 105],
   TYOP [0, 40, 106], TYOP [0, 8, 65], TYOP [0, 10, 113],
   TYOP [0, 76, 114], TYOP [0, 18, 113], TYOP [0, 72, 116],
   TYOP [0, 6, 65], TYOP [0, 8, 118], TYOP [0, 10, 119], TYOP [0, 18, 96],
   TYOP [0, 10, 121], TYOP [0, 5, 65], TYOP [0, 96, 105],
   TYOP [0, 18, 124], TYOP [0, 18, 105], TYOP [0, 18, 106],
   TYOP [0, 16, 65], TYOP [0, 18, 128], TYOP [0, 47, 65],
   TYOP [0, 47, 130], TYOP [0, 10, 131], TYOP [0, 52, 132],
   TYOP [0, 18, 133], TYOP [0, 5, 123], TYOP [0, 18, 108], TYOP [2, 3, 57],
   TYOP [0, 137, 65], TYOP [0, 137, 138], TYOP [2, 10, 18],
   TYOP [2, 3, 140], TYOP [0, 141, 65], TYOP [0, 141, 142],
   TYOP [2, 40, 10], TYOP [0, 144, 65], TYOP [0, 144, 145],
   TYOP [2, 40, 57], TYOP [0, 147, 65], TYOP [0, 147, 148],
   TYOP [2, 10, 8], TYOP [2, 76, 150], TYOP [0, 151, 65],
   TYOP [0, 151, 152], TYOP [2, 18, 8], TYOP [2, 72, 154],
   TYOP [0, 155, 65], TYOP [0, 155, 156], TYOP [0, 13, 65],
   TYOP [0, 13, 158], TYOP [2, 10, 46], TYOP [0, 160, 65],
   TYOP [0, 160, 161], TYOP [2, 18, 10], TYOP [0, 163, 65],
   TYOP [0, 163, 164], TYOP [2, 18, 16], TYOP [0, 166, 65],
   TYOP [0, 166, 167], TYOP [2, 96, 10], TYOP [2, 18, 169],
   TYOP [0, 170, 65], TYOP [0, 170, 171], TYOP [2, 18, 57],
   TYOP [0, 173, 65], TYOP [0, 173, 174], TYOP [2, 10, 48],
   TYOP [2, 52, 176], TYOP [2, 18, 177], TYOP [0, 178, 65],
   TYOP [0, 178, 179], TYOP [0, 10, 43], TYOP [0, 96, 65], TYOP [0, 1, 65],
   TYOP [0, 183, 65], TYOP [0, 0, 65], TYOP [0, 185, 65], TYOP [0, 30, 65],
   TYOP [0, 187, 65], TYOP [0, 65, 65], TYOP [0, 189, 65],
   TYOP [0, 86, 65], TYOP [0, 191, 65], TYOP [0, 102, 65],
   TYOP [0, 193, 65], TYOP [0, 15, 65], TYOP [0, 195, 65],
   TYOP [0, 182, 65], TYOP [0, 40, 65], TYOP [0, 198, 65],
   TYOP [0, 107, 65], TYOP [0, 200, 65], TYOP [0, 110, 65],
   TYOP [0, 202, 65], TYOP [0, 76, 65], TYOP [0, 204, 65],
   TYOP [0, 111, 65], TYOP [0, 206, 65], TYOP [0, 112, 65],
   TYOP [0, 208, 65], TYOP [0, 115, 65], TYOP [0, 210, 65],
   TYOP [0, 117, 65], TYOP [0, 212, 65], TYOP [0, 181, 65],
   TYOP [0, 214, 65], TYOP [0, 120, 65], TYOP [0, 216, 65],
   TYOP [0, 122, 65], TYOP [0, 218, 65], TYOP [0, 123, 65],
   TYOP [0, 220, 65], TYOP [0, 108, 65], TYOP [0, 222, 65],
   TYOP [0, 72, 65], TYOP [0, 224, 65], TYOP [0, 125, 65],
   TYOP [0, 226, 65], TYOP [0, 126, 65], TYOP [0, 228, 65],
   TYOP [0, 127, 65], TYOP [0, 230, 65], TYOP [0, 129, 65],
   TYOP [0, 232, 65], TYOP [0, 134, 65], TYOP [0, 234, 65],
   TYOP [0, 105, 65], TYOP [0, 113, 65], TYOP [0, 118, 65],
   TYOP [0, 128, 65], TYOP [0, 79, 65], TYOP [0, 240, 65],
   TYOP [0, 20, 65], TYOP [0, 242, 65], TYOP [0, 52, 65],
   TYOP [0, 244, 65], TYOP [0, 130, 65], TYOP [0, 4, 65],
   TYOP [0, 247, 65], TYOP [0, 2, 65], TYOP [0, 249, 65], TYOP [0, 12, 65],
   TYOP [0, 251, 65], TYOP [0, 18, 18], TYOP [0, 18, 253], TYOP [0, 2, 4],
   TYOP [0, 3, 255], TYOP [0, 57, 137], TYOP [0, 3, 257],
   TYOP [0, 140, 141], TYOP [0, 3, 259], TYOP [0, 0, 2], TYOP [0, 1, 261],
   TYOP [0, 10, 169], TYOP [0, 96, 263], TYOP [0, 10, 144],
   TYOP [0, 40, 265], TYOP [0, 57, 147], TYOP [0, 40, 267],
   TYOP [0, 150, 151], TYOP [0, 76, 269], TYOP [0, 154, 155],
   TYOP [0, 72, 271], TYOP [0, 10, 58], TYOP [0, 8, 150],
   TYOP [0, 10, 274], TYOP [0, 18, 140], TYOP [0, 10, 276],
   TYOP [0, 12, 13], TYOP [0, 10, 278], TYOP [0, 48, 176],
   TYOP [0, 10, 280], TYOP [0, 46, 160], TYOP [0, 10, 282],
   TYOP [0, 6, 12], TYOP [0, 8, 284], TYOP [0, 176, 177],
   TYOP [0, 52, 286], TYOP [0, 3, 46], TYOP [0, 18, 288],
   TYOP [0, 10, 163], TYOP [0, 18, 290], TYOP [0, 8, 154],
   TYOP [0, 18, 292], TYOP [0, 16, 166], TYOP [0, 18, 294],
   TYOP [0, 169, 170], TYOP [0, 18, 296], TYOP [0, 57, 173],
   TYOP [0, 18, 298], TYOP [0, 177, 178], TYOP [0, 18, 300],
   TYOP [0, 65, 189], TYOP [0, 3, 96], TYOP [0, 88, 65], TYOP [0, 88, 304],
   TYOP [0, 87, 65], TYOP [0, 87, 306], TYOP [0, 84, 65],
   TYOP [0, 84, 308], TYOP [0, 15, 195], TYOP [0, 181, 214],
   TYOP [0, 14, 65], TYOP [0, 14, 312], TYOP [0, 92, 65],
   TYOP [0, 92, 314], TYOP [0, 8, 113], TYOP [0, 6, 118],
   TYOP [0, 16, 128], TYOP [0, 52, 244], TYOP [0, 70, 65],
   TYOP [0, 70, 320], TYOP [0, 26, 65], TYOP [0, 26, 322],
   TYOP [0, 32, 65], TYOP [0, 32, 324], TYOP [0, 38, 65],
   TYOP [0, 38, 326], TYOP [0, 4, 247], TYOP [0, 2, 249], TYOP [0, 57, 65],
   TYOP [0, 57, 330], TYOP [0, 12, 251], TYOP [0, 48, 65],
   TYOP [0, 48, 333], TYOP [0, 135, 65], TYOP [0, 335, 135],
   TYOP [0, 136, 65], TYOP [0, 337, 136], TYOP [0, 16, 17],
   TYOP [0, 15, 15], TYOP [0, 15, 340], TYOP [0, 65, 341],
   TYOP [0, 65, 23], TYOP [0, 65, 339], TYOP [0, 65, 254],
   TYOP [0, 70, 70], TYOP [0, 70, 346], TYOP [0, 65, 347],
   TYOP [0, 26, 26], TYOP [0, 26, 349], TYOP [0, 65, 350],
   TYOP [0, 32, 32], TYOP [0, 32, 352], TYOP [0, 65, 353],
   TYOP [0, 38, 38], TYOP [0, 38, 355], TYOP [0, 65, 356], TYOP [0, 8, 8],
   TYOP [0, 1, 358], TYOP [0, 6, 6], TYOP [0, 0, 360], TYOP [0, 15, 17],
   TYOP [0, 52, 52], TYOP [0, 18, 363], TYOP [0, 5, 5], TYOP [0, 4, 365],
   TYOP [0, 47, 47], TYOP [0, 46, 367], TYOP [0, 181, 23],
   TYOP [0, 10, 80], TYOP [0, 23, 370], TYOP [0, 16, 21],
   TYOP [0, 339, 372], TYOP [0, 18, 81], TYOP [0, 3, 18],
   TYOP [0, 18, 375], TYOP [0, 376, 374], TYOP [0, 18, 52],
   TYOP [0, 253, 378], TYOP [0, 13, 13], TYOP [0, 86, 191],
   TYOP [0, 381, 381], TYOP [0, 381, 382], TYOP [0, 86, 38],
   TYOP [0, 86, 384], TYOP [0, 385, 385], TYOP [0, 385, 386],
   TYOP [0, 93, 93], TYOP [0, 93, 388], TYOP [0, 29, 29],
   TYOP [0, 29, 390], TYOP [0, 181, 10], TYOP [0, 392, 392],
   TYOP [0, 22, 22], TYOP [0, 17, 17], TYOP [0, 27, 27], TYOP [0, 21, 21],
   TYOP [0, 52, 10], TYOP [0, 398, 398], TYOP [0, 52, 47],
   TYOP [0, 400, 400], TYOP [0, 52, 57], TYOP [0, 402, 402],
   TYOP [0, 52, 48], TYOP [0, 404, 404], TYOP [0, 365, 365],
   TYOP [0, 49, 49], TYOP [0, 92, 92], TYOP [0, 18, 48],
   TYOP [0, 409, 409], TYOP [0, 326, 326], TYOP [0, 57, 48],
   TYOP [0, 412, 412], TYOP [0, 380, 380], TYOP [2, 52, 10],
   TYOP [0, 415, 10], TYOP [0, 416, 416], TYOP [0, 415, 57],
   TYOP [0, 418, 418], TYOP [0, 48, 10], TYOP [0, 420, 420],
   TYOP [0, 48, 47], TYOP [0, 422, 422], TYOP [0, 48, 57],
   TYOP [0, 424, 424], TYOP [0, 10, 20], TYOP [0, 3, 16],
   TYOP [0, 427, 426], TYOP [0, 8, 79], TYOP [0, 76, 429],
   TYOP [0, 88, 88], TYOP [0, 386, 431], TYOP [0, 382, 431],
   TYOP [0, 136, 363], TYOP [0, 47, 367], TYOP [0, 3, 70],
   TYOP [0, 30, 427], TYOP [0, 87, 87], TYOP [0, 388, 438],
   TYOP [0, 84, 84], TYOP [0, 390, 440], TYOP [0, 10, 55],
   TYOP [0, 442, 412], TYOP [0, 279, 380], TYOP [0, 6, 13],
   TYOP [0, 8, 445], TYOP [0, 446, 278], TYOP [0, 101, 416],
   TYOP [0, 59, 418], TYOP [0, 47, 10], TYOP [0, 47, 450],
   TYOP [0, 451, 420], TYOP [0, 435, 422], TYOP [0, 47, 57],
   TYOP [0, 47, 454], TYOP [0, 455, 424], TYOP [0, 47, 415],
   TYOP [0, 139, 65], TYOP [0, 143, 65], TYOP [0, 146, 65],
   TYOP [0, 149, 65], TYOP [0, 153, 65], TYOP [0, 157, 65],
   TYOP [0, 159, 65], TYOP [0, 162, 65], TYOP [0, 165, 65],
   TYOP [0, 168, 65], TYOP [0, 172, 65], TYOP [0, 175, 65],
   TYOP [0, 180, 65], TYOP [0, 14, 14], TYOP [0, 471, 14],
   TYOP [0, 135, 472], TYOP [0, 408, 92], TYOP [0, 136, 474],
   TYOP [0, 16, 10], TYOP [0, 136, 61], TYOP [0, 136, 477],
   TYOP [0, 20, 20], TYOP [0, 16, 479], TYOP [0, 83, 10],
   TYOP [0, 10, 481], TYOP [0, 10, 482], TYOP [0, 10, 5], TYOP [0, 3, 484],
   TYOP [0, 485, 5], TYOP [0, 5, 486], TYOP [0, 10, 487], TYOP [0, 3, 89],
   TYOP [0, 489, 70], TYOP [0, 70, 490], TYOP [0, 10, 491],
   TYOP [0, 3, 95], TYOP [0, 493, 32], TYOP [0, 32, 494],
   TYOP [0, 10, 495], TYOP [0, 3, 55], TYOP [0, 497, 48],
   TYOP [0, 48, 498], TYOP [0, 10, 499], TYOP [0, 1, 68],
   TYOP [0, 501, 10], TYOP [0, 10, 502], TYOP [0, 8, 503], TYOP [0, 8, 5],
   TYOP [0, 1, 505], TYOP [0, 506, 5], TYOP [0, 5, 507], TYOP [0, 8, 508],
   TYOP [0, 0, 7], TYOP [0, 510, 5], TYOP [0, 5, 511], TYOP [0, 6, 512],
   TYOP [0, 15, 62], TYOP [0, 514, 18], TYOP [0, 18, 515],
   TYOP [0, 16, 516], TYOP [0, 18, 404], TYOP [0, 518, 48],
   TYOP [0, 48, 519], TYOP [0, 52, 520], TYOP [0, 4, 14],
   TYOP [0, 522, 13], TYOP [0, 13, 523], TYOP [0, 5, 524],
   TYOP [0, 18, 10], TYOP [0, 526, 10], TYOP [0, 10, 527],
   TYOP [0, 18, 528], TYOP [0, 43, 10], TYOP [0, 10, 530],
   TYOP [0, 70, 531], TYOP [0, 253, 18], TYOP [0, 18, 533],
   TYOP [0, 32, 534], TYOP [0, 2, 13], TYOP [0, 3, 536], TYOP [0, 537, 13],
   TYOP [0, 4, 538], TYOP [0, 0, 13], TYOP [0, 1, 540], TYOP [0, 541, 13],
   TYOP [0, 2, 542], TYOP [0, 23, 10], TYOP [0, 57, 544], TYOP [0, 12, 5],
   TYOP [0, 10, 546], TYOP [0, 547, 5], TYOP [0, 13, 548], TYOP [0, 9, 5],
   TYOP [0, 12, 550], TYOP [0, 376, 18], TYOP [0, 46, 552],
   TYOP [0, 15, 16], TYOP [0, 18, 554], TYOP [0, 16, 33],
   TYOP [0, 15, 556], TYOP [0, 86, 18], TYOP [0, 102, 18]]
  end
  val _ = Theory.incorporate_consts "missing_pervasives" tyvector
     [("zip3", 11), ("unzip3", 14), ("unsafe_string_take", 19),
      ("unlines", 21), ("takeRevAcc", 24), ("take", 25),
      ("string_prefix", 28), ("string_of_list", 31),
      ("string_index_of'", 35), ("string_index_of", 37),
      ("space_padding_and_maybe_newline", 19),
      ("space_padded_and_maybe_newline", 19), ("sort_by", 41),
      ("right_space_padded_to", 19), ("right_padded_to", 42),
      ("replicate_revacc", 45), ("replicate", 44), ("partitionii'", 54),
      ("partitionii", 56), ("partitioni", 59), ("padding_to", 42),
      ("padding_and_maybe_newline", 42), ("padded_and_maybe_newline", 42),
      ("natural_ordering", 61), ("natural_of_decimal_string_helper", 63),
      ("natural_of_decimal_string", 62), ("natural_of_decimal_digit", 64),
      ("natural_of_bool", 66), ("naturalZero", 18), ("merge_by", 67),
      ("mapMaybei'", 73), ("mapMaybei", 74), ("list_take_with_accum", 24),
      ("list_reverse_concat_map_helper", 77),
      ("list_reverse_concat_map", 78), ("list_concat_map", 78),
      ("list_concat", 80), ("list_append", 23), ("length", 81),
      ("left_zero_padded_to", 19), ("left_space_padded_to", 19),
      ("left_padded_to", 42), ("intercalate'", 82), ("intercalate", 83),
      ("instance_Show_Show_list_dict", 85),
      ("instance_Show_Show_Missing_pervasives_byte_dict", 87),
      ("instance_Basic_classes_Ord_Missing_pervasives_byte_dict", 88),
      ("index", 90), ("id", 91), ("hex_string_of_natural", 92),
      ("hex_string_of_byte", 93), ("hex_char_of_nibble", 94),
      ("find_index_helper", 98), ("find_index0", 97), ("filterii", 100),
      ("filteri", 101), ("drop", 25), ("compare_byte", 104),
      ("bracket", 21)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("P", 107), TMV("P", 110), TMV("P", 111), TMV("P", 112),
   TMV("P", 115), TMV("P", 117), TMV("P", 120), TMV("P", 122),
   TMV("P", 123), TMV("P", 108), TMV("P", 125), TMV("P", 126),
   TMV("P", 127), TMV("P", 129), TMV("P", 134), TMV("R", 135),
   TMV("R", 136), TMV("R", 139), TMV("R", 143), TMV("R", 146),
   TMV("R", 149), TMV("R", 153), TMV("R", 157), TMV("R", 159),
   TMV("R", 162), TMV("R", 165), TMV("R", 168), TMV("R", 172),
   TMV("R", 175), TMV("R", 180), TMV("acc", 10), TMV("acc", 18),
   TMV("accum", 10), TMV("accum", 47), TMV("accum_compl", 47),
   TMV("alist", 10), TMV("b", 65), TMV("b", 86), TMV("b1", 86),
   TMV("b2", 102), TMV("blist", 8), TMV("c", 15), TMV("chars", 16),
   TMV("clist", 6), TMV("comp", 40), TMV("count1", 18), TMV("cs", 16),
   TMV("dict_Show_Show_a", 30), TMV("dig", 18), TMV("e", 3), TMV("e", 15),
   TMV("f", 76), TMV("f", 72), TMV("f1", 86), TMV("f2", 86),
   TMV("folded", 16), TMV("hex_string_of_natural", 92), TMV("i", 3),
   TMV("i", 18), TMV("idx", 18), TMV("is", 52), TMV("item", 1),
   TMV("items", 8), TMV("j", 18), TMV("just_indices", 52),
   TMV("just_indices_compl", 52), TMV("just_items", 10),
   TMV("just_items_compl", 10), TMV("l", 10), TMV("l", 8), TMV("l", 5),
   TMV("l1", 10), TMV("l2", 10), TMV("lcons", 181), TMV("left", 10),
   TMV("left", 18), TMV("left_indices", 52), TMV("left_with_indices", 47),
   TMV("len", 18), TMV("length_to_split_off", 18), TMV("ll", 8),
   TMV("ll", 79), TMV("ls", 10), TMV("m", 18), TMV("mapped_list", 10),
   TMV("more_is", 52), TMV("more_xs", 10), TMV("more_xyz", 5),
   TMV("morex", 10), TMV("morey", 8), TMV("morez", 6), TMV("n", 18),
   TMV("offset", 18), TMV("p", 96), TMV("padlen", 18), TMV("result", 20),
   TMV("result", 38), TMV("rev_acc", 10), TMV("revacc", 10),
   TMV("reverse_acc", 10), TMV("reverse_accum", 47),
   TMV("reverse_accum_compl", 47), TMV("right", 10), TMV("right", 18),
   TMV("rs", 10), TMV("s", 3), TMV("s", 16), TMV("sep", 3),
   TMV("sorted_is", 52), TMV("ss", 10), TMV("ss'", 10), TMV("str", 16),
   TMV("unzip3", 14), TMV("v", 3), TMV("v", 40), TMV("v", 76),
   TMV("v", 72), TMV("v", 10), TMV("v", 5), TMV("v", 18), TMV("v", 4),
   TMV("v1", 3), TMV("v1", 96), TMV("v1", 10), TMV("v1", 8), TMV("v1", 16),
   TMV("v1", 52), TMV("v1", 18), TMV("v1", 12), TMV("v10", 3),
   TMV("v11", 10), TMV("v2", 3), TMV("v2", 10), TMV("v2", 8), TMV("v2", 6),
   TMV("v2", 18), TMV("v3", 10), TMV("v3", 6), TMV("v3", 47), TMV("v3", 2),
   TMV("v4", 47), TMV("v6", 3), TMV("v6", 0), TMV("v7", 10), TMV("v7", 6),
   TMV("width", 18), TMV("x", 3), TMV("x", 1), TMV("xs", 10), TMV("xs", 8),
   TMV("xs", 20), TMV("xs'", 10), TMV("xs'", 8), TMV("xyzs", 5),
   TMV("y", 3), TMV("y", 1), TMV("y", 18), TMV("ys", 10), TMV("ys", 8),
   TMV("ys'", 10), TMV("ys''", 10), TMV("z", 0), TMV("zs", 6),
   TMC(11, 182), TMC(11, 184), TMC(11, 186), TMC(11, 188), TMC(11, 190),
   TMC(11, 192), TMC(11, 194), TMC(11, 196), TMC(11, 197), TMC(11, 199),
   TMC(11, 201), TMC(11, 203), TMC(11, 205), TMC(11, 207), TMC(11, 209),
   TMC(11, 211), TMC(11, 213), TMC(11, 215), TMC(11, 217), TMC(11, 219),
   TMC(11, 221), TMC(11, 223), TMC(11, 225), TMC(11, 227), TMC(11, 229),
   TMC(11, 231), TMC(11, 233), TMC(11, 235), TMC(11, 236), TMC(11, 237),
   TMC(11, 238), TMC(11, 239), TMC(11, 241), TMC(11, 243), TMC(11, 245),
   TMC(11, 220), TMC(11, 246), TMC(11, 222), TMC(11, 248), TMC(11, 250),
   TMC(11, 252), TMC(12, 254), TMC(13, 254), TMC(14, 256), TMC(14, 258),
   TMC(14, 260), TMC(14, 262), TMC(14, 264), TMC(14, 266), TMC(14, 268),
   TMC(14, 270), TMC(14, 272), TMC(14, 273), TMC(14, 275), TMC(14, 277),
   TMC(14, 279), TMC(14, 281), TMC(14, 283), TMC(14, 285), TMC(14, 287),
   TMC(14, 50), TMC(14, 289), TMC(14, 291), TMC(14, 293), TMC(14, 295),
   TMC(14, 297), TMC(14, 299), TMC(14, 301), TMC(15, 254), TMC(16, 302),
   TMC(17, 18), TMC(18, 136), TMC(19, 136), TMC(20, 303), TMC(20, 305),
   TMC(20, 307), TMC(20, 309), TMC(20, 310), TMC(20, 311), TMC(20, 313),
   TMC(20, 315), TMC(20, 106), TMC(20, 316), TMC(20, 317), TMC(20, 318),
   TMC(20, 319), TMC(20, 135), TMC(20, 131), TMC(20, 136), TMC(20, 321),
   TMC(20, 323), TMC(20, 325), TMC(20, 327), TMC(20, 328), TMC(20, 329),
   TMC(20, 331), TMC(20, 159), TMC(20, 332), TMC(20, 334), TMC(21, 302),
   TMC(22, 136), TMC(23, 336), TMC(23, 338), TMC(24, 23), TMC(24, 339),
   TMC(25, 88), TMC(25, 87), TMC(25, 84), TMC(25, 5), TMC(26, 253),
   TMC(27, 253), TMC(28, 94), TMC(29, 342), TMC(29, 343), TMC(29, 344),
   TMC(29, 345), TMC(29, 348), TMC(29, 351), TMC(29, 354), TMC(29, 357),
   TMC(30, 83), TMC(30, 359), TMC(30, 361), TMC(30, 362), TMC(30, 364),
   TMC(30, 366), TMC(30, 368), TMC(31, 254), TMC(32, 25), TMC(33, 38),
   TMC(34, 17), TMC(35, 369), TMC(35, 371), TMC(35, 373), TMC(35, 377),
   TMC(36, 379), TMC(37, 38), TMC(38, 17), TMC(38, 380), TMC(39, 17),
   TMC(40, 383), TMC(40, 387), TMC(40, 389), TMC(40, 391), TMC(41, 81),
   TMC(41, 62), TMC(42, 393), TMC(42, 394), TMC(42, 395), TMC(42, 396),
   TMC(42, 397), TMC(42, 399), TMC(42, 401), TMC(42, 403), TMC(42, 405),
   TMC(42, 406), TMC(42, 407), TMC(42, 408), TMC(42, 410), TMC(42, 411),
   TMC(42, 413), TMC(42, 414), TMC(42, 417), TMC(42, 419), TMC(42, 421),
   TMC(42, 423), TMC(42, 425), TMC(43, 38), TMC(44, 428), TMC(44, 430),
   TMC(45, 254), TMC(46, 10), TMC(46, 8), TMC(46, 6), TMC(46, 16),
   TMC(46, 5), TMC(46, 47), TMC(47, 70), TMC(47, 26), TMC(47, 32),
   TMC(48, 253), TMC(49, 432), TMC(50, 433), TMC(51, 433), TMC(52, 433),
   TMC(53, 433), TMC(54, 434), TMC(55, 23), TMC(55, 435), TMC(56, 22),
   TMC(56, 367), TMC(57, 436), TMC(57, 27), TMC(57, 33), TMC(58, 253),
   TMC(59, 437), TMC(60, 439), TMC(60, 441), TMC(61, 25), TMC(61, 19),
   TMC(62, 443), TMC(62, 444), TMC(62, 447), TMC(62, 448), TMC(62, 449),
   TMC(62, 452), TMC(62, 453), TMC(62, 456), TMC(63, 457), TMC(64, 335),
   TMC(64, 337), TMC(64, 458), TMC(64, 459), TMC(64, 460), TMC(64, 461),
   TMC(64, 462), TMC(64, 463), TMC(64, 464), TMC(64, 465), TMC(64, 466),
   TMC(64, 467), TMC(64, 468), TMC(64, 469), TMC(64, 470), TMC(65, 473),
   TMC(65, 475), TMC(66, 18), TMC(67, 302), TMC(68, 21), TMC(69, 385),
   TMC(69, 104), TMC(70, 25), TMC(71, 15), TMC(72, 476), TMC(73, 101),
   TMC(74, 100), TMC(75, 97), TMC(76, 98), TMC(77, 478), TMC(78, 94),
   TMC(79, 93), TMC(80, 92), TMC(81, 91), TMC(82, 90), TMC(83, 88),
   TMC(84, 87), TMC(85, 85), TMC(86, 83), TMC(86, 480), TMC(87, 82),
   TMC(88, 42), TMC(89, 19), TMC(90, 19), TMC(91, 81), TMC(91, 62),
   TMC(92, 483), TMC(92, 488), TMC(92, 492), TMC(92, 496), TMC(92, 500),
   TMC(92, 504), TMC(92, 509), TMC(92, 513), TMC(92, 517), TMC(92, 521),
   TMC(92, 525), TMC(93, 23), TMC(94, 100), TMC(95, 80), TMC(96, 78),
   TMC(97, 78), TMC(98, 77), TMC(99, 24), TMC(100, 74), TMC(101, 73),
   TMC(102, 67), TMC(103, 18), TMC(104, 66), TMC(105, 64), TMC(106, 62),
   TMC(107, 63), TMC(108, 61), TMC(109, 529), TMC(110, 532), TMC(110, 535),
   TMC(111, 42), TMC(112, 42), TMC(113, 42), TMC(114, 539), TMC(114, 543),
   TMC(114, 545), TMC(114, 549), TMC(114, 551), TMC(114, 553),
   TMC(115, 59), TMC(116, 56), TMC(117, 54), TMC(118, 44), TMC(118, 555),
   TMC(119, 45), TMC(120, 42), TMC(121, 19), TMC(122, 41), TMC(123, 19),
   TMC(124, 19), TMC(125, 37), TMC(126, 35), TMC(126, 557), TMC(127, 31),
   TMC(128, 28), TMC(129, 25), TMC(129, 19), TMC(130, 24), TMC(131, 21),
   TMC(132, 19), TMC(133, 14), TMC(134, 558), TMC(134, 559), TMC(135, 11),
   TMC(136, 189)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op naturalZero_def x = x
    val op naturalZero_def =
    DT(((("missing_pervasives",0),[]),[]), [read"%251%439@%233@"])
  fun op id_def x = x
    val op id_def =
    DT(((("missing_pervasives",1),[]),[]),
       [read"%163%146%236%405$0@@$0@|@"])
  fun op compare_byte_def x = x
    val op compare_byte_def =
    DT(((("missing_pervasives",2),[]),[]),
       [read"%168%38%169%39%255%393$1@$0@@%401%234@%251@%479$1@@%480$0@@@|@|@"])
  fun op instance_Basic_classes_Ord_Missing_pervasives_byte_dict_def x = x
    val op instance_Basic_classes_Ord_Missing_pervasives_byte_dict_def =
    DT(((("missing_pervasives",3),[]),[]),
       [read"%237%407@%344%304%392@@%348%303%53%54%255%392$1@$0@@%330@||@@%347%303%53%54%322%96%390%255$0@%330@@%255$0@%292@@|@%392$1@$0@@||@@%346%303%53%54%255%392$1@$0@@%299@||@@%345%303%53%54%322%96%390%255$0@%299@@%255$0@%292@@|@%392$1@$0@@||@@%268@@@@@@"])
  fun op hex_char_of_nibble_def x = x
    val op hex_char_of_nibble_def =
    DT(((("missing_pervasives",4),[]),[]),
       [read"%200%91%240%402$0@@%275%251$0@%233@@%274%343%273%272%272%272%273%389@@@@@@@@%275%251$0@%343%272%389@@@@%274%343%272%273%272%272%273%389@@@@@@@@%275%251$0@%343%273%389@@@@%274%343%273%273%272%272%273%389@@@@@@@@%275%251$0@%343%272%272%389@@@@@%274%343%272%272%273%272%273%389@@@@@@@@%275%251$0@%343%273%272%389@@@@@%274%343%273%272%273%272%273%389@@@@@@@@%275%251$0@%343%272%273%389@@@@@%274%343%272%273%273%272%273%389@@@@@@@@%275%251$0@%343%273%273%389@@@@@%274%343%273%273%273%272%273%389@@@@@@@@%275%251$0@%343%272%272%272%389@@@@@@%274%343%272%272%272%273%273%389@@@@@@@@%275%251$0@%343%273%272%272%389@@@@@@%274%343%273%272%272%273%273%389@@@@@@@@%275%251$0@%343%272%273%272%389@@@@@@%274%343%272%273%272%273%273%389@@@@@@@@%275%251$0@%343%273%273%272%389@@@@@@%274%343%272%273%272%272%272%273%389@@@@@@@@@%275%251$0@%343%272%272%273%389@@@@@@%274%343%273%273%272%272%272%273%389@@@@@@@@@%275%251$0@%343%273%272%273%389@@@@@@%274%343%272%272%273%272%272%273%389@@@@@@@@@%275%251$0@%343%272%273%273%389@@@@@@%274%343%273%272%273%272%272%273%389@@@@@@@@@%275%251$0@%343%273%273%273%389@@@@@@%274%343%272%273%273%272%272%273%389@@@@@@@@@%275%251$0@%343%272%272%272%272%389@@@@@@@%274%343%273%273%273%272%272%273%389@@@@@@@@@%395@@@@@@@@@@@@@@@@@|@"])
  fun op hex_string_of_byte_def x = x
    val op hex_string_of_byte_def =
    DT(((("missing_pervasives",5),[]),[]),
       [read"%168%37%247%403$0@@%302%286%402%290%479$0@@%343%273%272%272%272%389@@@@@@@@%286%402%333%479$0@@%343%273%272%272%272%389@@@@@@@@%337@@@@|@"])
  fun op instance_Show_Show_Missing_pervasives_byte_dict_def x = x
    val op instance_Show_Show_Missing_pervasives_byte_dict_def =
    DT(((("missing_pervasives",6),[]),[]),
       [read"%238%408@%359%305%403@@%269@@"])
  fun op natural_of_decimal_digit_def x = x
    val op natural_of_decimal_digit_def =
    DT(((("missing_pervasives",7),[]),[]),
       [read"%170%41%254%441$0@@%281%240$0@%274%343%273%272%272%272%273%389@@@@@@@@@%356%233@@%281%240$0@%274%343%272%273%272%272%273%389@@@@@@@@@%356%343%272%389@@@@%281%240$0@%274%343%273%273%272%272%273%389@@@@@@@@@%356%343%273%389@@@@%281%240$0@%274%343%272%272%273%272%273%389@@@@@@@@@%356%343%272%272%389@@@@@%281%240$0@%274%343%273%272%273%272%273%389@@@@@@@@@%356%343%273%272%389@@@@@%281%240$0@%274%343%272%273%273%272%273%389@@@@@@@@@%356%343%272%273%389@@@@@%281%240$0@%274%343%273%273%273%272%273%389@@@@@@@@@%356%343%273%273%389@@@@@%281%240$0@%274%343%272%272%272%273%273%389@@@@@@@@@%356%343%272%272%272%389@@@@@@%281%240$0@%274%343%273%272%272%273%273%389@@@@@@@@@%356%343%273%272%272%389@@@@@@%281%240$0@%274%343%272%273%272%273%273%389@@@@@@@@@%356%343%272%273%272%389@@@@@@%342@@@@@@@@@@@|@"])
  fun op natural_of_decimal_string_def x = x
    val op natural_of_decimal_string_def =
    DT(((("missing_pervasives",12),[]),[]),
       [read"%194%106%251%442$0@@%443%233@%293$0@@@|@"])
  fun op hex_string_of_natural_primitive_def x = x
    val op hex_string_of_natural_primitive_def =
    DT(((("missing_pervasives",13),[]),[]),
       [read"%243%404@%388%265%16%232%373$0@@%200%91%262%482%234$0@%343%273%272%272%272%389@@@@@@@@$1%290$0@%343%273%272%272%272%389@@@@@@@$0@@|@@|@@%56%91%300%277%234$0@%343%273%272%272%272%389@@@@@@@%302%286%402$0@@%337@@@%267$1%290$0@%343%273%272%272%272%389@@@@@@@@%302%286%402%333$0@%343%273%272%272%272%389@@@@@@@@%337@@@@@||@@"])
  fun op natural_of_bool_def x = x
    val op natural_of_bool_def =
    DT(((("missing_pervasives",16),[]),[]),
       [read"%167%36%251%440$0@@%278$0@%343%272%389@@@%233@@|@"])
  fun op natural_ordering_def x = x
    val op natural_ordering_def =
    DT(((("missing_pervasives",17),[]),[]),
       [read"%200%75%200%103%255%444$1@$0@@%282%251$1@$0@@%292@%282%234$1@$0@@%330@%299@@@|@|@"])
  fun op mapMaybei_def x = x
    val op mapMaybei_def =
    DT(((("missing_pervasives",30),[]),[]),
       [read"%185%52%192%149%244%436$1@$0@@%437$1@%233@$0@@|@|@"])
  fun op filteri_def x = x
    val op filteri_def =
    DT(((("missing_pervasives",35),[]),[]),
       [read"%197%60%191%148%244%397$1@$0@@%314%108%327%368%33%34%325%366%64%66$0||@@%371$1@@||@@%459%233@$0@$1@%339@%339@@|@%349%235@$1@@@|@|@"])
  fun op filterii_def x = x
    val op filterii_def =
    DT(((("missing_pervasives",36),[]),[]),
       [read"%197%60%191%148%250%398$1@$0@@%315%108%328%369%33%34$1||@@%459%233@$0@$1@%339@%339@@|@%349%235@$1@@@|@|@"])
  fun op partitioni_def x = x
    val op partitioni_def =
    DT(((("missing_pervasives",37),[]),[]),
       [read"%197%60%191%148%258%457$1@$0@@%316%108%329%370%33%34%326%367%64%66%326%367%65%67%215$2@$0@||@@%371$2@@||@@%371$1@@||@@%459%233@$0@$1@%339@%339@@|@%349%235@$1@@@|@|@"])
  fun op partitionii_def x = x
    val op partitionii_def =
    DT(((("missing_pervasives",38),[]),[]),
       [read"%197%60%191%148%261%458$1@$0@@%317%108%459%233@$0@$1@%339@%339@|@%349%235@$1@@@|@|@"])
  fun op unzip3_primitive_def x = x
    val op unzip3_primitive_def =
    DT(((("missing_pervasives",39),[]),[]),
       [read"%242%478@%387%264%15%232%372$0@@%198%70%201%120%198%153%163%146%202%139%164%155%165%161%262%232%249$6@%288$5@$4@@@%232%256$5@%206$3@$2@@@%257$2@%209$1@$0@@@@@$7$4@$6@@|@|@|@|@|@|@|@@|@@%112%70%301%428$0@%218%334@%221%335@%336@@@%120%153%451$1@%146%139%452$0@%155%161%324%364%148%365%158%162%218%283$6@$2@@%221%284$4@$1@@%285$3@$0@@@||@|@@$7$4@@||@||@||@@||@@"])
  fun op intercalate_def x = x
    val op intercalate_def =
    DT(((("missing_pervasives",50),[]),[]),
       [read"%163%107%191%148%244%410$1@$0@@%412$1@$0@%334@@|@|@"])
  fun op unlines_def x = x
    val op unlines_def =
    DT(((("missing_pervasives",51),[]),[]),
       [read"%196%150%247%476$0@@%296%267@%337@%411%286%274%343%273%273%272%389@@@@@@%337@@$0@@@|@"])
  fun op bracket_def x = x
    val op bracket_def =
    DT(((("missing_pervasives",52),[]),[]),
       [read"%196%150%247%391$0@@%267%286%274%343%273%272%272%273%272%389@@@@@@@@%337@@%267%296%267@%337@%411%286%274%343%273%272%272%272%272%389@@@@@@@@%337@@$0@@@%286%274%343%272%273%272%273%272%389@@@@@@@@%337@@@@|@"])
  fun op string_of_list_def x = x
    val op string_of_list_def =
    DT(((("missing_pervasives",53),[]),[]),
       [read"%166%47%191%68%247%471$1@$0@@%313%95%311%55%267%286%274%343%272%272%273%273%273%272%389@@@@@@@@@%337@@%267$0@%286%274%343%272%273%273%273%273%272%389@@@@@@@@@%337@@@|@%296%267@%337@$0@@|@%411%286%274%343%273%272%273%273%272%389@@@@@@@@%337@@%331%358$1@@$0@@@@|@|@"])
  fun op instance_Show_Show_list_dict_def x = x
    val op instance_Show_Show_list_dict_def =
    DT(((("missing_pervasives",54),[]),[]),
       [read"%166%47%239%409$0@@%360%306%471$0@@@%270@@|@"])
  fun op length_def x = x
    val op length_def =
    DT(((("missing_pervasives",55),[]),[]),
       [read"%191%148%251%416$0@@%297%156%146%456%224$1@$0@@%156%121%205%343%272%389@@@$1@||@||@%233@$0@@|@"])
  fun op take_def x = x
    val op take_def =
    DT(((("missing_pervasives",60),[]),[]),
       [read"%200%83%191%148%244%473$1@$0@@%475$1@$0@%334@@|@|@"])
  fun op string_prefix_def x = x
    val op string_prefix_def =
    DT(((("missing_pervasives",65),[]),[]),
       [read"%200%83%194%106%253%472$1@$0@@%312%46%280%263$2@%417$0@@@%341@%355%302%474$2@$0@@@@|@%293$0@@@|@|@"])
  fun op string_index_of_def x = x
    val op string_index_of_def =
    DT(((("missing_pervasives",70),[]),[]),
       [read"%170%50%194%106%254%468$1@$0@@%470$1@%293$0@@%233@@|@|@"])
  fun op find_index0_def x = x
    val op find_index0_def =
    DT(((("missing_pervasives",79),[]),[]),
       [read"%171%93%191%148%254%399$1@$0@@%400%233@$1@$0@@|@|@"])
  fun op replicate_def x = x
    val op replicate_def =
    DT(((("missing_pervasives",84),[]),[]),
       [read"%200%78%163%49%244%460$1@$0@@%462%334@$1@$0@@|@|@"])
  fun op list_append_def x = x
    val op list_append_def =
    DT(((("missing_pervasives",85),[]),[]),
       [read"%191%71%191%72%244%429$1@$0@@%350%352$1@@$0@@|@|@"])
  fun op list_concat_def x = x
    val op list_concat_def =
    DT(((("missing_pervasives",86),[]),[]),
       [read"%195%81%244%431$0@@%295%429@%334@$0@@|@"])
  fun op list_concat_map_def x = x
    val op list_concat_map_def =
    DT(((("missing_pervasives",87),[]),[]),
       [read"%175%51%192%69%244%432$1@$0@@%431%332$1@$0@@@|@|@"])
  fun op list_reverse_concat_map_def x = x
    val op list_reverse_concat_map_def =
    DT(((("missing_pervasives",92),[]),[]),
       [read"%175%51%192%80%244%433$1@$0@@%434$1@%334@$0@@|@|@"])
  fun op unsafe_string_take_def x = x
    val op unsafe_string_take_def =
    DT(((("missing_pervasives",97),[]),[]),
       [read"%200%83%194%111%247%477$1@$0@@%320%83%302%362$0@%293$1@@@|@$1@@|@|@"])
  fun op padding_and_maybe_newline_def x = x
    val op padding_and_maybe_newline_def =
    DT(((("missing_pervasives",98),[]),[]),
       [read"%170%41%200%145%194%111%247%449$2@$1@$0@@%320%94%267%277%235$0@%343%272%389@@@@%286%274%343%273%273%272%389@@@@@@%337@@%337@@%302%461%278%235$0@%343%272%389@@@@$2@$0@@$3@@@|@%231$1@%308$0@@@@|@|@|@"])
  fun op space_padding_and_maybe_newline_def x = x
    val op space_padding_and_maybe_newline_def =
    DT(((("missing_pervasives",99),[]),[]),
       [read"%200%145%194%111%247%467$1@$0@@%449%274%343%273%272%272%272%272%389@@@@@@@@$1@$0@@|@|@"])
  fun op padded_and_maybe_newline_def x = x
    val op padded_and_maybe_newline_def =
    DT(((("missing_pervasives",100),[]),[]),
       [read"%170%41%200%145%194%111%247%448$2@$1@$0@@%267$0@%449$2@$1@$0@@@|@|@|@"])
  fun op padding_to_def x = x
    val op padding_to_def =
    DT(((("missing_pervasives",101),[]),[]),
       [read"%170%41%200%145%194%111%247%450$2@$1@$0@@%320%94%277%235$0@%233@@%337@%302%461$0@$3@@@|@%231$1@%308$0@@@@|@|@|@"])
  fun op left_padded_to_def x = x
    val op left_padded_to_def =
    DT(((("missing_pervasives",102),[]),[]),
       [read"%170%41%200%145%194%111%247%413$2@$1@$0@@%267%450$2@$1@$0@@$0@@|@|@|@"])
  fun op right_padded_to_def x = x
    val op right_padded_to_def =
    DT(((("missing_pervasives",103),[]),[]),
       [read"%170%41%200%145%194%111%247%463$2@$1@$0@@%267$0@%450$2@$1@$0@@@|@|@|@"])
  fun op space_padded_and_maybe_newline_def x = x
    val op space_padded_and_maybe_newline_def =
    DT(((("missing_pervasives",104),[]),[]),
       [read"%200%145%194%111%247%466$1@$0@@%267$0@%449%274%343%273%272%272%272%272%389@@@@@@@@$1@$0@@@|@|@"])
  fun op left_space_padded_to_def x = x
    val op left_space_padded_to_def =
    DT(((("missing_pervasives",105),[]),[]),
       [read"%200%145%194%111%247%414$1@$0@@%267%450%274%343%273%272%272%272%272%389@@@@@@@@$1@$0@@$0@@|@|@"])
  fun op right_space_padded_to_def x = x
    val op right_space_padded_to_def =
    DT(((("missing_pervasives",106),[]),[]),
       [read"%200%145%194%111%247%464$1@$0@@%267$0@%450%274%343%273%272%272%272%272%389@@@@@@@@$1@$0@@@|@|@"])
  fun op left_zero_padded_to_def x = x
    val op left_zero_padded_to_def =
    DT(((("missing_pervasives",107),[]),[]),
       [read"%200%145%194%111%247%415$1@$0@@%267%450%274%343%273%272%272%272%273%389@@@@@@@@$1@$0@@$0@@|@|@"])
  fun op natural_of_decimal_string_helper_ind x = x
    val op natural_of_decimal_string_helper_ind =
    DT(((("missing_pervasives",10),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%189%13%262%200%31%194%42%262%170%41%194%46%200%48%262%232%247$3@%286$2@$1@@@%254%441$2@@%356$0@@@@$5%205%204%343%273%273%272%389@@@@@$4@@$0@@$1@@|@|@|@@$2$1@$0@@|@|@@%200%119%194%125$2$1@$0@|@|@@|@",
        read"%200%31%194%42%170%41%194%46%200%48%262%232%247$3@%286$2@$1@@@%254%441$2@@%356$0@@@@%26%227%205%204%343%273%273%272%389@@@@@$4@@$0@@$1@@%227$4@$3@@@|@|@|@|@|@",
        read"%383%26@"])
  fun op natural_of_decimal_string_helper_def x = x
    val op natural_of_decimal_string_helper_def =
    DT(((("missing_pervasives",11),
        [("bool",[15,57]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[8,9]),("option",[69]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%194%42%200%31%251%443$0@$1@@%426$1@$0@%41%46%447%441$1@@$2@%48%443%205%204%343%273%273%272%389@@@@@$3@@$0@@$1@|@||@@|@|@",
        read"%200%31%194%42%170%41%194%46%200%48%262%232%247$3@%286$2@$1@@@%254%441$2@@%356$0@@@@%26%227%205%204%343%273%273%272%389@@@@@$4@@$0@@$1@@%227$4@$3@@@|@|@|@|@|@",
        read"%383%26@"])
  fun op hex_string_of_natural_ind x = x
    val op hex_string_of_natural_ind =
    DT(((("missing_pervasives",14),
        [("bool",[25,27,52,53,62]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%184%9%262%200%91%262%262%482%234$0@%343%273%272%272%272%389@@@@@@@@$1%290$0@%343%273%272%272%272%389@@@@@@@@@$1$0@@|@@%200%119$1$0@|@@|@",
        read"%200%91%262%482%234$0@%343%273%272%272%272%389@@@@@@@@%16%290$0@%343%273%272%272%272%389@@@@@@@$0@@|@",
        read"%373%16@"])
  fun op hex_string_of_natural_def x = x
    val op hex_string_of_natural_def =
    DT(((("missing_pervasives",15),
        [("bool",[15,128]),("combin",[19]),("missing_pervasives",[13]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%200%91%247%404$0@@%277%234$0@%343%273%272%272%272%389@@@@@@@%302%286%402$0@@%337@@@%267%404%290$0@%343%273%272%272%272%389@@@@@@@@%302%286%402%333$0@%343%273%272%272%272%389@@@@@@@@%337@@@@@|@",
        read"%200%91%262%482%234$0@%343%273%272%272%272%389@@@@@@@@%16%290$0@%343%273%272%272%272%389@@@@@@@$0@@|@",
        read"%373%16@"])
  fun op merge_by_ind x = x
    val op merge_by_ind =
    DT(((("missing_pervasives",20),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%177%3%262%172%44%191%148%191%157%262%232%191%117%191%159%163%146%191%151%163%154%191%160%262%232%258%215$7@$6@@%215$5@$4@@@%232%244$5@%283$3@$2@@@%232%244$4@%283$1@$0@@@%482%255$8$3@$1@@%330@@@@@@$9$8@%283$3@$2@@$0@@|@|@|@|@|@|@@%191%117%191%159%163%146%191%151%163%154%191%160%262%232%258%215$7@$6@@%215$5@$4@@@%232%244$5@%283$3@$2@@@%232%244$4@%283$1@$0@@@%255$8$3@$1@@%330@@@@@$9$8@$2@%283$1@$0@@@|@|@|@|@|@|@@@$3$2@$1@$0@@|@|@|@@%172%114%191%123%191%132$3$2@$1@$0@|@|@|@@|@",
        read"%172%44%191%157%191%148%191%117%191%159%163%146%191%151%163%154%191%160%262%232%258%215$6@$7@@%215$5@$4@@@%232%244$5@%283$3@$2@@@%232%244$4@%283$1@$0@@@%482%255$8$3@$1@@%330@@@@@@%20%212$8@%215%283$3@$2@@$0@@@%212$8@%215$6@$7@@@@|@|@|@|@|@|@|@|@|@",
        read"%172%44%191%157%191%148%191%117%191%159%163%146%191%151%163%154%191%160%262%232%258%215$6@$7@@%215$5@$4@@@%232%244$5@%283$3@$2@@@%232%244$4@%283$1@$0@@@%255$8$3@$1@@%330@@@@@%20%212$8@%215$2@%283$1@$0@@@@%212$8@%215$6@$7@@@@|@|@|@|@|@|@|@|@|@",
        read"%377%20@"])
  fun op merge_by_def x = x
    val op merge_by_def =
    DT(((("missing_pervasives",21),
        [("bool",[15,57,128]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[18,19]),("pair",[49,51]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%191%157%191%148%172%44%244%438$0@$1@$2@@%453%215$1@$2@@%117%159%418$1@$0@%146%151%418$2@%283$1@$0@@%154%160%276%255$6$3@$1@@%330@@%283$3@%438$6@$2@%283$1@$0@@@@%283$1@%438$6@%283$3@$2@@$0@@@||@||@||@@|@|@|@",
        read"%172%44%191%157%191%148%191%117%191%159%163%146%191%151%163%154%191%160%262%232%258%215$6@$7@@%215$5@$4@@@%232%244$5@%283$3@$2@@@%232%244$4@%283$1@$0@@@%482%255$8$3@$1@@%330@@@@@@%20%212$8@%215%283$3@$2@@$0@@@%212$8@%215$6@$7@@@@|@|@|@|@|@|@|@|@|@",
        read"%172%44%191%157%191%148%191%117%191%159%163%146%191%151%163%154%191%160%262%232%258%215$6@$7@@%215$5@$4@@@%232%244$5@%283$3@$2@@@%232%244$4@%283$1@$0@@@%255$8$3@$1@@%330@@@@@%20%212$8@%215$2@%283$1@$0@@@@%212$8@%215$6@$7@@@@|@|@|@|@|@|@|@|@|@",
        read"%377%20@"])
  fun op sort_by_ind x = x
    val op sort_by_ind =
    DT(((("missing_pervasives",24),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%176%2%262%172%44%191%148%262%232%163%146%191%136%163%141%191%143%191%82%191%104%262%232%244$6@%283$5@$4@@@%232%244$4@%283$3@$2@@@%232%244$1@%361%290%307%283$5@%283$3@$2@@@@%343%273%389@@@@%283$5@%283$3@$2@@@@@%244$0@%291%290%307%283$5@%283$3@$2@@@@%343%273%389@@@@%283$5@%283$3@$2@@@@@@@@$8$7@$0@@|@|@|@|@|@|@@%163%146%191%136%163%141%191%143%191%82%191%104%262%232%244$6@%283$5@$4@@@%232%244$4@%283$3@$2@@@%232%244$1@%361%290%307%283$5@%283$3@$2@@@@%343%273%389@@@@%283$5@%283$3@$2@@@@@%244$0@%291%290%307%283$5@%283$3@$2@@@@%343%273%389@@@@%283$5@%283$3@$2@@@@@@@@$8$7@$1@@|@|@|@|@|@|@@@$2$1@$0@@|@|@@%172%114%191%123$2$1@$0@|@|@@|@",
        read"%172%44%191%148%163%146%191%136%163%141%191%143%191%82%191%104%262%232%244$6@%283$5@$4@@@%232%244$4@%283$3@$2@@@%232%244$1@%361%290%307%283$5@%283$3@$2@@@@%343%273%389@@@@%283$5@%283$3@$2@@@@@%244$0@%291%290%307%283$5@%283$3@$2@@@@%343%273%389@@@@%283$5@%283$3@$2@@@@@@@@%19%211$7@$0@@%211$7@$6@@@|@|@|@|@|@|@|@|@",
        read"%172%44%191%148%163%146%191%136%163%141%191%143%191%82%191%104%262%232%244$6@%283$5@$4@@@%232%244$4@%283$3@$2@@@%232%244$1@%361%290%307%283$5@%283$3@$2@@@@%343%273%389@@@@%283$5@%283$3@$2@@@@@%244$0@%291%290%307%283$5@%283$3@$2@@@@%343%273%389@@@@%283$5@%283$3@$2@@@@@@@@%19%211$7@$1@@%211$7@$6@@@|@|@|@|@|@|@|@|@",
        read"%376%19@"])
  fun op sort_by_def x = x
    val op sort_by_def =
    DT(((("missing_pervasives",25),
        [("bool",[15,57,122]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[22,23]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%191%148%172%44%244%465$0@$1@@%418$1@%334@%146%136%418$0@%283$1@%334@@%141%143%310%82%310%104%438$6@%465$6@$1@@%465$6@$0@@|@%291%290%307%283$4@%283$2@$1@@@@%343%273%389@@@@%283$4@%283$2@$1@@@@|@%361%290%307%283$3@%283$1@$0@@@@%343%273%389@@@@%283$3@%283$1@$0@@@@||@||@@|@|@",
        read"%172%44%191%148%163%146%191%136%163%141%191%143%191%82%191%104%262%232%244$6@%283$5@$4@@@%232%244$4@%283$3@$2@@@%232%244$1@%361%290%307%283$5@%283$3@$2@@@@%343%273%389@@@@%283$5@%283$3@$2@@@@@%244$0@%291%290%307%283$5@%283$3@$2@@@@%343%273%389@@@@%283$5@%283$3@$2@@@@@@@@%19%211$7@$0@@%211$7@$6@@@|@|@|@|@|@|@|@|@",
        read"%172%44%191%148%163%146%191%136%163%141%191%143%191%82%191%104%262%232%244$6@%283$5@$4@@@%232%244$4@%283$3@$2@@@%232%244$1@%361%290%307%283$5@%283$3@$2@@@@%343%273%389@@@@%283$5@%283$3@$2@@@@@%244$0@%291%290%307%283$5@%283$3@$2@@@@%343%273%389@@@@%283$5@%283$3@$2@@@@@@@@%19%211$7@$1@@%211$7@$6@@@|@|@|@|@|@|@|@|@",
        read"%376%19@"])
  fun op mapMaybei'_ind x = x
    val op mapMaybei'_ind =
    DT(((("missing_pervasives",28),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%179%5%262%185%52%200%59%192%149%262%232%164%147%192%152%163%49%262%232%245$3@%284$2@$1@@@%252$5$4@$2@@%354$0@@@@$6$5@%205%343%272%389@@@$4@@$1@@|@|@|@@%164%147%192%152%262%232%245$2@%284$1@$0@@@%252$4$3@$1@@%340@@@$5$4@%205%343%272%389@@@$3@@$0@@|@|@@@$3$2@$1@$0@@|@|@|@@%185%116%200%127%192%133$3$2@$1@$0@|@|@|@@|@",
        read"%200%59%185%52%192%149%164%147%192%152%163%49%262%232%245$3@%284$2@$1@@@%252$4$5@$2@@%354$0@@@@%22%214$4@%226%205%343%272%389@@@$5@@$1@@@%214$4@%226$5@$3@@@@|@|@|@|@|@|@",
        read"%200%59%185%52%192%149%164%147%192%152%262%232%245$2@%284$1@$0@@@%252$3$4@$1@@%340@@@%22%214$3@%226%205%343%272%389@@@$4@@$0@@@%214$3@%226$4@$2@@@@|@|@|@|@|@",
        read"%379%22@"])
  fun op mapMaybei'_def x = x
    val op mapMaybei'_def =
    DT(((("missing_pervasives",29),
        [("bool",[15,57]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[26,27]),("option",[69]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%192%149%200%59%185%52%244%437$0@$1@$2@@%423$2@%334@%147%152%446$2$3@$1@@%437$2@%205%343%272%389@@@$3@@$0@@%49%283$0@%437$3@%205%343%272%389@@@$4@@$1@@|@||@@|@|@|@",
        read"%200%59%185%52%192%149%164%147%192%152%163%49%262%232%245$3@%284$2@$1@@@%252$4$5@$2@@%354$0@@@@%22%214$4@%226%205%343%272%389@@@$5@@$1@@@%214$4@%226$5@$3@@@@|@|@|@|@|@|@",
        read"%200%59%185%52%192%149%164%147%192%152%262%232%245$2@%284$1@$0@@@%252$3$4@$1@@%340@@@%22%214$3@%226%205%343%272%389@@@$4@@$0@@@%214$3@%226$4@$2@@@@|@|@|@|@|@",
        read"%379%22@"])
  fun op partitionii'_ind x = x
    val op partitionii'_ind =
    DT(((("missing_pervasives",33),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%190%14%262%200%92%197%108%191%148%199%100%199%101%262%200%58%197%85%200%79%191%74%191%102%197%76%199%77%163%146%191%86%262%232%248$12@%287$8@$7@@@%232%251$6@%231$8@$13@@@%232%258%215$5@$4@@%215%361$6@$11@@%291$6@$11@@@@%232%248$3@%298%63%205$0@$14@|@%307$5@@@@%232%250$2@%430$3@$5@@@%244$4@%283$1@$0@@@@@@@@$14%205$8@%343%272%389@@@@$7@$0@%289%224$8@$1@@$10@@%351$2@$9@@@|@|@|@|@|@|@|@|@|@@$5$4@$3@$2@$1@$0@@|@|@|@|@|@@%200%119%197%126%191%132%199%138%199%140$5$4@$3@$2@$1@$0@|@|@|@|@|@@|@",
        read"%199%101%199%100%191%148%200%92%197%108%200%58%197%85%200%79%191%74%191%102%197%76%199%77%163%146%191%86%262%232%248$9@%287$8@$7@@@%232%251$6@%231$8@$10@@@%232%258%215$5@$4@@%215%361$6@$11@@%291$6@$11@@@@%232%248$3@%298%63%205$0@$11@|@%307$5@@@@%232%250$2@%430$3@$5@@@%244$4@%283$1@$0@@@@@@@@%29%230%205$8@%343%272%389@@@@%222$7@%219$0@%223%289%224$8@$1@@$12@@%351$2@$13@@@@@@%230$10@%222$9@%219$11@%223$12@$13@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%386%29@"])
  fun op partitionii'_def x = x
    val op partitionii'_def =
    DT(((("missing_pervasives",34),
        [("bool",[15,57,122]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[31,32]),("pair",[7,16,49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%191%148%197%108%199%101%199%100%200%92%261%459$0@$3@$4@$1@$2@@%427$3@%223%353$1@@%353$2@@@%58%85%321%79%323%363%74%102%317%76%319%77%422$2@%223%353$8@@%351$9@$0@@@%146%86%459%205$8@%343%272%389@@@@$7@$0@%289%224$8@$1@@$10@@%351$2@$11@@||@|@%430$0@$2@@|@%298%63%205$0@$6@|@%307$1@@@||@@%215%361$0@$7@@%291$0@$7@@@|@%231$1@$2@@||@@|@|@|@|@|@",
        read"%199%101%199%100%191%148%200%92%197%108%200%58%197%85%200%79%191%74%191%102%197%76%199%77%163%146%191%86%262%232%248$9@%287$8@$7@@@%232%251$6@%231$8@$10@@@%232%258%215$5@$4@@%215%361$6@$11@@%291$6@$11@@@@%232%248$3@%298%63%205$0@$11@|@%307$5@@@@%232%250$2@%430$3@$5@@@%244$4@%283$1@$0@@@@@@@@%29%230%205$8@%343%272%389@@@@%222$7@%219$0@%223%289%224$8@$1@@$12@@%351$2@$13@@@@@@%230$10@%222$9@%219$11@%223$12@$13@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%386%29@"])
  fun op unzip3_ind x = x
    val op unzip3_ind =
    DT(((("missing_pervasives",40),
        [("arithmetic",[22,24,25,41,46,59,73,95,178,185]),
         ("bool",
         [25,26,27,35,51,52,53,57,62,92,95,100,103,104,106,123,144]),
         ("list",[7]),("numeral",[3,7,8]),("pair",[4,16,25]),
         ("prim_rec",[42]),("relation",[101,113,115]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%183%8%262%198%70%262%201%120%198%153%163%146%202%139%164%155%165%161%262%232%249$6@%288$5@$4@@@%232%256$5@%206$3@$2@@@%257$2@%209$1@$0@@@@@$7$4@@|@|@|@|@|@|@@$1$0@@|@@%198%118$1$0@|@@|@"])
  fun op unzip3_def x = x
    val op unzip3_def =
    DT(((("missing_pervasives",41),
        [("arithmetic",[22,24,25,41,46,59,73,95,178,185]),
         ("bool",
         [15,25,26,35,51,52,53,57,62,92,95,100,103,104,106,122,123,144]),
         ("combin",[19]),("list",[7,11]),("missing_pervasives",[39]),
         ("numeral",[3,7,8]),("pair",[4,7,16,25,51]),("prim_rec",[42]),
         ("relation",[113,115,121,126]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%198%70%259%478$0@@%428$0@%218%334@%221%335@%336@@@%120%153%451$1@%146%139%452$0@%155%161%324%364%148%365%158%162%218%283$6@$2@@%221%284$4@$1@@%285$3@$0@@@||@|@@%478$4@@||@||@||@@|@"])
  fun op zip3_ind x = x
    val op zip3_ind =
    DT(((("missing_pervasives",44),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%181%6%262%191%35%192%40%193%43%262%191%117%203%128%192%133%193%137%164%155%192%89%165%161%193%90%163%146%191%88%262%232%259%218$12@%221$11@$10@@@%218$9@$8@@@%232%260$8@%221$7@$6@@@%232%245$7@%284$5@$4@@@%232%246$6@%285$3@$2@@@%244$9@%283$1@$0@@@@@@@$13$0@$4@$2@@|@|@|@|@|@|@|@|@|@|@@$3$2@$1@$0@@|@|@|@@%191%117%192%124%193%134$3$2@$1@$0@|@|@|@@|@",
        read"%193%43%192%40%191%35%191%117%203%128%192%133%193%137%164%155%192%89%165%161%193%90%163%146%191%88%262%232%259%218$10@%221$11@$12@@@%218$9@$8@@@%232%260$8@%221$7@$6@@@%232%245$7@%284$5@$4@@@%232%246$6@%285$3@$2@@@%244$9@%283$1@$0@@@@@@@%23%218$0@%221$4@$2@@@%218$10@%221$11@$12@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%380%23@"])
  fun op zip3_def x = x
    val op zip3_def =
    DT(((("missing_pervasives",45),
        [("bool",[15,57,122]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[42,43]),("pair",[49,51]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%193%43%192%40%191%35%249%481$0@$1@$2@@%454%218$0@%221$1@$2@@@%117%128%455$0@%133%137%424$1@%425$0@%419$3@%338@%129%130%271||@@%142%144%271||@@%155%89%425$2@%271@%161%90%419$7@%271@%146%88%318%87%288%206$2@%209$6@$4@@@$0@|@%481$0@$4@$2@@||@||@||@||@||@@|@|@|@",
        read"%193%43%192%40%191%35%191%117%203%128%192%133%193%137%164%155%192%89%165%161%193%90%163%146%191%88%262%232%259%218$10@%221$11@$12@@@%218$9@$8@@@%232%260$8@%221$7@$6@@@%232%245$7@%284$5@$4@@@%232%246$6@%285$3@$2@@@%244$9@%283$1@$0@@@@@@@%23%218$0@%221$4@$2@@@%218$10@%221$11@$12@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%380%23@"])
  fun op intercalate'_ind x = x
    val op intercalate'_ind =
    DT(((("missing_pervasives",48),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%173%0%262%163%107%191%148%191%32%262%163%146%191%123%163%154%191%136%163%141%191%143%262%232%244$7@%283$5@$4@@@%232%244$4@%283$3@$2@@@%244$2@%283$1@$0@@@@@$9$8@%283$1@$0@@%283$8@%283$3@%283$8@%283$5@$6@@@@@@|@|@|@|@|@|@@$3$2@$1@$0@@|@|@|@@%163%113%191%123%191%132$3$2@$1@$0@|@|@|@@|@",
        read"%191%32%163%107%191%148%163%146%191%123%163%154%191%136%163%141%191%143%262%232%244$6@%283$5@$4@@@%232%244$4@%283$3@$2@@@%244$2@%283$1@$0@@@@@%17%207$7@%215%283$1@$0@@%283$7@%283$3@%283$7@%283$5@$8@@@@@@@%207$7@%215$6@$8@@@@|@|@|@|@|@|@|@|@|@",
        read"%374%17@"])
  fun op intercalate'_def x = x
    val op intercalate'_def =
    DT(((("missing_pervasives",49),
        [("bool",[15,57]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[46,47]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%191%148%163%107%191%32%244%412$1@$2@$0@@%418$2@%352$0@@%146%123%418$0@%266%352$2@@%283$1@%334@@@%154%136%418$0@%266%352$4@@%283$3@%283$5@%283$1@%334@@@@@%141%143%412$7@%283$1@$0@@%283$7@%283$3@%283$7@%283$5@$6@@@@@||@||@||@@|@|@|@",
        read"%191%32%163%107%191%148%163%146%191%123%163%154%191%136%163%141%191%143%262%232%244$6@%283$5@$4@@@%232%244$4@%283$3@$2@@@%244$2@%283$1@$0@@@@@%17%207$7@%215%283$1@$0@@%283$7@%283$3@%283$7@%283$5@$8@@@@@@@%207$7@%215$6@$8@@@@|@|@|@|@|@|@|@|@|@",
        read"%374%17@"])
  fun op takeRevAcc_ind x = x
    val op takeRevAcc_ind =
    DT(((("missing_pervasives",58),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%188%12%262%200%83%191%148%191%97%262%163%146%191%151%262%232%244$3@%283$1@$0@@@%482%251$4@%233@@@@$5%231$4@%343%272%389@@@@$0@%283$1@$2@@@|@|@@$3$2@$1@$0@@|@|@|@@%200%119%191%123%191%132$3$2@$1@$0@|@|@|@@|@",
        read"%191%97%200%83%191%148%163%146%191%151%262%232%244$2@%283$1@$0@@@%482%251$3@%233@@@@%28%229%231$3@%343%272%389@@@@%215$0@%283$1@$4@@@@%229$3@%215$2@$4@@@@|@|@|@|@|@",
        read"%385%28@"])
  fun op takeRevAcc_def x = x
    val op takeRevAcc_def =
    DT(((("missing_pervasives",59),
        [("bool",[15,57,128]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[56,57]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%191%148%191%97%200%83%244%475$0@$2@$1@@%418$2@%352$1@@%146%151%276%251$2@%233@@%352$3@@%475%231$2@%343%272%389@@@@$0@%283$1@$3@@@||@@|@|@|@",
        read"%191%97%200%83%191%148%163%146%191%151%262%232%244$2@%283$1@$0@@@%482%251$3@%233@@@@%28%229%231$3@%343%272%389@@@@%215$0@%283$1@$4@@@@%229$3@%215$2@$4@@@@|@|@|@|@|@",
        read"%385%28@"])
  fun op drop_ind x = x
    val op drop_ind =
    DT(((("missing_pervasives",63),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%187%11%262%200%83%191%148%262%163%146%191%151%262%232%244$2@%283$1@$0@@@%482%251$3@%233@@@@$4%231$3@%343%272%389@@@@$0@@|@|@@$2$1@$0@@|@|@@%200%119%191%123$2$1@$0@|@|@@|@",
        read"%200%83%191%148%163%146%191%151%262%232%244$2@%283$1@$0@@@%482%251$3@%233@@@@%25%225%231$3@%343%272%389@@@@$0@@%225$3@$2@@@|@|@|@|@",
        read"%382%25@"])
  fun op drop_def x = x
    val op drop_def =
    DT(((("missing_pervasives",64),
        [("bool",[15,57,128]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[61,62]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%191%148%200%83%244%394$0@$1@@%418$1@%334@%146%151%276%251$2@%233@@%283$1@$0@@%394%231$2@%343%272%389@@@@$0@@||@@|@|@",
        read"%200%83%191%148%163%146%191%151%262%232%244$2@%283$1@$0@@@%482%251$3@%233@@@@%25%225%231$3@%343%272%389@@@@$0@@%225$3@$2@@@|@|@|@|@",
        read"%382%25@"])
  fun op string_index_of'_ind x = x
    val op string_index_of'_ind =
    DT(((("missing_pervasives",68),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%174%1%262%163%49%191%109%200%59%262%163%105%191%110%262%232%244$3@%283$1@$0@@@%482%236$1@$4@@@@$5$4@$0@%205%343%272%389@@@$2@@@|@|@@$3$2@$1@$0@@|@|@|@@%163%113%191%123%200%135$3$2@$1@$0@|@|@|@@|@",
        read"%200%59%163%49%191%109%163%105%191%110%262%232%244$2@%283$1@$0@@@%482%236$1@$3@@@@%18%208$3@%217$0@%205%343%272%389@@@$4@@@@%208$3@%217$2@$4@@@@|@|@|@|@|@",
        read"%375%18@"])
  fun op string_index_of'_def x = x
    val op string_index_of'_def =
    DT(((("missing_pervasives",69),
        [("bool",[15,57,128]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[66,67]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%191%109%200%59%163%49%254%469$0@$2@$1@@%421$2@%342@%105%110%281%236$1@$2@@%356$3@@%469$2@$0@%205%343%272%389@@@$3@@@||@@|@|@|@",
        read"%200%59%163%49%191%109%163%105%191%110%262%232%244$2@%283$1@$0@@@%482%236$1@$3@@@@%18%208$3@%217$0@%205%343%272%389@@@$4@@@@%208$3@%217$2@$4@@@@|@|@|@|@|@",
        read"%375%18@"])
  fun op index_ind x = x
    val op index_ind =
    DT(((("missing_pervasives",73),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%187%11%262%200%83%191%148%262%163%146%191%151%262%232%244$2@%283$1@$0@@@%482%251$3@%233@@@@$4%231$3@%343%272%389@@@@$0@@|@|@@$2$1@$0@@|@|@@%200%119%191%123$2$1@$0@|@|@@|@",
        read"%200%83%191%148%163%146%191%151%262%232%244$2@%283$1@$0@@@%482%251$3@%233@@@@%25%225%231$3@%343%272%389@@@@$0@@%225$3@$2@@@|@|@|@|@",
        read"%382%25@"])
  fun op index_def x = x
    val op index_def =
    DT(((("missing_pervasives",74),
        [("bool",[15,57,128]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[71,72]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%191%148%200%83%252%406$0@$1@@%420$1@%340@%146%151%279%251$2@%233@@%354$1@@%406%231$2@%343%272%389@@@@$0@@||@@|@|@",
        read"%200%83%191%148%163%146%191%151%262%232%244$2@%283$1@$0@@@%482%251$3@%233@@@@%25%225%231$3@%343%272%389@@@@$0@@%225$3@$2@@@|@|@|@|@",
        read"%382%25@"])
  fun op find_index_helper_ind x = x
    val op find_index_helper_ind =
    DT(((("missing_pervasives",77),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%186%10%262%200%45%171%93%191%148%262%163%154%191%157%262%232%244$2@%283$1@$0@@@%482$3$1@@@@$5%205$4@%343%272%389@@@@$3@$0@@|@|@@$3$2@$1@$0@@|@|@|@@%200%119%171%122%191%132$3$2@$1@$0@|@|@|@@|@",
        read"%200%45%171%93%191%148%163%154%191%157%262%232%244$2@%283$1@$0@@@%482$3$1@@@@%27%228%205$4@%343%272%389@@@@%210$3@$0@@@%228$4@%210$3@$2@@@@|@|@|@|@|@",
        read"%384%27@"])
  fun op find_index_helper_def x = x
    val op find_index_helper_def =
    DT(((("missing_pervasives",78),
        [("bool",[15,57,128]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[75,76]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%191%148%171%93%200%45%254%400$0@$1@$2@@%421$2@%342@%154%157%281$3$1@@%356$2@@%400%205$2@%343%272%389@@@@$3@$0@@||@@|@|@|@",
        read"%200%45%171%93%191%148%163%154%191%157%262%232%244$2@%283$1@$0@@@%482$3$1@@@@%27%228%205$4@%343%272%389@@@@%210$3@$0@@@%228$4@%210$3@$2@@@@|@|@|@|@|@",
        read"%384%27@"])
  fun op replicate_revacc_ind x = x
    val op replicate_revacc_ind =
    DT(((("missing_pervasives",82),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%182%7%262%191%98%200%78%163%49%262%200%127%262%251$2@%357$0@@@$4%283$1@$3@@%231%357$0@@%343%272%389@@@@$1@@|@@$3$2@$1@$0@@|@|@|@@%191%117%200%127%163%131$3$2@$1@$0@|@|@|@@|@",
        read"%191%98%163%49%200%78%200%127%262%251$1@%357$0@@@%24%220%283$2@$3@@%224%231%357$0@@%343%272%389@@@@$2@@@%220$3@%224$1@$2@@@@|@|@|@|@",
        read"%381%24@"])
  fun op replicate_revacc_def x = x
    val op replicate_revacc_def =
    DT(((("missing_pervasives",83),
        [("arithmetic",[271]),("bool",[15,57]),("combin",[19]),
         ("missing_pervasives",[80,81]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%191%98%200%78%163%49%244%462$2@$1@$0@@%445$1@%352$2@@%127%462%283$1@$3@@%231%357$0@@%343%272%389@@@@$1@|@@|@|@|@",
        read"%191%98%163%49%200%78%200%127%262%251$1@%357$0@@@%24%220%283$2@$3@@%224%231%357$0@@%343%272%389@@@@$2@@@%220$3@%224$1@$2@@@@|@|@|@|@",
        read"%381%24@"])
  fun op list_reverse_concat_map_helper_ind x = x
    val op list_reverse_concat_map_helper_ind =
    DT(((("missing_pervasives",90),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%178%4%262%175%51%191%30%192%80%262%180%73%164%61%192%62%191%84%262%232%241$3@%68%57%283$0@$1@||@@%232%245$4@%284$2@$1@@@%244$0@$6$2@@@@@$7$6@%294$3@$5@$6$2@@@$1@@|@|@|@|@@$3$2@$1@$0@@|@|@|@@%175%115%191%123%192%133$3$2@$1@$0@|@|@|@@|@",
        read"%191%30%175%51%192%80%180%73%164%61%192%62%191%84%262%232%241$3@%68%57%283$0@$1@||@@%232%245$4@%284$2@$1@@@%244$0@$5$2@@@@@%21%213$5@%216%294$3@$6@$5$2@@@$1@@@%213$5@%216$6@$4@@@@|@|@|@|@|@|@|@",
        read"%378%21@"])
  fun op list_reverse_concat_map_helper_def x = x
    val op list_reverse_concat_map_helper_def =
    DT(((("missing_pervasives",91),
        [("bool",[15,57,122]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[88,89]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%192%80%175%51%191%30%244%434$1@$0@$2@@%309%73%423$3@$1@%61%62%310%84%434$5@%294$3@$4@$5$2@@@$1@|@$4$1@@||@|@%68%57%283$0@$1@||@@|@|@|@",
        read"%191%30%175%51%192%80%180%73%164%61%192%62%191%84%262%232%241$3@%68%57%283$0@$1@||@@%232%245$4@%284$2@$1@@@%244$0@$5$2@@@@@%21%213$5@%216%294$3@$6@$5$2@@@$1@@@%213$5@%216$6@$4@@@@|@|@|@|@|@|@|@",
        read"%378%21@"])
  fun op list_take_with_accum_ind x = x
    val op list_take_with_accum_ind =
    DT(((("missing_pervasives",95),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%188%12%262%200%91%191%99%191%68%262%200%127%163%146%191%148%262%232%251$5@%357$2@@@%244$3@%283$1@$0@@@@$6%231$5@%343%272%389@@@@%283$1@$4@@$0@@|@|@|@@$3$2@$1@$0@@|@|@|@@%200%119%191%123%191%132$3$2@$1@$0@|@|@|@@|@",
        read"%191%99%191%68%200%91%200%127%163%146%191%148%262%232%251$3@%357$2@@@%244$4@%283$1@$0@@@@%28%229%231$3@%343%272%389@@@@%215%283$1@$5@@$0@@@%229$3@%215$5@$4@@@@|@|@|@|@|@|@",
        read"%385%28@"])
  fun op list_take_with_accum_def x = x
    val op list_take_with_accum_def =
    DT(((("missing_pervasives",96),
        [("arithmetic",[271]),("bool",[15,57]),("combin",[19]),
         ("list",[11]),("missing_pervasives",[93,94]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%191%99%200%91%191%68%244%435$1@$2@$0@@%445$1@%352$2@@%127%418$1@%396%286%274%343%273%272%273%273%272%273%389@@@@@@@@@%286%274%343%272%273%272%273%272%273%389@@@@@@@@@%286%274%343%272%272%273%272%273%273%389@@@@@@@@@%286%274%343%273%272%273%272%273%273%389@@@@@@@@@%286%274%343%272%272%272%272%272%273%389@@@@@@@@@%286%274%343%273%272%273%272%273%273%389@@@@@@@@@%286%274%343%272%273%272%272%272%273%389@@@@@@@@@%286%274%343%272%272%273%273%272%273%389@@@@@@@@@%286%274%343%272%273%273%272%272%273%389@@@@@@@@@%286%274%343%272%272%272%272%272%273%389@@@@@@@@@%286%274%343%272%272%272%273%273%273%389@@@@@@@@@%286%274%343%272%273%272%273%272%273%389@@@@@@@@@%286%274%343%273%272%273%272%273%273%389@@@@@@@@@%286%274%343%273%272%272%273%272%273%389@@@@@@@@@%286%274%343%272%272%272%272%272%273%389@@@@@@@@@%286%274%343%272%273%272%272%272%273%389@@@@@@@@@%286%274%343%272%272%273%272%272%273%389@@@@@@@@@%286%274%343%272%272%273%272%272%273%389@@@@@@@@@%286%274%343%272%273%273%272%273%273%389@@@@@@@@@%286%274%343%272%273%273%273%272%273%389@@@@@@@@@%286%274%343%273%273%272%273%273%389@@@@@@@@%286%274%343%273%272%272%272%272%389@@@@@@@@%286%274%343%273%273%273%273%272%273%389@@@@@@@@@%286%274%343%272%272%272%272%273%273%389@@@@@@@@@%286%274%343%273%272%273%272%273%273%389@@@@@@@@@%286%274%343%273%272%272%272%272%389@@@@@@@@%286%274%343%272%273%273%272%272%273%389@@@@@@@@@%286%274%343%273%273%273%273%272%273%389@@@@@@@@@%286%274%343%272%272%272%272%273%273%389@@@@@@@@@%286%274%343%272%273%273%272%273%273%389@@@@@@@@@%286%274%343%272%272%272%273%272%273%389@@@@@@@@@%286%274%343%273%272%272%273%272%273%389@@@@@@@@@%286%274%343%273%272%272%272%272%389@@@@@@@@%286%274%343%272%273%273%272%272%273%389@@@@@@@@@%286%274%343%273%272%273%273%272%273%389@@@@@@@@@%286%274%343%272%273%273%272%272%273%389@@@@@@@@@%286%274%343%272%273%273%273%272%273%389@@@@@@@@@%286%274%343%272%273%273%272%272%273%389@@@@@@@@@%286%274%343%273%273%273%273%272%273%389@@@@@@@@@%286%274%343%273%272%273%272%273%273%389@@@@@@@@@%286%274%343%272%272%273%272%273%273%389@@@@@@@@@%337@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%146%148%435%231$4@%343%272%389@@@@%283$1@$5@@$0@||@|@@|@|@|@",
        read"%191%99%191%68%200%91%200%127%163%146%191%148%262%232%251$3@%357$2@@@%244$4@%283$1@$0@@@@%28%229%231$3@%343%272%389@@@@%215%283$1@$5@@$0@@@%229$3@%215$5@$4@@@@|@|@|@|@|@|@",
        read"%385%28@"])
  end
  val _ = DB.bindl "missing_pervasives"
  [("naturalZero_def",naturalZero_def,DB.Def), ("id_def",id_def,DB.Def),
   ("compare_byte_def",compare_byte_def,DB.Def),
   ("instance_Basic_classes_Ord_Missing_pervasives_byte_dict_def",
    instance_Basic_classes_Ord_Missing_pervasives_byte_dict_def,
    DB.Def), ("hex_char_of_nibble_def",hex_char_of_nibble_def,DB.Def),
   ("hex_string_of_byte_def",hex_string_of_byte_def,DB.Def),
   ("instance_Show_Show_Missing_pervasives_byte_dict_def",
    instance_Show_Show_Missing_pervasives_byte_dict_def,
    DB.Def),
   ("natural_of_decimal_digit_def",natural_of_decimal_digit_def,DB.Def),
   ("natural_of_decimal_string_def",natural_of_decimal_string_def,DB.Def),
   ("hex_string_of_natural_primitive_def",
    hex_string_of_natural_primitive_def,
    DB.Def), ("natural_of_bool_def",natural_of_bool_def,DB.Def),
   ("natural_ordering_def",natural_ordering_def,DB.Def),
   ("mapMaybei_def",mapMaybei_def,DB.Def),
   ("filteri_def",filteri_def,DB.Def),
   ("filterii_def",filterii_def,DB.Def),
   ("partitioni_def",partitioni_def,DB.Def),
   ("partitionii_def",partitionii_def,DB.Def),
   ("unzip3_primitive_def",unzip3_primitive_def,DB.Def),
   ("intercalate_def",intercalate_def,DB.Def),
   ("unlines_def",unlines_def,DB.Def), ("bracket_def",bracket_def,DB.Def),
   ("string_of_list_def",string_of_list_def,DB.Def),
   ("instance_Show_Show_list_dict_def",
    instance_Show_Show_list_dict_def,
    DB.Def), ("length_def",length_def,DB.Def),
   ("take_def",take_def,DB.Def),
   ("string_prefix_def",string_prefix_def,DB.Def),
   ("string_index_of_def",string_index_of_def,DB.Def),
   ("find_index0_def",find_index0_def,DB.Def),
   ("replicate_def",replicate_def,DB.Def),
   ("list_append_def",list_append_def,DB.Def),
   ("list_concat_def",list_concat_def,DB.Def),
   ("list_concat_map_def",list_concat_map_def,DB.Def),
   ("list_reverse_concat_map_def",list_reverse_concat_map_def,DB.Def),
   ("unsafe_string_take_def",unsafe_string_take_def,DB.Def),
   ("padding_and_maybe_newline_def",padding_and_maybe_newline_def,DB.Def),
   ("space_padding_and_maybe_newline_def",
    space_padding_and_maybe_newline_def,
    DB.Def),
   ("padded_and_maybe_newline_def",padded_and_maybe_newline_def,DB.Def),
   ("padding_to_def",padding_to_def,DB.Def),
   ("left_padded_to_def",left_padded_to_def,DB.Def),
   ("right_padded_to_def",right_padded_to_def,DB.Def),
   ("space_padded_and_maybe_newline_def",
    space_padded_and_maybe_newline_def,
    DB.Def), ("left_space_padded_to_def",left_space_padded_to_def,DB.Def),
   ("right_space_padded_to_def",right_space_padded_to_def,DB.Def),
   ("left_zero_padded_to_def",left_zero_padded_to_def,DB.Def),
   ("natural_of_decimal_string_helper_ind",
    natural_of_decimal_string_helper_ind,
    DB.Thm),
   ("natural_of_decimal_string_helper_def",
    natural_of_decimal_string_helper_def,
    DB.Thm),
   ("hex_string_of_natural_ind",hex_string_of_natural_ind,DB.Thm),
   ("hex_string_of_natural_def",hex_string_of_natural_def,DB.Thm),
   ("merge_by_ind",merge_by_ind,DB.Thm),
   ("merge_by_def",merge_by_def,DB.Thm),
   ("sort_by_ind",sort_by_ind,DB.Thm), ("sort_by_def",sort_by_def,DB.Thm),
   ("mapMaybei'_ind",mapMaybei'_ind,DB.Thm),
   ("mapMaybei'_def",mapMaybei'_def,DB.Thm),
   ("partitionii'_ind",partitionii'_ind,DB.Thm),
   ("partitionii'_def",partitionii'_def,DB.Thm),
   ("unzip3_ind",unzip3_ind,DB.Thm), ("unzip3_def",unzip3_def,DB.Thm),
   ("zip3_ind",zip3_ind,DB.Thm), ("zip3_def",zip3_def,DB.Thm),
   ("intercalate'_ind",intercalate'_ind,DB.Thm),
   ("intercalate'_def",intercalate'_def,DB.Thm),
   ("takeRevAcc_ind",takeRevAcc_ind,DB.Thm),
   ("takeRevAcc_def",takeRevAcc_def,DB.Thm), ("drop_ind",drop_ind,DB.Thm),
   ("drop_def",drop_def,DB.Thm),
   ("string_index_of'_ind",string_index_of'_ind,DB.Thm),
   ("string_index_of'_def",string_index_of'_def,DB.Thm),
   ("index_ind",index_ind,DB.Thm), ("index_def",index_def,DB.Thm),
   ("find_index_helper_ind",find_index_helper_ind,DB.Thm),
   ("find_index_helper_def",find_index_helper_def,DB.Thm),
   ("replicate_revacc_ind",replicate_revacc_ind,DB.Thm),
   ("replicate_revacc_def",replicate_revacc_def,DB.Thm),
   ("list_reverse_concat_map_helper_ind",
    list_reverse_concat_map_helper_ind,
    DB.Thm),
   ("list_reverse_concat_map_helper_def",
    list_reverse_concat_map_helper_def,
    DB.Thm), ("list_take_with_accum_ind",list_take_with_accum_ind,DB.Thm),
   ("list_take_with_accum_def",list_take_with_accum_def,DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("showTheory.show_grammars",
                          showTheory.show_grammars),
                         ("lem_sortingTheory.lem_sorting_grammars",
                          lem_sortingTheory.lem_sorting_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("naturalZero", (Term.prim_mk_const { Name = "naturalZero", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("naturalZero", (Term.prim_mk_const { Name = "naturalZero", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("id", (Term.prim_mk_const { Name = "id", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("id", (Term.prim_mk_const { Name = "id", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_byte", (Term.prim_mk_const { Name = "compare_byte", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_byte", (Term.prim_mk_const { Name = "compare_byte", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Missing_pervasives_byte_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Missing_pervasives_byte_dict", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Missing_pervasives_byte_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Missing_pervasives_byte_dict", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("hex_char_of_nibble", (Term.prim_mk_const { Name = "hex_char_of_nibble", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("hex_char_of_nibble", (Term.prim_mk_const { Name = "hex_char_of_nibble", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("hex_string_of_byte", (Term.prim_mk_const { Name = "hex_string_of_byte", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("hex_string_of_byte", (Term.prim_mk_const { Name = "hex_string_of_byte", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Missing_pervasives_byte_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Missing_pervasives_byte_dict", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Missing_pervasives_byte_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Missing_pervasives_byte_dict", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_decimal_digit", (Term.prim_mk_const { Name = "natural_of_decimal_digit", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_decimal_digit", (Term.prim_mk_const { Name = "natural_of_decimal_digit", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_decimal_string_helper", (Term.prim_mk_const { Name = "natural_of_decimal_string_helper", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_decimal_string_helper", (Term.prim_mk_const { Name = "natural_of_decimal_string_helper", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_decimal_string", (Term.prim_mk_const { Name = "natural_of_decimal_string", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_decimal_string", (Term.prim_mk_const { Name = "natural_of_decimal_string", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("hex_string_of_natural", (Term.prim_mk_const { Name = "hex_string_of_natural", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("hex_string_of_natural", (Term.prim_mk_const { Name = "hex_string_of_natural", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_bool", (Term.prim_mk_const { Name = "natural_of_bool", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_bool", (Term.prim_mk_const { Name = "natural_of_bool", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_ordering", (Term.prim_mk_const { Name = "natural_ordering", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_ordering", (Term.prim_mk_const { Name = "natural_ordering", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("merge_by", (Term.prim_mk_const { Name = "merge_by", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("merge_by", (Term.prim_mk_const { Name = "merge_by", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sort_by", (Term.prim_mk_const { Name = "sort_by", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sort_by", (Term.prim_mk_const { Name = "sort_by", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapMaybei'", (Term.prim_mk_const { Name = "mapMaybei'", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapMaybei'", (Term.prim_mk_const { Name = "mapMaybei'", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapMaybei", (Term.prim_mk_const { Name = "mapMaybei", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapMaybei", (Term.prim_mk_const { Name = "mapMaybei", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("partitionii'", (Term.prim_mk_const { Name = "partitionii'", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("partitionii'", (Term.prim_mk_const { Name = "partitionii'", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("filteri", (Term.prim_mk_const { Name = "filteri", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("filteri", (Term.prim_mk_const { Name = "filteri", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("filterii", (Term.prim_mk_const { Name = "filterii", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("filterii", (Term.prim_mk_const { Name = "filterii", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("partitioni", (Term.prim_mk_const { Name = "partitioni", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("partitioni", (Term.prim_mk_const { Name = "partitioni", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("partitionii", (Term.prim_mk_const { Name = "partitionii", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("partitionii", (Term.prim_mk_const { Name = "partitionii", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("unzip3", (Term.prim_mk_const { Name = "unzip3", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("unzip3", (Term.prim_mk_const { Name = "unzip3", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("zip3", (Term.prim_mk_const { Name = "zip3", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("zip3", (Term.prim_mk_const { Name = "zip3", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("intercalate'", (Term.prim_mk_const { Name = "intercalate'", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("intercalate'", (Term.prim_mk_const { Name = "intercalate'", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("intercalate", (Term.prim_mk_const { Name = "intercalate", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("intercalate", (Term.prim_mk_const { Name = "intercalate", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("unlines", (Term.prim_mk_const { Name = "unlines", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("unlines", (Term.prim_mk_const { Name = "unlines", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bracket", (Term.prim_mk_const { Name = "bracket", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bracket", (Term.prim_mk_const { Name = "bracket", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_list", (Term.prim_mk_const { Name = "string_of_list", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_list", (Term.prim_mk_const { Name = "string_of_list", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_list_dict", (Term.prim_mk_const { Name = "instance_Show_Show_list_dict", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_list_dict", (Term.prim_mk_const { Name = "instance_Show_Show_list_dict", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("length", (Term.prim_mk_const { Name = "length", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("length", (Term.prim_mk_const { Name = "length", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("takeRevAcc", (Term.prim_mk_const { Name = "takeRevAcc", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("takeRevAcc", (Term.prim_mk_const { Name = "takeRevAcc", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("take", (Term.prim_mk_const { Name = "take", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("take", (Term.prim_mk_const { Name = "take", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("drop", (Term.prim_mk_const { Name = "drop", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("drop", (Term.prim_mk_const { Name = "drop", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_prefix", (Term.prim_mk_const { Name = "string_prefix", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_prefix", (Term.prim_mk_const { Name = "string_prefix", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_index_of'", (Term.prim_mk_const { Name = "string_index_of'", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_index_of'", (Term.prim_mk_const { Name = "string_index_of'", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_index_of", (Term.prim_mk_const { Name = "string_index_of", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_index_of", (Term.prim_mk_const { Name = "string_index_of", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("index", (Term.prim_mk_const { Name = "index", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("index", (Term.prim_mk_const { Name = "index", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("find_index_helper", (Term.prim_mk_const { Name = "find_index_helper", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("find_index_helper", (Term.prim_mk_const { Name = "find_index_helper", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("find_index0", (Term.prim_mk_const { Name = "find_index0", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("find_index0", (Term.prim_mk_const { Name = "find_index0", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("replicate_revacc", (Term.prim_mk_const { Name = "replicate_revacc", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("replicate_revacc", (Term.prim_mk_const { Name = "replicate_revacc", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("replicate", (Term.prim_mk_const { Name = "replicate", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("replicate", (Term.prim_mk_const { Name = "replicate", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_append", (Term.prim_mk_const { Name = "list_append", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_append", (Term.prim_mk_const { Name = "list_append", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_concat", (Term.prim_mk_const { Name = "list_concat", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_concat", (Term.prim_mk_const { Name = "list_concat", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_concat_map", (Term.prim_mk_const { Name = "list_concat_map", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_concat_map", (Term.prim_mk_const { Name = "list_concat_map", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_reverse_concat_map_helper", (Term.prim_mk_const { Name = "list_reverse_concat_map_helper", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_reverse_concat_map_helper", (Term.prim_mk_const { Name = "list_reverse_concat_map_helper", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_reverse_concat_map", (Term.prim_mk_const { Name = "list_reverse_concat_map", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_reverse_concat_map", (Term.prim_mk_const { Name = "list_reverse_concat_map", Thy = "missing_pervasives"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_take_with_accum", (Term.prim_mk_const { Name = "list_take_with_accum", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_take_with_accum", (Term.prim_mk_const { Name = "list_take_with_accum", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("unsafe_string_take", (Term.prim_mk_const { Name = "unsafe_string_take", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("unsafe_string_take", (Term.prim_mk_const { Name = "unsafe_string_take", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("padding_and_maybe_newline", (Term.prim_mk_const { Name = "padding_and_maybe_newline", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("padding_and_maybe_newline", (Term.prim_mk_const { Name = "padding_and_maybe_newline", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("space_padding_and_maybe_newline", (Term.prim_mk_const { Name = "space_padding_and_maybe_newline", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("space_padding_and_maybe_newline", (Term.prim_mk_const { Name = "space_padding_and_maybe_newline", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("padded_and_maybe_newline", (Term.prim_mk_const { Name = "padded_and_maybe_newline", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("padded_and_maybe_newline", (Term.prim_mk_const { Name = "padded_and_maybe_newline", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("padding_to", (Term.prim_mk_const { Name = "padding_to", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("padding_to", (Term.prim_mk_const { Name = "padding_to", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("left_padded_to", (Term.prim_mk_const { Name = "left_padded_to", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("left_padded_to", (Term.prim_mk_const { Name = "left_padded_to", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("right_padded_to", (Term.prim_mk_const { Name = "right_padded_to", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("right_padded_to", (Term.prim_mk_const { Name = "right_padded_to", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("space_padded_and_maybe_newline", (Term.prim_mk_const { Name = "space_padded_and_maybe_newline", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("space_padded_and_maybe_newline", (Term.prim_mk_const { Name = "space_padded_and_maybe_newline", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("left_space_padded_to", (Term.prim_mk_const { Name = "left_space_padded_to", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("left_space_padded_to", (Term.prim_mk_const { Name = "left_space_padded_to", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("right_space_padded_to", (Term.prim_mk_const { Name = "right_space_padded_to", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("right_space_padded_to", (Term.prim_mk_const { Name = "right_space_padded_to", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("left_zero_padded_to", (Term.prim_mk_const { Name = "left_zero_padded_to", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("left_zero_padded_to", (Term.prim_mk_const { Name = "left_zero_padded_to", Thy = "missing_pervasives"}))
  val missing_pervasives_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "missing_pervasives",
    thydataty = "compute",
    data =
        "missing_pervasives.naturalZero_def missing_pervasives.unsafe_string_take_def missing_pervasives.left_zero_padded_to_def missing_pervasives.right_space_padded_to_def missing_pervasives.left_space_padded_to_def missing_pervasives.space_padded_and_maybe_newline_def missing_pervasives.right_padded_to_def missing_pervasives.left_padded_to_def missing_pervasives.padding_to_def missing_pervasives.padded_and_maybe_newline_def missing_pervasives.space_padding_and_maybe_newline_def missing_pervasives.padding_and_maybe_newline_def missing_pervasives.string_prefix_def missing_pervasives.list_reverse_concat_map_def missing_pervasives.list_concat_map_def missing_pervasives.list_concat_def missing_pervasives.list_append_def missing_pervasives.replicate_def missing_pervasives.find_index0_def missing_pervasives.string_index_of_def missing_pervasives.take_def missing_pervasives.partitionii_def missing_pervasives.length_def missing_pervasives.instance_Show_Show_list_dict_def missing_pervasives.string_of_list_def missing_pervasives.bracket_def missing_pervasives.unlines_def missing_pervasives.intercalate_def missing_pervasives.unzip3_def missing_pervasives.natural_ordering_def missing_pervasives.partitioni_def missing_pervasives.filterii_def missing_pervasives.filteri_def missing_pervasives.mapMaybei_def missing_pervasives.natural_of_bool_def missing_pervasives.natural_of_decimal_digit_def missing_pervasives.natural_of_decimal_string_def missing_pervasives.instance_Basic_classes_Ord_Missing_pervasives_byte_dict_def missing_pervasives.instance_Show_Show_Missing_pervasives_byte_dict_def missing_pervasives.hex_string_of_byte_def missing_pervasives.hex_char_of_nibble_def missing_pervasives.compare_byte_def missing_pervasives.id_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "missing_pervasives"
end
