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

(* XXX: in library, somewhere?  find_theorems doesn't find it... *)
lemma nat_lesseq_elim:
  fixes m n :: nat
  assumes "m \<le> n"
  shows "m = n \<or> m < n"
using assms by auto

lemma possible_addresses_elim:
  assumes "address_is_disjoint_from_text_and_within_data_section addr text_start data_start program_len data_len"
  shows "possible_addresses data_start data_len addr"
sorry

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

declare [[show_types]]

(* XXX: ugly but necessary to control simplification below *)
lemma possible_addresses_8_unfold:
  fixes start addr :: nat
  shows "possible_addresses start (8\<Colon>nat) addr = (addr = start \<or>
         addr = Suc (start) \<or>
         addr = Suc (Suc (start)) \<or>
         addr = Suc (Suc (Suc (start))) \<or>
         addr = Suc (Suc (Suc (Suc (start)))) \<or>
         addr = Suc (Suc (Suc (Suc (Suc (start))))) \<or>
         addr = Suc (Suc (Suc (Suc (Suc (Suc (start)))))) \<or>
         addr = Suc (Suc (Suc (Suc (Suc (Suc (Suc (start))))))) \<or>
         addr = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (start)))))))))"
sorry

lemma encode_fixed_program_compute:
  fixes addr :: nat
  shows "possible_addresses 4194324 8 addr \<Longrightarrow>
    let field = (20 + (addr - 4194324)) in
    map encode [
      Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, of_nat addr), 5))
    , Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, of_nat addr)))
    ] =
    [[72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, of_nat field, 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word],
     [72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, of_nat field, 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word]]"
  apply(unfold possible_addresses_8_unfold)
  apply(subgoal_tac "word_cat (0\<Colon>1 word) ((word_cat ((word_extract (3\<Colon>nat) (3\<Colon>nat) (0\<Colon>4 word))::1 word) (0\<Colon>2 word))::3 word) OR (8\<Colon>4 word) = (8::4 word)")
  apply(erule disjE)
    apply(simp only: list.map encode.simps Let_def)
    apply(simp only: instruction.case split Zcond.case Zsize.case Zdest_src.case Zrm.case)
    apply(simp only: Zreg_to_nat.simps Zreg.simps)
    apply eval
  apply(erule disjE)
    apply(simp only: list.map encode.simps Let_def)
    apply(simp only: instruction.case split Zcond.case Zsize.case Zdest_src.case Zrm.case)
    apply(simp only: Zreg_to_nat.simps Zreg.simps)
    apply eval
  apply(erule disjE)
    apply(simp only: list.map encode.simps Let_def)
    apply(simp only: instruction.case split Zcond.case Zsize.case Zdest_src.case Zrm.case)
    apply(simp only: Zreg_to_nat.simps Zreg.simps)
    apply eval
  apply(erule disjE)
    apply(simp only: list.map encode.simps Let_def)
    apply(simp only: instruction.case split Zcond.case Zsize.case Zdest_src.case Zrm.case)
    apply(simp only: Zreg_to_nat.simps Zreg.simps)
    apply eval
  apply(erule disjE)
    apply(simp only: list.map encode.simps Let_def)
    apply(simp only: instruction.case split Zcond.case Zsize.case Zdest_src.case Zrm.case)
    apply(simp only: Zreg_to_nat.simps Zreg.simps)
    apply eval
  apply(erule disjE)
    apply(simp only: list.map encode.simps Let_def)
    apply(simp only: instruction.case split Zcond.case Zsize.case Zdest_src.case Zrm.case)
    apply(simp only: Zreg_to_nat.simps Zreg.simps)
    apply eval
  apply(erule disjE)
    apply(simp only: list.map encode.simps Let_def)
    apply(simp only: instruction.case split Zcond.case Zsize.case Zdest_src.case Zrm.case)
    apply(simp only: Zreg_to_nat.simps Zreg.simps)
    apply eval
  apply(erule disjE)
    apply(simp only: list.map encode.simps Let_def)
    apply(simp only: instruction.case split Zcond.case Zsize.case Zdest_src.case Zrm.case)
    apply(simp only: Zreg_to_nat.simps Zreg.simps)
    apply eval
    apply(simp only: list.map encode.simps Let_def)
    apply(simp only: instruction.case split Zcond.case Zsize.case Zdest_src.case Zrm.case)
    apply(simp only: Zreg_to_nat.simps Zreg.simps)
    apply eval+
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
  apply simp
done

lemma word_arith_technical1:
  assumes "x < 2^64 - 4194304"
  shows "(4194304\<Colon>64 word) + word_of_int (int (x\<Colon>nat)) = of_nat (4194304 + x)"
sorry

lemma word_arith_technical2:
  assumes "x < 2^64 - 4194316"
  shows "(4194316\<Colon>64 word) + word_of_int (int (x\<Colon>nat)) = of_nat (4194316 + x)"
sorry

lemma x64_fetch_fixed1:
  shows "x64_fetch \<lparr>EFLAGS = Map.empty,
                              MEM = build_fixed_program_memory (4194304\<Colon>nat)
                                     [72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word,
                                      72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word],
                              REG = \<lambda>x\<Colon>Zreg. 0\<Colon>64 word, RIP = 4194304\<Colon>64 word, exception = NoException\<rparr> =
  ([72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word,
      37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word],
     \<lparr>EFLAGS = Map.empty,
        MEM = build_fixed_program_memory (4194304\<Colon>nat)
               [72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 72\<Colon>8 word, 139\<Colon>8 word,
                4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word],
        REG = \<lambda>x\<Colon>Zreg. 0\<Colon>64 word, RIP = 4194304\<Colon>64 word, exception = NoException\<rparr>)"
  apply(simp only: x64_fetch.simps for_loop_19_unroll)
  apply(simp only: split snd_def X64_state.simps fst_def)
  apply(simp add: word_arith_technical1 build_fixed_program_memory_def)
done

lemma x64_fetch_fixed2:
  shows "x64_fetch \<lparr>EFLAGS = Map.empty,
                              MEM = (build_fixed_program_memory (4194304\<Colon>nat)
                                      [72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word,
                                       72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word])
                                (of_nat addr := 5\<Colon>8 word, of_nat addr + (1\<Colon>64 word) := 0\<Colon>8 word, of_nat addr + (2\<Colon>64 word) := 0\<Colon>8 word, (3\<Colon>64 word) + of_nat addr := 0\<Colon>8 word,
                                 of_nat addr + (4\<Colon>64 word) := 0\<Colon>8 word, (5\<Colon>64 word) + of_nat addr := 0\<Colon>8 word, (6\<Colon>64 word) + of_nat addr := 0\<Colon>8 word, (7\<Colon>64 word) + of_nat addr := 0\<Colon>8 word),
                              REG = \<lambda>x\<Colon>Zreg. 0\<Colon>64 word, RIP = 4194316\<Colon>64 word, exception = NoException\<rparr> =
    (yyyy,
     \<lparr>EFLAGS = Map.empty,
                              MEM = (build_fixed_program_memory (4194304\<Colon>nat)
                                      [72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word,
                                       72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word])
                                (of_nat addr := 5\<Colon>8 word, of_nat addr + (1\<Colon>64 word) := 0\<Colon>8 word, of_nat addr + (2\<Colon>64 word) := 0\<Colon>8 word, (3\<Colon>64 word) + of_nat addr := 0\<Colon>8 word,
                                 of_nat addr + (4\<Colon>64 word) := 0\<Colon>8 word, (5\<Colon>64 word) + of_nat addr := 0\<Colon>8 word, (6\<Colon>64 word) + of_nat addr := 0\<Colon>8 word, (7\<Colon>64 word) + of_nat addr := 0\<Colon>8 word),
                              REG = \<lambda>x\<Colon>Zreg. 0\<Colon>64 word, RIP = 4194316\<Colon>64 word, exception = NoException\<rparr>)"
  apply(simp only: x64_fetch.simps for_loop_19_unroll)
  apply(simp only: split snd_def fst_def X64_state.simps)
  apply(simp add: word_arith_technical2 build_fixed_program_memory_def)

lemma x64_decode_fixed1:
  fixes addr :: nat
  shows "x64_decode
           [72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 72\<Colon>8 word, 139\<Colon>8 word,
            4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word] =
         Zfull_inst ([], Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, of_nat addr\<Colon>64 word), 5\<Colon>64 word)), [72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word])"
sorry

lemma x64_next_fixed1:
  shows "x64_next \<lparr>EFLAGS = Map.empty,
                                     MEM = build_fixed_program_memory (4194304\<Colon>nat)
                                            [72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word,
                                             0\<Colon>8 word, 72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word],
                                     REG = \<lambda>x\<Colon>Zreg. 0\<Colon>64 word, RIP = 4194304\<Colon>64 word, exception = NoException\<rparr> = ((), \<lparr>EFLAGS = Map.empty,
            MEM = (build_fixed_program_memory (4194304\<Colon>nat)
                    [72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 72\<Colon>8 word,
                     139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word])
              (of_nat addr := 5::8 word,
               of_nat addr + (1\<Colon>64 word) := 0::8 word,
               of_nat addr + (2\<Colon>64 word) := 0::8 word,
               (3\<Colon>64 word) + of_nat addr := 0::8 word, of_nat addr + (4\<Colon>64 word) := 0\<Colon>8 word,
               (5\<Colon>64 word) + of_nat addr := 0\<Colon>8 word, (6\<Colon>64 word) + of_nat addr := 0\<Colon>8 word, (7\<Colon>64 word) + of_nat addr := 0\<Colon>8 word),
            REG = \<lambda>x\<Colon>Zreg. 0\<Colon>64 word, RIP = 4194316\<Colon>64 word, exception = NoException\<rparr>)"
  apply(simp only: x64_next.simps)
  apply(simp only: x64_fetch_fixed1 fst_def split)
  apply(simp only: x64_decode_fixed1)
  apply(simp only: Zinst.case split X64_state.simps)
  apply simp (* XXX: true by eval *)
sorry

lemma x64_next_fixed2:
  shows "x64_next \<lparr>EFLAGS = Map.empty,
                      MEM = (build_fixed_program_memory (4194304\<Colon>nat)
                              [72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word,
                               72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word])
                        (of_nat addr := 5\<Colon>8 word, of_nat addr + (1\<Colon>64 word) := 0\<Colon>8 word, of_nat addr + (2\<Colon>64 word) := 0\<Colon>8 word, (3\<Colon>64 word) + of_nat addr := 0\<Colon>8 word,
                         of_nat addr + (4\<Colon>64 word) := 0\<Colon>8 word, (5\<Colon>64 word) + of_nat addr := 0\<Colon>8 word, (6\<Colon>64 word) + of_nat addr := 0\<Colon>8 word, (7\<Colon>64 word) + of_nat addr := 0\<Colon>8 word),
                      REG = \<lambda>x\<Colon>Zreg. 0\<Colon>64 word, RIP = 4194316\<Colon>64 word, exception = NoException\<rparr> = xxx"
  apply(simp only: x64_next.simps)

lemma run_two_steps_fixed:
  shows "(run_two_steps
                      \<lparr>EFLAGS = Map.empty,
                         MEM = build_fixed_program_memory (4194304\<Colon>nat)
                                [72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word,
                                 72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, (20\<Colon>8 word) + of_nat (addr - (4194324\<Colon>nat)), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word],
                         REG = \<lambda>x\<Colon>Zreg. 0\<Colon>64 word, RIP = 4194304\<Colon>64 word, exception = NoException\<rparr>) = xxx"
  apply(simp only: run_two_steps_def snd_def)
  apply(simp only: x64_next_fixed1 split)

subsection {* The "big" theorem *}

text {* Finally, our correctness theorem which shows that our correctness property holds: *}
theorem correctness_property_True:
  shows "correctness_property"
  (* Unfold the lemma statement *)
  apply(simp only: correctness_property_def)
  apply(rule allI)
  (* Start work on the fixed program *)
  apply(simp only: fixed_program_def)
  apply(simp only: mov_constant_to_mem_def mov_constant_from_mem_def)
  apply(simp only: Let_def)
  apply(rule impI)
  apply safe
  apply(frule possible_addresses_elim)
  apply(drule encode_fixed_program_compute)
  apply(simp only: Let_def)
  apply clarify
  apply(simp only: concat.simps append.simps)
  apply(thin_tac "encode (Zmov (Z_ALWAYS, Z64, Zrm_i (Zm (None, ZnoBase, of_nat addr), 5\<Colon>64 word))) =
       [72\<Colon>8 word, 199\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, of_nat ((20\<Colon>nat) + (addr - (4194324\<Colon>nat))), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word, 5\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word, 0\<Colon>8 word]")
  apply(thin_tac "encode (Zmov (Z_ALWAYS, Z64, Zr_rm (RAX, Zm (None, ZnoBase, of_nat addr)))) =
       [72\<Colon>8 word, 139\<Colon>8 word, 4\<Colon>8 word, 37\<Colon>8 word, of_nat ((20\<Colon>nat) + (addr - (4194324\<Colon>nat))), 0\<Colon>8 word, 64\<Colon>8 word, 0\<Colon>8 word]")
  apply(simp only: load_fixed_program_instructions_def)
thm build_fixed_program_memory_def
  apply(simp add: build_fixed_program_memory_def)

end