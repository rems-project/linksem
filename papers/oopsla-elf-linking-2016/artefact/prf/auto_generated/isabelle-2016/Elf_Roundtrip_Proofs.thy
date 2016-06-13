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

  lemma byte_sequence_length_induct:
    fixes bs :: "byte_sequence" and P :: "byte_sequence \<Rightarrow> bool"
    assumes "P empty" and "(\<And>xs ys. P xs \<Longrightarrow> length xs < length ys \<Longrightarrow> P ys)"
    shows "P bs"
  sorry

  section {* Error monad properties *}

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
    shows "mapM f i = Success r \<longrightarrow> List.length i = List.length r"
  proof(induct i arbitrary: r)
    fix r
    show "mapM f [] = Success r \<longrightarrow> List.length [] = List.length r"
    proof
      assume "mapM f [] = Success r"
      hence "error_return [] = Success r" using mapM.simps by auto
      hence "Success [] = Success r" using error_return_def by metis
      hence "[] = r" using error.simps by auto
      thus "List.length [] = List.length r" by auto
    qed
  next
    fix x xs r
    assume IH: "(\<And>r. mapM f xs = Success r \<longrightarrow> List.length xs = List.length r)"
    show "mapM f (x#xs) = Success r \<longrightarrow> List.length (x#xs) = List.length r"
    proof
      assume "mapM f (x#xs) = Success r"
      hence "f x >>= (\<lambda>hd. mapM f xs >>= (\<lambda>tl. error_return (hd#tl))) = Success r" using mapM.simps by auto
      from this obtain hd' where "f x = Success hd' \<and> ((mapM f xs >>= (\<lambda>tl. error_return (hd'#tl))) = Success r)" using error_bind_Success by fastforce
      hence "f x = Success hd'" and "mapM f xs >>= (\<lambda>tl. error_return (hd'#tl)) = Success r" by auto
      from this obtain tl' where "(mapM f xs = Success tl') \<and> (error_return (hd'#tl') = Success r)" using error_bind_Success by fastforce
      hence *: "mapM f xs = Success tl'" and "error_return (hd'#tl') = Success r" by auto
      hence "Success (hd'#tl') = Success r" using error_return_def by metis
      hence **: "hd'#tl' = r" by auto
      also have "List.length xs = List.length tl'" using IH[rule_format, OF *] by auto
      hence "List.length (x#xs) = List.length (hd'#tl')" by auto
      thus "List.length (x#xs) = List.length r" using ** by auto
    qed
  qed

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
      moreover have "... = error_return (x#xs)" using error_bind.simps by metis
      moreover have "... = Success (x#xs)" using error_return_def by metis
      ultimately show ?case by auto
  qed

  section {* Byte sequence properties *}

  lemma empty_length [simp]:
    shows "length empty = 0"
  unfolding empty_def by (auto simp add: length.simps)

  lemma length_empty [simp]:
    assumes "length bs0 = 0"
    shows "bs0 = Sequence []"
  using assms
    apply(case_tac bs0, simp)
    apply(case_tac list, simp)
    apply(simp only: length.simps)
    apply auto
  done

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
  proof(induct m arbitrary: bs out)
    fix bs out
    show "dropbytes 0 bs = Success out \<longrightarrow> length bs = length out + 0"
    proof(cases bs, safe)
      fix xs
      assume "dropbytes 0 (Sequence xs) = Success out"
      hence "error_return (Sequence xs) = Success out" using dropbytes.simps by auto
      hence "Success (Sequence xs) = Success out" using error_return_def by metis
      hence "Sequence xs = out" by fastforce
      hence "length (Sequence xs) = length out" by auto
      thus "length (Sequence xs) = length out + 0" by auto
    qed
  next
    fix m bs out
    assume IH: "(\<And>bs out. dropbytes m bs = Success out \<longrightarrow> length bs = length out + m)"
    show "dropbytes (Suc m) bs = Success out \<longrightarrow> length bs = length out + (Suc m)"
    proof(cases bs, erule forw_subst)
      fix xs
      show "dropbytes (Suc m) (Sequence xs) = Success out \<longrightarrow> length (Sequence xs) = length out + (Suc m)"
      proof(cases xs, safe)
        assume "dropbytes (Suc m) (Sequence []) = Success out"
        hence "\<exists>err. error_fail err = Success out" using dropbytes.simps by auto
        hence "\<exists>err. Fail err = Success out" using error_fail_def by metis
        thus "length (Sequence []) = length out + (Suc m)" using error.simps by auto
      next
        fix y ys
        assume "dropbytes (Suc m) (Sequence (y#ys)) = Success out"
        hence "dropbytes (Suc m - 1) (Sequence ys) = Success out" using dropbytes.simps by auto
        hence "dropbytes m (Sequence ys) = Success out" using arith by auto
        hence "length (Sequence ys) = length out + m" using IH[rule_format] by metis
        hence "length (Sequence (y#ys)) = Suc (length out + m)" using length.simps by auto
        thus "length (Sequence (y#ys)) = length out + Suc m" by auto
      qed
    qed
  qed

  lemma takebytes_length:
    shows "takebytes sz bs0 = Success bs1 \<longrightarrow> length bs1 = sz"
  proof(induct sz arbitrary: bs0 bs1)
    fix bs0 bs1
    show "takebytes 0 bs0 = Success bs1 \<longrightarrow> length bs1 = 0"
    proof(cases bs0, safe)
      fix xs
      assume "takebytes 0 (Sequence xs) = Success bs1"
      hence "error_return (Sequence []) = Success bs1" using takebytes.simps by auto
      hence "Success (Sequence []) = Success bs1" using error_return_def by metis
      hence "Sequence [] = bs1" by auto
      thus "length bs1 = 0" using length.simps by auto
    qed
  next
    fix sz bs0 bs1
    assume IH: "(\<And>bs0 bs1. takebytes sz bs0 = Success bs1 \<longrightarrow> length bs1 = sz)"
    show "takebytes (Suc sz) bs0 = Success bs1 \<longrightarrow> length bs1 = Suc sz"
    proof(cases bs0, erule forw_subst)
      fix xs
      show "takebytes (Suc sz) (Sequence xs) = Success bs1 \<longrightarrow> length bs1 = Suc sz"
      proof(cases xs, safe)
        assume "takebytes (Suc sz) (Sequence []) = Success bs1"
        hence "\<exists>err. error_fail err = Success bs1" using takebytes.simps by auto
        hence "\<exists>err. Fail err = Success bs1" using error_fail_def by metis
        thus "length bs1 = Suc sz" using error.simps by auto
      next
        fix y ys
        assume "takebytes (Suc sz) (Sequence (y#ys)) = Success bs1"
        hence "(takebytes ((Suc sz) - 1) (Sequence ys) >>= (\<lambda>t. case t of (Sequence t') \<Rightarrow> error_return (Sequence (y#t')))) = Success bs1" using takebytes.simps by auto
        from this obtain t'' where **: "takebytes ((Suc sz) - 1) (Sequence ys) = Success t'' \<and> (case t'' of (Sequence t') \<Rightarrow> error_return (Sequence (y#t')) = Success bs1)" using error_bind_Success sorry
        hence "takebytes sz (Sequence ys) = Success t''" using arith by auto
        hence *: "length t'' = sz" using IH by metis
        also have "case t'' of Sequence t' \<Rightarrow> error_return (Sequence (y#t')) = Success bs1" using ** by auto
        thus "length bs1 = Suc sz"
        proof(cases t'', clarify, auto simp add: case_prodI)
          fix zs
          assume "error_return (Sequence (y#zs)) = Success bs1" and **: "t'' = Sequence zs"
          hence "Success (Sequence (y#zs)) = Success bs1" using error_return_def by metis
          hence "Sequence (y#zs) = bs1" by auto
          hence "length bs1 = Suc (length (Sequence zs))" by auto
          hence "length bs1 = Suc (length t'')" using ** by auto
          thus "length bs1 = Suc sz" using * by auto
        qed
      qed
    qed
  qed

  lemma partition_length:
   assumes "partition sz bs0 = Success (lft, rgt)"
    shows "length bs0 = length lft + length rgt"
  using assms proof -
    have "partition sz bs0 = Success (lft, rgt)" using assms by auto
    hence "takebytes sz bs0 >>= (\<lambda>l. dropbytes sz bs0 >>= (\<lambda>r. error_return (l, r))) = Success (lft, rgt)" using partition_def by metis
    from this obtain l' where *: "takebytes sz bs0 = Success l' \<and> (dropbytes sz bs0 >>= (\<lambda>r. error_return (l', r)) = Success (lft, rgt))" using error_bind_Success by fastforce
    hence "takebytes sz bs0 = Success l'" by auto
    hence S: "length l' = sz" using takebytes_length assms by auto
    also have "(dropbytes sz bs0 >>= (\<lambda>r. error_return (l', r)) = Success (lft, rgt))" using * by auto
    from this obtain r' where **: "dropbytes sz bs0 = Success r' \<and> error_return (l', r') = Success (lft, rgt)" using error_bind_Success by fastforce
    hence "error_return (l', r') = Success (lft, rgt)" by auto
    hence "Success (l', r') = Success(lft, rgt)" using error_return_def by metis
    hence L: "l' = lft" and R: "r' = rgt" by auto
    have "dropbytes sz bs0 = Success r'" using ** by auto
    hence "length bs0 = length r' + sz" using dropbytes_length assms by auto
    hence "length bs0 = length r' + length l'" using S by auto
    thus "length bs0 = length lft + length rgt" using L R by auto
  qed

  lemma takebytes_success [rule_format]:
    shows "takebytes sz bs0 = Success (Sequence bs1) \<longrightarrow> (\<exists>bs2. bs0 = Sequence (bs1 @ bs2))"
  proof(induct sz arbitrary: bs0 bs1)
    fix bs0 bs1
    show "takebytes 0 bs0 = Success (Sequence bs1) \<longrightarrow> (\<exists>bs2. bs0 = Sequence (bs1 @ bs2))"
    proof(cases bs0, erule forw_subst)
      fix xs
      show "takebytes 0 (Sequence xs) = Success (Sequence bs1) \<longrightarrow> (\<exists>bs2. (Sequence xs) = Sequence (bs1 @ bs2))"
      proof
        assume "takebytes 0 (Sequence xs) = Success (Sequence bs1)"
        hence "error_return (Sequence []) = Success (Sequence bs1)" using takebytes.simps by simp
        hence "Success (Sequence []) = Success (Sequence bs1)" using error_return_def by metis
        hence "[] = bs1" by simp
        hence "xs = bs1 @ xs" by simp
        thus "\<exists>bs2. Sequence xs = Sequence (bs1 @ bs2)" by simp
      qed
    qed
  next
    fix sz bs0 bs1
    assume IH: "(\<And>bs0 bs1. takebytes sz bs0 = Success (Sequence bs1) \<longrightarrow>
                  (\<exists>bs2. bs0 = Sequence (bs1 @ bs2)))"
    show "takebytes (Suc sz) bs0 = Success (Sequence bs1) \<longrightarrow>
            (\<exists>bs2. bs0 = Sequence (bs1 @ bs2))"
    proof(cases bs0, erule forw_subst)
      fix xs
      show "takebytes (Suc sz) (Sequence xs) = Success (Sequence bs1) \<longrightarrow>
            (\<exists>bs2. Sequence xs = Sequence (bs1 @ bs2))"
      proof(cases xs, erule forw_subst, rule impI)
        assume "takebytes (Suc sz) (Sequence []) = Success (Sequence bs1)"
        hence "\<exists>err. error_fail err = Success (Sequence bs1)" using takebytes.simps by auto
        hence "\<exists>err. Fail err = Success (Sequence bs1)" using error_fail_def by metis
        thus "\<exists>bs2. Sequence [] = Sequence (bs1 @ bs2)" using error.simps by auto
      next
        fix y ys
        assume A: "xs = y#ys"
        show "takebytes (Suc sz) (Sequence xs) = Success (Sequence bs1) \<longrightarrow>
                (\<exists>bs2. Sequence xs = Sequence (bs1 @ bs2))"
        using A proof(clarify)
          assume "takebytes (Suc sz) (Sequence (y#ys)) = Success (Sequence bs1)"
          hence "takebytes sz (Sequence ys) >>= (\<lambda>t. case t of Sequence t' \<Rightarrow> error_return (Sequence (y#t'))) = Success (Sequence bs1)" using takebytes.simps by auto
          from this obtain t'' where "(takebytes sz (Sequence ys) = Success t'') \<and> (case t'' of Sequence t' \<Rightarrow> error_return (Sequence (y#t'))) = Success (Sequence bs1)" using error_bind_Success[where s="Sequence bs1"] by auto
          hence *: "takebytes sz (Sequence ys) = Success t''" and **: "(case t'' of Sequence t' \<Rightarrow> error_return (Sequence (y#t'))) = Success (Sequence bs1)" by simp+
          from this obtain bs1' where ***: "t'' = Sequence bs1'" using byte_sequence.exhaust by auto
          hence "case (Sequence bs1') of Sequence t' \<Rightarrow> error_return (Sequence (y#t')) = Success (Sequence bs1)" using ** by auto
          hence "error_return (Sequence (y#bs1')) = Success (Sequence bs1)" by auto
          hence "Success (Sequence (y#bs1')) = Success (Sequence bs1)" using error_return_def by metis
          hence ****: "y#bs1' = bs1" by simp
          also have "\<exists>bs2. Sequence ys = Sequence (bs1' @ bs2)" using IH * *** by blast
          from this obtain bs2 where "Sequence ys = Sequence (bs1' @ bs2)" by blast
          hence "Sequence (y#ys) = Sequence (y#(bs1' @ bs2))" by auto
          hence "Sequence (y#ys) = Sequence ((y#bs1') @ bs2)" by auto
          hence "\<exists>bs2. Sequence (y#ys) = Sequence ((y#bs1') @ bs2)" by auto
          thus "\<exists>bs2. Sequence (y#ys) = Sequence (bs1 @ bs2)" using **** by simp
        qed
      qed
    qed
  qed

  lemma partition_reconstitute [rule_format]:
    shows "partition sz bs0 = Success (Sequence lft, Sequence rgt) \<longrightarrow> bs0 = Sequence (lft @ rgt)"
  using assms sorry

  section {* Helpful lemmas *}

  (* More precise control over numeral desugaring than plain `simp'. *)
  lemma Suc_lemmas:
    shows "16 = Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc 0)))))))))))))))"
      and "5 = Suc (Suc (Suc (Suc (Suc 0))))"
      and "4 = Suc (Suc (Suc (Suc 0)))"
  by simp+

  subsection {* Converting between bytes and (un)signed types *}

  lemma dual_of_uint16_uint16_of_dual_inv:
    fixes u1 u2 :: "8 word"
    shows "dual_of_uint16 (uint16_of_dual u1 u2) = (u1, u2)"
  unfolding dual_of_uint16_def uint16_of_dual_def
    apply(rule word_split_cat_alt[OF refl])
    apply(auto simp add: word_size)
  done

  lemma quad_of_uint32_uint32_of_quad_inv:
    fixes u1 u2 u3 u4 :: "8 word"
    shows "quad_of_uint32 (uint32_of_quad u1 u2 u3 u4) = (u1, u2, u3, u4)"
    apply(unfold uint32_of_quad_def)
    apply(simp only: Let_def)
    apply(unfold quad_of_uint32_def)
    apply(subst word_split_cat_alt, auto)
    apply(simp add: word_size)
    apply(subst word_split_cat_alt, auto)
    apply(simp add: word_size)
    apply(subst word_split_cat_alt, auto)
    apply(simp add: word_size)
  done

  lemma quad_of_sint32_sint32_of_quad_inv:
    shows "quad_of_sint32 (sint32_of_quad u1 u2 u3 u4) = (u1, u2, u3, u4)"
    apply(unfold sint32_of_quad_def)
    apply(simp only: Let_def)
    apply(unfold quad_of_sint32_def)
    apply(subst word_split_cat_alt, auto)
    apply(simp add: word_size)
    apply(subst word_split_cat_alt, auto)
    apply(simp add: word_size)
    apply(subst word_split_cat_alt, auto)
    apply(simp add: word_size)
  done

  lemma oct_of_uint64_uint64_of_oct_inv:
    fixes u1 u2 u3 u4 u5 u6 u7 u8 :: "8 word"
    shows "oct_of_uint64 (uint64_of_oct u1 u2 u3 u4 u5 u6 u7 u8) = (u1, u2, u3, u4, u5, u6, u7, u8)"
    apply(unfold uint64_of_oct_def)
    apply(simp only: Let_def)
    apply(unfold oct_of_uint64_def)
    apply(subst word_split_cat_alt, auto)
    apply(simp add: word_size)
    apply(simp add: split_def)
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
  done

  lemma oct_of_sint64_sint64_of_oct_inv:
    fixes u1 u2 u3 u4 u5 u6 u7 u8 :: "8 word"
    shows "oct_of_sint64 (sint64_of_oct u1 u2 u3 u4 u5 u6 u7 u8) = (u1, u2, u3, u4, u5, u6, u7, u8)"
    apply(unfold sint64_of_oct_def)
    apply(simp only: Let_def)
    apply(unfold oct_of_sint64_def)
    apply(subst word_split_cat_alt, auto)
    apply(simp add: word_size)
    apply(simp add: split_def)
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
    apply(subst word_split_cat_alt, auto)+
    apply(simp add: word_size)+
  done

  lemma uint16_of_dual_dual_of_uint16_inv:
    fixes u1 u2 :: "8 word"
    assumes *: "dual_of_uint16 w = (u1, u2)"
    shows "uint16_of_dual u1 u2 = w"
  using assms unfolding dual_of_uint16_def uint16_of_dual_def
    apply(rule word_cat_split_alt[rotated])
    apply(auto simp add: word_size)
  done

  lemma uint32_of_quad_quad_of_uint32_inv:
    fixes u1 u2 u3 u4 :: "8 word"
    assumes *: "quad_of_uint32 w = (u1, u2, u3, u4)"
    shows "uint32_of_quad u1 u2 u3 u4 = w"
  using assms unfolding quad_of_uint32_def uint32_of_quad_def
    apply(simp only: Let_def)
    apply(subst word_cat_split_alt[where w="w"])
    apply(auto simp add: word_size)
    apply(case_tac "word_split w")
    apply rotate_tac
    apply(frule forw_subst, auto)
    apply(subst word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(thin_tac "word_split w = (a,b)")
    apply(subst word_split_cat_alt, auto simp add: word_size)
    apply(subst word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(simp add: split_def)
    apply auto
    apply(thin_tac "word_split w = (a,b)")
    apply(simp add: split_def)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(simp add: word_size)
    apply auto
  done

  lemma sint32_of_quad_quad_of_sint32_inv:
    assumes *: "quad_of_sint32 w = (u1, u2, u3, u4)"
    shows "sint32_of_quad u1 u2 u3 u4 = w"
  using assms unfolding quad_of_sint32_def sint32_of_quad_def
    apply(simp only: Let_def)
    apply(subst word_cat_split_alt[where w="w"])
    apply(auto simp add: word_size)
    apply(case_tac "word_split w")
    apply rotate_tac
    apply(frule forw_subst, auto)
    apply(subst word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(thin_tac "word_split w = (a,b)")
    apply(subst word_split_cat_alt, auto simp add: word_size)
    apply(subst word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(simp add: split_def)
    apply auto
    apply(thin_tac "word_split w = (a,b)")
    apply(simp add: split_def)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(simp add: word_size)
    apply auto
  done

  lemma uint64_of_oct_oct_of_uint64_inv [rule_format]:
    fixes u1 u2 u3 u4 u5 u6 u7 u8 :: "8 word" and w :: "64 word"
    shows "oct_of_uint64 w = (u1, u2, u3, u4, u5, u6, u7, u8) \<longrightarrow> uint64_of_oct u1 u2 u3 u4 u5 u6 u7 u8 = w"
  unfolding oct_of_uint64_def uint64_of_oct_def
    apply(rule prod.exhaust[where y="word_split w"])
    apply(simp only: Let_def)
    apply(rule forw_subst, assumption)
    apply simp
    apply(rule_tac ?y="word_split x1" in prod.exhaust)
    apply(rule forw_subst, assumption)
    apply simp
    apply(rule_tac ?y="word_split x2" in prod.exhaust)
    apply(rule forw_subst, assumption)
    apply simp
    apply(rule_tac ?y="word_split x1a" in prod.exhaust)
    apply(rule forw_subst, assumption)
    apply simp
    apply(rule_tac ?y="word_split x2a" in prod.exhaust)
    apply(rule forw_subst, assumption)
    apply simp
    apply(rule_tac ?y="word_split x1b" in prod.exhaust)
    apply(rule forw_subst, assumption)
    apply simp
    apply(rule impI)
    apply(erule conjE)+
    apply clarify
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
  done

  lemma sint64_of_oct_oct_of_sint64_inv [rule_format]:
    fixes u1 u2 u3 u4 u5 u6 u7 u8 :: "8 word" and w :: "64 word"
    shows "oct_of_sint64 w = (u1, u2, u3, u4, u5, u6, u7, u8) \<longrightarrow> sint64_of_oct u1 u2 u3 u4 u5 u6 u7 u8 = w"
  unfolding oct_of_sint64_def sint64_of_oct_def
    apply(rule prod.exhaust[where y="word_split w"])
    apply(simp only: Let_def)
    apply(rule forw_subst, assumption)
    apply simp
    apply(rule_tac ?y="word_split x1" in prod.exhaust)
    apply(rule forw_subst, assumption)
    apply simp
    apply(rule_tac ?y="word_split x2" in prod.exhaust)
    apply(rule forw_subst, assumption)
    apply simp
    apply(rule_tac ?y="word_split x1a" in prod.exhaust)
    apply(rule forw_subst, assumption)
    apply simp
    apply(rule_tac ?y="word_split x2a" in prod.exhaust)
    apply(rule forw_subst, assumption)
    apply simp
    apply(rule_tac ?y="word_split x1b" in prod.exhaust)
    apply(rule forw_subst, assumption)
    apply simp
    apply(rule impI)
    apply(erule conjE)+
    apply clarify
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
    apply(rule sym)
    apply(rule word_cat_split_alt)
    apply(auto simp add: word_size)
  done

  subsection {* Roundtripping for (un)signed types *}

  subsubsection {* Out-in *}

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

  lemma elf64_half_out_in_roundtrip:
    fixes e :: "endianness" and u :: "uint16" and bs0 :: "byte_sequence" and bs bs1 :: "(8 word) list"
    assumes "read_elf64_half e bs0 = Success (u, Sequence bs1)"
        and "bytes_of_elf64_half e u = [u1, u2]"
    shows "bs0 = Sequence ([u1, u2]@bs1)"
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

  lemma elf64_word_out_in_roundtrip:
    fixes e :: "endianness" and u :: "uint32" and bs0 :: "byte_sequence" and bs bs1 :: "(8 word) list"
    assumes "read_elf64_word e bs0 = Success (u, Sequence bs1)"
        and "bytes_of_elf64_word e u = [u1, u2, u3, u4]"
    shows "bs0 = Sequence ([u1, u2, u3, u4]@bs1)"
  using assms
    apply(case_tac e, clarify)
      apply(case_tac bs0, clarify)
      apply(case_tac list, clarify)
      apply(simp only: read_elf64_word.simps read_4_bytes_be_def)
      apply(simp only: read_char.simps error_fail_def error_bind.simps)
      apply(simp only: error.simps)
      apply clarify
      apply(simp only: read_elf64_word.simps read_4_bytes_be_def)
      apply(simp only: read_char.simps error_return_def error_bind.simps)
      apply(case_tac "lista", clarify)
      apply(simp only: read_char.simps error_fail_def error_bind.simps)
      apply(simp only: error.simps)
      apply clarify
      apply(simp only: read_char.simps error_return_def error_bind.simps)
      apply(case_tac "listb", clarify)
      apply(simp only: read_char.simps error_fail_def error_bind.simps)
      apply(simp only: error.simps)
      apply clarify
      apply(simp only: read_char.simps error_return_def error_bind.simps)
      apply(case_tac "listc", clarify)
      apply(simp only: read_char.simps error_fail_def error_bind.simps)
      apply(simp only: error.simps)
      apply clarify
      apply(simp only: read_char.simps error_return_def error_bind.simps)
      apply(simp only: split_def)
      apply(auto simp add: error_bind.simps)
      apply(simp only: bytes_of_elf64_word.simps)
      apply(simp only: quad_of_uint32_uint32_of_quad_inv)
      apply(simp only: Let_def split_def)
      apply auto
      apply(simp only: bytes_of_elf64_word.simps)
      apply(simp only: quad_of_uint32_uint32_of_quad_inv)
      apply(simp only: Let_def split_def)
      apply auto
      apply(simp only: bytes_of_elf64_word.simps)
      apply(simp only: quad_of_uint32_uint32_of_quad_inv)
      apply(simp only: Let_def split_def)
      apply auto
      apply(simp only: bytes_of_elf64_word.simps)
      apply(simp only: quad_of_uint32_uint32_of_quad_inv)
      apply(simp only: Let_def split_def)
      apply auto
    (* Little case *)
      apply(case_tac bs0, clarify)
      apply(case_tac list, clarify)
      apply(simp only: read_elf64_word.simps read_4_bytes_le_def)
      apply(simp only: read_char.simps error_fail_def error_bind.simps)
      apply(simp only: error.simps)
      apply clarify
      apply(simp only: read_elf64_word.simps read_4_bytes_le_def)
      apply(simp only: read_char.simps error_return_def error_bind.simps)
      apply(case_tac "lista", clarify)
      apply(simp only: read_char.simps error_fail_def error_bind.simps)
      apply(simp only: error.simps)
      apply clarify
      apply(simp only: read_char.simps error_return_def error_bind.simps)
      apply(case_tac "listb", clarify)
      apply(simp only: read_char.simps error_fail_def error_bind.simps)
      apply(simp only: error.simps)
      apply clarify
      apply(simp only: read_char.simps error_return_def error_bind.simps)
      apply(case_tac "listc", clarify)
      apply(simp only: read_char.simps error_fail_def error_bind.simps)
      apply(simp only: error.simps)
      apply clarify
      apply(simp only: read_char.simps error_return_def error_bind.simps)
      apply(simp only: split_def)
      apply(auto simp add: error_bind.simps)
      apply(simp only: bytes_of_elf64_word.simps)
      apply(simp only: quad_of_uint32_uint32_of_quad_inv)
      apply(simp only: Let_def split_def)
      apply auto
      apply(simp only: bytes_of_elf64_word.simps)
      apply(simp only: quad_of_uint32_uint32_of_quad_inv)
      apply(simp only: Let_def split_def)
      apply auto
      apply(simp only: bytes_of_elf64_word.simps)
      apply(simp only: quad_of_uint32_uint32_of_quad_inv)
      apply(simp only: Let_def split_def)
      apply auto
      apply(simp only: bytes_of_elf64_word.simps)
      apply(simp only: quad_of_uint32_uint32_of_quad_inv)
      apply(simp only: Let_def split_def)
      apply auto
  done

  lemma elf64_addr_out_in_roundtrip:
    fixes e :: "endianness" and u :: "uint64" and bs0 :: "byte_sequence" and bs bs1 :: "(8 word) list"
    assumes "read_elf64_addr e bs0 = Success (u, Sequence bs1)"
        and "bytes_of_elf64_addr e u = [u1, u2, u3, u4, u5, u6, u7, u8]"
    shows "bs0 = Sequence ([u1, u2, u3, u4, u5, u6, u7, u8]@bs1)"
  using assms sorry

  subsubsection {* In-out *}

  lemma unsigned_char_in_out_roundtrip:
    assumes "bs0 = Sequence (u#bs1)"
    shows "read_unsigned_char e bs0 = Success (u, Sequence bs1)"
  using assms
  by(clarify, auto simp add: read_unsigned_char_def read_char.simps error_return_def error_bind.simps)

  lemma elf64_half_in_out_roundtrip:
    fixes e :: "endianness" and u :: "uint16" and bs0 :: "byte_sequence" and bs bs1 :: "(8 word) list"
    assumes "bytes_of_elf64_half e u = [u1, u2]"
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

  lemma elf64_word_in_out_roundtrip:
    fixes e :: "endianness" and u :: "uint32" and bs0 :: "byte_sequence" and bs bs1 :: "(8 word) list"
    assumes "bytes_of_elf64_word e u = [u1, u2, u3, u4]"
    shows "read_elf64_word e (Sequence (u1#u2#u3#u4#bs1)) = Success (u, Sequence bs1)"
  using assms
    apply(case_tac e, clarify)
    apply(simp only: read_elf64_word.simps)
    apply(simp only: read_4_bytes_be_def)
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply auto
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply auto
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply auto
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply auto
    apply(simp only: error_bind.simps)
    apply auto
    apply(simp only: bytes_of_elf64_word.simps Let_def split_def)
    apply(auto simp add: uint32_of_quad_quad_of_uint32_inv)
  (* Little case *)
    apply(simp only: read_elf64_word.simps)
    apply(simp only: read_4_bytes_le_def)
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply auto
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply auto
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply auto
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply auto
    apply(simp only: error_bind.simps)
    apply auto
    apply(simp only: bytes_of_elf64_word.simps Let_def split_def)
    apply(auto simp add: uint32_of_quad_quad_of_uint32_inv)
  done

  lemma elf64_addr_in_out_roundtrip:
    fixes e :: "endianness" and u :: "uint64" and bs0 :: "byte_sequence" and bs bs1 :: "(8 word) list"
    assumes "bytes_of_elf64_addr e u = [u1, u2, u3, u4, u5, u6, u7, u8]"
    shows "read_elf64_addr e (Sequence (u1#u2#u3#u4#u5#u6#u7#u8#bs1)) = Success (u, Sequence bs1)"
  using assms
    apply(case_tac e, clarify)
    apply(simp only: read_elf64_addr.simps)
    apply(simp only: read_8_bytes_be_def)
    apply(simp only: read_char.simps error_return_def error_bind.simps, simp add: case_prodI)+
    apply(simp only: bytes_of_elf64_addr.simps Let_def split_def)
    apply(auto simp add: uint64_of_oct_oct_of_uint64_inv)
  (* Little case *)
    apply(simp only: read_elf64_addr.simps)
    apply(simp only: read_8_bytes_le_def)
    apply(simp only: read_char.simps error_return_def error_bind.simps, simp add: case_prodI)+
    apply(simp only: bytes_of_elf64_addr.simps Let_def split_def)
    apply(auto simp add: uint64_of_oct_oct_of_uint64_inv)
  done

  lemma elf64_off_in_out_roundtrip:
    fixes e :: "endianness" and u :: "uint64" and bs0 :: "byte_sequence" and bs bs1 :: "(8 word) list"
    assumes "bytes_of_elf64_off e u = [u1, u2, u3, u4, u5, u6, u7, u8]"
    shows "read_elf64_off e (Sequence (u1#u2#u3#u4#u5#u6#u7#u8#bs1)) = Success (u, Sequence bs1)"
  using assms
    apply(case_tac e, clarify)
    apply(simp only: read_elf64_off.simps)
    apply(simp only: read_8_bytes_be_def)
    apply(simp only: read_char.simps error_return_def error_bind.simps, simp add: case_prodI)+
    apply(simp only: bytes_of_elf64_off.simps Let_def split_def)
    apply(auto simp add: uint64_of_oct_oct_of_uint64_inv)
  (* Little case *)
    apply(simp only: read_elf64_off.simps)
    apply(simp only: read_8_bytes_le_def)
    apply(simp only: read_char.simps error_return_def error_bind.simps, simp add: case_prodI)+
    apply(simp only: bytes_of_elf64_off.simps Let_def split_def)
    apply(auto simp add: uint64_of_oct_oct_of_uint64_inv)
  done

  lemma elf64_sword_in_out_roundtrip:
    fixes e :: "endianness" and u :: "sint32" and bs0 :: "byte_sequence" and bs bs1 :: "(8 word) list"
    assumes "bytes_of_elf64_sword e u = [u1, u2, u3, u4]"
    shows "read_elf64_sword e (Sequence (u1#u2#u3#u4#bs1)) = Success (u, Sequence bs1)"
  using assms
    apply(case_tac e, clarify)
    apply(simp only: read_elf64_sword.simps)
    apply(simp only: read_4_bytes_be_def)
    apply(simp only: read_char.simps error_return_def error_bind.simps, simp add: case_prodI)+
    apply(simp only: bytes_of_elf64_sword.simps)
    apply(simp only: Let_def split_def)
    apply(auto simp add: sint32_of_quad_quad_of_sint32_inv)
  (* Little case *)
    apply(case_tac e, clarify)
    apply(simp only: read_elf64_sword.simps)
    apply(simp only: read_4_bytes_le_def)
    apply(simp only: read_char.simps error_return_def error_bind.simps, simp add: case_prodI)+
    apply(simp only: bytes_of_elf64_sword.simps)
    apply(simp only: Let_def split_def)
    apply(auto simp add: sint32_of_quad_quad_of_sint32_inv)
  done

  lemma elf64_xword_in_out_roundtrip:
    fixes e :: "endianness" and u :: "uint64" and bs0 :: "byte_sequence" and bs bs1 :: "(8 word) list"
    assumes "bytes_of_elf64_xword e u = [u1, u2, u3, u4, u5, u6, u7, u8]"
    shows "read_elf64_xword e (Sequence (u1#u2#u3#u4#u5#u6#u7#u8#bs1)) = Success (u, Sequence bs1)"
  using assms
    apply(case_tac e, clarify)
    apply(simp only: read_elf64_xword.simps)
    apply(simp only: read_8_bytes_be_def)
    apply(simp only: read_char.simps error_return_def error_bind.simps, simp add: case_prodI)+
    apply(simp only: bytes_of_elf64_xword.simps Let_def split_def)
    apply(auto simp add: uint64_of_oct_oct_of_uint64_inv)
  (* Little case *)
    apply(simp only: read_elf64_xword.simps)
    apply(simp only: read_8_bytes_le_def)
    apply(simp only: read_char.simps error_return_def error_bind.simps, simp add: case_prodI)+
    apply(simp only: bytes_of_elf64_xword.simps Let_def split_def)
    apply(auto simp add: uint64_of_oct_oct_of_uint64_inv)
  done

  lemma elf64_sxword_in_out_roundtrip:
    fixes e :: "endianness" and u :: "sint64" and bs0 :: "byte_sequence" and bs bs1 :: "(8 word) list"
    assumes "bytes_of_elf64_sxword e u = [u1, u2, u3, u4, u5, u6, u7, u8]"
    shows "read_elf64_sxword e (Sequence (u1#u2#u3#u4#u5#u6#u7#u8#bs1)) = Success (u, Sequence bs1)"
  using assms
    apply(case_tac e, clarify)
    apply(simp only: read_elf64_sxword.simps)
    apply(simp only: read_8_bytes_be_def)
    apply(simp only: read_char.simps error_return_def error_bind.simps, simp add: case_prodI)+
    apply(simp only: bytes_of_elf64_sxword.simps)
    apply(simp only: Let_def split_def)
    apply(auto simp add: sint64_of_oct_oct_of_sint64_inv)
  (* Little case *)
    apply(simp only: read_elf64_sxword.simps)
    apply(simp only: read_8_bytes_le_def)
    apply(simp only: read_char.simps error_return_def error_bind.simps, simp add: case_prodI)+
    apply(simp only: bytes_of_elf64_sxword.simps)
    apply(simp only: Let_def split_def)
    apply(auto simp add: sint64_of_oct_oct_of_sint64_inv)
  done

  section {* Roundtripping for ELF components *}

  subsection {* Out-in *}

  lemma elf64_header_out_in_roundtrip:
    fixes hdr64 :: "elf64_header" and bs :: "byte_sequence"
    shows "read_elf64_header (bytes_of_elf64_header hdr64) = Success (hdr64, bs)"
  sorry

  subsection {* In-out *}

  subsubsection {* Header *}

  lemma elf64_header_in_out_roundtrip:
    assumes "read_elf64_header bs0 = Success (hdr64, Sequence bs1)"
    assumes "bytes_of_elf64_header hdr64 = Sequence bs2"
    shows "bs0 = Sequence (bs2 @ bs1)"
  using assms
    apply(case_tac bs0, clarify)
    apply(case_tac list, clarify)
    apply(simp only: read_elf64_header_def)
    apply(simp only: ei_nident_def Suc_lemmas)
    apply(simp only: repeatM'.simps)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_elf64_header_def)
    apply(simp only: ei_nident_def Suc_lemmas)
    apply(simp only: repeatM'.simps)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp only: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp only: case_prodI)
    apply(case_tac lista, clarify)
    apply(auto simp only: id_def fst_def snd_def diff_Suc_1)
    apply(simp only: repeatM'.simps)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply(simp only: repeatM'.simps)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_unsigned_char_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps, auto simp add: case_prodI)+
    (* Bottomed out! *)
    apply(simp only: deduce_endianness_def)
    apply(simp only: Suc_lemmas)
    apply(simp only: Elf_Types_Local.index.simps)
    apply simp
    apply(case_tac "unat ae = elf_data_2lsb")
    apply simp
    apply(simp only: read_elf64_half.simps read_2_bytes_le_def)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp add: error_bind.simps)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_word.simps read_4_bytes_le_def)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_addr.simps read_8_bytes_le_def)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_off.simps read_8_bytes_le_def)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp only: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac "unat ad = elf_class_64")
    apply simp
    apply(case_tac hdr64)
    apply simp
    apply(simp only: bytes_of_elf64_header_def)
    apply simp
    apply(simp only: deduce_endianness_def)
    apply(simp only: Suc_lemmas)
    apply auto
    apply(simp only: from_byte_lists_def)
    apply(simp only: bytes_of_elf64_half.simps)
    apply(simp only: dual_of_uint16_uint16_of_dual_inv)
    apply(simp only: bytes_of_elf64_word.simps)
    apply(simp only: quad_of_uint32_uint32_of_quad_inv)
    apply(simp only: bytes_of_elf64_off.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: bytes_of_elf64_addr.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: Let_def)
    apply(auto simp add: case_prodI)
    apply(simp only: error_fail_def error.simps)
    apply(case_tac "unat ae = elf_data_2msb")
    apply simp
    apply(simp only: read_elf64_half.simps read_2_bytes_be_def)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp add: error_bind.simps)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_word.simps read_4_bytes_be_def)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_addr.simps read_8_bytes_be_def)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_off.simps read_8_bytes_be_def)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp only: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac "unat ad = elf_class_64")
    apply simp
    apply(simp only: bytes_of_elf64_header_def)
    apply simp
    apply(simp only: deduce_endianness_def)
    apply(simp only: Suc_lemmas)
    apply auto
    apply(simp only: from_byte_lists_def)
    apply(simp only: bytes_of_elf64_half.simps)
    apply(simp only: dual_of_uint16_uint16_of_dual_inv)
    apply(simp only: bytes_of_elf64_word.simps)
    apply(simp only: quad_of_uint32_uint32_of_quad_inv)
    apply(simp only: bytes_of_elf64_off.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: bytes_of_elf64_addr.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: Let_def)
    apply(auto simp add: case_prodI)
    apply(simp only: error_fail_def error.simps)
    apply(simp only: read_elf64_half.simps read_2_bytes_le_def)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp add: error_bind.simps)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_word.simps read_4_bytes_le_def)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_addr.simps read_8_bytes_le_def)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_off.simps read_8_bytes_le_def)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp only: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, clarify)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply clarify
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac "unat ad = elf_class_64")
    apply simp
    apply(case_tac hdr64)
    apply simp
    apply(simp only: bytes_of_elf64_header_def)
    apply simp
    apply(simp only: deduce_endianness_def)
    apply(simp only: Suc_lemmas)
    apply auto
    apply(simp only: from_byte_lists_def)
    apply(simp only: bytes_of_elf64_half.simps)
    apply(simp only: dual_of_uint16_uint16_of_dual_inv)
    apply(simp only: bytes_of_elf64_word.simps)
    apply(simp only: quad_of_uint32_uint32_of_quad_inv)
    apply(simp only: bytes_of_elf64_off.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: bytes_of_elf64_addr.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: Let_def)
    apply(auto simp add: case_prodI)
    apply(simp only: error_fail_def error.simps)
  done

  subsubsection {* Program header table *}

  lemma read_elf64_program_header_table_entry_in_out_roundtrip:
    assumes "read_elf64_program_header_table_entry e bs0 = Success (ent, Sequence bs1)"
        and "bytes_of_elf64_program_header_table_entry e ent = Sequence bs2"
      shows "bs0 = Sequence (bs2@bs1)"
  using assms
    apply(case_tac e, simp)
    apply(case_tac bs0, simp)
    apply(case_tac list, simp)
    apply(simp only: read_elf64_program_header_table_entry_def)
    apply(simp only: read_elf64_word.simps read_4_bytes_be_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_elf64_program_header_table_entry_def)
    apply(simp only: read_elf64_word.simps read_4_bytes_be_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp add: error_bind.simps)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_off.simps)
    apply(simp only: read_8_bytes_be_def)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_addr.simps)
    apply(simp only: read_8_bytes_be_def)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_xword.simps)
    apply(simp only: read_8_bytes_be_def)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(unfold bytes_of_elf64_program_header_table_entry_def)
    apply(simp only: from_byte_lists_def List.concat.simps)
    apply(case_tac ent, simp)
    apply(simp only: bytes_of_elf64_word.simps)
    apply(simp only: quad_of_uint32_uint32_of_quad_inv)
    apply(simp only: bytes_of_elf64_off.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: bytes_of_elf64_addr.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: bytes_of_elf64_xword.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply simp
    apply(case_tac bs0, simp)
    apply(case_tac list, simp)
    apply(simp only: read_elf64_program_header_table_entry_def)
    apply(simp only: read_elf64_word.simps read_4_bytes_le_def read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_elf64_program_header_table_entry_def)
    apply(simp only: read_elf64_word.simps read_4_bytes_le_def read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp add: error_bind.simps)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_off.simps)
    apply(simp only: read_8_bytes_le_def)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_addr.simps)
    apply(simp only: read_8_bytes_le_def)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_xword.simps)
    apply(simp only: read_8_bytes_le_def)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: from_byte_lists_def List.concat.simps)
    apply(case_tac ent, simp)
    apply(simp only: bytes_of_elf64_word.simps)
    apply(simp only: quad_of_uint32_uint32_of_quad_inv)
    apply(simp only: bytes_of_elf64_off.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: bytes_of_elf64_addr.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: bytes_of_elf64_xword.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply simp
  done

  subsubsection {* Section header table *}

  lemma read_elf64_section_header_table_entry_in_out_roundtrip:
    assumes "read_elf64_section_header_table_entry e bs0 = Success (ent, Sequence bs1)"
        and "bytes_of_elf64_section_header_table_entry e ent = Sequence bs2"
      shows "bs0 = Sequence (bs2@bs1)"
  using assms
    apply(case_tac e, simp)
    apply(case_tac bs0, simp)
    apply(case_tac list, simp)
    apply(unfold read_elf64_section_header_table_entry_def)
    apply(simp only: read_elf64_word.simps)
    apply(simp only: read_4_bytes_be_def)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_elf64_word.simps)
    apply(simp only: read_4_bytes_be_def)
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_xword.simps)
    apply(simp only: read_8_bytes_be_def)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_addr.simps)
    apply(simp only: read_8_bytes_be_def)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_off.simps)
    apply(simp only: read_8_bytes_be_def)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: bytes_of_elf64_section_header_table_entry_def)
    apply(case_tac ent, simp)
    apply(simp only: bytes_of_elf64_word.simps)
    apply(simp only: quad_of_uint32_uint32_of_quad_inv)
    apply(simp only: bytes_of_elf64_xword.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: bytes_of_elf64_addr.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: bytes_of_elf64_off.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: from_byte_lists_def)
    apply simp
    apply(case_tac e, simp)
    apply(case_tac bs0, simp)
    apply(case_tac list, simp)
    apply(simp only: read_elf64_word.simps)
    apply(simp only: read_4_bytes_le_def)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_elf64_word.simps)
    apply(simp only: read_4_bytes_le_def)
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_xword.simps)
    apply(simp only: read_8_bytes_le_def)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_addr.simps)
    apply(simp only: read_8_bytes_le_def)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: read_elf64_off.simps)
    apply(simp only: read_8_bytes_le_def)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac list, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(case_tac lista, simp)
    apply(simp only: read_char.simps)
    apply(simp only: error_fail_def error_bind.simps error.simps)
    apply simp
    apply(simp only: read_char.simps)
    apply(simp only: error_return_def error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: error_bind.simps)
    apply(auto simp add: case_prodI)
    apply(simp only: bytes_of_elf64_section_header_table_entry_def)
    apply(case_tac ent, simp)
    apply(simp only: bytes_of_elf64_word.simps)
    apply(simp only: quad_of_uint32_uint32_of_quad_inv)
    apply(simp only: bytes_of_elf64_xword.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: bytes_of_elf64_addr.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: bytes_of_elf64_off.simps)
    apply(simp only: oct_of_uint64_uint64_of_oct_inv)
    apply(simp only: from_byte_lists_def)
    apply simp
  done

  corollary read_elf64_section_header_table_entry_in_out_roundtrip2:
    assumes "read_elf64_section_header_table_entry e (Sequence (bs2@bs1)) = Success (ent, Sequence bs1)"
      shows "bytes_of_elf64_section_header_table_entry e ent = Sequence bs2"
  using assms
  sorry

  termination read_elf64_section_header_table'
    sorry

  lemma read_elf64_section_header_table'_in_out_roundrip:
    shows "read_elf64_section_header_table' e bs0 = Success tbl \<longrightarrow> bytes_of_elf64_section_header_table e tbl = bs0"
  using assms proof(cases bs0, erule forw_subst)
    fix xs
    show "read_elf64_section_header_table' e (Sequence xs) = Success tbl \<longrightarrow>
            bytes_of_elf64_section_header_table e tbl = Sequence xs"
    proof(induct xs arbitrary: e tbl rule: measure_induct_rule[where f="List.length"])
      fix x :: "(8 word) list"
      fix e tbl
      assume IH: "(\<And>y e tbl.
           List.length y < List.length x \<Longrightarrow>
           read_elf64_section_header_table' e (Sequence y) = Success tbl \<longrightarrow>
           bytes_of_elf64_section_header_table e tbl = Sequence y)"
      show "read_elf64_section_header_table' e (Sequence x) = Success tbl \<longrightarrow>
       bytes_of_elf64_section_header_table e tbl = Sequence x"
      proof(rule impI)
        assume "read_elf64_section_header_table' e (Sequence x) = Success tbl"
        hence *: "(if Byte_sequence.length (Sequence x) = 0 then error_return []
                else read_elf64_section_header_table_entry e
                  (Sequence x) >>=(\<lambda>(entry, bs1).
                    read_elf64_section_header_table' e bs1>>=
                      (\<lambda>tail. error_return (entry # tail)))) = Success tbl" using read_elf64_section_header_table'.simps by auto
        thus "bytes_of_elf64_section_header_table e tbl = Sequence x"
        proof(cases "length (Sequence x) = 0")
          assume L: "length (Sequence x) = 0"
          hence "error_return [] = Success tbl" using * by auto
          hence "[] = tbl" using error_return_def error.simps by metis
          thus "bytes_of_elf64_section_header_table e tbl = Sequence x" using bytes_of_elf64_section_header_table_def length_empty[OF L] by simp
        next
          assume L: "length (Sequence x) \<noteq> 0"
          hence "read_elf64_section_header_table_entry e (Sequence x) >>= (\<lambda>(entry, bs1).
                 read_elf64_section_header_table' e bs1 >>= (\<lambda>tail. error_return (entry # tail))) = Success tbl" using * by auto
          from this obtain entry' bs1' where "read_elf64_section_header_table_entry e (Sequence x) = Success (entry', Sequence bs1') \<and> (read_elf64_section_header_table' e (Sequence bs1') >>= (\<lambda>tail. error_return (entry' # tail)) = Success tbl)" using prod_cases error_bind_Success byte_sequence.induct sorry
          hence "read_elf64_section_header_table_entry e (Sequence x) = Success (entry', Sequence bs1')" by simp
          hence "List.length bs1' < List.length x" sorry
          oops

  section {* The main roundtripping theorems *}

  subsection {* Out-in *}

  theorem elf32_out_in_roundtrip:
    fixes ef32 :: "elf32_file" and bs :: "byte_sequence"
    assumes "bytes_of_elf32_file ef32 = Success bs"
    shows "read_elf32_file bs = Success ef64"
  sorry

  theorem elf64_out_in_roundtrip:
    fixes ef64 :: "elf64_file" and bs :: "byte_sequence"
    assumes "bytes_of_elf64_file ef64 = Success bs"
    shows "read_elf64_file bs = Success ef64"
  sorry

  subsection {* In-out *}

  theorem elf32_in_out_roundtrip:
    fixes ef32 :: "elf32_file" and bs :: "byte_sequence"
    assumes "read_elf32_file bs = Success ef32"
    shows "bytes_of_elf32_file ef32 = Success bs"
  sorry

  lemma read_elf64_header_in_out_roundtrip:
    assumes "read_elf64_header (Sequence bs0) = Success (hdr, Sequence bs1)"
    assumes "bytes_of_elf64_header hdr = Sequence bs2"
    shows "bs0 = bs2@bs1"
  sorry

  lemma obtain_elf64_program_header_table_compositional:
    "obtain_elf64_program_header_table hdr (Sequence bs0) = Success pht \<longrightarrow>
      (\<exists>entry bs1 pht'.
       let endianness = get_elf64_header_endiannness hdr in
       let hdr' = hdr\<lparr> elf64_phoff := elf64_word_of_nat (unat (elf64_phoff hdr) + unat (elf64_phentsize hdr)) \<rparr>
                     \<lparr> elf64_phnum := elf64_half_of_nat (unat (elf64_phnum hdr) - 1) \<rparr> in
        read_elf64_program_header_table_entry endianness (Sequence bs0) = Success (entry, bs1) \<and>
        obtain_elf64_program_header_table hdr' bs1 = Success pht' \<and>
        pht = entry # pht' \<and> Sequence bs0 = concat_byte_sequence [(bytes_of_elf64_program_header_entry endianness entry), bs1])"
  sorry

  thm measure_induct[where P="\<lambda>bs0. obtain_elf64_program_header_table hdr (Sequence bs0) = Success pht \<longrightarrow>
            bytes_of_elf64_program_header_table e pht = Sequence bs1 \<longrightarrow> bs0 = bs1 @ List.drop (List.length bs1) bs0" and f="List.length"]

  lemma obtain_elf64_program_header_table_in_out_roundtrip:
    shows "obtain_elf64_program_header_table hdr (Sequence bs0) = Success pht \<longrightarrow>
            bytes_of_elf64_program_header_table e pht = Sequence bs1 \<longrightarrow> bs0 = bs1 @ List.drop (List.length bs1) bs0"
  apply(rule measure_induct[where P="\<lambda>bs0. obtain_elf64_program_header_table hdr (Sequence bs0) = Success pht \<longrightarrow>
            bytes_of_elf64_program_header_table e pht = Sequence bs1 \<longrightarrow> bs0 = bs1 @ List.drop (List.length bs1) bs0" and f="List.length"])




  apply(simp only: bytes_of_elf64_program_header_table_def)
  apply(auto simp add: concat_byte_sequence.simps)
  apply(simp only: bytes_of_elf64_program_header_table_def)
  apply(auto simp add: concat_byte_sequence.simps)
  apply(simp only: obtain_elf64_program_header_table_def)
  apply(simp only: get_elf64_header_endianness_def deduce_endianness_def)
  apply(simp only: Suc_lemmas)
  apply(simp add: Elf_Types_Local.index.simps)
  apply(case_tac "unat elf64_phnum", simp_all)
  apply(auto simp add: error_fail_def error.simps)
  apply(case_tac "unat elf64_phentsize", simp_all)
  apply(auto simp add: error_fail_def error.simps)
  apply(simp only: offset_and_cut_def)
  apply(case_tac "unat elf64_phoff", simp_all)

  lemma error_bind_Success2:
    assumes "\<exists>x. f = Success x \<and> g x = Success y"
    shows "f >>= g = Success y"
  using assms
  by(auto simp add: error_bind.simps)

  theorem elf64_in_out_roundtrip:
    fixes ef64 :: "elf64_file" and bs :: "byte_sequence"
    assumes "read_elf64_file bs = Success ef64"
    shows "bytes_of_elf64_file ef64 = Success bs"
  using assms

end
