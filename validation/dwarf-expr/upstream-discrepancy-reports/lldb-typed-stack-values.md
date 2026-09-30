<!-- Claude: written by Claude, 30 September 2026, from the cross-check harness's results. -->
# lldb: DWARF 4 expression operators take the signedness of their operands from how the operands were pushed

**Versions:** lldb 18.1.3 (Ubuntu 24.04 package) and lldb 23.1.2 (LLVM
release binaries), x86-64 Linux; also reproduced for aarch64 programs under
qemu-user through `gdb-remote`.

**Summary.**  DWARF 4 (section 2.5.1.4 and 2.5.1.5) defines the expression
stack as untyped: "unsigned arithmetic ... modulo one plus the largest
representable address", with `DW_OP_abs`, `DW_OP_neg`, `DW_OP_div` and `DW_OP_shra`
interpreting their operands as signed, `DW_OP_mod` as unsigned, and the six
comparisons "performed as signed operations".  lldb's `DWARFExpression`
evaluator keeps a `Scalar` with a type per stack entry, and takes that type
from the operation that produced the entry (`DW_OP_constNs`/`consts` signed;
`DW_OP_litN`, `DW_OP_constNu`/`constu`, `DW_OP_bregN`, `DW_OP_deref*` and the
results of arithmetic unsigned), so the same operator computes different
things on the same bit pattern.  gdb 15.1 follows the DWARF 4 text in all the
cases below.  The examples are 64-bit; `-1` is 0xffffffffffffffff.

| # | expression (`DW_AT_location`)                                   | DWARF 4 / gdb | lldb 18.1.3                  | lldb 23.1.2          |
|---|-----------------------------------------------------------------|---------------|------------------------------|----------------------|
| 1 | `DW_OP_constu 0xfffffffffffffffb; DW_OP_abs`                   | 5             | 0xfffffffffffffffb           | 0xfffffffffffffffb   |
|   | `DW_OP_const1s -5; DW_OP_abs`                                   | 5             | 5                            | 5                    |
| 2 | `DW_OP_constu 0xffffffffffffffff; DW_OP_lit0; DW_OP_lt`         | 1 (-1 < 0)    | 0                            | 0                    |
|   | `DW_OP_const1s -1; DW_OP_lit0; DW_OP_lt`                        | 1             | 1                            | 1                    |
| 3 | `DW_OP_constu 0xfffffffffffffff0; DW_OP_lit4; DW_OP_shra`       | -1            | error: invalid load address  | 0x0fffffffffffffff   |
|   | `DW_OP_const1s -16; DW_OP_lit4; DW_OP_shra`                     | -1            | error: invalid load address  | -1                   |
| 4 | `DW_OP_lit7; DW_OP_const1s -2; DW_OP_mod`                       | 7 (unsigned)  | 1                            | 1                    |
| 5 | `DW_OP_lit1; DW_OP_lit1; DW_OP_eq; DW_OP_stack_value`           | value 1       | error: extracting data from value failed | value 1 (32-bit: `...; DW_OP_not; DW_OP_stack_value` gives 0xfffffffe) |
| 6 | `DW_OP_const1s -1`                                              | address 0xffffffffffffffff | error: invalid load address | error: invalid load address |

Rows 1 to 4 are one defect: `DW_OP_abs` on an "unsigned" entry is the
identity, the comparisons and `DW_OP_shra` on unsigned entries are unsigned
operations, and `DW_OP_mod` with a "signed" entry is a signed remainder.  In
DWARF 5 the typed operations (`DW_OP_const_type`, `DW_OP_convert`, ...)
introduce typed stack entries, but for the DWARF 4 (untyped) operations above
the signedness is fixed by the standard, not by the producing operation.  Row
5: a comparison result is a 32-bit scalar rather than an address-sized one
(lldb 18 cannot even extract it for an 8-byte variable).  Row 6: a memory
location at 0xffffffffffffffff is reported as "invalid load address" because
that value is `LLDB_INVALID_ADDRESS`; the address is legitimate in the
expression language (a probe rather than a fault), and gdb reports it.  The
"error: invalid load address" results in row 3 for lldb 18 are the same
symptom for a computed 0x0fffffffffffffff or -1 address.

**Reproducers.**  `lldb-typed-values-examples/<name>/prog.s` are
self-contained x86-64 programs (no libc): `_start` loads known values into
the registers and stops at `dw_here`; `.debug_info` (DWARF 4) has a
subprogram `main` with one variable of type `unsigned long` whose
`DW_AT_location` is the expression:

| directory              | row | variable               |
|------------------------|-----|------------------------|
| `t_abs_unsigned_const` | 1   | `t_abs_unsigned_const` |
| `t_lt_unsigned_const`  | 2   | `t_lt_unsigned_const`  |
| `t_shra_unsigned`      | 3   | `t_shra_unsigned`      |
| `t_mod_signed_top`     | 4   | `t_mod_signed_top`     |
| `m_eq_not`             | 5   | `m_eq_not`             |
| `m_addr_minus1`        | 6   | `m_addr_minus1`        |

    as -o prog.o prog.s && ld -static -o prog prog.o
    lldb -b -o 'b dw_here' -o run -o 'frame variable -L NAME' prog
    gdb -batch -ex 'break *dw_here' -ex run -ex 'print/x &NAME' prog     # for comparison

(`settings set target.disable-aslr false` may be needed before `run` in
containers where `personality(2)` is unavailable.)  `frame variable -L` shows
the computed location: an address, a register, `scalar` for a stack value, or
the error.

**Context.**  Found by linksem's DWARF expression cross-check
(`linksem/validation/dwarf-expr`), which evaluates the same expressions
with linksem's interpreter, gdb and lldb and compares the results.  In a random
sample of 2000 well-formed expressions (`make check-random SEED=7 N=2000 MAXOPS=12`),
104 (5.2%) differ between lldb 18.1.3 and gdb 15.1, all of them instances of the
rows above once minimised: 37 "extracting data from value failed" (row 5), 35
"invalid load address" or "invalid file address" for an address the expression
computes as -1 or another value lldb treats as invalid (row 6), and 32 different
values or addresses from the typed `abs`, `neg`-then-`abs`, `mod` and comparison
operations (rows 1 to 4).

**DWARF 5 typed operations (added 30 September 2026).**  With DWARF 5 units
(version 5 header, `.debug_loclists`, `.debug_addr`, base types `unsigned
char` .. `long` in the unit), lldb 18.1.3:

- does not implement `DW_OP_const_type`, `DW_OP_regval_type`,
  `DW_OP_deref_type`, `DW_OP_reinterpret` or `DW_OP_constx` ("Unhandled
  opcode DW_OP_const_type in DWARFExpression", and so on; gdb 15.1 implements
  all but `DW_OP_constx`);
- implements `DW_OP_convert` but ignores the signedness of the *source* type
  (section 2.5.1.6 converts the value, so a signed source sign-extends and an
  unsigned one zero-extends):

| # | expression (`DW_AT_location`)                                          | DWARF 5 / gdb / linksem | lldb 18.1.3          |
|---|------------------------------------------------------------------------|-------------------------|----------------------|
| 7 | `DW_OP_lit1; DW_OP_neg; DW_OP_convert <int>; DW_OP_convert <generic>`  | 0xffffffffffffffff      | 0xffffffff           |
| 8 | `DW_OP_const1u 0x80; DW_OP_convert <unsigned char>; DW_OP_convert <long>` | 0x80                 | 0xffffffffffffff80   |

  In row 7 the int -1 converted back to the generic (address-sized) type is
  zero-extended; in row 8 the unsigned char 0x80 converted to long is
  sign-extended: lldb appears to extend by the signedness of the *target*
  type (or of the previous entry) rather than of the value being converted.
  `DW_OP_convert` of a positive value, and truncations, agree.

Reproducers in `lldb-dwarf5-examples/`: `t_conv_neg_int` (row 7),
`t_conv_zext` (row 8), `t_const_type` and `t_constx` (unhandled opcodes);
same commands as above, `frame variable -L NAME`.  The `prog.s` are DWARF 5
units; the `T_i`, `T_uc`, `T_l` labels are the base type DIEs the operands
name.
