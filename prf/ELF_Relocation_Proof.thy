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
definition fixed_program :: "nat \<Rightarrow> 8 word list" where
  "fixed_program addr \<equiv>
     let (addr::64 word) = of_nat addr in
       List.concat (List.map encode [
         mov_constant_to_mem (5 :: 64 word) addr
      , mov_constant_from_mem addr
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
definition relocation_image :: "nat \<Rightarrow> Abis.any_abi_feature annotated_memory_image" where
  "relocation_image addr \<equiv> img1 addr relocatable_program"

text {* Produce an X64 memory (a map from addresses to bytes) out of a memory image that we will
obtain from the relocation_image above. *}
definition X64_memory_of_memory_image :: "memory_image \<Rightarrow> (nat \<Rightarrow> 8 word)" where
  "X64_memory_of_memory_image i addr =
     (* XXX: must be a better way than this, surely... *)
     (let keys = Map.dom i in
      let rels = { s. \<forall>k \<in> keys. Some s = i k \<and> addr \<ge> the (startpos s) \<and> addr \<le> the (startpos s) + the (length1 s) } in
      let arb  = Set.the_elem rels in
      let reba = addr - the (startpos arb) in
      let byte = List.nth (contents arb) reba in
        the byte)"

text {* Produces an initial state for the X64 emulation out of a memory_image (which will be converted
to a memory, per the definition above) and a fixed start address for the instruction pointer.  This
start address must match the start addresses of the .text section specified in Test_image.thy). *}
definition load_relocated_program_image :: "(Zeflags \<Rightarrow> bool option) \<Rightarrow> memory_image \<Rightarrow> (Zreg \<Rightarrow> 64 word)
      \<Rightarrow> nat \<Rightarrow> X64_state" where
  "load_relocated_program_image flags i reg entry_point \<equiv>
     \<lparr> EFLAGS = flags
     , MEM = \<lambda>a. X64_memory_of_memory_image i (unat a)
     , REG = reg
     , RIP = of_nat entry_point
     , exception = NoException
     \<rparr>"

text {* The following is a helper function that creates an association list of memory addresses and
bytes which we will use to set up the initial memory (code) contents of the fixed program's initial
X64 state. *}
fun build_fixed_program_code_memory :: "8 word list \<Rightarrow> nat \<Rightarrow> (nat \<times> 8 word) list" where
  "build_fixed_program_code_memory [] addr = []" |
  "build_fixed_program_code_memory (x#xs) addr = (addr, x)#build_fixed_program_code_memory xs (Suc addr)"

text {* Build the program memory for the fixed program. *}
definition build_fixed_program_memory :: "nat \<Rightarrow> 8 word list \<Rightarrow> 64 word \<Rightarrow> 8 word" where
  "build_fixed_program_memory entry_point program x \<equiv>
     let code_mem = map_of (build_fixed_program_code_memory program entry_point) in
       (case code_mem (unat x) of
         None \<Rightarrow> 0
       | Some x \<Rightarrow> x)"

text {* Produces an initial state for the X64 emulation out of the encoded instructions of our fixed
program above, and a fixed start address for the instruction pointer.  This start address must match
the start address of the .text section specified in Test_image.thy. *}
definition load_fixed_program_instructions :: "(Zeflags \<Rightarrow> bool option) \<Rightarrow> 8 word list \<Rightarrow>
    (Zreg \<Rightarrow> 64 word) \<Rightarrow> nat \<Rightarrow> X64_state" where
  "load_fixed_program_instructions flags p reg entry_point \<equiv>
       \<lparr> EFLAGS = flags
       , MEM = build_fixed_program_memory entry_point p
       , REG = reg
       , RIP = of_nat entry_point
       , exception = NoException
       \<rparr>"

text {* Executes two steps of the X64 emulation given a fixed X64 state, returning a new state.  This
will be sufficient to execute both programs above to their conclusion. *}
definition run_two_steps :: "X64_state \<Rightarrow> X64_state" where
  "run_two_steps \<sigma> \<equiv> snd (x64_next (snd (x64_next \<sigma>)))"

definition address_is_disjoint_from_text_and_within_data_section :: "nat \<Rightarrow> nat \<Rightarrow> nat \<Rightarrow> nat \<Rightarrow> nat \<Rightarrow> bool" where
  "address_is_disjoint_from_text_and_within_data_section addr text_start data_start program_len data_len \<equiv>
     (* Address is not within data section *)
     \<not> (addr \<ge> text_start \<and> addr \<le> text_start + program_len) \<and>
       (addr \<ge> data_start \<and> addr \<le> data_start + data_len)"

fun possible_addresses :: "nat \<Rightarrow> nat \<Rightarrow> nat \<Rightarrow> bool" where
  "possible_addresses start 0 addr = (addr = start)" |
  "possible_addresses start (Suc cnt) addr =
     (addr = start \<or> possible_addresses (Suc start) cnt addr)"

text {* We now have our (rather silly) correctness property, which serves to demonstrate that our
definitions are capable of supporting formal proof.  If we set the Isabelle execution mechanism up
correctly we could just execute this to obtain our theorem, but we will use proof instead.  Creating
two initial states for the X64 emulation out of our fixed and relocated program, we run them for two
steps and demonstrate that the contents of their registers are the same after execution.  In
particular, both RAX registers will contain the immediate constant, 5. *}
definition correctness_property :: "bool" where
  "correctness_property \<equiv>
     \<forall>addr::nat. \<forall>flags :: Zeflags \<Rightarrow> bool option. \<forall>reg :: Zreg \<Rightarrow> 64 word.
       let fprogr  = fixed_program addr in

       let text_start   = 4194304 in (* Fixed in Test_image *)
       let data_start   = 4194324 in (* Fixed in Test_image *)
       let program_len  = List.length fprogr in
       let data_len     = 8 in      (* Fixed in Test_image *)

       let fstate1 = load_fixed_program_instructions flags fprogr reg text_start in
       let fstate2 = run_two_steps fstate1 in
       let rstate1 = load_relocated_program_image flags (elements (relocation_image addr)) reg text_start in
       let rstate2 = run_two_steps rstate1 in

       address_is_disjoint_from_text_and_within_data_section addr text_start data_start program_len data_len \<longrightarrow>
           rstate2 = fstate2"

subsection {* Lemmas *}

(* XXX: in library, somewhere?  find_theorems doesn't find it, sigh... *)
lemma nat_lesseq_elim:
  fixes m n :: nat
  assumes "m \<le> n"
  shows "m = n \<or> m < n"
using assms by auto

lemma possible_addresses_elim:
  assumes "address_is_disjoint_from_text_and_within_data_section addr text_start data_start program_len data_len"
  shows "possible_addresses data_start data_len addr"
sorry

text {* The following is an ugly lemma that is necessary for controlling the unrolling of the for_loop
function used in Anthony's model, otherwise the simplifier loops uncontrollably. *}
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
  apply simp
done

text {* Key lemma: if we fetch from a given state, then we are given a 20-element list back in return,
read from the state's memory at RIP+offset for 0 \<le> offset < 20, with the original state returned as
second component. *}
lemma x64_fetch_RIP:
  shows "x64_fetch \<sigma> =
    ([MEM \<sigma> (RIP \<sigma>), MEM \<sigma> (RIP \<sigma> + 1), MEM \<sigma> (RIP \<sigma> + 2), MEM \<sigma> (RIP \<sigma> + 3),
      MEM \<sigma> (RIP \<sigma> + 4), MEM \<sigma> (RIP \<sigma> + 5), MEM \<sigma> (RIP \<sigma> + 6), MEM \<sigma> (RIP \<sigma> + 7),
      MEM \<sigma> (RIP \<sigma> + 8), MEM \<sigma> (RIP \<sigma> + 9), MEM \<sigma> (RIP \<sigma> + 10), MEM \<sigma> (RIP \<sigma> + 11),
      MEM \<sigma> (RIP \<sigma> + 12), MEM \<sigma> (RIP \<sigma> + 13), MEM \<sigma> (RIP \<sigma> + 14), MEM \<sigma> (RIP \<sigma> + 15),
      MEM \<sigma> (RIP \<sigma> + 16), MEM \<sigma> (RIP \<sigma> + 17), MEM \<sigma> (RIP \<sigma> + 18), MEM \<sigma> (RIP \<sigma> + 19)], \<sigma>)"
  apply(simp only: x64_fetch.simps)
  apply(simp only: for_loop_19_unroll snd_def fst_def split Let_def Word.word_of_nat)
  apply simp
done

text {* The following are technical lemmas that should hopefully be proved properly rather than with
evaluation. *}

lemma prefixGroup_72:
  shows "prefixGroup 72 = 5"
by eval (* XXX *)

lemma to_bl_199:
  shows "to_bl (199::8 word) = [True, True, False, False, False, True, True, True]"
by eval (* XXX *)

lemma to_bl_139:
  shows "to_bl (139::8 word) = [True, False, False, False, True, False, True, True]"
by eval (* XXX *)

lemma to_bl_37:
  shows "to_bl (37\<Colon>8 word) = [False, False, True, False, False, True, False, True]"
by eval (* XXX *)

lemma to_bl_4:
  shows "to_bl (4\<Colon>8 word) = [False, False, False, False, False, True, False, False]"
by eval (* XXX *)

lemma of_bl_True:
  shows "of_bl [True] = (1::1 word)"
by eval

lemma of_bl_False_False:
  shows "of_bl [False, False] = (0::2 word)"
by eval (* XXX *)

lemma word_extract_3_0_72:
  shows "((word_extract 3 0 (72::8 word))::4 word) = (8::4 word)"
by eval (* XXX *)

lemma bang_bang_8_0:
  shows "((8\<Colon>4 word) !! (0\<Colon>nat)) = False"
by eval (* XXX *)

lemma bang_bang_8_1:
  shows "((8\<Colon>4 word) !! (1\<Colon>nat)) = False"
by eval (* XXX *)

lemma bang_bang_8_2:
  shows "((8\<Colon>4 word) !! (2\<Colon>nat)) = False"
by eval

lemma bang_bang_8_3:
  shows "((8\<Colon>4 word) !! (3\<Colon>nat)) = True"
by eval (* XXX *)

lemma nat_to_Zreg_RSP:
  shows "nat_to_Zreg (nat (uint ((word_cat (0\<Colon>1 word) ((of_bl [True, False, False])::3 word))::4 word))) = RSP"
by eval (* XXX *)

lemma nat_to_Zreg_RBP:
  shows "nat_to_Zreg (nat (uint ((word_cat (0\<Colon>1 word) ((of_bl [True, False, True])::3 word))::4 word))) = RBP"
by eval (* XXX *)

lemma nat_to_Zreg_RAX:
  shows "nat_to_Zreg (nat (uint ((word_cat (0::1 word) ((of_bl [False, False, False])::3 word))::4 word))) = RAX"
by eval (* XXX *)

lemma signed_arith_lemma_5:
  shows "18446744071562067968 <=s (5::64 word) \<and> (5::64 word) <=s 2147483647"
by eval (* XXX *)

lemma word_cat_8:
  shows "word_cat (0\<Colon>1 word) ((word_cat ((word_extract (3\<Colon>nat) (3\<Colon>nat) (0\<Colon>4 word))::1 word) (0\<Colon>2 word))::3 word) OR (8\<Colon>4 word) = (8::4 word)"
by eval (* XXX *)

lemma word_cat_4_8_72:
  shows "((word_cat (4\<Colon>4 word) (8\<Colon>4 word))::8 word) = (72::8 word)"
by eval (* XXX *)

lemma word_cat_4:
  shows "((word_cat (0\<Colon>2 word) ((word_cat ((word_extract (2\<Colon>nat) (0\<Colon>nat) (0\<Colon>4 word))::3 word) (4\<Colon>3 word))::6 word))::8 word) = (4::8 word)"
by eval (* XXX *)

lemma word_extract_7_0_5:
  shows "word_extract (7\<Colon>nat) (0\<Colon>nat) (5\<Colon>64 word) = (5::8 word)"
by eval (* XXX *)

lemma word_extract_15_8_5:
  shows "word_extract (15\<Colon>nat) (8\<Colon>nat) (5\<Colon>64 word) = (0::8 word)"
by eval (* XXX *)

lemma word_extract_23_16_5:
  shows "word_extract (23\<Colon>nat) (16\<Colon>nat) (5\<Colon>64 word) = (0::8 word)"
by eval (* XXX *)

lemma word_extract_31_24_5:
  shows "word_extract (31\<Colon>nat) (24\<Colon>nat) (5\<Colon>64 word) = (0::8 word)"
by eval (* XXX *)

lemma OR_198_1:
  shows "(((198\<Colon>8 word) OR (1\<Colon>8 word))::8 word) = (199::8 word)"
by eval

lemma OR_138_1:
  shows "(138\<Colon>8 word) OR (1\<Colon>8 word) = (139\<Colon>8 word)"
by eval

lemma word_of_int_of_int_0:
  shows "(word_of_int (int (0\<Colon>nat))::'a::len word) = (0::'a word)"
by simp

lemma word_arith_technical:
  assumes "m \<ge> 0"
  shows "of_nat n + word_of_int (int m) = of_nat (n + m)"
by (metis Abs_fnat_hom_add of_int_of_nat_eq word_of_int)

lemma numeral_4_eq_4:
  shows "(4::nat) = Suc (Suc (Suc (Suc 0)))"
by simp

lemma numeral_5_eq_5:
  shows "(5::nat) = Suc (Suc (Suc (Suc (Suc 0))))"
by simp

lemma numeral_6_eq_6:
  shows "(6::nat) = Suc (Suc (Suc (Suc (Suc (Suc 0)))))"
by simp

lemma numeral_7_eq_7:
  shows "(7::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))"
by simp

lemma numeral_8_eq_8:
  shows "(8::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))"
by simp

lemma numeral_9_eq_9:
  shows "(9::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))))"
by simp

lemma numeral_10_eq_10:
  shows "(10::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))))"
by simp

lemma numeral_11_eq_11:
  shows "(11::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))))))"
by simp

lemma numeral_12_eq_12:
  shows "(12::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))))))"
by simp

lemma numeral_13_eq_13:
  shows "(13::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))))))))"
by simp

lemma numeral_14_eq_14:
  shows "(14::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))))))))"
by simp

lemma numeral_15_eq_15:
  shows "(15::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))))))))))"
by simp

lemma numeral_16_eq_16:
  shows "(16::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))))))))))"
by simp

lemma numeral_17_eq_17:
  shows "(17::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))))))))))))"
by simp

lemma numeral_18_eq_18:
  shows "(18::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))))))))))))"
by simp

lemma numeral_19_eq_19:
  shows "(19::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))))))))))))))"
by simp

lemma x64_decode_Zmov_in:
  assumes "ss = [72, 199, 4, 37] @ [a1, a2, a3, a4] @ [c1, c2, c3, c4] @ rest" and
    "immediate32 (a1 # a2 # a3 # a4 # c1 # c2 # c3 # c4 # rest) = (addr, i)" and
    "immediate32 i = (cnst, rest)"
  shows "x64_decode ss = Zfull_inst ([], Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, addr), cnst)), rest)"
using assms
  apply(clarify)
  apply(simp only: append.simps x64_decode.simps readPrefixes.simps)
  apply(subst readPrefix.simps)
  apply(simp only: list.case prefixGroup_72)
  apply(simp only: Let_def refl if_True)
  apply(subst if_weak_cong[where b="5=0" and c="False"])
  apply simp
  apply(simp only: option.case if_False split)
  apply(subst if_weak_cong[where b="W (rec'REX (word_extract 3 0 72)) \<and> 102 \<in> set []" and c="False"])
  apply simp
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="103 \<in> set []" and c="False"], simp)
  apply(simp only: if_False list.case boolify'8.simps to_bl_199)
  apply(simp only: split list.cases bool.case rec'REX.simps REX.defs)
  apply(simp only: readOpcodeModRM.simps readModRM.simps list.case boolify'8.simps)
  apply(simp only: to_bl_4 list.case split bool.case readSIB.simps REX.simps boolify'8.simps)
  apply(simp only: to_bl_37 list.case split)
  apply(simp only: word_extract_3_0_72 RexReg.simps bang_bang_8_0 bang_bang_8_1 bang_bang_8_3 if_False if_True)
  apply(simp only: Let_def nat_to_Zreg_RBP refl if_True readSibDisplacement.simps simp_thms if_False)
  apply(simp only: of_bl_False_False simp_thms if_True of_bl_True OpSize.simps)
  apply(subst if_weak_cong[where b="(1\<Colon>1 word) = (0\<Colon>1 word)" and c="False"])
  apply simp
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="(1\<Colon>1 word) = (0\<Colon>1 word)" and c="False"], simp)
  apply(simp only: if_False nat_to_Zreg_RSP)
  apply(subst if_weak_cong[where b="(0\<Colon>2 word) = (1\<Colon>2 word)" and c="False"], simp)
  apply(simp only: if_False refl if_True bang_bang_8_2 split immediate.simps Zsize.case)
  apply(subst if_weak_cong[where b="word_of_int (int (Zreg_to_nat (nat_to_Zreg (nat (uint (word_cat (0\<Colon>1 word) (of_bl [False, False, False]))))) mod (8\<Colon>nat))) = (0::3 word)" and c="True"])
  apply eval
  apply simp
done

lemma x64_decode_Zmov_out:
  assumes "ss = [72, 139, 4, 37] @ [a1, a2, a3, a4] @ rest" and
    "immediate32 (a1 # a2 # a3 # a4 # rest) = (addr, rest)"
  shows "x64_decode ss = Zfull_inst ([], Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, addr))), rest)"
using assms
  apply(clarify)
  apply(simp only: append.simps x64_decode.simps readPrefixes.simps)
  apply(subst readPrefix.simps)
  apply(simp only: list.case prefixGroup_72)
  apply(simp only: Let_def refl if_True)
  apply(subst if_weak_cong[where b="5=0" and c="False"])
  apply simp
  apply(simp only: option.case if_False split)
  apply(subst if_weak_cong[where b="W (rec'REX (word_extract 3 0 72)) \<and> 102 \<in> set []" and c="False"])
  apply simp
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="103 \<in> set []" and c="False"], simp)
  apply(simp only: if_False list.case boolify'8.simps to_bl_199)
  apply(simp only: split list.cases bool.case rec'REX.simps REX.defs)
  apply(simp only: readOpcodeModRM.simps readModRM.simps list.case boolify'8.simps)
  apply(simp only: to_bl_139 list.case split bool.case to_bl_4 readSIB.simps REX.simps boolify'8.simps)
  apply(simp only: to_bl_37 list.case split)
  apply(simp only: word_extract_3_0_72 RexReg.simps bang_bang_8_0 bang_bang_8_1 bang_bang_8_3 if_False if_True)
  apply(simp only: Let_def nat_to_Zreg_RBP refl if_True readSibDisplacement.simps simp_thms if_False)
  apply(simp only: of_bl_False_False simp_thms if_True of_bl_True OpSize.simps)
  apply(subst if_weak_cong[where b="(0\<Colon>2 word) = (1\<Colon>2 word)" and c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="(1\<Colon>1 word) = (0\<Colon>1 word)" and c="False"], simp)
  apply(simp only: if_False)
  apply(simp only: nat_to_Zreg_RSP refl if_True split)
  apply(subst if_weak_cong[where b="(1\<Colon>1 word) = (0\<Colon>1 word)" and c="False"], simp)
  apply(simp only: if_False bang_bang_8_2 nat_to_Zreg_RAX)
done

lemma encode_Zmov_in_concrete:
  (* assumes "fst (immediate32 [a1, a2, a3, a4]) = addr" *)
  assumes "(18446744071562067968::64 word) <=s addr \<and> addr <=s (2147483647::64 word)"
    and "word_extract 7 0 addr = a1" and "word_extract 15 8 addr = a2" and "word_extract 23 16 addr = a3"
    and "word_extract 31 24 addr = a4"
  shows "encode (Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, addr), 5))) =
    [72, 199, 4, 37, a1, a2, a3, a4, 5, 0, 0, 0]"
using assms
  apply(simp only: encode.simps instruction.case split Zcond.case Zsize.case)
  apply(simp only: Zdest_src.case split Zrm.case)
  apply(simp only: e_rm_imm.simps e_ModRM.simps Zrm.case split option.case)
  apply(simp only: Zbase.case list.case split append.simps)
  apply(simp only: e_opsize_imm.simps e_opsize.simps Zsize.case)
  apply(subst if_weak_cong[where b="Z64 = Z64 \<and> True" and c="True"], simp)
  apply(simp only: if_True Zsize.case Let_def split)
  apply(simp only: e_imm32.simps signed_arith_lemma_5 simp_thms if_True list.case)
  apply(simp only: option.case split concat.simps)
  apply(simp only: rex_prefix.simps word_cat_8)
  apply(subst if_weak_cong[where b="(8\<Colon>4 word) = (0\<Colon>4 word)" and c="False"], simp)
  apply(simp only: if_False append.simps word_cat_4_8_72 OR_198_1 word_cat_4)
  apply(simp only: list.simps refl simp_thms word_extract_7_0_5 word_extract_15_8_5)
  apply(simp only: word_extract_23_16_5 simp_thms word_extract_31_24_5 append.simps list.simps)
done

lemma encode_Zmov_out_concrete:
  assumes "(18446744071562067968::64 word) <=s addr \<and> addr <=s (2147483647::64 word)" and
    "word_extract 7 0 addr = a1" and "word_extract 15 8 addr = a2" and "word_extract 23 16 addr = a3"
      and "word_extract 31 24 addr = a4"
  shows "encode (Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, addr)))) = [72, 139, 4, 37, a1, a2, a3, a4]"
using assms
  apply(simp only: encode.simps instruction.case split Zcond.case Zsize.case)
  apply(simp only: Zdest_src.case split Zrm.case)
  apply(simp only: e_rm_reg.simps e_gen_rm_reg.simps e_ModRM.simps)
  apply(simp only: Zrm.case split option.case Zbase.case)
  apply(simp only: e_imm32.simps simp_thms if_True list.case split append.simps)
  apply(simp only: e_opsize.simps Zsize.case)
  apply(simp only: rex_prefix.simps Zreg_to_nat.simps Zreg.case word_of_int_of_int_0)
  apply(simp only: word_cat_8)
  apply(subst if_weak_cong[where b="(8\<Colon>4 word) = (0\<Colon>4 word)" and c="False"], simp)
  apply(simp only: if_False Let_def split concat.simps append.simps list.simps)
  apply(simp only: simp_thms word_cat_4_8_72 OR_138_1 word_of_int_of_int_0 word_cat_4)
done

lemma build_fixed_program_memory_commute:
  assumes "addr \<le> l \<and> l \<le> addr + List.length bytes"
  shows "(build_fixed_program_memory addr bytes) (of_nat l) = bytes ! (l - addr)"
sorry

lemma of_nat_manipulate:
  "(of_nat m) + (n::'a::len word) = of_nat (m + unat n)"
by simp

lemma rip_technical_12:
  shows "(4194316\<Colon>64 word) = (((4194304::64 word) + ((of_nat 12)::64 word))::64 word)"
by simp

lemma word_cat_OR_8:
  shows "(word_cat (0\<Colon>1 word) ((word_cat (0\<Colon>1 word) (0\<Colon>2 word))::3 word)::4 word) OR (8\<Colon>4 word) = (8::4 word)"
by eval (* XXX *)

lemma x64_decode_fixed_technical_1:
  assumes "(18446744071562067968::64 word) <=s (addr::64 word) \<and> addr <=s (2147483647::64 word)" and
    "word_extract 7 0 addr = a1" and "word_extract 15 8 addr = a2" and "word_extract 23 16 addr = a3"
      and "word_extract 31 24 addr = a4"
  shows "x64_decode (fst (x64_fetch \<lparr>EFLAGS = flags,
    MEM = build_fixed_program_memory 4194304 (encode (mov_constant_to_mem 5 addr) @ encode (mov_constant_from_mem addr)),
    REG = reg, RIP = of_nat 4194304, exception = NoException\<rparr>)) = Zfull_inst ([], Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, addr), 5)), [72, 139, 4, 37, a1, a2, a3, a4])"
using assms
  apply(simp only: x64_fetch_RIP X64_state.simps)
  apply(simp only: fst_def split append.simps list.simps)
  apply(rule x64_decode_Zmov_in)
  apply(simp only: append.simps list.simps mov_constant_to_mem_def mov_constant_from_mem_def)
  apply(intro conjI)
  apply(subst encode_Zmov_out_concrete, assumption, (rule refl)+, subst encode_Zmov_in_concrete, assumption, (rule refl)+,
    subst build_fixed_program_memory_commute, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp only: nth.simps nat.case)
  apply(subst encode_Zmov_out_concrete, assumption, (rule refl)+, subst encode_Zmov_in_concrete, assumption, (rule refl)+,
    subst of_nat_manipulate, subst build_fixed_program_memory_commute, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp)
  apply(subst encode_Zmov_out_concrete, assumption, (rule refl)+, subst encode_Zmov_in_concrete, assumption, (rule refl)+,
    subst of_nat_manipulate, subst build_fixed_program_memory_commute, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp)
  apply(subst encode_Zmov_out_concrete, assumption, (rule refl)+, subst encode_Zmov_in_concrete, assumption, (rule refl)+,
    subst of_nat_manipulate, subst build_fixed_program_memory_commute, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp)
  apply(subst encode_Zmov_out_concrete, assumption, rule refl, rule refl, rule refl, rule refl,
    subst encode_Zmov_in_concrete, assumption, rule refl, rule refl, rule refl, rule refl,
    subst of_nat_manipulate, subst build_fixed_program_memory_commute, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp)
  apply(subst encode_Zmov_out_concrete, assumption, rule refl, rule refl, rule refl, rule refl,
    subst encode_Zmov_in_concrete, assumption, rule refl, rule refl, rule refl, rule refl,
    subst of_nat_manipulate, subst build_fixed_program_memory_commute, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp)
  apply(subst encode_Zmov_out_concrete, assumption, rule refl, rule refl, rule refl, rule refl,
    subst encode_Zmov_in_concrete, assumption, rule refl, rule refl, rule refl, rule refl,
    subst of_nat_manipulate, subst build_fixed_program_memory_commute, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp)
  apply(rule conjI)
  apply(rule impI, simp only: word_cat_OR_8, simp)
  apply(rule impI, simp only: word_cat_OR_8)
sorry

lemma x64_decode_fixed_technical_2:
  assumes "(18446744071562067968::64 word) <=s (addr::64 word) \<and> addr <=s (2147483647::64 word)" and
    "word_extract 7 0 addr = a1" and "word_extract 15 8 addr = a2" and "word_extract 23 16 addr = a3"
      and "word_extract 31 24 addr = a4"
  shows "x64_decode
                  (fst (x64_fetch (snd (write'EA (5\<Colon>64 word, Zea_m (Z64, addr))
                                         \<lparr>EFLAGS = flags,
                                            MEM = build_fixed_program_memory (4194304\<Colon>nat) (encode (mov_constant_to_mem (5\<Colon>64 word) addr) @ encode (mov_constant_from_mem addr)),
                                            REG = reg,
                                            RIP = of_nat (4194304\<Colon>nat) +
                                                  word_of_int
                                                   (int ((20\<Colon>nat) -
                                                         length [72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, word_extract (7\<Colon>nat) (0\<Colon>nat) addr, word_extract (15\<Colon>nat) (8\<Colon>nat) addr,
                                                                 word_extract (23\<Colon>nat) (16\<Colon>nat) addr, word_extract (31\<Colon>nat) (24\<Colon>nat) addr])),
                                            exception = NoException\<rparr>)))) = Zfull_inst([], Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, addr))), [])"
sorry

lemma swap_pairs_technical:
  shows "swap_pairs {(Some (''.text'', 1, 4), SymbolRef ref_and_reloc_rec0), (Some (''.data'', addr, 8), SymbolDef def_rec0)} =
    {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 8))}"
  apply(simp only: swap_pairs_def image_def)
  apply auto
done

lemma set_choose_dichotomy:
  shows "set_choose {x, y} = x \<or> set_choose {x, y} = y"
unfolding set_choose_def by (metis (mono_tags) insert_iff singletonD someI)

lemma genericCompare_refl:
  fixes x :: "'a::order"
  shows "genericCompare (op <) (op =) x x = EQ"
using assms
  apply(simp only: genericCompare_def)
  apply simp
done

lemma pairCompare_refl:
  assumes "\<forall>p. cmp1 p p = EQ" and "\<forall>q. cmp2 q q = EQ"
  shows "pairCompare cmp1 cmp2 (p, q) (p, q) = EQ"
using assms
  apply(simp only: pairCompare.simps)
  apply(erule allE[where x="p"])
  apply simp
done

lemma tripleCompare_refl:
  assumes "\<forall>p. cmp1 p p = EQ" and "\<forall>q. cmp2 q q = EQ" and "\<forall>r. cmp3 r r = EQ"
  shows "tripleCompare cmp1 cmp2 cmp3 (p, q, r) (p, q, r) = EQ"
using assms
  apply(simp only: tripleCompare.simps)
  apply(rule pairCompare_refl, simp)
  apply(rule allI, case_tac q, clarify, rule pairCompare_refl, simp+)
done

lemma quadrupleCompare_refl:
  assumes "\<forall>p. cmp1 p p = EQ" and "\<forall>q. cmp2 q q = EQ" and "\<forall>r. cmp3 r r = EQ" and "\<forall>s. cmp4 s s = EQ"
  shows "quadrupleCompare cmp1 cmp2 cmp3 cmp4 (p, q, r, s) (p, q, r, s) = EQ"
using assms
  apply(simp only: quadrupleCompare.simps)
  apply(rule pairCompare_refl, simp)
  apply(rule allI, case_tac q, clarify, rule pairCompare_refl, simp+)
  apply(rule allI, rule allI, rule pairCompare_refl, simp+)
done

lemma sextupleCompare_refl:
  assumes "\<forall>p. cmp1 p p = EQ" and "\<forall>q. cmp2 q q = EQ" and "\<forall>r. cmp3 r r = EQ" and "\<forall>s. cmp4 s s = EQ"
    and "\<forall>p. cmp5 p p = EQ" and "\<forall>p. cmp6 p p = EQ"
  shows "sextupleCompare cmp1 cmp2 cmp3 cmp4 cmp5 cmp6 (x1, x2, x3, x4, x5, x6) (x1, x2, x3, x4, x5, x6) = EQ"
using assms
  apply(simp only: sextupleCompare.simps)
  apply(rule pairCompare_refl, simp)
  apply(rule allI, case_tac q, clarify, rule pairCompare_refl, simp)
  apply(rule allI, case_tac q, clarify, rule pairCompare_refl, simp)
  apply(rule allI, case_tac q, clarify, rule pairCompare_refl, simp)
  apply(rule allI, case_tac q, clarify, rule pairCompare_refl, simp)
  apply simp
done

lemma elf64_relocation_a_compare_refl:
  shows "elf64_relocation_a_compare r r = EQ"
  apply(simp only: elf64_relocation_a_compare_def)
  apply(rule tripleCompare_refl)
  apply(rule allI, rule genericCompare_refl)+
done

lemma relocSiteCompare_refl:
  shows "relocSiteCompare r r = EQ"
  apply(simp only: relocSiteCompare_def)
  apply(rule tripleCompare_refl)
  apply(rule allI, rule elf64_relocation_a_compare_refl)
  apply(rule allI, rule genericCompare_refl)+
done

lemma elf64_symbol_table_entry_compare_refl:
  shows "elf64_symbol_table_entry_compare e e = EQ"
  apply(simp only: elf64_symbol_table_entry_compare_def)
  apply(rule sextupleCompare_refl)
  apply(rule allI, rule genericCompare_refl)+
done

lemma symRefCompare_refl:
  shows "symRefCompare r r = EQ"
  apply(simp only: symRefCompare_def)
  apply(rule quadrupleCompare_refl) (* XXX: what is happening with the first comparison, here? *)
  apply(simp)
  apply(rule allI, rule elf64_symbol_table_entry_compare_refl)
  apply(rule allI, rule genericCompare_refl)+
done

lemma symDefCompare_refl:
  shows "symDefCompare d d = EQ"
  apply(simp only: symDefCompare_def) (* XXX: what is going on with the first comparison, here? *)
  apply(rule quadrupleCompare_refl)
  apply simp
  apply(rule allI, rule elf64_symbol_table_entry_compare_refl)
  apply(rule allI, rule genericCompare_refl)+
done

lemma maybeCompare_refl:
  assumes "\<forall>x. cmp x x = EQ"
  shows "maybeCompare cmp m m = EQ"
using assms
  apply(case_tac m)
  apply(simp only: maybeCompare.simps)+
done

lemma symRefAndRelocSiteCompare_refl:
  shows "symRefAndRelocSiteCompare r r = EQ"
  apply(simp only: symRefAndRelocSiteCompare_def)
  apply(rule pairCompare_refl)
  apply(rule allI, rule symRefCompare_refl)
  apply(rule allI, rule maybeCompare_refl)
  apply(rule allI, simp only: relocSiteCompare_refl)
done

lemma stringCompare_method_refl:
  shows "stringCompare_method s s = EQ"
  apply(simp only: stringCompare_method_def)
  apply(simp add: ord.lexordp_eq_refl)
done

lemma maybeCompare_refl_concrete:
  shows "(maybeCompare (pairCompare stringCompare_method (pairCompare (genericCompare op < op =) (genericCompare op < op =))) (Some (p, q::nat, r::nat)) (Some (p, q, r))) = EQ"
  apply(rule maybeCompare_refl)
  apply(rule allI)
  apply(case_tac x, clarify)
  apply(rule pairCompare_refl)
  apply(rule allI, rule stringCompare_method_refl)
  apply(rule allI, case_tac q, clarify, rule pairCompare_refl)
  apply(rule allI, rule genericCompare_refl)+
done

lemma split_concrete1:
  shows "Lem_set.split
           (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
             (instance_Basic_classes_Ord_Maybe_maybe_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                 (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))
           (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)) {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 8))} =
              ({(SymbolDef def_rec0, Some (''.data'', addr, 8))}, {})"
    apply(simp only: split_def Pair_eq instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def)
    apply(simp only: instance_Basic_classes_Ord_string_dict_def instance_Basic_classes_Ord_Maybe_maybe_dict_def)
    apply(simp only: instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def Ord_class.simps)
    apply(simp only: pairLess.simps pairLessEq.simps pairGreater_def pairGreaterEq_def tagCompare.simps symRefAndRelocSiteCompare_def pairCompare.simps)
    apply(auto simp only: set_choose_dichotomy pairLess.simps tagCompare.simps Ord_class.simps symRefAndRelocSiteCompare_refl)
    apply(simp only: maybeCompare_refl_concrete ordering.simps)+
done

lemma split_concrete2:
  shows "Lem_set.split
           (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
             (instance_Basic_classes_Ord_Maybe_maybe_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                 (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))
           (SymbolDef def_rec0, Some (''.data'', addr, 8)) {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 8))} = ({}, {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))})"
  apply(simp only: split_def Pair_eq instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def)
  apply(simp only: instance_Basic_classes_Ord_string_dict_def instance_Basic_classes_Ord_Maybe_maybe_dict_def)
  apply(simp only: instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def Ord_class.simps)
  apply(simp only: pairLess.simps pairLessEq.simps pairGreater_def pairGreaterEq_def tagCompare.simps symRefAndRelocSiteCompare_def pairCompare.simps)
  apply(auto simp only: set_choose_dichotomy pairLess.simps tagCompare.simps Ord_class.simps symRefAndRelocSiteCompare_refl symDefCompare_refl)
  apply(simp only: maybeCompare_refl_concrete, simp)+
done

lemma chooseAndSplit_concrete:
  shows "chooseAndSplit
           (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
             (instance_Basic_classes_Ord_Maybe_maybe_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                 (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))
           {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 8))} = Some ({(SymbolDef def_rec0, Some (''.data'', addr, 8))}, (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), {}) \<or>
         chooseAndSplit
           (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
             (instance_Basic_classes_Ord_Maybe_maybe_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                 (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))
           {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 8))} = Some ({}, (SymbolDef def_rec0, Some (''.data'', addr, 8)), {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))})"
  apply(simp only: chooseAndSplit_def)
  apply(subst if_weak_cong[where b="{(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 8))} = {}" and c="False"])
  apply simp
  apply(simp only: if_False)
  apply(rule disjE[OF set_choose_dichotomy[where x="(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))" and y="(SymbolDef def_rec0, Some (''.data'', addr, 8))"]])
  apply(erule subst[OF sym])
  apply(simp only: Let_def)
  apply(simp only: split_concrete1 split, simp)
  apply(erule subst[OF sym])
  apply(simp only: Let_def)
  apply(simp only: split_concrete2 split, simp)
done

lemma split_singleton:
  assumes "\<forall>x. \<not> (isGreater_method dict x x)" and "\<forall>x. \<not> (isLess_method dict x x)"
  shows "split dict s {s} = ({}, {})"
using assms
  apply(simp only: split_def)
  apply simp
done

lemma chooseAndSplit_singleton:
  assumes "well_behaved_lem_ordering (isGreater_method dict) (isLess_method dict)"
  shows "chooseAndSplit dict { s } = Some ({}, s, {})"
using assms unfolding well_behaved_lem_ordering.simps
  apply(simp only: chooseAndSplit_def)
  apply(simp add: split_singleton)
done

lemma chooseAndSplit_empty:
  shows "chooseAndSplit dict {} = None"
  apply(simp only: chooseAndSplit_def)
  apply simp
done

(* XXX: to control rewriting *)
lemma tagEquiv_concrete_SymbolRef_SymbolRef:
  shows "tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict (SymbolRef null_symbol_reference_and_reloc_site) (SymbolRef ref_and_reloc_rec0) = True"
  apply(simp add: tagEquiv.simps)
done

lemma tagEquiv_concrete_SymbolRef_SymbolDef:
  shows "tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict (SymbolRef null_symbol_reference_and_reloc_site) (SymbolDef def_rec0) = False"
  apply(simp add: tagEquiv.simps)
done

lemma findLowestKVWithKEqualTo_concrete1:
  assumes "well_behaved_lem_ordering
            (isGreater_method
              (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                (instance_Basic_classes_Ord_Maybe_maybe_dict
                  (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                    (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))
            (isLess_method
              (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                (instance_Basic_classes_Ord_Maybe_maybe_dict
                  (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                    (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))"
  shows "findLowestKVWithKEquivTo (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
     (instance_Basic_classes_Ord_Maybe_maybe_dict
       (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
     (SymbolRef null_symbol_reference_and_reloc_site) (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict) {(SymbolDef def_rec0, Some (''.data'', addr, 8))}
     (Some (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))) =
    Some (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))"
using assms
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="\<not> finite {(SymbolDef def_rec0, Some (''.data'', addr, 8))}" and c="False"])
  apply simp
  apply(simp only: if_False simp_thms chooseAndSplit_singleton option.case split)
  apply(simp only: tagEquiv_concrete_SymbolRef_SymbolDef if_False HOL.if_cancel)
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="\<not> finite {}" and c="False"])
  apply simp
  apply(simp only: if_False simp_thms chooseAndSplit_singleton option.case split)
  apply(simp only: chooseAndSplit_empty option.case)
done

lemma isLess_method_concrete:
  shows "isLess_method (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict) (SymbolRef null_symbol_reference_and_reloc_site)
         (SymbolDef def_rec0) = False"
  apply(simp only: instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def Ord_class.simps)
  apply(simp only: tagCompare.simps ordering.simps)
done

lemma findLowestKVWithKEquivTo_concrete2:
  assumes "well_behaved_lem_ordering
            (isGreater_method
              (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                (instance_Basic_classes_Ord_Maybe_maybe_dict
                  (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                    (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))
            (isLess_method
              (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                (instance_Basic_classes_Ord_Maybe_maybe_dict
                  (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                    (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))"
  shows "findLowestKVWithKEquivTo (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
     (instance_Basic_classes_Ord_Maybe_maybe_dict
       (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
     (SymbolRef null_symbol_reference_and_reloc_site) (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict) {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))} None = Some (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))"
using assms
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="\<not> finite {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))}" and c="False"])
  apply simp
  apply(simp only: if_False simp_thms chooseAndSplit_singleton option.case split)
  apply(simp only: tagEquiv_concrete_SymbolRef_SymbolRef if_True Let_def split)
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="\<not> finite {}" and c="False"])
  apply simp
  apply(simp only: if_False simp_thms chooseAndSplit_empty option.case)
done

lemma findLowestKVWithKEqualTo_concrete:
  assumes "well_behaved_lem_ordering
            (isGreater_method
              (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                (instance_Basic_classes_Ord_Maybe_maybe_dict
                  (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                    (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))
            (isLess_method
              (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                (instance_Basic_classes_Ord_Maybe_maybe_dict
                  (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                    (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))"
  shows "findLowestKVWithKEquivTo (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
           (instance_Basic_classes_Ord_Maybe_maybe_dict
             (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
           (SymbolRef null_symbol_reference_and_reloc_site) (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict)
           {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 8))} None = Some (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))"
using assms
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="\<not> finite {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 8))}" and c="False"])
  apply simp
  apply(simp only: if_False simp_thms option.case)
  apply(rule disjE[OF chooseAndSplit_concrete[where addr="addr"]])
  apply(erule subst[OF sym])
  apply(simp only: option.case split)
  apply(subst tagEquiv_concrete_SymbolRef_SymbolRef)
  apply(simp only: if_True Let_def split)
  apply(simp only: findLowestKVWithKEqualTo_concrete1)
  apply(erule subst[OF sym])
  apply(simp only: option.case split tagEquiv_concrete_SymbolRef_SymbolDef if_False)
  apply(simp only: isLess_method_concrete if_False)
  apply(simp only: findLowestKVWithKEquivTo_concrete2)
done

lemma findHighestKVWithKEquivTo_concrete1:
  assumes "well_behaved_lem_ordering
                 (isGreater_method
                   (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                     (instance_Basic_classes_Ord_Maybe_maybe_dict
                       (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))
                 (isLess_method
                   (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                     (instance_Basic_classes_Ord_Maybe_maybe_dict
                       (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))"
  shows "findHighestKVWithKEquivTo (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
     (instance_Basic_classes_Ord_Maybe_maybe_dict
       (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
     (SymbolRef null_symbol_reference_and_reloc_site) (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict) {} (Some (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))) = Some (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))"
using assms
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="\<not> finite {}" and c="False"])
  apply simp
  apply(simp only: if_False simp_thms option.case)
  apply(subst chooseAndSplit_empty)
  apply(simp only: option.case)
done

lemma findHighestKVWithKEquivTo_concrete2:
  assumes "well_behaved_lem_ordering
                 (isGreater_method
                   (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                     (instance_Basic_classes_Ord_Maybe_maybe_dict
                       (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))
                 (isLess_method
                   (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                     (instance_Basic_classes_Ord_Maybe_maybe_dict
                       (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))"
  shows "findHighestKVWithKEquivTo (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
     (instance_Basic_classes_Ord_Maybe_maybe_dict
       (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
     (SymbolRef null_symbol_reference_and_reloc_site) (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict) {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))} None =
    Some (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))"
using assms
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="\<not> finite {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))}" and c="False"])
  apply simp
  apply(simp only: if_False simp_thms option.case)
  apply(subst chooseAndSplit_singleton)
  apply assumption
  apply(simp only: option.case split tagEquiv_concrete_SymbolRef_SymbolRef if_True Let_def)
  apply(rule findHighestKVWithKEquivTo_concrete1)
  apply assumption
done

lemma isGreater_method_concrete:
  shows "isGreater_method (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict) (SymbolRef null_symbol_reference_and_reloc_site)
         (SymbolDef def_rec0) = True"
  apply(simp only: instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def Ord_class.simps)
  apply(simp only: tagCompare.simps refl)
done

lemma findHighestKVWithKEquivTo_concrete:
  assumes "well_behaved_lem_ordering
                 (isGreater_method
                   (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                     (instance_Basic_classes_Ord_Maybe_maybe_dict
                       (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))
                 (isLess_method
                   (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                     (instance_Basic_classes_Ord_Maybe_maybe_dict
                       (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))"
  shows "findHighestKVWithKEquivTo (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                  (instance_Basic_classes_Ord_Maybe_maybe_dict
                    (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                      (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
                  (SymbolRef null_symbol_reference_and_reloc_site) (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict)
                  {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 8))} None = Some (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))"
using assms
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="\<not> finite {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 8))}" and c="False"])
  apply simp
  apply(simp only: if_False simp_thms option.case)
  apply(rule disjE[OF chooseAndSplit_concrete[where addr="addr"]])
  apply(erule subst[OF sym])
  apply(simp only: option.case split)
  apply(subst tagEquiv_concrete_SymbolRef_SymbolRef)
  apply(simp only: if_True Let_def split)
  apply(simp only: findHighestKVWithKEquivTo_concrete1)
  apply(erule subst[OF sym])
  apply(simp only: option.case split tagEquiv_concrete_SymbolRef_SymbolDef if_False)
  apply(simp only: isGreater_method_concrete if_True)
  apply(simp only: findHighestKVWithKEquivTo_concrete2)
done

lemma split_concrete:
  shows "Lem_set.split
           (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
             (instance_Basic_classes_Ord_Maybe_maybe_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                 (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))
           (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)) {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 8))} = ({(SymbolDef def_rec0, Some (''.data'', addr, 8))}, {})"
sorry (* XXX: true by eval *)

lemma split_empty:
  shows "split dict s {} = ({}, {})"
  apply(simp only: split_def)
  apply simp
done

lemma set_comprehension_decompose_concrete:
  shows "(\<forall>x y. (EQ = dict1 x y) \<longleftrightarrow> (x = y)) \<Longrightarrow> (\<forall>x y. (EQ = dict2 x y) \<longleftrightarrow> (x = y)) \<Longrightarrow> {x \<in> {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 8))}.
                  EQ = pairCompare dict1 dict2 x (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))} = {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))}"
sorry (* true but a pain in the arse *)

lemma list_of_set_empty:
  shows "list_of_set {} = []"
by (meson finite.emptyI list_of_set(1) set_empty)

lemma list_of_set_singleton:
  shows "list_of_set {x} = [x]"
  apply(simp only: list_of_set_def list_of_set_set_def set_choose_def)
  apply(rule Hilbert_Choice.some_equality)
  apply simp
  apply(drule CollectD, erule conjE)
  apply(metis distinct.simps(2) ex_in_conv insert_iff list.exhaust list.simps(15) set_empty)
done

lemma lookupBy0_monstrosity:
  assumes "well_behaved_lem_ordering
     (isGreater_method
       (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
         (instance_Basic_classes_Ord_Maybe_maybe_dict
           (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
             (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))
     (isLess_method
       (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
         (instance_Basic_classes_Ord_Maybe_maybe_dict
           (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
             (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))"
  shows "lookupBy0 (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
       (instance_Basic_classes_Ord_Maybe_maybe_dict
         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
           (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
       (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict) (SymbolRef null_symbol_reference_and_reloc_site)
       (by_tag \<lparr>elements = [''.text'' \<mapsto>
                            \<lparr>startpos = Some (4194304\<Colon>nat), length1 = Some (20\<Colon>nat),
                               contents = [Some (72\<Colon>8 word), Some (199\<Colon>8 word), Some (4\<Colon>8 word), Some (37\<Colon>8 word), Some (word_extract (7\<Colon>nat) (0\<Colon>nat) (0\<Colon>64 word)),
                                           Some (word_extract (15\<Colon>nat) (8\<Colon>nat) (0\<Colon>64 word)), Some (word_extract (23\<Colon>nat) (16\<Colon>nat) (0\<Colon>64 word)), Some (word_extract (31\<Colon>nat) (24\<Colon>nat) (0\<Colon>64 word)),
                                           Some (5\<Colon>8 word), Some (0\<Colon>8 word), Some (0\<Colon>8 word), Some (0\<Colon>8 word), Some (72\<Colon>8 word), Some (139\<Colon>8 word), Some (4\<Colon>8 word), Some (37\<Colon>8 word),
                                           Some (word_extract (7\<Colon>nat) (0\<Colon>nat) (0\<Colon>64 word)), Some (word_extract (15\<Colon>nat) (8\<Colon>nat) (0\<Colon>64 word)), Some (word_extract (23\<Colon>nat) (16\<Colon>nat) (0\<Colon>64 word)),
                                           Some (word_extract (31\<Colon>nat) (24\<Colon>nat) (0\<Colon>64 word))]\<rparr>,
                            ''.data'' \<mapsto> \<lparr>startpos = Some (4194324\<Colon>nat), length1 = Some (8\<Colon>nat), contents = map Some (replicate (8\<Colon>nat) (of_nat (42\<Colon>nat)))\<rparr>],
                  by_range = set (meta0 addr), by_tag = by_tag_from_by_range (set (meta0 addr))\<rparr>) = [(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))]"
using assms
  apply(simp only: annotated_memory_image.simps by_tag_from_by_range_def meta0_def set_simps)
  apply(simp only: swap_pairs_technical)
  apply(simp only: lookupBy0_def)
  apply(subst findLowestKVWithKEqualTo_concrete, assumption)
  apply(subst findHighestKVWithKEquivTo_concrete, assumption)
  apply(simp only: option.case split_concrete Let_def split split_empty)
  apply(subst if_weak_cong[where b="pairLess (instance_Basic_classes_Ord_Maybe_maybe_dict
                   (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                     (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
         (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict) (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))
         (SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))" and c="False"])
  (* XXX: irreflexivity of our orders here *)
  prefer 2 (* ! *)
  apply(simp only: if_False append_Nil2 list_of_set_empty)
  apply(rule disjE[OF set_choose_dichotomy[where x="(SymbolRef ref_and_reloc_rec0, Some (''.text'', 1, 4))" and y="(SymbolDef def_rec0, Some (''.data'', addr, 8))"]])
  apply(erule subst[OF sym])
  apply(subst set_comprehension_decompose_concrete)
  prefer 3 (* ! *)
  apply(rule list_of_set_singleton)
  prefer 3 (* ! *)
  apply(erule subst[OF sym])
  apply(subst set_comprehension_decompose_concrete)
  prefer 3 (* ! *)
  apply(rule list_of_set_singleton)
sorry (* requires some obviously true subgoals solving *)

lemma magic_number_manipulation:
  shows "(unat (uint64_land (of_int (int 2)) (of_int (int (65536 * 65536 - 1))))) = 2"
  apply eval (* XXX *)
done

lemma abi_amd64_reloc_2_concrete:
  shows "amd64_reloc instance_Basic_classes_Ord_Abis_any_abi_feature_dict instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict 2 = (False, \<lambda>img3 site_addr rr. (4, \<lambda>s a e. nat \<bar>int s + a\<bar> - site_addr))"
  apply(simp only: amd64_reloc_def)
  apply(simp only: Let_def string_of_amd64_relocation_type_def)
  apply(simp only: r_x86_64_none_def r_x86_64_64_def r_x86_64_pc32_def)
  apply simp
done

lemma img1_concrete:
  shows "img1 addr [72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, word_extract (7\<Colon>nat) (0\<Colon>nat) (0\<Colon>64 word), word_extract (15\<Colon>nat) (8\<Colon>nat) (0\<Colon>64 word),
                                word_extract (23\<Colon>nat) (16\<Colon>nat) (0\<Colon>64 word), word_extract (31\<Colon>nat) (24\<Colon>nat) (0\<Colon>64 word), 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word,
                                37\<Colon>8 word, word_extract (7\<Colon>nat) (0\<Colon>nat) (0\<Colon>64 word), word_extract (15\<Colon>nat) (8\<Colon>nat) (0\<Colon>64 word), word_extract (23\<Colon>nat) (16\<Colon>nat) (0\<Colon>64 word),
                                word_extract (31\<Colon>nat) (24\<Colon>nat) (0\<Colon>64 word)] = xxx"
  apply(simp only: img1_def append.simps rev.simps list.map map_of.simps fst_def snd_def split)
  apply(simp only: Let_def relocate_output_image_def)
  apply(subst lookupBy0_monstrosity)
  (* proof of wellbehavedness of the order... *)
  prefer 2 (* ! *)
  apply(simp only: foldl.simps range_tag.case split ref_and_reloc_rec0_def symbol_reference_and_reloc_site.simps)
  apply(simp only: option.case split reloc_site.simps get_elf64_relocation_a_type_def)
  apply(simp only: elf64_relocation_a.simps r_x86_64_pc32_def extract_elf64_relocation_r_type_def)
  apply(simp only: annotated_memory_image.simps Let_def)
  apply(subst magic_number_manipulation)
  apply(simp only: sysv_amd64_std_abi_def abi.simps)


lemma x64_decode_relocated_technical_1:
  shows "x64_decode (fst (x64_fetch (load_relocated_program_image flags (elements (relocation_image addr)) reg (4194304\<Colon>nat)))) = Zfull_inst (undefined, undefined, undefined)"
  apply(simp only: x64_fetch_RIP fst_def X64_state.simps)
  apply(simp only: fst_def split append.simps list.simps)
  apply(subst x64_decode_Zmov_in)
  apply(simp only: append.simps list.simps simp_thms relocation_image_def relocatable_program_def)
  apply(simp only: concat.simps append_Nil2 mov_constant_to_mem_def mov_constant_from_mem_def)
  apply(subst encode_Zmov_in_concrete)
  apply eval (* XXX *)
  apply(rule refl)+
  apply(subst encode_Zmov_out_concrete)
  apply eval (* XXX *)
  apply(rule refl)+
  apply(simp only: append.simps)

lemma Run_fixed_Zmov_in_concrete:
  shows "Run (Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, of_nat addr), 5\<Colon>64 word))) \<sigma> = write'EA (5\<Colon>64 word, Zea_m (Z64, of_nat addr)) \<sigma>"
  apply(simp only: Run.simps instruction.case dfn'Zmov.simps read_cond.simps Zcond.simps)
  apply(simp only: split Let_def if_True fst_def ea_Zsrc.simps Zdest_src.simps EA.simps Zea.simps)
  apply(simp only: restrictSize.simps Zsize.simps ea_Zdest.simps Zdest_src.simps split)
  apply(simp only: fst_def ea_Zrm.simps Zrm.case split ea_index.simps option.case)
  apply(simp only: ea_base.simps Zbase.simps split add_0)
done

definition fixed_map :: "8 word \<Rightarrow> 8 word \<Rightarrow> 8 word \<Rightarrow> 8 word \<Rightarrow> 64 word \<Rightarrow> 8 word" where
  "fixed_map a1 a2 a3 a4 x \<equiv>
     let fmap =
       [4194323\<Colon>nat \<mapsto> a4, 4194322\<Colon>nat \<mapsto> a3, 4194321\<Colon>nat \<mapsto> a2, 4194320\<Colon>nat \<mapsto> a1,
        4194319\<Colon>nat \<mapsto> 37\<Colon>8 word, 4194318\<Colon>nat \<mapsto> 4\<Colon>8 word, 4194317\<Colon>nat \<mapsto> 139\<Colon>8 word, 4194316\<Colon>nat \<mapsto> 72\<Colon>8 word,
        4194315\<Colon>nat \<mapsto> 0\<Colon>8 word, 4194314\<Colon>nat \<mapsto> 0\<Colon>8 word, 4194313\<Colon>nat \<mapsto> 0\<Colon>8 word, 4194312\<Colon>nat \<mapsto> 5\<Colon>8 word,
        4194311\<Colon>nat \<mapsto> a4, 4194310\<Colon>nat \<mapsto> a3, 4194309\<Colon>nat \<mapsto> a2, 4194308\<Colon>nat \<mapsto> a1, 4194307\<Colon>nat \<mapsto> 37\<Colon>8 word,
        4194306\<Colon>nat \<mapsto> 4\<Colon>8 word, 4194305\<Colon>nat \<mapsto> 199\<Colon>8 word, 4194304\<Colon>nat \<mapsto> 72\<Colon>8 word]
    in case fmap (unat x) of
      None \<Rightarrow> 0
    | Some x \<Rightarrow> x"

lemma build_fixed_program_memory_expand_concrete:
  assumes "e_imm32 addr = [a1, a2, a3, a4]"
  shows "build_fixed_program_memory (4194304\<Colon>nat) (encode (mov_constant_to_mem (5\<Colon>64 word) addr) @ encode (mov_constant_from_mem addr)) =
    fixed_map a1 a2 a3 a4"
using assms
  apply(simp only: mov_constant_to_mem_def mov_constant_from_mem_def encode.simps instruction.case)
  apply(simp only: split Zcond.case Zsize.case Zdest_src.case Zrm.case)
  apply(simp only: e_rm_reg.simps e_gen_rm_reg.simps e_rm_imm.simps e_ModRM.simps Zrm.case split option.case Zbase.case)
  apply(simp only: list.case split append.simps e_opsize_imm.simps e_rm_reg.simps e_gen_rm_reg.simps e_opsize.simps Zsize.case)
  apply(simp only: simp_thms if_True Zsize.case concat.simps append.simps append_Nil2)
  apply(simp only: rex_prefix.simps)
  apply(subst if_weak_cong[where b="word_cat (0\<Colon>1 word) (word_cat (word_extract (3\<Colon>nat) (3\<Colon>nat) (0\<Colon>4 word)) (0\<Colon>2 word)) OR (8\<Colon>4 word) = (0\<Colon>4 word)" and c="False"])
  apply eval (* XXX *)
  apply(simp only: if_False e_imm32.simps)
  apply(subst if_weak_cong[where b="(18446744071562067968\<Colon>64 word) <=s (5\<Colon>64 word) \<and> (5\<Colon>64 word) <=s (2147483647\<Colon>64 word)" and c="True"])
  apply eval (* XXX *)
  apply(simp only: if_True list.case split Let_def refl option.case)
  apply(simp only: Zreg_to_nat.simps Zreg.case)
  apply(subst if_weak_cong[where b="word_cat (0\<Colon>1 word) (word_cat (word_extract (3\<Colon>nat) (3\<Colon>nat) (word_of_int (int (0\<Colon>nat)))) (0\<Colon>2 word)) OR (8\<Colon>4 word) = (0\<Colon>4 word)" and c="False"])
  apply eval (* XXX *)
  apply(simp only: if_False append.simps word_extract_15_8_5 word_extract_31_24_5 word_extract_7_0_5 word_extract_23_16_5 OR_198_1)
  apply(simp only: word_cat_8 word_of_int_of_int_0 OR_138_1 word_cat_4_8_72 word_cat_4)
  apply(rule ext, subst build_fixed_program_memory_def)
  apply(simp only: build_fixed_program_code_memory.simps map_of.simps fst_def snd_def nat.case split Let_def)
  apply(simp only: fixed_map_def Let_def)
  apply simp
done

lemma map_eqI:
  assumes "\<forall>d \<in> dom m1 \<union> dom m2. m1 d = m2 d"
  shows "m1 = m2"
using assms by fastforce

lemma map_upd_cong:
  assumes "m1 = m2" and "x1 = x2" and "y1 = y2"
  shows "m1(x1 := y1) = m2(x2 := y2)"
using assms by simp

lemma Run_fixed_Zmov_out_concrete:
  assumes "e_imm32 addr = [a1, a2, a3, a4]"
  shows "Run (Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, addr))))
             (snd (write'EA (5\<Colon>64 word, Zea_m (Z64, addr))
                    \<lparr>EFLAGS = flags, MEM = build_fixed_program_memory (4194304\<Colon>nat) (encode (mov_constant_to_mem (5\<Colon>64 word) addr) @ encode (mov_constant_from_mem addr)),
                       REG = reg,
                       RIP = of_nat (4194304\<Colon>nat) +
                             word_of_int
                              (int ((20\<Colon>nat) -
                                    length [72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, word_extract (7\<Colon>nat) (0\<Colon>nat) addr, word_extract (15\<Colon>nat) (8\<Colon>nat) addr,
                                            word_extract (23\<Colon>nat) (16\<Colon>nat) addr, word_extract (31\<Colon>nat) (24\<Colon>nat) addr])),
                       exception = NoException\<rparr>)) = ((), \<lparr>EFLAGS = flags, MEM = (fixed_map a1 a2 a3 a4)
                          (addr := 5, (1\<Colon>64 word) + addr := 0, (2\<Colon>64 word) + addr := 0, (3\<Colon>64 word) + addr := 0, (4\<Colon>64 word) + addr := 0,
                          (5\<Colon>64 word) + addr := 0, (6\<Colon>64 word) + addr := 0, (7\<Colon>64 word) + addr := 0),
       REG = reg(RAX := 5::64 word),
       RIP = 4194316\<Colon>64 word, exception = NoException\<rparr>)"
using assms
  apply(simp only: Run.simps instruction.case dfn'Zmov.simps read_cond.simps Zcond.simps)
  apply(simp only: split Let_def if_True fst_def ea_Zsrc.simps ea_Zrm.simps Zrm.case Zdest_src.simps)
  apply(simp only: EA.simps Zea.simps split Zsize.simps ea_index.simps option.case add_0)
  apply(simp only: ea_base.simps Zbase.simps split add_0 ea_Zdest.simps Zdest_src.simps)
  apply(simp only: fst_def snd_def write'EA.simps Zea.case split Zsize.simps Pair_eq refl simp_thms)
  apply(simp only: list.size write'mem64.simps snd_def write'mem32.simps write'mem16.simps write'mem8.simps)
  apply(simp only: split X64_state.simps mem64.simps mem32.simps mem16.simps mem8.simps fst_def)
  apply(simp only: build_fixed_program_memory_expand_concrete)
  apply(simp del: word_extract.simps X64_state.simps)
  apply(rule conjI)
  prefer 2 (* ooph! *)
  apply(rule map_upd_cong[OF refl, OF refl], eval) (* XXX *)
  apply(rule map_upd_cong)+
  apply(rule refl | simp | eval)+
done

lemma size_lemma:
  assumes "(4194324\<Colon>nat) \<le> addr" and "addr \<le> (4194324\<Colon>nat) + (8\<Colon>nat)"
  shows "(18446744071562067968\<Colon>64 word) <=s of_nat addr \<and> of_nat addr <=s (2147483647\<Colon>64 word)"
sorry (* XXX: obviously true *)

theorem le_big_theorem_ooh_la_la:
  shows "correctness_property"
  apply(subst correctness_property_def)
  apply(rule allI)+
  apply(simp only: fixed_program_def Let_def list.map concat.simps append_Nil2)
  apply(rule impI)
  apply(simp only: load_fixed_program_instructions_def)
  apply(simp only: run_two_steps_def x64_next.simps)
  apply(subst x64_decode_fixed_technical_1, simp only: address_is_disjoint_from_text_and_within_data_section_def,
    erule conjE, rule size_lemma, (erule conjE, assumption)+, (rule refl)+)+
  apply(simp only: Zinst.case split X64_state.simps)
  apply(subst Run_fixed_Zmov_in_concrete)+
  apply(subst x64_decode_fixed_technical_2, simp only: address_is_disjoint_from_text_and_within_data_section_def,
    erule conjE, rule size_lemma, (erule conjE, assumption)+, (rule refl)+)+
  apply(simp only: Zinst.case split)
(*
(Run (Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, of_nat addr))))
             (snd (write'EA (5\<Colon>64 word, Zea_m (Z64, of_nat addr))
                    \<lparr>EFLAGS = flags, MEM = build_fixed_program_memory (4194304\<Colon>nat) (encode (mov_constant_to_mem (5\<Colon>64 word) (of_nat addr)) @ encode (mov_constant_from_mem (of_nat addr))),
                       REG = reg,
                       RIP = of_nat (4194304\<Colon>nat) +
                             word_of_int
                              (int ((20\<Colon>nat) -
                                    length [72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, word_extract (7\<Colon>nat) (0\<Colon>nat) (of_nat addr), word_extract (15\<Colon>nat) (8\<Colon>nat) (of_nat addr),
                                            word_extract (23\<Colon>nat) (16\<Colon>nat) (of_nat addr), word_extract (31\<Colon>nat) (24\<Colon>nat) (of_nat addr)])),
                       exception = NoException\<rparr>)
*)
  apply(subst Run_fixed_Zmov_out_concrete)
  

end