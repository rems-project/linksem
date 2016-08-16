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
          Arbnum.fromString "1471355441",
          Arbnum.fromString "249218")
          [("abi_amd64_relocation",
           Arbnum.fromString "1471355412",
           Arbnum.fromString "312801"),
           ("abi_amd64_elf_header",
           Arbnum.fromString "1471355219",
           Arbnum.fromString "517953")];
  val _ = Theory.incorporate_types "abi_amd64" [("amd64_abi_feature", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("num", "num"), ID("min", "fun"), ID("min", "bool"),
   ID("elf_interpreted_section", "elf64_interpreted_section"),
   ID("lem_basic_classes", "Ord_class"),
   ID("abi_amd64", "amd64_abi_feature"),
   ID("abi_classes", "AbiFeatureTagEquiv_class"),
   ID("elf_header", "elf64_header"), ID("list", "list"),
   ID("pair", "prod"), ID("fcp", "cart"), ID("fcp", "bit0"),
   ID("one", "one"), ID("option", "option"),
   ID("memory_image", "symbol_definition"), ID("string", "char"),
   ID("error", "error"), ID("lem_basic_classes", "ordering"),
   ID("ind_type", "recspace"), ID("bool", "!"), ID("arithmetic", "*"),
   ID("arithmetic", "+"), ID("pair", ","), ID("bool", "/\\"),
   ID("num", "0"), ID("min", "="), ID("min", "==>"), ID("bool", "?"),
   ID("bool", "ARB"),
   ID("abi_classes", "AbiFeatureTagEquiv_class_abiFeatureTagEquiv_method_fupd"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("string", "CHR"), ID("bool", "COND"),
   ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("pred_set", "EMPTY"), ID("lem_basic_classes", "EQ"), ID("bool", "F"),
   ID("abi_amd64", "GOT0"), ID("lem_basic_classes", "GT"),
   ID("bool", "IN"), ID("pred_set", "INSERT"), ID("combin", "K"),
   ID("lem_basic_classes", "LT"), ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("abi_amd64", "PLT0"), ID("option", "SOME"), ID("num", "SUC"),
   ID("bool", "T"), ID("bool", "TYPE_DEFINITION"),
   ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("abi_amd64", "abiFeatureCompare0"),
   ID("abi_amd64", "abiFeatureTagEq0"),
   ID("abi_amd64", "abi_amd64_compute_program_entry_point"),
   ID("abi_amd64", "amd64_abi_feature_CASE"),
   ID("abi_amd64", "amd64_abi_feature_size"), ID("string", "char_size"),
   ID("elf_header", "elf64_header_elf64_ident"),
   ID("elf_header", "elf64_header_elf64_machine"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_name_as_string"),
   ID("elf_header", "elf_data_2lsb"), ID("elf_header", "elf_ii_data"),
   ID("memory_image", "elf_section_is_special"),
   ID("abi_amd64", "header_is_amd64"),
   ID("abi_amd64", "instance_Abi_classes_AbiFeatureTagEquiv_Abi_amd64_amd64_abi_feature_dict"),
   ID("abi_amd64", "instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict"),
   ID("abi_amd64_elf_header", "is_valid_abi_amd64_machine_architecture"),
   ID("abi_amd64_elf_header", "is_valid_abi_amd64_magic_number"),
   ID("elf_header", "is_valid_elf64_header"), ID("list", "list_CASE"),
   ID("lem_list", "list_index"), ID("list", "list_size"),
   ID("bool", "literal_case"), ID("words", "n2w"),
   ID("basicSize", "option_size"), ID("pair", "pair_CASE"),
   ID("basicSize", "pair_size"), ID("error", "return"),
   ID("abi_amd64", "section_is_special1"),
   ID("abi_amd64", "shf_x86_64_large"),
   ID("memory_image", "symbol_definition_size"), ID("words", "w2n"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYOP [2], TYV "'a", TYOP [1, 2, 1], TYOP [3], TYOP [1, 4, 3],
   TYOP [5], TYOP [4, 6], TYOP [6, 6], TYOP [7], TYOP [1, 9, 1],
   TYOP [1, 6, 0], TYOP [12], TYOP [11, 12], TYOP [11, 13], TYOP [11, 14],
   TYOP [10, 1, 15], TYOP [8, 16], TYOP [9, 0, 17], TYOP [1, 0, 18],
   TYOP [1, 0, 19], TYOP [14], TYOP [13, 21], TYOP [9, 22, 20], TYOP [15],
   TYOP [8, 24], TYOP [9, 25, 23], TYOP [8, 26], TYOP [1, 27, 2],
   TYOP [1, 28, 2], TYOP [9, 25, 22], TYOP [8, 30], TYOP [1, 31, 2],
   TYOP [1, 32, 29], TYOP [1, 6, 33], TYOP [16, 0], TYV "'b",
   TYOP [10, 1, 36], TYOP [1, 37, 35], TYOP [1, 2, 38], TYOP [1, 6, 1],
   TYOP [1, 6, 40], TYOP [17], TYOP [1, 6, 42], TYOP [1, 6, 43],
   TYOP [1, 27, 6], TYOP [1, 31, 6], TYOP [9, 31, 27], TYOP [18, 47],
   TYOP [1, 48, 1], TYOP [1, 45, 1], TYOP [1, 46, 50], TYOP [1, 6, 2],
   TYOP [1, 6, 48], TYOP [1, 3, 1], TYOP [1, 40, 1], TYOP [1, 37, 1],
   TYOP [1, 56, 1], TYOP [1, 10, 1], TYOP [1, 4, 1], TYOP [1, 59, 1],
   TYOP [1, 55, 1], TYOP [1, 32, 1], TYOP [1, 62, 1], TYOP [1, 28, 1],
   TYOP [1, 64, 1], TYOP [1, 49, 1], TYOP [1, 66, 1], TYOP [1, 31, 1],
   TYOP [1, 68, 1], TYOP [1, 27, 1], TYOP [1, 70, 1], TYOP [1, 0, 0],
   TYOP [1, 0, 72], TYOP [9, 6, 6], TYOP [1, 6, 74], TYOP [1, 6, 75],
   TYOP [1, 27, 47], TYOP [1, 31, 77], TYOP [1, 1, 1], TYOP [1, 1, 79],
   TYOP [1, 2, 3], TYOP [1, 8, 1], TYOP [1, 8, 82], TYOP [1, 7, 1],
   TYOP [1, 7, 84], TYOP [1, 24, 1], TYOP [1, 24, 86], TYOP [1, 35, 1],
   TYOP [1, 35, 88], TYOP [1, 31, 68], TYOP [1, 27, 70], TYOP [1, 0, 1],
   TYOP [1, 0, 92], TYOP [13, 16], TYOP [1, 94, 1], TYOP [1, 94, 95],
   TYOP [1, 42, 1], TYOP [1, 42, 97], TYOP [1, 48, 49], TYOP [1, 52, 1],
   TYOP [1, 100, 1], TYOP [1, 53, 1], TYOP [1, 102, 1], TYOP [1, 8, 8],
   TYOP [1, 41, 41], TYOP [1, 105, 104], TYOP [1, 0, 24], TYOP [1, 1, 80],
   TYOP [1, 0, 48], TYOP [1, 109, 48], TYOP [1, 47, 110], TYOP [1, 0, 111],
   TYOP [1, 97, 1], TYOP [1, 42, 113], TYOP [1, 97, 97], TYOP [1, 42, 115],
   TYOP [1, 41, 105], TYOP [1, 44, 44], TYOP [1, 44, 118], TYOP [1, 7, 7],
   TYOP [1, 118, 120], TYOP [1, 105, 120], TYOP [1, 16, 94],
   TYOP [1, 49, 102], TYOP [1, 68, 71], TYOP [1, 6, 125], TYOP [1, 27, 42],
   TYOP [1, 127, 42], TYOP [1, 31, 42], TYOP [1, 129, 128],
   TYOP [1, 6, 130], TYOP [1, 24, 0], TYOP [1, 9, 17], TYOP [11, 15],
   TYOP [10, 1, 134], TYOP [1, 9, 135], TYOP [1, 4, 25], TYOP [1, 17, 1],
   TYOP [1, 25, 1], TYOP [1, 24, 139], TYOP [1, 140, 1], TYOP [1, 1, 141],
   TYOP [1, 25, 142], TYOP [1, 0, 94], TYOP [1, 17, 144], TYOP [1, 25, 0],
   TYOP [1, 132, 146], TYOP [1, 31, 0], TYOP [1, 30, 0],
   TYOP [1, 149, 148], TYOP [1, 27, 0], TYOP [1, 26, 0],
   TYOP [1, 152, 151], TYOP [1, 86, 86], TYOP [1, 0, 16], TYOP [1, 22, 0],
   TYOP [1, 21, 0], TYOP [1, 157, 156], TYOP [1, 41, 1], TYOP [1, 74, 159],
   TYOP [1, 44, 42], TYOP [1, 74, 161], TYOP [1, 156, 149],
   TYOP [1, 146, 163], TYOP [1, 23, 0], TYOP [1, 165, 152],
   TYOP [1, 146, 166], TYOP [1, 20, 0], TYOP [1, 168, 165],
   TYOP [1, 156, 169], TYOP [1, 0, 35], TYOP [1, 37, 0], TYOP [1, 135, 0]]
  end
  val _ = Theory.incorporate_consts "abi_amd64" tyvector
     [("shf_x86_64_large", 0), ("section_is_special1", 5),
      ("instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict", 7),
      ("instance_Abi_classes_AbiFeatureTagEquiv_Abi_amd64_amd64_abi_feature_dict", 8),
      ("header_is_amd64", 10), ("amd64_abi_feature_size", 11),
      ("amd64_abi_feature_CASE", 34),
      ("abi_amd64_compute_program_entry_point", 39),
      ("abiFeatureTagEq0", 41), ("abiFeatureCompare0", 44), ("PLT0", 45),
      ("GOT0", 46)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'amd64_abi_feature'", 49), TMV("M", 6), TMV("M'", 6), TMV("P", 40),
   TMV("a", 6), TMV("a", 31), TMV("a", 27), TMV("a'", 31), TMV("a'", 27),
   TMV("a0", 48), TMV("aa", 6), TMV("amd64_abi_feature", 51),
   TMV("entry", 37), TMV("f", 32), TMV("f'", 32), TMV("f0", 32),
   TMV("f1", 6), TMV("f1", 28), TMV("f1'", 28), TMV("f2", 6),
   TMV("fn", 52), TMV("h", 9), TMV("img", 2), TMV("l", 31), TMV("l", 27),
   TMV("n", 0), TMV("rep", 53), TMV("s", 4), TMV("segs", 2), TMV("v", 6),
   TMV("v", 20), TMV("v1", 6), TMV("v10", 25), TMV("v11", 24),
   TMV("v12", 31), TMV("v13", 27), TMV("v16", 24), TMV("v17", 25),
   TMV("v18", 24), TMV("v2", 24), TMV("v2", 31), TMV("v23", 24),
   TMV("v24", 25), TMV("v25", 24), TMV("v3", 25), TMV("v3", 27),
   TMV("v30", 24), TMV("v31", 25), TMV("v32", 24), TMV("v37", 24),
   TMV("v38", 25), TMV("v39", 24), TMV("v4", 24), TMV("v4", 31),
   TMV("v44", 24), TMV("v45", 25), TMV("v46", 24), TMV("v5", 27),
   TMV("v51", 24), TMV("v52", 25), TMV("v53", 24), TMV("v58", 24),
   TMV("v59", 25), TMV("v6", 31), TMV("v60", 24), TMV("v65", 24),
   TMV("v66", 25), TMV("v7", 27), TMV("v8", 31), TMV("v9", 24),
   TMV("v9", 27), TMC(19, 54), TMC(19, 55), TMC(19, 57), TMC(19, 58),
   TMC(19, 60), TMC(19, 61), TMC(19, 63), TMC(19, 65), TMC(19, 67),
   TMC(19, 69), TMC(19, 71), TMC(19, 66), TMC(20, 73), TMC(21, 73),
   TMC(22, 76), TMC(22, 78), TMC(23, 80), TMC(24, 0), TMC(25, 81),
   TMC(25, 83), TMC(25, 85), TMC(25, 41), TMC(25, 80), TMC(25, 87),
   TMC(25, 89), TMC(25, 90), TMC(25, 91), TMC(25, 93), TMC(25, 96),
   TMC(25, 98), TMC(25, 99), TMC(26, 80), TMC(27, 101), TMC(27, 103),
   TMC(27, 69), TMC(27, 71), TMC(28, 8), TMC(28, 7), TMC(28, 31),
   TMC(28, 27), TMC(29, 106), TMC(30, 72), TMC(31, 72), TMC(32, 48),
   TMC(33, 107), TMC(34, 108), TMC(35, 112), TMC(36, 79), TMC(37, 97),
   TMC(38, 42), TMC(39, 1), TMC(40, 46), TMC(41, 42), TMC(42, 114),
   TMC(43, 116), TMC(44, 117), TMC(44, 119), TMC(45, 42), TMC(46, 72),
   TMC(47, 121), TMC(48, 122), TMC(49, 122), TMC(50, 122), TMC(51, 122),
   TMC(52, 45), TMC(53, 123), TMC(54, 72), TMC(55, 1), TMC(56, 124),
   TMC(57, 0), TMC(58, 80), TMC(59, 44), TMC(60, 41), TMC(61, 39),
   TMC(62, 34), TMC(62, 126), TMC(62, 131), TMC(63, 11), TMC(64, 132),
   TMC(65, 133), TMC(66, 136), TMC(67, 137), TMC(68, 0), TMC(69, 0),
   TMC(70, 5), TMC(71, 10), TMC(72, 8), TMC(73, 7), TMC(74, 92),
   TMC(75, 138), TMC(76, 10), TMC(77, 143), TMC(78, 145), TMC(79, 147),
   TMC(79, 150), TMC(79, 153), TMC(80, 154), TMC(81, 155), TMC(82, 158),
   TMC(83, 160), TMC(83, 162), TMC(84, 164), TMC(84, 167), TMC(84, 170),
   TMC(85, 171), TMC(86, 5), TMC(87, 0), TMC(88, 157), TMC(89, 172),
   TMC(89, 173), TMC(90, 79)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op abi_amd64_compute_program_entry_point_def x = x
    val op abi_amd64_compute_program_entry_point_def =
    DT(((("abi_amd64",0),[]),[]),
       [read"%71%28%73%12%95%144$1@$0@@%175%179$0@@@|@|@"])
  fun op header_is_amd64_def x = x
    val op header_is_amd64_def =
    DT(((("abi_amd64",1),[]),[]),
       [read"%74%21%93%156$0@@%87%161$0@@%87%99%163%150$0@@%154@@%136%168%153@@@@%87%159%180%151$0@@@@%160%150$0@@@@@@|@"])
  fun op shf_x86_64_large_def x = x
    val op shf_x86_64_large_def =
    DT(((("abi_amd64",2),[]),[]),
       [read"%98%177@%83%129%113%112%112%112%112%112%112%112%140@@@@@@@@@@%129%113%112%112%112%112%112%112%112%112%112%112%112%112%112%112%112%112%112%112%112%140@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op amd64_abi_feature_TY_DEF x = x
    val op amd64_abi_feature_TY_DEF =
    DT(((("abi_amd64",3),[("bool",[26])]),["DISK_THM"]),
       [read"%104%26%139%9%79%0%102%82%9%102%141%105%5%101$1@%5%117%88@%86$0@%110@@%25%114|@|$0@@|@@%106%6%101$1@%6%117%137%88@@%86%109@$0@@%25%114|@|$0@@|@@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op amd64_abi_feature_case_def x = x
    val op amd64_abi_feature_case_def =
    DT(((("abi_amd64",9),
        [("abi_amd64",[4,5,6,7,8]),("bool",[26,180]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%87%80%5%77%13%78%17%89%145%122$2@@$1@$0@@$1$2@@|@|@|@@%81%6%77%13%78%17%89%145%135$2@@$1@$0@@$0$2@@|@|@|@@"])
  fun op amd64_abi_feature_size_def x = x
    val op amd64_abi_feature_size_def =
    DT(((("abi_amd64",10),
        [("abi_amd64",[4,5,6,7,8]),("bool",[26,180]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%87%80%5%98%148%122$0@@@%84%129%112%140@@@%165%172%164%149@@%169%178@@@$0@@@|@@%81%6%98%148%135$0@@@%84%129%112%140@@@%166%173%164%149@@%174%169%178@@%30%88|@@@$0@@@|@@"])
  fun op abiFeatureCompare0_def x = x
    val op abiFeatureCompare0_def =
    DT(((("abi_amd64",18),[]),[]),
       [read"%72%16%72%19%100%142$1@$0@@%171%85$1@$0@@%29%31%147$1@%40%147$1@%53%120|@%57%128|@|@%45%147$1@%63%123|@%67%120|@|@||@@|@|@"])
  fun op abiFeatureTagEq0_def x = x
    val op abiFeatureTagEq0_def =
    DT(((("abi_amd64",19),[]),[]),
       [read"%72%16%72%19%93%143$1@$0@@%170%85$1@$0@@%29%31%146$1@%53%146$1@%68%138|@%70%121|@|@%57%146$1@%34%121|@%35%138|@|@||@@|@|@"])
  fun
    op instance_Abi_classes_AbiFeatureTagEquiv_Abi_amd64_amd64_abi_feature_dict_def
    x = x
    val
    op instance_Abi_classes_AbiFeatureTagEquiv_Abi_amd64_amd64_abi_feature_dict_def
    = DT(((("abi_amd64",20),[]),[]), [read"%90%157@%111%126%143@@%107@@"])
  fun op instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict_def
    x = x
    val op instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict_def
    =
    DT(((("abi_amd64",21),[]),[]),
       [read"%91%158@%130%127%142@@%134%126%16%19%100%142$1@$0@@%128@||@@%133%126%16%19%124%142$1@$0@@%125%128@%125%120@%119@@@||@@%132%126%16%19%100%142$1@$0@@%123@||@@%131%126%16%19%124%142$1@$0@@%125%123@%125%120@%119@@@||@@%108@@@@@@"])
  fun op section_is_special1_def x = x
    val op section_is_special1_def =
    DT(((("abi_amd64",22),[]),[]),
       [read"%75%27%71%22%93%176$1@$0@@%141%155$1@$0@@%162%152$1@@%121@%39%44%167%52%116%94$0@%115%129%113%113%113%113%112%140@@@@@@@@@%162$1@%121@%69%32%167%33%116%94$0@%115%129%112%113%113%112%112%113%140@@@@@@@@@@%162$1@%121@%36%37%167%38%116%94$0@%115%129%113%112%112%113%112%113%140@@@@@@@@@@%162$1@%121@%41%42%167%43%116%94$0@%115%129%112%112%112%112%112%113%140@@@@@@@@@@%162$1@%121@%46%47%167%48%116%94$0@%115%129%113%113%113%112%112%113%140@@@@@@@@@@%162$1@%121@%49%50%167%51%116%94$0@%115%129%113%113%112%112%113%113%140@@@@@@@@@@%162$1@%121@%54%55%167%56%116%94$0@%115%129%112%113%112%112%112%113%140@@@@@@@@@@%162$1@%121@%58%59%167%60%116%94$0@%115%129%112%113%113%113%112%113%140@@@@@@@@@@%162$1@%121@%61%62%167%64%116%94$0@%115%129%112%113%113%112%112%113%140@@@@@@@@@@%162$1@%138@%65%66%121||@@%121@|@$1@||@@%121@|@$1@||@@%121@|@$1@||@@%121@|@$1@||@@%121@|@$1@||@@%121@|@$1@||@@%121@|@$1@||@@%121@|@$1@||@@%121@|@$1@||@@@|@|@"])
  fun op datatype_amd64_abi_feature x = x
    val op datatype_amd64_abi_feature =
    DT(((("abi_amd64",11),[("bool",[25,170])]),["DISK_THM"]),
       [read"%118%11%122@%135@@"])
  fun op amd64_abi_feature_11 x = x
    val op amd64_abi_feature_11 =
    DT(((("abi_amd64",12),
        [("abi_amd64",[4,5,6,7,8]),("bool",[26,55,62,180]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%87%80%5%80%7%93%92%122$1@@%122$0@@@%96$1@$0@@|@|@@%81%6%81%8%93%92%135$1@@%135$0@@@%97$1@$0@@|@|@@"])
  fun op amd64_abi_feature_distinct x = x
    val op amd64_abi_feature_distinct =
    DT(((("abi_amd64",13),
        [("abi_amd64",[4,5,6,7,8]),("bool",[25,26,46,53,62,180]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%81%8%80%5%181%92%122$0@@%135$1@@@|@|@"])
  fun op amd64_abi_feature_case_cong x = x
    val op amd64_abi_feature_case_cong =
    DT(((("abi_amd64",14),
        [("abi_amd64",[4,5,6,7,8,9]),("bool",[26,180])]),["DISK_THM"]),
       [read"%72%1%72%2%77%13%78%17%102%87%92$3@$2@@%87%80%5%102%92$3@%122$0@@@%89$2$0@@%14$0@@@|@@%81%6%102%92$3@%135$0@@@%89$1$0@@%18$0@@@|@@@@%89%145$3@$1@$0@@%145$2@%14@%18@@@|@|@|@|@"])
  fun op amd64_abi_feature_nchotomy x = x
    val op amd64_abi_feature_nchotomy =
    DT(((("abi_amd64",15),
        [("abi_amd64",[4,5,6,7,8]),("bool",[26,180])]),["DISK_THM"]),
       [read"%72%10%141%105%23%92$1@%122$0@@|@@%106%24%92$1@%135$0@@|@@|@"])
  fun op amd64_abi_feature_Axiom x = x
    val op amd64_abi_feature_Axiom =
    DT(((("abi_amd64",16),
        [("abi_amd64",[4,5,6,7,8]),("bool",[26,180]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%77%15%78%17%103%20%87%80%5%89$1%122$0@@@$3$0@@|@@%81%6%89$1%135$0@@@$2$0@@|@@|@|@|@"])
  fun op amd64_abi_feature_induction x = x
    val op amd64_abi_feature_induction =
    DT(((("abi_amd64",17),
        [("abi_amd64",[4,5,6,7,8]),("bool",[26])]),["DISK_THM"]),
       [read"%76%3%102%87%80%23$1%122$0@@|@@%81%24$1%135$0@@|@@@%72%4$1$0@|@@|@"])
  end
  val _ = DB.bindl "abi_amd64"
  [("abi_amd64_compute_program_entry_point_def",
    abi_amd64_compute_program_entry_point_def,
    DB.Def), ("header_is_amd64_def",header_is_amd64_def,DB.Def),
   ("shf_x86_64_large_def",shf_x86_64_large_def,DB.Def),
   ("amd64_abi_feature_TY_DEF",amd64_abi_feature_TY_DEF,DB.Def),
   ("amd64_abi_feature_case_def",amd64_abi_feature_case_def,DB.Def),
   ("amd64_abi_feature_size_def",amd64_abi_feature_size_def,DB.Def),
   ("abiFeatureCompare0_def",abiFeatureCompare0_def,DB.Def),
   ("abiFeatureTagEq0_def",abiFeatureTagEq0_def,DB.Def),
   ("instance_Abi_classes_AbiFeatureTagEquiv_Abi_amd64_amd64_abi_feature_dict_def",
    instance_Abi_classes_AbiFeatureTagEquiv_Abi_amd64_amd64_abi_feature_dict_def,
    DB.Def),
   ("instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict_def",
    instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict_def,
    DB.Def), ("section_is_special1_def",section_is_special1_def,DB.Def),
   ("datatype_amd64_abi_feature",datatype_amd64_abi_feature,DB.Thm),
   ("amd64_abi_feature_11",amd64_abi_feature_11,DB.Thm),
   ("amd64_abi_feature_distinct",amd64_abi_feature_distinct,DB.Thm),
   ("amd64_abi_feature_case_cong",amd64_abi_feature_case_cong,DB.Thm),
   ("amd64_abi_feature_nchotomy",amd64_abi_feature_nchotomy,DB.Thm),
   ("amd64_abi_feature_Axiom",amd64_abi_feature_Axiom,DB.Thm),
   ("amd64_abi_feature_induction",amd64_abi_feature_induction,DB.Thm)]

  local open GrammarSpecials Parse
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
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="abi_amd64",Name="plt_entry_content_fn"}, (T"num" "num" [] -->
 (T"num" "num" [] -->
  T"prod" "pair"
   [T"num" "num" [],
    T"list" "list"
     [T"cart" "fcp"
       [bool,
        T"bit0" "fcp"
         [T"bit0" "fcp" [T"bit0" "fcp" [T"one" "one" []]]]]]])))
  val _ = update_grms temp_add_type "amd64_abi_feature"
  val _ = update_grms temp_add_type "amd64_abi_feature"






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
       ("amd64_abi_feature_CASE", (Term.prim_mk_const { Name = "amd64_abi_feature_CASE", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("amd64_abi_feature_size", (Term.prim_mk_const { Name = "amd64_abi_feature_size", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abiFeatureCompare0", (Term.prim_mk_const { Name = "abiFeatureCompare0", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abiFeatureCompare0", (Term.prim_mk_const { Name = "abiFeatureCompare0", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abiFeatureTagEq0", (Term.prim_mk_const { Name = "abiFeatureTagEq0", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abiFeatureTagEq0", (Term.prim_mk_const { Name = "abiFeatureTagEq0", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Abi_classes_AbiFeatureTagEquiv_Abi_amd64_amd64_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Abi_classes_AbiFeatureTagEquiv_Abi_amd64_amd64_abi_feature_dict", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Abi_classes_AbiFeatureTagEquiv_Abi_amd64_amd64_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Abi_classes_AbiFeatureTagEquiv_Abi_amd64_amd64_abi_feature_dict", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict", Thy = "abi_amd64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict", Thy = "abi_amd64"}))
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
           one_one=SOME amd64_abi_feature_11,
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
        "abi_amd64.abi_amd64_compute_program_entry_point_def abi_amd64.instance_Basic_classes_Ord_Abi_amd64_amd64_abi_feature_dict_def abi_amd64.section_is_special1_def abi_amd64.header_is_amd64_def abi_amd64.instance_Abi_classes_AbiFeatureTagEquiv_Abi_amd64_amd64_abi_feature_dict_def abi_amd64.abiFeatureTagEq0_def abi_amd64.abiFeatureCompare0_def abi_amd64.shf_x86_64_large_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_amd64"
end
