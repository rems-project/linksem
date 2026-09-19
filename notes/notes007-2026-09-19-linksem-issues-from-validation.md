# linksem issues found by the DWARF/ELF validation runs

Claude: this note is largely written by Claude (19 September 2026) and is
updated incrementally as the validation runs under `linksem/validation/`
progress.  Each entry names the cluster of failing comparisons it explains,
the cause in `linksem/src/*.lem`, and the minimal fix in the style of the
surrounding definitions.  Entries are grouped by area; the number of
affected files refers to the binutils corpus run unless said otherwise.
Entries marked FIXED were fixed on 19 September 2026, one linksem commit
each (branch `reloc-new-ps`; the hashes are given); entries marked DEFERRED
were not attempted, at Peter's request.  Section G lists what the fixing
turned up, and what remains.

## A. DWARF parsing (`src/dwarf.lem`)

### A1. FIXED (0df930a): Compilation units are delimited by the DIE tree, not by the header length

*Clusters:* `parse_cuh_header fail ... at pc_offset = 0x35` (dwo test, 9
files); `mydrop of debug_abbrev` (pr26548, 3 files).

*Cause:* `parse_compilation_unit` parses the header, then one root DIE with
`parse_die`, and continues the CU list from wherever that DIE tree ended.
The DWARF unit length in the header is not used to find the next unit.  A
unit with padding after its last DIE (dwo.s: one trailing byte) or with
several level-0 DIEs (pr26548.s: a sequence of `DW_TAG_variable` DIEs with
no compile-unit parent) therefore makes the following "unit header" start at
a wrong offset, and whatever is parsed there fails.  readelf and objdump
advance by `unit_length` and print every level-0 DIE they meet.

*Fix:* in `parse_compilation_unit`, compute the unit's end from its header,
`cu_end = pc.pc_offset + header_size + cuh_unit_length` (header size 4 for
32-bit DWARF, 12 for 64-bit), and after the DIE tree has been parsed return
`PR_success (Just cu) <| pc_bytes = drop (cu_end - pc.pc_offset) pc.pc_bytes;
pc_offset = cu_end |>` instead of `pc''`.  That alone fixes the dwo case.
For the multiple level-0 DIEs of pr26548 the root DIE would have to become a
list (`cu_die : list die`, or parsing a synthetic root), which touches every
consumer of `cu_die`; it is a non-conforming input that readelf tolerates,
so it is recorded here but not proposed as a minimal change.

*Estimated diff:* parsing/analysis ~10 lines for the unit-length delimiting in `parse_compilation_unit`; pretty-printing 0.  The optional multiple-level-0-DIE change is ~60 parsing (a `cu_die` list or synthetic root) plus ~30 printing (every consumer of `cu_die`).

### A2. FIXED (f123ae4, 2ac78b0): A compilation unit without `DW_AT_stmt_list` aborts the whole parse

*Cluster:* `compilation unit did not have a DW_AT_stmt_list attribute`
(dw2-3, dw2-ranges: 2 files, more expected in other corpora).

*Cause:* `parse_line_number_infos` maps `parse_line_number_info` over all
units, which calls `line_number_offset_of_compilation_unit` and that
`failwith`s when the attribute is absent (dw2-3.S's second unit has none, as
any hand-written or partial unit may).  readelf and objdump simply print the
unit; a unit's line information is optional.

*Fix:* make `line_number_offset_of_compilation_unit c cu : maybe sym_natural`
(returning `Nothing` in the last two match arms) and have
`parse_line_number_infos` use `List.mapMaybe` so that units without line
information contribute nothing to `d_line_info`.
`line_number_program_of_compilation_unit` then keeps its type by failing
only when a caller actually needs a program that does not exist, and the
other callers of the offset function (lines 4093, 6417) match on the
`maybe`.

*Estimated diff:* parsing/analysis ~15 lines (`maybe` return, `List.mapMaybe`, two callers); pretty-printing 0.

### A3. FIXED (291a1ef (by A8)): `.debug_abbrev` absent (debuglink test)

*Cluster:* `parse_abbrevations_table fail ... at pc_offset = 0x0` (3 files;
the readelf oracle also gives up, with "Unable to locate .debug_abbrev
section!", objdump prints only its header).

*Cause:* `parse_compilation_unit` calls `Assert_extra.failwith` when the
abbreviation table cannot be parsed from the (here empty) section body.

*Fix:* in `extract_dwarf`, when there is a `.debug_info` section but no
`.debug_abbrev`, produce a `dwarf` with no compilation units instead of
calling the parser; the objdump-style printer then prints the section
headers with no units, which is what objdump does.  Low priority; corrupt
input rather than a real-world shape.

*Estimated diff:* parsing/analysis ~10 lines in `extract_dwarf`; pretty-printing ~5 (empty-unit case of the objdump style).

### A4. FIXED (41aba2f): objdump's and readelf's `.debug_abbrev`/`.debug_info` order follows the file

*Cluster:* `Contents of the .debug_info section: || Contents of the
.debug_abbrev section:` (8 binutils and 610 LLVM linked executables), and
the same for the objdump style; also `Contents of the .debug_types section`
(2 files): objdump prints `.debug_types` (type units) when asked for `info`,
in its section position, which linksem's objdump style does not print at
all.

*Cause:* `pp_dwarf_like_objdump` always prints `.debug_abbrev` before
`.debug_info`.  Both tools iterate over the sections of the file in section
header order; in the kernel objects `.debug_abbrev` (section 12/16) precedes
`.debug_info` (13/17), in objects linked by ld from these tests it follows
it.

*Fix:* `harness_string_of_elf_like_objdump` has the `elf_file`; pass the
two sections' indices (from `elf64_file_section_header_table` by name) to
`pp_dwarf_like_objdump`, which emits the two parts in ascending index
order.  `harness_string_of_elf64_debug_{abbrev,info}_like_readelf` are
unaffected; the tool's `--debug-dump=abbrev,info<readelf>` sequencing needs
the same index information, best exposed as a small
`harness_elf64_section_index` in `harness_interface.lem`.

*Estimated diff:* parsing/analysis 0; pretty-printing ~25 lines (index-ordered `pp_dwarf_like_objdump`, a `harness_elf64_section_index` helper), plus ~10 in the OCaml tool for the `abbrev,info<readelf>` order.

### A5. FIXED (291a1ef (by A8)): `.debug_loc` (and `.debug_ranges`) are parsed eagerly as one sequence of lists

*Cluster:* `parse_location_list: Parse fail / parse_n_bytes` (pr18374, 2
linked executables).

*Cause:* `parse_dwarf` parses the whole `.debug_loc` section body as a
sequence of location lists at extraction time.  pr18374's section has a
hole between two lists and 66 unused trailing bytes (readelf warns about
both and prints only the lists that attributes refer to); the eager parse
reads the hole as a list and fails, and with `Assert_extra.failwith` the
failure takes the whole file down, including the `.debug_info` dump that
does not need the lists at all.

*Fix:* parse location and range lists from the offsets that
`DW_AT_location`/`DW_AT_ranges` attributes actually refer to (collect the
`AV_sec_offset` values over the DIE trees, parse a list at each, keep the
result as the existing `location_list_list` sorted by offset), or, as the
minimal step, make the eager parse tolerant: on a `PR_fail` in the middle of
the section keep the lists parsed so far instead of failing.  Either way the
`.debug_info` printers must not depend on `.debug_loc` parsing succeeding.

*Estimated diff:* minimal tolerant parse: parsing/analysis ~10 lines; the offset-driven lazy parse ~60; pretty-printing 0.

### A6. FIXED (496b50c): A `DW_FORM_strp` relocation against an undefined symbol cannot be forced to a number

*Cluster:* `Symbolic operation failed: to_num UND..LASF0+N` (pr18374.aarch64.o).

*Cause:* the test's string references are relocations against undefined
global symbols (`.LASF0` ... `UND`), which the AArch64 data-relocation
interpreter represents as `UND..LASF0 + addend`; the string lookup for
`DW_FORM_strp` then demands a concrete offset.  readelf/objdump treat an
undefined symbol's value as 0 and print the string at the addend.

*Fix:* where a `DW_FORM_strp`/`DW_FORM_line_strp` value is resolved to a
string (`pp_attribute_value` and the `od_*`/resolved printers via
`sym_natural_expect_const` or `to_num`), fall back for a non-constant value
to its offset part (`sym_natural_offset_part`), which is what the linked
value would be with the symbol at 0; the symbolic form can still be shown in
the raw style.

*Estimated diff:* parsing/analysis ~5 lines; pretty-printing ~10 (the `strp` fallback in `pp_attribute_value` and the objdump/resolved styles).

### A7. FIXED (9cf775c): objdump's `file format` name table is short

*Clusters:* `file format [...]` for `yaml2obj` objects with `e_machine` 0
(5 LLVM files); other machines expected.

*Cause:* `objdump_target_name_64` knows AArch64, x86-64, RISC-V, PowerPC64
and MIPS; for anything else it prints `[...]`.  objdump's fallback for a
machine it has no target for is the generic `elf64-little`/`elf64-big`.

*Fix:* make the catch-all `if little then "elf64-little" else "elf64-big"`,
extend the table (`elf64-sparc`, `elf64-s390`, `elf64-loongarch`,
`elf64-ia64-little`, ...), and add the ELF32 twin for the ELF32 dumps when
those exist.

*Estimated diff:* parsing/analysis 0; pretty-printing ~15 lines (table rows and the generic fallback).

### A8. FIXED (291a1ef, 2ac78b0): Robustness: corrupt or truncated DWARF aborts the whole dump

*Clusters (LLVM corpus, one or a few files each):* `Corrupt unit length`
(implicit-const-test: unit length larger than the section, objdump warns and
prints the unit anyway); `parse_die returned Nothing` (debug-entry-invalid:
a bogus end-of-siblings marker as the first DIE, objdump warns "Bogus
end-of-siblings marker" and continues); `parse_die fail: parse_ULEB128' not
given enough bytes` (tag-parent-offset: truncated DIE); `parse_range_list`
and `parse_line_number_header failed` (ranges-baseaddr tests: a range list
running off the section, a `DW_AT_stmt_list` pointing at an empty
`.debug_line`); `parse_line_number_info drop` (verify_invalid_stmt_list: an
offset past the end of `.debug_line`); `dropbytes: cannot drop more bytes`
(decompression-corrupt: a corrupt section header table, where readelf only
warns).  Several of these tests exist precisely to check that the tool
degrades gracefully.

*Cause:* the parsers use `Assert_extra.failwith` (an OCaml exception) for
every malformed construct, and `extract_dwarf` parses every section eagerly,
so any one problem loses the entire output.

*Fix:* a single policy change rather than many local ones: have
`parse_compilation_units`, `parse_line_number_infos` and the list-section
parsers return what they could parse up to the failure (the `parser` type
already has `PR_fail`; the change is to stop turning it into `failwith` at
the section level), and have the printers print the units that parsed.  A
`d_diagnostics : list string` field on `dwarf`, printed by the tool on
stderr as readelf prints its warnings, would keep the information.  This
subsumes the individual entries A1 to A3 and A5 as far as robustness goes;
the exact-output fixes there are still needed for byte-identity.

*Estimated diff:* parsing/analysis ~80 lines (section-level `PR_fail` propagation, a diagnostics field, three call sites); pretty-printing ~15 (print what parsed, emit diagnostics).

### A9. FIXED (c112e68): DWARF64 unit fails with `mydrop of debug_abbrev`

*Cluster:* 9 LLVM executables built from `*-dwarf64.ll` tests
(debug-aranges-dwarf64 and friends).

*Cause:* not yet isolated.  `dwarf_format` exists and the unit header
parser knows the `0xffffffff` escape, so a later 8-byte field is probably
read as 4 bytes (the abbreviation offset of a 64-bit unit header is 8
bytes; `DW_FORM_sec_offset`, `strp` and `ref_addr` values are 8 bytes too),
leaving the abbreviation offset garbage.  To be confirmed with
`--debug-dump='info<raw>'` on one of those files once A8 stops the failure
from hiding the parsed header.

*Estimated diff:* unknown until isolated; expected parsing/analysis ~10 to 30 lines in the 64-bit-format field widths; pretty-printing 0.

### A11. FIXED (5a416dd): A relocated 4-byte field is read as raw bytes: `Read char: is symbolic (width: 4)`

*Cluster:* machine-outliner.ll.o (AArch64 object; 2 comparisons).

*Cause:* some DWARF field that carries a relocation in this object (a
`DW_FORM_data4`/`sec_offset` value, or bytes inside an expression block) is
read with the byte-level `read_char`, which refuses a symbolic byte, rather
than with the symbolic-value readers used for addresses and offsets.  Which
field is to be found from `--debug-dump='info<raw>'` once A8 lets the parse
continue.

*Fix:* read the offending field through `sym_natural_of_bytes`/the
`sym_*` parsers like its neighbours, so that a relocated value stays
symbolic and is printed as its offset part by the objdump style.

*Estimated diff:* parsing/analysis ~5 to 10 lines once the field is found; pretty-printing 0.

### A12. FIXED (571b61b): `DW_OP_GNU_push_tls_address` (0xe0) is missing from the operation table

*Cluster:* `parse_operations_bs fail: encoding not found: 0xe0` (tls.ll,
2 comparisons).

*Cause:* the `DW_OP` table in `dwarf.lem` lacks `DW_OP_GNU_push_tls_address`
(0xe0, no operands; GCC and LLVM emit it for TLS variables in DWARF 2 to 4).
Any other unknown operation in the user range (0xe0 to 0xff) aborts the
parse of the whole file in the same way.

*Fix:* add `("DW_OP_GNU_push_tls_address", 0xe0, [], OpSem_not_supported)`
(and `DW_OP_GNU_uninit` 0xf0, `DW_OP_GNU_encoded_addr` 0xf1,
`DW_OP_GNU_implicit_pointer` 0xf2 ... whichever are not there yet) to the
table, and make an unknown operation a parse failure of that expression only
(printed by objdump as `(Unknown location op 0x..)`), not of the file.

*Estimated diff:* parsing/analysis ~6 lines of table rows plus ~10 for tolerating an unknown operation; pretty-printing ~3 (`(Unknown location op 0x..)`).

### A10. FIXED (7cb2e76): A relocation against a common symbol aborts relocation extraction

*Cluster:* `failed extracting relocations: Invalid secion id 65522`
(bitfields.ll.o, AArch64: a `.debug_info` relocation whose symbol is
`COM b`).

*Cause:* the symbolic relocation extraction in `elf_symbolic.lem` maps a
symbol's `st_shndx` to a section and rejects the special indices;
`SHN_COMMON` (0xfff2 = 65522) and `SHN_ABS` (0xfff1) are legitimate here.

*Fix:* in the function that builds the symbolic address from a symbol table
entry, treat `SHN_ABS` as the constant `st_value` and `SHN_COMMON` as an
`Absolute`/undefined-style value (readelf applies such relocations with the
symbol value, 0 for commons in a relocatable object), alongside the existing
`SHN_UNDEF` handling that produces `UND.<name>` values.

*Estimated diff:* parsing/analysis ~10 lines in `elf_symbolic.lem`; pretty-printing 0.

### A13. DEFERRED: `DW_FORM_GNU_ref_alt` and `DW_FORM_GNU_strp_alt` are unknown

*Cluster:* `parser_of_attribute_form_non_indirect: unknown attribute form`
(`testfile-dwzstr`, `testfile-dwzstr.multi`; 4 comparisons).

*Cause:* dwz-compressed debug info refers into a supplementary file
(`.gnu_debugaltlink`) with the GNU forms 0x1f20 (`ref_alt`, an offset into
the alternate `.debug_info`) and 0x1f21 (`strp_alt`, an offset into the
alternate `.debug_str`), both `offset_size` bytes wide.  The form table in
`dwarf.lem` does not have them, so the parse of the whole file fails.  Every
Fedora/Debian distribution debuginfo package is dwz-processed, so this is a
real-world shape, not a corner case.

*Fix:* add the two forms to the form table with the same width class as
`DW_FORM_strp`/`ref_addr`, and a `AV_alt_strp`/`AV_alt_ref` (or reuse of
`AV_sec_offset` with a form tag) attribute value that the printers render as
readelf does (`(alt indirect string, offset: 0x...)` and
`<alt 0x...>`); resolving them needs the alternate file, which the tool can
load later via `.gnu_debugaltlink` if wanted.

*Estimated diff:* parsing/analysis ~15 lines (two table rows and the value
constructor); pretty-printing ~10 (the two readelf renderings, and the
objdump style).

## B. ELF32 (`src/adaptors/harness_interface.lem`, `src/abis/abi_utilities.lem`)

### B1. FIXED (5805e17, deabe09): ELF32 relocations print `R_386_NONE` and no symbol for every entry

*Cluster:* `readelf-r` on every i386 object with relocations (46 files).

*Cause:* `harness_string_of_elf32_reloc_entry` still has its two `FIXME`
stubs: `let typ = os 0` and `let idx = 0`, so every relocation is printed
as type 0 with the null symbol.  The ELF64 printer uses
`parse_elf64_relocation_info`; there is no ELF32 counterpart.

*Fix:* add to `abi_utilities.lem`, next to the 64-bit one,

    val parse_elf32_relocation_info : elf32_word -> (natural * natural)
    let parse_elf32_relocation_info w =
      let n = natural_of_elf32_word w in
      (natural_land n 255, n div 256)

(ELF32 `r_info` is `sym << 8 | type`), and in the printer replace the two
stubs by `let (typ, idx) = parse_elf32_relocation_info rel.elf32_r_info in
let typ = os typ in`.  The rest of the printer already does the symbol and
section lookups.  `harness_string_of_elf32_relocs'` handles only REL
sections; a RELA variant (`harness_string_of_elf32_reloc_a_entry`) is
needed for i386 objects with `.rela` sections, mirroring the 64-bit pair.

*Estimated diff:* parsing/analysis ~6 lines (`parse_elf32_relocation_info`); pretty-printing ~5 to use it, plus ~60 for the ELF32 RELA printer and its section iteration mirroring the ELF64 pair.

### B2. FIXED (b89767f, 367a7b6): Section headers with a zero `sh_entsize` (strip-13/14/15 tests)

*Clusters:* `readelf-S` ES column `0c`/`10` vs `00` (12 files); `readelf-r`
omits a REL/RELA section whose `sh_entsize` is 0 (9 files).

*Cause:* those test objects deliberately carry `sh_entsize = 0` on
relocation sections.  readelf's `CHECK_ENTSIZE_VALUES` reports "Section N
has invalid sh_entsize" on stderr and substitutes the expected size for the
rest of the dump; linksem prints the stored value and its relocation reader
yields no entries for the section.

*Fix (optional):* a small `harness_effective_entsize mach class typ entsize`
applying readelf's substitution for SYMTAB/DYNSYM/REL/RELA/DYNAMIC sections
when the stored value is 0, used by the section-header and relocation
printers.  Only matters for corrupt or hand-made objects; recorded for
completeness.

Related: a relocation section whose size is not a multiple of the entry size
(strip-13rela: 12 bytes with 24-byte entries) makes
`read_elf64_relocation_section'` fail on the partial entry, and the failure
text `read_char: sequence is empty` is printed in place of the section.
readelf prints the section header with "contains 0 entries".  Fix: read
`size div entsize` entries and ignore the remainder, in the ELF64 and ELF32
relocation section readers of `elf_relocation.lem`.

*Estimated diff:* parsing/analysis ~6 lines (`size div entsize` in the two relocation section readers); pretty-printing ~15 (`harness_effective_entsize` and its two uses).

### B3. FIXED (61467d9, 205a398, dbb67ae): Unknown relocation types, and the AArch64 ILP32 names

*Cluster:* `unrecognized: 55aa` vs `Invalid X86_64 relocation` /
`Invalid AARCH64 relocation type` (strip-14/15 tests, 6 files);
`R_AARCH64_P32_ABS32` vs `Invalid AARCH64 relocation type` (1 file).

*Cause:* `string_of_amd64_relocation_type` and
`string_of_aarch64_relocation_type` (and the x86/ppc64 ones) end in a
`failwith`-free catch-all with their own wording; readelf prints
`unrecognized: %x`.  The AArch64 table lacks the ILP32 relocation names
(`R_AARCH64_P32_*`, types 1 to 255 that share the space with the
`R_AARCH64_*` names only above 256).

*Fix:* change the catch-all arm of each `string_of_*_relocation_type` to
`"unrecognized: " ^ hex_string_of_natural n`, and add the `R_AARCH64_P32_*`
entries to `abi_aarch64_relocation.lem` from the ABI document (the ELF64
type space is disjoint, so the table simply grows).

Also one wrong name in the AArch64 table: type 541 is
`R_AARCH64_TLSIE_ADR_GOTTPREL_PAGE21` but prints as
`R_AARCH64_TLSIE_MOVW_GOTTPREL_PAGE21` (tls-at-location.ll.o); check the
neighbouring TLSIE/TLSDESC entries against the ABI table at the same time.

*Estimated diff:* parsing/analysis 0; pretty-printing ~10 lines of catch-all changes, ~40 rows for the `R_AARCH64_P32_*` names, 1 for the misnamed entry.

### B4. FIXED (f5231f6 (ELF64; the ELF32 twin is G11)): Symbol versions are not shown in relocation dumps of dynamic objects

*Cluster:* `R_X86_64_GLOB_DAT ... __cxa_finalize@GLIBC_2.2.5 + 0` vs
`... __cxa_finalize + 0` (12 LLVM linked files; also `/bin/ls` earlier).

*Cause:* readelf appends `@VERSION` to a `.dynsym` symbol's name in the
relocation printer exactly as in the symbol table printer;
`harness_string_of_elf64_reloc_a_entry` prints the bare name.

*Fix:* give `harness_string_of_elf64_relocs'` the `harness_symbol_versions`
computed by `harness_symbol_versions_of_elf64_file` (as
`harness_string_of_elf64_syms_selected` already does) and apply
`harness_symbol_version_suffix` to names of symbols from `.dynsym`.

*Estimated diff:* parsing/analysis 0; pretty-printing ~15 lines (thread `harness_symbol_versions` through `harness_string_of_elf64_relocs'` and apply the suffix).

### B5. FIXED (c3c33ef): Negative addends are printed as `+ -N`

*Cluster:* `_Z2f1v - 4` vs `_Z2f1v + -4` (7 LLVM objects with negative
RELA addends).

*Cause:* the ELF64 RELA printer builds `" + " ^ show add` for any addend.
readelf prints ` - ` and the magnitude for negative ones.

*Fix:* `if add < 0 then " - " ^ show (0 - add) else " + " ^ show add` in
`harness_string_of_elf64_reloc_a_entry` (and the ELF32 RELA printer from
B1).

*Estimated diff:* parsing/analysis 0; pretty-printing ~3 lines (each RELA printer).

### B6. FIXED (de93752, eb68060): Addresses of 2^63 and above: `int64_of_big_int`, and a corrupted round trip

*Cluster:* `Failure("int64_of_big_int")` on `-s -S -l -r -t` for
`symbolize-64bit-addr.elf.x86_64` (sections at `0xffffffff00000000`,
segments at `0xfffffffefffff000`); and `--in-out` on the same file differs
from `hexdump` in one byte (the byte after `.text`, at file offset 0x1008,
becomes 0).

*Cause:* some conversion in the ELF64 printing or serialisation path goes
through `Ml_bindings`' `int64_of_big_int` (OCaml `Int64` is signed), which
fails for unsigned 64-bit values with the top bit set; the round-trip
corruption is presumably the same value wrapping somewhere in
`bytes_of_elf64_file`'s placement of section bodies and gap bytes, and needs
isolating with this file since a serialisation bug is the most serious kind
for linksem.

*Fix:* find the `int64_of_big_int` users on the ELF64 paths (`grep` in
`ml_bindings.ml` and the `.lem` `target_rep` declarations) and replace them
by `Nat_big_num`/`Uint64_wrapper` operations; then re-run the round trip on
this file.

*Estimated diff:* parsing/analysis ~10 to 20 lines replacing `int64` conversions, plus whatever the serialisation bug turns out to need (unknown, probably ~10); pretty-printing 0.

### B7. FIXED (5e2e261, dbb67ae (names; further ABIs' relocation tables remain)): Other machines' names and tables

*Clusters:* `Machine: None | RISC-V | ARM | IBM S/390 | LoongArch | Atmel
AVR 8-bit microcontroller | MC68000` vs `Other architecture` (and `ARM` vs
`AArch`: `string_of_elf_machine_architecture` returns "AArch" for
`EM_ARM` = 40) (34 files); `OS/ABI: AMD HSA | Standalone App` vs
`Architecture defined` (3 files); `Version: 2 <unknown>` vs `Extended ELF
version` (1); `.MSP430.attributes MSP430_ATTRIBUTES` vs `LOPROC+0x...` (1);
relocation names `R_ARM_ABS32`, `R_AMDGPU_REL32`, `R_LARCH_PCALA_HI20` vs
`Cannot deduce ABI` (37 in the full LLVM run); MIPS section types
`MIPS_DWARF`, `MIPS_REGINFO` vs `LOPROC+N` (8); the CSKY header flags
description `0x..., abiv2` (6); the MIPS `st_other` flag `[MICROMIPS]` vs
`[<other>: N]` (1); the AMDGPU `NT_AMDGPU_METADATA` note, which readelf
decodes as msgpack (6).

*Cause:* the name tables in `elf_header.lem` (`string_of_elf_machine_architecture`,
the OS/ABI names, `e_version`), the processor-specific section type names
in `harness_string_of_proc_section_type`, and the per-ABI relocation name
tables cover the four ABIs linksem models.

*Fix:* extend `string_of_elf_machine_architecture` from readelf's
`get_machine_name` list (a pure name table; the `EM_ARM` entry should read
"ARM"), the OS/ABI table likewise, print `N <unknown>` for an unknown
`e_version`; add `.MSP430.attributes`-style names per machine where cheap.
Relocation names for further machines need per-ABI tables and are a
separate piece of work (`abi_arm_relocation.lem`, ...); until then the
catch-all should be readelf's `unrecognized: %x` (B3).

*Estimated diff:* parsing/analysis 0; pretty-printing ~150 lines of name tables (machines ~120, OS/ABI ~10, e_version ~3, MIPS/CSKY oddments ~20); relocation name tables for further ABIs are ~100 to 300 rows each and a separate decision.

### B9. FIXED (1abd6be): A corrupt ELF header or section table aborts every dump

*Cluster:* `takebytes: cannot take more bytes than are contained in
sequence` on every comparison of `Inputs/invalid.elf` (7), and `dropbytes:
cannot drop more bytes` on decompression-corrupt (5).

*Cause:* `read_elf64_file` reads every section body eagerly by offset and
size and fails on the first one that lies outside the file; readelf warns
("Size of section N is larger than the entire file!") and dumps what it
can.

*Fix:* in `read_elf64_file`'s construction of `elf64_file_interpreted_sections`,
clamp or skip bodies that lie outside the file (recording the fact), so
that header-level dumps (`-h -S -l`) still work on such files; the
`--in-out` round trip cannot be expected to succeed on them and should be
skipped by the harness for files readelf itself warns about.

*Estimated diff:* parsing/analysis ~20 lines in `read_elf64_file` (clamp or skip out-of-file bodies, record the fact); pretty-printing 0.

### B8. FIXED (62e490a): The GNU hash histogram is printed for an empty table

*Cluster:* `-I` prints `Histogram for .gnu.hash ... (total of 1 bucket)`
with a zero row where readelf prints nothing (6 LLVM linked files).

*Cause:* readelf's `get_num_dynamic_syms` gives up on a GNU hash table all
of whose buckets are 0 (`maxchain == 0xffffffff`), so no histogram is
printed; `harness_string_of_elf64_histogram` prints the table regardless.

*Fix:* in the `gnu` branch, `if List.all (fun b -> b = 0) buckets then []`.

*Estimated diff:* parsing/analysis 0; pretty-printing ~2 lines.

### B10. FIXED (1855c75, 35edc04): Files without section headers: string table failure, and a lossy round trip

*Clusters:* `obtain_elf64_string_table: invalid offset into section header
table` on `-S -l -t -a` of every ELF64 core file (49 comparisons, 13 files:
`testfile-backtrace-*.core`, `testfile66.core`, `testfile-riscv64-core`,
...); `obtain_elf32_string_table` likewise for `testfile42_noshdrs` and the
ELF32 cores (6); and `--in-out` differs from `hexdump` on 18 files, all of
them core files or `*noshdrs*`.

*Cause, part 1:* `e_shnum = 0` and `e_shstrndx = 0` are the normal state of
a core file (and of `objcopy --strip-section-headers` output).
`obtain_elf64_string_table` (and the 32-bit twin) is called
unconditionally by the section-header, segment and `-a` printers and
`fail`s when section 0 does not exist, taking those dumps down with it,
although `-l` needs no string table at all.

*Cause, part 2 (serious):* `bytes_of_elf64_file` lays out the header, the
two tables, the section bodies and `elf64_file_bits_and_bobs`, but the
segment bodies are commented out (`let segs_layout = [] (* ... *)`).  For a
file whose content is described only by program headers, every segment body
(all the notes and memory images of a core) is written as zeros or dropped:
`testfile-backtrace-demangle.core` comes back with zeros from file offset
0x700 on, and `testfile54-64.noshdrs.so` is truncated after the program
header table.  This is the serialisation half of B6's concern: linksem's
own file model does not round-trip such files.

*Fix:* (1) make the string-table lookup optional: `maybe string_table`,
with the printers using `<no-strings>`-style output as readelf does when
`e_shstrndx` is 0 (see C8), and `-l` never asking for it.  (2) Restore
`segs_layout` in `bytes_of_elf64_file` (and the ELF32 twin) so that segment
bodies with `p_filesz <> 0` are laid out at `p_offset` alongside section
bodies; the existing `foldM` already tolerates overlapping pieces (it cuts
the overlap), so sections inside segments are handled.  The failing
`List.length` check for segments that is `true`-d out should come back at
the same time.  Add `testfile-backtrace-demangle.core` and
`testfile54-64.noshdrs.so` to the round-trip regression set.

*Estimated diff:* parsing/analysis ~25 lines (optional string table, the
uncommented segment layout and its length check, both classes);
pretty-printing ~10 (the `<no-strings>` case and the `-l` path).

### B11. FIXED (eb68060): Trailing bytes after the last section are lost in the round trip

*Cluster:* `--in-out` on `testfile56` is one byte short (0x1d0e versus
0x1d0f bytes): the file ends with one byte after `.strtab`, which ends at
0x1d0e.

*Cause:* `elf64_file_bits_and_bobs` (the gap collector in `read_elf64_file`)
apparently does not record bytes after the last section or table, only gaps
between them.  B6's one-byte corruption after `.text` in
`symbolize-64bit-addr.elf.x86_64` may be the same gap logic with an
interior gap.

*Fix:* in the gap computation, treat the end of the file as the final
boundary so that a trailing run is recorded like any other gap; then re-run
the round trip on `testfile56` and the B6 file.

*Estimated diff:* parsing/analysis ~5 lines; pretty-printing 0.

### B12. FIXED (83e5e1e): SysV hash tables with 8-byte entries (Alpha, s390x)

*Cluster:* `-I` histogram rows differ on `testfile10` (Alpha) and
`testfile-s390x-hash-both`, `testfiles390x` (s390x): e.g. `0 4 (26.7%) / 1
10 (66.7%) / 2 1 (6.7%)` versus `0 8 / 1 7`.

*Cause:* on 64-bit Alpha and s390 the `DT_HASH` table's `nbucket`,
`nchain`, bucket and chain entries are 8 bytes wide (readelf's
`get_num_dynamic_syms` uses an 8-byte entry size for `EM_ALPHA`, `EM_S390`
and `EM_S390_OLD` in ELF64 files); linksem reads 4-byte entries for every
machine, so the table it histograms is garbage that happens to look
plausible.

*Fix:* give the SysV hash reader in `harness_interface.lem` (the code
around `harness_sysv_chain_length`) an entry width chosen from the machine
and class, 8 for those two machines in ELF64 and 4 otherwise.

*Estimated diff:* parsing/analysis ~8 lines; pretty-printing 0.

### B13. DEFERRED: segments larger than the file: `.debug` files and truncated cores

*Clusters:* `dropbytes: cannot drop more bytes than are contained in
sequence` on every comparison of the `.debug` files
(`testfile-splitdwarf4-not-split4.debug` and others, 37 comparisons, 5
files); `takebytes` on the truncated core `testfile62` (14).

*Cause:* `obtain_elf64_interpreted_segments` reads `p_filesz` bytes at
`p_offset` for every segment.  `objcopy --only-keep-debug` keeps the
original program headers (a 6984-byte file whose `PT_LOAD`s describe the
original executable), and a core file may be truncated.  This is a
refinement of B9 (which was raised on corrupt inputs): `.debug` files are
routine, so the priority is higher than B9 suggested.

*Fix:* as B9, in the segment reader specifically: clamp a segment body to
the bytes actually present (recording the shortfall), never fail; readelf
prints the program headers without reading the bodies at all.  Together
with B10's `segs_layout` the round trip must then write only the bytes it
read.

*Estimated diff:* parsing/analysis ~10 lines in the two segment readers;
pretty-printing 0.

### B14. FIXED (4aaf55b): A segment with `p_memsz < p_filesz` is rejected

*Cluster:* `obtain_elf32_interpreted_segments: memory size of segment cannot
be less than file size` on every ELF32 comparison of the m68k and other
ELF32 cores (30 comparisons, 6 files).

*Cause:* the `PT_NOTE` segment of a core file has `p_memsz = 0` and a
non-zero `p_filesz`; the ELF32 and ELF64 segment readers `fail` on
`memsz < filesz`, which the ELF specification requires only for `PT_LOAD`.

*Fix:* apply the check to `PT_LOAD` segments only (or drop it, and let the
memory-image constructors that rely on it take `max memsz filesz`).

*Estimated diff:* parsing/analysis ~4 lines (both classes); pretty-printing 0.

## C. readelf-style ELF printers (`src/adaptors/harness_interface.lem`)

### C1. FIXED (7bae489): blank line before "Program Headers:" lost

*Cluster:* `readelf-l` (71 files), `-a` on executables.  My refactoring into
`harness_string_of_elf64_program_headers_body` dropped the empty line
between the "There are N program headers" preamble and the body when the
preamble is printed.  Fixed by joining with `"\n"`.

*Estimated diff:* 1 line, done.

### C2. FIXED (f0007b6): "There is 1 program header" (singular)

*Cluster:* `readelf-l` (64 files).  readelf uses `ngettext` for the count;
linksem always prints "There are N program headers".

*Fix:* in `harness_string_of_elf{32,64}_program_headers`, `if List.length
pht = 1 then "There is 1 program header, ..." else "There are N program
headers, ..."` (the same `entries_word`-style helper as the symbol and
relocation printers already use).

*Estimated diff:* parsing/analysis 0; pretty-printing ~4 lines (both ELF classes).

### C3. FIXED (41505c5): Segment flags print `X`, readelf prints `E`

*Cluster:* `readelf-l`/`-a` on every executable with an executable segment
(49 + 91 files); also seen earlier on `/bin/ls`.

*Cause:* `string_of_elf_segment_permissions` in
`elf_program_header_table.lem` uses the letters R, W, X; readelf's
`get_segment_flags`-style rendering is R, W, E (as in `R E`, `RW `).

*Fix:* change the third letter to `"E"` in that one definition.  Check the
other users of the function (`string_of_elf_segment_permissions` is also
used by the `--in-out`-independent memory-image printers) for anything that
relies on the letter.

*Estimated diff:* parsing/analysis 0; pretty-printing 1 line.

### C4. FIXED (d3831e4): "There are no symbols in this file." where readelf prints nothing

*Cluster:* `readelf-s` on objects without a symbol table (26 files), and
consequently `-a` (13 files).

*Cause:* `harness_string_of_elf64_syms` prints that message when no
SYMTAB/DYNSYM section exists; readelf, when section headers are present,
prints nothing (its message "Dynamic symbol information is not available
for displaying symbols." is only for files without section headers).

*Fix:* pass `""` as `none_msg` in `harness_string_of_elf64_syms` (and the
ELF32 twin), keeping the message only for the no-section-headers case if
that path is ever added.

*Estimated diff:* parsing/analysis 0; pretty-printing ~2 lines.

### C5. FIXED (36521bf): A truncated or empty note section aborts the note dump

*Cluster:* `read_char: sequence is empty` printed inside `-n` output
(unknown.s: a 4-byte section of type NOTE, 4 files).

*Cause:* `harness_string_of_elf64_note_lines` turns a `Fail` from
`read_all_elf64_notes_aligned` into an output line; readelf prints the
section header, warns on stderr and stops.

*Fix:* on `Fail _` return `[]` (the header lines are already emitted by the
caller); the reader itself should stop, not fail, when fewer than 12 bytes
remain, mirroring readelf's `data_remaining < min_notesz` check, so make
`read_all_elf64_notes_aligned` return the notes read so far in that case.

*Estimated diff:* parsing/analysis ~6 lines (stop instead of fail in `read_all_elf64_notes_aligned`); pretty-printing ~2.

### C6. FIXED (f042c08, 1af6d71 (except the symbol suffix, G14)): GNU build attribute notes are printed generically

*Cluster:* `GA$<version>3p1 ... Applies to region from ...` vs
`GA$3p1 ... description data: ...` (note-2/3 tests, 12 files).

*Cause:* readelf special-cases owners beginning `GA` followed by one of
`*$!+` with types 0x100/0x101 (`print_gnu_build_attribute_name` and
`_description`): the owner is rewritten with the attribute name and the
description gives the address range.  Not implemented.

*Fix:* a `harness_gnu_build_attribute` pair in the notes printer,
following readelf.c's rendering rules (name types: `*` numeric, `$` string,
`!` bool, `+` bool; the well-known attribute letters `1`..`8` and their
names, e.g. `<version>`, `<stack prot>`, `<PIC>`, `<ABI>`); medium effort,
only relevant to gcc's annobin output.

*Estimated diff:* parsing/analysis 0; pretty-printing ~120 lines (name rewriting, the attribute-letter table, the region description).

### C7. FIXED (b0062d7): `DYN (Position-Independent Executable file)`

*Cluster:* `-h`, `-l`, `-a` on `testfile-arm-flags` and two others.

*Cause:* readelf prints `DYN (Position-Independent Executable file)` when
the file is `ET_DYN` and its dynamic section has `DT_FLAGS_1` with
`DF_1_PIE` (or, failing a dynamic section, when it has a `PT_INTERP`);
linksem prints `DYN (Shared object file)` for every `ET_DYN`.

*Fix:* in `harness_string_of_elf64_header` (and the ELF32 twin, and the
`Elf file type is` line of `-l`), take a flag computed from the dynamic
section by the caller; `harness_interface.lem` already reads the dynamic
section for `-d`, so this is a small plumbing change.

*Estimated diff:* parsing/analysis 0; pretty-printing ~12 lines.

### C8. FIXED (12cd142): `PN_XNUM`, `<no-strings>`, and the section-0 extension fields

*Cluster:* `testfile-phdrs.elf` (66000 program headers): `Number of program
headers: 65535 (66000)` versus `65535`; section name `<no-strings>` versus
blank.

*Cause:* when `e_phnum = PN_XNUM` (0xffff) the real count is in section
0's `sh_info` (likewise `e_shnum = 0` with `sh_size`, and `e_shstrndx =
SHN_XINDEX` with `sh_link`); readelf prints the real count in parentheses,
and prints `<no-strings>` as every section name when `e_shstrndx` is 0.
linksem prints the raw header fields and, with no string table, the empty
string (or fails: B10).

*Fix:* a `harness_elf64_real_counts` helper reading section 0 when the
header fields are escaped, used by the header printer for the
parenthesised values and by the table readers for how many entries to
read (readelf reads 66000 program headers here; whether linksem's
`read_elf64_file` should too is a separate question, since it currently
reads `e_phnum`); the `<no-strings>` name in the section-header printer
when B10's optional string table is `Nothing`.

*Estimated diff:* parsing/analysis ~10 lines; pretty-printing ~10.

### C9. FIXED (06f99c1): Control characters in symbol names

*Cluster:* `.L2^B1` versus `.L2` followed by a raw 0x02 byte
(`testfile-strtab`, `testfile-strtab.debuginfo`; 8 comparisons, `-s`, `-r`,
`-a`).

*Cause:* readelf's `print_symbol` renders bytes below 0x20 as `^` plus the
letter (0x02 as `^B`), and 0x7f as `^?`, so that its output is printable;
linksem prints the bytes as they are.  (gas's local label names carry a
control character as a separator.)

*Fix:* a `harness_printable_name` used wherever a symbol or section name
from a string table is printed in the readelf styles: map `c < 0x20` to
`"^" ^ char (c + 0x40)`, 0x7f to `"^?"`; non-ASCII bytes readelf prints
as `<0x..>` in some versions, to be checked against 2.42.

*Estimated diff:* parsing/analysis 0; pretty-printing ~10 lines plus one
call per name column.

### C10. FIXED (2c69ca4): "There are no static relocations in this file."

*Cluster:* `-r` on 6 linked files with dynamic relocations but no
`SHT_REL`/`SHT_RELA` sections (`testfile-gnu-property-note` and friends).

*Cause:* when there are no relocation sections but the dynamic section has
`DT_REL`/`DT_RELA`/`DT_JMPREL`, readelf prints two lines: "There are no
static relocations in this file." and "To see the dynamic relocations add
--use-dynamic to the command line."; otherwise "There are no relocations in
this file."  linksem always prints the latter.

*Fix:* in `harness_string_of_elf64_relocs`, choose the message from whether
the dynamic section (already available) has those tags.

*Estimated diff:* parsing/analysis 0; pretty-printing ~6 lines.

### C11. FIXED (1c7a187): "There is no dynamic section in this file." for a `NOBITS` `.dynamic`

*Cluster:* `-a` on `.debug` files whose `.dynamic` is `SHT_NOBITS`
(`testfile54-64.so.debug`): linksem prints the error text
`obtain_elf64_dynamic_section_contents: no SHT_DYNAMIC section header
entries` in the output.

*Cause:* the `-d` part of `-a` turns the `Fail` into an output line rather
than the readelf message, and treats a `NOBITS` dynamic section as absent
(which is right for the contents) but with the wrong wording.

*Fix:* print "There is no dynamic section in this file." on `Fail` (and
when the section is `NOBITS`), in `harness_string_of_elf64_dynamic`.

*Estimated diff:* parsing/analysis 0; pretty-printing ~2 lines.

### C12. FIXED (6354d2e): `GNU_PRELINKED` timestamp formatting

*Cluster:* `2011-01-12T02:46:26` versus `2011-1-12T02:46:26`
(`testfile54-64.prelink.so`).

*Fix:* zero-pad the month (and check day) in the dynamic-tag printer.

*Estimated diff:* pretty-printing 1 line.

## D. Harness and tool issues (not `src/*.lem`), for the record

- The compare harness used `aarch64-linux-gnu-objdump` for every file; its
  `file format` string and its relocation names differ for x86 files.  Now
  chooses the native `objdump` for non-AArch64 machines.
- Linked executables produced by `ld -nostdlib --entry=0` from the test
  sources exercised the section-order issue A4 and the singular-count issue
  C2 that the kernel objects never showed; keeping both object and executable
  forms in the corpus is paying off already.
- LLVM corpus: the objects come from each test's own `RUN` line (`yaml2obj`,
  `llvm-mc`, `llc`, with lit's `%s`/`%t`/`%llc_dwarf` substitutions and
  `<`/`-o -` redirections handled); tests that only run `opt` or
  `llvm-dwarfdump` on precompiled inputs contribute no object, the inputs
  themselves are copied.  About half the `.ll` tests produce an object.

- `common/compare.py` skips files above 64 MiB (`COMPARE_MAX_BYTES`) with
  the reason `file too large`.  elfutils' `testfile-dwp-5-cu-index-overflow.dwp`
  is 4 GiB; `hexdump -v` of it is 20 GB of text, and the `--in-out`
  comparison on it is what the first elfutils run was stuck on when the
  session running it was killed.
- The native `objdump` has no PowerPC, RISC-V or s390 target, so its
  `file format` line is the generic `elf64-big`/`elf64-little` where
  linksem prints `elf64-powerpc`/`elf64-littleriscv` (7 comparisons in the
  elfutils run).  These are oracle deficiencies, not linksem bugs; a
  multi-target binutils build (`--enable-targets=all`) would remove them.
- Core files are a corpus kind of their own (`CORE`): 18 in elfutils, none
  in the other corpora.  Every one currently fails (B10, B14), so after
  those fixes the core files will be the first exercise of linksem's
  segment-only file model against readelf.

- Name tables were taken from readelf's *behaviour*, not its source: a
  generated object carrying every relocation type from 0 to 1200 (or 0 to
  255 for ELF32), and a generated header for every `e_machine` (0 to 65535),
  `EI_OSABI` and `EI_VERSION` value, run through readelf 2.42 and the names
  read off.  The generators are `validation/common/mkreloc.py` and
  `mkhdr.py`; the same objects are the quickest check that a table is right
  (`diff <(readelf -W -r gen.o) <(linksem readelf -r gen.o)`).
- `common/compare.py` gained `COMPARE_ONLY` (a regular expression over
  object names) for re-checking one cluster after a fix, writing to
  `comparisons-only.json` so as not to disturb a run's summary;
  `common/quickcheck.py` drives it, reporting status transitions against the
  baseline runs and exiting with status 2 when anything regressed.
- The three corpora were re-run after the fixes as `results/run5`, against
  a `results/baseline` made by combining run2 (binutils) and run4 (LLVM,
  elfutils); see section E.

## G. Found while fixing (19 September 2026)

Items fixed in passing, each its own commit, and what remains open after
the fixes above.  Nothing here was in the original triage.

### G1. FIXED (e458fc9): `GNU_PROPERTY` and `GNU_SFRAME` segment types printed as "Invalid GNU EXT segment type"

### G2. FIXED (ef1a914): AArch64 processor-specific dynamic tags

`DT_AARCH64_BTI_PLT` (and PAC_PLT, VARIANT_PCS) made the dynamic section of
any AArch64 file that has them unparseable, which also lost the symbol
versions (B4) and the PIE flag (C7) on those files, since both read the
dynamic section.  `abi_aarch64_dynamic.lem` is new, after the Power64 one,
and the tool now chooses the processor-specific tag interpreters by
machine instead of always using Power64's.

### G3. FIXED (c65cc79): the requested interpreter printed as raw bytes

readelf reads `PT_INTERP` with `fscanf "%s"`, so it stops at a NUL or
white space; a `.debug` file whose `.interp` is `SHT_NOBITS` printed
garbage.

### G4. FIXED (1fea0f2): section-to-segment mapping tests

`gnu_ext_section_to_segment_mapping.lem` used the section header *entry*
size as the section size, tested `sec_off - (seg_off + size) <= filesz`
instead of `sec_off - seg_off + size <= filesz`, and applied the VMA tests to
non-`SHF_ALLOC` sections.  `.got.plt` at the end of `GNU_RELRO`, and
`.debug_aranges` in a `.debug` file's segment, were wrongly listed.

### G5. FIXED (582f027): a named section symbol printed as its section's name in `-r`

### G6. FIXED (7948f43): `SHT_REL` sections in ELF64 files were not printed by `-r`

### G7. FIXED (67fe212): `DT_FLAGS_1` printed from a list of hand-written combinations

Now table-driven, every set flag in bit order (readelf's), which adds `PIE`
and the later flags.

### G8. Core files' notes: FIXED (35edc04) for the data, OPEN for `NT_FILE`

readelf prints no description data for `CORE`-owned notes.  For `NT_FILE` the
readelf 2.42 in use (native and the AArch64 cross build alike) prints
"Cannot decode 64-bit note in 32-bit build" where it would otherwise list the
mapped files; linksem prints nothing there, so one line per core file still
differs.  Decoding `NT_FILE` (page size, then start/end/offset triples and
the file names) is straightforward if wanted.

### G9. OPEN: files without section headers and the dynamic segment

readelf reconstructs the dynamic section, the dynamic symbol table, the
version information and the hash tables from `PT_DYNAMIC` when there are no
section headers (`testfile*noshdrs*`, and `--use-dynamic`); linksem's
readers all go through section headers, so `-d`, `-s`, `-V`, `-I` and `-a`
print nothing or an error text for such files.  A segment-based
`obtain_elf64_dynamic_section_contents` variant would be the first step.

### G10. OPEN: MIPS64 relocation rows

readelf prints a MIPS64 RELA entry as three lines (the type, then
`Type2:` and `Type3:` lines); linksem prints "A/B/C" in the type column.
The MIPS name table in `abi_mips64_relocation.lem` was not checked against
readelf either (the generated-object technique of section D applies; 111
names).

### G11. OPEN: symbol versions in ELF32 dumps

The ELF32 twins of B4: `-s` and `-r` on i386 files print `__libc_start_main`
where readelf prints `__libc_start_main@GLIBC_2.0 (2)`.  The version-table
readers exist only for ELF64 (`harness_symbol_versions_of_elf64_file`).

### G12. OPEN: per-machine header flag descriptions and attributes

`Flags: 0x5, RVC, double-float ABI` (RISC-V), `0x1, abiv1` (PowerPC64),
`0x5000200, Version5 EABI, soft-float ABI` (ARM), CSKY's; and the `-A`
attribute sections of PowerPC64 (`Tag_GNU_Power_ABI_FP`) and RISC-V.  Name
tables per machine.

### G13. OPEN: the `.debug_abbrev` dump when no unit parses

readelf prints the abbreviation table from the section itself; linksem
prints it per compilation unit, so when the units do not parse (A8 now keeps
the file alive) the abbreviation dump is empty or shows only a header
(3 LLVM corrupt-input tests each way).

### G14. OPEN: GNU build attribute notes in relocatable objects

readelf appends the symbol at a region's start address in parentheses,
`Applies to region from 0 (note1.s)`, found through the note section's
relocations and the symbol table; C6 prints the region without it.

### G15. OPEN: what the tolerant DWARF parsing does not yet do

The several level-0 DIEs of pr26548 (A1) are skipped, not printed; the
parse failures recorded in the new `d_diagnostics` field are not yet printed
by the tool (readelf warns on stderr); an unknown `DW_OP` still aborts the
expression's parse (A12 added the GNU operations, so the corpus no longer
hits it).

### G17. FIXED (536c856): `GNU_MBIND+N` segment types

### G18. FIXED (fd541b5): `<no .debug_str section>`, and no "(location list)" after `DW_AT_GNU_locviews`

### G16. OPEN: LLVM's `yaml2obj` objects for other machines

Relocation names for ARM, AMDGPU, LoongArch, s390, Sparc, Alpha, IA-64, BPF
and the others still print as `Cannot deduce ABI` (B7 left them as a
separate decision); the machine names themselves are now right.

## E. Counts so far

| run | corpus | files | identical | differ | linksem failed | skipped |
|---|---|---|---|---|---|---|
| run2 | binutils | 479 (249 objects, 230 executables) | 3046 | 468 | 37 | 1236 |
| run3 | llvm (first pass, 436 files) | 436 | 3008 | 517 | 143 | 686 |
| run4 | llvm (RUN-line handling fixed) | 1240 (690 objects, 552 executables) | 8454 | 1859 | 167 | 1912 |
| run4 | elfutils (301 checked-in binaries) | 300 (139 executables, 87 objects, 56 shared, 18 core) | 1386 | 812 | 152 | 646 |

The elfutils run also had 4 `oracle failed` (readelf itself exiting non-zero).
Before the fixes, the `differ` counts were dominated by C3 (`E` vs `X`), C2
and C4, and the `linksem failed` counts by A2 (missing `DW_AT_stmt_list`)
and A4 (section order).

### After the fixes: run5 (19 September 2026, evening)

The same three corpora with the fixed library (all commits up to 41aba2f,
i.e. before the last three small ones: 2b4d436, 536c856, fd541b5), reported
against a baseline combining run2 (binutils) and run4 (LLVM, elfutils):
**0 regressions, 2872 comparisons fixed**.

| run | corpus | files | identical | differ | linksem failed | oracle failed | skipped |
|---|---|---|---|---|---|---|---|
| run5 | binutils | 479 | 3457 (was 3046) | 92 (was 468) | 2 (was 37) | 3 | 1236 |
| run5 | llvm | 1240 | 10234 (was 8454) | 234 (was 1859) | 12 (was 167) | 8 | 1912 |
| run5 | elfutils | 301 | 2067 (was 1386) | 221 (was 812) | 62 (was 152) | 4 | 656 |

What remains, by cluster:

- elfutils: 56 of the 62 failures are the deferred B13 (`.debug` files and
  truncated cores whose segments lie outside the file); the differences are
  G11 (ELF32 symbol versions, 27), G8 (`NT_FILE`, 10), G14 (annobin symbol
  suffixes, 10), `.debug_types` (objdump prints type units for `info`; 8),
  G12 (header flags, 8), and C10 for files whose dynamic relocations are
  found only through `PT_DYNAMIC` (6, G9).
- LLVM: G12 (ARM and AMDGPU header flags, 27), `.debug_types` (10),
  templates whose DIE printing differs in a detail not yet triaged
  (`DW_TAG_template_type_param`, 16), units that readelf prints and linksem
  skips after a corrupt one (9), the AMDGPU msgpack note (6), MSP430 section
  types (6), and 7 B13-style truncated inputs.
- binutils: the GNU build attribute residue (C6/G14: the symbol suffixes
  in relocatable objects, and the stack-protector names fixed after run5
  in 2b4d436), `<no .debug_str section>` (fixed after run5 in fd541b5), and
  the level-0 DIEs of pr26548 (G15).

## F. The elfutils run (run4)

The elfutils corpus is `tests/testfile*.bz2` from the elfutils repository
(commit 2233a8e), the binaries as checked in: 301 files, of which 300 are
ELF.  Unlike the binutils and LLVM corpora these are mostly real compiler and
linker output, plus a number of deliberately odd files: core dumps (18),
`.debug` files from `objcopy --only-keep-debug`, prelinked objects, files
with no section headers, a 4 GiB `.dwp` and one with 66000 program headers.
Seventeen machines are represented, x86-64 (166) and i386 (51) dominating,
with PowerPC64, s390x, PowerPC, AArch64, ARM, IA-64, RISC-V, m68k, BPF,
Sparc, Alpha, CUDA and C-SKY behind.

Skips: 336 ELF32, 200 without `.debug_info`, 50 relocatable non-AArch64,
46 DWARF 5, 10 for the 4 GiB file, 4 compressed debug sections.

### Clusters explained by entries above

Most of the volume is the same handful of printers as before:

- C3 (`E` versus `X` segment flags): 278 comparisons (`-l`, `-a`).
- A4 (`.debug_abbrev`/`.debug_info` order): 105, i.e. nearly every DWARF
  comparison on a linked file.
- B4 (`@VERSION` on dynamic symbols in relocation dumps): about 120 across
  `-r`; the same suffix is also missing in the `-s` dump of `.dynsym`
  symbols in these files (about 45 comparisons, e.g.
  `__libc_start_main@GLIBC_2.2.5 (2)`), which B4 should mention: it is the
  `harness_string_of_elf64_syms_selected` path for files whose `.dynsym`
  is printed without a `.gnu.version` lookup succeeding.  To be checked
  against `testfile-gnu-property-note-aarch64`.
- B8 (histogram for an empty GNU hash table): 53.
- B1 (ELF32 relocations: `R_386_NONE`, and RELA sections not printed):
  about 60, including the prelink files whose `.rel.dyn` has type RELA and
  the `.gnu.conflict` RELA section (`testfile52-32.prelink.so`,
  `testfile53-32.prelink`), x32 (`testfile-x32`) and m68k.
- B7 (machine, OS/ABI and per-machine names): 45 (`IBM S/390`, `Intel
  IA-64`, `RISC-V`, `Linux BPF`, `MC68000`, `Sparc v9`/`v8+`/`Sparc`,
  `Alpha`, `C-SKY`, `ARM` versus `AArch`; `OS/ABI: <unknown: N>`; the ARM
  `EXIDX` segment type; `IA_64_UNWIND` section type; the ppc64 `abiv1`
  flags text; Alpha's `[STD GPLOAD]` `st_other`; relocation names for
  IA-64, RISC-V, s390, Alpha, Sparc and ARM printed as `Cannot deduce ABI`;
  and PowerPC64 `.gnu.attributes` (`Tag_GNU_Power_ABI_FP`), which readelf
  decodes and linksem's `-A` does not).
- C4 ("There are no symbols in this file."): 33, of which 16 are core
  files where readelf prints its no-section-headers message "Dynamic
  symbol information is not available for displaying symbols." exactly as
  C4 predicts.
- C2 (singular "There is 1 program header"): 9, and the same for "There is
  1 section header" / "Section Header:" (`testfile-phdrs.elf`).
- B5 (negative addends): 6.  C6 (GNU build attribute notes): 5.
- A5 (`.debug_loc` parsed eagerly): `testfile-lto-gcc10`,
  `testfile-ppc64-min-instr`.  A8 (`parse_die returned Nothing`):
  `testfile56`.  A7 (`file format [...]`): `testfiles390x`.
- B9 (bodies outside the file): the truncated kernel core `testfile62`
  (`takebytes`), and see B13 below for the `.debug` files.
