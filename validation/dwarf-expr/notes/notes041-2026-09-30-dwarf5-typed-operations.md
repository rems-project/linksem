<!-- Claude: written by Claude, 30 September 2026. -->
# notes041: the harness extended to DWARF 5 units and the typed-stack operations

## The instruction

This extension was made as part of implementing DWARF 5 support in linksem
(`linksem/notes/notes008-2026-09-30-dwarf5-plan.md`, with the user's PS
answers).  The instruction that covered it, verbatim:

> I edited that notes008. Go ahead and do it, first the minimal part for
> kvm_nvhe.o, then test read-dwarf on that, then the rest.  Update and use the
> validation machinery for elf, dwarf, and dwarf-expr to check that the whole
> thing is sensible whenever appropriate.

and, in notes008's PS on the typed-stack question, "what's the choice for
that?", answered in that note: a faithful typed stack, cross-checked here.
The general rules in `notes039-2026-09-30-general-instructions.md` applied unchanged.

## What was added

- A `# dwarf 5` pragma in an expression file makes `dwexpr_build` emit a
  DWARF 5 unit: version 5 header, `.debug_loclists` (offset pairs, base
  address entries, start/length and start/end decoys) instead of
  `.debug_loc`, and a `.debug_addr` table with `DW_AT_addr_base`.
- Eight base types (`T_uc` .. `T_l`) in every unit, named in expressions as
  the type operands of `DW_OP_convert`, `DW_OP_reinterpret`,
  `DW_OP_const_type`, `DW_OP_regval_type` and `DW_OP_deref_type`; the encoder
  emits them as `.uleb128 T_x-.Lcu_start` (the byte-offset arithmetic for
  branches relies on those offsets being below 128, which the short strings
  in the unit guarantee).  `DW_OP_const_type` is written with the block only,
  its size operand implied (linksem's operand type `OAT_block1`).
- `dwexpr_gen --typed`: a stack of types instead of a depth, the typed pushes,
  `DW_OP_convert`/`reinterpret` steps, a `DW_OP_convert` inserted before a
  binary operation whose operands differ in type, and a final conversion of
  a typed result to the generic type in seven cases out of eight.  The
  untyped output is unchanged (the `random-seed1` sets still match).
- Sets `typed` (hand-written, 63 expressions) and `random-typed-seed1`
  (1000), with expected results for both architectures.
- `dwexpr_eval` renders an implicit value shorter than 8 bytes as the value
  zero-extended, as gdb reads a typed `DW_OP_stack_value` (before, such values
  were `incomparable`).

## What was found

linksem's typed stack agrees with gdb 15.1 throughout, except for three gdb
points now in `upstream-discrepancy-reports/gdb-DWARF5-typed-operations.md`:
narrowing conversions of negative values whose magnitude does not fit lose
the sign (the same family as gdb's `DW_OP_mul` overflow bug); `DW_OP_plus_uconst`
on a typed operand yields a generic result, against section 2.5.1.4 (lldb
agrees with gdb; linksem follows the text); `DW_OP_constx` is unimplemented.
lldb 18.1.3 implements none of the typed operations but `DW_OP_convert`, and
that ignores the source type's signedness (added to the lldb report).

Two decisions where DWARF 5 is silent were taken gdb's way and are recorded
in `src/dwarf.lem`: a typed value taken as an address is its bit pattern,
zero-extended; `DW_OP_mod` in a signed base type is the type's (C) remainder,
the generic type's `DW_OP_mod` staying unsigned.

An out-of-range `DW_OP_addrx` index cannot be tested: gdb rejects the whole
unit at load time ("DW_FORM_addr_index pointing outside of .debug_addr
section"), so none of its variables can be evaluated.

## Environment note

In this session `personality(2)` was unavailable (`setarch -R` fails), so
ASLR could not be disabled and the lldb result files of the frame sets, which
contain live stack addresses, differ from the expected files in those lines;
the linksem and gdb files (evaluated from the recorded state) are unaffected.
