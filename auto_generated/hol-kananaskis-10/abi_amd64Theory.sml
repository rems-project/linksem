structure abi_amd64Theory :> abi_amd64Theory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_amd64Theory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open abi_amd64_elf_headerTheory abi_amd64_relocationTheory
  in end;
  val _ = Theory.link_parents
          ("abi_amd64",
          Arbnum.fromString "1445439128",
          Arbnum.fromString "834306")
          [("abi_amd64_relocation",
           Arbnum.fromString "1445439104",
           Arbnum.fromString "22427"),
           ("abi_amd64_elf_header",
           Arbnum.fromString "1445439084",
           Arbnum.fromString "180517")];
  val _ = Theory.incorporate_types "abi_amd64" [("amd64_abi_feature", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("num", "num"), ID("min", "fun"), ID("min", "bool"),
   ID("elf_interpreted_section", "elf64_interpreted_section"),
   ID("abi_amd64", "amd64_abi_feature"),
   ID("memory_image", "ToNaturalList_class"),
   ID("lem_basic_classes", "Ord_class"), ID("elf_header", "elf64_header"),
   ID("list", "list"), ID("error", "error"),
   ID("lem_basic_classes", "ordering"), ID("string", "char"),
   ID("bool", "!"), ID("arithmetic", "*"), ID("pair", ","),
   ID("pair", "prod"), ID("bool", "/\\"), ID("num", "0"),
   ID("prim_rec", "<"), ID("min", "="), ID("option", "option"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
   ID("min", "==>"), ID("arithmetic", ">"), ID("bool", "?"),
   ID("bool", "ARB"), ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("string", "CHR"), ID("bool", "COND"), ID("list", "CONS"),
   ID("bool", "DATATYPE"), ID("pred_set", "EMPTY"),
   ID("lem_basic_classes", "EQ"), ID("bool", "F"), ID("abi_amd64", "GOT0"),
   ID("lem_basic_classes", "GT"), ID("bool", "IN"),
   ID("pred_set", "INSERT"), ID("combin", "K"),
   ID("lem_basic_classes", "LT"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("abi_amd64", "PLT0"), ID("option", "SOME"), ID("bool", "T"),
   ID("bool", "TYPE_DEFINITION"),
   ID("memory_image", "ToNaturalList_class_toNaturalList_method_fupd"),
   ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("abi_amd64", "abiFeatureCompare0"),
   ID("abi_amd64", "abi_amd64_compute_program_entry_point"),
   ID("abi_amd64", "amd64AbiFeatureConstructorToNaturalList"),
   ID("abi_amd64", "amd64_abi_feature2num"),
   ID("abi_amd64", "amd64_abi_feature_CASE"),
   ID("abi_amd64", "amd64_abi_feature_size"),
   ID("elf_header", "elf64_header_elf64_ident"),
   ID("elf_header", "elf64_header_elf64_machine"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_name_as_string"),
   ID("elf_header", "elf_data_2lsb"), ID("elf_header", "elf_ii_data"),
   ID("memory_image", "elf_section_is_special"), ID("lem", "failwith"),
   ID("abi_amd64", "header_is_amd64"), ID("missing_pervasives", "id"),
   ID("abi_amd64", "instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict"),
   ID("abi_amd64", "instance_Memory_image_ToNaturalList_Abi_amd64_amd64_abi_feature_dict"),
   ID("abi_amd64_elf_header", "is_valid_abi_amd64_machine_architecture"),
   ID("abi_amd64_elf_header", "is_valid_abi_amd64_magic_number"),
   ID("elf_header", "is_valid_elf64_header"), ID("list", "list_CASE"),
   ID("lem_list", "list_index"), ID("bool", "literal_case"),
   ID("words", "n2w"), ID("abi_amd64", "num2amd64_abi_feature"),
   ID("pair", "pair_CASE"), ID("error", "return"),
   ID("abi_amd64", "section_is_special1"),
   ID("abi_amd64", "shf_x86_64_large"), ID("words", "w2n"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYOP [2], TYV "'a", TYOP [1, 2, 1], TYOP [3], TYOP [1, 4, 3],
   TYOP [4], TYOP [1, 0, 6], TYOP [5, 6], TYOP [6, 6], TYOP [7],
   TYOP [1, 10, 1], TYOP [1, 6, 0], TYOP [1, 2, 2], TYOP [1, 2, 13],
   TYOP [1, 6, 14], TYOP [8, 0], TYOP [1, 6, 16], TYOP [9, 2],
   TYOP [1, 2, 18], TYV "'b", TYOP [1, 20, 19], TYOP [10], TYOP [1, 6, 22],
   TYOP [1, 6, 23], TYOP [1, 6, 1], TYOP [1, 6, 25], TYOP [1, 6, 2],
   TYOP [11], TYOP [8, 28], TYOP [1, 3, 1], TYOP [1, 20, 1],
   TYOP [1, 31, 1], TYOP [1, 25, 1], TYOP [1, 11, 1], TYOP [1, 4, 1],
   TYOP [1, 35, 1], TYOP [1, 33, 1], TYOP [1, 0, 1], TYOP [1, 38, 1],
   TYOP [1, 0, 0], TYOP [1, 0, 40], TYOP [15, 6, 6], TYOP [1, 6, 42],
   TYOP [1, 6, 43], TYOP [15, 16, 16], TYOP [1, 16, 45], TYOP [1, 16, 46],
   TYOP [1, 1, 1], TYOP [1, 1, 48], TYOP [1, 0, 38], TYOP [1, 2, 3],
   TYOP [1, 9, 1], TYOP [1, 9, 52], TYOP [1, 8, 1], TYOP [1, 8, 54],
   TYOP [1, 28, 1], TYOP [1, 28, 56], TYOP [1, 18, 1], TYOP [1, 18, 58],
   TYOP [1, 16, 1], TYOP [1, 16, 60], TYOP [23], TYOP [22, 62],
   TYOP [22, 63], TYOP [22, 64], TYOP [21, 1, 65], TYOP [20, 66],
   TYOP [1, 67, 1], TYOP [1, 67, 68], TYOP [1, 22, 1], TYOP [1, 22, 70],
   TYOP [1, 27, 1], TYOP [1, 72, 1], TYOP [1, 12, 1], TYOP [1, 74, 1],
   TYOP [1, 0, 28], TYOP [1, 1, 14], TYOP [1, 1, 49], TYOP [1, 22, 22],
   TYOP [1, 22, 79], TYOP [1, 1, 80], TYOP [1, 29, 29], TYOP [1, 28, 82],
   TYOP [1, 16, 16], TYOP [1, 0, 84], TYOP [1, 70, 1], TYOP [1, 22, 86],
   TYOP [1, 70, 70], TYOP [1, 22, 88], TYOP [1, 26, 26], TYOP [1, 26, 90],
   TYOP [1, 24, 24], TYOP [1, 24, 92], TYOP [1, 17, 17], TYOP [1, 17, 94],
   TYOP [1, 9, 9], TYOP [1, 92, 96], TYOP [1, 90, 96], TYOP [1, 66, 67],
   TYOP [1, 38, 74], TYOP [1, 8, 8], TYOP [1, 94, 101], TYOP [1, 16, 84],
   TYOP [1, 6, 103], TYOP [1, 6, 80], TYOP [8, 66], TYOP [1, 10, 106],
   TYOP [22, 65], TYOP [21, 1, 108], TYOP [1, 10, 109], TYOP [1, 4, 29],
   TYOP [1, 29, 22], TYOP [1, 106, 1], TYOP [1, 29, 1], TYOP [1, 28, 114],
   TYOP [1, 115, 1], TYOP [1, 1, 116], TYOP [1, 29, 117], TYOP [1, 16, 22],
   TYOP [1, 0, 119], TYOP [1, 120, 22], TYOP [1, 22, 121],
   TYOP [1, 16, 122], TYOP [1, 0, 67], TYOP [1, 106, 124],
   TYOP [1, 56, 56], TYOP [1, 0, 66], TYOP [1, 24, 22], TYOP [1, 42, 128],
   TYOP [1, 16, 119], TYOP [1, 130, 22], TYOP [1, 45, 131],
   TYOP [1, 109, 0]]
  end
  val _ = Theory.incorporate_consts "abi_amd64" tyvector
     [("shf_x86_64_large", 0), ("section_is_special1", 5),
      ("num2amd64_abi_feature", 7),
      ("instance_Memory_image_ToNaturalList_Abi_amd64_amd64_abi_feature_dict", 8),
      ("instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict", 9),
      ("header_is_amd64", 11), ("amd64_abi_feature_size", 12),
      ("amd64_abi_feature_CASE", 15), ("amd64_abi_feature2num", 12),
      ("amd64AbiFeatureConstructorToNaturalList", 17),
      ("abi_amd64_compute_program_entry_point", 21),
      ("abiFeatureCompare0", 24), ("PLT0", 6), ("GOT0", 6)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 6), TMV("M'", 6), TMV("P", 25), TMV("a", 6), TMV("a'", 6),
   TMV("af", 6), TMV("amd64_abi_feature", 26), TMV("entry", 2),
   TMV("f", 27), TMV("f1", 6), TMV("f2", 6), TMV("h", 10), TMV("hd1", 0),
   TMV("hd2", 0), TMV("img", 2), TMV("m", 0), TMV("n", 0), TMV("r", 0),
   TMV("r'", 0), TMV("rep", 12), TMV("s", 4), TMV("segs", 20),
   TMV("tl1", 16), TMV("tl2", 16), TMV("v", 16), TMV("v0", 2),
   TMV("v0'", 2), TMV("v1", 2), TMV("v1", 16), TMV("v1'", 2),
   TMV("v10", 29), TMV("v11", 28), TMV("v16", 28), TMV("v17", 29),
   TMV("v18", 28), TMV("v2", 6), TMV("v2", 28), TMV("v23", 28),
   TMV("v24", 29), TMV("v25", 28), TMV("v3", 6), TMV("v3", 29),
   TMV("v30", 28), TMV("v31", 29), TMV("v32", 28), TMV("v37", 28),
   TMV("v38", 29), TMV("v39", 28), TMV("v4", 28), TMV("v44", 28),
   TMV("v45", 29), TMV("v46", 28), TMV("v51", 28), TMV("v52", 29),
   TMV("v53", 28), TMV("v58", 28), TMV("v59", 29), TMV("v60", 28),
   TMV("v65", 28), TMV("v66", 29), TMV("v8", 0), TMV("v9", 28),
   TMV("v9", 16), TMV("x", 6), TMV("x0", 2), TMV("x1", 2), TMC(12, 30),
   TMC(12, 32), TMC(12, 33), TMC(12, 34), TMC(12, 36), TMC(12, 37),
   TMC(12, 39), TMC(13, 41), TMC(14, 44), TMC(14, 47), TMC(16, 49),
   TMC(17, 0), TMC(18, 50), TMC(19, 51), TMC(19, 53), TMC(19, 55),
   TMC(19, 26), TMC(19, 49), TMC(19, 57), TMC(19, 59), TMC(19, 61),
   TMC(19, 50), TMC(19, 69), TMC(19, 71), TMC(24, 49), TMC(25, 50),
   TMC(26, 33), TMC(26, 73), TMC(26, 75), TMC(26, 39), TMC(27, 9),
   TMC(27, 8), TMC(28, 40), TMC(29, 40), TMC(30, 76), TMC(31, 77),
   TMC(31, 78), TMC(31, 81), TMC(32, 83), TMC(32, 85), TMC(33, 48),
   TMC(34, 70), TMC(35, 22), TMC(36, 1), TMC(37, 6), TMC(38, 22),
   TMC(39, 87), TMC(40, 89), TMC(41, 91), TMC(41, 93), TMC(41, 95),
   TMC(42, 22), TMC(43, 29), TMC(43, 16), TMC(44, 40), TMC(45, 97),
   TMC(46, 98), TMC(47, 98), TMC(48, 98), TMC(49, 98), TMC(50, 6),
   TMC(51, 99), TMC(52, 1), TMC(53, 100), TMC(54, 102), TMC(55, 0),
   TMC(56, 49), TMC(57, 24), TMC(58, 21), TMC(59, 17), TMC(60, 12),
   TMC(61, 15), TMC(61, 104), TMC(61, 105), TMC(62, 12), TMC(63, 107),
   TMC(64, 110), TMC(65, 111), TMC(66, 0), TMC(67, 0), TMC(68, 5),
   TMC(69, 112), TMC(70, 11), TMC(71, 40), TMC(72, 9), TMC(73, 8),
   TMC(74, 38), TMC(75, 113), TMC(76, 11), TMC(77, 118), TMC(77, 123),
   TMC(78, 125), TMC(79, 126), TMC(80, 127), TMC(81, 7), TMC(82, 129),
   TMC(82, 132), TMC(83, 19), TMC(84, 5), TMC(85, 0), TMC(86, 133),
   TMC(87, 48)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op abi_amd64_compute_program_entry_point_def x = x
    val op abi_amd64_compute_program_entry_point_def =
    DT(((("abi_amd64",0),[]),[]),
       [read"%67%21%66%7%85%134$1@$0@@%163$0@@|@|@"])
  fun op header_is_amd64_def x = x
    val op header_is_amd64_def =
    DT(((("abi_amd64",1),[]),[]),
       [read"%69%11%83%148$0@@%76%154$0@@%76%88%157%141$0@@%149%145@@@%127%159%144@@@@%76%152%166%142$0@@@@%153%141$0@@@@@@|@"])
  fun op shf_x86_64_large_def x = x
    val op shf_x86_64_large_def =
    DT(((("abi_amd64",2),[]),[]),
       [read"%87%165@%73%120%99%98%98%98%98%98%98%98%131@@@@@@@@@@%120%99%98%98%98%98%98%98%98%98%98%98%98%98%98%98%98%98%98%98%98%131@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op amd64_abi_feature_TY_DEF x = x
    val op amd64_abi_feature_TY_DEF =
    DT(((("abi_amd64",3),[("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%94%19%129%16%78$0@%120%99%131@@@|@$0@|@"])
  fun op amd64_abi_feature_BIJ x = x
    val op amd64_abi_feature_BIJ =
    DT(((("abi_amd64",4),[("abi_amd64",[3]),("bool",[117])]),["DISK_THM"]),
       [read"%76%68%3%82%160%136$0@@@$0@|@@%72%17%83%16%78$0@%120%99%131@@@|$0@@%87%136%160$0@@@$0@@|@@"])


  fun op amd64_abi_feature_size_def x = x
    val op amd64_abi_feature_size_def =
    DT(((("abi_amd64",16),[]),[]), [read"%68%63%87%140$0@@%77@|@"])
  fun op amd64_abi_feature_CASE x = x
    val op amd64_abi_feature_CASE =
    DT(((("abi_amd64",17),[]),[]),
       [read"%68%63%66%25%66%27%79%137$2@$1@$0@@%15%101%87$0@%77@@$2@$1@|%136$2@@@|@|@|@"])
  fun op amd64AbiFeatureConstructorToNaturalList_def x = x
    val op amd64AbiFeatureConstructorToNaturalList_def =
    DT(((("abi_amd64",25),[]),[]),
       [read"%68%5%86%135$0@@%138$0@%105%77@%119@@%105%120%98%131@@@%119@@@|@"])
  fun op abiFeatureCompare0_def x = x
    val op abiFeatureCompare0_def =
    DT(((("abi_amd64",26),[]),[]),
       [read"%68%9%68%10%89%133$1@$0@@%162%75%135$1@@%135$0@@@%24%28%156$0@%156$1@%147%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%98%99%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%99%99%131@@@@@@@@@%104%100%120%98%98%98%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%99%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%99%98%99%99%131@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%99%98%98%98%98%131@@@@@@@@@%104%100%120%99%99%98%98%98%98%131@@@@@@@@@%104%100%120%98%99%98%99%98%98%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%98%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%99%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%98%99%98%131@@@@@@@@%104%100%120%98%98%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%98%98%99%131@@@@@@@@%104%100%120%98%99%98%99%98%131@@@@@@@@%118@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%60%62%147%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%98%99%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%99%99%131@@@@@@@@@%104%100%120%98%98%98%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%99%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%99%98%99%99%131@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%99%98%98%98%98%131@@@@@@@@@%104%100%120%99%99%98%98%98%98%131@@@@@@@@@%104%100%120%98%99%98%99%98%98%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%98%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%99%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%98%99%98%131@@@@@@@@%104%100%120%98%98%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%99%98%98%99%131@@@@@@@@%104%100%120%98%99%98%99%98%131@@@@@@@@%118@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@||@@%13%23%156$3@%147%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%98%99%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%99%99%131@@@@@@@@@%104%100%120%98%98%98%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%99%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%99%98%99%99%131@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%99%98%98%98%98%131@@@@@@@@@%104%100%120%99%99%98%98%98%98%131@@@@@@@@@%104%100%120%98%99%98%99%98%98%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%98%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%99%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%98%99%98%131@@@@@@@@%104%100%120%98%98%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%98%98%99%131@@@@@@@@%104%100%120%98%99%98%99%98%131@@@@@@@@%118@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%12%22%103%78$1@$3@@%117@%103%91$1@$3@@%111@%161%74$7@$6@@%35%40%139$1@%139$0@%108@%147%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%98%99%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%99%99%131@@@@@@@@@%104%100%120%98%98%98%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%99%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%99%98%99%99%131@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%98%98%98%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%98%99%98%98%99%131@@@@@@@@@%104%100%120%98%98%98%98%99%99%131@@@@@@@@@%104%100%120%99%99%99%99%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%98%98%98%99%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%99%99%98%99%131@@@@@@@@@%104%100%120%98%98%98%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%98%98%98%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%98%99%98%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%98%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%98%98%99%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%118@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%139$0@%147%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%98%99%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%99%99%131@@@@@@@@@%104%100%120%98%98%98%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%99%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%99%98%99%99%131@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%98%98%98%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%98%99%98%98%99%131@@@@@@@@@%104%100%120%98%98%98%98%99%99%131@@@@@@@@@%104%100%120%99%99%99%99%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%98%98%98%99%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%99%99%98%99%131@@@@@@@@@%104%100%120%98%98%98%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%98%98%98%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%99%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%104%100%120%98%99%98%99%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%99%98%98%99%98%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%98%98%99%131@@@@@@@@@%104%100%120%98%98%99%98%99%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%98%98%99%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%99%98%98%98%98%131@@@@@@@@%104%100%120%98%99%99%98%98%99%131@@@@@@@@@%104%100%120%98%99%98%98%99%99%131@@@@@@@@@%104%100%120%98%99%99%98%99%99%131@@@@@@@@@%104%100%120%98%99%98%98%98%99%131@@@@@@@@@%104%100%120%99%98%99%99%98%99%131@@@@@@@@@%118@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%108@@||@@@||@||@||@@|@|@"])
  fun op instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict_def
    x = x
    val op instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict_def
    =
    DT(((("abi_amd64",27),[]),[]),
       [read"%80%150@%121%115%133@@%125%114%9%10%89%133$1@$0@@%117@||@@%124%114%9%10%112%133$1@$0@@%113%117@%113%108@%107@@@||@@%123%114%9%10%89%133$1@$0@@%111@||@@%122%114%9%10%112%133$1@$0@@%113%111@%113%108@%107@@@||@@%96@@@@@@"])
  fun
    op instance_Memory_image_ToNaturalList_Abi_amd64_amd64_abi_feature_dict_def
    x = x
    val
    op instance_Memory_image_ToNaturalList_Abi_amd64_amd64_abi_feature_dict_def
    = DT(((("abi_amd64",28),[]),[]), [read"%81%151@%130%116%135@@%97@@"])
  fun op section_is_special1_def x = x
    val op section_is_special1_def =
    DT(((("abi_amd64",29),[]),[]),
       [read"%70%20%66%14%83%164$1@$0@@%132%146$1@$0@@%155%143$1@@%109@%36%41%158%48%102%84$0@%100%120%99%99%99%99%98%131@@@@@@@@@%155$1@%109@%61%30%158%31%102%84$0@%100%120%98%99%99%98%98%99%131@@@@@@@@@@%155$1@%109@%32%33%158%34%102%84$0@%100%120%99%98%98%99%98%99%131@@@@@@@@@@%155$1@%109@%37%38%158%39%102%84$0@%100%120%98%98%98%98%98%99%131@@@@@@@@@@%155$1@%109@%42%43%158%44%102%84$0@%100%120%99%99%99%98%98%99%131@@@@@@@@@@%155$1@%109@%45%46%158%47%102%84$0@%100%120%99%99%98%98%99%99%131@@@@@@@@@@%155$1@%109@%49%50%158%51%102%84$0@%100%120%98%99%98%98%98%99%131@@@@@@@@@@%155$1@%109@%52%53%158%54%102%84$0@%100%120%98%99%99%99%98%99%131@@@@@@@@@@%155$1@%109@%55%56%158%57%102%84$0@%100%120%98%99%99%98%98%99%131@@@@@@@@@@%155$1@%128@%58%59%109||@@%109@|@$1@||@@%109@|@$1@||@@%109@|@$1@||@@%109@|@$1@||@@%109@|@$1@||@@%109@|@$1@||@@%109@|@$1@||@@%109@|@$1@||@@%109@|@$1@||@@@|@|@"])
  fun op num2amd64_abi_feature_amd64_abi_feature2num x = x
    val op num2amd64_abi_feature_amd64_abi_feature2num =
    DT(((("abi_amd64",5),[("abi_amd64",[4])]),["DISK_THM"]),
       [read"%68%3%82%160%136$0@@@$0@|@"])
  fun op amd64_abi_feature2num_num2amd64_abi_feature x = x
    val op amd64_abi_feature2num_num2amd64_abi_feature =
    DT(((("abi_amd64",6),[("abi_amd64",[4])]),["DISK_THM"]),
       [read"%72%17%83%78$0@%120%99%131@@@@%87%136%160$0@@@$0@@|@"])
  fun op num2amd64_abi_feature_11 x = x
    val op num2amd64_abi_feature_11 =
    DT(((("abi_amd64",7),[("abi_amd64",[4]),("bool",[26])]),["DISK_THM"]),
       [read"%72%17%72%18%90%78$1@%120%99%131@@@@%90%78$0@%120%99%131@@@@%83%82%160$1@@%160$0@@@%87$1@$0@@@@|@|@"])
  fun op amd64_abi_feature2num_11 x = x
    val op amd64_abi_feature2num_11 =
    DT(((("abi_amd64",8),[("abi_amd64",[4]),("bool",[26])]),["DISK_THM"]),
       [read"%68%3%68%4%83%87%136$1@@%136$0@@@%82$1@$0@@|@|@"])
  fun op num2amd64_abi_feature_ONTO x = x
    val op num2amd64_abi_feature_ONTO =
    DT(((("abi_amd64",9),
        [("abi_amd64",[4]),("bool",[25,63])]),["DISK_THM"]),
       [read"%68%3%95%17%76%82$1@%160$0@@@%78$0@%120%99%131@@@@|@|@"])
  fun op amd64_abi_feature2num_ONTO x = x
    val op amd64_abi_feature2num_ONTO =
    DT(((("abi_amd64",10),[("abi_amd64",[4]),("bool",[26])]),["DISK_THM"]),
       [read"%72%17%83%78$0@%120%99%131@@@@%92%3%87$1@%136$0@@|@@|@"])
  fun op num2amd64_abi_feature_thm x = x
    val op num2amd64_abi_feature_thm =
    DT(((("abi_amd64",13),[("abi_amd64",[11,12])]),[]),
       [read"%76%82%160%77@@%110@@%82%160%120%98%131@@@@%126@@"])
  fun op amd64_abi_feature2num_thm x = x
    val op amd64_abi_feature2num_thm =
    DT(((("abi_amd64",14),
        [("abi_amd64",[6,11,12]),("bool",[25,54]),
         ("numeral",[3,7])]),["DISK_THM"]),
       [read"%76%87%136%110@@%77@@%87%136%126@@%120%98%131@@@@"])
  fun op amd64_abi_feature_EQ_amd64_abi_feature x = x
    val op amd64_abi_feature_EQ_amd64_abi_feature =
    DT(((("abi_amd64",15),[("abi_amd64",[8]),("bool",[58])]),["DISK_THM"]),
       [read"%68%3%68%4%83%82$1@$0@@%87%136$1@@%136$0@@@|@|@"])
  fun op amd64_abi_feature_case_def x = x
    val op amd64_abi_feature_case_def =
    DT(((("abi_amd64",18),
        [("abi_amd64",[14,17]),("bool",[56,64]),
         ("numeral",[3,6])]),["DISK_THM"]),
       [read"%76%66%25%66%27%79%137%110@$1@$0@@$1@|@|@@%66%25%66%27%79%137%126@$1@$0@@$0@|@|@@"])
  fun op datatype_amd64_abi_feature x = x
    val op datatype_amd64_abi_feature =
    DT(((("abi_amd64",19),[("bool",[25,171])]),["DISK_THM"]),
       [read"%106%6%110@%126@@"])
  fun op amd64_abi_feature_distinct x = x
    val op amd64_abi_feature_distinct =
    DT(((("abi_amd64",20),
        [("abi_amd64",[14,15]),("numeral",[3,6])]),["DISK_THM"]),
       [read"%167%82%110@%126@@"])
  fun op amd64_abi_feature_case_cong x = x
    val op amd64_abi_feature_case_cong =
    DT(((("abi_amd64",21),
        [("abi_amd64",[9,11,12,18]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%68%0%68%1%66%25%66%27%90%76%82$3@$2@@%76%90%82$2@%110@@%79$1@%26@@@%90%82$2@%126@@%79$0@%29@@@@@%79%137$3@$1@$0@@%137$2@%26@%29@@@|@|@|@|@"])
  fun op amd64_abi_feature_nchotomy x = x
    val op amd64_abi_feature_nchotomy =
    DT(((("abi_amd64",22),
        [("abi_amd64",[9,11,12]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%68%3%132%82$0@%110@@%82$0@%126@@|@"])
  fun op amd64_abi_feature_Axiom x = x
    val op amd64_abi_feature_Axiom =
    DT(((("abi_amd64",23),
        [("abi_amd64",[14]),("bool",[8,14,25,56,64]),
         ("numeral",[3,8])]),["DISK_THM"]),
       [read"%66%64%66%65%93%8%76%79$0%110@@$2@@%79$0%126@@$1@@|@|@|@"])
  fun op amd64_abi_feature_induction x = x
    val op amd64_abi_feature_induction =
    DT(((("abi_amd64",24),
        [("abi_amd64",[9,11,12]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%71%2%90%76$0%110@@$0%126@@@%68%3$1$0@|@@|@"])
  end
  val _ = DB.bindl "abi_amd64"
  [("abi_amd64_compute_program_entry_point_def",
    abi_amd64_compute_program_entry_point_def,
    DB.Def), ("header_is_amd64_def",header_is_amd64_def,DB.Def),
   ("shf_x86_64_large_def",shf_x86_64_large_def,DB.Def),
   ("amd64_abi_feature_TY_DEF",amd64_abi_feature_TY_DEF,DB.Def),
   ("amd64_abi_feature_BIJ",amd64_abi_feature_BIJ,DB.Def),
   ("amd64_abi_feature_size_def",amd64_abi_feature_size_def,DB.Def),
   ("amd64_abi_feature_CASE",amd64_abi_feature_CASE,DB.Def),
   ("amd64AbiFeatureConstructorToNaturalList_def",
    amd64AbiFeatureConstructorToNaturalList_def,
    DB.Def), ("abiFeatureCompare0_def",abiFeatureCompare0_def,DB.Def),
   ("instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict_def",
    instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict_def,
    DB.Def),
   ("instance_Memory_image_ToNaturalList_Abi_amd64_amd64_abi_feature_dict_def",
    instance_Memory_image_ToNaturalList_Abi_amd64_amd64_abi_feature_dict_def,
    DB.Def), ("section_is_special1_def",section_is_special1_def,DB.Def),
   ("num2amd64_abi_feature_amd64_abi_feature2num",
    num2amd64_abi_feature_amd64_abi_feature2num,
    DB.Thm),
   ("amd64_abi_feature2num_num2amd64_abi_feature",
    amd64_abi_feature2num_num2amd64_abi_feature,
    DB.Thm), ("num2amd64_abi_feature_11",num2amd64_abi_feature_11,DB.Thm),
   ("amd64_abi_feature2num_11",amd64_abi_feature2num_11,DB.Thm),
   ("num2amd64_abi_feature_ONTO",num2amd64_abi_feature_ONTO,DB.Thm),
   ("amd64_abi_feature2num_ONTO",amd64_abi_feature2num_ONTO,DB.Thm),
   ("num2amd64_abi_feature_thm",num2amd64_abi_feature_thm,DB.Thm),
   ("amd64_abi_feature2num_thm",amd64_abi_feature2num_thm,DB.Thm),
   ("amd64_abi_feature_EQ_amd64_abi_feature",
    amd64_abi_feature_EQ_amd64_abi_feature,
    DB.Thm),
   ("amd64_abi_feature_case_def",amd64_abi_feature_case_def,DB.Thm),
   ("datatype_amd64_abi_feature",datatype_amd64_abi_feature,DB.Thm),
   ("amd64_abi_feature_distinct",amd64_abi_feature_distinct,DB.Thm),
   ("amd64_abi_feature_case_cong",amd64_abi_feature_case_cong,DB.Thm),
   ("amd64_abi_feature_nchotomy",amd64_abi_feature_nchotomy,DB.Thm),
   ("amd64_abi_feature_Axiom",amd64_abi_feature_Axiom,DB.Thm),
   ("amd64_abi_feature_induction",amd64_abi_feature_induction,DB.Thm)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("abi_amd64_relocationTheory.abi_amd64_relocation_grammars",
                          abi_amd64_relocationTheory.abi_amd64_relocation_grammars),
                         ("abi_amd64_elf_headerTheory.abi_amd64_elf_header_grammars",
                          abi_amd64_elf_headerTheory.abi_amd64_elf_header_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_compute_program_entry_point", (Term.prim_mk_const { Name = "abi_amd64_compute_program_entry_point", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_compute_program_entry_point", (Term.prim_mk_const { Name = "abi_amd64_compute_program_entry_point", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("header_is_amd64", (Term.prim_mk_const { Name = "header_is_amd64", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("header_is_amd64", (Term.prim_mk_const { Name = "header_is_amd64", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_x86_64_large", (Term.prim_mk_const { Name = "shf_x86_64_large", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_x86_64_large", (Term.prim_mk_const { Name = "shf_x86_64_large", Thy = "abi_amd64"}))
  val _ = update_grms temp_add_type "amd64_abi_feature"
  val _ = update_grms temp_add_type "amd64_abi_feature"
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("amd64_abi_feature2num", (Term.prim_mk_const { Name = "amd64_abi_feature2num", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("num2amd64_abi_feature", (Term.prim_mk_const { Name = "num2amd64_abi_feature", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GOT0", (Term.prim_mk_const { Name = "GOT0", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GOT0", (Term.prim_mk_const { Name = "GOT0", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("PLT0", (Term.prim_mk_const { Name = "PLT0", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("PLT0", (Term.prim_mk_const { Name = "PLT0", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("amd64_abi_feature_size", (Term.prim_mk_const { Name = "amd64_abi_feature_size", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("amd64_abi_feature_size", (Term.prim_mk_const { Name = "amd64_abi_feature_size", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("amd64_abi_feature_CASE", (Term.prim_mk_const { Name = "amd64_abi_feature_CASE", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("amd64_abi_feature_CASE", (Term.prim_mk_const { Name = "amd64_abi_feature_CASE", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("amd64AbiFeatureConstructorToNaturalList", (Term.prim_mk_const { Name = "amd64AbiFeatureConstructorToNaturalList", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("amd64AbiFeatureConstructorToNaturalList", (Term.prim_mk_const { Name = "amd64AbiFeatureConstructorToNaturalList", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abiFeatureCompare0", (Term.prim_mk_const { Name = "abiFeatureCompare0", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abiFeatureCompare0", (Term.prim_mk_const { Name = "abiFeatureCompare0", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Memory_image_ToNaturalList_Abi_amd64_amd64_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Memory_image_ToNaturalList_Abi_amd64_amd64_abi_feature_dict", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Memory_image_ToNaturalList_Abi_amd64_amd64_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Memory_image_ToNaturalList_Abi_amd64_amd64_abi_feature_dict", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("section_is_special1", (Term.prim_mk_const { Name = "section_is_special1", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("section_is_special1", (Term.prim_mk_const { Name = "section_is_special1", Thy = "abi_amd64"}))
  val abi_amd64_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG amd64_abi_feature_Axiom,
           case_def=amd64_abi_feature_case_def,
           case_cong=amd64_abi_feature_case_cong,
           induction=ORIG amd64_abi_feature_induction,
           nchotomy=amd64_abi_feature_nchotomy,
           size=SOME(Parse.Term`(abi_amd64$amd64_abi_feature_size) :(abi_amd64$amd64_abi_feature) -> (num$num)`,
                     ORIG amd64_abi_feature_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=SOME amd64_abi_feature_distinct,
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
    thy = "abi_amd64",
    thydataty = "compute",
    data =
        "abi_amd64.abi_amd64_compute_program_entry_point_def abi_amd64.section_is_special1_def abi_amd64.instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict_def abi_amd64.instance_Memory_image_ToNaturalList_Abi_amd64_amd64_abi_feature_dict_def abi_amd64.amd64AbiFeatureConstructorToNaturalList_def abi_amd64.abiFeatureCompare0_def abi_amd64.header_is_amd64_def abi_amd64.shf_x86_64_large_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_amd64"
end
