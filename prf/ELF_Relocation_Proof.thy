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
begin

section {* Proof-of-concept relocation proof *}

subsection {* Useful definitions *}

text {* Mov an immediate constant into a location in memory. *}
definition mov_constant_to_mem :: "64 word \<Rightarrow> 64 word \<Rightarrow> instruction" where
  "mov_constant_to_mem constant addr \<equiv> Zmov (Z_ALWAYS, (Z64, Zrm_i (Zm (None, (ZnoBase, addr)), constant)))"

text {* The "fixed" program (i.e. the program that never changes and is never relocated) which
moves the immediate constant 5 into a fixed address in memory. *}
definition fixed_program :: "nat \<Rightarrow> 8 word list" where
  "fixed_program addr \<equiv>
     let (addr::64 word) = of_nat addr in
       encode (mov_constant_to_mem (5 :: 64 word) addr)"

text {* The program that will be relocated.  Moves an immediate constant 5 into some zero'd out
address.  The zero'd out address will be "fixed-up" by the relocation process set up in Test_image.thy. *}
definition relocatable_program :: "8 word list" where
  "relocatable_program \<equiv>
     encode (mov_constant_to_mem (5 :: 64 word) (0 :: 64 word))"

text {* The relocation image that the linker produces internally after relocation.  The relocatable
program above has now been relocated.  We will use this to populate a memory for the X64 emulation
below. *}
definition relocation_image :: "nat \<Rightarrow> nat \<Rightarrow> Abis.any_abi_feature annotated_memory_image" where
  "relocation_image addr data_size \<equiv> img1 addr data_size relocatable_program"

text {* Produce an X64 memory (a map from addresses to bytes) out of a memory image that we will
obtain from the relocation_image above. *}
definition X64_memory_of_memory_image :: "memory_image \<Rightarrow> (nat \<Rightarrow> 8 word)" where
  "X64_memory_of_memory_image i addr \<equiv>
     (* XXX: must be a better way than this, surely... *)
     (let keys = Map.dom i in
      let rels = { s. \<exists>k \<in> keys. Some s = i k \<and> addr \<ge> the (startpos s) \<and> addr < the (startpos s) + the (length1 s) } in
        if rels = {} then
          0
        else
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

text {* An address is "valid" in the correctness statement below whenever it resides within the
bounds of the data section, as expressed in the predicate below, and the bounds of the data section
can be fully described using 4 bytes (the width of the address field for the relocation). *}
definition valid_address :: "nat \<Rightarrow> nat \<Rightarrow> nat \<Rightarrow> bool" where
  "valid_address data_start data_len addr \<equiv>
     data_start \<le> addr \<and> addr < data_start + data_len \<and> data_start + data_len < 4294967296"

text {* We now have our (rather silly) correctness property, which serves to demonstrate that our
definitions are capable of supporting formal proof.  If we set the Isabelle execution mechanism up
correctly we could just execute this to obtain our theorem, but we will use proof instead.  Creating
two initial states for the X64 emulation out of our fixed and relocated program, we relocate and
demonstrate that the contents of memory are thereafter the same. *}
definition correctness_property :: "bool" where
  "correctness_property \<equiv>
     \<forall>addr data_size::nat. \<forall>flags :: Zeflags \<Rightarrow> bool option. \<forall>reg :: Zreg \<Rightarrow> 64 word.
       let fprogr  = fixed_program addr in
       let text_start   = 4194304 in (* Fixed in Test_image *)
       let data_start   = 4194316 in (* Fixed in Test_image *)
       let offset       = addr - data_start in
       (* The data section must not be empty, and the total size of that section added to its start address
          must not overflow a 64-bit word... *)
       1 \<le> data_size \<longrightarrow>
       valid_address data_start data_size addr \<longrightarrow>
       (\<forall> x \<in> unats 64.
       MEM (load_fixed_program_instructions flags fprogr reg text_start) (of_nat x) =
       MEM (load_relocated_program_image flags (elements (relocation_image offset data_size)) reg text_start) (of_nat x))"

subsection {* Useful lemmas and technical definitions *}

text {* The majority of the lemmas in this subsection are generic and not really tied to our
proof at all, but can be reused by any proof that uses the linker or the ELF model.  Some exceptions
to this include those that are talking about manipulation of concrete addresses which are fairly
specific to this proof.  However, the vast majority of the following lemmas are proving properties
of internal data structures inside the linker, or demonstrating that ordering functions are indeed
orders. *}

text {* Useful lemma for converting a valid_address assertion into a range of possible addresses. *}
lemma valid_address_elim:
  fixes addr data_size :: "nat"
  assumes "1 \<le> data_size" and "valid_address 4194316 data_size addr"
  shows "addr = Suc data_size \<or> (0 \<le> data_size \<and> valid_address 4194316 data_size addr)"
using assms unfolding valid_address_def by simp

text {* A technical lemma used for the lemma that immediately follows it.  An address that is
strictly less than the 4294967296 (32 bit) limit can fit within 4 bytes (the width of the relocation
address field) when converted to a byte list. *}
lemma natural_to_le_byte_list_limit:
  fixes addr :: nat
  assumes "addr < 4294967296"
  shows "length (natural_to_le_byte_list addr) \<le> 4"
using assms by simp

text {* When we apply relocation we need to show that the address can fit within the four byte
`space' reserved in the instruction's encoding address field.  This lemmas converts a valid_address
assertion into a proof that this is the case. *}
lemma valid_address_four_bytes:
  fixes data_size addr :: "nat"
  assumes "valid_address 4194316 data_size addr"
  shows "length (natural_to_le_byte_list addr) \<le> 4"
using assms
  apply(simp only: valid_address_def)
  apply(rule natural_to_le_byte_list_limit)
  apply auto
done

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

text {* These are useful for providing precise control over the simplifier and getting rid of
annoying sums that automation won't budge.  Some of these are unneccessary and left over from a
previous proof attempt, now, and should be cleaned up if we had more time to work on this proof... *}
lemma concrete_evaluations:
  shows "((word_extract (15::nat) (0::nat) (5::32 word))::16 word) = 5"
    and "(word_extract (7::nat) (0::nat) (5::16 word)::8 word) = 5"
    and "((word_extract (15::nat) (8::nat) (5::16 word))::8 word) = 0"
    and "(word_extract (31::nat) (16::nat) (5::32 word)::16 word) = 0"
    and "(word_extract (31::nat) (16::nat) (0::32 word)::16 word) = 0"
    and "(word_extract (7::nat) (0::nat) (0::16 word)::8 word) = 0"
    and "(word_extract (7::nat) (0::nat) (0::64 word)::8 word) = 0"
    and "(word_extract (15::nat) (0::nat) (0::32 word)::16 word) = 0"
    and "(word_extract (15::nat) (8::nat) (0::16 word)::8 word) = 0"
    and "(word_extract (15::nat) (8::nat) (0::64 word)::8 word) = 0"
    and "(word_extract (23::nat) (16::nat) (0::16 word)::8 word) = 0"
    and "(word_extract (23::nat) (16::nat) (0::64 word)::8 word) = 0"
    and "(word_extract (63::nat) (32::nat) (5::64 word)::32 word) = 0"
    and "(word_extract (31::nat) (24::nat) (0::64 word)::8 word) = 0"
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
    and "((word_extract (15::nat) (8::nat) ((word_extract (15::nat) (0::nat) ((word_extract (31::nat) (0::nat) (5::64 word))::32 word))::16 word))::8 word) = (0::8 word)"
    and "((word_extract (7::nat) (0::nat) ((word_extract (15::nat) (0::nat) ((word_extract (31::nat) (0::nat) (5::64 word))::32 word))::16 word))::8 word) = 5"
    and "((word_extract (15::nat) (8::nat) ((word_extract (31::nat) (16::nat) ((word_extract (31::nat) (0::nat) (5::64 word))::32 word))::16 word))::8 word) = 0"
    and "((word_extract (7::nat) (0::nat) ((word_extract (31::nat) (16::nat) ((word_extract (31::nat) (0::nat) (5::64 word))::32 word))::16 word))::8 word) = (0::8 word)"
    and "word_extract (7::nat) (0::nat) (5::64 word) = (5::8 word)"
    and "word_extract (15::nat) (8::nat) (5::64 word) = (0::8 word)"
    and "word_extract (23::nat) (16::nat) (5::64 word) = (0::8 word)"
    and "word_extract (31::nat) (24::nat) (5::64 word) = (0::8 word)"
    and "word_extract (31::nat) (0::nat) (5::64 word) = (5::8 word)"
    and "(((198::8 word) OR (1::8 word))::8 word) = (199::8 word)"
    and "(138::8 word) OR (1::8 word) = (139::8 word)"
    and "(word_cat (0::1 word) ((word_cat (0::1 word) (0::2 word))::3 word)::4 word) OR (8::4 word) = (8::4 word)"
    and "(4194316::64 word) = (((4194304::64 word) + ((of_nat 12)::64 word))::64 word)"
    and "(unat (uint64_land (of_int (int 2)) (of_int (int (65536 * 65536 - 1))))) = 2"
    and "((4194304::nat) + unat (4::64 word) - (4194304::nat)) = 4"
    and "((8::4 word) = (0::4 word)) = False"
    and "(of_nat (4194304::nat) + (5::64 word)) = (4194309::64 word)"
    and "((4194304::nat) + unat (7::64 word) - (4194304::nat)) = 7"
    and "(of_nat (4194304::nat) + (8::64 word)) = (4194312::64 word)"
    and "(of_nat (4194304::nat) + (11::64 word)) = (4194315::64 word)"
    and "((4194304::nat) + unat (10::64 word) - (4194304::nat)) = 10"
    and "(4194308::nat) - (4194304::nat) = 4"
    and "(4194309::nat) - (4194304::nat) = 5"
    and "(4194310::nat) - (4194304::nat) = 6"
    and "(4194312::nat) - (4194304::nat) = 8"
    and "(4194313::nat) - (4194304::nat) = 9"
    and "(4194314::nat) - (4194304::nat) = 10"
    and "(4194315::nat) - (4194304::nat) = 11"
    and "of_nat (4194316) + (1::64 word) = (of_nat (4194317)::64 word)"
    and "of_nat (4194316) + (2::64 word) = (of_nat (4194318)::64 word)"
    and "of_nat (4194316) + (3::64 word) = (of_nat (4194319)::64 word)"
    and "of_nat (4194316) + (4::64 word) = (of_nat (4194320)::64 word)"
    and "of_nat (4194316) + (5::64 word) = (of_nat (4194321)::64 word)"
    and "of_nat (4194316) + (6::64 word) = (of_nat (4194322)::64 word)"
    and "of_nat (4194316) + (7::64 word) = (of_nat (4194323)::64 word)"
    and "of_nat (4194316) + (8::64 word) = ((of_nat 4194324)::64 word)"
    and "of_nat (4194316) + (9::64 word) = ((of_nat 4194325)::64 word)"
    and "of_nat (4194316) + (10::64 word) = ((of_nat 4194326)::64 word)"
    and "of_nat (4194316) + (11::64 word) = ((of_nat 4194327)::64 word)"
    and "of_nat (4194316) + (12::64 word) = ((of_nat 4194328)::64 word)"
    and "of_nat (4194316) + (13::64 word) = ((of_nat 4194329)::64 word)"
    and "of_nat (4194316) + (14::64 word) = ((of_nat 4194330)::64 word)"
    and "of_nat (4194316) + (15::64 word) = ((of_nat 4194331)::64 word)"
    and "of_nat (4194316) + (16::64 word) = ((of_nat 4194332)::64 word)"
    and "of_nat (4194316) + (17::64 word) = ((of_nat 4194333)::64 word)"
    and "of_nat (4194316) + (18::64 word) = ((of_nat 4194334)::64 word)"
    and "of_nat (4194316) + (19::64 word) = ((of_nat 4194335)::64 word)"
    and "(4194316::nat) - (4194304::nat) = 12"
    and "(4194317::nat) - (4194304::nat) = 13"
    and "(4194318::nat) - (4194304::nat) = 14"
    and "(4194319::nat) - (4194304::nat) = 15"
    and "(4194320::nat) - (4194304::nat) = 16"
    and "(4194321::nat) - (4194304::nat) = 17"
    and "(4194322::nat) - (4194304::nat) = 18"
    and "(4194323::nat) - (4194304::nat) = 19"
    and "(4194324::nat) - (4194304::nat) = 20"
    and "(4194325::nat) - (4194304::nat) = 21"
    and "(4194326::nat) - (4194304::nat) = 22"
    and "(4194327::nat) - (4194304::nat) = 23"
    and "(4194328::nat) - (4194304::nat) = 24"
    and "(18446744071562067968::64 word) <=s (0::64 word) = True"
    and "(0::64 word) <=s (2147483647::64 word) = True"
by eval+

text {* This is split out of the lemma above as merging the two together causes a significant
slowdown in tactic application.  All of these equalities are only used in a single lemma at the
bottom of the file. *}
lemma concrete_evaluations':
  shows "(ucast ((4194316::64 word) AND mask 8)::8 word) = 12"
    and "ucast ((16384::64 word) AND mask (8::nat)) = (0::8 word)"
    and "ucast ((64::64 word) AND mask (8::nat)) = (64::8 word)"
    and "ucast ((4194316::64 word) AND mask (8::nat)) = (12::8 word)"
    and "ucast ((4194317::64 word) AND mask (8::nat)) = (13::8 word)"
    and "ucast ((4194318::64 word) AND mask (8::nat)) = (14::8 word)"
    and "ucast ((4194319::64 word) AND mask (8::nat)) = (15::8 word)"
    and "ucast ((4194320::64 word) AND mask (8::nat)) = (16::8 word)"
    and "ucast ((4194321::64 word) AND mask (8::nat)) = (17::8 word)"
    and "ucast ((4194322::64 word) AND mask (8::nat)) = (18::8 word)"
    and "ucast ((4194323::64 word) AND mask (8::nat)) = (19::8 word)"
by eval+

text {* Manipulation of a word+nat offset.  Useful when doing precise rewriting. *}
lemma of_nat_manipulate:
  "(of_nat m) + (n::'a::len word) = of_nat (m + unat n)"
by simp

text {* More useful equalities for precise simplification. *}
lemma word_to_nat_conversions:
  shows "(4194308::64 word) = of_nat 4194308"
    and "(4194309::64 word) = of_nat 4194309"
    and "(4194310::64 word) = of_nat 4194310"
    and "(4194312::64 word) = of_nat 4194312"
    and "(4194313::64 word) = of_nat 4194313"
    and "(4194314::64 word) = of_nat 4194314"
    and "(4194315::64 word) = of_nat 4194315"
    and "(4194316::64 word) = of_nat 4194316"
by simp_all

text {* Working around Isabelle's irritating and overly-generic treatment of numerals... *}
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
unfolding set_choose_def by(metis (mono_tags) insert_iff singletonD someI)

lemma genericCompare_refl:
  fixes x :: "'a::order"
  shows "(genericCompare (op <) (op =) x y = EQ) = (x = y)"
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

lemma quintupleCompare_refl:
  assumes "\<forall>p. cmp1 p p = EQ" and "\<forall>q. cmp2 q q = EQ" and "\<forall>r. cmp3 r r = EQ" and "\<forall>s. cmp4 s s = EQ"
    and "\<forall>s. cmp5 s s = EQ"
  shows "quintupleCompare cmp1 cmp2 cmp3 cmp4 cmp5 (p, q, r, s, t) (p, q, r, s, t) = EQ"
using assms
  apply(simp only: quintupleCompare.simps)
  apply(rule pairCompare_refl, simp)
  apply(rule allI, case_tac q, clarify, rule pairCompare_refl, simp+)
  apply((rule allI)+, simp add: pairCompare.simps)
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
  apply(rule allI, simp add: genericCompare_refl)+
done

lemma relocSiteCompare_refl:
  shows "relocSiteCompare r r = EQ"
  apply(simp only: relocSiteCompare_def)
  apply(rule quadrupleCompare_refl)
  apply(rule allI, rule elf64_relocation_a_compare_refl)
  apply(rule allI, simp add: genericCompare_refl)+
done

lemma elf64_symbol_table_entry_compare_refl:
  shows "elf64_symbol_table_entry_compare e e = EQ"
  apply(simp only: elf64_symbol_table_entry_compare_def)
  apply(rule sextupleCompare_refl)
  apply(rule allI, simp add: genericCompare_refl)+
done

lemma stringCompare_method_refl:
  shows "stringCompare_method s s = EQ"
  apply(simp only: stringCompare_method_def)
  apply(simp add: ord.lexordp_eq_refl)
done

lemma symRefCompare_refl:
  shows "symRefCompare r r = EQ"
  apply(simp only: symRefCompare_def)
  apply(rule quadrupleCompare_refl) (* XXX: what is happening with the first comparison, here? *)
  apply(rule allI, rule stringCompare_method_refl)
  apply(rule allI, rule elf64_symbol_table_entry_compare_refl)
  apply(rule allI, simp add: genericCompare_refl)+
done

lemma symDefCompare_refl:
  shows "symDefCompare d d = EQ"
  apply(simp only: symDefCompare_def) (* XXX: what is going on with the first comparison, here? *)
  apply(rule quintupleCompare_refl)
  apply(rule allI, rule stringCompare_method_refl)
  apply(rule allI, rule elf64_symbol_table_entry_compare_refl)
  apply(rule allI, simp add: genericCompare_refl)+
done

lemma maybeCompare_refl:
  assumes "\<forall>x. cmp x x = EQ"
  shows "maybeCompare cmp m m = EQ"
using assms
  apply(case_tac m)
  apply(simp only: maybeCompare.simps)+
done

lemma relocDecisionCompare_refl:
  shows "relocDecisionCompare d d = EQ"
  apply(case_tac d; simp)
  apply(case_tac x3; simp)
  apply(rule tripleCompare_refl)
  apply(rule allI, simp add: genericCompare_refl)
  apply(rule allI, rule symRefCompare_refl)
  apply(rule allI, rule relocSiteCompare_refl)
done

lemma symRefAndRelocSiteCompare_refl:
  shows "symRefAndRelocSiteCompare r r = EQ"
  apply(simp only: symRefAndRelocSiteCompare_def)
  apply(rule tripleCompare_refl)
  apply(rule allI, rule symRefCompare_refl)
  apply(rule allI, rule maybeCompare_refl)
  apply(rule allI, simp only: relocSiteCompare_refl)
  apply(rule allI, rule maybeCompare_refl)
  apply(rule allI)
  apply(case_tac x, clarify)
  apply(rule pairCompare_refl)
  apply(rule allI, rule relocDecisionCompare_refl)
  apply(rule allI, rule maybeCompare_refl)
  apply(rule allI, rule symDefCompare_refl)
done

lemma stringCompare_method_Nil_Cons:
  shows "stringCompare_method [] (x#xs) = LT"
using stringCompare_method_def by simp

lemma stringCompare_method_Cons_Nil:
  shows "stringCompare_method (x#xs) [] = GT"
using stringCompare_method_def by simp

lemma stringCompare_tri:
  shows "stringGreater x y \<or> stringLess x y \<or> x = y"
  apply(induction x arbitrary: y)
  apply(case_tac y; clarify)
  apply(simp only: stringLess_def stringCompare_method_Nil_Cons)
  apply(case_tac y; clarify)
  apply(simp add: stringGreater_def stringLess_def stringCompare_method_Nil_Cons)
  apply(simp only: stringGreater_def stringLess_def stringCompare_method_def)
  apply simp
  apply(smt nat_of_char_eq_iff not_less_iff_gr_or_eq)
done

lemma stringLess_stringGreater:
  assumes "stringLess x y"
  shows "\<not> stringGreater x y"
using assms unfolding stringLess_def stringGreater_def
  apply(induction x arbitrary: y)
  apply(case_tac y; clarify)
  apply(simp add: stringCompare_method_refl)
  apply(simp add: stringCompare_method_Cons_Nil)
  apply(case_tac y; clarify)
  apply(simp add: stringCompare_method_Cons_Nil)
  apply(smt ordering.distinct(1) ordering.distinct(3) stringCompare_method_def)
done

lemma lexicographicCompareBy_refl:
  assumes "\<And>x. cmp x x = EQ"
  shows "lexicographicCompareBy cmp l l = EQ"
using assms
  apply(induction l)
  apply(simp_all add: lexicographicCompareBy.simps genericCompare_def)
done

lemma elf64_header_compare_refl:
  shows "elf64_header_compare h h = EQ"
  apply(case_tac h; clarify)
  apply(simp add: elf64_header_compare_def pairCompare.simps)
  apply(subst lexicographicCompareBy_refl, simp only: genericCompare_def, simp)+
  apply simp
done

lemma compare_elf64_section_header_table_entry_refl:
  shows "compare_elf64_section_header_table_entry x x = EQ"
  apply(case_tac x; clarify)
  apply(simp only: compare_elf64_section_header_table_entry_def)
  apply(subst lexicographicCompareBy_refl, simp only: genericCompare_def, simp)
  apply simp
done

lemma compare_elf64_program_header_table_entry_refl:
  shows "compare_elf64_program_header_table_entry x x = EQ"
  apply(case_tac x; clarify)
  apply(simp only: compare_elf64_program_header_table_entry_def)
  apply(subst lexicographicCompareBy_refl, simp only: genericCompare_def, simp)
  apply simp
done

lemma compare_byte_refl:
  shows "compare_byte x x = EQ"
  apply(simp only: compare_byte_def)
  apply(simp add: genericCompare_refl)
done

lemma compare_byte_sequence_refl:
  shows "compare_byte_sequence q q = EQ"
  apply(case_tac q; clarify)
  apply(simp only: compare_byte_sequence_def)
  apply(rule lexicographicCompareBy_refl)
  apply(rule compare_byte_refl)
done

lemma compare_elf64_interpreted_section_refl:
  shows "compare_elf64_interpreted_section x x = EQ"
  apply(case_tac x; clarify)
  apply(simp only: compare_elf64_interpreted_section_def)
  apply(rule tripleCompare_refl)
  apply(rule allI, rule lexicographicCompareBy_refl, simp add: genericCompare_def)
  apply(rule allI, rule compare_byte_sequence_refl)
  apply(rule allI, rule stringCompare_method_refl)
done

lemma compare_elf64_interpreted_segment_refl:
  shows " compare_elf64_interpreted_segment x x = EQ"
  apply(case_tac x; clarify)
  apply(simp only: compare_elf64_interpreted_segment_def)
  apply(rule tripleCompare_refl)
  apply(rule allI, rule compare_byte_sequence_refl)
  apply(rule allI, rule lexicographicCompareBy_refl, simp add: genericCompare_refl)+
done

lemma elfFileFeatureCompare_refl:
  shows "elfFileFeatureCompare e e = EQ"
  apply(case_tac e; clarify)
  apply(simp add: elfFileFeatureCompare.simps elf64_header_compare_refl)
  apply(simp add: elfFileFeatureCompare.simps)
  apply(subst lexicographicCompareBy_refl, simp add: compare_elf64_section_header_table_entry_refl, rule refl)
  apply(simp add: elfFileFeatureCompare.simps)
  apply(subst lexicographicCompareBy_refl, simp add: compare_elf64_program_header_table_entry_refl, rule refl)
  apply(simp add: elfFileFeatureCompare.simps)
  apply(rule pairCompare_refl, rule allI, simp add: genericCompare_refl, rule allI, rule compare_elf64_interpreted_section_refl)
  apply(simp add: elfFileFeatureCompare.simps)
  apply(rule pairCompare_refl, rule allI, simp add: genericCompare_refl, rule allI, rule compare_elf64_interpreted_segment_refl)
done

lemma tagCompare_refl:
  assumes "\<And>y. compare_method dict y y = EQ"
  shows "tagCompare dict x x = EQ"
using assms
  apply(case_tac x; clarify)
  apply(simp_all add: tagCompare.simps symDefCompare_refl symRefAndRelocSiteCompare_refl elfFileFeatureCompare_refl)
done

lemma genericCompare_GT_genericCompare_LT:
  fixes x y :: "'a::linorder"
  assumes "genericCompare (op <) (op =) x y = GT"
  shows "genericCompare (op <) (op =) y x = LT"
using assms antisym_conv3 unfolding genericCompare_def by fastforce

lemma pairCompare_GT_pairCompare_LT:
  assumes "pairCompare cmp1 cmp2 x y = GT"
    and "\<And>x y. cmp1 x y = GT \<Longrightarrow> cmp1 y x = LT"
    and "\<And>x y. cmp2 x y = GT \<Longrightarrow> cmp2 y x = LT"
  shows "pairCompare cmp1 cmp2 y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: pairCompare.simps)
  apply(case_tac "cmp1 aa a"; case_tac "cmp1 a aa"; auto)
done

lemma pairCompare_LT_pairCompare_GT:
  assumes "pairCompare cmp1 cmp2 x y = LT"
    and "\<And>x y. cmp1 x y = LT \<Longrightarrow> cmp1 y x = GT"
    and "\<And>x y. cmp2 x y = LT \<Longrightarrow> cmp2 y x = GT"
  shows "pairCompare cmp1 cmp2 y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: pairCompare.simps)
  apply(case_tac "cmp1 aa a"; case_tac "cmp1 a aa"; auto)
done

lemma tripleCompare_LT_tripleCompare_GT:
  assumes "tripleCompare cmp1 cmp2 cmp3 x y = LT"
    and "\<And>x y. cmp1 x y = LT \<Longrightarrow> cmp1 y x = GT"
    and "\<And>x y. cmp2 x y = LT \<Longrightarrow> cmp2 y x = GT"
    and "\<And>x y. cmp3 x y = LT \<Longrightarrow> cmp3 y x = GT"
  shows "tripleCompare cmp1 cmp2 cmp3 y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: tripleCompare.simps)
  apply(rule pairCompare_LT_pairCompare_GT, assumption, simp)
  apply(rule pairCompare_LT_pairCompare_GT, assumption, simp)
  apply simp
done

lemma tripleCompare_GT_tripleCompare_LT:
  assumes "tripleCompare cmp1 cmp2 cmp3 x y = GT"
    and "\<And>x y. cmp1 x y = GT \<Longrightarrow> cmp1 y x = LT"
    and "\<And>x y. cmp2 x y = GT \<Longrightarrow> cmp2 y x = LT"
    and "\<And>x y. cmp3 x y = GT \<Longrightarrow> cmp3 y x = LT"
  shows "tripleCompare cmp1 cmp2 cmp3 y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: tripleCompare.simps)
  apply(rule pairCompare_GT_pairCompare_LT, assumption, simp)
  apply(rule pairCompare_GT_pairCompare_LT, assumption, simp)
  apply simp
done

lemma maybeCompare_LT_maybeCompare_GT:
  assumes "maybeCompare cmp x y = LT" and "\<And>x y. cmp x y = LT \<Longrightarrow> cmp y x = GT"
  shows "maybeCompare cmp y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: maybeCompare.simps)
done

lemma maybeCompare_GT_maybeCompare_LT:
  assumes "maybeCompare cmp x y = GT" and "\<And>x y. cmp x y = GT \<Longrightarrow> cmp y x = LT"
  shows "maybeCompare cmp y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: maybeCompare.simps)
done

lemma genericCompare_LT_genericCompare_GT:
  fixes x y :: "'a::order"
  assumes "genericCompare (op <) (op =) x y = LT"
  shows "genericCompare (op <) (op =) y x = GT"
using assms unfolding genericCompare_def
  apply(case_tac "y < x"; simp)
  apply(case_tac "x < y"; simp)
  apply(case_tac "x = y"; simp)
  apply auto
done

lemma stringCompare_method_GT_stringCompare_method_LT:
  assumes "stringCompare_method x y = GT"
  shows "stringCompare_method y x = LT"
using assms
  apply(induction x arbitrary: y)
  apply(case_tac y; simp add: stringCompare_method_def)
  apply(case_tac y)
  apply(simp add: stringCompare_method_def)
  apply clarify
  apply(simp only: stringCompare_method_def)
  apply(subst ord.lexordp_eq.simps)
  apply(smt ord.lexordp_eq_simps(4) ordering.distinct(3))
done

lemma stringCompare_method_LT_stringCompare_method_GT:
  assumes "stringCompare_method x y = LT"
  shows "stringCompare_method y x = GT"
using assms
  apply(induction x arbitrary: y)
  apply(case_tac y; simp add: stringCompare_method_def)
  apply(case_tac y)
  apply(simp add: stringCompare_method_def)
  apply clarify
  apply(simp only: stringCompare_method_def)
  apply(simp only: Let_def)
  apply(case_tac "ord.lexordp_eq (\<lambda>x y. nat_of_char x < nat_of_char y) (a # x) (aa # list)"; simp)
  apply auto
done

lemma elf64_symbol_table_entry_compare_GT_elf64_symbol_table_entry_compare_LT:
  assumes "elf64_symbol_table_entry_compare x y = GT"
  shows "elf64_symbol_table_entry_compare y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: elf64_symbol_table_entry_compare_def sextupleCompare.simps)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
done

lemma elf64_symbol_table_entry_compare_LT_elf64_symbol_table_entry_compare_GT:
  assumes "elf64_symbol_table_entry_compare x y = LT"
  shows "elf64_symbol_table_entry_compare y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: elf64_symbol_table_entry_compare_def sextupleCompare.simps)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
done

lemma symDefCompare_GT_symDefCompare_LT:
  assumes "symDefCompare x y = GT"
  shows "symDefCompare y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: symDefCompare_def quintupleCompare.simps)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule stringCompare_method_GT_stringCompare_method_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule elf64_symbol_table_entry_compare_GT_elf64_symbol_table_entry_compare_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)+
done

lemma symDefCompare_LT_symDefCompare_GT:
  assumes "symDefCompare x y = LT"
  shows "symDefCompare y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: symDefCompare_def quintupleCompare.simps)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule stringCompare_method_LT_stringCompare_method_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule elf64_symbol_table_entry_compare_LT_elf64_symbol_table_entry_compare_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)+
done

lemma symRefCompare_GT_symRefCompare_LT:
  assumes "symRefCompare x y = GT"
  shows "symRefCompare y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: symRefCompare_def quadrupleCompare.simps)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule stringCompare_method_GT_stringCompare_method_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule elf64_symbol_table_entry_compare_GT_elf64_symbol_table_entry_compare_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
done

lemma elf64_relocation_a_compare_GT_elf64_relocation_a_compare_LT:
  assumes "elf64_relocation_a_compare x y = GT"
  shows "elf64_relocation_a_compare y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: elf64_relocation_a_compare_def tripleCompare.simps pairCompare.simps)
  apply(simp only: genericCompare_def)
  apply(case_tac "unat elf64_ra_offseta < unat elf64_ra_offset"; simp)
  apply(case_tac "elf64_ra_offset = elf64_ra_offseta"; simp)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)+
  apply(case_tac "unat elf64_ra_offset < unat elf64_ra_offseta"; simp)
done

lemma relocSiteCompare_GT_relocSiteCompare_LT:
  assumes "relocSiteCompare x y = GT"
  shows "relocSiteCompare y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: relocSiteCompare_def quadrupleCompare.simps)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule elf64_relocation_a_compare_GT_elf64_relocation_a_compare_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)+
done

lemma symRefCompare_LT_symRefCompare_GT:
  assumes "symRefCompare x y = LT"
  shows "symRefCompare y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: symRefCompare_def quadrupleCompare.simps)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule stringCompare_method_LT_stringCompare_method_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule elf64_symbol_table_entry_compare_LT_elf64_symbol_table_entry_compare_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
done

lemma relocDecisionCompare_GT_relocDecisionCompare_LT:
  assumes "relocDecisionCompare x y = GT"
  shows "relocDecisionCompare y x = LT"
using assms
  apply(case_tac x; case_tac y; simp)
  apply(rule tripleCompare_GT_tripleCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule symRefCompare_GT_symRefCompare_LT, assumption)
  apply(rule relocSiteCompare_GT_relocSiteCompare_LT, assumption)
done

lemma symRefAndRelocSiteCompare_GT_symRefAndRelocSiteCompare_LT:
  assumes "symRefAndRelocSiteCompare x y = GT"
  shows "symRefAndRelocSiteCompare y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: symRefAndRelocSiteCompare_def tripleCompare.simps)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule symRefCompare_GT_symRefCompare_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule maybeCompare_GT_maybeCompare_LT, assumption)
  apply(rule relocSiteCompare_GT_relocSiteCompare_LT, assumption)
  apply(rule maybeCompare_GT_maybeCompare_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule relocDecisionCompare_GT_relocDecisionCompare_LT, assumption)
  apply(rule maybeCompare_GT_maybeCompare_LT, assumption)
  apply(rule symDefCompare_GT_symDefCompare_LT, assumption)
done

lemma elf64_relocation_a_compare_LT_elf64_relocation_a_compare_GT:
  assumes "elf64_relocation_a_compare x y = LT"
  shows "elf64_relocation_a_compare y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: elf64_relocation_a_compare_def tripleCompare.simps pairCompare.simps)
  apply(simp only: genericCompare_def)
  apply(case_tac "unat elf64_ra_offseta < unat elf64_ra_offset"; simp)
  apply(case_tac "elf64_ra_offset = elf64_ra_offseta"; simp)
  apply(case_tac "unat elf64_ra_offset < unat elf64_ra_offseta"; simp)
  apply(simp only: pairCompare.simps genericCompare_def)
  apply(case_tac "unat elf64_ra_infoa < unat elf64_ra_info"; simp)
  apply auto[1]
  apply auto[1]
  apply(simp only: pairCompare.simps genericCompare_def)
  apply(case_tac "unat elf64_ra_infoa < unat elf64_ra_info"; simp)
  apply(case_tac "elf64_ra_info = elf64_ra_infoa"; simp)
  apply(case_tac "unat elf64_ra_info < unat elf64_ra_infoa"; simp)
  apply auto
done

lemma relocSiteCompare_LT_relocSiteCompare_GT:
  assumes "relocSiteCompare x y = LT"
  shows "relocSiteCompare y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: relocSiteCompare_def quadrupleCompare.simps)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule elf64_relocation_a_compare_LT_elf64_relocation_a_compare_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)+
done

lemma relocDecisionCompare_LT_relocDecisionCompare_GT:
  assumes "relocDecisionCompare x y = LT"
  shows "relocDecisionCompare y x = GT"
using assms
  apply(case_tac x; case_tac y; simp only: relocDecisionCompare.simps ordering.simps)
  apply(rule tripleCompare_LT_tripleCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule symRefCompare_LT_symRefCompare_GT, assumption)
  apply(rule relocSiteCompare_LT_relocSiteCompare_GT, assumption)
done

lemma symRefAndRelocSiteCompare_LT_symRefAndRelocSiteCompare_GT:
  assumes "symRefAndRelocSiteCompare x y = LT"
  shows "symRefAndRelocSiteCompare y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: symRefAndRelocSiteCompare_def pairCompare.simps)
  apply(rule tripleCompare_LT_tripleCompare_GT, assumption)
  apply(rule symRefCompare_LT_symRefCompare_GT, assumption)
  apply(rule maybeCompare_LT_maybeCompare_GT, assumption)
  apply(rule relocSiteCompare_LT_relocSiteCompare_GT, assumption)
  apply(rule maybeCompare_LT_maybeCompare_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule relocDecisionCompare_LT_relocDecisionCompare_GT, assumption)
  apply(rule maybeCompare_LT_maybeCompare_GT, assumption)
  apply(rule symDefCompare_LT_symDefCompare_GT, assumption)
done

lemma lexicographicCompareBy_GT_lexicographicCompareBy_LT:
  assumes "lexicographicCompareBy cmp xs ys = GT" and "\<And>x y. cmp x y = GT \<Longrightarrow> cmp y x = LT"
  shows "lexicographicCompareBy cmp ys xs = LT"
using assms
  apply(induction xs arbitrary: ys)
  apply(case_tac ys; simp add: lexicographicCompareBy.simps)
  apply(case_tac ys; simp add: lexicographicCompareBy.simps)
  apply(case_tac "cmp aa a"; simp)
  apply(metis ordering.exhaust ordering.simps)
done

lemma lexicographicCompareBy_LT_lexicographicCompareBy_GT:
  assumes "lexicographicCompareBy cmp xs ys = LT" and "\<And>x y. cmp x y = LT \<Longrightarrow> cmp y x = GT"
  shows "lexicographicCompareBy cmp ys xs = GT"
using assms
  apply(induction xs arbitrary: ys)
  apply(case_tac ys; simp add: lexicographicCompareBy.simps)
  apply(case_tac ys; simp add: lexicographicCompareBy.simps)
  apply(case_tac "cmp aa a"; simp)
  apply(metis ordering.exhaust ordering.simps)
done

lemma elf64_header_compare_GT_elf64_header_compare_LT:
  assumes "elf64_header_compare x y = GT"
  shows "elf64_header_compare y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: elf64_header_compare_def)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule lexicographicCompareBy_GT_lexicographicCompareBy_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule lexicographicCompareBy_GT_lexicographicCompareBy_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
done

lemma compare_elf64_section_header_table_entry_GT_compare_elf64_section_header_table_entry_LT:
  assumes "compare_elf64_section_header_table_entry x y = GT"
  shows "compare_elf64_section_header_table_entry y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: compare_elf64_section_header_table_entry_def)
  apply(rule lexicographicCompareBy_GT_lexicographicCompareBy_LT, assumption)
  apply(simp add: genericCompare_def)
  apply(case_tac "xa < ya", auto)
done

lemma compare_elf64_program_header_table_entry_GT_compare_elf64_program_header_table_entry_LT:
  assumes "compare_elf64_program_header_table_entry x y = GT"
  shows "compare_elf64_program_header_table_entry y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: compare_elf64_program_header_table_entry_def)
  apply(rule lexicographicCompareBy_GT_lexicographicCompareBy_LT, assumption)
  apply(simp add: genericCompare_def)
  apply(case_tac "xa < ya", auto)
done

lemma compare_byte_GT_compare_byte_LT:
  assumes "compare_byte x y = GT"
  shows "compare_byte y x = LT"
using assms unfolding compare_byte_def
  apply(rule genericCompare_GT_genericCompare_LT)
done

lemma compare_byte_sequence_GT_compare_byte_sequence_LT:
  assumes "compare_byte_sequence x y = GT"
  shows "compare_byte_sequence y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: compare_byte_sequence_def)
  apply(rule lexicographicCompareBy_GT_lexicographicCompareBy_LT, assumption)
  apply(rule compare_byte_GT_compare_byte_LT, assumption)
done

lemma compare_elf64_interpreted_section_GT_compare_elf64_interpreted_section_LT:
  assumes "compare_elf64_interpreted_section x y = GT"
  shows "compare_elf64_interpreted_section y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: compare_elf64_interpreted_section_def)
  apply(simp only: tripleCompare.simps)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule lexicographicCompareBy_GT_lexicographicCompareBy_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule compare_byte_sequence_GT_compare_byte_sequence_LT, assumption)
  apply(rule stringCompare_method_GT_stringCompare_method_LT, assumption)
done

lemma compare_elf64_interpreted_segment_GT_compare_elf64_interpreted_segment_LT:
  assumes "compare_elf64_interpreted_segment x y = GT"
  shows "compare_elf64_interpreted_segment y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: compare_elf64_interpreted_segment_def tripleCompare.simps)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule compare_byte_sequence_GT_compare_byte_sequence_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule lexicographicCompareBy_GT_lexicographicCompareBy_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule lexicographicCompareBy_GT_lexicographicCompareBy_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
done

lemma elfFileFeatureCompare_GT_elfFileFeatureCompare_LT:
  assumes "elfFileFeatureCompare x y = GT"
  shows "elfFileFeatureCompare y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: elfFileFeatureCompare.simps)
  apply(rule elf64_header_compare_GT_elf64_header_compare_LT, assumption)
  apply(rule lexicographicCompareBy_GT_lexicographicCompareBy_LT, assumption,
    rule compare_elf64_section_header_table_entry_GT_compare_elf64_section_header_table_entry_LT,
    assumption)
  apply(rule lexicographicCompareBy_GT_lexicographicCompareBy_LT, assumption,
    rule compare_elf64_program_header_table_entry_GT_compare_elf64_program_header_table_entry_LT,
    assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)+
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule compare_elf64_interpreted_section_GT_compare_elf64_interpreted_section_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)
  apply(rule compare_elf64_interpreted_segment_GT_compare_elf64_interpreted_segment_LT, assumption)
done

lemma elf64_header_compare_LT_elf64_header_compare_GT:
  assumes "elf64_header_compare x y = LT"
  shows "elf64_header_compare y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: elf64_header_compare_def)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule lexicographicCompareBy_LT_lexicographicCompareBy_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule lexicographicCompareBy_LT_lexicographicCompareBy_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
done

lemma compare_elf64_section_header_table_entry_LT_compare_elf64_section_header_table_entry_GT:
  assumes "compare_elf64_section_header_table_entry x y = LT"
  shows "compare_elf64_section_header_table_entry y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: compare_elf64_section_header_table_entry_def)
  apply(rule lexicographicCompareBy_LT_lexicographicCompareBy_GT, assumption)
  apply(simp add: genericCompare_def)
  apply(case_tac "xa < ya"; simp)
  apply(case_tac "xa = ya"; simp)
done

lemma compare_elf64_program_header_table_entry_LT_compare_elf64_program_header_table_entry_GT:
  assumes "compare_elf64_program_header_table_entry x y = LT"
  shows "compare_elf64_program_header_table_entry y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: compare_elf64_program_header_table_entry_def)
  apply(rule lexicographicCompareBy_LT_lexicographicCompareBy_GT, assumption)
  apply(simp add: genericCompare_def)
  apply(case_tac "xa < ya"; simp)
  apply(case_tac "xa = ya"; simp)
done

lemma compare_byte_LT_compare_byte_GT:
  assumes "compare_byte x y = LT"
  shows "compare_byte y x = GT"
using assms unfolding compare_byte_def
  apply(rule genericCompare_LT_genericCompare_GT)
done

lemma compare_byte_sequence_LT_compare_byte_sequence_GT:
  assumes "compare_byte_sequence x y = LT"
  shows "compare_byte_sequence y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: compare_byte_sequence_def)
  apply(rule lexicographicCompareBy_LT_lexicographicCompareBy_GT, assumption)
  apply(rule compare_byte_LT_compare_byte_GT, assumption)
done

lemma compare_elf64_interpreted_section_LT_compare_elf64_interpreted_section_GT:
  assumes "compare_elf64_interpreted_section x y = LT"
  shows "compare_elf64_interpreted_section y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: compare_elf64_interpreted_section_def tripleCompare.simps)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule lexicographicCompareBy_LT_lexicographicCompareBy_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule compare_byte_sequence_LT_compare_byte_sequence_GT, assumption)
  apply(rule stringCompare_method_LT_stringCompare_method_GT, assumption)
done

lemma compare_elf64_interpreted_segment_LT_compare_elf64_interpreted_segment_GT:
  assumes "compare_elf64_interpreted_segment x y = LT"
  shows "compare_elf64_interpreted_segment y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: compare_elf64_interpreted_segment_def tripleCompare.simps)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule compare_byte_sequence_LT_compare_byte_sequence_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule lexicographicCompareBy_LT_lexicographicCompareBy_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule lexicographicCompareBy_LT_lexicographicCompareBy_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
done

lemma elfFileFeatureCompare_LT_elfFileFeatureCompare_GT:
  assumes "elfFileFeatureCompare x y = LT"
  shows "elfFileFeatureCompare y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: elfFileFeatureCompare.simps)
  apply(rule elf64_header_compare_LT_elf64_header_compare_GT, assumption)
  apply(rule lexicographicCompareBy_LT_lexicographicCompareBy_GT, assumption,
    rule compare_elf64_section_header_table_entry_LT_compare_elf64_section_header_table_entry_GT,
    assumption)
  apply(rule lexicographicCompareBy_LT_lexicographicCompareBy_GT, assumption,
    rule compare_elf64_program_header_table_entry_LT_compare_elf64_program_header_table_entry_GT,
    assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)+
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule compare_elf64_interpreted_section_LT_compare_elf64_interpreted_section_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)
  apply(rule compare_elf64_interpreted_segment_LT_compare_elf64_interpreted_segment_GT, assumption)
done

lemma tagCompare_GT_tagCompare_LT:
  assumes "tagCompare dict x y = GT" and "\<And>x y. compare_method dict x y = GT \<Longrightarrow> compare_method dict y x = LT"
  shows "tagCompare dict y x = LT"
using assms
  apply(case_tac x; case_tac y; clarify; subst tagCompare.simps; subst (asm) tagCompare.simps)
  apply(metis ordering.simps, metis ordering.simps, metis ordering.simps, metis ordering.simps,
    metis ordering.simps, metis ordering.simps, metis ordering.simps, metis ordering.simps,
    metis ordering.simps, metis ordering.simps, metis ordering.simps, metis ordering.simps,
    metis ordering.simps, metis ordering.simps, rule symDefCompare_GT_symDefCompare_LT, assumption,
    metis ordering.simps, metis ordering.simps, metis ordering.simps, metis ordering.simps,
    metis ordering.simps, metis ordering.simps, rule symRefAndRelocSiteCompare_GT_symRefAndRelocSiteCompare_LT, assumption,
    metis ordering.simps, metis ordering.simps, metis ordering.simps, metis ordering.simps,
    metis ordering.simps, metis ordering.simps, rule elfFileFeatureCompare_GT_elfFileFeatureCompare_LT, assumption,
    metis ordering.simps, metis ordering.simps, metis ordering.simps, metis ordering.simps,
    metis ordering.simps, metis ordering.simps, meson)
done

lemma tagCompare_LT_tagCompare_GT:
  assumes "tagCompare dict x y = LT" and "\<And>x y. compare_method dict x y = LT \<Longrightarrow> compare_method dict y x = GT"
  shows "tagCompare dict y x = GT"
using assms
  apply(case_tac x; case_tac y; clarify; subst tagCompare.simps; subst (asm) tagCompare.simps)
  apply((metis ordering.simps)+, rule symDefCompare_LT_symDefCompare_GT, assumption,
    (metis ordering.simps)+, rule symRefAndRelocSiteCompare_LT_symRefAndRelocSiteCompare_GT, assumption,
    (metis ordering.simps)+, rule elfFileFeatureCompare_LT_elfFileFeatureCompare_GT, assumption,
    (metis ordering.simps)+)
done

lemma stringCompare_method_neq_not_EQ_Cons:
  assumes "x \<noteq> y"
  shows "stringCompare_method (x#xs) (y#ys) \<noteq> EQ"
using assms
  apply auto
  apply(auto simp add: stringCompare_method_def Let_def)
  apply(case_tac "(nat_of_char x < nat_of_char y \<or> \<not> nat_of_char y < nat_of_char x \<and> ord.lexordp_eq (\<lambda>x y. nat_of_char x < nat_of_char y) xs ys) \<and>
        (nat_of_char y < nat_of_char x \<or> \<not> nat_of_char x < nat_of_char y \<and> ord.lexordp_eq (\<lambda>x y. nat_of_char x < nat_of_char y) ys xs)")
  apply(simp_all)
  apply(erule conjE)
  apply(erule disjE)
  apply(erule disjE)
  apply(metis less_not_sym)
  apply(erule conjE, simp)
  apply(erule disjE, erule conjE, simp)
  apply(erule conjE)+
  apply(simp add: inj_eq inj_nat_of_char)
  apply(erule disjE)
  apply(case_tac "nat_of_char x < nat_of_char y \<or> \<not> nat_of_char y < nat_of_char x \<and> ord.lexordp_eq (\<lambda>x y. nat_of_char x < nat_of_char y) xs ys", simp_all)
  apply(case_tac "\<not> nat_of_char y < nat_of_char x \<and> ord.lexordp_eq (\<lambda>x y. nat_of_char x < nat_of_char y) xs ys", simp_all)
  apply(case_tac "nat_of_char x < nat_of_char y \<or> ord.lexordp_eq (\<lambda>x y. nat_of_char x < nat_of_char y) xs ys", simp_all)
done

lemma stringCompare_method_neq_not_EQ:
  assumes "s \<noteq> t"
  shows "stringCompare_method s t \<noteq> EQ"
using assms proof(auto)
  fix s t :: string
  assume "s \<noteq> t" and "stringCompare_method s t = EQ"
  thus False
  proof(induction s arbitrary: t)
    fix t :: string
    assume "[] \<noteq> t" and *: "stringCompare_method [] t = EQ"
    from this obtain x xs where "t = x#xs" by (metis list.exhaust)
    hence "stringCompare_method [] (x#xs) = EQ" using * by simp
    hence "LT = EQ" using stringCompare_method_def by simp
    thus False using ordering.simps by simp
  next
    fix xs t :: string and x :: char
    assume IH: "(\<And>t. xs \<noteq> t \<Longrightarrow> stringCompare_method xs t = EQ \<Longrightarrow> False)" and "x#xs \<noteq> t" and *: "stringCompare_method (x # xs) t = EQ"
    hence "t = [] \<or> (\<exists>y ys. t = y#ys \<and> (x \<noteq> y \<or> ys \<noteq> xs))" by(metis remove_duplicates.cases)
    thus False
    proof
      assume "t = []"
      hence "stringCompare_method (x#xs) [] = EQ" using * by simp
      hence "GT = EQ" using stringCompare_method_def by simp
      thus False by simp
    next
      assume "\<exists>y ys. t = y # ys \<and> (x \<noteq> y \<or> ys \<noteq> xs)"
      from this obtain y ys where "t = y # ys \<and> (x \<noteq> y \<or> x = y \<and> ys \<noteq> xs)" by blast
      hence EQ: "t = y#ys" and C: "(x \<noteq> y \<or> x = y \<and> ys \<noteq> xs)" by simp+
      from C show False
      proof
        assume NEQ: "x \<noteq> y"
        hence "stringCompare_method (x#xs) (y#ys) = EQ" using * and EQ by simp
        thus False using stringCompare_method_def NEQ stringCompare_method_neq_not_EQ_Cons by simp
      next
        assume "x = y \<and> ys \<noteq> xs"
        hence "x = y" and NEQ: "ys \<noteq> xs" by simp+
        hence "stringCompare_method (x#xs) (x#ys) = EQ" using * and EQ by simp
        hence "stringCompare_method xs ys = EQ" using stringCompare_method_def by simp
        thus False using IH NEQ by metis
      qed
    qed
  qed
qed

corollary stringCompare_method_refl':
  shows "stringCompare_method x y = EQ \<longleftrightarrow> x = y"
using stringCompare_method_neq_not_EQ stringCompare_method_refl by auto

lemma elf64_symbol_table_entry_compare_refl':
  shows "(elf64_symbol_table_entry_compare x y = EQ) \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: elf64_symbol_table_entry_compare_def sextupleCompare.simps pairCompare.simps)
  apply(simp add: genericCompare_def pairCompare.simps)
done

lemma symDefCompare_refl':
  shows "symDefCompare x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: symDefCompare_def quintupleCompare.simps pairCompare.simps)
  apply(case_tac "stringCompare_method def_symname def_symnamea"; simp; (metis ordering.distinct stringCompare_method_refl')?)
  apply(simp add: pairCompare.simps)
  apply(case_tac "elf64_symbol_table_entry_compare def_syment def_symenta"; simp; (metis ordering.distinct elf64_symbol_table_entry_compare_refl')?)
  apply(simp add: pairCompare.simps genericCompare_def)
  apply(metis elf64_symbol_table_entry_compare_refl' stringCompare_method_refl')
done

corollary symDefCompare_tri:
  shows "symDefCompare x y = LT \<or> symDefCompare x y = GT \<or> x = y"
  apply(case_tac "symDefCompare x y"; simp add: symDefCompare_refl')
done

lemma symRefCompare_refl':
  shows "symRefCompare x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: symRefCompare_def quadrupleCompare.simps pairCompare.simps)
  apply(case_tac "stringCompare_method ref_symname ref_symnamea"; simp; (metis ordering.distinct stringCompare_method_refl')?)
  apply(simp add: pairCompare.simps)
  apply(case_tac "elf64_symbol_table_entry_compare ref_syment ref_symenta"; simp; (metis ordering.distinct elf64_symbol_table_entry_compare_refl')?)
  apply(simp add: pairCompare.simps genericCompare_def)
  apply(metis elf64_symbol_table_entry_compare_refl' stringCompare_method_refl')
done

lemma elf64_relocation_a_compare_refl':
  shows "elf64_relocation_a_compare x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: elf64_relocation_a_compare_def tripleCompare.simps pairCompare.simps genericCompare_def)
done

lemma relocSiteCompare_refl':
  shows "relocSiteCompare x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: relocSiteCompare_def quadrupleCompare.simps pairCompare.simps)
  apply(case_tac "elf64_relocation_a_compare ref_relent ref_relenta"; simp; (metis ordering.distinct elf64_relocation_a_compare_refl')?)
  apply(simp add: genericCompare_def pairCompare.simps)
  apply(metis elf64_relocation_a_compare_refl')
done

lemma pairCompare_refl':
  assumes "\<And>x y. cmp1 x y = EQ \<longleftrightarrow> x = y" and "\<And>x y. cmp2 x y = EQ \<longleftrightarrow> x = y"
  shows "pairCompare cmp1 cmp2 x y = EQ \<longleftrightarrow> x = y"
using assms
  apply(case_tac x; case_tac y; simp add: pairCompare.simps)
  apply(smt ordering.exhaust ordering.simps(7) ordering.simps(8) ordering.simps(9))
done

lemma maybeCompare_refl':
  assumes "\<And>x y. cmp x y = EQ \<longleftrightarrow> x = y"
  shows "maybeCompare cmp x y = EQ \<longleftrightarrow> x = y"
using assms
  apply auto
  apply(case_tac x; case_tac y; simp add: maybeCompare.simps)
  apply(case_tac x; case_tac y; simp add: maybeCompare.simps)
done

lemma relocDecisionCompare_refl':
  shows "relocDecisionCompare x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp)
  apply(case_tac x3; case_tac x3a; simp)
  apply(simp only: tripleCompare.simps)
  apply(subst pairCompare_refl')
  apply(simp add: genericCompare_def)
  apply(subst pairCompare_refl')
  apply(simp add: symRefCompare_refl')
  apply(simp add: relocSiteCompare_refl')
  apply simp+
done

lemma symRefAndRelocSiteCompare_refl':
  shows "symRefAndRelocSiteCompare x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: symRefAndRelocSiteCompare_def tripleCompare.simps pairCompare.simps)
  apply(case_tac "symRefCompare ref refa"; simp; (metis ordering.distinct symRefCompare_refl')?)
  apply(simp add: pairCompare.simps)
  apply(case_tac "maybeCompare relocSiteCompare maybe_reloc maybe_reloca"; simp)
  apply(metis ordering.distinct relocSiteCompare_refl' maybeCompare_refl')
  apply(smt pairCompare_refl' maybeCompare_refl' symDefCompare_refl' relocDecisionCompare_refl' relocSiteCompare_refl' symRefCompare_refl')
  apply(metis ordering.distinct maybeCompare_refl' relocSiteCompare_refl')
done

lemma symRefAndRelocSiteCompare_tri:
  shows "symRefAndRelocSiteCompare x y = LT \<or> symRefAndRelocSiteCompare x y = GT \<or> x = y"
  apply(case_tac "symRefAndRelocSiteCompare x y"; simp add: symRefAndRelocSiteCompare_refl')
done

lemma lexicographicCompareBy_refl':
  assumes "\<And>x y. cmp x y = EQ \<longleftrightarrow> x = y"
  shows "lexicographicCompareBy cmp x y = EQ \<longleftrightarrow> x = y"
using assms
  apply(induction x arbitrary: y)
  apply(case_tac y; simp add: lexicographicCompareBy.simps)
  apply(case_tac y; simp add: lexicographicCompareBy.simps)
  apply(case_tac "cmp a aa")
  apply clarify
  apply(subst ordering.case_cong_weak[where ordering'=LT], assumption)
  apply(metis ordering.distinct ordering.simps)
  apply(subst ordering.case_cong_weak[where ordering'=EQ], assumption)
  apply simp
  apply(subst ordering.case_cong_weak[where ordering'=GT], assumption)
  apply(simp only: ordering.case)
  apply(metis ordering.distinct ordering.simps)
done

lemma tripleCompare_refl':
  assumes "\<And>x y. cmp1 x y = EQ \<longleftrightarrow> x = y"
    and "\<And>x y. cmp2 x y = EQ \<longleftrightarrow> x = y"
    and "\<And>x y. cmp3 x y = EQ \<longleftrightarrow> x = y"
  shows "tripleCompare cmp1 cmp2 cmp3 x y = EQ \<longleftrightarrow> x = y"
using assms
  apply(case_tac x; case_tac y; simp add: tripleCompare.simps pairCompare.simps)
  apply(case_tac "cmp1 a aa"; simp)
  apply(metis ordering.distinct)
  apply(case_tac "cmp1 aa aa")
  apply(subst ordering.case_cong_weak[where ordering'=LT], assumption, simp)
  apply(metis ordering.distinct)
  apply(subst ordering.case_cong_weak[where ordering'=EQ], assumption, simp)
  apply(simp add: pairCompare_refl')
  apply(subst ordering.case_cong_weak[where ordering'=GT], assumption, simp)
  apply(metis ordering.distinct)
  apply(metis ordering.distinct)
done

lemma elf64_header_compare_refl':
  shows "(elf64_header_compare x y = EQ) = (x = y)"
  apply(case_tac x; case_tac y; simp add: elf64_header_compare_def pairCompare.simps lexicographicCompareBy.simps genericCompare_def)
  apply(case_tac "lexicographicCompareBy (genericCompare op < op =) (map unat elf64_ident) (map unat elf64_identa)"; simp)
  apply(metis genericCompare_refl lexicographicCompareBy_refl' genericCompare_def ordering.distinct)
  apply(subst (asm) lexicographicCompareBy_refl', simp add: genericCompare_def)
  apply(subst lexicographicCompareBy_refl', simp add: genericCompare_def)
  apply(simp only: list.inject)
  apply auto
  apply(rule list.inj_map_strong[where f="unat" and fa="unat"], simp, simp)
  apply(metis genericCompare_refl lexicographicCompareBy_refl' genericCompare_def ordering.distinct)
done

lemma compare_elf64_section_header_table_entry_refl':
  shows "compare_elf64_section_header_table_entry x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: compare_elf64_section_header_table_entry_def)
  apply(subst lexicographicCompareBy_refl', simp add: genericCompare_def)
  apply auto
done

lemma compare_elf64_program_header_table_entry_refl':
  shows "compare_elf64_program_header_table_entry x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: compare_elf64_program_header_table_entry_def)
  apply(subst lexicographicCompareBy_refl', simp add: genericCompare_def)
  apply auto
done

lemma compare_byte_refl':
  shows "compare_byte b1 b2 = EQ \<longleftrightarrow> b1 = b2"
unfolding compare_byte_def
  apply(simp add: genericCompare_def)
done

lemma byte_list_of_byte_sequence_refl':
  shows "byte_list_of_byte_sequence ss = byte_list_of_byte_sequence ts \<longleftrightarrow> ss = ts"
  apply(case_tac ss; case_tac ts; clarify)
  apply(simp add: byte_list_of_byte_sequence.simps)
done

lemma compare_byte_sequence_refl':
  shows "compare_byte_sequence bs1 bs2 = EQ \<longleftrightarrow> bs1 = bs2"
unfolding compare_byte_sequence_def
  apply(subst lexicographicCompareBy_refl', simp add: compare_byte_refl')
  apply(simp add: byte_list_of_byte_sequence_refl')
done

lemma compare_elf64_interpreted_section_refl':
  shows "compare_elf64_interpreted_section x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: compare_elf64_interpreted_section_def)
  apply(simp only: tripleCompare.simps)
  apply(subst pairCompare_refl')
  apply(subst lexicographicCompareBy_refl')
  apply(simp add: genericCompare_def, rule refl)
  apply(subst pairCompare_refl')
  apply(subst compare_byte_sequence_refl', simp)
  apply(subst stringCompare_method_refl')
  apply simp_all
done

lemma natural_of_bool_refl':
  shows "natural_of_bool b1 = natural_of_bool b2 \<longleftrightarrow> b1 = b2"
  apply(case_tac b1; case_tac b2; simp add: natural_of_bool.simps)
done

lemma compare_elf64_interpreted_segment_refl':
  shows "compare_elf64_interpreted_segment x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: compare_elf64_interpreted_segment_def tripleCompare.simps pairCompare.simps)
  apply(case_tac "compare_byte_sequence elf64_segment_body elf64_segment_bodya", simp)
  apply(metis ordering.distinct compare_byte_sequence_refl')
  apply simp
  apply(case_tac "(pairCompare (lexicographicCompareBy (genericCompare op < op =)) (lexicographicCompareBy (genericCompare op < op =))
         ([elf64_segment_type, elf64_segment_size, elf64_segment_memsz, elf64_segment_base, elf64_segment_paddr, elf64_segment_align, elf64_segment_offset],
          case elf64_segment_flags of (f1, f2, f3) \<Rightarrow> [natural_of_bool f1, natural_of_bool f2, natural_of_bool f3])
         ([elf64_segment_typea, elf64_segment_sizea, elf64_segment_memsza, elf64_segment_basea, elf64_segment_paddra, elf64_segment_aligna, elf64_segment_offseta],
          case elf64_segment_flagsa of (f1, f2, f3) \<Rightarrow> [natural_of_bool f1, natural_of_bool f2, natural_of_bool f3]) =
        EQ)")
  apply(subst (asm) pairCompare_refl', simp add: lexicographicCompareBy_refl' genericCompare_refl)
  apply(case_tac elf64_segment_flags; case_tac elf64_segment_flagsa; simp)
  apply(subst (asm) compare_byte_sequence_refl')
  apply(subst (asm) natural_of_bool_refl')+
  apply(subst pairCompare_refl', simp add: lexicographicCompareBy_refl' genericCompare_refl, simp)
  apply(smt pairCompare_refl' lexicographicCompareBy_refl' genericCompare_refl ordering.distinct)
  apply(metis ordering.simps ordering.distinct compare_byte_sequence_refl')
done

lemma elfFileFeatureCompare_refl':
  shows "elfFileFeatureCompare x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: elfFileFeatureCompare.simps)
  apply(simp add: elf64_header_compare_refl')
  apply(simp add: lexicographicCompareBy_refl' compare_elf64_section_header_table_entry_refl')
  apply(simp add: lexicographicCompareBy_refl' compare_elf64_program_header_table_entry_refl')
  apply(rule pairCompare_refl', rule genericCompare_refl, rule compare_elf64_interpreted_section_refl')
  apply(rule pairCompare_refl', rule genericCompare_refl, rule compare_elf64_interpreted_segment_refl')
done

corollary elfFileFeatureCompare_tri:
  shows "elfFileFeatureCompare x y = LT \<or> elfFileFeatureCompare x y = GT \<or> x = y"
  apply(case_tac "elfFileFeatureCompare x y"; simp add: elfFileFeatureCompare_refl')
done

lemma tup2_dict_preserves_well_behavedness:
  fixes dict1 :: "'a Ord_class" and dict2 :: "'b Ord_class"
  assumes "well_behaved_lem_ordering (isLess_method dict1) (isLessEqual_method dict1) (isGreater_method dict1)
            (compare_method dict1)" and
    "well_behaved_lem_ordering (isLess_method dict2) (isLessEqual_method dict2) (isGreater_method dict2)
      (compare_method dict2)"
  shows "well_behaved_lem_ordering (isLess_method (instance_Basic_classes_Ord_tup2_dict dict1 dict2))
    (isLessEqual_method (instance_Basic_classes_Ord_tup2_dict dict1 dict2))
    (isGreater_method (instance_Basic_classes_Ord_tup2_dict dict1 dict2))
    (compare_method (instance_Basic_classes_Ord_tup2_dict dict1 dict2))"
using assms unfolding instance_Basic_classes_Ord_tup2_dict_def
  apply(simp only: Ord_class.simps well_behaved_lem_ordering.simps)
  apply(erule conjE)+
  apply(rule conjI, (rule allI)+, case_tac x, case_tac y, clarify)
  apply(unfold pairGreater_def[where dict_Basic_classes_Ord_a="dict1"], assumption)
  apply(rule conjI, (rule allI)+, case_tac x, case_tac y, clarify)
  apply(rule conjI, (rule allI)+, case_tac x, case_tac y, clarify)
  apply(rule conjI, (subst (asm) pairLess.simps)+, blast, metis pairLess.simps)
  apply(rule conjI, (rule allI)+, case_tac x, case_tac y, clarify)
  apply(subst (asm) pairLess.simps, meson)
  apply(rule conjI, (rule allI)+, case_tac x, case_tac y, clarify)
  apply(subst (asm) pairLess.simps, meson)
  apply(rule conjI, (rule allI)+, case_tac x, case_tac y, clarify)
  apply((subst (asm) pairLess.simps)+, meson)
  apply(rule conjI, (rule allI)+, case_tac x, case_tac y, clarify)
  apply((subst (asm) pairLess.simps)+, meson)
  apply(rule conjI, (rule allI)+, case_tac x, case_tac y, clarify)
  apply((subst (asm) pairLess.simps)+, meson)
  apply(rule conjI, (rule allI)+, case_tac x, case_tac y, clarify)
  apply((subst (asm) pairLess.simps)+, meson)
  apply(rule conjI, (rule allI)+, case_tac x, case_tac y, clarify)
  apply(rule conjI, subst (asm) pairLessEq.simps, subst (asm) pairLess.simps, meson)
  apply(subst (asm) pairLessEq.simps, subst (asm) pairLess.simps, meson)
  apply(rule conjI, (rule allI)+, case_tac x, case_tac y, clarify)
  apply(subst pairLessEq.simps, meson)
  apply(rule conjI)
  apply((rule allI)+, case_tac x, case_tac y, clarify)
  apply(subst pairLessEq.simps, subst (asm) pairLess.simps, meson)
  apply(rule conjI)
  apply((rule allI)+, case_tac x, case_tac y, clarify)
  apply(subst pairCompare.simps, subst (asm) pairCompare.simps)
  apply(case_tac "compare_method dict1 ab aaa", subst (asm) ordering.case_cong_weak[where ordering'=LT])
  apply blast
  apply(metis ordering.simps(9))
  apply(subst (asm) ordering.case_cong_weak[where ordering'=EQ])
  apply blast
  apply(metis (no_types, hide_lams) ordering.exhaust ordering.simps(8))
  apply(subst (asm) ordering.case_cong_weak[where ordering'=GT], assumption)
  apply(metis ordering.simps(9))
  apply(rule conjI)
  apply((rule allI)+, case_tac x, case_tac y, clarify)
  apply(subst pairCompare.simps, subst (asm) pairCompare.simps)
  apply(case_tac "compare_method dict1 ab aaa", subst (asm) ordering.case_cong_weak[where ordering'=LT])
  apply blast
  apply(metis ordering.simps(7))
  apply(subst (asm) ordering.case_cong_weak[where ordering'=EQ])
  apply blast
  apply(metis (no_types, hide_lams) ordering.exhaust ordering.simps(8))
  apply(subst (asm) ordering.case_cong_weak[where ordering'=GT], assumption)
  apply(metis ordering.simps(7))
  apply(rule allI)
  apply(case_tac x, clarify)
  apply(subst pairCompare.simps)
  apply(smt Pair_inject ordering.exhaust ordering.simps)
done

lemma element_range_compare_GT_element_range_compare_LT:
  assumes "element_range_compare x y = GT"
  shows "element_range_compare y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: element_range_compare_def)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule stringCompare_method_GT_stringCompare_method_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule genericCompare_GT_genericCompare_LT, assumption)+
done

lemma element_range_compare_LT_element_range_compare_GT:
  assumes "element_range_compare x y = LT"
  shows "element_range_compare y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: element_range_compare_def)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule stringCompare_method_LT_stringCompare_method_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule genericCompare_LT_genericCompare_GT, assumption)+
done

lemma plt_entry_content_fn_compare_GT_plt_entry_content_fn_compare_LT:
  assumes "plt_entry_content_fn_compare f g = GT"
  shows "plt_entry_content_fn_compare g f = LT"
using assms
sorry

lemma plt_entry_content_fn_compare_LT_plt_entry_content_fn_compare_GT:
  assumes "plt_entry_content_fn_compare f g = LT"
  shows "plt_entry_content_fn_compare g f = GT"
using assms
sorry

lemma abiFeatureCompare0_GT_abiFeatureCompare0_LT:
  assumes "abiFeatureCompare0 x y = GT"
  shows "abiFeatureCompare0 y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: abiFeatureCompare0.simps)
  apply(rule lexicographicCompareBy_GT_lexicographicCompareBy_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule stringCompare_method_GT_stringCompare_method_LT, assumption)
  apply(rule maybeCompare_GT_maybeCompare_LT, assumption)
  apply(rule symDefCompare_GT_symDefCompare_LT, assumption)
  apply(rule lexicographicCompareBy_GT_lexicographicCompareBy_LT, assumption)
  apply(case_tac xa; case_tac ya; simp add: tripleCompare.simps)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule stringCompare_method_GT_stringCompare_method_LT, assumption)
  apply(rule pairCompare_GT_pairCompare_LT, assumption)
  apply(rule maybeCompare_GT_maybeCompare_LT, assumption)
  apply(rule symDefCompare_GT_symDefCompare_LT, assumption)
  apply(rule plt_entry_content_fn_compare_GT_plt_entry_content_fn_compare_LT, assumption)
done

lemma abiFeatureCompare0_LT_abiFeatureCompare0_GT:
  assumes "abiFeatureCompare0 x y = LT"
  shows "abiFeatureCompare0 y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: abiFeatureCompare0.simps)
  apply(rule lexicographicCompareBy_LT_lexicographicCompareBy_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule stringCompare_method_LT_stringCompare_method_GT, assumption)
  apply(rule maybeCompare_LT_maybeCompare_GT, assumption)
  apply(rule symDefCompare_LT_symDefCompare_GT, assumption)
  apply(rule lexicographicCompareBy_LT_lexicographicCompareBy_GT, assumption)
  apply(case_tac xa; case_tac ya; simp add: tripleCompare.simps)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule stringCompare_method_LT_stringCompare_method_GT, assumption)
  apply(rule pairCompare_LT_pairCompare_GT, assumption)
  apply(rule maybeCompare_LT_maybeCompare_GT, assumption)
  apply(rule symDefCompare_LT_symDefCompare_GT, assumption)
  apply(rule plt_entry_content_fn_compare_LT_plt_entry_content_fn_compare_GT, assumption)
done

lemma abiFeatureCompare_GT_abiFeatureCompare_LT:
  assumes "abiFeatureCompare x y = GT"
  shows "abiFeatureCompare y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: abiFeatureCompare.simps)
done

lemma abiFeatureCompare_LT_abiFeatureCompare_GT:
  assumes "abiFeatureCompare x y = LT"
  shows "abiFeatureCompare y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: abiFeatureCompare.simps)
done

lemma anyAbiFeatureCompare_GT_anyAbiFeatureCompare_LT:
  assumes "anyAbiFeatureCompare x y = GT"
  shows "anyAbiFeatureCompare y x = LT"
using assms
  apply(case_tac x; case_tac y; simp add: anyAbiFeatureCompare.simps)
  apply(rule abiFeatureCompare0_GT_abiFeatureCompare0_LT, assumption)
  apply(rule abiFeatureCompare_GT_abiFeatureCompare_LT, assumption)
done

lemma anyAbiFeatureCompare_LT_anyAbiFeatureCompare_GT:
  assumes "anyAbiFeatureCompare x y = LT"
  shows "anyAbiFeatureCompare y x = GT"
using assms
  apply(case_tac x; case_tac y; simp add: anyAbiFeatureCompare.simps)
  apply(rule abiFeatureCompare0_LT_abiFeatureCompare0_GT, assumption)
  apply(rule abiFeatureCompare_LT_abiFeatureCompare_GT, assumption)
done

lemma abiFeatureCompare_refl':
  shows "abiFeatureCompare x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: abiFeatureCompare.simps)
done

lemma element_range_compare_refl':
  shows "element_range_compare x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: element_range_compare_def)
  apply(subst pairCompare_refl')
  apply(rule stringCompare_method_refl')
  apply(rule pairCompare_refl')
  apply(simp add: genericCompare_def)+
done

lemma plt_entry_content_fn_compare_refl':
  shows "plt_entry_content_fn_compare f g = EQ \<longleftrightarrow> f = g"
unfolding plt_entry_content_fn_compare_def
  apply(case_tac "\<forall>n1 n2. pairCompare (genericCompare op < op =) (lexicographicCompareBy (genericCompare op < op =)) (f n1 n2) (g n1 n2) = EQ"; simp)
  apply(subst (asm) pairCompare_refl')
  apply(simp add: genericCompare_def)
  apply(rule lexicographicCompareBy_refl')
  apply(simp add: genericCompare_def)
  apply(rule ext, rule ext, simp)
  apply(rule conjI)
  apply(rule impI)
  apply(rule conjI)
  apply(rule impI)
  apply simp
  apply auto
  apply(simp add: pairCompare_refl' genericCompare_def lexicographicCompareBy_refl')+
done

lemma abiFeatureCompare0_refl':
  shows "abiFeatureCompare0 x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: abiFeatureCompare0.simps)
  apply(rule lexicographicCompareBy_refl')
  apply(rule pairCompare_refl')
  apply(rule stringCompare_method_refl')
  apply(rule maybeCompare_refl')
  apply(rule symDefCompare_refl')
  apply(rule lexicographicCompareBy_refl')
  apply(case_tac "xa"; case_tac "ya"; simp)
  apply(simp only: tripleCompare.simps)
  apply(subst pairCompare_refl')
  apply(rule stringCompare_method_refl')
  apply(rule pairCompare_refl')
  apply(rule maybeCompare_refl')
  apply(rule symDefCompare_refl')
  apply(rule plt_entry_content_fn_compare_refl')
  apply simp
done

lemma anyAbiFeatureCompare_refl':
  shows "anyAbiFeatureCompare x y = EQ \<longleftrightarrow> x = y"
  apply(case_tac x; case_tac y; simp add: anyAbiFeatureCompare.simps)
  apply(simp add: abiFeatureCompare0_refl')
  apply(simp add: abiFeatureCompare_refl')
done

lemma anyAbiFeatureCompare_tri:
  shows "anyAbiFeatureCompare x y = GT \<or> anyAbiFeatureCompare x y = LT \<or> x = y"
  apply(case_tac "anyAbiFeatureCompare x y")
  apply(metis ordering.distinct anyAbiFeatureCompare_refl')+
done

lemma any_abi_feature_dict_well_behaved:
  shows "well_behaved_lem_ordering (isLess_method instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
    (isLessEqual_method instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
    (isGreater_method instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
    (compare_method instance_Basic_classes_Ord_Abis_any_abi_feature_dict)"
unfolding instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def well_behaved_lem_ordering.simps
  apply(simp only: Ord_class.simps)
  apply(rule conjI)
  apply((rule allI)+, rule impI, rule anyAbiFeatureCompare_GT_anyAbiFeatureCompare_LT, assumption)
  apply(rule conjI)
  apply((rule allI)+, rule impI, rule anyAbiFeatureCompare_LT_anyAbiFeatureCompare_GT, assumption)
  apply(rule conjI)
  apply((rule allI)+, simp add: anyAbiFeatureCompare_tri)
  apply(rule conjI)
  apply((rule allI)+, clarify, metis ordering.distinct anyAbiFeatureCompare_refl')
  apply(rule conjI)
  apply((rule allI)+, clarify, metis ordering.distinct anyAbiFeatureCompare_refl')
  apply(rule conjI)
  apply((rule allI)+, simp)
  apply(rule conjI)
  apply((rule allI)+, simp)
  apply(rule conjI)
  apply((rule allI)+, metis ordering.distinct anyAbiFeatureCompare_refl')
  apply(rule conjI)
  apply((rule allI)+, metis ordering.distinct anyAbiFeatureCompare_refl')
  apply(rule conjI)
  apply((rule allI)+, simp add: anyAbiFeatureCompare_refl')
  apply(rule conjI)
  apply((rule allI)+, simp add: anyAbiFeatureCompare_refl')
  apply(rule conjI)
  apply((rule allI)+, simp)
  apply(rule conjI)
  apply((rule allI)+, simp add: anyAbiFeatureCompare_LT_anyAbiFeatureCompare_GT)
  apply(rule conjI)
  apply((rule allI)+, simp add: anyAbiFeatureCompare_GT_anyAbiFeatureCompare_LT)
  apply((rule allI)+, simp add: anyAbiFeatureCompare_refl')
done

lemma string_dict_well_behaved:
  shows "well_behaved_lem_ordering (isLess_method instance_Basic_classes_Ord_string_dict)
    (isLessEqual_method instance_Basic_classes_Ord_string_dict)
    (isGreater_method instance_Basic_classes_Ord_string_dict)
    (compare_method instance_Basic_classes_Ord_string_dict)"
unfolding well_behaved_lem_ordering.simps instance_Basic_classes_Ord_string_dict_def
  apply(simp only: Ord_class.simps)
  apply(rule conjI)
  apply((rule allI)+, case_tac x; case_tac y; clarify; simp only: stringGreater_def)
  apply(rule conjI)
  apply((rule allI)+, case_tac x; case_tac y; clarify; simp only: stringGreater_def)
  apply(rule conjI)
  apply((rule allI)+, simp add: stringCompare_tri)
  apply(rule conjI)
  apply((rule allI)+, clarify, simp add: stringCompare_method_refl stringLess_def)
  apply(rule conjI)
  apply((rule allI)+, clarify, simp add: stringCompare_method_refl stringGreater_def stringLess_def)
  apply(rule conjI)
  apply((rule allI)+, simp add: stringLess_stringGreater)
  apply(rule conjI)
  apply((rule allI)+, meson stringLess_stringGreater)
  apply(rule conjI)
  apply((rule allI)+, meson stringGreater_def stringLess_stringGreater)
  apply(rule conjI)
  apply((rule allI)+, meson stringGreater_def stringLess_stringGreater)
  apply(rule conjI)
  apply((rule allI)+, smt ordering.distinct(5) stringCompare_method_def stringCompare_tri stringGreater_def stringLessEq_def stringLess_def)
  apply(rule conjI)
  apply((rule allI)+, simp add: stringCompare_method_refl stringLessEq_def)
  apply(rule conjI)
  apply((rule allI)+, simp add: stringLessEq_def stringLess_def)
  apply(rule conjI)
  apply((rule allI)+, simp add: stringCompare_method_def)
  apply(smt ordering.distinct)
  apply(rule conjI)
  apply((rule allI)+, simp add: stringCompare_method_def)
  apply(smt ordering.distinct stringCompare_method_def stringCompare_method_refl stringCompare_tri stringGreater_def stringLess_def)
  apply(rule allI)
  apply(smt ordering.distinct stringCompare_method_def stringCompare_method_refl stringCompare_tri stringGreater_def stringLess_def)
done

lemma tagCompare_refl':
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict)
              (compare_method dict)"
  shows "tagCompare dict t1 t2 = EQ \<longleftrightarrow> t1 = t2"
using assms
  apply(case_tac t1; case_tac t2; simp add: tagCompare.simps)
  apply(simp add: symDefCompare_refl')
  apply(simp add: symRefAndRelocSiteCompare_refl')
  apply(simp add: elfFileFeatureCompare_refl')
  apply(subst (asm) well_behaved_lem_ordering.simps)
  apply meson
done

lemma natural_dict_well_behaved:
  shows "well_behaved_lem_ordering (isLess_method instance_Basic_classes_Ord_Num_natural_dict)
    (isLessEqual_method instance_Basic_classes_Ord_Num_natural_dict)
    (isGreater_method instance_Basic_classes_Ord_Num_natural_dict)
    (compare_method instance_Basic_classes_Ord_Num_natural_dict)"
unfolding well_behaved_lem_ordering.simps instance_Basic_classes_Ord_Num_natural_dict_def
  apply(simp only: Ord_class.simps)
  apply(auto)
  apply(auto simp add: genericCompare_def)
  apply(meson neqE ordering.distinct)+
done

lemma tag_dict_preserves_well_behavedness:
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict) (compare_method dict)"
  shows "well_behaved_lem_ordering (isLess_method (instance_Basic_classes_Ord_Memory_image_range_tag_dict dict))
   (isLessEqual_method (instance_Basic_classes_Ord_Memory_image_range_tag_dict dict))
   (isGreater_method (instance_Basic_classes_Ord_Memory_image_range_tag_dict dict))
   (compare_method (instance_Basic_classes_Ord_Memory_image_range_tag_dict dict))"
using assms unfolding well_behaved_lem_ordering.simps instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
  apply(simp only: Ord_class.simps)
  apply(rule conjI, (rule allI)+, rule impI, rule tagCompare_GT_tagCompare_LT, blast, blast)
  apply(rule conjI, (rule allI)+, rule impI, rule tagCompare_LT_tagCompare_GT, blast, blast)
  apply(rule conjI, (rule allI)+)
  apply(case_tac x; case_tac y; clarify; (subst tagCompare.simps)?; (subst (asm) tagCompare.simps)?, (subst (asm) tagCompare.simps)?)
  apply((metis)+, metis symDefCompare_tri, (metis)+, metis symRefAndRelocSiteCompare_tri, (metis)+,
    metis elfFileFeatureCompare_tri, (metis)+, metis ordering.exhaust)
  apply(rule conjI, (rule allI)+)
  apply(case_tac x; case_tac y; clarify; (subst (asm) tagCompare.simps)?)
  apply(metis ordering.simps, metis ordering.simps, metis ordering.simps symDefCompare_refl',
    metis ordering.simps symRefAndRelocSiteCompare_refl', metis ordering.simps elfFileFeatureCompare_refl',
    metis ordering.distinct)
  apply(rule conjI, (rule allI)+)
  apply(case_tac x; case_tac y; clarify; (subst (asm) tagCompare.simps)?)
  apply(metis ordering.simps, metis ordering.simps, metis ordering.simps symDefCompare_refl',
    metis ordering.simps symRefAndRelocSiteCompare_refl', metis ordering.simps elfFileFeatureCompare_refl',
    metis ordering.distinct)
  apply(rule conjI, (rule allI)+, rule impI)
  apply simp
  apply(rule conjI, (rule allI)+, rule impI)
  apply simp
  apply(rule conjI, (rule allI)+, rule impI)
  apply(metis ordering.distinct tagCompare_refl)
  apply(rule conjI, (rule allI)+, rule impI)
  apply(metis ordering.distinct tagCompare_refl)
  apply(rule conjI, (rule allI)+, rule impI)
  apply simp
  apply(erule disjE, simp)
  apply(case_tac x; case_tac y; clarify; (subst (asm) tagCompare.simps)?, (subst (asm) tagCompare.simps)?)
  apply((metis)+)
  apply(metis symDefCompare_refl')
  apply(meson ordering.simps)+
  apply(metis symRefAndRelocSiteCompare_refl')
  apply(meson ordering.simps)+
  apply(metis elfFileFeatureCompare_refl')
  apply(meson ordering.simps)+
  apply(subst tagCompare_refl)
  apply meson
  apply fast[1]
  apply fast[1]
  apply(drule tagCompare_LT_tagCompare_GT)
  apply meson
  apply assumption
  apply(drule tagCompare_GT_tagCompare_LT)
  apply meson
  apply assumption
  apply(metis tagCompare_refl' assms)+
done

lemma maybe_dict_preserves_well_behavedness:
  fixes dict :: "'a Ord_class"
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict) (compare_method dict)"
  shows "well_behaved_lem_ordering (isLess_method (instance_Basic_classes_Ord_Maybe_maybe_dict dict))
   (isLessEqual_method (instance_Basic_classes_Ord_Maybe_maybe_dict dict))
   (isGreater_method (instance_Basic_classes_Ord_Maybe_maybe_dict dict))
   (compare_method (instance_Basic_classes_Ord_Maybe_maybe_dict dict))"
using assms unfolding well_behaved_lem_ordering.simps instance_Basic_classes_Ord_Maybe_maybe_dict_def
  apply simp
  apply(rule conjI)
  apply((rule allI)+, case_tac x; case_tac y; clarify; (subst (asm) maybeCompare.simps);
    subst maybeCompare.simps; metis)
  apply(rule conjI)
  apply((rule allI)+, case_tac x; case_tac y; clarify; (subst (asm) maybeCompare.simps);
    subst maybeCompare.simps; metis)
  apply(rule conjI)
  apply((rule allI)+, case_tac x; case_tac y; clarify; (subst (asm) maybeCompare.simps))
  apply(subst maybeCompare.simps, rule refl)
  apply(metis)
  apply(subst (asm) maybeCompare.simps)
  apply(meson orderingIsLess.cases)
  apply(rule conjI)
  apply(rule allI, case_tac x; clarify)
  apply(subst (asm) maybeCompare.simps, metis ordering.simps)+
  apply(rule conjI)
  apply(rule allI, case_tac x; clarify)
  apply(subst (asm) maybeCompare.simps, metis ordering.simps)+
  apply(rule conjI)
  apply((rule allI)+, case_tac x; case_tac y; clarify)
  apply(subst (asm) maybeCompare.simps, metis ordering.simps)+
  apply(rule conjI)
  apply((rule allI)+, case_tac x; case_tac y; clarify)
  apply(subst (asm) maybeCompare.simps, metis ordering.simps)+
  apply(rule conjI)
  apply((rule allI)+, case_tac x; case_tac y; clarify)
  apply((subst (asm) maybeCompare.simps)+, metis ordering.simps)+
  apply(rule conjI)
  apply(rule allI, case_tac x; clarify)
  apply(subst maybeCompare.simps, metis)+
  apply(rule conjI) 
  apply((rule allI)+, case_tac x; case_tac y; clarify)
  apply(subst (asm) maybeCompare.simps, subst maybeCompare.simps, metis ordering.simps)+
  apply(rule conjI)
  apply((rule allI)+, case_tac x; case_tac y; clarify)
  apply(subst (asm) maybeCompare.simps, subst maybeCompare.simps, metis ordering.simps)+
  apply((rule allI)+, case_tac x; case_tac y; clarify)
  apply(subst maybeCompare.simps, metis ordering.simps)
  apply(subst maybeCompare.simps, fast)
  apply(subst maybeCompare.simps, fast)
  apply(subst maybeCompare.simps, subst option.inject)
  apply meson
done

lemma split_greater_2:
  fixes dict :: "'a Ord_class" and element other :: "'a"
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict)
            (compare_method dict)"
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
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict)
             (compare_method dict)"
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

lemma split_singleton_same:
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict)
             (compare_method dict)"
  shows "split dict s {s} = ({}, {})"
using assms
  apply(simp only: split_def)
  apply simp
  apply(rule conjI)
  apply(meson lem_ordering_not_gt)
  apply(meson lem_ordering_not_lt)
done

lemma split_singleton_diff:
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict)
             (compare_method dict)"
    and "isLess_method dict s t"
  shows "split dict s {t} = ({}, {t})"
using assms
  apply(simp only: split_def)
  apply simp
  apply(rule conjI)
  apply(meson lem_ordering_gt lem_ordering_not_lt)
  apply auto
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
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict)
              (compare_method dict)"
  shows "chooseAndSplit dict { s } = Some ({}, s, {})"
using assms
  apply(simp only: chooseAndSplit_def)
  apply(auto simp add: split_singleton_same)
done

lemma chooseAndSplit_empty:
  shows "chooseAndSplit dict {} = None"
  apply(simp only: chooseAndSplit_def)
  apply simp
done

lemma chooseAndSplit_less_2:
  fixes dict :: "'a Ord_class" and element1 element2 :: "'a"
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict)
            (compare_method dict)"
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
  assumes "well_behaved_lem_ordering (isLess_method dict) (isLessEqual_method dict) (isGreater_method dict) (compare_method dict)"
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

text {* In library somewhere?  Doesn't appear to be so, though find_theorems is so temprimental I
can't really be sure... *}
lemma map_eqI:
  assumes "\<forall>d \<in> dom m1 \<union> dom m2. m1 d = m2 d"
  shows "m1 = m2"
using assms by fastforce

text {* Induction principle for reasoning about list functions that have a special case for
singleton lists. *}
lemma empty_singleton_induct:
  assumes "P []" and "\<And>x. P [x]"
     and "\<And>x xs. xs \<noteq> [] \<Longrightarrow> P xs \<Longrightarrow> P (x#xs)"
  shows "P x"
using assms
  apply(induct x)
  apply simp
  apply(case_tac x, clarify)
  apply simp+
done

lemma nat_le_massage:
  assumes "addr \<le> l" and "l \<le> Suc (addr)"
  shows "addr = l \<or> Suc addr = l"
using assms by auto

lemma list_comprehension_singleton:
  shows "[(x, y) \<leftarrow> [(u, v)]. y = v] = [(u,v)]"
by simp

lemma dom_2:
  shows "dom [k1 \<mapsto> v1, k2 \<mapsto> v2] = {k1, k2}"
by auto

lemma nth_the_technical:
  assumes "4194316 \<le> x" and "x < 4194316 + data_size"
  shows "the (replicate data_size (Some 0) ! (x - 4194316)) = 0"
using assms by(induction x; auto)

lemma interval_elim:
  fixes x::nat
  assumes "4194304 \<le> x" and "x < 4194316"
  shows "x = 4194304 \<or> x = 4194305 \<or> x = 4194306 \<or> x = 4194307 \<or>
          x = 4194308 \<or> x = 4194309 \<or> x = 4194310 \<or> x = 4194311 \<or>
          x = 4194312 \<or> x = 4194313 \<or> x = 4194314 \<or> x = 4194315"
using assms by presburger

lemma findLowestKVWithKEquivTo_Some_empty:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict) (compare_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict) (compare_method val_dict)"
  shows "findLowestKVWithKEquivTo key_dict val_dict element eq {} (Some candidate) = Some candidate"
using assms
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {}" and c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where c=False])
  apply(simp, rule tup2_dict_preserves_well_behavedness, simp, simp, simp)
  apply(subst chooseAndSplit_empty)
  apply(simp only: option.case)
done

lemma findHighestKVWithKEquivTo_Some_empty:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict) (compare_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict) (compare_method val_dict)"
  shows "findHighestKVWithKEquivTo key_dict val_dict element eq {} (Some candidate) = Some candidate"
using assms
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {}" and c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where c=False])
  apply(simp, rule tup2_dict_preserves_well_behavedness, simp, simp, simp)
  apply(subst chooseAndSplit_empty)
  apply(simp only: option.case)
done

lemma findLowestKVWithKEquivTo_singleton_None:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict) (compare_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict) (compare_method val_dict)"
      and "e = (ek, ev)" and "eq element ek"
  shows "findLowestKVWithKEquivTo key_dict val_dict element eq {e} None = Some e"
using assms
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {e}" and c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where c=False])
  apply(simp, rule tup2_dict_preserves_well_behavedness, simp, simp)
  apply(simp only: if_False)
  apply(subst chooseAndSplit_singleton, rule tup2_dict_preserves_well_behavedness, simp, simp)
  apply(simp only: option.case split if_True)
  apply(simp only: split Let_def)
  apply(rule findLowestKVWithKEquivTo_Some_empty)
  apply simp_all
done

lemma findHighestKVWithKEquivTo_singleton_None:
  assumes "well_behaved_lem_ordering (isLess_method key_dict) (isLessEqual_method key_dict) (isGreater_method key_dict) (compare_method key_dict)"
      and "well_behaved_lem_ordering (isLess_method val_dict) (isLessEqual_method val_dict) (isGreater_method val_dict) (compare_method val_dict)"
      and "e = (ek, ev)" and "eq element ek"
  shows "findHighestKVWithKEquivTo key_dict val_dict element eq {e} None = Some e"
using assms
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where b="infinite {e}" and c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where c=False])
  apply(simp, rule tup2_dict_preserves_well_behavedness, simp, simp)
  apply(simp only: if_False)
  apply(subst chooseAndSplit_singleton, rule tup2_dict_preserves_well_behavedness, simp, simp)
  apply(simp only: option.case split if_True)
  apply(simp only: split Let_def)
  apply(rule findHighestKVWithKEquivTo_Some_empty)
  apply simp_all
done

section {* Start of the proof proper *}

text {* The following section contains technical lemmas directly tied to the proof of our theorem,
which is found at the very end of this section. *}

text {* Result of encoding the MOV instruction according to Anthony's model.  Note we are generic
in the absolute address that we are moving to, providing that address obeys some signed-integer
bounds that are guaranteed by the valid_address assertion guarding our main theorem statement. *}
lemma encode_Zmov_in_concrete:
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

text {* Commutation lemma for the build_fixed_program_memory function: `loading' the fixed program
into memory (i.e. constructing a finite map from `64 word' to `8 word') at a given address, and then
trying to look up from another address, is the same as indexing into the encoded program's byte
list at the lookup address minus the loading address. *}
lemma build_fixed_program_memory_commute:
  fixes bytes :: "8 word list"
  assumes "addr \<le> l \<and> l < addr + List.length bytes" and "bytes \<noteq> []" and
    "l \<in> unats 64"
  shows "(build_fixed_program_memory addr bytes) (of_nat l) = bytes ! (l - addr)"
using assms unfolding build_fixed_program_memory_def
  apply(induction bytes arbitrary: addr rule: empty_singleton_induct)
  apply simp
  apply(simp only: build_fixed_program_code_memory.simps Let_def)
  apply(simp only: map_of.simps fst_def snd_def split)
  apply(erule conjE)
  apply(drule nat_le_massage, simp)
  apply(erule disjE; clarify)
  apply(subst word_unat.Abs_inverse, simp)
  apply(simp only: fun_upd_apply refl if_True option.case, simp)
  apply(subst word_unat.Abs_inverse, simp)
  apply(simp)
  apply(simp only: build_fixed_program_code_memory.simps Let_def)
  apply(simp only: map_of.simps fst_def snd_def split)
  apply(subst word_unat.Abs_inverse, simp)
  apply(case_tac "l = addr"; clarify)
  apply(simp only: fun_upd_apply refl if_True option.case, simp)
  apply(simp only: fun_upd_apply if_False)
  apply(subst (asm) word_unat.Abs_inverse, simp)
  apply auto
done

lemma pairLess_Ref_Ref_technical:
  shows "pairLess (instance_Basic_classes_Ord_Maybe_maybe_dict
                   (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                     (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
         (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict) (SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4))
         (SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4)) = False"
by eval

lemma pairLess_Def_Def_technical:
  shows "pairLess (instance_Basic_classes_Ord_Maybe_maybe_dict
                   (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                     (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
         (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict) (SymbolDef def_rec0, Some (''.data'', addr, 4))
         (SymbolDef def_rec0, Some (''.data'', addr, 4)) = False"
unfolding instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_tup2_dict_def
  instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_string_dict_def
  instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
  apply(simp only: Ord_class.simps pairLess.simps tagCompare.simps)
  apply(auto simp add: symDefCompare_refl)
  apply(simp add: maybeCompare.simps pairCompare.simps)
  apply(simp only: stringCompare_method_refl ordering.case)
  apply(subst (asm) pairCompare_refl)
  apply(rule allI, simp add: genericCompare_refl)
  apply simp
done

lemma isGreater_method_technical:
  shows "isGreater_method
     (instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
       (instance_Basic_classes_Ord_Maybe_maybe_dict
         (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
           (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))
     (SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4)) (SymbolDef def_rec0, Some (''.data'', addr, 4))"
unfolding instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
  instance_Basic_classes_Ord_string_dict_def instance_Basic_classes_Ord_Maybe_maybe_dict_def
  instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
  apply(simp only: Ord_class.simps pairCompare.simps pairGreater_def pairLess.simps)
  apply(simp only: tagCompare.simps)
  apply auto
done

lemma set_choose_technical_Ref_2:
  shows "{x \<in> {(SymbolRef ref_and_reloc_rec0, Some (''.text'', (4::nat), (4::nat))), (SymbolDef def_rec0, Some (''.data'', addr, 4))}.
      EQ = pairCompare
            (tagCompare
              \<lparr>compare_method = anyAbiFeatureCompare, isLess_method = \<lambda>f1 f2. anyAbiFeatureCompare f1 f2 = LT, isLessEqual_method = \<lambda>f1 f2. anyAbiFeatureCompare f1 f2 \<in> {LT, EQ},
                 isGreater_method = \<lambda>f1 f2. anyAbiFeatureCompare f1 f2 = GT, isGreaterEqual_method = \<lambda>f1 f2. anyAbiFeatureCompare f1 f2 \<in> {GT, EQ}\<rparr>)
            (maybeCompare (pairCompare (compare_method instance_Basic_classes_Ord_string_dict) (pairCompare (genericCompare op < op =) (genericCompare op < op =)))) x
            (SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4))} = {(SymbolRef ref_and_reloc_rec0, Some (''.text'', (4::nat), (4::nat)))}"
  apply(rule equalityI)
  apply(rule subsetI)
  apply(drule CollectD)
  apply(erule conjE)
  apply simp
  apply(erule disjE)
  apply clarify+
  apply(simp add: pairCompare.simps tagCompare.simps)
  apply(rule subsetI)
  apply simp
  apply(auto simp add: pairCompare.simps tagCompare.simps symRefAndRelocSiteCompare_refl)
  apply(simp only: instance_Basic_classes_Ord_string_dict_def Ord_class.simps)
  apply(simp only: maybeCompare.simps pairCompare.simps stringCompare_method_refl ordering.case)
  apply(case_tac "genericCompare (op <) (op =) (4::nat) 4"; simp)
  apply(metis genericCompare_refl[where 'a=nat] ordering.simps)+
done

lemma set_choose_technical_Def_2:
  shows "{x \<in> {(SymbolRef \<lparr>ref = ref_rec0,
                          maybe_reloc = Some \<lparr>ref_relent = \<lparr>elf64_ra_offset = uint64_of_nat 0, elf64_ra_info = 10, elf64_ra_addend = 0\<rparr>, ref_rel_scn = 0, ref_rel_idx = 0, ref_src_scn = 0\<rparr>,
                          maybe_def_bound_to = Some (ApplyReloc, Some def_rec0)\<rparr>,
             Some (''.text'', 4, 4)),
            (SymbolDef def_rec0, Some (''.data'', addr, 4))} .
      EQ = pairCompare (compare_method (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict))
            (compare_method
              (instance_Basic_classes_Ord_Maybe_maybe_dict
                (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                  (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))
            x (SymbolDef def_rec0, Some (''.data'', addr, 4))} = {(SymbolDef def_rec0, Some (''.data'', addr, 4))}"
  apply(rule equalityI)
  apply(rule subsetI)
  apply(drule CollectD)
  apply(erule conjE)
  apply simp
  apply(erule disjE)
  apply clarify+
  apply(simp add: pairCompare.simps tagCompare.simps instance_Basic_classes_Ord_Memory_image_range_tag_dict_def)
  apply(simp add: pairCompare.simps)
  apply(rule subsetI)
  apply simp
  apply(auto simp add: pairCompare.simps tagCompare.simps symRefAndRelocSiteCompare_refl)
  apply(simp only: instance_Basic_classes_Ord_string_dict_def Ord_class.simps)
  apply(simp only: instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
    Ord_class.simps tagCompare.simps)
  apply(subst symDefCompare_refl)
  apply(simp only: ordering.simps)
  apply(simp add: instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_tup2_dict_def
    instance_Basic_classes_Ord_Num_natural_dict_def maybeCompare.simps pairCompare.simps)
  apply(subst stringCompare_method_refl)
  apply(simp add: ordering.simps)
  apply(subst pairCompare_refl, rule allI)
  apply(simp add: genericCompare_refl)
  apply simp
done

lemma findHighestKVWithKEquivTo_technical_Ref_Ref_None:
  shows "findHighestKVWithKEquivTo (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                 (instance_Basic_classes_Ord_Maybe_maybe_dict
                   (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                     (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
                 (SymbolRef null_symbol_reference_and_reloc_site) (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict)
                 {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 4))} None =
         Some (SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4))"
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where c=False], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where c=False], simp)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)
  apply(rule natural_dict_well_behaved)
  apply(simp only: if_False)
  apply(simp only: insert_commute)
  apply(rule disjE[OF chooseAndSplit_less_2[where dict="(instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
             (instance_Basic_classes_Ord_Maybe_maybe_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                 (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))"
              and ?element2.0="(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4))" and ?element1.0="(SymbolDef def_rec0, Some (''.data'', addr, 4))"]])
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)
  apply(rule natural_dict_well_behaved)
  apply(simp only: instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_tup2_dict_def
  instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_string_dict_def
  instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def)
  apply simp
  apply(simp add: Ord_class.simps pairLess.simps tagCompare.simps maybeCompare.simps pairCompare.simps)
  apply(subst option.case_cong_weak[where option'="Some ({}, (SymbolDef def_rec0, Some (''.data'', addr, 4)), {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4))})"], simp)
  apply(simp only: option.case split tagEquiv.simps if_False)
  apply(subst if_weak_cong[where c=True])
  apply(simp only: instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_tup2_dict_def
  instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_string_dict_def
  instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def)
  apply(simp add: tagCompare.simps)
  apply(simp only: if_True)
  apply(rule findHighestKVWithKEquivTo_singleton_None)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)
  apply(rule natural_dict_well_behaved)
  apply(rule refl)
  apply(simp add: tagEquiv.simps)
  apply(subst option.case_cong_weak[where option'="Some ({(SymbolDef def_rec0, Some (''.data'', addr, 4))}, (SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4)), {})"], simp)
  apply(simp only: option.case split tagEquiv.simps if_True Let_def)
  apply(rule findHighestKVWithKEquivTo_Some_empty)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)
  apply(rule natural_dict_well_behaved)
done

lemma findLowestKVWithKEquivTo_technical_Ref_Ref_None:
  shows "findLowestKVWithKEquivTo (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
           (instance_Basic_classes_Ord_Maybe_maybe_dict
             (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
           (SymbolRef null_symbol_reference_and_reloc_site) (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict)
           {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 4))} None = Some (SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4))"
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where c=False], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where c=False], simp)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)
  apply(rule natural_dict_well_behaved)
  apply(simp only: if_False insert_commute)
  apply(rule disjE[OF chooseAndSplit_less_2[where dict="(instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
             (instance_Basic_classes_Ord_Maybe_maybe_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                 (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))"
         and ?element2.0="(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4))" and ?element1.0="(SymbolDef def_rec0, Some (''.data'', addr, 4))"]])
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)
  apply(rule natural_dict_well_behaved)
  apply(simp only: instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_tup2_dict_def
  instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_string_dict_def
  instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def)
  apply(simp add: pairLess.simps tagCompare.simps)
  apply(subst option.case_cong_weak[where option'="Some ({}, (SymbolDef def_rec0, Some (''.data'', addr, 4)), {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4))})"], simp)
  apply(simp only: option.case split tagEquiv.simps if_False)
  apply(subst if_weak_cong[where c="False"])
  apply(simp only: instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
    Ord_class.simps tagCompare.simps ordering.simps)
  apply(simp only: if_False)
  apply(rule findLowestKVWithKEquivTo_singleton_None)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)
  apply(rule natural_dict_well_behaved)
  apply(rule refl)
  apply(simp only: tagEquiv.simps)
  apply(subst option.case_cong_weak[where option'="Some ({(SymbolDef def_rec0, Some (''.data'', addr, 4))}, (SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4)), {})"], simp)
  apply(simp only: option.case split tagEquiv.simps if_True Let_def)
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where c=False], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where c=False], simp)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)
  apply(rule natural_dict_well_behaved)
  apply(simp only: if_False)
  apply(subst chooseAndSplit_singleton)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)
  apply(rule natural_dict_well_behaved)
  apply(simp only: option.case split tagEquiv.simps if_False)
  apply(subst if_weak_cong[where c=False])
  apply(simp only: instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
    Ord_class.simps tagCompare.simps ordering.simps)
  apply(simp only: if_False)
  apply(rule findLowestKVWithKEquivTo_Some_empty)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)
  apply(rule natural_dict_well_behaved)
done

lemma lookupBy0_Ref_Ref_singleton:
  shows "lookupBy0 (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                   (instance_Basic_classes_Ord_Maybe_maybe_dict
                     (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                       (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
                   (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict) (SymbolRef null_symbol_reference_and_reloc_site)
                   {(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 4))} =
                   [(SymbolRef ref_and_reloc_rec0, Some (''.text'', 4, 4))]"
using assms
  apply(simp only: lookupBy0_def)
  apply(subst findLowestKVWithKEquivTo_technical_Ref_Ref_None)
  apply(simp only: option.case)
  apply(subst findHighestKVWithKEquivTo_technical_Ref_Ref_None)
  apply(simp only: option.case Let_def)
  apply(subst split_greater_2)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
  apply(rule isGreater_method_technical)
  apply(simp only: split split_empty list_of_set_empty append_Nil2)
  apply(subst pairLess_Ref_Ref_technical)
  apply(simp only: if_False append_Nil2)
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
    Ord_class.simps instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
    instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def pairCompare.simps maybeCompare.simps tagCompare.simps)
  apply(subst set_choose_technical_Ref_2)
  apply(simp only: list_of_set_singleton)
done

lemma findLowestKVWithKEquivTo_Def_Ref_Def_technical:
  shows "findLowestKVWithKEquivTo (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
           (instance_Basic_classes_Ord_Maybe_maybe_dict
             (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
           (SymbolDef null_symbol_definition) (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict)
           {(SymbolRef \<lparr>ref = ref_rec0,
                          maybe_reloc = Some \<lparr>ref_relent = \<lparr>elf64_ra_offset = uint64_of_nat 0, elf64_ra_info = 10, elf64_ra_addend = 0\<rparr>, ref_rel_scn = 0, ref_rel_idx = 0, ref_src_scn = 0\<rparr>,
                          maybe_def_bound_to = Some (ApplyReloc, Some def_rec0)\<rparr>,
             Some (''.text'', 4, 4)),
            (SymbolDef def_rec0, Some (''.data'', addr, 4))}
           None = Some (SymbolDef def_rec0, Some (''.data'', addr, 4))"
  apply(subst findLowestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where c="False"], simp)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
  apply(simp only: if_False)
  apply(rule disjE[OF chooseAndSplit_greater_2[where dict="(instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
             (instance_Basic_classes_Ord_Maybe_maybe_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                 (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))"
    and ?element2.0="(SymbolDef def_rec0, Some (''.data'', addr, 4))" and ?element1.0="(SymbolRef \<lparr>ref = ref_rec0,
                          maybe_reloc = Some \<lparr>ref_relent = \<lparr>elf64_ra_offset = uint64_of_nat 0, elf64_ra_info = 10, elf64_ra_addend = 0\<rparr>, ref_rel_scn = 0, ref_rel_idx = 0, ref_src_scn = 0\<rparr>,
                          maybe_def_bound_to = Some (ApplyReloc, Some def_rec0)\<rparr>,
             Some (''.text'', 4, 4))"]])
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
    Ord_class.simps instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
    instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def pairCompare.simps maybeCompare.simps tagCompare.simps)
  apply(simp only: pairGreater_def pairLess.simps Ord_class.simps tagCompare.simps, simp)
  apply(subst option.case_cong_weak[where option'="Some ({(SymbolDef def_rec0, Some (''.data'', addr, 4))},
          (SymbolRef \<lparr>ref = ref_rec0,
                        maybe_reloc = Some \<lparr>ref_relent = \<lparr>elf64_ra_offset = uint64_of_nat 0, elf64_ra_info = 10, elf64_ra_addend = 0\<rparr>, ref_rel_scn = 0, ref_rel_idx = 0, ref_src_scn = 0\<rparr>,
                        maybe_def_bound_to = Some (ApplyReloc, Some def_rec0)\<rparr>,
           Some (''.text'', 4, 4)),
          {})"], assumption)
  apply(simp only: option.case split tagEquiv.simps if_False)
  apply(subst if_weak_cong[where c=True])
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
    Ord_class.simps instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
    instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def pairCompare.simps maybeCompare.simps tagCompare.simps, simp)
  apply(simp only: if_True)
  apply(rule findLowestKVWithKEquivTo_singleton_None)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
  apply(rule refl)
  apply(simp only: tagEquiv.simps)
  apply(subst option.case_cong_weak[where option'="Some ({}, (SymbolDef def_rec0, Some (''.data'', addr, 4)),
          {(SymbolRef \<lparr>ref = ref_rec0,
                         maybe_reloc = Some \<lparr>ref_relent = \<lparr>elf64_ra_offset = uint64_of_nat 0, elf64_ra_info = 10, elf64_ra_addend = 0\<rparr>, ref_rel_scn = 0, ref_rel_idx = 0, ref_src_scn = 0\<rparr>,
                         maybe_def_bound_to = Some (ApplyReloc, Some def_rec0)\<rparr>,
            Some (''.text'', 4, 4))})"], assumption)
  apply(simp only: option.case split)
  apply(simp only: tagEquiv.simps if_True split Let_def)
  apply(rule findLowestKVWithKEquivTo_Some_empty)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
done

lemma findHighestKVWithKEquivTo_Def_Ref_Def_technical:
  shows "findHighestKVWithKEquivTo (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
                 (instance_Basic_classes_Ord_Maybe_maybe_dict
                   (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                     (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
                 (SymbolDef null_symbol_definition) (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict)
                 {(SymbolRef \<lparr>ref = ref_rec0,
                                maybe_reloc = Some \<lparr>ref_relent = \<lparr>elf64_ra_offset = uint64_of_nat 0, elf64_ra_info = 10, elf64_ra_addend = 0\<rparr>, ref_rel_scn = 0, ref_rel_idx = 0, ref_src_scn = 0\<rparr>,
                                maybe_def_bound_to = Some (ApplyReloc, Some def_rec0)\<rparr>,
                   Some (''.text'', 4, 4)),
                  (SymbolDef def_rec0, Some (''.data'', addr, 4))}
                 None = Some (SymbolDef def_rec0, Some (''.data'', addr, 4))"
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where c="False"], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where c="False"], simp)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
  apply(simp only: if_False)
  apply(rule disjE[OF chooseAndSplit_greater_2[where dict="(instance_Basic_classes_Ord_tup2_dict (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
             (instance_Basic_classes_Ord_Maybe_maybe_dict
               (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict
                 (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict))))"
    and ?element2.0="(SymbolDef def_rec0, Some (''.data'', addr, 4))" and ?element1.0="(SymbolRef \<lparr>ref = ref_rec0,
                          maybe_reloc = Some \<lparr>ref_relent = \<lparr>elf64_ra_offset = uint64_of_nat 0, elf64_ra_info = 10, elf64_ra_addend = 0\<rparr>, ref_rel_scn = 0, ref_rel_idx = 0, ref_src_scn = 0\<rparr>,
                          maybe_def_bound_to = Some (ApplyReloc, Some def_rec0)\<rparr>,
             Some (''.text'', 4, 4))"]])
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
    Ord_class.simps instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
    instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def pairCompare.simps maybeCompare.simps tagCompare.simps)
  apply(simp only: pairGreater_def pairLess.simps Ord_class.simps tagCompare.simps, simp)
  apply(subst option.case_cong_weak[where option'="Some ({(SymbolDef def_rec0, Some (''.data'', addr, 4))},
          (SymbolRef \<lparr>ref = ref_rec0,
                        maybe_reloc = Some \<lparr>ref_relent = \<lparr>elf64_ra_offset = uint64_of_nat 0, elf64_ra_info = 10, elf64_ra_addend = 0\<rparr>, ref_rel_scn = 0, ref_rel_idx = 0, ref_src_scn = 0\<rparr>,
                        maybe_def_bound_to = Some (ApplyReloc, Some def_rec0)\<rparr>,
           Some (''.text'', 4, 4)),
          {})"], assumption)
  apply(simp only: option.case split tagEquiv.simps if_False)
  apply(subst if_weak_cong[where c=False])
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
    Ord_class.simps instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
    instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def pairCompare.simps maybeCompare.simps tagCompare.simps, simp)
  apply(simp only: if_False)
  apply(rule findHighestKVWithKEquivTo_singleton_None)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
  apply(rule refl)
  apply(simp only: tagEquiv.simps)
  apply(subst option.case_cong_weak[where option'="Some ({}, (SymbolDef def_rec0, Some (''.data'', addr, 4)),
          {(SymbolRef \<lparr>ref = ref_rec0,
                         maybe_reloc = Some \<lparr>ref_relent = \<lparr>elf64_ra_offset = uint64_of_nat 0, elf64_ra_info = 10, elf64_ra_addend = 0\<rparr>, ref_rel_scn = 0, ref_rel_idx = 0, ref_src_scn = 0\<rparr>,
                         maybe_def_bound_to = Some (ApplyReloc, Some def_rec0)\<rparr>,
            Some (''.text'', 4, 4))})"], assumption)
  apply(simp only: option.case split tagEquiv.simps if_True Let_def)
  apply(subst findHighestKVWithKEquivTo.simps)
  apply(subst if_weak_cong[where c=False], simp)
  apply(simp only: if_False)
  apply(subst if_weak_cong[where c=False], simp)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
  apply(simp only: if_False)
  apply(subst chooseAndSplit_singleton)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
  apply(simp only: option.case split tagEquiv.simps if_False)
  apply(subst if_weak_cong[where c=False])
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_tup2_dict_def
    Ord_class.simps instance_Basic_classes_Ord_Maybe_maybe_dict_def instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
    instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def pairCompare.simps maybeCompare.simps tagCompare.simps, simp)
  apply(simp only: if_False)
  apply(rule findHighestKVWithKEquivTo_Some_empty)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
done

lemma lookupBy0_Def_Def_singleton:
  shows "lookupBy0 (instance_Basic_classes_Ord_Memory_image_range_tag_dict instance_Basic_classes_Ord_Abis_any_abi_feature_dict)
           (instance_Basic_classes_Ord_Maybe_maybe_dict (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_string_dict (instance_Basic_classes_Ord_tup2_dict instance_Basic_classes_Ord_Num_natural_dict instance_Basic_classes_Ord_Num_natural_dict)))
           (tagEquiv instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict) (SymbolDef null_symbol_definition)
           {(SymbolRef \<lparr>ref = ref_rec0, maybe_reloc = Some \<lparr>ref_relent = \<lparr>elf64_ra_offset = uint64_of_nat 0, elf64_ra_info = 10, elf64_ra_addend = 0\<rparr>, ref_rel_scn = 0, ref_rel_idx = 0, ref_src_scn = 0\<rparr>,
            maybe_def_bound_to = Some (ApplyReloc, Some def_rec0)\<rparr>, Some (''.text'', 4, 4)), (SymbolDef def_rec0, Some (''.data'', addr, 4))} = [(SymbolDef def_rec0, Some (''.data'', addr, 4))]"
  apply(subst lookupBy0_def)
  apply(subst findLowestKVWithKEquivTo_Def_Ref_Def_technical)
  apply(simp only: option.case)
  apply(subst findHighestKVWithKEquivTo_Def_Ref_Def_technical)
  apply(simp only: option.case split Let_def)
  apply(subst split_less_2)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_string_dict_def
    instance_Basic_classes_Ord_tup2_dict_def Ord_class.simps instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
    instance_Basic_classes_Ord_Maybe_maybe_dict_def pairLess.simps tagCompare.simps, simp)
  apply(simp only: split)
  apply(subst split_singleton_diff)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule tag_dict_preserves_well_behavedness)
  apply(rule any_abi_feature_dict_well_behaved)
  apply(rule maybe_dict_preserves_well_behavedness)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule string_dict_well_behaved)
  apply(rule tup2_dict_preserves_well_behavedness)
  apply(rule natural_dict_well_behaved)+
  apply(simp only: instance_Basic_classes_Ord_Num_natural_dict_def instance_Basic_classes_Ord_string_dict_def
    instance_Basic_classes_Ord_tup2_dict_def Ord_class.simps instance_Basic_classes_Ord_Memory_image_range_tag_dict_def
    instance_Basic_classes_Ord_Maybe_maybe_dict_def pairLess.simps tagCompare.simps, simp)
  apply(simp only: split)
  apply(simp only: list_of_set_empty append_Nil2)
  apply(subst set_choose_technical_Def_2)
  apply(simp only: list_of_set_singleton)
  apply(subst pairLess_Def_Def_technical)
  apply(simp only: if_False)
  apply simp
done

lemma img1_technical:
  assumes "length (natural_to_le_byte_list (4194316 + offset)) \<le> 4"
  shows "img1 offset data_size [72, 199, 4, 37, 0, 0, 0, 0, 5, 0, 0, 0] =
          \<lparr>elements = [''.data'' \<mapsto> \<lparr>startpos = Some 4194316, length1 = Some data_size, contents = replicate data_size (Some 0)\<rparr>,
                       ''.text'' \<mapsto> \<lparr>startpos = Some 4194304, length1 = Some 12,
        contents = (([Some 72, Some 199, Some 4, Some 37] @ foldr (\<lambda>b. op # (Some b)) (natural_to_le_byte_list (4194316 + offset)) []) @
                    replicate (4 - length (natural_to_le_byte_list (4194316 + offset))) (Some (of_nat 0))) @
                   [Some 5, Some 0, Some 0, Some 0]\<rparr>],
           by_range = {(Some (''.data'', offset, 4), SymbolDef def_rec0)}, by_tag = {(SymbolDef def_rec0, Some (''.data'', offset, 4))}\<rparr>"
using assms
  apply(simp only: img1_def rev.simps append.simps meta0_def list.set by_tag_from_by_range_def
    list.map map_of.simps fst_def snd_def split)
  apply(simp only: swap_pairs_rewrite)
  apply(simp only: Let_def)
  apply(simp only: sysv_amd64_std_abi_def relocate_output_image_def annotated_memory_image.simps)
  apply(subst lookupBy0_Ref_Ref_singleton)
  apply(subst Let_def)
  apply(simp only: foldl.simps split abi.simps range_tag.case Let_def ref_and_reloc_rec0_def
    symbol_reference_and_reloc_site.simps option.case reloc_site.simps annotated_memory_image.simps
    reloc_decision.case)
  apply(simp only: get_elf64_relocation_a_type_def extract_elf64_relocation_r_type_def
    elf64_relocation_a.simps)
  apply(simp only: Let_def r_x86_64_pc32_def concrete_evaluations)
  apply(simp only: instance_Basic_classes_Ord_Abis_any_abi_feature_dict_def
    instance_Abi_classes_AbiFeatureTagEquiv_Abis_any_abi_feature_dict_def amd64_reloc_def Let_def)
  apply(simp only: string_of_amd64_relocation_type_def)
  apply(simp only: r_x86_64_none_def r_x86_64_64_def r_x86_64_pc32_def r_x86_64_plt32_def r_x86_64_got32_def
    r_x86_64_copy_def r_x86_64_glob_dat_def r_x86_64_jump_slot_def r_x86_64_relative_def
    r_x86_64_gotpcrel_def r_x86_64_32_def simp_thms if_True)
  apply(subgoal_tac "unat (uint64_land (of_int (int 10)) (of_int (int (65536 * 65536 - 1)))) = 10")
  apply(subst if_weak_cong[where b="unat (uint64_land (of_int (int 10)) (of_int (int (65536 * 65536 - 1)))) = 0" and c=False], simp, simp only: if_False)+
  apply(subst if_weak_cong[where b="10=1" and c=False], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="10=2" and c=False], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="10=3" and c=False], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="10=4" and c=False], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="10=5" and c=False], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="10=6" and c=False], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="10=7" and c=False], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="10=8" and c=False], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="10=9" and c=False], simp, simp only: if_False)
  apply(simp del: natural_to_le_byte_list.simps)
  apply(simp only: elf_memory_image_defined_symbols_and_ranges_def tagged_ranges_matching_tag_def
    annotated_memory_image.simps write_natural_field_def element.simps element_and_offset_to_address.simps
    list.case if_True Let_def)
  apply(subst lookupBy0_Def_Def_singleton)+
  apply(simp only: mapMaybe.simps split range_tag.case option.case list_comprehension_singleton
    list.case fun_upd_apply refl if_True element.simps)
  apply(simp only: take.simps)
  apply(subst if_weak_cong[where b="4-1-1-1-1=0" and c="True"], simp, simp only: if_True)
  apply(simp only: drop.simps)
  apply(subst if_weak_cong[where b="4+4-1-1-1-1-1-1-1-1=0" and c="True"], simp, simp only: if_True)
  apply(subst if_weak_cong[where b="4=0" and c="False"], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="4-1=0" and c="False"], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="4-1-1=0" and c="False"], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="4-1-1-1=0" and c="False"], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="4+4=0" and c="False"], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="4+4-1=0" and c="False"], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="4+4-1-1=0" and c="False"], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="4+4-1-1-1=0" and c="False"], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="4+4-1-1-1-1=0" and c="False"], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="4+4-1-1-1-1-1=0" and c="False"], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="4+4-1-1-1-1-1-1=0" and c="False"], simp, simp only: if_False)
  apply(subst if_weak_cong[where b="4+4-1-1-1-1-1-1-1=0" and c="False"], simp, simp only: if_False)
  apply(simp only: simp_thms if_False)
  apply(simp del: natural_to_le_byte_list.simps)
  apply eval
done

lemma build_fixed_program_memory_commute_miss_lower:
  fixes bytes :: "8 word list"
  assumes "x < addr" and "x \<in> unats 64"
  shows "build_fixed_program_memory addr bytes (of_nat x) = 0"
using assms unfolding build_fixed_program_memory_def
  apply(induction bytes arbitrary: addr)
  apply(simp only: build_fixed_program_code_memory.simps map_of.simps)
  apply simp
  apply(simp only: build_fixed_program_code_memory.simps map_of.simps fst_def snd_def split)
  apply(simp only: Let_def)
  apply(case_tac "unat (of_nat x) = addr")
  apply(subst word_unat.Abs_inverse, simp)+
  apply(subst (asm) word_unat.Abs_inverse, simp)
  apply(subst (asm) word_unat.Abs_inverse[where 'a="64"], simp)
  apply(simp only: fun_upd_apply if_False)
  apply(subst word_unat.Abs_inverse, simp)+
  apply(subst (asm) word_unat.Abs_inverse, simp)
  apply(subst (asm) word_unat.Abs_inverse[where 'a="64"], simp)
  apply auto[1]
done

lemma build_fixed_program_memory_commute_miss_higher:
  fixes bytes :: "8 word list"
  assumes "x \<ge> addr + List.length bytes" and "x \<in> unats 64"
  shows "build_fixed_program_memory addr bytes (of_nat x) = 0"
using assms unfolding build_fixed_program_memory_def
  apply(induction bytes arbitrary: addr)
  apply(simp only: build_fixed_program_code_memory.simps map_of.simps)
  apply simp
  apply(simp only: build_fixed_program_code_memory.simps map_of.simps fst_def snd_def split)
  apply(simp only: Let_def)
  apply(case_tac "unat (of_nat x) = addr")
  apply(subst word_unat.Abs_inverse, simp)+
  apply(subst (asm) word_unat.Abs_inverse, simp)
  apply(subst (asm) word_unat.Abs_inverse[where 'a="64"], simp)
  apply simp
  apply(subst word_unat.Abs_inverse, simp)+
  apply(subst (asm) word_unat.Abs_inverse, simp)
  apply(subst (asm) word_unat.Abs_inverse[where 'a="64"], simp)
  apply auto[1]
done

lemma set_comprehension_collapse_miss_lower:
  assumes "x < 4194304"
  shows "{s. \<exists>k\<in>{''.data'', ''.text''}.
                      Some s = [''.data'' \<mapsto> \<lparr>startpos = Some 4194316, length1 = Some data_size, contents = replicate data_size (Some 0)\<rparr>, ''.text'' \<mapsto>
                                \<lparr>startpos = Some 4194304, length1 = Some 12,
                                   contents = (([Some 72, Some 199, Some 4, Some 37] @ foldr (\<lambda>b. op # (Some b)) (natural_to_le_byte_list (4194316 + (addr - 4194316))) []) @
                                               replicate (4 - length (natural_to_le_byte_list (4194316 + (addr - 4194316)))) (Some (of_nat 0))) @
                                              [Some 5, Some 0, Some 0, Some 0]\<rparr>]
                                k \<and>
                      the (startpos s) \<le> x \<and> x < the (startpos s) + the (length1 s)} = {}"
using assms
  apply(auto simp del: foldr.simps natural_to_le_byte_list.simps)
done

lemma set_comprehension_collapse_hit:
  fixes x :: "nat"
  assumes "4194304 \<le> x" and "x < 4194316"
  shows "{s. \<exists>k\<in>{''.data'', ''.text''}.
                  Some s = [''.data'' \<mapsto> \<lparr>startpos = Some 4194316, length1 = Some data_size, contents = replicate data_size (Some 0)\<rparr>, ''.text'' \<mapsto>
                            \<lparr>startpos = Some 4194304, length1 = Some 12,
                               contents = (([Some 72, Some 199, Some 4, Some 37] @ foldr (\<lambda>b. op # (Some b)) (natural_to_le_byte_list (4194316 + (addr - 4194316))) []) @
                                           replicate (4 - length (natural_to_le_byte_list ((4194316::nat) + (addr - 4194316)))) (Some (of_nat 0))) @
                                          [Some 5, Some 0, Some 0, Some 0]\<rparr>]
                            k \<and>
                  the (startpos s) \<le> unat ((of_nat x)::64 word) \<and> unat ((of_nat x)::64 word) < the (startpos s) + the (length1 s)} =
  { \<lparr>startpos = Some 4194304, length1 = Some 12,
                               contents = (([Some 72, Some 199, Some 4, Some 37] @ foldr (\<lambda>b. op # (Some b)) (natural_to_le_byte_list (4194316 + (addr - 4194316))) []) @
                                           replicate (4 - length (natural_to_le_byte_list (4194316 + (addr - 4194316)))) (Some (of_nat 0))) @
                                          [Some 5, Some 0, Some 0, Some 0]\<rparr> }"
using assms
  apply(auto simp del: foldr.simps natural_to_le_byte_list.simps)
  apply(subst (asm) word_unat.Abs_inverse, simp only: unats_def, simp)+
  apply(subst word_unat.Abs_inverse, simp only: unats_def, simp)+
  apply assumption
  apply(subst word_unat.Abs_inverse, simp only: unats_def, simp, assumption)
done

lemma set_comprehension_elim_text_technical:
  assumes "4194304 \<le> x" and "x < 4194316"
  shows "{s. \<exists>k\<in>{''.data'', ''.text''}.
          Some s = [''.data'' \<mapsto> \<lparr>startpos = Some 4194316, length1 = Some data_size, contents = replicate data_size (Some 0)\<rparr>,
                    ''.text'' \<mapsto> \<lparr>startpos = Some 4194304, length1 = Some 12,
                                  contents = (([Some 72, Some 199, Some 4, Some 37] @ foldr (\<lambda>b. op # (Some b)) (natural_to_le_byte_list (4194316 + (addr - 4194316))) []) @
                                              replicate (4 - length (natural_to_le_byte_list (4194316 + (addr - 4194316)))) (Some (of_nat 0))) @ [Some 5, Some 0, Some 0, Some 0]\<rparr>]
                      k \<and> the (startpos s) \<le> x \<and> x < the (startpos s) + the (length1 s)} =
  {\<lparr>startpos = Some 4194304, length1 = Some 12,
    contents = (([Some 72, Some 199, Some 4, Some 37] @ foldr (\<lambda>b. op # (Some b)) (natural_to_le_byte_list (4194316 + (addr - 4194316))) []) @
    replicate (4 - length (natural_to_le_byte_list (4194316 + (addr - 4194316)))) (Some (of_nat 0))) @ [Some 5, Some 0, Some 0, Some 0]\<rparr>}"
using assms
  apply(auto simp del: foldr.simps natural_to_le_byte_list.simps)
done

declare [[show_types]]

lemma valid_address_minus_rearrange:
  assumes "valid_address start data_size addr"
  shows "start + (addr - start) = addr"
using assms unfolding valid_address_def by simp

lemma set_comprehension_elim_data_technical:
  fixes data_size addr x :: "nat"
  shows "valid_address (4194316::nat) data_size addr \<Longrightarrow>
          4194316 \<le> x \<Longrightarrow> x < 4194316 + data_size \<Longrightarrow>
                   {s. \<exists>k\<in>{''.data'', ''.text''}.
                      Some s = [''.data'' \<mapsto> \<lparr>startpos = Some 4194316, length1 = Some data_size, contents = replicate data_size (Some 0)\<rparr>,
                                ''.text'' \<mapsto> \<lparr>startpos = Some 4194304, length1 = Some 12,
                                             contents = (([Some 72, Some 199, Some 4, Some 37] @ foldr (\<lambda>b. op # (Some b)) (natural_to_le_byte_list (4194316 + (addr - 4194316))) []) @
                                               replicate (4 - length (natural_to_le_byte_list (4194316 + (addr - 4194316)))) ((Some (of_nat 0)::8 word option))) @ [Some 5, Some 0, Some 0, Some 0]\<rparr>]
                       k \<and> the (startpos s) \<le> unat ((of_nat x)::64 word) \<and> unat ((of_nat x)::64 word) < the (startpos s) + the (length1 s)} =
    {\<lparr>startpos = Some 4194316, length1 = Some data_size, contents = replicate data_size (Some 0)\<rparr>}"
using assms unfolding valid_address_def
  apply(auto simp del: foldr.simps natural_to_le_byte_list.simps)
  apply(subst (asm) word_unat.Abs_inverse)+
  apply(simp add: unats_def valid_address_def)
  apply(simp add: unats_def valid_address_def)
  apply(subst (asm) word_unat.Abs_inverse)+
  apply(simp add: unats_def valid_address_def)
  apply simp
  apply(subst (asm) word_unat.Abs_inverse)+
  apply(simp add: unats_def valid_address_def)
  apply(simp add: unats_def valid_address_def)
  apply(subst (asm) word_unat.Abs_inverse)+
  apply(simp add: unats_def valid_address_def)
  apply simp
  apply(subst (asm) word_unat.Abs_inverse)
  apply(simp add: unats_def valid_address_def)
  apply(subst (asm) word_unat.Abs_inverse)
  apply(simp add: unats_def valid_address_def)
  apply auto
  apply(subst word_unat.Abs_inverse)
  apply(simp add: unats_def valid_address_def)
  apply assumption
  apply(subst word_unat.Abs_inverse)
  apply(simp add: unats_def valid_address_def)
  apply assumption
done
  
lemma set_comprehension_elim_neither_technical:
  shows "4194316 + data_size \<le> (x::nat) \<Longrightarrow> (x::nat) < 18446744073709551616 \<Longrightarrow> {s. \<exists>k\<in>{''.data'', ''.text''}.
                      Some s = [''.data'' \<mapsto> \<lparr>startpos = Some 4194316, length1 = Some data_size, contents = replicate data_size (Some 0)\<rparr>, ''.text'' \<mapsto>
                                \<lparr>startpos = Some 4194304, length1 = Some 12,
                                   contents = (([Some 72, Some 199, Some 4, Some 37] @ foldr (\<lambda>b. op # (Some b)) (natural_to_le_byte_list (4194316 + (addr - 4194316))) []) @
                                               replicate (4 - length (natural_to_le_byte_list (4194316 + (addr - 4194316)))) (Some (of_nat 0))) @
                                              [Some 5, Some 0, Some 0, Some 0]\<rparr>]
                                k \<and>
                      the (startpos s) \<le> unat ((of_nat x)::64 word) \<and> unat ((of_nat x)::64 word) < the (startpos s) + the (length1 s)} = {}"
  apply(auto simp del: foldr.simps natural_to_le_byte_list.simps)
  apply(subst (asm) word_unat.Abs_inverse, auto simp add: unats_def)+
done

lemma mask_ucast_technical:
  shows "ucast (of_nat addr AND mask (8::nat)) = (of_nat (addr mod (256::nat))::8 word)"
sorry

lemma valid_address_natural_to_le_byte_list_elim:
  assumes "valid_address 4194316 data_size addr"
  shows "(\<exists>b1 b2 b3 b4. natural_to_le_byte_list addr = [b1, b2, b3, b4]) \<or>
         (\<exists>b1 b2 b3. natural_to_le_byte_list addr = [b1, b2, b3])"
using assms unfolding valid_address_def
  apply -
  apply(erule conjE)+
  apply(rule dec_induct, assumption)
  apply(rule disjI2)
  apply(rule exI[where x="12"])
  apply(rule exI[where x="0"])
  apply(rule exI[where x="64"])
  apply eval
  apply(erule disjE)
  apply(erule exE)+
  apply(subst (asm) natural_to_le_byte_list.simps)
  apply(rule disjI1)
  apply(rule exI)+
  apply(simp only: Let_def)
  apply(case_tac "n div (256::nat) = (0::nat)", simp, clarify)
sorry

lemma list_eq_discharge_technical:
  assumes "4194304 \<le> x \<and> x < 4194316"
  shows "[72, 199, 4, 37, word_extract 7 0 ((of_nat addr)::64 word), word_extract 15 8 ((of_nat addr)::64 word), word_extract 23 16 ((of_nat addr)::64 word), word_extract 31 24 ((of_nat addr)::64 word), 5, 0, 0, 0] ! (x - 4194304) =
       the (((([Some 72, Some 199, Some 4, Some 37] @ foldr (\<lambda>b. op # (Some b)) (natural_to_le_byte_list addr) []) @
              replicate (4 - length (natural_to_le_byte_list addr)) (Some (of_nat 0))) @
             [Some 5, Some 0, Some 0, Some 0]) !
            (x - 4194304))"
using assms
  apply(simp del: natural_to_le_byte_list.simps word_extract.simps)
  apply(erule conjE)
  apply(drule interval_elim, assumption)
  apply(erule disjE, clarify)
  apply simp
  apply(erule disjE, clarify)
  apply simp
  apply(erule disjE, clarify)
  apply simp
  apply(erule disjE, clarify)
  apply simp
  apply(erule disjE, clarify)
  apply(simp add: mask_ucast_technical)
  apply(erule disjE, clarify)
  apply simp

lemma valid_address_64_bit_overflow:
  assumes "1 \<le> data_size" and "valid_address 4194316 data_size addr"
  shows "18446744071562067968 <=s of_nat addr \<and> of_nat addr <=s 2147483647"
using assms unfolding valid_address_def
  apply simp
  apply(erule conjE)+
  apply(rule conjI)
sorry

text {* Proof of the main correctness theorem. *}
theorem
  shows "correctness_property"
unfolding correctness_property_def
  apply(rule allI)+
  apply(simp only: Let_def)
  apply(rule impI)+
  apply(rule ballI)
  apply(subst load_fixed_program_instructions_def)
  apply(simp only: fixed_program_def mov_constant_to_mem_def Let_def)
  apply(subst encode_Zmov_in_concrete, rule valid_address_64_bit_overflow, assumption+)
  apply(rule refl)+
  apply(simp only: relocation_image_def relocatable_program_def
    mov_constant_to_mem_def)
  apply(subst encode_Zmov_in_concrete, simp, simp only: concrete_evaluations, (rule refl)+)
  apply(simp only: concrete_evaluations)
  apply(subst img1_technical)
  apply(rule valid_address_four_bytes)
  apply(subst add_diff_inverse_nat, simp add: valid_address_def, assumption)
  apply(simp only: annotated_memory_image.simps)
  apply(simp only: load_relocated_program_image_def X64_state.ext_inject)
  apply(simp only: X64_state.simps)
  apply(simp only: X64_memory_of_memory_image_def dom_2)
  apply(simp only: Let_def)
  apply(subgoal_tac "x < 4194304 \<or> x \<ge> 4194304 \<and> x < 4194316 \<or> x \<ge> 4194316 \<and> x < 4194316 + data_size \<or> x \<ge> 4194316 + data_size \<and> x < 18446744073709551616")
  apply(erule disjE)
  apply(subst build_fixed_program_memory_commute_miss_lower, simp, simp)
  apply(subst word_unat.Abs_inverse, simp only: unats_def, simp)+
  apply(subst set_comprehension_collapse_miss_lower, assumption)
  apply(simp only: refl if_True)
  apply(erule disjE, erule conjE)
  apply(subst build_fixed_program_memory_commute, simp, simp, simp add: unats_def)
  apply(subst set_comprehension_collapse_hit, simp, simp)
  apply(subst if_weak_cong[where c=False], simp)
  apply(simp only: if_False)
  apply(subst word_unat.Abs_inverse, simp only: unats_def, simp)+
  apply(subst set_comprehension_elim_text_technical, simp, simp)+
  apply(simp only: the_elem_eq element.simps option.sel append.simps)
  apply(subst list_eq_discharge_technical, simp, simp)
  apply(erule disjE, erule conjE)
  apply(subst build_fixed_program_memory_commute_miss_higher, simp, simp add: unats_def)
  apply(subst set_comprehension_elim_data_technical, assumption, assumption, assumption)+
  apply(subst word_unat.Abs_inverse, simp add: unats_def)+
  apply(subst if_weak_cong[where c=False], simp, simp only: if_False)
  apply(simp only: the_elem_eq element.simps option.sel)
  apply(simp only: nth_the_technical)
  apply(subst build_fixed_program_memory_commute_miss_higher, simp, simp)+
  apply(subst set_comprehension_elim_neither_technical, simp, simp)+
  apply(auto simp add: unats_def)
done

end