<!-- Claude: written by Claude, 30 September 2026. -->
# Upstream discrepancy reports

Reports, ready to file, of the debugger behaviours that the DWARF expression
cross-check (`..`) found to differ from the DWARF 4 text, each with a
standalone example produced by `make minimize` (a one-variable test program
and the plain `gdb`/`lldb` commands that show the result):

- `gdb-DW_OP_bra-internal-error.md`: gdb 15.1 aborts with an internal error
  on a `DW_OP_bra` whose target is also reached by falling through (example in
  `gdb-bra-join-example/`), and its `DW_OP_mul` returns the magnitude of a
  product that overflows negatively (example in `gdb-mul-overflow-example/`).
- `lldb-typed-stack-values.md`: lldb 18.1.3 (and 23.1.2) give `DW_OP_abs`,
  `DW_OP_shra`, `DW_OP_mod` and the comparisons a signed or unsigned meaning
  depending on how the operand was produced, where DWARF 4 fixes it; plus two
  smaller points.  Examples in `lldb-typed-values-examples/`.

The example directories hold `expr.txt` (the expression in the harness's
textual form) and `prog.s`; assemble and link with `as -o prog.o prog.s && ld
-static -o prog prog.o` (x86_64).  The expressions are the `DW_AT_location` of
the variable of the same name in `main`; the program stops at `dw_here` with
the registers described in the reports.
