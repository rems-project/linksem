structure abi_amd64_section_header_tableTheory :> abi_amd64_section_header_tableTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_amd64_section_header_tableTheory ... " else ()
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
          ("abi_amd64_section_header_table",
          Arbnum.fromString "1471355253",
          Arbnum.fromString "849558")
          [("elf_section_header_table",
           Arbnum.fromString "1471355220",
           Arbnum.fromString "107187")];
  val _ = Theory.incorporate_types "abi_amd64_section_header_table" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("num", "num"), ID("finite_map", "fmap"), ID("pair", "prod"),
   ID("list", "list"), ID("string", "char"), ID("arithmetic", "*"),
   ID("min", "fun"), ID("arithmetic", "+"), ID("pair", ","),
   ID("min", "="), ID("min", "bool"), ID("arithmetic", "BIT1"),
   ID("arithmetic", "BIT2"), ID("string", "CHR"), ID("list", "CONS"),
   ID("finite_map", "FEMPTY"), ID("finite_map", "FUPDATE_LIST"),
   ID("list", "NIL"), ID("arithmetic", "NUMERAL"),
   ID("arithmetic", "ZERO"),
   ID("abi_amd64_section_header_table", "abi_amd64_special_sections_large_code_model"),
   ID("abi_amd64_section_header_table", "abi_amg64_special_sections"),
   ID("abi_amd64_section_header_table", "shf_abi_amd64_large"),
   ID("elf_section_header_table", "shf_alloc"),
   ID("elf_section_header_table", "shf_execinstr"),
   ID("elf_section_header_table", "shf_write"),
   ID("abi_amd64_section_header_table", "sht_abi_amd64_unwind"),
   ID("elf_section_header_table", "sht_nobits"),
   ID("elf_section_header_table", "sht_progbits")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYOP [2, 0, 0], TYOP [4], TYOP [3, 2], TYOP [1, 3, 1],
   TYOP [6, 0, 0], TYOP [6, 0, 5], TYOP [2, 3, 1], TYOP [6, 1, 7],
   TYOP [6, 3, 8], TYOP [6, 0, 1], TYOP [6, 0, 10], TYOP [10],
   TYOP [6, 4, 12], TYOP [6, 4, 13], TYOP [6, 0, 12], TYOP [6, 0, 15],
   TYOP [6, 0, 2], TYOP [6, 3, 3], TYOP [6, 2, 18], TYOP [3, 7],
   TYOP [6, 20, 20], TYOP [6, 7, 21], TYOP [6, 20, 4], TYOP [6, 4, 23]]
  end
  val _ = Theory.incorporate_consts "abi_amd64_section_header_table" tyvector
     [("sht_abi_amd64_unwind", 0), ("shf_abi_amd64_large", 0),
      ("abi_amg64_special_sections", 4),
      ("abi_amd64_special_sections_large_code_model", 4)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMC(5, 6), TMC(7, 6), TMC(8, 9), TMC(8, 11), TMC(9, 14), TMC(9, 16),
   TMC(11, 5), TMC(12, 5), TMC(13, 17), TMC(14, 19), TMC(14, 22),
   TMC(15, 4), TMC(16, 24), TMC(17, 3), TMC(17, 20), TMC(18, 5),
   TMC(19, 0), TMC(20, 4), TMC(21, 4), TMC(22, 0), TMC(23, 0), TMC(24, 0),
   TMC(25, 0), TMC(26, 0), TMC(27, 0), TMC(28, 0)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op shf_abi_amd64_large_def x = x
    val op shf_abi_amd64_large_def =
    DT(((("abi_amd64_section_header_table",0),[]),[]),
       [read"%5%19@%0%15%7%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%16@@@@@@@@@@@@@@@@@@@@@@@@@@@@%15%7%6%16@@@@@"])
  fun op sht_abi_amd64_unwind_def x = x
    val op sht_abi_amd64_unwind_def =
    DT(((("abi_amd64_section_header_table",1),[]),[]),
       [read"%5%23@%1%0%15%7%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%6%7%7%16@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%15%7%16@@@@%15%6%16@@@@"])
  fun op abi_amg64_special_sections_def x = x
    val op abi_amg64_special_sections_def =
    DT(((("abi_amd64_section_header_table",2),[]),[]),
       [read"%4%18@%12%11@%10%2%9%8%15%7%7%7%7%6%16@@@@@@@@%9%8%15%6%6%6%7%6%7%16@@@@@@@@@%9%8%15%6%6%6%6%7%7%16@@@@@@@@@%9%8%15%7%6%7%6%7%7%16@@@@@@@@@%13@@@@@%3%25@%1%20@%22@@@@%10%2%9%8%15%7%7%7%7%6%16@@@@@@@@%9%8%15%7%6%6%6%7%7%16@@@@@@@@@%9%8%15%7%6%7%7%6%7%16@@@@@@@@@%9%8%15%7%6%7%6%7%7%16@@@@@@@@@%13@@@@@%3%25@%1%20@%21@@@@%10%2%9%8%15%7%7%7%7%6%16@@@@@@@@%9%8%15%6%7%7%6%6%7%16@@@@@@@@@%9%8%15%7%6%6%7%6%7%16@@@@@@@@@%9%8%15%6%6%6%6%6%7%16@@@@@@@@@%9%8%15%7%7%7%6%6%7%16@@@@@@@@@%9%8%15%7%7%6%6%7%7%16@@@@@@@@@%9%8%15%6%7%6%6%6%7%16@@@@@@@@@%9%8%15%6%7%7%7%6%7%16@@@@@@@@@%9%8%15%6%7%7%6%6%7%16@@@@@@@@@%13@@@@@@@@@@%3%23@%20@@@%14@@@@@"])
  fun op abi_amd64_special_sections_large_code_model_def x = x
    val op abi_amd64_special_sections_large_code_model_def =
    DT(((("abi_amd64_section_header_table",3),[]),[]),
       [read"%4%17@%12%11@%10%2%9%8%15%7%7%7%7%6%16@@@@@@@@%9%8%15%7%6%7%7%6%7%16@@@@@@@@@%9%8%15%7%7%6%6%6%7%16@@@@@@@@@%9%8%15%6%6%7%6%7%7%16@@@@@@@@@%9%8%15%6%6%7%6%7%7%16@@@@@@@@@%13@@@@@@%3%24@%1%1%20@%22@@%19@@@@%10%2%9%8%15%7%7%7%7%6%16@@@@@@@@%9%8%15%7%6%7%7%6%7%16@@@@@@@@@%9%8%15%7%6%7%6%6%7%16@@@@@@@@@%9%8%15%6%7%6%6%6%7%16@@@@@@@@@%9%8%15%7%6%7%6%7%7%16@@@@@@@@@%9%8%15%6%7%6%6%6%7%16@@@@@@@@@%13@@@@@@@%3%25@%1%1%20@%22@@%19@@@@%10%2%9%8%15%7%7%7%7%6%16@@@@@@@@%9%8%15%7%6%7%7%6%7%16@@@@@@@@@%9%8%15%7%6%7%6%6%7%16@@@@@@@@@%9%8%15%6%7%6%6%6%7%16@@@@@@@@@%9%8%15%7%6%7%6%7%7%16@@@@@@@@@%9%8%15%6%7%6%6%6%7%16@@@@@@@@@%9%8%15%6%7%6%6%7%16@@@@@@@@%13@@@@@@@@%3%25@%1%1%20@%22@@%19@@@@%10%2%9%8%15%7%7%7%7%6%16@@@@@@@@%9%8%15%7%6%7%7%6%7%16@@@@@@@@@%9%8%15%6%6%6%7%6%7%16@@@@@@@@@%9%8%15%6%6%6%6%7%7%16@@@@@@@@@%9%8%15%7%6%7%6%7%7%16@@@@@@@@@%13@@@@@@%3%25@%1%1%20@%22@@%19@@@@%10%2%9%8%15%7%7%7%7%6%16@@@@@@@@%9%8%15%7%6%7%7%6%7%16@@@@@@@@@%9%8%15%7%6%6%6%7%7%16@@@@@@@@@%9%8%15%7%6%7%7%6%7%16@@@@@@@@@%9%8%15%7%6%7%6%7%7%16@@@@@@@@@%13@@@@@@%3%25@%1%1%20@%21@@%19@@@@%10%2%9%8%15%7%7%7%7%6%16@@@@@@@@%9%8%15%7%6%7%7%6%7%16@@@@@@@@@%9%8%15%7%7%6%6%7%7%16@@@@@@@@@%9%8%15%6%6%6%6%7%7%16@@@@@@@@@%9%8%15%7%6%7%6%6%7%16@@@@@@@@@%9%8%15%6%7%6%6%6%7%16@@@@@@@@@%9%8%15%7%6%7%6%7%7%16@@@@@@@@@%9%8%15%6%7%6%6%6%7%16@@@@@@@@@%13@@@@@@@@@%3%25@%1%20@%19@@@@%10%2%9%8%15%7%7%7%7%6%16@@@@@@@@%9%8%15%7%6%7%7%6%7%16@@@@@@@@@%9%8%15%7%7%6%6%7%7%16@@@@@@@@@%9%8%15%6%6%6%6%7%7%16@@@@@@@@@%9%8%15%7%6%7%6%6%7%16@@@@@@@@@%9%8%15%6%7%6%6%6%7%16@@@@@@@@@%9%8%15%7%6%7%6%7%7%16@@@@@@@@@%9%8%15%6%7%6%6%6%7%16@@@@@@@@@%9%8%15%6%7%6%6%7%16@@@@@@@@%13@@@@@@@@@@%3%25@%1%20@%19@@@@%10%2%9%8%15%7%7%7%7%6%16@@@@@@@@%9%8%15%7%6%7%7%6%7%16@@@@@@@@@%9%8%15%7%6%7%6%7%7%16@@@@@@@@@%9%8%15%6%7%7%6%6%7%16@@@@@@@@@%9%8%15%7%6%6%7%7%7%16@@@@@@@@@%9%8%15%7%6%7%6%7%7%16@@@@@@@@@%13@@@@@@@%3%25@%1%1%20@%21@@%19@@@@%14@@@@@@@@@@"])
  end
  val _ = DB.bindl "abi_amd64_section_header_table"
  [("shf_abi_amd64_large_def",shf_abi_amd64_large_def,DB.Def),
   ("sht_abi_amd64_unwind_def",sht_abi_amd64_unwind_def,DB.Def),
   ("abi_amg64_special_sections_def",
    abi_amg64_special_sections_def,
    DB.Def),
   ("abi_amd64_special_sections_large_code_model_def",
    abi_amd64_special_sections_large_code_model_def,
    DB.Def)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("elf_section_header_tableTheory.elf_section_header_table_grammars",
                          elf_section_header_tableTheory.elf_section_header_table_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_abi_amd64_large", (Term.prim_mk_const { Name = "shf_abi_amd64_large", Thy = "abi_amd64_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shf_abi_amd64_large", (Term.prim_mk_const { Name = "shf_abi_amd64_large", Thy = "abi_amd64_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_abi_amd64_unwind", (Term.prim_mk_const { Name = "sht_abi_amd64_unwind", Thy = "abi_amd64_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("sht_abi_amd64_unwind", (Term.prim_mk_const { Name = "sht_abi_amd64_unwind", Thy = "abi_amd64_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amg64_special_sections", (Term.prim_mk_const { Name = "abi_amg64_special_sections", Thy = "abi_amd64_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amg64_special_sections", (Term.prim_mk_const { Name = "abi_amg64_special_sections", Thy = "abi_amd64_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_special_sections_large_code_model", (Term.prim_mk_const { Name = "abi_amd64_special_sections_large_code_model", Thy = "abi_amd64_section_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_special_sections_large_code_model", (Term.prim_mk_const { Name = "abi_amd64_special_sections_large_code_model", Thy = "abi_amd64_section_header_table"}))
  val abi_amd64_section_header_table_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "abi_amd64_section_header_table",
    thydataty = "compute",
    data =
        "abi_amd64_section_header_table.shf_abi_amd64_large_def abi_amd64_section_header_table.sht_abi_amd64_unwind_def abi_amd64_section_header_table.abi_amd64_special_sections_large_code_model_def abi_amd64_section_header_table.abi_amg64_special_sections_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_amd64_section_header_table"
end
