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
          Arbnum.fromString "1471355107",
          Arbnum.fromString "587994")
          [("show",
           Arbnum.fromString "1471355094",
           Arbnum.fromString "275066")];
  val _ = Theory.incorporate_types "endianness" [("endianness", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("list", "list"), ID("string", "char"),
   ID("endianness", "endianness"), ID("num", "num"),
   ID("show", "Show_class"), ID("min", "bool"), ID("bool", "!"),
   ID("bool", "/\\"), ID("num", "0"), ID("prim_rec", "<"), ID("min", "="),
   ID("min", "==>"), ID("bool", "?"), ID("bool", "ARB"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("endianness", "Big"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("bool", "DATATYPE"), ID("combin", "K"),
   ID("endianness", "Little"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"), ID("show", "Show_class_show_method_fupd"),
   ID("bool", "TYPE_DEFINITION"), ID("arithmetic", "ZERO"),
   ID("bool", "\\/"), ID("endianness", "default_endianness"),
   ID("endianness", "endianness2num"), ID("endianness", "endianness_CASE"),
   ID("endianness", "endianness_size"),
   ID("endianness", "instance_Show_Show_Endianness_endianness_dict"),
   ID("endianness", "num2endianness"),
   ID("endianness", "string_of_endianness"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [2], TYOP [1, 0], TYOP [3], TYOP [0, 2, 1], TYOP [4],
   TYOP [0, 4, 2], TYOP [5, 2], TYOP [0, 2, 4], TYV "'a", TYOP [0, 8, 8],
   TYOP [0, 8, 9], TYOP [0, 2, 10], TYOP [6], TYOP [0, 2, 12],
   TYOP [0, 2, 13], TYOP [0, 2, 8], TYOP [0, 8, 12], TYOP [0, 16, 12],
   TYOP [0, 13, 12], TYOP [0, 18, 12], TYOP [0, 4, 12], TYOP [0, 20, 12],
   TYOP [0, 12, 12], TYOP [0, 12, 22], TYOP [0, 4, 20], TYOP [0, 8, 16],
   TYOP [0, 6, 12], TYOP [0, 6, 26], TYOP [0, 1, 12], TYOP [0, 1, 28],
   TYOP [0, 15, 12], TYOP [0, 30, 12], TYOP [0, 7, 12], TYOP [0, 32, 12],
   TYOP [0, 4, 4], TYOP [0, 4, 0], TYOP [0, 12, 10], TYOP [0, 1, 1],
   TYOP [0, 0, 37], TYOP [0, 3, 3], TYOP [0, 3, 39], TYOP [0, 6, 6],
   TYOP [0, 39, 41], TYOP [0, 20, 32], TYOP [0, 1, 37], TYOP [0, 2, 44]]
  end
  val _ = Theory.incorporate_consts "endianness" tyvector
     [("string_of_endianness", 3), ("num2endianness", 5),
      ("instance_Show_Show_Endianness_endianness_dict", 6),
      ("endianness_size", 7), ("endianness_CASE", 11),
      ("endianness2num", 7), ("default_endianness", 2), ("Little", 2),
      ("Big", 2)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 2), TMV("M'", 2), TMV("P", 13), TMV("a", 2), TMV("a'", 2),
   TMV("e", 2), TMV("endianness", 14), TMV("f", 15), TMV("m", 4),
   TMV("n", 4), TMV("r", 4), TMV("r'", 4), TMV("rep", 7), TMV("v0", 8),
   TMV("v0'", 8), TMV("v1", 8), TMV("v1'", 8), TMV("x", 2), TMV("x0", 8),
   TMV("x1", 8), TMC(7, 17), TMC(7, 18), TMC(7, 19), TMC(7, 21),
   TMC(8, 23), TMC(9, 4), TMC(10, 24), TMC(11, 25), TMC(11, 27),
   TMC(11, 23), TMC(11, 14), TMC(11, 29), TMC(11, 24), TMC(12, 23),
   TMC(13, 18), TMC(13, 31), TMC(13, 33), TMC(13, 21), TMC(14, 6),
   TMC(15, 34), TMC(16, 34), TMC(17, 2), TMC(18, 35), TMC(19, 36),
   TMC(20, 38), TMC(21, 22), TMC(22, 40), TMC(23, 2), TMC(24, 1),
   TMC(25, 34), TMC(26, 42), TMC(27, 43), TMC(28, 4), TMC(29, 23),
   TMC(30, 2), TMC(31, 7), TMC(32, 11), TMC(32, 45), TMC(33, 7),
   TMC(34, 6), TMC(35, 5), TMC(36, 3), TMC(37, 22)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op endianness_TY_DEF x = x
    val op endianness_TY_DEF =
    DT(((("endianness",0),[("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
       [read"%36%12%51%9%26$0@%49%40%52@@@|@$0@|@"])
  fun op endianness_BIJ x = x
    val op endianness_BIJ =
    DT(((("endianness",1),
        [("bool",[116]),("endianness",[0])]),["DISK_THM"]),
       [read"%24%21%3%30%60%55$0@@@$0@|@@%23%10%29%9%26$0@%49%40%52@@@|$0@@%32%55%60$0@@@$0@@|@@"])


  fun op endianness_size_def x = x
    val op endianness_size_def =
    DT(((("endianness",13),[]),[]), [read"%21%17%32%58$0@@%25@|@"])
  fun op endianness_CASE x = x
    val op endianness_CASE =
    DT(((("endianness",14),[]),[]),
       [read"%21%17%20%13%20%15%27%56$2@$1@$0@@%8%43%32$0@%25@@$2@$1@|%55$2@@@|@|@|@"])
  fun op default_endianness_def x = x
    val op default_endianness_def =
    DT(((("endianness",22),[]),[]), [read"%30%54@%47@"])
  fun op string_of_endianness_def x = x
    val op string_of_endianness_def =
    DT(((("endianness",23),[]),[]),
       [read"%21%5%31%61$0@@%57$0@%44%42%49%40%40%39%39%39%39%52@@@@@@@@@%44%42%49%39%40%39%40%39%40%52@@@@@@@@@%44%42%49%39%39%39%40%39%40%52@@@@@@@@@%48@@@@%44%42%49%40%39%40%40%39%39%52@@@@@@@@@%44%42%49%39%40%39%40%39%40%52@@@@@@@@@%44%42%49%40%39%40%39%40%40%52@@@@@@@@@%44%42%49%40%39%40%39%40%40%52@@@@@@@@@%44%42%49%40%39%40%40%39%40%52@@@@@@@@@%44%42%49%39%40%40%39%39%40%52@@@@@@@@@%48@@@@@@@@|@"])
  fun op instance_Show_Show_Endianness_endianness_dict_def x = x
    val op instance_Show_Show_Endianness_endianness_dict_def =
    DT(((("endianness",24),[]),[]), [read"%28%59@%50%46%61@@%38@@"])
  fun op num2endianness_endianness2num x = x
    val op num2endianness_endianness2num =
    DT(((("endianness",2),[("endianness",[1])]),["DISK_THM"]),
       [read"%21%3%30%60%55$0@@@$0@|@"])
  fun op endianness2num_num2endianness x = x
    val op endianness2num_num2endianness =
    DT(((("endianness",3),[("endianness",[1])]),["DISK_THM"]),
       [read"%23%10%29%26$0@%49%40%52@@@@%32%55%60$0@@@$0@@|@"])
  fun op num2endianness_11 x = x
    val op num2endianness_11 =
    DT(((("endianness",4),
        [("bool",[26]),("endianness",[1])]),["DISK_THM"]),
       [read"%23%10%23%11%33%26$1@%49%40%52@@@@%33%26$0@%49%40%52@@@@%29%30%60$1@@%60$0@@@%32$1@$0@@@@|@|@"])
  fun op endianness2num_11 x = x
    val op endianness2num_11 =
    DT(((("endianness",5),
        [("bool",[26]),("endianness",[1])]),["DISK_THM"]),
       [read"%21%3%21%4%29%32%55$1@@%55$0@@@%30$1@$0@@|@|@"])
  fun op num2endianness_ONTO x = x
    val op num2endianness_ONTO =
    DT(((("endianness",6),
        [("bool",[25,62]),("endianness",[1])]),["DISK_THM"]),
       [read"%21%3%37%10%24%30$1@%60$0@@@%26$0@%49%40%52@@@@|@|@"])
  fun op endianness2num_ONTO x = x
    val op endianness2num_ONTO =
    DT(((("endianness",7),
        [("bool",[26]),("endianness",[1])]),["DISK_THM"]),
       [read"%23%10%29%26$0@%49%40%52@@@@%34%3%32$1@%55$0@@|@@|@"])
  fun op num2endianness_thm x = x
    val op num2endianness_thm =
    DT(((("endianness",10),[("endianness",[8,9])]),[]),
       [read"%24%30%60%25@@%41@@%30%60%49%39%52@@@@%47@@"])
  fun op endianness2num_thm x = x
    val op endianness2num_thm =
    DT(((("endianness",11),
        [("bool",[25,53]),("endianness",[3,8,9]),
         ("numeral",[3,7])]),["DISK_THM"]),
       [read"%24%32%55%41@@%25@@%32%55%47@@%49%39%52@@@@"])
  fun op endianness_EQ_endianness x = x
    val op endianness_EQ_endianness =
    DT(((("endianness",12),
        [("bool",[57]),("endianness",[5])]),["DISK_THM"]),
       [read"%21%3%21%4%29%30$1@$0@@%32%55$1@@%55$0@@@|@|@"])
  fun op endianness_case_def x = x
    val op endianness_case_def =
    DT(((("endianness",15),
        [("bool",[55,63]),("endianness",[11,14]),
         ("numeral",[3,6])]),["DISK_THM"]),
       [read"%24%20%13%20%15%27%56%41@$1@$0@@$1@|@|@@%20%13%20%15%27%56%47@$1@$0@@$0@|@|@@"])
  fun op datatype_endianness x = x
    val op datatype_endianness =
    DT(((("endianness",16),[("bool",[25,170])]),["DISK_THM"]),
       [read"%45%6%41@%47@@"])
  fun op endianness_distinct x = x
    val op endianness_distinct =
    DT(((("endianness",17),
        [("endianness",[11,12]),("numeral",[3,6])]),["DISK_THM"]),
       [read"%62%30%41@%47@@"])
  fun op endianness_case_cong x = x
    val op endianness_case_cong =
    DT(((("endianness",18),
        [("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("endianness",[6,8,9,15]),("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%21%0%21%1%20%13%20%15%33%24%30$3@$2@@%24%33%30$2@%41@@%27$1@%14@@@%33%30$2@%47@@%27$0@%16@@@@@%27%56$3@$1@$0@@%56$2@%14@%16@@@|@|@|@|@"])
  fun op endianness_nchotomy x = x
    val op endianness_nchotomy =
    DT(((("endianness",19),
        [("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("endianness",[6,8,9]),("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%21%3%53%30$0@%41@@%30$0@%47@@|@"])
  fun op endianness_Axiom x = x
    val op endianness_Axiom =
    DT(((("endianness",20),
        [("bool",[8,14,25,55,63]),("endianness",[11]),
         ("numeral",[3,8])]),["DISK_THM"]),
       [read"%20%18%20%19%35%7%24%27$0%41@@$2@@%27$0%47@@$1@@|@|@|@"])
  fun op endianness_induction x = x
    val op endianness_induction =
    DT(((("endianness",21),
        [("arithmetic",[24,25,27,41,46,59,73,95,177,178,182,185,274]),
         ("bool",
         [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,106]),
         ("endianness",[6,8,9]),("numeral",[3,5,6,7,8,15,16]),
         ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%22%2%33%24$0%41@@$0%47@@@%21%3$1$0@|@@|@"])
  end
  val _ = DB.bindl "endianness"
  [("endianness_TY_DEF",endianness_TY_DEF,DB.Def),
   ("endianness_BIJ",endianness_BIJ,DB.Def),
   ("endianness_size_def",endianness_size_def,DB.Def),
   ("endianness_CASE",endianness_CASE,DB.Def),
   ("default_endianness_def",default_endianness_def,DB.Def),
   ("string_of_endianness_def",string_of_endianness_def,DB.Def),
   ("instance_Show_Show_Endianness_endianness_dict_def",
    instance_Show_Show_Endianness_endianness_dict_def,
    DB.Def),
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

  local open GrammarSpecials Parse
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
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_endianness", (Term.prim_mk_const { Name = "string_of_endianness", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_endianness", (Term.prim_mk_const { Name = "string_of_endianness", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Endianness_endianness_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Endianness_endianness_dict", Thy = "endianness"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Endianness_endianness_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Endianness_endianness_dict", Thy = "endianness"}))
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
        val tyinfo0 = EnumType.update_tyinfo num2endianness_thm endianness2num_thm NONE tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "endianness",
    thydataty = "compute",
    data =
        "endianness.default_endianness_def endianness.instance_Show_Show_Endianness_endianness_dict_def endianness.string_of_endianness_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "endianness"
end
