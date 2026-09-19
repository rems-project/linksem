<!-- Claude: this file is largely written by Claude (19 September 2026). -->
# Validating linksem against other tools

Two kinds of validation live here.

- `elf/harness.sh`: the original (2016) check of `main_elf` against
  `readelf --wide` and `hexdump -v` over a directory of binaries.
- `dwarf/`: the current harness.  It fetches other projects' test suites on
  demand, turns them into ELF objects and linked executables, runs
  `linksem readelf` (see `../src_ocaml/`) against the corresponding real
  tool on each, and reports where they differ.  The design and rationale
  are in `../notes/notes006-2026-09-19-dwarf-validation-plan.md`; the issues
  it has found, what was fixed and what remains are in
  `../notes/notes007-2026-09-19-linksem-issues-from-validation.md`.

## Running

    make -C ../src && make -C ../src_ocaml      # the library and the tool
    dwarf/run.sh binutils                       # one corpus ...
    dwarf/run.sh binutils llvm elfutils         # ... or several
    AGAINST=results/<earlier> dwarf/run.sh ...  # and list regressions/fixes

Results go to `results/<timestamp>/`:

- `summary.md` / `summary.json`: the matrix of outcomes per corpus, file kind
  (object, executable, shared object) and comparison: identical, differ,
  linksem failed, oracle failed, timeout, skipped (with reasons).
- `triage.md`: the differing files clustered by the first differing line
  with numbers masked, most frequent first, with example paths.
- `objects/<file>/<comparison>/`: `oracle.out`, `linksem.out`, `diff`,
  `commands`, `stderr` for every run, so any row can be repeated by hand.

`cache/` holds the fetched sources and built objects (`cache/objects/<corpus>/`
with `manifest.json` describing every build attempt and `classes.json` the
classification of every ELF file).  `cache/`, `results/` and `tools/` are
not checked in.

## What is compared

`common/compare.py` defines the matrix.  The parsing row compares
byte-faithful dumps: `objdump --dwarf=abbrev,info` against
`linksem readelf --debug-dump='info<objdump>'` and `readelf
--debug-dump=abbrev,info` against `--debug-dump='abbrev,info<readelf>'`.
The ELF row compares `readelf -W` `-h -S -l -r -s -t -g -n -V -I -a` with
the same options of `linksem readelf`, and `hexdump -v` with `--in-out`.
Comparisons that cannot apply are skipped with a reason: ELF32 for the
dumps that exist only for ELF64, DWARF 5 (not yet parsed by linksem),
relocatable objects for machines other than AArch64 (no data-relocation
interpreter), compressed debug sections.  Oracles are binutils 2.42
(`readelf`, `objdump`; the AArch64 cross tools for AArch64 files, the native
ones otherwise, since the cross objdump prints generic names for other
machines).

## Corpora

| corpus | source | what is built |
|---|---|---|
| binutils | `binutils/testsuite/binutils-all` at tag `binutils-2_42` (sourceware) | every `.s`/`.S` assembled with x86-64, i386 and AArch64 gas, and each object linked with `ld -nostdlib --entry=0 --unresolved-symbols=ignore-all` |
| llvm | `llvm/test/tools/llvm-dwarfdump` and `llvm/test/DebugInfo` at tag `llvmorg-18.1.3` (github) | objects from the tests' own `RUN` lines (`yaml2obj`, `llvm-mc`, `llc`), plus the precompiled ELF `Inputs`; each linked as above |
| elfutils | `tests/testfile*.bz2` from the elfutils repository (sourceware) | the binaries themselves, as checked in |

Tool versions are pinned to match the installed oracles; override with
`BINUTILS_REF`, `LLVM_REF`, `ELFUTILS_REF`.  Corpora are fetched as shallow,
blobless, sparse clones into `cache/src/`, and used in place.

## Licensing

See `LICENCE-NOTE.md`.  Nothing fetched is distributed with linksem.

## Checking one fix

    common/quickcheck.py 'strip-1[345]|^testfile$'

re-runs the comparisons on the objects whose names match, reports every
comparison whose status changed against `results/baseline/` (or the most
recent run; `--against DIR` chooses), and exits with status 2 if anything got
worse.  This is how each fix was checked before it was committed.

## Name tables by observation

`common/mkreloc.py` and `common/mkhdr.py` generate an object carrying every
relocation type in a range, and a bare header with a given machine, OS/ABI
and version, so that readelf's name tables can be read off its output and
linksem's checked against them (`diff <(readelf -W -r gen.o) <(linksem
readelf -r gen.o)`).  The names in linksem's tables were taken this way, as
observed behaviour rather than copied source.
