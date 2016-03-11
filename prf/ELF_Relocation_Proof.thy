theory
  ELF_Relocation_Proof
imports
  Main
  "~~/src/HOL/Word/Word"
  (* X86 model imports *)
  "x86-64_model/L3_Theory"
  "x86-64_model/X64"
  (* ELF model imports *)
  "../auto_generated/isabelle/Import_everything"
  "../auto_generated/isabelle/Termination"
  "../auto_generated/isabelle/Test_image"
  "~~/src/HOL/Eisbach/Eisbach"
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
       
       (*address_is_disjoint_from_text_and_within_data_section addr text_start data_start program_len data_len \<longrightarrow>*)
       load_fixed_program_instructions flags fprogr reg text_start =
       load_relocated_program_image flags (elements (relocation_image addr)) reg text_start 
(*
       let fstate1 = load_fixed_program_instructions flags fprogr reg text_start in
       let fstate2 = run_two_steps fstate1 in
       let rstate1 = load_relocated_program_image flags (elements (relocation_image addr)) reg text_start in
       let rstate2 = run_two_steps rstate1 in

       address_is_disjoint_from_text_and_within_data_section addr text_start data_start program_len data_len \<longrightarrow>
           rstate2 = fstate2*)"

subsection {* Useful lemmas *}

(* XXX: in library, somewhere?  find_theorems doesn't find it, sigh... *)
lemma nat_lesseq_elim:
  fixes m n :: nat
  assumes "m \<le> n"
  shows "m = n \<or> m < n"
using assms by auto

lemma illegal_addresses:
  assumes "address_is_disjoint_from_text_and_within_data_section addr text_start data_start program_len data_len"
  shows "\<forall>x \<le> program_len. addr \<noteq> (text_start + x)"
using assms unfolding address_is_disjoint_from_text_and_within_data_section_def
  by auto

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

lemma concrete_evaluations:
  shows "((word_extract (15::nat) (0::nat) (5::32 word))::16 word) = 5"
    and "(word_extract (7::nat) (0::nat) (5::16 word)::8 word) = 5"
    and "((word_extract (15::nat) (8::nat) (5::16 word))::8 word) = 0"
    and "(word_extract (31::nat) (16::nat) (5::32 word)::16 word) = 0"
    and "(word_extract (31::nat) (16::nat) (0::32 word)::16 word) = 0"
    and "(word_extract (7::nat) (0::nat) (0::16 word)::8 word) = 0"
    and "(word_extract (15::nat) (0::nat) (0::32 word)::16 word) = 0"
    and "(word_extract (15::nat) (8::nat) (0::16 word)::8 word) = 0"
    and "(word_extract (23::nat) (16::nat) (0::16 word)::8 word) = 0"
    and "(word_extract (63::nat) (32::nat) (5::64 word)::32 word) = 0"
    and "prefixGroup 72 = 5"
    and "to_bl (199::8 word) = [True, True, False, False, False, True, True, True]"
    and "to_bl (139::8 word) = [True, False, False, False, True, False, True, True]"
    and "to_bl (37::8 word) = [False, False, True, False, False, True, False, True]"
    and "to_bl (4::8 word) = [False, False, False, False, False, True, False, False]"
    and "of_bl [True] = (1::1 word)"
    and "of_bl [False, False] = (0::2 word)"
    and "((word_extract 3 0 (72::8 word))::4 word) = (8::4 word)"
    and "((8::4 word) !! (0::nat)) = False"
    and "((8::4 word) !! (1::nat)) = False"
    and "((8::4 word) !! (2::nat)) = False"
    and "((8::4 word) !! (3::nat)) = True"
    and "nat_to_Zreg (nat (uint ((word_cat (0::1 word) ((of_bl [True, False, False])::3 word))::4 word))) = RSP"
    and "nat_to_Zreg (nat (uint ((word_cat (0::1 word) ((of_bl [True, False, True])::3 word))::4 word))) = RBP"
    and "nat_to_Zreg (nat (uint ((word_cat (0::1 word) ((of_bl [False, False, False])::3 word))::4 word))) = RAX"
    and "18446744071562067968 <=s (5::64 word) \<and> (5::64 word) <=s 2147483647"
    and "word_cat (0::1 word) ((word_cat ((word_extract (3::nat) (3::nat) (0::4 word))::1 word) (0::2 word))::3 word) OR (8::4 word) = (8::4 word)"
    and "((word_cat (4::4 word) (8::4 word))::8 word) = (72::8 word)"
    and "((word_cat (0::2 word) ((word_cat ((word_extract (2::nat) (0::nat) (0::4 word))::3 word) (4::3 word))::6 word))::8 word) = (4::8 word)"
    and "word_extract (7::nat) (0::nat) (5::64 word) = (5::8 word)"
    and "word_extract (15::nat) (8::nat) (5::64 word) = (0::8 word)"
    and "word_extract (23::nat) (16::nat) (5::64 word) = (0::8 word)"
    and "word_extract (31::nat) (24::nat) (5::64 word) = (0::8 word)"
    and "word_extract (31::nat) (0::nat) (5::64 word) = (5::8 word)"
    and "(((198::8 word) OR (1::8 word))::8 word) = (199::8 word)"
    and "(138::8 word) OR (1::8 word) = (139::8 word)"
    and "(word_cat (0::1 word) ((word_cat (0::1 word) (0::2 word))::3 word)::4 word) OR (8::4 word) = (8::4 word)"
    and "(4194316::64 word) = (((4194304::64 word) + ((of_nat 12)::64 word))::64 word)"
by eval+

lemma word_of_int_of_int_0:
  shows "(word_of_int (int (0::nat))::'a::len word) = (0::'a word)"
by simp

lemma word_arith_technical:
  assumes "m \<ge> 0"
  shows "of_nat n + word_of_int (int m) = of_nat (n + m)"
by (metis Abs_fnat_hom_add of_int_of_nat_eq word_of_int)

lemma of_nat_manipulate:
  "(of_nat m) + (n::'a::len word) = of_nat (m + unat n)"
by simp

lemma numeral_expansion:
  shows "(4::nat) = Suc (Suc (Suc (Suc 0)))"
    and "(5::nat) = Suc (Suc (Suc (Suc (Suc 0))))"
    and "(6::nat) = Suc (Suc (Suc (Suc (Suc (Suc 0)))))"
    and "(7::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))"
    and "(8::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))"
    and "(9::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))))"
    and "(10::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))))"
    and "(11::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))))))"
    and "(12::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))))))"
    and "(13::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))))))))"
    and "(14::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))))))))"
    and "(15::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))))))))))"
    and "(16::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))))))))))"
    and "(17::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))))))))))))"
    and "(18::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))))))))))))"
    and "(19::nat) = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0))))))))))))))))))"
by simp_all

lemma swap_pairs_rewrite:
  shows "swap_pairs {(x1, y1), (x2, y2)} = {(y1, x1), (y2, x2)}"
  apply(simp only: swap_pairs_def image_def)
  apply auto
done

lemma set_choose_dichotomy:
  shows "set_choose {x, y} = x \<or> set_choose {x, y} = y"
unfolding set_choose_def by (metis (mono_tags) insert_iff singletonD someI)

section {* Discharging Lem ordering lemmas *}

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

section {* Start of the proof proper *}

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

lemma x64_decode_Zmov_in:
  assumes "ss = [72, 199, 4, 37] @ [a1, a2, a3, a4] @ [c1, c2, c3, c4] @ rest" and
    "immediate32 (a1 # a2 # a3 # a4 # c1 # c2 # c3 # c4 # rest) = (addr, i)" and
    "immediate32 i = (cnst, rest)"
  shows "x64_decode ss = Zfull_inst ([], Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, addr), cnst)), rest)"
using assms
  apply(clarify)
  apply(simp only: append.simps x64_decode.simps readPrefixes.simps)
  apply(subst readPrefix.simps)
  apply(simp only: list.case concrete_evaluations)
  apply(simp only: Let_def refl if_True)
  apply(subst if_weak_cong[where b="5=0" and c="False"])
  apply simp
  apply(simp only: option.case if_False split)
  apply(subst if_weak_cong[where b="W (rec'REX 8) \<and> 102 \<in> set []" and c="False"])
  apply simp
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="103 \<in> set []" and c="False"], simp)
  apply(simp only: if_False list.case boolify'8.simps concrete_evaluations)
  apply(simp only: split list.cases bool.case rec'REX.simps REX.defs)
  apply(simp only: readOpcodeModRM.simps readModRM.simps list.case boolify'8.simps)
  apply(simp only: concrete_evaluations list.case split bool.case readSIB.simps REX.simps boolify'8.simps)
  apply(simp only: concrete_evaluations RexReg.simps if_False if_True)
  apply(simp only: Let_def if_True readSibDisplacement.simps simp_thms if_False)
  apply(subst if_weak_cong[where b="0 = 1" and c="False"])
  apply simp+
done

lemma x64_decode_Zmov_out:
  assumes "ss = [72, 139, 4, 37] @ [a1, a2, a3, a4] @ rest" and
    "immediate32 (a1 # a2 # a3 # a4 # rest) = (addr, rest)"
  shows "x64_decode ss = Zfull_inst ([], Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, addr))), rest)"
using assms
  apply(clarify)
  apply(simp only: append.simps x64_decode.simps readPrefixes.simps)
  apply(subst readPrefix.simps)
  apply(simp only: list.case concrete_evaluations)
  apply(simp only: Let_def refl if_True)
  apply(subst if_weak_cong[where b="5=0" and c="False"])
  apply simp
  apply(simp only: option.case if_False split)
  apply(subst if_weak_cong[where b="W (rec'REX 8) \<and> 102 \<in> set []" and c="False"])
  apply simp
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="103 \<in> set []" and c="False"], simp)
  apply(simp only: if_False list.case boolify'8.simps concrete_evaluations)
  apply(simp only: split list.cases bool.case rec'REX.simps REX.defs)
  apply(simp only: readOpcodeModRM.simps readModRM.simps list.case boolify'8.simps)
  apply(simp only: concrete_evaluations list.case split bool.case readSIB.simps REX.simps boolify'8.simps)
  apply(simp only: RexReg.simps if_False if_True concrete_evaluations Let_def refl)
  apply simp
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
  apply(simp only: e_imm32.simps concrete_evaluations simp_thms if_True list.case)
  apply(simp only: option.case split concat.simps list.case concrete_evaluations)
  apply simp
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
  apply(simp only: concrete_evaluations)
  apply simp
done

lemma build_fixed_program_memory_commute:
  assumes "addr \<le> l \<and> l \<le> addr + List.length bytes" and "bytes \<noteq> []"
  shows "(build_fixed_program_memory addr bytes) (of_nat l) = bytes ! (l - addr)"
using assms
sorry

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
    subst build_fixed_program_memory_commute, simp, simp, simp only: append.simps, simp only: diff_self_eq_0 diff_add_inverse, simp only: nth.simps nat.case)
  apply(subst encode_Zmov_out_concrete, assumption, (rule refl)+, subst encode_Zmov_in_concrete, assumption, (rule refl)+,
    subst of_nat_manipulate, subst build_fixed_program_memory_commute, simp, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp)
  apply(subst encode_Zmov_out_concrete, assumption, (rule refl)+, subst encode_Zmov_in_concrete, assumption, (rule refl)+,
    subst of_nat_manipulate, subst build_fixed_program_memory_commute, simp, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp)
  apply(subst encode_Zmov_out_concrete, assumption, (rule refl)+, subst encode_Zmov_in_concrete, assumption, (rule refl)+,
    subst of_nat_manipulate, subst build_fixed_program_memory_commute, simp, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp)
  apply(subst encode_Zmov_out_concrete, assumption, rule refl, rule refl, rule refl, rule refl,
    subst encode_Zmov_in_concrete, assumption, rule refl, rule refl, rule refl, rule refl,
    subst of_nat_manipulate, subst build_fixed_program_memory_commute, simp, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp)
  apply(subst encode_Zmov_out_concrete, assumption, rule refl, rule refl, rule refl, rule refl,
    subst encode_Zmov_in_concrete, assumption, rule refl, rule refl, rule refl, rule refl,
    subst of_nat_manipulate, subst build_fixed_program_memory_commute, simp, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp)
  apply(subst encode_Zmov_out_concrete, assumption, rule refl, rule refl, rule refl, rule refl,
    subst encode_Zmov_in_concrete, assumption, rule refl, rule refl, rule refl, rule refl,
    subst of_nat_manipulate, subst build_fixed_program_memory_commute, simp, simp, simp only: append.simps,
    simp only: diff_self_eq_0 diff_add_inverse, simp)
  apply(rule conjI)
  apply(rule impI, simp only: concrete_evaluations, simp)
  apply(rule impI, simp only: concrete_evaluations, simp)
sorry

lemma x64_decode_fixed_technical_2:
  assumes "(18446744071562067968::64 word) <=s (addr::64 word) \<and> addr <=s (2147483647::64 word)" and
    "word_extract 7 0 addr = a1" and "word_extract 15 8 addr = a2" and "word_extract 23 16 addr = a3"
      and "word_extract 31 24 addr = a4"
  shows "x64_decode
                  (fst (x64_fetch (snd (write'EA (5::64 word, Zea_m (Z64, addr))
                                         \<lparr>EFLAGS = flags,
                                            MEM = build_fixed_program_memory (4194304::nat) (encode (mov_constant_to_mem (5::64 word) addr) @ encode (mov_constant_from_mem addr)),
                                            REG = reg,
                                            RIP = of_nat (4194304::nat) +
                                                  word_of_int
                                                   (int ((20::nat) -
                                                         length [72::8 word, 139::8 word, 4::8 word, 37::8 word, word_extract (7::nat) (0::nat) addr, word_extract (15::nat) (8::nat) addr,
                                                                 word_extract (23::nat) (16::nat) addr, word_extract (31::nat) (24::nat) addr])),
                                            exception = NoException\<rparr>)))) = Zfull_inst([], Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, addr))), [])"
sorry

(* XXX: to control rewriting *)
lemma tagEquiv_rewrites:
  shows "tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict (SymbolRef null_symbol_reference_and_reloc_site) (SymbolRef ref_and_reloc_rec0) = True"
    and "tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict (SymbolRef null_symbol_reference_and_reloc_site) (SymbolDef def_rec0) = False"
    and "tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict (SymbolDef null_symbol_definition) (SymbolRef ref_and_reloc_rec0) = False"
    and "tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict (SymbolDef null_symbol_definition) (SymbolDef def_rec0) = True"
by (simp_all add: tagEquiv.simps)

lemma split_greater_2:
  fixes dict :: "'a Ord_class" and element other :: "'a"
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict)"
     and "isGreater_method dict element other"
  shows "Lem_set.split dict element {element, other} = ({other}, {})"
using assms unfolding well_behaved_lem_ordering.simps proof -
  have "isGreater_method dict element other"
    using assms by auto
  hence "\<not> isLess_method dict element other" and "\<not> isGreater_method dict element element" and "\<not> isLess_method dict element element"
    using assms well_behaved_lem_ordering.simps by smt+
  hence "{x \<in> {element, other}. isGreater_method dict element x} = {other}" and "{x \<in> {element, other}. isLess_method dict element x} = {}"
    using CollectI assms `\<not> isLess_method dict element element` `\<not> isLess_method dict element other` by auto
  thus "split dict element {element, other} = ({other}, {})"
    using split_def by (metis (full_types))
qed

lemma split_less_2:
  fixes dict :: "'a Ord_class" and element other :: "'a"
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict)"
      and "isLess_method dict element other"
  shows "Lem_set.split dict element {other, element} = ({}, {other})"
using assms unfolding well_behaved_lem_ordering.simps proof -
  have "isLess_method dict element other"
    using assms by auto
  hence "\<not> isGreater_method dict element other" and "\<not> isLess_method dict element element" and "\<not> isGreater_method dict element element"
    using assms well_behaved_lem_ordering.simps by smt+
  hence "{x \<in> {element, other}. isGreater_method dict element x} = {}" and "{x \<in> {element, other}. isLess_method dict element x} = {other}"
    using CollectI assms by auto
  thus "split dict element {other, element} = ({}, {other})"
    using split_def by (metis (full_types) insert_commute)
qed

lemma split_singleton:
  assumes "\<forall>x. \<not> (isGreater_method dict x x)" and "\<forall>x. \<not> (isLess_method dict x x)"
  shows "split dict s {s} = ({}, {})"
using assms
  apply(simp only: split_def)
  apply simp
done

lemma split_empty:
  shows "split dict s {} = ({}, {})"
  apply(simp only: split_def)
  apply simp
done

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

lemma chooseAndSplit_singleton:
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict)"
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

lemma chooseAndSplit_less_2:
  fixes dict :: "'a Ord_class" and element1 element2 :: "'a"
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict)"
    and "isLess_method dict element1 element2"
  shows "chooseAndSplit dict {element1, element2} = Some ({}, element1, {element2}) \<or>
         chooseAndSplit dict {element1, element2} = Some ({element1}, element2, {})"
using assms
  apply(simp only: chooseAndSplit_def)
  apply(subst if_weak_cong[where b="{element1, element2} = {}" and c="False"], simp_all)
  apply(rule disjE[OF set_choose_dichotomy[where x="element1" and y="element2"]])
  apply(erule subst[OF sym])
  apply(simp only: Let_def)
  apply(drule split_less_2, assumption)
  apply(subst prod.case_cong_weak[where prod="split dict element1 {element1, element2}" and prod'="({}, {element2})"], simp add: insert_commute)
  apply simp
  apply(erule subst[OF sym])
  apply(simp only: Let_def)
  apply(frule lem_ordering_lt, assumption)
  apply(drule split_greater_2, assumption)
  apply(subst prod.case_cong_weak[where prod="split dict element2 {element1, element2}" and prod'="({element1}, {})"], auto simp add: insert_commute)
done

lemma chooseAndSplit_greater_2:
  fixes dict :: "'a Ord_class" and element1 element2 :: "'a"
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict)"
      and "isGreater_method dict element1 element2"
  shows "chooseAndSplit dict {element1, element2} = Some ({element2}, element1, {}) \<or>
         chooseAndSplit dict {element1, element2} = Some ({}, element2, {element1})"
using assms
  apply(simp only: chooseAndSplit_def)
  apply(subst if_weak_cong[where b="{element1, element2} = {}" and c="False"], simp_all)
  apply(rule disjE[OF set_choose_dichotomy[where x="element1" and y="element2"]])
  apply(erule subst[OF sym])
  apply(simp only: Let_def)
  apply(drule split_greater_2, assumption)
  apply(subst prod.case_cong_weak[where prod="split dict element1 {element1, element2}" and prod'="({element2}, {})"], simp add: insert_commute)
  apply simp
  apply(erule subst[OF sym])
  apply(simp only: Let_def)
  apply(frule lem_ordering_gt, assumption)
  apply(drule split_less_2, assumption)
  apply(subst prod.case_cong_weak[where prod="split dict element2 {element1, element2}" and prod'="({}, {element1})"], auto simp add: insert_commute)
done

lemma tup2_dict_preserves_well_behavedness:
  fixes dict1 :: "'a Ord_class" and dict2 :: "'b Ord_class"
  assumes "well_behaved_lem_ordering (isLess_method dict1) (isLessEqual_method dict1) (isGreater_method dict1)" and
    "well_behaved_lem_ordering (isLess_method dict2) (isLessEqual_method dict2) (isGreater_method dict2)" and
    "d = instance_Basic_classes_Ord_tup2_dict dict1 dict2"
  shows "well_behaved_lem_ordering (isLess_method d) (isLessEqual_method d) (isGreater_method d)"
using assms unfolding instance_Basic_classes_Ord_tup2_dict_def
sorry

lemma findLowestKVWithKEquivTo_Some_empty:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict)"
  shows "findLowestKVWithKEquivTo key_dict val_dict element eq {} (Some candidate) = Some candidate"
using assms
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {}" and c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="\<not> well_behaved_lem_ordering (isLess_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict)) (isLessEqual_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict)) (isGreater_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))" and c=False])
  apply(simp, rule tup2_dict_preserves_well_behavedness, simp, simp, simp)
  apply(simp only: if_False)
  apply(subst chooseAndSplit_empty)
  apply(simp only: option.case)
done

lemma findHighestKVWithKEquivTo_Some_empty:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict)"
  shows "findHighestKVWithKEquivTo key_dict val_dict element eq {} (Some candidate) = Some candidate"
using assms
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {}" and c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="\<not> well_behaved_lem_ordering (isLess_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict)) (isLessEqual_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict)) (isGreater_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))" and c=False])
  apply(simp, rule tup2_dict_preserves_well_behavedness, simp, simp, simp)
  apply(simp only: if_False)
  apply(subst chooseAndSplit_empty)
  apply(simp only: option.case)
done

lemma lem_ordering_le:
  assumes "well_behaved_lem_ordering lt le gt"
  and "le x y"
  shows "x = y \<or> lt x y"
using assms well_behaved_lem_ordering.elims(2) by blast

lemma tup2_dict_preserves_not_lt:
  assumes "well_behaved_lem_ordering (isLess_method dict1) (isLessEqual_method dict1) (isGreater_method dict1)" and
    "well_behaved_lem_ordering (isLess_method dict2) (isLessEqual_method dict2) (isGreater_method dict2)" and
    "pairLess dict1 dict2 p1 p2"
  shows "\<not> pairLess dict1 dict2 p2 p1"
using assms
  apply(case_tac p1; case_tac p2, clarify, simp only: pairLess.simps)
  apply(erule disjE, erule disjE)
  apply(drule lem_ordering_not_lt, assumption, simp)
  apply(erule conjE)
  apply(drule lem_ordering_le, assumption)
  apply(erule disjE)
  apply(drule lem_ordering_not_lt, assumption, meson assms(2) lem_ordering_not_lt)+
  apply(erule disjE, erule conjE)
  apply(drule lem_ordering_le, assumption)
  apply(erule disjE)
  apply(drule lem_ordering_not_lt, assumption, meson assms(2) lem_ordering_not_lt)+
  apply(erule conjE)+
  apply(drule lem_ordering_not_lt, assumption, meson assms(2) lem_ordering_not_lt)+
done

lemma findLowestKVWithKEquivTo_less_singleton_Some:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict)"
      and "pairLess val_dict key_dict candidate e" and "eq element ek"
      and "e = (ek, ev)"
  shows "findLowestKVWithKEquivTo key_dict val_dict element eq {e} (Some candidate) = Some candidate"
using assms
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {e}" and c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="\<not> well_behaved_lem_ordering (isLess_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))
      (isLessEqual_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict)) (isGreater_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))" and c=False], simp)
  apply(rule tup2_dict_preserves_well_behavedness, simp, simp, simp)
  apply(simp only: if_False)
  apply(subst chooseAndSplit_singleton, rule tup2_dict_preserves_well_behavedness, simp, simp, simp)
  apply(simp only: split option.case if_True)
  apply(case_tac "candidate", clarify)
  apply(simp only: Let_def split)
  apply(frule tup2_dict_preserves_not_lt, simp, simp)
  apply(drule Eq_FalseI)
  apply(subst if_weak_cong[where b="pairLess val_dict key_dict (ek, ev) (a, b)" and c=False], simp)
  apply(simp only: if_False split)
  apply(rule findLowestKVWithKEquivTo_Some_empty)
  apply simp_all
done

lemma pairGreater_asym:
  assumes "well_behaved_lem_ordering (isLess_method dict1) (isLessEqual_method dict1) (isGreater_method dict1)"
      and "well_behaved_lem_ordering (isLess_method dict2) (isLessEqual_method dict2) (isGreater_method dict2)"
      and  "pairGreater dict1 dict2 x y"
  shows "\<not> pairGreater dict2 dict1 y x"
using assms sorry

lemma findHighestKVWithKEquivTo_less_singleton_Some:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict)"
      and "pairGreater val_dict key_dict candidate e" and "eq element ek"
      and "e = (ek, ev)"
  shows "findHighestKVWithKEquivTo key_dict val_dict element eq {e} (Some candidate) = Some candidate"
using assms
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {e}" and c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="\<not> well_behaved_lem_ordering (isLess_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))
      (isLessEqual_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict)) (isGreater_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))" and c=False], simp)
  apply(rule tup2_dict_preserves_well_behavedness, simp, simp, simp)
  apply(simp only: if_False)
  apply(subst chooseAndSplit_singleton, rule tup2_dict_preserves_well_behavedness, simp, simp, simp)
  apply(simp only: split option.case if_True)
  apply(case_tac "candidate", clarify)
  apply(simp only: Let_def split)
  apply(frule pairGreater_asym, assumption, assumption)
  apply(simp del: findHighestKVWithKEquivTo.simps)
  apply(rule findHighestKVWithKEquivTo_Some_empty, simp_all)
done

lemma findLowestKVWithKEquivTo_singleton_None:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict)"
      and "e = (ek, ev)" and "eq element ek"
  shows "findLowestKVWithKEquivTo key_dict val_dict element eq {e} None = Some e"
using assms
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {e}" and c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="\<not> well_behaved_lem_ordering (isLess_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict)) (isLessEqual_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict)) (isGreater_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))" and c=False])
  apply(simp, rule tup2_dict_preserves_well_behavedness, simp, simp, simp)
  apply(simp only: if_False)
  apply(subst chooseAndSplit_singleton, rule tup2_dict_preserves_well_behavedness, simp, simp, simp)
  apply(simp only: option.case split if_True)
  apply(simp only: split Let_def)
  apply(rule findLowestKVWithKEquivTo_Some_empty)
  apply simp_all
done

lemma findHighestKVWithKEquivTo_singleton_None:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict)"
      and "e = (ek, ev)" and "eq element ek"
  shows "findHighestKVWithKEquivTo key_dict val_dict element eq {e} None = Some e"
using assms
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {e}" and c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="\<not> well_behaved_lem_ordering (isLess_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))
      (isLessEqual_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict)) (isGreater_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))" and c=False])
  apply(simp, rule tup2_dict_preserves_well_behavedness, simp, simp, simp)
  apply(simp only: if_False)
  apply(subst chooseAndSplit_singleton, rule tup2_dict_preserves_well_behavedness, simp, simp, simp)
  apply(simp only: option.case split if_True)
  apply(simp only: split Let_def)
  apply(rule findHighestKVWithKEquivTo_Some_empty)
  apply simp_all
done

lemma pairLess_intro:
  assumes "isLess_method dict e1 e2"
  shows "pairLess dict' dict (e1, f1) (e2, f2)"
using assms unfolding pairLess.simps by auto

lemma findLowestKVWithKEquivTo_2_None:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict)"
      and "element1 = (e1k, e1v)" and "element2 = (e2k, e2v)"
      and "isLess_method key_dict e1k e2k" and "eq element e1k" and "\<not> eq e2k element"
      and "\<forall>x y1 y2. isLess_method key_dict y1 x \<longrightarrow> eq y2 y1 \<longrightarrow> isLess_method key_dict y2 x"
      and "\<forall>x y. eq x y \<longleftrightarrow> eq y x"
  shows "findLowestKVWithKEquivTo key_dict val_dict element eq {element1, element2} None = Some element1"
using assms
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {element1, element2}" and c=False], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="\<not> well_behaved_lem_ordering (isLess_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict)) (isLessEqual_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))
            (isGreater_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))" and c=False], simp)
  apply(rule tup2_dict_preserves_well_behavedness, assumption+, rule refl)
  apply(simp only: if_False)
  apply(rule disjE[OF chooseAndSplit_less_2[where dict="instance_Basic_classes_Ord_tup2_dict key_dict val_dict"]])
  apply(rule tup2_dict_preserves_well_behavedness, assumption+, rule refl)
  apply(simp add: instance_Basic_classes_Ord_tup2_dict_def)
  apply(rule pairLess_intro, assumption)
  apply(subst option.case_cong_weak[where option="chooseAndSplit (instance_Basic_classes_Ord_tup2_dict key_dict val_dict) {(e1k, e1v), (e2k, e2v)}"], assumption)
  apply(simp only: option.case split if_True Let_def)
  apply(simp only: findLowestKVWithKEquivTo_Some_empty)
  apply(subst option.case_cong_weak[where option="chooseAndSplit (instance_Basic_classes_Ord_tup2_dict key_dict val_dict) {(e1k, e1v), (e2k, e2v)}"], assumption)
  apply(simp only: option.case split if_False if_True)
  apply(rule findLowestKVWithKEquivTo_singleton_None, simp_all)
  apply blast
done

lemma findHighestKVWithKEquivTo_2_None:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict)"
      and "element1 = (e1k, e1v)" and "element2 = (e2k, e2v)"
      and "isLess_method key_dict e2k e1k" and "eq element e1k"
      and "\<forall>x y1 y2. isLess_method key_dict x y1 \<longrightarrow> eq y2 y1 \<longrightarrow> isLess_method key_dict x y2"
      and "\<forall>x y. isLess_method key_dict x y \<longrightarrow> \<not> eq x y"
      and "\<forall>x y. eq x y \<longleftrightarrow> eq y x"
  shows "findHighestKVWithKEquivTo key_dict val_dict element eq {element1, element2} None = Some element1"
using assms
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {element1, element2}" and c=False], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="\<not> well_behaved_lem_ordering (isLess_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict)) (isLessEqual_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))
            (isGreater_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))" and c=False], simp)
  apply(rule tup2_dict_preserves_well_behavedness, assumption+, rule refl)
  apply(simp only: if_False)
  apply(rule disjE[OF chooseAndSplit_less_2[where dict="instance_Basic_classes_Ord_tup2_dict key_dict val_dict"]])
  apply(rule tup2_dict_preserves_well_behavedness, assumption+, rule refl)
  apply(simp add: instance_Basic_classes_Ord_tup2_dict_def)
  apply(rule pairLess_intro, assumption)
  apply(simp only: insert_commute)
  apply(subst option.case_cong_weak[where option="chooseAndSplit (instance_Basic_classes_Ord_tup2_dict key_dict val_dict) {(e1k, e1v), (e2k, e2v)}"], assumption)
  apply(simp only: option.case split if_False Let_def)
  apply(subgoal_tac "isGreater_method key_dict element e2k = True", simp del: findHighestKVWithKEquivTo.simps)
  apply(simp only: findHighestKVWithKEquivTo_singleton_None)
  apply(rule eqTrueI)
  apply(rule lem_ordering_lt[where gt="isGreater_method key_dict"], assumption)
  apply blast
  apply(simp only: insert_commute option.case split if_True Let_def)
  apply(rule findHighestKVWithKEquivTo_Some_empty, simp_all)
done

lemma findHighestKVWithKEquivTo_2_None':
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict)"
      and "element1 = (e1k, e1v)" and "element2 = (e2k, e2v)"
      and "isLess_method key_dict e2k e1k" and "\<not> eq element e1k" and "eq element e2k"
      and "\<forall>x y1 y2. isLess_method key_dict x y1 \<longrightarrow> eq y2 y1 \<longrightarrow> isLess_method key_dict x y2"
      and "\<forall>x y. isLess_method key_dict x y \<longrightarrow> \<not> eq x y"
      and "\<forall>x y. eq x y \<longleftrightarrow> eq y x"
  shows "findHighestKVWithKEquivTo key_dict val_dict element eq {element1, element2} None = Some element2"
using assms
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {element1, element2}" and c=False], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where b="\<not> well_behaved_lem_ordering (isLess_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict)) (isLessEqual_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))
            (isGreater_method (instance_Basic_classes_Ord_tup2_dict key_dict val_dict))" and c=False], simp)
  apply(rule tup2_dict_preserves_well_behavedness, assumption+, rule refl)
  apply(simp only: if_False)
  apply(rule disjE[OF chooseAndSplit_less_2[where dict="instance_Basic_classes_Ord_tup2_dict key_dict val_dict"]])
  apply(rule tup2_dict_preserves_well_behavedness, assumption+, rule refl)
  apply(simp add: instance_Basic_classes_Ord_tup2_dict_def)
  apply(rule pairLess_intro, assumption)
  apply(simp only: insert_commute)
  apply(subst option.case_cong_weak[where option="chooseAndSplit (instance_Basic_classes_Ord_tup2_dict key_dict val_dict) {(e1k, e1v), (e2k, e2v)}"], assumption)
  apply(simp only: option.case split if_True Let_def)
  apply(drule findHighestKVWithKEquivTo_less_singleton_Some, assumption)

lemma comprehension_2_decompose:
  shows "\<forall>x y. cmp1 x y = EQ \<longleftrightarrow> x = y \<Longrightarrow> \<forall>x y. cmp2 x y = EQ \<longleftrightarrow> x = y \<Longrightarrow>
    { x \<in> {e1, e2}. EQ = pairCompare cmp1 cmp2 x e1 } = { e1 }"
  apply(rule equalityI)
  apply(rule subsetI)
  apply(drule CollectD)
  apply(erule conjE)
  apply simp
  apply(erule disjE, assumption)
  apply(case_tac x, case_tac e1, clarify)
  apply(simp only: pairCompare.simps)
  apply(case_tac "cmp1 aa aaa", simp+)
  apply(erule_tac x="ba" in allE, erule_tac x="baa" in allE, simp)
  apply simp
  apply(rule subsetI)
  apply(drule singletonD, clarify)
  apply(simp only: pairCompare.simps)
  apply(erule_tac x="a" in allE, erule_tac x="a" in allE, simp)
  apply(erule_tac x="b" in allE, erule_tac x="b" in allE, simp)
done

lemma lookupBy0_eq_singleton:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict)"
    and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict)"
    and "e1 = (ec1, ec2)" and "e2 = (ed1, ed2)" and "isLess_method key_dict element ed1"
    and "eq element ec1"
    and "\<forall>x1 x2. eq x1 x2 \<longleftrightarrow> eq x2 x1"
    and "\<forall>x y1 y2. isLess_method key_dict y1 x \<longrightarrow> eq y2 y1 \<longrightarrow> isLess_method key_dict y2 x"
    and "\<forall>x y. isLess_method key_dict x y \<longrightarrow> \<not> eq x y"
  shows "lookupBy0 key_dict val_dict eq element {e1, e2} = [e1]"
using assms
  apply(simp only: lookupBy0_def)
  apply(case_tac e2, clarify)
  apply(subgoal_tac "isLess_method key_dict ec1 ed1")
  apply(frule findLowestKVWithKEquivTo_2_None[where e1k="ec1" and e2k="ed1" and eq="eq"])
  apply(assumption, assumption, assumption, assumption, blast, blast, blast, assumption)
  apply clarify
  apply(subst option.case_cong_weak[where option="findLowestKVWithKEquivTo key_dict val_dict element eq {(ec1, ec2), (ed1, ed2)} None" and option'="Some (ec1, ec2)"], assumption)
  apply(subst option.case)
thm findHighestKVWithKEquivTo_2_None[where eq="eq" and e2k="ec1"]
  apply(drule findHighestKVWithKEquivTo_2_None[where eq="eq" and e2k="ec1"])
  apply(assumption, assumption, assumption)


lemma lookupBy0_monstrosity:
  (*assumes "well_behaved_lem_ordering
     (isGreater_method
       (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
         (instance_Basic_classes_Ord_Maybe_maybe_dict
           (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
             (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))
     (isLess_method
       (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
         (instance_Basic_classes_Ord_Maybe_maybe_dict
           (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
             (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))))"*)
  shows "lookupBy0 (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
       (instance_Basic_classes_Ord_Maybe_maybe_dict
         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
           (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
       (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict) (SymbolRef null_symbol_reference_and_reloc_site)
       (by_tag \<lparr>elements = [''.text'' \<mapsto>
                            \<lparr>startpos = Some (4194304::nat), length1 = Some (20::nat),
                               contents = [Some (72::8 word), Some (199::8 word), Some (4::8 word), Some (37::8 word), Some (word_extract (7::nat) (0::nat) (0::64 word)),
                                           Some (word_extract (15::nat) (8::nat) (0::64 word)), Some (word_extract (23::nat) (16::nat) (0::64 word)), Some (word_extract (31::nat) (24::nat) (0::64 word)),
                                           Some (5::8 word), Some (0::8 word), Some (0::8 word), Some (0::8 word), Some (72::8 word), Some (139::8 word), Some (4::8 word), Some (37::8 word),
                                           Some (word_extract (7::nat) (0::nat) (0::64 word)), Some (word_extract (15::nat) (8::nat) (0::64 word)), Some (word_extract (23::nat) (16::nat) (0::64 word)),
                                           Some (word_extract (31::nat) (24::nat) (0::64 word))]\<rparr>,
                            ''.data'' \<mapsto> \<lparr>startpos = Some (4194324::nat), length1 = Some (8::nat), contents = map Some (replicate (8::nat) (of_nat (42::nat)))\<rparr>],
                  by_range = set (meta0 addr), by_tag = by_tag_from_by_range (set (meta0 addr))\<rparr>) = [(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 8))]"
using assms
  apply(simp only: annotated_memory_image.simps by_tag_from_by_range_def meta0_def set_simps)
  apply(simp only: swap_pairs_technical)
  apply(simp only: lookupBy0_def)
  apply(subst findLowestKVWithKEqualTo_concrete, assumption)
  apply(subst findHighestKVWithKEquivTo_concrete, assumption)
  apply(simp only: option.case split_concrete1 Let_def split split_empty)
  apply(subst if_weak_cong[where b="pairLess (instance_Basic_classes_Ord_Maybe_maybe_dict
                   (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                     (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
         (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict) (SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 8))
         (SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 8))" and c="False"])
  (* XXX: irreflexivity of our orders here *)
  prefer 2 (* ! *)
  apply(simp only: if_False append_Nil2 list_of_set_empty)
  apply(rule disjE[OF set_choose_dichotomy[where x="(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 8))" and y="(SymbolDef def_rec0, Some (''.data'', addr, 8))"]])
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

lemma split_singleton_technical:
  shows "Lem_set.split
           (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
             (instance_Basic_classes_Ord_Maybe_maybe_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                 (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))
           (SymbolDef def_rec0, Some (''.data'', addr, 8)) {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 8))} = ({}, {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 8))})"
  apply(simp only: split_def prod.inject)
  apply(rule conjI)
  apply(rule equalityI, rule subsetI)
  apply(drule CollectD)
  apply(erule conjE)
  apply(simp)
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
    instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def Ord_class.simps
    instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_string_dict_def maybeCompare.simps tagCompare.simps pairCompare.simps
    pairGreater_def pairLess.simps)
  apply auto
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
    instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def Ord_class.simps
    instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_string_dict_def maybeCompare.simps tagCompare.simps pairCompare.simps
    pairGreater_def pairLess.simps)
  apply auto
done

lemma list_of_set_technical:
  shows "list_of_set
     {x \<in> {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 8)), (SymbolDef def_rec0, Some (''.data'', addr, 8))}.
      EQ = pairCompare (compare_method (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict))
            (compare_method
              (instance_Basic_classes_Ord_Maybe_maybe_dict
                (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                  (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))
            x (SymbolDef def_rec0, Some (''.data'', addr, 8))} = [(SymbolDef def_rec0, Some (''.data'', addr, 8))]"
  apply(subgoal_tac "{x \<in> {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 8)), (SymbolDef def_rec0, Some (''.data'', addr, 8))}.
      EQ = pairCompare (compare_method (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict))
            (compare_method
              (instance_Basic_classes_Ord_Maybe_maybe_dict
                (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                  (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))
            x (SymbolDef def_rec0, Some (''.data'', addr, 8))} = {(SymbolDef def_rec0, Some (''.data'', addr, 8))}")
  apply(simp add: list_of_set_singleton)
  apply(rule equalityI, rule subsetI)
  apply simp
  apply(erule conjE)
  apply(erule disjE, simp)
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
    instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def Ord_class.simps
    instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_string_dict_def maybeCompare.simps tagCompare.simps pairCompare.simps
    pairGreater_def pairLess.simps ordering.case ordering.simps)
  apply simp
  apply(rule subsetI)
  apply simp
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
    instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def Ord_class.simps
    instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_string_dict_def maybeCompare.simps tagCompare.simps pairCompare.simps
    pairGreater_def pairLess.simps ordering.case ordering.simps)
  apply(subst symDefCompare_refl)
  apply(simp only: ordering.simps)
  apply(subst stringCompare_method_refl)
  apply(simp only: ordering.simps genericCompare_def)
  apply auto
done

lemma pairLess_antisym_technical:
  shows "pairLess (instance_Basic_classes_Ord_Maybe_maybe_dict
                   (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                     (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
         (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict) (SymbolDef def_rec0, Some (''.data'', addr, 8))
         (SymbolDef def_rec0, Some (''.data'', addr, 8)) = False"
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
    instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def Ord_class.simps
    instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_string_dict_def maybeCompare.simps tagCompare.simps pairCompare.simps
    pairGreater_def pairLess.simps ordering.case ordering.simps)
  apply(auto simp add: symDefCompare_refl stringCompare_method_refl genericCompare_def)
done

lemma taggedRanges_technical:
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
  shows "(tagged_ranges_matching_tag instance_Basic_classes_Ord_Abis_any_abi_feature_dict
                                                       instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict (SymbolDef null_symbol_definition)
                                                       \<lparr>elements = [''.text'' \<mapsto>
                                                                    \<lparr>startpos = Some 4194304, length1 = Some 20,
                                                                       contents = [Some 72, Some 199, Some 4, Some 37, Some 0, Some 0, Some 0, Some 0, Some 5, Some 0, Some 0, Some 0, Some 72,
                                                                                   Some 139, Some 4, Some 37, Some 0, Some 0, Some 0, Some 0]\<rparr>,
                                                                    ''.data'' \<mapsto>
                                                                    \<lparr>startpos = Some 4194324, length1 = Some 8,
                                                                       contents = [Some 42, Some 42, Some 42, Some 42, Some 42, Some 42, Some 42, Some 42]\<rparr>],
                                                          by_range = set (meta0 addr), by_tag = by_tag_from_by_range (set (meta0 addr))\<rparr>) = [(SymbolDef def_rec0, Some (''.data'', addr, 8))]"
using assms
  apply(simp only: tagged_ranges_matching_tag_def annotated_memory_image.simps)
  apply(simp only: meta0_def list.set by_tag_from_by_range_def swap_pairs_technical)
  apply(simp only: lookupBy0_def)
  apply(subst findLowestKVWithKEqualTo_concrete_null_symbol)
  apply assumption
  apply(simp only: option.case)
  apply(subst findHighestKVWithKEquivTo_concrete_null_symbol, assumption)
  apply(simp only: option.case split Let_def)
  apply(subst split_concrete2)
  apply(simp only: split)
  apply(subst split_singleton_technical)
  apply(simp only: split list_of_set_empty append_Nil2)
  apply(subst list_of_set_technical)
  apply(simp only: pairLess_antisym_technical if_False append_Nil2)
done

lemma element_and_offset_to_address_technical:
  shows "element_and_offset_to_address (''.data'', addr)
                                         \<lparr>elements = [''.text'' \<mapsto>
                                                      \<lparr>startpos = Some 4194304, length1 = Some 20,
                                                         contents = [Some 72, Some 199, Some 4, Some 37, Some (word_extract 7 0 0), Some (word_extract 15 8 0), Some (word_extract 23 16 0),
                                                                     Some (word_extract 31 24 0), Some 5, Some 0, Some 0, Some 0, Some 72, Some 139, Some 4, Some 37, Some (word_extract 7 0 0),
                                                                     Some (word_extract 15 8 0), Some (word_extract 23 16 0), Some (word_extract 31 24 0)]\<rparr>,
                                                      ''.data'' \<mapsto> \<lparr>startpos = Some 4194324, length1 = Some 8, contents = map Some (replicate 8 (of_nat 42))\<rparr>],
                                            by_range = set (meta0 addr), by_tag = by_tag_from_by_range (set (meta0 addr))\<rparr> = Some (4194324 + of_nat addr)"
  apply(simp only: element_and_offset_to_address.simps annotated_memory_image.simps)
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

lemma img1_concrete:
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
  and "natural_to_le_byte_list (16 + of_nat addr) = [b1, b2, b3]"
  shows "img1 addr [72::8 word, 199::8 word, 4::8 word, 37::8 word, word_extract (7::nat) (0::nat) (0::64 word), word_extract (15::nat) (8::nat) (0::64 word),
                                word_extract (23::nat) (16::nat) (0::64 word), word_extract (31::nat) (24::nat) (0::64 word), 5::8 word, 0::8 word, 0::8 word, 0::8 word, 72::8 word, 139::8 word, 4::8 word,
                                37::8 word, word_extract (7::nat) (0::nat) (0::64 word), word_extract (15::nat) (8::nat) (0::64 word), word_extract (23::nat) (16::nat) (0::64 word),
                                word_extract (31::nat) (24::nat) (0::64 word)] =
         \<lparr>elements = [''.data'' \<mapsto> \<lparr>startpos = Some 4194324, length1 = Some 8, contents = [Some 42, Some 42, Some 42, Some 42, Some 42, Some 42, Some 42, Some 42]\<rparr>, ''.text'' \<mapsto>
                 \<lparr>startpos = Some 4194304, length1 = Some 20,
                    contents = [Some 72, Some 199, Some 4, Some 37, Some b1, Some b2, Some b3, Some 0, Some 5, Some 0, Some 0, Some 0, Some 72, Some 139, Some 4, Some 37, Some 0, Some 0, Some 0,
                                Some 0]\<rparr>],
       by_range = set (meta0 addr) -
                  {(Some (''.text'', 4, 8),
                    SymbolRef \<lparr>ref = ref_rec0,
                                 maybe_reloc = Some \<lparr>ref_relent = \<lparr>elf64_ra_offset = uint64_of_nat 0, elf64_ra_info = 2, elf64_ra_addend = 0\<rparr>, ref_rel_scn = 0, ref_rel_idx = 0, ref_src_scn = 0\<rparr>,
                                 maybe_def_bound_to = Some (ApplyReloc, Some def_rec0)\<rparr>)},
       by_tag = by_tag_from_by_range (set (meta0 addr)) -
                {(SymbolRef \<lparr>ref = ref_rec0,
                               maybe_reloc = Some \<lparr>ref_relent = \<lparr>elf64_ra_offset = uint64_of_nat 0, elf64_ra_info = 2, elf64_ra_addend = 0\<rparr>, ref_rel_scn = 0, ref_rel_idx = 0, ref_src_scn = 0\<rparr>,
                               maybe_def_bound_to = Some (ApplyReloc, Some def_rec0)\<rparr>,
                  Some (''.text'', 4, 8))}\<rparr>"
using assms
  apply(simp only: img1_def append.simps rev.simps list.map map_of.simps fst_def snd_def split)
  apply(simp only: Let_def relocate_output_image_def)
  apply(subst lookupBy0_monstrosity, assumption)
  apply(simp only: foldl.simps range_tag.case split ref_and_reloc_rec0_def symbol_reference_and_reloc_site.simps)
  apply(simp only: option.case split reloc_site.simps get_elf64_relocation_a_type_def)
  apply(simp only: elf64_relocation_a.simps r_x86_64_pc32_def extract_elf64_relocation_r_type_def)
  apply(simp only: annotated_memory_image.simps Let_def)
  apply(subst magic_number_manipulation)
  apply(simp only: sysv_amd64_std_abi_def abi.simps)
  apply(subst abi_amd64_reloc_2_concrete)
  apply(simp only: split)
  apply(simp del: well_behaved_lem_ordering.simps natural_to_le_byte_list.simps)
  apply(simp only: write_natural_field_def element.simps Let_def)
  apply(simp only: elf_memory_image_defined_symbols_and_ranges_def)
  apply(subst taggedRanges_technical, assumption)
  apply(simp only: mapMaybe.simps split range_tag.case option.case list.case)
  apply(subst List.list.case_cong_weak[where list="[(some_range, some_def)\<leftarrow>[(Some (''.data'', addr, 8), def_rec0)] . some_def = def_rec0]" and list'="[(Some (''.data'', addr, 8), def_rec0)]"])
  apply simp
  apply(simp only: list.case split option.case)
  apply(subst element_and_offset_to_address_technical)
  apply(simp only: option.case if_True)
  apply(subst arg_cong[where f="\<lambda>x. 4 < x" and x="length (natural_to_le_byte_list (4194324 + of_nat addr - 4194308))" and y="length (natural_to_le_byte_list (16 + of_nat addr))"], simp)
  apply(subst if_weak_cong[where b="4 < length (natural_to_le_byte_list (16 + of_nat addr))" and c=False], simp)
  apply(simp only: if_False)
  apply(simp only: taggedRanges_technical mapMaybe.simps split range_tag.case option.case)
  apply(subst list.case_cong_weak[where list="[(some_range, some_def)\<leftarrow>[(Some (''.data'', addr, 8), def_rec0)] . some_def = def_rec0]" and list'="[(Some (''.data'', addr, 8), def_rec0)]"], simp)+
  apply(simp only: list.case split option.case element_and_offset_to_address.simps annotated_memory_image.simps)
  apply(subst option.case_cong_weak[where option="[''.text'' \<mapsto>
                                                 \<lparr>startpos = Some 4194304, length1 = Some 20,
                                                    contents = [Some 72, Some 199, Some 4, Some 37, Some (word_extract 7 0 0), Some (word_extract 15 8 0), Some (word_extract 23 16 0),
                                                                Some (word_extract 31 24 0), Some 5, Some 0, Some 0, Some 0, Some 72, Some 139, Some 4, Some 37, Some (word_extract 7 0 0),
                                                                Some (word_extract 15 8 0), Some (word_extract 23 16 0), Some (word_extract 31 24 0)]\<rparr>,
                                                 ''.data'' \<mapsto> \<lparr>startpos = Some 4194324, length1 = Some 8, contents = map Some (replicate 8 (of_nat 42))\<rparr>]
                                                 ''.data''" and option'="Some \<lparr>startpos = Some 4194324, length1 = Some 8, contents = map Some (replicate 8 (of_nat 42))\<rparr>"], simp)+
  apply(simp only: option.case element.simps)
  apply(subgoal_tac "natural_to_le_byte_list (4194324 + addr - 4194308) = natural_to_le_byte_list (16 + addr)")
  apply(simp del: well_behaved_lem_ordering.simps natural_to_le_byte_list.simps)
  apply simp
done

lemma X64_memory_of_memory_image_concrete:
  assumes "z = (4194304 + x)"
  shows "X64_memory_of_memory_image
     [''.data'' \<mapsto> \<lparr>startpos = Some 4194324, length1 = Some 8, contents = [Some 42, Some 42, Some 42, Some 42, Some 42, Some 42, Some 42, Some 42]\<rparr>, ''.text'' \<mapsto>
      \<lparr>startpos = Some 4194304, length1 = Some 20,
         contents = [Some 72, Some 199, Some 4, Some 37, Some b1, Some b2, Some b3, Some 0, Some 5, Some 0, Some 0, Some 0, Some 72, Some 139, Some 4, Some 37, Some 0, Some 0, Some 0, Some 0]\<rparr>] z =
         the ([Some 72, Some 199, Some 4, Some 37, Some b1, Some b2, Some b3, Some 0, Some 5, Some 0, Some 0, Some 0, Some 72, Some 139, Some 4, Some 37, Some 0, Some 0, Some 0, Some 0] ! x)"
sorry

lemma x64_decode_relocated_technical_1:
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
  assumes "natural_to_le_byte_list (16 + of_nat addr) = [b1, b2, b3]"
  shows "x64_decode (fst (x64_fetch (load_relocated_program_image flags (elements (relocation_image addr)) reg (4194304::nat)))) =
  Zfull_inst ([], Zmov (Z_ALWAYS, (Z64, Zrm_i (Zm (None, (ZnoBase, scast ((word_cat (0::8 word) ((word_cat b3 ((word_cat b2 b1)::16 word))::24 word))::32 word)::64 word)), 5::64 word))), [72::8 word, 139::8 word, 4::8 word, 37::8 word, 0::8 word, 0::8 word, 0::8 word, 0::8 word])"
using assms
  apply(simp only: x64_fetch_RIP fst_def X64_state.simps)
  apply(simp only: fst_def split append.simps list.simps)
  apply(subst x64_decode_Zmov_in)
  apply(simp only: append.simps list.simps simp_thms relocation_image_def relocatable_program_def)
  apply(simp only: concat.simps append_Nil2 mov_constant_to_mem_def mov_constant_from_mem_def)
  apply(subst encode_Zmov_in_concrete, eval, (rule refl)+)+
  apply(subst encode_Zmov_out_concrete, eval, (rule refl)+)+
  apply(simp only: append.simps)
  apply(subst img1_concrete, assumption+)+
  apply(simp only: annotated_memory_image.simps load_relocated_program_image_def X64_state.simps)
  apply(simp add: le_unat_uoi del: well_behaved_lem_ordering.simps natural_to_le_byte_list.simps)
  apply(intro conjI)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)+
  apply(simp del: well_behaved_lem_ordering.simps natural_to_le_byte_list.simps)
  apply eval (* XXX *)
done

value "(word_extract (15::nat) (0::nat) (5::32 word))::16 word"

fun flip_order :: "ordering \<Rightarrow> ordering" where
  "flip_order EQ = EQ" |
  "flip_order LT = GT" |
  "flip_order GT = LT"

lemma stringCompare_method_flip:
  shows "stringCompare_method x y = flip_order (stringCompare_method y x)"
sorry

lemma monstrosity_is_well_behaved:
  shows "well_behaved_lem_ordering
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
  apply(subst well_behaved_lem_ordering.simps)
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
    instance_Basic_classes_Ord_string_dict_def instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def
    instance_Basic_classes_Ord_Memory_image_range_tag_dict_def instance_Basic_classes_Ord_Maybe_maybe_dict_def)
  apply(simp only: Ord_class.simps)
  apply(rule conjI, clarify)
  apply(case_tac aa; case_tac ba; case_tac a; case_tac b)
  apply(clarify, simp only: pairGreater_def pairLess.simps Ord_class.simps tagCompare.simps maybeCompare.simps ordering.simps simp_thms)+
  apply(rule conjI, clarify)
  apply(case_tac aa; case_tac ba; case_tac a; case_tac b)
  apply(clarify, simp only: pairGreater_def pairLess.simps Ord_class.simps tagCompare.simps maybeCompare.simps ordering.simps simp_thms)+
  apply(rule conjI, clarify)
  apply(case_tac aa; case_tac ba; case_tac a; case_tac b)
  apply(clarify, simp only: pairGreater_def pairLess.simps pairCompare.simps Ord_class.simps tagCompare.simps maybeCompare.simps ordering.simps simp_thms set_simps, simp)+
  apply(case_tac "stringCompare_method ad ab")
sorry

lemma cases_20:
  fixes x :: nat
  assumes "x \<le> 20"
  shows "x = 0 \<or> x = 1 \<or> x = 2 \<or> x = 3 \<or> x = 4 \<or>
         x = 5 \<or> x = 6 \<or> x = 7 \<or> x = 8 \<or> x = 9 \<or>
         x = 10 \<or> x = 11 \<or> x = 12 \<or> x = 13 \<or> x = 14 \<or>
         x = 15 \<or> x = 16 \<or> x = 17 \<or> x = 18 \<or> x = 19 \<or> x = 20"
using assms
  apply(case_tac x, simp)
  apply(simp, case_tac nat, simp)
  apply(simp, case_tac nata, simp)
  apply(simp, case_tac natb, simp)
  apply(simp, case_tac natc, simp)
  apply(simp, case_tac natd, simp)
  apply(simp, case_tac nate, simp)
  apply(simp, case_tac natf, simp)
  apply(simp, case_tac natg, simp)
  apply(simp, case_tac nath, simp)
  apply(simp, case_tac nati, simp)
  apply(simp, case_tac natj, simp)
  apply(simp, case_tac natk, simp)
  apply(simp, case_tac natl, simp)
  apply(simp, case_tac natm, simp)
  apply(simp, case_tac natn, simp)
  apply(simp, case_tac nato, simp)
  apply(simp, case_tac natp, simp)
  apply(simp, case_tac natq, simp)
  apply(simp, case_tac natr, simp)
  apply auto
done

lemma illegal_address_manipulation:
  shows "\<forall>x\<le>20::nat. addr \<noteq> (y::nat) + x \<Longrightarrow> \<forall>x\<le>20::nat. of_nat addr \<noteq> ((of_nat (y + x))::64 word)"
  apply(rule allI, rule impI)
  apply(erule_tac x="x" in allE)
  apply(erule impE, assumption)
  apply(drule cases_20)
  apply auto
sorry

lemma fun_upd_removal:
  assumes "\<forall>x\<le>20::nat. addr \<noteq> (4194304::nat) + x"
  shows "(fun
                              (of_nat addr := word_extract (7::nat) (0::nat) (word_extract (15::nat) (0::nat) (word_extract (31::nat) (0::nat) (5::64 word))),
                               of_nat addr + (1::64 word) := word_extract (15::nat) (8::nat) (word_extract (15::nat) (0::nat) (word_extract (31::nat) (0::nat) (5::64 word))),
                               of_nat addr + (2::64 word) := word_extract (7::nat) (0::nat) (word_extract (31::nat) (16::nat) (word_extract (31::nat) (0::nat) (5::64 word))),
                               of_nat addr + (2::64 word) + (1::64 word) := word_extract (15::nat) (8::nat) (word_extract (31::nat) (16::nat) (word_extract (31::nat) (0::nat) (5::64 word))),
                               of_nat addr + (4::64 word) := 0::8 word, of_nat addr + (4::64 word) + (1::64 word) := 0::8 word, of_nat addr + (4::64 word) + (2::64 word) := 0::8 word,
                               of_nat addr + (4::64 word) + (2::64 word) + (1::64 word) := 0::8 word))
                              (of_nat (4194304::nat) + word_of_int (int ((20::nat) - length [72::8 word, 139::8 word, 4::8 word, 37::8 word, 0::8 word, 0::8 word, 0::8 word, 0::8 word]))) =
  fun (of_nat (4194304::nat) + word_of_int (int ((20::nat) - length [72::8 word, 139::8 word, 4::8 word, 37::8 word, 0::8 word, 0::8 word, 0::8 word, 0::8 word])))"
using assms
  apply(subst fun_upd_other, simp)
  apply(drule illegal_address_manipulation)
  apply(erule allE[where x=5], erule impE, simp)
  apply simp
  apply(subst fun_upd_other, simp)
  apply(drule illegal_address_manipulation)
  apply(erule allE[where x=6], erule impE, simp)
  apply simp
  apply(subst fun_upd_other, simp)
  apply(drule illegal_address_manipulation)
  apply(erule allE[where x=7], erule impE, simp)
  apply simp
  apply(subst fun_upd_other, simp)
  apply(drule illegal_address_manipulation)
  apply(erule allE[where x=8], erule impE, simp)
  apply simp
  apply(subst fun_upd_other, simp)
  apply(drule illegal_address_manipulation)
  apply(erule allE[where x=9], erule impE, simp)
  apply simp
  apply(subst fun_upd_other, simp)
  apply(drule illegal_address_manipulation)
  apply(erule allE[where x=10], erule impE, simp)
  apply simp
  apply(subst fun_upd_other, simp)
  apply(drule illegal_address_manipulation)
  apply(erule allE[where x=11], erule impE, simp)
  apply simp
  apply(subst fun_upd_other, simp)
  apply(drule illegal_address_manipulation)
  apply(erule allE[where x=12], erule impE, simp)
  apply simp+
done

lemma x64_decode_relocated_technical_2:
  assumes "natural_to_le_byte_list ((16::nat) + of_nat addr) = [b1, b2, b3]" and
    "address_is_disjoint_from_text_and_within_data_section addr 4194304 4194324 20 8"
  shows "x64_decode
                  (fst (x64_fetch (snd (write'mem64 (5::64 word, of_nat addr)
                                         (load_relocated_program_image flags (elements (relocation_image addr)) reg (4194304::nat)
                                          \<lparr>RIP := RIP (load_relocated_program_image flags (elements (relocation_image addr)) reg (4194304::nat)) +
                                                  word_of_int (int ((20::nat) - length [72::8 word, 139::8 word, 4::8 word, 37::8 word, 0::8 word, 0::8 word, 0::8 word, 0::8 word]))\<rparr>))))) = Zfull_inst([], Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, of_nat addr))), [])"
using assms
  apply(simp only: x64_decode.simps readPrefixes.simps)
  apply(simp only: relocation_image_def relocatable_program_def mov_constant_to_mem_def mov_constant_from_mem_def)
  apply(simp only: list.map)
  apply(subst encode_Zmov_in_concrete, eval, (rule refl)+)+
  apply(subst encode_Zmov_out_concrete, eval, (rule refl)+)+
  apply(simp only: concat.simps append.simps append_Nil2)
  apply(subst img1_concrete, rule monstrosity_is_well_behaved, assumption)+
  apply(simp only: annotated_memory_image.simps)
  apply(subst readPrefix.simps)
  apply(simp only: fst_def snd_def load_relocated_program_image_def X64_state.simps)
  apply(simp only: write'mem64.simps word_extract_63_32_5 word_extract_31_0_5 write'mem32.simps word_extract_31_16_0
    word_extract_15_0_0 word_extract_31_16_5 word_extract_15_0_5)
  apply(simp only: snd_def fst_def)
  apply(simp only: write'mem16.simps word_extract_15_8_0 word_extract_7_0_0 word_extract_15_8_5' word_extract_7_0_5')
  apply(simp only: snd_def fst_def)
  apply(simp only: write'mem8.simps split snd_def fst_def X64_state.simps)
  apply(simp only: x64_fetch_RIP X64_state.simps split list.case)
  apply(simp only: prefixGroup.simps)
  apply(drule illegal_addresses)
  apply(simp only: fun_upd_removal)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(subst X64_memory_of_memory_image_concrete, simp)
  apply(simp only: nth.simps)
  apply(simp only: eval_nat_numeral, simp only: BitM.simps nat.case)
  apply(simp only: eval_nat_numeral, simp only: BitM.simps nat.case)
  apply(simp only: eval_nat_numeral, simp only: BitM.simps nat.case)
  apply(simp only: eval_nat_numeral, simp only: BitM.simps nat.case)
  apply(simp only: eval_nat_numeral, simp only: BitM.simps nat.case)
  apply(simp only: eval_nat_numeral, simp only: BitM.simps nat.case)
  apply(simp only: Num.numerals One_nat_def nat.case)
  apply(simp only: option.the_def option.case)
  apply(subst if_weak_cong[where b="(72::8 word) = (240::8 word)" and c=False], eval, simp only: if_False)
  apply(subst if_weak_cong[where b="(72::8 word) = (242::8 word)" and c=False], eval, simp only: if_False)
  apply(subst if_weak_cong[where b="(72::8 word) = (243::8 word)" and c=False], eval, simp only: if_False)
  apply(subst if_weak_cong[where b="(72::8 word) = (38::8 word)" and c=False], eval, simp only: if_False)
  apply(subst if_weak_cong[where b="(72::8 word) = (46::8 word)" and c=False], eval, simp only: if_False)
  apply(subst if_weak_cong[where b="(72::8 word) = (54::8 word)" and c=False], eval, simp only: if_False)
  apply(subst if_weak_cong[where b="(72::8 word) = (62::8 word)" and c=False], eval, simp only: if_False)
  apply(subst if_weak_cong[where b="(72::8 word) = (100::8 word)" and c=False], eval, simp only: if_False)
  apply(subst if_weak_cong[where b="(72::8 word) = (101::8 word)" and c=False], eval, simp only: if_False)
  apply(subst if_weak_cong[where b="(72::8 word) = (102::8 word)" and c=False], eval, simp only: if_False)
  apply(subst if_weak_cong[where b="(72::8 word) = (103::8 word)" and c=False], eval, simp only: if_False)
  apply(subst if_weak_cong[where b="word_extract (Suc (Suc (Suc (Suc (Suc (Suc (Suc (0::nat)))))))) (Suc (Suc (Suc (Suc (0::nat))))) (72::8 word) = (4::4 word)" and c=True], eval, simp only: if_True)
  apply(simp only: Let_def)
  apply(subst if_weak_cong[where b="Suc (Suc (Suc (Suc (Suc (0::nat))))) = (0::nat)" and c=False], simp, simp only: if_False)
  apply(simp only: refl if_True option.case split)
  apply(subst rec'REX.simps)
  apply(simp only: list.set empty_iff simp_thms if_False)
sorry


lemma Run_fixed_Zmov_in_concrete:
  shows "Run (Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, of_nat addr), 5::64 word))) \<sigma> = write'EA (5::64 word, Zea_m (Z64, of_nat addr)) \<sigma>"
  apply(simp only: Run.simps instruction.case dfn'Zmov.simps read_cond.simps Zcond.simps)
  apply(simp only: split Let_def if_True fst_def ea_Zsrc.simps Zdest_src.simps EA.simps Zea.simps)
  apply(simp only: restrictSize.simps Zsize.simps ea_Zdest.simps Zdest_src.simps split)
  apply(simp only: fst_def ea_Zrm.simps Zrm.case split ea_index.simps option.case)
  apply(simp only: ea_base.simps Zbase.simps split add_0)
done

definition fixed_map :: "8 word \<Rightarrow> 8 word \<Rightarrow> 8 word \<Rightarrow> 8 word \<Rightarrow> 64 word \<Rightarrow> 8 word" where
  "fixed_map a1 a2 a3 a4 x \<equiv>
     let fmap =
       [4194323::nat \<mapsto> a4, 4194322::nat \<mapsto> a3, 4194321::nat \<mapsto> a2, 4194320::nat \<mapsto> a1,
        4194319::nat \<mapsto> 37::8 word, 4194318::nat \<mapsto> 4::8 word, 4194317::nat \<mapsto> 139::8 word, 4194316::nat \<mapsto> 72::8 word,
        4194315::nat \<mapsto> 0::8 word, 4194314::nat \<mapsto> 0::8 word, 4194313::nat \<mapsto> 0::8 word, 4194312::nat \<mapsto> 5::8 word,
        4194311::nat \<mapsto> a4, 4194310::nat \<mapsto> a3, 4194309::nat \<mapsto> a2, 4194308::nat \<mapsto> a1, 4194307::nat \<mapsto> 37::8 word,
        4194306::nat \<mapsto> 4::8 word, 4194305::nat \<mapsto> 199::8 word, 4194304::nat \<mapsto> 72::8 word]
    in case fmap (unat x) of
      None \<Rightarrow> 0
    | Some x \<Rightarrow> x"

lemma build_fixed_program_memory_expand_concrete:
  assumes "e_imm32 addr = [a1, a2, a3, a4]"
  shows "build_fixed_program_memory (4194304::nat) (encode (mov_constant_to_mem (5::64 word) addr) @ encode (mov_constant_from_mem addr)) =
    fixed_map a1 a2 a3 a4"
using assms
  apply(simp only: mov_constant_to_mem_def mov_constant_from_mem_def encode.simps instruction.case)
  apply(simp only: split Zcond.case Zsize.case Zdest_src.case Zrm.case)
  apply(simp only: e_rm_reg.simps e_gen_rm_reg.simps e_rm_imm.simps e_ModRM.simps Zrm.case split option.case Zbase.case)
  apply(simp only: list.case split append.simps e_opsize_imm.simps e_rm_reg.simps e_gen_rm_reg.simps e_opsize.simps Zsize.case)
  apply(simp only: simp_thms if_True Zsize.case concat.simps append.simps append_Nil2)
  apply(simp only: rex_prefix.simps)
  apply(subst if_weak_cong[where b="word_cat (0::1 word) (word_cat (word_extract (3::nat) (3::nat) (0::4 word)) (0::2 word)) OR (8::4 word) = (0::4 word)" and c="False"])
  apply eval (* XXX *)
  apply(simp only: if_False e_imm32.simps)
  apply(subst if_weak_cong[where b="(18446744071562067968::64 word) <=s (5::64 word) \<and> (5::64 word) <=s (2147483647::64 word)" and c="True"])
  apply eval (* XXX *)
  apply(simp only: if_True list.case split Let_def refl option.case)
  apply(simp only: Zreg_to_nat.simps Zreg.case)
  apply(subst if_weak_cong[where b="word_cat (0::1 word) (word_cat (word_extract (3::nat) (3::nat) (word_of_int (int (0::nat)))) (0::2 word)) OR (8::4 word) = (0::4 word)" and c="False"])
  apply eval (* XXX *)
  apply(simp only: if_False append.simps word_extract_15_8_5 word_extract_31_24_5 word_extract_7_0_5 word_extract_23_16_5 OR_198_1)
  apply(simp only: word_cat_8 word_of_int_of_int_0 OR_138_1 word_cat_4_8_72 word_cat_4)
  apply(rule ext, subst build_fixed_program_memory_def)
  apply(simp only: build_fixed_program_code_memory.simps map_of.simps fst_def snd_def nat.case split Let_def)
  apply(simp only: fixed_map_def Let_def)
  apply simp
done

lemma Run_fixed_Zmov_out_concrete:
  assumes "e_imm32 addr = [a1, a2, a3, a4]"
  shows "Run (Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, addr))))
             (snd (write'EA (5::64 word, Zea_m (Z64, addr))
                    \<lparr>EFLAGS = flags, MEM = build_fixed_program_memory (4194304::nat) (encode (mov_constant_to_mem (5::64 word) addr) @ encode (mov_constant_from_mem addr)),
                       REG = reg,
                       RIP = of_nat (4194304::nat) +
                             word_of_int
                              (int ((20::nat) -
                                    length [72::8 word, 139::8 word, 4::8 word, 37::8 word, word_extract (7::nat) (0::nat) addr, word_extract (15::nat) (8::nat) addr,
                                            word_extract (23::nat) (16::nat) addr, word_extract (31::nat) (24::nat) addr])),
                       exception = NoException\<rparr>)) = ((), \<lparr>EFLAGS = flags, MEM = (fixed_map a1 a2 a3 a4)
                          (addr := 5, (1::64 word) + addr := 0, (2::64 word) + addr := 0, (3::64 word) + addr := 0, (4::64 word) + addr := 0,
                          (5::64 word) + addr := 0, (6::64 word) + addr := 0, (7::64 word) + addr := 0),
       REG = reg(RAX := 5::64 word),
       RIP = 4194316::64 word, exception = NoException\<rparr>)"
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

lemma analyse_all_in_range:
  assumes "(4194324::nat) \<le> addr" and "addr \<le> (4194324::nat) + (8::nat)"
    and "P 4194324" and "P 4194325" and "P 4194326" and "P 4194327" and "P 4194328" and "P 4194329"
    and "P 4194330" and "P 4194331" and "P 4194332"
  shows "P addr"
using assms
sorry

lemma size_lemma:
  assumes "(4194324::nat) \<le> addr" and "addr \<le> (4194324::nat) + (8::nat)"
  shows "(18446744071562067968::64 word) <=s of_nat addr \<and> of_nat addr <=s (2147483647::64 word)"
using assms
  apply(rule analyse_all_in_range)
  apply simp_all
done

lemma three_bytes_exist:
  assumes "address_is_disjoint_from_text_and_within_data_section addr (4194304::nat) (4194324::nat)
        (length (encode (mov_constant_to_mem (5::64 word) (of_nat addr)) @ encode (mov_constant_from_mem (of_nat addr)))) (8::nat)"
  shows "\<exists>b1 b2 b3. natural_to_le_byte_list ((16::nat) + of_nat addr) = [b1, b2, b3]"
sorry

lemma Run_relocated_Zmov_in_concrete:
  fixes b1 b2 b3 :: "8 word"
  shows "Run (Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, (scast ((word_cat (0::8 word) ((word_cat b3 ((word_cat b2 b1)::16 word))::24 word))::32 word))::64 word), 5::64 word)))
                                         (load_relocated_program_image flags (elements (relocation_image addr)) reg (4194304::nat)
                                          \<lparr>RIP := RIP (load_relocated_program_image flags (elements (relocation_image addr)) reg (4194304::nat)) +
                                                  word_of_int (int ((20::nat) - length [72::8 word, 139::8 word, 4::8 word, 37::8 word, 0::8 word, 0::8 word, 0::8 word, 0::8 word]))\<rparr>) =
    write'mem64 (5::64 word, (scast ((word_cat (0::8 word) ((word_cat b3 ((word_cat b2 b1)::16 word))::24 word))::32 word))::64 word)
     (load_relocated_program_image flags (elements (relocation_image addr)) reg (4194304::nat)
      \<lparr>RIP := RIP (load_relocated_program_image flags (elements (relocation_image addr)) reg (4194304::nat)) +
              word_of_int (int ((20::nat) - length [72::8 word, 139::8 word, 4::8 word, 37::8 word, 0::8 word, 0::8 word, 0::8 word, 0::8 word]))\<rparr>)"
  apply(simp only: Run.simps instruction.case dfn'Zmov.simps read_cond.simps Zcond.case)
  apply(simp only: split Let_def if_True fst_def ea_Zsrc.simps Zdest_src.simps EA.simps Zea.simps)
  apply(simp only: ea_Zdest.simps Zdest_src.simps split fst_def ea_Zrm.simps Zrm.case)
  apply(simp only: ea_index.simps option.case split ea_base.simps Zbase.simps)
  apply(simp only: restrictSize.simps Zsize.simps add_0 write'EA.simps Zea.case split)
done

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
  apply(drule three_bytes_exist, elim exE)
  apply(subst x64_decode_relocated_technical_1, rule monstrosity_is_well_behaved, simp)+
  apply(simp only: Zinst.case split Run_relocated_Zmov_in_concrete)
  apply(subst x64_decode_relocated_technical_2)
(*
(Run (Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, of_nat addr))))
             (snd (write'EA (5::64 word, Zea_m (Z64, of_nat addr))
                    \<lparr>EFLAGS = flags, MEM = build_fixed_program_memory (4194304::nat) (encode (mov_constant_to_mem (5::64 word) (of_nat addr)) @ encode (mov_constant_from_mem (of_nat addr))),
                       REG = reg,
                       RIP = of_nat (4194304::nat) +
                             word_of_int
                              (int ((20::nat) -
                                    length [72::8 word, 139::8 word, 4::8 word, 37::8 word, word_extract (7::nat) (0::nat) (of_nat addr), word_extract (15::nat) (8::nat) (of_nat addr),
                                            word_extract (23::nat) (16::nat) (of_nat addr), word_extract (31::nat) (24::nat) (of_nat addr)])),
                       exception = NoException\<rparr>)
*)
  apply(subst Run_fixed_Zmov_out_concrete)
  

end