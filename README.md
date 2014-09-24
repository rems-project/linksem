# README

Partial ELF (Executable and Linkable Format) specification in Lem, still under
development.  Developers, users, and testers (at this point there is no distinction
):

  1. Dominic Mulligan
  2. Stephen Kell
  3. Kathy Gray

## Repository map

  * `src` directory contains the latest Lem and ML source code for the development,
  * `src/test` directory contains ELF executable and C source files for building
    executables to test against,
  * `src/ocaml-obsolete` contains an obsolete version of the specification written
    in OCaml that will be removed eventually in time,
  * `talks` directory contains LaTeX source code of talks on the development,
  * `doc` directory contains relevant ABI documentation used to develop the model.

## Main design ideas

  * Any possibly failing operation is done within the error monad defined in
    `src/error.lem` and its OCaml counterpart `src/error.ml`.  Failing computations
    are chained together using the bind operator `(>>=)` and results are successfully
    returned from a possibly failing computation using `return`.  Several other
    utility functions are defined in that file for working with the error monad.

    The two constructors of the monad are `Fail` and `Success` and can be
    pattern matched against.

  * ELF files are lazily unfolded, with more and more structure added at each stage.
    This idea is to hopefully allow us to talk about corrupted ELF files which
    otherwise have valid data in them.  The first stage of the unfolding is
    `elfXX_file1` (where `XX` is either 32 or 64) which fills in the ELF header.
    From then on, there is a series of further unfoldings (only for executable
    files at present) in the files `elf_executable_fileX.lem` (where `X` is in
    the range 1-5).  To obtain a parsed ELF file, you may either start with an
    uninterpreted bitstring and slowly refine, passing through each lazy unfolding
    using the `refine_elfXX_executable_fileY` functions, or pass directly to the
    final stage using `read_elfXX_executable_fileY` (again, where `XX` is 32 or
    64 and `Y` is in the range 1-5).

    From an `elfXX_executable_file5` one may obtain a process image, i.e. a
    collection of loadable memory chunks with a memory address, and an entry
    point for the program, using the `elfXX_obtain_image` functions.

  * The central type in the development is `bitstring`, which represents a string
    of uninterpreted bits.  This is provided by the `bitstring` OCaml library,
    and is bound in Lem in the `bitstring.lem` file, which exposes some but not
    all of the library's functionality.

    All reading of data is mediated through `bitstring` and the library's associated
    `bitmatch` construct.
    
  * The development is partially typeclassed in order to make working with all the
    many types less painful.  This is not currently taken to its conclusion, and
    more typeclasses will be added in time.

## Building instructions

  * Type `make` to build the Lem model and then the OCaml version.
  * Type `make ocaml` to skip building the Lem model and directly invoke the OCaml
    compiler.
  * Type `make stacktrace` to build the Lem model and the OCaml version, with
    debug information created and the OCaml stacktrace flag set.

system-v-abi depends on the following non-standard OCaml libraries (installable
via `opam`):

  * ocaml-batteries (for string processing and utility functions)
  * uint (for unsigned types)
  * bitstring (for the `bitstring` type and `bitmatch` construct)

## Bugs

  * `error.lem` is not extracted correctly by Lem, as the infix `(>>=)` operator
    has missing brackets in its declaration.  As a result, this Lem file is missing
    from the list to be processed by Lem and is added directly to the repository
    as an ML file, hand edited to remove the bug.  If you update the `error.lem`
    file you must also edit the accompanying ML file, otherwise your changes will
    not be visible in the rest of the codebase.