theory
  Elf_Types_Local
imports
  Main "$ISABELLE_HOME/src/HOL/Word/Word" "$ISABELLE_HOME/src/HOL/Library/Option_ord"
  "../../../lem/isabelle-lib/Lem_basic_classes"
  "Error"
begin

  section {* Unsigned character type *}

  type_synonym unsigned_char = "8 word"
  type_synonym byte          = "8 word"

  definition char_of_unsigned_char :: "unsigned_char \<Rightarrow> char" where
    "char_of_unsigned_char w \<equiv> String.char_of_nat (unat w)"

  definition unsigned_char_of_nat :: "nat \<Rightarrow> unsigned_char" where
    "unsigned_char_of_nat n \<equiv> of_int (int n)"

  definition string_of_unsigned_char :: "unsigned_char \<Rightarrow> string" where
    "string_of_unsigned_char u \<equiv> LemExtraDefs.nat_to_string (unat u)"

  definition unsigned_char_of_char :: "char \<Rightarrow> unsigned_char" where
    "unsigned_char_of_char c \<equiv> unsigned_char_of_nat (String.nat_of_char c)"

  definition unsigned_char_land :: "unsigned_char \<Rightarrow> unsigned_char \<Rightarrow> unsigned_char" where
    "unsigned_char_land left right \<equiv> bitAND left right"

  definition unsigned_char_lor :: "unsigned_char \<Rightarrow> unsigned_char \<Rightarrow> unsigned_char" where
    "unsigned_char_lor left right \<equiv> bitOR left right"

  definition unsigned_char_lshift :: "unsigned_char \<Rightarrow> nat \<Rightarrow> unsigned_char" where
    "unsigned_char_lshift c shift \<equiv> (shiftl1 ^^ shift) c"

  definition unsigned_char_rshift :: "unsigned_char \<Rightarrow> nat \<Rightarrow> unsigned_char" where
    "unsigned_char_rshift c shift \<equiv> (shiftr1 ^^ shift) c"

  definition unsigned_char_plus :: "unsigned_char \<Rightarrow> unsigned_char \<Rightarrow> unsigned_char" where
    "unsigned_char_plus left right \<equiv> of_int (uint left + uint right)"

  section {* 16-bit unsigned type *}

  type_synonym uint16 = "16 word"

  definition uint16_of_nat :: "nat \<Rightarrow> uint16" where
    "uint16_of_nat n \<equiv> of_int (int n)"

  definition uint16_of_dual :: "byte \<Rightarrow> byte \<Rightarrow> uint16" where
    "uint16_of_dual u1 u2 \<equiv> Word.word_cat u1 u2"

  definition string_of_uint16 :: "uint16 \<Rightarrow> string" where
    "string_of_uint16 u \<equiv> LemExtraDefs.nat_to_string (unat u)"

  definition dual_of_uint16 :: "uint16 \<Rightarrow> (byte \<times> byte)" where
    "dual_of_uint16 u \<equiv> Word.word_split u"

  definition uint16_land :: "uint16 \<Rightarrow> uint16 \<Rightarrow> uint16" where
    "uint16_land left right \<equiv> bitAND left right"

  definition uint16_lor :: "uint16 \<Rightarrow> uint16 \<Rightarrow> uint16" where
    "uint16_lor left right \<equiv> bitOR left right"

  definition uint16_plus :: "uint16 \<Rightarrow> uint16 \<Rightarrow> uint16" where
    "uint16_plus left right \<equiv> of_int (uint left + uint right)"

  definition uint16_lshift :: "uint16 \<Rightarrow> nat \<Rightarrow> uint16" where
    "uint16_lshift u shift \<equiv> (shiftl1 ^^ shift) u"

  definition uint16_rshift :: "uint16 \<Rightarrow> nat \<Rightarrow> uint16" where
    "uint16_rshift u shift \<equiv> (shiftr1 ^^ shift) u"

  section {* 32-bit unsigned type *}

  type_synonym uint32 = "32 word"

  definition uint32_of_nat :: "nat \<Rightarrow> uint32" where
    "uint32_of_nat n \<equiv> of_int (int n)"

  definition uint32_of_quad :: "byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> uint32" where
    "uint32_of_quad u1 u2 u3 u4 \<equiv>
      (let (upper :: 16 word) = Word.word_cat u1 u2 in
       let (lower :: 16 word) = Word.word_cat u3 u4 in
         Word.word_cat upper lower)"

  definition string_of_uint32 :: "uint32 \<Rightarrow> string" where
    "string_of_uint32 u \<equiv> LemExtraDefs.nat_to_string (unat u)"

  definition quad_of_uint32 :: "uint32 \<Rightarrow> (byte \<times> byte \<times> byte \<times> byte)" where
    "quad_of_uint32 u \<equiv>
       (let (upper :: 16 word, lower :: 16 word) = Word.word_split u in
        let (upperu :: 8 word, upperl :: 8 word) = Word.word_split upper in
        let (loweru :: 8 word, lowerl :: 8 word) = Word.word_split lower in
          (upperu, upperl, loweru, lowerl))"

  definition uint32_land :: "uint32 \<Rightarrow> uint32 \<Rightarrow> uint32" where
    "uint32_land left right \<equiv> bitAND left right"

  definition uint32_lor :: "uint32 \<Rightarrow> uint32 \<Rightarrow> uint32" where
    "uint32_lor left right \<equiv> bitOR left right"

  definition uint32_plus :: "uint32 \<Rightarrow> uint32 \<Rightarrow> uint32" where
    "uint32_plus left right \<equiv> of_int (uint left + uint right)"

  definition uint32_lshift :: "uint32 \<Rightarrow> nat \<Rightarrow> uint32" where
    "uint32_lshift u shift \<equiv> (shiftl1 ^^ shift) u"

  definition uint32_rshift :: "uint32 \<Rightarrow> nat \<Rightarrow> uint32" where
    "uint32_rshift u shift \<equiv> (shiftr1 ^^ shift) u"

  section {* 64-bit unsigned types *}

  type_synonym uint64 = "64 word"

  definition oct_of_uint64 :: "uint64 \<Rightarrow> (byte \<times> byte \<times> byte \<times> byte \<times> byte \<times> byte \<times> byte \<times> byte)" where
    "oct_of_uint64 u \<equiv>
      (let (upper :: 32 word, lower :: 32 word) = word_split u in
       let (upperu :: 16 word, upperl :: 16 word) = word_split upper in
       let (loweru :: 16 word, lowerl :: 16 word) = word_split lower in
       let (upperuu :: 8 word, upperul :: 8 word) = word_split upperu in
       let (upperlu :: 8 word, upperll :: 8 word) = word_split upperl in
       let (loweruu :: 8 word, lowerul :: 8 word) = word_split loweru in
       let (lowerlu :: 8 word, lowerll :: 8 word) = word_split lowerl in
        (upperuu, upperul, upperlu, upperll, loweruu, lowerul, lowerlu, lowerll))"

  definition uint64_of_oct :: "byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> uint64" where
    "uint64_of_oct b1 b2 b3 b4 b5 b6 b7 b8 =
      (let (upper :: 32 word) = word_cat ((word_cat b1 b2) :: 16 word) ((word_cat b3 b4) :: 16 word) in
       let (lower :: 32 word) = word_cat ((word_cat b5 b6) :: 16 word) ((word_cat b7 b8) :: 16 word) in
         word_cat upper lower)"

  definition string_of_uint64 :: "uint64 \<Rightarrow> string" where
    "string_of_uint64 u \<equiv> LemExtraDefs.nat_to_string (unat u)"

  definition uint64_of_nat :: "nat \<Rightarrow> uint64" where
    "uint64_of_nat n = of_int (int n)"

  definition uint64_land :: "uint64 \<Rightarrow> uint64 \<Rightarrow> uint64" where
    "uint64_land left right \<equiv> bitAND left right"

  definition uint64_lor :: "uint64 \<Rightarrow> uint64 \<Rightarrow> uint64" where
    "uint64_lor left right \<equiv> bitOR left right"

  definition uint64_lxor :: "uint64 \<Rightarrow> uint64 \<Rightarrow> uint64" where
    "uint64_lxor left right \<equiv> bitXOR left right"

  definition uint64_plus :: "uint64 \<Rightarrow> uint64 \<Rightarrow> uint64" where
    "uint64_plus left right \<equiv> of_int (uint left + uint right)"

  definition uint64_lshift :: "uint64 \<Rightarrow> nat \<Rightarrow> uint64" where
    "uint64_lshift u shift = (shiftl1 ^^ shift) u"

  definition uint64_rshift :: "uint64 \<Rightarrow> nat \<Rightarrow> uint64" where
    "uint64_rshift u shift \<equiv> (shiftr1 ^^ shift) u"

  section {* Signed 32-bit integers *}

  type_synonym sint32 = "32 word"

  definition sint32_of_int :: "int \<Rightarrow> sint32" where
    "sint32_of_int s \<equiv> of_int s"

  definition int_of_sint32 :: "sint32 \<Rightarrow> int" where
    "int_of_sint32 s \<equiv> sint s"

  definition string_of_sint32 :: "sint32 \<Rightarrow> string" where
    "string_of_sint32 u \<equiv> LemExtraDefs.int_to_string (sint u)"

  definition quad_of_sint32 :: "sint32 \<Rightarrow> (byte \<times> byte \<times> byte \<times> byte)" where
    "quad_of_sint32 s \<equiv>
       (let (upper :: 16 word, lower :: 16 word) = Word.word_split s in
        let (upperu :: 8 word, upperl :: 8 word) = Word.word_split upper in
        let (loweru :: 8 word, lowerl :: 8 word) = Word.word_split lower in
          (upperu, upperl, loweru, lowerl))"

  definition sint32_of_quad :: "byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> sint32" where
    "sint32_of_quad b1 b2 b3 b4 \<equiv>
      (let (upper :: 16 word) = Word.word_cat b1 b2 in
       let (lower :: 16 word) = Word.word_cat b3 b4 in
         Word.word_cat upper lower)"

  section {* Signed 64-bit integers *}

  type_synonym sint64 = "64 word"

  definition sint64_of_int :: "int \<Rightarrow> sint64" where
    "sint64_of_int s = of_int s"

  definition int_of_sint64 :: "sint64 \<Rightarrow> int" where
    "int_of_sint64 s = sint s"

  definition string_of_sint64 :: "sint64 \<Rightarrow> string" where
    "string_of_sint64 u \<equiv> LemExtraDefs.int_to_string (sint u)"

  definition sint64_plus :: "sint64 \<Rightarrow> sint64 \<Rightarrow> sint64" where
    "sint64_plus left right \<equiv> of_int (sint left + sint right)"

  definition sint64_lshift :: "sint64 \<Rightarrow> nat \<Rightarrow> sint64" where
    "sint64_lshift s shift \<equiv> (shiftl1 ^^ shift) s"

  definition sint64_rshift :: "sint64 \<Rightarrow> nat \<Rightarrow> sint64" where
    "sint64_rshift s shift \<equiv> (shiftr1 ^^ shift) s"

  definition sint64_land :: "sint64 \<Rightarrow> sint64 \<Rightarrow> sint64" where
    "sint64_land left right \<equiv> bitAND left right"

  definition sint64_lor :: "sint64 \<Rightarrow> sint64 \<Rightarrow> sint64" where
    "sint64_lor left right \<equiv> bitOR left right"

  definition sint64_of_oct :: "byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> sint64" where
    "sint64_of_oct b1 b2 b3 b4 b5 b6 b7 b8 \<equiv>
      (let (upper :: 32 word) = word_cat ((word_cat b1 b2) :: 16 word) ((word_cat b3 b4) :: 16 word) in
       let (lower :: 32 word) = word_cat ((word_cat b5 b6) :: 16 word) ((word_cat b7 b8) :: 16 word) in
         word_cat upper lower)"

  definition oct_of_sint64 :: "sint64 \<Rightarrow> (byte \<times> byte \<times> byte \<times> byte \<times> byte \<times> byte \<times> byte \<times> byte)" where
    "oct_of_sint64 s \<equiv>
      (let (upper :: 32 word, lower :: 32 word) = word_split s in
       let (upperu :: 16 word, upperl :: 16 word) = word_split upper in
       let (loweru :: 16 word, lowerl :: 16 word) = word_split lower in
       let (upperuu :: 8 word, upperul :: 8 word) = word_split upperu in
       let (upperlu :: 8 word, upperll :: 8 word) = word_split upperl in
       let (loweruu :: 8 word, lowerul :: 8 word) = word_split loweru in
       let (lowerlu :: 8 word, lowerll :: 8 word) = word_split lowerl in
        (upperuu, upperul, upperlu, upperll, loweruu, lowerul, lowerlu, lowerll))"

  section {* Miscellaneous operations *}

  definition find_min_element :: "'a::{wellorder} set \<Rightarrow> 'a option" where
    "find_min_element S \<equiv>
       if S = {} then
         None
       else Some (LEAST x. x \<in> S)"

  fun split_string_on_char0 :: "string \<Rightarrow> char \<Rightarrow> string \<Rightarrow> string list" where
    "split_string_on_char0 []     c buffer = [buffer]"
  | "split_string_on_char0 (x#xs) c buffer =
       (if c = x then
          buffer#(split_string_on_char0 xs c [])
        else
          split_string_on_char0 xs c (buffer @ [x]))"

  definition split_string_on_char :: "string \<Rightarrow> char \<Rightarrow> string list" where
    "split_string_on_char s c \<equiv> split_string_on_char0 s c []"

  fun string_suffix :: "nat \<Rightarrow> string \<Rightarrow> string option" where
    "string_suffix 0       s      = Some s"
  | "string_suffix (Suc m) []     = None"
  | "string_suffix (Suc m) (x#xs) =
       (case string_suffix m xs of
          None      \<Rightarrow> None
        | Some tail \<Rightarrow> Some (x#tail))"

  fun index :: "'a list \<Rightarrow> nat \<Rightarrow> 'a option" where
    "index (x#xs) 0       = Some x"
  | "index (x#xs) (Suc m) = index xs m"
  | "index _      _       = None"

  section {* Sorting *}

  fun merge :: "('a \<Rightarrow> 'a \<Rightarrow> ordering) \<Rightarrow> 'a list \<Rightarrow> 'a list \<Rightarrow> 'a list" where
    "merge ord [] ys = ys"
  | "merge ord xs [] = xs"
  | "merge ord (x#xs) (y#ys) =
       (if ord x y = LT then
          x#merge ord xs (y#ys)
        else
          y#merge ord (x#xs) ys)"

  fun merge_sort :: "('a \<Rightarrow> 'a \<Rightarrow> ordering) \<Rightarrow> 'a list \<Rightarrow> 'a list" where
    "merge_sort ord [] = []"
  | "merge_sort ord [x] = [x]"
  | "merge_sort ord xs =
       (let left = List.take (List.length xs div 2) xs in
        let right = List.drop (List.length xs div 2) xs in
          merge ord (merge_sort ord left) (merge_sort ord right))"

  definition ord_correct :: "('a \<Rightarrow> 'a \<Rightarrow> ordering) \<Rightarrow> bool" where
    "ord_correct ord \<equiv>
       (\<forall>x y. ord x y = EQ \<longleftrightarrow> x = y) \<and>
       (\<forall>x y z. ord x y = LT \<and> ord y z = LT \<longrightarrow> ord x z = LT)"

  lemma merge_elems:
    fixes x :: "'a" and xs ys :: "'a list" and ord :: "'a \<Rightarrow> 'a \<Rightarrow> ordering"
    shows "x \<in> set xs \<union> set ys \<longrightarrow> x \<in> set (merge ord xs ys)"
  proof(rule merge.induct[where P="\<lambda>ord xs ys. x \<in> set xs \<union> set ys \<longrightarrow> x \<in> set (merge ord xs ys)"])
    fix ord ys
    show "x \<in> set [] \<union> set ys \<longrightarrow> x \<in> set (merge ord [] ys)"
    proof
      assume "x \<in> set [] \<union> set ys"
      hence "x \<in> set ys" by auto
      thus "x \<in> set (merge ord [] ys)" using merge.simps by simp
    qed
  next
    fix ord x' xs
    show "x \<in> set (x'#xs) \<union> set [] \<longrightarrow> x \<in> set (merge ord (x'#xs) [])"
    proof
      assume "x \<in> set (x'#xs) \<union> set []"
      hence "x \<in> set (x'#xs)" by auto
      thus "x \<in> set (merge ord (x'#xs) [])" by simp
    qed
  next
    fix ord x' xs y' ys
    assume IHLeft: "(ord x' y' = LT \<Longrightarrow>
        x \<in> set xs \<union> set (y' # ys) \<longrightarrow> x \<in> set (merge ord xs (y' # ys)))"
    assume IHRight: "(ord x' y' \<noteq> LT \<Longrightarrow>
        x \<in> set (x' # xs) \<union> set ys \<longrightarrow> x \<in> set (merge ord (x' # xs) ys))"
    show "x \<in> set (x' # xs) \<union> set (y' # ys) \<longrightarrow> x \<in> set (merge ord (x' # xs) (y' # ys))"
    proof
      assume S: "x \<in> set (x'#xs) \<union> set (y'#ys)"
      show "x \<in> set (merge ord (x'#xs) (y'#ys))"
        proof(cases "ord x' y' = LT")
          assume *: "ord x' y' = LT"
          show ?thesis
            apply(simp add: * merge.simps)
            apply(rule UnE[OF S])
            apply simp
            apply(erule disjE)
            apply simp
            apply(rule disjI2)
            apply(rule IHLeft[OF *, rule_format])
            apply simp
            apply(rule disjI2)
            apply(rule IHLeft[OF *, rule_format])
            apply auto
        done
      next
        assume *: "ord x' y' \<noteq> LT"
        show ?thesis
          apply(simp add: merge.simps *)
          apply(rule UnE[OF S])
          apply simp
          apply(erule disjE)
          apply(rule disjI2)
          apply(rule IHRight[OF *, rule_format])
          apply simp
          apply(rule disjI2)
          apply(rule IHRight[OF *, rule_format])
          apply simp
          apply simp
          apply(erule disjE)
          apply simp
          apply(rule disjI2)
          apply(rule IHRight[OF *, rule_format])
          apply auto
      done
      qed
    qed
  qed

  inductive ordered :: "('a \<Rightarrow> 'a \<Rightarrow> ordering) \<Rightarrow> 'a list \<Rightarrow> bool" where
    ordered_Nil [intro!]: "ordered ord []"
  | ordered_Singleton [intro!]: "ordered ord [x]"
  | ordered_Cons [intro!]: "\<lbrakk> ord x y = LT; ordered ord (y#xs) \<rbrakk> \<Longrightarrow> ordered ord (x#y#xs)"

  fun not_in_range :: "nat \<Rightarrow> (nat \<times> nat) \<Rightarrow> bool" where
    "not_in_range e (x, y) = (e < x \<or> y < e)"

  fun in_range :: "nat \<Rightarrow> (nat \<times> nat) \<Rightarrow> bool" where
    "in_range e (x, y) = (e \<le> x \<and> e \<le> y)"

  definition find_first_not_in_range :: "nat \<Rightarrow> (nat \<times> nat) list \<Rightarrow> nat" where
    "find_first_not_in_range start ranges \<equiv>
       THE x.
         start \<le> x \<and>
         (\<forall>rs \<in> set ranges. not_in_range x rs) \<and>
         (\<forall>y. (\<forall>rs \<in> set ranges. not_in_range y rs) \<longrightarrow> x \<le> y)"

  definition find_first_in_range :: "nat \<Rightarrow> (nat \<times> nat) list \<Rightarrow> nat" where
    "find_first_in_range start ranges \<equiv>
       THE x.
         start \<le> x \<and>
         (\<forall>rs \<in> set ranges. in_range x rs) \<and>
         (\<forall>y. (\<forall>rs \<in> set ranges. in_range y rs) \<longrightarrow> x \<le> y)"

  fun covers :: "nat \<times> nat \<Rightarrow> nat \<times> nat \<Rightarrow> bool" where
    "covers (x1, y1) (x2, y2) = (x1 \<le> x2 \<and> y1 \<le> y2)"

  instantiation prod :: (linorder,linorder)linorder begin

    fun less_eq_prod :: "'a \<times> 'b \<Rightarrow> 'a \<times> 'b \<Rightarrow> bool" where
      "less_eq_prod (x1,y1) (x2,y2) =
         (if x1 < x2 then
           True
         else if x1 = x2 then
           y1 \<le> y2
         else
           False)"

    fun less_prod :: "'a \<times> 'b \<Rightarrow> 'a \<times> 'b \<Rightarrow> bool" where
      "less_prod (x1,y1) (x2,y2) =
         (if x1 < x2 then
           True
         else if x1 = x2 then
           y1 < y2
         else
           False)"

    instance proof
      fix x y :: "'a \<times> 'b"
      show "x < y = (x \<le> y \<and> \<not> y \<le> x)"
        apply(cases x; cases y)
        apply auto
      done
    next
      fix x :: "'a \<times> 'b"
      show "x \<le> x"
        apply(cases x)
        apply auto
      done
    next
      fix x y z :: "'a \<times> 'b"
      assume "x \<le> y" and "y \<le> z"
      thus "x \<le> z"
        by (smt less_eq_prod.elims(2) less_eq_prod.simps less_trans order.trans)
    next
      fix x y :: "'a \<times> 'b"
      assume "x \<le> y" and "y \<le> x"
      thus "x = y"
        by (smt antisym less_asym less_eq_prod.elims(2) less_eq_prod.simps)
    next
      fix x y :: "'a \<times> 'b"
      show "x \<le> y \<or> y \<le> x"
        by (smt le_cases less_eq_prod.elims(3) less_eq_prod.simps less_linear)
    qed
  end

  definition compute_differences :: "nat \<Rightarrow> nat \<Rightarrow> (nat \<times> nat) list \<Rightarrow> ((nat \<times> nat) list) error" where
    "compute_differences start end ranges \<equiv> error_return (sorted_list_of_set { (x, y). \<forall>x. \<forall>y. start \<le> x \<and> x < y \<and> y \<le> end \<and> (\<not> (\<exists>r \<in> set ranges. covers (x, y) r)) })"

  fun well_behaved_lem_ordering :: "('a \<Rightarrow> 'a \<Rightarrow> bool) \<Rightarrow> ('a \<Rightarrow> 'a \<Rightarrow> bool) \<Rightarrow> ('a \<Rightarrow> 'a \<Rightarrow> bool) \<Rightarrow>
    ('a \<Rightarrow> 'a \<Rightarrow> ordering) \<Rightarrow> bool" where
    "well_behaved_lem_ordering lt le gt compare =
     ((\<forall>x y. gt x y \<longrightarrow> lt y x) \<and>
      (\<forall>x y. lt x y \<longrightarrow> gt y x) \<and>
      (\<forall>x y. gt x y \<or> lt x y \<or> x = y) \<and>
      (\<forall>x y. x = y \<longrightarrow> \<not> lt x y) \<and>
      (\<forall>x y. x = y \<longrightarrow> \<not> gt x y) \<and>
      (\<forall>x y. lt x y \<longrightarrow> \<not> gt x y) \<and>  
      (\<forall>x y. gt x y \<longrightarrow> \<not> lt x y) \<and>
      (\<forall>x y. gt x y \<longrightarrow> x \<noteq> y) \<and>
      (\<forall>x y. lt x y \<longrightarrow> x \<noteq> y) \<and>
      (\<forall>x y. le x y \<longrightarrow> x = y \<or> lt x y) \<and>
      (\<forall>x y. x = y \<longrightarrow> le x y) \<and>
      (\<forall>x y. lt x y \<longrightarrow> le x y) \<and>
      (\<forall>x y. compare x y = LT \<longrightarrow> compare y x = GT) \<and>
      (\<forall>x y. compare x y = GT \<longrightarrow> compare y x = LT) \<and>
      (\<forall>x y. compare x y = EQ \<longleftrightarrow> x = y))"

  declare well_behaved_lem_ordering.simps [simp del]

  lemma lem_ordering_tri:
    assumes "well_behaved_lem_ordering lt le gt cmp"
    shows "gt x y \<or> lt x y \<or> x = y"
  using assms well_behaved_lem_ordering.elims(2) by blast
  
  lemma lem_ordering_gt:
    assumes "well_behaved_lem_ordering lt le gt cmp"
    shows "gt x y \<Longrightarrow> lt y x"
  using assms well_behaved_lem_ordering.elims(2) by blast

  lemma lem_ordering_lt:
    assumes "well_behaved_lem_ordering lt le gt cmp"
    shows "lt x y \<Longrightarrow> gt y x"
  using assms well_behaved_lem_ordering.elims(2) by blast

  lemma lem_ordering_not_gt:
    assumes "well_behaved_lem_ordering lt le gt cmp"
    shows "x = y \<Longrightarrow> \<not> gt x y"
  using assms well_behaved_lem_ordering.elims(2) by blast

  lemma lem_ordering_not_lt:
    assumes "well_behaved_lem_ordering lt le gt cmp"
    and "lt e1 e2"
    shows "\<not> lt e2 e1"
  using assms unfolding well_behaved_lem_ordering.simps by meson

  lemma lem_ordering_le:
    assumes "well_behaved_lem_ordering lt le gt cmp"
    and "le x y"
    shows "x = y \<or> lt x y"
  using assms well_behaved_lem_ordering.elims(2) by blast

end