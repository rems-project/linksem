Claude: this README is largely written by Claude (25 September 2026).

# gen-arm64-cpucaps-for-lem

`gen-arm64-cpucaps-for-lem.awk` turns the Linux kernel's list of arm64 CPU
capabilities, `arch/arm64/tools/cpucaps` (which the kernel's own
`gen-cpucaps.awk` turns into `cpucap-defs.h`), into the Lem module
`src/generated_arm64_cpucaps.lem`, committed into linksem: an enumerated
type `cpucap` with a constructor `ARM64_<name>` per capability in the
kernel's numbering, `cpucap_number`/`cpucap_of_number`,
`string_of_cpucap`/`cpucap_of_string`, `all_cpucaps`, `arm64_ncaps`, the
association-list type `cpucaps`, `cpucaps_of_bitmap`/`bitmap_of_cpucaps`
for the kernel's `DECLARE_BITMAP` representation, and the flag names under
which a cpucap appears in a `Symbolic_resolution` environment
(`cpucap:ARM64_...`, `boot_cpucap:ARM64_...`).

`make` regenerates it from the kernel checkout `LINUX_DIR` (default
`../../../re-linux`); the generated file's header records the kernel
commit it came from.  Used by `src/pkvm/pkvm_alternatives.lem`, which is
written against the kernel described in `src/pkvm/README.md`.  Background:
readdwarf-private-3 `notes/notes016` (item b), `notes023`, `notes025`.
