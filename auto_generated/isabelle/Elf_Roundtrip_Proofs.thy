theory
  Elf_Roundtrip_Proofs
imports
  Main
  Elf_file
begin

  section {* Custom induction principles *}

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

  lemma error_bind_Success:
    assumes "f >>= g = Success s"
    shows "\<exists>x. f = Success x \<and> g x = Success s"
  using assms by(cases f, clarify, auto simp add: error_bind.simps)

  lemma error_bind_compose [simp]:
    shows "(x >>= f) >>= g = x >>= (\<lambda>y. f y >>= g)"
  by(cases x, simp_all, auto simp add: error_bind.simps)

  lemma error_bind_case:
    fixes x :: "'a error" and f :: "'a \<Rightarrow> 'b error"
    shows "x >>= (\<lambda>r. f r) = (case x of Success r \<Rightarrow> f r | Fail e \<Rightarrow> Fail e)"
  by(cases x, simp_all, auto simp add: error_bind.simps)

  lemma repeatM_length [simp, rule_format]:
    fixes m :: "nat" and act :: "'a error" and r :: "'a list"
    shows "repeatM m act = Success r \<longrightarrow> List.length r = m"
  proof(induct m arbitrary: r)
    show "\<And>r. repeatM 0 act = Success r \<longrightarrow> List.length r = 0"
    proof
      fix r
      assume "repeatM 0 act = Success r"
      hence "error_return [] = Success r" using repeatM.simps by auto
      hence "Success [] = Success r" using error_return_def by metis
      hence "[] = r" by simp
      thus "List.length r = 0" by auto
    qed
  next
    fix x r
    assume IH: "\<And>r. repeatM x act = Success r \<longrightarrow> List.length r = x"
    show "repeatM (Suc x) act = Success r \<longrightarrow> List.length r = (Suc x)"
    proof
      assume "repeatM (Suc x) act = Success r"
      hence *: "act >>= (\<lambda>hd. repeatM x act >>= (\<lambda>tl. error_return (hd#tl))) = Success r" using repeatM.simps by auto
      obtain s :: "'a" where "act = Success s \<and> ((repeatM x act >>= (\<lambda>tl. error_return (s#tl))) = Success r)" using error_bind_Success[OF *] by blast
      hence **: "act = Success s" and ***: "(repeatM x act >>= (\<lambda>tl. error_return (s#tl))) = Success r" by auto
      obtain xs where "(repeatM x act = Success xs) \<and> (error_return (s#xs) = Success r)" using error_bind_Success[OF ***] by blast
      hence ****: "repeatM x act = Success xs" and *****: "error_return (s#xs) = Success r" by auto
      hence "Success (s#xs) = Success r" using ***** error_return_def by metis
      hence ******: "s#xs = r" by simp
      have "\<And>r. repeatM x act = Success r \<Longrightarrow> List.length r = x" using IH by auto
      hence "List.length xs = x" using **** by auto
      hence "List.length (s#xs) = Suc x" by auto
      thus "List.length r = Suc x" using ****** by auto
    qed
  qed

  lemma repeatM'_length [rule_format]:
    fixes m :: "nat" and e :: "'a" and f :: "'a \<Rightarrow> ('b \<times> 'a) error" and r :: "'b list" and rest :: "'a"
    shows "repeatM' m e f = Success (r, rest) \<longrightarrow> List.length r = m"
  proof(induct m arbitrary: e f r rest)
    fix e :: "'a"
    fix f :: "'a \<Rightarrow> ('b \<times> 'a) error"
    fix r :: "'b list"
    fix rest :: "'a"
    show "repeatM' 0 e f = Success (r, rest) \<longrightarrow> List.length r = 0"
    proof
      assume "repeatM' 0 e f = Success (r, rest)"
      hence "error_return ([], e) = Success (r, rest)" using repeatM'.simps by auto
      hence "Success ([], e) = Success (r, rest)" using error_return_def by metis
      hence "[] = r" by simp
      thus "List.length r = 0" by simp
    qed
  next
    fix m :: "nat"
    fix e :: "'a"
    fix f :: "'a \<Rightarrow> ('b \<times> 'a) error"
    fix r rest
    assume IH: "(\<And>(e :: 'a) (f :: 'a \<Rightarrow> ('b \<times> 'a) error) r rest. repeatM' m e f = Success (r, rest) \<longrightarrow> List.length r = m)"
    show "repeatM' (Suc m) e f = Success (r, rest) \<longrightarrow> List.length r = Suc m"
    proof(rule impI)
      assume "repeatM' (Suc m) e f = Success (r, rest)"
      hence *: "f e >>= (\<lambda>(hd, sd). repeatM' m sd f >>= (\<lambda>(tl, sd'). error_return (hd#tl, sd'))) = Success (r, rest)" using repeatM'.simps by auto
      obtain x and s where "f e = Success (x, s) \<and> (repeatM' m s f >>= (\<lambda>(tl, sd'). error_return (x#tl, sd')) = Success (r, rest))" using error_bind_Success[OF *] by auto
      hence "f e = Success (x, s)" and **: "repeatM' m s f >>= (\<lambda>(tl, sd'). error_return (x#tl, sd')) = Success (r, rest)" by auto
      obtain xs and s' where "repeatM' m s f = Success (xs, s') \<and> error_return (x#xs, s') = Success (r, rest)" using error_bind_Success[OF **] by auto
      hence ***: "repeatM' m s f = Success (xs, s')" and "error_return (x#xs, s') = Success (r, rest)" by auto
      hence "Success (x#xs, s') = Success (r, rest)" using error_return_def by metis
      hence ****: "x#xs = r" by auto
      also have "List.length xs = m" using IH[rule_format, OF ***] by auto
      hence "List.length (x#xs) = Suc m" by auto
      thus "List.length r = Suc m" using **** by auto
    qed
  qed
  
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
      moreover have "...  = error_return (x#xs)" using error_bind.simps by metis
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
  by(auto simp add: Byte_sequence.length.simps)

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

  lemma dropbytes_length [simp]:
    fixes m :: "nat" and bs out :: "byte_sequence"
    shows "dropbytes m bs = Success out \<longrightarrow> length bs = length out + m"
  sorry

  section {* Helpful lemmas *}

  lemma unsigned_char_out_in_roundtrip:
    fixes e :: "endianness" and u :: "unsigned_char" and bs0 :: "byte_sequence" and bs1 :: "(8 word) list"
    assumes "read_unsigned_char e bs0 = Success (u, Sequence bs1)"
    shows "bs0 = Sequence (u#bs1)"
  using assms unfolding read_unsigned_char_def proof(cases bs0, clarify)
    fix xs
    assume *: "bs0 = Sequence xs"
    assume **: "read_char (Sequence xs) >>= (\<lambda>(u1, bs1). error_return (id u1, bs1)) = Success (u, Sequence bs1)"
    show "xs = u#bs1"
    using * ** by(cases xs, clarify, auto simp add: read_char.simps error_fail_def error_return_def error_bind.simps)
  qed      

  lemma unsigned_char_in_out_roundtrip:
    assumes "bs0 = Sequence (u#bs1)"
    shows "read_unsigned_char e bs0 = Success (u, Sequence bs1)"
  using assms
  by(clarify, auto simp add: read_unsigned_char_def read_char.simps error_return_def error_bind.simps)

  lemma dual_of_uint16_uint16_of_dual_inv:
    fixes u1 u2 :: "8 word"
    shows "dual_of_uint16 (uint16_of_dual u1 u2) = (u1, u2)"
  unfolding dual_of_uint16_def uint16_of_dual_def
    apply(rule word_split_cat_alt[OF refl])
    apply(auto simp add: word_size)
  done

  lemma uint16_of_dual_dual_of_uint16_inv:
    fixes u1 u2 :: "8 word"
    assumes *: "dual_of_uint16 w = (u1, u2)"
    shows "uint16_of_dual u1 u2 = w"
  using assms unfolding dual_of_uint16_def uint16_of_dual_def
    apply(rule word_cat_split_alt[rotated])
    apply(auto simp add: word_size)
  done

  lemma elf64_half_out_in_roundtrip:
    fixes e :: "endianness" and u :: "uint16" and bs0 :: "byte_sequence" and bs bs1 :: "(8 word) list"
    assumes "read_elf64_half e bs0 = Success (u, Sequence bs1)"
        and "bytes_of_elf64_half e u = [u1, u2]"
    shows "bs0 = Sequence ([u2, u1]@bs1)"
  using assms
    apply(case_tac e, clarify)
      apply(case_tac bs0, clarify)
      apply(case_tac list, clarify)
      apply(simp only: read_elf64_half.simps)
      apply(simp only: read_2_bytes_be_def)
      apply(simp only: read_char.simps)
      apply(simp only: error_fail_def)
      apply(simp only: error_bind.simps)
      apply(simp only: error.simps)
      apply clarify
      apply(case_tac lista, clarify)
      apply(simp only: read_elf64_half.simps)
      apply(simp only: read_2_bytes_be_def)
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def)
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: read_char.simps)
      apply(simp only: error_fail_def)
      apply(simp only: error_bind.simps)
      apply(simp only: error.simps)
      apply(simp only: read_elf64_half.simps)
      apply(simp only: read_2_bytes_be_def)
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def)
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def)
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: bytes_of_elf64_half.simps)
      apply(simp only: Let_def)
      apply(simp only: dual_of_uint16_uint16_of_dual_inv)
      apply auto
      apply(simp only: read_elf64_half.simps)
      apply(simp only: read_2_bytes_be_def)
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def)
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def)
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: bytes_of_elf64_half.simps)
      apply(simp only: dual_of_uint16_uint16_of_dual_inv)
      apply auto
      apply(simp only: read_elf64_half.simps)
      apply(simp only: read_2_bytes_be_def)
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def)
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def error_bind.simps)
      apply auto
      apply(simp only: error_bind.simps)
      apply auto
    (* Little case *)
      apply(case_tac bs0, clarify)
      apply(case_tac list, clarify)
      apply(simp only: read_elf64_half.simps)
      apply(simp only: read_2_bytes_le_def)
      apply(simp only: read_char.simps)
      apply(simp only: error_fail_def)
      apply(simp only: error_bind.simps)
      apply(simp only: error.simps)
      apply clarify
      apply(case_tac lista, clarify)
      apply(simp only: read_elf64_half.simps)
      apply(simp only: read_2_bytes_le_def)
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def)
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: read_char.simps)
      apply(simp only: error_fail_def)
      apply(simp only: error_bind.simps)
      apply(simp only: error.simps)
      apply(simp only: read_elf64_half.simps)
      apply(simp only: read_2_bytes_le_def)
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def)
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def)
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: bytes_of_elf64_half.simps)
      apply(simp only: Let_def)
      apply(simp only: dual_of_uint16_uint16_of_dual_inv)
      apply auto
      apply(simp only: read_elf64_half.simps)
      apply(simp only: read_2_bytes_le_def)
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def)
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def)
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: bytes_of_elf64_half.simps)
      apply(simp only: dual_of_uint16_uint16_of_dual_inv)
      apply auto
      apply(simp only: read_elf64_half.simps)
      apply(simp only: read_2_bytes_le_def)
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def)
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def error_bind.simps)
      apply auto
      apply(simp only: error_bind.simps)
      apply auto
  done

  lemma elf64_half_in_out_roundtrip:
    fixes e :: "endianness" and u :: "uint16" and bs0 :: "byte_sequence" and bs bs1 :: "(8 word) list"
    assumes "bytes_of_elf64_half e u = [u2, u1]"
    shows "read_elf64_half e (Sequence (u1#u2#bs1)) = Success (u, Sequence bs1)"
  using assms
    apply(case_tac e, clarify)
      apply(simp only: read_elf64_half.simps)
      apply(simp only: read_2_bytes_be_def)
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def error_bind.simps)
      apply auto
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def error_bind.simps)
      apply auto
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: bytes_of_elf64_half.simps)
      apply(simp only: Let_def)
      apply(case_tac "dual_of_uint16 u", auto)
      apply(rule uint16_of_dual_dual_of_uint16_inv)
      apply(simp only: dual_of_uint16_def)
    (* Little *)
      apply(simp only: read_elf64_half.simps)
      apply(simp only: read_2_bytes_le_def)
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def error_bind.simps)
      apply auto
      apply(simp only: read_char.simps)
      apply(simp only: error_return_def error_bind.simps)
      apply auto
      apply(simp only: error_bind.simps)
      apply auto
      apply(simp only: bytes_of_elf64_half.simps)
      apply(simp only: Let_def)
      apply(case_tac "dual_of_uint16 u", auto)
      apply(rule uint16_of_dual_dual_of_uint16_inv)
      apply(simp only: dual_of_uint16_def)
  done

  lemma elf64_header_out_in_roundtrip:
    fixes hdr64 :: "elf64_header" and bs :: "byte_sequence"
    shows "read_elf64_header (bytes_of_elf64_header hdr64) = Success (hdr64, bs)"
  apply(case_tac hdr64, clarify)
  apply(simp only: bytes_of_elf64_header_def)
  apply(simp only: deduce_endianness_def)
  apply auto
  apply(case_tac "Elf_Types_Local.index elf64_ident 5")
  apply auto
  apply(simp only: from_byte_lists_def)
  apply(simp only: List.concat.simps)
  apply(simp only: read_elf64_header_def)
  apply(simp only: ei_nident_def)

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
