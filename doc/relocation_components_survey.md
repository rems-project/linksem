# What

Applying a relocation requires gathering various "components", or inputs, that
will form the final result.  There is no apparent uniformity amongst the ABIs of
mainstream microprocessor families about what these components are, though there
is some limited commonality, with various distinguished bits and pieces occurring
again and again in the ABI descriptions of the relocation processes.

Gathering this information is important if we are to describe what an ABI *is*
as a first-class object.  In particular, we'd like a nice, uniform interface for
applying relocations and therefore we need to take the (approximate) union of
the various required components as input to this relocation function.

# Legend

The following legend holds below:

    * "@gprel(expr)" is a GP-relative displacement, the difference between "expr"
      and the value of the Global Pointer.
    * "@ltoff(expr)" is the creation of a Global Offset Table (GOT) entry that
      will hold the full value of "expr" and computes the GP-relative displacement
      to that entry.
    * "@pltoff(sym)" is the creation of a local function descriptor for "sym"
      and computes a GP-relative displacement to that entry.
    * "@segrel(expr)" is a segment-relative displacement --- the difference between
      "expr" and the beginning of the containing segment.
    * "@secrel(expr)" is a section-relative displacement --- the difference between
      "expr" and the beginning of the containing section.
    * "@fptr(sym)" is the address of the official function descriptor for "sym".
    * "@tprel(expr)" is a TP-relative displacement --- the difference between the
      effective address and the value of the Thread Pointer.
    * "@dtpmod(expr)" is the load module index corresponding to the load module
      that contains the definition of the symbol referenced by the relocation.
    * "@dtprel(expr)" is a DTV-relative displacement, the difference between the
      effective address and the base-address of the thread-local storage block
      that contains the definition of the symbol referenced by the relocation.
    * "[msb, lsb]" is a bit-mask operation representing a selection of bits from
      a value.
    * "A" is the addend from the relocation record.
    * "B" is the base address at which the shared-object has been loaded into
      memory.
    * "BD" is the base-address difference, a constant representing the difference
      between the run-time virtual address and the link-time virtual address of
      a particular segment, that must be applied to a virtual address.
    * "Delta(S)" is the difference between the static link-address of "S" and the
      execution address of "S" if "S" is a normal symbol.  If "S" is the null symbol
      then "Delta(S)" is the difference between the static-link address of "P"
      and the execution address of "P".
    * "G" is the offset into the Global Offset Table (GOT) at which the
      relocation's entry will reside during execution.
    * "G(X)" is the address in the Global Offset Table (GOT) for expression "X".
    * "GDAT(S + A)" is a 64-bit entry in the Global Offset Table (GOT) for address
      "S + A".
    * "GOT" is the address of the Global Offset Table.
    * "Indirect(X)" is the result of calling "X" as a function.
    * "L" is the section offset or address of the Procedure Linkage Table (PLT)
      entry for a symbol.
    * "M" is similar to "G", except that the address which is stored may be the
      address of the Procedure Linkage Table entry for the symbol.
    * "P" is the section offset or address of the storage unit being relocated.
    * "Page(X)" is the page address of the expression "X".
    * "R" is the offset of the symbol within the section in which the symbol is
      defined (its section-relative address).
    * "S" is the value of the computed symbol whose index resides in the
      relocation entry.
    * "Z" is the size of the computed symbol whose index resides in the
      relocation entry.
    * "X" is the result of the relocation operation before any masking or bit-
      operation has been applied.

Plus one special component not mentioned in any of the ABI documents but implicitly
assumed:

    * "XXX": the entire ELF binary file contents for COPY-type relocations.
      
# Selected ABIs

## AARCH64

AARCH64 static, jump and other non-TLS related relocations use "[msb, lsb]", "A",
"P", "X", "S", "Page(X)", "GOT", "GDAT(S+A)", "G(X)", "Delta(S)", "Indirect(X)",
and "XXX".

For TLS-related relocations AARCH64 requires an additional set of relocation
components.

## AMD64

Uses "A", "B", "G", "GOT", "L", "P", "S", "Z", "Indirect(X)", and "XXX".

## IA64

Uses "A", "BD", "P", "S", "@gprel(expr)", "@ltoff(expr)", "@pltoff(sym)",
"@segrel(expr)", "@secrel(expr)", "@fptr(sym)", "@tprel(expr)", "@dtpmod(expr)"
and "@dtprel(expr)".  There appears to be no COPY-type relocation.

## Power64

Uses "A", "B", "G", "L", "M", "P", "R", "S", and "XXX".
