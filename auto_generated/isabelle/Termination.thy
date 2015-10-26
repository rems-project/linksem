theory Termination imports Main Import_everything begin

lemma offset_and_cut_length [simp]:
  assumes "offset_and_cut off len bs0 = Success bs1"
  shows "length0 bs1 = len"
sorry

lemma partition_with_length_length [simp]:
  assumes "partition_with_length off len bs0 = Success (bs1, bs2)"
  shows "length0 bs1 = off \<and> length0 bs2 = len"
sorry

lemma read_archive_entry_header_length [simp]:
  assumes "read_archive_entry_header len bs = Success (hdr, sz, bs1)"
  shows "Byte_sequence.length0 bs1 < Byte_sequence.length0 bs"
using assms unfolding read_archive_entry_header_def
  sorry

lemma dropbytes_length:
  fixes len :: "nat" and bs bs1 :: "byte_sequence"
  assumes "0 < len" and "dropbytes len bs = Success bs1"
  shows "length0 bs1 < length0 bs"
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

lemma error_bind_cong [fundef_cong, simp]:
  assumes "map_error f1 s1 = map_error f2 s2"
  shows "error_bind s1 f1 = error_bind s2 f2"
using assms
  by(cases s1; cases s2) (auto simp add: error_bind.simps)

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

section {* Termination *}

termination accum_archive_contents
  sorry

termination repeat
  apply(relation "measure (\<lambda>(l,_). l)")
  apply auto
done

termination concat_byte_sequence
  apply lexicographic_order
done

termination dropbytes
  apply(relation "measure (\<lambda>(l,_). l)")
  apply(auto simp add: naturalZero_def)
done

termination obtain_elf32_dynamic_section_contents'
  sorry

termination obtain_elf64_dynamic_section_contents'
  sorry

termination find_first_not_in_range
  sorry

termination find_first_in_range
  sorry

termination compute_differences
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

termination list_take_with_accum
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