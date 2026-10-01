<!-- Claude: written by Claude, 1 October 2026. -->
# notes011: plan for encode functions and round-trip testing

Written after the specification cleanup of 1 October 2026 (option-typed
sections and parts of the `dwarf` record, `d_str` removed, record types for
the analysed location data, `od_regnames_riscv`; commits 82e3ff7, 6fde6a5,
9e799ec, f36dd5f, 2e7309b).  The plan is not executed here.

## Encode functions and round-trip testing

### 1 Shape

`src/dwarf_expr_encode.lem` already does this for expressions:
`encode_operation(s)` inverts `parse_operation(s)`, `operation_of_name`
builds records as the parser would, and `round_trip_ok` checks
parse∘encode.  The plan extends the same shape to every DWARF entity the
parsers produce, in a new `src/dwarf_encode.lem` (the parsers' inverses are
large enough to keep out of `dwarf.lem`, and nothing in `dwarf.lem` needs
them), with one `encode_X : ... -> error (list byte)` per `parse_X`, taking
the same contexts the parser takes (`p_context` for endianness, the unit
header for address size and offset size) and failing where a value does not
fit its form.  Byte lists, not `sym_byte_sequence`: encoding produces plain
bytes; a relocatable file's symbolic values are encoded as their offset
parts, which is what the object file's bytes hold before relocation.

### 2 Entities, in dependency order

1. Primitives (exist): fixed-width unsigned/signed, ULEB128/SLEB128,
   `unit_length` (DWARF 32/64), strings; add `encode_uint24`,
   `encode_uint_address_size`, `encode_uintDwarfN`.
2. Attribute values by form: `encode_attribute_value c cuh form av` inverting
   `parser_of_attribute_form_non_indirect` (and `DW_FORM_indirect` as the
   form code then the value); `implicit_const` encodes to nothing.  The
   `AV_block`/`AV_constantN` ambiguity (the parser gives `data1/2/4/8` as
   `AV_block` blocks and `AV_constantN` for others) is resolved by the form:
   the form decides the width, the value supplies the bytes.
3. Abbreviations: `encode_abbreviation_declaration`, `encode_abbreviations_table`
   (codes, tags, children flag, `(attribute, form[, implicit const])` pairs,
   the terminating zeros).
4. DIEs and units: `encode_die cuh abbrevs die` (ULEB code, then each
   attribute value by the abbreviation's form, then children and the null
   entry when `ad_has_children`), `encode_compilation_unit_header`,
   `encode_unit` (header, then the DIE tree; type units with signature and
   type offset), `encode_debug_info` for the unit list.  The DIE records
   carry their offsets (`die_offset`, `die_end`) and attribute positions,
   which the encoder ignores and the round trip recomputes.
5. Location and range lists, DWARF 4 (`encode_location_list`,
   `encode_range_list`) and 5 (`encode_loclist_entry`, `encode_rnglist_entry`,
   the table headers and offset arrays).
6. Frame information: `encode_call_frame_instruction(s)`, CIE and FDE records
   with their augmentation data and padding to the CIE's alignment, and the
   whole section.
7. Line number programs: the header (both versions, with the entry formats
   and the directory and file tables), the operations (standard, extended
   with their lengths, special), and the program's padding.
8. DWARF 5 tables: `.debug_str_offsets` and `.debug_addr` contributions from
   the per-unit tables, `.debug_aranges` sets (with the header padding to the
   tuple size), `.debug_names` indexes (the hash table recomputed from the
   names, or taken from the parsed one), `.debug_macro` units.
9. `encode_dwarf : dwarf -> error dwarf_sections` assembling every section
   (the `maybe`s now in the record make the absent ones direct).

### 3 Round-trip testing

Two checks, both as Lem functions so that they are part of the
specification and usable from the OCaml tool:

- **bytes → value → bytes**: for each section of a file, parse as today,
  encode, and compare with the section's bytes (offset parts for a
  relocatable file).  Identity is expected for the sections the compilers
  write canonically; the known legitimate differences are non-minimal
  LEB128 encodings (seen in hand-written test inputs), alignment padding
  (line programs, `.debug_aranges` headers, `.debug_frame` records,
  `.debug_str_offsets` between contributions), and the choice of
  `DW_FORM_indirect`.  The checker reports the first differing offset and
  classifies the difference (padding / non-canonical LEB / real).
- **value → bytes → value**: encode a parsed value and parse it back;
  compare structurally, ignoring the offset fields (`die_offset`, `die_end`,
  attribute positions, `op_offset`/`op_end`, `lnh_offset`, ...), or
  compare the pretty-printed forms as `round_trip_ok` does for expressions.
  This is the check that matters for values linksem has *constructed* (the
  expression harness's generated programs, and any future producer use),
  where there are no original bytes.

Tooling: a `linksem readelf --check-roundtrip` option (or a separate
`linksem roundtrip` command) printing one line per section (`identical`,
`differs at 0x... (padding)`, `differs at 0x...`, `not encodable: ...`), and
a fourth kind of validation under `validation/`, `validation/roundtrip/`,
driven over the three existing corpora (sharing `validation/dwarf`'s fetch,
build and classification; its own `compare.py` row and summary), with the
expected classification per file committed as its baseline the way
`validation/dwarf` does.  For the expression harness, `dwexpr_build` already
rejects expressions that do not round-trip; the new checker subsumes that.

### 4 Order and size

Steps 1-4 and the `.debug_info`/`.debug_abbrev` round trip first (they
exercise the forms, which is where encoder/parser disagreements would
matter), then 5-7 with their sections, then 8-9.  Each step: the encoder,
its round-trip check over the corpora, and a commit; the DWARF 5 kvm_nvhe.o
and the DWARF 4 one as the first targets.  Roughly: 2 days for 1-4 with the
tool and the harness skeleton, a day each for 5, 6, 7, a day for 8-9.
