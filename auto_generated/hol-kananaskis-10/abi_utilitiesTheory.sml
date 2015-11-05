structure abi_utilitiesTheory :> abi_utilitiesTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_utilitiesTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open memory_image_orderingsTheory
  in end;
  val _ = Theory.link_parents
          ("abi_utilities",
          Arbnum.fromString "1445438975",
          Arbnum.fromString "524862")
          [("memory_image_orderings",
           Arbnum.fromString "1445438955",
           Arbnum.fromString "493782")];
  val _ = Theory.incorporate_types "abi_utilities"
       [("relocation_operator_expression", 1), ("relocation_operator2", 0),
        ("relocation_operator", 0), ("relocation_frame", 2),
        ("integer_bit_width", 0), ("can_fail", 1)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("num", "num"),
   ID("memory_image", "symbol_reference_and_reloc_site"),
   ID("abi_utilities", "relocation_operator"),
   ID("abi_utilities", "relocation_operator_expression"),
   ID("pair", "prod"), ID("abi_utilities", "relocation_operator2"),
   ID("abi_utilities", "relocation_frame"), ID("finite_map", "fmap"),
   ID("abi_utilities", "can_fail"),
   ID("abi_utilities", "integer_bit_width"),
   ID("memory_image", "annotated_memory_image"),
   ID("memory_image", "ToNaturalList_class"),
   ID("lem_basic_classes", "Ord_class"), ID("error", "error"),
   ID("min", "bool"), ID("ind_type", "recspace"),
   ID("memory_image", "memory_image_element"), ID("list", "list"),
   ID("string", "char"), ID("option", "option"),
   ID("memory_image", "range_tag"), ID("bool", "!"), ID("arithmetic", "+"),
   ID("pair", ","), ID("bool", "/\\"), ID("num", "0"), ID("prim_rec", "<"),
   ID("min", "="), ID("min", "==>"), ID("bool", "?"), ID("bool", "ARB"),
   ID("abi_utilities", "Apply"), ID("abi_utilities", "Apply2"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"),
   ID("abi_utilities", "CanFail"), ID("abi_utilities", "CanFailOnTest"),
   ID("abi_utilities", "CannotFail"), ID("abi_utilities", "Copy"),
   ID("bool", "DATATYPE"), ID("abi_utilities", "DTPMod"),
   ID("abi_utilities", "DTPRel"), ID("abi_utilities", "Delta"),
   ID("ind_type", "FCONS"), ID("finite_map", "FLOOKUP"),
   ID("abi_utilities", "G"), ID("abi_utilities", "GDat"),
   ID("abi_utilities", "GLDM"), ID("abi_utilities", "GTLSDesc"),
   ID("abi_utilities", "GTLSIdx"), ID("abi_utilities", "GTPRel"),
   ID("abi_utilities", "Ha"), ID("abi_utilities", "Half16ds"),
   ID("abi_utilities", "Hi"), ID("abi_utilities", "Higher"),
   ID("abi_utilities", "HigherA"), ID("abi_utilities", "Highest"),
   ID("abi_utilities", "HighestA"), ID("abi_utilities", "I12"),
   ID("abi_utilities", "I15"), ID("abi_utilities", "I16"),
   ID("abi_utilities", "I20"), ID("abi_utilities", "I27"),
   ID("abi_utilities", "I32"), ID("abi_utilities", "I48"),
   ID("abi_utilities", "I64"), ID("abi_utilities", "I64X2"),
   ID("abi_utilities", "I8"), ID("abi_utilities", "Indirect"),
   ID("abi_utilities", "LDM"), ID("bool", "LET"),
   ID("abi_utilities", "LTOff"), ID("abi_utilities", "Lift"),
   ID("abi_utilities", "Lo"), ID("abi_utilities", "Low14"),
   ID("abi_utilities", "Low24"), ID("abi_utilities", "Minus"),
   ID("list", "NIL"), ID("arithmetic", "NUMERAL"),
   ID("abi_utilities", "NoCopy"), ID("abi_utilities", "Page"),
   ID("abi_utilities", "Plus"), ID("abi_utilities", "RShift"),
   ID("num", "SUC"), ID("memory_image", "SymbolRef"),
   ID("abi_utilities", "TLSDesc"), ID("abi_utilities", "TPRel"),
   ID("bool", "TYPE_DEFINITION"), ID("abi_utilities", "U12"),
   ID("abi_utilities", "U15"), ID("abi_utilities", "U16"),
   ID("abi_utilities", "U24"), ID("abi_utilities", "U32"),
   ID("abi_utilities", "U48"), ID("abi_utilities", "U64"),
   ID("abi_utilities", "Word30"), ID("arithmetic", "ZERO"),
   ID("bool", "\\/"), ID("memory_image", "annotated_memory_image_by_tag"),
   ID("memory_image", "annotated_memory_image_elements"),
   ID("abi_utilities", "can_fail_CASE"),
   ID("abi_utilities", "can_fail_size"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_size"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
   ID("elf_symbol_table", "elf64_symbol_table_entry"),
   ID("error", "fail0"), ID("lem", "failwith"),
   ID("finite_map", "fmap_size"),
   ID("lem_maybe", "instance_Basic_classes_Ord_Maybe_maybe_dict"),
   ID("memory_image_orderings", "instance_Basic_classes_Ord_Memory_image_range_tag_dict"),
   ID("lem_num", "instance_Basic_classes_Ord_Num_natural_dict"),
   ID("lem_string_extra", "instance_Basic_classes_Ord_string_dict"),
   ID("lem_basic_classes", "instance_Basic_classes_Ord_tup2_dict"),
   ID("abi_utilities", "integer_bit_width2num"),
   ID("abi_utilities", "integer_bit_width_CASE"),
   ID("abi_utilities", "integer_bit_width_size"), ID("list", "list_CASE"),
   ID("multimap", "lookupBy0"), ID("abi_utilities", "lookupM"),
   ID("memory_image", "memory_image_element_startpos"),
   ID("abi_utilities", "natural_of_integer_bit_width"),
   ID("abi_utilities", "num2integer_bit_width"),
   ID("abi_utilities", "num2relocation_operator"),
   ID("abi_utilities", "num2relocation_operator2"),
   ID("option", "option_CASE"), ID("pair", "pair_CASE"),
   ID("basicSize", "pair_size"), ID("abi_utilities", "reloc_site_address"),
   ID("abi_utilities", "relocation_frame_CASE"),
   ID("abi_utilities", "relocation_frame_size"),
   ID("abi_utilities", "relocation_operator22num"),
   ID("abi_utilities", "relocation_operator2_CASE"),
   ID("abi_utilities", "relocation_operator2_size"),
   ID("abi_utilities", "relocation_operator2num"),
   ID("abi_utilities", "relocation_operator_CASE"),
   ID("abi_utilities", "relocation_operator_expression1_size"),
   ID("abi_utilities", "relocation_operator_expression2_size"),
   ID("abi_utilities", "relocation_operator_expression3_size"),
   ID("abi_utilities", "relocation_operator_expression4_size"),
   ID("abi_utilities", "relocation_operator_expression_CASE"),
   ID("abi_utilities", "relocation_operator_expression_size"),
   ID("abi_utilities", "relocation_operator_size"), ID("error", "return"),
   ID("abi_utilities", "size_of_copy_reloc"),
   ID("abi_utilities", "size_of_def"),
   ID("memory_image", "symbol_reference_and_reloc_site_ref"),
   ID("memory_image", "symbol_reference"),
   ID("memory_image", "symbol_reference_ref_syment"), ID("words", "w2n"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [2], TYOP [0, 1, 0], TYV "'a", TYOP [0, 3, 2], TYOP [3],
   TYOP [0, 5, 0], TYOP [4, 3], TYOP [0, 7, 0], TYOP [0, 3, 0],
   TYOP [0, 9, 8], TYV "'b", TYOP [5, 7, 0], TYOP [0, 12, 11],
   TYOP [0, 13, 11], TYOP [5, 7, 7], TYOP [0, 15, 11], TYOP [0, 16, 14],
   TYOP [0, 16, 17], TYOP [6], TYOP [5, 19, 15], TYOP [0, 20, 11],
   TYOP [0, 21, 18], TYOP [5, 5, 7], TYOP [0, 23, 11], TYOP [0, 24, 22],
   TYOP [0, 3, 11], TYOP [0, 26, 25], TYOP [0, 7, 27], TYOP [0, 15, 0],
   TYOP [0, 9, 29], TYOP [0, 23, 0], TYOP [0, 9, 31], TYOP [0, 12, 0],
   TYOP [0, 9, 33], TYOP [0, 20, 0], TYOP [0, 9, 35], TYOP [0, 3, 3],
   TYOP [0, 3, 37], TYOP [0, 3, 38], TYOP [0, 3, 39], TYOP [0, 3, 40],
   TYOP [0, 3, 41], TYOP [0, 3, 42], TYOP [0, 3, 43], TYOP [0, 3, 44],
   TYOP [0, 3, 45], TYOP [0, 3, 46], TYOP [0, 3, 47], TYOP [0, 3, 48],
   TYOP [0, 3, 49], TYOP [0, 3, 50], TYOP [0, 3, 51], TYOP [0, 3, 52],
   TYOP [0, 3, 53], TYOP [0, 3, 54], TYOP [0, 3, 55], TYOP [0, 3, 56],
   TYOP [0, 5, 57], TYOP [0, 19, 0], TYOP [0, 19, 37], TYV "'res",
   TYV "'addr", TYOP [7, 62, 61], TYOP [0, 63, 0], TYOP [0, 61, 0],
   TYOP [0, 65, 64], TYOP [0, 62, 0], TYOP [0, 67, 66], TYOP [9, 61],
   TYOP [10], TYOP [5, 70, 69], TYOP [4, 61], TYOP [5, 72, 71],
   TYOP [8, 62, 73], TYOP [0, 74, 3], TYOP [0, 75, 3], TYOP [0, 3, 76],
   TYOP [0, 63, 77], TYOP [11, 3], TYOP [0, 79, 2], TYOP [12, 3],
   TYOP [0, 81, 80], TYOP [13, 3], TYOP [0, 83, 82], TYOP [0, 0, 19],
   TYOP [0, 0, 5], TYOP [0, 0, 70], TYOP [0, 70, 0], TYOP [14, 3],
   TYOP [8, 11, 3], TYOP [0, 90, 89], TYOP [0, 11, 91], TYOP [0, 70, 57],
   TYOP [9, 3], TYOP [0, 94, 0], TYOP [0, 9, 95], TYOP [0, 11, 11],
   TYOP [15], TYOP [0, 3, 98], TYOP [0, 99, 11], TYOP [0, 100, 97],
   TYOP [0, 11, 101], TYOP [0, 94, 102], TYOP [0, 12, 7], TYOP [0, 15, 7],
   TYOP [0, 74, 63], TYOP [0, 3, 7], TYOP [0, 99, 94], TYOP [0, 20, 7],
   TYOP [0, 23, 7], TYOP [5, 0, 5], TYOP [5, 19, 111], TYOP [5, 3, 112],
   TYOP [16, 113], TYOP [0, 114, 98], TYOP [16, 99], TYOP [0, 116, 98],
   TYOP [16, 74], TYOP [0, 118, 98], TYOP [0, 94, 98], TYOP [0, 70, 98],
   TYOP [0, 63, 98], TYOP [0, 5, 98], TYOP [0, 19, 98], TYOP [0, 7, 98],
   TYOP [0, 20, 98], TYOP [0, 12, 98], TYOP [0, 23, 98], TYOP [0, 15, 98],
   TYOP [0, 108, 120], TYOP [0, 94, 130], TYOP [17], TYOP [19],
   TYOP [18, 133], TYOP [5, 0, 0], TYOP [0, 70, 3], TYOP [0, 5, 3],
   TYOP [0, 19, 3], TYV "'e", TYOP [0, 139, 11], TYOP [0, 23, 140],
   TYV "'c", TYOP [0, 142, 11], TYOP [0, 20, 143], TYV "'f",
   TYOP [0, 145, 11], TYOP [0, 15, 146], TYV "'d", TYOP [0, 148, 11],
   TYOP [0, 12, 149], TYOP [0, 145, 142], TYOP [0, 15, 151],
   TYOP [0, 19, 152], TYOP [0, 11, 148], TYOP [0, 7, 154],
   TYOP [0, 0, 155], TYOP [0, 11, 139], TYOP [0, 7, 157], TYOP [0, 5, 158],
   TYOP [0, 11, 145], TYOP [0, 11, 160], TYOP [0, 7, 161],
   TYOP [0, 7, 162], TYOP [0, 94, 11], TYOP [0, 63, 3], TYOP [0, 7, 11],
   TYOP [0, 20, 142], TYOP [0, 12, 148], TYOP [0, 23, 139],
   TYOP [0, 15, 145], TYOP [5, 134, 135], TYOP [20, 171], TYOP [21, 3],
   TYOP [5, 173, 172], TYOP [18, 174], TYOP [0, 70, 121],
   TYOP [0, 70, 176], TYOP [0, 70, 177], TYOP [0, 70, 178],
   TYOP [0, 70, 179], TYOP [0, 70, 180], TYOP [0, 70, 181],
   TYOP [0, 70, 182], TYOP [0, 70, 183], TYOP [0, 70, 184],
   TYOP [0, 70, 185], TYOP [0, 70, 186], TYOP [0, 70, 187],
   TYOP [0, 70, 188], TYOP [0, 70, 189], TYOP [0, 70, 190],
   TYOP [0, 70, 191], TYOP [0, 70, 192], TYOP [0, 70, 193],
   TYOP [0, 70, 194], TYOP [0, 106, 98], TYOP [0, 63, 196],
   TYOP [0, 5, 123], TYOP [0, 5, 198], TYOP [0, 5, 199], TYOP [0, 5, 200],
   TYOP [0, 5, 201], TYOP [0, 5, 202], TYOP [0, 5, 203], TYOP [0, 5, 204],
   TYOP [0, 5, 205], TYOP [0, 5, 206], TYOP [0, 5, 207], TYOP [0, 5, 208],
   TYOP [0, 5, 209], TYOP [0, 5, 210], TYOP [0, 5, 211], TYOP [0, 5, 212],
   TYOP [0, 5, 213], TYOP [0, 5, 214], TYOP [0, 5, 215], TYOP [0, 5, 216],
   TYOP [0, 104, 98], TYOP [0, 105, 218], TYOP [0, 105, 219],
   TYOP [0, 109, 220], TYOP [0, 110, 221], TYOP [0, 107, 222],
   TYOP [0, 94, 116], TYOP [0, 63, 118], TYOP [0, 7, 114],
   TYOP [0, 99, 98], TYOP [0, 11, 98], TYOP [0, 228, 98], TYOP [0, 83, 98],
   TYOP [0, 230, 98], TYOP [0, 81, 98], TYOP [0, 232, 98],
   TYOP [0, 79, 98], TYOP [0, 234, 98], TYOP [0, 120, 98],
   TYOP [0, 74, 98], TYOP [0, 237, 98], TYOP [0, 90, 98],
   TYOP [0, 239, 98], TYOP [0, 26, 98], TYOP [0, 241, 98],
   TYOP [0, 227, 98], TYOP [0, 9, 98], TYOP [0, 244, 98], TYOP [0, 67, 98],
   TYOP [0, 246, 98], TYOP [0, 65, 98], TYOP [0, 248, 98],
   TYOP [0, 236, 98], TYOP [0, 75, 98], TYOP [0, 251, 98],
   TYOP [0, 100, 98], TYOP [0, 253, 98], TYOP [0, 121, 98],
   TYOP [0, 255, 98], TYOP [0, 156, 98], TYOP [0, 257, 98],
   TYOP [0, 24, 98], TYOP [0, 259, 98], TYOP [0, 128, 98],
   TYOP [0, 261, 98], TYOP [0, 141, 98], TYOP [0, 263, 98],
   TYOP [0, 21, 98], TYOP [0, 265, 98], TYOP [0, 126, 98],
   TYOP [0, 267, 98], TYOP [0, 144, 98], TYOP [0, 269, 98],
   TYOP [0, 13, 98], TYOP [0, 271, 98], TYOP [0, 127, 98],
   TYOP [0, 273, 98], TYOP [0, 150, 98], TYOP [0, 275, 98],
   TYOP [0, 16, 98], TYOP [0, 277, 98], TYOP [0, 129, 98],
   TYOP [0, 279, 98], TYOP [0, 147, 98], TYOP [0, 281, 98],
   TYOP [0, 119, 98], TYOP [0, 283, 98], TYOP [0, 117, 98],
   TYOP [0, 285, 98], TYOP [0, 115, 98], TYOP [0, 287, 98],
   TYOP [0, 122, 98], TYOP [0, 289, 98], TYOP [0, 123, 98],
   TYOP [0, 291, 98], TYOP [0, 159, 98], TYOP [0, 293, 98],
   TYOP [0, 124, 98], TYOP [0, 295, 98], TYOP [0, 153, 98],
   TYOP [0, 297, 98], TYOP [0, 125, 98], TYOP [0, 299, 98],
   TYOP [0, 163, 98], TYOP [0, 301, 98], TYOP [0, 0, 98],
   TYOP [0, 303, 98], TYOP [0, 1, 98], TYOP [0, 305, 98], TYOP [0, 0, 0],
   TYOP [0, 0, 307], TYOP [0, 112, 113], TYOP [0, 3, 309],
   TYOP [0, 5, 111], TYOP [0, 0, 311], TYOP [0, 7, 23], TYOP [0, 5, 313],
   TYOP [0, 111, 112], TYOP [0, 19, 315], TYOP [0, 15, 20],
   TYOP [0, 19, 317], TYOP [0, 0, 12], TYOP [0, 7, 319], TYOP [0, 7, 15],
   TYOP [0, 7, 321], TYOP [0, 98, 98], TYOP [0, 98, 323], TYOP [0, 0, 303],
   TYOP [0, 3, 99], TYOP [0, 11, 228], TYOP [0, 142, 98],
   TYOP [0, 142, 328], TYOP [0, 148, 98], TYOP [0, 148, 330],
   TYOP [0, 139, 98], TYOP [0, 139, 332], TYOP [0, 145, 98],
   TYOP [0, 145, 334], TYOP [0, 94, 120], TYOP [0, 89, 98],
   TYOP [0, 89, 337], TYOP [0, 74, 237], TYOP [0, 99, 227],
   TYOP [0, 23, 128], TYOP [0, 20, 126], TYOP [0, 12, 127],
   TYOP [0, 15, 129], TYOP [0, 173, 98], TYOP [0, 173, 345],
   TYOP [0, 118, 119], TYOP [0, 116, 117], TYOP [0, 114, 115],
   TYOP [0, 63, 122], TYOP [0, 19, 124], TYOP [0, 7, 125],
   TYOP [0, 164, 98], TYOP [0, 353, 98], TYOP [0, 224, 98],
   TYOP [0, 355, 98], TYOP [0, 136, 98], TYOP [0, 357, 98],
   TYOP [0, 88, 98], TYOP [0, 359, 98], TYOP [0, 169, 98],
   TYOP [0, 361, 98], TYOP [0, 167, 98], TYOP [0, 363, 98],
   TYOP [0, 168, 98], TYOP [0, 365, 98], TYOP [0, 170, 98],
   TYOP [0, 367, 98], TYOP [0, 165, 98], TYOP [0, 369, 98],
   TYOP [0, 225, 98], TYOP [0, 371, 98], TYOP [0, 137, 98],
   TYOP [0, 373, 98], TYOP [0, 6, 98], TYOP [0, 375, 98],
   TYOP [0, 138, 98], TYOP [0, 377, 98], TYOP [0, 59, 98],
   TYOP [0, 379, 98], TYOP [0, 166, 98], TYOP [0, 381, 98],
   TYOP [0, 226, 98], TYOP [0, 383, 98], TYOP [0, 0, 133],
   TYOP [0, 98, 38], TYOP [0, 134, 134], TYOP [0, 133, 387],
   TYOP [0, 0, 118], TYOP [0, 389, 118], TYOP [0, 74, 390],
   TYOP [0, 0, 391], TYOP [0, 0, 116], TYOP [0, 393, 116],
   TYOP [0, 99, 394], TYOP [0, 0, 395], TYOP [0, 0, 114],
   TYOP [0, 397, 114], TYOP [0, 113, 398], TYOP [0, 0, 399],
   TYOP [0, 397, 397], TYOP [0, 114, 401], TYOP [20, 3], TYOP [0, 11, 403],
   TYOP [0, 90, 404], TYOP [20, 132], TYOP [0, 134, 406],
   TYOP [8, 134, 132], TYOP [0, 408, 407], TYOP [0, 175, 0],
   TYOP [0, 410, 410], TYOP [0, 307, 307], TYOP [0, 1, 173],
   TYOP [0, 303, 359], TYOP [0, 303, 375], TYOP [0, 303, 379],
   TYOP [0, 119, 371], TYOP [0, 117, 355], TYOP [0, 115, 383],
   TYOP [0, 174, 98], TYOP [0, 79, 420], TYOP [0, 79, 408],
   TYOP [0, 69, 0], TYOP [0, 65, 423], TYOP [111], TYOP [110, 425],
   TYOP [110, 426], TYOP [110, 427], TYOP [110, 428], TYOP [110, 429],
   TYOP [110, 430], TYOP [109, 98, 431], TYOP [112], TYOP [0, 433, 432],
   TYOP [0, 134, 89], TYOP [0, 134, 0], TYOP [0, 74, 0], TYOP [0, 73, 0],
   TYOP [0, 438, 437], TYOP [0, 67, 439], TYOP [13, 172], TYOP [13, 171],
   TYOP [0, 442, 441], TYOP [13, 173], TYOP [0, 81, 444],
   TYOP [0, 83, 445], TYOP [13, 0], TYOP [13, 134], TYOP [13, 135],
   TYOP [0, 449, 442], TYOP [0, 448, 450], TYOP [0, 447, 449],
   TYOP [0, 447, 452], TYOP [0, 0, 308], TYOP [0, 0, 454],
   TYOP [0, 0, 455], TYOP [0, 0, 456], TYOP [0, 0, 457], TYOP [0, 0, 458],
   TYOP [0, 0, 459], TYOP [0, 0, 460], TYOP [0, 0, 461], TYOP [0, 0, 462],
   TYOP [0, 0, 463], TYOP [0, 0, 464], TYOP [0, 0, 465], TYOP [0, 0, 466],
   TYOP [0, 0, 467], TYOP [0, 0, 468], TYOP [0, 0, 469], TYOP [0, 0, 470],
   TYOP [0, 0, 471], TYOP [0, 70, 472], TYOP [0, 174, 410],
   TYOP [0, 474, 0], TYOP [0, 0, 475], TYOP [0, 175, 476],
   TYOP [0, 420, 175], TYOP [0, 173, 478], TYOP [0, 346, 479],
   TYOP [0, 441, 480], TYOP [0, 444, 481], TYOP [20, 0],
   TYOP [0, 132, 483], TYOP [0, 3, 89], TYOP [0, 485, 89],
   TYOP [0, 89, 486], TYOP [0, 403, 487], TYOP [0, 132, 0],
   TYOP [0, 489, 0], TYOP [0, 0, 490], TYOP [0, 406, 491],
   TYOP [0, 307, 0], TYOP [0, 0, 493], TYOP [0, 483, 494],
   TYOP [0, 171, 0], TYOP [0, 496, 0], TYOP [0, 0, 497],
   TYOP [0, 172, 498], TYOP [0, 135, 0], TYOP [0, 134, 500],
   TYOP [0, 501, 0], TYOP [0, 171, 502], TYOP [0, 308, 0],
   TYOP [0, 135, 504], TYOP [0, 172, 0], TYOP [0, 173, 506],
   TYOP [0, 507, 0], TYOP [0, 174, 508], TYOP [0, 71, 0],
   TYOP [0, 423, 510], TYOP [0, 88, 511], TYOP [0, 510, 438],
   TYOP [0, 72, 0], TYOP [0, 514, 513], TYOP [0, 65, 514], TYOP [154],
   TYOP [0, 1, 517], TYOP [0, 517, 433], TYOP [0, 432, 0]]
  end
  val _ = Theory.incorporate_consts "abi_utilities" tyvector
     [("size_of_def", 2), ("size_of_copy_reloc", 4),
      ("relocation_operator_size", 6),
      ("relocation_operator_expression_size", 10),
      ("relocation_operator_expression_CASE", 28),
      ("relocation_operator_expression4_size", 30),
      ("relocation_operator_expression3_size", 32),
      ("relocation_operator_expression2_size", 34),
      ("relocation_operator_expression1_size", 36),
      ("relocation_operator_CASE", 58), ("relocation_operator2num", 6),
      ("relocation_operator2_size", 59), ("relocation_operator2_CASE", 60),
      ("relocation_operator22num", 59), ("relocation_frame_size", 68),
      ("relocation_frame_CASE", 78), ("reloc_site_address", 84),
      ("num2relocation_operator2", 85), ("num2relocation_operator", 86),
      ("num2integer_bit_width", 87), ("natural_of_integer_bit_width", 88),
      ("lookupM", 92), ("integer_bit_width_size", 88),
      ("integer_bit_width_CASE", 93), ("integer_bit_width2num", 88),
      ("can_fail_size", 96), ("can_fail_CASE", 103), ("Word30", 70),
      ("U64", 70), ("U48", 70), ("U32", 70), ("U24", 70), ("U16", 70),
      ("U15", 70), ("U12", 70), ("TPRel", 5), ("TLSDesc", 5),
      ("RShift", 104), ("Plus", 105), ("Page", 5), ("NoCopy", 106),
      ("Minus", 105), ("Low24", 70), ("Low14", 70), ("Lo", 5),
      ("Lift", 107), ("LTOff", 5), ("LDM", 5), ("Indirect", 5), ("I8", 70),
      ("I64X2", 70), ("I64", 70), ("I48", 70), ("I32", 70), ("I27", 70),
      ("I20", 70), ("I16", 70), ("I15", 70), ("I12", 70), ("HighestA", 5),
      ("Highest", 5), ("HigherA", 5), ("Higher", 5), ("Hi", 5),
      ("Half16ds", 70), ("Ha", 5), ("GTPRel", 5), ("GTLSIdx", 19),
      ("GTLSDesc", 5), ("GLDM", 5), ("GDat", 5), ("G", 5), ("Delta", 5),
      ("DTPRel", 5), ("DTPMod", 5), ("Copy", 63), ("CannotFail", 94),
      ("CanFailOnTest", 108), ("CanFail", 94), ("Apply2", 109),
      ("Apply", 110)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'@temp @ind_typeabi_utilities5prod'", 115),
   TMV("'@temp @ind_typeabi_utilities6prod'", 115),
   TMV("'@temp @ind_typeabi_utilities7prod'", 115),
   TMV("'@temp @ind_typeabi_utilities8prod'", 115), TMV("'can_fail'", 117),
   TMV("'relocation_frame'", 119),
   TMV("'relocation_operator_expression'", 115), TMV("M", 94),
   TMV("M", 70), TMV("M", 63), TMV("M", 5), TMV("M", 19), TMV("M", 7),
   TMV("M'", 94), TMV("M'", 70), TMV("M'", 63), TMV("M'", 5),
   TMV("M'", 19), TMV("M'", 7), TMV("P", 120), TMV("P", 121),
   TMV("P", 122), TMV("P", 123), TMV("P", 124), TMV("P0", 125),
   TMV("P1", 126), TMV("P2", 127), TMV("P3", 128), TMV("P4", 129),
   TMV("a", 3), TMV("a", 74), TMV("a", 99), TMV("a", 70), TMV("a", 23),
   TMV("a", 20), TMV("a", 12), TMV("a", 15), TMV("a", 114), TMV("a", 5),
   TMV("a", 19), TMV("a'", 3), TMV("a'", 74), TMV("a'", 99), TMV("a'", 70),
   TMV("a'", 23), TMV("a'", 20), TMV("a'", 12), TMV("a'", 15),
   TMV("a'", 5), TMV("a'", 19), TMV("a0", 118), TMV("a0", 116),
   TMV("a0", 114), TMV("a0", 5), TMV("a0", 19), TMV("a0", 7),
   TMV("a0'", 114), TMV("a1", 0), TMV("a1", 15), TMV("a1", 114),
   TMV("a1", 7), TMV("a1'", 114), TMV("a2", 114), TMV("a3", 114),
   TMV("a4", 114), TMV("addr", 0), TMV("c", 94), TMV("can_fail", 131),
   TMV("cc", 94), TMV("dict_Basic_classes_Ord_abifeature", 83),
   TMV("dict_Memory_image_ToNaturalList_abifeature", 81), TMV("el", 132),
   TMV("el_name", 134), TMV("el_range", 135), TMV("element_addr", 0),
   TMV("f", 74), TMV("f", 26), TMV("f", 99), TMV("f", 9), TMV("f", 67),
   TMV("f", 75), TMV("f", 100), TMV("f", 136), TMV("f", 137),
   TMV("f", 138), TMV("f'", 26), TMV("f'", 75), TMV("f'", 100),
   TMV("f0", 3), TMV("f0", 11), TMV("f0", 26), TMV("f1", 65),
   TMV("f1", 75), TMV("f1", 100), TMV("f1", 24), TMV("f1", 141),
   TMV("f1'", 24), TMV("f2", 11), TMV("f2", 21), TMV("f2", 144),
   TMV("f2'", 21), TMV("f3", 16), TMV("f3", 147), TMV("f3'", 16),
   TMV("f4", 16), TMV("f4", 147), TMV("f4'", 16), TMV("f5", 13),
   TMV("f5", 150), TMV("f5'", 13), TMV("f6", 153), TMV("f7", 156),
   TMV("f8", 159), TMV("f9", 163), TMV("fn", 164), TMV("fn", 165),
   TMV("fn0", 166), TMV("fn1", 167), TMV("fn2", 168), TMV("fn3", 169),
   TMV("fn4", 170), TMV("found_kvs", 175), TMV("i", 70), TMV("img", 3),
   TMV("img", 79), TMV("integer_bit_width", 195), TMV("j", 3),
   TMV("k", 62), TMV("key", 11), TMV("m", 0), TMV("n", 0), TMV("p", 23),
   TMV("p", 20), TMV("p", 12), TMV("p", 15), TMV("r", 0), TMV("r", 63),
   TMV("r", 19), TMV("r", 7), TMV("r'", 0), TMV("r0", 5), TMV("r0", 7),
   TMV("relocation_frame", 197), TMV("relocation_operator", 217),
   TMV("relocation_operator2", 124),
   TMV("relocation_operator_expression", 223), TMV("rep", 224),
   TMV("rep", 88), TMV("rep", 225), TMV("rep", 6), TMV("rep", 59),
   TMV("rep", 226), TMV("rr", 63), TMV("rr", 7), TMV("rr", 1),
   TMV("site_offset", 0), TMV("start", 0), TMV("v", 3), TMV("v", 11),
   TMV("v", 171), TMV("v", 73), TMV("v'", 3), TMV("v'", 11), TMV("v0", 3),
   TMV("v0'", 3), TMV("v1", 3), TMV("v1", 11), TMV("v1", 0), TMV("v1'", 3),
   TMV("v1'", 11), TMV("v10", 3), TMV("v10", 173), TMV("v10'", 3),
   TMV("v11", 3), TMV("v11", 172), TMV("v11'", 3), TMV("v12", 3),
   TMV("v12'", 3), TMV("v13", 3), TMV("v13'", 3), TMV("v14", 3),
   TMV("v14'", 3), TMV("v15", 3), TMV("v15'", 3), TMV("v16", 3),
   TMV("v16'", 3), TMV("v17", 3), TMV("v17'", 3), TMV("v18", 3),
   TMV("v18'", 3), TMV("v19", 3), TMV("v19'", 3), TMV("v2", 3),
   TMV("v2", 174), TMV("v2'", 3), TMV("v20", 3), TMV("v20'", 3),
   TMV("v3", 3), TMV("v3", 175), TMV("v3'", 3), TMV("v4", 3),
   TMV("v4'", 3), TMV("v5", 3), TMV("v5'", 3), TMV("v6", 3),
   TMV("v6", 174), TMV("v6'", 3), TMV("v7", 3), TMV("v7", 175),
   TMV("v7'", 3), TMV("v8", 3), TMV("v8'", 3), TMV("v9", 3), TMV("v9'", 3),
   TMV("val_map", 90), TMV("x", 70), TMV("x", 5), TMV("x", 19),
   TMV("x0", 3), TMV("x1", 3), TMV("x10", 3), TMV("x11", 3), TMV("x12", 3),
   TMV("x13", 3), TMV("x14", 3), TMV("x15", 3), TMV("x16", 3),
   TMV("x17", 3), TMV("x18", 3), TMV("x19", 3), TMV("x2", 3),
   TMV("x20", 3), TMV("x3", 3), TMV("x4", 3), TMV("x5", 3), TMV("x6", 3),
   TMV("x7", 3), TMV("x8", 3), TMV("x9", 3), TMC(22, 227), TMC(22, 229),
   TMC(22, 231), TMC(22, 233), TMC(22, 235), TMC(22, 236), TMC(22, 238),
   TMC(22, 240), TMC(22, 242), TMC(22, 243), TMC(22, 245), TMC(22, 247),
   TMC(22, 249), TMC(22, 250), TMC(22, 252), TMC(22, 254), TMC(22, 256),
   TMC(22, 258), TMC(22, 260), TMC(22, 262), TMC(22, 264), TMC(22, 266),
   TMC(22, 268), TMC(22, 270), TMC(22, 272), TMC(22, 274), TMC(22, 276),
   TMC(22, 278), TMC(22, 280), TMC(22, 282), TMC(22, 284), TMC(22, 286),
   TMC(22, 288), TMC(22, 290), TMC(22, 292), TMC(22, 294), TMC(22, 296),
   TMC(22, 298), TMC(22, 300), TMC(22, 302), TMC(22, 255), TMC(22, 304),
   TMC(22, 261), TMC(22, 267), TMC(22, 273), TMC(22, 279), TMC(22, 283),
   TMC(22, 285), TMC(22, 287), TMC(22, 289), TMC(22, 291), TMC(22, 295),
   TMC(22, 299), TMC(22, 306), TMC(23, 308), TMC(24, 310), TMC(24, 312),
   TMC(24, 314), TMC(24, 316), TMC(24, 318), TMC(24, 320), TMC(24, 322),
   TMC(25, 324), TMC(26, 0), TMC(27, 325), TMC(28, 326), TMC(28, 327),
   TMC(28, 329), TMC(28, 331), TMC(28, 333), TMC(28, 335), TMC(28, 324),
   TMC(28, 336), TMC(28, 338), TMC(28, 339), TMC(28, 340), TMC(28, 176),
   TMC(28, 325), TMC(28, 341), TMC(28, 342), TMC(28, 343), TMC(28, 344),
   TMC(28, 346), TMC(28, 347), TMC(28, 348), TMC(28, 349), TMC(28, 350),
   TMC(28, 198), TMC(28, 351), TMC(28, 352), TMC(29, 324), TMC(30, 227),
   TMC(30, 238), TMC(30, 243), TMC(30, 354), TMC(30, 356), TMC(30, 358),
   TMC(30, 360), TMC(30, 362), TMC(30, 364), TMC(30, 366), TMC(30, 368),
   TMC(30, 370), TMC(30, 372), TMC(30, 374), TMC(30, 376), TMC(30, 378),
   TMC(30, 380), TMC(30, 382), TMC(30, 384), TMC(30, 255), TMC(30, 304),
   TMC(30, 261), TMC(30, 267), TMC(30, 273), TMC(30, 279), TMC(30, 287),
   TMC(30, 291), TMC(30, 295), TMC(31, 3), TMC(31, 74), TMC(31, 99),
   TMC(31, 0), TMC(31, 5), TMC(31, 19), TMC(32, 110), TMC(33, 109),
   TMC(34, 307), TMC(35, 307), TMC(36, 118), TMC(36, 116), TMC(36, 114),
   TMC(37, 385), TMC(38, 386), TMC(39, 388), TMC(40, 392), TMC(40, 396),
   TMC(40, 400), TMC(41, 94), TMC(42, 108), TMC(43, 94), TMC(44, 63),
   TMC(45, 323), TMC(46, 5), TMC(47, 5), TMC(48, 5), TMC(49, 402),
   TMC(50, 405), TMC(50, 409), TMC(51, 5), TMC(52, 5), TMC(53, 5),
   TMC(54, 5), TMC(55, 19), TMC(56, 5), TMC(57, 5), TMC(58, 70),
   TMC(59, 5), TMC(60, 5), TMC(61, 5), TMC(62, 5), TMC(63, 5), TMC(64, 70),
   TMC(65, 70), TMC(66, 70), TMC(67, 70), TMC(68, 70), TMC(69, 70),
   TMC(70, 70), TMC(71, 70), TMC(72, 70), TMC(73, 70), TMC(74, 5),
   TMC(75, 5), TMC(76, 411), TMC(76, 412), TMC(77, 5), TMC(78, 107),
   TMC(79, 5), TMC(80, 70), TMC(81, 70), TMC(82, 105), TMC(83, 134),
   TMC(84, 307), TMC(85, 106), TMC(86, 5), TMC(87, 105), TMC(88, 104),
   TMC(89, 307), TMC(90, 413), TMC(91, 5), TMC(92, 5), TMC(93, 414),
   TMC(93, 415), TMC(93, 416), TMC(93, 417), TMC(93, 418), TMC(93, 419),
   TMC(94, 70), TMC(95, 70), TMC(96, 70), TMC(97, 70), TMC(98, 70),
   TMC(99, 70), TMC(100, 70), TMC(101, 70), TMC(102, 0), TMC(103, 324),
   TMC(104, 421), TMC(105, 422), TMC(106, 103), TMC(107, 96),
   TMC(107, 424), TMC(108, 434), TMC(113, 435), TMC(114, 436),
   TMC(115, 440), TMC(116, 443), TMC(117, 446), TMC(118, 447),
   TMC(119, 448), TMC(120, 451), TMC(120, 453), TMC(121, 88), TMC(122, 93),
   TMC(122, 473), TMC(123, 88), TMC(124, 477), TMC(125, 482), TMC(126, 92),
   TMC(127, 484), TMC(128, 88), TMC(129, 87), TMC(130, 86), TMC(131, 85),
   TMC(132, 488), TMC(132, 492), TMC(132, 495), TMC(132, 499),
   TMC(133, 503), TMC(133, 505), TMC(133, 509), TMC(134, 512),
   TMC(134, 515), TMC(135, 84), TMC(136, 78), TMC(137, 68), TMC(138, 59),
   TMC(139, 60), TMC(140, 59), TMC(141, 6), TMC(142, 58), TMC(143, 36),
   TMC(144, 34), TMC(145, 32), TMC(146, 30), TMC(147, 28), TMC(148, 10),
   TMC(148, 516), TMC(149, 6), TMC(150, 485), TMC(151, 4), TMC(152, 2),
   TMC(153, 518), TMC(155, 519), TMC(156, 520), TMC(157, 323)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op integer_bit_width_TY_DEF x = x
    val op integer_bit_width_TY_DEF =
    DT(((("abi_utilities",0),
        [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%336%147%431%130%303$0@%422%366%367%367%366%445@@@@@@|@$0@|@"])
  fun op integer_bit_width_BIJ x = x
    val op integer_bit_width_BIJ =
    DT(((("abi_utilities",1),
        [("abi_utilities",[0]),("bool",[117])]),["DISK_THM"]),
       [read"%301%279%32%315%471%462$0@@@$0@|@@%280%135%310%130%303$0@%422%366%367%367%366%445@@@@@@|$0@@%316%462%471$0@@@$0@@|@@"])





















  fun op integer_bit_width_size_def x = x
    val op integer_bit_width_size_def =
    DT(((("abi_utilities",32),[]),[]), [read"%279%215%316%465$0@@%302@|@"])
  fun op integer_bit_width_CASE x = x
    val op integer_bit_width_CASE =
    DT(((("abi_utilities",33),[]),[]),
       [read"%279%215%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463$21@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%129%372%303$0@%422%367%367%366%445@@@@@@%372%303$0@%422%367%366%445@@@@@%372%303$0@%422%366%445@@@@$21@%372%303$0@%422%367%445@@@@$20@%372%316$0@%422%367%445@@@@$19@$18@@@@%372%303$0@%422%367%367%445@@@@@%372%316$0@%422%367%366%445@@@@@$17@$16@@%372%303$0@%422%366%366%366%445@@@@@@$15@%372%303$0@%422%367%366%366%445@@@@@@$14@%372%316$0@%422%367%366%366%445@@@@@@$13@$12@@@@@@%372%303$0@%422%366%366%366%366%445@@@@@@@%372%303$0@%422%367%366%367%445@@@@@@%372%316$0@%422%367%367%366%445@@@@@@$11@$10@@%372%303$0@%422%366%367%367%445@@@@@@$9@%372%316$0@%422%366%367%367%445@@@@@@$8@$7@@@@%372%303$0@%422%366%367%366%366%445@@@@@@@%372%316$0@%422%366%366%366%366%445@@@@@@@$6@$5@@%372%303$0@%422%367%367%366%366%445@@@@@@@$4@%372%303$0@%422%366%366%367%366%445@@@@@@@$3@%372%316$0@%422%366%366%367%366%445@@@@@@@$2@$1@@@@@@|%462$21@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op natural_of_integer_bit_width_def x = x
    val op natural_of_integer_bit_width_def =
    DT(((("abi_utilities",40),[]),[]),
       [read"%279%122%316%470$0@@%464$0@%422%367%366%366%445@@@@@%422%367%366%367%445@@@@@%422%367%366%367%445@@@@@%422%367%367%367%445@@@@@%422%366%366%366%366%445@@@@@@%422%366%366%366%366%445@@@@@@%422%367%366%366%366%445@@@@@@%422%367%366%366%366%445@@@@@@%422%367%366%367%366%445@@@@@@%422%367%366%366%367%445@@@@@@%422%366%366%367%367%445@@@@@@%422%367%367%367%367%445@@@@@@%422%367%366%366%366%366%445@@@@@@@%422%367%366%366%366%367%445@@@@@@@%422%367%366%366%366%366%366%445@@@@@@@@%422%367%366%366%366%366%366%366%445@@@@@@@@@%422%367%366%366%366%445@@@@@@%422%367%366%366%367%445@@@@@@%422%367%366%366%366%366%445@@@@@@@%422%367%366%366%366%367%445@@@@@@@%422%367%366%366%366%366%366%445@@@@@@@@@|@"])
  fun op relocation_operator_TY_DEF x = x
    val op relocation_operator_TY_DEF =
    DT(((("abi_utilities",41),
        [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%344%149%432%130%303$0@%422%366%367%367%366%445@@@@@@|@$0@|@"])
  fun op relocation_operator_BIJ x = x
    val op relocation_operator_BIJ =
    DT(((("abi_utilities",42),
        [("abi_utilities",[41]),("bool",[117])]),["DISK_THM"]),
       [read"%301%289%38%326%472%489$0@@@$0@|@@%280%135%310%130%303$0@%422%366%367%367%366%445@@@@@@|$0@@%316%489%472$0@@@$0@@|@@"])





















  fun op relocation_operator_size_def x = x
    val op relocation_operator_size_def =
    DT(((("abi_utilities",73),[]),[]), [read"%289%216%316%498$0@@%302@|@"])
  fun op relocation_operator_CASE x = x
    val op relocation_operator_CASE =
    DT(((("abi_utilities",74),[]),[]),
       [read"%289%216%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490$21@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%129%372%303$0@%422%367%367%366%445@@@@@@%372%303$0@%422%367%366%445@@@@@%372%303$0@%422%366%445@@@@$21@%372%303$0@%422%367%445@@@@$20@%372%316$0@%422%367%445@@@@$19@$18@@@@%372%303$0@%422%367%367%445@@@@@%372%316$0@%422%367%366%445@@@@@$17@$16@@%372%303$0@%422%366%366%366%445@@@@@@$15@%372%303$0@%422%367%366%366%445@@@@@@$14@%372%316$0@%422%367%366%366%445@@@@@@$13@$12@@@@@@%372%303$0@%422%366%366%366%366%445@@@@@@@%372%303$0@%422%367%366%367%445@@@@@@%372%316$0@%422%367%367%366%445@@@@@@$11@$10@@%372%303$0@%422%366%367%367%445@@@@@@$9@%372%316$0@%422%366%367%367%445@@@@@@$8@$7@@@@%372%303$0@%422%366%367%366%366%445@@@@@@@%372%316$0@%422%366%366%366%366%445@@@@@@@$6@$5@@%372%303$0@%422%367%367%366%366%445@@@@@@@$4@%372%303$0@%422%366%366%367%366%445@@@@@@@$3@%372%316$0@%422%366%366%367%366%445@@@@@@@$2@$1@@@@@@|%489$21@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op relocation_operator2_TY_DEF x = x
    val op relocation_operator2_TY_DEF =
    DT(((("abi_utilities",81),
        [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%346%150%433%130%303$0@%422%366%445@@@|@$0@|@"])
  fun op relocation_operator2_BIJ x = x
    val op relocation_operator2_BIJ =
    DT(((("abi_utilities",82),
        [("abi_utilities",[81]),("bool",[117])]),["DISK_THM"]),
       [read"%301%290%39%327%473%486$0@@@$0@|@@%280%135%310%130%303$0@%422%366%445@@@|$0@@%316%486%473$0@@@$0@@|@@"])

  fun op relocation_operator2_size_def x = x
    val op relocation_operator2_size_def =
    DT(((("abi_utilities",93),[]),[]), [read"%290%217%316%488$0@@%302@|@"])
  fun op relocation_operator2_CASE x = x
    val op relocation_operator2_CASE =
    DT(((("abi_utilities",94),[]),[]),
       [read"%290%217%239%163%304%487$1@$0@@%129$1|%486$1@@@|@|@"])
  fun op lookupM_def x = x
    val op lookupM_def =
    DT(((("abi_utilities",101),[]),[]),
       [read"%240%128%246%214%312%468$1@$0@@%474%386$0@$1@@%453%373%371%422%367%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%367%366%366%445@@@@@@@@@%373%371%422%367%367%366%367%367%445@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%366%367%366%367%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%367%366%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%367%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%366%367%445@@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%367%367%445@@@@@@@@@%421@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%126%499$0@|@@|@|@"])
  fun op can_fail_TY_DEF x = x
    val op can_fail_TY_DEF =
    DT(((("abi_utilities",102),[("bool",[26])]),["DISK_THM"]),
       [read"%334%146%435%51%270%4%329%286%51%329%446%323$0@%375%302@%360@%130%369|@@@%446%332%31%323$1@%31%375%427%302@@$0@%130%369|@|$0@@|@@%323$0@%375%427%427%302@@@%360@%130%369|@@@@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op can_fail_case_def x = x
    val op can_fail_case_def =
    DT(((("abi_utilities",110),
        [("abi_utilities",[103,104,105,106,107,108,109]),("bool",[26,181]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%301%240%158%254%81%240%166%305%449%377@$2@$1@$0@@$2@|@|@|@@%301%248%31%240%158%254%81%240%166%305%449%378$3@@$2@$1@$0@@$1$3@@|@|@|@|@@%240%158%254%81%240%166%305%449%379@$2@$1@$0@@$0@|@|@|@@@"])
  fun op can_fail_size_def x = x
    val op can_fail_size_def =
    DT(((("abi_utilities",111),
        [("abi_utilities",[103,104,105,106,107,108,109]),("bool",[26,181]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%301%249%78%316%450$0@%377@@%302@|@@%301%249%78%248%31%316%450$1@%378$0@@@%422%366%445@@@|@|@@%249%78%316%450$0@%379@@%302@|@@@"])
  fun op relocation_operator_expression_TY_DEF x = x
    val op relocation_operator_expression_TY_DEF =
    DT(((("abi_utilities",119),
        [("bool",[14,25,26,53,132,133,138])]),["DISK_THM"]),
       [read"%348%151%436%56%271%6%271%0%271%1%271%2%271%3%329%301%287%56%329%446%330%29%324$1@%29%376%302@%294$0@%297%363@%295%361@%362@@@@%130%370|@|$0@@|@@%446%355%37%301%324$1@%37%376%427%302@@%294%358@%297%363@%295%361@%362@@@@%385$0@%130%370|@@|$0@@@$3$0@@|@@%446%355%37%301%324$1@%37%376%427%427%302@@@%294%358@%297%363@%295%361@%362@@@@%385$0@%130%370|@@|$0@@@$5$0@@|@@%446%355%37%301%324$1@%37%376%427%427%427%302@@@@%294%358@%297%363@%295%361@%362@@@@%385$0@%130%370|@@|$0@@@$2$0@@|@@%446%355%37%301%324$1@%37%376%427%427%427%427%302@@@@@%294%358@%297%363@%295%361@%362@@@@%385$0@%130%370|@@|$0@@@$2$0@@|@@%355%37%301%324$1@%37%376%427%427%427%427%427%302@@@@@@%294%358@%297%363@%295%361@%362@@@@%385$0@%130%370|@@|$0@@@$4$0@@|@@@@@@@$5$0@@|@@%301%287%61%329%357%54%355%59%301%324$2@%54%59%376%427%427%427%427%427%427%302@@@@@@@%294%358@%297$1@%295%361@%362@@@@%385$0@%130%370|@@||$1@$0@@@$3$0@@|@|@@$4$0@@|@@%301%287%62%329%355%52%350%57%301%324$2@%52%57%376%427%427%427%427%427%427%427%302@@@@@@@@%294%358@%297%363@%295$0@%362@@@@%385$1@%130%370|@@||$1@$0@@@$7$1@@|@|@@$3$0@@|@@%301%287%63%329%356%53%355%59%301%324$2@%53%59%376%427%427%427%427%427%427%427%427%302@@@@@@@@@%294%358@%297%363@%295%361@$1@@@@%385$0@%130%370|@@||$1@$0@@@$7$0@@|@|@@$2$0@@|@@%287%64%329%355%52%355%59%301%324$2@%52%59%376%427%427%427%427%427%427%427%427%427%302@@@@@@@@@@%294%358@%297%363@%295%361@%362@@@@%385$1@%385$0@%130%370|@@@||$1@$0@@@%301$7$1@@$7$0@@@|@|@@$1$0@@|@@@@@@$4$5@@|@|@|@|@|@|@$0@|@"])
  fun op relocation_operator_expression_case_def x = x
    val op relocation_operator_expression_case_def =
    DT(((("abi_utilities",151),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,31,36,51,53,56,58,60,63,105,124,132,133,138,181]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%301%239%29%247%76%257%94%260%98%266%101%266%104%263%107%305%495%416$6@@$5@$4@$3@$2@$1@$0@@$5$6@@|@|@|@|@|@|@|@@%301%281%33%247%76%257%94%260%98%266%101%266%104%263%107%305%495%364$6@@$5@$4@$3@$2@$1@$0@@$4$6@@|@|@|@|@|@|@|@@%301%282%34%247%76%257%94%260%98%266%101%266%104%263%107%305%495%365$6@@$5@$4@$3@$2@$1@$0@@$3$6@@|@|@|@|@|@|@|@@%301%284%36%247%76%257%94%260%98%266%101%266%104%263%107%305%495%425$6@@$5@$4@$3@$2@$1@$0@@$2$6@@|@|@|@|@|@|@|@@%301%284%36%247%76%257%94%260%98%266%101%266%104%263%107%305%495%420$6@@$5@$4@$3@$2@$1@$0@@$1$6@@|@|@|@|@|@|@|@@%283%35%247%76%257%94%260%98%266%101%266%104%263%107%305%495%426$6@@$5@$4@$3@$2@$1@$0@@$0$6@@|@|@|@|@|@|@|@@@@@@"])
  fun op relocation_operator_expression_size_def x = x
    val op relocation_operator_expression_size_def =
    DT(((("abi_utilities",152),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,31,36,51,53,56,58,60,63,105,124,132,133,138,181]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%301%249%78%239%29%316%496$1@%416$0@@@%293%422%366%445@@@$1$0@@@|@|@@%301%249%78%281%33%316%496$1@%364$0@@@%293%422%366%445@@@%493$1@$0@@@|@|@@%301%249%78%282%34%316%496$1@%365$0@@@%293%422%366%445@@@%491$1@$0@@@|@|@@%301%249%78%284%36%316%496$1@%425$0@@@%293%422%366%445@@@%494$1@$0@@@|@|@@%301%249%78%284%36%316%496$1@%420$0@@@%293%422%366%445@@@%494$1@$0@@@|@|@@%301%249%78%283%35%316%496$1@%426$0@@@%293%422%366%445@@@%492$1@$0@@@|@|@@%301%249%78%290%54%284%58%316%491$2@%298$1@$0@@@%293%422%366%445@@@%293%488$1@@%494$2@$0@@@@|@|@|@@%301%249%78%291%55%280%57%316%492$2@%299$1@$0@@@%293%422%366%445@@@%293%496$2@$1@@$0@@@|@|@|@@%301%249%78%289%53%291%60%316%493$2@%296$1@$0@@@%293%422%366%445@@@%293%498$1@@%496$2@$0@@@@|@|@|@@%249%78%291%55%291%60%316%494$2@%300$1@$0@@@%293%422%366%445@@@%293%496$2@$1@@%496$2@$0@@@@|@|@|@@@@@@@@@@"])
  fun op relocation_frame_TY_DEF x = x
    val op relocation_frame_TY_DEF =
    DT(((("abi_utilities",160),[("bool",[26])]),["DISK_THM"]),
       [read"%342%148%434%50%269%5%329%285%50%329%446%322$0@%374%302@%359@%130%368|@@@%331%30%322$1@%30%374%427%302@@$0@%130%368|@|$0@@|@@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op relocation_frame_case_def x = x
    val op relocation_frame_case_def =
    DT(((("abi_utilities",166),
        [("abi_utilities",[161,162,163,164,165]),("bool",[26,181]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%301%239%157%253%80%304%484%380@$1@$0@@$1@|@|@@%245%30%239%157%253%80%304%484%423$2@@$1@$0@@$0$2@@|@|@|@@"])
  fun op relocation_frame_size_def x = x
    val op relocation_frame_size_def =
    DT(((("abi_utilities",167),
        [("abi_utilities",[161,162,163,164,165]),("bool",[26,181]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%301%250%79%251%91%316%485$1@$0@%380@@%302@|@|@@%250%79%251%91%245%30%316%485$2@$1@%423$0@@@%293%422%366%445@@@%455%127%302|@%160%293%422%366%445@@@%482%497$2@@%481%465@%451$2@@@$0@@|@$0@@@|@|@|@@"])
  fun op size_of_def_def x = x
    val op size_of_def_def =
    DT(((("abi_utilities",175),[]),[]),
       [read"%292%154%316%501$0@@%504%452%503%502$0@@@@@|@"])
  fun op size_of_copy_reloc_def x = x
    val op size_of_copy_reloc_def =
    DT(((("abi_utilities",176),[]),[]),
       [read"%239%123%292%154%316%500$1@$0@@%501$0@@|@|@"])
  fun op reloc_site_address_def x = x
    val op reloc_site_address_def =
    DT(((("abi_utilities",177),[]),[]),
       [read"%241%69%242%70%243%124%292%154%316%483$3@$2@$1@$0@@%413%121%466$0@%454%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%367%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%367%366%367%367%445@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%367%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%366%366%366%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%421@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%193%198%466$0@%480$1@%171%174%477$0@%454%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%367%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%367%366%367%367%445@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%366%366%367%366%367%445@@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%421@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%159%478$0@%72%73%414%74%414%155%293$1@$0@|@%479$1@%156%167$1||@@|@%475%387%448$9@@$1@@%454%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%367%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%367%366%367%367%445@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%367%366%445@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%367%367%367%445@@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%421@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%71%476%469$0@@%454%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%367%367%366%367%367%445@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%367%366%367%367%366%367%445@@@@@@@@@%373%371%422%367%367%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%367%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%366%367%445@@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%366%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%366%366%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%367%367%366%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%366%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%366%366%367%366%367%445@@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%366%366%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%367%366%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%366%367%445@@@@@@@@@%421@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%65$0|@|@@||@|@||@@%205%208%454%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%367%367%366%367%367%445@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%367%366%367%445@@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%367%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%366%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%367%366%366%367%367%445@@@@@@@@@%373%371%422%366%366%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%367%366%366%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%366%366%367%445@@@@@@@@@%373%371%422%366%367%367%367%366%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%373%371%422%367%366%366%366%366%445@@@@@@@@%373%371%422%366%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%366%367%366%367%445@@@@@@@@@%373%371%422%367%366%367%366%367%367%445@@@@@@@@@%373%371%422%366%367%367%366%366%367%445@@@@@@@@@%421@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@||@||@|@%467%457$3@$2@@%456%460%459@%461%458@%458@@@@%321@%428$0@@%447$1@@@@|@|@|@|@"])
  fun op num2integer_bit_width_integer_bit_width2num x = x
    val op num2integer_bit_width_integer_bit_width2num =
    DT(((("abi_utilities",2),[("abi_utilities",[1])]),["DISK_THM"]),
       [read"%279%32%315%471%462$0@@@$0@|@"])
  fun op integer_bit_width2num_num2integer_bit_width x = x
    val op integer_bit_width2num_num2integer_bit_width =
    DT(((("abi_utilities",3),[("abi_utilities",[1])]),["DISK_THM"]),
       [read"%280%135%310%303$0@%422%366%367%367%366%445@@@@@@@%316%462%471$0@@@$0@@|@"])
  fun op num2integer_bit_width_11 x = x
    val op num2integer_bit_width_11 =
    DT(((("abi_utilities",4),
        [("abi_utilities",[1]),("bool",[26])]),["DISK_THM"]),
       [read"%280%135%280%139%329%303$1@%422%366%367%367%366%445@@@@@@@%329%303$0@%422%366%367%367%366%445@@@@@@@%310%315%471$1@@%471$0@@@%316$1@$0@@@@|@|@"])
  fun op integer_bit_width2num_11 x = x
    val op integer_bit_width2num_11 =
    DT(((("abi_utilities",5),
        [("abi_utilities",[1]),("bool",[26])]),["DISK_THM"]),
       [read"%279%32%279%43%310%316%462$1@@%462$0@@@%315$1@$0@@|@|@"])
  fun op num2integer_bit_width_ONTO x = x
    val op num2integer_bit_width_ONTO =
    DT(((("abi_utilities",6),
        [("abi_utilities",[1]),("bool",[25,63])]),["DISK_THM"]),
       [read"%279%32%350%135%301%315$1@%471$0@@@%303$0@%422%366%367%367%366%445@@@@@@@|@|@"])
  fun op integer_bit_width2num_ONTO x = x
    val op integer_bit_width2num_ONTO =
    DT(((("abi_utilities",7),
        [("abi_utilities",[1]),("bool",[26])]),["DISK_THM"]),
       [read"%280%135%310%303$0@%422%366%367%367%366%445@@@@@@@%349%32%316$1@%462$0@@|@@|@"])
  fun op num2integer_bit_width_thm x = x
    val op num2integer_bit_width_thm =
    DT(((("abi_utilities",29),
        [("abi_utilities",
         [8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,
          28])]),[]),
       [read"%301%315%471%302@@%410@@%301%315%471%422%366%445@@@@%401@@%301%315%471%422%367%445@@@@%437@@%301%315%471%422%366%366%445@@@@@%418@@%301%315%471%422%367%366%445@@@@@%438@@%301%315%471%422%366%367%445@@@@@%402@@%301%315%471%422%367%367%445@@@@@%403@@%301%315%471%422%366%366%366%445@@@@@@%395@@%301%315%471%422%367%366%366%445@@@@@@%404@@%301%315%471%422%366%367%366%445@@@@@@%419@@%301%315%471%422%367%367%366%445@@@@@@%405@@%301%315%471%422%366%366%367%445@@@@@@%444@@%301%315%471%422%367%366%367%445@@@@@@%406@@%301%315%471%422%366%367%367%445@@@@@@%407@@%301%315%471%422%367%367%367%445@@@@@@%408@@%301%315%471%422%366%366%366%366%445@@@@@@@%409@@%301%315%471%422%367%366%366%366%445@@@@@@@%439@@%301%315%471%422%366%367%366%366%445@@@@@@@%440@@%301%315%471%422%367%367%366%366%445@@@@@@@%441@@%301%315%471%422%366%366%367%366%445@@@@@@@%442@@%315%471%422%367%366%367%366%445@@@@@@@%443@@@@@@@@@@@@@@@@@@@@@"])
  fun op integer_bit_width2num_thm x = x
    val op integer_bit_width2num_thm =
    DT(((("abi_utilities",30),
        [("abi_utilities",
         [3,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]),
         ("bool",[25,54]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%301%316%462%410@@%302@@%301%316%462%401@@%422%366%445@@@@%301%316%462%437@@%422%367%445@@@@%301%316%462%418@@%422%366%366%445@@@@@%301%316%462%438@@%422%367%366%445@@@@@%301%316%462%402@@%422%366%367%445@@@@@%301%316%462%403@@%422%367%367%445@@@@@%301%316%462%395@@%422%366%366%366%445@@@@@@%301%316%462%404@@%422%367%366%366%445@@@@@@%301%316%462%419@@%422%366%367%366%445@@@@@@%301%316%462%405@@%422%367%367%366%445@@@@@@%301%316%462%444@@%422%366%366%367%445@@@@@@%301%316%462%406@@%422%367%366%367%445@@@@@@%301%316%462%407@@%422%366%367%367%445@@@@@@%301%316%462%408@@%422%367%367%367%445@@@@@@%301%316%462%409@@%422%366%366%366%366%445@@@@@@@%301%316%462%439@@%422%367%366%366%366%445@@@@@@@%301%316%462%440@@%422%366%367%366%366%445@@@@@@@%301%316%462%441@@%422%367%367%366%366%445@@@@@@@%301%316%462%442@@%422%366%366%367%366%445@@@@@@@%316%462%443@@%422%367%366%367%366%445@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op integer_bit_width_EQ_integer_bit_width x = x
    val op integer_bit_width_EQ_integer_bit_width =
    DT(((("abi_utilities",31),
        [("abi_utilities",[5]),("bool",[58])]),["DISK_THM"]),
       [read"%279%32%279%43%310%315$1@$0@@%316%462$1@@%462$0@@@|@|@"])
  fun op integer_bit_width_case_def x = x
    val op integer_bit_width_case_def =
    DT(((("abi_utilities",34),
        [("abi_utilities",[30,33]),("bool",[54,56,64]),
         ("numeral",[3,6,7])]),["DISK_THM"]),
       [read"%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%410@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$20@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%401@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$19@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%437@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$18@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%418@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$17@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%438@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$16@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%402@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$15@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%403@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$14@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%395@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$13@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%404@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$12@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%419@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$11@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%405@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$10@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%444@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$9@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%406@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$8@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%407@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$7@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%408@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$6@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%409@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$5@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%439@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$4@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%440@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$3@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%441@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$2@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%442@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$1@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%463%443@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$0@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@@@@@@@@@@"])
  fun op datatype_integer_bit_width x = x
    val op datatype_integer_bit_width =
    DT(((("abi_utilities",35),[("bool",[25,171])]),["DISK_THM"]),
       [read"%381%125%410@%401@%437@%418@%438@%402@%403@%395@%404@%419@%405@%444@%406@%407@%408@%409@%439@%440@%441@%442@%443@@"])
  fun op integer_bit_width_case_cong x = x
    val op integer_bit_width_case_cong =
    DT(((("abi_utilities",36),
        [("abi_utilities",
         [6,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,
          34]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,58,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,15,16,17]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%279%8%279%14%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%329%301%315$22@$21@@%301%329%315$21@%410@@%304$20@%164@@@%301%329%315$21@%401@@%304$19@%168@@@%301%329%315$21@%437@@%304$18@%194@@@%301%329%315$21@%418@@%304$17@%199@@@%301%329%315$21@%438@@%304$16@%201@@@%301%329%315$21@%402@@%304$15@%203@@@%301%329%315$21@%403@@%304$14@%206@@@%301%329%315$21@%395@@%304$13@%209@@@%301%329%315$21@%404@@%304$12@%211@@@%301%329%315$21@%419@@%304$11@%213@@@%301%329%315$21@%405@@%304$10@%172@@@%301%329%315$21@%444@@%304$9@%175@@@%301%329%315$21@%406@@%304$8@%177@@@%301%329%315$21@%407@@%304$7@%179@@@%301%329%315$21@%408@@%304$6@%181@@@%301%329%315$21@%409@@%304$5@%183@@@%301%329%315$21@%439@@%304$4@%185@@@%301%329%315$21@%440@@%304$3@%187@@@%301%329%315$21@%441@@%304$2@%189@@@%301%329%315$21@%442@@%304$1@%191@@@%329%315$21@%443@@%304$0@%196@@@@@@@@@@@@@@@@@@@@@@@@%304%463$22@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%463$21@%164@%168@%194@%199@%201@%203@%206@%209@%211@%213@%172@%175@%177@%179@%181@%183@%185@%187@%189@%191@%196@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op integer_bit_width_nchotomy x = x
    val op integer_bit_width_nchotomy =
    DT(((("abi_utilities",37),
        [("abi_utilities",
         [6,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,58,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,15,16,17]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%279%32%446%315$0@%410@@%446%315$0@%401@@%446%315$0@%437@@%446%315$0@%418@@%446%315$0@%438@@%446%315$0@%402@@%446%315$0@%403@@%446%315$0@%395@@%446%315$0@%404@@%446%315$0@%419@@%446%315$0@%405@@%446%315$0@%444@@%446%315$0@%406@@%446%315$0@%407@@%446%315$0@%408@@%446%315$0@%409@@%446%315$0@%439@@%446%315$0@%440@@%446%315$0@%441@@%446%315$0@%442@@%315$0@%443@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op integer_bit_width_Axiom x = x
    val op integer_bit_width_Axiom =
    DT(((("abi_utilities",38),
        [("abi_utilities",[30]),("bool",[8,14,25,54,56,64]),
         ("numeral",[3,8])]),["DISK_THM"]),
       [read"%239%218%239%219%239%230%239%232%239%233%239%234%239%235%239%236%239%237%239%238%239%220%239%221%239%222%239%223%239%224%239%225%239%226%239%227%239%228%239%229%239%231%335%82%301%304$0%410@@$21@@%301%304$0%401@@$20@@%301%304$0%437@@$19@@%301%304$0%418@@$18@@%301%304$0%438@@$17@@%301%304$0%402@@$16@@%301%304$0%403@@$15@@%301%304$0%395@@$14@@%301%304$0%404@@$13@@%301%304$0%419@@$12@@%301%304$0%405@@$11@@%301%304$0%444@@$10@@%301%304$0%406@@$9@@%301%304$0%407@@$8@@%301%304$0%408@@$7@@%301%304$0%409@@$6@@%301%304$0%439@@$5@@%301%304$0%440@@$4@@%301%304$0%441@@$3@@%301%304$0%442@@$2@@%304$0%443@@$1@@@@@@@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op integer_bit_width_induction x = x
    val op integer_bit_width_induction =
    DT(((("abi_utilities",39),
        [("abi_utilities",
         [6,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,58,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,15,16,17]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%255%20%329%301$0%395@@%301$0%401@@%301$0%402@@%301$0%403@@%301$0%404@@%301$0%405@@%301$0%406@@%301$0%407@@%301$0%408@@%301$0%409@@%301$0%410@@%301$0%418@@%301$0%419@@%301$0%437@@%301$0%438@@%301$0%439@@%301$0%440@@%301$0%441@@%301$0%442@@%301$0%443@@$0%444@@@@@@@@@@@@@@@@@@@@@@%279%32$1$0@|@@|@"])
  fun op num2relocation_operator_relocation_operator2num x = x
    val op num2relocation_operator_relocation_operator2num =
    DT(((("abi_utilities",43),[("abi_utilities",[42])]),["DISK_THM"]),
       [read"%289%38%326%472%489$0@@@$0@|@"])
  fun op relocation_operator2num_num2relocation_operator x = x
    val op relocation_operator2num_num2relocation_operator =
    DT(((("abi_utilities",44),[("abi_utilities",[42])]),["DISK_THM"]),
       [read"%280%135%310%303$0@%422%366%367%367%366%445@@@@@@@%316%489%472$0@@@$0@@|@"])
  fun op num2relocation_operator_11 x = x
    val op num2relocation_operator_11 =
    DT(((("abi_utilities",45),
        [("abi_utilities",[42]),("bool",[26])]),["DISK_THM"]),
       [read"%280%135%280%139%329%303$1@%422%366%367%367%366%445@@@@@@@%329%303$0@%422%366%367%367%366%445@@@@@@@%310%326%472$1@@%472$0@@@%316$1@$0@@@@|@|@"])
  fun op relocation_operator2num_11 x = x
    val op relocation_operator2num_11 =
    DT(((("abi_utilities",46),
        [("abi_utilities",[42]),("bool",[26])]),["DISK_THM"]),
       [read"%289%38%289%48%310%316%489$1@@%489$0@@@%326$1@$0@@|@|@"])
  fun op num2relocation_operator_ONTO x = x
    val op num2relocation_operator_ONTO =
    DT(((("abi_utilities",47),
        [("abi_utilities",[42]),("bool",[25,63])]),["DISK_THM"]),
       [read"%289%38%350%135%301%326$1@%472$0@@@%303$0@%422%366%367%367%366%445@@@@@@@|@|@"])
  fun op relocation_operator2num_ONTO x = x
    val op relocation_operator2num_ONTO =
    DT(((("abi_utilities",48),
        [("abi_utilities",[42]),("bool",[26])]),["DISK_THM"]),
       [read"%280%135%310%303$0@%422%366%367%367%366%445@@@@@@@%356%38%316$1@%489$0@@|@@|@"])
  fun op num2relocation_operator_thm x = x
    val op num2relocation_operator_thm =
    DT(((("abi_utilities",70),
        [("abi_utilities",
         [49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,
          69])]),[]),
       [read"%301%326%472%302@@%430@@%301%326%472%422%366%445@@@@%415@@%301%326%472%422%367%445@@@@%382@@%301%326%472%422%366%366%445@@@@@%383@@%301%326%472%422%367%366%445@@@@@%424@@%301%326%472%422%366%367%445@@@@@%389@@%301%326%472%422%367%367%445@@@@@%388@@%301%326%472%422%366%366%366%445@@@@@@%390@@%301%326%472%422%367%366%366%445@@@@@@%393@@%301%326%472%422%366%367%366%445@@@@@@%391@@%301%326%472%422%367%367%366%445@@@@@@%384@@%301%326%472%422%366%366%367%445@@@@@@%412@@%301%326%472%422%367%366%367%445@@@@@@%429@@%301%326%472%422%366%367%367%445@@@@@@%411@@%301%326%472%422%367%367%367%445@@@@@@%417@@%301%326%472%422%366%366%366%366%445@@@@@@@%396@@%301%326%472%422%367%366%366%366%445@@@@@@@%394@@%301%326%472%422%366%367%366%366%445@@@@@@@%397@@%301%326%472%422%367%367%366%366%445@@@@@@@%398@@%301%326%472%422%366%366%367%366%445@@@@@@@%399@@%326%472%422%367%366%367%366%445@@@@@@@%400@@@@@@@@@@@@@@@@@@@@@"])
  fun op relocation_operator2num_thm x = x
    val op relocation_operator2num_thm =
    DT(((("abi_utilities",71),
        [("abi_utilities",
         [44,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,
          69]),("bool",[25,54]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%301%316%489%430@@%302@@%301%316%489%415@@%422%366%445@@@@%301%316%489%382@@%422%367%445@@@@%301%316%489%383@@%422%366%366%445@@@@@%301%316%489%424@@%422%367%366%445@@@@@%301%316%489%389@@%422%366%367%445@@@@@%301%316%489%388@@%422%367%367%445@@@@@%301%316%489%390@@%422%366%366%366%445@@@@@@%301%316%489%393@@%422%367%366%366%445@@@@@@%301%316%489%391@@%422%366%367%366%445@@@@@@%301%316%489%384@@%422%367%367%366%445@@@@@@%301%316%489%412@@%422%366%366%367%445@@@@@@%301%316%489%429@@%422%367%366%367%445@@@@@@%301%316%489%411@@%422%366%367%367%445@@@@@@%301%316%489%417@@%422%367%367%367%445@@@@@@%301%316%489%396@@%422%366%366%366%366%445@@@@@@@%301%316%489%394@@%422%367%366%366%366%445@@@@@@@%301%316%489%397@@%422%366%367%366%366%445@@@@@@@%301%316%489%398@@%422%367%367%366%366%445@@@@@@@%301%316%489%399@@%422%366%366%367%366%445@@@@@@@%316%489%400@@%422%367%366%367%366%445@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op relocation_operator_EQ_relocation_operator x = x
    val op relocation_operator_EQ_relocation_operator =
    DT(((("abi_utilities",72),
        [("abi_utilities",[46]),("bool",[58])]),["DISK_THM"]),
       [read"%289%38%289%48%310%326$1@$0@@%316%489$1@@%489$0@@@|@|@"])
  fun op relocation_operator_case_def x = x
    val op relocation_operator_case_def =
    DT(((("abi_utilities",75),
        [("abi_utilities",[71,74]),("bool",[54,56,64]),
         ("numeral",[3,6,7])]),["DISK_THM"]),
       [read"%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%430@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$20@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%415@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$19@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%382@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$18@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%383@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$17@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%424@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$16@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%389@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$15@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%388@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$14@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%390@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$13@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%393@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$12@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%391@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$11@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%384@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$10@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%412@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$9@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%429@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$8@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%411@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$7@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%417@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$6@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%396@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$5@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%394@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$4@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%397@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$3@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%398@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$2@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%301%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%399@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$1@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%304%490%400@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$0@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@@@@@@@@@@"])
  fun op datatype_relocation_operator x = x
    val op datatype_relocation_operator =
    DT(((("abi_utilities",76),[("bool",[25,171])]),["DISK_THM"]),
       [read"%381%143%430@%415@%382@%383@%424@%389@%388@%390@%393@%391@%384@%412@%429@%411@%417@%396@%394@%397@%398@%399@%400@@"])
  fun op relocation_operator_case_cong x = x
    val op relocation_operator_case_cong =
    DT(((("abi_utilities",77),
        [("abi_utilities",
         [47,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,
          69,75]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,58,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,15,16,17]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%289%10%289%16%239%163%239%165%239%192%239%197%239%200%239%202%239%204%239%207%239%210%239%212%239%170%239%173%239%176%239%178%239%180%239%182%239%184%239%186%239%188%239%190%239%195%329%301%326$22@$21@@%301%329%326$21@%430@@%304$20@%164@@@%301%329%326$21@%415@@%304$19@%168@@@%301%329%326$21@%382@@%304$18@%194@@@%301%329%326$21@%383@@%304$17@%199@@@%301%329%326$21@%424@@%304$16@%201@@@%301%329%326$21@%389@@%304$15@%203@@@%301%329%326$21@%388@@%304$14@%206@@@%301%329%326$21@%390@@%304$13@%209@@@%301%329%326$21@%393@@%304$12@%211@@@%301%329%326$21@%391@@%304$11@%213@@@%301%329%326$21@%384@@%304$10@%172@@@%301%329%326$21@%412@@%304$9@%175@@@%301%329%326$21@%429@@%304$8@%177@@@%301%329%326$21@%411@@%304$7@%179@@@%301%329%326$21@%417@@%304$6@%181@@@%301%329%326$21@%396@@%304$5@%183@@@%301%329%326$21@%394@@%304$4@%185@@@%301%329%326$21@%397@@%304$3@%187@@@%301%329%326$21@%398@@%304$2@%189@@@%301%329%326$21@%399@@%304$1@%191@@@%329%326$21@%400@@%304$0@%196@@@@@@@@@@@@@@@@@@@@@@@@%304%490$22@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%490$21@%164@%168@%194@%199@%201@%203@%206@%209@%211@%213@%172@%175@%177@%179@%181@%183@%185@%187@%189@%191@%196@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op relocation_operator_nchotomy x = x
    val op relocation_operator_nchotomy =
    DT(((("abi_utilities",78),
        [("abi_utilities",
         [47,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,
          69]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,58,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,15,16,17]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%289%38%446%326$0@%430@@%446%326$0@%415@@%446%326$0@%382@@%446%326$0@%383@@%446%326$0@%424@@%446%326$0@%389@@%446%326$0@%388@@%446%326$0@%390@@%446%326$0@%393@@%446%326$0@%391@@%446%326$0@%384@@%446%326$0@%412@@%446%326$0@%429@@%446%326$0@%411@@%446%326$0@%417@@%446%326$0@%396@@%446%326$0@%394@@%446%326$0@%397@@%446%326$0@%398@@%446%326$0@%399@@%326$0@%400@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op relocation_operator_Axiom x = x
    val op relocation_operator_Axiom =
    DT(((("abi_utilities",79),
        [("abi_utilities",[71]),("bool",[8,14,25,54,56,64]),
         ("numeral",[3,8])]),["DISK_THM"]),
       [read"%239%218%239%219%239%230%239%232%239%233%239%234%239%235%239%236%239%237%239%238%239%220%239%221%239%222%239%223%239%224%239%225%239%226%239%227%239%228%239%229%239%231%343%83%301%304$0%430@@$21@@%301%304$0%415@@$20@@%301%304$0%382@@$19@@%301%304$0%383@@$18@@%301%304$0%424@@$17@@%301%304$0%389@@$16@@%301%304$0%388@@$15@@%301%304$0%390@@$14@@%301%304$0%393@@$13@@%301%304$0%391@@$12@@%301%304$0%384@@$11@@%301%304$0%412@@$10@@%301%304$0%429@@$9@@%301%304$0%411@@$8@@%301%304$0%417@@$7@@%301%304$0%396@@$6@@%301%304$0%394@@$5@@%301%304$0%397@@$4@@%301%304$0%398@@$3@@%301%304$0%399@@$2@@%304$0%400@@$1@@@@@@@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op relocation_operator_induction x = x
    val op relocation_operator_induction =
    DT(((("abi_utilities",80),
        [("abi_utilities",
         [47,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,
          69]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,58,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,15,16,17]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%273%22%329%301$0%382@@%301$0%383@@%301$0%384@@%301$0%388@@%301$0%389@@%301$0%390@@%301$0%391@@%301$0%393@@%301$0%394@@%301$0%396@@%301$0%397@@%301$0%398@@%301$0%399@@%301$0%400@@%301$0%411@@%301$0%412@@%301$0%415@@%301$0%417@@%301$0%424@@%301$0%429@@$0%430@@@@@@@@@@@@@@@@@@@@@@%289%38$1$0@|@@|@"])
  fun op num2relocation_operator2_relocation_operator22num x = x
    val op num2relocation_operator2_relocation_operator22num =
    DT(((("abi_utilities",83),[("abi_utilities",[82])]),["DISK_THM"]),
       [read"%290%39%327%473%486$0@@@$0@|@"])
  fun op relocation_operator22num_num2relocation_operator2 x = x
    val op relocation_operator22num_num2relocation_operator2 =
    DT(((("abi_utilities",84),[("abi_utilities",[82])]),["DISK_THM"]),
       [read"%280%135%310%303$0@%422%366%445@@@@%316%486%473$0@@@$0@@|@"])
  fun op num2relocation_operator2_11 x = x
    val op num2relocation_operator2_11 =
    DT(((("abi_utilities",85),
        [("abi_utilities",[82]),("bool",[26])]),["DISK_THM"]),
       [read"%280%135%280%139%329%303$1@%422%366%445@@@@%329%303$0@%422%366%445@@@@%310%327%473$1@@%473$0@@@%316$1@$0@@@@|@|@"])
  fun op relocation_operator22num_11 x = x
    val op relocation_operator22num_11 =
    DT(((("abi_utilities",86),
        [("abi_utilities",[82]),("bool",[26])]),["DISK_THM"]),
       [read"%290%39%290%49%310%316%486$1@@%486$0@@@%327$1@$0@@|@|@"])
  fun op num2relocation_operator2_ONTO x = x
    val op num2relocation_operator2_ONTO =
    DT(((("abi_utilities",87),
        [("abi_utilities",[82]),("bool",[25,63])]),["DISK_THM"]),
       [read"%290%39%350%135%301%327$1@%473$0@@@%303$0@%422%366%445@@@@|@|@"])
  fun op relocation_operator22num_ONTO x = x
    val op relocation_operator22num_ONTO =
    DT(((("abi_utilities",88),
        [("abi_utilities",[82]),("bool",[26])]),["DISK_THM"]),
       [read"%280%135%310%303$0@%422%366%445@@@@%357%39%316$1@%486$0@@|@@|@"])
  fun op num2relocation_operator2_thm x = x
    val op num2relocation_operator2_thm =
    DT(((("abi_utilities",90),[("abi_utilities",[89])]),[]),
       [read"%327%473%302@@%392@"])
  fun op relocation_operator22num_thm x = x
    val op relocation_operator22num_thm =
    DT(((("abi_utilities",91),
        [("abi_utilities",[84,89]),("bool",[25]),
         ("numeral",[3,7])]),["DISK_THM"]), [read"%316%486%392@@%302@"])
  fun op relocation_operator2_EQ_relocation_operator2 x = x
    val op relocation_operator2_EQ_relocation_operator2 =
    DT(((("abi_utilities",92),
        [("abi_utilities",[86]),("bool",[58])]),["DISK_THM"]),
       [read"%290%39%290%49%310%327$1@$0@@%316%486$1@@%486$0@@@|@|@"])
  fun op relocation_operator2_case_def x = x
    val op relocation_operator2_case_def =
    DT(((("abi_utilities",95),[("abi_utilities",[91,94])]),["DISK_THM"]),
       [read"%239%163%304%487%392@$0@@$0@|@"])
  fun op datatype_relocation_operator2 x = x
    val op datatype_relocation_operator2 =
    DT(((("abi_utilities",96),[("bool",[25,171])]),["DISK_THM"]),
       [read"%381%144%392@@"])
  fun op relocation_operator2_case_cong x = x
    val op relocation_operator2_case_cong =
    DT(((("abi_utilities",97),
        [("abi_utilities",[87,89,95]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%290%11%290%17%239%163%329%301%327$2@$1@@%329%327$1@%392@@%304$0@%164@@@@%304%487$2@$0@@%487$1@%164@@@|@|@|@"])
  fun op relocation_operator2_nchotomy x = x
    val op relocation_operator2_nchotomy =
    DT(((("abi_utilities",98),
        [("abi_utilities",[87,89]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%290%39%327$0@%392@|@"])
  fun op relocation_operator2_Axiom x = x
    val op relocation_operator2_Axiom =
    DT(((("abi_utilities",99),
        [("abi_utilities",[91]),("bool",[8,25,56])]),["DISK_THM"]),
       [read"%239%218%345%84%304$0%392@@$1@|@|@"])
  fun op relocation_operator2_induction x = x
    val op relocation_operator2_induction =
    DT(((("abi_utilities",100),
        [("abi_utilities",[87,89]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%275%23%329$0%392@@%290%39$1$0@|@@|@"])
  fun op datatype_can_fail x = x
    val op datatype_can_fail =
    DT(((("abi_utilities",112),[("bool",[25,171])]),["DISK_THM"]),
       [read"%381%67%377@%378@%379@@"])
  fun op can_fail_11 x = x
    val op can_fail_11 =
    DT(((("abi_utilities",113),
        [("abi_utilities",[103,104,105,106,107,108,109]),
         ("bool",[26,56,63,181]),("ind_type",[33,34])]),["DISK_THM"]),
       [read"%248%31%248%42%310%311%378$1@@%378$0@@@%314$1@$0@@|@|@"])
  fun op can_fail_distinct x = x
    val op can_fail_distinct =
    DT(((("abi_utilities",114),
        [("abi_utilities",[103,104,105,106,107,108,109]),
         ("bool",[25,26,36,47,51,54,56,63,181]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%301%248%31%505%311%377@%378$0@@@|@@%301%505%311%377@%379@@@%248%31%505%311%378$0@@%379@@|@@@"])
  fun op can_fail_case_cong x = x
    val op can_fail_case_cong =
    DT(((("abi_utilities",115),
        [("abi_utilities",[103,104,105,106,107,108,109,110]),
         ("bool",[26,181])]),["DISK_THM"]),
       [read"%244%7%244%13%240%158%254%81%240%166%329%301%311$4@$3@@%301%329%311$3@%377@@%305$2@%162@@@%301%248%31%329%311$4@%378$0@@@%305$2$0@@%87$0@@@|@@%329%311$3@%379@@%305$0@%169@@@@@@%305%449$4@$2@$1@$0@@%449$3@%162@%87@%169@@@|@|@|@|@|@"])
  fun op can_fail_nchotomy x = x
    val op can_fail_nchotomy =
    DT(((("abi_utilities",116),
        [("abi_utilities",[103,104,105,106,107,108,109]),
         ("bool",[26,181])]),["DISK_THM"]),
       [read"%244%68%446%311$0@%377@@%446%332%77%311$1@%378$0@@|@@%311$0@%379@@@|@"])
  fun op can_fail_Axiom x = x
    val op can_fail_Axiom =
    DT(((("abi_utilities",117),
        [("abi_utilities",[103,104,105,106,107,108,109]),("bool",[26,181]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%240%89%254%93%240%97%333%114%301%305$0%377@@$3@@%301%248%31%305$1%378$0@@@$3$0@@|@@%305$0%379@@$1@@@|@|@|@|@"])
  fun op can_fail_induction x = x
    val op can_fail_induction =
    DT(((("abi_utilities",118),
        [("abi_utilities",[103,104,105,106,107,108,109]),
         ("bool",[26])]),["DISK_THM"]),
       [read"%252%19%329%301$0%377@@%301%248%77$1%378$0@@|@@$0%379@@@@%244%66$1$0@|@@|@"])
  fun op datatype_relocation_operator_expression x = x
    val op datatype_relocation_operator_expression =
    DT(((("abi_utilities",153),[("bool",[25,171])]),["DISK_THM"]),
       [read"%381%145%416@%364@%365@%425@%420@%426@@"])
  fun op relocation_operator_expression_11 x = x
    val op relocation_operator_expression_11 =
    DT(((("abi_utilities",154),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,31,36,51,53,56,58,60,63,105,124,132,133,138,181]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%301%239%29%239%40%310%328%416$1@@%416$0@@@%304$1@$0@@|@|@@%301%281%33%281%44%310%328%364$1@@%364$0@@@%317$1@$0@@|@|@@%301%282%34%282%45%310%328%365$1@@%365$0@@@%318$1@$0@@|@|@@%301%284%36%284%47%310%328%425$1@@%425$0@@@%320$1@$0@@|@|@@%301%284%36%284%47%310%328%420$1@@%420$0@@@%320$1@$0@@|@|@@%283%35%283%46%310%328%426$1@@%426$0@@@%319$1@$0@@|@|@@@@@@"])
  fun op relocation_operator_expression_distinct x = x
    val op relocation_operator_expression_distinct =
    DT(((("abi_utilities",155),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,31,36,47,51,53,54,56,58,60,63,105,124,132,133,138,
          181]),("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%301%281%44%239%29%505%328%416$0@@%364$1@@@|@|@@%301%282%45%239%29%505%328%416$0@@%365$1@@@|@|@@%301%284%47%239%29%505%328%416$0@@%425$1@@@|@|@@%301%284%47%239%29%505%328%416$0@@%420$1@@@|@|@@%301%283%46%239%29%505%328%416$0@@%426$1@@@|@|@@%301%282%45%281%33%505%328%364$0@@%365$1@@@|@|@@%301%284%47%281%33%505%328%364$0@@%425$1@@@|@|@@%301%284%47%281%33%505%328%364$0@@%420$1@@@|@|@@%301%283%46%281%33%505%328%364$0@@%426$1@@@|@|@@%301%284%47%282%34%505%328%365$0@@%425$1@@@|@|@@%301%284%47%282%34%505%328%365$0@@%420$1@@@|@|@@%301%283%46%282%34%505%328%365$0@@%426$1@@@|@|@@%301%284%47%284%36%505%328%425$0@@%420$1@@@|@|@@%301%283%46%284%36%505%328%425$0@@%426$1@@@|@|@@%283%46%284%36%505%328%420$0@@%426$1@@@|@|@@@@@@@@@@@@@@@"])
  fun op relocation_operator_expression_case_cong x = x
    val op relocation_operator_expression_case_cong =
    DT(((("abi_utilities",156),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150,151]),
         ("bool",
         [14,15,25,26,31,36,51,53,56,58,60,63,105,124,132,133,138,181]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%291%12%291%18%247%76%257%94%260%98%266%101%266%104%263%107%329%301%328$7@$6@@%301%239%29%329%328$7@%416$0@@@%305$6$0@@%85$0@@@|@@%301%281%33%329%328$7@%364$0@@@%305$5$0@@%96$0@@@|@@%301%282%34%329%328$7@%365$0@@@%305$4$0@@%100$0@@@|@@%301%284%36%329%328$7@%425$0@@@%305$3$0@@%103$0@@@|@@%301%284%36%329%328$7@%420$0@@@%305$2$0@@%106$0@@@|@@%283%35%329%328$7@%426$0@@@%305$1$0@@%109$0@@@|@@@@@@@@%305%495$7@$5@$4@$3@$2@$1@$0@@%495$6@%85@%96@%100@%103@%106@%109@@@|@|@|@|@|@|@|@|@"])
  fun op relocation_operator_expression_nchotomy x = x
    val op relocation_operator_expression_nchotomy =
    DT(((("abi_utilities",157),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,31,36,51,53,56,58,60,63,105,124,132,133,138,181]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%291%153%446%330%29%328$1@%416$0@@|@@%446%351%131%328$1@%364$0@@|@@%446%352%132%328$1@%365$0@@|@@%446%354%134%328$1@%425$0@@|@@%446%354%134%328$1@%420$0@@|@@%353%133%328$1@%426$0@@|@@@@@@|@"])
  fun op relocation_operator_expression_Axiom x = x
    val op relocation_operator_expression_Axiom =
    DT(((("abi_utilities",158),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,31,36,51,53,56,58,60,63,105,124,132,133,138,181]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%247%90%259%95%262%99%268%102%268%105%265%108%276%110%256%111%274%112%278%113%347%116%338%117%339%118%337%119%340%120%301%239%29%305$5%416$0@@@$15$0@@|@@%301%281%33%305$5%364$0@@@$14$0@$2$0@@@|@@%301%282%34%305$5%365$0@@@$13$0@$4$0@@@|@@%301%284%36%305$5%425$0@@@$12$0@$1$0@@@|@@%301%284%36%305$5%420$0@@@$11$0@$1$0@@@|@@%301%283%35%305$5%426$0@@@$10$0@$3$0@@@|@@%301%290%54%284%58%306$5%298$1@$0@@@$10$1@$0@$2$0@@@|@|@@%301%291%55%280%57%307$4%299$1@$0@@@$9$0@$1@$6$1@@@|@|@@%301%289%53%291%60%308$3%296$1@$0@@@$8$1@$0@$6$0@@@|@|@@%291%55%291%60%309$2%300$1@$0@@@$7$1@$0@$6$1@@$6$0@@@|@|@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op relocation_operator_expression_induction x = x
    val op relocation_operator_expression_induction =
    DT(((("abi_utilities",159),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,31,36,51,53,56,58,60,63,105,124,132,133,138,181]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%277%24%261%25%264%26%258%27%267%28%329%301%239%29$5%416$0@@|@@%301%281%131%329$2$0@@$5%364$0@@@|@@%301%282%132%329$4$0@@$5%365$0@@@|@@%301%284%134%329$1$0@@$5%425$0@@@|@@%301%284%134%329$1$0@@$5%420$0@@@|@@%301%283%133%329$3$0@@$5%426$0@@@|@@%301%284%134%329$1$0@@%290%137$5%298$0@$1@@|@@|@@%301%291%138%329$5$0@@%280%130$4%299$1@$0@@|@@|@@%301%291%138%329$5$0@@%289%140$3%296$0@$1@@|@@|@@%291%138%291%141%329%301$6$1@@$6$0@@@$2%300$1@$0@@@|@|@@@@@@@@@@@%301%291%138$5$0@|@@%301%282%132$4$0@|@@%301%283%133$3$0@|@@%301%281%131$2$0@|@@%284%134$1$0@|@@@@@@|@|@|@|@|@"])
  fun op datatype_relocation_frame x = x
    val op datatype_relocation_frame =
    DT(((("abi_utilities",168),[("bool",[25,171])]),["DISK_THM"]),
       [read"%381%142%380@%423@@"])
  fun op relocation_frame_11 x = x
    val op relocation_frame_11 =
    DT(((("abi_utilities",169),
        [("abi_utilities",[161,162,163,164,165]),("bool",[26,56,63,181]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%245%30%245%41%310%325%423$1@@%423$0@@@%313$1@$0@@|@|@"])
  fun op relocation_frame_distinct x = x
    val op relocation_frame_distinct =
    DT(((("abi_utilities",170),
        [("abi_utilities",[161,162,163,164,165]),
         ("bool",[25,26,47,54,63,181]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%245%30%505%325%380@%423$0@@@|@"])
  fun op relocation_frame_case_cong x = x
    val op relocation_frame_case_cong =
    DT(((("abi_utilities",171),
        [("abi_utilities",[161,162,163,164,165,166]),
         ("bool",[26,181])]),["DISK_THM"]),
       [read"%288%9%288%15%239%157%253%80%329%301%325$3@$2@@%301%329%325$2@%380@@%304$1@%161@@@%245%30%329%325$3@%423$0@@@%304$1$0@@%86$0@@@|@@@@%304%484$3@$1@$0@@%484$2@%161@%86@@@|@|@|@|@"])
  fun op relocation_frame_nchotomy x = x
    val op relocation_frame_nchotomy =
    DT(((("abi_utilities",172),
        [("abi_utilities",[161,162,163,164,165]),
         ("bool",[26,181])]),["DISK_THM"]),
       [read"%288%152%446%325$0@%380@@%331%75%325$1@%423$0@@|@@|@"])
  fun op relocation_frame_Axiom x = x
    val op relocation_frame_Axiom =
    DT(((("abi_utilities",173),
        [("abi_utilities",[161,162,163,164,165]),("bool",[26,181]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%239%88%253%92%341%115%301%304$0%380@@$2@@%245%30%304$1%423$0@@@$2$0@@|@@|@|@|@"])
  fun op relocation_frame_induction x = x
    val op relocation_frame_induction =
    DT(((("abi_utilities",174),
        [("abi_utilities",[161,162,163,164,165]),
         ("bool",[26])]),["DISK_THM"]),
       [read"%272%21%329%301$0%380@@%245%75$1%423$0@@|@@@%288%136$1$0@|@@|@"])
  end
  val _ = DB.bindl "abi_utilities"
  [("integer_bit_width_TY_DEF",integer_bit_width_TY_DEF,DB.Def),
   ("integer_bit_width_BIJ",integer_bit_width_BIJ,DB.Def),
   ("integer_bit_width_size_def",integer_bit_width_size_def,DB.Def),
   ("integer_bit_width_CASE",integer_bit_width_CASE,DB.Def),
   ("natural_of_integer_bit_width_def",
    natural_of_integer_bit_width_def,
    DB.Def),
   ("relocation_operator_TY_DEF",relocation_operator_TY_DEF,DB.Def),
   ("relocation_operator_BIJ",relocation_operator_BIJ,DB.Def),
   ("relocation_operator_size_def",relocation_operator_size_def,DB.Def),
   ("relocation_operator_CASE",relocation_operator_CASE,DB.Def),
   ("relocation_operator2_TY_DEF",relocation_operator2_TY_DEF,DB.Def),
   ("relocation_operator2_BIJ",relocation_operator2_BIJ,DB.Def),
   ("relocation_operator2_size_def",relocation_operator2_size_def,DB.Def),
   ("relocation_operator2_CASE",relocation_operator2_CASE,DB.Def),
   ("lookupM_def",lookupM_def,DB.Def),
   ("can_fail_TY_DEF",can_fail_TY_DEF,DB.Def),
   ("can_fail_case_def",can_fail_case_def,DB.Def),
   ("can_fail_size_def",can_fail_size_def,DB.Def),
   ("relocation_operator_expression_TY_DEF",
    relocation_operator_expression_TY_DEF,
    DB.Def),
   ("relocation_operator_expression_case_def",
    relocation_operator_expression_case_def,
    DB.Def),
   ("relocation_operator_expression_size_def",
    relocation_operator_expression_size_def,
    DB.Def), ("relocation_frame_TY_DEF",relocation_frame_TY_DEF,DB.Def),
   ("relocation_frame_case_def",relocation_frame_case_def,DB.Def),
   ("relocation_frame_size_def",relocation_frame_size_def,DB.Def),
   ("size_of_def_def",size_of_def_def,DB.Def),
   ("size_of_copy_reloc_def",size_of_copy_reloc_def,DB.Def),
   ("reloc_site_address_def",reloc_site_address_def,DB.Def),
   ("num2integer_bit_width_integer_bit_width2num",
    num2integer_bit_width_integer_bit_width2num,
    DB.Thm),
   ("integer_bit_width2num_num2integer_bit_width",
    integer_bit_width2num_num2integer_bit_width,
    DB.Thm), ("num2integer_bit_width_11",num2integer_bit_width_11,DB.Thm),
   ("integer_bit_width2num_11",integer_bit_width2num_11,DB.Thm),
   ("num2integer_bit_width_ONTO",num2integer_bit_width_ONTO,DB.Thm),
   ("integer_bit_width2num_ONTO",integer_bit_width2num_ONTO,DB.Thm),
   ("num2integer_bit_width_thm",num2integer_bit_width_thm,DB.Thm),
   ("integer_bit_width2num_thm",integer_bit_width2num_thm,DB.Thm),
   ("integer_bit_width_EQ_integer_bit_width",
    integer_bit_width_EQ_integer_bit_width,
    DB.Thm),
   ("integer_bit_width_case_def",integer_bit_width_case_def,DB.Thm),
   ("datatype_integer_bit_width",datatype_integer_bit_width,DB.Thm),
   ("integer_bit_width_case_cong",integer_bit_width_case_cong,DB.Thm),
   ("integer_bit_width_nchotomy",integer_bit_width_nchotomy,DB.Thm),
   ("integer_bit_width_Axiom",integer_bit_width_Axiom,DB.Thm),
   ("integer_bit_width_induction",integer_bit_width_induction,DB.Thm),
   ("num2relocation_operator_relocation_operator2num",
    num2relocation_operator_relocation_operator2num,
    DB.Thm),
   ("relocation_operator2num_num2relocation_operator",
    relocation_operator2num_num2relocation_operator,
    DB.Thm),
   ("num2relocation_operator_11",num2relocation_operator_11,DB.Thm),
   ("relocation_operator2num_11",relocation_operator2num_11,DB.Thm),
   ("num2relocation_operator_ONTO",num2relocation_operator_ONTO,DB.Thm),
   ("relocation_operator2num_ONTO",relocation_operator2num_ONTO,DB.Thm),
   ("num2relocation_operator_thm",num2relocation_operator_thm,DB.Thm),
   ("relocation_operator2num_thm",relocation_operator2num_thm,DB.Thm),
   ("relocation_operator_EQ_relocation_operator",
    relocation_operator_EQ_relocation_operator,
    DB.Thm),
   ("relocation_operator_case_def",relocation_operator_case_def,DB.Thm),
   ("datatype_relocation_operator",datatype_relocation_operator,DB.Thm),
   ("relocation_operator_case_cong",relocation_operator_case_cong,DB.Thm),
   ("relocation_operator_nchotomy",relocation_operator_nchotomy,DB.Thm),
   ("relocation_operator_Axiom",relocation_operator_Axiom,DB.Thm),
   ("relocation_operator_induction",relocation_operator_induction,DB.Thm),
   ("num2relocation_operator2_relocation_operator22num",
    num2relocation_operator2_relocation_operator22num,
    DB.Thm),
   ("relocation_operator22num_num2relocation_operator2",
    relocation_operator22num_num2relocation_operator2,
    DB.Thm),
   ("num2relocation_operator2_11",num2relocation_operator2_11,DB.Thm),
   ("relocation_operator22num_11",relocation_operator22num_11,DB.Thm),
   ("num2relocation_operator2_ONTO",num2relocation_operator2_ONTO,DB.Thm),
   ("relocation_operator22num_ONTO",relocation_operator22num_ONTO,DB.Thm),
   ("num2relocation_operator2_thm",num2relocation_operator2_thm,DB.Thm),
   ("relocation_operator22num_thm",relocation_operator22num_thm,DB.Thm),
   ("relocation_operator2_EQ_relocation_operator2",
    relocation_operator2_EQ_relocation_operator2,
    DB.Thm),
   ("relocation_operator2_case_def",relocation_operator2_case_def,DB.Thm),
   ("datatype_relocation_operator2",datatype_relocation_operator2,DB.Thm),
   ("relocation_operator2_case_cong",
    relocation_operator2_case_cong,
    DB.Thm),
   ("relocation_operator2_nchotomy",relocation_operator2_nchotomy,DB.Thm),
   ("relocation_operator2_Axiom",relocation_operator2_Axiom,DB.Thm),
   ("relocation_operator2_induction",
    relocation_operator2_induction,
    DB.Thm), ("datatype_can_fail",datatype_can_fail,DB.Thm),
   ("can_fail_11",can_fail_11,DB.Thm),
   ("can_fail_distinct",can_fail_distinct,DB.Thm),
   ("can_fail_case_cong",can_fail_case_cong,DB.Thm),
   ("can_fail_nchotomy",can_fail_nchotomy,DB.Thm),
   ("can_fail_Axiom",can_fail_Axiom,DB.Thm),
   ("can_fail_induction",can_fail_induction,DB.Thm),
   ("datatype_relocation_operator_expression",
    datatype_relocation_operator_expression,
    DB.Thm),
   ("relocation_operator_expression_11",
    relocation_operator_expression_11,
    DB.Thm),
   ("relocation_operator_expression_distinct",
    relocation_operator_expression_distinct,
    DB.Thm),
   ("relocation_operator_expression_case_cong",
    relocation_operator_expression_case_cong,
    DB.Thm),
   ("relocation_operator_expression_nchotomy",
    relocation_operator_expression_nchotomy,
    DB.Thm),
   ("relocation_operator_expression_Axiom",
    relocation_operator_expression_Axiom,
    DB.Thm),
   ("relocation_operator_expression_induction",
    relocation_operator_expression_induction,
    DB.Thm),
   ("datatype_relocation_frame",datatype_relocation_frame,DB.Thm),
   ("relocation_frame_11",relocation_frame_11,DB.Thm),
   ("relocation_frame_distinct",relocation_frame_distinct,DB.Thm),
   ("relocation_frame_case_cong",relocation_frame_case_cong,DB.Thm),
   ("relocation_frame_nchotomy",relocation_frame_nchotomy,DB.Thm),
   ("relocation_frame_Axiom",relocation_frame_Axiom,DB.Thm),
   ("relocation_frame_induction",relocation_frame_induction,DB.Thm)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("memory_image_orderingsTheory.memory_image_orderings_grammars",
                          memory_image_orderingsTheory.memory_image_orderings_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms temp_add_type "integer_bit_width"
  val _ = update_grms temp_add_type "integer_bit_width"
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("integer_bit_width2num", (Term.prim_mk_const { Name = "integer_bit_width2num", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("num2integer_bit_width", (Term.prim_mk_const { Name = "num2integer_bit_width", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I8", (Term.prim_mk_const { Name = "I8", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I8", (Term.prim_mk_const { Name = "I8", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I12", (Term.prim_mk_const { Name = "I12", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I12", (Term.prim_mk_const { Name = "I12", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U12", (Term.prim_mk_const { Name = "U12", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U12", (Term.prim_mk_const { Name = "U12", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Low14", (Term.prim_mk_const { Name = "Low14", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Low14", (Term.prim_mk_const { Name = "Low14", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U15", (Term.prim_mk_const { Name = "U15", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U15", (Term.prim_mk_const { Name = "U15", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I15", (Term.prim_mk_const { Name = "I15", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I15", (Term.prim_mk_const { Name = "I15", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I16", (Term.prim_mk_const { Name = "I16", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I16", (Term.prim_mk_const { Name = "I16", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Half16ds", (Term.prim_mk_const { Name = "Half16ds", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Half16ds", (Term.prim_mk_const { Name = "Half16ds", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I20", (Term.prim_mk_const { Name = "I20", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I20", (Term.prim_mk_const { Name = "I20", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Low24", (Term.prim_mk_const { Name = "Low24", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Low24", (Term.prim_mk_const { Name = "Low24", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I27", (Term.prim_mk_const { Name = "I27", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I27", (Term.prim_mk_const { Name = "I27", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Word30", (Term.prim_mk_const { Name = "Word30", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Word30", (Term.prim_mk_const { Name = "Word30", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I32", (Term.prim_mk_const { Name = "I32", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I32", (Term.prim_mk_const { Name = "I32", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I48", (Term.prim_mk_const { Name = "I48", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I48", (Term.prim_mk_const { Name = "I48", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I64", (Term.prim_mk_const { Name = "I64", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I64", (Term.prim_mk_const { Name = "I64", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I64X2", (Term.prim_mk_const { Name = "I64X2", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("I64X2", (Term.prim_mk_const { Name = "I64X2", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U16", (Term.prim_mk_const { Name = "U16", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U16", (Term.prim_mk_const { Name = "U16", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U24", (Term.prim_mk_const { Name = "U24", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U24", (Term.prim_mk_const { Name = "U24", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U32", (Term.prim_mk_const { Name = "U32", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U32", (Term.prim_mk_const { Name = "U32", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U48", (Term.prim_mk_const { Name = "U48", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U48", (Term.prim_mk_const { Name = "U48", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U64", (Term.prim_mk_const { Name = "U64", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("U64", (Term.prim_mk_const { Name = "U64", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("integer_bit_width_size", (Term.prim_mk_const { Name = "integer_bit_width_size", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("integer_bit_width_size", (Term.prim_mk_const { Name = "integer_bit_width_size", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("integer_bit_width_CASE", (Term.prim_mk_const { Name = "integer_bit_width_CASE", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("integer_bit_width_CASE", (Term.prim_mk_const { Name = "integer_bit_width_CASE", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_integer_bit_width", (Term.prim_mk_const { Name = "natural_of_integer_bit_width", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_integer_bit_width", (Term.prim_mk_const { Name = "natural_of_integer_bit_width", Thy = "abi_utilities"}))
  val _ = update_grms temp_add_type "relocation_operator"
  val _ = update_grms temp_add_type "relocation_operator"
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator2num", (Term.prim_mk_const { Name = "relocation_operator2num", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("num2relocation_operator", (Term.prim_mk_const { Name = "num2relocation_operator", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("TPRel", (Term.prim_mk_const { Name = "TPRel", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("TPRel", (Term.prim_mk_const { Name = "TPRel", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("LTOff", (Term.prim_mk_const { Name = "LTOff", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("LTOff", (Term.prim_mk_const { Name = "LTOff", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("DTPMod", (Term.prim_mk_const { Name = "DTPMod", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("DTPMod", (Term.prim_mk_const { Name = "DTPMod", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("DTPRel", (Term.prim_mk_const { Name = "DTPRel", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("DTPRel", (Term.prim_mk_const { Name = "DTPRel", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Page", (Term.prim_mk_const { Name = "Page", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Page", (Term.prim_mk_const { Name = "Page", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GDat", (Term.prim_mk_const { Name = "GDat", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GDat", (Term.prim_mk_const { Name = "GDat", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("G", (Term.prim_mk_const { Name = "G", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("G", (Term.prim_mk_const { Name = "G", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GLDM", (Term.prim_mk_const { Name = "GLDM", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GLDM", (Term.prim_mk_const { Name = "GLDM", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GTPRel", (Term.prim_mk_const { Name = "GTPRel", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GTPRel", (Term.prim_mk_const { Name = "GTPRel", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GTLSDesc", (Term.prim_mk_const { Name = "GTLSDesc", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GTLSDesc", (Term.prim_mk_const { Name = "GTLSDesc", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Delta", (Term.prim_mk_const { Name = "Delta", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Delta", (Term.prim_mk_const { Name = "Delta", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("LDM", (Term.prim_mk_const { Name = "LDM", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("LDM", (Term.prim_mk_const { Name = "LDM", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("TLSDesc", (Term.prim_mk_const { Name = "TLSDesc", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("TLSDesc", (Term.prim_mk_const { Name = "TLSDesc", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Indirect", (Term.prim_mk_const { Name = "Indirect", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Indirect", (Term.prim_mk_const { Name = "Indirect", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Lo", (Term.prim_mk_const { Name = "Lo", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Lo", (Term.prim_mk_const { Name = "Lo", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Hi", (Term.prim_mk_const { Name = "Hi", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Hi", (Term.prim_mk_const { Name = "Hi", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Ha", (Term.prim_mk_const { Name = "Ha", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Ha", (Term.prim_mk_const { Name = "Ha", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Higher", (Term.prim_mk_const { Name = "Higher", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Higher", (Term.prim_mk_const { Name = "Higher", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("HigherA", (Term.prim_mk_const { Name = "HigherA", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("HigherA", (Term.prim_mk_const { Name = "HigherA", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Highest", (Term.prim_mk_const { Name = "Highest", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Highest", (Term.prim_mk_const { Name = "Highest", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("HighestA", (Term.prim_mk_const { Name = "HighestA", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("HighestA", (Term.prim_mk_const { Name = "HighestA", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator_size", (Term.prim_mk_const { Name = "relocation_operator_size", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator_size", (Term.prim_mk_const { Name = "relocation_operator_size", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator_CASE", (Term.prim_mk_const { Name = "relocation_operator_CASE", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator_CASE", (Term.prim_mk_const { Name = "relocation_operator_CASE", Thy = "abi_utilities"}))
  val _ = update_grms temp_add_type "relocation_operator2"
  val _ = update_grms temp_add_type "relocation_operator2"
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator22num", (Term.prim_mk_const { Name = "relocation_operator22num", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("num2relocation_operator2", (Term.prim_mk_const { Name = "num2relocation_operator2", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GTLSIdx", (Term.prim_mk_const { Name = "GTLSIdx", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GTLSIdx", (Term.prim_mk_const { Name = "GTLSIdx", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator2_size", (Term.prim_mk_const { Name = "relocation_operator2_size", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator2_size", (Term.prim_mk_const { Name = "relocation_operator2_size", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator2_CASE", (Term.prim_mk_const { Name = "relocation_operator2_CASE", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator2_CASE", (Term.prim_mk_const { Name = "relocation_operator2_CASE", Thy = "abi_utilities"}))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="abi_utilities",Name="val_map"}, T"fmap" "finite_map" [U"'k", U"'v"])
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("lookupM", (Term.prim_mk_const { Name = "lookupM", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("lookupM", (Term.prim_mk_const { Name = "lookupM", Thy = "abi_utilities"}))
  val _ = update_grms temp_add_type "can_fail"
  val _ = update_grms temp_add_type "can_fail"








  val _ = update_grms
       (UTOFF temp_overload_on)
       ("CanFail", (Term.prim_mk_const { Name = "CanFail", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("CanFail", (Term.prim_mk_const { Name = "CanFail", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("CanFailOnTest", (Term.prim_mk_const { Name = "CanFailOnTest", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("CanFailOnTest", (Term.prim_mk_const { Name = "CanFailOnTest", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("CannotFail", (Term.prim_mk_const { Name = "CannotFail", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("CannotFail", (Term.prim_mk_const { Name = "CannotFail", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("can_fail_CASE", (Term.prim_mk_const { Name = "can_fail_CASE", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("can_fail_size", (Term.prim_mk_const { Name = "can_fail_size", Thy = "abi_utilities"}))
  val _ = update_grms temp_add_type "relocation_operator_expression"
  val _ = update_grms temp_add_type "relocation_operator_expression"


  val _ = update_grms temp_add_type "@temp @ind_typeabi_utilities5prod"
  val _ = update_grms temp_add_type "@temp @ind_typeabi_utilities5prod"


  val _ = update_grms temp_add_type "@temp @ind_typeabi_utilities6prod"
  val _ = update_grms temp_add_type "@temp @ind_typeabi_utilities6prod"


  val _ = update_grms temp_add_type "@temp @ind_typeabi_utilities7prod"
  val _ = update_grms temp_add_type "@temp @ind_typeabi_utilities7prod"


  val _ = update_grms temp_add_type "@temp @ind_typeabi_utilities8prod"
  val _ = update_grms temp_add_type "@temp @ind_typeabi_utilities8prod"


































  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Lift", (Term.prim_mk_const { Name = "Lift", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Lift", (Term.prim_mk_const { Name = "Lift", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Apply", (Term.prim_mk_const { Name = "Apply", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Apply", (Term.prim_mk_const { Name = "Apply", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Apply2", (Term.prim_mk_const { Name = "Apply2", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Apply2", (Term.prim_mk_const { Name = "Apply2", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Plus", (Term.prim_mk_const { Name = "Plus", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Plus", (Term.prim_mk_const { Name = "Plus", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Minus", (Term.prim_mk_const { Name = "Minus", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Minus", (Term.prim_mk_const { Name = "Minus", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("RShift", (Term.prim_mk_const { Name = "RShift", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("RShift", (Term.prim_mk_const { Name = "RShift", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator_expression_CASE", (Term.prim_mk_const { Name = "relocation_operator_expression_CASE", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator_expression_size", (Term.prim_mk_const { Name = "relocation_operator_expression_size", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator_expression1_size", (Term.prim_mk_const { Name = "relocation_operator_expression1_size", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator_expression2_size", (Term.prim_mk_const { Name = "relocation_operator_expression2_size", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator_expression3_size", (Term.prim_mk_const { Name = "relocation_operator_expression3_size", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_operator_expression4_size", (Term.prim_mk_const { Name = "relocation_operator_expression4_size", Thy = "abi_utilities"}))
  val _ = update_grms temp_add_type "relocation_frame"
  val _ = update_grms temp_add_type "relocation_frame"






  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Copy", (Term.prim_mk_const { Name = "Copy", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Copy", (Term.prim_mk_const { Name = "Copy", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("NoCopy", (Term.prim_mk_const { Name = "NoCopy", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("NoCopy", (Term.prim_mk_const { Name = "NoCopy", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_frame_CASE", (Term.prim_mk_const { Name = "relocation_frame_CASE", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("relocation_frame_size", (Term.prim_mk_const { Name = "relocation_frame_size", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("size_of_def", (Term.prim_mk_const { Name = "size_of_def", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("size_of_def", (Term.prim_mk_const { Name = "size_of_def", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("size_of_copy_reloc", (Term.prim_mk_const { Name = "size_of_copy_reloc", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("size_of_copy_reloc", (Term.prim_mk_const { Name = "size_of_copy_reloc", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("reloc_site_address", (Term.prim_mk_const { Name = "reloc_site_address", Thy = "abi_utilities"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("reloc_site_address", (Term.prim_mk_const { Name = "reloc_site_address", Thy = "abi_utilities"}))
  val abi_utilities_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG integer_bit_width_Axiom,
           case_def=integer_bit_width_case_def,
           case_cong=integer_bit_width_case_cong,
           induction=ORIG integer_bit_width_induction,
           nchotomy=integer_bit_width_nchotomy,
           size=SOME(Parse.Term`(abi_utilities$integer_bit_width_size) :(abi_utilities$integer_bit_width) -> (num$num)`,
                     ORIG integer_bit_width_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo "integer_bit_width" integer_bit_width_EQ_integer_bit_width integer_bit_width2num_thm tyinfo0
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
          {ax=ORIG relocation_operator_Axiom,
           case_def=relocation_operator_case_def,
           case_cong=relocation_operator_case_cong,
           induction=ORIG relocation_operator_induction,
           nchotomy=relocation_operator_nchotomy,
           size=SOME(Parse.Term`(abi_utilities$relocation_operator_size) :(abi_utilities$relocation_operator) -> (num$num)`,
                     ORIG relocation_operator_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo "relocation_operator" relocation_operator_EQ_relocation_operator relocation_operator2num_thm tyinfo0
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
          {ax=ORIG relocation_operator2_Axiom,
           case_def=relocation_operator2_case_def,
           case_cong=relocation_operator2_case_cong,
           induction=ORIG relocation_operator2_induction,
           nchotomy=relocation_operator2_nchotomy,
           size=SOME(Parse.Term`(abi_utilities$relocation_operator2_size) :(abi_utilities$relocation_operator2) -> (num$num)`,
                     ORIG relocation_operator2_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo "relocation_operator2" relocation_operator2_EQ_relocation_operator2 relocation_operator22num_thm tyinfo0
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
          {ax=ORIG can_fail_Axiom,
           case_def=can_fail_case_def,
           case_cong=can_fail_case_cong,
           induction=ORIG can_fail_induction,
           nchotomy=can_fail_nchotomy,
           size=SOME(Parse.Term`(abi_utilities$can_fail_size) :('a -> (num$num)) -> ('a abi_utilities$can_fail) -> (num$num)`,
                     ORIG can_fail_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME can_fail_11,
           distinct=SOME can_fail_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = tyinfo0
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
          {ax=ORIG relocation_operator_expression_Axiom,
           case_def=relocation_operator_expression_case_def,
           case_cong=relocation_operator_expression_case_cong,
           induction=ORIG relocation_operator_expression_induction,
           nchotomy=relocation_operator_expression_nchotomy,
           size=SOME(Parse.Term`(abi_utilities$relocation_operator_expression_size) :('a -> (num$num)) ->
('a abi_utilities$relocation_operator_expression) -> (num$num)`,
                     ORIG relocation_operator_expression_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME relocation_operator_expression_11,
           distinct=SOME relocation_operator_expression_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = tyinfo0
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
          {ax=ORIG relocation_frame_Axiom,
           case_def=relocation_frame_case_def,
           case_cong=relocation_frame_case_cong,
           induction=ORIG relocation_frame_induction,
           nchotomy=relocation_frame_nchotomy,
           size=SOME(Parse.Term`(abi_utilities$relocation_frame_size) :('addr -> (num$num)) ->
('res -> (num$num)) ->
(('addr, 'res) abi_utilities$relocation_frame) -> (num$num)`,
                     ORIG relocation_frame_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME relocation_frame_11,
           distinct=SOME relocation_frame_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "abi_utilities",
    thydataty = "compute",
    data =
        "abi_utilities.natural_of_integer_bit_width_def abi_utilities.reloc_site_address_def abi_utilities.size_of_copy_reloc_def abi_utilities.size_of_def_def abi_utilities.lookupM_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_utilities"
end
