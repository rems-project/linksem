chapter\<open>Common statement language\<close>

text\<open>This module contains the common statement languages of both the single- and multi-module
     IMP+linkage languages.\<close>

theory
  Common_IMPl_Statement
imports
  Main
  Common
  Common_IMPl_Types
  Common_IMPl_Expression
begin

section\<open>Statements\<close>

datatype stmt
  = Skip
  | Sequence "stmt"  "stmt"
  | Assign   "ident" "expr"
  | Declare  "type"  "ident"
  | IfThen   "expr"  "stmt"
  | Loop     "expr"  "stmt"

fun stmt_declared_vars :: "stmt \<Rightarrow> ident set" where
  "stmt_declared_vars Skip = {}" |
  "stmt_declared_vars (Sequence s1 s2) = stmt_declared_vars s1 \<union> stmt_declared_vars s2" |
  "stmt_declared_vars (Assign i e) = {}" |
  "stmt_declared_vars (Declare \<tau> i) = {i}" |
  "stmt_declared_vars (IfThen e s) = stmt_declared_vars s" |
  "stmt_declared_vars (Loop e s) = stmt_declared_vars s"

fun stmt_assigned_vars :: "stmt \<Rightarrow> ident set" where
  "stmt_assigned_vars Skip = {}" |
  "stmt_assigned_vars (Sequence s1 s2) = stmt_assigned_vars s1 \<union> stmt_assigned_vars s2" |
  "stmt_assigned_vars (Assign i e) = {i}" |
  "stmt_assigned_vars (Declare \<tau> i) = {}" |
  "stmt_assigned_vars (IfThen e s) = stmt_assigned_vars s" |
  "stmt_assigned_vars (Loop e s) = stmt_assigned_vars s"

syntax
  syntax_skip                       :: "stmt"                          ("\<bullet>")
  syntax_sequence                   :: "stmt \<Rightarrow> stmt \<Rightarrow> stmt"          ("_/ ;/ _" [75,75]75)
  syntax_assign                     :: "ident \<Rightarrow> expr \<Rightarrow> stmt"         ("_/ :=/ _" [75,75]75)
  syntax_declare                    :: "ident \<Rightarrow> type \<Rightarrow> stmt"         ("_/ hastype/ _" [75,75]75)
  syntax_if_then                    :: "expr \<Rightarrow> stmt \<Rightarrow> stmt"          ("If/ _/ Then/ _/ End" [70,75]75)
  syntax_loop                       :: "expr \<Rightarrow> stmt \<Rightarrow> stmt"          ("While/ _/ Do/ _/ End" [70,75]75)
translations
  "\<bullet>"                \<rightleftharpoons> "CONST Skip"
  "s1 ; s2"          \<rightleftharpoons> "CONST Sequence s1 s2"
  "i := e"           \<rightleftharpoons> "CONST Assign i e"
  "i hastype \<tau>"      \<rightleftharpoons> "CONST Declare \<tau> i"
  "If e Then s End"  \<rightleftharpoons> "CONST IfThen e s"
  "While e Do s End" \<rightleftharpoons> "CONST Loop e s"

section\<open>Statement well-formedness\<close>

subsection\<open>Specification\<close>

inductive stmt_well_formedness_specification :: "global_ctxt \<Rightarrow> local_ctxt \<Rightarrow> stmt \<Rightarrow> local_ctxt \<Rightarrow> bool"
    ("_/ \<circ>/ _/ \<turnstile>s/ _/ \<triangleright>/ _" [65,65,65,65]65) where
  stmt_well_formedness_Skip [intro!]: "\<Delta> \<circ> \<Gamma> \<turnstile>s \<bullet> \<triangleright> \<Gamma>" |
  stmt_well_formedness_Assign [intro!]: "\<lbrakk> resolve_ident_type \<Delta> \<Gamma> v = Some t; \<Delta> \<circ> \<Gamma> \<turnstile>e e \<triangleright> t \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>s (v := e) \<triangleright> \<Gamma>" |
  stmt_well_formedness_Declare [intro!]: "\<lbrakk> \<Gamma>' = \<Gamma>(v \<mapsto> \<tau>) \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>s (v hastype \<tau>) \<triangleright> \<Gamma>'" |
  stmt_well_formedness_Sequence [intro!]: "\<lbrakk> \<Delta> \<circ> \<Gamma> \<turnstile>s s1 \<triangleright> \<Gamma>'; \<Delta> \<circ> \<Gamma>' \<turnstile>s s2 \<triangleright> \<Gamma>'' \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>s (s1 ; s2) \<triangleright> \<Gamma>''" |
  stmt_well_formedness_IfThen [intro!]: "\<lbrakk> \<Delta> \<circ> \<Gamma> \<turnstile>e e \<triangleright> boolean; \<Delta> \<circ> \<Gamma> \<turnstile>s s \<triangleright> \<Gamma>' \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>s If e Then s End \<triangleright> \<Gamma>" |
  stmt_well_formedness_Loop [intro!]: "\<lbrakk> \<Delta> \<circ> \<Gamma> \<turnstile>e e \<triangleright> boolean; \<Delta> \<circ> \<Gamma> \<turnstile>s s \<triangleright> \<Gamma>' \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>s While e Do s End \<triangleright> \<Gamma>"

subsection\<open>Algorithmic statement well-formedness checking\<close>

fun stmt_well_formed :: "global_ctxt \<Rightarrow> local_ctxt \<Rightarrow> stmt \<Rightarrow> local_ctxt option" where
  "stmt_well_formed \<Delta> \<Gamma> \<bullet> = Some \<Gamma>" |
  "stmt_well_formed \<Delta> \<Gamma> (v := e) =
     (case (resolve_ident_type \<Delta> \<Gamma> v, expr_typing \<Delta> \<Gamma> e) of
        (Some t1, Some t2) \<Rightarrow>
          if t1 = t2 then
            Some \<Gamma>
          else None
      | _ \<Rightarrow> None)" |
  "stmt_well_formed \<Delta> \<Gamma> (s1 ; s2) =
     (case stmt_well_formed \<Delta> \<Gamma> s1 of
        Some \<Gamma>' \<Rightarrow> stmt_well_formed \<Delta> \<Gamma>' s2
      | _ \<Rightarrow> None)" |
  "stmt_well_formed \<Delta> \<Gamma> (v hastype t) = Some (\<Gamma>(v \<mapsto> t))" |
  "stmt_well_formed \<Delta> \<Gamma> (If e Then s End) =
     (case (expr_typing \<Delta> \<Gamma> e, stmt_well_formed \<Delta> \<Gamma> s) of
        (Some boolean, Some \<Gamma>') \<Rightarrow> Some \<Gamma>
      | _ \<Rightarrow> None)" |
  "stmt_well_formed \<Delta> \<Gamma> (While e Do s End) =
     (case (expr_typing \<Delta> \<Gamma> e, stmt_well_formed \<Delta> \<Gamma> s) of
        (Some boolean, Some \<Gamma>') \<Rightarrow> Some \<Gamma>
      | _ \<Rightarrow> None)"

lemma stmt_well_formed_SkipD [dest]:
  assumes "stmt_well_formed \<Delta> \<Gamma> \<bullet> = Some \<Gamma>'"
  shows   "\<Gamma> = \<Gamma>'"
using assms by simp

lemma stmt_well_formed_AssignD [dest]:
  assumes "stmt_well_formed \<Delta> \<Gamma> (v := e) = Some \<Gamma>'"
  shows   "\<exists>t. expr_typing \<Delta> \<Gamma> e = Some t \<and> resolve_ident_type \<Delta> \<Gamma> v = Some t \<and> \<Gamma> = \<Gamma>'"
using assms
  apply simp
  apply(case_tac "resolve_ident_type \<Delta> \<Gamma> v"; simp)
  apply(case_tac "expr_typing \<Delta> \<Gamma> e"; simp)
  apply(case_tac "a = aa"; simp)
done

lemma stmt_well_formed_SequenceD [dest]:
  assumes "stmt_well_formed \<Delta> \<Gamma> (s1 ; s2) = Some \<Gamma>''"
  shows   "\<exists>\<Gamma>'. stmt_well_formed \<Delta> \<Gamma> s1 = Some \<Gamma>' \<and> stmt_well_formed \<Delta> \<Gamma>' s2 = Some \<Gamma>''"
using assms
  apply simp
  apply(case_tac "stmt_well_formed \<Delta> \<Gamma> s1"; simp)
done

lemma stmt_well_formed_DeclareD [dest]:
  assumes "stmt_well_formed \<Delta> \<Gamma> (v hastype t) = Some \<Gamma>'"
  shows   "\<Gamma>' = \<Gamma>(v \<mapsto> t)"
using assms by simp

lemma stmt_well_formed_IfThenD [dest]:
  assumes "stmt_well_formed \<Delta> \<Gamma> (If e Then s End) = Some \<Gamma>''"
  shows   "\<exists>\<Gamma>'. expr_typing \<Delta> \<Gamma> e = Some boolean \<and> stmt_well_formed \<Delta> \<Gamma> s = Some \<Gamma>' \<and> \<Gamma> = \<Gamma>''"
using assms
  apply simp
  apply(case_tac "expr_typing \<Delta> \<Gamma> e"; simp)
  apply(case_tac "a"; simp)  
  apply(case_tac "stmt_well_formed \<Delta> \<Gamma> s"; simp)
done

lemma stmt_well_formed_LoopD [dest]:
  assumes "stmt_well_formed \<Delta> \<Gamma> (While e Do s End) = Some \<Gamma>''"
  shows   "\<exists>\<Gamma>'. expr_typing \<Delta> \<Gamma> e = Some boolean \<and> stmt_well_formed \<Delta> \<Gamma> s = Some \<Gamma>' \<and> \<Gamma> = \<Gamma>''"
using assms
  apply simp
  apply(case_tac "expr_typing \<Delta> \<Gamma> e"; simp)
  apply(case_tac "a"; simp)  
  apply(case_tac "stmt_well_formed \<Delta> \<Gamma> s"; simp)
done

subsection\<open>Soundness and completeness of algorithmic well-formedness checking\<close>

lemma stmt_well_formed_sound:
  assumes "stmt_well_formed \<Delta> \<Gamma> s = Some \<Gamma>'"
  shows   "\<Delta> \<circ> \<Gamma> \<turnstile>s s \<triangleright> \<Gamma>'"
using assms proof(induction arbitrary: \<Gamma>' rule: stmt_well_formed.induct)
  fix \<Delta> :: "global_ctxt" and \<Gamma> \<Gamma>' :: "local_ctxt"
  assume "stmt_well_formed \<Delta> \<Gamma> \<bullet> = Some \<Gamma>'"
  hence "\<Gamma> = \<Gamma>'"
    by blast
  thus "\<Delta> \<circ> \<Gamma> \<turnstile>s \<bullet> \<triangleright> \<Gamma>'"
    by blast
next
  fix \<Delta> :: "global_ctxt" and \<Gamma> \<Gamma>' :: "local_ctxt" and v :: "ident" and e :: "expr"
  assume "stmt_well_formed \<Delta> \<Gamma> (v := e) = Some \<Gamma>'"
  from this obtain t where "expr_typing \<Delta> \<Gamma> e = Some t" "resolve_ident_type \<Delta> \<Gamma> v = Some t" "\<Gamma>' = \<Gamma>"
    by blast
  hence "\<Delta> \<circ> \<Gamma> \<turnstile>e e \<triangleright> t"
    using expr_typing_sound by auto
  thus "\<Delta> \<circ> \<Gamma> \<turnstile>s v := e \<triangleright> \<Gamma>'"
    using `resolve_ident_type \<Delta> \<Gamma> v = Some t` `\<Gamma>' = \<Gamma>` by blast
next
  fix \<Delta> :: "global_ctxt" and \<Gamma> \<Gamma>' :: "local_ctxt" and s1 s2 :: "stmt"
  assume IH1: "(\<And>\<Gamma>'. stmt_well_formed \<Delta> \<Gamma> s1 = Some \<Gamma>' \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>s s1 \<triangleright> \<Gamma>')"
     and IH2: "(\<And>\<Gamma>'' \<Gamma>'. stmt_well_formed \<Delta> \<Gamma> s1 = Some \<Gamma>'' \<Longrightarrow> stmt_well_formed \<Delta> \<Gamma>'' s2 = Some \<Gamma>' \<Longrightarrow> \<Delta> \<circ> \<Gamma>'' \<turnstile>s s2 \<triangleright> \<Gamma>')"
     and "stmt_well_formed \<Delta> \<Gamma> (s1 ; s2) = Some \<Gamma>'"
  from this obtain \<Gamma>'' where "stmt_well_formed \<Delta> \<Gamma> s1 = Some \<Gamma>''" "stmt_well_formed \<Delta> \<Gamma>'' s2 = Some \<Gamma>'"
    by blast
  hence "\<Delta> \<circ> \<Gamma> \<turnstile>s s1 \<triangleright> \<Gamma>''" "\<Delta> \<circ> \<Gamma>'' \<turnstile>s s2 \<triangleright> \<Gamma>'"
    using IH1 IH2 by blast+
  thus "\<Delta> \<circ> \<Gamma> \<turnstile>s s1 ; s2 \<triangleright> \<Gamma>'"
    by blast
next
  fix \<Delta> :: "global_ctxt" and \<Gamma> \<Gamma>' :: "local_ctxt" and v :: "ident" and t :: "type"
  assume "stmt_well_formed \<Delta> \<Gamma> (v hastype t) = Some \<Gamma>'"
  hence "\<Gamma>' = \<Gamma>(v \<mapsto> t)"
    by blast
  thus "\<Delta> \<circ> \<Gamma> \<turnstile>s v hastype t \<triangleright> \<Gamma>'"
    by blast
next
  fix \<Delta> :: "global_ctxt" and \<Gamma> \<Gamma>' :: "local_ctxt" and s :: "stmt" and e :: "expr"
  assume IH: "(\<And>\<Gamma>'. stmt_well_formed \<Delta> \<Gamma> s = Some \<Gamma>' \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>s s \<triangleright> \<Gamma>')"
     and "stmt_well_formed \<Delta> \<Gamma> (If e Then s End) = Some \<Gamma>'"
  from this obtain \<Gamma>'' where "expr_typing \<Delta> \<Gamma> e = Some boolean" "stmt_well_formed \<Delta> \<Gamma> s = Some \<Gamma>''" "\<Gamma>' = \<Gamma>"
    by blast
  hence "\<Delta> \<circ> \<Gamma> \<turnstile>e e \<triangleright> boolean" "\<Delta> \<circ> \<Gamma> \<turnstile>s s \<triangleright> \<Gamma>''"
    using IH expr_typing_sound by blast+
  thus "\<Delta> \<circ> \<Gamma> \<turnstile>s If e Then s End \<triangleright> \<Gamma>'"
    using `\<Gamma>' = \<Gamma>` by blast
next
  fix \<Delta> :: "global_ctxt" and \<Gamma> \<Gamma>' :: "local_ctxt" and s :: "stmt" and e :: "expr"
  assume IH: "(\<And>\<Gamma>'. stmt_well_formed \<Delta> \<Gamma> s = Some \<Gamma>' \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>s s \<triangleright> \<Gamma>')"
     and "stmt_well_formed \<Delta> \<Gamma> (While e Do s End) = Some \<Gamma>'"
  from this obtain \<Gamma>'' where "expr_typing \<Delta> \<Gamma> e = Some boolean" "stmt_well_formed \<Delta> \<Gamma> s = Some \<Gamma>''" "\<Gamma>' = \<Gamma>"
    by blast
  hence "\<Delta> \<circ> \<Gamma> \<turnstile>e e \<triangleright> boolean" "\<Delta> \<circ> \<Gamma> \<turnstile>s s \<triangleright> \<Gamma>''"
    using IH expr_typing_sound by blast+
  thus "\<Delta> \<circ> \<Gamma> \<turnstile>s While e Do s End \<triangleright> \<Gamma>'"
    using `\<Gamma>' = \<Gamma>` by blast
qed

lemma stmt_well_formed_complete:
  assumes "\<Delta> \<circ> \<Gamma> \<turnstile>s s \<triangleright> \<Gamma>'"
  shows   "stmt_well_formed \<Delta> \<Gamma> s = Some \<Gamma>'"
using assms by(induction, auto simp add: expr_typing_complete)

lemma unicity_of_stmt_well_formed:
  assumes "\<Delta> \<circ> \<Gamma> \<turnstile>s s \<triangleright> \<Gamma>1" "\<Delta> \<circ> \<Gamma> \<turnstile>s s \<triangleright> \<Gamma>2"
  shows   "\<Gamma>1 = \<Gamma>2"
using assms stmt_well_formed_complete option.inject by metis

end