structure elf_interpreted_sectionTheory :> elf_interpreted_sectionTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading elf_interpreted_sectionTheory ... " else ()
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
          ("elf_interpreted_section",
          Arbnum.fromString "1471355254",
          Arbnum.fromString "150296")
          [("elf_section_header_table",
           Arbnum.fromString "1471355220",
           Arbnum.fromString "107187")];
  val _ = Theory.incorporate_types "elf_interpreted_section"
       [("elf64_interpreted_section", 0),
        ("elf32_interpreted_section", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"),
   ID("elf_interpreted_section", "elf64_interpreted_section"),
   ID("list", "list"), ID("string", "char"),
   ID("byte_sequence", "byte_sequence"), ID("num", "num"),
   ID("elf_interpreted_section", "elf32_interpreted_section"),
   ID("min", "bool"), ID("string_table", "string_table"),
   ID("lem_basic_classes", "Ord_class"),
   ID("elf_section_header_table", "elf64_section_header_table_entry"),
   ID("lem_basic_classes", "ordering"), ID("ind_type", "recspace"),
   ID("pair", "prod"), ID("min", "ind"), ID("bool", "!"),
   ID("arithmetic", "+"), ID("pair", ","), ID("bool", "/\\"),
   ID("num", "0"), ID("prim_rec", "<"), ID("min", "="), ID("min", "==>"),
   ID("bool", "?"), ID("bool", "ARB"), ID("arithmetic", "BIT1"),
   ID("ind_type", "BOTTOM"), ID("list", "CONS"), ID("ind_type", "CONSTR"),
   ID("bool", "DATATYPE"), ID("pred_set", "EMPTY"),
   ID("lem_basic_classes", "EQ"), ID("list", "EVERY"), ID("bool", "F"),
   ID("finite_map", "FLOOKUP"), ID("option", "option"),
   ID("finite_map", "fmap"), ID("lem_basic_classes", "GT"),
   ID("bool", "IN"), ID("pred_set", "INSERT"), ID("combin", "K"),
   ID("lem_basic_classes", "LT"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("bool", "TYPE_DEFINITION"), ID("arithmetic", "ZERO"),
   ID("byte_sequence", "byte_sequence_size"), ID("string", "char_size"),
   ID("byte_sequence", "compare_byte_sequence"),
   ID("elf_interpreted_section", "compare_elf64_interpreted_section"),
   ID("elf_interpreted_section", "elf32_interpreted_section_CASE"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_addr"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_addr_fupd"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_align"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_align_fupd"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_body"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_body_fupd"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_entsize"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_entsize_fupd"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_flags"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_flags_fupd"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_info"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_info_fupd"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_link"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_link_fupd"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_name"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_name_as_string"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_name_as_string_fupd"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_name_fupd"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_offset"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_offset_fupd"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_size"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_size_fupd"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_type"),
   ID("elf_interpreted_section", "elf32_interpreted_section_elf32_section_type_fupd"),
   ID("elf_interpreted_section", "elf32_interpreted_section_equal"),
   ID("elf_interpreted_section", "elf32_interpreted_section_size"),
   ID("elf_interpreted_section", "elf64_interpreted_section_CASE"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_addr"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_addr_fupd"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_align"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_align_fupd"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_body"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_body_fupd"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_entsize"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_entsize_fupd"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_flags"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_flags_fupd"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_info"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_info_fupd"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_link"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_link_fupd"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_name"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_name_as_string"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_name_as_string_fupd"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_name_fupd"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_offset"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_offset_fupd"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_size"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_size_fupd"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_type"),
   ID("elf_interpreted_section", "elf64_interpreted_section_elf64_section_type_fupd"),
   ID("elf_interpreted_section", "elf64_interpreted_section_equal"),
   ID("elf_interpreted_section", "elf64_interpreted_section_matches_section_header"),
   ID("elf_interpreted_section", "elf64_interpreted_section_size"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_addr"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_addralign"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_entsize"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_flags"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_info"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_link"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_name"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_offset"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_size"),
   ID("elf_section_header_table", "elf64_section_header_table_entry_elf64_sh_type"),
   ID("elf_section_header_table", "elf_special_sections"),
   ID("byte_sequence", "empty"), ID("byte_sequence", "equal"),
   ID("error", "error_CASE"), ID("error", "error"),
   ID("lem_basic_classes", "genericCompare"),
   ID("string_table", "get_string_at"),
   ID("elf_interpreted_section", "instance_Basic_classes_Ord_Elf_interpreted_section_elf64_interpreted_section_dict"),
   ID("elf_interpreted_section", "is_valid_elf32_section_header_table0"),
   ID("elf_interpreted_section", "is_valid_elf32_section_header_table_entry"),
   ID("elf_interpreted_section", "is_valid_elf64_section_header_table0"),
   ID("elf_interpreted_section", "is_valid_elf64_section_header_table_entry"),
   ID("lem_list", "lexicographic_compare"), ID("list", "list_size"),
   ID("elf_interpreted_section", "null_elf32_interpreted_section"),
   ID("elf_interpreted_section", "null_elf64_interpreted_section"),
   ID("combin", "o"), ID("option", "option_CASE"),
   ID("lem_basic_classes", "pairCompare"), ID("pair", "pair_CASE"),
   ID("elf_interpreted_section", "recordtype.elf32_interpreted_section"),
   ID("elf_interpreted_section", "recordtype.elf64_interpreted_section"),
   ID("words", "w2n")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [3], TYOP [2, 1], TYOP [0, 2, 0], TYOP [4],
   TYOP [0, 4, 3], TYOP [5], TYOP [0, 6, 5], TYOP [0, 6, 7],
   TYOP [0, 6, 8], TYOP [0, 6, 9], TYOP [0, 6, 10], TYOP [0, 6, 11],
   TYOP [0, 6, 12], TYOP [0, 6, 13], TYOP [0, 6, 14], TYOP [0, 6, 15],
   TYOP [6], TYOP [0, 2, 17], TYOP [0, 4, 18], TYOP [0, 6, 19],
   TYOP [0, 6, 20], TYOP [0, 6, 21], TYOP [0, 6, 22], TYOP [0, 6, 23],
   TYOP [0, 6, 24], TYOP [0, 6, 25], TYOP [0, 6, 26], TYOP [0, 6, 27],
   TYOP [0, 6, 28], TYOP [7], TYOP [8], TYOP [0, 31, 30], TYOP [0, 0, 32],
   TYOP [2, 0], TYOP [0, 34, 32], TYOP [0, 17, 32], TYOP [2, 17],
   TYOP [0, 37, 32], TYOP [9, 0], TYOP [0, 0, 6], TYOP [10],
   TYOP [0, 41, 30], TYOP [0, 0, 42], TYOP [0, 0, 30], TYOP [0, 0, 44],
   TYOP [0, 0, 0], TYOP [0, 6, 6], TYOP [0, 47, 46], TYOP [0, 2, 2],
   TYOP [0, 49, 46], TYOP [0, 0, 2], TYOP [0, 4, 4], TYOP [0, 52, 46],
   TYOP [0, 0, 4], TYV "'a", TYOP [0, 2, 55], TYOP [0, 4, 56],
   TYOP [0, 6, 57], TYOP [0, 6, 58], TYOP [0, 6, 59], TYOP [0, 6, 60],
   TYOP [0, 6, 61], TYOP [0, 6, 62], TYOP [0, 6, 63], TYOP [0, 6, 64],
   TYOP [0, 6, 65], TYOP [0, 6, 66], TYOP [0, 67, 55], TYOP [0, 0, 68],
   TYOP [0, 17, 6], TYOP [0, 17, 30], TYOP [0, 17, 71], TYOP [0, 17, 17],
   TYOP [0, 47, 73], TYOP [0, 49, 73], TYOP [0, 17, 2], TYOP [0, 52, 73],
   TYOP [0, 17, 4], TYOP [0, 17, 68], TYOP [11], TYOP [0, 0, 80],
   TYOP [0, 0, 81], TYOP [13, 4, 2], TYOP [13, 6, 83], TYOP [13, 6, 84],
   TYOP [13, 6, 85], TYOP [13, 6, 86], TYOP [13, 6, 87], TYOP [13, 6, 88],
   TYOP [13, 6, 89], TYOP [13, 6, 90], TYOP [13, 6, 91], TYOP [13, 6, 92],
   TYOP [12, 93], TYOP [0, 94, 30], TYOP [14], TYOP [0, 17, 55],
   TYOP [0, 0, 55], TYOP [0, 55, 17], TYOP [0, 55, 0], TYOP [0, 2, 30],
   TYOP [0, 4, 101], TYOP [0, 6, 102], TYOP [0, 6, 103], TYOP [0, 6, 104],
   TYOP [0, 6, 105], TYOP [0, 6, 106], TYOP [0, 6, 107], TYOP [0, 6, 108],
   TYOP [0, 6, 109], TYOP [0, 6, 110], TYOP [0, 6, 111], TYOP [0, 96, 112],
   TYOP [0, 17, 94], TYOP [0, 0, 94], TYOP [13, 6, 6], TYOP [0, 4, 30],
   TYOP [0, 117, 30], TYOP [0, 71, 30], TYOP [0, 44, 30], TYOP [0, 42, 30],
   TYOP [0, 99, 30], TYOP [0, 122, 30], TYOP [0, 100, 30],
   TYOP [0, 124, 30], TYOP [0, 52, 30], TYOP [0, 126, 30],
   TYOP [0, 119, 30], TYOP [0, 120, 30], TYOP [0, 49, 30],
   TYOP [0, 130, 30], TYOP [0, 67, 30], TYOP [0, 132, 30],
   TYOP [0, 47, 30], TYOP [0, 134, 30], TYOP [0, 95, 30],
   TYOP [0, 136, 30], TYOP [0, 101, 30], TYOP [0, 37, 30],
   TYOP [0, 139, 30], TYOP [0, 34, 30], TYOP [0, 141, 30], TYOP [0, 6, 30],
   TYOP [0, 143, 30], TYOP [0, 32, 30], TYOP [0, 6, 47], TYOP [0, 2, 83],
   TYOP [0, 4, 147], TYOP [2, 6], TYOP [13, 149, 4], TYOP [0, 4, 150],
   TYOP [0, 149, 151], TYOP [0, 83, 84], TYOP [0, 6, 153],
   TYOP [0, 84, 85], TYOP [0, 6, 155], TYOP [0, 85, 86], TYOP [0, 6, 157],
   TYOP [0, 86, 87], TYOP [0, 6, 159], TYOP [0, 87, 88], TYOP [0, 6, 161],
   TYOP [0, 88, 89], TYOP [0, 6, 163], TYOP [0, 89, 90], TYOP [0, 6, 165],
   TYOP [0, 90, 91], TYOP [0, 6, 167], TYOP [0, 91, 92], TYOP [0, 6, 169],
   TYOP [0, 92, 93], TYOP [0, 6, 171], TYOP [0, 30, 30], TYOP [0, 30, 173],
   TYOP [0, 6, 143], TYOP [0, 55, 30], TYOP [0, 55, 176], TYOP [0, 39, 30],
   TYOP [0, 39, 178], TYOP [0, 4, 117], TYOP [0, 99, 122],
   TYOP [0, 100, 124], TYOP [0, 73, 30], TYOP [0, 73, 183],
   TYOP [0, 46, 30], TYOP [0, 46, 185], TYOP [0, 2, 101], TYOP [0, 80, 30],
   TYOP [0, 80, 188], TYOP [0, 94, 95], TYOP [0, 97, 30],
   TYOP [0, 191, 30], TYOP [0, 114, 30], TYOP [0, 193, 30],
   TYOP [0, 98, 30], TYOP [0, 195, 30], TYOP [0, 115, 30],
   TYOP [0, 197, 30], TYOP [0, 149, 149], TYOP [0, 6, 199],
   TYOP [0, 6, 94], TYOP [0, 201, 94], TYOP [0, 93, 202], TYOP [0, 6, 203],
   TYOP [0, 71, 139], TYOP [0, 44, 141], TYOP [35, 116], TYOP [0, 2, 207],
   TYOP [36, 2, 116], TYOP [0, 209, 208], TYOP [0, 188, 30],
   TYOP [0, 80, 211], TYOP [0, 188, 188], TYOP [0, 80, 213],
   TYOP [0, 4, 52], TYOP [0, 45, 45], TYOP [0, 45, 216], TYOP [0, 82, 82],
   TYOP [0, 82, 218], TYOP [0, 2, 49], TYOP [0, 39, 39],
   TYOP [0, 218, 221], TYOP [0, 216, 221], TYOP [0, 95, 193],
   TYOP [0, 95, 197], TYOP [0, 4, 6], TYOP [0, 1, 6], TYOP [0, 4, 80],
   TYOP [0, 4, 228], TYOP [113], TYOP [112, 230], TYOP [112, 231],
   TYOP [112, 232], TYOP [112, 233], TYOP [112, 234], TYOP [112, 235],
   TYOP [111, 30, 236], TYOP [0, 41, 237], TYOP [111, 30, 235],
   TYOP [0, 41, 239], TYOP [0, 101, 138], TYOP [127, 2],
   TYOP [0, 242, 241], TYOP [0, 6, 80], TYOP [0, 6, 244],
   TYOP [0, 175, 245], TYOP [0, 175, 246], TYOP [0, 31, 242],
   TYOP [0, 6, 248], TYOP [0, 149, 80], TYOP [0, 149, 250],
   TYOP [0, 245, 251], TYOP [0, 2, 6], TYOP [0, 227, 253],
   TYOP [0, 52, 52], TYOP [0, 52, 255], TYOP [0, 99, 99],
   TYOP [0, 73, 257], TYOP [0, 73, 73], TYOP [0, 73, 259],
   TYOP [0, 100, 100], TYOP [0, 46, 261], TYOP [0, 46, 46],
   TYOP [0, 46, 263], TYOP [0, 49, 49], TYOP [0, 49, 265],
   TYOP [0, 47, 47], TYOP [0, 47, 267], TYOP [0, 116, 30],
   TYOP [0, 269, 30], TYOP [0, 30, 270], TYOP [0, 207, 271],
   TYOP [0, 150, 80], TYOP [0, 150, 273], TYOP [0, 229, 274],
   TYOP [0, 251, 275], TYOP [0, 175, 30], TYOP [0, 116, 277],
   TYOP [0, 237, 6], TYOP [0, 239, 6]]
  end
  val _ = Theory.incorporate_consts "elf_interpreted_section" tyvector
     [("recordtype.elf64_interpreted_section", 16),
      ("recordtype.elf32_interpreted_section", 29),
      ("null_elf64_interpreted_section", 0),
      ("null_elf32_interpreted_section", 17),
      ("is_valid_elf64_section_header_table_entry", 33),
      ("is_valid_elf64_section_header_table0", 35),
      ("is_valid_elf32_section_header_table_entry", 36),
      ("is_valid_elf32_section_header_table0", 38),
      ("instance_Basic_classes_Ord_Elf_interpreted_section_elf64_interpreted_section_dict", 39),
      ("elf64_interpreted_section_size", 40),
      ("elf64_interpreted_section_matches_section_header", 43),
      ("elf64_interpreted_section_equal", 45),
      ("elf64_interpreted_section_elf64_section_type_fupd", 48),
      ("elf64_interpreted_section_elf64_section_type", 40),
      ("elf64_interpreted_section_elf64_section_size_fupd", 48),
      ("elf64_interpreted_section_elf64_section_size", 40),
      ("elf64_interpreted_section_elf64_section_offset_fupd", 48),
      ("elf64_interpreted_section_elf64_section_offset", 40),
      ("elf64_interpreted_section_elf64_section_name_fupd", 48),
      ("elf64_interpreted_section_elf64_section_name_as_string_fupd", 50),
      ("elf64_interpreted_section_elf64_section_name_as_string", 51),
      ("elf64_interpreted_section_elf64_section_name", 40),
      ("elf64_interpreted_section_elf64_section_link_fupd", 48),
      ("elf64_interpreted_section_elf64_section_link", 40),
      ("elf64_interpreted_section_elf64_section_info_fupd", 48),
      ("elf64_interpreted_section_elf64_section_info", 40),
      ("elf64_interpreted_section_elf64_section_flags_fupd", 48),
      ("elf64_interpreted_section_elf64_section_flags", 40),
      ("elf64_interpreted_section_elf64_section_entsize_fupd", 48),
      ("elf64_interpreted_section_elf64_section_entsize", 40),
      ("elf64_interpreted_section_elf64_section_body_fupd", 53),
      ("elf64_interpreted_section_elf64_section_body", 54),
      ("elf64_interpreted_section_elf64_section_align_fupd", 48),
      ("elf64_interpreted_section_elf64_section_align", 40),
      ("elf64_interpreted_section_elf64_section_addr_fupd", 48),
      ("elf64_interpreted_section_elf64_section_addr", 40),
      ("elf64_interpreted_section_CASE", 69),
      ("elf32_interpreted_section_size", 70),
      ("elf32_interpreted_section_equal", 72),
      ("elf32_interpreted_section_elf32_section_type_fupd", 74),
      ("elf32_interpreted_section_elf32_section_type", 70),
      ("elf32_interpreted_section_elf32_section_size_fupd", 74),
      ("elf32_interpreted_section_elf32_section_size", 70),
      ("elf32_interpreted_section_elf32_section_offset_fupd", 74),
      ("elf32_interpreted_section_elf32_section_offset", 70),
      ("elf32_interpreted_section_elf32_section_name_fupd", 74),
      ("elf32_interpreted_section_elf32_section_name_as_string_fupd", 75),
      ("elf32_interpreted_section_elf32_section_name_as_string", 76),
      ("elf32_interpreted_section_elf32_section_name", 70),
      ("elf32_interpreted_section_elf32_section_link_fupd", 74),
      ("elf32_interpreted_section_elf32_section_link", 70),
      ("elf32_interpreted_section_elf32_section_info_fupd", 74),
      ("elf32_interpreted_section_elf32_section_info", 70),
      ("elf32_interpreted_section_elf32_section_flags_fupd", 74),
      ("elf32_interpreted_section_elf32_section_flags", 70),
      ("elf32_interpreted_section_elf32_section_entsize_fupd", 74),
      ("elf32_interpreted_section_elf32_section_entsize", 70),
      ("elf32_interpreted_section_elf32_section_body_fupd", 77),
      ("elf32_interpreted_section_elf32_section_body", 78),
      ("elf32_interpreted_section_elf32_section_align_fupd", 74),
      ("elf32_interpreted_section_elf32_section_align", 70),
      ("elf32_interpreted_section_elf32_section_addr_fupd", 74),
      ("elf32_interpreted_section_elf32_section_addr", 70),
      ("elf32_interpreted_section_CASE", 79),
      ("compare_elf64_interpreted_section", 82)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'elf32_interpreted_section'", 95),
   TMV("'elf64_interpreted_section'", 95), TMV("M", 17), TMV("M", 0),
   TMV("M'", 17), TMV("M'", 0), TMV("P", 71), TMV("P", 44), TMV("a0", 6),
   TMV("a0'", 6), TMV("a0'", 94), TMV("a1", 6), TMV("a1'", 6),
   TMV("a10", 4), TMV("a10'", 4), TMV("a11", 2), TMV("a11'", 2),
   TMV("a2", 6), TMV("a2'", 6), TMV("a3", 6), TMV("a3'", 6), TMV("a4", 6),
   TMV("a4'", 6), TMV("a5", 6), TMV("a5'", 6), TMV("a6", 6), TMV("a6'", 6),
   TMV("a7", 6), TMV("a7'", 6), TMV("a8", 6), TMV("a8'", 6), TMV("a9", 6),
   TMV("a9'", 6), TMV("b", 4), TMV("b1", 4), TMV("b2", 4), TMV("e", 17),
   TMV("e", 0), TMV("e1", 17), TMV("e1", 0), TMV("e2", 17), TMV("e2", 0),
   TMV("ee", 17), TMV("ee", 0), TMV("elf32_interpreted_section", 96),
   TMV("elf32_section_addr", 6), TMV("elf32_section_align", 6),
   TMV("elf32_section_body", 4), TMV("elf32_section_entsize", 6),
   TMV("elf32_section_flags", 6), TMV("elf32_section_info", 6),
   TMV("elf32_section_link", 6), TMV("elf32_section_name", 6),
   TMV("elf32_section_name_as_string", 2), TMV("elf32_section_offset", 6),
   TMV("elf32_section_size", 6), TMV("elf32_section_type", 6),
   TMV("elf64_interpreted_section", 96), TMV("elf64_section_addr", 6),
   TMV("elf64_section_align", 6), TMV("elf64_section_body", 4),
   TMV("elf64_section_entsize", 6), TMV("elf64_section_flags", 6),
   TMV("elf64_section_info", 6), TMV("elf64_section_link", 6),
   TMV("elf64_section_name", 6), TMV("elf64_section_name_as_string", 2),
   TMV("elf64_section_offset", 6), TMV("elf64_section_size", 6),
   TMV("elf64_section_type", 6), TMV("ent", 17), TMV("ent", 0),
   TMV("ents", 37), TMV("ents", 34), TMV("f", 52), TMV("f", 49),
   TMV("f", 67), TMV("f", 47), TMV("f", 2), TMV("f'", 67), TMV("f1", 0),
   TMV("f2", 0), TMV("flags", 6), TMV("fn", 97), TMV("fn", 98),
   TMV("g", 52), TMV("g", 49), TMV("g", 47), TMV("h", 99), TMV("h", 100),
   TMV("i", 0), TMV("l", 2), TMV("l1", 2), TMV("l2", 2), TMV("n", 6),
   TMV("n0", 6), TMV("n01", 6), TMV("n02", 6), TMV("n1", 6), TMV("n11", 6),
   TMV("n12", 6), TMV("n2", 6), TMV("n21", 6), TMV("n22", 6), TMV("n3", 6),
   TMV("n31", 6), TMV("n32", 6), TMV("n4", 6), TMV("n41", 6),
   TMV("n42", 6), TMV("n5", 6), TMV("n51", 6), TMV("n52", 6), TMV("n6", 6),
   TMV("n61", 6), TMV("n62", 6), TMV("n7", 6), TMV("n71", 6),
   TMV("n72", 6), TMV("n8", 6), TMV("n81", 6), TMV("n82", 6),
   TMV("name", 2), TMV("record", 113), TMV("rep", 114), TMV("rep", 115),
   TMV("s", 2), TMV("s1", 0), TMV("s2", 0), TMV("sh", 41), TMV("stbl", 31),
   TMV("typ", 6), TMV("v", 116), TMV("x", 17), TMV("x", 0), TMV("y", 17),
   TMV("y", 0), TMC(15, 118), TMC(15, 119), TMC(15, 120), TMC(15, 121),
   TMC(15, 123), TMC(15, 125), TMC(15, 127), TMC(15, 128), TMC(15, 129),
   TMC(15, 131), TMC(15, 133), TMC(15, 135), TMC(15, 137), TMC(15, 138),
   TMC(15, 140), TMC(15, 142), TMC(15, 144), TMC(15, 136), TMC(15, 145),
   TMC(16, 146), TMC(17, 148), TMC(17, 152), TMC(17, 154), TMC(17, 156),
   TMC(17, 158), TMC(17, 160), TMC(17, 162), TMC(17, 164), TMC(17, 166),
   TMC(17, 168), TMC(17, 170), TMC(17, 172), TMC(18, 174), TMC(19, 6),
   TMC(20, 175), TMC(21, 177), TMC(21, 179), TMC(21, 174), TMC(21, 180),
   TMC(21, 72), TMC(21, 45), TMC(21, 181), TMC(21, 182), TMC(21, 184),
   TMC(21, 186), TMC(21, 187), TMC(21, 175), TMC(21, 189), TMC(21, 190),
   TMC(22, 174), TMC(23, 118), TMC(23, 119), TMC(23, 120), TMC(23, 192),
   TMC(23, 194), TMC(23, 196), TMC(23, 198), TMC(23, 138), TMC(23, 144),
   TMC(24, 39), TMC(24, 17), TMC(24, 0), TMC(25, 47), TMC(26, 94),
   TMC(27, 200), TMC(28, 204), TMC(29, 173), TMC(30, 188), TMC(31, 80),
   TMC(32, 205), TMC(32, 206), TMC(33, 30), TMC(34, 210), TMC(37, 80),
   TMC(38, 212), TMC(39, 214), TMC(40, 215), TMC(40, 217), TMC(40, 219),
   TMC(40, 220), TMC(40, 146), TMC(41, 80), TMC(42, 2), TMC(42, 149),
   TMC(43, 47), TMC(44, 222), TMC(45, 223), TMC(46, 223), TMC(47, 223),
   TMC(48, 223), TMC(49, 224), TMC(49, 225), TMC(50, 6), TMC(51, 226),
   TMC(52, 227), TMC(53, 229), TMC(54, 82), TMC(55, 79), TMC(56, 70),
   TMC(57, 74), TMC(58, 70), TMC(59, 74), TMC(60, 78), TMC(61, 77),
   TMC(62, 70), TMC(63, 74), TMC(64, 70), TMC(65, 74), TMC(66, 70),
   TMC(67, 74), TMC(68, 70), TMC(69, 74), TMC(70, 70), TMC(71, 76),
   TMC(72, 75), TMC(73, 74), TMC(74, 70), TMC(75, 74), TMC(76, 70),
   TMC(77, 74), TMC(78, 70), TMC(79, 74), TMC(80, 72), TMC(81, 70),
   TMC(82, 69), TMC(83, 40), TMC(84, 48), TMC(85, 40), TMC(86, 48),
   TMC(87, 54), TMC(88, 53), TMC(89, 40), TMC(90, 48), TMC(91, 40),
   TMC(92, 48), TMC(93, 40), TMC(94, 48), TMC(95, 40), TMC(96, 48),
   TMC(97, 40), TMC(98, 51), TMC(99, 50), TMC(100, 48), TMC(101, 40),
   TMC(102, 48), TMC(103, 40), TMC(104, 48), TMC(105, 40), TMC(106, 48),
   TMC(107, 45), TMC(108, 43), TMC(109, 40), TMC(110, 238), TMC(114, 238),
   TMC(115, 238), TMC(116, 238), TMC(117, 240), TMC(118, 240),
   TMC(119, 240), TMC(120, 238), TMC(121, 238), TMC(122, 240),
   TMC(123, 209), TMC(124, 4), TMC(125, 180), TMC(126, 243), TMC(128, 247),
   TMC(129, 249), TMC(130, 39), TMC(131, 38), TMC(132, 36), TMC(133, 35),
   TMC(134, 33), TMC(135, 252), TMC(136, 254), TMC(137, 17), TMC(138, 0),
   TMC(139, 256), TMC(139, 258), TMC(139, 260), TMC(139, 262),
   TMC(139, 264), TMC(139, 266), TMC(139, 268), TMC(140, 272),
   TMC(141, 276), TMC(142, 278), TMC(143, 29), TMC(144, 16), TMC(145, 279),
   TMC(145, 280)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op elf32_interpreted_section_TY_DEF x = x
    val op elf32_interpreted_section_TY_DEF =
    DT(((("elf_interpreted_section",0),[("bool",[26])]),["DISK_THM"]),
       [read"%191%124%227%10%149%0%186%154%10%186%195%8%195%11%195%17%195%19%195%21%195%23%195%25%195%27%195%29%195%31%187%13%194%15%185$12@%8%11%17%19%21%23%25%27%29%31%13%15%202%170@%168$11@%167$10@%166$9@%165$8@%164$7@%163$6@%162$5@%161$4@%160$3@%159$2@%157$1@$0@@@@@@@@@@@@%94%200|@||||||||||||$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_interpreted_section_case_def x = x
    val op elf32_interpreted_section_case_def =
    DT(((("elf_interpreted_section",4),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%8%153%11%153%17%153%19%153%21%153%23%153%25%153%27%153%29%153%31%137%13%150%15%147%76%172%234%324$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_size_def x = x
    val op elf32_interpreted_section_size_def =
    DT(((("elf_interpreted_section",5),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%8%153%11%153%17%153%19%153%21%153%23%153%25%153%27%153%29%153%31%137%13%150%15%183%260%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%156%221%199%229@@@%156$11@%156$10@%156$9@%156$8@%156$7@%156$6@%156$5@%156$4@%156$3@%156$2@%156%230$1@@%311%231@$0@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_name x = x
    val op elf32_interpreted_section_elf32_section_name =
    DT(((("elf_interpreted_section",6),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%249%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_type x = x
    val op elf32_interpreted_section_elf32_section_type =
    DT(((("elf_interpreted_section",7),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%257%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$10@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_flags x = x
    val op elf32_interpreted_section_elf32_section_flags =
    DT(((("elf_interpreted_section",8),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%243%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_addr x = x
    val op elf32_interpreted_section_elf32_section_addr =
    DT(((("elf_interpreted_section",9),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%235%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_offset x = x
    val op elf32_interpreted_section_elf32_section_offset =
    DT(((("elf_interpreted_section",10),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%253%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_size x = x
    val op elf32_interpreted_section_elf32_section_size =
    DT(((("elf_interpreted_section",11),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%255%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_link x = x
    val op elf32_interpreted_section_elf32_section_link =
    DT(((("elf_interpreted_section",12),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%247%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_info x = x
    val op elf32_interpreted_section_elf32_section_info =
    DT(((("elf_interpreted_section",13),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%245%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_align x = x
    val op elf32_interpreted_section_elf32_section_align =
    DT(((("elf_interpreted_section",14),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%237%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_entsize x = x
    val op elf32_interpreted_section_elf32_section_entsize =
    DT(((("elf_interpreted_section",15),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%241%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_body x = x
    val op elf32_interpreted_section_elf32_section_body =
    DT(((("elf_interpreted_section",16),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%175%239%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_name_as_string x = x
    val op elf32_interpreted_section_elf32_section_name_as_string =
    DT(((("elf_interpreted_section",17),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%182%250%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_name_fupd x = x
    val op elf32_interpreted_section_elf32_section_name_fupd =
    DT(((("elf_interpreted_section",19),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%252$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$12$11@@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_type_fupd x = x
    val op elf32_interpreted_section_elf32_section_type_fupd =
    DT(((("elf_interpreted_section",20),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%258$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$12$10@@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_flags_fupd x = x
    val op elf32_interpreted_section_elf32_section_flags_fupd =
    DT(((("elf_interpreted_section",21),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%244$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$12$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_addr_fupd x = x
    val op elf32_interpreted_section_elf32_section_addr_fupd =
    DT(((("elf_interpreted_section",22),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%236$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$12$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_offset_fupd x = x
    val op elf32_interpreted_section_elf32_section_offset_fupd =
    DT(((("elf_interpreted_section",23),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%254$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$12$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_size_fupd x = x
    val op elf32_interpreted_section_elf32_section_size_fupd =
    DT(((("elf_interpreted_section",24),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%256$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$12$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_link_fupd x = x
    val op elf32_interpreted_section_elf32_section_link_fupd =
    DT(((("elf_interpreted_section",25),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%248$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$6@$12$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_info_fupd x = x
    val op elf32_interpreted_section_elf32_section_info_fupd =
    DT(((("elf_interpreted_section",26),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%246$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$6@$5@$12$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_align_fupd x = x
    val op elf32_interpreted_section_elf32_section_align_fupd =
    DT(((("elf_interpreted_section",27),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%238$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$6@$5@$4@$12$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_entsize_fupd x = x
    val op elf32_interpreted_section_elf32_section_entsize_fupd =
    DT(((("elf_interpreted_section",28),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%242$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$12$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_body_fupd x = x
    val op elf32_interpreted_section_elf32_section_body_fupd =
    DT(((("elf_interpreted_section",29),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%143%74%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%240$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$12$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_elf32_section_name_as_string_fupd x = x
    val op elf32_interpreted_section_elf32_section_name_as_string_fupd =
    DT(((("elf_interpreted_section",30),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%146%75%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%251$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$12$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_equal_def x = x
    val op elf32_interpreted_section_equal_def =
    DT(((("elf_interpreted_section",49),[]),[]),
       [read"%138%133%138%135%174%259$1@$0@@%169%183%249$1@@%249$0@@@%169%183%257$1@@%257$0@@@%169%183%243$1@@%243$0@@@%169%183%235$1@@%235$0@@@%169%183%253$1@@%253$0@@@%169%183%255$1@@%255$0@@@%169%183%247$1@@%247$0@@@%169%183%245$1@@%245$0@@@%169%183%237$1@@%237$0@@@%169%183%241$1@@%241$0@@@%169%301%239$1@@%239$0@@@%182%250$1@@%250$0@@@@@@@@@@@@@@|@|@"])
  fun op elf64_interpreted_section_TY_DEF x = x
    val op elf64_interpreted_section_TY_DEF =
    DT(((("elf_interpreted_section",50),[("bool",[26])]),["DISK_THM"]),
       [read"%193%125%228%10%149%1%186%154%10%186%195%8%195%11%195%17%195%19%195%21%195%23%195%25%195%27%195%29%195%31%187%13%194%15%185$12@%8%11%17%19%21%23%25%27%29%31%13%15%202%170@%168$11@%167$10@%166$9@%165$8@%164$7@%163$6@%162$5@%161$4@%160$3@%159$2@%157$1@$0@@@@@@@@@@@@%94%200|@||||||||||||$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_interpreted_section_case_def x = x
    val op elf64_interpreted_section_case_def =
    DT(((("elf_interpreted_section",54),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%8%153%11%153%17%153%19%153%21%153%23%153%25%153%27%153%29%153%31%137%13%150%15%147%76%172%261%325$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_size_def x = x
    val op elf64_interpreted_section_size_def =
    DT(((("elf_interpreted_section",55),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%8%153%11%153%17%153%19%153%21%153%23%153%25%153%27%153%29%153%31%137%13%150%15%183%288%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%156%221%199%229@@@%156$11@%156$10@%156$9@%156$8@%156$7@%156$6@%156$5@%156$4@%156$3@%156$2@%156%230$1@@%311%231@$0@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_name x = x
    val op elf64_interpreted_section_elf64_section_name =
    DT(((("elf_interpreted_section",56),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%276%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_type x = x
    val op elf64_interpreted_section_elf64_section_type =
    DT(((("elf_interpreted_section",57),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%284%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$10@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_flags x = x
    val op elf64_interpreted_section_elf64_section_flags =
    DT(((("elf_interpreted_section",58),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%270%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_addr x = x
    val op elf64_interpreted_section_elf64_section_addr =
    DT(((("elf_interpreted_section",59),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%262%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_offset x = x
    val op elf64_interpreted_section_elf64_section_offset =
    DT(((("elf_interpreted_section",60),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%280%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_size x = x
    val op elf64_interpreted_section_elf64_section_size =
    DT(((("elf_interpreted_section",61),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%282%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_link x = x
    val op elf64_interpreted_section_elf64_section_link =
    DT(((("elf_interpreted_section",62),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%274%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_info x = x
    val op elf64_interpreted_section_elf64_section_info =
    DT(((("elf_interpreted_section",63),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%272%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_align x = x
    val op elf64_interpreted_section_elf64_section_align =
    DT(((("elf_interpreted_section",64),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%264%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_entsize x = x
    val op elf64_interpreted_section_elf64_section_entsize =
    DT(((("elf_interpreted_section",65),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%268%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_body x = x
    val op elf64_interpreted_section_elf64_section_body =
    DT(((("elf_interpreted_section",66),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%175%266%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_name_as_string x = x
    val op elf64_interpreted_section_elf64_section_name_as_string =
    DT(((("elf_interpreted_section",67),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%182%277%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_name_fupd x = x
    val op elf64_interpreted_section_elf64_section_name_fupd =
    DT(((("elf_interpreted_section",69),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%279$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$12$11@@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_type_fupd x = x
    val op elf64_interpreted_section_elf64_section_type_fupd =
    DT(((("elf_interpreted_section",70),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%285$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$12$10@@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_flags_fupd x = x
    val op elf64_interpreted_section_elf64_section_flags_fupd =
    DT(((("elf_interpreted_section",71),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%271$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$12$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_addr_fupd x = x
    val op elf64_interpreted_section_elf64_section_addr_fupd =
    DT(((("elf_interpreted_section",72),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%263$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$12$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_offset_fupd x = x
    val op elf64_interpreted_section_elf64_section_offset_fupd =
    DT(((("elf_interpreted_section",73),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%281$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$12$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_size_fupd x = x
    val op elf64_interpreted_section_elf64_section_size_fupd =
    DT(((("elf_interpreted_section",74),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%283$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$12$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_link_fupd x = x
    val op elf64_interpreted_section_elf64_section_link_fupd =
    DT(((("elf_interpreted_section",75),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%275$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$6@$12$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_info_fupd x = x
    val op elf64_interpreted_section_elf64_section_info_fupd =
    DT(((("elf_interpreted_section",76),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%273$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$6@$5@$12$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_align_fupd x = x
    val op elf64_interpreted_section_elf64_section_align_fupd =
    DT(((("elf_interpreted_section",77),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%265$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$6@$5@$4@$12$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_entsize_fupd x = x
    val op elf64_interpreted_section_elf64_section_entsize_fupd =
    DT(((("elf_interpreted_section",78),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%269$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$12$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_body_fupd x = x
    val op elf64_interpreted_section_elf64_section_body_fupd =
    DT(((("elf_interpreted_section",79),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%143%74%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%267$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$12$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_elf64_section_name_as_string_fupd x = x
    val op elf64_interpreted_section_elf64_section_name_as_string_fupd =
    DT(((("elf_interpreted_section",80),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%146%75%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%278$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$12$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op compare_elf64_interpreted_section_def x = x
    val op compare_elf64_interpreted_section_def =
    DT(((("elf_interpreted_section",99),[]),[]),
       [read"%139%127%139%128%184%233$1@$0@@%322%310%303%171@%183@@@%232@%158%201%276$1@@%201%284$1@@%201%270$1@@%201%262$1@@%201%280$1@@%201%282$1@@%201%274$1@@%201%272$1@@%201%264$1@@%201%268$1@@%220@@@@@@@@@@@%266$1@@@%158%201%276$0@@%201%284$0@@%201%270$0@@%201%262$0@@%201%280$0@@%201%282$0@@%201%274$0@@%201%272$0@@%201%264$0@@%201%268$0@@%220@@@@@@@@@@@%266$0@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_interpreted_section_elf64_interpreted_section_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_interpreted_section_elf64_interpreted_section_dict_def
    =
    DT(((("elf_interpreted_section",100),[]),[]),
       [read"%173%305@%222%215%233@@%226%214%80%81%184%233$1@$0@@%218@||@@%225%214%80%81%211%233$1@$0@@%212%218@%212%205@%204@@@||@@%224%214%80%81%184%233$1@$0@@%210@||@@%223%214%80%81%211%233$1@$0@@%212%210@%212%205@%204@@@||@@%196@@@@@@"])
  fun op elf64_interpreted_section_equal_def x = x
    val op elf64_interpreted_section_equal_def =
    DT(((("elf_interpreted_section",101),[]),[]),
       [read"%139%134%139%136%174%286$1@$0@@%169%183%276$1@@%276$0@@@%169%183%284$1@@%284$0@@@%169%183%270$1@@%270$0@@@%169%183%262$1@@%262$0@@@%169%183%280$1@@%280$0@@@%169%183%282$1@@%282$0@@@%169%183%274$1@@%274$0@@@%169%183%272$1@@%272$0@@@%169%183%264$1@@%264$0@@@%169%183%268$1@@%268$0@@@%169%301%266$1@@%266$0@@@%182%277$1@@%277$0@@@@@@@@@@@@@@|@|@"])
  fun op null_elf32_interpreted_section_def x = x
    val op null_elf32_interpreted_section_def =
    DT(((("elf_interpreted_section",102),[]),[]),
       [read"%176%312@%252%217%170@@%258%217%170@@%244%217%170@@%236%217%170@@%254%217%170@@%256%217%170@@%248%217%170@@%246%217%170@@%238%217%170@@%242%217%170@@%240%213%300@@%251%216%219@@%197@@@@@@@@@@@@@"])
  fun op null_elf64_interpreted_section_def x = x
    val op null_elf64_interpreted_section_def =
    DT(((("elf_interpreted_section",103),[]),[]),
       [read"%177%313@%279%217%170@@%285%217%170@@%271%217%170@@%263%217%170@@%281%217%170@@%283%217%170@@%275%217%170@@%273%217%170@@%265%217%170@@%269%217%170@@%267%213%300@@%278%216%219@@%198@@@@@@@@@@@@@"])
  fun op elf64_interpreted_section_matches_section_header_def x = x
    val op elf64_interpreted_section_matches_section_header_def =
    DT(((("elf_interpreted_section",104),[]),[]),
       [read"%139%90%140%129%174%287$1@$0@@%169%183%276$1@@%327%295$0@@@@%169%183%284$1@@%327%298$0@@@@%169%183%270$1@@%326%292$0@@@@%169%183%262$1@@%326%289$0@@@@%169%183%280$1@@%326%296$0@@@@%169%183%282$1@@%326%297$0@@@@%169%183%274$1@@%327%294$0@@@@%169%183%272$1@@%327%293$0@@@@%169%183%264$1@@%326%290$0@@@@%183%268$1@@%326%291$0@@@@@@@@@@@@@|@|@"])
  fun op is_valid_elf32_section_header_table_entry_def x = x
    val op is_valid_elf32_section_header_table_entry_def =
    DT(((("elf_interpreted_section",105),[]),[]),
       [read"%138%70%155%130%174%307$1@$0@@%302%304%249$1@@$0@@%122%321%209%299@$0@@%208@%132%323$0@%131%82%169%183$1@%257$5@@@%183$0@%243$5@@@||@|@|@%78%208|@@|@|@"])
  fun op is_valid_elf64_section_header_table_entry_def x = x
    val op is_valid_elf64_section_header_table_entry_def =
    DT(((("elf_interpreted_section",106),[]),[]),
       [read"%139%71%155%130%174%309$1@$0@@%302%304%276$1@@$0@@%122%321%209%299@$0@@%208@%132%323$0@%131%82%169%183$1@%284$5@@@%183$0@%270$5@@@||@|@|@%78%208|@@|@|@"])
  fun op is_valid_elf32_section_header_table0_def x = x
    val op is_valid_elf32_section_header_table0_def =
    DT(((("elf_interpreted_section",107),[]),[]),
       [read"%151%72%155%130%174%306$1@$0@@%206%133%307$0@$1@|@$1@@|@|@"])
  fun op is_valid_elf64_section_header_table0_def x = x
    val op is_valid_elf64_section_header_table0_def =
    DT(((("elf_interpreted_section",108),[]),[]),
       [read"%152%73%155%130%174%308$1@$0@@%207%134%309$0@$1@|@$1@@|@|@"])
  fun op elf32_interpreted_section_accessors x = x
    val op elf32_interpreted_section_accessors =
    DT(((("elf_interpreted_section",18),
        [("elf_interpreted_section",
         [6,7,8,9,10,11,12,13,14,15,16,17])]),["DISK_THM"]),
       [read"%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%249%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%257%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$10@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%243%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%235%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%253%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%255%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%247%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%245%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%237%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%241%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%175%239%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@|@|@@%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%182%250%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@"])
  fun op elf32_interpreted_section_fn_updates x = x
    val op elf32_interpreted_section_fn_updates =
    DT(((("elf_interpreted_section",31),
        [("elf_interpreted_section",
         [19,20,21,22,23,24,25,26,27,28,29,30])]),["DISK_THM"]),
       [read"%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%252$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$12$11@@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%258$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$12$10@@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%244$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$12$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%236$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$12$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%254$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$12$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%256$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$12$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%248$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$6@$12$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%246$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$6@$5@$12$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%238$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$6@$5@$4@$12$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%242$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$12$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%143%74%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%240$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$12$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%146%75%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%176%251$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$12$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@"])
  fun op elf32_interpreted_section_accfupds x = x
    val op elf32_interpreted_section_accfupds =
    DT(((("elf_interpreted_section",32),
        [("bool",[25,26,55,180]),
         ("elf_interpreted_section",[1,2,3,18,31])]),["DISK_THM"]),
       [read"%169%148%77%138%36%183%249%258$1@$0@@@%249$0@@|@|@@%169%148%77%138%36%183%249%244$1@$0@@@%249$0@@|@|@@%169%148%77%138%36%183%249%236$1@$0@@@%249$0@@|@|@@%169%148%77%138%36%183%249%254$1@$0@@@%249$0@@|@|@@%169%148%77%138%36%183%249%256$1@$0@@@%249$0@@|@|@@%169%148%77%138%36%183%249%248$1@$0@@@%249$0@@|@|@@%169%148%77%138%36%183%249%246$1@$0@@@%249$0@@|@|@@%169%148%77%138%36%183%249%238$1@$0@@@%249$0@@|@|@@%169%148%77%138%36%183%249%242$1@$0@@@%249$0@@|@|@@%169%143%74%138%36%183%249%240$1@$0@@@%249$0@@|@|@@%169%146%75%138%36%183%249%251$1@$0@@@%249$0@@|@|@@%169%148%77%138%36%183%257%252$1@$0@@@%257$0@@|@|@@%169%148%77%138%36%183%257%244$1@$0@@@%257$0@@|@|@@%169%148%77%138%36%183%257%236$1@$0@@@%257$0@@|@|@@%169%148%77%138%36%183%257%254$1@$0@@@%257$0@@|@|@@%169%148%77%138%36%183%257%256$1@$0@@@%257$0@@|@|@@%169%148%77%138%36%183%257%248$1@$0@@@%257$0@@|@|@@%169%148%77%138%36%183%257%246$1@$0@@@%257$0@@|@|@@%169%148%77%138%36%183%257%238$1@$0@@@%257$0@@|@|@@%169%148%77%138%36%183%257%242$1@$0@@@%257$0@@|@|@@%169%143%74%138%36%183%257%240$1@$0@@@%257$0@@|@|@@%169%146%75%138%36%183%257%251$1@$0@@@%257$0@@|@|@@%169%148%77%138%36%183%243%252$1@$0@@@%243$0@@|@|@@%169%148%77%138%36%183%243%258$1@$0@@@%243$0@@|@|@@%169%148%77%138%36%183%243%236$1@$0@@@%243$0@@|@|@@%169%148%77%138%36%183%243%254$1@$0@@@%243$0@@|@|@@%169%148%77%138%36%183%243%256$1@$0@@@%243$0@@|@|@@%169%148%77%138%36%183%243%248$1@$0@@@%243$0@@|@|@@%169%148%77%138%36%183%243%246$1@$0@@@%243$0@@|@|@@%169%148%77%138%36%183%243%238$1@$0@@@%243$0@@|@|@@%169%148%77%138%36%183%243%242$1@$0@@@%243$0@@|@|@@%169%143%74%138%36%183%243%240$1@$0@@@%243$0@@|@|@@%169%146%75%138%36%183%243%251$1@$0@@@%243$0@@|@|@@%169%148%77%138%36%183%235%252$1@$0@@@%235$0@@|@|@@%169%148%77%138%36%183%235%258$1@$0@@@%235$0@@|@|@@%169%148%77%138%36%183%235%244$1@$0@@@%235$0@@|@|@@%169%148%77%138%36%183%235%254$1@$0@@@%235$0@@|@|@@%169%148%77%138%36%183%235%256$1@$0@@@%235$0@@|@|@@%169%148%77%138%36%183%235%248$1@$0@@@%235$0@@|@|@@%169%148%77%138%36%183%235%246$1@$0@@@%235$0@@|@|@@%169%148%77%138%36%183%235%238$1@$0@@@%235$0@@|@|@@%169%148%77%138%36%183%235%242$1@$0@@@%235$0@@|@|@@%169%143%74%138%36%183%235%240$1@$0@@@%235$0@@|@|@@%169%146%75%138%36%183%235%251$1@$0@@@%235$0@@|@|@@%169%148%77%138%36%183%253%252$1@$0@@@%253$0@@|@|@@%169%148%77%138%36%183%253%258$1@$0@@@%253$0@@|@|@@%169%148%77%138%36%183%253%244$1@$0@@@%253$0@@|@|@@%169%148%77%138%36%183%253%236$1@$0@@@%253$0@@|@|@@%169%148%77%138%36%183%253%256$1@$0@@@%253$0@@|@|@@%169%148%77%138%36%183%253%248$1@$0@@@%253$0@@|@|@@%169%148%77%138%36%183%253%246$1@$0@@@%253$0@@|@|@@%169%148%77%138%36%183%253%238$1@$0@@@%253$0@@|@|@@%169%148%77%138%36%183%253%242$1@$0@@@%253$0@@|@|@@%169%143%74%138%36%183%253%240$1@$0@@@%253$0@@|@|@@%169%146%75%138%36%183%253%251$1@$0@@@%253$0@@|@|@@%169%148%77%138%36%183%255%252$1@$0@@@%255$0@@|@|@@%169%148%77%138%36%183%255%258$1@$0@@@%255$0@@|@|@@%169%148%77%138%36%183%255%244$1@$0@@@%255$0@@|@|@@%169%148%77%138%36%183%255%236$1@$0@@@%255$0@@|@|@@%169%148%77%138%36%183%255%254$1@$0@@@%255$0@@|@|@@%169%148%77%138%36%183%255%248$1@$0@@@%255$0@@|@|@@%169%148%77%138%36%183%255%246$1@$0@@@%255$0@@|@|@@%169%148%77%138%36%183%255%238$1@$0@@@%255$0@@|@|@@%169%148%77%138%36%183%255%242$1@$0@@@%255$0@@|@|@@%169%143%74%138%36%183%255%240$1@$0@@@%255$0@@|@|@@%169%146%75%138%36%183%255%251$1@$0@@@%255$0@@|@|@@%169%148%77%138%36%183%247%252$1@$0@@@%247$0@@|@|@@%169%148%77%138%36%183%247%258$1@$0@@@%247$0@@|@|@@%169%148%77%138%36%183%247%244$1@$0@@@%247$0@@|@|@@%169%148%77%138%36%183%247%236$1@$0@@@%247$0@@|@|@@%169%148%77%138%36%183%247%254$1@$0@@@%247$0@@|@|@@%169%148%77%138%36%183%247%256$1@$0@@@%247$0@@|@|@@%169%148%77%138%36%183%247%246$1@$0@@@%247$0@@|@|@@%169%148%77%138%36%183%247%238$1@$0@@@%247$0@@|@|@@%169%148%77%138%36%183%247%242$1@$0@@@%247$0@@|@|@@%169%143%74%138%36%183%247%240$1@$0@@@%247$0@@|@|@@%169%146%75%138%36%183%247%251$1@$0@@@%247$0@@|@|@@%169%148%77%138%36%183%245%252$1@$0@@@%245$0@@|@|@@%169%148%77%138%36%183%245%258$1@$0@@@%245$0@@|@|@@%169%148%77%138%36%183%245%244$1@$0@@@%245$0@@|@|@@%169%148%77%138%36%183%245%236$1@$0@@@%245$0@@|@|@@%169%148%77%138%36%183%245%254$1@$0@@@%245$0@@|@|@@%169%148%77%138%36%183%245%256$1@$0@@@%245$0@@|@|@@%169%148%77%138%36%183%245%248$1@$0@@@%245$0@@|@|@@%169%148%77%138%36%183%245%238$1@$0@@@%245$0@@|@|@@%169%148%77%138%36%183%245%242$1@$0@@@%245$0@@|@|@@%169%143%74%138%36%183%245%240$1@$0@@@%245$0@@|@|@@%169%146%75%138%36%183%245%251$1@$0@@@%245$0@@|@|@@%169%148%77%138%36%183%237%252$1@$0@@@%237$0@@|@|@@%169%148%77%138%36%183%237%258$1@$0@@@%237$0@@|@|@@%169%148%77%138%36%183%237%244$1@$0@@@%237$0@@|@|@@%169%148%77%138%36%183%237%236$1@$0@@@%237$0@@|@|@@%169%148%77%138%36%183%237%254$1@$0@@@%237$0@@|@|@@%169%148%77%138%36%183%237%256$1@$0@@@%237$0@@|@|@@%169%148%77%138%36%183%237%248$1@$0@@@%237$0@@|@|@@%169%148%77%138%36%183%237%246$1@$0@@@%237$0@@|@|@@%169%148%77%138%36%183%237%242$1@$0@@@%237$0@@|@|@@%169%143%74%138%36%183%237%240$1@$0@@@%237$0@@|@|@@%169%146%75%138%36%183%237%251$1@$0@@@%237$0@@|@|@@%169%148%77%138%36%183%241%252$1@$0@@@%241$0@@|@|@@%169%148%77%138%36%183%241%258$1@$0@@@%241$0@@|@|@@%169%148%77%138%36%183%241%244$1@$0@@@%241$0@@|@|@@%169%148%77%138%36%183%241%236$1@$0@@@%241$0@@|@|@@%169%148%77%138%36%183%241%254$1@$0@@@%241$0@@|@|@@%169%148%77%138%36%183%241%256$1@$0@@@%241$0@@|@|@@%169%148%77%138%36%183%241%248$1@$0@@@%241$0@@|@|@@%169%148%77%138%36%183%241%246$1@$0@@@%241$0@@|@|@@%169%148%77%138%36%183%241%238$1@$0@@@%241$0@@|@|@@%169%143%74%138%36%183%241%240$1@$0@@@%241$0@@|@|@@%169%146%75%138%36%183%241%251$1@$0@@@%241$0@@|@|@@%169%148%77%138%36%175%239%252$1@$0@@@%239$0@@|@|@@%169%148%77%138%36%175%239%258$1@$0@@@%239$0@@|@|@@%169%148%77%138%36%175%239%244$1@$0@@@%239$0@@|@|@@%169%148%77%138%36%175%239%236$1@$0@@@%239$0@@|@|@@%169%148%77%138%36%175%239%254$1@$0@@@%239$0@@|@|@@%169%148%77%138%36%175%239%256$1@$0@@@%239$0@@|@|@@%169%148%77%138%36%175%239%248$1@$0@@@%239$0@@|@|@@%169%148%77%138%36%175%239%246$1@$0@@@%239$0@@|@|@@%169%148%77%138%36%175%239%238$1@$0@@@%239$0@@|@|@@%169%148%77%138%36%175%239%242$1@$0@@@%239$0@@|@|@@%169%146%75%138%36%175%239%251$1@$0@@@%239$0@@|@|@@%169%148%77%138%36%182%250%252$1@$0@@@%250$0@@|@|@@%169%148%77%138%36%182%250%258$1@$0@@@%250$0@@|@|@@%169%148%77%138%36%182%250%244$1@$0@@@%250$0@@|@|@@%169%148%77%138%36%182%250%236$1@$0@@@%250$0@@|@|@@%169%148%77%138%36%182%250%254$1@$0@@@%250$0@@|@|@@%169%148%77%138%36%182%250%256$1@$0@@@%250$0@@|@|@@%169%148%77%138%36%182%250%248$1@$0@@@%250$0@@|@|@@%169%148%77%138%36%182%250%246$1@$0@@@%250$0@@|@|@@%169%148%77%138%36%182%250%238$1@$0@@@%250$0@@|@|@@%169%148%77%138%36%182%250%242$1@$0@@@%250$0@@|@|@@%169%143%74%138%36%182%250%240$1@$0@@@%250$0@@|@|@@%169%148%77%138%36%183%249%252$1@$0@@@$1%249$0@@@|@|@@%169%148%77%138%36%183%257%258$1@$0@@@$1%257$0@@@|@|@@%169%148%77%138%36%183%243%244$1@$0@@@$1%243$0@@@|@|@@%169%148%77%138%36%183%235%236$1@$0@@@$1%235$0@@@|@|@@%169%148%77%138%36%183%253%254$1@$0@@@$1%253$0@@@|@|@@%169%148%77%138%36%183%255%256$1@$0@@@$1%255$0@@@|@|@@%169%148%77%138%36%183%247%248$1@$0@@@$1%247$0@@@|@|@@%169%148%77%138%36%183%245%246$1@$0@@@$1%245$0@@@|@|@@%169%148%77%138%36%183%237%238$1@$0@@@$1%237$0@@@|@|@@%169%148%77%138%36%183%241%242$1@$0@@@$1%241$0@@@|@|@@%169%143%74%138%36%175%239%240$1@$0@@@$1%239$0@@@|@|@@%146%75%138%36%182%250%251$1@$0@@@$1%250$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_interpreted_section_fupdfupds x = x
    val op elf32_interpreted_section_fupdfupds =
    DT(((("elf_interpreted_section",33),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_interpreted_section",[1,2,3,31])]),["DISK_THM"]),
       [read"%169%148%87%148%77%138%36%176%252$1@%252$2@$0@@@%252%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%138%36%176%258$1@%258$2@$0@@@%258%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%138%36%176%244$1@%244$2@$0@@@%244%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%138%36%176%236$1@%236$2@$0@@@%236%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%138%36%176%254$1@%254$2@$0@@@%254%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%138%36%176%256$1@%256$2@$0@@@%256%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%138%36%176%248$1@%248$2@$0@@@%248%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%138%36%176%246$1@%246$2@$0@@@%246%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%138%36%176%238$1@%238$2@$0@@@%238%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%138%36%176%242$1@%242$2@$0@@@%242%320$1@$2@@$0@@|@|@|@@%169%143%85%143%74%138%36%176%240$1@%240$2@$0@@@%240%314$1@$2@@$0@@|@|@|@@%146%86%146%75%138%36%176%251$1@%251$2@$0@@@%251%319$1@$2@@$0@@|@|@|@@@@@@@@@@@@"])
  fun op elf32_interpreted_section_fupdfupds_comp x = x
    val op elf32_interpreted_section_fupdfupds_comp =
    DT(((("elf_interpreted_section",34),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_interpreted_section",[1,2,3,31])]),["DISK_THM"]),
       [read"%169%169%148%87%148%77%180%316%252$0@@%252$1@@@%252%320$0@$1@@@|@|@@%141%88%148%87%148%77%178%315%252$0@@%315%252$1@@$2@@@%315%252%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%180%316%258$0@@%258$1@@@%258%320$0@$1@@@|@|@@%141%88%148%87%148%77%178%315%258$0@@%315%258$1@@$2@@@%315%258%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%180%316%244$0@@%244$1@@@%244%320$0@$1@@@|@|@@%141%88%148%87%148%77%178%315%244$0@@%315%244$1@@$2@@@%315%244%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%180%316%236$0@@%236$1@@@%236%320$0@$1@@@|@|@@%141%88%148%87%148%77%178%315%236$0@@%315%236$1@@$2@@@%315%236%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%180%316%254$0@@%254$1@@@%254%320$0@$1@@@|@|@@%141%88%148%87%148%77%178%315%254$0@@%315%254$1@@$2@@@%315%254%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%180%316%256$0@@%256$1@@@%256%320$0@$1@@@|@|@@%141%88%148%87%148%77%178%315%256$0@@%315%256$1@@$2@@@%315%256%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%180%316%248$0@@%248$1@@@%248%320$0@$1@@@|@|@@%141%88%148%87%148%77%178%315%248$0@@%315%248$1@@$2@@@%315%248%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%180%316%246$0@@%246$1@@@%246%320$0@$1@@@|@|@@%141%88%148%87%148%77%178%315%246$0@@%315%246$1@@$2@@@%315%246%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%180%316%238$0@@%238$1@@@%238%320$0@$1@@@|@|@@%141%88%148%87%148%77%178%315%238$0@@%315%238$1@@$2@@@%315%238%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%180%316%242$0@@%242$1@@@%242%320$0@$1@@@|@|@@%141%88%148%87%148%77%178%315%242$0@@%315%242$1@@$2@@@%315%242%320$0@$1@@@$2@@|@|@|@@@%169%169%143%85%143%74%180%316%240$0@@%240$1@@@%240%314$0@$1@@@|@|@@%141%88%143%85%143%74%178%315%240$0@@%315%240$1@@$2@@@%315%240%314$0@$1@@@$2@@|@|@|@@@%169%146%86%146%75%180%316%251$0@@%251$1@@@%251%319$0@$1@@@|@|@@%141%88%146%86%146%75%178%315%251$0@@%315%251$1@@$2@@@%315%251%319$0@$1@@@$2@@|@|@|@@@@@@@@@@@@@"])
  fun op elf32_interpreted_section_fupdcanon x = x
    val op elf32_interpreted_section_fupdcanon =
    DT(((("elf_interpreted_section",35),
        [("bool",[25,26,55,180]),
         ("elf_interpreted_section",[1,2,3,31])]),["DISK_THM"]),
       [read"%169%148%87%148%77%138%36%176%258$1@%252$2@$0@@@%252$2@%258$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%244$1@%252$2@$0@@@%252$2@%244$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%244$1@%258$2@$0@@@%258$2@%244$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%236$1@%252$2@$0@@@%252$2@%236$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%236$1@%258$2@$0@@@%258$2@%236$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%236$1@%244$2@$0@@@%244$2@%236$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%254$1@%252$2@$0@@@%252$2@%254$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%254$1@%258$2@$0@@@%258$2@%254$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%254$1@%244$2@$0@@@%244$2@%254$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%254$1@%236$2@$0@@@%236$2@%254$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%256$1@%252$2@$0@@@%252$2@%256$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%256$1@%258$2@$0@@@%258$2@%256$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%256$1@%244$2@$0@@@%244$2@%256$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%256$1@%236$2@$0@@@%236$2@%256$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%256$1@%254$2@$0@@@%254$2@%256$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%248$1@%252$2@$0@@@%252$2@%248$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%248$1@%258$2@$0@@@%258$2@%248$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%248$1@%244$2@$0@@@%244$2@%248$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%248$1@%236$2@$0@@@%236$2@%248$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%248$1@%254$2@$0@@@%254$2@%248$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%248$1@%256$2@$0@@@%256$2@%248$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%246$1@%252$2@$0@@@%252$2@%246$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%246$1@%258$2@$0@@@%258$2@%246$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%246$1@%244$2@$0@@@%244$2@%246$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%246$1@%236$2@$0@@@%236$2@%246$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%246$1@%254$2@$0@@@%254$2@%246$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%246$1@%256$2@$0@@@%256$2@%246$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%246$1@%248$2@$0@@@%248$2@%246$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%238$1@%252$2@$0@@@%252$2@%238$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%238$1@%258$2@$0@@@%258$2@%238$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%238$1@%244$2@$0@@@%244$2@%238$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%238$1@%236$2@$0@@@%236$2@%238$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%238$1@%254$2@$0@@@%254$2@%238$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%238$1@%256$2@$0@@@%256$2@%238$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%238$1@%248$2@$0@@@%248$2@%238$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%238$1@%246$2@$0@@@%246$2@%238$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%242$1@%252$2@$0@@@%252$2@%242$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%242$1@%258$2@$0@@@%258$2@%242$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%242$1@%244$2@$0@@@%244$2@%242$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%242$1@%236$2@$0@@@%236$2@%242$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%242$1@%254$2@$0@@@%254$2@%242$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%242$1@%256$2@$0@@@%256$2@%242$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%242$1@%248$2@$0@@@%248$2@%242$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%242$1@%246$2@$0@@@%246$2@%242$1@$0@@@|@|@|@@%169%148%87%148%77%138%36%176%242$1@%238$2@$0@@@%238$2@%242$1@$0@@@|@|@|@@%169%148%87%143%74%138%36%176%240$1@%252$2@$0@@@%252$2@%240$1@$0@@@|@|@|@@%169%148%87%143%74%138%36%176%240$1@%258$2@$0@@@%258$2@%240$1@$0@@@|@|@|@@%169%148%87%143%74%138%36%176%240$1@%244$2@$0@@@%244$2@%240$1@$0@@@|@|@|@@%169%148%87%143%74%138%36%176%240$1@%236$2@$0@@@%236$2@%240$1@$0@@@|@|@|@@%169%148%87%143%74%138%36%176%240$1@%254$2@$0@@@%254$2@%240$1@$0@@@|@|@|@@%169%148%87%143%74%138%36%176%240$1@%256$2@$0@@@%256$2@%240$1@$0@@@|@|@|@@%169%148%87%143%74%138%36%176%240$1@%248$2@$0@@@%248$2@%240$1@$0@@@|@|@|@@%169%148%87%143%74%138%36%176%240$1@%246$2@$0@@@%246$2@%240$1@$0@@@|@|@|@@%169%148%87%143%74%138%36%176%240$1@%238$2@$0@@@%238$2@%240$1@$0@@@|@|@|@@%169%148%87%143%74%138%36%176%240$1@%242$2@$0@@@%242$2@%240$1@$0@@@|@|@|@@%169%148%87%146%75%138%36%176%251$1@%252$2@$0@@@%252$2@%251$1@$0@@@|@|@|@@%169%148%87%146%75%138%36%176%251$1@%258$2@$0@@@%258$2@%251$1@$0@@@|@|@|@@%169%148%87%146%75%138%36%176%251$1@%244$2@$0@@@%244$2@%251$1@$0@@@|@|@|@@%169%148%87%146%75%138%36%176%251$1@%236$2@$0@@@%236$2@%251$1@$0@@@|@|@|@@%169%148%87%146%75%138%36%176%251$1@%254$2@$0@@@%254$2@%251$1@$0@@@|@|@|@@%169%148%87%146%75%138%36%176%251$1@%256$2@$0@@@%256$2@%251$1@$0@@@|@|@|@@%169%148%87%146%75%138%36%176%251$1@%248$2@$0@@@%248$2@%251$1@$0@@@|@|@|@@%169%148%87%146%75%138%36%176%251$1@%246$2@$0@@@%246$2@%251$1@$0@@@|@|@|@@%169%148%87%146%75%138%36%176%251$1@%238$2@$0@@@%238$2@%251$1@$0@@@|@|@|@@%169%148%87%146%75%138%36%176%251$1@%242$2@$0@@@%242$2@%251$1@$0@@@|@|@|@@%143%85%146%75%138%36%176%251$1@%240$2@$0@@@%240$2@%251$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_interpreted_section_fupdcanon_comp x = x
    val op elf32_interpreted_section_fupdcanon_comp =
    DT(((("elf_interpreted_section",36),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_interpreted_section",[1,2,3,31])]),["DISK_THM"]),
       [read"%169%169%148%87%148%77%180%316%258$0@@%252$1@@@%316%252$1@@%258$0@@@|@|@@%141%88%148%87%148%77%178%315%258$0@@%315%252$1@@$2@@@%315%252$1@@%315%258$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%244$0@@%252$1@@@%316%252$1@@%244$0@@@|@|@@%141%88%148%87%148%77%178%315%244$0@@%315%252$1@@$2@@@%315%252$1@@%315%244$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%244$0@@%258$1@@@%316%258$1@@%244$0@@@|@|@@%141%88%148%87%148%77%178%315%244$0@@%315%258$1@@$2@@@%315%258$1@@%315%244$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%236$0@@%252$1@@@%316%252$1@@%236$0@@@|@|@@%141%88%148%87%148%77%178%315%236$0@@%315%252$1@@$2@@@%315%252$1@@%315%236$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%236$0@@%258$1@@@%316%258$1@@%236$0@@@|@|@@%141%88%148%87%148%77%178%315%236$0@@%315%258$1@@$2@@@%315%258$1@@%315%236$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%236$0@@%244$1@@@%316%244$1@@%236$0@@@|@|@@%141%88%148%87%148%77%178%315%236$0@@%315%244$1@@$2@@@%315%244$1@@%315%236$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%254$0@@%252$1@@@%316%252$1@@%254$0@@@|@|@@%141%88%148%87%148%77%178%315%254$0@@%315%252$1@@$2@@@%315%252$1@@%315%254$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%254$0@@%258$1@@@%316%258$1@@%254$0@@@|@|@@%141%88%148%87%148%77%178%315%254$0@@%315%258$1@@$2@@@%315%258$1@@%315%254$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%254$0@@%244$1@@@%316%244$1@@%254$0@@@|@|@@%141%88%148%87%148%77%178%315%254$0@@%315%244$1@@$2@@@%315%244$1@@%315%254$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%254$0@@%236$1@@@%316%236$1@@%254$0@@@|@|@@%141%88%148%87%148%77%178%315%254$0@@%315%236$1@@$2@@@%315%236$1@@%315%254$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%256$0@@%252$1@@@%316%252$1@@%256$0@@@|@|@@%141%88%148%87%148%77%178%315%256$0@@%315%252$1@@$2@@@%315%252$1@@%315%256$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%256$0@@%258$1@@@%316%258$1@@%256$0@@@|@|@@%141%88%148%87%148%77%178%315%256$0@@%315%258$1@@$2@@@%315%258$1@@%315%256$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%256$0@@%244$1@@@%316%244$1@@%256$0@@@|@|@@%141%88%148%87%148%77%178%315%256$0@@%315%244$1@@$2@@@%315%244$1@@%315%256$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%256$0@@%236$1@@@%316%236$1@@%256$0@@@|@|@@%141%88%148%87%148%77%178%315%256$0@@%315%236$1@@$2@@@%315%236$1@@%315%256$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%256$0@@%254$1@@@%316%254$1@@%256$0@@@|@|@@%141%88%148%87%148%77%178%315%256$0@@%315%254$1@@$2@@@%315%254$1@@%315%256$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%248$0@@%252$1@@@%316%252$1@@%248$0@@@|@|@@%141%88%148%87%148%77%178%315%248$0@@%315%252$1@@$2@@@%315%252$1@@%315%248$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%248$0@@%258$1@@@%316%258$1@@%248$0@@@|@|@@%141%88%148%87%148%77%178%315%248$0@@%315%258$1@@$2@@@%315%258$1@@%315%248$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%248$0@@%244$1@@@%316%244$1@@%248$0@@@|@|@@%141%88%148%87%148%77%178%315%248$0@@%315%244$1@@$2@@@%315%244$1@@%315%248$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%248$0@@%236$1@@@%316%236$1@@%248$0@@@|@|@@%141%88%148%87%148%77%178%315%248$0@@%315%236$1@@$2@@@%315%236$1@@%315%248$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%248$0@@%254$1@@@%316%254$1@@%248$0@@@|@|@@%141%88%148%87%148%77%178%315%248$0@@%315%254$1@@$2@@@%315%254$1@@%315%248$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%248$0@@%256$1@@@%316%256$1@@%248$0@@@|@|@@%141%88%148%87%148%77%178%315%248$0@@%315%256$1@@$2@@@%315%256$1@@%315%248$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%246$0@@%252$1@@@%316%252$1@@%246$0@@@|@|@@%141%88%148%87%148%77%178%315%246$0@@%315%252$1@@$2@@@%315%252$1@@%315%246$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%246$0@@%258$1@@@%316%258$1@@%246$0@@@|@|@@%141%88%148%87%148%77%178%315%246$0@@%315%258$1@@$2@@@%315%258$1@@%315%246$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%246$0@@%244$1@@@%316%244$1@@%246$0@@@|@|@@%141%88%148%87%148%77%178%315%246$0@@%315%244$1@@$2@@@%315%244$1@@%315%246$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%246$0@@%236$1@@@%316%236$1@@%246$0@@@|@|@@%141%88%148%87%148%77%178%315%246$0@@%315%236$1@@$2@@@%315%236$1@@%315%246$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%246$0@@%254$1@@@%316%254$1@@%246$0@@@|@|@@%141%88%148%87%148%77%178%315%246$0@@%315%254$1@@$2@@@%315%254$1@@%315%246$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%246$0@@%256$1@@@%316%256$1@@%246$0@@@|@|@@%141%88%148%87%148%77%178%315%246$0@@%315%256$1@@$2@@@%315%256$1@@%315%246$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%246$0@@%248$1@@@%316%248$1@@%246$0@@@|@|@@%141%88%148%87%148%77%178%315%246$0@@%315%248$1@@$2@@@%315%248$1@@%315%246$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%238$0@@%252$1@@@%316%252$1@@%238$0@@@|@|@@%141%88%148%87%148%77%178%315%238$0@@%315%252$1@@$2@@@%315%252$1@@%315%238$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%238$0@@%258$1@@@%316%258$1@@%238$0@@@|@|@@%141%88%148%87%148%77%178%315%238$0@@%315%258$1@@$2@@@%315%258$1@@%315%238$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%238$0@@%244$1@@@%316%244$1@@%238$0@@@|@|@@%141%88%148%87%148%77%178%315%238$0@@%315%244$1@@$2@@@%315%244$1@@%315%238$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%238$0@@%236$1@@@%316%236$1@@%238$0@@@|@|@@%141%88%148%87%148%77%178%315%238$0@@%315%236$1@@$2@@@%315%236$1@@%315%238$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%238$0@@%254$1@@@%316%254$1@@%238$0@@@|@|@@%141%88%148%87%148%77%178%315%238$0@@%315%254$1@@$2@@@%315%254$1@@%315%238$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%238$0@@%256$1@@@%316%256$1@@%238$0@@@|@|@@%141%88%148%87%148%77%178%315%238$0@@%315%256$1@@$2@@@%315%256$1@@%315%238$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%238$0@@%248$1@@@%316%248$1@@%238$0@@@|@|@@%141%88%148%87%148%77%178%315%238$0@@%315%248$1@@$2@@@%315%248$1@@%315%238$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%238$0@@%246$1@@@%316%246$1@@%238$0@@@|@|@@%141%88%148%87%148%77%178%315%238$0@@%315%246$1@@$2@@@%315%246$1@@%315%238$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%242$0@@%252$1@@@%316%252$1@@%242$0@@@|@|@@%141%88%148%87%148%77%178%315%242$0@@%315%252$1@@$2@@@%315%252$1@@%315%242$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%242$0@@%258$1@@@%316%258$1@@%242$0@@@|@|@@%141%88%148%87%148%77%178%315%242$0@@%315%258$1@@$2@@@%315%258$1@@%315%242$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%242$0@@%244$1@@@%316%244$1@@%242$0@@@|@|@@%141%88%148%87%148%77%178%315%242$0@@%315%244$1@@$2@@@%315%244$1@@%315%242$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%242$0@@%236$1@@@%316%236$1@@%242$0@@@|@|@@%141%88%148%87%148%77%178%315%242$0@@%315%236$1@@$2@@@%315%236$1@@%315%242$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%242$0@@%254$1@@@%316%254$1@@%242$0@@@|@|@@%141%88%148%87%148%77%178%315%242$0@@%315%254$1@@$2@@@%315%254$1@@%315%242$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%242$0@@%256$1@@@%316%256$1@@%242$0@@@|@|@@%141%88%148%87%148%77%178%315%242$0@@%315%256$1@@$2@@@%315%256$1@@%315%242$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%242$0@@%248$1@@@%316%248$1@@%242$0@@@|@|@@%141%88%148%87%148%77%178%315%242$0@@%315%248$1@@$2@@@%315%248$1@@%315%242$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%242$0@@%246$1@@@%316%246$1@@%242$0@@@|@|@@%141%88%148%87%148%77%178%315%242$0@@%315%246$1@@$2@@@%315%246$1@@%315%242$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%180%316%242$0@@%238$1@@@%316%238$1@@%242$0@@@|@|@@%141%88%148%87%148%77%178%315%242$0@@%315%238$1@@$2@@@%315%238$1@@%315%242$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%180%316%240$0@@%252$1@@@%316%252$1@@%240$0@@@|@|@@%141%88%148%87%143%74%178%315%240$0@@%315%252$1@@$2@@@%315%252$1@@%315%240$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%180%316%240$0@@%258$1@@@%316%258$1@@%240$0@@@|@|@@%141%88%148%87%143%74%178%315%240$0@@%315%258$1@@$2@@@%315%258$1@@%315%240$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%180%316%240$0@@%244$1@@@%316%244$1@@%240$0@@@|@|@@%141%88%148%87%143%74%178%315%240$0@@%315%244$1@@$2@@@%315%244$1@@%315%240$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%180%316%240$0@@%236$1@@@%316%236$1@@%240$0@@@|@|@@%141%88%148%87%143%74%178%315%240$0@@%315%236$1@@$2@@@%315%236$1@@%315%240$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%180%316%240$0@@%254$1@@@%316%254$1@@%240$0@@@|@|@@%141%88%148%87%143%74%178%315%240$0@@%315%254$1@@$2@@@%315%254$1@@%315%240$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%180%316%240$0@@%256$1@@@%316%256$1@@%240$0@@@|@|@@%141%88%148%87%143%74%178%315%240$0@@%315%256$1@@$2@@@%315%256$1@@%315%240$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%180%316%240$0@@%248$1@@@%316%248$1@@%240$0@@@|@|@@%141%88%148%87%143%74%178%315%240$0@@%315%248$1@@$2@@@%315%248$1@@%315%240$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%180%316%240$0@@%246$1@@@%316%246$1@@%240$0@@@|@|@@%141%88%148%87%143%74%178%315%240$0@@%315%246$1@@$2@@@%315%246$1@@%315%240$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%180%316%240$0@@%238$1@@@%316%238$1@@%240$0@@@|@|@@%141%88%148%87%143%74%178%315%240$0@@%315%238$1@@$2@@@%315%238$1@@%315%240$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%180%316%240$0@@%242$1@@@%316%242$1@@%240$0@@@|@|@@%141%88%148%87%143%74%178%315%240$0@@%315%242$1@@$2@@@%315%242$1@@%315%240$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%180%316%251$0@@%252$1@@@%316%252$1@@%251$0@@@|@|@@%141%88%148%87%146%75%178%315%251$0@@%315%252$1@@$2@@@%315%252$1@@%315%251$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%180%316%251$0@@%258$1@@@%316%258$1@@%251$0@@@|@|@@%141%88%148%87%146%75%178%315%251$0@@%315%258$1@@$2@@@%315%258$1@@%315%251$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%180%316%251$0@@%244$1@@@%316%244$1@@%251$0@@@|@|@@%141%88%148%87%146%75%178%315%251$0@@%315%244$1@@$2@@@%315%244$1@@%315%251$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%180%316%251$0@@%236$1@@@%316%236$1@@%251$0@@@|@|@@%141%88%148%87%146%75%178%315%251$0@@%315%236$1@@$2@@@%315%236$1@@%315%251$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%180%316%251$0@@%254$1@@@%316%254$1@@%251$0@@@|@|@@%141%88%148%87%146%75%178%315%251$0@@%315%254$1@@$2@@@%315%254$1@@%315%251$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%180%316%251$0@@%256$1@@@%316%256$1@@%251$0@@@|@|@@%141%88%148%87%146%75%178%315%251$0@@%315%256$1@@$2@@@%315%256$1@@%315%251$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%180%316%251$0@@%248$1@@@%316%248$1@@%251$0@@@|@|@@%141%88%148%87%146%75%178%315%251$0@@%315%248$1@@$2@@@%315%248$1@@%315%251$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%180%316%251$0@@%246$1@@@%316%246$1@@%251$0@@@|@|@@%141%88%148%87%146%75%178%315%251$0@@%315%246$1@@$2@@@%315%246$1@@%315%251$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%180%316%251$0@@%238$1@@@%316%238$1@@%251$0@@@|@|@@%141%88%148%87%146%75%178%315%251$0@@%315%238$1@@$2@@@%315%238$1@@%315%251$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%180%316%251$0@@%242$1@@@%316%242$1@@%251$0@@@|@|@@%141%88%148%87%146%75%178%315%251$0@@%315%242$1@@$2@@@%315%242$1@@%315%251$0@@$2@@@|@|@|@@@%169%143%85%146%75%180%316%251$0@@%240$1@@@%316%240$1@@%251$0@@@|@|@@%141%88%143%85%146%75%178%315%251$0@@%315%240$1@@$2@@@%315%240$1@@%315%251$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_interpreted_section_component_equality x = x
    val op elf32_interpreted_section_component_equality =
    DT(((("elf_interpreted_section",37),
        [("bool",[25,26,50,55,62,180]),
         ("elf_interpreted_section",[1,2,3,18]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%138%38%138%40%174%176$1@$0@@%169%183%249$1@@%249$0@@@%169%183%257$1@@%257$0@@@%169%183%243$1@@%243$0@@@%169%183%235$1@@%235$0@@@%169%183%253$1@@%253$0@@@%169%183%255$1@@%255$0@@@%169%183%247$1@@%247$0@@@%169%183%245$1@@%245$0@@@%169%183%237$1@@%237$0@@@%169%183%241$1@@%241$0@@@%169%175%239$1@@%239$0@@@%182%250$1@@%250$0@@@@@@@@@@@@@@|@|@"])
  fun op elf32_interpreted_section_updates_eq_literal x = x
    val op elf32_interpreted_section_updates_eq_literal =
    DT(((("elf_interpreted_section",38),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_interpreted_section",[1,2,3,31])]),["DISK_THM"]),
       [read"%138%36%153%119%153%116%153%113%153%110%153%107%153%104%153%101%153%98%153%95%153%94%137%33%150%91%176%252%217$11@@%258%217$10@@%244%217$9@@%236%217$8@@%254%217$7@@%256%217$6@@%248%217$5@@%246%217$4@@%238%217$3@@%242%217$2@@%240%213$1@@%251%216$0@@$12@@@@@@@@@@@@@%252%217$11@@%258%217$10@@%244%217$9@@%236%217$8@@%254%217$7@@%256%217$6@@%248%217$5@@%246%217$4@@%238%217$3@@%242%217$2@@%240%213$1@@%251%216$0@@%197@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_literal_nchotomy x = x
    val op elf32_interpreted_section_literal_nchotomy =
    DT(((("elf_interpreted_section",39),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_interpreted_section",[1,2,3,31]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%138%36%195%119%195%116%195%113%195%110%195%107%195%104%195%101%195%98%195%95%195%94%187%33%194%91%176$12@%252%217$11@@%258%217$10@@%244%217$9@@%236%217$8@@%254%217$7@@%256%217$6@@%248%217$5@@%246%217$4@@%238%217$3@@%242%217$2@@%240%213$1@@%251%216$0@@%197@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf32_interpreted_section x = x
    val op FORALL_elf32_interpreted_section =
    DT(((("elf_interpreted_section",40),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_interpreted_section",[1,2,3,31]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%144%6%174%138%36$1$0@|@@%153%119%153%116%153%113%153%110%153%107%153%104%153%101%153%98%153%95%153%94%137%33%150%91$12%252%217$11@@%258%217$10@@%244%217$9@@%236%217$8@@%254%217$7@@%256%217$6@@%248%217$5@@%246%217$4@@%238%217$3@@%242%217$2@@%240%213$1@@%251%216$0@@%197@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf32_interpreted_section x = x
    val op EXISTS_elf32_interpreted_section =
    DT(((("elf_interpreted_section",41),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_interpreted_section",[1,2,3,31]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%144%6%174%188%36$1$0@|@@%195%119%195%116%195%113%195%110%195%107%195%104%195%101%195%98%195%95%195%94%187%33%194%91$12%252%217$11@@%258%217$10@@%244%217$9@@%236%217$8@@%254%217$7@@%256%217$6@@%248%217$5@@%246%217$4@@%238%217$3@@%242%217$2@@%240%213$1@@%251%216$0@@%197@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op elf32_interpreted_section_literal_11 x = x
    val op elf32_interpreted_section_literal_11 =
    DT(((("elf_interpreted_section",42),
        [("combin",[12]),
         ("elf_interpreted_section",[32,37])]),["DISK_THM"]),
       [read"%153%120%153%117%153%114%153%111%153%108%153%105%153%102%153%99%153%96%153%98%137%34%150%92%153%121%153%118%153%115%153%112%153%109%153%106%153%103%153%100%153%97%153%101%137%35%150%93%174%176%252%217$23@@%258%217$22@@%244%217$21@@%236%217$20@@%254%217$19@@%256%217$18@@%248%217$17@@%246%217$16@@%238%217$15@@%242%217$14@@%240%213$13@@%251%216$12@@%197@@@@@@@@@@@@@%252%217$11@@%258%217$10@@%244%217$9@@%236%217$8@@%254%217$7@@%256%217$6@@%248%217$5@@%246%217$4@@%238%217$3@@%242%217$2@@%240%213$1@@%251%216$0@@%197@@@@@@@@@@@@@@%169%183$23@$11@@%169%183$22@$10@@%169%183$21@$9@@%169%183$20@$8@@%169%183$19@$7@@%169%183$18@$6@@%169%183$17@$5@@%169%183$16@$4@@%169%183$15@$3@@%169%183$14@$2@@%169%175$13@$1@@%182$12@$0@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf32_interpreted_section x = x
    val op datatype_elf32_interpreted_section =
    DT(((("elf_interpreted_section",43),[("bool",[25,170])]),["DISK_THM"]),
       [read"%203%123%44@%52@%56@%49@%45@%54@%55@%51@%50@%46@%48@%47@%53@@"])
  fun op elf32_interpreted_section_11 x = x
    val op elf32_interpreted_section_11 =
    DT(((("elf_interpreted_section",44),
        [("bool",[26,50,55,62,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%8%153%11%153%17%153%19%153%21%153%23%153%25%153%27%153%29%153%31%137%13%150%15%153%9%153%12%153%18%153%20%153%22%153%24%153%26%153%28%153%30%153%32%137%14%150%16%174%176%324$23@$22@$21@$20@$19@$18@$17@$16@$15@$14@$13@$12@@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%169%183$23@$11@@%169%183$22@$10@@%169%183$21@$9@@%169%183$20@$8@@%169%183$19@$7@@%169%183$18@$6@@%169%183$17@$5@@%169%183$16@$4@@%169%183$15@$3@@%169%183$14@$2@@%169%175$13@$1@@%182$12@$0@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_case_cong x = x
    val op elf32_interpreted_section_case_cong =
    DT(((("elf_interpreted_section",45),
        [("bool",[26,180]),
         ("elf_interpreted_section",[1,2,3,4])]),["DISK_THM"]),
       [read"%138%2%138%4%147%76%186%169%176$2@$1@@%153%8%153%11%153%17%153%19%153%21%153%23%153%25%153%27%153%29%153%31%137%13%150%15%186%176$13@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%172$12$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%79$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@|@|@|@|@@@%172%234$2@$0@@%234$1@%79@@@|@|@|@"])
  fun op elf32_interpreted_section_nchotomy x = x
    val op elf32_interpreted_section_nchotomy =
    DT(((("elf_interpreted_section",46),
        [("bool",[26,180]),
         ("elf_interpreted_section",[1,2,3])]),["DISK_THM"]),
       [read"%138%42%195%94%195%95%195%98%195%101%195%104%195%107%195%110%195%113%195%116%195%119%187%33%194%126%176$12@%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_Axiom x = x
    val op elf32_interpreted_section_Axiom =
    DT(((("elf_interpreted_section",47),
        [("bool",[26,180]),("elf_interpreted_section",[1,2,3]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%147%76%190%83%153%8%153%11%153%17%153%19%153%21%153%23%153%25%153%27%153%29%153%31%137%13%150%15%172$12%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$13$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_interpreted_section_induction x = x
    val op elf32_interpreted_section_induction =
    DT(((("elf_interpreted_section",48),
        [("bool",[26]),("elf_interpreted_section",[1,2,3])]),["DISK_THM"]),
       [read"%144%6%186%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%126$12%324$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@@%138%36$1$0@|@@|@"])
  fun op elf64_interpreted_section_accessors x = x
    val op elf64_interpreted_section_accessors =
    DT(((("elf_interpreted_section",68),
        [("elf_interpreted_section",
         [56,57,58,59,60,61,62,63,64,65,66,67])]),["DISK_THM"]),
       [read"%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%276%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%284%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$10@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%270%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%262%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%280%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%282%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%274%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%272%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%264%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%183%268%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@|@|@@%169%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%175%266%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@|@|@@%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%182%277%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@"])
  fun op elf64_interpreted_section_fn_updates x = x
    val op elf64_interpreted_section_fn_updates =
    DT(((("elf_interpreted_section",81),
        [("elf_interpreted_section",
         [69,70,71,72,73,74,75,76,77,78,79,80])]),["DISK_THM"]),
       [read"%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%279$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$12$11@@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%285$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$12$10@@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%271$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$12$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%263$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$12$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%281$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$12$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%283$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$12$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%275$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$6@$12$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%273$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$6@$5@$12$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%265$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$6@$5@$4@$12$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%148%77%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%269$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$12$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%169%143%74%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%267$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$12$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@@%146%75%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%91%177%278$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$12$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@"])
  fun op elf64_interpreted_section_accfupds x = x
    val op elf64_interpreted_section_accfupds =
    DT(((("elf_interpreted_section",82),
        [("bool",[25,26,55,180]),
         ("elf_interpreted_section",[51,52,53,68,81])]),["DISK_THM"]),
       [read"%169%148%77%139%37%183%276%285$1@$0@@@%276$0@@|@|@@%169%148%77%139%37%183%276%271$1@$0@@@%276$0@@|@|@@%169%148%77%139%37%183%276%263$1@$0@@@%276$0@@|@|@@%169%148%77%139%37%183%276%281$1@$0@@@%276$0@@|@|@@%169%148%77%139%37%183%276%283$1@$0@@@%276$0@@|@|@@%169%148%77%139%37%183%276%275$1@$0@@@%276$0@@|@|@@%169%148%77%139%37%183%276%273$1@$0@@@%276$0@@|@|@@%169%148%77%139%37%183%276%265$1@$0@@@%276$0@@|@|@@%169%148%77%139%37%183%276%269$1@$0@@@%276$0@@|@|@@%169%143%74%139%37%183%276%267$1@$0@@@%276$0@@|@|@@%169%146%75%139%37%183%276%278$1@$0@@@%276$0@@|@|@@%169%148%77%139%37%183%284%279$1@$0@@@%284$0@@|@|@@%169%148%77%139%37%183%284%271$1@$0@@@%284$0@@|@|@@%169%148%77%139%37%183%284%263$1@$0@@@%284$0@@|@|@@%169%148%77%139%37%183%284%281$1@$0@@@%284$0@@|@|@@%169%148%77%139%37%183%284%283$1@$0@@@%284$0@@|@|@@%169%148%77%139%37%183%284%275$1@$0@@@%284$0@@|@|@@%169%148%77%139%37%183%284%273$1@$0@@@%284$0@@|@|@@%169%148%77%139%37%183%284%265$1@$0@@@%284$0@@|@|@@%169%148%77%139%37%183%284%269$1@$0@@@%284$0@@|@|@@%169%143%74%139%37%183%284%267$1@$0@@@%284$0@@|@|@@%169%146%75%139%37%183%284%278$1@$0@@@%284$0@@|@|@@%169%148%77%139%37%183%270%279$1@$0@@@%270$0@@|@|@@%169%148%77%139%37%183%270%285$1@$0@@@%270$0@@|@|@@%169%148%77%139%37%183%270%263$1@$0@@@%270$0@@|@|@@%169%148%77%139%37%183%270%281$1@$0@@@%270$0@@|@|@@%169%148%77%139%37%183%270%283$1@$0@@@%270$0@@|@|@@%169%148%77%139%37%183%270%275$1@$0@@@%270$0@@|@|@@%169%148%77%139%37%183%270%273$1@$0@@@%270$0@@|@|@@%169%148%77%139%37%183%270%265$1@$0@@@%270$0@@|@|@@%169%148%77%139%37%183%270%269$1@$0@@@%270$0@@|@|@@%169%143%74%139%37%183%270%267$1@$0@@@%270$0@@|@|@@%169%146%75%139%37%183%270%278$1@$0@@@%270$0@@|@|@@%169%148%77%139%37%183%262%279$1@$0@@@%262$0@@|@|@@%169%148%77%139%37%183%262%285$1@$0@@@%262$0@@|@|@@%169%148%77%139%37%183%262%271$1@$0@@@%262$0@@|@|@@%169%148%77%139%37%183%262%281$1@$0@@@%262$0@@|@|@@%169%148%77%139%37%183%262%283$1@$0@@@%262$0@@|@|@@%169%148%77%139%37%183%262%275$1@$0@@@%262$0@@|@|@@%169%148%77%139%37%183%262%273$1@$0@@@%262$0@@|@|@@%169%148%77%139%37%183%262%265$1@$0@@@%262$0@@|@|@@%169%148%77%139%37%183%262%269$1@$0@@@%262$0@@|@|@@%169%143%74%139%37%183%262%267$1@$0@@@%262$0@@|@|@@%169%146%75%139%37%183%262%278$1@$0@@@%262$0@@|@|@@%169%148%77%139%37%183%280%279$1@$0@@@%280$0@@|@|@@%169%148%77%139%37%183%280%285$1@$0@@@%280$0@@|@|@@%169%148%77%139%37%183%280%271$1@$0@@@%280$0@@|@|@@%169%148%77%139%37%183%280%263$1@$0@@@%280$0@@|@|@@%169%148%77%139%37%183%280%283$1@$0@@@%280$0@@|@|@@%169%148%77%139%37%183%280%275$1@$0@@@%280$0@@|@|@@%169%148%77%139%37%183%280%273$1@$0@@@%280$0@@|@|@@%169%148%77%139%37%183%280%265$1@$0@@@%280$0@@|@|@@%169%148%77%139%37%183%280%269$1@$0@@@%280$0@@|@|@@%169%143%74%139%37%183%280%267$1@$0@@@%280$0@@|@|@@%169%146%75%139%37%183%280%278$1@$0@@@%280$0@@|@|@@%169%148%77%139%37%183%282%279$1@$0@@@%282$0@@|@|@@%169%148%77%139%37%183%282%285$1@$0@@@%282$0@@|@|@@%169%148%77%139%37%183%282%271$1@$0@@@%282$0@@|@|@@%169%148%77%139%37%183%282%263$1@$0@@@%282$0@@|@|@@%169%148%77%139%37%183%282%281$1@$0@@@%282$0@@|@|@@%169%148%77%139%37%183%282%275$1@$0@@@%282$0@@|@|@@%169%148%77%139%37%183%282%273$1@$0@@@%282$0@@|@|@@%169%148%77%139%37%183%282%265$1@$0@@@%282$0@@|@|@@%169%148%77%139%37%183%282%269$1@$0@@@%282$0@@|@|@@%169%143%74%139%37%183%282%267$1@$0@@@%282$0@@|@|@@%169%146%75%139%37%183%282%278$1@$0@@@%282$0@@|@|@@%169%148%77%139%37%183%274%279$1@$0@@@%274$0@@|@|@@%169%148%77%139%37%183%274%285$1@$0@@@%274$0@@|@|@@%169%148%77%139%37%183%274%271$1@$0@@@%274$0@@|@|@@%169%148%77%139%37%183%274%263$1@$0@@@%274$0@@|@|@@%169%148%77%139%37%183%274%281$1@$0@@@%274$0@@|@|@@%169%148%77%139%37%183%274%283$1@$0@@@%274$0@@|@|@@%169%148%77%139%37%183%274%273$1@$0@@@%274$0@@|@|@@%169%148%77%139%37%183%274%265$1@$0@@@%274$0@@|@|@@%169%148%77%139%37%183%274%269$1@$0@@@%274$0@@|@|@@%169%143%74%139%37%183%274%267$1@$0@@@%274$0@@|@|@@%169%146%75%139%37%183%274%278$1@$0@@@%274$0@@|@|@@%169%148%77%139%37%183%272%279$1@$0@@@%272$0@@|@|@@%169%148%77%139%37%183%272%285$1@$0@@@%272$0@@|@|@@%169%148%77%139%37%183%272%271$1@$0@@@%272$0@@|@|@@%169%148%77%139%37%183%272%263$1@$0@@@%272$0@@|@|@@%169%148%77%139%37%183%272%281$1@$0@@@%272$0@@|@|@@%169%148%77%139%37%183%272%283$1@$0@@@%272$0@@|@|@@%169%148%77%139%37%183%272%275$1@$0@@@%272$0@@|@|@@%169%148%77%139%37%183%272%265$1@$0@@@%272$0@@|@|@@%169%148%77%139%37%183%272%269$1@$0@@@%272$0@@|@|@@%169%143%74%139%37%183%272%267$1@$0@@@%272$0@@|@|@@%169%146%75%139%37%183%272%278$1@$0@@@%272$0@@|@|@@%169%148%77%139%37%183%264%279$1@$0@@@%264$0@@|@|@@%169%148%77%139%37%183%264%285$1@$0@@@%264$0@@|@|@@%169%148%77%139%37%183%264%271$1@$0@@@%264$0@@|@|@@%169%148%77%139%37%183%264%263$1@$0@@@%264$0@@|@|@@%169%148%77%139%37%183%264%281$1@$0@@@%264$0@@|@|@@%169%148%77%139%37%183%264%283$1@$0@@@%264$0@@|@|@@%169%148%77%139%37%183%264%275$1@$0@@@%264$0@@|@|@@%169%148%77%139%37%183%264%273$1@$0@@@%264$0@@|@|@@%169%148%77%139%37%183%264%269$1@$0@@@%264$0@@|@|@@%169%143%74%139%37%183%264%267$1@$0@@@%264$0@@|@|@@%169%146%75%139%37%183%264%278$1@$0@@@%264$0@@|@|@@%169%148%77%139%37%183%268%279$1@$0@@@%268$0@@|@|@@%169%148%77%139%37%183%268%285$1@$0@@@%268$0@@|@|@@%169%148%77%139%37%183%268%271$1@$0@@@%268$0@@|@|@@%169%148%77%139%37%183%268%263$1@$0@@@%268$0@@|@|@@%169%148%77%139%37%183%268%281$1@$0@@@%268$0@@|@|@@%169%148%77%139%37%183%268%283$1@$0@@@%268$0@@|@|@@%169%148%77%139%37%183%268%275$1@$0@@@%268$0@@|@|@@%169%148%77%139%37%183%268%273$1@$0@@@%268$0@@|@|@@%169%148%77%139%37%183%268%265$1@$0@@@%268$0@@|@|@@%169%143%74%139%37%183%268%267$1@$0@@@%268$0@@|@|@@%169%146%75%139%37%183%268%278$1@$0@@@%268$0@@|@|@@%169%148%77%139%37%175%266%279$1@$0@@@%266$0@@|@|@@%169%148%77%139%37%175%266%285$1@$0@@@%266$0@@|@|@@%169%148%77%139%37%175%266%271$1@$0@@@%266$0@@|@|@@%169%148%77%139%37%175%266%263$1@$0@@@%266$0@@|@|@@%169%148%77%139%37%175%266%281$1@$0@@@%266$0@@|@|@@%169%148%77%139%37%175%266%283$1@$0@@@%266$0@@|@|@@%169%148%77%139%37%175%266%275$1@$0@@@%266$0@@|@|@@%169%148%77%139%37%175%266%273$1@$0@@@%266$0@@|@|@@%169%148%77%139%37%175%266%265$1@$0@@@%266$0@@|@|@@%169%148%77%139%37%175%266%269$1@$0@@@%266$0@@|@|@@%169%146%75%139%37%175%266%278$1@$0@@@%266$0@@|@|@@%169%148%77%139%37%182%277%279$1@$0@@@%277$0@@|@|@@%169%148%77%139%37%182%277%285$1@$0@@@%277$0@@|@|@@%169%148%77%139%37%182%277%271$1@$0@@@%277$0@@|@|@@%169%148%77%139%37%182%277%263$1@$0@@@%277$0@@|@|@@%169%148%77%139%37%182%277%281$1@$0@@@%277$0@@|@|@@%169%148%77%139%37%182%277%283$1@$0@@@%277$0@@|@|@@%169%148%77%139%37%182%277%275$1@$0@@@%277$0@@|@|@@%169%148%77%139%37%182%277%273$1@$0@@@%277$0@@|@|@@%169%148%77%139%37%182%277%265$1@$0@@@%277$0@@|@|@@%169%148%77%139%37%182%277%269$1@$0@@@%277$0@@|@|@@%169%143%74%139%37%182%277%267$1@$0@@@%277$0@@|@|@@%169%148%77%139%37%183%276%279$1@$0@@@$1%276$0@@@|@|@@%169%148%77%139%37%183%284%285$1@$0@@@$1%284$0@@@|@|@@%169%148%77%139%37%183%270%271$1@$0@@@$1%270$0@@@|@|@@%169%148%77%139%37%183%262%263$1@$0@@@$1%262$0@@@|@|@@%169%148%77%139%37%183%280%281$1@$0@@@$1%280$0@@@|@|@@%169%148%77%139%37%183%282%283$1@$0@@@$1%282$0@@@|@|@@%169%148%77%139%37%183%274%275$1@$0@@@$1%274$0@@@|@|@@%169%148%77%139%37%183%272%273$1@$0@@@$1%272$0@@@|@|@@%169%148%77%139%37%183%264%265$1@$0@@@$1%264$0@@@|@|@@%169%148%77%139%37%183%268%269$1@$0@@@$1%268$0@@@|@|@@%169%143%74%139%37%175%266%267$1@$0@@@$1%266$0@@@|@|@@%146%75%139%37%182%277%278$1@$0@@@$1%277$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_interpreted_section_fupdfupds x = x
    val op elf64_interpreted_section_fupdfupds =
    DT(((("elf_interpreted_section",83),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_interpreted_section",[51,52,53,81])]),["DISK_THM"]),
       [read"%169%148%87%148%77%139%37%177%279$1@%279$2@$0@@@%279%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%139%37%177%285$1@%285$2@$0@@@%285%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%139%37%177%271$1@%271$2@$0@@@%271%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%139%37%177%263$1@%263$2@$0@@@%263%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%139%37%177%281$1@%281$2@$0@@@%281%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%139%37%177%283$1@%283$2@$0@@@%283%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%139%37%177%275$1@%275$2@$0@@@%275%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%139%37%177%273$1@%273$2@$0@@@%273%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%139%37%177%265$1@%265$2@$0@@@%265%320$1@$2@@$0@@|@|@|@@%169%148%87%148%77%139%37%177%269$1@%269$2@$0@@@%269%320$1@$2@@$0@@|@|@|@@%169%143%85%143%74%139%37%177%267$1@%267$2@$0@@@%267%314$1@$2@@$0@@|@|@|@@%146%86%146%75%139%37%177%278$1@%278$2@$0@@@%278%319$1@$2@@$0@@|@|@|@@@@@@@@@@@@"])
  fun op elf64_interpreted_section_fupdfupds_comp x = x
    val op elf64_interpreted_section_fupdfupds_comp =
    DT(((("elf_interpreted_section",84),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_interpreted_section",[51,52,53,81])]),["DISK_THM"]),
       [read"%169%169%148%87%148%77%181%318%279$0@@%279$1@@@%279%320$0@$1@@@|@|@@%142%89%148%87%148%77%179%317%279$0@@%317%279$1@@$2@@@%317%279%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%181%318%285$0@@%285$1@@@%285%320$0@$1@@@|@|@@%142%89%148%87%148%77%179%317%285$0@@%317%285$1@@$2@@@%317%285%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%181%318%271$0@@%271$1@@@%271%320$0@$1@@@|@|@@%142%89%148%87%148%77%179%317%271$0@@%317%271$1@@$2@@@%317%271%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%181%318%263$0@@%263$1@@@%263%320$0@$1@@@|@|@@%142%89%148%87%148%77%179%317%263$0@@%317%263$1@@$2@@@%317%263%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%181%318%281$0@@%281$1@@@%281%320$0@$1@@@|@|@@%142%89%148%87%148%77%179%317%281$0@@%317%281$1@@$2@@@%317%281%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%181%318%283$0@@%283$1@@@%283%320$0@$1@@@|@|@@%142%89%148%87%148%77%179%317%283$0@@%317%283$1@@$2@@@%317%283%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%181%318%275$0@@%275$1@@@%275%320$0@$1@@@|@|@@%142%89%148%87%148%77%179%317%275$0@@%317%275$1@@$2@@@%317%275%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%181%318%273$0@@%273$1@@@%273%320$0@$1@@@|@|@@%142%89%148%87%148%77%179%317%273$0@@%317%273$1@@$2@@@%317%273%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%181%318%265$0@@%265$1@@@%265%320$0@$1@@@|@|@@%142%89%148%87%148%77%179%317%265$0@@%317%265$1@@$2@@@%317%265%320$0@$1@@@$2@@|@|@|@@@%169%169%148%87%148%77%181%318%269$0@@%269$1@@@%269%320$0@$1@@@|@|@@%142%89%148%87%148%77%179%317%269$0@@%317%269$1@@$2@@@%317%269%320$0@$1@@@$2@@|@|@|@@@%169%169%143%85%143%74%181%318%267$0@@%267$1@@@%267%314$0@$1@@@|@|@@%142%89%143%85%143%74%179%317%267$0@@%317%267$1@@$2@@@%317%267%314$0@$1@@@$2@@|@|@|@@@%169%146%86%146%75%181%318%278$0@@%278$1@@@%278%319$0@$1@@@|@|@@%142%89%146%86%146%75%179%317%278$0@@%317%278$1@@$2@@@%317%278%319$0@$1@@@$2@@|@|@|@@@@@@@@@@@@@"])
  fun op elf64_interpreted_section_fupdcanon x = x
    val op elf64_interpreted_section_fupdcanon =
    DT(((("elf_interpreted_section",85),
        [("bool",[25,26,55,180]),
         ("elf_interpreted_section",[51,52,53,81])]),["DISK_THM"]),
       [read"%169%148%87%148%77%139%37%177%285$1@%279$2@$0@@@%279$2@%285$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%271$1@%279$2@$0@@@%279$2@%271$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%271$1@%285$2@$0@@@%285$2@%271$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%263$1@%279$2@$0@@@%279$2@%263$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%263$1@%285$2@$0@@@%285$2@%263$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%263$1@%271$2@$0@@@%271$2@%263$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%281$1@%279$2@$0@@@%279$2@%281$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%281$1@%285$2@$0@@@%285$2@%281$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%281$1@%271$2@$0@@@%271$2@%281$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%281$1@%263$2@$0@@@%263$2@%281$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%283$1@%279$2@$0@@@%279$2@%283$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%283$1@%285$2@$0@@@%285$2@%283$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%283$1@%271$2@$0@@@%271$2@%283$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%283$1@%263$2@$0@@@%263$2@%283$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%283$1@%281$2@$0@@@%281$2@%283$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%275$1@%279$2@$0@@@%279$2@%275$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%275$1@%285$2@$0@@@%285$2@%275$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%275$1@%271$2@$0@@@%271$2@%275$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%275$1@%263$2@$0@@@%263$2@%275$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%275$1@%281$2@$0@@@%281$2@%275$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%275$1@%283$2@$0@@@%283$2@%275$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%273$1@%279$2@$0@@@%279$2@%273$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%273$1@%285$2@$0@@@%285$2@%273$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%273$1@%271$2@$0@@@%271$2@%273$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%273$1@%263$2@$0@@@%263$2@%273$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%273$1@%281$2@$0@@@%281$2@%273$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%273$1@%283$2@$0@@@%283$2@%273$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%273$1@%275$2@$0@@@%275$2@%273$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%265$1@%279$2@$0@@@%279$2@%265$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%265$1@%285$2@$0@@@%285$2@%265$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%265$1@%271$2@$0@@@%271$2@%265$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%265$1@%263$2@$0@@@%263$2@%265$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%265$1@%281$2@$0@@@%281$2@%265$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%265$1@%283$2@$0@@@%283$2@%265$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%265$1@%275$2@$0@@@%275$2@%265$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%265$1@%273$2@$0@@@%273$2@%265$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%269$1@%279$2@$0@@@%279$2@%269$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%269$1@%285$2@$0@@@%285$2@%269$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%269$1@%271$2@$0@@@%271$2@%269$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%269$1@%263$2@$0@@@%263$2@%269$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%269$1@%281$2@$0@@@%281$2@%269$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%269$1@%283$2@$0@@@%283$2@%269$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%269$1@%275$2@$0@@@%275$2@%269$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%269$1@%273$2@$0@@@%273$2@%269$1@$0@@@|@|@|@@%169%148%87%148%77%139%37%177%269$1@%265$2@$0@@@%265$2@%269$1@$0@@@|@|@|@@%169%148%87%143%74%139%37%177%267$1@%279$2@$0@@@%279$2@%267$1@$0@@@|@|@|@@%169%148%87%143%74%139%37%177%267$1@%285$2@$0@@@%285$2@%267$1@$0@@@|@|@|@@%169%148%87%143%74%139%37%177%267$1@%271$2@$0@@@%271$2@%267$1@$0@@@|@|@|@@%169%148%87%143%74%139%37%177%267$1@%263$2@$0@@@%263$2@%267$1@$0@@@|@|@|@@%169%148%87%143%74%139%37%177%267$1@%281$2@$0@@@%281$2@%267$1@$0@@@|@|@|@@%169%148%87%143%74%139%37%177%267$1@%283$2@$0@@@%283$2@%267$1@$0@@@|@|@|@@%169%148%87%143%74%139%37%177%267$1@%275$2@$0@@@%275$2@%267$1@$0@@@|@|@|@@%169%148%87%143%74%139%37%177%267$1@%273$2@$0@@@%273$2@%267$1@$0@@@|@|@|@@%169%148%87%143%74%139%37%177%267$1@%265$2@$0@@@%265$2@%267$1@$0@@@|@|@|@@%169%148%87%143%74%139%37%177%267$1@%269$2@$0@@@%269$2@%267$1@$0@@@|@|@|@@%169%148%87%146%75%139%37%177%278$1@%279$2@$0@@@%279$2@%278$1@$0@@@|@|@|@@%169%148%87%146%75%139%37%177%278$1@%285$2@$0@@@%285$2@%278$1@$0@@@|@|@|@@%169%148%87%146%75%139%37%177%278$1@%271$2@$0@@@%271$2@%278$1@$0@@@|@|@|@@%169%148%87%146%75%139%37%177%278$1@%263$2@$0@@@%263$2@%278$1@$0@@@|@|@|@@%169%148%87%146%75%139%37%177%278$1@%281$2@$0@@@%281$2@%278$1@$0@@@|@|@|@@%169%148%87%146%75%139%37%177%278$1@%283$2@$0@@@%283$2@%278$1@$0@@@|@|@|@@%169%148%87%146%75%139%37%177%278$1@%275$2@$0@@@%275$2@%278$1@$0@@@|@|@|@@%169%148%87%146%75%139%37%177%278$1@%273$2@$0@@@%273$2@%278$1@$0@@@|@|@|@@%169%148%87%146%75%139%37%177%278$1@%265$2@$0@@@%265$2@%278$1@$0@@@|@|@|@@%169%148%87%146%75%139%37%177%278$1@%269$2@$0@@@%269$2@%278$1@$0@@@|@|@|@@%143%85%146%75%139%37%177%278$1@%267$2@$0@@@%267$2@%278$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_interpreted_section_fupdcanon_comp x = x
    val op elf64_interpreted_section_fupdcanon_comp =
    DT(((("elf_interpreted_section",86),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_interpreted_section",[51,52,53,81])]),["DISK_THM"]),
       [read"%169%169%148%87%148%77%181%318%285$0@@%279$1@@@%318%279$1@@%285$0@@@|@|@@%142%89%148%87%148%77%179%317%285$0@@%317%279$1@@$2@@@%317%279$1@@%317%285$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%271$0@@%279$1@@@%318%279$1@@%271$0@@@|@|@@%142%89%148%87%148%77%179%317%271$0@@%317%279$1@@$2@@@%317%279$1@@%317%271$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%271$0@@%285$1@@@%318%285$1@@%271$0@@@|@|@@%142%89%148%87%148%77%179%317%271$0@@%317%285$1@@$2@@@%317%285$1@@%317%271$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%263$0@@%279$1@@@%318%279$1@@%263$0@@@|@|@@%142%89%148%87%148%77%179%317%263$0@@%317%279$1@@$2@@@%317%279$1@@%317%263$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%263$0@@%285$1@@@%318%285$1@@%263$0@@@|@|@@%142%89%148%87%148%77%179%317%263$0@@%317%285$1@@$2@@@%317%285$1@@%317%263$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%263$0@@%271$1@@@%318%271$1@@%263$0@@@|@|@@%142%89%148%87%148%77%179%317%263$0@@%317%271$1@@$2@@@%317%271$1@@%317%263$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%281$0@@%279$1@@@%318%279$1@@%281$0@@@|@|@@%142%89%148%87%148%77%179%317%281$0@@%317%279$1@@$2@@@%317%279$1@@%317%281$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%281$0@@%285$1@@@%318%285$1@@%281$0@@@|@|@@%142%89%148%87%148%77%179%317%281$0@@%317%285$1@@$2@@@%317%285$1@@%317%281$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%281$0@@%271$1@@@%318%271$1@@%281$0@@@|@|@@%142%89%148%87%148%77%179%317%281$0@@%317%271$1@@$2@@@%317%271$1@@%317%281$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%281$0@@%263$1@@@%318%263$1@@%281$0@@@|@|@@%142%89%148%87%148%77%179%317%281$0@@%317%263$1@@$2@@@%317%263$1@@%317%281$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%283$0@@%279$1@@@%318%279$1@@%283$0@@@|@|@@%142%89%148%87%148%77%179%317%283$0@@%317%279$1@@$2@@@%317%279$1@@%317%283$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%283$0@@%285$1@@@%318%285$1@@%283$0@@@|@|@@%142%89%148%87%148%77%179%317%283$0@@%317%285$1@@$2@@@%317%285$1@@%317%283$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%283$0@@%271$1@@@%318%271$1@@%283$0@@@|@|@@%142%89%148%87%148%77%179%317%283$0@@%317%271$1@@$2@@@%317%271$1@@%317%283$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%283$0@@%263$1@@@%318%263$1@@%283$0@@@|@|@@%142%89%148%87%148%77%179%317%283$0@@%317%263$1@@$2@@@%317%263$1@@%317%283$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%283$0@@%281$1@@@%318%281$1@@%283$0@@@|@|@@%142%89%148%87%148%77%179%317%283$0@@%317%281$1@@$2@@@%317%281$1@@%317%283$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%275$0@@%279$1@@@%318%279$1@@%275$0@@@|@|@@%142%89%148%87%148%77%179%317%275$0@@%317%279$1@@$2@@@%317%279$1@@%317%275$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%275$0@@%285$1@@@%318%285$1@@%275$0@@@|@|@@%142%89%148%87%148%77%179%317%275$0@@%317%285$1@@$2@@@%317%285$1@@%317%275$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%275$0@@%271$1@@@%318%271$1@@%275$0@@@|@|@@%142%89%148%87%148%77%179%317%275$0@@%317%271$1@@$2@@@%317%271$1@@%317%275$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%275$0@@%263$1@@@%318%263$1@@%275$0@@@|@|@@%142%89%148%87%148%77%179%317%275$0@@%317%263$1@@$2@@@%317%263$1@@%317%275$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%275$0@@%281$1@@@%318%281$1@@%275$0@@@|@|@@%142%89%148%87%148%77%179%317%275$0@@%317%281$1@@$2@@@%317%281$1@@%317%275$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%275$0@@%283$1@@@%318%283$1@@%275$0@@@|@|@@%142%89%148%87%148%77%179%317%275$0@@%317%283$1@@$2@@@%317%283$1@@%317%275$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%273$0@@%279$1@@@%318%279$1@@%273$0@@@|@|@@%142%89%148%87%148%77%179%317%273$0@@%317%279$1@@$2@@@%317%279$1@@%317%273$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%273$0@@%285$1@@@%318%285$1@@%273$0@@@|@|@@%142%89%148%87%148%77%179%317%273$0@@%317%285$1@@$2@@@%317%285$1@@%317%273$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%273$0@@%271$1@@@%318%271$1@@%273$0@@@|@|@@%142%89%148%87%148%77%179%317%273$0@@%317%271$1@@$2@@@%317%271$1@@%317%273$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%273$0@@%263$1@@@%318%263$1@@%273$0@@@|@|@@%142%89%148%87%148%77%179%317%273$0@@%317%263$1@@$2@@@%317%263$1@@%317%273$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%273$0@@%281$1@@@%318%281$1@@%273$0@@@|@|@@%142%89%148%87%148%77%179%317%273$0@@%317%281$1@@$2@@@%317%281$1@@%317%273$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%273$0@@%283$1@@@%318%283$1@@%273$0@@@|@|@@%142%89%148%87%148%77%179%317%273$0@@%317%283$1@@$2@@@%317%283$1@@%317%273$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%273$0@@%275$1@@@%318%275$1@@%273$0@@@|@|@@%142%89%148%87%148%77%179%317%273$0@@%317%275$1@@$2@@@%317%275$1@@%317%273$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%265$0@@%279$1@@@%318%279$1@@%265$0@@@|@|@@%142%89%148%87%148%77%179%317%265$0@@%317%279$1@@$2@@@%317%279$1@@%317%265$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%265$0@@%285$1@@@%318%285$1@@%265$0@@@|@|@@%142%89%148%87%148%77%179%317%265$0@@%317%285$1@@$2@@@%317%285$1@@%317%265$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%265$0@@%271$1@@@%318%271$1@@%265$0@@@|@|@@%142%89%148%87%148%77%179%317%265$0@@%317%271$1@@$2@@@%317%271$1@@%317%265$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%265$0@@%263$1@@@%318%263$1@@%265$0@@@|@|@@%142%89%148%87%148%77%179%317%265$0@@%317%263$1@@$2@@@%317%263$1@@%317%265$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%265$0@@%281$1@@@%318%281$1@@%265$0@@@|@|@@%142%89%148%87%148%77%179%317%265$0@@%317%281$1@@$2@@@%317%281$1@@%317%265$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%265$0@@%283$1@@@%318%283$1@@%265$0@@@|@|@@%142%89%148%87%148%77%179%317%265$0@@%317%283$1@@$2@@@%317%283$1@@%317%265$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%265$0@@%275$1@@@%318%275$1@@%265$0@@@|@|@@%142%89%148%87%148%77%179%317%265$0@@%317%275$1@@$2@@@%317%275$1@@%317%265$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%265$0@@%273$1@@@%318%273$1@@%265$0@@@|@|@@%142%89%148%87%148%77%179%317%265$0@@%317%273$1@@$2@@@%317%273$1@@%317%265$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%269$0@@%279$1@@@%318%279$1@@%269$0@@@|@|@@%142%89%148%87%148%77%179%317%269$0@@%317%279$1@@$2@@@%317%279$1@@%317%269$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%269$0@@%285$1@@@%318%285$1@@%269$0@@@|@|@@%142%89%148%87%148%77%179%317%269$0@@%317%285$1@@$2@@@%317%285$1@@%317%269$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%269$0@@%271$1@@@%318%271$1@@%269$0@@@|@|@@%142%89%148%87%148%77%179%317%269$0@@%317%271$1@@$2@@@%317%271$1@@%317%269$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%269$0@@%263$1@@@%318%263$1@@%269$0@@@|@|@@%142%89%148%87%148%77%179%317%269$0@@%317%263$1@@$2@@@%317%263$1@@%317%269$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%269$0@@%281$1@@@%318%281$1@@%269$0@@@|@|@@%142%89%148%87%148%77%179%317%269$0@@%317%281$1@@$2@@@%317%281$1@@%317%269$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%269$0@@%283$1@@@%318%283$1@@%269$0@@@|@|@@%142%89%148%87%148%77%179%317%269$0@@%317%283$1@@$2@@@%317%283$1@@%317%269$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%269$0@@%275$1@@@%318%275$1@@%269$0@@@|@|@@%142%89%148%87%148%77%179%317%269$0@@%317%275$1@@$2@@@%317%275$1@@%317%269$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%269$0@@%273$1@@@%318%273$1@@%269$0@@@|@|@@%142%89%148%87%148%77%179%317%269$0@@%317%273$1@@$2@@@%317%273$1@@%317%269$0@@$2@@@|@|@|@@@%169%169%148%87%148%77%181%318%269$0@@%265$1@@@%318%265$1@@%269$0@@@|@|@@%142%89%148%87%148%77%179%317%269$0@@%317%265$1@@$2@@@%317%265$1@@%317%269$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%181%318%267$0@@%279$1@@@%318%279$1@@%267$0@@@|@|@@%142%89%148%87%143%74%179%317%267$0@@%317%279$1@@$2@@@%317%279$1@@%317%267$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%181%318%267$0@@%285$1@@@%318%285$1@@%267$0@@@|@|@@%142%89%148%87%143%74%179%317%267$0@@%317%285$1@@$2@@@%317%285$1@@%317%267$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%181%318%267$0@@%271$1@@@%318%271$1@@%267$0@@@|@|@@%142%89%148%87%143%74%179%317%267$0@@%317%271$1@@$2@@@%317%271$1@@%317%267$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%181%318%267$0@@%263$1@@@%318%263$1@@%267$0@@@|@|@@%142%89%148%87%143%74%179%317%267$0@@%317%263$1@@$2@@@%317%263$1@@%317%267$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%181%318%267$0@@%281$1@@@%318%281$1@@%267$0@@@|@|@@%142%89%148%87%143%74%179%317%267$0@@%317%281$1@@$2@@@%317%281$1@@%317%267$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%181%318%267$0@@%283$1@@@%318%283$1@@%267$0@@@|@|@@%142%89%148%87%143%74%179%317%267$0@@%317%283$1@@$2@@@%317%283$1@@%317%267$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%181%318%267$0@@%275$1@@@%318%275$1@@%267$0@@@|@|@@%142%89%148%87%143%74%179%317%267$0@@%317%275$1@@$2@@@%317%275$1@@%317%267$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%181%318%267$0@@%273$1@@@%318%273$1@@%267$0@@@|@|@@%142%89%148%87%143%74%179%317%267$0@@%317%273$1@@$2@@@%317%273$1@@%317%267$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%181%318%267$0@@%265$1@@@%318%265$1@@%267$0@@@|@|@@%142%89%148%87%143%74%179%317%267$0@@%317%265$1@@$2@@@%317%265$1@@%317%267$0@@$2@@@|@|@|@@@%169%169%148%87%143%74%181%318%267$0@@%269$1@@@%318%269$1@@%267$0@@@|@|@@%142%89%148%87%143%74%179%317%267$0@@%317%269$1@@$2@@@%317%269$1@@%317%267$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%181%318%278$0@@%279$1@@@%318%279$1@@%278$0@@@|@|@@%142%89%148%87%146%75%179%317%278$0@@%317%279$1@@$2@@@%317%279$1@@%317%278$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%181%318%278$0@@%285$1@@@%318%285$1@@%278$0@@@|@|@@%142%89%148%87%146%75%179%317%278$0@@%317%285$1@@$2@@@%317%285$1@@%317%278$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%181%318%278$0@@%271$1@@@%318%271$1@@%278$0@@@|@|@@%142%89%148%87%146%75%179%317%278$0@@%317%271$1@@$2@@@%317%271$1@@%317%278$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%181%318%278$0@@%263$1@@@%318%263$1@@%278$0@@@|@|@@%142%89%148%87%146%75%179%317%278$0@@%317%263$1@@$2@@@%317%263$1@@%317%278$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%181%318%278$0@@%281$1@@@%318%281$1@@%278$0@@@|@|@@%142%89%148%87%146%75%179%317%278$0@@%317%281$1@@$2@@@%317%281$1@@%317%278$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%181%318%278$0@@%283$1@@@%318%283$1@@%278$0@@@|@|@@%142%89%148%87%146%75%179%317%278$0@@%317%283$1@@$2@@@%317%283$1@@%317%278$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%181%318%278$0@@%275$1@@@%318%275$1@@%278$0@@@|@|@@%142%89%148%87%146%75%179%317%278$0@@%317%275$1@@$2@@@%317%275$1@@%317%278$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%181%318%278$0@@%273$1@@@%318%273$1@@%278$0@@@|@|@@%142%89%148%87%146%75%179%317%278$0@@%317%273$1@@$2@@@%317%273$1@@%317%278$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%181%318%278$0@@%265$1@@@%318%265$1@@%278$0@@@|@|@@%142%89%148%87%146%75%179%317%278$0@@%317%265$1@@$2@@@%317%265$1@@%317%278$0@@$2@@@|@|@|@@@%169%169%148%87%146%75%181%318%278$0@@%269$1@@@%318%269$1@@%278$0@@@|@|@@%142%89%148%87%146%75%179%317%278$0@@%317%269$1@@$2@@@%317%269$1@@%317%278$0@@$2@@@|@|@|@@@%169%143%85%146%75%181%318%278$0@@%267$1@@@%318%267$1@@%278$0@@@|@|@@%142%89%143%85%146%75%179%317%278$0@@%317%267$1@@$2@@@%317%267$1@@%317%278$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_interpreted_section_component_equality x = x
    val op elf64_interpreted_section_component_equality =
    DT(((("elf_interpreted_section",87),
        [("bool",[25,26,50,55,62,180]),
         ("elf_interpreted_section",[51,52,53,68]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%139%39%139%41%174%177$1@$0@@%169%183%276$1@@%276$0@@@%169%183%284$1@@%284$0@@@%169%183%270$1@@%270$0@@@%169%183%262$1@@%262$0@@@%169%183%280$1@@%280$0@@@%169%183%282$1@@%282$0@@@%169%183%274$1@@%274$0@@@%169%183%272$1@@%272$0@@@%169%183%264$1@@%264$0@@@%169%183%268$1@@%268$0@@@%169%175%266$1@@%266$0@@@%182%277$1@@%277$0@@@@@@@@@@@@@@|@|@"])
  fun op elf64_interpreted_section_updates_eq_literal x = x
    val op elf64_interpreted_section_updates_eq_literal =
    DT(((("elf_interpreted_section",88),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_interpreted_section",[51,52,53,81])]),["DISK_THM"]),
       [read"%139%37%153%119%153%116%153%113%153%110%153%107%153%104%153%101%153%98%153%95%153%94%137%33%150%91%177%279%217$11@@%285%217$10@@%271%217$9@@%263%217$8@@%281%217$7@@%283%217$6@@%275%217$5@@%273%217$4@@%265%217$3@@%269%217$2@@%267%213$1@@%278%216$0@@$12@@@@@@@@@@@@@%279%217$11@@%285%217$10@@%271%217$9@@%263%217$8@@%281%217$7@@%283%217$6@@%275%217$5@@%273%217$4@@%265%217$3@@%269%217$2@@%267%213$1@@%278%216$0@@%198@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_literal_nchotomy x = x
    val op elf64_interpreted_section_literal_nchotomy =
    DT(((("elf_interpreted_section",89),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_interpreted_section",[51,52,53,81]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%139%37%195%119%195%116%195%113%195%110%195%107%195%104%195%101%195%98%195%95%195%94%187%33%194%91%177$12@%279%217$11@@%285%217$10@@%271%217$9@@%263%217$8@@%281%217$7@@%283%217$6@@%275%217$5@@%273%217$4@@%265%217$3@@%269%217$2@@%267%213$1@@%278%216$0@@%198@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf64_interpreted_section x = x
    val op FORALL_elf64_interpreted_section =
    DT(((("elf_interpreted_section",90),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_interpreted_section",[51,52,53,81]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%145%7%174%139%37$1$0@|@@%153%119%153%116%153%113%153%110%153%107%153%104%153%101%153%98%153%95%153%94%137%33%150%91$12%279%217$11@@%285%217$10@@%271%217$9@@%263%217$8@@%281%217$7@@%283%217$6@@%275%217$5@@%273%217$4@@%265%217$3@@%269%217$2@@%267%213$1@@%278%216$0@@%198@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf64_interpreted_section x = x
    val op EXISTS_elf64_interpreted_section =
    DT(((("elf_interpreted_section",91),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_interpreted_section",[51,52,53,81]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%145%7%174%189%37$1$0@|@@%195%119%195%116%195%113%195%110%195%107%195%104%195%101%195%98%195%95%195%94%187%33%194%91$12%279%217$11@@%285%217$10@@%271%217$9@@%263%217$8@@%281%217$7@@%283%217$6@@%275%217$5@@%273%217$4@@%265%217$3@@%269%217$2@@%267%213$1@@%278%216$0@@%198@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op elf64_interpreted_section_literal_11 x = x
    val op elf64_interpreted_section_literal_11 =
    DT(((("elf_interpreted_section",92),
        [("combin",[12]),
         ("elf_interpreted_section",[82,87])]),["DISK_THM"]),
       [read"%153%120%153%117%153%114%153%111%153%108%153%105%153%102%153%99%153%96%153%98%137%34%150%92%153%121%153%118%153%115%153%112%153%109%153%106%153%103%153%100%153%97%153%101%137%35%150%93%174%177%279%217$23@@%285%217$22@@%271%217$21@@%263%217$20@@%281%217$19@@%283%217$18@@%275%217$17@@%273%217$16@@%265%217$15@@%269%217$14@@%267%213$13@@%278%216$12@@%198@@@@@@@@@@@@@%279%217$11@@%285%217$10@@%271%217$9@@%263%217$8@@%281%217$7@@%283%217$6@@%275%217$5@@%273%217$4@@%265%217$3@@%269%217$2@@%267%213$1@@%278%216$0@@%198@@@@@@@@@@@@@@%169%183$23@$11@@%169%183$22@$10@@%169%183$21@$9@@%169%183$20@$8@@%169%183$19@$7@@%169%183$18@$6@@%169%183$17@$5@@%169%183$16@$4@@%169%183$15@$3@@%169%183$14@$2@@%169%175$13@$1@@%182$12@$0@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf64_interpreted_section x = x
    val op datatype_elf64_interpreted_section =
    DT(((("elf_interpreted_section",93),[("bool",[25,170])]),["DISK_THM"]),
       [read"%203%123%57@%65@%69@%62@%58@%67@%68@%64@%63@%59@%61@%60@%66@@"])
  fun op elf64_interpreted_section_11 x = x
    val op elf64_interpreted_section_11 =
    DT(((("elf_interpreted_section",94),
        [("bool",[26,50,55,62,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%153%8%153%11%153%17%153%19%153%21%153%23%153%25%153%27%153%29%153%31%137%13%150%15%153%9%153%12%153%18%153%20%153%22%153%24%153%26%153%28%153%30%153%32%137%14%150%16%174%177%325$23@$22@$21@$20@$19@$18@$17@$16@$15@$14@$13@$12@@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%169%183$23@$11@@%169%183$22@$10@@%169%183$21@$9@@%169%183$20@$8@@%169%183$19@$7@@%169%183$18@$6@@%169%183$17@$5@@%169%183$16@$4@@%169%183$15@$3@@%169%183$14@$2@@%169%175$13@$1@@%182$12@$0@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_case_cong x = x
    val op elf64_interpreted_section_case_cong =
    DT(((("elf_interpreted_section",95),
        [("bool",[26,180]),
         ("elf_interpreted_section",[51,52,53,54])]),["DISK_THM"]),
       [read"%139%3%139%5%147%76%186%169%177$2@$1@@%153%8%153%11%153%17%153%19%153%21%153%23%153%25%153%27%153%29%153%31%137%13%150%15%186%177$13@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%172$12$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%79$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@|@|@|@|@@@%172%261$2@$0@@%261$1@%79@@@|@|@|@"])
  fun op elf64_interpreted_section_nchotomy x = x
    val op elf64_interpreted_section_nchotomy =
    DT(((("elf_interpreted_section",96),
        [("bool",[26,180]),
         ("elf_interpreted_section",[51,52,53])]),["DISK_THM"]),
       [read"%139%43%195%94%195%95%195%98%195%101%195%104%195%107%195%110%195%113%195%116%195%119%187%33%194%126%177$12@%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_Axiom x = x
    val op elf64_interpreted_section_Axiom =
    DT(((("elf_interpreted_section",97),
        [("bool",[26,180]),("elf_interpreted_section",[51,52,53]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%147%76%192%84%153%8%153%11%153%17%153%19%153%21%153%23%153%25%153%27%153%29%153%31%137%13%150%15%172$12%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$13$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_interpreted_section_induction x = x
    val op elf64_interpreted_section_induction =
    DT(((("elf_interpreted_section",98),
        [("bool",[26]),
         ("elf_interpreted_section",[51,52,53])]),["DISK_THM"]),
       [read"%145%7%186%153%94%153%95%153%98%153%101%153%104%153%107%153%110%153%113%153%116%153%119%137%33%150%126$12%325$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@@%139%37$1$0@|@@|@"])
  end
  val _ = DB.bindl "elf_interpreted_section"
  [("elf32_interpreted_section_TY_DEF",
    elf32_interpreted_section_TY_DEF,
    DB.Def),
   ("elf32_interpreted_section_case_def",
    elf32_interpreted_section_case_def,
    DB.Def),
   ("elf32_interpreted_section_size_def",
    elf32_interpreted_section_size_def,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_name",
    elf32_interpreted_section_elf32_section_name,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_type",
    elf32_interpreted_section_elf32_section_type,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_flags",
    elf32_interpreted_section_elf32_section_flags,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_addr",
    elf32_interpreted_section_elf32_section_addr,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_offset",
    elf32_interpreted_section_elf32_section_offset,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_size",
    elf32_interpreted_section_elf32_section_size,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_link",
    elf32_interpreted_section_elf32_section_link,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_info",
    elf32_interpreted_section_elf32_section_info,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_align",
    elf32_interpreted_section_elf32_section_align,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_entsize",
    elf32_interpreted_section_elf32_section_entsize,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_body",
    elf32_interpreted_section_elf32_section_body,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_name_as_string",
    elf32_interpreted_section_elf32_section_name_as_string,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_name_fupd",
    elf32_interpreted_section_elf32_section_name_fupd,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_type_fupd",
    elf32_interpreted_section_elf32_section_type_fupd,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_flags_fupd",
    elf32_interpreted_section_elf32_section_flags_fupd,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_addr_fupd",
    elf32_interpreted_section_elf32_section_addr_fupd,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_offset_fupd",
    elf32_interpreted_section_elf32_section_offset_fupd,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_size_fupd",
    elf32_interpreted_section_elf32_section_size_fupd,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_link_fupd",
    elf32_interpreted_section_elf32_section_link_fupd,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_info_fupd",
    elf32_interpreted_section_elf32_section_info_fupd,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_align_fupd",
    elf32_interpreted_section_elf32_section_align_fupd,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_entsize_fupd",
    elf32_interpreted_section_elf32_section_entsize_fupd,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_body_fupd",
    elf32_interpreted_section_elf32_section_body_fupd,
    DB.Def),
   ("elf32_interpreted_section_elf32_section_name_as_string_fupd",
    elf32_interpreted_section_elf32_section_name_as_string_fupd,
    DB.Def),
   ("elf32_interpreted_section_equal_def",
    elf32_interpreted_section_equal_def,
    DB.Def),
   ("elf64_interpreted_section_TY_DEF",
    elf64_interpreted_section_TY_DEF,
    DB.Def),
   ("elf64_interpreted_section_case_def",
    elf64_interpreted_section_case_def,
    DB.Def),
   ("elf64_interpreted_section_size_def",
    elf64_interpreted_section_size_def,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_name",
    elf64_interpreted_section_elf64_section_name,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_type",
    elf64_interpreted_section_elf64_section_type,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_flags",
    elf64_interpreted_section_elf64_section_flags,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_addr",
    elf64_interpreted_section_elf64_section_addr,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_offset",
    elf64_interpreted_section_elf64_section_offset,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_size",
    elf64_interpreted_section_elf64_section_size,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_link",
    elf64_interpreted_section_elf64_section_link,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_info",
    elf64_interpreted_section_elf64_section_info,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_align",
    elf64_interpreted_section_elf64_section_align,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_entsize",
    elf64_interpreted_section_elf64_section_entsize,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_body",
    elf64_interpreted_section_elf64_section_body,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_name_as_string",
    elf64_interpreted_section_elf64_section_name_as_string,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_name_fupd",
    elf64_interpreted_section_elf64_section_name_fupd,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_type_fupd",
    elf64_interpreted_section_elf64_section_type_fupd,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_flags_fupd",
    elf64_interpreted_section_elf64_section_flags_fupd,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_addr_fupd",
    elf64_interpreted_section_elf64_section_addr_fupd,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_offset_fupd",
    elf64_interpreted_section_elf64_section_offset_fupd,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_size_fupd",
    elf64_interpreted_section_elf64_section_size_fupd,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_link_fupd",
    elf64_interpreted_section_elf64_section_link_fupd,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_info_fupd",
    elf64_interpreted_section_elf64_section_info_fupd,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_align_fupd",
    elf64_interpreted_section_elf64_section_align_fupd,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_entsize_fupd",
    elf64_interpreted_section_elf64_section_entsize_fupd,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_body_fupd",
    elf64_interpreted_section_elf64_section_body_fupd,
    DB.Def),
   ("elf64_interpreted_section_elf64_section_name_as_string_fupd",
    elf64_interpreted_section_elf64_section_name_as_string_fupd,
    DB.Def),
   ("compare_elf64_interpreted_section_def",
    compare_elf64_interpreted_section_def,
    DB.Def),
   ("instance_Basic_classes_Ord_Elf_interpreted_section_elf64_interpreted_section_dict_def",
    instance_Basic_classes_Ord_Elf_interpreted_section_elf64_interpreted_section_dict_def,
    DB.Def),
   ("elf64_interpreted_section_equal_def",
    elf64_interpreted_section_equal_def,
    DB.Def),
   ("null_elf32_interpreted_section_def",
    null_elf32_interpreted_section_def,
    DB.Def),
   ("null_elf64_interpreted_section_def",
    null_elf64_interpreted_section_def,
    DB.Def),
   ("elf64_interpreted_section_matches_section_header_def",
    elf64_interpreted_section_matches_section_header_def,
    DB.Def),
   ("is_valid_elf32_section_header_table_entry_def",
    is_valid_elf32_section_header_table_entry_def,
    DB.Def),
   ("is_valid_elf64_section_header_table_entry_def",
    is_valid_elf64_section_header_table_entry_def,
    DB.Def),
   ("is_valid_elf32_section_header_table0_def",
    is_valid_elf32_section_header_table0_def,
    DB.Def),
   ("is_valid_elf64_section_header_table0_def",
    is_valid_elf64_section_header_table0_def,
    DB.Def),
   ("elf32_interpreted_section_accessors",
    elf32_interpreted_section_accessors,
    DB.Thm),
   ("elf32_interpreted_section_fn_updates",
    elf32_interpreted_section_fn_updates,
    DB.Thm),
   ("elf32_interpreted_section_accfupds",
    elf32_interpreted_section_accfupds,
    DB.Thm),
   ("elf32_interpreted_section_fupdfupds",
    elf32_interpreted_section_fupdfupds,
    DB.Thm),
   ("elf32_interpreted_section_fupdfupds_comp",
    elf32_interpreted_section_fupdfupds_comp,
    DB.Thm),
   ("elf32_interpreted_section_fupdcanon",
    elf32_interpreted_section_fupdcanon,
    DB.Thm),
   ("elf32_interpreted_section_fupdcanon_comp",
    elf32_interpreted_section_fupdcanon_comp,
    DB.Thm),
   ("elf32_interpreted_section_component_equality",
    elf32_interpreted_section_component_equality,
    DB.Thm),
   ("elf32_interpreted_section_updates_eq_literal",
    elf32_interpreted_section_updates_eq_literal,
    DB.Thm),
   ("elf32_interpreted_section_literal_nchotomy",
    elf32_interpreted_section_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf32_interpreted_section",
    FORALL_elf32_interpreted_section,
    DB.Thm),
   ("EXISTS_elf32_interpreted_section",
    EXISTS_elf32_interpreted_section,
    DB.Thm),
   ("elf32_interpreted_section_literal_11",
    elf32_interpreted_section_literal_11,
    DB.Thm),
   ("datatype_elf32_interpreted_section",
    datatype_elf32_interpreted_section,
    DB.Thm),
   ("elf32_interpreted_section_11",elf32_interpreted_section_11,DB.Thm),
   ("elf32_interpreted_section_case_cong",
    elf32_interpreted_section_case_cong,
    DB.Thm),
   ("elf32_interpreted_section_nchotomy",
    elf32_interpreted_section_nchotomy,
    DB.Thm),
   ("elf32_interpreted_section_Axiom",
    elf32_interpreted_section_Axiom,
    DB.Thm),
   ("elf32_interpreted_section_induction",
    elf32_interpreted_section_induction,
    DB.Thm),
   ("elf64_interpreted_section_accessors",
    elf64_interpreted_section_accessors,
    DB.Thm),
   ("elf64_interpreted_section_fn_updates",
    elf64_interpreted_section_fn_updates,
    DB.Thm),
   ("elf64_interpreted_section_accfupds",
    elf64_interpreted_section_accfupds,
    DB.Thm),
   ("elf64_interpreted_section_fupdfupds",
    elf64_interpreted_section_fupdfupds,
    DB.Thm),
   ("elf64_interpreted_section_fupdfupds_comp",
    elf64_interpreted_section_fupdfupds_comp,
    DB.Thm),
   ("elf64_interpreted_section_fupdcanon",
    elf64_interpreted_section_fupdcanon,
    DB.Thm),
   ("elf64_interpreted_section_fupdcanon_comp",
    elf64_interpreted_section_fupdcanon_comp,
    DB.Thm),
   ("elf64_interpreted_section_component_equality",
    elf64_interpreted_section_component_equality,
    DB.Thm),
   ("elf64_interpreted_section_updates_eq_literal",
    elf64_interpreted_section_updates_eq_literal,
    DB.Thm),
   ("elf64_interpreted_section_literal_nchotomy",
    elf64_interpreted_section_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf64_interpreted_section",
    FORALL_elf64_interpreted_section,
    DB.Thm),
   ("EXISTS_elf64_interpreted_section",
    EXISTS_elf64_interpreted_section,
    DB.Thm),
   ("elf64_interpreted_section_literal_11",
    elf64_interpreted_section_literal_11,
    DB.Thm),
   ("datatype_elf64_interpreted_section",
    datatype_elf64_interpreted_section,
    DB.Thm),
   ("elf64_interpreted_section_11",elf64_interpreted_section_11,DB.Thm),
   ("elf64_interpreted_section_case_cong",
    elf64_interpreted_section_case_cong,
    DB.Thm),
   ("elf64_interpreted_section_nchotomy",
    elf64_interpreted_section_nchotomy,
    DB.Thm),
   ("elf64_interpreted_section_Axiom",
    elf64_interpreted_section_Axiom,
    DB.Thm),
   ("elf64_interpreted_section_induction",
    elf64_interpreted_section_induction,
    DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("elf_section_header_tableTheory.elf_section_header_table_grammars",
                          elf_section_header_tableTheory.elf_section_header_table_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms temp_add_type "elf32_interpreted_section"
  val _ = update_grms temp_add_type "elf32_interpreted_section"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_interpreted_section", (Term.prim_mk_const { Name = "recordtype.elf32_interpreted_section", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_interpreted_section", (Term.prim_mk_const { Name = "recordtype.elf32_interpreted_section", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_CASE", (Term.prim_mk_const { Name = "elf32_interpreted_section_CASE", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_size", (Term.prim_mk_const { Name = "elf32_interpreted_section_size", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_name", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_name", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_type", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_type", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_flags", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_flags", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_addr", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_addr", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_offset", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_offset", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_size", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_size", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_link", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_link", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_info", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_info", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_align", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_align", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_entsize", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_entsize", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_body", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_body", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_name_as_string", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_name_as_string", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_name_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_name_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_type_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_type_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_flags_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_flags_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_addr_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_addr_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_offset_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_offset_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_size_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_size_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_link_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_link_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_info_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_info_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_align_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_align_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_entsize_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_entsize_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_body_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_body_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_elf32_section_name_as_string_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_name_as_string_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_section_name", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_name rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_section_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_type rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_section_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_flags rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_section_addr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_addr rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_section_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_offset rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_section_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_size rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_section_link", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_link rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_section_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_info rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_section_align", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_align rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_section_entsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_entsize rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_section_body", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_body rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_section_name_as_string", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_name_as_string rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_name_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_name_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_type_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_type_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_flags_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_flags_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_addr_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_addr_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_offset_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_offset_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_size_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_size_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_link_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_link_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_info_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_info_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_align_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_align_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_entsize_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_entsize_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_body_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_body_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_section_name_as_string_fupd", (Term.prim_mk_const { Name = "elf32_interpreted_section_elf32_section_name_as_string_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_section_name", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_name_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_section_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_type_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_section_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_flags_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_section_addr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_addr_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_section_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_offset_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_section_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_size_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_section_link", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_link_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_section_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_info_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_section_align", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_align_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_section_entsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_entsize_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_section_body", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(byte_sequence$byte_sequence) -> (byte_sequence$byte_sequence)) (x :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_body_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_section_name_as_string", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :((string$char) list$list) -> ((string$char) list$list)) (x :(elf_interpreted_section$elf32_interpreted_section)). elf_interpreted_section$elf32_interpreted_section_elf32_section_name_as_string_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section", (Term.prim_mk_const { Name = "recordtype.elf32_interpreted_section", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_equal", (Term.prim_mk_const { Name = "elf32_interpreted_section_equal", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_interpreted_section_equal", (Term.prim_mk_const { Name = "elf32_interpreted_section_equal", Thy = "elf_interpreted_section"}))
  val _ = update_grms temp_add_type "elf64_interpreted_section"
  val _ = update_grms temp_add_type "elf64_interpreted_section"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_interpreted_section", (Term.prim_mk_const { Name = "recordtype.elf64_interpreted_section", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_interpreted_section", (Term.prim_mk_const { Name = "recordtype.elf64_interpreted_section", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_CASE", (Term.prim_mk_const { Name = "elf64_interpreted_section_CASE", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_size", (Term.prim_mk_const { Name = "elf64_interpreted_section_size", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_name", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_name", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_type", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_type", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_flags", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_flags", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_addr", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_addr", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_offset", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_offset", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_size", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_size", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_link", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_link", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_info", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_info", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_align", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_align", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_entsize", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_entsize", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_body", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_body", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_name_as_string", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_name_as_string", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_name_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_name_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_type_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_type_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_flags_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_flags_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_addr_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_addr_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_offset_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_offset_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_size_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_size_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_link_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_link_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_info_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_info_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_align_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_align_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_entsize_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_entsize_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_body_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_body_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_elf64_section_name_as_string_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_name_as_string_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_section_name", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_name rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_section_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_type rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_section_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_flags rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_section_addr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_addr rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_section_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_offset rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_section_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_size rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_section_link", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_link rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_section_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_info rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_section_align", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_align rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_section_entsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_entsize rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_section_body", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_body rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_section_name_as_string", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_name_as_string rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_name_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_name_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_type_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_type_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_flags_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_flags_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_addr_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_addr_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_offset_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_offset_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_size_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_size_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_link_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_link_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_info_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_info_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_align_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_align_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_entsize_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_entsize_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_body_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_body_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_section_name_as_string_fupd", (Term.prim_mk_const { Name = "elf64_interpreted_section_elf64_section_name_as_string_fupd", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_section_name", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_name_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_section_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_type_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_section_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_flags_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_section_addr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_addr_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_section_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_offset_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_section_size", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_size_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_section_link", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_link_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_section_info", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_info_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_section_align", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_align_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_section_entsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(num$num) -> (num$num)) (x :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_entsize_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_section_body", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(byte_sequence$byte_sequence) -> (byte_sequence$byte_sequence)) (x :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_body_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_section_name_as_string", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :((string$char) list$list) -> ((string$char) list$list)) (x :(elf_interpreted_section$elf64_interpreted_section)). elf_interpreted_section$elf64_interpreted_section_elf64_section_name_as_string_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section", (Term.prim_mk_const { Name = "recordtype.elf64_interpreted_section", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf64_interpreted_section", (Term.prim_mk_const { Name = "compare_elf64_interpreted_section", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf64_interpreted_section", (Term.prim_mk_const { Name = "compare_elf64_interpreted_section", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_interpreted_section_elf64_interpreted_section_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_interpreted_section_elf64_interpreted_section_dict", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_interpreted_section_elf64_interpreted_section_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_interpreted_section_elf64_interpreted_section_dict", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_equal", (Term.prim_mk_const { Name = "elf64_interpreted_section_equal", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_equal", (Term.prim_mk_const { Name = "elf64_interpreted_section_equal", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("null_elf32_interpreted_section", (Term.prim_mk_const { Name = "null_elf32_interpreted_section", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("null_elf32_interpreted_section", (Term.prim_mk_const { Name = "null_elf32_interpreted_section", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("null_elf64_interpreted_section", (Term.prim_mk_const { Name = "null_elf64_interpreted_section", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("null_elf64_interpreted_section", (Term.prim_mk_const { Name = "null_elf64_interpreted_section", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_matches_section_header", (Term.prim_mk_const { Name = "elf64_interpreted_section_matches_section_header", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_interpreted_section_matches_section_header", (Term.prim_mk_const { Name = "elf64_interpreted_section_matches_section_header", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_interpreted_section",Name="elf32_interpreted_sections"}, T"list" "list"
 [T"elf32_interpreted_section" "elf_interpreted_section" []])
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_interpreted_section",Name="elf64_interpreted_sections"}, T"list" "list"
 [T"elf64_interpreted_section" "elf_interpreted_section" []])
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf32_section_header_table_entry", (Term.prim_mk_const { Name = "is_valid_elf32_section_header_table_entry", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf32_section_header_table_entry", (Term.prim_mk_const { Name = "is_valid_elf32_section_header_table_entry", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf64_section_header_table_entry", (Term.prim_mk_const { Name = "is_valid_elf64_section_header_table_entry", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf64_section_header_table_entry", (Term.prim_mk_const { Name = "is_valid_elf64_section_header_table_entry", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf32_section_header_table0", (Term.prim_mk_const { Name = "is_valid_elf32_section_header_table0", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf32_section_header_table0", (Term.prim_mk_const { Name = "is_valid_elf32_section_header_table0", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf64_section_header_table0", (Term.prim_mk_const { Name = "is_valid_elf64_section_header_table0", Thy = "elf_interpreted_section"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf64_section_header_table0", (Term.prim_mk_const { Name = "is_valid_elf64_section_header_table0", Thy = "elf_interpreted_section"}))
  val elf_interpreted_section_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG elf32_interpreted_section_Axiom,
           case_def=elf32_interpreted_section_case_def,
           case_cong=elf32_interpreted_section_case_cong,
           induction=ORIG elf32_interpreted_section_induction,
           nchotomy=elf32_interpreted_section_nchotomy,
           size=SOME(Parse.Term`(elf_interpreted_section$elf32_interpreted_section_size) :(elf_interpreted_section$elf32_interpreted_section) -> (num$num)`,
                     ORIG elf32_interpreted_section_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf32_interpreted_section_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf32_section_name",T"num" "num" []),
 ("elf32_section_type",T"num" "num" []),
 ("elf32_section_flags",T"num" "num" []),
 ("elf32_section_addr",T"num" "num" []),
 ("elf32_section_offset",T"num" "num" []),
 ("elf32_section_size",T"num" "num" []),
 ("elf32_section_link",T"num" "num" []),
 ("elf32_section_info",T"num" "num" []),
 ("elf32_section_align",T"num" "num" []),
 ("elf32_section_entsize",T"num" "num" []),
 ("elf32_section_body",T"byte_sequence" "byte_sequence" []),
 ("elf32_section_name_as_string",T"list" "list"
                                  [T"string" "char"
                                    []])] end,
           accessors=Drule.CONJUNCTS elf32_interpreted_section_accessors,
           updates=Drule.CONJUNCTS elf32_interpreted_section_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf32_interpreted_section_accessors, elf32_interpreted_section_updates_eq_literal, elf32_interpreted_section_accfupds, elf32_interpreted_section_fupdfupds, elf32_interpreted_section_literal_11, elf32_interpreted_section_fupdfupds_comp, elf32_interpreted_section_fupdcanon, elf32_interpreted_section_fupdcanon_comp] tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG elf64_interpreted_section_Axiom,
           case_def=elf64_interpreted_section_case_def,
           case_cong=elf64_interpreted_section_case_cong,
           induction=ORIG elf64_interpreted_section_induction,
           nchotomy=elf64_interpreted_section_nchotomy,
           size=SOME(Parse.Term`(elf_interpreted_section$elf64_interpreted_section_size) :(elf_interpreted_section$elf64_interpreted_section) -> (num$num)`,
                     ORIG elf64_interpreted_section_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf64_interpreted_section_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf64_section_name",T"num" "num" []),
 ("elf64_section_type",T"num" "num" []),
 ("elf64_section_flags",T"num" "num" []),
 ("elf64_section_addr",T"num" "num" []),
 ("elf64_section_offset",T"num" "num" []),
 ("elf64_section_size",T"num" "num" []),
 ("elf64_section_link",T"num" "num" []),
 ("elf64_section_info",T"num" "num" []),
 ("elf64_section_align",T"num" "num" []),
 ("elf64_section_entsize",T"num" "num" []),
 ("elf64_section_body",T"byte_sequence" "byte_sequence" []),
 ("elf64_section_name_as_string",T"list" "list"
                                  [T"string" "char"
                                    []])] end,
           accessors=Drule.CONJUNCTS elf64_interpreted_section_accessors,
           updates=Drule.CONJUNCTS elf64_interpreted_section_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf64_interpreted_section_accessors, elf64_interpreted_section_updates_eq_literal, elf64_interpreted_section_accfupds, elf64_interpreted_section_fupdfupds, elf64_interpreted_section_literal_11, elf64_interpreted_section_fupdfupds_comp, elf64_interpreted_section_fupdcanon, elf64_interpreted_section_fupdcanon_comp] tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "elf_interpreted_section",
    thydataty = "compute",
    data =
        "elf_interpreted_section.elf32_interpreted_section_equal_def elf_interpreted_section.is_valid_elf64_section_header_table0_def elf_interpreted_section.is_valid_elf32_section_header_table0_def elf_interpreted_section.is_valid_elf32_section_header_table_entry_def elf_interpreted_section.is_valid_elf64_section_header_table_entry_def elf_interpreted_section.null_elf32_interpreted_section_def elf_interpreted_section.elf64_interpreted_section_matches_section_header_def elf_interpreted_section.null_elf64_interpreted_section_def elf_interpreted_section.elf64_interpreted_section_equal_def elf_interpreted_section.instance_Basic_classes_Ord_Elf_interpreted_section_elf64_interpreted_section_dict_def elf_interpreted_section.compare_elf64_interpreted_section_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "elf_interpreted_section"
end
