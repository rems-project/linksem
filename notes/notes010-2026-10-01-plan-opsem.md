<!-- Claude: written by Claude, 1 October 2026. -->
# notes010: plan for the missing DW_OP semantics

Written after the specification cleanup of 1 October 2026 (option-typed
sections and parts of the `dwarf` record, `d_str` removed, record types for
the analysed location data, `od_regnames_riscv`; commits 82e3ff7, 6fde6a5,
9e799ec, f36dd5f, 2e7309b).  The plan is not executed here.

## The operations without semantics

`src/dwarf.lem`'s operation table gives these `OpSem_not_supported` (they
parse and print, and the evaluator fails on them with the operation named):

| operation(s)                                         | what it needs                                                                                                | straightforward? |
|------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|------------------|
| `DW_OP_call2`, `DW_OP_call4`                         | evaluate the `DW_AT_location` of the DIE at a unit-relative offset as a subexpression on the same stack      | yes              |
| `DW_OP_call_ref`                                     | the same for a `.debug_info`-relative offset (any unit)                                                      | yes              |
| `DW_OP_GNU_variable_value`                           | the value (not location) of the DIE at a `.debug_info` offset: evaluate its location, then read the object   | yes, mostly      |
| `DW_OP_GNU_parameter_ref`                            | a `DW_TAG_formal_parameter` DIE by unit-relative offset: the parameter's value at the current pc, as above    | yes, mostly      |
| `DW_OP_entry_value`, `DW_OP_GNU_entry_value`         | a register's (or expression's) value on entry to the subprogram: the caller's state                          | partly           |
| `DW_OP_implicit_pointer`, `DW_OP_GNU_implicit_pointer` | a new kind of result: "points to the object of that DIE, at that offset"                                   | yes              |
| `DW_OP_push_object_address`                          | the address of the object being described (a context the caller must supply)                                | plumbing only    |
| `DW_OP_form_tls_address`, `DW_OP_GNU_push_tls_address` | the thread's TLS block address (a context the caller must supply)                                          | plumbing only    |
| `DW_OP_xderef`, `DW_OP_xderef_size`, `DW_OP_xderef_type` | memory reads in another address space                                                                    | not worth it now |
| `DW_OP_GNU_uninit`                                   | a marker: the object is uninitialised; no stack effect                                                       | trivial          |

### 1 The DIE-referencing operations (call2/4, call_ref, variable_value, parameter_ref)

The evaluator (`evaluate_operation_list`) already carries a `unit_context`
with the unit's DIE index (`uc_index`), so `DW_OP_call2/4` can find the
referenced DIE directly: look it up at `cuh_offset + offset`, take its
`DW_AT_location`, and evaluate that description with the same `str`,
`evaluated_frame_info`, `ev`, `mfbloc` and `pc`, *continuing on the current
stack* (section 2.5.1.5: the called expression operates on the caller's
stack; a `DW_OP_call*` to a DIE without `DW_AT_location` is a no-op).  That
needs `evaluate_operation_list` to accept an initial state, which it already
does (`s`), and a recursion guard: the existing `fuel` counter bounds it.
`DW_OP_call_ref` needs a lookup across units: give `unit_context` a
`uc_die_at_offset : sym_natural -> maybe cupdie` built by
`unit_context_of_cu d cu` from `d` (`find_die_by_offset_in_all`), so the
evaluator still sees only the context.  `DW_OP_GNU_variable_value` and
`DW_OP_GNU_parameter_ref` are the same lookup followed by an evaluation of
the DIE's location at the current pc *on a fresh stack* and a read of the
object (its `DW_AT_type`'s byte size; the generic type when unknown), pushing
the value; a register or implicit result pushes the register's or implicit
value.  All four are a day's work including tests; gcc emits `call*` rarely,
`GNU_variable_value` for VLA bounds, `GNU_parameter_ref` for IPA-SRA'd
parameters, so the kernel has a few.

Cross-check: the `validation/dwarf-expr` harness can test `call2/4` once its
assembler can attach a second variable's location to call (an `@call=NAME`
annotation producing `DW_OP_call4 .Lvar_NAME-.Lcu_start`); gdb implements
`call*` and `GNU_variable_value`; lldb implements `call*`.

### 2 Entry values

`DW_OP_entry_value <block>` with the block a single `DW_OP_regN`/`DW_OP_regx`
(the only form clang and gcc emit; 2086 sites in kvm_nvhe.o) means "the
value register N had on entry to the subprogram".  That is recoverable from
the call frame information already evaluated (`evaluated_frame_info`): at
the pc, the CFA row's rule for register N is `same value` (then the entry
value is the current value), `offset(N)` (saved at CFA+N: read it), or
`register(M)`; `undefined` or an expression rule means it cannot be
recovered, and a caller-saved register with no rule is also unrecoverable
(gdb then uses the caller's call site parameters, `DW_TAG_call_site_parameter`
with `DW_AT_call_value`, when it has unwound a frame; linksem has no unwound
caller, so it should fail with a clear message).  So: implement the
register case through the CFA rules, fail otherwise, and leave the general
expression form (evaluate the block "as if on entry") unsupported.
Half a day; the harness's frame-base sets already set up CFI, so a test set
with `.cfi_offset` saves of registers whose values are then changed is
natural.

### 3 Implicit pointers

`DW_OP_implicit_pointer <die> <offset>` is a *location description* result,
not a stack value: add `SL_implicit_pointer of sym_natural (* .debug_info
offset of the DIE *) * sym_integer (* byte offset *)` to `simple_location`,
terminate the expression with it as `DW_OP_stack_value` does, and let the
consumers decide (read-dwarf prints locations through `pp_single_location`,
which gains a case; the harness classifies it as a new kind).  Simple, but
every pattern match on `simple_location` in linksem and read-dwarf must be
visited (Lem reports the inexhaustive ones).

### 4 Context the caller must supply

`DW_OP_push_object_address` and the TLS operations are only meaningful with
information the evaluator does not have: the described object's address
(for `DW_AT_data_location` etc.) and the thread's TLS block.  Add two
optional fields to `evaluation_context` (`object_address : maybe
sym_natural`, `tls_address : sym_natural -> maybe sym_natural`), fail with a
clear message when absent, and let read-dwarf leave them absent.  Small.

### 5 Not now

The `xderef` family needs an address-space-aware `read_memory`; no producer
for Linux targets emits them.  Leave them unsupported, with the message.
