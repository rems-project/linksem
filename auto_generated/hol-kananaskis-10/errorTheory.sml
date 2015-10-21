structure errorTheory :> errorTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading errorTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open showTheory
  in end;
  val _ = Theory.link_parents
          ("error",
          Arbnum.fromString "1445345851",
          Arbnum.fromString "664208")
          [("show",
           Arbnum.fromString "1445345838",
           Arbnum.fromString "419158")];
  val _ = Theory.incorporate_types "error" [("error", 1)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("error", "error"), ID("list", "list"),
   ID("pair", "prod"), ID("num", "num"), ID("string", "char"),
   ID("option", "option"), ID("min", "bool"), ID("ind_type", "recspace"),
   ID("bool", "!"), ID("arithmetic", "+"), ID("pair", ","),
   ID("arithmetic", "-"), ID("bool", "/\\"), ID("num", "0"),
   ID("min", "="), ID("min", "==>"), ID("bool", "?"), ID("min", "@"),
   ID("bool", "ARB"), ID("arithmetic", "BIT1"), ID("ind_type", "BOTTOM"),
   ID("bool", "COND"), ID("list", "CONS"), ID("ind_type", "CONSTR"),
   ID("bool", "DATATYPE"), ID("error", "Fail"), ID("combin", "I"),
   ID("list", "NIL"), ID("option", "NONE"), ID("arithmetic", "NUMERAL"),
   ID("option", "SOME"), ID("num", "SUC"), ID("error", "Success"),
   ID("bool", "TYPE_DEFINITION"), ID("pair", "UNCURRY"),
   ID("relation", "WF"), ID("relation", "WFREC"), ID("arithmetic", "ZERO"),
   ID("bool", "\\/"), ID("error", "as_maybe"), ID("string", "char_size"),
   ID("error", "error_CASE"), ID("error", "error_bind"),
   ID("error", "error_size"), ID("error", "fail0"), ID("error", "foldM"),
   ID("error", "foldM_tupled"), ID("list", "list_CASE"),
   ID("list", "list_size"), ID("error", "mapM"),
   ID("error", "mapM_tupled"), ID("pair", "pair_CASE"),
   ID("error", "repeatM"), ID("error", "repeatM'"),
   ID("error", "repeatM'_tupled"), ID("error", "repeatM_tupled"),
   ID("error", "return"), ID("error", "with_success"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'a", TYV "'b", TYOP [0, 1, 0], TYOP [0, 2, 0], TYOP [0, 0, 3],
   TYOP [1, 1], TYOP [0, 5, 4], TYOP [1, 0], TYOP [0, 0, 7], TYOP [2, 0],
   TYOP [1, 9], TYOP [4], TYOP [3, 11, 7], TYOP [0, 12, 10],
   TYOP [3, 9, 1], TYOP [1, 14], TYOP [3, 0, 1], TYOP [1, 16],
   TYOP [0, 1, 17], TYOP [3, 1, 18], TYOP [3, 11, 19], TYOP [0, 20, 15],
   TYOP [0, 18, 15], TYOP [0, 1, 22], TYOP [0, 11, 23], TYOP [0, 7, 10],
   TYOP [0, 11, 25], TYOP [2, 1], TYOP [0, 1, 7], TYOP [3, 28, 27],
   TYOP [0, 29, 10], TYOP [0, 27, 10], TYOP [0, 28, 31], TYOP [3, 0, 27],
   TYOP [0, 0, 28], TYOP [3, 34, 33], TYOP [0, 35, 7], TYOP [0, 27, 7],
   TYOP [0, 0, 37], TYOP [0, 34, 38], TYOP [5], TYOP [2, 40],
   TYOP [0, 41, 7], TYOP [0, 7, 11], TYOP [0, 0, 11], TYOP [0, 44, 43],
   TYOP [0, 28, 7], TYOP [0, 5, 46], TYOP [0, 41, 1], TYOP [0, 48, 1],
   TYOP [0, 0, 1], TYOP [0, 50, 49], TYOP [0, 7, 51], TYOP [6, 0],
   TYOP [0, 7, 53], TYOP [7], TYOP [3, 0, 41], TYOP [8, 56],
   TYOP [0, 57, 55], TYOP [0, 7, 55], TYOP [0, 27, 55], TYOP [0, 0, 60],
   TYOP [0, 34, 61], TYOP [0, 28, 60], TYOP [0, 18, 55], TYOP [0, 1, 64],
   TYOP [0, 11, 65], TYOP [0, 11, 59], TYOP [0, 35, 55], TYOP [0, 35, 68],
   TYOP [0, 29, 55], TYOP [0, 29, 70], TYOP [0, 12, 55], TYOP [0, 12, 72],
   TYOP [0, 20, 55], TYOP [0, 20, 74], TYOP [0, 42, 55], TYOP [0, 8, 76],
   TYOP [0, 7, 1], TYOP [0, 7, 57], TYOP [0, 0, 55], TYOP [0, 80, 55],
   TYOP [0, 1, 55], TYOP [0, 82, 55], TYOP [0, 59, 55], TYOP [0, 5, 55],
   TYOP [0, 85, 55], TYOP [0, 50, 55], TYOP [0, 87, 55], TYOP [0, 34, 55],
   TYOP [0, 89, 55], TYOP [0, 44, 55], TYOP [0, 91, 55], TYOP [0, 2, 55],
   TYOP [0, 93, 55], TYOP [0, 28, 55], TYOP [0, 95, 55], TYOP [0, 64, 55],
   TYOP [0, 84, 55], TYOP [0, 62, 55], TYOP [0, 99, 55], TYOP [0, 63, 55],
   TYOP [0, 101, 55], TYOP [0, 48, 55], TYOP [0, 103, 55],
   TYOP [0, 66, 55], TYOP [0, 105, 55], TYOP [0, 67, 55],
   TYOP [0, 107, 55], TYOP [0, 58, 55], TYOP [0, 109, 55],
   TYOP [0, 60, 55], TYOP [0, 41, 55], TYOP [0, 112, 55], TYOP [0, 11, 55],
   TYOP [0, 114, 55], TYOP [0, 11, 11], TYOP [0, 11, 116],
   TYOP [0, 27, 33], TYOP [0, 0, 118], TYOP [0, 41, 56], TYOP [0, 0, 120],
   TYOP [0, 18, 19], TYOP [0, 1, 122], TYOP [0, 33, 35], TYOP [0, 34, 124],
   TYOP [0, 27, 29], TYOP [0, 28, 126], TYOP [0, 1, 14], TYOP [0, 9, 128],
   TYOP [0, 7, 12], TYOP [0, 11, 130], TYOP [0, 19, 20], TYOP [0, 11, 132],
   TYOP [0, 55, 55], TYOP [0, 55, 134], TYOP [0, 0, 80], TYOP [0, 1, 82],
   TYOP [0, 7, 59], TYOP [0, 10, 55], TYOP [0, 10, 139], TYOP [0, 15, 55],
   TYOP [0, 15, 141], TYOP [0, 36, 55], TYOP [0, 36, 143],
   TYOP [0, 30, 55], TYOP [0, 30, 145], TYOP [0, 13, 55],
   TYOP [0, 13, 147], TYOP [0, 21, 55], TYOP [0, 21, 149],
   TYOP [0, 27, 60], TYOP [0, 41, 112], TYOP [0, 11, 114],
   TYOP [0, 53, 55], TYOP [0, 53, 154], TYOP [0, 57, 58], TYOP [0, 78, 55],
   TYOP [0, 157, 55], TYOP [0, 79, 55], TYOP [0, 159, 55],
   TYOP [0, 69, 55], TYOP [0, 161, 69], TYOP [0, 71, 55],
   TYOP [0, 163, 71], TYOP [0, 73, 55], TYOP [0, 165, 73],
   TYOP [0, 75, 55], TYOP [0, 167, 75], TYOP [0, 10, 10],
   TYOP [0, 10, 169], TYOP [0, 55, 170], TYOP [0, 15, 15],
   TYOP [0, 15, 172], TYOP [0, 55, 173], TYOP [0, 9, 9], TYOP [0, 0, 175],
   TYOP [0, 27, 27], TYOP [0, 1, 177], TYOP [0, 11, 57], TYOP [0, 179, 57],
   TYOP [0, 56, 180], TYOP [0, 11, 181], TYOP [0, 7, 7], TYOP [0, 0, 53],
   TYOP [0, 58, 159], TYOP [0, 16, 15], TYOP [0, 1, 15], TYOP [0, 0, 187],
   TYOP [0, 188, 186], TYOP [0, 14, 15], TYOP [0, 9, 187],
   TYOP [0, 191, 190], TYOP [0, 36, 36], TYOP [0, 193, 36],
   TYOP [0, 69, 194], TYOP [0, 30, 30], TYOP [0, 196, 30],
   TYOP [0, 71, 197], TYOP [0, 13, 13], TYOP [0, 199, 13],
   TYOP [0, 73, 200], TYOP [0, 21, 21], TYOP [0, 202, 21],
   TYOP [0, 75, 203], TYOP [0, 40, 11], TYOP [0, 41, 53],
   TYOP [0, 206, 53], TYOP [0, 184, 207], TYOP [0, 7, 208],
   TYOP [0, 41, 0], TYOP [0, 210, 0], TYOP [0, 2, 211], TYOP [0, 5, 212],
   TYOP [0, 42, 7], TYOP [0, 28, 214], TYOP [0, 5, 215], TYOP [0, 8, 7],
   TYOP [0, 7, 217], TYOP [0, 0, 10], TYOP [0, 219, 10], TYOP [0, 7, 220],
   TYOP [0, 9, 10], TYOP [0, 222, 10], TYOP [0, 10, 223],
   TYOP [0, 186, 15], TYOP [0, 17, 225], TYOP [0, 190, 15],
   TYOP [0, 15, 227], TYOP [0, 1, 37], TYOP [0, 229, 7], TYOP [0, 7, 230],
   TYOP [0, 27, 231], TYOP [0, 1, 31], TYOP [0, 233, 10],
   TYOP [0, 10, 234], TYOP [0, 27, 235], TYOP [0, 41, 11],
   TYOP [0, 205, 237], TYOP [0, 38, 7], TYOP [0, 33, 239],
   TYOP [0, 23, 15], TYOP [0, 19, 241], TYOP [0, 33, 7], TYOP [0, 34, 243],
   TYOP [0, 244, 7], TYOP [0, 35, 245], TYOP [0, 32, 10],
   TYOP [0, 29, 247], TYOP [0, 26, 10], TYOP [0, 12, 249],
   TYOP [0, 19, 15], TYOP [0, 11, 251], TYOP [0, 252, 15],
   TYOP [0, 20, 253]]
  end
  val _ = Theory.incorporate_consts "error" tyvector
     [("with_success", 6), ("return", 8), ("repeatM_tupled", 13),
      ("repeatM'_tupled", 21), ("repeatM'", 24), ("repeatM", 26),
      ("mapM_tupled", 30), ("mapM", 32), ("foldM_tupled", 36),
      ("foldM", 39), ("fail0", 42), ("error_size", 45), ("error_bind", 47),
      ("error_CASE", 52), ("as_maybe", 54), ("Success", 8), ("Fail", 42)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'error'", 58), TMV("M", 7), TMV("M'", 7), TMV("P", 59),
   TMV("P", 62), TMV("P", 63), TMV("P", 66), TMV("P", 67), TMV("R", 69),
   TMV("R", 71), TMV("R", 73), TMV("R", 75), TMV("a", 0), TMV("a", 41),
   TMV("a", 35), TMV("a", 29), TMV("a", 12), TMV("a", 20), TMV("a'", 0),
   TMV("a'", 41), TMV("a0", 57), TMV("action", 7), TMV("action", 18),
   TMV("count1", 11), TMV("e", 0), TMV("e", 7), TMV("ee", 7),
   TMV("err", 5), TMV("err", 41), TMV("error", 77), TMV("f", 50),
   TMV("f", 34), TMV("f", 44), TMV("f", 28), TMV("f'", 50), TMV("f0", 50),
   TMV("f1", 48), TMV("f1'", 48), TMV("fl", 0), TMV("fn", 78),
   TMV("foldM_tupled", 36), TMV("hd", 0), TMV("head", 0),
   TMV("mapM_tupled", 30), TMV("n", 11), TMV("r", 0), TMV("rep", 79),
   TMV("repeatM'_tupled", 21), TMV("repeatM_tupled", 13), TMV("res", 0),
   TMV("s", 0), TMV("s", 1), TMV("s", 41), TMV("seed", 1), TMV("seed'", 1),
   TMV("suc", 2), TMV("tail", 9), TMV("tl", 9), TMV("v", 34), TMV("v", 28),
   TMV("v", 11), TMV("v1", 0), TMV("v1", 1), TMV("v1", 7), TMV("v1", 27),
   TMV("v1", 33), TMV("v1", 19), TMV("v2", 18), TMV("v2", 27), TMV("x", 1),
   TMV("x", 5), TMV("x", 34), TMV("x", 28), TMV("x", 11), TMV("x1", 0),
   TMV("x1", 1), TMV("x1", 7), TMV("x1", 27), TMV("x2", 18), TMV("x2", 27),
   TMV("xs", 27), TMV("xs'", 27), TMC(9, 81), TMC(9, 83), TMC(9, 84),
   TMC(9, 86), TMC(9, 88), TMC(9, 90), TMC(9, 92), TMC(9, 94), TMC(9, 96),
   TMC(9, 97), TMC(9, 98), TMC(9, 100), TMC(9, 102), TMC(9, 104),
   TMC(9, 106), TMC(9, 108), TMC(9, 110), TMC(9, 111), TMC(9, 113),
   TMC(9, 115), TMC(9, 109), TMC(10, 117), TMC(11, 119), TMC(11, 121),
   TMC(11, 123), TMC(11, 125), TMC(11, 127), TMC(11, 129), TMC(11, 131),
   TMC(11, 133), TMC(12, 117), TMC(13, 135), TMC(14, 11), TMC(15, 136),
   TMC(15, 137), TMC(15, 135), TMC(15, 138), TMC(15, 140), TMC(15, 142),
   TMC(15, 144), TMC(15, 146), TMC(15, 148), TMC(15, 150), TMC(15, 151),
   TMC(15, 152), TMC(15, 153), TMC(15, 155), TMC(15, 156), TMC(16, 135),
   TMC(17, 81), TMC(17, 158), TMC(17, 160), TMC(17, 113), TMC(18, 162),
   TMC(18, 164), TMC(18, 166), TMC(18, 168), TMC(19, 0), TMC(19, 41),
   TMC(20, 116), TMC(21, 57), TMC(22, 171), TMC(22, 174), TMC(23, 176),
   TMC(23, 178), TMC(24, 182), TMC(25, 134), TMC(26, 42), TMC(27, 183),
   TMC(27, 169), TMC(27, 172), TMC(28, 9), TMC(29, 53), TMC(30, 116),
   TMC(31, 184), TMC(32, 116), TMC(33, 8), TMC(34, 185), TMC(35, 189),
   TMC(35, 192), TMC(36, 161), TMC(36, 163), TMC(36, 165), TMC(36, 167),
   TMC(37, 195), TMC(37, 198), TMC(37, 201), TMC(37, 204), TMC(38, 11),
   TMC(39, 135), TMC(40, 54), TMC(41, 205), TMC(42, 52), TMC(42, 209),
   TMC(42, 213), TMC(42, 216), TMC(43, 218), TMC(43, 221), TMC(43, 47),
   TMC(43, 224), TMC(43, 226), TMC(43, 228), TMC(44, 45), TMC(45, 42),
   TMC(46, 39), TMC(47, 36), TMC(48, 232), TMC(48, 236), TMC(49, 238),
   TMC(50, 32), TMC(51, 30), TMC(52, 240), TMC(52, 242), TMC(52, 246),
   TMC(52, 248), TMC(52, 250), TMC(52, 254), TMC(53, 26), TMC(54, 24),
   TMC(55, 21), TMC(56, 13), TMC(57, 8), TMC(57, 222), TMC(57, 190),
   TMC(58, 6), TMC(59, 134)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op error_TY_DEF x = x
    val op error_TY_DEF =
    DT(((("error",0),[("bool",[26])]),["DISK_THM"]),
       [read"%133%46%159%20%98%0%130%102%20%130%171%131%12%129$1@%12%147%114@%105$0@%140@@%44%142|@|$0@@|@@%134%13%129$1@%13%147%157%114@@%105%139@$0@@%44%142|@|$0@@|@@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op error_case_def x = x
    val op error_case_def =
    DT(((("error",6),
        [("bool",[26,181]),("error",[1,2,3,4,5]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%113%82%12%86%30%95%36%116%174%158$2@@$1@$0@@$1$2@@|@|@|@@%100%13%86%30%95%36%116%174%149$2@@$1@$0@@$0$2@@|@|@|@@"])
  fun op error_size_def x = x
    val op error_size_def =
    DT(((("error",7),
        [("bool",[26,181]),("error",[1,2,3,4,5]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%113%88%32%82%12%127%184$1@%158$0@@@%103%155%141%170@@@$1$0@@@|@|@@%88%32%100%13%127%184$1@%149$0@@@%103%155%141%170@@@%190%173@$0@@@|@|@@"])
  fun op return_def x = x
    val op return_def =
    DT(((("error",15),[]),[]), [read"%82%45%118%203$0@@%158$0@@|@"])
  fun op with_success_def x = x
    val op with_success_def =
    DT(((("error",16),[]),[]),
       [read"%85%27%82%38%89%55%115%206$2@$1@$0@@%176$2@%51$1$0@|@%28$2|@@|@|@|@"])
  fun op fail0_def x = x
    val op fail0_def =
    DT(((("error",17),[]),[]), [read"%100%28%118%185$0@@%149$0@@|@"])
  fun op error_bind_def x = x
    val op error_bind_def =
    DT(((("error",18),[]),[]),
       [read"%85%70%90%33%118%180$1@$0@@%177$1@%51$1$0@|@%28%149$0@|@@|@|@"])
  fun op as_maybe_def x = x
    val op as_maybe_def =
    DT(((("error",19),[]),[]),
       [read"%84%25%128%172$0@@%175$0@%50%156$0@|@%28%154|@@|@"])
  fun op repeatM_tupled_primitive_def x = x
    val op repeatM_tupled_primitive_def =
    DT(((("error",20),[]),[]),
       [read"%123%202@%168%137%10%113%164$0@@%84%21%101%23%130%207%127$0@%114@@@$2%110%112$0@%155%141%170@@@@$1@@%110$0@$1@@@|@|@@|@@%48%16%197$0@%23%21%151%143%127$1@%114@@%204%153@@%179$0@%42%181$4%110%112$2@%155%141%170@@@@$1@@@%56%204%145$1@$0@@|@|@@@||@||@@"])
  fun op repeatM_curried_def x = x
    val op repeatM_curried_def =
    DT(((("error",21),[]),[]),
       [read"%101%73%84%76%119%199$1@$0@@%202%110$1@$0@@@|@|@"])
  fun op repeatM'_tupled_primitive_def x = x
    val op repeatM'_tupled_primitive_def =
    DT(((("error",24),[]),[]),
       [read"%124%201@%169%138%11%113%165$0@@%83%53%91%22%101%23%83%54%130%207%127$1@%114@@@$4%111%112$1@%155%141%170@@@@%106$0@$2@@@%111$1@%106$3@$2@@@@|@|@|@|@@|@@%47%17%198$0@%23%66%194$0@%53%22%152%144%127$3@%114@@%205%109%153@$1@@@%182$0$1@@%160%42%53%183$7%111%112$5@%155%141%170@@@@%106$0@$2@@@@%161%56%53%205%109%145$3@$1@@$0@@||@@||@@@@||@||@||@@"])
  fun op repeatM'_curried_def x = x
    val op repeatM'_curried_def =
    DT(((("error",25),[]),[]),
       [read"%101%73%83%75%91%78%120%200$2@$1@$0@@%201%111$2@%106$1@$0@@@@|@|@|@"])
  fun op mapM_tupled_primitive_def x = x
    val op mapM_tupled_primitive_def =
    DT(((("error",28),[]),[]),
       [read"%122%192@%167%136%9%113%163$0@@%90%33%99%80%83%69%99%81%130%125$2@%146$1@$0@@@$4%108$3@$0@@%108$3@$2@@@|@|@|@|@@|@@%43%15%196$0@%33%80%151%189$0@%204%153@@%69%80%179$3$1@@%41%181$6%108$4@$1@@@%57%204%145$1@$0@@|@|@||@@||@||@@"])
  fun op mapM_curried_def x = x
    val op mapM_curried_def =
    DT(((("error",29),[]),[]),
       [read"%90%72%99%77%119%191$1@$0@@%192%108$1@$0@@@|@|@"])
  fun op foldM_tupled_primitive_def x = x
    val op foldM_tupled_primitive_def =
    DT(((("error",32),[]),[]),
       [read"%121%187@%166%135%8%113%162$0@@%82%24%87%31%99%80%83%69%99%81%82%49%130%125$3@%146$2@$1@@@$6%107$4@%104$0@$1@@@%107$4@%104$5@$3@@@@|@|@|@|@|@|@@|@@%40%14%195$0@%31%65%193$0@%24%80%150%188$0@%203$1@@%69%80%178$5$3@$1@@%49$8%107$6@%104$0@$1@@@|@||@@||@||@||@@"])
  fun op foldM_curried_def x = x
    val op foldM_curried_def =
    DT(((("error",33),[]),[]),
       [read"%87%71%82%74%99%79%118%186$2@$1@$0@@%187%107$2@%104$1@$0@@@@|@|@|@"])
  fun op datatype_error x = x
    val op datatype_error =
    DT(((("error",8),[("bool",[25,171])]),["DISK_THM"]),
       [read"%148%29%158@%149@@"])
  fun op error_11 x = x
    val op error_11 =
    DT(((("error",9),
        [("bool",[26,56,63,181]),("error",[1,2,3,4,5]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%113%82%12%82%18%117%118%158$1@@%158$0@@@%115$1@$0@@|@|@@%100%13%100%19%117%118%149$1@@%149$0@@@%126$1@$0@@|@|@@"])
  fun op error_distinct x = x
    val op error_distinct =
    DT(((("error",10),
        [("bool",[25,26,47,54,63,181]),("error",[1,2,3,4,5]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%100%19%82%12%207%118%158$0@@%149$1@@@|@|@"])
  fun op error_case_cong x = x
    val op error_case_cong =
    DT(((("error",11),
        [("bool",[26,181]),("error",[1,2,3,4,5,6])]),["DISK_THM"]),
       [read"%84%1%84%2%86%30%95%36%130%113%118$3@$2@@%113%82%12%130%118$3@%158$0@@@%116$2$0@@%34$0@@@|@@%100%13%130%118$3@%149$0@@@%116$1$0@@%37$0@@@|@@@@%116%174$3@$1@$0@@%174$2@%34@%37@@@|@|@|@|@"])
  fun op error_nchotomy x = x
    val op error_nchotomy =
    DT(((("error",12),
        [("bool",[26,181]),("error",[1,2,3,4,5])]),["DISK_THM"]),
       [read"%84%26%171%131%12%118$1@%158$0@@|@@%134%52%118$1@%149$0@@|@@|@"])
  fun op error_Axiom x = x
    val op error_Axiom =
    DT(((("error",13),
        [("bool",[26,181]),("error",[1,2,3,4,5]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%86%35%95%36%132%39%113%82%12%116$1%158$0@@@$3$0@@|@@%100%13%116$1%149$0@@@$2$0@@|@@|@|@|@"])
  fun op error_induction x = x
    val op error_induction =
    DT(((("error",14),[("bool",[26]),("error",[1,2,3,4,5])]),["DISK_THM"]),
       [read"%92%3%130%113%82%12$1%158$0@@|@@%100%52$1%149$0@@|@@@%84%25$1$0@|@@|@"])
  fun op repeatM_ind x = x
    val op repeatM_ind =
    DT(((("error",22),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%97%7%130%101%23%84%21%130%130%207%127$1@%114@@@$2%112$1@%155%141%170@@@@$0@@@$2$1@$0@@|@|@@%101%60%84%63$2$1@$0@|@|@@|@",
        read"%84%21%101%23%130%207%127$0@%114@@@%10%110%112$0@%155%141%170@@@@$1@@%110$0@$1@@@|@|@",
        read"%164%10@"])
  fun op repeatM_def x = x
    val op repeatM_def =
    DT(((("error",23),
        [("bool",[15,58,129]),("combin",[19]),("error",[20,21]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%101%23%84%21%119%199$1@$0@@%143%127$1@%114@@%204%153@@%179$0@%42%181%199%112$2@%155%141%170@@@@$1@@%56%204%145$1@$0@@|@|@@@|@|@",
        read"%84%21%101%23%130%207%127$0@%114@@@%10%110%112$0@%155%141%170@@@@$1@@%110$0@$1@@@|@|@",
        read"%164%10@"])
  fun op repeatM'_ind x = x
    val op repeatM'_ind =
    DT(((("error",26),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%96%6%130%101%23%83%53%91%22%130%83%54%130%207%127$3@%114@@@$4%112$3@%155%141%170@@@@$0@$1@@|@@$3$2@$1@$0@@|@|@|@@%101%60%83%62%91%67$3$2@$1@$0@|@|@|@@|@",
        read"%83%53%91%22%101%23%83%54%130%207%127$1@%114@@@%11%111%112$1@%155%141%170@@@@%106$0@$2@@@%111$1@%106$3@$2@@@@|@|@|@|@",
        read"%165%11@"])
  fun op repeatM'_def x = x
    val op repeatM'_def =
    DT(((("error",27),
        [("bool",[15,58,129]),("combin",[19]),("error",[24,25]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%83%53%101%23%91%22%120%200$1@$2@$0@@%144%127$1@%114@@%205%109%153@$2@@@%182$0$2@@%160%42%54%183%200%112$3@%155%141%170@@@@$0@$2@@%161%56%53%205%109%145$3@$1@@$0@@||@@||@@@@|@|@|@",
        read"%83%53%91%22%101%23%83%54%130%207%127$1@%114@@@%11%111%112$1@%155%141%170@@@@%106$0@$2@@@%111$1@%106$3@$2@@@@|@|@|@|@",
        read"%165%11@"])
  fun op mapM_ind x = x
    val op mapM_ind =
    DT(((("error",30),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%94%5%130%90%33%99%80%130%83%69%99%81%130%125$2@%146$1@$0@@@$4$3@$0@@|@|@@$2$1@$0@@|@|@@%90%59%99%64$2$1@$0@|@|@@|@",
        read"%90%33%99%80%83%69%99%81%130%125$2@%146$1@$0@@@%9%108$3@$0@@%108$3@$2@@@|@|@|@|@",
        read"%163%9@"])
  fun op mapM_def x = x
    val op mapM_def =
    DT(((("error",31),
        [("bool",[15,58]),("combin",[19]),("error",[28,29]),("list",[11]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%99%80%90%33%119%191$0@$1@@%189$1@%204%153@@%69%81%179$2$1@@%41%181%191$3@$1@@%57%204%145$1@$0@@|@|@||@@|@|@",
        read"%90%33%99%80%83%69%99%81%130%125$2@%146$1@$0@@@%9%108$3@$0@@%108$3@$2@@@|@|@|@|@",
        read"%163%9@"])
  fun op foldM_ind x = x
    val op foldM_ind =
    DT(((("error",34),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%93%4%130%87%31%82%24%99%80%130%83%69%99%81%82%49%130%125$3@%146$2@$1@@@$6$5@$0@$1@@|@|@|@@$3$2@$1@$0@@|@|@|@@%87%58%82%61%99%68$3$2@$1@$0@|@|@|@@|@",
        read"%82%24%87%31%99%80%83%69%99%81%82%49%130%125$3@%146$2@$1@@@%8%107$4@%104$0@$1@@@%107$4@%104$5@$3@@@@|@|@|@|@|@|@",
        read"%162%8@"])
  fun op foldM_def x = x
    val op foldM_def =
    DT(((("error",35),
        [("bool",[15,58]),("combin",[19]),("error",[32,33]),("list",[11]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%99%80%87%31%82%24%118%186$1@$0@$2@@%188$2@%203$0@@%69%81%178$3$2@$1@@%49%186$4@$0@$1@|@||@@|@|@|@",
        read"%82%24%87%31%99%80%83%69%99%81%82%49%130%125$3@%146$2@$1@@@%8%107$4@%104$0@$1@@@%107$4@%104$5@$3@@@@|@|@|@|@|@|@",
        read"%162%8@"])
  end
  val _ = DB.bindl "error"
  [("error_TY_DEF",error_TY_DEF,DB.Def),
   ("error_case_def",error_case_def,DB.Def),
   ("error_size_def",error_size_def,DB.Def),
   ("return_def",return_def,DB.Def),
   ("with_success_def",with_success_def,DB.Def),
   ("fail0_def",fail0_def,DB.Def),
   ("error_bind_def",error_bind_def,DB.Def),
   ("as_maybe_def",as_maybe_def,DB.Def),
   ("repeatM_tupled_primitive_def",repeatM_tupled_primitive_def,DB.Def),
   ("repeatM_curried_def",repeatM_curried_def,DB.Def),
   ("repeatM'_tupled_primitive_def",repeatM'_tupled_primitive_def,DB.Def),
   ("repeatM'_curried_def",repeatM'_curried_def,DB.Def),
   ("mapM_tupled_primitive_def",mapM_tupled_primitive_def,DB.Def),
   ("mapM_curried_def",mapM_curried_def,DB.Def),
   ("foldM_tupled_primitive_def",foldM_tupled_primitive_def,DB.Def),
   ("foldM_curried_def",foldM_curried_def,DB.Def),
   ("datatype_error",datatype_error,DB.Thm), ("error_11",error_11,DB.Thm),
   ("error_distinct",error_distinct,DB.Thm),
   ("error_case_cong",error_case_cong,DB.Thm),
   ("error_nchotomy",error_nchotomy,DB.Thm),
   ("error_Axiom",error_Axiom,DB.Thm),
   ("error_induction",error_induction,DB.Thm),
   ("repeatM_ind",repeatM_ind,DB.Thm), ("repeatM_def",repeatM_def,DB.Thm),
   ("repeatM'_ind",repeatM'_ind,DB.Thm),
   ("repeatM'_def",repeatM'_def,DB.Thm), ("mapM_ind",mapM_ind,DB.Thm),
   ("mapM_def",mapM_def,DB.Thm), ("foldM_ind",foldM_ind,DB.Thm),
   ("foldM_def",foldM_def,DB.Thm)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("showTheory.show_grammars",
                          showTheory.show_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms temp_add_type "error"
  val _ = update_grms temp_add_type "error"






  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Success", (Term.prim_mk_const { Name = "Success", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Success", (Term.prim_mk_const { Name = "Success", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Fail", (Term.prim_mk_const { Name = "Fail", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Fail", (Term.prim_mk_const { Name = "Fail", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("error_CASE", (Term.prim_mk_const { Name = "error_CASE", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("error_size", (Term.prim_mk_const { Name = "error_size", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("return", (Term.prim_mk_const { Name = "return", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("return", (Term.prim_mk_const { Name = "return", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("with_success", (Term.prim_mk_const { Name = "with_success", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("with_success", (Term.prim_mk_const { Name = "with_success", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("fail0", (Term.prim_mk_const { Name = "fail0", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("fail0", (Term.prim_mk_const { Name = "fail0", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("error_bind", (Term.prim_mk_const { Name = "error_bind", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("error_bind", (Term.prim_mk_const { Name = "error_bind", Thy = "error"}))
  val _ = update_grms
       (UTOFF (temp_set_fixity ">>="))
       (Infix(HOLgrammars.LEFT, 500))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (">>=", (#2 (parse_from_grammars min_grammars)[QUOTE "(error$error_bind :('a error$error) -> ('a -> ('b error$error)) -> ('b error$error))"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("as_maybe", (Term.prim_mk_const { Name = "as_maybe", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("as_maybe", (Term.prim_mk_const { Name = "as_maybe", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM_tupled", (Term.prim_mk_const { Name = "repeatM_tupled", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM_tupled", (Term.prim_mk_const { Name = "repeatM_tupled", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM", (Term.prim_mk_const { Name = "repeatM", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM", (Term.prim_mk_const { Name = "repeatM", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM'_tupled", (Term.prim_mk_const { Name = "repeatM'_tupled", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM'_tupled", (Term.prim_mk_const { Name = "repeatM'_tupled", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM'", (Term.prim_mk_const { Name = "repeatM'", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM'", (Term.prim_mk_const { Name = "repeatM'", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapM_tupled", (Term.prim_mk_const { Name = "mapM_tupled", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapM_tupled", (Term.prim_mk_const { Name = "mapM_tupled", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapM", (Term.prim_mk_const { Name = "mapM", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapM", (Term.prim_mk_const { Name = "mapM", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("foldM_tupled", (Term.prim_mk_const { Name = "foldM_tupled", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("foldM_tupled", (Term.prim_mk_const { Name = "foldM_tupled", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("foldM", (Term.prim_mk_const { Name = "foldM", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("foldM", (Term.prim_mk_const { Name = "foldM", Thy = "error"}))
  val error_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG error_Axiom,
           case_def=error_case_def,
           case_cong=error_case_cong,
           induction=ORIG error_induction,
           nchotomy=error_nchotomy,
           size=SOME(Parse.Term`(error$error_size) :('a -> (num$num)) -> ('a error$error) -> (num$num)`,
                     ORIG error_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME error_11,
           distinct=SOME error_distinct,
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
    thy = "error",
    thydataty = "compute",
    data =
        "error.return_def error.with_success_def error.as_maybe_def error.error_bind_def error.fail0_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "error"
end
