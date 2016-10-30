chapter\<open>Common expression language\<close>

text\<open>This module contains the common expression language of both the single- and mult-module
     IMP+linkage languages.\<close>

theory
  Common_IMPl_Expression
imports
  Main
  "~~/src/HOL/Word/Word"
  Common
  Common_IMPl_Decl_Body
begin

section\<open>Expressions\<close>

text\<open>We endow our IMP+linkage language with a simple but expressive expression language, consisting
     of equality tests, additions, logical ands, unary negations, and logical nots, conditionals,
     and boolean and integer literals.  Other expression types (such as logical or, or subtraction),
     can be defined as derived forms from these.\<close>

datatype binop
  = Equal
  | Add
  | And

datatype unop
  = Negate
  | Not

datatype expr
  = Var        "ident"
  | Literal    "32 word + bool"
  | BinOp      "binop" "expr" "expr"
  | UnOp       "unop"  "expr"
  | IfThenElse "expr"  "expr" "expr"
  | Call       "ident" "expr list"

fun expr_var_footprint :: "expr \<Rightarrow> ident set" where
  "expr_var_footprint (Var v)               = {v}" |
  "expr_var_footprint (Literal l)           = {}" |
  "expr_var_footprint (BinOp b e1 e2)       = expr_var_footprint e1 \<union> expr_var_footprint e2" |
  "expr_var_footprint (UnOp u e)            = expr_var_footprint e" |
  "expr_var_footprint (IfThenElse e1 e2 e3) =
     expr_var_footprint e1 \<union> expr_var_footprint e2 \<union> expr_var_footprint e3" |
  "expr_var_footprint (Call fn args)        = (\<Union>a \<in> set args. expr_var_footprint a)"

text\<open>Utility function for lifting Isabelle machine integers into expressions as literals.\<close>
definition lift_literal_int :: "32 word \<Rightarrow> expr" where
  "lift_literal_int i \<equiv> Literal (Inl i)"

lemma expr_var_footprint_lift_literal_int [simp]:
  shows "expr_var_footprint (lift_literal_int i) = {}"
by(auto simp add: lift_literal_int_def)

text\<open>Utility function for lifting Isabelle booleans into expressions as literals.\<close>
definition lift_literal_bool :: "bool \<Rightarrow> expr" where
  "lift_literal_bool b \<equiv> Literal (Inr b)"

lemma expr_var_footprint_lift_literal_bool [simp]:
  shows "expr_var_footprint (lift_literal_bool b) = {}"
by(auto simp add: lift_literal_bool_def)

definition derived_or :: "expr \<Rightarrow> expr \<Rightarrow> expr" where
  "derived_or e1 e2 \<equiv> UnOp Not (BinOp And (UnOp Not e1) (UnOp Not e2))"

lemma expr_var_footprint_derived_or [simp]:
  shows "expr_var_footprint (derived_or e1 e2) = expr_var_footprint e1 \<union> expr_var_footprint e2"
by(auto simp add: derived_or_def)

definition derived_subtraction :: "expr \<Rightarrow> expr \<Rightarrow> expr" where
  "derived_subtraction e1 e2 \<equiv> BinOp Add e1 (UnOp Negate e2)"

lemma expr_var_footprint_derived_subtraction [simp]:
  shows "expr_var_footprint (derived_subtraction e1 e2) =
    expr_var_footprint e1 \<union> expr_var_footprint e2"
by(auto simp add: derived_subtraction_def)

definition derived_not_equal :: "expr \<Rightarrow> expr \<Rightarrow> expr" where
  "derived_not_equal e1 e2 = UnOp Not (BinOp Equal e1 e2)"

lemma expr_var_footprint_derived_not_equal [simp]:
  shows "expr_var_footprint (derived_not_equal e1 e2) =
    expr_var_footprint e1 \<union> expr_var_footprint e2"
by(auto simp add: derived_not_equal_def)

text\<open>Syntax for binary operators.\<close>
syntax
  syntax_equal               :: "expr \<Rightarrow> expr \<Rightarrow> expr" ("_/ \<approx>/ _" [75,75]75)
  syntax_add                 :: "expr \<Rightarrow> expr \<Rightarrow> expr" ("_/ \<oplus>/ _" [75,75]75)
  syntax_and                 :: "expr \<Rightarrow> expr \<Rightarrow> expr" ("_/ andalso/ _" [75,75]75)
  syntax_derived_or          :: "expr \<Rightarrow> expr \<Rightarrow> expr" ("_/ orelse/ _" [75,75]75)
  syntax_derived_subtraction :: "expr \<Rightarrow> expr \<Rightarrow> expr" ("_/ \<ominus>/ _" [75,75]75)
  syntax_derived_not_equal   :: "expr \<Rightarrow> expr \<Rightarrow> expr" ("_/ !\<approx>/ _" [75,75]75)
translations
  "e1 \<approx> e2"       \<rightleftharpoons> "CONST BinOp (CONST Equal) e1 e2"
  "e1 \<oplus> e2"       \<rightleftharpoons> "CONST BinOp (CONST Add) e1 e2"
  "e1 andalso e2" \<rightleftharpoons> "CONST BinOp (CONST And) e1 e2"
  "e1 orelse  e2" \<rightleftharpoons> "CONST derived_or e1 e2"
  "e1 \<ominus> e2"       \<rightleftharpoons> "CONST derived_subtraction e1 e2"
  "e1 !\<approx> e2"      \<rightleftharpoons> "CONST derived_not_equal e1 e2"

text\<open>Syntax for unary operators.\<close>
syntax
  syntax_negate :: "expr \<Rightarrow> expr" ("\<sim>/ _" [75]75)
  syntax_not    :: "expr \<Rightarrow> expr" ("not/ _" [75]75)
translations
  "\<sim> e"   \<rightleftharpoons> "CONST UnOp (CONST Negate) e"
  "not e" \<rightleftharpoons> "CONST UnOp (CONST Not) e"

text\<open>Syntax for everything else.\<close>
syntax
  syntax_lift_literal_int  :: "int \<Rightarrow> expr" ("\<lceil>/ _ /\<rceil>i" [75]75)
  syntax_lift_literal_bool :: "bool \<Rightarrow> expr" ("\<lceil>/ _ /\<rceil>b" [75]75)
  syntax_call              :: "ident \<Rightarrow> expr list \<Rightarrow> expr" ("_\<lparr>/ _/ \<rparr>" [60,60]60)
  syntax_if_then_else      :: "expr \<Rightarrow> expr \<Rightarrow> expr \<Rightarrow> expr" ("If/ _/ Then/ _/ Else/ _/ End" [60,60,60]60)
translations
  "If e1 Then e2 Else e3 End" \<rightleftharpoons> "CONST IfThenElse e1 e2 e3"
  "\<lceil> i \<rceil>i" \<rightleftharpoons> "CONST lift_literal_int i"
  "\<lceil> b \<rceil>b" \<rightleftharpoons> "CONST lift_literal_bool b"
  "F\<lparr> args \<rparr>" \<rightleftharpoons> "CONST Call F args"

section\<open>Typing\<close>

text\<open>A global context keeps track of top-level declarations in a given module.\<close>
type_synonym global_ctxt = "ident \<rightharpoonup> decl_body"

text\<open>A local context keeps track of local (i.e. function-local) declarations when type checking an
expression or statement.\<close>
type_synonym local_ctxt  = "ident \<rightharpoonup> type"

text\<open>Tries to resolve a variable identifier, first from the \<open>local_ctxt\<close> and then if that fails
from the outer \<open>global_ctxt\<close> providing there is a variable declaration corresponding to that
identifier.\<close>
definition resolve_ident_type :: "global_ctxt \<Rightarrow> local_ctxt \<Rightarrow> ident \<rightharpoonup> type" where
  "resolve_ident_type \<Delta> \<Gamma> i \<equiv>
     case \<Gamma> i of
       None \<Rightarrow>
       (case \<Delta> i of
          Some (VDecl ty) \<Rightarrow> Some ty
        | _ \<Rightarrow> None)
     | Some \<tau> \<Rightarrow> Some \<tau>"

section\<open>Expression typing\<close>

subsection\<open>Specification\<close>

inductive expr_typing_specification :: "global_ctxt \<Rightarrow> local_ctxt \<Rightarrow> expr \<Rightarrow> type \<Rightarrow> bool"
      ("_/ \<circ>/ _/ \<turnstile>e/ _/ \<triangleright>/ _" [60,60,60,60]60) where
  expr_typing_Var [intro!]: "\<lbrakk> (resolve_ident_type \<Delta> \<Gamma> v) = Some \<tau> \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e Var v \<triangleright> \<tau>" |
  expr_typing_int_Literal [intro!]: "\<lbrakk> l = Inl i \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e Literal l \<triangleright> int32" |
  expr_typing_bool_Literal [intro!]: "\<lbrakk> l = Inr b \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e Literal l \<triangleright> boolean" |
  expr_typing_Add [intro!]: "\<lbrakk> \<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> int32; \<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> int32 \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e (e1 \<oplus> e2) \<triangleright> int32" |
  expr_typing_And [intro!]: "\<lbrakk> \<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> boolean; \<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> boolean \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e (e1 andalso e2) \<triangleright> boolean" |
  expr_typing_Equal [intro!]: "\<lbrakk> \<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> t1; \<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> t2; t1 = t2 \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e (e1 \<approx> e2) \<triangleright> boolean" |
  expr_typing_Negate [intro!]: "\<lbrakk> \<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> int32 \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e (\<sim> e1) \<triangleright> int32" |
  expr_typing_Not [intro!]: "\<lbrakk> \<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> boolean \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e (not e1) \<triangleright> boolean" |
  expr_typing_IfThenElse [intro!]: "\<lbrakk> \<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> boolean; \<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> t1; \<Delta> \<circ> \<Gamma> \<turnstile>e e3 \<triangleright> t2; t1 = t2 \<rbrakk> \<Longrightarrow>
      \<Delta> \<circ> \<Gamma> \<turnstile>e If e1 Then e2 Else e3 End \<triangleright> t1" |
  expr_typing_Call [intro!]: "\<lbrakk> (\<Delta> F) = Some (FDecl ty as); length as = length args;
       \<forall>d \<in> set (zip args as). (\<Delta> \<circ> \<Gamma> \<turnstile>e (fst d) \<triangleright> (snd d)) \<rbrakk> \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e F\<lparr> args \<rparr> \<triangleright> ty"

lemma expr_typing_Or [intro!]:
  assumes "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> boolean" "\<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> boolean"
  shows   "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 orelse e2 \<triangleright> boolean"
using assms unfolding derived_or_def by blast

lemma expr_typing_NotEqual_int32 [intro!]:
  assumes "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> int32" "\<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> int32"
  shows   "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 !\<approx> e2 \<triangleright> boolean"
using assms unfolding derived_not_equal_def by force

lemma expr_typing_NotEqual_boolean [intro!]:
  assumes "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> boolean" "\<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> boolean"
  shows   "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 !\<approx> e2 \<triangleright> boolean"
using assms unfolding derived_not_equal_def by force

lemma expr_typing_Sub [intro!]:
  assumes "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> int32" "\<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> int32"
  shows   "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<ominus> e2 \<triangleright> int32"
using assms unfolding derived_subtraction_def by force

lemma expr_typing_lift_int32 [intro!]:
  shows "\<Delta> \<circ> \<Gamma> \<turnstile>e \<lceil> i \<rceil>i \<triangleright> int32"
unfolding lift_literal_int_def by auto

lemma expr_typing_lift_boolean [intro!]:
  shows "\<Delta> \<circ> \<Gamma> \<turnstile>e \<lceil> b \<rceil>b \<triangleright> boolean"
unfolding lift_literal_bool_def by auto

subsection\<open>Algorithmic expression typing\<close>

function expr_typing :: "global_ctxt \<Rightarrow> local_ctxt \<Rightarrow> expr \<Rightarrow> type option" where
  "expr_typing \<Delta> \<Gamma> (Var v) = resolve_ident_type \<Delta> \<Gamma> v" |
  "expr_typing \<Delta> \<Gamma> (Literal l) =
     (case l of
        Inl i \<Rightarrow> Some int32
      | Inr b \<Rightarrow> Some boolean)" |
  "expr_typing \<Delta> \<Gamma> (e1 \<oplus> e2) =
     (case (expr_typing \<Delta> \<Gamma> e1, expr_typing \<Delta> \<Gamma> e2) of
        (Some int32, Some int32) \<Rightarrow> Some int32
      | _ \<Rightarrow> None)" |
  "expr_typing \<Delta> \<Gamma> (e1 andalso e2) =
     (case (expr_typing \<Delta> \<Gamma> e1, expr_typing \<Delta> \<Gamma> e2) of
        (Some boolean, Some boolean) \<Rightarrow> Some boolean
      | _ \<Rightarrow> None)" |
  "expr_typing \<Delta> \<Gamma> (e1 \<approx> e2) =
     (case (expr_typing \<Delta> \<Gamma> e1, expr_typing \<Delta> \<Gamma> e2) of
        (Some t1, Some t2) \<Rightarrow> if t1 = t2 then Some boolean else None
      | _ \<Rightarrow> None)" |
  "expr_typing \<Delta> \<Gamma> (\<sim> e1) =
     (case expr_typing \<Delta> \<Gamma> e1 of
        Some int32 \<Rightarrow> Some int32
      | _ \<Rightarrow> None)" |
  "expr_typing \<Delta> \<Gamma> (not e1) =
     (case expr_typing \<Delta> \<Gamma> e1 of
        Some boolean \<Rightarrow> Some boolean
      | _ \<Rightarrow> None)" |
  "expr_typing \<Delta> \<Gamma> (If b Then t Else f End) =
     (case (expr_typing \<Delta> \<Gamma> b, expr_typing \<Delta> \<Gamma> t, expr_typing \<Delta> \<Gamma> f) of
        (Some boolean, Some t1, Some t2) \<Rightarrow> if t1 = t2 then Some t1 else None
      | _ \<Rightarrow> None)" |
  "expr_typing \<Delta> \<Gamma> (F\<lparr> args \<rparr>) =
     (case \<Delta> F of
        Some (FDecl \<tau> args') \<Rightarrow>
          (if length args = length args' then
             if \<forall>d \<in> set (zip args args'). expr_typing \<Delta> \<Gamma> (fst d) = Some (snd d) then
               Some \<tau>
             else None
           else
             None)
      | _ \<Rightarrow> None)"
by pat_completeness auto

termination expr_typing
  apply(relation "measure (\<lambda>(g, l, e). size e)")
  apply(auto)
  apply(metis set_zip_leftD less_irrefl_nat not_less_eq size_list_estimation)
done

lemma expr_typing_VarD [dest]:
  assumes "expr_typing \<Delta> \<Gamma> (Var v) = Some t"
  shows   "resolve_ident_type \<Delta> \<Gamma> v = Some t"
using assms by auto

lemma expr_typing_LiteralD [dest]:
  assumes "expr_typing \<Delta> \<Gamma> (Literal l) = Some t"
  shows   "(\<exists>i. l = Inl i \<and> t = int32) \<or> (\<exists>b. l = Inr b \<and> t = boolean)"
using assms by(metis expr_typing.simps(2) option.inject sum.case(1) sum.case(2) sumE)

lemma expr_typing_AndD [dest]:
  assumes "expr_typing \<Delta> \<Gamma> (e1 andalso e2) = Some t"
  shows   "expr_typing \<Delta> \<Gamma> e1 = Some boolean \<and> expr_typing \<Delta> \<Gamma> e2 = Some boolean \<and> t = boolean"
using assms
  apply(simp)
  apply(cases "expr_typing \<Delta> \<Gamma> e1"; simp)
  apply(case_tac "a"; simp)
  apply(cases "expr_typing \<Delta> \<Gamma> e2"; simp)
  apply(case_tac "aa"; simp)
done

lemma expr_typing_AddD [dest]:
  assumes "expr_typing \<Delta> \<Gamma> (e1 \<oplus> e2) = Some t"
  shows   "expr_typing \<Delta> \<Gamma> e1 = Some int32 \<and> expr_typing \<Delta> \<Gamma> e2 = Some int32 \<and> t = int32"
using assms
  apply(simp)
  apply(cases "expr_typing \<Delta> \<Gamma> e1"; simp)
  apply(case_tac "a"; simp)
  apply(cases "expr_typing \<Delta> \<Gamma> e2"; simp)
  apply(case_tac "aa"; simp)
done

lemma expr_typing_EqualD [dest]:
  assumes "expr_typing \<Delta> \<Gamma> (e1 \<approx> e2) = Some t"
  shows   "\<exists>t1 t2. expr_typing \<Delta> \<Gamma> e1 = Some t1 \<and> expr_typing \<Delta> \<Gamma> e2 = Some t2 \<and> t1 = t2 \<and> t = boolean"
using assms
  apply(simp)
  apply(cases "expr_typing \<Delta> \<Gamma> e1"; simp)
  apply(cases "expr_typing \<Delta> \<Gamma> e2"; simp)
  apply(case_tac "a = aa"; simp)
done

lemma expr_typing_NegateD [dest]:
  assumes "expr_typing \<Delta> \<Gamma> (\<sim> e1) = Some t"
  shows   "expr_typing \<Delta> \<Gamma> e1 = Some int32 \<and> t = int32"
using assms
  apply(simp)
  apply(cases "expr_typing \<Delta> \<Gamma> e1"; simp)
  apply(case_tac "a"; simp)
done

lemma expr_typing_NotD [dest]:
  assumes "expr_typing \<Delta> \<Gamma> (not e1) = Some t"
  shows   "expr_typing \<Delta> \<Gamma> e1 = Some boolean \<and> t = boolean"
using assms
  apply(simp)
  apply(cases "expr_typing \<Delta> \<Gamma> e1"; simp)
  apply(case_tac "a"; simp)
done

lemma expr_typing_IfThenElseD [dest]:
  assumes "expr_typing \<Delta> \<Gamma> (If b Then e1 Else e2 End) = Some t"
  shows   "\<exists>t1 t2. expr_typing \<Delta> \<Gamma> b = Some boolean \<and> expr_typing \<Delta> \<Gamma> e1 = Some t1 \<and>
    expr_typing \<Delta> \<Gamma> e2 = Some t2 \<and> t1 = t2 \<and> t = t1"
using assms
  apply(simp)
  apply(cases "expr_typing \<Delta> \<Gamma> b"; simp)
  apply(case_tac "a"; simp)
  apply(cases "expr_typing \<Delta> \<Gamma> e1"; simp)
  apply(cases "expr_typing \<Delta> \<Gamma> e2"; simp)
  apply(case_tac "aa=ab"; simp)
done

lemma expr_typing_CallD [dest]:
  assumes "expr_typing \<Delta> \<Gamma> (F\<lparr> args \<rparr>) = Some t"
  shows   "\<exists>\<tau> params.
    \<Delta> F = Some (FDecl \<tau> params) \<and> length args = length params \<and>
      (\<forall>d \<in> set (zip args params). expr_typing \<Delta> \<Gamma> (fst d) = Some (snd d)) \<and> t = \<tau>"
using assms
  apply(simp)
  apply(cases "\<Delta> F"; simp)
  apply(case_tac "a"; simp)
  apply(case_tac "length args = length x22"; simp)
  apply(case_tac "\<forall>d\<in>set (zip args x22). expr_typing \<Delta> \<Gamma> (fst d) = Some (snd d)"; simp)
done

subsection\<open>Soundness and completeness of specification and algorithm\<close>

lemma expr_typing_sound:
  assumes "expr_typing \<Delta> \<Gamma> e = Some t"
  shows   "\<Delta> \<circ> \<Gamma> \<turnstile>e e \<triangleright> t"
using assms proof(induction arbitrary: t rule: expr_typing.induct)
  fix \<Delta> :: "global_ctxt" and \<Gamma> :: "local_ctxt" and e1 e2 :: "expr" and t :: "type"
  assume IH1: "(\<And>t. expr_typing \<Delta> \<Gamma> e1 = Some t \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> t)"
     and IH2: "(\<And>t. expr_typing \<Delta> \<Gamma> e2 = Some t \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> t)"
     and "expr_typing \<Delta> \<Gamma> (e1 \<oplus> e2) = Some t"
  hence "expr_typing \<Delta> \<Gamma> e1 = Some int32" "expr_typing \<Delta> \<Gamma> e2 = Some int32" "t = int32"
    by blast+
  hence "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> int32" "\<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> int32"
    using IH1 IH2 by blast+
  thus "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<oplus> e2  \<triangleright> t"
    using `t = int32` by blast
next
  fix \<Delta> :: "global_ctxt" and \<Gamma> :: "local_ctxt" and e1 e2 :: "expr" and t :: "type"
  assume IH1: "(\<And>t. expr_typing \<Delta> \<Gamma> e1 = Some t \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> t)"
     and IH2: "(\<And>t. expr_typing \<Delta> \<Gamma> e2 = Some t \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> t)"
     and "expr_typing \<Delta> \<Gamma> (e1 andalso e2) = Some t"
  hence "expr_typing \<Delta> \<Gamma> e1 = Some boolean" "expr_typing \<Delta> \<Gamma> e2 = Some boolean" "t = boolean"
    by blast+
  hence "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> boolean" "\<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> boolean"
    using IH1 IH2 by blast+
  thus "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 andalso e2  \<triangleright> t"
    using `t = boolean` by blast
next
  fix \<Delta> :: "global_ctxt" and \<Gamma> :: "local_ctxt" and e1 e2 :: "expr" and t :: "type"
  assume IH1: "(\<And>t. expr_typing \<Delta> \<Gamma> e1 = Some t \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> t)"
     and IH2: "(\<And>t. expr_typing \<Delta> \<Gamma> e2 = Some t \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> t)"
     and "expr_typing \<Delta> \<Gamma> (e1 \<approx> e2) = Some t"
  from this obtain t1 t2 where "expr_typing \<Delta> \<Gamma> e1 = Some t1" "expr_typing \<Delta> \<Gamma> e2 = Some t2" "t1 = t2" "t = boolean"
    by blast+
  hence "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> t1" "\<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> t1"
    using IH1 IH2 by blast+
  thus "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<approx> e2 \<triangleright> t"
    using `t = boolean` by blast
next
  fix \<Delta> :: "global_ctxt" and \<Gamma> :: "local_ctxt" and e1 e2 e3 :: "expr" and t :: "type"
  assume IH1: "(\<And>t. expr_typing \<Delta> \<Gamma> e1 = Some t \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> t)"
     and IH2: "(\<And>t. expr_typing \<Delta> \<Gamma> e2 = Some t \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> t)"
     and IH3: "(\<And>t. expr_typing \<Delta> \<Gamma> e3 = Some t \<Longrightarrow> \<Delta> \<circ> \<Gamma> \<turnstile>e e3 \<triangleright> t)"
     and "expr_typing \<Delta> \<Gamma> (If e1 Then e2 Else e3 End) = Some t"
  from this obtain t1 t2 where "expr_typing \<Delta> \<Gamma> e1 = Some boolean" "expr_typing \<Delta> \<Gamma> e2 = Some t1"
      "expr_typing \<Delta> \<Gamma> e3 = Some t2" "t1 = t2" "t = t1"
    by blast+
  hence "\<Delta> \<circ> \<Gamma> \<turnstile>e e1 \<triangleright> boolean" "\<Delta> \<circ> \<Gamma> \<turnstile>e e2 \<triangleright> t1" "\<Delta> \<circ> \<Gamma> \<turnstile>e e3 \<triangleright> t1"
    using IH1 IH2 IH3 by blast+
  thus "\<Delta> \<circ> \<Gamma> \<turnstile>e If e1 Then e2 Else e3 End \<triangleright> t"
    using `t = t1` by blast
next
  fix \<Delta> :: "global_ctxt" and \<Gamma> :: "local_ctxt" and F :: "ident" and args :: "expr list" and t :: "type"
  assume IH: "(\<And>(decl::decl_body) (\<tau>::type) params d t. \<Delta> F = Some decl \<Longrightarrow> decl = FDecl \<tau> params \<Longrightarrow>
      length args = length params \<Longrightarrow> d \<in> set (zip args params) \<Longrightarrow> expr_typing \<Delta> \<Gamma> (fst d) = Some t \<Longrightarrow>
        \<Delta> \<circ> \<Gamma> \<turnstile>e fst d \<triangleright> t)"
     and "expr_typing \<Delta> \<Gamma> (F\<lparr> args \<rparr>) = Some t"
  from this obtain \<tau> params where "\<Delta> F = Some (FDecl \<tau> params)" "length args = length params"
      "\<forall>d \<in> set (zip args params). expr_typing \<Delta> \<Gamma> (fst d) = Some (snd d)" "t = \<tau>"
    by blast
  hence "\<And>d. d \<in> set (zip args params) \<Longrightarrow> expr_typing \<Delta> \<Gamma> (fst d) = Some (snd d)"
    by blast
  thus "\<Delta> \<circ> \<Gamma> \<turnstile>e F\<lparr> args \<rparr> \<triangleright> t"
    using `t = \<tau>` `length args = length params` `\<Delta> F = Some (FDecl \<tau> params)` IH by auto
qed blast+

lemma expr_typing_complete:
  assumes "\<Delta> \<circ> \<Gamma> \<turnstile>e e \<triangleright> t"
  shows   "expr_typing \<Delta> \<Gamma> e = Some t"
using assms by(induction, auto)

lemma unicity_of_expr_typing:
  assumes "\<Delta> \<circ> \<Gamma> \<turnstile>e e \<triangleright> t1" "\<Delta> \<circ> \<Gamma> \<turnstile>e e \<triangleright> t2"
  shows   "t1 = t2"
using assms expr_typing_complete option.inject by metis

section\<open>Semantics\<close>

datatype memory_value
  = VBoolean "bool"
  | VInt32   "32 word"

type_synonym memory = "ident \<rightharpoonup> memory_value"
type_synonym fun_oracle = "ident \<Rightarrow> memory_value list \<rightharpoonup> memory_value"

definition initial_value :: "type \<Rightarrow> memory_value" where
  "initial_value v \<equiv>
     case v of
       int32   \<Rightarrow> VInt32   0
     | boolean \<Rightarrow> VBoolean True"

inductive expr_semantics :: "memory \<Rightarrow> fun_oracle \<Rightarrow> expr \<Rightarrow> memory_value \<Rightarrow> bool" ("_/ \<circ> _/ \<turnstile>e/ _/ \<longrightarrow>/ _" [65,65,65]65) where
  expr_semantics_Var [intro!]: "\<lbrakk> \<M> v = Some value \<rbrakk> \<Longrightarrow> \<M> \<circ> \<O> \<turnstile>e Var v \<longrightarrow> value" |
  expr_semantics_int_Literal [intro!]: "\<lbrakk> l = Inl i; value = VInt32 i \<rbrakk> \<Longrightarrow> \<M> \<circ> \<O> \<turnstile>e Literal l \<longrightarrow> value" |
  expr_semantics_bool_Literal [intro!]: "\<lbrakk> l = Inr b; value = VBoolean b \<rbrakk> \<Longrightarrow> \<M> \<circ> \<O> \<turnstile>e Literal l \<longrightarrow> value" |
  expr_semantics_Add [intro!]: "\<lbrakk> \<M> \<circ> \<O> \<turnstile>e e1 \<longrightarrow> VInt32 v1; \<M> \<circ> \<O> \<turnstile>e e2 \<longrightarrow> VInt32 v2; value = VInt32 (v1 + v2) \<rbrakk> \<Longrightarrow> \<M> \<circ> \<O> \<turnstile>e (e1 \<oplus> e2) \<longrightarrow> value" |
  expr_semantics_And [intro!]: "\<lbrakk> \<M> \<circ> \<O> \<turnstile>e e1 \<longrightarrow> VBoolean v1; \<M> \<circ> \<O> \<turnstile>e e2 \<longrightarrow> VBoolean v2; value = VBoolean (v1 \<and> v2) \<rbrakk> \<Longrightarrow> \<M> \<circ> \<O> \<turnstile>e (e1 andalso e2) \<longrightarrow> value" |
  expr_semantics_Neg [intro!]: "\<lbrakk> \<M> \<circ> \<O> \<turnstile>e e1 \<longrightarrow> VInt32 v1; value = VInt32 (- v) \<rbrakk> \<Longrightarrow> \<M> \<circ> \<O> \<turnstile>e (\<sim> e1) \<longrightarrow> value" |
  expr_semantics_Not [intro!]: "\<lbrakk> \<M> \<circ> \<O> \<turnstile>e e1 \<longrightarrow> VBoolean v1; value = VBoolean (\<not> v) \<rbrakk> \<Longrightarrow> \<M> \<circ> \<O> \<turnstile>e (not e1) \<longrightarrow> value" |
  expr_semantics_Equal [intro!]: "\<lbrakk> \<M> \<circ> \<O> \<turnstile>e e1 \<longrightarrow> v1; \<M> \<circ> \<O> \<turnstile>e e2 \<longrightarrow> v2; value = VBoolean (v1 = v2) \<rbrakk> \<Longrightarrow> \<M> \<circ> \<O> \<turnstile>e (e1 \<approx> e2) \<longrightarrow> value" |
  expr_semantics_True_IfThenElse [intro!]: "\<lbrakk> \<M> \<circ> \<O> \<turnstile>e e \<longrightarrow> VBoolean True; \<M> \<circ> \<O> \<turnstile>e t \<longrightarrow> value \<rbrakk> \<Longrightarrow> \<M> \<circ> \<O> \<turnstile>e (If e Then t Else f End) \<longrightarrow> value" |
  expr_semantics_False_IfThenElse [intro!]: "\<lbrakk> \<M> \<circ> \<O> \<turnstile>e e \<longrightarrow> VBoolean False; \<M> \<circ> \<O> \<turnstile>e f \<longrightarrow> value \<rbrakk> \<Longrightarrow> \<M> \<circ> \<O> \<turnstile>e (If e Then t Else f End) \<longrightarrow> value" |
  expr_semantics_Fun [intro!]: "\<lbrakk> \<forall>i. \<M> \<circ> \<O> \<turnstile>e (args ! i) \<longrightarrow> (values ! i); \<O> F values = Some value \<rbrakk> \<Longrightarrow> \<M> \<circ> \<O> \<turnstile>e (F\<lparr> args \<rparr>) \<longrightarrow> value"

lemma expr_semantics_Or [intro!]:
  assumes "\<M> \<circ> \<O> \<turnstile>e e1 \<longrightarrow> VBoolean v1" "\<M> \<circ> \<O> \<turnstile>e e2 \<longrightarrow> VBoolean v2" "value = VBoolean (v1 \<or> v2)"
  shows   "\<M> \<circ> \<O> \<turnstile>e (e1 orelse e2) \<longrightarrow> value"
proof -
  have "\<M> \<circ> \<O> \<turnstile>e not e1 \<longrightarrow> VBoolean (\<not> v1)" "\<M> \<circ> \<O> \<turnstile>e not e2 \<longrightarrow> VBoolean (\<not> v2)"
    using `\<M> \<circ> \<O> \<turnstile>e e1 \<longrightarrow> VBoolean v1` `\<M> \<circ> \<O> \<turnstile>e e2 \<longrightarrow> VBoolean v2` by blast+
  hence "\<M> \<circ> \<O> \<turnstile>e (not e1) andalso (not e2) \<longrightarrow> VBoolean (\<not> v1 \<and> \<not> v2)"
    using `\<M> \<circ> \<O> \<turnstile>e e1 \<longrightarrow> VBoolean v1` `\<M> \<circ> \<O> \<turnstile>e e2 \<longrightarrow> VBoolean v2` by blast
  hence "\<M> \<circ> \<O> \<turnstile>e not ((not e1) andalso (not e2)) \<longrightarrow> VBoolean (\<not> (\<not> v1 \<and> \<not> v2))"
    by blast
  thus "\<M> \<circ> \<O> \<turnstile>e (e1 orelse e2) \<longrightarrow> value"
    using `value = VBoolean (v1 \<or> v2)` derived_or_def by auto
qed

lemma expr_semantics_Sub [intro!]:
  assumes "\<M> \<circ> \<O> \<turnstile>e e1 \<longrightarrow> VInt32 v1" "\<M> \<circ> \<O> \<turnstile>e e2 \<longrightarrow> VInt32 v2" "value = VInt32 (v1 - v2)"
  shows   "\<M> \<circ> \<O> \<turnstile>e (e1 \<ominus> e2) \<longrightarrow> value"
proof -
  have "\<M> \<circ> \<O> \<turnstile>e e1 \<longrightarrow> VInt32 v1" "\<M> \<circ> \<O> \<turnstile>e \<sim> e2 \<longrightarrow> VInt32 (- v2)"
    using `\<M> \<circ> \<O> \<turnstile>e e1 \<longrightarrow> VInt32 v1` `\<M> \<circ> \<O> \<turnstile>e e2 \<longrightarrow> VInt32 v2` by blast+
  hence "\<M> \<circ> \<O> \<turnstile>e (e1 \<oplus> (\<sim> e2)) \<longrightarrow> VInt32 (v1 + - v2)"
    by blast
  thus "\<M> \<circ> \<O> \<turnstile>e (e1 \<ominus> e2) \<longrightarrow> value"
    using `value = VInt32 (v1 - v2)` derived_subtraction_def by auto
qed

lemma expr_semantics_NotEqual [intro!]:
  assumes "\<M> \<circ> \<O> \<turnstile>e e1 \<longrightarrow> v1" "\<M> \<circ> \<O> \<turnstile>e e2 \<longrightarrow> v2" "value = VBoolean (v1 \<noteq> v2)"
  shows   "\<M> \<circ> \<O> \<turnstile>e (e1 !\<approx> e2) \<longrightarrow> value"
using assms unfolding derived_not_equal_def by blast

end