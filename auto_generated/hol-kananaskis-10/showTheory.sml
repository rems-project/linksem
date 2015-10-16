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
  local open lem_string_extraTheory
  in end;
  val _ = Theory.link_parents
          ("show",
          Arbnum.fromString "1445005719",
          Arbnum.fromString "601226")
          [("lem_string_extra",
           Arbnum.fromString "1445005644",
           Arbnum.fromString "507590")];
  val _ = Theory.incorporate_types "show" [];

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
  val _ = Theory.incorporate_consts "show" tyvector [];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  []
  end

  val _ = DB.bindl "show" []

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("lem_string_extraTheory.lem_string_extra_grammars",
                          lem_string_extraTheory.lem_string_extra_grammars)]
  val _ = List.app (update_grms reveal) []

  val show_grammars = Parse.current_lgrms()
  end

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "show"
end
