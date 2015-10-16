structure abi_amd64_symbol_tableTheory :> abi_amd64_symbol_tableTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_amd64_symbol_tableTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open lem_numTheory
  in end;
  val _ = Theory.link_parents
          ("abi_amd64_symbol_table",
          Arbnum.fromString "1445006324",
          Arbnum.fromString "384243")
          [("lem_num",
           Arbnum.fromString "1444993253",
           Arbnum.fromString "763379")];
  val _ = Theory.incorporate_types "abi_amd64_symbol_table" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("num", "num"), ID("min", "="), ID("min", "fun"), ID("min", "bool"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("arithmetic", "NUMERAL"), ID("arithmetic", "ZERO"),
   ID("abi_amd64_symbol_table", "stt_abi_amd64_gnu_ifunc")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYOP [3], TYOP [2, 0, 1], TYOP [2, 0, 2], TYOP [2, 0, 0]]
  end
  val _ = Theory.incorporate_consts "abi_amd64_symbol_table" tyvector
     [("stt_abi_amd64_gnu_ifunc", 0)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMC(1, 3), TMC(4, 4), TMC(5, 4), TMC(6, 4), TMC(7, 0), TMC(8, 0)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op stt_abi_amd64_gnu_ifunc_def x = x
    val op stt_abi_amd64_gnu_ifunc_def =
    DT(((("abi_amd64_symbol_table",0),[]),[]),
       [read"%0%5@%3%2%1%2%4@@@@@"])
  end
  val _ = DB.bindl "abi_amd64_symbol_table"
  [("stt_abi_amd64_gnu_ifunc_def",stt_abi_amd64_gnu_ifunc_def,DB.Def)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("lem_numTheory.lem_num_grammars",
                          lem_numTheory.lem_num_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_abi_amd64_gnu_ifunc", (Term.prim_mk_const { Name = "stt_abi_amd64_gnu_ifunc", Thy = "abi_amd64_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("stt_abi_amd64_gnu_ifunc", (Term.prim_mk_const { Name = "stt_abi_amd64_gnu_ifunc", Thy = "abi_amd64_symbol_table"}))
  val abi_amd64_symbol_table_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "abi_amd64_symbol_table",
    thydataty = "compute",
    data = "abi_amd64_symbol_table.stt_abi_amd64_gnu_ifunc_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_amd64_symbol_table"
end
