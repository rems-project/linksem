<!-- Claude: written by Claude, 1 October 2026. -->
# notes014: the linksem work since September 2026, a summary

All on branch `reloc-new-ps`, 18 September to 1 October 2026, about 140
commits (every one prefixed `Claude:` except the owner's own edits).  The
prompts are in `notes012-2026-10-01-instructions-given.md`, the rules in
`notes013-2026-10-01-general-instructions.md`; the detailed notes are
`notes006` to `notes011` here and the harnesses' own `notes/`.

1. **The `linksem readelf` tool and readelf/objdump-format dumps** (18-19
   September).  The old `main_elf` dumps were made byte-identical to readelf
   (`-S`, `-r`, `-s`, then `-t -g -n -V -I --dyn-syms -u -A -x -p -e -a`) and
   to objdump/readelf for `.debug_abbrev`/`.debug_info`, and linear-time
   where they had been quadratic; the DIE printer became one tree walker with
   rendering styles (`info<readelf>`, `info<objdump>`, `info<raw>`,
   `info<resolved>`, `info<analysis>`).  A new `src_ocaml/` cmdliner front
   end `linksem` with a `readelf` subcommand replaced the ad hoc options, the
   Lem sources staying the authority.
2. **The DWARF/ELF validation harness** `validation/dwarf` (19 September,
   tidied 30 September): fetches and builds the binutils, LLVM and elfutils
   test suites (about 2000 ELF files), compares the dumps against readelf and
   objdump, clusters the differences, and keeps a baseline.  It drove about
   60 fixes to the ELF and DWARF model (unit delimiting, DWARF64, missing
   abbreviations, string references in relocatable objects, truncated
   sections, note and dynamic-section details, name tables, ...), recorded in
   `notes007`; `0 regressions` against the baseline is the standing check.
3. **Symbolic resolution and the pKVM boot-time patching** (23-27
   September): `symbolic_resolution.lem` (the sections of a relocatable
   object as symbolic words, with a report format and AArch64 field
   specifications), `src/pkvm/` (the Linux alternatives, the `.hyp.reloc`
   rewrite, host-written data, and the static-key jump table, each as a Lem
   model producing symbolic values conditional on the cpucaps), the
   generated arm64 cpucaps table under `etc_linux/`, and the rendering of
   symbolic expressions used by read-dwarf.
4. **The DWARF expression cross-check** `validation/dwarf-expr` (28-30
   September): one program per run with every expression as a variable's
   location, evaluated by linksem's interpreter, gdb and lldb; a Lem encoder
   (`dwarf_expr_encode.lem`) as the inverse of the parser; random
   generation, batching, minimal examples, upstream reports.  It found and
   fixed eleven defects in the evaluator (operand order, negation, `abs`,
   `pick`, `plus_uconst`, `regx`, `div` and the comparisons, `skip`/`bra`,
   the CFA row lookup, location-list bases, register frame bases), and bugs
   in gdb (`DW_OP_bra` join abort, negative-overflow magnitude in `mul`/`shl`)
   and lldb (operand-dependent signedness).
5. **DWARF 5** (30 September; `notes008`, `notes009`): unit types, the new
   forms and sections, type units, version 5 line tables, a `unit_context`
   with lazily resolved indexed strings and addresses, DWARF 5 location and
   range lists, a typed expression stack with `addrx`/`constx` and the typed
   operations, parsing and content checks of `.debug_aranges`,
   `.debug_names` and `.debug_macro`, and readelf-format dumps of the new
   sections, all checked against readelf on the DWARF 5 kvm_nvhe.o (identical)
   and on the corpora's 239 DWARF 5 files, and against gdb for the typed
   operations (three gdb defects reported).
6. **Specification cleanup** (1 October): option-typed sections and
   section-derived parts of the `dwarf` record, `d_str` removed, record types
   for the analysed location data, RISC-V register names; and two plans for
   what comes next, the missing operation semantics (`notes010`) and encode
   functions with round-trip testing (`notes011`).

Alongside: a speculative experiment on exporting the Lem model to Lean with
the lem-lean fork (recorded in read-dwarf-private3's `notes035`), and the
read-dwarf changes that followed each linksem step
(`read-dwarf/notes/notes003-2026-10-01-summary-since-september.md`).
