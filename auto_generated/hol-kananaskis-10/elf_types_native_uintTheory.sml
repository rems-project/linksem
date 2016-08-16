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
          Arbnum.fromString "1471355144",
          Arbnum.fromString "97434")
          [("endianness",
           Arbnum.fromString "1471355107",
           Arbnum.fromString "587994"),
           ("byte_sequence",
           Arbnum.fromString "1471355124",
           Arbnum.fromString "333438"),
           ("integer_word",
           Arbnum.fromString "1471268055",
           Arbnum.fromString "845339")];
  val _ = Theory.incorporate_types "elf_types_native_uint" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("error", "error"), ID("pair", "prod"),
   ID("byte_sequence", "byte_sequence"), ID("fcp", "cart"),
   ID("fcp", "bit0"), ID("one", "one"), ID("min", "bool"),
   ID("endianness", "endianness"), ID("num", "num"),
   ID("show", "Show_class"), ID("list", "list"), ID("bool", "!"),
   ID("pair", ","), ID("min", "="), ID("bool", "ARB"), ID("list", "CONS"),
   ID("combin", "I"), ID("combin", "K"), ID("string", "char"),
   ID("bool", "LET"), ID("list", "NIL"),
   ID("show", "Show_class_show_method_fupd"), ID("pair", "UNCURRY"),
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
   ID("elf_types_native_uint", "bytes_of_unsigned_char"),
   ID("elf_local", "dual_of_uint16"), ID("endianness", "endianness_CASE"),
   ID("error", "error_bind"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_elf32_addr_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_elf32_half_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_elf32_off_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_elf32_sword_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_elf32_word_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_elf64_addr_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_elf64_half_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_elf64_off_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_elf64_sword_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_elf64_sxword_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_elf64_word_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_elf64_xword_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_unsigned_char_dict"),
   ID("elf_local", "int_to_dec_string"), ID("integer", "int"),
   ID("words", "n2w"), ID("elf_types_native_uint", "natural_land"),
   ID("elf_types_native_uint", "natural_lor"),
   ID("elf_types_native_uint", "natural_lxor"),
   ID("elf_types_native_uint", "natural_of_byte"),
   ID("ASCIInumbers", "num_to_dec_string"), ID("combin", "o"),
   ID("elf_local", "oct_of_sint64"), ID("elf_local", "oct_of_uint64"),
   ID("elf_local", "quad_of_sint32"), ID("elf_local", "quad_of_uint32"),
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
   ID("error", "return"), ID("elf_local", "sint32_of_quad"),
   ID("elf_local", "sint64_of_oct"), ID("elf_local", "uint16_of_dual"),
   ID("elf_local", "uint32_of_quad"), ID("elf_local", "uint64_of_oct"),
   ID("integer_word", "w2i"), ID("words", "w2n"), ID("words", "word_and"),
   ID("words", "word_or"), ID("words", "word_xor")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [3], TYOP [6], TYOP [5, 1], TYOP [5, 2], TYOP [5, 3], TYOP [7],
   TYOP [4, 5, 4], TYOP [2, 6, 0], TYOP [1, 7], TYOP [0, 0, 8], TYV "'a",
   TYOP [0, 10, 9], TYOP [5, 4], TYOP [5, 12], TYOP [5, 13],
   TYOP [4, 5, 14], TYOP [2, 15, 0], TYOP [1, 16], TYOP [0, 0, 17],
   TYOP [8], TYOP [0, 19, 18], TYOP [4, 5, 13], TYOP [2, 21, 0],
   TYOP [1, 22], TYOP [0, 0, 23], TYOP [0, 19, 24], TYOP [4, 5, 12],
   TYOP [2, 26, 0], TYOP [1, 27], TYOP [0, 0, 28], TYOP [0, 19, 29],
   TYOP [9], TYOP [4, 5, 10], TYOP [0, 32, 31], TYOP [0, 31, 31],
   TYOP [0, 31, 34], TYOP [10, 32], TYOP [11, 10], TYOP [0, 10, 37],
   TYOP [11, 6], TYOP [0, 15, 39], TYOP [0, 19, 40], TYOP [0, 21, 39],
   TYOP [0, 19, 42], TYOP [0, 26, 39], TYOP [0, 19, 44], TYOP [0, 10, 5],
   TYOP [0, 46, 5], TYOP [0, 0, 5], TYOP [0, 48, 5], TYOP [0, 32, 5],
   TYOP [0, 50, 5], TYOP [0, 15, 5], TYOP [0, 52, 5], TYOP [0, 21, 5],
   TYOP [0, 54, 5], TYOP [0, 26, 5], TYOP [0, 56, 5], TYOP [0, 19, 5],
   TYOP [0, 58, 5], TYOP [0, 31, 5], TYOP [0, 60, 5], TYOP [0, 0, 16],
   TYOP [0, 15, 62], TYOP [0, 0, 22], TYOP [0, 21, 64], TYOP [0, 0, 27],
   TYOP [0, 26, 66], TYOP [0, 0, 7], TYOP [0, 6, 68], TYOP [0, 36, 5],
   TYOP [0, 36, 70], TYOP [0, 17, 5], TYOP [0, 17, 72], TYOP [0, 23, 5],
   TYOP [0, 23, 74], TYOP [0, 28, 5], TYOP [0, 28, 76], TYOP [0, 8, 5],
   TYOP [0, 8, 78], TYOP [0, 37, 5], TYOP [0, 37, 80], TYOP [0, 39, 5],
   TYOP [0, 39, 82], TYOP [0, 31, 60], TYOP [0, 37, 37], TYOP [0, 10, 85],
   TYOP [0, 39, 39], TYOP [0, 6, 87], TYOP [0, 10, 10], TYOP [0, 32, 32],
   TYOP [0, 6, 6], TYOP [19], TYOP [11, 92], TYOP [0, 32, 93],
   TYOP [0, 94, 94], TYOP [0, 94, 95], TYOP [2, 6, 6], TYOP [0, 97, 39],
   TYOP [0, 98, 98], TYOP [2, 6, 97], TYOP [2, 6, 100], TYOP [0, 101, 39],
   TYOP [0, 102, 102], TYOP [2, 6, 101], TYOP [2, 6, 104],
   TYOP [2, 6, 105], TYOP [2, 6, 106], TYOP [0, 107, 39],
   TYOP [0, 108, 108], TYOP [0, 36, 36], TYOP [0, 95, 110], TYOP [0, 7, 8],
   TYOP [0, 6, 9], TYOP [0, 113, 112], TYOP [0, 97, 18], TYOP [0, 6, 18],
   TYOP [0, 6, 116], TYOP [0, 117, 115], TYOP [0, 97, 24], TYOP [0, 6, 24],
   TYOP [0, 6, 120], TYOP [0, 121, 119], TYOP [0, 97, 29], TYOP [0, 6, 29],
   TYOP [0, 6, 124], TYOP [0, 125, 123], TYOP [0, 6, 39], TYOP [0, 6, 127],
   TYOP [0, 128, 98], TYOP [0, 100, 18], TYOP [0, 6, 115],
   TYOP [0, 131, 130], TYOP [0, 100, 24], TYOP [0, 6, 119],
   TYOP [0, 134, 133], TYOP [0, 100, 39], TYOP [0, 6, 98],
   TYOP [0, 137, 136], TYOP [0, 101, 18], TYOP [0, 6, 130],
   TYOP [0, 140, 139], TYOP [0, 101, 24], TYOP [0, 6, 133],
   TYOP [0, 143, 142], TYOP [0, 6, 136], TYOP [0, 145, 102],
   TYOP [0, 104, 18], TYOP [0, 6, 139], TYOP [0, 148, 147],
   TYOP [0, 104, 39], TYOP [0, 6, 102], TYOP [0, 151, 150],
   TYOP [0, 105, 18], TYOP [0, 6, 147], TYOP [0, 154, 153],
   TYOP [0, 105, 39], TYOP [0, 6, 150], TYOP [0, 157, 156],
   TYOP [0, 106, 18], TYOP [0, 6, 153], TYOP [0, 160, 159],
   TYOP [0, 106, 39], TYOP [0, 6, 156], TYOP [0, 163, 162],
   TYOP [0, 107, 18], TYOP [0, 6, 159], TYOP [0, 166, 165],
   TYOP [0, 6, 162], TYOP [0, 168, 108], TYOP [2, 97, 0],
   TYOP [0, 170, 28], TYOP [0, 123, 171], TYOP [2, 101, 0],
   TYOP [0, 173, 23], TYOP [0, 142, 174], TYOP [2, 107, 0],
   TYOP [0, 176, 17], TYOP [0, 165, 177], TYOP [0, 26, 97],
   TYOP [0, 17, 17], TYOP [0, 17, 180], TYOP [0, 19, 181],
   TYOP [0, 23, 23], TYOP [0, 23, 183], TYOP [0, 19, 184],
   TYOP [0, 28, 28], TYOP [0, 28, 186], TYOP [0, 19, 187],
   TYOP [0, 39, 87], TYOP [0, 19, 189], TYOP [0, 112, 8], TYOP [0, 8, 191],
   TYOP [0, 171, 28], TYOP [1, 170], TYOP [0, 194, 193], TYOP [0, 174, 23],
   TYOP [1, 173], TYOP [0, 197, 196], TYOP [0, 177, 17], TYOP [1, 176],
   TYOP [0, 200, 199], TYOP [54], TYOP [0, 202, 93], TYOP [0, 31, 15],
   TYOP [0, 31, 93], TYOP [0, 32, 202], TYOP [0, 206, 94],
   TYOP [0, 203, 207], TYOP [0, 33, 94], TYOP [0, 205, 209],
   TYOP [0, 15, 107], TYOP [0, 21, 101], TYOP [0, 0, 194],
   TYOP [0, 0, 197], TYOP [0, 0, 200], TYOP [0, 16, 17], TYOP [0, 22, 23],
   TYOP [0, 27, 28], TYOP [0, 6, 21], TYOP [0, 6, 219], TYOP [0, 6, 220],
   TYOP [0, 6, 221], TYOP [0, 6, 15], TYOP [0, 6, 223], TYOP [0, 6, 224],
   TYOP [0, 6, 225], TYOP [0, 6, 226], TYOP [0, 6, 227], TYOP [0, 6, 228],
   TYOP [0, 6, 229], TYOP [0, 6, 26], TYOP [0, 6, 231], TYOP [0, 15, 31],
   TYOP [0, 15, 15], TYOP [0, 15, 234]]
  end
  val _ = Theory.incorporate_consts "elf_types_native_uint" tyvector
     [("read_unsigned_char", 11), ("read_elf64_xword", 20),
      ("read_elf64_word", 25), ("read_elf64_sxword", 20),
      ("read_elf64_sword", 25), ("read_elf64_off", 20),
      ("read_elf64_half", 30), ("read_elf64_addr", 20),
      ("read_elf32_word", 25), ("read_elf32_sword", 25),
      ("read_elf32_off", 25), ("read_elf32_half", 30),
      ("read_elf32_addr", 25), ("natural_of_byte", 33),
      ("natural_lxor", 35), ("natural_lor", 35), ("natural_land", 35),
      ("instance_Show_Show_Elf_types_native_uint_unsigned_char_dict", 36),
      ("instance_Show_Show_Elf_types_native_uint_elf64_xword_dict", 36),
      ("instance_Show_Show_Elf_types_native_uint_elf64_word_dict", 36),
      ("instance_Show_Show_Elf_types_native_uint_elf64_sxword_dict", 36),
      ("instance_Show_Show_Elf_types_native_uint_elf64_sword_dict", 36),
      ("instance_Show_Show_Elf_types_native_uint_elf64_off_dict", 36),
      ("instance_Show_Show_Elf_types_native_uint_elf64_half_dict", 36),
      ("instance_Show_Show_Elf_types_native_uint_elf64_addr_dict", 36),
      ("instance_Show_Show_Elf_types_native_uint_elf32_word_dict", 36),
      ("instance_Show_Show_Elf_types_native_uint_elf32_sword_dict", 36),
      ("instance_Show_Show_Elf_types_native_uint_elf32_off_dict", 36),
      ("instance_Show_Show_Elf_types_native_uint_elf32_half_dict", 36),
      ("instance_Show_Show_Elf_types_native_uint_elf32_addr_dict", 36),
      ("bytes_of_unsigned_char", 38), ("bytes_of_elf64_xword", 41),
      ("bytes_of_elf64_word", 43), ("bytes_of_elf64_sxword", 41),
      ("bytes_of_elf64_sword", 43), ("bytes_of_elf64_off", 41),
      ("bytes_of_elf64_half", 45), ("bytes_of_elf64_addr", 41),
      ("bytes_of_elf32_word", 43), ("bytes_of_elf32_sword", 43),
      ("bytes_of_elf32_off", 43), ("bytes_of_elf32_half", 45),
      ("bytes_of_elf32_addr", 43)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("b", 32), TMV("b0", 6), TMV("b1", 6), TMV("b2", 6), TMV("b3", 6),
   TMV("b4", 6), TMV("b5", 6), TMV("b6", 6), TMV("b7", 6), TMV("b8", 6),
   TMV("bs0", 0), TMV("bs1", 0), TMV("endian", 10), TMV("endian", 19),
   TMV("h", 26), TMV("m", 31), TMV("n", 31), TMV("u", 10), TMV("u1", 6),
   TMV("w", 15), TMV("w", 21), TMV("w", 26), TMV("x", 32), TMV("x", 15),
   TMC(12, 47), TMC(12, 49), TMC(12, 51), TMC(12, 53), TMC(12, 55),
   TMC(12, 57), TMC(12, 59), TMC(12, 61), TMC(13, 63), TMC(13, 65),
   TMC(13, 67), TMC(13, 69), TMC(14, 71), TMC(14, 73), TMC(14, 75),
   TMC(14, 77), TMC(14, 79), TMC(14, 81), TMC(14, 83), TMC(14, 84),
   TMC(15, 36), TMC(16, 86), TMC(16, 88), TMC(17, 89), TMC(17, 90),
   TMC(17, 91), TMC(18, 96), TMC(20, 99), TMC(20, 103), TMC(20, 109),
   TMC(21, 37), TMC(21, 39), TMC(22, 111), TMC(23, 114), TMC(23, 118),
   TMC(23, 122), TMC(23, 126), TMC(23, 129), TMC(23, 132), TMC(23, 135),
   TMC(23, 138), TMC(23, 141), TMC(23, 144), TMC(23, 146), TMC(23, 149),
   TMC(23, 152), TMC(23, 155), TMC(23, 158), TMC(23, 161), TMC(23, 164),
   TMC(23, 167), TMC(23, 169), TMC(23, 172), TMC(23, 175), TMC(23, 178),
   TMC(24, 43), TMC(25, 45), TMC(26, 43), TMC(27, 43), TMC(28, 43),
   TMC(29, 41), TMC(30, 45), TMC(31, 41), TMC(32, 43), TMC(33, 41),
   TMC(34, 43), TMC(35, 41), TMC(36, 38), TMC(37, 179), TMC(38, 182),
   TMC(38, 185), TMC(38, 188), TMC(38, 190), TMC(39, 192), TMC(39, 195),
   TMC(39, 198), TMC(39, 201), TMC(40, 36), TMC(41, 36), TMC(42, 36),
   TMC(43, 36), TMC(44, 36), TMC(45, 36), TMC(46, 36), TMC(47, 36),
   TMC(48, 36), TMC(49, 36), TMC(50, 36), TMC(51, 36), TMC(52, 36),
   TMC(53, 203), TMC(55, 204), TMC(56, 35), TMC(57, 35), TMC(58, 35),
   TMC(59, 33), TMC(60, 205), TMC(61, 208), TMC(61, 210), TMC(62, 211),
   TMC(63, 211), TMC(64, 212), TMC(65, 212), TMC(66, 213), TMC(67, 213),
   TMC(68, 214), TMC(69, 214), TMC(70, 215), TMC(71, 215), TMC(72, 9),
   TMC(73, 25), TMC(74, 30), TMC(75, 25), TMC(76, 25), TMC(77, 25),
   TMC(78, 20), TMC(79, 30), TMC(80, 20), TMC(81, 25), TMC(82, 20),
   TMC(83, 25), TMC(84, 20), TMC(85, 11), TMC(86, 216), TMC(86, 217),
   TMC(86, 218), TMC(86, 112), TMC(87, 222), TMC(88, 230), TMC(89, 232),
   TMC(90, 222), TMC(91, 230), TMC(92, 206), TMC(93, 33), TMC(93, 233),
   TMC(94, 235), TMC(95, 235), TMC(96, 235)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op natural_of_byte_def x = x
    val op natural_of_byte_def =
    DT(((("elf_types_native_uint",0),[]),[]),
       [read"%26%0%43%119$0@@%157%48$0@@@|@"])
  fun op read_unsigned_char_def x = x
    val op read_unsigned_char_def =
    DT(((("elf_types_native_uint",1),[]),[]),
       [read"%24%12%25%10%40%146$1@$0@@%97%133$0@@%57%18%11%150%35%49$1@@$0@@||@@@|@|@"])
  fun op bytes_of_unsigned_char_def x = x
    val op bytes_of_unsigned_char_def =
    DT(((("elf_types_native_uint",2),[]),[]),
       [read"%24%17%41%91$0@@%45%47$0@@%54@@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_unsigned_char_dict_def
    x = x
    val op instance_Show_Show_Elf_types_native_uint_unsigned_char_dict_def
    =
    DT(((("elf_types_native_uint",3),[]),[]),
       [read"%36%113@%56%50%22%122%120@%157@$0@|@@%44@@"])
  fun op read_elf32_addr_def x = x
    val op read_elf32_addr_def =
    DT(((("elf_types_native_uint",4),[]),[]),
       [read"%30%13%25%10%38%134$1@$0@@%94$1@%99%129$0@@%77%66%2%63%3%59%4%5%11%148%33%154$1@$2@$3@$4@@$0@@|||@|@|@@@@%99%130$0@@%77%66%2%63%3%59%4%5%11%148%33%154$1@$2@$3@$4@@$0@@|||@|@|@@@@@|@|@"])
  fun op bytes_of_elf32_addr_def x = x
    val op bytes_of_elf32_addr_def =
    DT(((("elf_types_native_uint",5),[]),[]),
       [read"%30%13%28%20%42%79$1@$0@@%96$1@%52%67%1%64%2%61%3%4%46$0@%46$1@%46$2@%46$3@%55@@@@||@|@|@@%126$0@@@%52%67%1%64%2%61%3%4%46$3@%46$2@%46$1@%46$0@%55@@@@||@|@|@@%126$0@@@@|@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_elf32_addr_dict_def x = x
    val op instance_Show_Show_Elf_types_native_uint_elf32_addr_dict_def =
    DT(((("elf_types_native_uint",6),[]),[]),
       [read"%36%101@%56%50%22%122%120@%157@$0@|@@%44@@"])
  fun op read_elf64_addr_def x = x
    val op read_elf64_addr_def =
    DT(((("elf_types_native_uint",7),[]),[]),
       [read"%30%13%25%10%37%139$1@$0@@%93$1@%100%131$0@@%78%74%2%72%3%70%4%68%5%65%6%62%7%58%8%9%11%147%32%155$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@%100%132$0@@%78%74%2%72%3%70%4%68%5%65%6%62%7%58%8%9%11%147%32%155$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@@|@|@"])
  fun op bytes_of_elf64_addr_def x = x
    val op bytes_of_elf64_addr_def =
    DT(((("elf_types_native_uint",8),[]),[]),
       [read"%30%13%27%19%42%84$1@$0@@%96$1@%53%75%1%73%2%71%3%69%4%67%5%64%6%61%7%8%46$0@%46$1@%46$2@%46$3@%46$4@%46$5@%46$6@%46$7@%55@@@@@@@@||@|@|@|@|@|@|@@%124$0@@@%53%75%1%73%2%71%3%69%4%67%5%64%6%61%7%8%46$7@%46$6@%46$5@%46$4@%46$3@%46$2@%46$1@%46$0@%55@@@@@@@@||@|@|@|@|@|@|@@%124$0@@@@|@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_elf64_addr_dict_def x = x
    val op instance_Show_Show_Elf_types_native_uint_elf64_addr_dict_def =
    DT(((("elf_types_native_uint",9),[]),[]),
       [read"%36%106@%56%50%22%122%120@%157@$0@|@@%44@@"])
  fun op read_elf32_half_def x = x
    val op read_elf32_half_def =
    DT(((("elf_types_native_uint",10),[]),[]),
       [read"%30%13%25%10%39%135$1@$0@@%95$1@%98%127$0@@%76%60%2%3%11%149%34%153$1@$2@@$0@@|||@@@@%98%128$0@@%76%60%2%3%11%149%34%153$1@$2@@$0@@|||@@@@@|@|@"])
  fun op bytes_of_elf32_half_def x = x
    val op bytes_of_elf32_half_def =
    DT(((("elf_types_native_uint",11),[]),[]),
       [read"%30%13%29%14%42%80$1@$0@@%96$1@%51%61%1%2%46$0@%46$1@%55@@||@@%92$0@@@%51%61%1%2%46$1@%46$0@%55@@||@@%92$0@@@@|@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_elf32_half_dict_def x = x
    val op instance_Show_Show_Elf_types_native_uint_elf32_half_dict_def =
    DT(((("elf_types_native_uint",12),[]),[]),
       [read"%36%102@%56%50%22%122%120@%157@$0@|@@%44@@"])
  fun op read_elf64_half_def x = x
    val op read_elf64_half_def =
    DT(((("elf_types_native_uint",13),[]),[]),
       [read"%30%13%25%10%39%140$1@$0@@%95$1@%98%127$0@@%76%60%2%3%11%149%34%153$1@$2@@$0@@|||@@@@%98%128$0@@%76%60%2%3%11%149%34%153$1@$2@@$0@@|||@@@@@|@|@"])
  fun op bytes_of_elf64_half_def x = x
    val op bytes_of_elf64_half_def =
    DT(((("elf_types_native_uint",14),[]),[]),
       [read"%30%13%29%21%42%85$1@$0@@%96$1@%51%61%1%2%46$0@%46$1@%55@@||@@%92$0@@@%51%61%1%2%46$1@%46$0@%55@@||@@%92$0@@@@|@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_elf64_half_dict_def x = x
    val op instance_Show_Show_Elf_types_native_uint_elf64_half_dict_def =
    DT(((("elf_types_native_uint",15),[]),[]),
       [read"%36%107@%56%50%22%122%120@%157@$0@|@@%44@@"])
  fun op read_elf32_off_def x = x
    val op read_elf32_off_def =
    DT(((("elf_types_native_uint",16),[]),[]),
       [read"%30%13%25%10%38%136$1@$0@@%94$1@%99%129$0@@%77%66%2%63%3%59%4%5%11%148%33%154$1@$2@$3@$4@@$0@@|||@|@|@@@@%99%130$0@@%77%66%2%63%3%59%4%5%11%148%33%154$1@$2@$3@$4@@$0@@|||@|@|@@@@@|@|@"])
  fun op bytes_of_elf32_off_def x = x
    val op bytes_of_elf32_off_def =
    DT(((("elf_types_native_uint",17),[]),[]),
       [read"%30%13%28%20%42%81$1@$0@@%96$1@%52%67%1%64%2%61%3%4%46$0@%46$1@%46$2@%46$3@%55@@@@||@|@|@@%126$0@@@%52%67%1%64%2%61%3%4%46$3@%46$2@%46$1@%46$0@%55@@@@||@|@|@@%126$0@@@@|@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_elf32_off_dict_def x = x
    val op instance_Show_Show_Elf_types_native_uint_elf32_off_dict_def =
    DT(((("elf_types_native_uint",18),[]),[]),
       [read"%36%103@%56%50%22%122%120@%157@$0@|@@%44@@"])
  fun op read_elf64_off_def x = x
    val op read_elf64_off_def =
    DT(((("elf_types_native_uint",19),[]),[]),
       [read"%30%13%25%10%37%141$1@$0@@%93$1@%100%131$0@@%78%74%2%72%3%70%4%68%5%65%6%62%7%58%8%9%11%147%32%155$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@%100%132$0@@%78%74%2%72%3%70%4%68%5%65%6%62%7%58%8%9%11%147%32%155$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@@|@|@"])
  fun op bytes_of_elf64_off_def x = x
    val op bytes_of_elf64_off_def =
    DT(((("elf_types_native_uint",20),[]),[]),
       [read"%30%13%27%19%42%86$1@$0@@%96$1@%53%75%1%73%2%71%3%69%4%67%5%64%6%61%7%8%46$0@%46$1@%46$2@%46$3@%46$4@%46$5@%46$6@%46$7@%55@@@@@@@@||@|@|@|@|@|@|@@%124$0@@@%53%75%1%73%2%71%3%69%4%67%5%64%6%61%7%8%46$7@%46$6@%46$5@%46$4@%46$3@%46$2@%46$1@%46$0@%55@@@@@@@@||@|@|@|@|@|@|@@%124$0@@@@|@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_elf64_off_dict_def x = x
    val op instance_Show_Show_Elf_types_native_uint_elf64_off_dict_def =
    DT(((("elf_types_native_uint",21),[]),[]),
       [read"%36%108@%56%50%22%122%120@%157@$0@|@@%44@@"])
  fun op read_elf32_word_def x = x
    val op read_elf32_word_def =
    DT(((("elf_types_native_uint",22),[]),[]),
       [read"%30%13%25%10%38%138$1@$0@@%94$1@%99%129$0@@%77%66%2%63%3%59%4%5%11%148%33%154$1@$2@$3@$4@@$0@@|||@|@|@@@@%99%130$0@@%77%66%2%63%3%59%4%5%11%148%33%154$1@$2@$3@$4@@$0@@|||@|@|@@@@@|@|@"])
  fun op bytes_of_elf32_word_def x = x
    val op bytes_of_elf32_word_def =
    DT(((("elf_types_native_uint",23),[]),[]),
       [read"%30%13%28%20%42%83$1@$0@@%96$1@%52%67%1%64%2%61%3%4%46$0@%46$1@%46$2@%46$3@%55@@@@||@|@|@@%126$0@@@%52%67%1%64%2%61%3%4%46$3@%46$2@%46$1@%46$0@%55@@@@||@|@|@@%126$0@@@@|@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_elf32_word_dict_def x = x
    val op instance_Show_Show_Elf_types_native_uint_elf32_word_dict_def =
    DT(((("elf_types_native_uint",24),[]),[]),
       [read"%36%105@%56%50%22%122%120@%157@$0@|@@%44@@"])
  fun op read_elf64_word_def x = x
    val op read_elf64_word_def =
    DT(((("elf_types_native_uint",25),[]),[]),
       [read"%30%13%25%10%38%144$1@$0@@%94$1@%99%129$0@@%77%66%2%63%3%59%4%5%11%148%33%154$1@$2@$3@$4@@$0@@|||@|@|@@@@%99%130$0@@%77%66%2%63%3%59%4%5%11%148%33%154$1@$2@$3@$4@@$0@@|||@|@|@@@@@|@|@"])
  fun op bytes_of_elf64_word_def x = x
    val op bytes_of_elf64_word_def =
    DT(((("elf_types_native_uint",26),[]),[]),
       [read"%30%13%28%20%42%89$1@$0@@%96$1@%52%67%1%64%2%61%3%4%46$0@%46$1@%46$2@%46$3@%55@@@@||@|@|@@%126$0@@@%52%67%1%64%2%61%3%4%46$3@%46$2@%46$1@%46$0@%55@@@@||@|@|@@%126$0@@@@|@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_elf64_word_dict_def x = x
    val op instance_Show_Show_Elf_types_native_uint_elf64_word_dict_def =
    DT(((("elf_types_native_uint",27),[]),[]),
       [read"%36%111@%56%50%22%122%120@%157@$0@|@@%44@@"])
  fun op read_elf32_sword_def x = x
    val op read_elf32_sword_def =
    DT(((("elf_types_native_uint",28),[]),[]),
       [read"%30%13%25%10%38%137$1@$0@@%94$1@%99%129$0@@%77%66%2%63%3%59%4%5%11%148%33%151$1@$2@$3@$4@@$0@@|||@|@|@@@@%99%130$0@@%77%66%2%63%3%59%4%5%11%148%33%151$1@$2@$3@$4@@$0@@|||@|@|@@@@@|@|@"])
  fun op bytes_of_elf32_sword_def x = x
    val op bytes_of_elf32_sword_def =
    DT(((("elf_types_native_uint",29),[]),[]),
       [read"%30%13%28%20%42%82$1@$0@@%96$1@%52%67%1%64%2%61%3%4%46$0@%46$1@%46$2@%46$3@%55@@@@||@|@|@@%125$0@@@%52%67%1%64%2%61%3%4%46$3@%46$2@%46$1@%46$0@%55@@@@||@|@|@@%125$0@@@@|@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_elf32_sword_dict_def
    x = x
    val op instance_Show_Show_Elf_types_native_uint_elf32_sword_dict_def =
    DT(((("elf_types_native_uint",30),[]),[]),
       [read"%36%104@%56%50%121%114@%156@@@%44@@"])
  fun op read_elf64_sword_def x = x
    val op read_elf64_sword_def =
    DT(((("elf_types_native_uint",31),[]),[]),
       [read"%30%13%25%10%38%142$1@$0@@%94$1@%99%129$0@@%77%66%2%63%3%59%4%5%11%148%33%151$1@$2@$3@$4@@$0@@|||@|@|@@@@%99%130$0@@%77%66%2%63%3%59%4%5%11%148%33%151$1@$2@$3@$4@@$0@@|||@|@|@@@@@|@|@"])
  fun op bytes_of_elf64_sword_def x = x
    val op bytes_of_elf64_sword_def =
    DT(((("elf_types_native_uint",32),[]),[]),
       [read"%30%13%28%20%42%87$1@$0@@%96$1@%52%67%1%64%2%61%3%4%46$0@%46$1@%46$2@%46$3@%55@@@@||@|@|@@%125$0@@@%52%67%1%64%2%61%3%4%46$3@%46$2@%46$1@%46$0@%55@@@@||@|@|@@%125$0@@@@|@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_elf64_sword_dict_def
    x = x
    val op instance_Show_Show_Elf_types_native_uint_elf64_sword_dict_def =
    DT(((("elf_types_native_uint",33),[]),[]),
       [read"%36%109@%56%50%121%114@%156@@@%44@@"])
  fun op read_elf64_xword_def x = x
    val op read_elf64_xword_def =
    DT(((("elf_types_native_uint",34),[]),[]),
       [read"%30%13%25%10%37%145$1@$0@@%93$1@%100%131$0@@%78%74%2%72%3%70%4%68%5%65%6%62%7%58%8%9%11%147%32%155$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@%100%132$0@@%78%74%2%72%3%70%4%68%5%65%6%62%7%58%8%9%11%147%32%155$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@@|@|@"])
  fun op bytes_of_elf64_xword_def x = x
    val op bytes_of_elf64_xword_def =
    DT(((("elf_types_native_uint",35),[]),[]),
       [read"%30%13%27%23%42%90$1@$0@@%96$1@%53%75%1%73%2%71%3%69%4%67%5%64%6%61%7%8%46$0@%46$1@%46$2@%46$3@%46$4@%46$5@%46$6@%46$7@%55@@@@@@@@||@|@|@|@|@|@|@@%124$0@@@%53%75%1%73%2%71%3%69%4%67%5%64%6%61%7%8%46$7@%46$6@%46$5@%46$4@%46$3@%46$2@%46$1@%46$0@%55@@@@@@@@||@|@|@|@|@|@|@@%124$0@@@@|@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_elf64_xword_dict_def
    x = x
    val op instance_Show_Show_Elf_types_native_uint_elf64_xword_dict_def =
    DT(((("elf_types_native_uint",36),[]),[]),
       [read"%36%112@%56%50%22%122%120@%157@$0@|@@%44@@"])
  fun op read_elf64_sxword_def x = x
    val op read_elf64_sxword_def =
    DT(((("elf_types_native_uint",37),[]),[]),
       [read"%30%13%25%10%37%143$1@$0@@%93$1@%100%131$0@@%78%74%2%72%3%70%4%68%5%65%6%62%7%58%8%9%11%147%32%152$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@%100%132$0@@%78%74%2%72%3%70%4%68%5%65%6%62%7%58%8%9%11%147%32%152$1@$2@$3@$4@$5@$6@$7@$8@@$0@@|||@|@|@|@|@|@|@@@@@|@|@"])
  fun op bytes_of_elf64_sxword_def x = x
    val op bytes_of_elf64_sxword_def =
    DT(((("elf_types_native_uint",38),[]),[]),
       [read"%30%13%27%19%42%88$1@$0@@%96$1@%53%75%1%73%2%71%3%69%4%67%5%64%6%61%7%8%46$0@%46$1@%46$2@%46$3@%46$4@%46$5@%46$6@%46$7@%55@@@@@@@@||@|@|@|@|@|@|@@%123$0@@@%53%75%1%73%2%71%3%69%4%67%5%64%6%61%7%8%46$7@%46$6@%46$5@%46$4@%46$3@%46$2@%46$1@%46$0@%55@@@@@@@@||@|@|@|@|@|@|@@%123$0@@@@|@|@"])
  fun op instance_Show_Show_Elf_types_native_uint_elf64_sxword_dict_def
    x = x
    val op instance_Show_Show_Elf_types_native_uint_elf64_sxword_dict_def =
    DT(((("elf_types_native_uint",39),[]),[]),
       [read"%36%110@%56%50%121%114@%156@@@%44@@"])
  fun op natural_land_def x = x
    val op natural_land_def =
    DT(((("elf_types_native_uint",40),[]),[]),
       [read"%31%15%31%16%43%116$1@$0@@%158%159%115$1@@%115$0@@@@|@|@"])
  fun op natural_lor_def x = x
    val op natural_lor_def =
    DT(((("elf_types_native_uint",41),[]),[]),
       [read"%31%15%31%16%43%117$1@$0@@%158%160%115$1@@%115$0@@@@|@|@"])
  fun op natural_lxor_def x = x
    val op natural_lxor_def =
    DT(((("elf_types_native_uint",42),[]),[]),
       [read"%31%15%31%16%43%118$1@$0@@%158%161%115$1@@%115$0@@@@|@|@"])
  end
  val _ = DB.bindl "elf_types_native_uint"
  [("natural_of_byte_def",natural_of_byte_def,DB.Def),
   ("read_unsigned_char_def",read_unsigned_char_def,DB.Def),
   ("bytes_of_unsigned_char_def",bytes_of_unsigned_char_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_unsigned_char_dict_def",
    instance_Show_Show_Elf_types_native_uint_unsigned_char_dict_def,
    DB.Def), ("read_elf32_addr_def",read_elf32_addr_def,DB.Def),
   ("bytes_of_elf32_addr_def",bytes_of_elf32_addr_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_elf32_addr_dict_def",
    instance_Show_Show_Elf_types_native_uint_elf32_addr_dict_def,
    DB.Def), ("read_elf64_addr_def",read_elf64_addr_def,DB.Def),
   ("bytes_of_elf64_addr_def",bytes_of_elf64_addr_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_elf64_addr_dict_def",
    instance_Show_Show_Elf_types_native_uint_elf64_addr_dict_def,
    DB.Def), ("read_elf32_half_def",read_elf32_half_def,DB.Def),
   ("bytes_of_elf32_half_def",bytes_of_elf32_half_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_elf32_half_dict_def",
    instance_Show_Show_Elf_types_native_uint_elf32_half_dict_def,
    DB.Def), ("read_elf64_half_def",read_elf64_half_def,DB.Def),
   ("bytes_of_elf64_half_def",bytes_of_elf64_half_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_elf64_half_dict_def",
    instance_Show_Show_Elf_types_native_uint_elf64_half_dict_def,
    DB.Def), ("read_elf32_off_def",read_elf32_off_def,DB.Def),
   ("bytes_of_elf32_off_def",bytes_of_elf32_off_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_elf32_off_dict_def",
    instance_Show_Show_Elf_types_native_uint_elf32_off_dict_def,
    DB.Def), ("read_elf64_off_def",read_elf64_off_def,DB.Def),
   ("bytes_of_elf64_off_def",bytes_of_elf64_off_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_elf64_off_dict_def",
    instance_Show_Show_Elf_types_native_uint_elf64_off_dict_def,
    DB.Def), ("read_elf32_word_def",read_elf32_word_def,DB.Def),
   ("bytes_of_elf32_word_def",bytes_of_elf32_word_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_elf32_word_dict_def",
    instance_Show_Show_Elf_types_native_uint_elf32_word_dict_def,
    DB.Def), ("read_elf64_word_def",read_elf64_word_def,DB.Def),
   ("bytes_of_elf64_word_def",bytes_of_elf64_word_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_elf64_word_dict_def",
    instance_Show_Show_Elf_types_native_uint_elf64_word_dict_def,
    DB.Def), ("read_elf32_sword_def",read_elf32_sword_def,DB.Def),
   ("bytes_of_elf32_sword_def",bytes_of_elf32_sword_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_elf32_sword_dict_def",
    instance_Show_Show_Elf_types_native_uint_elf32_sword_dict_def,
    DB.Def), ("read_elf64_sword_def",read_elf64_sword_def,DB.Def),
   ("bytes_of_elf64_sword_def",bytes_of_elf64_sword_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_elf64_sword_dict_def",
    instance_Show_Show_Elf_types_native_uint_elf64_sword_dict_def,
    DB.Def), ("read_elf64_xword_def",read_elf64_xword_def,DB.Def),
   ("bytes_of_elf64_xword_def",bytes_of_elf64_xword_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_elf64_xword_dict_def",
    instance_Show_Show_Elf_types_native_uint_elf64_xword_dict_def,
    DB.Def), ("read_elf64_sxword_def",read_elf64_sxword_def,DB.Def),
   ("bytes_of_elf64_sxword_def",bytes_of_elf64_sxword_def,DB.Def),
   ("instance_Show_Show_Elf_types_native_uint_elf64_sxword_dict_def",
    instance_Show_Show_Elf_types_native_uint_elf64_sxword_dict_def,
    DB.Def), ("natural_land_def",natural_land_def,DB.Def),
   ("natural_lor_def",natural_lor_def,DB.Def),
   ("natural_lxor_def",natural_lxor_def,DB.Def)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("endiannessTheory.endianness_grammars",
                          endiannessTheory.endianness_grammars),
                         ("byte_sequenceTheory.byte_sequence_grammars",
                          byte_sequenceTheory.byte_sequence_grammars),
                         ("integer_wordTheory.integer_word_grammars",
                          integer_wordTheory.integer_word_grammars)]
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
       ("bytes_of_unsigned_char", (Term.prim_mk_const { Name = "bytes_of_unsigned_char", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_unsigned_char", (Term.prim_mk_const { Name = "bytes_of_unsigned_char", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_unsigned_char_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_unsigned_char_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_unsigned_char_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_unsigned_char_dict", Thy = "elf_types_native_uint"}))
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
       ("instance_Show_Show_Elf_types_native_uint_elf32_addr_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf32_addr_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_elf32_addr_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf32_addr_dict", Thy = "elf_types_native_uint"}))
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
       ("instance_Show_Show_Elf_types_native_uint_elf64_addr_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_addr_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_elf64_addr_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_addr_dict", Thy = "elf_types_native_uint"}))
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
       ("instance_Show_Show_Elf_types_native_uint_elf32_half_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf32_half_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_elf32_half_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf32_half_dict", Thy = "elf_types_native_uint"}))
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
       ("instance_Show_Show_Elf_types_native_uint_elf64_half_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_half_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_elf64_half_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_half_dict", Thy = "elf_types_native_uint"}))
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
       ("instance_Show_Show_Elf_types_native_uint_elf32_off_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf32_off_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_elf32_off_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf32_off_dict", Thy = "elf_types_native_uint"}))
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
       ("instance_Show_Show_Elf_types_native_uint_elf64_off_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_off_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_elf64_off_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_off_dict", Thy = "elf_types_native_uint"}))
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
       ("instance_Show_Show_Elf_types_native_uint_elf32_word_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf32_word_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_elf32_word_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf32_word_dict", Thy = "elf_types_native_uint"}))
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
       ("instance_Show_Show_Elf_types_native_uint_elf64_word_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_word_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_elf64_word_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_word_dict", Thy = "elf_types_native_uint"}))
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
       ("instance_Show_Show_Elf_types_native_uint_elf32_sword_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf32_sword_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_elf32_sword_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf32_sword_dict", Thy = "elf_types_native_uint"}))
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
       ("instance_Show_Show_Elf_types_native_uint_elf64_sword_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_sword_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_elf64_sword_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_sword_dict", Thy = "elf_types_native_uint"}))
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
       ("instance_Show_Show_Elf_types_native_uint_elf64_xword_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_xword_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_elf64_xword_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_xword_dict", Thy = "elf_types_native_uint"}))
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
       ("instance_Show_Show_Elf_types_native_uint_elf64_sxword_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_sxword_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_types_native_uint_elf64_sxword_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_types_native_uint_elf64_sxword_dict", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_land", (Term.prim_mk_const { Name = "natural_land", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_land", (Term.prim_mk_const { Name = "natural_land", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_lor", (Term.prim_mk_const { Name = "natural_lor", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_lor", (Term.prim_mk_const { Name = "natural_lor", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_lxor", (Term.prim_mk_const { Name = "natural_lxor", Thy = "elf_types_native_uint"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("natural_lxor", (Term.prim_mk_const { Name = "natural_lxor", Thy = "elf_types_native_uint"}))
  val elf_types_native_uint_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "elf_types_native_uint",
    thydataty = "compute",
    data =
        "elf_types_native_uint.natural_of_byte_def elf_types_native_uint.read_elf64_xword_def elf_types_native_uint.natural_lxor_def elf_types_native_uint.natural_lor_def elf_types_native_uint.natural_land_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_elf64_sxword_dict_def elf_types_native_uint.bytes_of_elf64_sxword_def elf_types_native_uint.read_elf64_sxword_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_elf64_xword_dict_def elf_types_native_uint.bytes_of_elf64_xword_def elf_types_native_uint.read_elf64_sword_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_elf64_sword_dict_def elf_types_native_uint.bytes_of_elf64_sword_def elf_types_native_uint.read_elf64_word_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_elf32_sword_dict_def elf_types_native_uint.bytes_of_elf32_sword_def elf_types_native_uint.read_elf32_sword_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_elf64_word_dict_def elf_types_native_uint.bytes_of_elf64_word_def elf_types_native_uint.read_elf64_half_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_elf32_word_dict_def elf_types_native_uint.bytes_of_elf32_word_def elf_types_native_uint.read_elf32_word_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_elf64_off_dict_def elf_types_native_uint.bytes_of_elf64_off_def elf_types_native_uint.read_elf64_off_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_elf32_off_dict_def elf_types_native_uint.bytes_of_elf32_off_def elf_types_native_uint.read_elf32_off_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_elf64_half_dict_def elf_types_native_uint.bytes_of_elf64_half_def elf_types_native_uint.read_elf32_addr_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_elf32_half_dict_def elf_types_native_uint.bytes_of_elf32_half_def elf_types_native_uint.read_elf32_half_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_elf64_addr_dict_def elf_types_native_uint.bytes_of_elf64_addr_def elf_types_native_uint.read_elf64_addr_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_elf32_addr_dict_def elf_types_native_uint.bytes_of_elf32_addr_def elf_types_native_uint.read_unsigned_char_def elf_types_native_uint.instance_Show_Show_Elf_types_native_uint_unsigned_char_dict_def elf_types_native_uint.bytes_of_unsigned_char_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "elf_types_native_uint"
end
