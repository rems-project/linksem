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
    make check-native-arch              # regression, host architecture (basic, minimal, frames, random-seed1, random-frames-seed1)
    make check-all-archs                # both architectures
    make validate SEED=7 N=2000 MAXOPS=12   # an extensive random run, with minimal examples of every disagreement
    make one EXPR='DW_OP_lit1; DW_OP_lit2; DW_OP_minus'   # a single expression
    make minimize RUN=output/x86_64-random-seed1          # minimal standalone examples of a run's disagreements
    make diff A=output/x86_64-basic B=expected/x86_64-basic   # what changed between two runs
    make accept SET=basic               # adopt a run's results as the expected ones

`ARCH=aarch64` (or `x86_64`) selects the architecture for `check`, `validate`,
`one` and `accept`.  Everything is written under `output/<arch>-<run>/`.

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

`make minimize` (also run by `make validate` unless `MINIMIZE=no`) reduces
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

## Regression sets and expected results

`tests/basic.txt` (76 expressions) exercises every operation at least once;
`tests/minimal.txt` (79) holds one-line reproducers of every difference found so
far, with the expected result per the DWARF 4 text in comments;
`tests/frames.txt` (26) the location-list and frame-base forms above;
`random-seed1` is 1000 expressions from `dwexpr_gen` with seed 1 and at most 8
operations (deterministic), and `random-frames-seed1` the same expressions
with random location-list and frame-base annotations.  `expected/<arch>-<set>/` holds the committed
results and report of each set on each architecture; `make check-native-arch` fails if a
result file differs from it (a difference caused by a debugger not being
installed is reported but not counted).  When a change to linksem, to the tests
or to the tools is intended, `make diff` shows exactly which expressions
changed, and `make accept` adopts the new results.

Results of the reference runs (30 September 2026; gdb 15.1, lldb 18.1.3,
binutils 2.42, qemu 8.2.2, on an x86_64 host):

| set                 | expressions | agree | lldb-differs | gdb-differs | gdb-crash | incomparable |
|---------------------|-------------|-------|--------------|-------------|-----------|--------------|
| basic               |          76 |    67 |            8 |           0 |         0 |            1 |
| minimal             |          79 |    50 |           22 |           3 |         3 |            1 |
| frames              |          26 |    24 |            2 |           0 |         0 |            0 |
| random-seed1        |        1000 |   958 |           28 |           0 |        14 |            0 |
| random-frames-seed1 |        1000 |   922 |           70 |           0 |         8 |            0 |

(Of the 42 extra lldb differences of `random-frames-seed1` over
`random-seed1`, 41 are the CFA artefact described above and one is a former
gdb crash now counted against lldb.  The 6 fewer gdb crashes are the same
expressions attached as location lists: gdb's pre-pass that asserts on a
`DW_OP_bra` join is not run for location-list entries, so they evaluate.)

Larger runs: `make validate SEED=11 N=8000 MAXOPS=12` (50 seconds as one
program, 20 seconds as four batches) gave 7308 agree, 456 lldb-differs, 228
gdb-crash and 6 gdb-differs; `make validate SEED=17 N=100000 MAXOPS=12
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
architecture-neutral expressions.  There are no `linksem-differs` left: where
gdb and lldb agree, linksem agrees with them.

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
    tests/basic.txt, minimal.txt
    expected/<arch>-<set>/      committed reference results and reports
    notes/                      the notes and instructions this was built from, (notesNNN-YYYY-MM-DD-topic.md)
    upstream-discrepancy-reports/   the gdb and lldb reports, with standalone examples
    output/                     runs (not committed)
