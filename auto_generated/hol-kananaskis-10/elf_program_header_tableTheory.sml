structure elf_program_header_tableTheory :> elf_program_header_tableTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading elf_program_header_tableTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open elf_types_native_uintTheory lem_setTheory
  in end;
  val _ = Theory.link_parents
          ("elf_program_header_table",
          Arbnum.fromString "1445438804",
          Arbnum.fromString "927331")
          [("lem_set",
           Arbnum.fromString "1445005525",
           Arbnum.fromString "352564"),
           ("elf_types_native_uint",
           Arbnum.fromString "1445438741",
           Arbnum.fromString "175496")];
  val _ = Theory.incorporate_types "elf_program_header_table"
       [("elf64_program_header_table_entry", 0),
        ("elf32_program_header_table_entry", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("list", "list"), ID("string", "char"),
   ID("num", "num"),
   ID("elf_program_header_table", "elf64_program_header_table_entry"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
   ID("min", "bool"),
   ID("elf_program_header_table", "elf32_program_header_table_entry"),
   ID("error", "error"), ID("pair", "prod"),
   ID("byte_sequence", "byte_sequence"), ID("endianness", "endianness"),
   ID("lem_basic_classes", "Ord_class"),
   ID("lem_basic_classes", "ordering"), ID("ind_type", "recspace"),
   ID("min", "ind"), ID("bool", "!"), ID("arithmetic", "*"),
   ID("arithmetic", "+"), ID("pair", ","), ID("arithmetic", "-"),
   ID("bool", "/\\"), ID("num", "0"), ID("prim_rec", "<"), ID("min", "="),
   ID("min", "==>"), ID("bool", "?"), ID("min", "@"), ID("bool", "ARB"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("pred_set", "EMPTY"), ID("lem_basic_classes", "EQ"),
   ID("list", "EXISTS"), ID("lem_basic_classes", "GT"), ID("combin", "I"),
   ID("bool", "IN"), ID("pred_set", "INSERT"), ID("combin", "K"),
   ID("bool", "LET"), ID("lem_basic_classes", "LT"), ID("list", "MAP"),
   ID("list", "NIL"), ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("bool", "TYPE_DEFINITION"), ID("pair", "UNCURRY"),
   ID("relation", "WF"), ID("relation", "WFREC"), ID("arithmetic", "ZERO"),
   ID("elf_program_header_table", "allowable_permissions_of_permission"),
   ID("elf_types_native_uint", "bytes_of_elf32_addr"),
   ID("elf_types_native_uint", "bytes_of_elf32_off"),
   ID("elf_program_header_table", "bytes_of_elf32_program_header_table"),
   ID("elf_program_header_table", "bytes_of_elf32_program_header_table_entry"),
   ID("elf_types_native_uint", "bytes_of_elf32_word"),
   ID("elf_types_native_uint", "bytes_of_elf64_addr"),
   ID("elf_types_native_uint", "bytes_of_elf64_off"),
   ID("elf_program_header_table", "bytes_of_elf64_program_header_table"),
   ID("elf_program_header_table", "bytes_of_elf64_program_header_table_entry"),
   ID("elf_types_native_uint", "bytes_of_elf64_word"),
   ID("elf_types_native_uint", "bytes_of_elf64_xword"),
   ID("elf_program_header_table", "compare_elf32_program_header_table_entry"),
   ID("elf_program_header_table", "compare_elf64_program_header_table_entry"),
   ID("byte_sequence", "concat0"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_CASE"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_align"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_align_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_filesz"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_filesz_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_flags"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_flags_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_memsz"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_memsz_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_offset"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_offset_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_paddr"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_paddr_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_type"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_type_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_vaddr"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_elf32_p_vaddr_fupd"),
   ID("elf_program_header_table", "elf32_program_header_table_entry_size"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_CASE"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_align"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_align_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_filesz"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_filesz_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_flags"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_flags_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_memsz"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_memsz_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_offset"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_offset_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_paddr"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_paddr_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_type"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_type_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_vaddr"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_elf64_p_vaddr_fupd"),
   ID("elf_program_header_table", "elf64_program_header_table_entry_size"),
   ID("elf_program_header_table", "elf_pf_maskos"),
   ID("elf_program_header_table", "elf_pf_maskproc"),
   ID("elf_program_header_table", "elf_pf_r"),
   ID("elf_program_header_table", "elf_pf_w"),
   ID("elf_program_header_table", "elf_pf_x"),
   ID("elf_program_header_table", "elf_pt_dynamic"),
   ID("elf_program_header_table", "elf_pt_hios"),
   ID("elf_program_header_table", "elf_pt_hiproc"),
   ID("elf_program_header_table", "elf_pt_interp"),
   ID("elf_program_header_table", "elf_pt_load"),
   ID("elf_program_header_table", "elf_pt_loos"),
   ID("elf_program_header_table", "elf_pt_loproc"),
   ID("elf_program_header_table", "elf_pt_note"),
   ID("elf_program_header_table", "elf_pt_null"),
   ID("elf_program_header_table", "elf_pt_phdr"),
   ID("elf_program_header_table", "elf_pt_shlib"),
   ID("elf_program_header_table", "elf_pt_tls"), ID("error", "error_bind"),
   ID("elf_program_header_table", "exact_permissions_of_permission"),
   ID("error", "fail0"), ID("byte_sequence", "from_byte_lists"),
   ID("lem_basic_classes", "genericCompare"),
   ID("elf_program_header_table", "get_elf32_dynamic_linked"),
   ID("elf_program_header_table", "get_elf32_requested_interpreter"),
   ID("elf_program_header_table", "get_elf32_static_linked"),
   ID("elf_program_header_table", "get_elf64_dynamic_linked"),
   ID("elf_program_header_table", "get_elf64_requested_interpreter"),
   ID("elf_program_header_table", "get_elf64_static_linked"),
   ID("elf_program_header_table", "instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict"),
   ID("elf_program_header_table", "instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict"),
   ID("byte_sequence", "length0"), ID("lem_list", "lexicographic_compare"),
   ID("combin", "o"), ID("byte_sequence", "offset_and_cut"),
   ID("pair", "pair_CASE"), ID("byte_sequence", "partition0"),
   ID("elf_types_native_uint", "read_elf32_addr"),
   ID("elf_types_native_uint", "read_elf32_off"),
   ID("elf_program_header_table", "read_elf32_program_header_table"),
   ID("elf_program_header_table", "read_elf32_program_header_table'"),
   ID("elf_program_header_table", "read_elf32_program_header_table'_tupled"),
   ID("elf_program_header_table", "read_elf32_program_header_table_entry"),
   ID("elf_types_native_uint", "read_elf32_word"),
   ID("elf_types_native_uint", "read_elf64_addr"),
   ID("elf_types_native_uint", "read_elf64_off"),
   ID("elf_program_header_table", "read_elf64_program_header_table"),
   ID("elf_program_header_table", "read_elf64_program_header_table'"),
   ID("elf_program_header_table", "read_elf64_program_header_table'_tupled"),
   ID("elf_program_header_table", "read_elf64_program_header_table_entry"),
   ID("elf_types_native_uint", "read_elf64_word"),
   ID("elf_types_native_uint", "read_elf64_xword"),
   ID("elf_program_header_table", "recordtype.elf32_program_header_table_entry"),
   ID("elf_program_header_table", "recordtype.elf64_program_header_table_entry"),
   ID("error", "return"), ID("byte_sequence", "string_of_byte_sequence"),
   ID("elf_program_header_table", "string_of_elf_segment_permissions"),
   ID("words", "w2n"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [2], TYOP [1, 0], TYOP [3], TYOP [0, 2, 1], TYOP [4], TYOP [7],
   TYOP [6, 5], TYOP [6, 6], TYOP [6, 7], TYOP [6, 8], TYOP [6, 9],
   TYOP [6, 10], TYOP [8], TYOP [5, 12, 11], TYOP [0, 13, 4],
   TYOP [0, 13, 14], TYOP [0, 13, 15], TYOP [0, 13, 16], TYOP [0, 13, 17],
   TYOP [0, 13, 18], TYOP [5, 12, 10], TYOP [0, 20, 19], TYOP [0, 20, 21],
   TYOP [9], TYOP [0, 20, 23], TYOP [0, 20, 24], TYOP [0, 20, 25],
   TYOP [0, 20, 26], TYOP [0, 20, 27], TYOP [0, 20, 28], TYOP [0, 20, 29],
   TYOP [0, 20, 30], TYOP [12], TYOP [11, 4, 32], TYOP [10, 33],
   TYOP [0, 32, 34], TYOP [13], TYOP [0, 36, 35], TYOP [1, 4],
   TYOP [10, 38], TYOP [11, 36, 32], TYOP [0, 40, 39], TYOP [0, 32, 39],
   TYOP [0, 36, 42], TYOP [11, 38, 32], TYOP [10, 44], TYOP [0, 32, 45],
   TYOP [0, 36, 46], TYOP [0, 2, 47], TYOP [11, 23, 32], TYOP [10, 49],
   TYOP [0, 32, 50], TYOP [0, 36, 51], TYOP [1, 23], TYOP [10, 53],
   TYOP [0, 40, 54], TYOP [0, 32, 54], TYOP [0, 36, 56], TYOP [11, 53, 32],
   TYOP [10, 58], TYOP [0, 32, 59], TYOP [0, 36, 60], TYOP [0, 2, 61],
   TYOP [14, 4], TYOP [14, 23], TYOP [0, 38, 12], TYOP [10, 1],
   TYOP [0, 32, 66], TYOP [0, 4, 67], TYOP [0, 53, 12], TYOP [0, 23, 67],
   TYOP [10, 2], TYOP [0, 2, 71], TYOP [0, 4, 2], TYOP [0, 4, 4],
   TYOP [0, 13, 13], TYOP [0, 75, 74], TYOP [0, 4, 13], TYOP [0, 20, 20],
   TYOP [0, 78, 74], TYOP [0, 4, 20], TYV "'a", TYOP [0, 13, 81],
   TYOP [0, 13, 82], TYOP [0, 13, 83], TYOP [0, 13, 84], TYOP [0, 13, 85],
   TYOP [0, 13, 86], TYOP [0, 20, 87], TYOP [0, 20, 88], TYOP [0, 89, 81],
   TYOP [0, 4, 90], TYOP [0, 23, 2], TYOP [0, 23, 23], TYOP [0, 78, 93],
   TYOP [0, 23, 20], TYOP [0, 20, 81], TYOP [0, 20, 96], TYOP [0, 20, 97],
   TYOP [0, 20, 98], TYOP [0, 20, 99], TYOP [0, 20, 100],
   TYOP [0, 20, 101], TYOP [0, 20, 102], TYOP [0, 103, 81],
   TYOP [0, 23, 104], TYOP [15], TYOP [0, 4, 106], TYOP [0, 4, 107],
   TYOP [0, 23, 106], TYOP [0, 23, 109], TYOP [0, 4, 32],
   TYOP [0, 36, 111], TYOP [0, 38, 32], TYOP [0, 36, 113],
   TYOP [0, 23, 32], TYOP [0, 36, 115], TYOP [0, 53, 32],
   TYOP [0, 36, 117], TYOP [11, 20, 20], TYOP [11, 20, 119],
   TYOP [11, 20, 120], TYOP [11, 20, 121], TYOP [11, 20, 122],
   TYOP [11, 20, 123], TYOP [11, 20, 124], TYOP [16, 125],
   TYOP [0, 126, 12], TYOP [11, 13, 13], TYOP [11, 13, 128],
   TYOP [11, 13, 129], TYOP [11, 13, 130], TYOP [11, 13, 131],
   TYOP [11, 20, 132], TYOP [11, 20, 133], TYOP [16, 134],
   TYOP [0, 135, 12], TYOP [0, 23, 12], TYOP [0, 4, 12], TYOP [0, 32, 12],
   TYOP [0, 36, 139], TYOP [0, 40, 12], TYOP [0, 40, 141], TYOP [17],
   TYOP [0, 23, 81], TYOP [0, 4, 81], TYOP [0, 81, 23], TYOP [0, 81, 4],
   TYOP [0, 13, 12], TYOP [0, 13, 148], TYOP [0, 13, 149],
   TYOP [0, 13, 150], TYOP [0, 13, 151], TYOP [0, 13, 152],
   TYOP [0, 20, 153], TYOP [0, 20, 154], TYOP [0, 143, 155],
   TYOP [0, 20, 12], TYOP [0, 20, 157], TYOP [0, 20, 158],
   TYOP [0, 20, 159], TYOP [0, 20, 160], TYOP [0, 20, 161],
   TYOP [0, 20, 162], TYOP [0, 20, 163], TYOP [0, 143, 164],
   TYOP [0, 23, 126], TYOP [0, 4, 135], TYOP [0, 139, 12],
   TYOP [0, 148, 12], TYOP [0, 157, 12], TYOP [0, 137, 12],
   TYOP [0, 138, 12], TYOP [0, 36, 12], TYOP [0, 173, 12],
   TYOP [0, 146, 12], TYOP [0, 175, 12], TYOP [0, 147, 12],
   TYOP [0, 177, 12], TYOP [0, 75, 12], TYOP [0, 179, 12],
   TYOP [0, 78, 12], TYOP [0, 181, 12], TYOP [0, 89, 12],
   TYOP [0, 183, 12], TYOP [0, 103, 12], TYOP [0, 185, 12],
   TYOP [0, 171, 12], TYOP [0, 172, 12], TYOP [0, 140, 12],
   TYOP [0, 189, 12], TYOP [0, 136, 12], TYOP [0, 191, 12],
   TYOP [0, 127, 12], TYOP [0, 193, 12], TYOP [0, 69, 12],
   TYOP [0, 65, 12], TYOP [0, 2, 12], TYOP [0, 197, 12], TYOP [0, 2, 2],
   TYOP [0, 2, 199], TYOP [0, 13, 128], TYOP [0, 13, 201],
   TYOP [0, 128, 129], TYOP [0, 13, 203], TYOP [0, 129, 130],
   TYOP [0, 13, 205], TYOP [0, 130, 131], TYOP [0, 13, 207],
   TYOP [0, 131, 132], TYOP [0, 13, 209], TYOP [0, 20, 119],
   TYOP [0, 20, 211], TYOP [0, 132, 133], TYOP [0, 20, 213],
   TYOP [0, 119, 120], TYOP [0, 20, 215], TYOP [0, 133, 134],
   TYOP [0, 20, 217], TYOP [0, 120, 121], TYOP [0, 20, 219],
   TYOP [0, 121, 122], TYOP [0, 20, 221], TYOP [0, 122, 123],
   TYOP [0, 20, 223], TYOP [0, 123, 124], TYOP [0, 20, 225],
   TYOP [0, 124, 125], TYOP [0, 20, 227], TYOP [0, 32, 49],
   TYOP [0, 23, 229], TYOP [0, 32, 33], TYOP [0, 4, 231], TYOP [0, 32, 40],
   TYOP [0, 36, 233], TYOP [0, 32, 58], TYOP [0, 53, 235],
   TYOP [0, 32, 44], TYOP [0, 38, 237], TYOP [0, 12, 12],
   TYOP [0, 12, 239], TYOP [0, 2, 197], TYOP [0, 81, 12],
   TYOP [0, 81, 242], TYOP [0, 64, 12], TYOP [0, 64, 244],
   TYOP [0, 63, 12], TYOP [0, 63, 246], TYOP [0, 32, 139],
   TYOP [0, 23, 137], TYOP [0, 4, 138], TYOP [0, 66, 12],
   TYOP [0, 66, 251], TYOP [0, 54, 12], TYOP [0, 54, 253],
   TYOP [0, 39, 12], TYOP [0, 39, 255], TYOP [0, 71, 12],
   TYOP [0, 71, 257], TYOP [0, 50, 12], TYOP [0, 50, 259],
   TYOP [0, 34, 12], TYOP [0, 34, 261], TYOP [0, 59, 12],
   TYOP [0, 59, 263], TYOP [0, 45, 12], TYOP [0, 45, 265],
   TYOP [0, 146, 175], TYOP [0, 147, 177], TYOP [0, 93, 12],
   TYOP [0, 93, 269], TYOP [0, 74, 12], TYOP [0, 74, 271],
   TYOP [0, 55, 12], TYOP [0, 55, 273], TYOP [0, 41, 12],
   TYOP [0, 41, 275], TYOP [0, 1, 12], TYOP [0, 1, 277], TYOP [0, 106, 12],
   TYOP [0, 106, 279], TYOP [0, 135, 136], TYOP [0, 126, 127],
   TYOP [0, 144, 12], TYOP [0, 283, 12], TYOP [0, 166, 12],
   TYOP [0, 285, 12], TYOP [0, 145, 12], TYOP [0, 287, 12],
   TYOP [0, 167, 12], TYOP [0, 289, 12], TYOP [0, 142, 12],
   TYOP [0, 291, 142], TYOP [0, 2, 0], TYOP [0, 66, 66], TYOP [0, 66, 294],
   TYOP [0, 12, 295], TYOP [0, 54, 54], TYOP [0, 54, 297],
   TYOP [0, 12, 298], TYOP [0, 39, 39], TYOP [0, 39, 300],
   TYOP [0, 12, 301], TYOP [0, 71, 71], TYOP [0, 71, 303],
   TYOP [0, 12, 304], TYOP [0, 1, 1], TYOP [0, 1, 306], TYOP [0, 12, 307],
   TYOP [0, 0, 306], TYOP [0, 53, 53], TYOP [0, 23, 310], TYOP [0, 38, 38],
   TYOP [0, 4, 312], TYOP [5, 12, 8], TYOP [1, 314], TYOP [1, 315],
   TYOP [0, 316, 316], TYOP [0, 315, 317], TYOP [1, 2], TYOP [0, 319, 319],
   TYOP [0, 2, 320], TYOP [0, 2, 135], TYOP [0, 322, 135],
   TYOP [0, 134, 323], TYOP [0, 2, 324], TYOP [0, 2, 126],
   TYOP [0, 326, 126], TYOP [0, 125, 327], TYOP [0, 2, 328],
   TYOP [0, 137, 69], TYOP [0, 138, 65], TYOP [0, 279, 12],
   TYOP [0, 106, 332], TYOP [0, 279, 279], TYOP [0, 106, 334],
   TYOP [0, 13, 75], TYOP [0, 20, 78], TYOP [0, 249, 249],
   TYOP [0, 249, 338], TYOP [0, 110, 110], TYOP [0, 110, 340],
   TYOP [0, 250, 250], TYOP [0, 250, 342], TYOP [0, 108, 108],
   TYOP [0, 108, 344], TYOP [0, 2, 66], TYOP [0, 346, 346], TYOP [1, 32],
   TYOP [0, 53, 348], TYOP [0, 115, 349], TYOP [0, 38, 348],
   TYOP [0, 111, 351], TYOP [0, 64, 64], TYOP [0, 340, 353],
   TYOP [0, 63, 63], TYOP [0, 344, 355], TYOP [0, 338, 353],
   TYOP [0, 342, 355], TYOP [0, 136, 289], TYOP [0, 127, 285],
   TYOP [11, 32, 32], TYOP [0, 361, 59], TYOP [0, 32, 60],
   TYOP [0, 363, 362], TYOP [0, 361, 45], TYOP [0, 32, 46],
   TYOP [0, 366, 365], TYOP [11, 13, 32], TYOP [0, 368, 34],
   TYOP [0, 13, 35], TYOP [0, 370, 369], TYOP [11, 20, 32],
   TYOP [0, 372, 50], TYOP [0, 20, 51], TYOP [0, 374, 373],
   TYOP [0, 372, 34], TYOP [0, 20, 35], TYOP [0, 377, 376],
   TYOP [0, 49, 54], TYOP [0, 23, 56], TYOP [0, 380, 379],
   TYOP [0, 33, 39], TYOP [0, 4, 42], TYOP [0, 383, 382], TYOP [0, 55, 55],
   TYOP [0, 385, 55], TYOP [0, 142, 386], TYOP [0, 41, 41],
   TYOP [0, 388, 41], TYOP [0, 142, 389], TYOP [0, 20, 315],
   TYOP [0, 36, 391], TYOP [0, 13, 315], TYOP [0, 36, 393],
   TYOP [0, 348, 32], TYOP [0, 67, 66], TYOP [10, 32], TYOP [0, 397, 396],
   TYOP [0, 53, 54], TYOP [0, 399, 54], TYOP [0, 54, 400],
   TYOP [0, 53, 59], TYOP [0, 402, 59], TYOP [0, 54, 403],
   TYOP [0, 38, 39], TYOP [0, 405, 39], TYOP [0, 39, 406],
   TYOP [0, 38, 45], TYOP [0, 408, 45], TYOP [0, 39, 409],
   TYOP [0, 362, 59], TYOP [10, 361], TYOP [0, 412, 411],
   TYOP [0, 365, 45], TYOP [0, 412, 414], TYOP [0, 369, 34],
   TYOP [10, 368], TYOP [0, 417, 416], TYOP [0, 373, 50], TYOP [10, 372],
   TYOP [0, 420, 419], TYOP [0, 376, 34], TYOP [0, 420, 422],
   TYOP [0, 379, 54], TYOP [0, 50, 424], TYOP [0, 382, 39],
   TYOP [0, 34, 426], TYOP [0, 1, 66], TYOP [0, 1, 71], TYOP [0, 316, 32],
   TYOP [0, 2, 106], TYOP [0, 2, 431], TYOP [0, 241, 432],
   TYOP [0, 241, 433], TYOP [0, 32, 2], TYOP [0, 319, 106],
   TYOP [0, 319, 436], TYOP [0, 432, 437], TYOP [0, 75, 75],
   TYOP [0, 75, 439], TYOP [0, 78, 78], TYOP [0, 78, 441],
   TYOP [0, 146, 146], TYOP [0, 93, 443], TYOP [0, 93, 93],
   TYOP [0, 93, 445], TYOP [0, 147, 147], TYOP [0, 74, 447],
   TYOP [0, 74, 74], TYOP [0, 74, 449], TYOP [0, 32, 397],
   TYOP [0, 2, 451], TYOP [0, 2, 452], TYOP [0, 57, 54], TYOP [0, 40, 454],
   TYOP [0, 43, 39], TYOP [0, 40, 456], TYOP [0, 32, 412],
   TYOP [0, 2, 458], TYOP [0, 32, 420], TYOP [0, 36, 460],
   TYOP [0, 32, 417], TYOP [0, 36, 462], TYOP [0, 49, 50],
   TYOP [0, 33, 34], TYOP [0, 58, 59], TYOP [0, 44, 45], TYOP [0, 32, 1],
   TYOP [0, 13, 2], TYOP [0, 20, 2]]
  end
  val _ = Theory.incorporate_consts "elf_program_header_table" tyvector
     [("string_of_elf_segment_permissions", 3),
      ("recordtype.elf64_program_header_table_entry", 22),
      ("recordtype.elf32_program_header_table_entry", 31),
      ("read_elf64_program_header_table_entry", 37),
      ("read_elf64_program_header_table'_tupled", 41),
      ("read_elf64_program_header_table'", 43),
      ("read_elf64_program_header_table", 48),
      ("read_elf32_program_header_table_entry", 52),
      ("read_elf32_program_header_table'_tupled", 55),
      ("read_elf32_program_header_table'", 57),
      ("read_elf32_program_header_table", 62),
      ("instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict", 63),
      ("instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict", 64),
      ("get_elf64_static_linked", 65),
      ("get_elf64_requested_interpreter", 68),
      ("get_elf64_dynamic_linked", 65), ("get_elf32_static_linked", 69),
      ("get_elf32_requested_interpreter", 70),
      ("get_elf32_dynamic_linked", 69),
      ("exact_permissions_of_permission", 72), ("elf_pt_tls", 2),
      ("elf_pt_shlib", 2), ("elf_pt_phdr", 2), ("elf_pt_null", 2),
      ("elf_pt_note", 2), ("elf_pt_loproc", 2), ("elf_pt_loos", 2),
      ("elf_pt_load", 2), ("elf_pt_interp", 2), ("elf_pt_hiproc", 2),
      ("elf_pt_hios", 2), ("elf_pt_dynamic", 2), ("elf_pf_x", 2),
      ("elf_pf_w", 2), ("elf_pf_r", 2), ("elf_pf_maskproc", 2),
      ("elf_pf_maskos", 2), ("elf64_program_header_table_entry_size", 73),
      ("elf64_program_header_table_entry_elf64_p_vaddr_fupd", 76),
      ("elf64_program_header_table_entry_elf64_p_vaddr", 77),
      ("elf64_program_header_table_entry_elf64_p_type_fupd", 79),
      ("elf64_program_header_table_entry_elf64_p_type", 80),
      ("elf64_program_header_table_entry_elf64_p_paddr_fupd", 76),
      ("elf64_program_header_table_entry_elf64_p_paddr", 77),
      ("elf64_program_header_table_entry_elf64_p_offset_fupd", 76),
      ("elf64_program_header_table_entry_elf64_p_offset", 77),
      ("elf64_program_header_table_entry_elf64_p_memsz_fupd", 76),
      ("elf64_program_header_table_entry_elf64_p_memsz", 77),
      ("elf64_program_header_table_entry_elf64_p_flags_fupd", 79),
      ("elf64_program_header_table_entry_elf64_p_flags", 80),
      ("elf64_program_header_table_entry_elf64_p_filesz_fupd", 76),
      ("elf64_program_header_table_entry_elf64_p_filesz", 77),
      ("elf64_program_header_table_entry_elf64_p_align_fupd", 76),
      ("elf64_program_header_table_entry_elf64_p_align", 77),
      ("elf64_program_header_table_entry_CASE", 91),
      ("elf32_program_header_table_entry_size", 92),
      ("elf32_program_header_table_entry_elf32_p_vaddr_fupd", 94),
      ("elf32_program_header_table_entry_elf32_p_vaddr", 95),
      ("elf32_program_header_table_entry_elf32_p_type_fupd", 94),
      ("elf32_program_header_table_entry_elf32_p_type", 95),
      ("elf32_program_header_table_entry_elf32_p_paddr_fupd", 94),
      ("elf32_program_header_table_entry_elf32_p_paddr", 95),
      ("elf32_program_header_table_entry_elf32_p_offset_fupd", 94),
      ("elf32_program_header_table_entry_elf32_p_offset", 95),
      ("elf32_program_header_table_entry_elf32_p_memsz_fupd", 94),
      ("elf32_program_header_table_entry_elf32_p_memsz", 95),
      ("elf32_program_header_table_entry_elf32_p_flags_fupd", 94),
      ("elf32_program_header_table_entry_elf32_p_flags", 95),
      ("elf32_program_header_table_entry_elf32_p_filesz_fupd", 94),
      ("elf32_program_header_table_entry_elf32_p_filesz", 95),
      ("elf32_program_header_table_entry_elf32_p_align_fupd", 94),
      ("elf32_program_header_table_entry_elf32_p_align", 95),
      ("elf32_program_header_table_entry_CASE", 105),
      ("compare_elf64_program_header_table_entry", 108),
      ("compare_elf32_program_header_table_entry", 110),
      ("bytes_of_elf64_program_header_table_entry", 112),
      ("bytes_of_elf64_program_header_table", 114),
      ("bytes_of_elf32_program_header_table_entry", 116),
      ("bytes_of_elf32_program_header_table", 118),
      ("allowable_permissions_of_permission", 72)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'elf32_program_header_table_entry'", 127),
   TMV("'elf64_program_header_table_entry'", 136), TMV("M", 23),
   TMV("M", 4), TMV("M'", 23), TMV("M'", 4), TMV("P", 137), TMV("P", 138),
   TMV("P", 140), TMV("R", 142), TMV("a", 40), TMV("a0", 20),
   TMV("a0'", 20), TMV("a0'", 135), TMV("a0'", 126), TMV("a1", 20),
   TMV("a1'", 20), TMV("a2", 13), TMV("a2", 20), TMV("a2'", 13),
   TMV("a2'", 20), TMV("a3", 13), TMV("a3", 20), TMV("a3'", 13),
   TMV("a3'", 20), TMV("a4", 13), TMV("a4", 20), TMV("a4'", 13),
   TMV("a4'", 20), TMV("a5", 13), TMV("a5", 20), TMV("a5'", 13),
   TMV("a5'", 20), TMV("a6", 13), TMV("a6", 20), TMV("a6'", 13),
   TMV("a6'", 20), TMV("a7", 13), TMV("a7", 20), TMV("a7'", 13),
   TMV("a7'", 20), TMV("align", 13), TMV("align", 20), TMV("bs", 32),
   TMV("bs0", 32), TMV("bs1", 32), TMV("c", 13), TMV("c", 20),
   TMV("c0", 13), TMV("c0", 20), TMV("c01", 13), TMV("c01", 20),
   TMV("c02", 13), TMV("c02", 20), TMV("c1", 13), TMV("c1", 20),
   TMV("c11", 13), TMV("c11", 20), TMV("c12", 13), TMV("c12", 20),
   TMV("c2", 13), TMV("c2", 20), TMV("c21", 13), TMV("c21", 20),
   TMV("c22", 13), TMV("c22", 20), TMV("c3", 13), TMV("c3", 20),
   TMV("c31", 13), TMV("c31", 20), TMV("c32", 13), TMV("c32", 20),
   TMV("c4", 13), TMV("c4", 20), TMV("c41", 13), TMV("c41", 20),
   TMV("c42", 13), TMV("c42", 20), TMV("c5", 13), TMV("c5", 20),
   TMV("c51", 20), TMV("c52", 20), TMV("c6", 13), TMV("c6", 20),
   TMV("c61", 20), TMV("c62", 20), TMV("cut", 32), TMV("e", 23),
   TMV("e", 4), TMV("e1", 23), TMV("e1", 4), TMV("e2", 23), TMV("e2", 4),
   TMV("eat", 32), TMV("ee", 23), TMV("ee", 4), TMV("elf32_p_align", 20),
   TMV("elf32_p_filesz", 20), TMV("elf32_p_flags", 20),
   TMV("elf32_p_memsz", 20), TMV("elf32_p_offset", 20),
   TMV("elf32_p_paddr", 20), TMV("elf32_p_type", 20),
   TMV("elf32_p_vaddr", 20), TMV("elf32_program_header_table_entry", 143),
   TMV("elf64_p_align", 13), TMV("elf64_p_filesz", 13),
   TMV("elf64_p_flags", 20), TMV("elf64_p_memsz", 13),
   TMV("elf64_p_offset", 13), TMV("elf64_p_paddr", 13),
   TMV("elf64_p_type", 20), TMV("elf64_p_vaddr", 13),
   TMV("elf64_program_header_table_entry", 143), TMV("endian", 36),
   TMV("entry", 23), TMV("entry", 4), TMV("f", 75), TMV("f", 78),
   TMV("f", 89), TMV("f", 103), TMV("f'", 89), TMV("f'", 103),
   TMV("f1", 23), TMV("f1", 4), TMV("f2", 23), TMV("f2", 4),
   TMV("filesz", 13), TMV("filesz", 20), TMV("flags", 20), TMV("fn", 144),
   TMV("fn", 145), TMV("g", 75), TMV("g", 78), TMV("h", 146),
   TMV("h", 147), TMV("h1", 23), TMV("h1", 4), TMV("h2", 23), TMV("h2", 4),
   TMV("m", 2), TMV("memsz", 13), TMV("memsz", 20), TMV("n", 2),
   TMV("off", 2), TMV("offset", 13), TMV("offset", 20), TMV("p", 23),
   TMV("p", 4), TMV("paddr", 13), TMV("paddr", 20), TMV("pent", 23),
   TMV("pent", 4), TMV("pht", 53), TMV("pht", 38),
   TMV("read_elf32_program_header_table'_tupled", 55),
   TMV("read_elf64_program_header_table'_tupled", 41), TMV("record", 156),
   TMV("record", 165), TMV("rep", 166), TMV("rep", 167), TMV("rest", 32),
   TMV("siz", 2), TMV("table", 53), TMV("table", 38), TMV("table_size", 2),
   TMV("tail", 53), TMV("tail", 38), TMV("tbl", 53), TMV("tbl", 38),
   TMV("typ", 20), TMV("v", 36), TMV("v1", 32), TMV("vaddr", 13),
   TMV("vaddr", 20), TMV("x", 36), TMV("x1", 32), TMC(18, 168),
   TMC(18, 169), TMC(18, 170), TMC(18, 171), TMC(18, 172), TMC(18, 174),
   TMC(18, 176), TMC(18, 178), TMC(18, 180), TMC(18, 182), TMC(18, 184),
   TMC(18, 186), TMC(18, 187), TMC(18, 188), TMC(18, 190), TMC(18, 192),
   TMC(18, 194), TMC(18, 195), TMC(18, 196), TMC(18, 198), TMC(18, 191),
   TMC(18, 193), TMC(19, 200), TMC(20, 200), TMC(21, 202), TMC(21, 204),
   TMC(21, 206), TMC(21, 208), TMC(21, 210), TMC(21, 212), TMC(21, 214),
   TMC(21, 216), TMC(21, 218), TMC(21, 220), TMC(21, 222), TMC(21, 224),
   TMC(21, 226), TMC(21, 228), TMC(21, 230), TMC(21, 232), TMC(21, 234),
   TMC(21, 236), TMC(21, 238), TMC(22, 200), TMC(23, 240), TMC(24, 2),
   TMC(25, 241), TMC(26, 243), TMC(26, 245), TMC(26, 247), TMC(26, 240),
   TMC(26, 248), TMC(26, 149), TMC(26, 158), TMC(26, 249), TMC(26, 250),
   TMC(26, 252), TMC(26, 254), TMC(26, 256), TMC(26, 258), TMC(26, 260),
   TMC(26, 262), TMC(26, 264), TMC(26, 266), TMC(26, 267), TMC(26, 268),
   TMC(26, 270), TMC(26, 272), TMC(26, 274), TMC(26, 276), TMC(26, 278),
   TMC(26, 241), TMC(26, 280), TMC(26, 281), TMC(26, 282), TMC(27, 240),
   TMC(28, 169), TMC(28, 170), TMC(28, 171), TMC(28, 172), TMC(28, 284),
   TMC(28, 286), TMC(28, 288), TMC(28, 290), TMC(29, 292), TMC(30, 64),
   TMC(30, 63), TMC(30, 23), TMC(30, 4), TMC(31, 199), TMC(32, 199),
   TMC(33, 135), TMC(33, 126), TMC(34, 293), TMC(35, 296), TMC(35, 299),
   TMC(35, 302), TMC(35, 305), TMC(35, 308), TMC(36, 309), TMC(36, 311),
   TMC(36, 313), TMC(36, 318), TMC(36, 321), TMC(37, 325), TMC(37, 329),
   TMC(38, 239), TMC(39, 279), TMC(40, 106), TMC(41, 330), TMC(41, 331),
   TMC(42, 106), TMC(43, 297), TMC(43, 300), TMC(44, 333), TMC(45, 335),
   TMC(46, 336), TMC(46, 337), TMC(46, 339), TMC(46, 341), TMC(46, 343),
   TMC(46, 345), TMC(47, 347), TMC(48, 106), TMC(49, 350), TMC(49, 352),
   TMC(50, 1), TMC(50, 53), TMC(50, 38), TMC(50, 316), TMC(50, 319),
   TMC(51, 199), TMC(52, 354), TMC(52, 356), TMC(53, 357), TMC(53, 358),
   TMC(54, 357), TMC(54, 358), TMC(55, 357), TMC(55, 358), TMC(56, 357),
   TMC(56, 358), TMC(57, 359), TMC(57, 360), TMC(58, 364), TMC(58, 367),
   TMC(58, 371), TMC(58, 375), TMC(58, 378), TMC(58, 381), TMC(58, 384),
   TMC(59, 291), TMC(60, 387), TMC(60, 390), TMC(61, 2), TMC(62, 72),
   TMC(63, 392), TMC(64, 392), TMC(65, 118), TMC(66, 116), TMC(67, 392),
   TMC(68, 394), TMC(69, 394), TMC(70, 114), TMC(71, 112), TMC(72, 392),
   TMC(73, 394), TMC(74, 110), TMC(75, 108), TMC(76, 395), TMC(77, 105),
   TMC(78, 95), TMC(79, 94), TMC(80, 95), TMC(81, 94), TMC(82, 95),
   TMC(83, 94), TMC(84, 95), TMC(85, 94), TMC(86, 95), TMC(87, 94),
   TMC(88, 95), TMC(89, 94), TMC(90, 95), TMC(91, 94), TMC(92, 95),
   TMC(93, 94), TMC(94, 92), TMC(95, 91), TMC(96, 77), TMC(97, 76),
   TMC(98, 77), TMC(99, 76), TMC(100, 80), TMC(101, 79), TMC(102, 77),
   TMC(103, 76), TMC(104, 77), TMC(105, 76), TMC(106, 77), TMC(107, 76),
   TMC(108, 80), TMC(109, 79), TMC(110, 77), TMC(111, 76), TMC(112, 73),
   TMC(113, 2), TMC(114, 2), TMC(115, 2), TMC(116, 2), TMC(117, 2),
   TMC(118, 2), TMC(119, 2), TMC(120, 2), TMC(121, 2), TMC(122, 2),
   TMC(123, 2), TMC(124, 2), TMC(125, 2), TMC(126, 2), TMC(127, 2),
   TMC(128, 2), TMC(129, 2), TMC(130, 398), TMC(130, 401), TMC(130, 404),
   TMC(130, 407), TMC(130, 410), TMC(130, 413), TMC(130, 415),
   TMC(130, 418), TMC(130, 421), TMC(130, 423), TMC(130, 425),
   TMC(130, 427), TMC(131, 72), TMC(132, 428), TMC(132, 429),
   TMC(133, 430), TMC(134, 434), TMC(135, 69), TMC(136, 70), TMC(137, 69),
   TMC(138, 65), TMC(139, 68), TMC(140, 65), TMC(141, 64), TMC(142, 63),
   TMC(143, 435), TMC(144, 438), TMC(145, 440), TMC(145, 442),
   TMC(145, 444), TMC(145, 446), TMC(145, 448), TMC(145, 450),
   TMC(146, 453), TMC(147, 455), TMC(147, 457), TMC(148, 459),
   TMC(149, 461), TMC(150, 461), TMC(151, 62), TMC(152, 57), TMC(153, 55),
   TMC(154, 52), TMC(155, 461), TMC(156, 463), TMC(157, 463), TMC(158, 48),
   TMC(159, 43), TMC(160, 41), TMC(161, 37), TMC(162, 461), TMC(163, 463),
   TMC(164, 31), TMC(165, 22), TMC(166, 428), TMC(166, 399), TMC(166, 405),
   TMC(166, 72), TMC(166, 464), TMC(166, 465), TMC(166, 466),
   TMC(166, 467), TMC(167, 468), TMC(168, 3), TMC(169, 469), TMC(169, 470),
   TMC(170, 239)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op elf_pt_null_def x = x
    val op elf_pt_null_def =
    DT(((("elf_program_header_table",0),[]),[]), [read"%248%396@%222@"])
  fun op elf_pt_load_def x = x
    val op elf_pt_load_def =
    DT(((("elf_program_header_table",1),[]),[]),
       [read"%248%392@%308%266%331@@@"])
  fun op elf_pt_dynamic_def x = x
    val op elf_pt_dynamic_def =
    DT(((("elf_program_header_table",2),[]),[]),
       [read"%248%388@%308%267%331@@@"])
  fun op elf_pt_interp_def x = x
    val op elf_pt_interp_def =
    DT(((("elf_program_header_table",3),[]),[]),
       [read"%248%391@%308%266%266%331@@@@"])
  fun op elf_pt_note_def x = x
    val op elf_pt_note_def =
    DT(((("elf_program_header_table",4),[]),[]),
       [read"%248%395@%308%267%266%331@@@@"])
  fun op elf_pt_shlib_def x = x
    val op elf_pt_shlib_def =
    DT(((("elf_program_header_table",5),[]),[]),
       [read"%248%398@%308%266%267%331@@@@"])
  fun op elf_pt_phdr_def x = x
    val op elf_pt_phdr_def =
    DT(((("elf_program_header_table",6),[]),[]),
       [read"%248%397@%308%267%267%331@@@@"])
  fun op elf_pt_tls_def x = x
    val op elf_pt_tls_def =
    DT(((("elf_program_header_table",7),[]),[]),
       [read"%248%399@%308%266%266%266%331@@@@@"])
  fun op elf_pt_loos_def x = x
    val op elf_pt_loos_def =
    DT(((("elf_program_header_table",8),[]),[]),
       [read"%248%393@%199%199%199%199%308%267%266%266%266%266%266%266%331@@@@@@@@@%308%267%266%266%266%266%266%266%331@@@@@@@@@@%308%267%266%266%266%266%266%266%331@@@@@@@@@@%308%267%266%266%266%266%266%266%266%331@@@@@@@@@@@%308%266%266%331@@@@@"])
  fun op elf_pt_hios_def x = x
    val op elf_pt_hios_def =
    DT(((("elf_program_header_table",9),[]),[]),
       [read"%248%389@%200%199%308%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%267%267%331@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%308%267%266%331@@@@@%308%266%266%331@@@@@"])
  fun op elf_pt_loproc_def x = x
    val op elf_pt_loproc_def =
    DT(((("elf_program_header_table",10),[]),[]),
       [read"%248%394@%199%308%267%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%267%267%331@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%308%267%266%331@@@@@"])
  fun op elf_pt_hiproc_def x = x
    val op elf_pt_hiproc_def =
    DT(((("elf_program_header_table",11),[]),[]),
       [read"%248%390@%200%199%308%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%331@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%308%267%266%331@@@@@%308%266%266%331@@@@@"])
  fun op elf_pf_x_def x = x
    val op elf_pf_x_def =
    DT(((("elf_program_header_table",12),[]),[]),
       [read"%248%387@%308%266%331@@@"])
  fun op elf_pf_w_def x = x
    val op elf_pf_w_def =
    DT(((("elf_program_header_table",13),[]),[]),
       [read"%248%386@%308%267%331@@@"])
  fun op elf_pf_r_def x = x
    val op elf_pf_r_def =
    DT(((("elf_program_header_table",14),[]),[]),
       [read"%248%385@%308%267%266%331@@@@"])
  fun op elf_pf_maskos_def x = x
    val op elf_pf_maskos_def =
    DT(((("elf_program_header_table",15),[]),[]),
       [read"%248%383@%308%267%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%267%267%267%267%267%267%267%331@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf_pf_maskproc_def x = x
    val op elf_pf_maskproc_def =
    DT(((("elf_program_header_table",16),[]),[]),
       [read"%248%384@%199%308%267%266%331@@@@%308%267%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%266%267%267%267%331@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op exact_permissions_of_permission_def x = x
    val op exact_permissions_of_permission_def =
    DT(((("elf_program_header_table",17),[]),[]),
       [read"%196%140%236%412$0@@%274%248$0@%222@@%457%222@@%274%248$0@%387@@%457%308%266%331@@@@%274%248$0@%386@@%457%308%267%331@@@@%274%248$0@%385@@%457%308%267%266%331@@@@@%274%248$0@%200%387@%386@@@%457%308%266%266%331@@@@@%274%248$0@%200%387@%385@@@%457%308%266%267%331@@@@@%274%248$0@%200%386@%385@@@%457%308%267%267%331@@@@@%274%248$0@%200%200%387@%385@@%386@@@%457%308%266%266%266%331@@@@@@%414%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%266%267%267%267%331@@@@@@@@@%276%270%308%266%267%266%266%266%267%331@@@@@@@@@%276%270%308%266%266%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%266%266%266%266%267%331@@@@@@@@@%276%270%308%267%266%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%267%266%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%266%267%331@@@@@@@@@%276%270%308%267%266%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%267%266%267%267%331@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%267%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%266%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%266%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%266%266%267%331@@@@@@@@@%276%270%308%266%266%266%267%266%267%331@@@@@@@@@%303@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op allowable_permissions_of_permission_def x = x
    val op allowable_permissions_of_permission_def =
    DT(((("elf_program_header_table",18),[]),[]),
       [read"%196%140%236%332$0@@%274%248$0@%222@@%457%222@@%274%248$0@%387@@%457%308%266%267%331@@@@@%274%248$0@%386@@%457%308%266%266%266%331@@@@@@%274%248$0@%385@@%457%308%266%267%331@@@@@%274%248$0@%200%387@%386@@@%457%308%266%266%266%331@@@@@@%274%248$0@%200%387@%385@@@%457%308%266%267%331@@@@@%274%248$0@%200%386@%385@@@%457%308%266%266%266%331@@@@@@%274%248$0@%200%200%387@%385@@%386@@@%457%308%266%266%266%331@@@@@@%414%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%266%267%267%267%331@@@@@@@@@%276%270%308%266%267%266%266%266%267%331@@@@@@@@@%276%270%308%266%266%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%266%266%266%266%267%331@@@@@@@@@%276%270%308%267%266%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%267%266%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%266%267%331@@@@@@@@@%276%270%308%267%266%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%267%266%267%267%331@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%267%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%266%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%266%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%266%266%267%331@@@@@@@@@%276%270%308%266%266%266%267%266%267%331@@@@@@@@@%303@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op string_of_elf_segment_permissions_def x = x
    val op string_of_elf_segment_permissions_def =
    DT(((("elf_program_header_table",19),[]),[]),
       [read"%196%140%247%463$0@@%275%248$0@%222@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%303@@@%275%248$0@%387@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%266%267%267%266%266%266%331@@@@@@@@@%303@@@@%275%248$0@%386@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%266%266%266%267%267%266%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%303@@@@%275%248$0@%385@@%276%270%308%267%267%266%266%267%266%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%303@@@@%275%248$0@%200%387@%386@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%266%266%266%267%267%266%331@@@@@@@@@%276%270%308%266%267%267%266%266%266%331@@@@@@@@@%303@@@@%275%248$0@%200%387@%385@@@%276%270%308%267%267%266%266%267%266%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%266%267%267%266%266%266%331@@@@@@@@@%303@@@@%275%248$0@%200%386@%385@@@%276%270%308%267%267%266%266%267%266%331@@@@@@@@@%276%270%308%266%266%266%267%267%266%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%303@@@@%275%248$0@%200%200%387@%385@@%386@@@%276%270%308%267%267%266%266%267%266%331@@@@@@@@@%276%270%308%266%266%266%267%267%266%331@@@@@@@@@%276%270%308%266%267%267%266%266%266%331@@@@@@@@@%303@@@@%276%270%308%266%267%266%267%266%266%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%267%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%266%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%266%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%266%266%266%267%331@@@@@@@@@%276%270%308%266%266%266%267%266%267%331@@@@@@@@@%303@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op elf32_program_header_table_entry_TY_DEF x = x
    val op elf32_program_header_table_entry_TY_DEF =
    DT(((("elf_program_header_table",20),[("bool",[26])]),["DISK_THM"]),
       [read"%258%159%320%14%193%0%252%198%14%252%254%11%254%15%254%18%254%22%254%26%254%30%254%34%254%38%251$8@%11%15%18%22%26%30%34%38%282%222@%214$7@%213$6@%212$5@%211$4@%210$3@%208$2@%206$1@$0@@@@@@@@%143%269|@||||||||$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_program_header_table_entry_case_def x = x
    val op elf32_program_header_table_entry_case_def =
    DT(((("elf_program_header_table",24),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%11%179%15%179%18%179%22%179%26%179%30%179%34%179%38%188%120%224%347%452$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_size_def x = x
    val op elf32_program_header_table_entry_size_def =
    DT(((("elf_program_header_table",25),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%11%179%15%179%18%179%22%179%26%179%30%179%34%179%38%248%364%452$7@$6@$5@$4@$3@$2@$1@$0@@@%308%266%331@@@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_type x = x
    val op elf32_program_header_table_entry_elf32_p_type =
    DT(((("elf_program_header_table",26),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%360%452$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_offset x = x
    val op elf32_program_header_table_entry_elf32_p_offset =
    DT(((("elf_program_header_table",27),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%356%452$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_vaddr x = x
    val op elf32_program_header_table_entry_elf32_p_vaddr =
    DT(((("elf_program_header_table",28),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%362%452$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_paddr x = x
    val op elf32_program_header_table_entry_elf32_p_paddr =
    DT(((("elf_program_header_table",29),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%358%452$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_filesz x = x
    val op elf32_program_header_table_entry_elf32_p_filesz =
    DT(((("elf_program_header_table",30),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%350%452$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_memsz x = x
    val op elf32_program_header_table_entry_elf32_p_memsz =
    DT(((("elf_program_header_table",31),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%354%452$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_flags x = x
    val op elf32_program_header_table_entry_elf32_p_flags =
    DT(((("elf_program_header_table",32),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%352%452$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_align x = x
    val op elf32_program_header_table_entry_elf32_p_align =
    DT(((("elf_program_header_table",33),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%348%452$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_type_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_type_fupd =
    DT(((("elf_program_header_table",35),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%361$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$8$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_offset_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_offset_fupd =
    DT(((("elf_program_header_table",36),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%357$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$8$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_vaddr_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_vaddr_fupd =
    DT(((("elf_program_header_table",37),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%363$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$6@$8$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_paddr_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_paddr_fupd =
    DT(((("elf_program_header_table",38),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%359$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$6@$5@$8$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_filesz_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_filesz_fupd =
    DT(((("elf_program_header_table",39),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%351$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$6@$5@$4@$8$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_memsz_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_memsz_fupd =
    DT(((("elf_program_header_table",40),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%355$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$6@$5@$4@$3@$8$2@@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_flags_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_flags_fupd =
    DT(((("elf_program_header_table",41),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%353$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$6@$5@$4@$3@$2@$8$1@@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_elf32_p_align_fupd x = x
    val op elf32_program_header_table_entry_elf32_p_align_fupd =
    DT(((("elf_program_header_table",42),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%349$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$6@$5@$4@$3@$2@$1@$8$0@@@|@|@|@|@|@|@|@|@|@"])
  fun op compare_elf32_program_header_table_entry_def x = x
    val op compare_elf32_program_header_table_entry_def =
    DT(((("elf_program_header_table",61),[]),[]),
       [read"%180%136%180%138%249%344$1@$0@@%426%416%223@%248@@%280%465%360$1@@@%280%465%356$1@@@%280%465%362$1@@@%280%465%358$1@@@%280%465%350$1@@@%280%465%354$1@@@%280%465%352$1@@@%280%465%348$1@@@%307@@@@@@@@@%280%465%360$0@@@%280%465%356$0@@@%280%465%362$0@@@%280%465%358$0@@@%280%465%350$0@@@%280%465%354$0@@@%280%465%352$0@@@%280%465%348$0@@@%307@@@@@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict_def
    =
    DT(((("elf_program_header_table",62),[]),[]),
       [read"%225%423@%309%296%344@@%317%295%123%125%249%344$1@$0@@%300@||@@%315%295%123%125%291%344$1@$0@@%292%300@%292%285@%284@@@||@@%313%295%123%125%249%344$1@$0@@%288@||@@%311%295%123%125%291%344$1@$0@@%292%288@%292%285@%284@@@||@@%262@@@@@@"])
  fun op elf64_program_header_table_entry_TY_DEF x = x
    val op elf64_program_header_table_entry_TY_DEF =
    DT(((("elf_program_header_table",63),[("bool",[26])]),["DISK_THM"]),
       [read"%260%160%319%13%192%1%252%197%13%252%254%11%254%15%253%17%253%21%253%25%253%29%253%33%253%37%250$8@%11%15%17%21%25%29%33%37%281%222@%209$7@%207$6@%205$5@%204$4@%203$3@%202$2@%201$1@$0@@@@@@@@%143%268|@||||||||$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_program_header_table_entry_case_def x = x
    val op elf64_program_header_table_entry_case_def =
    DT(((("elf_program_header_table",67),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%11%179%15%178%17%178%21%178%25%178%29%178%33%178%37%187%119%224%365%453$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_size_def x = x
    val op elf64_program_header_table_entry_size_def =
    DT(((("elf_program_header_table",68),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%11%179%15%178%17%178%21%178%25%178%29%178%33%178%37%248%382%453$7@$6@$5@$4@$3@$2@$1@$0@@@%308%266%331@@@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_type x = x
    val op elf64_program_header_table_entry_elf64_p_type =
    DT(((("elf_program_header_table",69),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%230%378%453$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_flags x = x
    val op elf64_program_header_table_entry_elf64_p_flags =
    DT(((("elf_program_header_table",70),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%230%370%453$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_offset x = x
    val op elf64_program_header_table_entry_elf64_p_offset =
    DT(((("elf_program_header_table",71),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%229%374%453$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_vaddr x = x
    val op elf64_program_header_table_entry_elf64_p_vaddr =
    DT(((("elf_program_header_table",72),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%229%380%453$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_paddr x = x
    val op elf64_program_header_table_entry_elf64_p_paddr =
    DT(((("elf_program_header_table",73),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%229%376%453$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_filesz x = x
    val op elf64_program_header_table_entry_elf64_p_filesz =
    DT(((("elf_program_header_table",74),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%229%368%453$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_memsz x = x
    val op elf64_program_header_table_entry_elf64_p_memsz =
    DT(((("elf_program_header_table",75),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%229%372%453$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_align x = x
    val op elf64_program_header_table_entry_elf64_p_align =
    DT(((("elf_program_header_table",76),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%229%366%453$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_type_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_type_fupd =
    DT(((("elf_program_header_table",78),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%186%118%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%379$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$8$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_flags_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_flags_fupd =
    DT(((("elf_program_header_table",79),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%186%118%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%371$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$8$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_offset_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_offset_fupd =
    DT(((("elf_program_header_table",80),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%185%117%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%375$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$6@$8$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_vaddr_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_vaddr_fupd =
    DT(((("elf_program_header_table",81),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%185%117%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%381$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$6@$5@$8$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_paddr_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_paddr_fupd =
    DT(((("elf_program_header_table",82),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%185%117%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%377$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$6@$5@$4@$8$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_filesz_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_filesz_fupd =
    DT(((("elf_program_header_table",83),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%185%117%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%369$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$6@$5@$4@$3@$8$2@@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_memsz_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_memsz_fupd =
    DT(((("elf_program_header_table",84),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%185%117%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%373$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$6@$5@$4@$3@$2@$8$1@@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_elf64_p_align_fupd x = x
    val op elf64_program_header_table_entry_elf64_p_align_fupd =
    DT(((("elf_program_header_table",85),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%185%117%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%367$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$6@$5@$4@$3@$2@$1@$8$0@@@|@|@|@|@|@|@|@|@|@"])
  fun op compare_elf64_program_header_table_entry_def x = x
    val op compare_elf64_program_header_table_entry_def =
    DT(((("elf_program_header_table",104),[]),[]),
       [read"%181%137%181%139%249%345$1@$0@@%426%416%223@%248@@%280%465%378$1@@@%280%464%374$1@@@%280%464%380$1@@@%280%464%376$1@@@%280%464%368$1@@@%280%464%372$1@@@%280%465%370$1@@@%280%464%366$1@@@%307@@@@@@@@@%280%465%378$0@@@%280%464%374$0@@@%280%464%380$0@@@%280%464%376$0@@@%280%464%368$0@@@%280%464%372$0@@@%280%465%370$0@@@%280%464%366$0@@@%307@@@@@@@@@@|@|@"])
  fun
    op instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict_def
    x = x
    val
    op instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict_def
    =
    DT(((("elf_program_header_table",105),[]),[]),
       [read"%226%424@%310%298%345@@%318%297%124%126%249%345$1@$0@@%300@||@@%316%297%124%126%291%345$1@$0@@%292%300@%292%285@%284@@@||@@%314%297%124%126%249%345$1@$0@@%288@||@@%312%297%124%126%291%345$1@$0@@%292%288@%292%285@%284@@@||@@%263@@@@@@"])
  fun op bytes_of_elf32_program_header_table_entry_def x = x
    val op bytes_of_elf32_program_header_table_entry_def =
    DT(((("elf_program_header_table",106),[]),[]),
       [read"%182%114%180%115%228%336$1@$0@@%415%279%337$1@%360$0@@@%279%334$1@%356$0@@@%279%333$1@%362$0@@@%279%333$1@%358$0@@@%279%337$1@%350$0@@@%279%337$1@%354$0@@@%279%337$1@%352$0@@@%279%337$1@%348$0@@@%306@@@@@@@@@@|@|@"])
  fun op bytes_of_elf64_program_header_table_entry_def x = x
    val op bytes_of_elf64_program_header_table_entry_def =
    DT(((("elf_program_header_table",107),[]),[]),
       [read"%182%114%181%116%228%341$1@$0@@%415%279%342$1@%378$0@@@%279%342$1@%370$0@@@%279%339$1@%374$0@@@%279%338$1@%380$0@@@%279%338$1@%376$0@@@%279%343$1@%368$0@@@%279%343$1@%372$0@@@%279%343$1@%366$0@@@%306@@@@@@@@@@|@|@"])
  fun op read_elf32_program_header_table_entry_def x = x
    val op read_elf32_program_header_table_entry_def =
    DT(((("elf_program_header_table",108),[]),[]),
       [read"%182%114%177%43%237%442$1@$0@@%408%443$1@$0@@%324%170%43%408%438$3@$0@@%324%146%43%408%437$5@$0@@%324%174%43%408%437$7@$0@@%324%150%43%408%443$9@$0@@%324%128%43%408%443$11@$0@@%324%142%43%408%443$13@$0@@%324%129%43%408%443$15@$0@@%324%42%43%458%215%361%294$15@@%357%294$13@@%363%294$11@@%359%294$9@@%351%294$7@@%355%294$5@@%353%294$3@@%349%294$1@@%264@@@@@@@@@$0@@||@@||@@||@@||@@||@@||@@||@@||@@@|@|@"])
  fun op read_elf64_program_header_table_entry_def x = x
    val op read_elf64_program_header_table_entry_def =
    DT(((("elf_program_header_table",109),[]),[]),
       [read"%182%114%177%43%238%449$1@$0@@%409%450$1@$0@@%325%170%43%409%450$3@$0@@%325%129%43%407%445$5@$0@@%323%145%43%407%444$7@$0@@%323%173%43%407%444$9@$0@@%323%149%43%407%451$11@$0@@%323%127%43%407%451$13@$0@@%323%141%43%407%451$15@$0@@%323%41%43%459%216%379%294$15@@%375%293$11@@%381%293$9@@%377%293$7@@%369%293$5@@%373%293$3@@%371%294$13@@%367%293$1@@%265@@@@@@@@@$0@@||@@||@@||@@||@@||@@||@@||@@||@@@|@|@"])
  fun op bytes_of_elf32_program_header_table_def x = x
    val op bytes_of_elf32_program_header_table_def =
    DT(((("elf_program_header_table",110),[]),[]),
       [read"%182%114%194%168%228%335$1@$0@@%346%301%336$1@@$0@@@|@|@"])
  fun op bytes_of_elf64_program_header_table_def x = x
    val op bytes_of_elf64_program_header_table_def =
    DT(((("elf_program_header_table",111),[]),[]),
       [read"%182%114%195%169%228%340$1@$0@@%346%302%341$1@@$0@@@|@|@"])
  fun op read_elf32_program_header_table'_tupled_primitive_def x = x
    val op read_elf32_program_header_table'_tupled_primitive_def =
    DT(((("elf_program_header_table",112),[]),[]),
       [read"%245%441@%329%261%9%221%328$0@@%182%114%177%44%177%45%252%466%248%425$1@@%222@@@$3%217$2@$0@@%217$2@$1@@@|@|@|@@|@@%155%10%434$0@%114%44%289%272%248%425$0@@%222@@%455%304@@%410%442$1@$0@@%326%115%45%401$5%217$3@$0@@@%166%455%277$2@$0@@|@||@@@@||@||@@"])
  fun op read_elf32_program_header_table'_curried_def x = x
    val op read_elf32_program_header_table'_curried_def =
    DT(((("elf_program_header_table",113),[]),[]),
       [read"%182%175%177%176%234%440$1@$0@@%441%217$1@$0@@@|@|@"])
  fun op read_elf64_program_header_table'_tupled_primitive_def x = x
    val op read_elf64_program_header_table'_tupled_primitive_def =
    DT(((("elf_program_header_table",116),[]),[]),
       [read"%246%448@%330%261%9%221%328$0@@%182%114%177%44%177%45%252%466%248%425$1@@%222@@@$3%217$2@$0@@%217$2@$1@@@|@|@|@@|@@%156%10%435$0@%114%44%290%273%248%425$0@@%222@@%456%305@@%411%449$1@$0@@%327%116%45%403$5%217$3@$0@@@%167%456%278$2@$0@@|@||@@@@||@||@@"])
  fun op read_elf64_program_header_table'_curried_def x = x
    val op read_elf64_program_header_table'_curried_def =
    DT(((("elf_program_header_table",117),[]),[]),
       [read"%182%175%177%176%235%447$1@$0@@%448%217$1@$0@@@|@|@"])
  fun op read_elf32_program_header_table_def x = x
    val op read_elf32_program_header_table_def =
    DT(((("elf_program_header_table",120),[]),[]),
       [read"%196%165%182%114%177%44%239%439$2@$1@$0@@%405%436$2@$0@@%321%93%161%402%440$3@$1@@%163%460%218$0@$1@@|@||@@@|@|@|@"])
  fun op read_elf64_program_header_table_def x = x
    val op read_elf64_program_header_table_def =
    DT(((("elf_program_header_table",121),[]),[]),
       [read"%196%165%182%114%177%44%240%446$2@$1@$0@@%406%436$2@$0@@%322%93%161%404%447$3@$1@@%164%461%219$0@$1@@|@||@@@|@|@|@"])
  fun op get_elf32_dynamic_linked_def x = x
    val op get_elf32_dynamic_linked_def =
    DT(((("elf_program_header_table",122),[]),[]),
       [read"%194%153%227%417$0@@%286%147%248%465%360$0@@@%391@|@$0@@|@"])
  fun op get_elf64_dynamic_linked_def x = x
    val op get_elf64_dynamic_linked_def =
    DT(((("elf_program_header_table",123),[]),[]),
       [read"%195%154%227%420$0@@%287%148%248%465%378$0@@@%391@|@$0@@|@"])
  fun op get_elf32_static_linked_def x = x
    val op get_elf32_static_linked_def =
    DT(((("elf_program_header_table",124),[]),[]),
       [read"%194%153%227%419$0@@%466%417$0@@@|@"])
  fun op get_elf64_static_linked_def x = x
    val op get_elf64_static_linked_def =
    DT(((("elf_program_header_table",125),[]),[]),
       [read"%195%154%227%422$0@@%466%420$0@@@|@"])
  fun op get_elf32_requested_interpreter_def x = x
    val op get_elf32_requested_interpreter_def =
    DT(((("elf_program_header_table",126),[]),[]),
       [read"%180%151%177%44%233%418$1@$0@@%271%248%465%360$1@@@%391@@%299%144%299%162%400%433$1@%220$0@%308%266%331@@@@$2@@%86%454%462$0@@|@|@%465%350$2@@@|@%465%356$1@@@@%413%276%270%308%266%266%266%267%266%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%266%266%266%266%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%267%266%267%331@@@@@@@@@%276%270%308%267%267%267%266%266%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%331@@@@@@@@%276%270%308%267%267%266%266%267%331@@@@@@@@%276%270%308%266%266%266%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%266%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%266%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%267%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%266%267%267%331@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%266%267%266%266%266%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%266%267%266%267%266%266%331@@@@@@@@@%276%270%308%267%267%267%267%266%266%331@@@@@@@@@%276%270%308%267%266%267%266%267%266%331@@@@@@@@@%276%270%308%266%267%267%266%266%266%331@@@@@@@@@%276%270%308%267%267%266%266%267%266%331@@@@@@@@@%276%270%308%267%266%266%266%267%266%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%266%266%266%267%266%267%331@@@@@@@@@%276%270%308%266%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%266%266%267%266%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%266%267%266%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%266%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%303@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@"])
  fun op get_elf64_requested_interpreter_def x = x
    val op get_elf64_requested_interpreter_def =
    DT(((("elf_program_header_table",127),[]),[]),
       [read"%181%152%177%44%233%421$1@$0@@%271%248%465%378$1@@@%391@@%299%144%299%162%400%433$1@%220$0@%308%266%331@@@@$2@@%86%454%462$0@@|@|@%464%368$2@@@|@%464%374$1@@@@%413%276%270%308%266%266%266%267%266%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%266%266%266%266%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%267%266%267%331@@@@@@@@@%276%270%308%267%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%267%266%267%331@@@@@@@@%276%270%308%267%266%267%266%267%331@@@@@@@@%276%270%308%266%266%266%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%266%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%266%267%331@@@@@@@@@%276%270%308%266%267%266%267%266%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%267%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%276%270%308%267%267%266%267%267%331@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%266%266%266%267%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%266%267%266%266%266%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%266%267%266%267%266%266%331@@@@@@@@@%276%270%308%267%267%267%267%266%266%331@@@@@@@@@%276%270%308%267%266%267%266%267%266%331@@@@@@@@@%276%270%308%266%267%267%266%266%266%331@@@@@@@@@%276%270%308%267%267%266%266%267%266%331@@@@@@@@@%276%270%308%267%266%266%266%267%266%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%266%266%267%266%267%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%266%266%266%267%266%267%331@@@@@@@@@%276%270%308%266%267%267%267%266%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%267%267%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%267%267%331@@@@@@@@@%276%270%308%267%266%266%266%266%331@@@@@@@@%276%270%308%267%266%266%267%266%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%266%267%266%266%266%267%331@@@@@@@@@%276%270%308%267%266%267%266%266%267%331@@@@@@@@@%276%270%308%266%267%267%266%266%267%331@@@@@@@@@%276%270%308%267%267%266%266%267%267%331@@@@@@@@@%303@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@"])
  fun op elf32_program_header_table_entry_accessors x = x
    val op elf32_program_header_table_entry_accessors =
    DT(((("elf_program_header_table",34),
        [("elf_program_header_table",
         [26,27,28,29,30,31,32,33])]),["DISK_THM"]),
       [read"%221%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%360%452$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@@%221%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%356%452$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@@%221%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%362%452$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@@%221%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%358%452$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@@%221%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%350%452$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@@%221%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%354%452$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@@%221%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%352%452$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@@%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%230%348%452$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@@@@@@@@"])
  fun op elf32_program_header_table_entry_fn_updates x = x
    val op elf32_program_header_table_entry_fn_updates =
    DT(((("elf_program_header_table",43),
        [("elf_program_header_table",
         [35,36,37,38,39,40,41,42])]),["DISK_THM"]),
       [read"%221%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%361$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$8$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%357$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$8$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%363$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$6@$8$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%359$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$6@$5@$8$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%351$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$6@$5@$4@$8$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%355$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$6@$5@$4@$3@$8$2@@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%353$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$6@$5@$4@$3@$2@$8$1@@$0@@|@|@|@|@|@|@|@|@|@@%186%118%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83%231%349$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%452$7@$6@$5@$4@$3@$2@$1@$8$0@@@|@|@|@|@|@|@|@|@|@@@@@@@@"])
  fun op elf32_program_header_table_entry_accfupds x = x
    val op elf32_program_header_table_entry_accfupds =
    DT(((("elf_program_header_table",44),
        [("bool",[25,26,56,181]),
         ("elf_program_header_table",[21,22,23,34,43])]),["DISK_THM"]),
       [read"%221%186%118%180%87%230%360%357$1@$0@@@%360$0@@|@|@@%221%186%118%180%87%230%360%363$1@$0@@@%360$0@@|@|@@%221%186%118%180%87%230%360%359$1@$0@@@%360$0@@|@|@@%221%186%118%180%87%230%360%351$1@$0@@@%360$0@@|@|@@%221%186%118%180%87%230%360%355$1@$0@@@%360$0@@|@|@@%221%186%118%180%87%230%360%353$1@$0@@@%360$0@@|@|@@%221%186%118%180%87%230%360%349$1@$0@@@%360$0@@|@|@@%221%186%118%180%87%230%356%361$1@$0@@@%356$0@@|@|@@%221%186%118%180%87%230%356%363$1@$0@@@%356$0@@|@|@@%221%186%118%180%87%230%356%359$1@$0@@@%356$0@@|@|@@%221%186%118%180%87%230%356%351$1@$0@@@%356$0@@|@|@@%221%186%118%180%87%230%356%355$1@$0@@@%356$0@@|@|@@%221%186%118%180%87%230%356%353$1@$0@@@%356$0@@|@|@@%221%186%118%180%87%230%356%349$1@$0@@@%356$0@@|@|@@%221%186%118%180%87%230%362%361$1@$0@@@%362$0@@|@|@@%221%186%118%180%87%230%362%357$1@$0@@@%362$0@@|@|@@%221%186%118%180%87%230%362%359$1@$0@@@%362$0@@|@|@@%221%186%118%180%87%230%362%351$1@$0@@@%362$0@@|@|@@%221%186%118%180%87%230%362%355$1@$0@@@%362$0@@|@|@@%221%186%118%180%87%230%362%353$1@$0@@@%362$0@@|@|@@%221%186%118%180%87%230%362%349$1@$0@@@%362$0@@|@|@@%221%186%118%180%87%230%358%361$1@$0@@@%358$0@@|@|@@%221%186%118%180%87%230%358%357$1@$0@@@%358$0@@|@|@@%221%186%118%180%87%230%358%363$1@$0@@@%358$0@@|@|@@%221%186%118%180%87%230%358%351$1@$0@@@%358$0@@|@|@@%221%186%118%180%87%230%358%355$1@$0@@@%358$0@@|@|@@%221%186%118%180%87%230%358%353$1@$0@@@%358$0@@|@|@@%221%186%118%180%87%230%358%349$1@$0@@@%358$0@@|@|@@%221%186%118%180%87%230%350%361$1@$0@@@%350$0@@|@|@@%221%186%118%180%87%230%350%357$1@$0@@@%350$0@@|@|@@%221%186%118%180%87%230%350%363$1@$0@@@%350$0@@|@|@@%221%186%118%180%87%230%350%359$1@$0@@@%350$0@@|@|@@%221%186%118%180%87%230%350%355$1@$0@@@%350$0@@|@|@@%221%186%118%180%87%230%350%353$1@$0@@@%350$0@@|@|@@%221%186%118%180%87%230%350%349$1@$0@@@%350$0@@|@|@@%221%186%118%180%87%230%354%361$1@$0@@@%354$0@@|@|@@%221%186%118%180%87%230%354%357$1@$0@@@%354$0@@|@|@@%221%186%118%180%87%230%354%363$1@$0@@@%354$0@@|@|@@%221%186%118%180%87%230%354%359$1@$0@@@%354$0@@|@|@@%221%186%118%180%87%230%354%351$1@$0@@@%354$0@@|@|@@%221%186%118%180%87%230%354%353$1@$0@@@%354$0@@|@|@@%221%186%118%180%87%230%354%349$1@$0@@@%354$0@@|@|@@%221%186%118%180%87%230%352%361$1@$0@@@%352$0@@|@|@@%221%186%118%180%87%230%352%357$1@$0@@@%352$0@@|@|@@%221%186%118%180%87%230%352%363$1@$0@@@%352$0@@|@|@@%221%186%118%180%87%230%352%359$1@$0@@@%352$0@@|@|@@%221%186%118%180%87%230%352%351$1@$0@@@%352$0@@|@|@@%221%186%118%180%87%230%352%355$1@$0@@@%352$0@@|@|@@%221%186%118%180%87%230%352%349$1@$0@@@%352$0@@|@|@@%221%186%118%180%87%230%348%361$1@$0@@@%348$0@@|@|@@%221%186%118%180%87%230%348%357$1@$0@@@%348$0@@|@|@@%221%186%118%180%87%230%348%363$1@$0@@@%348$0@@|@|@@%221%186%118%180%87%230%348%359$1@$0@@@%348$0@@|@|@@%221%186%118%180%87%230%348%351$1@$0@@@%348$0@@|@|@@%221%186%118%180%87%230%348%355$1@$0@@@%348$0@@|@|@@%221%186%118%180%87%230%348%353$1@$0@@@%348$0@@|@|@@%221%186%118%180%87%230%360%361$1@$0@@@$1%360$0@@@|@|@@%221%186%118%180%87%230%356%357$1@$0@@@$1%356$0@@@|@|@@%221%186%118%180%87%230%362%363$1@$0@@@$1%362$0@@@|@|@@%221%186%118%180%87%230%358%359$1@$0@@@$1%358$0@@@|@|@@%221%186%118%180%87%230%350%351$1@$0@@@$1%350$0@@@|@|@@%221%186%118%180%87%230%354%355$1@$0@@@$1%354$0@@@|@|@@%221%186%118%180%87%230%352%353$1@$0@@@$1%352$0@@@|@|@@%186%118%180%87%230%348%349$1@$0@@@$1%348$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_program_header_table_entry_fupdfupds x = x
    val op elf32_program_header_table_entry_fupdfupds =
    DT(((("elf_program_header_table",45),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_program_header_table",[21,22,23,43])]),["DISK_THM"]),
       [read"%221%186%133%186%118%180%87%231%361$1@%361$2@$0@@@%361%428$1@$2@@$0@@|@|@|@@%221%186%133%186%118%180%87%231%357$1@%357$2@$0@@@%357%428$1@$2@@$0@@|@|@|@@%221%186%133%186%118%180%87%231%363$1@%363$2@$0@@@%363%428$1@$2@@$0@@|@|@|@@%221%186%133%186%118%180%87%231%359$1@%359$2@$0@@@%359%428$1@$2@@$0@@|@|@|@@%221%186%133%186%118%180%87%231%351$1@%351$2@$0@@@%351%428$1@$2@@$0@@|@|@|@@%221%186%133%186%118%180%87%231%355$1@%355$2@$0@@@%355%428$1@$2@@$0@@|@|@|@@%221%186%133%186%118%180%87%231%353$1@%353$2@$0@@@%353%428$1@$2@@$0@@|@|@|@@%186%133%186%118%180%87%231%349$1@%349$2@$0@@@%349%428$1@$2@@$0@@|@|@|@@@@@@@@"])
  fun op elf32_program_header_table_entry_fupdfupds_comp x = x
    val op elf32_program_header_table_entry_fupdfupds_comp =
    DT(((("elf_program_header_table",46),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_program_header_table",[21,22,23,43])]),["DISK_THM"]),
       [read"%221%221%186%133%186%118%243%430%361$0@@%361$1@@@%361%428$0@$1@@@|@|@@%183%134%186%133%186%118%241%429%361$0@@%429%361$1@@$2@@@%429%361%428$0@$1@@@$2@@|@|@|@@@%221%221%186%133%186%118%243%430%357$0@@%357$1@@@%357%428$0@$1@@@|@|@@%183%134%186%133%186%118%241%429%357$0@@%429%357$1@@$2@@@%429%357%428$0@$1@@@$2@@|@|@|@@@%221%221%186%133%186%118%243%430%363$0@@%363$1@@@%363%428$0@$1@@@|@|@@%183%134%186%133%186%118%241%429%363$0@@%429%363$1@@$2@@@%429%363%428$0@$1@@@$2@@|@|@|@@@%221%221%186%133%186%118%243%430%359$0@@%359$1@@@%359%428$0@$1@@@|@|@@%183%134%186%133%186%118%241%429%359$0@@%429%359$1@@$2@@@%429%359%428$0@$1@@@$2@@|@|@|@@@%221%221%186%133%186%118%243%430%351$0@@%351$1@@@%351%428$0@$1@@@|@|@@%183%134%186%133%186%118%241%429%351$0@@%429%351$1@@$2@@@%429%351%428$0@$1@@@$2@@|@|@|@@@%221%221%186%133%186%118%243%430%355$0@@%355$1@@@%355%428$0@$1@@@|@|@@%183%134%186%133%186%118%241%429%355$0@@%429%355$1@@$2@@@%429%355%428$0@$1@@@$2@@|@|@|@@@%221%221%186%133%186%118%243%430%353$0@@%353$1@@@%353%428$0@$1@@@|@|@@%183%134%186%133%186%118%241%429%353$0@@%429%353$1@@$2@@@%429%353%428$0@$1@@@$2@@|@|@|@@@%221%186%133%186%118%243%430%349$0@@%349$1@@@%349%428$0@$1@@@|@|@@%183%134%186%133%186%118%241%429%349$0@@%429%349$1@@$2@@@%429%349%428$0@$1@@@$2@@|@|@|@@@@@@@@@"])
  fun op elf32_program_header_table_entry_fupdcanon x = x
    val op elf32_program_header_table_entry_fupdcanon =
    DT(((("elf_program_header_table",47),
        [("bool",[25,26,56,181]),
         ("elf_program_header_table",[21,22,23,43])]),["DISK_THM"]),
       [read"%221%186%133%186%118%180%87%231%357$1@%361$2@$0@@@%361$2@%357$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%363$1@%361$2@$0@@@%361$2@%363$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%363$1@%357$2@$0@@@%357$2@%363$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%359$1@%361$2@$0@@@%361$2@%359$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%359$1@%357$2@$0@@@%357$2@%359$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%359$1@%363$2@$0@@@%363$2@%359$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%351$1@%361$2@$0@@@%361$2@%351$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%351$1@%357$2@$0@@@%357$2@%351$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%351$1@%363$2@$0@@@%363$2@%351$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%351$1@%359$2@$0@@@%359$2@%351$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%355$1@%361$2@$0@@@%361$2@%355$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%355$1@%357$2@$0@@@%357$2@%355$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%355$1@%363$2@$0@@@%363$2@%355$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%355$1@%359$2@$0@@@%359$2@%355$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%355$1@%351$2@$0@@@%351$2@%355$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%353$1@%361$2@$0@@@%361$2@%353$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%353$1@%357$2@$0@@@%357$2@%353$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%353$1@%363$2@$0@@@%363$2@%353$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%353$1@%359$2@$0@@@%359$2@%353$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%353$1@%351$2@$0@@@%351$2@%353$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%353$1@%355$2@$0@@@%355$2@%353$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%349$1@%361$2@$0@@@%361$2@%349$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%349$1@%357$2@$0@@@%357$2@%349$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%349$1@%363$2@$0@@@%363$2@%349$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%349$1@%359$2@$0@@@%359$2@%349$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%349$1@%351$2@$0@@@%351$2@%349$1@$0@@@|@|@|@@%221%186%133%186%118%180%87%231%349$1@%355$2@$0@@@%355$2@%349$1@$0@@@|@|@|@@%186%133%186%118%180%87%231%349$1@%353$2@$0@@@%353$2@%349$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_program_header_table_entry_fupdcanon_comp x = x
    val op elf32_program_header_table_entry_fupdcanon_comp =
    DT(((("elf_program_header_table",48),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_program_header_table",[21,22,23,43])]),["DISK_THM"]),
       [read"%221%221%186%133%186%118%243%430%357$0@@%361$1@@@%430%361$1@@%357$0@@@|@|@@%183%134%186%133%186%118%241%429%357$0@@%429%361$1@@$2@@@%429%361$1@@%429%357$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%363$0@@%361$1@@@%430%361$1@@%363$0@@@|@|@@%183%134%186%133%186%118%241%429%363$0@@%429%361$1@@$2@@@%429%361$1@@%429%363$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%363$0@@%357$1@@@%430%357$1@@%363$0@@@|@|@@%183%134%186%133%186%118%241%429%363$0@@%429%357$1@@$2@@@%429%357$1@@%429%363$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%359$0@@%361$1@@@%430%361$1@@%359$0@@@|@|@@%183%134%186%133%186%118%241%429%359$0@@%429%361$1@@$2@@@%429%361$1@@%429%359$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%359$0@@%357$1@@@%430%357$1@@%359$0@@@|@|@@%183%134%186%133%186%118%241%429%359$0@@%429%357$1@@$2@@@%429%357$1@@%429%359$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%359$0@@%363$1@@@%430%363$1@@%359$0@@@|@|@@%183%134%186%133%186%118%241%429%359$0@@%429%363$1@@$2@@@%429%363$1@@%429%359$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%351$0@@%361$1@@@%430%361$1@@%351$0@@@|@|@@%183%134%186%133%186%118%241%429%351$0@@%429%361$1@@$2@@@%429%361$1@@%429%351$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%351$0@@%357$1@@@%430%357$1@@%351$0@@@|@|@@%183%134%186%133%186%118%241%429%351$0@@%429%357$1@@$2@@@%429%357$1@@%429%351$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%351$0@@%363$1@@@%430%363$1@@%351$0@@@|@|@@%183%134%186%133%186%118%241%429%351$0@@%429%363$1@@$2@@@%429%363$1@@%429%351$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%351$0@@%359$1@@@%430%359$1@@%351$0@@@|@|@@%183%134%186%133%186%118%241%429%351$0@@%429%359$1@@$2@@@%429%359$1@@%429%351$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%355$0@@%361$1@@@%430%361$1@@%355$0@@@|@|@@%183%134%186%133%186%118%241%429%355$0@@%429%361$1@@$2@@@%429%361$1@@%429%355$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%355$0@@%357$1@@@%430%357$1@@%355$0@@@|@|@@%183%134%186%133%186%118%241%429%355$0@@%429%357$1@@$2@@@%429%357$1@@%429%355$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%355$0@@%363$1@@@%430%363$1@@%355$0@@@|@|@@%183%134%186%133%186%118%241%429%355$0@@%429%363$1@@$2@@@%429%363$1@@%429%355$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%355$0@@%359$1@@@%430%359$1@@%355$0@@@|@|@@%183%134%186%133%186%118%241%429%355$0@@%429%359$1@@$2@@@%429%359$1@@%429%355$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%355$0@@%351$1@@@%430%351$1@@%355$0@@@|@|@@%183%134%186%133%186%118%241%429%355$0@@%429%351$1@@$2@@@%429%351$1@@%429%355$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%353$0@@%361$1@@@%430%361$1@@%353$0@@@|@|@@%183%134%186%133%186%118%241%429%353$0@@%429%361$1@@$2@@@%429%361$1@@%429%353$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%353$0@@%357$1@@@%430%357$1@@%353$0@@@|@|@@%183%134%186%133%186%118%241%429%353$0@@%429%357$1@@$2@@@%429%357$1@@%429%353$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%353$0@@%363$1@@@%430%363$1@@%353$0@@@|@|@@%183%134%186%133%186%118%241%429%353$0@@%429%363$1@@$2@@@%429%363$1@@%429%353$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%353$0@@%359$1@@@%430%359$1@@%353$0@@@|@|@@%183%134%186%133%186%118%241%429%353$0@@%429%359$1@@$2@@@%429%359$1@@%429%353$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%353$0@@%351$1@@@%430%351$1@@%353$0@@@|@|@@%183%134%186%133%186%118%241%429%353$0@@%429%351$1@@$2@@@%429%351$1@@%429%353$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%353$0@@%355$1@@@%430%355$1@@%353$0@@@|@|@@%183%134%186%133%186%118%241%429%353$0@@%429%355$1@@$2@@@%429%355$1@@%429%353$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%349$0@@%361$1@@@%430%361$1@@%349$0@@@|@|@@%183%134%186%133%186%118%241%429%349$0@@%429%361$1@@$2@@@%429%361$1@@%429%349$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%349$0@@%357$1@@@%430%357$1@@%349$0@@@|@|@@%183%134%186%133%186%118%241%429%349$0@@%429%357$1@@$2@@@%429%357$1@@%429%349$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%349$0@@%363$1@@@%430%363$1@@%349$0@@@|@|@@%183%134%186%133%186%118%241%429%349$0@@%429%363$1@@$2@@@%429%363$1@@%429%349$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%349$0@@%359$1@@@%430%359$1@@%349$0@@@|@|@@%183%134%186%133%186%118%241%429%349$0@@%429%359$1@@$2@@@%429%359$1@@%429%349$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%349$0@@%351$1@@@%430%351$1@@%349$0@@@|@|@@%183%134%186%133%186%118%241%429%349$0@@%429%351$1@@$2@@@%429%351$1@@%429%349$0@@$2@@@|@|@|@@@%221%221%186%133%186%118%243%430%349$0@@%355$1@@@%430%355$1@@%349$0@@@|@|@@%183%134%186%133%186%118%241%429%349$0@@%429%355$1@@$2@@@%429%355$1@@%429%349$0@@$2@@@|@|@|@@@%221%186%133%186%118%243%430%349$0@@%353$1@@@%430%353$1@@%349$0@@@|@|@@%183%134%186%133%186%118%241%429%349$0@@%429%353$1@@$2@@@%429%353$1@@%429%349$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_program_header_table_entry_component_equality x = x
    val op elf32_program_header_table_entry_component_equality =
    DT(((("elf_program_header_table",49),
        [("bool",[25,26,51,56,63,181]),
         ("elf_program_header_table",[21,22,23,34]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%180%89%180%91%227%231$1@$0@@%221%230%360$1@@%360$0@@@%221%230%356$1@@%356$0@@@%221%230%362$1@@%362$0@@@%221%230%358$1@@%358$0@@@%221%230%350$1@@%350$0@@@%221%230%354$1@@%354$0@@@%221%230%352$1@@%352$0@@@%230%348$1@@%348$0@@@@@@@@@@|@|@"])
  fun op elf32_program_header_table_entry_updates_eq_literal x = x
    val op elf32_program_header_table_entry_updates_eq_literal =
    DT(((("elf_program_header_table",50),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_program_header_table",[21,22,23,43])]),["DISK_THM"]),
       [read"%180%87%179%83%179%79%179%73%179%67%179%61%179%55%179%49%179%47%231%361%294$7@@%357%294$6@@%363%294$5@@%359%294$4@@%351%294$3@@%355%294$2@@%353%294$1@@%349%294$0@@$8@@@@@@@@@%361%294$7@@%357%294$6@@%363%294$5@@%359%294$4@@%351%294$3@@%355%294$2@@%353%294$1@@%349%294$0@@%264@@@@@@@@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_literal_nchotomy x = x
    val op elf32_program_header_table_entry_literal_nchotomy =
    DT(((("elf_program_header_table",51),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_program_header_table",[21,22,23,43]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%180%87%254%83%254%79%254%73%254%67%254%61%254%55%254%49%254%47%231$8@%361%294$7@@%357%294$6@@%363%294$5@@%359%294$4@@%351%294$3@@%355%294$2@@%353%294$1@@%349%294$0@@%264@@@@@@@@@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf32_program_header_table_entry x = x
    val op FORALL_elf32_program_header_table_entry =
    DT(((("elf_program_header_table",52),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_program_header_table",[21,22,23,43]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%189%6%227%180%87$1$0@|@@%179%83%179%79%179%73%179%67%179%61%179%55%179%49%179%47$8%361%294$7@@%357%294$6@@%363%294$5@@%359%294$4@@%351%294$3@@%355%294$2@@%353%294$1@@%349%294$0@@%264@@@@@@@@@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf32_program_header_table_entry x = x
    val op EXISTS_elf32_program_header_table_entry =
    DT(((("elf_program_header_table",53),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_program_header_table",[21,22,23,43]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%189%6%227%255%87$1$0@|@@%254%83%254%79%254%73%254%67%254%61%254%55%254%49%254%47$8%361%294$7@@%357%294$6@@%363%294$5@@%359%294$4@@%351%294$3@@%355%294$2@@%353%294$1@@%349%294$0@@%264@@@@@@@@@|@|@|@|@|@|@|@|@@|@"])
  fun op elf32_program_header_table_entry_literal_11 x = x
    val op elf32_program_header_table_entry_literal_11 =
    DT(((("elf_program_header_table",54),
        [("combin",[12]),
         ("elf_program_header_table",[44,49])]),["DISK_THM"]),
       [read"%179%84%179%80%179%75%179%69%179%63%179%57%179%51%179%55%179%85%179%81%179%77%179%71%179%65%179%59%179%53%179%61%227%231%361%294$15@@%357%294$14@@%363%294$13@@%359%294$12@@%351%294$11@@%355%294$10@@%353%294$9@@%349%294$8@@%264@@@@@@@@@%361%294$7@@%357%294$6@@%363%294$5@@%359%294$4@@%351%294$3@@%355%294$2@@%353%294$1@@%349%294$0@@%264@@@@@@@@@@%221%230$15@$7@@%221%230$14@$6@@%221%230$13@$5@@%221%230$12@$4@@%221%230$11@$3@@%221%230$10@$2@@%221%230$9@$1@@%230$8@$0@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf32_program_header_table_entry x = x
    val op datatype_elf32_program_header_table_entry =
    DT(((("elf_program_header_table",55),
        [("bool",[25,171])]),["DISK_THM"]),
       [read"%283%158%104@%102@%100@%103@%101@%97@%99@%98@%96@@"])
  fun op elf32_program_header_table_entry_11 x = x
    val op elf32_program_header_table_entry_11 =
    DT(((("elf_program_header_table",56),
        [("bool",[26,51,56,63,181]),
         ("elf_program_header_table",[21,22,23]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%179%11%179%15%179%18%179%22%179%26%179%30%179%34%179%38%179%12%179%16%179%20%179%24%179%28%179%32%179%36%179%40%227%231%452$15@$14@$13@$12@$11@$10@$9@$8@@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%221%230$15@$7@@%221%230$14@$6@@%221%230$13@$5@@%221%230$12@$4@@%221%230$11@$3@@%221%230$10@$2@@%221%230$9@$1@@%230$8@$0@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_case_cong x = x
    val op elf32_program_header_table_entry_case_cong =
    DT(((("elf_program_header_table",57),
        [("bool",[26,181]),
         ("elf_program_header_table",[21,22,23,24])]),["DISK_THM"]),
       [read"%180%2%180%4%188%120%252%221%231$2@$1@@%179%11%179%15%179%18%179%22%179%26%179%30%179%34%179%38%252%231$9@%452$7@$6@$5@$4@$3@$2@$1@$0@@@%224$8$7@$6@$5@$4@$3@$2@$1@$0@@%122$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@@@%224%347$2@$0@@%347$1@%122@@@|@|@|@"])
  fun op elf32_program_header_table_entry_nchotomy x = x
    val op elf32_program_header_table_entry_nchotomy =
    DT(((("elf_program_header_table",58),
        [("bool",[26,181]),
         ("elf_program_header_table",[21,22,23])]),["DISK_THM"]),
       [read"%180%94%254%47%254%49%254%55%254%61%254%67%254%73%254%79%254%83%231$8@%452$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_Axiom x = x
    val op elf32_program_header_table_entry_Axiom =
    DT(((("elf_program_header_table",59),
        [("bool",[26,181]),("elf_program_header_table",[21,22,23]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%188%120%257%130%179%11%179%15%179%18%179%22%179%26%179%30%179%34%179%38%224$8%452$7@$6@$5@$4@$3@$2@$1@$0@@@$9$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_program_header_table_entry_induction x = x
    val op elf32_program_header_table_entry_induction =
    DT(((("elf_program_header_table",60),
        [("bool",[26]),
         ("elf_program_header_table",[21,22,23])]),["DISK_THM"]),
       [read"%189%6%252%179%47%179%49%179%55%179%61%179%67%179%73%179%79%179%83$8%452$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@@%180%87$1$0@|@@|@"])
  fun op elf64_program_header_table_entry_accessors x = x
    val op elf64_program_header_table_entry_accessors =
    DT(((("elf_program_header_table",77),
        [("elf_program_header_table",
         [69,70,71,72,73,74,75,76])]),["DISK_THM"]),
       [read"%221%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%230%378%453$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@@%221%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%230%370%453$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@@%221%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%229%374%453$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@@%221%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%229%380%453$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@@%221%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%229%376%453$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@@%221%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%229%368%453$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@@%221%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%229%372%453$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@@%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%229%366%453$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@@@@@@@@"])
  fun op elf64_program_header_table_entry_fn_updates x = x
    val op elf64_program_header_table_entry_fn_updates =
    DT(((("elf_program_header_table",86),
        [("elf_program_header_table",
         [78,79,80,81,82,83,84,85])]),["DISK_THM"]),
       [read"%221%186%118%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%379$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$8$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%186%118%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%371$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$8$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%185%117%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%375$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$6@$8$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%185%117%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%381$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$6@$5@$8$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%185%117%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%377$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$6@$5@$4@$8$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%185%117%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%369$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$6@$5@$4@$3@$8$2@@$1@$0@@|@|@|@|@|@|@|@|@|@@%221%185%117%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%373$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$6@$5@$4@$3@$2@$8$1@@$0@@|@|@|@|@|@|@|@|@|@@%185%117%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82%232%367$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%453$7@$6@$5@$4@$3@$2@$1@$8$0@@@|@|@|@|@|@|@|@|@|@@@@@@@@"])
  fun op elf64_program_header_table_entry_accfupds x = x
    val op elf64_program_header_table_entry_accfupds =
    DT(((("elf_program_header_table",87),
        [("bool",[25,26,56,181]),
         ("elf_program_header_table",[64,65,66,77,86])]),["DISK_THM"]),
       [read"%221%186%118%181%88%230%378%371$1@$0@@@%378$0@@|@|@@%221%185%117%181%88%230%378%375$1@$0@@@%378$0@@|@|@@%221%185%117%181%88%230%378%381$1@$0@@@%378$0@@|@|@@%221%185%117%181%88%230%378%377$1@$0@@@%378$0@@|@|@@%221%185%117%181%88%230%378%369$1@$0@@@%378$0@@|@|@@%221%185%117%181%88%230%378%373$1@$0@@@%378$0@@|@|@@%221%185%117%181%88%230%378%367$1@$0@@@%378$0@@|@|@@%221%186%118%181%88%230%370%379$1@$0@@@%370$0@@|@|@@%221%185%117%181%88%230%370%375$1@$0@@@%370$0@@|@|@@%221%185%117%181%88%230%370%381$1@$0@@@%370$0@@|@|@@%221%185%117%181%88%230%370%377$1@$0@@@%370$0@@|@|@@%221%185%117%181%88%230%370%369$1@$0@@@%370$0@@|@|@@%221%185%117%181%88%230%370%373$1@$0@@@%370$0@@|@|@@%221%185%117%181%88%230%370%367$1@$0@@@%370$0@@|@|@@%221%186%118%181%88%229%374%379$1@$0@@@%374$0@@|@|@@%221%186%118%181%88%229%374%371$1@$0@@@%374$0@@|@|@@%221%185%117%181%88%229%374%381$1@$0@@@%374$0@@|@|@@%221%185%117%181%88%229%374%377$1@$0@@@%374$0@@|@|@@%221%185%117%181%88%229%374%369$1@$0@@@%374$0@@|@|@@%221%185%117%181%88%229%374%373$1@$0@@@%374$0@@|@|@@%221%185%117%181%88%229%374%367$1@$0@@@%374$0@@|@|@@%221%186%118%181%88%229%380%379$1@$0@@@%380$0@@|@|@@%221%186%118%181%88%229%380%371$1@$0@@@%380$0@@|@|@@%221%185%117%181%88%229%380%375$1@$0@@@%380$0@@|@|@@%221%185%117%181%88%229%380%377$1@$0@@@%380$0@@|@|@@%221%185%117%181%88%229%380%369$1@$0@@@%380$0@@|@|@@%221%185%117%181%88%229%380%373$1@$0@@@%380$0@@|@|@@%221%185%117%181%88%229%380%367$1@$0@@@%380$0@@|@|@@%221%186%118%181%88%229%376%379$1@$0@@@%376$0@@|@|@@%221%186%118%181%88%229%376%371$1@$0@@@%376$0@@|@|@@%221%185%117%181%88%229%376%375$1@$0@@@%376$0@@|@|@@%221%185%117%181%88%229%376%381$1@$0@@@%376$0@@|@|@@%221%185%117%181%88%229%376%369$1@$0@@@%376$0@@|@|@@%221%185%117%181%88%229%376%373$1@$0@@@%376$0@@|@|@@%221%185%117%181%88%229%376%367$1@$0@@@%376$0@@|@|@@%221%186%118%181%88%229%368%379$1@$0@@@%368$0@@|@|@@%221%186%118%181%88%229%368%371$1@$0@@@%368$0@@|@|@@%221%185%117%181%88%229%368%375$1@$0@@@%368$0@@|@|@@%221%185%117%181%88%229%368%381$1@$0@@@%368$0@@|@|@@%221%185%117%181%88%229%368%377$1@$0@@@%368$0@@|@|@@%221%185%117%181%88%229%368%373$1@$0@@@%368$0@@|@|@@%221%185%117%181%88%229%368%367$1@$0@@@%368$0@@|@|@@%221%186%118%181%88%229%372%379$1@$0@@@%372$0@@|@|@@%221%186%118%181%88%229%372%371$1@$0@@@%372$0@@|@|@@%221%185%117%181%88%229%372%375$1@$0@@@%372$0@@|@|@@%221%185%117%181%88%229%372%381$1@$0@@@%372$0@@|@|@@%221%185%117%181%88%229%372%377$1@$0@@@%372$0@@|@|@@%221%185%117%181%88%229%372%369$1@$0@@@%372$0@@|@|@@%221%185%117%181%88%229%372%367$1@$0@@@%372$0@@|@|@@%221%186%118%181%88%229%366%379$1@$0@@@%366$0@@|@|@@%221%186%118%181%88%229%366%371$1@$0@@@%366$0@@|@|@@%221%185%117%181%88%229%366%375$1@$0@@@%366$0@@|@|@@%221%185%117%181%88%229%366%381$1@$0@@@%366$0@@|@|@@%221%185%117%181%88%229%366%377$1@$0@@@%366$0@@|@|@@%221%185%117%181%88%229%366%369$1@$0@@@%366$0@@|@|@@%221%185%117%181%88%229%366%373$1@$0@@@%366$0@@|@|@@%221%186%118%181%88%230%378%379$1@$0@@@$1%378$0@@@|@|@@%221%186%118%181%88%230%370%371$1@$0@@@$1%370$0@@@|@|@@%221%185%117%181%88%229%374%375$1@$0@@@$1%374$0@@@|@|@@%221%185%117%181%88%229%380%381$1@$0@@@$1%380$0@@@|@|@@%221%185%117%181%88%229%376%377$1@$0@@@$1%376$0@@@|@|@@%221%185%117%181%88%229%368%369$1@$0@@@$1%368$0@@@|@|@@%221%185%117%181%88%229%372%373$1@$0@@@$1%372$0@@@|@|@@%185%117%181%88%229%366%367$1@$0@@@$1%366$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_program_header_table_entry_fupdfupds x = x
    val op elf64_program_header_table_entry_fupdfupds =
    DT(((("elf_program_header_table",88),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_program_header_table",[64,65,66,86])]),["DISK_THM"]),
       [read"%221%186%133%186%118%181%88%232%379$1@%379$2@$0@@@%379%428$1@$2@@$0@@|@|@|@@%221%186%133%186%118%181%88%232%371$1@%371$2@$0@@@%371%428$1@$2@@$0@@|@|@|@@%221%185%132%185%117%181%88%232%375$1@%375$2@$0@@@%375%427$1@$2@@$0@@|@|@|@@%221%185%132%185%117%181%88%232%381$1@%381$2@$0@@@%381%427$1@$2@@$0@@|@|@|@@%221%185%132%185%117%181%88%232%377$1@%377$2@$0@@@%377%427$1@$2@@$0@@|@|@|@@%221%185%132%185%117%181%88%232%369$1@%369$2@$0@@@%369%427$1@$2@@$0@@|@|@|@@%221%185%132%185%117%181%88%232%373$1@%373$2@$0@@@%373%427$1@$2@@$0@@|@|@|@@%185%132%185%117%181%88%232%367$1@%367$2@$0@@@%367%427$1@$2@@$0@@|@|@|@@@@@@@@"])
  fun op elf64_program_header_table_entry_fupdfupds_comp x = x
    val op elf64_program_header_table_entry_fupdfupds_comp =
    DT(((("elf_program_header_table",89),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_program_header_table",[64,65,66,86])]),["DISK_THM"]),
       [read"%221%221%186%133%186%118%244%432%379$0@@%379$1@@@%379%428$0@$1@@@|@|@@%184%135%186%133%186%118%242%431%379$0@@%431%379$1@@$2@@@%431%379%428$0@$1@@@$2@@|@|@|@@@%221%221%186%133%186%118%244%432%371$0@@%371$1@@@%371%428$0@$1@@@|@|@@%184%135%186%133%186%118%242%431%371$0@@%431%371$1@@$2@@@%431%371%428$0@$1@@@$2@@|@|@|@@@%221%221%185%132%185%117%244%432%375$0@@%375$1@@@%375%427$0@$1@@@|@|@@%184%135%185%132%185%117%242%431%375$0@@%431%375$1@@$2@@@%431%375%427$0@$1@@@$2@@|@|@|@@@%221%221%185%132%185%117%244%432%381$0@@%381$1@@@%381%427$0@$1@@@|@|@@%184%135%185%132%185%117%242%431%381$0@@%431%381$1@@$2@@@%431%381%427$0@$1@@@$2@@|@|@|@@@%221%221%185%132%185%117%244%432%377$0@@%377$1@@@%377%427$0@$1@@@|@|@@%184%135%185%132%185%117%242%431%377$0@@%431%377$1@@$2@@@%431%377%427$0@$1@@@$2@@|@|@|@@@%221%221%185%132%185%117%244%432%369$0@@%369$1@@@%369%427$0@$1@@@|@|@@%184%135%185%132%185%117%242%431%369$0@@%431%369$1@@$2@@@%431%369%427$0@$1@@@$2@@|@|@|@@@%221%221%185%132%185%117%244%432%373$0@@%373$1@@@%373%427$0@$1@@@|@|@@%184%135%185%132%185%117%242%431%373$0@@%431%373$1@@$2@@@%431%373%427$0@$1@@@$2@@|@|@|@@@%221%185%132%185%117%244%432%367$0@@%367$1@@@%367%427$0@$1@@@|@|@@%184%135%185%132%185%117%242%431%367$0@@%431%367$1@@$2@@@%431%367%427$0@$1@@@$2@@|@|@|@@@@@@@@@"])
  fun op elf64_program_header_table_entry_fupdcanon x = x
    val op elf64_program_header_table_entry_fupdcanon =
    DT(((("elf_program_header_table",90),
        [("bool",[25,26,56,181]),
         ("elf_program_header_table",[64,65,66,86])]),["DISK_THM"]),
       [read"%221%186%133%186%118%181%88%232%371$1@%379$2@$0@@@%379$2@%371$1@$0@@@|@|@|@@%221%186%133%185%117%181%88%232%375$1@%379$2@$0@@@%379$2@%375$1@$0@@@|@|@|@@%221%186%133%185%117%181%88%232%375$1@%371$2@$0@@@%371$2@%375$1@$0@@@|@|@|@@%221%186%133%185%117%181%88%232%381$1@%379$2@$0@@@%379$2@%381$1@$0@@@|@|@|@@%221%186%133%185%117%181%88%232%381$1@%371$2@$0@@@%371$2@%381$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%381$1@%375$2@$0@@@%375$2@%381$1@$0@@@|@|@|@@%221%186%133%185%117%181%88%232%377$1@%379$2@$0@@@%379$2@%377$1@$0@@@|@|@|@@%221%186%133%185%117%181%88%232%377$1@%371$2@$0@@@%371$2@%377$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%377$1@%375$2@$0@@@%375$2@%377$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%377$1@%381$2@$0@@@%381$2@%377$1@$0@@@|@|@|@@%221%186%133%185%117%181%88%232%369$1@%379$2@$0@@@%379$2@%369$1@$0@@@|@|@|@@%221%186%133%185%117%181%88%232%369$1@%371$2@$0@@@%371$2@%369$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%369$1@%375$2@$0@@@%375$2@%369$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%369$1@%381$2@$0@@@%381$2@%369$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%369$1@%377$2@$0@@@%377$2@%369$1@$0@@@|@|@|@@%221%186%133%185%117%181%88%232%373$1@%379$2@$0@@@%379$2@%373$1@$0@@@|@|@|@@%221%186%133%185%117%181%88%232%373$1@%371$2@$0@@@%371$2@%373$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%373$1@%375$2@$0@@@%375$2@%373$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%373$1@%381$2@$0@@@%381$2@%373$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%373$1@%377$2@$0@@@%377$2@%373$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%373$1@%369$2@$0@@@%369$2@%373$1@$0@@@|@|@|@@%221%186%133%185%117%181%88%232%367$1@%379$2@$0@@@%379$2@%367$1@$0@@@|@|@|@@%221%186%133%185%117%181%88%232%367$1@%371$2@$0@@@%371$2@%367$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%367$1@%375$2@$0@@@%375$2@%367$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%367$1@%381$2@$0@@@%381$2@%367$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%367$1@%377$2@$0@@@%377$2@%367$1@$0@@@|@|@|@@%221%185%132%185%117%181%88%232%367$1@%369$2@$0@@@%369$2@%367$1@$0@@@|@|@|@@%185%132%185%117%181%88%232%367$1@%373$2@$0@@@%373$2@%367$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_program_header_table_entry_fupdcanon_comp x = x
    val op elf64_program_header_table_entry_fupdcanon_comp =
    DT(((("elf_program_header_table",91),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_program_header_table",[64,65,66,86])]),["DISK_THM"]),
       [read"%221%221%186%133%186%118%244%432%371$0@@%379$1@@@%432%379$1@@%371$0@@@|@|@@%184%135%186%133%186%118%242%431%371$0@@%431%379$1@@$2@@@%431%379$1@@%431%371$0@@$2@@@|@|@|@@@%221%221%186%133%185%117%244%432%375$0@@%379$1@@@%432%379$1@@%375$0@@@|@|@@%184%135%186%133%185%117%242%431%375$0@@%431%379$1@@$2@@@%431%379$1@@%431%375$0@@$2@@@|@|@|@@@%221%221%186%133%185%117%244%432%375$0@@%371$1@@@%432%371$1@@%375$0@@@|@|@@%184%135%186%133%185%117%242%431%375$0@@%431%371$1@@$2@@@%431%371$1@@%431%375$0@@$2@@@|@|@|@@@%221%221%186%133%185%117%244%432%381$0@@%379$1@@@%432%379$1@@%381$0@@@|@|@@%184%135%186%133%185%117%242%431%381$0@@%431%379$1@@$2@@@%431%379$1@@%431%381$0@@$2@@@|@|@|@@@%221%221%186%133%185%117%244%432%381$0@@%371$1@@@%432%371$1@@%381$0@@@|@|@@%184%135%186%133%185%117%242%431%381$0@@%431%371$1@@$2@@@%431%371$1@@%431%381$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%381$0@@%375$1@@@%432%375$1@@%381$0@@@|@|@@%184%135%185%132%185%117%242%431%381$0@@%431%375$1@@$2@@@%431%375$1@@%431%381$0@@$2@@@|@|@|@@@%221%221%186%133%185%117%244%432%377$0@@%379$1@@@%432%379$1@@%377$0@@@|@|@@%184%135%186%133%185%117%242%431%377$0@@%431%379$1@@$2@@@%431%379$1@@%431%377$0@@$2@@@|@|@|@@@%221%221%186%133%185%117%244%432%377$0@@%371$1@@@%432%371$1@@%377$0@@@|@|@@%184%135%186%133%185%117%242%431%377$0@@%431%371$1@@$2@@@%431%371$1@@%431%377$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%377$0@@%375$1@@@%432%375$1@@%377$0@@@|@|@@%184%135%185%132%185%117%242%431%377$0@@%431%375$1@@$2@@@%431%375$1@@%431%377$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%377$0@@%381$1@@@%432%381$1@@%377$0@@@|@|@@%184%135%185%132%185%117%242%431%377$0@@%431%381$1@@$2@@@%431%381$1@@%431%377$0@@$2@@@|@|@|@@@%221%221%186%133%185%117%244%432%369$0@@%379$1@@@%432%379$1@@%369$0@@@|@|@@%184%135%186%133%185%117%242%431%369$0@@%431%379$1@@$2@@@%431%379$1@@%431%369$0@@$2@@@|@|@|@@@%221%221%186%133%185%117%244%432%369$0@@%371$1@@@%432%371$1@@%369$0@@@|@|@@%184%135%186%133%185%117%242%431%369$0@@%431%371$1@@$2@@@%431%371$1@@%431%369$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%369$0@@%375$1@@@%432%375$1@@%369$0@@@|@|@@%184%135%185%132%185%117%242%431%369$0@@%431%375$1@@$2@@@%431%375$1@@%431%369$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%369$0@@%381$1@@@%432%381$1@@%369$0@@@|@|@@%184%135%185%132%185%117%242%431%369$0@@%431%381$1@@$2@@@%431%381$1@@%431%369$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%369$0@@%377$1@@@%432%377$1@@%369$0@@@|@|@@%184%135%185%132%185%117%242%431%369$0@@%431%377$1@@$2@@@%431%377$1@@%431%369$0@@$2@@@|@|@|@@@%221%221%186%133%185%117%244%432%373$0@@%379$1@@@%432%379$1@@%373$0@@@|@|@@%184%135%186%133%185%117%242%431%373$0@@%431%379$1@@$2@@@%431%379$1@@%431%373$0@@$2@@@|@|@|@@@%221%221%186%133%185%117%244%432%373$0@@%371$1@@@%432%371$1@@%373$0@@@|@|@@%184%135%186%133%185%117%242%431%373$0@@%431%371$1@@$2@@@%431%371$1@@%431%373$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%373$0@@%375$1@@@%432%375$1@@%373$0@@@|@|@@%184%135%185%132%185%117%242%431%373$0@@%431%375$1@@$2@@@%431%375$1@@%431%373$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%373$0@@%381$1@@@%432%381$1@@%373$0@@@|@|@@%184%135%185%132%185%117%242%431%373$0@@%431%381$1@@$2@@@%431%381$1@@%431%373$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%373$0@@%377$1@@@%432%377$1@@%373$0@@@|@|@@%184%135%185%132%185%117%242%431%373$0@@%431%377$1@@$2@@@%431%377$1@@%431%373$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%373$0@@%369$1@@@%432%369$1@@%373$0@@@|@|@@%184%135%185%132%185%117%242%431%373$0@@%431%369$1@@$2@@@%431%369$1@@%431%373$0@@$2@@@|@|@|@@@%221%221%186%133%185%117%244%432%367$0@@%379$1@@@%432%379$1@@%367$0@@@|@|@@%184%135%186%133%185%117%242%431%367$0@@%431%379$1@@$2@@@%431%379$1@@%431%367$0@@$2@@@|@|@|@@@%221%221%186%133%185%117%244%432%367$0@@%371$1@@@%432%371$1@@%367$0@@@|@|@@%184%135%186%133%185%117%242%431%367$0@@%431%371$1@@$2@@@%431%371$1@@%431%367$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%367$0@@%375$1@@@%432%375$1@@%367$0@@@|@|@@%184%135%185%132%185%117%242%431%367$0@@%431%375$1@@$2@@@%431%375$1@@%431%367$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%367$0@@%381$1@@@%432%381$1@@%367$0@@@|@|@@%184%135%185%132%185%117%242%431%367$0@@%431%381$1@@$2@@@%431%381$1@@%431%367$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%367$0@@%377$1@@@%432%377$1@@%367$0@@@|@|@@%184%135%185%132%185%117%242%431%367$0@@%431%377$1@@$2@@@%431%377$1@@%431%367$0@@$2@@@|@|@|@@@%221%221%185%132%185%117%244%432%367$0@@%369$1@@@%432%369$1@@%367$0@@@|@|@@%184%135%185%132%185%117%242%431%367$0@@%431%369$1@@$2@@@%431%369$1@@%431%367$0@@$2@@@|@|@|@@@%221%185%132%185%117%244%432%367$0@@%373$1@@@%432%373$1@@%367$0@@@|@|@@%184%135%185%132%185%117%242%431%367$0@@%431%373$1@@$2@@@%431%373$1@@%431%367$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_program_header_table_entry_component_equality x = x
    val op elf64_program_header_table_entry_component_equality =
    DT(((("elf_program_header_table",92),
        [("bool",[25,26,51,56,63,181]),
         ("elf_program_header_table",[64,65,66,77]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%181%90%181%92%227%232$1@$0@@%221%230%378$1@@%378$0@@@%221%230%370$1@@%370$0@@@%221%229%374$1@@%374$0@@@%221%229%380$1@@%380$0@@@%221%229%376$1@@%376$0@@@%221%229%368$1@@%368$0@@@%221%229%372$1@@%372$0@@@%229%366$1@@%366$0@@@@@@@@@@|@|@"])
  fun op elf64_program_header_table_entry_updates_eq_literal x = x
    val op elf64_program_header_table_entry_updates_eq_literal =
    DT(((("elf_program_header_table",93),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_program_header_table",[64,65,66,86])]),["DISK_THM"]),
       [read"%181%88%179%83%179%79%178%72%178%66%178%60%178%54%178%48%178%46%232%379%294$7@@%371%294$6@@%375%293$5@@%381%293$4@@%377%293$3@@%369%293$2@@%373%293$1@@%367%293$0@@$8@@@@@@@@@%379%294$7@@%371%294$6@@%375%293$5@@%381%293$4@@%377%293$3@@%369%293$2@@%373%293$1@@%367%293$0@@%265@@@@@@@@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_literal_nchotomy x = x
    val op elf64_program_header_table_entry_literal_nchotomy =
    DT(((("elf_program_header_table",94),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_program_header_table",[64,65,66,86]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%181%88%254%83%254%79%253%72%253%66%253%60%253%54%253%48%253%46%232$8@%379%294$7@@%371%294$6@@%375%293$5@@%381%293$4@@%377%293$3@@%369%293$2@@%373%293$1@@%367%293$0@@%265@@@@@@@@@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf64_program_header_table_entry x = x
    val op FORALL_elf64_program_header_table_entry =
    DT(((("elf_program_header_table",95),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_program_header_table",[64,65,66,86]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%190%7%227%181%88$1$0@|@@%179%83%179%79%178%72%178%66%178%60%178%54%178%48%178%46$8%379%294$7@@%371%294$6@@%375%293$5@@%381%293$4@@%377%293$3@@%369%293$2@@%373%293$1@@%367%293$0@@%265@@@@@@@@@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf64_program_header_table_entry x = x
    val op EXISTS_elf64_program_header_table_entry =
    DT(((("elf_program_header_table",96),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_program_header_table",[64,65,66,86]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%190%7%227%256%88$1$0@|@@%254%83%254%79%253%72%253%66%253%60%253%54%253%48%253%46$8%379%294$7@@%371%294$6@@%375%293$5@@%381%293$4@@%377%293$3@@%369%293$2@@%373%293$1@@%367%293$0@@%265@@@@@@@@@|@|@|@|@|@|@|@|@@|@"])
  fun op elf64_program_header_table_entry_literal_11 x = x
    val op elf64_program_header_table_entry_literal_11 =
    DT(((("elf_program_header_table",97),
        [("combin",[12]),
         ("elf_program_header_table",[87,92])]),["DISK_THM"]),
       [read"%179%84%179%80%178%74%178%68%178%62%178%56%178%50%178%54%179%85%179%81%178%76%178%70%178%64%178%58%178%52%178%60%227%232%379%294$15@@%371%294$14@@%375%293$13@@%381%293$12@@%377%293$11@@%369%293$10@@%373%293$9@@%367%293$8@@%265@@@@@@@@@%379%294$7@@%371%294$6@@%375%293$5@@%381%293$4@@%377%293$3@@%369%293$2@@%373%293$1@@%367%293$0@@%265@@@@@@@@@@%221%230$15@$7@@%221%230$14@$6@@%221%229$13@$5@@%221%229$12@$4@@%221%229$11@$3@@%221%229$10@$2@@%221%229$9@$1@@%229$8@$0@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf64_program_header_table_entry x = x
    val op datatype_elf64_program_header_table_entry =
    DT(((("elf_program_header_table",98),
        [("bool",[25,171])]),["DISK_THM"]),
       [read"%283%157%113@%111@%107@%109@%112@%110@%106@%108@%105@@"])
  fun op elf64_program_header_table_entry_11 x = x
    val op elf64_program_header_table_entry_11 =
    DT(((("elf_program_header_table",99),
        [("bool",[26,51,56,63,181]),
         ("elf_program_header_table",[64,65,66]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%179%11%179%15%178%17%178%21%178%25%178%29%178%33%178%37%179%12%179%16%178%19%178%23%178%27%178%31%178%35%178%39%227%232%453$15@$14@$13@$12@$11@$10@$9@$8@@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%221%230$15@$7@@%221%230$14@$6@@%221%229$13@$5@@%221%229$12@$4@@%221%229$11@$3@@%221%229$10@$2@@%221%229$9@$1@@%229$8@$0@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_case_cong x = x
    val op elf64_program_header_table_entry_case_cong =
    DT(((("elf_program_header_table",100),
        [("bool",[26,181]),
         ("elf_program_header_table",[64,65,66,67])]),["DISK_THM"]),
       [read"%181%3%181%5%187%119%252%221%232$2@$1@@%179%11%179%15%178%17%178%21%178%25%178%29%178%33%178%37%252%232$9@%453$7@$6@$5@$4@$3@$2@$1@$0@@@%224$8$7@$6@$5@$4@$3@$2@$1@$0@@%121$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@@@%224%365$2@$0@@%365$1@%121@@@|@|@|@"])
  fun op elf64_program_header_table_entry_nchotomy x = x
    val op elf64_program_header_table_entry_nchotomy =
    DT(((("elf_program_header_table",101),
        [("bool",[26,181]),
         ("elf_program_header_table",[64,65,66])]),["DISK_THM"]),
       [read"%181%95%254%47%254%49%253%54%253%60%253%66%253%72%253%78%253%82%232$8@%453$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_Axiom x = x
    val op elf64_program_header_table_entry_Axiom =
    DT(((("elf_program_header_table",102),
        [("bool",[26,181]),("elf_program_header_table",[64,65,66]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%187%119%259%131%179%11%179%15%178%17%178%21%178%25%178%29%178%33%178%37%224$8%453$7@$6@$5@$4@$3@$2@$1@$0@@@$9$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_program_header_table_entry_induction x = x
    val op elf64_program_header_table_entry_induction =
    DT(((("elf_program_header_table",103),
        [("bool",[26]),
         ("elf_program_header_table",[64,65,66])]),["DISK_THM"]),
       [read"%190%7%252%179%47%179%49%178%54%178%60%178%66%178%72%178%78%178%82$8%453$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@@%181%88$1$0@|@@|@"])
  fun op read_elf32_program_header_table'_ind x = x
    val op read_elf32_program_header_table'_ind =
    DT(((("elf_program_header_table",114),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%191%8%252%182%114%177%44%252%177%45%252%466%248%425$1@@%222@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%182%171%177%172$2$1@$0@|@|@@|@",
        read"%182%114%177%44%177%45%252%466%248%425$1@@%222@@@%9%217$2@$0@@%217$2@$1@@@|@|@|@",
        read"%328%9@"])
  fun op read_elf32_program_header_table'_def x = x
    val op read_elf32_program_header_table'_def =
    DT(((("elf_program_header_table",115),
        [("bool",[15,58,129]),("combin",[19]),
         ("elf_program_header_table",[112,113]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%182%114%177%44%234%440$1@$0@@%272%248%425$0@@%222@@%455%304@@%410%442$1@$0@@%326%115%45%401%440$3@$0@@%166%455%277$2@$0@@|@||@@@@|@|@",
        read"%182%114%177%44%177%45%252%466%248%425$1@@%222@@@%9%217$2@$0@@%217$2@$1@@@|@|@|@",
        read"%328%9@"])
  fun op read_elf64_program_header_table'_ind x = x
    val op read_elf64_program_header_table'_ind =
    DT(((("elf_program_header_table",118),
        [("bool",[25,27,53,54,63]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%191%8%252%182%114%177%44%252%177%45%252%466%248%425$1@@%222@@@$3$2@$0@@|@@$2$1@$0@@|@|@@%182%171%177%172$2$1@$0@|@|@@|@",
        read"%182%114%177%44%177%45%252%466%248%425$1@@%222@@@%9%217$2@$0@@%217$2@$1@@@|@|@|@",
        read"%328%9@"])
  fun op read_elf64_program_header_table'_def x = x
    val op read_elf64_program_header_table'_def =
    DT(((("elf_program_header_table",119),
        [("bool",[15,58,129]),("combin",[19]),
         ("elf_program_header_table",[116,117]),("pair",[49]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%182%114%177%44%235%447$1@$0@@%273%248%425$0@@%222@@%456%305@@%411%449$1@$0@@%327%116%45%403%447$3@$0@@%167%456%278$2@$0@@|@||@@@@|@|@",
        read"%182%114%177%44%177%45%252%466%248%425$1@@%222@@@%9%217$2@$0@@%217$2@$1@@@|@|@|@",
        read"%328%9@"])
  end
  val _ = DB.bindl "elf_program_header_table"
  [("elf_pt_null_def",elf_pt_null_def,DB.Def),
   ("elf_pt_load_def",elf_pt_load_def,DB.Def),
   ("elf_pt_dynamic_def",elf_pt_dynamic_def,DB.Def),
   ("elf_pt_interp_def",elf_pt_interp_def,DB.Def),
   ("elf_pt_note_def",elf_pt_note_def,DB.Def),
   ("elf_pt_shlib_def",elf_pt_shlib_def,DB.Def),
   ("elf_pt_phdr_def",elf_pt_phdr_def,DB.Def),
   ("elf_pt_tls_def",elf_pt_tls_def,DB.Def),
   ("elf_pt_loos_def",elf_pt_loos_def,DB.Def),
   ("elf_pt_hios_def",elf_pt_hios_def,DB.Def),
   ("elf_pt_loproc_def",elf_pt_loproc_def,DB.Def),
   ("elf_pt_hiproc_def",elf_pt_hiproc_def,DB.Def),
   ("elf_pf_x_def",elf_pf_x_def,DB.Def),
   ("elf_pf_w_def",elf_pf_w_def,DB.Def),
   ("elf_pf_r_def",elf_pf_r_def,DB.Def),
   ("elf_pf_maskos_def",elf_pf_maskos_def,DB.Def),
   ("elf_pf_maskproc_def",elf_pf_maskproc_def,DB.Def),
   ("exact_permissions_of_permission_def",
    exact_permissions_of_permission_def,
    DB.Def),
   ("allowable_permissions_of_permission_def",
    allowable_permissions_of_permission_def,
    DB.Def),
   ("string_of_elf_segment_permissions_def",
    string_of_elf_segment_permissions_def,
    DB.Def),
   ("elf32_program_header_table_entry_TY_DEF",
    elf32_program_header_table_entry_TY_DEF,
    DB.Def),
   ("elf32_program_header_table_entry_case_def",
    elf32_program_header_table_entry_case_def,
    DB.Def),
   ("elf32_program_header_table_entry_size_def",
    elf32_program_header_table_entry_size_def,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_type",
    elf32_program_header_table_entry_elf32_p_type,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_offset",
    elf32_program_header_table_entry_elf32_p_offset,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_vaddr",
    elf32_program_header_table_entry_elf32_p_vaddr,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_paddr",
    elf32_program_header_table_entry_elf32_p_paddr,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_filesz",
    elf32_program_header_table_entry_elf32_p_filesz,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_memsz",
    elf32_program_header_table_entry_elf32_p_memsz,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_flags",
    elf32_program_header_table_entry_elf32_p_flags,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_align",
    elf32_program_header_table_entry_elf32_p_align,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_type_fupd",
    elf32_program_header_table_entry_elf32_p_type_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_offset_fupd",
    elf32_program_header_table_entry_elf32_p_offset_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_vaddr_fupd",
    elf32_program_header_table_entry_elf32_p_vaddr_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_paddr_fupd",
    elf32_program_header_table_entry_elf32_p_paddr_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_filesz_fupd",
    elf32_program_header_table_entry_elf32_p_filesz_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_memsz_fupd",
    elf32_program_header_table_entry_elf32_p_memsz_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_flags_fupd",
    elf32_program_header_table_entry_elf32_p_flags_fupd,
    DB.Def),
   ("elf32_program_header_table_entry_elf32_p_align_fupd",
    elf32_program_header_table_entry_elf32_p_align_fupd,
    DB.Def),
   ("compare_elf32_program_header_table_entry_def",
    compare_elf32_program_header_table_entry_def,
    DB.Def),
   ("instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict_def",
    instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict_def,
    DB.Def),
   ("elf64_program_header_table_entry_TY_DEF",
    elf64_program_header_table_entry_TY_DEF,
    DB.Def),
   ("elf64_program_header_table_entry_case_def",
    elf64_program_header_table_entry_case_def,
    DB.Def),
   ("elf64_program_header_table_entry_size_def",
    elf64_program_header_table_entry_size_def,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_type",
    elf64_program_header_table_entry_elf64_p_type,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_flags",
    elf64_program_header_table_entry_elf64_p_flags,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_offset",
    elf64_program_header_table_entry_elf64_p_offset,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_vaddr",
    elf64_program_header_table_entry_elf64_p_vaddr,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_paddr",
    elf64_program_header_table_entry_elf64_p_paddr,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_filesz",
    elf64_program_header_table_entry_elf64_p_filesz,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_memsz",
    elf64_program_header_table_entry_elf64_p_memsz,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_align",
    elf64_program_header_table_entry_elf64_p_align,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_type_fupd",
    elf64_program_header_table_entry_elf64_p_type_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_flags_fupd",
    elf64_program_header_table_entry_elf64_p_flags_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_offset_fupd",
    elf64_program_header_table_entry_elf64_p_offset_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_vaddr_fupd",
    elf64_program_header_table_entry_elf64_p_vaddr_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_paddr_fupd",
    elf64_program_header_table_entry_elf64_p_paddr_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_filesz_fupd",
    elf64_program_header_table_entry_elf64_p_filesz_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_memsz_fupd",
    elf64_program_header_table_entry_elf64_p_memsz_fupd,
    DB.Def),
   ("elf64_program_header_table_entry_elf64_p_align_fupd",
    elf64_program_header_table_entry_elf64_p_align_fupd,
    DB.Def),
   ("compare_elf64_program_header_table_entry_def",
    compare_elf64_program_header_table_entry_def,
    DB.Def),
   ("instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict_def",
    instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict_def,
    DB.Def),
   ("bytes_of_elf32_program_header_table_entry_def",
    bytes_of_elf32_program_header_table_entry_def,
    DB.Def),
   ("bytes_of_elf64_program_header_table_entry_def",
    bytes_of_elf64_program_header_table_entry_def,
    DB.Def),
   ("read_elf32_program_header_table_entry_def",
    read_elf32_program_header_table_entry_def,
    DB.Def),
   ("read_elf64_program_header_table_entry_def",
    read_elf64_program_header_table_entry_def,
    DB.Def),
   ("bytes_of_elf32_program_header_table_def",
    bytes_of_elf32_program_header_table_def,
    DB.Def),
   ("bytes_of_elf64_program_header_table_def",
    bytes_of_elf64_program_header_table_def,
    DB.Def),
   ("read_elf32_program_header_table'_tupled_primitive_def",
    read_elf32_program_header_table'_tupled_primitive_def,
    DB.Def),
   ("read_elf32_program_header_table'_curried_def",
    read_elf32_program_header_table'_curried_def,
    DB.Def),
   ("read_elf64_program_header_table'_tupled_primitive_def",
    read_elf64_program_header_table'_tupled_primitive_def,
    DB.Def),
   ("read_elf64_program_header_table'_curried_def",
    read_elf64_program_header_table'_curried_def,
    DB.Def),
   ("read_elf32_program_header_table_def",
    read_elf32_program_header_table_def,
    DB.Def),
   ("read_elf64_program_header_table_def",
    read_elf64_program_header_table_def,
    DB.Def),
   ("get_elf32_dynamic_linked_def",get_elf32_dynamic_linked_def,DB.Def),
   ("get_elf64_dynamic_linked_def",get_elf64_dynamic_linked_def,DB.Def),
   ("get_elf32_static_linked_def",get_elf32_static_linked_def,DB.Def),
   ("get_elf64_static_linked_def",get_elf64_static_linked_def,DB.Def),
   ("get_elf32_requested_interpreter_def",
    get_elf32_requested_interpreter_def,
    DB.Def),
   ("get_elf64_requested_interpreter_def",
    get_elf64_requested_interpreter_def,
    DB.Def),
   ("elf32_program_header_table_entry_accessors",
    elf32_program_header_table_entry_accessors,
    DB.Thm),
   ("elf32_program_header_table_entry_fn_updates",
    elf32_program_header_table_entry_fn_updates,
    DB.Thm),
   ("elf32_program_header_table_entry_accfupds",
    elf32_program_header_table_entry_accfupds,
    DB.Thm),
   ("elf32_program_header_table_entry_fupdfupds",
    elf32_program_header_table_entry_fupdfupds,
    DB.Thm),
   ("elf32_program_header_table_entry_fupdfupds_comp",
    elf32_program_header_table_entry_fupdfupds_comp,
    DB.Thm),
   ("elf32_program_header_table_entry_fupdcanon",
    elf32_program_header_table_entry_fupdcanon,
    DB.Thm),
   ("elf32_program_header_table_entry_fupdcanon_comp",
    elf32_program_header_table_entry_fupdcanon_comp,
    DB.Thm),
   ("elf32_program_header_table_entry_component_equality",
    elf32_program_header_table_entry_component_equality,
    DB.Thm),
   ("elf32_program_header_table_entry_updates_eq_literal",
    elf32_program_header_table_entry_updates_eq_literal,
    DB.Thm),
   ("elf32_program_header_table_entry_literal_nchotomy",
    elf32_program_header_table_entry_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf32_program_header_table_entry",
    FORALL_elf32_program_header_table_entry,
    DB.Thm),
   ("EXISTS_elf32_program_header_table_entry",
    EXISTS_elf32_program_header_table_entry,
    DB.Thm),
   ("elf32_program_header_table_entry_literal_11",
    elf32_program_header_table_entry_literal_11,
    DB.Thm),
   ("datatype_elf32_program_header_table_entry",
    datatype_elf32_program_header_table_entry,
    DB.Thm),
   ("elf32_program_header_table_entry_11",
    elf32_program_header_table_entry_11,
    DB.Thm),
   ("elf32_program_header_table_entry_case_cong",
    elf32_program_header_table_entry_case_cong,
    DB.Thm),
   ("elf32_program_header_table_entry_nchotomy",
    elf32_program_header_table_entry_nchotomy,
    DB.Thm),
   ("elf32_program_header_table_entry_Axiom",
    elf32_program_header_table_entry_Axiom,
    DB.Thm),
   ("elf32_program_header_table_entry_induction",
    elf32_program_header_table_entry_induction,
    DB.Thm),
   ("elf64_program_header_table_entry_accessors",
    elf64_program_header_table_entry_accessors,
    DB.Thm),
   ("elf64_program_header_table_entry_fn_updates",
    elf64_program_header_table_entry_fn_updates,
    DB.Thm),
   ("elf64_program_header_table_entry_accfupds",
    elf64_program_header_table_entry_accfupds,
    DB.Thm),
   ("elf64_program_header_table_entry_fupdfupds",
    elf64_program_header_table_entry_fupdfupds,
    DB.Thm),
   ("elf64_program_header_table_entry_fupdfupds_comp",
    elf64_program_header_table_entry_fupdfupds_comp,
    DB.Thm),
   ("elf64_program_header_table_entry_fupdcanon",
    elf64_program_header_table_entry_fupdcanon,
    DB.Thm),
   ("elf64_program_header_table_entry_fupdcanon_comp",
    elf64_program_header_table_entry_fupdcanon_comp,
    DB.Thm),
   ("elf64_program_header_table_entry_component_equality",
    elf64_program_header_table_entry_component_equality,
    DB.Thm),
   ("elf64_program_header_table_entry_updates_eq_literal",
    elf64_program_header_table_entry_updates_eq_literal,
    DB.Thm),
   ("elf64_program_header_table_entry_literal_nchotomy",
    elf64_program_header_table_entry_literal_nchotomy,
    DB.Thm),
   ("FORALL_elf64_program_header_table_entry",
    FORALL_elf64_program_header_table_entry,
    DB.Thm),
   ("EXISTS_elf64_program_header_table_entry",
    EXISTS_elf64_program_header_table_entry,
    DB.Thm),
   ("elf64_program_header_table_entry_literal_11",
    elf64_program_header_table_entry_literal_11,
    DB.Thm),
   ("datatype_elf64_program_header_table_entry",
    datatype_elf64_program_header_table_entry,
    DB.Thm),
   ("elf64_program_header_table_entry_11",
    elf64_program_header_table_entry_11,
    DB.Thm),
   ("elf64_program_header_table_entry_case_cong",
    elf64_program_header_table_entry_case_cong,
    DB.Thm),
   ("elf64_program_header_table_entry_nchotomy",
    elf64_program_header_table_entry_nchotomy,
    DB.Thm),
   ("elf64_program_header_table_entry_Axiom",
    elf64_program_header_table_entry_Axiom,
    DB.Thm),
   ("elf64_program_header_table_entry_induction",
    elf64_program_header_table_entry_induction,
    DB.Thm),
   ("read_elf32_program_header_table'_ind",
    read_elf32_program_header_table'_ind,
    DB.Thm),
   ("read_elf32_program_header_table'_def",
    read_elf32_program_header_table'_def,
    DB.Thm),
   ("read_elf64_program_header_table'_ind",
    read_elf64_program_header_table'_ind,
    DB.Thm),
   ("read_elf64_program_header_table'_def",
    read_elf64_program_header_table'_def,
    DB.Thm)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("lem_setTheory.lem_set_grammars",
                          lem_setTheory.lem_set_grammars),
                         ("elf_types_native_uintTheory.elf_types_native_uint_grammars",
                          elf_types_native_uintTheory.elf_types_native_uint_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_null", (Term.prim_mk_const { Name = "elf_pt_null", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_null", (Term.prim_mk_const { Name = "elf_pt_null", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_load", (Term.prim_mk_const { Name = "elf_pt_load", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_load", (Term.prim_mk_const { Name = "elf_pt_load", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_dynamic", (Term.prim_mk_const { Name = "elf_pt_dynamic", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_dynamic", (Term.prim_mk_const { Name = "elf_pt_dynamic", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_interp", (Term.prim_mk_const { Name = "elf_pt_interp", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_interp", (Term.prim_mk_const { Name = "elf_pt_interp", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_note", (Term.prim_mk_const { Name = "elf_pt_note", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_note", (Term.prim_mk_const { Name = "elf_pt_note", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_shlib", (Term.prim_mk_const { Name = "elf_pt_shlib", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_shlib", (Term.prim_mk_const { Name = "elf_pt_shlib", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_phdr", (Term.prim_mk_const { Name = "elf_pt_phdr", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_phdr", (Term.prim_mk_const { Name = "elf_pt_phdr", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_tls", (Term.prim_mk_const { Name = "elf_pt_tls", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_tls", (Term.prim_mk_const { Name = "elf_pt_tls", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_loos", (Term.prim_mk_const { Name = "elf_pt_loos", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_loos", (Term.prim_mk_const { Name = "elf_pt_loos", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_hios", (Term.prim_mk_const { Name = "elf_pt_hios", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_hios", (Term.prim_mk_const { Name = "elf_pt_hios", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_loproc", (Term.prim_mk_const { Name = "elf_pt_loproc", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_loproc", (Term.prim_mk_const { Name = "elf_pt_loproc", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_hiproc", (Term.prim_mk_const { Name = "elf_pt_hiproc", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pt_hiproc", (Term.prim_mk_const { Name = "elf_pt_hiproc", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_x", (Term.prim_mk_const { Name = "elf_pf_x", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_x", (Term.prim_mk_const { Name = "elf_pf_x", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_w", (Term.prim_mk_const { Name = "elf_pf_w", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_w", (Term.prim_mk_const { Name = "elf_pf_w", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_r", (Term.prim_mk_const { Name = "elf_pf_r", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_r", (Term.prim_mk_const { Name = "elf_pf_r", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_maskos", (Term.prim_mk_const { Name = "elf_pf_maskos", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_maskos", (Term.prim_mk_const { Name = "elf_pf_maskos", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_maskproc", (Term.prim_mk_const { Name = "elf_pf_maskproc", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_pf_maskproc", (Term.prim_mk_const { Name = "elf_pf_maskproc", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("exact_permissions_of_permission", (Term.prim_mk_const { Name = "exact_permissions_of_permission", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("exact_permissions_of_permission", (Term.prim_mk_const { Name = "exact_permissions_of_permission", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("allowable_permissions_of_permission", (Term.prim_mk_const { Name = "allowable_permissions_of_permission", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("allowable_permissions_of_permission", (Term.prim_mk_const { Name = "allowable_permissions_of_permission", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf_segment_permissions", (Term.prim_mk_const { Name = "string_of_elf_segment_permissions", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf_segment_permissions", (Term.prim_mk_const { Name = "string_of_elf_segment_permissions", Thy = "elf_program_header_table"}))
  val _ = update_grms temp_add_type "elf32_program_header_table_entry"
  val _ = update_grms temp_add_type "elf32_program_header_table_entry"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_program_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_program_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_CASE", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_CASE", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_size", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_size", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_type", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_type", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_offset", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_offset", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_vaddr", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_vaddr", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_paddr", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_paddr", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_filesz", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_filesz", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_memsz", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_memsz", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_flags", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_flags", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_align", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_align", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_type_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_type_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_offset_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_offset_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_vaddr_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_vaddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_paddr_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_paddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_filesz_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_filesz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_memsz_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_memsz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_flags_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_flags_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry_elf32_p_align_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_align_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_type rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_offset rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_vaddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_vaddr rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_paddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_paddr rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_filesz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_filesz rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_memsz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_memsz rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_flags rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_p_align", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_align rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_type_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_type_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_offset_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_offset_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_vaddr_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_vaddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_paddr_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_paddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_filesz_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_filesz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_memsz_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_memsz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_flags_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_flags_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_p_align_fupd", (Term.prim_mk_const { Name = "elf32_program_header_table_entry_elf32_p_align_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_type_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_offset_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_vaddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_vaddr_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_paddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_paddr_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_filesz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_filesz_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_memsz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_memsz_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_flags_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_p_align", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf32_program_header_table_entry)). elf_program_header_table$elf32_program_header_table_entry_elf32_p_align_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_program_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "compare_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "compare_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict", Thy = "elf_program_header_table"}))
  val _ = update_grms temp_add_type "elf64_program_header_table_entry"
  val _ = update_grms temp_add_type "elf64_program_header_table_entry"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_program_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_program_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_CASE", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_CASE", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_size", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_size", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_type", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_type", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_flags", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_flags", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_offset", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_offset", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_vaddr", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_vaddr", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_paddr", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_paddr", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_filesz", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_filesz", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_memsz", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_memsz", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_align", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_align", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_type_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_type_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_flags_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_flags_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_offset_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_offset_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_vaddr_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_vaddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_paddr_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_paddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_filesz_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_filesz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_memsz_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_memsz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry_elf64_p_align_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_align_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_type rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_flags rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_offset rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_vaddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_vaddr rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_paddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_paddr rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_filesz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_filesz rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_memsz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_memsz rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_p_align", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_align rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_type_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_type_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_flags_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_flags_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_offset_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_offset_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_vaddr_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_vaddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_paddr_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_paddr_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_filesz_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_filesz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_memsz_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_memsz_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_p_align_fupd", (Term.prim_mk_const { Name = "elf64_program_header_table_entry_elf64_p_align_fupd", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_type_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_flags_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_offset", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_offset_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_vaddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_vaddr_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_paddr", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_paddr_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_filesz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_filesz_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_memsz", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_memsz_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_p_align", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_program_header_table$elf64_program_header_table_entry)). elf_program_header_table$elf64_program_header_table_entry_elf64_p_align_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_program_header_table_entry", (Term.prim_mk_const { Name = "recordtype.elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "compare_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("compare_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "compare_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "bytes_of_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "read_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table_entry", (Term.prim_mk_const { Name = "read_elf32_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "read_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table_entry", (Term.prim_mk_const { Name = "read_elf64_program_header_table_entry", Thy = "elf_program_header_table"}))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_program_header_table",Name="elf32_program_header_table"}, T"list" "list"
 [T"elf32_program_header_table_entry" "elf_program_header_table" []])
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_program_header_table",Name="elf64_program_header_table"}, T"list" "list"
 [T"elf64_program_header_table_entry" "elf_program_header_table" []])
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_program_header_table", (Term.prim_mk_const { Name = "bytes_of_elf32_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_program_header_table", (Term.prim_mk_const { Name = "bytes_of_elf32_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_program_header_table", (Term.prim_mk_const { Name = "bytes_of_elf64_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_program_header_table", (Term.prim_mk_const { Name = "bytes_of_elf64_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table'_tupled", (Term.prim_mk_const { Name = "read_elf32_program_header_table'_tupled", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table'_tupled", (Term.prim_mk_const { Name = "read_elf32_program_header_table'_tupled", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table'", (Term.prim_mk_const { Name = "read_elf32_program_header_table'", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table'", (Term.prim_mk_const { Name = "read_elf32_program_header_table'", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table'_tupled", (Term.prim_mk_const { Name = "read_elf64_program_header_table'_tupled", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table'_tupled", (Term.prim_mk_const { Name = "read_elf64_program_header_table'_tupled", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table'", (Term.prim_mk_const { Name = "read_elf64_program_header_table'", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table'", (Term.prim_mk_const { Name = "read_elf64_program_header_table'", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table", (Term.prim_mk_const { Name = "read_elf32_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_program_header_table", (Term.prim_mk_const { Name = "read_elf32_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table", (Term.prim_mk_const { Name = "read_elf64_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_program_header_table", (Term.prim_mk_const { Name = "read_elf64_program_header_table", Thy = "elf_program_header_table"}))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_program_header_table",Name="pht_print_bundle"}, T"prod" "pair"
 [(T"num" "num" [] --> T"list" "list" [T"char" "string" []]),
  (T"num" "num" [] --> T"list" "list" [T"char" "string" []])])
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_dynamic_linked", (Term.prim_mk_const { Name = "get_elf32_dynamic_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_dynamic_linked", (Term.prim_mk_const { Name = "get_elf32_dynamic_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_dynamic_linked", (Term.prim_mk_const { Name = "get_elf64_dynamic_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_dynamic_linked", (Term.prim_mk_const { Name = "get_elf64_dynamic_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_static_linked", (Term.prim_mk_const { Name = "get_elf32_static_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_static_linked", (Term.prim_mk_const { Name = "get_elf32_static_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_static_linked", (Term.prim_mk_const { Name = "get_elf64_static_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_static_linked", (Term.prim_mk_const { Name = "get_elf64_static_linked", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_requested_interpreter", (Term.prim_mk_const { Name = "get_elf32_requested_interpreter", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_requested_interpreter", (Term.prim_mk_const { Name = "get_elf32_requested_interpreter", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_requested_interpreter", (Term.prim_mk_const { Name = "get_elf64_requested_interpreter", Thy = "elf_program_header_table"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_requested_interpreter", (Term.prim_mk_const { Name = "get_elf64_requested_interpreter", Thy = "elf_program_header_table"}))
  val elf_program_header_table_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG elf32_program_header_table_entry_Axiom,
           case_def=elf32_program_header_table_entry_case_def,
           case_cong=elf32_program_header_table_entry_case_cong,
           induction=ORIG elf32_program_header_table_entry_induction,
           nchotomy=elf32_program_header_table_entry_nchotomy,
           size=SOME(Parse.Term`(elf_program_header_table$elf32_program_header_table_entry_size) :(elf_program_header_table$elf32_program_header_table_entry) ->
(num$num)`,
                     ORIG elf32_program_header_table_entry_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf32_program_header_table_entry_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf32_p_type",T"fcp" "cart"
                  [bool,
                   T"fcp" "bit0"
                    [T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"one" "one" []]]]]]]),
 ("elf32_p_offset",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"one" "one" []]]]]]]),
 ("elf32_p_vaddr",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_p_paddr",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_p_filesz",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"one" "one" []]]]]]]),
 ("elf32_p_memsz",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_p_flags",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_p_align",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]])] end,
           accessors=Drule.CONJUNCTS elf32_program_header_table_entry_accessors,
           updates=Drule.CONJUNCTS elf32_program_header_table_entry_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf32_program_header_table_entry_accessors, elf32_program_header_table_entry_updates_eq_literal, elf32_program_header_table_entry_accfupds, elf32_program_header_table_entry_fupdfupds, elf32_program_header_table_entry_literal_11, elf32_program_header_table_entry_fupdfupds_comp, elf32_program_header_table_entry_fupdcanon, elf32_program_header_table_entry_fupdcanon_comp] tyinfo0
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
          {ax=ORIG elf64_program_header_table_entry_Axiom,
           case_def=elf64_program_header_table_entry_case_def,
           case_cong=elf64_program_header_table_entry_case_cong,
           induction=ORIG elf64_program_header_table_entry_induction,
           nchotomy=elf64_program_header_table_entry_nchotomy,
           size=SOME(Parse.Term`(elf_program_header_table$elf64_program_header_table_entry_size) :(elf_program_header_table$elf64_program_header_table_entry) ->
(num$num)`,
                     ORIG elf64_program_header_table_entry_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf64_program_header_table_entry_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf64_p_type",T"fcp" "cart"
                  [bool,
                   T"fcp" "bit0"
                    [T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"one" "one" []]]]]]]),
 ("elf64_p_flags",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf64_p_offset",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"one" "one" []]]]]]]]),
 ("elf64_p_vaddr",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]]),
 ("elf64_p_paddr",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]]),
 ("elf64_p_filesz",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"fcp" "bit0"
                              [T"fcp" "bit0"
                                [T"one" "one" []]]]]]]]),
 ("elf64_p_memsz",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]]),
 ("elf64_p_align",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"fcp" "bit0"
                               [T"one" "one" []]]]]]]])] end,
           accessors=Drule.CONJUNCTS elf64_program_header_table_entry_accessors,
           updates=Drule.CONJUNCTS elf64_program_header_table_entry_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf64_program_header_table_entry_accessors, elf64_program_header_table_entry_updates_eq_literal, elf64_program_header_table_entry_accfupds, elf64_program_header_table_entry_fupdfupds, elf64_program_header_table_entry_literal_11, elf64_program_header_table_entry_fupdfupds_comp, elf64_program_header_table_entry_fupdcanon, elf64_program_header_table_entry_fupdcanon_comp] tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "elf_program_header_table",
    thydataty = "compute",
    data =
        "elf_program_header_table.elf_pt_null_def elf_program_header_table.read_elf64_program_header_table_def elf_program_header_table.get_elf64_requested_interpreter_def elf_program_header_table.get_elf32_requested_interpreter_def elf_program_header_table.get_elf64_static_linked_def elf_program_header_table.get_elf32_static_linked_def elf_program_header_table.get_elf64_dynamic_linked_def elf_program_header_table.get_elf32_dynamic_linked_def elf_program_header_table.read_elf32_program_header_table_def elf_program_header_table.read_elf32_program_header_table_entry_def elf_program_header_table.bytes_of_elf64_program_header_table_def elf_program_header_table.bytes_of_elf32_program_header_table_def elf_program_header_table.read_elf64_program_header_table_entry_def elf_program_header_table.instance_Basic_classes_Ord_Elf_program_header_table_elf32_program_header_table_entry_dict_def elf_program_header_table.bytes_of_elf64_program_header_table_entry_def elf_program_header_table.bytes_of_elf32_program_header_table_entry_def elf_program_header_table.instance_Basic_classes_Ord_Elf_program_header_table_elf64_program_header_table_entry_dict_def elf_program_header_table.compare_elf64_program_header_table_entry_def elf_program_header_table.string_of_elf_segment_permissions_def elf_program_header_table.compare_elf32_program_header_table_entry_def elf_program_header_table.elf_pt_tls_def elf_program_header_table.allowable_permissions_of_permission_def elf_program_header_table.exact_permissions_of_permission_def elf_program_header_table.elf_pf_maskproc_def elf_program_header_table.elf_pf_maskos_def elf_program_header_table.elf_pf_r_def elf_program_header_table.elf_pf_w_def elf_program_header_table.elf_pf_x_def elf_program_header_table.elf_pt_hiproc_def elf_program_header_table.elf_pt_loproc_def elf_program_header_table.elf_pt_hios_def elf_program_header_table.elf_pt_loos_def elf_program_header_table.elf_pt_phdr_def elf_program_header_table.elf_pt_shlib_def elf_program_header_table.elf_pt_note_def elf_program_header_table.elf_pt_dynamic_def elf_program_header_table.elf_pt_interp_def elf_program_header_table.elf_pt_load_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "elf_program_header_table"
end
