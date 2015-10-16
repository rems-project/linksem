structure abi_aarch64_relocationTheory :> abi_aarch64_relocationTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_aarch64_relocationTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open abi_utilitiesTheory
  in end;
  val _ = Theory.link_parents
          ("abi_aarch64_relocation",
          Arbnum.fromString "1445006145",
          Arbnum.fromString "116635")
          [("abi_utilities",
           Arbnum.fromString "1445006111",
           Arbnum.fromString "576129")];
  val _ = Theory.incorporate_types "abi_aarch64_relocation" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("num", "num"), ID("min", "fun"), ID("error", "error"),
   ID("finite_map", "fmap"), ID("pair", "prod"),
   ID("abi_utilities", "can_fail"),
   ID("abi_utilities", "integer_bit_width"),
   ID("abi_utilities", "relocation_operator_expression"),
   ID("integer", "int"), ID("fcp", "cart"), ID("fcp", "bit0"),
   ID("one", "one"), ID("min", "bool"), ID("elf_file", "elf64_file"),
   ID("elf_relocation", "elf64_relocation_a"), ID("bool", "!"),
   ID("pair", ","), ID("abi_utilities", "relocation_operator"),
   ID("abi_utilities", "relocation_operator2"), ID("num", "0"),
   ID("min", "="), ID("abi_utilities", "Apply"),
   ID("abi_utilities", "Apply2"), ID("arithmetic", "BIT1"),
   ID("arithmetic", "BIT2"), ID("string", "CHR"), ID("string", "char"),
   ID("bool", "COND"), ID("list", "CONS"), ID("list", "list"),
   ID("abi_utilities", "CanFail"), ID("abi_utilities", "CannotFail"),
   ID("abi_utilities", "DTPRel"), ID("abi_utilities", "Delta"),
   ID("bool", "F"), ID("finite_map", "FEMPTY"),
   ID("finite_map", "FUPDATE"), ID("abi_utilities", "G"),
   ID("abi_utilities", "GDat"), ID("abi_utilities", "GLDM"),
   ID("abi_utilities", "GTLSDesc"), ID("abi_utilities", "GTLSIdx"),
   ID("abi_utilities", "GTPRel"), ID("abi_utilities", "I12"),
   ID("abi_utilities", "I15"), ID("abi_utilities", "I16"),
   ID("abi_utilities", "I20"), ID("abi_utilities", "I27"),
   ID("abi_utilities", "I32"), ID("abi_utilities", "I48"),
   ID("abi_utilities", "I64"), ID("abi_utilities", "I8"),
   ID("abi_utilities", "Indirect"), ID("abi_utilities", "LDM"),
   ID("bool", "LET"), ID("abi_utilities", "Lift"),
   ID("abi_utilities", "Minus"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"), ID("abi_utilities", "Page"),
   ID("abi_utilities", "Plus"), ID("abi_utilities", "TLSDesc"),
   ID("abi_utilities", "TPRel"), ID("abi_utilities", "U12"),
   ID("abi_utilities", "U15"), ID("abi_utilities", "U16"),
   ID("abi_utilities", "U24"), ID("abi_utilities", "U32"),
   ID("abi_utilities", "U48"), ID("abi_utilities", "U64"),
   ID("arithmetic", "ZERO"),
   ID("abi_aarch64_relocation", "aarch64_le_reloc"),
   ID("abi_aarch64_relocation", "abi_aarch64_apply_relocation"),
   ID("elf_file", "elf64_file_elf64_file_header"),
   ID("elf_header", "elf64_header"),
   ID("elf_relocation", "elf64_relocation_a_elf64_ra_addend"),
   ID("elf_relocation", "elf64_relocation_a_elf64_ra_offset"),
   ID("error", "fail0"),
   ID("elf_relocation", "get_elf64_relocation_a_type"),
   ID("integer", "int_add"), ID("integer", "int_sub"),
   ID("elf_header", "is_elf64_relocatable_file"),
   ID("memory_image", "noop_reloc_apply"),
   ID("abi_aarch64_relocation", "r_aarch64_abs16"),
   ID("abi_aarch64_relocation", "r_aarch64_abs32"),
   ID("abi_aarch64_relocation", "r_aarch64_abs64"),
   ID("abi_aarch64_relocation", "r_aarch64_add_abs_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_add_tprel_hi12"),
   ID("abi_aarch64_relocation", "r_aarch64_add_tprel_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_add_tprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_adr_got_page"),
   ID("abi_aarch64_relocation", "r_aarch64_adr_prel_lo21"),
   ID("abi_aarch64_relocation", "r_aarch64_adr_prel_pg_hi21"),
   ID("abi_aarch64_relocation", "r_aarch64_adr_prel_pg_hi21_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_call26"),
   ID("abi_aarch64_relocation", "r_aarch64_condbr19"),
   ID("abi_aarch64_relocation", "r_aarch64_copy"),
   ID("abi_aarch64_relocation", "r_aarch64_glob_dat"),
   ID("abi_aarch64_relocation", "r_aarch64_got_ld64_gotoff_lo15"),
   ID("abi_aarch64_relocation", "r_aarch64_got_ld_prel19"),
   ID("abi_aarch64_relocation", "r_aarch64_gotrel32"),
   ID("abi_aarch64_relocation", "r_aarch64_gotrel64"),
   ID("abi_aarch64_relocation", "r_aarch64_irelative"),
   ID("abi_aarch64_relocation", "r_aarch64_jump26"),
   ID("abi_aarch64_relocation", "r_aarch64_jump_slot"),
   ID("abi_aarch64_relocation", "r_aarch64_ld64_got_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_ld64_gotpage_lo15"),
   ID("abi_aarch64_relocation", "r_aarch64_ld_prel_lo19"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst128_abs_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst128_tprel_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst128_tprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst16_abs_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst16_tprel_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst16_tprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst32_abs_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst32_tprel_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst32_tprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst64_abs_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst64_tprel_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst64_tprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst8_abs_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst8_tprel_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_ldst8_tprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_gotoff_g0"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_gotoff_g0_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_gotoff_g1"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_gotoff_g1_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_gotoff_g2"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_gotoff_g2_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_gotoff_g3"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_prel_g0"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_prel_g0_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_prel_g1"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_prel_g1_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_prel_g2"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_prel_g2_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_prel_g3"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_sabs_g0"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_sabs_g1"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_sabs_g2"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_uabs_g0"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_uabs_g0_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_uabs_g1"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_uabs_g1_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_uabs_g2"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_uabs_g2_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_movw_uabs_g3"),
   ID("abi_aarch64_relocation", "r_aarch64_none"),
   ID("abi_aarch64_relocation", "r_aarch64_prel16"),
   ID("abi_aarch64_relocation", "r_aarch64_prel32"),
   ID("abi_aarch64_relocation", "r_aarch64_prel64"),
   ID("abi_aarch64_relocation", "r_aarch64_relative"),
   ID("abi_aarch64_relocation", "r_aarch64_tls_dtpmod64"),
   ID("abi_aarch64_relocation", "r_aarch64_tls_dtprel64"),
   ID("abi_aarch64_relocation", "r_aarch64_tls_tprel64"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsdesc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsdesc_add"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsdesc_add_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsdesc_adr_page21"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsdesc_adr_prel21"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsdesc_call"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsdesc_ld64_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsdesc_ld_prel19"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsdesc_ldr"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsdesc_off_g0_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsdesc_off_g1"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsgd_add_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsgd_adr_page21"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsgd_adr_prel21"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsgd_movw_g0_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsgd_movw_g1"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsie_movw_gottprel_g0_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsie_movw_gottprel_g1"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsie_movw_gottprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsie_movw_gottprel_page21"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsie_movw_gottprel_prel19"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_add_dtprel_hi12"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_add_dtprel_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_add_dtprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_add_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_adr_page21"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_adr_prel21"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_ld_prel19"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_ldst128_dtprel_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_ldst128_dtprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_ldst16_dtprel_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_ldst16_dtprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_ldst32_dtprel_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_ldst32_dtprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_ldst64_dtprel_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_ldst64_dtprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_ldst8_dtprel_lo12"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_ldst8_dtprel_lo12_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_movw_dtprel_g0"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_movw_dtprel_g0_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_movw_dtprel_g1"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_movw_dtprel_g1_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_movw_dtprel_g2"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_movw_g0_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsld_movw_g1"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsle_movw_tprel_g0"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsle_movw_tprel_g0_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsle_movw_tprel_g1"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsle_movw_tprel_g1_nc"),
   ID("abi_aarch64_relocation", "r_aarch64_tlsle_movw_tprel_g2"),
   ID("abi_aarch64_relocation", "r_aarch64_tstbr14"),
   ID("abi_aarch64_relocation", "r_aarch64_withdrawn"),
   ID("error", "return"), ID("integer_word", "w2i")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYV "'a", TYOP [5, 1], TYOP [6], TYOP [4, 3, 2], TYOP [8],
   TYOP [7, 5], TYOP [4, 6, 4], TYOP [11], TYOP [10, 8], TYOP [10, 9],
   TYOP [10, 10], TYOP [10, 11], TYOP [10, 12], TYOP [10, 13], TYOP [12],
   TYOP [9, 15, 14], TYOP [3, 16, 7], TYOP [2, 17], TYOP [13],
   TYOP [1, 19, 18], TYOP [1, 5, 20], TYOP [1, 5, 21], TYOP [1, 5, 22],
   TYOP [14], TYOP [1, 24, 23], TYV "'e", TYOP [1, 26, 26], TYV "'d",
   TYOP [1, 28, 27], TYV "'c", TYOP [1, 30, 29], TYOP [4, 0, 31], TYV "'b",
   TYOP [1, 33, 32], TYOP [1, 1, 34], TYOP [4, 15, 35], TYOP [1, 0, 36],
   TYOP [1, 19, 15], TYOP [1, 38, 15], TYOP [1, 24, 15], TYOP [1, 40, 15],
   TYOP [1, 5, 15], TYOP [1, 42, 15], TYOP [1, 0, 15], TYOP [1, 44, 15],
   TYOP [1, 35, 36], TYOP [1, 15, 46], TYOP [4, 16, 7], TYOP [1, 7, 48],
   TYOP [1, 16, 49], TYOP [1, 2, 4], TYOP [1, 3, 51], TYOP [1, 31, 32],
   TYOP [1, 0, 53], TYOP [17], TYOP [4, 55, 6], TYOP [1, 6, 56],
   TYOP [1, 55, 57], TYOP [4, 6, 6], TYOP [18], TYOP [4, 60, 59],
   TYOP [1, 59, 61], TYOP [1, 60, 62], TYOP [1, 4, 7], TYOP [1, 6, 64],
   TYOP [1, 6, 59], TYOP [1, 6, 66], TYOP [1, 18, 15], TYOP [1, 18, 68],
   TYOP [1, 0, 44], TYOP [1, 36, 15], TYOP [1, 36, 71], TYOP [1, 56, 6],
   TYOP [1, 61, 6], TYOP [1, 0, 0], TYOP [26], TYOP [1, 0, 76],
   TYOP [1, 18, 18], TYOP [1, 18, 78], TYOP [1, 15, 79], TYOP [1, 36, 36],
   TYOP [1, 36, 81], TYOP [1, 15, 82], TYOP [29, 76], TYOP [1, 84, 84],
   TYOP [1, 76, 85], TYOP [1, 48, 17], TYOP [1, 17, 87], TYOP [1, 16, 18],
   TYOP [1, 89, 89], TYOP [1, 5, 18], TYOP [1, 91, 91], TYOP [1, 0, 18],
   TYOP [1, 93, 93], TYOP [1, 6, 18], TYOP [1, 95, 95], TYOP [1, 5, 6],
   TYOP [1, 59, 6], TYOP [74], TYOP [1, 19, 99], TYOP [1, 24, 16],
   TYOP [1, 84, 18], TYOP [1, 24, 0], TYOP [1, 5, 5], TYOP [1, 5, 104],
   TYOP [1, 99, 15], TYOP [1, 17, 18], TYOP [1, 16, 5]]
  end
  val _ = Theory.incorporate_consts "abi_aarch64_relocation" tyvector
     [("r_aarch64_withdrawn", 0), ("r_aarch64_tstbr14", 0),
      ("r_aarch64_tlsle_movw_tprel_g2", 0),
      ("r_aarch64_tlsle_movw_tprel_g1_nc", 0),
      ("r_aarch64_tlsle_movw_tprel_g1", 0),
      ("r_aarch64_tlsle_movw_tprel_g0_nc", 0),
      ("r_aarch64_tlsle_movw_tprel_g0", 0), ("r_aarch64_tlsld_movw_g1", 0),
      ("r_aarch64_tlsld_movw_g0_nc", 0),
      ("r_aarch64_tlsld_movw_dtprel_g2", 0),
      ("r_aarch64_tlsld_movw_dtprel_g1_nc", 0),
      ("r_aarch64_tlsld_movw_dtprel_g1", 0),
      ("r_aarch64_tlsld_movw_dtprel_g0_nc", 0),
      ("r_aarch64_tlsld_movw_dtprel_g0", 0),
      ("r_aarch64_tlsld_ldst8_dtprel_lo12_nc", 0),
      ("r_aarch64_tlsld_ldst8_dtprel_lo12", 0),
      ("r_aarch64_tlsld_ldst64_dtprel_lo12_nc", 0),
      ("r_aarch64_tlsld_ldst64_dtprel_lo12", 0),
      ("r_aarch64_tlsld_ldst32_dtprel_lo12_nc", 0),
      ("r_aarch64_tlsld_ldst32_dtprel_lo12", 0),
      ("r_aarch64_tlsld_ldst16_dtprel_lo12_nc", 0),
      ("r_aarch64_tlsld_ldst16_dtprel_lo12", 0),
      ("r_aarch64_tlsld_ldst128_dtprel_lo12_nc", 0),
      ("r_aarch64_tlsld_ldst128_dtprel_lo12", 0),
      ("r_aarch64_tlsld_ld_prel19", 0), ("r_aarch64_tlsld_adr_prel21", 0),
      ("r_aarch64_tlsld_adr_page21", 0),
      ("r_aarch64_tlsld_add_lo12_nc", 0),
      ("r_aarch64_tlsld_add_dtprel_lo12_nc", 0),
      ("r_aarch64_tlsld_add_dtprel_lo12", 0),
      ("r_aarch64_tlsld_add_dtprel_hi12", 0),
      ("r_aarch64_tlsie_movw_gottprel_prel19", 0),
      ("r_aarch64_tlsie_movw_gottprel_page21", 0),
      ("r_aarch64_tlsie_movw_gottprel_lo12_nc", 0),
      ("r_aarch64_tlsie_movw_gottprel_g1", 0),
      ("r_aarch64_tlsie_movw_gottprel_g0_nc", 0),
      ("r_aarch64_tlsgd_movw_g1", 0), ("r_aarch64_tlsgd_movw_g0_nc", 0),
      ("r_aarch64_tlsgd_adr_prel21", 0), ("r_aarch64_tlsgd_adr_page21", 0),
      ("r_aarch64_tlsgd_add_lo12_nc", 0), ("r_aarch64_tlsdesc_off_g1", 0),
      ("r_aarch64_tlsdesc_off_g0_nc", 0), ("r_aarch64_tlsdesc_ldr", 0),
      ("r_aarch64_tlsdesc_ld_prel19", 0),
      ("r_aarch64_tlsdesc_ld64_lo12", 0), ("r_aarch64_tlsdesc_call", 0),
      ("r_aarch64_tlsdesc_adr_prel21", 0),
      ("r_aarch64_tlsdesc_adr_page21", 0),
      ("r_aarch64_tlsdesc_add_lo12", 0), ("r_aarch64_tlsdesc_add", 0),
      ("r_aarch64_tlsdesc", 0), ("r_aarch64_tls_tprel64", 0),
      ("r_aarch64_tls_dtprel64", 0), ("r_aarch64_tls_dtpmod64", 0),
      ("r_aarch64_relative", 0), ("r_aarch64_prel64", 0),
      ("r_aarch64_prel32", 0), ("r_aarch64_prel16", 0),
      ("r_aarch64_none", 0), ("r_aarch64_movw_uabs_g3", 0),
      ("r_aarch64_movw_uabs_g2_nc", 0), ("r_aarch64_movw_uabs_g2", 0),
      ("r_aarch64_movw_uabs_g1_nc", 0), ("r_aarch64_movw_uabs_g1", 0),
      ("r_aarch64_movw_uabs_g0_nc", 0), ("r_aarch64_movw_uabs_g0", 0),
      ("r_aarch64_movw_sabs_g2", 0), ("r_aarch64_movw_sabs_g1", 0),
      ("r_aarch64_movw_sabs_g0", 0), ("r_aarch64_movw_prel_g3", 0),
      ("r_aarch64_movw_prel_g2_nc", 0), ("r_aarch64_movw_prel_g2", 0),
      ("r_aarch64_movw_prel_g1_nc", 0), ("r_aarch64_movw_prel_g1", 0),
      ("r_aarch64_movw_prel_g0_nc", 0), ("r_aarch64_movw_prel_g0", 0),
      ("r_aarch64_movw_gotoff_g3", 0), ("r_aarch64_movw_gotoff_g2_nc", 0),
      ("r_aarch64_movw_gotoff_g2", 0), ("r_aarch64_movw_gotoff_g1_nc", 0),
      ("r_aarch64_movw_gotoff_g1", 0), ("r_aarch64_movw_gotoff_g0_nc", 0),
      ("r_aarch64_movw_gotoff_g0", 0),
      ("r_aarch64_ldst8_tprel_lo12_nc", 0),
      ("r_aarch64_ldst8_tprel_lo12", 0),
      ("r_aarch64_ldst8_abs_lo12_nc", 0),
      ("r_aarch64_ldst64_tprel_lo12_nc", 0),
      ("r_aarch64_ldst64_tprel_lo12", 0),
      ("r_aarch64_ldst64_abs_lo12_nc", 0),
      ("r_aarch64_ldst32_tprel_lo12_nc", 0),
      ("r_aarch64_ldst32_tprel_lo12", 0),
      ("r_aarch64_ldst32_abs_lo12_nc", 0),
      ("r_aarch64_ldst16_tprel_lo12_nc", 0),
      ("r_aarch64_ldst16_tprel_lo12", 0),
      ("r_aarch64_ldst16_abs_lo12_nc", 0),
      ("r_aarch64_ldst128_tprel_lo12_nc", 0),
      ("r_aarch64_ldst128_tprel_lo12", 0),
      ("r_aarch64_ldst128_abs_lo12_nc", 0), ("r_aarch64_ld_prel_lo19", 0),
      ("r_aarch64_ld64_gotpage_lo15", 0),
      ("r_aarch64_ld64_got_lo12_nc", 0), ("r_aarch64_jump_slot", 0),
      ("r_aarch64_jump26", 0), ("r_aarch64_irelative", 0),
      ("r_aarch64_gotrel64", 0), ("r_aarch64_gotrel32", 0),
      ("r_aarch64_got_ld_prel19", 0),
      ("r_aarch64_got_ld64_gotoff_lo15", 0), ("r_aarch64_glob_dat", 0),
      ("r_aarch64_copy", 0), ("r_aarch64_condbr19", 0),
      ("r_aarch64_call26", 0), ("r_aarch64_adr_prel_pg_hi21_nc", 0),
      ("r_aarch64_adr_prel_pg_hi21", 0), ("r_aarch64_adr_prel_lo21", 0),
      ("r_aarch64_adr_got_page", 0), ("r_aarch64_add_tprel_lo12_nc", 0),
      ("r_aarch64_add_tprel_lo12", 0), ("r_aarch64_add_tprel_hi12", 0),
      ("r_aarch64_add_abs_lo12_nc", 0), ("r_aarch64_abs64", 0),
      ("r_aarch64_abs32", 0), ("r_aarch64_abs16", 0),
      ("abi_aarch64_apply_relocation", 25), ("aarch64_le_reloc", 37)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("a", 28), TMV("a_val", 5), TMV("addr", 16), TMV("e", 26),
   TMV("ef", 19), TMV("got_val", 5), TMV("img", 1), TMV("p_val", 5),
   TMV("r", 0), TMV("rel", 24), TMV("rel_type", 0), TMV("result", 6),
   TMV("rr", 33), TMV("s", 30), TMV("s_val", 5), TMC(15, 39), TMC(15, 41),
   TMC(15, 43), TMC(15, 45), TMC(16, 47), TMC(16, 50), TMC(16, 52),
   TMC(16, 54), TMC(16, 58), TMC(16, 63), TMC(16, 65), TMC(16, 67),
   TMC(19, 0), TMC(20, 69), TMC(20, 70), TMC(20, 72), TMC(21, 73),
   TMC(22, 74), TMC(23, 75), TMC(24, 75), TMC(25, 77), TMC(27, 80),
   TMC(27, 83), TMC(28, 86), TMC(30, 2), TMC(31, 2), TMC(32, 55),
   TMC(33, 55), TMC(34, 15), TMC(35, 17), TMC(36, 88), TMC(37, 55),
   TMC(38, 55), TMC(39, 55), TMC(40, 55), TMC(41, 60), TMC(42, 55),
   TMC(43, 3), TMC(44, 3), TMC(45, 3), TMC(46, 3), TMC(47, 3), TMC(48, 3),
   TMC(49, 3), TMC(50, 3), TMC(51, 3), TMC(52, 55), TMC(53, 55),
   TMC(54, 90), TMC(54, 92), TMC(54, 94), TMC(54, 96), TMC(55, 97),
   TMC(56, 98), TMC(57, 84), TMC(58, 75), TMC(59, 55), TMC(60, 98),
   TMC(61, 55), TMC(62, 55), TMC(63, 3), TMC(64, 3), TMC(65, 3),
   TMC(66, 3), TMC(67, 3), TMC(68, 3), TMC(69, 3), TMC(70, 0), TMC(71, 37),
   TMC(72, 25), TMC(73, 100), TMC(75, 101), TMC(76, 101), TMC(77, 102),
   TMC(78, 103), TMC(79, 105), TMC(80, 105), TMC(81, 106), TMC(82, 35),
   TMC(83, 0), TMC(84, 0), TMC(85, 0), TMC(86, 0), TMC(87, 0), TMC(88, 0),
   TMC(89, 0), TMC(90, 0), TMC(91, 0), TMC(92, 0), TMC(93, 0), TMC(94, 0),
   TMC(95, 0), TMC(96, 0), TMC(97, 0), TMC(98, 0), TMC(99, 0), TMC(100, 0),
   TMC(101, 0), TMC(102, 0), TMC(103, 0), TMC(104, 0), TMC(105, 0),
   TMC(106, 0), TMC(107, 0), TMC(108, 0), TMC(109, 0), TMC(110, 0),
   TMC(111, 0), TMC(112, 0), TMC(113, 0), TMC(114, 0), TMC(115, 0),
   TMC(116, 0), TMC(117, 0), TMC(118, 0), TMC(119, 0), TMC(120, 0),
   TMC(121, 0), TMC(122, 0), TMC(123, 0), TMC(124, 0), TMC(125, 0),
   TMC(126, 0), TMC(127, 0), TMC(128, 0), TMC(129, 0), TMC(130, 0),
   TMC(131, 0), TMC(132, 0), TMC(133, 0), TMC(134, 0), TMC(135, 0),
   TMC(136, 0), TMC(137, 0), TMC(138, 0), TMC(139, 0), TMC(140, 0),
   TMC(141, 0), TMC(142, 0), TMC(143, 0), TMC(144, 0), TMC(145, 0),
   TMC(146, 0), TMC(147, 0), TMC(148, 0), TMC(149, 0), TMC(150, 0),
   TMC(151, 0), TMC(152, 0), TMC(153, 0), TMC(154, 0), TMC(155, 0),
   TMC(156, 0), TMC(157, 0), TMC(158, 0), TMC(159, 0), TMC(160, 0),
   TMC(161, 0), TMC(162, 0), TMC(163, 0), TMC(164, 0), TMC(165, 0),
   TMC(166, 0), TMC(167, 0), TMC(168, 0), TMC(169, 0), TMC(170, 0),
   TMC(171, 0), TMC(172, 0), TMC(173, 0), TMC(174, 0), TMC(175, 0),
   TMC(176, 0), TMC(177, 0), TMC(178, 0), TMC(179, 0), TMC(180, 0),
   TMC(181, 0), TMC(182, 0), TMC(183, 0), TMC(184, 0), TMC(185, 0),
   TMC(186, 0), TMC(187, 0), TMC(188, 0), TMC(189, 0), TMC(190, 0),
   TMC(191, 0), TMC(192, 0), TMC(193, 0), TMC(194, 0), TMC(195, 0),
   TMC(196, 0), TMC(197, 0), TMC(198, 0), TMC(199, 0), TMC(200, 0),
   TMC(201, 0), TMC(202, 0), TMC(203, 0), TMC(204, 0), TMC(205, 0),
   TMC(206, 0), TMC(207, 107), TMC(208, 108)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op r_aarch64_none_def x = x
    val op r_aarch64_none_def =
    DT(((("abi_aarch64_relocation",0),[]),[]), [read"%29%158@%27@"])
  fun op r_aarch64_withdrawn_def x = x
    val op r_aarch64_withdrawn_def =
    DT(((("abi_aarch64_relocation",1),[]),[]),
       [read"%29%217@%70%34%33%33%33%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_abs64_def x = x
    val op r_aarch64_abs64_def =
    DT(((("abi_aarch64_relocation",2),[]),[]),
       [read"%29%96@%70%33%34%33%33%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_abs32_def x = x
    val op r_aarch64_abs32_def =
    DT(((("abi_aarch64_relocation",3),[]),[]),
       [read"%29%95@%70%34%34%33%33%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_abs16_def x = x
    val op r_aarch64_abs16_def =
    DT(((("abi_aarch64_relocation",4),[]),[]),
       [read"%29%94@%70%33%33%34%33%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_prel64_def x = x
    val op r_aarch64_prel64_def =
    DT(((("abi_aarch64_relocation",5),[]),[]),
       [read"%29%161@%70%34%33%34%33%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_prel32_def x = x
    val op r_aarch64_prel32_def =
    DT(((("abi_aarch64_relocation",6),[]),[]),
       [read"%29%160@%70%33%34%34%33%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_prel16_def x = x
    val op r_aarch64_prel16_def =
    DT(((("abi_aarch64_relocation",7),[]),[]),
       [read"%29%159@%70%34%34%34%33%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g0_def x = x
    val op r_aarch64_movw_uabs_g0_def =
    DT(((("abi_aarch64_relocation",8),[]),[]),
       [read"%29%151@%70%33%33%33%34%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g0_nc_def x = x
    val op r_aarch64_movw_uabs_g0_nc_def =
    DT(((("abi_aarch64_relocation",9),[]),[]),
       [read"%29%152@%70%34%33%33%34%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g1_def x = x
    val op r_aarch64_movw_uabs_g1_def =
    DT(((("abi_aarch64_relocation",10),[]),[]),
       [read"%29%153@%70%33%34%33%34%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g1_nc_def x = x
    val op r_aarch64_movw_uabs_g1_nc_def =
    DT(((("abi_aarch64_relocation",11),[]),[]),
       [read"%29%154@%70%34%34%33%34%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g2_def x = x
    val op r_aarch64_movw_uabs_g2_def =
    DT(((("abi_aarch64_relocation",12),[]),[]),
       [read"%29%155@%70%33%33%34%34%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g2_nc_def x = x
    val op r_aarch64_movw_uabs_g2_nc_def =
    DT(((("abi_aarch64_relocation",13),[]),[]),
       [read"%29%156@%70%34%33%34%34%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g3_def x = x
    val op r_aarch64_movw_uabs_g3_def =
    DT(((("abi_aarch64_relocation",14),[]),[]),
       [read"%29%157@%70%33%34%34%34%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_sabs_g0_def x = x
    val op r_aarch64_movw_sabs_g0_def =
    DT(((("abi_aarch64_relocation",15),[]),[]),
       [read"%29%148@%70%34%34%34%34%33%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_sabs_g1_def x = x
    val op r_aarch64_movw_sabs_g1_def =
    DT(((("abi_aarch64_relocation",16),[]),[]),
       [read"%29%149@%70%33%33%33%33%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_sabs_g2_def x = x
    val op r_aarch64_movw_sabs_g2_def =
    DT(((("abi_aarch64_relocation",17),[]),[]),
       [read"%29%150@%70%34%33%33%33%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_ld_prel_lo19_def x = x
    val op r_aarch64_ld_prel_lo19_def =
    DT(((("abi_aarch64_relocation",18),[]),[]),
       [read"%29%118@%70%33%34%33%33%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_adr_prel_lo21_def x = x
    val op r_aarch64_adr_prel_lo21_def =
    DT(((("abi_aarch64_relocation",19),[]),[]),
       [read"%29%102@%70%34%34%33%33%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_adr_prel_pg_hi21_def x = x
    val op r_aarch64_adr_prel_pg_hi21_def =
    DT(((("abi_aarch64_relocation",20),[]),[]),
       [read"%29%103@%70%33%33%34%33%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_adr_prel_pg_hi21_nc_def x = x
    val op r_aarch64_adr_prel_pg_hi21_nc_def =
    DT(((("abi_aarch64_relocation",21),[]),[]),
       [read"%29%104@%70%34%33%34%33%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_add_abs_lo12_nc_def x = x
    val op r_aarch64_add_abs_lo12_nc_def =
    DT(((("abi_aarch64_relocation",22),[]),[]),
       [read"%29%97@%70%33%34%34%33%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_ldst8_abs_lo12_nc_def x = x
    val op r_aarch64_ldst8_abs_lo12_nc_def =
    DT(((("abi_aarch64_relocation",23),[]),[]),
       [read"%29%131@%70%34%34%34%33%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_ldst16_abs_lo12_nc_def x = x
    val op r_aarch64_ldst16_abs_lo12_nc_def =
    DT(((("abi_aarch64_relocation",24),[]),[]),
       [read"%29%122@%70%34%33%34%34%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_ldst32_abs_lo12_nc_def x = x
    val op r_aarch64_ldst32_abs_lo12_nc_def =
    DT(((("abi_aarch64_relocation",25),[]),[]),
       [read"%29%125@%70%33%34%34%34%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_ldst64_abs_lo12_nc_def x = x
    val op r_aarch64_ldst64_abs_lo12_nc_def =
    DT(((("abi_aarch64_relocation",26),[]),[]),
       [read"%29%128@%70%34%34%34%34%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_ldst128_abs_lo12_nc_def x = x
    val op r_aarch64_ldst128_abs_lo12_nc_def =
    DT(((("abi_aarch64_relocation",27),[]),[]),
       [read"%29%119@%70%33%33%34%34%33%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_tstbr14_def x = x
    val op r_aarch64_tstbr14_def =
    DT(((("abi_aarch64_relocation",28),[]),[]),
       [read"%29%216@%70%33%33%33%34%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_condbr19_def x = x
    val op r_aarch64_condbr19_def =
    DT(((("abi_aarch64_relocation",29),[]),[]),
       [read"%29%106@%70%34%33%33%34%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_jump26_def x = x
    val op r_aarch64_jump26_def =
    DT(((("abi_aarch64_relocation",30),[]),[]),
       [read"%29%114@%70%34%34%33%34%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_call26_def x = x
    val op r_aarch64_call26_def =
    DT(((("abi_aarch64_relocation",31),[]),[]),
       [read"%29%105@%70%33%33%34%34%34%33%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g0_def x = x
    val op r_aarch64_movw_prel_g0_def =
    DT(((("abi_aarch64_relocation",32),[]),[]),
       [read"%29%141@%70%33%33%33%33%33%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g0_nc_def x = x
    val op r_aarch64_movw_prel_g0_nc_def =
    DT(((("abi_aarch64_relocation",33),[]),[]),
       [read"%29%142@%70%34%33%33%33%33%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g1_def x = x
    val op r_aarch64_movw_prel_g1_def =
    DT(((("abi_aarch64_relocation",34),[]),[]),
       [read"%29%143@%70%33%34%33%33%33%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g1_nc_def x = x
    val op r_aarch64_movw_prel_g1_nc_def =
    DT(((("abi_aarch64_relocation",35),[]),[]),
       [read"%29%144@%70%34%34%33%33%33%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g2_def x = x
    val op r_aarch64_movw_prel_g2_def =
    DT(((("abi_aarch64_relocation",36),[]),[]),
       [read"%29%145@%70%33%33%34%33%33%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g2_nc_def x = x
    val op r_aarch64_movw_prel_g2_nc_def =
    DT(((("abi_aarch64_relocation",37),[]),[]),
       [read"%29%146@%70%34%33%34%33%33%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g3_def x = x
    val op r_aarch64_movw_prel_g3_def =
    DT(((("abi_aarch64_relocation",38),[]),[]),
       [read"%29%147@%70%33%34%34%33%33%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g0_def x = x
    val op r_aarch64_movw_gotoff_g0_def =
    DT(((("abi_aarch64_relocation",39),[]),[]),
       [read"%29%134@%70%34%33%34%34%33%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g0_nc_def x = x
    val op r_aarch64_movw_gotoff_g0_nc_def =
    DT(((("abi_aarch64_relocation",40),[]),[]),
       [read"%29%135@%70%33%34%34%34%33%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g1_def x = x
    val op r_aarch64_movw_gotoff_g1_def =
    DT(((("abi_aarch64_relocation",41),[]),[]),
       [read"%29%136@%70%34%34%34%34%33%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g1_nc_def x = x
    val op r_aarch64_movw_gotoff_g1_nc_def =
    DT(((("abi_aarch64_relocation",42),[]),[]),
       [read"%29%137@%70%33%33%33%33%34%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g2_def x = x
    val op r_aarch64_movw_gotoff_g2_def =
    DT(((("abi_aarch64_relocation",43),[]),[]),
       [read"%29%138@%70%34%33%33%33%34%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g2_nc_def x = x
    val op r_aarch64_movw_gotoff_g2_nc_def =
    DT(((("abi_aarch64_relocation",44),[]),[]),
       [read"%29%139@%70%33%34%33%33%34%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g3_def x = x
    val op r_aarch64_movw_gotoff_g3_def =
    DT(((("abi_aarch64_relocation",45),[]),[]),
       [read"%29%140@%70%34%34%33%33%34%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_gotrel64_def x = x
    val op r_aarch64_gotrel64_def =
    DT(((("abi_aarch64_relocation",46),[]),[]),
       [read"%29%112@%70%33%33%34%33%34%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_gotrel32_def x = x
    val op r_aarch64_gotrel32_def =
    DT(((("abi_aarch64_relocation",47),[]),[]),
       [read"%29%111@%70%34%33%34%33%34%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_got_ld_prel19_def x = x
    val op r_aarch64_got_ld_prel19_def =
    DT(((("abi_aarch64_relocation",48),[]),[]),
       [read"%29%110@%70%33%34%34%33%34%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_got_ld64_gotoff_lo15_def x = x
    val op r_aarch64_got_ld64_gotoff_lo15_def =
    DT(((("abi_aarch64_relocation",49),[]),[]),
       [read"%29%109@%70%34%34%34%33%34%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_adr_got_page_def x = x
    val op r_aarch64_adr_got_page_def =
    DT(((("abi_aarch64_relocation",50),[]),[]),
       [read"%29%101@%70%33%33%33%34%34%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_ld64_got_lo12_nc_def x = x
    val op r_aarch64_ld64_got_lo12_nc_def =
    DT(((("abi_aarch64_relocation",51),[]),[]),
       [read"%29%116@%70%34%33%33%34%34%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_ld64_gotpage_lo15_def x = x
    val op r_aarch64_ld64_gotpage_lo15_def =
    DT(((("abi_aarch64_relocation",52),[]),[]),
       [read"%29%117@%70%33%34%33%34%34%34%33%33%82@@@@@@@@@@"])
  fun op r_aarch64_tlsgd_adr_prel21_def x = x
    val op r_aarch64_tlsgd_adr_prel21_def =
    DT(((("abi_aarch64_relocation",53),[]),[]),
       [read"%29%179@%70%34%33%33%33%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsgd_adr_page21_def x = x
    val op r_aarch64_tlsgd_adr_page21_def =
    DT(((("abi_aarch64_relocation",54),[]),[]),
       [read"%29%178@%70%33%34%33%33%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsgd_add_lo12_nc_def x = x
    val op r_aarch64_tlsgd_add_lo12_nc_def =
    DT(((("abi_aarch64_relocation",55),[]),[]),
       [read"%29%177@%70%34%34%33%33%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsgd_movw_g1_def x = x
    val op r_aarch64_tlsgd_movw_g1_def =
    DT(((("abi_aarch64_relocation",56),[]),[]),
       [read"%29%181@%70%33%33%34%33%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsgd_movw_g0_nc_def x = x
    val op r_aarch64_tlsgd_movw_g0_nc_def =
    DT(((("abi_aarch64_relocation",57),[]),[]),
       [read"%29%180@%70%34%33%34%33%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_adr_prel21_def x = x
    val op r_aarch64_tlsld_adr_prel21_def =
    DT(((("abi_aarch64_relocation",58),[]),[]),
       [read"%29%192@%70%33%34%34%33%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_adr_page21_def x = x
    val op r_aarch64_tlsld_adr_page21_def =
    DT(((("abi_aarch64_relocation",59),[]),[]),
       [read"%29%191@%70%34%34%34%33%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_add_lo12_nc_def x = x
    val op r_aarch64_tlsld_add_lo12_nc_def =
    DT(((("abi_aarch64_relocation",60),[]),[]),
       [read"%29%190@%70%33%33%33%34%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_g1_def x = x
    val op r_aarch64_tlsld_movw_g1_def =
    DT(((("abi_aarch64_relocation",61),[]),[]),
       [read"%29%210@%70%34%33%33%34%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_g0_nc_def x = x
    val op r_aarch64_tlsld_movw_g0_nc_def =
    DT(((("abi_aarch64_relocation",62),[]),[]),
       [read"%29%209@%70%33%34%33%34%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ld_prel19_def x = x
    val op r_aarch64_tlsld_ld_prel19_def =
    DT(((("abi_aarch64_relocation",63),[]),[]),
       [read"%29%193@%70%34%34%33%34%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_dtprel_g2_def x = x
    val op r_aarch64_tlsld_movw_dtprel_g2_def =
    DT(((("abi_aarch64_relocation",64),[]),[]),
       [read"%29%208@%70%33%33%34%34%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_dtprel_g1_def x = x
    val op r_aarch64_tlsld_movw_dtprel_g1_def =
    DT(((("abi_aarch64_relocation",65),[]),[]),
       [read"%29%206@%70%34%33%34%34%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_dtprel_g1_nc_def x = x
    val op r_aarch64_tlsld_movw_dtprel_g1_nc_def =
    DT(((("abi_aarch64_relocation",66),[]),[]),
       [read"%29%207@%70%33%34%34%34%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_dtprel_g0_def x = x
    val op r_aarch64_tlsld_movw_dtprel_g0_def =
    DT(((("abi_aarch64_relocation",67),[]),[]),
       [read"%29%204@%70%34%34%34%34%33%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_dtprel_g0_nc_def x = x
    val op r_aarch64_tlsld_movw_dtprel_g0_nc_def =
    DT(((("abi_aarch64_relocation",68),[]),[]),
       [read"%29%205@%70%33%33%33%33%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_add_dtprel_hi12_def x = x
    val op r_aarch64_tlsld_add_dtprel_hi12_def =
    DT(((("abi_aarch64_relocation",69),[]),[]),
       [read"%29%187@%70%34%33%33%33%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_add_dtprel_lo12_def x = x
    val op r_aarch64_tlsld_add_dtprel_lo12_def =
    DT(((("abi_aarch64_relocation",70),[]),[]),
       [read"%29%188@%70%33%34%33%33%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_add_dtprel_lo12_nc_def x = x
    val op r_aarch64_tlsld_add_dtprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",71),[]),[]),
       [read"%29%189@%70%34%34%33%33%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst8_dtprel_lo12_def x = x
    val op r_aarch64_tlsld_ldst8_dtprel_lo12_def =
    DT(((("abi_aarch64_relocation",72),[]),[]),
       [read"%29%202@%70%33%33%34%33%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst8_dtprel_lo12_nc_def x = x
    val op r_aarch64_tlsld_ldst8_dtprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",73),[]),[]),
       [read"%29%203@%70%34%33%34%33%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst16_dtprel_lo12_def x = x
    val op r_aarch64_tlsld_ldst16_dtprel_lo12_def =
    DT(((("abi_aarch64_relocation",74),[]),[]),
       [read"%29%196@%70%33%34%34%33%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst16_dtprel_lo12_nc_def x = x
    val op r_aarch64_tlsld_ldst16_dtprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",75),[]),[]),
       [read"%29%197@%70%34%34%34%33%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst32_dtprel_lo12_def x = x
    val op r_aarch64_tlsld_ldst32_dtprel_lo12_def =
    DT(((("abi_aarch64_relocation",76),[]),[]),
       [read"%29%198@%70%33%33%33%34%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst32_dtprel_lo12_nc_def x = x
    val op r_aarch64_tlsld_ldst32_dtprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",77),[]),[]),
       [read"%29%199@%70%34%33%33%34%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst64_dtprel_lo12_def x = x
    val op r_aarch64_tlsld_ldst64_dtprel_lo12_def =
    DT(((("abi_aarch64_relocation",78),[]),[]),
       [read"%29%200@%70%33%34%33%34%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst64_dtprel_lo12_nc_def x = x
    val op r_aarch64_tlsld_ldst64_dtprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",79),[]),[]),
       [read"%29%201@%70%34%34%33%34%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst128_dtprel_lo12_def x = x
    val op r_aarch64_tlsld_ldst128_dtprel_lo12_def =
    DT(((("abi_aarch64_relocation",80),[]),[]),
       [read"%29%194@%70%34%33%34%34%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst128_dtprel_lo12_nc_def x = x
    val op r_aarch64_tlsld_ldst128_dtprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",81),[]),[]),
       [read"%29%195@%70%33%34%34%34%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsie_movw_gottprel_g1_def x = x
    val op r_aarch64_tlsie_movw_gottprel_g1_def =
    DT(((("abi_aarch64_relocation",82),[]),[]),
       [read"%29%183@%70%33%33%34%34%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsie_movw_gottprel_g0_nc_def x = x
    val op r_aarch64_tlsie_movw_gottprel_g0_nc_def =
    DT(((("abi_aarch64_relocation",83),[]),[]),
       [read"%29%182@%70%34%33%34%34%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsie_movw_gottprel_page21_def x = x
    val op r_aarch64_tlsie_movw_gottprel_page21_def =
    DT(((("abi_aarch64_relocation",84),[]),[]),
       [read"%29%185@%70%33%34%34%34%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsie_movw_gottprel_lo12_nc_def x = x
    val op r_aarch64_tlsie_movw_gottprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",85),[]),[]),
       [read"%29%184@%70%34%34%34%34%34%33%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsie_movw_gottprel_prel19_def x = x
    val op r_aarch64_tlsie_movw_gottprel_prel19_def =
    DT(((("abi_aarch64_relocation",86),[]),[]),
       [read"%29%186@%70%33%33%33%33%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsle_movw_tprel_g2_def x = x
    val op r_aarch64_tlsle_movw_tprel_g2_def =
    DT(((("abi_aarch64_relocation",87),[]),[]),
       [read"%29%215@%70%34%33%33%33%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsle_movw_tprel_g1_def x = x
    val op r_aarch64_tlsle_movw_tprel_g1_def =
    DT(((("abi_aarch64_relocation",88),[]),[]),
       [read"%29%213@%70%33%34%33%33%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsle_movw_tprel_g1_nc_def x = x
    val op r_aarch64_tlsle_movw_tprel_g1_nc_def =
    DT(((("abi_aarch64_relocation",89),[]),[]),
       [read"%29%214@%70%34%34%33%33%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsle_movw_tprel_g0_def x = x
    val op r_aarch64_tlsle_movw_tprel_g0_def =
    DT(((("abi_aarch64_relocation",90),[]),[]),
       [read"%29%211@%70%33%33%34%33%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsle_movw_tprel_g0_nc_def x = x
    val op r_aarch64_tlsle_movw_tprel_g0_nc_def =
    DT(((("abi_aarch64_relocation",91),[]),[]),
       [read"%29%212@%70%34%33%34%33%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_add_tprel_hi12_def x = x
    val op r_aarch64_add_tprel_hi12_def =
    DT(((("abi_aarch64_relocation",92),[]),[]),
       [read"%29%98@%70%33%34%34%33%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_add_tprel_lo12_def x = x
    val op r_aarch64_add_tprel_lo12_def =
    DT(((("abi_aarch64_relocation",93),[]),[]),
       [read"%29%99@%70%34%34%34%33%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_add_tprel_lo12_nc_def x = x
    val op r_aarch64_add_tprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",94),[]),[]),
       [read"%29%100@%70%33%33%33%34%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_ldst8_tprel_lo12_def x = x
    val op r_aarch64_ldst8_tprel_lo12_def =
    DT(((("abi_aarch64_relocation",95),[]),[]),
       [read"%29%132@%70%34%33%33%34%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_ldst8_tprel_lo12_nc_def x = x
    val op r_aarch64_ldst8_tprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",96),[]),[]),
       [read"%29%133@%70%33%34%33%34%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_ldst16_tprel_lo12_def x = x
    val op r_aarch64_ldst16_tprel_lo12_def =
    DT(((("abi_aarch64_relocation",97),[]),[]),
       [read"%29%123@%70%34%34%33%34%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_ldst16_tprel_lo12_nc_def x = x
    val op r_aarch64_ldst16_tprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",98),[]),[]),
       [read"%29%124@%70%33%33%34%34%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_ldst32_tprel_lo12_def x = x
    val op r_aarch64_ldst32_tprel_lo12_def =
    DT(((("abi_aarch64_relocation",99),[]),[]),
       [read"%29%126@%70%34%33%34%34%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_ldst32_tprel_lo12_nc_def x = x
    val op r_aarch64_ldst32_tprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",100),[]),[]),
       [read"%29%127@%70%33%34%34%34%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_ldst64_tprel_lo12_def x = x
    val op r_aarch64_ldst64_tprel_lo12_def =
    DT(((("abi_aarch64_relocation",101),[]),[]),
       [read"%29%129@%70%34%34%34%34%33%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_ldst64_tprel_lo12_nc_def x = x
    val op r_aarch64_ldst64_tprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",102),[]),[]),
       [read"%29%130@%70%33%33%33%33%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_ldst128_tprel_lo12_def x = x
    val op r_aarch64_ldst128_tprel_lo12_def =
    DT(((("abi_aarch64_relocation",103),[]),[]),
       [read"%29%120@%70%34%34%33%34%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_ldst128_tprel_lo12_nc_def x = x
    val op r_aarch64_ldst128_tprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",104),[]),[]),
       [read"%29%121@%70%33%33%34%34%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_ld_prel19_def x = x
    val op r_aarch64_tlsdesc_ld_prel19_def =
    DT(((("abi_aarch64_relocation",105),[]),[]),
       [read"%29%173@%70%34%33%33%33%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_adr_prel21_def x = x
    val op r_aarch64_tlsdesc_adr_prel21_def =
    DT(((("abi_aarch64_relocation",106),[]),[]),
       [read"%29%170@%70%33%34%33%33%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_adr_page21_def x = x
    val op r_aarch64_tlsdesc_adr_page21_def =
    DT(((("abi_aarch64_relocation",107),[]),[]),
       [read"%29%169@%70%34%34%33%33%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_ld64_lo12_def x = x
    val op r_aarch64_tlsdesc_ld64_lo12_def =
    DT(((("abi_aarch64_relocation",108),[]),[]),
       [read"%29%172@%70%33%33%34%33%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_add_lo12_def x = x
    val op r_aarch64_tlsdesc_add_lo12_def =
    DT(((("abi_aarch64_relocation",109),[]),[]),
       [read"%29%168@%70%34%33%34%33%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_off_g1_def x = x
    val op r_aarch64_tlsdesc_off_g1_def =
    DT(((("abi_aarch64_relocation",110),[]),[]),
       [read"%29%176@%70%33%34%34%33%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_off_g0_nc_def x = x
    val op r_aarch64_tlsdesc_off_g0_nc_def =
    DT(((("abi_aarch64_relocation",111),[]),[]),
       [read"%29%175@%70%34%34%34%33%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_ldr_def x = x
    val op r_aarch64_tlsdesc_ldr_def =
    DT(((("abi_aarch64_relocation",112),[]),[]),
       [read"%29%174@%70%33%33%33%34%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_add_def x = x
    val op r_aarch64_tlsdesc_add_def =
    DT(((("abi_aarch64_relocation",113),[]),[]),
       [read"%29%167@%70%34%33%33%34%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_call_def x = x
    val op r_aarch64_tlsdesc_call_def =
    DT(((("abi_aarch64_relocation",114),[]),[]),
       [read"%29%171@%70%33%34%33%34%34%34%33%33%33%82@@@@@@@@@@@"])
  fun op r_aarch64_copy_def x = x
    val op r_aarch64_copy_def =
    DT(((("abi_aarch64_relocation",115),[]),[]),
       [read"%29%107@%70%34%33%33%33%33%33%33%33%33%33%82@@@@@@@@@@@@"])
  fun op r_aarch64_glob_dat_def x = x
    val op r_aarch64_glob_dat_def =
    DT(((("abi_aarch64_relocation",116),[]),[]),
       [read"%29%108@%70%33%34%33%33%33%33%33%33%33%33%82@@@@@@@@@@@@"])
  fun op r_aarch64_jump_slot_def x = x
    val op r_aarch64_jump_slot_def =
    DT(((("abi_aarch64_relocation",117),[]),[]),
       [read"%29%115@%70%34%34%33%33%33%33%33%33%33%33%82@@@@@@@@@@@@"])
  fun op r_aarch64_relative_def x = x
    val op r_aarch64_relative_def =
    DT(((("abi_aarch64_relocation",118),[]),[]),
       [read"%29%162@%70%33%33%34%33%33%33%33%33%33%33%82@@@@@@@@@@@@"])
  fun op r_aarch64_tls_dtprel64_def x = x
    val op r_aarch64_tls_dtprel64_def =
    DT(((("abi_aarch64_relocation",119),[]),[]),
       [read"%29%164@%70%34%33%34%33%33%33%33%33%33%33%82@@@@@@@@@@@@"])
  fun op r_aarch64_tls_dtpmod64_def x = x
    val op r_aarch64_tls_dtpmod64_def =
    DT(((("abi_aarch64_relocation",120),[]),[]),
       [read"%29%163@%70%33%34%34%33%33%33%33%33%33%33%82@@@@@@@@@@@@"])
  fun op r_aarch64_tls_tprel64_def x = x
    val op r_aarch64_tls_tprel64_def =
    DT(((("abi_aarch64_relocation",121),[]),[]),
       [read"%29%165@%70%34%34%34%33%33%33%33%33%33%33%82@@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_def x = x
    val op r_aarch64_tlsdesc_def =
    DT(((("abi_aarch64_relocation",122),[]),[]),
       [read"%29%166@%70%33%33%33%34%33%33%33%33%33%33%82@@@@@@@@@@@@"])
  fun op r_aarch64_irelative_def x = x
    val op r_aarch64_irelative_def =
    DT(((("abi_aarch64_relocation",123),[]),[]),
       [read"%29%113@%70%34%33%33%34%33%33%33%33%33%33%82@@@@@@@@@@@@"])
  fun op aarch64_le_reloc_def x = x
    val op aarch64_le_reloc_def =
    DT(((("abi_aarch64_relocation",124),[]),[]),
       [read"%18%8%30%83$0@@%37%29$0@%158@@%19%43@%6%12%22%27@%13%0%3$0|||@||@@%19%43@%93@@@|@"])
  fun op abi_aarch64_apply_relocation_def x = x
    val op abi_aarch64_apply_relocation_def =
    DT(((("abi_aarch64_relocation",125),[]),[]),
       [read"%16%9%17%14%17%7%17%5%15%4%28%84$4@$3@$2@$1@$0@@%36%92%85$0@@@%65%10%64%1%36%29$1@%158@@%218%44@@%36%29$1@%217@@%218%44@@%36%29$1@%96@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%95@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%94@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%54@%39@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%161@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%160@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%159@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%54@%39@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%151@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%77@%39@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%152@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%77@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%153@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%79@%39@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%154@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%79@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%155@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%80@%39@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%156@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%80@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%157@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%81@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%148@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%54@%39@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%149@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%150@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%58@%39@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%118@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%55@%39@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%102@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%55@%39@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%103@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%68%26%31%23%71@%67%90$5@$0@@@@@%31%23%71@%67$4@@@@@@@%36%29$1@%104@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%68%26%31%23%71@%67%90$5@$0@@@@@%31%23%71@%67$4@@@@@@@%36%29$1@%97@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%131@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%122@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%125@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%128@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%119@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%216@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%53@%39@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%106@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%55@%39@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%114@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%56@%39@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%105@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%56@%39@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%141@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%54@%39@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%142@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%54@%40@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%143@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%144@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%145@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%58@%39@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%146@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%58@%40@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%147@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%67%91%90$5@$0@@$4@@@@%36%29$1@%134@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%54@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%47@%67%90$5@$0@@@@@@@%67$3@@@@@%36%29$1@%135@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%54@%40@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%47@%67%90$5@$0@@@@@@@%67$3@@@@@%36%29$1@%136@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%47@%67%90$5@$0@@@@@@@%67$3@@@@@%36%29$1@%137@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%47@%67%90$5@$0@@@@@@@%67$3@@@@@%36%29$1@%138@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%58@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%47@%67%90$5@$0@@@@@@@%67$3@@@@@%36%29$1@%139@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%47@%67%90$5@$0@@@@@@@%67$3@@@@@%36%29$1@%140@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%47@%67%90$5@$0@@@@@@@%67$3@@@@@%36%29$1@%112@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%67%91%90$5@$0@@$3@@@@%36%29$1@%111@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%67%91%90$5@$0@@$3@@@@%36%29$1@%110@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%55@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%47@%67%90$5@$0@@@@@@@%67$4@@@@@%36%29$1@%109@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%76@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%47@%67%90$5@$0@@@@@@@%67$3@@@@@%36%29$1@%101@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%68%26%31%23%71@%31%23%46@%31%23%47@%67%90$5@$0@@@@@@@@@%31%23%71@%67$4@@@@@@@%36%29$1@%116@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%55@%40@@@@@|@%87$7@@|@%31%23%46@%31%23%47@%67%90$5@$0@@@@@@@@%36%29$1@%117@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%76@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%47@%67%90$5@$0@@@@@@@%31%23%71@%67$3@@@@@@@%36%29$1@%179@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%55@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%32%24%50@%26%67$5@@%67$0@@@@@@@%67$4@@@@@%36%29$1@%178@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%68%26%31%23%71@%31%23%46@%32%24%50@%26%67$5@@%67$0@@@@@@@@@%31%23%71@%67$4@@@@@@@%36%29$1@%177@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%52@%40@@@@@|@%87$7@@|@%31%23%46@%32%24%50@%26%67$5@@%67$0@@@@@@@@%36%29$1@%181@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%54@%40@@@@@|@%87$7@@|@%68%26%31%23%46@%32%24%50@%26%67$5@@%67$0@@@@@@@%67$3@@@@@%36%29$1@%180@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%54@%40@@@@@|@%87$7@@|@%68%26%31%23%46@%32%24%50@%26%67$5@@%67$0@@@@@@@%67$3@@@@@%36%29$1@%192@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%55@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%48@%67$5@@@@@@%67$4@@@@@%36%29$1@%191@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%48@%67$5@@@@@@%31%23%71@%67$4@@@@@@@%36%29$1@%190@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%31%23%46@%31%23%48@%67$5@@@@@@@%36%29$1@%210@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%53@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%48@%67$5@@@@@@%67$3@@@@@%36%29$1@%209@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%53@%40@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%48@%67$5@@@@@@%67$3@@@@@%36%29$1@%193@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%55@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%48@%67$5@@@@@@%67$4@@@@@%36%29$1@%208@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%53@%39@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%206@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%53@%39@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%207@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%53@%40@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%204@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%53@%39@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%205@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%53@%40@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%187@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%78@%39@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%188@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%39@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%189@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%40@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%202@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%39@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%203@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%40@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%196@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%39@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%197@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%40@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%198@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%39@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%199@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%40@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%200@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%39@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%201@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%40@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%194@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%39@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%195@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%40@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%183@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%53@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%51@%67%90$5@$0@@@@@@@%67$3@@@@@%36%29$1@%182@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%53@%40@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%51@%67%90$5@$0@@@@@@@%67$3@@@@@%36%29$1@%185@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%68%26%31%23%71@%31%23%46@%31%23%51@%67%90$5@$0@@@@@@@@@%31%23%71@%67$4@@@@@@@%36%29$1@%184@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%60@%40@@@@@|@%87$7@@|@%31%23%46@%31%23%51@%67%90$5@$0@@@@@@@@%36%29$1@%186@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%55@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%51@%67%90$5@$0@@@@@@@%67$4@@@@@%36%29$1@%215@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%77@%39@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%213@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%77@%39@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%214@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%77@%40@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%211@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%77@%39@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%212@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%77@%40@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%98@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%78@%39@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%99@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%39@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%100@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%40@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%132@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%39@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%133@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%40@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%123@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%39@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%124@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%40@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%126@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%39@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%127@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%40@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%129@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%39@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%130@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%40@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%120@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%39@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%121@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%75@%40@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%173@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%55@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%49@%67%90$5@$0@@@@@@@%67$4@@@@@%36%29$1@%170@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%55@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%49@%67%90$5@$0@@@@@@@%67$4@@@@@%36%29$1@%169@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%68%26%31%23%71@%31%23%46@%31%23%49@%67%90$5@$0@@@@@@@@@%31%23%71@%67$4@@@@@@@%36%29$1@%172@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%55@%39@@@@@|@%87$7@@|@%31%23%46@%31%23%49@%67%90$5@$0@@@@@@@@%36%29$1@%168@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%31%23%46@%31%23%49@%67%90$5@$0@@@@@@@@%36%29$1@%176@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%39@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%49@%67%90$5@$0@@@@@@@%67$3@@@@@%36%29$1@%175@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%57@%40@@@@@|@%87$7@@|@%68%26%31%23%46@%31%23%49@%67%90$5@$0@@@@@@@%67$3@@@@@%36%29$1@%174@@%218%44@@%36%29$1@%167@@%218%44@@%36%29$1@%171@@%218%44@@%36%29$1@%107@@%88%38%35%70%33%34%33%33%33%33%82@@@@@@@@@%38%35%70%33%34%33%33%33%33%82@@@@@@@@@%38%35%70%34%34%33%33%34%33%82@@@@@@@@@%38%35%70%33%33%34%33%33%33%82@@@@@@@@@%38%35%70%34%33%33%34%33%33%82@@@@@@@@@%38%35%70%34%34%34%33%34%82@@@@@@@@%38%35%70%34%33%34%33%34%82@@@@@@@@%38%35%70%33%33%33%33%33%34%82@@@@@@@@@%38%35%70%33%33%34%33%33%33%82@@@@@@@@@%38%35%70%33%33%33%33%34%33%82@@@@@@@@@%38%35%70%34%33%33%33%34%33%82@@@@@@@@@%38%35%70%33%34%33%34%34%33%82@@@@@@@@@%69@@@@@@@@@@@@@@%36%29$1@%108@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%115@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%67%90$5@$0@@@@%36%29$1@%162@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%72%26%31%23%42@%67$5@@@@%67$0@@@@@%36%29$1@%164@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%31%23%41@%67%90$5@$0@@@@@@%36%29$1@%163@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%31%23%62@%67$5@@@@@%36%29$1@%165@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%31%23%74@%67%90$5@$0@@@@@@%36%29$1@%166@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%31%23%73@%67%90$5@$0@@@@@@%36%29$1@%113@@%66%11%63%2%218%45%44@%20$0@%25$1@%21%59@%40@@@@@|@%87$7@@|@%31%23%61@%72%26%31%23%42@%67$5@@@@%67$0@@@@@@@%88%38%35%70%33%34%33%34%33%33%82@@@@@@@@@%38%35%70%34%34%34%34%33%34%82@@@@@@@@@%38%35%70%34%34%34%33%34%34%82@@@@@@@@@%38%35%70%33%34%33%33%33%34%82@@@@@@@@@%38%35%70%34%33%34%34%33%34%82@@@@@@@@@%38%35%70%33%34%33%34%33%34%82@@@@@@@@@%38%35%70%34%33%34%33%33%34%82@@@@@@@@@%38%35%70%34%33%33%33%33%82@@@@@@@@%38%35%70%33%34%33%33%33%33%82@@@@@@@@@%38%35%70%33%34%33%33%33%33%82@@@@@@@@@%38%35%70%34%34%33%33%34%33%82@@@@@@@@@%38%35%70%33%33%34%33%33%33%82@@@@@@@@@%38%35%70%34%33%33%34%33%33%82@@@@@@@@@%38%35%70%34%34%34%33%34%82@@@@@@@@%38%35%70%34%33%34%33%34%82@@@@@@@@%38%35%70%34%33%33%33%33%82@@@@@@@@%38%35%70%34%34%33%33%34%34%82@@@@@@@@@%38%35%70%33%34%34%33%33%34%82@@@@@@@@@%38%35%70%34%33%34%34%33%34%82@@@@@@@@@%38%35%70%33%33%33%33%34%34%82@@@@@@@@@%38%35%70%33%33%34%33%33%34%82@@@@@@@@@%38%35%70%33%34%33%33%33%34%82@@@@@@@@@%38%35%70%34%33%34%33%34%34%82@@@@@@@@@%38%35%70%33%34%33%34%33%34%82@@@@@@@@@%38%35%70%33%33%33%33%34%34%82@@@@@@@@@%38%35%70%34%34%34%34%33%34%82@@@@@@@@@%38%35%70%34%33%33%33%33%82@@@@@@@@%38%35%70%34%33%34%33%34%34%82@@@@@@@@@%38%35%70%33%34%33%34%34%34%82@@@@@@@@@%38%35%70%34%33%33%33%34%34%82@@@@@@@@@%38%35%70%33%34%34%33%33%34%82@@@@@@@@@%69@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@%219%86$5@@@|@%89$4@@@%88%38%35%70%33%34%33%33%33%34%82@@@@@@@@@%38%35%70%34%34%33%33%33%34%82@@@@@@@@@%38%35%70%33%34%33%34%33%34%82@@@@@@@@@%38%35%70%33%33%33%33%33%34%82@@@@@@@@@%38%35%70%33%34%33%33%33%34%82@@@@@@@@@%38%35%70%33%34%33%33%33%34%82@@@@@@@@@%38%35%70%34%34%33%33%34%34%82@@@@@@@@@%38%35%70%33%33%34%33%33%34%82@@@@@@@@@%38%35%70%34%33%33%34%33%34%82@@@@@@@@@%38%35%70%34%34%34%33%34%82@@@@@@@@%38%35%70%34%33%34%33%34%82@@@@@@@@%38%35%70%33%33%33%33%33%34%82@@@@@@@@@%38%35%70%33%34%33%33%33%34%82@@@@@@@@@%38%35%70%34%33%33%33%34%34%82@@@@@@@@@%38%35%70%34%33%33%33%34%34%82@@@@@@@@@%38%35%70%34%33%34%34%33%34%82@@@@@@@@@%38%35%70%33%34%33%34%34%34%82@@@@@@@@@%38%35%70%33%33%33%33%33%34%82@@@@@@@@@%38%35%70%34%34%33%33%34%34%82@@@@@@@@@%38%35%70%33%34%34%33%33%34%82@@@@@@@@@%38%35%70%34%33%34%34%33%34%82@@@@@@@@@%38%35%70%33%33%33%33%34%34%82@@@@@@@@@%38%35%70%33%33%34%33%33%34%82@@@@@@@@@%38%35%70%33%34%33%33%33%34%82@@@@@@@@@%38%35%70%34%33%34%33%34%34%82@@@@@@@@@%38%35%70%33%34%33%34%33%34%82@@@@@@@@@%38%35%70%33%33%33%33%34%34%82@@@@@@@@@%38%35%70%34%34%34%34%33%34%82@@@@@@@@@%38%35%70%34%34%33%34%34%82@@@@@@@@%38%35%70%34%33%33%33%33%82@@@@@@@@%38%35%70%34%34%34%34%33%34%82@@@@@@@@@%38%35%70%33%33%33%33%34%34%82@@@@@@@@@%38%35%70%34%33%34%33%34%34%82@@@@@@@@@%38%35%70%34%33%33%33%33%82@@@@@@@@%38%35%70%33%34%33%33%33%34%82@@@@@@@@@%38%35%70%34%33%33%33%33%82@@@@@@@@%38%35%70%34%34%33%33%34%34%82@@@@@@@@@%38%35%70%33%34%34%33%33%34%82@@@@@@@@@%38%35%70%34%33%34%34%33%34%82@@@@@@@@@%38%35%70%33%33%33%33%34%34%82@@@@@@@@@%38%35%70%33%33%34%33%33%34%82@@@@@@@@@%38%35%70%33%34%33%33%33%34%82@@@@@@@@@%38%35%70%34%33%34%33%34%34%82@@@@@@@@@%38%35%70%33%34%33%33%33%34%82@@@@@@@@@%38%35%70%34%34%33%33%33%34%82@@@@@@@@@%38%35%70%34%33%34%34%33%34%82@@@@@@@@@%38%35%70%33%34%34%33%33%34%82@@@@@@@@@%38%35%70%34%33%33%33%33%82@@@@@@@@%38%35%70%34%34%34%33%33%34%82@@@@@@@@@%38%35%70%33%34%33%34%33%34%82@@@@@@@@@%38%35%70%34%33%34%34%33%34%82@@@@@@@@@%38%35%70%33%34%34%33%33%34%82@@@@@@@@@%69@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@|@|@|@"])
  end
  val _ = DB.bindl "abi_aarch64_relocation"
  [("r_aarch64_none_def",r_aarch64_none_def,DB.Def),
   ("r_aarch64_withdrawn_def",r_aarch64_withdrawn_def,DB.Def),
   ("r_aarch64_abs64_def",r_aarch64_abs64_def,DB.Def),
   ("r_aarch64_abs32_def",r_aarch64_abs32_def,DB.Def),
   ("r_aarch64_abs16_def",r_aarch64_abs16_def,DB.Def),
   ("r_aarch64_prel64_def",r_aarch64_prel64_def,DB.Def),
   ("r_aarch64_prel32_def",r_aarch64_prel32_def,DB.Def),
   ("r_aarch64_prel16_def",r_aarch64_prel16_def,DB.Def),
   ("r_aarch64_movw_uabs_g0_def",r_aarch64_movw_uabs_g0_def,DB.Def),
   ("r_aarch64_movw_uabs_g0_nc_def",r_aarch64_movw_uabs_g0_nc_def,DB.Def),
   ("r_aarch64_movw_uabs_g1_def",r_aarch64_movw_uabs_g1_def,DB.Def),
   ("r_aarch64_movw_uabs_g1_nc_def",r_aarch64_movw_uabs_g1_nc_def,DB.Def),
   ("r_aarch64_movw_uabs_g2_def",r_aarch64_movw_uabs_g2_def,DB.Def),
   ("r_aarch64_movw_uabs_g2_nc_def",r_aarch64_movw_uabs_g2_nc_def,DB.Def),
   ("r_aarch64_movw_uabs_g3_def",r_aarch64_movw_uabs_g3_def,DB.Def),
   ("r_aarch64_movw_sabs_g0_def",r_aarch64_movw_sabs_g0_def,DB.Def),
   ("r_aarch64_movw_sabs_g1_def",r_aarch64_movw_sabs_g1_def,DB.Def),
   ("r_aarch64_movw_sabs_g2_def",r_aarch64_movw_sabs_g2_def,DB.Def),
   ("r_aarch64_ld_prel_lo19_def",r_aarch64_ld_prel_lo19_def,DB.Def),
   ("r_aarch64_adr_prel_lo21_def",r_aarch64_adr_prel_lo21_def,DB.Def),
   ("r_aarch64_adr_prel_pg_hi21_def",
    r_aarch64_adr_prel_pg_hi21_def,
    DB.Def),
   ("r_aarch64_adr_prel_pg_hi21_nc_def",
    r_aarch64_adr_prel_pg_hi21_nc_def,
    DB.Def),
   ("r_aarch64_add_abs_lo12_nc_def",r_aarch64_add_abs_lo12_nc_def,DB.Def),
   ("r_aarch64_ldst8_abs_lo12_nc_def",
    r_aarch64_ldst8_abs_lo12_nc_def,
    DB.Def),
   ("r_aarch64_ldst16_abs_lo12_nc_def",
    r_aarch64_ldst16_abs_lo12_nc_def,
    DB.Def),
   ("r_aarch64_ldst32_abs_lo12_nc_def",
    r_aarch64_ldst32_abs_lo12_nc_def,
    DB.Def),
   ("r_aarch64_ldst64_abs_lo12_nc_def",
    r_aarch64_ldst64_abs_lo12_nc_def,
    DB.Def),
   ("r_aarch64_ldst128_abs_lo12_nc_def",
    r_aarch64_ldst128_abs_lo12_nc_def,
    DB.Def), ("r_aarch64_tstbr14_def",r_aarch64_tstbr14_def,DB.Def),
   ("r_aarch64_condbr19_def",r_aarch64_condbr19_def,DB.Def),
   ("r_aarch64_jump26_def",r_aarch64_jump26_def,DB.Def),
   ("r_aarch64_call26_def",r_aarch64_call26_def,DB.Def),
   ("r_aarch64_movw_prel_g0_def",r_aarch64_movw_prel_g0_def,DB.Def),
   ("r_aarch64_movw_prel_g0_nc_def",r_aarch64_movw_prel_g0_nc_def,DB.Def),
   ("r_aarch64_movw_prel_g1_def",r_aarch64_movw_prel_g1_def,DB.Def),
   ("r_aarch64_movw_prel_g1_nc_def",r_aarch64_movw_prel_g1_nc_def,DB.Def),
   ("r_aarch64_movw_prel_g2_def",r_aarch64_movw_prel_g2_def,DB.Def),
   ("r_aarch64_movw_prel_g2_nc_def",r_aarch64_movw_prel_g2_nc_def,DB.Def),
   ("r_aarch64_movw_prel_g3_def",r_aarch64_movw_prel_g3_def,DB.Def),
   ("r_aarch64_movw_gotoff_g0_def",r_aarch64_movw_gotoff_g0_def,DB.Def),
   ("r_aarch64_movw_gotoff_g0_nc_def",
    r_aarch64_movw_gotoff_g0_nc_def,
    DB.Def),
   ("r_aarch64_movw_gotoff_g1_def",r_aarch64_movw_gotoff_g1_def,DB.Def),
   ("r_aarch64_movw_gotoff_g1_nc_def",
    r_aarch64_movw_gotoff_g1_nc_def,
    DB.Def),
   ("r_aarch64_movw_gotoff_g2_def",r_aarch64_movw_gotoff_g2_def,DB.Def),
   ("r_aarch64_movw_gotoff_g2_nc_def",
    r_aarch64_movw_gotoff_g2_nc_def,
    DB.Def),
   ("r_aarch64_movw_gotoff_g3_def",r_aarch64_movw_gotoff_g3_def,DB.Def),
   ("r_aarch64_gotrel64_def",r_aarch64_gotrel64_def,DB.Def),
   ("r_aarch64_gotrel32_def",r_aarch64_gotrel32_def,DB.Def),
   ("r_aarch64_got_ld_prel19_def",r_aarch64_got_ld_prel19_def,DB.Def),
   ("r_aarch64_got_ld64_gotoff_lo15_def",
    r_aarch64_got_ld64_gotoff_lo15_def,
    DB.Def),
   ("r_aarch64_adr_got_page_def",r_aarch64_adr_got_page_def,DB.Def),
   ("r_aarch64_ld64_got_lo12_nc_def",
    r_aarch64_ld64_got_lo12_nc_def,
    DB.Def),
   ("r_aarch64_ld64_gotpage_lo15_def",
    r_aarch64_ld64_gotpage_lo15_def,
    DB.Def),
   ("r_aarch64_tlsgd_adr_prel21_def",
    r_aarch64_tlsgd_adr_prel21_def,
    DB.Def),
   ("r_aarch64_tlsgd_adr_page21_def",
    r_aarch64_tlsgd_adr_page21_def,
    DB.Def),
   ("r_aarch64_tlsgd_add_lo12_nc_def",
    r_aarch64_tlsgd_add_lo12_nc_def,
    DB.Def),
   ("r_aarch64_tlsgd_movw_g1_def",r_aarch64_tlsgd_movw_g1_def,DB.Def),
   ("r_aarch64_tlsgd_movw_g0_nc_def",
    r_aarch64_tlsgd_movw_g0_nc_def,
    DB.Def),
   ("r_aarch64_tlsld_adr_prel21_def",
    r_aarch64_tlsld_adr_prel21_def,
    DB.Def),
   ("r_aarch64_tlsld_adr_page21_def",
    r_aarch64_tlsld_adr_page21_def,
    DB.Def),
   ("r_aarch64_tlsld_add_lo12_nc_def",
    r_aarch64_tlsld_add_lo12_nc_def,
    DB.Def),
   ("r_aarch64_tlsld_movw_g1_def",r_aarch64_tlsld_movw_g1_def,DB.Def),
   ("r_aarch64_tlsld_movw_g0_nc_def",
    r_aarch64_tlsld_movw_g0_nc_def,
    DB.Def),
   ("r_aarch64_tlsld_ld_prel19_def",r_aarch64_tlsld_ld_prel19_def,DB.Def),
   ("r_aarch64_tlsld_movw_dtprel_g2_def",
    r_aarch64_tlsld_movw_dtprel_g2_def,
    DB.Def),
   ("r_aarch64_tlsld_movw_dtprel_g1_def",
    r_aarch64_tlsld_movw_dtprel_g1_def,
    DB.Def),
   ("r_aarch64_tlsld_movw_dtprel_g1_nc_def",
    r_aarch64_tlsld_movw_dtprel_g1_nc_def,
    DB.Def),
   ("r_aarch64_tlsld_movw_dtprel_g0_def",
    r_aarch64_tlsld_movw_dtprel_g0_def,
    DB.Def),
   ("r_aarch64_tlsld_movw_dtprel_g0_nc_def",
    r_aarch64_tlsld_movw_dtprel_g0_nc_def,
    DB.Def),
   ("r_aarch64_tlsld_add_dtprel_hi12_def",
    r_aarch64_tlsld_add_dtprel_hi12_def,
    DB.Def),
   ("r_aarch64_tlsld_add_dtprel_lo12_def",
    r_aarch64_tlsld_add_dtprel_lo12_def,
    DB.Def),
   ("r_aarch64_tlsld_add_dtprel_lo12_nc_def",
    r_aarch64_tlsld_add_dtprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_tlsld_ldst8_dtprel_lo12_def",
    r_aarch64_tlsld_ldst8_dtprel_lo12_def,
    DB.Def),
   ("r_aarch64_tlsld_ldst8_dtprel_lo12_nc_def",
    r_aarch64_tlsld_ldst8_dtprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_tlsld_ldst16_dtprel_lo12_def",
    r_aarch64_tlsld_ldst16_dtprel_lo12_def,
    DB.Def),
   ("r_aarch64_tlsld_ldst16_dtprel_lo12_nc_def",
    r_aarch64_tlsld_ldst16_dtprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_tlsld_ldst32_dtprel_lo12_def",
    r_aarch64_tlsld_ldst32_dtprel_lo12_def,
    DB.Def),
   ("r_aarch64_tlsld_ldst32_dtprel_lo12_nc_def",
    r_aarch64_tlsld_ldst32_dtprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_tlsld_ldst64_dtprel_lo12_def",
    r_aarch64_tlsld_ldst64_dtprel_lo12_def,
    DB.Def),
   ("r_aarch64_tlsld_ldst64_dtprel_lo12_nc_def",
    r_aarch64_tlsld_ldst64_dtprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_tlsld_ldst128_dtprel_lo12_def",
    r_aarch64_tlsld_ldst128_dtprel_lo12_def,
    DB.Def),
   ("r_aarch64_tlsld_ldst128_dtprel_lo12_nc_def",
    r_aarch64_tlsld_ldst128_dtprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_tlsie_movw_gottprel_g1_def",
    r_aarch64_tlsie_movw_gottprel_g1_def,
    DB.Def),
   ("r_aarch64_tlsie_movw_gottprel_g0_nc_def",
    r_aarch64_tlsie_movw_gottprel_g0_nc_def,
    DB.Def),
   ("r_aarch64_tlsie_movw_gottprel_page21_def",
    r_aarch64_tlsie_movw_gottprel_page21_def,
    DB.Def),
   ("r_aarch64_tlsie_movw_gottprel_lo12_nc_def",
    r_aarch64_tlsie_movw_gottprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_tlsie_movw_gottprel_prel19_def",
    r_aarch64_tlsie_movw_gottprel_prel19_def,
    DB.Def),
   ("r_aarch64_tlsle_movw_tprel_g2_def",
    r_aarch64_tlsle_movw_tprel_g2_def,
    DB.Def),
   ("r_aarch64_tlsle_movw_tprel_g1_def",
    r_aarch64_tlsle_movw_tprel_g1_def,
    DB.Def),
   ("r_aarch64_tlsle_movw_tprel_g1_nc_def",
    r_aarch64_tlsle_movw_tprel_g1_nc_def,
    DB.Def),
   ("r_aarch64_tlsle_movw_tprel_g0_def",
    r_aarch64_tlsle_movw_tprel_g0_def,
    DB.Def),
   ("r_aarch64_tlsle_movw_tprel_g0_nc_def",
    r_aarch64_tlsle_movw_tprel_g0_nc_def,
    DB.Def),
   ("r_aarch64_add_tprel_hi12_def",r_aarch64_add_tprel_hi12_def,DB.Def),
   ("r_aarch64_add_tprel_lo12_def",r_aarch64_add_tprel_lo12_def,DB.Def),
   ("r_aarch64_add_tprel_lo12_nc_def",
    r_aarch64_add_tprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_ldst8_tprel_lo12_def",
    r_aarch64_ldst8_tprel_lo12_def,
    DB.Def),
   ("r_aarch64_ldst8_tprel_lo12_nc_def",
    r_aarch64_ldst8_tprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_ldst16_tprel_lo12_def",
    r_aarch64_ldst16_tprel_lo12_def,
    DB.Def),
   ("r_aarch64_ldst16_tprel_lo12_nc_def",
    r_aarch64_ldst16_tprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_ldst32_tprel_lo12_def",
    r_aarch64_ldst32_tprel_lo12_def,
    DB.Def),
   ("r_aarch64_ldst32_tprel_lo12_nc_def",
    r_aarch64_ldst32_tprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_ldst64_tprel_lo12_def",
    r_aarch64_ldst64_tprel_lo12_def,
    DB.Def),
   ("r_aarch64_ldst64_tprel_lo12_nc_def",
    r_aarch64_ldst64_tprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_ldst128_tprel_lo12_def",
    r_aarch64_ldst128_tprel_lo12_def,
    DB.Def),
   ("r_aarch64_ldst128_tprel_lo12_nc_def",
    r_aarch64_ldst128_tprel_lo12_nc_def,
    DB.Def),
   ("r_aarch64_tlsdesc_ld_prel19_def",
    r_aarch64_tlsdesc_ld_prel19_def,
    DB.Def),
   ("r_aarch64_tlsdesc_adr_prel21_def",
    r_aarch64_tlsdesc_adr_prel21_def,
    DB.Def),
   ("r_aarch64_tlsdesc_adr_page21_def",
    r_aarch64_tlsdesc_adr_page21_def,
    DB.Def),
   ("r_aarch64_tlsdesc_ld64_lo12_def",
    r_aarch64_tlsdesc_ld64_lo12_def,
    DB.Def),
   ("r_aarch64_tlsdesc_add_lo12_def",
    r_aarch64_tlsdesc_add_lo12_def,
    DB.Def),
   ("r_aarch64_tlsdesc_off_g1_def",r_aarch64_tlsdesc_off_g1_def,DB.Def),
   ("r_aarch64_tlsdesc_off_g0_nc_def",
    r_aarch64_tlsdesc_off_g0_nc_def,
    DB.Def),
   ("r_aarch64_tlsdesc_ldr_def",r_aarch64_tlsdesc_ldr_def,DB.Def),
   ("r_aarch64_tlsdesc_add_def",r_aarch64_tlsdesc_add_def,DB.Def),
   ("r_aarch64_tlsdesc_call_def",r_aarch64_tlsdesc_call_def,DB.Def),
   ("r_aarch64_copy_def",r_aarch64_copy_def,DB.Def),
   ("r_aarch64_glob_dat_def",r_aarch64_glob_dat_def,DB.Def),
   ("r_aarch64_jump_slot_def",r_aarch64_jump_slot_def,DB.Def),
   ("r_aarch64_relative_def",r_aarch64_relative_def,DB.Def),
   ("r_aarch64_tls_dtprel64_def",r_aarch64_tls_dtprel64_def,DB.Def),
   ("r_aarch64_tls_dtpmod64_def",r_aarch64_tls_dtpmod64_def,DB.Def),
   ("r_aarch64_tls_tprel64_def",r_aarch64_tls_tprel64_def,DB.Def),
   ("r_aarch64_tlsdesc_def",r_aarch64_tlsdesc_def,DB.Def),
   ("r_aarch64_irelative_def",r_aarch64_irelative_def,DB.Def),
   ("aarch64_le_reloc_def",aarch64_le_reloc_def,DB.Def),
   ("abi_aarch64_apply_relocation_def",
    abi_aarch64_apply_relocation_def,
    DB.Def)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("abi_utilitiesTheory.abi_utilities_grammars",
                          abi_utilitiesTheory.abi_utilities_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_none", (Term.prim_mk_const { Name = "r_aarch64_none", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_none", (Term.prim_mk_const { Name = "r_aarch64_none", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_withdrawn", (Term.prim_mk_const { Name = "r_aarch64_withdrawn", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_withdrawn", (Term.prim_mk_const { Name = "r_aarch64_withdrawn", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_abs64", (Term.prim_mk_const { Name = "r_aarch64_abs64", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_abs64", (Term.prim_mk_const { Name = "r_aarch64_abs64", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_abs32", (Term.prim_mk_const { Name = "r_aarch64_abs32", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_abs32", (Term.prim_mk_const { Name = "r_aarch64_abs32", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_abs16", (Term.prim_mk_const { Name = "r_aarch64_abs16", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_abs16", (Term.prim_mk_const { Name = "r_aarch64_abs16", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_prel64", (Term.prim_mk_const { Name = "r_aarch64_prel64", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_prel64", (Term.prim_mk_const { Name = "r_aarch64_prel64", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_prel32", (Term.prim_mk_const { Name = "r_aarch64_prel32", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_prel32", (Term.prim_mk_const { Name = "r_aarch64_prel32", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_prel16", (Term.prim_mk_const { Name = "r_aarch64_prel16", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_prel16", (Term.prim_mk_const { Name = "r_aarch64_prel16", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g0", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g0", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g0", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g0", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g1", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g1", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g1_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g1_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g1_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g1_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g2", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g2", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g2", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g2", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g2_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g2_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g2_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g2_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g3", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g3", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_uabs_g3", (Term.prim_mk_const { Name = "r_aarch64_movw_uabs_g3", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_sabs_g0", (Term.prim_mk_const { Name = "r_aarch64_movw_sabs_g0", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_sabs_g0", (Term.prim_mk_const { Name = "r_aarch64_movw_sabs_g0", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_sabs_g1", (Term.prim_mk_const { Name = "r_aarch64_movw_sabs_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_sabs_g1", (Term.prim_mk_const { Name = "r_aarch64_movw_sabs_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_sabs_g2", (Term.prim_mk_const { Name = "r_aarch64_movw_sabs_g2", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_sabs_g2", (Term.prim_mk_const { Name = "r_aarch64_movw_sabs_g2", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ld_prel_lo19", (Term.prim_mk_const { Name = "r_aarch64_ld_prel_lo19", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ld_prel_lo19", (Term.prim_mk_const { Name = "r_aarch64_ld_prel_lo19", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_adr_prel_lo21", (Term.prim_mk_const { Name = "r_aarch64_adr_prel_lo21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_adr_prel_lo21", (Term.prim_mk_const { Name = "r_aarch64_adr_prel_lo21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_adr_prel_pg_hi21", (Term.prim_mk_const { Name = "r_aarch64_adr_prel_pg_hi21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_adr_prel_pg_hi21", (Term.prim_mk_const { Name = "r_aarch64_adr_prel_pg_hi21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_adr_prel_pg_hi21_nc", (Term.prim_mk_const { Name = "r_aarch64_adr_prel_pg_hi21_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_adr_prel_pg_hi21_nc", (Term.prim_mk_const { Name = "r_aarch64_adr_prel_pg_hi21_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_add_abs_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_add_abs_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_add_abs_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_add_abs_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst8_abs_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst8_abs_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst8_abs_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst8_abs_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst16_abs_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst16_abs_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst16_abs_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst16_abs_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst32_abs_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst32_abs_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst32_abs_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst32_abs_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst64_abs_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst64_abs_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst64_abs_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst64_abs_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst128_abs_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst128_abs_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst128_abs_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst128_abs_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tstbr14", (Term.prim_mk_const { Name = "r_aarch64_tstbr14", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tstbr14", (Term.prim_mk_const { Name = "r_aarch64_tstbr14", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_condbr19", (Term.prim_mk_const { Name = "r_aarch64_condbr19", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_condbr19", (Term.prim_mk_const { Name = "r_aarch64_condbr19", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_jump26", (Term.prim_mk_const { Name = "r_aarch64_jump26", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_jump26", (Term.prim_mk_const { Name = "r_aarch64_jump26", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_call26", (Term.prim_mk_const { Name = "r_aarch64_call26", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_call26", (Term.prim_mk_const { Name = "r_aarch64_call26", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g0", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g0", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g0", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g0", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g1", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g1", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g1_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g1_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g1_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g1_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g2", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g2", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g2", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g2", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g2_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g2_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g2_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g2_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g3", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g3", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_prel_g3", (Term.prim_mk_const { Name = "r_aarch64_movw_prel_g3", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g0", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g0", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g0", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g0", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g1", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g1", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g1_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g1_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g1_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g1_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g2", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g2", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g2", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g2", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g2_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g2_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g2_nc", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g2_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g3", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g3", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_movw_gotoff_g3", (Term.prim_mk_const { Name = "r_aarch64_movw_gotoff_g3", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_gotrel64", (Term.prim_mk_const { Name = "r_aarch64_gotrel64", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_gotrel64", (Term.prim_mk_const { Name = "r_aarch64_gotrel64", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_gotrel32", (Term.prim_mk_const { Name = "r_aarch64_gotrel32", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_gotrel32", (Term.prim_mk_const { Name = "r_aarch64_gotrel32", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_got_ld_prel19", (Term.prim_mk_const { Name = "r_aarch64_got_ld_prel19", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_got_ld_prel19", (Term.prim_mk_const { Name = "r_aarch64_got_ld_prel19", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_got_ld64_gotoff_lo15", (Term.prim_mk_const { Name = "r_aarch64_got_ld64_gotoff_lo15", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_got_ld64_gotoff_lo15", (Term.prim_mk_const { Name = "r_aarch64_got_ld64_gotoff_lo15", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_adr_got_page", (Term.prim_mk_const { Name = "r_aarch64_adr_got_page", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_adr_got_page", (Term.prim_mk_const { Name = "r_aarch64_adr_got_page", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ld64_got_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ld64_got_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ld64_got_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ld64_got_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ld64_gotpage_lo15", (Term.prim_mk_const { Name = "r_aarch64_ld64_gotpage_lo15", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ld64_gotpage_lo15", (Term.prim_mk_const { Name = "r_aarch64_ld64_gotpage_lo15", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsgd_adr_prel21", (Term.prim_mk_const { Name = "r_aarch64_tlsgd_adr_prel21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsgd_adr_prel21", (Term.prim_mk_const { Name = "r_aarch64_tlsgd_adr_prel21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsgd_adr_page21", (Term.prim_mk_const { Name = "r_aarch64_tlsgd_adr_page21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsgd_adr_page21", (Term.prim_mk_const { Name = "r_aarch64_tlsgd_adr_page21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsgd_add_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsgd_add_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsgd_add_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsgd_add_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsgd_movw_g1", (Term.prim_mk_const { Name = "r_aarch64_tlsgd_movw_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsgd_movw_g1", (Term.prim_mk_const { Name = "r_aarch64_tlsgd_movw_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsgd_movw_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsgd_movw_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsgd_movw_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsgd_movw_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_adr_prel21", (Term.prim_mk_const { Name = "r_aarch64_tlsld_adr_prel21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_adr_prel21", (Term.prim_mk_const { Name = "r_aarch64_tlsld_adr_prel21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_adr_page21", (Term.prim_mk_const { Name = "r_aarch64_tlsld_adr_page21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_adr_page21", (Term.prim_mk_const { Name = "r_aarch64_tlsld_adr_page21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_add_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_add_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_add_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_add_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_g1", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_g1", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ld_prel19", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ld_prel19", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ld_prel19", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ld_prel19", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_dtprel_g2", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_dtprel_g2", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_dtprel_g2", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_dtprel_g2", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_dtprel_g1", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_dtprel_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_dtprel_g1", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_dtprel_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_dtprel_g1_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_dtprel_g1_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_dtprel_g1_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_dtprel_g1_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_dtprel_g0", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_dtprel_g0", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_dtprel_g0", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_dtprel_g0", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_dtprel_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_dtprel_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_movw_dtprel_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_movw_dtprel_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_add_dtprel_hi12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_add_dtprel_hi12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_add_dtprel_hi12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_add_dtprel_hi12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_add_dtprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_add_dtprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_add_dtprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_add_dtprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_add_dtprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_add_dtprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_add_dtprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_add_dtprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst8_dtprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst8_dtprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst8_dtprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst8_dtprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst8_dtprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst8_dtprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst8_dtprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst8_dtprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst16_dtprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst16_dtprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst16_dtprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst16_dtprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst16_dtprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst16_dtprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst16_dtprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst16_dtprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst32_dtprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst32_dtprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst32_dtprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst32_dtprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst32_dtprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst32_dtprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst32_dtprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst32_dtprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst64_dtprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst64_dtprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst64_dtprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst64_dtprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst64_dtprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst64_dtprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst64_dtprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst64_dtprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst128_dtprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst128_dtprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst128_dtprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst128_dtprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst128_dtprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst128_dtprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsld_ldst128_dtprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsld_ldst128_dtprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsie_movw_gottprel_g1", (Term.prim_mk_const { Name = "r_aarch64_tlsie_movw_gottprel_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsie_movw_gottprel_g1", (Term.prim_mk_const { Name = "r_aarch64_tlsie_movw_gottprel_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsie_movw_gottprel_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsie_movw_gottprel_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsie_movw_gottprel_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsie_movw_gottprel_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsie_movw_gottprel_page21", (Term.prim_mk_const { Name = "r_aarch64_tlsie_movw_gottprel_page21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsie_movw_gottprel_page21", (Term.prim_mk_const { Name = "r_aarch64_tlsie_movw_gottprel_page21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsie_movw_gottprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsie_movw_gottprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsie_movw_gottprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsie_movw_gottprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsie_movw_gottprel_prel19", (Term.prim_mk_const { Name = "r_aarch64_tlsie_movw_gottprel_prel19", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsie_movw_gottprel_prel19", (Term.prim_mk_const { Name = "r_aarch64_tlsie_movw_gottprel_prel19", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsle_movw_tprel_g2", (Term.prim_mk_const { Name = "r_aarch64_tlsle_movw_tprel_g2", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsle_movw_tprel_g2", (Term.prim_mk_const { Name = "r_aarch64_tlsle_movw_tprel_g2", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsle_movw_tprel_g1", (Term.prim_mk_const { Name = "r_aarch64_tlsle_movw_tprel_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsle_movw_tprel_g1", (Term.prim_mk_const { Name = "r_aarch64_tlsle_movw_tprel_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsle_movw_tprel_g1_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsle_movw_tprel_g1_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsle_movw_tprel_g1_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsle_movw_tprel_g1_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsle_movw_tprel_g0", (Term.prim_mk_const { Name = "r_aarch64_tlsle_movw_tprel_g0", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsle_movw_tprel_g0", (Term.prim_mk_const { Name = "r_aarch64_tlsle_movw_tprel_g0", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsle_movw_tprel_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsle_movw_tprel_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsle_movw_tprel_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsle_movw_tprel_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_add_tprel_hi12", (Term.prim_mk_const { Name = "r_aarch64_add_tprel_hi12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_add_tprel_hi12", (Term.prim_mk_const { Name = "r_aarch64_add_tprel_hi12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_add_tprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_add_tprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_add_tprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_add_tprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_add_tprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_add_tprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_add_tprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_add_tprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst8_tprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_ldst8_tprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst8_tprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_ldst8_tprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst8_tprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst8_tprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst8_tprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst8_tprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst16_tprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_ldst16_tprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst16_tprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_ldst16_tprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst16_tprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst16_tprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst16_tprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst16_tprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst32_tprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_ldst32_tprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst32_tprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_ldst32_tprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst32_tprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst32_tprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst32_tprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst32_tprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst64_tprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_ldst64_tprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst64_tprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_ldst64_tprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst64_tprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst64_tprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst64_tprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst64_tprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst128_tprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_ldst128_tprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst128_tprel_lo12", (Term.prim_mk_const { Name = "r_aarch64_ldst128_tprel_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst128_tprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst128_tprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_ldst128_tprel_lo12_nc", (Term.prim_mk_const { Name = "r_aarch64_ldst128_tprel_lo12_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_ld_prel19", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_ld_prel19", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_ld_prel19", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_ld_prel19", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_adr_prel21", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_adr_prel21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_adr_prel21", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_adr_prel21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_adr_page21", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_adr_page21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_adr_page21", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_adr_page21", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_ld64_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_ld64_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_ld64_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_ld64_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_add_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_add_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_add_lo12", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_add_lo12", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_off_g1", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_off_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_off_g1", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_off_g1", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_off_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_off_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_off_g0_nc", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_off_g0_nc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_ldr", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_ldr", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_ldr", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_ldr", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_add", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_add", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_add", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_add", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_call", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_call", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc_call", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc_call", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_copy", (Term.prim_mk_const { Name = "r_aarch64_copy", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_copy", (Term.prim_mk_const { Name = "r_aarch64_copy", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_glob_dat", (Term.prim_mk_const { Name = "r_aarch64_glob_dat", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_glob_dat", (Term.prim_mk_const { Name = "r_aarch64_glob_dat", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_jump_slot", (Term.prim_mk_const { Name = "r_aarch64_jump_slot", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_jump_slot", (Term.prim_mk_const { Name = "r_aarch64_jump_slot", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_relative", (Term.prim_mk_const { Name = "r_aarch64_relative", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_relative", (Term.prim_mk_const { Name = "r_aarch64_relative", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tls_dtprel64", (Term.prim_mk_const { Name = "r_aarch64_tls_dtprel64", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tls_dtprel64", (Term.prim_mk_const { Name = "r_aarch64_tls_dtprel64", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tls_dtpmod64", (Term.prim_mk_const { Name = "r_aarch64_tls_dtpmod64", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tls_dtpmod64", (Term.prim_mk_const { Name = "r_aarch64_tls_dtpmod64", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tls_tprel64", (Term.prim_mk_const { Name = "r_aarch64_tls_tprel64", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tls_tprel64", (Term.prim_mk_const { Name = "r_aarch64_tls_tprel64", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_tlsdesc", (Term.prim_mk_const { Name = "r_aarch64_tlsdesc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_irelative", (Term.prim_mk_const { Name = "r_aarch64_irelative", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_aarch64_irelative", (Term.prim_mk_const { Name = "r_aarch64_irelative", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("aarch64_le_reloc", (Term.prim_mk_const { Name = "aarch64_le_reloc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("aarch64_le_reloc", (Term.prim_mk_const { Name = "aarch64_le_reloc", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_aarch64_apply_relocation", (Term.prim_mk_const { Name = "abi_aarch64_apply_relocation", Thy = "abi_aarch64_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("abi_aarch64_apply_relocation", (Term.prim_mk_const { Name = "abi_aarch64_apply_relocation", Thy = "abi_aarch64_relocation"}))
  val abi_aarch64_relocation_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "abi_aarch64_relocation",
    thydataty = "compute",
    data =
        "abi_aarch64_relocation.r_aarch64_none_def abi_aarch64_relocation.r_aarch64_tlsle_movw_tprel_g0_def abi_aarch64_relocation.abi_aarch64_apply_relocation_def abi_aarch64_relocation.aarch64_le_reloc_def abi_aarch64_relocation.r_aarch64_irelative_def abi_aarch64_relocation.r_aarch64_tlsdesc_def abi_aarch64_relocation.r_aarch64_tls_tprel64_def abi_aarch64_relocation.r_aarch64_tls_dtpmod64_def abi_aarch64_relocation.r_aarch64_tls_dtprel64_def abi_aarch64_relocation.r_aarch64_relative_def abi_aarch64_relocation.r_aarch64_jump_slot_def abi_aarch64_relocation.r_aarch64_glob_dat_def abi_aarch64_relocation.r_aarch64_copy_def abi_aarch64_relocation.r_aarch64_tlsdesc_call_def abi_aarch64_relocation.r_aarch64_tlsdesc_add_def abi_aarch64_relocation.r_aarch64_tlsdesc_ldr_def abi_aarch64_relocation.r_aarch64_tlsdesc_off_g0_nc_def abi_aarch64_relocation.r_aarch64_tlsdesc_off_g1_def abi_aarch64_relocation.r_aarch64_tlsdesc_add_lo12_def abi_aarch64_relocation.r_aarch64_tlsdesc_ld64_lo12_def abi_aarch64_relocation.r_aarch64_tlsdesc_adr_page21_def abi_aarch64_relocation.r_aarch64_tlsdesc_adr_prel21_def abi_aarch64_relocation.r_aarch64_tlsdesc_ld_prel19_def abi_aarch64_relocation.r_aarch64_ldst128_tprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_ldst128_tprel_lo12_def abi_aarch64_relocation.r_aarch64_ldst64_tprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_ldst64_tprel_lo12_def abi_aarch64_relocation.r_aarch64_ldst32_tprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_ldst32_tprel_lo12_def abi_aarch64_relocation.r_aarch64_ldst16_tprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_ldst16_tprel_lo12_def abi_aarch64_relocation.r_aarch64_ldst8_tprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_ldst8_tprel_lo12_def abi_aarch64_relocation.r_aarch64_add_tprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_add_tprel_lo12_def abi_aarch64_relocation.r_aarch64_add_tprel_hi12_def abi_aarch64_relocation.r_aarch64_tlsle_movw_tprel_g0_nc_def abi_aarch64_relocation.r_aarch64_tlsle_movw_tprel_g1_def abi_aarch64_relocation.r_aarch64_tlsle_movw_tprel_g1_nc_def abi_aarch64_relocation.r_aarch64_tlsle_movw_tprel_g2_def abi_aarch64_relocation.r_aarch64_tlsld_movw_dtprel_g1_nc_def abi_aarch64_relocation.r_aarch64_tlsie_movw_gottprel_prel19_def abi_aarch64_relocation.r_aarch64_tlsie_movw_gottprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_tlsie_movw_gottprel_page21_def abi_aarch64_relocation.r_aarch64_tlsie_movw_gottprel_g0_nc_def abi_aarch64_relocation.r_aarch64_tlsie_movw_gottprel_g1_def abi_aarch64_relocation.r_aarch64_tlsld_ldst128_dtprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_tlsld_ldst128_dtprel_lo12_def abi_aarch64_relocation.r_aarch64_tlsld_ldst64_dtprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_tlsld_ldst64_dtprel_lo12_def abi_aarch64_relocation.r_aarch64_tlsld_ldst32_dtprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_tlsld_ldst32_dtprel_lo12_def abi_aarch64_relocation.r_aarch64_tlsld_ldst16_dtprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_tlsld_ldst16_dtprel_lo12_def abi_aarch64_relocation.r_aarch64_tlsld_ldst8_dtprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_tlsld_ldst8_dtprel_lo12_def abi_aarch64_relocation.r_aarch64_tlsld_add_dtprel_lo12_nc_def abi_aarch64_relocation.r_aarch64_tlsld_add_dtprel_lo12_def abi_aarch64_relocation.r_aarch64_tlsld_add_dtprel_hi12_def abi_aarch64_relocation.r_aarch64_tlsld_movw_dtprel_g0_nc_def abi_aarch64_relocation.r_aarch64_tlsld_movw_dtprel_g0_def abi_aarch64_relocation.r_aarch64_tlsld_ld_prel19_def abi_aarch64_relocation.r_aarch64_tlsld_movw_dtprel_g1_def abi_aarch64_relocation.r_aarch64_tlsld_movw_dtprel_g2_def abi_aarch64_relocation.r_aarch64_tlsld_movw_g0_nc_def abi_aarch64_relocation.r_aarch64_tlsld_movw_g1_def abi_aarch64_relocation.r_aarch64_tlsld_add_lo12_nc_def abi_aarch64_relocation.r_aarch64_tlsld_adr_page21_def abi_aarch64_relocation.r_aarch64_tlsld_adr_prel21_def abi_aarch64_relocation.r_aarch64_tlsgd_movw_g0_nc_def abi_aarch64_relocation.r_aarch64_tlsgd_movw_g1_def abi_aarch64_relocation.r_aarch64_tlsgd_add_lo12_nc_def abi_aarch64_relocation.r_aarch64_tlsgd_adr_page21_def abi_aarch64_relocation.r_aarch64_tlsgd_adr_prel21_def abi_aarch64_relocation.r_aarch64_tstbr14_def abi_aarch64_relocation.r_aarch64_ld64_gotpage_lo15_def abi_aarch64_relocation.r_aarch64_ld64_got_lo12_nc_def abi_aarch64_relocation.r_aarch64_adr_got_page_def abi_aarch64_relocation.r_aarch64_got_ld64_gotoff_lo15_def abi_aarch64_relocation.r_aarch64_got_ld_prel19_def abi_aarch64_relocation.r_aarch64_gotrel32_def abi_aarch64_relocation.r_aarch64_gotrel64_def abi_aarch64_relocation.r_aarch64_movw_gotoff_g3_def abi_aarch64_relocation.r_aarch64_movw_gotoff_g2_nc_def abi_aarch64_relocation.r_aarch64_movw_gotoff_g2_def abi_aarch64_relocation.r_aarch64_movw_gotoff_g1_nc_def abi_aarch64_relocation.r_aarch64_movw_gotoff_g1_def abi_aarch64_relocation.r_aarch64_movw_gotoff_g0_nc_def abi_aarch64_relocation.r_aarch64_movw_gotoff_g0_def abi_aarch64_relocation.r_aarch64_movw_prel_g3_def abi_aarch64_relocation.r_aarch64_movw_prel_g2_nc_def abi_aarch64_relocation.r_aarch64_movw_prel_g2_def abi_aarch64_relocation.r_aarch64_movw_prel_g1_nc_def abi_aarch64_relocation.r_aarch64_movw_prel_g1_def abi_aarch64_relocation.r_aarch64_movw_prel_g0_nc_def abi_aarch64_relocation.r_aarch64_movw_prel_g0_def abi_aarch64_relocation.r_aarch64_call26_def abi_aarch64_relocation.r_aarch64_jump26_def abi_aarch64_relocation.r_aarch64_condbr19_def abi_aarch64_relocation.r_aarch64_prel16_def abi_aarch64_relocation.r_aarch64_ldst128_abs_lo12_nc_def abi_aarch64_relocation.r_aarch64_ldst64_abs_lo12_nc_def abi_aarch64_relocation.r_aarch64_ldst32_abs_lo12_nc_def abi_aarch64_relocation.r_aarch64_ldst16_abs_lo12_nc_def abi_aarch64_relocation.r_aarch64_ldst8_abs_lo12_nc_def abi_aarch64_relocation.r_aarch64_add_abs_lo12_nc_def abi_aarch64_relocation.r_aarch64_adr_prel_pg_hi21_nc_def abi_aarch64_relocation.r_aarch64_adr_prel_pg_hi21_def abi_aarch64_relocation.r_aarch64_adr_prel_lo21_def abi_aarch64_relocation.r_aarch64_ld_prel_lo19_def abi_aarch64_relocation.r_aarch64_movw_sabs_g2_def abi_aarch64_relocation.r_aarch64_movw_sabs_g1_def abi_aarch64_relocation.r_aarch64_movw_sabs_g0_def abi_aarch64_relocation.r_aarch64_movw_uabs_g3_def abi_aarch64_relocation.r_aarch64_movw_uabs_g2_nc_def abi_aarch64_relocation.r_aarch64_movw_uabs_g2_def abi_aarch64_relocation.r_aarch64_movw_uabs_g1_nc_def abi_aarch64_relocation.r_aarch64_movw_uabs_g1_def abi_aarch64_relocation.r_aarch64_movw_uabs_g0_nc_def abi_aarch64_relocation.r_aarch64_movw_uabs_g0_def abi_aarch64_relocation.r_aarch64_prel32_def abi_aarch64_relocation.r_aarch64_prel64_def abi_aarch64_relocation.r_aarch64_withdrawn_def abi_aarch64_relocation.r_aarch64_abs16_def abi_aarch64_relocation.r_aarch64_abs32_def abi_aarch64_relocation.r_aarch64_abs64_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_aarch64_relocation"
end
