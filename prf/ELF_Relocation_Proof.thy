theory
  ELF_Relocation_Proof
imports
  Main
  (* X86 model imports *)
  "x86-64_model/L3_Theory"
  "x86-64_model/X64"
  (* ELF model imports *)
  "../auto_generated/isabelle/Import_everything"
  "../auto_generated/isabelle/Termination"
  "../auto_generated/isabelle/Test_image"
begin

definition mov_constant_to_mem :: "64 word \<Rightarrow> 64 word \<Rightarrow> instruction" where
  "mov_constant_to_mem constant addr \<equiv> Zmov (Z_ALWAYS, (Z64, Zrm_i (Zm (None, (ZnoBase, addr)), constant)))"

definition mov_constant_from_mem :: "64 word \<Rightarrow> instruction" where
  "mov_constant_from_mem addr \<equiv> Zmov (Z_ALWAYS, (Z64, Zr_rm (RAX, Zm (None, (ZnoBase, addr)))))"

definition fixed_program :: "instruction list" where
  "fixed_program \<equiv>
    [ mov_constant_to_mem (5 :: 64 word) (100 :: 64 word)
    , mov_constant_from_mem (100 :: 64 word)
    ]"

definition relocatable_program :: "8 word list" where
  "relocatable_program \<equiv>
     List.concat (List.map encode [
       mov_constant_to_mem (5 :: 64 word) (0 :: 64 word)
     , mov_constant_from_mem (0 :: 64 word)
     ])"

definition relocation_image :: "Abis.any_abi_feature annotated_memory_image" where
  "relocation_image \<equiv> img1 relocatable_program"

fun run_program :: "instruction list \<Rightarrow> X64_state \<Rightarrow> X64_state" where
  "run_program [] \<sigma> = \<sigma>" |
  "run_program (x#xs) \<sigma> =
     (let (_, \<sigma>') = Run x \<sigma> in
       run_program xs \<sigma>')"

fun X64_memory_of_memory_image :: "memory_image \<Rightarrow> (nat \<Rightarrow> 8 word)" where
  "X64_memory_of_memory_image i addr =
     (let keys = Map.dom i in
      let rels = { s. \<forall>k \<in> keys. Some s = i k \<and> addr \<ge> the (startpos s) \<and> addr \<le> the (startpos s) + the (length1 s) } in
      let arb  = Set.the_elem rels in
      let reba = addr - the (startpos arb) in
      let byte = List.nth (contents arb) reba in
        the byte)"

definition load_image :: "memory_image \<Rightarrow> nat \<Rightarrow> X64_state" where
  "load_image i entry_point \<equiv>
     \<lparr> EFLAGS = \<lambda>x. None (* XXX: or False? *)
     , MEM = \<lambda>a. X64_memory_of_memory_image i (unat a)
     , REG = \<lambda>x. (0 :: 64 word)
     , RIP = of_nat entry_point
     , exception = NoException
     \<rparr>"

definition execute_two_steps :: "X64_state \<Rightarrow> X64_state" where
  "execute_two_steps \<sigma> =
     (let (fetched, \<sigma>') = x64_fetch \<sigma> in
      let decoded = x64_decode fetched in
       (case decoded of
         Zfull_inst (pre, instr, suf) \<Rightarrow>
           (let (_, \<sigma>'') = Run instr \<sigma>' in
            let (fetched, \<sigma>''') = x64_fetch \<sigma>'' in
            let decoded = x64_decode fetched in
              (case decoded of
                Zfull_inst (pre, instr, suf) \<Rightarrow>
                let (_, \<sigma>'''') = Run instr \<sigma>''' in
                  \<sigma>''''
              | _ \<Rightarrow> undefined))
       | _ \<Rightarrow> undefined))"

definition initial_state :: "nat \<Rightarrow> X64_state" where
  "initial_state entry \<equiv>
    \<lparr> EFLAGS = \<lambda>x. None
    , MEM = \<lambda>addr. 0
    , REG = \<lambda>x. 0
    , RIP = of_nat entry
    , exception = NoException
    \<rparr>"

lemma let_ext:
  shows "let (x, y) = z in q x y = q (fst z) (snd z)"
by (cases z, auto)

(* Theorem statement is something like:
 *
 * let ef = elf64_file_of_memory_image relocation_image in
 * let im = obtain_executable_image ef in
 * let \<sigma>0 = load_image im in
 *   run_program fixed_program empty_state \<simeq> execute_two_steps \<sigma>0
 *)

definition relocation_test :: "nat \<Rightarrow> bool error" where
  "relocation_test entry \<equiv>
     (let i = elements relocation_image in
      let rstate = load_image i entry in
      let final_fixed_state = run_program fixed_program (initial_state entry) in
      let final_relocatable_state = execute_two_steps rstate in
        Success (REG final_fixed_state = REG final_relocatable_state))"

lemma swap_pairs_lemma:
  shows "swap_pairs {(Some (''.text'', 1, 4), SymbolRef ref_and_reloc_rec0), (Some (''.data'', 0, 8), SymbolDef def_rec0)} =
      {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', 0, 8))}"
  apply(simp add: swap_pairs_def)
  apply auto
done

(* XXX: ugly, but necessary to control the simplifier below *)
lemma for_loop_19_unroll:
  fixes act :: "nat \<Rightarrow> 'a \<Rightarrow> (unit \<times> 'a)"
  shows "for_loop ((19::nat), 0, act) = (\<lambda>u. case act 19 u of
     (u, ua) \<Rightarrow> case act 18 ua of
                (u, ua) \<Rightarrow> case act 17 ua of
                           (u, ua) \<Rightarrow> case act 16 ua of
                                      (u, ua) \<Rightarrow> case act 15 ua of
                                                 (u, ua) \<Rightarrow> case act 14 ua of
                                                            (u, ua) \<Rightarrow> case act 13 ua of
                                                                       (u, ua) \<Rightarrow> case act 12 ua of
                                                                                  (u, ua) \<Rightarrow> case act 11 ua of
                                                                                             (u, ua) \<Rightarrow> case act 10 ua of
     (u, ua) \<Rightarrow> case act 9 ua of
                (u, ua) \<Rightarrow> case act 8 ua of
                           (u, ua) \<Rightarrow> case act 7 ua of
                                      (u, ua) \<Rightarrow> case act 6 ua of
                                                 (u, ua) \<Rightarrow> case act 5 ua of
                                                            (u, ua) \<Rightarrow> case act 4 ua of (u, ua) \<Rightarrow> case act 3 ua of (u, ua) \<Rightarrow> case act 2 ua of (u, ua) \<Rightarrow> case act 1 ua of (u, x) \<Rightarrow> act 0 x)"
  by simp
 
lemma dom_lemma:
  shows "{a. [''.text'' \<mapsto>
                      \<lparr>startpos = Some 4194304, length1 = Some 16,
                         contents = map Some (e_rm_imm (Z64, Zm (None, ZnoBase, 0), 5, 0, 198)) @ map Some (e_rm_reg (Z64, Zm (None, ZnoBase, 0), word_of_int (int (Zreg_to_nat RAX)), [], 138))\<rparr>,
                      ''.data'' \<mapsto> \<lparr>startpos = Some 4194320, length1 = Some 8, contents = map Some (replicate 8 (of_nat 42))\<rparr>]
                      a \<noteq>
                     None} = { ''.text'', ''.data''}"
  by auto

lemma rels_lemma:
  shows "{s. \<forall>k\<in>{''.text'', ''.data''}.
                        Some s = [''.text'' \<mapsto>
                                  \<lparr>startpos = Some 4194304, length1 = Some 16,
                                     contents = map Some (e_rm_imm (Z64, Zm (None, ZnoBase, 0), 5, 0, 198)) @
                                                map Some (e_rm_reg (Z64, Zm (None, ZnoBase, 0), word_of_int (int (Zreg_to_nat RAX)), [], 138))\<rparr>,
                                  ''.data'' \<mapsto> \<lparr>startpos = Some 4194320, length1 = Some 8, contents = map Some (replicate 8 (of_nat 42))\<rparr>]
                                  k \<and>
                        the (startpos s) \<le> unat (of_nat 4194304 + word_of_int (int 0)) \<and> unat (of_nat 4194304 + word_of_int (int 0)) \<le> the (startpos s) + the (length1 s)} =
                               { \<lparr>startpos = Some 4194304, length1 = Some 16,
                                            contents = map Some (e_rm_imm (Z64, Zm (None, ZnoBase, 0), 5, 0, 198)) @
                                                       map Some (e_rm_reg (Z64, Zm (None, ZnoBase, 0), word_of_int (int (Zreg_to_nat RAX)), [], 138))\<rparr> }"
sorry

lemma the_elem_lemma:
  shows "the_elem {\<lparr>startpos = Some 4194304, length1 = Some 16,
                             contents = map Some (e_rm_imm (Z64, Zm (None, ZnoBase, 0), 5, 0, 198)) @
                                        map Some (e_rm_reg (Z64, Zm (None, ZnoBase, 0), word_of_int (int (Zreg_to_nat RAX)), [], 138))\<rparr>} =
                                        \<lparr>startpos = Some 4194304, length1 = Some 16,
                             contents = map Some (e_rm_imm (Z64, Zm (None, ZnoBase, 0), 5, 0, 198)) @
                                        map Some (e_rm_reg (Z64, Zm (None, ZnoBase, 0), word_of_int (int (Zreg_to_nat RAX)), [], 138))\<rparr>"
  by auto

lemma word_calc_lemma:
  shows "unat (of_nat 4194304 + word_of_int (int 0)) = 4194304"
sorry

lemma the_startpos_lemma:
  shows "the (startpos \<lparr>startpos = Some 4194304, length1 = Some 16,
                                  contents = map Some (e_rm_imm (Z64, Zm (None, ZnoBase, 0), 5, 0, 198)) @
                                             map Some (e_rm_reg (Z64, Zm (None, ZnoBase, 0), word_of_int (int (Zreg_to_nat RAX)), [], 138))\<rparr>) = 4194304"
  by auto

lemma x64_fetch_lemma:
  shows "x64_fetch \<lparr>EFLAGS = Map.empty,
                       MEM = \<lambda>a\<Colon>64 word. X64_memory_of_memory_image
                                          [''.text'' \<mapsto>
                                           \<lparr>startpos = Some (4194304\<Colon>nat), length1 = Some (16\<Colon>nat),
                                              contents = map Some (e_rm_imm (Z64, Zm (None, ZnoBase, 0\<Colon>64 word), 5\<Colon>64 word, 0\<Colon>4 word, 198\<Colon>8 word)) @
                                                         map Some (e_rm_reg (Z64, Zm (None, ZnoBase, 0\<Colon>64 word), word_of_int (int (Zreg_to_nat RAX)), [], 138\<Colon>8 word))\<rparr>,
                                           ''.data'' \<mapsto> \<lparr>startpos = Some (4194320\<Colon>nat), length1 = Some (8\<Colon>nat), contents = map Some (replicate (8\<Colon>nat) (of_nat (42\<Colon>nat)))\<rparr>]
                                          (unat a),
                       REG = \<lambda>x\<Colon>Zreg. 0\<Colon>64 word, RIP = of_nat (4194304\<Colon>nat), exception = NoException\<rparr> = xxx"
  apply(simp only: x64_fetch.simps)
  apply(simp only: Let_def)
  apply(simp only: for_loop_19_unroll)
  apply(simp only: split fst_def snd_def)
  apply(simp only: X64_state.simps)
  apply(simp only: X64_memory_of_memory_image.simps)
  apply(simp only: dom_def)
  apply(simp only: dom_lemma)
  apply(subst Let_def)
  apply(simp only: let_weak_cong[OF rels_lemma])
  apply(subst Let_def)
  apply(simp only: the_elem_lemma)
  apply(subst Let_def)
  apply(simp only: word_calc_lemma)

theorem at_least_some_relocations_relocate:
    fixes ef :: elf64_file and segs_and_provenance :: "(elf64_interpreted_segment \<times> segment_provenance) list" and entry :: "nat"
            and rstate final_fixed_state final_relocatable_state :: "X64_state"
  assumes "i = elements relocation_image" and "entry = 4194304"
      and "rstate = load_image i entry"
      and "final_fixed_state = run_program fixed_program (initial_state entry)"
      and "final_relocatable_state = execute_two_steps rstate"
    shows "REG final_fixed_state = REG final_relocatable_state" (* XXX: probably want to say something about the contents of memory here, too! *)
using assms
  apply(simp only: relocation_image_def)
  apply(simp only: relocatable_program_def)
  apply(simp only: List.list.map)
  apply(simp only: mov_constant_to_mem_def mov_constant_from_mem_def)
  apply(simp only: encode.simps)
  apply(simp only: X64.instruction.case split X64.Zcond.case Zsize.case Zdest_src.case Zrm.case)
  apply(simp only: List.concat.simps)
  apply(simp only: img1_def)
  apply(simp only: rev.simps append.simps map_of.simps fst_def snd_def split)
  apply(simp only: Let_def append_Nil2)
  apply(simp only: meta0_def set_simps by_tag_from_by_range_def swap_pairs_lemma)
  apply(simp only: map_append)
  apply(simp only: relocate_output_image_def)
  apply(simp only: annotated_memory_image.simps)
  apply(simp only: lookupBy0_def)
  apply(case_tac "findLowestKVWithKEquivTo (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                          (instance_Basic_classes_Ord_Maybe_maybe_dict
                            (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                              (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
                          (SymbolRef null_symbol_reference_and_reloc_site) (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict)
                          {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1\<Colon>nat, 4\<Colon>nat)), (SymbolDef def_rec0, Some (''.data'', 0\<Colon>nat, 8\<Colon>nat))} None")
  apply(simp only: Let_def)
  apply(simp only: option.case foldl.simps annotated_memory_image.simps)
  apply(simp only: execute_two_steps_def load_image_def)
  apply(simp only: Let_def)


end