chapter\<open>Syntax of the multimodule IMP+linkage language\<close>

text\<open>Syntax specific to the multi-module IMP+linkage language.  Most syntax is derived from the
     common definitions shared between the single- and multi-module IMP+linkage languages.\<close>

theory
  Multimodule_IMPl_Syntax
imports
  Main
  Common
  Common_IMPl_Types
  Common_IMPl_Expression
  Common_IMPl_Statement
  Common_IMPl_Definition
  Common_IMPl_Decl_Body
  "../Utility"
begin

text\<open>The multimodule IMP+linkage (IMPl) language.  The language consists of:
       \<bullet> A simple expression language of boolean and machine integer expressions,
       \<bullet> A simple non-polymorphic typing system,
       \<bullet> A simple command language consisting of assignment, conditional, and iterative commands in
         the form of if-then and while-do statements,
       \<bullet> Functions which take arguments and always return a value stored in a stack-allocated local
         variable,
       \<bullet> Programs split into multiple modules consisting of lists of declarations and definitions of
         functions or global variables, combined with an entry point (equivalent to C's \<open>main\<close>
         function),
       \<bullet> Visibility of module-level definitions controlled with a pair of mandatory C-like linkage
         specifiers on all module-level declarations: \<open>static\<close> which limits visibility of a module-
         level declaration to the module in which it is declared, and \<open>extern\<close> which asserts the
         existence of a definition for a declaration elsewhere in the program (potentially in the
         same module).
     Multimodule IMP+linkage is translated to the IMP+linkage language (i.e. where modules are
     `linked away') and both are compiled to the (Multimodule) IMP+linkage-bool languages,
     respectively.\<close>

section\<open>Linkage\<close>

text\<open>All global (for a translation unit) definitions have an associated linkage.  In this language,
     we base the linkage types on the C language's linkage types.  The three major linkage types in
     C are:
       \<bullet> no linkage, the linkage type of local (stack) variables,
       \<bullet> extern linkage, which asserts the existence of a definition for a global variable or
         function is elsewhere in the program\<comment>potentially in the same module\<comment>and is the default
         linkage type for functions in C,
       \<bullet> static linkage, which limits the scope of a module-level variable or function to the
         translation unit where it is declared, and is the default linkage of global variables
         defined within a translation unit in C.
     Note that C has some other linkage types, including \<open>inline\<close> which has a subtle semantics, but
     we consider only static and extern, here.\<close>
datatype linkage
  = Static
  | Extern

syntax
  syntax_static :: "type" ("static")
  syntax_extern :: "type" ("extern")
translations
  "static"  \<rightleftharpoons> "CONST Static"
  "extern"  \<rightleftharpoons> "CONST Extern"

section\<open>Declarations\<close>

type_synonym decl = "ident \<times> linkage \<times> decl_body"

section\<open>Modules (or `units')\<close>

text\<open>Units (or modules) are a list of definitions and declarations coupled with a name (i.e. the
     name of the C file, or similar).\<close>
datatype unit
  = Unit "ident" "(defn + decl) list"

definition unit_defns :: "unit \<Rightarrow> defn list" where
  "unit_defns t \<equiv> case t of Unit nm ds \<Rightarrow> List.map_filter of_inl ds"

definition unit_fdefns :: "unit \<Rightarrow> defn list" where
  "unit_fdefns t \<equiv> List.filter (\<lambda>(v, body). is_fdefn_body body) (unit_defns t)"

definition unit_vdefns :: "unit \<Rightarrow> defn list" where
  "unit_vdefns t \<equiv> List.filter (\<lambda>(v, body). is_vdefn_body body) (unit_defns t)"

definition unit_decls :: "unit \<Rightarrow> decl list" where
  "unit_decls t \<equiv> case t of Unit nm ds \<Rightarrow> List.map_filter of_inr ds"

definition unit_name :: "unit \<Rightarrow> ident" where
  "unit_name t \<equiv> case t of Unit nm ds \<Rightarrow> nm"

definition unit_fdefn_idents :: "unit \<Rightarrow> ident set" where
  "unit_fdefn_idents u \<equiv> \<Union>f \<in> set (unit_fdefns u). {fst f}"

definition unit_vdefn_idents :: "unit \<Rightarrow> ident set" where
  "unit_vdefn_idents u \<equiv> \<Union>f \<in> set (unit_vdefns u). {fst f}"

section\<open>Programs\<close>

text\<open>Programs are a collection of modules/units, coupled with a distinguished identifier which
     points to the entry point of the program in a defined translation unit (i.e. the equivalent of
     C's \<open>main\<close> function).\<close>
datatype program
  = Program "unit list" "ident" "ident"

end