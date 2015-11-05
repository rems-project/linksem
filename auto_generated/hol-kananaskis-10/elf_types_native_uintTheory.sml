structure elf_types_native_uintTheory :> elf_types_native_uintTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading elf_types_native_uintTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open byte_sequenceTheory endiannessTheory integer_wordTheory
  in end;
  val _ = Theory.link_parents
          ("elf_types_native_uint",
          Arbnum.fromString "1445438741",
          Arbnum.fromString "175496")
          [("integer_word",
           Arbnum.fromString "1444913690",
           Arbnum.fromString "968203"),
           ("endianness",
           Arbnum.fromString "1445345900",
           Arbnum.fromString "903755"),
           ("byte_sequence",
           Arbnum.fromString "1445438726",
           Arbnum.fromString "742620")];
  val _ = Theory.incorporate_types "elf_types_native_uint" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("num", "num"), ID("error", "error"),
   ID("pair", "prod"), ID("byte_sequence", "byte_sequence"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
   ID("min", "bool"), ID("endianness", "endianness"), ID("list", "list"),
   ID("bool", "!"), ID("pair", ","), ID("min", "="), ID("bool", "ARB"),
   ID("list", "CONS"), ID("bool", "LET"), ID("list", "NIL"),
   ID("pair", "UNCURRY"),
   ID("elf_types_native_uint", "bytes_of_elf32_addr"),
   ID("elf_types_native_uint", "bytes_of_elf32_half"),
   ID("elf_types_native_uint", "bytes_of_elf32_off"),
   ID("elf_types_native_uint", "bytes_of_elf32_sword"),
   ID("elf_types_native_uint", "bytes_of_elf32_word"),
   ID("elf_types_native_uint", "bytes_of_elf64_addr"),
   ID("elf_types_native_uint", "bytes_of_elf64_half"),
   ID("elf_types_native_uint", "bytes_of_elf64_off"),
   ID("elf_types_native_uint", "bytes_of_elf64_sword"),
   ID("elf_types_native_uint", "bytes_of_elf64_sxword"),
   ID("elf_types_native_uint", "bytes_of_elf64_word"),
   ID("elf_types_native_uint", "bytes_of_elf64_xword"),
   ID("endianness", "endianness_CASE"), ID("error", "error_bind"),
   ID("missing_pervasives", "id"), ID("words", "n2w"),
   ID("elf_types_native_uint", "natural_of_byte"),
   ID("byte_sequence", "read_2_bytes_be"),
   ID("byte_sequence", "read_2_bytes_le"),
   ID("byte_sequence", "read_4_bytes_be"),
   ID("byte_sequence", "read_4_bytes_le"),
   ID("byte_sequence", "read_8_bytes_be"),
   ID("byte_sequence", "read_8_bytes_le"),
   ID("byte_sequence", "read_char"),
   ID("elf_types_native_uint", "read_elf32_addr"),
   ID("elf_types_native_uint", "read_elf32_half"),
   ID("elf_types_native_uint", "read_elf32_off"),
   ID("elf_types_native_uint", "read_elf32_sword"),
   ID("elf_types_native_uint", "read_elf32_word"),
   ID("elf_types_native_uint", "read_elf64_addr"),
   ID("elf_types_native_uint", "read_elf64_half"),
   ID("elf_types_native_uint", "read_elf64_off"),
   ID("elf_types_native_uint", "read_elf64_sword"),
   ID("elf_types_native_uint", "read_elf64_sxword"),
   ID("elf_types_native_uint", "read_elf64_word"),
   ID("elf_types_native_uint", "read_elf64_xword"),
   ID("elf_types_native_uint", "read_unsigned_char"),
   ID("error", "return"),
   ID("elf_types_native_uint", "unsafe_natural_land"), ID("words", "w2n"),
   ID("words", "word_and")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [0, 0, 0], TYOP [0, 0, 1], TYOP [4], TYOP [7],
   TYOP [6, 4], TYOP [6, 5], TYOP [6, 6], TYOP [8], TYOP [5, 8, 7],
   TYOP [3, 9, 3], TYOP [2, 10], TYOP [0, 3, 11], TYV "'a",
   TYOP [0, 13, 12], TYOP [3, 13, 3], TYOP [2, 15], TYOP [0, 3, 16],
   TYOP [9], TYOP [0, 18, 17], TYOP [5, 8, 13], TYOP [0, 20, 0],
   TYOP [10, 13], TYV "'b", TYOP [0, 23, 22], TYOP [0, 18, 24],
   TYOP [0, 13, 8], TYOP [0, 26, 8], TYOP [0, 23, 8], TYOP [0, 28, 8],
   TYOP [0, 3, 8], TYOP [0, 30, 8], TYOP [0, 20, 8], TYOP [0, 32, 8],
   TYOP [0, 18, 8], TYOP [0, 34, 8], TYOP [0, 0, 8], TYOP [0, 36, 8],
   TYOP [0, 3, 15], TYOP [0, 13, 38], TYOP [0, 3, 10], TYOP [0, 9, 40],
   TYOP [0, 16, 8], TYOP [0, 16, 42], TYOP [0, 11, 8], TYOP [0, 11, 44],
   TYOP [0, 22, 8], TYOP [0, 22, 46], TYOP [0, 0, 36], TYOP [3, 13, 13],
   TYOP [0, 23, 49], TYOP [3, 13, 49], TYOP [3, 13, 51], TYOP [0, 23, 52],
   TYOP [3, 13, 52], TYOP [3, 13, 54], TYOP [3, 13, 55], TYOP [3, 13, 56],
   TYOP [0, 23, 57], TYOP [0, 9, 13], TYOP [0, 9, 59], TYOP [0, 9, 60],
   TYOP [0, 9, 61], TYOP [0, 9, 62], TYOP [0, 9, 63], TYOP [0, 9, 64],
   TYOP [0, 9, 65], TYOP [0, 22, 22], TYOP [0, 13, 67], TYOP [0, 49, 22],
   TYOP [0, 69, 69], TYOP [0, 52, 22], TYOP [0, 71, 71], TYOP [0, 57, 22],
   TYOP [0, 73, 73], TYOP [0, 13, 22], TYOP [0, 13, 75], TYOP [0, 76, 69],
   TYOP [0, 51, 22], TYOP [0, 13, 69], TYOP [0, 79, 78], TYOP [0, 13, 78],
   TYOP [0, 81, 71], TYOP [0, 54, 22], TYOP [0, 13, 71], TYOP [0, 84, 83],
   TYOP [0, 55, 22], TYOP [0, 13, 83], TYOP [0, 87, 86], TYOP [0, 56, 22],
   TYOP [0, 13, 86], TYOP [0, 90, 89], TYOP [0, 13, 89], TYOP [0, 92, 73],
   TYOP [0, 10, 11], TYOP [0, 9, 12], TYOP [0, 95, 94], TYOP [3, 9, 9],
   TYOP [0, 97, 17], TYOP [0, 9, 17], TYOP [0, 9, 99], TYOP [0, 100, 98],
   TYOP [3, 9, 97], TYOP [0, 102, 17], TYOP [0, 9, 98], TYOP [0, 104, 103],
   TYOP [3, 9, 102], TYOP [0, 106, 17], TYOP [0, 9, 103],
   TYOP [0, 108, 107], TYOP [3, 9, 106], TYOP [0, 110, 17],
   TYOP [0, 9, 107], TYOP [0, 112, 111], TYOP [3, 9, 110],
   TYOP [0, 114, 17], TYOP [0, 9, 111], TYOP [0, 116, 115],
   TYOP [3, 9, 114], TYOP [0, 118, 17], TYOP [0, 9, 115],
   TYOP [0, 120, 119], TYOP [3, 9, 118], TYOP [0, 122, 17],
   TYOP [0, 9, 119], TYOP [0, 124, 123], TYOP [3, 97, 3],
   TYOP [0, 126, 16], TYOP [0, 98, 127], TYOP [3, 106, 3],
   TYOP [0, 129, 16], TYOP [0, 107, 130], TYOP [3, 122, 3],
   TYOP [0, 132, 16], TYOP [0, 123, 133], TYOP [0, 16, 16],
   TYOP [0, 16, 135], TYOP [0, 18, 136], TYOP [0, 22, 67],
   TYOP [0, 18, 138], TYOP [0, 94, 11], TYOP [0, 11, 140],
   TYOP [0, 127, 16], TYOP [2, 126], TYOP [0, 143, 142], TYOP [0, 130, 16],
   TYOP [2, 129], TYOP [0, 146, 145], TYOP [0, 133, 16], TYOP [2, 132],
   TYOP [0, 149, 148], TYOP [0, 20, 20], TYOP [0, 9, 9], TYOP [6, 7],
   TYOP [6, 153], TYOP [6, 154], TYOP [5, 8, 155], TYOP [0, 0, 156],
   TYOP [0, 3, 143], TYOP [0, 3, 146], TYOP [0, 3, 149], TYOP [0, 15, 16],
   TYOP [0, 156, 0], TYOP [0, 156, 156], TYOP [0, 156, 163]]
  end
  val _ = Theory.incorporate_consts "elf_types_native_uint" tyvector
     [("unsafe_natural_land", 2), ("read_unsigned_char", 14),
      ("read_elf64_xword", 19), ("read_elf64_word", 19),
      ("read_elf64_sxword", 19), ("read_elf64_sword", 19),
      ("read_elf64_off", 19), ("read_elf64_half", 19),
      ("read_elf64_addr", 19), ("read_elf32_word", 19),
      ("read_elf32_sword", 19), ("read_elf32_off", 19),
      ("read_elf32_half", 19), ("read_elf32_addr", 19),
      ("natural_of_byte", 21), ("bytes_of_elf64_xword", 25),
      ("bytes_of_elf64_word", 25), ("bytes_of_elf64_sxword", 25),
      ("bytes_of_elf64_sword", 25), ("bytes_of_elf64_off", 25),
      ("bytes_of_elf64_half", 25), ("bytes_of_elf64_addr", 25),
      ("bytes_of_elf32_word", 25), ("bytes_of_elf32_sword", 25),
      ("bytes_of_elf32_off", 25), ("bytes_of_elf32_half", 25),
      ("bytes_of_elf32_addr", 25)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("arg1", 0), TMV("arg2", 0), TMV("b", 20), TMV("b0", 13),
   TMV("b1", 13), TMV("b1", 9), TMV("b2", 13), TMV("b2", 9), TMV("b3", 13),
   TMV("b3", 9), TMV("b4", 13), TMV("b4", 9), TMV("b5", 13), TMV("b5", 9),
   TMV("b6", 13), TMV("b6", 9), TMV("b7", 13), TMV("b7", 9), TMV("b8", 9),
   TMV("bs0", 3), TMV("bs1", 3), TMV("endian", 13), TMV("endian", 18),
   TMV("h", 23), TMV("u1", 9), TMV("w", 23), TMV("x", 23), TMC(11, 27),
   TMC(11, 29), TMC(11, 31), TMC(11, 33), TMC(11, 35), TMC(11, 37),
   TMC(12, 39), TMC(12, 41), TMC(13, 43), TMC(13, 45), TMC(13, 47),
   TMC(13, 48), TMC(14, 50), TMC(14, 53), TMC(14, 58), TMC(14, 60),
   TMC(14, 62), TMC(14, 66), TMC(15, 68), TMC(16, 70), TMC(16, 72),
   TMC(16, 74), TMC(17, 22), TMC(18, 77), TMC(18, 80), TMC(18, 82),
   TMC(18, 85), TMC(18, 88), TMC(18, 91), TMC(18, 93), TMC(18, 96),
   TMC(18, 101), TMC(18, 105), TMC(18, 109), TMC(18, 113), TMC(18, 117),
   TMC(18, 121), TMC(18, 125), TMC(18, 128), TMC(18, 131), TMC(18, 134),
   TMC(19, 25), TMC(20, 25), TMC(21, 25), TMC(22, 25), TMC(23, 25),
   TMC(24, 25), TMC(25, 25), TMC(26, 25), TMC(27, 25), TMC(28, 25),
   TMC(29, 25), TMC(30, 25), TMC(31, 137), TMC(31, 139), TMC(32, 141),
   TMC(32, 144), TMC(32, 147), TMC(32, 150), TMC(33, 151), TMC(33, 152),
   TMC(34, 157), TMC(35, 21), TMC(36, 158), TMC(37, 158), TMC(38, 159),
   TMC(39, 159), TMC(40, 160), TMC(41, 160), TMC(42, 12), TMC(43, 19),
   TMC(44, 19), TMC(45, 19), TMC(46, 19), TMC(47, 19), TMC(48, 19),
   TMC(49, 19), TMC(50, 19), TMC(51, 19), TMC(52, 19), TMC(53, 19),
   TMC(54, 19), TMC(55, 14), TMC(56, 161), TMC(56, 94), TMC(57, 2),
   TMC(58, 21), TMC(58, 162), TMC(59, 164)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op natural_of_byte_def x = x
    val op natural_of_byte_def =
    DT(((("elf_types_native_uint",0),[]),[]),
       [read"%30%2%38%89$0@@%113%86$0@@@|@"])
  fun op read_unsigned_char_def x = x
    val op read_unsigned_char_def =
    DT(((("elf_types_native_uint",1),[]),[]),
       [read"%27%21%29%19%36%109$1@$0@@%82%96$0@@%57%24%20%111%34%87$1@@$0@@||@@@|@|@"])
  fun op read_elf32_addr_def x = x
    val op read_elf32_addr_def =
    DT(((("elf_types_native_uint",2),[]),[]),
       [read"%31%22%29%19%35%97$1@$0@@%80$1@%84%92$0@@%66%60%5%59%7%58%9%11%20%110%33%43$1@$2@$3@$4@@$0@@|||@|@|@@@@%84%93$0@@%66%60%5%59%7%58%9%11%20%110%33%43$1@$2@$3@$4@@$0@@|||@|@|@@@@@|@|@"])
  fun op bytes_of_elf32_addr_def x = x
    val op bytes_of_elf32_addr_def =
    DT(((("elf_types_native_uint",3),[]),[]),
       [read"%31%22%28%25%37%68$1@$0@@%81$1@%47%52%3%51%4%50%6%8%45$0@%45$1@%45$2@%45$3@%49@@@@||@|@|@@%40$0@@@%47%52%3%51%4%50%6%8%45$3@%45$2@%45$1@%45$0@%49@@@@||@|@|@@%40$0@@@@|@|@"])
  fun op read_elf64_addr_def x = x
    val op read_elf64_addr_def =
    DT(((("elf_types_native_uint",4),[]),[]),
       [read"%31%22%29%19%35%102$1@$0@@%80$1@%85%94$0@@%67%64%5%63%7%62%9%61%11%60%13%59%15%58%17%18%20%110%33%44$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@%85%95$0@@%67%64%5%63%7%62%9%61%11%60%13%59%15%58%17%18%20%110%33%44$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@@|@|@"])
  fun op bytes_of_elf64_addr_def x = x
    val op bytes_of_elf64_addr_def =
    DT(((("elf_types_native_uint",5),[]),[]),
       [read"%31%22%28%25%37%73$1@$0@@%81$1@%48%56%3%55%4%54%6%53%8%52%10%51%12%50%14%16%45$0@%45$1@%45$2@%45$3@%45$4@%45$5@%45$6@%45$7@%49@@@@@@@@||@|@|@|@|@|@|@@%41$0@@@%48%56%3%55%4%54%6%53%8%52%10%51%12%50%14%16%45$7@%45$6@%45$5@%45$4@%45$3@%45$2@%45$1@%45$0@%49@@@@@@@@||@|@|@|@|@|@|@@%41$0@@@@|@|@"])
  fun op read_elf32_half_def x = x
    val op read_elf32_half_def =
    DT(((("elf_types_native_uint",6),[]),[]),
       [read"%31%22%29%19%35%98$1@$0@@%80$1@%83%90$0@@%65%58%5%7%20%110%33%42$1@$2@@$0@@|||@@@@%83%91$0@@%65%58%5%7%20%110%33%42$1@$2@@$0@@|||@@@@@|@|@"])
  fun op bytes_of_elf32_half_def x = x
    val op bytes_of_elf32_half_def =
    DT(((("elf_types_native_uint",7),[]),[]),
       [read"%31%22%28%23%37%69$1@$0@@%81$1@%46%50%3%4%45$0@%45$1@%49@@||@@%39$0@@@%46%50%3%4%45$1@%45$0@%49@@||@@%39$0@@@@|@|@"])
  fun op read_elf64_half_def x = x
    val op read_elf64_half_def =
    DT(((("elf_types_native_uint",8),[]),[]),
       [read"%31%22%29%19%35%103$1@$0@@%80$1@%83%90$0@@%65%58%5%7%20%110%33%42$1@$2@@$0@@|||@@@@%83%91$0@@%65%58%5%7%20%110%33%42$1@$2@@$0@@|||@@@@@|@|@"])
  fun op bytes_of_elf64_half_def x = x
    val op bytes_of_elf64_half_def =
    DT(((("elf_types_native_uint",9),[]),[]),
       [read"%31%22%28%25%37%74$1@$0@@%81$1@%46%50%3%4%45$0@%45$1@%49@@||@@%39$0@@@%46%50%3%4%45$1@%45$0@%49@@||@@%39$0@@@@|@|@"])
  fun op read_elf32_off_def x = x
    val op read_elf32_off_def =
    DT(((("elf_types_native_uint",10),[]),[]),
       [read"%31%22%29%19%35%99$1@$0@@%80$1@%84%92$0@@%66%60%5%59%7%58%9%11%20%110%33%43$1@$2@$3@$4@@$0@@|||@|@|@@@@%84%93$0@@%66%60%5%59%7%58%9%11%20%110%33%43$1@$2@$3@$4@@$0@@|||@|@|@@@@@|@|@"])
  fun op bytes_of_elf32_off_def x = x
    val op bytes_of_elf32_off_def =
    DT(((("elf_types_native_uint",11),[]),[]),
       [read"%31%22%28%25%37%70$1@$0@@%81$1@%47%52%3%51%4%50%6%8%45$0@%45$1@%45$2@%45$3@%49@@@@||@|@|@@%40$0@@@%47%52%3%51%4%50%6%8%45$3@%45$2@%45$1@%45$0@%49@@@@||@|@|@@%40$0@@@@|@|@"])
  fun op read_elf64_off_def x = x
    val op read_elf64_off_def =
    DT(((("elf_types_native_uint",12),[]),[]),
       [read"%31%22%29%19%35%104$1@$0@@%80$1@%85%94$0@@%67%64%5%63%7%62%9%61%11%60%13%59%15%58%17%18%20%110%33%44$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@%85%95$0@@%67%64%5%63%7%62%9%61%11%60%13%59%15%58%17%18%20%110%33%44$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@@|@|@"])
  fun op bytes_of_elf64_off_def x = x
    val op bytes_of_elf64_off_def =
    DT(((("elf_types_native_uint",13),[]),[]),
       [read"%31%22%28%25%37%75$1@$0@@%81$1@%48%56%3%55%4%54%6%53%8%52%10%51%12%50%14%16%45$0@%45$1@%45$2@%45$3@%45$4@%45$5@%45$6@%45$7@%49@@@@@@@@||@|@|@|@|@|@|@@%41$0@@@%48%56%3%55%4%54%6%53%8%52%10%51%12%50%14%16%45$7@%45$6@%45$5@%45$4@%45$3@%45$2@%45$1@%45$0@%49@@@@@@@@||@|@|@|@|@|@|@@%41$0@@@@|@|@"])
  fun op read_elf32_word_def x = x
    val op read_elf32_word_def =
    DT(((("elf_types_native_uint",14),[]),[]),
       [read"%31%22%29%19%35%101$1@$0@@%80$1@%84%92$0@@%66%60%5%59%7%58%9%11%20%110%33%43$1@$2@$3@$4@@$0@@|||@|@|@@@@%84%93$0@@%66%60%5%59%7%58%9%11%20%110%33%43$1@$2@$3@$4@@$0@@|||@|@|@@@@@|@|@"])
  fun op bytes_of_elf32_word_def x = x
    val op bytes_of_elf32_word_def =
    DT(((("elf_types_native_uint",15),[]),[]),
       [read"%31%22%28%25%37%72$1@$0@@%81$1@%47%52%3%51%4%50%6%8%45$0@%45$1@%45$2@%45$3@%49@@@@||@|@|@@%40$0@@@%47%52%3%51%4%50%6%8%45$3@%45$2@%45$1@%45$0@%49@@@@||@|@|@@%40$0@@@@|@|@"])
  fun op read_elf64_word_def x = x
    val op read_elf64_word_def =
    DT(((("elf_types_native_uint",16),[]),[]),
       [read"%31%22%29%19%35%107$1@$0@@%80$1@%84%92$0@@%66%60%5%59%7%58%9%11%20%110%33%43$1@$2@$3@$4@@$0@@|||@|@|@@@@%84%93$0@@%66%60%5%59%7%58%9%11%20%110%33%43$1@$2@$3@$4@@$0@@|||@|@|@@@@@|@|@"])
  fun op bytes_of_elf64_word_def x = x
    val op bytes_of_elf64_word_def =
    DT(((("elf_types_native_uint",17),[]),[]),
       [read"%31%22%28%25%37%78$1@$0@@%81$1@%47%52%3%51%4%50%6%8%45$0@%45$1@%45$2@%45$3@%49@@@@||@|@|@@%40$0@@@%47%52%3%51%4%50%6%8%45$3@%45$2@%45$1@%45$0@%49@@@@||@|@|@@%40$0@@@@|@|@"])
  fun op read_elf32_sword_def x = x
    val op read_elf32_sword_def =
    DT(((("elf_types_native_uint",18),[]),[]),
       [read"%31%22%29%19%35%100$1@$0@@%80$1@%84%92$0@@%66%60%5%59%7%58%9%11%20%110%33%43$1@$2@$3@$4@@$0@@|||@|@|@@@@%84%93$0@@%66%60%5%59%7%58%9%11%20%110%33%43$1@$2@$3@$4@@$0@@|||@|@|@@@@@|@|@"])
  fun op bytes_of_elf32_sword_def x = x
    val op bytes_of_elf32_sword_def =
    DT(((("elf_types_native_uint",19),[]),[]),
       [read"%31%22%28%25%37%71$1@$0@@%81$1@%47%52%3%51%4%50%6%8%45$0@%45$1@%45$2@%45$3@%49@@@@||@|@|@@%40$0@@@%47%52%3%51%4%50%6%8%45$3@%45$2@%45$1@%45$0@%49@@@@||@|@|@@%40$0@@@@|@|@"])
  fun op read_elf64_sword_def x = x
    val op read_elf64_sword_def =
    DT(((("elf_types_native_uint",20),[]),[]),
       [read"%31%22%29%19%35%105$1@$0@@%80$1@%84%92$0@@%66%60%5%59%7%58%9%11%20%110%33%43$1@$2@$3@$4@@$0@@|||@|@|@@@@%84%93$0@@%66%60%5%59%7%58%9%11%20%110%33%43$1@$2@$3@$4@@$0@@|||@|@|@@@@@|@|@"])
  fun op bytes_of_elf64_sword_def x = x
    val op bytes_of_elf64_sword_def =
    DT(((("elf_types_native_uint",21),[]),[]),
       [read"%31%22%28%25%37%76$1@$0@@%81$1@%47%52%3%51%4%50%6%8%45$0@%45$1@%45$2@%45$3@%49@@@@||@|@|@@%40$0@@@%47%52%3%51%4%50%6%8%45$3@%45$2@%45$1@%45$0@%49@@@@||@|@|@@%40$0@@@@|@|@"])
  fun op read_elf64_xword_def x = x
    val op read_elf64_xword_def =
    DT(((("elf_types_native_uint",22),[]),[]),
       [read"%31%22%29%19%35%108$1@$0@@%80$1@%85%94$0@@%67%64%5%63%7%62%9%61%11%60%13%59%15%58%17%18%20%110%33%44$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@%85%95$0@@%67%64%5%63%7%62%9%61%11%60%13%59%15%58%17%18%20%110%33%44$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@@|@|@"])
  fun op bytes_of_elf64_xword_def x = x
    val op bytes_of_elf64_xword_def =
    DT(((("elf_types_native_uint",23),[]),[]),
       [read"%31%22%28%26%37%79$1@$0@@%81$1@%48%56%3%55%4%54%6%53%8%52%10%51%12%50%14%16%45$0@%45$1@%45$2@%45$3@%45$4@%45$5@%45$6@%45$7@%49@@@@@@@@||@|@|@|@|@|@|@@%41$0@@@%48%56%3%55%4%54%6%53%8%52%10%51%12%50%14%16%45$7@%45$6@%45$5@%45$4@%45$3@%45$2@%45$1@%45$0@%49@@@@@@@@||@|@|@|@|@|@|@@%41$0@@@@|@|@"])
  fun op read_elf64_sxword_def x = x
    val op read_elf64_sxword_def =
    DT(((("elf_types_native_uint",24),[]),[]),
       [read"%31%22%29%19%35%106$1@$0@@%80$1@%85%94$0@@%67%64%5%63%7%62%9%61%11%60%13%59%15%58%17%18%20%110%33%44$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@%85%95$0@@%67%64%5%63%7%62%9%61%11%60%13%59%15%58%17%18%20%110%33%44$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@@|@|@"])
  fun op bytes_of_elf64_sxword_def x = x
    val op bytes_of_elf64_sxword_def =
    DT(((("elf_types_native_uint",25),[]),[]),
       [read"%31%22%28%25%37%77$1@$0@@%81$1@%48%56%3%55%4%54%6%53%8%52%10%51%12%50%14%16%45$0@%45$1@%45$2@%45$3@%45$4@%45$5@%45$6@%45$7@%49@@@@@@@@||@|@|@|@|@|@|@@%41$0@@@%48%56%3%55%4%54%6%53%8%52%10%51%12%50%14%16%45$7@%45$6@%45$5@%45$4@%45$3@%45$2@%45$1@%45$0@%49@@@@@@@@||@|@|@|@|@|@|@@%41$0@@@@|@|@"])
  fun op unsafe_natural_land_def x = x
    val op unsafe_natural_land_def =
    DT(((("elf_types_native_uint",26),[]),[]),
       [read"%32%0%32%1%38%112$1@$0@@%114%115%88$1@@%88$0@@@@|@|@"])
  end
  val _ = DB.bindl "elf_types_native_uint"
  [("natural_of_byte_def",natural_of_byte_def,DB.Def),
   ("read_unsigned_char_def",read_unsigned_char_def,DB.Def),
   ("read_elf32_addr_def",read_elf32_addr_def,DB.Def),
   ("bytes_of_elf32_addr_def",bytes_of_elf32_addr_def,DB.Def),
   ("read_elf64_addr_def",read_elf64_addr_def,DB.Def),
   ("bytes_of_elf64_addr_def",bytes_of_elf64_addr_def,DB.Def),
   ("read_elf32_half_def",read_elf32_half_def,DB.Def),
   ("bytes_of_elf32_half_def",bytes_of_elf32_half_def,DB.Def),
   ("read_elf64_half_def",read_elf64_half_def,DB.Def),
   ("bytes_of_elf64_half_def",bytes_of_elf64_half_def,DB.Def),
   ("read_elf32_off_def",read_elf32_off_def,DB.Def),
   ("bytes_of_elf32_off_def",bytes_of_elf32_off_def,DB.Def),
   ("read_elf64_off_def",read_elf64_off_def,DB.Def),
   ("bytes_of_elf64_off_def",bytes_of_elf64_off_def,DB.Def),
   ("read_elf32_word_def",read_elf32_word_def,DB.Def),
   ("bytes_of_elf32_word_def",bytes_of_elf32_word_def,DB.Def),
   ("read_elf64_word_def",read_elf64_word_def,DB.Def),
   ("bytes_of_elf64_word_def",bytes_of_elf64_word_def,DB.Def),
   ("read_elf32_sword_def",read_elf32_sword_def,DB.Def),
   ("bytes_of_elf32_sword_def",bytes_of_elf32_sword_def,DB.Def),
   ("read_elf64_sword_def",read_elf64_sword_def,DB.Def),
   ("bytes_of_elf64_sword_def",bytes_of_elf64_sword_def,DB.Def),
   ("read_elf64_xword_def",read_elf64_xword_def,DB.Def),
   ("bytes_of_elf64_xword_def",bytes_of_elf64_xword_def,DB.Def),
   ("read_elf64_sxword_def",read_elf64_sxword_def,DB.Def),
   ("bytes_of_elf64_sxword_def",bytes_of_elf64_sxword_def,DB.Def),
   ("unsafe_natural_land_def",unsafe_natural_land_def,DB.Def)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("integer_wordTheory.integer_word_grammars",
                          integer_wordTheory.integer_word_grammars),
                         ("endiannessTheory.endianness_grammars",
                          endiannessTheory.endianness_grammars),
                         ("byte_sequenceTheory.byte_sequence_grammars",
                          byte_sequenceTheory.byte_sequence_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_byte", (Term.prim_mk_const { Name = "natural_of_byte", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_of_byte", (Term.prim_mk_const { Name = "natural_of_byte", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_unsigned_char", (Term.prim_mk_const { Name = "read_unsigned_char", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_unsigned_char", (Term.prim_mk_const { Name = "read_unsigned_char", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_addr", (Term.prim_mk_const { Name = "read_elf32_addr", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_addr", (Term.prim_mk_const { Name = "read_elf32_addr", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_addr", (Term.prim_mk_const { Name = "bytes_of_elf32_addr", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_addr", (Term.prim_mk_const { Name = "bytes_of_elf32_addr", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_addr", (Term.prim_mk_const { Name = "read_elf64_addr", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_addr", (Term.prim_mk_const { Name = "read_elf64_addr", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_addr", (Term.prim_mk_const { Name = "bytes_of_elf64_addr", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_addr", (Term.prim_mk_const { Name = "bytes_of_elf64_addr", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_half", (Term.prim_mk_const { Name = "read_elf32_half", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_half", (Term.prim_mk_const { Name = "read_elf32_half", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_half", (Term.prim_mk_const { Name = "bytes_of_elf32_half", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_half", (Term.prim_mk_const { Name = "bytes_of_elf32_half", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_half", (Term.prim_mk_const { Name = "read_elf64_half", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_half", (Term.prim_mk_const { Name = "read_elf64_half", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_half", (Term.prim_mk_const { Name = "bytes_of_elf64_half", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_half", (Term.prim_mk_const { Name = "bytes_of_elf64_half", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_off", (Term.prim_mk_const { Name = "read_elf32_off", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_off", (Term.prim_mk_const { Name = "read_elf32_off", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_off", (Term.prim_mk_const { Name = "bytes_of_elf32_off", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_off", (Term.prim_mk_const { Name = "bytes_of_elf32_off", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_off", (Term.prim_mk_const { Name = "read_elf64_off", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_off", (Term.prim_mk_const { Name = "read_elf64_off", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_off", (Term.prim_mk_const { Name = "bytes_of_elf64_off", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_off", (Term.prim_mk_const { Name = "bytes_of_elf64_off", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_word", (Term.prim_mk_const { Name = "read_elf32_word", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_word", (Term.prim_mk_const { Name = "read_elf32_word", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_word", (Term.prim_mk_const { Name = "bytes_of_elf32_word", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_word", (Term.prim_mk_const { Name = "bytes_of_elf32_word", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_word", (Term.prim_mk_const { Name = "read_elf64_word", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_word", (Term.prim_mk_const { Name = "read_elf64_word", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_word", (Term.prim_mk_const { Name = "bytes_of_elf64_word", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_word", (Term.prim_mk_const { Name = "bytes_of_elf64_word", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_sword", (Term.prim_mk_const { Name = "read_elf32_sword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_sword", (Term.prim_mk_const { Name = "read_elf32_sword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_sword", (Term.prim_mk_const { Name = "bytes_of_elf32_sword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_sword", (Term.prim_mk_const { Name = "bytes_of_elf32_sword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_sword", (Term.prim_mk_const { Name = "read_elf64_sword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_sword", (Term.prim_mk_const { Name = "read_elf64_sword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_sword", (Term.prim_mk_const { Name = "bytes_of_elf64_sword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_sword", (Term.prim_mk_const { Name = "bytes_of_elf64_sword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_xword", (Term.prim_mk_const { Name = "read_elf64_xword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_xword", (Term.prim_mk_const { Name = "read_elf64_xword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_xword", (Term.prim_mk_const { Name = "bytes_of_elf64_xword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_xword", (Term.prim_mk_const { Name = "bytes_of_elf64_xword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_sxword", (Term.prim_mk_const { Name = "read_elf64_sxword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_sxword", (Term.prim_mk_const { Name = "read_elf64_sxword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_sxword", (Term.prim_mk_const { Name = "bytes_of_elf64_sxword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_sxword", (Term.prim_mk_const { Name = "bytes_of_elf64_sxword", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("unsafe_natural_land", (Term.prim_mk_const { Name = "unsafe_natural_land", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("unsafe_natural_land", (Term.prim_mk_const { Name = "unsafe_natural_land", Thy = "elf_types_native_uint"}))
  val elf_types_native_uint_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "elf_types_native_uint",
    thydataty = "compute",
    data =
        "elf_types_native_uint.natural_of_byte_def elf_types_native_uint.unsafe_natural_land_def elf_types_native_uint.read_elf64_xword_def elf_types_native_uint.bytes_of_elf64_sxword_def elf_types_native_uint.read_elf64_sxword_def elf_types_native_uint.bytes_of_elf64_xword_def elf_types_native_uint.read_elf64_sword_def elf_types_native_uint.bytes_of_elf64_sword_def elf_types_native_uint.read_elf64_word_def elf_types_native_uint.bytes_of_elf32_sword_def elf_types_native_uint.read_elf32_sword_def elf_types_native_uint.bytes_of_elf64_word_def elf_types_native_uint.read_elf64_half_def elf_types_native_uint.bytes_of_elf32_word_def elf_types_native_uint.read_elf32_word_def elf_types_native_uint.bytes_of_elf64_off_def elf_types_native_uint.read_elf64_off_def elf_types_native_uint.bytes_of_elf32_off_def elf_types_native_uint.read_elf32_off_def elf_types_native_uint.bytes_of_elf64_half_def elf_types_native_uint.read_elf32_addr_def elf_types_native_uint.bytes_of_elf32_half_def elf_types_native_uint.read_elf32_half_def elf_types_native_uint.bytes_of_elf64_addr_def elf_types_native_uint.read_elf64_addr_def elf_types_native_uint.bytes_of_elf32_addr_def elf_types_native_uint.read_unsigned_char_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "elf_types_native_uint"
end
