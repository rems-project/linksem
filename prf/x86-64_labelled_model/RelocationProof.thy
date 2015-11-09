theory
  RelocationProof
imports
  Labelled_X64
  X64
  Main
begin

type_synonym labelled_program = "(string option \<times> Labelled_X64.Zinst) list"
type_synonym program = "X64.Zinst list"

datatype destination_source
  = Destination
  | Source

fun compute_label_offsets :: "nat \<Rightarrow> labelled_program \<Rightarrow> (string \<rightharpoonup> nat)" where
  "compute_label_offsets start [] = (\<lambda>x. None)" |
  "compute_label_offsets start ((None, i)#xs) = compute_label_offsets (Suc start) xs" |
  "compute_label_offsets start ((Some l, i)#xs) =
     Map.map_add (\<lambda>x. if x = l then Some start else None) (compute_label_offsets (Suc start) xs)"

fun labelled_x64_reg_to_x64_reg :: "Labelled_X64.Zreg \<Rightarrow> Zreg" where
  "labelled_x64_reg_to_x64_reg Labelled_X64.RAX = RAX" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.RCX = RCX" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.RDX = RDX" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.RBX = RBX" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.RSP = RSP" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.RBP = RBP" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.RSI = RSI" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.RDI = RDI" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.zR8 = zR8" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.zR9 = zR9" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.zR10 = zR10" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.zR11 = zR11" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.zR12 = zR12" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.zR13 = zR13" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.zR14 = zR14" |
  "labelled_x64_reg_to_x64_reg Labelled_X64.zR15 = zR15"

fun labelled_x64_cond_to_x64_cond :: "Labelled_X64.Zcond \<Rightarrow> Zcond" where
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_O = Z_O" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_NO = Z_NO" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_B = Z_B" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_NB = Z_NB" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_E = Z_E" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_NE = Z_NE" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_NA = Z_NA" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_A = Z_A" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_S = Z_S" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_NS = Z_NS" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_P = Z_P" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_NP = Z_NP" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_L = Z_L" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_NL = Z_NL" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_NG = Z_NG" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_G = Z_G" |
  "labelled_x64_cond_to_x64_cond Labelled_X64.Z_ALWAYS = Z_ALWAYS"

fun labelled_x64_zsize_to_x64_zsize :: "Labelled_X64.Zsize \<Rightarrow> Zsize" where
  "labelled_x64_zsize_to_x64_zsize Labelled_X64.Z16 = Z16" |
  "labelled_x64_zsize_to_x64_zsize Labelled_X64.Z32 = Z32" |
  "labelled_x64_zsize_to_x64_zsize Labelled_X64.Z64 = Z64" |
  "labelled_x64_zsize_to_x64_zsize (Labelled_X64.Z8 f) = Z8 f"

fun labelled_x64_zea_to_x64_zea :: "Labelled_X64.Zea \<Rightarrow> Zea" where
  "labelled_x64_zea_to_x64_zea (Labelled_X64.Zea_i (sz, wrd)) = Zea_i (labelled_x64_zsize_to_x64_zsize sz, wrd)" |
  "labelled_x64_zea_to_x64_zea (Labelled_X64.Zea_m (sz, wrd)) = Zea_m (labelled_x64_zsize_to_x64_zsize sz, wrd)" |
  "labelled_x64_zea_to_x64_zea (Labelled_X64.Zea_r (sz, reg)) = Zea_r (labelled_x64_zsize_to_x64_zsize sz, labelled_x64_reg_to_x64_reg reg)"

fun labelled_x64_base_to_x64_base :: "Labelled_X64.Zbase \<Rightarrow> X64.Zbase" where
  "labelled_x64_base_to_x64_base Labelled_X64.ZnoBase = ZnoBase" |
  "labelled_x64_base_to_x64_base (Labelled_X64.ZregBase reg) = ZregBase (labelled_x64_reg_to_x64_reg reg)" |
  "labelled_x64_base_to_x64_base Labelled_X64.ZripBase = ZripBase"

fun labelled_x64_mem_to_x64_mem :: "((2 word \<times> Labelled_X64.Zreg) option \<times> Labelled_X64.Zbase \<times> 64 word) \<Rightarrow> (2 word \<times> Zreg) option \<times> Zbase \<times> 64 word" where
  "labelled_x64_mem_to_x64_mem (None, base, wrd) = (None, labelled_x64_base_to_x64_base base, wrd)" |
  "labelled_x64_mem_to_x64_mem (Some (two, reg), base, wrd) = (Some (two, labelled_x64_reg_to_x64_reg reg), labelled_x64_base_to_x64_base base, wrd)"

fun labelled_x64_zeflags_to_x64_zeflags :: "Labelled_X64.Zeflags \<Rightarrow> Zeflags" where
  "labelled_x64_zeflags_to_x64_zeflags Labelled_X64.Z_CF = Z_CF" |
  "labelled_x64_zeflags_to_x64_zeflags Labelled_X64.Z_PF = Z_PF" |
  "labelled_x64_zeflags_to_x64_zeflags Labelled_X64.Z_AF = Z_AF" |
  "labelled_x64_zeflags_to_x64_zeflags Labelled_X64.Z_ZF = Z_ZF" |
  "labelled_x64_zeflags_to_x64_zeflags Labelled_X64.Z_SF = Z_SF" |
  "labelled_x64_zeflags_to_x64_zeflags Labelled_X64.Z_OF = Z_OF"

fun labelled_x64_binop_to_x64_binop :: "Labelled_X64.Zbinop_name \<Rightarrow> Zbinop_name" where
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zadd = Zadd" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zor = Zor" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zadc = Zadc" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zsbb = Zsbb" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zand = Zand" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zsub = Zsub" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zxor = Zxor" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zcmp = Zcmp" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zrol = Zrol" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zror = Zror" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zrcl = Zrcl" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zrcr = Zrcr" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zshl = Zshl" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zshr = Zshr" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Ztest = Ztest" |
  "labelled_x64_binop_to_x64_binop Labelled_X64.Zsar = Zsar"

fun concretise_rm :: "Labelled_X64.Zrm \<Rightarrow> destination_source \<Rightarrow> nat \<Rightarrow> (string \<rightharpoonup> nat) \<Rightarrow> Zrm" where
  "concretise_rm (Labelled_X64.Zl label) ds current_pos mapping =
     (case mapping label of
        None \<Rightarrow> undefined
      | Some off \<Rightarrow>
          if off < current_pos then
            undefined
          else
            undefined)" |
  "concretise_rm (Labelled_X64.Zm mem)   ds current_pos mapping = Zm (labelled_x64_mem_to_x64_mem mem)" |
  "concretise_rm (Labelled_X64.Zr reg)   ds current_pos mapping = Zr (labelled_x64_reg_to_x64_reg reg)"

fun concretise_imm_rm :: "Labelled_X64.Zimm_rm \<Rightarrow> destination_source \<Rightarrow> nat \<Rightarrow> (string \<rightharpoonup> nat) \<Rightarrow> Zimm_rm" where
  "concretise_imm_rm (Labelled_X64.Zimm wrd) dest_src current_pos mapping = Zimm wrd" |
  "concretise_imm_rm (Labelled_X64.Zrm rm) dest_src current_pos mapping = Zrm (concretise_rm rm dest_src current_pos mapping)"

fun concretise_dest_src :: "Labelled_X64.Zdest_src \<Rightarrow> nat \<Rightarrow> (string \<rightharpoonup> nat) \<Rightarrow> Zdest_src" where
  "concretise_dest_src (Labelled_X64.Zr_rm (reg, rm)) current_pos mapping =
     Zr_rm (labelled_x64_reg_to_x64_reg reg, concretise_rm rm Source current_pos mapping)" |
  "concretise_dest_src (Labelled_X64.Zrm_i (rm, wrd)) current_pos mapping =
     Zrm_i (concretise_rm rm Destination current_pos mapping, wrd)" |
  "concretise_dest_src (Labelled_X64.Zrm_l (rm, label)) current_pos mapping =
     (case mapping label of
        None \<Rightarrow> undefined
      | Some v \<Rightarrow>
        if v < current_pos then
          let wrd = of_int (int v - int current_pos) in
            Zrm_i (concretise_rm rm Destination current_pos mapping, wrd)
        else
          let wrd = of_int (int current_pos - int v) in
            Zrm_i (concretise_rm rm Destination current_pos mapping, wrd))" |
  "concretise_dest_src (Labelled_X64.Zrm_r (rm, reg)) current_pos mapping =
     Zrm_r (concretise_rm rm Destination current_pos mapping, labelled_x64_reg_to_x64_reg reg)"

find_consts name: "AND"

fun concretise_instruction :: "Labelled_X64.instruction \<Rightarrow> nat \<Rightarrow> (string \<rightharpoonup> nat) \<Rightarrow> X64.instruction list" where
  "concretise_instruction (Labelled_X64.Zbinop (binop, sz, dest_src)) current_pos mapping =
     [Zbinop (labelled_x64_binop_to_x64_binop binop, labelled_x64_zsize_to_x64_zsize sz, concretise_dest_src dest_src current_pos mapping)]" |
  "concretise_instruction (Labelled_X64.Zcall (Labelled_X64.Zimm wrd)) current_pos mapping =
     [Zcall (Zimm wrd)]" |
  "concretise_instruction (Labelled_X64.Zcall (Labelled_X64.Zrm (Labelled_X64.Zl label))) current_pos mapping =
     (case mapping label of
        None \<Rightarrow> undefined
      | Some v \<Rightarrow> [Zcall (Zimm (of_nat v))])" |
  "concretise_instruction (Labelled_X64.Zcall (Labelled_X64.Zrm (Labelled_X64.Zm mem))) current_pos mapping =
     [Zcall (Zrm (Zm (labelled_x64_mem_to_x64_mem mem)))]" |
  "concretise_instruction (Labelled_X64.Zcall (Labelled_X64.Zrm (Labelled_X64.Zr reg))) current_pos mapping =
     [Zcall (Zrm (Zr (labelled_x64_reg_to_x64_reg reg)))]" |
  "concretise_instruction (Labelled_X64.Zcmpxchg (sz, rm, reg)) current_pos mapping = undefined" |
  "concretise_instruction (Labelled_X64.Zdiv (sz, rm)) current_pos mapping = undefined" |
  "concretise_instruction (Labelled_X64.Zjcc (cond, wrd)) current_pos mapping =
     [Zjcc (labelled_x64_cond_to_x64_cond cond, wrd)]" |
  "concretise_instruction (Labelled_X64.Zjmp rm) current_pos mapping = undefined" |
  "concretise_instruction (Labelled_X64.Zlea (sz, dest_src)) current_pos mapping =
     [Zlea (labelled_x64_zsize_to_x64_zsize sz, concretise_dest_src dest_src current_pos mapping)]" |
  "concretise_instruction (Labelled_X64.Zleave) current_pos mapping =
     [Zleave]" |
  "concretise_instruction (Labelled_X64.Zloop (cond, wrd)) current_pos mapping = undefined" |
  "concretise_instruction (Labelled_X64.Zmonop (monop, sz, rm)) current_pos mapping = undefined" |
  "concretise_instruction (Labelled_X64.Zmov (cond, sz, dest_src)) current_pos mapping = undefined" |
  "concretise_instruction (Labelled_X64.Zmovsx (sz, dest_src, sz')) current_pos mapping =
     [Zmovsx (labelled_x64_zsize_to_x64_zsize sz, concretise_dest_src dest_src current_pos mapping, labelled_x64_zsize_to_x64_zsize sz')]" |
  "concretise_instruction (Labelled_X64.Zmovzx (sz, dest_src, sz')) current_pos mapping =
     [Zmovzx (labelled_x64_zsize_to_x64_zsize sz, concretise_dest_src dest_src current_pos mapping, labelled_x64_zsize_to_x64_zsize sz')]" |
  "concretise_instruction (Labelled_X64.Zmul (sz, rm)) current_pos mapping = undefined" |
  "concretise_instruction (Labelled_X64.Znop) current_pos mapping =
     [Znop]" |
  "concretise_instruction (Labelled_X64.Zpop rm) current_pos mapping = undefined" |
  "concretise_instruction (Labelled_X64.Zpush imm_rm) current_pos mapping = undefined" |
  "concretise_instruction (Labelled_X64.Zret wrd) current_pos mapping =
     [Zret wrd]" |
  "concretise_instruction (Labelled_X64.Zxadd (sz, rm, reg)) current_pos mapping = undefined" |
  "concretise_instruction (Labelled_X64.Zxchg (sz, rm, reg)) current_pos mapping = undefined"

fun concretise_Zinst :: "Labelled_X64.Zinst \<Rightarrow> nat \<Rightarrow> (string \<rightharpoonup> nat) \<Rightarrow> Zinst" where
  "concretise_Zinst (Labelled_X64.Zdec_fail msg) current_pos mapping = Zdec_fail msg" |
  "concretise_Zinst (Labelled_X64.Zfull_inst (lft, instr, rgt)) current_pos mapping = Zfull_inst (lft, concretise_instruction instr current_pos mapping, rgt)"

end