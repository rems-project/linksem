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

section {* Proof-of-concept relocation proof *}

subsection {* Useful definitions *}

text {* Mov an immediate constant into a location in memory. *}
definition mov_constant_to_mem :: "64 word \<Rightarrow> 64 word \<Rightarrow> instruction" where
  "mov_constant_to_mem constant addr \<equiv> Zmov (Z_ALWAYS, (Z64, Zrm_i (Zm (None, (ZnoBase, addr)), constant)))"

text {* Mov a constant from memory into the register RAX. *}
definition mov_constant_from_mem :: "64 word \<Rightarrow> instruction" where
  "mov_constant_from_mem addr \<equiv> Zmov (Z_ALWAYS, (Z64, Zr_rm (RAX, Zm (None, (ZnoBase, addr)))))"

text {* The "fixed" program (i.e. the program that never changes and is never relocated) which
moves the immediate constant 5 into a fixed address in memory and then moves that constant back into
the RAX register using the two definitions above. *}
definition fixed_program :: "8 word list" where
  "fixed_program \<equiv>
    List.concat (List.map encode [
      mov_constant_to_mem (5 :: 64 word) (100 :: 64 word)
    , mov_constant_from_mem (100 :: 64 word)
    ])"

text {* The program that will be relocated.  Moves an immediate constant 5 into some zero'd out
address and will move the constant back again into the RAX register from the same address.  The zero'd
out address will be "fixed-up" by the relocation process set up in Test_image.thy. *}
definition relocatable_program :: "8 word list" where
  "relocatable_program \<equiv>
     List.concat (List.map encode [
       mov_constant_to_mem (5 :: 64 word) (0 :: 64 word)
     , mov_constant_from_mem (0 :: 64 word)
     ])"

text {* The relocation image that the linker produces internally after relocation.  The relocatable
program above has now been relocated.  We will use this to populate a memory for the X64 emulation
below. *}
definition relocation_image :: "Abis.any_abi_feature annotated_memory_image" where
  "relocation_image \<equiv> img1 relocatable_program"

text {* Produce an X64 memory (a map from addresses to bytes) out of a memory image that we will
obtain from the relocation_image above. *}
definition X64_memory_of_memory_image :: "memory_image \<Rightarrow> (nat \<Rightarrow> 8 word)" where
  "X64_memory_of_memory_image i addr =
     (let keys = Map.dom i in
      let rels = { s. \<forall>k \<in> keys. Some s = i k \<and> addr \<ge> the (startpos s) \<and> addr \<le> the (startpos s) + the (length1 s) } in
      let arb  = Set.the_elem rels in
      let reba = addr - the (startpos arb) in
      let byte = List.nth (contents arb) reba in
        the byte)"

text {* Produces an initial state for the X64 emulation out of a memory_image (which will be converted
to a memory, per the definition above) and a fixed start address for the instruction pointer.  This
start address must match the start addresses of the .text section specified in Test_image.thy). *}
definition load_relocated_program_image :: "memory_image \<Rightarrow> nat \<Rightarrow> X64_state" where
  "load_relocated_program_image i entry_point \<equiv>
     \<lparr> EFLAGS = \<lambda>x. None (* XXX: or False? *)
     , MEM = \<lambda>a. X64_memory_of_memory_image i (unat a)
     , REG = \<lambda>x. (0 :: 64 word)
     , RIP = of_nat entry_point
     , exception = NoException
     \<rparr>"

text {* Produces an initial state for the X64 emulation out of the encoded instructions of our fixed
program above, and a fixed start address for the instruction pointer.  This start address must match
the start address of the .text section specified in Test_image.thy. *}
definition load_fixed_program_instructions :: "8 word list \<Rightarrow> nat \<Rightarrow> X64_state" where
  "load_fixed_program_instructions p entry_point \<equiv>
     \<lparr> EFLAGS = Map.empty (* XXX: or False? *)
     , MEM = \<lambda>x. p ! (unat x - entry_point)
     , REG = \<lambda>x. (0 :: 64 word)
     , RIP = of_nat entry_point
     , exception = NoException
     \<rparr>"

text {* Executes two steps of the X64 emulation given a fixed X64 state, returning a new state.  This
will be sufficient to execute both programs above to their conclusion. *}
definition run_two_steps :: "X64_state \<Rightarrow> X64_state" where
  "run_two_steps \<sigma> \<equiv> snd (x64_next (snd (x64_next \<sigma>)))"

text {* We now have our (rather silly) correctness property, which serves to demonstrate that our
definitions are capable of supporting formal proof.  If we set the Isabelle execution mechanism up
correctly we could just execute this to obtain our theorem, but we will use proof instead.  Creating
two initial states for the X64 emulation out of our fixed and relocated program, we run them for two
steps and demonstrate that the contents of their registers are the same after execution.  In
particular, both RAX registers will contain the immediate constant, 5. *}
definition correctness_property :: "bool" where
  "correctness_property \<equiv>
     let entry  = 4194304 in
     let fstate1 = load_fixed_program_instructions fixed_program entry in
     let fstate2 = run_two_steps fstate1 in
     let rstate1 = load_relocated_program_image (elements relocation_image) entry in
     let rstate2 = run_two_steps rstate1 in
       REG rstate2 = REG rstate2 \<and> (REG rstate1) RAX = 5"

subsection {* Lemmas *}

lemma encode_relocated_program_compute:
  shows "map encode [
           Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, 0), 5)),
           Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, 0)))
         ] = [[72, 199, 4, 37, 0, 0, 0, 0, 5, 0, 0, 0], [72, 139, 4, 37, 0, 0, 0, 0]]"
sorry (* XXX: true by eval *)

lemma encode_fixed_program_compute:
  shows "map encode [
           Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, 100), 5)),
           Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, 100)))
         ] = [[72, 199, 4, 37, 100, 0, 0, 0, 5, 0, 0, 0], [72, 139, 4, 37, 100, 0, 0, 0]]"
sorry (* XXX: true by eval *)

lemma e_rm_imm_relocated_technical:
  shows "List.concat [e_rm_imm (Z64, Zm (None, ZnoBase, 0), 5, 0, 198), e_rm_reg (Z64, Zm (None, ZnoBase, 0), word_of_int (int (Zreg_to_nat RAX)), [], 138)] =
    [72, 199, 4, 37, 0, 0, 0, 0, 5, 0, 0, 0, 72, 139, 4, 37, 0, 0, 0, 0]"
sorry (* XXX: true by eval *)

lemma img1_technical:
  shows "img1 [72, 199, 4, 37, 0, 0, 0, 0, 5, 0, 0, 0, 72, 139, 4, 37, 0, 0, 0, 0] = xxx"
sorry

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

(* XXX: need some precondition on size of x, here, but that's fine as we only ever use this lemma on
   small constants...
*)
lemma word_arith_technical:
  shows "unat (of_nat 4194304 + word_of_int (int x)) = (4194304 + x)"
sorry

lemma x64_fetch_fixed1:
  shows "x64_fetch \<lparr>EFLAGS = Map.empty, MEM = \<lambda>x. [72, 199, 4, 37, 100, 0, 0, 0, 5, 0, 0, 0, 72, 139, 4, 37, 100, 0, 0, 0] ! (unat x - 4194304),
                    REG = \<lambda>x. 0, RIP = of_nat 4194304, exception = NoException\<rparr> =
          ([72, 199, 4, 37, 100, 0, 0, 0, 5, 0, 0, 0, 72, 139, 4, 37, 100, 0, 0, 0],
           \<lparr>EFLAGS = Map.empty, MEM = \<lambda>x. [72, 199, 4, 37, 100, 0, 0, 0, 5, 0, 0, 0, 72, 139, 4, 37, 100, 0, 0, 0] ! (unat x - 4194304),
            REG = \<lambda>x. 0, RIP = 4194304, exception = NoException\<rparr>)"
apply(simp only: x64_fetch.simps for_loop_19_unroll)
apply(simp only: snd_def split X64_state.simps fst_def)
apply(simp only: word_arith_technical)
apply simp
done

lemma x64_decode_fixed1:
  shows "x64_decode [72, 199, 4, 37, 100, 0, 0, 0, 5, 0, 0, 0, 72, 139, 4, 37, 100, 0, 0, 0] =
    Zfull_inst ([], Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, 100), 5)), [72, 139, 4, 37, 100, 0, 0, 0])"
sorry (* XXX: true by eval *)

lemma finite_maps_equal:
  fixes f1 f2 :: "'a \<rightharpoonup> 'b"
  assumes "\<forall>x \<in> dom f1 \<union> dom f2. f1 x = f2 x"
  shows "f1 = f2"
sorry

declare [[show_types]]

lemma Run_technical_fixed1:
  shows "Run (Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, 100), 5)))
     \<lparr>EFLAGS = Map.empty, MEM = \<lambda>x. [72, 199, 4, 37, 100, 0, 0, 0, 5, 0, 0, 0, 72, 139, 4, 37, 100, 0, 0, 0] ! (unat x - 4194304), REG = \<lambda>x. 0,
        RIP = of_nat 4194304 + word_of_int (int (20 - length [72::8 word, 139, 4, 37, 100, 0, 0, 0])), exception = NoException\<rparr> =
     ((), \<lparr>EFLAGS = Map.empty,
            MEM = (\<lambda>x. [72, 199, 4, 37, 100, 0, 0, 0, 5, 0, 0, 0, 72, 139, 4, 37, 100, 0, 0, 0] ! (unat x - 4194304))
              (100 := word_extract 7 0 (word_extract 15 0 (word_extract 31 0 (5::64 word))), 101 := word_extract 15 8 (word_extract 15 0 (word_extract 31 0 (5::64 word))),
               102 := word_extract 7 0 (word_extract 31 16 (word_extract 31 0 (5::64 word))), 103 := word_extract 15 8 (word_extract 31 16 (word_extract 31 0 (5::64 word))),
               104 := word_extract 7 0 (word_extract 15 0 (word_extract 63 32 (5::64 word))), 105 := word_extract 15 8 (word_extract 15 0 (word_extract 63 32 (5::64 word))),
               106 := word_extract 7 0 (word_extract 31 16 (word_extract 63 32 (5::64 word))), 107 := word_extract 15 8 (word_extract 31 16 (word_extract 63 32 (5::64 word)))),
            REG = \<lambda>x. 0, RIP = (of_nat 4194316)::64 word, exception = NoException\<rparr>)"
  apply(simp only: Run.simps instruction.case dfn'Zmov.simps read_cond.simps Zcond.simps)
  apply(simp only: Let_def split if_True fst_def EA.simps ea_Zsrc.simps Zdest_src.case)
  apply(simp only: Zea.case restrictSize.simps Zsize.case split ea_Zdest.simps)
  apply(simp only: Zdest_src.case split write'EA.simps fst_def ea_Zrm.simps Zrm.case ea_index.simps)
  apply(simp only: option.case split Zea.case Zsize.case ea_base.simps Zbase.simps)
  apply(simp only: write'mem64.simps write'mem32.simps write'mem16.simps write'mem8.simps)
  apply(simp only: snd_def split X64_state.simps Pair_eq)
  apply(rule conjI, simp only: refl; simp only: X64_state.ext_inject)
  apply(simp only: refl simp_thms)
  apply(rule conjI)
  sorry (* XXX: weird problem with types, here *)

declare [[show_types]]

lemma x64_next_fixed1:
  shows "x64_next \<lparr>EFLAGS = Map.empty,
                                          MEM = \<lambda>x\<Colon>64 word. [72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, 100\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 72\<Colon>8 word,
                                                             139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, 100\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word] !
                                                            (unat x - (4194304\<Colon>nat)),
                                          REG = \<lambda>x\<Colon>Zreg. 0\<Colon>64 word, RIP = of_nat (4194304\<Colon>nat), exception = NoException\<rparr> =
         ((), \<lparr>EFLAGS = Map.empty,
            MEM = (\<lambda>x. [72, 199, 4, 37, 100, 0, 0, 0, 5, 0, 0, 0, 72, 139, 4, 37, 100, 0, 0, 0] ! (unat x - 4194304))
              (100 := word_extract 7 0 (word_extract 15 0 (word_extract 31 0 (5::64 word))), 101 := word_extract 15 8 (word_extract 15 0 (word_extract 31 0 (5::64 word))),
               102 := word_extract 7 0 (word_extract 31 16 (word_extract 31 0 (5::64 word))), 103 := word_extract 15 8 (word_extract 31 16 (word_extract 31 0 (5::64 word))),
               104 := word_extract 7 0 (word_extract 15 0 (word_extract 63 32 (5::64 word))), 105 := word_extract 15 8 (word_extract 15 0 (word_extract 63 32 (5::64 word))),
               106 := word_extract 7 0 (word_extract 31 16 (word_extract 63 32 (5::64 word))), 107 := word_extract 15 8 (word_extract 31 16 (word_extract 63 32 (5::64 word)))),
            REG = \<lambda>x. 0, RIP = of_nat 4194316, exception = NoException\<rparr>)"
  apply(simp only: x64_next.simps x64_fetch_fixed1 fst_def split)
  apply(simp only: x64_decode_fixed1 Zinst.case split X64_state.simps Run_technical_fixed1 word_arith_technical)
done

subsection {* The "big" theorem *}

text {* Finally, our correctness theorem which shows that our correctness property holds: *}
theorem correctness_property_True:
  shows "correctness_property"
unfolding correctness_property_def
  (* Get rid of the entry address... *)
  apply(subst Let_def)
  (* Start working on the fixed program, first: *)
  apply(simp only: fixed_program_def mov_constant_to_mem_def mov_constant_from_mem_def)
  apply(simp only: encode_fixed_program_compute concat.simps append.simps)
  apply(simp only: load_fixed_program_instructions_def)
  (* Start running the two steps of the fixed program: *)
  apply(subst Let_def)
  apply(simp only: run_two_steps_def)
(*
  (* Start working on the relocated program, now: *)
  apply(simp only: relocation_image_def relocatable_program_def mov_constant_to_mem_def mov_constant_from_mem_def)
  apply(simp only: list.map encode.simps encode_relocated_program_compute)
  apply(simp only: instruction.case split Zcond.case Zsize.case Zdest_src.case Zrm.case)
  apply(simp only: e_rm_imm_relocated_technical)
*)

term Zm

(*
section {* OLD STUFF *}

definition mov_constant_to_mem :: "64 word \<Rightarrow> 64 word \<Rightarrow> instruction" where
  "mov_constant_to_mem constant addr \<equiv> Zmov (Z_ALWAYS, (Z64, Zrm_i (Zm (None, (ZnoBase, addr)), constant)))"

definition mov_constant_from_mem :: "64 word \<Rightarrow> instruction" where
  "mov_constant_from_mem addr \<equiv> Zmov (Z_ALWAYS, (Z64, Zr_rm (RAX, Zm (None, (ZnoBase, addr)))))"

definition fixed_program :: "8 word list" where
  "fixed_program \<equiv>
    List.concat (List.map encode [
      mov_constant_to_mem (5 :: 64 word) (100 :: 64 word)
    , mov_constant_from_mem (100 :: 64 word)
    ])"

definition relocatable_program :: "8 word list" where
  "relocatable_program \<equiv>
     List.concat (List.map encode [
       mov_constant_to_mem (5 :: 64 word) (0 :: 64 word)
     , mov_constant_from_mem (0 :: 64 word)
     ])"

definition relocation_image :: "Abis.any_abi_feature annotated_memory_image" where
  "relocation_image \<equiv> img1 relocatable_program"

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

definition load_program :: "8 word list \<Rightarrow> nat \<Rightarrow> X64_state" where
  "load_program p entry_point \<equiv>
     \<lparr> EFLAGS = Map.empty (* XXX: or False? *)
     , MEM = \<lambda>x. p ! (unat x - entry_point)
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

lemma let_ext:
  shows "let (x, y) = (u, v) in q x y = q u v"
by auto

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
                      \<lparr>startpos = Some 4194304, length1 = Some 20,
                         contents = map Some (e_rm_imm (Z64, Zm (None, ZnoBase, 0), 5, 0, 198)) @ map Some (e_rm_reg (Z64, Zm (None, ZnoBase, 0), word_of_int (int (Zreg_to_nat RAX)), [], 138))\<rparr>,
                      ''.data'' \<mapsto> \<lparr>startpos = Some 4194324, length1 = Some 8, contents = map Some (replicate 8 (of_nat 42))\<rparr>]
                      a \<noteq>
                     None} = { ''.text'', ''.data''}"
  by auto

lemma rels_lemma:
  shows "{s. \<forall>k\<in>{''.text'', ''.data''}.
                        Some s = [''.text'' \<mapsto>
                                  \<lparr>startpos = Some 4194304, length1 = Some 20,
                                     contents = map Some (e_rm_imm (Z64, Zm (None, ZnoBase, 0), 5, 0, 198)) @
                                                map Some (e_rm_reg (Z64, Zm (None, ZnoBase, 0), word_of_int (int (Zreg_to_nat RAX)), [], 138))\<rparr>,
                                  ''.data'' \<mapsto> \<lparr>startpos = Some 4194324, length1 = Some 8, contents = map Some (replicate 8 (of_nat 42))\<rparr>]
                                  k \<and>
                        the (startpos s) \<le> off \<and> off \<le> the (startpos s) + the (length1 s)} =
                               { \<lparr>startpos = Some 4194304, length1 = Some 16,
                                            contents = map Some (e_rm_imm (Z64, Zm (None, ZnoBase, 0), 5, 0, 198)) @
                                                       map Some (e_rm_reg (Z64, Zm (None, ZnoBase, 0), word_of_int (int (Zreg_to_nat RAX)), [], 138))\<rparr> }"
sorry

lemma the_elem_lemma:
  shows "the_elem { e } = e"
  by auto

lemma word_calc_lemma:
  shows "unat (of_nat 4194304 + word_of_int (int x)) = 4194304 + x"
sorry

lemma the_startpos_lemma:
  shows "the (startpos \<lparr>startpos = Some 4194304, length1 = Some 20,
                                  contents = map Some (e_rm_imm (Z64, Zm (None, ZnoBase, 0), 5, 0, 198)) @
                                             map Some (e_rm_reg (Z64, Zm (None, ZnoBase, 0), word_of_int (int (Zreg_to_nat RAX)), [], 138))\<rparr>) = 4194304"
  by auto

lemma signed_arith_lemma1:
  shows "(18446744071562067968 <=s 0 \<and> 0 <=s 2147483647) = True"
sorry

lemma signed_arith_lemma2:
  shows "(18446744071562067968 <=s 5 \<and> 5 <=s 2147483647) = True"
sorry

lemma signed_arith_lemma3:
  shows "(18446744071562067968 <=s 100 \<and> 100 <=s 2147483647) = True"
sorry

value "((word_cat (0::32 word) (word_cat ((word_extract 3 3 0)::16 word) (0::16 word)))::64 word) OR (8::64 word)"

lemma word_cat_lemma:
  shows "(word_cat 0 (word_cat (word_extract 3 3 0) 0) OR 8 = 0) = True"
sorry

lemma x64_fetch_lemma1:
  shows "x64_fetch \<lparr>EFLAGS = Map.empty,
                        MEM = \<lambda>a. X64_memory_of_memory_image
                                   [''.text'' \<mapsto>
                                    \<lparr>startpos = Some 4194304, length1 = Some 20,
                                       contents = map Some (e_rm_imm (Z64, Zm (None, ZnoBase, 0), 5, 0, 198)) @
                                                  map Some (e_rm_reg (Z64, Zm (None, ZnoBase, 0), word_of_int (int (Zreg_to_nat RAX)), [], 138))\<rparr>,
                                    ''.data'' \<mapsto> \<lparr>startpos = Some 4194324, length1 = Some 8, contents = map Some (replicate 8 (of_nat 42))\<rparr>]
                                   (unat a),
                        REG = \<lambda>x. 0, RIP = of_nat 4194304, exception = NoException\<rparr> = ([72, 199, 4, 37, 0, 0, 0, 0, 5, 0, 0, 0], \<lparr>EFLAGS = Map.empty, MEM = \<lambda>a. the ([] ! (unat a - 4194304)), REG = \<lambda>x. 0, RIP = 4194316, exception = NoException\<rparr>)"
sorry

lemma x64_fetch_lemma2:
  shows "x64_fetch (load_program fixed_program 4194304) = ([72, 199, 4, 37, 0, 0, 0, 0, 5, 0, 0, 0], \<lparr>EFLAGS = Map.empty, MEM = \<lambda>a. the ([] ! (unat a - 4194304)), REG = \<lambda>x. 0, RIP = 4194316, exception = NoException\<rparr>)"
sorry

value "x64_decode
               (fst (snd (for_loop (19, 0, \<lambda>i state. ((), MEM (snd state) (RIP (snd state) + word_of_int (int i)) # fst state, snd state))
                           ([], \<lparr>EFLAGS = Map.empty, MEM = \<lambda>x. fixed_program ! (unat x - 4194304), REG = \<lambda>x. 0, RIP = of_nat 4194304, exception = NoException\<rparr>))))"

lemma x64_decode_lemma1:
  shows "x64_decode
               (fst (snd (for_loop (19, 0, \<lambda>i state. ((), MEM (snd state) (RIP (snd state) + word_of_int (int i)) # fst state, snd state))
                           ([], \<lparr>EFLAGS = Map.empty, MEM = \<lambda>x. fixed_program ! (unat x - 4194304), REG = \<lambda>x. 0, RIP = of_nat 4194304, exception = NoException\<rparr>)))) = xxx"

(*  apply(simp only: x64_fetch.simps)
  apply(simp only: Let_def)
  apply(simp only: for_loop_19_unroll)
  apply(simp only: split fst_def snd_def)
  apply(simp only: X64_state.simps)
  apply(simp only: X64_memory_of_memory_image.simps)

  apply(simp only: dom_def; simp only: dom_lemma)

  apply(subst Let_def; simp only: let_weak_cong[OF rels_lemma];
          subst Let_def; simp only: the_elem_lemma; subst Let_def; simp only: element.simps option.sel word_calc_lemma;
          subst Let_def; subst Let_def)+
  apply(simp only: e_rm_reg.simps e_rm_imm.simps)
  apply(simp only: e_ModRM.simps Zrm.case split option.case Zbase.case)
  apply(simp only: e_imm32.simps)
  apply(simp only: signed_arith_lemma1 if_True list.case split append.simps)
  apply(simp only: e_opsize_imm.simps e_opsize.simps Zsize.case Let_def split)
  apply(simp only: refl simp_thms if_True Zsize.case)
  apply(simp only: e_imm32.simps signed_arith_lemma2 if_True list.case option.case split)
  apply(simp only: concat.simps append.simps)
  apply(simp only: rex_prefix.simps word_cat_lemma if_True append.simps list.map nth.simps)
  apply simp
(*
  list.case split list.map append.simps)
  apply(simp only: e_gen_rm_reg.simps)
  apply(simp only: e_ModRM.simps Zrm.case split option.case Zbase.case)
  apply(simp only: e_imm32.simps; simp only: signed_arith_lemma if_False list.case split list.map append.simps)
  apply(simp)
*)
oops
*)

(*
  apply(subst Let_def; simp only: let_weak_cong[OF rels_lemma];
          subst Let_def; simp only: the_elem_lemma; subst Let_def; simp only: element.simps option.sel word_calc_lemma;
          subst Let_def; subst Let_def)
*)
(*
  apply(simp only: dom_def)
  apply(simp only: dom_lemma)
  apply(subst Let_def)
  apply(simp only: let_weak_cong[OF rels_lemma])
  apply(subst Let_def)
  apply(simp only: the_elem_lemma)
  apply(subst Let_def)
  apply(simp only: word_calc_lemma)
  apply(simp only: the_startpos_lemma)
  apply(subst Let_def)
  apply(simp only: element.simps)
  apply(subst diff_self_eq_0)
  apply(subst Let_def)
*)

lemma x64_decode_lemma:
  shows "x64_decode [72, 199, 4, 37, 0, 0, 0, 0, 5, 0, 0, 0] = Zfull_inst ([], Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, 0), 5)), [])"
by eval

lemma subst_hyp:
  assumes "x = y" and "P x \<Longrightarrow> Q"
  shows "P y \<Longrightarrow> Q"
using assms by auto

theorem at_least_some_relocations_relocate:
    fixes ef :: elf64_file and segs_and_provenance :: "(elf64_interpreted_segment \<times> segment_provenance) list" and entry :: "nat"
            and rstate final_fixed_state final_relocatable_state :: "X64_state"
  assumes "i = elements relocation_image" and "entry = 4194304"
      and "rstate = load_image i entry"
      and "fstate = load_program fixed_program entry"
      and "final_fixed_state = execute_two_steps fstate"
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
  apply(erule subst_hyp[where y ="None" and x="findLowestKVWithKEquivTo (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                          (instance_Basic_classes_Ord_Maybe_maybe_dict
                            (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                              (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
                          (SymbolRef null_symbol_reference_and_reloc_site) (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict)
                          {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1\<Colon>nat, 4\<Colon>nat)), (SymbolDef def_rec0, Some (''.data'', 0\<Colon>nat, 8\<Colon>nat))} None"])
  apply(simp only: option.case foldl.simps annotated_memory_image.simps)+
  apply(simp only: execute_two_steps_def load_image_def)
  apply(simp only: x64_fetch_lemma1)
  apply(simp only: Let_def split x64_decode_lemma Zinst.case)
  apply(simp only: Run.simps instruction.case dfn'Zmov.simps read_cond.simps Zcond.case Let_def split)
  apply(simp only: if_True ea_Zsrc.simps Zdest_src.case split fst_def EA.simps Zea.case)
  apply(simp only: ea_Zdest.simps Zdest_src.case Zrm.case split fst_def ea_Zrm.simps ea_index.simps)
  apply(simp only: option.case split ea_base.simps Zbase.case restrictSize.simps Zsize.case)
  apply(simp only: write'EA.simps Zea.case split Zsize.case write'mem64.simps write'mem32.simps write'mem16.simps)
  apply(simp only: write'mem8.simps snd_def split unit.case X64_state.simps add_0)
  apply(simp only: load_program_def x64_fetch.simps Let_def split)

thm restrictSize.simps
term MEM
*)
end