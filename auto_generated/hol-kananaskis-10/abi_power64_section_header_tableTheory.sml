structure abi_power64_section_header_tableTheory :> abi_power64_section_header_tableTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_power64_section_header_tableTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open elf_section_header_tableTheory
  in end;
  val _ = Theory.link_parents
          ("abi_power64_section_header_table",
          Arbnum.fromString "1471355269",
          Arbnum.fromString "642082")
          [("elf_section_header_table",
           Arbnum.fromString "1471355220",
           Arbnum.fromString "107187")];
  val _ = Theory.incorporate_types "abi_power64_section_header_table" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("finite_map", "fmap"), ID("pair", "prod"), ID("num", "num"),
   ID("list", "list"), ID("string", "char"), ID("arithmetic", "+"),
   ID("min", "fun"), ID("pair", ","), ID("min", "="), ID("min", "bool"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"), ID("string", "CHR"),
   ID("list", "CONS"), ID("finite_map", "FEMPTY"),
   ID("finite_map", "FUPDATE_LIST"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"), ID("arithmetic", "ZERO"),
   ID("abi_power64_section_header_table", "abi_power64_special_sections"),
   ID("elf_section_header_table", "shf_alloc"),
   ID("elf_section_header_table", "shf_execinstr"),
   ID("elf_section_header_table", "shf_write"),
   ID("elf_section_header_table", "sht_nobits"),
   ID("elf_section_header_table", "sht_progbits")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [2], TYOP [1, 0, 0], TYOP [4], TYOP [3, 2], TYOP [0, 3, 1],
   TYOP [6, 0, 0], TYOP [6, 0, 5], TYOP [1, 3, 1], TYOP [6, 1, 7],
   TYOP [6, 3, 8], TYOP [6, 0, 1], TYOP [6, 0, 10], TYOP [9],
   TYOP [6, 4, 12], TYOP [6, 4, 13], TYOP [6, 0, 2], TYOP [6, 3, 3],
   TYOP [6, 2, 16], TYOP [3, 7], TYOP [6, 18, 18], TYOP [6, 7, 19],
   TYOP [6, 18, 4], TYOP [6, 4, 21]]
  end
  val _ = Theory.incorporate_consts "abi_power64_section_header_table" tyvector
     [("abi_power64_special_sections", 4)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMC(5, 6), TMC(7, 9), TMC(7, 11), TMC(8, 14), TMC(10, 5), TMC(11, 5),
   TMC(12, 15), TMC(13, 17), TMC(13, 20), TMC(14, 4), TMC(15, 22),
   TMC(16, 3), TMC(16, 18), TMC(17, 5), TMC(18, 0), TMC(19, 4), TMC(20, 0),
   TMC(21, 0), TMC(22, 0), TMC(23, 0), TMC(24, 0)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op abi_power64_special_sections_def x = x
    val op abi_power64_special_sections_def =
    DT(((("abi_power64_section_header_table",0),[]),[]),
       [read"%3%15@%10%9@%8%1%7%6%13%5%5%5%5%4%14@@@@@@@@%7%6%13%4%4%4%5%4%5%14@@@@@@@@@%7%6%13%5%4%5%5%4%5%14@@@@@@@@@%7%6%13%4%5%4%5%4%5%14@@@@@@@@@%7%6%13%5%5%5%5%4%5%14@@@@@@@@@%7%6%13%4%4%5%5%4%5%14@@@@@@@@@%11@@@@@@@%2%20@%0%16@%17@@@@%8%1%7%6%13%5%5%5%5%4%14@@@@@@@@%7%6%13%4%4%4%5%4%5%14@@@@@@@@@%7%6%13%4%4%4%4%5%5%14@@@@@@@@@%7%6%13%5%4%5%4%5%5%14@@@@@@@@@%11@@@@@%2%20@%0%16@%18@@@@%8%1%7%6%13%5%5%5%5%4%14@@@@@@@@%7%6%13%5%4%5%4%5%5%14@@@@@@@@@%7%6%13%4%4%4%4%5%5%14@@@@@@@@@%7%6%13%4%4%5%4%4%5%14@@@@@@@@@%11@@@@@%2%20@%0%16@%18@@@@%8%1%7%6%13%5%5%5%5%4%14@@@@@@@@%7%6%13%5%4%5%4%5%5%14@@@@@@@@@%7%6%13%4%4%4%4%5%5%14@@@@@@@@@%7%6%13%4%4%5%4%4%5%14@@@@@@@@@%7%6%13%5%5%4%4%4%5%14@@@@@@@@@%7%6%13%4%4%5%4%5%5%14@@@@@@@@@%7%6%13%4%4%5%4%5%5%14@@@@@@@@@%11@@@@@@@@%2%19@%0%16@%18@@@@%8%1%7%6%13%5%5%5%5%4%14@@@@@@@@%7%6%13%5%4%4%4%5%5%14@@@@@@@@@%7%6%13%5%4%5%5%4%5%14@@@@@@@@@%7%6%13%5%4%5%4%5%5%14@@@@@@@@@%11@@@@@%2%19@%0%16@%18@@@@%12@@@@@@@"])
  end
  val _ = DB.bindl "abi_power64_section_header_table"
  [("abi_power64_special_sections_def",
    abi_power64_special_sections_def,
    DB.Def)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("elf_section_header_tableTheory.elf_section_header_table_grammars",
                          elf_section_header_tableTheory.elf_section_header_table_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_power64_special_sections", (Term.prim_mk_const { Name = "abi_power64_special_sections", Thy = "abi_power64_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_power64_special_sections", (Term.prim_mk_const { Name = "abi_power64_special_sections", Thy = "abi_power64_section_header_table"}))
  val abi_power64_section_header_table_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "abi_power64_section_header_table",
    thydataty = "compute",
    data =
        "abi_power64_section_header_table.abi_power64_special_sections_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_power64_section_header_table"
end
