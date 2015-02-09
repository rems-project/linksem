theory
  Elf_Roundtrip_Proofs
imports
  Main
  Elf_file
begin

  section {* Error monad properties *}

  lemma error_return_bind_neutral1 [simp]:
    shows "error_return x >>= f = f x"
  unfolding error_return_def by (simp add: error_bind.simps)

  lemma error_return_bind_neutral2 [simp]: 
    shows "x >>= error_return = x"
  by(cases x, simp_all, auto simp add: error_bind.simps error_return_def)

  lemma error_bind_compose [simp]:
    shows "(x >>= f) >>= g = x >>= (\<lambda>y. f y >>= g)"
  by(cases x, simp_all, auto simp add: error_bind.simps)

  lemma error_bind_case [simp]:
    fixes x :: "'a error" and f :: "'a \<Rightarrow> 'b error"
    shows "x >>= (\<lambda>r. f r) = (case x of Success r \<Rightarrow> f r | Fail e \<Rightarrow> Fail e)"
  by(cases x, simp_all, auto simp add: error_bind.simps)

  lemma repeatM_length [simp]:
    fixes m :: "nat" and act :: "'a error"
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

  lemma create_length [simp]:
    shows "length (create m c) = m"
  sorry

  lemma dropbytes_Zero [simp]:
    shows "dropbytes 0 bs = Success bs"
  by(cases bs, auto simp add: dropbytes.simps error_return_def)

  lemma dropbytes_length_Fail [simp]:
    shows "Byte_sequence.length bs < m \<Longrightarrow> \<exists>err. dropbytes m bs = Fail err"
  apply(induct rule: dropbytes.induct)
  apply(rule exI)
  apply(case_tac count1)
  apply simp
  apply(case_tac ts)
  apply(simp add: error_fail_def)
  apply clarify
  apply(subst dropbytes.simps)
  apply(subst nat.split)
  apply(rule conjI)
  apply simp
  apply(rule allI)
  apply(rule impI)+
  apply(subst list.split)
  apply(rule conjI)
  apply simp
  apply(rule allI)+
  apply clarify
  apply(simp only: atomize_exL)

  lemma dropbytes_length [simp]:
    fixes m :: "nat" and bs out :: "byte_sequence"
    assumes "dropbytes m bs = Success out"
    shows "length bs = length out + m"
  using assms proof(induct m)

  section {* Helpful lemmas *}

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
