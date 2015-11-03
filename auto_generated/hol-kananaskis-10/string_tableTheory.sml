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
          Arbnum.fromString "1445438794",
          Arbnum.fromString "925999")
          [("byte_sequence",
           Arbnum.fromString "1445438726",
           Arbnum.fromString "742620")];
  val _ = Theory.incorporate_types "string_table" [("string_table", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("num", "num"), ID("string_table", "string_table"),
   ID("byte_sequence", "byte_sequence"), ID("pair", "prod"),
   ID("list", "list"), ID("string", "char"), ID("error", "error"),
   ID("min", "bool"), ID("ind_type", "recspace"), ID("bool", "!"),
   ID("arithmetic", "+"), ID("pair", ","), ID("bool", "/\\"),
   ID("num", "0"), ID("min", "="), ID("min", "==>"), ID("bool", "?"),
   ID("list", "APPEND"), ID("bool", "ARB"), ID("option", "option"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("list", "EVERY"), ID("list", "FOLDR"), ID("error", "Fail"),
   ID("string", "IMPLODE"), ID("list", "LENGTH"), ID("bool", "LET"),
   ID("list", "MAP"), ID("list", "NIL"), ID("arithmetic", "NUMERAL"),
   ID("string_table", "Strings"), ID("error", "Success"),
   ID("bool", "TYPE_DEFINITION"), ID("arithmetic", "ZERO"),
   ID("string", "char_size"), ID("string_table", "concat1"),
   ID("string_table", "empty0"), ID("error", "fail0"),
   ID("string_table", "find_string"),
   ID("string_table", "get_base_string"),
   ID("string_table", "get_delimiting_character"),
   ID("string_table", "get_string_at"),
   ID("string_table", "insert_string"), ID("list", "list_CASE"),
   ID("list", "list_size"), ID("string_table", "mk_string_table"),
   ID("option", "option_CASE"), ID("pair", "pair_CASE"),
   ID("basicSize", "pair_size"), ID("error", "return"),
   ID("missing_pervasives", "string_index_of"),
   ID("byte_sequence", "string_of_byte_sequence"),
   ID("missing_pervasives", "string_prefix"),
   ID("string_table", "string_table_CASE"),
   ID("string_table", "string_table_of_byte_sequence"),
   ID("string_table", "string_table_size")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [2], TYOP [0, 1, 0], TYOP [3], TYOP [0, 3, 1], TYV "'a",
   TYOP [6], TYOP [5, 6], TYOP [4, 6, 7], TYOP [0, 8, 5], TYOP [0, 9, 5],
   TYOP [0, 1, 10], TYOP [0, 6, 1], TYOP [0, 7, 12], TYOP [4, 0, 1],
   TYOP [0, 1, 14], TYOP [0, 7, 15], TYOP [7, 7], TYOP [0, 1, 17],
   TYOP [0, 5, 18], TYOP [0, 1, 6], TYOP [0, 1, 7], TYOP [0, 1, 5],
   TYOP [0, 7, 22], TYOP [7, 1], TYOP [5, 1], TYOP [0, 25, 24],
   TYOP [0, 8, 1], TYOP [8], TYOP [9, 8], TYOP [0, 29, 28],
   TYOP [0, 1, 28], TYOP [0, 1, 29], TYOP [0, 27, 28], TYOP [0, 5, 28],
   TYOP [0, 34, 28], TYOP [0, 3, 28], TYOP [0, 36, 28], TYOP [0, 6, 28],
   TYOP [0, 38, 28], TYOP [0, 9, 28], TYOP [0, 40, 28], TYOP [0, 30, 28],
   TYOP [0, 42, 28], TYOP [0, 31, 28], TYOP [0, 44, 28], TYOP [0, 7, 28],
   TYOP [0, 46, 28], TYOP [0, 25, 28], TYOP [0, 48, 28], TYOP [0, 8, 28],
   TYOP [0, 50, 28], TYOP [0, 0, 0], TYOP [0, 0, 52], TYOP [0, 7, 8],
   TYOP [0, 6, 54], TYOP [0, 0, 15], TYOP [0, 28, 28], TYOP [0, 28, 57],
   TYOP [0, 5, 34], TYOP [0, 6, 38], TYOP [0, 17, 28], TYOP [0, 17, 61],
   TYOP [0, 24, 28], TYOP [0, 24, 63], TYOP [0, 7, 46], TYOP [0, 0, 28],
   TYOP [0, 0, 66], TYOP [0, 8, 50], TYOP [0, 14, 28], TYOP [0, 14, 69],
   TYOP [0, 29, 30], TYOP [0, 1, 31], TYOP [0, 22, 28], TYOP [0, 73, 28],
   TYOP [0, 32, 28], TYOP [0, 75, 28], TYOP [0, 7, 7], TYOP [0, 7, 77],
   TYOP [20, 7], TYOP [0, 7, 79], TYOP [0, 5, 80], TYOP [0, 7, 5],
   TYOP [0, 7, 82], TYOP [0, 0, 6], TYOP [0, 24, 24], TYOP [0, 24, 85],
   TYOP [0, 28, 86], TYOP [0, 6, 77], TYOP [0, 25, 25], TYOP [0, 1, 89],
   TYOP [0, 0, 29], TYOP [0, 91, 29], TYOP [0, 8, 92], TYOP [0, 0, 93],
   TYOP [0, 31, 48], TYOP [5, 7], TYOP [0, 96, 7], TYOP [0, 7, 97],
   TYOP [0, 78, 98], TYOP [0, 7, 17], TYOP [0, 7, 0], TYOP [0, 6, 17],
   TYOP [0, 102, 102], TYOP [0, 6, 24], TYOP [0, 104, 104],
   TYOP [0, 7, 24], TYOP [0, 106, 106], TYOP [0, 25, 96],
   TYOP [0, 21, 108], TYOP [0, 30, 75], TYOP [0, 6, 0], TYOP [20, 0],
   TYOP [0, 1, 112], TYOP [0, 7, 113], TYOP [0, 1, 26], TYOP [0, 115, 24],
   TYOP [0, 24, 116], TYOP [0, 25, 117], TYOP [0, 111, 101],
   TYOP [0, 100, 17], TYOP [0, 17, 120], TYOP [0, 79, 121],
   TYOP [0, 0, 17], TYOP [0, 123, 17], TYOP [0, 17, 124],
   TYOP [0, 112, 125], TYOP [0, 0, 14], TYOP [0, 127, 14],
   TYOP [0, 14, 128], TYOP [0, 112, 129], TYOP [0, 6, 82],
   TYOP [0, 131, 5], TYOP [0, 8, 132], TYOP [0, 7, 6], TYOP [0, 6, 134],
   TYOP [0, 135, 6], TYOP [0, 8, 136], TYOP [0, 88, 7], TYOP [0, 8, 138],
   TYOP [0, 7, 14], TYOP [0, 6, 140], TYOP [0, 141, 14], TYOP [0, 8, 142],
   TYOP [0, 8, 0], TYOP [0, 101, 144], TYOP [0, 111, 145], TYOP [0, 1, 24],
   TYOP [0, 7, 112], TYOP [0, 6, 148], TYOP [0, 3, 7], TYOP [0, 0, 80],
   TYOP [0, 8, 6], TYOP [0, 152, 6], TYOP [0, 1, 153], TYOP [0, 8, 7],
   TYOP [0, 155, 7], TYOP [0, 1, 156], TYOP [0, 8, 14], TYOP [0, 158, 14],
   TYOP [0, 1, 159]]
  end
  val _ = Theory.incorporate_consts "string_table" tyvector
     [("string_table_size", 2), ("string_table_of_byte_sequence", 4),
      ("string_table_CASE", 11), ("mk_string_table", 13),
      ("insert_string", 16), ("get_string_at", 19),
      ("get_delimiting_character", 20), ("get_base_string", 21),
      ("find_string", 23), ("empty0", 1), ("concat1", 26),
      ("Strings", 27)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'string_table'", 30), TMV("M", 1), TMV("M'", 1), TMV("P", 31),
   TMV("a", 8), TMV("a'", 8), TMV("a0", 29), TMV("base", 7),
   TMV("delim", 6), TMV("f", 9), TMV("f'", 9), TMV("fn", 22),
   TMV("idx", 0), TMV("index", 5), TMV("n", 0), TMV("p", 8), TMV("pos", 0),
   TMV("rep", 32), TMV("s", 7), TMV("s", 1), TMV("sep", 6), TMV("seq", 3),
   TMV("ss", 1), TMV("string_table", 33), TMV("suffix", 7), TMV("t", 1),
   TMV("tbl", 1), TMV("v", 8), TMV("x", 1), TMV("xs", 25), TMC(10, 35),
   TMC(10, 37), TMC(10, 39), TMC(10, 41), TMC(10, 43), TMC(10, 45),
   TMC(10, 47), TMC(10, 49), TMC(10, 51), TMC(10, 42), TMC(10, 44),
   TMC(11, 53), TMC(12, 55), TMC(12, 56), TMC(13, 58), TMC(14, 0),
   TMC(15, 59), TMC(15, 58), TMC(15, 60), TMC(15, 62), TMC(15, 64),
   TMC(15, 65), TMC(15, 67), TMC(15, 68), TMC(15, 70), TMC(15, 71),
   TMC(15, 72), TMC(16, 58), TMC(17, 74), TMC(17, 76), TMC(17, 51),
   TMC(18, 78), TMC(19, 81), TMC(19, 83), TMC(21, 52), TMC(22, 52),
   TMC(23, 29), TMC(24, 84), TMC(25, 87), TMC(26, 88), TMC(26, 90),
   TMC(27, 94), TMC(28, 57), TMC(29, 95), TMC(30, 99), TMC(31, 100),
   TMC(32, 77), TMC(33, 101), TMC(34, 103), TMC(34, 105), TMC(34, 107),
   TMC(35, 109), TMC(36, 7), TMC(37, 52), TMC(38, 27), TMC(39, 100),
   TMC(40, 110), TMC(41, 0), TMC(42, 111), TMC(43, 26), TMC(44, 1),
   TMC(45, 106), TMC(46, 23), TMC(46, 114), TMC(47, 21), TMC(48, 20),
   TMC(49, 19), TMC(50, 16), TMC(51, 118), TMC(52, 119), TMC(53, 13),
   TMC(54, 122), TMC(54, 126), TMC(54, 130), TMC(55, 133), TMC(55, 137),
   TMC(55, 139), TMC(55, 143), TMC(56, 146), TMC(57, 147), TMC(58, 149),
   TMC(59, 150), TMC(60, 151), TMC(61, 11), TMC(61, 154), TMC(61, 157),
   TMC(61, 160), TMC(62, 4), TMC(63, 2)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op string_table_TY_DEF x = x
    val op string_table_TY_DEF =
    DT(((("string_table",0),[("bool",[26])]),["DISK_THM"]),
       [read"%59%17%86%6%34%0%57%39%6%57%60%4%55$1@%4%71%45@$0@%14%66|@|$0@@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op string_table_case_def x = x
    val op string_table_case_def =
    DT(((("string_table",4),
        [("bool",[26,181]),("ind_type",[33,34]),
         ("string_table",[1,2,3])]),["DISK_THM"]),
       [read"%38%4%33%9%46%113%84$1@@$0@@$0$1@@|@|@"])
  fun op string_table_size_def x = x
    val op string_table_size_def =
    DT(((("string_table",5),
        [("bool",[26,181]),("ind_type",[33,34]),
         ("string_table",[1,2,3])]),["DISK_THM"]),
       [read"%38%4%52%118%84$0@@@%41%83%64%87@@@%108%88@%99%88@@$0@@@|@"])
  fun op mk_string_table_def x = x
    val op mk_string_table_def =
    DT(((("string_table",12),[]),[]),
       [read"%36%7%32%20%56%100$1@$0@@%84%42$0@$1@@@|@|@"])
  fun op string_table_of_byte_sequence_def x = x
    val op string_table_of_byte_sequence_def =
    DT(((("string_table",13),[]),[]),
       [read"%31%21%56%117$0@@%100%111$0@@%67%45@@@|@"])
  fun op empty0_def x = x
    val op empty0_def =
    DT(((("string_table",14),[]),[]), [read"%56%90@%84%42%67%45@@%82@@@"])
  fun op get_delimiting_character_def x = x
    val op get_delimiting_character_def =
    DT(((("string_table",15),[]),[]),
       [read"%40%26%48%95$0@@%114$0@%27%105$0@%20%7$1||@|@@|@"])
  fun op get_base_string_def x = x
    val op get_base_string_def =
    DT(((("string_table",16),[]),[]),
       [read"%40%26%51%94$0@@%115$0@%27%106$0@%20%7$0||@|@@|@"])
  fun op concat1_def x = x
    val op concat1_def =
    DT(((("string_table",17),[]),[]),
       [read"%37%29%50%89$0@@%98$0@%109%90@@%28%29%79%8%68%73%28%48%95$0@@$1@|@%70$2@$1@@@%80%7%109%100$0@$1@@|@%74%61@%82@%81%94@%70$2@$1@@@@@%91%69%67%83%64%64%65%64%64%65%87@@@@@@@@@%69%67%83%64%64%64%64%65%65%87@@@@@@@@@%69%67%83%65%65%65%65%64%65%87@@@@@@@@@%69%67%83%64%64%65%64%64%65%87@@@@@@@@@%69%67%83%64%65%64%64%64%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%65%64%65%65%87@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%64%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%65%64%64%65%65%87@@@@@@@@@%69%67%83%64%65%64%65%64%65%87@@@@@@@@@%69%67%83%65%65%65%65%64%65%87@@@@@@@@@%69%67%83%64%64%64%65%64%65%87@@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%64%65%64%64%64%65%87@@@@@@@@@%69%67%83%65%65%64%64%64%65%87@@@@@@@@@%69%67%83%65%64%65%65%64%65%87@@@@@@@@@%69%67%83%64%65%65%64%64%65%87@@@@@@@@@%69%67%83%64%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%64%65%65%65%64%65%87@@@@@@@@@%69%67%83%64%65%65%64%65%65%87@@@@@@@@@%69%67%83%64%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%65%64%64%65%64%65%87@@@@@@@@@%69%67%83%64%65%64%64%64%65%87@@@@@@@@@%69%67%83%65%65%65%64%65%65%87@@@@@@@@@%69%67%83%64%65%65%64%64%65%87@@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%64%64%65%64%65%65%87@@@@@@@@@%69%67%83%64%65%64%64%64%65%87@@@@@@@@@%69%67%83%64%65%65%65%64%65%87@@@@@@@@@%69%67%83%64%65%65%64%64%65%87@@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%65%64%65%64%64%65%87@@@@@@@@@%69%67%83%64%65%65%64%64%65%87@@@@@@@@@%69%67%83%65%64%65%65%64%65%87@@@@@@@@@%69%67%83%64%65%64%65%64%65%87@@@@@@@@@%69%67%83%64%65%65%65%64%65%87@@@@@@@@@%69%67%83%64%65%64%65%64%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%64%65%64%65%64%65%87@@@@@@@@@%69%67%83%65%65%65%65%64%65%87@@@@@@@@@%69%67%83%64%64%64%65%64%65%87@@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%64%64%65%64%64%65%87@@@@@@@@@%69%67%83%65%64%64%65%64%65%87@@@@@@@@@%69%67%83%64%65%64%64%64%65%87@@@@@@@@@%69%67%83%65%65%64%64%65%65%87@@@@@@@@@%69%67%83%64%65%64%64%64%65%87@@@@@@@@@%69%67%83%64%64%65%64%64%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%64%65%65%64%64%65%87@@@@@@@@@%69%67%83%65%65%64%64%65%65%87@@@@@@@@@%69%67%83%64%64%65%64%65%65%87@@@@@@@@@%82@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@%95$1@@||@@|@"])
  fun op get_string_at_def x = x
    val op get_string_at_def =
    DT(((("string_table",18),[]),[]),
       [read"%30%13%40%26%49%96$1@$0@@%101%62$1@%94$0@@@%75%69%67%83%64%64%64%65%64%65%87@@@@@@@@@%69%67%83%64%65%65%64%64%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%64%64%64%64%64%65%87@@@@@@@@@%69%67%83%64%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%65%64%64%65%65%87@@@@@@@@@%69%67%83%64%65%64%65%64%65%87@@@@@@@@@%69%67%83%65%65%65%65%64%65%87@@@@@@@@@%69%67%83%64%64%64%65%64%65%87@@@@@@@@@%69%67%83%64%64%64%64%64%65%87@@@@@@@@@%69%67%83%64%65%64%64%64%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%65%64%65%65%87@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%64%65%64%65%64%65%87@@@@@@@@@%69%67%83%65%65%65%65%64%65%87@@@@@@@@@%69%67%83%65%64%65%64%64%65%87@@@@@@@@@%69%67%83%64%65%65%64%64%65%87@@@@@@@@@%69%67%83%65%64%64%65%65%65%87@@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%64%64%64%64%65%65%87@@@@@@@@@%69%67%83%64%65%65%64%65%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%64%64%64%64%65%65%87@@@@@@@@@%69%67%83%65%65%65%64%64%65%87@@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%65%65%64%64%65%65%87@@@@@@@@@%69%67%83%64%65%64%64%64%65%87@@@@@@@@@%69%67%83%65%65%65%65%64%65%87@@@@@@@@@%69%67%83%64%64%64%65%64%65%87@@@@@@@@@%69%67%83%64%65%65%64%64%65%87@@@@@@@@@%82@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%24%78%8%102%110$0@$1@@%85$1@@%12%101%112$0@$2@@%75%69%67%83%64%64%64%65%64%65%87@@@@@@@@@%69%67%83%64%65%65%64%64%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%64%64%64%64%64%65%87@@@@@@@@@%69%67%83%64%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%65%64%64%65%65%87@@@@@@@@@%69%67%83%64%65%64%65%64%65%87@@@@@@@@@%69%67%83%65%65%65%65%64%65%87@@@@@@@@@%69%67%83%64%64%64%65%64%65%87@@@@@@@@@%69%67%83%64%64%64%64%64%65%87@@@@@@@@@%69%67%83%64%65%64%64%64%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%65%64%65%65%87@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%64%65%64%65%64%65%87@@@@@@@@@%69%67%83%65%65%65%65%64%65%87@@@@@@@@@%69%67%83%65%64%65%64%64%65%87@@@@@@@@@%69%67%83%64%65%65%64%64%65%87@@@@@@@@@%69%67%83%65%64%64%65%65%65%87@@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%64%64%64%64%65%65%87@@@@@@@@@%69%67%83%64%65%65%64%65%65%87@@@@@@@@@%69%67%83%65%64%65%64%65%65%87@@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%64%64%64%64%65%65%87@@@@@@@@@%69%67%83%65%65%65%64%64%65%87@@@@@@@@@%69%67%83%65%64%64%64%64%87@@@@@@@@%69%67%83%65%65%64%64%65%65%87@@@@@@@@@%69%67%83%64%65%64%64%64%65%87@@@@@@@@@%69%67%83%65%65%65%65%64%65%87@@@@@@@@@%69%67%83%64%64%64%65%64%65%87@@@@@@@@@%69%67%83%64%65%65%64%64%65%87@@@@@@@@@%82@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%18%85$0@|@|@|@%95$1@@|@@|@|@"])
  fun op find_string_def x = x
    val op find_string_def =
    DT(((("string_table",19),[]),[]),
       [read"%36%18%40%25%46%92$1@$0@@%113$0@%27%104$0@%8%7%63%61$4@%76%69$1@%82@@@@$0@||@|@@|@|@"])
  fun op insert_string_def x = x
    val op insert_string_def =
    DT(((("string_table",20),[]),[]),
       [read"%36%18%40%25%54%97$1@$0@@%103%93$1@$0@@%116$0@%27%107$0@%8%7%43%41%83%64%87@@@%77$0@@@%84%42$1@%61$0@%61%76%69$1@%82@@@$4@@@@@||@|@@%16%43$0@$1@|@@|@|@"])
  fun op datatype_string_table x = x
    val op datatype_string_table =
    DT(((("string_table",6),[("bool",[25,171])]),["DISK_THM"]),
       [read"%72%23%84@@"])
  fun op string_table_11 x = x
    val op string_table_11 =
    DT(((("string_table",7),
        [("bool",[26,56,63,181]),("ind_type",[33,34]),
         ("string_table",[1,2,3])]),["DISK_THM"]),
       [read"%38%4%38%5%47%56%84$1@@%84$0@@@%53$1@$0@@|@|@"])
  fun op string_table_case_cong x = x
    val op string_table_case_cong =
    DT(((("string_table",8),
        [("bool",[26,181]),("string_table",[1,2,3,4])]),["DISK_THM"]),
       [read"%40%1%40%2%33%9%57%44%56$2@$1@@%38%4%57%56$2@%84$0@@@%46$1$0@@%10$0@@@|@@@%46%113$2@$0@@%113$1@%10@@@|@|@|@"])
  fun op string_table_nchotomy x = x
    val op string_table_nchotomy =
    DT(((("string_table",9),
        [("bool",[26,181]),("string_table",[1,2,3])]),["DISK_THM"]),
       [read"%40%22%60%15%56$1@%84$0@@|@|@"])
  fun op string_table_Axiom x = x
    val op string_table_Axiom =
    DT(((("string_table",10),
        [("bool",[26,181]),("ind_type",[33,34]),
         ("string_table",[1,2,3])]),["DISK_THM"]),
       [read"%33%9%58%11%38%4%46$1%84$0@@@$2$0@@|@|@|@"])
  fun op string_table_induction x = x
    val op string_table_induction =
    DT(((("string_table",11),
        [("bool",[26]),("string_table",[1,2,3])]),["DISK_THM"]),
       [read"%35%3%57%38%15$1%84$0@@|@@%40%19$1$0@|@@|@"])
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
   ("concat1_def",concat1_def,DB.Def),
   ("get_string_at_def",get_string_at_def,DB.Def),
   ("find_string_def",find_string_def,DB.Def),
   ("insert_string_def",insert_string_def,DB.Def),
   ("datatype_string_table",datatype_string_table,DB.Thm),
   ("string_table_11",string_table_11,DB.Thm),
   ("string_table_case_cong",string_table_case_cong,DB.Thm),
   ("string_table_nchotomy",string_table_nchotomy,DB.Thm),
   ("string_table_Axiom",string_table_Axiom,DB.Thm),
   ("string_table_induction",string_table_induction,DB.Thm)]

  local open Portable GrammarSpecials Parse
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
        "string_table.mk_string_table_def string_table.string_table_of_byte_sequence_def string_table.insert_string_def string_table.find_string_def string_table.get_string_at_def string_table.concat1_def string_table.get_base_string_def string_table.get_delimiting_character_def string_table.empty0_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "string_table"
end
