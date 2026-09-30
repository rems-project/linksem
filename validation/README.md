# Validating linksem against other tools

This file is largely written by Claude (September 2026).

Three kinds of validation live here, each in its own directory:

- `elf/harness.sh`: the original (2016) check of `main_elf` against
  `readelf --wide` and `hexdump -v` over a directory of binaries.
- `dwarf/`: a dwarf parsing and printing harness.  It fetches other projects' test
  suites on demand, turns them into ELF objects and linked executables, runs
  `linksem readelf` (see `../src_ocaml/`) against the corresponding real
  tool on each, and reports where they differ.  The design and rationale
  are in `../notes/notes006-2026-09-19-dwarf-validation-plan.md`; the issues
  it has found, what was fixed and what remains are in
  `../notes/notes007-2026-09-19-linksem-issues-from-validation.md`; the
  instructions it was built under are in `dwarf/notes/`.
- `test-dwarf-expr/`: a DWARF expression evaluation harness.  It generates
  programs whose variables have chosen or random DWARF 4 location expressions,
  evaluates them with linksem's interpreter, gdb and lldb, and reports where
  they differ; it has its own README, Makefile, committed regression results
  and notes, and `upstream-discrepancy-reports/` for the debugger bugs it
  found.  

The `elf/harness.sh` was human-written; the other two are by Claude,
from prompts and general instructions as in the `notes/`.
