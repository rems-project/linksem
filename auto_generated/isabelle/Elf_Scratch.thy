theory
  Elf_Scratch
imports
  Main
begin

  datatype order
    = Less
    | Equal
    | Greater

  locale ordered =
    fixes ord :: "'a \<Rightarrow> 'a \<Rightarrow> order"

  context ordered
  begin

    (* fst and snd components of each argument pair must have the same length *)
    fun merge :: "('a list \<times> nat list) \<Rightarrow> ('a list \<times> nat list) \<Rightarrow> ('a list \<times> nat list)" where
      "merge ([], [])         ys               = ys"
    | "merge xs               ([], [])         = xs"
    | "merge ((x#xs), (i#is)) ((y#ys), (j#js)) =
        (if ord x y = Less then
          let (xs_rec, i_rec) = merge (xs, is) ((y#ys), (j#js)) in
            (x#xs_rec, i#i_rec)
        else
          let (ys_rec, j_rec) = merge ((x#xs), (i#is)) (ys, js) in
            (y#ys_rec, j#j_rec))"

    lemma merge_length_out1:
      assumes "length (fst xs) = length (snd xs)" and "length (fst ys) = length (snd ys)"
      assumes "merge xs ys = (zs, ks)"
      shows "length zs = length ks"
    sorry

    lemma merge_length_out2:
      assumes "length (fst xs) = length (snd xs)" and "length (fst ys) = length (snd ys)"
      assumes "merge xs ys = (zs, ks)"
      shows "length (fst xs) = length ks"
    sorry

    corollary merge_length_out3:
      assumes "length (fst xs) = length (snd xs)" and "length (fst ys) = length (snd ys)"
      assumes "merge xs ys = (zs, ks)"
      shows "length (snd xs) = length ks"
    using merge_length_out1 merge_length_out2 sorry


    fun merge_sort :: "'a list \<Rightarrow> ('a list \<times> nat list)" where
      "merge_sort []  = ([], [])"
    | "merge_sort [x] = ([x], [0])"
    | "merge_sort ys =
        (let left = List.take ((List.length ys) div 2) ys in
         let rgt  = List.drop ((List.length ys) div 2) ys in
           merge (merge_sort left) (merge_sort rgt))"

    lemma list_div2_induct:
      assumes "P []" and "\<And>x. P [x]"
        and "\<And>x y xs ys zs. x#y#zs = xs@ys \<Longrightarrow> P xs \<Longrightarrow> P ys \<Longrightarrow> P (x#y#zs)"
        shows "P xs"
    using assms
    sorry

    fun reshuffle :: "nat list \<Rightarrow> 'a list \<Rightarrow> 'a list" where
      "reshuffle []     ys = []"
    | "reshuffle (x#xs) ys = List.nth ys x#reshuffle xs ys"

    lemma merge_sort_length0:
      assumes "merge_sort xs = (srtd, idxs)"
      shows "length srtd = length idxs"
    using assms proof(induct xs rule: merge_sort.induct)
      assume "merge_sort [] = (srtd, idxs)"
      hence "([], []) = (srtd, idxs)" using merge_sort.simps by auto
      hence "[] = srtd" and "[] = idxs" by auto
      thus "length srtd = length idxs" by auto
    next
      fix x
      assume "merge_sort [x] = (srtd, idxs)"
      hence "([x], [0]) = (srtd, idxs)" using merge_sort.simps by auto
      hence "[x] = srtd" and "[0] = idxs" by auto
      thus "length srtd = length idxs" by auto
    next
      fix x y zs
      assume *: "merge_sort (x#y#xs) = (srtd, idxs)"

    lemma merge_sort_length1:
      fixes xs srtd :: "'a list" and idxs :: "nat list"
      assumes "merge_sort xs = (srtd, idxs)"
      shows "length xs = length srtd"
    using assms proof(induct xs arbitrary: srtd idxs rule: merge_sort.induct)
      fix srtd idxs
      assume "merge_sort [] = (srtd, idxs)"
      hence "([], []) = (srtd, idxs)" using merge_sort.simps by simp
      hence "[] = srtd" by auto
      thus "length [] = length srtd" by auto
    next
      fix x srtd idxs
      assume "merge_sort [x] = (srtd, idxs)"
      hence "([x], [0]) = (srtd, idxs)" using merge_sort.simps by simp
      hence "[x] = srtd" by auto
      thus "length [x] = length srtd" by auto
    next
      fix x y zs srtd idxs
      assume *: "merge_sort (x#y#zs) = (srtd, idxs)"
      assume IH1: "(\<And>x' xa srtd idxs.
           x' = take (length (x # y # zs) div 2) (x # y # zs) \<Longrightarrow>
           xa = drop (length (x # y # zs) div 2) (x # y # zs) \<Longrightarrow>
           merge_sort xa = (srtd, idxs) \<Longrightarrow> length xa = length srtd)"
      assume IH2: "(\<And>x' xa srtd idxs.
           x' = take (length (x # y # zs) div 2) (x # y # zs) \<Longrightarrow>
           xa = drop (length (x # y # zs) div 2) (x # y # zs) \<Longrightarrow>
           merge_sort x' = (srtd, idxs) \<Longrightarrow> length x' = length srtd)"
      def lft \<equiv> "take (length (x#y#zs) div 2) (x#y#zs)"
      def rgt \<equiv> "drop (length (x#y#zs) div 2) (x#y#zs)"
      have "\<exists>xsrtd xidxs. merge_sort lft = (xsrtd, xidxs)" using merge_sort.simps by auto
      from this obtain xsrtd and xidxs where L: "merge_sort lft = (xsrtd, xidxs)" by blast
      also have "\<exists>ysrtd yidxs. merge_sort rgt = (ysrtd, yidxs)" using merge_sort.simps by auto
      from this obtain ysrtd and yidxs where R: "merge_sort rgt = (ysrtd, yidxs)" by blast
      have L1: "length lft = length xsrtd" using IH2 lft_def rgt_def L by auto
      have L2: "length rgt = length ysrtd" using IH1 lft_def rgt_def R by auto
      have "length (fst (merge (merge_sort lft) (merge_sort rgt))) = length xsrtd + length ysrtd" using L1 L2 merge_length_out1
      
    

    lemma merge_sort_in_out:
      assumes "merge_sort xs = (srtd, idxs)"
        shows "reshuffle idxs srtd = xs"
    using assms proof(induct xs arbitrary: srtd idxs rule: merge_sort.induct)
      fix srtd idxs
      assume "merge_sort [] = (srtd, idxs)"
      hence "([], []) = (srtd, idxs)" using merge_sort.simps by auto
      hence "srtd = []" and "idxs = []" by auto
      thus "reshuffle idxs srtd = []" by auto
    next
      fix x srtd idxs
      assume "merge_sort [x] = (srtd, idxs)"
      hence *: "[x] = srtd" and **: "[0] = idxs" using merge_sort.simps by auto
      hence "(List.nth [x] 0#(reshuffle [] [x])) = [x]" using reshuffle.simps by auto
      thus "reshuffle idxs srtd = [x]" using reshuffle.simps * ** by auto
    next
      fix x y zs srtd idxs
      assume *: "merge_sort (x#y#zs) = (srtd, idxs)"
      assume IH1: "(\<And>x' xa srtd idxs.
           x' = take (length (x # y # zs) div 2) (x # y # zs) \<Longrightarrow>
           xa = drop (length (x # y # zs) div 2) (x # y # zs) \<Longrightarrow>
           merge_sort xa = (srtd, idxs) \<Longrightarrow> reshuffle idxs srtd = xa)"
      assume IH2: "(\<And>x' xa srtd idxs.
           x' = take (length (x # y # zs) div 2) (x # y # zs) \<Longrightarrow>
           xa = drop (length (x # y # zs) div 2) (x # y # zs) \<Longrightarrow>
           merge_sort x' = (srtd, idxs) \<Longrightarrow> reshuffle idxs srtd = x')"
      def lft \<equiv> "take (length (x#y#zs) div 2) (x#y#zs)"
      def rgt \<equiv> "drop (length (x#y#zs) div 2) (x#y#zs)"
      from * have "merge (merge_sort lft) (merge_sort rgt) = (srtd, idxs)" using merge_sort.simps lft_def rgt_def by metis
      
  end




  fun f_in :: "nat list \<Rightarrow> nat list \<times> nat list" where
    "f_in []     = ([], [])"
  | "f_in (x#xs) = undefined"

  

  lemma f_in_roundtrip:
    assumes "sorted ys" and "length xs = length ys"
      shows "sort (f_in xs ys) = ys"

end
