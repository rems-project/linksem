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
          Arbnum.fromString "1471275034",
          Arbnum.fromString "559266")
          [("show",
           Arbnum.fromString "1471275022",
           Arbnum.fromString "917651")];
  val _ = Theory.incorporate_types "error" [("error", 1)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("error", "error"), ID("pair", "prod"),
   ID("list", "list"), ID("num", "num"), ID("string", "char"),
   ID("option", "option"), ID("min", "bool"), ID("ind_type", "recspace"),
   ID("bool", "!"), ID("arithmetic", "+"), ID("pair", ","),
   ID("arithmetic", "-"), ID("bool", "/\\"), ID("num", "0"),
   ID("min", "="), ID("min", "==>"), ID("bool", "?"), ID("bool", "ARB"),
   ID("arithmetic", "BIT1"), ID("ind_type", "BOTTOM"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("error", "Fail"), ID("list", "NIL"), ID("option", "NONE"),
   ID("arithmetic", "NUMERAL"), ID("option", "SOME"), ID("num", "SUC"),
   ID("error", "Success"), ID("bool", "TYPE_DEFINITION"),
   ID("pair", "UNCURRY"), ID("relation", "WF"), ID("arithmetic", "ZERO"),
   ID("bool", "\\/"), ID("error", "as_maybe"), ID("string", "char_size"),
   ID("error", "error_CASE"), ID("error", "error_bind"),
   ID("error", "error_size"), ID("error", "fail0"), ID("error", "foldM"),
   ID("list", "list_CASE"), ID("list", "list_size"), ID("error", "mapM"),
   ID("error", "repeatM"), ID("error", "repeatM'"), ID("error", "return"),
   ID("error", "with_success"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'a", TYV "'b", TYOP [0, 1, 0], TYOP [0, 2, 0], TYOP [0, 0, 3],
   TYOP [1, 1], TYOP [0, 5, 4], TYOP [1, 0], TYOP [0, 0, 7], TYOP [3, 0],
   TYOP [2, 9, 1], TYOP [1, 10], TYOP [2, 0, 1], TYOP [1, 12],
   TYOP [0, 1, 13], TYOP [0, 14, 11], TYOP [0, 1, 15], TYOP [4],
   TYOP [0, 17, 16], TYOP [1, 9], TYOP [0, 7, 19], TYOP [0, 17, 20],
   TYOP [3, 1], TYOP [0, 22, 19], TYOP [0, 1, 7], TYOP [0, 24, 23],
   TYOP [0, 22, 7], TYOP [0, 0, 26], TYOP [0, 0, 24], TYOP [0, 28, 27],
   TYOP [5], TYOP [3, 30], TYOP [0, 31, 7], TYOP [0, 7, 17],
   TYOP [0, 0, 17], TYOP [0, 34, 33], TYOP [0, 24, 7], TYOP [0, 5, 36],
   TYOP [0, 31, 1], TYOP [0, 38, 1], TYOP [0, 0, 1], TYOP [0, 40, 39],
   TYOP [0, 7, 41], TYOP [6, 0], TYOP [0, 7, 43], TYOP [7],
   TYOP [2, 0, 31], TYOP [8, 46], TYOP [0, 47, 45], TYOP [0, 7, 45],
   TYOP [0, 22, 45], TYOP [0, 0, 50], TYOP [0, 28, 51], TYOP [0, 24, 50],
   TYOP [0, 14, 45], TYOP [0, 1, 54], TYOP [0, 17, 55], TYOP [0, 17, 49],
   TYOP [2, 0, 22], TYOP [2, 28, 58], TYOP [0, 59, 45], TYOP [0, 59, 60],
   TYOP [2, 24, 22], TYOP [0, 62, 45], TYOP [0, 62, 63], TYOP [2, 17, 7],
   TYOP [0, 65, 45], TYOP [0, 65, 66], TYOP [2, 1, 14], TYOP [2, 17, 68],
   TYOP [0, 69, 45], TYOP [0, 69, 70], TYOP [0, 32, 45], TYOP [0, 8, 72],
   TYOP [0, 7, 1], TYOP [0, 7, 47], TYOP [0, 0, 45], TYOP [0, 76, 45],
   TYOP [0, 1, 45], TYOP [0, 78, 45], TYOP [0, 49, 45], TYOP [0, 5, 45],
   TYOP [0, 81, 45], TYOP [0, 40, 45], TYOP [0, 83, 45], TYOP [0, 28, 45],
   TYOP [0, 85, 45], TYOP [0, 34, 45], TYOP [0, 87, 45], TYOP [0, 2, 45],
   TYOP [0, 89, 45], TYOP [0, 24, 45], TYOP [0, 91, 45], TYOP [0, 54, 45],
   TYOP [0, 80, 45], TYOP [0, 52, 45], TYOP [0, 95, 45], TYOP [0, 53, 45],
   TYOP [0, 97, 45], TYOP [0, 38, 45], TYOP [0, 99, 45], TYOP [0, 56, 45],
   TYOP [0, 101, 45], TYOP [0, 57, 45], TYOP [0, 103, 45],
   TYOP [0, 48, 45], TYOP [0, 105, 45], TYOP [0, 50, 45], TYOP [0, 31, 45],
   TYOP [0, 108, 45], TYOP [0, 17, 45], TYOP [0, 110, 45],
   TYOP [0, 17, 17], TYOP [0, 17, 112], TYOP [0, 22, 58], TYOP [0, 0, 114],
   TYOP [0, 31, 46], TYOP [0, 0, 116], TYOP [0, 14, 68], TYOP [0, 1, 118],
   TYOP [0, 58, 59], TYOP [0, 28, 120], TYOP [0, 22, 62],
   TYOP [0, 24, 122], TYOP [0, 1, 10], TYOP [0, 9, 124], TYOP [0, 7, 65],
   TYOP [0, 17, 126], TYOP [0, 68, 69], TYOP [0, 17, 128],
   TYOP [0, 45, 45], TYOP [0, 45, 130], TYOP [0, 0, 76], TYOP [0, 1, 78],
   TYOP [0, 7, 49], TYOP [0, 19, 45], TYOP [0, 19, 135], TYOP [0, 11, 45],
   TYOP [0, 11, 137], TYOP [0, 22, 50], TYOP [0, 31, 108],
   TYOP [0, 17, 110], TYOP [0, 43, 45], TYOP [0, 43, 142],
   TYOP [0, 47, 48], TYOP [0, 74, 45], TYOP [0, 145, 45], TYOP [0, 75, 45],
   TYOP [0, 147, 45], TYOP [0, 19, 19], TYOP [0, 19, 149],
   TYOP [0, 45, 150], TYOP [0, 11, 11], TYOP [0, 11, 152],
   TYOP [0, 45, 153], TYOP [0, 9, 9], TYOP [0, 0, 155], TYOP [0, 22, 22],
   TYOP [0, 1, 157], TYOP [0, 17, 47], TYOP [0, 159, 47],
   TYOP [0, 46, 160], TYOP [0, 17, 161], TYOP [0, 0, 43],
   TYOP [0, 48, 147], TYOP [0, 12, 11], TYOP [0, 1, 11], TYOP [0, 0, 166],
   TYOP [0, 167, 165], TYOP [0, 10, 11], TYOP [0, 9, 166],
   TYOP [0, 170, 169], TYOP [0, 61, 45], TYOP [0, 64, 45],
   TYOP [0, 67, 45], TYOP [0, 71, 45], TYOP [0, 30, 17], TYOP [0, 31, 43],
   TYOP [0, 177, 43], TYOP [0, 163, 178], TYOP [0, 7, 179],
   TYOP [0, 31, 0], TYOP [0, 181, 0], TYOP [0, 2, 182], TYOP [0, 5, 183],
   TYOP [0, 32, 7], TYOP [0, 24, 185], TYOP [0, 5, 186], TYOP [0, 8, 7],
   TYOP [0, 7, 188], TYOP [0, 0, 19], TYOP [0, 190, 19], TYOP [0, 7, 191],
   TYOP [0, 9, 19], TYOP [0, 193, 19], TYOP [0, 19, 194],
   TYOP [0, 165, 11], TYOP [0, 13, 196], TYOP [0, 169, 11],
   TYOP [0, 11, 198], TYOP [0, 1, 26], TYOP [0, 200, 7], TYOP [0, 7, 201],
   TYOP [0, 22, 202], TYOP [0, 1, 23], TYOP [0, 204, 19],
   TYOP [0, 19, 205], TYOP [0, 22, 206], TYOP [0, 31, 17],
   TYOP [0, 176, 208]]
  end
  val _ = Theory.incorporate_consts "error" tyvector
     [("with_success", 6), ("return", 8), ("repeatM'", 18),
      ("repeatM", 21), ("mapM", 25), ("foldM", 29), ("fail0", 32),
      ("error_size", 35), ("error_bind", 37), ("error_CASE", 42),
      ("as_maybe", 44), ("Success", 8), ("Fail", 32)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'error'", 48), TMV("M", 7), TMV("M'", 7), TMV("P", 49),
   TMV("P", 52), TMV("P", 53), TMV("P", 56), TMV("P", 57), TMV("R", 61),
   TMV("R", 64), TMV("R", 67), TMV("R", 71), TMV("a", 0), TMV("a", 31),
   TMV("a'", 0), TMV("a'", 31), TMV("a0", 47), TMV("action", 7),
   TMV("action", 14), TMV("count1", 17), TMV("e", 0), TMV("e", 7),
   TMV("ee", 7), TMV("err", 5), TMV("err", 31), TMV("error", 73),
   TMV("f", 40), TMV("f", 28), TMV("f", 34), TMV("f", 24), TMV("f'", 40),
   TMV("f0", 40), TMV("f1", 38), TMV("f1'", 38), TMV("fl", 0),
   TMV("fn", 74), TMV("hd", 0), TMV("head", 0), TMV("n", 17), TMV("r", 0),
   TMV("rep", 75), TMV("res", 0), TMV("s", 0), TMV("s", 1), TMV("s", 31),
   TMV("seed", 1), TMV("seed'", 1), TMV("suc", 2), TMV("tail", 9),
   TMV("tl", 9), TMV("v", 28), TMV("v", 24), TMV("v", 17), TMV("v1", 0),
   TMV("v1", 1), TMV("v1", 7), TMV("v1", 22), TMV("v2", 14), TMV("v2", 22),
   TMV("x", 1), TMV("x", 5), TMV("xs", 22), TMV("xs'", 22), TMC(9, 77),
   TMC(9, 79), TMC(9, 80), TMC(9, 82), TMC(9, 84), TMC(9, 86), TMC(9, 88),
   TMC(9, 90), TMC(9, 92), TMC(9, 93), TMC(9, 94), TMC(9, 96), TMC(9, 98),
   TMC(9, 100), TMC(9, 102), TMC(9, 104), TMC(9, 106), TMC(9, 107),
   TMC(9, 109), TMC(9, 111), TMC(9, 105), TMC(10, 113), TMC(11, 115),
   TMC(11, 117), TMC(11, 119), TMC(11, 121), TMC(11, 123), TMC(11, 125),
   TMC(11, 127), TMC(11, 129), TMC(12, 113), TMC(13, 131), TMC(14, 17),
   TMC(15, 132), TMC(15, 133), TMC(15, 131), TMC(15, 134), TMC(15, 136),
   TMC(15, 138), TMC(15, 139), TMC(15, 140), TMC(15, 141), TMC(15, 143),
   TMC(15, 144), TMC(16, 131), TMC(17, 77), TMC(17, 146), TMC(17, 148),
   TMC(17, 109), TMC(18, 0), TMC(18, 31), TMC(19, 112), TMC(20, 47),
   TMC(21, 151), TMC(21, 154), TMC(22, 156), TMC(22, 158), TMC(23, 162),
   TMC(24, 130), TMC(25, 32), TMC(26, 9), TMC(27, 43), TMC(28, 112),
   TMC(29, 163), TMC(30, 112), TMC(31, 8), TMC(32, 164), TMC(33, 168),
   TMC(33, 171), TMC(34, 172), TMC(34, 173), TMC(34, 174), TMC(34, 175),
   TMC(35, 17), TMC(36, 131), TMC(37, 44), TMC(38, 176), TMC(39, 42),
   TMC(39, 180), TMC(39, 184), TMC(39, 187), TMC(40, 189), TMC(40, 192),
   TMC(40, 37), TMC(40, 195), TMC(40, 197), TMC(40, 199), TMC(41, 35),
   TMC(42, 32), TMC(43, 29), TMC(44, 203), TMC(44, 207), TMC(45, 209),
   TMC(46, 25), TMC(47, 21), TMC(48, 18), TMC(49, 8), TMC(49, 193),
   TMC(49, 169), TMC(50, 6), TMC(51, 130)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op error_TY_DEF x = x
    val op error_TY_DEF =
    DT(((("error",0),[("bool",[26])]),["DISK_THM"]),
       [read"%110%40%129%16%79%0%107%83%16%107%137%108%12%106$1@%12%120%95@%86$0@%113@@%38%115|@|$0@@|@@%111%13%106$1@%13%120%127%95@@%86%112@$0@@%38%115|@|$0@@|@@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op error_case_def x = x
    val op error_case_def =
    DT(((("error",6),
        [("bool",[26,180]),("error",[1,2,3,4,5]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%94%63%12%67%26%76%32%97%140%128$2@@$1@$0@@$1$2@@|@|@|@@%81%13%67%26%76%32%97%140%122$2@@$1@$0@@$0$2@@|@|@|@@"])
  fun op error_size_def x = x
    val op error_size_def =
    DT(((("error",7),
        [("bool",[26,180]),("error",[1,2,3,4,5]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%94%69%28%63%12%104%150$1@%128$0@@@%84%125%114%136@@@$1$0@@@|@|@@%69%28%81%13%104%150$1@%122$0@@@%84%125%114%136@@@%155%139@$0@@@|@|@@"])
  fun op return_def x = x
    val op return_def =
    DT(((("error",15),[]),[]), [read"%63%39%99%159$0@@%128$0@@|@"])
  fun op with_success_def x = x
    val op with_success_def =
    DT(((("error",16),[]),[]),
       [read"%66%23%63%34%70%47%96%162$2@$1@$0@@%142$2@%43$1$0@|@%24$2|@@|@|@|@"])
  fun op fail0_def x = x
    val op fail0_def =
    DT(((("error",17),[]),[]), [read"%81%24%99%151$0@@%122$0@@|@"])
  fun op error_bind_def x = x
    val op error_bind_def =
    DT(((("error",18),[]),[]),
       [read"%66%60%71%29%99%146$1@$0@@%143$1@%43$1$0@|@%24%122$0@|@@|@|@"])
  fun op as_maybe_def x = x
    val op as_maybe_def =
    DT(((("error",19),[]),[]),
       [read"%65%21%105%138$0@@%141$0@%42%126$0@|@%24%124|@@|@"])
  fun op datatype_error x = x
    val op datatype_error =
    DT(((("error",8),[("bool",[25,170])]),["DISK_THM"]),
       [read"%121%25%128@%122@@"])
  fun op error_11 x = x
    val op error_11 =
    DT(((("error",9),
        [("bool",[26,55,62,180]),("error",[1,2,3,4,5]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%94%63%12%63%14%98%99%128$1@@%128$0@@@%96$1@$0@@|@|@@%81%13%81%15%98%99%122$1@@%122$0@@@%103$1@$0@@|@|@@"])
  fun op error_distinct x = x
    val op error_distinct =
    DT(((("error",10),
        [("bool",[25,26,46,53,62,180]),("error",[1,2,3,4,5]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%81%15%63%12%163%99%128$0@@%122$1@@@|@|@"])
  fun op error_case_cong x = x
    val op error_case_cong =
    DT(((("error",11),
        [("bool",[26,180]),("error",[1,2,3,4,5,6])]),["DISK_THM"]),
       [read"%65%1%65%2%67%26%76%32%107%94%99$3@$2@@%94%63%12%107%99$3@%128$0@@@%97$2$0@@%30$0@@@|@@%81%13%107%99$3@%122$0@@@%97$1$0@@%33$0@@@|@@@@%97%140$3@$1@$0@@%140$2@%30@%33@@@|@|@|@|@"])
  fun op error_nchotomy x = x
    val op error_nchotomy =
    DT(((("error",12),
        [("bool",[26,180]),("error",[1,2,3,4,5])]),["DISK_THM"]),
       [read"%65%22%137%108%12%99$1@%128$0@@|@@%111%44%99$1@%122$0@@|@@|@"])
  fun op error_Axiom x = x
    val op error_Axiom =
    DT(((("error",13),
        [("bool",[26,180]),("error",[1,2,3,4,5]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%67%31%76%32%109%35%94%63%12%97$1%128$0@@@$3$0@@|@@%81%13%97$1%122$0@@@$2$0@@|@@|@|@|@"])
  fun op error_induction x = x
    val op error_induction =
    DT(((("error",14),[("bool",[26]),("error",[1,2,3,4,5])]),["DISK_THM"]),
       [read"%73%3%107%94%63%12$1%128$0@@|@@%81%44$1%122$0@@|@@@%65%21$1$0@|@@|@"])
  fun op repeatM_ind x = x
    val op repeatM_ind =
    DT(((("error",22),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%78%7%107%82%19%65%17%107%107%163%104$1@%95@@@$2%93$1@%125%114%136@@@@$0@@@$2$1@$0@@|@|@@%82%52%65%55$2$1@$0@|@|@@|@",
        read"%65%17%82%19%107%163%104$0@%95@@@%10%91%93$0@%125%114%136@@@@$1@@%91$0@$1@@@|@|@",
        read"%134%10@"])
  fun op repeatM_def x = x
    val op repeatM_def =
    DT(((("error",23),
        [("bool",[15,57,128]),("combin",[19]),("error",[20,21]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%82%19%65%17%100%157$1@$0@@%116%104$1@%95@@%160%123@@%145$0@%37%147%157%93$2@%125%114%136@@@@$1@@%48%160%118$1@$0@@|@|@@@|@|@",
        read"%65%17%82%19%107%163%104$0@%95@@@%10%91%93$0@%125%114%136@@@@$1@@%91$0@$1@@@|@|@",
        read"%134%10@"])
  fun op repeatM'_ind x = x
    val op repeatM'_ind =
    DT(((("error",26),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%77%6%107%82%19%64%45%72%18%107%64%46%107%163%104$3@%95@@@$4%93$3@%125%114%136@@@@$0@$1@@|@@$3$2@$1@$0@@|@|@|@@%82%52%64%54%72%57$3$2@$1@$0@|@|@|@@|@",
        read"%64%45%72%18%82%19%64%46%107%163%104$1@%95@@@%11%92%93$1@%125%114%136@@@@%87$0@$2@@@%92$1@%87$3@$2@@@@|@|@|@|@",
        read"%135%11@"])
  fun op repeatM'_def x = x
    val op repeatM'_def =
    DT(((("error",27),
        [("bool",[15,57,128]),("combin",[19]),("error",[24,25]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%64%45%82%19%72%18%101%158$1@$2@$0@@%117%104$1@%95@@%161%90%123@$2@@@%148$0$2@@%130%37%46%149%158%93$3@%125%114%136@@@@$0@$2@@%131%48%45%161%90%118$3@$1@@$0@@||@@||@@@@|@|@|@",
        read"%64%45%72%18%82%19%64%46%107%163%104$1@%95@@@%11%92%93$1@%125%114%136@@@@%87$0@$2@@@%92$1@%87$3@$2@@@@|@|@|@|@",
        read"%135%11@"])
  fun op mapM_ind x = x
    val op mapM_ind =
    DT(((("error",30),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%75%5%107%71%29%80%61%107%64%59%80%62%107%102$2@%119$1@$0@@@$4$3@$0@@|@|@@$2$1@$0@@|@|@@%71%51%80%56$2$1@$0@|@|@@|@",
        read"%71%29%80%61%64%59%80%62%107%102$2@%119$1@$0@@@%9%89$3@$0@@%89$3@$2@@@|@|@|@|@",
        read"%133%9@"])
  fun op mapM_def x = x
    val op mapM_def =
    DT(((("error",31),
        [("bool",[15,57]),("combin",[19]),("error",[28,29]),("list",[11]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%80%61%71%29%100%156$0@$1@@%154$1@%160%123@@%59%62%145$2$1@@%36%147%156$3@$1@@%49%160%118$1@$0@@|@|@||@@|@|@",
        read"%71%29%80%61%64%59%80%62%107%102$2@%119$1@$0@@@%9%89$3@$0@@%89$3@$2@@@|@|@|@|@",
        read"%133%9@"])
  fun op foldM_ind x = x
    val op foldM_ind =
    DT(((("error",34),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%74%4%107%68%27%63%20%80%61%107%64%59%80%62%63%41%107%102$3@%119$2@$1@@@$6$5@$0@$1@@|@|@|@@$3$2@$1@$0@@|@|@|@@%68%50%63%53%80%58$3$2@$1@$0@|@|@|@@|@",
        read"%63%20%68%27%80%61%64%59%80%62%63%41%107%102$3@%119$2@$1@@@%8%88$4@%85$0@$1@@@%88$4@%85$5@$3@@@@|@|@|@|@|@|@",
        read"%132%8@"])
  fun op foldM_def x = x
    val op foldM_def =
    DT(((("error",35),
        [("bool",[15,57]),("combin",[19]),("error",[32,33]),("list",[11]),
         ("pair",[49]),("relation",[121,126])]),["DISK_THM"]),
       [read"%80%61%68%27%63%20%99%152$1@$0@$2@@%153$2@%159$0@@%59%62%144$3$2@$1@@%41%152$4@$0@$1@|@||@@|@|@|@",
        read"%63%20%68%27%80%61%64%59%80%62%63%41%107%102$3@%119$2@$1@@@%8%88$4@%85$0@$1@@@%88$4@%85$5@$3@@@@|@|@|@|@|@|@",
        read"%132%8@"])
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
