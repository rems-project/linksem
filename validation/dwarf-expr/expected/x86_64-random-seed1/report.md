# Claude: DWARF expression cross-check report

Run directory: `/home/pes20/linksem/validation/dwarf-expr/output/x86_64-random-seed1`; evaluators: linksem, gdb, lldb.

Tools: as: GNU assembler (GNU Binutils for Ubuntu) 2.42; gdb: GNU gdb (Ubuntu 15.1-1ubuntu1~24.04.1) 15.1; lldb: lldb version 18.1.3.

## Summary

| class               | count |
|---------------------|-------|
| agree               |   958 |
| linksem-unsupported |     0 |
| linksem-differs     |     0 |
| gdb-differs         |     0 |
| lldb-differs        |    28 |
| all-differ          |     0 |
| gdb-crash           |    14 |
| incomparable        |     0 |
| not-run             |     0 |

gdb and lldb differ from each other on 41 expression(s) (see the last section).

## Operations involved in disagreements

- **lldb-differs**: DW_OP_neg (16), DW_OP_stack_value (15), DW_OP_abs (12), DW_OP_bregx (9), DW_OP_not (8), DW_OP_nop (8), DW_OP_dup (7), DW_OP_pick (6), DW_OP_skip (6), DW_OP_const2u (4), DW_OP_call_frame_cfa (4), DW_OP_addr (4), DW_OP_eq (4), DW_OP_plus_uconst (4), DW_OP_le (4), DW_OP_const2s (4), DW_OP_constu (3), DW_OP_lt (3), DW_OP_const1u (3), DW_OP_deref_size (3), DW_OP_shra (3), DW_OP_fbreg (3), DW_OP_over (3), DW_OP_gt (3), DW_OP_xor (2), DW_OP_const8u (2), DW_OP_const8s (2), DW_OP_minus (2), DW_OP_ge (2), DW_OP_bra (2), DW_OP_const1s (2), DW_OP_consts (2), DW_OP_breg6 (2), DW_OP_breg9 (1), DW_OP_ne (1), DW_OP_breg1 (1), DW_OP_lit20 (1), DW_OP_mul (1), DW_OP_const4u (1), DW_OP_breg2 (1), DW_OP_lit16 (1), DW_OP_rot (1), DW_OP_deref (1), DW_OP_lit17 (1), DW_OP_or (1), DW_OP_const4s (1)
- **gdb-crash**: DW_OP_bra (14), DW_OP_not (8), DW_OP_stack_value (8), DW_OP_neg (7), DW_OP_abs (6), DW_OP_constu (5), DW_OP_const8u (5), DW_OP_skip (4), DW_OP_const1u (4), DW_OP_const2s (4), DW_OP_nop (3), DW_OP_pick (3), DW_OP_const2u (2), DW_OP_const4u (2), DW_OP_const1s (2), DW_OP_plus_uconst (2), DW_OP_consts (2), DW_OP_drop (2), DW_OP_lit31 (1), DW_OP_lit2 (1), DW_OP_lit20 (1), DW_OP_lit27 (1), DW_OP_const8s (1), DW_OP_le (1)

## Disagreements

| name | class | expression | linksem | gdb | lldb |
|------|-------|------------|---------|-----|------|
| v26 | lldb-differs | `DW_OP_const2u 101; DW_OP_constu 16; DW_OP_neg; DW_OP_bregx 13 165; DW_OP_nop; DW_OP_neg; DW_OP_abs; DW_OP_not` | addr 0xffffffffffffff1a | addr 0xffffffffffffff1a | addr 0xe4 |
| v72 | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_dup; DW_OP_lt; DW_OP_stack_value` | value 0x0 | value 0x0 | error: extracting data from value failed |
| v86 | gdb-crash | `DW_OP_const2u 8; DW_OP_pick 0; DW_OP_bra 1; DW_OP_neg; DW_OP_nop; DW_OP_nop; DW_OP_skip 1; DW_OP_not` | addr 0x8 | error: gdb aborted | addr 0x8 |
| v105 | lldb-differs | `DW_OP_addr dw_mem+93; DW_OP_pick 0; DW_OP_not; DW_OP_const8u 0; DW_OP_xor; DW_OP_dup; DW_OP_eq; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v108 | lldb-differs | `DW_OP_breg9 202; DW_OP_neg; DW_OP_abs` | addr 0x1010101010101cb | addr 0x1010101010101cb | addr 0xfefefefefefefe35 |
| v115 | lldb-differs | `DW_OP_const1u 64; DW_OP_not; DW_OP_plus_uconst 3; DW_OP_const8s 3; DW_OP_abs; DW_OP_minus; DW_OP_abs; DW_OP_skip 1; DW_OP_abs; DW_OP_stack_value` | value 0x41 | value 0x41 | value 0xffffffffffffffbf |
| v123 | lldb-differs | `DW_OP_addr dw_mem+139; DW_OP_deref_size 4; DW_OP_neg; DW_OP_pick 0; DW_OP_shra; DW_OP_pick 0` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid file address |
| v126 | gdb-crash | `DW_OP_const1u 128; DW_OP_const2s -32271; DW_OP_neg; DW_OP_bra 1; DW_OP_neg; DW_OP_stack_value` | value 0x80 | error: gdb aborted | value 0x80 |
| v158 | lldb-differs | `DW_OP_bregx 6 -106; DW_OP_call_frame_cfa; DW_OP_ne; DW_OP_skip 1; DW_OP_neg; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v161 | gdb-crash | `DW_OP_const1s 74; DW_OP_pick 0; DW_OP_neg; DW_OP_const4u 67; DW_OP_bra 1; DW_OP_abs; DW_OP_abs` | addr 0x4a | error: gdb aborted | addr 0x4a |
| v182 | lldb-differs | `DW_OP_addr dw_mem+227; DW_OP_neg; DW_OP_abs; DW_OP_not; DW_OP_neg` | addr 0x4020e4 | addr 0x4020e4 | addr 0xffffffffffbfdf1e |
| v215 | lldb-differs | `DW_OP_bregx 13 198; DW_OP_skip 1; DW_OP_neg; DW_OP_pick 0; DW_OP_ge; DW_OP_plus_uconst 0x2d0a4974f0c04156; DW_OP_const8s 10; DW_OP_eq; DW_OP_stack_value` | value 0x0 | value 0x0 | error: extracting data from value failed |
| v216 | lldb-differs | `DW_OP_breg1 -78; DW_OP_plus_uconst 61` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| v250 | gdb-crash | `DW_OP_const2s 46; DW_OP_lit31; DW_OP_bra 1; DW_OP_neg; DW_OP_skip 1; DW_OP_abs; DW_OP_plus_uconst 8; DW_OP_stack_value` | value 0x36 | error: gdb aborted | value 0x36 |
| v273 | lldb-differs | `DW_OP_bregx 14 -182; DW_OP_abs; DW_OP_abs; DW_OP_not` | addr 0xffffffffffffff39 | addr 0xffffffffffffff39 | addr 0xc5 |
| v278 | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_dup; DW_OP_bra 1; DW_OP_abs; DW_OP_neg; DW_OP_abs` | addr 0x700000000010 | addr 0x700000000010 | addr 0xffff8ffffffffff0 |
| v337 | lldb-differs | `DW_OP_lit20; DW_OP_neg; DW_OP_bregx 15 -109; DW_OP_deref_size 8; DW_OP_not; DW_OP_ge; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v338 | gdb-crash | `DW_OP_constu 0x7e865386b7ba1939; DW_OP_abs; DW_OP_skip 1; DW_OP_not; DW_OP_const8u 9; DW_OP_bra 1; DW_OP_not; DW_OP_const1u 230` | addr 0xe6 | error: gdb aborted | addr 0xe6 |
| v397 | lldb-differs | `DW_OP_constu 32; DW_OP_const2s 0; DW_OP_skip 1; DW_OP_abs; DW_OP_dup; DW_OP_le; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v426 | lldb-differs | `DW_OP_const1u 216; DW_OP_bregx 5 -32; DW_OP_deref_size 8; DW_OP_lt; DW_OP_call_frame_cfa; DW_OP_neg; DW_OP_xor; DW_OP_pick 0; DW_OP_stack_value` | value 0xffff8ffffffffff0 | value 0xffff8ffffffffff0 | value 0xffff8ffffffffff1 |
| v466 | lldb-differs | `DW_OP_const1s 0; DW_OP_fbreg -137; DW_OP_skip 1; DW_OP_neg; DW_OP_abs; DW_OP_mul; DW_OP_not; DW_OP_nop` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| v515 | lldb-differs | `DW_OP_const4u 98; DW_OP_fbreg 173; DW_OP_lt; DW_OP_pick 0; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v524 | lldb-differs | `DW_OP_breg2 -255; DW_OP_nop; DW_OP_consts 149; DW_OP_over; DW_OP_shra; DW_OP_addr dw_mem+243; DW_OP_gt; DW_OP_stack_value` | value 0x0 | value 0x0 | error: extracting data from value failed |
| v553 | lldb-differs | `DW_OP_lit16; DW_OP_dup; DW_OP_const2u 8; DW_OP_over; DW_OP_rot; DW_OP_plus_uconst 201; DW_OP_const1u 15; DW_OP_gt; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v565 | gdb-crash | `DW_OP_lit2; DW_OP_const8u 244; DW_OP_consts 63; DW_OP_bra 1; DW_OP_not; DW_OP_lit20` | addr 0x14 | error: gdb aborted | addr 0x14 |
| v585 | gdb-crash | `DW_OP_constu 0x6e41f4c63bb797b; DW_OP_skip 1; DW_OP_not; DW_OP_pick 0; DW_OP_bra 1; DW_OP_not; DW_OP_stack_value` | value 0x6e41f4c63bb797b | error: gdb aborted | value 0x6e41f4c63bb797b |
| v644 | lldb-differs | `DW_OP_const2s 56; DW_OP_nop; DW_OP_not; DW_OP_const8u 0x7fffffff; DW_OP_le` | addr 0x1 | addr 0x1 | addr 0x0 |
| v710 | lldb-differs | `DW_OP_const2s 128; DW_OP_nop; DW_OP_bregx 15 -117; DW_OP_deref; DW_OP_dup; DW_OP_gt; DW_OP_stack_value` | value 0x0 | value 0x0 | error: extracting data from value failed |
| v752 | lldb-differs | `DW_OP_constu 33; DW_OP_neg; DW_OP_nop; DW_OP_abs` | addr 0x21 | addr 0x21 | addr 0xffffffffffffffdf |
| v780 | lldb-differs | `DW_OP_lit17; DW_OP_nop; DW_OP_const2u 15; DW_OP_eq; DW_OP_const2u 2; DW_OP_over; DW_OP_stack_value` | value 0x0 | value 0x0 | error: extracting data from value failed |
| v805 | gdb-crash | `DW_OP_const2u 33; DW_OP_const4u 83; DW_OP_bra 1; DW_OP_not; DW_OP_stack_value` | value 0x21 | error: gdb aborted | value 0x21 |
| v818 | lldb-differs | `DW_OP_const1s 31; DW_OP_breg6 -166; DW_OP_minus; DW_OP_abs; DW_OP_consts 66; DW_OP_neg; DW_OP_le` | addr 0x0 | addr 0x0 | addr 0x1 |
| v836 | gdb-crash | `DW_OP_const1s 24; DW_OP_consts 0x4583f5993fea922c; DW_OP_bra 1; DW_OP_not; DW_OP_stack_value` | value 0x18 | error: gdb aborted | value 0x18 |
| v849 | lldb-differs | `DW_OP_bregx 11 -19; DW_OP_breg6 128; DW_OP_pick 0; DW_OP_bra 1; DW_OP_neg; DW_OP_or; DW_OP_abs; DW_OP_stack_value` | value 0x13 | value 0x13 | value 0xffffffffffffffed |
| v878 | gdb-crash | `DW_OP_constu 0x43e54f9bb4d93fcc; DW_OP_plus_uconst 198; DW_OP_neg; DW_OP_abs; DW_OP_const1u 161; DW_OP_bra 1; DW_OP_neg; DW_OP_stack_value` | value 0x43e54f9bb4d94092 | error: gdb aborted | value 0xbc1ab0644b26bf6e |
| v914 | lldb-differs | `DW_OP_const4s 206; DW_OP_dup; DW_OP_eq; DW_OP_skip 1; DW_OP_neg; DW_OP_nop; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v933 | gdb-crash | `DW_OP_const8u 93; DW_OP_nop; DW_OP_const2s 255; DW_OP_bra 1; DW_OP_abs; DW_OP_drop; DW_OP_constu 55` | addr 0x37 | error: gdb aborted | addr 0x37 |
| v963 | gdb-crash | `DW_OP_const2s 0; DW_OP_lit27; DW_OP_bra 1; DW_OP_neg; DW_OP_stack_value` | value 0x0 | error: gdb aborted | value 0x0 |
| v965 | lldb-differs | `DW_OP_const2u 180; DW_OP_neg; DW_OP_fbreg -93; DW_OP_shra; DW_OP_abs; DW_OP_abs` | addr 0x1 | addr 0x1 | error: invalid load address |
| v971 | gdb-crash | `DW_OP_const8s 0x4d5610f38a7b8d66; DW_OP_nop; DW_OP_constu 227; DW_OP_bra 1; DW_OP_not; DW_OP_drop; DW_OP_const8u 0x8000000000000000` | addr 0x8000000000000000 | error: gdb aborted | addr 0x8000000000000000 |
| v990 | gdb-crash | `DW_OP_const8u 0xffffffffffffffff; DW_OP_const1u 194; DW_OP_abs; DW_OP_bra 1; DW_OP_not; DW_OP_neg; DW_OP_const1u 67; DW_OP_le; DW_OP_stack_value` | value 0x1 | error: gdb aborted | error: extracting data from value failed |
| v998 | lldb-differs | `DW_OP_const2s 68; DW_OP_bregx 15 -141; DW_OP_neg; DW_OP_le` | addr 0x0 | addr 0x0 | addr 0x1 |

## gdb versus lldb

| name | expression | gdb | lldb | linksem |
|------|------------|-----|------|---------|
| v26 | `DW_OP_const2u 101; DW_OP_constu 16; DW_OP_neg; DW_OP_bregx 13 165; DW_OP_nop; DW_OP_neg; DW_OP_abs; DW_OP_not` | addr 0xffffffffffffff1a | addr 0xe4 | addr 0xffffffffffffff1a |
| v72 | `DW_OP_call_frame_cfa; DW_OP_dup; DW_OP_lt; DW_OP_stack_value` | value 0x0 | error: extracting data from value failed | value 0x0 |
| v86 | `DW_OP_const2u 8; DW_OP_pick 0; DW_OP_bra 1; DW_OP_neg; DW_OP_nop; DW_OP_nop; DW_OP_skip 1; DW_OP_not` | error: gdb aborted | addr 0x8 | addr 0x8 |
| v105 | `DW_OP_addr dw_mem+93; DW_OP_pick 0; DW_OP_not; DW_OP_const8u 0; DW_OP_xor; DW_OP_dup; DW_OP_eq; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v108 | `DW_OP_breg9 202; DW_OP_neg; DW_OP_abs` | addr 0x1010101010101cb | addr 0xfefefefefefefe35 | addr 0x1010101010101cb |
| v115 | `DW_OP_const1u 64; DW_OP_not; DW_OP_plus_uconst 3; DW_OP_const8s 3; DW_OP_abs; DW_OP_minus; DW_OP_abs; DW_OP_skip 1; DW_OP_abs; DW_OP_stack_value` | value 0x41 | value 0xffffffffffffffbf | value 0x41 |
| v123 | `DW_OP_addr dw_mem+139; DW_OP_deref_size 4; DW_OP_neg; DW_OP_pick 0; DW_OP_shra; DW_OP_pick 0` | addr 0xffffffffffffffff | error: invalid file address | addr 0xffffffffffffffff |
| v126 | `DW_OP_const1u 128; DW_OP_const2s -32271; DW_OP_neg; DW_OP_bra 1; DW_OP_neg; DW_OP_stack_value` | error: gdb aborted | value 0x80 | value 0x80 |
| v158 | `DW_OP_bregx 6 -106; DW_OP_call_frame_cfa; DW_OP_ne; DW_OP_skip 1; DW_OP_neg; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v161 | `DW_OP_const1s 74; DW_OP_pick 0; DW_OP_neg; DW_OP_const4u 67; DW_OP_bra 1; DW_OP_abs; DW_OP_abs` | error: gdb aborted | addr 0x4a | addr 0x4a |
| v182 | `DW_OP_addr dw_mem+227; DW_OP_neg; DW_OP_abs; DW_OP_not; DW_OP_neg` | addr 0x4020e4 | addr 0xffffffffffbfdf1e | addr 0x4020e4 |
| v215 | `DW_OP_bregx 13 198; DW_OP_skip 1; DW_OP_neg; DW_OP_pick 0; DW_OP_ge; DW_OP_plus_uconst 0x2d0a4974f0c04156; DW_OP_const8s 10; DW_OP_eq; DW_OP_stack_value` | value 0x0 | error: extracting data from value failed | value 0x0 |
| v216 | `DW_OP_breg1 -78; DW_OP_plus_uconst 61` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| v250 | `DW_OP_const2s 46; DW_OP_lit31; DW_OP_bra 1; DW_OP_neg; DW_OP_skip 1; DW_OP_abs; DW_OP_plus_uconst 8; DW_OP_stack_value` | error: gdb aborted | value 0x36 | value 0x36 |
| v273 | `DW_OP_bregx 14 -182; DW_OP_abs; DW_OP_abs; DW_OP_not` | addr 0xffffffffffffff39 | addr 0xc5 | addr 0xffffffffffffff39 |
| v278 | `DW_OP_call_frame_cfa; DW_OP_dup; DW_OP_bra 1; DW_OP_abs; DW_OP_neg; DW_OP_abs` | addr 0x700000000010 | addr 0xffff8ffffffffff0 | addr 0x700000000010 |
| v337 | `DW_OP_lit20; DW_OP_neg; DW_OP_bregx 15 -109; DW_OP_deref_size 8; DW_OP_not; DW_OP_ge; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v338 | `DW_OP_constu 0x7e865386b7ba1939; DW_OP_abs; DW_OP_skip 1; DW_OP_not; DW_OP_const8u 9; DW_OP_bra 1; DW_OP_not; DW_OP_const1u 230` | error: gdb aborted | addr 0xe6 | addr 0xe6 |
| v397 | `DW_OP_constu 32; DW_OP_const2s 0; DW_OP_skip 1; DW_OP_abs; DW_OP_dup; DW_OP_le; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v426 | `DW_OP_const1u 216; DW_OP_bregx 5 -32; DW_OP_deref_size 8; DW_OP_lt; DW_OP_call_frame_cfa; DW_OP_neg; DW_OP_xor; DW_OP_pick 0; DW_OP_stack_value` | value 0xffff8ffffffffff0 | value 0xffff8ffffffffff1 | value 0xffff8ffffffffff0 |
| v466 | `DW_OP_const1s 0; DW_OP_fbreg -137; DW_OP_skip 1; DW_OP_neg; DW_OP_abs; DW_OP_mul; DW_OP_not; DW_OP_nop` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| v515 | `DW_OP_const4u 98; DW_OP_fbreg 173; DW_OP_lt; DW_OP_pick 0; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v524 | `DW_OP_breg2 -255; DW_OP_nop; DW_OP_consts 149; DW_OP_over; DW_OP_shra; DW_OP_addr dw_mem+243; DW_OP_gt; DW_OP_stack_value` | value 0x0 | error: extracting data from value failed | value 0x0 |
| v553 | `DW_OP_lit16; DW_OP_dup; DW_OP_const2u 8; DW_OP_over; DW_OP_rot; DW_OP_plus_uconst 201; DW_OP_const1u 15; DW_OP_gt; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v565 | `DW_OP_lit2; DW_OP_const8u 244; DW_OP_consts 63; DW_OP_bra 1; DW_OP_not; DW_OP_lit20` | error: gdb aborted | addr 0x14 | addr 0x14 |
| v585 | `DW_OP_constu 0x6e41f4c63bb797b; DW_OP_skip 1; DW_OP_not; DW_OP_pick 0; DW_OP_bra 1; DW_OP_not; DW_OP_stack_value` | error: gdb aborted | value 0x6e41f4c63bb797b | value 0x6e41f4c63bb797b |
| v644 | `DW_OP_const2s 56; DW_OP_nop; DW_OP_not; DW_OP_const8u 0x7fffffff; DW_OP_le` | addr 0x1 | addr 0x0 | addr 0x1 |
| v710 | `DW_OP_const2s 128; DW_OP_nop; DW_OP_bregx 15 -117; DW_OP_deref; DW_OP_dup; DW_OP_gt; DW_OP_stack_value` | value 0x0 | error: extracting data from value failed | value 0x0 |
| v752 | `DW_OP_constu 33; DW_OP_neg; DW_OP_nop; DW_OP_abs` | addr 0x21 | addr 0xffffffffffffffdf | addr 0x21 |
| v780 | `DW_OP_lit17; DW_OP_nop; DW_OP_const2u 15; DW_OP_eq; DW_OP_const2u 2; DW_OP_over; DW_OP_stack_value` | value 0x0 | error: extracting data from value failed | value 0x0 |
| v805 | `DW_OP_const2u 33; DW_OP_const4u 83; DW_OP_bra 1; DW_OP_not; DW_OP_stack_value` | error: gdb aborted | value 0x21 | value 0x21 |
| v818 | `DW_OP_const1s 31; DW_OP_breg6 -166; DW_OP_minus; DW_OP_abs; DW_OP_consts 66; DW_OP_neg; DW_OP_le` | addr 0x0 | addr 0x1 | addr 0x0 |
| v836 | `DW_OP_const1s 24; DW_OP_consts 0x4583f5993fea922c; DW_OP_bra 1; DW_OP_not; DW_OP_stack_value` | error: gdb aborted | value 0x18 | value 0x18 |
| v849 | `DW_OP_bregx 11 -19; DW_OP_breg6 128; DW_OP_pick 0; DW_OP_bra 1; DW_OP_neg; DW_OP_or; DW_OP_abs; DW_OP_stack_value` | value 0x13 | value 0xffffffffffffffed | value 0x13 |
| v878 | `DW_OP_constu 0x43e54f9bb4d93fcc; DW_OP_plus_uconst 198; DW_OP_neg; DW_OP_abs; DW_OP_const1u 161; DW_OP_bra 1; DW_OP_neg; DW_OP_stack_value` | error: gdb aborted | value 0xbc1ab0644b26bf6e | value 0x43e54f9bb4d94092 |
| v914 | `DW_OP_const4s 206; DW_OP_dup; DW_OP_eq; DW_OP_skip 1; DW_OP_neg; DW_OP_nop; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v933 | `DW_OP_const8u 93; DW_OP_nop; DW_OP_const2s 255; DW_OP_bra 1; DW_OP_abs; DW_OP_drop; DW_OP_constu 55` | error: gdb aborted | addr 0x37 | addr 0x37 |
| v963 | `DW_OP_const2s 0; DW_OP_lit27; DW_OP_bra 1; DW_OP_neg; DW_OP_stack_value` | error: gdb aborted | value 0x0 | value 0x0 |
| v965 | `DW_OP_const2u 180; DW_OP_neg; DW_OP_fbreg -93; DW_OP_shra; DW_OP_abs; DW_OP_abs` | addr 0x1 | error: invalid load address | addr 0x1 |
| v971 | `DW_OP_const8s 0x4d5610f38a7b8d66; DW_OP_nop; DW_OP_constu 227; DW_OP_bra 1; DW_OP_not; DW_OP_drop; DW_OP_const8u 0x8000000000000000` | error: gdb aborted | addr 0x8000000000000000 | addr 0x8000000000000000 |
| v998 | `DW_OP_const2s 68; DW_OP_bregx 15 -141; DW_OP_neg; DW_OP_le` | addr 0x0 | addr 0x1 | addr 0x0 |

