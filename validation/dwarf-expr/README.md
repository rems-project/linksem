<!-- Claude: this file is written by Claude (30 September 2026). -->
# Cross-checking DWARF expression evaluation: linksem against gdb and lldb

This harness evaluates DWARF 4 location expressions with three
evaluators, linksem's interpreter (`Dwarf.evaluate_location_description` in
`src/dwarf.lem`), gdb and lldb, and reports where they differ.  It found the
eleven linksem defects fixed in the commits of 30 September 2026 (see
`notes/notes037-...md`, section 2.1, and the git log of `src/dwarf.lem`), one
gdb crash and a family of lldb deviations from the DWARF 4 text
(`upstream-discrepancy-reports/`).  It serves as a regression test for
linksem's evaluator, as an extensive random validation, and as a way to try a
single expression against all three.

It's produced by Claude based on an initial prompt by Peter Sewell and
Stephen Kell, and later prompting by PS, recorded in the notes/.

## Running

Prerequisites: the linksem library installed in the opam switch
(`make -C ../../src && make -C ../../src install`), dune, Python 3, and the
external tools below.  `make tools` says what is installed and, for anything
missing, the Ubuntu/Debian package to install:

| tool                                | package (Ubuntu)                 | needed for                                   |
|-------------------------------------|----------------------------------|----------------------------------------------|
| `as`, `ld`                          | `binutils`                       | the host architecture's test programs        |
| `aarch64-linux-gnu-as`/`-ld` or `x86_64-linux-gnu-as`/`-ld` | `binutils-aarch64-linux-gnu` / `binutils-x86-64-linux-gnu` | the other architecture |
| `qemu-aarch64` / `qemu-x86_64`      | `qemu-user`                      | running the other architecture's programs    |
| `gdb`                               | `gdb`                            | the gdb evaluator, host architecture         |
| `gdb-multiarch`                     | `gdb-multiarch`                  | the gdb evaluator, other architecture        |
| `lldb` with Python scripting        | `lldb`                           | the lldb evaluator                           |

The harness runs with whatever is present: an evaluator or architecture whose
tools are missing is skipped, its result file says `# not run: ...` with the
package to install, and the comparison is over the evaluators that ran.  The
host may be x86_64 or aarch64; the host's architecture runs natively and the
other one under qemu-user with the debuggers attached to its gdb stub.

    make build                          # the OCaml programs
    make check-native-arch              # regression, host architecture (basic, minimal, frames, typed, random-seed1, random-frames-seed1, random-typed-seed1)
    make check-all-archs                # both architectures
    make check-random SEED=7 N=2000 MAXOPS=12   # an extensive random run, with minimal examples of every disagreement
    make check-one EXPR='DW_OP_lit1; DW_OP_lit2; DW_OP_minus'   # a single expression
    make minimize RUN=output/x86_64-random-seed1          # minimal standalone examples of a run's disagreements
    make diff A=output/x86_64-basic B=expected/x86_64-basic   # what changed between two runs
    make set-expected-results SET=basic # adopt a run's results as the expected ones

`ARCH=aarch64` (or `x86_64`) selects the architecture for `check-native-arch`,
`check-random`, `check-one` and `set-expected-results`.  Everything is written under `output/<arch>-<run>/`.

## What a run produces

`output/<arch>-<run>/` holds `exprs.txt` (the expressions), `prog.s` and
`prog` (the test program), `state.txt` (the register values, the CFA rule and
the stop label of each function), one result file per evaluator (`linksem.txt`, `gdb.txt`,
`lldb.txt`, each a line `NAME = RESULT` per expression), and `report.md`.  A
result is one of

    addr 0xH        the expression denotes memory at H (the address is not read)
    reg N           a register location, by DWARF register number
    value 0xH       an implicit value (DW_OP_stack_value, DW_OP_implicit_value)
    implicit {..}   linksem only: an implicit value shorter than 8 bytes, as bytes
    composite ...   linksem only: a composite location (the debuggers report a value)
    error: MESSAGE  the evaluator's own message

The report classifies every expression: `agree`, `linksem-unsupported`,
`linksem-differs` (the debuggers agree with each other and not with linksem),
`gdb-differs`, `lldb-differs`, `all-differ`, `gdb-crash` (gdb aborted with an
internal error), `incomparable` (composite or short implicit), `not-run`.  It
lists the disagreements, the operations involved in each class, and the
expressions on which gdb and lldb differ from each other.  Results are compared
by kind and number; error messages are not compared.

Large sets are split into several programs (`BATCH=2000` variables each, run
`JOBS` at a time): the debuggers' start-up and gdb's restart after a crash
grow with the program's DWARF, so 100000 expressions take minutes rather than
hours.

`make minimize` (also run by `make check-random` unless `MINIMIZE=no`) reduces
each disagreeing expression by deleting operations while the class and the
kinds of the three results (and an error's message) are preserved, evaluating all candidates in one batch per round, and
writes `output/<arch>-<run>/discrepancies/<name>/`: a one-variable test program
(`prog.s`, `prog`), the three results, and a `README.md` with the commands that
reproduce them with plain `as`, `ld`, `gdb` and `lldb`, no harness needed.
These are what an upstream report should contain.

## Location lists and frame bases

An expression line may carry annotations on the variable's name
(`ocaml/lib/expr.ml`):

    NAME@loclist: ...          the DW_AT_location is a location list in .debug_loc whose
                               entry at the stop is the expression; decoy entries
                               (DW_OP_lit1 before the stop, DW_OP_lit2 after) surround it
    NAME@loclist-base: ...     the same, after a base address selection entry
    NAME@fb=KIND: ...          the variable belongs to the function whose DW_AT_frame_base
                               is of that kind

The test program has one "function" per frame-base kind, each a few nops with
its own stop label, all under the single FDE of `_start`, and the debuggers
stop at each in turn (`state.txt` lists `stop FUNCTION LABEL`).  With the frame
pointer register `fp` (DWARF 6 on x86_64, 29 on aarch64) holding the constant
0x700000000000, the kinds and the frame base they give are:

| kind      | function     | DW_AT_frame_base                              | frame base   |
|-----------|--------------|-----------------------------------------------|--------------|
| `cfa`     | `main`       | `DW_OP_call_frame_cfa` (the default)          | fp + 16      |
| `reg`     | `f_reg`      | `DW_OP_regN` of fp (what clang emits)         | fp           |
| `breg`    | `f_breg`     | `DW_OP_bregN 32`                              | fp + 32      |
| `expr`    | `f_expr`     | `DW_OP_bregN 0; DW_OP_const1u 48; DW_OP_plus` | fp + 48      |
| `loclist` | `f_loclist`  | a location list whose entry at the stop is `DW_OP_bregN 64` | fp + 64 |

`tests/frames.txt` covers each kind, each location-list form, and their
combinations; `dwexpr_gen ... --frames` gives random expressions random
annotations from a second generator, so the expressions are those of the run
without `--frames`.  These found two linksem defects (location lists were
compared against raw offsets rather than base-relative ones, with the base
address selection entry misparsed; and a register frame base was rejected by
`DW_OP_fbreg`), both fixed on 30 September 2026.  One `lldb-differs` residue is
a harness artefact: `DW_OP_call_frame_cfa` in a function other than `main`
gives lldb a stack-pointer-based CFA rather than the FDE's `fp + 16`, since
those functions have no CFI of their own start; real functions always do.

## DWARF 5 units and the typed stack

A set whose file carries the pragma `# dwarf 5` among its leading comment
lines is built as a DWARF 5 unit (`Dwarf_asm.emit ~version:5`): a version 5
unit header (`DW_UT_compile`), the location lists in `.debug_loclists`
(`DW_LLE_offset_pair` entries relative to the unit base, after a
`DW_LLE_base_address` entry for `@loclist-base`, with `DW_LLE_start_length`
and `DW_LLE_start_end` decoys), and a `.debug_addr` table (`dw_mem`,
`dw_mem+16`, `_start`) with `DW_AT_addr_base` on the unit, so `DW_OP_addrx`
and `DW_OP_constx` can be tested.  Both versions define eight base types
(`T_uc`, `T_sc`, `T_us`, `T_s`, `T_ui`, `T_i`, `T_ul`, `T_l`: unsigned and
signed char, short, int and long; `T_ul` is the variables' type) whose DIEs
are labelled with those names, so an expression can write
`DW_OP_convert T_uc`, `DW_OP_const_type T_i {1c,91,69,ea}` (the block is the
value, its size operand implied), `DW_OP_regval_type 2 T_s`,
`DW_OP_deref_type 2 T_us`, `DW_OP_reinterpret T_ui`; the encoder emits such a
type operand as `.uleb128 T_x-.Lcu_start` and keeps the base types' offsets
below 128 so that its byte-offset arithmetic for branches stays right.
`dwexpr_gen --typed` (set `random-typed-seed1`) tracks a stack of types,
inserts a `DW_OP_convert` so that binary operations see operands of one type,
and usually converts a typed result back to the generic type (one expression in
eight is left typed).  `tests/typed.txt` (63 expressions) is the hand-written
set: conversions in all directions, typed constants, register and memory
reads, arithmetic and comparisons in signed and unsigned narrow types,
reinterpretation, typed `DW_OP_stack_value`, the address table, and the
errors (mixed types, size mismatch).

linksem's typed stack (`src/dwarf.lem`, DWARF 5 section 2.5.1; the choice is
recorded in `linksem/notes/notes008`) agrees with gdb 15.1 on all of them and
on the 1000 random typed expressions except for gdb's own three points in
`upstream-discrepancy-reports/gdb-DWARF5-typed-operations.md`: narrowing
conversions of large negative values, `DW_OP_plus_uconst` on a typed operand
(where linksem follows the text and gdb makes the result generic), and
`DW_OP_constx` (unimplemented in gdb, so omitted from the random generator).
Where DWARF 5 is silent, gdb is followed: a typed value taken as an address is
its bit pattern zero-extended, and `DW_OP_mod` in a signed base type is the
type's (C) remainder while the generic type's stays unsigned.  A typed
`DW_OP_stack_value` shorter than the 8-byte variable is reported by
`dwexpr_eval` as the value zero-extended, which is how gdb reads it (the same
rendering now applies to a short `DW_OP_implicit_value`, so `m_implicit4` in
`minimal` is compared rather than `incomparable`; there gdb refuses the value
and lldb zero-extends it).  lldb 18.1.3 implements only
`DW_OP_convert` (differently, see the lldb report) and `DW_OP_addrx` of these,
so most rows of the typed sets are `lldb-differs`.

## Regression sets and expected results

`tests/basic.txt` (76 expressions) exercises every operation at least once;
`tests/minimal.txt` (79) holds one-line reproducers of every difference found so
far, with the expected result per the DWARF 4 text in comments;
`tests/frames.txt` (26) the location-list and frame-base forms above;
`tests/typed.txt` (63) the DWARF 5 typed and indexed operations, as a DWARF 5
unit; `random-seed1` is 1000 expressions from `dwexpr_gen` with seed 1 and at
most 8 operations (deterministic), `random-frames-seed1` the same expressions
with random location-list and frame-base annotations, and `random-typed-seed1`
1000 expressions with the typed operations, as a DWARF 5 unit.  `expected/<arch>-<set>/` holds the committed
results and report of each set on each architecture; `make check-native-arch` fails if a
result file differs from it (a difference caused by a debugger not being
installed is reported but not counted).  When a change to linksem, to the tests
or to the tools is intended, `make diff` shows exactly which expressions
changed, and `make set-expected-results` adopts the new results.

Results of the reference runs (30 September 2026; gdb 15.1, lldb 18.1.3,
binutils 2.42, qemu 8.2.2, on an x86_64 host):

| set                 | expressions | agree | lldb-differs | gdb-differs | gdb-crash | incomparable |
|---------------------|-------------|-------|--------------|-------------|-----------|--------------|
| basic               |          76 |    67 |            8 |           0 |         0 |            1 |
| minimal             |          79 |    50 |           22 |           3 |         3 |            1 |
| frames              |          26 |    24 |            2 |           0 |         0 |            0 |
| random-seed1        |        1000 |   958 |           28 |           0 |        14 |            0 |
| random-frames-seed1 |        1000 |   922 |           70 |           0 |         8 |            0 |
| typed               |          63 |     7 |           48 |           0 |         0 |            0 |
| random-typed-seed1  |        1000 |   437 |          539 |           0 |        11 |            0 |

(In `typed`, the 7 `all-differ` and 1 `linksem-differs` not shown are gdb's
narrowing-conversion and `DW_OP_plus_uconst` points with lldb not implementing
the operation; in `random-typed-seed1` the 8 `all-differ` and 5
`linksem-differs` are the same two points.  `minimal` now has 4 `gdb-differs`
and no `incomparable`: the short `DW_OP_implicit_value` (`m_implicit4`) is
compared, and gdb 15.1 refuses it, "access outside bounds of object referenced
via synthetic pointer", where lldb and linksem give the value zero-extended;
see the gdb DWARF 5 report's last point.)

(Of the 42 extra lldb differences of `random-frames-seed1` over
`random-seed1`, 41 are the CFA artefact described above and one is a former
gdb crash now counted against lldb.  The 6 fewer gdb crashes are the same
expressions attached as location lists: gdb's pre-pass that asserts on a
`DW_OP_bra` join is not run for location-list entries, so they evaluate.)

Larger runs: `make check-random SEED=11 N=8000 MAXOPS=12` (50 seconds as one
program, 20 seconds as four batches) gave 7308 agree, 456 lldb-differs, 228
gdb-crash and 6 gdb-differs; `make check-random SEED=17 N=100000 MAXOPS=12
BATCH=2000 JOBS=8 MINIMIZE=no` (2.5 minutes on a 20-core x86_64 host) gave
91293 agree, 5570 lldb-differs, 3031 gdb-crash (every one a `DW_OP_bra`
join), 100 gdb-differs (90 `DW_OP_mul` and 10 `DW_OP_shl`, all the negative
overflow bug in the gdb report) and 6 others in which that gdb bug and lldb's
typed `abs` happen to agree; no linksem defect.  The lldb differences were all
of the kinds in the lldb report; the new-looking messages "Unary negate
failed", "Logical NOT failed", "DW_OP_plus_uconst failed" and "Failed to take
the absolute value" are the operation after a `DW_OP_mod` by zero failing on
the invalid value lldb leaves.

The aarch64 results (under qemu) are identical, as expected for
architecture-neutral expressions (the typed sets differ only in the absolute
addresses `DW_OP_addrx` and `DW_OP_addr dw_mem` produce, since the two
programs are linked at different addresses).  There are no `linksem-differs`
left in the DWARF 4 sets: where gdb and lldb agree, linksem agrees with them;
in the typed sets the only ones are gdb's `DW_OP_plus_uconst` deviation, on
which lldb happens to agree with gdb.

The lldb result files of the frame sets contain live stack addresses (lldb
evaluates the CFA in the running process, not from `state.txt`), so they only
match the expected files where ASLR is disabled; in a container where
`personality(2)` is unavailable those lines differ from run to run and the
check reports them, harmlessly.

## Coverage

What the tests do and do not cover, against the DWARF 4 specification,
`src/dwarf.lem`, and the gdb and lldb implementations, with what to add first,
is assessed in `notes/notes040-2026-09-30-coverage.md`.  In short: every operation linksem
implements is exercised heavily, as exprlocs and (since 30 September 2026)
location lists, under five kinds of frame base, but only on 64-bit
little-endian DWARF32, with forward single-operation branches; composites,
32-bit and big-endian targets, and malformed input are not.

## Design

**One program, many variables.**  A run assembles one static, non-PIE,
libc-free program (`Dwarf_asm.emit`).  Its `_start` loads sixteen known values
into registers (DWARF numbers 0-5 and 8-15: a pointer to the known memory
block, 0x10, -1, the most negative and most positive values, 0, 1, 63, 64, -16,
a byte pattern, and so on), plus a constant "frame pointer" so that the CFA is a
known constant, then runs through the stop label of each frame-base function
(`dw_here` in `main`, then `dw_here_reg`, ...).  `dw_mem` is 256 bytes with
`dw_mem[i] = (37 i + 11) mod 256`, so every byte differs.  The DWARF 4
`.debug_info` describes one subprogram per frame-base kind, `main` with
`DW_OP_call_frame_cfa`, whose variables are the expressions under test, each
as a `DW_AT_location` exprloc or location list; `.debug_frame` comes from
`.cfi` directives.
So all three evaluators see exactly the same bytes, registers, CFA and memory,
and one debugger session evaluates a thousand expressions.  Stack memory is
never dereferenced because its contents differ between the debuggers and the
emulator.

**Encoding.**  Expressions are written in a textual form, one per line
(`NAME: DW_OP_lit3; DW_OP_breg0 -8; DW_OP_plus`; see `ocaml/lib/expr.ml`).
`dwexpr_build` turns each into linksem operation records with
`Dwarf_expr_encode.operation_of_name`, encodes them with
`Dwarf_expr_encode.encode_operations` (the inverse of linksem's parser, in
`src/dwarf_expr_encode.lem`), and first checks that linksem's parser reads back
what was encoded (`round_trip_ok`).  A `DW_OP_addr` with a symbolic operand
(`dw_mem+16`) is left to the assembler and linker as `.byte 0x03; .8byte
dw_mem+16`; everything else is emitted as bytes.  The branch operands of
`DW_OP_skip` and `DW_OP_bra` are written as counts of operations (`DW_OP_bra 1`
skips the next operation, a negative count branches back) and converted to
byte offsets when encoding.  linksem then reads the final ELF, so the same
bytes the debuggers read go through linksem's own parser.

**Evaluation.**  `dwexpr_eval` parses the linked program with linksem, builds
an `evaluation_context` from `state.txt` (registers) and the ELF image
(memory), finds each variable's DIE and evaluates its `DW_AT_location` with
`Dwarf.evaluate_location_description` at the stop label of its function.
`scripts/gdb_eval.py` runs inside gdb: `&NAME` gives the address without
reading memory; gdb's refusal message names the register for a register
location; "not an lvalue" means an implicit value, which is then printed.  gdb
15 aborts on some `DW_OP_bra` expressions, so `scripts/gdb_run.py` restarts it
after an abort, records `error: gdb aborted` for the variable that killed it,
and resumes with the next.  `scripts/lldb_eval.py` uses the `SBValue` API: the
address comes from `GetLoadAddress` when the memory is readable and otherwise
from lldb's "read memory from 0x... failed" message; register names and
`scalar` locations are classified; implicit and composite values are
materialised in host memory and reported as values.  Results are classified,
not printed values, so the C type of the variables (`unsigned long`) never
enters into it.

**Both architectures.**  `ocaml/lib/arch.ml` describes x86_64 and aarch64
(register names, the register values, the CFA rule, prologue and exit
sequence).  `scripts/pipeline.py` picks the assembler, linker, debugger and
emulator for each from what is installed on the host (`Tools`), runs the host's
architecture natively and the other under `qemu-<arch> -g PORT`, with gdb
(`gdb-multiarch`) and lldb (`gdb-remote`) attaching to the stub.  The results
were identical on both here, as they should be for architecture-neutral
expressions; the aarch64 path was tested from an x86_64 host, the reverse only
by construction.

**Random expressions.**  `dwexpr_gen ARCH N SEED MAXOPS` tracks the stack depth
so that every operation finds its operands, loads only from `dw_mem`, biases
operands to boundary values (0, 1, 2^k, 2^k-1, -1, the extremes), and includes
whole-register locations, `DW_OP_stack_value` endings, and `DW_OP_skip`/`bra`
over single operations.

**Unspecified cases** (checked against `doc/DWARF4.pdf`, sections 2.5.1.4 and
2.5.1.5).  Where DWARF 4 leaves the result undefined, linksem now follows gdb,
and the choice is written into `src/dwarf.lem` beside the operation: `DW_OP_mod`
by zero returns the dividend (lldb fails); `DW_OP_div` by zero fails; shift
counts of 64 or more give 0 for `shl`/`shr` and the sign fill for `shra`;
`DW_OP_abs` and `DW_OP_neg` of the most negative value wrap to the value
itself.  A non-empty expression that leaves the stack empty fails, as in both
debuggers.  `DW_OP_skip`/`bra` loops are bounded by `evaluation_fuel` (100,000
operations), a limit of linksem's own.

**Difficulties met, for the record.**  lldb's `p &v` JIT-materialises the
variable (reads memory), so the `SBValue` route with message parsing is used
instead.  ASLR cannot be disabled in some sandboxes (`personality` fails), so
lldb runs with `target.disable-aslr false`.  The cross `aarch64-linux-gnu-gcc`
driver on this machine calls the native `as`, so `as` and `ld` are invoked
directly.  The constant frame pointer means gdb cannot unwind past `main`,
which is harmless.  lldb keeps a signed/unsigned type per stack entry (see the
lldb report), which is what most of the remaining `lldb-differs` are.

## Layout

    Makefile                    the interface (targets above)
    scripts/pipeline.py         tool detection, build, evaluate, compare, check, accept, minimize, diff
    scripts/compare.py          result files -> classes and report.md
    scripts/gdb_eval.py         runs inside gdb; gdb_run.py restarts gdb after an abort
    scripts/lldb_eval.py        runs inside lldb
    ocaml/lib/                  expr (textual syntax), encode (linksem records and bytes),
                                arch (the two architectures), dwarf_asm (the .s emitter),
                                state (state.txt)
    ocaml/bin/                  dwexpr_gen, dwexpr_build, dwexpr_eval
    tests/basic.txt, minimal.txt, frames.txt, typed.txt
    expected/<arch>-<set>/      committed reference results and reports
    notes/                      the notes and instructions this was built from, (notesNNN-YYYY-MM-DD-topic.md)
    upstream-discrepancy-reports/   the gdb and lldb reports, with standalone examples
    output/                     runs (not committed)
