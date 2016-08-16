structure abi_amd64_elf_headerTheory :> abi_amd64_elf_headerTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_amd64_elf_headerTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open elf_headerTheory
  in end;
  val _ = Theory.link_parents
          ("abi_amd64_elf_header",
          Arbnum.fromString "1471355219",
          Arbnum.fromString "517953")
          [("elf_header",
           Arbnum.fromString "1471355161",
           Arbnum.fromString "843300")];
  val _ = Theory.incorporate_types "abi_amd64_elf_header" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"), ID("list", "list"),
   ID("fcp", "cart"), ID("num", "num"), ID("endianness", "endianness"),
   ID("bool", "!"), ID("bool", "/\\"), ID("min", "="),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"), ID("bool", "F"),
   ID("endianness", "Little"), ID("arithmetic", "NUMERAL"),
   ID("arithmetic", "ZERO"),
   ID("abi_amd64_elf_header", "abi_amd64_data_encoding"),
   ID("abi_amd64_elf_header", "abi_amd64_endianness"),
   ID("abi_amd64_elf_header", "abi_amd64_file_class"),
   ID("abi_amd64_elf_header", "abi_amd64_file_version"),
   ID("abi_amd64_elf_header", "abi_amd64_page_size_max"),
   ID("abi_amd64_elf_header", "abi_amd64_page_size_min"),
   ID("elf_header", "elf_class_64"), ID("elf_header", "elf_data_2lsb"),
   ID("elf_header", "elf_ev_current"), ID("elf_header", "elf_ii_class"),
   ID("elf_header", "elf_ii_data"), ID("elf_header", "elf_ma_x86_64"),
   ID("abi_amd64_elf_header", "is_valid_abi_amd64_machine_architecture"),
   ID("abi_amd64_elf_header", "is_valid_abi_amd64_magic_number"),
   ID("lem_list", "list_index"), ID("option", "option"),
   ID("option", "option_CASE"), ID("words", "w2n")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYV "'a", TYOP [3, 0, 1], TYOP [2, 2], TYOP [0, 3, 0],
   TYOP [4], TYOP [0, 5, 0], TYOP [5], TYOP [0, 4, 0], TYOP [0, 6, 0],
   TYOP [0, 0, 0], TYOP [0, 0, 10], TYOP [0, 7, 0], TYOP [0, 7, 12],
   TYOP [0, 5, 6], TYOP [0, 5, 5], TYOP [30, 2], TYOP [0, 5, 16],
   TYOP [0, 3, 17], TYOP [0, 2, 0], TYOP [0, 19, 0], TYOP [0, 0, 20],
   TYOP [0, 16, 21], TYOP [0, 2, 5]]
  end
  val _ = Theory.incorporate_consts "abi_amd64_elf_header" tyvector
     [("is_valid_abi_amd64_magic_number", 4),
      ("is_valid_abi_amd64_machine_architecture", 6),
      ("abi_amd64_page_size_min", 5), ("abi_amd64_page_size_max", 5),
      ("abi_amd64_file_version", 5), ("abi_amd64_file_class", 5),
      ("abi_amd64_endianness", 7), ("abi_amd64_data_encoding", 5)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("cls", 2), TMV("data", 2), TMV("m", 5), TMV("magic", 3), TMC(6, 8),
   TMC(6, 9), TMC(7, 11), TMC(8, 11), TMC(8, 13), TMC(8, 14), TMC(9, 15),
   TMC(10, 15), TMC(11, 0), TMC(12, 7), TMC(13, 15), TMC(14, 5),
   TMC(15, 5), TMC(16, 7), TMC(17, 5), TMC(18, 5), TMC(19, 5), TMC(20, 5),
   TMC(21, 5), TMC(22, 5), TMC(23, 5), TMC(24, 5), TMC(25, 5), TMC(26, 5),
   TMC(27, 6), TMC(28, 4), TMC(29, 18), TMC(31, 22), TMC(32, 23)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op abi_amd64_data_encoding_def x = x
    val op abi_amd64_data_encoding_def =
    DT(((("abi_amd64_elf_header",0),[]),[]), [read"%9%16@%23@"])
  fun op abi_amd64_endianness_def x = x
    val op abi_amd64_endianness_def =
    DT(((("abi_amd64_elf_header",1),[]),[]), [read"%8%17@%13@"])
  fun op abi_amd64_file_class_def x = x
    val op abi_amd64_file_class_def =
    DT(((("abi_amd64_elf_header",2),[]),[]), [read"%9%18@%22@"])
  fun op abi_amd64_file_version_def x = x
    val op abi_amd64_file_version_def =
    DT(((("abi_amd64_elf_header",3),[]),[]), [read"%9%19@%24@"])
  fun op abi_amd64_page_size_min_def x = x
    val op abi_amd64_page_size_min_def =
    DT(((("abi_amd64_elf_header",4),[]),[]),
       [read"%9%21@%14%11%10%10%10%10%10%10%10%10%10%10%10%15@@@@@@@@@@@@@@"])
  fun op abi_amd64_page_size_max_def x = x
    val op abi_amd64_page_size_max_def =
    DT(((("abi_amd64_elf_header",5),[]),[]),
       [read"%9%20@%14%11%10%10%10%10%10%10%10%10%10%10%10%10%10%10%10%15@@@@@@@@@@@@@@@@@@"])
  fun op is_valid_abi_amd64_machine_architecture_def x = x
    val op is_valid_abi_amd64_machine_architecture_def =
    DT(((("abi_amd64_elf_header",6),[]),[]),
       [read"%5%2%7%28$0@@%9$0@%27@@|@"])
  fun op is_valid_abi_amd64_magic_number_def x = x
    val op is_valid_abi_amd64_magic_number_def =
    DT(((("abi_amd64_elf_header",7),[]),[]),
       [read"%4%3%7%29$0@@%31%30$0@%25@@%12@%0%31%30$1@%26@@%12@%1%6%9%32$1@@%18@@%9%32$0@@%16@@|@|@@|@"])
  end
  val _ = DB.bindl "abi_amd64_elf_header"
  [("abi_amd64_data_encoding_def",abi_amd64_data_encoding_def,DB.Def),
   ("abi_amd64_endianness_def",abi_amd64_endianness_def,DB.Def),
   ("abi_amd64_file_class_def",abi_amd64_file_class_def,DB.Def),
   ("abi_amd64_file_version_def",abi_amd64_file_version_def,DB.Def),
   ("abi_amd64_page_size_min_def",abi_amd64_page_size_min_def,DB.Def),
   ("abi_amd64_page_size_max_def",abi_amd64_page_size_max_def,DB.Def),
   ("is_valid_abi_amd64_machine_architecture_def",
    is_valid_abi_amd64_machine_architecture_def,
    DB.Def),
   ("is_valid_abi_amd64_magic_number_def",
    is_valid_abi_amd64_magic_number_def,
    DB.Def)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("elf_headerTheory.elf_header_grammars",
                          elf_headerTheory.elf_header_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_data_encoding", (Term.prim_mk_const { Name = "abi_amd64_data_encoding", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_data_encoding", (Term.prim_mk_const { Name = "abi_amd64_data_encoding", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_endianness", (Term.prim_mk_const { Name = "abi_amd64_endianness", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_endianness", (Term.prim_mk_const { Name = "abi_amd64_endianness", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_file_class", (Term.prim_mk_const { Name = "abi_amd64_file_class", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_file_class", (Term.prim_mk_const { Name = "abi_amd64_file_class", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_file_version", (Term.prim_mk_const { Name = "abi_amd64_file_version", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_file_version", (Term.prim_mk_const { Name = "abi_amd64_file_version", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_page_size_min", (Term.prim_mk_const { Name = "abi_amd64_page_size_min", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_page_size_min", (Term.prim_mk_const { Name = "abi_amd64_page_size_min", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_page_size_max", (Term.prim_mk_const { Name = "abi_amd64_page_size_max", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_amd64_page_size_max", (Term.prim_mk_const { Name = "abi_amd64_page_size_max", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_abi_amd64_machine_architecture", (Term.prim_mk_const { Name = "is_valid_abi_amd64_machine_architecture", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_abi_amd64_machine_architecture", (Term.prim_mk_const { Name = "is_valid_abi_amd64_machine_architecture", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_abi_amd64_magic_number", (Term.prim_mk_const { Name = "is_valid_abi_amd64_magic_number", Thy = "abi_amd64_elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_abi_amd64_magic_number", (Term.prim_mk_const { Name = "is_valid_abi_amd64_magic_number", Thy = "abi_amd64_elf_header"}))
  val abi_amd64_elf_header_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "abi_amd64_elf_header",
    thydataty = "compute",
    data =
        "abi_amd64_elf_header.abi_amd64_data_encoding_def abi_amd64_elf_header.is_valid_abi_amd64_machine_architecture_def abi_amd64_elf_header.is_valid_abi_amd64_magic_number_def abi_amd64_elf_header.abi_amd64_file_version_def abi_amd64_elf_header.abi_amd64_page_size_max_def abi_amd64_elf_header.abi_amd64_page_size_min_def abi_amd64_elf_header.abi_amd64_endianness_def abi_amd64_elf_header.abi_amd64_file_class_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_amd64_elf_header"
end
