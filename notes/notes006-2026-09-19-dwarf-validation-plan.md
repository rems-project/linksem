# Plan: validating linksem's DWARF reading and printing against other tools' test suites

Claude: this note is largely written by Claude (19 September 2026).  It is a
plan, not a record of work done.  The aim is a set of scripts under
`linksem/validation/` that fetch, on demand and to a local cache only, the
DWARF-relevant tests of binutils, LLVM, libdwarf and elfutils, run
`linksem readelf` (and new `linksem llvm-dwarfdump` / `linksem dwarfdump`
subcommands) against the corresponding real tools on every object they
yield, and report the results both as an overview and in enough detail to
debug each discrepancy.  Nothing fetched is checked in.

## 1. What is useful to test, and why

The objects at hand so far (`kvm_nvhe.o` and its constituents) exercise one
compiler, one target, one DWARF version and the forms, tags and operations
that clang happens to emit for C kernel code.  Agreement on them says little
about the rest of the reader.  The corpora below are useful because each
covers a different axis, and the comparison matrix separates what is being
checked:

- **Parsing of the encoding.**  Every DWARF section has its own byte-level
  format (abbreviations, DIE trees with all the `DW_FORM_*` encodings,
  line-number programs, CFI, location and range lists, string offsets,
  address tables), and a parser bug shows up as a difference against a
  byte-faithful dump (objdump/readelf) long before it shows up in any
  analysis.  The hand-written binutils and LLVM tests are valuable here
  precisely because they are small and deliberately exercise unusual
  encodings: DWARF 2, 3 and 4 side by side, `DW_FORM_indirect`,
  `implicit_const`, 64-bit DWARF, big-endian, ELF32, compressed sections,
  every operation in `DW_OP_*`, empty and degenerate units.  Real-world
  objects (libdwarf, elfutils) add the variety of many compilers' output.
- **Relocatable objects versus linked binaries.**  linksem's distinctive
  feature is that it keeps DWARF values symbolic (section plus offset) in
  relocatable objects rather than applying relocations, and its
  data-relocation interpreter exists only for AArch64.  Object files
  therefore test the symbolic machinery and its printing (which must still
  agree with tools that apply relocations numerically), while fully linked
  executables and shared objects test the absolute-address paths: real
  `low_pc`/`high_pc` pairs, location lists with actual addresses and base
  addresses, `.debug_aranges`, `.eh_frame` alongside `.debug_frame`, and
  the interaction with dynamic symbol tables and versioning.  Both kinds are
  needed; a bug in either path is invisible to the other.  Where a corpus
  provides only sources or `.o` files, `build-objects.py` also links each
  object into a minimal executable (`ld -nostdlib --entry=0
  --unresolved-symbols=ignore-all`) and, where the source allows, a shared
  object, so that the same DWARF is seen both ways; the elfutils and
  libdwarf corpora already contain many linked binaries.
- **Resolution and pretty-printing.**  The resolved view (string, reference
  and type resolution, expression and list decoding, line-table evaluation)
  is where linksem is meant to be useful to read-dwarf, and llvm-dwarfdump
  and dwarfdump compute the same information independently.  Comparing
  against them, on objects that already pass the parsing row, checks the
  semantic layer without confounding it with encoding bugs.
- **Robustness.**  The libdwarf suite's fuzzed objects check that malformed
  input produces an error rather than an exception, an infinite loop or a

wrong answer, which matters for a reader that will be pointed at arbitrary
  build outputs.
- **Coverage of DWARF 5 and other machines.**  Classifying every object
  records how much of each corpus is currently out of reach (DWARF 5,
  non-AArch64 relocatable objects), which turns "unsupported" from an
  anecdote into a measured gap and shows which extension would unlock the
  most tests.

## 2. What the corpora offer, and the oracles to use

| corpus | fetch | usable objects | oracle here |
|---|---|---|---|
| `binutils/testsuite/binutils-all` (sourceware, tag `binutils-2_42`) | sparse blobless clone, 9 MB, 7 s | ~40 DWARF `.S`/`.s` sources (dw2-*, dw5*, dwarf-attributes, ranges, decodedline, str-offsets) assembled with gas, plus `.W`/`.d` regex expectations | readelf/objdump 2.42, installed and version-matched |
| `llvm/test/tools/llvm-dwarfdump`, `llvm/test/DebugInfo`, `llvm/unittests/DebugInfo/DWARF` (github, tag `llvmorg-18.1.3`) | sparse clone, 32 MB, 3 s | 115 `yaml2obj` YAMLs, ~250 `llvm-mc` `.s`, ~1200 `llc` `.ll` (989 tests run llvm-dwarfdump), 147 precompiled Inputs of which ~40 are ELF; the unittests are C++ against the API and yield nothing to run, only ideas | llvm-dwarfdump, yaml2obj, llvm-mc, llc 18.1.3, all installed |
| `libdwarf-regressiontests` (github, 850 MB, 465 top-level directories, fuzzed inputs included) | partial clone, then `sparse-checkout add` per selected directory | thousands of real-world ELF objects across many compilers and targets, plus baselines from the current dwarfdump | libdwarf `dwarfdump`; the installed one is the 2021 release, so build `libdwarf-code` v2.3.2 into `validation/tools/` |
| `elfutils/tests` (sourceware) | sparse clone, small | 315 `testfile*.bz2` real binaries (many architectures, DWARF 2 to 5), 44 `run-readelf-*.sh` | `eu-readelf` is not installed; `apt install elfutils` or build into `validation/tools/` |

Two consequences: pin each corpus to the commit matching the installed
oracle, since expectation files change with tool versions; and treat the
corpora as sources of objects rather than of expectations.  The real tools
are run as oracles; checking our output against the `.W`/FileCheck patterns
is optional and secondary.

## 3. Layout, pipeline and reporting

    validation/
      README.md                 how to run, what is compared, licence note
      LICENCE-NOTE.md           text to append to LICENCE (draft in section 5)
      tools/                    (gitignored) locally built dwarfdump, eu-readelf
      common/
        fetch.sh                sparse blobless clone at a pinned commit, idempotent
        build-objects.py        turns a corpus into objects: gas for .S/.s, yaml2obj,
                                llvm-mc/llc driven by the tests' own RUN lines, bunzip2;
                                links each relocatable object into a minimal executable
                                (and shared object where possible) so both are tested
        classify.py             per object: ELF class, machine, ET type, DWARF version,
                                debug sections present, relocations against them
        compare.py              runs (oracle command, linksem command) pairs, stores
                                both outputs, diff, stderr, exit codes, timings
        report.py               summary.md + summary.json + triage.md
      dwarf/
        corpora/{binutils,llvm,libdwarf,elfutils}/  fetch.sh, manifest, skip-list
        comparisons.toml        the oracle x linksem-subcommand matrix, with normalisers
        expected-failures.txt   known discrepancies, one line each with a reason
        run.sh                  fetch -> build -> classify -> compare -> report
      cache/, results/          (gitignored)

The comparison matrix separates parsing from printing.  Every object first
goes through the byte-faithful checks: `objdump --dwarf=abbrev,info` versus
`linksem readelf --debug-dump='info<objdump>'`, `readelf --debug-dump=abbrev,info`
versus `--debug-dump='abbrev,info<readelf>'`, plus the existing ELF flags
against `readelf -W` and the `--in-out` round trip against `hexdump -v`
(the 2016 validation, extended to this corpus for free).  A difference there
is a parsing bug.  Only objects that pass go on to the resolved-view checks,
so that printer discrepancies are not confounded by parsing ones:
`llvm-dwarfdump --debug-info` (and `--verbose`) versus a new
`linksem llvm-dwarfdump`, `dwarfdump -i` versus a new `linksem dwarfdump`,
and later `eu-readelf --debug-dump=info`.  The other readelf DWARF sections
(`rawline`, `decodedline`, `frames`, `frames-interp`, `loc`, `Ranges`, `str`,
`aranges`) join the parsing row as the Lem printers gain those styles.

`classify.py` assigns each object to buckets that the report keeps apart, so
that known limitations do not drown real findings: relocatable object versus
executable versus shared object (reported as separate columns throughout),
DWARF 5 (unsupported until the parser catches up), non-ELF (skipped),
relocatable objects for machines other than AArch64 (no data-relocation
interpreter), compressed sections, split DWARF, and the libdwarf fuzzed
inputs, which run as robustness tests
where the pass criterion is a clean error under `timeout` rather than
agreement.

Reporting has three layers.  `summary.md`/`summary.json` give the matrix per
corpus and comparison: identical, differ, oracle failed, linksem failed,
timed out, skipped-with-reason, and timings.  `triage.md` groups the
differing objects by the signature of the first differing line with numbers
masked, listing the count and three example objects per signature, which is
what turns hundreds of diffs into a handful of bugs.  Each object gets a
directory holding both raw outputs, the diff, the exact command lines,
stderr and its classification, so that any row can be re-run by hand.
`summary.json` is kept per run and `report.py --against <previous>` prints
regressions and fixes; `run.sh` exits non-zero on differences not listed in
`expected-failures.txt`.

## 4. Phases and linksem changes

1. Infrastructure plus the binutils corpus, which is small and
   version-matched: fetch, assemble (x86 and AArch64 gas; other targets
   skipped) and link, run the parsing row on both the objects and the
   linked binaries, produce the first report.  Also exercise
   all the `linksem readelf` ELF flags against `readelf -W` over these
   objects.
2. LLVM corpus with the binutils oracles for parsing, then add `style_llvm`
   to `dwarf.lem` (offset-prefixed DIE headers, depth indentation, `(value)`
   rendering, `DW_AT_type` name resolution, inline location and range lists,
   a `--verbose` variant with forms) and the `linksem llvm-dwarfdump`
   subcommand.  Style differences that are only cosmetic go into a small
   options record on the existing `die_style` machinery rather than a fourth
   walker.
3. libdwarf: build v2.3.2, fetch selected directories (the non-fuzzed
   real-world objects first; the fuzzed ones later as robustness tests), add
   `style_dwarfdump` and `linksem dwarfdump`, and optionally diff against the
   checked-in baselines as a version-drift indicator.
4. elfutils testfiles as a broad real-world corpus, with `eu-readelf` if
   installed; DWARF 5 tracking; make `make -C validation dwarf` the standing
   regression run.

All traversals of the ELF and DWARF data structures and all formatting stay
in the Lem sources; the OCaml `linksem` tool only parses command lines and
sequences library printers.  Effort: phase 1 is a few days including the
report tooling; each new style is comparable to the objdump one.

## 5. Licensing

Nothing fetched is checked in: the binutils and elfutils tests are GPLv3 or
later, which is why they stay dynamic; LLVM's are Apache-2.0 with LLVM
exception; libdwarf-regressiontests is BSD-style "unless otherwise specified
in a source file", so per-file headers must be checked before any file were
ever copied.  Our scripts and manifests are under linksem's own licence.
Draft text to append to linksem's `LICENCE`:

> The scripts under `validation/` fetch, at run time and to a local cache
> only, test inputs from the GNU binutils and elfutils repositories (GPLv3
> or later), the LLVM project (Apache-2.0 with LLVM exception) and
> libdwarf-regressiontests (BSD-style, per its COPYING).  None of that
> material is distributed with linksem; `validation/dwarf/expected-failures.txt`
> and the manifests record file names only.  The readelf-compatible printers
> in `src/adaptors/harness_interface.lem` and `src/dwarf.lem` reproduce the
> output formats of GNU readelf and objdump (binutils 2.42), including their
> message texts and name tables, written by reading those programs' source
> and observing their behaviour; apart from the message texts and name
> tables, they contain no source copied from binutils.

This is also the standing rule for the work: message texts and name tables
may be transcribed from binutils (and the other tools') sources, since
byte-identical output requires them; nothing else is to be copied or closely
transliterated from those sources, and any apparent need to go beyond that
is to be raised with Peter before it is done.
