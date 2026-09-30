# Claude: general instructions this harness was built under

Claude: this note records, in anonymised form, the standing instructions the
project owner gave that shaped this harness and the linksem fixes made with
it.  Another agent instance doing similar work (a validation harness for a
formal model against external tools, and fixing the model from its findings)
should follow the same.

## How work is organised

- Do speculative work in scratch space first, outside the checked-out
  repositories, and write a note summarising the results and a plan, with the
  difficulties and choice points made explicit.  Only after the owner has
  read the note and answered the choice points (as `PS:` comments in the note)
  is the real implementation made, following those answers.
- Notes go in the repository's `notes/` directory as
  `notesNNN-YYYY-MM-DD-topic.md`; committed notes are not edited afterwards.
- A validation harness for linksem lives in `linksem/validation/<name>/`.
- Every directory created gets a README that says what it is, how to build
  and run it, and where its outputs go.  The design notes go in that README.
  The directory also keeps the notes and instructions the work was done from
  (the prompt note, the plan note with the owner's comments, and a note like
  this one).
- Build products go under `output/` (or `_build/`), never beside the sources,
  and are not committed.  Reference results that a regression test compares
  against are committed.

## How a harness should behave

- Support three uses: regression testing (a fixed set of cases against
  committed expected results, failing on any change), extensive validation
  runs (large random sets), and running a single example.
- Detect the external tools it needs.  Tell the user what to install, by the
  distribution's plain package name (on Ubuntu `sudo apt-get install lldb`,
  never a versioned package such as `lldb-18`), but run with whatever is
  present, saying what was skipped.
- Run on either an x86 or an Arm host: the host's architecture natively, the
  other through an emulator when one is installed.
- Make it easy to see what changed between two runs (a diff of results by
  case, with the classification before and after).
- For every discrepancy it finds, automatically produce a minimal standalone
  example, with the commands that reproduce it using the external tools alone,
  suitable for an upstream bug report; write the upstream reports and keep
  them in an `upstream-discrepancy-reports/` directory of the harness.

## How the model is changed

- Changes to the formal model (here linksem's Lem) are conservative and in
  the model's own functional style; do not mirror the structure of C tools.
- One fix per commit, each sanity-checked (built and tested against the
  harness) before committing, so a later regression can be traced.
- Where the specification leaves a case undefined, check the specification
  text itself (the PDF is in `doc/`); if it really is undefined, follow the
  reference tool (gdb) and write beside the code that the model is making a
  choice there.
- Do not re-encode data to recover information the parser had; make the
  parser record it (here, the byte offset of each operation, for the branch
  operations).
- Code that reproduces the behaviour of GPL tools (binutils, gdb) may take
  their message texts and name tables, nothing else; the code is written from
  the specification and observed behaviour.

## How authorship is marked

- Commit messages written by the assistant begin with `Claude: `; comments it
  inserts in code are prefixed `Claude:`; prose files it writes open with a
  `Claude:` remark.  The owner's own text is never rewritten unless he asks
  for that file to be rewritten; corrections are made in place, additions are
  marked.
- Markdown tables in notes are padded so the columns line up in the source.
