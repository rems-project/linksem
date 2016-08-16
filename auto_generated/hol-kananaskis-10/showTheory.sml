structure showTheory :> showTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading showTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open elf_localTheory lem_string_extraTheory
  in end;
  val _ = Theory.link_parents
          ("show",
          Arbnum.fromString "1471355094",
          Arbnum.fromString "275066")
          [("elf_local",
           Arbnum.fromString "1471355081",
           Arbnum.fromString "869525"),
           ("lem_string_extra",
           Arbnum.fromString "1471269280",
           Arbnum.fromString "343409")];
  val _ = Theory.incorporate_types "show" [("Show_class", 1)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("list", "list"), ID("string", "char"),
   ID("pair", "prod"), ID("show", "Show_class"), ID("option", "option"),
   ID("min", "bool"), ID("num", "num"), ID("integer", "int"),
   ID("ind_type", "recspace"), ID("min", "ind"), ID("bool", "!"),
   ID("pair", ","), ID("bool", "/\\"), ID("num", "0"), ID("min", "="),
   ID("min", "==>"), ID("bool", "?"), ID("list", "APPEND"),
   ID("bool", "ARB"), ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("combin", "K"), ID("list", "NIL"), ID("arithmetic", "NUMERAL"),
   ID("show", "Show_class_CASE"), ID("show", "Show_class_show_method"),
   ID("show", "Show_class_show_method_fupd"),
   ID("show", "Show_class_size"), ID("bool", "TYPE_DEFINITION"),
   ID("arithmetic", "ZERO"),
   ID("show", "instance_Show_Show_Maybe_maybe_dict"),
   ID("show", "instance_Show_Show_Num_integer_dict"),
   ID("show", "instance_Show_Show_Num_natural_dict"),
   ID("show", "instance_Show_Show_bool_dict"),
   ID("show", "instance_Show_Show_nat_dict"),
   ID("show", "instance_Show_Show_string_dict"),
   ID("show", "instance_Show_Show_tup2_dict"),
   ID("show", "instance_Show_Show_tup3_dict"),
   ID("show", "instance_Show_Show_tup4_dict"),
   ID("show", "instance_Show_Show_unit_dict"),
   ID("elf_local", "int_to_dec_string"),
   ID("ASCIInumbers", "num_to_dec_string"), ID("combin", "o"),
   ID("option", "option_CASE"), ID("show", "recordtype.Show_class"),
   ID("show", "show_else"), ID("show", "string_of_bool"),
   ID("show", "string_of_maybe"), ID("show", "string_of_pair"),
   ID("show", "string_of_quad"), ID("show", "string_of_string"),
   ID("show", "string_of_triple"), ID("show", "string_of_unit")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [2], TYOP [1, 0], TYV "'a", TYOP [0, 2, 1], TYV "'c", TYV "'b",
   TYOP [3, 5, 4], TYOP [3, 2, 6], TYOP [0, 7, 1], TYOP [4, 4],
   TYOP [0, 9, 8], TYOP [4, 5], TYOP [0, 11, 10], TYOP [4, 2],
   TYOP [0, 13, 12], TYOP [0, 2, 2], TYV "'d", TYOP [3, 4, 16],
   TYOP [3, 5, 17], TYOP [3, 2, 18], TYOP [0, 19, 1], TYOP [4, 16],
   TYOP [0, 21, 20], TYOP [0, 9, 22], TYOP [0, 11, 23], TYOP [0, 13, 24],
   TYOP [3, 2, 5], TYOP [0, 26, 1], TYOP [0, 11, 27], TYOP [0, 13, 28],
   TYOP [5, 2], TYOP [0, 30, 1], TYOP [0, 13, 31], TYOP [6],
   TYOP [0, 33, 1], TYOP [0, 1, 31], TYOP [0, 13, 35], TYOP [0, 3, 13],
   TYOP [4, 19], TYOP [0, 21, 38], TYOP [0, 9, 39], TYOP [0, 11, 40],
   TYOP [0, 13, 41], TYOP [4, 7], TYOP [0, 9, 43], TYOP [0, 11, 44],
   TYOP [0, 13, 45], TYOP [4, 26], TYOP [0, 11, 47], TYOP [0, 13, 48],
   TYOP [4, 1], TYOP [7], TYOP [4, 51], TYOP [4, 33], TYOP [8],
   TYOP [4, 54], TYOP [4, 30], TYOP [0, 13, 56], TYOP [0, 13, 51],
   TYOP [0, 2, 51], TYOP [0, 59, 58], TYOP [0, 13, 11], TYOP [0, 5, 1],
   TYOP [0, 3, 62], TYOP [0, 63, 61], TYOP [0, 13, 3], TYOP [0, 3, 5],
   TYOP [0, 66, 5], TYOP [0, 13, 67], TYOP [9, 3], TYOP [0, 69, 33],
   TYOP [0, 13, 33], TYOP [0, 11, 33], TYOP [10], TYOP [0, 4, 1],
   TYOP [0, 62, 74], TYOP [0, 13, 5], TYOP [0, 16, 13], TYOP [0, 3, 33],
   TYOP [0, 73, 78], TYOP [0, 13, 69], TYOP [0, 2, 33], TYOP [0, 81, 33],
   TYOP [0, 5, 33], TYOP [0, 83, 33], TYOP [0, 4, 33], TYOP [0, 85, 33],
   TYOP [0, 16, 33], TYOP [0, 87, 33], TYOP [0, 71, 33], TYOP [0, 72, 33],
   TYOP [0, 9, 33], TYOP [0, 91, 33], TYOP [0, 21, 33], TYOP [0, 93, 33],
   TYOP [0, 33, 33], TYOP [0, 95, 33], TYOP [0, 78, 33], TYOP [0, 59, 33],
   TYOP [0, 98, 33], TYOP [0, 62, 33], TYOP [0, 100, 33], TYOP [0, 77, 33],
   TYOP [0, 102, 33], TYOP [0, 89, 33], TYOP [0, 90, 33], TYOP [0, 66, 33],
   TYOP [0, 106, 33], TYOP [0, 63, 33], TYOP [0, 108, 33],
   TYOP [0, 75, 33], TYOP [0, 110, 33], TYOP [0, 70, 33],
   TYOP [0, 112, 33], TYOP [0, 1, 33], TYOP [0, 114, 33], TYOP [0, 30, 33],
   TYOP [0, 116, 33], TYOP [0, 5, 26], TYOP [0, 2, 118], TYOP [0, 6, 7],
   TYOP [0, 2, 120], TYOP [0, 18, 19], TYOP [0, 2, 122], TYOP [0, 4, 6],
   TYOP [0, 5, 124], TYOP [0, 17, 18], TYOP [0, 5, 126], TYOP [0, 16, 17],
   TYOP [0, 4, 128], TYOP [0, 33, 95], TYOP [0, 2, 81], TYOP [0, 5, 83],
   TYOP [0, 13, 71], TYOP [0, 11, 72], TYOP [0, 9, 91], TYOP [0, 53, 33],
   TYOP [0, 53, 136], TYOP [0, 55, 33], TYOP [0, 55, 138],
   TYOP [0, 50, 33], TYOP [0, 50, 140], TYOP [0, 52, 33],
   TYOP [0, 52, 142], TYOP [0, 56, 33], TYOP [0, 56, 144],
   TYOP [0, 47, 33], TYOP [0, 47, 146], TYOP [0, 43, 33],
   TYOP [0, 43, 148], TYOP [0, 38, 33], TYOP [0, 38, 150], TYOP [0, 3, 78],
   TYOP [0, 62, 100], TYOP [0, 16, 9], TYOP [0, 154, 33],
   TYOP [0, 154, 155], TYOP [0, 13, 9], TYOP [0, 157, 33],
   TYOP [0, 157, 158], TYOP [0, 1, 114], TYOP [0, 51, 33],
   TYOP [0, 51, 161], TYOP [0, 69, 70], TYOP [0, 76, 33],
   TYOP [0, 164, 33], TYOP [0, 80, 33], TYOP [0, 166, 33], TYOP [0, 1, 1],
   TYOP [0, 1, 168], TYOP [0, 51, 51], TYOP [0, 51, 0], TYOP [0, 33, 169],
   TYOP [0, 0, 168], TYOP [0, 51, 69], TYOP [0, 174, 69], TYOP [0, 3, 175],
   TYOP [0, 51, 176], TYOP [0, 3, 3], TYOP [0, 3, 178], TYOP [0, 62, 63],
   TYOP [0, 34, 34], TYOP [0, 34, 181], TYOP [0, 54, 1],
   TYOP [0, 183, 183], TYOP [0, 183, 184], TYOP [0, 168, 168],
   TYOP [0, 168, 186], TYOP [0, 51, 1], TYOP [0, 188, 188],
   TYOP [0, 188, 189], TYOP [0, 31, 31], TYOP [0, 31, 191],
   TYOP [0, 27, 27], TYOP [0, 27, 193], TYOP [0, 8, 8], TYOP [0, 8, 195],
   TYOP [0, 20, 20], TYOP [0, 20, 197], TYOP [0, 11, 62], TYOP [0, 9, 74],
   TYOP [0, 16, 1], TYOP [0, 21, 201], TYOP [0, 13, 13],
   TYOP [0, 178, 203], TYOP [0, 3, 74], TYOP [0, 205, 157],
   TYOP [0, 11, 9], TYOP [0, 75, 207], TYOP [0, 53, 53],
   TYOP [0, 181, 209], TYOP [0, 55, 55], TYOP [0, 184, 211],
   TYOP [0, 50, 50], TYOP [0, 186, 213], TYOP [0, 52, 52],
   TYOP [0, 189, 215], TYOP [0, 56, 56], TYOP [0, 191, 217],
   TYOP [0, 47, 47], TYOP [0, 193, 219], TYOP [0, 43, 43],
   TYOP [0, 195, 221], TYOP [0, 38, 38], TYOP [0, 197, 223],
   TYOP [0, 70, 166], TYOP [0, 16, 11], TYOP [0, 77, 226],
   TYOP [0, 61, 227], TYOP [0, 77, 154], TYOP [0, 157, 229],
   TYOP [0, 226, 154], TYOP [0, 207, 231], TYOP [0, 61, 157],
   TYOP [0, 207, 233], TYOP [0, 63, 205], TYOP [0, 75, 235],
   TYOP [0, 3, 1], TYOP [0, 1, 237], TYOP [0, 30, 238], TYOP [0, 62, 11]]
  end
  val _ = Theory.incorporate_consts "show" tyvector
     [("string_of_unit", 3), ("string_of_triple", 14),
      ("string_of_string", 15), ("string_of_quad", 25),
      ("string_of_pair", 29), ("string_of_maybe", 32),
      ("string_of_bool", 34), ("show_else", 36),
      ("recordtype.Show_class", 37), ("instance_Show_Show_unit_dict", 13),
      ("instance_Show_Show_tup4_dict", 42),
      ("instance_Show_Show_tup3_dict", 46),
      ("instance_Show_Show_tup2_dict", 49),
      ("instance_Show_Show_string_dict", 50),
      ("instance_Show_Show_nat_dict", 52),
      ("instance_Show_Show_bool_dict", 53),
      ("instance_Show_Show_Num_natural_dict", 52),
      ("instance_Show_Show_Num_integer_dict", 55),
      ("instance_Show_Show_Maybe_maybe_dict", 57), ("Show_class_size", 60),
      ("Show_class_show_method_fupd", 64), ("Show_class_show_method", 65),
      ("Show_class_CASE", 68)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'Show_class'", 70), TMV("M", 13), TMV("M'", 13), TMV("P", 71),
   TMV("P", 72), TMV("S", 13), TMV("S", 11), TMV("S1", 13), TMV("S2", 13),
   TMV("SS", 13), TMV("Show_class", 73), TMV("a", 3), TMV("a'", 3),
   TMV("a0", 69), TMV("b", 33), TMV("dict_Show_Show_a", 13),
   TMV("dict_Show_Show_b", 11), TMV("dict_Show_Show_c", 9),
   TMV("dict_Show_Show_d", 21), TMV("e", 2), TMV("f", 3), TMV("f", 59),
   TMV("f", 62), TMV("f", 66), TMV("f", 63), TMV("f", 75), TMV("f'", 66),
   TMV("f0", 63), TMV("f1", 62), TMV("f2", 62), TMV("fn", 76),
   TMV("g", 63), TMV("h", 77), TMV("left", 2), TMV("m", 30),
   TMV("middle", 5), TMV("middle1", 5), TMV("middle2", 4), TMV("n", 51),
   TMV("record", 79), TMV("rep", 80), TMV("right", 5), TMV("right", 4),
   TMV("right", 16), TMV("show_method", 3), TMV("subst", 1), TMV("u", 2),
   TMV("x", 2), TMC(11, 82), TMC(11, 84), TMC(11, 86), TMC(11, 88),
   TMC(11, 89), TMC(11, 90), TMC(11, 92), TMC(11, 94), TMC(11, 96),
   TMC(11, 97), TMC(11, 99), TMC(11, 101), TMC(11, 103), TMC(11, 104),
   TMC(11, 105), TMC(11, 107), TMC(11, 109), TMC(11, 111), TMC(11, 113),
   TMC(11, 115), TMC(11, 117), TMC(11, 112), TMC(12, 119), TMC(12, 121),
   TMC(12, 123), TMC(12, 125), TMC(12, 127), TMC(12, 129), TMC(13, 130),
   TMC(14, 51), TMC(15, 131), TMC(15, 132), TMC(15, 133), TMC(15, 134),
   TMC(15, 135), TMC(15, 137), TMC(15, 139), TMC(15, 141), TMC(15, 143),
   TMC(15, 145), TMC(15, 147), TMC(15, 149), TMC(15, 151), TMC(15, 130),
   TMC(15, 152), TMC(15, 153), TMC(15, 156), TMC(15, 159), TMC(15, 160),
   TMC(15, 162), TMC(15, 163), TMC(16, 130), TMC(17, 90), TMC(17, 97),
   TMC(17, 101), TMC(17, 165), TMC(17, 167), TMC(18, 169), TMC(19, 13),
   TMC(19, 53), TMC(19, 55), TMC(19, 50), TMC(19, 52), TMC(19, 56),
   TMC(19, 47), TMC(19, 43), TMC(19, 38), TMC(20, 170), TMC(21, 170),
   TMC(22, 69), TMC(23, 171), TMC(24, 172), TMC(25, 173), TMC(26, 177),
   TMC(27, 95), TMC(28, 179), TMC(28, 180), TMC(28, 182), TMC(28, 185),
   TMC(28, 187), TMC(28, 190), TMC(28, 192), TMC(28, 194), TMC(28, 196),
   TMC(28, 198), TMC(29, 1), TMC(30, 170), TMC(31, 68), TMC(32, 65),
   TMC(32, 199), TMC(32, 200), TMC(32, 202), TMC(33, 204), TMC(33, 64),
   TMC(33, 206), TMC(33, 208), TMC(33, 210), TMC(33, 212), TMC(33, 214),
   TMC(33, 216), TMC(33, 218), TMC(33, 220), TMC(33, 222), TMC(33, 224),
   TMC(34, 60), TMC(35, 225), TMC(36, 51), TMC(37, 57), TMC(38, 55),
   TMC(39, 52), TMC(40, 53), TMC(41, 52), TMC(42, 50), TMC(43, 49),
   TMC(44, 46), TMC(45, 42), TMC(46, 13), TMC(47, 183), TMC(48, 188),
   TMC(49, 228), TMC(49, 230), TMC(49, 232), TMC(49, 234), TMC(49, 236),
   TMC(50, 239), TMC(51, 37), TMC(51, 240), TMC(52, 36), TMC(53, 34),
   TMC(54, 32), TMC(55, 29), TMC(56, 25), TMC(57, 15), TMC(57, 168),
   TMC(58, 14), TMC(59, 3)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op Show_class_TY_DEF x = x
    val op Show_class_TY_DEF =
    DT(((("show",0),[("bool",[26])]),["DISK_THM"]),
       [read"%104%40%153%13%66%0%99%69%13%99%101%11%98$1@%11%121%77@$0@%38%117|@|$0@@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op Show_class_case_def x = x
    val op Show_class_case_def =
    DT(((("show",4),
        [("bool",[26,180]),("ind_type",[33,34]),
         ("show",[1,2,3])]),["DISK_THM"]),
       [read"%57%11%63%23%79%135%173$1@@$0@@$0$1@@|@|@"])
  fun op Show_class_size_def x = x
    val op Show_class_size_def =
    DT(((("show",5),
        [("bool",[26,180]),("ind_type",[33,34]),
         ("show",[1,2,3])]),["DISK_THM"]),
       [read"%58%21%57%11%97%152$1@%173$0@@@%134%115%154@@@|@|@"])
  fun op Show_class_show_method x = x
    val op Show_class_show_method =
    DT(((("show",6),
        [("bool",[26,180]),("ind_type",[33,34]),
         ("show",[1,2,3])]),["DISK_THM"]),
       [read"%57%20%92%136%173$0@@@$0@|@"])
  fun op Show_class_show_method_fupd x = x
    val op Show_class_show_method_fupd =
    DT(((("show",8),
        [("bool",[26,180]),("ind_type",[33,34]),
         ("show",[1,2,3])]),["DISK_THM"]),
       [read"%64%27%57%20%81%141$1@%173$0@@@%174$1$0@@@|@|@"])
  fun op string_of_unit_def x = x
    val op string_of_unit_def =
    DT(((("show",25),[]),[]),
       [read"%48%46%96%183$0@@%120%118%134%116%115%115%116%115%154@@@@@@@@%120%118%134%115%116%115%116%115%154@@@@@@@@%133@@@|@"])
  fun op instance_Show_Show_unit_dict_def x = x
    val op instance_Show_Show_unit_dict_def =
    DT(((("show",26),[]),[]), [read"%80%164@%140%123%183@@%106@@"])
  fun op string_of_bool_def x = x
    val op string_of_bool_def =
    DT(((("show",27),[]),[]),
       [read"%56%14%96%176$0@@%119$0@%120%118%134%116%115%116%115%116%116%154@@@@@@@@@%120%118%134%116%116%115%115%116%116%154@@@@@@@@@%120%118%134%115%116%116%115%116%116%154@@@@@@@@@%120%118%134%115%116%116%115%115%116%154@@@@@@@@@%133@@@@@%120%118%134%116%116%116%115%115%116%154@@@@@@@@@%120%118%134%115%116%115%115%115%116%154@@@@@@@@@%120%118%134%116%115%116%116%115%116%154@@@@@@@@@%120%118%134%115%115%116%115%116%116%154@@@@@@@@@%120%118%134%115%116%116%115%115%116%154@@@@@@@@@%133@@@@@@@|@"])
  fun op instance_Show_Show_bool_dict_def x = x
    val op instance_Show_Show_bool_dict_def =
    DT(((("show",28),[]),[]), [read"%83%158@%144%125%176@@%107@@"])
  fun op string_of_string_def x = x
    val op string_of_string_def =
    DT(((("show",29),[]),[]), [read"%48%47%78%180$0@@$0@|@"])
  fun op instance_Show_Show_string_dict_def x = x
    val op instance_Show_Show_string_dict_def =
    DT(((("show",30),[]),[]), [read"%85%160@%146%127%181@@%109@@"])
  fun op string_of_pair_def x = x
    val op string_of_pair_def =
    DT(((("show",31),[("pair",[16])]),["DISK_THM"]),
       [read"%52%15%53%16%48%33%49%41%96%178$3@$2@%70$1@$0@@@%105%120%118%134%116%115%115%116%115%154@@@@@@@@%133@@%105%136$3@$1@@%105%120%118%134%116%115%116%116%115%154@@@@@@@@%120%118%134%116%115%115%115%115%154@@@@@@@@%133@@@%105%137$2@$0@@%120%118%134%115%116%115%116%115%154@@@@@@@@%133@@@@@@|@|@|@|@"])
  fun op instance_Show_Show_tup2_dict_def x = x
    val op instance_Show_Show_tup2_dict_def =
    DT(((("show",32),[]),[]),
       [read"%52%15%53%16%88%161$1@$0@@%149%130%178$1@$0@@@%112@@|@|@"])
  fun op string_of_triple_def x = x
    val op string_of_triple_def =
    DT(((("show",33),[("pair",[16])]),["DISK_THM"]),
       [read"%52%15%53%16%54%17%48%33%49%35%50%42%96%182$5@$4@$3@%71$2@%73$1@$0@@@@%105%120%118%134%116%115%115%116%115%154@@@@@@@@%133@@%105%136$5@$2@@%105%120%118%134%116%115%116%116%115%154@@@@@@@@%120%118%134%116%115%115%115%115%154@@@@@@@@%133@@@%105%137$4@$1@@%105%120%118%134%116%115%116%116%115%154@@@@@@@@%120%118%134%116%115%115%115%115%154@@@@@@@@%133@@@%105%138$3@$0@@%120%118%134%115%116%115%116%115%154@@@@@@@@%133@@@@@@@@|@|@|@|@|@|@"])
  fun op instance_Show_Show_tup3_dict_def x = x
    val op instance_Show_Show_tup3_dict_def =
    DT(((("show",34),[]),[]),
       [read"%52%15%53%16%54%17%89%162$2@$1@$0@@%150%131%182$2@$1@$0@@@%113@@|@|@|@"])
  fun op string_of_quad_def x = x
    val op string_of_quad_def =
    DT(((("show",35),[("pair",[16])]),["DISK_THM"]),
       [read"%52%15%53%16%54%17%55%18%48%33%49%36%50%37%51%43%96%179$7@$6@$5@$4@%72$3@%74$2@%75$1@$0@@@@@%105%120%118%134%116%115%115%116%115%154@@@@@@@@%133@@%105%136$7@$3@@%105%120%118%134%116%115%116%116%115%154@@@@@@@@%120%118%134%116%115%115%115%115%154@@@@@@@@%133@@@%105%137$6@$2@@%105%120%118%134%116%115%116%116%115%154@@@@@@@@%120%118%134%116%115%115%115%115%154@@@@@@@@%133@@@%105%138$5@$1@@%105%120%118%134%116%115%116%116%115%154@@@@@@@@%120%118%134%116%115%115%115%115%154@@@@@@@@%133@@@%105%139$4@$0@@%120%118%134%115%116%115%116%115%154@@@@@@@@%133@@@@@@@@@@|@|@|@|@|@|@|@|@"])
  fun op instance_Show_Show_tup4_dict_def x = x
    val op instance_Show_Show_tup4_dict_def =
    DT(((("show",36),[]),[]),
       [read"%52%15%53%16%54%17%55%18%90%163$3@$2@$1@$0@@%151%132%179$3@$2@$1@$0@@@%114@@|@|@|@|@"])
  fun op string_of_maybe_def x = x
    val op string_of_maybe_def =
    DT(((("show",37),[]),[]),
       [read"%52%15%68%34%96%177$1@$0@@%172$0@%120%118%134%116%116%116%116%115%115%154@@@@@@@@@%120%118%134%115%115%115%115%116%116%154@@@@@@@@@%120%118%134%116%115%116%115%116%116%154@@@@@@@@@%120%118%134%116%115%115%116%115%116%154@@@@@@@@@%120%118%134%115%116%115%116%115%116%154@@@@@@@@@%120%118%134%116%116%116%116%115%116%154@@@@@@@@@%120%118%134%115%115%115%116%115%116%154@@@@@@@@@%133@@@@@@@@%19%105%120%118%134%116%116%115%116%115%115%154@@@@@@@@@%120%118%134%115%116%116%115%116%116%154@@@@@@@@@%120%118%134%115%115%116%115%116%116%154@@@@@@@@@%120%118%134%116%115%116%115%116%116%154@@@@@@@@@%120%118%134%116%115%115%115%115%154@@@@@@@@%133@@@@@@%136$2@$0@@|@@|@|@"])
  fun op instance_Show_Show_Maybe_maybe_dict_def x = x
    val op instance_Show_Show_Maybe_maybe_dict_def =
    DT(((("show",38),[]),[]),
       [read"%52%15%87%155$0@@%148%129%177$0@@@%111@@|@"])
  fun op show_else_def x = x
    val op show_else_def =
    DT(((("show",39),[]),[]),
       [read"%52%15%67%45%68%34%96%175$2@$1@$0@@%172$0@$1@%47%136$3@$0@|@@|@|@|@"])
  fun op instance_Show_Show_nat_dict_def x = x
    val op instance_Show_Show_nat_dict_def =
    DT(((("show",40),[]),[]), [read"%86%159@%147%128%166@@%110@@"])
  fun op instance_Show_Show_Num_natural_dict_def x = x
    val op instance_Show_Show_Num_natural_dict_def =
    DT(((("show",41),[]),[]), [read"%86%157@%147%128%166@@%110@@"])
  fun op instance_Show_Show_Num_integer_dict_def x = x
    val op instance_Show_Show_Num_integer_dict_def =
    DT(((("show",42),[]),[]), [read"%84%156@%145%126%165@@%108@@"])
  fun op Show_class_accessors x = x
    val op Show_class_accessors =
    DT(((("show",7),[("show",[6])]),["DISK_THM"]),
       [read"%57%20%92%136%173$0@@@$0@|@"])
  fun op Show_class_fn_updates x = x
    val op Show_class_fn_updates =
    DT(((("show",9),[("show",[8])]),["DISK_THM"]),
       [read"%64%27%57%20%81%141$1@%173$0@@@%174$1$0@@@|@|@"])
  fun op Show_class_accfupds x = x
    val op Show_class_accfupds =
    DT(((("show",10),
        [("bool",[25,26,55,180]),("show",[1,2,3,7,9])]),["DISK_THM"]),
       [read"%64%24%52%5%93%137%141$1@$0@@@$1%136$0@@@|@|@"])
  fun op Show_class_fupdfupds x = x
    val op Show_class_fupdfupds =
    DT(((("show",11),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("show",[1,2,3,9])]),["DISK_THM"]),
       [read"%64%31%65%25%52%5%82%143$1@%141$2@$0@@@%142%171$1@$2@@$0@@|@|@|@"])
  fun op Show_class_fupdfupds_comp x = x
    val op Show_class_fupdfupds_comp =
    DT(((("show",12),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("show",[1,2,3,9])]),["DISK_THM"]),
       [read"%76%64%31%65%25%95%170%143$0@@%141$1@@@%142%171$0@$1@@@|@|@@%60%32%64%31%65%25%94%169%143$0@@%167%141$1@@$2@@@%168%142%171$0@$1@@@$2@@|@|@|@@"])
  fun op Show_class_component_equality x = x
    val op Show_class_component_equality =
    DT(((("show",13),
        [("bool",[25,26,55,62,180]),("ind_type",[33,34]),
         ("show",[1,2,3,7])]),["DISK_THM"]),
       [read"%52%7%52%8%91%80$1@$0@@%92%136$1@@%136$0@@@|@|@"])
  fun op Show_class_updates_eq_literal x = x
    val op Show_class_updates_eq_literal =
    DT(((("show",14),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("show",[1,2,3,9])]),["DISK_THM"]),
       [read"%52%5%59%22%81%141%124$0@@$1@@%141%124$0@@%106@@|@|@"])
  fun op Show_class_literal_nchotomy x = x
    val op Show_class_literal_nchotomy =
    DT(((("show",15),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("ind_type",[33,34]),("show",[1,2,3,9])]),["DISK_THM"]),
       [read"%53%6%102%22%81$1@%141%124$0@@%106@@|@|@"])
  fun op FORALL_Show_class x = x
    val op FORALL_Show_class =
    DT(((("show",16),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("ind_type",[33,34]),("show",[1,2,3,9])]),["DISK_THM"]),
       [read"%62%4%91%53%6$1$0@|@@%59%22$1%141%124$0@@%106@@|@@|@"])
  fun op EXISTS_Show_class x = x
    val op EXISTS_Show_class =
    DT(((("show",17),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("ind_type",[33,34]),("show",[1,2,3,9])]),["DISK_THM"]),
       [read"%62%4%91%100%6$1$0@|@@%102%22$1%141%124$0@@%106@@|@@|@"])
  fun op Show_class_literal_11 x = x
    val op Show_class_literal_11 =
    DT(((("show",18),[("combin",[12]),("show",[10,13])]),["DISK_THM"]),
       [read"%59%28%59%29%91%81%141%124$1@@%106@@%141%124$0@@%106@@@%93$1@$0@@|@|@"])
  fun op datatype_Show_class x = x
    val op datatype_Show_class =
    DT(((("show",19),[("bool",[25,170])]),["DISK_THM"]),
       [read"%122%39%10@%44@@"])
  fun op Show_class_11 x = x
    val op Show_class_11 =
    DT(((("show",20),
        [("bool",[26,55,62,180]),("ind_type",[33,34]),
         ("show",[1,2,3])]),["DISK_THM"]),
       [read"%57%11%57%12%91%80%173$1@@%173$0@@@%92$1@$0@@|@|@"])
  fun op Show_class_case_cong x = x
    val op Show_class_case_cong =
    DT(((("show",21),[("bool",[26,180]),("show",[1,2,3,4])]),["DISK_THM"]),
       [read"%52%1%52%2%63%23%99%76%80$2@$1@@%57%11%99%80$2@%173$0@@@%79$1$0@@%26$0@@@|@@@%79%135$2@$0@@%135$1@%26@@@|@|@|@"])
  fun op Show_class_nchotomy x = x
    val op Show_class_nchotomy =
    DT(((("show",22),[("bool",[26,180]),("show",[1,2,3])]),["DISK_THM"]),
       [read"%52%9%101%20%80$1@%173$0@@|@|@"])
  fun op Show_class_Axiom x = x
    val op Show_class_Axiom =
    DT(((("show",23),
        [("bool",[26,180]),("ind_type",[33,34]),
         ("show",[1,2,3])]),["DISK_THM"]),
       [read"%63%23%103%30%57%11%79$1%173$0@@@$2$0@@|@|@|@"])
  fun op Show_class_induction x = x
    val op Show_class_induction =
    DT(((("show",24),[("bool",[26]),("show",[1,2,3])]),["DISK_THM"]),
       [read"%61%3%99%57%20$1%173$0@@|@@%52%5$1$0@|@@|@"])
  end
  val _ = DB.bindl "show"
  [("Show_class_TY_DEF",Show_class_TY_DEF,DB.Def),
   ("Show_class_case_def",Show_class_case_def,DB.Def),
   ("Show_class_size_def",Show_class_size_def,DB.Def),
   ("Show_class_show_method",Show_class_show_method,DB.Def),
   ("Show_class_show_method_fupd",Show_class_show_method_fupd,DB.Def),
   ("string_of_unit_def",string_of_unit_def,DB.Def),
   ("instance_Show_Show_unit_dict_def",
    instance_Show_Show_unit_dict_def,
    DB.Def), ("string_of_bool_def",string_of_bool_def,DB.Def),
   ("instance_Show_Show_bool_dict_def",
    instance_Show_Show_bool_dict_def,
    DB.Def), ("string_of_string_def",string_of_string_def,DB.Def),
   ("instance_Show_Show_string_dict_def",
    instance_Show_Show_string_dict_def,
    DB.Def), ("string_of_pair_def",string_of_pair_def,DB.Def),
   ("instance_Show_Show_tup2_dict_def",
    instance_Show_Show_tup2_dict_def,
    DB.Def), ("string_of_triple_def",string_of_triple_def,DB.Def),
   ("instance_Show_Show_tup3_dict_def",
    instance_Show_Show_tup3_dict_def,
    DB.Def), ("string_of_quad_def",string_of_quad_def,DB.Def),
   ("instance_Show_Show_tup4_dict_def",
    instance_Show_Show_tup4_dict_def,
    DB.Def), ("string_of_maybe_def",string_of_maybe_def,DB.Def),
   ("instance_Show_Show_Maybe_maybe_dict_def",
    instance_Show_Show_Maybe_maybe_dict_def,
    DB.Def), ("show_else_def",show_else_def,DB.Def),
   ("instance_Show_Show_nat_dict_def",
    instance_Show_Show_nat_dict_def,
    DB.Def),
   ("instance_Show_Show_Num_natural_dict_def",
    instance_Show_Show_Num_natural_dict_def,
    DB.Def),
   ("instance_Show_Show_Num_integer_dict_def",
    instance_Show_Show_Num_integer_dict_def,
    DB.Def), ("Show_class_accessors",Show_class_accessors,DB.Thm),
   ("Show_class_fn_updates",Show_class_fn_updates,DB.Thm),
   ("Show_class_accfupds",Show_class_accfupds,DB.Thm),
   ("Show_class_fupdfupds",Show_class_fupdfupds,DB.Thm),
   ("Show_class_fupdfupds_comp",Show_class_fupdfupds_comp,DB.Thm),
   ("Show_class_component_equality",Show_class_component_equality,DB.Thm),
   ("Show_class_updates_eq_literal",Show_class_updates_eq_literal,DB.Thm),
   ("Show_class_literal_nchotomy",Show_class_literal_nchotomy,DB.Thm),
   ("FORALL_Show_class",FORALL_Show_class,DB.Thm),
   ("EXISTS_Show_class",EXISTS_Show_class,DB.Thm),
   ("Show_class_literal_11",Show_class_literal_11,DB.Thm),
   ("datatype_Show_class",datatype_Show_class,DB.Thm),
   ("Show_class_11",Show_class_11,DB.Thm),
   ("Show_class_case_cong",Show_class_case_cong,DB.Thm),
   ("Show_class_nchotomy",Show_class_nchotomy,DB.Thm),
   ("Show_class_Axiom",Show_class_Axiom,DB.Thm),
   ("Show_class_induction",Show_class_induction,DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("elf_localTheory.elf_local_grammars",
                          elf_localTheory.elf_local_grammars),
                         ("lem_string_extraTheory.lem_string_extra_grammars",
                          lem_string_extraTheory.lem_string_extra_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms temp_add_type "Show_class"
  val _ = update_grms temp_add_type "Show_class"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.Show_class", (Term.prim_mk_const { Name = "recordtype.Show_class", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.Show_class", (Term.prim_mk_const { Name = "recordtype.Show_class", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Show_class_CASE", (Term.prim_mk_const { Name = "Show_class_CASE", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Show_class_size", (Term.prim_mk_const { Name = "Show_class_size", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Show_class_show_method", (Term.prim_mk_const { Name = "Show_class_show_method", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Show_class_show_method_fupd", (Term.prim_mk_const { Name = "Show_class_show_method_fupd", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectshow_method", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :('a show$Show_class)). show$Show_class_show_method rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("show_method_fupd", (Term.prim_mk_const { Name = "Show_class_show_method_fupd", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateshow_method", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :('a -> ((string$char) list$list)) -> 'b -> ((string$char) list$list)) (x :('a show$Show_class)). show$Show_class_show_method_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Show_class", (Term.prim_mk_const { Name = "recordtype.Show_class", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_unit", (Term.prim_mk_const { Name = "string_of_unit", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_unit", (Term.prim_mk_const { Name = "string_of_unit", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_unit_dict", (Term.prim_mk_const { Name = "instance_Show_Show_unit_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_unit_dict", (Term.prim_mk_const { Name = "instance_Show_Show_unit_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_bool", (Term.prim_mk_const { Name = "string_of_bool", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_bool", (Term.prim_mk_const { Name = "string_of_bool", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_bool_dict", (Term.prim_mk_const { Name = "instance_Show_Show_bool_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_bool_dict", (Term.prim_mk_const { Name = "instance_Show_Show_bool_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_string", (Term.prim_mk_const { Name = "string_of_string", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_string", (Term.prim_mk_const { Name = "string_of_string", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_string_dict", (Term.prim_mk_const { Name = "instance_Show_Show_string_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_string_dict", (Term.prim_mk_const { Name = "instance_Show_Show_string_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_pair", (Term.prim_mk_const { Name = "string_of_pair", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_pair", (Term.prim_mk_const { Name = "string_of_pair", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_tup2_dict", (Term.prim_mk_const { Name = "instance_Show_Show_tup2_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_tup2_dict", (Term.prim_mk_const { Name = "instance_Show_Show_tup2_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_triple", (Term.prim_mk_const { Name = "string_of_triple", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_triple", (Term.prim_mk_const { Name = "string_of_triple", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_tup3_dict", (Term.prim_mk_const { Name = "instance_Show_Show_tup3_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_tup3_dict", (Term.prim_mk_const { Name = "instance_Show_Show_tup3_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_quad", (Term.prim_mk_const { Name = "string_of_quad", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_quad", (Term.prim_mk_const { Name = "string_of_quad", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_tup4_dict", (Term.prim_mk_const { Name = "instance_Show_Show_tup4_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_tup4_dict", (Term.prim_mk_const { Name = "instance_Show_Show_tup4_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_maybe", (Term.prim_mk_const { Name = "string_of_maybe", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_maybe", (Term.prim_mk_const { Name = "string_of_maybe", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Maybe_maybe_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Maybe_maybe_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Maybe_maybe_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Maybe_maybe_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("show_else", (Term.prim_mk_const { Name = "show_else", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("show_else", (Term.prim_mk_const { Name = "show_else", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_nat_dict", (Term.prim_mk_const { Name = "instance_Show_Show_nat_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_nat_dict", (Term.prim_mk_const { Name = "instance_Show_Show_nat_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Num_natural_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Num_natural_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Num_natural_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Num_natural_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Num_integer_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Num_integer_dict", Thy = "show"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Num_integer_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Num_integer_dict", Thy = "show"}))
  val show_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG Show_class_Axiom,
           case_def=Show_class_case_def,
           case_cong=Show_class_case_cong,
           induction=ORIG Show_class_induction,
           nchotomy=Show_class_nchotomy,
           size=SOME(Parse.Term`(show$Show_class_size) :('a -> (num$num)) -> ('a show$Show_class) -> (num$num)`,
                     ORIG Show_class_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME Show_class_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("show_method",(alpha -->
                 T"list" "list" [T"string" "char" []]))] end,
           accessors=Drule.CONJUNCTS Show_class_accessors,
           updates=Drule.CONJUNCTS Show_class_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [Show_class_accessors, Show_class_updates_eq_literal, Show_class_accfupds, Show_class_fupdfupds, Show_class_literal_11, Show_class_fupdfupds_comp] tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "show",
    thydataty = "compute",
    data =
        "show.string_of_unit_def show.string_of_triple_def show.instance_Show_Show_Num_integer_dict_def show.instance_Show_Show_Num_natural_dict_def show.instance_Show_Show_nat_dict_def show.show_else_def show.instance_Show_Show_Maybe_maybe_dict_def show.string_of_maybe_def show.instance_Show_Show_tup4_dict_def show.string_of_quad_def show.instance_Show_Show_tup3_dict_def show.string_of_pair_def show.instance_Show_Show_tup2_dict_def show.string_of_string_def show.instance_Show_Show_string_dict_def show.instance_Show_Show_bool_dict_def show.instance_Show_Show_unit_dict_def show.string_of_bool_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "show"
end
