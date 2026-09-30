# Claude: DWARF expression cross-check report

Run directory: `/home/pes20/linksem/validation/test-dwarf-expr/output/aarch64-random-frames-seed1`; evaluators: linksem, gdb, lldb.

Tools: aarch64-linux-gnu-as: GNU assembler (GNU Binutils for Ubuntu) 2.42; gdb-multiarch: GNU gdb (Ubuntu 15.1-1ubuntu1~24.04.1) 15.1; lldb: lldb version 18.1.3; qemu-aarch64: qemu-aarch64 version 8.2.2 (Debian 1:8.2.2+ds-0ubuntu1.18).

## Summary

| class               | count |
|---------------------|-------|
| agree               |   922 |
| linksem-unsupported |     0 |
| linksem-differs     |     0 |
| gdb-differs         |     0 |
| lldb-differs        |    70 |
| all-differ          |     0 |
| gdb-crash           |     8 |
| incomparable        |     0 |
| not-run             |     0 |

gdb and lldb differ from each other on 77 expression(s) (see the last section).

## Operations involved in disagreements

- **lldb-differs**: DW_OP_call_frame_cfa (45), DW_OP_stack_value (28), DW_OP_neg (27), DW_OP_abs (21), DW_OP_not (20), DW_OP_pick (16), DW_OP_bregx (12), DW_OP_nop (12), DW_OP_plus_uconst (12), DW_OP_skip (11), DW_OP_addr (11), DW_OP_const1u (11), DW_OP_dup (10), DW_OP_const2s (9), DW_OP_const1s (7), DW_OP_const2u (6), DW_OP_consts (6), DW_OP_drop (6), DW_OP_bra (6), DW_OP_constu (5), DW_OP_deref_size (5), DW_OP_fbreg (5), DW_OP_over (5), DW_OP_eq (4), DW_OP_or (4), DW_OP_le (4), DW_OP_lt (3), DW_OP_xor (3), DW_OP_const8u (3), DW_OP_shra (3), DW_OP_rot (3), DW_OP_ge (3), DW_OP_mul (3), DW_OP_const4u (3), DW_OP_gt (3), DW_OP_minus (2), DW_OP_const8s (2), DW_OP_plus (2), DW_OP_lit10 (2), DW_OP_deref (2), DW_OP_breg29 (2), DW_OP_lit12 (1), DW_OP_breg9 (1), DW_OP_ne (1), DW_OP_breg1 (1), DW_OP_swap (1), DW_OP_lit20 (1), DW_OP_breg2 (1), DW_OP_lit16 (1), DW_OP_shl (1), DW_OP_breg3 (1), DW_OP_lit17 (1), DW_OP_breg11 (1), DW_OP_breg10 (1), DW_OP_const4s (1)
- **gdb-crash**: DW_OP_bra (8), DW_OP_not (6), DW_OP_abs (4), DW_OP_stack_value (4), DW_OP_const8u (4), DW_OP_neg (3), DW_OP_const4u (2), DW_OP_const1s (2), DW_OP_skip (2), DW_OP_const1u (2), DW_OP_constu (2), DW_OP_consts (2), DW_OP_pick (1), DW_OP_plus_uconst (1), DW_OP_const2s (1), DW_OP_lit31 (1), DW_OP_lit20 (1), DW_OP_lit2 (1), DW_OP_const2u (1), DW_OP_nop (1), DW_OP_drop (1), DW_OP_const8s (1), DW_OP_le (1)

## Disagreements

| name | class | expression | linksem | gdb | lldb |
|------|-------|------------|---------|-----|------|
| v2@fb=expr | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_neg; DW_OP_call_frame_cfa; DW_OP_stack_value` | value 0x700000000010 | value 0x700000000010 | value 0x4000007ffd80 |
| v26 | lldb-differs | `DW_OP_const2u 101; DW_OP_constu 16; DW_OP_neg; DW_OP_bregx 13 165; DW_OP_nop; DW_OP_neg; DW_OP_abs; DW_OP_not` | addr 0xffffffffffffff1a | addr 0xffffffffffffff1a | addr 0xe4 |
| v27@loclist@fb=breg | lldb-differs | `DW_OP_consts 2; DW_OP_abs; DW_OP_skip 1; DW_OP_neg; DW_OP_nop; DW_OP_call_frame_cfa; DW_OP_stack_value` | value 0x700000000010 | value 0x700000000010 | value 0x4000007ffd80 |
| v42@fb=loclist | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_dup; DW_OP_skip 1; DW_OP_not` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v72@loclist@fb=loclist | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_dup; DW_OP_lt; DW_OP_stack_value` | value 0x0 | value 0x0 | error: extracting data from value failed |
| v105@loclist | lldb-differs | `DW_OP_addr dw_mem+93; DW_OP_pick 0; DW_OP_not; DW_OP_const8u 0; DW_OP_xor; DW_OP_dup; DW_OP_eq; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v106@fb=expr | lldb-differs | `DW_OP_lit12; DW_OP_drop; DW_OP_call_frame_cfa; DW_OP_nop; DW_OP_addr dw_mem+39; DW_OP_drop; DW_OP_stack_value` | value 0x700000000010 | value 0x700000000010 | value 0x4000007ffd80 |
| v108 | lldb-differs | `DW_OP_breg9 202; DW_OP_neg; DW_OP_abs` | addr 0x1010101010101cb | addr 0x1010101010101cb | addr 0xfefefefefefefe35 |
| v115@fb=breg | lldb-differs | `DW_OP_const1u 64; DW_OP_not; DW_OP_plus_uconst 3; DW_OP_const8s 3; DW_OP_abs; DW_OP_minus; DW_OP_abs; DW_OP_skip 1; DW_OP_abs; DW_OP_stack_value` | value 0x41 | value 0x41 | value 0xffffffffffffffbf |
| v120@fb=breg | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_pick 0; DW_OP_not; DW_OP_plus_uconst 234; DW_OP_call_frame_cfa; DW_OP_or` | addr 0xfffff000000000d9 | addr 0xfffff000000000d9 | addr 0xffffffffffffffe9 |
| v123@loclist | lldb-differs | `DW_OP_addr dw_mem+139; DW_OP_deref_size 4; DW_OP_neg; DW_OP_pick 0; DW_OP_shra; DW_OP_pick 0` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid file address |
| v156@fb=loclist | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_neg; DW_OP_pick 0; DW_OP_dup; DW_OP_bra 1; DW_OP_not; DW_OP_addr dw_mem+89; DW_OP_rot; DW_OP_stack_value` | value 0xffff8ffffffffff0 | value 0xffff8ffffffffff0 | value 0xffffbfffff800280 |
| v158@fb=breg | lldb-differs | `DW_OP_bregx 29 -106; DW_OP_call_frame_cfa; DW_OP_ne; DW_OP_skip 1; DW_OP_neg; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v161 | gdb-crash | `DW_OP_const1s 74; DW_OP_pick 0; DW_OP_neg; DW_OP_const4u 67; DW_OP_bra 1; DW_OP_abs; DW_OP_abs` | addr 0x4a | error: gdb aborted | addr 0x4a |
| v182@loclist@fb=loclist | lldb-differs | `DW_OP_addr dw_mem+227; DW_OP_neg; DW_OP_abs; DW_OP_not; DW_OP_neg` | addr 0x4110e4 | addr 0x4110e4 | addr 0xffffffffffbeef1e |
| v189@fb=reg | lldb-differs | `DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v195@fb=expr | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_pick 0; DW_OP_const1u 15; DW_OP_plus` | addr 0x70000000001f | addr 0x70000000001f | addr 0x4000007ffd8f |
| v215@loclist@fb=loclist | lldb-differs | `DW_OP_bregx 13 198; DW_OP_skip 1; DW_OP_neg; DW_OP_pick 0; DW_OP_ge; DW_OP_plus_uconst 0x2d0a4974f0c04156; DW_OP_const8s 10; DW_OP_eq; DW_OP_stack_value` | value 0x0 | value 0x0 | error: extracting data from value failed |
| v216@fb=loclist | lldb-differs | `DW_OP_breg1 -78; DW_OP_plus_uconst 61` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| v218@fb=expr | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_neg` | addr 0xffff8ffffffffff0 | addr 0xffff8ffffffffff0 | addr 0xffffbfffff800280 |
| v226@fb=expr | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_neg` | addr 0xffff8ffffffffff0 | addr 0xffff8ffffffffff0 | addr 0xffffbfffff800280 |
| v229@fb=expr | lldb-differs | `DW_OP_const1u 84; DW_OP_pick 0; DW_OP_ge; DW_OP_drop; DW_OP_const1s 121; DW_OP_drop; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v250@fb=loclist | gdb-crash | `DW_OP_const2s 46; DW_OP_lit31; DW_OP_bra 1; DW_OP_neg; DW_OP_skip 1; DW_OP_abs; DW_OP_plus_uconst 8; DW_OP_stack_value` | value 0x36 | error: gdb aborted | value 0x36 |
| v269@fb=breg | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_lit10; DW_OP_swap` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v273@loclist@fb=loclist | lldb-differs | `DW_OP_bregx 14 -182; DW_OP_abs; DW_OP_abs; DW_OP_not` | addr 0xffffffffffffff39 | addr 0xffffffffffffff39 | addr 0xc5 |
| v278@loclist-base@fb=reg | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_dup; DW_OP_bra 1; DW_OP_abs; DW_OP_neg; DW_OP_abs` | addr 0x700000000010 | addr 0x700000000010 | addr 0xffffbfffff800280 |
| v337@loclist | lldb-differs | `DW_OP_lit20; DW_OP_neg; DW_OP_bregx 15 -109; DW_OP_deref_size 8; DW_OP_not; DW_OP_ge; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v338@fb=reg | gdb-crash | `DW_OP_constu 0x7e865386b7ba1939; DW_OP_abs; DW_OP_skip 1; DW_OP_not; DW_OP_const8u 9; DW_OP_bra 1; DW_OP_not; DW_OP_const1u 230` | addr 0xe6 | error: gdb aborted | addr 0xe6 |
| v364@fb=breg | lldb-differs | `DW_OP_const2u 15; DW_OP_drop; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v379@loclist@fb=reg | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_plus_uconst 128; DW_OP_call_frame_cfa; DW_OP_not; DW_OP_bra 1; DW_OP_abs` | addr 0x700000000090 | addr 0x700000000090 | addr 0x4000007ffe00 |
| v385@fb=reg | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_consts 64; DW_OP_bra 1; DW_OP_abs; DW_OP_stack_value` | value 0x700000000010 | value 0x700000000010 | value 0x4000007ffd80 |
| v397@fb=reg | lldb-differs | `DW_OP_constu 32; DW_OP_const2s 0; DW_OP_skip 1; DW_OP_abs; DW_OP_dup; DW_OP_le; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v419@fb=loclist | lldb-differs | `DW_OP_const2s 3; DW_OP_drop; DW_OP_addr dw_mem+202; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v426@fb=reg | lldb-differs | `DW_OP_const1u 216; DW_OP_bregx 5 -32; DW_OP_deref_size 8; DW_OP_lt; DW_OP_call_frame_cfa; DW_OP_neg; DW_OP_xor; DW_OP_pick 0; DW_OP_stack_value` | value 0xffff8ffffffffff0 | value 0xffff8ffffffffff0 | value 0xffffbfffff800281 |
| v428@loclist@fb=expr | lldb-differs | `DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v460@fb=breg | lldb-differs | `DW_OP_const1u 15; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v466@fb=expr | lldb-differs | `DW_OP_const1s 0; DW_OP_fbreg -137; DW_OP_skip 1; DW_OP_neg; DW_OP_abs; DW_OP_mul; DW_OP_not; DW_OP_nop` | addr 0xffffffffffffffff | addr 0xffffffffffffffff | error: invalid load address |
| v474@loclist-base@fb=loclist | lldb-differs | `DW_OP_const1u 255; DW_OP_const8u 0x1ce551c6453d057c; DW_OP_lit10; DW_OP_consts 211; DW_OP_pick 1; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v498@fb=reg | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_stack_value` | value 0x700000000010 | value 0x700000000010 | value 0x4000007ffd80 |
| v506@fb=expr | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_not; DW_OP_pick 0` | addr 0xffff8fffffffffef | addr 0xffff8fffffffffef | addr 0xffffbfffff80027f |
| v509@fb=expr | lldb-differs | `DW_OP_bregx 14 -172; DW_OP_const2s 11; DW_OP_const1s 85; DW_OP_call_frame_cfa; DW_OP_mul; DW_OP_abs; DW_OP_not` | addr 0xffdacffffffffaaf | addr 0xffdacffffffffaaf | addr 0xffeabfffd580d47f |
| v515@loclist@fb=reg | lldb-differs | `DW_OP_const4u 98; DW_OP_fbreg 173; DW_OP_lt; DW_OP_pick 0; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v524@fb=expr | lldb-differs | `DW_OP_breg2 -255; DW_OP_nop; DW_OP_consts 149; DW_OP_over; DW_OP_shra; DW_OP_addr dw_mem+243; DW_OP_gt; DW_OP_stack_value` | value 0x0 | value 0x0 | error: extracting data from value failed |
| v549@loclist@fb=reg | lldb-differs | `DW_OP_addr dw_mem+144; DW_OP_deref_size 2; DW_OP_const2s 3; DW_OP_plus_uconst 63; DW_OP_const2s 13; DW_OP_abs; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v550@fb=breg | lldb-differs | `DW_OP_fbreg 249; DW_OP_addr dw_mem+191; DW_OP_deref_size 4; DW_OP_addr dw_mem+218; DW_OP_call_frame_cfa; DW_OP_constu 3; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v553@fb=expr | lldb-differs | `DW_OP_lit16; DW_OP_dup; DW_OP_const2u 8; DW_OP_over; DW_OP_rot; DW_OP_plus_uconst 201; DW_OP_const1u 15; DW_OP_gt; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v565@fb=breg | gdb-crash | `DW_OP_lit2; DW_OP_const8u 244; DW_OP_consts 63; DW_OP_bra 1; DW_OP_not; DW_OP_lit20` | addr 0x14 | error: gdb aborted | addr 0x14 |
| v626@fb=reg | lldb-differs | `DW_OP_addr dw_mem+84; DW_OP_call_frame_cfa; DW_OP_stack_value` | value 0x700000000010 | value 0x700000000010 | value 0x4000007ffd80 |
| v644@fb=expr | lldb-differs | `DW_OP_const2s 56; DW_OP_nop; DW_OP_not; DW_OP_const8u 0x7fffffff; DW_OP_le` | addr 0x1 | addr 0x1 | addr 0x0 |
| v654@fb=breg | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_not` | addr 0xffff8fffffffffef | addr 0xffff8fffffffffef | addr 0xffffbfffff80027f |
| v663@fb=breg | lldb-differs | `DW_OP_const1s -22; DW_OP_abs; DW_OP_call_frame_cfa; DW_OP_mul; DW_OP_skip 1; DW_OP_neg; DW_OP_not` | addr 0xfff65ffffffffe9f | addr 0xfff65ffffffffe9f | addr 0xfffa7ffff50036ff |
| v677@fb=expr | lldb-differs | `DW_OP_addr dw_mem+124; DW_OP_deref; DW_OP_neg; DW_OP_not; DW_OP_not; DW_OP_const1u 203; DW_OP_bregx 1 188; DW_OP_call_frame_cfa; DW_OP_stack_value` | value 0x700000000010 | value 0x700000000010 | value 0x4000007ffd80 |
| v690@loclist@fb=expr | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_skip 1; DW_OP_not` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v694@fb=expr | lldb-differs | `DW_OP_const1s -1; DW_OP_plus_uconst 48; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v710@loclist@fb=expr | lldb-differs | `DW_OP_const2s 128; DW_OP_nop; DW_OP_bregx 15 -117; DW_OP_deref; DW_OP_dup; DW_OP_gt; DW_OP_stack_value` | value 0x0 | value 0x0 | error: extracting data from value failed |
| v745@loclist@fb=expr | lldb-differs | `DW_OP_const1s 115; DW_OP_call_frame_cfa; DW_OP_or; DW_OP_skip 1; DW_OP_abs` | addr 0x700000000073 | addr 0x700000000073 | addr 0x4000007ffdf3 |
| v752@loclist@fb=loclist | lldb-differs | `DW_OP_constu 33; DW_OP_neg; DW_OP_nop; DW_OP_abs` | addr 0x21 | addr 0x21 | addr 0xffffffffffffffdf |
| v758@fb=expr | lldb-differs | `DW_OP_const4u 0xe1d6d700; DW_OP_breg3 194; DW_OP_shl; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v763@fb=loclist | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_const4u 3; DW_OP_pick 1; DW_OP_plus_uconst 0; DW_OP_xor; DW_OP_nop; DW_OP_bregx 13 -32; DW_OP_over` | addr 0x700000000013 | addr 0x700000000013 | addr 0x4000007ffd83 |
| v780@loclist-base@fb=reg | lldb-differs | `DW_OP_lit17; DW_OP_nop; DW_OP_const2u 15; DW_OP_eq; DW_OP_const2u 2; DW_OP_over; DW_OP_stack_value` | value 0x0 | value 0x0 | error: extracting data from value failed |
| v805@fb=breg | gdb-crash | `DW_OP_const2u 33; DW_OP_const4u 83; DW_OP_bra 1; DW_OP_not; DW_OP_stack_value` | value 0x21 | error: gdb aborted | value 0x21 |
| v810@fb=reg | lldb-differs | `DW_OP_breg11 -27; DW_OP_abs; DW_OP_const2s 0x5e83; DW_OP_nop; DW_OP_over; DW_OP_not; DW_OP_call_frame_cfa; DW_OP_stack_value` | value 0x700000000010 | value 0x700000000010 | value 0x4000007ffd80 |
| v818@fb=breg | lldb-differs | `DW_OP_const1s 31; DW_OP_breg29 -166; DW_OP_minus; DW_OP_abs; DW_OP_consts 66; DW_OP_neg; DW_OP_le` | addr 0x0 | addr 0x0 | addr 0x1 |
| v836 | gdb-crash | `DW_OP_const1s 24; DW_OP_consts 0x4583f5993fea922c; DW_OP_bra 1; DW_OP_not; DW_OP_stack_value` | value 0x18 | error: gdb aborted | value 0x18 |
| v849@fb=breg | lldb-differs | `DW_OP_bregx 11 -19; DW_OP_breg29 128; DW_OP_pick 0; DW_OP_bra 1; DW_OP_neg; DW_OP_or; DW_OP_abs; DW_OP_stack_value` | value 0x13 | value 0x13 | value 0xffffffffffffffed |
| v859@loclist@fb=loclist | lldb-differs | `DW_OP_fbreg -191; DW_OP_consts 0x37d17c0a8dc2d16f; DW_OP_plus; DW_OP_neg; DW_OP_pick 0; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v878@loclist | lldb-differs | `DW_OP_constu 0x43e54f9bb4d93fcc; DW_OP_plus_uconst 198; DW_OP_neg; DW_OP_abs; DW_OP_const1u 161; DW_OP_bra 1; DW_OP_neg; DW_OP_stack_value` | value 0x43e54f9bb4d94092 | value 0x43e54f9bb4d94092 | value 0xbc1ab0644b26bf6e |
| v884@loclist@fb=loclist | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_dup` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v897@loclist@fb=breg | lldb-differs | `DW_OP_const2u 0xd54b; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v912@fb=reg | lldb-differs | `DW_OP_breg10 -76; DW_OP_drop; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x700000000010 | addr 0x4000007ffd80 |
| v914@loclist@fb=breg | lldb-differs | `DW_OP_const4s 206; DW_OP_dup; DW_OP_eq; DW_OP_skip 1; DW_OP_neg; DW_OP_nop; DW_OP_stack_value` | value 0x1 | value 0x1 | error: extracting data from value failed |
| v921@loclist@fb=breg | lldb-differs | `DW_OP_const1u 207; DW_OP_const2s 0x5ebd; DW_OP_call_frame_cfa; DW_OP_or; DW_OP_not; DW_OP_pick 0; DW_OP_neg; DW_OP_stack_value` | value 0x700000005ebe | value 0x700000005ebe | value 0x4000007fffbe |
| v965@fb=loclist | lldb-differs | `DW_OP_const2u 180; DW_OP_neg; DW_OP_fbreg -93; DW_OP_shra; DW_OP_abs; DW_OP_abs` | addr 0x1 | addr 0x1 | error: invalid load address |
| v968@loclist@fb=loclist | lldb-differs | `DW_OP_call_frame_cfa; DW_OP_plus_uconst 221; DW_OP_stack_value` | value 0x7000000000ed | value 0x7000000000ed | value 0x4000007ffe5d |
| v971@fb=loclist | gdb-crash | `DW_OP_const8s 0x4d5610f38a7b8d66; DW_OP_nop; DW_OP_constu 227; DW_OP_bra 1; DW_OP_not; DW_OP_drop; DW_OP_const8u 0x8000000000000000` | addr 0x8000000000000000 | error: gdb aborted | addr 0x8000000000000000 |
| v990@fb=expr | gdb-crash | `DW_OP_const8u 0xffffffffffffffff; DW_OP_const1u 194; DW_OP_abs; DW_OP_bra 1; DW_OP_not; DW_OP_neg; DW_OP_const1u 67; DW_OP_le; DW_OP_stack_value` | value 0x1 | error: gdb aborted | error: extracting data from value failed |
| v993@fb=breg | lldb-differs | `DW_OP_const1u 211; DW_OP_pick 0; DW_OP_drop; DW_OP_neg; DW_OP_call_frame_cfa; DW_OP_pick 1; DW_OP_plus_uconst 16; DW_OP_rot; DW_OP_stack_value` | value 0x700000000010 | value 0x700000000010 | value 0x4000007ffd80 |
| v998@loclist | lldb-differs | `DW_OP_const2s 68; DW_OP_bregx 15 -141; DW_OP_neg; DW_OP_le` | addr 0x0 | addr 0x0 | addr 0x1 |

## gdb versus lldb

| name | expression | gdb | lldb | linksem |
|------|------------|-----|------|---------|
| v2@fb=expr | `DW_OP_call_frame_cfa; DW_OP_neg; DW_OP_call_frame_cfa; DW_OP_stack_value` | value 0x700000000010 | value 0x4000007ffd80 | value 0x700000000010 |
| v26 | `DW_OP_const2u 101; DW_OP_constu 16; DW_OP_neg; DW_OP_bregx 13 165; DW_OP_nop; DW_OP_neg; DW_OP_abs; DW_OP_not` | addr 0xffffffffffffff1a | addr 0xe4 | addr 0xffffffffffffff1a |
| v27@loclist@fb=breg | `DW_OP_consts 2; DW_OP_abs; DW_OP_skip 1; DW_OP_neg; DW_OP_nop; DW_OP_call_frame_cfa; DW_OP_stack_value` | value 0x700000000010 | value 0x4000007ffd80 | value 0x700000000010 |
| v42@fb=loclist | `DW_OP_call_frame_cfa; DW_OP_dup; DW_OP_skip 1; DW_OP_not` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v72@loclist@fb=loclist | `DW_OP_call_frame_cfa; DW_OP_dup; DW_OP_lt; DW_OP_stack_value` | value 0x0 | error: extracting data from value failed | value 0x0 |
| v105@loclist | `DW_OP_addr dw_mem+93; DW_OP_pick 0; DW_OP_not; DW_OP_const8u 0; DW_OP_xor; DW_OP_dup; DW_OP_eq; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v106@fb=expr | `DW_OP_lit12; DW_OP_drop; DW_OP_call_frame_cfa; DW_OP_nop; DW_OP_addr dw_mem+39; DW_OP_drop; DW_OP_stack_value` | value 0x700000000010 | value 0x4000007ffd80 | value 0x700000000010 |
| v108 | `DW_OP_breg9 202; DW_OP_neg; DW_OP_abs` | addr 0x1010101010101cb | addr 0xfefefefefefefe35 | addr 0x1010101010101cb |
| v115@fb=breg | `DW_OP_const1u 64; DW_OP_not; DW_OP_plus_uconst 3; DW_OP_const8s 3; DW_OP_abs; DW_OP_minus; DW_OP_abs; DW_OP_skip 1; DW_OP_abs; DW_OP_stack_value` | value 0x41 | value 0xffffffffffffffbf | value 0x41 |
| v120@fb=breg | `DW_OP_call_frame_cfa; DW_OP_pick 0; DW_OP_not; DW_OP_plus_uconst 234; DW_OP_call_frame_cfa; DW_OP_or` | addr 0xfffff000000000d9 | addr 0xffffffffffffffe9 | addr 0xfffff000000000d9 |
| v123@loclist | `DW_OP_addr dw_mem+139; DW_OP_deref_size 4; DW_OP_neg; DW_OP_pick 0; DW_OP_shra; DW_OP_pick 0` | addr 0xffffffffffffffff | error: invalid file address | addr 0xffffffffffffffff |
| v156@fb=loclist | `DW_OP_call_frame_cfa; DW_OP_neg; DW_OP_pick 0; DW_OP_dup; DW_OP_bra 1; DW_OP_not; DW_OP_addr dw_mem+89; DW_OP_rot; DW_OP_stack_value` | value 0xffff8ffffffffff0 | value 0xffffbfffff800280 | value 0xffff8ffffffffff0 |
| v158@fb=breg | `DW_OP_bregx 29 -106; DW_OP_call_frame_cfa; DW_OP_ne; DW_OP_skip 1; DW_OP_neg; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v161 | `DW_OP_const1s 74; DW_OP_pick 0; DW_OP_neg; DW_OP_const4u 67; DW_OP_bra 1; DW_OP_abs; DW_OP_abs` | error: gdb aborted | addr 0x4a | addr 0x4a |
| v182@loclist@fb=loclist | `DW_OP_addr dw_mem+227; DW_OP_neg; DW_OP_abs; DW_OP_not; DW_OP_neg` | addr 0x4110e4 | addr 0xffffffffffbeef1e | addr 0x4110e4 |
| v189@fb=reg | `DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v195@fb=expr | `DW_OP_call_frame_cfa; DW_OP_pick 0; DW_OP_const1u 15; DW_OP_plus` | addr 0x70000000001f | addr 0x4000007ffd8f | addr 0x70000000001f |
| v215@loclist@fb=loclist | `DW_OP_bregx 13 198; DW_OP_skip 1; DW_OP_neg; DW_OP_pick 0; DW_OP_ge; DW_OP_plus_uconst 0x2d0a4974f0c04156; DW_OP_const8s 10; DW_OP_eq; DW_OP_stack_value` | value 0x0 | error: extracting data from value failed | value 0x0 |
| v216@fb=loclist | `DW_OP_breg1 -78; DW_OP_plus_uconst 61` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| v218@fb=expr | `DW_OP_call_frame_cfa; DW_OP_neg` | addr 0xffff8ffffffffff0 | addr 0xffffbfffff800280 | addr 0xffff8ffffffffff0 |
| v226@fb=expr | `DW_OP_call_frame_cfa; DW_OP_neg` | addr 0xffff8ffffffffff0 | addr 0xffffbfffff800280 | addr 0xffff8ffffffffff0 |
| v229@fb=expr | `DW_OP_const1u 84; DW_OP_pick 0; DW_OP_ge; DW_OP_drop; DW_OP_const1s 121; DW_OP_drop; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v250@fb=loclist | `DW_OP_const2s 46; DW_OP_lit31; DW_OP_bra 1; DW_OP_neg; DW_OP_skip 1; DW_OP_abs; DW_OP_plus_uconst 8; DW_OP_stack_value` | error: gdb aborted | value 0x36 | value 0x36 |
| v269@fb=breg | `DW_OP_call_frame_cfa; DW_OP_lit10; DW_OP_swap` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v273@loclist@fb=loclist | `DW_OP_bregx 14 -182; DW_OP_abs; DW_OP_abs; DW_OP_not` | addr 0xffffffffffffff39 | addr 0xc5 | addr 0xffffffffffffff39 |
| v278@loclist-base@fb=reg | `DW_OP_call_frame_cfa; DW_OP_dup; DW_OP_bra 1; DW_OP_abs; DW_OP_neg; DW_OP_abs` | addr 0x700000000010 | addr 0xffffbfffff800280 | addr 0x700000000010 |
| v337@loclist | `DW_OP_lit20; DW_OP_neg; DW_OP_bregx 15 -109; DW_OP_deref_size 8; DW_OP_not; DW_OP_ge; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v338@fb=reg | `DW_OP_constu 0x7e865386b7ba1939; DW_OP_abs; DW_OP_skip 1; DW_OP_not; DW_OP_const8u 9; DW_OP_bra 1; DW_OP_not; DW_OP_const1u 230` | error: gdb aborted | addr 0xe6 | addr 0xe6 |
| v364@fb=breg | `DW_OP_const2u 15; DW_OP_drop; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v379@loclist@fb=reg | `DW_OP_call_frame_cfa; DW_OP_plus_uconst 128; DW_OP_call_frame_cfa; DW_OP_not; DW_OP_bra 1; DW_OP_abs` | addr 0x700000000090 | addr 0x4000007ffe00 | addr 0x700000000090 |
| v385@fb=reg | `DW_OP_call_frame_cfa; DW_OP_consts 64; DW_OP_bra 1; DW_OP_abs; DW_OP_stack_value` | value 0x700000000010 | value 0x4000007ffd80 | value 0x700000000010 |
| v397@fb=reg | `DW_OP_constu 32; DW_OP_const2s 0; DW_OP_skip 1; DW_OP_abs; DW_OP_dup; DW_OP_le; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v419@fb=loclist | `DW_OP_const2s 3; DW_OP_drop; DW_OP_addr dw_mem+202; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v426@fb=reg | `DW_OP_const1u 216; DW_OP_bregx 5 -32; DW_OP_deref_size 8; DW_OP_lt; DW_OP_call_frame_cfa; DW_OP_neg; DW_OP_xor; DW_OP_pick 0; DW_OP_stack_value` | value 0xffff8ffffffffff0 | value 0xffffbfffff800281 | value 0xffff8ffffffffff0 |
| v428@loclist@fb=expr | `DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v460@fb=breg | `DW_OP_const1u 15; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v466@fb=expr | `DW_OP_const1s 0; DW_OP_fbreg -137; DW_OP_skip 1; DW_OP_neg; DW_OP_abs; DW_OP_mul; DW_OP_not; DW_OP_nop` | addr 0xffffffffffffffff | error: invalid load address | addr 0xffffffffffffffff |
| v474@loclist-base@fb=loclist | `DW_OP_const1u 255; DW_OP_const8u 0x1ce551c6453d057c; DW_OP_lit10; DW_OP_consts 211; DW_OP_pick 1; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v498@fb=reg | `DW_OP_call_frame_cfa; DW_OP_stack_value` | value 0x700000000010 | value 0x4000007ffd80 | value 0x700000000010 |
| v506@fb=expr | `DW_OP_call_frame_cfa; DW_OP_not; DW_OP_pick 0` | addr 0xffff8fffffffffef | addr 0xffffbfffff80027f | addr 0xffff8fffffffffef |
| v509@fb=expr | `DW_OP_bregx 14 -172; DW_OP_const2s 11; DW_OP_const1s 85; DW_OP_call_frame_cfa; DW_OP_mul; DW_OP_abs; DW_OP_not` | addr 0xffdacffffffffaaf | addr 0xffeabfffd580d47f | addr 0xffdacffffffffaaf |
| v515@loclist@fb=reg | `DW_OP_const4u 98; DW_OP_fbreg 173; DW_OP_lt; DW_OP_pick 0; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v524@fb=expr | `DW_OP_breg2 -255; DW_OP_nop; DW_OP_consts 149; DW_OP_over; DW_OP_shra; DW_OP_addr dw_mem+243; DW_OP_gt; DW_OP_stack_value` | value 0x0 | error: extracting data from value failed | value 0x0 |
| v549@loclist@fb=reg | `DW_OP_addr dw_mem+144; DW_OP_deref_size 2; DW_OP_const2s 3; DW_OP_plus_uconst 63; DW_OP_const2s 13; DW_OP_abs; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v550@fb=breg | `DW_OP_fbreg 249; DW_OP_addr dw_mem+191; DW_OP_deref_size 4; DW_OP_addr dw_mem+218; DW_OP_call_frame_cfa; DW_OP_constu 3; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v553@fb=expr | `DW_OP_lit16; DW_OP_dup; DW_OP_const2u 8; DW_OP_over; DW_OP_rot; DW_OP_plus_uconst 201; DW_OP_const1u 15; DW_OP_gt; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v565@fb=breg | `DW_OP_lit2; DW_OP_const8u 244; DW_OP_consts 63; DW_OP_bra 1; DW_OP_not; DW_OP_lit20` | error: gdb aborted | addr 0x14 | addr 0x14 |
| v626@fb=reg | `DW_OP_addr dw_mem+84; DW_OP_call_frame_cfa; DW_OP_stack_value` | value 0x700000000010 | value 0x4000007ffd80 | value 0x700000000010 |
| v644@fb=expr | `DW_OP_const2s 56; DW_OP_nop; DW_OP_not; DW_OP_const8u 0x7fffffff; DW_OP_le` | addr 0x1 | addr 0x0 | addr 0x1 |
| v654@fb=breg | `DW_OP_call_frame_cfa; DW_OP_not` | addr 0xffff8fffffffffef | addr 0xffffbfffff80027f | addr 0xffff8fffffffffef |
| v663@fb=breg | `DW_OP_const1s -22; DW_OP_abs; DW_OP_call_frame_cfa; DW_OP_mul; DW_OP_skip 1; DW_OP_neg; DW_OP_not` | addr 0xfff65ffffffffe9f | addr 0xfffa7ffff50036ff | addr 0xfff65ffffffffe9f |
| v677@fb=expr | `DW_OP_addr dw_mem+124; DW_OP_deref; DW_OP_neg; DW_OP_not; DW_OP_not; DW_OP_const1u 203; DW_OP_bregx 1 188; DW_OP_call_frame_cfa; DW_OP_stack_value` | value 0x700000000010 | value 0x4000007ffd80 | value 0x700000000010 |
| v690@loclist@fb=expr | `DW_OP_call_frame_cfa; DW_OP_skip 1; DW_OP_not` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v694@fb=expr | `DW_OP_const1s -1; DW_OP_plus_uconst 48; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v710@loclist@fb=expr | `DW_OP_const2s 128; DW_OP_nop; DW_OP_bregx 15 -117; DW_OP_deref; DW_OP_dup; DW_OP_gt; DW_OP_stack_value` | value 0x0 | error: extracting data from value failed | value 0x0 |
| v745@loclist@fb=expr | `DW_OP_const1s 115; DW_OP_call_frame_cfa; DW_OP_or; DW_OP_skip 1; DW_OP_abs` | addr 0x700000000073 | addr 0x4000007ffdf3 | addr 0x700000000073 |
| v752@loclist@fb=loclist | `DW_OP_constu 33; DW_OP_neg; DW_OP_nop; DW_OP_abs` | addr 0x21 | addr 0xffffffffffffffdf | addr 0x21 |
| v758@fb=expr | `DW_OP_const4u 0xe1d6d700; DW_OP_breg3 194; DW_OP_shl; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v763@fb=loclist | `DW_OP_call_frame_cfa; DW_OP_const4u 3; DW_OP_pick 1; DW_OP_plus_uconst 0; DW_OP_xor; DW_OP_nop; DW_OP_bregx 13 -32; DW_OP_over` | addr 0x700000000013 | addr 0x4000007ffd83 | addr 0x700000000013 |
| v780@loclist-base@fb=reg | `DW_OP_lit17; DW_OP_nop; DW_OP_const2u 15; DW_OP_eq; DW_OP_const2u 2; DW_OP_over; DW_OP_stack_value` | value 0x0 | error: extracting data from value failed | value 0x0 |
| v805@fb=breg | `DW_OP_const2u 33; DW_OP_const4u 83; DW_OP_bra 1; DW_OP_not; DW_OP_stack_value` | error: gdb aborted | value 0x21 | value 0x21 |
| v810@fb=reg | `DW_OP_breg11 -27; DW_OP_abs; DW_OP_const2s 0x5e83; DW_OP_nop; DW_OP_over; DW_OP_not; DW_OP_call_frame_cfa; DW_OP_stack_value` | value 0x700000000010 | value 0x4000007ffd80 | value 0x700000000010 |
| v818@fb=breg | `DW_OP_const1s 31; DW_OP_breg29 -166; DW_OP_minus; DW_OP_abs; DW_OP_consts 66; DW_OP_neg; DW_OP_le` | addr 0x0 | addr 0x1 | addr 0x0 |
| v836 | `DW_OP_const1s 24; DW_OP_consts 0x4583f5993fea922c; DW_OP_bra 1; DW_OP_not; DW_OP_stack_value` | error: gdb aborted | value 0x18 | value 0x18 |
| v849@fb=breg | `DW_OP_bregx 11 -19; DW_OP_breg29 128; DW_OP_pick 0; DW_OP_bra 1; DW_OP_neg; DW_OP_or; DW_OP_abs; DW_OP_stack_value` | value 0x13 | value 0xffffffffffffffed | value 0x13 |
| v859@loclist@fb=loclist | `DW_OP_fbreg -191; DW_OP_consts 0x37d17c0a8dc2d16f; DW_OP_plus; DW_OP_neg; DW_OP_pick 0; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v878@loclist | `DW_OP_constu 0x43e54f9bb4d93fcc; DW_OP_plus_uconst 198; DW_OP_neg; DW_OP_abs; DW_OP_const1u 161; DW_OP_bra 1; DW_OP_neg; DW_OP_stack_value` | value 0x43e54f9bb4d94092 | value 0xbc1ab0644b26bf6e | value 0x43e54f9bb4d94092 |
| v884@loclist@fb=loclist | `DW_OP_call_frame_cfa; DW_OP_dup` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v897@loclist@fb=breg | `DW_OP_const2u 0xd54b; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v912@fb=reg | `DW_OP_breg10 -76; DW_OP_drop; DW_OP_call_frame_cfa` | addr 0x700000000010 | addr 0x4000007ffd80 | addr 0x700000000010 |
| v914@loclist@fb=breg | `DW_OP_const4s 206; DW_OP_dup; DW_OP_eq; DW_OP_skip 1; DW_OP_neg; DW_OP_nop; DW_OP_stack_value` | value 0x1 | error: extracting data from value failed | value 0x1 |
| v921@loclist@fb=breg | `DW_OP_const1u 207; DW_OP_const2s 0x5ebd; DW_OP_call_frame_cfa; DW_OP_or; DW_OP_not; DW_OP_pick 0; DW_OP_neg; DW_OP_stack_value` | value 0x700000005ebe | value 0x4000007fffbe | value 0x700000005ebe |
| v965@fb=loclist | `DW_OP_const2u 180; DW_OP_neg; DW_OP_fbreg -93; DW_OP_shra; DW_OP_abs; DW_OP_abs` | addr 0x1 | error: invalid load address | addr 0x1 |
| v968@loclist@fb=loclist | `DW_OP_call_frame_cfa; DW_OP_plus_uconst 221; DW_OP_stack_value` | value 0x7000000000ed | value 0x4000007ffe5d | value 0x7000000000ed |
| v971@fb=loclist | `DW_OP_const8s 0x4d5610f38a7b8d66; DW_OP_nop; DW_OP_constu 227; DW_OP_bra 1; DW_OP_not; DW_OP_drop; DW_OP_const8u 0x8000000000000000` | error: gdb aborted | addr 0x8000000000000000 | addr 0x8000000000000000 |
| v993@fb=breg | `DW_OP_const1u 211; DW_OP_pick 0; DW_OP_drop; DW_OP_neg; DW_OP_call_frame_cfa; DW_OP_pick 1; DW_OP_plus_uconst 16; DW_OP_rot; DW_OP_stack_value` | value 0x700000000010 | value 0x4000007ffd80 | value 0x700000000010 |
| v998@loclist | `DW_OP_const2s 68; DW_OP_bregx 15 -141; DW_OP_neg; DW_OP_le` | addr 0x0 | addr 0x1 | addr 0x0 |

