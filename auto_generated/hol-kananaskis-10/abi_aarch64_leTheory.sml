structure abi_aarch64_leTheory :> abi_aarch64_leTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_aarch64_leTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open abi_aarch64_le_elf_headerTheory abi_aarch64_relocationTheory
  in end;
  val _ = Theory.link_parents
          ("abi_aarch64_le",
          Arbnum.fromString "1471355448",
          Arbnum.fromString "957011")
          [("abi_aarch64_relocation",
           Arbnum.fromString "1471355406",
           Arbnum.fromString "848692"),
           ("abi_aarch64_le_elf_header",
           Arbnum.fromString "1471355219",
           Arbnum.fromString "93628")];
  val _ = Theory.incorporate_types "abi_aarch64_le"
       [("aarch64_le_abi_feature", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"),
   ID("elf_interpreted_section", "elf64_interpreted_section"),
   ID("abi_aarch64_le", "aarch64_le_abi_feature"), ID("num", "num"),
   ID("lem_basic_classes", "Ord_class"),
   ID("abi_classes", "AbiFeatureTagEquiv_class"),
   ID("elf_header", "elf64_header"), ID("error", "error"),
   ID("fcp", "cart"), ID("lem_basic_classes", "ordering"), ID("bool", "!"),
   ID("pair", ","), ID("pair", "prod"), ID("bool", "/\\"), ID("num", "0"),
   ID("prim_rec", "<"), ID("min", "="), ID("option", "option"),
   ID("fcp", "bit0"), ID("one", "one"), ID("min", "==>"), ID("bool", "?"),
   ID("bool", "ARB"),
   ID("abi_classes", "AbiFeatureTagEquiv_class_abiFeatureTagEquiv_method_fupd"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"), ID("bool", "COND"),
   ID("bool", "DATATYPE"), ID("pred_set", "EMPTY"),
   ID("lem_basic_classes", "EQ"), ID("bool", "F"),
   ID("abi_aarch64_le", "GOT"), ID("lem_basic_classes", "GT"),
   ID("bool", "IN"), ID("pred_set", "INSERT"), ID("combin", "K"),
   ID("lem_basic_classes", "LT"), ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("abi_aarch64_le", "PLT"), ID("option", "SOME"), ID("bool", "T"),
   ID("bool", "TYPE_DEFINITION"), ID("arithmetic", "ZERO"),
   ID("bool", "\\/"), ID("abi_aarch64_le", "aarch64_le_abi_feature2num"),
   ID("abi_aarch64_le", "aarch64_le_abi_feature_CASE"),
   ID("abi_aarch64_le", "aarch64_le_abi_feature_size"),
   ID("abi_aarch64_le", "abiFeatureCompare"),
   ID("abi_aarch64_le", "abiFeatureTagEq"),
   ID("abi_aarch64_le", "abi_aarch64_le_compute_program_entry_point"),
   ID("elf_header", "elf64_header_elf64_ident"), ID("list", "list"),
   ID("elf_header", "elf64_header_elf64_machine"),
   ID("elf_header", "elf_data_2lsb"), ID("elf_header", "elf_ii_data"),
   ID("memory_image", "elf_section_is_special"),
   ID("abi_aarch64_le", "header_is_aarch64_le"),
   ID("abi_aarch64_le", "instance_Abi_classes_AbiFeatureTagEquiv_Abi_aarch64_le_aarch64_le_abi_feature_dict"),
   ID("abi_aarch64_le", "instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict"),
   ID("abi_aarch64_le_elf_header", "is_valid_abi_aarch64_le_machine_architecture"),
   ID("abi_aarch64_le_elf_header", "is_valid_abi_aarch64_le_magic_number"),
   ID("elf_header", "is_valid_elf64_header"), ID("lem_list", "list_index"),
   ID("words", "n2w"), ID("abi_aarch64_le", "num2aarch64_le_abi_feature"),
   ID("pair", "pair_CASE"), ID("error", "return"),
   ID("abi_aarch64_le", "section_is_special0"), ID("words", "w2n"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYV "'a", TYOP [0, 1, 0], TYOP [2], TYOP [0, 3, 2], TYOP [3],
   TYOP [4], TYOP [0, 6, 5], TYOP [5, 5], TYOP [6, 5], TYOP [7],
   TYOP [0, 10, 0], TYOP [8, 6], TYV "'b", TYOP [9, 0, 13],
   TYOP [0, 14, 12], TYOP [0, 1, 15], TYOP [0, 5, 0], TYOP [0, 5, 17],
   TYOP [10], TYOP [0, 5, 19], TYOP [0, 5, 20], TYOP [0, 5, 6],
   TYOP [0, 1, 1], TYOP [0, 1, 23], TYOP [0, 5, 24], TYOP [0, 5, 1],
   TYOP [0, 2, 0], TYOP [0, 17, 0], TYOP [0, 14, 0], TYOP [0, 29, 0],
   TYOP [0, 11, 0], TYOP [0, 3, 0], TYOP [0, 32, 0], TYOP [0, 28, 0],
   TYOP [0, 6, 0], TYOP [0, 35, 0], TYOP [13, 5, 5], TYOP [0, 5, 37],
   TYOP [0, 5, 38], TYOP [0, 0, 0], TYOP [0, 0, 40], TYOP [0, 6, 35],
   TYOP [0, 1, 2], TYOP [0, 9, 0], TYOP [0, 9, 44], TYOP [0, 8, 0],
   TYOP [0, 8, 46], TYOP [0, 12, 0], TYOP [0, 12, 48], TYOP [20],
   TYOP [19, 50], TYOP [19, 51], TYOP [19, 52], TYOP [9, 0, 53],
   TYOP [18, 54], TYOP [0, 55, 0], TYOP [0, 55, 56], TYOP [0, 19, 0],
   TYOP [0, 19, 58], TYOP [0, 26, 0], TYOP [0, 60, 0], TYOP [0, 22, 0],
   TYOP [0, 62, 0], TYOP [0, 9, 9], TYOP [0, 18, 18], TYOP [0, 65, 64],
   TYOP [0, 6, 6], TYOP [0, 0, 24], TYOP [0, 58, 0], TYOP [0, 19, 69],
   TYOP [0, 58, 58], TYOP [0, 19, 71], TYOP [0, 18, 65], TYOP [0, 21, 21],
   TYOP [0, 21, 74], TYOP [0, 8, 8], TYOP [0, 74, 76], TYOP [0, 65, 76],
   TYOP [0, 54, 55], TYOP [0, 35, 62], TYOP [0, 5, 41], TYOP [0, 19, 19],
   TYOP [0, 19, 82], TYOP [0, 5, 83], TYOP [57, 54], TYOP [0, 10, 85],
   TYOP [19, 53], TYOP [9, 0, 87], TYOP [0, 10, 88], TYOP [0, 85, 0],
   TYOP [0, 6, 55], TYOP [0, 85, 91], TYOP [0, 6, 54], TYOP [0, 18, 0],
   TYOP [0, 37, 94], TYOP [0, 21, 19], TYOP [0, 37, 96], TYOP [0, 6, 12],
   TYOP [0, 14, 6], TYOP [0, 88, 6]]
  end
  val _ = Theory.incorporate_consts "abi_aarch64_le" tyvector
     [("section_is_special0", 4), ("num2aarch64_le_abi_feature", 7),
      ("instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict", 8),
      ("instance_Abi_classes_AbiFeatureTagEquiv_Abi_aarch64_le_aarch64_le_abi_feature_dict", 9),
      ("header_is_aarch64_le", 11),
      ("abi_aarch64_le_compute_program_entry_point", 16),
      ("abiFeatureTagEq", 18), ("abiFeatureCompare", 21),
      ("aarch64_le_abi_feature_size", 22),
      ("aarch64_le_abi_feature_CASE", 25),
      ("aarch64_le_abi_feature2num", 22), ("PLT", 5), ("GOT", 5)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 5), TMV("M'", 5), TMV("P", 17), TMV("a", 5), TMV("a'", 5),
   TMV("aarch64_le_abi_feature", 18), TMV("entry", 14), TMV("f", 1),
   TMV("f", 26), TMV("f1", 5), TMV("f2", 5), TMV("h", 10), TMV("m", 6),
   TMV("n", 6), TMV("r", 6), TMV("r'", 6), TMV("rep", 22), TMV("s", 3),
   TMV("segs", 1), TMV("v", 5), TMV("v0", 1), TMV("v0'", 1), TMV("v1", 1),
   TMV("v1", 5), TMV("v1'", 1), TMV("x", 5), TMV("x0", 1), TMV("x1", 1),
   TMC(11, 27), TMC(11, 28), TMC(11, 30), TMC(11, 31), TMC(11, 33),
   TMC(11, 34), TMC(11, 36), TMC(12, 39), TMC(14, 41), TMC(15, 6),
   TMC(16, 42), TMC(17, 43), TMC(17, 45), TMC(17, 47), TMC(17, 18),
   TMC(17, 41), TMC(17, 49), TMC(17, 42), TMC(17, 57), TMC(17, 59),
   TMC(21, 41), TMC(22, 28), TMC(22, 61), TMC(22, 63), TMC(22, 36),
   TMC(23, 9), TMC(23, 8), TMC(24, 66), TMC(25, 67), TMC(26, 67),
   TMC(27, 68), TMC(28, 40), TMC(29, 58), TMC(30, 19), TMC(31, 0),
   TMC(32, 5), TMC(33, 19), TMC(34, 70), TMC(35, 72), TMC(36, 73),
   TMC(36, 75), TMC(37, 19), TMC(38, 67), TMC(39, 77), TMC(40, 78),
   TMC(41, 78), TMC(42, 78), TMC(43, 78), TMC(44, 5), TMC(45, 79),
   TMC(46, 0), TMC(47, 80), TMC(48, 6), TMC(49, 41), TMC(50, 22),
   TMC(51, 25), TMC(51, 81), TMC(51, 84), TMC(52, 22), TMC(53, 21),
   TMC(54, 18), TMC(55, 16), TMC(56, 86), TMC(58, 89), TMC(59, 6),
   TMC(60, 6), TMC(61, 4), TMC(62, 11), TMC(63, 9), TMC(64, 8),
   TMC(65, 35), TMC(66, 90), TMC(67, 11), TMC(68, 92), TMC(69, 93),
   TMC(70, 7), TMC(71, 95), TMC(71, 97), TMC(72, 98), TMC(73, 4),
   TMC(74, 99), TMC(74, 100), TMC(75, 40)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op abi_aarch64_le_compute_program_entry_point_def x = x
    val op abi_aarch64_le_compute_program_entry_point_def =
    DT(((("abi_aarch64_le",0),[]),[]),
       [read"%28%18%30%6%44%89$1@$0@@%106%108$0@@@|@|@"])
  fun op header_is_aarch64_le_def x = x
    val op header_is_aarch64_le_def =
    DT(((("abi_aarch64_le",1),[]),[]),
       [read"%31%11%43%95$0@@%36%100$0@@%36%46%101%90$0@@%93@@%77%102%92@@@@%36%98%109%91$0@@@@%99%90$0@@@@@@|@"])
  fun op aarch64_le_abi_feature_TY_DEF x = x
    val op aarch64_le_abi_feature_TY_DEF =
    DT(((("abi_aarch64_le",2),
        [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%51%16%79%13%38$0@%70%57%80@@@|@$0@|@"])
  fun op aarch64_le_abi_feature_BIJ x = x
    val op aarch64_le_abi_feature_BIJ =
    DT(((("abi_aarch64_le",3),
        [("abi_aarch64_le",[2]),("bool",[116])]),["DISK_THM"]),
       [read"%36%29%3%42%103%82$0@@@$0@|@@%34%14%43%13%38$0@%70%57%80@@@|$0@@%45%82%103$0@@@$0@@|@@"])


  fun op aarch64_le_abi_feature_size_def x = x
    val op aarch64_le_abi_feature_size_def =
    DT(((("abi_aarch64_le",15),[]),[]), [read"%29%25%45%86$0@@%37@|@"])
  fun op aarch64_le_abi_feature_CASE x = x
    val op aarch64_le_abi_feature_CASE =
    DT(((("abi_aarch64_le",16),[]),[]),
       [read"%29%25%28%20%28%22%39%83$2@$1@$0@@%12%58%45$0@%37@@$2@$1@|%82$2@@@|@|@|@"])
  fun op abiFeatureCompare_def x = x
    val op abiFeatureCompare_def =
    DT(((("abi_aarch64_le",24),[]),[]),
       [read"%29%9%29%10%47%87$1@$0@@%105%35$1@$0@@%19%23%85$1@%85$0@%61@%69@@%85$0@%64@%61@@||@@|@|@"])
  fun op abiFeatureTagEq_def x = x
    val op abiFeatureTagEq_def =
    DT(((("abi_aarch64_le",25),[]),[]),
       [read"%29%9%29%10%43%88$1@$0@@%104%35$1@$0@@%19%23%84$1@%84$0@%78@%62@@%84$0@%62@%78@@||@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict_def
    =
    DT(((("abi_aarch64_le",26),[]),[]),
       [read"%41%97@%71%68%87@@%75%67%9%10%47%87$1@$0@@%69@||@@%74%67%9%10%65%87$1@$0@@%66%69@%66%61@%60@@@||@@%73%67%9%10%47%87$1@$0@@%64@||@@%72%67%9%10%65%87$1@$0@@%66%64@%66%61@%60@@@||@@%54@@@@@@"])
  fun
    op instance_Abi_classes_AbiFeatureTagEquiv_Abi_aarch64_le_aarch64_le_abi_feature_dict_def
    x = x
    val
    op instance_Abi_classes_AbiFeatureTagEquiv_Abi_aarch64_le_aarch64_le_abi_feature_dict_def
    = DT(((("abi_aarch64_le",27),[]),[]), [read"%40%96@%55%67%88@@%53@@"])
  fun op section_is_special0_def x = x
    val op section_is_special0_def =
    DT(((("abi_aarch64_le",28),[]),[]),
       [read"%32%17%28%7%43%107$1@$0@@%81%94$1@$0@@%62@@|@|@"])
  fun op num2aarch64_le_abi_feature_aarch64_le_abi_feature2num x = x
    val op num2aarch64_le_abi_feature_aarch64_le_abi_feature2num =
    DT(((("abi_aarch64_le",4),[("abi_aarch64_le",[3])]),["DISK_THM"]),
       [read"%29%3%42%103%82$0@@@$0@|@"])
  fun op aarch64_le_abi_feature2num_num2aarch64_le_abi_feature x = x
    val op aarch64_le_abi_feature2num_num2aarch64_le_abi_feature =
    DT(((("abi_aarch64_le",5),[("abi_aarch64_le",[3])]),["DISK_THM"]),
       [read"%34%14%43%38$0@%70%57%80@@@@%45%82%103$0@@@$0@@|@"])
  fun op num2aarch64_le_abi_feature_11 x = x
    val op num2aarch64_le_abi_feature_11 =
    DT(((("abi_aarch64_le",6),
        [("abi_aarch64_le",[3]),("bool",[26])]),["DISK_THM"]),
       [read"%34%14%34%15%48%38$1@%70%57%80@@@@%48%38$0@%70%57%80@@@@%43%42%103$1@@%103$0@@@%45$1@$0@@@@|@|@"])
  fun op aarch64_le_abi_feature2num_11 x = x
    val op aarch64_le_abi_feature2num_11 =
    DT(((("abi_aarch64_le",7),
        [("abi_aarch64_le",[3]),("bool",[26])]),["DISK_THM"]),
       [read"%29%3%29%4%43%45%82$1@@%82$0@@@%42$1@$0@@|@|@"])
  fun op num2aarch64_le_abi_feature_ONTO x = x
    val op num2aarch64_le_abi_feature_ONTO =
    DT(((("abi_aarch64_le",8),
        [("abi_aarch64_le",[3]),("bool",[25,62])]),["DISK_THM"]),
       [read"%29%3%52%14%36%42$1@%103$0@@@%38$0@%70%57%80@@@@|@|@"])
  fun op aarch64_le_abi_feature2num_ONTO x = x
    val op aarch64_le_abi_feature2num_ONTO =
    DT(((("abi_aarch64_le",9),
        [("abi_aarch64_le",[3]),("bool",[26])]),["DISK_THM"]),
       [read"%34%14%43%38$0@%70%57%80@@@@%49%3%45$1@%82$0@@|@@|@"])
  fun op num2aarch64_le_abi_feature_thm x = x
    val op num2aarch64_le_abi_feature_thm =
    DT(((("abi_aarch64_le",12),[("abi_aarch64_le",[10,11])]),[]),
       [read"%36%42%103%37@@%63@@%42%103%70%56%80@@@@%76@@"])
  fun op aarch64_le_abi_feature2num_thm x = x
    val op aarch64_le_abi_feature2num_thm =
    DT(((("abi_aarch64_le",13),
        [("abi_aarch64_le",[5,10,11]),("bool",[25,53]),
         ("numeral",[3,7])]),["DISK_THM"]),
       [read"%36%45%82%63@@%37@@%45%82%76@@%70%56%80@@@@"])
  fun op aarch64_le_abi_feature_EQ_aarch64_le_abi_feature x = x
    val op aarch64_le_abi_feature_EQ_aarch64_le_abi_feature =
    DT(((("abi_aarch64_le",14),
        [("abi_aarch64_le",[7]),("bool",[57])]),["DISK_THM"]),
       [read"%29%3%29%4%43%42$1@$0@@%45%82$1@@%82$0@@@|@|@"])
  fun op aarch64_le_abi_feature_case_def x = x
    val op aarch64_le_abi_feature_case_def =
    DT(((("abi_aarch64_le",17),
        [("abi_aarch64_le",[13,16]),("bool",[55,63]),
         ("numeral",[3,6])]),["DISK_THM"]),
       [read"%36%28%20%28%22%39%83%63@$1@$0@@$1@|@|@@%28%20%28%22%39%83%76@$1@$0@@$0@|@|@@"])
  fun op datatype_aarch64_le_abi_feature x = x
    val op datatype_aarch64_le_abi_feature =
    DT(((("abi_aarch64_le",18),[("bool",[25,170])]),["DISK_THM"]),
       [read"%59%5%63@%76@@"])
  fun op aarch64_le_abi_feature_distinct x = x
    val op aarch64_le_abi_feature_distinct =
    DT(((("abi_aarch64_le",19),
        [("abi_aarch64_le",[13,14]),("numeral",[3,6])]),["DISK_THM"]),
       [read"%110%42%63@%76@@"])
  fun op aarch64_le_abi_feature_case_cong x = x
    val op aarch64_le_abi_feature_case_cong =
    DT(((("abi_aarch64_le",20),
        [("abi_aarch64_le",[8,10,11,17]),
         ("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%29%0%29%1%28%20%28%22%48%36%42$3@$2@@%36%48%42$2@%63@@%39$1@%21@@@%48%42$2@%76@@%39$0@%24@@@@@%39%83$3@$1@$0@@%83$2@%21@%24@@@|@|@|@|@"])
  fun op aarch64_le_abi_feature_nchotomy x = x
    val op aarch64_le_abi_feature_nchotomy =
    DT(((("abi_aarch64_le",21),
        [("abi_aarch64_le",[8,10,11]),
         ("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%29%3%81%42$0@%63@@%42$0@%76@@|@"])
  fun op aarch64_le_abi_feature_Axiom x = x
    val op aarch64_le_abi_feature_Axiom =
    DT(((("abi_aarch64_le",22),
        [("abi_aarch64_le",[13]),("bool",[8,14,25,55,63]),
         ("numeral",[3,8])]),["DISK_THM"]),
       [read"%28%26%28%27%50%8%36%39$0%63@@$2@@%39$0%76@@$1@@|@|@|@"])
  fun op aarch64_le_abi_feature_induction x = x
    val op aarch64_le_abi_feature_induction =
    DT(((("abi_aarch64_le",23),
        [("abi_aarch64_le",[8,10,11]),
         ("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%33%2%48%36$0%63@@$0%76@@@%29%3$1$0@|@@|@"])
  end
  val _ = DB.bindl "abi_aarch64_le"
  [("abi_aarch64_le_compute_program_entry_point_def",
    abi_aarch64_le_compute_program_entry_point_def,
    DB.Def), ("header_is_aarch64_le_def",header_is_aarch64_le_def,DB.Def),
   ("aarch64_le_abi_feature_TY_DEF",aarch64_le_abi_feature_TY_DEF,DB.Def),
   ("aarch64_le_abi_feature_BIJ",aarch64_le_abi_feature_BIJ,DB.Def),
   ("aarch64_le_abi_feature_size_def",
    aarch64_le_abi_feature_size_def,
    DB.Def),
   ("aarch64_le_abi_feature_CASE",aarch64_le_abi_feature_CASE,DB.Def),
   ("abiFeatureCompare_def",abiFeatureCompare_def,DB.Def),
   ("abiFeatureTagEq_def",abiFeatureTagEq_def,DB.Def),
   ("instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict_def",
    instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict_def,
    DB.Def),
   ("instance_Abi_classes_AbiFeatureTagEquiv_Abi_aarch64_le_aarch64_le_abi_feature_dict_def",
    instance_Abi_classes_AbiFeatureTagEquiv_Abi_aarch64_le_aarch64_le_abi_feature_dict_def,
    DB.Def), ("section_is_special0_def",section_is_special0_def,DB.Def),
   ("num2aarch64_le_abi_feature_aarch64_le_abi_feature2num",
    num2aarch64_le_abi_feature_aarch64_le_abi_feature2num,
    DB.Thm),
   ("aarch64_le_abi_feature2num_num2aarch64_le_abi_feature",
    aarch64_le_abi_feature2num_num2aarch64_le_abi_feature,
    DB.Thm),
   ("num2aarch64_le_abi_feature_11",num2aarch64_le_abi_feature_11,DB.Thm),
   ("aarch64_le_abi_feature2num_11",aarch64_le_abi_feature2num_11,DB.Thm),
   ("num2aarch64_le_abi_feature_ONTO",
    num2aarch64_le_abi_feature_ONTO,
    DB.Thm),
   ("aarch64_le_abi_feature2num_ONTO",
    aarch64_le_abi_feature2num_ONTO,
    DB.Thm),
   ("num2aarch64_le_abi_feature_thm",
    num2aarch64_le_abi_feature_thm,
    DB.Thm),
   ("aarch64_le_abi_feature2num_thm",
    aarch64_le_abi_feature2num_thm,
    DB.Thm),
   ("aarch64_le_abi_feature_EQ_aarch64_le_abi_feature",
    aarch64_le_abi_feature_EQ_aarch64_le_abi_feature,
    DB.Thm),
   ("aarch64_le_abi_feature_case_def",
    aarch64_le_abi_feature_case_def,
    DB.Thm),
   ("datatype_aarch64_le_abi_feature",
    datatype_aarch64_le_abi_feature,
    DB.Thm),
   ("aarch64_le_abi_feature_distinct",
    aarch64_le_abi_feature_distinct,
    DB.Thm),
   ("aarch64_le_abi_feature_case_cong",
    aarch64_le_abi_feature_case_cong,
    DB.Thm),
   ("aarch64_le_abi_feature_nchotomy",
    aarch64_le_abi_feature_nchotomy,
    DB.Thm),
   ("aarch64_le_abi_feature_Axiom",aarch64_le_abi_feature_Axiom,DB.Thm),
   ("aarch64_le_abi_feature_induction",
    aarch64_le_abi_feature_induction,
    DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("abi_aarch64_relocationTheory.abi_aarch64_relocation_grammars",
                          abi_aarch64_relocationTheory.abi_aarch64_relocation_grammars),
                         ("abi_aarch64_le_elf_headerTheory.abi_aarch64_le_elf_header_grammars",
                          abi_aarch64_le_elf_headerTheory.abi_aarch64_le_elf_header_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_aarch64_le_compute_program_entry_point", (Term.prim_mk_const { Name = "abi_aarch64_le_compute_program_entry_point", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_aarch64_le_compute_program_entry_point", (Term.prim_mk_const { Name = "abi_aarch64_le_compute_program_entry_point", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("header_is_aarch64_le", (Term.prim_mk_const { Name = "header_is_aarch64_le", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("header_is_aarch64_le", (Term.prim_mk_const { Name = "header_is_aarch64_le", Thy = "abi_aarch64_le"}))
  val _ = update_grms temp_add_type "aarch64_le_abi_feature"
  val _ = update_grms temp_add_type "aarch64_le_abi_feature"
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("aarch64_le_abi_feature2num", (Term.prim_mk_const { Name = "aarch64_le_abi_feature2num", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("num2aarch64_le_abi_feature", (Term.prim_mk_const { Name = "num2aarch64_le_abi_feature", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GOT", (Term.prim_mk_const { Name = "GOT", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("GOT", (Term.prim_mk_const { Name = "GOT", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("PLT", (Term.prim_mk_const { Name = "PLT", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("PLT", (Term.prim_mk_const { Name = "PLT", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("aarch64_le_abi_feature_size", (Term.prim_mk_const { Name = "aarch64_le_abi_feature_size", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("aarch64_le_abi_feature_size", (Term.prim_mk_const { Name = "aarch64_le_abi_feature_size", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("aarch64_le_abi_feature_CASE", (Term.prim_mk_const { Name = "aarch64_le_abi_feature_CASE", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("aarch64_le_abi_feature_CASE", (Term.prim_mk_const { Name = "aarch64_le_abi_feature_CASE", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abiFeatureCompare", (Term.prim_mk_const { Name = "abiFeatureCompare", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abiFeatureCompare", (Term.prim_mk_const { Name = "abiFeatureCompare", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abiFeatureTagEq", (Term.prim_mk_const { Name = "abiFeatureTagEq", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abiFeatureTagEq", (Term.prim_mk_const { Name = "abiFeatureTagEq", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Abi_classes_AbiFeatureTagEquiv_Abi_aarch64_le_aarch64_le_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Abi_classes_AbiFeatureTagEquiv_Abi_aarch64_le_aarch64_le_abi_feature_dict", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Abi_classes_AbiFeatureTagEquiv_Abi_aarch64_le_aarch64_le_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Abi_classes_AbiFeatureTagEquiv_Abi_aarch64_le_aarch64_le_abi_feature_dict", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("section_is_special0", (Term.prim_mk_const { Name = "section_is_special0", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("section_is_special0", (Term.prim_mk_const { Name = "section_is_special0", Thy = "abi_aarch64_le"}))
  val abi_aarch64_le_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG aarch64_le_abi_feature_Axiom,
           case_def=aarch64_le_abi_feature_case_def,
           case_cong=aarch64_le_abi_feature_case_cong,
           induction=ORIG aarch64_le_abi_feature_induction,
           nchotomy=aarch64_le_abi_feature_nchotomy,
           size=SOME(Parse.Term`(abi_aarch64_le$aarch64_le_abi_feature_size) :(abi_aarch64_le$aarch64_le_abi_feature) -> (num$num)`,
                     ORIG aarch64_le_abi_feature_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=SOME aarch64_le_abi_feature_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo num2aarch64_le_abi_feature_thm aarch64_le_abi_feature2num_thm NONE tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "abi_aarch64_le",
    thydataty = "compute",
    data =
        "abi_aarch64_le.abi_aarch64_le_compute_program_entry_point_def abi_aarch64_le.section_is_special0_def abi_aarch64_le.header_is_aarch64_le_def abi_aarch64_le.instance_Abi_classes_AbiFeatureTagEquiv_Abi_aarch64_le_aarch64_le_abi_feature_dict_def abi_aarch64_le.instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict_def abi_aarch64_le.abiFeatureTagEq_def abi_aarch64_le.abiFeatureCompare_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_aarch64_le"
end
