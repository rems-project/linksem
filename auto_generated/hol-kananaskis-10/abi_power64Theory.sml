structure abi_power64Theory :> abi_power64Theory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_power64Theory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open elf_fileTheory
  in end;
  val _ = Theory.link_parents
          ("abi_power64",
          Arbnum.fromString "1445346635",
          Arbnum.fromString "316317")
          [("elf_file",
           Arbnum.fromString "1445346182",
           Arbnum.fromString "856027")];
  val _ = Theory.incorporate_types "abi_power64" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("error", "error"), ID("fcp", "cart"),
   ID("min", "bool"), ID("list", "list"),
   ID("elf_interpreted_segment", "elf64_interpreted_segment"),
   ID("fcp", "bit0"), ID("one", "one"), ID("num", "num"),
   ID("pair", "prod"), ID("byte_sequence", "byte_sequence"),
   ID("bool", "!"), ID("arithmetic", "+"), ID("arithmetic", "-"),
   ID("bool", "/\\"), ID("arithmetic", "<="), ID("min", "="),
   ID("bool", "ARB"), ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("string", "CHR"), ID("string", "char"), ID("list", "CONS"),
   ID("list", "FILTER"), ID("bool", "LET"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"), ID("pair", "UNCURRY"),
   ID("arithmetic", "ZERO"),
   ID("abi_power64", "abi_power64_compute_program_entry_point"),
   ID("elf_interpreted_segment", "elf64_interpreted_segment_elf64_segment_base"),
   ID("elf_interpreted_segment", "elf64_interpreted_segment_elf64_segment_body"),
   ID("elf_interpreted_segment", "elf64_interpreted_segment_elf64_segment_memsz"),
   ID("error", "error_bind"), ID("error", "fail0"),
   ID("list", "list_CASE"), ID("byte_sequence", "offset_and_cut"),
   ID("pair", "pair_CASE"), ID("byte_sequence", "read_8_bytes_le"),
   ID("error", "return"), ID("words", "w2n")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'a", TYOP [1, 0], TYV "'b", TYOP [3], TYOP [2, 3, 2],
   TYOP [0, 4, 1], TYOP [5], TYOP [4, 6], TYOP [0, 7, 5], TYOP [7],
   TYOP [6, 9], TYOP [6, 10], TYOP [6, 11], TYOP [2, 3, 12], TYOP [8],
   TYOP [9, 13, 13], TYOP [9, 13, 15], TYOP [9, 13, 16], TYOP [9, 13, 17],
   TYOP [9, 13, 18], TYOP [9, 13, 19], TYOP [9, 13, 20], TYOP [10],
   TYOP [9, 21, 22], TYOP [0, 4, 3], TYOP [0, 24, 3], TYOP [0, 7, 3],
   TYOP [0, 26, 3], TYOP [0, 14, 14], TYOP [0, 14, 28], TYOP [0, 3, 3],
   TYOP [0, 3, 30], TYOP [0, 14, 3], TYOP [0, 14, 32], TYOP [0, 1, 3],
   TYOP [0, 1, 34], TYOP [0, 13, 0], TYOP [0, 13, 36], TYOP [0, 13, 37],
   TYOP [0, 13, 38], TYOP [0, 13, 39], TYOP [0, 13, 40], TYOP [0, 13, 41],
   TYOP [0, 13, 42], TYOP [21], TYOP [0, 14, 44], TYOP [4, 44],
   TYOP [0, 46, 46], TYOP [0, 44, 47], TYOP [0, 7, 7], TYOP [0, 6, 3],
   TYOP [0, 50, 49], TYOP [0, 7, 1], TYOP [0, 52, 52], TYOP [0, 32, 32],
   TYOP [0, 14, 1], TYOP [0, 55, 55], TYOP [0, 21, 1], TYOP [0, 57, 57],
   TYOP [0, 15, 1], TYOP [0, 13, 1], TYOP [0, 13, 60], TYOP [0, 61, 59],
   TYOP [0, 16, 1], TYOP [0, 13, 59], TYOP [0, 64, 63], TYOP [0, 17, 1],
   TYOP [0, 13, 63], TYOP [0, 67, 66], TYOP [0, 18, 1], TYOP [0, 13, 66],
   TYOP [0, 70, 69], TYOP [0, 19, 1], TYOP [0, 13, 69], TYOP [0, 73, 72],
   TYOP [0, 20, 1], TYOP [0, 13, 72], TYOP [0, 76, 75], TYOP [0, 13, 75],
   TYOP [0, 78, 57], TYOP [0, 6, 14], TYOP [0, 6, 22], TYOP [0, 22, 1],
   TYOP [0, 82, 1], TYOP [1, 22], TYOP [0, 84, 83], TYOP [0, 23, 1],
   TYOP [0, 86, 1], TYOP [1, 23], TYOP [0, 88, 87], TYOP [0, 46, 1],
   TYOP [0, 6, 52], TYOP [0, 91, 1], TYOP [0, 1, 92], TYOP [0, 7, 93],
   TYOP [0, 22, 84], TYOP [0, 14, 95], TYOP [0, 14, 96], TYOP [0, 21, 82],
   TYOP [0, 98, 1], TYOP [0, 23, 99], TYOP [0, 22, 88], TYOP [0, 0, 1],
   TYOP [0, 4, 14]]
  end
  val _ = Theory.incorporate_consts "abi_power64" tyvector
     [("abi_power64_compute_program_entry_point", 8)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("b1", 13), TMV("b2", 13), TMV("b3", 13), TMV("b4", 13),
   TMV("b5", 13), TMV("b6", 13), TMV("b7", 13), TMV("b8", 13),
   TMV("base", 14), TMV("bytes", 21), TMV("bytes'", 22), TMV("entry", 4),
   TMV("entry", 14), TMV("filtered", 7), TMV("p", 23), TMV("rebase", 14),
   TMV("seg", 6), TMV("segs", 7), TMV("size1", 14), TMV("v1", 22),
   TMV("v3", 7), TMV("v6", 6), TMV("v7", 7), TMV("x", 6), TMC(11, 25),
   TMC(11, 27), TMC(12, 29), TMC(13, 29), TMC(14, 31), TMC(15, 33),
   TMC(16, 35), TMC(17, 43), TMC(18, 28), TMC(19, 28), TMC(20, 45),
   TMC(22, 48), TMC(23, 51), TMC(24, 53), TMC(24, 54), TMC(24, 56),
   TMC(24, 58), TMC(25, 46), TMC(26, 28), TMC(27, 62), TMC(27, 65),
   TMC(27, 68), TMC(27, 71), TMC(27, 74), TMC(27, 77), TMC(27, 79),
   TMC(28, 14), TMC(29, 8), TMC(30, 80), TMC(31, 81), TMC(32, 80),
   TMC(33, 85), TMC(33, 89), TMC(34, 90), TMC(35, 94), TMC(36, 97),
   TMC(37, 100), TMC(38, 101), TMC(39, 102), TMC(40, 103)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op abi_power64_compute_program_entry_point_def x = x
    val op abi_power64_compute_program_entry_point_def =
    DT(((("abi_power64",0),[]),[]),
       [read"%25%17%24%11%30%51$1@$0@@%39%12%37%13%58$0@%57%35%34%42%32%33%32%32%32%33%50@@@@@@@@@%35%34%42%33%33%32%32%32%33%50@@@@@@@@@%35%34%42%32%33%32%33%32%33%50@@@@@@@@@%35%34%42%32%32%32%32%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%33%33%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%33%33%33%32%33%50@@@@@@@@%35%34%42%33%32%33%32%33%50@@@@@@@@%35%34%42%32%32%32%32%32%33%50@@@@@@@@@%35%34%42%32%32%33%32%32%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%33%32%33%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%32%32%32%32%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%33%32%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%32%32%33%50@@@@@@@@@%35%34%42%32%33%33%33%32%33%50@@@@@@@@@%35%34%42%32%32%32%32%32%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%33%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%33%32%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%33%33%32%33%33%50@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%33%32%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%32%32%33%50@@@@@@@@@%35%34%42%32%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%32%32%33%32%33%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%32%32%32%33%32%33%50@@@@@@@@@%35%34%42%32%33%33%33%32%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%32%32%33%32%32%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%32%32%33%50@@@@@@@@@%35%34%42%32%33%32%33%32%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%32%32%33%32%33%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%33%32%32%33%32%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%33%32%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%32%32%33%50@@@@@@@@@%35%34%42%32%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%33%33%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%33%32%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%41@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%23%20%58$0@%39%15%55%59$0@%42%33%32%32%50@@@@@%53$2@@@%10%56%61$0@@%14%60$0@%9%19%40%49%0%48%1%47%2%46%3%45%4%44%5%43%6%7%62%31$7@$6@$5@$4@$3@$2@$1@$0@@||@|@|@|@|@|@|@@$1@||@|@|@|@%27$3@%52$1@@@@%21%22%57%35%34%42%32%33%32%32%32%33%50@@@@@@@@@%35%34%42%33%33%32%32%32%33%50@@@@@@@@@%35%34%42%32%33%32%33%32%33%50@@@@@@@@@%35%34%42%32%32%32%32%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%33%33%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%33%33%33%32%33%50@@@@@@@@%35%34%42%33%32%33%32%33%50@@@@@@@@%35%34%42%32%32%32%32%32%33%50@@@@@@@@@%35%34%42%32%32%33%32%32%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%33%32%33%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%32%32%32%32%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%33%32%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%32%32%33%50@@@@@@@@@%35%34%42%32%33%33%33%32%33%50@@@@@@@@@%35%34%42%32%32%32%32%32%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%33%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%33%32%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%33%33%32%33%33%50@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%32%33%33%33%32%33%50@@@@@@@@@%35%34%42%32%33%33%32%33%33%50@@@@@@@@@%35%34%42%33%32%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%33%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%33%32%33%33%32%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%33%32%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%32%32%33%50@@@@@@@@@%35%34%42%32%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%32%32%33%32%33%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%32%32%32%33%32%33%50@@@@@@@@@%35%34%42%32%33%33%33%32%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%32%32%33%32%33%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%32%32%33%32%32%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%32%32%33%50@@@@@@@@@%35%34%42%32%33%32%33%32%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%33%32%32%33%32%33%50@@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%33%32%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%32%32%33%50@@@@@@@@@%35%34%42%32%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%32%33%33%32%32%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%35%34%42%33%33%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%33%33%33%50@@@@@@@@@%35%34%42%33%32%32%32%32%50@@@@@@@@%35%34%42%33%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%32%32%32%33%33%50@@@@@@@@@%35%34%42%32%33%32%33%32%33%50@@@@@@@@@%35%34%42%33%33%33%33%32%33%50@@@@@@@@@%35%34%42%33%32%33%32%33%33%50@@@@@@@@@%41@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@||@||@|@%36%16%38%8%38%18%28%29$1@$3@@%29$3@%26$1@$0@@@|@%54$1@@|@%52$0@@|@$2@@|@%63$0@@@|@|@"])
  end
  val _ = DB.bindl "abi_power64"
  [("abi_power64_compute_program_entry_point_def",
    abi_power64_compute_program_entry_point_def,
    DB.Def)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("elf_fileTheory.elf_file_grammars",
                          elf_fileTheory.elf_file_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_power64_compute_program_entry_point", (Term.prim_mk_const { Name = "abi_power64_compute_program_entry_point", Thy = "abi_power64"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_power64_compute_program_entry_point", (Term.prim_mk_const { Name = "abi_power64_compute_program_entry_point", Thy = "abi_power64"}))
  val abi_power64_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "abi_power64",
    thydataty = "compute",
    data = "abi_power64.abi_power64_compute_program_entry_point_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_power64"
end
