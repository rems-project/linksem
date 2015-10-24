structure elf_headerTheory :> elf_headerTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading elf_headerTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open default_printingTheory elf_types_native_uintTheory
             lem_setTheory
  in end;
  val _ = Theory.link_parents
          ("elf_header",
          Arbnum.fromString "1445345935",
          Arbnum.fromString "766165")
          [("lem_set",
           Arbnum.fromString "1445005525",
           Arbnum.fromString "352564"),
           ("elf_types_native_uint",
           Arbnum.fromString "1445345916",
           Arbnum.fromString "991129"),
           ("default_printing",
           Arbnum.fromString "1445345889",
           Arbnum.fromString "988195")];
  val _ = Theory.incorporate_types "elf_header"
       [("elf64_header", 0), ("elf32_header", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("num", "num"), ID("min", "fun"), ID("elf_header", "elf64_header"),
   ID("fcp", "cart"), ID("fcp", "bit0"), ID("one", "one"),
   ID("min", "bool"), ID("list", "list"), ID("elf_header", "elf32_header"),
   ID("error", "error"), ID("pair", "prod"),
   ID("byte_sequence", "byte_sequence"),
   ID("lem_basic_classes", "Ord_class"), ID("endianness", "endianness"),
   ID("lem_basic_classes", "ordering"), ID("ind_type", "recspace"),
   ID("min", "ind"), ID("bool", "!"), ID("arithmetic", "*"),
   ID("arithmetic", "+"), ID("pair", ","), ID("bool", "/\\"),
   ID("num", "0"), ID("prim_rec", "<"), ID("arithmetic", "<="),
   ID("min", "="), ID("option", "option"), ID("min", "==>"),
   ID("arithmetic", ">"), ID("arithmetic", ">="), ID("bool", "?"),
   ID("bool", "ARB"), ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("endianness", "Big"), ID("string", "CHR"),
   ID("string", "char"), ID("bool", "COND"), ID("list", "CONS"),
   ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("pred_set", "EMPTY"), ID("lem_basic_classes", "EQ"),
   ID("lem_basic_classes", "GT"), ID("bool", "IN"),
   ID("pred_set", "INSERT"), ID("combin", "K"), ID("list", "LENGTH"),
   ID("bool", "LET"), ID("lem_basic_classes", "LT"),
   ID("endianness", "Little"), ID("list", "MAP"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("option", "SOME"), ID("list", "TAKE"), ID("bool", "TYPE_DEFINITION"),
   ID("pair", "UNCURRY"), ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("elf_types_native_uint", "bytes_of_elf32_addr"),
   ID("elf_types_native_uint", "bytes_of_elf32_half"),
   ID("elf_header", "bytes_of_elf32_header"),
   ID("elf_types_native_uint", "bytes_of_elf32_off"),
   ID("elf_types_native_uint", "bytes_of_elf32_word"),
   ID("elf_types_native_uint", "bytes_of_elf64_addr"),
   ID("elf_types_native_uint", "bytes_of_elf64_half"),
   ID("elf_header", "bytes_of_elf64_header"),
   ID("elf_types_native_uint", "bytes_of_elf64_off"),
   ID("elf_types_native_uint", "bytes_of_elf64_word"),
   ID("elf_header", "deduce_endianness"),
   ID("endianness", "default_endianness"), ID("elf_header", "ei_nident"),
   ID("elf_header", "elf32_header_CASE"),
   ID("elf_header", "elf32_header_compare"),
   ID("elf_header", "elf32_header_elf32_ehsize"),
   ID("elf_header", "elf32_header_elf32_ehsize_fupd"),
   ID("elf_header", "elf32_header_elf32_entry"),
   ID("elf_header", "elf32_header_elf32_entry_fupd"),
   ID("elf_header", "elf32_header_elf32_flags"),
   ID("elf_header", "elf32_header_elf32_flags_fupd"),
   ID("elf_header", "elf32_header_elf32_ident"),
   ID("elf_header", "elf32_header_elf32_ident_fupd"),
   ID("elf_header", "elf32_header_elf32_machine"),
   ID("elf_header", "elf32_header_elf32_machine_fupd"),
   ID("elf_header", "elf32_header_elf32_phentsize"),
   ID("elf_header", "elf32_header_elf32_phentsize_fupd"),
   ID("elf_header", "elf32_header_elf32_phnum"),
   ID("elf_header", "elf32_header_elf32_phnum_fupd"),
   ID("elf_header", "elf32_header_elf32_phoff"),
   ID("elf_header", "elf32_header_elf32_phoff_fupd"),
   ID("elf_header", "elf32_header_elf32_shentsize"),
   ID("elf_header", "elf32_header_elf32_shentsize_fupd"),
   ID("elf_header", "elf32_header_elf32_shnum"),
   ID("elf_header", "elf32_header_elf32_shnum_fupd"),
   ID("elf_header", "elf32_header_elf32_shoff"),
   ID("elf_header", "elf32_header_elf32_shoff_fupd"),
   ID("elf_header", "elf32_header_elf32_shstrndx"),
   ID("elf_header", "elf32_header_elf32_shstrndx_fupd"),
   ID("elf_header", "elf32_header_elf32_type"),
   ID("elf_header", "elf32_header_elf32_type_fupd"),
   ID("elf_header", "elf32_header_elf32_version"),
   ID("elf_header", "elf32_header_elf32_version_fupd"),
   ID("elf_header", "elf32_header_size"),
   ID("elf_header", "elf64_header_CASE"),
   ID("elf_header", "elf64_header_compare"),
   ID("elf_header", "elf64_header_elf64_ehsize"),
   ID("elf_header", "elf64_header_elf64_ehsize_fupd"),
   ID("elf_header", "elf64_header_elf64_entry"),
   ID("elf_header", "elf64_header_elf64_entry_fupd"),
   ID("elf_header", "elf64_header_elf64_flags"),
   ID("elf_header", "elf64_header_elf64_flags_fupd"),
   ID("elf_header", "elf64_header_elf64_ident"),
   ID("elf_header", "elf64_header_elf64_ident_fupd"),
   ID("elf_header", "elf64_header_elf64_machine"),
   ID("elf_header", "elf64_header_elf64_machine_fupd"),
   ID("elf_header", "elf64_header_elf64_phentsize"),
   ID("elf_header", "elf64_header_elf64_phentsize_fupd"),
   ID("elf_header", "elf64_header_elf64_phnum"),
   ID("elf_header", "elf64_header_elf64_phnum_fupd"),
   ID("elf_header", "elf64_header_elf64_phoff"),
   ID("elf_header", "elf64_header_elf64_phoff_fupd"),
   ID("elf_header", "elf64_header_elf64_shentsize"),
   ID("elf_header", "elf64_header_elf64_shentsize_fupd"),
   ID("elf_header", "elf64_header_elf64_shnum"),
   ID("elf_header", "elf64_header_elf64_shnum_fupd"),
   ID("elf_header", "elf64_header_elf64_shoff"),
   ID("elf_header", "elf64_header_elf64_shoff_fupd"),
   ID("elf_header", "elf64_header_elf64_shstrndx"),
   ID("elf_header", "elf64_header_elf64_shstrndx_fupd"),
   ID("elf_header", "elf64_header_elf64_type"),
   ID("elf_header", "elf64_header_elf64_type_fupd"),
   ID("elf_header", "elf64_header_elf64_version"),
   ID("elf_header", "elf64_header_elf64_version_fupd"),
   ID("elf_header", "elf64_header_size"), ID("elf_header", "elf_class_32"),
   ID("elf_header", "elf_class_64"), ID("elf_header", "elf_class_none"),
   ID("elf_header", "elf_data_2lsb"), ID("elf_header", "elf_data_2msb"),
   ID("elf_header", "elf_data_none"), ID("elf_header", "elf_ev_current"),
   ID("elf_header", "elf_ev_none"), ID("elf_header", "elf_ft_core"),
   ID("elf_header", "elf_ft_dyn"), ID("elf_header", "elf_ft_exec"),
   ID("elf_header", "elf_ft_hi_os"), ID("elf_header", "elf_ft_hi_proc"),
   ID("elf_header", "elf_ft_lo_os"), ID("elf_header", "elf_ft_lo_proc"),
   ID("elf_header", "elf_ft_none"), ID("elf_header", "elf_ft_rel"),
   ID("elf_header", "elf_ii_abiversion"), ID("elf_header", "elf_ii_class"),
   ID("elf_header", "elf_ii_data"), ID("elf_header", "elf_ii_mag0"),
   ID("elf_header", "elf_ii_mag1"), ID("elf_header", "elf_ii_mag2"),
   ID("elf_header", "elf_ii_mag3"), ID("elf_header", "elf_ii_nident"),
   ID("elf_header", "elf_ii_osabi"), ID("elf_header", "elf_ii_pad"),
   ID("elf_header", "elf_ii_version"), ID("elf_header", "elf_ma_386"),
   ID("elf_header", "elf_ma_5600ex"), ID("elf_header", "elf_ma_68hc05"),
   ID("elf_header", "elf_ma_68hc08"), ID("elf_header", "elf_ma_68hc11"),
   ID("elf_header", "elf_ma_68hc12"), ID("elf_header", "elf_ma_68hc16"),
   ID("elf_header", "elf_ma_68k"), ID("elf_header", "elf_ma_78kor"),
   ID("elf_header", "elf_ma_8051"), ID("elf_header", "elf_ma_860"),
   ID("elf_header", "elf_ma_88k"), ID("elf_header", "elf_ma_960"),
   ID("elf_header", "elf_ma_aarch64"), ID("elf_header", "elf_ma_alpha"),
   ID("elf_header", "elf_ma_altera_nios2"),
   ID("elf_header", "elf_ma_amdgpu"), ID("elf_header", "elf_ma_arc"),
   ID("elf_header", "elf_ma_arc_compact"),
   ID("elf_header", "elf_ma_arc_compact2"),
   ID("elf_header", "elf_ma_arca"), ID("elf_header", "elf_ma_arm"),
   ID("elf_header", "elf_ma_arm184"), ID("elf_header", "elf_ma_avr"),
   ID("elf_header", "elf_ma_avr32"), ID("elf_header", "elf_ma_ba1"),
   ID("elf_header", "elf_ma_ba2"), ID("elf_header", "elf_ma_blackfin"),
   ID("elf_header", "elf_ma_c166"), ID("elf_header", "elf_ma_c17"),
   ID("elf_header", "elf_ma_c2000"), ID("elf_header", "elf_ma_c5500"),
   ID("elf_header", "elf_ma_c6000"), ID("elf_header", "elf_ma_ccore7"),
   ID("elf_header", "elf_ma_cdp"), ID("elf_header", "elf_ma_ce"),
   ID("elf_header", "elf_ma_cloudshield"), ID("elf_header", "elf_ma_coge"),
   ID("elf_header", "elf_ma_coldfire"), ID("elf_header", "elf_ma_cool"),
   ID("elf_header", "elf_ma_corea_1st"),
   ID("elf_header", "elf_ma_corea_2nd"), ID("elf_header", "elf_ma_cr"),
   ID("elf_header", "elf_ma_cr16"), ID("elf_header", "elf_ma_craynv2"),
   ID("elf_header", "elf_ma_cris"), ID("elf_header", "elf_ma_crx"),
   ID("elf_header", "elf_ma_cuda"), ID("elf_header", "elf_ma_cypress"),
   ID("elf_header", "elf_ma_d10v"), ID("elf_header", "elf_ma_d30v"),
   ID("elf_header", "elf_ma_dsp24"), ID("elf_header", "elf_ma_dspic30f"),
   ID("elf_header", "elf_ma_dxp"), ID("elf_header", "elf_ma_ecog16"),
   ID("elf_header", "elf_ma_ecog1x"), ID("elf_header", "elf_ma_ecog2"),
   ID("elf_header", "elf_ma_etpu"), ID("elf_header", "elf_ma_excess"),
   ID("elf_header", "elf_ma_f2mc16"), ID("elf_header", "elf_ma_firepath"),
   ID("elf_header", "elf_ma_fr20"), ID("elf_header", "elf_ma_fr30"),
   ID("elf_header", "elf_ma_ft32"), ID("elf_header", "elf_ma_fx66"),
   ID("elf_header", "elf_ma_h8_300"), ID("elf_header", "elf_ma_h8_300h"),
   ID("elf_header", "elf_ma_h8_500"), ID("elf_header", "elf_ma_h8s"),
   ID("elf_header", "elf_ma_huany"), ID("elf_header", "elf_ma_ia_64"),
   ID("elf_header", "elf_ma_intel182"),
   ID("elf_header", "elf_ma_intel205"),
   ID("elf_header", "elf_ma_intel206"),
   ID("elf_header", "elf_ma_intel207"),
   ID("elf_header", "elf_ma_intel208"),
   ID("elf_header", "elf_ma_intel209"), ID("elf_header", "elf_ma_ip2k"),
   ID("elf_header", "elf_ma_javelin"), ID("elf_header", "elf_ma_k10m"),
   ID("elf_header", "elf_ma_kalimba"), ID("elf_header", "elf_ma_km32"),
   ID("elf_header", "elf_ma_kmx16"), ID("elf_header", "elf_ma_kmx32"),
   ID("elf_header", "elf_ma_kmx8"), ID("elf_header", "elf_ma_kvarc"),
   ID("elf_header", "elf_ma_l10m"),
   ID("elf_header", "elf_ma_latticemico32"),
   ID("elf_header", "elf_ma_m16c"), ID("elf_header", "elf_ma_m32"),
   ID("elf_header", "elf_ma_m32c"), ID("elf_header", "elf_ma_m32r"),
   ID("elf_header", "elf_ma_manik"), ID("elf_header", "elf_ma_max"),
   ID("elf_header", "elf_ma_maxq30"), ID("elf_header", "elf_ma_mchp_pic"),
   ID("elf_header", "elf_ma_mcst_elbrus"), ID("elf_header", "elf_ma_me16"),
   ID("elf_header", "elf_ma_metag"), ID("elf_header", "elf_ma_microblaze"),
   ID("elf_header", "elf_ma_mips"), ID("elf_header", "elf_ma_mips_rs3_le"),
   ID("elf_header", "elf_ma_mips_x"), ID("elf_header", "elf_ma_mma"),
   ID("elf_header", "elf_ma_mmdsp_plus"), ID("elf_header", "elf_ma_mmix"),
   ID("elf_header", "elf_ma_mn10200"), ID("elf_header", "elf_ma_mn10300"),
   ID("elf_header", "elf_ma_moxie"), ID("elf_header", "elf_ma_msp430"),
   ID("elf_header", "elf_ma_ncpu"), ID("elf_header", "elf_ma_ndr1"),
   ID("elf_header", "elf_ma_nds32"), ID("elf_header", "elf_ma_none"),
   ID("elf_header", "elf_ma_norc"), ID("elf_header", "elf_ma_ns32k"),
   ID("elf_header", "elf_ma_open8"), ID("elf_header", "elf_ma_openrisc"),
   ID("elf_header", "elf_ma_parisc"), ID("elf_header", "elf_ma_pcp"),
   ID("elf_header", "elf_ma_pdp10"), ID("elf_header", "elf_ma_pdp11"),
   ID("elf_header", "elf_ma_pdsp"), ID("elf_header", "elf_ma_pj"),
   ID("elf_header", "elf_ma_ppc"), ID("elf_header", "elf_ma_ppc64"),
   ID("elf_header", "elf_ma_prism"), ID("elf_header", "elf_ma_qdsp6"),
   ID("elf_header", "elf_ma_r32c"), ID("elf_header", "elf_ma_rce"),
   ID("elf_header", "elf_ma_reserved11"),
   ID("elf_header", "elf_ma_reserved12"),
   ID("elf_header", "elf_ma_reserved121"),
   ID("elf_header", "elf_ma_reserved122"),
   ID("elf_header", "elf_ma_reserved123"),
   ID("elf_header", "elf_ma_reserved124"),
   ID("elf_header", "elf_ma_reserved125"),
   ID("elf_header", "elf_ma_reserved126"),
   ID("elf_header", "elf_ma_reserved127"),
   ID("elf_header", "elf_ma_reserved128"),
   ID("elf_header", "elf_ma_reserved129"),
   ID("elf_header", "elf_ma_reserved13"),
   ID("elf_header", "elf_ma_reserved130"),
   ID("elf_header", "elf_ma_reserved14"),
   ID("elf_header", "elf_ma_reserved143"),
   ID("elf_header", "elf_ma_reserved144"),
   ID("elf_header", "elf_ma_reserved145"),
   ID("elf_header", "elf_ma_reserved146"),
   ID("elf_header", "elf_ma_reserved147"),
   ID("elf_header", "elf_ma_reserved148"),
   ID("elf_header", "elf_ma_reserved149"),
   ID("elf_header", "elf_ma_reserved150"),
   ID("elf_header", "elf_ma_reserved151"),
   ID("elf_header", "elf_ma_reserved152"),
   ID("elf_header", "elf_ma_reserved153"),
   ID("elf_header", "elf_ma_reserved154"),
   ID("elf_header", "elf_ma_reserved155"),
   ID("elf_header", "elf_ma_reserved156"),
   ID("elf_header", "elf_ma_reserved157"),
   ID("elf_header", "elf_ma_reserved158"),
   ID("elf_header", "elf_ma_reserved159"),
   ID("elf_header", "elf_ma_reserved16"),
   ID("elf_header", "elf_ma_reserved24"),
   ID("elf_header", "elf_ma_reserved25"),
   ID("elf_header", "elf_ma_reserved26"),
   ID("elf_header", "elf_ma_reserved27"),
   ID("elf_header", "elf_ma_reserved28"),
   ID("elf_header", "elf_ma_reserved29"),
   ID("elf_header", "elf_ma_reserved30"),
   ID("elf_header", "elf_ma_reserved31"),
   ID("elf_header", "elf_ma_reserved32"),
   ID("elf_header", "elf_ma_reserved33"),
   ID("elf_header", "elf_ma_reserved34"),
   ID("elf_header", "elf_ma_reserved35"),
   ID("elf_header", "elf_ma_reserved6"), ID("elf_header", "elf_ma_rh32"),
   ID("elf_header", "elf_ma_riscv"), ID("elf_header", "elf_ma_rl78"),
   ID("elf_header", "elf_ma_rs08"), ID("elf_header", "elf_ma_rx"),
   ID("elf_header", "elf_ma_s370"), ID("elf_header", "elf_ma_s390"),
   ID("elf_header", "elf_ma_se_c33"), ID("elf_header", "elf_ma_sep"),
   ID("elf_header", "elf_ma_sh"), ID("elf_header", "elf_ma_sharc"),
   ID("elf_header", "elf_ma_sle9x"), ID("elf_header", "elf_ma_snp1k"),
   ID("elf_header", "elf_ma_sparc"),
   ID("elf_header", "elf_ma_sparc32plus"),
   ID("elf_header", "elf_ma_sparcv9"), ID("elf_header", "elf_ma_spu"),
   ID("elf_header", "elf_ma_st100"), ID("elf_header", "elf_ma_st19"),
   ID("elf_header", "elf_ma_st200"), ID("elf_header", "elf_ma_st7"),
   ID("elf_header", "elf_ma_st9plus"), ID("elf_header", "elf_ma_starcore"),
   ID("elf_header", "elf_ma_stm8"), ID("elf_header", "elf_ma_stxp7x"),
   ID("elf_header", "elf_ma_svx"), ID("elf_header", "elf_ma_tile64"),
   ID("elf_header", "elf_ma_tilegx"), ID("elf_header", "elf_ma_tilepro"),
   ID("elf_header", "elf_ma_tinyj"), ID("elf_header", "elf_ma_tmm_gpp"),
   ID("elf_header", "elf_ma_tpc"), ID("elf_header", "elf_ma_tricore"),
   ID("elf_header", "elf_ma_trimedia"), ID("elf_header", "elf_ma_tsk3000"),
   ID("elf_header", "elf_ma_unicore"), ID("elf_header", "elf_ma_v800"),
   ID("elf_header", "elf_ma_v850"), ID("elf_header", "elf_ma_vax"),
   ID("elf_header", "elf_ma_videocore"),
   ID("elf_header", "elf_ma_videocore3"),
   ID("elf_header", "elf_ma_videocore5"),
   ID("elf_header", "elf_ma_visium"), ID("elf_header", "elf_ma_vpp500"),
   ID("elf_header", "elf_ma_x86_64"), ID("elf_header", "elf_ma_xcore"),
   ID("elf_header", "elf_ma_xgate"), ID("elf_header", "elf_ma_ximo16"),
   ID("elf_header", "elf_ma_xtensa"), ID("elf_header", "elf_ma_z80"),
   ID("elf_header", "elf_ma_zsp"), ID("elf_header", "elf_mn_mag0"),
   ID("elf_header", "elf_mn_mag1"), ID("elf_header", "elf_mn_mag2"),
   ID("elf_header", "elf_mn_mag3"), ID("elf_header", "elf_osabi_aix"),
   ID("elf_header", "elf_osabi_aros"),
   ID("elf_header", "elf_osabi_cloudabi"),
   ID("elf_header", "elf_osabi_fenixos"),
   ID("elf_header", "elf_osabi_freebsd"),
   ID("elf_header", "elf_osabi_gnu"), ID("elf_header", "elf_osabi_hpux"),
   ID("elf_header", "elf_osabi_irix"), ID("elf_header", "elf_osabi_linux"),
   ID("elf_header", "elf_osabi_modesto"),
   ID("elf_header", "elf_osabi_netbsd"),
   ID("elf_header", "elf_osabi_none"), ID("elf_header", "elf_osabi_nsk"),
   ID("elf_header", "elf_osabi_openbsd"),
   ID("elf_header", "elf_osabi_openvms"),
   ID("elf_header", "elf_osabi_openvos"),
   ID("elf_header", "elf_osabi_solaris"),
   ID("elf_header", "elf_osabi_tru64"), ID("error", "error_bind"),
   ID("error", "fail0"), ID("lem", "failwith"),
   ID("byte_sequence", "from_byte_lists"),
   ID("lem_basic_classes", "genericCompare"),
   ID("elf_header", "get_elf32_abi_version"),
   ID("elf_header", "get_elf32_data_encoding"),
   ID("elf_header", "get_elf32_file_class"),
   ID("elf_header", "get_elf32_header_endianness"),
   ID("elf_header", "get_elf32_header_program_table_size"),
   ID("elf_header", "get_elf32_header_section_table_size"),
   ID("elf_header", "get_elf32_machine_architecture"),
   ID("elf_header", "get_elf32_osabi"),
   ID("elf_header", "get_elf32_version_number"),
   ID("elf_header", "get_elf64_abi_version"),
   ID("elf_header", "get_elf64_data_encoding"),
   ID("elf_header", "get_elf64_file_class"),
   ID("elf_header", "get_elf64_header_endianness"),
   ID("elf_header", "get_elf64_header_program_table_size"),
   ID("elf_header", "get_elf64_header_section_table_size"),
   ID("elf_header", "get_elf64_machine_architecture"),
   ID("elf_header", "get_elf64_osabi"),
   ID("elf_header", "get_elf64_version_number"),
   ID("elf_header", "has_elf32_header_associated_entry_point"),
   ID("elf_header", "has_elf32_header_string_table"),
   ID("elf_header", "has_elf64_header_associated_entry_point"),
   ID("elf_header", "has_elf64_header_string_table"),
   ID("missing_pervasives", "id"),
   ID("elf_header", "instance_Basic_classes_Ord_Elf_header_elf32_header_dict"),
   ID("elf_header", "instance_Basic_classes_Ord_Elf_header_elf64_header_dict"),
   ID("elf_header", "is_elf32_executable_file"),
   ID("elf_header", "is_elf32_header_class_correct"),
   ID("elf_header", "is_elf32_header_padding_correct"),
   ID("elf_header", "is_elf32_header_section_size_in_section_header_table"),
   ID("elf_header", "is_elf32_header_section_table_present"),
   ID("elf_header", "is_elf32_header_string_table_index_in_link"),
   ID("elf_header", "is_elf32_header_valid"),
   ID("elf_header", "is_elf32_header_version_correct"),
   ID("elf_header", "is_elf32_linkable_file"),
   ID("elf_header", "is_elf32_relocatable_file"),
   ID("elf_header", "is_elf32_shared_object_file"),
   ID("elf_header", "is_elf64_executable_file"),
   ID("elf_header", "is_elf64_header_class_correct"),
   ID("elf_header", "is_elf64_header_section_size_in_section_header_table"),
   ID("elf_header", "is_elf64_header_section_table_present"),
   ID("elf_header", "is_elf64_header_string_table_index_in_link"),
   ID("elf_header", "is_elf64_header_version_correct"),
   ID("elf_header", "is_elf64_linkable_file"),
   ID("elf_header", "is_elf64_relocatable_file"),
   ID("elf_header", "is_elf64_shared_object_file"),
   ID("elf_header", "is_magic_number_correct"),
   ID("elf_header", "is_operating_system_specific_object_file_type_value"),
   ID("elf_header", "is_processor_specific_object_file_type_value"),
   ID("elf_header", "is_valid_architecture_defined_osabi_version"),
   ID("elf_header", "is_valid_elf32_header"),
   ID("elf_header", "is_valid_elf32_version_numer"),
   ID("elf_header", "is_valid_elf64_header"),
   ID("elf_header", "is_valid_elf64_version_numer"),
   ID("elf_header", "is_valid_extended_version_number"),
   ID("lem_list", "lexicographic_compare"), ID("lem_list", "list_index"),
   ID("list", "list_size"), ID("words", "n2w"), ID("combin", "o"),
   ID("option", "option_CASE"), ID("lem_basic_classes", "pairCompare"),
   ID("elf_types_native_uint", "read_elf32_addr"),
   ID("elf_types_native_uint", "read_elf32_half"),
   ID("elf_header", "read_elf32_header"),
   ID("elf_types_native_uint", "read_elf32_off"),
   ID("elf_types_native_uint", "read_elf32_word"),
   ID("elf_types_native_uint", "read_elf64_addr"),
   ID("elf_types_native_uint", "read_elf64_half"),
   ID("elf_header", "read_elf64_header"),
   ID("elf_types_native_uint", "read_elf64_off"),
   ID("elf_types_native_uint", "read_elf64_word"),
   ID("elf_header", "read_elf_ident"),
   ID("elf_types_native_uint", "read_unsigned_char"),
   ID("elf_header", "recordtype.elf32_header"),
   ID("elf_header", "recordtype.elf64_header"), ID("error", "repeatM'"),
   ID("error", "return"), ID("elf_header", "shn_undef"),
   ID("elf_header", "shn_xindex"), ID("words", "w2n"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYOP [2], TYOP [5], TYOP [4, 2], TYOP [4, 3], TYOP [4, 4],
   TYOP [4, 5], TYOP [6], TYOP [3, 7, 6], TYOP [1, 8, 1], TYOP [1, 8, 9],
   TYOP [1, 8, 10], TYOP [1, 8, 11], TYOP [1, 8, 12], TYOP [1, 8, 13],
   TYOP [4, 6], TYOP [3, 7, 15], TYOP [1, 16, 14], TYOP [4, 15],
   TYOP [3, 7, 18], TYOP [1, 19, 17], TYOP [1, 19, 20], TYOP [1, 19, 21],
   TYOP [1, 16, 22], TYOP [1, 8, 23], TYOP [1, 8, 24], TYOP [3, 7, 5],
   TYOP [7, 26], TYOP [1, 27, 25], TYOP [8], TYOP [1, 8, 29],
   TYOP [1, 8, 30], TYOP [1, 8, 31], TYOP [1, 8, 32], TYOP [1, 8, 33],
   TYOP [1, 8, 34], TYOP [1, 16, 35], TYOP [1, 16, 36], TYOP [1, 16, 37],
   TYOP [1, 16, 38], TYOP [1, 16, 39], TYOP [1, 8, 40], TYOP [1, 8, 41],
   TYOP [1, 27, 42], TYOP [11], TYOP [10, 27, 44], TYOP [9, 45],
   TYOP [1, 44, 46], TYOP [10, 1, 44], TYOP [9, 48], TYOP [1, 44, 49],
   TYOP [10, 29, 44], TYOP [9, 51], TYOP [1, 44, 52], TYOP [1, 0, 7],
   TYOP [1, 1, 7], TYOP [1, 29, 7], TYOP [1, 27, 7], TYOP [12, 1],
   TYOP [12, 29], TYOP [1, 1, 0], TYOP [13], TYOP [1, 1, 61],
   TYOP [1, 29, 0], TYOP [1, 29, 61], TYOP [1, 1, 1], TYOP [1, 16, 16],
   TYOP [1, 66, 65], TYOP [1, 1, 16], TYOP [1, 8, 8], TYOP [1, 69, 65],
   TYOP [1, 1, 8], TYOP [1, 19, 19], TYOP [1, 72, 65], TYOP [1, 1, 19],
   TYOP [1, 27, 27], TYOP [1, 75, 65], TYOP [1, 1, 27], TYOP [14],
   TYOP [1, 1, 78], TYOP [1, 1, 79], TYV "'a", TYOP [1, 8, 81],
   TYOP [1, 8, 82], TYOP [1, 8, 83], TYOP [1, 8, 84], TYOP [1, 8, 85],
   TYOP [1, 8, 86], TYOP [1, 16, 87], TYOP [1, 19, 88], TYOP [1, 19, 89],
   TYOP [1, 19, 90], TYOP [1, 16, 91], TYOP [1, 8, 92], TYOP [1, 8, 93],
   TYOP [1, 27, 94], TYOP [1, 95, 81], TYOP [1, 1, 96], TYOP [1, 29, 29],
   TYOP [1, 66, 98], TYOP [1, 29, 16], TYOP [1, 69, 98], TYOP [1, 29, 8],
   TYOP [1, 75, 98], TYOP [1, 29, 27], TYOP [1, 29, 78], TYOP [1, 29, 105],
   TYOP [1, 16, 88], TYOP [1, 16, 107], TYOP [1, 16, 108],
   TYOP [1, 16, 109], TYOP [1, 8, 110], TYOP [1, 8, 111],
   TYOP [1, 27, 112], TYOP [1, 113, 81], TYOP [1, 29, 114],
   TYOP [3, 7, 81], TYOP [7, 116], TYOP [1, 117, 61], TYOP [1, 1, 44],
   TYOP [1, 29, 44], TYOP [10, 8, 8], TYOP [10, 8, 121], TYOP [10, 8, 122],
   TYOP [10, 8, 123], TYOP [10, 8, 124], TYOP [10, 16, 125],
   TYOP [10, 16, 126], TYOP [10, 16, 127], TYOP [10, 16, 128],
   TYOP [10, 16, 129], TYOP [10, 8, 130], TYOP [10, 8, 131],
   TYOP [10, 27, 132], TYOP [15, 133], TYOP [1, 134, 7],
   TYOP [10, 19, 126], TYOP [10, 19, 136], TYOP [10, 19, 137],
   TYOP [10, 16, 138], TYOP [10, 8, 139], TYOP [10, 8, 140],
   TYOP [10, 27, 141], TYOP [15, 142], TYOP [1, 143, 7], TYOP [16],
   TYOP [1, 29, 81], TYOP [1, 1, 81], TYOP [1, 81, 29], TYOP [1, 81, 1],
   TYOP [1, 8, 7], TYOP [1, 8, 150], TYOP [1, 8, 151], TYOP [1, 8, 152],
   TYOP [1, 8, 153], TYOP [1, 8, 154], TYOP [1, 16, 155],
   TYOP [1, 19, 156], TYOP [1, 19, 157], TYOP [1, 19, 158],
   TYOP [1, 16, 159], TYOP [1, 8, 160], TYOP [1, 8, 161],
   TYOP [1, 27, 162], TYOP [1, 145, 163], TYOP [1, 16, 156],
   TYOP [1, 16, 165], TYOP [1, 16, 166], TYOP [1, 16, 167],
   TYOP [1, 8, 168], TYOP [1, 8, 169], TYOP [1, 27, 170],
   TYOP [1, 145, 171], TYOP [1, 29, 134], TYOP [1, 1, 143],
   TYOP [1, 44, 7], TYOP [1, 175, 7], TYOP [1, 19, 7], TYOP [1, 177, 7],
   TYOP [1, 16, 7], TYOP [1, 179, 7], TYOP [1, 150, 7], TYOP [1, 56, 7],
   TYOP [1, 55, 7], TYOP [1, 148, 7], TYOP [1, 184, 7], TYOP [1, 149, 7],
   TYOP [1, 186, 7], TYOP [1, 72, 7], TYOP [1, 188, 7], TYOP [1, 66, 7],
   TYOP [1, 190, 7], TYOP [1, 69, 7], TYOP [1, 192, 7], TYOP [1, 182, 7],
   TYOP [1, 183, 7], TYOP [1, 95, 7], TYOP [1, 196, 7], TYOP [1, 113, 7],
   TYOP [1, 198, 7], TYOP [1, 75, 7], TYOP [1, 200, 7], TYOP [1, 144, 7],
   TYOP [1, 202, 7], TYOP [1, 135, 7], TYOP [1, 204, 7], TYOP [1, 117, 7],
   TYOP [1, 206, 7], TYOP [1, 57, 7], TYOP [1, 54, 7], TYOP [1, 0, 0],
   TYOP [1, 0, 210], TYOP [1, 137, 138], TYOP [1, 19, 212],
   TYOP [1, 136, 137], TYOP [1, 19, 214], TYOP [1, 126, 136],
   TYOP [1, 19, 216], TYOP [1, 138, 139], TYOP [1, 16, 218],
   TYOP [1, 129, 130], TYOP [1, 16, 220], TYOP [1, 128, 129],
   TYOP [1, 16, 222], TYOP [1, 127, 128], TYOP [1, 16, 224],
   TYOP [1, 126, 127], TYOP [1, 16, 226], TYOP [1, 125, 126],
   TYOP [1, 16, 228], TYOP [1, 8, 121], TYOP [1, 8, 230],
   TYOP [1, 139, 140], TYOP [1, 8, 232], TYOP [1, 130, 131],
   TYOP [1, 8, 234], TYOP [1, 121, 122], TYOP [1, 8, 236],
   TYOP [1, 140, 141], TYOP [1, 8, 238], TYOP [1, 131, 132],
   TYOP [1, 8, 240], TYOP [1, 122, 123], TYOP [1, 8, 242],
   TYOP [1, 123, 124], TYOP [1, 8, 244], TYOP [1, 124, 125],
   TYOP [1, 8, 246], TYOP [1, 44, 51], TYOP [1, 29, 248], TYOP [1, 44, 48],
   TYOP [1, 1, 250], TYOP [1, 141, 142], TYOP [1, 27, 252],
   TYOP [1, 132, 133], TYOP [1, 27, 254], TYOP [7, 0], TYOP [10, 256, 256],
   TYOP [1, 256, 257], TYOP [1, 256, 258], TYOP [1, 7, 7],
   TYOP [1, 7, 260], TYOP [1, 0, 54], TYOP [1, 81, 7], TYOP [1, 81, 263],
   TYOP [1, 59, 7], TYOP [1, 59, 265], TYOP [1, 58, 7], TYOP [1, 58, 267],
   TYOP [1, 44, 175], TYOP [1, 19, 177], TYOP [1, 16, 179],
   TYOP [1, 26, 7], TYOP [1, 26, 272], TYOP [1, 29, 56], TYOP [1, 1, 55],
   TYOP [1, 61, 7], TYOP [1, 61, 276], TYOP [1, 52, 7], TYOP [1, 52, 278],
   TYOP [1, 49, 7], TYOP [1, 49, 280], TYOP [1, 46, 7], TYOP [1, 46, 282],
   TYOP [1, 148, 184], TYOP [1, 149, 186], TYOP [1, 98, 7],
   TYOP [1, 98, 286], TYOP [1, 65, 7], TYOP [1, 65, 288], TYOP [1, 27, 57],
   TYOP [26, 26], TYOP [1, 291, 7], TYOP [1, 291, 292], TYOP [1, 78, 7],
   TYOP [1, 78, 294], TYOP [1, 143, 144], TYOP [1, 134, 135],
   TYOP [1, 146, 7], TYOP [1, 298, 7], TYOP [1, 173, 7], TYOP [1, 300, 7],
   TYOP [1, 147, 7], TYOP [1, 302, 7], TYOP [1, 174, 7], TYOP [1, 304, 7],
   TYOP [37], TYOP [1, 0, 306], TYOP [1, 61, 61], TYOP [1, 61, 308],
   TYOP [1, 7, 309], TYOP [1, 52, 52], TYOP [1, 52, 311], TYOP [1, 7, 312],
   TYOP [1, 49, 49], TYOP [1, 49, 314], TYOP [1, 7, 315], TYOP [1, 26, 75],
   TYOP [7, 306], TYOP [1, 318, 318], TYOP [1, 306, 319], TYOP [7, 27],
   TYOP [1, 321, 321], TYOP [1, 27, 322], TYOP [1, 256, 256],
   TYOP [1, 0, 324], TYOP [1, 0, 143], TYOP [1, 326, 143],
   TYOP [1, 142, 327], TYOP [1, 0, 328], TYOP [1, 0, 134],
   TYOP [1, 330, 134], TYOP [1, 133, 331], TYOP [1, 0, 332],
   TYOP [1, 294, 7], TYOP [1, 78, 334], TYOP [1, 294, 294],
   TYOP [1, 78, 336], TYOP [1, 19, 72], TYOP [1, 16, 66], TYOP [1, 8, 69],
   TYOP [1, 274, 274], TYOP [1, 274, 341], TYOP [1, 106, 106],
   TYOP [1, 106, 343], TYOP [1, 275, 275], TYOP [1, 275, 345],
   TYOP [1, 80, 80], TYOP [1, 80, 347], TYOP [1, 27, 75], TYOP [1, 27, 0],
   TYOP [1, 61, 44], TYOP [1, 351, 351], TYOP [1, 61, 52],
   TYOP [1, 353, 353], TYOP [1, 61, 49], TYOP [1, 355, 355],
   TYOP [1, 210, 210], TYOP [1, 26, 26], TYOP [1, 358, 75],
   TYOP [1, 27, 256], TYOP [1, 26, 0], TYOP [1, 361, 360],
   TYOP [1, 59, 59], TYOP [1, 343, 363], TYOP [1, 58, 58],
   TYOP [1, 347, 365], TYOP [1, 341, 363], TYOP [1, 345, 365],
   TYOP [1, 26, 291], TYOP [1, 0, 75], TYOP [1, 144, 304],
   TYOP [1, 135, 300], TYOP [10, 19, 44], TYOP [1, 373, 49],
   TYOP [1, 19, 50], TYOP [1, 375, 374], TYOP [10, 16, 44],
   TYOP [1, 377, 52], TYOP [1, 16, 53], TYOP [1, 379, 378],
   TYOP [1, 377, 49], TYOP [1, 16, 50], TYOP [1, 382, 381],
   TYOP [10, 8, 44], TYOP [1, 384, 52], TYOP [1, 8, 53],
   TYOP [1, 386, 385], TYOP [1, 384, 49], TYOP [1, 8, 50],
   TYOP [1, 389, 388], TYOP [1, 45, 52], TYOP [1, 27, 53],
   TYOP [1, 392, 391], TYOP [1, 45, 49], TYOP [1, 27, 50],
   TYOP [1, 395, 394], TYOP [1, 16, 27], TYOP [1, 61, 397],
   TYOP [1, 8, 27], TYOP [1, 61, 399], TYOP [1, 19, 27], TYOP [1, 61, 401],
   TYOP [1, 27, 61], TYOP [1, 374, 49], TYOP [9, 373], TYOP [1, 405, 404],
   TYOP [1, 378, 52], TYOP [9, 377], TYOP [1, 408, 407], TYOP [1, 381, 49],
   TYOP [1, 408, 410], TYOP [1, 385, 52], TYOP [9, 384],
   TYOP [1, 413, 412], TYOP [1, 388, 49], TYOP [1, 413, 415],
   TYOP [1, 391, 52], TYOP [1, 46, 417], TYOP [1, 394, 49],
   TYOP [1, 46, 419], TYOP [1, 318, 52], TYOP [1, 318, 49],
   TYOP [1, 318, 61], TYOP [1, 318, 0], TYOP [1, 321, 44], TYOP [1, 0, 78],
   TYOP [1, 0, 426], TYOP [1, 262, 427], TYOP [1, 262, 428],
   TYOP [1, 256, 78], TYOP [1, 256, 430], TYOP [1, 427, 431],
   TYOP [26, 116], TYOP [1, 0, 433], TYOP [1, 117, 434], TYOP [1, 0, 291],
   TYOP [1, 27, 436], TYOP [1, 361, 350], TYOP [1, 0, 26],
   TYOP [1, 72, 72], TYOP [1, 72, 440], TYOP [1, 66, 66],
   TYOP [1, 66, 442], TYOP [1, 69, 69], TYOP [1, 69, 444],
   TYOP [1, 148, 148], TYOP [1, 98, 446], TYOP [1, 98, 98],
   TYOP [1, 98, 448], TYOP [1, 149, 149], TYOP [1, 65, 450],
   TYOP [1, 65, 65], TYOP [1, 65, 452], TYOP [1, 75, 75],
   TYOP [1, 75, 454], TYOP [1, 116, 61], TYOP [1, 456, 61],
   TYOP [1, 61, 457], TYOP [1, 433, 458], TYOP [1, 26, 52],
   TYOP [1, 460, 52], TYOP [1, 52, 461], TYOP [1, 291, 462],
   TYOP [1, 26, 49], TYOP [1, 464, 49], TYOP [1, 49, 465],
   TYOP [1, 291, 466], TYOP [1, 361, 0], TYOP [1, 0, 468],
   TYOP [1, 291, 469], TYOP [1, 257, 78], TYOP [1, 257, 471],
   TYOP [1, 431, 472], TYOP [1, 431, 473], TYOP [1, 44, 408],
   TYOP [1, 61, 475], TYOP [1, 44, 413], TYOP [1, 61, 477],
   TYOP [1, 44, 405], TYOP [1, 61, 479], TYOP [10, 26, 44], TYOP [9, 481],
   TYOP [1, 44, 482], TYOP [1, 61, 483], TYOP [1, 483, 46],
   TYOP [1, 44, 485], TYOP [1, 0, 486], TYOP [1, 51, 52], TYOP [1, 48, 49],
   TYOP [1, 116, 0], TYOP [1, 19, 0], TYOP [1, 16, 0], TYOP [1, 8, 0]]
  end
  val _ = Theory.incorporate_consts "elf_header" tyvector
     [("shn_xindex", 0), ("shn_undef", 0), ("recordtype.elf64_header", 28),
      ("recordtype.elf32_header", 43), ("read_elf_ident", 47),
      ("read_elf64_header", 50), ("read_elf32_header", 53),
      ("is_valid_extended_version_number", 54),
      ("is_valid_elf64_version_numer", 55), ("is_valid_elf64_header", 55),
      ("is_valid_elf32_version_numer", 56), ("is_valid_elf32_header", 56),
      ("is_valid_architecture_defined_osabi_version", 54),
      ("is_processor_specific_object_file_type_value", 54),
      ("is_operating_system_specific_object_file_type_value", 54),
      ("is_magic_number_correct", 57), ("is_elf64_shared_object_file", 55),
      ("is_elf64_relocatable_file", 55), ("is_elf64_linkable_file", 55),
      ("is_elf64_header_version_correct", 55),
      ("is_elf64_header_string_table_index_in_link", 55),
      ("is_elf64_header_section_table_present", 55),
      ("is_elf64_header_section_size_in_section_header_table", 55),
      ("is_elf64_header_class_correct", 55),
      ("is_elf64_executable_file", 55),
      ("is_elf32_shared_object_file", 56),
      ("is_elf32_relocatable_file", 56), ("is_elf32_linkable_file", 56),
      ("is_elf32_header_version_correct", 56),
      ("is_elf32_header_valid", 56),
      ("is_elf32_header_string_table_index_in_link", 56),
      ("is_elf32_header_section_table_present", 56),
      ("is_elf32_header_section_size_in_section_header_table", 56),
      ("is_elf32_header_padding_correct", 56),
      ("is_elf32_header_class_correct", 56),
      ("is_elf32_executable_file", 56),
      ("instance_Basic_classes_Ord_Elf_header_elf64_header_dict", 58),
      ("instance_Basic_classes_Ord_Elf_header_elf32_header_dict", 59),
      ("has_elf64_header_string_table", 55),
      ("has_elf64_header_associated_entry_point", 55),
      ("has_elf32_header_string_table", 56),
      ("has_elf32_header_associated_entry_point", 56),
      ("get_elf64_version_number", 60), ("get_elf64_osabi", 60),
      ("get_elf64_machine_architecture", 60),
      ("get_elf64_header_section_table_size", 60),
      ("get_elf64_header_program_table_size", 60),
      ("get_elf64_header_endianness", 62), ("get_elf64_file_class", 60),
      ("get_elf64_data_encoding", 60), ("get_elf64_abi_version", 60),
      ("get_elf32_version_number", 63), ("get_elf32_osabi", 63),
      ("get_elf32_machine_architecture", 63),
      ("get_elf32_header_section_table_size", 63),
      ("get_elf32_header_program_table_size", 63),
      ("get_elf32_header_endianness", 64), ("get_elf32_file_class", 63),
      ("get_elf32_data_encoding", 63), ("get_elf32_abi_version", 63),
      ("elf_osabi_tru64", 0), ("elf_osabi_solaris", 0),
      ("elf_osabi_openvos", 0), ("elf_osabi_openvms", 0),
      ("elf_osabi_openbsd", 0), ("elf_osabi_nsk", 0),
      ("elf_osabi_none", 0), ("elf_osabi_netbsd", 0),
      ("elf_osabi_modesto", 0), ("elf_osabi_linux", 0),
      ("elf_osabi_irix", 0), ("elf_osabi_hpux", 0), ("elf_osabi_gnu", 0),
      ("elf_osabi_freebsd", 0), ("elf_osabi_fenixos", 0),
      ("elf_osabi_cloudabi", 0), ("elf_osabi_aros", 0),
      ("elf_osabi_aix", 0), ("elf_mn_mag3", 26), ("elf_mn_mag2", 26),
      ("elf_mn_mag1", 26), ("elf_mn_mag0", 26), ("elf_ma_zsp", 0),
      ("elf_ma_z80", 0), ("elf_ma_xtensa", 0), ("elf_ma_ximo16", 0),
      ("elf_ma_xgate", 0), ("elf_ma_xcore", 0), ("elf_ma_x86_64", 0),
      ("elf_ma_vpp500", 0), ("elf_ma_visium", 0), ("elf_ma_videocore5", 0),
      ("elf_ma_videocore3", 0), ("elf_ma_videocore", 0), ("elf_ma_vax", 0),
      ("elf_ma_v850", 0), ("elf_ma_v800", 0), ("elf_ma_unicore", 0),
      ("elf_ma_tsk3000", 0), ("elf_ma_trimedia", 0), ("elf_ma_tricore", 0),
      ("elf_ma_tpc", 0), ("elf_ma_tmm_gpp", 0), ("elf_ma_tinyj", 0),
      ("elf_ma_tilepro", 0), ("elf_ma_tilegx", 0), ("elf_ma_tile64", 0),
      ("elf_ma_svx", 0), ("elf_ma_stxp7x", 0), ("elf_ma_stm8", 0),
      ("elf_ma_starcore", 0), ("elf_ma_st9plus", 0), ("elf_ma_st7", 0),
      ("elf_ma_st200", 0), ("elf_ma_st19", 0), ("elf_ma_st100", 0),
      ("elf_ma_spu", 0), ("elf_ma_sparcv9", 0), ("elf_ma_sparc32plus", 0),
      ("elf_ma_sparc", 0), ("elf_ma_snp1k", 0), ("elf_ma_sle9x", 0),
      ("elf_ma_sharc", 0), ("elf_ma_sh", 0), ("elf_ma_sep", 0),
      ("elf_ma_se_c33", 0), ("elf_ma_s390", 0), ("elf_ma_s370", 0),
      ("elf_ma_rx", 0), ("elf_ma_rs08", 0), ("elf_ma_rl78", 0),
      ("elf_ma_riscv", 0), ("elf_ma_rh32", 0), ("elf_ma_reserved6", 0),
      ("elf_ma_reserved35", 0), ("elf_ma_reserved34", 0),
      ("elf_ma_reserved33", 0), ("elf_ma_reserved32", 0),
      ("elf_ma_reserved31", 0), ("elf_ma_reserved30", 0),
      ("elf_ma_reserved29", 0), ("elf_ma_reserved28", 0),
      ("elf_ma_reserved27", 0), ("elf_ma_reserved26", 0),
      ("elf_ma_reserved25", 0), ("elf_ma_reserved24", 0),
      ("elf_ma_reserved16", 0), ("elf_ma_reserved159", 0),
      ("elf_ma_reserved158", 0), ("elf_ma_reserved157", 0),
      ("elf_ma_reserved156", 0), ("elf_ma_reserved155", 0),
      ("elf_ma_reserved154", 0), ("elf_ma_reserved153", 0),
      ("elf_ma_reserved152", 0), ("elf_ma_reserved151", 0),
      ("elf_ma_reserved150", 0), ("elf_ma_reserved149", 0),
      ("elf_ma_reserved148", 0), ("elf_ma_reserved147", 0),
      ("elf_ma_reserved146", 0), ("elf_ma_reserved145", 0),
      ("elf_ma_reserved144", 0), ("elf_ma_reserved143", 0),
      ("elf_ma_reserved14", 0), ("elf_ma_reserved130", 0),
      ("elf_ma_reserved13", 0), ("elf_ma_reserved129", 0),
      ("elf_ma_reserved128", 0), ("elf_ma_reserved127", 0),
      ("elf_ma_reserved126", 0), ("elf_ma_reserved125", 0),
      ("elf_ma_reserved124", 0), ("elf_ma_reserved123", 0),
      ("elf_ma_reserved122", 0), ("elf_ma_reserved121", 0),
      ("elf_ma_reserved12", 0), ("elf_ma_reserved11", 0),
      ("elf_ma_rce", 0), ("elf_ma_r32c", 0), ("elf_ma_qdsp6", 0),
      ("elf_ma_prism", 0), ("elf_ma_ppc64", 0), ("elf_ma_ppc", 0),
      ("elf_ma_pj", 0), ("elf_ma_pdsp", 0), ("elf_ma_pdp11", 0),
      ("elf_ma_pdp10", 0), ("elf_ma_pcp", 0), ("elf_ma_parisc", 0),
      ("elf_ma_openrisc", 0), ("elf_ma_open8", 0), ("elf_ma_ns32k", 0),
      ("elf_ma_norc", 0), ("elf_ma_none", 0), ("elf_ma_nds32", 0),
      ("elf_ma_ndr1", 0), ("elf_ma_ncpu", 0), ("elf_ma_msp430", 0),
      ("elf_ma_moxie", 0), ("elf_ma_mn10300", 0), ("elf_ma_mn10200", 0),
      ("elf_ma_mmix", 0), ("elf_ma_mmdsp_plus", 0), ("elf_ma_mma", 0),
      ("elf_ma_mips_x", 0), ("elf_ma_mips_rs3_le", 0), ("elf_ma_mips", 0),
      ("elf_ma_microblaze", 0), ("elf_ma_metag", 0), ("elf_ma_me16", 0),
      ("elf_ma_mcst_elbrus", 0), ("elf_ma_mchp_pic", 0),
      ("elf_ma_maxq30", 0), ("elf_ma_max", 0), ("elf_ma_manik", 0),
      ("elf_ma_m32r", 0), ("elf_ma_m32c", 0), ("elf_ma_m32", 0),
      ("elf_ma_m16c", 0), ("elf_ma_latticemico32", 0), ("elf_ma_l10m", 0),
      ("elf_ma_kvarc", 0), ("elf_ma_kmx8", 0), ("elf_ma_kmx32", 0),
      ("elf_ma_kmx16", 0), ("elf_ma_km32", 0), ("elf_ma_kalimba", 0),
      ("elf_ma_k10m", 0), ("elf_ma_javelin", 0), ("elf_ma_ip2k", 0),
      ("elf_ma_intel209", 0), ("elf_ma_intel208", 0),
      ("elf_ma_intel207", 0), ("elf_ma_intel206", 0),
      ("elf_ma_intel205", 0), ("elf_ma_intel182", 0), ("elf_ma_ia_64", 0),
      ("elf_ma_huany", 0), ("elf_ma_h8s", 0), ("elf_ma_h8_500", 0),
      ("elf_ma_h8_300h", 0), ("elf_ma_h8_300", 0), ("elf_ma_fx66", 0),
      ("elf_ma_ft32", 0), ("elf_ma_fr30", 0), ("elf_ma_fr20", 0),
      ("elf_ma_firepath", 0), ("elf_ma_f2mc16", 0), ("elf_ma_excess", 0),
      ("elf_ma_etpu", 0), ("elf_ma_ecog2", 0), ("elf_ma_ecog1x", 0),
      ("elf_ma_ecog16", 0), ("elf_ma_dxp", 0), ("elf_ma_dspic30f", 0),
      ("elf_ma_dsp24", 0), ("elf_ma_d30v", 0), ("elf_ma_d10v", 0),
      ("elf_ma_cypress", 0), ("elf_ma_cuda", 0), ("elf_ma_crx", 0),
      ("elf_ma_cris", 0), ("elf_ma_craynv2", 0), ("elf_ma_cr16", 0),
      ("elf_ma_cr", 0), ("elf_ma_corea_2nd", 0), ("elf_ma_corea_1st", 0),
      ("elf_ma_cool", 0), ("elf_ma_coldfire", 0), ("elf_ma_coge", 0),
      ("elf_ma_cloudshield", 0), ("elf_ma_ce", 0), ("elf_ma_cdp", 0),
      ("elf_ma_ccore7", 0), ("elf_ma_c6000", 0), ("elf_ma_c5500", 0),
      ("elf_ma_c2000", 0), ("elf_ma_c17", 0), ("elf_ma_c166", 0),
      ("elf_ma_blackfin", 0), ("elf_ma_ba2", 0), ("elf_ma_ba1", 0),
      ("elf_ma_avr32", 0), ("elf_ma_avr", 0), ("elf_ma_arm184", 0),
      ("elf_ma_arm", 0), ("elf_ma_arca", 0), ("elf_ma_arc_compact2", 0),
      ("elf_ma_arc_compact", 0), ("elf_ma_arc", 0), ("elf_ma_amdgpu", 0),
      ("elf_ma_altera_nios2", 0), ("elf_ma_alpha", 0),
      ("elf_ma_aarch64", 0), ("elf_ma_960", 0), ("elf_ma_88k", 0),
      ("elf_ma_860", 0), ("elf_ma_8051", 0), ("elf_ma_78kor", 0),
      ("elf_ma_68k", 0), ("elf_ma_68hc16", 0), ("elf_ma_68hc12", 0),
      ("elf_ma_68hc11", 0), ("elf_ma_68hc08", 0), ("elf_ma_68hc05", 0),
      ("elf_ma_5600ex", 0), ("elf_ma_386", 0), ("elf_ii_version", 0),
      ("elf_ii_pad", 0), ("elf_ii_osabi", 0), ("elf_ii_nident", 0),
      ("elf_ii_mag3", 0), ("elf_ii_mag2", 0), ("elf_ii_mag1", 0),
      ("elf_ii_mag0", 0), ("elf_ii_data", 0), ("elf_ii_class", 0),
      ("elf_ii_abiversion", 0), ("elf_ft_rel", 0), ("elf_ft_none", 0),
      ("elf_ft_lo_proc", 0), ("elf_ft_lo_os", 0), ("elf_ft_hi_proc", 0),
      ("elf_ft_hi_os", 0), ("elf_ft_exec", 0), ("elf_ft_dyn", 0),
      ("elf_ft_core", 0), ("elf_ev_none", 0), ("elf_ev_current", 0),
      ("elf_data_none", 0), ("elf_data_2msb", 0), ("elf_data_2lsb", 0),
      ("elf_class_none", 0), ("elf_class_64", 0), ("elf_class_32", 0),
      ("elf64_header_size", 60), ("elf64_header_elf64_version_fupd", 67),
      ("elf64_header_elf64_version", 68),
      ("elf64_header_elf64_type_fupd", 70),
      ("elf64_header_elf64_type", 71),
      ("elf64_header_elf64_shstrndx_fupd", 70),
      ("elf64_header_elf64_shstrndx", 71),
      ("elf64_header_elf64_shoff_fupd", 73),
      ("elf64_header_elf64_shoff", 74),
      ("elf64_header_elf64_shnum_fupd", 70),
      ("elf64_header_elf64_shnum", 71),
      ("elf64_header_elf64_shentsize_fupd", 70),
      ("elf64_header_elf64_shentsize", 71),
      ("elf64_header_elf64_phoff_fupd", 73),
      ("elf64_header_elf64_phoff", 74),
      ("elf64_header_elf64_phnum_fupd", 70),
      ("elf64_header_elf64_phnum", 71),
      ("elf64_header_elf64_phentsize_fupd", 70),
      ("elf64_header_elf64_phentsize", 71),
      ("elf64_header_elf64_machine_fupd", 70),
      ("elf64_header_elf64_machine", 71),
      ("elf64_header_elf64_ident_fupd", 76),
      ("elf64_header_elf64_ident", 77),
      ("elf64_header_elf64_flags_fupd", 67),
      ("elf64_header_elf64_flags", 68),
      ("elf64_header_elf64_entry_fupd", 73),
      ("elf64_header_elf64_entry", 74),
      ("elf64_header_elf64_ehsize_fupd", 70),
      ("elf64_header_elf64_ehsize", 71), ("elf64_header_compare", 80),
      ("elf64_header_CASE", 97), ("elf32_header_size", 63),
      ("elf32_header_elf32_version_fupd", 99),
      ("elf32_header_elf32_version", 100),
      ("elf32_header_elf32_type_fupd", 101),
      ("elf32_header_elf32_type", 102),
      ("elf32_header_elf32_shstrndx_fupd", 101),
      ("elf32_header_elf32_shstrndx", 102),
      ("elf32_header_elf32_shoff_fupd", 99),
      ("elf32_header_elf32_shoff", 100),
      ("elf32_header_elf32_shnum_fupd", 101),
      ("elf32_header_elf32_shnum", 102),
      ("elf32_header_elf32_shentsize_fupd", 101),
      ("elf32_header_elf32_shentsize", 102),
      ("elf32_header_elf32_phoff_fupd", 99),
      ("elf32_header_elf32_phoff", 100),
      ("elf32_header_elf32_phnum_fupd", 101),
      ("elf32_header_elf32_phnum", 102),
      ("elf32_header_elf32_phentsize_fupd", 101),
      ("elf32_header_elf32_phentsize", 102),
      ("elf32_header_elf32_machine_fupd", 101),
      ("elf32_header_elf32_machine", 102),
      ("elf32_header_elf32_ident_fupd", 103),
      ("elf32_header_elf32_ident", 104),
      ("elf32_header_elf32_flags_fupd", 99),
      ("elf32_header_elf32_flags", 100),
      ("elf32_header_elf32_entry_fupd", 99),
      ("elf32_header_elf32_entry", 100),
      ("elf32_header_elf32_ehsize_fupd", 101),
      ("elf32_header_elf32_ehsize", 102), ("elf32_header_compare", 106),
      ("elf32_header_CASE", 115), ("ei_nident", 0),
      ("deduce_endianness", 118), ("bytes_of_elf64_header", 119),
      ("bytes_of_elf32_header", 120)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'elf32_header'", 135), TMV("'elf64_header'", 144), TMV("M", 29),
   TMV("M", 1), TMV("M'", 29), TMV("M'", 1), TMV("P", 56), TMV("P", 55),
   TMV("a0", 27), TMV("a0'", 27), TMV("a0'", 143), TMV("a0'", 134),
   TMV("a1", 8), TMV("a1'", 8), TMV("a10", 8), TMV("a10'", 8),
   TMV("a11", 8), TMV("a11'", 8), TMV("a12", 8), TMV("a12'", 8),
   TMV("a13", 8), TMV("a13'", 8), TMV("a2", 8), TMV("a2'", 8),
   TMV("a3", 16), TMV("a3'", 16), TMV("a4", 19), TMV("a4", 16),
   TMV("a4'", 19), TMV("a4'", 16), TMV("a5", 19), TMV("a5", 16),
   TMV("a5'", 19), TMV("a5'", 16), TMV("a6", 19), TMV("a6", 16),
   TMV("a6'", 19), TMV("a6'", 16), TMV("a7", 16), TMV("a7'", 16),
   TMV("a8", 8), TMV("a8'", 8), TMV("a9", 8), TMV("a9'", 8), TMV("bs", 44),
   TMV("c", 8), TMV("c", 26), TMV("c0", 8), TMV("c01", 8), TMV("c02", 8),
   TMV("c1", 16), TMV("c1", 8), TMV("c10", 8), TMV("c101", 8),
   TMV("c102", 8), TMV("c11", 8), TMV("c111", 8), TMV("c112", 8),
   TMV("c12", 8), TMV("c2", 19), TMV("c2", 16), TMV("c2", 8),
   TMV("c21", 8), TMV("c22", 8), TMV("c3", 19), TMV("c3", 16),
   TMV("c3", 8), TMV("c31", 8), TMV("c32", 8), TMV("c4", 19),
   TMV("c4", 16), TMV("c4", 8), TMV("c41", 8), TMV("c42", 8),
   TMV("c5", 16), TMV("c51", 16), TMV("c52", 16), TMV("c6", 19),
   TMV("c6", 16), TMV("c6", 8), TMV("c61", 19), TMV("c61", 16),
   TMV("c62", 19), TMV("c62", 16), TMV("c7", 19), TMV("c7", 16),
   TMV("c7", 8), TMV("c71", 19), TMV("c71", 16), TMV("c72", 19),
   TMV("c72", 16), TMV("c8", 19), TMV("c8", 16), TMV("c8", 8),
   TMV("c81", 19), TMV("c81", 16), TMV("c82", 19), TMV("c82", 16),
   TMV("c9", 16), TMV("c9", 8), TMV("c91", 16), TMV("c92", 16),
   TMV("cls", 26), TMV("data", 26), TMV("e", 29), TMV("e", 1),
   TMV("e1", 29), TMV("e1", 1), TMV("e2", 29), TMV("e2", 1), TMV("ee", 29),
   TMV("ee", 1), TMV("ehdr", 29), TMV("ehdr", 1), TMV("ehsize", 8),
   TMV("elf32_ehsize", 8), TMV("elf32_entry", 16), TMV("elf32_flags", 16),
   TMV("elf32_header", 145), TMV("elf32_ident", 27),
   TMV("elf32_machine", 8), TMV("elf32_phentsize", 8),
   TMV("elf32_phnum", 8), TMV("elf32_phoff", 16),
   TMV("elf32_shentsize", 8), TMV("elf32_shnum", 8),
   TMV("elf32_shoff", 16), TMV("elf32_shstrndx", 8), TMV("elf32_type", 8),
   TMV("elf32_version", 16), TMV("elf64_ehsize", 8),
   TMV("elf64_entry", 19), TMV("elf64_flags", 16),
   TMV("elf64_header", 145), TMV("elf64_ident", 27),
   TMV("elf64_machine", 8), TMV("elf64_phentsize", 8),
   TMV("elf64_phnum", 8), TMV("elf64_phoff", 19),
   TMV("elf64_shentsize", 8), TMV("elf64_shnum", 8),
   TMV("elf64_shoff", 19), TMV("elf64_shstrndx", 8), TMV("elf64_type", 8),
   TMV("elf64_version", 16), TMV("endian", 61), TMV("entry", 19),
   TMV("entry", 16), TMV("f", 72), TMV("f", 66), TMV("f", 69),
   TMV("f", 95), TMV("f", 113), TMV("f", 75), TMV("f'", 95),
   TMV("f'", 113), TMV("f1", 29), TMV("f1", 1), TMV("f2", 29),
   TMV("f2", 1), TMV("flags", 16), TMV("fn", 146), TMV("fn", 147),
   TMV("g", 72), TMV("g", 66), TMV("g", 69), TMV("g", 75), TMV("h", 148),
   TMV("h", 149), TMV("h1", 29), TMV("h1", 1), TMV("h2", 29), TMV("h2", 1),
   TMV("hdr", 29), TMV("hdr", 1), TMV("id", 117), TMV("ident", 27),
   TMV("l", 27), TMV("l1", 27), TMV("l2", 27), TMV("machine", 8),
   TMV("n", 0), TMV("osabi", 26), TMV("phentsize", 8), TMV("phentsize", 0),
   TMV("phnum", 8), TMV("phnum", 0), TMV("phoff", 19), TMV("phoff", 16),
   TMV("record", 164), TMV("record", 172), TMV("rep", 173),
   TMV("rep", 174), TMV("shentsize", 8), TMV("shentsize", 0),
   TMV("shnum", 8), TMV("shnum", 0), TMV("shoff", 19), TMV("shoff", 16),
   TMV("shstrndx", 8), TMV("typ", 8), TMV("v", 116), TMV("v", 26),
   TMV("v", 0), TMV("ver", 26), TMV("version", 16), TMC(17, 176),
   TMC(17, 178), TMC(17, 180), TMC(17, 181), TMC(17, 182), TMC(17, 183),
   TMC(17, 185), TMC(17, 187), TMC(17, 189), TMC(17, 191), TMC(17, 193),
   TMC(17, 194), TMC(17, 195), TMC(17, 197), TMC(17, 199), TMC(17, 201),
   TMC(17, 203), TMC(17, 205), TMC(17, 207), TMC(17, 208), TMC(17, 209),
   TMC(17, 202), TMC(17, 204), TMC(18, 211), TMC(19, 211), TMC(20, 213),
   TMC(20, 215), TMC(20, 217), TMC(20, 219), TMC(20, 221), TMC(20, 223),
   TMC(20, 225), TMC(20, 227), TMC(20, 229), TMC(20, 231), TMC(20, 233),
   TMC(20, 235), TMC(20, 237), TMC(20, 239), TMC(20, 241), TMC(20, 243),
   TMC(20, 245), TMC(20, 247), TMC(20, 249), TMC(20, 251), TMC(20, 253),
   TMC(20, 255), TMC(20, 259), TMC(21, 261), TMC(22, 0), TMC(23, 262),
   TMC(24, 262), TMC(25, 264), TMC(25, 266), TMC(25, 268), TMC(25, 261),
   TMC(25, 269), TMC(25, 270), TMC(25, 271), TMC(25, 151), TMC(25, 273),
   TMC(25, 274), TMC(25, 275), TMC(25, 277), TMC(25, 279), TMC(25, 281),
   TMC(25, 283), TMC(25, 284), TMC(25, 285), TMC(25, 287), TMC(25, 289),
   TMC(25, 290), TMC(25, 262), TMC(25, 293), TMC(25, 295), TMC(25, 296),
   TMC(25, 297), TMC(27, 261), TMC(28, 262), TMC(29, 262), TMC(30, 178),
   TMC(30, 180), TMC(30, 181), TMC(30, 182), TMC(30, 183), TMC(30, 299),
   TMC(30, 301), TMC(30, 303), TMC(30, 305), TMC(30, 208), TMC(31, 59),
   TMC(31, 58), TMC(31, 29), TMC(31, 1), TMC(32, 210), TMC(33, 210),
   TMC(34, 143), TMC(34, 134), TMC(35, 61), TMC(36, 307), TMC(38, 310),
   TMC(38, 313), TMC(38, 316), TMC(39, 317), TMC(39, 320), TMC(39, 323),
   TMC(39, 325), TMC(40, 329), TMC(40, 333), TMC(41, 260), TMC(42, 294),
   TMC(43, 78), TMC(44, 78), TMC(45, 335), TMC(46, 337), TMC(47, 338),
   TMC(47, 339), TMC(47, 340), TMC(47, 342), TMC(47, 344), TMC(47, 346),
   TMC(47, 348), TMC(47, 349), TMC(48, 350), TMC(49, 352), TMC(49, 354),
   TMC(49, 356), TMC(49, 357), TMC(50, 78), TMC(51, 61), TMC(52, 359),
   TMC(52, 362), TMC(53, 27), TMC(53, 318), TMC(53, 321), TMC(53, 256),
   TMC(54, 210), TMC(55, 364), TMC(55, 366), TMC(56, 367), TMC(56, 368),
   TMC(57, 367), TMC(57, 368), TMC(58, 367), TMC(58, 368), TMC(59, 367),
   TMC(59, 368), TMC(60, 369), TMC(61, 370), TMC(62, 371), TMC(62, 372),
   TMC(63, 376), TMC(63, 380), TMC(63, 383), TMC(63, 387), TMC(63, 390),
   TMC(63, 393), TMC(63, 396), TMC(64, 0), TMC(65, 261), TMC(66, 398),
   TMC(67, 400), TMC(68, 120), TMC(69, 398), TMC(70, 398), TMC(71, 402),
   TMC(72, 400), TMC(73, 119), TMC(74, 402), TMC(75, 398), TMC(76, 118),
   TMC(76, 403), TMC(77, 61), TMC(78, 0), TMC(79, 115), TMC(80, 106),
   TMC(81, 102), TMC(82, 101), TMC(83, 100), TMC(84, 99), TMC(85, 100),
   TMC(86, 99), TMC(87, 104), TMC(88, 103), TMC(89, 102), TMC(90, 101),
   TMC(91, 102), TMC(92, 101), TMC(93, 102), TMC(94, 101), TMC(95, 100),
   TMC(96, 99), TMC(97, 102), TMC(98, 101), TMC(99, 102), TMC(100, 101),
   TMC(101, 100), TMC(102, 99), TMC(103, 102), TMC(104, 101),
   TMC(105, 102), TMC(106, 101), TMC(107, 100), TMC(108, 99), TMC(109, 63),
   TMC(110, 97), TMC(111, 80), TMC(112, 71), TMC(113, 70), TMC(114, 74),
   TMC(115, 73), TMC(116, 68), TMC(117, 67), TMC(118, 77), TMC(119, 76),
   TMC(120, 71), TMC(121, 70), TMC(122, 71), TMC(123, 70), TMC(124, 71),
   TMC(125, 70), TMC(126, 74), TMC(127, 73), TMC(128, 71), TMC(129, 70),
   TMC(130, 71), TMC(131, 70), TMC(132, 74), TMC(133, 73), TMC(134, 71),
   TMC(135, 70), TMC(136, 71), TMC(137, 70), TMC(138, 68), TMC(139, 67),
   TMC(140, 60), TMC(141, 0), TMC(142, 0), TMC(143, 0), TMC(144, 0),
   TMC(145, 0), TMC(146, 0), TMC(147, 0), TMC(148, 0), TMC(149, 0),
   TMC(150, 0), TMC(151, 0), TMC(152, 0), TMC(153, 0), TMC(154, 0),
   TMC(155, 0), TMC(156, 0), TMC(157, 0), TMC(158, 0), TMC(159, 0),
   TMC(160, 0), TMC(161, 0), TMC(162, 0), TMC(163, 0), TMC(164, 0),
   TMC(165, 0), TMC(166, 0), TMC(167, 0), TMC(168, 0), TMC(169, 0),
   TMC(170, 0), TMC(171, 0), TMC(172, 0), TMC(173, 0), TMC(174, 0),
   TMC(175, 0), TMC(176, 0), TMC(177, 0), TMC(178, 0), TMC(179, 0),
   TMC(180, 0), TMC(181, 0), TMC(182, 0), TMC(183, 0), TMC(184, 0),
   TMC(185, 0), TMC(186, 0), TMC(187, 0), TMC(188, 0), TMC(189, 0),
   TMC(190, 0), TMC(191, 0), TMC(192, 0), TMC(193, 0), TMC(194, 0),
   TMC(195, 0), TMC(196, 0), TMC(197, 0), TMC(198, 0), TMC(199, 0),
   TMC(200, 0), TMC(201, 0), TMC(202, 0), TMC(203, 0), TMC(204, 0),
   TMC(205, 0), TMC(206, 0), TMC(207, 0), TMC(208, 0), TMC(209, 0),
   TMC(210, 0), TMC(211, 0), TMC(212, 0), TMC(213, 0), TMC(214, 0),
   TMC(215, 0), TMC(216, 0), TMC(217, 0), TMC(218, 0), TMC(219, 0),
   TMC(220, 0), TMC(221, 0), TMC(222, 0), TMC(223, 0), TMC(224, 0),
   TMC(225, 0), TMC(226, 0), TMC(227, 0), TMC(228, 0), TMC(229, 0),
   TMC(230, 0), TMC(231, 0), TMC(232, 0), TMC(233, 0), TMC(234, 0),
   TMC(235, 0), TMC(236, 0), TMC(237, 0), TMC(238, 0), TMC(239, 0),
   TMC(240, 0), TMC(241, 0), TMC(242, 0), TMC(243, 0), TMC(244, 0),
   TMC(245, 0), TMC(246, 0), TMC(247, 0), TMC(248, 0), TMC(249, 0),
   TMC(250, 0), TMC(251, 0), TMC(252, 0), TMC(253, 0), TMC(254, 0),
   TMC(255, 0), TMC(256, 0), TMC(257, 0), TMC(258, 0), TMC(259, 0),
   TMC(260, 0), TMC(261, 0), TMC(262, 0), TMC(263, 0), TMC(264, 0),
   TMC(265, 0), TMC(266, 0), TMC(267, 0), TMC(268, 0), TMC(269, 0),
   TMC(270, 0), TMC(271, 0), TMC(272, 0), TMC(273, 0), TMC(274, 0),
   TMC(275, 0), TMC(276, 0), TMC(277, 0), TMC(278, 0), TMC(279, 0),
   TMC(280, 0), TMC(281, 0), TMC(282, 0), TMC(283, 0), TMC(284, 0),
   TMC(285, 0), TMC(286, 0), TMC(287, 0), TMC(288, 0), TMC(289, 0),
   TMC(290, 0), TMC(291, 0), TMC(292, 0), TMC(293, 0), TMC(294, 0),
   TMC(295, 0), TMC(296, 0), TMC(297, 0), TMC(298, 0), TMC(299, 0),
   TMC(300, 0), TMC(301, 0), TMC(302, 0), TMC(303, 0), TMC(304, 0),
   TMC(305, 0), TMC(306, 0), TMC(307, 0), TMC(308, 0), TMC(309, 0),
   TMC(310, 0), TMC(311, 0), TMC(312, 0), TMC(313, 0), TMC(314, 0),
   TMC(315, 0), TMC(316, 0), TMC(317, 0), TMC(318, 0), TMC(319, 0),
   TMC(320, 0), TMC(321, 0), TMC(322, 0), TMC(323, 0), TMC(324, 0),
   TMC(325, 0), TMC(326, 0), TMC(327, 0), TMC(328, 0), TMC(329, 0),
   TMC(330, 0), TMC(331, 0), TMC(332, 0), TMC(333, 0), TMC(334, 0),
   TMC(335, 0), TMC(336, 0), TMC(337, 0), TMC(338, 0), TMC(339, 0),
   TMC(340, 0), TMC(341, 0), TMC(342, 0), TMC(343, 0), TMC(344, 0),
   TMC(345, 0), TMC(346, 0), TMC(347, 0), TMC(348, 0), TMC(349, 0),
   TMC(350, 0), TMC(351, 0), TMC(352, 0), TMC(353, 0), TMC(354, 0),
   TMC(355, 0), TMC(356, 0), TMC(357, 0), TMC(358, 0), TMC(359, 0),
   TMC(360, 0), TMC(361, 0), TMC(362, 0), TMC(363, 0), TMC(364, 0),
   TMC(365, 0), TMC(366, 0), TMC(367, 0), TMC(368, 0), TMC(369, 0),
   TMC(370, 0), TMC(371, 0), TMC(372, 0), TMC(373, 0), TMC(374, 0),
   TMC(375, 0), TMC(376, 0), TMC(377, 0), TMC(378, 0), TMC(379, 0),
   TMC(380, 0), TMC(381, 0), TMC(382, 0), TMC(383, 0), TMC(384, 0),
   TMC(385, 0), TMC(386, 0), TMC(387, 0), TMC(388, 0), TMC(389, 0),
   TMC(390, 0), TMC(391, 0), TMC(392, 0), TMC(393, 0), TMC(394, 0),
   TMC(395, 26), TMC(396, 26), TMC(397, 26), TMC(398, 26), TMC(399, 0),
   TMC(400, 0), TMC(401, 0), TMC(402, 0), TMC(403, 0), TMC(404, 0),
   TMC(405, 0), TMC(406, 0), TMC(407, 0), TMC(408, 0), TMC(409, 0),
   TMC(410, 0), TMC(411, 0), TMC(412, 0), TMC(413, 0), TMC(414, 0),
   TMC(415, 0), TMC(416, 0), TMC(417, 406), TMC(417, 409), TMC(417, 411),
   TMC(417, 414), TMC(417, 416), TMC(417, 418), TMC(417, 420),
   TMC(418, 421), TMC(418, 422), TMC(419, 423), TMC(419, 424),
   TMC(420, 425), TMC(421, 429), TMC(422, 63), TMC(423, 63), TMC(424, 63),
   TMC(425, 64), TMC(426, 63), TMC(427, 63), TMC(428, 63), TMC(429, 63),
   TMC(430, 63), TMC(431, 60), TMC(432, 60), TMC(433, 60), TMC(434, 62),
   TMC(435, 60), TMC(436, 60), TMC(437, 60), TMC(438, 60), TMC(439, 60),
   TMC(440, 56), TMC(441, 56), TMC(442, 55), TMC(443, 55), TMC(444, 358),
   TMC(444, 210), TMC(445, 59), TMC(446, 58), TMC(447, 56), TMC(448, 56),
   TMC(449, 56), TMC(450, 56), TMC(451, 56), TMC(452, 56), TMC(453, 56),
   TMC(454, 56), TMC(455, 56), TMC(456, 56), TMC(457, 56), TMC(458, 55),
   TMC(459, 55), TMC(460, 55), TMC(461, 55), TMC(462, 55), TMC(463, 55),
   TMC(464, 55), TMC(465, 55), TMC(466, 55), TMC(467, 57), TMC(468, 54),
   TMC(469, 54), TMC(470, 54), TMC(471, 56), TMC(472, 56), TMC(473, 55),
   TMC(474, 55), TMC(475, 54), TMC(476, 432), TMC(477, 435), TMC(477, 437),
   TMC(478, 438), TMC(479, 439), TMC(480, 441), TMC(480, 443),
   TMC(480, 445), TMC(480, 447), TMC(480, 449), TMC(480, 451),
   TMC(480, 453), TMC(480, 455), TMC(481, 459), TMC(481, 463),
   TMC(481, 467), TMC(481, 470), TMC(482, 474), TMC(483, 476),
   TMC(484, 478), TMC(485, 53), TMC(486, 476), TMC(487, 476),
   TMC(488, 480), TMC(489, 478), TMC(490, 50), TMC(491, 480),
   TMC(492, 476), TMC(493, 47), TMC(494, 484), TMC(495, 43), TMC(496, 28),
   TMC(497, 487), TMC(498, 488), TMC(498, 489), TMC(499, 0), TMC(500, 0),
   TMC(501, 490), TMC(501, 491), TMC(501, 492), TMC(501, 493),
   TMC(501, 361), TMC(502, 260)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op shn_undef_def x = x
    val op shn_undef_def =
    DT(((("elf_header",0),[]),[]), [read"%278%821@%255@"])
  fun op shn_xindex_def x = x
    val op shn_xindex_def =
    DT(((("elf_header",1),[]),[]),
       [read"%278%822@%342%300%300%300%300%300%300%300%300%300%300%300%300%300%300%300%300%364@@@@@@@@@@@@@@@@@@"])
  fun op elf_ft_none_def x = x
    val op elf_ft_none_def =
    DT(((("elf_header",2),[]),[]), [read"%278%457@%255@"])
  fun op elf_ft_rel_def x = x
    val op elf_ft_rel_def =
    DT(((("elf_header",3),[]),[]), [read"%278%458@%342%300%364@@@"])
  fun op elf_ft_exec_def x = x
    val op elf_ft_exec_def =
    DT(((("elf_header",4),[]),[]), [read"%278%452@%342%301%364@@@"])
  fun op elf_ft_dyn_def x = x
    val op elf_ft_dyn_def =
    DT(((("elf_header",5),[]),[]), [read"%278%451@%342%300%300%364@@@@"])
  fun op elf_ft_core_def x = x
    val op elf_ft_core_def =
    DT(((("elf_header",6),[]),[]), [read"%278%450@%342%301%300%364@@@@"])
  fun op elf_ft_lo_os_def x = x
    val op elf_ft_lo_os_def =
    DT(((("elf_header",7),[]),[]),
       [read"%278%455@%342%301%300%300%300%300%300%300%300%300%301%301%301%301%301%301%364@@@@@@@@@@@@@@@@@"])
  fun op elf_ft_hi_os_def x = x
    val op elf_ft_hi_os_def =
    DT(((("elf_header",8),[]),[]),
       [read"%278%453@%342%300%300%300%300%300%300%300%300%301%301%301%301%301%301%301%364@@@@@@@@@@@@@@@@@"])
  fun op elf_ft_lo_proc_def x = x
    val op elf_ft_lo_proc_def =
    DT(((("elf_header",9),[]),[]),
       [read"%278%456@%342%301%300%300%300%300%300%300%300%301%301%301%301%301%301%301%364@@@@@@@@@@@@@@@@@"])
  fun op elf_ft_hi_proc_def x = x
    val op elf_ft_hi_proc_def =
    DT(((("elf_header",10),[]),[]),
       [read"%278%454@%342%300%300%300%300%300%300%300%300%300%300%300%300%300%300%300%300%364@@@@@@@@@@@@@@@@@@"])
  fun op is_operating_system_specific_object_file_type_value_def x = x
    val op is_operating_system_specific_object_file_type_value_def =
    DT(((("elf_header",11),[]),[]),
       [read"%226%203%261%778$0@@%254%285$0@%342%301%300%300%300%300%300%300%300%300%301%301%301%301%301%301%364@@@@@@@@@@@@@@@@@@%257$0@%342%300%300%300%300%300%300%300%300%301%301%301%301%301%301%301%364@@@@@@@@@@@@@@@@@@@|@"])
  fun op is_processor_specific_object_file_type_value_def x = x
    val op is_processor_specific_object_file_type_value_def =
    DT(((("elf_header",12),[]),[]),
       [read"%226%203%261%779$0@@%254%285$0@%342%301%300%300%300%300%300%300%300%301%301%301%301%301%301%301%364@@@@@@@@@@@@@@@@@@%257$0@%342%300%300%300%300%300%300%300%300%300%300%300%300%300%300%300%300%364@@@@@@@@@@@@@@@@@@@@|@"])
  fun op elf_ma_riscv_def x = x
    val op elf_ma_riscv_def =
    DT(((("elf_header",13),[]),[]),
       [read"%278%646@%342%300%300%301%300%301%301%301%364@@@@@@@@@"])
  fun op elf_ma_amdgpu_def x = x
    val op elf_ma_amdgpu_def =
    DT(((("elf_header",14),[]),[]),
       [read"%278%486@%342%301%300%300%300%300%301%301%364@@@@@@@@@"])
  fun op elf_ma_moxie_def x = x
    val op elf_ma_moxie_def =
    DT(((("elf_header",15),[]),[]),
       [read"%278%578@%342%300%300%300%300%300%301%301%364@@@@@@@@@"])
  fun op elf_ma_ft32_def x = x
    val op elf_ma_ft32_def =
    DT(((("elf_header",16),[]),[]),
       [read"%278%533@%342%301%301%301%301%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_visium_def x = x
    val op elf_ma_visium_def =
    DT(((("elf_header",17),[]),[]),
       [read"%278%687@%342%300%301%301%301%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_z80_def x = x
    val op elf_ma_z80_def =
    DT(((("elf_header",18),[]),[]),
       [read"%278%694@%342%301%300%301%301%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_kalimba_def x = x
    val op elf_ma_kalimba_def =
    DT(((("elf_header",19),[]),[]),
       [read"%278%550@%342%300%300%301%301%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_norc_def x = x
    val op elf_ma_norc_def =
    DT(((("elf_header",20),[]),[]),
       [read"%278%584@%342%301%301%300%301%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_cool_def x = x
    val op elf_ma_cool_def =
    DT(((("elf_header",21),[]),[]),
       [read"%278%509@%342%300%301%300%301%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_coge_def x = x
    val op elf_ma_coge_def =
    DT(((("elf_header",22),[]),[]),
       [read"%278%507@%342%301%300%300%301%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_cdp_def x = x
    val op elf_ma_cdp_def =
    DT(((("elf_header",23),[]),[]),
       [read"%278%504@%342%300%300%300%301%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_kvarc_def x = x
    val op elf_ma_kvarc_def =
    DT(((("elf_header",24),[]),[]),
       [read"%278%555@%342%301%301%301%300%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_kmx8_def x = x
    val op elf_ma_kmx8_def =
    DT(((("elf_header",25),[]),[]),
       [read"%278%554@%342%300%301%301%300%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_kmx16_def x = x
    val op elf_ma_kmx16_def =
    DT(((("elf_header",26),[]),[]),
       [read"%278%552@%342%301%300%301%300%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_kmx32_def x = x
    val op elf_ma_kmx32_def =
    DT(((("elf_header",27),[]),[]),
       [read"%278%553@%342%300%300%301%300%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_km32_def x = x
    val op elf_ma_km32_def =
    DT(((("elf_header",28),[]),[]),
       [read"%278%551@%342%301%301%300%300%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_mchp_pic_def x = x
    val op elf_ma_mchp_pic_def =
    DT(((("elf_header",29),[]),[]),
       [read"%278%565@%342%301%300%301%301%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_xcore_def x = x
    val op elf_ma_xcore_def =
    DT(((("elf_header",30),[]),[]),
       [read"%278%690@%342%300%300%301%301%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_ba2_def x = x
    val op elf_ma_ba2_def =
    DT(((("elf_header",31),[]),[]),
       [read"%278%496@%342%301%301%300%301%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_ba1_def x = x
    val op elf_ma_ba1_def =
    DT(((("elf_header",32),[]),[]),
       [read"%278%495@%342%300%301%300%301%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_5600ex_def x = x
    val op elf_ma_5600ex_def =
    DT(((("elf_header",33),[]),[]),
       [read"%278%471@%342%301%300%300%301%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_78kor_def x = x
    val op elf_ma_78kor_def =
    DT(((("elf_header",34),[]),[]),
       [read"%278%478@%342%300%300%300%301%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_videocore5_def x = x
    val op elf_ma_videocore5_def =
    DT(((("elf_header",35),[]),[]),
       [read"%278%686@%342%301%301%301%300%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_rl78_def x = x
    val op elf_ma_rl78_def =
    DT(((("elf_header",36),[]),[]),
       [read"%278%647@%342%300%301%301%300%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_open8_def x = x
    val op elf_ma_open8_def =
    DT(((("elf_header",37),[]),[]),
       [read"%278%586@%342%301%300%301%300%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_arc_compact2_def x = x
    val op elf_ma_arc_compact2_def =
    DT(((("elf_header",38),[]),[]),
       [read"%278%489@%342%300%300%301%300%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_corea_2nd_def x = x
    val op elf_ma_corea_2nd_def =
    DT(((("elf_header",39),[]),[]),
       [read"%278%511@%342%301%301%300%300%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_corea_1st_def x = x
    val op elf_ma_corea_1st_def =
    DT(((("elf_header",40),[]),[]),
       [read"%278%510@%342%300%301%300%300%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_cloudshield_def x = x
    val op elf_ma_cloudshield_def =
    DT(((("elf_header",41),[]),[]),
       [read"%278%506@%342%301%300%300%300%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_sle9x_def x = x
    val op elf_ma_sle9x_def =
    DT(((("elf_header",42),[]),[]),
       [read"%278%656@%342%300%300%301%300%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_l10m_def x = x
    val op elf_ma_l10m_def =
    DT(((("elf_header",43),[]),[]),
       [read"%278%556@%342%301%300%301%300%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_k10m_def x = x
    val op elf_ma_k10m_def =
    DT(((("elf_header",44),[]),[]),
       [read"%278%549@%342%300%301%301%300%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_aarch64_def x = x
    val op elf_ma_aarch64_def =
    DT(((("elf_header",45),[]),[]),
       [read"%278%483@%342%300%300%300%301%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_avr32_def x = x
    val op elf_ma_avr32_def =
    DT(((("elf_header",46),[]),[]),
       [read"%278%494@%342%300%301%300%301%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_stm8_def x = x
    val op elf_ma_stm8_def =
    DT(((("elf_header",47),[]),[]),
       [read"%278%668@%342%301%301%300%301%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_tile64_def x = x
    val op elf_ma_tile64_def =
    DT(((("elf_header",48),[]),[]),
       [read"%278%671@%342%300%300%301%301%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_tilepro_def x = x
    val op elf_ma_tilepro_def =
    DT(((("elf_header",49),[]),[]),
       [read"%278%673@%342%301%300%301%301%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_microblaze_def x = x
    val op elf_ma_microblaze_def =
    DT(((("elf_header",50),[]),[]),
       [read"%278%569@%342%300%301%301%301%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_cuda_def x = x
    val op elf_ma_cuda_def =
    DT(((("elf_header",51),[]),[]),
       [read"%278%517@%342%301%301%301%301%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_tilegx_def x = x
    val op elf_ma_tilegx_def =
    DT(((("elf_header",52),[]),[]),
       [read"%278%672@%342%300%300%300%300%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_cypress_def x = x
    val op elf_ma_cypress_def =
    DT(((("elf_header",53),[]),[]),
       [read"%278%518@%342%300%301%300%300%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_r32c_def x = x
    val op elf_ma_r32c_def =
    DT(((("elf_header",54),[]),[]),
       [read"%278%598@%342%301%301%300%300%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_trimedia_def x = x
    val op elf_ma_trimedia_def =
    DT(((("elf_header",55),[]),[]),
       [read"%278%678@%342%300%300%301%300%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_qdsp6_def x = x
    val op elf_ma_qdsp6_def =
    DT(((("elf_header",56),[]),[]),
       [read"%278%597@%342%301%300%301%300%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_8051_def x = x
    val op elf_ma_8051_def =
    DT(((("elf_header",57),[]),[]),
       [read"%278%479@%342%300%301%301%300%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_stxp7x_def x = x
    val op elf_ma_stxp7x_def =
    DT(((("elf_header",58),[]),[]),
       [read"%278%669@%342%301%301%301%300%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_nds32_def x = x
    val op elf_ma_nds32_def =
    DT(((("elf_header",59),[]),[]),
       [read"%278%582@%342%300%300%300%301%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_ecog1x_def x = x
    val op elf_ma_ecog1x_def =
    DT(((("elf_header",60),[]),[]),
       [read"%278%525@%342%301%300%300%301%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_maxq30_def x = x
    val op elf_ma_maxq30_def =
    DT(((("elf_header",61),[]),[]),
       [read"%278%564@%342%300%301%300%301%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_ximo16_def x = x
    val op elf_ma_ximo16_def =
    DT(((("elf_header",62),[]),[]),
       [read"%278%692@%342%301%301%300%301%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_manik_def x = x
    val op elf_ma_manik_def =
    DT(((("elf_header",63),[]),[]),
       [read"%278%562@%342%300%300%301%301%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_craynv2_def x = x
    val op elf_ma_craynv2_def =
    DT(((("elf_header",64),[]),[]),
       [read"%278%514@%342%301%300%301%301%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_rx_def x = x
    val op elf_ma_rx_def =
    DT(((("elf_header",65),[]),[]),
       [read"%278%649@%342%300%301%301%301%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_metag_def x = x
    val op elf_ma_metag_def =
    DT(((("elf_header",66),[]),[]),
       [read"%278%568@%342%301%301%301%301%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_mcst_elbrus_def x = x
    val op elf_ma_mcst_elbrus_def =
    DT(((("elf_header",67),[]),[]),
       [read"%278%566@%342%300%300%300%300%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_ecog16_def x = x
    val op elf_ma_ecog16_def =
    DT(((("elf_header",68),[]),[]),
       [read"%278%524@%342%301%300%300%300%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_cr16_def x = x
    val op elf_ma_cr16_def =
    DT(((("elf_header",69),[]),[]),
       [read"%278%513@%342%300%301%300%300%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_etpu_def x = x
    val op elf_ma_etpu_def =
    DT(((("elf_header",70),[]),[]),
       [read"%278%527@%342%301%301%300%300%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_tsk3000_def x = x
    val op elf_ma_tsk3000_def =
    DT(((("elf_header",71),[]),[]),
       [read"%278%679@%342%300%300%301%300%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_rs08_def x = x
    val op elf_ma_rs08_def =
    DT(((("elf_header",72),[]),[]),
       [read"%278%648@%342%301%300%301%300%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_sharc_def x = x
    val op elf_ma_sharc_def =
    DT(((("elf_header",73),[]),[]),
       [read"%278%655@%342%300%301%301%300%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_ecog2_def x = x
    val op elf_ma_ecog2_def =
    DT(((("elf_header",74),[]),[]),
       [read"%278%526@%342%301%301%301%300%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_ccore7_def x = x
    val op elf_ma_ccore7_def =
    DT(((("elf_header",75),[]),[]),
       [read"%278%503@%342%300%300%300%301%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_dsp24_def x = x
    val op elf_ma_dsp24_def =
    DT(((("elf_header",76),[]),[]),
       [read"%278%521@%342%301%300%300%301%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_videocore3_def x = x
    val op elf_ma_videocore3_def =
    DT(((("elf_header",77),[]),[]),
       [read"%278%685@%342%300%301%300%301%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_latticemico32_def x = x
    val op elf_ma_latticemico32_def =
    DT(((("elf_header",78),[]),[]),
       [read"%278%557@%342%301%301%300%301%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_c17_def x = x
    val op elf_ma_c17_def =
    DT(((("elf_header",79),[]),[]),
       [read"%278%499@%342%300%300%301%301%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_c6000_def x = x
    val op elf_ma_c6000_def =
    DT(((("elf_header",80),[]),[]),
       [read"%278%502@%342%301%300%301%301%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_c2000_def x = x
    val op elf_ma_c2000_def =
    DT(((("elf_header",81),[]),[]),
       [read"%278%500@%342%300%301%301%301%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_c5500_def x = x
    val op elf_ma_c5500_def =
    DT(((("elf_header",82),[]),[]),
       [read"%278%501@%342%301%301%301%301%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_mmdsp_plus_def x = x
    val op elf_ma_mmdsp_plus_def =
    DT(((("elf_header",83),[]),[]),
       [read"%278%574@%342%301%300%300%300%300%301%300%364@@@@@@@@@"])
  fun op elf_ma_zsp_def x = x
    val op elf_ma_zsp_def =
    DT(((("elf_header",84),[]),[]),
       [read"%278%695@%342%300%300%300%300%301%300%364@@@@@@@@"])
  fun op elf_ma_mmix_def x = x
    val op elf_ma_mmix_def =
    DT(((("elf_header",85),[]),[]),
       [read"%278%575@%342%301%300%300%300%301%300%364@@@@@@@@"])
  fun op elf_ma_huany_def x = x
    val op elf_ma_huany_def =
    DT(((("elf_header",86),[]),[]),
       [read"%278%539@%342%300%301%300%300%301%300%364@@@@@@@@"])
  fun op elf_ma_prism_def x = x
    val op elf_ma_prism_def =
    DT(((("elf_header",87),[]),[]),
       [read"%278%596@%342%301%301%300%300%301%300%364@@@@@@@@"])
  fun op elf_ma_avr_def x = x
    val op elf_ma_avr_def =
    DT(((("elf_header",88),[]),[]),
       [read"%278%493@%342%300%300%301%300%301%300%364@@@@@@@@"])
  fun op elf_ma_fr30_def x = x
    val op elf_ma_fr30_def =
    DT(((("elf_header",89),[]),[]),
       [read"%278%532@%342%301%300%301%300%301%300%364@@@@@@@@"])
  fun op elf_ma_d10v_def x = x
    val op elf_ma_d10v_def =
    DT(((("elf_header",90),[]),[]),
       [read"%278%519@%342%300%301%301%300%301%300%364@@@@@@@@"])
  fun op elf_ma_d30v_def x = x
    val op elf_ma_d30v_def =
    DT(((("elf_header",91),[]),[]),
       [read"%278%520@%342%301%301%301%300%301%300%364@@@@@@@@"])
  fun op elf_ma_v850_def x = x
    val op elf_ma_v850_def =
    DT(((("elf_header",92),[]),[]),
       [read"%278%682@%342%300%300%300%301%301%300%364@@@@@@@@"])
  fun op elf_ma_m32r_def x = x
    val op elf_ma_m32r_def =
    DT(((("elf_header",93),[]),[]),
       [read"%278%561@%342%301%300%300%301%301%300%364@@@@@@@@"])
  fun op elf_ma_mn10300_def x = x
    val op elf_ma_mn10300_def =
    DT(((("elf_header",94),[]),[]),
       [read"%278%577@%342%300%301%300%301%301%300%364@@@@@@@@"])
  fun op elf_ma_mn10200_def x = x
    val op elf_ma_mn10200_def =
    DT(((("elf_header",95),[]),[]),
       [read"%278%576@%342%301%301%300%301%301%300%364@@@@@@@@"])
  fun op elf_ma_pj_def x = x
    val op elf_ma_pj_def =
    DT(((("elf_header",96),[]),[]),
       [read"%278%593@%342%300%300%301%301%301%300%364@@@@@@@@"])
  fun op elf_ma_openrisc_def x = x
    val op elf_ma_openrisc_def =
    DT(((("elf_header",97),[]),[]),
       [read"%278%587@%342%301%300%301%301%301%300%364@@@@@@@@"])
  fun op elf_ma_arc_compact_def x = x
    val op elf_ma_arc_compact_def =
    DT(((("elf_header",98),[]),[]),
       [read"%278%488@%342%300%301%301%301%301%300%364@@@@@@@@"])
  fun op elf_ma_xtensa_def x = x
    val op elf_ma_xtensa_def =
    DT(((("elf_header",99),[]),[]),
       [read"%278%693@%342%301%301%301%301%301%300%364@@@@@@@@"])
  fun op elf_ma_videocore_def x = x
    val op elf_ma_videocore_def =
    DT(((("elf_header",100),[]),[]),
       [read"%278%684@%342%300%300%300%300%300%301%364@@@@@@@@"])
  fun op elf_ma_tmm_gpp_def x = x
    val op elf_ma_tmm_gpp_def =
    DT(((("elf_header",101),[]),[]),
       [read"%278%675@%342%301%300%300%300%300%301%364@@@@@@@@"])
  fun op elf_ma_ns32k_def x = x
    val op elf_ma_ns32k_def =
    DT(((("elf_header",102),[]),[]),
       [read"%278%585@%342%300%301%300%300%300%301%364@@@@@@@@"])
  fun op elf_ma_tpc_def x = x
    val op elf_ma_tpc_def =
    DT(((("elf_header",103),[]),[]),
       [read"%278%676@%342%301%301%300%300%300%301%364@@@@@@@@"])
  fun op elf_ma_snp1k_def x = x
    val op elf_ma_snp1k_def =
    DT(((("elf_header",104),[]),[]),
       [read"%278%657@%342%300%300%301%300%300%301%364@@@@@@@@"])
  fun op elf_ma_st200_def x = x
    val op elf_ma_st200_def =
    DT(((("elf_header",105),[]),[]),
       [read"%278%664@%342%301%300%301%300%300%301%364@@@@@@@@"])
  fun op elf_ma_ip2k_def x = x
    val op elf_ma_ip2k_def =
    DT(((("elf_header",106),[]),[]),
       [read"%278%547@%342%300%301%301%300%300%301%364@@@@@@@@"])
  fun op elf_ma_max_def x = x
    val op elf_ma_max_def =
    DT(((("elf_header",107),[]),[]),
       [read"%278%563@%342%301%301%301%300%300%301%364@@@@@@@@"])
  fun op elf_ma_cr_def x = x
    val op elf_ma_cr_def =
    DT(((("elf_header",108),[]),[]),
       [read"%278%512@%342%300%300%300%301%300%301%364@@@@@@@@"])
  fun op elf_ma_f2mc16_def x = x
    val op elf_ma_f2mc16_def =
    DT(((("elf_header",109),[]),[]),
       [read"%278%529@%342%301%300%300%301%300%301%364@@@@@@@@"])
  fun op elf_ma_msp430_def x = x
    val op elf_ma_msp430_def =
    DT(((("elf_header",110),[]),[]),
       [read"%278%579@%342%300%301%300%301%300%301%364@@@@@@@@"])
  fun op elf_ma_blackfin_def x = x
    val op elf_ma_blackfin_def =
    DT(((("elf_header",111),[]),[]),
       [read"%278%497@%342%301%301%300%301%300%301%364@@@@@@@@"])
  fun op elf_ma_se_c33_def x = x
    val op elf_ma_se_c33_def =
    DT(((("elf_header",112),[]),[]),
       [read"%278%652@%342%300%300%301%301%300%301%364@@@@@@@@"])
  fun op elf_ma_sep_def x = x
    val op elf_ma_sep_def =
    DT(((("elf_header",113),[]),[]),
       [read"%278%653@%342%301%300%301%301%300%301%364@@@@@@@@"])
  fun op elf_ma_arca_def x = x
    val op elf_ma_arca_def =
    DT(((("elf_header",114),[]),[]),
       [read"%278%490@%342%300%301%301%301%300%301%364@@@@@@@@"])
  fun op elf_ma_unicore_def x = x
    val op elf_ma_unicore_def =
    DT(((("elf_header",115),[]),[]),
       [read"%278%680@%342%301%301%301%301%300%301%364@@@@@@@@"])
  fun op elf_ma_excess_def x = x
    val op elf_ma_excess_def =
    DT(((("elf_header",116),[]),[]),
       [read"%278%528@%342%300%300%300%300%301%301%364@@@@@@@@"])
  fun op elf_ma_dxp_def x = x
    val op elf_ma_dxp_def =
    DT(((("elf_header",117),[]),[]),
       [read"%278%523@%342%301%300%300%300%301%301%364@@@@@@@@"])
  fun op elf_ma_altera_nios2_def x = x
    val op elf_ma_altera_nios2_def =
    DT(((("elf_header",118),[]),[]),
       [read"%278%485@%342%300%301%300%300%301%301%364@@@@@@@@"])
  fun op elf_ma_crx_def x = x
    val op elf_ma_crx_def =
    DT(((("elf_header",119),[]),[]),
       [read"%278%516@%342%301%301%300%300%301%301%364@@@@@@@@"])
  fun op elf_ma_xgate_def x = x
    val op elf_ma_xgate_def =
    DT(((("elf_header",120),[]),[]),
       [read"%278%691@%342%300%300%301%300%301%301%364@@@@@@@@"])
  fun op elf_ma_c166_def x = x
    val op elf_ma_c166_def =
    DT(((("elf_header",121),[]),[]),
       [read"%278%498@%342%301%300%301%300%301%301%364@@@@@@@@"])
  fun op elf_ma_m16c_def x = x
    val op elf_ma_m16c_def =
    DT(((("elf_header",122),[]),[]),
       [read"%278%558@%342%300%301%301%300%301%301%364@@@@@@@@"])
  fun op elf_ma_dspic30f_def x = x
    val op elf_ma_dspic30f_def =
    DT(((("elf_header",123),[]),[]),
       [read"%278%522@%342%301%301%301%300%301%301%364@@@@@@@@"])
  fun op elf_ma_ce_def x = x
    val op elf_ma_ce_def =
    DT(((("elf_header",124),[]),[]),
       [read"%278%505@%342%300%300%300%301%301%301%364@@@@@@@@"])
  fun op elf_ma_m32c_def x = x
    val op elf_ma_m32c_def =
    DT(((("elf_header",125),[]),[]),
       [read"%278%560@%342%301%300%300%301%301%301%364@@@@@@@@"])
  fun op elf_ma_none_def x = x
    val op elf_ma_none_def =
    DT(((("elf_header",126),[]),[]), [read"%278%583@%255@"])
  fun op elf_ma_m32_def x = x
    val op elf_ma_m32_def =
    DT(((("elf_header",127),[]),[]), [read"%278%559@%342%300%364@@@"])
  fun op elf_ma_sparc_def x = x
    val op elf_ma_sparc_def =
    DT(((("elf_header",128),[]),[]), [read"%278%658@%342%301%364@@@"])
  fun op elf_ma_386_def x = x
    val op elf_ma_386_def =
    DT(((("elf_header",129),[]),[]), [read"%278%470@%342%300%300%364@@@@"])
  fun op elf_ma_68k_def x = x
    val op elf_ma_68k_def =
    DT(((("elf_header",130),[]),[]), [read"%278%477@%342%301%300%364@@@@"])
  fun op elf_ma_88k_def x = x
    val op elf_ma_88k_def =
    DT(((("elf_header",131),[]),[]), [read"%278%481@%342%300%301%364@@@@"])
  fun op elf_ma_860_def x = x
    val op elf_ma_860_def =
    DT(((("elf_header",132),[]),[]),
       [read"%278%480@%342%300%300%300%364@@@@@"])
  fun op elf_ma_mips_def x = x
    val op elf_ma_mips_def =
    DT(((("elf_header",133),[]),[]),
       [read"%278%570@%342%301%300%300%364@@@@@"])
  fun op elf_ma_s370_def x = x
    val op elf_ma_s370_def =
    DT(((("elf_header",134),[]),[]),
       [read"%278%650@%342%300%301%300%364@@@@@"])
  fun op elf_ma_mips_rs3_le_def x = x
    val op elf_ma_mips_rs3_le_def =
    DT(((("elf_header",135),[]),[]),
       [read"%278%571@%342%301%301%300%364@@@@@"])
  fun op elf_ma_parisc_def x = x
    val op elf_ma_parisc_def =
    DT(((("elf_header",136),[]),[]),
       [read"%278%588@%342%300%300%300%300%364@@@@@@"])
  fun op elf_ma_vpp500_def x = x
    val op elf_ma_vpp500_def =
    DT(((("elf_header",137),[]),[]),
       [read"%278%688@%342%300%301%300%300%364@@@@@@"])
  fun op elf_ma_sparc32plus_def x = x
    val op elf_ma_sparc32plus_def =
    DT(((("elf_header",138),[]),[]),
       [read"%278%659@%342%301%301%300%300%364@@@@@@"])
  fun op elf_ma_960_def x = x
    val op elf_ma_960_def =
    DT(((("elf_header",139),[]),[]),
       [read"%278%482@%342%300%300%301%300%364@@@@@@"])
  fun op elf_ma_ppc_def x = x
    val op elf_ma_ppc_def =
    DT(((("elf_header",140),[]),[]),
       [read"%278%594@%342%301%300%301%300%364@@@@@@"])
  fun op elf_ma_ppc64_def x = x
    val op elf_ma_ppc64_def =
    DT(((("elf_header",141),[]),[]),
       [read"%278%595@%342%300%301%301%300%364@@@@@@"])
  fun op elf_ma_s390_def x = x
    val op elf_ma_s390_def =
    DT(((("elf_header",142),[]),[]),
       [read"%278%651@%342%301%301%301%300%364@@@@@@"])
  fun op elf_ma_spu_def x = x
    val op elf_ma_spu_def =
    DT(((("elf_header",143),[]),[]),
       [read"%278%661@%342%300%300%300%301%364@@@@@@"])
  fun op elf_ma_v800_def x = x
    val op elf_ma_v800_def =
    DT(((("elf_header",144),[]),[]),
       [read"%278%681@%342%301%300%301%300%300%364@@@@@@@"])
  fun op elf_ma_fr20_def x = x
    val op elf_ma_fr20_def =
    DT(((("elf_header",145),[]),[]),
       [read"%278%531@%342%300%301%301%300%300%364@@@@@@@"])
  fun op elf_ma_rh32_def x = x
    val op elf_ma_rh32_def =
    DT(((("elf_header",146),[]),[]),
       [read"%278%645@%342%301%301%301%300%300%364@@@@@@@"])
  fun op elf_ma_rce_def x = x
    val op elf_ma_rce_def =
    DT(((("elf_header",147),[]),[]),
       [read"%278%599@%342%300%300%300%301%300%364@@@@@@@"])
  fun op elf_ma_arm_def x = x
    val op elf_ma_arm_def =
    DT(((("elf_header",148),[]),[]),
       [read"%278%491@%342%301%300%300%301%300%364@@@@@@@"])
  fun op elf_ma_alpha_def x = x
    val op elf_ma_alpha_def =
    DT(((("elf_header",149),[]),[]),
       [read"%278%484@%342%300%301%300%301%300%364@@@@@@@"])
  fun op elf_ma_sh_def x = x
    val op elf_ma_sh_def =
    DT(((("elf_header",150),[]),[]),
       [read"%278%654@%342%301%301%300%301%300%364@@@@@@@"])
  fun op elf_ma_sparcv9_def x = x
    val op elf_ma_sparcv9_def =
    DT(((("elf_header",151),[]),[]),
       [read"%278%660@%342%300%300%301%301%300%364@@@@@@@"])
  fun op elf_ma_tricore_def x = x
    val op elf_ma_tricore_def =
    DT(((("elf_header",152),[]),[]),
       [read"%278%677@%342%301%300%301%301%300%364@@@@@@@"])
  fun op elf_ma_arc_def x = x
    val op elf_ma_arc_def =
    DT(((("elf_header",153),[]),[]),
       [read"%278%487@%342%300%301%301%301%300%364@@@@@@@"])
  fun op elf_ma_h8_300_def x = x
    val op elf_ma_h8_300_def =
    DT(((("elf_header",154),[]),[]),
       [read"%278%535@%342%301%301%301%301%300%364@@@@@@@"])
  fun op elf_ma_h8_300h_def x = x
    val op elf_ma_h8_300h_def =
    DT(((("elf_header",155),[]),[]),
       [read"%278%536@%342%300%300%300%300%301%364@@@@@@@"])
  fun op elf_ma_h8s_def x = x
    val op elf_ma_h8s_def =
    DT(((("elf_header",156),[]),[]),
       [read"%278%538@%342%301%300%300%300%301%364@@@@@@@"])
  fun op elf_ma_h8_500_def x = x
    val op elf_ma_h8_500_def =
    DT(((("elf_header",157),[]),[]),
       [read"%278%537@%342%300%301%300%300%301%364@@@@@@@"])
  fun op elf_ma_ia_64_def x = x
    val op elf_ma_ia_64_def =
    DT(((("elf_header",158),[]),[]),
       [read"%278%540@%342%301%301%300%300%301%364@@@@@@@"])
  fun op elf_ma_mips_x_def x = x
    val op elf_ma_mips_x_def =
    DT(((("elf_header",159),[]),[]),
       [read"%278%572@%342%300%300%301%300%301%364@@@@@@@"])
  fun op elf_ma_coldfire_def x = x
    val op elf_ma_coldfire_def =
    DT(((("elf_header",160),[]),[]),
       [read"%278%508@%342%301%300%301%300%301%364@@@@@@@"])
  fun op elf_ma_68hc12_def x = x
    val op elf_ma_68hc12_def =
    DT(((("elf_header",161),[]),[]),
       [read"%278%475@%342%300%301%301%300%301%364@@@@@@@"])
  fun op elf_ma_mma_def x = x
    val op elf_ma_mma_def =
    DT(((("elf_header",162),[]),[]),
       [read"%278%573@%342%301%301%301%300%301%364@@@@@@@"])
  fun op elf_ma_pcp_def x = x
    val op elf_ma_pcp_def =
    DT(((("elf_header",163),[]),[]),
       [read"%278%589@%342%300%300%300%301%301%364@@@@@@@"])
  fun op elf_ma_ncpu_def x = x
    val op elf_ma_ncpu_def =
    DT(((("elf_header",164),[]),[]),
       [read"%278%580@%342%301%300%300%301%301%364@@@@@@@"])
  fun op elf_ma_ndr1_def x = x
    val op elf_ma_ndr1_def =
    DT(((("elf_header",165),[]),[]),
       [read"%278%581@%342%300%301%300%301%301%364@@@@@@@"])
  fun op elf_ma_starcore_def x = x
    val op elf_ma_starcore_def =
    DT(((("elf_header",166),[]),[]),
       [read"%278%667@%342%301%301%300%301%301%364@@@@@@@"])
  fun op elf_ma_me16_def x = x
    val op elf_ma_me16_def =
    DT(((("elf_header",167),[]),[]),
       [read"%278%567@%342%300%300%301%301%301%364@@@@@@@"])
  fun op elf_ma_st100_def x = x
    val op elf_ma_st100_def =
    DT(((("elf_header",168),[]),[]),
       [read"%278%662@%342%301%300%301%301%301%364@@@@@@@"])
  fun op elf_ma_tinyj_def x = x
    val op elf_ma_tinyj_def =
    DT(((("elf_header",169),[]),[]),
       [read"%278%674@%342%300%301%301%301%301%364@@@@@@@"])
  fun op elf_ma_x86_64_def x = x
    val op elf_ma_x86_64_def =
    DT(((("elf_header",170),[]),[]),
       [read"%278%689@%342%301%301%301%301%301%364@@@@@@@"])
  fun op elf_ma_pdsp_def x = x
    val op elf_ma_pdsp_def =
    DT(((("elf_header",171),[]),[]),
       [read"%278%592@%342%300%300%300%300%300%300%364@@@@@@@@"])
  fun op elf_ma_pdp10_def x = x
    val op elf_ma_pdp10_def =
    DT(((("elf_header",172),[]),[]),
       [read"%278%590@%342%301%300%300%300%300%300%364@@@@@@@@"])
  fun op elf_ma_pdp11_def x = x
    val op elf_ma_pdp11_def =
    DT(((("elf_header",173),[]),[]),
       [read"%278%591@%342%300%301%300%300%300%300%364@@@@@@@@"])
  fun op elf_ma_fx66_def x = x
    val op elf_ma_fx66_def =
    DT(((("elf_header",174),[]),[]),
       [read"%278%534@%342%301%301%300%300%300%300%364@@@@@@@@"])
  fun op elf_ma_st9plus_def x = x
    val op elf_ma_st9plus_def =
    DT(((("elf_header",175),[]),[]),
       [read"%278%666@%342%300%300%301%300%300%300%364@@@@@@@@"])
  fun op elf_ma_st7_def x = x
    val op elf_ma_st7_def =
    DT(((("elf_header",176),[]),[]),
       [read"%278%665@%342%301%300%301%300%300%300%364@@@@@@@@"])
  fun op elf_ma_68hc16_def x = x
    val op elf_ma_68hc16_def =
    DT(((("elf_header",177),[]),[]),
       [read"%278%476@%342%300%301%301%300%300%300%364@@@@@@@@"])
  fun op elf_ma_68hc11_def x = x
    val op elf_ma_68hc11_def =
    DT(((("elf_header",178),[]),[]),
       [read"%278%474@%342%301%301%301%300%300%300%364@@@@@@@@"])
  fun op elf_ma_68hc08_def x = x
    val op elf_ma_68hc08_def =
    DT(((("elf_header",179),[]),[]),
       [read"%278%473@%342%300%300%300%301%300%300%364@@@@@@@@"])
  fun op elf_ma_68hc05_def x = x
    val op elf_ma_68hc05_def =
    DT(((("elf_header",180),[]),[]),
       [read"%278%472@%342%301%300%300%301%300%300%364@@@@@@@@"])
  fun op elf_ma_svx_def x = x
    val op elf_ma_svx_def =
    DT(((("elf_header",181),[]),[]),
       [read"%278%670@%342%300%301%300%301%300%300%364@@@@@@@@"])
  fun op elf_ma_st19_def x = x
    val op elf_ma_st19_def =
    DT(((("elf_header",182),[]),[]),
       [read"%278%663@%342%301%301%300%301%300%300%364@@@@@@@@"])
  fun op elf_ma_vax_def x = x
    val op elf_ma_vax_def =
    DT(((("elf_header",183),[]),[]),
       [read"%278%683@%342%300%300%301%301%300%300%364@@@@@@@@"])
  fun op elf_ma_cris_def x = x
    val op elf_ma_cris_def =
    DT(((("elf_header",184),[]),[]),
       [read"%278%515@%342%301%300%301%301%300%300%364@@@@@@@@"])
  fun op elf_ma_javelin_def x = x
    val op elf_ma_javelin_def =
    DT(((("elf_header",185),[]),[]),
       [read"%278%548@%342%300%301%301%301%300%300%364@@@@@@@@"])
  fun op elf_ma_firepath_def x = x
    val op elf_ma_firepath_def =
    DT(((("elf_header",186),[]),[]),
       [read"%278%530@%342%301%301%301%301%300%300%364@@@@@@@@"])
  fun op elf_ma_intel209_def x = x
    val op elf_ma_intel209_def =
    DT(((("elf_header",187),[]),[]),
       [read"%278%546@%342%300%301%300%300%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_intel208_def x = x
    val op elf_ma_intel208_def =
    DT(((("elf_header",188),[]),[]),
       [read"%278%545@%342%301%300%300%300%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_intel207_def x = x
    val op elf_ma_intel207_def =
    DT(((("elf_header",189),[]),[]),
       [read"%278%544@%342%300%300%300%300%301%300%301%364@@@@@@@@@"])
  fun op elf_ma_intel206_def x = x
    val op elf_ma_intel206_def =
    DT(((("elf_header",190),[]),[]),
       [read"%278%543@%342%301%301%301%301%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_intel205_def x = x
    val op elf_ma_intel205_def =
    DT(((("elf_header",191),[]),[]),
       [read"%278%542@%342%300%301%301%301%300%300%301%364@@@@@@@@@"])
  fun op elf_ma_intel182_def x = x
    val op elf_ma_intel182_def =
    DT(((("elf_header",192),[]),[]),
       [read"%278%541@%342%301%301%301%300%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_arm184_def x = x
    val op elf_ma_arm184_def =
    DT(((("elf_header",193),[]),[]),
       [read"%278%492@%342%301%300%300%301%301%301%300%364@@@@@@@@@"])
  fun op elf_ma_reserved6_def x = x
    val op elf_ma_reserved6_def =
    DT(((("elf_header",194),[]),[]), [read"%278%644@%342%301%301%364@@@@"])
  fun op elf_ma_reserved11_def x = x
    val op elf_ma_reserved11_def =
    DT(((("elf_header",195),[]),[]),
       [read"%278%600@%342%300%300%301%364@@@@@"])
  fun op elf_ma_reserved12_def x = x
    val op elf_ma_reserved12_def =
    DT(((("elf_header",196),[]),[]),
       [read"%278%601@%342%301%300%301%364@@@@@"])
  fun op elf_ma_reserved13_def x = x
    val op elf_ma_reserved13_def =
    DT(((("elf_header",197),[]),[]),
       [read"%278%611@%342%300%301%301%364@@@@@"])
  fun op elf_ma_reserved14_def x = x
    val op elf_ma_reserved14_def =
    DT(((("elf_header",198),[]),[]),
       [read"%278%613@%342%301%301%301%364@@@@@"])
  fun op elf_ma_reserved16_def x = x
    val op elf_ma_reserved16_def =
    DT(((("elf_header",199),[]),[]),
       [read"%278%631@%342%301%300%300%300%364@@@@@@"])
  fun op elf_ma_reserved24_def x = x
    val op elf_ma_reserved24_def =
    DT(((("elf_header",200),[]),[]),
       [read"%278%632@%342%301%300%300%301%364@@@@@@"])
  fun op elf_ma_reserved25_def x = x
    val op elf_ma_reserved25_def =
    DT(((("elf_header",201),[]),[]),
       [read"%278%633@%342%300%301%300%301%364@@@@@@"])
  fun op elf_ma_reserved26_def x = x
    val op elf_ma_reserved26_def =
    DT(((("elf_header",202),[]),[]),
       [read"%278%634@%342%301%301%300%301%364@@@@@@"])
  fun op elf_ma_reserved27_def x = x
    val op elf_ma_reserved27_def =
    DT(((("elf_header",203),[]),[]),
       [read"%278%635@%342%300%300%301%301%364@@@@@@"])
  fun op elf_ma_reserved28_def x = x
    val op elf_ma_reserved28_def =
    DT(((("elf_header",204),[]),[]),
       [read"%278%636@%342%301%300%301%301%364@@@@@@"])
  fun op elf_ma_reserved29_def x = x
    val op elf_ma_reserved29_def =
    DT(((("elf_header",205),[]),[]),
       [read"%278%637@%342%300%301%301%301%364@@@@@@"])
  fun op elf_ma_reserved30_def x = x
    val op elf_ma_reserved30_def =
    DT(((("elf_header",206),[]),[]),
       [read"%278%638@%342%301%301%301%301%364@@@@@@"])
  fun op elf_ma_reserved31_def x = x
    val op elf_ma_reserved31_def =
    DT(((("elf_header",207),[]),[]),
       [read"%278%639@%342%300%300%300%300%300%364@@@@@@@"])
  fun op elf_ma_reserved32_def x = x
    val op elf_ma_reserved32_def =
    DT(((("elf_header",208),[]),[]),
       [read"%278%640@%342%301%300%300%300%300%364@@@@@@@"])
  fun op elf_ma_reserved33_def x = x
    val op elf_ma_reserved33_def =
    DT(((("elf_header",209),[]),[]),
       [read"%278%641@%342%300%301%300%300%300%364@@@@@@@"])
  fun op elf_ma_reserved34_def x = x
    val op elf_ma_reserved34_def =
    DT(((("elf_header",210),[]),[]),
       [read"%278%642@%342%301%301%300%300%300%364@@@@@@@"])
  fun op elf_ma_reserved35_def x = x
    val op elf_ma_reserved35_def =
    DT(((("elf_header",211),[]),[]),
       [read"%278%643@%342%300%300%301%300%300%364@@@@@@@"])
  fun op elf_ma_reserved121_def x = x
    val op elf_ma_reserved121_def =
    DT(((("elf_header",212),[]),[]),
       [read"%278%602@%342%300%301%300%301%301%301%364@@@@@@@@"])
  fun op elf_ma_reserved122_def x = x
    val op elf_ma_reserved122_def =
    DT(((("elf_header",213),[]),[]),
       [read"%278%603@%342%301%301%300%301%301%301%364@@@@@@@@"])
  fun op elf_ma_reserved123_def x = x
    val op elf_ma_reserved123_def =
    DT(((("elf_header",214),[]),[]),
       [read"%278%604@%342%300%300%301%301%301%301%364@@@@@@@@"])
  fun op elf_ma_reserved124_def x = x
    val op elf_ma_reserved124_def =
    DT(((("elf_header",215),[]),[]),
       [read"%278%605@%342%301%300%301%301%301%301%364@@@@@@@@"])
  fun op elf_ma_reserved125_def x = x
    val op elf_ma_reserved125_def =
    DT(((("elf_header",216),[]),[]),
       [read"%278%606@%342%300%301%301%301%301%301%364@@@@@@@@"])
  fun op elf_ma_reserved126_def x = x
    val op elf_ma_reserved126_def =
    DT(((("elf_header",217),[]),[]),
       [read"%278%607@%342%301%301%301%301%301%301%364@@@@@@@@"])
  fun op elf_ma_reserved127_def x = x
    val op elf_ma_reserved127_def =
    DT(((("elf_header",218),[]),[]),
       [read"%278%608@%342%300%300%300%300%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved128_def x = x
    val op elf_ma_reserved128_def =
    DT(((("elf_header",219),[]),[]),
       [read"%278%609@%342%301%300%300%300%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved129_def x = x
    val op elf_ma_reserved129_def =
    DT(((("elf_header",220),[]),[]),
       [read"%278%610@%342%300%301%300%300%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved130_def x = x
    val op elf_ma_reserved130_def =
    DT(((("elf_header",221),[]),[]),
       [read"%278%612@%342%301%301%300%300%300%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved143_def x = x
    val op elf_ma_reserved143_def =
    DT(((("elf_header",222),[]),[]),
       [read"%278%614@%342%300%300%300%300%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved144_def x = x
    val op elf_ma_reserved144_def =
    DT(((("elf_header",223),[]),[]),
       [read"%278%615@%342%301%300%300%300%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved145_def x = x
    val op elf_ma_reserved145_def =
    DT(((("elf_header",224),[]),[]),
       [read"%278%616@%342%300%301%300%300%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved146_def x = x
    val op elf_ma_reserved146_def =
    DT(((("elf_header",225),[]),[]),
       [read"%278%617@%342%301%301%300%300%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved147_def x = x
    val op elf_ma_reserved147_def =
    DT(((("elf_header",226),[]),[]),
       [read"%278%618@%342%300%300%301%300%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved148_def x = x
    val op elf_ma_reserved148_def =
    DT(((("elf_header",227),[]),[]),
       [read"%278%619@%342%301%300%301%300%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved149_def x = x
    val op elf_ma_reserved149_def =
    DT(((("elf_header",228),[]),[]),
       [read"%278%620@%342%300%301%301%300%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved150_def x = x
    val op elf_ma_reserved150_def =
    DT(((("elf_header",229),[]),[]),
       [read"%278%621@%342%301%301%301%300%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved151_def x = x
    val op elf_ma_reserved151_def =
    DT(((("elf_header",230),[]),[]),
       [read"%278%622@%342%300%300%300%301%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved152_def x = x
    val op elf_ma_reserved152_def =
    DT(((("elf_header",231),[]),[]),
       [read"%278%623@%342%301%300%300%301%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved153_def x = x
    val op elf_ma_reserved153_def =
    DT(((("elf_header",232),[]),[]),
       [read"%278%624@%342%300%301%300%301%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved154_def x = x
    val op elf_ma_reserved154_def =
    DT(((("elf_header",233),[]),[]),
       [read"%278%625@%342%301%301%300%301%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved155_def x = x
    val op elf_ma_reserved155_def =
    DT(((("elf_header",234),[]),[]),
       [read"%278%626@%342%300%300%301%301%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved156_def x = x
    val op elf_ma_reserved156_def =
    DT(((("elf_header",235),[]),[]),
       [read"%278%627@%342%301%300%301%301%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved157_def x = x
    val op elf_ma_reserved157_def =
    DT(((("elf_header",236),[]),[]),
       [read"%278%628@%342%300%301%301%301%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved158_def x = x
    val op elf_ma_reserved158_def =
    DT(((("elf_header",237),[]),[]),
       [read"%278%629@%342%301%301%301%301%301%300%300%364@@@@@@@@@"])
  fun op elf_ma_reserved159_def x = x
    val op elf_ma_reserved159_def =
    DT(((("elf_header",238),[]),[]),
       [read"%278%630@%342%300%300%300%300%300%301%300%364@@@@@@@@@"])
  fun op elf_ev_none_def x = x
    val op elf_ev_none_def =
    DT(((("elf_header",239),[]),[]), [read"%278%449@%255@"])
  fun op elf_ev_current_def x = x
    val op elf_ev_current_def =
    DT(((("elf_header",240),[]),[]), [read"%278%448@%342%300%364@@@"])
  fun op is_valid_extended_version_number_def x = x
    val op is_valid_extended_version_number_def =
    DT(((("elf_header",241),[]),[]),
       [read"%226%181%261%785$0@@%284$0@%342%300%364@@@@|@"])
  fun op elf_ii_mag0_def x = x
    val op elf_ii_mag0_def =
    DT(((("elf_header",242),[]),[]), [read"%278%462@%255@"])
  fun op elf_ii_mag1_def x = x
    val op elf_ii_mag1_def =
    DT(((("elf_header",243),[]),[]), [read"%278%463@%342%300%364@@@"])
  fun op elf_ii_mag2_def x = x
    val op elf_ii_mag2_def =
    DT(((("elf_header",244),[]),[]), [read"%278%464@%342%301%364@@@"])
  fun op elf_ii_mag3_def x = x
    val op elf_ii_mag3_def =
    DT(((("elf_header",245),[]),[]), [read"%278%465@%342%300%300%364@@@@"])
  fun op elf_ii_class_def x = x
    val op elf_ii_class_def =
    DT(((("elf_header",246),[]),[]), [read"%278%460@%342%301%300%364@@@@"])
  fun op elf_ii_data_def x = x
    val op elf_ii_data_def =
    DT(((("elf_header",247),[]),[]), [read"%278%461@%342%300%301%364@@@@"])
  fun op elf_ii_version_def x = x
    val op elf_ii_version_def =
    DT(((("elf_header",248),[]),[]), [read"%278%469@%342%301%301%364@@@@"])
  fun op elf_ii_osabi_def x = x
    val op elf_ii_osabi_def =
    DT(((("elf_header",249),[]),[]),
       [read"%278%467@%342%300%300%300%364@@@@@"])
  fun op elf_ii_abiversion_def x = x
    val op elf_ii_abiversion_def =
    DT(((("elf_header",250),[]),[]),
       [read"%278%459@%342%301%300%300%364@@@@@"])
  fun op elf_ii_pad_def x = x
    val op elf_ii_pad_def =
    DT(((("elf_header",251),[]),[]),
       [read"%278%468@%342%300%301%300%364@@@@@"])
  fun op elf_ii_nident_def x = x
    val op elf_ii_nident_def =
    DT(((("elf_header",252),[]),[]),
       [read"%278%466@%342%301%300%300%300%364@@@@@@"])
  fun op elf_mn_mag0_def x = x
    val op elf_mn_mag0_def =
    DT(((("elf_header",253),[]),[]),
       [read"%266%696@%790%342%300%300%300%300%300%300%300%364@@@@@@@@@@"])
  fun op elf_mn_mag1_def x = x
    val op elf_mn_mag1_def =
    DT(((("elf_header",254),[]),[]),
       [read"%266%697@%790%342%300%301%301%300%300%300%364@@@@@@@@@"])
  fun op elf_mn_mag2_def x = x
    val op elf_mn_mag2_def =
    DT(((("elf_header",255),[]),[]),
       [read"%266%698@%790%342%301%300%301%301%300%300%364@@@@@@@@@"])
  fun op elf_mn_mag3_def x = x
    val op elf_mn_mag3_def =
    DT(((("elf_header",256),[]),[]),
       [read"%266%699@%790%342%301%301%301%300%300%300%364@@@@@@@@@"])
  fun op elf_class_none_def x = x
    val op elf_class_none_def =
    DT(((("elf_header",257),[]),[]), [read"%278%444@%255@"])
  fun op elf_class_32_def x = x
    val op elf_class_32_def =
    DT(((("elf_header",258),[]),[]), [read"%278%442@%342%300%364@@@"])
  fun op elf_class_64_def x = x
    val op elf_class_64_def =
    DT(((("elf_header",259),[]),[]), [read"%278%443@%342%301%364@@@"])
  fun op elf_data_none_def x = x
    val op elf_data_none_def =
    DT(((("elf_header",260),[]),[]), [read"%278%447@%255@"])
  fun op elf_data_2lsb_def x = x
    val op elf_data_2lsb_def =
    DT(((("elf_header",261),[]),[]), [read"%278%445@%342%300%364@@@"])
  fun op elf_data_2msb_def x = x
    val op elf_data_2msb_def =
    DT(((("elf_header",262),[]),[]), [read"%278%446@%342%301%364@@@"])
  fun op elf_osabi_none_def x = x
    val op elf_osabi_none_def =
    DT(((("elf_header",263),[]),[]), [read"%278%711@%255@"])
  fun op elf_osabi_hpux_def x = x
    val op elf_osabi_hpux_def =
    DT(((("elf_header",264),[]),[]), [read"%278%706@%342%300%364@@@"])
  fun op elf_osabi_netbsd_def x = x
    val op elf_osabi_netbsd_def =
    DT(((("elf_header",265),[]),[]), [read"%278%710@%342%301%364@@@"])
  fun op elf_osabi_gnu_def x = x
    val op elf_osabi_gnu_def =
    DT(((("elf_header",266),[]),[]), [read"%278%705@%342%300%300%364@@@@"])
  fun op elf_osabi_linux_def x = x
    val op elf_osabi_linux_def =
    DT(((("elf_header",267),[]),[]), [read"%278%708@%342%300%300%364@@@@"])
  fun op elf_osabi_solaris_def x = x
    val op elf_osabi_solaris_def =
    DT(((("elf_header",268),[]),[]), [read"%278%716@%342%301%301%364@@@@"])
  fun op elf_osabi_aix_def x = x
    val op elf_osabi_aix_def =
    DT(((("elf_header",269),[]),[]),
       [read"%278%700@%342%300%300%300%364@@@@@"])
  fun op elf_osabi_irix_def x = x
    val op elf_osabi_irix_def =
    DT(((("elf_header",270),[]),[]),
       [read"%278%707@%342%301%300%300%364@@@@@"])
  fun op elf_osabi_freebsd_def x = x
    val op elf_osabi_freebsd_def =
    DT(((("elf_header",271),[]),[]),
       [read"%278%704@%342%300%301%300%364@@@@@"])
  fun op elf_osabi_tru64_def x = x
    val op elf_osabi_tru64_def =
    DT(((("elf_header",272),[]),[]),
       [read"%278%717@%342%301%301%300%364@@@@@"])
  fun op elf_osabi_modesto_def x = x
    val op elf_osabi_modesto_def =
    DT(((("elf_header",273),[]),[]),
       [read"%278%709@%342%300%300%301%364@@@@@"])
  fun op elf_osabi_openbsd_def x = x
    val op elf_osabi_openbsd_def =
    DT(((("elf_header",274),[]),[]),
       [read"%278%713@%342%301%300%301%364@@@@@"])
  fun op elf_osabi_openvms_def x = x
    val op elf_osabi_openvms_def =
    DT(((("elf_header",275),[]),[]),
       [read"%278%714@%342%300%301%301%364@@@@@"])
  fun op elf_osabi_nsk_def x = x
    val op elf_osabi_nsk_def =
    DT(((("elf_header",276),[]),[]),
       [read"%278%712@%342%301%301%301%364@@@@@"])
  fun op elf_osabi_aros_def x = x
    val op elf_osabi_aros_def =
    DT(((("elf_header",277),[]),[]),
       [read"%278%701@%342%300%300%300%300%364@@@@@@"])
  fun op elf_osabi_fenixos_def x = x
    val op elf_osabi_fenixos_def =
    DT(((("elf_header",278),[]),[]),
       [read"%278%703@%342%301%300%300%300%364@@@@@@"])
  fun op elf_osabi_cloudabi_def x = x
    val op elf_osabi_cloudabi_def =
    DT(((("elf_header",279),[]),[]),
       [read"%278%702@%342%300%301%300%300%364@@@@@@"])
  fun op elf_osabi_openvos_def x = x
    val op elf_osabi_openvos_def =
    DT(((("elf_header",280),[]),[]),
       [read"%278%715@%342%301%301%300%300%364@@@@@@"])
  fun op is_valid_architecture_defined_osabi_version_def x = x
    val op is_valid_architecture_defined_osabi_version_def =
    DT(((("elf_header",281),[]),[]),
       [read"%226%181%261%780$0@@%254%285$0@%342%301%300%300%300%300%300%364@@@@@@@@@%257$0@%342%300%300%300%300%300%300%300%300%364@@@@@@@@@@@@|@"])
  fun op ei_nident_def x = x
    val op ei_nident_def =
    DT(((("elf_header",282),[]),[]),
       [read"%278%379@%342%301%300%300%300%364@@@@@@"])
  fun op elf32_header_TY_DEF x = x
    val op elf32_header_TY_DEF =
    DT(((("elf_header",283),[("bool",[26])]),["DISK_THM"]),
       [read"%292%191%356%11%223%0%283%228%11%283%295%8%288%12%288%22%287%24%287%27%287%31%287%35%287%38%288%40%288%42%288%14%288%16%288%18%288%20%282$14@%8%12%22%24%27%31%35%38%40%42%14%16%18%20%314%255@%252$13@%245$12@%242$11@%235$10@%236$9@%237$8@%238$7@%239$6@%248$5@%247$4@%246$3@%243$2@%240$1@$0@@@@@@@@@@@@@@%181%303|@||||||||||||||$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_header_case_def x = x
    val op elf32_header_case_def =
    DT(((("elf_header",287),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%8%209%12%209%22%208%24%208%27%208%31%208%35%208%38%209%40%209%42%209%14%209%16%209%18%209%20%220%152%258%380%816$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_size_def x = x
    val op elf32_header_size_def =
    DT(((("elf_header",288),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%8%209%12%209%22%208%24%208%27%208%31%208%35%208%38%209%40%209%42%209%14%209%16%209%18%209%20%278%410%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%230%342%300%364@@@%789%202%255|@$13@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_ident x = x
    val op elf32_header_elf32_ident =
    DT(((("elf_header",289),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%277%388%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$13@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_type x = x
    val op elf32_header_elf32_type =
    DT(((("elf_header",290),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%406%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$12@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_machine x = x
    val op elf32_header_elf32_machine =
    DT(((("elf_header",291),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%390%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_version x = x
    val op elf32_header_elf32_version =
    DT(((("elf_header",292),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%408%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$10@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_entry x = x
    val op elf32_header_elf32_entry =
    DT(((("elf_header",293),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%384%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_phoff x = x
    val op elf32_header_elf32_phoff =
    DT(((("elf_header",294),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%396%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shoff x = x
    val op elf32_header_elf32_shoff =
    DT(((("elf_header",295),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%402%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_flags x = x
    val op elf32_header_elf32_flags =
    DT(((("elf_header",296),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%386%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_ehsize x = x
    val op elf32_header_elf32_ehsize =
    DT(((("elf_header",297),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%382%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_phentsize x = x
    val op elf32_header_elf32_phentsize =
    DT(((("elf_header",298),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%392%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_phnum x = x
    val op elf32_header_elf32_phnum =
    DT(((("elf_header",299),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%394%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shentsize x = x
    val op elf32_header_elf32_shentsize =
    DT(((("elf_header",300),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%398%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shnum x = x
    val op elf32_header_elf32_shnum =
    DT(((("elf_header",301),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%400%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shstrndx x = x
    val op elf32_header_elf32_shstrndx =
    DT(((("elf_header",302),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%404%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_ident_fupd x = x
    val op elf32_header_elf32_ident_fupd =
    DT(((("elf_header",304),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%221%153%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%389$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$14$13@@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_type_fupd x = x
    val op elf32_header_elf32_type_fupd =
    DT(((("elf_header",305),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%407$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$14$12@@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_machine_fupd x = x
    val op elf32_header_elf32_machine_fupd =
    DT(((("elf_header",306),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%391$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$14$11@@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_version_fupd x = x
    val op elf32_header_elf32_version_fupd =
    DT(((("elf_header",307),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%215%149%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%409$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$14$10@@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_entry_fupd x = x
    val op elf32_header_elf32_entry_fupd =
    DT(((("elf_header",308),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%215%149%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%385$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$14$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_phoff_fupd x = x
    val op elf32_header_elf32_phoff_fupd =
    DT(((("elf_header",309),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%215%149%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%397$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$14$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shoff_fupd x = x
    val op elf32_header_elf32_shoff_fupd =
    DT(((("elf_header",310),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%215%149%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%403$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$14$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_flags_fupd x = x
    val op elf32_header_elf32_flags_fupd =
    DT(((("elf_header",311),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%215%149%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%387$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$14$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_ehsize_fupd x = x
    val op elf32_header_elf32_ehsize_fupd =
    DT(((("elf_header",312),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%383$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$6@$14$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_phentsize_fupd x = x
    val op elf32_header_elf32_phentsize_fupd =
    DT(((("elf_header",313),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%393$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$14$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_phnum_fupd x = x
    val op elf32_header_elf32_phnum_fupd =
    DT(((("elf_header",314),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%395$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$14$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shentsize_fupd x = x
    val op elf32_header_elf32_shentsize_fupd =
    DT(((("elf_header",315),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%399$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$14$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shnum_fupd x = x
    val op elf32_header_elf32_shnum_fupd =
    DT(((("elf_header",316),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%401$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$14$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shstrndx_fupd x = x
    val op elf32_header_elf32_shstrndx_fupd =
    DT(((("elf_header",317),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%405$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$14$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_TY_DEF x = x
    val op elf64_header_TY_DEF =
    DT(((("elf_header",336),[("bool",[26])]),["DISK_THM"]),
       [read"%294%192%355%10%222%1%283%227%10%283%295%8%288%12%288%22%287%24%286%26%286%30%286%34%287%38%288%40%288%42%288%14%288%16%288%18%288%20%281$14@%8%12%22%24%26%30%34%38%40%42%14%16%18%20%313%255@%251$13@%244$12@%241$11@%234$10@%231$9@%232$8@%233$7@%239$6@%248$5@%247$4@%246$3@%243$2@%240$1@$0@@@@@@@@@@@@@@%181%302|@||||||||||||||$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_header_case_def x = x
    val op elf64_header_case_def =
    DT(((("elf_header",340),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%8%209%12%209%22%208%24%207%26%207%30%207%34%208%38%209%40%209%42%209%14%209%16%209%18%209%20%219%151%258%411%817$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_size_def x = x
    val op elf64_header_size_def =
    DT(((("elf_header",341),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%8%209%12%209%22%208%24%207%26%207%30%207%34%208%38%209%40%209%42%209%14%209%16%209%18%209%20%278%441%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%230%342%300%364@@@%789%202%255|@$13@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_ident x = x
    val op elf64_header_elf64_ident =
    DT(((("elf_header",342),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%277%419%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$13@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_type x = x
    val op elf64_header_elf64_type =
    DT(((("elf_header",343),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%437%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$12@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_machine x = x
    val op elf64_header_elf64_machine =
    DT(((("elf_header",344),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%421%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_version x = x
    val op elf64_header_elf64_version =
    DT(((("elf_header",345),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%439%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$10@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_entry x = x
    val op elf64_header_elf64_entry =
    DT(((("elf_header",346),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%263%415%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_phoff x = x
    val op elf64_header_elf64_phoff =
    DT(((("elf_header",347),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%263%427%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shoff x = x
    val op elf64_header_elf64_shoff =
    DT(((("elf_header",348),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%263%433%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_flags x = x
    val op elf64_header_elf64_flags =
    DT(((("elf_header",349),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%417%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_ehsize x = x
    val op elf64_header_elf64_ehsize =
    DT(((("elf_header",350),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%413%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_phentsize x = x
    val op elf64_header_elf64_phentsize =
    DT(((("elf_header",351),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%423%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_phnum x = x
    val op elf64_header_elf64_phnum =
    DT(((("elf_header",352),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%425%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shentsize x = x
    val op elf64_header_elf64_shentsize =
    DT(((("elf_header",353),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%429%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shnum x = x
    val op elf64_header_elf64_shnum =
    DT(((("elf_header",354),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%431%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shstrndx x = x
    val op elf64_header_elf64_shstrndx =
    DT(((("elf_header",355),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%435%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_ident_fupd x = x
    val op elf64_header_elf64_ident_fupd =
    DT(((("elf_header",357),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%221%153%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%420$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$14$13@@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_type_fupd x = x
    val op elf64_header_elf64_type_fupd =
    DT(((("elf_header",358),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%438$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$14$12@@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_machine_fupd x = x
    val op elf64_header_elf64_machine_fupd =
    DT(((("elf_header",359),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%422$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$14$11@@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_version_fupd x = x
    val op elf64_header_elf64_version_fupd =
    DT(((("elf_header",360),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%215%149%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%440$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$14$10@@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_entry_fupd x = x
    val op elf64_header_elf64_entry_fupd =
    DT(((("elf_header",361),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%214%148%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%416$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$14$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_phoff_fupd x = x
    val op elf64_header_elf64_phoff_fupd =
    DT(((("elf_header",362),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%214%148%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%428$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$14$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shoff_fupd x = x
    val op elf64_header_elf64_shoff_fupd =
    DT(((("elf_header",363),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%214%148%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%434$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$14$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_flags_fupd x = x
    val op elf64_header_elf64_flags_fupd =
    DT(((("elf_header",364),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%215%149%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%418$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$14$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_ehsize_fupd x = x
    val op elf64_header_elf64_ehsize_fupd =
    DT(((("elf_header",365),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%414$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$6@$14$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_phentsize_fupd x = x
    val op elf64_header_elf64_phentsize_fupd =
    DT(((("elf_header",366),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%424$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$14$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_phnum_fupd x = x
    val op elf64_header_elf64_phnum_fupd =
    DT(((("elf_header",367),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%426$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$14$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shentsize_fupd x = x
    val op elf64_header_elf64_shentsize_fupd =
    DT(((("elf_header",368),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%430$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$14$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shnum_fupd x = x
    val op elf64_header_elf64_shnum_fupd =
    DT(((("elf_header",369),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%432$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$14$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shstrndx_fupd x = x
    val op elf64_header_elf64_shstrndx_fupd =
    DT(((("elf_header",370),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%436$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$14$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op is_valid_elf32_header_def x = x
    val op is_valid_elf32_header_def =
    DT(((("elf_header",389),[]),[]),
       [read"%210%173%261%781$0@@%277%354%342%301%300%364@@@@%388$0@@@%309%696@%309%697@%309%698@%309%699@%338@@@@@@|@"])
  fun op is_valid_elf64_header_def x = x
    val op is_valid_elf64_header_def =
    DT(((("elf_header",390),[]),[]),
       [read"%211%174%261%783$0@@%277%354%342%301%300%364@@@@%419$0@@@%309%696@%309%697@%309%698@%309%699@%338@@@@@@|@"])
  fun op elf32_header_compare_def x = x
    val op elf32_header_compare_def =
    DT(((("elf_header",391),[]),[]),
       [read"%210%169%210%171%280%381$1@$0@@%803%786%730%256@%278@@@%786%730%256@%278@@@%253%337%827@%388$1@@@%312%826%406$1@@@%312%826%390$1@@@%312%825%408$1@@@%312%825%384$1@@@%312%825%396$1@@@%312%825%402$1@@@%312%825%386$1@@@%312%826%382$1@@@%312%826%392$1@@@%312%826%394$1@@@%312%826%398$1@@@%312%826%400$1@@@%312%826%404$1@@@%341@@@@@@@@@@@@@@@%253%337%827@%388$0@@@%312%826%406$0@@@%312%826%390$0@@@%312%825%408$0@@@%312%825%384$0@@@%312%825%396$0@@@%312%825%402$0@@@%312%825%386$0@@@%312%826%382$0@@@%312%826%392$0@@@%312%826%394$0@@@%312%826%398$0@@@%312%826%400$0@@@%312%826%404$0@@@%341@@@@@@@@@@@@@@@@|@|@"])
  fun op instance_Basic_classes_Ord_Elf_header_elf32_header_dict_def x = x
    val op instance_Basic_classes_Ord_Elf_header_elf32_header_dict_def =
    DT(((("elf_header",392),[]),[]),
       [read"%259%755@%343%325%381@@%351%324%156%158%280%381$1@$0@@%334@||@@%349%324%156%158%319%381$1@$0@@%320%334@%320%317@%316@@@||@@%347%324%156%158%280%381$1@$0@@%318@||@@%345%324%156%158%319%381$1@$0@@%320%318@%320%317@%316@@@||@@%296@@@@@@"])
  fun op elf64_header_compare_def x = x
    val op elf64_header_compare_def =
    DT(((("elf_header",393),[]),[]),
       [read"%211%170%211%172%280%412$1@$0@@%803%786%730%256@%278@@@%786%730%256@%278@@@%253%337%827@%419$1@@@%312%826%437$1@@@%312%826%421$1@@@%312%825%439$1@@@%312%824%415$1@@@%312%824%427$1@@@%312%824%433$1@@@%312%825%417$1@@@%312%826%413$1@@@%312%826%423$1@@@%312%826%425$1@@@%312%826%429$1@@@%312%826%431$1@@@%312%826%435$1@@@%341@@@@@@@@@@@@@@@%253%337%827@%419$0@@@%312%826%437$0@@@%312%826%421$0@@@%312%825%439$0@@@%312%824%415$0@@@%312%824%427$0@@@%312%824%433$0@@@%312%825%417$0@@@%312%826%413$0@@@%312%826%423$0@@@%312%826%425$0@@@%312%826%429$0@@@%312%826%431$0@@@%312%826%435$0@@@%341@@@@@@@@@@@@@@@@|@|@"])
  fun op instance_Basic_classes_Ord_Elf_header_elf64_header_dict_def x = x
    val op instance_Basic_classes_Ord_Elf_header_elf64_header_dict_def =
    DT(((("elf_header",394),[]),[]),
       [read"%260%756@%344%327%412@@%352%326%157%159%280%412$1@$0@@%334@||@@%350%326%157%159%319%412$1@$0@@%320%334@%320%317@%316@@@||@@%348%326%157%159%280%412$1@$0@@%318@||@@%346%326%157%159%319%412$1@$0@@%320%318@%320%317@%316@@@||@@%297@@@@@@"])
  fun op is_elf32_executable_file_def x = x
    val op is_elf32_executable_file_def =
    DT(((("elf_header",395),[]),[]),
       [read"%210%173%261%757$0@@%278%826%406$0@@@%452@@|@"])
  fun op is_elf64_executable_file_def x = x
    val op is_elf64_executable_file_def =
    DT(((("elf_header",396),[]),[]),
       [read"%211%174%261%768$0@@%278%826%437$0@@@%452@@|@"])
  fun op is_elf32_shared_object_file_def x = x
    val op is_elf32_shared_object_file_def =
    DT(((("elf_header",397),[]),[]),
       [read"%210%173%261%767$0@@%278%826%406$0@@@%451@@|@"])
  fun op is_elf64_shared_object_file_def x = x
    val op is_elf64_shared_object_file_def =
    DT(((("elf_header",398),[]),[]),
       [read"%211%174%261%776$0@@%278%826%437$0@@@%451@@|@"])
  fun op is_elf32_relocatable_file_def x = x
    val op is_elf32_relocatable_file_def =
    DT(((("elf_header",399),[]),[]),
       [read"%210%173%261%766$0@@%278%826%406$0@@@%458@@|@"])
  fun op is_elf64_relocatable_file_def x = x
    val op is_elf64_relocatable_file_def =
    DT(((("elf_header",400),[]),[]),
       [read"%211%174%261%775$0@@%278%826%437$0@@@%458@@|@"])
  fun op is_elf32_linkable_file_def x = x
    val op is_elf32_linkable_file_def =
    DT(((("elf_header",401),[]),[]),
       [read"%210%173%261%765$0@@%365%767$0@@%766$0@@@|@"])
  fun op is_elf64_linkable_file_def x = x
    val op is_elf64_linkable_file_def =
    DT(((("elf_header",402),[]),[]),
       [read"%211%174%261%774$0@@%365%776$0@@%775$0@@@|@"])
  fun op get_elf32_machine_architecture_def x = x
    val op get_elf32_machine_architecture_def =
    DT(((("elf_header",403),[]),[]),
       [read"%210%173%278%737$0@@%826%390$0@@@|@"])
  fun op get_elf64_machine_architecture_def x = x
    val op get_elf64_machine_architecture_def =
    DT(((("elf_header",404),[]),[]),
       [read"%211%174%278%746$0@@%826%421$0@@@|@"])
  fun op get_elf32_osabi_def x = x
    val op get_elf32_osabi_def =
    DT(((("elf_header",405),[]),[]),
       [read"%210%173%278%738$0@@%802%788%388$0@@%754%467@@@%728%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%364@@@@@@@@%310%305%342%301%301%300%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%182%827$0@|@@|@"])
  fun op get_elf64_osabi_def x = x
    val op get_elf64_osabi_def =
    DT(((("elf_header",406),[]),[]),
       [read"%211%174%278%747$0@@%802%788%419$0@@%754%467@@@%728%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%301%364@@@@@@@@%310%305%342%301%300%301%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%182%827$0@|@@|@"])
  fun op get_elf32_data_encoding_def x = x
    val op get_elf32_data_encoding_def =
    DT(((("elf_header",407),[]),[]),
       [read"%210%173%278%732$0@@%802%788%388$0@@%754%461@@@%728%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%364@@@@@@@@%310%305%342%301%301%300%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%103%827$0@|@@|@"])
  fun op get_elf64_data_encoding_def x = x
    val op get_elf64_data_encoding_def =
    DT(((("elf_header",408),[]),[]),
       [read"%211%174%278%741$0@@%802%788%419$0@@%754%461@@@%728%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%301%364@@@@@@@@%310%305%342%301%300%301%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%103%827$0@|@@|@"])
  fun op get_elf32_file_class_def x = x
    val op get_elf32_file_class_def =
    DT(((("elf_header",409),[]),[]),
       [read"%210%173%278%733$0@@%802%788%388$0@@%754%460@@@%728%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%364@@@@@@@@%310%305%342%301%301%300%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%102%827$0@|@@|@"])
  fun op get_elf64_file_class_def x = x
    val op get_elf64_file_class_def =
    DT(((("elf_header",410),[]),[]),
       [read"%211%174%278%742$0@@%802%788%419$0@@%754%460@@@%728%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%301%364@@@@@@@@%310%305%342%301%300%301%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%102%827$0@|@@|@"])
  fun op get_elf32_version_number_def x = x
    val op get_elf32_version_number_def =
    DT(((("elf_header",411),[]),[]),
       [read"%210%173%278%739$0@@%802%788%388$0@@%754%469@@@%728%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%364@@@@@@@@%310%305%342%301%301%300%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%204%827$0@|@@|@"])
  fun op get_elf64_version_number_def x = x
    val op get_elf64_version_number_def =
    DT(((("elf_header",412),[]),[]),
       [read"%211%174%278%748$0@@%802%788%419$0@@%754%469@@@%728%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%301%364@@@@@@@@%310%305%342%301%300%301%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%204%827$0@|@@|@"])
  fun op is_valid_elf32_version_numer_def x = x
    val op is_valid_elf32_version_numer_def =
    DT(((("elf_header",413),[]),[]),
       [read"%210%173%261%782$0@@%278%739$0@@%448@@|@"])
  fun op is_valid_elf64_version_numer_def x = x
    val op is_valid_elf64_version_numer_def =
    DT(((("elf_header",414),[]),[]),
       [read"%211%174%261%784$0@@%278%748$0@@%448@@|@"])
  fun op get_elf32_abi_version_def x = x
    val op get_elf32_abi_version_def =
    DT(((("elf_header",415),[]),[]),
       [read"%210%173%278%731$0@@%802%788%388$0@@%754%459@@@%728%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%364@@@@@@@@%310%305%342%301%301%300%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%204%827$0@|@@|@"])
  fun op get_elf64_abi_version_def x = x
    val op get_elf64_abi_version_def =
    DT(((("elf_header",416),[]),[]),
       [read"%211%174%278%740$0@@%802%788%419$0@@%754%459@@@%728%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%301%364@@@@@@@@%310%305%342%301%300%301%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%204%827$0@|@@|@"])
  fun op deduce_endianness_def x = x
    val op deduce_endianness_def =
    DT(((("elf_header",417),[]),[]),
       [read"%224%175%269%376$0@@%799%787$0@%342%300%301%364@@@@@%727%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%201%306%278%823$0@@%445@@%335@%306%278%823$0@@%446@@%304@%727%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@@|@"])
  fun op get_elf32_header_endianness_def x = x
    val op get_elf32_header_endianness_def =
    DT(((("elf_header",418),[]),[]),
       [read"%210%173%269%734$0@@%377%388$0@@@|@"])
  fun op get_elf64_header_endianness_def x = x
    val op get_elf64_header_endianness_def =
    DT(((("elf_header",419),[]),[]),
       [read"%211%174%269%743$0@@%377%419$0@@@|@"])
  fun op has_elf32_header_associated_entry_point_def x = x
    val op has_elf32_header_associated_entry_point_def =
    DT(((("elf_header",420),[]),[]),
       [read"%210%173%261%749$0@@%828%278%825%384$0@@@%255@@@|@"])
  fun op has_elf64_header_associated_entry_point_def x = x
    val op has_elf64_header_associated_entry_point_def =
    DT(((("elf_header",421),[]),[]),
       [read"%211%174%261%751$0@@%828%278%824%415$0@@@%255@@@|@"])
  fun op has_elf32_header_string_table_def x = x
    val op has_elf32_header_string_table_def =
    DT(((("elf_header",422),[]),[]),
       [read"%210%173%261%750$0@@%828%278%826%404$0@@@%821@@@|@"])
  fun op has_elf64_header_string_table_def x = x
    val op has_elf64_header_string_table_def =
    DT(((("elf_header",423),[]),[]),
       [read"%211%174%261%752$0@@%828%278%826%435$0@@@%821@@@|@"])
  fun op is_elf32_header_section_size_in_section_header_table_def x = x
    val op is_elf32_header_section_size_in_section_header_table_def =
    DT(((("elf_header",424),[]),[]),
       [read"%210%173%261%760$0@@%278%826%400$0@@@%255@@|@"])
  fun op is_elf64_header_section_size_in_section_header_table_def x = x
    val op is_elf64_header_section_size_in_section_header_table_def =
    DT(((("elf_header",425),[]),[]),
       [read"%211%174%261%770$0@@%278%826%431$0@@@%255@@|@"])
  fun op is_elf32_header_string_table_index_in_link_def x = x
    val op is_elf32_header_string_table_index_in_link_def =
    DT(((("elf_header",426),[]),[]),
       [read"%210%173%261%762$0@@%278%826%404$0@@@%822@@|@"])
  fun op is_elf64_header_string_table_index_in_link_def x = x
    val op is_elf64_header_string_table_index_in_link_def =
    DT(((("elf_header",427),[]),[]),
       [read"%211%174%261%772$0@@%278%826%435$0@@@%822@@|@"])
  fun op read_elf_ident_def x = x
    val op read_elf_ident_def =
    DT(((("elf_header",428),[]),[]),
       [read"%206%44%272%814$0@@%818%379@$0@%815%378@@@|@"])
  fun op bytes_of_elf32_header_def x = x
    val op bytes_of_elf32_header_def =
    DT(((("elf_header",429),[]),[]),
       [read"%210%173%262%368$0@@%330%145%729%311%336%753@%388$1@@@%311%367$0@%406$1@@@%311%367$0@%390$1@@@%311%370$0@%408$1@@@%311%366$0@%384$1@@@%311%369$0@%396$1@@@%311%369$0@%402$1@@@%311%370$0@%386$1@@@%311%367$0@%382$1@@@%311%367$0@%392$1@@@%311%367$0@%394$1@@@%311%367$0@%398$1@@@%311%367$0@%400$1@@@%311%367$0@%404$1@@@%340@@@@@@@@@@@@@@@|@%377%388$0@@@@|@"])
  fun op bytes_of_elf64_header_def x = x
    val op bytes_of_elf64_header_def =
    DT(((("elf_header",430),[]),[]),
       [read"%211%174%262%373$0@@%330%145%729%311%336%753@%419$1@@@%311%372$0@%437$1@@@%311%372$0@%421$1@@@%311%375$0@%439$1@@@%311%371$0@%415$1@@@%311%374$0@%427$1@@@%311%374$0@%433$1@@@%311%375$0@%417$1@@@%311%372$0@%413$1@@@%311%372$0@%423$1@@@%311%372$0@%425$1@@@%311%372$0@%429$1@@@%311%372$0@%431$1@@@%311%372$0@%435$1@@@%340@@@@@@@@@@@@@@@|@%377%419$0@@@@|@"])
  fun op is_elf32_header_padding_correct_def x = x
    val op is_elf32_header_padding_correct_def =
    DT(((("elf_header",431),[]),[]),
       [read"%210%112%261%759$0@@%254%279%788%388$0@@%342%300%301%300%364@@@@@@%353%790%255@@@@%254%279%788%388$0@@%342%301%301%300%364@@@@@@%353%790%255@@@@%254%279%788%388$0@@%342%300%300%301%364@@@@@@%353%790%255@@@@%254%279%788%388$0@@%342%301%300%301%364@@@@@@%353%790%255@@@@%254%279%788%388$0@@%342%300%301%301%364@@@@@@%353%790%255@@@@%254%279%788%388$0@@%342%301%301%301%364@@@@@@%353%790%255@@@@%279%788%388$0@@%342%300%300%300%300%364@@@@@@@%353%790%255@@@@@@@@@@|@"])
  fun op is_magic_number_correct_def x = x
    val op is_magic_number_correct_def =
    DT(((("elf_header",432),[]),[]),
       [read"%225%176%261%777$0@@%254%279%788$0@%255@@%353%790%342%300%300%300%300%300%300%300%364@@@@@@@@@@@@%254%279%788$0@%342%300%364@@@@%353%790%342%300%301%301%300%300%300%364@@@@@@@@@@@%254%279%788$0@%342%301%364@@@@%353%790%342%301%300%301%301%300%300%364@@@@@@@@@@@%279%788$0@%342%300%300%364@@@@@%353%790%342%301%301%301%300%300%300%364@@@@@@@@@@@@@@|@"])
  fun op read_elf32_header_def x = x
    val op read_elf32_header_def =
    DT(((("elf_header",433),[]),[]),
       [read"%206%44%270%806$0@@%723%814$0@@%362%176%44%307%828%777$1@@@%725%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%364@@@@@@@@%310%305%342%301%301%300%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%331%145%721%805$0@$1@@%360%200%44%721%805$2@$0@@%360%180%44%719%808$4@$0@@%358%205%44%719%804$6@$0@@%358%147%44%719%807$8@$0@@%358%188%44%719%807$10@$0@@%358%198%44%719%808$12@$0@@%358%160%44%721%805$14@$0@@%360%114%44%721%805$16@$0@@%360%183%44%721%805$18@$0@@%360%185%44%721%805$20@$0@@%360%193%44%721%805$22@$0@@%360%195%44%721%805$24@$0@@%360%199%44%800%788$28@%342%301%300%364@@@@@%725%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%364@@@@@@@@%310%305%342%301%301%300%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%301%300%300%300%364@@@@@@@@@%310%305%342%301%300%301%301%300%300%364@@@@@@@@@%310%305%342%301%301%301%300%300%300%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%46%307%278%827$0@@%442@@%819%249%389%328$29@@%407%323$26@@%391%323$24@@%409%322$22@@%385%322$20@@%397%322$18@@%403%322$16@@%387%322$14@@%383%323$12@@%393%323$10@@%395%323$8@@%399%323$6@@%401%323$4@@%405%323$2@@%298@@@@@@@@@@@@@@@$1@@@%725%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%364@@@@@@@@%310%305%342%301%301%300%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%300%301%300%301%364@@@@@@@@%310%305%342%301%301%300%300%301%364@@@@@@@@%310%305%342%300%301%301%301%300%364@@@@@@@@%310%305%342%301%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%301%300%300%300%364@@@@@@@@@%310%305%342%301%300%301%301%300%300%364@@@@@@@@@%310%305%342%301%301%301%300%300%300%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@|@%377$1@@@||@@@|@"])
  fun op read_elf64_header_def x = x
    val op read_elf64_header_def =
    DT(((("elf_header",434),[]),[]),
       [read"%206%44%271%811$0@@%724%814$0@@%363%176%44%308%828%777$1@@@%726%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%301%364@@@@@@@@%310%305%342%301%300%301%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%332%145%722%810$0@$1@@%361%200%44%722%810$2@$0@@%361%180%44%720%813$4@$0@@%359%205%44%718%809$6@$0@@%357%146%44%718%812$8@$0@@%357%187%44%718%812$10@$0@@%357%197%44%720%813$12@$0@@%359%160%44%722%810$14@$0@@%361%114%44%722%810$16@$0@@%361%183%44%722%810$18@$0@@%361%185%44%722%810$20@$0@@%361%193%44%722%810$22@$0@@%361%195%44%722%810$24@$0@@%361%199%44%801%788$28@%342%301%300%364@@@@@%726%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%301%364@@@@@@@@%310%305%342%301%300%301%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%300%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%301%300%300%300%364@@@@@@@@@%310%305%342%301%300%301%301%300%300%364@@@@@@@@@%310%305%342%301%301%301%300%300%300%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%46%308%278%827$0@@%443@@%820%250%420%328$29@@%438%323$26@@%422%323$24@@%440%322$22@@%416%321$20@@%428%321$18@@%434%321$16@@%418%322$14@@%414%323$12@@%424%323$10@@%426%323$8@@%430%323$6@@%432%323$4@@%436%323$2@@%299@@@@@@@@@@@@@@@$1@@@%726%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%301%300%301%364@@@@@@@@%310%305%342%301%300%301%300%301%364@@@@@@@@%310%305%342%300%300%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%310%305%342%301%301%300%300%301%301%364@@@@@@@@@%310%305%342%301%301%300%301%301%364@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%301%300%301%364@@@@@@@@@%310%305%342%300%300%300%300%301%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%300%300%300%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%301%364@@@@@@@@%310%305%342%301%300%301%300%301%364@@@@@@@@%310%305%342%300%301%301%301%300%364@@@@@@@@%310%305%342%301%301%300%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%300%301%301%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%300%301%301%300%300%300%364@@@@@@@@@%310%305%342%301%300%301%301%300%300%364@@@@@@@@@%310%305%342%301%301%301%300%300%300%364@@@@@@@@@%310%305%342%301%300%300%300%300%364@@@@@@@@%310%305%342%301%301%301%300%300%301%364@@@@@@@@@%310%305%342%300%301%300%301%300%301%364@@@@@@@@@%310%305%342%301%300%301%301%300%301%364@@@@@@@@@%310%305%342%300%301%301%300%300%301%364@@@@@@@@@%339@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@|@%377$1@@@||@@@|@"])
  fun op is_elf32_header_class_correct_def x = x
    val op is_elf32_header_class_correct_def =
    DT(((("elf_header",435),[]),[]),
       [read"%210%112%261%758$0@@%279%788%388$0@@%342%301%300%364@@@@@%353%790%342%300%364@@@@@@|@"])
  fun op is_elf64_header_class_correct_def x = x
    val op is_elf64_header_class_correct_def =
    DT(((("elf_header",436),[]),[]),
       [read"%211%113%261%769$0@@%279%788%419$0@@%342%301%300%364@@@@@%353%790%342%300%364@@@@@@|@"])
  fun op is_elf32_header_version_correct_def x = x
    val op is_elf32_header_version_correct_def =
    DT(((("elf_header",437),[]),[]),
       [read"%210%112%261%764$0@@%279%788%388$0@@%342%301%301%364@@@@@%353%790%342%300%364@@@@@@|@"])
  fun op is_elf64_header_version_correct_def x = x
    val op is_elf64_header_version_correct_def =
    DT(((("elf_header",438),[]),[]),
       [read"%211%113%261%773$0@@%279%788%419$0@@%342%301%301%364@@@@@%353%790%342%300%364@@@@@@|@"])
  fun op is_elf32_header_valid_def x = x
    val op is_elf32_header_valid_def =
    DT(((("elf_header",439),[]),[]),
       [read"%210%112%261%763$0@@%254%278%329%388$0@@@%379@@%254%777%388$0@@@%254%759$0@@%254%758$0@@%764$0@@@@@@|@"])
  fun op get_elf32_header_program_table_size_def x = x
    val op get_elf32_header_program_table_size_def =
    DT(((("elf_header",440),[]),[]),
       [read"%210%112%278%735$0@@%333%184%333%186%229$1@$0@|@%826%394$1@@@|@%826%392$0@@@@|@"])
  fun op get_elf64_header_program_table_size_def x = x
    val op get_elf64_header_program_table_size_def =
    DT(((("elf_header",441),[]),[]),
       [read"%211%113%278%744$0@@%333%184%333%186%229$1@$0@|@%826%425$1@@@|@%826%423$0@@@@|@"])
  fun op is_elf32_header_section_table_present_def x = x
    val op is_elf32_header_section_table_present_def =
    DT(((("elf_header",442),[]),[]),
       [read"%210%112%261%761$0@@%828%278%825%402$0@@@%255@@@|@"])
  fun op is_elf64_header_section_table_present_def x = x
    val op is_elf64_header_section_table_present_def =
    DT(((("elf_header",443),[]),[]),
       [read"%211%113%261%771$0@@%828%278%824%433$0@@@%255@@@|@"])
  fun op get_elf32_header_section_table_size_def x = x
    val op get_elf32_header_section_table_size_def =
    DT(((("elf_header",444),[]),[]),
       [read"%210%112%278%736$0@@%333%194%333%196%229$1@$0@|@%826%400$1@@@|@%826%398$0@@@@|@"])
  fun op get_elf64_header_section_table_size_def x = x
    val op get_elf64_header_section_table_size_def =
    DT(((("elf_header",445),[]),[]),
       [read"%211%113%278%745$0@@%333%194%333%196%229$1@$0@|@%826%431$1@@@|@%826%429$0@@@@|@"])
  fun op elf32_header_accessors x = x
    val op elf32_header_accessors =
    DT(((("elf_header",303),
        [("elf_header",
         [289,290,291,292,293,294,295,296,297,298,299,300,301,
          302])]),["DISK_THM"]),
       [read"%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%277%388%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$13@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%406%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$12@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%390%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%408%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$10@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%384%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%396%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%402%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%386%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%382%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%392%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%394%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%398%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%400%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%404%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@@@"])
  fun op elf32_header_fn_updates x = x
    val op elf32_header_fn_updates =
    DT(((("elf_header",318),
        [("elf_header",
         [304,305,306,307,308,309,310,311,312,313,314,315,316,
          317])]),["DISK_THM"]),
       [read"%254%221%153%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%389$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$14$13@@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%407$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$14$12@@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%391$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$14$11@@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%215%149%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%409$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$14$10@@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%215%149%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%385$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$14$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%215%149%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%397$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$14$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%215%149%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%403$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$14$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%215%149%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%387$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$14$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%383$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$6@$14$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%393$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$14$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%395$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$14$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%399$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$14$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%401$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$14$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%216%150%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55%267%405$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$14$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@@@"])
  fun op elf32_header_accfupds x = x
    val op elf32_header_accfupds =
    DT(((("elf_header",319),
        [("bool",[25,26,56,181]),
         ("elf_header",[284,285,286,303,318])]),["DISK_THM"]),
       [read"%254%216%150%210%104%277%388%407$1@$0@@@%388$0@@|@|@@%254%216%150%210%104%277%388%391$1@$0@@@%388$0@@|@|@@%254%215%149%210%104%277%388%409$1@$0@@@%388$0@@|@|@@%254%215%149%210%104%277%388%385$1@$0@@@%388$0@@|@|@@%254%215%149%210%104%277%388%397$1@$0@@@%388$0@@|@|@@%254%215%149%210%104%277%388%403$1@$0@@@%388$0@@|@|@@%254%215%149%210%104%277%388%387$1@$0@@@%388$0@@|@|@@%254%216%150%210%104%277%388%383$1@$0@@@%388$0@@|@|@@%254%216%150%210%104%277%388%393$1@$0@@@%388$0@@|@|@@%254%216%150%210%104%277%388%395$1@$0@@@%388$0@@|@|@@%254%216%150%210%104%277%388%399$1@$0@@@%388$0@@|@|@@%254%216%150%210%104%277%388%401$1@$0@@@%388$0@@|@|@@%254%216%150%210%104%277%388%405$1@$0@@@%388$0@@|@|@@%254%221%153%210%104%265%406%389$1@$0@@@%406$0@@|@|@@%254%216%150%210%104%265%406%391$1@$0@@@%406$0@@|@|@@%254%215%149%210%104%265%406%409$1@$0@@@%406$0@@|@|@@%254%215%149%210%104%265%406%385$1@$0@@@%406$0@@|@|@@%254%215%149%210%104%265%406%397$1@$0@@@%406$0@@|@|@@%254%215%149%210%104%265%406%403$1@$0@@@%406$0@@|@|@@%254%215%149%210%104%265%406%387$1@$0@@@%406$0@@|@|@@%254%216%150%210%104%265%406%383$1@$0@@@%406$0@@|@|@@%254%216%150%210%104%265%406%393$1@$0@@@%406$0@@|@|@@%254%216%150%210%104%265%406%395$1@$0@@@%406$0@@|@|@@%254%216%150%210%104%265%406%399$1@$0@@@%406$0@@|@|@@%254%216%150%210%104%265%406%401$1@$0@@@%406$0@@|@|@@%254%216%150%210%104%265%406%405$1@$0@@@%406$0@@|@|@@%254%221%153%210%104%265%390%389$1@$0@@@%390$0@@|@|@@%254%216%150%210%104%265%390%407$1@$0@@@%390$0@@|@|@@%254%215%149%210%104%265%390%409$1@$0@@@%390$0@@|@|@@%254%215%149%210%104%265%390%385$1@$0@@@%390$0@@|@|@@%254%215%149%210%104%265%390%397$1@$0@@@%390$0@@|@|@@%254%215%149%210%104%265%390%403$1@$0@@@%390$0@@|@|@@%254%215%149%210%104%265%390%387$1@$0@@@%390$0@@|@|@@%254%216%150%210%104%265%390%383$1@$0@@@%390$0@@|@|@@%254%216%150%210%104%265%390%393$1@$0@@@%390$0@@|@|@@%254%216%150%210%104%265%390%395$1@$0@@@%390$0@@|@|@@%254%216%150%210%104%265%390%399$1@$0@@@%390$0@@|@|@@%254%216%150%210%104%265%390%401$1@$0@@@%390$0@@|@|@@%254%216%150%210%104%265%390%405$1@$0@@@%390$0@@|@|@@%254%221%153%210%104%264%408%389$1@$0@@@%408$0@@|@|@@%254%216%150%210%104%264%408%407$1@$0@@@%408$0@@|@|@@%254%216%150%210%104%264%408%391$1@$0@@@%408$0@@|@|@@%254%215%149%210%104%264%408%385$1@$0@@@%408$0@@|@|@@%254%215%149%210%104%264%408%397$1@$0@@@%408$0@@|@|@@%254%215%149%210%104%264%408%403$1@$0@@@%408$0@@|@|@@%254%215%149%210%104%264%408%387$1@$0@@@%408$0@@|@|@@%254%216%150%210%104%264%408%383$1@$0@@@%408$0@@|@|@@%254%216%150%210%104%264%408%393$1@$0@@@%408$0@@|@|@@%254%216%150%210%104%264%408%395$1@$0@@@%408$0@@|@|@@%254%216%150%210%104%264%408%399$1@$0@@@%408$0@@|@|@@%254%216%150%210%104%264%408%401$1@$0@@@%408$0@@|@|@@%254%216%150%210%104%264%408%405$1@$0@@@%408$0@@|@|@@%254%221%153%210%104%264%384%389$1@$0@@@%384$0@@|@|@@%254%216%150%210%104%264%384%407$1@$0@@@%384$0@@|@|@@%254%216%150%210%104%264%384%391$1@$0@@@%384$0@@|@|@@%254%215%149%210%104%264%384%409$1@$0@@@%384$0@@|@|@@%254%215%149%210%104%264%384%397$1@$0@@@%384$0@@|@|@@%254%215%149%210%104%264%384%403$1@$0@@@%384$0@@|@|@@%254%215%149%210%104%264%384%387$1@$0@@@%384$0@@|@|@@%254%216%150%210%104%264%384%383$1@$0@@@%384$0@@|@|@@%254%216%150%210%104%264%384%393$1@$0@@@%384$0@@|@|@@%254%216%150%210%104%264%384%395$1@$0@@@%384$0@@|@|@@%254%216%150%210%104%264%384%399$1@$0@@@%384$0@@|@|@@%254%216%150%210%104%264%384%401$1@$0@@@%384$0@@|@|@@%254%216%150%210%104%264%384%405$1@$0@@@%384$0@@|@|@@%254%221%153%210%104%264%396%389$1@$0@@@%396$0@@|@|@@%254%216%150%210%104%264%396%407$1@$0@@@%396$0@@|@|@@%254%216%150%210%104%264%396%391$1@$0@@@%396$0@@|@|@@%254%215%149%210%104%264%396%409$1@$0@@@%396$0@@|@|@@%254%215%149%210%104%264%396%385$1@$0@@@%396$0@@|@|@@%254%215%149%210%104%264%396%403$1@$0@@@%396$0@@|@|@@%254%215%149%210%104%264%396%387$1@$0@@@%396$0@@|@|@@%254%216%150%210%104%264%396%383$1@$0@@@%396$0@@|@|@@%254%216%150%210%104%264%396%393$1@$0@@@%396$0@@|@|@@%254%216%150%210%104%264%396%395$1@$0@@@%396$0@@|@|@@%254%216%150%210%104%264%396%399$1@$0@@@%396$0@@|@|@@%254%216%150%210%104%264%396%401$1@$0@@@%396$0@@|@|@@%254%216%150%210%104%264%396%405$1@$0@@@%396$0@@|@|@@%254%221%153%210%104%264%402%389$1@$0@@@%402$0@@|@|@@%254%216%150%210%104%264%402%407$1@$0@@@%402$0@@|@|@@%254%216%150%210%104%264%402%391$1@$0@@@%402$0@@|@|@@%254%215%149%210%104%264%402%409$1@$0@@@%402$0@@|@|@@%254%215%149%210%104%264%402%385$1@$0@@@%402$0@@|@|@@%254%215%149%210%104%264%402%397$1@$0@@@%402$0@@|@|@@%254%215%149%210%104%264%402%387$1@$0@@@%402$0@@|@|@@%254%216%150%210%104%264%402%383$1@$0@@@%402$0@@|@|@@%254%216%150%210%104%264%402%393$1@$0@@@%402$0@@|@|@@%254%216%150%210%104%264%402%395$1@$0@@@%402$0@@|@|@@%254%216%150%210%104%264%402%399$1@$0@@@%402$0@@|@|@@%254%216%150%210%104%264%402%401$1@$0@@@%402$0@@|@|@@%254%216%150%210%104%264%402%405$1@$0@@@%402$0@@|@|@@%254%221%153%210%104%264%386%389$1@$0@@@%386$0@@|@|@@%254%216%150%210%104%264%386%407$1@$0@@@%386$0@@|@|@@%254%216%150%210%104%264%386%391$1@$0@@@%386$0@@|@|@@%254%215%149%210%104%264%386%409$1@$0@@@%386$0@@|@|@@%254%215%149%210%104%264%386%385$1@$0@@@%386$0@@|@|@@%254%215%149%210%104%264%386%397$1@$0@@@%386$0@@|@|@@%254%215%149%210%104%264%386%403$1@$0@@@%386$0@@|@|@@%254%216%150%210%104%264%386%383$1@$0@@@%386$0@@|@|@@%254%216%150%210%104%264%386%393$1@$0@@@%386$0@@|@|@@%254%216%150%210%104%264%386%395$1@$0@@@%386$0@@|@|@@%254%216%150%210%104%264%386%399$1@$0@@@%386$0@@|@|@@%254%216%150%210%104%264%386%401$1@$0@@@%386$0@@|@|@@%254%216%150%210%104%264%386%405$1@$0@@@%386$0@@|@|@@%254%221%153%210%104%265%382%389$1@$0@@@%382$0@@|@|@@%254%216%150%210%104%265%382%407$1@$0@@@%382$0@@|@|@@%254%216%150%210%104%265%382%391$1@$0@@@%382$0@@|@|@@%254%215%149%210%104%265%382%409$1@$0@@@%382$0@@|@|@@%254%215%149%210%104%265%382%385$1@$0@@@%382$0@@|@|@@%254%215%149%210%104%265%382%397$1@$0@@@%382$0@@|@|@@%254%215%149%210%104%265%382%403$1@$0@@@%382$0@@|@|@@%254%215%149%210%104%265%382%387$1@$0@@@%382$0@@|@|@@%254%216%150%210%104%265%382%393$1@$0@@@%382$0@@|@|@@%254%216%150%210%104%265%382%395$1@$0@@@%382$0@@|@|@@%254%216%150%210%104%265%382%399$1@$0@@@%382$0@@|@|@@%254%216%150%210%104%265%382%401$1@$0@@@%382$0@@|@|@@%254%216%150%210%104%265%382%405$1@$0@@@%382$0@@|@|@@%254%221%153%210%104%265%392%389$1@$0@@@%392$0@@|@|@@%254%216%150%210%104%265%392%407$1@$0@@@%392$0@@|@|@@%254%216%150%210%104%265%392%391$1@$0@@@%392$0@@|@|@@%254%215%149%210%104%265%392%409$1@$0@@@%392$0@@|@|@@%254%215%149%210%104%265%392%385$1@$0@@@%392$0@@|@|@@%254%215%149%210%104%265%392%397$1@$0@@@%392$0@@|@|@@%254%215%149%210%104%265%392%403$1@$0@@@%392$0@@|@|@@%254%215%149%210%104%265%392%387$1@$0@@@%392$0@@|@|@@%254%216%150%210%104%265%392%383$1@$0@@@%392$0@@|@|@@%254%216%150%210%104%265%392%395$1@$0@@@%392$0@@|@|@@%254%216%150%210%104%265%392%399$1@$0@@@%392$0@@|@|@@%254%216%150%210%104%265%392%401$1@$0@@@%392$0@@|@|@@%254%216%150%210%104%265%392%405$1@$0@@@%392$0@@|@|@@%254%221%153%210%104%265%394%389$1@$0@@@%394$0@@|@|@@%254%216%150%210%104%265%394%407$1@$0@@@%394$0@@|@|@@%254%216%150%210%104%265%394%391$1@$0@@@%394$0@@|@|@@%254%215%149%210%104%265%394%409$1@$0@@@%394$0@@|@|@@%254%215%149%210%104%265%394%385$1@$0@@@%394$0@@|@|@@%254%215%149%210%104%265%394%397$1@$0@@@%394$0@@|@|@@%254%215%149%210%104%265%394%403$1@$0@@@%394$0@@|@|@@%254%215%149%210%104%265%394%387$1@$0@@@%394$0@@|@|@@%254%216%150%210%104%265%394%383$1@$0@@@%394$0@@|@|@@%254%216%150%210%104%265%394%393$1@$0@@@%394$0@@|@|@@%254%216%150%210%104%265%394%399$1@$0@@@%394$0@@|@|@@%254%216%150%210%104%265%394%401$1@$0@@@%394$0@@|@|@@%254%216%150%210%104%265%394%405$1@$0@@@%394$0@@|@|@@%254%221%153%210%104%265%398%389$1@$0@@@%398$0@@|@|@@%254%216%150%210%104%265%398%407$1@$0@@@%398$0@@|@|@@%254%216%150%210%104%265%398%391$1@$0@@@%398$0@@|@|@@%254%215%149%210%104%265%398%409$1@$0@@@%398$0@@|@|@@%254%215%149%210%104%265%398%385$1@$0@@@%398$0@@|@|@@%254%215%149%210%104%265%398%397$1@$0@@@%398$0@@|@|@@%254%215%149%210%104%265%398%403$1@$0@@@%398$0@@|@|@@%254%215%149%210%104%265%398%387$1@$0@@@%398$0@@|@|@@%254%216%150%210%104%265%398%383$1@$0@@@%398$0@@|@|@@%254%216%150%210%104%265%398%393$1@$0@@@%398$0@@|@|@@%254%216%150%210%104%265%398%395$1@$0@@@%398$0@@|@|@@%254%216%150%210%104%265%398%401$1@$0@@@%398$0@@|@|@@%254%216%150%210%104%265%398%405$1@$0@@@%398$0@@|@|@@%254%221%153%210%104%265%400%389$1@$0@@@%400$0@@|@|@@%254%216%150%210%104%265%400%407$1@$0@@@%400$0@@|@|@@%254%216%150%210%104%265%400%391$1@$0@@@%400$0@@|@|@@%254%215%149%210%104%265%400%409$1@$0@@@%400$0@@|@|@@%254%215%149%210%104%265%400%385$1@$0@@@%400$0@@|@|@@%254%215%149%210%104%265%400%397$1@$0@@@%400$0@@|@|@@%254%215%149%210%104%265%400%403$1@$0@@@%400$0@@|@|@@%254%215%149%210%104%265%400%387$1@$0@@@%400$0@@|@|@@%254%216%150%210%104%265%400%383$1@$0@@@%400$0@@|@|@@%254%216%150%210%104%265%400%393$1@$0@@@%400$0@@|@|@@%254%216%150%210%104%265%400%395$1@$0@@@%400$0@@|@|@@%254%216%150%210%104%265%400%399$1@$0@@@%400$0@@|@|@@%254%216%150%210%104%265%400%405$1@$0@@@%400$0@@|@|@@%254%221%153%210%104%265%404%389$1@$0@@@%404$0@@|@|@@%254%216%150%210%104%265%404%407$1@$0@@@%404$0@@|@|@@%254%216%150%210%104%265%404%391$1@$0@@@%404$0@@|@|@@%254%215%149%210%104%265%404%409$1@$0@@@%404$0@@|@|@@%254%215%149%210%104%265%404%385$1@$0@@@%404$0@@|@|@@%254%215%149%210%104%265%404%397$1@$0@@@%404$0@@|@|@@%254%215%149%210%104%265%404%403$1@$0@@@%404$0@@|@|@@%254%215%149%210%104%265%404%387$1@$0@@@%404$0@@|@|@@%254%216%150%210%104%265%404%383$1@$0@@@%404$0@@|@|@@%254%216%150%210%104%265%404%393$1@$0@@@%404$0@@|@|@@%254%216%150%210%104%265%404%395$1@$0@@@%404$0@@|@|@@%254%216%150%210%104%265%404%399$1@$0@@@%404$0@@|@|@@%254%216%150%210%104%265%404%401$1@$0@@@%404$0@@|@|@@%254%221%153%210%104%277%388%389$1@$0@@@$1%388$0@@@|@|@@%254%216%150%210%104%265%406%407$1@$0@@@$1%406$0@@@|@|@@%254%216%150%210%104%265%390%391$1@$0@@@$1%390$0@@@|@|@@%254%215%149%210%104%264%408%409$1@$0@@@$1%408$0@@@|@|@@%254%215%149%210%104%264%384%385$1@$0@@@$1%384$0@@@|@|@@%254%215%149%210%104%264%396%397$1@$0@@@$1%396$0@@@|@|@@%254%215%149%210%104%264%402%403$1@$0@@@$1%402$0@@@|@|@@%254%215%149%210%104%264%386%387$1@$0@@@$1%386$0@@@|@|@@%254%216%150%210%104%265%382%383$1@$0@@@$1%382$0@@@|@|@@%254%216%150%210%104%265%392%393$1@$0@@@$1%392$0@@@|@|@@%254%216%150%210%104%265%394%395$1@$0@@@$1%394$0@@@|@|@@%254%216%150%210%104%265%398%399$1@$0@@@$1%398$0@@@|@|@@%254%216%150%210%104%265%400%401$1@$0@@@$1%400$0@@@|@|@@%216%150%210%104%265%404%405$1@$0@@@$1%404$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_header_fupdfupds x = x
    val op elf32_header_fupdfupds =
    DT(((("elf_header",320),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_header",[284,285,286,318])]),["DISK_THM"]),
       [read"%254%221%166%221%153%210%104%267%389$1@%389$2@$0@@@%389%798$1@$2@@$0@@|@|@|@@%254%216%165%216%150%210%104%267%407$1@%407$2@$0@@@%407%793$1@$2@@$0@@|@|@|@@%254%216%165%216%150%210%104%267%391$1@%391$2@$0@@@%391%793$1@$2@@$0@@|@|@|@@%254%215%164%215%149%210%104%267%409$1@%409$2@$0@@@%409%792$1@$2@@$0@@|@|@|@@%254%215%164%215%149%210%104%267%385$1@%385$2@$0@@@%385%792$1@$2@@$0@@|@|@|@@%254%215%164%215%149%210%104%267%397$1@%397$2@$0@@@%397%792$1@$2@@$0@@|@|@|@@%254%215%164%215%149%210%104%267%403$1@%403$2@$0@@@%403%792$1@$2@@$0@@|@|@|@@%254%215%164%215%149%210%104%267%387$1@%387$2@$0@@@%387%792$1@$2@@$0@@|@|@|@@%254%216%165%216%150%210%104%267%383$1@%383$2@$0@@@%383%793$1@$2@@$0@@|@|@|@@%254%216%165%216%150%210%104%267%393$1@%393$2@$0@@@%393%793$1@$2@@$0@@|@|@|@@%254%216%165%216%150%210%104%267%395$1@%395$2@$0@@@%395%793$1@$2@@$0@@|@|@|@@%254%216%165%216%150%210%104%267%399$1@%399$2@$0@@@%399%793$1@$2@@$0@@|@|@|@@%254%216%165%216%150%210%104%267%401$1@%401$2@$0@@@%401%793$1@$2@@$0@@|@|@|@@%216%165%216%150%210%104%267%405$1@%405$2@$0@@@%405%793$1@$2@@$0@@|@|@|@@@@@@@@@@@@@@"])
  fun op elf32_header_fupdfupds_comp x = x
    val op elf32_header_fupdfupds_comp =
    DT(((("elf_header",321),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_header",[284,285,286,318])]),["DISK_THM"]),
       [read"%254%254%221%166%221%153%275%795%389$0@@%389$1@@@%389%798$0@$1@@@|@|@@%212%167%221%166%221%153%273%794%389$0@@%794%389$1@@$2@@@%794%389%798$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%275%795%407$0@@%407$1@@@%407%793$0@$1@@@|@|@@%212%167%216%165%216%150%273%794%407$0@@%794%407$1@@$2@@@%794%407%793$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%275%795%391$0@@%391$1@@@%391%793$0@$1@@@|@|@@%212%167%216%165%216%150%273%794%391$0@@%794%391$1@@$2@@@%794%391%793$0@$1@@@$2@@|@|@|@@@%254%254%215%164%215%149%275%795%409$0@@%409$1@@@%409%792$0@$1@@@|@|@@%212%167%215%164%215%149%273%794%409$0@@%794%409$1@@$2@@@%794%409%792$0@$1@@@$2@@|@|@|@@@%254%254%215%164%215%149%275%795%385$0@@%385$1@@@%385%792$0@$1@@@|@|@@%212%167%215%164%215%149%273%794%385$0@@%794%385$1@@$2@@@%794%385%792$0@$1@@@$2@@|@|@|@@@%254%254%215%164%215%149%275%795%397$0@@%397$1@@@%397%792$0@$1@@@|@|@@%212%167%215%164%215%149%273%794%397$0@@%794%397$1@@$2@@@%794%397%792$0@$1@@@$2@@|@|@|@@@%254%254%215%164%215%149%275%795%403$0@@%403$1@@@%403%792$0@$1@@@|@|@@%212%167%215%164%215%149%273%794%403$0@@%794%403$1@@$2@@@%794%403%792$0@$1@@@$2@@|@|@|@@@%254%254%215%164%215%149%275%795%387$0@@%387$1@@@%387%792$0@$1@@@|@|@@%212%167%215%164%215%149%273%794%387$0@@%794%387$1@@$2@@@%794%387%792$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%275%795%383$0@@%383$1@@@%383%793$0@$1@@@|@|@@%212%167%216%165%216%150%273%794%383$0@@%794%383$1@@$2@@@%794%383%793$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%275%795%393$0@@%393$1@@@%393%793$0@$1@@@|@|@@%212%167%216%165%216%150%273%794%393$0@@%794%393$1@@$2@@@%794%393%793$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%275%795%395$0@@%395$1@@@%395%793$0@$1@@@|@|@@%212%167%216%165%216%150%273%794%395$0@@%794%395$1@@$2@@@%794%395%793$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%275%795%399$0@@%399$1@@@%399%793$0@$1@@@|@|@@%212%167%216%165%216%150%273%794%399$0@@%794%399$1@@$2@@@%794%399%793$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%275%795%401$0@@%401$1@@@%401%793$0@$1@@@|@|@@%212%167%216%165%216%150%273%794%401$0@@%794%401$1@@$2@@@%794%401%793$0@$1@@@$2@@|@|@|@@@%254%216%165%216%150%275%795%405$0@@%405$1@@@%405%793$0@$1@@@|@|@@%212%167%216%165%216%150%273%794%405$0@@%794%405$1@@$2@@@%794%405%793$0@$1@@@$2@@|@|@|@@@@@@@@@@@@@@@"])
  fun op elf32_header_fupdcanon x = x
    val op elf32_header_fupdcanon =
    DT(((("elf_header",322),
        [("bool",[25,26,56,181]),
         ("elf_header",[284,285,286,318])]),["DISK_THM"]),
       [read"%254%221%166%216%150%210%104%267%407$1@%389$2@$0@@@%389$2@%407$1@$0@@@|@|@|@@%254%221%166%216%150%210%104%267%391$1@%389$2@$0@@@%389$2@%391$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%391$1@%407$2@$0@@@%407$2@%391$1@$0@@@|@|@|@@%254%221%166%215%149%210%104%267%409$1@%389$2@$0@@@%389$2@%409$1@$0@@@|@|@|@@%254%216%165%215%149%210%104%267%409$1@%407$2@$0@@@%407$2@%409$1@$0@@@|@|@|@@%254%216%165%215%149%210%104%267%409$1@%391$2@$0@@@%391$2@%409$1@$0@@@|@|@|@@%254%221%166%215%149%210%104%267%385$1@%389$2@$0@@@%389$2@%385$1@$0@@@|@|@|@@%254%216%165%215%149%210%104%267%385$1@%407$2@$0@@@%407$2@%385$1@$0@@@|@|@|@@%254%216%165%215%149%210%104%267%385$1@%391$2@$0@@@%391$2@%385$1@$0@@@|@|@|@@%254%215%164%215%149%210%104%267%385$1@%409$2@$0@@@%409$2@%385$1@$0@@@|@|@|@@%254%221%166%215%149%210%104%267%397$1@%389$2@$0@@@%389$2@%397$1@$0@@@|@|@|@@%254%216%165%215%149%210%104%267%397$1@%407$2@$0@@@%407$2@%397$1@$0@@@|@|@|@@%254%216%165%215%149%210%104%267%397$1@%391$2@$0@@@%391$2@%397$1@$0@@@|@|@|@@%254%215%164%215%149%210%104%267%397$1@%409$2@$0@@@%409$2@%397$1@$0@@@|@|@|@@%254%215%164%215%149%210%104%267%397$1@%385$2@$0@@@%385$2@%397$1@$0@@@|@|@|@@%254%221%166%215%149%210%104%267%403$1@%389$2@$0@@@%389$2@%403$1@$0@@@|@|@|@@%254%216%165%215%149%210%104%267%403$1@%407$2@$0@@@%407$2@%403$1@$0@@@|@|@|@@%254%216%165%215%149%210%104%267%403$1@%391$2@$0@@@%391$2@%403$1@$0@@@|@|@|@@%254%215%164%215%149%210%104%267%403$1@%409$2@$0@@@%409$2@%403$1@$0@@@|@|@|@@%254%215%164%215%149%210%104%267%403$1@%385$2@$0@@@%385$2@%403$1@$0@@@|@|@|@@%254%215%164%215%149%210%104%267%403$1@%397$2@$0@@@%397$2@%403$1@$0@@@|@|@|@@%254%221%166%215%149%210%104%267%387$1@%389$2@$0@@@%389$2@%387$1@$0@@@|@|@|@@%254%216%165%215%149%210%104%267%387$1@%407$2@$0@@@%407$2@%387$1@$0@@@|@|@|@@%254%216%165%215%149%210%104%267%387$1@%391$2@$0@@@%391$2@%387$1@$0@@@|@|@|@@%254%215%164%215%149%210%104%267%387$1@%409$2@$0@@@%409$2@%387$1@$0@@@|@|@|@@%254%215%164%215%149%210%104%267%387$1@%385$2@$0@@@%385$2@%387$1@$0@@@|@|@|@@%254%215%164%215%149%210%104%267%387$1@%397$2@$0@@@%397$2@%387$1@$0@@@|@|@|@@%254%215%164%215%149%210%104%267%387$1@%403$2@$0@@@%403$2@%387$1@$0@@@|@|@|@@%254%221%166%216%150%210%104%267%383$1@%389$2@$0@@@%389$2@%383$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%383$1@%407$2@$0@@@%407$2@%383$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%383$1@%391$2@$0@@@%391$2@%383$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%383$1@%409$2@$0@@@%409$2@%383$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%383$1@%385$2@$0@@@%385$2@%383$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%383$1@%397$2@$0@@@%397$2@%383$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%383$1@%403$2@$0@@@%403$2@%383$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%383$1@%387$2@$0@@@%387$2@%383$1@$0@@@|@|@|@@%254%221%166%216%150%210%104%267%393$1@%389$2@$0@@@%389$2@%393$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%393$1@%407$2@$0@@@%407$2@%393$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%393$1@%391$2@$0@@@%391$2@%393$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%393$1@%409$2@$0@@@%409$2@%393$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%393$1@%385$2@$0@@@%385$2@%393$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%393$1@%397$2@$0@@@%397$2@%393$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%393$1@%403$2@$0@@@%403$2@%393$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%393$1@%387$2@$0@@@%387$2@%393$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%393$1@%383$2@$0@@@%383$2@%393$1@$0@@@|@|@|@@%254%221%166%216%150%210%104%267%395$1@%389$2@$0@@@%389$2@%395$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%395$1@%407$2@$0@@@%407$2@%395$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%395$1@%391$2@$0@@@%391$2@%395$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%395$1@%409$2@$0@@@%409$2@%395$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%395$1@%385$2@$0@@@%385$2@%395$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%395$1@%397$2@$0@@@%397$2@%395$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%395$1@%403$2@$0@@@%403$2@%395$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%395$1@%387$2@$0@@@%387$2@%395$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%395$1@%383$2@$0@@@%383$2@%395$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%395$1@%393$2@$0@@@%393$2@%395$1@$0@@@|@|@|@@%254%221%166%216%150%210%104%267%399$1@%389$2@$0@@@%389$2@%399$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%399$1@%407$2@$0@@@%407$2@%399$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%399$1@%391$2@$0@@@%391$2@%399$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%399$1@%409$2@$0@@@%409$2@%399$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%399$1@%385$2@$0@@@%385$2@%399$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%399$1@%397$2@$0@@@%397$2@%399$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%399$1@%403$2@$0@@@%403$2@%399$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%399$1@%387$2@$0@@@%387$2@%399$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%399$1@%383$2@$0@@@%383$2@%399$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%399$1@%393$2@$0@@@%393$2@%399$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%399$1@%395$2@$0@@@%395$2@%399$1@$0@@@|@|@|@@%254%221%166%216%150%210%104%267%401$1@%389$2@$0@@@%389$2@%401$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%401$1@%407$2@$0@@@%407$2@%401$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%401$1@%391$2@$0@@@%391$2@%401$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%401$1@%409$2@$0@@@%409$2@%401$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%401$1@%385$2@$0@@@%385$2@%401$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%401$1@%397$2@$0@@@%397$2@%401$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%401$1@%403$2@$0@@@%403$2@%401$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%401$1@%387$2@$0@@@%387$2@%401$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%401$1@%383$2@$0@@@%383$2@%401$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%401$1@%393$2@$0@@@%393$2@%401$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%401$1@%395$2@$0@@@%395$2@%401$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%401$1@%399$2@$0@@@%399$2@%401$1@$0@@@|@|@|@@%254%221%166%216%150%210%104%267%405$1@%389$2@$0@@@%389$2@%405$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%405$1@%407$2@$0@@@%407$2@%405$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%405$1@%391$2@$0@@@%391$2@%405$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%405$1@%409$2@$0@@@%409$2@%405$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%405$1@%385$2@$0@@@%385$2@%405$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%405$1@%397$2@$0@@@%397$2@%405$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%405$1@%403$2@$0@@@%403$2@%405$1@$0@@@|@|@|@@%254%215%164%216%150%210%104%267%405$1@%387$2@$0@@@%387$2@%405$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%405$1@%383$2@$0@@@%383$2@%405$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%405$1@%393$2@$0@@@%393$2@%405$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%405$1@%395$2@$0@@@%395$2@%405$1@$0@@@|@|@|@@%254%216%165%216%150%210%104%267%405$1@%399$2@$0@@@%399$2@%405$1@$0@@@|@|@|@@%216%165%216%150%210%104%267%405$1@%401$2@$0@@@%401$2@%405$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_header_fupdcanon_comp x = x
    val op elf32_header_fupdcanon_comp =
    DT(((("elf_header",323),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_header",[284,285,286,318])]),["DISK_THM"]),
       [read"%254%254%221%166%216%150%275%795%407$0@@%389$1@@@%795%389$1@@%407$0@@@|@|@@%212%167%221%166%216%150%273%794%407$0@@%794%389$1@@$2@@@%794%389$1@@%794%407$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%275%795%391$0@@%389$1@@@%795%389$1@@%391$0@@@|@|@@%212%167%221%166%216%150%273%794%391$0@@%794%389$1@@$2@@@%794%389$1@@%794%391$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%391$0@@%407$1@@@%795%407$1@@%391$0@@@|@|@@%212%167%216%165%216%150%273%794%391$0@@%794%407$1@@$2@@@%794%407$1@@%794%391$0@@$2@@@|@|@|@@@%254%254%221%166%215%149%275%795%409$0@@%389$1@@@%795%389$1@@%409$0@@@|@|@@%212%167%221%166%215%149%273%794%409$0@@%794%389$1@@$2@@@%794%389$1@@%794%409$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%275%795%409$0@@%407$1@@@%795%407$1@@%409$0@@@|@|@@%212%167%216%165%215%149%273%794%409$0@@%794%407$1@@$2@@@%794%407$1@@%794%409$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%275%795%409$0@@%391$1@@@%795%391$1@@%409$0@@@|@|@@%212%167%216%165%215%149%273%794%409$0@@%794%391$1@@$2@@@%794%391$1@@%794%409$0@@$2@@@|@|@|@@@%254%254%221%166%215%149%275%795%385$0@@%389$1@@@%795%389$1@@%385$0@@@|@|@@%212%167%221%166%215%149%273%794%385$0@@%794%389$1@@$2@@@%794%389$1@@%794%385$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%275%795%385$0@@%407$1@@@%795%407$1@@%385$0@@@|@|@@%212%167%216%165%215%149%273%794%385$0@@%794%407$1@@$2@@@%794%407$1@@%794%385$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%275%795%385$0@@%391$1@@@%795%391$1@@%385$0@@@|@|@@%212%167%216%165%215%149%273%794%385$0@@%794%391$1@@$2@@@%794%391$1@@%794%385$0@@$2@@@|@|@|@@@%254%254%215%164%215%149%275%795%385$0@@%409$1@@@%795%409$1@@%385$0@@@|@|@@%212%167%215%164%215%149%273%794%385$0@@%794%409$1@@$2@@@%794%409$1@@%794%385$0@@$2@@@|@|@|@@@%254%254%221%166%215%149%275%795%397$0@@%389$1@@@%795%389$1@@%397$0@@@|@|@@%212%167%221%166%215%149%273%794%397$0@@%794%389$1@@$2@@@%794%389$1@@%794%397$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%275%795%397$0@@%407$1@@@%795%407$1@@%397$0@@@|@|@@%212%167%216%165%215%149%273%794%397$0@@%794%407$1@@$2@@@%794%407$1@@%794%397$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%275%795%397$0@@%391$1@@@%795%391$1@@%397$0@@@|@|@@%212%167%216%165%215%149%273%794%397$0@@%794%391$1@@$2@@@%794%391$1@@%794%397$0@@$2@@@|@|@|@@@%254%254%215%164%215%149%275%795%397$0@@%409$1@@@%795%409$1@@%397$0@@@|@|@@%212%167%215%164%215%149%273%794%397$0@@%794%409$1@@$2@@@%794%409$1@@%794%397$0@@$2@@@|@|@|@@@%254%254%215%164%215%149%275%795%397$0@@%385$1@@@%795%385$1@@%397$0@@@|@|@@%212%167%215%164%215%149%273%794%397$0@@%794%385$1@@$2@@@%794%385$1@@%794%397$0@@$2@@@|@|@|@@@%254%254%221%166%215%149%275%795%403$0@@%389$1@@@%795%389$1@@%403$0@@@|@|@@%212%167%221%166%215%149%273%794%403$0@@%794%389$1@@$2@@@%794%389$1@@%794%403$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%275%795%403$0@@%407$1@@@%795%407$1@@%403$0@@@|@|@@%212%167%216%165%215%149%273%794%403$0@@%794%407$1@@$2@@@%794%407$1@@%794%403$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%275%795%403$0@@%391$1@@@%795%391$1@@%403$0@@@|@|@@%212%167%216%165%215%149%273%794%403$0@@%794%391$1@@$2@@@%794%391$1@@%794%403$0@@$2@@@|@|@|@@@%254%254%215%164%215%149%275%795%403$0@@%409$1@@@%795%409$1@@%403$0@@@|@|@@%212%167%215%164%215%149%273%794%403$0@@%794%409$1@@$2@@@%794%409$1@@%794%403$0@@$2@@@|@|@|@@@%254%254%215%164%215%149%275%795%403$0@@%385$1@@@%795%385$1@@%403$0@@@|@|@@%212%167%215%164%215%149%273%794%403$0@@%794%385$1@@$2@@@%794%385$1@@%794%403$0@@$2@@@|@|@|@@@%254%254%215%164%215%149%275%795%403$0@@%397$1@@@%795%397$1@@%403$0@@@|@|@@%212%167%215%164%215%149%273%794%403$0@@%794%397$1@@$2@@@%794%397$1@@%794%403$0@@$2@@@|@|@|@@@%254%254%221%166%215%149%275%795%387$0@@%389$1@@@%795%389$1@@%387$0@@@|@|@@%212%167%221%166%215%149%273%794%387$0@@%794%389$1@@$2@@@%794%389$1@@%794%387$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%275%795%387$0@@%407$1@@@%795%407$1@@%387$0@@@|@|@@%212%167%216%165%215%149%273%794%387$0@@%794%407$1@@$2@@@%794%407$1@@%794%387$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%275%795%387$0@@%391$1@@@%795%391$1@@%387$0@@@|@|@@%212%167%216%165%215%149%273%794%387$0@@%794%391$1@@$2@@@%794%391$1@@%794%387$0@@$2@@@|@|@|@@@%254%254%215%164%215%149%275%795%387$0@@%409$1@@@%795%409$1@@%387$0@@@|@|@@%212%167%215%164%215%149%273%794%387$0@@%794%409$1@@$2@@@%794%409$1@@%794%387$0@@$2@@@|@|@|@@@%254%254%215%164%215%149%275%795%387$0@@%385$1@@@%795%385$1@@%387$0@@@|@|@@%212%167%215%164%215%149%273%794%387$0@@%794%385$1@@$2@@@%794%385$1@@%794%387$0@@$2@@@|@|@|@@@%254%254%215%164%215%149%275%795%387$0@@%397$1@@@%795%397$1@@%387$0@@@|@|@@%212%167%215%164%215%149%273%794%387$0@@%794%397$1@@$2@@@%794%397$1@@%794%387$0@@$2@@@|@|@|@@@%254%254%215%164%215%149%275%795%387$0@@%403$1@@@%795%403$1@@%387$0@@@|@|@@%212%167%215%164%215%149%273%794%387$0@@%794%403$1@@$2@@@%794%403$1@@%794%387$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%275%795%383$0@@%389$1@@@%795%389$1@@%383$0@@@|@|@@%212%167%221%166%216%150%273%794%383$0@@%794%389$1@@$2@@@%794%389$1@@%794%383$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%383$0@@%407$1@@@%795%407$1@@%383$0@@@|@|@@%212%167%216%165%216%150%273%794%383$0@@%794%407$1@@$2@@@%794%407$1@@%794%383$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%383$0@@%391$1@@@%795%391$1@@%383$0@@@|@|@@%212%167%216%165%216%150%273%794%383$0@@%794%391$1@@$2@@@%794%391$1@@%794%383$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%383$0@@%409$1@@@%795%409$1@@%383$0@@@|@|@@%212%167%215%164%216%150%273%794%383$0@@%794%409$1@@$2@@@%794%409$1@@%794%383$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%383$0@@%385$1@@@%795%385$1@@%383$0@@@|@|@@%212%167%215%164%216%150%273%794%383$0@@%794%385$1@@$2@@@%794%385$1@@%794%383$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%383$0@@%397$1@@@%795%397$1@@%383$0@@@|@|@@%212%167%215%164%216%150%273%794%383$0@@%794%397$1@@$2@@@%794%397$1@@%794%383$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%383$0@@%403$1@@@%795%403$1@@%383$0@@@|@|@@%212%167%215%164%216%150%273%794%383$0@@%794%403$1@@$2@@@%794%403$1@@%794%383$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%383$0@@%387$1@@@%795%387$1@@%383$0@@@|@|@@%212%167%215%164%216%150%273%794%383$0@@%794%387$1@@$2@@@%794%387$1@@%794%383$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%275%795%393$0@@%389$1@@@%795%389$1@@%393$0@@@|@|@@%212%167%221%166%216%150%273%794%393$0@@%794%389$1@@$2@@@%794%389$1@@%794%393$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%393$0@@%407$1@@@%795%407$1@@%393$0@@@|@|@@%212%167%216%165%216%150%273%794%393$0@@%794%407$1@@$2@@@%794%407$1@@%794%393$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%393$0@@%391$1@@@%795%391$1@@%393$0@@@|@|@@%212%167%216%165%216%150%273%794%393$0@@%794%391$1@@$2@@@%794%391$1@@%794%393$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%393$0@@%409$1@@@%795%409$1@@%393$0@@@|@|@@%212%167%215%164%216%150%273%794%393$0@@%794%409$1@@$2@@@%794%409$1@@%794%393$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%393$0@@%385$1@@@%795%385$1@@%393$0@@@|@|@@%212%167%215%164%216%150%273%794%393$0@@%794%385$1@@$2@@@%794%385$1@@%794%393$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%393$0@@%397$1@@@%795%397$1@@%393$0@@@|@|@@%212%167%215%164%216%150%273%794%393$0@@%794%397$1@@$2@@@%794%397$1@@%794%393$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%393$0@@%403$1@@@%795%403$1@@%393$0@@@|@|@@%212%167%215%164%216%150%273%794%393$0@@%794%403$1@@$2@@@%794%403$1@@%794%393$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%393$0@@%387$1@@@%795%387$1@@%393$0@@@|@|@@%212%167%215%164%216%150%273%794%393$0@@%794%387$1@@$2@@@%794%387$1@@%794%393$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%393$0@@%383$1@@@%795%383$1@@%393$0@@@|@|@@%212%167%216%165%216%150%273%794%393$0@@%794%383$1@@$2@@@%794%383$1@@%794%393$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%275%795%395$0@@%389$1@@@%795%389$1@@%395$0@@@|@|@@%212%167%221%166%216%150%273%794%395$0@@%794%389$1@@$2@@@%794%389$1@@%794%395$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%395$0@@%407$1@@@%795%407$1@@%395$0@@@|@|@@%212%167%216%165%216%150%273%794%395$0@@%794%407$1@@$2@@@%794%407$1@@%794%395$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%395$0@@%391$1@@@%795%391$1@@%395$0@@@|@|@@%212%167%216%165%216%150%273%794%395$0@@%794%391$1@@$2@@@%794%391$1@@%794%395$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%395$0@@%409$1@@@%795%409$1@@%395$0@@@|@|@@%212%167%215%164%216%150%273%794%395$0@@%794%409$1@@$2@@@%794%409$1@@%794%395$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%395$0@@%385$1@@@%795%385$1@@%395$0@@@|@|@@%212%167%215%164%216%150%273%794%395$0@@%794%385$1@@$2@@@%794%385$1@@%794%395$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%395$0@@%397$1@@@%795%397$1@@%395$0@@@|@|@@%212%167%215%164%216%150%273%794%395$0@@%794%397$1@@$2@@@%794%397$1@@%794%395$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%395$0@@%403$1@@@%795%403$1@@%395$0@@@|@|@@%212%167%215%164%216%150%273%794%395$0@@%794%403$1@@$2@@@%794%403$1@@%794%395$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%395$0@@%387$1@@@%795%387$1@@%395$0@@@|@|@@%212%167%215%164%216%150%273%794%395$0@@%794%387$1@@$2@@@%794%387$1@@%794%395$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%395$0@@%383$1@@@%795%383$1@@%395$0@@@|@|@@%212%167%216%165%216%150%273%794%395$0@@%794%383$1@@$2@@@%794%383$1@@%794%395$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%395$0@@%393$1@@@%795%393$1@@%395$0@@@|@|@@%212%167%216%165%216%150%273%794%395$0@@%794%393$1@@$2@@@%794%393$1@@%794%395$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%275%795%399$0@@%389$1@@@%795%389$1@@%399$0@@@|@|@@%212%167%221%166%216%150%273%794%399$0@@%794%389$1@@$2@@@%794%389$1@@%794%399$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%399$0@@%407$1@@@%795%407$1@@%399$0@@@|@|@@%212%167%216%165%216%150%273%794%399$0@@%794%407$1@@$2@@@%794%407$1@@%794%399$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%399$0@@%391$1@@@%795%391$1@@%399$0@@@|@|@@%212%167%216%165%216%150%273%794%399$0@@%794%391$1@@$2@@@%794%391$1@@%794%399$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%399$0@@%409$1@@@%795%409$1@@%399$0@@@|@|@@%212%167%215%164%216%150%273%794%399$0@@%794%409$1@@$2@@@%794%409$1@@%794%399$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%399$0@@%385$1@@@%795%385$1@@%399$0@@@|@|@@%212%167%215%164%216%150%273%794%399$0@@%794%385$1@@$2@@@%794%385$1@@%794%399$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%399$0@@%397$1@@@%795%397$1@@%399$0@@@|@|@@%212%167%215%164%216%150%273%794%399$0@@%794%397$1@@$2@@@%794%397$1@@%794%399$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%399$0@@%403$1@@@%795%403$1@@%399$0@@@|@|@@%212%167%215%164%216%150%273%794%399$0@@%794%403$1@@$2@@@%794%403$1@@%794%399$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%399$0@@%387$1@@@%795%387$1@@%399$0@@@|@|@@%212%167%215%164%216%150%273%794%399$0@@%794%387$1@@$2@@@%794%387$1@@%794%399$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%399$0@@%383$1@@@%795%383$1@@%399$0@@@|@|@@%212%167%216%165%216%150%273%794%399$0@@%794%383$1@@$2@@@%794%383$1@@%794%399$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%399$0@@%393$1@@@%795%393$1@@%399$0@@@|@|@@%212%167%216%165%216%150%273%794%399$0@@%794%393$1@@$2@@@%794%393$1@@%794%399$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%399$0@@%395$1@@@%795%395$1@@%399$0@@@|@|@@%212%167%216%165%216%150%273%794%399$0@@%794%395$1@@$2@@@%794%395$1@@%794%399$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%275%795%401$0@@%389$1@@@%795%389$1@@%401$0@@@|@|@@%212%167%221%166%216%150%273%794%401$0@@%794%389$1@@$2@@@%794%389$1@@%794%401$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%401$0@@%407$1@@@%795%407$1@@%401$0@@@|@|@@%212%167%216%165%216%150%273%794%401$0@@%794%407$1@@$2@@@%794%407$1@@%794%401$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%401$0@@%391$1@@@%795%391$1@@%401$0@@@|@|@@%212%167%216%165%216%150%273%794%401$0@@%794%391$1@@$2@@@%794%391$1@@%794%401$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%401$0@@%409$1@@@%795%409$1@@%401$0@@@|@|@@%212%167%215%164%216%150%273%794%401$0@@%794%409$1@@$2@@@%794%409$1@@%794%401$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%401$0@@%385$1@@@%795%385$1@@%401$0@@@|@|@@%212%167%215%164%216%150%273%794%401$0@@%794%385$1@@$2@@@%794%385$1@@%794%401$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%401$0@@%397$1@@@%795%397$1@@%401$0@@@|@|@@%212%167%215%164%216%150%273%794%401$0@@%794%397$1@@$2@@@%794%397$1@@%794%401$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%401$0@@%403$1@@@%795%403$1@@%401$0@@@|@|@@%212%167%215%164%216%150%273%794%401$0@@%794%403$1@@$2@@@%794%403$1@@%794%401$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%401$0@@%387$1@@@%795%387$1@@%401$0@@@|@|@@%212%167%215%164%216%150%273%794%401$0@@%794%387$1@@$2@@@%794%387$1@@%794%401$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%401$0@@%383$1@@@%795%383$1@@%401$0@@@|@|@@%212%167%216%165%216%150%273%794%401$0@@%794%383$1@@$2@@@%794%383$1@@%794%401$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%401$0@@%393$1@@@%795%393$1@@%401$0@@@|@|@@%212%167%216%165%216%150%273%794%401$0@@%794%393$1@@$2@@@%794%393$1@@%794%401$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%401$0@@%395$1@@@%795%395$1@@%401$0@@@|@|@@%212%167%216%165%216%150%273%794%401$0@@%794%395$1@@$2@@@%794%395$1@@%794%401$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%401$0@@%399$1@@@%795%399$1@@%401$0@@@|@|@@%212%167%216%165%216%150%273%794%401$0@@%794%399$1@@$2@@@%794%399$1@@%794%401$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%275%795%405$0@@%389$1@@@%795%389$1@@%405$0@@@|@|@@%212%167%221%166%216%150%273%794%405$0@@%794%389$1@@$2@@@%794%389$1@@%794%405$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%405$0@@%407$1@@@%795%407$1@@%405$0@@@|@|@@%212%167%216%165%216%150%273%794%405$0@@%794%407$1@@$2@@@%794%407$1@@%794%405$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%405$0@@%391$1@@@%795%391$1@@%405$0@@@|@|@@%212%167%216%165%216%150%273%794%405$0@@%794%391$1@@$2@@@%794%391$1@@%794%405$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%405$0@@%409$1@@@%795%409$1@@%405$0@@@|@|@@%212%167%215%164%216%150%273%794%405$0@@%794%409$1@@$2@@@%794%409$1@@%794%405$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%405$0@@%385$1@@@%795%385$1@@%405$0@@@|@|@@%212%167%215%164%216%150%273%794%405$0@@%794%385$1@@$2@@@%794%385$1@@%794%405$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%405$0@@%397$1@@@%795%397$1@@%405$0@@@|@|@@%212%167%215%164%216%150%273%794%405$0@@%794%397$1@@$2@@@%794%397$1@@%794%405$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%405$0@@%403$1@@@%795%403$1@@%405$0@@@|@|@@%212%167%215%164%216%150%273%794%405$0@@%794%403$1@@$2@@@%794%403$1@@%794%405$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%275%795%405$0@@%387$1@@@%795%387$1@@%405$0@@@|@|@@%212%167%215%164%216%150%273%794%405$0@@%794%387$1@@$2@@@%794%387$1@@%794%405$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%405$0@@%383$1@@@%795%383$1@@%405$0@@@|@|@@%212%167%216%165%216%150%273%794%405$0@@%794%383$1@@$2@@@%794%383$1@@%794%405$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%405$0@@%393$1@@@%795%393$1@@%405$0@@@|@|@@%212%167%216%165%216%150%273%794%405$0@@%794%393$1@@$2@@@%794%393$1@@%794%405$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%405$0@@%395$1@@@%795%395$1@@%405$0@@@|@|@@%212%167%216%165%216%150%273%794%405$0@@%794%395$1@@$2@@@%794%395$1@@%794%405$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%275%795%405$0@@%399$1@@@%795%399$1@@%405$0@@@|@|@@%212%167%216%165%216%150%273%794%405$0@@%794%399$1@@$2@@@%794%399$1@@%794%405$0@@$2@@@|@|@|@@@%254%216%165%216%150%275%795%405$0@@%401$1@@@%795%401$1@@%405$0@@@|@|@@%212%167%216%165%216%150%273%794%405$0@@%794%401$1@@$2@@@%794%401$1@@%794%405$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_header_component_equality x = x
    val op elf32_header_component_equality =
    DT(((("elf_header",324),
        [("bool",[25,26,51,56,63,181]),("elf_header",[284,285,286,303]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%210%106%210%108%261%267$1@$0@@%254%277%388$1@@%388$0@@@%254%265%406$1@@%406$0@@@%254%265%390$1@@%390$0@@@%254%264%408$1@@%408$0@@@%254%264%384$1@@%384$0@@@%254%264%396$1@@%396$0@@@%254%264%402$1@@%402$0@@@%254%264%386$1@@%386$0@@@%254%265%382$1@@%382$0@@@%254%265%392$1@@%392$0@@@%254%265%394$1@@%394$0@@@%254%265%398$1@@%398$0@@@%254%265%400$1@@%400$0@@@%265%404$1@@%404$0@@@@@@@@@@@@@@@@|@|@"])
  fun op elf32_header_updates_eq_literal x = x
    val op elf32_header_updates_eq_literal =
    DT(((("elf_header",325),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_header",[284,285,286,318])]),["DISK_THM"]),
       [read"%210%104%225%177%209%55%209%52%208%98%208%92%208%85%208%78%208%74%209%71%209%66%209%61%209%51%209%47%209%45%267%389%328$13@@%407%323$12@@%391%323$11@@%409%322$10@@%385%322$9@@%397%322$8@@%403%322$7@@%387%322$6@@%383%323$5@@%393%323$4@@%395%323$3@@%399%323$2@@%401%323$1@@%405%323$0@@$14@@@@@@@@@@@@@@@%389%328$13@@%407%323$12@@%391%323$11@@%409%322$10@@%385%322$9@@%397%322$8@@%403%322$7@@%387%322$6@@%383%323$5@@%393%323$4@@%395%323$3@@%399%323$2@@%401%323$1@@%405%323$0@@%298@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_literal_nchotomy x = x
    val op elf32_header_literal_nchotomy =
    DT(((("elf_header",326),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_header",[284,285,286,318]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%210%104%295%177%288%55%288%52%287%98%287%92%287%85%287%78%287%74%288%71%288%66%288%61%288%51%288%47%288%45%267$14@%389%328$13@@%407%323$12@@%391%323$11@@%409%322$10@@%385%322$9@@%397%322$8@@%403%322$7@@%387%322$6@@%383%323$5@@%393%323$4@@%395%323$3@@%399%323$2@@%401%323$1@@%405%323$0@@%298@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf32_header x = x
    val op FORALL_elf32_header =
    DT(((("elf_header",327),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_header",[284,285,286,318]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%217%6%261%210%104$1$0@|@@%225%177%209%55%209%52%208%98%208%92%208%85%208%78%208%74%209%71%209%66%209%61%209%51%209%47%209%45$14%389%328$13@@%407%323$12@@%391%323$11@@%409%322$10@@%385%322$9@@%397%322$8@@%403%322$7@@%387%322$6@@%383%323$5@@%393%323$4@@%395%323$3@@%399%323$2@@%401%323$1@@%405%323$0@@%298@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf32_header x = x
    val op EXISTS_elf32_header =
    DT(((("elf_header",328),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_header",[284,285,286,318]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%217%6%261%289%104$1$0@|@@%295%177%288%55%288%52%287%98%287%92%287%85%287%78%287%74%288%71%288%66%288%61%288%51%288%47%288%45$14%389%328$13@@%407%323$12@@%391%323$11@@%409%322$10@@%385%322$9@@%397%322$8@@%403%322$7@@%387%322$6@@%383%323$5@@%393%323$4@@%395%323$3@@%399%323$2@@%401%323$1@@%405%323$0@@%298@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op elf32_header_literal_11 x = x
    val op elf32_header_literal_11 =
    DT(((("elf_header",329),
        [("combin",[12]),("elf_header",[319,324])]),["DISK_THM"]),
       [read"%225%178%209%56%209%53%208%100%208%95%208%88%208%81%208%75%209%72%209%67%209%62%209%55%209%48%209%51%225%179%209%57%209%54%208%101%208%97%208%90%208%83%208%76%209%73%209%68%209%63%209%58%209%49%209%61%261%267%389%328$27@@%407%323$26@@%391%323$25@@%409%322$24@@%385%322$23@@%397%322$22@@%403%322$21@@%387%322$20@@%383%323$19@@%393%323$18@@%395%323$17@@%399%323$16@@%401%323$15@@%405%323$14@@%298@@@@@@@@@@@@@@@%389%328$13@@%407%323$12@@%391%323$11@@%409%322$10@@%385%322$9@@%397%322$8@@%403%322$7@@%387%322$6@@%383%323$5@@%393%323$4@@%395%323$3@@%399%323$2@@%401%323$1@@%405%323$0@@%298@@@@@@@@@@@@@@@@%254%277$27@$13@@%254%265$26@$12@@%254%265$25@$11@@%254%264$24@$10@@%254%264$23@$9@@%254%264$22@$8@@%254%264$21@$7@@%254%264$20@$6@@%254%265$19@$5@@%254%265$18@$4@@%254%265$17@$3@@%254%265$16@$2@@%254%265$15@$1@@%265$14@$0@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf32_header x = x
    val op datatype_elf32_header =
    DT(((("elf_header",330),[("bool",[25,171])]),["DISK_THM"]),
       [read"%315%190%118@%119@%128@%120@%129@%116@%123@%126@%117@%115@%121@%122@%124@%125@%127@@"])
  fun op elf32_header_11 x = x
    val op elf32_header_11 =
    DT(((("elf_header",331),
        [("bool",[26,51,56,63,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%8%209%12%209%22%208%24%208%27%208%31%208%35%208%38%209%40%209%42%209%14%209%16%209%18%209%20%225%9%209%13%209%23%208%25%208%29%208%33%208%37%208%39%209%41%209%43%209%15%209%17%209%19%209%21%261%267%816$27@$26@$25@$24@$23@$22@$21@$20@$19@$18@$17@$16@$15@$14@@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%254%277$27@$13@@%254%265$26@$12@@%254%265$25@$11@@%254%264$24@$10@@%254%264$23@$9@@%254%264$22@$8@@%254%264$21@$7@@%254%264$20@$6@@%254%265$19@$5@@%254%265$18@$4@@%254%265$17@$3@@%254%265$16@$2@@%254%265$15@$1@@%265$14@$0@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_case_cong x = x
    val op elf32_header_case_cong =
    DT(((("elf_header",332),
        [("bool",[26,181]),
         ("elf_header",[284,285,286,287])]),["DISK_THM"]),
       [read"%210%2%210%4%220%152%283%254%267$2@$1@@%225%8%209%12%209%22%208%24%208%27%208%31%208%35%208%38%209%40%209%42%209%14%209%16%209%18%209%20%283%267$15@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%258$14$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%155$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@%258%380$2@$0@@%380$1@%155@@@|@|@|@"])
  fun op elf32_header_nchotomy x = x
    val op elf32_header_nchotomy =
    DT(((("elf_header",333),
        [("bool",[26,181]),("elf_header",[284,285,286])]),["DISK_THM"]),
       [read"%210%110%295%177%288%45%288%47%287%50%287%60%287%65%287%70%287%74%288%79%288%86%288%93%288%99%288%52%288%55%267$14@%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_Axiom x = x
    val op elf32_header_Axiom =
    DT(((("elf_header",334),
        [("bool",[26,181]),("elf_header",[284,285,286]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%220%152%291%161%225%8%209%12%209%22%208%24%208%27%208%31%208%35%208%38%209%40%209%42%209%14%209%16%209%18%209%20%258$14%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$15$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_induction x = x
    val op elf32_header_induction =
    DT(((("elf_header",335),
        [("bool",[26]),("elf_header",[284,285,286])]),["DISK_THM"]),
       [read"%217%6%283%225%177%209%45%209%47%208%50%208%60%208%65%208%70%208%74%209%79%209%86%209%93%209%99%209%52%209%55$14%816$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%210%104$1$0@|@@|@"])
  fun op elf64_header_accessors x = x
    val op elf64_header_accessors =
    DT(((("elf_header",356),
        [("elf_header",
         [342,343,344,345,346,347,348,349,350,351,352,353,354,
          355])]),["DISK_THM"]),
       [read"%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%277%419%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$13@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%437%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$12@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%421%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%439%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$10@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%263%415%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%263%427%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%263%433%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%264%417%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%413%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%423%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%425%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%429%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%431%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%265%435%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@@@"])
  fun op elf64_header_fn_updates x = x
    val op elf64_header_fn_updates =
    DT(((("elf_header",371),
        [("elf_header",
         [357,358,359,360,361,362,363,364,365,366,367,368,369,
          370])]),["DISK_THM"]),
       [read"%254%221%153%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%420$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$14$13@@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%438$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$14$12@@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%422$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$14$11@@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%215%149%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%440$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$14$10@@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%214%148%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%416$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$14$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%214%148%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%428$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$14$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%214%148%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%434$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$14$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%215%149%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%418$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$14$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%414$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$6@$14$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%424$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$14$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%426$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$14$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%430$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$14$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%254%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%432$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$14$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%216%150%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55%268%436$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$14$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@@@"])
  fun op elf64_header_accfupds x = x
    val op elf64_header_accfupds =
    DT(((("elf_header",372),
        [("bool",[25,26,56,181]),
         ("elf_header",[337,338,339,356,371])]),["DISK_THM"]),
       [read"%254%216%150%211%105%277%419%438$1@$0@@@%419$0@@|@|@@%254%216%150%211%105%277%419%422$1@$0@@@%419$0@@|@|@@%254%215%149%211%105%277%419%440$1@$0@@@%419$0@@|@|@@%254%214%148%211%105%277%419%416$1@$0@@@%419$0@@|@|@@%254%214%148%211%105%277%419%428$1@$0@@@%419$0@@|@|@@%254%214%148%211%105%277%419%434$1@$0@@@%419$0@@|@|@@%254%215%149%211%105%277%419%418$1@$0@@@%419$0@@|@|@@%254%216%150%211%105%277%419%414$1@$0@@@%419$0@@|@|@@%254%216%150%211%105%277%419%424$1@$0@@@%419$0@@|@|@@%254%216%150%211%105%277%419%426$1@$0@@@%419$0@@|@|@@%254%216%150%211%105%277%419%430$1@$0@@@%419$0@@|@|@@%254%216%150%211%105%277%419%432$1@$0@@@%419$0@@|@|@@%254%216%150%211%105%277%419%436$1@$0@@@%419$0@@|@|@@%254%221%153%211%105%265%437%420$1@$0@@@%437$0@@|@|@@%254%216%150%211%105%265%437%422$1@$0@@@%437$0@@|@|@@%254%215%149%211%105%265%437%440$1@$0@@@%437$0@@|@|@@%254%214%148%211%105%265%437%416$1@$0@@@%437$0@@|@|@@%254%214%148%211%105%265%437%428$1@$0@@@%437$0@@|@|@@%254%214%148%211%105%265%437%434$1@$0@@@%437$0@@|@|@@%254%215%149%211%105%265%437%418$1@$0@@@%437$0@@|@|@@%254%216%150%211%105%265%437%414$1@$0@@@%437$0@@|@|@@%254%216%150%211%105%265%437%424$1@$0@@@%437$0@@|@|@@%254%216%150%211%105%265%437%426$1@$0@@@%437$0@@|@|@@%254%216%150%211%105%265%437%430$1@$0@@@%437$0@@|@|@@%254%216%150%211%105%265%437%432$1@$0@@@%437$0@@|@|@@%254%216%150%211%105%265%437%436$1@$0@@@%437$0@@|@|@@%254%221%153%211%105%265%421%420$1@$0@@@%421$0@@|@|@@%254%216%150%211%105%265%421%438$1@$0@@@%421$0@@|@|@@%254%215%149%211%105%265%421%440$1@$0@@@%421$0@@|@|@@%254%214%148%211%105%265%421%416$1@$0@@@%421$0@@|@|@@%254%214%148%211%105%265%421%428$1@$0@@@%421$0@@|@|@@%254%214%148%211%105%265%421%434$1@$0@@@%421$0@@|@|@@%254%215%149%211%105%265%421%418$1@$0@@@%421$0@@|@|@@%254%216%150%211%105%265%421%414$1@$0@@@%421$0@@|@|@@%254%216%150%211%105%265%421%424$1@$0@@@%421$0@@|@|@@%254%216%150%211%105%265%421%426$1@$0@@@%421$0@@|@|@@%254%216%150%211%105%265%421%430$1@$0@@@%421$0@@|@|@@%254%216%150%211%105%265%421%432$1@$0@@@%421$0@@|@|@@%254%216%150%211%105%265%421%436$1@$0@@@%421$0@@|@|@@%254%221%153%211%105%264%439%420$1@$0@@@%439$0@@|@|@@%254%216%150%211%105%264%439%438$1@$0@@@%439$0@@|@|@@%254%216%150%211%105%264%439%422$1@$0@@@%439$0@@|@|@@%254%214%148%211%105%264%439%416$1@$0@@@%439$0@@|@|@@%254%214%148%211%105%264%439%428$1@$0@@@%439$0@@|@|@@%254%214%148%211%105%264%439%434$1@$0@@@%439$0@@|@|@@%254%215%149%211%105%264%439%418$1@$0@@@%439$0@@|@|@@%254%216%150%211%105%264%439%414$1@$0@@@%439$0@@|@|@@%254%216%150%211%105%264%439%424$1@$0@@@%439$0@@|@|@@%254%216%150%211%105%264%439%426$1@$0@@@%439$0@@|@|@@%254%216%150%211%105%264%439%430$1@$0@@@%439$0@@|@|@@%254%216%150%211%105%264%439%432$1@$0@@@%439$0@@|@|@@%254%216%150%211%105%264%439%436$1@$0@@@%439$0@@|@|@@%254%221%153%211%105%263%415%420$1@$0@@@%415$0@@|@|@@%254%216%150%211%105%263%415%438$1@$0@@@%415$0@@|@|@@%254%216%150%211%105%263%415%422$1@$0@@@%415$0@@|@|@@%254%215%149%211%105%263%415%440$1@$0@@@%415$0@@|@|@@%254%214%148%211%105%263%415%428$1@$0@@@%415$0@@|@|@@%254%214%148%211%105%263%415%434$1@$0@@@%415$0@@|@|@@%254%215%149%211%105%263%415%418$1@$0@@@%415$0@@|@|@@%254%216%150%211%105%263%415%414$1@$0@@@%415$0@@|@|@@%254%216%150%211%105%263%415%424$1@$0@@@%415$0@@|@|@@%254%216%150%211%105%263%415%426$1@$0@@@%415$0@@|@|@@%254%216%150%211%105%263%415%430$1@$0@@@%415$0@@|@|@@%254%216%150%211%105%263%415%432$1@$0@@@%415$0@@|@|@@%254%216%150%211%105%263%415%436$1@$0@@@%415$0@@|@|@@%254%221%153%211%105%263%427%420$1@$0@@@%427$0@@|@|@@%254%216%150%211%105%263%427%438$1@$0@@@%427$0@@|@|@@%254%216%150%211%105%263%427%422$1@$0@@@%427$0@@|@|@@%254%215%149%211%105%263%427%440$1@$0@@@%427$0@@|@|@@%254%214%148%211%105%263%427%416$1@$0@@@%427$0@@|@|@@%254%214%148%211%105%263%427%434$1@$0@@@%427$0@@|@|@@%254%215%149%211%105%263%427%418$1@$0@@@%427$0@@|@|@@%254%216%150%211%105%263%427%414$1@$0@@@%427$0@@|@|@@%254%216%150%211%105%263%427%424$1@$0@@@%427$0@@|@|@@%254%216%150%211%105%263%427%426$1@$0@@@%427$0@@|@|@@%254%216%150%211%105%263%427%430$1@$0@@@%427$0@@|@|@@%254%216%150%211%105%263%427%432$1@$0@@@%427$0@@|@|@@%254%216%150%211%105%263%427%436$1@$0@@@%427$0@@|@|@@%254%221%153%211%105%263%433%420$1@$0@@@%433$0@@|@|@@%254%216%150%211%105%263%433%438$1@$0@@@%433$0@@|@|@@%254%216%150%211%105%263%433%422$1@$0@@@%433$0@@|@|@@%254%215%149%211%105%263%433%440$1@$0@@@%433$0@@|@|@@%254%214%148%211%105%263%433%416$1@$0@@@%433$0@@|@|@@%254%214%148%211%105%263%433%428$1@$0@@@%433$0@@|@|@@%254%215%149%211%105%263%433%418$1@$0@@@%433$0@@|@|@@%254%216%150%211%105%263%433%414$1@$0@@@%433$0@@|@|@@%254%216%150%211%105%263%433%424$1@$0@@@%433$0@@|@|@@%254%216%150%211%105%263%433%426$1@$0@@@%433$0@@|@|@@%254%216%150%211%105%263%433%430$1@$0@@@%433$0@@|@|@@%254%216%150%211%105%263%433%432$1@$0@@@%433$0@@|@|@@%254%216%150%211%105%263%433%436$1@$0@@@%433$0@@|@|@@%254%221%153%211%105%264%417%420$1@$0@@@%417$0@@|@|@@%254%216%150%211%105%264%417%438$1@$0@@@%417$0@@|@|@@%254%216%150%211%105%264%417%422$1@$0@@@%417$0@@|@|@@%254%215%149%211%105%264%417%440$1@$0@@@%417$0@@|@|@@%254%214%148%211%105%264%417%416$1@$0@@@%417$0@@|@|@@%254%214%148%211%105%264%417%428$1@$0@@@%417$0@@|@|@@%254%214%148%211%105%264%417%434$1@$0@@@%417$0@@|@|@@%254%216%150%211%105%264%417%414$1@$0@@@%417$0@@|@|@@%254%216%150%211%105%264%417%424$1@$0@@@%417$0@@|@|@@%254%216%150%211%105%264%417%426$1@$0@@@%417$0@@|@|@@%254%216%150%211%105%264%417%430$1@$0@@@%417$0@@|@|@@%254%216%150%211%105%264%417%432$1@$0@@@%417$0@@|@|@@%254%216%150%211%105%264%417%436$1@$0@@@%417$0@@|@|@@%254%221%153%211%105%265%413%420$1@$0@@@%413$0@@|@|@@%254%216%150%211%105%265%413%438$1@$0@@@%413$0@@|@|@@%254%216%150%211%105%265%413%422$1@$0@@@%413$0@@|@|@@%254%215%149%211%105%265%413%440$1@$0@@@%413$0@@|@|@@%254%214%148%211%105%265%413%416$1@$0@@@%413$0@@|@|@@%254%214%148%211%105%265%413%428$1@$0@@@%413$0@@|@|@@%254%214%148%211%105%265%413%434$1@$0@@@%413$0@@|@|@@%254%215%149%211%105%265%413%418$1@$0@@@%413$0@@|@|@@%254%216%150%211%105%265%413%424$1@$0@@@%413$0@@|@|@@%254%216%150%211%105%265%413%426$1@$0@@@%413$0@@|@|@@%254%216%150%211%105%265%413%430$1@$0@@@%413$0@@|@|@@%254%216%150%211%105%265%413%432$1@$0@@@%413$0@@|@|@@%254%216%150%211%105%265%413%436$1@$0@@@%413$0@@|@|@@%254%221%153%211%105%265%423%420$1@$0@@@%423$0@@|@|@@%254%216%150%211%105%265%423%438$1@$0@@@%423$0@@|@|@@%254%216%150%211%105%265%423%422$1@$0@@@%423$0@@|@|@@%254%215%149%211%105%265%423%440$1@$0@@@%423$0@@|@|@@%254%214%148%211%105%265%423%416$1@$0@@@%423$0@@|@|@@%254%214%148%211%105%265%423%428$1@$0@@@%423$0@@|@|@@%254%214%148%211%105%265%423%434$1@$0@@@%423$0@@|@|@@%254%215%149%211%105%265%423%418$1@$0@@@%423$0@@|@|@@%254%216%150%211%105%265%423%414$1@$0@@@%423$0@@|@|@@%254%216%150%211%105%265%423%426$1@$0@@@%423$0@@|@|@@%254%216%150%211%105%265%423%430$1@$0@@@%423$0@@|@|@@%254%216%150%211%105%265%423%432$1@$0@@@%423$0@@|@|@@%254%216%150%211%105%265%423%436$1@$0@@@%423$0@@|@|@@%254%221%153%211%105%265%425%420$1@$0@@@%425$0@@|@|@@%254%216%150%211%105%265%425%438$1@$0@@@%425$0@@|@|@@%254%216%150%211%105%265%425%422$1@$0@@@%425$0@@|@|@@%254%215%149%211%105%265%425%440$1@$0@@@%425$0@@|@|@@%254%214%148%211%105%265%425%416$1@$0@@@%425$0@@|@|@@%254%214%148%211%105%265%425%428$1@$0@@@%425$0@@|@|@@%254%214%148%211%105%265%425%434$1@$0@@@%425$0@@|@|@@%254%215%149%211%105%265%425%418$1@$0@@@%425$0@@|@|@@%254%216%150%211%105%265%425%414$1@$0@@@%425$0@@|@|@@%254%216%150%211%105%265%425%424$1@$0@@@%425$0@@|@|@@%254%216%150%211%105%265%425%430$1@$0@@@%425$0@@|@|@@%254%216%150%211%105%265%425%432$1@$0@@@%425$0@@|@|@@%254%216%150%211%105%265%425%436$1@$0@@@%425$0@@|@|@@%254%221%153%211%105%265%429%420$1@$0@@@%429$0@@|@|@@%254%216%150%211%105%265%429%438$1@$0@@@%429$0@@|@|@@%254%216%150%211%105%265%429%422$1@$0@@@%429$0@@|@|@@%254%215%149%211%105%265%429%440$1@$0@@@%429$0@@|@|@@%254%214%148%211%105%265%429%416$1@$0@@@%429$0@@|@|@@%254%214%148%211%105%265%429%428$1@$0@@@%429$0@@|@|@@%254%214%148%211%105%265%429%434$1@$0@@@%429$0@@|@|@@%254%215%149%211%105%265%429%418$1@$0@@@%429$0@@|@|@@%254%216%150%211%105%265%429%414$1@$0@@@%429$0@@|@|@@%254%216%150%211%105%265%429%424$1@$0@@@%429$0@@|@|@@%254%216%150%211%105%265%429%426$1@$0@@@%429$0@@|@|@@%254%216%150%211%105%265%429%432$1@$0@@@%429$0@@|@|@@%254%216%150%211%105%265%429%436$1@$0@@@%429$0@@|@|@@%254%221%153%211%105%265%431%420$1@$0@@@%431$0@@|@|@@%254%216%150%211%105%265%431%438$1@$0@@@%431$0@@|@|@@%254%216%150%211%105%265%431%422$1@$0@@@%431$0@@|@|@@%254%215%149%211%105%265%431%440$1@$0@@@%431$0@@|@|@@%254%214%148%211%105%265%431%416$1@$0@@@%431$0@@|@|@@%254%214%148%211%105%265%431%428$1@$0@@@%431$0@@|@|@@%254%214%148%211%105%265%431%434$1@$0@@@%431$0@@|@|@@%254%215%149%211%105%265%431%418$1@$0@@@%431$0@@|@|@@%254%216%150%211%105%265%431%414$1@$0@@@%431$0@@|@|@@%254%216%150%211%105%265%431%424$1@$0@@@%431$0@@|@|@@%254%216%150%211%105%265%431%426$1@$0@@@%431$0@@|@|@@%254%216%150%211%105%265%431%430$1@$0@@@%431$0@@|@|@@%254%216%150%211%105%265%431%436$1@$0@@@%431$0@@|@|@@%254%221%153%211%105%265%435%420$1@$0@@@%435$0@@|@|@@%254%216%150%211%105%265%435%438$1@$0@@@%435$0@@|@|@@%254%216%150%211%105%265%435%422$1@$0@@@%435$0@@|@|@@%254%215%149%211%105%265%435%440$1@$0@@@%435$0@@|@|@@%254%214%148%211%105%265%435%416$1@$0@@@%435$0@@|@|@@%254%214%148%211%105%265%435%428$1@$0@@@%435$0@@|@|@@%254%214%148%211%105%265%435%434$1@$0@@@%435$0@@|@|@@%254%215%149%211%105%265%435%418$1@$0@@@%435$0@@|@|@@%254%216%150%211%105%265%435%414$1@$0@@@%435$0@@|@|@@%254%216%150%211%105%265%435%424$1@$0@@@%435$0@@|@|@@%254%216%150%211%105%265%435%426$1@$0@@@%435$0@@|@|@@%254%216%150%211%105%265%435%430$1@$0@@@%435$0@@|@|@@%254%216%150%211%105%265%435%432$1@$0@@@%435$0@@|@|@@%254%221%153%211%105%277%419%420$1@$0@@@$1%419$0@@@|@|@@%254%216%150%211%105%265%437%438$1@$0@@@$1%437$0@@@|@|@@%254%216%150%211%105%265%421%422$1@$0@@@$1%421$0@@@|@|@@%254%215%149%211%105%264%439%440$1@$0@@@$1%439$0@@@|@|@@%254%214%148%211%105%263%415%416$1@$0@@@$1%415$0@@@|@|@@%254%214%148%211%105%263%427%428$1@$0@@@$1%427$0@@@|@|@@%254%214%148%211%105%263%433%434$1@$0@@@$1%433$0@@@|@|@@%254%215%149%211%105%264%417%418$1@$0@@@$1%417$0@@@|@|@@%254%216%150%211%105%265%413%414$1@$0@@@$1%413$0@@@|@|@@%254%216%150%211%105%265%423%424$1@$0@@@$1%423$0@@@|@|@@%254%216%150%211%105%265%425%426$1@$0@@@$1%425$0@@@|@|@@%254%216%150%211%105%265%429%430$1@$0@@@$1%429$0@@@|@|@@%254%216%150%211%105%265%431%432$1@$0@@@$1%431$0@@@|@|@@%216%150%211%105%265%435%436$1@$0@@@$1%435$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_header_fupdfupds x = x
    val op elf64_header_fupdfupds =
    DT(((("elf_header",373),
        [("bool",[25,26,56,181]),("combin",[8]),
         ("elf_header",[337,338,339,371])]),["DISK_THM"]),
       [read"%254%221%166%221%153%211%105%268%420$1@%420$2@$0@@@%420%798$1@$2@@$0@@|@|@|@@%254%216%165%216%150%211%105%268%438$1@%438$2@$0@@@%438%793$1@$2@@$0@@|@|@|@@%254%216%165%216%150%211%105%268%422$1@%422$2@$0@@@%422%793$1@$2@@$0@@|@|@|@@%254%215%164%215%149%211%105%268%440$1@%440$2@$0@@@%440%792$1@$2@@$0@@|@|@|@@%254%214%163%214%148%211%105%268%416$1@%416$2@$0@@@%416%791$1@$2@@$0@@|@|@|@@%254%214%163%214%148%211%105%268%428$1@%428$2@$0@@@%428%791$1@$2@@$0@@|@|@|@@%254%214%163%214%148%211%105%268%434$1@%434$2@$0@@@%434%791$1@$2@@$0@@|@|@|@@%254%215%164%215%149%211%105%268%418$1@%418$2@$0@@@%418%792$1@$2@@$0@@|@|@|@@%254%216%165%216%150%211%105%268%414$1@%414$2@$0@@@%414%793$1@$2@@$0@@|@|@|@@%254%216%165%216%150%211%105%268%424$1@%424$2@$0@@@%424%793$1@$2@@$0@@|@|@|@@%254%216%165%216%150%211%105%268%426$1@%426$2@$0@@@%426%793$1@$2@@$0@@|@|@|@@%254%216%165%216%150%211%105%268%430$1@%430$2@$0@@@%430%793$1@$2@@$0@@|@|@|@@%254%216%165%216%150%211%105%268%432$1@%432$2@$0@@@%432%793$1@$2@@$0@@|@|@|@@%216%165%216%150%211%105%268%436$1@%436$2@$0@@@%436%793$1@$2@@$0@@|@|@|@@@@@@@@@@@@@@"])
  fun op elf64_header_fupdfupds_comp x = x
    val op elf64_header_fupdfupds_comp =
    DT(((("elf_header",374),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_header",[337,338,339,371])]),["DISK_THM"]),
       [read"%254%254%221%166%221%153%276%797%420$0@@%420$1@@@%420%798$0@$1@@@|@|@@%213%168%221%166%221%153%274%796%420$0@@%796%420$1@@$2@@@%796%420%798$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%276%797%438$0@@%438$1@@@%438%793$0@$1@@@|@|@@%213%168%216%165%216%150%274%796%438$0@@%796%438$1@@$2@@@%796%438%793$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%276%797%422$0@@%422$1@@@%422%793$0@$1@@@|@|@@%213%168%216%165%216%150%274%796%422$0@@%796%422$1@@$2@@@%796%422%793$0@$1@@@$2@@|@|@|@@@%254%254%215%164%215%149%276%797%440$0@@%440$1@@@%440%792$0@$1@@@|@|@@%213%168%215%164%215%149%274%796%440$0@@%796%440$1@@$2@@@%796%440%792$0@$1@@@$2@@|@|@|@@@%254%254%214%163%214%148%276%797%416$0@@%416$1@@@%416%791$0@$1@@@|@|@@%213%168%214%163%214%148%274%796%416$0@@%796%416$1@@$2@@@%796%416%791$0@$1@@@$2@@|@|@|@@@%254%254%214%163%214%148%276%797%428$0@@%428$1@@@%428%791$0@$1@@@|@|@@%213%168%214%163%214%148%274%796%428$0@@%796%428$1@@$2@@@%796%428%791$0@$1@@@$2@@|@|@|@@@%254%254%214%163%214%148%276%797%434$0@@%434$1@@@%434%791$0@$1@@@|@|@@%213%168%214%163%214%148%274%796%434$0@@%796%434$1@@$2@@@%796%434%791$0@$1@@@$2@@|@|@|@@@%254%254%215%164%215%149%276%797%418$0@@%418$1@@@%418%792$0@$1@@@|@|@@%213%168%215%164%215%149%274%796%418$0@@%796%418$1@@$2@@@%796%418%792$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%276%797%414$0@@%414$1@@@%414%793$0@$1@@@|@|@@%213%168%216%165%216%150%274%796%414$0@@%796%414$1@@$2@@@%796%414%793$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%276%797%424$0@@%424$1@@@%424%793$0@$1@@@|@|@@%213%168%216%165%216%150%274%796%424$0@@%796%424$1@@$2@@@%796%424%793$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%276%797%426$0@@%426$1@@@%426%793$0@$1@@@|@|@@%213%168%216%165%216%150%274%796%426$0@@%796%426$1@@$2@@@%796%426%793$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%276%797%430$0@@%430$1@@@%430%793$0@$1@@@|@|@@%213%168%216%165%216%150%274%796%430$0@@%796%430$1@@$2@@@%796%430%793$0@$1@@@$2@@|@|@|@@@%254%254%216%165%216%150%276%797%432$0@@%432$1@@@%432%793$0@$1@@@|@|@@%213%168%216%165%216%150%274%796%432$0@@%796%432$1@@$2@@@%796%432%793$0@$1@@@$2@@|@|@|@@@%254%216%165%216%150%276%797%436$0@@%436$1@@@%436%793$0@$1@@@|@|@@%213%168%216%165%216%150%274%796%436$0@@%796%436$1@@$2@@@%796%436%793$0@$1@@@$2@@|@|@|@@@@@@@@@@@@@@@"])
  fun op elf64_header_fupdcanon x = x
    val op elf64_header_fupdcanon =
    DT(((("elf_header",375),
        [("bool",[25,26,56,181]),
         ("elf_header",[337,338,339,371])]),["DISK_THM"]),
       [read"%254%221%166%216%150%211%105%268%438$1@%420$2@$0@@@%420$2@%438$1@$0@@@|@|@|@@%254%221%166%216%150%211%105%268%422$1@%420$2@$0@@@%420$2@%422$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%422$1@%438$2@$0@@@%438$2@%422$1@$0@@@|@|@|@@%254%221%166%215%149%211%105%268%440$1@%420$2@$0@@@%420$2@%440$1@$0@@@|@|@|@@%254%216%165%215%149%211%105%268%440$1@%438$2@$0@@@%438$2@%440$1@$0@@@|@|@|@@%254%216%165%215%149%211%105%268%440$1@%422$2@$0@@@%422$2@%440$1@$0@@@|@|@|@@%254%221%166%214%148%211%105%268%416$1@%420$2@$0@@@%420$2@%416$1@$0@@@|@|@|@@%254%216%165%214%148%211%105%268%416$1@%438$2@$0@@@%438$2@%416$1@$0@@@|@|@|@@%254%216%165%214%148%211%105%268%416$1@%422$2@$0@@@%422$2@%416$1@$0@@@|@|@|@@%254%215%164%214%148%211%105%268%416$1@%440$2@$0@@@%440$2@%416$1@$0@@@|@|@|@@%254%221%166%214%148%211%105%268%428$1@%420$2@$0@@@%420$2@%428$1@$0@@@|@|@|@@%254%216%165%214%148%211%105%268%428$1@%438$2@$0@@@%438$2@%428$1@$0@@@|@|@|@@%254%216%165%214%148%211%105%268%428$1@%422$2@$0@@@%422$2@%428$1@$0@@@|@|@|@@%254%215%164%214%148%211%105%268%428$1@%440$2@$0@@@%440$2@%428$1@$0@@@|@|@|@@%254%214%163%214%148%211%105%268%428$1@%416$2@$0@@@%416$2@%428$1@$0@@@|@|@|@@%254%221%166%214%148%211%105%268%434$1@%420$2@$0@@@%420$2@%434$1@$0@@@|@|@|@@%254%216%165%214%148%211%105%268%434$1@%438$2@$0@@@%438$2@%434$1@$0@@@|@|@|@@%254%216%165%214%148%211%105%268%434$1@%422$2@$0@@@%422$2@%434$1@$0@@@|@|@|@@%254%215%164%214%148%211%105%268%434$1@%440$2@$0@@@%440$2@%434$1@$0@@@|@|@|@@%254%214%163%214%148%211%105%268%434$1@%416$2@$0@@@%416$2@%434$1@$0@@@|@|@|@@%254%214%163%214%148%211%105%268%434$1@%428$2@$0@@@%428$2@%434$1@$0@@@|@|@|@@%254%221%166%215%149%211%105%268%418$1@%420$2@$0@@@%420$2@%418$1@$0@@@|@|@|@@%254%216%165%215%149%211%105%268%418$1@%438$2@$0@@@%438$2@%418$1@$0@@@|@|@|@@%254%216%165%215%149%211%105%268%418$1@%422$2@$0@@@%422$2@%418$1@$0@@@|@|@|@@%254%215%164%215%149%211%105%268%418$1@%440$2@$0@@@%440$2@%418$1@$0@@@|@|@|@@%254%214%163%215%149%211%105%268%418$1@%416$2@$0@@@%416$2@%418$1@$0@@@|@|@|@@%254%214%163%215%149%211%105%268%418$1@%428$2@$0@@@%428$2@%418$1@$0@@@|@|@|@@%254%214%163%215%149%211%105%268%418$1@%434$2@$0@@@%434$2@%418$1@$0@@@|@|@|@@%254%221%166%216%150%211%105%268%414$1@%420$2@$0@@@%420$2@%414$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%414$1@%438$2@$0@@@%438$2@%414$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%414$1@%422$2@$0@@@%422$2@%414$1@$0@@@|@|@|@@%254%215%164%216%150%211%105%268%414$1@%440$2@$0@@@%440$2@%414$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%414$1@%416$2@$0@@@%416$2@%414$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%414$1@%428$2@$0@@@%428$2@%414$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%414$1@%434$2@$0@@@%434$2@%414$1@$0@@@|@|@|@@%254%215%164%216%150%211%105%268%414$1@%418$2@$0@@@%418$2@%414$1@$0@@@|@|@|@@%254%221%166%216%150%211%105%268%424$1@%420$2@$0@@@%420$2@%424$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%424$1@%438$2@$0@@@%438$2@%424$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%424$1@%422$2@$0@@@%422$2@%424$1@$0@@@|@|@|@@%254%215%164%216%150%211%105%268%424$1@%440$2@$0@@@%440$2@%424$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%424$1@%416$2@$0@@@%416$2@%424$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%424$1@%428$2@$0@@@%428$2@%424$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%424$1@%434$2@$0@@@%434$2@%424$1@$0@@@|@|@|@@%254%215%164%216%150%211%105%268%424$1@%418$2@$0@@@%418$2@%424$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%424$1@%414$2@$0@@@%414$2@%424$1@$0@@@|@|@|@@%254%221%166%216%150%211%105%268%426$1@%420$2@$0@@@%420$2@%426$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%426$1@%438$2@$0@@@%438$2@%426$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%426$1@%422$2@$0@@@%422$2@%426$1@$0@@@|@|@|@@%254%215%164%216%150%211%105%268%426$1@%440$2@$0@@@%440$2@%426$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%426$1@%416$2@$0@@@%416$2@%426$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%426$1@%428$2@$0@@@%428$2@%426$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%426$1@%434$2@$0@@@%434$2@%426$1@$0@@@|@|@|@@%254%215%164%216%150%211%105%268%426$1@%418$2@$0@@@%418$2@%426$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%426$1@%414$2@$0@@@%414$2@%426$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%426$1@%424$2@$0@@@%424$2@%426$1@$0@@@|@|@|@@%254%221%166%216%150%211%105%268%430$1@%420$2@$0@@@%420$2@%430$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%430$1@%438$2@$0@@@%438$2@%430$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%430$1@%422$2@$0@@@%422$2@%430$1@$0@@@|@|@|@@%254%215%164%216%150%211%105%268%430$1@%440$2@$0@@@%440$2@%430$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%430$1@%416$2@$0@@@%416$2@%430$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%430$1@%428$2@$0@@@%428$2@%430$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%430$1@%434$2@$0@@@%434$2@%430$1@$0@@@|@|@|@@%254%215%164%216%150%211%105%268%430$1@%418$2@$0@@@%418$2@%430$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%430$1@%414$2@$0@@@%414$2@%430$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%430$1@%424$2@$0@@@%424$2@%430$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%430$1@%426$2@$0@@@%426$2@%430$1@$0@@@|@|@|@@%254%221%166%216%150%211%105%268%432$1@%420$2@$0@@@%420$2@%432$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%432$1@%438$2@$0@@@%438$2@%432$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%432$1@%422$2@$0@@@%422$2@%432$1@$0@@@|@|@|@@%254%215%164%216%150%211%105%268%432$1@%440$2@$0@@@%440$2@%432$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%432$1@%416$2@$0@@@%416$2@%432$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%432$1@%428$2@$0@@@%428$2@%432$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%432$1@%434$2@$0@@@%434$2@%432$1@$0@@@|@|@|@@%254%215%164%216%150%211%105%268%432$1@%418$2@$0@@@%418$2@%432$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%432$1@%414$2@$0@@@%414$2@%432$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%432$1@%424$2@$0@@@%424$2@%432$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%432$1@%426$2@$0@@@%426$2@%432$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%432$1@%430$2@$0@@@%430$2@%432$1@$0@@@|@|@|@@%254%221%166%216%150%211%105%268%436$1@%420$2@$0@@@%420$2@%436$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%436$1@%438$2@$0@@@%438$2@%436$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%436$1@%422$2@$0@@@%422$2@%436$1@$0@@@|@|@|@@%254%215%164%216%150%211%105%268%436$1@%440$2@$0@@@%440$2@%436$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%436$1@%416$2@$0@@@%416$2@%436$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%436$1@%428$2@$0@@@%428$2@%436$1@$0@@@|@|@|@@%254%214%163%216%150%211%105%268%436$1@%434$2@$0@@@%434$2@%436$1@$0@@@|@|@|@@%254%215%164%216%150%211%105%268%436$1@%418$2@$0@@@%418$2@%436$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%436$1@%414$2@$0@@@%414$2@%436$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%436$1@%424$2@$0@@@%424$2@%436$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%436$1@%426$2@$0@@@%426$2@%436$1@$0@@@|@|@|@@%254%216%165%216%150%211%105%268%436$1@%430$2@$0@@@%430$2@%436$1@$0@@@|@|@|@@%216%165%216%150%211%105%268%436$1@%432$2@$0@@@%432$2@%436$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_header_fupdcanon_comp x = x
    val op elf64_header_fupdcanon_comp =
    DT(((("elf_header",376),
        [("bool",[14,25,26,56,58,181]),("combin",[8,9]),
         ("elf_header",[337,338,339,371])]),["DISK_THM"]),
       [read"%254%254%221%166%216%150%276%797%438$0@@%420$1@@@%797%420$1@@%438$0@@@|@|@@%213%168%221%166%216%150%274%796%438$0@@%796%420$1@@$2@@@%796%420$1@@%796%438$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%276%797%422$0@@%420$1@@@%797%420$1@@%422$0@@@|@|@@%213%168%221%166%216%150%274%796%422$0@@%796%420$1@@$2@@@%796%420$1@@%796%422$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%422$0@@%438$1@@@%797%438$1@@%422$0@@@|@|@@%213%168%216%165%216%150%274%796%422$0@@%796%438$1@@$2@@@%796%438$1@@%796%422$0@@$2@@@|@|@|@@@%254%254%221%166%215%149%276%797%440$0@@%420$1@@@%797%420$1@@%440$0@@@|@|@@%213%168%221%166%215%149%274%796%440$0@@%796%420$1@@$2@@@%796%420$1@@%796%440$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%276%797%440$0@@%438$1@@@%797%438$1@@%440$0@@@|@|@@%213%168%216%165%215%149%274%796%440$0@@%796%438$1@@$2@@@%796%438$1@@%796%440$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%276%797%440$0@@%422$1@@@%797%422$1@@%440$0@@@|@|@@%213%168%216%165%215%149%274%796%440$0@@%796%422$1@@$2@@@%796%422$1@@%796%440$0@@$2@@@|@|@|@@@%254%254%221%166%214%148%276%797%416$0@@%420$1@@@%797%420$1@@%416$0@@@|@|@@%213%168%221%166%214%148%274%796%416$0@@%796%420$1@@$2@@@%796%420$1@@%796%416$0@@$2@@@|@|@|@@@%254%254%216%165%214%148%276%797%416$0@@%438$1@@@%797%438$1@@%416$0@@@|@|@@%213%168%216%165%214%148%274%796%416$0@@%796%438$1@@$2@@@%796%438$1@@%796%416$0@@$2@@@|@|@|@@@%254%254%216%165%214%148%276%797%416$0@@%422$1@@@%797%422$1@@%416$0@@@|@|@@%213%168%216%165%214%148%274%796%416$0@@%796%422$1@@$2@@@%796%422$1@@%796%416$0@@$2@@@|@|@|@@@%254%254%215%164%214%148%276%797%416$0@@%440$1@@@%797%440$1@@%416$0@@@|@|@@%213%168%215%164%214%148%274%796%416$0@@%796%440$1@@$2@@@%796%440$1@@%796%416$0@@$2@@@|@|@|@@@%254%254%221%166%214%148%276%797%428$0@@%420$1@@@%797%420$1@@%428$0@@@|@|@@%213%168%221%166%214%148%274%796%428$0@@%796%420$1@@$2@@@%796%420$1@@%796%428$0@@$2@@@|@|@|@@@%254%254%216%165%214%148%276%797%428$0@@%438$1@@@%797%438$1@@%428$0@@@|@|@@%213%168%216%165%214%148%274%796%428$0@@%796%438$1@@$2@@@%796%438$1@@%796%428$0@@$2@@@|@|@|@@@%254%254%216%165%214%148%276%797%428$0@@%422$1@@@%797%422$1@@%428$0@@@|@|@@%213%168%216%165%214%148%274%796%428$0@@%796%422$1@@$2@@@%796%422$1@@%796%428$0@@$2@@@|@|@|@@@%254%254%215%164%214%148%276%797%428$0@@%440$1@@@%797%440$1@@%428$0@@@|@|@@%213%168%215%164%214%148%274%796%428$0@@%796%440$1@@$2@@@%796%440$1@@%796%428$0@@$2@@@|@|@|@@@%254%254%214%163%214%148%276%797%428$0@@%416$1@@@%797%416$1@@%428$0@@@|@|@@%213%168%214%163%214%148%274%796%428$0@@%796%416$1@@$2@@@%796%416$1@@%796%428$0@@$2@@@|@|@|@@@%254%254%221%166%214%148%276%797%434$0@@%420$1@@@%797%420$1@@%434$0@@@|@|@@%213%168%221%166%214%148%274%796%434$0@@%796%420$1@@$2@@@%796%420$1@@%796%434$0@@$2@@@|@|@|@@@%254%254%216%165%214%148%276%797%434$0@@%438$1@@@%797%438$1@@%434$0@@@|@|@@%213%168%216%165%214%148%274%796%434$0@@%796%438$1@@$2@@@%796%438$1@@%796%434$0@@$2@@@|@|@|@@@%254%254%216%165%214%148%276%797%434$0@@%422$1@@@%797%422$1@@%434$0@@@|@|@@%213%168%216%165%214%148%274%796%434$0@@%796%422$1@@$2@@@%796%422$1@@%796%434$0@@$2@@@|@|@|@@@%254%254%215%164%214%148%276%797%434$0@@%440$1@@@%797%440$1@@%434$0@@@|@|@@%213%168%215%164%214%148%274%796%434$0@@%796%440$1@@$2@@@%796%440$1@@%796%434$0@@$2@@@|@|@|@@@%254%254%214%163%214%148%276%797%434$0@@%416$1@@@%797%416$1@@%434$0@@@|@|@@%213%168%214%163%214%148%274%796%434$0@@%796%416$1@@$2@@@%796%416$1@@%796%434$0@@$2@@@|@|@|@@@%254%254%214%163%214%148%276%797%434$0@@%428$1@@@%797%428$1@@%434$0@@@|@|@@%213%168%214%163%214%148%274%796%434$0@@%796%428$1@@$2@@@%796%428$1@@%796%434$0@@$2@@@|@|@|@@@%254%254%221%166%215%149%276%797%418$0@@%420$1@@@%797%420$1@@%418$0@@@|@|@@%213%168%221%166%215%149%274%796%418$0@@%796%420$1@@$2@@@%796%420$1@@%796%418$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%276%797%418$0@@%438$1@@@%797%438$1@@%418$0@@@|@|@@%213%168%216%165%215%149%274%796%418$0@@%796%438$1@@$2@@@%796%438$1@@%796%418$0@@$2@@@|@|@|@@@%254%254%216%165%215%149%276%797%418$0@@%422$1@@@%797%422$1@@%418$0@@@|@|@@%213%168%216%165%215%149%274%796%418$0@@%796%422$1@@$2@@@%796%422$1@@%796%418$0@@$2@@@|@|@|@@@%254%254%215%164%215%149%276%797%418$0@@%440$1@@@%797%440$1@@%418$0@@@|@|@@%213%168%215%164%215%149%274%796%418$0@@%796%440$1@@$2@@@%796%440$1@@%796%418$0@@$2@@@|@|@|@@@%254%254%214%163%215%149%276%797%418$0@@%416$1@@@%797%416$1@@%418$0@@@|@|@@%213%168%214%163%215%149%274%796%418$0@@%796%416$1@@$2@@@%796%416$1@@%796%418$0@@$2@@@|@|@|@@@%254%254%214%163%215%149%276%797%418$0@@%428$1@@@%797%428$1@@%418$0@@@|@|@@%213%168%214%163%215%149%274%796%418$0@@%796%428$1@@$2@@@%796%428$1@@%796%418$0@@$2@@@|@|@|@@@%254%254%214%163%215%149%276%797%418$0@@%434$1@@@%797%434$1@@%418$0@@@|@|@@%213%168%214%163%215%149%274%796%418$0@@%796%434$1@@$2@@@%796%434$1@@%796%418$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%276%797%414$0@@%420$1@@@%797%420$1@@%414$0@@@|@|@@%213%168%221%166%216%150%274%796%414$0@@%796%420$1@@$2@@@%796%420$1@@%796%414$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%414$0@@%438$1@@@%797%438$1@@%414$0@@@|@|@@%213%168%216%165%216%150%274%796%414$0@@%796%438$1@@$2@@@%796%438$1@@%796%414$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%414$0@@%422$1@@@%797%422$1@@%414$0@@@|@|@@%213%168%216%165%216%150%274%796%414$0@@%796%422$1@@$2@@@%796%422$1@@%796%414$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%276%797%414$0@@%440$1@@@%797%440$1@@%414$0@@@|@|@@%213%168%215%164%216%150%274%796%414$0@@%796%440$1@@$2@@@%796%440$1@@%796%414$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%414$0@@%416$1@@@%797%416$1@@%414$0@@@|@|@@%213%168%214%163%216%150%274%796%414$0@@%796%416$1@@$2@@@%796%416$1@@%796%414$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%414$0@@%428$1@@@%797%428$1@@%414$0@@@|@|@@%213%168%214%163%216%150%274%796%414$0@@%796%428$1@@$2@@@%796%428$1@@%796%414$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%414$0@@%434$1@@@%797%434$1@@%414$0@@@|@|@@%213%168%214%163%216%150%274%796%414$0@@%796%434$1@@$2@@@%796%434$1@@%796%414$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%276%797%414$0@@%418$1@@@%797%418$1@@%414$0@@@|@|@@%213%168%215%164%216%150%274%796%414$0@@%796%418$1@@$2@@@%796%418$1@@%796%414$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%276%797%424$0@@%420$1@@@%797%420$1@@%424$0@@@|@|@@%213%168%221%166%216%150%274%796%424$0@@%796%420$1@@$2@@@%796%420$1@@%796%424$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%424$0@@%438$1@@@%797%438$1@@%424$0@@@|@|@@%213%168%216%165%216%150%274%796%424$0@@%796%438$1@@$2@@@%796%438$1@@%796%424$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%424$0@@%422$1@@@%797%422$1@@%424$0@@@|@|@@%213%168%216%165%216%150%274%796%424$0@@%796%422$1@@$2@@@%796%422$1@@%796%424$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%276%797%424$0@@%440$1@@@%797%440$1@@%424$0@@@|@|@@%213%168%215%164%216%150%274%796%424$0@@%796%440$1@@$2@@@%796%440$1@@%796%424$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%424$0@@%416$1@@@%797%416$1@@%424$0@@@|@|@@%213%168%214%163%216%150%274%796%424$0@@%796%416$1@@$2@@@%796%416$1@@%796%424$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%424$0@@%428$1@@@%797%428$1@@%424$0@@@|@|@@%213%168%214%163%216%150%274%796%424$0@@%796%428$1@@$2@@@%796%428$1@@%796%424$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%424$0@@%434$1@@@%797%434$1@@%424$0@@@|@|@@%213%168%214%163%216%150%274%796%424$0@@%796%434$1@@$2@@@%796%434$1@@%796%424$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%276%797%424$0@@%418$1@@@%797%418$1@@%424$0@@@|@|@@%213%168%215%164%216%150%274%796%424$0@@%796%418$1@@$2@@@%796%418$1@@%796%424$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%424$0@@%414$1@@@%797%414$1@@%424$0@@@|@|@@%213%168%216%165%216%150%274%796%424$0@@%796%414$1@@$2@@@%796%414$1@@%796%424$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%276%797%426$0@@%420$1@@@%797%420$1@@%426$0@@@|@|@@%213%168%221%166%216%150%274%796%426$0@@%796%420$1@@$2@@@%796%420$1@@%796%426$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%426$0@@%438$1@@@%797%438$1@@%426$0@@@|@|@@%213%168%216%165%216%150%274%796%426$0@@%796%438$1@@$2@@@%796%438$1@@%796%426$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%426$0@@%422$1@@@%797%422$1@@%426$0@@@|@|@@%213%168%216%165%216%150%274%796%426$0@@%796%422$1@@$2@@@%796%422$1@@%796%426$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%276%797%426$0@@%440$1@@@%797%440$1@@%426$0@@@|@|@@%213%168%215%164%216%150%274%796%426$0@@%796%440$1@@$2@@@%796%440$1@@%796%426$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%426$0@@%416$1@@@%797%416$1@@%426$0@@@|@|@@%213%168%214%163%216%150%274%796%426$0@@%796%416$1@@$2@@@%796%416$1@@%796%426$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%426$0@@%428$1@@@%797%428$1@@%426$0@@@|@|@@%213%168%214%163%216%150%274%796%426$0@@%796%428$1@@$2@@@%796%428$1@@%796%426$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%426$0@@%434$1@@@%797%434$1@@%426$0@@@|@|@@%213%168%214%163%216%150%274%796%426$0@@%796%434$1@@$2@@@%796%434$1@@%796%426$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%276%797%426$0@@%418$1@@@%797%418$1@@%426$0@@@|@|@@%213%168%215%164%216%150%274%796%426$0@@%796%418$1@@$2@@@%796%418$1@@%796%426$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%426$0@@%414$1@@@%797%414$1@@%426$0@@@|@|@@%213%168%216%165%216%150%274%796%426$0@@%796%414$1@@$2@@@%796%414$1@@%796%426$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%426$0@@%424$1@@@%797%424$1@@%426$0@@@|@|@@%213%168%216%165%216%150%274%796%426$0@@%796%424$1@@$2@@@%796%424$1@@%796%426$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%276%797%430$0@@%420$1@@@%797%420$1@@%430$0@@@|@|@@%213%168%221%166%216%150%274%796%430$0@@%796%420$1@@$2@@@%796%420$1@@%796%430$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%430$0@@%438$1@@@%797%438$1@@%430$0@@@|@|@@%213%168%216%165%216%150%274%796%430$0@@%796%438$1@@$2@@@%796%438$1@@%796%430$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%430$0@@%422$1@@@%797%422$1@@%430$0@@@|@|@@%213%168%216%165%216%150%274%796%430$0@@%796%422$1@@$2@@@%796%422$1@@%796%430$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%276%797%430$0@@%440$1@@@%797%440$1@@%430$0@@@|@|@@%213%168%215%164%216%150%274%796%430$0@@%796%440$1@@$2@@@%796%440$1@@%796%430$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%430$0@@%416$1@@@%797%416$1@@%430$0@@@|@|@@%213%168%214%163%216%150%274%796%430$0@@%796%416$1@@$2@@@%796%416$1@@%796%430$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%430$0@@%428$1@@@%797%428$1@@%430$0@@@|@|@@%213%168%214%163%216%150%274%796%430$0@@%796%428$1@@$2@@@%796%428$1@@%796%430$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%430$0@@%434$1@@@%797%434$1@@%430$0@@@|@|@@%213%168%214%163%216%150%274%796%430$0@@%796%434$1@@$2@@@%796%434$1@@%796%430$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%276%797%430$0@@%418$1@@@%797%418$1@@%430$0@@@|@|@@%213%168%215%164%216%150%274%796%430$0@@%796%418$1@@$2@@@%796%418$1@@%796%430$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%430$0@@%414$1@@@%797%414$1@@%430$0@@@|@|@@%213%168%216%165%216%150%274%796%430$0@@%796%414$1@@$2@@@%796%414$1@@%796%430$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%430$0@@%424$1@@@%797%424$1@@%430$0@@@|@|@@%213%168%216%165%216%150%274%796%430$0@@%796%424$1@@$2@@@%796%424$1@@%796%430$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%430$0@@%426$1@@@%797%426$1@@%430$0@@@|@|@@%213%168%216%165%216%150%274%796%430$0@@%796%426$1@@$2@@@%796%426$1@@%796%430$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%276%797%432$0@@%420$1@@@%797%420$1@@%432$0@@@|@|@@%213%168%221%166%216%150%274%796%432$0@@%796%420$1@@$2@@@%796%420$1@@%796%432$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%432$0@@%438$1@@@%797%438$1@@%432$0@@@|@|@@%213%168%216%165%216%150%274%796%432$0@@%796%438$1@@$2@@@%796%438$1@@%796%432$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%432$0@@%422$1@@@%797%422$1@@%432$0@@@|@|@@%213%168%216%165%216%150%274%796%432$0@@%796%422$1@@$2@@@%796%422$1@@%796%432$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%276%797%432$0@@%440$1@@@%797%440$1@@%432$0@@@|@|@@%213%168%215%164%216%150%274%796%432$0@@%796%440$1@@$2@@@%796%440$1@@%796%432$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%432$0@@%416$1@@@%797%416$1@@%432$0@@@|@|@@%213%168%214%163%216%150%274%796%432$0@@%796%416$1@@$2@@@%796%416$1@@%796%432$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%432$0@@%428$1@@@%797%428$1@@%432$0@@@|@|@@%213%168%214%163%216%150%274%796%432$0@@%796%428$1@@$2@@@%796%428$1@@%796%432$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%432$0@@%434$1@@@%797%434$1@@%432$0@@@|@|@@%213%168%214%163%216%150%274%796%432$0@@%796%434$1@@$2@@@%796%434$1@@%796%432$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%276%797%432$0@@%418$1@@@%797%418$1@@%432$0@@@|@|@@%213%168%215%164%216%150%274%796%432$0@@%796%418$1@@$2@@@%796%418$1@@%796%432$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%432$0@@%414$1@@@%797%414$1@@%432$0@@@|@|@@%213%168%216%165%216%150%274%796%432$0@@%796%414$1@@$2@@@%796%414$1@@%796%432$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%432$0@@%424$1@@@%797%424$1@@%432$0@@@|@|@@%213%168%216%165%216%150%274%796%432$0@@%796%424$1@@$2@@@%796%424$1@@%796%432$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%432$0@@%426$1@@@%797%426$1@@%432$0@@@|@|@@%213%168%216%165%216%150%274%796%432$0@@%796%426$1@@$2@@@%796%426$1@@%796%432$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%432$0@@%430$1@@@%797%430$1@@%432$0@@@|@|@@%213%168%216%165%216%150%274%796%432$0@@%796%430$1@@$2@@@%796%430$1@@%796%432$0@@$2@@@|@|@|@@@%254%254%221%166%216%150%276%797%436$0@@%420$1@@@%797%420$1@@%436$0@@@|@|@@%213%168%221%166%216%150%274%796%436$0@@%796%420$1@@$2@@@%796%420$1@@%796%436$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%436$0@@%438$1@@@%797%438$1@@%436$0@@@|@|@@%213%168%216%165%216%150%274%796%436$0@@%796%438$1@@$2@@@%796%438$1@@%796%436$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%436$0@@%422$1@@@%797%422$1@@%436$0@@@|@|@@%213%168%216%165%216%150%274%796%436$0@@%796%422$1@@$2@@@%796%422$1@@%796%436$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%276%797%436$0@@%440$1@@@%797%440$1@@%436$0@@@|@|@@%213%168%215%164%216%150%274%796%436$0@@%796%440$1@@$2@@@%796%440$1@@%796%436$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%436$0@@%416$1@@@%797%416$1@@%436$0@@@|@|@@%213%168%214%163%216%150%274%796%436$0@@%796%416$1@@$2@@@%796%416$1@@%796%436$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%436$0@@%428$1@@@%797%428$1@@%436$0@@@|@|@@%213%168%214%163%216%150%274%796%436$0@@%796%428$1@@$2@@@%796%428$1@@%796%436$0@@$2@@@|@|@|@@@%254%254%214%163%216%150%276%797%436$0@@%434$1@@@%797%434$1@@%436$0@@@|@|@@%213%168%214%163%216%150%274%796%436$0@@%796%434$1@@$2@@@%796%434$1@@%796%436$0@@$2@@@|@|@|@@@%254%254%215%164%216%150%276%797%436$0@@%418$1@@@%797%418$1@@%436$0@@@|@|@@%213%168%215%164%216%150%274%796%436$0@@%796%418$1@@$2@@@%796%418$1@@%796%436$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%436$0@@%414$1@@@%797%414$1@@%436$0@@@|@|@@%213%168%216%165%216%150%274%796%436$0@@%796%414$1@@$2@@@%796%414$1@@%796%436$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%436$0@@%424$1@@@%797%424$1@@%436$0@@@|@|@@%213%168%216%165%216%150%274%796%436$0@@%796%424$1@@$2@@@%796%424$1@@%796%436$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%436$0@@%426$1@@@%797%426$1@@%436$0@@@|@|@@%213%168%216%165%216%150%274%796%436$0@@%796%426$1@@$2@@@%796%426$1@@%796%436$0@@$2@@@|@|@|@@@%254%254%216%165%216%150%276%797%436$0@@%430$1@@@%797%430$1@@%436$0@@@|@|@@%213%168%216%165%216%150%274%796%436$0@@%796%430$1@@$2@@@%796%430$1@@%796%436$0@@$2@@@|@|@|@@@%254%216%165%216%150%276%797%436$0@@%432$1@@@%797%432$1@@%436$0@@@|@|@@%213%168%216%165%216%150%274%796%436$0@@%796%432$1@@$2@@@%796%432$1@@%796%436$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_header_component_equality x = x
    val op elf64_header_component_equality =
    DT(((("elf_header",377),
        [("bool",[25,26,51,56,63,181]),("elf_header",[337,338,339,356]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%211%107%211%109%261%268$1@$0@@%254%277%419$1@@%419$0@@@%254%265%437$1@@%437$0@@@%254%265%421$1@@%421$0@@@%254%264%439$1@@%439$0@@@%254%263%415$1@@%415$0@@@%254%263%427$1@@%427$0@@@%254%263%433$1@@%433$0@@@%254%264%417$1@@%417$0@@@%254%265%413$1@@%413$0@@@%254%265%423$1@@%423$0@@@%254%265%425$1@@%425$0@@@%254%265%429$1@@%429$0@@@%254%265%431$1@@%431$0@@@%265%435$1@@%435$0@@@@@@@@@@@@@@@@|@|@"])
  fun op elf64_header_updates_eq_literal x = x
    val op elf64_header_updates_eq_literal =
    DT(((("elf_header",378),
        [("bool",[25,26,56,181]),("combin",[12]),
         ("elf_header",[337,338,339,371])]),["DISK_THM"]),
       [read"%211%105%225%177%209%55%209%52%208%98%207%91%207%84%207%77%208%74%209%71%209%66%209%61%209%51%209%47%209%45%268%420%328$13@@%438%323$12@@%422%323$11@@%440%322$10@@%416%321$9@@%428%321$8@@%434%321$7@@%418%322$6@@%414%323$5@@%424%323$4@@%426%323$3@@%430%323$2@@%432%323$1@@%436%323$0@@$14@@@@@@@@@@@@@@@%420%328$13@@%438%323$12@@%422%323$11@@%440%322$10@@%416%321$9@@%428%321$8@@%434%321$7@@%418%322$6@@%414%323$5@@%424%323$4@@%426%323$3@@%430%323$2@@%432%323$1@@%436%323$0@@%299@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_literal_nchotomy x = x
    val op elf64_header_literal_nchotomy =
    DT(((("elf_header",379),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_header",[337,338,339,371]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%211%105%295%177%288%55%288%52%287%98%286%91%286%84%286%77%287%74%288%71%288%66%288%61%288%51%288%47%288%45%268$14@%420%328$13@@%438%323$12@@%422%323$11@@%440%322$10@@%416%321$9@@%428%321$8@@%434%321$7@@%418%322$6@@%414%323$5@@%424%323$4@@%426%323$3@@%430%323$2@@%432%323$1@@%436%323$0@@%299@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf64_header x = x
    val op FORALL_elf64_header =
    DT(((("elf_header",380),
        [("bool",[25,26,36,51,56,58,63,143,181]),("combin",[12]),
         ("elf_header",[337,338,339,371]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%218%7%261%211%105$1$0@|@@%225%177%209%55%209%52%208%98%207%91%207%84%207%77%208%74%209%71%209%66%209%61%209%51%209%47%209%45$14%420%328$13@@%438%323$12@@%422%323$11@@%440%322$10@@%416%321$9@@%428%321$8@@%434%321$7@@%418%322$6@@%414%323$5@@%424%323$4@@%426%323$3@@%430%323$2@@%432%323$1@@%436%323$0@@%299@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf64_header x = x
    val op EXISTS_elf64_header =
    DT(((("elf_header",381),
        [("bool",[25,26,51,56,58,63,143,181]),("combin",[12]),
         ("elf_header",[337,338,339,371]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%218%7%261%290%105$1$0@|@@%295%177%288%55%288%52%287%98%286%91%286%84%286%77%287%74%288%71%288%66%288%61%288%51%288%47%288%45$14%420%328$13@@%438%323$12@@%422%323$11@@%440%322$10@@%416%321$9@@%428%321$8@@%434%321$7@@%418%322$6@@%414%323$5@@%424%323$4@@%426%323$3@@%430%323$2@@%432%323$1@@%436%323$0@@%299@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op elf64_header_literal_11 x = x
    val op elf64_header_literal_11 =
    DT(((("elf_header",382),
        [("combin",[12]),("elf_header",[372,377])]),["DISK_THM"]),
       [read"%225%178%209%56%209%53%208%100%207%94%207%87%207%80%208%75%209%72%209%67%209%62%209%55%209%48%209%51%225%179%209%57%209%54%208%101%207%96%207%89%207%82%208%76%209%73%209%68%209%63%209%58%209%49%209%61%261%268%420%328$27@@%438%323$26@@%422%323$25@@%440%322$24@@%416%321$23@@%428%321$22@@%434%321$21@@%418%322$20@@%414%323$19@@%424%323$18@@%426%323$17@@%430%323$16@@%432%323$15@@%436%323$14@@%299@@@@@@@@@@@@@@@%420%328$13@@%438%323$12@@%422%323$11@@%440%322$10@@%416%321$9@@%428%321$8@@%434%321$7@@%418%322$6@@%414%323$5@@%424%323$4@@%426%323$3@@%430%323$2@@%432%323$1@@%436%323$0@@%299@@@@@@@@@@@@@@@@%254%277$27@$13@@%254%265$26@$12@@%254%265$25@$11@@%254%264$24@$10@@%254%263$23@$9@@%254%263$22@$8@@%254%263$21@$7@@%254%264$20@$6@@%254%265$19@$5@@%254%265$18@$4@@%254%265$17@$3@@%254%265$16@$2@@%254%265$15@$1@@%265$14@$0@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf64_header x = x
    val op datatype_elf64_header =
    DT(((("elf_header",383),[("bool",[25,171])]),["DISK_THM"]),
       [read"%315%189%133@%134@%143@%135@%144@%131@%138@%141@%132@%130@%136@%137@%139@%140@%142@@"])
  fun op elf64_header_11 x = x
    val op elf64_header_11 =
    DT(((("elf_header",384),
        [("bool",[26,51,56,63,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%8%209%12%209%22%208%24%207%26%207%30%207%34%208%38%209%40%209%42%209%14%209%16%209%18%209%20%225%9%209%13%209%23%208%25%207%28%207%32%207%36%208%39%209%41%209%43%209%15%209%17%209%19%209%21%261%268%817$27@$26@$25@$24@$23@$22@$21@$20@$19@$18@$17@$16@$15@$14@@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%254%277$27@$13@@%254%265$26@$12@@%254%265$25@$11@@%254%264$24@$10@@%254%263$23@$9@@%254%263$22@$8@@%254%263$21@$7@@%254%264$20@$6@@%254%265$19@$5@@%254%265$18@$4@@%254%265$17@$3@@%254%265$16@$2@@%254%265$15@$1@@%265$14@$0@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_case_cong x = x
    val op elf64_header_case_cong =
    DT(((("elf_header",385),
        [("bool",[26,181]),
         ("elf_header",[337,338,339,340])]),["DISK_THM"]),
       [read"%211%3%211%5%219%151%283%254%268$2@$1@@%225%8%209%12%209%22%208%24%207%26%207%30%207%34%208%38%209%40%209%42%209%14%209%16%209%18%209%20%283%268$15@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%258$14$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%154$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@%258%411$2@$0@@%411$1@%154@@@|@|@|@"])
  fun op elf64_header_nchotomy x = x
    val op elf64_header_nchotomy =
    DT(((("elf_header",386),
        [("bool",[26,181]),("elf_header",[337,338,339])]),["DISK_THM"]),
       [read"%211%111%295%177%288%45%288%47%287%50%286%59%286%64%286%69%287%74%288%79%288%86%288%93%288%99%288%52%288%55%268$14@%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_Axiom x = x
    val op elf64_header_Axiom =
    DT(((("elf_header",387),
        [("bool",[26,181]),("elf_header",[337,338,339]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%219%151%293%162%225%8%209%12%209%22%208%24%207%26%207%30%207%34%208%38%209%40%209%42%209%14%209%16%209%18%209%20%258$14%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$15$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_induction x = x
    val op elf64_header_induction =
    DT(((("elf_header",388),
        [("bool",[26]),("elf_header",[337,338,339])]),["DISK_THM"]),
       [read"%218%7%283%225%177%209%45%209%47%208%50%207%59%207%64%207%69%208%74%209%79%209%86%209%93%209%99%209%52%209%55$14%817$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%211%105$1$0@|@@|@"])
  end
  val _ = DB.bindl "elf_header"
  [("shn_undef_def",shn_undef_def,DB.Def),
   ("shn_xindex_def",shn_xindex_def,DB.Def),
   ("elf_ft_none_def",elf_ft_none_def,DB.Def),
   ("elf_ft_rel_def",elf_ft_rel_def,DB.Def),
   ("elf_ft_exec_def",elf_ft_exec_def,DB.Def),
   ("elf_ft_dyn_def",elf_ft_dyn_def,DB.Def),
   ("elf_ft_core_def",elf_ft_core_def,DB.Def),
   ("elf_ft_lo_os_def",elf_ft_lo_os_def,DB.Def),
   ("elf_ft_hi_os_def",elf_ft_hi_os_def,DB.Def),
   ("elf_ft_lo_proc_def",elf_ft_lo_proc_def,DB.Def),
   ("elf_ft_hi_proc_def",elf_ft_hi_proc_def,DB.Def),
   ("is_operating_system_specific_object_file_type_value_def",
    is_operating_system_specific_object_file_type_value_def,
    DB.Def),
   ("is_processor_specific_object_file_type_value_def",
    is_processor_specific_object_file_type_value_def,
    DB.Def), ("elf_ma_riscv_def",elf_ma_riscv_def,DB.Def),
   ("elf_ma_amdgpu_def",elf_ma_amdgpu_def,DB.Def),
   ("elf_ma_moxie_def",elf_ma_moxie_def,DB.Def),
   ("elf_ma_ft32_def",elf_ma_ft32_def,DB.Def),
   ("elf_ma_visium_def",elf_ma_visium_def,DB.Def),
   ("elf_ma_z80_def",elf_ma_z80_def,DB.Def),
   ("elf_ma_kalimba_def",elf_ma_kalimba_def,DB.Def),
   ("elf_ma_norc_def",elf_ma_norc_def,DB.Def),
   ("elf_ma_cool_def",elf_ma_cool_def,DB.Def),
   ("elf_ma_coge_def",elf_ma_coge_def,DB.Def),
   ("elf_ma_cdp_def",elf_ma_cdp_def,DB.Def),
   ("elf_ma_kvarc_def",elf_ma_kvarc_def,DB.Def),
   ("elf_ma_kmx8_def",elf_ma_kmx8_def,DB.Def),
   ("elf_ma_kmx16_def",elf_ma_kmx16_def,DB.Def),
   ("elf_ma_kmx32_def",elf_ma_kmx32_def,DB.Def),
   ("elf_ma_km32_def",elf_ma_km32_def,DB.Def),
   ("elf_ma_mchp_pic_def",elf_ma_mchp_pic_def,DB.Def),
   ("elf_ma_xcore_def",elf_ma_xcore_def,DB.Def),
   ("elf_ma_ba2_def",elf_ma_ba2_def,DB.Def),
   ("elf_ma_ba1_def",elf_ma_ba1_def,DB.Def),
   ("elf_ma_5600ex_def",elf_ma_5600ex_def,DB.Def),
   ("elf_ma_78kor_def",elf_ma_78kor_def,DB.Def),
   ("elf_ma_videocore5_def",elf_ma_videocore5_def,DB.Def),
   ("elf_ma_rl78_def",elf_ma_rl78_def,DB.Def),
   ("elf_ma_open8_def",elf_ma_open8_def,DB.Def),
   ("elf_ma_arc_compact2_def",elf_ma_arc_compact2_def,DB.Def),
   ("elf_ma_corea_2nd_def",elf_ma_corea_2nd_def,DB.Def),
   ("elf_ma_corea_1st_def",elf_ma_corea_1st_def,DB.Def),
   ("elf_ma_cloudshield_def",elf_ma_cloudshield_def,DB.Def),
   ("elf_ma_sle9x_def",elf_ma_sle9x_def,DB.Def),
   ("elf_ma_l10m_def",elf_ma_l10m_def,DB.Def),
   ("elf_ma_k10m_def",elf_ma_k10m_def,DB.Def),
   ("elf_ma_aarch64_def",elf_ma_aarch64_def,DB.Def),
   ("elf_ma_avr32_def",elf_ma_avr32_def,DB.Def),
   ("elf_ma_stm8_def",elf_ma_stm8_def,DB.Def),
   ("elf_ma_tile64_def",elf_ma_tile64_def,DB.Def),
   ("elf_ma_tilepro_def",elf_ma_tilepro_def,DB.Def),
   ("elf_ma_microblaze_def",elf_ma_microblaze_def,DB.Def),
   ("elf_ma_cuda_def",elf_ma_cuda_def,DB.Def),
   ("elf_ma_tilegx_def",elf_ma_tilegx_def,DB.Def),
   ("elf_ma_cypress_def",elf_ma_cypress_def,DB.Def),
   ("elf_ma_r32c_def",elf_ma_r32c_def,DB.Def),
   ("elf_ma_trimedia_def",elf_ma_trimedia_def,DB.Def),
   ("elf_ma_qdsp6_def",elf_ma_qdsp6_def,DB.Def),
   ("elf_ma_8051_def",elf_ma_8051_def,DB.Def),
   ("elf_ma_stxp7x_def",elf_ma_stxp7x_def,DB.Def),
   ("elf_ma_nds32_def",elf_ma_nds32_def,DB.Def),
   ("elf_ma_ecog1x_def",elf_ma_ecog1x_def,DB.Def),
   ("elf_ma_maxq30_def",elf_ma_maxq30_def,DB.Def),
   ("elf_ma_ximo16_def",elf_ma_ximo16_def,DB.Def),
   ("elf_ma_manik_def",elf_ma_manik_def,DB.Def),
   ("elf_ma_craynv2_def",elf_ma_craynv2_def,DB.Def),
   ("elf_ma_rx_def",elf_ma_rx_def,DB.Def),
   ("elf_ma_metag_def",elf_ma_metag_def,DB.Def),
   ("elf_ma_mcst_elbrus_def",elf_ma_mcst_elbrus_def,DB.Def),
   ("elf_ma_ecog16_def",elf_ma_ecog16_def,DB.Def),
   ("elf_ma_cr16_def",elf_ma_cr16_def,DB.Def),
   ("elf_ma_etpu_def",elf_ma_etpu_def,DB.Def),
   ("elf_ma_tsk3000_def",elf_ma_tsk3000_def,DB.Def),
   ("elf_ma_rs08_def",elf_ma_rs08_def,DB.Def),
   ("elf_ma_sharc_def",elf_ma_sharc_def,DB.Def),
   ("elf_ma_ecog2_def",elf_ma_ecog2_def,DB.Def),
   ("elf_ma_ccore7_def",elf_ma_ccore7_def,DB.Def),
   ("elf_ma_dsp24_def",elf_ma_dsp24_def,DB.Def),
   ("elf_ma_videocore3_def",elf_ma_videocore3_def,DB.Def),
   ("elf_ma_latticemico32_def",elf_ma_latticemico32_def,DB.Def),
   ("elf_ma_c17_def",elf_ma_c17_def,DB.Def),
   ("elf_ma_c6000_def",elf_ma_c6000_def,DB.Def),
   ("elf_ma_c2000_def",elf_ma_c2000_def,DB.Def),
   ("elf_ma_c5500_def",elf_ma_c5500_def,DB.Def),
   ("elf_ma_mmdsp_plus_def",elf_ma_mmdsp_plus_def,DB.Def),
   ("elf_ma_zsp_def",elf_ma_zsp_def,DB.Def),
   ("elf_ma_mmix_def",elf_ma_mmix_def,DB.Def),
   ("elf_ma_huany_def",elf_ma_huany_def,DB.Def),
   ("elf_ma_prism_def",elf_ma_prism_def,DB.Def),
   ("elf_ma_avr_def",elf_ma_avr_def,DB.Def),
   ("elf_ma_fr30_def",elf_ma_fr30_def,DB.Def),
   ("elf_ma_d10v_def",elf_ma_d10v_def,DB.Def),
   ("elf_ma_d30v_def",elf_ma_d30v_def,DB.Def),
   ("elf_ma_v850_def",elf_ma_v850_def,DB.Def),
   ("elf_ma_m32r_def",elf_ma_m32r_def,DB.Def),
   ("elf_ma_mn10300_def",elf_ma_mn10300_def,DB.Def),
   ("elf_ma_mn10200_def",elf_ma_mn10200_def,DB.Def),
   ("elf_ma_pj_def",elf_ma_pj_def,DB.Def),
   ("elf_ma_openrisc_def",elf_ma_openrisc_def,DB.Def),
   ("elf_ma_arc_compact_def",elf_ma_arc_compact_def,DB.Def),
   ("elf_ma_xtensa_def",elf_ma_xtensa_def,DB.Def),
   ("elf_ma_videocore_def",elf_ma_videocore_def,DB.Def),
   ("elf_ma_tmm_gpp_def",elf_ma_tmm_gpp_def,DB.Def),
   ("elf_ma_ns32k_def",elf_ma_ns32k_def,DB.Def),
   ("elf_ma_tpc_def",elf_ma_tpc_def,DB.Def),
   ("elf_ma_snp1k_def",elf_ma_snp1k_def,DB.Def),
   ("elf_ma_st200_def",elf_ma_st200_def,DB.Def),
   ("elf_ma_ip2k_def",elf_ma_ip2k_def,DB.Def),
   ("elf_ma_max_def",elf_ma_max_def,DB.Def),
   ("elf_ma_cr_def",elf_ma_cr_def,DB.Def),
   ("elf_ma_f2mc16_def",elf_ma_f2mc16_def,DB.Def),
   ("elf_ma_msp430_def",elf_ma_msp430_def,DB.Def),
   ("elf_ma_blackfin_def",elf_ma_blackfin_def,DB.Def),
   ("elf_ma_se_c33_def",elf_ma_se_c33_def,DB.Def),
   ("elf_ma_sep_def",elf_ma_sep_def,DB.Def),
   ("elf_ma_arca_def",elf_ma_arca_def,DB.Def),
   ("elf_ma_unicore_def",elf_ma_unicore_def,DB.Def),
   ("elf_ma_excess_def",elf_ma_excess_def,DB.Def),
   ("elf_ma_dxp_def",elf_ma_dxp_def,DB.Def),
   ("elf_ma_altera_nios2_def",elf_ma_altera_nios2_def,DB.Def),
   ("elf_ma_crx_def",elf_ma_crx_def,DB.Def),
   ("elf_ma_xgate_def",elf_ma_xgate_def,DB.Def),
   ("elf_ma_c166_def",elf_ma_c166_def,DB.Def),
   ("elf_ma_m16c_def",elf_ma_m16c_def,DB.Def),
   ("elf_ma_dspic30f_def",elf_ma_dspic30f_def,DB.Def),
   ("elf_ma_ce_def",elf_ma_ce_def,DB.Def),
   ("elf_ma_m32c_def",elf_ma_m32c_def,DB.Def),
   ("elf_ma_none_def",elf_ma_none_def,DB.Def),
   ("elf_ma_m32_def",elf_ma_m32_def,DB.Def),
   ("elf_ma_sparc_def",elf_ma_sparc_def,DB.Def),
   ("elf_ma_386_def",elf_ma_386_def,DB.Def),
   ("elf_ma_68k_def",elf_ma_68k_def,DB.Def),
   ("elf_ma_88k_def",elf_ma_88k_def,DB.Def),
   ("elf_ma_860_def",elf_ma_860_def,DB.Def),
   ("elf_ma_mips_def",elf_ma_mips_def,DB.Def),
   ("elf_ma_s370_def",elf_ma_s370_def,DB.Def),
   ("elf_ma_mips_rs3_le_def",elf_ma_mips_rs3_le_def,DB.Def),
   ("elf_ma_parisc_def",elf_ma_parisc_def,DB.Def),
   ("elf_ma_vpp500_def",elf_ma_vpp500_def,DB.Def),
   ("elf_ma_sparc32plus_def",elf_ma_sparc32plus_def,DB.Def),
   ("elf_ma_960_def",elf_ma_960_def,DB.Def),
   ("elf_ma_ppc_def",elf_ma_ppc_def,DB.Def),
   ("elf_ma_ppc64_def",elf_ma_ppc64_def,DB.Def),
   ("elf_ma_s390_def",elf_ma_s390_def,DB.Def),
   ("elf_ma_spu_def",elf_ma_spu_def,DB.Def),
   ("elf_ma_v800_def",elf_ma_v800_def,DB.Def),
   ("elf_ma_fr20_def",elf_ma_fr20_def,DB.Def),
   ("elf_ma_rh32_def",elf_ma_rh32_def,DB.Def),
   ("elf_ma_rce_def",elf_ma_rce_def,DB.Def),
   ("elf_ma_arm_def",elf_ma_arm_def,DB.Def),
   ("elf_ma_alpha_def",elf_ma_alpha_def,DB.Def),
   ("elf_ma_sh_def",elf_ma_sh_def,DB.Def),
   ("elf_ma_sparcv9_def",elf_ma_sparcv9_def,DB.Def),
   ("elf_ma_tricore_def",elf_ma_tricore_def,DB.Def),
   ("elf_ma_arc_def",elf_ma_arc_def,DB.Def),
   ("elf_ma_h8_300_def",elf_ma_h8_300_def,DB.Def),
   ("elf_ma_h8_300h_def",elf_ma_h8_300h_def,DB.Def),
   ("elf_ma_h8s_def",elf_ma_h8s_def,DB.Def),
   ("elf_ma_h8_500_def",elf_ma_h8_500_def,DB.Def),
   ("elf_ma_ia_64_def",elf_ma_ia_64_def,DB.Def),
   ("elf_ma_mips_x_def",elf_ma_mips_x_def,DB.Def),
   ("elf_ma_coldfire_def",elf_ma_coldfire_def,DB.Def),
   ("elf_ma_68hc12_def",elf_ma_68hc12_def,DB.Def),
   ("elf_ma_mma_def",elf_ma_mma_def,DB.Def),
   ("elf_ma_pcp_def",elf_ma_pcp_def,DB.Def),
   ("elf_ma_ncpu_def",elf_ma_ncpu_def,DB.Def),
   ("elf_ma_ndr1_def",elf_ma_ndr1_def,DB.Def),
   ("elf_ma_starcore_def",elf_ma_starcore_def,DB.Def),
   ("elf_ma_me16_def",elf_ma_me16_def,DB.Def),
   ("elf_ma_st100_def",elf_ma_st100_def,DB.Def),
   ("elf_ma_tinyj_def",elf_ma_tinyj_def,DB.Def),
   ("elf_ma_x86_64_def",elf_ma_x86_64_def,DB.Def),
   ("elf_ma_pdsp_def",elf_ma_pdsp_def,DB.Def),
   ("elf_ma_pdp10_def",elf_ma_pdp10_def,DB.Def),
   ("elf_ma_pdp11_def",elf_ma_pdp11_def,DB.Def),
   ("elf_ma_fx66_def",elf_ma_fx66_def,DB.Def),
   ("elf_ma_st9plus_def",elf_ma_st9plus_def,DB.Def),
   ("elf_ma_st7_def",elf_ma_st7_def,DB.Def),
   ("elf_ma_68hc16_def",elf_ma_68hc16_def,DB.Def),
   ("elf_ma_68hc11_def",elf_ma_68hc11_def,DB.Def),
   ("elf_ma_68hc08_def",elf_ma_68hc08_def,DB.Def),
   ("elf_ma_68hc05_def",elf_ma_68hc05_def,DB.Def),
   ("elf_ma_svx_def",elf_ma_svx_def,DB.Def),
   ("elf_ma_st19_def",elf_ma_st19_def,DB.Def),
   ("elf_ma_vax_def",elf_ma_vax_def,DB.Def),
   ("elf_ma_cris_def",elf_ma_cris_def,DB.Def),
   ("elf_ma_javelin_def",elf_ma_javelin_def,DB.Def),
   ("elf_ma_firepath_def",elf_ma_firepath_def,DB.Def),
   ("elf_ma_intel209_def",elf_ma_intel209_def,DB.Def),
   ("elf_ma_intel208_def",elf_ma_intel208_def,DB.Def),
   ("elf_ma_intel207_def",elf_ma_intel207_def,DB.Def),
   ("elf_ma_intel206_def",elf_ma_intel206_def,DB.Def),
   ("elf_ma_intel205_def",elf_ma_intel205_def,DB.Def),
   ("elf_ma_intel182_def",elf_ma_intel182_def,DB.Def),
   ("elf_ma_arm184_def",elf_ma_arm184_def,DB.Def),
   ("elf_ma_reserved6_def",elf_ma_reserved6_def,DB.Def),
   ("elf_ma_reserved11_def",elf_ma_reserved11_def,DB.Def),
   ("elf_ma_reserved12_def",elf_ma_reserved12_def,DB.Def),
   ("elf_ma_reserved13_def",elf_ma_reserved13_def,DB.Def),
   ("elf_ma_reserved14_def",elf_ma_reserved14_def,DB.Def),
   ("elf_ma_reserved16_def",elf_ma_reserved16_def,DB.Def),
   ("elf_ma_reserved24_def",elf_ma_reserved24_def,DB.Def),
   ("elf_ma_reserved25_def",elf_ma_reserved25_def,DB.Def),
   ("elf_ma_reserved26_def",elf_ma_reserved26_def,DB.Def),
   ("elf_ma_reserved27_def",elf_ma_reserved27_def,DB.Def),
   ("elf_ma_reserved28_def",elf_ma_reserved28_def,DB.Def),
   ("elf_ma_reserved29_def",elf_ma_reserved29_def,DB.Def),
   ("elf_ma_reserved30_def",elf_ma_reserved30_def,DB.Def),
   ("elf_ma_reserved31_def",elf_ma_reserved31_def,DB.Def),
   ("elf_ma_reserved32_def",elf_ma_reserved32_def,DB.Def),
   ("elf_ma_reserved33_def",elf_ma_reserved33_def,DB.Def),
   ("elf_ma_reserved34_def",elf_ma_reserved34_def,DB.Def),
   ("elf_ma_reserved35_def",elf_ma_reserved35_def,DB.Def),
   ("elf_ma_reserved121_def",elf_ma_reserved121_def,DB.Def),
   ("elf_ma_reserved122_def",elf_ma_reserved122_def,DB.Def),
   ("elf_ma_reserved123_def",elf_ma_reserved123_def,DB.Def),
   ("elf_ma_reserved124_def",elf_ma_reserved124_def,DB.Def),
   ("elf_ma_reserved125_def",elf_ma_reserved125_def,DB.Def),
   ("elf_ma_reserved126_def",elf_ma_reserved126_def,DB.Def),
   ("elf_ma_reserved127_def",elf_ma_reserved127_def,DB.Def),
   ("elf_ma_reserved128_def",elf_ma_reserved128_def,DB.Def),
   ("elf_ma_reserved129_def",elf_ma_reserved129_def,DB.Def),
   ("elf_ma_reserved130_def",elf_ma_reserved130_def,DB.Def),
   ("elf_ma_reserved143_def",elf_ma_reserved143_def,DB.Def),
   ("elf_ma_reserved144_def",elf_ma_reserved144_def,DB.Def),
   ("elf_ma_reserved145_def",elf_ma_reserved145_def,DB.Def),
   ("elf_ma_reserved146_def",elf_ma_reserved146_def,DB.Def),
   ("elf_ma_reserved147_def",elf_ma_reserved147_def,DB.Def),
   ("elf_ma_reserved148_def",elf_ma_reserved148_def,DB.Def),
   ("elf_ma_reserved149_def",elf_ma_reserved149_def,DB.Def),
   ("elf_ma_reserved150_def",elf_ma_reserved150_def,DB.Def),
   ("elf_ma_reserved151_def",elf_ma_reserved151_def,DB.Def),
   ("elf_ma_reserved152_def",elf_ma_reserved152_def,DB.Def),
   ("elf_ma_reserved153_def",elf_ma_reserved153_def,DB.Def),
   ("elf_ma_reserved154_def",elf_ma_reserved154_def,DB.Def),
   ("elf_ma_reserved155_def",elf_ma_reserved155_def,DB.Def),
   ("elf_ma_reserved156_def",elf_ma_reserved156_def,DB.Def),
   ("elf_ma_reserved157_def",elf_ma_reserved157_def,DB.Def),
   ("elf_ma_reserved158_def",elf_ma_reserved158_def,DB.Def),
   ("elf_ma_reserved159_def",elf_ma_reserved159_def,DB.Def),
   ("elf_ev_none_def",elf_ev_none_def,DB.Def),
   ("elf_ev_current_def",elf_ev_current_def,DB.Def),
   ("is_valid_extended_version_number_def",
    is_valid_extended_version_number_def,
    DB.Def), ("elf_ii_mag0_def",elf_ii_mag0_def,DB.Def),
   ("elf_ii_mag1_def",elf_ii_mag1_def,DB.Def),
   ("elf_ii_mag2_def",elf_ii_mag2_def,DB.Def),
   ("elf_ii_mag3_def",elf_ii_mag3_def,DB.Def),
   ("elf_ii_class_def",elf_ii_class_def,DB.Def),
   ("elf_ii_data_def",elf_ii_data_def,DB.Def),
   ("elf_ii_version_def",elf_ii_version_def,DB.Def),
   ("elf_ii_osabi_def",elf_ii_osabi_def,DB.Def),
   ("elf_ii_abiversion_def",elf_ii_abiversion_def,DB.Def),
   ("elf_ii_pad_def",elf_ii_pad_def,DB.Def),
   ("elf_ii_nident_def",elf_ii_nident_def,DB.Def),
   ("elf_mn_mag0_def",elf_mn_mag0_def,DB.Def),
   ("elf_mn_mag1_def",elf_mn_mag1_def,DB.Def),
   ("elf_mn_mag2_def",elf_mn_mag2_def,DB.Def),
   ("elf_mn_mag3_def",elf_mn_mag3_def,DB.Def),
   ("elf_class_none_def",elf_class_none_def,DB.Def),
   ("elf_class_32_def",elf_class_32_def,DB.Def),
   ("elf_class_64_def",elf_class_64_def,DB.Def),
   ("elf_data_none_def",elf_data_none_def,DB.Def),
   ("elf_data_2lsb_def",elf_data_2lsb_def,DB.Def),
   ("elf_data_2msb_def",elf_data_2msb_def,DB.Def),
   ("elf_osabi_none_def",elf_osabi_none_def,DB.Def),
   ("elf_osabi_hpux_def",elf_osabi_hpux_def,DB.Def),
   ("elf_osabi_netbsd_def",elf_osabi_netbsd_def,DB.Def),
   ("elf_osabi_gnu_def",elf_osabi_gnu_def,DB.Def),
   ("elf_osabi_linux_def",elf_osabi_linux_def,DB.Def),
   ("elf_osabi_solaris_def",elf_osabi_solaris_def,DB.Def),
   ("elf_osabi_aix_def",elf_osabi_aix_def,DB.Def),
   ("elf_osabi_irix_def",elf_osabi_irix_def,DB.Def),
   ("elf_osabi_freebsd_def",elf_osabi_freebsd_def,DB.Def),
   ("elf_osabi_tru64_def",elf_osabi_tru64_def,DB.Def),
   ("elf_osabi_modesto_def",elf_osabi_modesto_def,DB.Def),
   ("elf_osabi_openbsd_def",elf_osabi_openbsd_def,DB.Def),
   ("elf_osabi_openvms_def",elf_osabi_openvms_def,DB.Def),
   ("elf_osabi_nsk_def",elf_osabi_nsk_def,DB.Def),
   ("elf_osabi_aros_def",elf_osabi_aros_def,DB.Def),
   ("elf_osabi_fenixos_def",elf_osabi_fenixos_def,DB.Def),
   ("elf_osabi_cloudabi_def",elf_osabi_cloudabi_def,DB.Def),
   ("elf_osabi_openvos_def",elf_osabi_openvos_def,DB.Def),
   ("is_valid_architecture_defined_osabi_version_def",
    is_valid_architecture_defined_osabi_version_def,
    DB.Def), ("ei_nident_def",ei_nident_def,DB.Def),
   ("elf32_header_TY_DEF",elf32_header_TY_DEF,DB.Def),
   ("elf32_header_case_def",elf32_header_case_def,DB.Def),
   ("elf32_header_size_def",elf32_header_size_def,DB.Def),
   ("elf32_header_elf32_ident",elf32_header_elf32_ident,DB.Def),
   ("elf32_header_elf32_type",elf32_header_elf32_type,DB.Def),
   ("elf32_header_elf32_machine",elf32_header_elf32_machine,DB.Def),
   ("elf32_header_elf32_version",elf32_header_elf32_version,DB.Def),
   ("elf32_header_elf32_entry",elf32_header_elf32_entry,DB.Def),
   ("elf32_header_elf32_phoff",elf32_header_elf32_phoff,DB.Def),
   ("elf32_header_elf32_shoff",elf32_header_elf32_shoff,DB.Def),
   ("elf32_header_elf32_flags",elf32_header_elf32_flags,DB.Def),
   ("elf32_header_elf32_ehsize",elf32_header_elf32_ehsize,DB.Def),
   ("elf32_header_elf32_phentsize",elf32_header_elf32_phentsize,DB.Def),
   ("elf32_header_elf32_phnum",elf32_header_elf32_phnum,DB.Def),
   ("elf32_header_elf32_shentsize",elf32_header_elf32_shentsize,DB.Def),
   ("elf32_header_elf32_shnum",elf32_header_elf32_shnum,DB.Def),
   ("elf32_header_elf32_shstrndx",elf32_header_elf32_shstrndx,DB.Def),
   ("elf32_header_elf32_ident_fupd",elf32_header_elf32_ident_fupd,DB.Def),
   ("elf32_header_elf32_type_fupd",elf32_header_elf32_type_fupd,DB.Def),
   ("elf32_header_elf32_machine_fupd",
    elf32_header_elf32_machine_fupd,
    DB.Def),
   ("elf32_header_elf32_version_fupd",
    elf32_header_elf32_version_fupd,
    DB.Def),
   ("elf32_header_elf32_entry_fupd",elf32_header_elf32_entry_fupd,DB.Def),
   ("elf32_header_elf32_phoff_fupd",elf32_header_elf32_phoff_fupd,DB.Def),
   ("elf32_header_elf32_shoff_fupd",elf32_header_elf32_shoff_fupd,DB.Def),
   ("elf32_header_elf32_flags_fupd",elf32_header_elf32_flags_fupd,DB.Def),
   ("elf32_header_elf32_ehsize_fupd",
    elf32_header_elf32_ehsize_fupd,
    DB.Def),
   ("elf32_header_elf32_phentsize_fupd",
    elf32_header_elf32_phentsize_fupd,
    DB.Def),
   ("elf32_header_elf32_phnum_fupd",elf32_header_elf32_phnum_fupd,DB.Def),
   ("elf32_header_elf32_shentsize_fupd",
    elf32_header_elf32_shentsize_fupd,
    DB.Def),
   ("elf32_header_elf32_shnum_fupd",elf32_header_elf32_shnum_fupd,DB.Def),
   ("elf32_header_elf32_shstrndx_fupd",
    elf32_header_elf32_shstrndx_fupd,
    DB.Def), ("elf64_header_TY_DEF",elf64_header_TY_DEF,DB.Def),
   ("elf64_header_case_def",elf64_header_case_def,DB.Def),
   ("elf64_header_size_def",elf64_header_size_def,DB.Def),
   ("elf64_header_elf64_ident",elf64_header_elf64_ident,DB.Def),
   ("elf64_header_elf64_type",elf64_header_elf64_type,DB.Def),
   ("elf64_header_elf64_machine",elf64_header_elf64_machine,DB.Def),
   ("elf64_header_elf64_version",elf64_header_elf64_version,DB.Def),
   ("elf64_header_elf64_entry",elf64_header_elf64_entry,DB.Def),
   ("elf64_header_elf64_phoff",elf64_header_elf64_phoff,DB.Def),
   ("elf64_header_elf64_shoff",elf64_header_elf64_shoff,DB.Def),
   ("elf64_header_elf64_flags",elf64_header_elf64_flags,DB.Def),
   ("elf64_header_elf64_ehsize",elf64_header_elf64_ehsize,DB.Def),
   ("elf64_header_elf64_phentsize",elf64_header_elf64_phentsize,DB.Def),
   ("elf64_header_elf64_phnum",elf64_header_elf64_phnum,DB.Def),
   ("elf64_header_elf64_shentsize",elf64_header_elf64_shentsize,DB.Def),
   ("elf64_header_elf64_shnum",elf64_header_elf64_shnum,DB.Def),
   ("elf64_header_elf64_shstrndx",elf64_header_elf64_shstrndx,DB.Def),
   ("elf64_header_elf64_ident_fupd",elf64_header_elf64_ident_fupd,DB.Def),
   ("elf64_header_elf64_type_fupd",elf64_header_elf64_type_fupd,DB.Def),
   ("elf64_header_elf64_machine_fupd",
    elf64_header_elf64_machine_fupd,
    DB.Def),
   ("elf64_header_elf64_version_fupd",
    elf64_header_elf64_version_fupd,
    DB.Def),
   ("elf64_header_elf64_entry_fupd",elf64_header_elf64_entry_fupd,DB.Def),
   ("elf64_header_elf64_phoff_fupd",elf64_header_elf64_phoff_fupd,DB.Def),
   ("elf64_header_elf64_shoff_fupd",elf64_header_elf64_shoff_fupd,DB.Def),
   ("elf64_header_elf64_flags_fupd",elf64_header_elf64_flags_fupd,DB.Def),
   ("elf64_header_elf64_ehsize_fupd",
    elf64_header_elf64_ehsize_fupd,
    DB.Def),
   ("elf64_header_elf64_phentsize_fupd",
    elf64_header_elf64_phentsize_fupd,
    DB.Def),
   ("elf64_header_elf64_phnum_fupd",elf64_header_elf64_phnum_fupd,DB.Def),
   ("elf64_header_elf64_shentsize_fupd",
    elf64_header_elf64_shentsize_fupd,
    DB.Def),
   ("elf64_header_elf64_shnum_fupd",elf64_header_elf64_shnum_fupd,DB.Def),
   ("elf64_header_elf64_shstrndx_fupd",
    elf64_header_elf64_shstrndx_fupd,
    DB.Def),
   ("is_valid_elf32_header_def",is_valid_elf32_header_def,DB.Def),
   ("is_valid_elf64_header_def",is_valid_elf64_header_def,DB.Def),
   ("elf32_header_compare_def",elf32_header_compare_def,DB.Def),
   ("instance_Basic_classes_Ord_Elf_header_elf32_header_dict_def",
    instance_Basic_classes_Ord_Elf_header_elf32_header_dict_def,
    DB.Def), ("elf64_header_compare_def",elf64_header_compare_def,DB.Def),
   ("instance_Basic_classes_Ord_Elf_header_elf64_header_dict_def",
    instance_Basic_classes_Ord_Elf_header_elf64_header_dict_def,
    DB.Def),
   ("is_elf32_executable_file_def",is_elf32_executable_file_def,DB.Def),
   ("is_elf64_executable_file_def",is_elf64_executable_file_def,DB.Def),
   ("is_elf32_shared_object_file_def",
    is_elf32_shared_object_file_def,
    DB.Def),
   ("is_elf64_shared_object_file_def",
    is_elf64_shared_object_file_def,
    DB.Def),
   ("is_elf32_relocatable_file_def",is_elf32_relocatable_file_def,DB.Def),
   ("is_elf64_relocatable_file_def",is_elf64_relocatable_file_def,DB.Def),
   ("is_elf32_linkable_file_def",is_elf32_linkable_file_def,DB.Def),
   ("is_elf64_linkable_file_def",is_elf64_linkable_file_def,DB.Def),
   ("get_elf32_machine_architecture_def",
    get_elf32_machine_architecture_def,
    DB.Def),
   ("get_elf64_machine_architecture_def",
    get_elf64_machine_architecture_def,
    DB.Def), ("get_elf32_osabi_def",get_elf32_osabi_def,DB.Def),
   ("get_elf64_osabi_def",get_elf64_osabi_def,DB.Def),
   ("get_elf32_data_encoding_def",get_elf32_data_encoding_def,DB.Def),
   ("get_elf64_data_encoding_def",get_elf64_data_encoding_def,DB.Def),
   ("get_elf32_file_class_def",get_elf32_file_class_def,DB.Def),
   ("get_elf64_file_class_def",get_elf64_file_class_def,DB.Def),
   ("get_elf32_version_number_def",get_elf32_version_number_def,DB.Def),
   ("get_elf64_version_number_def",get_elf64_version_number_def,DB.Def),
   ("is_valid_elf32_version_numer_def",
    is_valid_elf32_version_numer_def,
    DB.Def),
   ("is_valid_elf64_version_numer_def",
    is_valid_elf64_version_numer_def,
    DB.Def),
   ("get_elf32_abi_version_def",get_elf32_abi_version_def,DB.Def),
   ("get_elf64_abi_version_def",get_elf64_abi_version_def,DB.Def),
   ("deduce_endianness_def",deduce_endianness_def,DB.Def),
   ("get_elf32_header_endianness_def",
    get_elf32_header_endianness_def,
    DB.Def),
   ("get_elf64_header_endianness_def",
    get_elf64_header_endianness_def,
    DB.Def),
   ("has_elf32_header_associated_entry_point_def",
    has_elf32_header_associated_entry_point_def,
    DB.Def),
   ("has_elf64_header_associated_entry_point_def",
    has_elf64_header_associated_entry_point_def,
    DB.Def),
   ("has_elf32_header_string_table_def",
    has_elf32_header_string_table_def,
    DB.Def),
   ("has_elf64_header_string_table_def",
    has_elf64_header_string_table_def,
    DB.Def),
   ("is_elf32_header_section_size_in_section_header_table_def",
    is_elf32_header_section_size_in_section_header_table_def,
    DB.Def),
   ("is_elf64_header_section_size_in_section_header_table_def",
    is_elf64_header_section_size_in_section_header_table_def,
    DB.Def),
   ("is_elf32_header_string_table_index_in_link_def",
    is_elf32_header_string_table_index_in_link_def,
    DB.Def),
   ("is_elf64_header_string_table_index_in_link_def",
    is_elf64_header_string_table_index_in_link_def,
    DB.Def), ("read_elf_ident_def",read_elf_ident_def,DB.Def),
   ("bytes_of_elf32_header_def",bytes_of_elf32_header_def,DB.Def),
   ("bytes_of_elf64_header_def",bytes_of_elf64_header_def,DB.Def),
   ("is_elf32_header_padding_correct_def",
    is_elf32_header_padding_correct_def,
    DB.Def),
   ("is_magic_number_correct_def",is_magic_number_correct_def,DB.Def),
   ("read_elf32_header_def",read_elf32_header_def,DB.Def),
   ("read_elf64_header_def",read_elf64_header_def,DB.Def),
   ("is_elf32_header_class_correct_def",
    is_elf32_header_class_correct_def,
    DB.Def),
   ("is_elf64_header_class_correct_def",
    is_elf64_header_class_correct_def,
    DB.Def),
   ("is_elf32_header_version_correct_def",
    is_elf32_header_version_correct_def,
    DB.Def),
   ("is_elf64_header_version_correct_def",
    is_elf64_header_version_correct_def,
    DB.Def),
   ("is_elf32_header_valid_def",is_elf32_header_valid_def,DB.Def),
   ("get_elf32_header_program_table_size_def",
    get_elf32_header_program_table_size_def,
    DB.Def),
   ("get_elf64_header_program_table_size_def",
    get_elf64_header_program_table_size_def,
    DB.Def),
   ("is_elf32_header_section_table_present_def",
    is_elf32_header_section_table_present_def,
    DB.Def),
   ("is_elf64_header_section_table_present_def",
    is_elf64_header_section_table_present_def,
    DB.Def),
   ("get_elf32_header_section_table_size_def",
    get_elf32_header_section_table_size_def,
    DB.Def),
   ("get_elf64_header_section_table_size_def",
    get_elf64_header_section_table_size_def,
    DB.Def), ("elf32_header_accessors",elf32_header_accessors,DB.Thm),
   ("elf32_header_fn_updates",elf32_header_fn_updates,DB.Thm),
   ("elf32_header_accfupds",elf32_header_accfupds,DB.Thm),
   ("elf32_header_fupdfupds",elf32_header_fupdfupds,DB.Thm),
   ("elf32_header_fupdfupds_comp",elf32_header_fupdfupds_comp,DB.Thm),
   ("elf32_header_fupdcanon",elf32_header_fupdcanon,DB.Thm),
   ("elf32_header_fupdcanon_comp",elf32_header_fupdcanon_comp,DB.Thm),
   ("elf32_header_component_equality",
    elf32_header_component_equality,
    DB.Thm),
   ("elf32_header_updates_eq_literal",
    elf32_header_updates_eq_literal,
    DB.Thm),
   ("elf32_header_literal_nchotomy",elf32_header_literal_nchotomy,DB.Thm),
   ("FORALL_elf32_header",FORALL_elf32_header,DB.Thm),
   ("EXISTS_elf32_header",EXISTS_elf32_header,DB.Thm),
   ("elf32_header_literal_11",elf32_header_literal_11,DB.Thm),
   ("datatype_elf32_header",datatype_elf32_header,DB.Thm),
   ("elf32_header_11",elf32_header_11,DB.Thm),
   ("elf32_header_case_cong",elf32_header_case_cong,DB.Thm),
   ("elf32_header_nchotomy",elf32_header_nchotomy,DB.Thm),
   ("elf32_header_Axiom",elf32_header_Axiom,DB.Thm),
   ("elf32_header_induction",elf32_header_induction,DB.Thm),
   ("elf64_header_accessors",elf64_header_accessors,DB.Thm),
   ("elf64_header_fn_updates",elf64_header_fn_updates,DB.Thm),
   ("elf64_header_accfupds",elf64_header_accfupds,DB.Thm),
   ("elf64_header_fupdfupds",elf64_header_fupdfupds,DB.Thm),
   ("elf64_header_fupdfupds_comp",elf64_header_fupdfupds_comp,DB.Thm),
   ("elf64_header_fupdcanon",elf64_header_fupdcanon,DB.Thm),
   ("elf64_header_fupdcanon_comp",elf64_header_fupdcanon_comp,DB.Thm),
   ("elf64_header_component_equality",
    elf64_header_component_equality,
    DB.Thm),
   ("elf64_header_updates_eq_literal",
    elf64_header_updates_eq_literal,
    DB.Thm),
   ("elf64_header_literal_nchotomy",elf64_header_literal_nchotomy,DB.Thm),
   ("FORALL_elf64_header",FORALL_elf64_header,DB.Thm),
   ("EXISTS_elf64_header",EXISTS_elf64_header,DB.Thm),
   ("elf64_header_literal_11",elf64_header_literal_11,DB.Thm),
   ("datatype_elf64_header",datatype_elf64_header,DB.Thm),
   ("elf64_header_11",elf64_header_11,DB.Thm),
   ("elf64_header_case_cong",elf64_header_case_cong,DB.Thm),
   ("elf64_header_nchotomy",elf64_header_nchotomy,DB.Thm),
   ("elf64_header_Axiom",elf64_header_Axiom,DB.Thm),
   ("elf64_header_induction",elf64_header_induction,DB.Thm)]

  local open Portable GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("lem_setTheory.lem_set_grammars",
                          lem_setTheory.lem_set_grammars),
                         ("elf_types_native_uintTheory.elf_types_native_uint_grammars",
                          elf_types_native_uintTheory.elf_types_native_uint_grammars),
                         ("default_printingTheory.default_printing_grammars",
                          default_printingTheory.default_printing_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_undef", (Term.prim_mk_const { Name = "shn_undef", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_undef", (Term.prim_mk_const { Name = "shn_undef", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_xindex", (Term.prim_mk_const { Name = "shn_xindex", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("shn_xindex", (Term.prim_mk_const { Name = "shn_xindex", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_none", (Term.prim_mk_const { Name = "elf_ft_none", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_none", (Term.prim_mk_const { Name = "elf_ft_none", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_rel", (Term.prim_mk_const { Name = "elf_ft_rel", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_rel", (Term.prim_mk_const { Name = "elf_ft_rel", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_exec", (Term.prim_mk_const { Name = "elf_ft_exec", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_exec", (Term.prim_mk_const { Name = "elf_ft_exec", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_dyn", (Term.prim_mk_const { Name = "elf_ft_dyn", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_dyn", (Term.prim_mk_const { Name = "elf_ft_dyn", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_core", (Term.prim_mk_const { Name = "elf_ft_core", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_core", (Term.prim_mk_const { Name = "elf_ft_core", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_lo_os", (Term.prim_mk_const { Name = "elf_ft_lo_os", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_lo_os", (Term.prim_mk_const { Name = "elf_ft_lo_os", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_hi_os", (Term.prim_mk_const { Name = "elf_ft_hi_os", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_hi_os", (Term.prim_mk_const { Name = "elf_ft_hi_os", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_lo_proc", (Term.prim_mk_const { Name = "elf_ft_lo_proc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_lo_proc", (Term.prim_mk_const { Name = "elf_ft_lo_proc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_hi_proc", (Term.prim_mk_const { Name = "elf_ft_hi_proc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ft_hi_proc", (Term.prim_mk_const { Name = "elf_ft_hi_proc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_operating_system_specific_object_file_type_value", (Term.prim_mk_const { Name = "is_operating_system_specific_object_file_type_value", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_operating_system_specific_object_file_type_value", (Term.prim_mk_const { Name = "is_operating_system_specific_object_file_type_value", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_processor_specific_object_file_type_value", (Term.prim_mk_const { Name = "is_processor_specific_object_file_type_value", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_processor_specific_object_file_type_value", (Term.prim_mk_const { Name = "is_processor_specific_object_file_type_value", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_riscv", (Term.prim_mk_const { Name = "elf_ma_riscv", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_riscv", (Term.prim_mk_const { Name = "elf_ma_riscv", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_amdgpu", (Term.prim_mk_const { Name = "elf_ma_amdgpu", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_amdgpu", (Term.prim_mk_const { Name = "elf_ma_amdgpu", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_moxie", (Term.prim_mk_const { Name = "elf_ma_moxie", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_moxie", (Term.prim_mk_const { Name = "elf_ma_moxie", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ft32", (Term.prim_mk_const { Name = "elf_ma_ft32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ft32", (Term.prim_mk_const { Name = "elf_ma_ft32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_visium", (Term.prim_mk_const { Name = "elf_ma_visium", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_visium", (Term.prim_mk_const { Name = "elf_ma_visium", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_z80", (Term.prim_mk_const { Name = "elf_ma_z80", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_z80", (Term.prim_mk_const { Name = "elf_ma_z80", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_kalimba", (Term.prim_mk_const { Name = "elf_ma_kalimba", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_kalimba", (Term.prim_mk_const { Name = "elf_ma_kalimba", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_norc", (Term.prim_mk_const { Name = "elf_ma_norc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_norc", (Term.prim_mk_const { Name = "elf_ma_norc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cool", (Term.prim_mk_const { Name = "elf_ma_cool", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cool", (Term.prim_mk_const { Name = "elf_ma_cool", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_coge", (Term.prim_mk_const { Name = "elf_ma_coge", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_coge", (Term.prim_mk_const { Name = "elf_ma_coge", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cdp", (Term.prim_mk_const { Name = "elf_ma_cdp", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cdp", (Term.prim_mk_const { Name = "elf_ma_cdp", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_kvarc", (Term.prim_mk_const { Name = "elf_ma_kvarc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_kvarc", (Term.prim_mk_const { Name = "elf_ma_kvarc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_kmx8", (Term.prim_mk_const { Name = "elf_ma_kmx8", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_kmx8", (Term.prim_mk_const { Name = "elf_ma_kmx8", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_kmx16", (Term.prim_mk_const { Name = "elf_ma_kmx16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_kmx16", (Term.prim_mk_const { Name = "elf_ma_kmx16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_kmx32", (Term.prim_mk_const { Name = "elf_ma_kmx32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_kmx32", (Term.prim_mk_const { Name = "elf_ma_kmx32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_km32", (Term.prim_mk_const { Name = "elf_ma_km32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_km32", (Term.prim_mk_const { Name = "elf_ma_km32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mchp_pic", (Term.prim_mk_const { Name = "elf_ma_mchp_pic", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mchp_pic", (Term.prim_mk_const { Name = "elf_ma_mchp_pic", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_xcore", (Term.prim_mk_const { Name = "elf_ma_xcore", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_xcore", (Term.prim_mk_const { Name = "elf_ma_xcore", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ba2", (Term.prim_mk_const { Name = "elf_ma_ba2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ba2", (Term.prim_mk_const { Name = "elf_ma_ba2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ba1", (Term.prim_mk_const { Name = "elf_ma_ba1", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ba1", (Term.prim_mk_const { Name = "elf_ma_ba1", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_5600ex", (Term.prim_mk_const { Name = "elf_ma_5600ex", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_5600ex", (Term.prim_mk_const { Name = "elf_ma_5600ex", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_78kor", (Term.prim_mk_const { Name = "elf_ma_78kor", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_78kor", (Term.prim_mk_const { Name = "elf_ma_78kor", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_videocore5", (Term.prim_mk_const { Name = "elf_ma_videocore5", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_videocore5", (Term.prim_mk_const { Name = "elf_ma_videocore5", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_rl78", (Term.prim_mk_const { Name = "elf_ma_rl78", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_rl78", (Term.prim_mk_const { Name = "elf_ma_rl78", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_open8", (Term.prim_mk_const { Name = "elf_ma_open8", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_open8", (Term.prim_mk_const { Name = "elf_ma_open8", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_arc_compact2", (Term.prim_mk_const { Name = "elf_ma_arc_compact2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_arc_compact2", (Term.prim_mk_const { Name = "elf_ma_arc_compact2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_corea_2nd", (Term.prim_mk_const { Name = "elf_ma_corea_2nd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_corea_2nd", (Term.prim_mk_const { Name = "elf_ma_corea_2nd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_corea_1st", (Term.prim_mk_const { Name = "elf_ma_corea_1st", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_corea_1st", (Term.prim_mk_const { Name = "elf_ma_corea_1st", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cloudshield", (Term.prim_mk_const { Name = "elf_ma_cloudshield", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cloudshield", (Term.prim_mk_const { Name = "elf_ma_cloudshield", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sle9x", (Term.prim_mk_const { Name = "elf_ma_sle9x", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sle9x", (Term.prim_mk_const { Name = "elf_ma_sle9x", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_l10m", (Term.prim_mk_const { Name = "elf_ma_l10m", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_l10m", (Term.prim_mk_const { Name = "elf_ma_l10m", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_k10m", (Term.prim_mk_const { Name = "elf_ma_k10m", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_k10m", (Term.prim_mk_const { Name = "elf_ma_k10m", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_aarch64", (Term.prim_mk_const { Name = "elf_ma_aarch64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_aarch64", (Term.prim_mk_const { Name = "elf_ma_aarch64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_avr32", (Term.prim_mk_const { Name = "elf_ma_avr32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_avr32", (Term.prim_mk_const { Name = "elf_ma_avr32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_stm8", (Term.prim_mk_const { Name = "elf_ma_stm8", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_stm8", (Term.prim_mk_const { Name = "elf_ma_stm8", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tile64", (Term.prim_mk_const { Name = "elf_ma_tile64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tile64", (Term.prim_mk_const { Name = "elf_ma_tile64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tilepro", (Term.prim_mk_const { Name = "elf_ma_tilepro", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tilepro", (Term.prim_mk_const { Name = "elf_ma_tilepro", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_microblaze", (Term.prim_mk_const { Name = "elf_ma_microblaze", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_microblaze", (Term.prim_mk_const { Name = "elf_ma_microblaze", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cuda", (Term.prim_mk_const { Name = "elf_ma_cuda", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cuda", (Term.prim_mk_const { Name = "elf_ma_cuda", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tilegx", (Term.prim_mk_const { Name = "elf_ma_tilegx", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tilegx", (Term.prim_mk_const { Name = "elf_ma_tilegx", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cypress", (Term.prim_mk_const { Name = "elf_ma_cypress", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cypress", (Term.prim_mk_const { Name = "elf_ma_cypress", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_r32c", (Term.prim_mk_const { Name = "elf_ma_r32c", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_r32c", (Term.prim_mk_const { Name = "elf_ma_r32c", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_trimedia", (Term.prim_mk_const { Name = "elf_ma_trimedia", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_trimedia", (Term.prim_mk_const { Name = "elf_ma_trimedia", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_qdsp6", (Term.prim_mk_const { Name = "elf_ma_qdsp6", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_qdsp6", (Term.prim_mk_const { Name = "elf_ma_qdsp6", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_8051", (Term.prim_mk_const { Name = "elf_ma_8051", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_8051", (Term.prim_mk_const { Name = "elf_ma_8051", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_stxp7x", (Term.prim_mk_const { Name = "elf_ma_stxp7x", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_stxp7x", (Term.prim_mk_const { Name = "elf_ma_stxp7x", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_nds32", (Term.prim_mk_const { Name = "elf_ma_nds32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_nds32", (Term.prim_mk_const { Name = "elf_ma_nds32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ecog1x", (Term.prim_mk_const { Name = "elf_ma_ecog1x", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ecog1x", (Term.prim_mk_const { Name = "elf_ma_ecog1x", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_maxq30", (Term.prim_mk_const { Name = "elf_ma_maxq30", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_maxq30", (Term.prim_mk_const { Name = "elf_ma_maxq30", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ximo16", (Term.prim_mk_const { Name = "elf_ma_ximo16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ximo16", (Term.prim_mk_const { Name = "elf_ma_ximo16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_manik", (Term.prim_mk_const { Name = "elf_ma_manik", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_manik", (Term.prim_mk_const { Name = "elf_ma_manik", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_craynv2", (Term.prim_mk_const { Name = "elf_ma_craynv2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_craynv2", (Term.prim_mk_const { Name = "elf_ma_craynv2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_rx", (Term.prim_mk_const { Name = "elf_ma_rx", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_rx", (Term.prim_mk_const { Name = "elf_ma_rx", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_metag", (Term.prim_mk_const { Name = "elf_ma_metag", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_metag", (Term.prim_mk_const { Name = "elf_ma_metag", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mcst_elbrus", (Term.prim_mk_const { Name = "elf_ma_mcst_elbrus", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mcst_elbrus", (Term.prim_mk_const { Name = "elf_ma_mcst_elbrus", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ecog16", (Term.prim_mk_const { Name = "elf_ma_ecog16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ecog16", (Term.prim_mk_const { Name = "elf_ma_ecog16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cr16", (Term.prim_mk_const { Name = "elf_ma_cr16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cr16", (Term.prim_mk_const { Name = "elf_ma_cr16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_etpu", (Term.prim_mk_const { Name = "elf_ma_etpu", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_etpu", (Term.prim_mk_const { Name = "elf_ma_etpu", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tsk3000", (Term.prim_mk_const { Name = "elf_ma_tsk3000", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tsk3000", (Term.prim_mk_const { Name = "elf_ma_tsk3000", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_rs08", (Term.prim_mk_const { Name = "elf_ma_rs08", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_rs08", (Term.prim_mk_const { Name = "elf_ma_rs08", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sharc", (Term.prim_mk_const { Name = "elf_ma_sharc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sharc", (Term.prim_mk_const { Name = "elf_ma_sharc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ecog2", (Term.prim_mk_const { Name = "elf_ma_ecog2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ecog2", (Term.prim_mk_const { Name = "elf_ma_ecog2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ccore7", (Term.prim_mk_const { Name = "elf_ma_ccore7", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ccore7", (Term.prim_mk_const { Name = "elf_ma_ccore7", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_dsp24", (Term.prim_mk_const { Name = "elf_ma_dsp24", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_dsp24", (Term.prim_mk_const { Name = "elf_ma_dsp24", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_videocore3", (Term.prim_mk_const { Name = "elf_ma_videocore3", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_videocore3", (Term.prim_mk_const { Name = "elf_ma_videocore3", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_latticemico32", (Term.prim_mk_const { Name = "elf_ma_latticemico32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_latticemico32", (Term.prim_mk_const { Name = "elf_ma_latticemico32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_c17", (Term.prim_mk_const { Name = "elf_ma_c17", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_c17", (Term.prim_mk_const { Name = "elf_ma_c17", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_c6000", (Term.prim_mk_const { Name = "elf_ma_c6000", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_c6000", (Term.prim_mk_const { Name = "elf_ma_c6000", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_c2000", (Term.prim_mk_const { Name = "elf_ma_c2000", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_c2000", (Term.prim_mk_const { Name = "elf_ma_c2000", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_c5500", (Term.prim_mk_const { Name = "elf_ma_c5500", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_c5500", (Term.prim_mk_const { Name = "elf_ma_c5500", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mmdsp_plus", (Term.prim_mk_const { Name = "elf_ma_mmdsp_plus", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mmdsp_plus", (Term.prim_mk_const { Name = "elf_ma_mmdsp_plus", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_zsp", (Term.prim_mk_const { Name = "elf_ma_zsp", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_zsp", (Term.prim_mk_const { Name = "elf_ma_zsp", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mmix", (Term.prim_mk_const { Name = "elf_ma_mmix", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mmix", (Term.prim_mk_const { Name = "elf_ma_mmix", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_huany", (Term.prim_mk_const { Name = "elf_ma_huany", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_huany", (Term.prim_mk_const { Name = "elf_ma_huany", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_prism", (Term.prim_mk_const { Name = "elf_ma_prism", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_prism", (Term.prim_mk_const { Name = "elf_ma_prism", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_avr", (Term.prim_mk_const { Name = "elf_ma_avr", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_avr", (Term.prim_mk_const { Name = "elf_ma_avr", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_fr30", (Term.prim_mk_const { Name = "elf_ma_fr30", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_fr30", (Term.prim_mk_const { Name = "elf_ma_fr30", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_d10v", (Term.prim_mk_const { Name = "elf_ma_d10v", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_d10v", (Term.prim_mk_const { Name = "elf_ma_d10v", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_d30v", (Term.prim_mk_const { Name = "elf_ma_d30v", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_d30v", (Term.prim_mk_const { Name = "elf_ma_d30v", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_v850", (Term.prim_mk_const { Name = "elf_ma_v850", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_v850", (Term.prim_mk_const { Name = "elf_ma_v850", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_m32r", (Term.prim_mk_const { Name = "elf_ma_m32r", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_m32r", (Term.prim_mk_const { Name = "elf_ma_m32r", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mn10300", (Term.prim_mk_const { Name = "elf_ma_mn10300", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mn10300", (Term.prim_mk_const { Name = "elf_ma_mn10300", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mn10200", (Term.prim_mk_const { Name = "elf_ma_mn10200", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mn10200", (Term.prim_mk_const { Name = "elf_ma_mn10200", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_pj", (Term.prim_mk_const { Name = "elf_ma_pj", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_pj", (Term.prim_mk_const { Name = "elf_ma_pj", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_openrisc", (Term.prim_mk_const { Name = "elf_ma_openrisc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_openrisc", (Term.prim_mk_const { Name = "elf_ma_openrisc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_arc_compact", (Term.prim_mk_const { Name = "elf_ma_arc_compact", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_arc_compact", (Term.prim_mk_const { Name = "elf_ma_arc_compact", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_xtensa", (Term.prim_mk_const { Name = "elf_ma_xtensa", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_xtensa", (Term.prim_mk_const { Name = "elf_ma_xtensa", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_videocore", (Term.prim_mk_const { Name = "elf_ma_videocore", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_videocore", (Term.prim_mk_const { Name = "elf_ma_videocore", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tmm_gpp", (Term.prim_mk_const { Name = "elf_ma_tmm_gpp", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tmm_gpp", (Term.prim_mk_const { Name = "elf_ma_tmm_gpp", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ns32k", (Term.prim_mk_const { Name = "elf_ma_ns32k", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ns32k", (Term.prim_mk_const { Name = "elf_ma_ns32k", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tpc", (Term.prim_mk_const { Name = "elf_ma_tpc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tpc", (Term.prim_mk_const { Name = "elf_ma_tpc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_snp1k", (Term.prim_mk_const { Name = "elf_ma_snp1k", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_snp1k", (Term.prim_mk_const { Name = "elf_ma_snp1k", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_st200", (Term.prim_mk_const { Name = "elf_ma_st200", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_st200", (Term.prim_mk_const { Name = "elf_ma_st200", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ip2k", (Term.prim_mk_const { Name = "elf_ma_ip2k", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ip2k", (Term.prim_mk_const { Name = "elf_ma_ip2k", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_max", (Term.prim_mk_const { Name = "elf_ma_max", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_max", (Term.prim_mk_const { Name = "elf_ma_max", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cr", (Term.prim_mk_const { Name = "elf_ma_cr", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cr", (Term.prim_mk_const { Name = "elf_ma_cr", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_f2mc16", (Term.prim_mk_const { Name = "elf_ma_f2mc16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_f2mc16", (Term.prim_mk_const { Name = "elf_ma_f2mc16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_msp430", (Term.prim_mk_const { Name = "elf_ma_msp430", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_msp430", (Term.prim_mk_const { Name = "elf_ma_msp430", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_blackfin", (Term.prim_mk_const { Name = "elf_ma_blackfin", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_blackfin", (Term.prim_mk_const { Name = "elf_ma_blackfin", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_se_c33", (Term.prim_mk_const { Name = "elf_ma_se_c33", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_se_c33", (Term.prim_mk_const { Name = "elf_ma_se_c33", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sep", (Term.prim_mk_const { Name = "elf_ma_sep", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sep", (Term.prim_mk_const { Name = "elf_ma_sep", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_arca", (Term.prim_mk_const { Name = "elf_ma_arca", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_arca", (Term.prim_mk_const { Name = "elf_ma_arca", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_unicore", (Term.prim_mk_const { Name = "elf_ma_unicore", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_unicore", (Term.prim_mk_const { Name = "elf_ma_unicore", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_excess", (Term.prim_mk_const { Name = "elf_ma_excess", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_excess", (Term.prim_mk_const { Name = "elf_ma_excess", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_dxp", (Term.prim_mk_const { Name = "elf_ma_dxp", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_dxp", (Term.prim_mk_const { Name = "elf_ma_dxp", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_altera_nios2", (Term.prim_mk_const { Name = "elf_ma_altera_nios2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_altera_nios2", (Term.prim_mk_const { Name = "elf_ma_altera_nios2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_crx", (Term.prim_mk_const { Name = "elf_ma_crx", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_crx", (Term.prim_mk_const { Name = "elf_ma_crx", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_xgate", (Term.prim_mk_const { Name = "elf_ma_xgate", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_xgate", (Term.prim_mk_const { Name = "elf_ma_xgate", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_c166", (Term.prim_mk_const { Name = "elf_ma_c166", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_c166", (Term.prim_mk_const { Name = "elf_ma_c166", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_m16c", (Term.prim_mk_const { Name = "elf_ma_m16c", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_m16c", (Term.prim_mk_const { Name = "elf_ma_m16c", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_dspic30f", (Term.prim_mk_const { Name = "elf_ma_dspic30f", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_dspic30f", (Term.prim_mk_const { Name = "elf_ma_dspic30f", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ce", (Term.prim_mk_const { Name = "elf_ma_ce", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ce", (Term.prim_mk_const { Name = "elf_ma_ce", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_m32c", (Term.prim_mk_const { Name = "elf_ma_m32c", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_m32c", (Term.prim_mk_const { Name = "elf_ma_m32c", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_none", (Term.prim_mk_const { Name = "elf_ma_none", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_none", (Term.prim_mk_const { Name = "elf_ma_none", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_m32", (Term.prim_mk_const { Name = "elf_ma_m32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_m32", (Term.prim_mk_const { Name = "elf_ma_m32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sparc", (Term.prim_mk_const { Name = "elf_ma_sparc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sparc", (Term.prim_mk_const { Name = "elf_ma_sparc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_386", (Term.prim_mk_const { Name = "elf_ma_386", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_386", (Term.prim_mk_const { Name = "elf_ma_386", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_68k", (Term.prim_mk_const { Name = "elf_ma_68k", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_68k", (Term.prim_mk_const { Name = "elf_ma_68k", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_88k", (Term.prim_mk_const { Name = "elf_ma_88k", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_88k", (Term.prim_mk_const { Name = "elf_ma_88k", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_860", (Term.prim_mk_const { Name = "elf_ma_860", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_860", (Term.prim_mk_const { Name = "elf_ma_860", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mips", (Term.prim_mk_const { Name = "elf_ma_mips", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mips", (Term.prim_mk_const { Name = "elf_ma_mips", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_s370", (Term.prim_mk_const { Name = "elf_ma_s370", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_s370", (Term.prim_mk_const { Name = "elf_ma_s370", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mips_rs3_le", (Term.prim_mk_const { Name = "elf_ma_mips_rs3_le", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mips_rs3_le", (Term.prim_mk_const { Name = "elf_ma_mips_rs3_le", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_parisc", (Term.prim_mk_const { Name = "elf_ma_parisc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_parisc", (Term.prim_mk_const { Name = "elf_ma_parisc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_vpp500", (Term.prim_mk_const { Name = "elf_ma_vpp500", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_vpp500", (Term.prim_mk_const { Name = "elf_ma_vpp500", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sparc32plus", (Term.prim_mk_const { Name = "elf_ma_sparc32plus", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sparc32plus", (Term.prim_mk_const { Name = "elf_ma_sparc32plus", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_960", (Term.prim_mk_const { Name = "elf_ma_960", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_960", (Term.prim_mk_const { Name = "elf_ma_960", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ppc", (Term.prim_mk_const { Name = "elf_ma_ppc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ppc", (Term.prim_mk_const { Name = "elf_ma_ppc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ppc64", (Term.prim_mk_const { Name = "elf_ma_ppc64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ppc64", (Term.prim_mk_const { Name = "elf_ma_ppc64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_s390", (Term.prim_mk_const { Name = "elf_ma_s390", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_s390", (Term.prim_mk_const { Name = "elf_ma_s390", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_spu", (Term.prim_mk_const { Name = "elf_ma_spu", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_spu", (Term.prim_mk_const { Name = "elf_ma_spu", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_v800", (Term.prim_mk_const { Name = "elf_ma_v800", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_v800", (Term.prim_mk_const { Name = "elf_ma_v800", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_fr20", (Term.prim_mk_const { Name = "elf_ma_fr20", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_fr20", (Term.prim_mk_const { Name = "elf_ma_fr20", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_rh32", (Term.prim_mk_const { Name = "elf_ma_rh32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_rh32", (Term.prim_mk_const { Name = "elf_ma_rh32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_rce", (Term.prim_mk_const { Name = "elf_ma_rce", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_rce", (Term.prim_mk_const { Name = "elf_ma_rce", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_arm", (Term.prim_mk_const { Name = "elf_ma_arm", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_arm", (Term.prim_mk_const { Name = "elf_ma_arm", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_alpha", (Term.prim_mk_const { Name = "elf_ma_alpha", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_alpha", (Term.prim_mk_const { Name = "elf_ma_alpha", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sh", (Term.prim_mk_const { Name = "elf_ma_sh", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sh", (Term.prim_mk_const { Name = "elf_ma_sh", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sparcv9", (Term.prim_mk_const { Name = "elf_ma_sparcv9", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_sparcv9", (Term.prim_mk_const { Name = "elf_ma_sparcv9", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tricore", (Term.prim_mk_const { Name = "elf_ma_tricore", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tricore", (Term.prim_mk_const { Name = "elf_ma_tricore", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_arc", (Term.prim_mk_const { Name = "elf_ma_arc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_arc", (Term.prim_mk_const { Name = "elf_ma_arc", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_h8_300", (Term.prim_mk_const { Name = "elf_ma_h8_300", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_h8_300", (Term.prim_mk_const { Name = "elf_ma_h8_300", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_h8_300h", (Term.prim_mk_const { Name = "elf_ma_h8_300h", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_h8_300h", (Term.prim_mk_const { Name = "elf_ma_h8_300h", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_h8s", (Term.prim_mk_const { Name = "elf_ma_h8s", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_h8s", (Term.prim_mk_const { Name = "elf_ma_h8s", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_h8_500", (Term.prim_mk_const { Name = "elf_ma_h8_500", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_h8_500", (Term.prim_mk_const { Name = "elf_ma_h8_500", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ia_64", (Term.prim_mk_const { Name = "elf_ma_ia_64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ia_64", (Term.prim_mk_const { Name = "elf_ma_ia_64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mips_x", (Term.prim_mk_const { Name = "elf_ma_mips_x", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mips_x", (Term.prim_mk_const { Name = "elf_ma_mips_x", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_coldfire", (Term.prim_mk_const { Name = "elf_ma_coldfire", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_coldfire", (Term.prim_mk_const { Name = "elf_ma_coldfire", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_68hc12", (Term.prim_mk_const { Name = "elf_ma_68hc12", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_68hc12", (Term.prim_mk_const { Name = "elf_ma_68hc12", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mma", (Term.prim_mk_const { Name = "elf_ma_mma", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_mma", (Term.prim_mk_const { Name = "elf_ma_mma", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_pcp", (Term.prim_mk_const { Name = "elf_ma_pcp", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_pcp", (Term.prim_mk_const { Name = "elf_ma_pcp", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ncpu", (Term.prim_mk_const { Name = "elf_ma_ncpu", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ncpu", (Term.prim_mk_const { Name = "elf_ma_ncpu", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ndr1", (Term.prim_mk_const { Name = "elf_ma_ndr1", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_ndr1", (Term.prim_mk_const { Name = "elf_ma_ndr1", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_starcore", (Term.prim_mk_const { Name = "elf_ma_starcore", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_starcore", (Term.prim_mk_const { Name = "elf_ma_starcore", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_me16", (Term.prim_mk_const { Name = "elf_ma_me16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_me16", (Term.prim_mk_const { Name = "elf_ma_me16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_st100", (Term.prim_mk_const { Name = "elf_ma_st100", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_st100", (Term.prim_mk_const { Name = "elf_ma_st100", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tinyj", (Term.prim_mk_const { Name = "elf_ma_tinyj", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_tinyj", (Term.prim_mk_const { Name = "elf_ma_tinyj", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_x86_64", (Term.prim_mk_const { Name = "elf_ma_x86_64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_x86_64", (Term.prim_mk_const { Name = "elf_ma_x86_64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_pdsp", (Term.prim_mk_const { Name = "elf_ma_pdsp", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_pdsp", (Term.prim_mk_const { Name = "elf_ma_pdsp", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_pdp10", (Term.prim_mk_const { Name = "elf_ma_pdp10", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_pdp10", (Term.prim_mk_const { Name = "elf_ma_pdp10", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_pdp11", (Term.prim_mk_const { Name = "elf_ma_pdp11", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_pdp11", (Term.prim_mk_const { Name = "elf_ma_pdp11", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_fx66", (Term.prim_mk_const { Name = "elf_ma_fx66", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_fx66", (Term.prim_mk_const { Name = "elf_ma_fx66", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_st9plus", (Term.prim_mk_const { Name = "elf_ma_st9plus", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_st9plus", (Term.prim_mk_const { Name = "elf_ma_st9plus", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_st7", (Term.prim_mk_const { Name = "elf_ma_st7", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_st7", (Term.prim_mk_const { Name = "elf_ma_st7", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_68hc16", (Term.prim_mk_const { Name = "elf_ma_68hc16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_68hc16", (Term.prim_mk_const { Name = "elf_ma_68hc16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_68hc11", (Term.prim_mk_const { Name = "elf_ma_68hc11", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_68hc11", (Term.prim_mk_const { Name = "elf_ma_68hc11", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_68hc08", (Term.prim_mk_const { Name = "elf_ma_68hc08", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_68hc08", (Term.prim_mk_const { Name = "elf_ma_68hc08", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_68hc05", (Term.prim_mk_const { Name = "elf_ma_68hc05", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_68hc05", (Term.prim_mk_const { Name = "elf_ma_68hc05", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_svx", (Term.prim_mk_const { Name = "elf_ma_svx", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_svx", (Term.prim_mk_const { Name = "elf_ma_svx", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_st19", (Term.prim_mk_const { Name = "elf_ma_st19", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_st19", (Term.prim_mk_const { Name = "elf_ma_st19", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_vax", (Term.prim_mk_const { Name = "elf_ma_vax", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_vax", (Term.prim_mk_const { Name = "elf_ma_vax", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cris", (Term.prim_mk_const { Name = "elf_ma_cris", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_cris", (Term.prim_mk_const { Name = "elf_ma_cris", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_javelin", (Term.prim_mk_const { Name = "elf_ma_javelin", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_javelin", (Term.prim_mk_const { Name = "elf_ma_javelin", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_firepath", (Term.prim_mk_const { Name = "elf_ma_firepath", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_firepath", (Term.prim_mk_const { Name = "elf_ma_firepath", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_intel209", (Term.prim_mk_const { Name = "elf_ma_intel209", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_intel209", (Term.prim_mk_const { Name = "elf_ma_intel209", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_intel208", (Term.prim_mk_const { Name = "elf_ma_intel208", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_intel208", (Term.prim_mk_const { Name = "elf_ma_intel208", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_intel207", (Term.prim_mk_const { Name = "elf_ma_intel207", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_intel207", (Term.prim_mk_const { Name = "elf_ma_intel207", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_intel206", (Term.prim_mk_const { Name = "elf_ma_intel206", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_intel206", (Term.prim_mk_const { Name = "elf_ma_intel206", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_intel205", (Term.prim_mk_const { Name = "elf_ma_intel205", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_intel205", (Term.prim_mk_const { Name = "elf_ma_intel205", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_intel182", (Term.prim_mk_const { Name = "elf_ma_intel182", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_intel182", (Term.prim_mk_const { Name = "elf_ma_intel182", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_arm184", (Term.prim_mk_const { Name = "elf_ma_arm184", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_arm184", (Term.prim_mk_const { Name = "elf_ma_arm184", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved6", (Term.prim_mk_const { Name = "elf_ma_reserved6", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved6", (Term.prim_mk_const { Name = "elf_ma_reserved6", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved11", (Term.prim_mk_const { Name = "elf_ma_reserved11", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved11", (Term.prim_mk_const { Name = "elf_ma_reserved11", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved12", (Term.prim_mk_const { Name = "elf_ma_reserved12", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved12", (Term.prim_mk_const { Name = "elf_ma_reserved12", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved13", (Term.prim_mk_const { Name = "elf_ma_reserved13", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved13", (Term.prim_mk_const { Name = "elf_ma_reserved13", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved14", (Term.prim_mk_const { Name = "elf_ma_reserved14", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved14", (Term.prim_mk_const { Name = "elf_ma_reserved14", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved16", (Term.prim_mk_const { Name = "elf_ma_reserved16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved16", (Term.prim_mk_const { Name = "elf_ma_reserved16", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved24", (Term.prim_mk_const { Name = "elf_ma_reserved24", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved24", (Term.prim_mk_const { Name = "elf_ma_reserved24", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved25", (Term.prim_mk_const { Name = "elf_ma_reserved25", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved25", (Term.prim_mk_const { Name = "elf_ma_reserved25", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved26", (Term.prim_mk_const { Name = "elf_ma_reserved26", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved26", (Term.prim_mk_const { Name = "elf_ma_reserved26", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved27", (Term.prim_mk_const { Name = "elf_ma_reserved27", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved27", (Term.prim_mk_const { Name = "elf_ma_reserved27", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved28", (Term.prim_mk_const { Name = "elf_ma_reserved28", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved28", (Term.prim_mk_const { Name = "elf_ma_reserved28", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved29", (Term.prim_mk_const { Name = "elf_ma_reserved29", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved29", (Term.prim_mk_const { Name = "elf_ma_reserved29", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved30", (Term.prim_mk_const { Name = "elf_ma_reserved30", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved30", (Term.prim_mk_const { Name = "elf_ma_reserved30", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved31", (Term.prim_mk_const { Name = "elf_ma_reserved31", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved31", (Term.prim_mk_const { Name = "elf_ma_reserved31", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved32", (Term.prim_mk_const { Name = "elf_ma_reserved32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved32", (Term.prim_mk_const { Name = "elf_ma_reserved32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved33", (Term.prim_mk_const { Name = "elf_ma_reserved33", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved33", (Term.prim_mk_const { Name = "elf_ma_reserved33", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved34", (Term.prim_mk_const { Name = "elf_ma_reserved34", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved34", (Term.prim_mk_const { Name = "elf_ma_reserved34", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved35", (Term.prim_mk_const { Name = "elf_ma_reserved35", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved35", (Term.prim_mk_const { Name = "elf_ma_reserved35", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved121", (Term.prim_mk_const { Name = "elf_ma_reserved121", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved121", (Term.prim_mk_const { Name = "elf_ma_reserved121", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved122", (Term.prim_mk_const { Name = "elf_ma_reserved122", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved122", (Term.prim_mk_const { Name = "elf_ma_reserved122", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved123", (Term.prim_mk_const { Name = "elf_ma_reserved123", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved123", (Term.prim_mk_const { Name = "elf_ma_reserved123", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved124", (Term.prim_mk_const { Name = "elf_ma_reserved124", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved124", (Term.prim_mk_const { Name = "elf_ma_reserved124", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved125", (Term.prim_mk_const { Name = "elf_ma_reserved125", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved125", (Term.prim_mk_const { Name = "elf_ma_reserved125", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved126", (Term.prim_mk_const { Name = "elf_ma_reserved126", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved126", (Term.prim_mk_const { Name = "elf_ma_reserved126", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved127", (Term.prim_mk_const { Name = "elf_ma_reserved127", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved127", (Term.prim_mk_const { Name = "elf_ma_reserved127", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved128", (Term.prim_mk_const { Name = "elf_ma_reserved128", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved128", (Term.prim_mk_const { Name = "elf_ma_reserved128", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved129", (Term.prim_mk_const { Name = "elf_ma_reserved129", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved129", (Term.prim_mk_const { Name = "elf_ma_reserved129", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved130", (Term.prim_mk_const { Name = "elf_ma_reserved130", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved130", (Term.prim_mk_const { Name = "elf_ma_reserved130", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved143", (Term.prim_mk_const { Name = "elf_ma_reserved143", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved143", (Term.prim_mk_const { Name = "elf_ma_reserved143", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved144", (Term.prim_mk_const { Name = "elf_ma_reserved144", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved144", (Term.prim_mk_const { Name = "elf_ma_reserved144", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved145", (Term.prim_mk_const { Name = "elf_ma_reserved145", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved145", (Term.prim_mk_const { Name = "elf_ma_reserved145", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved146", (Term.prim_mk_const { Name = "elf_ma_reserved146", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved146", (Term.prim_mk_const { Name = "elf_ma_reserved146", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved147", (Term.prim_mk_const { Name = "elf_ma_reserved147", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved147", (Term.prim_mk_const { Name = "elf_ma_reserved147", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved148", (Term.prim_mk_const { Name = "elf_ma_reserved148", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved148", (Term.prim_mk_const { Name = "elf_ma_reserved148", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved149", (Term.prim_mk_const { Name = "elf_ma_reserved149", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved149", (Term.prim_mk_const { Name = "elf_ma_reserved149", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved150", (Term.prim_mk_const { Name = "elf_ma_reserved150", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved150", (Term.prim_mk_const { Name = "elf_ma_reserved150", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved151", (Term.prim_mk_const { Name = "elf_ma_reserved151", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved151", (Term.prim_mk_const { Name = "elf_ma_reserved151", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved152", (Term.prim_mk_const { Name = "elf_ma_reserved152", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved152", (Term.prim_mk_const { Name = "elf_ma_reserved152", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved153", (Term.prim_mk_const { Name = "elf_ma_reserved153", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved153", (Term.prim_mk_const { Name = "elf_ma_reserved153", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved154", (Term.prim_mk_const { Name = "elf_ma_reserved154", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved154", (Term.prim_mk_const { Name = "elf_ma_reserved154", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved155", (Term.prim_mk_const { Name = "elf_ma_reserved155", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved155", (Term.prim_mk_const { Name = "elf_ma_reserved155", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved156", (Term.prim_mk_const { Name = "elf_ma_reserved156", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved156", (Term.prim_mk_const { Name = "elf_ma_reserved156", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved157", (Term.prim_mk_const { Name = "elf_ma_reserved157", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved157", (Term.prim_mk_const { Name = "elf_ma_reserved157", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved158", (Term.prim_mk_const { Name = "elf_ma_reserved158", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved158", (Term.prim_mk_const { Name = "elf_ma_reserved158", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved159", (Term.prim_mk_const { Name = "elf_ma_reserved159", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ma_reserved159", (Term.prim_mk_const { Name = "elf_ma_reserved159", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ev_none", (Term.prim_mk_const { Name = "elf_ev_none", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ev_none", (Term.prim_mk_const { Name = "elf_ev_none", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ev_current", (Term.prim_mk_const { Name = "elf_ev_current", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ev_current", (Term.prim_mk_const { Name = "elf_ev_current", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_extended_version_number", (Term.prim_mk_const { Name = "is_valid_extended_version_number", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_extended_version_number", (Term.prim_mk_const { Name = "is_valid_extended_version_number", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_mag0", (Term.prim_mk_const { Name = "elf_ii_mag0", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_mag0", (Term.prim_mk_const { Name = "elf_ii_mag0", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_mag1", (Term.prim_mk_const { Name = "elf_ii_mag1", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_mag1", (Term.prim_mk_const { Name = "elf_ii_mag1", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_mag2", (Term.prim_mk_const { Name = "elf_ii_mag2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_mag2", (Term.prim_mk_const { Name = "elf_ii_mag2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_mag3", (Term.prim_mk_const { Name = "elf_ii_mag3", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_mag3", (Term.prim_mk_const { Name = "elf_ii_mag3", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_class", (Term.prim_mk_const { Name = "elf_ii_class", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_class", (Term.prim_mk_const { Name = "elf_ii_class", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_data", (Term.prim_mk_const { Name = "elf_ii_data", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_data", (Term.prim_mk_const { Name = "elf_ii_data", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_version", (Term.prim_mk_const { Name = "elf_ii_version", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_version", (Term.prim_mk_const { Name = "elf_ii_version", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_osabi", (Term.prim_mk_const { Name = "elf_ii_osabi", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_osabi", (Term.prim_mk_const { Name = "elf_ii_osabi", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_abiversion", (Term.prim_mk_const { Name = "elf_ii_abiversion", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_abiversion", (Term.prim_mk_const { Name = "elf_ii_abiversion", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_pad", (Term.prim_mk_const { Name = "elf_ii_pad", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_pad", (Term.prim_mk_const { Name = "elf_ii_pad", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_nident", (Term.prim_mk_const { Name = "elf_ii_nident", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_ii_nident", (Term.prim_mk_const { Name = "elf_ii_nident", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_mn_mag0", (Term.prim_mk_const { Name = "elf_mn_mag0", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_mn_mag0", (Term.prim_mk_const { Name = "elf_mn_mag0", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_mn_mag1", (Term.prim_mk_const { Name = "elf_mn_mag1", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_mn_mag1", (Term.prim_mk_const { Name = "elf_mn_mag1", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_mn_mag2", (Term.prim_mk_const { Name = "elf_mn_mag2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_mn_mag2", (Term.prim_mk_const { Name = "elf_mn_mag2", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_mn_mag3", (Term.prim_mk_const { Name = "elf_mn_mag3", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_mn_mag3", (Term.prim_mk_const { Name = "elf_mn_mag3", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_class_none", (Term.prim_mk_const { Name = "elf_class_none", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_class_none", (Term.prim_mk_const { Name = "elf_class_none", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_class_32", (Term.prim_mk_const { Name = "elf_class_32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_class_32", (Term.prim_mk_const { Name = "elf_class_32", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_class_64", (Term.prim_mk_const { Name = "elf_class_64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_class_64", (Term.prim_mk_const { Name = "elf_class_64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_data_none", (Term.prim_mk_const { Name = "elf_data_none", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_data_none", (Term.prim_mk_const { Name = "elf_data_none", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_data_2lsb", (Term.prim_mk_const { Name = "elf_data_2lsb", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_data_2lsb", (Term.prim_mk_const { Name = "elf_data_2lsb", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_data_2msb", (Term.prim_mk_const { Name = "elf_data_2msb", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_data_2msb", (Term.prim_mk_const { Name = "elf_data_2msb", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_none", (Term.prim_mk_const { Name = "elf_osabi_none", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_none", (Term.prim_mk_const { Name = "elf_osabi_none", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_hpux", (Term.prim_mk_const { Name = "elf_osabi_hpux", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_hpux", (Term.prim_mk_const { Name = "elf_osabi_hpux", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_netbsd", (Term.prim_mk_const { Name = "elf_osabi_netbsd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_netbsd", (Term.prim_mk_const { Name = "elf_osabi_netbsd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_gnu", (Term.prim_mk_const { Name = "elf_osabi_gnu", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_gnu", (Term.prim_mk_const { Name = "elf_osabi_gnu", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_linux", (Term.prim_mk_const { Name = "elf_osabi_linux", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_linux", (Term.prim_mk_const { Name = "elf_osabi_linux", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_solaris", (Term.prim_mk_const { Name = "elf_osabi_solaris", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_solaris", (Term.prim_mk_const { Name = "elf_osabi_solaris", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_aix", (Term.prim_mk_const { Name = "elf_osabi_aix", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_aix", (Term.prim_mk_const { Name = "elf_osabi_aix", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_irix", (Term.prim_mk_const { Name = "elf_osabi_irix", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_irix", (Term.prim_mk_const { Name = "elf_osabi_irix", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_freebsd", (Term.prim_mk_const { Name = "elf_osabi_freebsd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_freebsd", (Term.prim_mk_const { Name = "elf_osabi_freebsd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_tru64", (Term.prim_mk_const { Name = "elf_osabi_tru64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_tru64", (Term.prim_mk_const { Name = "elf_osabi_tru64", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_modesto", (Term.prim_mk_const { Name = "elf_osabi_modesto", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_modesto", (Term.prim_mk_const { Name = "elf_osabi_modesto", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_openbsd", (Term.prim_mk_const { Name = "elf_osabi_openbsd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_openbsd", (Term.prim_mk_const { Name = "elf_osabi_openbsd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_openvms", (Term.prim_mk_const { Name = "elf_osabi_openvms", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_openvms", (Term.prim_mk_const { Name = "elf_osabi_openvms", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_nsk", (Term.prim_mk_const { Name = "elf_osabi_nsk", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_nsk", (Term.prim_mk_const { Name = "elf_osabi_nsk", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_aros", (Term.prim_mk_const { Name = "elf_osabi_aros", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_aros", (Term.prim_mk_const { Name = "elf_osabi_aros", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_fenixos", (Term.prim_mk_const { Name = "elf_osabi_fenixos", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_fenixos", (Term.prim_mk_const { Name = "elf_osabi_fenixos", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_cloudabi", (Term.prim_mk_const { Name = "elf_osabi_cloudabi", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_cloudabi", (Term.prim_mk_const { Name = "elf_osabi_cloudabi", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_openvos", (Term.prim_mk_const { Name = "elf_osabi_openvos", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf_osabi_openvos", (Term.prim_mk_const { Name = "elf_osabi_openvos", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_architecture_defined_osabi_version", (Term.prim_mk_const { Name = "is_valid_architecture_defined_osabi_version", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_architecture_defined_osabi_version", (Term.prim_mk_const { Name = "is_valid_architecture_defined_osabi_version", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("ei_nident", (Term.prim_mk_const { Name = "ei_nident", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("ei_nident", (Term.prim_mk_const { Name = "ei_nident", Thy = "elf_header"}))
  val _ = update_grms temp_add_type "elf32_header"
  val _ = update_grms temp_add_type "elf32_header"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_header", (Term.prim_mk_const { Name = "recordtype.elf32_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf32_header", (Term.prim_mk_const { Name = "recordtype.elf32_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_CASE", (Term.prim_mk_const { Name = "elf32_header_CASE", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_size", (Term.prim_mk_const { Name = "elf32_header_size", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_ident", (Term.prim_mk_const { Name = "elf32_header_elf32_ident", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_type", (Term.prim_mk_const { Name = "elf32_header_elf32_type", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_machine", (Term.prim_mk_const { Name = "elf32_header_elf32_machine", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_version", (Term.prim_mk_const { Name = "elf32_header_elf32_version", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_entry", (Term.prim_mk_const { Name = "elf32_header_elf32_entry", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_phoff", (Term.prim_mk_const { Name = "elf32_header_elf32_phoff", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_shoff", (Term.prim_mk_const { Name = "elf32_header_elf32_shoff", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_flags", (Term.prim_mk_const { Name = "elf32_header_elf32_flags", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_ehsize", (Term.prim_mk_const { Name = "elf32_header_elf32_ehsize", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_phentsize", (Term.prim_mk_const { Name = "elf32_header_elf32_phentsize", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_phnum", (Term.prim_mk_const { Name = "elf32_header_elf32_phnum", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_shentsize", (Term.prim_mk_const { Name = "elf32_header_elf32_shentsize", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_shnum", (Term.prim_mk_const { Name = "elf32_header_elf32_shnum", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_shstrndx", (Term.prim_mk_const { Name = "elf32_header_elf32_shstrndx", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_ident_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_ident_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_type_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_type_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_machine_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_machine_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_version_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_version_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_entry_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_entry_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_phoff_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_phoff_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_shoff_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_shoff_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_flags_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_flags_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_ehsize_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_ehsize_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_phentsize_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_phentsize_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_phnum_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_phnum_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_shentsize_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_shentsize_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_shnum_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_shnum_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_elf32_shstrndx_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_shstrndx_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_ident", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_ident rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_type rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_machine", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_machine rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_version", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_version rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_entry", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_entry rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_phoff", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_phoff rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_shoff", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_shoff rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_flags rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_ehsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_ehsize rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_phentsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_phentsize rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_phnum", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_phnum rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_shentsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_shentsize rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_shnum", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_shnum rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf32_shstrndx", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf32_header)). elf_header$elf32_header_elf32_shstrndx rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_ident_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_ident_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_type_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_type_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_machine_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_machine_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_version_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_version_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_entry_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_entry_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_phoff_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_phoff_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_shoff_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_shoff_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_flags_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_flags_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_ehsize_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_ehsize_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_phentsize_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_phentsize_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_phnum_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_phnum_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_shentsize_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_shentsize_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_shnum_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_shnum_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_shstrndx_fupd", (Term.prim_mk_const { Name = "elf32_header_elf32_shstrndx_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_ident", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(bool[8] list$list) -> (bool[8] list$list)) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_ident_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_type_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_machine", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_machine_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_version", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_version_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_entry", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_entry_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_phoff", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_phoff_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_shoff", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_shoff_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_flags_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_ehsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_ehsize_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_phentsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_phentsize_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_phnum", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_phnum_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_shentsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_shentsize_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_shnum", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_shnum_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf32_shstrndx", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf32_header)). elf_header$elf32_header_elf32_shstrndx_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header", (Term.prim_mk_const { Name = "recordtype.elf32_header", Thy = "elf_header"}))
  val _ = update_grms temp_add_type "elf64_header"
  val _ = update_grms temp_add_type "elf64_header"




  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_header", (Term.prim_mk_const { Name = "recordtype.elf64_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("recordtype.elf64_header", (Term.prim_mk_const { Name = "recordtype.elf64_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_CASE", (Term.prim_mk_const { Name = "elf64_header_CASE", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_size", (Term.prim_mk_const { Name = "elf64_header_size", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_ident", (Term.prim_mk_const { Name = "elf64_header_elf64_ident", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_type", (Term.prim_mk_const { Name = "elf64_header_elf64_type", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_machine", (Term.prim_mk_const { Name = "elf64_header_elf64_machine", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_version", (Term.prim_mk_const { Name = "elf64_header_elf64_version", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_entry", (Term.prim_mk_const { Name = "elf64_header_elf64_entry", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_phoff", (Term.prim_mk_const { Name = "elf64_header_elf64_phoff", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_shoff", (Term.prim_mk_const { Name = "elf64_header_elf64_shoff", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_flags", (Term.prim_mk_const { Name = "elf64_header_elf64_flags", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_ehsize", (Term.prim_mk_const { Name = "elf64_header_elf64_ehsize", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_phentsize", (Term.prim_mk_const { Name = "elf64_header_elf64_phentsize", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_phnum", (Term.prim_mk_const { Name = "elf64_header_elf64_phnum", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_shentsize", (Term.prim_mk_const { Name = "elf64_header_elf64_shentsize", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_shnum", (Term.prim_mk_const { Name = "elf64_header_elf64_shnum", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_shstrndx", (Term.prim_mk_const { Name = "elf64_header_elf64_shstrndx", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_ident_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_ident_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_type_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_type_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_machine_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_machine_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_version_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_version_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_entry_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_entry_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_phoff_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_phoff_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_shoff_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_shoff_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_flags_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_flags_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_ehsize_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_ehsize_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_phentsize_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_phentsize_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_phnum_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_phnum_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_shentsize_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_shentsize_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_shnum_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_shnum_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_elf64_shstrndx_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_shstrndx_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_ident", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_ident rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_type rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_machine", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_machine rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_version", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_version rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_entry", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_entry rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_phoff", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_phoff rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_shoff", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_shoff rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_flags rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_ehsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_ehsize rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_phentsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_phentsize rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_phnum", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_phnum rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_shentsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_shentsize rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_shnum", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_shnum rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record selectelf64_shstrndx", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(rcd :(elf_header$elf64_header)). elf_header$elf64_header_elf64_shstrndx rcd"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_ident_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_ident_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_type_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_type_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_machine_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_machine_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_version_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_version_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_entry_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_entry_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_phoff_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_phoff_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_shoff_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_shoff_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_flags_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_flags_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_ehsize_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_ehsize_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_phentsize_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_phentsize_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_phnum_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_phnum_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_shentsize_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_shentsize_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_shnum_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_shnum_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_shstrndx_fupd", (Term.prim_mk_const { Name = "elf64_header_elf64_shstrndx_fupd", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_ident", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :(bool[8] list$list) -> (bool[8] list$list)) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_ident_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_type", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_type_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_machine", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_machine_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_version", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_version_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_entry", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_entry_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_phoff", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_phoff_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_shoff", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[64] -> bool[64]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_shoff_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_flags", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[32] -> bool[32]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_flags_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_ehsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_ehsize_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_phentsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_phentsize_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_phnum", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_phnum_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_shentsize", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_shentsize_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_shnum", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_shnum_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       (" _ record fupdateelf64_shstrndx", (#2 (parse_from_grammars min_grammars)[QUOTE "\\(f :bool[16] -> bool[16]) (x :(elf_header$elf64_header)). elf_header$elf64_header_elf64_shstrndx_fupd f x"]))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header", (Term.prim_mk_const { Name = "recordtype.elf64_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf32_header", (Term.prim_mk_const { Name = "is_valid_elf32_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf32_header", (Term.prim_mk_const { Name = "is_valid_elf32_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf64_header", (Term.prim_mk_const { Name = "is_valid_elf64_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf64_header", (Term.prim_mk_const { Name = "is_valid_elf64_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_compare", (Term.prim_mk_const { Name = "elf32_header_compare", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf32_header_compare", (Term.prim_mk_const { Name = "elf32_header_compare", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_header_elf32_header_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_header_elf32_header_dict", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_header_elf32_header_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_header_elf32_header_dict", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_compare", (Term.prim_mk_const { Name = "elf64_header_compare", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("elf64_header_compare", (Term.prim_mk_const { Name = "elf64_header_compare", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_header_elf64_header_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_header_elf64_header_dict", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Basic_classes_Ord_Elf_header_elf64_header_dict", (Term.prim_mk_const { Name = "instance_Basic_classes_Ord_Elf_header_elf64_header_dict", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_executable_file", (Term.prim_mk_const { Name = "is_elf32_executable_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_executable_file", (Term.prim_mk_const { Name = "is_elf32_executable_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_executable_file", (Term.prim_mk_const { Name = "is_elf64_executable_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_executable_file", (Term.prim_mk_const { Name = "is_elf64_executable_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_shared_object_file", (Term.prim_mk_const { Name = "is_elf32_shared_object_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_shared_object_file", (Term.prim_mk_const { Name = "is_elf32_shared_object_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_shared_object_file", (Term.prim_mk_const { Name = "is_elf64_shared_object_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_shared_object_file", (Term.prim_mk_const { Name = "is_elf64_shared_object_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_relocatable_file", (Term.prim_mk_const { Name = "is_elf32_relocatable_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_relocatable_file", (Term.prim_mk_const { Name = "is_elf32_relocatable_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_relocatable_file", (Term.prim_mk_const { Name = "is_elf64_relocatable_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_relocatable_file", (Term.prim_mk_const { Name = "is_elf64_relocatable_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_linkable_file", (Term.prim_mk_const { Name = "is_elf32_linkable_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_linkable_file", (Term.prim_mk_const { Name = "is_elf32_linkable_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_linkable_file", (Term.prim_mk_const { Name = "is_elf64_linkable_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_linkable_file", (Term.prim_mk_const { Name = "is_elf64_linkable_file", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_machine_architecture", (Term.prim_mk_const { Name = "get_elf32_machine_architecture", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_machine_architecture", (Term.prim_mk_const { Name = "get_elf32_machine_architecture", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_machine_architecture", (Term.prim_mk_const { Name = "get_elf64_machine_architecture", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_machine_architecture", (Term.prim_mk_const { Name = "get_elf64_machine_architecture", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_osabi", (Term.prim_mk_const { Name = "get_elf32_osabi", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_osabi", (Term.prim_mk_const { Name = "get_elf32_osabi", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_osabi", (Term.prim_mk_const { Name = "get_elf64_osabi", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_osabi", (Term.prim_mk_const { Name = "get_elf64_osabi", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_data_encoding", (Term.prim_mk_const { Name = "get_elf32_data_encoding", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_data_encoding", (Term.prim_mk_const { Name = "get_elf32_data_encoding", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_data_encoding", (Term.prim_mk_const { Name = "get_elf64_data_encoding", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_data_encoding", (Term.prim_mk_const { Name = "get_elf64_data_encoding", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_file_class", (Term.prim_mk_const { Name = "get_elf32_file_class", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_file_class", (Term.prim_mk_const { Name = "get_elf32_file_class", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_file_class", (Term.prim_mk_const { Name = "get_elf64_file_class", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_file_class", (Term.prim_mk_const { Name = "get_elf64_file_class", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_version_number", (Term.prim_mk_const { Name = "get_elf32_version_number", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_version_number", (Term.prim_mk_const { Name = "get_elf32_version_number", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_version_number", (Term.prim_mk_const { Name = "get_elf64_version_number", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_version_number", (Term.prim_mk_const { Name = "get_elf64_version_number", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf32_version_numer", (Term.prim_mk_const { Name = "is_valid_elf32_version_numer", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf32_version_numer", (Term.prim_mk_const { Name = "is_valid_elf32_version_numer", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf64_version_numer", (Term.prim_mk_const { Name = "is_valid_elf64_version_numer", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_valid_elf64_version_numer", (Term.prim_mk_const { Name = "is_valid_elf64_version_numer", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_abi_version", (Term.prim_mk_const { Name = "get_elf32_abi_version", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_abi_version", (Term.prim_mk_const { Name = "get_elf32_abi_version", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_abi_version", (Term.prim_mk_const { Name = "get_elf64_abi_version", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_abi_version", (Term.prim_mk_const { Name = "get_elf64_abi_version", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("deduce_endianness", (Term.prim_mk_const { Name = "deduce_endianness", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("deduce_endianness", (Term.prim_mk_const { Name = "deduce_endianness", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_header_endianness", (Term.prim_mk_const { Name = "get_elf32_header_endianness", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_header_endianness", (Term.prim_mk_const { Name = "get_elf32_header_endianness", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_header_endianness", (Term.prim_mk_const { Name = "get_elf64_header_endianness", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_header_endianness", (Term.prim_mk_const { Name = "get_elf64_header_endianness", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("has_elf32_header_associated_entry_point", (Term.prim_mk_const { Name = "has_elf32_header_associated_entry_point", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("has_elf32_header_associated_entry_point", (Term.prim_mk_const { Name = "has_elf32_header_associated_entry_point", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("has_elf64_header_associated_entry_point", (Term.prim_mk_const { Name = "has_elf64_header_associated_entry_point", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("has_elf64_header_associated_entry_point", (Term.prim_mk_const { Name = "has_elf64_header_associated_entry_point", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("has_elf32_header_string_table", (Term.prim_mk_const { Name = "has_elf32_header_string_table", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("has_elf32_header_string_table", (Term.prim_mk_const { Name = "has_elf32_header_string_table", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("has_elf64_header_string_table", (Term.prim_mk_const { Name = "has_elf64_header_string_table", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("has_elf64_header_string_table", (Term.prim_mk_const { Name = "has_elf64_header_string_table", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_section_size_in_section_header_table", (Term.prim_mk_const { Name = "is_elf32_header_section_size_in_section_header_table", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_section_size_in_section_header_table", (Term.prim_mk_const { Name = "is_elf32_header_section_size_in_section_header_table", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_header_section_size_in_section_header_table", (Term.prim_mk_const { Name = "is_elf64_header_section_size_in_section_header_table", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_header_section_size_in_section_header_table", (Term.prim_mk_const { Name = "is_elf64_header_section_size_in_section_header_table", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_string_table_index_in_link", (Term.prim_mk_const { Name = "is_elf32_header_string_table_index_in_link", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_string_table_index_in_link", (Term.prim_mk_const { Name = "is_elf32_header_string_table_index_in_link", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_header_string_table_index_in_link", (Term.prim_mk_const { Name = "is_elf64_header_string_table_index_in_link", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_header_string_table_index_in_link", (Term.prim_mk_const { Name = "is_elf64_header_string_table_index_in_link", Thy = "elf_header"}))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="elf_header",Name="hdr_print_bundle"}, T"prod" "pair"
 [(T"num" "num" [] --> T"list" "list" [T"char" "string" []]),
  (T"num" "num" [] --> T"list" "list" [T"char" "string" []])])
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf_ident", (Term.prim_mk_const { Name = "read_elf_ident", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf_ident", (Term.prim_mk_const { Name = "read_elf_ident", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_header", (Term.prim_mk_const { Name = "bytes_of_elf32_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf32_header", (Term.prim_mk_const { Name = "bytes_of_elf32_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_header", (Term.prim_mk_const { Name = "bytes_of_elf64_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("bytes_of_elf64_header", (Term.prim_mk_const { Name = "bytes_of_elf64_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_padding_correct", (Term.prim_mk_const { Name = "is_elf32_header_padding_correct", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_padding_correct", (Term.prim_mk_const { Name = "is_elf32_header_padding_correct", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_magic_number_correct", (Term.prim_mk_const { Name = "is_magic_number_correct", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_magic_number_correct", (Term.prim_mk_const { Name = "is_magic_number_correct", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_header", (Term.prim_mk_const { Name = "read_elf32_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf32_header", (Term.prim_mk_const { Name = "read_elf32_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_header", (Term.prim_mk_const { Name = "read_elf64_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("read_elf64_header", (Term.prim_mk_const { Name = "read_elf64_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_class_correct", (Term.prim_mk_const { Name = "is_elf32_header_class_correct", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_class_correct", (Term.prim_mk_const { Name = "is_elf32_header_class_correct", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_header_class_correct", (Term.prim_mk_const { Name = "is_elf64_header_class_correct", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_header_class_correct", (Term.prim_mk_const { Name = "is_elf64_header_class_correct", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_version_correct", (Term.prim_mk_const { Name = "is_elf32_header_version_correct", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_version_correct", (Term.prim_mk_const { Name = "is_elf32_header_version_correct", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_header_version_correct", (Term.prim_mk_const { Name = "is_elf64_header_version_correct", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_header_version_correct", (Term.prim_mk_const { Name = "is_elf64_header_version_correct", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_valid", (Term.prim_mk_const { Name = "is_elf32_header_valid", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_valid", (Term.prim_mk_const { Name = "is_elf32_header_valid", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_header_program_table_size", (Term.prim_mk_const { Name = "get_elf32_header_program_table_size", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_header_program_table_size", (Term.prim_mk_const { Name = "get_elf32_header_program_table_size", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_header_program_table_size", (Term.prim_mk_const { Name = "get_elf64_header_program_table_size", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_header_program_table_size", (Term.prim_mk_const { Name = "get_elf64_header_program_table_size", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_section_table_present", (Term.prim_mk_const { Name = "is_elf32_header_section_table_present", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf32_header_section_table_present", (Term.prim_mk_const { Name = "is_elf32_header_section_table_present", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_header_section_table_present", (Term.prim_mk_const { Name = "is_elf64_header_section_table_present", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("is_elf64_header_section_table_present", (Term.prim_mk_const { Name = "is_elf64_header_section_table_present", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_header_section_table_size", (Term.prim_mk_const { Name = "get_elf32_header_section_table_size", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf32_header_section_table_size", (Term.prim_mk_const { Name = "get_elf32_header_section_table_size", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_header_section_table_size", (Term.prim_mk_const { Name = "get_elf64_header_section_table_size", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("get_elf64_header_section_table_size", (Term.prim_mk_const { Name = "get_elf64_header_section_table_size", Thy = "elf_header"}))
  val elf_header_grammars = Parse.current_lgrms()
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG elf32_header_Axiom,
           case_def=elf32_header_case_def,
           case_cong=elf32_header_case_cong,
           induction=ORIG elf32_header_induction,
           nchotomy=elf32_header_nchotomy,
           size=SOME(Parse.Term`(elf_header$elf32_header_size) :(elf_header$elf32_header) -> (num$num)`,
                     ORIG elf32_header_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf32_header_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf32_ident",T"list" "list"
                 [T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"one" "one" []]]]]]),
 ("elf32_type",T"fcp" "cart"
                [bool,
                 T"fcp" "bit0"
                  [T"fcp" "bit0"
                    [T"fcp" "bit0"
                      [T"fcp" "bit0" [T"one" "one" []]]]]]),
 ("elf32_machine",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"one" "one" []]]]]]),
 ("elf32_version",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf32_entry",T"fcp" "cart"
                 [bool,
                  T"fcp" "bit0"
                   [T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"one" "one" []]]]]]]),
 ("elf32_phoff",T"fcp" "cart"
                 [bool,
                  T"fcp" "bit0"
                   [T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"one" "one" []]]]]]]),
 ("elf32_shoff",T"fcp" "cart"
                 [bool,
                  T"fcp" "bit0"
                   [T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"one" "one" []]]]]]]),
 ("elf32_flags",T"fcp" "cart"
                 [bool,
                  T"fcp" "bit0"
                   [T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"one" "one" []]]]]]]),
 ("elf32_ehsize",T"fcp" "cart"
                  [bool,
                   T"fcp" "bit0"
                    [T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"one" "one" []]]]]]),
 ("elf32_phentsize",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]),
 ("elf32_phnum",T"fcp" "cart"
                 [bool,
                  T"fcp" "bit0"
                   [T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"one" "one" []]]]]]),
 ("elf32_shentsize",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]),
 ("elf32_shnum",T"fcp" "cart"
                 [bool,
                  T"fcp" "bit0"
                   [T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"one" "one" []]]]]]),
 ("elf32_shstrndx",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"one" "one" []]]]]])] end,
           accessors=Drule.CONJUNCTS elf32_header_accessors,
           updates=Drule.CONJUNCTS elf32_header_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf32_header_accessors, elf32_header_updates_eq_literal, elf32_header_accfupds, elf32_header_fupdfupds, elf32_header_literal_11, elf32_header_fupdfupds_comp, elf32_header_fupdcanon, elf32_header_fupdcanon_comp] tyinfo0
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
          {ax=ORIG elf64_header_Axiom,
           case_def=elf64_header_case_def,
           case_cong=elf64_header_case_cong,
           induction=ORIG elf64_header_induction,
           nchotomy=elf64_header_nchotomy,
           size=SOME(Parse.Term`(elf_header$elf64_header_size) :(elf_header$elf64_header) -> (num$num)`,
                     ORIG elf64_header_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME elf64_header_11,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[("elf64_ident",T"list" "list"
                 [T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"one" "one" []]]]]]),
 ("elf64_type",T"fcp" "cart"
                [bool,
                 T"fcp" "bit0"
                  [T"fcp" "bit0"
                    [T"fcp" "bit0"
                      [T"fcp" "bit0" [T"one" "one" []]]]]]),
 ("elf64_machine",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"one" "one" []]]]]]),
 ("elf64_version",T"fcp" "cart"
                   [bool,
                    T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]),
 ("elf64_entry",T"fcp" "cart"
                 [bool,
                  T"fcp" "bit0"
                   [T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]]),
 ("elf64_phoff",T"fcp" "cart"
                 [bool,
                  T"fcp" "bit0"
                   [T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]]),
 ("elf64_shoff",T"fcp" "cart"
                 [bool,
                  T"fcp" "bit0"
                   [T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]]]),
 ("elf64_flags",T"fcp" "cart"
                 [bool,
                  T"fcp" "bit0"
                   [T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"one" "one" []]]]]]]),
 ("elf64_ehsize",T"fcp" "cart"
                  [bool,
                   T"fcp" "bit0"
                    [T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"one" "one" []]]]]]),
 ("elf64_phentsize",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]),
 ("elf64_phnum",T"fcp" "cart"
                 [bool,
                  T"fcp" "bit0"
                   [T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"one" "one" []]]]]]),
 ("elf64_shentsize",T"fcp" "cart"
                     [bool,
                      T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"fcp" "bit0"
                           [T"fcp" "bit0"
                             [T"one" "one" []]]]]]),
 ("elf64_shnum",T"fcp" "cart"
                 [bool,
                  T"fcp" "bit0"
                   [T"fcp" "bit0"
                     [T"fcp" "bit0"
                       [T"fcp" "bit0"
                         [T"one" "one" []]]]]]),
 ("elf64_shstrndx",T"fcp" "cart"
                    [bool,
                     T"fcp" "bit0"
                      [T"fcp" "bit0"
                        [T"fcp" "bit0"
                          [T"fcp" "bit0"
                            [T"one" "one" []]]]]])] end,
           accessors=Drule.CONJUNCTS elf64_header_accessors,
           updates=Drule.CONJUNCTS elf64_header_fn_updates,
           recognizers=[],
           destructors=[]}
        val tyinfo0 = RecordType.update_tyinfo NONE [elf64_header_accessors, elf64_header_updates_eq_literal, elf64_header_accfupds, elf64_header_fupdfupds, elf64_header_literal_11, elf64_header_fupdfupds_comp, elf64_header_fupdcanon, elf64_header_fupdcanon_comp] tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "elf_header",
    thydataty = "compute",
    data =
        "elf_header.shn_undef_def elf_header.shn_xindex_def elf_header.get_elf64_header_section_table_size_def elf_header.get_elf32_header_section_table_size_def elf_header.is_elf64_header_section_table_present_def elf_header.is_elf32_header_section_table_present_def elf_header.get_elf64_header_program_table_size_def elf_header.get_elf32_header_program_table_size_def elf_header.is_elf32_header_valid_def elf_header.is_elf64_header_version_correct_def elf_header.is_elf32_header_version_correct_def elf_header.is_elf64_header_class_correct_def elf_header.is_elf32_header_class_correct_def elf_header.read_elf64_header_def elf_header.read_elf32_header_def elf_header.is_magic_number_correct_def elf_header.is_elf32_header_padding_correct_def elf_header.bytes_of_elf64_header_def elf_header.bytes_of_elf32_header_def elf_header.read_elf_ident_def elf_header.is_elf64_header_string_table_index_in_link_def elf_header.is_elf32_header_string_table_index_in_link_def elf_header.is_elf64_header_section_size_in_section_header_table_def elf_header.is_elf32_header_section_size_in_section_header_table_def elf_header.has_elf64_header_string_table_def elf_header.has_elf32_header_string_table_def elf_header.has_elf64_header_associated_entry_point_def elf_header.has_elf32_header_associated_entry_point_def elf_header.get_elf64_header_endianness_def elf_header.get_elf32_header_endianness_def elf_header.deduce_endianness_def elf_header.get_elf64_abi_version_def elf_header.get_elf32_abi_version_def elf_header.is_valid_elf64_version_numer_def elf_header.is_valid_elf32_version_numer_def elf_header.get_elf64_version_number_def elf_header.get_elf32_version_number_def elf_header.get_elf64_file_class_def elf_header.get_elf32_file_class_def elf_header.get_elf64_data_encoding_def elf_header.get_elf32_data_encoding_def elf_header.get_elf64_osabi_def elf_header.get_elf32_osabi_def elf_header.get_elf64_machine_architecture_def elf_header.get_elf32_machine_architecture_def elf_header.is_elf64_linkable_file_def elf_header.is_elf32_linkable_file_def elf_header.is_elf64_relocatable_file_def elf_header.is_elf32_relocatable_file_def elf_header.is_elf64_shared_object_file_def elf_header.is_elf32_shared_object_file_def elf_header.is_elf64_executable_file_def elf_header.is_elf32_executable_file_def elf_header.instance_Basic_classes_Ord_Elf_header_elf64_header_dict_def elf_header.elf64_header_compare_def elf_header.instance_Basic_classes_Ord_Elf_header_elf32_header_dict_def elf_header.elf32_header_compare_def elf_header.is_valid_elf64_header_def elf_header.is_valid_elf32_header_def elf_header.ei_nident_def elf_header.is_valid_architecture_defined_osabi_version_def elf_header.elf_osabi_openvos_def elf_header.elf_osabi_cloudabi_def elf_header.elf_osabi_fenixos_def elf_header.elf_osabi_aros_def elf_header.elf_osabi_nsk_def elf_header.elf_osabi_openvms_def elf_header.elf_osabi_openbsd_def elf_header.elf_osabi_modesto_def elf_header.elf_osabi_tru64_def elf_header.elf_osabi_freebsd_def elf_header.elf_osabi_irix_def elf_header.elf_osabi_aix_def elf_header.elf_osabi_solaris_def elf_header.elf_osabi_linux_def elf_header.elf_osabi_gnu_def elf_header.elf_osabi_netbsd_def elf_header.elf_osabi_hpux_def elf_header.elf_osabi_none_def elf_header.elf_data_2msb_def elf_header.elf_data_2lsb_def elf_header.elf_data_none_def elf_header.elf_class_64_def elf_header.elf_class_32_def elf_header.elf_class_none_def elf_header.elf_mn_mag3_def elf_header.elf_mn_mag2_def elf_header.elf_mn_mag1_def elf_header.elf_mn_mag0_def elf_header.elf_ii_nident_def elf_header.elf_ii_pad_def elf_header.elf_ii_abiversion_def elf_header.elf_ii_osabi_def elf_header.elf_ii_version_def elf_header.elf_ii_data_def elf_header.elf_ii_class_def elf_header.elf_ii_mag3_def elf_header.elf_ii_mag2_def elf_header.elf_ii_mag1_def elf_header.elf_ii_mag0_def elf_header.is_valid_extended_version_number_def elf_header.elf_ev_current_def elf_header.elf_ev_none_def elf_header.elf_ma_reserved159_def elf_header.elf_ma_reserved158_def elf_header.elf_ma_reserved157_def elf_header.elf_ma_reserved156_def elf_header.elf_ma_reserved155_def elf_header.elf_ma_reserved154_def elf_header.elf_ma_reserved153_def elf_header.elf_ma_reserved152_def elf_header.elf_ma_reserved151_def elf_header.elf_ma_reserved150_def elf_header.elf_ma_reserved149_def elf_header.elf_ma_reserved148_def elf_header.elf_ma_reserved147_def elf_header.elf_ma_reserved146_def elf_header.elf_ma_reserved145_def elf_header.elf_ma_reserved144_def elf_header.elf_ma_reserved143_def elf_header.elf_ma_reserved130_def elf_header.elf_ma_reserved129_def elf_header.elf_ma_reserved128_def elf_header.elf_ma_reserved127_def elf_header.elf_ma_reserved126_def elf_header.elf_ma_reserved125_def elf_header.elf_ma_reserved124_def elf_header.elf_ma_reserved123_def elf_header.elf_ma_reserved122_def elf_header.elf_ma_reserved121_def elf_header.elf_ma_reserved35_def elf_header.elf_ma_reserved34_def elf_header.elf_ma_reserved33_def elf_header.elf_ma_reserved32_def elf_header.elf_ma_reserved31_def elf_header.elf_ma_reserved30_def elf_header.elf_ma_reserved29_def elf_header.elf_ma_reserved28_def elf_header.elf_ma_reserved27_def elf_header.elf_ma_reserved26_def elf_header.elf_ma_reserved25_def elf_header.elf_ma_reserved24_def elf_header.elf_ma_reserved16_def elf_header.elf_ma_reserved14_def elf_header.elf_ma_reserved13_def elf_header.elf_ma_reserved12_def elf_header.elf_ma_reserved11_def elf_header.elf_ma_reserved6_def elf_header.elf_ma_arm184_def elf_header.elf_ma_intel182_def elf_header.elf_ma_intel205_def elf_header.elf_ma_intel206_def elf_header.elf_ma_intel207_def elf_header.elf_ma_intel208_def elf_header.elf_ma_intel209_def elf_header.elf_ma_firepath_def elf_header.elf_ma_javelin_def elf_header.elf_ma_cris_def elf_header.elf_ma_vax_def elf_header.elf_ma_st19_def elf_header.elf_ma_svx_def elf_header.elf_ma_68hc05_def elf_header.elf_ma_68hc08_def elf_header.elf_ma_68hc11_def elf_header.elf_ma_68hc16_def elf_header.elf_ma_st7_def elf_header.elf_ma_st9plus_def elf_header.elf_ma_fx66_def elf_header.elf_ma_pdp11_def elf_header.elf_ma_pdp10_def elf_header.elf_ma_pdsp_def elf_header.elf_ma_x86_64_def elf_header.elf_ma_tinyj_def elf_header.elf_ma_st100_def elf_header.elf_ma_me16_def elf_header.elf_ma_starcore_def elf_header.elf_ma_ndr1_def elf_header.elf_ma_ncpu_def elf_header.elf_ma_pcp_def elf_header.elf_ma_mma_def elf_header.elf_ma_68hc12_def elf_header.elf_ma_coldfire_def elf_header.elf_ma_mips_x_def elf_header.elf_ma_ia_64_def elf_header.elf_ma_h8_500_def elf_header.elf_ma_h8s_def elf_header.elf_ma_h8_300h_def elf_header.elf_ma_h8_300_def elf_header.elf_ma_arc_def elf_header.elf_ma_tricore_def elf_header.elf_ma_sparcv9_def elf_header.elf_ma_sh_def elf_header.elf_ma_alpha_def elf_header.elf_ma_arm_def elf_header.elf_ma_rce_def elf_header.elf_ma_rh32_def elf_header.elf_ma_fr20_def elf_header.elf_ma_v800_def elf_header.elf_ma_spu_def elf_header.elf_ma_s390_def elf_header.elf_ma_ppc64_def elf_header.elf_ma_ppc_def elf_header.elf_ma_960_def elf_header.elf_ma_sparc32plus_def elf_header.elf_ma_vpp500_def elf_header.elf_ma_parisc_def elf_header.elf_ma_mips_rs3_le_def elf_header.elf_ma_s370_def elf_header.elf_ma_mips_def elf_header.elf_ma_860_def elf_header.elf_ma_88k_def elf_header.elf_ma_68k_def elf_header.elf_ma_386_def elf_header.elf_ma_sparc_def elf_header.elf_ma_m32_def elf_header.elf_ma_none_def elf_header.elf_ma_m32c_def elf_header.elf_ma_ce_def elf_header.elf_ma_dspic30f_def elf_header.elf_ma_m16c_def elf_header.elf_ma_c166_def elf_header.elf_ma_xgate_def elf_header.elf_ma_crx_def elf_header.elf_ma_altera_nios2_def elf_header.elf_ma_dxp_def elf_header.elf_ma_excess_def elf_header.elf_ma_unicore_def elf_header.elf_ma_arca_def elf_header.elf_ma_sep_def elf_header.elf_ma_se_c33_def elf_header.elf_ma_blackfin_def elf_header.elf_ma_msp430_def elf_header.elf_ma_f2mc16_def elf_header.elf_ma_cr_def elf_header.elf_ma_max_def elf_header.elf_ma_ip2k_def elf_header.elf_ma_st200_def elf_header.elf_ma_snp1k_def elf_header.elf_ma_tpc_def elf_header.elf_ma_ns32k_def elf_header.elf_ma_tmm_gpp_def elf_header.elf_ma_videocore_def elf_header.elf_ma_xtensa_def elf_header.elf_ma_arc_compact_def elf_header.elf_ma_openrisc_def elf_header.elf_ma_pj_def elf_header.elf_ma_mn10200_def elf_header.elf_ma_mn10300_def elf_header.elf_ma_m32r_def elf_header.elf_ma_v850_def elf_header.elf_ma_d30v_def elf_header.elf_ma_d10v_def elf_header.elf_ma_fr30_def elf_header.elf_ma_avr_def elf_header.elf_ma_prism_def elf_header.elf_ma_huany_def elf_header.elf_ma_mmix_def elf_header.elf_ma_zsp_def elf_header.elf_ma_mmdsp_plus_def elf_header.elf_ma_c5500_def elf_header.elf_ma_c2000_def elf_header.elf_ma_c6000_def elf_header.elf_ma_c17_def elf_header.elf_ma_latticemico32_def elf_header.elf_ma_videocore3_def elf_header.elf_ma_dsp24_def elf_header.elf_ma_ccore7_def elf_header.elf_ma_ecog2_def elf_header.elf_ma_sharc_def elf_header.elf_ma_rs08_def elf_header.elf_ma_tsk3000_def elf_header.elf_ma_etpu_def elf_header.elf_ma_cr16_def elf_header.elf_ma_ecog16_def elf_header.elf_ma_mcst_elbrus_def elf_header.elf_ma_metag_def elf_header.elf_ma_rx_def elf_header.elf_ma_craynv2_def elf_header.elf_ma_manik_def elf_header.elf_ma_ximo16_def elf_header.elf_ma_maxq30_def elf_header.elf_ma_ecog1x_def elf_header.elf_ma_nds32_def elf_header.elf_ma_stxp7x_def elf_header.elf_ma_8051_def elf_header.elf_ma_qdsp6_def elf_header.elf_ma_trimedia_def elf_header.elf_ma_r32c_def elf_header.elf_ma_cypress_def elf_header.elf_ma_tilegx_def elf_header.elf_ma_cuda_def elf_header.elf_ma_microblaze_def elf_header.elf_ma_tilepro_def elf_header.elf_ma_tile64_def elf_header.elf_ma_stm8_def elf_header.elf_ma_avr32_def elf_header.elf_ma_aarch64_def elf_header.elf_ma_k10m_def elf_header.elf_ma_l10m_def elf_header.elf_ma_sle9x_def elf_header.elf_ma_cloudshield_def elf_header.elf_ma_corea_1st_def elf_header.elf_ma_corea_2nd_def elf_header.elf_ma_arc_compact2_def elf_header.elf_ma_open8_def elf_header.elf_ma_rl78_def elf_header.elf_ma_videocore5_def elf_header.elf_ma_78kor_def elf_header.elf_ma_5600ex_def elf_header.elf_ma_ba1_def elf_header.elf_ma_ba2_def elf_header.elf_ma_xcore_def elf_header.elf_ma_mchp_pic_def elf_header.elf_ma_km32_def elf_header.elf_ma_kmx32_def elf_header.elf_ma_kmx16_def elf_header.elf_ma_kmx8_def elf_header.elf_ma_kvarc_def elf_header.elf_ma_cdp_def elf_header.elf_ma_coge_def elf_header.elf_ma_cool_def elf_header.elf_ma_norc_def elf_header.elf_ma_kalimba_def elf_header.elf_ma_z80_def elf_header.elf_ma_visium_def elf_header.elf_ma_ft32_def elf_header.elf_ma_moxie_def elf_header.elf_ma_amdgpu_def elf_header.elf_ma_riscv_def elf_header.is_processor_specific_object_file_type_value_def elf_header.is_operating_system_specific_object_file_type_value_def elf_header.elf_ft_hi_proc_def elf_header.elf_ft_lo_proc_def elf_header.elf_ft_hi_os_def elf_header.elf_ft_lo_os_def elf_header.elf_ft_core_def elf_header.elf_ft_dyn_def elf_header.elf_ft_exec_def elf_header.elf_ft_rel_def elf_header.elf_ft_none_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "elf_header"
end
