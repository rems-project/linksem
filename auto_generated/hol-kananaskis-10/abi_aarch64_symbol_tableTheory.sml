structure abi_aarch64_symbol_tableTheory :> abi_aarch64_symbol_tableTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_aarch64_symbol_tableTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open elf_section_header_tableTheory elf_symbol_tableTheory
  in end;
  val _ = Theory.link_parents
          ("abi_aarch64_symbol_table",
          Arbnum.fromString "1445346479",
          Arbnum.fromString "108427")
          [("elf_symbol_table",
           Arbnum.fromString "1445346153",
           Arbnum.fromString "766665"),
           ("elf_section_header_table",
           Arbnum.fromString "1445346072",
           Arbnum.fromString "814165")];
  val _ = Theory.incorporate_types "abi_aarch64_symbol_table" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"),
   ID("elf_symbol_table", "elf64_symbol_table_entry"), ID("bool", "!"),
   ID("bool", "/\\"), ID("min", "="), ID("num", "num"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_info"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
   ID("elf_symbol_table", "elf64_symbol_table_entry_elf64_st_shndx"),
   ID("elf_symbol_table", "get_symbol_binding"),
   ID("abi_aarch64_symbol_table", "is_aarch64_weak_definition"),
   ID("abi_aarch64_symbol_table", "is_aarch64_weak_reference"),
   ID("elf_header", "shn_undef"), ID("elf_symbol_table", "stb_weak"),
   ID("words", "w2n"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [2], TYOP [0, 1, 0], TYOP [0, 2, 0], TYOP [0, 0, 0],
   TYOP [0, 0, 4], TYOP [6], TYOP [0, 6, 0], TYOP [0, 6, 7], TYOP [10],
   TYOP [9, 9], TYOP [9, 10], TYOP [9, 11], TYOP [8, 0, 12],
   TYOP [0, 1, 13], TYOP [9, 12], TYOP [8, 0, 15], TYOP [0, 1, 16],
   TYOP [0, 13, 6], TYOP [0, 16, 6]]
  end
  val _ = Theory.incorporate_consts "abi_aarch64_symbol_table" tyvector
     [("is_aarch64_weak_reference", 2), ("is_aarch64_weak_definition", 2)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("ent", 1), TMC(3, 3), TMC(4, 5), TMC(5, 5), TMC(5, 8), TMC(7, 14),
   TMC(11, 17), TMC(12, 18), TMC(13, 2), TMC(14, 2), TMC(15, 6),
   TMC(16, 6), TMC(17, 19), TMC(18, 4)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op is_aarch64_weak_reference_def x = x
    val op is_aarch64_weak_reference_def =
    DT(((("abi_aarch64_symbol_table",0),[]),[]),
       [read"%1%0%3%9$0@@%2%4%12%6$0@@@%10@@%4%7%5$0@@@%11@@@|@"])
  fun op is_aarch64_weak_definition_def x = x
    val op is_aarch64_weak_definition_def =
    DT(((("abi_aarch64_symbol_table",1),[]),[]),
       [read"%1%0%3%8$0@@%2%13%4%12%6$0@@@%10@@@%4%7%5$0@@@%11@@@|@"])
  end
  val _ = DB.bindl "abi_aarch64_symbol_table"
  [("is_aarch64_weak_reference_def",is_aarch64_weak_reference_def,DB.Def),
   ("is_aarch64_weak_definition_def",
    is_aarch64_weak_definition_def,
    DB.Def)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("elf_symbol_tableTheory.elf_symbol_table_grammars",
                          elf_symbol_tableTheory.elf_symbol_table_grammars),
                         ("elf_section_header_tableTheory.elf_section_header_table_grammars",
                          elf_section_header_tableTheory.elf_section_header_table_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_aarch64_weak_reference", (Term.prim_mk_const { Name = "is_aarch64_weak_reference", Thy = "abi_aarch64_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_aarch64_weak_reference", (Term.prim_mk_const { Name = "is_aarch64_weak_reference", Thy = "abi_aarch64_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_aarch64_weak_definition", (Term.prim_mk_const { Name = "is_aarch64_weak_definition", Thy = "abi_aarch64_symbol_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_aarch64_weak_definition", (Term.prim_mk_const { Name = "is_aarch64_weak_definition", Thy = "abi_aarch64_symbol_table"}))
  val abi_aarch64_symbol_table_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "abi_aarch64_symbol_table",
    thydataty = "compute",
    data =
        "abi_aarch64_symbol_table.is_aarch64_weak_reference_def abi_aarch64_symbol_table.is_aarch64_weak_definition_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_aarch64_symbol_table"
end
