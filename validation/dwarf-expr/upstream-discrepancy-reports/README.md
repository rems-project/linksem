<!-- Claude: written by Claude, 30 September 2026. -->
# Upstream discrepancy reports

Reports, ready to file, of the debugger behaviours that the DWARF expression
cross-check (`..`) found to differ from the DWARF 4 text, each with a
standalone example produced by `make minimize` (a one-variable test program
and the plain `gdb`/`lldb` commands that show the result):

- `gdb-DW_OP_bra-internal-error.md`: gdb 15.1 aborts with an internal error
  on a `DW_OP_bra` whose target is also reached by falling through (example in
  `gdb-bra-join-example/`), and its `DW_OP_mul` and `DW_OP_shl` return the magnitude of a
  result that overflows negatively (example in `gdb-mul-overflow-example/`).
- `lldb-typed-stack-values.md`: lldb 18.1.3 (and 23.1.2) give `DW_OP_abs`,
  `DW_OP_shra`, `DW_OP_mod` and the comparisons a signed or unsigned meaning
  depending on how the operand was produced, where DWARF 4 fixes it; plus two
  smaller points.  Examples in `lldb-typed-values-examples/`.  Its last
  section covers the DWARF 5 typed operations: `DW_OP_const_type`,
  `DW_OP_regval_type`, `DW_OP_deref_type`, `DW_OP_reinterpret` and
  `DW_OP_constx` are not implemented, and `DW_OP_convert` ignores the source
  type's signedness (examples in `lldb-dwarf5-examples/`).
- `gdb-DWARF5-typed-operations.md`: gdb 15.1's `DW_OP_convert` to a narrower
  type loses the sign of a negative value whose magnitude does not fit
  (example in `gdb-convert-narrowing-example/`), its `DW_OP_plus_uconst` on a
  typed operand gives a generic result where DWARF 5 says the operand's type
  (`gdb-plus-uconst-typed-example/`), and `DW_OP_constx` is unimplemented
  (`gdb-constx-example/`).

The example directories hold `expr.txt` (the expression in the harness's
textual form) and `prog.s`; assemble and link with `as -o prog.o prog.s && ld
-static -o prog prog.o` (x86_64).  The expressions are the `DW_AT_location` of
the variable of the same name in `main`; the program stops at `dw_here` with
the registers described in the reports.  The DWARF 5 examples' `prog.s` are
version 5 units (with `.debug_loclists` and `.debug_addr`) that also define
the base types the typed operations name.
