theory Termination imports Main Import_everything begin

termination takebytes
  apply lexicographic_order
done

termination dropbytes
  apply(relation "measure (\<lambda>(l,_). l)")
  apply(auto simp add: naturalZero_def)
done

declare [[show_types]]

lemma dropbytes_length:
  fixes len :: "nat" and bs bs1 :: "byte_sequence"
  assumes "0 < len" and "dropbytes len bs = Success bs1"
  shows "length0 bs1 < length0 bs"
using assms proof(induct len arbitrary: bs)
  fix bs :: "byte_sequence"
  assume "0 < (0::nat)" thus "length0 bs1 < length0 bs" by simp
next
  fix len :: "nat" and bs :: "byte_sequence"
  assume IH: "(\<And>bs :: byte_sequence. (0::nat) < len \<Longrightarrow> dropbytes len bs = Success bs1 \<Longrightarrow> length0 bs1 < length0 bs)" and
    *: "0 < Suc len" and **: "dropbytes (Suc len) bs = Success bs1"
  show "length0 bs1 < length0 bs"
  proof(cases bs)
    fix xs :: "byte list"
    assume ***: "bs = Sequence xs"
    show "length0 bs1 < length0 bs"
    proof(cases xs)
      assume ****: "xs = []"
      hence "dropbytes (Suc len) bs = dropbytes (Suc len) (Sequence [])"
        using ** *** by simp
      hence "dropbytes (Suc len) bs = error_fail ''dropbytes: cannot drop more bytes than are contained in sequence''"
        using dropbytes.simps assms naturalZero_def by simp
      hence "error_fail ''dropbytes: cannot drop more bytes than are contained in sequence'' = Success bs1"
        using assms *** **** ** by simp
      hence "Fail ''dropbytes: cannot drop more bytes than are contained in sequence'' = Success bs1"
        using error_fail_def by metis
      thus "length0 bs1 < length0 bs"
        by simp
    next
      fix y :: "byte" and ys :: "byte list"
      assume ****: "xs = y#ys"
      hence "dropbytes (Suc len) bs = dropbytes (Suc len) (Sequence (y#ys))"
        using ** *** by simp
      hence "dropbytes (Suc len) bs = dropbytes len (Sequence ys)"
        using dropbytes.simps assms naturalZero_def by simp
      hence *****: "dropbytes len (Sequence ys) = Success bs1"
        using ** by simp
      show "length0 bs1 < length0 bs"
        apply(rule IH[where bs=bs])

termination list_take_with_accum
  apply lexicographic_order
done

lemma list_take_with_accum_length [simp]:
  fixes len :: "nat" and xs accum :: "'a list"
  assumes "len < length xs"
  shows "length (list_take_with_accum len accum xs) = len + length accum"
using assms proof(induction len arbitrary: accum xs)
  fix xs :: "'a list" and accum :: "'a list"
  assume "0 < length xs"
  thus "length (list_take_with_accum 0 accum xs) = 0 + length accum" by auto
next
  fix len :: "nat" and accum :: "'a list" and xs :: "'a list"
  assume IH: "(\<And>accum xs :: 'a list. len < length xs \<Longrightarrow> length (list_take_with_accum len accum xs) = len + length accum)"
    and *: "Suc len < length xs"
  show "length (list_take_with_accum (Suc len) accum xs) = Suc len + length accum"
  proof(cases xs)
    assume "xs = []"
    thus ?thesis using * by auto
  next
    fix y :: "'a" and ys :: "'a list"
    assume **: "xs = y#ys"
    hence ***: "len < length ys"
      using * by simp
    have "length (list_take_with_accum (Suc len) accum xs) = length (list_take_with_accum (Suc len) accum (y#ys))"
      using ** by auto
    moreover have "... = length (list_take_with_accum len (y#accum) ys)"
      by auto
    moreover have "... = len + length (y#accum)"
      using IH *** by simp
    ultimately show "length (list_take_with_accum (Suc len) accum xs) = Suc len + length accum"
      by auto
  qed
qed

lemma takebytes_r_with_length_inversion [simp]:
  assumes "takebytes_r_with_length cnt len bs0 = Success bs1"
  shows "len < length0 bs0"
sorry

lemma takebytes_r_with_length_length [simp]:
  assumes "takebytes_r_with_length cnt len bs0 = Success bs1"
  shows "length0 bs1 < length0 bs0"
using assms proof(cases bs0)
  fix xs :: "byte list"
  assume "bs0 = Sequence xs"
  hence "takebytes_r_with_length cnt len bs0 = takebytes_r_with_length cnt len (Sequence xs)"
    by auto
  hence "takebytes_r_with_length cnt len (Sequence xs) = Success bs1"
    using assms by auto
  hence *: "(if cnt \<le> len then error_return (Sequence (list_take_with_accum cnt [] xs)) else error_fail ''takebytes: cannot take more bytes than are contained in sequence'') = Success bs1"
    using takebytes_r_with_length.simps by auto
  show "length0 bs1 < length0 bs0"
  proof(cases "cnt \<le> len")
    assume "cnt \<le> len"
    hence "error_return (Sequence (list_take_with_accum cnt [] xs)) = Success bs1"
      using * by simp
    hence "Sequence (list_take_with_accum cnt [] xs) = bs1"
      by (simp add: error_return_def)
    hence "length0 bs1 = cnt"
      using length0.simps list_take_with_accum_length

lemma takebytes_length:
  fixes len :: "nat" and bs bs1 :: "byte_sequence"
  assumes "takebytes len bs = Success bs1"
  shows "length0 bs1 = len"
using assms
  apply(case_tac bs, simp)

lemma offset_and_cut_length [simp]:
  assumes "offset_and_cut off len bs0 = Success bs1"
  shows "length0 bs1 = len"
using assms unfolding offset_and_cut_def
  apply(case_tac "dropbytes off bs0", simp_all add: error_bind.simps)
  apply(case_tac "takebytes len x1", simp_all add: error_bind.simps error_return_def)
  apply(rule takebytes_length, assumption)
done

lemma partition_with_length_length [simp]:
  assumes "partition_with_length off len bs0 = Success (bs1, bs2)"
  shows "length0 bs1 = off \<and> length0 bs2 = len"
sorry

lemma read_archive_entry_header_length [simp]:
  assumes "read_archive_entry_header len bs = Success (hdr, sz, bs1)"
  shows "Byte_sequence.length0 bs1 < Byte_sequence.length0 bs"
using assms unfolding read_archive_entry_header_def
  sorry

lemma chooseAndSplit_card1 [simp]:
  assumes "chooseAndSplit dict s = Some (x, y)"
  shows "card x < card s"
sorry

lemma chooseAndSplit_card2 [simp]:
  assumes "chooseAndSplit dict s = Some (x, y, z)"
  shows "card z < card s"
sorry

lemma lt_technical1:
  fixes q :: nat
  assumes "0 < q"
  shows "0 < 2 * q"
using assms by auto

lemma lt_technical2:
  fixes m :: nat
  shows "0 < Suc m"
by auto

lemma error_bind_cong1 [fundef_cong]:
  assumes "map_error f1 s1 = map_error f2 s2"
  shows "error_bind s1 f1 = error_bind s2 f2"
using assms
  by(cases s1; cases s2) (auto simp add: error_bind.simps)

lemma error_bind_cong2 [fundef_cong]:
  assumes "f1 = f2" and "s1 = s2"
  shows "error_bind f1 s1 = error_bind f2 s2"
using assms by simp

lemma set_error_return [simp]:
  shows "set_error (error_return x) = {x}"
by(auto simp add: error_return_def)

lemma set_error_fail [simp]:
  shows "set_error (error_fail msg) = {}"
by(auto simp add: error_fail_def)

lemma read_elf32_dyn_cong [fundef_cong]:
  assumes "endian0 = endian1" and "bs0 = bs1" and "shared_object0 = shared_object1" and "os_additional_ranges0 = os_additional_ranges1"
     and "os0 = os1" and "proc0 = proc1"
  shows "read_elf32_dyn endian0 bs0 shared_object0 os_additional_ranges0 os0 proc0 = read_elf32_dyn endian1 bs1 shared_object1 os_additional_ranges1 os1 proc1"
using assms by simp

lemma find_first_not_in_range_cong [fundef_cong]:
  assumes "start1 = start2" and "ranges1 = ranges2"
  shows "find_first_not_in_range start1 ranges1 = find_first_not_in_range start2 ranges2"
using assms by simp

lemma find_first_in_range_cong [fundef_cong]:
  assumes "start1 = start2" and "ranges1 = ranges2"
  shows "find_first_in_range start1 ranges1 = find_first_in_range start2 ranges2"
using assms by simp

section {* Termination *}

termination accum_archive_contents
  thm accum_archive_contents.psimps
  apply(relation "measure (\<lambda>(_,_,_,b). length0 b)")
  apply auto
  apply(case_tac "size0 a mod 2", simp_all add: Let_def)
  apply(case_tac "name a = ''/               ''", simp_all)
  apply(frule read_archive_entry_header_length)
  apply(frule dropbytes_length, assumption)
  apply linarith
  apply(frule read_archive_entry_header_length)
  apply(frule dropbytes_length, assumption)
  apply linarith
  apply(frule read_archive_entry_header_length)
  apply(subgoal_tac "0 < Suc (size0 a)")
  apply(frule dropbytes_length, assumption)
  apply linarith
  apply auto
done

termination repeat
  apply(relation "measure (\<lambda>(l,_). l)")
  apply auto
done

termination concat_byte_sequence
  apply lexicographic_order
done

termination obtain_elf32_dynamic_section_contents'
thm obtain_elf32_dynamic_section_contents'.psimps
  apply(relation "measure (\<lambda>(_, b, _, _, _, _). length0 b)")
  apply simp

termination obtain_elf64_dynamic_section_contents'
  sorry

termination find_first_not_in_range
  sorry

termination find_first_in_range
  sorry

termination compute_differences
  apply(relation "measure (\<lambda>(s, m, _). m - s)")
  sorry

termination read_elf32_program_header_table'
  sorry

termination read_elf64_program_header_table'
  sorry

termination read_elf32_relocation_section'
  sorry

termination read_elf64_relocation_section'
  sorry

termination read_elf32_relocation_a_section'
  sorry

termination read_elf64_relocation_a_section'
  sorry

termination read_elf32_section_header_table'
  sorry

termination read_elf64_section_header_table'
  sorry

termination get_elf32_section_to_segment_mapping
  sorry

termination get_elf64_section_to_segment_mapping
  sorry

termination read_elf32_symbol_table
  sorry

termination read_elf64_symbol_table
  sorry

termination repeatM
  apply lexicographic_order
done

termination repeatM'
  apply lexicographic_order
done

termination mapM
  apply lexicographic_order
done

termination foldM
  apply lexicographic_order
done

termination group_elf32_words
  apply lexicographic_order
done

termination group_elf64_words
  apply lexicographic_order
done

termination read_gnu_ext_elf32_verdefs
  sorry

termination read_gnu_ext_elf64_verdefs
  sorry

termination obtain_gnu_ext_elf32_veraux
  sorry

termination obtain_gnu_ext_elf64_veraux
  sorry

termination read_gnu_ext_elf32_verneeds
  sorry

termination read_gnu_ext_elf64_verneeds
  sorry

termination read_gnu_ext_elf32_vernauxs
  sorry

termination obtain_gnu_ext_elf64_vernaux (* XXX: why the discrepancy with the function above? *)
  apply lexicographic_order
done

termination concatS'
  apply lexicographic_order
done

termination nat_range
  apply lexicographic_order
done

termination expand_sorted_ranges
  apply lexicographic_order
done

termination make_byte_pattern_revacc
  apply lexicographic_order
done

termination relax_byte_pattern_revacc
  apply lexicographic_order
done

termination byte_list_matches_pattern
  apply lexicographic_order
done

termination accum_pattern_possible_starts_in_one_byte_sequence
  apply lexicographic_order
done

termination natural_of_decimal_string_helper
  apply lexicographic_order
done

termination hex_string_of_natural
  apply lexicographic_order
done

termination merge_by
  apply lexicographic_order
done

termination mapMaybei'
  apply lexicographic_order
done

termination partitionii'
  apply lexicographic_order
done

termination intercalate'
  apply lexicographic_order
done

termination take
  apply lexicographic_order
done

termination string_index_of'
  apply lexicographic_order
done

termination find_index_helper
  apply lexicographic_order
done

termination replicate_revacc
  apply lexicographic_order
done

termination list_reverse_concat_map_helper
  apply lexicographic_order
done

termination findLowestEquiv
  apply(relation "measure (\<lambda>(_,_,_,_,_,s,_). Finite_Set.card s)")
  apply safe
  apply(frule chooseAndSplit_card1)
  apply simp
  apply(frule chooseAndSplit_card1)
  apply simp
  apply(frule chooseAndSplit_card1)
  apply simp
  apply(frule chooseAndSplit_card1)
  apply simp
  apply(frule chooseAndSplit_card2)
  apply simp
done

termination findHighestEquiv
  apply(relation "measure (\<lambda>(_,_,_,_,_,s,_). Finite_Set.card s)")
  apply safe
  apply(frule chooseAndSplit_card1)
  apply simp
  apply(frule chooseAndSplit_card1)
  apply simp
  apply(frule chooseAndSplit_card1)
  apply simp
  apply(frule chooseAndSplit_card1)
  apply simp
  apply(frule chooseAndSplit_card2)
  apply simp
done

end