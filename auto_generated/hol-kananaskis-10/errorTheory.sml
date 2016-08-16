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
          Arbnum.fromString "1471355106",
          Arbnum.fromString "956631")
          [("show",
           Arbnum.fromString "1471355094",
           Arbnum.fromString "275066")];
  val _ = Theory.incorporate_types "error" [("error", 1)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("error", "error"), ID("list", "list"),
   ID("string", "char"), ID("show", "Show_class"), ID("num", "num"),
   ID("pair", "prod"), ID("option", "option"), ID("min", "bool"),
   ID("ind_type", "recspace"), ID("bool", "!"), ID("arithmetic", "+"),
   ID("pair", ","), ID("arithmetic", "-"), ID("bool", "/\\"),
   ID("num", "0"), ID("min", "="), ID("min", "==>"), ID("bool", "?"),
   ID("list", "APPEND"), ID("bool", "ARB"), ID("arithmetic", "BIT1"),
   ID("arithmetic", "BIT2"), ID("ind_type", "BOTTOM"), ID("string", "CHR"),
   ID("bool", "COND"), ID("list", "CONS"), ID("ind_type", "CONSTR"),
   ID("bool", "DATATYPE"), ID("error", "Fail"), ID("combin", "K"),
   ID("list", "NIL"), ID("option", "NONE"), ID("arithmetic", "NUMERAL"),
   ID("option", "SOME"), ID("num", "SUC"),
   ID("show", "Show_class_show_method"),
   ID("show", "Show_class_show_method_fupd"), ID("error", "Success"),
   ID("bool", "TYPE_DEFINITION"), ID("pair", "UNCURRY"),
   ID("relation", "WF"), ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("error", "as_maybe"), ID("string", "char_size"),
   ID("error", "error_CASE"), ID("error", "error_bind"),
   ID("error", "error_size"), ID("error", "fail0"), ID("error", "foldM"),
   ID("error", "instance_Show_Show_Error_error_dict"),
   ID("list", "list_CASE"), ID("list", "list_size"), ID("error", "mapM"),
   ID("error", "mapM'"), ID("error", "repeatM"), ID("error", "repeatM'"),
   ID("error", "repeatM''"), ID("error", "return"),
   ID("error", "string_of_error"), ID("error", "with_success"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'a", TYV "'b", TYOP [0, 1, 0], TYOP [0, 2, 0], TYOP [0, 0, 3],
   TYOP [1, 1], TYOP [0, 5, 4], TYOP [3], TYOP [2, 7], TYOP [1, 0],
   TYOP [0, 9, 8], TYOP [4, 0], TYOP [0, 11, 10], TYOP [0, 0, 9],
   TYOP [2, 0], TYOP [1, 14], TYOP [0, 15, 15], TYOP [0, 9, 16], TYOP [5],
   TYOP [0, 18, 17], TYOP [6, 14, 1], TYOP [1, 20], TYOP [6, 0, 1],
   TYOP [1, 22], TYOP [0, 1, 23], TYOP [0, 24, 21], TYOP [0, 1, 25],
   TYOP [0, 18, 26], TYOP [0, 9, 15], TYOP [0, 18, 28], TYOP [2, 1],
   TYOP [0, 30, 16], TYOP [0, 1, 9], TYOP [0, 32, 31], TYOP [0, 30, 15],
   TYOP [0, 32, 34], TYOP [4, 9], TYOP [0, 11, 36], TYOP [0, 30, 9],
   TYOP [0, 0, 38], TYOP [0, 0, 32], TYOP [0, 40, 39], TYOP [0, 8, 9],
   TYOP [0, 9, 18], TYOP [0, 0, 18], TYOP [0, 44, 43], TYOP [0, 32, 9],
   TYOP [0, 5, 46], TYOP [0, 8, 1], TYOP [0, 48, 1], TYOP [0, 0, 1],
   TYOP [0, 50, 49], TYOP [0, 9, 51], TYOP [7, 0], TYOP [0, 9, 53],
   TYOP [8], TYOP [6, 0, 8], TYOP [9, 56], TYOP [0, 57, 55],
   TYOP [0, 9, 55], TYOP [0, 30, 55], TYOP [0, 0, 60], TYOP [0, 40, 61],
   TYOP [0, 15, 55], TYOP [0, 30, 63], TYOP [0, 32, 64], TYOP [0, 24, 55],
   TYOP [0, 1, 66], TYOP [0, 18, 67], TYOP [0, 9, 63], TYOP [0, 18, 69],
   TYOP [6, 0, 30], TYOP [6, 40, 71], TYOP [0, 72, 55], TYOP [0, 72, 73],
   TYOP [6, 30, 15], TYOP [6, 32, 75], TYOP [0, 76, 55], TYOP [0, 76, 77],
   TYOP [6, 1, 24], TYOP [6, 18, 79], TYOP [0, 80, 55], TYOP [0, 80, 81],
   TYOP [6, 9, 15], TYOP [6, 18, 83], TYOP [0, 84, 55], TYOP [0, 84, 85],
   TYOP [0, 42, 55], TYOP [0, 13, 87], TYOP [0, 9, 1], TYOP [0, 9, 57],
   TYOP [0, 0, 55], TYOP [0, 91, 55], TYOP [0, 1, 55], TYOP [0, 93, 55],
   TYOP [0, 11, 55], TYOP [0, 95, 55], TYOP [0, 59, 55], TYOP [0, 5, 55],
   TYOP [0, 98, 55], TYOP [0, 63, 55], TYOP [0, 50, 55], TYOP [0, 101, 55],
   TYOP [0, 40, 55], TYOP [0, 103, 55], TYOP [0, 44, 55],
   TYOP [0, 105, 55], TYOP [0, 2, 55], TYOP [0, 107, 55], TYOP [0, 32, 55],
   TYOP [0, 109, 55], TYOP [0, 66, 55], TYOP [0, 97, 55], TYOP [0, 62, 55],
   TYOP [0, 113, 55], TYOP [0, 65, 55], TYOP [0, 115, 55],
   TYOP [0, 48, 55], TYOP [0, 117, 55], TYOP [0, 68, 55],
   TYOP [0, 119, 55], TYOP [0, 70, 55], TYOP [0, 121, 55],
   TYOP [0, 58, 55], TYOP [0, 123, 55], TYOP [0, 60, 55], TYOP [0, 8, 55],
   TYOP [0, 126, 55], TYOP [0, 18, 55], TYOP [0, 128, 55],
   TYOP [0, 18, 18], TYOP [0, 18, 130], TYOP [0, 30, 71], TYOP [0, 0, 132],
   TYOP [0, 8, 56], TYOP [0, 0, 134], TYOP [0, 24, 79], TYOP [0, 1, 136],
   TYOP [0, 15, 83], TYOP [0, 9, 138], TYOP [0, 71, 72], TYOP [0, 40, 140],
   TYOP [0, 75, 76], TYOP [0, 32, 142], TYOP [0, 1, 20], TYOP [0, 14, 144],
   TYOP [0, 15, 75], TYOP [0, 30, 146], TYOP [0, 79, 80],
   TYOP [0, 18, 148], TYOP [0, 83, 84], TYOP [0, 18, 150],
   TYOP [0, 55, 55], TYOP [0, 55, 152], TYOP [0, 0, 91], TYOP [0, 1, 93],
   TYOP [0, 36, 55], TYOP [0, 36, 156], TYOP [0, 9, 59], TYOP [0, 15, 63],
   TYOP [0, 21, 55], TYOP [0, 21, 160], TYOP [0, 30, 60], TYOP [0, 8, 126],
   TYOP [0, 18, 128], TYOP [0, 53, 55], TYOP [0, 53, 165],
   TYOP [0, 57, 58], TYOP [0, 89, 55], TYOP [0, 168, 55], TYOP [0, 90, 55],
   TYOP [0, 170, 55], TYOP [0, 8, 8], TYOP [0, 8, 172], TYOP [0, 18, 7],
   TYOP [0, 15, 16], TYOP [0, 55, 175], TYOP [0, 21, 21],
   TYOP [0, 21, 177], TYOP [0, 55, 178], TYOP [0, 14, 14],
   TYOP [0, 0, 180], TYOP [0, 30, 30], TYOP [0, 1, 182], TYOP [0, 7, 172],
   TYOP [0, 18, 57], TYOP [0, 185, 57], TYOP [0, 56, 186],
   TYOP [0, 18, 187], TYOP [0, 10, 10], TYOP [0, 10, 189], TYOP [0, 0, 53],
   TYOP [0, 0, 8], TYOP [0, 11, 192], TYOP [0, 36, 36], TYOP [0, 189, 194],
   TYOP [0, 58, 170], TYOP [0, 22, 21], TYOP [0, 1, 21], TYOP [0, 0, 198],
   TYOP [0, 199, 197], TYOP [0, 20, 21], TYOP [0, 14, 198],
   TYOP [0, 202, 201], TYOP [0, 74, 55], TYOP [0, 78, 55],
   TYOP [0, 82, 55], TYOP [0, 86, 55], TYOP [0, 7, 18], TYOP [0, 172, 8],
   TYOP [0, 192, 209], TYOP [0, 9, 210], TYOP [0, 8, 53],
   TYOP [0, 212, 53], TYOP [0, 191, 213], TYOP [0, 9, 214], TYOP [0, 8, 0],
   TYOP [0, 216, 0], TYOP [0, 2, 217], TYOP [0, 5, 218], TYOP [0, 42, 9],
   TYOP [0, 32, 220], TYOP [0, 5, 221], TYOP [0, 13, 9], TYOP [0, 9, 223],
   TYOP [0, 0, 15], TYOP [0, 225, 15], TYOP [0, 9, 226], TYOP [0, 14, 15],
   TYOP [0, 228, 15], TYOP [0, 15, 229], TYOP [0, 197, 21],
   TYOP [0, 23, 231], TYOP [0, 201, 21], TYOP [0, 21, 233],
   TYOP [0, 1, 38], TYOP [0, 235, 9], TYOP [0, 9, 236], TYOP [0, 30, 237],
   TYOP [0, 1, 34], TYOP [0, 239, 15], TYOP [0, 15, 240],
   TYOP [0, 30, 241], TYOP [0, 8, 18], TYOP [0, 208, 243]]
  end
  val _ = Theory.incorporate_consts "error" tyvector
     [("with_success", 6), ("string_of_error", 12), ("return", 13),
      ("repeatM''", 19), ("repeatM'", 27), ("repeatM", 29), ("mapM'", 33),
      ("mapM", 35), ("instance_Show_Show_Error_error_dict", 37),
      ("foldM", 41), ("fail0", 42), ("error_size", 45), ("error_bind", 47),
      ("error_CASE", 52), ("as_maybe", 54), ("Success", 13), ("Fail", 42)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'error'", 58), TMV("M", 9), TMV("M'", 9), TMV("P", 59),
   TMV("P", 62), TMV("P", 65), TMV("P", 68), TMV("P", 70), TMV("R", 74),
   TMV("R", 78), TMV("R", 82), TMV("R", 86), TMV("a", 0), TMV("a", 8),
   TMV("a'", 0), TMV("a'", 8), TMV("a0", 57), TMV("acc", 15),
   TMV("action", 9), TMV("action", 24), TMV("count1", 18),
   TMV("dict_Show_Show_a", 11), TMV("e", 0), TMV("e", 9), TMV("ee", 9),
   TMV("err", 5), TMV("err", 8), TMV("error", 88), TMV("f", 50),
   TMV("f", 40), TMV("f", 44), TMV("f", 32), TMV("f'", 50), TMV("f0", 50),
   TMV("f1", 48), TMV("f1'", 48), TMV("fl", 0), TMV("fn", 89),
   TMV("hd", 0), TMV("head", 0), TMV("n", 18), TMV("r", 0), TMV("rep", 90),
   TMV("res", 0), TMV("s", 0), TMV("s", 1), TMV("s", 8), TMV("seed", 1),
   TMV("seed'", 1), TMV("suc", 2), TMV("tail", 14), TMV("tl", 14),
   TMV("v", 40), TMV("v", 32), TMV("v", 18), TMV("v1", 0), TMV("v1", 1),
   TMV("v1", 9), TMV("v1", 30), TMV("v2", 15), TMV("v2", 24),
   TMV("v2", 30), TMV("x", 1), TMV("x", 5), TMV("xs", 30), TMV("xs'", 30),
   TMC(10, 92), TMC(10, 94), TMC(10, 96), TMC(10, 97), TMC(10, 99),
   TMC(10, 100), TMC(10, 102), TMC(10, 104), TMC(10, 106), TMC(10, 108),
   TMC(10, 110), TMC(10, 111), TMC(10, 112), TMC(10, 114), TMC(10, 116),
   TMC(10, 118), TMC(10, 120), TMC(10, 122), TMC(10, 124), TMC(10, 125),
   TMC(10, 127), TMC(10, 129), TMC(10, 123), TMC(11, 131), TMC(12, 133),
   TMC(12, 135), TMC(12, 137), TMC(12, 139), TMC(12, 141), TMC(12, 143),
   TMC(12, 145), TMC(12, 147), TMC(12, 149), TMC(12, 151), TMC(13, 131),
   TMC(14, 153), TMC(15, 18), TMC(16, 154), TMC(16, 155), TMC(16, 157),
   TMC(16, 153), TMC(16, 158), TMC(16, 159), TMC(16, 161), TMC(16, 162),
   TMC(16, 163), TMC(16, 164), TMC(16, 166), TMC(16, 167), TMC(17, 153),
   TMC(18, 92), TMC(18, 169), TMC(18, 171), TMC(18, 127), TMC(19, 173),
   TMC(20, 0), TMC(20, 36), TMC(20, 8), TMC(21, 130), TMC(22, 130),
   TMC(23, 57), TMC(24, 174), TMC(25, 176), TMC(25, 179), TMC(26, 181),
   TMC(26, 183), TMC(26, 184), TMC(27, 188), TMC(28, 152), TMC(29, 42),
   TMC(30, 190), TMC(31, 14), TMC(31, 8), TMC(32, 53), TMC(33, 130),
   TMC(34, 191), TMC(35, 130), TMC(36, 193), TMC(37, 195), TMC(38, 13),
   TMC(39, 196), TMC(40, 200), TMC(40, 203), TMC(41, 204), TMC(41, 205),
   TMC(41, 206), TMC(41, 207), TMC(42, 18), TMC(43, 153), TMC(44, 54),
   TMC(45, 208), TMC(46, 52), TMC(46, 211), TMC(46, 215), TMC(46, 219),
   TMC(46, 222), TMC(47, 224), TMC(47, 227), TMC(47, 47), TMC(47, 230),
   TMC(47, 232), TMC(47, 234), TMC(48, 45), TMC(49, 42), TMC(50, 41),
   TMC(51, 37), TMC(52, 238), TMC(52, 242), TMC(53, 244), TMC(54, 35),
   TMC(55, 33), TMC(56, 29), TMC(57, 27), TMC(58, 19), TMC(59, 13),
   TMC(59, 228), TMC(59, 201), TMC(60, 12), TMC(61, 6), TMC(62, 152)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op error_TY_DEF x = x
    val op error_TY_DEF =
    DT(((("error",0),[("bool",[26])]),["DISK_THM"]),
       [read"%118%42%146%16%84%0%115%88%16%115%154%116%12%114$1@%12%133%102@%91$0@%123@@%40%126|@|$0@@|@@%119%13%114$1@%13%133%142%102@@%91%121@$0@@%40%126|@|$0@@|@@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op error_case_def x = x
    val op error_case_def =
    DT(((("error",6),
        [("bool",[26,180]),("error",[1,2,3,4,5]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%101%66%12%72%28%81%34%104%157%145$2@@$1@$0@@$1$2@@|@|@|@@%86%13%72%28%81%34%104%157%135$2@@$1@$0@@$0$2@@|@|@|@@"])
  fun op error_size_def x = x
    val op error_size_def =
    DT(((("error",7),
        [("bool",[26,180]),("error",[1,2,3,4,5]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%101%74%30%66%12%112%168$1@%145$0@@@%89%140%124%153@@@$1$0@@@|@|@@%74%30%86%13%112%168$1@%135$0@@@%89%140%124%153@@@%174%156@$0@@@|@|@@"])
  fun op return_def x = x
    val op return_def =
    DT(((("error",15),[]),[]), [read"%66%41%107%180$0@@%145$0@@|@"])
  fun op with_success_def x = x
    val op with_success_def =
    DT(((("error",16),[]),[]),
       [read"%70%25%66%36%75%49%103%184$2@$1@$0@@%160$2@%45$1$0@|@%26$2|@@|@|@|@"])
  fun op fail0_def x = x
    val op fail0_def =
    DT(((("error",17),[]),[]), [read"%86%26%107%169$0@@%135$0@@|@"])
  fun op error_bind_def x = x
    val op error_bind_def =
    DT(((("error",18),[]),[]),
       [read"%70%63%76%31%107%164$1@$0@@%161$1@%45$1$0@|@%26%135$0@|@@|@|@"])
  fun op as_maybe_def x = x
    val op as_maybe_def =
    DT(((("error",19),[]),[]),
       [read"%69%23%113%155$0@@%159$0@%44%141$0@|@%26%139|@@|@"])
  fun op repeatM_def x = x
    val op repeatM_def =
    DT(((("error",24),[]),[]),
       [read"%87%20%69%18%108%177$1@$0@@%179$1@$0@%181%137@@@|@|@"])
  fun op mapM_def x = x
    val op mapM_def =
    DT(((("error",33),[]),[]),
       [read"%76%31%85%64%108%175$1@$0@@%176$1@$0@%181%137@@@|@|@"])
  fun op string_of_error_def x = x
    val op string_of_error_def =
    DT(((("error",38),[]),[]),
       [read"%68%21%69%23%111%183$1@$0@@%158$0@%44%143$2@$0@|@%26%120%132%127%140%125%125%125%124%124%124%153@@@@@@@@@%132%127%140%124%125%124%124%124%125%153@@@@@@@@@%132%127%140%124%125%124%125%124%125%153@@@@@@@@@%132%127%140%125%124%125%125%124%125%153@@@@@@@@@%132%127%140%125%125%124%125%125%153@@@@@@@@%132%127%140%125%124%124%124%124%153@@@@@@@@%138@@@@@@@$0@|@@|@|@"])
  fun op instance_Show_Show_Error_error_dict_def x = x
    val op instance_Show_Show_Error_error_dict_def =
    DT(((("error",39),[]),[]),
       [read"%68%21%105%171$0@@%144%136%183$0@@@%122@@|@"])
  fun op datatype_error x = x
    val op datatype_error =
    DT(((("error",8),[("bool",[25,170])]),["DISK_THM"]),
       [read"%134%27%145@%135@@"])
  fun op error_11 x = x
    val op error_11 =
    DT(((("error",9),
        [("bool",[26,55,62,180]),("error",[1,2,3,4,5]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%101%66%12%66%14%106%107%145$1@@%145$0@@@%103$1@$0@@|@|@@%86%13%86%15%106%107%135$1@@%135$0@@@%111$1@$0@@|@|@@"])
  fun op error_distinct x = x
    val op error_distinct =
    DT(((("error",10),
        [("bool",[25,26,46,53,62,180]),("error",[1,2,3,4,5]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%86%15%66%12%185%107%145$0@@%135$1@@@|@|@"])
  fun op error_case_cong x = x
    val op error_case_cong =
    DT(((("error",11),
        [("bool",[26,180]),("error",[1,2,3,4,5,6])]),["DISK_THM"]),
       [read"%69%1%69%2%72%28%81%34%115%101%107$3@$2@@%101%66%12%115%107$3@%145$0@@@%104$2$0@@%32$0@@@|@@%86%13%115%107$3@%135$0@@@%104$1$0@@%35$0@@@|@@@@%104%157$3@$1@$0@@%157$2@%32@%35@@@|@|@|@|@"])
  fun op error_nchotomy x = x
    val op error_nchotomy =
    DT(((("error",12),
        [("bool",[26,180]),("error",[1,2,3,4,5])]),["DISK_THM"]),
       [read"%69%24%154%116%12%107$1@%145$0@@|@@%119%46%107$1@%135$0@@|@@|@"])
  fun op error_Axiom x = x
    val op error_Axiom =
    DT(((("error",13),
        [("bool",[26,180]),("error",[1,2,3,4,5]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%72%33%81%34%117%37%101%66%12%104$1%145$0@@@$3$0@@|@@%86%13%104$1%135$0@@@$2$0@@|@@|@|@|@"])
  fun op error_induction x = x
    val op error_induction =
    DT(((("error",14),[("bool",[26]),("error",[1,2,3,4,5])]),["DISK_THM"]),
       [read"%78%3%115%101%66%12$1%145$0@@|@@%86%46$1%135$0@@|@@@%69%23$1$0@|@@|@"])
  fun op repeatM''_ind x = x
    val op repeatM''_ind =
    DT(((("error",22),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%83%7%115%87%20%69%18%71%17%115%115%185%112$2@%102@@@$3%100$2@%140%124%153@@@@$1@%165$0@%50%163$2@%39%181%130$0@$1@@|@|@@@@$3$2@$1@$0@@|@|@|@@%87%54%69%57%71%59$3$2@$1@$0@|@|@|@@|@",
        read"%71%17%69%18%87%20%115%185%112$0@%102@@@%11%99%100$0@%140%124%153@@@@%93$1@%165$2@%50%163$2@%39%181%130$0@$1@@|@|@@@@%99$0@%93$1@$2@@@@|@|@|@",
        read"%152%11@"])
  fun op repeatM''_def x = x
    val op repeatM''_def =
    DT(((("error",23),
        [("bool",[15,57,128]),("combin",[19]),("error",[20,21]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%87%20%69%18%71%17%108%179$2@$1@$0@@%128%112$2@%102@@$0@%179%100$2@%140%124%153@@@@$1@%165$0@%50%163$2@%39%181%130$0@$1@@|@|@@@@|@|@|@",
        read"%71%17%69%18%87%20%115%185%112$0@%102@@@%11%99%100$0@%140%124%153@@@@%93$1@%165$2@%50%163$2@%39%181%130$0@$1@@|@|@@@@%99$0@%93$1@$2@@@@|@|@|@",
        read"%152%11@"])
  fun op repeatM'_ind x = x
    val op repeatM'_ind =
    DT(((("error",27),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%82%6%115%87%20%67%47%77%19%115%67%48%115%185%112$3@%102@@@$4%100$3@%140%124%153@@@@$0@$1@@|@@$3$2@$1@$0@@|@|@|@@%87%54%67%56%77%60$3$2@$1@$0@|@|@|@@|@",
        read"%67%47%77%19%87%20%67%48%115%185%112$1@%102@@@%10%98%100$1@%140%124%153@@@@%92$0@$2@@@%98$1@%92$3@$2@@@@|@|@|@|@",
        read"%151%10@"])
  fun op repeatM'_def x = x
    val op repeatM'_def =
    DT(((("error",28),
        [("bool",[15,57,128]),("combin",[19]),("error",[25,26]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%67%47%87%20%77%19%109%178$1@$2@$0@@%129%112$1@%102@@%182%96%137@$2@@@%166$0$2@@%147%39%48%167%178%100$3@%140%124%153@@@@$0@$2@@%148%50%47%182%96%130$3@$1@@$0@@||@@||@@@@|@|@|@",
        read"%67%47%77%19%87%20%67%48%115%185%112$1@%102@@@%10%98%100$1@%140%124%153@@@@%92$0@$2@@@%98$1@%92$3@$2@@@@|@|@|@|@",
        read"%151%10@"])
  fun op mapM'_ind x = x
    val op mapM'_ind =
    DT(((("error",31),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%80%5%115%76%31%85%64%71%17%115%67%62%85%65%115%110$3@%131$1@$0@@@$5$4@$0@%165$2@%51%163$5$2@@%38%181%130$0@$1@@|@|@@@|@|@@$3$2@$1@$0@@|@|@|@@%76%53%85%58%71%59$3$2@$1@$0@|@|@|@@|@",
        read"%71%17%76%31%85%64%67%62%85%65%115%110$2@%131$1@$0@@@%9%95$3@%97$0@%165$4@%51%163$4$2@@%38%181%130$0@$1@@|@|@@@@%95$3@%97$2@$4@@@@|@|@|@|@|@",
        read"%150%9@"])
  fun op mapM'_def x = x
    val op mapM'_def =
    DT(((("error",32),
        [("bool",[15,57]),("combin",[19]),("error",[29,30]),("list",[11]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%85%64%76%31%71%17%108%176$1@$2@$0@@%173$2@$0@%62%65%176$3@$0@%165$2@%51%163$4$2@@%38%181%130$0@$1@@|@|@@||@@|@|@|@",
        read"%71%17%76%31%85%64%67%62%85%65%115%110$2@%131$1@$0@@@%9%95$3@%97$0@%165$4@%51%163$4$2@@%38%181%130$0@$1@@|@|@@@@%95$3@%97$2@$4@@@@|@|@|@|@|@",
        read"%150%9@"])
  fun op foldM_ind x = x
    val op foldM_ind =
    DT(((("error",36),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%79%4%115%73%29%66%22%85%64%115%67%62%85%65%66%43%115%110$3@%131$2@$1@@@$6$5@$0@$1@@|@|@|@@$3$2@$1@$0@@|@|@|@@%73%52%66%55%85%61$3$2@$1@$0@|@|@|@@|@",
        read"%66%22%73%29%85%64%67%62%85%65%66%43%115%110$3@%131$2@$1@@@%8%94$4@%90$0@$1@@@%94$4@%90$5@$3@@@@|@|@|@|@|@|@",
        read"%149%8@"])
  fun op foldM_def x = x
    val op foldM_def =
    DT(((("error",37),
        [("bool",[15,57]),("combin",[19]),("error",[34,35]),("list",[11]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%85%64%73%29%66%22%107%170$1@$0@$2@@%172$2@%180$0@@%62%65%162$3$2@$1@@%43%170$4@$0@$1@|@||@@|@|@|@",
        read"%66%22%73%29%85%64%67%62%85%65%66%43%115%110$3@%131$2@$1@@@%8%94$4@%90$0@$1@@@%94$4@%90$5@$3@@@@|@|@|@|@|@|@",
        read"%149%8@"])
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
   ("repeatM_def",repeatM_def,DB.Def), ("mapM_def",mapM_def,DB.Def),
   ("string_of_error_def",string_of_error_def,DB.Def),
   ("instance_Show_Show_Error_error_dict_def",
    instance_Show_Show_Error_error_dict_def,
    DB.Def), ("datatype_error",datatype_error,DB.Thm),
   ("error_11",error_11,DB.Thm), ("error_distinct",error_distinct,DB.Thm),
   ("error_case_cong",error_case_cong,DB.Thm),
   ("error_nchotomy",error_nchotomy,DB.Thm),
   ("error_Axiom",error_Axiom,DB.Thm),
   ("error_induction",error_induction,DB.Thm),
   ("repeatM''_ind",repeatM''_ind,DB.Thm),
   ("repeatM''_def",repeatM''_def,DB.Thm),
   ("repeatM'_ind",repeatM'_ind,DB.Thm),
   ("repeatM'_def",repeatM'_def,DB.Thm), ("mapM'_ind",mapM'_ind,DB.Thm),
   ("mapM'_def",mapM'_def,DB.Thm), ("foldM_ind",foldM_ind,DB.Thm),
   ("foldM_def",foldM_def,DB.Thm)]

  local open GrammarSpecials Parse
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
       ("repeatM''", (Term.prim_mk_const { Name = "repeatM''", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM''", (Term.prim_mk_const { Name = "repeatM''", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM", (Term.prim_mk_const { Name = "repeatM", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM", (Term.prim_mk_const { Name = "repeatM", Thy = "error"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM'", (Term.prim_mk_const { Name = "repeatM'", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeatM'", (Term.prim_mk_const { Name = "repeatM'", Thy = "error"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapM'", (Term.prim_mk_const { Name = "mapM'", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapM'", (Term.prim_mk_const { Name = "mapM'", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapM", (Term.prim_mk_const { Name = "mapM", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mapM", (Term.prim_mk_const { Name = "mapM", Thy = "error"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("foldM", (Term.prim_mk_const { Name = "foldM", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("foldM", (Term.prim_mk_const { Name = "foldM", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_error", (Term.prim_mk_const { Name = "string_of_error", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_error", (Term.prim_mk_const { Name = "string_of_error", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Error_error_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Error_error_dict", Thy = "error"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Error_error_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Error_error_dict", Thy = "error"}))
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
        "error.return_def error.string_of_error_def error.instance_Show_Show_Error_error_dict_def error.with_success_def error.mapM_def error.repeatM_def error.as_maybe_def error.error_bind_def error.fail0_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "error"
end
