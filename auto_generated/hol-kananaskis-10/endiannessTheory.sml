structure endiannessTheory :> endiannessTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading endiannessTheory ... " else ()
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
          ("endianness",
          Arbnum.fromString "1445005761",
          Arbnum.fromString "651913")
          [("show",
           Arbnum.fromString "1445005719",
           Arbnum.fromString "601226")];
  val _ = Theory.incorporate_types "endianness" [("endianness", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("endianness", "endianness"), ID("num", "num"),
   ID("min", "bool"), ID("bool", "!"), ID("bool", "/\\"), ID("num", "0"),
   ID("prim_rec", "<"), ID("min", "="), ID("min", "==>"), ID("bool", "?"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("endianness", "Big"), ID("bool", "COND"), ID("bool", "DATATYPE"),
   ID("endianness", "Little"), ID("arithmetic", "NUMERAL"),
   ID("bool", "TYPE_DEFINITION"), ID("arithmetic", "ZERO"),
   ID("bool", "\\/"), ID("endianness", "default_endianness"),
   ID("endianness", "endianness2num"), ID("endianness", "endianness_CASE"),
   ID("endianness", "endianness_size"), ID("endianness", "num2endianness"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [2], TYOP [0, 1, 0], TYOP [0, 0, 1], TYV "'a",
   TYOP [0, 4, 4], TYOP [0, 4, 5], TYOP [0, 0, 6], TYOP [3],
   TYOP [0, 0, 8], TYOP [0, 0, 9], TYOP [0, 0, 4], TYOP [0, 4, 8],
   TYOP [0, 12, 8], TYOP [0, 9, 8], TYOP [0, 14, 8], TYOP [0, 1, 8],
   TYOP [0, 16, 8], TYOP [0, 8, 8], TYOP [0, 8, 18], TYOP [0, 1, 16],
   TYOP [0, 4, 12], TYOP [0, 11, 8], TYOP [0, 22, 8], TYOP [0, 3, 8],
   TYOP [0, 24, 8], TYOP [0, 1, 1], TYOP [0, 8, 6], TYOP [0, 16, 24]]
  end
  val _ = Theory.incorporate_consts "endianness" tyvector
     [("num2endianness", 2), ("endianness_size", 3),
      ("endianness_CASE", 7), ("endianness2num", 3),
      ("default_endianness", 0), ("Little", 0), ("Big", 0)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 0), TMV("M'", 0), TMV("P", 9), TMV("a", 0), TMV("a'", 0),
   TMV("endianness", 10), TMV("f", 11), TMV("m", 1), TMV("n", 1),
   TMV("r", 1), TMV("r'", 1), TMV("rep", 3), TMV("v0", 4), TMV("v0'", 4),
   TMV("v1", 4), TMV("v1'", 4), TMV("x", 0), TMV("x0", 4), TMV("x1", 4),
   TMC(4, 13), TMC(4, 14), TMC(4, 15), TMC(4, 17), TMC(5, 19), TMC(6, 1),
   TMC(7, 20), TMC(8, 21), TMC(8, 19), TMC(8, 10), TMC(8, 20), TMC(9, 19),
   TMC(10, 14), TMC(10, 23), TMC(10, 25), TMC(10, 17), TMC(11, 26),
   TMC(12, 26), TMC(13, 0), TMC(14, 27), TMC(15, 18), TMC(16, 0),
   TMC(17, 26), TMC(18, 28), TMC(19, 1), TMC(20, 19), TMC(21, 0),
   TMC(22, 3), TMC(23, 7), TMC(24, 3), TMC(25, 2), TMC(26, 18)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op endianness_TY_DEF x = x
    val op endianness_TY_DEF =
    DT(((("endianness",0),[("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%33%11%42%8%25$0@%41%36%43@@@|@$0@|@"])
  fun op endianness_BIJ x = x
    val op endianness_BIJ =
    DT(((("endianness",1),
        [("bool",[117]),("endianness",[0])]),["DISK_THM"]),
       [read"%23%20%3%28%49%46$0@@@$0@|@@%22%9%27%8%25$0@%41%36%43@@@|$0@@%29%46%49$0@@@$0@@|@@"])


  fun op endianness_size_def x = x
    val op endianness_size_def =
    DT(((("endianness",13),[]),[]), [read"%20%16%29%48$0@@%24@|@"])
  fun op endianness_CASE x = x
    val op endianness_CASE =
    DT(((("endianness",14),[]),[]),
       [read"%20%16%19%12%19%14%26%47$2@$1@$0@@%7%38%29$0@%24@@$2@$1@|%46$2@@@|@|@|@"])
  fun op default_endianness_def x = x
    val op default_endianness_def =
    DT(((("endianness",22),[]),[]), [read"%28%45@%40@"])
  fun op num2endianness_endianness2num x = x
    val op num2endianness_endianness2num =
    DT(((("endianness",2),[("endianness",[1])]),["DISK_THM"]),
       [read"%20%3%28%49%46$0@@@$0@|@"])
  fun op endianness2num_num2endianness x = x
    val op endianness2num_num2endianness =
    DT(((("endianness",3),[("endianness",[1])]),["DISK_THM"]),
       [read"%22%9%27%25$0@%41%36%43@@@@%29%46%49$0@@@$0@@|@"])
  fun op num2endianness_11 x = x
    val op num2endianness_11 =
    DT(((("endianness",4),
        [("bool",[26]),("endianness",[1])]),["DISK_THM"]),
       [read"%22%9%22%10%30%25$1@%41%36%43@@@@%30%25$0@%41%36%43@@@@%27%28%49$1@@%49$0@@@%29$1@$0@@@@|@|@"])
  fun op endianness2num_11 x = x
    val op endianness2num_11 =
    DT(((("endianness",5),
        [("bool",[26]),("endianness",[1])]),["DISK_THM"]),
       [read"%20%3%20%4%27%29%46$1@@%46$0@@@%28$1@$0@@|@|@"])
  fun op num2endianness_ONTO x = x
    val op num2endianness_ONTO =
    DT(((("endianness",6),
        [("bool",[25,63]),("endianness",[1])]),["DISK_THM"]),
       [read"%20%3%34%9%23%28$1@%49$0@@@%25$0@%41%36%43@@@@|@|@"])
  fun op endianness2num_ONTO x = x
    val op endianness2num_ONTO =
    DT(((("endianness",7),
        [("bool",[26]),("endianness",[1])]),["DISK_THM"]),
       [read"%22%9%27%25$0@%41%36%43@@@@%31%3%29$1@%46$0@@|@@|@"])
  fun op num2endianness_thm x = x
    val op num2endianness_thm =
    DT(((("endianness",10),[("endianness",[8,9])]),[]),
       [read"%23%28%49%24@@%37@@%28%49%41%35%43@@@@%40@@"])
  fun op endianness2num_thm x = x
    val op endianness2num_thm =
    DT(((("endianness",11),
        [("bool",[25,54]),("endianness",[3,8,9]),
         ("numeral",[3,7])]),["DISK_THM"]),
       [read"%23%29%46%37@@%24@@%29%46%40@@%41%35%43@@@@"])
  fun op endianness_EQ_endianness x = x
    val op endianness_EQ_endianness =
    DT(((("endianness",12),
        [("bool",[58]),("endianness",[5])]),["DISK_THM"]),
       [read"%20%3%20%4%27%28$1@$0@@%29%46$1@@%46$0@@@|@|@"])
  fun op endianness_case_def x = x
    val op endianness_case_def =
    DT(((("endianness",15),
        [("bool",[56,64]),("endianness",[11,14]),
         ("numeral",[3,6])]),["DISK_THM"]),
       [read"%23%19%12%19%14%26%47%37@$1@$0@@$1@|@|@@%19%12%19%14%26%47%40@$1@$0@@$0@|@|@@"])
  fun op datatype_endianness x = x
    val op datatype_endianness =
    DT(((("endianness",16),[("bool",[25,171])]),["DISK_THM"]),
       [read"%39%5%37@%40@@"])
  fun op endianness_distinct x = x
    val op endianness_distinct =
    DT(((("endianness",17),
        [("endianness",[11,12]),("numeral",[3,6])]),["DISK_THM"]),
       [read"%50%28%37@%40@@"])
  fun op endianness_case_cong x = x
    val op endianness_case_cong =
    DT(((("endianness",18),
        [("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,63,64,93,96,104,105,107]),
         ("endianness",[6,8,9,15]),("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%20%0%20%1%19%12%19%14%30%23%28$3@$2@@%23%30%28$2@%37@@%26$1@%13@@@%30%28$2@%40@@%26$0@%15@@@@@%26%47$3@$1@$0@@%47$2@%13@%15@@@|@|@|@|@"])
  fun op endianness_nchotomy x = x
    val op endianness_nchotomy =
    DT(((("endianness",19),
        [("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,63,64,93,96,104,105,107]),
         ("endianness",[6,8,9]),("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%20%3%44%28$0@%37@@%28$0@%40@@|@"])
  fun op endianness_Axiom x = x
    val op endianness_Axiom =
    DT(((("endianness",20),
        [("bool",[8,14,25,56,64]),("endianness",[11]),
         ("numeral",[3,8])]),["DISK_THM"]),
       [read"%19%17%19%18%32%6%23%26$0%37@@$2@@%26$0%40@@$1@@|@|@|@"])
  fun op endianness_induction x = x
    val op endianness_induction =
    DT(((("endianness",21),
        [("arithmetic",
         [24,25,27,41,46,59,73,95,173,174,177,178,181,200,206]),
         ("bool",[8,14,25,32,36,43,51,52,54,63,64,93,96,104,105,107]),
         ("endianness",[6,8,9]),("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%21%2%30%23$0%37@@$0%40@@@%20%3$1$0@|@@|@"])
  end
  val _ = DB.bindl "endianness"
  [("endianness_TY_DEF",endianness_TY_DEF,DB.Def),
   ("endianness_BIJ",endianness_BIJ,DB.Def),
   ("endianness_size_def",endianness_size_def,DB.Def),
   ("endianness_CASE",endianness_CASE,DB.Def),
   ("default_endianness_def",default_endianness_def,DB.Def),
   ("num2endianness_endianness2num",num2endianness_endianness2num,DB.Thm),
   ("endianness2num_num2endianness",endianness2num_num2endianness,DB.Thm),
   ("num2endianness_11",num2endianness_11,DB.Thm),
   ("endianness2num_11",endianness2num_11,DB.Thm),
   ("num2endianness_ONTO",num2endianness_ONTO,DB.Thm),
   ("endianness2num_ONTO",endianness2num_ONTO,DB.Thm),
   ("num2endianness_thm",num2endianness_thm,DB.Thm),
   ("endianness2num_thm",endianness2num_thm,DB.Thm),
   ("endianness_EQ_endianness",endianness_EQ_endianness,DB.Thm),
   ("endianness_case_def",endianness_case_def,DB.Thm),
   ("datatype_endianness",datatype_endianness,DB.Thm),
   ("endianness_distinct",endianness_distinct,DB.Thm),
   ("endianness_case_cong",endianness_case_cong,DB.Thm),
   ("endianness_nchotomy",endianness_nchotomy,DB.Thm),
   ("endianness_Axiom",endianness_Axiom,DB.Thm),
   ("endianness_induction",endianness_induction,DB.Thm)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("showTheory.show_grammars",
                          showTheory.show_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms temp_add_type "endianness"
  val _ = update_grms temp_add_type "endianness"
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("endianness2num", (Term.prim_mk_const { Name = "endianness2num", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("num2endianness", (Term.prim_mk_const { Name = "num2endianness", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Big", (Term.prim_mk_const { Name = "Big", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Big", (Term.prim_mk_const { Name = "Big", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Little", (Term.prim_mk_const { Name = "Little", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Little", (Term.prim_mk_const { Name = "Little", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("endianness_size", (Term.prim_mk_const { Name = "endianness_size", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("endianness_size", (Term.prim_mk_const { Name = "endianness_size", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("endianness_CASE", (Term.prim_mk_const { Name = "endianness_CASE", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("endianness_CASE", (Term.prim_mk_const { Name = "endianness_CASE", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("default_endianness", (Term.prim_mk_const { Name = "default_endianness", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("default_endianness", (Term.prim_mk_const { Name = "default_endianness", Thy = "endianness"}))
  val endianness_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG endianness_Axiom,
           case_def=endianness_case_def,
           case_cong=endianness_case_cong,
           induction=ORIG endianness_induction,
           nchotomy=endianness_nchotomy,
           size=SOME(Parse.Term`(endianness$endianness_size) :(endianness$endianness) -> (num$num)`,
                     ORIG endianness_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=SOME endianness_distinct,
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
    thy = "endianness",
    thydataty = "compute",
    data = "endianness.default_endianness_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "endianness"
end
