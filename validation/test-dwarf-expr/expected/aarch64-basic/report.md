# Claude: DWARF expression cross-check report

Run directory: `/home/pes20/linksem/validation/test-dwarf-expr/output/aarch64-basic`; evaluators: linksem, gdb, lldb.

Tools: aarch64-linux-gnu-as: GNU assembler (GNU Binutils for Ubuntu) 2.42; gdb-multiarch: GNU gdb (Ubuntu 15.1-1ubuntu1~24.04.1) 15.1; lldb: lldb version 18.1.3; qemu-aarch64: qemu-aarch64 version 8.2.2 (Debian 1:8.2.2+ds-0ubuntu1.18).

## Summary

| class               | count |
|---------------------|-------|
| agree               |    67 |
| linksem-unsupported |     0 |
| linksem-differs     |     0 |
| gdb-differs         |     0 |
| lldb-differs        |     8 |
| all-differ          |     0 |
| gdb-crash           |     0 |
| incomparable        |     1 |
| not-run             |     0 |

gdb and lldb differ from each other on 8 expression(s) (see the last section).

## Operations involved in disagreements

- **lldb-differs**: DW_OP_breg2 (6), DW_OP_lit0 (3), DW_OP_shra (3), DW_OP_lt (2), DW_OP_mod (1), DW_OP_lit20 (1), DW_OP_abs (1), DW_OP_lit4 (1), DW_OP_breg13 (1), DW_OP_const1u (1), DW_OP_breg4 (1), DW_OP_breg3 (1), DW_OP_gt (1)

## Disagreements

| name | class | expression | linksem | gdb | lldb |
|------|-------|------------|---------|-----|------|
| mod_zero | lldb-differs | `DW_OP_lit20; DW_OP_lit0; DW_OP_mod` | addr 0x14 | addr 0x14 | error: invalid load address |
| abs | lldb-differs | `DW_OP_breg2 0; DW_OP_abs` | addr 0x1 | addr 0x1 | error: invalid load address |
| shra | lldb-differs | `DW_OP_breg2 0; DW_OP_lit4; DW_OP_shra` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| shra_64 | lldb-differs | `DW_OP_breg2 0; DW_OP_breg13 0; DW_OP_shra` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| shra_65 | lldb-differs | `DW_OP_breg2 0; DW_OP_const1u 65; DW_OP_shra` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| lt_signed | lldb-differs | `DW_OP_breg2 0; DW_OP_lit0; DW_OP_lt` | addr 0x1 | addr 0x1 | addr 0x0 |
| lt_unsigned_view | lldb-differs | `DW_OP_lit0; DW_OP_breg2 0; DW_OP_lt` | addr 0x0 | addr 0x0 | addr 0x1 |
| gt | lldb-differs | `DW_OP_breg3 0; DW_OP_breg4 0; DW_OP_gt` | addr 0x0 | addr 0x0 | addr 0x1 |
| piece | incomparable | `DW_OP_reg1; DW_OP_piece 4; DW_OP_reg2; DW_OP_piece 4` | composite piece(4,reg 1) piece(4,reg 2) | value 0xffffffff00000010 | value 0xffffffff00000010 |

## gdb versus lldb

| name | expression | gdb | lldb | linksem |
|------|------------|-----|------|---------|
| mod_zero | `DW_OP_lit20; DW_OP_lit0; DW_OP_mod` | addr 0x14 | error: invalid load address | addr 0x14 |
| abs | `DW_OP_breg2 0; DW_OP_abs` | addr 0x1 | error: invalid load address | addr 0x1 |
| shra | `DW_OP_breg2 0; DW_OP_lit4; DW_OP_shra` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| shra_64 | `DW_OP_breg2 0; DW_OP_breg13 0; DW_OP_shra` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| shra_65 | `DW_OP_breg2 0; DW_OP_const1u 65; DW_OP_shra` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| lt_signed | `DW_OP_breg2 0; DW_OP_lit0; DW_OP_lt` | addr 0x1 | addr 0x0 | addr 0x1 |
| lt_unsigned_view | `DW_OP_lit0; DW_OP_breg2 0; DW_OP_lt` | addr 0x0 | addr 0x1 | addr 0x0 |
| gt | `DW_OP_breg3 0; DW_OP_breg4 0; DW_OP_gt` | addr 0x0 | addr 0x1 | addr 0x0 |

