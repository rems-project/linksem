structure abi_x86_relocationTheory :> abi_x86_relocationTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading abi_x86_relocationTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open showTheory
  in end;
  val _ = Theory.link_parents
          ("abi_x86_relocation",
          Arbnum.fromString "1471355106",
          Arbnum.fromString "829459")
          [("show",
           Arbnum.fromString "1471355094",
           Arbnum.fromString "275066")];
  val _ = Theory.incorporate_types "abi_x86_relocation" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("list", "list"), ID("string", "char"),
   ID("num", "num"), ID("bool", "!"), ID("min", "bool"), ID("num", "0"),
   ID("min", "="), ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("string", "CHR"), ID("bool", "COND"), ID("list", "CONS"),
   ID("list", "NIL"), ID("arithmetic", "NUMERAL"),
   ID("arithmetic", "ZERO"), ID("abi_x86_relocation", "r_386_32"),
   ID("abi_x86_relocation", "r_386_copy"),
   ID("abi_x86_relocation", "r_386_glob_dat"),
   ID("abi_x86_relocation", "r_386_got32"),
   ID("abi_x86_relocation", "r_386_gotoff"),
   ID("abi_x86_relocation", "r_386_gotpc"),
   ID("abi_x86_relocation", "r_386_irelative"),
   ID("abi_x86_relocation", "r_386_jmp_slot"),
   ID("abi_x86_relocation", "r_386_none"),
   ID("abi_x86_relocation", "r_386_pc32"),
   ID("abi_x86_relocation", "r_386_plt32"),
   ID("abi_x86_relocation", "r_386_relative"),
   ID("abi_x86_relocation", "r_386_tls_dtpmod32"),
   ID("abi_x86_relocation", "r_386_tls_dtpoff32"),
   ID("abi_x86_relocation", "r_386_tls_tpoff"),
   ID("abi_x86_relocation", "string_of_x86_relocation_type")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [2], TYOP [1, 0], TYOP [3], TYOP [0, 2, 1], TYOP [5],
   TYOP [0, 2, 4], TYOP [0, 5, 4], TYOP [0, 1, 4], TYOP [0, 1, 7],
   TYOP [0, 2, 5], TYOP [0, 2, 2], TYOP [0, 2, 0], TYOP [0, 1, 1],
   TYOP [0, 1, 12], TYOP [0, 4, 13], TYOP [0, 0, 12]]
  end
  val _ = Theory.incorporate_consts "abi_x86_relocation" tyvector
     [("string_of_x86_relocation_type", 3), ("r_386_tls_tpoff", 2),
      ("r_386_tls_dtpoff32", 2), ("r_386_tls_dtpmod32", 2),
      ("r_386_relative", 2), ("r_386_plt32", 2), ("r_386_pc32", 2),
      ("r_386_none", 2), ("r_386_jmp_slot", 2), ("r_386_irelative", 2),
      ("r_386_gotpc", 2), ("r_386_gotoff", 2), ("r_386_got32", 2),
      ("r_386_glob_dat", 2), ("r_386_copy", 2), ("r_386_32", 2)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("m", 2), TMC(4, 6), TMC(6, 2), TMC(7, 8), TMC(7, 9), TMC(8, 10),
   TMC(9, 10), TMC(10, 11), TMC(11, 14), TMC(12, 15), TMC(13, 1),
   TMC(14, 10), TMC(15, 2), TMC(16, 2), TMC(17, 2), TMC(18, 2), TMC(19, 2),
   TMC(20, 2), TMC(21, 2), TMC(22, 2), TMC(23, 2), TMC(24, 2), TMC(25, 2),
   TMC(26, 2), TMC(27, 2), TMC(28, 2), TMC(29, 2), TMC(30, 2), TMC(31, 3)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op r_386_none_def x = x
    val op r_386_none_def =
    DT(((("abi_x86_relocation",0),[]),[]), [read"%4%21@%2@"])
  fun op r_386_32_def x = x
    val op r_386_32_def =
    DT(((("abi_x86_relocation",1),[]),[]), [read"%4%13@%11%5%12@@@"])
  fun op r_386_pc32_def x = x
    val op r_386_pc32_def =
    DT(((("abi_x86_relocation",2),[]),[]), [read"%4%22@%11%6%12@@@"])
  fun op r_386_got32_def x = x
    val op r_386_got32_def =
    DT(((("abi_x86_relocation",3),[]),[]), [read"%4%16@%11%5%5%12@@@@"])
  fun op r_386_plt32_def x = x
    val op r_386_plt32_def =
    DT(((("abi_x86_relocation",4),[]),[]), [read"%4%23@%11%6%5%12@@@@"])
  fun op r_386_copy_def x = x
    val op r_386_copy_def =
    DT(((("abi_x86_relocation",5),[]),[]), [read"%4%14@%11%5%6%12@@@@"])
  fun op r_386_glob_dat_def x = x
    val op r_386_glob_dat_def =
    DT(((("abi_x86_relocation",6),[]),[]), [read"%4%15@%11%6%6%12@@@@"])
  fun op r_386_jmp_slot_def x = x
    val op r_386_jmp_slot_def =
    DT(((("abi_x86_relocation",7),[]),[]), [read"%4%20@%11%5%5%5%12@@@@@"])
  fun op r_386_relative_def x = x
    val op r_386_relative_def =
    DT(((("abi_x86_relocation",8),[]),[]), [read"%4%24@%11%6%5%5%12@@@@@"])
  fun op r_386_gotoff_def x = x
    val op r_386_gotoff_def =
    DT(((("abi_x86_relocation",9),[]),[]), [read"%4%17@%11%5%6%5%12@@@@@"])
  fun op r_386_gotpc_def x = x
    val op r_386_gotpc_def =
    DT(((("abi_x86_relocation",10),[]),[]),
       [read"%4%18@%11%6%6%5%12@@@@@"])
  fun op r_386_tls_tpoff_def x = x
    val op r_386_tls_tpoff_def =
    DT(((("abi_x86_relocation",11),[]),[]),
       [read"%4%27@%11%6%6%6%12@@@@@"])
  fun op r_386_tls_dtpmod32_def x = x
    val op r_386_tls_dtpmod32_def =
    DT(((("abi_x86_relocation",12),[]),[]),
       [read"%4%25@%11%5%5%6%5%5%12@@@@@@@"])
  fun op r_386_tls_dtpoff32_def x = x
    val op r_386_tls_dtpoff32_def =
    DT(((("abi_x86_relocation",13),[]),[]),
       [read"%4%26@%11%6%5%6%5%5%12@@@@@@@"])
  fun op r_386_irelative_def x = x
    val op r_386_irelative_def =
    DT(((("abi_x86_relocation",14),[]),[]),
       [read"%4%19@%11%6%6%5%6%5%12@@@@@@@"])
  fun op string_of_x86_relocation_type_def x = x
    val op string_of_x86_relocation_type_def =
    DT(((("abi_x86_relocation",15),[]),[]),
       [read"%1%0%3%28$0@@%8%4$0@%21@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%6%6%6%6%5%5%12@@@@@@@@@%9%7%11%5%5%5%5%6%5%12@@@@@@@@@%9%7%11%6%6%6%6%5%5%12@@@@@@@@@%9%7%11%5%6%6%5%5%5%12@@@@@@@@@%10@@@@@@@@@@@%8%4$0@%13@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%6%5%5%6%12@@@@@@@@%10@@@@@@@@@%8%4$0@%22@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%6%5%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%6%5%5%5%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%6%5%5%6%12@@@@@@@@%10@@@@@@@@@@@%8%4$0@%16@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%5%6%5%5%12@@@@@@@@@%9%7%11%5%5%5%5%6%5%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%6%5%5%6%12@@@@@@@@%10@@@@@@@@@@@@%8%4$0@%23@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%6%5%5%5%6%5%12@@@@@@@@@%9%7%11%6%5%6%6%5%5%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%6%5%5%6%12@@@@@@@@%10@@@@@@@@@@@@%8%4$0@%14@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%5%5%12@@@@@@@@@%9%7%11%5%5%5%5%6%5%12@@@@@@@@@%9%7%11%6%5%5%5%6%5%12@@@@@@@@@%9%7%11%5%6%5%6%6%5%12@@@@@@@@@%10@@@@@@@@@@@%8%4$0@%15@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%5%6%5%5%12@@@@@@@@@%9%7%11%6%5%6%6%5%5%12@@@@@@@@@%9%7%11%5%5%5%5%6%5%12@@@@@@@@@%9%7%11%6%6%5%5%5%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%6%5%6%5%5%5%12@@@@@@@@@%9%7%11%5%6%5%5%5%5%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%10@@@@@@@@@@@@@@@%8%4$0@%20@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%6%6%5%6%5%5%12@@@@@@@@@%9%7%11%5%6%6%5%6%5%12@@@@@@@@@%9%7%11%5%6%6%6%5%5%12@@@@@@@@@%9%7%11%6%5%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%5%12@@@@@@@@@%9%7%11%6%5%6%6%5%5%12@@@@@@@@@%9%7%11%5%5%5%5%6%5%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%10@@@@@@@@@@@@@@@@%8%4$0@%24@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%6%6%5%5%5%12@@@@@@@@@%9%7%11%6%5%6%6%5%5%12@@@@@@@@@%9%7%11%5%6%5%5%5%5%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%9%7%11%5%6%5%6%5%5%12@@@@@@@@@%9%7%11%6%6%6%5%6%5%12@@@@@@@@@%9%7%11%5%6%6%5%5%5%12@@@@@@@@@%10@@@@@@@@@@@@@@@%8%4$0@%17@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%5%6%5%5%12@@@@@@@@@%9%7%11%5%5%5%5%6%5%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%6%5%12@@@@@@@@@%9%7%11%6%6%6%5%5%5%12@@@@@@@@@%9%7%11%6%6%6%5%5%5%12@@@@@@@@@%10@@@@@@@@@@@@@%8%4$0@%18@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%5%6%5%5%12@@@@@@@@@%9%7%11%5%5%5%5%6%5%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%9%7%11%6%5%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%6%5%5%5%12@@@@@@@@@%10@@@@@@@@@@@@%8%4$0@%27@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%9%7%11%6%5%6%6%5%5%12@@@@@@@@@%9%7%11%5%5%6%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%9%7%11%6%5%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%6%5%12@@@@@@@@@%9%7%11%6%6%6%5%5%5%12@@@@@@@@@%9%7%11%6%6%6%5%5%5%12@@@@@@@@@%10@@@@@@@@@@@@@@@@%8%4$0@%25@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%9%7%11%6%5%6%6%5%5%12@@@@@@@@@%9%7%11%5%5%6%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%6%5%6%5%5%5%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%9%7%11%6%5%5%5%6%5%12@@@@@@@@@%9%7%11%5%6%6%6%5%5%12@@@@@@@@@%9%7%11%5%5%5%5%6%5%12@@@@@@@@@%9%7%11%6%5%6%5%5%5%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%6%5%5%6%12@@@@@@@@%10@@@@@@@@@@@@@@@@@@@%8%4$0@%26@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%9%7%11%6%5%6%6%5%5%12@@@@@@@@@%9%7%11%5%5%6%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%6%5%6%5%5%5%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%9%7%11%6%5%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%6%5%12@@@@@@@@@%9%7%11%6%6%6%5%5%5%12@@@@@@@@@%9%7%11%6%6%6%5%5%5%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%6%5%5%6%12@@@@@@@@%10@@@@@@@@@@@@@@@@@@@%8%4$0@%19@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%5%6%5%6%12@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%5%5%5%5%5%6%12@@@@@@@@@%9%7%11%5%6%5%6%5%5%12@@@@@@@@@%9%7%11%6%6%5%5%6%5%12@@@@@@@@@%9%7%11%5%6%6%5%5%5%12@@@@@@@@@%9%7%11%6%5%6%6%5%5%12@@@@@@@@@%9%7%11%5%6%5%5%5%5%12@@@@@@@@@%9%7%11%6%5%6%5%6%5%12@@@@@@@@@%9%7%11%5%6%5%6%5%5%12@@@@@@@@@%9%7%11%6%6%6%5%6%5%12@@@@@@@@@%9%7%11%5%6%6%5%5%5%12@@@@@@@@@%10@@@@@@@@@@@@@@@@%9%7%11%5%6%5%6%5%5%12@@@@@@@@@%9%7%11%6%6%6%6%5%6%12@@@@@@@@@%9%7%11%6%6%6%5%6%6%12@@@@@@@@@%9%7%11%5%6%5%5%5%6%12@@@@@@@@@%9%7%11%6%5%6%6%5%6%12@@@@@@@@@%9%7%11%5%6%5%6%5%6%12@@@@@@@@@%9%7%11%6%5%6%5%5%6%12@@@@@@@@@%9%7%11%6%5%5%5%5%12@@@@@@@@%9%7%11%6%5%5%6%6%6%12@@@@@@@@@%9%7%11%6%5%5%6%6%12@@@@@@@@%9%7%11%6%6%6%5%6%12@@@@@@@@%9%7%11%6%5%5%5%5%12@@@@@@@@%9%7%11%6%6%5%5%6%6%12@@@@@@@@@%9%7%11%5%6%6%5%5%6%12@@@@@@@@@%9%7%11%6%5%6%6%5%6%12@@@@@@@@@%9%7%11%5%5%5%5%6%6%12@@@@@@@@@%9%7%11%5%5%6%5%5%6%12@@@@@@@@@%9%7%11%5%6%5%5%5%6%12@@@@@@@@@%9%7%11%6%5%6%5%6%6%12@@@@@@@@@%9%7%11%5%6%5%6%5%6%12@@@@@@@@@%9%7%11%5%5%5%5%6%6%12@@@@@@@@@%9%7%11%6%6%6%6%5%6%12@@@@@@@@@%10@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|@"])
  end
  val _ = DB.bindl "abi_x86_relocation"
  [("r_386_none_def",r_386_none_def,DB.Def),
   ("r_386_32_def",r_386_32_def,DB.Def),
   ("r_386_pc32_def",r_386_pc32_def,DB.Def),
   ("r_386_got32_def",r_386_got32_def,DB.Def),
   ("r_386_plt32_def",r_386_plt32_def,DB.Def),
   ("r_386_copy_def",r_386_copy_def,DB.Def),
   ("r_386_glob_dat_def",r_386_glob_dat_def,DB.Def),
   ("r_386_jmp_slot_def",r_386_jmp_slot_def,DB.Def),
   ("r_386_relative_def",r_386_relative_def,DB.Def),
   ("r_386_gotoff_def",r_386_gotoff_def,DB.Def),
   ("r_386_gotpc_def",r_386_gotpc_def,DB.Def),
   ("r_386_tls_tpoff_def",r_386_tls_tpoff_def,DB.Def),
   ("r_386_tls_dtpmod32_def",r_386_tls_dtpmod32_def,DB.Def),
   ("r_386_tls_dtpoff32_def",r_386_tls_dtpoff32_def,DB.Def),
   ("r_386_irelative_def",r_386_irelative_def,DB.Def),
   ("string_of_x86_relocation_type_def",
    string_of_x86_relocation_type_def,
    DB.Def)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("showTheory.show_grammars",
                          showTheory.show_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_none", (Term.prim_mk_const { Name = "r_386_none", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_none", (Term.prim_mk_const { Name = "r_386_none", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_32", (Term.prim_mk_const { Name = "r_386_32", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_32", (Term.prim_mk_const { Name = "r_386_32", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_pc32", (Term.prim_mk_const { Name = "r_386_pc32", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_pc32", (Term.prim_mk_const { Name = "r_386_pc32", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_got32", (Term.prim_mk_const { Name = "r_386_got32", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_got32", (Term.prim_mk_const { Name = "r_386_got32", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_plt32", (Term.prim_mk_const { Name = "r_386_plt32", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_plt32", (Term.prim_mk_const { Name = "r_386_plt32", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_copy", (Term.prim_mk_const { Name = "r_386_copy", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_copy", (Term.prim_mk_const { Name = "r_386_copy", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_glob_dat", (Term.prim_mk_const { Name = "r_386_glob_dat", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_glob_dat", (Term.prim_mk_const { Name = "r_386_glob_dat", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_jmp_slot", (Term.prim_mk_const { Name = "r_386_jmp_slot", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_jmp_slot", (Term.prim_mk_const { Name = "r_386_jmp_slot", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_relative", (Term.prim_mk_const { Name = "r_386_relative", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_relative", (Term.prim_mk_const { Name = "r_386_relative", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_gotoff", (Term.prim_mk_const { Name = "r_386_gotoff", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_gotoff", (Term.prim_mk_const { Name = "r_386_gotoff", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_gotpc", (Term.prim_mk_const { Name = "r_386_gotpc", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_gotpc", (Term.prim_mk_const { Name = "r_386_gotpc", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_tls_tpoff", (Term.prim_mk_const { Name = "r_386_tls_tpoff", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_tls_tpoff", (Term.prim_mk_const { Name = "r_386_tls_tpoff", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_tls_dtpmod32", (Term.prim_mk_const { Name = "r_386_tls_dtpmod32", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_tls_dtpmod32", (Term.prim_mk_const { Name = "r_386_tls_dtpmod32", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_tls_dtpoff32", (Term.prim_mk_const { Name = "r_386_tls_dtpoff32", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_tls_dtpoff32", (Term.prim_mk_const { Name = "r_386_tls_dtpoff32", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_irelative", (Term.prim_mk_const { Name = "r_386_irelative", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("r_386_irelative", (Term.prim_mk_const { Name = "r_386_irelative", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_x86_relocation_type", (Term.prim_mk_const { Name = "string_of_x86_relocation_type", Thy = "abi_x86_relocation"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("string_of_x86_relocation_type", (Term.prim_mk_const { Name = "string_of_x86_relocation_type", Thy = "abi_x86_relocation"}))
  val abi_x86_relocation_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "abi_x86_relocation",
    thydataty = "compute",
    data =
        "abi_x86_relocation.r_386_none_def abi_x86_relocation.string_of_x86_relocation_type_def abi_x86_relocation.r_386_tls_dtpoff32_def abi_x86_relocation.r_386_irelative_def abi_x86_relocation.r_386_relative_def abi_x86_relocation.r_386_tls_dtpmod32_def abi_x86_relocation.r_386_tls_tpoff_def abi_x86_relocation.r_386_gotpc_def abi_x86_relocation.r_386_gotoff_def abi_x86_relocation.r_386_pc32_def abi_x86_relocation.r_386_jmp_slot_def abi_x86_relocation.r_386_glob_dat_def abi_x86_relocation.r_386_copy_def abi_x86_relocation.r_386_plt32_def abi_x86_relocation.r_386_got32_def abi_x86_relocation.r_386_32_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "abi_x86_relocation"
end
