<!-- Claude: written by Claude, 30 September 2026, from the cross-check harness's results. -->
# gdb: three points about the DWARF 5 typed-stack operations

**Version:** GNU gdb (Ubuntu 15.1-1ubuntu1~24.04.1) 15.1, x86-64 Linux.

Found by linksem's DWARF expression cross-check (`linksem/validation/dwarf-expr`,
sets `typed` and `random-typed-seed1`), which evaluates DWARF 5 expressions with
linksem's interpreter, gdb and lldb and compares the results.  The programs are
DWARF 5 units (version 5 header, `.debug_loclists`, `.debug_addr`) defining base
types `uc`, `sc`, `us`, `s`, `ui`, `i`, `ul`, `l` (unsigned/signed char, short,
int, long).  Over 1000 random expressions using `DW_OP_const_type`,
`DW_OP_regval_type`, `DW_OP_deref_type`, `DW_OP_convert`, `DW_OP_reinterpret`
and `DW_OP_addrx` with the ordinary operators on typed operands, gdb and
linksem agree except for the three points below (and the `DW_OP_bra`-join
abort already reported).

**1. `DW_OP_convert` to a narrower type drops the sign of a negative value
whose magnitude does not fit the target type.**  For the location

    DW_OP_const_type <int> 4 d4 fe ff ff; DW_OP_convert <unsigned char>

(the int -300 converted to unsigned char) gdb gives the address 0x2c (44 = 300
mod 256); the conversion of -300 to an 8-bit unsigned type is 0xd4 (212).
More data points, all `DW_OP_const_type <int>` then `DW_OP_convert <unsigned char>`:

| int value    | expected | gdb 15.1 |
|--------------|----------|----------|
| -2           | 0xfe     | 0xfe     |
| -256         | 0x00     | 0x00     |
| -257         | 0xff     | 0x01     |
| -300         | 0xd4     | 0x2c     |
| 0xea69911c   | 0x1c     | 0xe4     |
| 0x80000000   | 0x00     | 0x00     |

and 0xea69911c to unsigned short gives 0x6ee4 instead of 0x911c, to signed
char 0xe4 (then sign-extended) instead of 0x1c.  The pattern is that when the
magnitude of a negative source value is at least 2^bits, gdb returns the
magnitude modulo 2^bits (the sign is lost); when it is smaller, the two's
complement result is right.  Widening conversions (`<signed char>` -1 to
`<unsigned short>`: 0xffff), same-size conversions and conversions from the
generic type are all right.  This looks like the same defect as the
`DW_OP_mul`/`DW_OP_shl` negative-overflow one in
`gdb-DW_OP_bra-internal-error.md`, in the handling of values that do not fit
the destination width.  lldb 18.1.3 does not implement `DW_OP_const_type`, so
it cannot be compared here; linksem gives the two's complement results.

**2. `DW_OP_plus_uconst` on a typed operand produces a generic-typed result.**
DWARF 5 section 2.5.1.4: `DW_OP_plus_uconst` "pops the top stack entry, adds
it to the unsigned LEB128 constant operand interpreted as the same type as the
operand popped from the top of the stack and pushes the result", and the
section's rule is that "the result of the operation which is pushed back has
the same type as the type of the operand(s)".  For

    DW_OP_const_type <unsigned char> 1 ff; DW_OP_plus_uconst 2

gdb gives 0x101: it adds in the generic type and the result is generic (a
following `DW_OP_reinterpret <unsigned int>` then fails with "DW_OP_reinterpret
has wrong size", and a following typed binary operation with "Incompatible
types on DWARF stack").  By the text the result is the unsigned char 1
(0xff + 2 modulo 256), which is what linksem computes.  lldb 18.1.3 agrees
with gdb here.  Since gdb and lldb agree with each other, perhaps the
committee's intent should be checked; the text seems clear.

**3. `DW_OP_constx` is not implemented.**  `DW_OP_constx 1; DW_OP_stack_value`
gives "Unhandled DWARF expression opcode 0xa2" (`DW_OP_addrx`, 0xa1, is
implemented and works).  lldb 18.1.3 does not implement it either.

**4. (DWARF 4, minor) A `DW_OP_implicit_value` shorter than the variable is
refused, a typed `DW_OP_stack_value` shorter than it is not.**  For an
8-byte `unsigned long` variable, `DW_OP_implicit_value 4 01 02 03 04` gives
"access outside bounds of object referenced via synthetic pointer" (lldb
18.1.3 gives 0x4030201, zero-filling the high-order bytes), while
`DW_OP_const_type <unsigned short> 2 34 12; DW_OP_stack_value` gives 0x1234,
zero-filled.  DWARF does not say what a consumer should do with a value
smaller than the object; the two cases might at least agree.

**Reproducers** (self-contained x86-64 programs, no libc; `_start` loads known
values into the registers and stops at `dw_here`; `.debug_info` is a DWARF 5
unit with the base types and one variable of type `unsigned long` whose
`DW_AT_location` is the expression):

| directory                          | variable                  | expression                                                      |
|------------------------------------|---------------------------|-----------------------------------------------------------------|
| `gdb-convert-narrowing-example/`   | `t_conv_narrow_m300_uc`   | `DW_OP_const_type <int> {d4,fe,ff,ff}; DW_OP_convert <unsigned char>` |
| `gdb-plus-uconst-typed-example/`   | `t_typed_plus_uconst`     | `DW_OP_const_type <unsigned char> {ff}; DW_OP_plus_uconst 2`   |
| `gdb-constx-example/`              | `t_constx`                | `DW_OP_constx 1; DW_OP_stack_value`                             |
| `../lldb-typed-values-examples/`   | (`m_implicit4` in `tests/minimal.txt`, DWARF 4; run the `minimal` set) | `DW_OP_implicit_value {01,02,03,04}` |

    as -o prog.o prog.s && ld -static -o prog prog.o
    gdb -batch -ex 'break *dw_here' -ex run -ex 'print/x &NAME' prog

For the third, `print/x NAME` shows the error.  `expr.txt` in each directory
is the expression in the harness's notation (`T_i`, `T_uc` name the base
types, whose DIEs are labelled `T_i:`, `T_uc:` in `prog.s`; the `DW_OP_convert`
operand is the unit-relative offset of that label, `.uleb128 T_uc-.Lcu_start`).
