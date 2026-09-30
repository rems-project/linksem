# Claude: DWARF 5 support in linksem: an outline plan, and what kvm_nvhe.o needs

Claude: this note is written by Claude (30 September 2026).  It is a plan, not
a record of work done; nothing in `src/` was changed for it.  The instruction
it answers, verbatim:

> Now we're going to consider DWARF5 support, initially for the fragment used
> by the kvm_nvhe.o.  First read the DWARF5 specification pdf and errata html
> (in linksem/doc) and write an outline plan for how to adapt linksem/src/dwarf
> to it. (Don't execute that plan).  Then, rebuild in re-linux with a
> configuration like except with CONFIG_DEBUG_INFO_DWARF5=y instead of
> CONFIG_DEBUG_INFO_DWARF4=y.  Then use readelf to look at the DIE tree and
> identify anything used there which is specific to DWARF5.  Add an appendix to
> the plan informed by that.  Notes about this should go in linksem/notes.

Sources: `doc/DWARF5.pdf` (the 13 February 2017 standard) and
`doc/DWARF 5 Errata and Clarifications.html` (dwarfstd.org, issues up to
250311.1).  Section numbers below are the standard's.

## 1. What changes between DWARF 4 and DWARF 5 that touches linksem

From section 1.4 and chapter 7, the incompatible changes a consumer of
`.debug_info` and friends must handle:

- **Unit headers** (7.5.1): after the version comes a `unit_type` byte
  (`DW_UT_compile`, `type`, `partial`, `skeleton`, `split_compile`,
  `split_type`), and `address_size` and `debug_abbrev_offset` are reordered.
  Type units live in `.debug_info` (with `type_signature` and `type_offset`
  after the abbrev offset); skeleton and split units add a `dwo_id`.
  `.debug_types` is gone.
- **Abbreviations** (7.5.3, clarified by errata 221114.1): an attribute
  specification with form `DW_FORM_implicit_const` has a third part, a SLEB128
  value, and the attribute occupies no bytes in the DIE.  `DW_FORM_indirect`
  may chain, and an indirect `implicit_const` is followed by its SLEB128 in
  the DIE.
- **Forms** (7.5.5, table 7.6): `DW_FORM_strx`/`strx1..4` (index into the
  string offsets table), `addrx`/`addrx1..4` (index into the address table),
  `line_strp` (offset into `.debug_line_str`), `data16`, `implicit_const`,
  `loclistx`, `rnglistx`, `ref_sup4`/`ref_sup8`, `strp_sup`.  Four new
  classes: `addrptr`, `loclist`, `rnglist`, `stroffsetsptr`; `sec_offset`
  gains `loclistsptr`/`rnglistsptr`/`stroffsetsptr`/`addrptr`.
- **New sections and their per-unit bases**: `.debug_str_offsets` (7.26,
  header + array of `strp`-like offsets; `DW_AT_str_offsets_base` points at
  the array), `.debug_addr` (7.27; `DW_AT_addr_base`), `.debug_rnglists`
  (7.28, replacing `.debug_ranges`; `DW_AT_rnglists_base`), `.debug_loclists`
  (7.29, replacing `.debug_loc`; `DW_AT_loclists_base`), `.debug_line_str`,
  `.debug_names` (replacing pubnames/pubtypes), `.debug_macro`.  Each of the
  first four is a sequence of contributions with a `unit_length`/`version`
  header (address size and an `offset_entry_count` array for the two list
  sections); errata 180326.1 notes that an entry array's element size follows
  the referencing unit's 32/64-bit format, and 230329.1 that tables are
  contiguous.
- **Range and location lists** (2.17.3, 2.6.2): entries are kind-tagged
  (`DW_RLE_*`, `DW_LLE_*`): `end_of_list`, `base_addressx`, `startx_endx`,
  `startx_length`, `offset_pair`, `default_location` (locations only),
  `base_address`, `start_end`, `start_length`; the `x` forms are indices into
  `.debug_addr`; `offset_pair` is relative to the current base, which defaults
  to the unit's base address.  A location list entry carries a counted
  location description.  Errata 211022.1: an entry with equal begin and end
  is empty and may be ignored; 181205.1: a piece after an empty location is
  undefined.
- **Line number program header** (6.2.4): `address_size` and
  `segment_selector_size` after the version; the directory and file tables
  are self-describing (`directory_entry_format_count`, format pairs of
  `DW_LNCT_*` content type and form, then a ULEB128 count and the entries),
  with `DW_LNCT_path` typically `DW_FORM_line_strp`, `DW_LNCT_directory_index`
  `udata`, and `DW_LNCT_MD5` `data16`.  Directory 0 is the compilation
  directory and file 0 the primary source file, so file indices are 0-based
  where DWARF 4's were 1-based (errata 180914.1, 210628.1 clarify).
- **Expressions** (2.5.1.7, table 7.9): `DW_OP_addrx`, `constx` (indices
  into `.debug_addr`), `entry_value`, `implicit_pointer`, and the typed
  operations `const_type`, `regval_type`, `deref_type`, `xderef_type`,
  `convert`, `reinterpret`, whose operands reference base type DIEs by
  unit-relative offset (0 meaning the generic type).  Errata 230120.1
  restricts `call_ref`/`implicit_pointer` to the current file; 230808.1
  clarifies `entry_value`.
- **Attributes and tags**: `DW_TAG_call_site`/`call_site_parameter` and the
  `DW_AT_call_*` family, `DW_AT_alignment`, `noreturn`, `deleted`,
  `defaulted`, `export_symbols`, `rank`, `dwo_name`, `macros`, the four
  `*_base` attributes, the string-length size attributes; new language codes.
  The DWARF 4 meaning of `DW_AT_byte_size` on string types changes (1.4).
- **Frames** (6.4): the CIE format is unchanged (version 4 already carried
  `address_size` and `segment_selector_size`).  Errata 230103.1 clarifies
  that `DW_CFA_remember_state` saves the CFA rule too; linksem's
  `cs_row_stack` should be checked against that.
- **Relocations in relocatable objects** (7.3.1): the new relocated fields
  are the `.debug_str_offsets` entries (offsets into `.debug_str`), the
  `.debug_addr` entries (addresses), `DW_FORM_line_strp` values in
  `.debug_line`, and `.debug_rnglists`/`.debug_loclists` entries only when a
  non-`x` address kind is used.  Everything the new forms replace
  (`DW_FORM_addr`, `strp`, the `.debug_loc`/`.debug_ranges` addresses) no
  longer carries relocations in `.debug_info`.

Unaffected or out of scope for now: `.debug_frame`, `.debug_aranges`
(version 2), split DWARF (`.dwo`, `.dwp`, `DW_UT_skeleton`/`split_*`),
`.debug_names`, `.debug_macro`, supplementary object files
(`ref_sup`/`strp_sup`), and DWARF 64 beyond what the existing `dwarf_format`
plumbing already gives.

## 2. Where linksem stands

`src/dwarf.lem` (7600 lines) parses `.debug_info`, `.debug_abbrev`,
`.debug_str`, `.debug_loc`, `.debug_ranges`, `.debug_frame` and `.debug_line`
(`extract_dwarf`, using the symbolic byte sequences of `dwarf_byte_sequence.lem`
so that relocated fields of a relocatable object stay symbolic), builds the
`dwarf` record (`d_compilation_units`, `d_type_units`, `d_loc`, `d_ranges`,
`d_frame_info`, `d_line_info`, `d_str`), and on it does the analyses read-dwarf
uses (location interpretation and evaluation, frame unwinding, line tables,
C type reconstruction in `dwarf_ctypes.lem`) and the readelf/objdump-format
dumps validated by `validation/dwarf`.

Version dependence is thin and explicit: `cuh_version` is parsed but only
consulted in the objdump dump (`version < 4` for `data4`/`data8` as section
offsets); `parse_compilation_unit_header` reads the DWARF 2 to 4 field order;
`parse_line_number_header` branches on the line version for
`maximum_operations_per_instruction`; the form parser
(`parser_of_attribute_form_non_indirect`) knows the 21 DWARF 4 forms;
`ad_attribute_specifications` is `list (sym_natural * sym_natural)`.  The
name tables already contain most DWARF 5 attributes and tags (the `DW_AT_call_*`
family, `alignment`, `noreturn`, the four `*_base` attributes,
`DW_TAG_call_site`) and the DWARF 5 operators as `OpSem_not_supported`; the
objdump-format dump already special-cases the `*_base` attributes.  Nothing
knows `DW_UT_*`, the new forms, `DW_LNCT_*`, `DW_RLE_*`/`DW_LLE_*`,
`.debug_str_offsets`, `.debug_addr`, `.debug_line_str`, `.debug_rnglists` or
`.debug_loclists`.

On a DWARF 5 object today `linksem readelf --debug-dump=info` fails at once
with `Failure("Read char: is symbolic (width: 4) 0")`: the header parser reads
the DWARF 4 field order, so it takes the `unit_type` and `address_size` bytes
as the start of `debug_abbrev_offset` and then meets the relocated offset
word half-way, which the symbolic byte sequence refuses to split.

Test material already to hand: `validation/dwarf`'s corpora hold 239 DWARF 5
files that `scripts/compare.py` currently skips with reason `dwarf5` (llvm
189, elfutils 32, binutils 18, both relocatable and linked), each with a
`readelf`/`objdump` oracle; and the object of the appendix.

## 3. Outline plan

The order is chosen so that each step leaves the reader parsing more of a
DWARF 5 object end to end, checkable against readelf on the appendix's object
and the corpora.

1. **Unit headers.**  Parse by version: for version 5 read `unit_type`,
   `address_size`, `debug_abbrev_offset`, then the type-unit or skeleton
   fields as the unit type says.  Add `cuh_unit_type : maybe unit_type` (a
   `DW_UT_*` table in the existing style) to `compilation_unit_header`; type
   units found in `.debug_info` go into `d_type_units` as the `.debug_types`
   ones do now; skeleton and split units are parsed but not followed.  Make
   `parse_dwarf` stop cleanly on an unknown version.  (`.debug_types` support
   stays as is.)
2. **Abbreviations with `implicit_const`.**  Change
   `ad_attribute_specifications` to a list of a small record (name, form,
   `maybe sym_integer` implicit value), or a triple; parse the SLEB128 third
   part; make `parse_die` produce `AV_implicit_const i` without consuming
   bytes; keep `DW_FORM_indirect` chains working per errata 221114.1.
   Consumers of the pair type: the abbreviation printers and
   `parse_die`.
3. **Forms.**  Extend `attribute_form_encodings` with the fifteen new forms
   and their classes, and `attribute_value` with constructors that record
   what was read without resolving it: `AV_strx of sym_natural` (index),
   `AV_addrx of sym_natural`, `AV_line_strp of sym_natural`, `AV_data16 of
   sym_byte_sequence`, `AV_implicit_const of sym_integer`, `AV_loclistx`,
   `AV_rnglistx`, `AV_ref_sup4/8`, `AV_strp_sup`.  Parsing a DIE must not
   need the unit's bases (they are attributes of the same DIE), so
   resolution is a separate step.
4. **The new sections.**  Read `.debug_str_offsets`, `.debug_addr`,
   `.debug_line_str`, `.debug_rnglists`, `.debug_loclists` in
   `extract_dwarf` (all optional), through the relocation interpreter like
   the existing ones, since in a relocatable object `.debug_str_offsets`
   holds relocated `.debug_str` offsets and `.debug_addr` relocated addresses
   (which should stay `sym_natural`, as `DW_FORM_addr` values do now).  Give
   each a type: a list of contributions (header record plus the entries, or
   for the list sections the offset array and the raw list bytes), and
   lookups by section offset.  Add them to `dwarf` (`d_str_offsets`,
   `d_addr`, `d_line_str`, `d_rnglists`, `d_loclists`).
5. **Per-unit bases and resolution.**  After a unit's DIE tree is parsed,
   compute `cu_bases` (`str_offsets_base`, `addr_base`, `rnglists_base`,
   `loclists_base`, each `maybe sym_natural`, from the unit DIE) and store
   it in `compilation_unit`.  Provide `resolve_strx cu d i : string`,
   `resolve_addrx cu d i : sym_natural`, and make the existing accessors
   (`find_string_attribute_value_of_die`, `find_natural_attribute_value_of_die`,
   the name/low_pc/high_pc helpers) accept `AV_strx`/`AV_addrx`/`AV_line_strp`/
   `AV_implicit_const` beside `AV_strp`/`AV_addr`/`AV_constantN`.  This is
   the step after which names and addresses of a DWARF 5 tree are usable.
   Choice point: resolve eagerly into the DIE tree (a second pass rewriting
   `AV_strx` to `AV_string`, simplest for every consumer) or lazily in the
   accessors (keeps the tree faithful for the dumps, which must print the
   index and the string).  Recommendation: lazily, with the accessors as the
   single place; the dumps need the raw form anyway.

PS: yes, lazily in the accessors

6. **Range lists.**  A `DW_RLE_*` parser and an interpreter to the same
   `(lo, hi)` list `interpret_range_list` produces from `.debug_ranges`,
   resolving `x` kinds through `.debug_addr`; `DW_AT_ranges` as
   `AV_rnglistx` (index through the unit's `rnglists_base` and the offset
   array) or `AV_sec_offset` (direct, in a version 5 unit meaning
   `.debug_rnglists`).  `cu_base_address`, `interpreted_location` and the
   C-type analyses then work unchanged on the interpreted form.
7. **Location lists.**  Likewise `DW_LLE_*`, with the counted location
   description and `default_location`, into the `(lo, hi, description)` form
   that `interpret_location_list` and `evaluate_location_description` already
   consume (the latter gained its base-address parameter today).  Dispatch on
   the unit version for `AV_sec_offset` (`.debug_loc` for 4, `.debug_loclists`
   for 5) and add `AV_loclistx`.  The DWARF 4 types and parsers stay.
8. **Line number program header.**  Version-5 header fields; a
   `DW_LNCT_*` table; entry formats parsed as (content type, form) pairs and
   applied with the ordinary form parser (with `line_strp` resolved through
   `.debug_line_str` and `data16` kept as bytes); `lnh_include_directories`
   and `lnh_file_entries` become lists of records with resolved path, directory
   index, and optional timestamp/size/MD5.  The file-index base changes
   (0-based in version 5): make `lnh_file_index_base` explicit and use it in
   the state machine's `file` register interpretation and in
   `DW_AT_decl_file`/`DW_AT_call_file` lookups, so DWARF 4 output is
   unchanged.  read-dwarf's `DwarfLineInfo.ml` and `copySources.ml` read
   these fields and will need the record form.
9. **Expressions.**  `DW_OP_addrx`/`constx` need `.debug_addr` and the
   unit's `addr_base`: give the evaluation context (or the `p_context`) an
   `addr_lookup : sym_natural -> maybe sym_natural`, and let the parser record
   the index.  `DW_OP_entry_value` stays unsupported (it needs a caller's
   register state) but must parse (it does).  The typed operations need a
   typed stack: extend the stack elements to `(value, maybe type)` where a
   type is the referenced base type's (size, encoding), with `convert`
   truncating or extending per the target type and `const_type`/`regval_type`/
   `deref_type` producing typed values; the untyped operations keep their
   DWARF 4 meaning on the generic type.  This is the part the
   `validation/dwarf-expr` harness can check against gdb and lldb once its
   generator can emit DWARF 5 units (see its coverage note).
10. **Printers.**  The readelf/objdump-format dumps for version 5 units
    (`Unit Type:` line; `(indexed string: 0x..): text`, `(indirect line
    string, offset: 0x..)`, `(implicit_const)`, `DW_OP_addrx <i>`,
    `DW_OP_convert <0x..>`), and dumps of the new sections in readelf's
    format (`--debug-dump=loc` shows `.debug_loclists` tables, `=Ranges`
    the range lists, `=str-offsets`, `=addr`, `=rawline` with the entry
    formats).  Then let `validation/dwarf` compare DWARF 5 files: remove the
    `dwarf5` skip per comparison as each dump becomes correct, and use the
    239 files as the regression set.
11. **Consumers.**  read-dwarf builds on `dwarf_static`; after steps 5 to 8
    it should work on the appendix's object without changes other than the
    line-table records.  Check `test-pkvm` and `test-smoke` (which compiles
    with `-gdwarf-4` today and could gain a `-gdwarf-5` variant).

PS: yes, it should

Choice points to settle before starting: (a) lazy versus eager resolution of
`strx`/`addrx` (above);

PS: lazy, to keep the dumps faithful to the raw data

(b) whether the version-4 and version-5 list
representations are unified at the parsed level or only at the interpreted
level (recommended: interpreted only, keeping the dumps faithful);

PS: yes

(c) whether
`.debug_addr` entries in a relocatable object are kept symbolic (recommended:
yes, they are what `DW_FORM_addr` values were); 

PS: yes

(d) how far to take type units
and skeleton units (parse headers, do not follow `.dwo`);

PS: deal properly with type units; defer skeleton units

(e) the typed-stack
representation for expressions; 

PS: what's the choice for that? 

(Claude, 30 September 2026, in answer:) the choice made, and implemented, is a
faithful typed stack rather than the two cheaper alternatives (ignoring the
types and treating the typed operations as no-ops or as conversions of the
generic value, or refusing them).  Each stack entry is a pair of a value (a bit
pattern, a natural below 2^(8*size)) and a type: the generic type, or a base
type identified by the unit-relative offset of its `DW_TAG_base_type` DIE with
that DIE's byte size and `DW_ATE` encoding, read through the unit context's DIE
index.  `DW_OP_const_type`, `DW_OP_regval_type` and `DW_OP_deref_type` push
typed values; `DW_OP_convert` re-represents the integer value in the target
type (signed base types by two's complement, the generic type unsigned);
`DW_OP_reinterpret` keeps the bits and requires equal sizes; the binary
operations require operands of one type and compute in that type's arithmetic
(width, and signedness for `div`, `abs`, the comparisons and `mod`), with the
comparisons pushing a generic 0 or 1; `DW_OP_stack_value` yields the value's
bytes at the type's size; floating-point base types are refused.  Where DWARF 5
is silent (a typed value taken as an address, the signedness of `DW_OP_mod` on
a signed type) gdb's behaviour is followed; where it speaks and gdb does not
follow it (`DW_OP_plus_uconst` keeps the operand's type) the text is followed
and gdb's deviation reported.  The cost was moderate: about 250 lines of Lem,
and the untyped operations' code is unchanged apart from carrying the type.
This was cross-checked against gdb and lldb with the `validation/dwarf-expr`
harness, extended to DWARF 5 units and typed operations (sets `typed` and
`random-typed-seed1`); see Appendix B.

(f) whether `.debug_names`, `.debug_macro` and
`.debug_aranges` version 5 changes are in scope (no).

PS: handle all of those. For the first two, which you elsewhere say are accelerator tables, include in dwarf.lem functionality to check their contents if they are present

## Appendix A. What the kvm_nvhe.o DWARF 5 fragment uses

### A.1 The build

`re-linux` (Linux 6.18.32, commit `af7273337830`, branch
`ps-claude/android17-6.18`) is configured with clang 18.1.3 and lld
(`CONFIG_CC_IS_CLANG`, `CONFIG_LD_IS_LLD`) and `CONFIG_DEBUG_INFO_DWARF4=y`.
So as not to disturb that tree (the `objcheck` and read-dwarf tests read its
`kvm_nvhe.o`), a detached worktree of the same commit was made at
`/home/pes20/re-linux-dwarf5`, its `.config` copied with
`CONFIG_DEBUG_INFO_DWARF5=y` in place of `DWARF4`, and only the object built:

    git -C ~/re-linux worktree add --detach ~/re-linux-dwarf5 HEAD
    cp ~/re-linux/.config ~/re-linux-dwarf5/   # then DWARF4 -> DWARF5
    cd ~/re-linux-dwarf5 && make ARCH=arm64 LLVM=1 -j20 olddefconfig arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o

That takes 12 seconds (only the 28 nvhe objects and their link are needed)
and gives `~/re-linux-dwarf5/arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o` (5.6 MB,
against 6.7 MB for DWARF 4).  The worktree can be removed with `git -C
~/re-linux worktree remove ~/re-linux-dwarf5` when no longer wanted.

### A.2 Sections

| section              | DWARF 5  | DWARF 4  | relocations in DWARF 5 (DWARF 4)                          |
|----------------------|----------|----------|-----------------------------------------------------------|
| `.debug_info`        | 0x17bf50 | 0x1c6ed4 | 210 ABS32 + 81 ABS64 (120441 ABS32 + 8144 ABS64 + 45 NONE)|
| `.debug_abbrev`      | 0x00bd7d | 0x009cbc | none                                                      |
| `.debug_str`         | 0x016ba3 | 0x016af8 | none                                                      |
| `.debug_str_offsets` | 0x051d58 | -        | 83734 ABS32                                               |
| `.debug_addr`        | 0x00ba50 | -        | 5885 ABS64 + 45 NONE                                      |
| `.debug_loclists`    | 0x03b20e | -        | none                                                      |
| `.debug_loc`         | -        | 0x094706 | (250 ABS64 + 34 NONE)                                     |
| `.debug_rnglists`    | 0x009323 | -        | none                                                      |
| `.debug_ranges`      | -        | 0x01bc20 | (102 ABS64 + 90 NONE)                                     |
| `.debug_line`        | 0x0321bb | 0x02d6f6 | 4749 ABS32 + 43 ABS64 + 1 NONE (43 ABS64 + 1 NONE)        |
| `.debug_line_str`    | 0x0012a0 | -        | none                                                      |
| `.debug_frame`       | 0x005a80 | 0x005a80 | 634 ABS32 + 633 ABS64 + 1 NONE (same)                     |
| `.debug_aranges`     | 0x000210 | 0x000210 | 11 ABS32 + 11 ABS64 (same)                                |

So the relocations have moved out of `.debug_info` into `.debug_str_offsets`
(the string offsets) and `.debug_addr` (the addresses), plus 4749 new ABS32
in `.debug_line` for the `line_strp` path strings; the list sections carry
none.  There is no `.debug_names`, `.debug_macro`, `.debug_types` or `.dwo`.

### A.3 Units

43 compilation units, all `Version: 5`, `Unit Type: DW_UT_compile (1)`,
`Pointer Size: 8`, 32-bit DWARF format, all with producer "Ubuntu clang
version 18.1.3 (1ubuntu1)".  32 are C units (`DW_AT_language` 29, C11) and
use the indexed forms with `DW_AT_str_offsets_base`, `DW_AT_addr_base` and
`DW_AT_loclists_base` (28 of them also `DW_AT_rnglists_base`); 11 are assembler
units (`DW_AT_language` 0x8001, "MIPS assembler" in readelf's naming), which
use `DW_FORM_string`, `DW_FORM_addr` and `DW_FORM_data4` for `high_pc` and
have no bases, so within a version 5 header they are DWARF 4-style.  No type,
skeleton or split units.

### A.4 Forms, attributes and tags

Forms in the abbreviation tables, with counts of attribute specifications:
`data1` 5311, `ref4` 2248, `data2` 1760, `strx2` 1424, `flag_present` 875,
`strx1` 810, `udata` 527, `addrx` 394, `exprloc` 364, `data4` 315,
`loclistx` 189, `sec_offset` 167, `implicit_const` 158, `rnglistx` 95,
`string` 44, `sdata` 36, `addr` 34.  New in DWARF 5 and present: `strx1`,
`strx2`, `addrx`, `implicit_const`, `loclistx`, `rnglistx`.  New and absent:
`strx3`/`strx4`, `addrx1..4`, `line_strp` (used only in `.debug_line`),
`data16` (only as the MD5 in `.debug_line`), `ref_sup*`, `strp_sup`; also
absent are `strp`, `ref_addr`, `ref_sig8`, `indirect`, the block forms.

Attribute to form pairs that matter for the plan:

| attribute                | forms                                    |
|--------------------------|------------------------------------------|
| `DW_AT_name`             | `strx2` 1424, `strx1` 746, `string` 22   |
| `DW_AT_producer`, `comp_dir` | `strx1` 32, `string` 11              |
| `DW_AT_low_pc`           | `addrx` 326, `addr` 23                   |
| `DW_AT_high_pc`          | `data4` 293 (offset), `addr` 11 (asm)    |
| `DW_AT_call_return_pc`   | `addrx` 68                               |
| `DW_AT_location`         | `loclistx` 189, `exprloc` 184            |
| `DW_AT_ranges`           | `rnglistx` 95                            |
| `DW_AT_frame_base`       | `exprloc` 133                            |
| `DW_AT_inline`           | `implicit_const` 158 (the only use)      |
| `DW_AT_stmt_list`, `*_base` | `sec_offset`                          |
| `DW_AT_decl_file`        | `data1` 2380, `data4` 11                 |
| `DW_AT_alignment`        | `udata` 407                              |
| `DW_AT_const_value`      | `udata` 120, `sdata` 36                  |

Attributes new in DWARF 5 that occur: `DW_AT_call_all_calls` 133,
`call_return_pc` 68, `call_origin` 43, `call_target` 25, `call_value` 22,
`alignment` 407, `noreturn` 6, `str_offsets_base` 32, `addr_base` 32,
`loclists_base` 32, `rnglists_base` 28.  Tags new in DWARF 5 that occur:
`DW_TAG_call_site` 68, `DW_TAG_call_site_parameter` 22.  The rest of the tag
and attribute set is the DWARF 4 object's (the `call_*` attributes and tags
replace `DW_AT_GNU_call_site_*`/`DW_TAG_GNU_call_site`, which the DWARF 4
object does not use either: clang 18 emitted none at `-gdwarf-4`).  All of
these names are already in linksem's tables.

### A.5 Expressions

In `.debug_info` exprlocs: the DWARF 4 set (`reg`/`breg`/`lit`, `fbreg`,
`stack_value`, `plus`, `minus`, `and`, `shl`, `shr`, `deref_size`, `piece`,
`constu`/`consts`, `plus_uconst`, `mul`, `div`, `not`, `or`, `xor`) plus
`DW_OP_addrx` 296 (every global's location is `DW_OP_addrx <i>`, where the
DWARF 4 object had `DW_OP_addr` with a relocation), `DW_OP_convert` 114 and
`DW_OP_entry_value` 71.  In `.debug_loclists`: `DW_OP_convert` 1060,
`DW_OP_entry_value` 1043 (always `DW_OP_entry_value: (DW_OP_regN);
DW_OP_stack_value`), `eq` 24, `ne` 17, `shra` 2, and no `DW_OP_addr`.  The
DWARF 4 object has `DW_OP_GNU_entry_value` and `DW_OP_addr` instead, and
`DW_OP_dup`, which the DWARF 5 one lacks.  `DW_OP_convert` operands are
unit-relative offsets of `DW_TAG_base_type` DIEs that clang emits for the
purpose, named `DW_ATE_unsigned_64`, `DW_ATE_unsigned_8` and so on (for
example `DW_OP_breg2 0; DW_OP_convert <0x371b9>; DW_OP_convert <0x371be>;
DW_OP_stack_value`, a truncation to 8 bits and back).  So for the appendix's
object the typed operations reduce to conversions between unsigned integer
widths, and `entry_value` wraps a single register.

### A.6 Location, range, string offset and address tables

`.debug_loclists`: 32 tables (one per C unit), each `DWARF version 5`,
`Address size 8`, `Segment size 0`, with an offset-entry array (for example 24
entries); 22381 `DW_LLE_offset_pair` entries and 284 `DW_LLE_base_addressx`,
no other kinds (no `default_location`, no non-`x` address kinds).
`.debug_rnglists`: 28 tables, likewise with offset arrays; 4992
`DW_RLE_offset_pair`, 2112 `DW_RLE_end_of_list`, 45 `DW_RLE_base_addressx`,
2 `DW_RLE_startx_length`.  `.debug_str_offsets`: 32 contributions
(`Contribution size = N, Format = DWARF32, Version = 5`), every entry
relocated against `.debug_str`.  `.debug_addr`: 32 tables (`version 5,
addr_size 8, seg_size 0`), every entry an ABS64 relocation, so in the object
the addresses are symbolic (section plus offset), exactly as `DW_FORM_addr`
values are today.

### A.7 Line tables and the rest

`.debug_line`: 44 line tables, `version 5`, `address_size 8`,
`seg_select_size 0`, `opcode_base 13`, the standard opcode lengths of DWARF
3/4; the directory table has one column (`DW_LNCT_path` as `line_strp`,
directory 0 being the compilation directory `/home/pes20/re-linux-dwarf5`)
and the file table three (`DW_LNCT_path` `line_strp`,
`DW_LNCT_directory_index` `udata`, `DW_LNCT_MD5` `data16`), file 0 being the
primary source.  The 4749 ABS32 relocations in `.debug_line` are those
`line_strp` values.  `.debug_line_str` holds the paths.  `.debug_frame` is
unchanged (CIE version 4, augmentation ""), as is `.debug_aranges`
(version 2).

### A.8 The minimal subset for this object

To parse and analyse this object as linksem does the DWARF 4 one, steps 1 to
8 of the plan are needed, restricted to: `DW_UT_compile`; `implicit_const`;
the forms `strx1`, `strx2`, `addrx`, `loclistx`, `rnglistx` (and `line_strp`,
`data16`, `udata` in the line header); `.debug_str_offsets`, `.debug_addr`,
`.debug_line_str`, `.debug_rnglists` and `.debug_loclists` with only the
`offset_pair`, `base_addressx`, `startx_length` and `end_of_list` kinds; the
version 5 line header with the three content types above; and, in
expressions, `DW_OP_addrx` (with `.debug_addr`), `DW_OP_convert` between
unsigned base types, and parsing (not evaluating) `DW_OP_entry_value`.
Everything else in section 1 can follow, checked against the corpora.

## Appendix B. Status, 30 September 2026 (Claude)

Done, in commits 68c273b, ff3b606, f95014e and the following ones on
reloc-new-ps (all `Claude:`):

- Stage 1 (kvm_nvhe.o's subset and more): unit headers with unit types and
  DWO ids, `implicit_const`, all the new forms, `.debug_str_offsets`,
  `.debug_addr`, `.debug_line_str`, `.debug_rnglists`, `.debug_loclists`
  (all `DW_LLE_*`/`DW_RLE_*` kinds), type units (parsed, printed, and
  `DW_FORM_ref_sig8` resolved through them), the version 5 line header
  (entry formats, `line_strp`/`strp`/`strx` paths, MD5s, 0-based tables via
  `lnh_directory`/`lnh_file`).  A `unit_context` replaces the `.debug_str`
  parameter throughout; indexed strings and addresses are resolved lazily in
  the accessors from per-unit tables read once at parse time.
- Stage 2 (expressions): `DW_OP_addrx`/`constx`, and the typed stack above.
  `DW_OP_entry_value` and `DW_OP_implicit_pointer` remain unsupported
  (parsed, `OpSem_not_supported`).
- Printers: the readelf-format dumps handle version 5 units (Unit Type, DWO
  ID, Signature/Type Offset lines; readelf's texts for indexed strings,
  `DW_OP_addrx` blocks, out-of-range indices).
- read-dwarf follows (`Pp.ml`, `copySources.ml`); test-pkvm on the DWARF 5
  kvm_nvhe.o gives the same addresses, lines and columns as on the DWARF 4
  one, and all variable locations evaluate except `DW_OP_entry_value`.

Checked: linksem's `--debug-dump=abbrev,info` of both kvm_nvhe.o builds is
byte-identical to readelf's; `validation/dwarf` now includes its 239 DWARF 5
files (0 regressions against the DWARF 4 baseline; the remaining DWARF 5
differences are readelf's printing of level-0 null entries and of
`DW_AT_discr_list`, its empty value for an `implicit_const` DIE with no data
(`implicit-const-test2`), and a supplementary-file case, none of them DWARF 5
parsing); `validation/dwarf-expr`'s DWARF 4 results are unchanged and its new
typed sets agree with gdb except for gdb's own defects (see its
`upstream-discrepancy-reports/gdb-DWARF5-typed-operations.md`).

Not yet done: skeleton and split units (deferred, as agreed);
`.debug_names`, `.debug_macro` and `.debug_aranges` parsing and content
checks (PS (f)); readelf-format dumps of the new sections (`--debug-dump=addr`,
`str-offsets`, `rnglists`, `loclists`); `DW_OP_entry_value`.
