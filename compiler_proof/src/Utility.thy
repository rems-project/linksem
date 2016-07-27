theory
  Utility
imports
  Main
begin

section\<open>Summation utilities\<close>

text\<open>For summing over sets of booleans...\<close>
instantiation bool :: comm_monoid_add
begin
  definition zero_bool :: bool where
    "zero_bool \<equiv> True"

  definition plus_bool :: "bool \<Rightarrow> bool \<Rightarrow> bool" where
    "plus_bool \<equiv> op \<and>"

  instance
    by(standard, auto simp add: zero_bool_def plus_bool_def)
end

section\<open>Sum type utilities\<close>

definition of_inl :: "'a + 'b \<Rightarrow> 'a option" where
  "of_inl s \<equiv>
     case s of
       Inl l \<Rightarrow> Some l
     | _ \<Rightarrow> None"

definition of_inr :: "'a + 'b \<Rightarrow> 'b option" where
  "of_inr s \<equiv>
     case s of
       Inr r \<Rightarrow> Some r
     | _ \<Rightarrow> None"

end