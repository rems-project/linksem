theory
  Elf_Roundtrip_Proofs
imports
  Main
  Elf_file
begin

  section {* Error monad properties *}

  fun is_failing :: "'a error \<Rightarrow> bool" where
    "is_failing (Fail err) = True"
  | "is_failing _          = False"

  lemma is_failing_err_exists:
    fixes f :: "'a error"
    assumes "is_failing f"
    shows "\<exists>err :: string. f = Fail err"
  using assms by(cases f, auto)

  lemma is_failing_propagates1 [simp]:
    assumes "is_failing f"
    shows "is_failing (f >>= g)"
  using assms by(cases f, auto simp add: error_bind.simps)

  lemma is_failing_propagates2:
    fixes f :: "'a error" and g :: "'a \<Rightarrow> 'b error"
    assumes "\<exists>a. f = Success a \<and> is_failing (g a)"
    shows "is_failing (f >>= g)"
  using assms by(cases f, auto simp add: error_bind.simps)

  lemma is_failing_dichotomy:
    fixes f :: "'a error" and g :: "'a \<Rightarrow> 'b error"
    assumes "is_failing (f >>= g)"
    shows "is_failing f \<or> (\<exists>a. f = Success a \<and> is_failing (g a))"
  using assms by(cases f, auto simp add: error_bind.simps)

  lemma error_return_bind_neutral1 [simp]:
    shows "error_return x >>= f = f x"
  unfolding error_return_def by (simp add: error_bind.simps)

  lemma error_return_bind_neutral2 [simp]: 
    shows "x >>= error_return = x"
  by(cases x, simp_all, auto simp add: error_bind.simps error_return_def)

  lemma error_bind_compose [simp]:
    shows "(x >>= f) >>= g = x >>= (\<lambda>y. f y >>= g)"
  by(cases x, simp_all, auto simp add: error_bind.simps)

  lemma error_bind_case:
    fixes x :: "'a error" and f :: "'a \<Rightarrow> 'b error"
    shows "x >>= (\<lambda>r. f r) = (case x of Success r \<Rightarrow> f r | Fail e \<Rightarrow> Fail e)"
  by(cases x, simp_all, auto simp add: error_bind.simps)

  lemma repeatM_length [simp, rule_format]:
    fixes m :: "nat" and act :: "'a error" and r :: "'a list"
    assumes "repeatM m act = Success r"
    shows "List.length r = m"
  sorry

  lemma repeatM'_length [simp]:
    fixes m :: "nat" and e :: "'a" and f :: "'a \<Rightarrow> ('b \<times> 'a) error" and r :: "'b list" and rest :: "'a"
    assumes "repeatM' m e f = Success (r, rest)"
    shows "List.length r = m"
  sorry
  
  lemma mapM_length [simp]:
    fixes f :: "'a \<Rightarrow> 'b error" and i :: "'a list" and r :: "'b list"
    assumes "mapM f i = Success r"
    shows "List.length r = List.length i"
  sorry

  lemma mapM_error_return [simp]:
    fixes i :: "'a list"
    shows "mapM error_return i = Success i"
  proof(induct i)
    case Nil
      have "mapM error_return [] = error_return []" by simp
      moreover have "... = Success []" using error_return_def by fastforce
      ultimately show ?case by auto
  next
    case (Cons x xs)
      assume *: "mapM error_return xs = Success xs"
      have "mapM error_return (x#xs) =
        error_return x >>= (\<lambda>h. mapM error_return xs >>= (\<lambda>t. error_return (h#t)))" by simp
      moreover have "... = mapM error_return xs >>= (\<lambda>t. error_return (x#t))" using error_return_def error_bind.simps by metis
      moreover have "... = Success xs >>= (\<lambda>t. error_return (x#t))" using * by simp
      moreover have "...  = error_return (x#xs)" using error_bind.simps by auto
      moreover have "... = Success (x#xs)" using error_return_def by metis
      ultimately show ?case by auto
  qed

  section {* Byte sequence properties *}

  lemma empty_length [simp]:
    shows "length empty = 0"
  unfolding empty_def by (auto simp add: length.simps)

  lemma repeat_length [simp]:
    shows "List.length (repeat m c) = m"
  by(induct m, simp add: repeat.simps, auto simp add: repeat.simps)

  lemma length_cons [simp]:
    shows "Byte_sequence.length (Sequence (x#xs)) = 1 + Byte_sequence.length (Sequence xs)"
  sorry

  lemma Byte_sequence_induct:
    assumes "\<And>bs. bs = Sequence [] \<Longrightarrow> P bs" and
      "\<And>bs bs' x xs. bs = Sequence xs \<Longrightarrow> bs' = Sequence (x#xs) \<Longrightarrow> P bs \<Longrightarrow> P bs'"
    shows "\<And>bs. P bs"
  sorry

  lemma Byte_sequence_length_list_length_interchange [simp]:
    fixes ts :: "byte list"
    shows "Byte_sequence.length (Sequence ts) = List.length ts"
  by(induct ts, auto simp add: Byte_sequence.length.simps)

  lemma create_length [simp]:
    shows "length (create m c) = m"
  proof -
    have "length (create m c) = length (Sequence (repeat m c))" unfolding create_def by auto
    moreover have "... = List.length (repeat m c)" by auto
    moreover have "... = m" using repeat_length by auto
    ultimately show "length (create m c) = m" by auto
  qed

  lemma dropbytes_Zero [simp]:
    shows "dropbytes 0 bs = Success bs"
  by(cases bs, auto simp add: dropbytes.simps error_return_def)

  lemma nat_minus_one_induct:
    fixes P :: "nat \<Rightarrow> bool" and x :: "nat"
    assumes P0: "P 0" and P1: "\<And>x. P (x - 1) \<Longrightarrow> P x"
    shows "P x"
  proof(induct x rule: nat.induct)
    show "P 0" using P0 .
  next
    fix m :: "nat"
    assume Pm: "P m"
    have "P m = P (Suc m - 1)" by auto
    hence "P (Suc m - 1)" using Pm by auto
    from this show "P (Suc m)" using P1[where x="Suc m"] by auto
  qed

  lemma dropbytes_length_is_failing [simp]:
    fixes m :: "nat" and bs :: "byte_sequence"
    assumes "m > length bs"
    shows "is_failing (dropbytes m bs)"
  using assms proof(induct m rule: nat_minus_one_induct)
    assume "Byte_sequence.length bs < 0"
    obtain ts where *: "is_failing (dropbytes 0 bs) = is_failing (dropbytes 0 (Sequence ts))" by (metis dropbytes_Zero is_failing.simps(2))
    have "is_failing (dropbytes 0 (Sequence ts))"
    proof(cases ts)
      assume "ts = []"

  lemma dropbytes_length [simp]:
    fixes m :: "nat" and bs out :: "byte_sequence"
    assumes "dropbytes m bs = Success out"
    shows "length bs = length out + m"
  sorry

  section {* Helpful lemmas *}

  lemma unsigned_char_out_in_roundtrip:
    fixes e :: "endianness" and u :: "unsigned_char" and bs0 :: "byte_sequence" and bs1 :: "(8 word) list"
    assumes "read_unsigned_char e bs0 = Success (u, Sequence bs1)"
    shows "bs0 = Sequence (u#bs1)"
  sorry

  lemma unsigned_char_in_out_roundtrip:
    assumes "bs0 = Sequence (u#bs1)"
    shows "read_unsigned_char e bs0 = Success (u, Sequence bs1)"
  proof -
    thm read_unsigned_char_def
    have "read_unsigned_char e bs0 = read_unsigned_char e (Sequence (u#bs1))" using assms by simp
    moreover have "... = read_char (Sequence (u#bs1)) >>= (\<lambda>(h, t). error_return (h, t))" using read_unsigned_char_def by auto
    moreover have "... = Success (u, Sequence bs1) >>= (\<lambda>(h, t). error_return (h, t))" using read_char.simps error_return_def by metis
    moreover have "... = error_return (u, Sequence bs1)" by simp
    moreover have "... = Success (u, Sequence bs1)" using error_return_def by metis
    ultimately show ?thesis by auto
  qed

  lemma elf64_header_out_in_roundtrip:
    fixes hdr64 :: "elf64_header" and bs :: "byte_sequence"
    shows "read_elf64_header (bytes_of_elf64_header hdr64) = Success (hdr64, bs)"
  sorry

  section {* The main roundtripping theorems *}

  theorem elf64_out_in_roundtrip:
    fixes ef64 :: "elf64_file" and bs :: "byte_sequence"
    assumes "bytes_of_elf64_file ef64 = Success bs"
    shows "read_elf64_file bs = Success ef64"
  sorry

  theorem elf64_in_out_roundtrip:
    fixes ef64 :: "elf64_file" and bs :: "byte_sequence"
    assumes "read_elf64_file bs = Success ef64"
    shows "bytes_of_elf64_file ef64 = Success bs"
  sorry

  theorem elf32_out_in_roundtrip:
    fixes ef32 :: "elf32_file" and bs :: "byte_sequence"
    assumes "bytes_of_elf32_file ef32 = Success bs"
    shows "read_elf32_file bs = Success ef64"
  sorry

  theorem elf32_in_out_roundtrip:
    fixes ef32 :: "elf32_file" and bs :: "byte_sequence"
    assumes "read_elf32_file bs = Success ef32"
    shows "bytes_of_elf32_file ef32 = Success bs"
  sorry

end
