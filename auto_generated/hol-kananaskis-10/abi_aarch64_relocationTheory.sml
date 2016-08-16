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
          Arbnum.fromString "1471355406",
          Arbnum.fromString "848692")
          [("abi_utilities",
           Arbnum.fromString "1471355380",
           Arbnum.fromString "362513")];
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
   TYOP [14], TYOP [1, 24, 23], TYV "'f", TYOP [1, 26, 26], TYV "'e",
   TYOP [1, 28, 27], TYV "'d", TYOP [1, 30, 29], TYOP [4, 0, 31], TYV "'c",
   TYOP [1, 33, 32], TYV "'b", TYOP [1, 35, 34], TYOP [1, 1, 36],
   TYOP [4, 15, 37], TYOP [1, 0, 38], TYOP [1, 19, 15], TYOP [1, 40, 15],
   TYOP [1, 24, 15], TYOP [1, 42, 15], TYOP [1, 5, 15], TYOP [1, 44, 15],
   TYOP [1, 0, 15], TYOP [1, 46, 15], TYOP [1, 37, 38], TYOP [1, 15, 48],
   TYOP [4, 16, 7], TYOP [1, 7, 50], TYOP [1, 16, 51], TYOP [1, 2, 4],
   TYOP [1, 3, 53], TYOP [1, 31, 32], TYOP [1, 0, 55], TYOP [17],
   TYOP [4, 57, 6], TYOP [1, 6, 58], TYOP [1, 57, 59], TYOP [4, 6, 6],
   TYOP [18], TYOP [4, 62, 61], TYOP [1, 61, 63], TYOP [1, 62, 64],
   TYOP [1, 4, 7], TYOP [1, 6, 66], TYOP [1, 6, 61], TYOP [1, 6, 68],
   TYOP [1, 18, 15], TYOP [1, 18, 70], TYOP [1, 0, 46], TYOP [1, 38, 15],
   TYOP [1, 38, 73], TYOP [1, 58, 6], TYOP [1, 63, 6], TYOP [1, 0, 0],
   TYOP [26], TYOP [1, 0, 78], TYOP [1, 18, 18], TYOP [1, 18, 80],
   TYOP [1, 15, 81], TYOP [1, 38, 38], TYOP [1, 38, 83], TYOP [1, 15, 84],
   TYOP [29, 78], TYOP [1, 86, 86], TYOP [1, 78, 87], TYOP [1, 50, 17],
   TYOP [1, 17, 89], TYOP [1, 16, 18], TYOP [1, 91, 91], TYOP [1, 5, 18],
   TYOP [1, 93, 93], TYOP [1, 0, 18], TYOP [1, 95, 95], TYOP [1, 6, 18],
   TYOP [1, 97, 97], TYOP [1, 5, 6], TYOP [1, 61, 6], TYOP [74],
   TYOP [1, 19, 101], TYOP [1, 24, 16], TYOP [1, 86, 18], TYOP [1, 24, 0],
   TYOP [1, 5, 5], TYOP [1, 5, 106], TYOP [1, 101, 15], TYOP [1, 17, 18],
   TYOP [1, 16, 5]]
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
      ("abi_aarch64_apply_relocation", 25), ("aarch64_le_reloc", 39)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("a", 28), TMV("a_val", 5), TMV("addr", 16), TMV("e", 26),
   TMV("ef", 19), TMV("got_val", 5), TMV("img", 1), TMV("p_val", 5),
   TMV("r", 0), TMV("rel", 24), TMV("rel_type", 0), TMV("result", 6),
   TMV("rr", 33), TMV("s", 30), TMV("s_val", 5), TMV("site_addr", 35),
   TMC(15, 41), TMC(15, 43), TMC(15, 45), TMC(15, 47), TMC(16, 49),
   TMC(16, 52), TMC(16, 54), TMC(16, 56), TMC(16, 60), TMC(16, 65),
   TMC(16, 67), TMC(16, 69), TMC(19, 0), TMC(20, 71), TMC(20, 72),
   TMC(20, 74), TMC(21, 75), TMC(22, 76), TMC(23, 77), TMC(24, 77),
   TMC(25, 79), TMC(27, 82), TMC(27, 85), TMC(28, 88), TMC(30, 2),
   TMC(31, 2), TMC(32, 57), TMC(33, 57), TMC(34, 15), TMC(35, 17),
   TMC(36, 90), TMC(37, 57), TMC(38, 57), TMC(39, 57), TMC(40, 57),
   TMC(41, 62), TMC(42, 57), TMC(43, 3), TMC(44, 3), TMC(45, 3),
   TMC(46, 3), TMC(47, 3), TMC(48, 3), TMC(49, 3), TMC(50, 3), TMC(51, 3),
   TMC(52, 57), TMC(53, 57), TMC(54, 92), TMC(54, 94), TMC(54, 96),
   TMC(54, 98), TMC(55, 99), TMC(56, 100), TMC(57, 86), TMC(58, 77),
   TMC(59, 57), TMC(60, 100), TMC(61, 57), TMC(62, 57), TMC(63, 3),
   TMC(64, 3), TMC(65, 3), TMC(66, 3), TMC(67, 3), TMC(68, 3), TMC(69, 3),
   TMC(70, 0), TMC(71, 39), TMC(72, 25), TMC(73, 102), TMC(75, 103),
   TMC(76, 103), TMC(77, 104), TMC(78, 105), TMC(79, 107), TMC(80, 107),
   TMC(81, 108), TMC(82, 37), TMC(83, 0), TMC(84, 0), TMC(85, 0),
   TMC(86, 0), TMC(87, 0), TMC(88, 0), TMC(89, 0), TMC(90, 0), TMC(91, 0),
   TMC(92, 0), TMC(93, 0), TMC(94, 0), TMC(95, 0), TMC(96, 0), TMC(97, 0),
   TMC(98, 0), TMC(99, 0), TMC(100, 0), TMC(101, 0), TMC(102, 0),
   TMC(103, 0), TMC(104, 0), TMC(105, 0), TMC(106, 0), TMC(107, 0),
   TMC(108, 0), TMC(109, 0), TMC(110, 0), TMC(111, 0), TMC(112, 0),
   TMC(113, 0), TMC(114, 0), TMC(115, 0), TMC(116, 0), TMC(117, 0),
   TMC(118, 0), TMC(119, 0), TMC(120, 0), TMC(121, 0), TMC(122, 0),
   TMC(123, 0), TMC(124, 0), TMC(125, 0), TMC(126, 0), TMC(127, 0),
   TMC(128, 0), TMC(129, 0), TMC(130, 0), TMC(131, 0), TMC(132, 0),
   TMC(133, 0), TMC(134, 0), TMC(135, 0), TMC(136, 0), TMC(137, 0),
   TMC(138, 0), TMC(139, 0), TMC(140, 0), TMC(141, 0), TMC(142, 0),
   TMC(143, 0), TMC(144, 0), TMC(145, 0), TMC(146, 0), TMC(147, 0),
   TMC(148, 0), TMC(149, 0), TMC(150, 0), TMC(151, 0), TMC(152, 0),
   TMC(153, 0), TMC(154, 0), TMC(155, 0), TMC(156, 0), TMC(157, 0),
   TMC(158, 0), TMC(159, 0), TMC(160, 0), TMC(161, 0), TMC(162, 0),
   TMC(163, 0), TMC(164, 0), TMC(165, 0), TMC(166, 0), TMC(167, 0),
   TMC(168, 0), TMC(169, 0), TMC(170, 0), TMC(171, 0), TMC(172, 0),
   TMC(173, 0), TMC(174, 0), TMC(175, 0), TMC(176, 0), TMC(177, 0),
   TMC(178, 0), TMC(179, 0), TMC(180, 0), TMC(181, 0), TMC(182, 0),
   TMC(183, 0), TMC(184, 0), TMC(185, 0), TMC(186, 0), TMC(187, 0),
   TMC(188, 0), TMC(189, 0), TMC(190, 0), TMC(191, 0), TMC(192, 0),
   TMC(193, 0), TMC(194, 0), TMC(195, 0), TMC(196, 0), TMC(197, 0),
   TMC(198, 0), TMC(199, 0), TMC(200, 0), TMC(201, 0), TMC(202, 0),
   TMC(203, 0), TMC(204, 0), TMC(205, 0), TMC(206, 0), TMC(207, 109),
   TMC(208, 110)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op r_aarch64_none_def x = x
    val op r_aarch64_none_def =
    DT(((("abi_aarch64_relocation",0),[]),[]), [read"%30%159@%28@"])
  fun op r_aarch64_withdrawn_def x = x
    val op r_aarch64_withdrawn_def =
    DT(((("abi_aarch64_relocation",1),[]),[]),
       [read"%30%218@%71%35%34%34%34%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_abs64_def x = x
    val op r_aarch64_abs64_def =
    DT(((("abi_aarch64_relocation",2),[]),[]),
       [read"%30%97@%71%34%35%34%34%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_abs32_def x = x
    val op r_aarch64_abs32_def =
    DT(((("abi_aarch64_relocation",3),[]),[]),
       [read"%30%96@%71%35%35%34%34%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_abs16_def x = x
    val op r_aarch64_abs16_def =
    DT(((("abi_aarch64_relocation",4),[]),[]),
       [read"%30%95@%71%34%34%35%34%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_prel64_def x = x
    val op r_aarch64_prel64_def =
    DT(((("abi_aarch64_relocation",5),[]),[]),
       [read"%30%162@%71%35%34%35%34%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_prel32_def x = x
    val op r_aarch64_prel32_def =
    DT(((("abi_aarch64_relocation",6),[]),[]),
       [read"%30%161@%71%34%35%35%34%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_prel16_def x = x
    val op r_aarch64_prel16_def =
    DT(((("abi_aarch64_relocation",7),[]),[]),
       [read"%30%160@%71%35%35%35%34%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g0_def x = x
    val op r_aarch64_movw_uabs_g0_def =
    DT(((("abi_aarch64_relocation",8),[]),[]),
       [read"%30%152@%71%34%34%34%35%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g0_nc_def x = x
    val op r_aarch64_movw_uabs_g0_nc_def =
    DT(((("abi_aarch64_relocation",9),[]),[]),
       [read"%30%153@%71%35%34%34%35%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g1_def x = x
    val op r_aarch64_movw_uabs_g1_def =
    DT(((("abi_aarch64_relocation",10),[]),[]),
       [read"%30%154@%71%34%35%34%35%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g1_nc_def x = x
    val op r_aarch64_movw_uabs_g1_nc_def =
    DT(((("abi_aarch64_relocation",11),[]),[]),
       [read"%30%155@%71%35%35%34%35%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g2_def x = x
    val op r_aarch64_movw_uabs_g2_def =
    DT(((("abi_aarch64_relocation",12),[]),[]),
       [read"%30%156@%71%34%34%35%35%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g2_nc_def x = x
    val op r_aarch64_movw_uabs_g2_nc_def =
    DT(((("abi_aarch64_relocation",13),[]),[]),
       [read"%30%157@%71%35%34%35%35%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_uabs_g3_def x = x
    val op r_aarch64_movw_uabs_g3_def =
    DT(((("abi_aarch64_relocation",14),[]),[]),
       [read"%30%158@%71%34%35%35%35%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_sabs_g0_def x = x
    val op r_aarch64_movw_sabs_g0_def =
    DT(((("abi_aarch64_relocation",15),[]),[]),
       [read"%30%149@%71%35%35%35%35%34%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_sabs_g1_def x = x
    val op r_aarch64_movw_sabs_g1_def =
    DT(((("abi_aarch64_relocation",16),[]),[]),
       [read"%30%150@%71%34%34%34%34%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_sabs_g2_def x = x
    val op r_aarch64_movw_sabs_g2_def =
    DT(((("abi_aarch64_relocation",17),[]),[]),
       [read"%30%151@%71%35%34%34%34%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_ld_prel_lo19_def x = x
    val op r_aarch64_ld_prel_lo19_def =
    DT(((("abi_aarch64_relocation",18),[]),[]),
       [read"%30%119@%71%34%35%34%34%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_adr_prel_lo21_def x = x
    val op r_aarch64_adr_prel_lo21_def =
    DT(((("abi_aarch64_relocation",19),[]),[]),
       [read"%30%103@%71%35%35%34%34%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_adr_prel_pg_hi21_def x = x
    val op r_aarch64_adr_prel_pg_hi21_def =
    DT(((("abi_aarch64_relocation",20),[]),[]),
       [read"%30%104@%71%34%34%35%34%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_adr_prel_pg_hi21_nc_def x = x
    val op r_aarch64_adr_prel_pg_hi21_nc_def =
    DT(((("abi_aarch64_relocation",21),[]),[]),
       [read"%30%105@%71%35%34%35%34%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_add_abs_lo12_nc_def x = x
    val op r_aarch64_add_abs_lo12_nc_def =
    DT(((("abi_aarch64_relocation",22),[]),[]),
       [read"%30%98@%71%34%35%35%34%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_ldst8_abs_lo12_nc_def x = x
    val op r_aarch64_ldst8_abs_lo12_nc_def =
    DT(((("abi_aarch64_relocation",23),[]),[]),
       [read"%30%132@%71%35%35%35%34%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_ldst16_abs_lo12_nc_def x = x
    val op r_aarch64_ldst16_abs_lo12_nc_def =
    DT(((("abi_aarch64_relocation",24),[]),[]),
       [read"%30%123@%71%35%34%35%35%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_ldst32_abs_lo12_nc_def x = x
    val op r_aarch64_ldst32_abs_lo12_nc_def =
    DT(((("abi_aarch64_relocation",25),[]),[]),
       [read"%30%126@%71%34%35%35%35%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_ldst64_abs_lo12_nc_def x = x
    val op r_aarch64_ldst64_abs_lo12_nc_def =
    DT(((("abi_aarch64_relocation",26),[]),[]),
       [read"%30%129@%71%35%35%35%35%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_ldst128_abs_lo12_nc_def x = x
    val op r_aarch64_ldst128_abs_lo12_nc_def =
    DT(((("abi_aarch64_relocation",27),[]),[]),
       [read"%30%120@%71%34%34%35%35%34%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_tstbr14_def x = x
    val op r_aarch64_tstbr14_def =
    DT(((("abi_aarch64_relocation",28),[]),[]),
       [read"%30%217@%71%34%34%34%35%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_condbr19_def x = x
    val op r_aarch64_condbr19_def =
    DT(((("abi_aarch64_relocation",29),[]),[]),
       [read"%30%107@%71%35%34%34%35%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_jump26_def x = x
    val op r_aarch64_jump26_def =
    DT(((("abi_aarch64_relocation",30),[]),[]),
       [read"%30%115@%71%35%35%34%35%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_call26_def x = x
    val op r_aarch64_call26_def =
    DT(((("abi_aarch64_relocation",31),[]),[]),
       [read"%30%106@%71%34%34%35%35%35%34%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g0_def x = x
    val op r_aarch64_movw_prel_g0_def =
    DT(((("abi_aarch64_relocation",32),[]),[]),
       [read"%30%142@%71%34%34%34%34%34%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g0_nc_def x = x
    val op r_aarch64_movw_prel_g0_nc_def =
    DT(((("abi_aarch64_relocation",33),[]),[]),
       [read"%30%143@%71%35%34%34%34%34%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g1_def x = x
    val op r_aarch64_movw_prel_g1_def =
    DT(((("abi_aarch64_relocation",34),[]),[]),
       [read"%30%144@%71%34%35%34%34%34%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g1_nc_def x = x
    val op r_aarch64_movw_prel_g1_nc_def =
    DT(((("abi_aarch64_relocation",35),[]),[]),
       [read"%30%145@%71%35%35%34%34%34%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g2_def x = x
    val op r_aarch64_movw_prel_g2_def =
    DT(((("abi_aarch64_relocation",36),[]),[]),
       [read"%30%146@%71%34%34%35%34%34%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g2_nc_def x = x
    val op r_aarch64_movw_prel_g2_nc_def =
    DT(((("abi_aarch64_relocation",37),[]),[]),
       [read"%30%147@%71%35%34%35%34%34%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_prel_g3_def x = x
    val op r_aarch64_movw_prel_g3_def =
    DT(((("abi_aarch64_relocation",38),[]),[]),
       [read"%30%148@%71%34%35%35%34%34%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g0_def x = x
    val op r_aarch64_movw_gotoff_g0_def =
    DT(((("abi_aarch64_relocation",39),[]),[]),
       [read"%30%135@%71%35%34%35%35%34%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g0_nc_def x = x
    val op r_aarch64_movw_gotoff_g0_nc_def =
    DT(((("abi_aarch64_relocation",40),[]),[]),
       [read"%30%136@%71%34%35%35%35%34%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g1_def x = x
    val op r_aarch64_movw_gotoff_g1_def =
    DT(((("abi_aarch64_relocation",41),[]),[]),
       [read"%30%137@%71%35%35%35%35%34%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g1_nc_def x = x
    val op r_aarch64_movw_gotoff_g1_nc_def =
    DT(((("abi_aarch64_relocation",42),[]),[]),
       [read"%30%138@%71%34%34%34%34%35%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g2_def x = x
    val op r_aarch64_movw_gotoff_g2_def =
    DT(((("abi_aarch64_relocation",43),[]),[]),
       [read"%30%139@%71%35%34%34%34%35%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g2_nc_def x = x
    val op r_aarch64_movw_gotoff_g2_nc_def =
    DT(((("abi_aarch64_relocation",44),[]),[]),
       [read"%30%140@%71%34%35%34%34%35%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_movw_gotoff_g3_def x = x
    val op r_aarch64_movw_gotoff_g3_def =
    DT(((("abi_aarch64_relocation",45),[]),[]),
       [read"%30%141@%71%35%35%34%34%35%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_gotrel64_def x = x
    val op r_aarch64_gotrel64_def =
    DT(((("abi_aarch64_relocation",46),[]),[]),
       [read"%30%113@%71%34%34%35%34%35%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_gotrel32_def x = x
    val op r_aarch64_gotrel32_def =
    DT(((("abi_aarch64_relocation",47),[]),[]),
       [read"%30%112@%71%35%34%35%34%35%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_got_ld_prel19_def x = x
    val op r_aarch64_got_ld_prel19_def =
    DT(((("abi_aarch64_relocation",48),[]),[]),
       [read"%30%111@%71%34%35%35%34%35%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_got_ld64_gotoff_lo15_def x = x
    val op r_aarch64_got_ld64_gotoff_lo15_def =
    DT(((("abi_aarch64_relocation",49),[]),[]),
       [read"%30%110@%71%35%35%35%34%35%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_adr_got_page_def x = x
    val op r_aarch64_adr_got_page_def =
    DT(((("abi_aarch64_relocation",50),[]),[]),
       [read"%30%102@%71%34%34%34%35%35%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_ld64_got_lo12_nc_def x = x
    val op r_aarch64_ld64_got_lo12_nc_def =
    DT(((("abi_aarch64_relocation",51),[]),[]),
       [read"%30%117@%71%35%34%34%35%35%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_ld64_gotpage_lo15_def x = x
    val op r_aarch64_ld64_gotpage_lo15_def =
    DT(((("abi_aarch64_relocation",52),[]),[]),
       [read"%30%118@%71%34%35%34%35%35%35%34%34%83@@@@@@@@@@"])
  fun op r_aarch64_tlsgd_adr_prel21_def x = x
    val op r_aarch64_tlsgd_adr_prel21_def =
    DT(((("abi_aarch64_relocation",53),[]),[]),
       [read"%30%180@%71%35%34%34%34%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsgd_adr_page21_def x = x
    val op r_aarch64_tlsgd_adr_page21_def =
    DT(((("abi_aarch64_relocation",54),[]),[]),
       [read"%30%179@%71%34%35%34%34%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsgd_add_lo12_nc_def x = x
    val op r_aarch64_tlsgd_add_lo12_nc_def =
    DT(((("abi_aarch64_relocation",55),[]),[]),
       [read"%30%178@%71%35%35%34%34%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsgd_movw_g1_def x = x
    val op r_aarch64_tlsgd_movw_g1_def =
    DT(((("abi_aarch64_relocation",56),[]),[]),
       [read"%30%182@%71%34%34%35%34%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsgd_movw_g0_nc_def x = x
    val op r_aarch64_tlsgd_movw_g0_nc_def =
    DT(((("abi_aarch64_relocation",57),[]),[]),
       [read"%30%181@%71%35%34%35%34%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_adr_prel21_def x = x
    val op r_aarch64_tlsld_adr_prel21_def =
    DT(((("abi_aarch64_relocation",58),[]),[]),
       [read"%30%193@%71%34%35%35%34%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_adr_page21_def x = x
    val op r_aarch64_tlsld_adr_page21_def =
    DT(((("abi_aarch64_relocation",59),[]),[]),
       [read"%30%192@%71%35%35%35%34%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_add_lo12_nc_def x = x
    val op r_aarch64_tlsld_add_lo12_nc_def =
    DT(((("abi_aarch64_relocation",60),[]),[]),
       [read"%30%191@%71%34%34%34%35%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_g1_def x = x
    val op r_aarch64_tlsld_movw_g1_def =
    DT(((("abi_aarch64_relocation",61),[]),[]),
       [read"%30%211@%71%35%34%34%35%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_g0_nc_def x = x
    val op r_aarch64_tlsld_movw_g0_nc_def =
    DT(((("abi_aarch64_relocation",62),[]),[]),
       [read"%30%210@%71%34%35%34%35%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ld_prel19_def x = x
    val op r_aarch64_tlsld_ld_prel19_def =
    DT(((("abi_aarch64_relocation",63),[]),[]),
       [read"%30%194@%71%35%35%34%35%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_dtprel_g2_def x = x
    val op r_aarch64_tlsld_movw_dtprel_g2_def =
    DT(((("abi_aarch64_relocation",64),[]),[]),
       [read"%30%209@%71%34%34%35%35%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_dtprel_g1_def x = x
    val op r_aarch64_tlsld_movw_dtprel_g1_def =
    DT(((("abi_aarch64_relocation",65),[]),[]),
       [read"%30%207@%71%35%34%35%35%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_dtprel_g1_nc_def x = x
    val op r_aarch64_tlsld_movw_dtprel_g1_nc_def =
    DT(((("abi_aarch64_relocation",66),[]),[]),
       [read"%30%208@%71%34%35%35%35%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_dtprel_g0_def x = x
    val op r_aarch64_tlsld_movw_dtprel_g0_def =
    DT(((("abi_aarch64_relocation",67),[]),[]),
       [read"%30%205@%71%35%35%35%35%34%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_movw_dtprel_g0_nc_def x = x
    val op r_aarch64_tlsld_movw_dtprel_g0_nc_def =
    DT(((("abi_aarch64_relocation",68),[]),[]),
       [read"%30%206@%71%34%34%34%34%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_add_dtprel_hi12_def x = x
    val op r_aarch64_tlsld_add_dtprel_hi12_def =
    DT(((("abi_aarch64_relocation",69),[]),[]),
       [read"%30%188@%71%35%34%34%34%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_add_dtprel_lo12_def x = x
    val op r_aarch64_tlsld_add_dtprel_lo12_def =
    DT(((("abi_aarch64_relocation",70),[]),[]),
       [read"%30%189@%71%34%35%34%34%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_add_dtprel_lo12_nc_def x = x
    val op r_aarch64_tlsld_add_dtprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",71),[]),[]),
       [read"%30%190@%71%35%35%34%34%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst8_dtprel_lo12_def x = x
    val op r_aarch64_tlsld_ldst8_dtprel_lo12_def =
    DT(((("abi_aarch64_relocation",72),[]),[]),
       [read"%30%203@%71%34%34%35%34%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst8_dtprel_lo12_nc_def x = x
    val op r_aarch64_tlsld_ldst8_dtprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",73),[]),[]),
       [read"%30%204@%71%35%34%35%34%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst16_dtprel_lo12_def x = x
    val op r_aarch64_tlsld_ldst16_dtprel_lo12_def =
    DT(((("abi_aarch64_relocation",74),[]),[]),
       [read"%30%197@%71%34%35%35%34%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst16_dtprel_lo12_nc_def x = x
    val op r_aarch64_tlsld_ldst16_dtprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",75),[]),[]),
       [read"%30%198@%71%35%35%35%34%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst32_dtprel_lo12_def x = x
    val op r_aarch64_tlsld_ldst32_dtprel_lo12_def =
    DT(((("abi_aarch64_relocation",76),[]),[]),
       [read"%30%199@%71%34%34%34%35%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst32_dtprel_lo12_nc_def x = x
    val op r_aarch64_tlsld_ldst32_dtprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",77),[]),[]),
       [read"%30%200@%71%35%34%34%35%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst64_dtprel_lo12_def x = x
    val op r_aarch64_tlsld_ldst64_dtprel_lo12_def =
    DT(((("abi_aarch64_relocation",78),[]),[]),
       [read"%30%201@%71%34%35%34%35%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst64_dtprel_lo12_nc_def x = x
    val op r_aarch64_tlsld_ldst64_dtprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",79),[]),[]),
       [read"%30%202@%71%35%35%34%35%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst128_dtprel_lo12_def x = x
    val op r_aarch64_tlsld_ldst128_dtprel_lo12_def =
    DT(((("abi_aarch64_relocation",80),[]),[]),
       [read"%30%195@%71%35%34%35%35%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsld_ldst128_dtprel_lo12_nc_def x = x
    val op r_aarch64_tlsld_ldst128_dtprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",81),[]),[]),
       [read"%30%196@%71%34%35%35%35%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsie_movw_gottprel_g1_def x = x
    val op r_aarch64_tlsie_movw_gottprel_g1_def =
    DT(((("abi_aarch64_relocation",82),[]),[]),
       [read"%30%184@%71%34%34%35%35%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsie_movw_gottprel_g0_nc_def x = x
    val op r_aarch64_tlsie_movw_gottprel_g0_nc_def =
    DT(((("abi_aarch64_relocation",83),[]),[]),
       [read"%30%183@%71%35%34%35%35%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsie_movw_gottprel_page21_def x = x
    val op r_aarch64_tlsie_movw_gottprel_page21_def =
    DT(((("abi_aarch64_relocation",84),[]),[]),
       [read"%30%186@%71%34%35%35%35%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsie_movw_gottprel_lo12_nc_def x = x
    val op r_aarch64_tlsie_movw_gottprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",85),[]),[]),
       [read"%30%185@%71%35%35%35%35%35%34%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsie_movw_gottprel_prel19_def x = x
    val op r_aarch64_tlsie_movw_gottprel_prel19_def =
    DT(((("abi_aarch64_relocation",86),[]),[]),
       [read"%30%187@%71%34%34%34%34%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsle_movw_tprel_g2_def x = x
    val op r_aarch64_tlsle_movw_tprel_g2_def =
    DT(((("abi_aarch64_relocation",87),[]),[]),
       [read"%30%216@%71%35%34%34%34%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsle_movw_tprel_g1_def x = x
    val op r_aarch64_tlsle_movw_tprel_g1_def =
    DT(((("abi_aarch64_relocation",88),[]),[]),
       [read"%30%214@%71%34%35%34%34%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsle_movw_tprel_g1_nc_def x = x
    val op r_aarch64_tlsle_movw_tprel_g1_nc_def =
    DT(((("abi_aarch64_relocation",89),[]),[]),
       [read"%30%215@%71%35%35%34%34%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsle_movw_tprel_g0_def x = x
    val op r_aarch64_tlsle_movw_tprel_g0_def =
    DT(((("abi_aarch64_relocation",90),[]),[]),
       [read"%30%212@%71%34%34%35%34%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsle_movw_tprel_g0_nc_def x = x
    val op r_aarch64_tlsle_movw_tprel_g0_nc_def =
    DT(((("abi_aarch64_relocation",91),[]),[]),
       [read"%30%213@%71%35%34%35%34%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_add_tprel_hi12_def x = x
    val op r_aarch64_add_tprel_hi12_def =
    DT(((("abi_aarch64_relocation",92),[]),[]),
       [read"%30%99@%71%34%35%35%34%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_add_tprel_lo12_def x = x
    val op r_aarch64_add_tprel_lo12_def =
    DT(((("abi_aarch64_relocation",93),[]),[]),
       [read"%30%100@%71%35%35%35%34%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_add_tprel_lo12_nc_def x = x
    val op r_aarch64_add_tprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",94),[]),[]),
       [read"%30%101@%71%34%34%34%35%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_ldst8_tprel_lo12_def x = x
    val op r_aarch64_ldst8_tprel_lo12_def =
    DT(((("abi_aarch64_relocation",95),[]),[]),
       [read"%30%133@%71%35%34%34%35%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_ldst8_tprel_lo12_nc_def x = x
    val op r_aarch64_ldst8_tprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",96),[]),[]),
       [read"%30%134@%71%34%35%34%35%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_ldst16_tprel_lo12_def x = x
    val op r_aarch64_ldst16_tprel_lo12_def =
    DT(((("abi_aarch64_relocation",97),[]),[]),
       [read"%30%124@%71%35%35%34%35%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_ldst16_tprel_lo12_nc_def x = x
    val op r_aarch64_ldst16_tprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",98),[]),[]),
       [read"%30%125@%71%34%34%35%35%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_ldst32_tprel_lo12_def x = x
    val op r_aarch64_ldst32_tprel_lo12_def =
    DT(((("abi_aarch64_relocation",99),[]),[]),
       [read"%30%127@%71%35%34%35%35%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_ldst32_tprel_lo12_nc_def x = x
    val op r_aarch64_ldst32_tprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",100),[]),[]),
       [read"%30%128@%71%34%35%35%35%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_ldst64_tprel_lo12_def x = x
    val op r_aarch64_ldst64_tprel_lo12_def =
    DT(((("abi_aarch64_relocation",101),[]),[]),
       [read"%30%130@%71%35%35%35%35%34%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_ldst64_tprel_lo12_nc_def x = x
    val op r_aarch64_ldst64_tprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",102),[]),[]),
       [read"%30%131@%71%34%34%34%34%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_ldst128_tprel_lo12_def x = x
    val op r_aarch64_ldst128_tprel_lo12_def =
    DT(((("abi_aarch64_relocation",103),[]),[]),
       [read"%30%121@%71%35%35%34%35%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_ldst128_tprel_lo12_nc_def x = x
    val op r_aarch64_ldst128_tprel_lo12_nc_def =
    DT(((("abi_aarch64_relocation",104),[]),[]),
       [read"%30%122@%71%34%34%35%35%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_ld_prel19_def x = x
    val op r_aarch64_tlsdesc_ld_prel19_def =
    DT(((("abi_aarch64_relocation",105),[]),[]),
       [read"%30%174@%71%35%34%34%34%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_adr_prel21_def x = x
    val op r_aarch64_tlsdesc_adr_prel21_def =
    DT(((("abi_aarch64_relocation",106),[]),[]),
       [read"%30%171@%71%34%35%34%34%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_adr_page21_def x = x
    val op r_aarch64_tlsdesc_adr_page21_def =
    DT(((("abi_aarch64_relocation",107),[]),[]),
       [read"%30%170@%71%35%35%34%34%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_ld64_lo12_def x = x
    val op r_aarch64_tlsdesc_ld64_lo12_def =
    DT(((("abi_aarch64_relocation",108),[]),[]),
       [read"%30%173@%71%34%34%35%34%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_add_lo12_def x = x
    val op r_aarch64_tlsdesc_add_lo12_def =
    DT(((("abi_aarch64_relocation",109),[]),[]),
       [read"%30%169@%71%35%34%35%34%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_off_g1_def x = x
    val op r_aarch64_tlsdesc_off_g1_def =
    DT(((("abi_aarch64_relocation",110),[]),[]),
       [read"%30%177@%71%34%35%35%34%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_off_g0_nc_def x = x
    val op r_aarch64_tlsdesc_off_g0_nc_def =
    DT(((("abi_aarch64_relocation",111),[]),[]),
       [read"%30%176@%71%35%35%35%34%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_ldr_def x = x
    val op r_aarch64_tlsdesc_ldr_def =
    DT(((("abi_aarch64_relocation",112),[]),[]),
       [read"%30%175@%71%34%34%34%35%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_add_def x = x
    val op r_aarch64_tlsdesc_add_def =
    DT(((("abi_aarch64_relocation",113),[]),[]),
       [read"%30%168@%71%35%34%34%35%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_call_def x = x
    val op r_aarch64_tlsdesc_call_def =
    DT(((("abi_aarch64_relocation",114),[]),[]),
       [read"%30%172@%71%34%35%34%35%35%35%34%34%34%83@@@@@@@@@@@"])
  fun op r_aarch64_copy_def x = x
    val op r_aarch64_copy_def =
    DT(((("abi_aarch64_relocation",115),[]),[]),
       [read"%30%108@%71%35%34%34%34%34%34%34%34%34%34%83@@@@@@@@@@@@"])
  fun op r_aarch64_glob_dat_def x = x
    val op r_aarch64_glob_dat_def =
    DT(((("abi_aarch64_relocation",116),[]),[]),
       [read"%30%109@%71%34%35%34%34%34%34%34%34%34%34%83@@@@@@@@@@@@"])
  fun op r_aarch64_jump_slot_def x = x
    val op r_aarch64_jump_slot_def =
    DT(((("abi_aarch64_relocation",117),[]),[]),
       [read"%30%116@%71%35%35%34%34%34%34%34%34%34%34%83@@@@@@@@@@@@"])
  fun op r_aarch64_relative_def x = x
    val op r_aarch64_relative_def =
    DT(((("abi_aarch64_relocation",118),[]),[]),
       [read"%30%163@%71%34%34%35%34%34%34%34%34%34%34%83@@@@@@@@@@@@"])
  fun op r_aarch64_tls_dtprel64_def x = x
    val op r_aarch64_tls_dtprel64_def =
    DT(((("abi_aarch64_relocation",119),[]),[]),
       [read"%30%165@%71%35%34%35%34%34%34%34%34%34%34%83@@@@@@@@@@@@"])
  fun op r_aarch64_tls_dtpmod64_def x = x
    val op r_aarch64_tls_dtpmod64_def =
    DT(((("abi_aarch64_relocation",120),[]),[]),
       [read"%30%164@%71%34%35%35%34%34%34%34%34%34%34%83@@@@@@@@@@@@"])
  fun op r_aarch64_tls_tprel64_def x = x
    val op r_aarch64_tls_tprel64_def =
    DT(((("abi_aarch64_relocation",121),[]),[]),
       [read"%30%166@%71%35%35%35%34%34%34%34%34%34%34%83@@@@@@@@@@@@"])
  fun op r_aarch64_tlsdesc_def x = x
    val op r_aarch64_tlsdesc_def =
    DT(((("abi_aarch64_relocation",122),[]),[]),
       [read"%30%167@%71%34%34%34%35%34%34%34%34%34%34%83@@@@@@@@@@@@"])
  fun op r_aarch64_irelative_def x = x
    val op r_aarch64_irelative_def =
    DT(((("abi_aarch64_relocation",123),[]),[]),
       [read"%30%114@%71%35%34%34%35%34%34%34%34%34%34%83@@@@@@@@@@@@"])
  fun op aarch64_le_reloc_def x = x
    val op aarch64_le_reloc_def =
    DT(((("abi_aarch64_relocation",124),[]),[]),
       [read"%19%8%31%84$0@@%38%30$0@%159@@%20%44@%6%15%12%23%28@%13%0%3$0|||@|||@@%20%44@%94@@@|@"])
  fun op abi_aarch64_apply_relocation_def x = x
    val op abi_aarch64_apply_relocation_def =
    DT(((("abi_aarch64_relocation",125),[]),[]),
       [read"%17%9%18%14%18%7%18%5%16%4%29%85$4@$3@$2@$1@$0@@%37%93%86$0@@@%66%10%65%1%37%30$1@%159@@%219%45@@%37%30$1@%218@@%219%45@@%37%30$1@%97@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%96@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%95@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%55@%40@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%162@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%161@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%160@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%55@%40@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%152@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%78@%40@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%153@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%78@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%154@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%80@%40@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%155@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%80@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%156@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%81@%40@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%157@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%81@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%158@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%82@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%149@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%55@%40@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%150@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%151@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%59@%40@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%119@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%56@%40@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%103@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%56@%40@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%104@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%69%27%32%24%72@%68%91$5@$0@@@@@%32%24%72@%68$4@@@@@@@%37%30$1@%105@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%69%27%32%24%72@%68%91$5@$0@@@@@%32%24%72@%68$4@@@@@@@%37%30$1@%98@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%132@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%123@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%126@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%129@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%120@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%217@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%54@%40@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%107@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%56@%40@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%115@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%57@%40@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%106@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%57@%40@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%142@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%55@%40@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%143@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%55@%41@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%144@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%145@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%146@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%59@%40@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%147@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%59@%41@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%148@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%68%92%91$5@$0@@$4@@@@%37%30$1@%135@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%55@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%48@%68%91$5@$0@@@@@@@%68$3@@@@@%37%30$1@%136@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%55@%41@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%48@%68%91$5@$0@@@@@@@%68$3@@@@@%37%30$1@%137@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%48@%68%91$5@$0@@@@@@@%68$3@@@@@%37%30$1@%138@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%48@%68%91$5@$0@@@@@@@%68$3@@@@@%37%30$1@%139@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%59@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%48@%68%91$5@$0@@@@@@@%68$3@@@@@%37%30$1@%140@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%48@%68%91$5@$0@@@@@@@%68$3@@@@@%37%30$1@%141@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%48@%68%91$5@$0@@@@@@@%68$3@@@@@%37%30$1@%113@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%68%92%91$5@$0@@$3@@@@%37%30$1@%112@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%68%92%91$5@$0@@$3@@@@%37%30$1@%111@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%56@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%48@%68%91$5@$0@@@@@@@%68$4@@@@@%37%30$1@%110@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%77@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%48@%68%91$5@$0@@@@@@@%68$3@@@@@%37%30$1@%102@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%69%27%32%24%72@%32%24%47@%32%24%48@%68%91$5@$0@@@@@@@@@%32%24%72@%68$4@@@@@@@%37%30$1@%117@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%56@%41@@@@@|@%88$7@@|@%32%24%47@%32%24%48@%68%91$5@$0@@@@@@@@%37%30$1@%118@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%77@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%48@%68%91$5@$0@@@@@@@%32%24%72@%68$3@@@@@@@%37%30$1@%180@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%56@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%33%25%51@%27%68$5@@%68$0@@@@@@@%68$4@@@@@%37%30$1@%179@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%69%27%32%24%72@%32%24%47@%33%25%51@%27%68$5@@%68$0@@@@@@@@@%32%24%72@%68$4@@@@@@@%37%30$1@%178@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%53@%41@@@@@|@%88$7@@|@%32%24%47@%33%25%51@%27%68$5@@%68$0@@@@@@@@%37%30$1@%182@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%55@%41@@@@@|@%88$7@@|@%69%27%32%24%47@%33%25%51@%27%68$5@@%68$0@@@@@@@%68$3@@@@@%37%30$1@%181@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%55@%41@@@@@|@%88$7@@|@%69%27%32%24%47@%33%25%51@%27%68$5@@%68$0@@@@@@@%68$3@@@@@%37%30$1@%193@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%56@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%49@%68$5@@@@@@%68$4@@@@@%37%30$1@%192@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%49@%68$5@@@@@@%32%24%72@%68$4@@@@@@@%37%30$1@%191@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%32%24%47@%32%24%49@%68$5@@@@@@@%37%30$1@%211@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%54@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%49@%68$5@@@@@@%68$3@@@@@%37%30$1@%210@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%54@%41@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%49@%68$5@@@@@@%68$3@@@@@%37%30$1@%194@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%56@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%49@%68$5@@@@@@%68$4@@@@@%37%30$1@%209@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%54@%40@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%207@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%54@%40@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%208@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%54@%41@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%205@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%54@%40@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%206@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%54@%41@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%188@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%79@%40@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%189@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%40@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%190@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%41@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%203@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%40@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%204@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%41@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%197@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%40@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%198@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%41@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%199@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%40@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%200@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%41@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%201@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%40@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%202@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%41@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%195@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%40@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%196@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%41@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%184@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%54@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%52@%68%91$5@$0@@@@@@@%68$3@@@@@%37%30$1@%183@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%54@%41@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%52@%68%91$5@$0@@@@@@@%68$3@@@@@%37%30$1@%186@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%69%27%32%24%72@%32%24%47@%32%24%52@%68%91$5@$0@@@@@@@@@%32%24%72@%68$4@@@@@@@%37%30$1@%185@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%61@%41@@@@@|@%88$7@@|@%32%24%47@%32%24%52@%68%91$5@$0@@@@@@@@%37%30$1@%187@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%56@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%52@%68%91$5@$0@@@@@@@%68$4@@@@@%37%30$1@%216@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%78@%40@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%214@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%78@%40@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%215@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%78@%41@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%212@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%78@%40@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%213@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%78@%41@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%99@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%79@%40@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%100@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%40@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%101@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%41@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%133@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%40@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%134@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%41@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%124@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%40@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%125@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%41@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%127@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%40@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%128@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%41@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%130@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%40@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%131@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%41@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%121@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%40@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%122@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%76@%41@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%174@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%56@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%50@%68%91$5@$0@@@@@@@%68$4@@@@@%37%30$1@%171@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%56@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%50@%68%91$5@$0@@@@@@@%68$4@@@@@%37%30$1@%170@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%69%27%32%24%72@%32%24%47@%32%24%50@%68%91$5@$0@@@@@@@@@%32%24%72@%68$4@@@@@@@%37%30$1@%173@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%56@%40@@@@@|@%88$7@@|@%32%24%47@%32%24%50@%68%91$5@$0@@@@@@@@%37%30$1@%169@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%32%24%47@%32%24%50@%68%91$5@$0@@@@@@@@%37%30$1@%177@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%40@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%50@%68%91$5@$0@@@@@@@%68$3@@@@@%37%30$1@%176@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%58@%41@@@@@|@%88$7@@|@%69%27%32%24%47@%32%24%50@%68%91$5@$0@@@@@@@%68$3@@@@@%37%30$1@%175@@%219%45@@%37%30$1@%168@@%219%45@@%37%30$1@%172@@%219%45@@%37%30$1@%108@@%89%39%36%71%34%35%34%34%34%34%83@@@@@@@@@%39%36%71%34%35%34%34%34%34%83@@@@@@@@@%39%36%71%35%35%34%34%35%34%83@@@@@@@@@%39%36%71%34%34%35%34%34%34%83@@@@@@@@@%39%36%71%35%34%34%35%34%34%83@@@@@@@@@%39%36%71%35%35%35%34%35%83@@@@@@@@%39%36%71%35%34%35%34%35%83@@@@@@@@%39%36%71%34%34%34%34%34%35%83@@@@@@@@@%39%36%71%34%34%35%34%34%34%83@@@@@@@@@%39%36%71%34%34%34%34%35%34%83@@@@@@@@@%39%36%71%35%34%34%34%35%34%83@@@@@@@@@%39%36%71%34%35%34%35%35%34%83@@@@@@@@@%70@@@@@@@@@@@@@@%37%30$1@%109@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%116@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%68%91$5@$0@@@@%37%30$1@%163@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%73%27%32%24%43@%68$5@@@@%68$0@@@@@%37%30$1@%165@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%32%24%42@%68%91$5@$0@@@@@@%37%30$1@%164@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%32%24%63@%68$5@@@@@%37%30$1@%166@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%32%24%75@%68%91$5@$0@@@@@@%37%30$1@%167@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%32%24%74@%68%91$5@$0@@@@@@%37%30$1@%114@@%67%11%64%2%219%46%45@%21$0@%26$1@%22%60@%41@@@@@|@%88$7@@|@%32%24%62@%73%27%32%24%43@%68$5@@@@%68$0@@@@@@@%89%39%36%71%34%35%34%35%34%34%83@@@@@@@@@%39%36%71%35%35%35%35%34%35%83@@@@@@@@@%39%36%71%35%35%35%34%35%35%83@@@@@@@@@%39%36%71%34%35%34%34%34%35%83@@@@@@@@@%39%36%71%35%34%35%35%34%35%83@@@@@@@@@%39%36%71%34%35%34%35%34%35%83@@@@@@@@@%39%36%71%35%34%35%34%34%35%83@@@@@@@@@%39%36%71%35%34%34%34%34%83@@@@@@@@%39%36%71%34%35%34%34%34%34%83@@@@@@@@@%39%36%71%34%35%34%34%34%34%83@@@@@@@@@%39%36%71%35%35%34%34%35%34%83@@@@@@@@@%39%36%71%34%34%35%34%34%34%83@@@@@@@@@%39%36%71%35%34%34%35%34%34%83@@@@@@@@@%39%36%71%35%35%35%34%35%83@@@@@@@@%39%36%71%35%34%35%34%35%83@@@@@@@@%39%36%71%35%34%34%34%34%83@@@@@@@@%39%36%71%35%35%34%34%35%35%83@@@@@@@@@%39%36%71%34%35%35%34%34%35%83@@@@@@@@@%39%36%71%35%34%35%35%34%35%83@@@@@@@@@%39%36%71%34%34%34%34%35%35%83@@@@@@@@@%39%36%71%34%34%35%34%34%35%83@@@@@@@@@%39%36%71%34%35%34%34%34%35%83@@@@@@@@@%39%36%71%35%34%35%34%35%35%83@@@@@@@@@%39%36%71%34%35%34%35%34%35%83@@@@@@@@@%39%36%71%34%34%34%34%35%35%83@@@@@@@@@%39%36%71%35%35%35%35%34%35%83@@@@@@@@@%39%36%71%35%34%34%34%34%83@@@@@@@@%39%36%71%35%34%35%34%35%35%83@@@@@@@@@%39%36%71%34%35%34%35%35%35%83@@@@@@@@@%39%36%71%35%34%34%34%35%35%83@@@@@@@@@%39%36%71%34%35%35%34%34%35%83@@@@@@@@@%70@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@%220%87$5@@@|@%90$4@@@%89%39%36%71%34%35%34%34%34%35%83@@@@@@@@@%39%36%71%35%35%34%34%34%35%83@@@@@@@@@%39%36%71%34%35%34%35%34%35%83@@@@@@@@@%39%36%71%34%34%34%34%34%35%83@@@@@@@@@%39%36%71%34%35%34%34%34%35%83@@@@@@@@@%39%36%71%34%35%34%34%34%35%83@@@@@@@@@%39%36%71%35%35%34%34%35%35%83@@@@@@@@@%39%36%71%34%34%35%34%34%35%83@@@@@@@@@%39%36%71%35%34%34%35%34%35%83@@@@@@@@@%39%36%71%35%35%35%34%35%83@@@@@@@@%39%36%71%35%34%35%34%35%83@@@@@@@@%39%36%71%34%34%34%34%34%35%83@@@@@@@@@%39%36%71%34%35%34%34%34%35%83@@@@@@@@@%39%36%71%35%34%34%34%35%35%83@@@@@@@@@%39%36%71%35%34%34%34%35%35%83@@@@@@@@@%39%36%71%35%34%35%35%34%35%83@@@@@@@@@%39%36%71%34%35%34%35%35%35%83@@@@@@@@@%39%36%71%34%34%34%34%34%35%83@@@@@@@@@%39%36%71%35%35%34%34%35%35%83@@@@@@@@@%39%36%71%34%35%35%34%34%35%83@@@@@@@@@%39%36%71%35%34%35%35%34%35%83@@@@@@@@@%39%36%71%34%34%34%34%35%35%83@@@@@@@@@%39%36%71%34%34%35%34%34%35%83@@@@@@@@@%39%36%71%34%35%34%34%34%35%83@@@@@@@@@%39%36%71%35%34%35%34%35%35%83@@@@@@@@@%39%36%71%34%35%34%35%34%35%83@@@@@@@@@%39%36%71%34%34%34%34%35%35%83@@@@@@@@@%39%36%71%35%35%35%35%34%35%83@@@@@@@@@%39%36%71%35%35%34%35%35%83@@@@@@@@%39%36%71%35%34%34%34%34%83@@@@@@@@%39%36%71%35%35%35%35%34%35%83@@@@@@@@@%39%36%71%34%34%34%34%35%35%83@@@@@@@@@%39%36%71%35%34%35%34%35%35%83@@@@@@@@@%39%36%71%35%34%34%34%34%83@@@@@@@@%39%36%71%34%35%34%34%34%35%83@@@@@@@@@%39%36%71%35%34%34%34%34%83@@@@@@@@%39%36%71%35%35%34%34%35%35%83@@@@@@@@@%39%36%71%34%35%35%34%34%35%83@@@@@@@@@%39%36%71%35%34%35%35%34%35%83@@@@@@@@@%39%36%71%34%34%34%34%35%35%83@@@@@@@@@%39%36%71%34%34%35%34%34%35%83@@@@@@@@@%39%36%71%34%35%34%34%34%35%83@@@@@@@@@%39%36%71%35%34%35%34%35%35%83@@@@@@@@@%39%36%71%34%35%34%34%34%35%83@@@@@@@@@%39%36%71%35%35%34%34%34%35%83@@@@@@@@@%39%36%71%35%34%35%35%34%35%83@@@@@@@@@%39%36%71%34%35%35%34%34%35%83@@@@@@@@@%39%36%71%35%34%34%34%34%83@@@@@@@@%39%36%71%35%35%35%34%34%35%83@@@@@@@@@%39%36%71%34%35%34%35%34%35%83@@@@@@@@@%39%36%71%35%34%35%35%34%35%83@@@@@@@@@%39%36%71%34%35%35%34%34%35%83@@@@@@@@@%70@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@|@|@|@"])
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

  local open GrammarSpecials Parse
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
