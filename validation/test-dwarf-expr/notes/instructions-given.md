# Claude: the instructions given for this work, verbatim

Claude: the owner's instructions for this experiment and its implementation,
as given in the conversation of 28 to 30 September 2026, in order.  The first is
the prompt note `notes036-2026-09-28-dwarf-experiment.md`; the plan note
`notes037-2026-09-28-dwarf-expression-cross-check.md` carries his `PS:`
answers to its choice points.

1. (notes036) "This is a different speculative experiment, to make
   infrastructure to test the interpretation of DWARF expressions.  Try it in
   scratch space and write a note summarising the results and a plan for how to
   implement it, without changing any other files. This should be clean
   reusable infrastructure.  0. Suppose DWARF4  1. Look at the AST for DWARF
   operations in linksem/src/dwarf.lem.  A DWARF expression is a list of such
   operations.  2. Write a Lem definition that outputs such an expression to
   its encoding within DWARF sections in an ELF object file.  3. Write an OCaml
   program to run the expression using the linksem dwarf.lem interpreter and
   print the output (a 64-bit number)  4. Write scripts for gdb and lldb to run
   that expression and print the output  5. Write an OCaml program that
   generates random DWARF expressions up to some size  6. Use the above
   machinery to cross-check the interpretation of DWARF expressions between
   linksem, gdb, and lldb, and write a report on any discrepancies."

2. "Now follow the plan in notes036"

3. "how is the harness extracting the DWARF expression result in gdb?"
   (a question, answered in the conversation; the answer is now in the
   README's Design section)

4. (notes037, `PS:` comments) "I deduplicated that."; "the parser should
   record the byte offset; we should not be re-encoding"; "check the DWARF pdf
   specification.  If the above is correct, follow gdb and document that this
   is making something specified."; "no, put the harness in
   linksem/validate/test-dwarf-expr"; "include the design notes in that
   README"; "include in that directory the notes and other instructions (the
   initial notes036 prompt, this note, and other instructions (if any) I have
   given you for this experiment)."; "the harness should support regression
   testing, extensive validation runs, and running single examples."; "both,
   and (although we can't properly test this right now) this should run
   cleanly on either an x86 or Arm machine, using native execution and testing
   the other arch with an emulator if available (and telling the user what to
   install if not, but letting them run it without)."; "on ubuntu, lldb should
   be installed with "sudo apt-get install lldb", not any specific version.  I
   did that here. The harness should prompt the user to install it if it's
   missing, just as for gdb."; "commit them, and make it easy to identify
   diffs between different runs."; "for any discrepency, the infrastructure
   should automatically generate a minimal standalone example and the
   discrepency, suitable for reporting."; "for these discrepencies, write
   those two reports for upstream gdb and llvm, using the above, and check
   them in to an "upstream-discrepency-reports" directory"; "yes" (to
   re-making the read-dwarf test directories after the fixes).

5. "see notes37 and go ahead"

6. "btw, in the design notes, include as a distinct note the general
   instructions I've given you (in an anonymised form, eg not referring to
   "Peter") that have been relevant for this, that another agent instance
   would need to do something similar."  (That note is
   `general-instructions.md`.)

The harness directory is `validation/test-dwarf-expr` rather than
`validate/test-dwarf-expr`: `validation/` is the existing directory of
linksem's validation harnesses, and the instruction is taken to mean it.
