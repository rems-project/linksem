# Claude: DWARF expression cross-check report

Run directory: `/home/pes20/linksem/validation/dwarf-expr/output/x86_64-typed`; evaluators: linksem, gdb, lldb.

Tools: as: GNU assembler (GNU Binutils for Ubuntu) 2.42; gdb: GNU gdb (Ubuntu 15.1-1ubuntu1~24.04.1) 15.1; lldb: lldb version 18.1.3; linksem: 0.8-178-gf95014e-dirty.

## Summary

| class               | count |
|---------------------|-------|
| agree               |     7 |
| linksem-unsupported |     0 |
| linksem-differs     |     1 |
| gdb-differs         |     0 |
| lldb-differs        |    48 |
| all-differ          |     7 |
| gdb-crash           |     0 |
| incomparable        |     0 |
| not-run             |     0 |

gdb and lldb differ from each other on 55 expression(s) (see the last section).

## Operations involved in disagreements

- **lldb-differs**: DW_OP_convert (40), DW_OP_const_type (39), DW_OP_lit1 (7), DW_OP_neg (5), DW_OP_stack_value (5), DW_OP_mod (3), DW_OP_const1u (2), DW_OP_regval_type (2), DW_OP_deref_type (2), DW_OP_addr (2), DW_OP_plus (2), DW_OP_div (2), DW_OP_lt (2), DW_OP_abs (2), DW_OP_reinterpret (2), DW_OP_mul (1), DW_OP_eq (1), DW_OP_shl (1), DW_OP_shr (1), DW_OP_shra (1), DW_OP_not (1), DW_OP_plus_uconst (1), DW_OP_dup (1)
- **all-differ**: DW_OP_convert (7), DW_OP_const_type (7), DW_OP_plus_uconst (1)
- **linksem-differs**: DW_OP_constx (1), DW_OP_stack_value (1)

## Disagreements

| name | class | expression | linksem | gdb | lldb |
|------|-------|------------|---------|-----|------|
| t_conv_neg_int | lldb-differs | `DW_OP_lit1; DW_OP_neg; DW_OP_convert T_i; DW_OP_convert 0` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | addr 0xffffffff |
| t_conv_zext | lldb-differs | `DW_OP_const1u 0x80; DW_OP_convert T_uc; DW_OP_convert T_l; DW_OP_convert 0` | addr 0x80 | addr 0x80 | addr 0xffffffffffffff80 |
| t_conv_generic_neg | lldb-differs | `DW_OP_lit1; DW_OP_neg; DW_OP_convert T_uc; DW_OP_convert T_i; DW_OP_convert 0` | addr 0xff | addr 0xff | addr 0xffffffff |
| t_conv_signed_to_generic | lldb-differs | `DW_OP_const1u 0xff; DW_OP_convert T_sc; DW_OP_convert 0` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | addr 0xff |
| t_conv_narrow_neg_l_us | lldb-differs | `DW_OP_const_type T_l {ff,ff,ff,ff,ff,ff,ff,ff}; DW_OP_convert T_us; DW_OP_convert 0` | addr 0xffff | addr 0xffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_narrow_neg_l_s | lldb-differs | `DW_OP_const_type T_l {fe,ff,ff,ff,ff,ff,ff,ff}; DW_OP_convert T_s; DW_OP_convert 0` | addr 0xfffffffffffffffe | addr 0xfffffffffffffffe | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_narrow_neg_i_uc | all-differ | `DW_OP_const_type T_i {1c,91,69,ea}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0x1c | addr 0xe4 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_narrow_neg_i_sc | all-differ | `DW_OP_const_type T_i {1c,91,69,ea}; DW_OP_convert T_sc; DW_OP_convert 0` | addr 0x1c | addr 0xffffffffffffffe4 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_narrow_pos_l_us | lldb-differs | `DW_OP_const_type T_l {b3,11,d5,19,77,73,74,5f}; DW_OP_convert T_us; DW_OP_convert 0` | addr 0x11b3 | addr 0x11b3 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_narrow_neg_i_us | all-differ | `DW_OP_const_type T_i {1c,91,69,ea}; DW_OP_convert T_us; DW_OP_convert 0` | addr 0x911c | addr 0x6ee4 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_narrow_neg_i_ui | lldb-differs | `DW_OP_const_type T_i {1c,91,69,ea}; DW_OP_convert T_ui; DW_OP_convert 0` | addr 0xea69911c | addr 0xea69911c | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_widen_neg_i_l | lldb-differs | `DW_OP_const_type T_i {1c,91,69,ea}; DW_OP_convert T_l; DW_OP_convert 0` | addr 0xffffffffea69911c | addr 0xffffffffea69911c | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_narrow_neg_l_uc | all-differ | `DW_OP_const_type T_l {1c,91,69,ea,ff,ff,ff,ff}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0x1c | addr 0xe4 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_narrow_intmin_uc | lldb-differs | `DW_OP_const_type T_i {00,00,00,80}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0x0 | addr 0x0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_narrow_m2_uc | lldb-differs | `DW_OP_const_type T_i {fe,ff,ff,ff}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0xfe | addr 0xfe | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_narrow_m256_uc | lldb-differs | `DW_OP_const_type T_i {00,ff,ff,ff}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0x0 | addr 0x0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_narrow_m257_uc | all-differ | `DW_OP_const_type T_i {ff,fe,ff,ff}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0xff | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_narrow_m300_uc | all-differ | `DW_OP_const_type T_i {d4,fe,ff,ff}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0xd4 | addr 0x2c | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_widen_neg_sc_us | lldb-differs | `DW_OP_const_type T_sc {ff}; DW_OP_convert T_us; DW_OP_convert 0` | addr 0xffff | addr 0xffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_conv_widen_neg_i_ul | lldb-differs | `DW_OP_const_type T_i {ff,ff,ff,ff}; DW_OP_convert T_ul; DW_OP_convert 0` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_const_type | lldb-differs | `DW_OP_const_type T_ui {ff,ff,ff,ff}; DW_OP_convert 0` | addr 0xffffffff | addr 0xffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_const_type_signed_addr | lldb-differs | `DW_OP_const_type T_i {ff,ff,ff,ff}` | addr 0xffffffff | addr 0xffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_const_type_unsigned_addr | lldb-differs | `DW_OP_const_type T_ui {ff,ff,ff,ff}` | addr 0xffffffff | addr 0xffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_regval_type | lldb-differs | `DW_OP_regval_type 2 T_ui; DW_OP_convert 0` | addr 0xffffffff | addr 0xffffffff | error: Unhandled opcode DW_OP_regval_type in DWARFExpression |
| t_regval_type_signed | lldb-differs | `DW_OP_regval_type 2 T_s; DW_OP_convert 0` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: Unhandled opcode DW_OP_regval_type in DWARFExpression |
| t_deref_type | lldb-differs | `DW_OP_addr dw_mem+8; DW_OP_deref_type 2 T_us; DW_OP_convert 0` | addr 0x5833 | addr 0x5833 | error: Unhandled opcode DW_OP_deref_type in DWARFExpression |
| t_deref_type_signed | lldb-differs | `DW_OP_addr dw_mem+3; DW_OP_deref_type 1 T_sc; DW_OP_convert 0` | addr 0x7a | addr 0x7a | error: Unhandled opcode DW_OP_deref_type in DWARFExpression |
| t_typed_add_wrap | lldb-differs | `DW_OP_const_type T_uc {ff}; DW_OP_const_type T_uc {02}; DW_OP_plus; DW_OP_convert 0` | addr 0x1 | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_mul_wrap | lldb-differs | `DW_OP_const_type T_us {00,80}; DW_OP_const_type T_us {02,00}; DW_OP_mul; DW_OP_convert 0` | addr 0x0 | addr 0x0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_div_unsigned | lldb-differs | `DW_OP_const_type T_uc {fe}; DW_OP_const_type T_uc {03}; DW_OP_div; DW_OP_convert 0` | addr 0x54 | addr 0x54 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_div_signed | lldb-differs | `DW_OP_const_type T_sc {fe}; DW_OP_const_type T_sc {03}; DW_OP_div; DW_OP_convert 0` | addr 0x0 | addr 0x0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_mod_unsigned | lldb-differs | `DW_OP_const_type T_uc {fe}; DW_OP_const_type T_uc {03}; DW_OP_mod; DW_OP_convert 0` | addr 0x2 | addr 0x2 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_mod_signed | lldb-differs | `DW_OP_const_type T_sc {fe}; DW_OP_const_type T_sc {03}; DW_OP_mod; DW_OP_convert 0` | addr 0xfffffffffffffffe | addr 0xfffffffffffffffe | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_mod_signed_pos | lldb-differs | `DW_OP_const_type T_sc {07}; DW_OP_const_type T_sc {fd}; DW_OP_mod; DW_OP_convert 0` | addr 0x1 | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_lt_unsigned | lldb-differs | `DW_OP_const_type T_uc {fe}; DW_OP_const_type T_uc {03}; DW_OP_lt` | addr 0x0 | addr 0x0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_lt_signed | lldb-differs | `DW_OP_const_type T_sc {fe}; DW_OP_const_type T_sc {03}; DW_OP_lt` | addr 0x1 | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_eq | lldb-differs | `DW_OP_const_type T_i {ff,ff,ff,ff}; DW_OP_lit1; DW_OP_neg; DW_OP_convert T_i; DW_OP_eq` | addr 0x1 | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_shl | lldb-differs | `DW_OP_const_type T_uc {81}; DW_OP_lit1; DW_OP_convert T_uc; DW_OP_shl; DW_OP_convert 0` | addr 0x2 | addr 0x2 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_shr | lldb-differs | `DW_OP_const_type T_uc {80}; DW_OP_lit1; DW_OP_convert T_uc; DW_OP_shr; DW_OP_convert 0` | addr 0x40 | addr 0x40 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_shra | lldb-differs | `DW_OP_const_type T_sc {80}; DW_OP_lit1; DW_OP_convert T_sc; DW_OP_shra; DW_OP_convert 0` | addr 0xffffffffffffffc0 | addr 0xffffffffffffffc0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_neg | lldb-differs | `DW_OP_const_type T_uc {01}; DW_OP_neg; DW_OP_convert 0` | addr 0xff | addr 0xff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_abs_unsigned | lldb-differs | `DW_OP_const_type T_uc {ff}; DW_OP_abs; DW_OP_convert 0` | addr 0xff | addr 0xff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_abs_signed | lldb-differs | `DW_OP_const_type T_sc {ff}; DW_OP_abs; DW_OP_convert 0` | addr 0x1 | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_not | lldb-differs | `DW_OP_const_type T_us {0f,00}; DW_OP_not; DW_OP_convert 0` | addr 0xfff0 | addr 0xfff0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_plus_uconst | all-differ | `DW_OP_const_type T_uc {ff}; DW_OP_plus_uconst 2; DW_OP_convert 0` | addr 0x1 | addr 0x101 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_plus_uconst_signed | lldb-differs | `DW_OP_const_type T_sc {ff}; DW_OP_plus_uconst 2; DW_OP_convert 0` | addr 0x1 | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_reinterpret | lldb-differs | `DW_OP_const_type T_i {ff,ff,ff,ff}; DW_OP_reinterpret T_ui; DW_OP_convert 0` | addr 0xffffffff | addr 0xffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_reinterpret_generic | lldb-differs | `DW_OP_lit1; DW_OP_neg; DW_OP_reinterpret T_l; DW_OP_convert T_i; DW_OP_convert 0` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: Unhandled opcode DW_OP_reinterpret in DWARFExpression |
| t_typed_stack_value_us | lldb-differs | `DW_OP_const_type T_us {34,12}; DW_OP_stack_value` | value 0x1234 | value 0x1234 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_stack_value_generic | lldb-differs | `DW_OP_const_type T_us {34,12}; DW_OP_convert 0; DW_OP_stack_value` | value 0x1234 | value 0x1234 | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_stack_value_s_neg | lldb-differs | `DW_OP_const_type T_s {ff,ff}; DW_OP_stack_value` | value 0xffff | value 0xffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_stack_value_uc | lldb-differs | `DW_OP_const_type T_uc {ff}; DW_OP_stack_value` | value 0xff | value 0xff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_stack_value_l | lldb-differs | `DW_OP_const_type T_l {ff,ff,ff,ff,ff,ff,ff,ff}; DW_OP_stack_value` | value 0xffffffffffffffff | value 0xffffffffffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_typed_dup_swap | lldb-differs | `DW_OP_const_type T_uc {05}; DW_OP_dup; DW_OP_plus; DW_OP_convert 0` | addr 0xa | addr 0xa | error: Unhandled opcode DW_OP_const_type in DWARFExpression |
| t_constx | linksem-differs | `DW_OP_constx 1; DW_OP_stack_value` | value 0x402010 | error: Unhandled DWARF expression opcode 0xa2 | error: Unhandled opcode DW_OP_constx in DWARFExpression |
| t_typed_loclist@loclist | lldb-differs | `DW_OP_const_type T_sc {ff}; DW_OP_convert 0` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression |

## gdb versus lldb

| name | expression | gdb | lldb | linksem |
|------|------------|-----|------|---------|
| t_conv_neg_int | `DW_OP_lit1; DW_OP_neg; DW_OP_convert T_i; DW_OP_convert 0` | addr 0xffffffffffffffff | addr 0xffffffff | addr 0xffffffffffffffff |
| t_conv_zext | `DW_OP_const1u 0x80; DW_OP_convert T_uc; DW_OP_convert T_l; DW_OP_convert 0` | addr 0x80 | addr 0xffffffffffffff80 | addr 0x80 |
| t_conv_generic_neg | `DW_OP_lit1; DW_OP_neg; DW_OP_convert T_uc; DW_OP_convert T_i; DW_OP_convert 0` | addr 0xff | addr 0xffffffff | addr 0xff |
| t_conv_signed_to_generic | `DW_OP_const1u 0xff; DW_OP_convert T_sc; DW_OP_convert 0` | addr 0xffffffffffffffff | addr 0xff | addr 0xffffffffffffffff |
| t_conv_narrow_neg_l_us | `DW_OP_const_type T_l {ff,ff,ff,ff,ff,ff,ff,ff}; DW_OP_convert T_us; DW_OP_convert 0` | addr 0xffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xffff |
| t_conv_narrow_neg_l_s | `DW_OP_const_type T_l {fe,ff,ff,ff,ff,ff,ff,ff}; DW_OP_convert T_s; DW_OP_convert 0` | addr 0xfffffffffffffffe | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xfffffffffffffffe |
| t_conv_narrow_neg_i_uc | `DW_OP_const_type T_i {1c,91,69,ea}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0xe4 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x1c |
| t_conv_narrow_neg_i_sc | `DW_OP_const_type T_i {1c,91,69,ea}; DW_OP_convert T_sc; DW_OP_convert 0` | addr 0xffffffffffffffe4 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x1c |
| t_conv_narrow_pos_l_us | `DW_OP_const_type T_l {b3,11,d5,19,77,73,74,5f}; DW_OP_convert T_us; DW_OP_convert 0` | addr 0x11b3 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x11b3 |
| t_conv_narrow_neg_i_us | `DW_OP_const_type T_i {1c,91,69,ea}; DW_OP_convert T_us; DW_OP_convert 0` | addr 0x6ee4 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x911c |
| t_conv_narrow_neg_i_ui | `DW_OP_const_type T_i {1c,91,69,ea}; DW_OP_convert T_ui; DW_OP_convert 0` | addr 0xea69911c | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xea69911c |
| t_conv_widen_neg_i_l | `DW_OP_const_type T_i {1c,91,69,ea}; DW_OP_convert T_l; DW_OP_convert 0` | addr 0xffffffffea69911c | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xffffffffea69911c |
| t_conv_narrow_neg_l_uc | `DW_OP_const_type T_l {1c,91,69,ea,ff,ff,ff,ff}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0xe4 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x1c |
| t_conv_narrow_intmin_uc | `DW_OP_const_type T_i {00,00,00,80}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0x0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x0 |
| t_conv_narrow_m2_uc | `DW_OP_const_type T_i {fe,ff,ff,ff}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0xfe | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xfe |
| t_conv_narrow_m256_uc | `DW_OP_const_type T_i {00,ff,ff,ff}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0x0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x0 |
| t_conv_narrow_m257_uc | `DW_OP_const_type T_i {ff,fe,ff,ff}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xff |
| t_conv_narrow_m300_uc | `DW_OP_const_type T_i {d4,fe,ff,ff}; DW_OP_convert T_uc; DW_OP_convert 0` | addr 0x2c | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xd4 |
| t_conv_widen_neg_sc_us | `DW_OP_const_type T_sc {ff}; DW_OP_convert T_us; DW_OP_convert 0` | addr 0xffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xffff |
| t_conv_widen_neg_i_ul | `DW_OP_const_type T_i {ff,ff,ff,ff}; DW_OP_convert T_ul; DW_OP_convert 0` | addr 0xffffffffffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xffffffffffffffff |
| t_const_type | `DW_OP_const_type T_ui {ff,ff,ff,ff}; DW_OP_convert 0` | addr 0xffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xffffffff |
| t_const_type_signed_addr | `DW_OP_const_type T_i {ff,ff,ff,ff}` | addr 0xffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xffffffff |
| t_const_type_unsigned_addr | `DW_OP_const_type T_ui {ff,ff,ff,ff}` | addr 0xffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xffffffff |
| t_regval_type | `DW_OP_regval_type 2 T_ui; DW_OP_convert 0` | addr 0xffffffff | error: Unhandled opcode DW_OP_regval_type in DWARFExpression | addr 0xffffffff |
| t_regval_type_signed | `DW_OP_regval_type 2 T_s; DW_OP_convert 0` | addr 0xffffffffffffffff | error: Unhandled opcode DW_OP_regval_type in DWARFExpression | addr 0xffffffffffffffff |
| t_deref_type | `DW_OP_addr dw_mem+8; DW_OP_deref_type 2 T_us; DW_OP_convert 0` | addr 0x5833 | error: Unhandled opcode DW_OP_deref_type in DWARFExpression | addr 0x5833 |
| t_deref_type_signed | `DW_OP_addr dw_mem+3; DW_OP_deref_type 1 T_sc; DW_OP_convert 0` | addr 0x7a | error: Unhandled opcode DW_OP_deref_type in DWARFExpression | addr 0x7a |
| t_typed_add_wrap | `DW_OP_const_type T_uc {ff}; DW_OP_const_type T_uc {02}; DW_OP_plus; DW_OP_convert 0` | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x1 |
| t_typed_mul_wrap | `DW_OP_const_type T_us {00,80}; DW_OP_const_type T_us {02,00}; DW_OP_mul; DW_OP_convert 0` | addr 0x0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x0 |
| t_typed_div_unsigned | `DW_OP_const_type T_uc {fe}; DW_OP_const_type T_uc {03}; DW_OP_div; DW_OP_convert 0` | addr 0x54 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x54 |
| t_typed_div_signed | `DW_OP_const_type T_sc {fe}; DW_OP_const_type T_sc {03}; DW_OP_div; DW_OP_convert 0` | addr 0x0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x0 |
| t_typed_mod_unsigned | `DW_OP_const_type T_uc {fe}; DW_OP_const_type T_uc {03}; DW_OP_mod; DW_OP_convert 0` | addr 0x2 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x2 |
| t_typed_mod_signed | `DW_OP_const_type T_sc {fe}; DW_OP_const_type T_sc {03}; DW_OP_mod; DW_OP_convert 0` | addr 0xfffffffffffffffe | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xfffffffffffffffe |
| t_typed_mod_signed_pos | `DW_OP_const_type T_sc {07}; DW_OP_const_type T_sc {fd}; DW_OP_mod; DW_OP_convert 0` | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x1 |
| t_typed_lt_unsigned | `DW_OP_const_type T_uc {fe}; DW_OP_const_type T_uc {03}; DW_OP_lt` | addr 0x0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x0 |
| t_typed_lt_signed | `DW_OP_const_type T_sc {fe}; DW_OP_const_type T_sc {03}; DW_OP_lt` | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x1 |
| t_typed_eq | `DW_OP_const_type T_i {ff,ff,ff,ff}; DW_OP_lit1; DW_OP_neg; DW_OP_convert T_i; DW_OP_eq` | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x1 |
| t_typed_shl | `DW_OP_const_type T_uc {81}; DW_OP_lit1; DW_OP_convert T_uc; DW_OP_shl; DW_OP_convert 0` | addr 0x2 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x2 |
| t_typed_shr | `DW_OP_const_type T_uc {80}; DW_OP_lit1; DW_OP_convert T_uc; DW_OP_shr; DW_OP_convert 0` | addr 0x40 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x40 |
| t_typed_shra | `DW_OP_const_type T_sc {80}; DW_OP_lit1; DW_OP_convert T_sc; DW_OP_shra; DW_OP_convert 0` | addr 0xffffffffffffffc0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xffffffffffffffc0 |
| t_typed_neg | `DW_OP_const_type T_uc {01}; DW_OP_neg; DW_OP_convert 0` | addr 0xff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xff |
| t_typed_abs_unsigned | `DW_OP_const_type T_uc {ff}; DW_OP_abs; DW_OP_convert 0` | addr 0xff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xff |
| t_typed_abs_signed | `DW_OP_const_type T_sc {ff}; DW_OP_abs; DW_OP_convert 0` | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x1 |
| t_typed_not | `DW_OP_const_type T_us {0f,00}; DW_OP_not; DW_OP_convert 0` | addr 0xfff0 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xfff0 |
| t_typed_plus_uconst | `DW_OP_const_type T_uc {ff}; DW_OP_plus_uconst 2; DW_OP_convert 0` | addr 0x101 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x1 |
| t_typed_plus_uconst_signed | `DW_OP_const_type T_sc {ff}; DW_OP_plus_uconst 2; DW_OP_convert 0` | addr 0x1 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0x1 |
| t_reinterpret | `DW_OP_const_type T_i {ff,ff,ff,ff}; DW_OP_reinterpret T_ui; DW_OP_convert 0` | addr 0xffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xffffffff |
| t_reinterpret_generic | `DW_OP_lit1; DW_OP_neg; DW_OP_reinterpret T_l; DW_OP_convert T_i; DW_OP_convert 0` | addr 0xffffffffffffffff | error: Unhandled opcode DW_OP_reinterpret in DWARFExpression | addr 0xffffffffffffffff |
| t_typed_stack_value_us | `DW_OP_const_type T_us {34,12}; DW_OP_stack_value` | value 0x1234 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | value 0x1234 |
| t_typed_stack_value_generic | `DW_OP_const_type T_us {34,12}; DW_OP_convert 0; DW_OP_stack_value` | value 0x1234 | error: Unhandled opcode DW_OP_const_type in DWARFExpression | value 0x1234 |
| t_typed_stack_value_s_neg | `DW_OP_const_type T_s {ff,ff}; DW_OP_stack_value` | value 0xffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | value 0xffff |
| t_typed_stack_value_uc | `DW_OP_const_type T_uc {ff}; DW_OP_stack_value` | value 0xff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | value 0xff |
| t_typed_stack_value_l | `DW_OP_const_type T_l {ff,ff,ff,ff,ff,ff,ff,ff}; DW_OP_stack_value` | value 0xffffffffffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | value 0xffffffffffffffff |
| t_typed_dup_swap | `DW_OP_const_type T_uc {05}; DW_OP_dup; DW_OP_plus; DW_OP_convert 0` | addr 0xa | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xa |
| t_typed_loclist@loclist | `DW_OP_const_type T_sc {ff}; DW_OP_convert 0` | addr 0xffffffffffffffff | error: Unhandled opcode DW_OP_const_type in DWARFExpression | addr 0xffffffffffffffff |

