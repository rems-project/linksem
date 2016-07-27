theory
  Common_IMPl_Decl_Body
imports
  Main
  Common_IMPl_Types
begin

text\<open>In the IMP+linkage language variable and function declaration and definition is split into two
     different stages.  Variables and functions are declared by:
       \<bullet> providing an explicit linkage, a type, and a name for the variable,
       \<bullet> providing an explicit linkage, return type, a name, and argument type list for a function.\<close>
datatype decl_body
  = VDecl "type"
  | FDecl "type" "type list"

end