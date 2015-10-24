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
          Arbnum.fromString "1445345863",
          Arbnum.fromString "394757")
          [("show",
           Arbnum.fromString "1445345838",
           Arbnum.fromString "419158"),
           ("lem_sorting",
           Arbnum.fromString "1445005567",
           Arbnum.fromString "464624")];
  val _ = Theory.incorporate_types "missing_pervasives" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("pair", "prod"), ID("list", "list"),
   ID("string", "char"), ID("num", "num"), ID("option", "option"),
   ID("lem_basic_classes", "ordering"), ID("min", "bool"),
   ID("lem_basic_classes", "Ord_class"), ID("fcp", "cart"),
   ID("bool", "!"), ID("arithmetic", "*"), ID("arithmetic", "+"),
   ID("pair", ","), ID("arithmetic", "-"), ID("bool", "/\\"),
   ID("num", "0"), ID("prim_rec", "<"), ID("arithmetic", "<="),
   ID("min", "="), ID("min", "==>"), ID("arithmetic", ">"), ID("min", "@"),
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
   ID("option", "SOME"), ID("num", "SUC"), ID("list", "TAKE"),
   ID("pair", "UNCURRY"), ID("list", "UNZIP"), ID("relation", "WF"),
   ID("relation", "WFREC"), ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("missing_pervasives", "bracket"),
   ID("missing_pervasives", "compare_byte"),
   ID("lem_assert_extra", "fail"), ID("lem", "failwith"),
   ID("missing_pervasives", "filteri"),
   ID("missing_pervasives", "filterii"),
   ID("missing_pervasives", "find_index0"),
   ID("missing_pervasives", "find_index_helper"),
   ID("missing_pervasives", "find_index_helper_tupled"),
   ID("lem_basic_classes", "genericCompare"),
   ID("missing_pervasives", "hex_char_of_nibble"),
   ID("missing_pervasives", "hex_string_of_byte"),
   ID("missing_pervasives", "hex_string_of_natural"),
   ID("missing_pervasives", "id"), ID("missing_pervasives", "index"),
   ID("missing_pervasives", "index_tupled"),
   ID("missing_pervasives", "instance_Basic_classes_Ord_Missing_pervasives_byte_dict"),
   ID("missing_pervasives", "intercalate"),
   ID("missing_pervasives", "intercalate'"),
   ID("missing_pervasives", "intercalate'_tupled"),
   ID("missing_pervasives", "left_padded_to"),
   ID("missing_pervasives", "left_space_padded_to"),
   ID("missing_pervasives", "left_zero_padded_to"),
   ID("missing_pervasives", "length"), ID("list", "list_CASE"),
   ID("missing_pervasives", "list_append"), ID("lem_list", "list_combine"),
   ID("missing_pervasives", "list_concat"),
   ID("missing_pervasives", "list_concat_map"),
   ID("missing_pervasives", "list_reverse_concat_map"),
   ID("missing_pervasives", "list_reverse_concat_map_helper"),
   ID("missing_pervasives", "list_reverse_concat_map_helper_tupled"),
   ID("missing_pervasives", "list_take_with_accum"),
   ID("missing_pervasives", "list_take_with_accum_tupled"),
   ID("missing_pervasives", "mapMaybei"),
   ID("missing_pervasives", "mapMaybei'"),
   ID("missing_pervasives", "mapMaybei'_tupled"),
   ID("missing_pervasives", "merge_by"),
   ID("missing_pervasives", "merge_by_tupled"),
   ID("missing_pervasives", "naturalZero"),
   ID("missing_pervasives", "natural_of_bool"),
   ID("missing_pervasives", "natural_of_decimal_digit"),
   ID("missing_pervasives", "natural_of_decimal_string"),
   ID("missing_pervasives", "natural_of_decimal_string_helper"),
   ID("missing_pervasives", "natural_of_decimal_string_helper_tupled"),
   ID("missing_pervasives", "natural_ordering"),
   ID("arithmetic", "num_CASE"), ID("option", "option_CASE"),
   ID("missing_pervasives", "padded_and_maybe_newline"),
   ID("missing_pervasives", "padding_and_maybe_newline"),
   ID("missing_pervasives", "padding_to"), ID("pair", "pair_CASE"),
   ID("missing_pervasives", "partitioni"),
   ID("missing_pervasives", "partitionii"),
   ID("missing_pervasives", "partitionii'"),
   ID("missing_pervasives", "partitionii'_tupled"),
   ID("missing_pervasives", "replicate"),
   ID("missing_pervasives", "replicate_revacc"),
   ID("missing_pervasives", "replicate_revacc_tupled"),
   ID("missing_pervasives", "right_padded_to"),
   ID("missing_pervasives", "right_space_padded_to"),
   ID("missing_pervasives", "sort_by"),
   ID("missing_pervasives", "sort_by_tupled"),
   ID("missing_pervasives", "space_padded_and_maybe_newline"),
   ID("missing_pervasives", "space_padding_and_maybe_newline"),
   ID("missing_pervasives", "string_index_of"),
   ID("missing_pervasives", "string_index_of'"),
   ID("missing_pervasives", "string_index_of'_tupled"),
   ID("missing_pervasives", "string_prefix"),
   ID("missing_pervasives", "take"),
   ID("missing_pervasives", "take_tupled"),
   ID("missing_pervasives", "unlines"),
   ID("missing_pervasives", "unsafe_string_take"),
   ID("missing_pervasives", "unzip3"), ID("words", "w2n"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'c", TYOP [2, 0], TYV "'b", TYOP [2, 2], TYOP [1, 3, 1], TYV "'a",
   TYOP [2, 5], TYOP [1, 6, 4], TYOP [1, 2, 0], TYOP [1, 5, 8],
   TYOP [2, 9], TYOP [0, 10, 7], TYOP [3], TYOP [2, 12], TYOP [0, 13, 13],
   TYOP [4], TYOP [0, 15, 14], TYOP [2, 13], TYOP [0, 17, 13],
   TYOP [1, 15, 6], TYOP [0, 19, 6], TYOP [0, 6, 6], TYOP [0, 15, 21],
   TYOP [5, 13], TYOP [0, 13, 23], TYOP [0, 15, 24], TYOP [5, 15],
   TYOP [1, 6, 15], TYOP [1, 5, 27], TYOP [0, 28, 26], TYOP [0, 15, 26],
   TYOP [0, 6, 30], TYOP [0, 5, 31], TYOP [0, 13, 26], TYOP [0, 12, 33],
   TYOP [6], TYOP [0, 5, 35], TYOP [0, 5, 36], TYOP [1, 37, 6],
   TYOP [0, 38, 6], TYOP [0, 37, 21], TYOP [0, 12, 16], TYOP [1, 15, 5],
   TYOP [1, 6, 42], TYOP [0, 43, 6], TYOP [0, 5, 6], TYOP [0, 15, 45],
   TYOP [0, 6, 46], TYOP [2, 42], TYOP [1, 48, 48], TYOP [1, 6, 49],
   TYOP [2, 15], TYOP [1, 51, 50], TYOP [1, 15, 52], TYOP [0, 53, 49],
   TYOP [0, 48, 49], TYOP [0, 48, 55], TYOP [0, 6, 56], TYOP [0, 51, 57],
   TYOP [0, 15, 58], TYOP [0, 6, 49], TYOP [0, 51, 60], TYOP [1, 6, 6],
   TYOP [0, 6, 62], TYOP [0, 51, 63], TYOP [0, 15, 35], TYOP [0, 15, 65],
   TYOP [1, 15, 13], TYOP [0, 67, 15], TYOP [0, 13, 15], TYOP [0, 15, 69],
   TYOP [0, 12, 26], TYOP [7], TYOP [0, 72, 15], TYOP [1, 37, 62],
   TYOP [0, 74, 6], TYOP [0, 6, 21], TYOP [0, 37, 76], TYOP [1, 15, 3],
   TYOP [5, 5], TYOP [0, 2, 79], TYOP [0, 15, 80], TYOP [1, 81, 78],
   TYOP [0, 82, 6], TYOP [0, 3, 6], TYOP [0, 15, 84], TYOP [0, 81, 85],
   TYOP [0, 81, 84], TYOP [1, 15, 62], TYOP [0, 88, 6], TYOP [0, 15, 76],
   TYOP [1, 6, 3], TYOP [0, 2, 6], TYOP [1, 92, 91], TYOP [0, 93, 6],
   TYOP [0, 6, 84], TYOP [0, 92, 95], TYOP [0, 92, 84], TYOP [2, 6],
   TYOP [0, 98, 6], TYOP [0, 6, 15], TYOP [1, 5, 62], TYOP [0, 101, 6],
   TYOP [0, 5, 76], TYOP [0, 5, 21], TYOP [9, 72, 5], TYOP [8, 105],
   TYOP [0, 19, 79], TYOP [0, 6, 79], TYOP [0, 15, 108], TYOP [0, 5, 5],
   TYOP [0, 15, 13], TYOP [0, 105, 13], TYOP [0, 15, 12], TYOP [0, 5, 72],
   TYOP [1, 114, 6], TYOP [1, 15, 115], TYOP [0, 116, 26], TYOP [0, 6, 26],
   TYOP [0, 114, 118], TYOP [0, 15, 119], TYOP [0, 6, 48],
   TYOP [0, 51, 121], TYOP [0, 51, 21], TYOP [9, 72, 2], TYOP [0, 124, 35],
   TYOP [0, 105, 125], TYOP [0, 6, 72], TYOP [0, 6, 127], TYOP [0, 5, 128],
   TYOP [0, 15, 72], TYOP [0, 6, 130], TYOP [0, 5, 131], TYOP [0, 37, 127],
   TYOP [0, 37, 128], TYOP [0, 3, 72], TYOP [0, 6, 135], TYOP [0, 92, 136],
   TYOP [0, 15, 135], TYOP [0, 81, 138], TYOP [0, 15, 114],
   TYOP [0, 6, 140], TYOP [0, 10, 72], TYOP [0, 114, 127],
   TYOP [0, 15, 143], TYOP [0, 15, 127], TYOP [0, 15, 128],
   TYOP [0, 13, 72], TYOP [0, 15, 147], TYOP [0, 48, 72],
   TYOP [0, 48, 149], TYOP [0, 6, 150], TYOP [0, 51, 151],
   TYOP [0, 15, 152], TYOP [0, 10, 142], TYOP [0, 15, 130],
   TYOP [0, 101, 72], TYOP [0, 101, 156], TYOP [0, 28, 72],
   TYOP [0, 28, 158], TYOP [0, 38, 72], TYOP [0, 38, 160],
   TYOP [0, 74, 72], TYOP [0, 74, 162], TYOP [0, 93, 72],
   TYOP [0, 93, 164], TYOP [0, 82, 72], TYOP [0, 82, 166],
   TYOP [0, 43, 72], TYOP [0, 43, 168], TYOP [0, 19, 72],
   TYOP [0, 19, 170], TYOP [0, 67, 72], TYOP [0, 67, 172],
   TYOP [0, 116, 72], TYOP [0, 116, 174], TYOP [0, 88, 72],
   TYOP [0, 88, 176], TYOP [0, 53, 72], TYOP [0, 53, 178], TYOP [0, 6, 45],
   TYOP [0, 114, 72], TYOP [0, 2, 72], TYOP [0, 182, 72], TYOP [0, 0, 72],
   TYOP [0, 184, 72], TYOP [0, 72, 72], TYOP [0, 186, 72],
   TYOP [0, 105, 72], TYOP [0, 188, 72], TYOP [0, 124, 72],
   TYOP [0, 190, 72], TYOP [0, 12, 72], TYOP [0, 192, 72],
   TYOP [0, 181, 72], TYOP [0, 37, 72], TYOP [0, 195, 72],
   TYOP [0, 129, 72], TYOP [0, 197, 72], TYOP [0, 132, 72],
   TYOP [0, 199, 72], TYOP [0, 92, 72], TYOP [0, 201, 72],
   TYOP [0, 133, 72], TYOP [0, 203, 72], TYOP [0, 134, 72],
   TYOP [0, 205, 72], TYOP [0, 137, 72], TYOP [0, 207, 72],
   TYOP [0, 139, 72], TYOP [0, 209, 72], TYOP [0, 180, 72],
   TYOP [0, 211, 72], TYOP [0, 141, 72], TYOP [0, 213, 72],
   TYOP [0, 142, 72], TYOP [0, 215, 72], TYOP [0, 130, 72],
   TYOP [0, 217, 72], TYOP [0, 81, 72], TYOP [0, 219, 72],
   TYOP [0, 144, 72], TYOP [0, 221, 72], TYOP [0, 145, 72],
   TYOP [0, 223, 72], TYOP [0, 146, 72], TYOP [0, 225, 72],
   TYOP [0, 148, 72], TYOP [0, 227, 72], TYOP [0, 153, 72],
   TYOP [0, 229, 72], TYOP [0, 127, 72], TYOP [0, 135, 72],
   TYOP [0, 147, 72], TYOP [0, 98, 72], TYOP [0, 234, 72],
   TYOP [0, 17, 72], TYOP [0, 236, 72], TYOP [0, 51, 72],
   TYOP [0, 238, 72], TYOP [0, 149, 72], TYOP [0, 9, 72],
   TYOP [0, 241, 72], TYOP [0, 8, 72], TYOP [0, 243, 72], TYOP [0, 15, 15],
   TYOP [0, 15, 245], TYOP [0, 8, 9], TYOP [0, 5, 247], TYOP [0, 62, 101],
   TYOP [0, 5, 249], TYOP [0, 27, 28], TYOP [0, 5, 251], TYOP [0, 0, 8],
   TYOP [0, 2, 253], TYOP [0, 6, 115], TYOP [0, 114, 255], TYOP [0, 6, 38],
   TYOP [0, 37, 257], TYOP [0, 62, 74], TYOP [0, 37, 259],
   TYOP [0, 91, 93], TYOP [0, 92, 261], TYOP [0, 78, 82],
   TYOP [0, 81, 263], TYOP [0, 6, 63], TYOP [0, 3, 91], TYOP [0, 6, 266],
   TYOP [0, 15, 27], TYOP [0, 6, 268], TYOP [0, 4, 7], TYOP [0, 6, 270],
   TYOP [0, 49, 50], TYOP [0, 6, 272], TYOP [0, 42, 43], TYOP [0, 6, 274],
   TYOP [0, 1, 4], TYOP [0, 3, 276], TYOP [0, 50, 52], TYOP [0, 51, 278],
   TYOP [0, 5, 42], TYOP [0, 15, 280], TYOP [0, 6, 19], TYOP [0, 15, 282],
   TYOP [0, 3, 78], TYOP [0, 15, 284], TYOP [0, 13, 67], TYOP [0, 15, 286],
   TYOP [0, 115, 116], TYOP [0, 15, 288], TYOP [0, 62, 88],
   TYOP [0, 15, 290], TYOP [0, 52, 53], TYOP [0, 15, 292],
   TYOP [0, 72, 186], TYOP [0, 5, 114], TYOP [0, 106, 72],
   TYOP [0, 106, 296], TYOP [0, 12, 192], TYOP [0, 180, 211],
   TYOP [0, 11, 72], TYOP [0, 11, 300], TYOP [0, 111, 72],
   TYOP [0, 111, 302], TYOP [0, 102, 72], TYOP [0, 102, 304],
   TYOP [0, 29, 72], TYOP [0, 29, 306], TYOP [0, 39, 72],
   TYOP [0, 39, 308], TYOP [0, 75, 72], TYOP [0, 75, 310],
   TYOP [0, 94, 72], TYOP [0, 94, 312], TYOP [0, 83, 72],
   TYOP [0, 83, 314], TYOP [0, 44, 72], TYOP [0, 44, 316],
   TYOP [0, 20, 72], TYOP [0, 20, 318], TYOP [0, 107, 72],
   TYOP [0, 107, 320], TYOP [0, 68, 72], TYOP [0, 68, 322],
   TYOP [0, 117, 72], TYOP [0, 117, 324], TYOP [0, 89, 72],
   TYOP [0, 89, 326], TYOP [0, 54, 72], TYOP [0, 54, 328],
   TYOP [0, 3, 135], TYOP [0, 13, 147], TYOP [0, 51, 238],
   TYOP [0, 79, 72], TYOP [0, 79, 333], TYOP [0, 23, 72],
   TYOP [0, 23, 335], TYOP [0, 26, 72], TYOP [0, 26, 337],
   TYOP [0, 35, 72], TYOP [0, 35, 339], TYOP [0, 9, 241], TYOP [0, 8, 243],
   TYOP [0, 62, 72], TYOP [0, 62, 343], TYOP [0, 7, 72], TYOP [0, 7, 345],
   TYOP [0, 49, 72], TYOP [0, 49, 347], TYOP [0, 154, 72],
   TYOP [0, 349, 154], TYOP [0, 155, 72], TYOP [0, 351, 155],
   TYOP [0, 157, 72], TYOP [0, 353, 157], TYOP [0, 159, 72],
   TYOP [0, 355, 159], TYOP [0, 161, 72], TYOP [0, 357, 161],
   TYOP [0, 163, 72], TYOP [0, 359, 163], TYOP [0, 165, 72],
   TYOP [0, 361, 165], TYOP [0, 167, 72], TYOP [0, 363, 167],
   TYOP [0, 169, 72], TYOP [0, 365, 169], TYOP [0, 171, 72],
   TYOP [0, 367, 171], TYOP [0, 173, 72], TYOP [0, 369, 173],
   TYOP [0, 175, 72], TYOP [0, 371, 175], TYOP [0, 177, 72],
   TYOP [0, 373, 177], TYOP [0, 179, 72], TYOP [0, 375, 179],
   TYOP [0, 13, 14], TYOP [0, 12, 12], TYOP [0, 12, 378],
   TYOP [0, 72, 379], TYOP [0, 72, 76], TYOP [0, 72, 377],
   TYOP [0, 72, 246], TYOP [0, 79, 79], TYOP [0, 79, 384],
   TYOP [0, 72, 385], TYOP [0, 23, 23], TYOP [0, 23, 387],
   TYOP [0, 72, 388], TYOP [0, 26, 26], TYOP [0, 26, 390],
   TYOP [0, 72, 391], TYOP [0, 35, 35], TYOP [0, 35, 393],
   TYOP [0, 72, 394], TYOP [0, 3, 3], TYOP [0, 2, 396], TYOP [0, 1, 1],
   TYOP [0, 0, 398], TYOP [0, 12, 14], TYOP [0, 51, 51], TYOP [0, 15, 401],
   TYOP [0, 10, 10], TYOP [0, 9, 403], TYOP [0, 48, 48], TYOP [0, 42, 405],
   TYOP [0, 180, 76], TYOP [0, 6, 99], TYOP [0, 76, 408], TYOP [0, 13, 18],
   TYOP [0, 377, 410], TYOP [0, 15, 100], TYOP [0, 5, 15],
   TYOP [0, 15, 413], TYOP [0, 414, 412], TYOP [0, 15, 51],
   TYOP [0, 245, 416], TYOP [0, 7, 7], TYOP [0, 49, 49],
   TYOP [0, 105, 188], TYOP [0, 420, 420], TYOP [0, 420, 421],
   TYOP [0, 105, 35], TYOP [0, 105, 423], TYOP [0, 424, 424],
   TYOP [0, 424, 425], TYOP [0, 180, 6], TYOP [0, 427, 427],
   TYOP [0, 21, 21], TYOP [0, 24, 24], TYOP [0, 51, 6], TYOP [0, 431, 431],
   TYOP [0, 51, 48], TYOP [0, 433, 433], TYOP [0, 51, 62],
   TYOP [0, 435, 435], TYOP [0, 51, 49], TYOP [0, 437, 437],
   TYOP [0, 55, 55], TYOP [0, 111, 111], TYOP [0, 15, 49],
   TYOP [0, 441, 441], TYOP [0, 339, 339], TYOP [0, 62, 49],
   TYOP [0, 444, 444], TYOP [0, 418, 418], TYOP [1, 51, 6],
   TYOP [0, 447, 6], TYOP [0, 448, 448], TYOP [0, 447, 62],
   TYOP [0, 450, 450], TYOP [0, 49, 6], TYOP [0, 452, 452],
   TYOP [0, 49, 48], TYOP [0, 454, 454], TYOP [0, 49, 62],
   TYOP [0, 456, 456], TYOP [0, 3, 98], TYOP [0, 92, 458],
   TYOP [0, 106, 106], TYOP [0, 425, 460], TYOP [0, 421, 460],
   TYOP [0, 155, 401], TYOP [0, 48, 405], TYOP [0, 5, 79], TYOP [0, 6, 60],
   TYOP [0, 466, 444], TYOP [0, 271, 418], TYOP [0, 1, 7],
   TYOP [0, 3, 469], TYOP [0, 470, 270], TYOP [0, 123, 448],
   TYOP [0, 64, 450], TYOP [0, 48, 6], TYOP [0, 48, 474],
   TYOP [0, 475, 452], TYOP [0, 464, 454], TYOP [0, 48, 62],
   TYOP [0, 48, 478], TYOP [0, 479, 456], TYOP [0, 48, 447],
   TYOP [0, 11, 11], TYOP [0, 482, 11], TYOP [0, 154, 483],
   TYOP [0, 440, 111], TYOP [0, 155, 485], TYOP [0, 102, 102],
   TYOP [0, 487, 102], TYOP [0, 157, 488], TYOP [0, 29, 29],
   TYOP [0, 490, 29], TYOP [0, 159, 491], TYOP [0, 39, 39],
   TYOP [0, 493, 39], TYOP [0, 161, 494], TYOP [0, 75, 75],
   TYOP [0, 496, 75], TYOP [0, 163, 497], TYOP [0, 94, 94],
   TYOP [0, 499, 94], TYOP [0, 165, 500], TYOP [0, 83, 83],
   TYOP [0, 502, 83], TYOP [0, 167, 503], TYOP [0, 44, 44],
   TYOP [0, 505, 44], TYOP [0, 169, 506], TYOP [0, 20, 20],
   TYOP [0, 508, 20], TYOP [0, 171, 509], TYOP [0, 107, 107],
   TYOP [0, 511, 107], TYOP [0, 171, 512], TYOP [0, 68, 68],
   TYOP [0, 514, 68], TYOP [0, 173, 515], TYOP [0, 117, 117],
   TYOP [0, 517, 117], TYOP [0, 175, 518], TYOP [0, 89, 89],
   TYOP [0, 520, 89], TYOP [0, 177, 521], TYOP [0, 54, 54],
   TYOP [0, 523, 54], TYOP [0, 179, 524], TYOP [0, 13, 6],
   TYOP [0, 155, 66], TYOP [0, 155, 527], TYOP [0, 17, 17],
   TYOP [0, 13, 529], TYOP [0, 104, 6], TYOP [0, 6, 531], TYOP [0, 6, 532],
   TYOP [0, 5, 108], TYOP [0, 534, 79], TYOP [0, 79, 535],
   TYOP [0, 6, 536], TYOP [0, 5, 118], TYOP [0, 538, 26],
   TYOP [0, 26, 539], TYOP [0, 6, 540], TYOP [0, 5, 60], TYOP [0, 542, 49],
   TYOP [0, 49, 543], TYOP [0, 6, 544], TYOP [0, 2, 84], TYOP [0, 546, 6],
   TYOP [0, 6, 547], TYOP [0, 3, 548], TYOP [0, 12, 69], TYOP [0, 550, 15],
   TYOP [0, 15, 551], TYOP [0, 13, 552], TYOP [0, 15, 437],
   TYOP [0, 554, 49], TYOP [0, 49, 555], TYOP [0, 51, 556],
   TYOP [0, 9, 11], TYOP [0, 558, 7], TYOP [0, 7, 559], TYOP [0, 10, 560],
   TYOP [0, 15, 6], TYOP [0, 562, 6], TYOP [0, 6, 563], TYOP [0, 15, 564],
   TYOP [0, 45, 6], TYOP [0, 6, 566], TYOP [0, 79, 567], TYOP [0, 245, 15],
   TYOP [0, 15, 569], TYOP [0, 26, 570], TYOP [0, 8, 7], TYOP [0, 5, 572],
   TYOP [0, 573, 7], TYOP [0, 9, 574], TYOP [0, 62, 6], TYOP [0, 5, 576],
   TYOP [0, 577, 6], TYOP [0, 101, 578], TYOP [0, 27, 26],
   TYOP [0, 5, 580], TYOP [0, 581, 26], TYOP [0, 28, 582], TYOP [0, 0, 7],
   TYOP [0, 2, 584], TYOP [0, 585, 7], TYOP [0, 8, 586], TYOP [0, 119, 26],
   TYOP [0, 115, 588], TYOP [0, 40, 6], TYOP [0, 38, 590],
   TYOP [0, 37, 576], TYOP [0, 592, 6], TYOP [0, 74, 593], TYOP [0, 91, 6],
   TYOP [0, 92, 595], TYOP [0, 596, 6], TYOP [0, 93, 597], TYOP [0, 78, 6],
   TYOP [0, 81, 599], TYOP [0, 600, 6], TYOP [0, 82, 601], TYOP [0, 76, 6],
   TYOP [0, 62, 603], TYOP [0, 95, 6], TYOP [0, 91, 605], TYOP [0, 31, 26],
   TYOP [0, 27, 607], TYOP [0, 6, 419], TYOP [0, 609, 49],
   TYOP [0, 50, 610], TYOP [0, 42, 6], TYOP [0, 6, 612], TYOP [0, 613, 6],
   TYOP [0, 43, 614], TYOP [0, 50, 49], TYOP [0, 51, 616],
   TYOP [0, 617, 49], TYOP [0, 52, 618], TYOP [0, 56, 49],
   TYOP [0, 49, 620], TYOP [0, 46, 6], TYOP [0, 42, 622],
   TYOP [0, 414, 15], TYOP [0, 42, 624], TYOP [0, 22, 6],
   TYOP [0, 19, 626], TYOP [0, 109, 79], TYOP [0, 19, 628],
   TYOP [0, 85, 6], TYOP [0, 78, 630], TYOP [0, 70, 15], TYOP [0, 67, 632],
   TYOP [0, 115, 26], TYOP [0, 15, 634], TYOP [0, 635, 26],
   TYOP [0, 116, 636], TYOP [0, 15, 576], TYOP [0, 638, 6],
   TYOP [0, 88, 639], TYOP [0, 52, 49], TYOP [0, 15, 641],
   TYOP [0, 642, 49], TYOP [0, 53, 643], TYOP [0, 12, 13],
   TYOP [0, 15, 645], TYOP [0, 13, 30], TYOP [0, 12, 647],
   TYOP [0, 105, 15], TYOP [0, 124, 15]]
  end
  val _ = Theory.incorporate_consts "missing_pervasives" tyvector
     [("unzip3", 11), ("unsafe_string_take", 16), ("unlines", 18),
      ("take_tupled", 20), ("take", 22), ("string_prefix", 25),
      ("string_index_of'_tupled", 29), ("string_index_of'", 32),
      ("string_index_of", 34), ("space_padding_and_maybe_newline", 16),
      ("space_padded_and_maybe_newline", 16), ("sort_by_tupled", 39),
      ("sort_by", 40), ("right_space_padded_to", 16),
      ("right_padded_to", 41), ("replicate_revacc_tupled", 44),
      ("replicate_revacc", 47), ("replicate", 46),
      ("partitionii'_tupled", 54), ("partitionii'", 59),
      ("partitionii", 61), ("partitioni", 64), ("padding_to", 41),
      ("padding_and_maybe_newline", 41), ("padded_and_maybe_newline", 41),
      ("natural_ordering", 66),
      ("natural_of_decimal_string_helper_tupled", 68),
      ("natural_of_decimal_string_helper", 70),
      ("natural_of_decimal_string", 69), ("natural_of_decimal_digit", 71),
      ("natural_of_bool", 73), ("naturalZero", 15),
      ("merge_by_tupled", 75), ("merge_by", 77), ("mapMaybei'_tupled", 83),
      ("mapMaybei'", 86), ("mapMaybei", 87),
      ("list_take_with_accum_tupled", 89), ("list_take_with_accum", 90),
      ("list_reverse_concat_map_helper_tupled", 94),
      ("list_reverse_concat_map_helper", 96),
      ("list_reverse_concat_map", 97), ("list_concat_map", 97),
      ("list_concat", 99), ("list_append", 76), ("length", 100),
      ("left_zero_padded_to", 16), ("left_space_padded_to", 16),
      ("left_padded_to", 41), ("intercalate'_tupled", 102),
      ("intercalate'", 103), ("intercalate", 104),
      ("instance_Basic_classes_Ord_Missing_pervasives_byte_dict", 106),
      ("index_tupled", 107), ("index", 109), ("id", 110),
      ("hex_string_of_natural", 111), ("hex_string_of_byte", 112),
      ("hex_char_of_nibble", 113), ("find_index_helper_tupled", 117),
      ("find_index_helper", 120), ("find_index0", 119), ("filterii", 122),
      ("filteri", 123), ("compare_byte", 126), ("bracket", 18)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("P", 129), TMV("P", 132), TMV("P", 133), TMV("P", 134),
   TMV("P", 137), TMV("P", 139), TMV("P", 141), TMV("P", 142),
   TMV("P", 130), TMV("P", 144), TMV("P", 145), TMV("P", 146),
   TMV("P", 148), TMV("P", 153), TMV("R", 154), TMV("R", 155),
   TMV("R", 157), TMV("R", 159), TMV("R", 161), TMV("R", 163),
   TMV("R", 165), TMV("R", 167), TMV("R", 169), TMV("R", 171),
   TMV("R", 173), TMV("R", 175), TMV("R", 177), TMV("R", 179),
   TMV("a", 101), TMV("a", 28), TMV("a", 38), TMV("a", 74), TMV("a", 93),
   TMV("a", 82), TMV("a", 43), TMV("a", 19), TMV("a", 67), TMV("a", 116),
   TMV("a", 88), TMV("a", 53), TMV("acc", 6), TMV("acc", 15),
   TMV("accum", 6), TMV("accum", 48), TMV("accum_compl", 48), TMV("b", 72),
   TMV("b", 105), TMV("b1", 105), TMV("b2", 124), TMV("c", 12),
   TMV("chars", 13), TMV("comp", 37), TMV("count1", 15), TMV("cs", 13),
   TMV("dig", 15), TMV("e", 5), TMV("e", 12), TMV("f", 92), TMV("f", 81),
   TMV("f1", 105), TMV("f2", 105), TMV("find_index_helper_tupled", 117),
   TMV("hex_string_of_natural", 111), TMV("i", 5), TMV("i", 15),
   TMV("idx", 15), TMV("index_tupled", 107),
   TMV("intercalate'_tupled", 102), TMV("is", 51), TMV("item", 2),
   TMV("items", 3), TMV("j", 15), TMV("just_indices", 51),
   TMV("just_indices_compl", 51), TMV("just_items", 6),
   TMV("just_items_compl", 6), TMV("l", 6), TMV("l", 3), TMV("l", 10),
   TMV("l1", 6), TMV("l2", 6), TMV("lcons", 180), TMV("left", 6),
   TMV("left", 15), TMV("left_indices", 51), TMV("left_with_indices", 48),
   TMV("len", 15), TMV("length_to_split_off", 15),
   TMV("list_reverse_concat_map_helper_tupled", 94),
   TMV("list_take_with_accum_tupled", 89), TMV("ll", 3), TMV("ll", 98),
   TMV("ls", 6), TMV("m", 15), TMV("mapMaybei'_tupled", 83),
   TMV("mapped_list", 6), TMV("merge_by_tupled", 75), TMV("more_is", 51),
   TMV("more_xs", 6), TMV("n", 15),
   TMV("natural_of_decimal_string_helper_tupled", 68), TMV("offset", 15),
   TMV("p", 114), TMV("padlen", 15), TMV("partitionii'_tupled", 54),
   TMV("replicate_revacc_tupled", 44), TMV("result", 35), TMV("revacc", 6),
   TMV("reverse_acc", 6), TMV("reverse_accum", 48),
   TMV("reverse_accum_compl", 48), TMV("right", 6), TMV("right", 15),
   TMV("rs", 6), TMV("s", 5), TMV("s", 13), TMV("sep", 5),
   TMV("sort_by_tupled", 39), TMV("sorted_is", 51), TMV("ss", 6),
   TMV("ss'", 6), TMV("str", 13), TMV("string_index_of'_tupled", 29),
   TMV("take_tupled", 20), TMV("unzip3", 11), TMV("v", 5), TMV("v", 37),
   TMV("v", 92), TMV("v", 81), TMV("v", 6), TMV("v", 10), TMV("v", 15),
   TMV("v", 9), TMV("v1", 5), TMV("v1", 114), TMV("v1", 6), TMV("v1", 13),
   TMV("v1", 51), TMV("v1", 15), TMV("v1", 115), TMV("v1", 62),
   TMV("v1", 91), TMV("v1", 27), TMV("v1", 52), TMV("v1", 42),
   TMV("v1", 78), TMV("v2", 5), TMV("v2", 6), TMV("v2", 3), TMV("v2", 15),
   TMV("v3", 6), TMV("v3", 48), TMV("v3", 8), TMV("v3", 50), TMV("v4", 48),
   TMV("v5", 49), TMV("v6", 5), TMV("v7", 6), TMV("width", 15),
   TMV("x", 5), TMV("x", 2), TMV("x", 37), TMV("x", 92), TMV("x", 81),
   TMV("x", 6), TMV("x", 15), TMV("x1", 114), TMV("x1", 6), TMV("x1", 13),
   TMV("x1", 51), TMV("x1", 15), TMV("x2", 5), TMV("x2", 6), TMV("x2", 3),
   TMV("x2", 15), TMV("x3", 48), TMV("x4", 48), TMV("xs", 6), TMV("xs", 3),
   TMV("xs", 17), TMV("xs'", 6), TMV("xs'", 3), TMV("xyzs", 10),
   TMV("y", 5), TMV("y", 2), TMV("y", 15), TMV("ys", 6), TMV("ys", 3),
   TMV("ys'", 6), TMV("ys''", 6), TMV("z", 0), TMV("zs", 1), TMC(10, 181),
   TMC(10, 183), TMC(10, 185), TMC(10, 187), TMC(10, 189), TMC(10, 191),
   TMC(10, 193), TMC(10, 194), TMC(10, 196), TMC(10, 198), TMC(10, 200),
   TMC(10, 202), TMC(10, 204), TMC(10, 206), TMC(10, 208), TMC(10, 210),
   TMC(10, 212), TMC(10, 214), TMC(10, 216), TMC(10, 218), TMC(10, 220),
   TMC(10, 222), TMC(10, 224), TMC(10, 226), TMC(10, 228), TMC(10, 230),
   TMC(10, 231), TMC(10, 232), TMC(10, 233), TMC(10, 235), TMC(10, 237),
   TMC(10, 239), TMC(10, 215), TMC(10, 240), TMC(10, 217), TMC(10, 242),
   TMC(10, 244), TMC(11, 246), TMC(12, 246), TMC(13, 248), TMC(13, 250),
   TMC(13, 252), TMC(13, 254), TMC(13, 256), TMC(13, 258), TMC(13, 260),
   TMC(13, 262), TMC(13, 264), TMC(13, 265), TMC(13, 267), TMC(13, 269),
   TMC(13, 271), TMC(13, 273), TMC(13, 275), TMC(13, 277), TMC(13, 279),
   TMC(13, 56), TMC(13, 281), TMC(13, 283), TMC(13, 285), TMC(13, 287),
   TMC(13, 289), TMC(13, 291), TMC(13, 293), TMC(14, 246), TMC(15, 294),
   TMC(16, 15), TMC(17, 155), TMC(18, 155), TMC(19, 295), TMC(19, 297),
   TMC(19, 298), TMC(19, 299), TMC(19, 301), TMC(19, 303), TMC(19, 305),
   TMC(19, 307), TMC(19, 309), TMC(19, 311), TMC(19, 313), TMC(19, 315),
   TMC(19, 317), TMC(19, 319), TMC(19, 321), TMC(19, 323), TMC(19, 325),
   TMC(19, 327), TMC(19, 329), TMC(19, 128), TMC(19, 330), TMC(19, 331),
   TMC(19, 332), TMC(19, 154), TMC(19, 150), TMC(19, 155), TMC(19, 334),
   TMC(19, 336), TMC(19, 338), TMC(19, 340), TMC(19, 341), TMC(19, 342),
   TMC(19, 344), TMC(19, 346), TMC(19, 348), TMC(20, 294), TMC(21, 155),
   TMC(22, 350), TMC(22, 352), TMC(22, 354), TMC(22, 356), TMC(22, 358),
   TMC(22, 360), TMC(22, 362), TMC(22, 364), TMC(22, 366), TMC(22, 368),
   TMC(22, 370), TMC(22, 372), TMC(22, 374), TMC(22, 376), TMC(23, 76),
   TMC(23, 377), TMC(24, 106), TMC(25, 245), TMC(26, 245), TMC(27, 113),
   TMC(28, 380), TMC(28, 381), TMC(28, 382), TMC(28, 383), TMC(28, 386),
   TMC(28, 389), TMC(28, 392), TMC(28, 395), TMC(29, 104), TMC(29, 397),
   TMC(29, 399), TMC(29, 400), TMC(29, 402), TMC(29, 404), TMC(29, 406),
   TMC(30, 246), TMC(31, 22), TMC(32, 35), TMC(33, 14), TMC(34, 407),
   TMC(34, 409), TMC(34, 411), TMC(34, 415), TMC(35, 417), TMC(36, 35),
   TMC(37, 21), TMC(37, 14), TMC(37, 245), TMC(37, 384), TMC(37, 390),
   TMC(37, 418), TMC(37, 419), TMC(38, 14), TMC(39, 422), TMC(39, 426),
   TMC(40, 100), TMC(40, 69), TMC(41, 428), TMC(41, 429), TMC(41, 430),
   TMC(41, 432), TMC(41, 434), TMC(41, 436), TMC(41, 438), TMC(41, 439),
   TMC(41, 440), TMC(41, 442), TMC(41, 443), TMC(41, 445), TMC(41, 446),
   TMC(41, 449), TMC(41, 451), TMC(41, 453), TMC(41, 455), TMC(41, 457),
   TMC(42, 35), TMC(43, 459), TMC(44, 246), TMC(45, 6), TMC(45, 3),
   TMC(45, 1), TMC(45, 13), TMC(45, 48), TMC(46, 79), TMC(46, 23),
   TMC(46, 26), TMC(47, 245), TMC(48, 461), TMC(49, 462), TMC(50, 462),
   TMC(51, 462), TMC(52, 462), TMC(53, 463), TMC(54, 76), TMC(54, 464),
   TMC(55, 21), TMC(55, 405), TMC(56, 465), TMC(56, 24), TMC(56, 30),
   TMC(57, 245), TMC(58, 22), TMC(58, 16), TMC(59, 467), TMC(59, 468),
   TMC(59, 471), TMC(59, 472), TMC(59, 473), TMC(59, 476), TMC(59, 477),
   TMC(59, 480), TMC(60, 481), TMC(61, 349), TMC(61, 351), TMC(61, 353),
   TMC(61, 355), TMC(61, 357), TMC(61, 359), TMC(61, 361), TMC(61, 363),
   TMC(61, 365), TMC(61, 367), TMC(61, 369), TMC(61, 371), TMC(61, 373),
   TMC(61, 375), TMC(62, 484), TMC(62, 486), TMC(62, 489), TMC(62, 492),
   TMC(62, 495), TMC(62, 498), TMC(62, 501), TMC(62, 504), TMC(62, 507),
   TMC(62, 510), TMC(62, 513), TMC(62, 516), TMC(62, 519), TMC(62, 522),
   TMC(62, 525), TMC(63, 15), TMC(64, 294), TMC(65, 18), TMC(66, 424),
   TMC(66, 126), TMC(67, 12), TMC(68, 526), TMC(69, 123), TMC(70, 122),
   TMC(71, 119), TMC(72, 120), TMC(73, 117), TMC(74, 528), TMC(75, 113),
   TMC(76, 112), TMC(77, 111), TMC(78, 110), TMC(78, 245), TMC(79, 109),
   TMC(80, 107), TMC(81, 106), TMC(82, 104), TMC(82, 530), TMC(83, 103),
   TMC(84, 102), TMC(85, 41), TMC(86, 16), TMC(87, 16), TMC(88, 100),
   TMC(88, 69), TMC(89, 533), TMC(89, 537), TMC(89, 541), TMC(89, 545),
   TMC(89, 549), TMC(89, 553), TMC(89, 557), TMC(89, 561), TMC(90, 76),
   TMC(91, 122), TMC(92, 99), TMC(93, 97), TMC(94, 97), TMC(95, 96),
   TMC(96, 94), TMC(97, 90), TMC(98, 89), TMC(99, 87), TMC(100, 86),
   TMC(101, 83), TMC(102, 77), TMC(103, 75), TMC(104, 15), TMC(105, 73),
   TMC(106, 71), TMC(107, 69), TMC(108, 70), TMC(109, 68), TMC(110, 66),
   TMC(111, 565), TMC(112, 568), TMC(112, 571), TMC(113, 41), TMC(114, 41),
   TMC(115, 41), TMC(116, 575), TMC(116, 579), TMC(116, 583),
   TMC(116, 587), TMC(116, 589), TMC(116, 591), TMC(116, 594),
   TMC(116, 598), TMC(116, 602), TMC(116, 604), TMC(116, 606),
   TMC(116, 608), TMC(116, 611), TMC(116, 615), TMC(116, 619),
   TMC(116, 621), TMC(116, 623), TMC(116, 625), TMC(116, 627),
   TMC(116, 629), TMC(116, 631), TMC(116, 633), TMC(116, 637),
   TMC(116, 640), TMC(116, 644), TMC(117, 64), TMC(118, 61), TMC(119, 59),
   TMC(120, 54), TMC(121, 46), TMC(121, 646), TMC(122, 47), TMC(123, 44),
   TMC(124, 41), TMC(125, 16), TMC(126, 40), TMC(127, 39), TMC(128, 16),
   TMC(129, 16), TMC(130, 34), TMC(131, 32), TMC(131, 648), TMC(132, 29),
   TMC(133, 25), TMC(134, 22), TMC(134, 16), TMC(135, 20), TMC(136, 18),
   TMC(137, 16), TMC(138, 11), TMC(139, 649), TMC(139, 650), TMC(140, 186)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op naturalZero_def x = x
    val op naturalZero_def =
    DT(((("missing_pervasives",0),[]),[]), [read"%286%491@%258@"])
  fun op id_def x = x
    val op id_def =
    DT(((("missing_pervasives",1),[]),[]),
       [read"%192%159%261%455$0@@$0@|@"])
  fun op compare_byte_def x = x
    val op compare_byte_def =
    DT(((("missing_pervasives",2),[]),[]),
       [read"%196%47%197%48%290%443$1@$0@@%451%259@%286@%554$1@@%555$0@@@|@|@"])
  fun op instance_Basic_classes_Ord_Missing_pervasives_byte_dict_def x = x
    val op instance_Basic_classes_Ord_Missing_pervasives_byte_dict_def =
    DT(((("missing_pervasives",3),[]),[]),
       [read"%262%459@%385%352%442@@%389%351%59%60%290%442$1@$0@@%373@||@@%388%351%59%60%365%106%440%290$0@%373@@%290$0@%335@@|@%442$1@$0@@||@@%387%351%59%60%290%442$1@$0@@%342@||@@%386%351%59%60%365%106%440%290$0@%342@@%290$0@%335@@|@%442$1@$0@@||@@%314@@@@@@"])
  fun op hex_char_of_nibble_def x = x
    val op hex_char_of_nibble_def =
    DT(((("missing_pervasives",4),[]),[]),
       [read"%226%99%263%452$0@@%318%286$0@%258@@%317%384%316%315%315%315%316%439@@@@@@@@%318%286$0@%384%315%439@@@@%317%384%315%316%315%315%316%439@@@@@@@@%318%286$0@%384%316%439@@@@%317%384%316%316%315%315%316%439@@@@@@@@%318%286$0@%384%315%315%439@@@@@%317%384%315%315%316%315%316%439@@@@@@@@%318%286$0@%384%316%315%439@@@@@%317%384%316%315%316%315%316%439@@@@@@@@%318%286$0@%384%315%316%439@@@@@%317%384%315%316%316%315%316%439@@@@@@@@%318%286$0@%384%316%316%439@@@@@%317%384%316%316%316%315%316%439@@@@@@@@%318%286$0@%384%315%315%315%439@@@@@@%317%384%315%315%315%316%316%439@@@@@@@@%318%286$0@%384%316%315%315%439@@@@@@%317%384%316%315%315%316%316%439@@@@@@@@%318%286$0@%384%315%316%315%439@@@@@@%317%384%315%316%315%316%316%439@@@@@@@@%318%286$0@%384%316%316%315%439@@@@@@%317%384%315%316%315%315%315%316%439@@@@@@@@@%318%286$0@%384%315%315%316%439@@@@@@%317%384%316%316%315%315%315%316%439@@@@@@@@@%318%286$0@%384%316%315%316%439@@@@@@%317%384%315%315%316%315%315%316%439@@@@@@@@@%318%286$0@%384%315%316%316%439@@@@@@%317%384%316%315%316%315%315%316%439@@@@@@@@@%318%286$0@%384%316%316%316%439@@@@@@%317%384%315%316%316%315%315%316%439@@@@@@@@@%318%286$0@%384%315%315%315%315%439@@@@@@@%317%384%316%316%316%315%315%316%439@@@@@@@@@%444@@@@@@@@@@@@@@@@@|@"])
  fun op hex_string_of_byte_def x = x
    val op hex_string_of_byte_def =
    DT(((("missing_pervasives",5),[]),[]),
       [read"%196%46%282%453$0@@%350%329%452%333%554$0@@%384%316%315%315%315%439@@@@@@@@%329%452%375%554$0@@%384%316%315%315%315%439@@@@@@@@%379@@@@|@"])
  fun op natural_of_decimal_digit_def x = x
    val op natural_of_decimal_digit_def =
    DT(((("missing_pervasives",6),[]),[]),
       [read"%198%49%289%493$0@@%324%263$0@%317%384%316%315%315%315%316%439@@@@@@@@@%397%258@@%324%263$0@%317%384%315%316%315%315%316%439@@@@@@@@@%397%384%315%439@@@@%324%263$0@%317%384%316%316%315%315%316%439@@@@@@@@@%397%384%316%439@@@@%324%263$0@%317%384%315%315%316%315%316%439@@@@@@@@@%397%384%315%315%439@@@@@%324%263$0@%317%384%316%315%316%315%316%439@@@@@@@@@%397%384%316%315%439@@@@@%324%263$0@%317%384%315%316%316%315%316%439@@@@@@@@@%397%384%315%316%439@@@@@%324%263$0@%317%384%316%316%316%315%316%439@@@@@@@@@%397%384%316%316%439@@@@@%324%263$0@%317%384%315%315%315%316%316%439@@@@@@@@@%397%384%315%315%315%439@@@@@@%324%263$0@%317%384%316%315%315%316%316%439@@@@@@@@@%397%384%316%315%315%439@@@@@@%324%263$0@%317%384%315%316%315%316%316%439@@@@@@@@@%397%384%315%316%315%439@@@@@@%383@@@@@@@@@@@|@"])
  fun op natural_of_decimal_string_helper_tupled_primitive_def x = x
    val op natural_of_decimal_string_helper_tupled_primitive_def =
    DT(((("missing_pervasives",7),[]),[]),
       [read"%276%496@%435%308%24%257%420$0@@%226%41%220%50%198%49%220%53%226%54%296%257%282$3@%329$2@$1@@@%289%493$2@@%397$0@@@@$5%252%230%229%384%316%316%315%439@@@@@$4@@$0@@$1@@%252$4@$3@@@|@|@|@|@|@@|@@%100%36%525$0@%41%50%345%474$0@$1@%49%53%500%493$1@@$3@%54$6%252%230%229%384%316%316%315%439@@@@@$4@@$0@@$1@@|@||@@||@||@@"])
  fun op natural_of_decimal_string_helper_curried_def x = x
    val op natural_of_decimal_string_helper_curried_def =
    DT(((("missing_pervasives",8),[]),[]),
       [read"%226%165%220%168%286%495$1@$0@@%496%252$1@$0@@@|@|@"])
  fun op natural_of_decimal_string_def x = x
    val op natural_of_decimal_string_def =
    DT(((("missing_pervasives",11),[]),[]),
       [read"%220%115%286%494$0@@%495%258@%336$0@@@|@"])
  fun op hex_string_of_natural_primitive_def x = x
    val op hex_string_of_natural_primitive_def =
    DT(((("missing_pervasives",12),[]),[]),
       [read"%266%454@%425%299%15%257%411$0@@%226%99%296%556%259$0@%384%316%315%315%315%439@@@@@@@@$1%333$0@%384%316%315%315%315%439@@@@@@@$0@@|@@|@@%62%99%344%320%259$0@%384%316%315%315%315%439@@@@@@@%350%329%452$0@@%379@@@%313$1%333$0@%384%316%315%315%315%439@@@@@@@@%350%329%452%375$0@%384%316%315%315%315%439@@@@@@@@%379@@@@@||@@"])
  fun op natural_of_bool_def x = x
    val op natural_of_bool_def =
    DT(((("missing_pervasives",15),[]),[]),
       [read"%195%45%286%492$0@@%321$0@%384%315%439@@@%258@@|@"])
  fun op natural_ordering_def x = x
    val op natural_ordering_def =
    DT(((("missing_pervasives",16),[]),[]),
       [read"%226%83%226%112%290%497$1@$0@@%325%286$1@$0@@%335@%325%259$1@$0@@%373@%342@@@|@|@"])
  fun op merge_by_tupled_primitive_def x = x
    val op merge_by_tupled_primitive_def =
    DT(((("missing_pervasives",17),[]),[]),
       [read"%270%490@%429%303%19%257%415$0@@%257%200%51%218%186%218%177%218%129%218%188%192%159%218%180%192%183%218%189%296%257%293%240$6@$7@@%240$5@$4@@@%257%280$5@%326$3@$2@@@%257%280$4@%326$1@$0@@@%556%290$8$3@$1@@%373@@@@@@$9%237$8@%240%326$3@$2@@$0@@@%237$8@%240$6@$7@@@@|@|@|@|@|@|@|@|@|@@%200%51%218%186%218%177%218%129%218%188%192%159%218%180%192%183%218%189%296%257%293%240$6@$7@@%240$5@$4@@@%257%280$5@%326$3@$2@@@%257%280$4@%326$1@$0@@@%290$8$3@$1@@%373@@@@@$9%237$8@%240$2@%326$1@$0@@@@%237$8@%240$6@$7@@@@|@|@|@|@|@|@|@|@|@@@|@@%96%31%510$0@%51%140%513$0@%177%186%343%513%240$1@$0@@%129%186%469$1@$0@%159%177%469$2@%326$1@$0@@%183%188%319%290$9$3@$1@@%373@@%326$3@$11%237$9@%240$2@%326$1@$0@@@@@@%326$1@$11%237$9@%240%326$3@$2@@$0@@@@@||@||@||@@||@||@||@@"])
  fun op merge_by_curried_def x = x
    val op merge_by_curried_def =
    DT(((("missing_pervasives",18),[]),[]),
       [read"%200%161%218%167%218%172%280%489$2@$1@$0@@%490%237$2@%240$1@$0@@@@|@|@|@"])
  fun op sort_by_tupled_primitive_def x = x
    val op sort_by_tupled_primitive_def =
    DT(((("missing_pervasives",21),[]),[]),
       [read"%269%540@%428%302%18%257%414$0@@%257%200%51%218%177%192%159%218%150%192%156%218%157%218%92%218%113%296%257%280$6@%326$5@$4@@@%257%280$4@%326$3@$2@@@%257%280$1@%399%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@%280$0@%334%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@@@@$8%236$7@$0@@%236$7@$6@@@|@|@|@|@|@|@|@|@@%200%51%218%177%192%159%218%150%192%156%218%157%218%92%218%113%296%257%280$6@%326$5@$4@@@%257%280$4@%326$3@$2@@@%257%280$1@%399%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@%280$0@%334%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@@@@$8%236$7@$1@@%236$7@$6@@@|@|@|@|@|@|@|@|@@@|@@%117%30%509$0@%51%177%343%469$0@%376@%159%150%469$0@%326$1@%376@@%156%157%356%92%356%113%489$7@$9%236$7@$1@@@$9%236$7@$0@@@|@%334%333%353%326$4@%326$2@$1@@@@%384%316%439@@@@%326$4@%326$2@$1@@@@|@%399%333%353%326$3@%326$1@$0@@@@%384%316%439@@@@%326$3@%326$1@$0@@@@||@||@@||@||@@"])
  fun op sort_by_curried_def x = x
    val op sort_by_curried_def =
    DT(((("missing_pervasives",22),[]),[]),
       [read"%200%161%218%167%280%539$1@$0@@%540%236$1@$0@@@|@|@"])
  fun op mapMaybei'_tupled_primitive_def x = x
    val op mapMaybei'_tupled_primitive_def =
    DT(((("missing_pervasives",25),[]),[]),
       [read"%272%488@%431%305%21%257%417$0@@%257%226%65%212%58%219%178%193%160%219%181%192%55%296%257%281$3@%327$2@$1@@@%287$4$5@$2@@%395$0@@@@$6%239$4@%251%230%384%315%439@@@$5@@$1@@@%239$4@%251$5@$3@@@@|@|@|@|@|@|@@%226%65%212%58%219%178%193%160%219%181%296%257%281$2@%327$1@$0@@@%287$3$4@$1@@%381@@@$5%239$3@%251%230%384%315%439@@@$4@@$0@@@%239$3@%251$4@$2@@@@|@|@|@|@|@@@|@@%94%33%512$0@%58%145%524$0@%65%178%343%473$0@%376@%160%178%499$5$3@$1@@$7%239$5@%251%230%384%315%439@@@$3@@$0@@@@%55%326$0@$8%239$6@%251%230%384%315%439@@@$4@@$1@@@@|@||@@||@||@||@@"])
  fun op mapMaybei'_curried_def x = x
    val op mapMaybei'_curried_def =
    DT(((("missing_pervasives",26),[]),[]),
       [read"%212%163%226%170%219%173%280%487$2@$1@$0@@%488%239$2@%251$1@$0@@@@|@|@|@"])
  fun op mapMaybei_def x = x
    val op mapMaybei_def =
    DT(((("missing_pervasives",29),[]),[]),
       [read"%212%58%219%178%280%486$1@$0@@%487$1@%258@$0@@|@|@"])
  fun op partitionii'_tupled_primitive_def x = x
    val op partitionii'_tupled_primitive_def =
    DT(((("missing_pervasives",30),[]),[]),
       [read"%279%532@%438%311%27%257%423$0@@%225%110%225%109%218%177%226%101%223%118%226%64%223%97%226%87%218%82%218%111%223%84%225%85%192%159%218%98%296%257%283$9@%330$8@$7@@@%257%286$6@%256$8@$10@@@%257%293%240$5@$4@@%240%399$6@$11@@%334$6@$11@@@@%257%283$3@%341%71%230$0@$11@|@%353$5@@@@%257%285$2@%478$3@$5@@@%280$4@%326$1@$0@@@@@@@@$14%255%230$8@%384%315%439@@@@%247$7@%244$0@%248%332%249$8@$1@@$12@@%392$2@$13@@@@@@%255$10@%247$9@%244$11@%248$12@$13@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@|@@%104%39%528$0@%101%143%518$0@%118%153%516$0@%177%155%519$0@%109%110%349%475$5@%248%394$1@@%394$0@@@%64%97%364%87%366%401%82%111%361%84%362%85%472$2@%248%394$8@@%392$7@$0@@@%159%98$18%255%230$8@%384%315%439@@@@%247$7@%244$0@%248%332%249$8@$1@@$10@@%392$2@$9@@@@@@||@|@%478$0@$2@@|@%341%71%230$0@$13@|@%353$1@@@||@@%240%399$0@$6@@%334$0@$6@@@|@%256$1@$9@@||@@||@||@||@||@||@@"])
  fun op partitionii'_curried_def x = x
    val op partitionii'_curried_def =
    DT(((("missing_pervasives",31),[]),[]),
       [read"%226%165%223%169%218%172%225%175%225%176%295%531$4@$3@$2@$1@$0@@%532%255$4@%247$3@%244$2@%248$1@$0@@@@@@|@|@|@|@|@"])
  fun op filteri_def x = x
    val op filteri_def =
    DT(((("missing_pervasives",34),[]),[]),
       [read"%223%68%218%177%280%446$1@$0@@%358%118%370%406%43%44%368%404%72%74$0||@@%409$1@@||@@%531%258@$0@$1@%380@%380@@|@%390%260@$1@@@|@|@"])
  fun op filterii_def x = x
    val op filterii_def =
    DT(((("missing_pervasives",35),[]),[]),
       [read"%223%68%218%177%285%447$1@$0@@%359%118%371%407%43%44$1||@@%531%258@$0@$1@%380@%380@@|@%390%260@$1@@@|@|@"])
  fun op partitioni_def x = x
    val op partitioni_def =
    DT(((("missing_pervasives",36),[]),[]),
       [read"%223%68%218%177%293%529$1@$0@@%360%118%372%408%43%44%369%405%72%74%369%405%73%75%240$2@$0@||@@%409$2@@||@@%409$1@@||@@%531%258@$0@$1@%380@%380@@|@%390%260@$1@@@|@|@"])
  fun op partitionii_def x = x
    val op partitionii_def =
    DT(((("missing_pervasives",37),[]),[]),
       [read"%223%68%218%177%295%530$1@$0@@%361%118%531%258@$0@$1@%380@%380@|@%390%260@$1@@@|@|@"])
  fun op unzip3_primitive_def x = x
    val op unzip3_primitive_def =
    DT(((("missing_pervasives",38),[]),[]),
       [read"%265%553@%424%298%14%257%410$0@@%224%78%227%132%224%182%192%159%228%152%193%184%194%190%296%257%284$6@%331$5@$4@@@%257%291$5@%231$3@$2@@@%292$2@%234$1@$0@@@@@$7$4@$6@@|@|@|@|@|@|@|@@|@@%124%78%348%476$0@%243%376@%246%377@%378@@@%132%182%504$1@%159%152%507$0@%184%190%367%402%177%403%187%191%243%326$6@$2@@%246%327$4@$1@@%328$3@$0@@@||@|@@$7$4@@||@||@||@@||@@"])
  fun op intercalate'_tupled_primitive_def x = x
    val op intercalate'_tupled_primitive_def =
    DT(((("missing_pervasives",41),[]),[]),
       [read"%267%463@%426%300%16%257%412$0@@%218%42%192%116%218%177%192%159%218%135%192%183%218%150%192%156%218%157%296%257%280$6@%326$5@$4@@@%257%280$4@%326$3@$2@@@%280$2@%326$1@$0@@@@@$9%232$7@%240%326$1@$0@@%326$7@%326$3@%326$7@%326$5@$8@@@@@@@%232$7@%240$6@$8@@@@|@|@|@|@|@|@|@|@|@@|@@%67%28%505$0@%116%140%513$0@%177%42%343%469$1@%393$0@@%159%135%469$0@%312%393$2@@%326$1@%376@@@%183%150%469$0@%312%393$4@@%326$3@%326$7@%326$1@%376@@@@@%156%157$11%232$9@%240%326$1@$0@@%326$9@%326$3@%326$9@%326$5@$6@@@@@@@||@||@||@@||@||@||@@"])
  fun op intercalate'_curried_def x = x
    val op intercalate'_curried_def =
    DT(((("missing_pervasives",42),[]),[]),
       [read"%192%159%218%167%218%172%280%462$2@$1@$0@@%463%232$2@%240$1@$0@@@@|@|@|@"])
  fun op intercalate_def x = x
    val op intercalate_def =
    DT(((("missing_pervasives",45),[]),[]),
       [read"%192%116%218%177%280%460$1@$0@@%462$1@$0@%376@@|@|@"])
  fun op unlines_def x = x
    val op unlines_def =
    DT(((("missing_pervasives",46),[]),[]),
       [read"%222%179%282%551$0@@%339%313@%379@%461%329%317%384%316%316%315%439@@@@@@%379@@$0@@@|@"])
  fun op bracket_def x = x
    val op bracket_def =
    DT(((("missing_pervasives",47),[]),[]),
       [read"%222%179%282%441$0@@%313%329%317%384%316%315%315%316%315%439@@@@@@@@%379@@%313%339%313@%379@%461%329%317%384%316%315%315%315%315%439@@@@@@@@%379@@$0@@@%329%317%384%315%316%315%316%315%439@@@@@@@@%379@@@@|@"])
  fun op length_def x = x
    val op length_def =
    DT(((("missing_pervasives",48),[]),[]),
       [read"%218%177%286%467$0@@%340%185%159%521%249$1@$0@@%185%133%230%384%315%439@@@$1@||@||@%258@$0@@|@"])
  fun op take_tupled_primitive_def x = x
    val op take_tupled_primitive_def =
    DT(((("missing_pervasives",49),[]),[]),
       [read"%274%550@%433%307%23%257%419$0@@%226%93%218%177%192%159%218%180%296%257%280$2@%326$1@$0@@@%556%286$3@%258@@@@$4%250%256$3@%384%315%439@@@@$0@@%250$3@$2@@@|@|@|@|@@|@@%123%35%522$0@%93%177%343%469$0@%376@%159%177%319%286$3@%258@@%376@%326$1@$5%250%256$3@%384%315%439@@@@$0@@@@||@@||@||@@"])
  fun op take_curried_def x = x
    val op take_curried_def =
    DT(((("missing_pervasives",50),[]),[]),
       [read"%226%165%218%167%280%548$1@$0@@%550%250$1@$0@@@|@|@"])
  fun op string_prefix_def x = x
    val op string_prefix_def =
    DT(((("missing_pervasives",53),[]),[]),
       [read"%226%93%220%115%288%547$1@$0@@%357%53%323%297$2@%468$0@@@%382@%396%350%549$2@$0@@@@|@%336$0@@@|@|@"])
  fun op string_index_of'_tupled_primitive_def x = x
    val op string_index_of'_tupled_primitive_def =
    DT(((("missing_pervasives",54),[]),[]),
       [read"%268%546@%427%301%17%257%413$0@@%226%65%192%55%218%119%192%114%218%120%296%257%280$2@%326$1@$0@@@%556%261$1@$3@@@@$5%233$3@%242$0@%230%384%315%439@@@$4@@@@%233$3@%242$2@$4@@@@|@|@|@|@|@@|@@%122%29%506$0@%55%142%515$0@%119%65%347%471$1@%383@%114%119%324%261$1@$5@@%397$2@@$7%233$5@%242$0@%230%384%315%439@@@$2@@@@@||@@||@||@||@@"])
  fun op string_index_of'_curried_def x = x
    val op string_index_of'_curried_def =
    DT(((("missing_pervasives",55),[]),[]),
       [read"%192%159%218%167%226%174%289%544$2@$1@$0@@%546%233$2@%242$1@$0@@@@|@|@|@"])
  fun op string_index_of_def x = x
    val op string_index_of_def =
    DT(((("missing_pervasives",58),[]),[]),
       [read"%198%56%220%115%289%543$1@$0@@%545$1@%336$0@@%258@@|@|@"])
  fun op index_tupled_primitive_def x = x
    val op index_tupled_primitive_def =
    DT(((("missing_pervasives",59),[]),[]),
       [read"%275%458@%434%307%23%257%419$0@@%226%93%218%177%192%159%218%180%296%257%280$2@%326$1@$0@@@%556%286$3@%258@@@@$4%250%256$3@%384%315%439@@@@$0@@%250$3@$2@@@|@|@|@|@@|@@%66%35%523$0@%93%177%346%470$0@%381@%159%177%322%286$3@%258@@%395$1@@$5%250%256$3@%384%315%439@@@@$0@@@||@@||@||@@"])
  fun op index_curried_def x = x
    val op index_curried_def =
    DT(((("missing_pervasives",60),[]),[]),
       [read"%226%165%218%167%287%457$1@$0@@%458%250$1@$0@@@|@|@"])
  fun op find_index_helper_tupled_primitive_def x = x
    val op find_index_helper_tupled_primitive_def =
    DT(((("missing_pervasives",63),[]),[]),
       [read"%277%450@%436%309%25%257%421$0@@%226%52%199%102%218%177%192%183%218%186%296%257%280$2@%326$1@$0@@@%556$3$1@@@@$5%253%230$4@%384%315%439@@@@%235$3@$0@@@%253$4@%235$3@$2@@@@|@|@|@|@|@@|@@%61%37%526$0@%52%139%508$0@%102%177%347%471$0@%383@%183%186%324$3$1@@%397$5@@$7%253%230$5@%384%315%439@@@@%235$3@$0@@@@||@@||@||@||@@"])
  fun op find_index_helper_curried_def x = x
    val op find_index_helper_curried_def =
    DT(((("missing_pervasives",64),[]),[]),
       [read"%226%165%199%166%218%172%289%449$2@$1@$0@@%450%253$2@%235$1@$0@@@@|@|@|@"])
  fun op find_index0_def x = x
    val op find_index0_def =
    DT(((("missing_pervasives",67),[]),[]),
       [read"%199%102%218%177%289%448$1@$0@@%449%258@$1@$0@@|@|@"])
  fun op replicate_revacc_tupled_primitive_def x = x
    val op replicate_revacc_tupled_primitive_def =
    DT(((("missing_pervasives",68),[]),[]),
       [read"%273%536@%432%306%22%257%418$0@@%218%107%192%55%226%86%226%138%296%286$1@%398$0@@@$4%245%326$2@$3@@%249%256%398$0@@%384%315%439@@@@$2@@@%245$3@%249$1@$2@@@@|@|@|@|@@|@@%105%34%517$0@%107%144%520$0@%86%55%343%498$1@%393$3@@%138$6%245%326$1@$4@@%249%256%398$0@@%384%315%439@@@@$1@@@|@@||@||@||@@"])
  fun op replicate_revacc_curried_def x = x
    val op replicate_revacc_curried_def =
    DT(((("missing_pervasives",69),[]),[]),
       [read"%218%164%226%170%192%171%280%535$2@$1@$0@@%536%245$2@%249$1@$0@@@@|@|@|@"])
  fun op replicate_def x = x
    val op replicate_def =
    DT(((("missing_pervasives",72),[]),[]),
       [read"%226%86%192%55%280%533$1@$0@@%535%376@$1@$0@@|@|@"])
  fun op list_append_def x = x
    val op list_append_def =
    DT(((("missing_pervasives",73),[]),[]),
       [read"%218%79%218%80%280%477$1@$0@@%391%393$1@@$0@@|@|@"])
  fun op list_concat_def x = x
    val op list_concat_def =
    DT(((("missing_pervasives",74),[]),[]),
       [read"%221%91%280%479$0@@%338%477@%376@$0@@|@"])
  fun op list_concat_map_def x = x
    val op list_concat_map_def =
    DT(((("missing_pervasives",75),[]),[]),
       [read"%203%57%219%77%280%480$1@$0@@%479%374$1@$0@@@|@|@"])
  fun op list_reverse_concat_map_helper_tupled_primitive_def x = x
    val op list_reverse_concat_map_helper_tupled_primitive_def =
    DT(((("missing_pervasives",76),[]),[]),
       [read"%271%483@%430%304%20%257%416$0@@%218%40%203%57%219%90%208%81%193%69%219%70%218%95%296%257%264$3@%76%63%326$0@$1@||@@%257%281$4@%327$2@$1@@@%280$0@$5$2@@@@@$7%238$5@%241%337$3@$6@$5$2@@@$1@@@%238$5@%241$6@$4@@@@|@|@|@|@|@|@|@@|@@%88%32%511$0@%57%141%514$0@%40%90%343%355%81%473$1@$2@%69%70%356%95$9%238$7@%241%337$3@$5@$7$2@@@$1@@@|@$6$1@@||@|@%76%63%326$0@$1@||@@||@||@||@@"])
  fun op list_reverse_concat_map_helper_curried_def x = x
    val op list_reverse_concat_map_helper_curried_def =
    DT(((("missing_pervasives",77),[]),[]),
       [read"%203%162%218%167%219%173%280%482$2@$1@$0@@%483%238$2@%241$1@$0@@@@|@|@|@"])
  fun op list_reverse_concat_map_def x = x
    val op list_reverse_concat_map_def =
    DT(((("missing_pervasives",80),[]),[]),
       [read"%203%57%219%90%280%481$1@$0@@%482$1@%376@$0@@|@|@"])
  fun op list_take_with_accum_tupled_primitive_def x = x
    val op list_take_with_accum_tupled_primitive_def =
    DT(((("missing_pervasives",81),[]),[]),
       [read"%278%485@%437%310%26%257%422$0@@%218%108%218%76%226%99%226%138%192%159%218%177%296%257%286$3@%398$2@@@%280$4@%326$1@$0@@@@$6%254%256$3@%384%315%439@@@@%240%326$1@$5@@$0@@@%254$3@%240$5@$4@@@@|@|@|@|@|@|@@|@@%89%38%527$0@%99%140%513$0@%108%76%343%498$3@%393$1@@%138%469$1@%445%329%317%384%316%315%316%316%315%316%439@@@@@@@@@%329%317%384%315%316%315%316%315%316%439@@@@@@@@@%329%317%384%315%315%316%315%316%316%439@@@@@@@@@%329%317%384%316%315%316%315%316%316%439@@@@@@@@@%329%317%384%315%315%315%315%315%316%439@@@@@@@@@%329%317%384%316%315%316%315%316%316%439@@@@@@@@@%329%317%384%315%316%315%315%315%316%439@@@@@@@@@%329%317%384%315%315%316%316%315%316%439@@@@@@@@@%329%317%384%315%316%316%315%315%316%439@@@@@@@@@%329%317%384%315%315%315%315%315%316%439@@@@@@@@@%329%317%384%315%315%315%316%316%316%439@@@@@@@@@%329%317%384%315%316%315%316%315%316%439@@@@@@@@@%329%317%384%316%315%316%315%316%316%439@@@@@@@@@%329%317%384%316%315%315%316%315%316%439@@@@@@@@@%329%317%384%315%315%315%315%315%316%439@@@@@@@@@%329%317%384%315%316%315%315%315%316%439@@@@@@@@@%329%317%384%315%315%316%315%315%316%439@@@@@@@@@%329%317%384%315%315%316%315%315%316%439@@@@@@@@@%329%317%384%315%316%316%315%316%316%439@@@@@@@@@%329%317%384%315%316%316%316%315%316%439@@@@@@@@@%329%317%384%316%316%315%316%316%439@@@@@@@@%329%317%384%316%315%315%315%315%439@@@@@@@@%329%317%384%316%316%316%316%315%316%439@@@@@@@@@%329%317%384%315%315%315%315%316%316%439@@@@@@@@@%329%317%384%316%315%316%315%316%316%439@@@@@@@@@%329%317%384%316%315%315%315%315%439@@@@@@@@%329%317%384%315%316%316%315%315%316%439@@@@@@@@@%329%317%384%316%316%316%316%315%316%439@@@@@@@@@%329%317%384%315%315%315%315%316%316%439@@@@@@@@@%329%317%384%315%316%316%315%316%316%439@@@@@@@@@%329%317%384%315%315%315%316%315%316%439@@@@@@@@@%329%317%384%316%315%315%316%315%316%439@@@@@@@@@%329%317%384%316%315%315%315%315%439@@@@@@@@%329%317%384%315%316%316%315%315%316%439@@@@@@@@@%329%317%384%316%315%316%316%315%316%439@@@@@@@@@%329%317%384%315%316%316%315%315%316%439@@@@@@@@@%329%317%384%315%316%316%316%315%316%439@@@@@@@@@%329%317%384%315%316%316%315%315%316%439@@@@@@@@@%329%317%384%316%316%316%316%315%316%439@@@@@@@@@%329%317%384%316%315%316%315%316%316%439@@@@@@@@@%329%317%384%315%315%316%315%316%316%439@@@@@@@@@%379@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%159%177$8%254%256$6@%384%315%439@@@@%240%326$1@$4@@$0@@@||@|@@||@||@||@@"])
  fun op list_take_with_accum_curried_def x = x
    val op list_take_with_accum_curried_def =
    DT(((("missing_pervasives",82),[]),[]),
       [read"%226%165%218%167%218%172%280%484$2@$1@$0@@%485%254$2@%240$1@$0@@@@|@|@|@"])
  fun op unsafe_string_take_def x = x
    val op unsafe_string_take_def =
    DT(((("missing_pervasives",85),[]),[]),
       [read"%226%93%220%121%282%552$1@$0@@%363%93%350%400$0@%336$1@@@|@%456$1@@@|@|@"])
  fun op padding_and_maybe_newline_def x = x
    val op padding_and_maybe_newline_def =
    DT(((("missing_pervasives",86),[]),[]),
       [read"%198%49%226%158%220%121%282%502$2@$1@$0@@%363%103%313%320%260$0@%384%315%439@@@@%329%317%384%316%316%315%439@@@@@@%379@@%379@@%350%534%321%260$0@%384%315%439@@@@$2@$0@@$3@@@|@%256$1@%354$0@@@@|@|@|@"])
  fun op space_padding_and_maybe_newline_def x = x
    val op space_padding_and_maybe_newline_def =
    DT(((("missing_pervasives",87),[]),[]),
       [read"%226%158%220%121%282%542$1@$0@@%502%317%384%316%315%315%315%315%439@@@@@@@@$1@$0@@|@|@"])
  fun op padded_and_maybe_newline_def x = x
    val op padded_and_maybe_newline_def =
    DT(((("missing_pervasives",88),[]),[]),
       [read"%198%49%226%158%220%121%282%501$2@$1@$0@@%313$0@%502$2@$1@$0@@@|@|@|@"])
  fun op padding_to_def x = x
    val op padding_to_def =
    DT(((("missing_pervasives",89),[]),[]),
       [read"%198%49%226%158%220%121%282%503$2@$1@$0@@%363%103%320%260$0@%258@@%379@%350%534$0@$3@@@|@%256$1@%354$0@@@@|@|@|@"])
  fun op left_padded_to_def x = x
    val op left_padded_to_def =
    DT(((("missing_pervasives",90),[]),[]),
       [read"%198%49%226%158%220%121%282%464$2@$1@$0@@%313%503$2@$1@$0@@$0@@|@|@|@"])
  fun op right_padded_to_def x = x
    val op right_padded_to_def =
    DT(((("missing_pervasives",91),[]),[]),
       [read"%198%49%226%158%220%121%282%537$2@$1@$0@@%313$0@%503$2@$1@$0@@@|@|@|@"])
  fun op space_padded_and_maybe_newline_def x = x
    val op space_padded_and_maybe_newline_def =
    DT(((("missing_pervasives",92),[]),[]),
       [read"%226%158%220%121%282%541$1@$0@@%313$0@%502%317%384%316%315%315%315%315%439@@@@@@@@$1@$0@@@|@|@"])
  fun op left_space_padded_to_def x = x
    val op left_space_padded_to_def =
    DT(((("missing_pervasives",93),[]),[]),
       [read"%226%158%220%121%282%465$1@$0@@%313%503%317%384%316%315%315%315%315%439@@@@@@@@$1@$0@@$0@@|@|@"])
  fun op right_space_padded_to_def x = x
    val op right_space_padded_to_def =
    DT(((("missing_pervasives",94),[]),[]),
       [read"%226%158%220%121%282%538$1@$0@@%313$0@%503%317%384%316%315%315%315%315%439@@@@@@@@$1@$0@@@|@|@"])
  fun op left_zero_padded_to_def x = x
    val op left_zero_padded_to_def =
    DT(((("missing_pervasives",95),[]),[]),
       [read"%226%158%220%121%282%466$1@$0@@%313%503%317%384%316%315%315%315%316%439@@@@@@@@$1@$0@@$0@@|@|@"])
  fun op natural_of_decimal_string_helper_ind x = x
    val op natural_of_decimal_string_helper_ind =
    DT(((("missing_pervasives",9),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%216%12%296%226%41%220%50%296%198%49%220%53%226%54%296%257%282$3@%329$2@$1@@@%289%493$2@@%397$0@@@@$5%230%229%384%316%316%315%439@@@@@$4@@$0@@$1@@|@|@|@@$2$1@$0@@|@|@@%226%131%220%136$2$1@$0@|@|@@|@",
        read"%226%41%220%50%198%49%220%53%226%54%296%257%282$3@%329$2@$1@@@%289%493$2@@%397$0@@@@%24%252%230%229%384%316%316%315%439@@@@@$4@@$0@@$1@@%252$4@$3@@@|@|@|@|@|@",
        read"%420%24@"])
  fun op natural_of_decimal_string_helper_def x = x
    val op natural_of_decimal_string_helper_def =
    DT(((("missing_pervasives",10),
        [("bool",[15,58]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[7,8]),("option",[64]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%220%50%226%41%286%495$0@$1@@%474$1@$0@%49%53%500%493$1@@$2@%54%495%230%229%384%316%316%315%439@@@@@$3@@$0@@$1@|@||@@|@|@",
        read"%226%41%220%50%198%49%220%53%226%54%296%257%282$3@%329$2@$1@@@%289%493$2@@%397$0@@@@%24%252%230%229%384%316%316%315%439@@@@@$4@@$0@@$1@@%252$4@$3@@@|@|@|@|@|@",
        read"%420%24@"])
  fun op hex_string_of_natural_ind x = x
    val op hex_string_of_natural_ind =
    DT(((("missing_pervasives",13),
        [("bool",[25,27,53,54,63]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%211%8%296%226%99%296%296%556%259$0@%384%316%315%315%315%439@@@@@@@@$1%333$0@%384%316%315%315%315%439@@@@@@@@@$1$0@@|@@%226%131$1$0@|@@|@",
        read"%226%99%296%556%259$0@%384%316%315%315%315%439@@@@@@@@%15%333$0@%384%316%315%315%315%439@@@@@@@$0@@|@",
        read"%411%15@"])
  fun op hex_string_of_natural_def x = x
    val op hex_string_of_natural_def =
    DT(((("missing_pervasives",14),
        [("bool",[15,129]),("combin",[19]),("missing_pervasives",[12]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%226%99%282%454$0@@%320%259$0@%384%316%315%315%315%439@@@@@@@%350%329%452$0@@%379@@@%313%454%333$0@%384%316%315%315%315%439@@@@@@@@%350%329%452%375$0@%384%316%315%315%315%439@@@@@@@@%379@@@@@|@",
        read"%226%99%296%556%259$0@%384%316%315%315%315%439@@@@@@@@%15%333$0@%384%316%315%315%315%439@@@@@@@$0@@|@",
        read"%411%15@"])
  fun op merge_by_ind x = x
    val op merge_by_ind =
    DT(((("missing_pervasives",19),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%205%3%296%200%51%218%177%218%186%296%257%218%129%218%188%192%159%218%180%192%183%218%189%296%257%293%240$7@$6@@%240$5@$4@@@%257%280$5@%326$3@$2@@@%257%280$4@%326$1@$0@@@%556%290$8$3@$1@@%373@@@@@@$9$8@%326$3@$2@@$0@@|@|@|@|@|@|@@%218%129%218%188%192%159%218%180%192%183%218%189%296%257%293%240$7@$6@@%240$5@$4@@@%257%280$5@%326$3@$2@@@%257%280$4@%326$1@$0@@@%290$8$3@$1@@%373@@@@@$9$8@$2@%326$1@$0@@@|@|@|@|@|@|@@@$3$2@$1@$0@@|@|@|@@%200%126%218%135%218%147$3$2@$1@$0@|@|@|@@|@",
        read"%200%51%218%186%218%177%218%129%218%188%192%159%218%180%192%183%218%189%296%257%293%240$6@$7@@%240$5@$4@@@%257%280$5@%326$3@$2@@@%257%280$4@%326$1@$0@@@%556%290$8$3@$1@@%373@@@@@@%19%237$8@%240%326$3@$2@@$0@@@%237$8@%240$6@$7@@@@|@|@|@|@|@|@|@|@|@",
        read"%200%51%218%186%218%177%218%129%218%188%192%159%218%180%192%183%218%189%296%257%293%240$6@$7@@%240$5@$4@@@%257%280$5@%326$3@$2@@@%257%280$4@%326$1@$0@@@%290$8$3@$1@@%373@@@@@%19%237$8@%240$2@%326$1@$0@@@@%237$8@%240$6@$7@@@@|@|@|@|@|@|@|@|@|@",
        read"%415%19@"])
  fun op merge_by_def x = x
    val op merge_by_def =
    DT(((("missing_pervasives",20),
        [("bool",[15,58,129]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[17,18]),("pair",[49,51]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%218%186%218%177%200%51%280%489$0@$1@$2@@%513%240$1@$2@@%129%188%469$1@$0@%159%180%469$2@%326$1@$0@@%183%189%319%290$6$3@$1@@%373@@%326$3@%489$6@$2@%326$1@$0@@@@%326$1@%489$6@%326$3@$2@@$0@@@||@||@||@@|@|@|@",
        read"%200%51%218%186%218%177%218%129%218%188%192%159%218%180%192%183%218%189%296%257%293%240$6@$7@@%240$5@$4@@@%257%280$5@%326$3@$2@@@%257%280$4@%326$1@$0@@@%556%290$8$3@$1@@%373@@@@@@%19%237$8@%240%326$3@$2@@$0@@@%237$8@%240$6@$7@@@@|@|@|@|@|@|@|@|@|@",
        read"%200%51%218%186%218%177%218%129%218%188%192%159%218%180%192%183%218%189%296%257%293%240$6@$7@@%240$5@$4@@@%257%280$5@%326$3@$2@@@%257%280$4@%326$1@$0@@@%290$8$3@$1@@%373@@@@@%19%237$8@%240$2@%326$1@$0@@@@%237$8@%240$6@$7@@@@|@|@|@|@|@|@|@|@|@",
        read"%415%19@"])
  fun op sort_by_ind x = x
    val op sort_by_ind =
    DT(((("missing_pervasives",23),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%204%2%296%200%51%218%177%296%257%192%159%218%150%192%156%218%157%218%92%218%113%296%257%280$6@%326$5@$4@@@%257%280$4@%326$3@$2@@@%257%280$1@%399%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@%280$0@%334%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@@@@$8$7@$0@@|@|@|@|@|@|@@%192%159%218%150%192%156%218%157%218%92%218%113%296%257%280$6@%326$5@$4@@@%257%280$4@%326$3@$2@@@%257%280$1@%399%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@%280$0@%334%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@@@@$8$7@$1@@|@|@|@|@|@|@@@$2$1@$0@@|@|@@%200%126%218%135$2$1@$0@|@|@@|@",
        read"%200%51%218%177%192%159%218%150%192%156%218%157%218%92%218%113%296%257%280$6@%326$5@$4@@@%257%280$4@%326$3@$2@@@%257%280$1@%399%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@%280$0@%334%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@@@@%18%236$7@$0@@%236$7@$6@@@|@|@|@|@|@|@|@|@",
        read"%200%51%218%177%192%159%218%150%192%156%218%157%218%92%218%113%296%257%280$6@%326$5@$4@@@%257%280$4@%326$3@$2@@@%257%280$1@%399%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@%280$0@%334%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@@@@%18%236$7@$1@@%236$7@$6@@@|@|@|@|@|@|@|@|@",
        read"%414%18@"])
  fun op sort_by_def x = x
    val op sort_by_def =
    DT(((("missing_pervasives",24),
        [("bool",[15,58,123]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[21,22]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%218%177%200%51%280%539$0@$1@@%469$1@%376@%159%150%469$0@%326$1@%376@@%156%157%356%92%356%113%489$6@%539$6@$1@@%539$6@$0@@|@%334%333%353%326$4@%326$2@$1@@@@%384%316%439@@@@%326$4@%326$2@$1@@@@|@%399%333%353%326$3@%326$1@$0@@@@%384%316%439@@@@%326$3@%326$1@$0@@@@||@||@@|@|@",
        read"%200%51%218%177%192%159%218%150%192%156%218%157%218%92%218%113%296%257%280$6@%326$5@$4@@@%257%280$4@%326$3@$2@@@%257%280$1@%399%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@%280$0@%334%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@@@@%18%236$7@$0@@%236$7@$6@@@|@|@|@|@|@|@|@|@",
        read"%200%51%218%177%192%159%218%150%192%156%218%157%218%92%218%113%296%257%280$6@%326$5@$4@@@%257%280$4@%326$3@$2@@@%257%280$1@%399%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@%280$0@%334%333%353%326$5@%326$3@$2@@@@%384%316%439@@@@%326$5@%326$3@$2@@@@@@@@%18%236$7@$1@@%236$7@$6@@@|@|@|@|@|@|@|@|@",
        read"%414%18@"])
  fun op mapMaybei'_ind x = x
    val op mapMaybei'_ind =
    DT(((("missing_pervasives",27),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%207%5%296%212%58%226%65%219%178%296%257%193%160%219%181%192%55%296%257%281$3@%327$2@$1@@@%287$5$4@$2@@%395$0@@@@$6$5@%230%384%315%439@@@$4@@$1@@|@|@|@@%193%160%219%181%296%257%281$2@%327$1@$0@@@%287$4$3@$1@@%381@@@$5$4@%230%384%315%439@@@$3@@$0@@|@|@@@$3$2@$1@$0@@|@|@|@@%212%128%226%138%219%148$3$2@$1@$0@|@|@|@@|@",
        read"%226%65%212%58%219%178%193%160%219%181%192%55%296%257%281$3@%327$2@$1@@@%287$4$5@$2@@%395$0@@@@%21%239$4@%251%230%384%315%439@@@$5@@$1@@@%239$4@%251$5@$3@@@@|@|@|@|@|@|@",
        read"%226%65%212%58%219%178%193%160%219%181%296%257%281$2@%327$1@$0@@@%287$3$4@$1@@%381@@@%21%239$3@%251%230%384%315%439@@@$4@@$0@@@%239$3@%251$4@$2@@@@|@|@|@|@|@",
        read"%417%21@"])
  fun op mapMaybei'_def x = x
    val op mapMaybei'_def =
    DT(((("missing_pervasives",28),
        [("bool",[15,58]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[25,26]),("option",[64]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%219%178%226%65%212%58%280%487$0@$1@$2@@%473$2@%376@%160%181%499$2$3@$1@@%487$2@%230%384%315%439@@@$3@@$0@@%55%326$0@%487$3@%230%384%315%439@@@$4@@$1@@|@||@@|@|@|@",
        read"%226%65%212%58%219%178%193%160%219%181%192%55%296%257%281$3@%327$2@$1@@@%287$4$5@$2@@%395$0@@@@%21%239$4@%251%230%384%315%439@@@$5@@$1@@@%239$4@%251$5@$3@@@@|@|@|@|@|@|@",
        read"%226%65%212%58%219%178%193%160%219%181%296%257%281$2@%327$1@$0@@@%287$3$4@$1@@%381@@@%21%239$3@%251%230%384%315%439@@@$4@@$0@@@%239$3@%251$4@$2@@@@|@|@|@|@|@",
        read"%417%21@"])
  fun op partitionii'_ind x = x
    val op partitionii'_ind =
    DT(((("missing_pervasives",32),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%217%13%296%226%101%223%118%218%177%225%109%225%110%296%226%64%223%97%226%87%218%82%218%111%223%84%225%85%192%159%218%98%296%257%283$12@%330$8@$7@@@%257%286$6@%256$8@$13@@@%257%293%240$5@$4@@%240%399$6@$11@@%334$6@$11@@@@%257%283$3@%341%71%230$0@$14@|@%353$5@@@@%257%285$2@%478$3@$5@@@%280$4@%326$1@$0@@@@@@@@$14%230$8@%384%315%439@@@@$7@$0@%332%249$8@$1@@$10@@%392$2@$9@@@|@|@|@|@|@|@|@|@|@@$5$4@$3@$2@$1@$0@@|@|@|@|@|@@%226%131%223%137%218%147%225%151%225%154$5$4@$3@$2@$1@$0@|@|@|@|@|@@|@",
        read"%225%110%225%109%218%177%226%101%223%118%226%64%223%97%226%87%218%82%218%111%223%84%225%85%192%159%218%98%296%257%283$9@%330$8@$7@@@%257%286$6@%256$8@$10@@@%257%293%240$5@$4@@%240%399$6@$11@@%334$6@$11@@@@%257%283$3@%341%71%230$0@$11@|@%353$5@@@@%257%285$2@%478$3@$5@@@%280$4@%326$1@$0@@@@@@@@%27%255%230$8@%384%315%439@@@@%247$7@%244$0@%248%332%249$8@$1@@$12@@%392$2@$13@@@@@@%255$10@%247$9@%244$11@%248$12@$13@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%423%27@"])
  fun op partitionii'_def x = x
    val op partitionii'_def =
    DT(((("missing_pervasives",33),
        [("bool",[15,58,123]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[30,31]),("pair",[7,16,49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%218%177%223%118%225%110%225%109%226%101%295%531$0@$3@$4@$1@$2@@%475$3@%248%394$1@@%394$2@@@%64%97%364%87%366%401%82%111%361%84%362%85%472$2@%248%394$8@@%392$9@$0@@@%159%98%531%230$8@%384%315%439@@@@$7@$0@%332%249$8@$1@@$10@@%392$2@$11@@||@|@%478$0@$2@@|@%341%71%230$0@$6@|@%353$1@@@||@@%240%399$0@$7@@%334$0@$7@@@|@%256$1@$2@@||@@|@|@|@|@|@",
        read"%225%110%225%109%218%177%226%101%223%118%226%64%223%97%226%87%218%82%218%111%223%84%225%85%192%159%218%98%296%257%283$9@%330$8@$7@@@%257%286$6@%256$8@$10@@@%257%293%240$5@$4@@%240%399$6@$11@@%334$6@$11@@@@%257%283$3@%341%71%230$0@$11@|@%353$5@@@@%257%285$2@%478$3@$5@@@%280$4@%326$1@$0@@@@@@@@%27%255%230$8@%384%315%439@@@@%247$7@%244$0@%248%332%249$8@$1@@$12@@%392$2@$13@@@@@@%255$10@%247$9@%244$11@%248$12@$13@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%423%27@"])
  fun op unzip3_ind x = x
    val op unzip3_ind =
    DT(((("missing_pervasives",39),
        [("arithmetic",[22,24,25,41,46,59,73,95,174,181]),
         ("bool",
         [25,26,27,36,52,53,54,58,63,93,96,101,104,105,107,124,145]),
         ("list",[7]),("numeral",[3,7,8]),("pair",[4,16,25]),
         ("prim_rec",[42]),("relation",[101,113,115]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%210%7%296%224%78%296%227%132%224%182%192%159%228%152%193%184%194%190%296%257%284$6@%331$5@$4@@@%257%291$5@%231$3@$2@@@%292$2@%234$1@$0@@@@@$7$4@@|@|@|@|@|@|@@$1$0@@|@@%224%130$1$0@|@@|@"])
  fun op unzip3_def x = x
    val op unzip3_def =
    DT(((("missing_pervasives",40),
        [("arithmetic",[22,24,25,41,46,59,73,95,174,181]),
         ("bool",
         [15,25,26,36,52,53,54,58,63,93,96,101,104,105,107,123,124,145]),
         ("combin",[19]),("list",[7,11]),("missing_pervasives",[38]),
         ("numeral",[3,7,8]),("pair",[4,7,16,25,51]),("prim_rec",[42]),
         ("relation",[113,115,121,126]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%224%78%294%553$0@@%476$0@%243%376@%246%377@%378@@@%132%182%504$1@%159%152%507$0@%184%190%367%402%177%403%187%191%243%326$6@$2@@%246%327$4@$1@@%328$3@$0@@@||@|@@%553$4@@||@||@||@@|@"])
  fun op intercalate'_ind x = x
    val op intercalate'_ind =
    DT(((("missing_pervasives",43),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%201%0%296%192%116%218%177%218%42%296%192%159%218%135%192%183%218%150%192%156%218%157%296%257%280$7@%326$5@$4@@@%257%280$4@%326$3@$2@@@%280$2@%326$1@$0@@@@@$9$8@%326$1@$0@@%326$8@%326$3@%326$8@%326$5@$6@@@@@@|@|@|@|@|@|@@$3$2@$1@$0@@|@|@|@@%192%125%218%135%218%147$3$2@$1@$0@|@|@|@@|@",
        read"%218%42%192%116%218%177%192%159%218%135%192%183%218%150%192%156%218%157%296%257%280$6@%326$5@$4@@@%257%280$4@%326$3@$2@@@%280$2@%326$1@$0@@@@@%16%232$7@%240%326$1@$0@@%326$7@%326$3@%326$7@%326$5@$8@@@@@@@%232$7@%240$6@$8@@@@|@|@|@|@|@|@|@|@|@",
        read"%412%16@"])
  fun op intercalate'_def x = x
    val op intercalate'_def =
    DT(((("missing_pervasives",44),
        [("bool",[15,58]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[41,42]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%218%177%192%116%218%42%280%462$1@$2@$0@@%469$2@%393$0@@%159%135%469$0@%312%393$2@@%326$1@%376@@@%183%150%469$0@%312%393$4@@%326$3@%326$5@%326$1@%376@@@@@%156%157%462$7@%326$1@$0@@%326$7@%326$3@%326$7@%326$5@$6@@@@@||@||@||@@|@|@|@",
        read"%218%42%192%116%218%177%192%159%218%135%192%183%218%150%192%156%218%157%296%257%280$6@%326$5@$4@@@%257%280$4@%326$3@$2@@@%280$2@%326$1@$0@@@@@%16%232$7@%240%326$1@$0@@%326$7@%326$3@%326$7@%326$5@$8@@@@@@@%232$7@%240$6@$8@@@@|@|@|@|@|@|@|@|@|@",
        read"%412%16@"])
  fun op take_ind x = x
    val op take_ind =
    DT(((("missing_pervasives",51),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%214%10%296%226%93%218%177%296%192%159%218%180%296%257%280$2@%326$1@$0@@@%556%286$3@%258@@@@$4%256$3@%384%315%439@@@@$0@@|@|@@$2$1@$0@@|@|@@%226%131%218%135$2$1@$0@|@|@@|@",
        read"%226%93%218%177%192%159%218%180%296%257%280$2@%326$1@$0@@@%556%286$3@%258@@@@%23%250%256$3@%384%315%439@@@@$0@@%250$3@$2@@@|@|@|@|@",
        read"%419%23@"])
  fun op take_def x = x
    val op take_def =
    DT(((("missing_pervasives",52),
        [("bool",[15,58,129]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[49,50]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%218%177%226%93%280%548$0@$1@@%469$1@%376@%159%180%319%286$2@%258@@%376@%326$1@%548%256$2@%384%315%439@@@@$0@@@||@@|@|@",
        read"%226%93%218%177%192%159%218%180%296%257%280$2@%326$1@$0@@@%556%286$3@%258@@@@%23%250%256$3@%384%315%439@@@@$0@@%250$3@$2@@@|@|@|@|@",
        read"%419%23@"])
  fun op string_index_of'_ind x = x
    val op string_index_of'_ind =
    DT(((("missing_pervasives",56),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%202%1%296%192%55%218%119%226%65%296%192%114%218%120%296%257%280$3@%326$1@$0@@@%556%261$1@$4@@@@$5$4@$0@%230%384%315%439@@@$2@@@|@|@@$3$2@$1@$0@@|@|@|@@%192%125%218%135%226%149$3$2@$1@$0@|@|@|@@|@",
        read"%226%65%192%55%218%119%192%114%218%120%296%257%280$2@%326$1@$0@@@%556%261$1@$3@@@@%17%233$3@%242$0@%230%384%315%439@@@$4@@@@%233$3@%242$2@$4@@@@|@|@|@|@|@",
        read"%413%17@"])
  fun op string_index_of'_def x = x
    val op string_index_of'_def =
    DT(((("missing_pervasives",57),
        [("bool",[15,58,129]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[54,55]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%218%119%226%65%192%55%289%544$0@$2@$1@@%471$2@%383@%114%120%324%261$1@$2@@%397$3@@%544$2@$0@%230%384%315%439@@@$3@@@||@@|@|@|@",
        read"%226%65%192%55%218%119%192%114%218%120%296%257%280$2@%326$1@$0@@@%556%261$1@$3@@@@%17%233$3@%242$0@%230%384%315%439@@@$4@@@@%233$3@%242$2@$4@@@@|@|@|@|@|@",
        read"%413%17@"])
  fun op index_ind x = x
    val op index_ind =
    DT(((("missing_pervasives",61),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%214%10%296%226%93%218%177%296%192%159%218%180%296%257%280$2@%326$1@$0@@@%556%286$3@%258@@@@$4%256$3@%384%315%439@@@@$0@@|@|@@$2$1@$0@@|@|@@%226%131%218%135$2$1@$0@|@|@@|@",
        read"%226%93%218%177%192%159%218%180%296%257%280$2@%326$1@$0@@@%556%286$3@%258@@@@%23%250%256$3@%384%315%439@@@@$0@@%250$3@$2@@@|@|@|@|@",
        read"%419%23@"])
  fun op index_def x = x
    val op index_def =
    DT(((("missing_pervasives",62),
        [("bool",[15,58,129]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[59,60]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%218%177%226%93%287%457$0@$1@@%470$1@%381@%159%180%322%286$2@%258@@%395$1@@%457%256$2@%384%315%439@@@@$0@@||@@|@|@",
        read"%226%93%218%177%192%159%218%180%296%257%280$2@%326$1@$0@@@%556%286$3@%258@@@@%23%250%256$3@%384%315%439@@@@$0@@%250$3@$2@@@|@|@|@|@",
        read"%419%23@"])
  fun op find_index_helper_ind x = x
    val op find_index_helper_ind =
    DT(((("missing_pervasives",65),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%213%9%296%226%52%199%102%218%177%296%192%183%218%186%296%257%280$2@%326$1@$0@@@%556$3$1@@@@$5%230$4@%384%315%439@@@@$3@$0@@|@|@@$3$2@$1@$0@@|@|@|@@%226%131%199%134%218%147$3$2@$1@$0@|@|@|@@|@",
        read"%226%52%199%102%218%177%192%183%218%186%296%257%280$2@%326$1@$0@@@%556$3$1@@@@%25%253%230$4@%384%315%439@@@@%235$3@$0@@@%253$4@%235$3@$2@@@@|@|@|@|@|@",
        read"%421%25@"])
  fun op find_index_helper_def x = x
    val op find_index_helper_def =
    DT(((("missing_pervasives",66),
        [("bool",[15,58,129]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[63,64]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%218%177%199%102%226%52%289%449$0@$1@$2@@%471$2@%383@%183%186%324$3$1@@%397$2@@%449%230$2@%384%315%439@@@@$3@$0@@||@@|@|@|@",
        read"%226%52%199%102%218%177%192%183%218%186%296%257%280$2@%326$1@$0@@@%556$3$1@@@@%25%253%230$4@%384%315%439@@@@%235$3@$0@@@%253$4@%235$3@$2@@@@|@|@|@|@|@",
        read"%421%25@"])
  fun op replicate_revacc_ind x = x
    val op replicate_revacc_ind =
    DT(((("missing_pervasives",70),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%209%6%296%218%107%226%86%192%55%296%226%138%296%286$2@%398$0@@@$4%326$1@$3@@%256%398$0@@%384%315%439@@@@$1@@|@@$3$2@$1@$0@@|@|@|@@%218%129%226%138%192%146$3$2@$1@$0@|@|@|@@|@",
        read"%218%107%192%55%226%86%226%138%296%286$1@%398$0@@@%22%245%326$2@$3@@%249%256%398$0@@%384%315%439@@@@$2@@@%245$3@%249$1@$2@@@@|@|@|@|@",
        read"%418%22@"])
  fun op replicate_revacc_def x = x
    val op replicate_revacc_def =
    DT(((("missing_pervasives",71),
        [("arithmetic",[267]),("bool",[15,58]),("combin",[19]),
         ("missing_pervasives",[68,69]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%218%107%226%86%192%55%280%535$2@$1@$0@@%498$1@%393$2@@%138%535%326$1@$3@@%256%398$0@@%384%315%439@@@@$1@|@@|@|@|@",
        read"%218%107%192%55%226%86%226%138%296%286$1@%398$0@@@%22%245%326$2@$3@@%249%256%398$0@@%384%315%439@@@@$2@@@%245$3@%249$1@$2@@@@|@|@|@|@",
        read"%418%22@"])
  fun op list_reverse_concat_map_helper_ind x = x
    val op list_reverse_concat_map_helper_ind =
    DT(((("missing_pervasives",78),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%206%4%296%203%57%218%40%219%90%296%208%81%193%69%219%70%218%95%296%257%264$3@%76%63%326$0@$1@||@@%257%281$4@%327$2@$1@@@%280$0@$6$2@@@@@$7$6@%337$3@$5@$6$2@@@$1@@|@|@|@|@@$3$2@$1@$0@@|@|@|@@%203%127%218%135%219%148$3$2@$1@$0@|@|@|@@|@",
        read"%218%40%203%57%219%90%208%81%193%69%219%70%218%95%296%257%264$3@%76%63%326$0@$1@||@@%257%281$4@%327$2@$1@@@%280$0@$5$2@@@@@%20%238$5@%241%337$3@$6@$5$2@@@$1@@@%238$5@%241$6@$4@@@@|@|@|@|@|@|@|@",
        read"%416%20@"])
  fun op list_reverse_concat_map_helper_def x = x
    val op list_reverse_concat_map_helper_def =
    DT(((("missing_pervasives",79),
        [("bool",[15,58,123]),("combin",[19]),("list",[11]),
         ("missing_pervasives",[76,77]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%219%90%203%57%218%40%280%482$1@$0@$2@@%355%81%473$3@$1@%69%70%356%95%482$5@%337$3@$4@$5$2@@@$1@|@$4$1@@||@|@%76%63%326$0@$1@||@@|@|@|@",
        read"%218%40%203%57%219%90%208%81%193%69%219%70%218%95%296%257%264$3@%76%63%326$0@$1@||@@%257%281$4@%327$2@$1@@@%280$0@$5$2@@@@@%20%238$5@%241%337$3@$6@$5$2@@@$1@@@%238$5@%241$6@$4@@@@|@|@|@|@|@|@|@",
        read"%416%20@"])
  fun op list_take_with_accum_ind x = x
    val op list_take_with_accum_ind =
    DT(((("missing_pervasives",83),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%215%11%296%226%99%218%108%218%76%296%226%138%192%159%218%177%296%257%286$5@%398$2@@@%280$3@%326$1@$0@@@@$6%256$5@%384%315%439@@@@%326$1@$4@@$0@@|@|@|@@$3$2@$1@$0@@|@|@|@@%226%131%218%135%218%147$3$2@$1@$0@|@|@|@@|@",
        read"%218%108%218%76%226%99%226%138%192%159%218%177%296%257%286$3@%398$2@@@%280$4@%326$1@$0@@@@%26%254%256$3@%384%315%439@@@@%240%326$1@$5@@$0@@@%254$3@%240$5@$4@@@@|@|@|@|@|@|@",
        read"%422%26@"])
  fun op list_take_with_accum_def x = x
    val op list_take_with_accum_def =
    DT(((("missing_pervasives",84),
        [("arithmetic",[267]),("bool",[15,58]),("combin",[19]),
         ("list",[11]),("missing_pervasives",[81,82]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%218%108%226%99%218%76%280%484$1@$2@$0@@%498$1@%393$2@@%138%469$1@%445%329%317%384%316%315%316%316%315%316%439@@@@@@@@@%329%317%384%315%316%315%316%315%316%439@@@@@@@@@%329%317%384%315%315%316%315%316%316%439@@@@@@@@@%329%317%384%316%315%316%315%316%316%439@@@@@@@@@%329%317%384%315%315%315%315%315%316%439@@@@@@@@@%329%317%384%316%315%316%315%316%316%439@@@@@@@@@%329%317%384%315%316%315%315%315%316%439@@@@@@@@@%329%317%384%315%315%316%316%315%316%439@@@@@@@@@%329%317%384%315%316%316%315%315%316%439@@@@@@@@@%329%317%384%315%315%315%315%315%316%439@@@@@@@@@%329%317%384%315%315%315%316%316%316%439@@@@@@@@@%329%317%384%315%316%315%316%315%316%439@@@@@@@@@%329%317%384%316%315%316%315%316%316%439@@@@@@@@@%329%317%384%316%315%315%316%315%316%439@@@@@@@@@%329%317%384%315%315%315%315%315%316%439@@@@@@@@@%329%317%384%315%316%315%315%315%316%439@@@@@@@@@%329%317%384%315%315%316%315%315%316%439@@@@@@@@@%329%317%384%315%315%316%315%315%316%439@@@@@@@@@%329%317%384%315%316%316%315%316%316%439@@@@@@@@@%329%317%384%315%316%316%316%315%316%439@@@@@@@@@%329%317%384%316%316%315%316%316%439@@@@@@@@%329%317%384%316%315%315%315%315%439@@@@@@@@%329%317%384%316%316%316%316%315%316%439@@@@@@@@@%329%317%384%315%315%315%315%316%316%439@@@@@@@@@%329%317%384%316%315%316%315%316%316%439@@@@@@@@@%329%317%384%316%315%315%315%315%439@@@@@@@@%329%317%384%315%316%316%315%315%316%439@@@@@@@@@%329%317%384%316%316%316%316%315%316%439@@@@@@@@@%329%317%384%315%315%315%315%316%316%439@@@@@@@@@%329%317%384%315%316%316%315%316%316%439@@@@@@@@@%329%317%384%315%315%315%316%315%316%439@@@@@@@@@%329%317%384%316%315%315%316%315%316%439@@@@@@@@@%329%317%384%316%315%315%315%315%439@@@@@@@@%329%317%384%315%316%316%315%315%316%439@@@@@@@@@%329%317%384%316%315%316%316%315%316%439@@@@@@@@@%329%317%384%315%316%316%315%315%316%439@@@@@@@@@%329%317%384%315%316%316%316%315%316%439@@@@@@@@@%329%317%384%315%316%316%315%315%316%439@@@@@@@@@%329%317%384%316%316%316%316%315%316%439@@@@@@@@@%329%317%384%316%315%316%315%316%316%439@@@@@@@@@%329%317%384%315%315%316%315%316%316%439@@@@@@@@@%379@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%159%177%484%256$4@%384%315%439@@@@%326$1@$5@@$0@||@|@@|@|@|@",
        read"%218%108%218%76%226%99%226%138%192%159%218%177%296%257%286$3@%398$2@@@%280$4@%326$1@$0@@@@%26%254%256$3@%384%315%439@@@@%240%326$1@$5@@$0@@@%254$3@%240$5@$4@@@@|@|@|@|@|@|@",
        read"%422%26@"])
  end
  val _ = DB.bindl "missing_pervasives"
  [("naturalZero_def",naturalZero_def,DB.Def), ("id_def",id_def,DB.Def),
   ("compare_byte_def",compare_byte_def,DB.Def),
   ("instance_Basic_classes_Ord_Missing_pervasives_byte_dict_def",
    instance_Basic_classes_Ord_Missing_pervasives_byte_dict_def,
    DB.Def), ("hex_char_of_nibble_def",hex_char_of_nibble_def,DB.Def),
   ("hex_string_of_byte_def",hex_string_of_byte_def,DB.Def),
   ("natural_of_decimal_digit_def",natural_of_decimal_digit_def,DB.Def),
   ("natural_of_decimal_string_helper_tupled_primitive_def",
    natural_of_decimal_string_helper_tupled_primitive_def,
    DB.Def),
   ("natural_of_decimal_string_helper_curried_def",
    natural_of_decimal_string_helper_curried_def,
    DB.Def),
   ("natural_of_decimal_string_def",natural_of_decimal_string_def,DB.Def),
   ("hex_string_of_natural_primitive_def",
    hex_string_of_natural_primitive_def,
    DB.Def), ("natural_of_bool_def",natural_of_bool_def,DB.Def),
   ("natural_ordering_def",natural_ordering_def,DB.Def),
   ("merge_by_tupled_primitive_def",merge_by_tupled_primitive_def,DB.Def),
   ("merge_by_curried_def",merge_by_curried_def,DB.Def),
   ("sort_by_tupled_primitive_def",sort_by_tupled_primitive_def,DB.Def),
   ("sort_by_curried_def",sort_by_curried_def,DB.Def),
   ("mapMaybei'_tupled_primitive_def",
    mapMaybei'_tupled_primitive_def,
    DB.Def), ("mapMaybei'_curried_def",mapMaybei'_curried_def,DB.Def),
   ("mapMaybei_def",mapMaybei_def,DB.Def),
   ("partitionii'_tupled_primitive_def",
    partitionii'_tupled_primitive_def,
    DB.Def), ("partitionii'_curried_def",partitionii'_curried_def,DB.Def),
   ("filteri_def",filteri_def,DB.Def),
   ("filterii_def",filterii_def,DB.Def),
   ("partitioni_def",partitioni_def,DB.Def),
   ("partitionii_def",partitionii_def,DB.Def),
   ("unzip3_primitive_def",unzip3_primitive_def,DB.Def),
   ("intercalate'_tupled_primitive_def",
    intercalate'_tupled_primitive_def,
    DB.Def), ("intercalate'_curried_def",intercalate'_curried_def,DB.Def),
   ("intercalate_def",intercalate_def,DB.Def),
   ("unlines_def",unlines_def,DB.Def), ("bracket_def",bracket_def,DB.Def),
   ("length_def",length_def,DB.Def),
   ("take_tupled_primitive_def",take_tupled_primitive_def,DB.Def),
   ("take_curried_def",take_curried_def,DB.Def),
   ("string_prefix_def",string_prefix_def,DB.Def),
   ("string_index_of'_tupled_primitive_def",
    string_index_of'_tupled_primitive_def,
    DB.Def),
   ("string_index_of'_curried_def",string_index_of'_curried_def,DB.Def),
   ("string_index_of_def",string_index_of_def,DB.Def),
   ("index_tupled_primitive_def",index_tupled_primitive_def,DB.Def),
   ("index_curried_def",index_curried_def,DB.Def),
   ("find_index_helper_tupled_primitive_def",
    find_index_helper_tupled_primitive_def,
    DB.Def),
   ("find_index_helper_curried_def",find_index_helper_curried_def,DB.Def),
   ("find_index0_def",find_index0_def,DB.Def),
   ("replicate_revacc_tupled_primitive_def",
    replicate_revacc_tupled_primitive_def,
    DB.Def),
   ("replicate_revacc_curried_def",replicate_revacc_curried_def,DB.Def),
   ("replicate_def",replicate_def,DB.Def),
   ("list_append_def",list_append_def,DB.Def),
   ("list_concat_def",list_concat_def,DB.Def),
   ("list_concat_map_def",list_concat_map_def,DB.Def),
   ("list_reverse_concat_map_helper_tupled_primitive_def",
    list_reverse_concat_map_helper_tupled_primitive_def,
    DB.Def),
   ("list_reverse_concat_map_helper_curried_def",
    list_reverse_concat_map_helper_curried_def,
    DB.Def),
   ("list_reverse_concat_map_def",list_reverse_concat_map_def,DB.Def),
   ("list_take_with_accum_tupled_primitive_def",
    list_take_with_accum_tupled_primitive_def,
    DB.Def),
   ("list_take_with_accum_curried_def",
    list_take_with_accum_curried_def,
    DB.Def), ("unsafe_string_take_def",unsafe_string_take_def,DB.Def),
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
   ("intercalate'_ind",intercalate'_ind,DB.Thm),
   ("intercalate'_def",intercalate'_def,DB.Thm),
   ("take_ind",take_ind,DB.Thm), ("take_def",take_def,DB.Thm),
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

  local open Portable GrammarSpecials Parse
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
       ("natural_of_decimal_digit", (Term.prim_mk_const { Name = "natural_of_decimal_digit", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_decimal_digit", (Term.prim_mk_const { Name = "natural_of_decimal_digit", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_decimal_string_helper_tupled", (Term.prim_mk_const { Name = "natural_of_decimal_string_helper_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_decimal_string_helper_tupled", (Term.prim_mk_const { Name = "natural_of_decimal_string_helper_tupled", Thy = "missing_pervasives"}))
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
       ("merge_by_tupled", (Term.prim_mk_const { Name = "merge_by_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("merge_by_tupled", (Term.prim_mk_const { Name = "merge_by_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("merge_by", (Term.prim_mk_const { Name = "merge_by", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("merge_by", (Term.prim_mk_const { Name = "merge_by", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sort_by_tupled", (Term.prim_mk_const { Name = "sort_by_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sort_by_tupled", (Term.prim_mk_const { Name = "sort_by_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sort_by", (Term.prim_mk_const { Name = "sort_by", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sort_by", (Term.prim_mk_const { Name = "sort_by", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapMaybei'_tupled", (Term.prim_mk_const { Name = "mapMaybei'_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapMaybei'_tupled", (Term.prim_mk_const { Name = "mapMaybei'_tupled", Thy = "missing_pervasives"}))
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
       ("partitionii'_tupled", (Term.prim_mk_const { Name = "partitionii'_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("partitionii'_tupled", (Term.prim_mk_const { Name = "partitionii'_tupled", Thy = "missing_pervasives"}))
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
       ("intercalate'_tupled", (Term.prim_mk_const { Name = "intercalate'_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("intercalate'_tupled", (Term.prim_mk_const { Name = "intercalate'_tupled", Thy = "missing_pervasives"}))
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
       ("length", (Term.prim_mk_const { Name = "length", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("length", (Term.prim_mk_const { Name = "length", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("take_tupled", (Term.prim_mk_const { Name = "take_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("take_tupled", (Term.prim_mk_const { Name = "take_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("take", (Term.prim_mk_const { Name = "take", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("take", (Term.prim_mk_const { Name = "take", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_prefix", (Term.prim_mk_const { Name = "string_prefix", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_prefix", (Term.prim_mk_const { Name = "string_prefix", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_index_of'_tupled", (Term.prim_mk_const { Name = "string_index_of'_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_index_of'_tupled", (Term.prim_mk_const { Name = "string_index_of'_tupled", Thy = "missing_pervasives"}))
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
       ("index_tupled", (Term.prim_mk_const { Name = "index_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("index_tupled", (Term.prim_mk_const { Name = "index_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("index", (Term.prim_mk_const { Name = "index", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("index", (Term.prim_mk_const { Name = "index", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("find_index_helper_tupled", (Term.prim_mk_const { Name = "find_index_helper_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("find_index_helper_tupled", (Term.prim_mk_const { Name = "find_index_helper_tupled", Thy = "missing_pervasives"}))
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
       ("replicate_revacc_tupled", (Term.prim_mk_const { Name = "replicate_revacc_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("replicate_revacc_tupled", (Term.prim_mk_const { Name = "replicate_revacc_tupled", Thy = "missing_pervasives"}))
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
       ("list_reverse_concat_map_helper_tupled", (Term.prim_mk_const { Name = "list_reverse_concat_map_helper_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_reverse_concat_map_helper_tupled", (Term.prim_mk_const { Name = "list_reverse_concat_map_helper_tupled", Thy = "missing_pervasives"}))
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
       ("list_take_with_accum_tupled", (Term.prim_mk_const { Name = "list_take_with_accum_tupled", Thy = "missing_pervasives"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("list_take_with_accum_tupled", (Term.prim_mk_const { Name = "list_take_with_accum_tupled", Thy = "missing_pervasives"}))
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
        "missing_pervasives.naturalZero_def missing_pervasives.unsafe_string_take_def missing_pervasives.left_zero_padded_to_def missing_pervasives.right_space_padded_to_def missing_pervasives.left_space_padded_to_def missing_pervasives.space_padded_and_maybe_newline_def missing_pervasives.right_padded_to_def missing_pervasives.left_padded_to_def missing_pervasives.padding_to_def missing_pervasives.padded_and_maybe_newline_def missing_pervasives.space_padding_and_maybe_newline_def missing_pervasives.padding_and_maybe_newline_def missing_pervasives.partitionii_def missing_pervasives.list_reverse_concat_map_def missing_pervasives.list_concat_map_def missing_pervasives.list_concat_def missing_pervasives.list_append_def missing_pervasives.replicate_def missing_pervasives.find_index0_def missing_pervasives.string_index_of_def missing_pervasives.string_prefix_def missing_pervasives.length_def missing_pervasives.bracket_def missing_pervasives.unlines_def missing_pervasives.intercalate_def missing_pervasives.unzip3_def missing_pervasives.natural_ordering_def missing_pervasives.partitioni_def missing_pervasives.filterii_def missing_pervasives.filteri_def missing_pervasives.mapMaybei_def missing_pervasives.natural_of_bool_def missing_pervasives.natural_of_decimal_digit_def missing_pervasives.natural_of_decimal_string_def missing_pervasives.instance_Basic_classes_Ord_Missing_pervasives_byte_dict_def missing_pervasives.hex_string_of_byte_def missing_pervasives.hex_char_of_nibble_def missing_pervasives.compare_byte_def missing_pervasives.id_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "missing_pervasives"
end
