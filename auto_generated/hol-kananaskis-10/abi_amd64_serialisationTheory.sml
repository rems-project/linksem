structure abi_amd64_serialisationTheory :> abi_amd64_serialisationTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_amd64_serialisationTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open abi_amd64_elf_headerTheory memory_imageTheory
  in end;
  val _ = Theory.link_parents
          ("abi_amd64_serialisation",
          Arbnum.fromString "1445439161",
          Arbnum.fromString "261289")
          [("memory_image",
           Arbnum.fromString "1445438925",
           Arbnum.fromString "21925"),
           ("abi_amd64_elf_header",
           Arbnum.fromString "1445439084",
           Arbnum.fromString "180517")];
  val _ = Theory.incorporate_types "abi_amd64_serialisation" [];

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
  val _ = Theory.incorporate_consts "abi_amd64_serialisation" tyvector [];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  []
  end

  val _ = DB.bindl "abi_amd64_serialisation" []

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("memory_imageTheory.memory_image_grammars",
                          memory_imageTheory.memory_image_grammars),
                         ("abi_amd64_elf_headerTheory.abi_amd64_elf_header_grammars",
                          abi_amd64_elf_headerTheory.abi_amd64_elf_header_grammars)]
  val _ = List.app (update_grms reveal) []

  val abi_amd64_serialisation_grammars = Parse.current_lgrms()
  end

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_amd64_serialisation"
end
