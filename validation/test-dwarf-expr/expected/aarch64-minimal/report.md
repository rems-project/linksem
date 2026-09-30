# Claude: DWARF expression cross-check report

Run directory: `/home/pes20/linksem/validation/test-dwarf-expr/output/aarch64-minimal`; evaluators: linksem, gdb, lldb.

## Summary

| class               | count |
|---------------------|-------|
| agree               |    47 |
| linksem-unsupported |     0 |
| linksem-differs     |     0 |
| gdb-differs         |     0 |
| lldb-differs        |    22 |
| all-differ          |     0 |
| gdb-crash           |     3 |
| incomparable        |     1 |
| not-run             |     0 |

gdb and lldb differ from each other on 25 expression(s) (see the last section).

## Operations involved in disagreements

- **lldb-differs**: DW_OP_const1s (11), DW_OP_shra (8), DW_OP_lit2 (5), DW_OP_mod (5), DW_OP_lit1 (4), DW_OP_lt (4), DW_OP_lit4 (4), DW_OP_constu (4), DW_OP_stack_value (3), DW_OP_lit0 (3), DW_OP_eq (2), DW_OP_not (2), DW_OP_neg (2), DW_OP_const1u (2), DW_OP_lit7 (2), DW_OP_abs (2), DW_OP_breg2 (2), DW_OP_lit20 (1), DW_OP_breg14 (1), DW_OP_const2s (1)
- **gdb-crash**: DW_OP_not (3), DW_OP_bra (3), DW_OP_lit1 (3), DW_OP_nop (2), DW_OP_lit5 (1), DW_OP_lit0 (1)

## Disagreements

| name | class | expression | linksem | gdb | lldb |
|------|-------|------------|---------|-----|------|
| m_eq_not | lldb-differs | `DW_OP_lit1; DW_OP_lit1; DW_OP_eq; DW_OP_not; DW_OP_stack_value` | value 0xfffffffffffffffe | value 0xfffffffffffffffe | error: extracting data from value failed |
| m_ne_not | lldb-differs | `DW_OP_lit1; DW_OP_lit2; DW_OP_eq; DW_OP_not; DW_OP_stack_value` | value 0xffffffffffffffff | value 0xffffffffffffffff | error: extracting data from value failed |
| m_lt_neg | lldb-differs | `DW_OP_lit1; DW_OP_lit2; DW_OP_lt; DW_OP_neg; DW_OP_stack_value` | value 0xffffffffffffffff | value 0xffffffffffffffff | error: extracting data from value failed |
| m_shra_neg16_4 | lldb-differs | `DW_OP_const1s -16; DW_OP_lit4; DW_OP_shra` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| m_shra_neg1_4 | lldb-differs | `DW_OP_const1s -1; DW_OP_lit4; DW_OP_shra` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| m_shra_neg16_64 | lldb-differs | `DW_OP_const1s -16; DW_OP_const1u 64; DW_OP_shra` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| m_shra_neg16_68 | lldb-differs | `DW_OP_const1s -16; DW_OP_const1u 68; DW_OP_shra` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| m_addr_minus1 | lldb-differs | `DW_OP_const1s -1` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| m_mod0 | lldb-differs | `DW_OP_lit20; DW_OP_lit0; DW_OP_mod` | addr 0x14 | addr 0x14 | error: invalid load address |
| m_mod_unsigned | lldb-differs | `DW_OP_const1s -7; DW_OP_lit2; DW_OP_mod` | addr 0x1 | addr 0x1 | error: invalid load address |
| m_mod_unsigned2 | lldb-differs | `DW_OP_lit7; DW_OP_const1s -2; DW_OP_mod` | addr 0x7 | addr 0x7 | addr 0x1 |
| m_bra_join_nop | gdb-crash | `DW_OP_lit1; DW_OP_lit1; DW_OP_bra 1; DW_OP_not; DW_OP_nop` | addr 0x1 | error: gdb aborted | addr 0x1 |
| m_bra_join_lit | gdb-crash | `DW_OP_lit1; DW_OP_lit1; DW_OP_bra 1; DW_OP_not; DW_OP_lit5` | addr 0x5 | error: gdb aborted | addr 0x5 |
| m_bra_not_taken_join | gdb-crash | `DW_OP_lit1; DW_OP_lit0; DW_OP_bra 1; DW_OP_not; DW_OP_nop` | addr 0xfffffffffffffffe | error: gdb aborted | addr 0xfffffffffffffffe |
| m_implicit4 | incomparable | `DW_OP_implicit_value {01,02,03,04}` | implicit {01,02,03,04} | error: access outside bounds of object referenced via synthetic pointer | value 0x4030201 |
| t_abs_unsigned_reg | lldb-differs | `DW_OP_breg2 0; DW_OP_abs` | addr 0x1 | addr 0x1 | error: invalid load address |
| t_abs_unsigned_const | lldb-differs | `DW_OP_constu 0xfffffffffffffffb; DW_OP_abs` | addr 0x5 | addr 0x5 | addr 0xfffffffffffffffb |
| t_shra_unsigned | lldb-differs | `DW_OP_constu 0xfffffffffffffff0; DW_OP_lit4; DW_OP_shra` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| t_shra_reg | lldb-differs | `DW_OP_breg14 0; DW_OP_lit4; DW_OP_shra` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| t_shra_count_2_32_4 | lldb-differs | `DW_OP_const1s -16; DW_OP_constu 0x100000004; DW_OP_shra` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| t_shra_count_neg | lldb-differs | `DW_OP_const1s -16; DW_OP_const2s -188; DW_OP_shra` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| t_lt_unsigned_const | lldb-differs | `DW_OP_constu 0xffffffffffffffff; DW_OP_lit0; DW_OP_lt` | addr 0x1 | addr 0x1 | addr 0x0 |
| t_lt_reg | lldb-differs | `DW_OP_breg2 0; DW_OP_lit0; DW_OP_lt` | addr 0x1 | addr 0x1 | addr 0x0 |
| t_lt_neg_addr | lldb-differs | `DW_OP_lit1; DW_OP_lit2; DW_OP_lt; DW_OP_neg` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| t_mod_signed_top | lldb-differs | `DW_OP_lit7; DW_OP_const1s -2; DW_OP_mod` | addr 0x7 | addr 0x7 | addr 0x1 |
| t_mod_neg_second | lldb-differs | `DW_OP_const1s -7; DW_OP_lit2; DW_OP_mod` | addr 0x1 | addr 0x1 | error: invalid load address |

## gdb versus lldb

| name | expression | gdb | lldb | linksem |
|------|------------|-----|------|---------|
| m_eq_not | `DW_OP_lit1; DW_OP_lit1; DW_OP_eq; DW_OP_not; DW_OP_stack_value` | value 0xfffffffffffffffe | error: extracting data from value failed | value 0xfffffffffffffffe |
| m_ne_not | `DW_OP_lit1; DW_OP_lit2; DW_OP_eq; DW_OP_not; DW_OP_stack_value` | value 0xffffffffffffffff | error: extracting data from value failed | value 0xffffffffffffffff |
| m_lt_neg | `DW_OP_lit1; DW_OP_lit2; DW_OP_lt; DW_OP_neg; DW_OP_stack_value` | value 0xffffffffffffffff | error: extracting data from value failed | value 0xffffffffffffffff |
| m_shra_neg16_4 | `DW_OP_const1s -16; DW_OP_lit4; DW_OP_shra` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| m_shra_neg1_4 | `DW_OP_const1s -1; DW_OP_lit4; DW_OP_shra` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| m_shra_neg16_64 | `DW_OP_const1s -16; DW_OP_const1u 64; DW_OP_shra` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| m_shra_neg16_68 | `DW_OP_const1s -16; DW_OP_const1u 68; DW_OP_shra` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| m_addr_minus1 | `DW_OP_const1s -1` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| m_mod0 | `DW_OP_lit20; DW_OP_lit0; DW_OP_mod` | addr 0x14 | error: invalid load address | addr 0x14 |
| m_mod_unsigned | `DW_OP_const1s -7; DW_OP_lit2; DW_OP_mod` | addr 0x1 | error: invalid load address | addr 0x1 |
| m_mod_unsigned2 | `DW_OP_lit7; DW_OP_const1s -2; DW_OP_mod` | addr 0x7 | addr 0x1 | addr 0x7 |
| m_bra_join_nop | `DW_OP_lit1; DW_OP_lit1; DW_OP_bra 1; DW_OP_not; DW_OP_nop` | error: gdb aborted | addr 0x1 | addr 0x1 |
| m_bra_join_lit | `DW_OP_lit1; DW_OP_lit1; DW_OP_bra 1; DW_OP_not; DW_OP_lit5` | error: gdb aborted | addr 0x5 | addr 0x5 |
| m_bra_not_taken_join | `DW_OP_lit1; DW_OP_lit0; DW_OP_bra 1; DW_OP_not; DW_OP_nop` | error: gdb aborted | addr 0xfffffffffffffffe | addr 0xfffffffffffffffe |
| t_abs_unsigned_reg | `DW_OP_breg2 0; DW_OP_abs` | addr 0x1 | error: invalid load address | addr 0x1 |
| t_abs_unsigned_const | `DW_OP_constu 0xfffffffffffffffb; DW_OP_abs` | addr 0x5 | addr 0xfffffffffffffffb | addr 0x5 |
| t_shra_unsigned | `DW_OP_constu 0xfffffffffffffff0; DW_OP_lit4; DW_OP_shra` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| t_shra_reg | `DW_OP_breg14 0; DW_OP_lit4; DW_OP_shra` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| t_shra_count_2_32_4 | `DW_OP_const1s -16; DW_OP_constu 0x100000004; DW_OP_shra` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| t_shra_count_neg | `DW_OP_const1s -16; DW_OP_const2s -188; DW_OP_shra` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| t_lt_unsigned_const | `DW_OP_constu 0xffffffffffffffff; DW_OP_lit0; DW_OP_lt` | addr 0x1 | addr 0x0 | addr 0x1 |
| t_lt_reg | `DW_OP_breg2 0; DW_OP_lit0; DW_OP_lt` | addr 0x1 | addr 0x0 | addr 0x1 |
| t_lt_neg_addr | `DW_OP_lit1; DW_OP_lit2; DW_OP_lt; DW_OP_neg` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| t_mod_signed_top | `DW_OP_lit7; DW_OP_const1s -2; DW_OP_mod` | addr 0x7 | addr 0x1 | addr 0x7 |
| t_mod_neg_second | `DW_OP_const1s -7; DW_OP_lit2; DW_OP_mod` | addr 0x1 | error: invalid load address | addr 0x1 |

