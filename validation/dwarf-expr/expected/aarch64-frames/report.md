# Claude: DWARF expression cross-check report

Run directory: `/home/pes20/linksem/validation/dwarf-expr/output/aarch64-frames`; evaluators: linksem, gdb, lldb.

Tools: aarch64-linux-gnu-as: GNU assembler (GNU Binutils for Ubuntu) 2.42; gdb-multiarch: GNU gdb (Ubuntu 15.1-1ubuntu1~24.04.1) 15.1; lldb: lldb version 18.1.3; qemu-aarch64: qemu-aarch64 version 8.2.2 (Debian 1:8.2.2+ds-0ubuntu1.18).

## Summary

| class               | count |
|---------------------|-------|
| agree               |    24 |
| linksem-unsupported |     0 |
| linksem-differs     |     0 |
| gdb-differs         |     0 |
| lldb-differs        |     2 |
| all-differ          |     0 |
| gdb-crash           |     0 |
| incomparable        |     0 |
| not-run             |     0 |

gdb and lldb differ from each other on 2 expression(s) (see the last section).

## Operations involved in disagreements

- **lldb-differs**: DW_OP_call_frame_cfa (2)

## Disagreements

| name | class | expression | linksem | gdb | lldb |
|------|-------|------------|---------|-----|------|
| cfa_in_reg@fb=reg | lldb-differs | `DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffda0 |
| cfa_in_loclist@fb=loclist | lldb-differs | `DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffda0 |

## gdb versus lldb

| name | expression | gdb | lldb | linksem |
|------|------------|-----|------|---------|
| cfa_in_reg@fb=reg | `DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffda0 | addr 0x700000000010 |
| cfa_in_loclist@fb=loclist | `DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffda0 | addr 0x700000000010 |

