<!-- Claude: drafted by Claude (19 September 2026) for appending to linksem's LICENCE; wording of the last sentence by Peter Sewell. -->
The scripts under `validation/` fetch, at run time and to a local cache
only, test inputs from the GNU binutils and elfutils repositories (GPLv3 or
later), the LLVM project (Apache-2.0 with LLVM exception) and
libdwarf-regressiontests (BSD-style, per its COPYING).  None of that
material is distributed with linksem; `validation/dwarf/expected-failures.txt`
and the manifests record file names only.  The readelf-compatible printers
in `src/adaptors/harness_interface.lem` and `src/dwarf.lem` reproduce the
output formats of GNU readelf and objdump (binutils 2.42), including their
message texts and name tables, written by reading those programs' source
and observing their behaviour; apart from the message texts and name tables,
they contain no source copied from binutils.
