chapter\<open>Common typing language\<close>

text\<open>This module contains the common typing language of the single- and multi-module IMPl+linkage
     languages.\<close>

theory
  Common_IMPl_Types
imports
  Main
begin

section\<open>IMP+linkage types\<close>

text\<open>The language has two basic types: boolean, the type of boolean values; and, int32, the type of
     32-bit signed machine integers.\<close>
datatype type
  = Boolean
  | Int32

syntax
  syntax_boolean :: "type" ("boolean")
  syntax_int32   :: "type" ("int32")
translations
  "boolean" \<rightleftharpoons> "CONST Boolean"
  "int32"   \<rightleftharpoons> "CONST Int32"

end