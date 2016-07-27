chapter\<open>Common definitions\<close>

text\<open>This module contains definitions and functions shared amongst multiple languages.\<close>

theory
  Common
imports
  Main
begin

section\<open>Common syntax definitions\<close>

text\<open>Identifiers are modelled simply as strings.\<close>
type_synonym ident = "string"

end