chapter\<open>Typing of Multimodule IMP+linkage programs\<close>

theory
  Multimodule_IMPl_Typing
imports
  Multimodule_IMPl_Syntax
  "../Utility"
begin

section\<open>Declaration well-formedness checking\<close>

inductive decl_well_formedness_specification :: "global_ctxt \<Rightarrow> decl \<Rightarrow> global_ctxt \<Rightarrow> bool" ("_/ \<turnstile>dc/ _/ \<triangleright>/ _" [65,65,65]65) where
  decl_well_formed_VDecl [intro!]: "\<lbrakk> \<Delta>' = \<Delta>(v \<mapsto> VDecl ty) \<rbrakk> \<Longrightarrow> \<Delta> \<turnstile>dc (v, l, VDecl ty) \<triangleright> \<Delta>'" |
  decl_well_formed_FDecl [intro!]: "\<lbrakk> \<Delta>' = \<Delta>(v \<mapsto> FDecl ty args) \<rbrakk> \<Longrightarrow> \<Delta> \<turnstile>dc (v, l, FDecl ty args) \<triangleright> \<Delta>'"

fun decl_well_formed :: "global_ctxt \<Rightarrow> decl \<Rightarrow> global_ctxt" where
  "decl_well_formed \<Delta> (v, l, VDecl ty) = \<Delta>(v \<mapsto> VDecl ty)" |
  "decl_well_formed \<Delta> (v, l, FDecl ty args) = \<Delta>(v \<mapsto> FDecl ty args)"

lemma decl_well_formed_sound:
  assumes "decl_well_formed \<Delta> d = \<Delta>'"
  shows   "\<Delta> \<turnstile>dc d \<triangleright> \<Delta>'"
using assms by(induction rule: decl_well_formed.induct, auto)

lemma decl_well_formed_complete:
  assumes "\<Delta> \<turnstile>dc d \<triangleright> \<Delta>'"
  shows   "decl_well_formed \<Delta> d = \<Delta>'"
using assms by(induction; auto)

lemma unicity_of_decl_well_formed:
  assumes "\<Delta> \<turnstile>dc d \<triangleright> \<Delta>1" "\<Delta> \<turnstile>dc d \<triangleright> \<Delta>2"
  shows   "\<Delta>1 = \<Delta>2"
using assms decl_well_formed_complete by metis

section\<open>Program type-checking\<close>

definition entry_point_exists :: "unit list \<Rightarrow> ident \<Rightarrow> ident \<Rightarrow> bool" where
  "entry_point_exists us mn fn \<equiv> \<exists>u \<in> set us. unit_name u = mn \<and> fn \<in> unit_fdefn_idents u"

(* XXX: todo! *)
inductive program_typing_specification :: "program \<Rightarrow> bool" ("\<turnstile>p/ _" [65]65) where
  "\<lbrakk> entry_point_exists us mn fn
   \<rbrakk> \<Longrightarrow> \<turnstile>p Program us mn fn"

end