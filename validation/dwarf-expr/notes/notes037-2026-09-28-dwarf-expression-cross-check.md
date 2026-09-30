# Claude: cross-checking DWARF expression evaluation between linksem, gdb and lldb

Claude: this note is written by Claude, for the experiment Peter asked for in
`notes036-2026-09-28-dwarf-experiment.md`: infrastructure to test the
interpretation of DWARF expressions, built in scratch space
(`~/scratch-dwarf-expr/`), with a summary of the results and a plan for a
proper implementation.  No file in the checkouts was changed apart from this
note.

## 0. Headline

All six steps of the plan were done and the machinery runs end to end on
x86_64 (natively) and aarch64 (under qemu-user), for the hand-written and
random expressions.  The three evaluators disagree a lot, in ways that are now
isolated to one-line reproducers:

- **linksem** (`dwarf.lem`) has ten distinct defects in its expression
  evaluator, the most consequential being reversed operands for every
  non-commutative binary operation (`minus`, `mod`, `shl`, `shr`, `shra`),
  `DW_OP_pick`/`DW_OP_plus_uconst` never evaluating, a 32-bit "half" in the
  64-bit arithmetic context, and the frame-table row selection taking the
  first row of an FDE rather than the last one at or before the pc.  It also
  lacks `div`, the six comparisons, `skip` and `bra`.
- **gdb 15.1** crashes with an internal error on any expression in which a
  `DW_OP_bra` target is also reached by fall-through
  (`lit1; lit1; bra 1; not; nop`), and returns the dividend for `mod` by zero.
- **lldb 23.1.2** carries a signed/unsigned "type" on each stack entry, taken
  from how the value was produced, and lets it change the meaning of `abs`,
  `shra`, `mod` and the comparisons (all specified as typeless, signed except
  `mod`), so `constu 0xff..fb; abs` is a no-op but `const1s -5; abs` is 5; it
  also cannot report the address 0xffffffffffffffff and gives a 32-bit width
  to comparison results.
- gdb otherwise follows the DWARF 4 text on every case tried; where gdb and
  lldb agree they are the reference for fixing linksem.

## 1. What was built

Everything is under `~/scratch-dwarf-expr/` (see its README):

| piece                                  | what                                                                                                                   |
|----------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| `lem/dwarf_expr_encode.lem` (216 lines) | step 2: `encode_operations : endianness -> compilation_unit_header -> list operation -> error (list byte)`, the inverse of `Dwarf.parse_operations`, with LEB128 and fixed-size encoders, `operation_of_name` (builds an operation record from the `operation_encodings` table, checking operand kinds) and `round_trip_ok`.  Built against the linksem sources by giving lem the 35 modules up to `dwarf.lem` as input-only (`-i`) files |
| `ocaml/lib` (334 lines)                 | textual expression syntax (`NAME: DW_OP_x a; DW_OP_y`, symbol operands `dw_mem+16` for `DW_OP_addr`, branch operands counted in operations and converted to byte offsets), the bridge to the Lem encoder, two architecture descriptions (register numbering, the register values, CFA rule, prologue/epilogue text), the DWARF 4 assembly emitter, and the state file |
| `bin/dwexpr_build`                      | expressions → `prog.s` (one `DW_TAG_variable` per expression under a `main` subprogram with `DW_AT_frame_base = DW_OP_call_frame_cfa`) and `state.txt`; every expression is first round-tripped through the encoder and linksem's parser |
| `bin/dwexpr_eval` (92 lines)            | step 3: parses the linked ELF with linksem, builds an `evaluation_context` from the state file (registers) and the ELF image (memory), evaluates each variable's `DW_AT_location` with `Dwarf.evaluate_location_description`, prints `addr`/`reg`/`value`/`composite`/`error` |
| `scripts/gdb_eval.py`, `gdb_run.py`     | step 4: gdb Python; `&NAME` gives the address without reading memory, the refusal message names the register for a register location, "not an lvalue" leads to printing the value; the wrapper restarts gdb after an internal error and marks the offending variable |
| `scripts/lldb_eval.py`                  | step 4: lldb Python (`SBFrame.FindVariable`); the address comes from `GetLoadAddress` or, when the memory is unreadable, from the "read memory from 0x... failed" message; register names and `scalar` locations are classified |
| `bin/dwexpr_gen` (124 lines)            | step 5: random expressions up to MAXOPS operations, tracking the stack depth so every operand exists; loads only from `dw_mem`; operands biased to boundary values; some whole-register locations and `stack_value` endings |
| `scripts/compare.py`                    | step 6: classifies each expression (agree, linksem-unsupported, linksem-differs, gdb-differs, lldb-differs, all-differ, incomparable) and lists gdb-versus-lldb differences separately; writes `report.md` |
| `tests/basic.txt` (76), `tests/minimal.txt` (74) | every operation at least once; and one-line reproducers of each difference found |
| `Makefile`                              | `make basic|minimal|random ARCH=x86_64|aarch64 [N= SEED= MAXOPS=]`                                                     |

Design points worth recording:

- **One program, many variables.**  Each run assembles one static,
  non-PIE, libc-free program whose `_start` loads sixteen known values into
  the registers (DWARF numbers 0-5, 8-15, plus a constant "frame pointer" so
  that the CFA is a known constant) and stops at `dw_here`; the expressions
  are the `DW_AT_location`s of variables of one subprogram.  So all three
  evaluators see exactly the same bytes, registers, CFA and memory
  (`dw_mem[i] = 37 i + 11 mod 256`), and one debugger session evaluates a
  thousand expressions.  Stack memory is never dereferenced because its
  contents differ between debuggers.
- **The linker resolves `DW_OP_addr`.**  A symbolic address operand is
  emitted as `.byte 0x03; .8byte dw_mem+16`; everything else is bytes from the
  Lem encoder.  linksem reads the final ELF, so it exercises linksem's own
  parser on the same bytes the debuggers read.
- **Results are classified, not printed values.**  A memory location is the
  computed address (never read), a register location the DWARF register
  number, an implicit value the number; errors are compared only by kind.
- **aarch64** uses the same expressions under `qemu-aarch64 -g` with
  gdb-multiarch and lldb's `gdb-remote`; the results were identical to
  x86_64's except for register naming, as expected for architecture-neutral
  expressions.
- **lldb** is not installed on this machine and needs root to install; the
  LLVM 23.1.2 release tarball (`bin/lldb`, `liblldb.so`) plus a standalone
  CPython 3.14 (for `libpython3.14.so`) works.

## 2. Results

Runs (all also in `output/*/report.md` in the scratch directory):

| run                          | expressions | agree | linksem-unsupported | linksem-differs | gdb/lldb differ | gdb aborted |
|------------------------------|-------------|-------|---------------------|-----------------|-----------------|-------------|
| x86_64 basic                 |          76 |    37 |                  12 |              21 |               8 |           0 |
| x86_64 minimal               |          74 |    21 |                  20 |              15 |              27 |           2 |
| x86_64 random seed 1, ≤ 8 ops |        1000 |   313 |                 159 |             509 |              33 |          14 |
| x86_64 random seed 2, ≤ 12 ops |       1000 |   235 |                 210 |             506 |              85 |          34 |
| aarch64 basic / minimal / random seed 1 | as x86_64 | same | same             | same            | same            | same        |

"linksem-differs" is dominated by the operand-order defect; once linksem is
fixed the interesting residue is the gdb-versus-lldb column.

### 2.1 linksem (`src/dwarf.lem`, `evaluate_operation_list` and `operation_encodings`)

| #  | defect                                                                                     | reproducer (tests/minimal.txt)                            | linksem            | gdb and lldb              |
|----|--------------------------------------------------------------------------------------------|-----------------------------------------------------------|--------------------|---------------------------|
| L1 | `OpSem_binary f` is applied as `f top second`; the DWARF text is second-op-top             | `DW_OP_lit7; DW_OP_lit9; DW_OP_minus`                     | 0x2                | 0xfffffffffffffffe        |
| L2 | `shl`/`shr`/`shra` likewise reversed, and `shl` not reduced mod 2^64                      | `DW_OP_lit1; DW_OP_const1u 63; DW_OP_shl`                 | 0x7e               | 0x8000000000000000        |
| L3 | `arithmetic_context_of_cuh` sets `ac_half` to 2^32 (2^16) for 8-byte (4-byte) addresses; used by `abs`, `neg`, signed literals | `DW_OP_constu 0x100000000; DW_OP_abs`; `DW_OP_const8s 0x72143e07cbe650cd` | 0xffffffff00000000; exception `partialTwosComplementNaturalFromInteger` | 0x100000000; 0x72143e07cbe650cd |
| L4 | `neg` computes `ac_max - v` (off by one)                                                   | `DW_OP_lit5; DW_OP_neg`                                   | ...fffa (-6)       | ...fffb (-5)              |
| L5 | `abs` fails on -1 (`v = ac_max`) and wraps the minimum; the two cases are swapped          | `DW_OP_const1s -1; DW_OP_abs` (via `breg2`)               | error              | 1                         |
| L6 | `OpSem_stack` is only matched with an empty operand list, so `pick` and `plus_uconst` never evaluate | `DW_OP_const1s -1; DW_OP_plus_uconst 2`          | error "bad OpSem invocation" | 1               |
| L7 | `DW_OP_regx` has `OpSem_lit`: the register number is pushed as an address                   | `DW_OP_regx 12`                                           | addr 0xc           | reg 12                    |
| L8 | `find_cfa_table_row_for_pc` takes the first row with `loc <= pc`; rows are ascending, so the FDE's initial row is always used | `DW_OP_call_frame_cfa`                | CFA from the wrong row (here rsp+8, reported as bad register 7) | 0x700000000010 |
| L9 | `Uint64_wrapper.of_bigint` reduces modulo 2^64-1, so the value 2^64-1 becomes 0 (affects `stack_value`, `bytes_of_natural`) | `DW_OP_constu 0xffffffffffffffff; DW_OP_stack_value` | value 0x0   | value 0xffffffffffffffff  |
| L10 | not implemented: `div`, `eq ne lt le gt ge`, `skip`, `bra` (`OpSem_not_supported`)        | `DW_OP_const1s -7; DW_OP_lit2; DW_OP_div`                 | error              | -3                        |

Also observed: `mod` by zero is not reached because of L1; `DW_OP_implicit_value`
shorter than the variable is returned as its bytes (gdb errors, lldb
zero-extends); composite locations evaluate correctly (gdb and lldb report
them as values, so the harness marks them incomparable).

### 2.2 gdb 15.1

| #  | behaviour                                                                                                                | reproducer                                                     |
|----|--------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| G1 | internal error `dwarf2/loc.c:1881: dwarf2_get_symbol_read_needs: Assertion 'visited_ops.find (op_ptr) == visited_ops.end ()' failed` when a `bra` target is also reached by falling through (its static pre-pass visits the join twice); gdb aborts, so the whole session is lost | `DW_OP_lit1; DW_OP_lit1; DW_OP_bra 1; DW_OP_not; DW_OP_nop` (a branch to the end of the expression is fine) |
| G2 | `mod` by zero returns the dividend rather than an error (`div` by zero is "Division by zero")                             | `DW_OP_lit20; DW_OP_lit0; DW_OP_mod` → 0x14                     |
| G3 | shift counts ≥ 64 saturate (`shl`/`shr` → 0, `shra` → sign), with a warning; counts are taken as unsigned 64-bit         | `DW_OP_const1s -16; DW_OP_const1u 68; DW_OP_shra` → -1          |

In the random runs 1.4% (≤ 8 ops) to 3.4% (≤ 12 ops) of expressions hit G1.

### 2.3 lldb 23.1.2

| #  | behaviour                                                                                                                 | reproducer                                                          | lldb                 | gdb (and DWARF 4 text) |
|----|---------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|----------------------|------------------------|
| D1 | `abs` is the identity on an "unsigned" entry (from `constNu`, `constu`, `bregN`, `deref`); only `constNs`/`consts` entries are signed | `DW_OP_constu 0xfffffffffffffffb; DW_OP_abs`               | 0xfffffffffffffffb   | 5                      |
| D2 | comparisons on unsigned entries are unsigned                                                                              | `DW_OP_breg2 0; DW_OP_lit0; DW_OP_lt` (register 2 = -1)             | 0                    | 1                      |
| D3 | `shra` on an unsigned entry is a logical shift                                                                            | `DW_OP_breg14 0; DW_OP_lit4; DW_OP_shra` (register 14 = -16)        | 0x0fffffffffffffff   | 0xffffffffffffffff     |
| D4 | `mod` with a signed entry is a signed remainder (DWARF: unsigned)                                                         | `DW_OP_lit7; DW_OP_const1s -2; DW_OP_mod`                            | 1                    | 7                      |
| D5 | a comparison result is 32 bits wide                                                                                       | `DW_OP_lit1; DW_OP_lit2; DW_OP_lt; DW_OP_neg; DW_OP_stack_value`     | 0xffffffff           | 0xffffffffffffffff     |
| D6 | the address 0xffffffffffffffff cannot be reported (it is `LLDB_INVALID_ADDRESS`): "invalid load address"; the same message for an invalid scalar (`mod` by zero) | `DW_OP_const1s -1`                       | error                | addr 0xffffffffffffffff |
| D7 | a shift count is truncated to 32 bits before the ≥ 64 check                                                               | `DW_OP_lit1; DW_OP_constu 0x100000004; DW_OP_shl` → (both 0 here); seen in random run seed 2 v79 with `DW_OP_call_frame_cfa` as the count | masked | saturated |
| D8 | on aarch64, `DW_OP_regx 100` (SVE z4) is reported as memory address 0 rather than a register location                    | `DW_OP_regx 100`                                                     | addr 0x0             | reg z4                 |

D1-D4 are one root cause (typed scalars where DWARF 4 expressions are
untyped); D5 probably the same.  gdb 15 and the DWARF 4 text agree on all
of them.

## 3. Plan for a proper implementation

The infrastructure is small (about 1,300 lines including tests) and the
scratch version is already "clean reusable" in shape; the work is to move it
to the right places and fix linksem against it.

1. **linksem: the encoder** (`lem/dwarf_expr_encode.lem`) goes into
   `linksem/src/` as a module after `dwarf.lem` (or into `dwarf.lem` beside
   `parse_operations`; a separate module keeps the diff conservative).  Its
   round-trip check becomes a linksem validation test.  Choice point: the
   `operation_of_name` builder uses the first table entry with a given name;
   `operation_encodings` has one duplicated name (`DW_OP_GNU_entry_value`),
   which should be deduplicated.
   
PS: I deduplicated that.

2. **linksem: fix the evaluator** (section 2.1, L1-L9) and implement L10
   (`div` signed, comparisons signed, `skip`/`bra` as byte offsets into the
   operation list, which needs the parser to record each operation's byte
   offset or the evaluator to re-encode; the encoder makes the latter easy).

PS: the parser should record the byte offset; we should not be re-encoding

   Each fix is one commit, checked by the basic and minimal sets agreeing with
   gdb (the expected residue after the fixes: G1-G3 and D1-D8 only).  Choice
   points: `mod` by zero and shift counts ≥ 64 are unspecified; follow gdb
   (error for `div`, saturating shifts) or make them explicit failures.
   
PS: check the DWARF pdf specification.  If the above is correct, follow gdb and document that this is making sometheing specified.
   
   `DW_OP_implicit_value` shorter than the object: keep returning the bytes.
3. **the harness** goes into `read-dwarf-private3/test-dwarf-expr/`

PS no, put the harness in linksem/validate/test-dwarf-expr [Claude: it went into linksem/validation/test-dwarf-expr, later renamed to validation/dwarf-expr]

   in the
   pattern of `objcheck`: an OCaml dune project using the `linksem` library
   (generator, builder, evaluator), `scripts/`, `tests/`, a Makefile with the
   `basic`/`minimal`/`random` targets, output under `output/`, and a README.

PS: include the design notes in that README
PS: include in that directory the notes and other instructions (the initial notes036 prompt, this note, and other instructions (if any) I have given you for this experiment).
PS: the harness should support regression testing, extensive validation runs, and running single examples.

   Choice points: (a) x86_64 native only, or both, with the aarch64 path
   needing qemu-user and gdb-multiarch (both present here);
   
PS: both, and (although we can't properly test this right now) this should run cleanly on either an x86 or Arm machine, using native execution and testing the other arch with an emulator if available (and telling the user what to install if not, but letting them run it without).
   
   (b) how lldb is
   provided: an apt `lldb-18`/`lldb-19` package (needs root; the release
   tarball route used here is 2.3 GB) or leave lldb optional, with the
   Makefile skipping it when absent;
   
PS: on ubuntu, lldb should be installed with "sudo apt-get install lldb", not any specific version.  I did that here. The harness should prompt the user to install it if it's missing, just as for gdb.   
   
   (c) whether `report.md` files of
   reference runs are committed (they are small and useful as a record).
   
PS: commit them, and make it easy to identify diffs between different runs.   
   
4. **reports upstream**: G1 to gdb (bugzilla, with the 5-operation
   reproducer and the `.s` file); D1-D6 to LLVM (D6 is a known design limit,
   the rest may be known: the typed-scalar behaviour looks deliberate for
   DWARF 5 typed operations but is wrong for untyped DWARF 4 ones).  Choice
   point: whether Peter wants these reported from this project.
   
PS: for any discrepency, the infrastructure should automatically generate a minimal standalone example and the discrepency, suitable for reporting. 
PS: for these discrepencies, write those two reports for upstream gdb and llvm, using the above, and check them in to an "upstream-discrepency-reports" directory
   
5. **read-dwarf** consumers of `evaluate_location_description` (frame-base
   and variable-location display) will change behaviour after L1/L8 are
   fixed; re-make `test-pkvm` and `test-smoke` and inspect the diffs.

PS: yes

Difficulties met, for the record: lldb's `p &v` JIT-materialises the variable
(reads memory) so cannot be used; `frame variable -L` and `SBValue` only give
the address when it is readable, hence the message parsing; ASLR cannot be
disabled in this sandbox (`personality` fails) so lldb needs
`target.disable-aslr false`; the cross `aarch64-linux-gnu-gcc` driver here
calls the native `as`, so `as`+`ld` are used directly; gdb's abort kills the
batch, hence the restarting wrapper; the "frame pointer" is a constant so
that the CFA is known to linksem without a stack dump, at the cost of gdb not
being able to unwind past `main` (harmless).

## 4. Reproducing

```
cd ~/scratch-dwarf-expr
make tools                       # lem (opam switch ocaml551) and dune
make basic ARCH=x86_64           # output/x86_64-basic/report.md
make minimal ARCH=aarch64
make random ARCH=x86_64 N=1000 SEED=2 MAXOPS=12
```
