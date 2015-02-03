theory
  Elf_Types_Local
imports
  Main "$ISABELLE_HOME/src/HOL/Word/Word"
begin

  section {* Unsigned character type *}

  type_synonym unsigned_char = "8 word"
  type_synonym byte          = "8 word"

  definition char_of_unsigned_char :: "unsigned_char \<Rightarrow> char" where
    "char_of_unsigned_char w \<equiv> String.char_of_nat (unat w)"

  declare char_of_unsigned_char_def [simp]

  definition unsigned_char_of_nat :: "nat \<Rightarrow> unsigned_char" where
    "unsigned_char_of_nat n \<equiv> of_int (int n)"

  declare unsigned_char_of_nat_def [simp]

  definition unsigned_char_land :: "unsigned_char \<Rightarrow> unsigned_char \<Rightarrow> unsigned_char" where
    "unsigned_char_land left right \<equiv> bitAND left right"

  declare unsigned_char_land_def [simp]

  definition unsigned_char_lor :: "unsigned_char \<Rightarrow> unsigned_char \<Rightarrow> unsigned_char" where
    "unsigned_char_lor left right \<equiv> bitOR left right"

  declare unsigned_char_lor_def [simp]

  definition unsigned_char_lshift :: "unsigned_char \<Rightarrow> nat \<Rightarrow> unsigned_char" where
    "unsigned_char_lshift c shift \<equiv> (shiftl1 ^^ shift) c"

  declare unsigned_char_lshift_def [simp]

  definition unsigned_char_rshift :: "unsigned_char \<Rightarrow> nat \<Rightarrow> unsigned_char" where
    "unsigned_char_rshift c shift \<equiv> (shiftr1 ^^ shift) c"

  declare unsigned_char_rshift_def [simp]

  definition unsigned_char_plus :: "unsigned_char \<Rightarrow> unsigned_char \<Rightarrow> unsigned_char" where
    "unsigned_char_plus left right \<equiv> of_int (uint left + uint right)"

  declare unsigned_char_plus_def [simp]

  section {* 32-bit unsigned type *}

  type_synonym uint32 = "32 word"

  definition uint32_of_nat :: "nat \<Rightarrow> uint32" where
    "uint32_of_nat n \<equiv> of_int (int n)"

  declare uint32_of_nat_def [simp]

  fun uint32_of_quad :: "byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> uint32" where
    "uint32_of_quad u1 u2 u3 u4 = undefined"

  definition quad_of_uint32 :: "uint32 \<Rightarrow> (byte \<times> byte \<times> byte \<times> byte)" where
    "quad_of_uint32 u \<equiv> undefined"

  declare quad_of_uint32_def [simp]

  definition uint32_land :: "uint32 \<Rightarrow> uint32 \<Rightarrow> uint32" where
    "uint32_land left right \<equiv> bitAND left right"

  declare uint32_land_def [simp]

  definition uint32_lor :: "uint32 \<Rightarrow> uint32 \<Rightarrow> uint32" where
    "uint32_lor left right \<equiv> bitOR left right"

  declare uint32_lor_def [simp]

  definition uint32_plus :: "uint32 \<Rightarrow> uint32 \<Rightarrow> uint32" where
    "uint32_plus left right \<equiv> of_int (uint left + uint right)"

  declare uint32_plus_def [simp]

  definition uint32_lshift :: "uint32 \<Rightarrow> nat \<Rightarrow> uint32" where
    "uint32_lshift u shift \<equiv> (shiftl1 ^^ shift) u"

  declare uint32_lshift_def [simp]

  definition uint32_rshift :: "uint32 \<Rightarrow> nat \<Rightarrow> uint32" where
    "uint32_rshift u shift \<equiv> (shiftr1 ^^ shift) u"

  declare uint32_rshift_def [simp]

  section {* 64-bit unsigned types *}

  type_synonym uint64 = "64 word"

  definition oct_of_uint64 :: "uint64 \<Rightarrow> (byte \<times> byte \<times> byte \<times> byte \<times> byte \<times> byte \<times> byte \<times> byte)" where
    "oct_of_uint64 u \<equiv> undefined"

  declare oct_of_uint64_def [simp]

  definition uint64_of_oct :: "byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> uint64" where
    "uint64_of_oct b1 b2 b3 b4 b5 b6 b7 b8 = undefined"

  definition uint64_of_nat :: "nat \<Rightarrow> uint64" where
    "uint64_of_nat n = of_int (int n)"

  declare uint64_of_nat_def [simp]

  definition uint64_land :: "uint64 \<Rightarrow> uint64 \<Rightarrow> uint64" where
    "uint64_land left right \<equiv> bitAND left right"

  declare uint64_land_def [simp]

  definition uint64_lor :: "uint64 \<Rightarrow> uint64 \<Rightarrow> uint64" where
    "uint64_lor left right \<equiv> bitOR left right"

  declare uint64_lor_def [simp]

  definition uint64_plus :: "uint64 \<Rightarrow> uint64 \<Rightarrow> uint64" where
    "uint64_plus left right \<equiv> of_int (uint left + uint right)"

  declare uint64_plus_def [simp]

  definition uint64_lshift :: "uint64 \<Rightarrow> nat \<Rightarrow> uint64" where
    "uint64_lshift u shift = (shiftl1 ^^ shift) u"

  declare uint64_lshift_def [simp]

  definition uint64_rshift :: "uint64 \<Rightarrow> nat \<Rightarrow> uint64" where
    "uint64_rshift u shift \<equiv> (shiftr1 ^^ shift) u"

  declare uint64_rshift_def [simp]

  section {* Signed 32-bit integers *}

  type_synonym sint32 = "32 word"

  definition sint32_of_int :: "int \<Rightarrow> sint32" where
    "sint32_of_int s \<equiv> of_int s"

  definition int_of_sint32 :: "sint32 \<Rightarrow> int" where
    "int_of_sint32 s \<equiv> sint s"

  definition quad_of_sint32 :: "sint32 \<Rightarrow> (byte \<times> byte \<times> byte \<times> byte)" where
    "quad_of_sint32 s \<equiv> undefined"

  definition sint32_of_quad :: "byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> sint32" where
    "sint32_of_quad b1 b2 b3 b4 \<equiv> undefined"

  section {* Signed 64-bit integers *}

  type_synonym sint64 = "64 word"

  definition sint64_of_int :: "int \<Rightarrow> sint64" where
    "sint64_of_int s = of_int s"

  declare sint64_of_int_def [simp]

  definition int_of_sint64 :: "sint64 \<Rightarrow> int" where
    "int_of_sint64 s = sint s"

  declare int_of_sint64_def [simp]

  definition sint64_plus :: "sint64 \<Rightarrow> sint64 \<Rightarrow> sint64" where
    "sint64_plus left right \<equiv> of_int (sint left + sint right)"

  declare sint64_plus_def [simp]

  definition sint64_lshift :: "sint64 \<Rightarrow> nat \<Rightarrow> sint64" where
    "sint64_lshift s shift \<equiv> (shiftl1 ^^ shift) s"

  declare sint64_lshift_def [simp]

  definition sint64_rshift :: "sint64 \<Rightarrow> nat \<Rightarrow> sint64" where
    "sint64_rshift s shift \<equiv> (shiftr1 ^^ shift) s"

  declare sint64_rshift_def [simp]

  definition sint64_land :: "sint64 \<Rightarrow> sint64 \<Rightarrow> sint64" where
    "sint64_land left right \<equiv> bitAND left right"

  declare sint64_land_def [simp]

  definition sint64_lor :: "sint64 \<Rightarrow> sint64 \<Rightarrow> sint64" where
    "sint64_lor left right \<equiv> bitOR left right"

  declare sint64_lor_def [simp]

  definition sint64_of_oct :: "byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> byte \<Rightarrow> sint64" where
    "sint64_of_oct b1 b2 b3 b4 b5 b6 b7 b8 \<equiv> undefined"

  definition oct_of_sint64 :: "sint64 \<Rightarrow> (byte \<times> byte \<times> byte \<times> byte \<times> byte \<times> byte \<times> byte \<times> byte)" where
    "oct_of_sint64 s \<equiv> undefined"

  section {* Miscellaneous operations *}

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

  datatype ordering
    = Less
    | Equal
    | Greater

  fun merge :: "('a \<Rightarrow> 'a \<Rightarrow> ordering) \<Rightarrow> 'a list \<Rightarrow> 'a list \<Rightarrow> 'a list" where
    "merge ord [] ys = ys"
  | "merge ord xs [] = xs"
  | "merge ord (x#xs) (y#ys) =
       (if ord x y = Less then
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
       (\<forall>x y. ord x y = Equal \<longleftrightarrow> x = y) \<and>
       (\<forall>x y z. ord x y = Less \<and> ord y z = Less \<longrightarrow> ord x z = Less)"

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
    assume IHLeft: "(ord x' y' = Less \<Longrightarrow>
        x \<in> set xs \<union> set (y' # ys) \<longrightarrow> x \<in> set (merge ord xs (y' # ys)))"
    assume IHRight: "(ord x' y' \<noteq> Less \<Longrightarrow>
        x \<in> set (x' # xs) \<union> set ys \<longrightarrow> x \<in> set (merge ord (x' # xs) ys))"
    show "x \<in> set (x' # xs) \<union> set (y' # ys) \<longrightarrow> x \<in> set (merge ord (x' # xs) (y' # ys))"
    proof
      assume S: "x \<in> set (x'#xs) \<union> set (y'#ys)"
      show "x \<in> set (merge ord (x'#xs) (y'#ys))"
        proof(cases "ord x' y' = Less")
          assume *: "ord x' y' = Less"
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
        assume *: "ord x' y' \<noteq> Less"
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
  | ordered_Cons [intro!]: "\<lbrakk> ord x y = Less; ordered ord (y#xs) \<rbrakk> \<Longrightarrow> ordered ord (x#y#xs)"
end