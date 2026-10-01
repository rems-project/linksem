# Claude: general instructions the linksem work since September 2026 was done under

Claude: this note records, in anonymised form, the standing instructions the
project owner gave during the work on linksem from 18 September to 1 October
2026 (the `linksem readelf` tool, the validation harnesses, the symbolic
resolution and pKVM modules, DWARF 5, and the specification cleanup), so that
another agent instance working on this code can follow the same rules.  The
prompts themselves are in `notes012-2026-10-01-instructions-given.md`; the
rules for the validation harnesses in particular are also in
`../validation/dwarf/notes/notes002-2026-09-30-general-instructions.md` and
`../validation/dwarf-expr/notes/notes039-2026-09-30-general-instructions.md`.

## How work is organised

- Plan first.  For anything beyond a small fix, write a plan into a note
  (and for a speculative change, do the experiment in scratch space first,
  outside the checked-out repositories), with the difficulties and choice
  points made explicit.  The owner reads it and answers the choice points as
  `PS:` comments in the note; the implementation then follows those answers.
  Do not execute a plan you were asked only to write.
- Notes go in the repository's `notes/` directory as
  `notesNNN-YYYY-MM-DD-topic.md`.  Committed notes are not edited afterwards
  (a later preference applies to new work only); if an old note must change,
  the change is a correction, not a reformatting.
- Markdown tables in notes are padded with spaces so that the columns align
  in the source, not only when rendered.
- Every directory created gets a README saying what it is, how to build and
  run it, and where its outputs go.  Generated files go under an `output/`
  (or `build/`) directory, not beside the sources.
- Work step by step: for a sequence of related changes, each step is built,
  the dependent code (read-dwarf) updated, and lightly tested before the next;
  heavy regression testing comes at the end.

## Commits and authorship

- Every commit message written by the agent starts with `Claude: `.  Comments
  inserted into source files are prefixed `Claude: ` (`(* Claude: ... *)` in
  Lem and OCaml, `# Claude:` in Makefiles and scripts).  A README or note
  largely written by the agent opens with a remark saying so.
- The owner's own edits (for instance PS answers in a note) are committed
  unchanged and without the prefix, with the message saying they are his.
- A batch of fixes lands as one commit per fix, each sanity-checked before
  committing, so that a later regression can be traced to its commit; a
  summary commit or note may describe the whole series.
- Do not commit a repository's large or regenerable outputs (the pKVM
  memory dumps of a run, for instance); this is a judgement about those
  files, not a rule against binaries in general.

## The owner's text

- Do not rewrite prose the owner wrote (READMEs, comments, notes, open
  questions, commented-out Makefile targets) unless asked for that file to be
  rewritten.  Correct a fact in place minimally; add what is missing as new
  paragraphs or sections marked as the agent's.

## linksem's code

- Changes to the Lem sources are conservative and in clean functional
  specification style: small total functions, records with meaningful field
  names (prefixed as the surrounding code prefixes them), option types for
  what may be absent, no mirroring of the C tools' control structure.
  Pretty-printers and all deep traversals of the ELF/DWARF data belong in
  the Lem sources; the OCaml command-line tool in `src_ocaml/` stays a thin
  front end over them.
- Where linksem reproduces the output of GPL-licensed tools (binutils'
  readelf and objdump, elfutils) only the message texts and name tables may
  be taken from their source; nothing else may be copied or closely
  transliterated.  Reading their source to understand behaviour is fine.  A
  very good reason to take more needs the owner's explicit agreement first.
- Where a specification leaves a case open, check the specification text
  first; if it really is unspecified, follow the reference implementation
  (gdb for DWARF expressions) and record in the code that a choice was made.
  Where the specification is clear and a tool deviates, follow the
  specification and report the tool's deviation upstream.
- Semantics that need byte offsets (`DW_OP_skip`/`DW_OP_bra`) get them from
  the parser, not by re-encoding.
- Read ELF files through linksem rather than writing ad hoc readers in
  Python or OCaml, and use linksem's types directly.

## Validation

- A harness that validates linksem lives in `linksem/validation/<name>/`,
  supports regression runs, extensive random runs and single examples,
  detects its external tools and names the distribution's plain package for
  a missing one, runs on both x86_64 and aarch64 hosts (natively and under an
  emulator for the other), commits its reference results so that runs are
  easy to diff, generates a minimal standalone example for every
  discrepancy, keeps upstream reports in an `upstream-discrepancy-reports/`
  directory, and keeps in its `notes/` the prompts given and the general
  rules, in anonymised form.
- When adding a feature, update and use the existing validation machinery
  (ELF, DWARF dumps, DWARF expressions) to check that the whole is sensible,
  and re-run the dependent tools' tests (read-dwarf on the pKVM object and
  the smoke test).
