# Claude: what the tests cover, and what they do not

Claude: this note (30 September 2026) assesses the coverage of the harness's
tests from four viewpoints: the DWARF 4 specification (`doc/DWARF4.pdf`,
section 2.5.1 and the table in section 7.7.1), linksem's `src/dwarf.lem`, and
the gdb and lldb implementations.  The figures are from the 100000-expression
run (`make check-random SEED=17 N=100000 MAXOPS=12`) and the committed sets.

## Against the DWARF 4 specification

Every operation of section 2.5.1 that linksem implements is exercised, and the
random generator covers all of them with large counts: in the 100000 run each
arithmetic and comparison operator appeared 3400 to 3600 times, the literal
and register forms 5000 to 36000 times, and `DW_OP_deref_size` with every size
from 1 to 8.  The operand encodings are all exercised except
`OAT_dwarf_format_t`, which only `DW_OP_call_ref` and the implicit-pointer
operations use, both unsupported.

Not covered:

- **Operations linksem does not implement**: `DW_OP_xderef`,
  `DW_OP_xderef_size`, `DW_OP_push_object_address`, `DW_OP_call2`,
  `DW_OP_call4`, `DW_OP_call_ref`, `DW_OP_form_tls_address`.  The harness
  cannot test what fails by construction, but `call2`/`call4` are testable in
  principle (a `DW_TAG_dwarf_procedure` DIE in the same unit); TLS and the
  object address need program context the test program does not provide.
- **`DW_OP_bit_piece`** is never generated or tested, and `DW_OP_piece` appears
  once (`basic.txt`).  Both are classified `incomparable` anyway, because gdb
  and lldb report a composite location as a value, so the debuggers never
  check the structure of linksem's composite result.
- **Configurations**: only the DWARF32 format, 8-byte addresses and
  little-endian.  The 4-byte arithmetic context (`ac_bitwidth = 32`) and
  big-endian operand parsing are untested; the 32-bit half of the `ac_half`
  defect (cross-check item L3) would not have been caught by the harness on
  its own.
- **Branch shapes**: the generator only branches forward over a single
  operation (`DW_OP_skip 1`, `DW_OP_bra 1`).  Backward branches (loops, and
  so the `evaluation_fuel` bound), branches over several operations, and
  nested branches are untested.  Every gdb crash found is the one-operation
  join case.
- **Stack depth**: expressions have at most 15 operations, so `DW_OP_pick`
  indices above 4 are essentially untested (18702 `pick 0`, 81 `pick 4` in the
  100000 run) and the stack is never deep.

## Against `src/dwarf.lem`

The expression evaluator proper, `evaluate_operation_list`, is well covered;
the paths around it are not:

- **Location lists** were not exercised when this note was first written;
  `tests/frames.txt` and `random-frames-seed1` now cover `AV_sec_offset`
  locations, with and without a base address selection entry (added later on
  30 September 2026; they found that the offsets were compared unadjusted and
  the selection entry misparsed).  `AV_block` locations (the DWARF 2/3 forms)
  are still untested.
- **Frame base**: the same sets now cover `DW_OP_call_frame_cfa`, a register,
  a `bregN`, a longer expression and a location list as `DW_AT_frame_base`
  (finding that a register frame base was rejected).  Still untested: a CFA
  given by a `CR_expression` (linksem `failwith`s), CFA rules other than
  `CR_register` (frame pointer plus 16), and the recursion of `DW_OP_fbreg`
  where the frame base itself uses `fbreg`, an open question in the code.
- **Register and memory read failures** (`RRR_not_currently_available`,
  `RRR_bad_register_number` for a real register, `MRR_bad_address` on real
  reads) are never hit, because reads only go to the known registers and to
  `dw_mem`.
- **Parser robustness**: nothing malformed is ever fed in.  Truncated
  LEB128s, unknown opcodes, blocks longer than the expression and trailing
  bytes are untested, though `parse_operations_bs`, `parse_operation` and the
  offset recording have such paths.
- **The encoder** (`dwarf_expr_encode.lem`) is checked only by the round trip
  through linksem's own parser, so an encoding error mirrored in the parser
  would pass; the debuggers reading the same bytes correctly is the only
  independent check, and it is indirect.

## Against gdb and lldb

The harness compares results, not implementations, so it says nothing about
code paths in the debuggers that no generated expression reaches.  From what
is known of the two evaluators (not verified against their sources here):
both implement the DWARF 5 typed operations (`DW_OP_const_type`,
`DW_OP_regval_type`, `DW_OP_deref_type`, `DW_OP_convert`,
`DW_OP_reinterpret`), `DW_OP_entry_value`, `DW_OP_implicit_pointer`,
`DW_OP_addrx`/`DW_OP_constx` and the GNU equivalents, none of which linksem
evaluates or the harness generates.  lldb's typed-scalar behaviour
(`upstream-discrepancy-reports/lldb-typed-stack-values.md`) is only observed
through the DWARF 4 operators, so how it treats genuinely typed DWARF 5 stacks
is unexamined.  Composite and implicit-pointer locations, where the debuggers
do substantial work, are outside the comparison.

## What to add first

In rough order of value:

1. (done 30 September 2026) location lists and non-CFA frame bases;
2. backward and multi-operation branches, which also exercise the fuel bound;
3. a 32-bit address-size target and a big-endian one;
4. `DW_OP_bit_piece`, with a way to compare composites (for instance asking
   the debuggers for each piece's location rather than the value);
5. malformed-expression fuzzing of the parser;
6. `DW_OP_call2`/`call4` through a `DW_TAG_dwarf_procedure`.

The remaining unsupported operations need TLS, object-address or
`.debug_addr` context, which is a larger change to the test program.
