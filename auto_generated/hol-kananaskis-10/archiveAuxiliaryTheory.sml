structure archiveAuxiliaryTheory :> archiveAuxiliaryTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading archiveAuxiliaryTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open archiveTheory
  in end;
  val _ = Theory.link_parents
          ("archiveAuxiliary",
          Arbnum.fromString "1445351192",
          Arbnum.fromString "93470")
          [("archive",
           Arbnum.fromString "1445351179",
           Arbnum.fromString "156568")];
  val _ = Theory.incorporate_types "archiveAuxiliary" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"),
   ID("byte_sequence", "byte_sequence"), ID("num", "num"),
   ID("option", "option"), ID("list", "list"), ID("string", "char"),
   ID("pair", "prod"), ID("archive", "archive_entry_header"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"), ID("bool", "!"),
   ID("arithmetic", "+"), ID("pair", ","), ID("arithmetic", "-"),
   ID("bool", "/\\"), ID("num", "0"), ID("min", "="), ID("error", "error"),
   ID("min", "==>"), ID("bool", "ARB"), ID("arithmetic", "BIT1"),
   ID("arithmetic", "BIT2"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("string", "EXPLODE"), ID("string", "IMPLODE"),
   ID("list", "LENGTH"), ID("bool", "LET"), ID("arithmetic", "MOD"),
   ID("list", "NIL"), ID("arithmetic", "NUMERAL"), ID("option", "SOME"),
   ID("byte_sequence", "Sequence"), ID("list", "TAKE"),
   ID("pair", "UNCURRY"), ID("arithmetic", "ZERO"),
   ID("archive", "accum_archive_contents"),
   ID("archive", "archive_entry_header_name"),
   ID("archive", "archive_entry_header_size0"),
   ID("byte_sequence", "byte_sequence_CASE"),
   ID("byte_sequence", "dropbytes"), ID("error", "fail0"),
   ID("lem", "failwith"), ID("list", "list_CASE"),
   ID("bool", "literal_case"),
   ID("missing_pervasives", "natural_of_decimal_string"),
   ID("option", "option_CASE"), ID("archive", "read_archive_entry_header"),
   ID("error", "return"), ID("missing_pervasives", "string_index_of"),
   ID("archive", "string_of_byte_sequence0"),
   ID("missing_pervasives", "string_prefix"), ID("error", "with_success"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [2], TYOP [0, 1, 0], TYOP [3], TYOP [0, 3, 2], TYOP [6],
   TYOP [5, 5], TYOP [4, 6], TYOP [0, 7, 4], TYOP [7, 6, 1], TYOP [5, 9],
   TYOP [0, 10, 8], TYOP [8], TYOP [11], TYOP [10, 13], TYOP [10, 14],
   TYOP [10, 15], TYOP [9, 0, 16], TYOP [5, 17], TYOP [0, 12, 0],
   TYOP [0, 19, 0], TYOP [0, 2, 0], TYOP [0, 11, 0], TYOP [0, 22, 0],
   TYOP [0, 18, 0], TYOP [0, 24, 0], TYOP [0, 10, 0], TYOP [0, 26, 0],
   TYOP [0, 3, 0], TYOP [0, 28, 0], TYOP [0, 7, 0], TYOP [0, 30, 0],
   TYOP [0, 3, 3], TYOP [0, 3, 32], TYOP [0, 1, 9], TYOP [0, 6, 34],
   TYOP [7, 10, 7], TYOP [0, 7, 36], TYOP [0, 10, 37], TYOP [0, 0, 0],
   TYOP [0, 0, 39], TYOP [0, 1, 2], TYOP [0, 5, 0], TYOP [0, 5, 42],
   TYOP [19, 10], TYOP [0, 44, 0], TYOP [0, 44, 45], TYOP [0, 6, 0],
   TYOP [0, 6, 47], TYOP [0, 3, 28], TYOP [0, 36, 0], TYOP [0, 36, 50],
   TYOP [0, 6, 7], TYOP [0, 3, 52], TYOP [0, 3, 5], TYOP [0, 44, 44],
   TYOP [0, 44, 55], TYOP [0, 0, 56], TYOP [0, 0, 33], TYOP [0, 36, 36],
   TYOP [0, 36, 59], TYOP [0, 0, 60], TYOP [0, 6, 6], TYOP [0, 5, 62],
   TYOP [0, 10, 10], TYOP [0, 9, 64], TYOP [0, 6, 3], TYOP [0, 1, 44],
   TYOP [0, 67, 67], TYOP [0, 6, 36], TYOP [0, 69, 69], TYOP [0, 3, 44],
   TYOP [0, 71, 71], TYOP [0, 3, 36], TYOP [0, 73, 73], TYOP [0, 36, 44],
   TYOP [0, 75, 75], TYOP [0, 18, 1], TYOP [0, 18, 18], TYOP [0, 3, 78],
   TYOP [7, 3, 1], TYOP [7, 12, 80], TYOP [0, 81, 44], TYOP [0, 80, 44],
   TYOP [0, 12, 83], TYOP [0, 84, 82], TYOP [0, 7, 44], TYOP [0, 10, 86],
   TYOP [0, 87, 75], TYOP [0, 3, 67], TYOP [0, 89, 83], TYOP [0, 7, 89],
   TYOP [0, 10, 91], TYOP [0, 12, 6], TYOP [0, 12, 3], TYOP [0, 18, 44],
   TYOP [0, 95, 44], TYOP [0, 1, 96], TYOP [19, 1], TYOP [0, 1, 98],
   TYOP [0, 3, 99], TYOP [0, 6, 44], TYOP [0, 5, 69], TYOP [0, 102, 36],
   TYOP [0, 36, 103], TYOP [0, 6, 104], TYOP [0, 5, 36],
   TYOP [0, 106, 106], TYOP [0, 62, 6], TYOP [0, 6, 108], TYOP [0, 7, 109],
   TYOP [0, 69, 36], TYOP [0, 36, 111], TYOP [0, 7, 112], TYOP [0, 32, 3],
   TYOP [0, 3, 114], TYOP [4, 3], TYOP [0, 116, 115], TYOP [19, 81],
   TYOP [0, 1, 118], TYOP [0, 3, 119], TYOP [0, 10, 44], TYOP [0, 6, 116],
   TYOP [0, 5, 122], TYOP [0, 1, 6], TYOP [0, 67, 44], TYOP [0, 44, 125],
   TYOP [0, 98, 126], TYOP [0, 82, 44], TYOP [0, 44, 128],
   TYOP [0, 118, 129]]
  end
  val _ = Theory.incorporate_consts "archiveAuxiliary" tyvector [];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("P", 11), TMV("accum", 10), TMV("amount_to_drop", 3),
   TMV("chunk", 1), TMV("ext_name", 6), TMV("extended_filenames", 7),
   TMV("hdr", 12), TMV("index", 3), TMV("name", 6), TMV("new_accum", 10),
   TMV("new_extended_filenames", 7), TMV("new_seq", 1), TMV("next_bs", 18),
   TMV("rest", 6), TMV("rest'", 6), TMV("s", 6), TMV("seq", 1),
   TMV("seq_length", 3), TMV("table_suffix", 6), TMV("v", 10),
   TMV("v1", 7), TMV("v11", 5), TMV("v13", 5), TMV("v2", 5), TMV("v2", 3),
   TMV("v3", 1), TMV("v4", 5), TMV("whole_seq", 1),
   TMV("whole_seq_length", 3), TMV("x", 6), TMV("x", 3), TMC(12, 20),
   TMC(12, 21), TMC(12, 23), TMC(12, 25), TMC(12, 27), TMC(12, 29),
   TMC(12, 31), TMC(13, 33), TMC(14, 35), TMC(14, 38), TMC(15, 33),
   TMC(16, 40), TMC(17, 3), TMC(18, 41), TMC(18, 43), TMC(18, 46),
   TMC(18, 48), TMC(18, 49), TMC(18, 51), TMC(20, 40), TMC(21, 53),
   TMC(22, 32), TMC(23, 32), TMC(24, 54), TMC(25, 57), TMC(25, 58),
   TMC(25, 61), TMC(26, 63), TMC(26, 65), TMC(27, 62), TMC(28, 62),
   TMC(29, 66), TMC(30, 68), TMC(30, 70), TMC(30, 72), TMC(30, 74),
   TMC(30, 76), TMC(31, 33), TMC(32, 6), TMC(33, 32), TMC(34, 52),
   TMC(35, 77), TMC(36, 79), TMC(37, 85), TMC(37, 88), TMC(37, 90),
   TMC(38, 3), TMC(39, 92), TMC(40, 93), TMC(41, 94), TMC(42, 97),
   TMC(43, 100), TMC(44, 101), TMC(45, 69), TMC(46, 105), TMC(47, 107),
   TMC(48, 66), TMC(49, 110), TMC(49, 113), TMC(49, 117), TMC(50, 120),
   TMC(51, 121), TMC(52, 123), TMC(53, 124), TMC(54, 53), TMC(55, 127),
   TMC(55, 130), TMC(56, 39)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op accum_archive_contents_rw x = x
    val op accum_archive_contents_rw =
    DT(((("archiveAuxiliary",0),
        [("archive",[42,43]),("bool",[105])]),["DISK_THM", "cheat"]),
       [read"%36%28%32%27%37%5%35%1%46%78$0@$1@$3@$2@@%97%91$3@$2@@%92$0@@%74%6%76%17%16%81$0@%12%65%2%55%48$0@%43@@%83%58%54%70%52%53%52%52%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%52%52%52%52%53%77@@@@@@@@@%58%54%70%52%53%52%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%52%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%53%53%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%52%52%52%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%53%52%53%53%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%52%53%52%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%53%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%53%52%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%52%52%52%53%77@@@@@@@@@%58%54%70%52%53%52%53%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%52%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%53%77@@@@@@@@%69@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%63%3%67%75%9%10%96%82$3@$5@@%92$8@@%11%78$2@$1@%41$7@$4@@$0@|@||@@%64%8%57%47$0@%58%54%70%52%52%52%52%53%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%69@@@@@@@@@@@@@@@@@@%40$7@$8@@%85$0@%40%59%39%79$6@@$1@@$7@@$8@@%23%14%86%26%57%45$0@%54%70%52%52%52%52%53%77@@@@@@@@@%85$1@%66%7%89$12@%84%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%52%53%52%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%52%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%53%53%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%53%53%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%53%53%52%77@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%53%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%52%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%53%53%77@@@@@@@@@%69@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%15%64%18%66%7%64%4%40%59%39$0@$9@@$15@@$16@|@%88%95$0@$1@@%69@%29$0|@@|@%90%93%54%70%52%52%52%52%53%77@@@@@@@@$0@@%62$0@@%30$0|@@|@%88%51$1@$0@@%69@%29$0|@@|@|@%87%61%69@@@@%21%13%86%22%57%45$0@%54%70%52%52%52%52%53%77@@@@@@@@@%40$13@%71%94$7@@@@%66%7%89$15@%84%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%52%53%52%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%52%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%53%53%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%53%53%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%53%53%52%77@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%53%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%52%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%53%53%77@@@@@@@@@%69@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%15%64%18%66%7%64%4%40%59%39$0@$12@@$18@@$19@|@%88%95$0@$1@@%69@%29$0|@@|@%90%93%54%70%52%52%52%52%53%77@@@@@@@@$0@@%62$0@@%30$0|@@|@%88%51$1@$0@@%69@%29$0|@@|@|@%87%61%58$0@$1@@@@@|@$1@||@@%40%59%39%79$9@@$4@@$10@@$11@@|@$1@||@@|@%60%79$5@@@@|@%72%73%80$4@@$1@@@@|@%56%48%68%80$3@@%70%53%77@@@@%43@@%80$3@@%38%80$3@@%70%52%77@@@@@|@||@|@@@|@|@|@|@"])
  fun op accum_archive_contents_ind_rw x = x
    val op accum_archive_contents_ind_rw =
    DT(((("archiveAuxiliary",1),
        [("archive",[42,43]),("bool",[105])]),["DISK_THM", "cheat"]),
       [read"%33%0%50%35%1%37%5%36%28%32%27%50%32%16%34%12%36%2%31%6%32%3%35%9%37%10%36%17%32%11%50%42%44$8@%72$7@@@%42%48$6@%56%48%68%80$5@@%70%53%77@@@@%43@@%80$5@@%38%80$5@@%70%52%77@@@@@@%42%98%48$6@%43@@@%42%44$4@%72%73%80$5@@$7@@@@%49%40$3@$2@@%64%8%57%47$0@%58%54%70%52%52%52%52%53%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%69@@@@@@@@@@@@@@@@@@%40$13@$12@@%85$0@%40%59%39%79$6@@$5@@$13@@$12@@%23%14%86%26%57%45$0@%54%70%52%52%52%52%53%77@@@@@@@@@%85$1@%66%7%89$16@%84%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%52%53%52%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%52%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%53%53%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%53%53%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%53%53%52%77@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%53%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%52%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%53%53%77@@@@@@@@@%69@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%15%64%18%66%7%64%4%40%59%39$0@$13@@$21@@$20@|@%88%95$0@$1@@%69@%29$0|@@|@%90%93%54%70%52%52%52%52%53%77@@@@@@@@$0@@%62$0@@%30$0|@@|@%88%51$1@$0@@%69@%29$0|@@|@|@%87%61%69@@@@%21%13%86%22%57%45$0@%54%70%52%52%52%52%53%77@@@@@@@@@%40$19@%71%94$11@@@@%66%7%89$19@%84%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%52%53%52%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%52%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%53%53%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%53%53%77@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%52%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%52%52%52%53%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%53%53%52%77@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%53%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%53%53%53%77@@@@@@@@@%58%54%70%53%52%53%52%53%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%53%52%52%53%77@@@@@@@@@%58%54%70%53%52%52%52%52%77@@@@@@@@%58%54%70%53%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%53%52%53%52%53%77@@@@@@@@@%58%54%70%53%52%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%53%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%52%52%52%53%77@@@@@@@@@%58%54%70%52%53%53%53%52%53%77@@@@@@@@@%58%54%70%52%53%53%52%52%53%77@@@@@@@@@%58%54%70%52%52%53%52%53%53%77@@@@@@@@@%69@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%15%64%18%66%7%64%4%40%59%39$0@$16@@$24@@$23@|@%88%95$0@$1@@%69@%29$0|@@|@%90%93%54%70%52%52%52%52%53%77@@@@@@@@$0@@%62$0@@%30$0|@@|@%88%51$1@$0@@%69@%29$0|@@|@|@%87%61%58$0@$1@@@@@|@$1@||@@%40%59%39%79$9@@$8@@$16@@$15@@|@$1@||@@|@%60%79$5@@@@@@@@@$13$3@$2@%41$1@$6@@$0@@|@|@|@|@|@|@|@|@|@@$4$3@$2@$1@$0@@|@|@|@|@@%35%19%37%20%36%24%32%25$4$3@$2@$1@$0@|@|@|@|@@|@"])
  end
  val _ = DB.bindl "archiveAuxiliary"
  [("accum_archive_contents_rw",accum_archive_contents_rw,DB.Thm),
   ("accum_archive_contents_ind_rw",accum_archive_contents_ind_rw,DB.Thm)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("archiveTheory.archive_grammars",
                          archiveTheory.archive_grammars)]
  val _ = List.app (update_grms reveal) []

  val archiveAuxiliary_grammars = Parse.current_lgrms()
  end

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "archiveAuxiliary"
end
