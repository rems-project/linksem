structure string_tableTheory :> string_tableTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading string_tableTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open byte_sequenceTheory
  in end;
  val _ = Theory.link_parents
          ("string_table",
          Arbnum.fromString "1471355139",
          Arbnum.fromString "3264")
          [("byte_sequence",
           Arbnum.fromString "1471355124",
           Arbnum.fromString "333438")];
  val _ = Theory.incorporate_types "string_table" [("string_table", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("num", "num"), ID("string_table", "string_table"),
   ID("byte_sequence", "byte_sequence"), ID("pair", "prod"),
   ID("list", "list"), ID("string", "char"), ID("show", "Show_class"),
   ID("error", "error"), ID("min", "bool"), ID("ind_type", "recspace"),
   ID("bool", "!"), ID("arithmetic", "+"), ID("pair", ","),
   ID("bool", "/\\"), ID("num", "0"), ID("min", "="), ID("min", "==>"),
   ID("bool", "?"), ID("list", "APPEND"), ID("bool", "ARB"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("list", "EVERY"), ID("string", "EXPLODE"), ID("list", "FOLDR"),
   ID("error", "Fail"), ID("string", "IMPLODE"), ID("combin", "K"),
   ID("list", "LENGTH"), ID("bool", "LET"), ID("list", "MAP"),
   ID("list", "NIL"), ID("arithmetic", "NUMERAL"),
   ID("show", "Show_class_show_method_fupd"),
   ID("string_table", "Strings"), ID("error", "Success"),
   ID("bool", "TYPE_DEFINITION"), ID("pair", "UNCURRY"),
   ID("arithmetic", "ZERO"), ID("string", "char_size"),
   ID("string_table", "concat1"), ID("string_table", "empty0"),
   ID("error", "fail0"), ID("string_table", "find_string"),
   ID("option", "option"), ID("string_table", "get_base_string"),
   ID("string_table", "get_delimiting_character"),
   ID("string_table", "get_string_at"),
   ID("string_table", "insert_string"),
   ID("string_table", "instance_Show_Show_String_table_string_table_dict"),
   ID("list", "list_CASE"), ID("list", "list_size"),
   ID("string_table", "mk_string_table"), ID("option", "option_CASE"),
   ID("pair", "pair_CASE"), ID("basicSize", "pair_size"),
   ID("error", "return"), ID("string_table", "size1"),
   ID("missing_pervasives", "string_index_of"),
   ID("byte_sequence", "string_of_byte_sequence"),
   ID("missing_pervasives", "string_prefix"),
   ID("elf_local", "string_suffix"),
   ID("string_table", "string_table_CASE"),
   ID("string_table", "string_table_of_byte_sequence"),
   ID("string_table", "string_table_size")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [2], TYOP [0, 1, 0], TYOP [3], TYOP [0, 3, 1], TYV "'a",
   TYOP [6], TYOP [5, 6], TYOP [4, 6, 7], TYOP [0, 8, 5], TYOP [0, 9, 5],
   TYOP [0, 1, 10], TYOP [0, 6, 1], TYOP [0, 7, 12], TYOP [7, 1],
   TYOP [4, 0, 1], TYOP [0, 1, 15], TYOP [0, 7, 16], TYOP [8, 7],
   TYOP [0, 1, 18], TYOP [0, 0, 19], TYOP [0, 1, 6], TYOP [0, 1, 7],
   TYOP [0, 1, 5], TYOP [0, 7, 23], TYOP [8, 1], TYOP [5, 1],
   TYOP [0, 26, 25], TYOP [0, 8, 1], TYOP [9], TYOP [10, 8],
   TYOP [0, 30, 29], TYOP [0, 1, 29], TYOP [0, 1, 30], TYOP [0, 28, 29],
   TYOP [0, 3, 29], TYOP [0, 35, 29], TYOP [0, 6, 29], TYOP [0, 37, 29],
   TYOP [0, 9, 29], TYOP [0, 39, 29], TYOP [0, 31, 29], TYOP [0, 41, 29],
   TYOP [0, 32, 29], TYOP [0, 43, 29], TYOP [0, 7, 29], TYOP [0, 45, 29],
   TYOP [0, 26, 29], TYOP [0, 47, 29], TYOP [0, 0, 29], TYOP [0, 49, 29],
   TYOP [0, 8, 29], TYOP [0, 51, 29], TYOP [0, 0, 0], TYOP [0, 0, 53],
   TYOP [0, 7, 8], TYOP [0, 6, 55], TYOP [0, 0, 16], TYOP [0, 29, 29],
   TYOP [0, 29, 58], TYOP [0, 5, 29], TYOP [0, 5, 60], TYOP [0, 14, 29],
   TYOP [0, 14, 62], TYOP [0, 6, 37], TYOP [0, 18, 29], TYOP [0, 18, 65],
   TYOP [0, 25, 29], TYOP [0, 25, 67], TYOP [0, 7, 45], TYOP [0, 0, 49],
   TYOP [0, 8, 51], TYOP [0, 15, 29], TYOP [0, 15, 72], TYOP [0, 30, 31],
   TYOP [0, 1, 32], TYOP [0, 23, 29], TYOP [0, 76, 29], TYOP [0, 33, 29],
   TYOP [0, 78, 29], TYOP [0, 7, 7], TYOP [0, 7, 80], TYOP [0, 7, 5],
   TYOP [0, 7, 82], TYOP [0, 0, 6], TYOP [0, 6, 6], TYOP [0, 6, 85],
   TYOP [0, 29, 86], TYOP [0, 25, 25], TYOP [0, 25, 88], TYOP [0, 29, 89],
   TYOP [0, 6, 80], TYOP [0, 26, 26], TYOP [0, 1, 92], TYOP [0, 0, 30],
   TYOP [0, 94, 30], TYOP [0, 8, 95], TYOP [0, 0, 96], TYOP [0, 32, 47],
   TYOP [5, 7], TYOP [0, 99, 7], TYOP [0, 7, 100], TYOP [0, 81, 101],
   TYOP [0, 7, 18], TYOP [0, 22, 22], TYOP [0, 22, 104], TYOP [0, 7, 0],
   TYOP [0, 6, 18], TYOP [0, 107, 107], TYOP [0, 6, 25],
   TYOP [0, 109, 109], TYOP [0, 7, 25], TYOP [0, 111, 111],
   TYOP [0, 15, 15], TYOP [0, 113, 113], TYOP [0, 85, 80],
   TYOP [0, 26, 99], TYOP [0, 22, 116], TYOP [0, 14, 14],
   TYOP [0, 104, 118], TYOP [0, 31, 78], TYOP [0, 57, 113], TYOP [0, 6, 0],
   TYOP [51, 0], TYOP [0, 1, 123], TYOP [0, 7, 124], TYOP [0, 1, 27],
   TYOP [0, 126, 25], TYOP [0, 25, 127], TYOP [0, 26, 128],
   TYOP [0, 122, 106], TYOP [0, 103, 18], TYOP [0, 18, 131], TYOP [51, 7],
   TYOP [0, 133, 132], TYOP [0, 0, 18], TYOP [0, 135, 18],
   TYOP [0, 18, 136], TYOP [0, 123, 137], TYOP [0, 0, 15],
   TYOP [0, 139, 15], TYOP [0, 15, 140], TYOP [0, 123, 141],
   TYOP [0, 6, 82], TYOP [0, 143, 5], TYOP [0, 8, 144], TYOP [0, 7, 6],
   TYOP [0, 6, 146], TYOP [0, 147, 6], TYOP [0, 8, 148], TYOP [0, 91, 7],
   TYOP [0, 8, 150], TYOP [0, 7, 15], TYOP [0, 6, 152], TYOP [0, 153, 15],
   TYOP [0, 8, 154], TYOP [0, 8, 0], TYOP [0, 106, 156],
   TYOP [0, 122, 157], TYOP [0, 1, 25], TYOP [0, 7, 123], TYOP [0, 6, 160],
   TYOP [0, 3, 7], TYOP [0, 7, 133], TYOP [0, 0, 163], TYOP [0, 8, 6],
   TYOP [0, 165, 6], TYOP [0, 1, 166], TYOP [0, 8, 7], TYOP [0, 168, 7],
   TYOP [0, 1, 169], TYOP [0, 8, 15], TYOP [0, 171, 15], TYOP [0, 1, 172]]
  end
  val _ = Theory.incorporate_consts "string_table" tyvector
     [("string_table_size", 2), ("string_table_of_byte_sequence", 4),
      ("string_table_CASE", 11), ("size1", 2), ("mk_string_table", 13),
      ("instance_Show_Show_String_table_string_table_dict", 14),
      ("insert_string", 17), ("get_string_at", 20),
      ("get_delimiting_character", 21), ("get_base_string", 22),
      ("find_string", 24), ("empty0", 1), ("concat1", 27),
      ("Strings", 28)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'string_table'", 31), TMV("M", 1), TMV("M'", 1), TMV("P", 32),
   TMV("a", 8), TMV("a'", 8), TMV("a0", 30), TMV("base", 7), TMV("c", 6),
   TMV("delim", 6), TMV("f", 9), TMV("f'", 9), TMV("fn", 23),
   TMV("idx", 0), TMV("index", 0), TMV("inserted_idx", 0), TMV("n", 0),
   TMV("new_strtab", 1), TMV("p", 8), TMV("pos", 0), TMV("rep", 33),
   TMV("s", 7), TMV("s", 1), TMV("sep", 6), TMV("seq", 3), TMV("ss", 1),
   TMV("string_table", 34), TMV("suffix", 7), TMV("t", 1), TMV("tbl", 1),
   TMV("v", 8), TMV("x", 1), TMV("xs", 26), TMC(11, 36), TMC(11, 38),
   TMC(11, 40), TMC(11, 42), TMC(11, 44), TMC(11, 46), TMC(11, 48),
   TMC(11, 50), TMC(11, 52), TMC(11, 41), TMC(11, 43), TMC(12, 54),
   TMC(13, 56), TMC(13, 57), TMC(14, 59), TMC(15, 0), TMC(16, 61),
   TMC(16, 63), TMC(16, 59), TMC(16, 64), TMC(16, 66), TMC(16, 68),
   TMC(16, 69), TMC(16, 70), TMC(16, 71), TMC(16, 73), TMC(16, 74),
   TMC(16, 75), TMC(17, 59), TMC(18, 77), TMC(18, 79), TMC(18, 52),
   TMC(19, 81), TMC(20, 14), TMC(20, 83), TMC(21, 53), TMC(22, 53),
   TMC(23, 30), TMC(24, 84), TMC(25, 87), TMC(25, 90), TMC(26, 91),
   TMC(26, 93), TMC(27, 97), TMC(28, 58), TMC(29, 98), TMC(30, 80),
   TMC(31, 102), TMC(32, 103), TMC(33, 80), TMC(34, 105), TMC(35, 106),
   TMC(36, 108), TMC(36, 110), TMC(36, 112), TMC(36, 114), TMC(37, 115),
   TMC(37, 117), TMC(38, 7), TMC(39, 53), TMC(40, 119), TMC(41, 28),
   TMC(42, 103), TMC(43, 120), TMC(44, 121), TMC(45, 0), TMC(46, 122),
   TMC(47, 27), TMC(48, 1), TMC(49, 111), TMC(50, 24), TMC(50, 125),
   TMC(52, 22), TMC(53, 21), TMC(54, 20), TMC(55, 17), TMC(56, 14),
   TMC(57, 129), TMC(58, 130), TMC(59, 13), TMC(60, 134), TMC(60, 138),
   TMC(60, 142), TMC(61, 145), TMC(61, 149), TMC(61, 151), TMC(61, 155),
   TMC(62, 158), TMC(63, 159), TMC(64, 2), TMC(65, 161), TMC(66, 162),
   TMC(67, 164), TMC(68, 164), TMC(69, 11), TMC(69, 167), TMC(69, 170),
   TMC(69, 173), TMC(70, 4), TMC(71, 2)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op string_table_TY_DEF x = x
    val op string_table_TY_DEF =
    DT(((("string_table",0),[("bool",[26])]),["DISK_THM"]),
       [read"%63%20%96%6%36%0%61%42%6%61%64%4%59$1@%4%76%48@$0@%16%70|@|$0@@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op string_table_case_def x = x
    val op string_table_case_def =
    DT(((("string_table",4),
        [("bool",[26,180]),("ind_type",[33,34]),
         ("string_table",[1,2,3])]),["DISK_THM"]),
       [read"%41%4%35%10%49%127%94$1@@$0@@$0$1@@|@|@"])
  fun op string_table_size_def x = x
    val op string_table_size_def =
    DT(((("string_table",5),
        [("bool",[26,180]),("ind_type",[33,34]),
         ("string_table",[1,2,3])]),["DISK_THM"]),
       [read"%41%4%56%132%94$0@@@%44%92%68%98@@@%120%99@%111%99@@$0@@@|@"])
  fun op mk_string_table_def x = x
    val op mk_string_table_def =
    DT(((("string_table",12),[]),[]),
       [read"%38%7%34%23%60%112$1@$0@@%94%45$0@$1@@@|@|@"])
  fun op string_table_of_byte_sequence_def x = x
    val op string_table_of_byte_sequence_def =
    DT(((("string_table",13),[]),[]),
       [read"%33%24%60%131$0@@%112%124$0@@%71%48@@@|@"])
  fun op empty0_def x = x
    val op empty0_def =
    DT(((("string_table",14),[]),[]),
       [read"%60%101@%94%45%71%48@@%82%74%71%48@@%91@@@@@"])
  fun op get_delimiting_character_def x = x
    val op get_delimiting_character_def =
    DT(((("string_table",15),[]),[]),
       [read"%43%29%52%106$0@@%128$0@%30%117$0@%23%7$1||@|@@|@"])
  fun op get_base_string_def x = x
    val op get_base_string_def =
    DT(((("string_table",16),[]),[]),
       [read"%43%29%55%105$0@@%129$0@%30%118$0@%23%7$0||@|@@|@"])
  fun op size1_def x = x
    val op size1_def =
    DT(((("string_table",17),[]),[]),
       [read"%43%29%56%122$0@@%84%105$0@@@|@"])
  fun op concat1_def x = x
    val op concat1_def =
    DT(((("string_table",18),[]),[]),
       [read"%39%32%54%100$0@@%110$0@%121%101@@%31%32%86%9%73%78%31%52%106$0@@$1@|@%75$2@$1@@@%87%7%121%112$0@$1@@|@%80%65@%91@%90%105@%75$2@$1@@@@@%102%74%71%92%68%68%69%68%68%69%98@@@@@@@@@%74%71%92%68%68%68%68%69%69%98@@@@@@@@@%74%71%92%69%69%69%69%68%69%98@@@@@@@@@%74%71%92%68%68%69%68%68%69%98@@@@@@@@@%74%71%92%68%69%68%68%68%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%69%68%69%69%98@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%68%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%69%68%68%69%69%98@@@@@@@@@%74%71%92%68%69%68%69%68%69%98@@@@@@@@@%74%71%92%69%69%69%69%68%69%98@@@@@@@@@%74%71%92%68%68%68%69%68%69%98@@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%68%69%68%68%68%69%98@@@@@@@@@%74%71%92%69%69%68%68%68%69%98@@@@@@@@@%74%71%92%69%68%69%69%68%69%98@@@@@@@@@%74%71%92%68%69%69%68%68%69%98@@@@@@@@@%74%71%92%68%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%68%69%69%69%68%69%98@@@@@@@@@%74%71%92%68%69%69%68%69%69%98@@@@@@@@@%74%71%92%68%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%69%68%68%69%68%69%98@@@@@@@@@%74%71%92%68%69%68%68%68%69%98@@@@@@@@@%74%71%92%69%69%69%68%69%69%98@@@@@@@@@%74%71%92%68%69%69%68%68%69%98@@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%68%68%69%68%69%69%98@@@@@@@@@%74%71%92%68%69%68%68%68%69%98@@@@@@@@@%74%71%92%68%69%69%69%68%69%98@@@@@@@@@%74%71%92%68%69%69%68%68%69%98@@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%69%68%69%68%68%69%98@@@@@@@@@%74%71%92%68%69%69%68%68%69%98@@@@@@@@@%74%71%92%69%68%69%69%68%69%98@@@@@@@@@%74%71%92%68%69%68%69%68%69%98@@@@@@@@@%74%71%92%68%69%69%69%68%69%98@@@@@@@@@%74%71%92%68%69%68%69%68%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%68%69%68%69%68%69%98@@@@@@@@@%74%71%92%69%69%69%69%68%69%98@@@@@@@@@%74%71%92%68%68%68%69%68%69%98@@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%68%68%69%68%68%69%98@@@@@@@@@%74%71%92%69%68%68%69%68%69%98@@@@@@@@@%74%71%92%68%69%68%68%68%69%98@@@@@@@@@%74%71%92%69%69%68%68%69%69%98@@@@@@@@@%74%71%92%68%69%68%68%68%69%98@@@@@@@@@%74%71%92%68%68%69%68%68%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%68%69%69%68%68%69%98@@@@@@@@@%74%71%92%69%69%68%68%69%69%98@@@@@@@@@%74%71%92%68%68%69%68%69%69%98@@@@@@@@@%91@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@%106$1@@||@@|@"])
  fun op get_string_at_def x = x
    val op get_string_at_def =
    DT(((("string_table",19),[]),[]),
       [read"%40%14%43%29%53%107$1@$0@@%113%126$1@%105$0@@@%81%74%71%92%68%68%68%69%68%69%98@@@@@@@@@%74%71%92%68%69%69%68%68%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%68%68%68%68%68%69%98@@@@@@@@@%74%71%92%68%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%69%68%68%69%69%98@@@@@@@@@%74%71%92%68%69%68%69%68%69%98@@@@@@@@@%74%71%92%69%69%69%69%68%69%98@@@@@@@@@%74%71%92%68%68%68%69%68%69%98@@@@@@@@@%74%71%92%68%68%68%68%68%69%98@@@@@@@@@%74%71%92%68%69%68%68%68%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%69%68%69%69%98@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%68%69%68%69%68%69%98@@@@@@@@@%74%71%92%69%69%69%69%68%69%98@@@@@@@@@%74%71%92%69%68%69%68%68%69%98@@@@@@@@@%74%71%92%68%69%69%68%68%69%98@@@@@@@@@%74%71%92%69%68%68%69%69%69%98@@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%68%68%68%68%69%69%98@@@@@@@@@%74%71%92%68%69%69%68%69%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%68%68%68%68%69%69%98@@@@@@@@@%74%71%92%69%69%69%68%68%69%98@@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%69%69%68%68%69%69%98@@@@@@@@@%74%71%92%68%69%68%68%68%69%98@@@@@@@@@%74%71%92%69%69%69%69%68%69%98@@@@@@@@@%74%71%92%68%68%68%69%68%69%98@@@@@@@@@%74%71%92%68%69%69%68%68%69%98@@@@@@@@@%91@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%27%85%9%114%123$0@$1@@%95$1@@%13%113%125$0@$2@@%81%74%71%92%68%68%68%69%68%69%98@@@@@@@@@%74%71%92%68%69%69%68%68%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%68%68%68%68%68%69%98@@@@@@@@@%74%71%92%68%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%69%68%68%69%69%98@@@@@@@@@%74%71%92%68%69%68%69%68%69%98@@@@@@@@@%74%71%92%69%69%69%69%68%69%98@@@@@@@@@%74%71%92%68%68%68%69%68%69%98@@@@@@@@@%74%71%92%68%68%68%68%68%69%98@@@@@@@@@%74%71%92%68%69%68%68%68%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%69%68%69%69%98@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%68%69%68%69%68%69%98@@@@@@@@@%74%71%92%69%69%69%69%68%69%98@@@@@@@@@%74%71%92%69%68%69%68%68%69%98@@@@@@@@@%74%71%92%68%69%69%68%68%69%98@@@@@@@@@%74%71%92%69%68%68%69%69%69%98@@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%68%68%68%68%69%69%98@@@@@@@@@%74%71%92%68%69%69%68%69%69%98@@@@@@@@@%74%71%92%69%68%69%68%69%69%98@@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%68%68%68%68%69%69%98@@@@@@@@@%74%71%92%69%69%69%68%68%69%98@@@@@@@@@%74%71%92%69%68%68%68%68%98@@@@@@@@%74%71%92%69%69%68%68%69%69%98@@@@@@@@@%74%71%92%68%69%68%68%68%69%98@@@@@@@@@%74%71%92%69%69%69%69%68%69%98@@@@@@@@@%74%71%92%68%68%68%69%68%69%98@@@@@@@@@%74%71%92%68%69%69%68%68%69%98@@@@@@@@@%91@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%21%95$0@|@|@|@%106$1@@|@@|@|@"])
  fun op find_string_def x = x
    val op find_string_def =
    DT(((("string_table",20),[]),[]),
       [read"%38%21%43%28%49%103$1@$0@@%127$0@%30%116$0@%9%7%67%65$4@%82%74$1@%91@@@@$0@||@|@@|@|@"])
  fun op insert_string_def x = x
    val op insert_string_def =
    DT(((("string_table",21),[]),[]),
       [read"%38%21%43%28%58%108$1@$0@@%88%97%15%17%46$1@$0@||@@%115%104$1@$0@@%130$0@%30%119$0@%9%7%46%84$0@@%94%45$1@%65$0@%65$4@%82%74$1@%91@@@@@@@||@|@@%19%46$0@$1@|@@@|@|@"])
  fun op instance_Show_Show_String_table_string_table_dict_def x = x
    val op instance_Show_Show_String_table_string_table_dict_def =
    DT(((("string_table",22),[]),[]),
       [read"%50%109@%93%83%29%82%89%8%72%52$0@%71%48@@@%71%92%69%69%68%98@@@@@@$0@|@%79%105$0@@@@|@@%66@@"])
  fun op datatype_string_table x = x
    val op datatype_string_table =
    DT(((("string_table",6),[("bool",[25,170])]),["DISK_THM"]),
       [read"%77%26%94@@"])
  fun op string_table_11 x = x
    val op string_table_11 =
    DT(((("string_table",7),
        [("bool",[26,55,62,180]),("ind_type",[33,34]),
         ("string_table",[1,2,3])]),["DISK_THM"]),
       [read"%41%4%41%5%51%60%94$1@@%94$0@@@%57$1@$0@@|@|@"])
  fun op string_table_case_cong x = x
    val op string_table_case_cong =
    DT(((("string_table",8),
        [("bool",[26,180]),("string_table",[1,2,3,4])]),["DISK_THM"]),
       [read"%43%1%43%2%35%10%61%47%60$2@$1@@%41%4%61%60$2@%94$0@@@%49$1$0@@%11$0@@@|@@@%49%127$2@$0@@%127$1@%11@@@|@|@|@"])
  fun op string_table_nchotomy x = x
    val op string_table_nchotomy =
    DT(((("string_table",9),
        [("bool",[26,180]),("string_table",[1,2,3])]),["DISK_THM"]),
       [read"%43%25%64%18%60$1@%94$0@@|@|@"])
  fun op string_table_Axiom x = x
    val op string_table_Axiom =
    DT(((("string_table",10),
        [("bool",[26,180]),("ind_type",[33,34]),
         ("string_table",[1,2,3])]),["DISK_THM"]),
       [read"%35%10%62%12%41%4%49$1%94$0@@@$2$0@@|@|@|@"])
  fun op string_table_induction x = x
    val op string_table_induction =
    DT(((("string_table",11),
        [("bool",[26]),("string_table",[1,2,3])]),["DISK_THM"]),
       [read"%37%3%61%41%18$1%94$0@@|@@%43%22$1$0@|@@|@"])
  end
  val _ = DB.bindl "string_table"
  [("string_table_TY_DEF",string_table_TY_DEF,DB.Def),
   ("string_table_case_def",string_table_case_def,DB.Def),
   ("string_table_size_def",string_table_size_def,DB.Def),
   ("mk_string_table_def",mk_string_table_def,DB.Def),
   ("string_table_of_byte_sequence_def",
    string_table_of_byte_sequence_def,
    DB.Def), ("empty0_def",empty0_def,DB.Def),
   ("get_delimiting_character_def",get_delimiting_character_def,DB.Def),
   ("get_base_string_def",get_base_string_def,DB.Def),
   ("size1_def",size1_def,DB.Def), ("concat1_def",concat1_def,DB.Def),
   ("get_string_at_def",get_string_at_def,DB.Def),
   ("find_string_def",find_string_def,DB.Def),
   ("insert_string_def",insert_string_def,DB.Def),
   ("instance_Show_Show_String_table_string_table_dict_def",
    instance_Show_Show_String_table_string_table_dict_def,
    DB.Def), ("datatype_string_table",datatype_string_table,DB.Thm),
   ("string_table_11",string_table_11,DB.Thm),
   ("string_table_case_cong",string_table_case_cong,DB.Thm),
   ("string_table_nchotomy",string_table_nchotomy,DB.Thm),
   ("string_table_Axiom",string_table_Axiom,DB.Thm),
   ("string_table_induction",string_table_induction,DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("byte_sequenceTheory.byte_sequence_grammars",
                          byte_sequenceTheory.byte_sequence_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms temp_add_type "string_table"
  val _ = update_grms temp_add_type "string_table"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Strings", (Term.prim_mk_const { Name = "Strings", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Strings", (Term.prim_mk_const { Name = "Strings", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_table_CASE", (Term.prim_mk_const { Name = "string_table_CASE", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_table_size", (Term.prim_mk_const { Name = "string_table_size", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mk_string_table", (Term.prim_mk_const { Name = "mk_string_table", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("mk_string_table", (Term.prim_mk_const { Name = "mk_string_table", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_table_of_byte_sequence", (Term.prim_mk_const { Name = "string_table_of_byte_sequence", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_table_of_byte_sequence", (Term.prim_mk_const { Name = "string_table_of_byte_sequence", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("empty0", (Term.prim_mk_const { Name = "empty0", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("empty0", (Term.prim_mk_const { Name = "empty0", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_delimiting_character", (Term.prim_mk_const { Name = "get_delimiting_character", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_delimiting_character", (Term.prim_mk_const { Name = "get_delimiting_character", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_base_string", (Term.prim_mk_const { Name = "get_base_string", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_base_string", (Term.prim_mk_const { Name = "get_base_string", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("size1", (Term.prim_mk_const { Name = "size1", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("size1", (Term.prim_mk_const { Name = "size1", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("concat1", (Term.prim_mk_const { Name = "concat1", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("concat1", (Term.prim_mk_const { Name = "concat1", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_string_at", (Term.prim_mk_const { Name = "get_string_at", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_string_at", (Term.prim_mk_const { Name = "get_string_at", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("find_string", (Term.prim_mk_const { Name = "find_string", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("find_string", (Term.prim_mk_const { Name = "find_string", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("insert_string", (Term.prim_mk_const { Name = "insert_string", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("insert_string", (Term.prim_mk_const { Name = "insert_string", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_String_table_string_table_dict", (Term.prim_mk_const { Name = "instance_Show_Show_String_table_string_table_dict", Thy = "string_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_String_table_string_table_dict", (Term.prim_mk_const { Name = "instance_Show_Show_String_table_string_table_dict", Thy = "string_table"}))
  val string_table_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG string_table_Axiom,
           case_def=string_table_case_def,
           case_cong=string_table_case_cong,
           induction=ORIG string_table_induction,
           nchotomy=string_table_nchotomy,
           size=SOME(Parse.Term`(string_table$string_table_size) :(string_table$string_table) -> (num$num)`,
                     ORIG string_table_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME string_table_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "string_table",
    thydataty = "compute",
    data =
        "string_table.mk_string_table_def string_table.size1_def string_table.instance_Show_Show_String_table_string_table_dict_def string_table.insert_string_def string_table.find_string_def string_table.get_string_at_def string_table.concat1_def string_table.string_table_of_byte_sequence_def string_table.get_base_string_def string_table.get_delimiting_character_def string_table.empty0_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "string_table"
end
