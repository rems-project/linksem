<!-- Claude: written by Claude, 30 September 2026. -->
# notes003: DWARF 5 files and the new section dumps in this harness

## The instruction

Part of the DWARF 5 work in linksem (`linksem/notes/notes008-2026-09-30-dwarf5-plan.md`
and the user's PS answers in it).  The instruction, verbatim:

> I edited that notes008. Go ahead and do it, first the minimal part for
> kvm_nvhe.o, then test read-dwarf on that, then the rest.  Update and use the
> validation machinery for elf, dwarf, and dwarf-expr to check that the whole
> thing is sensible whenever appropriate.

The general rules in `notes002-2026-09-30-general-instructions.md` applied.

## What changed here

- The 239 DWARF 5 files of the three corpora, skipped before ("dwarf5"), are
  compared like the others.  The objdump comparison is skipped for DWARF 5
  relocatable objects: objdump does not apply the relocations of
  `.debug_str_offsets`, so its indexed strings there are wrong; readelf's are
  right and are compared.
- Five more comparisons in the parsing row, each for the files that have the
  section: `readelf --debug-dump=aranges`, `=addr`, `=str-offsets`, `=macro`
  and `=gdb_index` (readelf's option for `.debug_names`; files with a
  `.gdb_index` are skipped) against the same options of `linksem readelf`.
- `compare.py`'s `section_applicable` expresses "the section is present (and
  that other one is not)".

## Findings

- linksem's `--debug-dump=abbrev,info` of the DWARF 5 kvm_nvhe.o (43 units,
  899601 lines) is identical to readelf's, as is the DWARF 4 one; against the
  DWARF 4 baseline the DWARF 5 work caused 0 regressions and fixed 4.
- The remaining DWARF 5 info-dump differences are readelf's printing of
  level-0 null entries after a unit's DIE (also in DWARF 4 files), its
  `DW_AT_discr_list` decoding, its empty value for an `implicit_const` DIE
  with no data (`implicit-const-test2`), and one supplementary-file case.
- readelf 2.42 resolves `DW_MACRO_define_strx`/`undef_strx` indices from the
  start of `.debug_str_offsets` rather than from the unit's
  `DW_AT_str_offsets_base`: on a clang `-fdebug-macro` DWARF 5 file its macro
  names are shifted by two entries (checked against the header's line numbers:
  line 44 of clang's `stddef.h` is `#define __STDDEF_H`, which linksem shows
  and readelf shows at line 46).  Those files differ in `readelf-macro`.
- `linksem readelf --debug-dump=check` (linksem's content checks of the three
  sections) passes on the corpus files with those sections except the llvm
  `debug-names-verify-*` and `dwarfdump-debug-names` inputs, which are
  deliberately broken and which it catches.

## The run of 30 September 2026 (results/20260930-184201, now the baseline)

Against the previous baseline: 0 regressions, 44 fixed.  The new comparisons,
over the files that have the section (identical / differ / linksem failed /
oracle failed):

| comparison          | identical | differ | linksem failed | oracle failed |
|---------------------|-----------|--------|----------------|---------------|
| readelf-aranges     |        91 |      4 |              5 |             0 |
| readelf-addr        |        90 |      2 |              2 |             7 |
| readelf-str-offsets |        62 |      2 |              0 |             0 |
| readelf-macro       |         7 |      4 |              0 |             3 |
| readelf-names       |        33 |     12 |              0 |             3 |

The differences left: readelf's macro `strx` quirk (2), its dump of all the
COMDAT `.debug_macro` sections of an object where linksem reads the first (1),
its "Extension opcode arguments" table for a vendor macro opcode (1); dwz
supplementary files (3); llvm's deliberately truncated or misaligned name
indexes, which linksem does not print at all where readelf prints the part it
could read (10 after the empty-hash-table fix that followed this run); and
two hand-written string-offsets sections with a DWARF 64 contribution that
readelf 2.42 itself misreads.

The run had to be made in two parts: this machine's memory watchdog killed the
whole-corpus run twice during elfutils, so that corpus was compared on its own
under `ulimit -v 8000000` (an 8 GB address-space cap per tool process, which
no file hit).
