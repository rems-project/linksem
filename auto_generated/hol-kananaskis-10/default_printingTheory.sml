structure default_printingTheory :> default_printingTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading default_printingTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open lem_functionTheory stringTheory
  in end;
  val _ = Theory.link_parents
          ("default_printing",
          Arbnum.fromString "1471355077",
          Arbnum.fromString "721005")
          [("lem_function",
           Arbnum.fromString "1471268467",
           Arbnum.fromString "941153"),
           ("string",
           Arbnum.fromString "1471267963",
           Arbnum.fromString "222339")];
  val _ = Theory.incorporate_types "default_printing" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("list", "list"), ID("string", "char"),
   ID("min", "="), ID("min", "bool"), ID("arithmetic", "BIT1"),
   ID("num", "num"), ID("arithmetic", "BIT2"), ID("string", "CHR"),
   ID("list", "CONS"), ID("combin", "K"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"), ID("arithmetic", "ZERO"),
   ID("default_printing", "default_os_specific_print"),
   ID("default_printing", "default_proc_specific_print"),
   ID("default_printing", "default_user_specific_print")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [2], TYOP [1, 0], TYV "'a", TYOP [0, 2, 1], TYOP [4],
   TYOP [0, 3, 4], TYOP [0, 3, 5], TYOP [6], TYOP [0, 7, 7],
   TYOP [0, 7, 0], TYOP [0, 1, 1], TYOP [0, 0, 10], TYOP [0, 1, 3]]
  end
  val _ = Theory.incorporate_consts "default_printing" tyvector
     [("default_user_specific_print", 3),
      ("default_proc_specific_print", 3),
      ("default_os_specific_print", 3)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMC(3, 6), TMC(5, 8), TMC(7, 8), TMC(8, 9), TMC(9, 11), TMC(10, 12),
   TMC(11, 1), TMC(12, 8), TMC(13, 7), TMC(14, 3), TMC(15, 3), TMC(16, 3)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op default_os_specific_print_def x = x
    val op default_os_specific_print_def =
    DT(((("default_printing",0),[]),[]),
       [read"%0%9@%5%4%3%7%2%2%1%2%1%8@@@@@@@@%4%3%7%2%1%2%1%1%1%8@@@@@@@@@%4%3%7%1%2%2%1%1%2%8@@@@@@@@@%4%3%7%2%2%2%1%1%2%8@@@@@@@@@%4%3%7%1%2%1%1%1%2%8@@@@@@@@@%4%3%7%1%2%2%1%2%2%8@@@@@@@@@%4%3%7%2%1%2%2%1%2%8@@@@@@@@@%4%3%7%2%1%2%1%2%2%8@@@@@@@@@%4%3%7%2%1%1%1%1%8@@@@@@@@%4%3%7%1%1%1%1%2%1%8@@@@@@@@@%4%3%7%1%1%2%1%2%1%8@@@@@@@@@%4%3%7%2%1%1%1%1%8@@@@@@@@%4%3%7%1%1%2%1%2%2%8@@@@@@@@@%4%3%7%2%1%1%1%2%2%8@@@@@@@@@%4%3%7%1%2%2%1%1%2%8@@@@@@@@@%4%3%7%1%1%2%1%1%2%8@@@@@@@@@%4%3%7%1%2%1%2%1%2%8@@@@@@@@@%4%3%7%2%2%2%1%1%2%8@@@@@@@@@%4%3%7%1%2%1%2%1%2%8@@@@@@@@@%4%3%7%1%1%2%1%1%2%8@@@@@@@@@%4%3%7%2%1%1%1%1%8@@@@@@@@%4%3%7%2%1%1%1%2%2%8@@@@@@@@@%4%3%7%2%2%1%1%2%2%8@@@@@@@@@%4%3%7%1%2%1%2%1%2%8@@@@@@@@@%4%3%7%2%2%2%2%1%2%8@@@@@@@@@%4%3%7%2%1%2%1%2%2%8@@@@@@@@@%4%3%7%2%2%1%2%1%8@@@@@@@@%6@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op default_proc_specific_print_def x = x
    val op default_proc_specific_print_def =
    DT(((("default_printing",1),[]),[]),
       [read"%0%10@%5%4%3%7%2%2%1%2%1%8@@@@@@@@%4%3%7%2%1%2%1%1%1%8@@@@@@@@@%4%3%7%1%2%2%1%1%2%8@@@@@@@@@%4%3%7%2%2%2%1%1%2%8@@@@@@@@@%4%3%7%1%2%1%1%1%2%8@@@@@@@@@%4%3%7%1%2%2%1%2%2%8@@@@@@@@@%4%3%7%2%1%2%2%1%2%8@@@@@@@@@%4%3%7%2%1%2%1%2%2%8@@@@@@@@@%4%3%7%2%1%1%1%1%8@@@@@@@@%4%3%7%2%1%1%1%2%2%8@@@@@@@@@%4%3%7%2%2%1%1%2%2%8@@@@@@@@@%4%3%7%1%1%1%1%2%2%8@@@@@@@@@%4%3%7%1%1%2%1%1%2%8@@@@@@@@@%4%3%7%1%2%2%1%1%2%8@@@@@@@@@%4%3%7%1%1%2%1%2%2%8@@@@@@@@@%4%3%7%1%1%2%1%2%2%8@@@@@@@@@%4%3%7%1%1%1%1%2%2%8@@@@@@@@@%4%3%7%2%2%1%1%2%2%8@@@@@@@@@%4%3%7%2%1%1%1%1%8@@@@@@@@%4%3%7%1%1%2%1%2%2%8@@@@@@@@@%4%3%7%2%1%1%1%2%2%8@@@@@@@@@%4%3%7%1%2%2%1%1%2%8@@@@@@@@@%4%3%7%1%1%2%1%1%2%8@@@@@@@@@%4%3%7%1%2%1%2%1%2%8@@@@@@@@@%4%3%7%2%2%2%1%1%2%8@@@@@@@@@%4%3%7%1%2%1%2%1%2%8@@@@@@@@@%4%3%7%1%1%2%1%1%2%8@@@@@@@@@%4%3%7%2%1%1%1%1%8@@@@@@@@%4%3%7%2%1%1%1%2%2%8@@@@@@@@@%4%3%7%2%2%1%1%2%2%8@@@@@@@@@%4%3%7%1%2%1%2%1%2%8@@@@@@@@@%4%3%7%2%2%2%2%1%2%8@@@@@@@@@%4%3%7%2%1%2%1%2%2%8@@@@@@@@@%4%3%7%2%2%1%2%1%8@@@@@@@@%6@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op default_user_specific_print_def x = x
    val op default_user_specific_print_def =
    DT(((("default_printing",2),[]),[]),
       [read"%0%11@%5%4%3%7%2%2%1%2%1%8@@@@@@@@%4%3%7%2%1%2%1%1%1%8@@@@@@@@@%4%3%7%1%2%2%1%1%2%8@@@@@@@@@%4%3%7%2%2%2%1%1%2%8@@@@@@@@@%4%3%7%1%2%1%1%1%2%8@@@@@@@@@%4%3%7%1%2%2%1%2%2%8@@@@@@@@@%4%3%7%2%1%2%2%1%2%8@@@@@@@@@%4%3%7%2%1%2%1%2%2%8@@@@@@@@@%4%3%7%2%1%1%1%1%8@@@@@@@@%4%3%7%1%2%2%1%2%2%8@@@@@@@@@%4%3%7%1%1%2%1%2%2%8@@@@@@@@@%4%3%7%1%2%2%1%1%2%8@@@@@@@@@%4%3%7%2%2%1%1%2%2%8@@@@@@@@@%4%3%7%2%1%1%1%1%8@@@@@@@@%4%3%7%1%1%2%1%2%2%8@@@@@@@@@%4%3%7%2%1%1%1%2%2%8@@@@@@@@@%4%3%7%1%2%2%1%1%2%8@@@@@@@@@%4%3%7%1%1%2%1%1%2%8@@@@@@@@@%4%3%7%1%2%1%2%1%2%8@@@@@@@@@%4%3%7%2%2%2%1%1%2%8@@@@@@@@@%4%3%7%1%2%1%2%1%2%8@@@@@@@@@%4%3%7%1%1%2%1%1%2%8@@@@@@@@@%4%3%7%2%1%1%1%1%8@@@@@@@@%4%3%7%2%1%1%1%2%2%8@@@@@@@@@%4%3%7%2%2%1%1%2%2%8@@@@@@@@@%4%3%7%1%2%1%2%1%2%8@@@@@@@@@%4%3%7%2%2%2%2%1%2%8@@@@@@@@@%4%3%7%2%1%2%1%2%2%8@@@@@@@@@%4%3%7%2%2%1%2%1%8@@@@@@@@%6@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  end
  val _ = DB.bindl "default_printing"
  [("default_os_specific_print_def",default_os_specific_print_def,DB.Def),
   ("default_proc_specific_print_def",
    default_proc_specific_print_def,
    DB.Def),
   ("default_user_specific_print_def",
    default_user_specific_print_def,
    DB.Def)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("lem_functionTheory.lem_function_grammars",
                          lem_functionTheory.lem_function_grammars),
                         ("stringTheory.string_grammars",
                          stringTheory.string_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("default_os_specific_print", (Term.prim_mk_const { Name = "default_os_specific_print", Thy = "default_printing"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("default_os_specific_print", (Term.prim_mk_const { Name = "default_os_specific_print", Thy = "default_printing"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("default_proc_specific_print", (Term.prim_mk_const { Name = "default_proc_specific_print", Thy = "default_printing"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("default_proc_specific_print", (Term.prim_mk_const { Name = "default_proc_specific_print", Thy = "default_printing"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("default_user_specific_print", (Term.prim_mk_const { Name = "default_user_specific_print", Thy = "default_printing"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("default_user_specific_print", (Term.prim_mk_const { Name = "default_user_specific_print", Thy = "default_printing"}))
  val default_printing_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "default_printing",
    thydataty = "compute",
    data =
        "default_printing.default_os_specific_print_def default_printing.default_proc_specific_print_def default_printing.default_user_specific_print_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "default_printing"
end
