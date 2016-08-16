structure abi_amd64_program_header_tableTheory :> abi_amd64_program_header_tableTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_amd64_program_header_tableTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open lem_stringTheory
  in end;
  val _ = Theory.link_parents
          ("abi_amd64_program_header_table",
          Arbnum.fromString "1471355087",
          Arbnum.fromString "356866")
          [("lem_string",
           Arbnum.fromString "1471269249",
           Arbnum.fromString "990379")];
  val _ = Theory.incorporate_types "abi_amd64_program_header_table" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("list", "list"), ID("string", "char"),
   ID("num", "num"), ID("min", "bool"), ID("bool", "!"),
   ID("arithmetic", "*"), ID("min", "="), ID("arithmetic", "BIT1"),
   ID("arithmetic", "BIT2"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("list", "NIL"), ID("arithmetic", "NUMERAL"),
   ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("abi_amd64_program_header_table", "abi_amd64_is_valid_program_interpreter"),
   ID("abi_amd64_program_header_table", "abi_amd64_pt_gnu_eh_frame"),
   ID("abi_amd64_program_header_table", "abi_amd64_pt_sunw_eh_frame"),
   ID("abi_amd64_program_header_table", "abi_amd64_pt_sunw_unwind"),
   ID("abi_amd64_program_header_table", "string_of_abi_amd64_elf_segment_type")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [2], TYOP [1, 0], TYOP [3], TYOP [0, 2, 1], TYOP [4],
   TYOP [0, 1, 4], TYOP [0, 5, 4], TYOP [0, 2, 4], TYOP [0, 7, 4],
   TYOP [0, 2, 2], TYOP [0, 2, 9], TYOP [0, 4, 4], TYOP [0, 4, 11],
   TYOP [0, 1, 5], TYOP [0, 2, 7], TYOP [0, 2, 0], TYOP [0, 1, 1],
   TYOP [0, 1, 16], TYOP [0, 4, 17], TYOP [0, 0, 16]]
  end
  val _ = Theory.incorporate_consts "abi_amd64_program_header_table" tyvector
     [("string_of_abi_amd64_elf_segment_type", 3),
      ("abi_amd64_pt_sunw_unwind", 2), ("abi_amd64_pt_sunw_eh_frame", 2),
      ("abi_amd64_pt_gnu_eh_frame", 2),
      ("abi_amd64_is_valid_program_interpreter", 5)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("m", 2), TMV("s", 1), TMC(5, 6), TMC(5, 8), TMC(6, 10), TMC(7, 12),
   TMC(7, 13), TMC(7, 14), TMC(8, 9), TMC(9, 9), TMC(10, 15), TMC(11, 18),
   TMC(12, 19), TMC(13, 1), TMC(14, 9), TMC(15, 2), TMC(16, 12),
   TMC(17, 5), TMC(18, 2), TMC(19, 2), TMC(20, 2), TMC(21, 3)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op abi_amd64_pt_gnu_eh_frame_def x = x
    val op abi_amd64_pt_gnu_eh_frame_def =
    DT(((("abi_amd64_program_header_table",0),[]),[]),
       [read"%7%18@%4%14%9%15@@@%14%9%8%8%9%8%9%8%9%8%9%8%8%9%9%9%8%8%9%8%9%9%9%8%8%8%9%8%8%9%15@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op abi_amd64_pt_sunw_eh_frame_def x = x
    val op abi_amd64_pt_sunw_eh_frame_def =
    DT(((("abi_amd64_program_header_table",1),[]),[]),
       [read"%7%19@%4%14%9%15@@@%14%9%8%8%9%8%9%8%9%8%9%8%8%9%9%9%8%8%9%8%9%9%9%8%8%8%9%8%8%9%15@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op abi_amd64_pt_sunw_unwind_def x = x
    val op abi_amd64_pt_sunw_unwind_def =
    DT(((("abi_amd64_program_header_table",2),[]),[]),
       [read"%7%20@%4%14%9%15@@@%14%9%8%8%9%8%9%8%9%8%9%8%8%9%9%9%8%8%9%8%9%9%9%8%8%8%9%8%8%9%15@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op string_of_abi_amd64_elf_segment_type_def x = x
    val op string_of_abi_amd64_elf_segment_type_def =
    DT(((("abi_amd64_program_header_table",3),[]),[]),
       [read"%3%0%6%21$0@@%11%7$0@%18@@%12%10%14%8%8%8%9%8%8%15@@@@@@@@@%12%10%14%9%9%9%9%8%8%15@@@@@@@@@%12%10%14%8%9%9%8%9%8%15@@@@@@@@@%12%10%14%8%8%8%8%8%9%15@@@@@@@@@%12%10%14%8%9%9%8%8%8%15@@@@@@@@@%12%10%14%9%8%8%9%8%8%15@@@@@@@@@%12%10%14%8%8%8%8%8%9%15@@@@@@@@@%12%10%14%9%9%9%8%8%8%15@@@@@@@@@%12%10%14%9%9%8%8%9%8%15@@@@@@@@@%12%10%14%8%9%8%8%8%8%15@@@@@@@@@%12%10%14%8%9%9%9%8%8%15@@@@@@@@@%12%10%14%8%9%9%8%8%8%15@@@@@@@@@%13@@@@@@@@@@@@@%11%7$0@%19@@%12%10%14%8%8%9%8%9%8%15@@@@@@@@@%12%10%14%8%9%9%8%9%8%15@@@@@@@@@%12%10%14%9%9%9%9%8%8%15@@@@@@@@@%12%10%14%8%8%8%9%9%8%15@@@@@@@@@%12%10%14%8%8%8%8%8%9%15@@@@@@@@@%12%10%14%8%9%9%8%8%8%15@@@@@@@@@%12%10%14%9%8%8%9%8%8%15@@@@@@@@@%12%10%14%8%8%8%8%8%9%15@@@@@@@@@%12%10%14%9%9%9%8%8%8%15@@@@@@@@@%12%10%14%9%9%8%8%9%8%15@@@@@@@@@%12%10%14%8%9%8%8%8%8%15@@@@@@@@@%12%10%14%8%9%9%9%8%8%15@@@@@@@@@%12%10%14%8%9%9%8%8%8%15@@@@@@@@@%13@@@@@@@@@@@@@@%11%7$0@%20@@%12%10%14%8%8%9%8%9%8%15@@@@@@@@@%12%10%14%8%9%9%8%9%8%15@@@@@@@@@%12%10%14%9%9%9%9%8%8%15@@@@@@@@@%12%10%14%8%8%8%9%9%8%15@@@@@@@@@%12%10%14%8%8%8%8%8%9%15@@@@@@@@@%12%10%14%8%9%9%8%9%8%15@@@@@@@@@%12%10%14%9%9%9%9%8%8%15@@@@@@@@@%12%10%14%8%8%8%9%9%8%15@@@@@@@@@%12%10%14%8%9%8%9%8%8%15@@@@@@@@@%12%10%14%9%9%9%9%8%8%15@@@@@@@@@%12%10%14%9%8%9%8%8%8%15@@@@@@@@@%13@@@@@@@@@@@@%12%10%14%8%9%8%9%8%8%15@@@@@@@@@%12%10%14%9%9%9%9%8%9%15@@@@@@@@@%12%10%14%9%9%9%8%9%9%15@@@@@@@@@%12%10%14%8%9%8%8%8%9%15@@@@@@@@@%12%10%14%9%8%9%9%8%9%15@@@@@@@@@%12%10%14%8%9%8%9%8%9%15@@@@@@@@@%12%10%14%9%8%9%8%8%9%15@@@@@@@@@%12%10%14%9%8%8%8%8%15@@@@@@@@%12%10%14%8%9%8%8%8%8%15@@@@@@@@@%12%10%14%8%9%9%9%8%8%15@@@@@@@@@%12%10%14%9%8%9%8%8%8%15@@@@@@@@@%12%10%14%9%9%9%8%9%15@@@@@@@@%12%10%14%9%8%9%8%9%15@@@@@@@@%12%10%14%9%8%8%8%8%15@@@@@@@@%12%10%14%8%8%9%8%9%9%15@@@@@@@@@%12%10%14%8%9%9%8%8%9%15@@@@@@@@@%12%10%14%8%8%8%9%8%9%15@@@@@@@@@%12%10%14%8%9%9%9%8%9%15@@@@@@@@@%12%10%14%8%9%9%8%8%9%15@@@@@@@@@%12%10%14%9%9%9%9%8%9%15@@@@@@@@@%12%10%14%9%8%9%8%9%9%15@@@@@@@@@%12%10%14%9%8%8%8%8%15@@@@@@@@%12%10%14%9%8%9%8%9%9%15@@@@@@@@@%12%10%14%8%9%8%9%9%9%15@@@@@@@@@%12%10%14%9%8%8%8%9%9%15@@@@@@@@@%12%10%14%8%9%9%8%8%9%15@@@@@@@@@%13@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op abi_amd64_is_valid_program_interpreter_def x = x
    val op abi_amd64_is_valid_program_interpreter_def =
    DT(((("abi_amd64_program_header_table",4),[]),[]),
       [read"%2%1%5%17$0@@%16%6$0@%12%10%14%8%8%8%8%9%15@@@@@@@@%12%10%14%9%8%9%9%8%9%15@@@@@@@@@%12%10%14%8%9%8%9%8%9%15@@@@@@@@@%12%10%14%9%9%8%8%8%9%15@@@@@@@@@%12%10%14%8%8%8%8%9%15@@@@@@@@%12%10%14%9%8%9%9%8%9%15@@@@@@@@@%12%10%14%9%8%9%8%8%9%15@@@@@@@@@%12%10%14%9%9%9%8%9%15@@@@@@@@%12%10%14%9%8%9%8%9%15@@@@@@@@%12%10%14%9%9%9%9%8%15@@@@@@@@%12%10%14%8%8%9%8%9%9%15@@@@@@@@@%12%10%14%8%8%8%8%9%9%15@@@@@@@@@%12%10%14%9%9%9%9%8%15@@@@@@@@%12%10%14%8%9%8%8%9%15@@@@@@@@%13@@@@@@@@@@@@@@@@%6$0@%12%10%14%8%8%8%8%9%15@@@@@@@@%12%10%14%9%8%9%9%8%9%15@@@@@@@@@%12%10%14%8%9%8%9%8%9%15@@@@@@@@@%12%10%14%9%9%8%8%8%9%15@@@@@@@@@%12%10%14%9%9%9%8%9%15@@@@@@@@%12%10%14%9%8%9%8%9%15@@@@@@@@%12%10%14%8%8%8%8%9%15@@@@@@@@%12%10%14%9%8%9%9%8%9%15@@@@@@@@@%12%10%14%9%8%9%8%8%9%15@@@@@@@@@%12%10%14%8%9%9%9%8%15@@@@@@@@%12%10%14%9%8%9%9%8%9%15@@@@@@@@@%12%10%14%8%9%8%9%8%9%15@@@@@@@@@%12%10%14%9%9%9%9%8%9%15@@@@@@@@@%12%10%14%8%9%9%8%9%9%15@@@@@@@@@%12%10%14%9%8%8%9%9%9%15@@@@@@@@@%12%10%14%8%9%9%9%8%15@@@@@@@@%12%10%14%9%8%8%9%9%9%15@@@@@@@@@%12%10%14%9%8%8%9%9%15@@@@@@@@%12%10%14%9%9%9%8%9%15@@@@@@@@%12%10%14%8%9%9%9%8%15@@@@@@@@%12%10%14%9%9%9%8%9%15@@@@@@@@%12%10%14%9%8%9%8%9%15@@@@@@@@%12%10%14%9%9%9%9%8%15@@@@@@@@%12%10%14%8%8%9%8%9%9%15@@@@@@@@@%12%10%14%8%8%8%8%9%9%15@@@@@@@@@%12%10%14%9%9%9%9%8%15@@@@@@@@%12%10%14%9%9%8%8%9%15@@@@@@@@%13@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  end
  val _ = DB.bindl "abi_amd64_program_header_table"
  [("abi_amd64_pt_gnu_eh_frame_def",abi_amd64_pt_gnu_eh_frame_def,DB.Def),
   ("abi_amd64_pt_sunw_eh_frame_def",
    abi_amd64_pt_sunw_eh_frame_def,
    DB.Def),
   ("abi_amd64_pt_sunw_unwind_def",abi_amd64_pt_sunw_unwind_def,DB.Def),
   ("string_of_abi_amd64_elf_segment_type_def",
    string_of_abi_amd64_elf_segment_type_def,
    DB.Def),
   ("abi_amd64_is_valid_program_interpreter_def",
    abi_amd64_is_valid_program_interpreter_def,
    DB.Def)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("lem_stringTheory.lem_string_grammars",
                          lem_stringTheory.lem_string_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_pt_gnu_eh_frame", (Term.prim_mk_const { Name = "abi_amd64_pt_gnu_eh_frame", Thy = "abi_amd64_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_pt_gnu_eh_frame", (Term.prim_mk_const { Name = "abi_amd64_pt_gnu_eh_frame", Thy = "abi_amd64_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_pt_sunw_eh_frame", (Term.prim_mk_const { Name = "abi_amd64_pt_sunw_eh_frame", Thy = "abi_amd64_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_pt_sunw_eh_frame", (Term.prim_mk_const { Name = "abi_amd64_pt_sunw_eh_frame", Thy = "abi_amd64_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_pt_sunw_unwind", (Term.prim_mk_const { Name = "abi_amd64_pt_sunw_unwind", Thy = "abi_amd64_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_pt_sunw_unwind", (Term.prim_mk_const { Name = "abi_amd64_pt_sunw_unwind", Thy = "abi_amd64_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_abi_amd64_elf_segment_type", (Term.prim_mk_const { Name = "string_of_abi_amd64_elf_segment_type", Thy = "abi_amd64_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_abi_amd64_elf_segment_type", (Term.prim_mk_const { Name = "string_of_abi_amd64_elf_segment_type", Thy = "abi_amd64_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_is_valid_program_interpreter", (Term.prim_mk_const { Name = "abi_amd64_is_valid_program_interpreter", Thy = "abi_amd64_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_is_valid_program_interpreter", (Term.prim_mk_const { Name = "abi_amd64_is_valid_program_interpreter", Thy = "abi_amd64_program_header_table"}))
  val abi_amd64_program_header_table_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "abi_amd64_program_header_table",
    thydataty = "compute",
    data =
        "abi_amd64_program_header_table.abi_amd64_pt_gnu_eh_frame_def abi_amd64_program_header_table.string_of_abi_amd64_elf_segment_type_def abi_amd64_program_header_table.abi_amd64_is_valid_program_interpreter_def abi_amd64_program_header_table.abi_amd64_pt_sunw_eh_frame_def abi_amd64_program_header_table.abi_amd64_pt_sunw_unwind_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_amd64_program_header_table"
end
