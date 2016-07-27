chapter\<open>Common definitions\<close>

text\<open>This module contains the common definition language of the single- and multi-module IMP+linkage
     languages.\<close>

theory
  Common_IMPl_Definition
imports
  Main
  Common_IMPl_Expression
  Common_IMPl_Statement
begin

section\<open>Definitions\<close>

text\<open>A definition may only be made to a variable or a function that was previously defined.  For
     variables, we may simply define the contents of a location to be the value of an expression.
     For functions, a definition consists of a function body with a signature that matches the
     previous declaration.\<close>
datatype defn_body
  = VDefn "expr"
  | FDefn "type" "(ident \<times> type) list" "stmt" "ident"

definition is_vdefn_body :: "defn_body \<Rightarrow> bool" where
  "is_vdefn_body d \<equiv>
     case d of
       VDefn e \<Rightarrow> True
     | _ \<Rightarrow> False"

definition is_fdefn_body :: "defn_body \<Rightarrow> bool" where
  "is_fdefn_body d \<equiv>
     case d of
       FDefn ty args bd ret \<Rightarrow> True
     | _ \<Rightarrow> False"

type_synonym defn = "ident \<times> defn_body"

section\<open>Definition type checking\<close>

subsection\<open>Specification\<close>

inductive defn_typing_specification :: "global_ctxt \<Rightarrow> defn \<Rightarrow> bool" ("_/ \<turnstile>df/ _" [65,65]65) where
  defn_typing_VDefn [intro!]: "\<lbrakk> \<Delta> v = Some (VDecl ty); \<Delta> \<circ> Map.empty \<turnstile>e e \<triangleright> ty \<rbrakk> \<Longrightarrow> \<Delta> \<turnstile>df (v, VDefn e)" |
  defn_typing_FDefn [intro!]: "\<lbrakk> \<Delta> v = Some (FDecl ty' params); ty = ty'; map snd args = params;
     \<Delta> \<circ> [map fst args [\<mapsto>] map snd args] \<turnstile>s body \<triangleright> \<Gamma>'; \<Gamma>' ret = Some ty \<rbrakk> \<Longrightarrow>
       \<Delta> \<turnstile>df (v, FDefn ty args body ret)"

subsection\<open>Algorithm type-checking\<close>

fun defn_typing :: "global_ctxt \<Rightarrow> defn \<Rightarrow> bool" where
  "defn_typing \<Delta> (v, VDefn e) =
     (case (\<Delta> v, expr_typing \<Delta> Map.empty e) of
        (Some (VDecl ty), Some ty') \<Rightarrow> (ty = ty')
      | _ \<Rightarrow> False)" |
  "defn_typing \<Delta> (v, FDefn ty args body ret) =
     (case (\<Delta> v, stmt_well_formed \<Delta> [map fst args [\<mapsto>] map snd args] body) of
        (Some (FDecl ty' params), Some \<Gamma>') \<Rightarrow>
           (map snd args = params \<and> ty = ty' \<and> \<Gamma>' ret = Some ty)
      | _ \<Rightarrow> False)"

subsection\<open>Soundness and completeness of algorithmic type-checking\<close>

lemma defn_typing_VDefnD [dest]:
  assumes "defn_typing \<Delta> (v, VDefn e)"
  shows   "\<exists>l ty. \<Delta> v = Some (VDecl ty) \<and> \<Delta> \<circ> Map.empty \<turnstile>e e \<triangleright> ty"
using assms
  apply(simp)
  apply(case_tac "\<Delta> v"; simp)
  apply(case_tac "a"; simp)
  apply(case_tac "expr_typing \<Delta> Map.empty e"; simp)
  apply(rule expr_typing_sound, assumption)
done

lemma defn_typing_FDefnD [dest]:
  assumes "defn_typing \<Delta> (v, FDefn ty args body ret)"
  shows   "\<exists>ty' params \<Gamma>'. \<Delta> v = Some (FDecl ty' params) \<and> ty = ty' \<and> map snd args = params \<and>
    \<Delta> \<circ> [map fst args [\<mapsto>] map snd args] \<turnstile>s body \<triangleright> \<Gamma>' \<and> \<Gamma>' ret = Some ty"
using assms
  apply simp
  apply(case_tac "\<Delta> v"; simp)
  apply(case_tac "a"; simp)
  apply(case_tac "stmt_well_formed \<Delta> [map fst args [\<mapsto>] map snd args] body"; simp)
  apply(drule stmt_well_formed_sound, auto)
done

lemma defn_typing_sound:
  assumes "defn_typing \<Delta> d"
  shows   "\<Delta> \<turnstile>df d"
using assms proof(induction rule: defn_typing.induct)
  fix \<Delta> :: "global_ctxt" and v :: "ident" and e :: "expr"
  assume "defn_typing \<Delta> (v, VDefn e)"
  from this obtain ty where "\<Delta> v = Some (VDecl ty)" "\<Delta> \<circ> Map.empty \<turnstile>e e \<triangleright> ty"
    sorry
  thus "\<Delta> \<turnstile>df (v, VDefn e)"
    by blast
next
  fix \<Delta> :: "global_ctxt" and v :: "ident" and ty :: "type" and args :: "(ident \<times> type) list"
    and body :: "stmt" and ret :: "ident"
  assume "defn_typing \<Delta> (v, FDefn ty args body ret)"
  from this obtain l ty' params \<Gamma>' where "\<Delta> v = Some (FDecl l ty' params)" "ty = ty'" "map snd args = params"
    "\<Delta> \<circ> [map fst args [\<mapsto>] map snd args] \<turnstile>s body \<triangleright> \<Gamma>'" "\<Gamma>' ret = Some ty"
    by blast
  thus "\<Delta> \<turnstile>df (v, FDefn ty args body ret)"
    by blast
qed

lemma defn_typing_complete:
  assumes "\<Delta> \<turnstile>df d"
  shows   "defn_typing \<Delta> d"
using assms by(induction; auto simp add: expr_typing_complete stmt_well_formed_complete)

end