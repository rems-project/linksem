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
  local open gnu_ext_abiTheory
  in end;
  val _ = Theory.link_parents
          ("abi_amd64_symbol_table",
          Arbnum.fromString "1471355392",
          Arbnum.fromString "266503")
          [("gnu_ext_abi",
           Arbnum.fromString "1471355371",
           Arbnum.fromString "182922")];
  val _ = Theory.incorporate_types "abi_amd64_symbol_table" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  []
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  []
  end
  val _ = Theory.incorporate_consts "abi_amd64_symbol_table" tyvector [];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  []
  end

  val _ = DB.bindl "abi_amd64_symbol_table" []

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("gnu_ext_abiTheory.gnu_ext_abi_grammars",
                          gnu_ext_abiTheory.gnu_ext_abi_grammars)]
  val _ = List.app (update_grms reveal) []

  val abi_amd64_symbol_table_grammars = Parse.current_lgrms()
  end

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_amd64_symbol_table"
end
