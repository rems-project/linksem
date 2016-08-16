structure byte_sequenceTheory :> byte_sequenceTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading byte_sequenceTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open errorTheory missing_pervasivesTheory
  in end;
  val _ = Theory.link_parents
          ("byte_sequence",
          Arbnum.fromString "1471355124",
          Arbnum.fromString "333438")
          [("missing_pervasives",
           Arbnum.fromString "1471355106",
           Arbnum.fromString "934043"),
           ("error",
           Arbnum.fromString "1471355106",
           Arbnum.fromString "956631")];
  val _ = Theory.incorporate_types "byte_sequence" [("byte_sequence", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("byte_sequence", "byte_sequence"),
   ID("num", "num"), ID("error", "error"), ID("list", "list"),
   ID("string", "char"), ID("pair", "prod"), ID("fcp", "cart"),
   ID("fcp", "bit0"), ID("one", "one"), ID("min", "bool"),
   ID("show", "Show_class"), ID("lem_basic_classes", "Ord_class"),
   ID("lem_basic_classes", "ordering"), ID("ind_type", "recspace"),
   ID("bool", "!"), ID("arithmetic", "+"), ID("pair", ","),
   ID("arithmetic", "-"), ID("bool", "/\\"), ID("num", "0"),
   ID("min", "="), ID("min", "==>"), ID("arithmetic", ">="),
   ID("bool", "?"), ID("min", "@"), ID("list", "APPEND"),
   ID("bool", "ARB"), ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("lem_basic_classes", "EQ"), ID("bool", "F"), ID("list", "FLAT"),
   ID("lem_basic_classes", "GT"), ID("combin", "I"),
   ID("string", "IMPLODE"), ID("combin", "K"), ID("list", "LENGTH"),
   ID("bool", "LET"), ID("lem_basic_classes", "LT"), ID("list", "MAP"),
   ID("list", "NIL"), ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("num", "SUC"), ID("byte_sequence", "Sequence"),
   ID("show", "Show_class_show_method_fupd"), ID("bool", "T"),
   ID("bool", "TYPE_DEFINITION"), ID("pair", "UNCURRY"),
   ID("relation", "WF"), ID("relation", "WFREC"), ID("arithmetic", "ZERO"),
   ID("bool", "\\/"), ID("byte_sequence", "byte_list_of_byte_sequence"),
   ID("byte_sequence", "byte_sequence_CASE"),
   ID("byte_sequence", "byte_sequence_size"),
   ID("missing_pervasives", "compare_byte"),
   ID("byte_sequence", "compare_byte_sequence"),
   ID("byte_sequence", "concat0"), ID("byte_sequence", "create"),
   ID("byte_sequence", "dropbytes"), ID("byte_sequence", "empty"),
   ID("byte_sequence", "equal"), ID("error", "error_bind"),
   ID("error", "fail0"), ID("byte_sequence", "from_byte_lists"),
   ID("byte_sequence", "instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict"),
   ID("byte_sequence", "instance_Show_Show_Byte_sequence_byte_sequence_dict"),
   ID("missing_pervasives", "length"), ID("byte_sequence", "length0"),
   ID("lem_list", "lexicographic_compare"), ID("list", "list_CASE"),
   ID("list", "list_size"),
   ID("missing_pervasives", "list_take_with_accum"), ID("words", "n2w"),
   ID("missing_pervasives", "naturalZero"), ID("arithmetic", "num_CASE"),
   ID("combin", "o"), ID("byte_sequence", "offset_and_cut"),
   ID("pair", "pair_CASE"), ID("byte_sequence", "partition0"),
   ID("byte_sequence", "partition_with_length"),
   ID("byte_sequence", "read_2_bytes_be"),
   ID("byte_sequence", "read_2_bytes_le"),
   ID("byte_sequence", "read_4_bytes_be"),
   ID("byte_sequence", "read_4_bytes_le"),
   ID("byte_sequence", "read_8_bytes_be"),
   ID("byte_sequence", "read_8_bytes_le"),
   ID("byte_sequence", "read_char"), ID("byte_sequence", "repeat"),
   ID("byte_sequence", "repeat'"), ID("error", "return"),
   ID("byte_sequence", "string_of_byte_sequence"),
   ID("byte_sequence", "takebytes"),
   ID("byte_sequence", "takebytes_r_with_length"),
   ID("byte_sequence", "takebytes_with_length"), ID("words", "w2n"),
   ID("byte_sequence", "zero_pad_to_length"), ID("byte_sequence", "zeros"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [2], TYOP [0, 1, 0], TYOP [0, 0, 0], TYOP [0, 1, 3],
   TYOP [3, 0], TYOP [0, 0, 5], TYOP [0, 1, 6], TYOP [0, 1, 7], TYOP [5],
   TYOP [4, 9], TYOP [0, 0, 10], TYV "'a", TYOP [4, 12], TYOP [0, 13, 13],
   TYOP [0, 12, 14], TYOP [0, 1, 15], TYOP [0, 12, 13], TYOP [0, 1, 17],
   TYOP [9], TYOP [8, 19], TYOP [8, 20], TYOP [8, 21], TYOP [10],
   TYOP [7, 23, 22], TYOP [6, 24, 0], TYOP [3, 25], TYOP [0, 0, 26],
   TYOP [6, 24, 24], TYOP [6, 24, 28], TYOP [6, 24, 29], TYOP [6, 24, 30],
   TYOP [6, 24, 31], TYOP [6, 24, 32], TYOP [6, 24, 33], TYOP [6, 34, 0],
   TYOP [3, 35], TYOP [0, 0, 36], TYOP [6, 30, 0], TYOP [3, 38],
   TYOP [0, 0, 39], TYOP [6, 28, 0], TYOP [3, 41], TYOP [0, 0, 42],
   TYOP [6, 0, 0], TYOP [3, 44], TYOP [0, 0, 45], TYOP [0, 1, 46],
   TYOP [0, 1, 47], TYOP [0, 0, 1], TYOP [11, 0], TYOP [12, 0],
   TYOP [4, 24], TYOP [4, 52], TYOP [0, 53, 0], TYOP [0, 0, 23],
   TYOP [0, 0, 55], TYOP [0, 24, 0], TYOP [0, 1, 57], TYOP [4, 0],
   TYOP [0, 59, 0], TYOP [13], TYOP [0, 0, 61], TYOP [0, 0, 62],
   TYOP [0, 52, 12], TYOP [0, 64, 12], TYOP [0, 0, 65], TYOP [0, 0, 52],
   TYOP [0, 52, 0], TYOP [14, 52], TYOP [0, 69, 23], TYOP [0, 59, 23],
   TYOP [0, 13, 23], TYOP [0, 12, 72], TYOP [0, 1, 73], TYOP [0, 1, 55],
   TYOP [0, 59, 71], TYOP [0, 44, 23], TYOP [0, 44, 77], TYOP [6, 1, 0],
   TYOP [0, 79, 23], TYOP [0, 79, 80], TYOP [6, 12, 13], TYOP [6, 1, 82],
   TYOP [0, 83, 23], TYOP [0, 83, 84], TYOP [0, 68, 23], TYOP [0, 0, 12],
   TYOP [0, 0, 69], TYOP [0, 12, 23], TYOP [0, 89, 23], TYOP [0, 55, 23],
   TYOP [0, 24, 23], TYOP [0, 92, 23], TYOP [0, 91, 23], TYOP [0, 56, 23],
   TYOP [0, 95, 23], TYOP [0, 71, 23], TYOP [0, 97, 23], TYOP [0, 64, 23],
   TYOP [0, 99, 23], TYOP [0, 74, 23], TYOP [0, 101, 23], TYOP [0, 75, 23],
   TYOP [0, 103, 23], TYOP [0, 70, 23], TYOP [0, 105, 23],
   TYOP [0, 72, 23], TYOP [0, 52, 23], TYOP [0, 108, 23], TYOP [0, 53, 23],
   TYOP [0, 110, 23], TYOP [0, 1, 23], TYOP [0, 112, 23], TYOP [0, 1, 1],
   TYOP [0, 1, 114], TYOP [0, 13, 82], TYOP [0, 12, 116], TYOP [0, 0, 44],
   TYOP [0, 0, 118], TYOP [0, 0, 25], TYOP [0, 24, 120], TYOP [0, 24, 28],
   TYOP [0, 24, 122], TYOP [0, 28, 29], TYOP [0, 24, 124],
   TYOP [0, 29, 30], TYOP [0, 24, 126], TYOP [0, 30, 31],
   TYOP [0, 24, 128], TYOP [0, 31, 32], TYOP [0, 24, 130],
   TYOP [0, 32, 33], TYOP [0, 24, 132], TYOP [0, 33, 34],
   TYOP [0, 24, 134], TYOP [0, 0, 79], TYOP [0, 1, 136], TYOP [0, 82, 83],
   TYOP [0, 1, 138], TYOP [0, 0, 41], TYOP [0, 28, 140], TYOP [0, 0, 38],
   TYOP [0, 30, 142], TYOP [0, 0, 35], TYOP [0, 34, 144], TYOP [0, 23, 23],
   TYOP [0, 23, 146], TYOP [0, 12, 89], TYOP [0, 51, 23],
   TYOP [0, 51, 149], TYOP [0, 50, 23], TYOP [0, 50, 151],
   TYOP [0, 24, 92], TYOP [0, 5, 23], TYOP [0, 5, 154], TYOP [0, 45, 23],
   TYOP [0, 45, 156], TYOP [0, 26, 23], TYOP [0, 26, 158],
   TYOP [0, 42, 23], TYOP [0, 42, 160], TYOP [0, 39, 23],
   TYOP [0, 39, 162], TYOP [0, 36, 23], TYOP [0, 36, 164],
   TYOP [0, 60, 23], TYOP [0, 60, 166], TYOP [0, 13, 72],
   TYOP [0, 52, 108], TYOP [0, 10, 23], TYOP [0, 10, 170],
   TYOP [0, 1, 112], TYOP [0, 61, 23], TYOP [0, 61, 173], TYOP [0, 69, 70],
   TYOP [0, 87, 23], TYOP [0, 176, 23], TYOP [0, 88, 23],
   TYOP [0, 178, 23], TYOP [0, 76, 23], TYOP [0, 180, 76],
   TYOP [0, 52, 52], TYOP [0, 52, 182], TYOP [0, 1, 9], TYOP [0, 0, 3],
   TYOP [0, 23, 185], TYOP [0, 5, 5], TYOP [0, 5, 187], TYOP [0, 23, 188],
   TYOP [0, 59, 59], TYOP [0, 0, 190], TYOP [0, 24, 182], TYOP [0, 10, 10],
   TYOP [0, 9, 193], TYOP [0, 1, 69], TYOP [0, 195, 69], TYOP [0, 52, 196],
   TYOP [0, 1, 197], TYOP [0, 53, 52], TYOP [0, 56, 56], TYOP [0, 56, 200],
   TYOP [0, 63, 63], TYOP [0, 63, 202], TYOP [0, 11, 11],
   TYOP [0, 11, 204], TYOP [0, 52, 1], TYOP [0, 187, 187],
   TYOP [0, 193, 193], TYOP [0, 2, 2], TYOP [0, 173, 173],
   TYOP [0, 52, 10], TYOP [0, 24, 9], TYOP [0, 212, 211], TYOP [0, 51, 51],
   TYOP [0, 202, 214], TYOP [0, 200, 214], TYOP [0, 50, 50],
   TYOP [0, 204, 217], TYOP [0, 70, 178], TYOP [0, 25, 42],
   TYOP [0, 24, 43], TYOP [0, 221, 220], TYOP [0, 25, 39],
   TYOP [0, 24, 40], TYOP [0, 224, 223], TYOP [0, 25, 36],
   TYOP [0, 24, 37], TYOP [0, 227, 226], TYOP [0, 78, 23],
   TYOP [0, 81, 23], TYOP [0, 85, 23], TYOP [0, 60, 60], TYOP [0, 232, 60],
   TYOP [0, 76, 233], TYOP [0, 0, 109], TYOP [0, 68, 0], TYOP [0, 0, 236],
   TYOP [0, 182, 52], TYOP [0, 0, 238], TYOP [0, 24, 61],
   TYOP [0, 24, 240], TYOP [0, 6, 5], TYOP [0, 5, 242], TYOP [0, 46, 45],
   TYOP [0, 5, 244], TYOP [0, 220, 42], TYOP [0, 26, 246],
   TYOP [0, 223, 39], TYOP [0, 26, 248], TYOP [0, 226, 36],
   TYOP [0, 26, 250], TYOP [0, 10, 5], TYOP [0, 10, 26], TYOP [0, 52, 61],
   TYOP [0, 52, 254], TYOP [0, 241, 255], TYOP [0, 0, 60],
   TYOP [0, 257, 0], TYOP [0, 0, 258], TYOP [0, 59, 259],
   TYOP [0, 24, 108], TYOP [0, 261, 23], TYOP [0, 23, 262],
   TYOP [0, 52, 263], TYOP [0, 52, 5], TYOP [0, 24, 265], TYOP [0, 266, 5],
   TYOP [0, 5, 267], TYOP [0, 52, 268], TYOP [0, 52, 26],
   TYOP [0, 24, 270], TYOP [0, 271, 26], TYOP [0, 26, 272],
   TYOP [0, 52, 273], TYOP [0, 24, 1], TYOP [0, 275, 206],
   TYOP [0, 1, 183], TYOP [0, 1, 24], TYOP [0, 1, 13], TYOP [0, 279, 13],
   TYOP [0, 13, 280], TYOP [0, 1, 281], TYOP [0, 275, 212],
   TYOP [0, 184, 283], TYOP [0, 44, 95], TYOP [0, 24, 52],
   TYOP [0, 1, 286], TYOP [0, 44, 45], TYOP [0, 25, 26], TYOP [0, 41, 42],
   TYOP [0, 38, 39], TYOP [0, 35, 36]]
  end
  val _ = Theory.incorporate_consts "byte_sequence" tyvector
     [("zeros", 2), ("zero_pad_to_length", 4),
      ("takebytes_with_length", 8), ("takebytes_r_with_length", 8),
      ("takebytes", 7), ("string_of_byte_sequence", 11), ("repeat'", 16),
      ("repeat", 18), ("read_char", 27), ("read_8_bytes_le", 37),
      ("read_8_bytes_be", 37), ("read_4_bytes_le", 40),
      ("read_4_bytes_be", 40), ("read_2_bytes_le", 43),
      ("read_2_bytes_be", 43), ("partition_with_length", 48),
      ("partition0", 47), ("offset_and_cut", 8), ("length0", 49),
      ("instance_Show_Show_Byte_sequence_byte_sequence_dict", 50),
      ("instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict", 51),
      ("from_byte_lists", 54), ("equal", 56), ("empty", 0),
      ("dropbytes", 7), ("create", 58), ("concat0", 60),
      ("compare_byte_sequence", 63), ("byte_sequence_size", 49),
      ("byte_sequence_CASE", 66), ("byte_list_of_byte_sequence", 67),
      ("Sequence", 68)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'byte_sequence'", 70), TMV("M", 0), TMV("M'", 0), TMV("P", 55),
   TMV("P", 56), TMV("P", 71), TMV("P", 74), TMV("P", 75), TMV("R", 76),
   TMV("R", 78), TMV("R", 81), TMV("R", 85), TMV("a", 52), TMV("a'", 52),
   TMV("a0", 69), TMV("acc", 13), TMV("b", 0), TMV("b0", 24),
   TMV("b1", 24), TMV("b2", 24), TMV("b3", 24), TMV("b4", 24),
   TMV("b5", 24), TMV("b6", 24), TMV("b7", 24), TMV("bb", 0), TMV("bs", 0),
   TMV("bs0", 0), TMV("bs0_length", 1), TMV("bs1", 0), TMV("bs2", 0),
   TMV("bs3", 0), TMV("bs4", 0), TMV("bs5", 0), TMV("bs6", 0),
   TMV("bs7", 0), TMV("bs8", 0), TMV("byte_sequence", 86), TMV("c", 12),
   TMV("c", 24), TMV("concat0", 60), TMV("count1", 1), TMV("cs", 10),
   TMV("curlen", 1), TMV("cut", 1), TMV("f", 64), TMV("f'", 64),
   TMV("f1", 0), TMV("f2", 0), TMV("fn", 87), TMV("idx", 1), TMV("l", 0),
   TMV("l", 52), TMV("left", 0), TMV("len", 1), TMV("m", 1), TMV("n", 1),
   TMV("off", 1), TMV("r", 0), TMV("rep", 88), TMV("res", 0),
   TMV("result", 5), TMV("result", 61), TMV("right", 0), TMV("s1", 0),
   TMV("s2", 0), TMV("tail", 52), TMV("ts", 59), TMV("ts", 52),
   TMV("ts", 53), TMV("ts_length", 1), TMV("v", 0), TMV("v", 24),
   TMV("v", 59), TMV("v", 1), TMV("v1", 12), TMV("v1", 0), TMV("v1", 1),
   TMV("v12", 24), TMV("v13", 52), TMV("v2", 13), TMV("v3", 52),
   TMV("v5", 52), TMV("x", 24), TMV("x", 52), TMV("xs", 59), TMV("xs", 52),
   TMV("y", 24), TMV("ys", 52), TMC(15, 90), TMC(15, 91), TMC(15, 93),
   TMC(15, 94), TMC(15, 96), TMC(15, 98), TMC(15, 100), TMC(15, 102),
   TMC(15, 104), TMC(15, 106), TMC(15, 107), TMC(15, 97), TMC(15, 109),
   TMC(15, 111), TMC(15, 113), TMC(15, 105), TMC(16, 115), TMC(17, 117),
   TMC(17, 119), TMC(17, 121), TMC(17, 123), TMC(17, 125), TMC(17, 127),
   TMC(17, 129), TMC(17, 131), TMC(17, 133), TMC(17, 135), TMC(17, 137),
   TMC(17, 139), TMC(17, 141), TMC(17, 143), TMC(17, 145), TMC(18, 115),
   TMC(19, 147), TMC(20, 1), TMC(21, 148), TMC(21, 150), TMC(21, 152),
   TMC(21, 147), TMC(21, 56), TMC(21, 153), TMC(21, 155), TMC(21, 157),
   TMC(21, 159), TMC(21, 161), TMC(21, 163), TMC(21, 165), TMC(21, 167),
   TMC(21, 168), TMC(21, 76), TMC(21, 169), TMC(21, 171), TMC(21, 172),
   TMC(21, 174), TMC(21, 78), TMC(21, 175), TMC(22, 147), TMC(23, 172),
   TMC(24, 177), TMC(24, 179), TMC(24, 109), TMC(25, 181), TMC(26, 183),
   TMC(27, 51), TMC(27, 50), TMC(28, 114), TMC(29, 114), TMC(30, 69),
   TMC(31, 184), TMC(32, 186), TMC(32, 189), TMC(33, 15), TMC(33, 191),
   TMC(33, 192), TMC(33, 194), TMC(34, 198), TMC(35, 146), TMC(36, 61),
   TMC(37, 23), TMC(38, 199), TMC(39, 61), TMC(40, 3), TMC(41, 193),
   TMC(42, 201), TMC(42, 203), TMC(42, 205), TMC(43, 206), TMC(44, 207),
   TMC(44, 208), TMC(44, 209), TMC(44, 210), TMC(45, 61), TMC(46, 213),
   TMC(47, 13), TMC(47, 59), TMC(47, 52), TMC(47, 10), TMC(48, 114),
   TMC(49, 215), TMC(50, 216), TMC(51, 216), TMC(52, 216), TMC(53, 216),
   TMC(54, 114), TMC(55, 68), TMC(56, 218), TMC(57, 23), TMC(58, 219),
   TMC(59, 222), TMC(59, 225), TMC(59, 228), TMC(60, 180), TMC(60, 229),
   TMC(60, 230), TMC(60, 231), TMC(61, 234), TMC(62, 1), TMC(63, 147),
   TMC(64, 67), TMC(65, 66), TMC(65, 235), TMC(65, 237), TMC(65, 239),
   TMC(66, 49), TMC(67, 241), TMC(68, 63), TMC(69, 60), TMC(70, 58),
   TMC(71, 7), TMC(72, 0), TMC(73, 56), TMC(74, 243), TMC(74, 245),
   TMC(74, 247), TMC(74, 249), TMC(74, 251), TMC(75, 252), TMC(75, 253),
   TMC(76, 54), TMC(77, 51), TMC(78, 50), TMC(79, 206), TMC(80, 49),
   TMC(81, 256), TMC(82, 260), TMC(82, 264), TMC(82, 269), TMC(82, 274),
   TMC(83, 276), TMC(84, 277), TMC(85, 278), TMC(86, 1), TMC(87, 282),
   TMC(88, 284), TMC(89, 8), TMC(90, 285), TMC(91, 47), TMC(92, 48),
   TMC(93, 43), TMC(94, 43), TMC(95, 40), TMC(96, 40), TMC(97, 37),
   TMC(98, 37), TMC(99, 27), TMC(100, 18), TMC(100, 287), TMC(101, 16),
   TMC(102, 6), TMC(102, 288), TMC(102, 289), TMC(102, 290), TMC(102, 291),
   TMC(102, 292), TMC(103, 11), TMC(104, 7), TMC(105, 8), TMC(106, 8),
   TMC(107, 275), TMC(108, 4), TMC(109, 2), TMC(110, 146)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op byte_sequence_TY_DEF x = x
    val op byte_sequence_TY_DEF =
    DT(((("byte_sequence",0),[("bool",[26])]),["DISK_THM"]),
       [read"%148%59%196%14%98%0%145%104%14%145%149%12%144$1@%12%164%123@$0@%56%156|@|$0@@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op byte_sequence_case_def x = x
    val op byte_sequence_case_def =
    DT(((("byte_sequence",4),
        [("bool",[26,180]),("byte_sequence",[1,2,3]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%101%12%95%45%124%208%193$1@@$0@@$0$1@@|@|@"])
  fun op byte_sequence_size_def x = x
    val op byte_sequence_size_def =
    DT(((("byte_sequence",5),
        [("bool",[26,180]),("byte_sequence",[1,2,3]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%101%12%141%212%193$0@@@%105%186%154%205@@@%237%72%123|@$0@@@|@"])
  fun op byte_list_of_byte_sequence_def x = x
    val op byte_list_of_byte_sequence_def =
    DT(((("byte_sequence",12),[]),[]),
       [read"%90%27%139%207$0@@%211$0@%86$0|@@|@"])
  fun op compare_byte_sequence_def x = x
    val op compare_byte_sequence_def =
    DT(((("byte_sequence",13),[]),[]),
       [read"%90%64%90%65%142%214$1@$0@@%232%213@%207$1@@%207$0@@@|@|@"])
  fun op instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict_def
    x = x
    val op instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict_def
    =
    DT(((("byte_sequence",14),[]),[]),
       [read"%125%228@%187%173%214@@%191%172%47%48%142%214$1@$0@@%180@||@@%190%172%47%48%179%62%206%142$0@%180@@%142$0@%166@@|@%214$1@$0@@||@@%189%172%47%48%142%214$1@$0@@%169@||@@%188%172%47%48%179%62%206%142$0@%169@@%142$0@%166@@|@%214$1@$0@@||@@%152@@@@@@"])
  fun op empty_def x = x
    val op empty_def =
    DT(((("byte_sequence",15),[]),[]), [read"%128%218@%193%184@@"])
  fun op read_char_def x = x
    val op read_char_def =
    DT(((("byte_sequence",16),
        [("bool",[26,180]),("byte_sequence",[1,2,3]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%101%68%132%253%193$0@@@%236$0@%226%163%157%186%155%155%154%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%154%155%154%154%154%155%205@@@@@@@@@%163%157%186%155%154%155%154%154%155%205@@@@@@@@@%163%157%186%154%154%154%154%154%155%205@@@@@@@@@%163%157%186%154%154%155%154%154%155%205@@@@@@@@@%163%157%186%155%154%154%155%154%155%205@@@@@@@@@%163%157%186%154%155%154%154%154%155%205@@@@@@@@@%163%157%186%155%155%154%154%155%155%205@@@@@@@@@%163%157%186%155%155%154%155%155%205@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%154%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%154%155%154%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%154%154%155%154%154%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%155%154%155%154%155%205@@@@@@@@@%163%157%186%154%154%155%154%155%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%154%155%155%155%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%155%155%205@@@@@@@@@%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%154%155%155%155%205@@@@@@@@@%185@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%83%86%259%108$1@%193$0@@@||@@|@"])
  fun op repeat_def x = x
    val op repeat_def =
    DT(((("byte_sequence",21),[]),[]),
       [read"%103%41%89%38%137%254$1@$0@@%256$1@$0@%182@@|@|@"])
  fun op create_def x = x
    val op create_def =
    DT(((("byte_sequence",22),[]),[]),
       [read"%103%41%91%39%128%216$1@$0@@%193%255$1@$0@@@|@|@"])
  fun op zeros_def x = x
    val op zeros_def =
    DT(((("byte_sequence",23),[]),[]),
       [read"%103%55%128%269$0@@%216$0@%239%123@@@|@"])
  fun op length0_def x = x
    val op length0_def =
    DT(((("byte_sequence",24),
        [("bool",[26,180]),("byte_sequence",[1,2,3]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%101%68%141%231%193$0@@@%175$0@@|@"])
  fun op concat0_primitive_def x = x
    val op concat0_primitive_def =
    DT(((("byte_sequence",25),[]),[]),
       [read"%136%215@%204%150%8%122%200$0@@%100%67%90%71%100%85%101%84%145%122%138$3@%161$2@$1@@@%128$2@%193$0@@@@$4$1@$3@@|@|@|@|@@|@@%40%67%170%233$0@%193%184@@%71%85%210$1@%84%210$4$1@@%66%193%151$1@$0@@|@|@||@@||@@"])
  fun op zero_pad_to_length_def x = x
    val op zero_pad_to_length_def =
    DT(((("byte_sequence",28),[]),[]),
       [read"%103%54%90%26%128%268$1@$0@@%178%43%158%146$0@$2@@$1@%215%161$1@%161%269%121$2@$0@@@%183@@@@|@%231$0@@@|@|@"])
  fun op from_byte_lists_def x = x
    val op from_byte_lists_def =
    DT(((("byte_sequence",29),[]),[]),
       [read"%102%69%128%227$0@@%193%168$0@@@|@"])
  fun op string_of_byte_sequence_def x = x
    val op string_of_byte_sequence_def =
    DT(((("byte_sequence",30),
        [("bool",[26,180]),("byte_sequence",[1,2,3]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%101%68%140%263%193$0@@@%177%42%171$0@|@%181%242%157@%267@@$0@@@|@"])
  fun op takebytes_r_with_length_def x = x
    val op takebytes_r_with_length_def =
    DT(((("byte_sequence",39),
        [("bool",[26,180]),("byte_sequence",[1,2,3]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%103%41%103%70%101%68%130%265$2@$1@%193$0@@@%159%146$1@$2@@%257%193%238$2@%184@$0@@@@%225%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%154%154%154%155%205@@@@@@@@@%163%157%186%154%154%155%155%154%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%155%155%154%154%154%155%205@@@@@@@@@%163%157%186%154%155%154%155%155%155%205@@@@@@@@@%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%154%154%155%154%155%155%205@@@@@@@@@%163%157%186%155%155%154%155%155%205@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%154%155%154%154%155%205@@@@@@@@@%163%157%186%154%155%154%154%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%154%154%154%154%155%155%205@@@@@@@@@%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%154%154%154%155%205@@@@@@@@@%163%157%186%154%154%155%155%154%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%155%155%155%154%155%205@@@@@@@@@%163%157%186%154%154%154%154%155%155%205@@@@@@@@@%163%157%186%155%155%154%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%155%155%154%154%154%155%205@@@@@@@@@%163%157%186%154%155%154%155%155%155%205@@@@@@@@@%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%154%154%155%154%155%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%155%154%154%155%154%155%205@@@@@@@@@%163%157%186%154%155%154%154%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%155%154%154%154%155%205@@@@@@@@@%163%157%186%155%155%154%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%154%155%154%154%155%205@@@@@@@@@%163%157%186%154%154%154%154%155%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%154%154%154%155%205@@@@@@@@@%163%157%186%154%155%154%155%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%155%154%155%154%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%155%154%155%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%154%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%154%155%154%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%154%154%155%154%154%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%185@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@|@"])
  fun op takebytes_def x = x
    val op takebytes_def =
    DT(((("byte_sequence",40),
        [("bool",[26,180]),("byte_sequence",[1,2,3]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%103%41%101%68%130%264$1@%193$0@@@%176%61$0|@%265$1@%230$0@@%193$0@@@@|@|@"])
  fun op takebytes_with_length_def x = x
    val op takebytes_with_length_def =
    DT(((("byte_sequence",41),
        [("bool",[26,180]),("byte_sequence",[1,2,3]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%103%41%103%70%101%68%130%266$2@$1@%193$0@@@%176%61$0|@%265$2@$1@%193$0@@@@|@|@|@"])
  fun op read_2_bytes_le_def x = x
    val op read_2_bytes_le_def =
    DT(((("byte_sequence",42),[]),[]),
       [read"%90%27%133%248$0@@%222%253$0@@%197%17%29%222%253$0@@%197%18%30%260%118%109$1@$3@@$0@@||@@||@@@|@"])
  fun op read_2_bytes_be_def x = x
    val op read_2_bytes_be_def =
    DT(((("byte_sequence",43),[]),[]),
       [read"%90%27%133%247$0@@%222%253$0@@%197%17%29%222%253$0@@%197%18%30%260%118%109$3@$1@@$0@@||@@||@@@|@"])
  fun op read_4_bytes_le_def x = x
    val op read_4_bytes_le_def =
    DT(((("byte_sequence",44),[]),[]),
       [read"%90%27%134%250$0@@%223%253$0@@%198%17%29%223%253$0@@%198%18%30%223%253$0@@%198%19%31%223%253$0@@%198%20%32%261%119%111$1@%110$3@%109$5@$7@@@@$0@@||@@||@@||@@||@@@|@"])
  fun op read_4_bytes_be_def x = x
    val op read_4_bytes_be_def =
    DT(((("byte_sequence",45),[]),[]),
       [read"%90%27%134%249$0@@%223%253$0@@%198%17%29%223%253$0@@%198%18%30%223%253$0@@%198%19%31%223%253$0@@%198%20%32%261%119%111$7@%110$5@%109$3@$1@@@@$0@@||@@||@@||@@||@@@|@"])
  fun op read_8_bytes_le_def x = x
    val op read_8_bytes_le_def =
    DT(((("byte_sequence",46),[]),[]),
       [read"%90%27%135%252$0@@%224%253$0@@%199%17%29%224%253$0@@%199%18%30%224%253$0@@%199%19%31%224%253$0@@%199%20%32%224%253$0@@%199%21%33%224%253$0@@%199%22%34%224%253$0@@%199%23%35%224%253$0@@%199%24%36%262%120%115$1@%114$3@%113$5@%112$7@%111$9@%110$11@%109$13@$15@@@@@@@@$0@@||@@||@@||@@||@@||@@||@@||@@||@@@|@"])
  fun op read_8_bytes_be_def x = x
    val op read_8_bytes_be_def =
    DT(((("byte_sequence",47),[]),[]),
       [read"%90%27%135%251$0@@%224%253$0@@%199%17%29%224%253$0@@%199%18%30%224%253$0@@%199%19%31%224%253$0@@%199%20%32%224%253$0@@%199%21%33%224%253$0@@%199%22%34%224%253$0@@%199%23%35%224%253$0@@%199%24%36%262%120%115$15@%114$13@%113$11@%112$9@%111$7@%110$5@%109$3@$1@@@@@@@@$0@@||@@||@@||@@||@@||@@||@@||@@||@@@|@"])
  fun op partition0_def x = x
    val op partition0_def =
    DT(((("byte_sequence",48),[]),[]),
       [read"%103%50%90%27%131%245$1@$0@@%221%264$1@$0@@%51%221%217$2@$1@@%58%258%107$1@$0@@|@|@@|@|@"])
  fun op partition_with_length_def x = x
    val op partition_with_length_def =
    DT(((("byte_sequence",49),[]),[]),
       [read"%103%50%103%28%90%27%131%246$2@$1@$0@@%221%266$2@$1@$0@@%51%221%217$3@$1@@%58%258%107$1@$0@@|@|@@|@|@|@"])
  fun op offset_and_cut_def x = x
    val op offset_and_cut_def =
    DT(((("byte_sequence",50),[]),[]),
       [read"%103%57%103%44%90%27%130%243$2@$1@$0@@%220%217$2@$0@@%29%220%264$2@$0@@%60%257$0@|@|@@|@|@|@"])
  fun op instance_Show_Show_Byte_sequence_byte_sequence_dict_def x = x
    val op instance_Show_Show_Byte_sequence_byte_sequence_dict_def =
    DT(((("byte_sequence",51),[]),[]),
       [read"%126%229@%194%174%263@@%153@@"])
  fun op datatype_byte_sequence x = x
    val op datatype_byte_sequence =
    DT(((("byte_sequence",6),[("bool",[25,170])]),["DISK_THM"]),
       [read"%165%37%193@@"])
  fun op byte_sequence_11 x = x
    val op byte_sequence_11 =
    DT(((("byte_sequence",7),
        [("bool",[26,55,62,180]),("byte_sequence",[1,2,3]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%101%12%101%13%127%128%193$1@@%193$0@@@%139$1@$0@@|@|@"])
  fun op byte_sequence_case_cong x = x
    val op byte_sequence_case_cong =
    DT(((("byte_sequence",8),
        [("bool",[26,180]),("byte_sequence",[1,2,3,4])]),["DISK_THM"]),
       [read"%90%1%90%2%95%45%145%122%128$2@$1@@%101%12%145%128$2@%193$0@@@%124$1$0@@%46$0@@@|@@@%124%208$2@$0@@%208$1@%46@@@|@|@|@"])
  fun op byte_sequence_nchotomy x = x
    val op byte_sequence_nchotomy =
    DT(((("byte_sequence",9),
        [("bool",[26,180]),("byte_sequence",[1,2,3])]),["DISK_THM"]),
       [read"%90%25%149%52%128$1@%193$0@@|@|@"])
  fun op byte_sequence_Axiom x = x
    val op byte_sequence_Axiom =
    DT(((("byte_sequence",10),
        [("bool",[26,180]),("byte_sequence",[1,2,3]),
         ("ind_type",[33,34])]),["DISK_THM"]),
       [read"%95%45%147%49%101%12%124$1%193$0@@@$2$0@@|@|@|@"])
  fun op byte_sequence_induction x = x
    val op byte_sequence_induction =
    DT(((("byte_sequence",11),
        [("bool",[26]),("byte_sequence",[1,2,3])]),["DISK_THM"]),
       [read"%92%3%145%101%52$1%193$0@@|@@%90%16$1$0@|@@|@"])
  fun op repeat'_ind x = x
    val op repeat'_ind =
    DT(((("byte_sequence",19),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%96%6%145%103%41%89%38%99%15%145%103%77%145%141$3@%192$0@@@$4%121$3@%186%154%205@@@@$2@%160$2@$1@@@|@@$3$2@$1@$0@@|@|@|@@%103%74%89%75%99%80$3$2@$1@$0@|@|@|@@|@",
        read"%99%15%89%38%103%41%103%77%145%141$1@%192$0@@@%11%117%121$1@%186%154%205@@@@%106$2@%160$2@$3@@@@%117$1@%106$2@$3@@@@|@|@|@|@",
        read"%203%11@"])
  fun op repeat'_def x = x
    val op repeat'_def =
    DT(((("byte_sequence",20),
        [("arithmetic",[271]),("bool",[15,57]),("byte_sequence",[17,18]),
         ("combin",[19]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%103%41%89%38%99%15%137%256$2@$1@$0@@%241$2@$0@%77%256%121$3@%186%154%205@@@@$2@%160$2@$1@@|@@|@|@|@",
        read"%99%15%89%38%103%41%103%77%145%141$1@%192$0@@@%11%117%121$1@%186%154%205@@@@%106$2@%160$2@$3@@@@%117$1@%106$2@$3@@@@|@|@|@|@",
        read"%203%11@"])
  fun op concat0_ind x = x
    val op concat0_ind =
    DT(((("byte_sequence",26),
        [("bool",[25,27,52,53,62]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%94%5%145%100%67%145%90%71%100%85%101%84%145%122%138$3@%161$2@$1@@@%128$2@%193$0@@@@$4$1@@|@|@|@@$1$0@@|@@%100%73$1$0@|@@|@",
        read"%100%67%90%71%100%85%101%84%145%122%138$3@%161$2@$1@@@%128$2@%193$0@@@@%8$1@$3@@|@|@|@|@",
        read"%200%8@"])
  fun op concat0_def x = x
    val op concat0_def =
    DT(((("byte_sequence",27),
        [("bool",[15,26,180]),("byte_sequence",[1,2,3,4,25]),
         ("combin",[19]),("list",[11]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%100%67%128%215$0@@%233$0@%193%184@@%71%85%210$1@%84%210%215$1@@%66%193%151$1@$0@@|@|@||@@|@",
        read"%100%67%90%71%100%85%101%84%145%122%138$3@%161$2@$1@@@%128$2@%193$0@@@@%8$1@$3@@|@|@|@|@",
        read"%200%8@"])
  fun op equal_ind x = x
    val op equal_ind =
    DT(((("byte_sequence",33),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%93%4%145%90%53%90%63%145%90%71%90%76%101%81%101%82%91%87%101%88%91%83%101%86%145%122%143%107$9@$8@@%107$7@$6@@@%122%128$7@%193$5@@@%122%128$6@%193$4@@@%122%139$4@%162$3@$2@@@%139$5@%162$1@$0@@@@@@@$10%193$0@@%193$2@@@|@|@|@|@|@|@|@|@@$2$1@$0@@|@|@@%90%71%90%76$2$1@$0@|@|@@|@",
        read"%90%63%90%53%90%71%90%76%101%81%101%82%91%87%101%88%91%83%101%86%145%122%143%107$8@$9@@%107$7@$6@@@%122%128$7@%193$5@@@%122%128$6@%193$4@@@%122%139$4@%162$3@$2@@@%139$5@%162$1@$0@@@@@@@%9%107%193$0@@%193$2@@@%107$8@$9@@@|@|@|@|@|@|@|@|@|@|@",
        read"%201%9@"])
  fun op equal_def x = x
    val op equal_def =
    DT(((("byte_sequence",34),
        [("bool",[15,26,57,180]),("byte_sequence",[1,2,3,4,31,32]),
         ("combin",[19]),("list",[11]),("pair",[49,51]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%90%63%90%53%127%219$0@$1@@%244%107$0@$1@@%71%76%209$1@%81%209$1@%82%234$0@%234$1@%195@%78%79%167||@@%87%88%234$3@%167@%83%86%122%129$1@$3@@%219%193$0@@%193$2@@@||@||@|@|@||@@|@|@",
        read"%90%63%90%53%90%71%90%76%101%81%101%82%91%87%101%88%91%83%101%86%145%122%143%107$8@$9@@%107$7@$6@@@%122%128$7@%193$5@@@%122%128$6@%193$4@@@%122%139$4@%162$3@$2@@@%139$5@%162$1@$0@@@@@@@%9%107%193$0@@%193$2@@@%107$8@$9@@@|@|@|@|@|@|@|@|@|@|@",
        read"%201%9@"])
  fun op dropbytes_ind x = x
    val op dropbytes_ind =
    DT(((("byte_sequence",37),
        [("bool",[25,26,27,52,53,62,180]),("byte_sequence",[1,2,3]),
         ("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%97%7%145%103%41%101%68%145%91%83%101%86%145%122%270%141$3@%240@@@%139$2@%162$1@$0@@@@$4%121$3@%186%154%205@@@@%193$0@@@|@|@@$2$1@%193$0@@@|@|@@%103%74%90%76$2$1@$0@|@|@@|@",
        read"%101%68%103%41%91%83%101%86%145%122%270%141$2@%240@@@%139$3@%162$1@$0@@@@%10%116%121$2@%186%154%205@@@@%193$0@@@%116$2@%193$3@@@@|@|@|@|@",
        read"%202%10@"])
  fun op dropbytes_def x = x
    val op dropbytes_def =
    DT(((("byte_sequence",38),
        [("bool",[15,57,128]),("byte_sequence",[4,35,36]),("combin",[19]),
         ("list",[11]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%101%68%103%41%130%217$0@%193$1@@@%159%141$0@%240@@%257%193$1@@@%235$1@%225%163%157%186%155%154%155%154%154%155%205@@@@@@@@@%163%157%186%155%155%154%154%155%155%205@@@@@@@@@%163%157%186%154%154%154%154%155%155%205@@@@@@@@@%163%157%186%155%154%154%154%155%155%205@@@@@@@@@%163%157%186%155%155%154%154%154%155%205@@@@@@@@@%163%157%186%154%155%154%155%155%155%205@@@@@@@@@%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%154%154%155%154%155%155%205@@@@@@@@@%163%157%186%155%155%154%155%155%205@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%154%155%154%154%155%205@@@@@@@@@%163%157%186%154%155%154%154%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%154%154%154%154%155%155%205@@@@@@@@@%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%155%154%155%154%154%155%205@@@@@@@@@%163%157%186%155%155%154%154%155%155%205@@@@@@@@@%163%157%186%154%154%154%154%155%155%205@@@@@@@@@%163%157%186%155%154%154%154%155%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%155%155%155%154%155%205@@@@@@@@@%163%157%186%154%154%154%154%155%155%205@@@@@@@@@%163%157%186%155%155%154%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%155%155%154%154%154%155%205@@@@@@@@@%163%157%186%154%155%154%155%155%155%205@@@@@@@@@%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%154%154%155%154%155%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%155%154%154%155%154%155%205@@@@@@@@@%163%157%186%154%155%154%154%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%155%154%154%154%155%205@@@@@@@@@%163%157%186%155%155%154%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%154%155%154%154%155%205@@@@@@@@@%163%157%186%154%154%154%154%155%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%155%154%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%154%154%154%155%205@@@@@@@@@%163%157%186%154%155%154%155%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%155%154%155%154%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%155%154%155%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%155%154%154%154%154%205@@@@@@@@%163%157%186%154%154%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%154%155%154%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%155%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%163%157%186%155%155%155%155%154%155%205@@@@@@@@@%163%157%186%154%154%155%154%154%155%205@@@@@@@@@%163%157%186%154%155%155%154%154%155%205@@@@@@@@@%185@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%83%86%217%121$2@%186%154%205@@@@%193$0@@||@@@|@|@",
        read"%101%68%103%41%91%83%101%86%145%122%270%141$2@%240@@@%139$3@%162$1@$0@@@@%10%116%121$2@%186%154%205@@@@%193$0@@@%116$2@%193$3@@@@|@|@|@|@",
        read"%202%10@"])
  end
  val _ = DB.bindl "byte_sequence"
  [("byte_sequence_TY_DEF",byte_sequence_TY_DEF,DB.Def),
   ("byte_sequence_case_def",byte_sequence_case_def,DB.Def),
   ("byte_sequence_size_def",byte_sequence_size_def,DB.Def),
   ("byte_list_of_byte_sequence_def",
    byte_list_of_byte_sequence_def,
    DB.Def),
   ("compare_byte_sequence_def",compare_byte_sequence_def,DB.Def),
   ("instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict_def",
    instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict_def,
    DB.Def), ("empty_def",empty_def,DB.Def),
   ("read_char_def",read_char_def,DB.Def),
   ("repeat_def",repeat_def,DB.Def), ("create_def",create_def,DB.Def),
   ("zeros_def",zeros_def,DB.Def), ("length0_def",length0_def,DB.Def),
   ("concat0_primitive_def",concat0_primitive_def,DB.Def),
   ("zero_pad_to_length_def",zero_pad_to_length_def,DB.Def),
   ("from_byte_lists_def",from_byte_lists_def,DB.Def),
   ("string_of_byte_sequence_def",string_of_byte_sequence_def,DB.Def),
   ("takebytes_r_with_length_def",takebytes_r_with_length_def,DB.Def),
   ("takebytes_def",takebytes_def,DB.Def),
   ("takebytes_with_length_def",takebytes_with_length_def,DB.Def),
   ("read_2_bytes_le_def",read_2_bytes_le_def,DB.Def),
   ("read_2_bytes_be_def",read_2_bytes_be_def,DB.Def),
   ("read_4_bytes_le_def",read_4_bytes_le_def,DB.Def),
   ("read_4_bytes_be_def",read_4_bytes_be_def,DB.Def),
   ("read_8_bytes_le_def",read_8_bytes_le_def,DB.Def),
   ("read_8_bytes_be_def",read_8_bytes_be_def,DB.Def),
   ("partition0_def",partition0_def,DB.Def),
   ("partition_with_length_def",partition_with_length_def,DB.Def),
   ("offset_and_cut_def",offset_and_cut_def,DB.Def),
   ("instance_Show_Show_Byte_sequence_byte_sequence_dict_def",
    instance_Show_Show_Byte_sequence_byte_sequence_dict_def,
    DB.Def), ("datatype_byte_sequence",datatype_byte_sequence,DB.Thm),
   ("byte_sequence_11",byte_sequence_11,DB.Thm),
   ("byte_sequence_case_cong",byte_sequence_case_cong,DB.Thm),
   ("byte_sequence_nchotomy",byte_sequence_nchotomy,DB.Thm),
   ("byte_sequence_Axiom",byte_sequence_Axiom,DB.Thm),
   ("byte_sequence_induction",byte_sequence_induction,DB.Thm),
   ("repeat'_ind",repeat'_ind,DB.Thm), ("repeat'_def",repeat'_def,DB.Thm),
   ("concat0_ind",concat0_ind,DB.Thm), ("concat0_def",concat0_def,DB.Thm),
   ("equal_ind",equal_ind,DB.Thm), ("equal_def",equal_def,DB.Thm),
   ("dropbytes_ind",dropbytes_ind,DB.Thm),
   ("dropbytes_def",dropbytes_def,DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("missing_pervasivesTheory.missing_pervasives_grammars",
                          missing_pervasivesTheory.missing_pervasives_grammars),
                         ("errorTheory.error_grammars",
                          errorTheory.error_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms temp_add_type "byte_sequence"
  val _ = update_grms temp_add_type "byte_sequence"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Sequence", (Term.prim_mk_const { Name = "Sequence", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("Sequence", (Term.prim_mk_const { Name = "Sequence", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("byte_sequence_CASE", (Term.prim_mk_const { Name = "byte_sequence_CASE", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("byte_sequence_size", (Term.prim_mk_const { Name = "byte_sequence_size", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("byte_list_of_byte_sequence", (Term.prim_mk_const { Name = "byte_list_of_byte_sequence", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("byte_list_of_byte_sequence", (Term.prim_mk_const { Name = "byte_list_of_byte_sequence", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_byte_sequence", (Term.prim_mk_const { Name = "compare_byte_sequence", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_byte_sequence", (Term.prim_mk_const { Name = "compare_byte_sequence", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("empty", (Term.prim_mk_const { Name = "empty", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("empty", (Term.prim_mk_const { Name = "empty", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_char", (Term.prim_mk_const { Name = "read_char", Thy = "byte_sequence"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeat'", (Term.prim_mk_const { Name = "repeat'", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeat'", (Term.prim_mk_const { Name = "repeat'", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeat", (Term.prim_mk_const { Name = "repeat", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("repeat", (Term.prim_mk_const { Name = "repeat", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("create", (Term.prim_mk_const { Name = "create", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("create", (Term.prim_mk_const { Name = "create", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("zeros", (Term.prim_mk_const { Name = "zeros", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("zeros", (Term.prim_mk_const { Name = "zeros", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("length0", (Term.prim_mk_const { Name = "length0", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("concat0", (Term.prim_mk_const { Name = "concat0", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("concat0", (Term.prim_mk_const { Name = "concat0", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("zero_pad_to_length", (Term.prim_mk_const { Name = "zero_pad_to_length", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("zero_pad_to_length", (Term.prim_mk_const { Name = "zero_pad_to_length", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("from_byte_lists", (Term.prim_mk_const { Name = "from_byte_lists", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("from_byte_lists", (Term.prim_mk_const { Name = "from_byte_lists", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_byte_sequence", (Term.prim_mk_const { Name = "string_of_byte_sequence", Thy = "byte_sequence"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("equal", (Term.prim_mk_const { Name = "equal", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("equal", (Term.prim_mk_const { Name = "equal", Thy = "byte_sequence"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("dropbytes", (Term.prim_mk_const { Name = "dropbytes", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("dropbytes", (Term.prim_mk_const { Name = "dropbytes", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("takebytes_r_with_length", (Term.prim_mk_const { Name = "takebytes_r_with_length", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("takebytes", (Term.prim_mk_const { Name = "takebytes", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("takebytes_with_length", (Term.prim_mk_const { Name = "takebytes_with_length", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_2_bytes_le", (Term.prim_mk_const { Name = "read_2_bytes_le", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_2_bytes_le", (Term.prim_mk_const { Name = "read_2_bytes_le", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_2_bytes_be", (Term.prim_mk_const { Name = "read_2_bytes_be", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_2_bytes_be", (Term.prim_mk_const { Name = "read_2_bytes_be", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_4_bytes_le", (Term.prim_mk_const { Name = "read_4_bytes_le", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_4_bytes_le", (Term.prim_mk_const { Name = "read_4_bytes_le", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_4_bytes_be", (Term.prim_mk_const { Name = "read_4_bytes_be", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_4_bytes_be", (Term.prim_mk_const { Name = "read_4_bytes_be", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_8_bytes_le", (Term.prim_mk_const { Name = "read_8_bytes_le", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_8_bytes_le", (Term.prim_mk_const { Name = "read_8_bytes_le", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_8_bytes_be", (Term.prim_mk_const { Name = "read_8_bytes_be", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_8_bytes_be", (Term.prim_mk_const { Name = "read_8_bytes_be", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("partition0", (Term.prim_mk_const { Name = "partition0", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("partition0", (Term.prim_mk_const { Name = "partition0", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("partition_with_length", (Term.prim_mk_const { Name = "partition_with_length", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("partition_with_length", (Term.prim_mk_const { Name = "partition_with_length", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("offset_and_cut", (Term.prim_mk_const { Name = "offset_and_cut", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("offset_and_cut", (Term.prim_mk_const { Name = "offset_and_cut", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Byte_sequence_byte_sequence_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Byte_sequence_byte_sequence_dict", Thy = "byte_sequence"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Byte_sequence_byte_sequence_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Byte_sequence_byte_sequence_dict", Thy = "byte_sequence"}))
  val byte_sequence_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG byte_sequence_Axiom,
           case_def=byte_sequence_case_def,
           case_cong=byte_sequence_case_cong,
           induction=ORIG byte_sequence_induction,
           nchotomy=byte_sequence_nchotomy,
           size=SOME(Parse.Term`(byte_sequence$byte_sequence_size) :(byte_sequence$byte_sequence) -> (num$num)`,
                     ORIG byte_sequence_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME byte_sequence_11,
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
    thy = "byte_sequence",
    thydataty = "compute",
    data =
        "byte_sequence.byte_list_of_byte_sequence_def byte_sequence.takebytes_with_length_def byte_sequence.instance_Show_Show_Byte_sequence_byte_sequence_dict_def byte_sequence.offset_and_cut_def byte_sequence.partition_with_length_def byte_sequence.partition0_def byte_sequence.read_8_bytes_be_def byte_sequence.read_8_bytes_le_def byte_sequence.read_4_bytes_be_def byte_sequence.read_4_bytes_le_def byte_sequence.read_2_bytes_be_def byte_sequence.read_2_bytes_le_def byte_sequence.string_of_byte_sequence_def byte_sequence.takebytes_def byte_sequence.takebytes_r_with_length_def byte_sequence.zero_pad_to_length_def byte_sequence.from_byte_lists_def byte_sequence.zeros_def byte_sequence.length0_def byte_sequence.read_char_def byte_sequence.create_def byte_sequence.repeat_def byte_sequence.compare_byte_sequence_def byte_sequence.empty_def byte_sequence.instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "byte_sequence"
end
