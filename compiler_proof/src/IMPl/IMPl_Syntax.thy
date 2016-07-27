chapter\<open>Syntax of the single-module IMP+linkage language\<close>

text\<open>Syntax specific to the single-module IMP+linkage language.  Most syntax is derived from the
     common definitions shared between the single- and multi-module IMP+linkage languages.\<close>

theory
  IMPl_Syntax
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

text\<open>The single-module IMP+linkage (IMPl) language.  The language consists of:
       \<bullet> A simple expression language of boolean and machine integer expressions,
       \<bullet> A simple non-polymorphic typing system,
       \<bullet> A simple command language consisting of assignment, conditional, and iterative commands in
         the form of if-then and while-do statements,
       \<bullet> Functions which take arguments and always return a value stored in a stack-allocated local
         variable,
       \<bullet> Programs consist of a single module.
     IMP+linkage is related to the Multimodule IMP+linkage language (i.e. where modules are `linked
     away') and both are compiled to the (Multimodule) IMP+linkage-bool languages, respectively.\<close>

section\<open>Declarations\<close>

type_synonym decl = "ident \<times> decl_body"

section\<open>Programs\<close>

text\<open>Programs are a collection of declarations or definitions, coupled with a distinguished
     identifier which points to the entry point of the program (i.e. the equivalent of C's \<open>main\<close>
     function).\<close>
datatype program
  = Program "(defn + decl) list" "ident"

end