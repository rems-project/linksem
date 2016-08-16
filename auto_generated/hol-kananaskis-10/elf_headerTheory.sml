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
          Arbnum.fromString "1471355161",
          Arbnum.fromString "843300")
          [("elf_types_native_uint",
           Arbnum.fromString "1471355144",
           Arbnum.fromString "97434"),
           ("default_printing",
           Arbnum.fromString "1471355077",
           Arbnum.fromString "721005"),
           ("lem_set",
           Arbnum.fromString "1471269250",
           Arbnum.fromString "313480")];
  val _ = Theory.incorporate_types "elf_header"
       [("elf64_header", 0), ("elf32_header", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("list", "list"), ID("string", "char"),
   ID("num", "num"), ID("elf_header", "elf64_header"), ID("pair", "prod"),
   ID("elf_header", "elf32_header"), ID("fcp", "cart"), ID("fcp", "bit0"),
   ID("one", "one"), ID("min", "bool"), ID("error", "error"),
   ID("byte_sequence", "byte_sequence"), ID("show", "Show_class"),
   ID("lem_basic_classes", "Ord_class"), ID("endianness", "endianness"),
   ID("lem_basic_classes", "ordering"), ID("ind_type", "recspace"),
   ID("min", "ind"), ID("bool", "!"), ID("arithmetic", "*"),
   ID("arithmetic", "+"), ID("pair", ","), ID("bool", "/\\"),
   ID("num", "0"), ID("prim_rec", "<"), ID("arithmetic", "<="),
   ID("min", "="), ID("option", "option"), ID("min", "==>"),
   ID("arithmetic", ">"), ID("arithmetic", ">="), ID("bool", "?"),
   ID("list", "APPEND"), ID("bool", "ARB"), ID("arithmetic", "BIT1"),
   ID("arithmetic", "BIT2"), ID("ind_type", "BOTTOM"),
   ID("endianness", "Big"), ID("string", "CHR"), ID("bool", "COND"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("pred_set", "EMPTY"), ID("lem_basic_classes", "EQ"),
   ID("lem_basic_classes", "GT"), ID("combin", "I"), ID("bool", "IN"),
   ID("pred_set", "INSERT"), ID("combin", "K"), ID("list", "LENGTH"),
   ID("bool", "LET"), ID("lem_basic_classes", "LT"),
   ID("endianness", "Little"), ID("list", "MAP"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreaterEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isGreater_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLessEqual_method_fupd"),
   ID("lem_basic_classes", "Ord_class_isLess_method_fupd"),
   ID("option", "SOME"), ID("show", "Show_class_show_method_fupd"),
   ID("list", "TAKE"), ID("bool", "TYPE_DEFINITION"),
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
   ID("endianness", "default_endianness"),
   ID("default_printing", "default_os_specific_print"),
   ID("default_printing", "default_proc_specific_print"),
   ID("elf_header", "ei_nident"), ID("elf_header", "elf32_header_CASE"),
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
   ID("elf_header", "instance_Basic_classes_Ord_Elf_header_elf32_header_dict"),
   ID("elf_header", "instance_Basic_classes_Ord_Elf_header_elf64_header_dict"),
   ID("elf_header", "instance_Show_Show_Elf_header_elf32_header_dict"),
   ID("elf_header", "instance_Show_Show_Elf_header_elf64_header_dict"),
   ID("elf_types_native_uint", "instance_Show_Show_Elf_types_native_uint_unsigned_char_dict"),
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
   ID("list", "list_size"), ID("words", "n2w"),
   ID("ASCIInumbers", "num_to_dec_string"), ID("combin", "o"),
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
   ID("elf_header", "shn_xindex"),
   ID("elf_header", "string_of_elf32_header"),
   ID("elf_header", "string_of_elf32_header_default"),
   ID("elf_header", "string_of_elf64_header"),
   ID("elf_header", "string_of_elf64_header_default"),
   ID("elf_header", "string_of_elf_data_encoding"),
   ID("elf_header", "string_of_elf_file_class"),
   ID("elf_header", "string_of_elf_file_type"),
   ID("elf_header", "string_of_elf_machine_architecture"),
   ID("elf_header", "string_of_elf_osabi_version"),
   ID("elf_header", "string_of_elf_version_number"),
   ID("endianness", "string_of_endianness"),
   ID("missing_pervasives", "string_of_list"),
   ID("missing_pervasives", "unlines"), ID("words", "w2n"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [2], TYOP [1, 0], TYOP [3], TYOP [0, 2, 1], TYOP [0, 3, 3],
   TYOP [0, 3, 4], TYOP [4], TYOP [0, 6, 1], TYOP [5, 3, 3],
   TYOP [0, 8, 7], TYOP [6], TYOP [0, 10, 1], TYOP [0, 8, 11], TYOP [9],
   TYOP [8, 13], TYOP [8, 14], TYOP [8, 15], TYOP [8, 16], TYOP [10],
   TYOP [7, 18, 17], TYOP [0, 19, 6], TYOP [0, 19, 20], TYOP [0, 19, 21],
   TYOP [0, 19, 22], TYOP [0, 19, 23], TYOP [0, 19, 24], TYOP [8, 17],
   TYOP [7, 18, 26], TYOP [0, 27, 25], TYOP [8, 26], TYOP [7, 18, 29],
   TYOP [0, 30, 28], TYOP [0, 30, 31], TYOP [0, 30, 32], TYOP [0, 27, 33],
   TYOP [0, 19, 34], TYOP [0, 19, 35], TYOP [7, 18, 16], TYOP [1, 37],
   TYOP [0, 38, 36], TYOP [0, 19, 10], TYOP [0, 19, 40], TYOP [0, 19, 41],
   TYOP [0, 19, 42], TYOP [0, 19, 43], TYOP [0, 19, 44], TYOP [0, 27, 45],
   TYOP [0, 27, 46], TYOP [0, 27, 47], TYOP [0, 27, 48], TYOP [0, 27, 49],
   TYOP [0, 19, 50], TYOP [0, 19, 51], TYOP [0, 38, 52], TYOP [12],
   TYOP [5, 38, 54], TYOP [11, 55], TYOP [0, 54, 56], TYOP [5, 6, 54],
   TYOP [11, 58], TYOP [0, 54, 59], TYOP [5, 10, 54], TYOP [11, 61],
   TYOP [0, 54, 62], TYOP [0, 2, 18], TYOP [0, 6, 18], TYOP [0, 10, 18],
   TYOP [0, 38, 18], TYOP [13, 6], TYOP [13, 10], TYOP [14, 6],
   TYOP [14, 10], TYOP [0, 6, 2], TYOP [15], TYOP [0, 6, 73],
   TYOP [0, 10, 2], TYOP [0, 10, 73], TYOP [0, 6, 6], TYOP [0, 27, 27],
   TYOP [0, 78, 77], TYOP [0, 6, 27], TYOP [0, 19, 19], TYOP [0, 81, 77],
   TYOP [0, 6, 19], TYOP [0, 30, 30], TYOP [0, 84, 77], TYOP [0, 6, 30],
   TYOP [0, 38, 38], TYOP [0, 87, 77], TYOP [0, 6, 38], TYOP [16],
   TYOP [0, 6, 90], TYOP [0, 6, 91], TYV "'a", TYOP [0, 19, 93],
   TYOP [0, 19, 94], TYOP [0, 19, 95], TYOP [0, 19, 96], TYOP [0, 19, 97],
   TYOP [0, 19, 98], TYOP [0, 27, 99], TYOP [0, 30, 100],
   TYOP [0, 30, 101], TYOP [0, 30, 102], TYOP [0, 27, 103],
   TYOP [0, 19, 104], TYOP [0, 19, 105], TYOP [0, 38, 106],
   TYOP [0, 107, 93], TYOP [0, 6, 108], TYOP [0, 10, 10],
   TYOP [0, 78, 110], TYOP [0, 10, 27], TYOP [0, 81, 110],
   TYOP [0, 10, 19], TYOP [0, 87, 110], TYOP [0, 10, 38], TYOP [0, 10, 90],
   TYOP [0, 10, 117], TYOP [0, 27, 100], TYOP [0, 27, 119],
   TYOP [0, 27, 120], TYOP [0, 27, 121], TYOP [0, 19, 122],
   TYOP [0, 19, 123], TYOP [0, 38, 124], TYOP [0, 125, 93],
   TYOP [0, 10, 126], TYOP [7, 18, 93], TYOP [1, 128], TYOP [0, 129, 73],
   TYOP [0, 6, 54], TYOP [0, 10, 54], TYOP [5, 19, 19], TYOP [5, 19, 133],
   TYOP [5, 19, 134], TYOP [5, 19, 135], TYOP [5, 19, 136],
   TYOP [5, 27, 137], TYOP [5, 27, 138], TYOP [5, 27, 139],
   TYOP [5, 27, 140], TYOP [5, 27, 141], TYOP [5, 19, 142],
   TYOP [5, 19, 143], TYOP [5, 38, 144], TYOP [17, 145], TYOP [0, 146, 18],
   TYOP [5, 30, 138], TYOP [5, 30, 148], TYOP [5, 30, 149],
   TYOP [5, 27, 150], TYOP [5, 19, 151], TYOP [5, 19, 152],
   TYOP [5, 38, 153], TYOP [17, 154], TYOP [0, 155, 18], TYOP [18],
   TYOP [0, 10, 93], TYOP [0, 6, 93], TYOP [0, 93, 10], TYOP [0, 93, 6],
   TYOP [0, 19, 18], TYOP [0, 19, 162], TYOP [0, 19, 163],
   TYOP [0, 19, 164], TYOP [0, 19, 165], TYOP [0, 19, 166],
   TYOP [0, 27, 167], TYOP [0, 30, 168], TYOP [0, 30, 169],
   TYOP [0, 30, 170], TYOP [0, 27, 171], TYOP [0, 19, 172],
   TYOP [0, 19, 173], TYOP [0, 38, 174], TYOP [0, 157, 175],
   TYOP [0, 27, 168], TYOP [0, 27, 177], TYOP [0, 27, 178],
   TYOP [0, 27, 179], TYOP [0, 19, 180], TYOP [0, 19, 181],
   TYOP [0, 38, 182], TYOP [0, 157, 183], TYOP [0, 10, 146],
   TYOP [0, 6, 155], TYOP [0, 54, 18], TYOP [0, 187, 18], TYOP [0, 30, 18],
   TYOP [0, 189, 18], TYOP [0, 27, 18], TYOP [0, 191, 18],
   TYOP [0, 162, 18], TYOP [0, 66, 18], TYOP [0, 65, 18],
   TYOP [0, 160, 18], TYOP [0, 196, 18], TYOP [0, 161, 18],
   TYOP [0, 198, 18], TYOP [0, 84, 18], TYOP [0, 200, 18],
   TYOP [0, 78, 18], TYOP [0, 202, 18], TYOP [0, 81, 18],
   TYOP [0, 204, 18], TYOP [0, 194, 18], TYOP [0, 195, 18],
   TYOP [0, 107, 18], TYOP [0, 208, 18], TYOP [0, 125, 18],
   TYOP [0, 210, 18], TYOP [0, 87, 18], TYOP [0, 212, 18], TYOP [0, 3, 18],
   TYOP [0, 214, 18], TYOP [0, 156, 18], TYOP [0, 216, 18],
   TYOP [0, 147, 18], TYOP [0, 218, 18], TYOP [0, 129, 18],
   TYOP [0, 220, 18], TYOP [0, 67, 18], TYOP [0, 64, 18], TYOP [0, 2, 2],
   TYOP [0, 2, 224], TYOP [0, 149, 150], TYOP [0, 30, 226],
   TYOP [0, 148, 149], TYOP [0, 30, 228], TYOP [0, 138, 148],
   TYOP [0, 30, 230], TYOP [0, 150, 151], TYOP [0, 27, 232],
   TYOP [0, 141, 142], TYOP [0, 27, 234], TYOP [0, 140, 141],
   TYOP [0, 27, 236], TYOP [0, 139, 140], TYOP [0, 27, 238],
   TYOP [0, 138, 139], TYOP [0, 27, 240], TYOP [0, 137, 138],
   TYOP [0, 27, 242], TYOP [0, 19, 133], TYOP [0, 19, 244],
   TYOP [0, 151, 152], TYOP [0, 19, 246], TYOP [0, 142, 143],
   TYOP [0, 19, 248], TYOP [0, 133, 134], TYOP [0, 19, 250],
   TYOP [0, 152, 153], TYOP [0, 19, 252], TYOP [0, 143, 144],
   TYOP [0, 19, 254], TYOP [0, 134, 135], TYOP [0, 19, 256],
   TYOP [0, 135, 136], TYOP [0, 19, 258], TYOP [0, 136, 137],
   TYOP [0, 19, 260], TYOP [0, 54, 61], TYOP [0, 10, 262],
   TYOP [0, 54, 58], TYOP [0, 6, 264], TYOP [0, 3, 8], TYOP [0, 3, 266],
   TYOP [0, 153, 154], TYOP [0, 38, 268], TYOP [0, 144, 145],
   TYOP [0, 38, 270], TYOP [1, 2], TYOP [5, 272, 272], TYOP [0, 272, 273],
   TYOP [0, 272, 274], TYOP [0, 18, 18], TYOP [0, 18, 276],
   TYOP [0, 2, 64], TYOP [0, 93, 18], TYOP [0, 93, 279], TYOP [0, 71, 18],
   TYOP [0, 71, 281], TYOP [0, 70, 18], TYOP [0, 70, 283],
   TYOP [0, 69, 18], TYOP [0, 69, 285], TYOP [0, 68, 18],
   TYOP [0, 68, 287], TYOP [0, 54, 187], TYOP [0, 30, 189],
   TYOP [0, 27, 191], TYOP [0, 37, 18], TYOP [0, 37, 292],
   TYOP [0, 10, 66], TYOP [0, 6, 65], TYOP [0, 73, 18], TYOP [0, 73, 296],
   TYOP [0, 62, 18], TYOP [0, 62, 298], TYOP [0, 59, 18],
   TYOP [0, 59, 300], TYOP [0, 56, 18], TYOP [0, 56, 302],
   TYOP [0, 160, 196], TYOP [0, 161, 198], TYOP [0, 110, 18],
   TYOP [0, 110, 306], TYOP [0, 11, 18], TYOP [0, 11, 308],
   TYOP [0, 77, 18], TYOP [0, 77, 310], TYOP [0, 7, 18], TYOP [0, 7, 312],
   TYOP [0, 38, 67], TYOP [0, 1, 18], TYOP [0, 1, 315], TYOP [28, 37],
   TYOP [0, 317, 18], TYOP [0, 317, 318], TYOP [0, 90, 18],
   TYOP [0, 90, 320], TYOP [0, 155, 156], TYOP [0, 146, 147],
   TYOP [0, 158, 18], TYOP [0, 324, 18], TYOP [0, 185, 18],
   TYOP [0, 326, 18], TYOP [0, 159, 18], TYOP [0, 328, 18],
   TYOP [0, 186, 18], TYOP [0, 330, 18], TYOP [0, 1, 1], TYOP [0, 1, 332],
   TYOP [0, 2, 0], TYOP [0, 73, 73], TYOP [0, 73, 335], TYOP [0, 18, 336],
   TYOP [0, 62, 62], TYOP [0, 62, 338], TYOP [0, 18, 339],
   TYOP [0, 59, 59], TYOP [0, 59, 341], TYOP [0, 18, 342],
   TYOP [0, 18, 333], TYOP [0, 37, 87], TYOP [0, 0, 332], TYOP [1, 38],
   TYOP [0, 347, 347], TYOP [0, 38, 348], TYOP [1, 1], TYOP [0, 350, 350],
   TYOP [0, 1, 351], TYOP [0, 272, 272], TYOP [0, 2, 353],
   TYOP [0, 2, 155], TYOP [0, 355, 155], TYOP [0, 154, 356],
   TYOP [0, 2, 357], TYOP [0, 2, 146], TYOP [0, 359, 146],
   TYOP [0, 145, 360], TYOP [0, 2, 361], TYOP [0, 37, 37],
   TYOP [0, 320, 18], TYOP [0, 90, 364], TYOP [0, 320, 320],
   TYOP [0, 90, 366], TYOP [0, 30, 84], TYOP [0, 27, 78], TYOP [0, 19, 81],
   TYOP [0, 294, 294], TYOP [0, 294, 371], TYOP [0, 118, 118],
   TYOP [0, 118, 373], TYOP [0, 11, 11], TYOP [0, 11, 375],
   TYOP [0, 295, 295], TYOP [0, 295, 377], TYOP [0, 92, 92],
   TYOP [0, 92, 379], TYOP [0, 7, 7], TYOP [0, 7, 381], TYOP [0, 38, 87],
   TYOP [0, 38, 2], TYOP [0, 73, 54], TYOP [0, 385, 385], TYOP [0, 73, 62],
   TYOP [0, 387, 387], TYOP [0, 73, 59], TYOP [0, 389, 389],
   TYOP [0, 224, 224], TYOP [0, 363, 87], TYOP [0, 38, 272],
   TYOP [0, 37, 2], TYOP [0, 394, 393], TYOP [0, 71, 71],
   TYOP [0, 373, 396], TYOP [0, 70, 70], TYOP [0, 379, 398],
   TYOP [0, 371, 396], TYOP [0, 377, 398], TYOP [0, 37, 317],
   TYOP [0, 69, 69], TYOP [0, 375, 403], TYOP [0, 68, 68],
   TYOP [0, 381, 405], TYOP [0, 2, 87], TYOP [0, 156, 330],
   TYOP [0, 147, 326], TYOP [5, 30, 54], TYOP [0, 410, 59],
   TYOP [0, 30, 60], TYOP [0, 412, 411], TYOP [5, 27, 54],
   TYOP [0, 414, 62], TYOP [0, 27, 63], TYOP [0, 416, 415],
   TYOP [0, 414, 59], TYOP [0, 27, 60], TYOP [0, 419, 418],
   TYOP [5, 19, 54], TYOP [0, 421, 62], TYOP [0, 19, 63],
   TYOP [0, 423, 422], TYOP [0, 421, 59], TYOP [0, 19, 60],
   TYOP [0, 426, 425], TYOP [0, 55, 62], TYOP [0, 38, 63],
   TYOP [0, 429, 428], TYOP [0, 55, 59], TYOP [0, 38, 60],
   TYOP [0, 432, 431], TYOP [0, 27, 38], TYOP [0, 73, 434],
   TYOP [0, 19, 38], TYOP [0, 73, 436], TYOP [0, 30, 38],
   TYOP [0, 73, 438], TYOP [0, 38, 73], TYOP [0, 411, 59], TYOP [11, 410],
   TYOP [0, 442, 441], TYOP [0, 415, 62], TYOP [11, 414],
   TYOP [0, 445, 444], TYOP [0, 418, 59], TYOP [0, 445, 447],
   TYOP [0, 422, 62], TYOP [11, 421], TYOP [0, 450, 449],
   TYOP [0, 425, 59], TYOP [0, 450, 452], TYOP [0, 428, 62],
   TYOP [0, 56, 454], TYOP [0, 431, 59], TYOP [0, 56, 456],
   TYOP [0, 1, 62], TYOP [0, 1, 59], TYOP [0, 1, 73], TYOP [0, 1, 2],
   TYOP [0, 347, 54], TYOP [0, 2, 90], TYOP [0, 2, 463],
   TYOP [0, 278, 464], TYOP [0, 278, 465], TYOP [13, 37],
   TYOP [0, 272, 90], TYOP [0, 272, 468], TYOP [0, 464, 469],
   TYOP [28, 128], TYOP [0, 2, 471], TYOP [0, 129, 472], TYOP [0, 2, 317],
   TYOP [0, 38, 474], TYOP [0, 394, 384], TYOP [0, 2, 37],
   TYOP [0, 84, 84], TYOP [0, 84, 478], TYOP [0, 78, 78],
   TYOP [0, 78, 480], TYOP [0, 81, 81], TYOP [0, 81, 482],
   TYOP [0, 160, 160], TYOP [0, 110, 484], TYOP [0, 110, 110],
   TYOP [0, 110, 486], TYOP [0, 161, 161], TYOP [0, 77, 488],
   TYOP [0, 77, 77], TYOP [0, 77, 490], TYOP [0, 87, 87],
   TYOP [0, 87, 492], TYOP [0, 30, 1], TYOP [0, 30, 2], TYOP [0, 495, 494],
   TYOP [0, 3, 496], TYOP [0, 27, 1], TYOP [0, 27, 2], TYOP [0, 499, 498],
   TYOP [0, 3, 500], TYOP [0, 19, 1], TYOP [0, 19, 2], TYOP [0, 503, 502],
   TYOP [0, 3, 504], TYOP [0, 128, 73], TYOP [0, 506, 73],
   TYOP [0, 73, 507], TYOP [0, 471, 508], TYOP [0, 37, 62],
   TYOP [0, 510, 62], TYOP [0, 62, 511], TYOP [0, 317, 512],
   TYOP [0, 37, 59], TYOP [0, 514, 59], TYOP [0, 59, 515],
   TYOP [0, 317, 516], TYOP [0, 394, 2], TYOP [0, 2, 518],
   TYOP [0, 317, 519], TYOP [0, 273, 90], TYOP [0, 273, 521],
   TYOP [0, 469, 522], TYOP [0, 469, 523], TYOP [0, 54, 445],
   TYOP [0, 73, 525], TYOP [0, 54, 450], TYOP [0, 73, 527],
   TYOP [0, 54, 442], TYOP [0, 73, 529], TYOP [5, 37, 54], TYOP [11, 531],
   TYOP [0, 54, 532], TYOP [0, 73, 533], TYOP [0, 533, 56],
   TYOP [0, 54, 535], TYOP [0, 2, 536], TYOP [0, 61, 62], TYOP [0, 58, 59],
   TYOP [0, 73, 1], TYOP [0, 38, 1], TYOP [0, 467, 541], TYOP [0, 350, 1],
   TYOP [0, 128, 2]]
  end
  val _ = Theory.incorporate_consts "elf_header" tyvector
     [("string_of_elf_version_number", 3),
      ("string_of_elf_osabi_version", 4),
      ("string_of_elf_machine_architecture", 3),
      ("string_of_elf_file_type", 5), ("string_of_elf_file_class", 3),
      ("string_of_elf_data_encoding", 3),
      ("string_of_elf64_header_default", 7), ("string_of_elf64_header", 9),
      ("string_of_elf32_header_default", 11),
      ("string_of_elf32_header", 12), ("shn_xindex", 2), ("shn_undef", 2),
      ("recordtype.elf64_header", 39), ("recordtype.elf32_header", 53),
      ("read_elf_ident", 57), ("read_elf64_header", 60),
      ("read_elf32_header", 63), ("is_valid_extended_version_number", 64),
      ("is_valid_elf64_version_numer", 65), ("is_valid_elf64_header", 65),
      ("is_valid_elf32_version_numer", 66), ("is_valid_elf32_header", 66),
      ("is_valid_architecture_defined_osabi_version", 64),
      ("is_processor_specific_object_file_type_value", 64),
      ("is_operating_system_specific_object_file_type_value", 64),
      ("is_magic_number_correct", 67), ("is_elf64_shared_object_file", 65),
      ("is_elf64_relocatable_file", 65), ("is_elf64_linkable_file", 65),
      ("is_elf64_header_version_correct", 65),
      ("is_elf64_header_string_table_index_in_link", 65),
      ("is_elf64_header_section_table_present", 65),
      ("is_elf64_header_section_size_in_section_header_table", 65),
      ("is_elf64_header_class_correct", 65),
      ("is_elf64_executable_file", 65),
      ("is_elf32_shared_object_file", 66),
      ("is_elf32_relocatable_file", 66), ("is_elf32_linkable_file", 66),
      ("is_elf32_header_version_correct", 66),
      ("is_elf32_header_valid", 66),
      ("is_elf32_header_string_table_index_in_link", 66),
      ("is_elf32_header_section_table_present", 66),
      ("is_elf32_header_section_size_in_section_header_table", 66),
      ("is_elf32_header_padding_correct", 66),
      ("is_elf32_header_class_correct", 66),
      ("is_elf32_executable_file", 66),
      ("instance_Show_Show_Elf_header_elf64_header_dict", 68),
      ("instance_Show_Show_Elf_header_elf32_header_dict", 69),
      ("instance_Basic_classes_Ord_Elf_header_elf64_header_dict", 70),
      ("instance_Basic_classes_Ord_Elf_header_elf32_header_dict", 71),
      ("has_elf64_header_string_table", 65),
      ("has_elf64_header_associated_entry_point", 65),
      ("has_elf32_header_string_table", 66),
      ("has_elf32_header_associated_entry_point", 66),
      ("get_elf64_version_number", 72), ("get_elf64_osabi", 72),
      ("get_elf64_machine_architecture", 72),
      ("get_elf64_header_section_table_size", 72),
      ("get_elf64_header_program_table_size", 72),
      ("get_elf64_header_endianness", 74), ("get_elf64_file_class", 72),
      ("get_elf64_data_encoding", 72), ("get_elf64_abi_version", 72),
      ("get_elf32_version_number", 75), ("get_elf32_osabi", 75),
      ("get_elf32_machine_architecture", 75),
      ("get_elf32_header_section_table_size", 75),
      ("get_elf32_header_program_table_size", 75),
      ("get_elf32_header_endianness", 76), ("get_elf32_file_class", 75),
      ("get_elf32_data_encoding", 75), ("get_elf32_abi_version", 75),
      ("elf_osabi_tru64", 2), ("elf_osabi_solaris", 2),
      ("elf_osabi_openvos", 2), ("elf_osabi_openvms", 2),
      ("elf_osabi_openbsd", 2), ("elf_osabi_nsk", 2),
      ("elf_osabi_none", 2), ("elf_osabi_netbsd", 2),
      ("elf_osabi_modesto", 2), ("elf_osabi_linux", 2),
      ("elf_osabi_irix", 2), ("elf_osabi_hpux", 2), ("elf_osabi_gnu", 2),
      ("elf_osabi_freebsd", 2), ("elf_osabi_fenixos", 2),
      ("elf_osabi_cloudabi", 2), ("elf_osabi_aros", 2),
      ("elf_osabi_aix", 2), ("elf_mn_mag3", 37), ("elf_mn_mag2", 37),
      ("elf_mn_mag1", 37), ("elf_mn_mag0", 37), ("elf_ma_zsp", 2),
      ("elf_ma_z80", 2), ("elf_ma_xtensa", 2), ("elf_ma_ximo16", 2),
      ("elf_ma_xgate", 2), ("elf_ma_xcore", 2), ("elf_ma_x86_64", 2),
      ("elf_ma_vpp500", 2), ("elf_ma_visium", 2), ("elf_ma_videocore5", 2),
      ("elf_ma_videocore3", 2), ("elf_ma_videocore", 2), ("elf_ma_vax", 2),
      ("elf_ma_v850", 2), ("elf_ma_v800", 2), ("elf_ma_unicore", 2),
      ("elf_ma_tsk3000", 2), ("elf_ma_trimedia", 2), ("elf_ma_tricore", 2),
      ("elf_ma_tpc", 2), ("elf_ma_tmm_gpp", 2), ("elf_ma_tinyj", 2),
      ("elf_ma_tilepro", 2), ("elf_ma_tilegx", 2), ("elf_ma_tile64", 2),
      ("elf_ma_svx", 2), ("elf_ma_stxp7x", 2), ("elf_ma_stm8", 2),
      ("elf_ma_starcore", 2), ("elf_ma_st9plus", 2), ("elf_ma_st7", 2),
      ("elf_ma_st200", 2), ("elf_ma_st19", 2), ("elf_ma_st100", 2),
      ("elf_ma_spu", 2), ("elf_ma_sparcv9", 2), ("elf_ma_sparc32plus", 2),
      ("elf_ma_sparc", 2), ("elf_ma_snp1k", 2), ("elf_ma_sle9x", 2),
      ("elf_ma_sharc", 2), ("elf_ma_sh", 2), ("elf_ma_sep", 2),
      ("elf_ma_se_c33", 2), ("elf_ma_s390", 2), ("elf_ma_s370", 2),
      ("elf_ma_rx", 2), ("elf_ma_rs08", 2), ("elf_ma_rl78", 2),
      ("elf_ma_riscv", 2), ("elf_ma_rh32", 2), ("elf_ma_reserved6", 2),
      ("elf_ma_reserved35", 2), ("elf_ma_reserved34", 2),
      ("elf_ma_reserved33", 2), ("elf_ma_reserved32", 2),
      ("elf_ma_reserved31", 2), ("elf_ma_reserved30", 2),
      ("elf_ma_reserved29", 2), ("elf_ma_reserved28", 2),
      ("elf_ma_reserved27", 2), ("elf_ma_reserved26", 2),
      ("elf_ma_reserved25", 2), ("elf_ma_reserved24", 2),
      ("elf_ma_reserved16", 2), ("elf_ma_reserved159", 2),
      ("elf_ma_reserved158", 2), ("elf_ma_reserved157", 2),
      ("elf_ma_reserved156", 2), ("elf_ma_reserved155", 2),
      ("elf_ma_reserved154", 2), ("elf_ma_reserved153", 2),
      ("elf_ma_reserved152", 2), ("elf_ma_reserved151", 2),
      ("elf_ma_reserved150", 2), ("elf_ma_reserved149", 2),
      ("elf_ma_reserved148", 2), ("elf_ma_reserved147", 2),
      ("elf_ma_reserved146", 2), ("elf_ma_reserved145", 2),
      ("elf_ma_reserved144", 2), ("elf_ma_reserved143", 2),
      ("elf_ma_reserved14", 2), ("elf_ma_reserved130", 2),
      ("elf_ma_reserved13", 2), ("elf_ma_reserved129", 2),
      ("elf_ma_reserved128", 2), ("elf_ma_reserved127", 2),
      ("elf_ma_reserved126", 2), ("elf_ma_reserved125", 2),
      ("elf_ma_reserved124", 2), ("elf_ma_reserved123", 2),
      ("elf_ma_reserved122", 2), ("elf_ma_reserved121", 2),
      ("elf_ma_reserved12", 2), ("elf_ma_reserved11", 2),
      ("elf_ma_rce", 2), ("elf_ma_r32c", 2), ("elf_ma_qdsp6", 2),
      ("elf_ma_prism", 2), ("elf_ma_ppc64", 2), ("elf_ma_ppc", 2),
      ("elf_ma_pj", 2), ("elf_ma_pdsp", 2), ("elf_ma_pdp11", 2),
      ("elf_ma_pdp10", 2), ("elf_ma_pcp", 2), ("elf_ma_parisc", 2),
      ("elf_ma_openrisc", 2), ("elf_ma_open8", 2), ("elf_ma_ns32k", 2),
      ("elf_ma_norc", 2), ("elf_ma_none", 2), ("elf_ma_nds32", 2),
      ("elf_ma_ndr1", 2), ("elf_ma_ncpu", 2), ("elf_ma_msp430", 2),
      ("elf_ma_moxie", 2), ("elf_ma_mn10300", 2), ("elf_ma_mn10200", 2),
      ("elf_ma_mmix", 2), ("elf_ma_mmdsp_plus", 2), ("elf_ma_mma", 2),
      ("elf_ma_mips_x", 2), ("elf_ma_mips_rs3_le", 2), ("elf_ma_mips", 2),
      ("elf_ma_microblaze", 2), ("elf_ma_metag", 2), ("elf_ma_me16", 2),
      ("elf_ma_mcst_elbrus", 2), ("elf_ma_mchp_pic", 2),
      ("elf_ma_maxq30", 2), ("elf_ma_max", 2), ("elf_ma_manik", 2),
      ("elf_ma_m32r", 2), ("elf_ma_m32c", 2), ("elf_ma_m32", 2),
      ("elf_ma_m16c", 2), ("elf_ma_latticemico32", 2), ("elf_ma_l10m", 2),
      ("elf_ma_kvarc", 2), ("elf_ma_kmx8", 2), ("elf_ma_kmx32", 2),
      ("elf_ma_kmx16", 2), ("elf_ma_km32", 2), ("elf_ma_kalimba", 2),
      ("elf_ma_k10m", 2), ("elf_ma_javelin", 2), ("elf_ma_ip2k", 2),
      ("elf_ma_intel209", 2), ("elf_ma_intel208", 2),
      ("elf_ma_intel207", 2), ("elf_ma_intel206", 2),
      ("elf_ma_intel205", 2), ("elf_ma_intel182", 2), ("elf_ma_ia_64", 2),
      ("elf_ma_huany", 2), ("elf_ma_h8s", 2), ("elf_ma_h8_500", 2),
      ("elf_ma_h8_300h", 2), ("elf_ma_h8_300", 2), ("elf_ma_fx66", 2),
      ("elf_ma_ft32", 2), ("elf_ma_fr30", 2), ("elf_ma_fr20", 2),
      ("elf_ma_firepath", 2), ("elf_ma_f2mc16", 2), ("elf_ma_excess", 2),
      ("elf_ma_etpu", 2), ("elf_ma_ecog2", 2), ("elf_ma_ecog1x", 2),
      ("elf_ma_ecog16", 2), ("elf_ma_dxp", 2), ("elf_ma_dspic30f", 2),
      ("elf_ma_dsp24", 2), ("elf_ma_d30v", 2), ("elf_ma_d10v", 2),
      ("elf_ma_cypress", 2), ("elf_ma_cuda", 2), ("elf_ma_crx", 2),
      ("elf_ma_cris", 2), ("elf_ma_craynv2", 2), ("elf_ma_cr16", 2),
      ("elf_ma_cr", 2), ("elf_ma_corea_2nd", 2), ("elf_ma_corea_1st", 2),
      ("elf_ma_cool", 2), ("elf_ma_coldfire", 2), ("elf_ma_coge", 2),
      ("elf_ma_cloudshield", 2), ("elf_ma_ce", 2), ("elf_ma_cdp", 2),
      ("elf_ma_ccore7", 2), ("elf_ma_c6000", 2), ("elf_ma_c5500", 2),
      ("elf_ma_c2000", 2), ("elf_ma_c17", 2), ("elf_ma_c166", 2),
      ("elf_ma_blackfin", 2), ("elf_ma_ba2", 2), ("elf_ma_ba1", 2),
      ("elf_ma_avr32", 2), ("elf_ma_avr", 2), ("elf_ma_arm184", 2),
      ("elf_ma_arm", 2), ("elf_ma_arca", 2), ("elf_ma_arc_compact2", 2),
      ("elf_ma_arc_compact", 2), ("elf_ma_arc", 2), ("elf_ma_amdgpu", 2),
      ("elf_ma_altera_nios2", 2), ("elf_ma_alpha", 2),
      ("elf_ma_aarch64", 2), ("elf_ma_960", 2), ("elf_ma_88k", 2),
      ("elf_ma_860", 2), ("elf_ma_8051", 2), ("elf_ma_78kor", 2),
      ("elf_ma_68k", 2), ("elf_ma_68hc16", 2), ("elf_ma_68hc12", 2),
      ("elf_ma_68hc11", 2), ("elf_ma_68hc08", 2), ("elf_ma_68hc05", 2),
      ("elf_ma_5600ex", 2), ("elf_ma_386", 2), ("elf_ii_version", 2),
      ("elf_ii_pad", 2), ("elf_ii_osabi", 2), ("elf_ii_nident", 2),
      ("elf_ii_mag3", 2), ("elf_ii_mag2", 2), ("elf_ii_mag1", 2),
      ("elf_ii_mag0", 2), ("elf_ii_data", 2), ("elf_ii_class", 2),
      ("elf_ii_abiversion", 2), ("elf_ft_rel", 2), ("elf_ft_none", 2),
      ("elf_ft_lo_proc", 2), ("elf_ft_lo_os", 2), ("elf_ft_hi_proc", 2),
      ("elf_ft_hi_os", 2), ("elf_ft_exec", 2), ("elf_ft_dyn", 2),
      ("elf_ft_core", 2), ("elf_ev_none", 2), ("elf_ev_current", 2),
      ("elf_data_none", 2), ("elf_data_2msb", 2), ("elf_data_2lsb", 2),
      ("elf_class_none", 2), ("elf_class_64", 2), ("elf_class_32", 2),
      ("elf64_header_size", 72), ("elf64_header_elf64_version_fupd", 79),
      ("elf64_header_elf64_version", 80),
      ("elf64_header_elf64_type_fupd", 82),
      ("elf64_header_elf64_type", 83),
      ("elf64_header_elf64_shstrndx_fupd", 82),
      ("elf64_header_elf64_shstrndx", 83),
      ("elf64_header_elf64_shoff_fupd", 85),
      ("elf64_header_elf64_shoff", 86),
      ("elf64_header_elf64_shnum_fupd", 82),
      ("elf64_header_elf64_shnum", 83),
      ("elf64_header_elf64_shentsize_fupd", 82),
      ("elf64_header_elf64_shentsize", 83),
      ("elf64_header_elf64_phoff_fupd", 85),
      ("elf64_header_elf64_phoff", 86),
      ("elf64_header_elf64_phnum_fupd", 82),
      ("elf64_header_elf64_phnum", 83),
      ("elf64_header_elf64_phentsize_fupd", 82),
      ("elf64_header_elf64_phentsize", 83),
      ("elf64_header_elf64_machine_fupd", 82),
      ("elf64_header_elf64_machine", 83),
      ("elf64_header_elf64_ident_fupd", 88),
      ("elf64_header_elf64_ident", 89),
      ("elf64_header_elf64_flags_fupd", 79),
      ("elf64_header_elf64_flags", 80),
      ("elf64_header_elf64_entry_fupd", 85),
      ("elf64_header_elf64_entry", 86),
      ("elf64_header_elf64_ehsize_fupd", 82),
      ("elf64_header_elf64_ehsize", 83), ("elf64_header_compare", 92),
      ("elf64_header_CASE", 109), ("elf32_header_size", 75),
      ("elf32_header_elf32_version_fupd", 111),
      ("elf32_header_elf32_version", 112),
      ("elf32_header_elf32_type_fupd", 113),
      ("elf32_header_elf32_type", 114),
      ("elf32_header_elf32_shstrndx_fupd", 113),
      ("elf32_header_elf32_shstrndx", 114),
      ("elf32_header_elf32_shoff_fupd", 111),
      ("elf32_header_elf32_shoff", 112),
      ("elf32_header_elf32_shnum_fupd", 113),
      ("elf32_header_elf32_shnum", 114),
      ("elf32_header_elf32_shentsize_fupd", 113),
      ("elf32_header_elf32_shentsize", 114),
      ("elf32_header_elf32_phoff_fupd", 111),
      ("elf32_header_elf32_phoff", 112),
      ("elf32_header_elf32_phnum_fupd", 113),
      ("elf32_header_elf32_phnum", 114),
      ("elf32_header_elf32_phentsize_fupd", 113),
      ("elf32_header_elf32_phentsize", 114),
      ("elf32_header_elf32_machine_fupd", 113),
      ("elf32_header_elf32_machine", 114),
      ("elf32_header_elf32_ident_fupd", 115),
      ("elf32_header_elf32_ident", 116),
      ("elf32_header_elf32_flags_fupd", 111),
      ("elf32_header_elf32_flags", 112),
      ("elf32_header_elf32_entry_fupd", 111),
      ("elf32_header_elf32_entry", 112),
      ("elf32_header_elf32_ehsize_fupd", 113),
      ("elf32_header_elf32_ehsize", 114), ("elf32_header_compare", 118),
      ("elf32_header_CASE", 127), ("ei_nident", 2),
      ("deduce_endianness", 130), ("bytes_of_elf64_header", 131),
      ("bytes_of_elf32_header", 132)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'elf32_header'", 147), TMV("'elf64_header'", 156), TMV("M", 10),
   TMV("M", 6), TMV("M'", 10), TMV("M'", 6), TMV("P", 66), TMV("P", 65),
   TMV("a0", 38), TMV("a0'", 38), TMV("a0'", 155), TMV("a0'", 146),
   TMV("a1", 19), TMV("a1'", 19), TMV("a10", 19), TMV("a10'", 19),
   TMV("a11", 19), TMV("a11'", 19), TMV("a12", 19), TMV("a12'", 19),
   TMV("a13", 19), TMV("a13'", 19), TMV("a2", 19), TMV("a2'", 19),
   TMV("a3", 27), TMV("a3'", 27), TMV("a4", 30), TMV("a4", 27),
   TMV("a4'", 30), TMV("a4'", 27), TMV("a5", 30), TMV("a5", 27),
   TMV("a5'", 30), TMV("a5'", 27), TMV("a6", 30), TMV("a6", 27),
   TMV("a6'", 30), TMV("a6'", 27), TMV("a7", 27), TMV("a7'", 27),
   TMV("a8", 19), TMV("a8'", 19), TMV("a9", 19), TMV("a9'", 19),
   TMV("arch", 3), TMV("bs", 54), TMV("c", 19), TMV("c", 37),
   TMV("c0", 19), TMV("c01", 19), TMV("c02", 19), TMV("c1", 27),
   TMV("c1", 19), TMV("c10", 19), TMV("c101", 19), TMV("c102", 19),
   TMV("c11", 19), TMV("c111", 19), TMV("c112", 19), TMV("c12", 19),
   TMV("c2", 30), TMV("c2", 27), TMV("c2", 19), TMV("c21", 19),
   TMV("c22", 19), TMV("c3", 30), TMV("c3", 27), TMV("c3", 19),
   TMV("c31", 19), TMV("c32", 19), TMV("c4", 30), TMV("c4", 27),
   TMV("c4", 19), TMV("c41", 19), TMV("c42", 19), TMV("c5", 27),
   TMV("c51", 27), TMV("c52", 27), TMV("c6", 30), TMV("c6", 27),
   TMV("c6", 19), TMV("c61", 30), TMV("c61", 27), TMV("c62", 30),
   TMV("c62", 27), TMV("c7", 30), TMV("c7", 27), TMV("c7", 19),
   TMV("c71", 30), TMV("c71", 27), TMV("c72", 30), TMV("c72", 27),
   TMV("c8", 30), TMV("c8", 27), TMV("c8", 19), TMV("c81", 30),
   TMV("c81", 27), TMV("c82", 30), TMV("c82", 27), TMV("c9", 27),
   TMV("c9", 19), TMV("c91", 27), TMV("c92", 27), TMV("cls", 37),
   TMV("data", 37), TMV("e", 10), TMV("e", 6), TMV("e1", 10), TMV("e1", 6),
   TMV("e2", 10), TMV("e2", 6), TMV("ee", 10), TMV("ee", 6),
   TMV("ehdr", 10), TMV("ehdr", 6), TMV("ehsize", 19),
   TMV("elf32_ehsize", 19), TMV("elf32_entry", 27), TMV("elf32_flags", 27),
   TMV("elf32_header", 157), TMV("elf32_ident", 38),
   TMV("elf32_machine", 19), TMV("elf32_phentsize", 19),
   TMV("elf32_phnum", 19), TMV("elf32_phoff", 27),
   TMV("elf32_shentsize", 19), TMV("elf32_shnum", 19),
   TMV("elf32_shoff", 27), TMV("elf32_shstrndx", 19),
   TMV("elf32_type", 19), TMV("elf32_version", 27),
   TMV("elf64_ehsize", 19), TMV("elf64_entry", 30), TMV("elf64_flags", 27),
   TMV("elf64_header", 157), TMV("elf64_ident", 38),
   TMV("elf64_machine", 19), TMV("elf64_phentsize", 19),
   TMV("elf64_phnum", 19), TMV("elf64_phoff", 30),
   TMV("elf64_shentsize", 19), TMV("elf64_shnum", 19),
   TMV("elf64_shoff", 30), TMV("elf64_shstrndx", 19),
   TMV("elf64_type", 19), TMV("elf64_version", 27), TMV("endian", 73),
   TMV("entry", 30), TMV("entry", 27), TMV("f", 84), TMV("f", 78),
   TMV("f", 81), TMV("f", 107), TMV("f", 125), TMV("f", 87),
   TMV("f'", 107), TMV("f'", 125), TMV("f1", 10), TMV("f1", 6),
   TMV("f2", 10), TMV("f2", 6), TMV("flags", 27), TMV("fn", 158),
   TMV("fn", 159), TMV("g", 84), TMV("g", 78), TMV("g", 81), TMV("g", 87),
   TMV("h", 160), TMV("h", 161), TMV("h1", 10), TMV("h1", 6),
   TMV("h2", 10), TMV("h2", 6), TMV("hdr", 10), TMV("hdr", 6),
   TMV("id", 129), TMV("ident", 38), TMV("l", 38), TMV("l1", 38),
   TMV("l2", 38), TMV("m", 2), TMV("machine", 19), TMV("n", 2),
   TMV("os", 3), TMV("os_specific", 3), TMV("osabi", 37),
   TMV("phentsize", 19), TMV("phentsize", 2), TMV("phnum", 19),
   TMV("phnum", 2), TMV("phoff", 30), TMV("phoff", 27), TMV("proc", 3),
   TMV("proc_specific", 3), TMV("record", 176), TMV("record", 184),
   TMV("rep", 185), TMV("rep", 186), TMV("shentsize", 19),
   TMV("shentsize", 2), TMV("shnum", 19), TMV("shnum", 2),
   TMV("shoff", 30), TMV("shoff", 27), TMV("shstrndx", 19), TMV("typ", 19),
   TMV("v", 128), TMV("v", 37), TMV("v", 2), TMV("ver", 37),
   TMV("version", 27), TMC(19, 188), TMC(19, 190), TMC(19, 192),
   TMC(19, 193), TMC(19, 194), TMC(19, 195), TMC(19, 197), TMC(19, 199),
   TMC(19, 201), TMC(19, 203), TMC(19, 205), TMC(19, 206), TMC(19, 207),
   TMC(19, 209), TMC(19, 211), TMC(19, 213), TMC(19, 215), TMC(19, 217),
   TMC(19, 219), TMC(19, 221), TMC(19, 222), TMC(19, 223), TMC(19, 216),
   TMC(19, 218), TMC(20, 225), TMC(21, 225), TMC(22, 227), TMC(22, 229),
   TMC(22, 231), TMC(22, 233), TMC(22, 235), TMC(22, 237), TMC(22, 239),
   TMC(22, 241), TMC(22, 243), TMC(22, 245), TMC(22, 247), TMC(22, 249),
   TMC(22, 251), TMC(22, 253), TMC(22, 255), TMC(22, 257), TMC(22, 259),
   TMC(22, 261), TMC(22, 263), TMC(22, 265), TMC(22, 267), TMC(22, 269),
   TMC(22, 271), TMC(22, 275), TMC(23, 277), TMC(24, 2), TMC(25, 278),
   TMC(26, 278), TMC(27, 280), TMC(27, 282), TMC(27, 284), TMC(27, 286),
   TMC(27, 288), TMC(27, 277), TMC(27, 289), TMC(27, 290), TMC(27, 291),
   TMC(27, 163), TMC(27, 293), TMC(27, 294), TMC(27, 295), TMC(27, 297),
   TMC(27, 299), TMC(27, 301), TMC(27, 303), TMC(27, 304), TMC(27, 305),
   TMC(27, 307), TMC(27, 309), TMC(27, 311), TMC(27, 313), TMC(27, 314),
   TMC(27, 316), TMC(27, 278), TMC(27, 319), TMC(27, 321), TMC(27, 322),
   TMC(27, 323), TMC(29, 277), TMC(30, 278), TMC(31, 278), TMC(32, 190),
   TMC(32, 192), TMC(32, 193), TMC(32, 194), TMC(32, 195), TMC(32, 325),
   TMC(32, 327), TMC(32, 329), TMC(32, 331), TMC(32, 222), TMC(33, 333),
   TMC(34, 71), TMC(34, 70), TMC(34, 69), TMC(34, 68), TMC(34, 10),
   TMC(34, 6), TMC(35, 224), TMC(36, 224), TMC(37, 155), TMC(37, 146),
   TMC(38, 73), TMC(39, 334), TMC(40, 337), TMC(40, 340), TMC(40, 343),
   TMC(40, 344), TMC(41, 345), TMC(41, 346), TMC(41, 349), TMC(41, 352),
   TMC(41, 354), TMC(42, 358), TMC(42, 362), TMC(43, 276), TMC(44, 320),
   TMC(45, 90), TMC(46, 90), TMC(47, 363), TMC(48, 365), TMC(49, 367),
   TMC(50, 368), TMC(50, 369), TMC(50, 370), TMC(50, 372), TMC(50, 374),
   TMC(50, 376), TMC(50, 378), TMC(50, 380), TMC(50, 382), TMC(50, 383),
   TMC(51, 384), TMC(52, 386), TMC(52, 388), TMC(52, 390), TMC(52, 391),
   TMC(53, 90), TMC(54, 73), TMC(55, 392), TMC(55, 395), TMC(56, 38),
   TMC(56, 1), TMC(56, 347), TMC(56, 350), TMC(56, 272), TMC(57, 224),
   TMC(58, 397), TMC(58, 399), TMC(59, 400), TMC(59, 401), TMC(60, 400),
   TMC(60, 401), TMC(61, 400), TMC(61, 401), TMC(62, 400), TMC(62, 401),
   TMC(63, 402), TMC(64, 404), TMC(64, 406), TMC(65, 407), TMC(66, 408),
   TMC(66, 409), TMC(67, 413), TMC(67, 417), TMC(67, 420), TMC(67, 424),
   TMC(67, 427), TMC(67, 430), TMC(67, 433), TMC(68, 2), TMC(69, 277),
   TMC(70, 435), TMC(71, 437), TMC(72, 132), TMC(73, 435), TMC(74, 435),
   TMC(75, 439), TMC(76, 437), TMC(77, 131), TMC(78, 439), TMC(79, 435),
   TMC(80, 130), TMC(80, 440), TMC(81, 73), TMC(82, 3), TMC(83, 3),
   TMC(84, 2), TMC(85, 127), TMC(86, 118), TMC(87, 114), TMC(88, 113),
   TMC(89, 112), TMC(90, 111), TMC(91, 112), TMC(92, 111), TMC(93, 116),
   TMC(94, 115), TMC(95, 114), TMC(96, 113), TMC(97, 114), TMC(98, 113),
   TMC(99, 114), TMC(100, 113), TMC(101, 112), TMC(102, 111),
   TMC(103, 114), TMC(104, 113), TMC(105, 114), TMC(106, 113),
   TMC(107, 112), TMC(108, 111), TMC(109, 114), TMC(110, 113),
   TMC(111, 114), TMC(112, 113), TMC(113, 112), TMC(114, 111),
   TMC(115, 75), TMC(116, 109), TMC(117, 92), TMC(118, 83), TMC(119, 82),
   TMC(120, 86), TMC(121, 85), TMC(122, 80), TMC(123, 79), TMC(124, 89),
   TMC(125, 88), TMC(126, 83), TMC(127, 82), TMC(128, 83), TMC(129, 82),
   TMC(130, 83), TMC(131, 82), TMC(132, 86), TMC(133, 85), TMC(134, 83),
   TMC(135, 82), TMC(136, 83), TMC(137, 82), TMC(138, 86), TMC(139, 85),
   TMC(140, 83), TMC(141, 82), TMC(142, 83), TMC(143, 82), TMC(144, 80),
   TMC(145, 79), TMC(146, 72), TMC(147, 2), TMC(148, 2), TMC(149, 2),
   TMC(150, 2), TMC(151, 2), TMC(152, 2), TMC(153, 2), TMC(154, 2),
   TMC(155, 2), TMC(156, 2), TMC(157, 2), TMC(158, 2), TMC(159, 2),
   TMC(160, 2), TMC(161, 2), TMC(162, 2), TMC(163, 2), TMC(164, 2),
   TMC(165, 2), TMC(166, 2), TMC(167, 2), TMC(168, 2), TMC(169, 2),
   TMC(170, 2), TMC(171, 2), TMC(172, 2), TMC(173, 2), TMC(174, 2),
   TMC(175, 2), TMC(176, 2), TMC(177, 2), TMC(178, 2), TMC(179, 2),
   TMC(180, 2), TMC(181, 2), TMC(182, 2), TMC(183, 2), TMC(184, 2),
   TMC(185, 2), TMC(186, 2), TMC(187, 2), TMC(188, 2), TMC(189, 2),
   TMC(190, 2), TMC(191, 2), TMC(192, 2), TMC(193, 2), TMC(194, 2),
   TMC(195, 2), TMC(196, 2), TMC(197, 2), TMC(198, 2), TMC(199, 2),
   TMC(200, 2), TMC(201, 2), TMC(202, 2), TMC(203, 2), TMC(204, 2),
   TMC(205, 2), TMC(206, 2), TMC(207, 2), TMC(208, 2), TMC(209, 2),
   TMC(210, 2), TMC(211, 2), TMC(212, 2), TMC(213, 2), TMC(214, 2),
   TMC(215, 2), TMC(216, 2), TMC(217, 2), TMC(218, 2), TMC(219, 2),
   TMC(220, 2), TMC(221, 2), TMC(222, 2), TMC(223, 2), TMC(224, 2),
   TMC(225, 2), TMC(226, 2), TMC(227, 2), TMC(228, 2), TMC(229, 2),
   TMC(230, 2), TMC(231, 2), TMC(232, 2), TMC(233, 2), TMC(234, 2),
   TMC(235, 2), TMC(236, 2), TMC(237, 2), TMC(238, 2), TMC(239, 2),
   TMC(240, 2), TMC(241, 2), TMC(242, 2), TMC(243, 2), TMC(244, 2),
   TMC(245, 2), TMC(246, 2), TMC(247, 2), TMC(248, 2), TMC(249, 2),
   TMC(250, 2), TMC(251, 2), TMC(252, 2), TMC(253, 2), TMC(254, 2),
   TMC(255, 2), TMC(256, 2), TMC(257, 2), TMC(258, 2), TMC(259, 2),
   TMC(260, 2), TMC(261, 2), TMC(262, 2), TMC(263, 2), TMC(264, 2),
   TMC(265, 2), TMC(266, 2), TMC(267, 2), TMC(268, 2), TMC(269, 2),
   TMC(270, 2), TMC(271, 2), TMC(272, 2), TMC(273, 2), TMC(274, 2),
   TMC(275, 2), TMC(276, 2), TMC(277, 2), TMC(278, 2), TMC(279, 2),
   TMC(280, 2), TMC(281, 2), TMC(282, 2), TMC(283, 2), TMC(284, 2),
   TMC(285, 2), TMC(286, 2), TMC(287, 2), TMC(288, 2), TMC(289, 2),
   TMC(290, 2), TMC(291, 2), TMC(292, 2), TMC(293, 2), TMC(294, 2),
   TMC(295, 2), TMC(296, 2), TMC(297, 2), TMC(298, 2), TMC(299, 2),
   TMC(300, 2), TMC(301, 2), TMC(302, 2), TMC(303, 2), TMC(304, 2),
   TMC(305, 2), TMC(306, 2), TMC(307, 2), TMC(308, 2), TMC(309, 2),
   TMC(310, 2), TMC(311, 2), TMC(312, 2), TMC(313, 2), TMC(314, 2),
   TMC(315, 2), TMC(316, 2), TMC(317, 2), TMC(318, 2), TMC(319, 2),
   TMC(320, 2), TMC(321, 2), TMC(322, 2), TMC(323, 2), TMC(324, 2),
   TMC(325, 2), TMC(326, 2), TMC(327, 2), TMC(328, 2), TMC(329, 2),
   TMC(330, 2), TMC(331, 2), TMC(332, 2), TMC(333, 2), TMC(334, 2),
   TMC(335, 2), TMC(336, 2), TMC(337, 2), TMC(338, 2), TMC(339, 2),
   TMC(340, 2), TMC(341, 2), TMC(342, 2), TMC(343, 2), TMC(344, 2),
   TMC(345, 2), TMC(346, 2), TMC(347, 2), TMC(348, 2), TMC(349, 2),
   TMC(350, 2), TMC(351, 2), TMC(352, 2), TMC(353, 2), TMC(354, 2),
   TMC(355, 2), TMC(356, 2), TMC(357, 2), TMC(358, 2), TMC(359, 2),
   TMC(360, 2), TMC(361, 2), TMC(362, 2), TMC(363, 2), TMC(364, 2),
   TMC(365, 2), TMC(366, 2), TMC(367, 2), TMC(368, 2), TMC(369, 2),
   TMC(370, 2), TMC(371, 2), TMC(372, 2), TMC(373, 2), TMC(374, 2),
   TMC(375, 2), TMC(376, 2), TMC(377, 2), TMC(378, 2), TMC(379, 2),
   TMC(380, 2), TMC(381, 2), TMC(382, 2), TMC(383, 2), TMC(384, 2),
   TMC(385, 2), TMC(386, 2), TMC(387, 2), TMC(388, 2), TMC(389, 2),
   TMC(390, 2), TMC(391, 2), TMC(392, 2), TMC(393, 2), TMC(394, 2),
   TMC(395, 2), TMC(396, 2), TMC(397, 2), TMC(398, 2), TMC(399, 2),
   TMC(400, 2), TMC(401, 37), TMC(402, 37), TMC(403, 37), TMC(404, 37),
   TMC(405, 2), TMC(406, 2), TMC(407, 2), TMC(408, 2), TMC(409, 2),
   TMC(410, 2), TMC(411, 2), TMC(412, 2), TMC(413, 2), TMC(414, 2),
   TMC(415, 2), TMC(416, 2), TMC(417, 2), TMC(418, 2), TMC(419, 2),
   TMC(420, 2), TMC(421, 2), TMC(422, 2), TMC(423, 443), TMC(423, 446),
   TMC(423, 448), TMC(423, 451), TMC(423, 453), TMC(423, 455),
   TMC(423, 457), TMC(424, 458), TMC(424, 459), TMC(425, 460),
   TMC(425, 461), TMC(426, 462), TMC(427, 466), TMC(428, 75), TMC(429, 75),
   TMC(430, 75), TMC(431, 76), TMC(432, 75), TMC(433, 75), TMC(434, 75),
   TMC(435, 75), TMC(436, 75), TMC(437, 72), TMC(438, 72), TMC(439, 72),
   TMC(440, 74), TMC(441, 72), TMC(442, 72), TMC(443, 72), TMC(444, 72),
   TMC(445, 72), TMC(446, 66), TMC(447, 66), TMC(448, 65), TMC(449, 65),
   TMC(450, 71), TMC(451, 70), TMC(452, 69), TMC(453, 68), TMC(454, 467),
   TMC(455, 66), TMC(456, 66), TMC(457, 66), TMC(458, 66), TMC(459, 66),
   TMC(460, 66), TMC(461, 66), TMC(462, 66), TMC(463, 66), TMC(464, 66),
   TMC(465, 66), TMC(466, 65), TMC(467, 65), TMC(468, 65), TMC(469, 65),
   TMC(470, 65), TMC(471, 65), TMC(472, 65), TMC(473, 65), TMC(474, 65),
   TMC(475, 67), TMC(476, 64), TMC(477, 64), TMC(478, 64), TMC(479, 66),
   TMC(480, 66), TMC(481, 65), TMC(482, 65), TMC(483, 64), TMC(484, 470),
   TMC(485, 473), TMC(485, 475), TMC(486, 476), TMC(487, 477), TMC(488, 3),
   TMC(489, 479), TMC(489, 481), TMC(489, 483), TMC(489, 485),
   TMC(489, 487), TMC(489, 489), TMC(489, 491), TMC(489, 493),
   TMC(489, 497), TMC(489, 501), TMC(489, 505), TMC(490, 509),
   TMC(490, 513), TMC(490, 517), TMC(490, 520), TMC(491, 524),
   TMC(492, 526), TMC(493, 528), TMC(494, 63), TMC(495, 526),
   TMC(496, 526), TMC(497, 530), TMC(498, 528), TMC(499, 60),
   TMC(500, 530), TMC(501, 526), TMC(502, 57), TMC(503, 534), TMC(504, 53),
   TMC(505, 39), TMC(506, 537), TMC(507, 538), TMC(507, 539), TMC(508, 2),
   TMC(509, 2), TMC(510, 12), TMC(511, 11), TMC(512, 9), TMC(513, 7),
   TMC(514, 3), TMC(515, 3), TMC(516, 5), TMC(517, 3), TMC(518, 4),
   TMC(519, 3), TMC(520, 540), TMC(521, 542), TMC(522, 543), TMC(523, 544),
   TMC(523, 495), TMC(523, 499), TMC(523, 503), TMC(523, 394),
   TMC(524, 276)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op shn_undef_def x = x
    val op shn_undef_def =
    DT(((("elf_header",0),[]),[]), [read"%291%852@%263@"])
  fun op shn_xindex_def x = x
    val op shn_xindex_def =
    DT(((("elf_header",1),[]),[]),
       [read"%291%853@%364%316%316%316%316%316%316%316%316%316%316%316%316%316%316%316%316%388@@@@@@@@@@@@@@@@@@"])
  fun op elf_ft_none_def x = x
    val op elf_ft_none_def =
    DT(((("elf_header",2),[]),[]), [read"%291%483@%263@"])
  fun op elf_ft_rel_def x = x
    val op elf_ft_rel_def =
    DT(((("elf_header",3),[]),[]), [read"%291%484@%364%316%388@@@"])
  fun op elf_ft_exec_def x = x
    val op elf_ft_exec_def =
    DT(((("elf_header",4),[]),[]), [read"%291%478@%364%317%388@@@"])
  fun op elf_ft_dyn_def x = x
    val op elf_ft_dyn_def =
    DT(((("elf_header",5),[]),[]), [read"%291%477@%364%316%316%388@@@@"])
  fun op elf_ft_core_def x = x
    val op elf_ft_core_def =
    DT(((("elf_header",6),[]),[]), [read"%291%476@%364%317%316%388@@@@"])
  fun op elf_ft_lo_os_def x = x
    val op elf_ft_lo_os_def =
    DT(((("elf_header",7),[]),[]),
       [read"%291%481@%364%317%316%316%316%316%316%316%316%316%317%317%317%317%317%317%388@@@@@@@@@@@@@@@@@"])
  fun op elf_ft_hi_os_def x = x
    val op elf_ft_hi_os_def =
    DT(((("elf_header",8),[]),[]),
       [read"%291%479@%364%316%316%316%316%316%316%316%316%317%317%317%317%317%317%317%388@@@@@@@@@@@@@@@@@"])
  fun op elf_ft_lo_proc_def x = x
    val op elf_ft_lo_proc_def =
    DT(((("elf_header",9),[]),[]),
       [read"%291%482@%364%317%316%316%316%316%316%316%316%317%317%317%317%317%317%317%388@@@@@@@@@@@@@@@@@"])
  fun op elf_ft_hi_proc_def x = x
    val op elf_ft_hi_proc_def =
    DT(((("elf_header",10),[]),[]),
       [read"%291%480@%364%316%316%316%316%316%316%316%316%316%316%316%316%316%316%316%316%388@@@@@@@@@@@@@@@@@@"])
  fun op string_of_elf_file_type_def x = x
    val op string_of_elf_file_type_def =
    DT(((("elf_header",11),[]),[]),
       [read"%228%185%228%194%233%181%290%860$2@$1@$0@@%325%291$0@%483@@%327%321%364%317%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@%325%291$0@%484@@%327%321%364%317%317%316%316%317%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%316%388@@@@@@@@%327%321%364%317%317%316%316%317%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%388@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@%325%291$0@%478@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%317%317%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%316%316%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%316%388@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%317%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%388@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@%325%291$0@%477@@%327%321%364%317%316%317%316%316%316%388@@@@@@@@@%327%321%364%316%317%316%317%317%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%316%388@@@@@@@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%388@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@%325%291$0@%476@@%327%321%364%316%316%317%316%316%316%388@@@@@@@@@%327%321%364%316%316%316%316%317%316%388@@@@@@@@@%327%321%364%317%317%316%316%317%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%316%388@@@@@@@@%327%321%364%316%316%317%316%316%316%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%388@@@@@@@@%360@@@@@@@@@@@@@@@@@%325%262%298$0@%481@@%265$0@%479@@@$2$0@@%325%262%298$0@%482@@%265$0@%480@@@$1$0@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@|@|@|@"])
  fun op is_operating_system_specific_object_file_type_value_def x = x
    val op is_operating_system_specific_object_file_type_value_def =
    DT(((("elf_header",12),[]),[]),
       [read"%233%209%271%805$0@@%262%298$0@%364%317%316%316%316%316%316%316%316%316%317%317%317%317%317%317%388@@@@@@@@@@@@@@@@@@%265$0@%364%316%316%316%316%316%316%316%316%317%317%317%317%317%317%317%388@@@@@@@@@@@@@@@@@@@|@"])
  fun op is_processor_specific_object_file_type_value_def x = x
    val op is_processor_specific_object_file_type_value_def =
    DT(((("elf_header",13),[]),[]),
       [read"%233%209%271%806$0@@%262%298$0@%364%317%316%316%316%316%316%316%316%317%317%317%317%317%317%317%388@@@@@@@@@@@@@@@@@@%265$0@%364%316%316%316%316%316%316%316%316%316%316%316%316%316%316%316%316%388@@@@@@@@@@@@@@@@@@@@|@"])
  fun op elf_ma_riscv_def x = x
    val op elf_ma_riscv_def =
    DT(((("elf_header",14),[]),[]),
       [read"%291%672@%364%316%316%317%316%317%317%317%388@@@@@@@@@"])
  fun op elf_ma_amdgpu_def x = x
    val op elf_ma_amdgpu_def =
    DT(((("elf_header",15),[]),[]),
       [read"%291%512@%364%317%316%316%316%316%317%317%388@@@@@@@@@"])
  fun op elf_ma_moxie_def x = x
    val op elf_ma_moxie_def =
    DT(((("elf_header",16),[]),[]),
       [read"%291%604@%364%316%316%316%316%316%317%317%388@@@@@@@@@"])
  fun op elf_ma_ft32_def x = x
    val op elf_ma_ft32_def =
    DT(((("elf_header",17),[]),[]),
       [read"%291%559@%364%317%317%317%317%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_visium_def x = x
    val op elf_ma_visium_def =
    DT(((("elf_header",18),[]),[]),
       [read"%291%713@%364%316%317%317%317%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_z80_def x = x
    val op elf_ma_z80_def =
    DT(((("elf_header",19),[]),[]),
       [read"%291%720@%364%317%316%317%317%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_kalimba_def x = x
    val op elf_ma_kalimba_def =
    DT(((("elf_header",20),[]),[]),
       [read"%291%576@%364%316%316%317%317%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_norc_def x = x
    val op elf_ma_norc_def =
    DT(((("elf_header",21),[]),[]),
       [read"%291%610@%364%317%317%316%317%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_cool_def x = x
    val op elf_ma_cool_def =
    DT(((("elf_header",22),[]),[]),
       [read"%291%535@%364%316%317%316%317%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_coge_def x = x
    val op elf_ma_coge_def =
    DT(((("elf_header",23),[]),[]),
       [read"%291%533@%364%317%316%316%317%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_cdp_def x = x
    val op elf_ma_cdp_def =
    DT(((("elf_header",24),[]),[]),
       [read"%291%530@%364%316%316%316%317%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_kvarc_def x = x
    val op elf_ma_kvarc_def =
    DT(((("elf_header",25),[]),[]),
       [read"%291%581@%364%317%317%317%316%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_kmx8_def x = x
    val op elf_ma_kmx8_def =
    DT(((("elf_header",26),[]),[]),
       [read"%291%580@%364%316%317%317%316%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_kmx16_def x = x
    val op elf_ma_kmx16_def =
    DT(((("elf_header",27),[]),[]),
       [read"%291%578@%364%317%316%317%316%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_kmx32_def x = x
    val op elf_ma_kmx32_def =
    DT(((("elf_header",28),[]),[]),
       [read"%291%579@%364%316%316%317%316%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_km32_def x = x
    val op elf_ma_km32_def =
    DT(((("elf_header",29),[]),[]),
       [read"%291%577@%364%317%317%316%316%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_mchp_pic_def x = x
    val op elf_ma_mchp_pic_def =
    DT(((("elf_header",30),[]),[]),
       [read"%291%591@%364%317%316%317%317%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_xcore_def x = x
    val op elf_ma_xcore_def =
    DT(((("elf_header",31),[]),[]),
       [read"%291%716@%364%316%316%317%317%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_ba2_def x = x
    val op elf_ma_ba2_def =
    DT(((("elf_header",32),[]),[]),
       [read"%291%522@%364%317%317%316%317%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_ba1_def x = x
    val op elf_ma_ba1_def =
    DT(((("elf_header",33),[]),[]),
       [read"%291%521@%364%316%317%316%317%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_5600ex_def x = x
    val op elf_ma_5600ex_def =
    DT(((("elf_header",34),[]),[]),
       [read"%291%497@%364%317%316%316%317%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_78kor_def x = x
    val op elf_ma_78kor_def =
    DT(((("elf_header",35),[]),[]),
       [read"%291%504@%364%316%316%316%317%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_videocore5_def x = x
    val op elf_ma_videocore5_def =
    DT(((("elf_header",36),[]),[]),
       [read"%291%712@%364%317%317%317%316%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_rl78_def x = x
    val op elf_ma_rl78_def =
    DT(((("elf_header",37),[]),[]),
       [read"%291%673@%364%316%317%317%316%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_open8_def x = x
    val op elf_ma_open8_def =
    DT(((("elf_header",38),[]),[]),
       [read"%291%612@%364%317%316%317%316%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_arc_compact2_def x = x
    val op elf_ma_arc_compact2_def =
    DT(((("elf_header",39),[]),[]),
       [read"%291%515@%364%316%316%317%316%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_corea_2nd_def x = x
    val op elf_ma_corea_2nd_def =
    DT(((("elf_header",40),[]),[]),
       [read"%291%537@%364%317%317%316%316%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_corea_1st_def x = x
    val op elf_ma_corea_1st_def =
    DT(((("elf_header",41),[]),[]),
       [read"%291%536@%364%316%317%316%316%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_cloudshield_def x = x
    val op elf_ma_cloudshield_def =
    DT(((("elf_header",42),[]),[]),
       [read"%291%532@%364%317%316%316%316%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_sle9x_def x = x
    val op elf_ma_sle9x_def =
    DT(((("elf_header",43),[]),[]),
       [read"%291%682@%364%316%316%317%316%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_l10m_def x = x
    val op elf_ma_l10m_def =
    DT(((("elf_header",44),[]),[]),
       [read"%291%582@%364%317%316%317%316%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_k10m_def x = x
    val op elf_ma_k10m_def =
    DT(((("elf_header",45),[]),[]),
       [read"%291%575@%364%316%317%317%316%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_aarch64_def x = x
    val op elf_ma_aarch64_def =
    DT(((("elf_header",46),[]),[]),
       [read"%291%509@%364%316%316%316%317%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_avr32_def x = x
    val op elf_ma_avr32_def =
    DT(((("elf_header",47),[]),[]),
       [read"%291%520@%364%316%317%316%317%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_stm8_def x = x
    val op elf_ma_stm8_def =
    DT(((("elf_header",48),[]),[]),
       [read"%291%694@%364%317%317%316%317%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_tile64_def x = x
    val op elf_ma_tile64_def =
    DT(((("elf_header",49),[]),[]),
       [read"%291%697@%364%316%316%317%317%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_tilepro_def x = x
    val op elf_ma_tilepro_def =
    DT(((("elf_header",50),[]),[]),
       [read"%291%699@%364%317%316%317%317%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_microblaze_def x = x
    val op elf_ma_microblaze_def =
    DT(((("elf_header",51),[]),[]),
       [read"%291%595@%364%316%317%317%317%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_cuda_def x = x
    val op elf_ma_cuda_def =
    DT(((("elf_header",52),[]),[]),
       [read"%291%543@%364%317%317%317%317%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_tilegx_def x = x
    val op elf_ma_tilegx_def =
    DT(((("elf_header",53),[]),[]),
       [read"%291%698@%364%316%316%316%316%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_cypress_def x = x
    val op elf_ma_cypress_def =
    DT(((("elf_header",54),[]),[]),
       [read"%291%544@%364%316%317%316%316%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_r32c_def x = x
    val op elf_ma_r32c_def =
    DT(((("elf_header",55),[]),[]),
       [read"%291%624@%364%317%317%316%316%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_trimedia_def x = x
    val op elf_ma_trimedia_def =
    DT(((("elf_header",56),[]),[]),
       [read"%291%704@%364%316%316%317%316%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_qdsp6_def x = x
    val op elf_ma_qdsp6_def =
    DT(((("elf_header",57),[]),[]),
       [read"%291%623@%364%317%316%317%316%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_8051_def x = x
    val op elf_ma_8051_def =
    DT(((("elf_header",58),[]),[]),
       [read"%291%505@%364%316%317%317%316%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_stxp7x_def x = x
    val op elf_ma_stxp7x_def =
    DT(((("elf_header",59),[]),[]),
       [read"%291%695@%364%317%317%317%316%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_nds32_def x = x
    val op elf_ma_nds32_def =
    DT(((("elf_header",60),[]),[]),
       [read"%291%608@%364%316%316%316%317%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_ecog1x_def x = x
    val op elf_ma_ecog1x_def =
    DT(((("elf_header",61),[]),[]),
       [read"%291%551@%364%317%316%316%317%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_maxq30_def x = x
    val op elf_ma_maxq30_def =
    DT(((("elf_header",62),[]),[]),
       [read"%291%590@%364%316%317%316%317%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_ximo16_def x = x
    val op elf_ma_ximo16_def =
    DT(((("elf_header",63),[]),[]),
       [read"%291%718@%364%317%317%316%317%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_manik_def x = x
    val op elf_ma_manik_def =
    DT(((("elf_header",64),[]),[]),
       [read"%291%588@%364%316%316%317%317%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_craynv2_def x = x
    val op elf_ma_craynv2_def =
    DT(((("elf_header",65),[]),[]),
       [read"%291%540@%364%317%316%317%317%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_rx_def x = x
    val op elf_ma_rx_def =
    DT(((("elf_header",66),[]),[]),
       [read"%291%675@%364%316%317%317%317%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_metag_def x = x
    val op elf_ma_metag_def =
    DT(((("elf_header",67),[]),[]),
       [read"%291%594@%364%317%317%317%317%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_mcst_elbrus_def x = x
    val op elf_ma_mcst_elbrus_def =
    DT(((("elf_header",68),[]),[]),
       [read"%291%592@%364%316%316%316%316%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_ecog16_def x = x
    val op elf_ma_ecog16_def =
    DT(((("elf_header",69),[]),[]),
       [read"%291%550@%364%317%316%316%316%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_cr16_def x = x
    val op elf_ma_cr16_def =
    DT(((("elf_header",70),[]),[]),
       [read"%291%539@%364%316%317%316%316%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_etpu_def x = x
    val op elf_ma_etpu_def =
    DT(((("elf_header",71),[]),[]),
       [read"%291%553@%364%317%317%316%316%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_tsk3000_def x = x
    val op elf_ma_tsk3000_def =
    DT(((("elf_header",72),[]),[]),
       [read"%291%705@%364%316%316%317%316%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_rs08_def x = x
    val op elf_ma_rs08_def =
    DT(((("elf_header",73),[]),[]),
       [read"%291%674@%364%317%316%317%316%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_sharc_def x = x
    val op elf_ma_sharc_def =
    DT(((("elf_header",74),[]),[]),
       [read"%291%681@%364%316%317%317%316%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_ecog2_def x = x
    val op elf_ma_ecog2_def =
    DT(((("elf_header",75),[]),[]),
       [read"%291%552@%364%317%317%317%316%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_ccore7_def x = x
    val op elf_ma_ccore7_def =
    DT(((("elf_header",76),[]),[]),
       [read"%291%529@%364%316%316%316%317%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_dsp24_def x = x
    val op elf_ma_dsp24_def =
    DT(((("elf_header",77),[]),[]),
       [read"%291%547@%364%317%316%316%317%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_videocore3_def x = x
    val op elf_ma_videocore3_def =
    DT(((("elf_header",78),[]),[]),
       [read"%291%711@%364%316%317%316%317%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_latticemico32_def x = x
    val op elf_ma_latticemico32_def =
    DT(((("elf_header",79),[]),[]),
       [read"%291%583@%364%317%317%316%317%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_c17_def x = x
    val op elf_ma_c17_def =
    DT(((("elf_header",80),[]),[]),
       [read"%291%525@%364%316%316%317%317%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_c6000_def x = x
    val op elf_ma_c6000_def =
    DT(((("elf_header",81),[]),[]),
       [read"%291%528@%364%317%316%317%317%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_c2000_def x = x
    val op elf_ma_c2000_def =
    DT(((("elf_header",82),[]),[]),
       [read"%291%526@%364%316%317%317%317%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_c5500_def x = x
    val op elf_ma_c5500_def =
    DT(((("elf_header",83),[]),[]),
       [read"%291%527@%364%317%317%317%317%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_mmdsp_plus_def x = x
    val op elf_ma_mmdsp_plus_def =
    DT(((("elf_header",84),[]),[]),
       [read"%291%600@%364%317%316%316%316%316%317%316%388@@@@@@@@@"])
  fun op elf_ma_zsp_def x = x
    val op elf_ma_zsp_def =
    DT(((("elf_header",85),[]),[]),
       [read"%291%721@%364%316%316%316%316%317%316%388@@@@@@@@"])
  fun op elf_ma_mmix_def x = x
    val op elf_ma_mmix_def =
    DT(((("elf_header",86),[]),[]),
       [read"%291%601@%364%317%316%316%316%317%316%388@@@@@@@@"])
  fun op elf_ma_huany_def x = x
    val op elf_ma_huany_def =
    DT(((("elf_header",87),[]),[]),
       [read"%291%565@%364%316%317%316%316%317%316%388@@@@@@@@"])
  fun op elf_ma_prism_def x = x
    val op elf_ma_prism_def =
    DT(((("elf_header",88),[]),[]),
       [read"%291%622@%364%317%317%316%316%317%316%388@@@@@@@@"])
  fun op elf_ma_avr_def x = x
    val op elf_ma_avr_def =
    DT(((("elf_header",89),[]),[]),
       [read"%291%519@%364%316%316%317%316%317%316%388@@@@@@@@"])
  fun op elf_ma_fr30_def x = x
    val op elf_ma_fr30_def =
    DT(((("elf_header",90),[]),[]),
       [read"%291%558@%364%317%316%317%316%317%316%388@@@@@@@@"])
  fun op elf_ma_d10v_def x = x
    val op elf_ma_d10v_def =
    DT(((("elf_header",91),[]),[]),
       [read"%291%545@%364%316%317%317%316%317%316%388@@@@@@@@"])
  fun op elf_ma_d30v_def x = x
    val op elf_ma_d30v_def =
    DT(((("elf_header",92),[]),[]),
       [read"%291%546@%364%317%317%317%316%317%316%388@@@@@@@@"])
  fun op elf_ma_v850_def x = x
    val op elf_ma_v850_def =
    DT(((("elf_header",93),[]),[]),
       [read"%291%708@%364%316%316%316%317%317%316%388@@@@@@@@"])
  fun op elf_ma_m32r_def x = x
    val op elf_ma_m32r_def =
    DT(((("elf_header",94),[]),[]),
       [read"%291%587@%364%317%316%316%317%317%316%388@@@@@@@@"])
  fun op elf_ma_mn10300_def x = x
    val op elf_ma_mn10300_def =
    DT(((("elf_header",95),[]),[]),
       [read"%291%603@%364%316%317%316%317%317%316%388@@@@@@@@"])
  fun op elf_ma_mn10200_def x = x
    val op elf_ma_mn10200_def =
    DT(((("elf_header",96),[]),[]),
       [read"%291%602@%364%317%317%316%317%317%316%388@@@@@@@@"])
  fun op elf_ma_pj_def x = x
    val op elf_ma_pj_def =
    DT(((("elf_header",97),[]),[]),
       [read"%291%619@%364%316%316%317%317%317%316%388@@@@@@@@"])
  fun op elf_ma_openrisc_def x = x
    val op elf_ma_openrisc_def =
    DT(((("elf_header",98),[]),[]),
       [read"%291%613@%364%317%316%317%317%317%316%388@@@@@@@@"])
  fun op elf_ma_arc_compact_def x = x
    val op elf_ma_arc_compact_def =
    DT(((("elf_header",99),[]),[]),
       [read"%291%514@%364%316%317%317%317%317%316%388@@@@@@@@"])
  fun op elf_ma_xtensa_def x = x
    val op elf_ma_xtensa_def =
    DT(((("elf_header",100),[]),[]),
       [read"%291%719@%364%317%317%317%317%317%316%388@@@@@@@@"])
  fun op elf_ma_videocore_def x = x
    val op elf_ma_videocore_def =
    DT(((("elf_header",101),[]),[]),
       [read"%291%710@%364%316%316%316%316%316%317%388@@@@@@@@"])
  fun op elf_ma_tmm_gpp_def x = x
    val op elf_ma_tmm_gpp_def =
    DT(((("elf_header",102),[]),[]),
       [read"%291%701@%364%317%316%316%316%316%317%388@@@@@@@@"])
  fun op elf_ma_ns32k_def x = x
    val op elf_ma_ns32k_def =
    DT(((("elf_header",103),[]),[]),
       [read"%291%611@%364%316%317%316%316%316%317%388@@@@@@@@"])
  fun op elf_ma_tpc_def x = x
    val op elf_ma_tpc_def =
    DT(((("elf_header",104),[]),[]),
       [read"%291%702@%364%317%317%316%316%316%317%388@@@@@@@@"])
  fun op elf_ma_snp1k_def x = x
    val op elf_ma_snp1k_def =
    DT(((("elf_header",105),[]),[]),
       [read"%291%683@%364%316%316%317%316%316%317%388@@@@@@@@"])
  fun op elf_ma_st200_def x = x
    val op elf_ma_st200_def =
    DT(((("elf_header",106),[]),[]),
       [read"%291%690@%364%317%316%317%316%316%317%388@@@@@@@@"])
  fun op elf_ma_ip2k_def x = x
    val op elf_ma_ip2k_def =
    DT(((("elf_header",107),[]),[]),
       [read"%291%573@%364%316%317%317%316%316%317%388@@@@@@@@"])
  fun op elf_ma_max_def x = x
    val op elf_ma_max_def =
    DT(((("elf_header",108),[]),[]),
       [read"%291%589@%364%317%317%317%316%316%317%388@@@@@@@@"])
  fun op elf_ma_cr_def x = x
    val op elf_ma_cr_def =
    DT(((("elf_header",109),[]),[]),
       [read"%291%538@%364%316%316%316%317%316%317%388@@@@@@@@"])
  fun op elf_ma_f2mc16_def x = x
    val op elf_ma_f2mc16_def =
    DT(((("elf_header",110),[]),[]),
       [read"%291%555@%364%317%316%316%317%316%317%388@@@@@@@@"])
  fun op elf_ma_msp430_def x = x
    val op elf_ma_msp430_def =
    DT(((("elf_header",111),[]),[]),
       [read"%291%605@%364%316%317%316%317%316%317%388@@@@@@@@"])
  fun op elf_ma_blackfin_def x = x
    val op elf_ma_blackfin_def =
    DT(((("elf_header",112),[]),[]),
       [read"%291%523@%364%317%317%316%317%316%317%388@@@@@@@@"])
  fun op elf_ma_se_c33_def x = x
    val op elf_ma_se_c33_def =
    DT(((("elf_header",113),[]),[]),
       [read"%291%678@%364%316%316%317%317%316%317%388@@@@@@@@"])
  fun op elf_ma_sep_def x = x
    val op elf_ma_sep_def =
    DT(((("elf_header",114),[]),[]),
       [read"%291%679@%364%317%316%317%317%316%317%388@@@@@@@@"])
  fun op elf_ma_arca_def x = x
    val op elf_ma_arca_def =
    DT(((("elf_header",115),[]),[]),
       [read"%291%516@%364%316%317%317%317%316%317%388@@@@@@@@"])
  fun op elf_ma_unicore_def x = x
    val op elf_ma_unicore_def =
    DT(((("elf_header",116),[]),[]),
       [read"%291%706@%364%317%317%317%317%316%317%388@@@@@@@@"])
  fun op elf_ma_excess_def x = x
    val op elf_ma_excess_def =
    DT(((("elf_header",117),[]),[]),
       [read"%291%554@%364%316%316%316%316%317%317%388@@@@@@@@"])
  fun op elf_ma_dxp_def x = x
    val op elf_ma_dxp_def =
    DT(((("elf_header",118),[]),[]),
       [read"%291%549@%364%317%316%316%316%317%317%388@@@@@@@@"])
  fun op elf_ma_altera_nios2_def x = x
    val op elf_ma_altera_nios2_def =
    DT(((("elf_header",119),[]),[]),
       [read"%291%511@%364%316%317%316%316%317%317%388@@@@@@@@"])
  fun op elf_ma_crx_def x = x
    val op elf_ma_crx_def =
    DT(((("elf_header",120),[]),[]),
       [read"%291%542@%364%317%317%316%316%317%317%388@@@@@@@@"])
  fun op elf_ma_xgate_def x = x
    val op elf_ma_xgate_def =
    DT(((("elf_header",121),[]),[]),
       [read"%291%717@%364%316%316%317%316%317%317%388@@@@@@@@"])
  fun op elf_ma_c166_def x = x
    val op elf_ma_c166_def =
    DT(((("elf_header",122),[]),[]),
       [read"%291%524@%364%317%316%317%316%317%317%388@@@@@@@@"])
  fun op elf_ma_m16c_def x = x
    val op elf_ma_m16c_def =
    DT(((("elf_header",123),[]),[]),
       [read"%291%584@%364%316%317%317%316%317%317%388@@@@@@@@"])
  fun op elf_ma_dspic30f_def x = x
    val op elf_ma_dspic30f_def =
    DT(((("elf_header",124),[]),[]),
       [read"%291%548@%364%317%317%317%316%317%317%388@@@@@@@@"])
  fun op elf_ma_ce_def x = x
    val op elf_ma_ce_def =
    DT(((("elf_header",125),[]),[]),
       [read"%291%531@%364%316%316%316%317%317%317%388@@@@@@@@"])
  fun op elf_ma_m32c_def x = x
    val op elf_ma_m32c_def =
    DT(((("elf_header",126),[]),[]),
       [read"%291%586@%364%317%316%316%317%317%317%388@@@@@@@@"])
  fun op elf_ma_none_def x = x
    val op elf_ma_none_def =
    DT(((("elf_header",127),[]),[]), [read"%291%609@%263@"])
  fun op elf_ma_m32_def x = x
    val op elf_ma_m32_def =
    DT(((("elf_header",128),[]),[]), [read"%291%585@%364%316%388@@@"])
  fun op elf_ma_sparc_def x = x
    val op elf_ma_sparc_def =
    DT(((("elf_header",129),[]),[]), [read"%291%684@%364%317%388@@@"])
  fun op elf_ma_386_def x = x
    val op elf_ma_386_def =
    DT(((("elf_header",130),[]),[]), [read"%291%496@%364%316%316%388@@@@"])
  fun op elf_ma_68k_def x = x
    val op elf_ma_68k_def =
    DT(((("elf_header",131),[]),[]), [read"%291%503@%364%317%316%388@@@@"])
  fun op elf_ma_88k_def x = x
    val op elf_ma_88k_def =
    DT(((("elf_header",132),[]),[]), [read"%291%507@%364%316%317%388@@@@"])
  fun op elf_ma_860_def x = x
    val op elf_ma_860_def =
    DT(((("elf_header",133),[]),[]),
       [read"%291%506@%364%316%316%316%388@@@@@"])
  fun op elf_ma_mips_def x = x
    val op elf_ma_mips_def =
    DT(((("elf_header",134),[]),[]),
       [read"%291%596@%364%317%316%316%388@@@@@"])
  fun op elf_ma_s370_def x = x
    val op elf_ma_s370_def =
    DT(((("elf_header",135),[]),[]),
       [read"%291%676@%364%316%317%316%388@@@@@"])
  fun op elf_ma_mips_rs3_le_def x = x
    val op elf_ma_mips_rs3_le_def =
    DT(((("elf_header",136),[]),[]),
       [read"%291%597@%364%317%317%316%388@@@@@"])
  fun op elf_ma_parisc_def x = x
    val op elf_ma_parisc_def =
    DT(((("elf_header",137),[]),[]),
       [read"%291%614@%364%316%316%316%316%388@@@@@@"])
  fun op elf_ma_vpp500_def x = x
    val op elf_ma_vpp500_def =
    DT(((("elf_header",138),[]),[]),
       [read"%291%714@%364%316%317%316%316%388@@@@@@"])
  fun op elf_ma_sparc32plus_def x = x
    val op elf_ma_sparc32plus_def =
    DT(((("elf_header",139),[]),[]),
       [read"%291%685@%364%317%317%316%316%388@@@@@@"])
  fun op elf_ma_960_def x = x
    val op elf_ma_960_def =
    DT(((("elf_header",140),[]),[]),
       [read"%291%508@%364%316%316%317%316%388@@@@@@"])
  fun op elf_ma_ppc_def x = x
    val op elf_ma_ppc_def =
    DT(((("elf_header",141),[]),[]),
       [read"%291%620@%364%317%316%317%316%388@@@@@@"])
  fun op elf_ma_ppc64_def x = x
    val op elf_ma_ppc64_def =
    DT(((("elf_header",142),[]),[]),
       [read"%291%621@%364%316%317%317%316%388@@@@@@"])
  fun op elf_ma_s390_def x = x
    val op elf_ma_s390_def =
    DT(((("elf_header",143),[]),[]),
       [read"%291%677@%364%317%317%317%316%388@@@@@@"])
  fun op elf_ma_spu_def x = x
    val op elf_ma_spu_def =
    DT(((("elf_header",144),[]),[]),
       [read"%291%687@%364%316%316%316%317%388@@@@@@"])
  fun op elf_ma_v800_def x = x
    val op elf_ma_v800_def =
    DT(((("elf_header",145),[]),[]),
       [read"%291%707@%364%317%316%317%316%316%388@@@@@@@"])
  fun op elf_ma_fr20_def x = x
    val op elf_ma_fr20_def =
    DT(((("elf_header",146),[]),[]),
       [read"%291%557@%364%316%317%317%316%316%388@@@@@@@"])
  fun op elf_ma_rh32_def x = x
    val op elf_ma_rh32_def =
    DT(((("elf_header",147),[]),[]),
       [read"%291%671@%364%317%317%317%316%316%388@@@@@@@"])
  fun op elf_ma_rce_def x = x
    val op elf_ma_rce_def =
    DT(((("elf_header",148),[]),[]),
       [read"%291%625@%364%316%316%316%317%316%388@@@@@@@"])
  fun op elf_ma_arm_def x = x
    val op elf_ma_arm_def =
    DT(((("elf_header",149),[]),[]),
       [read"%291%517@%364%317%316%316%317%316%388@@@@@@@"])
  fun op elf_ma_alpha_def x = x
    val op elf_ma_alpha_def =
    DT(((("elf_header",150),[]),[]),
       [read"%291%510@%364%316%317%316%317%316%388@@@@@@@"])
  fun op elf_ma_sh_def x = x
    val op elf_ma_sh_def =
    DT(((("elf_header",151),[]),[]),
       [read"%291%680@%364%317%317%316%317%316%388@@@@@@@"])
  fun op elf_ma_sparcv9_def x = x
    val op elf_ma_sparcv9_def =
    DT(((("elf_header",152),[]),[]),
       [read"%291%686@%364%316%316%317%317%316%388@@@@@@@"])
  fun op elf_ma_tricore_def x = x
    val op elf_ma_tricore_def =
    DT(((("elf_header",153),[]),[]),
       [read"%291%703@%364%317%316%317%317%316%388@@@@@@@"])
  fun op elf_ma_arc_def x = x
    val op elf_ma_arc_def =
    DT(((("elf_header",154),[]),[]),
       [read"%291%513@%364%316%317%317%317%316%388@@@@@@@"])
  fun op elf_ma_h8_300_def x = x
    val op elf_ma_h8_300_def =
    DT(((("elf_header",155),[]),[]),
       [read"%291%561@%364%317%317%317%317%316%388@@@@@@@"])
  fun op elf_ma_h8_300h_def x = x
    val op elf_ma_h8_300h_def =
    DT(((("elf_header",156),[]),[]),
       [read"%291%562@%364%316%316%316%316%317%388@@@@@@@"])
  fun op elf_ma_h8s_def x = x
    val op elf_ma_h8s_def =
    DT(((("elf_header",157),[]),[]),
       [read"%291%564@%364%317%316%316%316%317%388@@@@@@@"])
  fun op elf_ma_h8_500_def x = x
    val op elf_ma_h8_500_def =
    DT(((("elf_header",158),[]),[]),
       [read"%291%563@%364%316%317%316%316%317%388@@@@@@@"])
  fun op elf_ma_ia_64_def x = x
    val op elf_ma_ia_64_def =
    DT(((("elf_header",159),[]),[]),
       [read"%291%566@%364%317%317%316%316%317%388@@@@@@@"])
  fun op elf_ma_mips_x_def x = x
    val op elf_ma_mips_x_def =
    DT(((("elf_header",160),[]),[]),
       [read"%291%598@%364%316%316%317%316%317%388@@@@@@@"])
  fun op elf_ma_coldfire_def x = x
    val op elf_ma_coldfire_def =
    DT(((("elf_header",161),[]),[]),
       [read"%291%534@%364%317%316%317%316%317%388@@@@@@@"])
  fun op elf_ma_68hc12_def x = x
    val op elf_ma_68hc12_def =
    DT(((("elf_header",162),[]),[]),
       [read"%291%501@%364%316%317%317%316%317%388@@@@@@@"])
  fun op elf_ma_mma_def x = x
    val op elf_ma_mma_def =
    DT(((("elf_header",163),[]),[]),
       [read"%291%599@%364%317%317%317%316%317%388@@@@@@@"])
  fun op elf_ma_pcp_def x = x
    val op elf_ma_pcp_def =
    DT(((("elf_header",164),[]),[]),
       [read"%291%615@%364%316%316%316%317%317%388@@@@@@@"])
  fun op elf_ma_ncpu_def x = x
    val op elf_ma_ncpu_def =
    DT(((("elf_header",165),[]),[]),
       [read"%291%606@%364%317%316%316%317%317%388@@@@@@@"])
  fun op elf_ma_ndr1_def x = x
    val op elf_ma_ndr1_def =
    DT(((("elf_header",166),[]),[]),
       [read"%291%607@%364%316%317%316%317%317%388@@@@@@@"])
  fun op elf_ma_starcore_def x = x
    val op elf_ma_starcore_def =
    DT(((("elf_header",167),[]),[]),
       [read"%291%693@%364%317%317%316%317%317%388@@@@@@@"])
  fun op elf_ma_me16_def x = x
    val op elf_ma_me16_def =
    DT(((("elf_header",168),[]),[]),
       [read"%291%593@%364%316%316%317%317%317%388@@@@@@@"])
  fun op elf_ma_st100_def x = x
    val op elf_ma_st100_def =
    DT(((("elf_header",169),[]),[]),
       [read"%291%688@%364%317%316%317%317%317%388@@@@@@@"])
  fun op elf_ma_tinyj_def x = x
    val op elf_ma_tinyj_def =
    DT(((("elf_header",170),[]),[]),
       [read"%291%700@%364%316%317%317%317%317%388@@@@@@@"])
  fun op elf_ma_x86_64_def x = x
    val op elf_ma_x86_64_def =
    DT(((("elf_header",171),[]),[]),
       [read"%291%715@%364%317%317%317%317%317%388@@@@@@@"])
  fun op elf_ma_pdsp_def x = x
    val op elf_ma_pdsp_def =
    DT(((("elf_header",172),[]),[]),
       [read"%291%618@%364%316%316%316%316%316%316%388@@@@@@@@"])
  fun op elf_ma_pdp10_def x = x
    val op elf_ma_pdp10_def =
    DT(((("elf_header",173),[]),[]),
       [read"%291%616@%364%317%316%316%316%316%316%388@@@@@@@@"])
  fun op elf_ma_pdp11_def x = x
    val op elf_ma_pdp11_def =
    DT(((("elf_header",174),[]),[]),
       [read"%291%617@%364%316%317%316%316%316%316%388@@@@@@@@"])
  fun op elf_ma_fx66_def x = x
    val op elf_ma_fx66_def =
    DT(((("elf_header",175),[]),[]),
       [read"%291%560@%364%317%317%316%316%316%316%388@@@@@@@@"])
  fun op elf_ma_st9plus_def x = x
    val op elf_ma_st9plus_def =
    DT(((("elf_header",176),[]),[]),
       [read"%291%692@%364%316%316%317%316%316%316%388@@@@@@@@"])
  fun op elf_ma_st7_def x = x
    val op elf_ma_st7_def =
    DT(((("elf_header",177),[]),[]),
       [read"%291%691@%364%317%316%317%316%316%316%388@@@@@@@@"])
  fun op elf_ma_68hc16_def x = x
    val op elf_ma_68hc16_def =
    DT(((("elf_header",178),[]),[]),
       [read"%291%502@%364%316%317%317%316%316%316%388@@@@@@@@"])
  fun op elf_ma_68hc11_def x = x
    val op elf_ma_68hc11_def =
    DT(((("elf_header",179),[]),[]),
       [read"%291%500@%364%317%317%317%316%316%316%388@@@@@@@@"])
  fun op elf_ma_68hc08_def x = x
    val op elf_ma_68hc08_def =
    DT(((("elf_header",180),[]),[]),
       [read"%291%499@%364%316%316%316%317%316%316%388@@@@@@@@"])
  fun op elf_ma_68hc05_def x = x
    val op elf_ma_68hc05_def =
    DT(((("elf_header",181),[]),[]),
       [read"%291%498@%364%317%316%316%317%316%316%388@@@@@@@@"])
  fun op elf_ma_svx_def x = x
    val op elf_ma_svx_def =
    DT(((("elf_header",182),[]),[]),
       [read"%291%696@%364%316%317%316%317%316%316%388@@@@@@@@"])
  fun op elf_ma_st19_def x = x
    val op elf_ma_st19_def =
    DT(((("elf_header",183),[]),[]),
       [read"%291%689@%364%317%317%316%317%316%316%388@@@@@@@@"])
  fun op elf_ma_vax_def x = x
    val op elf_ma_vax_def =
    DT(((("elf_header",184),[]),[]),
       [read"%291%709@%364%316%316%317%317%316%316%388@@@@@@@@"])
  fun op elf_ma_cris_def x = x
    val op elf_ma_cris_def =
    DT(((("elf_header",185),[]),[]),
       [read"%291%541@%364%317%316%317%317%316%316%388@@@@@@@@"])
  fun op elf_ma_javelin_def x = x
    val op elf_ma_javelin_def =
    DT(((("elf_header",186),[]),[]),
       [read"%291%574@%364%316%317%317%317%316%316%388@@@@@@@@"])
  fun op elf_ma_firepath_def x = x
    val op elf_ma_firepath_def =
    DT(((("elf_header",187),[]),[]),
       [read"%291%556@%364%317%317%317%317%316%316%388@@@@@@@@"])
  fun op elf_ma_intel209_def x = x
    val op elf_ma_intel209_def =
    DT(((("elf_header",188),[]),[]),
       [read"%291%572@%364%316%317%316%316%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_intel208_def x = x
    val op elf_ma_intel208_def =
    DT(((("elf_header",189),[]),[]),
       [read"%291%571@%364%317%316%316%316%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_intel207_def x = x
    val op elf_ma_intel207_def =
    DT(((("elf_header",190),[]),[]),
       [read"%291%570@%364%316%316%316%316%317%316%317%388@@@@@@@@@"])
  fun op elf_ma_intel206_def x = x
    val op elf_ma_intel206_def =
    DT(((("elf_header",191),[]),[]),
       [read"%291%569@%364%317%317%317%317%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_intel205_def x = x
    val op elf_ma_intel205_def =
    DT(((("elf_header",192),[]),[]),
       [read"%291%568@%364%316%317%317%317%316%316%317%388@@@@@@@@@"])
  fun op elf_ma_intel182_def x = x
    val op elf_ma_intel182_def =
    DT(((("elf_header",193),[]),[]),
       [read"%291%567@%364%317%317%317%316%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_arm184_def x = x
    val op elf_ma_arm184_def =
    DT(((("elf_header",194),[]),[]),
       [read"%291%518@%364%317%316%316%317%317%317%316%388@@@@@@@@@"])
  fun op elf_ma_reserved6_def x = x
    val op elf_ma_reserved6_def =
    DT(((("elf_header",195),[]),[]), [read"%291%670@%364%317%317%388@@@@"])
  fun op elf_ma_reserved11_def x = x
    val op elf_ma_reserved11_def =
    DT(((("elf_header",196),[]),[]),
       [read"%291%626@%364%316%316%317%388@@@@@"])
  fun op elf_ma_reserved12_def x = x
    val op elf_ma_reserved12_def =
    DT(((("elf_header",197),[]),[]),
       [read"%291%627@%364%317%316%317%388@@@@@"])
  fun op elf_ma_reserved13_def x = x
    val op elf_ma_reserved13_def =
    DT(((("elf_header",198),[]),[]),
       [read"%291%637@%364%316%317%317%388@@@@@"])
  fun op elf_ma_reserved14_def x = x
    val op elf_ma_reserved14_def =
    DT(((("elf_header",199),[]),[]),
       [read"%291%639@%364%317%317%317%388@@@@@"])
  fun op elf_ma_reserved16_def x = x
    val op elf_ma_reserved16_def =
    DT(((("elf_header",200),[]),[]),
       [read"%291%657@%364%317%316%316%316%388@@@@@@"])
  fun op elf_ma_reserved24_def x = x
    val op elf_ma_reserved24_def =
    DT(((("elf_header",201),[]),[]),
       [read"%291%658@%364%317%316%316%317%388@@@@@@"])
  fun op elf_ma_reserved25_def x = x
    val op elf_ma_reserved25_def =
    DT(((("elf_header",202),[]),[]),
       [read"%291%659@%364%316%317%316%317%388@@@@@@"])
  fun op elf_ma_reserved26_def x = x
    val op elf_ma_reserved26_def =
    DT(((("elf_header",203),[]),[]),
       [read"%291%660@%364%317%317%316%317%388@@@@@@"])
  fun op elf_ma_reserved27_def x = x
    val op elf_ma_reserved27_def =
    DT(((("elf_header",204),[]),[]),
       [read"%291%661@%364%316%316%317%317%388@@@@@@"])
  fun op elf_ma_reserved28_def x = x
    val op elf_ma_reserved28_def =
    DT(((("elf_header",205),[]),[]),
       [read"%291%662@%364%317%316%317%317%388@@@@@@"])
  fun op elf_ma_reserved29_def x = x
    val op elf_ma_reserved29_def =
    DT(((("elf_header",206),[]),[]),
       [read"%291%663@%364%316%317%317%317%388@@@@@@"])
  fun op elf_ma_reserved30_def x = x
    val op elf_ma_reserved30_def =
    DT(((("elf_header",207),[]),[]),
       [read"%291%664@%364%317%317%317%317%388@@@@@@"])
  fun op elf_ma_reserved31_def x = x
    val op elf_ma_reserved31_def =
    DT(((("elf_header",208),[]),[]),
       [read"%291%665@%364%316%316%316%316%316%388@@@@@@@"])
  fun op elf_ma_reserved32_def x = x
    val op elf_ma_reserved32_def =
    DT(((("elf_header",209),[]),[]),
       [read"%291%666@%364%317%316%316%316%316%388@@@@@@@"])
  fun op elf_ma_reserved33_def x = x
    val op elf_ma_reserved33_def =
    DT(((("elf_header",210),[]),[]),
       [read"%291%667@%364%316%317%316%316%316%388@@@@@@@"])
  fun op elf_ma_reserved34_def x = x
    val op elf_ma_reserved34_def =
    DT(((("elf_header",211),[]),[]),
       [read"%291%668@%364%317%317%316%316%316%388@@@@@@@"])
  fun op elf_ma_reserved35_def x = x
    val op elf_ma_reserved35_def =
    DT(((("elf_header",212),[]),[]),
       [read"%291%669@%364%316%316%317%316%316%388@@@@@@@"])
  fun op elf_ma_reserved121_def x = x
    val op elf_ma_reserved121_def =
    DT(((("elf_header",213),[]),[]),
       [read"%291%628@%364%316%317%316%317%317%317%388@@@@@@@@"])
  fun op elf_ma_reserved122_def x = x
    val op elf_ma_reserved122_def =
    DT(((("elf_header",214),[]),[]),
       [read"%291%629@%364%317%317%316%317%317%317%388@@@@@@@@"])
  fun op elf_ma_reserved123_def x = x
    val op elf_ma_reserved123_def =
    DT(((("elf_header",215),[]),[]),
       [read"%291%630@%364%316%316%317%317%317%317%388@@@@@@@@"])
  fun op elf_ma_reserved124_def x = x
    val op elf_ma_reserved124_def =
    DT(((("elf_header",216),[]),[]),
       [read"%291%631@%364%317%316%317%317%317%317%388@@@@@@@@"])
  fun op elf_ma_reserved125_def x = x
    val op elf_ma_reserved125_def =
    DT(((("elf_header",217),[]),[]),
       [read"%291%632@%364%316%317%317%317%317%317%388@@@@@@@@"])
  fun op elf_ma_reserved126_def x = x
    val op elf_ma_reserved126_def =
    DT(((("elf_header",218),[]),[]),
       [read"%291%633@%364%317%317%317%317%317%317%388@@@@@@@@"])
  fun op elf_ma_reserved127_def x = x
    val op elf_ma_reserved127_def =
    DT(((("elf_header",219),[]),[]),
       [read"%291%634@%364%316%316%316%316%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved128_def x = x
    val op elf_ma_reserved128_def =
    DT(((("elf_header",220),[]),[]),
       [read"%291%635@%364%317%316%316%316%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved129_def x = x
    val op elf_ma_reserved129_def =
    DT(((("elf_header",221),[]),[]),
       [read"%291%636@%364%316%317%316%316%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved130_def x = x
    val op elf_ma_reserved130_def =
    DT(((("elf_header",222),[]),[]),
       [read"%291%638@%364%317%317%316%316%316%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved143_def x = x
    val op elf_ma_reserved143_def =
    DT(((("elf_header",223),[]),[]),
       [read"%291%640@%364%316%316%316%316%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved144_def x = x
    val op elf_ma_reserved144_def =
    DT(((("elf_header",224),[]),[]),
       [read"%291%641@%364%317%316%316%316%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved145_def x = x
    val op elf_ma_reserved145_def =
    DT(((("elf_header",225),[]),[]),
       [read"%291%642@%364%316%317%316%316%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved146_def x = x
    val op elf_ma_reserved146_def =
    DT(((("elf_header",226),[]),[]),
       [read"%291%643@%364%317%317%316%316%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved147_def x = x
    val op elf_ma_reserved147_def =
    DT(((("elf_header",227),[]),[]),
       [read"%291%644@%364%316%316%317%316%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved148_def x = x
    val op elf_ma_reserved148_def =
    DT(((("elf_header",228),[]),[]),
       [read"%291%645@%364%317%316%317%316%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved149_def x = x
    val op elf_ma_reserved149_def =
    DT(((("elf_header",229),[]),[]),
       [read"%291%646@%364%316%317%317%316%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved150_def x = x
    val op elf_ma_reserved150_def =
    DT(((("elf_header",230),[]),[]),
       [read"%291%647@%364%317%317%317%316%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved151_def x = x
    val op elf_ma_reserved151_def =
    DT(((("elf_header",231),[]),[]),
       [read"%291%648@%364%316%316%316%317%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved152_def x = x
    val op elf_ma_reserved152_def =
    DT(((("elf_header",232),[]),[]),
       [read"%291%649@%364%317%316%316%317%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved153_def x = x
    val op elf_ma_reserved153_def =
    DT(((("elf_header",233),[]),[]),
       [read"%291%650@%364%316%317%316%317%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved154_def x = x
    val op elf_ma_reserved154_def =
    DT(((("elf_header",234),[]),[]),
       [read"%291%651@%364%317%317%316%317%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved155_def x = x
    val op elf_ma_reserved155_def =
    DT(((("elf_header",235),[]),[]),
       [read"%291%652@%364%316%316%317%317%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved156_def x = x
    val op elf_ma_reserved156_def =
    DT(((("elf_header",236),[]),[]),
       [read"%291%653@%364%317%316%317%317%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved157_def x = x
    val op elf_ma_reserved157_def =
    DT(((("elf_header",237),[]),[]),
       [read"%291%654@%364%316%317%317%317%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved158_def x = x
    val op elf_ma_reserved158_def =
    DT(((("elf_header",238),[]),[]),
       [read"%291%655@%364%317%317%317%317%317%316%316%388@@@@@@@@@"])
  fun op elf_ma_reserved159_def x = x
    val op elf_ma_reserved159_def =
    DT(((("elf_header",239),[]),[]),
       [read"%291%656@%364%316%316%316%316%316%317%316%388@@@@@@@@@"])
  fun op string_of_elf_machine_architecture_def x = x
    val op string_of_elf_machine_architecture_def =
    DT(((("elf_header",240),[]),[]),
       [read"%233%181%290%861$0@@%325%291$0@%496@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%317%388@@@@@@@@%327%321%364%316%316%317%316%317%388@@@@@@@@%327%321%364%317%316%316%317%317%388@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%360@@@@@@@@@@@@%325%291$0@%620@@%327%321%364%317%316%316%316%317%316%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%317%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%316%388@@@@@@@@@%327%321%364%316%316%317%316%316%316%388@@@@@@@@@%360@@@@@@@@%325%291$0@%621@@%327%321%364%317%316%316%316%317%316%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%317%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%316%388@@@@@@@@@%327%321%364%316%316%317%316%316%316%388@@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%360@@@@@@@@@@%325%291$0@%517@@%327%321%364%316%317%316%316%316%316%388@@@@@@@@@%327%321%364%316%317%316%316%316%316%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%360@@@@@@%325%291$0@%715@@%327%321%364%316%317%316%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%316%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%317%316%388@@@@@@@@@%327%321%364%317%316%316%317%317%388@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%316%317%317%317%316%388@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%325%291$0@%509@@%327%321%364%316%317%316%316%316%316%388@@@@@@@@@%327%321%364%316%317%316%316%316%316%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%360@@@@@@@@%327%321%364%316%316%316%316%317%316%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op elf_ev_none_def x = x
    val op elf_ev_none_def =
    DT(((("elf_header",241),[]),[]), [read"%291%475@%263@"])
  fun op elf_ev_current_def x = x
    val op elf_ev_current_def =
    DT(((("elf_header",242),[]),[]), [read"%291%474@%364%316%388@@@"])
  fun op string_of_elf_version_number_def x = x
    val op string_of_elf_version_number_def =
    DT(((("elf_header",243),[]),[]),
       [read"%233%181%290%863$0@@%325%291$0@%475@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@%325%291$0@%474@@%327%321%364%316%317%316%316%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%316%388@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%388@@@@@@@@%360@@@@@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%317%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op is_valid_extended_version_number_def x = x
    val op is_valid_extended_version_number_def =
    DT(((("elf_header",244),[]),[]),
       [read"%233%183%271%812$0@@%297$0@%364%316%388@@@@|@"])
  fun op elf_ii_mag0_def x = x
    val op elf_ii_mag0_def =
    DT(((("elf_header",245),[]),[]), [read"%291%488@%263@"])
  fun op elf_ii_mag1_def x = x
    val op elf_ii_mag1_def =
    DT(((("elf_header",246),[]),[]), [read"%291%489@%364%316%388@@@"])
  fun op elf_ii_mag2_def x = x
    val op elf_ii_mag2_def =
    DT(((("elf_header",247),[]),[]), [read"%291%490@%364%317%388@@@"])
  fun op elf_ii_mag3_def x = x
    val op elf_ii_mag3_def =
    DT(((("elf_header",248),[]),[]), [read"%291%491@%364%316%316%388@@@@"])
  fun op elf_ii_class_def x = x
    val op elf_ii_class_def =
    DT(((("elf_header",249),[]),[]), [read"%291%486@%364%317%316%388@@@@"])
  fun op elf_ii_data_def x = x
    val op elf_ii_data_def =
    DT(((("elf_header",250),[]),[]), [read"%291%487@%364%316%317%388@@@@"])
  fun op elf_ii_version_def x = x
    val op elf_ii_version_def =
    DT(((("elf_header",251),[]),[]), [read"%291%495@%364%317%317%388@@@@"])
  fun op elf_ii_osabi_def x = x
    val op elf_ii_osabi_def =
    DT(((("elf_header",252),[]),[]),
       [read"%291%493@%364%316%316%316%388@@@@@"])
  fun op elf_ii_abiversion_def x = x
    val op elf_ii_abiversion_def =
    DT(((("elf_header",253),[]),[]),
       [read"%291%485@%364%317%316%316%388@@@@@"])
  fun op elf_ii_pad_def x = x
    val op elf_ii_pad_def =
    DT(((("elf_header",254),[]),[]),
       [read"%291%494@%364%316%317%316%388@@@@@"])
  fun op elf_ii_nident_def x = x
    val op elf_ii_nident_def =
    DT(((("elf_header",255),[]),[]),
       [read"%291%492@%364%317%316%316%316%388@@@@@@"])
  fun op elf_mn_mag0_def x = x
    val op elf_mn_mag0_def =
    DT(((("elf_header",256),[]),[]),
       [read"%276%722@%817%364%316%316%316%316%316%316%316%388@@@@@@@@@@"])
  fun op elf_mn_mag1_def x = x
    val op elf_mn_mag1_def =
    DT(((("elf_header",257),[]),[]),
       [read"%276%723@%817%364%316%317%317%316%316%316%388@@@@@@@@@"])
  fun op elf_mn_mag2_def x = x
    val op elf_mn_mag2_def =
    DT(((("elf_header",258),[]),[]),
       [read"%276%724@%817%364%317%316%317%317%316%316%388@@@@@@@@@"])
  fun op elf_mn_mag3_def x = x
    val op elf_mn_mag3_def =
    DT(((("elf_header",259),[]),[]),
       [read"%276%725@%817%364%317%317%317%316%316%316%388@@@@@@@@@"])
  fun op elf_class_none_def x = x
    val op elf_class_none_def =
    DT(((("elf_header",260),[]),[]), [read"%291%470@%263@"])
  fun op elf_class_32_def x = x
    val op elf_class_32_def =
    DT(((("elf_header",261),[]),[]), [read"%291%468@%364%316%388@@@"])
  fun op elf_class_64_def x = x
    val op elf_class_64_def =
    DT(((("elf_header",262),[]),[]), [read"%291%469@%364%317%388@@@"])
  fun op string_of_elf_file_class_def x = x
    val op string_of_elf_file_class_def =
    DT(((("elf_header",263),[]),[]),
       [read"%233%181%290%859$0@@%325%291$0@%470@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@%325%291$0@%468@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%316%316%317%316%317%388@@@@@@@@%327%321%364%317%317%316%316%317%388@@@@@@@@%360@@@@@@%325%291$0@%469@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%360@@@@@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op elf_data_none_def x = x
    val op elf_data_none_def =
    DT(((("elf_header",264),[]),[]), [read"%291%473@%263@"])
  fun op elf_data_2lsb_def x = x
    val op elf_data_2lsb_def =
    DT(((("elf_header",265),[]),[]), [read"%291%471@%364%316%388@@@"])
  fun op elf_data_2msb_def x = x
    val op elf_data_2msb_def =
    DT(((("elf_header",266),[]),[]), [read"%291%472@%364%317%388@@@"])
  fun op string_of_elf_data_encoding_def x = x
    val op string_of_elf_data_encoding_def =
    DT(((("elf_header",267),[]),[]),
       [read"%233%181%290%858$0@@%325%291$0@%473@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@%325%291$0@%471@@%327%321%364%317%317%316%316%317%388@@@@@@@@%327%321%364%316%316%316%317%316%388@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%325%291$0@%472@@%327%321%364%317%317%316%316%317%388@@@@@@@@%327%321%364%316%316%316%317%316%388@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  fun op elf_osabi_none_def x = x
    val op elf_osabi_none_def =
    DT(((("elf_header",268),[]),[]), [read"%291%737@%263@"])
  fun op elf_osabi_hpux_def x = x
    val op elf_osabi_hpux_def =
    DT(((("elf_header",269),[]),[]), [read"%291%732@%364%316%388@@@"])
  fun op elf_osabi_netbsd_def x = x
    val op elf_osabi_netbsd_def =
    DT(((("elf_header",270),[]),[]), [read"%291%736@%364%317%388@@@"])
  fun op elf_osabi_gnu_def x = x
    val op elf_osabi_gnu_def =
    DT(((("elf_header",271),[]),[]), [read"%291%731@%364%316%316%388@@@@"])
  fun op elf_osabi_linux_def x = x
    val op elf_osabi_linux_def =
    DT(((("elf_header",272),[]),[]), [read"%291%734@%364%316%316%388@@@@"])
  fun op elf_osabi_solaris_def x = x
    val op elf_osabi_solaris_def =
    DT(((("elf_header",273),[]),[]), [read"%291%742@%364%317%317%388@@@@"])
  fun op elf_osabi_aix_def x = x
    val op elf_osabi_aix_def =
    DT(((("elf_header",274),[]),[]),
       [read"%291%726@%364%316%316%316%388@@@@@"])
  fun op elf_osabi_irix_def x = x
    val op elf_osabi_irix_def =
    DT(((("elf_header",275),[]),[]),
       [read"%291%733@%364%317%316%316%388@@@@@"])
  fun op elf_osabi_freebsd_def x = x
    val op elf_osabi_freebsd_def =
    DT(((("elf_header",276),[]),[]),
       [read"%291%730@%364%316%317%316%388@@@@@"])
  fun op elf_osabi_tru64_def x = x
    val op elf_osabi_tru64_def =
    DT(((("elf_header",277),[]),[]),
       [read"%291%743@%364%317%317%316%388@@@@@"])
  fun op elf_osabi_modesto_def x = x
    val op elf_osabi_modesto_def =
    DT(((("elf_header",278),[]),[]),
       [read"%291%735@%364%316%316%317%388@@@@@"])
  fun op elf_osabi_openbsd_def x = x
    val op elf_osabi_openbsd_def =
    DT(((("elf_header",279),[]),[]),
       [read"%291%739@%364%317%316%317%388@@@@@"])
  fun op elf_osabi_openvms_def x = x
    val op elf_osabi_openvms_def =
    DT(((("elf_header",280),[]),[]),
       [read"%291%740@%364%316%317%317%388@@@@@"])
  fun op elf_osabi_nsk_def x = x
    val op elf_osabi_nsk_def =
    DT(((("elf_header",281),[]),[]),
       [read"%291%738@%364%317%317%317%388@@@@@"])
  fun op elf_osabi_aros_def x = x
    val op elf_osabi_aros_def =
    DT(((("elf_header",282),[]),[]),
       [read"%291%727@%364%316%316%316%316%388@@@@@@"])
  fun op elf_osabi_fenixos_def x = x
    val op elf_osabi_fenixos_def =
    DT(((("elf_header",283),[]),[]),
       [read"%291%729@%364%317%316%316%316%388@@@@@@"])
  fun op elf_osabi_cloudabi_def x = x
    val op elf_osabi_cloudabi_def =
    DT(((("elf_header",284),[]),[]),
       [read"%291%728@%364%316%317%316%316%388@@@@@@"])
  fun op elf_osabi_openvos_def x = x
    val op elf_osabi_openvos_def =
    DT(((("elf_header",285),[]),[]),
       [read"%291%741@%364%317%317%316%316%388@@@@@@"])
  fun op is_valid_architecture_defined_osabi_version_def x = x
    val op is_valid_architecture_defined_osabi_version_def =
    DT(((("elf_header",286),[]),[]),
       [read"%233%183%271%807$0@@%262%298$0@%364%317%316%316%316%316%316%388@@@@@@@@@%265$0@%364%316%316%316%316%316%316%316%316%388@@@@@@@@@@@@|@"])
  fun op string_of_elf_osabi_version_def x = x
    val op string_of_elf_osabi_version_def =
    DT(((("elf_header",287),[]),[]),
       [read"%228%44%233%181%290%862$1@$0@@%325%291$0@%737@@%327%321%364%316%317%317%316%317%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%316%316%317%317%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%317%316%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%327%321%364%316%317%316%317%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%317%316%388@@@@@@@@@%360@@@@@@@@@@@@@@@@%325%291$0@%736@@%327%321%364%317%316%316%317%316%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%317%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%388@@@@@@@@%327%321%364%317%316%316%316%317%316%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%317%316%388@@@@@@@@@%327%321%364%316%317%317%317%316%388@@@@@@@@%327%321%364%316%317%317%316%317%316%388@@@@@@@@@%327%321%364%317%316%316%317%317%316%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@%325%291$0@%736@@%327%321%364%317%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%316%388@@@@@@@@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%327%321%364%317%316%317%316%316%316%388@@@@@@@@@%360@@@@@@@%325%291$0@%731@@%327%321%364%316%317%317%316%317%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%316%316%317%317%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%317%316%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%316%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%317%317%316%317%316%388@@@@@@@@@%360@@@@@@@@@@@%325%291$0@%734@@%327%321%364%317%316%317%317%316%316%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%317%317%317%388@@@@@@@@@%360@@@@@@%325%291$0@%742@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%360@@@@@@@@@@@@%325%291$0@%726@@%327%321%364%316%317%316%316%316%316%388@@@@@@@@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%316%316%317%317%316%388@@@@@@@@@%360@@@@%325%291$0@%733@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%317%316%316%317%316%388@@@@@@@@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%316%316%317%317%316%388@@@@@@@@@%360@@@@@%325%291$0@%730@@%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%316%388@@@@@@@@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%327%321%364%317%316%317%316%316%316%388@@@@@@@@@%360@@@@@@@@%325%291$0@%743@@%327%321%364%316%316%317%316%316%316%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%317%316%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%317%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%317%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@%325%291$0@%735@@%327%321%364%317%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@%325%291$0@%739@@%327%321%364%316%316%316%316%317%316%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%316%388@@@@@@@@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%327%321%364%317%316%317%316%316%316%388@@@@@@@@@%360@@@@@@@@%325%291$0@%740@@%327%321%364%316%316%316%316%317%316%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%316%388@@@@@@@@@%327%321%364%316%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%360@@@@@@@@%325%291$0@%738@@%327%321%364%317%316%316%317%316%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%317%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%388@@@@@@@@%327%321%364%317%316%316%316%317%316%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%388@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%317%317%316%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%325%291$0@%727@@%327%321%364%316%317%316%316%316%316%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%316%316%317%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%316%316%317%316%388@@@@@@@@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@%325%291$0@%729@@%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%316%388@@@@@@@@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%388@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%388@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%316%316%317%316%388@@@@@@@@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%325%291$0@%728@@%327%321%364%317%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%317%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%316%388@@@@@@@@@%327%321%364%317%317%316%316%316%316%388@@@@@@@@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%360@@@@@@@@@@@@@@%325%291$0@%741@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%316%316%317%316%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%316%388@@@@@@@@@%327%321%364%316%316%316%316%317%316%388@@@@@@@@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%325%807$0@@$1$0@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%316%316%317%316%388@@@@@@@@@%327%321%364%316%316%317%316%317%316%388@@@@@@@@@%327%321%364%316%317%316%316%316%316%388@@@@@@@@@%327%321%364%317%317%316%316%316%316%388@@@@@@@@@%327%321%364%316%317%316%317%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@|@"])
  fun op ei_nident_def x = x
    val op ei_nident_def =
    DT(((("elf_header",288),[]),[]),
       [read"%291%405@%364%317%316%316%316%388@@@@@@"])
  fun op elf32_header_TY_DEF x = x
    val op elf32_header_TY_DEF =
    DT(((("elf_header",289),[("bool",[26])]),["DISK_THM"]),
       [read"%305%197%380%11%230%0%296%235%11%296%308%8%301%12%301%22%300%24%300%27%300%31%300%35%300%38%301%40%301%42%301%14%301%16%301%18%301%20%295$14@%8%12%22%24%27%31%35%38%40%42%14%16%18%20%332%263@%260$13@%252$12@%249$11@%242$10@%243$9@%244$8@%245$7@%246$6@%255$5@%254$4@%253$3@%250$2@%247$1@$0@@@@@@@@@@@@@@%183%319|@||||||||||||||$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf32_header_case_def x = x
    val op elf32_header_case_def =
    DT(((("elf_header",293),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%8%215%12%215%22%214%24%214%27%214%31%214%35%214%38%215%40%215%42%215%14%215%16%215%18%215%20%226%153%266%406%847$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_size_def x = x
    val op elf32_header_size_def =
    DT(((("elf_header",294),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%8%215%12%215%22%214%24%214%27%214%31%214%35%214%38%215%40%215%42%215%14%215%16%215%18%215%20%291%436%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%237%364%316%388@@@%816%208%263|@$13@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_ident x = x
    val op elf32_header_elf32_ident =
    DT(((("elf_header",295),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%289%414%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$13@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_type x = x
    val op elf32_header_elf32_type =
    DT(((("elf_header",296),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%432%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$12@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_machine x = x
    val op elf32_header_elf32_machine =
    DT(((("elf_header",297),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%416%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_version x = x
    val op elf32_header_elf32_version =
    DT(((("elf_header",298),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%434%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$10@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_entry x = x
    val op elf32_header_elf32_entry =
    DT(((("elf_header",299),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%410%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_phoff x = x
    val op elf32_header_elf32_phoff =
    DT(((("elf_header",300),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%422%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shoff x = x
    val op elf32_header_elf32_shoff =
    DT(((("elf_header",301),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%428%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_flags x = x
    val op elf32_header_elf32_flags =
    DT(((("elf_header",302),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%412%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_ehsize x = x
    val op elf32_header_elf32_ehsize =
    DT(((("elf_header",303),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%408%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_phentsize x = x
    val op elf32_header_elf32_phentsize =
    DT(((("elf_header",304),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%418%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_phnum x = x
    val op elf32_header_elf32_phnum =
    DT(((("elf_header",305),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%420%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shentsize x = x
    val op elf32_header_elf32_shentsize =
    DT(((("elf_header",306),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%424%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shnum x = x
    val op elf32_header_elf32_shnum =
    DT(((("elf_header",307),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%426%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shstrndx x = x
    val op elf32_header_elf32_shstrndx =
    DT(((("elf_header",308),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%430%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_ident_fupd x = x
    val op elf32_header_elf32_ident_fupd =
    DT(((("elf_header",310),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%227%154%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%415$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$14$13@@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_type_fupd x = x
    val op elf32_header_elf32_type_fupd =
    DT(((("elf_header",311),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%433$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$14$12@@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_machine_fupd x = x
    val op elf32_header_elf32_machine_fupd =
    DT(((("elf_header",312),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%417$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$14$11@@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_version_fupd x = x
    val op elf32_header_elf32_version_fupd =
    DT(((("elf_header",313),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%221%150%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%435$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$14$10@@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_entry_fupd x = x
    val op elf32_header_elf32_entry_fupd =
    DT(((("elf_header",314),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%221%150%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%411$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$14$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_phoff_fupd x = x
    val op elf32_header_elf32_phoff_fupd =
    DT(((("elf_header",315),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%221%150%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%423$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$14$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shoff_fupd x = x
    val op elf32_header_elf32_shoff_fupd =
    DT(((("elf_header",316),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%221%150%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%429$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$14$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_flags_fupd x = x
    val op elf32_header_elf32_flags_fupd =
    DT(((("elf_header",317),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%221%150%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%413$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$14$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_ehsize_fupd x = x
    val op elf32_header_elf32_ehsize_fupd =
    DT(((("elf_header",318),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%409$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$6@$14$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_phentsize_fupd x = x
    val op elf32_header_elf32_phentsize_fupd =
    DT(((("elf_header",319),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%419$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$14$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_phnum_fupd x = x
    val op elf32_header_elf32_phnum_fupd =
    DT(((("elf_header",320),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%421$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$14$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shentsize_fupd x = x
    val op elf32_header_elf32_shentsize_fupd =
    DT(((("elf_header",321),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%425$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$14$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shnum_fupd x = x
    val op elf32_header_elf32_shnum_fupd =
    DT(((("elf_header",322),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%427$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$14$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_elf32_shstrndx_fupd x = x
    val op elf32_header_elf32_shstrndx_fupd =
    DT(((("elf_header",323),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%431$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$14$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_TY_DEF x = x
    val op elf64_header_TY_DEF =
    DT(((("elf_header",342),[("bool",[26])]),["DISK_THM"]),
       [read"%307%198%379%10%229%1%296%234%10%296%308%8%301%12%301%22%300%24%299%26%299%30%299%34%300%38%301%40%301%42%301%14%301%16%301%18%301%20%294$14@%8%12%22%24%26%30%34%38%40%42%14%16%18%20%331%263@%259$13@%251$12@%248$11@%241$10@%238$9@%239$8@%240$7@%246$6@%255$5@%254$4@%253$3@%250$2@%247$1@$0@@@@@@@@@@@@@@%183%318|@||||||||||||||$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@$1$0@@|@@$0$1@@|@|@$0@|@"])
  fun op elf64_header_case_def x = x
    val op elf64_header_case_def =
    DT(((("elf_header",346),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%8%215%12%215%22%214%24%213%26%213%30%213%34%214%38%215%40%215%42%215%14%215%16%215%18%215%20%225%152%266%437%848$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@$0@@$0$14@$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_size_def x = x
    val op elf64_header_size_def =
    DT(((("elf_header",347),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%8%215%12%215%22%214%24%213%26%213%30%213%34%214%38%215%40%215%42%215%14%215%16%215%18%215%20%291%467%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%237%364%316%388@@@%816%208%263|@$13@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_ident x = x
    val op elf64_header_elf64_ident =
    DT(((("elf_header",348),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%289%445%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$13@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_type x = x
    val op elf64_header_elf64_type =
    DT(((("elf_header",349),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%463%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$12@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_machine x = x
    val op elf64_header_elf64_machine =
    DT(((("elf_header",350),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%447%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_version x = x
    val op elf64_header_elf64_version =
    DT(((("elf_header",351),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%465%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$10@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_entry x = x
    val op elf64_header_elf64_entry =
    DT(((("elf_header",352),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%273%441%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_phoff x = x
    val op elf64_header_elf64_phoff =
    DT(((("elf_header",353),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%273%453%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shoff x = x
    val op elf64_header_elf64_shoff =
    DT(((("elf_header",354),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%273%459%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_flags x = x
    val op elf64_header_elf64_flags =
    DT(((("elf_header",355),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%443%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_ehsize x = x
    val op elf64_header_elf64_ehsize =
    DT(((("elf_header",356),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%439%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_phentsize x = x
    val op elf64_header_elf64_phentsize =
    DT(((("elf_header",357),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%449%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_phnum x = x
    val op elf64_header_elf64_phnum =
    DT(((("elf_header",358),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%451%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shentsize x = x
    val op elf64_header_elf64_shentsize =
    DT(((("elf_header",359),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%455%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shnum x = x
    val op elf64_header_elf64_shnum =
    DT(((("elf_header",360),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%457%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shstrndx x = x
    val op elf64_header_elf64_shstrndx =
    DT(((("elf_header",361),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%461%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_ident_fupd x = x
    val op elf64_header_elf64_ident_fupd =
    DT(((("elf_header",363),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%227%154%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%446$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$14$13@@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_type_fupd x = x
    val op elf64_header_elf64_type_fupd =
    DT(((("elf_header",364),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%464$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$14$12@@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_machine_fupd x = x
    val op elf64_header_elf64_machine_fupd =
    DT(((("elf_header",365),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%448$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$14$11@@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_version_fupd x = x
    val op elf64_header_elf64_version_fupd =
    DT(((("elf_header",366),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%221%150%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%466$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$14$10@@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_entry_fupd x = x
    val op elf64_header_elf64_entry_fupd =
    DT(((("elf_header",367),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%220%149%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%442$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$14$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_phoff_fupd x = x
    val op elf64_header_elf64_phoff_fupd =
    DT(((("elf_header",368),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%220%149%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%454$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$14$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shoff_fupd x = x
    val op elf64_header_elf64_shoff_fupd =
    DT(((("elf_header",369),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%220%149%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%460$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$14$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_flags_fupd x = x
    val op elf64_header_elf64_flags_fupd =
    DT(((("elf_header",370),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%221%150%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%444$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$14$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_ehsize_fupd x = x
    val op elf64_header_elf64_ehsize_fupd =
    DT(((("elf_header",371),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%440$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$6@$14$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_phentsize_fupd x = x
    val op elf64_header_elf64_phentsize_fupd =
    DT(((("elf_header",372),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%450$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$14$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_phnum_fupd x = x
    val op elf64_header_elf64_phnum_fupd =
    DT(((("elf_header",373),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%452$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$14$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shentsize_fupd x = x
    val op elf64_header_elf64_shentsize_fupd =
    DT(((("elf_header",374),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%456$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$14$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shnum_fupd x = x
    val op elf64_header_elf64_shnum_fupd =
    DT(((("elf_header",375),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%458$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$14$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_elf64_shstrndx_fupd x = x
    val op elf64_header_elf64_shstrndx_fupd =
    DT(((("elf_header",376),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%462$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$14$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op is_valid_elf32_header_def x = x
    val op is_valid_elf32_header_def =
    DT(((("elf_header",395),[]),[]),
       [read"%216%174%271%808$0@@%289%378%364%317%316%388@@@@%414$0@@@%326%722@%326%723@%326%724@%326%725@%359@@@@@@|@"])
  fun op is_valid_elf64_header_def x = x
    val op is_valid_elf64_header_def =
    DT(((("elf_header",396),[]),[]),
       [read"%217%175%271%810$0@@%289%378%364%317%316%388@@@@%445$0@@@%326%722@%326%723@%326%724@%326%725@%359@@@@@@|@"])
  fun op elf32_header_compare_def x = x
    val op elf32_header_compare_def =
    DT(((("elf_header",397),[]),[]),
       [read"%216%170%216%172%293%407$1@$0@@%834%813%756%264@%291@@@%813%756%264@%291@@@%261%358%871@%414$1@@@%330%870%432$1@@@%330%870%416$1@@@%330%869%434$1@@@%330%869%410$1@@@%330%869%422$1@@@%330%869%428$1@@@%330%869%412$1@@@%330%870%408$1@@@%330%870%418$1@@@%330%870%420$1@@@%330%870%424$1@@@%330%870%426$1@@@%330%870%430$1@@@%363@@@@@@@@@@@@@@@%261%358%871@%414$0@@@%330%870%432$0@@@%330%870%416$0@@@%330%869%434$0@@@%330%869%410$0@@@%330%869%422$0@@@%330%869%428$0@@@%330%869%412$0@@@%330%870%408$0@@@%330%870%418$0@@@%330%870%420$0@@@%330%870%424$0@@@%330%870%426$0@@@%330%870%430$0@@@%363@@@@@@@@@@@@@@@@|@|@"])
  fun op instance_Basic_classes_Ord_Elf_header_elf32_header_dict_def x = x
    val op instance_Basic_classes_Ord_Elf_header_elf32_header_dict_def =
    DT(((("elf_header",398),[]),[]),
       [read"%267%779@%365%344%407@@%373%343%157%159%293%407$1@$0@@%355@||@@%371%343%157%159%338%407$1@$0@@%339%355@%339%335@%334@@@||@@%369%343%157%159%293%407$1@$0@@%336@||@@%367%343%157%159%338%407$1@$0@@%339%336@%339%335@%334@@@||@@%310@@@@@@"])
  fun op elf64_header_compare_def x = x
    val op elf64_header_compare_def =
    DT(((("elf_header",399),[]),[]),
       [read"%217%171%217%173%293%438$1@$0@@%834%813%756%264@%291@@@%813%756%264@%291@@@%261%358%871@%445$1@@@%330%870%463$1@@@%330%870%447$1@@@%330%869%465$1@@@%330%868%441$1@@@%330%868%453$1@@@%330%868%459$1@@@%330%869%443$1@@@%330%870%439$1@@@%330%870%449$1@@@%330%870%451$1@@@%330%870%455$1@@@%330%870%457$1@@@%330%870%461$1@@@%363@@@@@@@@@@@@@@@%261%358%871@%445$0@@@%330%870%463$0@@@%330%870%447$0@@@%330%869%465$0@@@%330%868%441$0@@@%330%868%453$0@@@%330%868%459$0@@@%330%869%443$0@@@%330%870%439$0@@@%330%870%449$0@@@%330%870%451$0@@@%330%870%455$0@@@%330%870%457$0@@@%330%870%461$0@@@%363@@@@@@@@@@@@@@@@|@|@"])
  fun op instance_Basic_classes_Ord_Elf_header_elf64_header_dict_def x = x
    val op instance_Basic_classes_Ord_Elf_header_elf64_header_dict_def =
    DT(((("elf_header",400),[]),[]),
       [read"%268%780@%366%347%438@@%374%346%158%160%293%438$1@$0@@%355@||@@%372%346%158%160%338%438$1@$0@@%339%355@%339%335@%334@@@||@@%370%346%158%160%293%438$1@$0@@%336@||@@%368%346%158%160%338%438$1@$0@@%339%336@%339%335@%334@@@||@@%311@@@@@@"])
  fun op is_elf32_executable_file_def x = x
    val op is_elf32_executable_file_def =
    DT(((("elf_header",401),[]),[]),
       [read"%216%174%271%784$0@@%291%870%432$0@@@%478@@|@"])
  fun op is_elf64_executable_file_def x = x
    val op is_elf64_executable_file_def =
    DT(((("elf_header",402),[]),[]),
       [read"%217%175%271%795$0@@%291%870%463$0@@@%478@@|@"])
  fun op is_elf32_shared_object_file_def x = x
    val op is_elf32_shared_object_file_def =
    DT(((("elf_header",403),[]),[]),
       [read"%216%174%271%794$0@@%291%870%432$0@@@%477@@|@"])
  fun op is_elf64_shared_object_file_def x = x
    val op is_elf64_shared_object_file_def =
    DT(((("elf_header",404),[]),[]),
       [read"%217%175%271%803$0@@%291%870%463$0@@@%477@@|@"])
  fun op is_elf32_relocatable_file_def x = x
    val op is_elf32_relocatable_file_def =
    DT(((("elf_header",405),[]),[]),
       [read"%216%174%271%793$0@@%291%870%432$0@@@%484@@|@"])
  fun op is_elf64_relocatable_file_def x = x
    val op is_elf64_relocatable_file_def =
    DT(((("elf_header",406),[]),[]),
       [read"%217%175%271%802$0@@%291%870%463$0@@@%484@@|@"])
  fun op is_elf32_linkable_file_def x = x
    val op is_elf32_linkable_file_def =
    DT(((("elf_header",407),[]),[]),
       [read"%216%174%271%792$0@@%389%794$0@@%793$0@@@|@"])
  fun op is_elf64_linkable_file_def x = x
    val op is_elf64_linkable_file_def =
    DT(((("elf_header",408),[]),[]),
       [read"%217%175%271%801$0@@%389%803$0@@%802$0@@@|@"])
  fun op get_elf32_machine_architecture_def x = x
    val op get_elf32_machine_architecture_def =
    DT(((("elf_header",409),[]),[]),
       [read"%216%174%291%763$0@@%870%416$0@@@|@"])
  fun op get_elf64_machine_architecture_def x = x
    val op get_elf64_machine_architecture_def =
    DT(((("elf_header",410),[]),[]),
       [read"%217%175%291%772$0@@%870%447$0@@@|@"])
  fun op get_elf32_osabi_def x = x
    val op get_elf32_osabi_def =
    DT(((("elf_header",411),[]),[]),
       [read"%216%174%291%764$0@@%833%815%414$0@@%493@@%754%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%388@@@@@@@@%327%321%364%317%317%316%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%186%871$0@|@@|@"])
  fun op get_elf64_osabi_def x = x
    val op get_elf64_osabi_def =
    DT(((("elf_header",412),[]),[]),
       [read"%217%175%291%773$0@@%833%815%445$0@@%493@@%754%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%186%871$0@|@@|@"])
  fun op get_elf32_data_encoding_def x = x
    val op get_elf32_data_encoding_def =
    DT(((("elf_header",413),[]),[]),
       [read"%216%174%291%758$0@@%833%815%414$0@@%487@@%754%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%388@@@@@@@@%327%321%364%317%317%316%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%104%871$0@|@@|@"])
  fun op get_elf64_data_encoding_def x = x
    val op get_elf64_data_encoding_def =
    DT(((("elf_header",414),[]),[]),
       [read"%217%175%291%767$0@@%833%815%445$0@@%487@@%754%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%104%871$0@|@@|@"])
  fun op get_elf32_file_class_def x = x
    val op get_elf32_file_class_def =
    DT(((("elf_header",415),[]),[]),
       [read"%216%174%291%759$0@@%833%815%414$0@@%486@@%754%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%388@@@@@@@@%327%321%364%317%317%316%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%103%871$0@|@@|@"])
  fun op get_elf64_file_class_def x = x
    val op get_elf64_file_class_def =
    DT(((("elf_header",416),[]),[]),
       [read"%217%175%291%768$0@@%833%815%445$0@@%486@@%754%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%103%871$0@|@@|@"])
  fun op get_elf32_version_number_def x = x
    val op get_elf32_version_number_def =
    DT(((("elf_header",417),[]),[]),
       [read"%216%174%291%765$0@@%833%815%414$0@@%495@@%754%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%388@@@@@@@@%327%321%364%317%317%316%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%210%871$0@|@@|@"])
  fun op get_elf64_version_number_def x = x
    val op get_elf64_version_number_def =
    DT(((("elf_header",418),[]),[]),
       [read"%217%175%291%774$0@@%833%815%445$0@@%495@@%754%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%210%871$0@|@@|@"])
  fun op is_valid_elf32_version_numer_def x = x
    val op is_valid_elf32_version_numer_def =
    DT(((("elf_header",419),[]),[]),
       [read"%216%174%271%809$0@@%291%765$0@@%474@@|@"])
  fun op is_valid_elf64_version_numer_def x = x
    val op is_valid_elf64_version_numer_def =
    DT(((("elf_header",420),[]),[]),
       [read"%217%175%271%811$0@@%291%774$0@@%474@@|@"])
  fun op get_elf32_abi_version_def x = x
    val op get_elf32_abi_version_def =
    DT(((("elf_header",421),[]),[]),
       [read"%216%174%291%757$0@@%833%815%414$0@@%485@@%754%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%388@@@@@@@@%327%321%364%317%317%316%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%210%871$0@|@@|@"])
  fun op get_elf64_abi_version_def x = x
    val op get_elf64_abi_version_def =
    DT(((("elf_header",422),[]),[]),
       [read"%217%175%291%766$0@@%833%815%445$0@@%485@@%754%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%210%871$0@|@@|@"])
  fun op deduce_endianness_def x = x
    val op deduce_endianness_def =
    DT(((("elf_header",423),[]),[]),
       [read"%231%176%279%400$0@@%830%814$0@%364%316%317%388@@@@@%753%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%207%322%291%867$0@@%471@@%356@%322%291%867$0@@%472@@%320@%753%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@@|@"])
  fun op get_elf32_header_endianness_def x = x
    val op get_elf32_header_endianness_def =
    DT(((("elf_header",424),[]),[]),
       [read"%216%174%279%760$0@@%401%414$0@@@|@"])
  fun op get_elf64_header_endianness_def x = x
    val op get_elf64_header_endianness_def =
    DT(((("elf_header",425),[]),[]),
       [read"%217%175%279%769$0@@%401%445$0@@@|@"])
  fun op has_elf32_header_associated_entry_point_def x = x
    val op has_elf32_header_associated_entry_point_def =
    DT(((("elf_header",426),[]),[]),
       [read"%216%174%271%775$0@@%872%291%869%410$0@@@%263@@@|@"])
  fun op has_elf64_header_associated_entry_point_def x = x
    val op has_elf64_header_associated_entry_point_def =
    DT(((("elf_header",427),[]),[]),
       [read"%217%175%271%777$0@@%872%291%868%441$0@@@%263@@@|@"])
  fun op has_elf32_header_string_table_def x = x
    val op has_elf32_header_string_table_def =
    DT(((("elf_header",428),[]),[]),
       [read"%216%174%271%776$0@@%872%291%870%430$0@@@%852@@@|@"])
  fun op has_elf64_header_string_table_def x = x
    val op has_elf64_header_string_table_def =
    DT(((("elf_header",429),[]),[]),
       [read"%217%175%271%778$0@@%872%291%870%461$0@@@%852@@@|@"])
  fun op is_elf32_header_section_size_in_section_header_table_def x = x
    val op is_elf32_header_section_size_in_section_header_table_def =
    DT(((("elf_header",430),[]),[]),
       [read"%216%174%271%787$0@@%291%870%426$0@@@%263@@|@"])
  fun op is_elf64_header_section_size_in_section_header_table_def x = x
    val op is_elf64_header_section_size_in_section_header_table_def =
    DT(((("elf_header",431),[]),[]),
       [read"%217%175%271%797$0@@%291%870%457$0@@@%263@@|@"])
  fun op is_elf32_header_string_table_index_in_link_def x = x
    val op is_elf32_header_string_table_index_in_link_def =
    DT(((("elf_header",432),[]),[]),
       [read"%216%174%271%789$0@@%291%870%430$0@@@%853@@|@"])
  fun op is_elf64_header_string_table_index_in_link_def x = x
    val op is_elf64_header_string_table_index_in_link_def =
    DT(((("elf_header",433),[]),[]),
       [read"%217%175%271%799$0@@%291%870%461$0@@@%853@@|@"])
  fun op string_of_elf32_header_def x = x
    val op string_of_elf32_header_def =
    DT(((("elf_header",434),[("pair",[16])]),["DISK_THM"]),
       [read"%228%184%228%193%216%174%290%854%258$2@$1@@$0@@%866%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%316%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@@@@@@%865%783@%414$0@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@@@@%864%401%414$0@@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%317%316%317%316%317%316%388@@@@@@@@@%327%321%364%316%317%316%317%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@%860$2@$1@%870%432$0@@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%317%317%317%316%317%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@%863%869%434$0@@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%316%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@%861%870%416$0@@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@@@@@%828%818@%869@%410$0@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@%828%818@%869@%412$0@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%829%818@%870@%420$0@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%829%818@%870@%426$0@@@@@%362@@@@@@@@@@@|@|@|@"])
  fun op string_of_elf64_header_def x = x
    val op string_of_elf64_header_def =
    DT(((("elf_header",435),[("pair",[16])]),["DISK_THM"]),
       [read"%228%184%228%193%217%175%290%856%258$2@$1@@$0@@%866%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%316%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@@@@@@%865%783@%445$0@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@@@@%864%401%445$0@@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%317%316%317%316%317%316%388@@@@@@@@@%327%321%364%316%317%316%317%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@%860$2@$1@%870%463$0@@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%317%317%317%316%317%316%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@%863%869%465$0@@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%316%317%317%317%316%316%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@%861%870%447$0@@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@@@@@%827%818@%868@%441$0@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@%828%818@%869@%443$0@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%829%818@%870@%451$0@@@@@%329%309%327%321%364%316%317%316%388@@@@@@%360@@%309%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%829%818@%870@%457$0@@@@@%362@@@@@@@@@@@|@|@|@"])
  fun op string_of_elf32_header_default_def x = x
    val op string_of_elf32_header_default_def =
    DT(((("elf_header",436),[]),[]), [read"%286%855@%854%258%403@%404@@@"])
  fun op string_of_elf64_header_default_def x = x
    val op string_of_elf64_header_default_def =
    DT(((("elf_header",437),[]),[]), [read"%288%857@%856%258%403@%404@@@"])
  fun op instance_Show_Show_Elf_header_elf32_header_dict_def x = x
    val op instance_Show_Show_Elf_header_elf32_header_dict_def =
    DT(((("elf_header",438),[]),[]), [read"%269%781@%376%345%855@@%312@@"])
  fun op instance_Show_Show_Elf_header_elf64_header_dict_def x = x
    val op instance_Show_Show_Elf_header_elf64_header_dict_def =
    DT(((("elf_header",439),[]),[]), [read"%270%782@%377%348%857@@%313@@"])
  fun op read_elf_ident_def x = x
    val op read_elf_ident_def =
    DT(((("elf_header",440),[]),[]),
       [read"%212%45%282%845$0@@%849%405@$0@%846%402@@@|@"])
  fun op bytes_of_elf32_header_def x = x
    val op bytes_of_elf32_header_def =
    DT(((("elf_header",441),[]),[]),
       [read"%216%174%272%392$0@@%351%146%755%328%357%337@%414$1@@@%328%391$0@%432$1@@@%328%391$0@%416$1@@@%328%394$0@%434$1@@@%328%390$0@%410$1@@@%328%393$0@%422$1@@@%328%393$0@%428$1@@@%328%394$0@%412$1@@@%328%391$0@%408$1@@@%328%391$0@%418$1@@@%328%391$0@%420$1@@@%328%391$0@%424$1@@@%328%391$0@%426$1@@@%328%391$0@%430$1@@@%361@@@@@@@@@@@@@@@|@%401%414$0@@@@|@"])
  fun op bytes_of_elf64_header_def x = x
    val op bytes_of_elf64_header_def =
    DT(((("elf_header",442),[]),[]),
       [read"%217%175%272%397$0@@%351%146%755%328%357%337@%445$1@@@%328%396$0@%463$1@@@%328%396$0@%447$1@@@%328%399$0@%465$1@@@%328%395$0@%441$1@@@%328%398$0@%453$1@@@%328%398$0@%459$1@@@%328%399$0@%443$1@@@%328%396$0@%439$1@@@%328%396$0@%449$1@@@%328%396$0@%451$1@@@%328%396$0@%455$1@@@%328%396$0@%457$1@@@%328%396$0@%461$1@@@%361@@@@@@@@@@@@@@@|@%401%445$0@@@@|@"])
  fun op is_elf32_header_padding_correct_def x = x
    val op is_elf32_header_padding_correct_def =
    DT(((("elf_header",443),[]),[]),
       [read"%216%113%271%786$0@@%262%292%815%414$0@@%364%316%317%316%388@@@@@@%375%817%263@@@@%262%292%815%414$0@@%364%317%317%316%388@@@@@@%375%817%263@@@@%262%292%815%414$0@@%364%316%316%317%388@@@@@@%375%817%263@@@@%262%292%815%414$0@@%364%317%316%317%388@@@@@@%375%817%263@@@@%262%292%815%414$0@@%364%316%317%317%388@@@@@@%375%817%263@@@@%262%292%815%414$0@@%364%317%317%317%388@@@@@@%375%817%263@@@@%292%815%414$0@@%364%316%316%316%316%388@@@@@@@%375%817%263@@@@@@@@@@|@"])
  fun op is_magic_number_correct_def x = x
    val op is_magic_number_correct_def =
    DT(((("elf_header",444),[]),[]),
       [read"%232%177%271%804$0@@%262%292%815$0@%263@@%375%817%364%316%316%316%316%316%316%316%388@@@@@@@@@@@@%262%292%815$0@%364%316%388@@@@%375%817%364%316%317%317%316%316%316%388@@@@@@@@@@@%262%292%815$0@%364%317%388@@@@%375%817%364%317%316%317%317%316%316%388@@@@@@@@@@@%292%815$0@%364%316%316%388@@@@@%375%817%364%317%317%317%316%316%316%388@@@@@@@@@@@@@@|@"])
  fun op read_elf32_header_def x = x
    val op read_elf32_header_def =
    DT(((("elf_header",445),[]),[]),
       [read"%212%45%280%837$0@@%749%845$0@@%386%177%45%323%872%804$1@@@%751%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%388@@@@@@@@%327%321%364%317%317%316%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%352%146%747%836$0@$1@@%384%206%45%747%836$2@$0@@%384%182%45%745%839$4@$0@@%382%211%45%745%835$6@$0@@%382%148%45%745%838$8@$0@@%382%192%45%745%838$10@$0@@%382%204%45%745%839$12@$0@@%382%161%45%747%836$14@$0@@%384%115%45%747%836$16@$0@@%384%187%45%747%836$18@$0@@%384%189%45%747%836$20@$0@@%384%199%45%747%836$22@$0@@%384%201%45%747%836$24@$0@@%384%205%45%831%815$28@%364%317%316%388@@@@@%751%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%388@@@@@@@@%327%321%364%317%317%316%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%47%323%291%871$0@@%468@@%850%256%415%349$29@@%433%342$26@@%417%342$24@@%435%341$22@@%411%341$20@@%423%341$18@@%429%341$16@@%413%341$14@@%409%342$12@@%419%342$10@@%421%342$8@@%425%342$6@@%427%342$4@@%431%342$2@@%314@@@@@@@@@@@@@@@$1@@@%751%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%388@@@@@@@@%327%321%364%317%317%316%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%317%316%317%388@@@@@@@@%327%321%364%317%317%316%316%317%388@@@@@@@@%327%321%364%316%317%317%317%316%388@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@|@%401$1@@@||@@@|@"])
  fun op read_elf64_header_def x = x
    val op read_elf64_header_def =
    DT(((("elf_header",446),[]),[]),
       [read"%212%45%281%842$0@@%750%845$0@@%387%177%45%324%872%804$1@@@%752%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%353%146%748%841$0@$1@@%385%206%45%748%841$2@$0@@%385%182%45%746%844$4@$0@@%383%211%45%744%840$6@$0@@%381%147%45%744%843$8@$0@@%381%191%45%744%843$10@$0@@%381%203%45%746%844$12@$0@@%383%161%45%748%841$14@$0@@%385%115%45%748%841$16@$0@@%385%187%45%748%841$18@$0@@%385%189%45%748%841$20@$0@@%385%199%45%748%841$22@$0@@%385%201%45%748%841$24@$0@@%385%205%45%832%815$28@%364%317%316%388@@@@@%752%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%316%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%47%324%291%871$0@@%469@@%851%257%446%349$29@@%464%342$26@@%448%342$24@@%466%341$22@@%442%340$20@@%454%340$18@@%460%340$16@@%444%341$14@@%440%342$12@@%450%342$10@@%452%342$8@@%456%342$6@@%458%342$4@@%462%342$2@@%315@@@@@@@@@@@@@@@$1@@@%752%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%327%321%364%316%316%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%327%321%364%317%317%316%316%317%317%388@@@@@@@@@%327%321%364%317%317%316%317%317%388@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%317%316%317%388@@@@@@@@@%327%321%364%316%316%316%316%317%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%316%316%316%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%317%388@@@@@@@@%327%321%364%317%316%317%316%317%388@@@@@@@@%327%321%364%316%317%317%317%316%388@@@@@@@@%327%321%364%317%317%316%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%316%317%317%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%316%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%317%317%316%316%388@@@@@@@@@%327%321%364%317%317%317%316%316%316%388@@@@@@@@@%327%321%364%317%316%316%316%316%388@@@@@@@@%327%321%364%317%317%317%316%316%317%388@@@@@@@@@%327%321%364%316%317%316%317%316%317%388@@@@@@@@@%327%321%364%317%316%317%317%316%317%388@@@@@@@@@%327%321%364%316%317%317%316%316%317%388@@@@@@@@@%360@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@||@@|@%401$1@@@||@@@|@"])
  fun op is_elf32_header_class_correct_def x = x
    val op is_elf32_header_class_correct_def =
    DT(((("elf_header",447),[]),[]),
       [read"%216%113%271%785$0@@%292%815%414$0@@%364%317%316%388@@@@@%375%817%364%316%388@@@@@@|@"])
  fun op is_elf64_header_class_correct_def x = x
    val op is_elf64_header_class_correct_def =
    DT(((("elf_header",448),[]),[]),
       [read"%217%114%271%796$0@@%292%815%445$0@@%364%317%316%388@@@@@%375%817%364%316%388@@@@@@|@"])
  fun op is_elf32_header_version_correct_def x = x
    val op is_elf32_header_version_correct_def =
    DT(((("elf_header",449),[]),[]),
       [read"%216%113%271%791$0@@%292%815%414$0@@%364%317%317%388@@@@@%375%817%364%316%388@@@@@@|@"])
  fun op is_elf64_header_version_correct_def x = x
    val op is_elf64_header_version_correct_def =
    DT(((("elf_header",450),[]),[]),
       [read"%217%114%271%800$0@@%292%815%445$0@@%364%317%317%388@@@@@%375%817%364%316%388@@@@@@|@"])
  fun op is_elf32_header_valid_def x = x
    val op is_elf32_header_valid_def =
    DT(((("elf_header",451),[]),[]),
       [read"%216%113%271%790$0@@%262%291%350%414$0@@@%405@@%262%804%414$0@@@%262%786$0@@%262%785$0@@%791$0@@@@@@|@"])
  fun op get_elf32_header_program_table_size_def x = x
    val op get_elf32_header_program_table_size_def =
    DT(((("elf_header",452),[]),[]),
       [read"%216%113%291%761$0@@%354%188%354%190%236$1@$0@|@%870%420$1@@@|@%870%418$0@@@@|@"])
  fun op get_elf64_header_program_table_size_def x = x
    val op get_elf64_header_program_table_size_def =
    DT(((("elf_header",453),[]),[]),
       [read"%217%114%291%770$0@@%354%188%354%190%236$1@$0@|@%870%451$1@@@|@%870%449$0@@@@|@"])
  fun op is_elf32_header_section_table_present_def x = x
    val op is_elf32_header_section_table_present_def =
    DT(((("elf_header",454),[]),[]),
       [read"%216%113%271%788$0@@%872%291%869%428$0@@@%263@@@|@"])
  fun op is_elf64_header_section_table_present_def x = x
    val op is_elf64_header_section_table_present_def =
    DT(((("elf_header",455),[]),[]),
       [read"%217%114%271%798$0@@%872%291%868%459$0@@@%263@@@|@"])
  fun op get_elf32_header_section_table_size_def x = x
    val op get_elf32_header_section_table_size_def =
    DT(((("elf_header",456),[]),[]),
       [read"%216%113%291%762$0@@%354%200%354%202%236$1@$0@|@%870%426$1@@@|@%870%424$0@@@@|@"])
  fun op get_elf64_header_section_table_size_def x = x
    val op get_elf64_header_section_table_size_def =
    DT(((("elf_header",457),[]),[]),
       [read"%217%114%291%771$0@@%354%200%354%202%236$1@$0@|@%870%457$1@@@|@%870%455$0@@@@|@"])
  fun op elf32_header_accessors x = x
    val op elf32_header_accessors =
    DT(((("elf_header",309),
        [("elf_header",
         [295,296,297,298,299,300,301,302,303,304,305,306,307,
          308])]),["DISK_THM"]),
       [read"%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%289%414%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$13@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%432%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$12@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%416%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%434%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$10@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%410%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%422%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%428%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%412%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%408%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%418%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%420%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%424%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%426%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%430%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@@@"])
  fun op elf32_header_fn_updates x = x
    val op elf32_header_fn_updates =
    DT(((("elf_header",324),
        [("elf_header",
         [310,311,312,313,314,315,316,317,318,319,320,321,322,
          323])]),["DISK_THM"]),
       [read"%262%227%154%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%415$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$14$13@@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%433$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$14$12@@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%417$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$14$11@@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%221%150%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%435$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$14$10@@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%221%150%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%411$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$14$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%221%150%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%423$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$14$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%221%150%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%429$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$14$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%221%150%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%413$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$14$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%409$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$6@$14$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%419$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$14$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%421$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$14$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%425$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$14$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%427$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$14$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%222%151%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56%277%431$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$14$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@@@"])
  fun op elf32_header_accfupds x = x
    val op elf32_header_accfupds =
    DT(((("elf_header",325),
        [("bool",[25,26,55,180]),
         ("elf_header",[290,291,292,309,324])]),["DISK_THM"]),
       [read"%262%222%151%216%105%289%414%433$1@$0@@@%414$0@@|@|@@%262%222%151%216%105%289%414%417$1@$0@@@%414$0@@|@|@@%262%221%150%216%105%289%414%435$1@$0@@@%414$0@@|@|@@%262%221%150%216%105%289%414%411$1@$0@@@%414$0@@|@|@@%262%221%150%216%105%289%414%423$1@$0@@@%414$0@@|@|@@%262%221%150%216%105%289%414%429$1@$0@@@%414$0@@|@|@@%262%221%150%216%105%289%414%413$1@$0@@@%414$0@@|@|@@%262%222%151%216%105%289%414%409$1@$0@@@%414$0@@|@|@@%262%222%151%216%105%289%414%419$1@$0@@@%414$0@@|@|@@%262%222%151%216%105%289%414%421$1@$0@@@%414$0@@|@|@@%262%222%151%216%105%289%414%425$1@$0@@@%414$0@@|@|@@%262%222%151%216%105%289%414%427$1@$0@@@%414$0@@|@|@@%262%222%151%216%105%289%414%431$1@$0@@@%414$0@@|@|@@%262%227%154%216%105%275%432%415$1@$0@@@%432$0@@|@|@@%262%222%151%216%105%275%432%417$1@$0@@@%432$0@@|@|@@%262%221%150%216%105%275%432%435$1@$0@@@%432$0@@|@|@@%262%221%150%216%105%275%432%411$1@$0@@@%432$0@@|@|@@%262%221%150%216%105%275%432%423$1@$0@@@%432$0@@|@|@@%262%221%150%216%105%275%432%429$1@$0@@@%432$0@@|@|@@%262%221%150%216%105%275%432%413$1@$0@@@%432$0@@|@|@@%262%222%151%216%105%275%432%409$1@$0@@@%432$0@@|@|@@%262%222%151%216%105%275%432%419$1@$0@@@%432$0@@|@|@@%262%222%151%216%105%275%432%421$1@$0@@@%432$0@@|@|@@%262%222%151%216%105%275%432%425$1@$0@@@%432$0@@|@|@@%262%222%151%216%105%275%432%427$1@$0@@@%432$0@@|@|@@%262%222%151%216%105%275%432%431$1@$0@@@%432$0@@|@|@@%262%227%154%216%105%275%416%415$1@$0@@@%416$0@@|@|@@%262%222%151%216%105%275%416%433$1@$0@@@%416$0@@|@|@@%262%221%150%216%105%275%416%435$1@$0@@@%416$0@@|@|@@%262%221%150%216%105%275%416%411$1@$0@@@%416$0@@|@|@@%262%221%150%216%105%275%416%423$1@$0@@@%416$0@@|@|@@%262%221%150%216%105%275%416%429$1@$0@@@%416$0@@|@|@@%262%221%150%216%105%275%416%413$1@$0@@@%416$0@@|@|@@%262%222%151%216%105%275%416%409$1@$0@@@%416$0@@|@|@@%262%222%151%216%105%275%416%419$1@$0@@@%416$0@@|@|@@%262%222%151%216%105%275%416%421$1@$0@@@%416$0@@|@|@@%262%222%151%216%105%275%416%425$1@$0@@@%416$0@@|@|@@%262%222%151%216%105%275%416%427$1@$0@@@%416$0@@|@|@@%262%222%151%216%105%275%416%431$1@$0@@@%416$0@@|@|@@%262%227%154%216%105%274%434%415$1@$0@@@%434$0@@|@|@@%262%222%151%216%105%274%434%433$1@$0@@@%434$0@@|@|@@%262%222%151%216%105%274%434%417$1@$0@@@%434$0@@|@|@@%262%221%150%216%105%274%434%411$1@$0@@@%434$0@@|@|@@%262%221%150%216%105%274%434%423$1@$0@@@%434$0@@|@|@@%262%221%150%216%105%274%434%429$1@$0@@@%434$0@@|@|@@%262%221%150%216%105%274%434%413$1@$0@@@%434$0@@|@|@@%262%222%151%216%105%274%434%409$1@$0@@@%434$0@@|@|@@%262%222%151%216%105%274%434%419$1@$0@@@%434$0@@|@|@@%262%222%151%216%105%274%434%421$1@$0@@@%434$0@@|@|@@%262%222%151%216%105%274%434%425$1@$0@@@%434$0@@|@|@@%262%222%151%216%105%274%434%427$1@$0@@@%434$0@@|@|@@%262%222%151%216%105%274%434%431$1@$0@@@%434$0@@|@|@@%262%227%154%216%105%274%410%415$1@$0@@@%410$0@@|@|@@%262%222%151%216%105%274%410%433$1@$0@@@%410$0@@|@|@@%262%222%151%216%105%274%410%417$1@$0@@@%410$0@@|@|@@%262%221%150%216%105%274%410%435$1@$0@@@%410$0@@|@|@@%262%221%150%216%105%274%410%423$1@$0@@@%410$0@@|@|@@%262%221%150%216%105%274%410%429$1@$0@@@%410$0@@|@|@@%262%221%150%216%105%274%410%413$1@$0@@@%410$0@@|@|@@%262%222%151%216%105%274%410%409$1@$0@@@%410$0@@|@|@@%262%222%151%216%105%274%410%419$1@$0@@@%410$0@@|@|@@%262%222%151%216%105%274%410%421$1@$0@@@%410$0@@|@|@@%262%222%151%216%105%274%410%425$1@$0@@@%410$0@@|@|@@%262%222%151%216%105%274%410%427$1@$0@@@%410$0@@|@|@@%262%222%151%216%105%274%410%431$1@$0@@@%410$0@@|@|@@%262%227%154%216%105%274%422%415$1@$0@@@%422$0@@|@|@@%262%222%151%216%105%274%422%433$1@$0@@@%422$0@@|@|@@%262%222%151%216%105%274%422%417$1@$0@@@%422$0@@|@|@@%262%221%150%216%105%274%422%435$1@$0@@@%422$0@@|@|@@%262%221%150%216%105%274%422%411$1@$0@@@%422$0@@|@|@@%262%221%150%216%105%274%422%429$1@$0@@@%422$0@@|@|@@%262%221%150%216%105%274%422%413$1@$0@@@%422$0@@|@|@@%262%222%151%216%105%274%422%409$1@$0@@@%422$0@@|@|@@%262%222%151%216%105%274%422%419$1@$0@@@%422$0@@|@|@@%262%222%151%216%105%274%422%421$1@$0@@@%422$0@@|@|@@%262%222%151%216%105%274%422%425$1@$0@@@%422$0@@|@|@@%262%222%151%216%105%274%422%427$1@$0@@@%422$0@@|@|@@%262%222%151%216%105%274%422%431$1@$0@@@%422$0@@|@|@@%262%227%154%216%105%274%428%415$1@$0@@@%428$0@@|@|@@%262%222%151%216%105%274%428%433$1@$0@@@%428$0@@|@|@@%262%222%151%216%105%274%428%417$1@$0@@@%428$0@@|@|@@%262%221%150%216%105%274%428%435$1@$0@@@%428$0@@|@|@@%262%221%150%216%105%274%428%411$1@$0@@@%428$0@@|@|@@%262%221%150%216%105%274%428%423$1@$0@@@%428$0@@|@|@@%262%221%150%216%105%274%428%413$1@$0@@@%428$0@@|@|@@%262%222%151%216%105%274%428%409$1@$0@@@%428$0@@|@|@@%262%222%151%216%105%274%428%419$1@$0@@@%428$0@@|@|@@%262%222%151%216%105%274%428%421$1@$0@@@%428$0@@|@|@@%262%222%151%216%105%274%428%425$1@$0@@@%428$0@@|@|@@%262%222%151%216%105%274%428%427$1@$0@@@%428$0@@|@|@@%262%222%151%216%105%274%428%431$1@$0@@@%428$0@@|@|@@%262%227%154%216%105%274%412%415$1@$0@@@%412$0@@|@|@@%262%222%151%216%105%274%412%433$1@$0@@@%412$0@@|@|@@%262%222%151%216%105%274%412%417$1@$0@@@%412$0@@|@|@@%262%221%150%216%105%274%412%435$1@$0@@@%412$0@@|@|@@%262%221%150%216%105%274%412%411$1@$0@@@%412$0@@|@|@@%262%221%150%216%105%274%412%423$1@$0@@@%412$0@@|@|@@%262%221%150%216%105%274%412%429$1@$0@@@%412$0@@|@|@@%262%222%151%216%105%274%412%409$1@$0@@@%412$0@@|@|@@%262%222%151%216%105%274%412%419$1@$0@@@%412$0@@|@|@@%262%222%151%216%105%274%412%421$1@$0@@@%412$0@@|@|@@%262%222%151%216%105%274%412%425$1@$0@@@%412$0@@|@|@@%262%222%151%216%105%274%412%427$1@$0@@@%412$0@@|@|@@%262%222%151%216%105%274%412%431$1@$0@@@%412$0@@|@|@@%262%227%154%216%105%275%408%415$1@$0@@@%408$0@@|@|@@%262%222%151%216%105%275%408%433$1@$0@@@%408$0@@|@|@@%262%222%151%216%105%275%408%417$1@$0@@@%408$0@@|@|@@%262%221%150%216%105%275%408%435$1@$0@@@%408$0@@|@|@@%262%221%150%216%105%275%408%411$1@$0@@@%408$0@@|@|@@%262%221%150%216%105%275%408%423$1@$0@@@%408$0@@|@|@@%262%221%150%216%105%275%408%429$1@$0@@@%408$0@@|@|@@%262%221%150%216%105%275%408%413$1@$0@@@%408$0@@|@|@@%262%222%151%216%105%275%408%419$1@$0@@@%408$0@@|@|@@%262%222%151%216%105%275%408%421$1@$0@@@%408$0@@|@|@@%262%222%151%216%105%275%408%425$1@$0@@@%408$0@@|@|@@%262%222%151%216%105%275%408%427$1@$0@@@%408$0@@|@|@@%262%222%151%216%105%275%408%431$1@$0@@@%408$0@@|@|@@%262%227%154%216%105%275%418%415$1@$0@@@%418$0@@|@|@@%262%222%151%216%105%275%418%433$1@$0@@@%418$0@@|@|@@%262%222%151%216%105%275%418%417$1@$0@@@%418$0@@|@|@@%262%221%150%216%105%275%418%435$1@$0@@@%418$0@@|@|@@%262%221%150%216%105%275%418%411$1@$0@@@%418$0@@|@|@@%262%221%150%216%105%275%418%423$1@$0@@@%418$0@@|@|@@%262%221%150%216%105%275%418%429$1@$0@@@%418$0@@|@|@@%262%221%150%216%105%275%418%413$1@$0@@@%418$0@@|@|@@%262%222%151%216%105%275%418%409$1@$0@@@%418$0@@|@|@@%262%222%151%216%105%275%418%421$1@$0@@@%418$0@@|@|@@%262%222%151%216%105%275%418%425$1@$0@@@%418$0@@|@|@@%262%222%151%216%105%275%418%427$1@$0@@@%418$0@@|@|@@%262%222%151%216%105%275%418%431$1@$0@@@%418$0@@|@|@@%262%227%154%216%105%275%420%415$1@$0@@@%420$0@@|@|@@%262%222%151%216%105%275%420%433$1@$0@@@%420$0@@|@|@@%262%222%151%216%105%275%420%417$1@$0@@@%420$0@@|@|@@%262%221%150%216%105%275%420%435$1@$0@@@%420$0@@|@|@@%262%221%150%216%105%275%420%411$1@$0@@@%420$0@@|@|@@%262%221%150%216%105%275%420%423$1@$0@@@%420$0@@|@|@@%262%221%150%216%105%275%420%429$1@$0@@@%420$0@@|@|@@%262%221%150%216%105%275%420%413$1@$0@@@%420$0@@|@|@@%262%222%151%216%105%275%420%409$1@$0@@@%420$0@@|@|@@%262%222%151%216%105%275%420%419$1@$0@@@%420$0@@|@|@@%262%222%151%216%105%275%420%425$1@$0@@@%420$0@@|@|@@%262%222%151%216%105%275%420%427$1@$0@@@%420$0@@|@|@@%262%222%151%216%105%275%420%431$1@$0@@@%420$0@@|@|@@%262%227%154%216%105%275%424%415$1@$0@@@%424$0@@|@|@@%262%222%151%216%105%275%424%433$1@$0@@@%424$0@@|@|@@%262%222%151%216%105%275%424%417$1@$0@@@%424$0@@|@|@@%262%221%150%216%105%275%424%435$1@$0@@@%424$0@@|@|@@%262%221%150%216%105%275%424%411$1@$0@@@%424$0@@|@|@@%262%221%150%216%105%275%424%423$1@$0@@@%424$0@@|@|@@%262%221%150%216%105%275%424%429$1@$0@@@%424$0@@|@|@@%262%221%150%216%105%275%424%413$1@$0@@@%424$0@@|@|@@%262%222%151%216%105%275%424%409$1@$0@@@%424$0@@|@|@@%262%222%151%216%105%275%424%419$1@$0@@@%424$0@@|@|@@%262%222%151%216%105%275%424%421$1@$0@@@%424$0@@|@|@@%262%222%151%216%105%275%424%427$1@$0@@@%424$0@@|@|@@%262%222%151%216%105%275%424%431$1@$0@@@%424$0@@|@|@@%262%227%154%216%105%275%426%415$1@$0@@@%426$0@@|@|@@%262%222%151%216%105%275%426%433$1@$0@@@%426$0@@|@|@@%262%222%151%216%105%275%426%417$1@$0@@@%426$0@@|@|@@%262%221%150%216%105%275%426%435$1@$0@@@%426$0@@|@|@@%262%221%150%216%105%275%426%411$1@$0@@@%426$0@@|@|@@%262%221%150%216%105%275%426%423$1@$0@@@%426$0@@|@|@@%262%221%150%216%105%275%426%429$1@$0@@@%426$0@@|@|@@%262%221%150%216%105%275%426%413$1@$0@@@%426$0@@|@|@@%262%222%151%216%105%275%426%409$1@$0@@@%426$0@@|@|@@%262%222%151%216%105%275%426%419$1@$0@@@%426$0@@|@|@@%262%222%151%216%105%275%426%421$1@$0@@@%426$0@@|@|@@%262%222%151%216%105%275%426%425$1@$0@@@%426$0@@|@|@@%262%222%151%216%105%275%426%431$1@$0@@@%426$0@@|@|@@%262%227%154%216%105%275%430%415$1@$0@@@%430$0@@|@|@@%262%222%151%216%105%275%430%433$1@$0@@@%430$0@@|@|@@%262%222%151%216%105%275%430%417$1@$0@@@%430$0@@|@|@@%262%221%150%216%105%275%430%435$1@$0@@@%430$0@@|@|@@%262%221%150%216%105%275%430%411$1@$0@@@%430$0@@|@|@@%262%221%150%216%105%275%430%423$1@$0@@@%430$0@@|@|@@%262%221%150%216%105%275%430%429$1@$0@@@%430$0@@|@|@@%262%221%150%216%105%275%430%413$1@$0@@@%430$0@@|@|@@%262%222%151%216%105%275%430%409$1@$0@@@%430$0@@|@|@@%262%222%151%216%105%275%430%419$1@$0@@@%430$0@@|@|@@%262%222%151%216%105%275%430%421$1@$0@@@%430$0@@|@|@@%262%222%151%216%105%275%430%425$1@$0@@@%430$0@@|@|@@%262%222%151%216%105%275%430%427$1@$0@@@%430$0@@|@|@@%262%227%154%216%105%289%414%415$1@$0@@@$1%414$0@@@|@|@@%262%222%151%216%105%275%432%433$1@$0@@@$1%432$0@@@|@|@@%262%222%151%216%105%275%416%417$1@$0@@@$1%416$0@@@|@|@@%262%221%150%216%105%274%434%435$1@$0@@@$1%434$0@@@|@|@@%262%221%150%216%105%274%410%411$1@$0@@@$1%410$0@@@|@|@@%262%221%150%216%105%274%422%423$1@$0@@@$1%422$0@@@|@|@@%262%221%150%216%105%274%428%429$1@$0@@@$1%428$0@@@|@|@@%262%221%150%216%105%274%412%413$1@$0@@@$1%412$0@@@|@|@@%262%222%151%216%105%275%408%409$1@$0@@@$1%408$0@@@|@|@@%262%222%151%216%105%275%418%419$1@$0@@@$1%418$0@@@|@|@@%262%222%151%216%105%275%420%421$1@$0@@@$1%420$0@@@|@|@@%262%222%151%216%105%275%424%425$1@$0@@@$1%424$0@@@|@|@@%262%222%151%216%105%275%426%427$1@$0@@@$1%426$0@@@|@|@@%222%151%216%105%275%430%431$1@$0@@@$1%430$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_header_fupdfupds x = x
    val op elf32_header_fupdfupds =
    DT(((("elf_header",326),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_header",[290,291,292,324])]),["DISK_THM"]),
       [read"%262%227%167%227%154%216%105%277%415$1@%415$2@$0@@@%415%826$1@$2@@$0@@|@|@|@@%262%222%166%222%151%216%105%277%433$1@%433$2@$0@@@%433%821$1@$2@@$0@@|@|@|@@%262%222%166%222%151%216%105%277%417$1@%417$2@$0@@@%417%821$1@$2@@$0@@|@|@|@@%262%221%165%221%150%216%105%277%435$1@%435$2@$0@@@%435%820$1@$2@@$0@@|@|@|@@%262%221%165%221%150%216%105%277%411$1@%411$2@$0@@@%411%820$1@$2@@$0@@|@|@|@@%262%221%165%221%150%216%105%277%423$1@%423$2@$0@@@%423%820$1@$2@@$0@@|@|@|@@%262%221%165%221%150%216%105%277%429$1@%429$2@$0@@@%429%820$1@$2@@$0@@|@|@|@@%262%221%165%221%150%216%105%277%413$1@%413$2@$0@@@%413%820$1@$2@@$0@@|@|@|@@%262%222%166%222%151%216%105%277%409$1@%409$2@$0@@@%409%821$1@$2@@$0@@|@|@|@@%262%222%166%222%151%216%105%277%419$1@%419$2@$0@@@%419%821$1@$2@@$0@@|@|@|@@%262%222%166%222%151%216%105%277%421$1@%421$2@$0@@@%421%821$1@$2@@$0@@|@|@|@@%262%222%166%222%151%216%105%277%425$1@%425$2@$0@@@%425%821$1@$2@@$0@@|@|@|@@%262%222%166%222%151%216%105%277%427$1@%427$2@$0@@@%427%821$1@$2@@$0@@|@|@|@@%222%166%222%151%216%105%277%431$1@%431$2@$0@@@%431%821$1@$2@@$0@@|@|@|@@@@@@@@@@@@@@"])
  fun op elf32_header_fupdfupds_comp x = x
    val op elf32_header_fupdfupds_comp =
    DT(((("elf_header",327),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_header",[290,291,292,324])]),["DISK_THM"]),
       [read"%262%262%227%167%227%154%285%823%415$0@@%415$1@@@%415%826$0@$1@@@|@|@@%218%168%227%167%227%154%283%822%415$0@@%822%415$1@@$2@@@%822%415%826$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%285%823%433$0@@%433$1@@@%433%821$0@$1@@@|@|@@%218%168%222%166%222%151%283%822%433$0@@%822%433$1@@$2@@@%822%433%821$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%285%823%417$0@@%417$1@@@%417%821$0@$1@@@|@|@@%218%168%222%166%222%151%283%822%417$0@@%822%417$1@@$2@@@%822%417%821$0@$1@@@$2@@|@|@|@@@%262%262%221%165%221%150%285%823%435$0@@%435$1@@@%435%820$0@$1@@@|@|@@%218%168%221%165%221%150%283%822%435$0@@%822%435$1@@$2@@@%822%435%820$0@$1@@@$2@@|@|@|@@@%262%262%221%165%221%150%285%823%411$0@@%411$1@@@%411%820$0@$1@@@|@|@@%218%168%221%165%221%150%283%822%411$0@@%822%411$1@@$2@@@%822%411%820$0@$1@@@$2@@|@|@|@@@%262%262%221%165%221%150%285%823%423$0@@%423$1@@@%423%820$0@$1@@@|@|@@%218%168%221%165%221%150%283%822%423$0@@%822%423$1@@$2@@@%822%423%820$0@$1@@@$2@@|@|@|@@@%262%262%221%165%221%150%285%823%429$0@@%429$1@@@%429%820$0@$1@@@|@|@@%218%168%221%165%221%150%283%822%429$0@@%822%429$1@@$2@@@%822%429%820$0@$1@@@$2@@|@|@|@@@%262%262%221%165%221%150%285%823%413$0@@%413$1@@@%413%820$0@$1@@@|@|@@%218%168%221%165%221%150%283%822%413$0@@%822%413$1@@$2@@@%822%413%820$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%285%823%409$0@@%409$1@@@%409%821$0@$1@@@|@|@@%218%168%222%166%222%151%283%822%409$0@@%822%409$1@@$2@@@%822%409%821$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%285%823%419$0@@%419$1@@@%419%821$0@$1@@@|@|@@%218%168%222%166%222%151%283%822%419$0@@%822%419$1@@$2@@@%822%419%821$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%285%823%421$0@@%421$1@@@%421%821$0@$1@@@|@|@@%218%168%222%166%222%151%283%822%421$0@@%822%421$1@@$2@@@%822%421%821$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%285%823%425$0@@%425$1@@@%425%821$0@$1@@@|@|@@%218%168%222%166%222%151%283%822%425$0@@%822%425$1@@$2@@@%822%425%821$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%285%823%427$0@@%427$1@@@%427%821$0@$1@@@|@|@@%218%168%222%166%222%151%283%822%427$0@@%822%427$1@@$2@@@%822%427%821$0@$1@@@$2@@|@|@|@@@%262%222%166%222%151%285%823%431$0@@%431$1@@@%431%821$0@$1@@@|@|@@%218%168%222%166%222%151%283%822%431$0@@%822%431$1@@$2@@@%822%431%821$0@$1@@@$2@@|@|@|@@@@@@@@@@@@@@@"])
  fun op elf32_header_fupdcanon x = x
    val op elf32_header_fupdcanon =
    DT(((("elf_header",328),
        [("bool",[25,26,55,180]),
         ("elf_header",[290,291,292,324])]),["DISK_THM"]),
       [read"%262%227%167%222%151%216%105%277%433$1@%415$2@$0@@@%415$2@%433$1@$0@@@|@|@|@@%262%227%167%222%151%216%105%277%417$1@%415$2@$0@@@%415$2@%417$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%417$1@%433$2@$0@@@%433$2@%417$1@$0@@@|@|@|@@%262%227%167%221%150%216%105%277%435$1@%415$2@$0@@@%415$2@%435$1@$0@@@|@|@|@@%262%222%166%221%150%216%105%277%435$1@%433$2@$0@@@%433$2@%435$1@$0@@@|@|@|@@%262%222%166%221%150%216%105%277%435$1@%417$2@$0@@@%417$2@%435$1@$0@@@|@|@|@@%262%227%167%221%150%216%105%277%411$1@%415$2@$0@@@%415$2@%411$1@$0@@@|@|@|@@%262%222%166%221%150%216%105%277%411$1@%433$2@$0@@@%433$2@%411$1@$0@@@|@|@|@@%262%222%166%221%150%216%105%277%411$1@%417$2@$0@@@%417$2@%411$1@$0@@@|@|@|@@%262%221%165%221%150%216%105%277%411$1@%435$2@$0@@@%435$2@%411$1@$0@@@|@|@|@@%262%227%167%221%150%216%105%277%423$1@%415$2@$0@@@%415$2@%423$1@$0@@@|@|@|@@%262%222%166%221%150%216%105%277%423$1@%433$2@$0@@@%433$2@%423$1@$0@@@|@|@|@@%262%222%166%221%150%216%105%277%423$1@%417$2@$0@@@%417$2@%423$1@$0@@@|@|@|@@%262%221%165%221%150%216%105%277%423$1@%435$2@$0@@@%435$2@%423$1@$0@@@|@|@|@@%262%221%165%221%150%216%105%277%423$1@%411$2@$0@@@%411$2@%423$1@$0@@@|@|@|@@%262%227%167%221%150%216%105%277%429$1@%415$2@$0@@@%415$2@%429$1@$0@@@|@|@|@@%262%222%166%221%150%216%105%277%429$1@%433$2@$0@@@%433$2@%429$1@$0@@@|@|@|@@%262%222%166%221%150%216%105%277%429$1@%417$2@$0@@@%417$2@%429$1@$0@@@|@|@|@@%262%221%165%221%150%216%105%277%429$1@%435$2@$0@@@%435$2@%429$1@$0@@@|@|@|@@%262%221%165%221%150%216%105%277%429$1@%411$2@$0@@@%411$2@%429$1@$0@@@|@|@|@@%262%221%165%221%150%216%105%277%429$1@%423$2@$0@@@%423$2@%429$1@$0@@@|@|@|@@%262%227%167%221%150%216%105%277%413$1@%415$2@$0@@@%415$2@%413$1@$0@@@|@|@|@@%262%222%166%221%150%216%105%277%413$1@%433$2@$0@@@%433$2@%413$1@$0@@@|@|@|@@%262%222%166%221%150%216%105%277%413$1@%417$2@$0@@@%417$2@%413$1@$0@@@|@|@|@@%262%221%165%221%150%216%105%277%413$1@%435$2@$0@@@%435$2@%413$1@$0@@@|@|@|@@%262%221%165%221%150%216%105%277%413$1@%411$2@$0@@@%411$2@%413$1@$0@@@|@|@|@@%262%221%165%221%150%216%105%277%413$1@%423$2@$0@@@%423$2@%413$1@$0@@@|@|@|@@%262%221%165%221%150%216%105%277%413$1@%429$2@$0@@@%429$2@%413$1@$0@@@|@|@|@@%262%227%167%222%151%216%105%277%409$1@%415$2@$0@@@%415$2@%409$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%409$1@%433$2@$0@@@%433$2@%409$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%409$1@%417$2@$0@@@%417$2@%409$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%409$1@%435$2@$0@@@%435$2@%409$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%409$1@%411$2@$0@@@%411$2@%409$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%409$1@%423$2@$0@@@%423$2@%409$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%409$1@%429$2@$0@@@%429$2@%409$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%409$1@%413$2@$0@@@%413$2@%409$1@$0@@@|@|@|@@%262%227%167%222%151%216%105%277%419$1@%415$2@$0@@@%415$2@%419$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%419$1@%433$2@$0@@@%433$2@%419$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%419$1@%417$2@$0@@@%417$2@%419$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%419$1@%435$2@$0@@@%435$2@%419$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%419$1@%411$2@$0@@@%411$2@%419$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%419$1@%423$2@$0@@@%423$2@%419$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%419$1@%429$2@$0@@@%429$2@%419$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%419$1@%413$2@$0@@@%413$2@%419$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%419$1@%409$2@$0@@@%409$2@%419$1@$0@@@|@|@|@@%262%227%167%222%151%216%105%277%421$1@%415$2@$0@@@%415$2@%421$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%421$1@%433$2@$0@@@%433$2@%421$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%421$1@%417$2@$0@@@%417$2@%421$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%421$1@%435$2@$0@@@%435$2@%421$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%421$1@%411$2@$0@@@%411$2@%421$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%421$1@%423$2@$0@@@%423$2@%421$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%421$1@%429$2@$0@@@%429$2@%421$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%421$1@%413$2@$0@@@%413$2@%421$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%421$1@%409$2@$0@@@%409$2@%421$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%421$1@%419$2@$0@@@%419$2@%421$1@$0@@@|@|@|@@%262%227%167%222%151%216%105%277%425$1@%415$2@$0@@@%415$2@%425$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%425$1@%433$2@$0@@@%433$2@%425$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%425$1@%417$2@$0@@@%417$2@%425$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%425$1@%435$2@$0@@@%435$2@%425$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%425$1@%411$2@$0@@@%411$2@%425$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%425$1@%423$2@$0@@@%423$2@%425$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%425$1@%429$2@$0@@@%429$2@%425$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%425$1@%413$2@$0@@@%413$2@%425$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%425$1@%409$2@$0@@@%409$2@%425$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%425$1@%419$2@$0@@@%419$2@%425$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%425$1@%421$2@$0@@@%421$2@%425$1@$0@@@|@|@|@@%262%227%167%222%151%216%105%277%427$1@%415$2@$0@@@%415$2@%427$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%427$1@%433$2@$0@@@%433$2@%427$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%427$1@%417$2@$0@@@%417$2@%427$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%427$1@%435$2@$0@@@%435$2@%427$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%427$1@%411$2@$0@@@%411$2@%427$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%427$1@%423$2@$0@@@%423$2@%427$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%427$1@%429$2@$0@@@%429$2@%427$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%427$1@%413$2@$0@@@%413$2@%427$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%427$1@%409$2@$0@@@%409$2@%427$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%427$1@%419$2@$0@@@%419$2@%427$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%427$1@%421$2@$0@@@%421$2@%427$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%427$1@%425$2@$0@@@%425$2@%427$1@$0@@@|@|@|@@%262%227%167%222%151%216%105%277%431$1@%415$2@$0@@@%415$2@%431$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%431$1@%433$2@$0@@@%433$2@%431$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%431$1@%417$2@$0@@@%417$2@%431$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%431$1@%435$2@$0@@@%435$2@%431$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%431$1@%411$2@$0@@@%411$2@%431$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%431$1@%423$2@$0@@@%423$2@%431$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%431$1@%429$2@$0@@@%429$2@%431$1@$0@@@|@|@|@@%262%221%165%222%151%216%105%277%431$1@%413$2@$0@@@%413$2@%431$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%431$1@%409$2@$0@@@%409$2@%431$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%431$1@%419$2@$0@@@%419$2@%431$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%431$1@%421$2@$0@@@%421$2@%431$1@$0@@@|@|@|@@%262%222%166%222%151%216%105%277%431$1@%425$2@$0@@@%425$2@%431$1@$0@@@|@|@|@@%222%166%222%151%216%105%277%431$1@%427$2@$0@@@%427$2@%431$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_header_fupdcanon_comp x = x
    val op elf32_header_fupdcanon_comp =
    DT(((("elf_header",329),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_header",[290,291,292,324])]),["DISK_THM"]),
       [read"%262%262%227%167%222%151%285%823%433$0@@%415$1@@@%823%415$1@@%433$0@@@|@|@@%218%168%227%167%222%151%283%822%433$0@@%822%415$1@@$2@@@%822%415$1@@%822%433$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%285%823%417$0@@%415$1@@@%823%415$1@@%417$0@@@|@|@@%218%168%227%167%222%151%283%822%417$0@@%822%415$1@@$2@@@%822%415$1@@%822%417$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%417$0@@%433$1@@@%823%433$1@@%417$0@@@|@|@@%218%168%222%166%222%151%283%822%417$0@@%822%433$1@@$2@@@%822%433$1@@%822%417$0@@$2@@@|@|@|@@@%262%262%227%167%221%150%285%823%435$0@@%415$1@@@%823%415$1@@%435$0@@@|@|@@%218%168%227%167%221%150%283%822%435$0@@%822%415$1@@$2@@@%822%415$1@@%822%435$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%285%823%435$0@@%433$1@@@%823%433$1@@%435$0@@@|@|@@%218%168%222%166%221%150%283%822%435$0@@%822%433$1@@$2@@@%822%433$1@@%822%435$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%285%823%435$0@@%417$1@@@%823%417$1@@%435$0@@@|@|@@%218%168%222%166%221%150%283%822%435$0@@%822%417$1@@$2@@@%822%417$1@@%822%435$0@@$2@@@|@|@|@@@%262%262%227%167%221%150%285%823%411$0@@%415$1@@@%823%415$1@@%411$0@@@|@|@@%218%168%227%167%221%150%283%822%411$0@@%822%415$1@@$2@@@%822%415$1@@%822%411$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%285%823%411$0@@%433$1@@@%823%433$1@@%411$0@@@|@|@@%218%168%222%166%221%150%283%822%411$0@@%822%433$1@@$2@@@%822%433$1@@%822%411$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%285%823%411$0@@%417$1@@@%823%417$1@@%411$0@@@|@|@@%218%168%222%166%221%150%283%822%411$0@@%822%417$1@@$2@@@%822%417$1@@%822%411$0@@$2@@@|@|@|@@@%262%262%221%165%221%150%285%823%411$0@@%435$1@@@%823%435$1@@%411$0@@@|@|@@%218%168%221%165%221%150%283%822%411$0@@%822%435$1@@$2@@@%822%435$1@@%822%411$0@@$2@@@|@|@|@@@%262%262%227%167%221%150%285%823%423$0@@%415$1@@@%823%415$1@@%423$0@@@|@|@@%218%168%227%167%221%150%283%822%423$0@@%822%415$1@@$2@@@%822%415$1@@%822%423$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%285%823%423$0@@%433$1@@@%823%433$1@@%423$0@@@|@|@@%218%168%222%166%221%150%283%822%423$0@@%822%433$1@@$2@@@%822%433$1@@%822%423$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%285%823%423$0@@%417$1@@@%823%417$1@@%423$0@@@|@|@@%218%168%222%166%221%150%283%822%423$0@@%822%417$1@@$2@@@%822%417$1@@%822%423$0@@$2@@@|@|@|@@@%262%262%221%165%221%150%285%823%423$0@@%435$1@@@%823%435$1@@%423$0@@@|@|@@%218%168%221%165%221%150%283%822%423$0@@%822%435$1@@$2@@@%822%435$1@@%822%423$0@@$2@@@|@|@|@@@%262%262%221%165%221%150%285%823%423$0@@%411$1@@@%823%411$1@@%423$0@@@|@|@@%218%168%221%165%221%150%283%822%423$0@@%822%411$1@@$2@@@%822%411$1@@%822%423$0@@$2@@@|@|@|@@@%262%262%227%167%221%150%285%823%429$0@@%415$1@@@%823%415$1@@%429$0@@@|@|@@%218%168%227%167%221%150%283%822%429$0@@%822%415$1@@$2@@@%822%415$1@@%822%429$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%285%823%429$0@@%433$1@@@%823%433$1@@%429$0@@@|@|@@%218%168%222%166%221%150%283%822%429$0@@%822%433$1@@$2@@@%822%433$1@@%822%429$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%285%823%429$0@@%417$1@@@%823%417$1@@%429$0@@@|@|@@%218%168%222%166%221%150%283%822%429$0@@%822%417$1@@$2@@@%822%417$1@@%822%429$0@@$2@@@|@|@|@@@%262%262%221%165%221%150%285%823%429$0@@%435$1@@@%823%435$1@@%429$0@@@|@|@@%218%168%221%165%221%150%283%822%429$0@@%822%435$1@@$2@@@%822%435$1@@%822%429$0@@$2@@@|@|@|@@@%262%262%221%165%221%150%285%823%429$0@@%411$1@@@%823%411$1@@%429$0@@@|@|@@%218%168%221%165%221%150%283%822%429$0@@%822%411$1@@$2@@@%822%411$1@@%822%429$0@@$2@@@|@|@|@@@%262%262%221%165%221%150%285%823%429$0@@%423$1@@@%823%423$1@@%429$0@@@|@|@@%218%168%221%165%221%150%283%822%429$0@@%822%423$1@@$2@@@%822%423$1@@%822%429$0@@$2@@@|@|@|@@@%262%262%227%167%221%150%285%823%413$0@@%415$1@@@%823%415$1@@%413$0@@@|@|@@%218%168%227%167%221%150%283%822%413$0@@%822%415$1@@$2@@@%822%415$1@@%822%413$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%285%823%413$0@@%433$1@@@%823%433$1@@%413$0@@@|@|@@%218%168%222%166%221%150%283%822%413$0@@%822%433$1@@$2@@@%822%433$1@@%822%413$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%285%823%413$0@@%417$1@@@%823%417$1@@%413$0@@@|@|@@%218%168%222%166%221%150%283%822%413$0@@%822%417$1@@$2@@@%822%417$1@@%822%413$0@@$2@@@|@|@|@@@%262%262%221%165%221%150%285%823%413$0@@%435$1@@@%823%435$1@@%413$0@@@|@|@@%218%168%221%165%221%150%283%822%413$0@@%822%435$1@@$2@@@%822%435$1@@%822%413$0@@$2@@@|@|@|@@@%262%262%221%165%221%150%285%823%413$0@@%411$1@@@%823%411$1@@%413$0@@@|@|@@%218%168%221%165%221%150%283%822%413$0@@%822%411$1@@$2@@@%822%411$1@@%822%413$0@@$2@@@|@|@|@@@%262%262%221%165%221%150%285%823%413$0@@%423$1@@@%823%423$1@@%413$0@@@|@|@@%218%168%221%165%221%150%283%822%413$0@@%822%423$1@@$2@@@%822%423$1@@%822%413$0@@$2@@@|@|@|@@@%262%262%221%165%221%150%285%823%413$0@@%429$1@@@%823%429$1@@%413$0@@@|@|@@%218%168%221%165%221%150%283%822%413$0@@%822%429$1@@$2@@@%822%429$1@@%822%413$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%285%823%409$0@@%415$1@@@%823%415$1@@%409$0@@@|@|@@%218%168%227%167%222%151%283%822%409$0@@%822%415$1@@$2@@@%822%415$1@@%822%409$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%409$0@@%433$1@@@%823%433$1@@%409$0@@@|@|@@%218%168%222%166%222%151%283%822%409$0@@%822%433$1@@$2@@@%822%433$1@@%822%409$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%409$0@@%417$1@@@%823%417$1@@%409$0@@@|@|@@%218%168%222%166%222%151%283%822%409$0@@%822%417$1@@$2@@@%822%417$1@@%822%409$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%409$0@@%435$1@@@%823%435$1@@%409$0@@@|@|@@%218%168%221%165%222%151%283%822%409$0@@%822%435$1@@$2@@@%822%435$1@@%822%409$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%409$0@@%411$1@@@%823%411$1@@%409$0@@@|@|@@%218%168%221%165%222%151%283%822%409$0@@%822%411$1@@$2@@@%822%411$1@@%822%409$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%409$0@@%423$1@@@%823%423$1@@%409$0@@@|@|@@%218%168%221%165%222%151%283%822%409$0@@%822%423$1@@$2@@@%822%423$1@@%822%409$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%409$0@@%429$1@@@%823%429$1@@%409$0@@@|@|@@%218%168%221%165%222%151%283%822%409$0@@%822%429$1@@$2@@@%822%429$1@@%822%409$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%409$0@@%413$1@@@%823%413$1@@%409$0@@@|@|@@%218%168%221%165%222%151%283%822%409$0@@%822%413$1@@$2@@@%822%413$1@@%822%409$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%285%823%419$0@@%415$1@@@%823%415$1@@%419$0@@@|@|@@%218%168%227%167%222%151%283%822%419$0@@%822%415$1@@$2@@@%822%415$1@@%822%419$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%419$0@@%433$1@@@%823%433$1@@%419$0@@@|@|@@%218%168%222%166%222%151%283%822%419$0@@%822%433$1@@$2@@@%822%433$1@@%822%419$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%419$0@@%417$1@@@%823%417$1@@%419$0@@@|@|@@%218%168%222%166%222%151%283%822%419$0@@%822%417$1@@$2@@@%822%417$1@@%822%419$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%419$0@@%435$1@@@%823%435$1@@%419$0@@@|@|@@%218%168%221%165%222%151%283%822%419$0@@%822%435$1@@$2@@@%822%435$1@@%822%419$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%419$0@@%411$1@@@%823%411$1@@%419$0@@@|@|@@%218%168%221%165%222%151%283%822%419$0@@%822%411$1@@$2@@@%822%411$1@@%822%419$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%419$0@@%423$1@@@%823%423$1@@%419$0@@@|@|@@%218%168%221%165%222%151%283%822%419$0@@%822%423$1@@$2@@@%822%423$1@@%822%419$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%419$0@@%429$1@@@%823%429$1@@%419$0@@@|@|@@%218%168%221%165%222%151%283%822%419$0@@%822%429$1@@$2@@@%822%429$1@@%822%419$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%419$0@@%413$1@@@%823%413$1@@%419$0@@@|@|@@%218%168%221%165%222%151%283%822%419$0@@%822%413$1@@$2@@@%822%413$1@@%822%419$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%419$0@@%409$1@@@%823%409$1@@%419$0@@@|@|@@%218%168%222%166%222%151%283%822%419$0@@%822%409$1@@$2@@@%822%409$1@@%822%419$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%285%823%421$0@@%415$1@@@%823%415$1@@%421$0@@@|@|@@%218%168%227%167%222%151%283%822%421$0@@%822%415$1@@$2@@@%822%415$1@@%822%421$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%421$0@@%433$1@@@%823%433$1@@%421$0@@@|@|@@%218%168%222%166%222%151%283%822%421$0@@%822%433$1@@$2@@@%822%433$1@@%822%421$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%421$0@@%417$1@@@%823%417$1@@%421$0@@@|@|@@%218%168%222%166%222%151%283%822%421$0@@%822%417$1@@$2@@@%822%417$1@@%822%421$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%421$0@@%435$1@@@%823%435$1@@%421$0@@@|@|@@%218%168%221%165%222%151%283%822%421$0@@%822%435$1@@$2@@@%822%435$1@@%822%421$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%421$0@@%411$1@@@%823%411$1@@%421$0@@@|@|@@%218%168%221%165%222%151%283%822%421$0@@%822%411$1@@$2@@@%822%411$1@@%822%421$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%421$0@@%423$1@@@%823%423$1@@%421$0@@@|@|@@%218%168%221%165%222%151%283%822%421$0@@%822%423$1@@$2@@@%822%423$1@@%822%421$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%421$0@@%429$1@@@%823%429$1@@%421$0@@@|@|@@%218%168%221%165%222%151%283%822%421$0@@%822%429$1@@$2@@@%822%429$1@@%822%421$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%421$0@@%413$1@@@%823%413$1@@%421$0@@@|@|@@%218%168%221%165%222%151%283%822%421$0@@%822%413$1@@$2@@@%822%413$1@@%822%421$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%421$0@@%409$1@@@%823%409$1@@%421$0@@@|@|@@%218%168%222%166%222%151%283%822%421$0@@%822%409$1@@$2@@@%822%409$1@@%822%421$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%421$0@@%419$1@@@%823%419$1@@%421$0@@@|@|@@%218%168%222%166%222%151%283%822%421$0@@%822%419$1@@$2@@@%822%419$1@@%822%421$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%285%823%425$0@@%415$1@@@%823%415$1@@%425$0@@@|@|@@%218%168%227%167%222%151%283%822%425$0@@%822%415$1@@$2@@@%822%415$1@@%822%425$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%425$0@@%433$1@@@%823%433$1@@%425$0@@@|@|@@%218%168%222%166%222%151%283%822%425$0@@%822%433$1@@$2@@@%822%433$1@@%822%425$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%425$0@@%417$1@@@%823%417$1@@%425$0@@@|@|@@%218%168%222%166%222%151%283%822%425$0@@%822%417$1@@$2@@@%822%417$1@@%822%425$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%425$0@@%435$1@@@%823%435$1@@%425$0@@@|@|@@%218%168%221%165%222%151%283%822%425$0@@%822%435$1@@$2@@@%822%435$1@@%822%425$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%425$0@@%411$1@@@%823%411$1@@%425$0@@@|@|@@%218%168%221%165%222%151%283%822%425$0@@%822%411$1@@$2@@@%822%411$1@@%822%425$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%425$0@@%423$1@@@%823%423$1@@%425$0@@@|@|@@%218%168%221%165%222%151%283%822%425$0@@%822%423$1@@$2@@@%822%423$1@@%822%425$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%425$0@@%429$1@@@%823%429$1@@%425$0@@@|@|@@%218%168%221%165%222%151%283%822%425$0@@%822%429$1@@$2@@@%822%429$1@@%822%425$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%425$0@@%413$1@@@%823%413$1@@%425$0@@@|@|@@%218%168%221%165%222%151%283%822%425$0@@%822%413$1@@$2@@@%822%413$1@@%822%425$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%425$0@@%409$1@@@%823%409$1@@%425$0@@@|@|@@%218%168%222%166%222%151%283%822%425$0@@%822%409$1@@$2@@@%822%409$1@@%822%425$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%425$0@@%419$1@@@%823%419$1@@%425$0@@@|@|@@%218%168%222%166%222%151%283%822%425$0@@%822%419$1@@$2@@@%822%419$1@@%822%425$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%425$0@@%421$1@@@%823%421$1@@%425$0@@@|@|@@%218%168%222%166%222%151%283%822%425$0@@%822%421$1@@$2@@@%822%421$1@@%822%425$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%285%823%427$0@@%415$1@@@%823%415$1@@%427$0@@@|@|@@%218%168%227%167%222%151%283%822%427$0@@%822%415$1@@$2@@@%822%415$1@@%822%427$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%427$0@@%433$1@@@%823%433$1@@%427$0@@@|@|@@%218%168%222%166%222%151%283%822%427$0@@%822%433$1@@$2@@@%822%433$1@@%822%427$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%427$0@@%417$1@@@%823%417$1@@%427$0@@@|@|@@%218%168%222%166%222%151%283%822%427$0@@%822%417$1@@$2@@@%822%417$1@@%822%427$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%427$0@@%435$1@@@%823%435$1@@%427$0@@@|@|@@%218%168%221%165%222%151%283%822%427$0@@%822%435$1@@$2@@@%822%435$1@@%822%427$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%427$0@@%411$1@@@%823%411$1@@%427$0@@@|@|@@%218%168%221%165%222%151%283%822%427$0@@%822%411$1@@$2@@@%822%411$1@@%822%427$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%427$0@@%423$1@@@%823%423$1@@%427$0@@@|@|@@%218%168%221%165%222%151%283%822%427$0@@%822%423$1@@$2@@@%822%423$1@@%822%427$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%427$0@@%429$1@@@%823%429$1@@%427$0@@@|@|@@%218%168%221%165%222%151%283%822%427$0@@%822%429$1@@$2@@@%822%429$1@@%822%427$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%427$0@@%413$1@@@%823%413$1@@%427$0@@@|@|@@%218%168%221%165%222%151%283%822%427$0@@%822%413$1@@$2@@@%822%413$1@@%822%427$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%427$0@@%409$1@@@%823%409$1@@%427$0@@@|@|@@%218%168%222%166%222%151%283%822%427$0@@%822%409$1@@$2@@@%822%409$1@@%822%427$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%427$0@@%419$1@@@%823%419$1@@%427$0@@@|@|@@%218%168%222%166%222%151%283%822%427$0@@%822%419$1@@$2@@@%822%419$1@@%822%427$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%427$0@@%421$1@@@%823%421$1@@%427$0@@@|@|@@%218%168%222%166%222%151%283%822%427$0@@%822%421$1@@$2@@@%822%421$1@@%822%427$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%427$0@@%425$1@@@%823%425$1@@%427$0@@@|@|@@%218%168%222%166%222%151%283%822%427$0@@%822%425$1@@$2@@@%822%425$1@@%822%427$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%285%823%431$0@@%415$1@@@%823%415$1@@%431$0@@@|@|@@%218%168%227%167%222%151%283%822%431$0@@%822%415$1@@$2@@@%822%415$1@@%822%431$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%431$0@@%433$1@@@%823%433$1@@%431$0@@@|@|@@%218%168%222%166%222%151%283%822%431$0@@%822%433$1@@$2@@@%822%433$1@@%822%431$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%431$0@@%417$1@@@%823%417$1@@%431$0@@@|@|@@%218%168%222%166%222%151%283%822%431$0@@%822%417$1@@$2@@@%822%417$1@@%822%431$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%431$0@@%435$1@@@%823%435$1@@%431$0@@@|@|@@%218%168%221%165%222%151%283%822%431$0@@%822%435$1@@$2@@@%822%435$1@@%822%431$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%431$0@@%411$1@@@%823%411$1@@%431$0@@@|@|@@%218%168%221%165%222%151%283%822%431$0@@%822%411$1@@$2@@@%822%411$1@@%822%431$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%431$0@@%423$1@@@%823%423$1@@%431$0@@@|@|@@%218%168%221%165%222%151%283%822%431$0@@%822%423$1@@$2@@@%822%423$1@@%822%431$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%431$0@@%429$1@@@%823%429$1@@%431$0@@@|@|@@%218%168%221%165%222%151%283%822%431$0@@%822%429$1@@$2@@@%822%429$1@@%822%431$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%285%823%431$0@@%413$1@@@%823%413$1@@%431$0@@@|@|@@%218%168%221%165%222%151%283%822%431$0@@%822%413$1@@$2@@@%822%413$1@@%822%431$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%431$0@@%409$1@@@%823%409$1@@%431$0@@@|@|@@%218%168%222%166%222%151%283%822%431$0@@%822%409$1@@$2@@@%822%409$1@@%822%431$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%431$0@@%419$1@@@%823%419$1@@%431$0@@@|@|@@%218%168%222%166%222%151%283%822%431$0@@%822%419$1@@$2@@@%822%419$1@@%822%431$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%431$0@@%421$1@@@%823%421$1@@%431$0@@@|@|@@%218%168%222%166%222%151%283%822%431$0@@%822%421$1@@$2@@@%822%421$1@@%822%431$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%285%823%431$0@@%425$1@@@%823%425$1@@%431$0@@@|@|@@%218%168%222%166%222%151%283%822%431$0@@%822%425$1@@$2@@@%822%425$1@@%822%431$0@@$2@@@|@|@|@@@%262%222%166%222%151%285%823%431$0@@%427$1@@@%823%427$1@@%431$0@@@|@|@@%218%168%222%166%222%151%283%822%431$0@@%822%427$1@@$2@@@%822%427$1@@%822%431$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf32_header_component_equality x = x
    val op elf32_header_component_equality =
    DT(((("elf_header",330),
        [("bool",[25,26,50,55,62,180]),("elf_header",[290,291,292,309]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%216%107%216%109%271%277$1@$0@@%262%289%414$1@@%414$0@@@%262%275%432$1@@%432$0@@@%262%275%416$1@@%416$0@@@%262%274%434$1@@%434$0@@@%262%274%410$1@@%410$0@@@%262%274%422$1@@%422$0@@@%262%274%428$1@@%428$0@@@%262%274%412$1@@%412$0@@@%262%275%408$1@@%408$0@@@%262%275%418$1@@%418$0@@@%262%275%420$1@@%420$0@@@%262%275%424$1@@%424$0@@@%262%275%426$1@@%426$0@@@%275%430$1@@%430$0@@@@@@@@@@@@@@@@|@|@"])
  fun op elf32_header_updates_eq_literal x = x
    val op elf32_header_updates_eq_literal =
    DT(((("elf_header",331),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_header",[290,291,292,324])]),["DISK_THM"]),
       [read"%216%105%232%178%215%56%215%53%214%99%214%93%214%86%214%79%214%75%215%72%215%67%215%62%215%52%215%48%215%46%277%415%349$13@@%433%342$12@@%417%342$11@@%435%341$10@@%411%341$9@@%423%341$8@@%429%341$7@@%413%341$6@@%409%342$5@@%419%342$4@@%421%342$3@@%425%342$2@@%427%342$1@@%431%342$0@@$14@@@@@@@@@@@@@@@%415%349$13@@%433%342$12@@%417%342$11@@%435%341$10@@%411%341$9@@%423%341$8@@%429%341$7@@%413%341$6@@%409%342$5@@%419%342$4@@%421%342$3@@%425%342$2@@%427%342$1@@%431%342$0@@%314@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_literal_nchotomy x = x
    val op elf32_header_literal_nchotomy =
    DT(((("elf_header",332),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_header",[290,291,292,324]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%216%105%308%178%301%56%301%53%300%99%300%93%300%86%300%79%300%75%301%72%301%67%301%62%301%52%301%48%301%46%277$14@%415%349$13@@%433%342$12@@%417%342$11@@%435%341$10@@%411%341$9@@%423%341$8@@%429%341$7@@%413%341$6@@%409%342$5@@%419%342$4@@%421%342$3@@%425%342$2@@%427%342$1@@%431%342$0@@%314@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf32_header x = x
    val op FORALL_elf32_header =
    DT(((("elf_header",333),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_header",[290,291,292,324]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%223%6%271%216%105$1$0@|@@%232%178%215%56%215%53%214%99%214%93%214%86%214%79%214%75%215%72%215%67%215%62%215%52%215%48%215%46$14%415%349$13@@%433%342$12@@%417%342$11@@%435%341$10@@%411%341$9@@%423%341$8@@%429%341$7@@%413%341$6@@%409%342$5@@%419%342$4@@%421%342$3@@%425%342$2@@%427%342$1@@%431%342$0@@%314@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf32_header x = x
    val op EXISTS_elf32_header =
    DT(((("elf_header",334),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_header",[290,291,292,324]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%223%6%271%302%105$1$0@|@@%308%178%301%56%301%53%300%99%300%93%300%86%300%79%300%75%301%72%301%67%301%62%301%52%301%48%301%46$14%415%349$13@@%433%342$12@@%417%342$11@@%435%341$10@@%411%341$9@@%423%341$8@@%429%341$7@@%413%341$6@@%409%342$5@@%419%342$4@@%421%342$3@@%425%342$2@@%427%342$1@@%431%342$0@@%314@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op elf32_header_literal_11 x = x
    val op elf32_header_literal_11 =
    DT(((("elf_header",335),
        [("combin",[12]),("elf_header",[325,330])]),["DISK_THM"]),
       [read"%232%179%215%57%215%54%214%101%214%96%214%89%214%82%214%76%215%73%215%68%215%63%215%56%215%49%215%52%232%180%215%58%215%55%214%102%214%98%214%91%214%84%214%77%215%74%215%69%215%64%215%59%215%50%215%62%271%277%415%349$27@@%433%342$26@@%417%342$25@@%435%341$24@@%411%341$23@@%423%341$22@@%429%341$21@@%413%341$20@@%409%342$19@@%419%342$18@@%421%342$17@@%425%342$16@@%427%342$15@@%431%342$14@@%314@@@@@@@@@@@@@@@%415%349$13@@%433%342$12@@%417%342$11@@%435%341$10@@%411%341$9@@%423%341$8@@%429%341$7@@%413%341$6@@%409%342$5@@%419%342$4@@%421%342$3@@%425%342$2@@%427%342$1@@%431%342$0@@%314@@@@@@@@@@@@@@@@%262%289$27@$13@@%262%275$26@$12@@%262%275$25@$11@@%262%274$24@$10@@%262%274$23@$9@@%262%274$22@$8@@%262%274$21@$7@@%262%274$20@$6@@%262%275$19@$5@@%262%275$18@$4@@%262%275$17@$3@@%262%275$16@$2@@%262%275$15@$1@@%275$14@$0@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf32_header x = x
    val op datatype_elf32_header =
    DT(((("elf_header",336),[("bool",[25,170])]),["DISK_THM"]),
       [read"%333%196%119@%120@%129@%121@%130@%117@%124@%127@%118@%116@%122@%123@%125@%126@%128@@"])
  fun op elf32_header_11 x = x
    val op elf32_header_11 =
    DT(((("elf_header",337),
        [("bool",[26,50,55,62,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%8%215%12%215%22%214%24%214%27%214%31%214%35%214%38%215%40%215%42%215%14%215%16%215%18%215%20%232%9%215%13%215%23%214%25%214%29%214%33%214%37%214%39%215%41%215%43%215%15%215%17%215%19%215%21%271%277%847$27@$26@$25@$24@$23@$22@$21@$20@$19@$18@$17@$16@$15@$14@@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%262%289$27@$13@@%262%275$26@$12@@%262%275$25@$11@@%262%274$24@$10@@%262%274$23@$9@@%262%274$22@$8@@%262%274$21@$7@@%262%274$20@$6@@%262%275$19@$5@@%262%275$18@$4@@%262%275$17@$3@@%262%275$16@$2@@%262%275$15@$1@@%275$14@$0@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_case_cong x = x
    val op elf32_header_case_cong =
    DT(((("elf_header",338),
        [("bool",[26,180]),
         ("elf_header",[290,291,292,293])]),["DISK_THM"]),
       [read"%216%2%216%4%226%153%296%262%277$2@$1@@%232%8%215%12%215%22%214%24%214%27%214%31%214%35%214%38%215%40%215%42%215%14%215%16%215%18%215%20%296%277$15@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%266$14$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%156$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@%266%406$2@$0@@%406$1@%156@@@|@|@|@"])
  fun op elf32_header_nchotomy x = x
    val op elf32_header_nchotomy =
    DT(((("elf_header",339),
        [("bool",[26,180]),("elf_header",[290,291,292])]),["DISK_THM"]),
       [read"%216%111%308%178%301%46%301%48%300%51%300%61%300%66%300%71%300%75%301%80%301%87%301%94%301%100%301%53%301%56%277$14@%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_Axiom x = x
    val op elf32_header_Axiom =
    DT(((("elf_header",340),
        [("bool",[26,180]),("elf_header",[290,291,292]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%226%153%304%162%232%8%215%12%215%22%214%24%214%27%214%31%214%35%214%38%215%40%215%42%215%14%215%16%215%18%215%20%266$14%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$15$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf32_header_induction x = x
    val op elf32_header_induction =
    DT(((("elf_header",341),
        [("bool",[26]),("elf_header",[290,291,292])]),["DISK_THM"]),
       [read"%223%6%296%232%178%215%46%215%48%214%51%214%61%214%66%214%71%214%75%215%80%215%87%215%94%215%100%215%53%215%56$14%847$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%216%105$1$0@|@@|@"])
  fun op elf64_header_accessors x = x
    val op elf64_header_accessors =
    DT(((("elf_header",362),
        [("elf_header",
         [348,349,350,351,352,353,354,355,356,357,358,359,360,
          361])]),["DISK_THM"]),
       [read"%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%289%445%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$13@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%463%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$12@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%447%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$11@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%465%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$10@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%273%441%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$9@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%273%453%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$8@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%273%459%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$7@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%274%443%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$6@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%439%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$5@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%449%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$4@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%451%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$3@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%455%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$2@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%457%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$1@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%275%461%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$0@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@@@"])
  fun op elf64_header_fn_updates x = x
    val op elf64_header_fn_updates =
    DT(((("elf_header",377),
        [("elf_header",
         [363,364,365,366,367,368,369,370,371,372,373,374,375,
          376])]),["DISK_THM"]),
       [read"%262%227%154%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%446$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$14$13@@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%464$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$14$12@@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%448$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$14$11@@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%221%150%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%466$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$14$10@@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%220%149%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%442$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$14$9@@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%220%149%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%454$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$14$8@@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%220%149%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%460$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$14$7@@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%221%150%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%444$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$14$6@@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%440$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$6@$14$5@@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%450$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$14$4@@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%452$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$14$3@@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%456$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$14$2@@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%262%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%458$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$14$1@@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%222%151%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56%278%462$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$14$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@@@@@@@@@@@@"])
  fun op elf64_header_accfupds x = x
    val op elf64_header_accfupds =
    DT(((("elf_header",378),
        [("bool",[25,26,55,180]),
         ("elf_header",[343,344,345,362,377])]),["DISK_THM"]),
       [read"%262%222%151%217%106%289%445%464$1@$0@@@%445$0@@|@|@@%262%222%151%217%106%289%445%448$1@$0@@@%445$0@@|@|@@%262%221%150%217%106%289%445%466$1@$0@@@%445$0@@|@|@@%262%220%149%217%106%289%445%442$1@$0@@@%445$0@@|@|@@%262%220%149%217%106%289%445%454$1@$0@@@%445$0@@|@|@@%262%220%149%217%106%289%445%460$1@$0@@@%445$0@@|@|@@%262%221%150%217%106%289%445%444$1@$0@@@%445$0@@|@|@@%262%222%151%217%106%289%445%440$1@$0@@@%445$0@@|@|@@%262%222%151%217%106%289%445%450$1@$0@@@%445$0@@|@|@@%262%222%151%217%106%289%445%452$1@$0@@@%445$0@@|@|@@%262%222%151%217%106%289%445%456$1@$0@@@%445$0@@|@|@@%262%222%151%217%106%289%445%458$1@$0@@@%445$0@@|@|@@%262%222%151%217%106%289%445%462$1@$0@@@%445$0@@|@|@@%262%227%154%217%106%275%463%446$1@$0@@@%463$0@@|@|@@%262%222%151%217%106%275%463%448$1@$0@@@%463$0@@|@|@@%262%221%150%217%106%275%463%466$1@$0@@@%463$0@@|@|@@%262%220%149%217%106%275%463%442$1@$0@@@%463$0@@|@|@@%262%220%149%217%106%275%463%454$1@$0@@@%463$0@@|@|@@%262%220%149%217%106%275%463%460$1@$0@@@%463$0@@|@|@@%262%221%150%217%106%275%463%444$1@$0@@@%463$0@@|@|@@%262%222%151%217%106%275%463%440$1@$0@@@%463$0@@|@|@@%262%222%151%217%106%275%463%450$1@$0@@@%463$0@@|@|@@%262%222%151%217%106%275%463%452$1@$0@@@%463$0@@|@|@@%262%222%151%217%106%275%463%456$1@$0@@@%463$0@@|@|@@%262%222%151%217%106%275%463%458$1@$0@@@%463$0@@|@|@@%262%222%151%217%106%275%463%462$1@$0@@@%463$0@@|@|@@%262%227%154%217%106%275%447%446$1@$0@@@%447$0@@|@|@@%262%222%151%217%106%275%447%464$1@$0@@@%447$0@@|@|@@%262%221%150%217%106%275%447%466$1@$0@@@%447$0@@|@|@@%262%220%149%217%106%275%447%442$1@$0@@@%447$0@@|@|@@%262%220%149%217%106%275%447%454$1@$0@@@%447$0@@|@|@@%262%220%149%217%106%275%447%460$1@$0@@@%447$0@@|@|@@%262%221%150%217%106%275%447%444$1@$0@@@%447$0@@|@|@@%262%222%151%217%106%275%447%440$1@$0@@@%447$0@@|@|@@%262%222%151%217%106%275%447%450$1@$0@@@%447$0@@|@|@@%262%222%151%217%106%275%447%452$1@$0@@@%447$0@@|@|@@%262%222%151%217%106%275%447%456$1@$0@@@%447$0@@|@|@@%262%222%151%217%106%275%447%458$1@$0@@@%447$0@@|@|@@%262%222%151%217%106%275%447%462$1@$0@@@%447$0@@|@|@@%262%227%154%217%106%274%465%446$1@$0@@@%465$0@@|@|@@%262%222%151%217%106%274%465%464$1@$0@@@%465$0@@|@|@@%262%222%151%217%106%274%465%448$1@$0@@@%465$0@@|@|@@%262%220%149%217%106%274%465%442$1@$0@@@%465$0@@|@|@@%262%220%149%217%106%274%465%454$1@$0@@@%465$0@@|@|@@%262%220%149%217%106%274%465%460$1@$0@@@%465$0@@|@|@@%262%221%150%217%106%274%465%444$1@$0@@@%465$0@@|@|@@%262%222%151%217%106%274%465%440$1@$0@@@%465$0@@|@|@@%262%222%151%217%106%274%465%450$1@$0@@@%465$0@@|@|@@%262%222%151%217%106%274%465%452$1@$0@@@%465$0@@|@|@@%262%222%151%217%106%274%465%456$1@$0@@@%465$0@@|@|@@%262%222%151%217%106%274%465%458$1@$0@@@%465$0@@|@|@@%262%222%151%217%106%274%465%462$1@$0@@@%465$0@@|@|@@%262%227%154%217%106%273%441%446$1@$0@@@%441$0@@|@|@@%262%222%151%217%106%273%441%464$1@$0@@@%441$0@@|@|@@%262%222%151%217%106%273%441%448$1@$0@@@%441$0@@|@|@@%262%221%150%217%106%273%441%466$1@$0@@@%441$0@@|@|@@%262%220%149%217%106%273%441%454$1@$0@@@%441$0@@|@|@@%262%220%149%217%106%273%441%460$1@$0@@@%441$0@@|@|@@%262%221%150%217%106%273%441%444$1@$0@@@%441$0@@|@|@@%262%222%151%217%106%273%441%440$1@$0@@@%441$0@@|@|@@%262%222%151%217%106%273%441%450$1@$0@@@%441$0@@|@|@@%262%222%151%217%106%273%441%452$1@$0@@@%441$0@@|@|@@%262%222%151%217%106%273%441%456$1@$0@@@%441$0@@|@|@@%262%222%151%217%106%273%441%458$1@$0@@@%441$0@@|@|@@%262%222%151%217%106%273%441%462$1@$0@@@%441$0@@|@|@@%262%227%154%217%106%273%453%446$1@$0@@@%453$0@@|@|@@%262%222%151%217%106%273%453%464$1@$0@@@%453$0@@|@|@@%262%222%151%217%106%273%453%448$1@$0@@@%453$0@@|@|@@%262%221%150%217%106%273%453%466$1@$0@@@%453$0@@|@|@@%262%220%149%217%106%273%453%442$1@$0@@@%453$0@@|@|@@%262%220%149%217%106%273%453%460$1@$0@@@%453$0@@|@|@@%262%221%150%217%106%273%453%444$1@$0@@@%453$0@@|@|@@%262%222%151%217%106%273%453%440$1@$0@@@%453$0@@|@|@@%262%222%151%217%106%273%453%450$1@$0@@@%453$0@@|@|@@%262%222%151%217%106%273%453%452$1@$0@@@%453$0@@|@|@@%262%222%151%217%106%273%453%456$1@$0@@@%453$0@@|@|@@%262%222%151%217%106%273%453%458$1@$0@@@%453$0@@|@|@@%262%222%151%217%106%273%453%462$1@$0@@@%453$0@@|@|@@%262%227%154%217%106%273%459%446$1@$0@@@%459$0@@|@|@@%262%222%151%217%106%273%459%464$1@$0@@@%459$0@@|@|@@%262%222%151%217%106%273%459%448$1@$0@@@%459$0@@|@|@@%262%221%150%217%106%273%459%466$1@$0@@@%459$0@@|@|@@%262%220%149%217%106%273%459%442$1@$0@@@%459$0@@|@|@@%262%220%149%217%106%273%459%454$1@$0@@@%459$0@@|@|@@%262%221%150%217%106%273%459%444$1@$0@@@%459$0@@|@|@@%262%222%151%217%106%273%459%440$1@$0@@@%459$0@@|@|@@%262%222%151%217%106%273%459%450$1@$0@@@%459$0@@|@|@@%262%222%151%217%106%273%459%452$1@$0@@@%459$0@@|@|@@%262%222%151%217%106%273%459%456$1@$0@@@%459$0@@|@|@@%262%222%151%217%106%273%459%458$1@$0@@@%459$0@@|@|@@%262%222%151%217%106%273%459%462$1@$0@@@%459$0@@|@|@@%262%227%154%217%106%274%443%446$1@$0@@@%443$0@@|@|@@%262%222%151%217%106%274%443%464$1@$0@@@%443$0@@|@|@@%262%222%151%217%106%274%443%448$1@$0@@@%443$0@@|@|@@%262%221%150%217%106%274%443%466$1@$0@@@%443$0@@|@|@@%262%220%149%217%106%274%443%442$1@$0@@@%443$0@@|@|@@%262%220%149%217%106%274%443%454$1@$0@@@%443$0@@|@|@@%262%220%149%217%106%274%443%460$1@$0@@@%443$0@@|@|@@%262%222%151%217%106%274%443%440$1@$0@@@%443$0@@|@|@@%262%222%151%217%106%274%443%450$1@$0@@@%443$0@@|@|@@%262%222%151%217%106%274%443%452$1@$0@@@%443$0@@|@|@@%262%222%151%217%106%274%443%456$1@$0@@@%443$0@@|@|@@%262%222%151%217%106%274%443%458$1@$0@@@%443$0@@|@|@@%262%222%151%217%106%274%443%462$1@$0@@@%443$0@@|@|@@%262%227%154%217%106%275%439%446$1@$0@@@%439$0@@|@|@@%262%222%151%217%106%275%439%464$1@$0@@@%439$0@@|@|@@%262%222%151%217%106%275%439%448$1@$0@@@%439$0@@|@|@@%262%221%150%217%106%275%439%466$1@$0@@@%439$0@@|@|@@%262%220%149%217%106%275%439%442$1@$0@@@%439$0@@|@|@@%262%220%149%217%106%275%439%454$1@$0@@@%439$0@@|@|@@%262%220%149%217%106%275%439%460$1@$0@@@%439$0@@|@|@@%262%221%150%217%106%275%439%444$1@$0@@@%439$0@@|@|@@%262%222%151%217%106%275%439%450$1@$0@@@%439$0@@|@|@@%262%222%151%217%106%275%439%452$1@$0@@@%439$0@@|@|@@%262%222%151%217%106%275%439%456$1@$0@@@%439$0@@|@|@@%262%222%151%217%106%275%439%458$1@$0@@@%439$0@@|@|@@%262%222%151%217%106%275%439%462$1@$0@@@%439$0@@|@|@@%262%227%154%217%106%275%449%446$1@$0@@@%449$0@@|@|@@%262%222%151%217%106%275%449%464$1@$0@@@%449$0@@|@|@@%262%222%151%217%106%275%449%448$1@$0@@@%449$0@@|@|@@%262%221%150%217%106%275%449%466$1@$0@@@%449$0@@|@|@@%262%220%149%217%106%275%449%442$1@$0@@@%449$0@@|@|@@%262%220%149%217%106%275%449%454$1@$0@@@%449$0@@|@|@@%262%220%149%217%106%275%449%460$1@$0@@@%449$0@@|@|@@%262%221%150%217%106%275%449%444$1@$0@@@%449$0@@|@|@@%262%222%151%217%106%275%449%440$1@$0@@@%449$0@@|@|@@%262%222%151%217%106%275%449%452$1@$0@@@%449$0@@|@|@@%262%222%151%217%106%275%449%456$1@$0@@@%449$0@@|@|@@%262%222%151%217%106%275%449%458$1@$0@@@%449$0@@|@|@@%262%222%151%217%106%275%449%462$1@$0@@@%449$0@@|@|@@%262%227%154%217%106%275%451%446$1@$0@@@%451$0@@|@|@@%262%222%151%217%106%275%451%464$1@$0@@@%451$0@@|@|@@%262%222%151%217%106%275%451%448$1@$0@@@%451$0@@|@|@@%262%221%150%217%106%275%451%466$1@$0@@@%451$0@@|@|@@%262%220%149%217%106%275%451%442$1@$0@@@%451$0@@|@|@@%262%220%149%217%106%275%451%454$1@$0@@@%451$0@@|@|@@%262%220%149%217%106%275%451%460$1@$0@@@%451$0@@|@|@@%262%221%150%217%106%275%451%444$1@$0@@@%451$0@@|@|@@%262%222%151%217%106%275%451%440$1@$0@@@%451$0@@|@|@@%262%222%151%217%106%275%451%450$1@$0@@@%451$0@@|@|@@%262%222%151%217%106%275%451%456$1@$0@@@%451$0@@|@|@@%262%222%151%217%106%275%451%458$1@$0@@@%451$0@@|@|@@%262%222%151%217%106%275%451%462$1@$0@@@%451$0@@|@|@@%262%227%154%217%106%275%455%446$1@$0@@@%455$0@@|@|@@%262%222%151%217%106%275%455%464$1@$0@@@%455$0@@|@|@@%262%222%151%217%106%275%455%448$1@$0@@@%455$0@@|@|@@%262%221%150%217%106%275%455%466$1@$0@@@%455$0@@|@|@@%262%220%149%217%106%275%455%442$1@$0@@@%455$0@@|@|@@%262%220%149%217%106%275%455%454$1@$0@@@%455$0@@|@|@@%262%220%149%217%106%275%455%460$1@$0@@@%455$0@@|@|@@%262%221%150%217%106%275%455%444$1@$0@@@%455$0@@|@|@@%262%222%151%217%106%275%455%440$1@$0@@@%455$0@@|@|@@%262%222%151%217%106%275%455%450$1@$0@@@%455$0@@|@|@@%262%222%151%217%106%275%455%452$1@$0@@@%455$0@@|@|@@%262%222%151%217%106%275%455%458$1@$0@@@%455$0@@|@|@@%262%222%151%217%106%275%455%462$1@$0@@@%455$0@@|@|@@%262%227%154%217%106%275%457%446$1@$0@@@%457$0@@|@|@@%262%222%151%217%106%275%457%464$1@$0@@@%457$0@@|@|@@%262%222%151%217%106%275%457%448$1@$0@@@%457$0@@|@|@@%262%221%150%217%106%275%457%466$1@$0@@@%457$0@@|@|@@%262%220%149%217%106%275%457%442$1@$0@@@%457$0@@|@|@@%262%220%149%217%106%275%457%454$1@$0@@@%457$0@@|@|@@%262%220%149%217%106%275%457%460$1@$0@@@%457$0@@|@|@@%262%221%150%217%106%275%457%444$1@$0@@@%457$0@@|@|@@%262%222%151%217%106%275%457%440$1@$0@@@%457$0@@|@|@@%262%222%151%217%106%275%457%450$1@$0@@@%457$0@@|@|@@%262%222%151%217%106%275%457%452$1@$0@@@%457$0@@|@|@@%262%222%151%217%106%275%457%456$1@$0@@@%457$0@@|@|@@%262%222%151%217%106%275%457%462$1@$0@@@%457$0@@|@|@@%262%227%154%217%106%275%461%446$1@$0@@@%461$0@@|@|@@%262%222%151%217%106%275%461%464$1@$0@@@%461$0@@|@|@@%262%222%151%217%106%275%461%448$1@$0@@@%461$0@@|@|@@%262%221%150%217%106%275%461%466$1@$0@@@%461$0@@|@|@@%262%220%149%217%106%275%461%442$1@$0@@@%461$0@@|@|@@%262%220%149%217%106%275%461%454$1@$0@@@%461$0@@|@|@@%262%220%149%217%106%275%461%460$1@$0@@@%461$0@@|@|@@%262%221%150%217%106%275%461%444$1@$0@@@%461$0@@|@|@@%262%222%151%217%106%275%461%440$1@$0@@@%461$0@@|@|@@%262%222%151%217%106%275%461%450$1@$0@@@%461$0@@|@|@@%262%222%151%217%106%275%461%452$1@$0@@@%461$0@@|@|@@%262%222%151%217%106%275%461%456$1@$0@@@%461$0@@|@|@@%262%222%151%217%106%275%461%458$1@$0@@@%461$0@@|@|@@%262%227%154%217%106%289%445%446$1@$0@@@$1%445$0@@@|@|@@%262%222%151%217%106%275%463%464$1@$0@@@$1%463$0@@@|@|@@%262%222%151%217%106%275%447%448$1@$0@@@$1%447$0@@@|@|@@%262%221%150%217%106%274%465%466$1@$0@@@$1%465$0@@@|@|@@%262%220%149%217%106%273%441%442$1@$0@@@$1%441$0@@@|@|@@%262%220%149%217%106%273%453%454$1@$0@@@$1%453$0@@@|@|@@%262%220%149%217%106%273%459%460$1@$0@@@$1%459$0@@@|@|@@%262%221%150%217%106%274%443%444$1@$0@@@$1%443$0@@@|@|@@%262%222%151%217%106%275%439%440$1@$0@@@$1%439$0@@@|@|@@%262%222%151%217%106%275%449%450$1@$0@@@$1%449$0@@@|@|@@%262%222%151%217%106%275%451%452$1@$0@@@$1%451$0@@@|@|@@%262%222%151%217%106%275%455%456$1@$0@@@$1%455$0@@@|@|@@%262%222%151%217%106%275%457%458$1@$0@@@$1%457$0@@@|@|@@%222%151%217%106%275%461%462$1@$0@@@$1%461$0@@@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_header_fupdfupds x = x
    val op elf64_header_fupdfupds =
    DT(((("elf_header",379),
        [("bool",[25,26,55,180]),("combin",[8]),
         ("elf_header",[343,344,345,377])]),["DISK_THM"]),
       [read"%262%227%167%227%154%217%106%278%446$1@%446$2@$0@@@%446%826$1@$2@@$0@@|@|@|@@%262%222%166%222%151%217%106%278%464$1@%464$2@$0@@@%464%821$1@$2@@$0@@|@|@|@@%262%222%166%222%151%217%106%278%448$1@%448$2@$0@@@%448%821$1@$2@@$0@@|@|@|@@%262%221%165%221%150%217%106%278%466$1@%466$2@$0@@@%466%820$1@$2@@$0@@|@|@|@@%262%220%164%220%149%217%106%278%442$1@%442$2@$0@@@%442%819$1@$2@@$0@@|@|@|@@%262%220%164%220%149%217%106%278%454$1@%454$2@$0@@@%454%819$1@$2@@$0@@|@|@|@@%262%220%164%220%149%217%106%278%460$1@%460$2@$0@@@%460%819$1@$2@@$0@@|@|@|@@%262%221%165%221%150%217%106%278%444$1@%444$2@$0@@@%444%820$1@$2@@$0@@|@|@|@@%262%222%166%222%151%217%106%278%440$1@%440$2@$0@@@%440%821$1@$2@@$0@@|@|@|@@%262%222%166%222%151%217%106%278%450$1@%450$2@$0@@@%450%821$1@$2@@$0@@|@|@|@@%262%222%166%222%151%217%106%278%452$1@%452$2@$0@@@%452%821$1@$2@@$0@@|@|@|@@%262%222%166%222%151%217%106%278%456$1@%456$2@$0@@@%456%821$1@$2@@$0@@|@|@|@@%262%222%166%222%151%217%106%278%458$1@%458$2@$0@@@%458%821$1@$2@@$0@@|@|@|@@%222%166%222%151%217%106%278%462$1@%462$2@$0@@@%462%821$1@$2@@$0@@|@|@|@@@@@@@@@@@@@@"])
  fun op elf64_header_fupdfupds_comp x = x
    val op elf64_header_fupdfupds_comp =
    DT(((("elf_header",380),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_header",[343,344,345,377])]),["DISK_THM"]),
       [read"%262%262%227%167%227%154%287%825%446$0@@%446$1@@@%446%826$0@$1@@@|@|@@%219%169%227%167%227%154%284%824%446$0@@%824%446$1@@$2@@@%824%446%826$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%287%825%464$0@@%464$1@@@%464%821$0@$1@@@|@|@@%219%169%222%166%222%151%284%824%464$0@@%824%464$1@@$2@@@%824%464%821$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%287%825%448$0@@%448$1@@@%448%821$0@$1@@@|@|@@%219%169%222%166%222%151%284%824%448$0@@%824%448$1@@$2@@@%824%448%821$0@$1@@@$2@@|@|@|@@@%262%262%221%165%221%150%287%825%466$0@@%466$1@@@%466%820$0@$1@@@|@|@@%219%169%221%165%221%150%284%824%466$0@@%824%466$1@@$2@@@%824%466%820$0@$1@@@$2@@|@|@|@@@%262%262%220%164%220%149%287%825%442$0@@%442$1@@@%442%819$0@$1@@@|@|@@%219%169%220%164%220%149%284%824%442$0@@%824%442$1@@$2@@@%824%442%819$0@$1@@@$2@@|@|@|@@@%262%262%220%164%220%149%287%825%454$0@@%454$1@@@%454%819$0@$1@@@|@|@@%219%169%220%164%220%149%284%824%454$0@@%824%454$1@@$2@@@%824%454%819$0@$1@@@$2@@|@|@|@@@%262%262%220%164%220%149%287%825%460$0@@%460$1@@@%460%819$0@$1@@@|@|@@%219%169%220%164%220%149%284%824%460$0@@%824%460$1@@$2@@@%824%460%819$0@$1@@@$2@@|@|@|@@@%262%262%221%165%221%150%287%825%444$0@@%444$1@@@%444%820$0@$1@@@|@|@@%219%169%221%165%221%150%284%824%444$0@@%824%444$1@@$2@@@%824%444%820$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%287%825%440$0@@%440$1@@@%440%821$0@$1@@@|@|@@%219%169%222%166%222%151%284%824%440$0@@%824%440$1@@$2@@@%824%440%821$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%287%825%450$0@@%450$1@@@%450%821$0@$1@@@|@|@@%219%169%222%166%222%151%284%824%450$0@@%824%450$1@@$2@@@%824%450%821$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%287%825%452$0@@%452$1@@@%452%821$0@$1@@@|@|@@%219%169%222%166%222%151%284%824%452$0@@%824%452$1@@$2@@@%824%452%821$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%287%825%456$0@@%456$1@@@%456%821$0@$1@@@|@|@@%219%169%222%166%222%151%284%824%456$0@@%824%456$1@@$2@@@%824%456%821$0@$1@@@$2@@|@|@|@@@%262%262%222%166%222%151%287%825%458$0@@%458$1@@@%458%821$0@$1@@@|@|@@%219%169%222%166%222%151%284%824%458$0@@%824%458$1@@$2@@@%824%458%821$0@$1@@@$2@@|@|@|@@@%262%222%166%222%151%287%825%462$0@@%462$1@@@%462%821$0@$1@@@|@|@@%219%169%222%166%222%151%284%824%462$0@@%824%462$1@@$2@@@%824%462%821$0@$1@@@$2@@|@|@|@@@@@@@@@@@@@@@"])
  fun op elf64_header_fupdcanon x = x
    val op elf64_header_fupdcanon =
    DT(((("elf_header",381),
        [("bool",[25,26,55,180]),
         ("elf_header",[343,344,345,377])]),["DISK_THM"]),
       [read"%262%227%167%222%151%217%106%278%464$1@%446$2@$0@@@%446$2@%464$1@$0@@@|@|@|@@%262%227%167%222%151%217%106%278%448$1@%446$2@$0@@@%446$2@%448$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%448$1@%464$2@$0@@@%464$2@%448$1@$0@@@|@|@|@@%262%227%167%221%150%217%106%278%466$1@%446$2@$0@@@%446$2@%466$1@$0@@@|@|@|@@%262%222%166%221%150%217%106%278%466$1@%464$2@$0@@@%464$2@%466$1@$0@@@|@|@|@@%262%222%166%221%150%217%106%278%466$1@%448$2@$0@@@%448$2@%466$1@$0@@@|@|@|@@%262%227%167%220%149%217%106%278%442$1@%446$2@$0@@@%446$2@%442$1@$0@@@|@|@|@@%262%222%166%220%149%217%106%278%442$1@%464$2@$0@@@%464$2@%442$1@$0@@@|@|@|@@%262%222%166%220%149%217%106%278%442$1@%448$2@$0@@@%448$2@%442$1@$0@@@|@|@|@@%262%221%165%220%149%217%106%278%442$1@%466$2@$0@@@%466$2@%442$1@$0@@@|@|@|@@%262%227%167%220%149%217%106%278%454$1@%446$2@$0@@@%446$2@%454$1@$0@@@|@|@|@@%262%222%166%220%149%217%106%278%454$1@%464$2@$0@@@%464$2@%454$1@$0@@@|@|@|@@%262%222%166%220%149%217%106%278%454$1@%448$2@$0@@@%448$2@%454$1@$0@@@|@|@|@@%262%221%165%220%149%217%106%278%454$1@%466$2@$0@@@%466$2@%454$1@$0@@@|@|@|@@%262%220%164%220%149%217%106%278%454$1@%442$2@$0@@@%442$2@%454$1@$0@@@|@|@|@@%262%227%167%220%149%217%106%278%460$1@%446$2@$0@@@%446$2@%460$1@$0@@@|@|@|@@%262%222%166%220%149%217%106%278%460$1@%464$2@$0@@@%464$2@%460$1@$0@@@|@|@|@@%262%222%166%220%149%217%106%278%460$1@%448$2@$0@@@%448$2@%460$1@$0@@@|@|@|@@%262%221%165%220%149%217%106%278%460$1@%466$2@$0@@@%466$2@%460$1@$0@@@|@|@|@@%262%220%164%220%149%217%106%278%460$1@%442$2@$0@@@%442$2@%460$1@$0@@@|@|@|@@%262%220%164%220%149%217%106%278%460$1@%454$2@$0@@@%454$2@%460$1@$0@@@|@|@|@@%262%227%167%221%150%217%106%278%444$1@%446$2@$0@@@%446$2@%444$1@$0@@@|@|@|@@%262%222%166%221%150%217%106%278%444$1@%464$2@$0@@@%464$2@%444$1@$0@@@|@|@|@@%262%222%166%221%150%217%106%278%444$1@%448$2@$0@@@%448$2@%444$1@$0@@@|@|@|@@%262%221%165%221%150%217%106%278%444$1@%466$2@$0@@@%466$2@%444$1@$0@@@|@|@|@@%262%220%164%221%150%217%106%278%444$1@%442$2@$0@@@%442$2@%444$1@$0@@@|@|@|@@%262%220%164%221%150%217%106%278%444$1@%454$2@$0@@@%454$2@%444$1@$0@@@|@|@|@@%262%220%164%221%150%217%106%278%444$1@%460$2@$0@@@%460$2@%444$1@$0@@@|@|@|@@%262%227%167%222%151%217%106%278%440$1@%446$2@$0@@@%446$2@%440$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%440$1@%464$2@$0@@@%464$2@%440$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%440$1@%448$2@$0@@@%448$2@%440$1@$0@@@|@|@|@@%262%221%165%222%151%217%106%278%440$1@%466$2@$0@@@%466$2@%440$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%440$1@%442$2@$0@@@%442$2@%440$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%440$1@%454$2@$0@@@%454$2@%440$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%440$1@%460$2@$0@@@%460$2@%440$1@$0@@@|@|@|@@%262%221%165%222%151%217%106%278%440$1@%444$2@$0@@@%444$2@%440$1@$0@@@|@|@|@@%262%227%167%222%151%217%106%278%450$1@%446$2@$0@@@%446$2@%450$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%450$1@%464$2@$0@@@%464$2@%450$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%450$1@%448$2@$0@@@%448$2@%450$1@$0@@@|@|@|@@%262%221%165%222%151%217%106%278%450$1@%466$2@$0@@@%466$2@%450$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%450$1@%442$2@$0@@@%442$2@%450$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%450$1@%454$2@$0@@@%454$2@%450$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%450$1@%460$2@$0@@@%460$2@%450$1@$0@@@|@|@|@@%262%221%165%222%151%217%106%278%450$1@%444$2@$0@@@%444$2@%450$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%450$1@%440$2@$0@@@%440$2@%450$1@$0@@@|@|@|@@%262%227%167%222%151%217%106%278%452$1@%446$2@$0@@@%446$2@%452$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%452$1@%464$2@$0@@@%464$2@%452$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%452$1@%448$2@$0@@@%448$2@%452$1@$0@@@|@|@|@@%262%221%165%222%151%217%106%278%452$1@%466$2@$0@@@%466$2@%452$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%452$1@%442$2@$0@@@%442$2@%452$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%452$1@%454$2@$0@@@%454$2@%452$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%452$1@%460$2@$0@@@%460$2@%452$1@$0@@@|@|@|@@%262%221%165%222%151%217%106%278%452$1@%444$2@$0@@@%444$2@%452$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%452$1@%440$2@$0@@@%440$2@%452$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%452$1@%450$2@$0@@@%450$2@%452$1@$0@@@|@|@|@@%262%227%167%222%151%217%106%278%456$1@%446$2@$0@@@%446$2@%456$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%456$1@%464$2@$0@@@%464$2@%456$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%456$1@%448$2@$0@@@%448$2@%456$1@$0@@@|@|@|@@%262%221%165%222%151%217%106%278%456$1@%466$2@$0@@@%466$2@%456$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%456$1@%442$2@$0@@@%442$2@%456$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%456$1@%454$2@$0@@@%454$2@%456$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%456$1@%460$2@$0@@@%460$2@%456$1@$0@@@|@|@|@@%262%221%165%222%151%217%106%278%456$1@%444$2@$0@@@%444$2@%456$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%456$1@%440$2@$0@@@%440$2@%456$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%456$1@%450$2@$0@@@%450$2@%456$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%456$1@%452$2@$0@@@%452$2@%456$1@$0@@@|@|@|@@%262%227%167%222%151%217%106%278%458$1@%446$2@$0@@@%446$2@%458$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%458$1@%464$2@$0@@@%464$2@%458$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%458$1@%448$2@$0@@@%448$2@%458$1@$0@@@|@|@|@@%262%221%165%222%151%217%106%278%458$1@%466$2@$0@@@%466$2@%458$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%458$1@%442$2@$0@@@%442$2@%458$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%458$1@%454$2@$0@@@%454$2@%458$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%458$1@%460$2@$0@@@%460$2@%458$1@$0@@@|@|@|@@%262%221%165%222%151%217%106%278%458$1@%444$2@$0@@@%444$2@%458$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%458$1@%440$2@$0@@@%440$2@%458$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%458$1@%450$2@$0@@@%450$2@%458$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%458$1@%452$2@$0@@@%452$2@%458$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%458$1@%456$2@$0@@@%456$2@%458$1@$0@@@|@|@|@@%262%227%167%222%151%217%106%278%462$1@%446$2@$0@@@%446$2@%462$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%462$1@%464$2@$0@@@%464$2@%462$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%462$1@%448$2@$0@@@%448$2@%462$1@$0@@@|@|@|@@%262%221%165%222%151%217%106%278%462$1@%466$2@$0@@@%466$2@%462$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%462$1@%442$2@$0@@@%442$2@%462$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%462$1@%454$2@$0@@@%454$2@%462$1@$0@@@|@|@|@@%262%220%164%222%151%217%106%278%462$1@%460$2@$0@@@%460$2@%462$1@$0@@@|@|@|@@%262%221%165%222%151%217%106%278%462$1@%444$2@$0@@@%444$2@%462$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%462$1@%440$2@$0@@@%440$2@%462$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%462$1@%450$2@$0@@@%450$2@%462$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%462$1@%452$2@$0@@@%452$2@%462$1@$0@@@|@|@|@@%262%222%166%222%151%217%106%278%462$1@%456$2@$0@@@%456$2@%462$1@$0@@@|@|@|@@%222%166%222%151%217%106%278%462$1@%458$2@$0@@@%458$2@%462$1@$0@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_header_fupdcanon_comp x = x
    val op elf64_header_fupdcanon_comp =
    DT(((("elf_header",382),
        [("bool",[14,25,26,55,57,180]),("combin",[8,9]),
         ("elf_header",[343,344,345,377])]),["DISK_THM"]),
       [read"%262%262%227%167%222%151%287%825%464$0@@%446$1@@@%825%446$1@@%464$0@@@|@|@@%219%169%227%167%222%151%284%824%464$0@@%824%446$1@@$2@@@%824%446$1@@%824%464$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%287%825%448$0@@%446$1@@@%825%446$1@@%448$0@@@|@|@@%219%169%227%167%222%151%284%824%448$0@@%824%446$1@@$2@@@%824%446$1@@%824%448$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%448$0@@%464$1@@@%825%464$1@@%448$0@@@|@|@@%219%169%222%166%222%151%284%824%448$0@@%824%464$1@@$2@@@%824%464$1@@%824%448$0@@$2@@@|@|@|@@@%262%262%227%167%221%150%287%825%466$0@@%446$1@@@%825%446$1@@%466$0@@@|@|@@%219%169%227%167%221%150%284%824%466$0@@%824%446$1@@$2@@@%824%446$1@@%824%466$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%287%825%466$0@@%464$1@@@%825%464$1@@%466$0@@@|@|@@%219%169%222%166%221%150%284%824%466$0@@%824%464$1@@$2@@@%824%464$1@@%824%466$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%287%825%466$0@@%448$1@@@%825%448$1@@%466$0@@@|@|@@%219%169%222%166%221%150%284%824%466$0@@%824%448$1@@$2@@@%824%448$1@@%824%466$0@@$2@@@|@|@|@@@%262%262%227%167%220%149%287%825%442$0@@%446$1@@@%825%446$1@@%442$0@@@|@|@@%219%169%227%167%220%149%284%824%442$0@@%824%446$1@@$2@@@%824%446$1@@%824%442$0@@$2@@@|@|@|@@@%262%262%222%166%220%149%287%825%442$0@@%464$1@@@%825%464$1@@%442$0@@@|@|@@%219%169%222%166%220%149%284%824%442$0@@%824%464$1@@$2@@@%824%464$1@@%824%442$0@@$2@@@|@|@|@@@%262%262%222%166%220%149%287%825%442$0@@%448$1@@@%825%448$1@@%442$0@@@|@|@@%219%169%222%166%220%149%284%824%442$0@@%824%448$1@@$2@@@%824%448$1@@%824%442$0@@$2@@@|@|@|@@@%262%262%221%165%220%149%287%825%442$0@@%466$1@@@%825%466$1@@%442$0@@@|@|@@%219%169%221%165%220%149%284%824%442$0@@%824%466$1@@$2@@@%824%466$1@@%824%442$0@@$2@@@|@|@|@@@%262%262%227%167%220%149%287%825%454$0@@%446$1@@@%825%446$1@@%454$0@@@|@|@@%219%169%227%167%220%149%284%824%454$0@@%824%446$1@@$2@@@%824%446$1@@%824%454$0@@$2@@@|@|@|@@@%262%262%222%166%220%149%287%825%454$0@@%464$1@@@%825%464$1@@%454$0@@@|@|@@%219%169%222%166%220%149%284%824%454$0@@%824%464$1@@$2@@@%824%464$1@@%824%454$0@@$2@@@|@|@|@@@%262%262%222%166%220%149%287%825%454$0@@%448$1@@@%825%448$1@@%454$0@@@|@|@@%219%169%222%166%220%149%284%824%454$0@@%824%448$1@@$2@@@%824%448$1@@%824%454$0@@$2@@@|@|@|@@@%262%262%221%165%220%149%287%825%454$0@@%466$1@@@%825%466$1@@%454$0@@@|@|@@%219%169%221%165%220%149%284%824%454$0@@%824%466$1@@$2@@@%824%466$1@@%824%454$0@@$2@@@|@|@|@@@%262%262%220%164%220%149%287%825%454$0@@%442$1@@@%825%442$1@@%454$0@@@|@|@@%219%169%220%164%220%149%284%824%454$0@@%824%442$1@@$2@@@%824%442$1@@%824%454$0@@$2@@@|@|@|@@@%262%262%227%167%220%149%287%825%460$0@@%446$1@@@%825%446$1@@%460$0@@@|@|@@%219%169%227%167%220%149%284%824%460$0@@%824%446$1@@$2@@@%824%446$1@@%824%460$0@@$2@@@|@|@|@@@%262%262%222%166%220%149%287%825%460$0@@%464$1@@@%825%464$1@@%460$0@@@|@|@@%219%169%222%166%220%149%284%824%460$0@@%824%464$1@@$2@@@%824%464$1@@%824%460$0@@$2@@@|@|@|@@@%262%262%222%166%220%149%287%825%460$0@@%448$1@@@%825%448$1@@%460$0@@@|@|@@%219%169%222%166%220%149%284%824%460$0@@%824%448$1@@$2@@@%824%448$1@@%824%460$0@@$2@@@|@|@|@@@%262%262%221%165%220%149%287%825%460$0@@%466$1@@@%825%466$1@@%460$0@@@|@|@@%219%169%221%165%220%149%284%824%460$0@@%824%466$1@@$2@@@%824%466$1@@%824%460$0@@$2@@@|@|@|@@@%262%262%220%164%220%149%287%825%460$0@@%442$1@@@%825%442$1@@%460$0@@@|@|@@%219%169%220%164%220%149%284%824%460$0@@%824%442$1@@$2@@@%824%442$1@@%824%460$0@@$2@@@|@|@|@@@%262%262%220%164%220%149%287%825%460$0@@%454$1@@@%825%454$1@@%460$0@@@|@|@@%219%169%220%164%220%149%284%824%460$0@@%824%454$1@@$2@@@%824%454$1@@%824%460$0@@$2@@@|@|@|@@@%262%262%227%167%221%150%287%825%444$0@@%446$1@@@%825%446$1@@%444$0@@@|@|@@%219%169%227%167%221%150%284%824%444$0@@%824%446$1@@$2@@@%824%446$1@@%824%444$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%287%825%444$0@@%464$1@@@%825%464$1@@%444$0@@@|@|@@%219%169%222%166%221%150%284%824%444$0@@%824%464$1@@$2@@@%824%464$1@@%824%444$0@@$2@@@|@|@|@@@%262%262%222%166%221%150%287%825%444$0@@%448$1@@@%825%448$1@@%444$0@@@|@|@@%219%169%222%166%221%150%284%824%444$0@@%824%448$1@@$2@@@%824%448$1@@%824%444$0@@$2@@@|@|@|@@@%262%262%221%165%221%150%287%825%444$0@@%466$1@@@%825%466$1@@%444$0@@@|@|@@%219%169%221%165%221%150%284%824%444$0@@%824%466$1@@$2@@@%824%466$1@@%824%444$0@@$2@@@|@|@|@@@%262%262%220%164%221%150%287%825%444$0@@%442$1@@@%825%442$1@@%444$0@@@|@|@@%219%169%220%164%221%150%284%824%444$0@@%824%442$1@@$2@@@%824%442$1@@%824%444$0@@$2@@@|@|@|@@@%262%262%220%164%221%150%287%825%444$0@@%454$1@@@%825%454$1@@%444$0@@@|@|@@%219%169%220%164%221%150%284%824%444$0@@%824%454$1@@$2@@@%824%454$1@@%824%444$0@@$2@@@|@|@|@@@%262%262%220%164%221%150%287%825%444$0@@%460$1@@@%825%460$1@@%444$0@@@|@|@@%219%169%220%164%221%150%284%824%444$0@@%824%460$1@@$2@@@%824%460$1@@%824%444$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%287%825%440$0@@%446$1@@@%825%446$1@@%440$0@@@|@|@@%219%169%227%167%222%151%284%824%440$0@@%824%446$1@@$2@@@%824%446$1@@%824%440$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%440$0@@%464$1@@@%825%464$1@@%440$0@@@|@|@@%219%169%222%166%222%151%284%824%440$0@@%824%464$1@@$2@@@%824%464$1@@%824%440$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%440$0@@%448$1@@@%825%448$1@@%440$0@@@|@|@@%219%169%222%166%222%151%284%824%440$0@@%824%448$1@@$2@@@%824%448$1@@%824%440$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%287%825%440$0@@%466$1@@@%825%466$1@@%440$0@@@|@|@@%219%169%221%165%222%151%284%824%440$0@@%824%466$1@@$2@@@%824%466$1@@%824%440$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%440$0@@%442$1@@@%825%442$1@@%440$0@@@|@|@@%219%169%220%164%222%151%284%824%440$0@@%824%442$1@@$2@@@%824%442$1@@%824%440$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%440$0@@%454$1@@@%825%454$1@@%440$0@@@|@|@@%219%169%220%164%222%151%284%824%440$0@@%824%454$1@@$2@@@%824%454$1@@%824%440$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%440$0@@%460$1@@@%825%460$1@@%440$0@@@|@|@@%219%169%220%164%222%151%284%824%440$0@@%824%460$1@@$2@@@%824%460$1@@%824%440$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%287%825%440$0@@%444$1@@@%825%444$1@@%440$0@@@|@|@@%219%169%221%165%222%151%284%824%440$0@@%824%444$1@@$2@@@%824%444$1@@%824%440$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%287%825%450$0@@%446$1@@@%825%446$1@@%450$0@@@|@|@@%219%169%227%167%222%151%284%824%450$0@@%824%446$1@@$2@@@%824%446$1@@%824%450$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%450$0@@%464$1@@@%825%464$1@@%450$0@@@|@|@@%219%169%222%166%222%151%284%824%450$0@@%824%464$1@@$2@@@%824%464$1@@%824%450$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%450$0@@%448$1@@@%825%448$1@@%450$0@@@|@|@@%219%169%222%166%222%151%284%824%450$0@@%824%448$1@@$2@@@%824%448$1@@%824%450$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%287%825%450$0@@%466$1@@@%825%466$1@@%450$0@@@|@|@@%219%169%221%165%222%151%284%824%450$0@@%824%466$1@@$2@@@%824%466$1@@%824%450$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%450$0@@%442$1@@@%825%442$1@@%450$0@@@|@|@@%219%169%220%164%222%151%284%824%450$0@@%824%442$1@@$2@@@%824%442$1@@%824%450$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%450$0@@%454$1@@@%825%454$1@@%450$0@@@|@|@@%219%169%220%164%222%151%284%824%450$0@@%824%454$1@@$2@@@%824%454$1@@%824%450$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%450$0@@%460$1@@@%825%460$1@@%450$0@@@|@|@@%219%169%220%164%222%151%284%824%450$0@@%824%460$1@@$2@@@%824%460$1@@%824%450$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%287%825%450$0@@%444$1@@@%825%444$1@@%450$0@@@|@|@@%219%169%221%165%222%151%284%824%450$0@@%824%444$1@@$2@@@%824%444$1@@%824%450$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%450$0@@%440$1@@@%825%440$1@@%450$0@@@|@|@@%219%169%222%166%222%151%284%824%450$0@@%824%440$1@@$2@@@%824%440$1@@%824%450$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%287%825%452$0@@%446$1@@@%825%446$1@@%452$0@@@|@|@@%219%169%227%167%222%151%284%824%452$0@@%824%446$1@@$2@@@%824%446$1@@%824%452$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%452$0@@%464$1@@@%825%464$1@@%452$0@@@|@|@@%219%169%222%166%222%151%284%824%452$0@@%824%464$1@@$2@@@%824%464$1@@%824%452$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%452$0@@%448$1@@@%825%448$1@@%452$0@@@|@|@@%219%169%222%166%222%151%284%824%452$0@@%824%448$1@@$2@@@%824%448$1@@%824%452$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%287%825%452$0@@%466$1@@@%825%466$1@@%452$0@@@|@|@@%219%169%221%165%222%151%284%824%452$0@@%824%466$1@@$2@@@%824%466$1@@%824%452$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%452$0@@%442$1@@@%825%442$1@@%452$0@@@|@|@@%219%169%220%164%222%151%284%824%452$0@@%824%442$1@@$2@@@%824%442$1@@%824%452$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%452$0@@%454$1@@@%825%454$1@@%452$0@@@|@|@@%219%169%220%164%222%151%284%824%452$0@@%824%454$1@@$2@@@%824%454$1@@%824%452$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%452$0@@%460$1@@@%825%460$1@@%452$0@@@|@|@@%219%169%220%164%222%151%284%824%452$0@@%824%460$1@@$2@@@%824%460$1@@%824%452$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%287%825%452$0@@%444$1@@@%825%444$1@@%452$0@@@|@|@@%219%169%221%165%222%151%284%824%452$0@@%824%444$1@@$2@@@%824%444$1@@%824%452$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%452$0@@%440$1@@@%825%440$1@@%452$0@@@|@|@@%219%169%222%166%222%151%284%824%452$0@@%824%440$1@@$2@@@%824%440$1@@%824%452$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%452$0@@%450$1@@@%825%450$1@@%452$0@@@|@|@@%219%169%222%166%222%151%284%824%452$0@@%824%450$1@@$2@@@%824%450$1@@%824%452$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%287%825%456$0@@%446$1@@@%825%446$1@@%456$0@@@|@|@@%219%169%227%167%222%151%284%824%456$0@@%824%446$1@@$2@@@%824%446$1@@%824%456$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%456$0@@%464$1@@@%825%464$1@@%456$0@@@|@|@@%219%169%222%166%222%151%284%824%456$0@@%824%464$1@@$2@@@%824%464$1@@%824%456$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%456$0@@%448$1@@@%825%448$1@@%456$0@@@|@|@@%219%169%222%166%222%151%284%824%456$0@@%824%448$1@@$2@@@%824%448$1@@%824%456$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%287%825%456$0@@%466$1@@@%825%466$1@@%456$0@@@|@|@@%219%169%221%165%222%151%284%824%456$0@@%824%466$1@@$2@@@%824%466$1@@%824%456$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%456$0@@%442$1@@@%825%442$1@@%456$0@@@|@|@@%219%169%220%164%222%151%284%824%456$0@@%824%442$1@@$2@@@%824%442$1@@%824%456$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%456$0@@%454$1@@@%825%454$1@@%456$0@@@|@|@@%219%169%220%164%222%151%284%824%456$0@@%824%454$1@@$2@@@%824%454$1@@%824%456$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%456$0@@%460$1@@@%825%460$1@@%456$0@@@|@|@@%219%169%220%164%222%151%284%824%456$0@@%824%460$1@@$2@@@%824%460$1@@%824%456$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%287%825%456$0@@%444$1@@@%825%444$1@@%456$0@@@|@|@@%219%169%221%165%222%151%284%824%456$0@@%824%444$1@@$2@@@%824%444$1@@%824%456$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%456$0@@%440$1@@@%825%440$1@@%456$0@@@|@|@@%219%169%222%166%222%151%284%824%456$0@@%824%440$1@@$2@@@%824%440$1@@%824%456$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%456$0@@%450$1@@@%825%450$1@@%456$0@@@|@|@@%219%169%222%166%222%151%284%824%456$0@@%824%450$1@@$2@@@%824%450$1@@%824%456$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%456$0@@%452$1@@@%825%452$1@@%456$0@@@|@|@@%219%169%222%166%222%151%284%824%456$0@@%824%452$1@@$2@@@%824%452$1@@%824%456$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%287%825%458$0@@%446$1@@@%825%446$1@@%458$0@@@|@|@@%219%169%227%167%222%151%284%824%458$0@@%824%446$1@@$2@@@%824%446$1@@%824%458$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%458$0@@%464$1@@@%825%464$1@@%458$0@@@|@|@@%219%169%222%166%222%151%284%824%458$0@@%824%464$1@@$2@@@%824%464$1@@%824%458$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%458$0@@%448$1@@@%825%448$1@@%458$0@@@|@|@@%219%169%222%166%222%151%284%824%458$0@@%824%448$1@@$2@@@%824%448$1@@%824%458$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%287%825%458$0@@%466$1@@@%825%466$1@@%458$0@@@|@|@@%219%169%221%165%222%151%284%824%458$0@@%824%466$1@@$2@@@%824%466$1@@%824%458$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%458$0@@%442$1@@@%825%442$1@@%458$0@@@|@|@@%219%169%220%164%222%151%284%824%458$0@@%824%442$1@@$2@@@%824%442$1@@%824%458$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%458$0@@%454$1@@@%825%454$1@@%458$0@@@|@|@@%219%169%220%164%222%151%284%824%458$0@@%824%454$1@@$2@@@%824%454$1@@%824%458$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%458$0@@%460$1@@@%825%460$1@@%458$0@@@|@|@@%219%169%220%164%222%151%284%824%458$0@@%824%460$1@@$2@@@%824%460$1@@%824%458$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%287%825%458$0@@%444$1@@@%825%444$1@@%458$0@@@|@|@@%219%169%221%165%222%151%284%824%458$0@@%824%444$1@@$2@@@%824%444$1@@%824%458$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%458$0@@%440$1@@@%825%440$1@@%458$0@@@|@|@@%219%169%222%166%222%151%284%824%458$0@@%824%440$1@@$2@@@%824%440$1@@%824%458$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%458$0@@%450$1@@@%825%450$1@@%458$0@@@|@|@@%219%169%222%166%222%151%284%824%458$0@@%824%450$1@@$2@@@%824%450$1@@%824%458$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%458$0@@%452$1@@@%825%452$1@@%458$0@@@|@|@@%219%169%222%166%222%151%284%824%458$0@@%824%452$1@@$2@@@%824%452$1@@%824%458$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%458$0@@%456$1@@@%825%456$1@@%458$0@@@|@|@@%219%169%222%166%222%151%284%824%458$0@@%824%456$1@@$2@@@%824%456$1@@%824%458$0@@$2@@@|@|@|@@@%262%262%227%167%222%151%287%825%462$0@@%446$1@@@%825%446$1@@%462$0@@@|@|@@%219%169%227%167%222%151%284%824%462$0@@%824%446$1@@$2@@@%824%446$1@@%824%462$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%462$0@@%464$1@@@%825%464$1@@%462$0@@@|@|@@%219%169%222%166%222%151%284%824%462$0@@%824%464$1@@$2@@@%824%464$1@@%824%462$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%462$0@@%448$1@@@%825%448$1@@%462$0@@@|@|@@%219%169%222%166%222%151%284%824%462$0@@%824%448$1@@$2@@@%824%448$1@@%824%462$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%287%825%462$0@@%466$1@@@%825%466$1@@%462$0@@@|@|@@%219%169%221%165%222%151%284%824%462$0@@%824%466$1@@$2@@@%824%466$1@@%824%462$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%462$0@@%442$1@@@%825%442$1@@%462$0@@@|@|@@%219%169%220%164%222%151%284%824%462$0@@%824%442$1@@$2@@@%824%442$1@@%824%462$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%462$0@@%454$1@@@%825%454$1@@%462$0@@@|@|@@%219%169%220%164%222%151%284%824%462$0@@%824%454$1@@$2@@@%824%454$1@@%824%462$0@@$2@@@|@|@|@@@%262%262%220%164%222%151%287%825%462$0@@%460$1@@@%825%460$1@@%462$0@@@|@|@@%219%169%220%164%222%151%284%824%462$0@@%824%460$1@@$2@@@%824%460$1@@%824%462$0@@$2@@@|@|@|@@@%262%262%221%165%222%151%287%825%462$0@@%444$1@@@%825%444$1@@%462$0@@@|@|@@%219%169%221%165%222%151%284%824%462$0@@%824%444$1@@$2@@@%824%444$1@@%824%462$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%462$0@@%440$1@@@%825%440$1@@%462$0@@@|@|@@%219%169%222%166%222%151%284%824%462$0@@%824%440$1@@$2@@@%824%440$1@@%824%462$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%462$0@@%450$1@@@%825%450$1@@%462$0@@@|@|@@%219%169%222%166%222%151%284%824%462$0@@%824%450$1@@$2@@@%824%450$1@@%824%462$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%462$0@@%452$1@@@%825%452$1@@%462$0@@@|@|@@%219%169%222%166%222%151%284%824%462$0@@%824%452$1@@$2@@@%824%452$1@@%824%462$0@@$2@@@|@|@|@@@%262%262%222%166%222%151%287%825%462$0@@%456$1@@@%825%456$1@@%462$0@@@|@|@@%219%169%222%166%222%151%284%824%462$0@@%824%456$1@@$2@@@%824%456$1@@%824%462$0@@$2@@@|@|@|@@@%262%222%166%222%151%287%825%462$0@@%458$1@@@%825%458$1@@%462$0@@@|@|@@%219%169%222%166%222%151%284%824%462$0@@%824%458$1@@$2@@@%824%458$1@@%824%462$0@@$2@@@|@|@|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"])
  fun op elf64_header_component_equality x = x
    val op elf64_header_component_equality =
    DT(((("elf_header",383),
        [("bool",[25,26,50,55,62,180]),("elf_header",[343,344,345,362]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%217%108%217%110%271%278$1@$0@@%262%289%445$1@@%445$0@@@%262%275%463$1@@%463$0@@@%262%275%447$1@@%447$0@@@%262%274%465$1@@%465$0@@@%262%273%441$1@@%441$0@@@%262%273%453$1@@%453$0@@@%262%273%459$1@@%459$0@@@%262%274%443$1@@%443$0@@@%262%275%439$1@@%439$0@@@%262%275%449$1@@%449$0@@@%262%275%451$1@@%451$0@@@%262%275%455$1@@%455$0@@@%262%275%457$1@@%457$0@@@%275%461$1@@%461$0@@@@@@@@@@@@@@@@|@|@"])
  fun op elf64_header_updates_eq_literal x = x
    val op elf64_header_updates_eq_literal =
    DT(((("elf_header",384),
        [("bool",[25,26,55,180]),("combin",[12]),
         ("elf_header",[343,344,345,377])]),["DISK_THM"]),
       [read"%217%106%232%178%215%56%215%53%214%99%213%92%213%85%213%78%214%75%215%72%215%67%215%62%215%52%215%48%215%46%278%446%349$13@@%464%342$12@@%448%342$11@@%466%341$10@@%442%340$9@@%454%340$8@@%460%340$7@@%444%341$6@@%440%342$5@@%450%342$4@@%452%342$3@@%456%342$2@@%458%342$1@@%462%342$0@@$14@@@@@@@@@@@@@@@%446%349$13@@%464%342$12@@%448%342$11@@%466%341$10@@%442%340$9@@%454%340$8@@%460%340$7@@%444%341$6@@%440%342$5@@%450%342$4@@%452%342$3@@%456%342$2@@%458%342$1@@%462%342$0@@%315@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_literal_nchotomy x = x
    val op elf64_header_literal_nchotomy =
    DT(((("elf_header",385),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_header",[343,344,345,377]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%217%106%308%178%301%56%301%53%300%99%299%92%299%85%299%78%300%75%301%72%301%67%301%62%301%52%301%48%301%46%278$14@%446%349$13@@%464%342$12@@%448%342$11@@%466%341$10@@%442%340$9@@%454%340$8@@%460%340$7@@%444%341$6@@%440%342$5@@%450%342$4@@%452%342$3@@%456%342$2@@%458%342$1@@%462%342$0@@%315@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op FORALL_elf64_header x = x
    val op FORALL_elf64_header =
    DT(((("elf_header",386),
        [("bool",[25,26,35,50,55,57,62,142,180]),("combin",[12]),
         ("elf_header",[343,344,345,377]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%224%7%271%217%106$1$0@|@@%232%178%215%56%215%53%214%99%213%92%213%85%213%78%214%75%215%72%215%67%215%62%215%52%215%48%215%46$14%446%349$13@@%464%342$12@@%448%342$11@@%466%341$10@@%442%340$9@@%454%340$8@@%460%340$7@@%444%341$6@@%440%342$5@@%450%342$4@@%452%342$3@@%456%342$2@@%458%342$1@@%462%342$0@@%315@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op EXISTS_elf64_header x = x
    val op EXISTS_elf64_header =
    DT(((("elf_header",387),
        [("bool",[25,26,50,55,57,62,142,180]),("combin",[12]),
         ("elf_header",[343,344,345,377]),("ind_type",[33,34]),
         ("pair",[8,9])]),["DISK_THM"]),
       [read"%224%7%271%303%106$1$0@|@@%308%178%301%56%301%53%300%99%299%92%299%85%299%78%300%75%301%72%301%67%301%62%301%52%301%48%301%46$14%446%349$13@@%464%342$12@@%448%342$11@@%466%341$10@@%442%340$9@@%454%340$8@@%460%340$7@@%444%341$6@@%440%342$5@@%450%342$4@@%452%342$3@@%456%342$2@@%458%342$1@@%462%342$0@@%315@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@|@"])
  fun op elf64_header_literal_11 x = x
    val op elf64_header_literal_11 =
    DT(((("elf_header",388),
        [("combin",[12]),("elf_header",[378,383])]),["DISK_THM"]),
       [read"%232%179%215%57%215%54%214%101%213%95%213%88%213%81%214%76%215%73%215%68%215%63%215%56%215%49%215%52%232%180%215%58%215%55%214%102%213%97%213%90%213%83%214%77%215%74%215%69%215%64%215%59%215%50%215%62%271%278%446%349$27@@%464%342$26@@%448%342$25@@%466%341$24@@%442%340$23@@%454%340$22@@%460%340$21@@%444%341$20@@%440%342$19@@%450%342$18@@%452%342$17@@%456%342$16@@%458%342$15@@%462%342$14@@%315@@@@@@@@@@@@@@@%446%349$13@@%464%342$12@@%448%342$11@@%466%341$10@@%442%340$9@@%454%340$8@@%460%340$7@@%444%341$6@@%440%342$5@@%450%342$4@@%452%342$3@@%456%342$2@@%458%342$1@@%462%342$0@@%315@@@@@@@@@@@@@@@@%262%289$27@$13@@%262%275$26@$12@@%262%275$25@$11@@%262%274$24@$10@@%262%273$23@$9@@%262%273$22@$8@@%262%273$21@$7@@%262%274$20@$6@@%262%275$19@$5@@%262%275$18@$4@@%262%275$17@$3@@%262%275$16@$2@@%262%275$15@$1@@%275$14@$0@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op datatype_elf64_header x = x
    val op datatype_elf64_header =
    DT(((("elf_header",389),[("bool",[25,170])]),["DISK_THM"]),
       [read"%333%195%134@%135@%144@%136@%145@%132@%139@%142@%133@%131@%137@%138@%140@%141@%143@@"])
  fun op elf64_header_11 x = x
    val op elf64_header_11 =
    DT(((("elf_header",390),
        [("bool",[26,50,55,62,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%232%8%215%12%215%22%214%24%213%26%213%30%213%34%214%38%215%40%215%42%215%14%215%16%215%18%215%20%232%9%215%13%215%23%214%25%213%28%213%32%213%36%214%39%215%41%215%43%215%15%215%17%215%19%215%21%271%278%848$27@$26@$25@$24@$23@$22@$21@$20@$19@$18@$17@$16@$15@$14@@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%262%289$27@$13@@%262%275$26@$12@@%262%275$25@$11@@%262%274$24@$10@@%262%273$23@$9@@%262%273$22@$8@@%262%273$21@$7@@%262%274$20@$6@@%262%275$19@$5@@%262%275$18@$4@@%262%275$17@$3@@%262%275$16@$2@@%262%275$15@$1@@%275$14@$0@@@@@@@@@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_case_cong x = x
    val op elf64_header_case_cong =
    DT(((("elf_header",391),
        [("bool",[26,180]),
         ("elf_header",[343,344,345,346])]),["DISK_THM"]),
       [read"%217%3%217%5%225%152%296%262%278$2@$1@@%232%8%215%12%215%22%214%24%213%26%213%30%213%34%214%38%215%40%215%42%215%14%215%16%215%18%215%20%296%278$15@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@%266$14$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@%155$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@@%266%437$2@$0@@%437$1@%155@@@|@|@|@"])
  fun op elf64_header_nchotomy x = x
    val op elf64_header_nchotomy =
    DT(((("elf_header",392),
        [("bool",[26,180]),("elf_header",[343,344,345])]),["DISK_THM"]),
       [read"%217%112%308%178%301%46%301%48%300%51%299%60%299%65%299%70%300%75%301%80%301%87%301%94%301%100%301%53%301%56%278$14@%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_Axiom x = x
    val op elf64_header_Axiom =
    DT(((("elf_header",393),
        [("bool",[26,180]),("elf_header",[343,344,345]),
         ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
       [read"%225%152%306%163%232%8%215%12%215%22%214%24%213%26%213%30%213%34%214%38%215%40%215%42%215%14%215%16%215%18%215%20%266$14%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@@$15$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op elf64_header_induction x = x
    val op elf64_header_induction =
    DT(((("elf_header",394),
        [("bool",[26]),("elf_header",[343,344,345])]),["DISK_THM"]),
       [read"%224%7%296%232%178%215%46%215%48%214%51%213%60%213%65%213%70%214%75%215%80%215%87%215%94%215%100%215%53%215%56$14%848$13@$12@$11@$10@$9@$8@$7@$6@$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@@%217%106$1$0@|@@|@"])
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
   ("string_of_elf_file_type_def",string_of_elf_file_type_def,DB.Def),
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
   ("string_of_elf_machine_architecture_def",
    string_of_elf_machine_architecture_def,
    DB.Def), ("elf_ev_none_def",elf_ev_none_def,DB.Def),
   ("elf_ev_current_def",elf_ev_current_def,DB.Def),
   ("string_of_elf_version_number_def",
    string_of_elf_version_number_def,
    DB.Def),
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
   ("string_of_elf_file_class_def",string_of_elf_file_class_def,DB.Def),
   ("elf_data_none_def",elf_data_none_def,DB.Def),
   ("elf_data_2lsb_def",elf_data_2lsb_def,DB.Def),
   ("elf_data_2msb_def",elf_data_2msb_def,DB.Def),
   ("string_of_elf_data_encoding_def",
    string_of_elf_data_encoding_def,
    DB.Def), ("elf_osabi_none_def",elf_osabi_none_def,DB.Def),
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
    DB.Def),
   ("string_of_elf_osabi_version_def",
    string_of_elf_osabi_version_def,
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
    DB.Def),
   ("string_of_elf32_header_def",string_of_elf32_header_def,DB.Def),
   ("string_of_elf64_header_def",string_of_elf64_header_def,DB.Def),
   ("string_of_elf32_header_default_def",
    string_of_elf32_header_default_def,
    DB.Def),
   ("string_of_elf64_header_default_def",
    string_of_elf64_header_default_def,
    DB.Def),
   ("instance_Show_Show_Elf_header_elf32_header_dict_def",
    instance_Show_Show_Elf_header_elf32_header_dict_def,
    DB.Def),
   ("instance_Show_Show_Elf_header_elf64_header_dict_def",
    instance_Show_Show_Elf_header_elf64_header_dict_def,
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

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("elf_types_native_uintTheory.elf_types_native_uint_grammars",
                          elf_types_native_uintTheory.elf_types_native_uint_grammars),
                         ("default_printingTheory.default_printing_grammars",
                          default_printingTheory.default_printing_grammars),
                         ("lem_setTheory.lem_set_grammars",
                          lem_setTheory.lem_set_grammars)]
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
       ("string_of_elf_file_type", (Term.prim_mk_const { Name = "string_of_elf_file_type", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf_file_type", (Term.prim_mk_const { Name = "string_of_elf_file_type", Thy = "elf_header"}))
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
       ("string_of_elf_machine_architecture", (Term.prim_mk_const { Name = "string_of_elf_machine_architecture", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf_machine_architecture", (Term.prim_mk_const { Name = "string_of_elf_machine_architecture", Thy = "elf_header"}))
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
       ("string_of_elf_version_number", (Term.prim_mk_const { Name = "string_of_elf_version_number", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf_version_number", (Term.prim_mk_const { Name = "string_of_elf_version_number", Thy = "elf_header"}))
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
       ("string_of_elf_file_class", (Term.prim_mk_const { Name = "string_of_elf_file_class", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf_file_class", (Term.prim_mk_const { Name = "string_of_elf_file_class", Thy = "elf_header"}))
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
       ("string_of_elf_data_encoding", (Term.prim_mk_const { Name = "string_of_elf_data_encoding", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf_data_encoding", (Term.prim_mk_const { Name = "string_of_elf_data_encoding", Thy = "elf_header"}))
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
       ("string_of_elf_osabi_version", (Term.prim_mk_const { Name = "string_of_elf_osabi_version", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf_osabi_version", (Term.prim_mk_const { Name = "string_of_elf_osabi_version", Thy = "elf_header"}))
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
       ("string_of_elf32_header", (Term.prim_mk_const { Name = "string_of_elf32_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_header", (Term.prim_mk_const { Name = "string_of_elf32_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_header", (Term.prim_mk_const { Name = "string_of_elf64_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_header", (Term.prim_mk_const { Name = "string_of_elf64_header", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_header_default", (Term.prim_mk_const { Name = "string_of_elf32_header_default", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf32_header_default", (Term.prim_mk_const { Name = "string_of_elf32_header_default", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_header_default", (Term.prim_mk_const { Name = "string_of_elf64_header_default", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_elf64_header_default", (Term.prim_mk_const { Name = "string_of_elf64_header_default", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_header_elf32_header_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_header_elf32_header_dict", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_header_elf32_header_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_header_elf32_header_dict", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_header_elf64_header_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_header_elf64_header_dict", Thy = "elf_header"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("instance_Show_Show_Elf_header_elf64_header_dict", (Term.prim_mk_const { Name = "instance_Show_Show_Elf_header_elf64_header_dict", Thy = "elf_header"}))
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
        "elf_header.shn_undef_def elf_header.string_of_elf_machine_architecture_def elf_header.get_elf64_header_section_table_size_def elf_header.get_elf32_header_section_table_size_def elf_header.is_elf64_header_section_table_present_def elf_header.is_elf32_header_section_table_present_def elf_header.get_elf64_header_program_table_size_def elf_header.get_elf32_header_program_table_size_def elf_header.is_elf32_header_valid_def elf_header.is_elf64_header_version_correct_def elf_header.is_elf32_header_version_correct_def elf_header.is_elf64_header_class_correct_def elf_header.is_elf32_header_class_correct_def elf_header.read_elf64_header_def elf_header.read_elf32_header_def elf_header.is_magic_number_correct_def elf_header.is_elf32_header_padding_correct_def elf_header.bytes_of_elf64_header_def elf_header.bytes_of_elf32_header_def elf_header.read_elf_ident_def elf_header.instance_Show_Show_Elf_header_elf64_header_dict_def elf_header.instance_Show_Show_Elf_header_elf32_header_dict_def elf_header.string_of_elf64_header_default_def elf_header.string_of_elf32_header_default_def elf_header.string_of_elf64_header_def elf_header.string_of_elf32_header_def elf_header.is_elf64_header_string_table_index_in_link_def elf_header.is_elf32_header_string_table_index_in_link_def elf_header.is_elf64_header_section_size_in_section_header_table_def elf_header.is_elf32_header_section_size_in_section_header_table_def elf_header.has_elf64_header_string_table_def elf_header.has_elf32_header_string_table_def elf_header.has_elf64_header_associated_entry_point_def elf_header.has_elf32_header_associated_entry_point_def elf_header.get_elf64_header_endianness_def elf_header.get_elf32_header_endianness_def elf_header.deduce_endianness_def elf_header.get_elf64_abi_version_def elf_header.get_elf32_abi_version_def elf_header.is_valid_elf64_version_numer_def elf_header.is_valid_elf32_version_numer_def elf_header.get_elf64_version_number_def elf_header.get_elf32_version_number_def elf_header.get_elf64_file_class_def elf_header.get_elf32_file_class_def elf_header.get_elf64_data_encoding_def elf_header.get_elf32_data_encoding_def elf_header.get_elf64_osabi_def elf_header.get_elf32_osabi_def elf_header.get_elf64_machine_architecture_def elf_header.get_elf32_machine_architecture_def elf_header.is_elf64_linkable_file_def elf_header.is_elf32_linkable_file_def elf_header.is_elf64_relocatable_file_def elf_header.is_elf32_relocatable_file_def elf_header.is_elf64_shared_object_file_def elf_header.is_elf32_shared_object_file_def elf_header.is_elf64_executable_file_def elf_header.is_elf32_executable_file_def elf_header.instance_Basic_classes_Ord_Elf_header_elf64_header_dict_def elf_header.elf64_header_compare_def elf_header.instance_Basic_classes_Ord_Elf_header_elf32_header_dict_def elf_header.elf32_header_compare_def elf_header.is_valid_elf64_header_def elf_header.is_valid_elf32_header_def elf_header.ei_nident_def elf_header.string_of_elf_osabi_version_def elf_header.is_valid_architecture_defined_osabi_version_def elf_header.elf_osabi_openvos_def elf_header.elf_osabi_cloudabi_def elf_header.elf_osabi_fenixos_def elf_header.elf_osabi_aros_def elf_header.elf_osabi_nsk_def elf_header.elf_osabi_openvms_def elf_header.elf_osabi_openbsd_def elf_header.elf_osabi_modesto_def elf_header.elf_osabi_tru64_def elf_header.elf_osabi_freebsd_def elf_header.elf_osabi_irix_def elf_header.elf_osabi_aix_def elf_header.elf_osabi_solaris_def elf_header.elf_osabi_linux_def elf_header.elf_osabi_gnu_def elf_header.elf_osabi_netbsd_def elf_header.elf_osabi_hpux_def elf_header.elf_osabi_none_def elf_header.string_of_elf_data_encoding_def elf_header.elf_data_2msb_def elf_header.elf_data_2lsb_def elf_header.elf_data_none_def elf_header.string_of_elf_file_class_def elf_header.elf_class_64_def elf_header.elf_class_32_def elf_header.elf_class_none_def elf_header.elf_mn_mag3_def elf_header.elf_mn_mag2_def elf_header.elf_mn_mag1_def elf_header.elf_mn_mag0_def elf_header.elf_ii_nident_def elf_header.elf_ii_pad_def elf_header.elf_ii_abiversion_def elf_header.elf_ii_osabi_def elf_header.elf_ii_version_def elf_header.elf_ii_data_def elf_header.elf_ii_class_def elf_header.elf_ii_mag3_def elf_header.elf_ii_mag2_def elf_header.elf_ii_mag1_def elf_header.elf_ii_mag0_def elf_header.is_valid_extended_version_number_def elf_header.string_of_elf_version_number_def elf_header.elf_ev_current_def elf_header.elf_ev_none_def elf_header.shn_xindex_def elf_header.elf_ma_reserved159_def elf_header.elf_ma_reserved158_def elf_header.elf_ma_reserved157_def elf_header.elf_ma_reserved156_def elf_header.elf_ma_reserved155_def elf_header.elf_ma_reserved154_def elf_header.elf_ma_reserved153_def elf_header.elf_ma_reserved152_def elf_header.elf_ma_reserved151_def elf_header.elf_ma_reserved150_def elf_header.elf_ma_reserved149_def elf_header.elf_ma_reserved148_def elf_header.elf_ma_reserved147_def elf_header.elf_ma_reserved146_def elf_header.elf_ma_reserved145_def elf_header.elf_ma_reserved144_def elf_header.elf_ma_reserved143_def elf_header.elf_ma_reserved130_def elf_header.elf_ma_reserved129_def elf_header.elf_ma_reserved128_def elf_header.elf_ma_reserved127_def elf_header.elf_ma_reserved126_def elf_header.elf_ma_reserved125_def elf_header.elf_ma_reserved124_def elf_header.elf_ma_reserved123_def elf_header.elf_ma_reserved122_def elf_header.elf_ma_reserved121_def elf_header.elf_ma_reserved35_def elf_header.elf_ma_reserved34_def elf_header.elf_ma_reserved33_def elf_header.elf_ma_reserved32_def elf_header.elf_ma_reserved31_def elf_header.elf_ma_reserved30_def elf_header.elf_ma_reserved29_def elf_header.elf_ma_reserved28_def elf_header.elf_ma_reserved27_def elf_header.elf_ma_reserved26_def elf_header.elf_ma_reserved25_def elf_header.elf_ma_reserved24_def elf_header.elf_ma_reserved16_def elf_header.elf_ma_reserved14_def elf_header.elf_ma_reserved13_def elf_header.elf_ma_reserved12_def elf_header.elf_ma_reserved11_def elf_header.elf_ma_reserved6_def elf_header.elf_ma_arm184_def elf_header.elf_ma_intel182_def elf_header.elf_ma_intel205_def elf_header.elf_ma_intel206_def elf_header.elf_ma_intel207_def elf_header.elf_ma_intel208_def elf_header.elf_ma_intel209_def elf_header.elf_ma_firepath_def elf_header.elf_ma_javelin_def elf_header.elf_ma_cris_def elf_header.elf_ma_vax_def elf_header.elf_ma_st19_def elf_header.elf_ma_svx_def elf_header.elf_ma_68hc05_def elf_header.elf_ma_68hc08_def elf_header.elf_ma_68hc11_def elf_header.elf_ma_68hc16_def elf_header.elf_ma_st7_def elf_header.elf_ma_st9plus_def elf_header.elf_ma_fx66_def elf_header.elf_ma_pdp11_def elf_header.elf_ma_pdp10_def elf_header.elf_ma_pdsp_def elf_header.elf_ma_x86_64_def elf_header.elf_ma_tinyj_def elf_header.elf_ma_st100_def elf_header.elf_ma_me16_def elf_header.elf_ma_starcore_def elf_header.elf_ma_ndr1_def elf_header.elf_ma_ncpu_def elf_header.elf_ma_pcp_def elf_header.elf_ma_mma_def elf_header.elf_ma_68hc12_def elf_header.elf_ma_coldfire_def elf_header.elf_ma_mips_x_def elf_header.elf_ma_ia_64_def elf_header.elf_ma_h8_500_def elf_header.elf_ma_h8s_def elf_header.elf_ma_h8_300h_def elf_header.elf_ma_h8_300_def elf_header.elf_ma_arc_def elf_header.elf_ma_tricore_def elf_header.elf_ma_sparcv9_def elf_header.elf_ma_sh_def elf_header.elf_ma_alpha_def elf_header.elf_ma_arm_def elf_header.elf_ma_rce_def elf_header.elf_ma_rh32_def elf_header.elf_ma_fr20_def elf_header.elf_ma_v800_def elf_header.elf_ma_spu_def elf_header.elf_ma_s390_def elf_header.elf_ma_ppc64_def elf_header.elf_ma_ppc_def elf_header.elf_ma_960_def elf_header.elf_ma_sparc32plus_def elf_header.elf_ma_vpp500_def elf_header.elf_ma_parisc_def elf_header.elf_ma_mips_rs3_le_def elf_header.elf_ma_s370_def elf_header.elf_ma_mips_def elf_header.elf_ma_860_def elf_header.elf_ma_88k_def elf_header.elf_ma_68k_def elf_header.elf_ma_386_def elf_header.elf_ma_sparc_def elf_header.elf_ma_m32_def elf_header.elf_ma_none_def elf_header.elf_ma_m32c_def elf_header.elf_ma_ce_def elf_header.elf_ma_dspic30f_def elf_header.elf_ma_m16c_def elf_header.elf_ma_c166_def elf_header.elf_ma_xgate_def elf_header.elf_ma_crx_def elf_header.elf_ma_altera_nios2_def elf_header.elf_ma_dxp_def elf_header.elf_ma_excess_def elf_header.elf_ma_unicore_def elf_header.elf_ma_arca_def elf_header.elf_ma_sep_def elf_header.elf_ma_se_c33_def elf_header.elf_ma_blackfin_def elf_header.elf_ma_msp430_def elf_header.elf_ma_f2mc16_def elf_header.elf_ma_cr_def elf_header.elf_ma_max_def elf_header.elf_ma_ip2k_def elf_header.elf_ma_st200_def elf_header.elf_ma_snp1k_def elf_header.elf_ma_tpc_def elf_header.elf_ma_ns32k_def elf_header.elf_ma_tmm_gpp_def elf_header.elf_ma_videocore_def elf_header.elf_ma_xtensa_def elf_header.elf_ma_arc_compact_def elf_header.elf_ma_openrisc_def elf_header.elf_ma_pj_def elf_header.elf_ma_mn10200_def elf_header.elf_ma_mn10300_def elf_header.elf_ma_m32r_def elf_header.elf_ma_v850_def elf_header.elf_ma_d30v_def elf_header.elf_ma_d10v_def elf_header.elf_ma_fr30_def elf_header.elf_ma_avr_def elf_header.elf_ma_prism_def elf_header.elf_ma_huany_def elf_header.elf_ma_mmix_def elf_header.elf_ma_zsp_def elf_header.elf_ma_mmdsp_plus_def elf_header.elf_ma_c5500_def elf_header.elf_ma_c2000_def elf_header.elf_ma_c6000_def elf_header.elf_ma_c17_def elf_header.elf_ma_latticemico32_def elf_header.elf_ma_videocore3_def elf_header.elf_ma_dsp24_def elf_header.elf_ma_ccore7_def elf_header.elf_ma_ecog2_def elf_header.elf_ma_sharc_def elf_header.elf_ma_rs08_def elf_header.elf_ma_tsk3000_def elf_header.elf_ma_etpu_def elf_header.elf_ma_cr16_def elf_header.elf_ma_ecog16_def elf_header.elf_ma_mcst_elbrus_def elf_header.elf_ma_metag_def elf_header.elf_ma_rx_def elf_header.elf_ma_craynv2_def elf_header.elf_ma_manik_def elf_header.elf_ma_ximo16_def elf_header.elf_ma_maxq30_def elf_header.elf_ma_ecog1x_def elf_header.elf_ma_nds32_def elf_header.elf_ma_stxp7x_def elf_header.elf_ma_8051_def elf_header.elf_ma_qdsp6_def elf_header.elf_ma_trimedia_def elf_header.elf_ma_r32c_def elf_header.elf_ma_cypress_def elf_header.elf_ma_tilegx_def elf_header.elf_ma_cuda_def elf_header.elf_ma_microblaze_def elf_header.elf_ma_tilepro_def elf_header.elf_ma_tile64_def elf_header.elf_ma_stm8_def elf_header.elf_ma_avr32_def elf_header.elf_ma_aarch64_def elf_header.elf_ma_k10m_def elf_header.elf_ma_l10m_def elf_header.elf_ma_sle9x_def elf_header.elf_ma_cloudshield_def elf_header.elf_ma_corea_1st_def elf_header.elf_ma_corea_2nd_def elf_header.elf_ma_arc_compact2_def elf_header.elf_ma_open8_def elf_header.elf_ma_rl78_def elf_header.elf_ma_videocore5_def elf_header.elf_ma_78kor_def elf_header.elf_ma_5600ex_def elf_header.elf_ma_ba1_def elf_header.elf_ma_ba2_def elf_header.elf_ma_xcore_def elf_header.elf_ma_mchp_pic_def elf_header.elf_ma_km32_def elf_header.elf_ma_kmx32_def elf_header.elf_ma_kmx16_def elf_header.elf_ma_kmx8_def elf_header.elf_ma_kvarc_def elf_header.elf_ma_cdp_def elf_header.elf_ma_coge_def elf_header.elf_ma_cool_def elf_header.elf_ma_norc_def elf_header.elf_ma_kalimba_def elf_header.elf_ma_z80_def elf_header.elf_ma_visium_def elf_header.elf_ma_ft32_def elf_header.elf_ma_moxie_def elf_header.elf_ma_amdgpu_def elf_header.elf_ma_riscv_def elf_header.is_processor_specific_object_file_type_value_def elf_header.is_operating_system_specific_object_file_type_value_def elf_header.string_of_elf_file_type_def elf_header.elf_ft_hi_proc_def elf_header.elf_ft_lo_proc_def elf_header.elf_ft_hi_os_def elf_header.elf_ft_lo_os_def elf_header.elf_ft_core_def elf_header.elf_ft_dyn_def elf_header.elf_ft_exec_def elf_header.elf_ft_rel_def elf_header.elf_ft_none_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "elf_header"
end
