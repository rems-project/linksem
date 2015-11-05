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
          Arbnum.fromString "1445439040",
          Arbnum.fromString "154509")
          [("abi_aarch64_relocation",
           Arbnum.fromString "1445439008",
           Arbnum.fromString "134500"),
           ("abi_aarch64_le_elf_header",
           Arbnum.fromString "1445438988",
           Arbnum.fromString "708351")];
  val _ = Theory.incorporate_types "abi_aarch64_le"
       [("aarch64_le_abi_feature", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"),
   ID("elf_interpreted_section", "elf64_interpreted_section"),
   ID("abi_aarch64_le", "aarch64_le_abi_feature"), ID("num", "num"),
   ID("memory_image", "ToNaturalList_class"),
   ID("lem_basic_classes", "Ord_class"), ID("elf_header", "elf64_header"),
   ID("error", "error"), ID("lem_basic_classes", "ordering"),
   ID("list", "list"), ID("bool", "!"), ID("pair", ","),
   ID("pair", "prod"), ID("bool", "/\\"), ID("num", "0"),
   ID("prim_rec", "<"), ID("min", "="), ID("option", "option"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
   ID("min", "==>"), ID("arithmetic", ">"), ID("bool", "?"),
   ID("bool", "ARB"), ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("string", "CHR"), ID("string", "char"), ID("bool", "COND"),
   ID("list", "CONS"), ID("bool", "DATATYPE"), ID("pred_set", "EMPTY"),
   ID("lem_basic_classes", "EQ"), ID("bool", "F"),
   ID("abi_aarch64_le", "GOT"), ID("lem_basic_classes", "GT"),
   ID("bool", "IN"), ID("pred_set", "INSERT"), ID("combin", "K"),
   ID("lem_basic_classes", "LT"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("abi_aarch64_le", "PLT"), ID("option", "SOME"),
   ID("bool", "TYPE_DEFINITION"),
   ID("memory_image", "ToNaturalList_class_toNaturalList_method_fupd"),
   ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("abi_aarch64_le", "aarch64LeAbiFeatureConstructorToNaturalList"),
   ID("abi_aarch64_le", "aarch64_le_abi_feature2num"),
   ID("abi_aarch64_le", "aarch64_le_abi_feature_CASE"),
   ID("abi_aarch64_le", "aarch64_le_abi_feature_size"),
   ID("abi_aarch64_le", "abiFeatureCompare"),
   ID("abi_aarch64_le", "abi_aarch64_le_compute_program_entry_point"),
   ID("elf_header", "elf64_header_elf64_ident"),
   ID("elf_header", "elf64_header_elf64_machine"),
   ID("elf_header", "elf_data_2lsb"), ID("elf_header", "elf_ii_data"),
   ID("memory_image", "elf_section_is_special"), ID("lem", "failwith"),
   ID("abi_aarch64_le", "header_is_aarch64_le"),
   ID("missing_pervasives", "id"),
   ID("abi_aarch64_le", "instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict"),
   ID("abi_aarch64_le", "instance_Memory_image_ToNaturalList_Abi_aarch64_le_aarch64_le_abi_feature_dict"),
   ID("abi_aarch64_le_elf_header", "is_valid_abi_aarch64_le_machine_architecture"),
   ID("abi_aarch64_le_elf_header", "is_valid_abi_aarch64_le_magic_number"),
   ID("elf_header", "is_valid_elf64_header"), ID("list", "list_CASE"),
   ID("lem_list", "list_index"), ID("words", "n2w"),
   ID("abi_aarch64_le", "num2aarch64_le_abi_feature"),
   ID("pair", "pair_CASE"), ID("error", "return"),
   ID("abi_aarch64_le", "section_is_special0"), ID("words", "w2n"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYV "'a", TYOP [0, 1, 0], TYOP [2], TYOP [0, 3, 2], TYOP [3],
   TYOP [4], TYOP [0, 6, 5], TYOP [5, 5], TYOP [6, 5], TYOP [7],
   TYOP [0, 10, 0], TYOP [8, 1], TYOP [0, 1, 12], TYV "'b",
   TYOP [0, 14, 13], TYOP [9], TYOP [0, 5, 16], TYOP [0, 5, 17],
   TYOP [0, 5, 6], TYOP [0, 1, 1], TYOP [0, 1, 20], TYOP [0, 5, 21],
   TYOP [10, 6], TYOP [0, 5, 23], TYOP [0, 5, 0], TYOP [0, 5, 25],
   TYOP [0, 5, 1], TYOP [0, 2, 0], TYOP [0, 14, 0], TYOP [0, 29, 0],
   TYOP [0, 25, 0], TYOP [0, 11, 0], TYOP [0, 3, 0], TYOP [0, 33, 0],
   TYOP [0, 31, 0], TYOP [0, 6, 0], TYOP [0, 36, 0], TYOP [13, 5, 5],
   TYOP [0, 5, 38], TYOP [0, 5, 39], TYOP [13, 23, 23], TYOP [0, 23, 41],
   TYOP [0, 23, 42], TYOP [0, 0, 0], TYOP [0, 0, 44], TYOP [0, 6, 36],
   TYOP [0, 1, 2], TYOP [0, 9, 0], TYOP [0, 9, 48], TYOP [0, 8, 0],
   TYOP [0, 8, 50], TYOP [0, 12, 0], TYOP [0, 12, 52], TYOP [0, 23, 0],
   TYOP [0, 23, 54], TYOP [21], TYOP [20, 56], TYOP [20, 57],
   TYOP [20, 58], TYOP [19, 0, 59], TYOP [18, 60], TYOP [0, 61, 0],
   TYOP [0, 61, 62], TYOP [0, 16, 0], TYOP [0, 16, 64], TYOP [0, 27, 0],
   TYOP [0, 66, 0], TYOP [0, 19, 0], TYOP [0, 68, 0], TYOP [0, 6, 6],
   TYOP [29], TYOP [0, 6, 71], TYOP [0, 0, 21], TYOP [0, 16, 16],
   TYOP [0, 16, 74], TYOP [0, 0, 75], TYOP [10, 71], TYOP [0, 77, 77],
   TYOP [0, 71, 78], TYOP [0, 23, 23], TYOP [0, 6, 80], TYOP [0, 64, 0],
   TYOP [0, 16, 82], TYOP [0, 64, 64], TYOP [0, 16, 84], TYOP [0, 26, 26],
   TYOP [0, 26, 86], TYOP [0, 18, 18], TYOP [0, 18, 88], TYOP [0, 24, 24],
   TYOP [0, 24, 90], TYOP [0, 9, 9], TYOP [0, 88, 92], TYOP [0, 86, 92],
   TYOP [0, 60, 61], TYOP [0, 36, 68], TYOP [0, 8, 8], TYOP [0, 90, 97],
   TYOP [0, 23, 80], TYOP [0, 5, 99], TYOP [0, 5, 75], TYOP [10, 60],
   TYOP [0, 10, 102], TYOP [20, 59], TYOP [19, 0, 104], TYOP [0, 10, 105],
   TYOP [0, 77, 16], TYOP [0, 102, 0], TYOP [0, 23, 16], TYOP [0, 6, 109],
   TYOP [0, 110, 16], TYOP [0, 16, 111], TYOP [0, 23, 112],
   TYOP [0, 6, 61], TYOP [0, 102, 114], TYOP [0, 6, 60], TYOP [0, 18, 16],
   TYOP [0, 38, 117], TYOP [0, 23, 109], TYOP [0, 119, 16],
   TYOP [0, 41, 120], TYOP [0, 105, 6]]
  end
  val _ = Theory.incorporate_consts "abi_aarch64_le" tyvector
     [("section_is_special0", 4), ("num2aarch64_le_abi_feature", 7),
      ("instance_Memory_image_ToNaturalList_Abi_aarch64_le_aarch64_le_abi_feature_dict", 8),
      ("instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict", 9),
      ("header_is_aarch64_le", 11),
      ("abi_aarch64_le_compute_program_entry_point", 15),
      ("abiFeatureCompare", 18), ("aarch64_le_abi_feature_size", 19),
      ("aarch64_le_abi_feature_CASE", 22),
      ("aarch64_le_abi_feature2num", 19),
      ("aarch64LeAbiFeatureConstructorToNaturalList", 24), ("PLT", 5),
      ("GOT", 5)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 5), TMV("M'", 5), TMV("P", 25), TMV("a", 5), TMV("a'", 5),
   TMV("aarch64_le_abi_feature", 26), TMV("af", 5), TMV("entry", 1),
   TMV("f", 1), TMV("f", 27), TMV("f1", 5), TMV("f2", 5), TMV("h", 10),
   TMV("hd1", 6), TMV("hd2", 6), TMV("m", 6), TMV("n", 6), TMV("r", 6),
   TMV("r'", 6), TMV("rep", 19), TMV("s", 3), TMV("segs", 14),
   TMV("tl1", 23), TMV("tl2", 23), TMV("v", 23), TMV("v0", 1),
   TMV("v0'", 1), TMV("v1", 1), TMV("v1", 23), TMV("v1'", 1), TMV("v2", 5),
   TMV("v3", 5), TMV("v8", 6), TMV("v9", 23), TMV("x", 5), TMV("x0", 1),
   TMV("x1", 1), TMC(11, 28), TMC(11, 30), TMC(11, 31), TMC(11, 32),
   TMC(11, 34), TMC(11, 35), TMC(11, 37), TMC(12, 40), TMC(12, 43),
   TMC(14, 45), TMC(15, 6), TMC(16, 46), TMC(17, 47), TMC(17, 49),
   TMC(17, 51), TMC(17, 26), TMC(17, 45), TMC(17, 53), TMC(17, 55),
   TMC(17, 46), TMC(17, 63), TMC(17, 65), TMC(22, 45), TMC(23, 46),
   TMC(24, 31), TMC(24, 67), TMC(24, 69), TMC(24, 37), TMC(25, 9),
   TMC(25, 8), TMC(26, 70), TMC(27, 70), TMC(28, 72), TMC(30, 73),
   TMC(30, 76), TMC(31, 79), TMC(31, 81), TMC(32, 44), TMC(33, 64),
   TMC(34, 16), TMC(35, 0), TMC(36, 5), TMC(37, 16), TMC(38, 83),
   TMC(39, 85), TMC(40, 87), TMC(40, 89), TMC(40, 91), TMC(41, 16),
   TMC(42, 77), TMC(42, 23), TMC(43, 70), TMC(44, 93), TMC(45, 94),
   TMC(46, 94), TMC(47, 94), TMC(48, 94), TMC(49, 5), TMC(50, 95),
   TMC(51, 96), TMC(52, 98), TMC(53, 6), TMC(54, 45), TMC(55, 24),
   TMC(56, 19), TMC(57, 22), TMC(57, 100), TMC(57, 101), TMC(58, 19),
   TMC(59, 18), TMC(60, 15), TMC(61, 103), TMC(62, 106), TMC(63, 6),
   TMC(64, 6), TMC(65, 4), TMC(66, 107), TMC(67, 11), TMC(68, 70),
   TMC(69, 9), TMC(70, 8), TMC(71, 36), TMC(72, 108), TMC(73, 11),
   TMC(74, 113), TMC(75, 115), TMC(76, 116), TMC(77, 7), TMC(78, 118),
   TMC(78, 121), TMC(79, 13), TMC(80, 4), TMC(81, 122), TMC(82, 44)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op abi_aarch64_le_compute_program_entry_point_def x = x
    val op abi_aarch64_le_compute_program_entry_point_def =
    DT(((("abi_aarch64_le",0),[]),[]),
       [read"%38%21%37%7%54%107$1@$0@@%127$0@@|@|@"])
  fun op header_is_aarch64_le_def x = x
    val op header_is_aarch64_le_def =
    DT(((("abi_aarch64_le",1),[]),[]),
       [read"%40%12%53%114$0@@%46%120$0@@%46%57%122%108$0@@%115%111@@@%95%123%110@@@@%46%118%129%109$0@@@@%119%108$0@@@@@@|@"])
  fun op aarch64_le_abi_feature_TY_DEF x = x
    val op aarch64_le_abi_feature_TY_DEF =
    DT(((("abi_aarch64_le",2),
        [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%63%19%96%16%48$0@%88%68%98@@@|@$0@|@"])
  fun op aarch64_le_abi_feature_BIJ x = x
    val op aarch64_le_abi_feature_BIJ =
    DT(((("abi_aarch64_le",3),
        [("abi_aarch64_le",[2]),("bool",[117])]),["DISK_THM"]),
       [read"%46%39%3%52%124%101$0@@@$0@|@@%43%17%53%16%48$0@%88%68%98@@@|$0@@%56%101%124$0@@@$0@@|@@"])


  fun op aarch64_le_abi_feature_size_def x = x
    val op aarch64_le_abi_feature_size_def =
    DT(((("abi_aarch64_le",15),[]),[]), [read"%39%34%56%105$0@@%47@|@"])
  fun op aarch64_le_abi_feature_CASE x = x
    val op aarch64_le_abi_feature_CASE =
    DT(((("abi_aarch64_le",16),[]),[]),
       [read"%39%34%37%25%37%27%49%102$2@$1@$0@@%15%70%56$0@%47@@$2@$1@|%101$2@@@|@|@|@"])
  fun op aarch64LeAbiFeatureConstructorToNaturalList_def x = x
    val op aarch64LeAbiFeatureConstructorToNaturalList_def =
    DT(((("abi_aarch64_le",24),[]),[]),
       [read"%39%6%55%100$0@@%103$0@%73%47@%87@@%73%88%67%98@@@%87@@@|@"])
  fun op abiFeatureCompare_def x = x
    val op abiFeatureCompare_def =
    DT(((("abi_aarch64_le",25),[]),[]),
       [read"%39%10%39%11%58%106$1@$0@@%126%45%100$1@@%100$0@@@%24%28%121$0@%121$1@%113%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%67%68%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%68%68%98@@@@@@@@@%72%69%88%67%67%67%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%68%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%68%67%68%68%98@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%68%67%67%67%67%98@@@@@@@@@%72%69%88%68%68%67%67%67%67%98@@@@@@@@@%72%69%88%67%68%67%68%67%67%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%67%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%68%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%67%68%67%98@@@@@@@@%72%69%88%67%67%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%67%67%68%98@@@@@@@@%72%69%88%67%68%67%68%67%98@@@@@@@@%86@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%32%33%113%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%67%68%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%68%68%98@@@@@@@@@%72%69%88%67%67%67%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%68%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%68%67%68%68%98@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%68%67%67%67%67%98@@@@@@@@@%72%69%88%68%68%67%67%67%67%98@@@@@@@@@%72%69%88%67%68%67%68%67%67%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%67%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%68%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%67%68%67%98@@@@@@@@%72%69%88%67%67%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%68%67%67%68%98@@@@@@@@%72%69%88%67%68%67%68%67%98@@@@@@@@%86@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@||@@%14%23%121$3@%113%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%67%68%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%68%68%98@@@@@@@@@%72%69%88%67%67%67%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%68%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%68%67%68%68%98@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%68%67%67%67%67%98@@@@@@@@@%72%69%88%68%68%67%67%67%67%98@@@@@@@@@%72%69%88%67%68%67%68%67%67%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%67%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%68%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%67%68%67%98@@@@@@@@%72%69%88%67%67%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%67%67%68%98@@@@@@@@%72%69%88%67%68%67%68%67%98@@@@@@@@%86@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%13%22%71%48$1@$3@@%85@%71%60$1@$3@@%79@%125%44$7@$6@@%30%31%104$1@%104$0@%76@%113%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%67%68%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%68%68%98@@@@@@@@@%72%69%88%67%67%67%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%68%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%68%67%68%68%98@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%67%67%67%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%67%68%67%67%68%98@@@@@@@@@%72%69%88%67%67%67%67%68%68%98@@@@@@@@@%72%69%88%68%68%68%68%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%67%67%67%68%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%68%68%67%68%98@@@@@@@@@%72%69%88%67%67%67%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%67%67%67%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%67%68%67%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%67%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%67%67%68%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%86@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%104$0@%113%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%67%68%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%68%68%98@@@@@@@@@%72%69%88%67%67%67%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%68%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%68%67%68%68%98@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%67%67%67%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%67%68%67%67%68%98@@@@@@@@@%72%69%88%67%67%67%67%68%68%98@@@@@@@@@%72%69%88%68%68%68%68%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%67%67%67%68%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%68%68%67%68%98@@@@@@@@@%72%69%88%67%67%67%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%67%67%67%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%68%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%72%69%88%67%68%67%68%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%68%67%67%68%67%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%67%67%68%98@@@@@@@@@%72%69%88%67%67%68%67%68%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%67%67%68%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%68%67%67%67%67%98@@@@@@@@%72%69%88%67%68%68%67%67%68%98@@@@@@@@@%72%69%88%67%68%67%67%68%68%98@@@@@@@@@%72%69%88%67%68%68%67%68%68%98@@@@@@@@@%72%69%88%67%68%67%67%67%68%98@@@@@@@@@%72%69%88%68%67%68%68%67%68%98@@@@@@@@@%86@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%76@@||@@@||@||@||@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict_def
    =
    DT(((("abi_aarch64_le",26),[]),[]),
       [read"%50%116@%89%83%106@@%93%82%10%11%58%106$1@$0@@%85@||@@%92%82%10%11%80%106$1@$0@@%81%85@%81%76@%75@@@||@@%91%82%10%11%58%106$1@$0@@%79@||@@%90%82%10%11%80%106$1@$0@@%81%79@%81%76@%75@@@||@@%65@@@@@@"])
  fun
    op instance_Memory_image_ToNaturalList_Abi_aarch64_le_aarch64_le_abi_feature_dict_def
    x = x
    val
    op instance_Memory_image_ToNaturalList_Abi_aarch64_le_aarch64_le_abi_feature_dict_def
    =
    DT(((("abi_aarch64_le",27),[]),[]), [read"%51%117@%97%84%100@@%66@@"])
  fun op section_is_special0_def x = x
    val op section_is_special0_def =
    DT(((("abi_aarch64_le",28),[]),[]),
       [read"%41%20%37%8%53%128$1@$0@@%99%112$1@$0@@%77@@|@|@"])
  fun op num2aarch64_le_abi_feature_aarch64_le_abi_feature2num x = x
    val op num2aarch64_le_abi_feature_aarch64_le_abi_feature2num =
    DT(((("abi_aarch64_le",4),[("abi_aarch64_le",[3])]),["DISK_THM"]),
       [read"%39%3%52%124%101$0@@@$0@|@"])
  fun op aarch64_le_abi_feature2num_num2aarch64_le_abi_feature x = x
    val op aarch64_le_abi_feature2num_num2aarch64_le_abi_feature =
    DT(((("abi_aarch64_le",5),[("abi_aarch64_le",[3])]),["DISK_THM"]),
       [read"%43%17%53%48$0@%88%68%98@@@@%56%101%124$0@@@$0@@|@"])
  fun op num2aarch64_le_abi_feature_11 x = x
    val op num2aarch64_le_abi_feature_11 =
    DT(((("abi_aarch64_le",6),
        [("abi_aarch64_le",[3]),("bool",[26])]),["DISK_THM"]),
       [read"%43%17%43%18%59%48$1@%88%68%98@@@@%59%48$0@%88%68%98@@@@%53%52%124$1@@%124$0@@@%56$1@$0@@@@|@|@"])
  fun op aarch64_le_abi_feature2num_11 x = x
    val op aarch64_le_abi_feature2num_11 =
    DT(((("abi_aarch64_le",7),
        [("abi_aarch64_le",[3]),("bool",[26])]),["DISK_THM"]),
       [read"%39%3%39%4%53%56%101$1@@%101$0@@@%52$1@$0@@|@|@"])
  fun op num2aarch64_le_abi_feature_ONTO x = x
    val op num2aarch64_le_abi_feature_ONTO =
    DT(((("abi_aarch64_le",8),
        [("abi_aarch64_le",[3]),("bool",[25,63])]),["DISK_THM"]),
       [read"%39%3%64%17%46%52$1@%124$0@@@%48$0@%88%68%98@@@@|@|@"])
  fun op aarch64_le_abi_feature2num_ONTO x = x
    val op aarch64_le_abi_feature2num_ONTO =
    DT(((("abi_aarch64_le",9),
        [("abi_aarch64_le",[3]),("bool",[26])]),["DISK_THM"]),
       [read"%43%17%53%48$0@%88%68%98@@@@%61%3%56$1@%101$0@@|@@|@"])
  fun op num2aarch64_le_abi_feature_thm x = x
    val op num2aarch64_le_abi_feature_thm =
    DT(((("abi_aarch64_le",12),[("abi_aarch64_le",[10,11])]),[]),
       [read"%46%52%124%47@@%78@@%52%124%88%67%98@@@@%94@@"])
  fun op aarch64_le_abi_feature2num_thm x = x
    val op aarch64_le_abi_feature2num_thm =
    DT(((("abi_aarch64_le",13),
        [("abi_aarch64_le",[5,10,11]),("bool",[25,54]),
         ("numeral",[3,7])]),["DISK_THM"]),
       [read"%46%56%101%78@@%47@@%56%101%94@@%88%67%98@@@@"])
  fun op aarch64_le_abi_feature_EQ_aarch64_le_abi_feature x = x
    val op aarch64_le_abi_feature_EQ_aarch64_le_abi_feature =
    DT(((("abi_aarch64_le",14),
        [("abi_aarch64_le",[7]),("bool",[58])]),["DISK_THM"]),
       [read"%39%3%39%4%53%52$1@$0@@%56%101$1@@%101$0@@@|@|@"])
  fun op aarch64_le_abi_feature_case_def x = x
    val op aarch64_le_abi_feature_case_def =
    DT(((("abi_aarch64_le",17),
        [("abi_aarch64_le",[13,16]),("bool",[56,64]),
         ("numeral",[3,6])]),["DISK_THM"]),
       [read"%46%37%25%37%27%49%102%78@$1@$0@@$1@|@|@@%37%25%37%27%49%102%94@$1@$0@@$0@|@|@@"])
  fun op datatype_aarch64_le_abi_feature x = x
    val op datatype_aarch64_le_abi_feature =
    DT(((("abi_aarch64_le",18),[("bool",[25,171])]),["DISK_THM"]),
       [read"%74%5%78@%94@@"])
  fun op aarch64_le_abi_feature_distinct x = x
    val op aarch64_le_abi_feature_distinct =
    DT(((("abi_aarch64_le",19),
        [("abi_aarch64_le",[13,14]),("numeral",[3,6])]),["DISK_THM"]),
       [read"%130%52%78@%94@@"])
  fun op aarch64_le_abi_feature_case_cong x = x
    val op aarch64_le_abi_feature_case_cong =
    DT(((("abi_aarch64_le",20),
        [("abi_aarch64_le",[8,10,11,17]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%39%0%39%1%37%25%37%27%59%46%52$3@$2@@%46%59%52$2@%78@@%49$1@%26@@@%59%52$2@%94@@%49$0@%29@@@@@%49%102$3@$1@$0@@%102$2@%26@%29@@@|@|@|@|@"])
  fun op aarch64_le_abi_feature_nchotomy x = x
    val op aarch64_le_abi_feature_nchotomy =
    DT(((("abi_aarch64_le",21),
        [("abi_aarch64_le",[8,10,11]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%39%3%99%52$0@%78@@%52$0@%94@@|@"])
  fun op aarch64_le_abi_feature_Axiom x = x
    val op aarch64_le_abi_feature_Axiom =
    DT(((("abi_aarch64_le",22),
        [("abi_aarch64_le",[13]),("bool",[8,14,25,56,64]),
         ("numeral",[3,8])]),["DISK_THM"]),
       [read"%37%35%37%36%62%9%46%49$0%78@@$2@@%49$0%94@@$1@@|@|@|@"])
  fun op aarch64_le_abi_feature_induction x = x
    val op aarch64_le_abi_feature_induction =
    DT(((("abi_aarch64_le",23),
        [("abi_aarch64_le",[8,10,11]),
         ("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,63,64,93,96,104,105,107]),
         ("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%42%2%59%46$0%78@@$0%94@@@%39%3$1$0@|@@|@"])
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
   ("aarch64LeAbiFeatureConstructorToNaturalList_def",
    aarch64LeAbiFeatureConstructorToNaturalList_def,
    DB.Def), ("abiFeatureCompare_def",abiFeatureCompare_def,DB.Def),
   ("instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict_def",
    instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict_def,
    DB.Def),
   ("instance_Memory_image_ToNaturalList_Abi_aarch64_le_aarch64_le_abi_feature_dict_def",
    instance_Memory_image_ToNaturalList_Abi_aarch64_le_aarch64_le_abi_feature_dict_def,
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

  local open Portable GrammarSpecials Parse
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
       ("aarch64LeAbiFeatureConstructorToNaturalList", (Term.prim_mk_const { Name = "aarch64LeAbiFeatureConstructorToNaturalList", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("aarch64LeAbiFeatureConstructorToNaturalList", (Term.prim_mk_const { Name = "aarch64LeAbiFeatureConstructorToNaturalList", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abiFeatureCompare", (Term.prim_mk_const { Name = "abiFeatureCompare", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abiFeatureCompare", (Term.prim_mk_const { Name = "abiFeatureCompare", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Memory_image_ToNaturalList_Abi_aarch64_le_aarch64_le_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Memory_image_ToNaturalList_Abi_aarch64_le_aarch64_le_abi_feature_dict", Thy = "abi_aarch64_le"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Memory_image_ToNaturalList_Abi_aarch64_le_aarch64_le_abi_feature_dict", (Term.prim_mk_const { Name = "instance_Memory_image_ToNaturalList_Abi_aarch64_le_aarch64_le_abi_feature_dict", Thy = "abi_aarch64_le"}))
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
        val tyinfo0 = tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "abi_aarch64_le",
    thydataty = "compute",
    data =
        "abi_aarch64_le.abi_aarch64_le_compute_program_entry_point_def abi_aarch64_le.instance_Memory_image_ToNaturalList_Abi_aarch64_le_aarch64_le_abi_feature_dict_def abi_aarch64_le.section_is_special0_def abi_aarch64_le.header_is_aarch64_le_def abi_aarch64_le.instance_Basic_classes_Ord_Abi_aarch64_le_aarch64_le_abi_feature_dict_def abi_aarch64_le.abiFeatureCompare_def abi_aarch64_le.aarch64LeAbiFeatureConstructorToNaturalList_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_aarch64_le"
end
