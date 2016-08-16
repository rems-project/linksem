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
          Arbnum.fromString "1471355380",
          Arbnum.fromString "362513")
          [("memory_image_orderings",
           Arbnum.fromString "1471355354",
           Arbnum.fromString "242874")];
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
   ID("lem_basic_classes", "Ord_class"), ID("error", "error"),
   ID("min", "bool"), ID("ind_type", "recspace"),
   ID("memory_image", "element0"), ID("list", "list"),
   ID("string", "char"), ID("option", "option"),
   ID("memory_image", "range_tag"), ID("memory_image", "symbol_reference"),
   ID("elf_symbol_table", "elf64_symbol_table_entry"), ID("bool", "!"),
   ID("arithmetic", "+"), ID("pair", ","), ID("bool", "/\\"),
   ID("num", "0"), ID("prim_rec", "<"), ID("min", "="), ID("min", "==>"),
   ID("bool", "?"), ID("bool", "ARB"), ID("abi_utilities", "Apply"),
   ID("abi_utilities", "Apply2"), ID("arithmetic", "BIT1"),
   ID("arithmetic", "BIT2"), ID("ind_type", "BOTTOM"), ID("string", "CHR"),
   ID("bool", "COND"), ID("list", "CONS"), ID("ind_type", "CONSTR"),
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
   ID("memory_image", "element0_startpos"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_size"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
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
   TYOP [0, 63, 77], TYOP [11, 3], TYOP [0, 79, 2], TYOP [0, 11, 80],
   TYOP [12, 3], TYOP [0, 82, 81], TYOP [0, 0, 19], TYOP [0, 0, 5],
   TYOP [0, 0, 70], TYOP [0, 70, 0], TYOP [13, 3], TYOP [8, 11, 3],
   TYOP [0, 89, 88], TYOP [0, 11, 90], TYOP [0, 70, 57], TYOP [9, 3],
   TYOP [0, 93, 0], TYOP [0, 9, 94], TYOP [0, 11, 11], TYOP [14],
   TYOP [0, 3, 97], TYOP [0, 98, 11], TYOP [0, 99, 96], TYOP [0, 11, 100],
   TYOP [0, 93, 101], TYOP [0, 12, 7], TYOP [0, 15, 7], TYOP [0, 74, 63],
   TYOP [0, 3, 7], TYOP [0, 98, 93], TYOP [0, 20, 7], TYOP [0, 23, 7],
   TYOP [5, 0, 5], TYOP [5, 19, 110], TYOP [5, 3, 111], TYOP [15, 112],
   TYOP [0, 113, 97], TYOP [15, 98], TYOP [0, 115, 97], TYOP [15, 74],
   TYOP [0, 117, 97], TYOP [0, 93, 97], TYOP [0, 70, 97], TYOP [0, 63, 97],
   TYOP [0, 5, 97], TYOP [0, 19, 97], TYOP [0, 7, 97], TYOP [0, 20, 97],
   TYOP [0, 12, 97], TYOP [0, 23, 97], TYOP [0, 15, 97],
   TYOP [0, 107, 119], TYOP [0, 93, 129], TYOP [16], TYOP [18],
   TYOP [17, 132], TYOP [5, 0, 0], TYOP [0, 70, 3], TYOP [0, 5, 3],
   TYOP [0, 19, 3], TYV "'e", TYOP [0, 138, 11], TYOP [0, 23, 139],
   TYV "'c", TYOP [0, 141, 11], TYOP [0, 20, 142], TYV "'f",
   TYOP [0, 144, 11], TYOP [0, 15, 145], TYV "'d", TYOP [0, 147, 11],
   TYOP [0, 12, 148], TYOP [0, 144, 141], TYOP [0, 15, 150],
   TYOP [0, 19, 151], TYOP [0, 11, 147], TYOP [0, 7, 153],
   TYOP [0, 0, 154], TYOP [0, 11, 138], TYOP [0, 7, 156], TYOP [0, 5, 157],
   TYOP [0, 11, 144], TYOP [0, 11, 159], TYOP [0, 7, 160],
   TYOP [0, 7, 161], TYOP [0, 93, 11], TYOP [0, 63, 3], TYOP [0, 7, 11],
   TYOP [0, 20, 141], TYOP [0, 12, 147], TYOP [0, 23, 138],
   TYOP [0, 15, 144], TYOP [5, 133, 134], TYOP [19, 170], TYOP [20, 3],
   TYOP [5, 172, 171], TYOP [17, 173], TYOP [0, 70, 120],
   TYOP [0, 70, 175], TYOP [0, 70, 176], TYOP [0, 70, 177],
   TYOP [0, 70, 178], TYOP [0, 70, 179], TYOP [0, 70, 180],
   TYOP [0, 70, 181], TYOP [0, 70, 182], TYOP [0, 70, 183],
   TYOP [0, 70, 184], TYOP [0, 70, 185], TYOP [0, 70, 186],
   TYOP [0, 70, 187], TYOP [0, 70, 188], TYOP [0, 70, 189],
   TYOP [0, 70, 190], TYOP [0, 70, 191], TYOP [0, 70, 192],
   TYOP [0, 70, 193], TYOP [0, 105, 97], TYOP [0, 63, 195],
   TYOP [0, 5, 122], TYOP [0, 5, 197], TYOP [0, 5, 198], TYOP [0, 5, 199],
   TYOP [0, 5, 200], TYOP [0, 5, 201], TYOP [0, 5, 202], TYOP [0, 5, 203],
   TYOP [0, 5, 204], TYOP [0, 5, 205], TYOP [0, 5, 206], TYOP [0, 5, 207],
   TYOP [0, 5, 208], TYOP [0, 5, 209], TYOP [0, 5, 210], TYOP [0, 5, 211],
   TYOP [0, 5, 212], TYOP [0, 5, 213], TYOP [0, 5, 214], TYOP [0, 5, 215],
   TYOP [0, 103, 97], TYOP [0, 104, 217], TYOP [0, 104, 218],
   TYOP [0, 108, 219], TYOP [0, 109, 220], TYOP [0, 106, 221],
   TYOP [0, 93, 115], TYOP [0, 63, 117], TYOP [0, 7, 113], TYOP [21],
   TYOP [22], TYOP [0, 98, 97], TYOP [0, 11, 97], TYOP [0, 229, 97],
   TYOP [0, 82, 97], TYOP [0, 231, 97], TYOP [0, 79, 97],
   TYOP [0, 233, 97], TYOP [0, 119, 97], TYOP [0, 74, 97],
   TYOP [0, 236, 97], TYOP [0, 89, 97], TYOP [0, 238, 97],
   TYOP [0, 26, 97], TYOP [0, 240, 97], TYOP [0, 228, 97], TYOP [0, 9, 97],
   TYOP [0, 243, 97], TYOP [0, 67, 97], TYOP [0, 245, 97],
   TYOP [0, 65, 97], TYOP [0, 247, 97], TYOP [0, 235, 97],
   TYOP [0, 75, 97], TYOP [0, 250, 97], TYOP [0, 99, 97],
   TYOP [0, 252, 97], TYOP [0, 120, 97], TYOP [0, 254, 97],
   TYOP [0, 155, 97], TYOP [0, 256, 97], TYOP [0, 24, 97],
   TYOP [0, 258, 97], TYOP [0, 127, 97], TYOP [0, 260, 97],
   TYOP [0, 140, 97], TYOP [0, 262, 97], TYOP [0, 21, 97],
   TYOP [0, 264, 97], TYOP [0, 125, 97], TYOP [0, 266, 97],
   TYOP [0, 143, 97], TYOP [0, 268, 97], TYOP [0, 13, 97],
   TYOP [0, 270, 97], TYOP [0, 126, 97], TYOP [0, 272, 97],
   TYOP [0, 149, 97], TYOP [0, 274, 97], TYOP [0, 16, 97],
   TYOP [0, 276, 97], TYOP [0, 128, 97], TYOP [0, 278, 97],
   TYOP [0, 146, 97], TYOP [0, 280, 97], TYOP [0, 118, 97],
   TYOP [0, 282, 97], TYOP [0, 116, 97], TYOP [0, 284, 97],
   TYOP [0, 114, 97], TYOP [0, 286, 97], TYOP [0, 121, 97],
   TYOP [0, 288, 97], TYOP [0, 122, 97], TYOP [0, 290, 97],
   TYOP [0, 158, 97], TYOP [0, 292, 97], TYOP [0, 123, 97],
   TYOP [0, 294, 97], TYOP [0, 152, 97], TYOP [0, 296, 97],
   TYOP [0, 124, 97], TYOP [0, 298, 97], TYOP [0, 162, 97],
   TYOP [0, 300, 97], TYOP [0, 0, 97], TYOP [0, 302, 97], TYOP [0, 1, 97],
   TYOP [0, 304, 97], TYOP [0, 0, 0], TYOP [0, 0, 306], TYOP [0, 111, 112],
   TYOP [0, 3, 308], TYOP [0, 5, 110], TYOP [0, 0, 310], TYOP [0, 7, 23],
   TYOP [0, 5, 312], TYOP [0, 110, 111], TYOP [0, 19, 314],
   TYOP [0, 15, 20], TYOP [0, 19, 316], TYOP [0, 0, 12], TYOP [0, 7, 318],
   TYOP [0, 7, 15], TYOP [0, 7, 320], TYOP [0, 97, 97], TYOP [0, 97, 322],
   TYOP [0, 0, 302], TYOP [0, 3, 98], TYOP [0, 11, 229], TYOP [0, 141, 97],
   TYOP [0, 141, 327], TYOP [0, 147, 97], TYOP [0, 147, 329],
   TYOP [0, 138, 97], TYOP [0, 138, 331], TYOP [0, 144, 97],
   TYOP [0, 144, 333], TYOP [0, 93, 119], TYOP [0, 88, 97],
   TYOP [0, 88, 336], TYOP [0, 74, 236], TYOP [0, 98, 228],
   TYOP [0, 23, 127], TYOP [0, 20, 125], TYOP [0, 12, 126],
   TYOP [0, 15, 128], TYOP [0, 172, 97], TYOP [0, 172, 344],
   TYOP [0, 117, 118], TYOP [0, 115, 116], TYOP [0, 113, 114],
   TYOP [0, 63, 121], TYOP [0, 19, 123], TYOP [0, 7, 124],
   TYOP [0, 163, 97], TYOP [0, 352, 97], TYOP [0, 223, 97],
   TYOP [0, 354, 97], TYOP [0, 135, 97], TYOP [0, 356, 97],
   TYOP [0, 87, 97], TYOP [0, 358, 97], TYOP [0, 168, 97],
   TYOP [0, 360, 97], TYOP [0, 166, 97], TYOP [0, 362, 97],
   TYOP [0, 167, 97], TYOP [0, 364, 97], TYOP [0, 169, 97],
   TYOP [0, 366, 97], TYOP [0, 164, 97], TYOP [0, 368, 97],
   TYOP [0, 224, 97], TYOP [0, 370, 97], TYOP [0, 136, 97],
   TYOP [0, 372, 97], TYOP [0, 6, 97], TYOP [0, 374, 97],
   TYOP [0, 137, 97], TYOP [0, 376, 97], TYOP [0, 59, 97],
   TYOP [0, 378, 97], TYOP [0, 165, 97], TYOP [0, 380, 97],
   TYOP [0, 225, 97], TYOP [0, 382, 97], TYOP [0, 0, 132],
   TYOP [0, 97, 38], TYOP [0, 133, 133], TYOP [0, 132, 386],
   TYOP [0, 0, 117], TYOP [0, 388, 117], TYOP [0, 74, 389],
   TYOP [0, 0, 390], TYOP [0, 0, 115], TYOP [0, 392, 115],
   TYOP [0, 98, 393], TYOP [0, 0, 394], TYOP [0, 0, 113],
   TYOP [0, 396, 113], TYOP [0, 112, 397], TYOP [0, 0, 398],
   TYOP [0, 396, 396], TYOP [0, 113, 400], TYOP [19, 3], TYOP [0, 11, 402],
   TYOP [0, 89, 403], TYOP [19, 131], TYOP [0, 133, 405],
   TYOP [8, 133, 131], TYOP [0, 407, 406], TYOP [0, 227, 0],
   TYOP [0, 409, 409], TYOP [0, 174, 0], TYOP [0, 411, 411],
   TYOP [0, 306, 306], TYOP [0, 226, 0], TYOP [0, 414, 414],
   TYOP [0, 1, 172], TYOP [0, 302, 358], TYOP [0, 302, 374],
   TYOP [0, 302, 378], TYOP [0, 118, 370], TYOP [0, 116, 354],
   TYOP [0, 114, 382], TYOP [0, 173, 97], TYOP [0, 79, 423],
   TYOP [0, 79, 407], TYOP [0, 69, 0], TYOP [0, 65, 426], TYOP [19, 0],
   TYOP [0, 131, 428], TYOP [113], TYOP [112, 430], TYOP [112, 431],
   TYOP [112, 432], TYOP [112, 433], TYOP [112, 434], TYOP [112, 435],
   TYOP [111, 97, 436], TYOP [0, 227, 437], TYOP [0, 133, 88],
   TYOP [0, 133, 0], TYOP [0, 74, 0], TYOP [0, 73, 0], TYOP [0, 442, 441],
   TYOP [0, 67, 443], TYOP [12, 171], TYOP [12, 170], TYOP [0, 446, 445],
   TYOP [12, 172], TYOP [0, 82, 448], TYOP [12, 0], TYOP [12, 133],
   TYOP [12, 134], TYOP [0, 452, 446], TYOP [0, 451, 453],
   TYOP [0, 450, 452], TYOP [0, 450, 455], TYOP [0, 0, 307],
   TYOP [0, 0, 457], TYOP [0, 0, 458], TYOP [0, 0, 459], TYOP [0, 0, 460],
   TYOP [0, 0, 461], TYOP [0, 0, 462], TYOP [0, 0, 463], TYOP [0, 0, 464],
   TYOP [0, 0, 465], TYOP [0, 0, 466], TYOP [0, 0, 467], TYOP [0, 0, 468],
   TYOP [0, 0, 469], TYOP [0, 0, 470], TYOP [0, 0, 471], TYOP [0, 0, 472],
   TYOP [0, 0, 473], TYOP [0, 0, 474], TYOP [0, 70, 475],
   TYOP [0, 173, 411], TYOP [0, 477, 0], TYOP [0, 0, 478],
   TYOP [0, 174, 479], TYOP [0, 423, 174], TYOP [0, 172, 481],
   TYOP [0, 345, 482], TYOP [0, 445, 483], TYOP [0, 448, 484],
   TYOP [0, 3, 88], TYOP [0, 486, 88], TYOP [0, 88, 487],
   TYOP [0, 402, 488], TYOP [0, 131, 0], TYOP [0, 490, 0],
   TYOP [0, 0, 491], TYOP [0, 405, 492], TYOP [0, 306, 0],
   TYOP [0, 0, 494], TYOP [0, 428, 495], TYOP [0, 170, 0],
   TYOP [0, 497, 0], TYOP [0, 0, 498], TYOP [0, 171, 499],
   TYOP [0, 134, 0], TYOP [0, 133, 501], TYOP [0, 502, 0],
   TYOP [0, 170, 503], TYOP [0, 307, 0], TYOP [0, 134, 505],
   TYOP [0, 171, 0], TYOP [0, 172, 507], TYOP [0, 508, 0],
   TYOP [0, 173, 509], TYOP [0, 71, 0], TYOP [0, 426, 511],
   TYOP [0, 87, 512], TYOP [0, 511, 442], TYOP [0, 72, 0],
   TYOP [0, 515, 514], TYOP [0, 65, 515], TYOP [0, 1, 226],
   TYOP [0, 226, 227], TYOP [0, 437, 0]]
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
      ("relocation_frame_CASE", 78), ("reloc_site_address", 83),
      ("num2relocation_operator2", 84), ("num2relocation_operator", 85),
      ("num2integer_bit_width", 86), ("natural_of_integer_bit_width", 87),
      ("lookupM", 91), ("integer_bit_width_size", 87),
      ("integer_bit_width_CASE", 92), ("integer_bit_width2num", 87),
      ("can_fail_size", 95), ("can_fail_CASE", 102), ("Word30", 70),
      ("U64", 70), ("U48", 70), ("U32", 70), ("U24", 70), ("U16", 70),
      ("U15", 70), ("U12", 70), ("TPRel", 5), ("TLSDesc", 5),
      ("RShift", 103), ("Plus", 104), ("Page", 5), ("NoCopy", 105),
      ("Minus", 104), ("Low24", 70), ("Low14", 70), ("Lo", 5),
      ("Lift", 106), ("LTOff", 5), ("LDM", 5), ("Indirect", 5), ("I8", 70),
      ("I64X2", 70), ("I64", 70), ("I48", 70), ("I32", 70), ("I27", 70),
      ("I20", 70), ("I16", 70), ("I15", 70), ("I12", 70), ("HighestA", 5),
      ("Highest", 5), ("HigherA", 5), ("Higher", 5), ("Hi", 5),
      ("Half16ds", 70), ("Ha", 5), ("GTPRel", 5), ("GTLSIdx", 19),
      ("GTLSDesc", 5), ("GLDM", 5), ("GDat", 5), ("G", 5), ("Delta", 5),
      ("DTPRel", 5), ("DTPMod", 5), ("Copy", 63), ("CannotFail", 93),
      ("CanFailOnTest", 107), ("CanFail", 93), ("Apply2", 108),
      ("Apply", 109)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'@temp @ind_typeabi_utilities5prod'", 114),
   TMV("'@temp @ind_typeabi_utilities6prod'", 114),
   TMV("'@temp @ind_typeabi_utilities7prod'", 114),
   TMV("'@temp @ind_typeabi_utilities8prod'", 114), TMV("'can_fail'", 116),
   TMV("'relocation_frame'", 118),
   TMV("'relocation_operator_expression'", 114), TMV("M", 93),
   TMV("M", 70), TMV("M", 63), TMV("M", 5), TMV("M", 19), TMV("M", 7),
   TMV("M'", 93), TMV("M'", 70), TMV("M'", 63), TMV("M'", 5),
   TMV("M'", 19), TMV("M'", 7), TMV("P", 119), TMV("P", 120),
   TMV("P", 121), TMV("P", 122), TMV("P", 123), TMV("P0", 124),
   TMV("P1", 125), TMV("P2", 126), TMV("P3", 127), TMV("P4", 128),
   TMV("a", 3), TMV("a", 74), TMV("a", 98), TMV("a", 70), TMV("a", 23),
   TMV("a", 20), TMV("a", 12), TMV("a", 15), TMV("a", 113), TMV("a", 5),
   TMV("a", 19), TMV("a'", 3), TMV("a'", 74), TMV("a'", 98), TMV("a'", 70),
   TMV("a'", 23), TMV("a'", 20), TMV("a'", 12), TMV("a'", 15),
   TMV("a'", 5), TMV("a'", 19), TMV("a0", 117), TMV("a0", 115),
   TMV("a0", 113), TMV("a0", 5), TMV("a0", 19), TMV("a0", 7),
   TMV("a0'", 113), TMV("a1", 0), TMV("a1", 15), TMV("a1", 113),
   TMV("a1", 7), TMV("a1'", 113), TMV("a2", 113), TMV("a3", 113),
   TMV("a4", 113), TMV("addr", 0), TMV("c", 93), TMV("can_fail", 130),
   TMV("cc", 93),
   TMV("dict_Abi_classes_AbiFeatureTagEquiv_abifeature", 11),
   TMV("dict_Basic_classes_Ord_abifeature", 82), TMV("el", 131),
   TMV("el_name", 133), TMV("el_range", 134), TMV("element_addr", 0),
   TMV("f", 74), TMV("f", 26), TMV("f", 98), TMV("f", 9), TMV("f", 67),
   TMV("f", 75), TMV("f", 99), TMV("f", 135), TMV("f", 136), TMV("f", 137),
   TMV("f'", 26), TMV("f'", 75), TMV("f'", 99), TMV("f0", 3),
   TMV("f0", 11), TMV("f0", 26), TMV("f1", 65), TMV("f1", 75),
   TMV("f1", 99), TMV("f1", 24), TMV("f1", 140), TMV("f1'", 24),
   TMV("f2", 11), TMV("f2", 21), TMV("f2", 143), TMV("f2'", 21),
   TMV("f3", 16), TMV("f3", 146), TMV("f3'", 16), TMV("f4", 16),
   TMV("f4", 146), TMV("f4'", 16), TMV("f5", 13), TMV("f5", 149),
   TMV("f5'", 13), TMV("f6", 152), TMV("f7", 155), TMV("f8", 158),
   TMV("f9", 162), TMV("fn", 163), TMV("fn", 164), TMV("fn0", 165),
   TMV("fn1", 166), TMV("fn2", 167), TMV("fn3", 168), TMV("fn4", 169),
   TMV("found_kvs", 174), TMV("i", 70), TMV("img", 3), TMV("img", 79),
   TMV("integer_bit_width", 194), TMV("j", 3), TMV("k", 62),
   TMV("key", 11), TMV("m", 0), TMV("n", 0), TMV("p", 23), TMV("p", 20),
   TMV("p", 12), TMV("p", 15), TMV("r", 0), TMV("r", 63), TMV("r", 19),
   TMV("r", 7), TMV("r'", 0), TMV("r0", 5), TMV("r0", 7),
   TMV("relocation_frame", 196), TMV("relocation_operator", 216),
   TMV("relocation_operator2", 123),
   TMV("relocation_operator_expression", 222), TMV("rep", 223),
   TMV("rep", 87), TMV("rep", 224), TMV("rep", 6), TMV("rep", 59),
   TMV("rep", 225), TMV("rf", 226), TMV("rr", 63), TMV("rr", 7),
   TMV("rr", 1), TMV("site_offset", 0), TMV("sm", 227), TMV("start", 0),
   TMV("v", 3), TMV("v", 11), TMV("v", 170), TMV("v", 73), TMV("v'", 3),
   TMV("v'", 11), TMV("v0", 3), TMV("v0'", 3), TMV("v1", 3), TMV("v1", 11),
   TMV("v1", 0), TMV("v1'", 3), TMV("v1'", 11), TMV("v10", 3),
   TMV("v10", 172), TMV("v10'", 3), TMV("v11", 3), TMV("v11", 171),
   TMV("v11'", 3), TMV("v12", 3), TMV("v12'", 3), TMV("v13", 3),
   TMV("v13'", 3), TMV("v14", 3), TMV("v14'", 3), TMV("v15", 3),
   TMV("v15'", 3), TMV("v16", 3), TMV("v16'", 3), TMV("v17", 3),
   TMV("v17'", 3), TMV("v18", 3), TMV("v18'", 3), TMV("v19", 3),
   TMV("v19'", 3), TMV("v2", 3), TMV("v2", 173), TMV("v2'", 3),
   TMV("v20", 3), TMV("v20'", 3), TMV("v3", 3), TMV("v3", 174),
   TMV("v3'", 3), TMV("v4", 3), TMV("v4'", 3), TMV("v5", 3), TMV("v5'", 3),
   TMV("v6", 3), TMV("v6", 173), TMV("v6'", 3), TMV("v7", 3),
   TMV("v7", 174), TMV("v7'", 3), TMV("v8", 3), TMV("v8'", 3),
   TMV("v9", 3), TMV("v9'", 3), TMV("val_map", 89), TMV("x", 70),
   TMV("x", 5), TMV("x", 19), TMV("x0", 3), TMV("x1", 3), TMV("x10", 3),
   TMV("x11", 3), TMV("x12", 3), TMV("x13", 3), TMV("x14", 3),
   TMV("x15", 3), TMV("x16", 3), TMV("x17", 3), TMV("x18", 3),
   TMV("x19", 3), TMV("x2", 3), TMV("x20", 3), TMV("x3", 3), TMV("x4", 3),
   TMV("x5", 3), TMV("x6", 3), TMV("x7", 3), TMV("x8", 3), TMV("x9", 3),
   TMC(23, 228), TMC(23, 230), TMC(23, 232), TMC(23, 234), TMC(23, 235),
   TMC(23, 237), TMC(23, 239), TMC(23, 241), TMC(23, 242), TMC(23, 244),
   TMC(23, 246), TMC(23, 248), TMC(23, 249), TMC(23, 251), TMC(23, 253),
   TMC(23, 255), TMC(23, 257), TMC(23, 259), TMC(23, 261), TMC(23, 263),
   TMC(23, 265), TMC(23, 267), TMC(23, 269), TMC(23, 271), TMC(23, 273),
   TMC(23, 275), TMC(23, 277), TMC(23, 279), TMC(23, 281), TMC(23, 283),
   TMC(23, 285), TMC(23, 287), TMC(23, 289), TMC(23, 291), TMC(23, 293),
   TMC(23, 295), TMC(23, 297), TMC(23, 299), TMC(23, 301), TMC(23, 254),
   TMC(23, 303), TMC(23, 260), TMC(23, 266), TMC(23, 272), TMC(23, 278),
   TMC(23, 282), TMC(23, 284), TMC(23, 286), TMC(23, 288), TMC(23, 290),
   TMC(23, 294), TMC(23, 298), TMC(23, 305), TMC(24, 307), TMC(25, 309),
   TMC(25, 311), TMC(25, 313), TMC(25, 315), TMC(25, 317), TMC(25, 319),
   TMC(25, 321), TMC(26, 323), TMC(27, 0), TMC(28, 324), TMC(29, 325),
   TMC(29, 326), TMC(29, 328), TMC(29, 330), TMC(29, 332), TMC(29, 334),
   TMC(29, 323), TMC(29, 335), TMC(29, 337), TMC(29, 338), TMC(29, 339),
   TMC(29, 175), TMC(29, 324), TMC(29, 340), TMC(29, 341), TMC(29, 342),
   TMC(29, 343), TMC(29, 345), TMC(29, 346), TMC(29, 347), TMC(29, 348),
   TMC(29, 349), TMC(29, 197), TMC(29, 350), TMC(29, 351), TMC(30, 323),
   TMC(31, 228), TMC(31, 237), TMC(31, 242), TMC(31, 353), TMC(31, 355),
   TMC(31, 357), TMC(31, 359), TMC(31, 361), TMC(31, 363), TMC(31, 365),
   TMC(31, 367), TMC(31, 369), TMC(31, 371), TMC(31, 373), TMC(31, 375),
   TMC(31, 377), TMC(31, 379), TMC(31, 381), TMC(31, 383), TMC(31, 254),
   TMC(31, 303), TMC(31, 260), TMC(31, 266), TMC(31, 272), TMC(31, 278),
   TMC(31, 286), TMC(31, 290), TMC(31, 294), TMC(32, 3), TMC(32, 74),
   TMC(32, 98), TMC(32, 0), TMC(32, 5), TMC(32, 19), TMC(33, 109),
   TMC(34, 108), TMC(35, 306), TMC(36, 306), TMC(37, 117), TMC(37, 115),
   TMC(37, 113), TMC(38, 384), TMC(39, 385), TMC(40, 387), TMC(41, 391),
   TMC(41, 395), TMC(41, 399), TMC(42, 93), TMC(43, 107), TMC(44, 93),
   TMC(45, 63), TMC(46, 322), TMC(47, 5), TMC(48, 5), TMC(49, 5),
   TMC(50, 401), TMC(51, 404), TMC(51, 408), TMC(52, 5), TMC(53, 5),
   TMC(54, 5), TMC(55, 5), TMC(56, 19), TMC(57, 5), TMC(58, 5),
   TMC(59, 70), TMC(60, 5), TMC(61, 5), TMC(62, 5), TMC(63, 5), TMC(64, 5),
   TMC(65, 70), TMC(66, 70), TMC(67, 70), TMC(68, 70), TMC(69, 70),
   TMC(70, 70), TMC(71, 70), TMC(72, 70), TMC(73, 70), TMC(74, 70),
   TMC(75, 5), TMC(76, 5), TMC(77, 410), TMC(77, 412), TMC(77, 413),
   TMC(77, 415), TMC(78, 5), TMC(79, 106), TMC(80, 5), TMC(81, 70),
   TMC(82, 70), TMC(83, 104), TMC(84, 133), TMC(85, 306), TMC(86, 105),
   TMC(87, 5), TMC(88, 104), TMC(89, 103), TMC(90, 306), TMC(91, 416),
   TMC(92, 5), TMC(93, 5), TMC(94, 417), TMC(94, 418), TMC(94, 419),
   TMC(94, 420), TMC(94, 421), TMC(94, 422), TMC(95, 70), TMC(96, 70),
   TMC(97, 70), TMC(98, 70), TMC(99, 70), TMC(100, 70), TMC(101, 70),
   TMC(102, 70), TMC(103, 0), TMC(104, 323), TMC(105, 424), TMC(106, 425),
   TMC(107, 102), TMC(108, 95), TMC(108, 427), TMC(109, 429),
   TMC(110, 438), TMC(114, 439), TMC(115, 440), TMC(116, 444),
   TMC(117, 447), TMC(118, 449), TMC(119, 450), TMC(120, 451),
   TMC(121, 454), TMC(121, 456), TMC(122, 87), TMC(123, 92), TMC(123, 476),
   TMC(124, 87), TMC(125, 480), TMC(126, 485), TMC(127, 91), TMC(128, 87),
   TMC(129, 86), TMC(130, 85), TMC(131, 84), TMC(132, 489), TMC(132, 493),
   TMC(132, 496), TMC(132, 500), TMC(133, 504), TMC(133, 506),
   TMC(133, 510), TMC(134, 513), TMC(134, 516), TMC(135, 83), TMC(136, 78),
   TMC(137, 68), TMC(138, 59), TMC(139, 60), TMC(140, 59), TMC(141, 6),
   TMC(142, 58), TMC(143, 36), TMC(144, 34), TMC(145, 32), TMC(146, 30),
   TMC(147, 28), TMC(148, 10), TMC(148, 517), TMC(149, 6), TMC(150, 486),
   TMC(151, 4), TMC(152, 2), TMC(153, 518), TMC(154, 519), TMC(155, 520),
   TMC(156, 322)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op integer_bit_width_TY_DEF x = x
    val op integer_bit_width_TY_DEF =
    DT(((("abi_utilities",0),
        [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%337%147%434%130%304$0@%425%367%368%368%367%448@@@@@@|@$0@|@"])
  fun op integer_bit_width_BIJ x = x
    val op integer_bit_width_BIJ =
    DT(((("abi_utilities",1),
        [("abi_utilities",[0]),("bool",[116])]),["DISK_THM"]),
       [read"%302%280%32%316%474%466$0@@@$0@|@@%281%135%311%130%304$0@%425%367%368%368%367%448@@@@@@|$0@@%317%466%474$0@@@$0@@|@@"])





















  fun op integer_bit_width_size_def x = x
    val op integer_bit_width_size_def =
    DT(((("abi_utilities",32),[]),[]), [read"%280%217%317%469$0@@%303@|@"])
  fun op integer_bit_width_CASE x = x
    val op integer_bit_width_CASE =
    DT(((("abi_utilities",33),[]),[]),
       [read"%280%217%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467$21@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%129%373%304$0@%425%368%368%367%448@@@@@@%373%304$0@%425%368%367%448@@@@@%373%304$0@%425%367%448@@@@$21@%373%304$0@%425%368%448@@@@$20@%373%317$0@%425%368%448@@@@$19@$18@@@@%373%304$0@%425%368%368%448@@@@@%373%317$0@%425%368%367%448@@@@@$17@$16@@%373%304$0@%425%367%367%367%448@@@@@@$15@%373%304$0@%425%368%367%367%448@@@@@@$14@%373%317$0@%425%368%367%367%448@@@@@@$13@$12@@@@@@%373%304$0@%425%367%367%367%367%448@@@@@@@%373%304$0@%425%368%367%368%448@@@@@@%373%317$0@%425%368%368%367%448@@@@@@$11@$10@@%373%304$0@%425%367%368%368%448@@@@@@$9@%373%317$0@%425%367%368%368%448@@@@@@$8@$7@@@@%373%304$0@%425%367%368%367%367%448@@@@@@@%373%317$0@%425%367%367%367%367%448@@@@@@@$6@$5@@%373%304$0@%425%368%368%367%367%448@@@@@@@$4@%373%304$0@%425%367%367%368%367%448@@@@@@@$3@%373%317$0@%425%367%367%368%367%448@@@@@@@$2@$1@@@@@@|%466$21@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op natural_of_integer_bit_width_def x = x
    val op natural_of_integer_bit_width_def =
    DT(((("abi_utilities",40),[]),[]),
       [read"%280%122%317%473$0@@%468$0@%425%368%367%367%448@@@@@%425%368%367%368%448@@@@@%425%368%367%368%448@@@@@%425%368%368%368%448@@@@@%425%367%367%367%367%448@@@@@@%425%367%367%367%367%448@@@@@@%425%368%367%367%367%448@@@@@@%425%368%367%367%367%448@@@@@@%425%368%367%368%367%448@@@@@@%425%368%367%367%368%448@@@@@@%425%367%367%368%368%448@@@@@@%425%368%368%368%368%448@@@@@@%425%368%367%367%367%367%448@@@@@@@%425%368%367%367%367%368%448@@@@@@@%425%368%367%367%367%367%367%448@@@@@@@@%425%368%367%367%367%367%367%367%448@@@@@@@@@%425%368%367%367%367%448@@@@@@%425%368%367%367%368%448@@@@@@%425%368%367%367%367%367%448@@@@@@@%425%368%367%367%367%368%448@@@@@@@%425%368%367%367%367%367%367%448@@@@@@@@@|@"])
  fun op relocation_operator_TY_DEF x = x
    val op relocation_operator_TY_DEF =
    DT(((("abi_utilities",41),
        [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%345%149%435%130%304$0@%425%367%368%368%367%448@@@@@@|@$0@|@"])
  fun op relocation_operator_BIJ x = x
    val op relocation_operator_BIJ =
    DT(((("abi_utilities",42),
        [("abi_utilities",[41]),("bool",[116])]),["DISK_THM"]),
       [read"%302%290%38%327%475%492$0@@@$0@|@@%281%135%311%130%304$0@%425%367%368%368%367%448@@@@@@|$0@@%317%492%475$0@@@$0@@|@@"])





















  fun op relocation_operator_size_def x = x
    val op relocation_operator_size_def =
    DT(((("abi_utilities",73),[]),[]), [read"%290%218%317%501$0@@%303@|@"])
  fun op relocation_operator_CASE x = x
    val op relocation_operator_CASE =
    DT(((("abi_utilities",74),[]),[]),
       [read"%290%218%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493$21@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%129%373%304$0@%425%368%368%367%448@@@@@@%373%304$0@%425%368%367%448@@@@@%373%304$0@%425%367%448@@@@$21@%373%304$0@%425%368%448@@@@$20@%373%317$0@%425%368%448@@@@$19@$18@@@@%373%304$0@%425%368%368%448@@@@@%373%317$0@%425%368%367%448@@@@@$17@$16@@%373%304$0@%425%367%367%367%448@@@@@@$15@%373%304$0@%425%368%367%367%448@@@@@@$14@%373%317$0@%425%368%367%367%448@@@@@@$13@$12@@@@@@%373%304$0@%425%367%367%367%367%448@@@@@@@%373%304$0@%425%368%367%368%448@@@@@@%373%317$0@%425%368%368%367%448@@@@@@$11@$10@@%373%304$0@%425%367%368%368%448@@@@@@$9@%373%317$0@%425%367%368%368%448@@@@@@$8@$7@@@@%373%304$0@%425%367%368%367%367%448@@@@@@@%373%317$0@%425%367%367%367%367%448@@@@@@@$6@$5@@%373%304$0@%425%368%368%367%367%448@@@@@@@$4@%373%304$0@%425%367%367%368%367%448@@@@@@@$3@%373%317$0@%425%367%367%368%367%448@@@@@@@$2@$1@@@@@@|%492$21@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op relocation_operator2_TY_DEF x = x
    val op relocation_operator2_TY_DEF =
    DT(((("abi_utilities",81),
        [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%347%150%436%130%304$0@%425%367%448@@@|@$0@|@"])
  fun op relocation_operator2_BIJ x = x
    val op relocation_operator2_BIJ =
    DT(((("abi_utilities",82),
        [("abi_utilities",[81]),("bool",[116])]),["DISK_THM"]),
       [read"%302%291%39%328%476%489$0@@@$0@|@@%281%135%311%130%304$0@%425%367%448@@@|$0@@%317%489%476$0@@@$0@@|@@"])

  fun op relocation_operator2_size_def x = x
    val op relocation_operator2_size_def =
    DT(((("abi_utilities",93),[]),[]), [read"%291%219%317%491$0@@%303@|@"])
  fun op relocation_operator2_CASE x = x
    val op relocation_operator2_CASE =
    DT(((("abi_utilities",94),[]),[]),
       [read"%291%219%241%165%305%490$1@$0@@%129$1|%489$1@@@|@|@"])
  fun op lookupM_def x = x
    val op lookupM_def =
    DT(((("abi_utilities",101),[]),[]),
       [read"%242%128%247%216%313%472$1@$0@@%477%387$0@$1@@%457%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%368%367%367%448@@@@@@@@@%374%372%425%368%368%367%368%368%448@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%367%368%367%368%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%368%367%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%368%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%367%368%448@@@@@@@@@%374%372%425%367%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%368%368%448@@@@@@@@@%424@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%126%502$0@|@@|@|@"])
  fun op can_fail_TY_DEF x = x
    val op can_fail_TY_DEF =
    DT(((("abi_utilities",102),[("bool",[26])]),["DISK_THM"]),
       [read"%335%146%438%51%271%4%330%287%51%330%449%324$0@%376%303@%361@%130%370|@@@%449%333%31%324$1@%31%376%430%303@@$0@%130%370|@|$0@@|@@%324$0@%376%430%430%303@@@%361@%130%370|@@@@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op can_fail_case_def x = x
    val op can_fail_case_def =
    DT(((("abi_utilities",110),
        [("abi_utilities",[103,104,105,106,107,108,109]),("bool",[26,180]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%302%242%160%255%81%242%168%306%452%378@$2@$1@$0@@$2@|@|@|@@%302%249%31%242%160%255%81%242%168%306%452%379$3@@$2@$1@$0@@$1$3@@|@|@|@|@@%242%160%255%81%242%168%306%452%380@$2@$1@$0@@$0@|@|@|@@@"])
  fun op can_fail_size_def x = x
    val op can_fail_size_def =
    DT(((("abi_utilities",111),
        [("abi_utilities",[103,104,105,106,107,108,109]),("bool",[26,180]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%302%250%78%317%453$0@%378@@%303@|@@%302%250%78%249%31%317%453$1@%379$0@@@%425%367%448@@@|@|@@%250%78%317%453$0@%380@@%303@|@@@"])
  fun op relocation_operator_expression_TY_DEF x = x
    val op relocation_operator_expression_TY_DEF =
    DT(((("abi_utilities",119),
        [("bool",[14,25,26,52,131,132,137])]),["DISK_THM"]),
       [read"%349%151%439%56%272%6%272%0%272%1%272%2%272%3%330%302%288%56%330%449%331%29%325$1@%29%377%303@%295$0@%298%364@%296%362@%363@@@@%130%371|@|$0@@|@@%449%356%37%302%325$1@%37%377%430%303@@%295%359@%298%364@%296%362@%363@@@@%386$0@%130%371|@@|$0@@@$3$0@@|@@%449%356%37%302%325$1@%37%377%430%430%303@@@%295%359@%298%364@%296%362@%363@@@@%386$0@%130%371|@@|$0@@@$5$0@@|@@%449%356%37%302%325$1@%37%377%430%430%430%303@@@@%295%359@%298%364@%296%362@%363@@@@%386$0@%130%371|@@|$0@@@$2$0@@|@@%449%356%37%302%325$1@%37%377%430%430%430%430%303@@@@@%295%359@%298%364@%296%362@%363@@@@%386$0@%130%371|@@|$0@@@$2$0@@|@@%356%37%302%325$1@%37%377%430%430%430%430%430%303@@@@@@%295%359@%298%364@%296%362@%363@@@@%386$0@%130%371|@@|$0@@@$4$0@@|@@@@@@@$5$0@@|@@%302%288%61%330%358%54%356%59%302%325$2@%54%59%377%430%430%430%430%430%430%303@@@@@@@%295%359@%298$1@%296%362@%363@@@@%386$0@%130%371|@@||$1@$0@@@$3$0@@|@|@@$4$0@@|@@%302%288%62%330%356%52%351%57%302%325$2@%52%57%377%430%430%430%430%430%430%430%303@@@@@@@@%295%359@%298%364@%296$0@%363@@@@%386$1@%130%371|@@||$1@$0@@@$7$1@@|@|@@$3$0@@|@@%302%288%63%330%357%53%356%59%302%325$2@%53%59%377%430%430%430%430%430%430%430%430%303@@@@@@@@@%295%359@%298%364@%296%362@$1@@@@%386$0@%130%371|@@||$1@$0@@@$7$0@@|@|@@$2$0@@|@@%288%64%330%356%52%356%59%302%325$2@%52%59%377%430%430%430%430%430%430%430%430%430%303@@@@@@@@@@%295%359@%298%364@%296%362@%363@@@@%386$1@%386$0@%130%371|@@@||$1@$0@@@%302$7$1@@$7$0@@@|@|@@$1$0@@|@@@@@@$4$5@@|@|@|@|@|@|@$0@|@"])
  fun op relocation_operator_expression_case_def x = x
    val op relocation_operator_expression_case_def =
    DT(((("abi_utilities",151),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,30,35,50,52,55,57,59,62,104,123,131,132,137,180]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%302%241%29%248%76%258%94%261%98%267%101%267%104%264%107%306%498%419$6@@$5@$4@$3@$2@$1@$0@@$5$6@@|@|@|@|@|@|@|@@%302%282%33%248%76%258%94%261%98%267%101%267%104%264%107%306%498%365$6@@$5@$4@$3@$2@$1@$0@@$4$6@@|@|@|@|@|@|@|@@%302%283%34%248%76%258%94%261%98%267%101%267%104%264%107%306%498%366$6@@$5@$4@$3@$2@$1@$0@@$3$6@@|@|@|@|@|@|@|@@%302%285%36%248%76%258%94%261%98%267%101%267%104%264%107%306%498%428$6@@$5@$4@$3@$2@$1@$0@@$2$6@@|@|@|@|@|@|@|@@%302%285%36%248%76%258%94%261%98%267%101%267%104%264%107%306%498%423$6@@$5@$4@$3@$2@$1@$0@@$1$6@@|@|@|@|@|@|@|@@%284%35%248%76%258%94%261%98%267%101%267%104%264%107%306%498%429$6@@$5@$4@$3@$2@$1@$0@@$0$6@@|@|@|@|@|@|@|@@@@@@"])
  fun op relocation_operator_expression_size_def x = x
    val op relocation_operator_expression_size_def =
    DT(((("abi_utilities",152),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,30,35,50,52,55,57,59,62,104,123,131,132,137,180]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%302%250%78%241%29%317%499$1@%419$0@@@%294%425%367%448@@@$1$0@@@|@|@@%302%250%78%282%33%317%499$1@%365$0@@@%294%425%367%448@@@%496$1@$0@@@|@|@@%302%250%78%283%34%317%499$1@%366$0@@@%294%425%367%448@@@%494$1@$0@@@|@|@@%302%250%78%285%36%317%499$1@%428$0@@@%294%425%367%448@@@%497$1@$0@@@|@|@@%302%250%78%285%36%317%499$1@%423$0@@@%294%425%367%448@@@%497$1@$0@@@|@|@@%302%250%78%284%35%317%499$1@%429$0@@@%294%425%367%448@@@%495$1@$0@@@|@|@@%302%250%78%291%54%285%58%317%494$2@%299$1@$0@@@%294%425%367%448@@@%294%491$1@@%497$2@$0@@@@|@|@|@@%302%250%78%292%55%281%57%317%495$2@%300$1@$0@@@%294%425%367%448@@@%294%499$2@$1@@$0@@@|@|@|@@%302%250%78%290%53%292%60%317%496$2@%297$1@$0@@@%294%425%367%448@@@%294%501$1@@%499$2@$0@@@@|@|@|@@%250%78%292%55%292%60%317%497$2@%301$1@$0@@@%294%425%367%448@@@%294%499$2@$1@@%499$2@$0@@@@|@|@|@@@@@@@@@@"])
  fun op relocation_frame_TY_DEF x = x
    val op relocation_frame_TY_DEF =
    DT(((("abi_utilities",160),[("bool",[26])]),["DISK_THM"]),
       [read"%343%148%437%50%270%5%330%286%50%330%449%323$0@%375%303@%360@%130%369|@@@%332%30%323$1@%30%375%430%303@@$0@%130%369|@|$0@@|@@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op relocation_frame_case_def x = x
    val op relocation_frame_case_def =
    DT(((("abi_utilities",166),
        [("abi_utilities",[161,162,163,164,165]),("bool",[26,180]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%302%241%159%254%80%305%487%381@$1@$0@@$1@|@|@@%246%30%241%159%254%80%305%487%426$2@@$1@$0@@$0$2@@|@|@|@@"])
  fun op relocation_frame_size_def x = x
    val op relocation_frame_size_def =
    DT(((("abi_utilities",167),
        [("abi_utilities",[161,162,163,164,165]),("bool",[26,180]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%302%251%79%252%91%317%488$1@$0@%381@@%303@|@|@@%251%79%252%91%246%30%317%488$2@$1@%426$0@@@%294%425%367%448@@@%459%127%303|@%162%294%425%367%448@@@%485%500$2@@%484%469@%454$2@@@$0@@|@$0@@@|@|@|@@"])
  fun op size_of_def_def x = x
    val op size_of_def_def =
    DT(((("abi_utilities",175),[]),[]),
       [read"%293%155%317%504$0@@%417%152%414%157%507%456$0@@|@%506$0@@|@%505$0@@@|@"])
  fun op size_of_copy_reloc_def x = x
    val op size_of_copy_reloc_def =
    DT(((("abi_utilities",176),[]),[]),
       [read"%241%123%293%155%317%503$1@$0@@%504$0@@|@|@"])
  fun op reloc_site_address_def x = x
    val op reloc_site_address_def =
    DT(((("abi_utilities",177),[]),[]),
       [read"%243%70%242%69%244%124%293%155%317%486$3@$2@$1@$0@@%415%121%470$0@%458%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%368%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%367%368%368%448@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%367%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%367%367%367%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%424@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%195%200%470$0@%483$1@%173%176%480$0@%458%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%368%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%367%368%368%448@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%367%367%368%367%368%448@@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%367%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%424@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%161%481$0@%72%73%416%74%416%156%294$1@$0@|@%482$1@%158%169$1||@@|@%478%388%451$9@@$1@@%458%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%368%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%367%368%368%448@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%368%367%448@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%367%368%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%367%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%424@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%71%479%455$0@@%458%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%367%368%368%448@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%368%368%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%368%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%367%368%448@@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%367%367%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%368%367%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%367%367%368%367%368%448@@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%367%367%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%368%367%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%367%368%448@@@@@@@@@%424@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%65$0|@|@@||@|@||@@%207%210%458%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%367%368%368%448@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%368%367%368%448@@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%367%367%368%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%368%367%367%368%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%367%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%367%367%368%367%367%368%448@@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%367%367%368%367%367%368%448@@@@@@@@@%374%372%425%367%368%367%367%367%368%448@@@@@@@@@%374%372%425%368%367%368%367%368%368%448@@@@@@@@@%374%372%425%367%368%367%368%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%368%368%367%368%448@@@@@@@@@%374%372%425%368%367%367%367%367%448@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%367%368%368%367%367%368%448@@@@@@@@@%374%372%425%367%367%368%367%367%368%448@@@@@@@@@%374%372%425%367%367%367%367%368%368%448@@@@@@@@@%374%372%425%368%368%367%367%368%368%448@@@@@@@@@%374%372%425%368%367%368%367%367%368%448@@@@@@@@@%424@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@||@||@|@%471%461$3@@%460%464%463@%465%462@%462@@@@%322@%431$0@@%450$1@@@@|@|@|@|@"])
  fun op num2integer_bit_width_integer_bit_width2num x = x
    val op num2integer_bit_width_integer_bit_width2num =
    DT(((("abi_utilities",2),[("abi_utilities",[1])]),["DISK_THM"]),
       [read"%280%32%316%474%466$0@@@$0@|@"])
  fun op integer_bit_width2num_num2integer_bit_width x = x
    val op integer_bit_width2num_num2integer_bit_width =
    DT(((("abi_utilities",3),[("abi_utilities",[1])]),["DISK_THM"]),
       [read"%281%135%311%304$0@%425%367%368%368%367%448@@@@@@@%317%466%474$0@@@$0@@|@"])
  fun op num2integer_bit_width_11 x = x
    val op num2integer_bit_width_11 =
    DT(((("abi_utilities",4),
        [("abi_utilities",[1]),("bool",[26])]),["DISK_THM"]),
       [read"%281%135%281%139%330%304$1@%425%367%368%368%367%448@@@@@@@%330%304$0@%425%367%368%368%367%448@@@@@@@%311%316%474$1@@%474$0@@@%317$1@$0@@@@|@|@"])
  fun op integer_bit_width2num_11 x = x
    val op integer_bit_width2num_11 =
    DT(((("abi_utilities",5),
        [("abi_utilities",[1]),("bool",[26])]),["DISK_THM"]),
       [read"%280%32%280%43%311%317%466$1@@%466$0@@@%316$1@$0@@|@|@"])
  fun op num2integer_bit_width_ONTO x = x
    val op num2integer_bit_width_ONTO =
    DT(((("abi_utilities",6),
        [("abi_utilities",[1]),("bool",[25,62])]),["DISK_THM"]),
       [read"%280%32%351%135%302%316$1@%474$0@@@%304$0@%425%367%368%368%367%448@@@@@@@|@|@"])
  fun op integer_bit_width2num_ONTO x = x
    val op integer_bit_width2num_ONTO =
    DT(((("abi_utilities",7),
        [("abi_utilities",[1]),("bool",[26])]),["DISK_THM"]),
       [read"%281%135%311%304$0@%425%367%368%368%367%448@@@@@@@%350%32%317$1@%466$0@@|@@|@"])
  fun op num2integer_bit_width_thm x = x
    val op num2integer_bit_width_thm =
    DT(((("abi_utilities",29),
        [("abi_utilities",
         [8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,
          28])]),[]),
       [read"%302%316%474%303@@%411@@%302%316%474%425%367%448@@@@%402@@%302%316%474%425%368%448@@@@%440@@%302%316%474%425%367%367%448@@@@@%421@@%302%316%474%425%368%367%448@@@@@%441@@%302%316%474%425%367%368%448@@@@@%403@@%302%316%474%425%368%368%448@@@@@%404@@%302%316%474%425%367%367%367%448@@@@@@%396@@%302%316%474%425%368%367%367%448@@@@@@%405@@%302%316%474%425%367%368%367%448@@@@@@%422@@%302%316%474%425%368%368%367%448@@@@@@%406@@%302%316%474%425%367%367%368%448@@@@@@%447@@%302%316%474%425%368%367%368%448@@@@@@%407@@%302%316%474%425%367%368%368%448@@@@@@%408@@%302%316%474%425%368%368%368%448@@@@@@%409@@%302%316%474%425%367%367%367%367%448@@@@@@@%410@@%302%316%474%425%368%367%367%367%448@@@@@@@%442@@%302%316%474%425%367%368%367%367%448@@@@@@@%443@@%302%316%474%425%368%368%367%367%448@@@@@@@%444@@%302%316%474%425%367%367%368%367%448@@@@@@@%445@@%316%474%425%368%367%368%367%448@@@@@@@%446@@@@@@@@@@@@@@@@@@@@@"])
  fun op integer_bit_width2num_thm x = x
    val op integer_bit_width2num_thm =
    DT(((("abi_utilities",30),
        [("abi_utilities",
         [3,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]),
         ("bool",[25,53]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%302%317%466%411@@%303@@%302%317%466%402@@%425%367%448@@@@%302%317%466%440@@%425%368%448@@@@%302%317%466%421@@%425%367%367%448@@@@@%302%317%466%441@@%425%368%367%448@@@@@%302%317%466%403@@%425%367%368%448@@@@@%302%317%466%404@@%425%368%368%448@@@@@%302%317%466%396@@%425%367%367%367%448@@@@@@%302%317%466%405@@%425%368%367%367%448@@@@@@%302%317%466%422@@%425%367%368%367%448@@@@@@%302%317%466%406@@%425%368%368%367%448@@@@@@%302%317%466%447@@%425%367%367%368%448@@@@@@%302%317%466%407@@%425%368%367%368%448@@@@@@%302%317%466%408@@%425%367%368%368%448@@@@@@%302%317%466%409@@%425%368%368%368%448@@@@@@%302%317%466%410@@%425%367%367%367%367%448@@@@@@@%302%317%466%442@@%425%368%367%367%367%448@@@@@@@%302%317%466%443@@%425%367%368%367%367%448@@@@@@@%302%317%466%444@@%425%368%368%367%367%448@@@@@@@%302%317%466%445@@%425%367%367%368%367%448@@@@@@@%317%466%446@@%425%368%367%368%367%448@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op integer_bit_width_EQ_integer_bit_width x = x
    val op integer_bit_width_EQ_integer_bit_width =
    DT(((("abi_utilities",31),
        [("abi_utilities",[5]),("bool",[57])]),["DISK_THM"]),
       [read"%280%32%280%43%311%316$1@$0@@%317%466$1@@%466$0@@@|@|@"])
  fun op integer_bit_width_case_def x = x
    val op integer_bit_width_case_def =
    DT(((("abi_utilities",34),
        [("abi_utilities",[30,33]),("bool",[53,55,63]),
         ("numeral",[3,6,7])]),["DISK_THM"]),
       [read"%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%411@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$20@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%402@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$19@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%440@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$18@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%421@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$17@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%441@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$16@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%403@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$15@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%404@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$14@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%396@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$13@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%405@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$12@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%422@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$11@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%406@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$10@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%447@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$9@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%407@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$8@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%408@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$7@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%409@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$6@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%410@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$5@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%442@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$4@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%443@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$3@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%444@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$2@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%445@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$1@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%467%446@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$0@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@@@@@@@@@@"])
  fun op datatype_integer_bit_width x = x
    val op datatype_integer_bit_width =
    DT(((("abi_utilities",35),[("bool",[25,170])]),["DISK_THM"]),
       [read"%382%125%411@%402@%440@%421@%441@%403@%404@%396@%405@%422@%406@%447@%407@%408@%409@%410@%442@%443@%444@%445@%446@@"])
  fun op integer_bit_width_case_cong x = x
    val op integer_bit_width_case_cong =
    DT(((("abi_utilities",36),
        [("abi_utilities",
         [6,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,
          34]),
         ("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("numeral",[3,5,6,7,8,15,16,17]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%280%8%280%14%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%330%302%316$22@$21@@%302%330%316$21@%411@@%305$20@%166@@@%302%330%316$21@%402@@%305$19@%170@@@%302%330%316$21@%440@@%305$18@%196@@@%302%330%316$21@%421@@%305$17@%201@@@%302%330%316$21@%441@@%305$16@%203@@@%302%330%316$21@%403@@%305$15@%205@@@%302%330%316$21@%404@@%305$14@%208@@@%302%330%316$21@%396@@%305$13@%211@@@%302%330%316$21@%405@@%305$12@%213@@@%302%330%316$21@%422@@%305$11@%215@@@%302%330%316$21@%406@@%305$10@%174@@@%302%330%316$21@%447@@%305$9@%177@@@%302%330%316$21@%407@@%305$8@%179@@@%302%330%316$21@%408@@%305$7@%181@@@%302%330%316$21@%409@@%305$6@%183@@@%302%330%316$21@%410@@%305$5@%185@@@%302%330%316$21@%442@@%305$4@%187@@@%302%330%316$21@%443@@%305$3@%189@@@%302%330%316$21@%444@@%305$2@%191@@@%302%330%316$21@%445@@%305$1@%193@@@%330%316$21@%446@@%305$0@%198@@@@@@@@@@@@@@@@@@@@@@@@%305%467$22@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%467$21@%166@%170@%196@%201@%203@%205@%208@%211@%213@%215@%174@%177@%179@%181@%183@%185@%187@%189@%191@%193@%198@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op integer_bit_width_nchotomy x = x
    val op integer_bit_width_nchotomy =
    DT(((("abi_utilities",37),
        [("abi_utilities",
         [6,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]),
         ("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("numeral",[3,5,6,7,8,15,16,17]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%280%32%449%316$0@%411@@%449%316$0@%402@@%449%316$0@%440@@%449%316$0@%421@@%449%316$0@%441@@%449%316$0@%403@@%449%316$0@%404@@%449%316$0@%396@@%449%316$0@%405@@%449%316$0@%422@@%449%316$0@%406@@%449%316$0@%447@@%449%316$0@%407@@%449%316$0@%408@@%449%316$0@%409@@%449%316$0@%410@@%449%316$0@%442@@%449%316$0@%443@@%449%316$0@%444@@%449%316$0@%445@@%316$0@%446@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op integer_bit_width_Axiom x = x
    val op integer_bit_width_Axiom =
    DT(((("abi_utilities",38),
        [("abi_utilities",[30]),("bool",[8,14,25,53,55,63]),
         ("numeral",[3,8])]),["DISK_THM"]),
       [read"%241%220%241%221%241%232%241%234%241%235%241%236%241%237%241%238%241%239%241%240%241%222%241%223%241%224%241%225%241%226%241%227%241%228%241%229%241%230%241%231%241%233%336%82%302%305$0%411@@$21@@%302%305$0%402@@$20@@%302%305$0%440@@$19@@%302%305$0%421@@$18@@%302%305$0%441@@$17@@%302%305$0%403@@$16@@%302%305$0%404@@$15@@%302%305$0%396@@$14@@%302%305$0%405@@$13@@%302%305$0%422@@$12@@%302%305$0%406@@$11@@%302%305$0%447@@$10@@%302%305$0%407@@$9@@%302%305$0%408@@$8@@%302%305$0%409@@$7@@%302%305$0%410@@$6@@%302%305$0%442@@$5@@%302%305$0%443@@$4@@%302%305$0%444@@$3@@%302%305$0%445@@$2@@%305$0%446@@$1@@@@@@@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op integer_bit_width_induction x = x
    val op integer_bit_width_induction =
    DT(((("abi_utilities",39),
        [("abi_utilities",
         [6,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]),
         ("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("numeral",[3,5,6,7,8,15,16,17]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%256%20%330%302$0%396@@%302$0%402@@%302$0%403@@%302$0%404@@%302$0%405@@%302$0%406@@%302$0%407@@%302$0%408@@%302$0%409@@%302$0%410@@%302$0%411@@%302$0%421@@%302$0%422@@%302$0%440@@%302$0%441@@%302$0%442@@%302$0%443@@%302$0%444@@%302$0%445@@%302$0%446@@$0%447@@@@@@@@@@@@@@@@@@@@@@%280%32$1$0@|@@|@"])
  fun op num2relocation_operator_relocation_operator2num x = x
    val op num2relocation_operator_relocation_operator2num =
    DT(((("abi_utilities",43),[("abi_utilities",[42])]),["DISK_THM"]),
       [read"%290%38%327%475%492$0@@@$0@|@"])
  fun op relocation_operator2num_num2relocation_operator x = x
    val op relocation_operator2num_num2relocation_operator =
    DT(((("abi_utilities",44),[("abi_utilities",[42])]),["DISK_THM"]),
       [read"%281%135%311%304$0@%425%367%368%368%367%448@@@@@@@%317%492%475$0@@@$0@@|@"])
  fun op num2relocation_operator_11 x = x
    val op num2relocation_operator_11 =
    DT(((("abi_utilities",45),
        [("abi_utilities",[42]),("bool",[26])]),["DISK_THM"]),
       [read"%281%135%281%139%330%304$1@%425%367%368%368%367%448@@@@@@@%330%304$0@%425%367%368%368%367%448@@@@@@@%311%327%475$1@@%475$0@@@%317$1@$0@@@@|@|@"])
  fun op relocation_operator2num_11 x = x
    val op relocation_operator2num_11 =
    DT(((("abi_utilities",46),
        [("abi_utilities",[42]),("bool",[26])]),["DISK_THM"]),
       [read"%290%38%290%48%311%317%492$1@@%492$0@@@%327$1@$0@@|@|@"])
  fun op num2relocation_operator_ONTO x = x
    val op num2relocation_operator_ONTO =
    DT(((("abi_utilities",47),
        [("abi_utilities",[42]),("bool",[25,62])]),["DISK_THM"]),
       [read"%290%38%351%135%302%327$1@%475$0@@@%304$0@%425%367%368%368%367%448@@@@@@@|@|@"])
  fun op relocation_operator2num_ONTO x = x
    val op relocation_operator2num_ONTO =
    DT(((("abi_utilities",48),
        [("abi_utilities",[42]),("bool",[26])]),["DISK_THM"]),
       [read"%281%135%311%304$0@%425%367%368%368%367%448@@@@@@@%357%38%317$1@%492$0@@|@@|@"])
  fun op num2relocation_operator_thm x = x
    val op num2relocation_operator_thm =
    DT(((("abi_utilities",70),
        [("abi_utilities",
         [49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,
          69])]),[]),
       [read"%302%327%475%303@@%433@@%302%327%475%425%367%448@@@@%418@@%302%327%475%425%368%448@@@@%383@@%302%327%475%425%367%367%448@@@@@%384@@%302%327%475%425%368%367%448@@@@@%427@@%302%327%475%425%367%368%448@@@@@%390@@%302%327%475%425%368%368%448@@@@@%389@@%302%327%475%425%367%367%367%448@@@@@@%391@@%302%327%475%425%368%367%367%448@@@@@@%394@@%302%327%475%425%367%368%367%448@@@@@@%392@@%302%327%475%425%368%368%367%448@@@@@@%385@@%302%327%475%425%367%367%368%448@@@@@@%413@@%302%327%475%425%368%367%368%448@@@@@@%432@@%302%327%475%425%367%368%368%448@@@@@@%412@@%302%327%475%425%368%368%368%448@@@@@@%420@@%302%327%475%425%367%367%367%367%448@@@@@@@%397@@%302%327%475%425%368%367%367%367%448@@@@@@@%395@@%302%327%475%425%367%368%367%367%448@@@@@@@%398@@%302%327%475%425%368%368%367%367%448@@@@@@@%399@@%302%327%475%425%367%367%368%367%448@@@@@@@%400@@%327%475%425%368%367%368%367%448@@@@@@@%401@@@@@@@@@@@@@@@@@@@@@"])
  fun op relocation_operator2num_thm x = x
    val op relocation_operator2num_thm =
    DT(((("abi_utilities",71),
        [("abi_utilities",
         [44,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,
          69]),("bool",[25,53]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%302%317%492%433@@%303@@%302%317%492%418@@%425%367%448@@@@%302%317%492%383@@%425%368%448@@@@%302%317%492%384@@%425%367%367%448@@@@@%302%317%492%427@@%425%368%367%448@@@@@%302%317%492%390@@%425%367%368%448@@@@@%302%317%492%389@@%425%368%368%448@@@@@%302%317%492%391@@%425%367%367%367%448@@@@@@%302%317%492%394@@%425%368%367%367%448@@@@@@%302%317%492%392@@%425%367%368%367%448@@@@@@%302%317%492%385@@%425%368%368%367%448@@@@@@%302%317%492%413@@%425%367%367%368%448@@@@@@%302%317%492%432@@%425%368%367%368%448@@@@@@%302%317%492%412@@%425%367%368%368%448@@@@@@%302%317%492%420@@%425%368%368%368%448@@@@@@%302%317%492%397@@%425%367%367%367%367%448@@@@@@@%302%317%492%395@@%425%368%367%367%367%448@@@@@@@%302%317%492%398@@%425%367%368%367%367%448@@@@@@@%302%317%492%399@@%425%368%368%367%367%448@@@@@@@%302%317%492%400@@%425%367%367%368%367%448@@@@@@@%317%492%401@@%425%368%367%368%367%448@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op relocation_operator_EQ_relocation_operator x = x
    val op relocation_operator_EQ_relocation_operator =
    DT(((("abi_utilities",72),
        [("abi_utilities",[46]),("bool",[57])]),["DISK_THM"]),
       [read"%290%38%290%48%311%327$1@$0@@%317%492$1@@%492$0@@@|@|@"])
  fun op relocation_operator_case_def x = x
    val op relocation_operator_case_def =
    DT(((("abi_utilities",75),
        [("abi_utilities",[71,74]),("bool",[53,55,63]),
         ("numeral",[3,6,7])]),["DISK_THM"]),
       [read"%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%433@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$20@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%418@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$19@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%383@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$18@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%384@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$17@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%427@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$16@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%390@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$15@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%389@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$14@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%391@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$13@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%394@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$12@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%392@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$11@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%385@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$10@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%413@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$9@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%432@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$8@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%412@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$7@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%420@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$6@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%397@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$5@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%395@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$4@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%398@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$3@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%399@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$2@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%302%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%400@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$1@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%305%493%401@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@$0@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@@@@@@@@@@"])
  fun op datatype_relocation_operator x = x
    val op datatype_relocation_operator =
    DT(((("abi_utilities",76),[("bool",[25,170])]),["DISK_THM"]),
       [read"%382%143%433@%418@%383@%384@%427@%390@%389@%391@%394@%392@%385@%413@%432@%412@%420@%397@%395@%398@%399@%400@%401@@"])
  fun op relocation_operator_case_cong x = x
    val op relocation_operator_case_cong =
    DT(((("abi_utilities",77),
        [("abi_utilities",
         [47,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,
          69,75]),
         ("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("numeral",[3,5,6,7,8,15,16,17]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%290%10%290%16%241%165%241%167%241%194%241%199%241%202%241%204%241%206%241%209%241%212%241%214%241%172%241%175%241%178%241%180%241%182%241%184%241%186%241%188%241%190%241%192%241%197%330%302%327$22@$21@@%302%330%327$21@%433@@%305$20@%166@@@%302%330%327$21@%418@@%305$19@%170@@@%302%330%327$21@%383@@%305$18@%196@@@%302%330%327$21@%384@@%305$17@%201@@@%302%330%327$21@%427@@%305$16@%203@@@%302%330%327$21@%390@@%305$15@%205@@@%302%330%327$21@%389@@%305$14@%208@@@%302%330%327$21@%391@@%305$13@%211@@@%302%330%327$21@%394@@%305$12@%213@@@%302%330%327$21@%392@@%305$11@%215@@@%302%330%327$21@%385@@%305$10@%174@@@%302%330%327$21@%413@@%305$9@%177@@@%302%330%327$21@%432@@%305$8@%179@@@%302%330%327$21@%412@@%305$7@%181@@@%302%330%327$21@%420@@%305$6@%183@@@%302%330%327$21@%397@@%305$5@%185@@@%302%330%327$21@%395@@%305$4@%187@@@%302%330%327$21@%398@@%305$3@%189@@@%302%330%327$21@%399@@%305$2@%191@@@%302%330%327$21@%400@@%305$1@%193@@@%330%327$21@%401@@%305$0@%198@@@@@@@@@@@@@@@@@@@@@@@@%305%493$22@$20@$19@$18@$17@$16@$15@$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%493$21@%166@%170@%196@%201@%203@%205@%208@%211@%213@%215@%174@%177@%179@%181@%183@%185@%187@%189@%191@%193@%198@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op relocation_operator_nchotomy x = x
    val op relocation_operator_nchotomy =
    DT(((("abi_utilities",78),
        [("abi_utilities",
         [47,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,
          69]),
         ("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("numeral",[3,5,6,7,8,15,16,17]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%290%38%449%327$0@%433@@%449%327$0@%418@@%449%327$0@%383@@%449%327$0@%384@@%449%327$0@%427@@%449%327$0@%390@@%449%327$0@%389@@%449%327$0@%391@@%449%327$0@%394@@%449%327$0@%392@@%449%327$0@%385@@%449%327$0@%413@@%449%327$0@%432@@%449%327$0@%412@@%449%327$0@%420@@%449%327$0@%397@@%449%327$0@%395@@%449%327$0@%398@@%449%327$0@%399@@%449%327$0@%400@@%327$0@%401@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op relocation_operator_Axiom x = x
    val op relocation_operator_Axiom =
    DT(((("abi_utilities",79),
        [("abi_utilities",[71]),("bool",[8,14,25,53,55,63]),
         ("numeral",[3,8])]),["DISK_THM"]),
       [read"%241%220%241%221%241%232%241%234%241%235%241%236%241%237%241%238%241%239%241%240%241%222%241%223%241%224%241%225%241%226%241%227%241%228%241%229%241%230%241%231%241%233%344%83%302%305$0%433@@$21@@%302%305$0%418@@$20@@%302%305$0%383@@$19@@%302%305$0%384@@$18@@%302%305$0%427@@$17@@%302%305$0%390@@$16@@%302%305$0%389@@$15@@%302%305$0%391@@$14@@%302%305$0%394@@$13@@%302%305$0%392@@$12@@%302%305$0%385@@$11@@%302%305$0%413@@$10@@%302%305$0%432@@$9@@%302%305$0%412@@$8@@%302%305$0%420@@$7@@%302%305$0%397@@$6@@%302%305$0%395@@$5@@%302%305$0%398@@$4@@%302%305$0%399@@$3@@%302%305$0%400@@$2@@%305$0%401@@$1@@@@@@@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op relocation_operator_induction x = x
    val op relocation_operator_induction =
    DT(((("abi_utilities",80),
        [("abi_utilities",
         [47,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,
          69]),
         ("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("numeral",[3,5,6,7,8,15,16,17]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%274%22%330%302$0%383@@%302$0%384@@%302$0%385@@%302$0%389@@%302$0%390@@%302$0%391@@%302$0%392@@%302$0%394@@%302$0%395@@%302$0%397@@%302$0%398@@%302$0%399@@%302$0%400@@%302$0%401@@%302$0%412@@%302$0%413@@%302$0%418@@%302$0%420@@%302$0%427@@%302$0%432@@$0%433@@@@@@@@@@@@@@@@@@@@@@%290%38$1$0@|@@|@"])
  fun op num2relocation_operator2_relocation_operator22num x = x
    val op num2relocation_operator2_relocation_operator22num =
    DT(((("abi_utilities",83),[("abi_utilities",[82])]),["DISK_THM"]),
       [read"%291%39%328%476%489$0@@@$0@|@"])
  fun op relocation_operator22num_num2relocation_operator2 x = x
    val op relocation_operator22num_num2relocation_operator2 =
    DT(((("abi_utilities",84),[("abi_utilities",[82])]),["DISK_THM"]),
       [read"%281%135%311%304$0@%425%367%448@@@@%317%489%476$0@@@$0@@|@"])
  fun op num2relocation_operator2_11 x = x
    val op num2relocation_operator2_11 =
    DT(((("abi_utilities",85),
        [("abi_utilities",[82]),("bool",[26])]),["DISK_THM"]),
       [read"%281%135%281%139%330%304$1@%425%367%448@@@@%330%304$0@%425%367%448@@@@%311%328%476$1@@%476$0@@@%317$1@$0@@@@|@|@"])
  fun op relocation_operator22num_11 x = x
    val op relocation_operator22num_11 =
    DT(((("abi_utilities",86),
        [("abi_utilities",[82]),("bool",[26])]),["DISK_THM"]),
       [read"%291%39%291%49%311%317%489$1@@%489$0@@@%328$1@$0@@|@|@"])
  fun op num2relocation_operator2_ONTO x = x
    val op num2relocation_operator2_ONTO =
    DT(((("abi_utilities",87),
        [("abi_utilities",[82]),("bool",[25,62])]),["DISK_THM"]),
       [read"%291%39%351%135%302%328$1@%476$0@@@%304$0@%425%367%448@@@@|@|@"])
  fun op relocation_operator22num_ONTO x = x
    val op relocation_operator22num_ONTO =
    DT(((("abi_utilities",88),
        [("abi_utilities",[82]),("bool",[26])]),["DISK_THM"]),
       [read"%281%135%311%304$0@%425%367%448@@@@%358%39%317$1@%489$0@@|@@|@"])
  fun op num2relocation_operator2_thm x = x
    val op num2relocation_operator2_thm =
    DT(((("abi_utilities",90),[("abi_utilities",[89])]),[]),
       [read"%328%476%303@@%393@"])
  fun op relocation_operator22num_thm x = x
    val op relocation_operator22num_thm =
    DT(((("abi_utilities",91),
        [("abi_utilities",[84,89]),("bool",[25]),
         ("numeral",[3,7])]),["DISK_THM"]), [read"%317%489%393@@%303@"])
  fun op relocation_operator2_EQ_relocation_operator2 x = x
    val op relocation_operator2_EQ_relocation_operator2 =
    DT(((("abi_utilities",92),
        [("abi_utilities",[86]),("bool",[57])]),["DISK_THM"]),
       [read"%291%39%291%49%311%328$1@$0@@%317%489$1@@%489$0@@@|@|@"])
  fun op relocation_operator2_case_def x = x
    val op relocation_operator2_case_def =
    DT(((("abi_utilities",95),[("abi_utilities",[91,94])]),["DISK_THM"]),
       [read"%241%165%305%490%393@$0@@$0@|@"])
  fun op datatype_relocation_operator2 x = x
    val op datatype_relocation_operator2 =
    DT(((("abi_utilities",96),[("bool",[25,170])]),["DISK_THM"]),
       [read"%382%144%393@@"])
  fun op relocation_operator2_case_cong x = x
    val op relocation_operator2_case_cong =
    DT(((("abi_utilities",97),
        [("abi_utilities",[87,89,95]),
         ("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("numeral",[3,5,6,7,8,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%291%11%291%17%241%165%330%302%328$2@$1@@%330%328$1@%393@@%305$0@%166@@@@%305%490$2@$0@@%490$1@%166@@@|@|@|@"])
  fun op relocation_operator2_nchotomy x = x
    val op relocation_operator2_nchotomy =
    DT(((("abi_utilities",98),
        [("abi_utilities",[87,89]),
         ("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("numeral",[3,5,6,7,8,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%291%39%328$0@%393@|@"])
  fun op relocation_operator2_Axiom x = x
    val op relocation_operator2_Axiom =
    DT(((("abi_utilities",99),
        [("abi_utilities",[91]),("bool",[8,25,55])]),["DISK_THM"]),
       [read"%241%220%346%84%305$0%393@@$1@|@|@"])
  fun op relocation_operator2_induction x = x
    val op relocation_operator2_induction =
    DT(((("abi_utilities",100),
        [("abi_utilities",[87,89]),
         ("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("numeral",[3,5,6,7,8,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%276%23%330$0%393@@%291%39$1$0@|@@|@"])
  fun op datatype_can_fail x = x
    val op datatype_can_fail =
    DT(((("abi_utilities",112),[("bool",[25,170])]),["DISK_THM"]),
       [read"%382%67%378@%379@%380@@"])
  fun op can_fail_11 x = x
    val op can_fail_11 =
    DT(((("abi_utilities",113),
        [("abi_utilities",[103,104,105,106,107,108,109]),
         ("bool",[26,55,62,180]),("ind_type",[33,34])]),["DISK_THM"]),
       [read"%249%31%249%42%311%312%379$1@@%379$0@@@%315$1@$0@@|@|@"])
  fun op can_fail_distinct x = x
    val op can_fail_distinct =
    DT(((("abi_utilities",114),
        [("abi_utilities",[103,104,105,106,107,108,109]),
         ("bool",[25,26,35,46,50,53,55,62,180]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%302%249%31%508%312%378@%379$0@@@|@@%302%508%312%378@%380@@@%249%31%508%312%379$0@@%380@@|@@@"])
  fun op can_fail_case_cong x = x
    val op can_fail_case_cong =
    DT(((("abi_utilities",115),
        [("abi_utilities",[103,104,105,106,107,108,109,110]),
         ("bool",[26,180])]),["DISK_THM"]),
       [read"%245%7%245%13%242%160%255%81%242%168%330%302%312$4@$3@@%302%330%312$3@%378@@%306$2@%164@@@%302%249%31%330%312$4@%379$0@@@%306$2$0@@%87$0@@@|@@%330%312$3@%380@@%306$0@%171@@@@@@%306%452$4@$2@$1@$0@@%452$3@%164@%87@%171@@@|@|@|@|@|@"])
  fun op can_fail_nchotomy x = x
    val op can_fail_nchotomy =
    DT(((("abi_utilities",116),
        [("abi_utilities",[103,104,105,106,107,108,109]),
         ("bool",[26,180])]),["DISK_THM"]),
       [read"%245%68%449%312$0@%378@@%449%333%77%312$1@%379$0@@|@@%312$0@%380@@@|@"])
  fun op can_fail_Axiom x = x
    val op can_fail_Axiom =
    DT(((("abi_utilities",117),
        [("abi_utilities",[103,104,105,106,107,108,109]),("bool",[26,180]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%242%89%255%93%242%97%334%114%302%306$0%378@@$3@@%302%249%31%306$1%379$0@@@$3$0@@|@@%306$0%380@@$1@@@|@|@|@|@"])
  fun op can_fail_induction x = x
    val op can_fail_induction =
    DT(((("abi_utilities",118),
        [("abi_utilities",[103,104,105,106,107,108,109]),
         ("bool",[26])]),["DISK_THM"]),
       [read"%253%19%330%302$0%378@@%302%249%77$1%379$0@@|@@$0%380@@@@%245%66$1$0@|@@|@"])
  fun op datatype_relocation_operator_expression x = x
    val op datatype_relocation_operator_expression =
    DT(((("abi_utilities",153),[("bool",[25,170])]),["DISK_THM"]),
       [read"%382%145%419@%365@%366@%428@%423@%429@@"])
  fun op relocation_operator_expression_11 x = x
    val op relocation_operator_expression_11 =
    DT(((("abi_utilities",154),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,30,35,50,52,55,57,59,62,104,123,131,132,137,180]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%302%241%29%241%40%311%329%419$1@@%419$0@@@%305$1@$0@@|@|@@%302%282%33%282%44%311%329%365$1@@%365$0@@@%318$1@$0@@|@|@@%302%283%34%283%45%311%329%366$1@@%366$0@@@%319$1@$0@@|@|@@%302%285%36%285%47%311%329%428$1@@%428$0@@@%321$1@$0@@|@|@@%302%285%36%285%47%311%329%423$1@@%423$0@@@%321$1@$0@@|@|@@%284%35%284%46%311%329%429$1@@%429$0@@@%320$1@$0@@|@|@@@@@@"])
  fun op relocation_operator_expression_distinct x = x
    val op relocation_operator_expression_distinct =
    DT(((("abi_utilities",155),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,30,35,46,50,52,53,55,57,59,62,104,123,131,132,137,
          180]),("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%302%282%44%241%29%508%329%419$0@@%365$1@@@|@|@@%302%283%45%241%29%508%329%419$0@@%366$1@@@|@|@@%302%285%47%241%29%508%329%419$0@@%428$1@@@|@|@@%302%285%47%241%29%508%329%419$0@@%423$1@@@|@|@@%302%284%46%241%29%508%329%419$0@@%429$1@@@|@|@@%302%283%45%282%33%508%329%365$0@@%366$1@@@|@|@@%302%285%47%282%33%508%329%365$0@@%428$1@@@|@|@@%302%285%47%282%33%508%329%365$0@@%423$1@@@|@|@@%302%284%46%282%33%508%329%365$0@@%429$1@@@|@|@@%302%285%47%283%34%508%329%366$0@@%428$1@@@|@|@@%302%285%47%283%34%508%329%366$0@@%423$1@@@|@|@@%302%284%46%283%34%508%329%366$0@@%429$1@@@|@|@@%302%285%47%285%36%508%329%428$0@@%423$1@@@|@|@@%302%284%46%285%36%508%329%428$0@@%429$1@@@|@|@@%284%46%285%36%508%329%423$0@@%429$1@@@|@|@@@@@@@@@@@@@@@"])
  fun op relocation_operator_expression_case_cong x = x
    val op relocation_operator_expression_case_cong =
    DT(((("abi_utilities",156),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150,151]),
         ("bool",
         [14,15,25,26,30,35,50,52,55,57,59,62,104,123,131,132,137,180]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%292%12%292%18%248%76%258%94%261%98%267%101%267%104%264%107%330%302%329$7@$6@@%302%241%29%330%329$7@%419$0@@@%306$6$0@@%85$0@@@|@@%302%282%33%330%329$7@%365$0@@@%306$5$0@@%96$0@@@|@@%302%283%34%330%329$7@%366$0@@@%306$4$0@@%100$0@@@|@@%302%285%36%330%329$7@%428$0@@@%306$3$0@@%103$0@@@|@@%302%285%36%330%329$7@%423$0@@@%306$2$0@@%106$0@@@|@@%284%35%330%329$7@%429$0@@@%306$1$0@@%109$0@@@|@@@@@@@@%306%498$7@$5@$4@$3@$2@$1@$0@@%498$6@%85@%96@%100@%103@%106@%109@@@|@|@|@|@|@|@|@|@"])
  fun op relocation_operator_expression_nchotomy x = x
    val op relocation_operator_expression_nchotomy =
    DT(((("abi_utilities",157),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,30,35,50,52,55,57,59,62,104,123,131,132,137,180]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%292%154%449%331%29%329$1@%419$0@@|@@%449%352%131%329$1@%365$0@@|@@%449%353%132%329$1@%366$0@@|@@%449%355%134%329$1@%428$0@@|@@%449%355%134%329$1@%423$0@@|@@%354%133%329$1@%429$0@@|@@@@@@|@"])
  fun op relocation_operator_expression_Axiom x = x
    val op relocation_operator_expression_Axiom =
    DT(((("abi_utilities",158),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,30,35,50,52,55,57,59,62,104,123,131,132,137,180]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%248%90%260%95%263%99%269%102%269%105%266%108%277%110%257%111%275%112%279%113%348%116%339%117%340%118%338%119%341%120%302%241%29%306$5%419$0@@@$15$0@@|@@%302%282%33%306$5%365$0@@@$14$0@$2$0@@@|@@%302%283%34%306$5%366$0@@@$13$0@$4$0@@@|@@%302%285%36%306$5%428$0@@@$12$0@$1$0@@@|@@%302%285%36%306$5%423$0@@@$11$0@$1$0@@@|@@%302%284%35%306$5%429$0@@@$10$0@$3$0@@@|@@%302%291%54%285%58%307$5%299$1@$0@@@$10$1@$0@$2$0@@@|@|@@%302%292%55%281%57%308$4%300$1@$0@@@$9$0@$1@$6$1@@@|@|@@%302%290%53%292%60%309$3%297$1@$0@@@$8$1@$0@$6$0@@@|@|@@%292%55%292%60%310$2%301$1@$0@@@$7$1@$0@$6$1@@$6$0@@@|@|@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op relocation_operator_expression_induction x = x
    val op relocation_operator_expression_induction =
    DT(((("abi_utilities",159),
        [("abi_utilities",
         [120,122,124,126,128,129,130,131,132,133,134,135,136,137,138,139,
          140,141,142,143,144,145,146,147,148,149,150]),
         ("bool",
         [14,15,25,26,30,35,50,52,55,57,59,62,104,123,131,132,137,180]),
         ("ind_type",[33,34,37,38,39,40]),("pair",[8,9,21,26]),
         ("sum",[19,20])]),["DISK_THM"]),
       [read"%278%24%262%25%265%26%259%27%268%28%330%302%241%29$5%419$0@@|@@%302%282%131%330$2$0@@$5%365$0@@@|@@%302%283%132%330$4$0@@$5%366$0@@@|@@%302%285%134%330$1$0@@$5%428$0@@@|@@%302%285%134%330$1$0@@$5%423$0@@@|@@%302%284%133%330$3$0@@$5%429$0@@@|@@%302%285%134%330$1$0@@%291%137$5%299$0@$1@@|@@|@@%302%292%138%330$5$0@@%281%130$4%300$1@$0@@|@@|@@%302%292%138%330$5$0@@%290%140$3%297$0@$1@@|@@|@@%292%138%292%141%330%302$6$1@@$6$0@@@$2%301$1@$0@@@|@|@@@@@@@@@@@%302%292%138$5$0@|@@%302%283%132$4$0@|@@%302%284%133$3$0@|@@%302%282%131$2$0@|@@%285%134$1$0@|@@@@@@|@|@|@|@|@"])
  fun op datatype_relocation_frame x = x
    val op datatype_relocation_frame =
    DT(((("abi_utilities",168),[("bool",[25,170])]),["DISK_THM"]),
       [read"%382%142%381@%426@@"])
  fun op relocation_frame_11 x = x
    val op relocation_frame_11 =
    DT(((("abi_utilities",169),
        [("abi_utilities",[161,162,163,164,165]),("bool",[26,55,62,180]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%246%30%246%41%311%326%426$1@@%426$0@@@%314$1@$0@@|@|@"])
  fun op relocation_frame_distinct x = x
    val op relocation_frame_distinct =
    DT(((("abi_utilities",170),
        [("abi_utilities",[161,162,163,164,165]),
         ("bool",[25,26,46,53,62,180]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%246%30%508%326%381@%426$0@@@|@"])
  fun op relocation_frame_case_cong x = x
    val op relocation_frame_case_cong =
    DT(((("abi_utilities",171),
        [("abi_utilities",[161,162,163,164,165,166]),
         ("bool",[26,180])]),["DISK_THM"]),
       [read"%289%9%289%15%241%159%254%80%330%302%326$3@$2@@%302%330%326$2@%381@@%305$1@%163@@@%246%30%330%326$3@%426$0@@@%305$1$0@@%86$0@@@|@@@@%305%487$3@$1@$0@@%487$2@%163@%86@@@|@|@|@|@"])
  fun op relocation_frame_nchotomy x = x
    val op relocation_frame_nchotomy =
    DT(((("abi_utilities",172),
        [("abi_utilities",[161,162,163,164,165]),
         ("bool",[26,180])]),["DISK_THM"]),
       [read"%289%153%449%326$0@%381@@%332%75%326$1@%426$0@@|@@|@"])
  fun op relocation_frame_Axiom x = x
    val op relocation_frame_Axiom =
    DT(((("abi_utilities",173),
        [("abi_utilities",[161,162,163,164,165]),("bool",[26,180]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%241%88%254%92%342%115%302%305$0%381@@$2@@%246%30%305$1%426$0@@@$2$0@@|@@|@|@|@"])
  fun op relocation_frame_induction x = x
    val op relocation_frame_induction =
    DT(((("abi_utilities",174),
        [("abi_utilities",[161,162,163,164,165]),
         ("bool",[26])]),["DISK_THM"]),
       [read"%273%21%330%302$0%381@@%246%75$1%426$0@@|@@@%289%136$1$0@|@@|@"])
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

  local open GrammarSpecials Parse
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
        val tyinfo0 = EnumType.update_tyinfo num2integer_bit_width_thm integer_bit_width2num_thm (SOME ("integer_bit_width", integer_bit_width_EQ_integer_bit_width)) tyinfo0
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
        val tyinfo0 = EnumType.update_tyinfo num2relocation_operator_thm relocation_operator2num_thm (SOME ("relocation_operator", relocation_operator_EQ_relocation_operator)) tyinfo0
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
        val tyinfo0 = EnumType.update_tyinfo num2relocation_operator2_thm relocation_operator22num_thm (SOME ("relocation_operator2", relocation_operator2_EQ_relocation_operator2)) tyinfo0
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
