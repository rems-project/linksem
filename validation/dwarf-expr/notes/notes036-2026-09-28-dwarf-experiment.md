This is a different speculative experiment, to make infrastructure to test the interpretation of DWARF expressions.  Try it in scratch space and write a note summarising the results and a plan for how to implement it, without changing any other files. This should be clean reusable infrastructure.

0. Suppose DWARF4
1. Look at the AST for DWARF operations in linksem/src/dwarf.lem.  A DWARF expression is a list of such operations.
2. Write a Lem definition that outputs such an expression to its encoding within DWARF sections in an ELF object file.
3. Write an OCaml program to run the expression using the linksem dwarf.lem interpreter and print the output (a 64-bit number)
4. Write scripts for gdb and lldb to run that expression and print the output 
5. Write an OCaml program that generates random DWARF expressions up to some size
6. Use the above machinery to cross-check the interpretation of DWARF expressions between linksem, gdb, and lldb, and write a report on any discrepancies.
