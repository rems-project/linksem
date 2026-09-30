<!-- Claude: written by Claude, 30 September 2026. -->
# notes009: DWARF 5 support, what was done

The DWARF 5 work planned in `notes008-2026-09-30-dwarf5-plan.md` (with the
user's PS answers there) is done, apart from the two items deferred in that
note.  Everything is committed on `reloc-new-ps`: ten `Claude:` commits in
linksem after 497f481 (68c273b, ff3b606, f95014e, e4d594e, ed39a4b, ec0cce7,
1ccb1b4, 355dc25, 2d7fc4b, and the notes commit; plus the user's notes008
edits committed unchanged as f9437af), one in read-dwarf (2c10460) and one in
read-dwarf-private3 (2b52406).

## What linksem now does (`src/dwarf.lem`; plan stages 1 and 2, and PS (f))

- DWARF 5 units: unit types and DWO ids, `implicit_const`, all the new forms,
  `.debug_str_offsets`, `.debug_addr`, `.debug_line_str`, `.debug_rnglists`,
  `.debug_loclists` (every `DW_LLE_*`/`DW_RLE_*` kind), type units with
  `DW_FORM_ref_sig8` resolved through them, and the version 5 line header.
  A `unit_context` replaces the bare `.debug_str` parameter everywhere;
  indexed strings and addresses are resolved lazily in the accessors from
  per-unit tables read once at parse time (on-demand reads were linear in the
  section's relocations and took minutes on kvm_nvhe.o).
- Expressions: `DW_OP_addrx`/`constx`, and a faithful typed stack for
  `const_type`, `regval_type`, `deref_type`, `convert` and `reinterpret`.
  This answers PS (e) in notes008; the choice and its rationale are written
  there.  `DW_OP_entry_value` stays unsupported.
- `.debug_aranges`, `.debug_names` and `.debug_macro` are parsed and checked
  against the DIE tree and line tables (`linksem readelf --debug-dump=check`);
  readelf-format dumps of those and of `.debug_addr`/`.debug_str_offsets` are
  compared in the corpus harness.
- read-dwarf follows (`Pp.ml`, `copySources.ml`); its rendering shows
  `DW_OP_addrx` resolved to an address.

## Checks made

- linksem's abbrev+info dump of the DWARF 5 kvm_nvhe.o (43 units, 899601
  lines) is byte-identical to readelf's, as is the DWARF 4 one.
- `validation/dwarf` now includes its 239 DWARF 5 files: 0 regressions and 44
  fixes against the DWARF 4 baseline; the new section dumps are mostly
  identical to readelf's, with the residue listed in
  `validation/dwarf/notes/notes003`.  One readelf 2.42 bug found: its macro
  dump resolves `DW_MACRO_*_strx` from the section start rather than the
  unit's base.
- `validation/dwarf-expr` gained DWARF 5 units and typed sets (`typed`,
  `random-typed-seed1`, both architectures).  linksem agrees with gdb on all
  1063 typed expressions except three gdb defects, reported with standalone
  examples in `upstream-discrepancy-reports/gdb-DWARF5-typed-operations.md`:
  narrowing conversions of large negative values lose the sign;
  `DW_OP_plus_uconst` on a typed operand gives a generic result against
  section 2.5.1.4 (linksem follows the text); `DW_OP_constx` is unimplemented.
  lldb implements only `DW_OP_convert` of these, wrongly (lldb report
  extended).
- read-dwarf test-pkvm on the DWARF 5 kvm_nvhe.o gives the same addresses,
  lines and columns as on the DWARF 4 one; test-smoke has `-gdwarf-5` variants
  (PS (11)).  The 34 files of the DWARF 4 pKVM output that differ from the
  September 28 snapshot are the evaluator fixes made earlier the same day, not
  this work.

## Not done

Skeleton and split units (deferred, as agreed); readelf-format dumps of
`.debug_rnglists`/`.debug_loclists` (parsed and interpreted, not dumped);
`DW_OP_entry_value`.

Two environment notes: ASLR could not be disabled in the session's sandbox,
so the expression harness's lldb result files for the frame sets differ from
the expected files in live stack addresses only; and the machine's memory
watchdog killed whole-corpus runs twice, so the final elfutils comparison was
run separately under an 8 GB per-process address-space cap.
