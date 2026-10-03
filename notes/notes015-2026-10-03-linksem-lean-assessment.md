<!-- Claude: written by Claude, 3 October 2026. -->
# notes015: the OathTech linksem-lean build, and an assessment of the generated Lean

A side experiment, in scratch space only (`~/scratch-linksem-lean/`; nothing
in the checked-out repositories was changed): check out and build
https://github.com/OathTech/linksem-lean with https://github.com/OathTech/lem-lean,
then assess the generated Lean as a specification meant for both execution
and proof.  The earlier experiment of trying lem-lean on our own linksem is
read-dwarf-private3's `notes/notes035-2026-09-28-lem-lean-linksem-experiment.md`.

## What was built, and where

- lem-lean at `77ad4fa` (branch `mdd/lean-backend`), the commit linksem-lean's
  `lean/lakefile.lean` pins for its runtime library LemLib: `make`,
  `make ocaml-libs`, the OCaml library installed into
  `~/scratch-linksem-lean/findlib` and exported as `OCAMLPATH`.
- linksem-lean at `f54d119` (30 September 2026; 1175 commits, a fork of an
  older linksem than ours: its `dwarf.lem` is 6508 lines, without the
  DWARF 5 work, the readelf-format dumps or the 19 September fixes).  Its
  OCaml reference build (`make -C src LEM=…/lem-lean/lem`), the extraction
  (`make -C src -f lem.mk lean-extraction`: 97 modules, 194 `.lean` files)
  and `lake build` (Lean 4.32.2 via elan; 240 jobs, no errors, about a
  minute, `Dwarf.lean` 10 s to elaborate and 11 s to compile) all succeeded.
- Generated sources: `~/scratch-linksem-lean/linksem-lean/lean/generated/`
  (32k lines; `Dwarf.lean` 5773).  Built artefacts (105 `.olean`s, the C
  objects, 115 MB) under `lean/.lake/build/lib/lean/`, and the executables
  `main_elf` and `main_link` in `lean/.lake/build/bin/`.  Hand-written Lean
  twins of linksem's OCaml helpers (657 lines) in `lean/handwritten/`.
- Two false starts of mine: a `lake build` under a 20 GB address-space cap
  died with "failed to create thread" (Lean's thread pool), and lake has no
  `-j` flag.

## Execution: parity with the OCaml build

`main_elf` (the port's driver mirrors the old OCaml `main_elf`), Lean versus
OCaml, byte-identical output in every case tried; the Lean binary requires
`LEAN_ABORT_ON_PANIC=1` so that a reached `failwith` stops the program as
OCaml's exception does, instead of continuing with a default value:

| file                        | option                 | lines  | OCaml  | Lean   |
|-----------------------------|------------------------|--------|--------|--------|
| main_elf.opt (9 MB exe)     | `--section-headers`    | 50     | 2.9 s  | 1.6 s  |
| main_elf.opt                | `--symbols`            | 36586  | 13.5 s | 35.2 s |
| kvm_nvhe.o (DWARF 4, 6.7 MB)| `--section-headers`    | 52     | 1.6 s  | 0.9 s  |
| kvm_nvhe.o                  | `--symbols`            | 4897   | 2.0 s  | 1.5 s  |
| kvm_nvhe.o                  | `--debug-dump=dies`    | fails  | 1.7 s  | 1.0 s  |
| small aarch64 .o (DWARF 4)  | `--debug-dump=dies`    | 398    | 6 ms   | 8 ms   |
| small aarch64 .o            | `--debug-dump=info`    | 866    | 11 ms  | 11 ms  |

The kvm_nvhe.o DWARF dump fails identically in both ("parse_die returned
Nothing: pc_offset = 0xdead"): that is the unit-delimiting bug our linksem
fixed on 19 September (notes007 A1), faithfully reproduced.  Likewise a
small x86-64 executable fails identically on its `.debug_loc`.  So as an
executable the Lean build is a faithful twin of the OCaml one, at
comparable speed (the port's own findings file reports the same over a
corpus).  The port's policy, stated in its `docs/2026-09-28_upstream-findings.md`,
is to mirror upstream bugs rather than fix them, and to record them; its
F1 (the uint wrappers reducing modulo 2^N - 1) and F5 (hex printing of
values of 2^63 and above) are among the things our 19 and 30 September
commits fixed independently.

## Style and quality of the generated Lean

What is good:

- **Faithful, total-looking structure.**  Lem records become `structure`s
  with the original field names and `deriving BEq, Ord`; variants become
  `inductive`s; the Lem comments are carried through, so a reader of
  `Elf_header.lean` sees the same text as a reader of `elf_header.lem`.
  Functions keep their names and parameter names, with full type
  annotations.  The module structure is the Lem one, with the lem-lean
  `LemLib` library standing in for Lem's.
- **The type classes are explicit.**  Lem's `Eq`, `Ord`, `SetType` and
  `Show` instances are generated per type (as `Eq0`, `Ord0`, `SetType`,
  `Show`), with the structural equality and comparison written out, so a
  proof can unfold them.  Equality on records containing functions
  (`evaluation_context`) is a loud runtime failure (`lemFunctionalBeq`),
  never a silent `true`.
- **Executability is real.**  Byte sequences are a hand-written
  `ByteArray` slice; sets and maps are a balanced tree (`Pset`, `Fmap`,
  ported from Lem's OCaml `pset.ml`), not lists; machine words are the Lean
  `UInt32`/`UInt64`-backed twins; the numbers are `Nat` and `Int`
  (arbitrary precision).  Hence the parity and the speed above.
- **Honest about partiality.**  Incomplete Lem matches become an explicit
  `failwithI "Incomplete Pattern at File …"` arm (440 of them, 4 in
  `Dwarf.lean`), and Lem's own `Assert_extra.failwith`s (90 in `dwarf.lem`)
  become `failwithI` too; `failwithI` is `panic!` behind an `Inhabited`
  default, so for proof it is a total function returning `default`, and for
  execution `LEAN_ABORT_ON_PANIC=1` makes it stop.  The backend refuses
  rather than guesses where it cannot translate (its set-comprehension
  gap is `sorry` in five `LemLib.Set` functions, which linksem does not
  call; the `lake build` log has no `sorry` warnings).

What is not good, for a specification "clean" enough to prove about:

- **Recursion.**  Every genuinely recursive Lem function is a `partial def`
  (61 in `Dwarf.lean`, about 140 overall: `parse_die`, `parse_list'`,
  `evaluate_operation_list`, `interpret_location_list`, the SDT walkers,
  the pretty-printers, `natural_of_bytes_little`, `mynth`, …).  Lean's
  `partial` is opaque to the kernel: nothing can be proved about these
  functions' values, and anything that calls them is likewise blocked.
  The only `termination_by` uses (109) are the generated `structural`
  ones on the derived equality and comparison functions and on
  `lemSize`.  The backend's design (`doc/lean-backend/DESIGN.md`) offers
  the remedy, `declare {lean} structural val f` for structural recursion
  and `declare {lean} fuel val f` (an explicit fuel counter, with an
  ambient `[LemFuel]` instance and a per-function fuel-irrelevance
  theorem) for the rest, with a `fuel_measure` form that discharges the
  fuel by a computable measure; but linksem-lean has not applied any of
  these declarations to linksem, so the proof-facing half of the design is
  unused here.  Doing so is the single largest piece of work between this
  build and a provable model: each of the ~140 functions needs a
  classification (structural on which argument; or fuel'd, with what
  measure), and the parsers' recursion is on the byte count, not on a
  constructor, so most of `dwarf.lem`'s would be fuel'd.
- **Readability of function bodies.**  Types and comments are clean, but
  bodies are emitted on single long lines: `Dwarf.lean` has 274 lines over
  200 characters and 29 over 1000 (one of 28753 characters; the
  monadic chains of `read_elf64_header` and `parse_compilation_unit_header`
  are each one line).  `if` is `lem_if`, `>=` is `natGteb`, `≥` and `==`
  come from the library rather than Lean's own notation, every
  `error_bind` is written out with its continuation's type, and the `let`
  chains use `;`.  It builds and runs, but one would not read it in place
  of the Lem; a proof developed against it would be against the generated
  names, which is fine, but any manual statement about a body (an
  unfolding, a `simp` set) has to be written against this shape.
- **Information dropped.**  The 68 `/- removed value specification -/`
  markers in `Elf_header.lean` (92 in `Dwarf.lean`) are where Lem `val`
  declarations were dropped (the `def`s carry the types, so nothing is
  lost semantically, but the Lem file's documentation structure is).
  Everything is in one global namespace (two `namespace`s in `Dwarf.lean`,
  none elsewhere), relying on the Lem names being distinct; Lem's
  `declare lean target_rep` renamings are what the `handwritten/` twins
  supply, so the generated code depends on 657 lines of hand-written Lean
  that have no Lem counterpart (byte sequences, the uint wrappers,
  `Ml_bindings`, the filesystem), exactly as the OCaml build depends on the
  same `*.ml` helpers.
- **Debug side effects.**  `my_debug` calls (prints to stderr in the OCaml)
  are compiled in as `lemSeq` of an `implemented_by` unsafe primitive;
  harmless for proof (the pure definition ignores the first argument) but
  a wart.

## Assessment

As an *executable* Lean twin of linksem, this is in good shape: it builds
cleanly, it is byte-identical to the OCaml build on everything tried, and it
is as fast.  As a *specification for proof*, it is not yet usable beyond the
first-order parts (the record and variant types, the non-recursive
functions such as the header field decoders, validity predicates and name
tables, the derived equalities): every parser, interpreter and tree walk is
`partial`, and the ingredients to change that (lem-lean's structural and
fuel declarations) are present in the backend but have not been applied to
linksem.  The body formatting would also need the backend to emit
line-broken code (or a Lean formatter) before anyone would want to read
proofs against it.

For our purposes the sensible next steps, if this direction is pursued, are
(1) rebase the port onto our `reloc-new-ps` linksem (it is three weeks and
some 150 commits behind, including DWARF 5), which is mostly mechanical
since the port's own linksem changes are small and documented in its
findings file; (2) add the `declare {lean} structural/fuel` annotations to
`dwarf.lem` and `elf_file.lem` for the recursive functions, which also
documents, in the Lem, why each terminates; (3) ask the lem-lean authors
for line-broken output.  None of that was done here.
