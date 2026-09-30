<!-- Claude: written by Claude, 30 September 2026, from the cross-check harness's results. -->
# gdb: internal error in dwarf2_get_symbol_read_needs on a DW_OP_bra whose target is also reached by fall-through

**Version:** GNU gdb (Ubuntu 15.1-1ubuntu1~24.04.1) 15.1, x86-64 Linux (also
reproduced with gdb-multiarch 15.1 debugging an aarch64 program under
qemu-user).

**Summary.**  Evaluating a variable whose `DW_AT_location` is

    DW_OP_lit1; DW_OP_lit1; DW_OP_bra +1; DW_OP_not; DW_OP_nop      (bytes 31 31 28 01 00 20 96)

makes gdb abort:

    ./gdb/dwarf2/loc.c:1881: internal-error: dwarf2_get_symbol_read_needs:
    Assertion `visited_ops.find (op_ptr) == visited_ops.end ()' failed.
    A problem internal to GDB has been detected,
    further debugging may prove unreliable.

The `DW_OP_bra` branches over the `DW_OP_not` to the `DW_OP_nop`, which is
also reached by falling through when the branch is not taken.  The static
pre-pass `dwarf2_get_symbol_read_needs` (which decides whether the expression
needs a frame or registers) walks both paths and asserts when it meets the
join point a second time.  Any expression in which a branch target is also
reached sequentially triggers it; a branch to the end of the expression does
not (`DW_OP_lit1; DW_OP_lit1; DW_OP_bra +1; DW_OP_not` evaluates fine, to 1),
and whether the branch would be taken at run time makes no difference (the
pre-pass runs before evaluation).  Expected: the pre-pass should treat an
already-visited operation as a join and stop, and the expression should
evaluate to 1 (the branch is taken, the `DW_OP_not` skipped).

In a random sample of 2000 well-formed DWARF 4 expressions with `DW_OP_bra`
and `DW_OP_skip` over single operations, 58 (2.9%) crash gdb this way.  lldb
18.1.3 evaluates all of them.

**Reproducer.**  `gdb-bra-join-example/prog.s` is a self-contained x86-64
program (no libc): `_start` loads known values into the registers and stops at
`dw_here`; `.debug_info` (DWARF 4) describes a subprogram `main` with one
variable `m_bra_join_nop` of type `unsigned long` whose `DW_AT_location` is the
expression above.

    as -o prog.o prog.s && ld -static -o prog prog.o
    gdb -batch -ex 'break *dw_here' -ex run -ex 'print/x &m_bra_join_nop' prog

The `print` (or `info address m_bra_join_nop`, or `info locals`) triggers the
assertion.  With the trailing `DW_OP_nop` removed from the location expression
(edit the `.byte` lines between `.Lm_bra_join_nop_start` and
`.Lm_bra_join_nop_end`, and the `.uleb128` length is computed from the
labels), the same command prints `0x1`.

**Also observed** in the same cross-check, for information rather than as a
bug: `DW_OP_mod` with a zero divisor (`DW_OP_lit20; DW_OP_lit0; DW_OP_mod`)
returns the dividend, 0x14, silently (`DW_OP_div` by zero reports "Division by
zero"); DWARF 4 leaves the case unspecified.  Shift counts of 64 or more
saturate (`DW_OP_shl`/`shr` to 0, `DW_OP_shra` to the sign fill) with a
"shift count >= width of type" warning; also unspecified.  These match what we
have adopted in linksem.

**Context.**  Found by linksem's DWARF expression cross-check
(`linksem/validation/test-dwarf-expr`), which evaluates the same expressions
with linksem's interpreter, gdb and lldb and compares the results.
