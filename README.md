# README

## Introduction

Linksem is a formalisation of substantial parts of ELF linking and DWARF debug information.
It contains:

  * A formalisation of the core ELF file format, the de facto standard
    executable and linkable file format on Linux and related systems, written
    in Lem.  This formalisation has been tested against approximately 5,000 ELF
    binaries found "in the wild" on various different platforms.
  * A partial formalisation of various aspects of the platform Application
    Binary Interfaces for AMD64, Power64, AArch64, and X86-32, as well as a
    partial formalisation of the GNU extensions for ELF that the Linux operating
    system expects. These formalisations have been formalised on an ad hoc
    basis, as they were needed and may (almost certainly will be) incomplete.
  * An executable linker/link-checker built atop the aforementioned ELF and ABI
    formalisations for AMD64, capable of linking complex link-jobs such as
    `bzip2`, derived from an OCaml extraction of the Lem models above.
  * A sample proof of correctness for AMD64 relocation, using an `Isabelle/HOL`
    extraction of the linker, ELF model, and ABI formalisations mentioned above.
  * A formalisation of the DWARF debug information format, as an executable
    specification that interprets the DWARF information. 

The ELF formalisation (and parts of the ABI formalisation) are currently also
being used as a subcomponent of the `rmem` architectural exploration tool,
for parsing ELF files and setting up initial machine states.


## Papers

* [The missing link: explaining ELF static linking, semantically](http://www.cl.cam.ac.uk/~pes20/rems/papers/oopsla-elf-linking-2016.pdf). Stephen Kell, Dominic P. Mulligan, and Peter Sewell. In OOPSLA 2016.

## People

The main authors are Stephen Kell, Dominic Mulligan and Peter Sewell,
with additional contributions from Thibaut Pérami, Simon Ser, Shaked
Flur, Robert Norton, Ramana Kumar, Jonathan French, Brian Campbell,
and Thomas Bauereiss.



## Directory structure

The top-level directory structure is as follows:

  * 'auto_generated' contains proof assistant theories automatically extracted
    from the base models by the Lem tool. Note that these theories are extracted
    on an ad hoc basis and are not guaranteed to be in lock-step with the latest
    specification from which they are derived.
  * 'doc' contains various specifications, standards documents and/or other
    useful documents necessary for the formalisation.
  * 'src' contains the latest formalisation. It is further divided into the
    following subdirectories:
      * 'abis' contains Lem code specific to the formalisation of Application
        Binary Interfaces. Each ABI considered has a further dedicated
        subdirectory below 'abis'.
      * 'adaptors' contains Lem code providing a simplified interface to various
        external tools that rely on the formalisation in 'src'. For example, the
        file `src/adaptors/sail_interface.lem` presents a simplified interface
        for extracting executable process information to the `ppcmem2` project.
  * 'prf' contains a copy of Fox's X64 HOL4 specification, and the sample
    Isabelle proof for AMD64 relocation.
  * 'talks' contains the LaTeX source code of talks and other publicity material
    relating to the linking formalisation.
  * 'test' contains example ELF binaries for multiple platforms/ABIs to test the
    various formalisations against.
  * 'validation' contains the validation scripts used for mass-validation of the
    ELF and ABI specifications against existing ELF binaries.


## To install and build

Linksem is available as an [opam](https://opam.ocaml.org) package and
a [github repo](https://github.com/rems-project/linksem).

### With OPAM  (released version)

First, ensure you have opam (the OCaml package manager) installed,
version 2.0 or greater (opam 1 versions of ott are no longer
supported).  You can use your system's package manager e.g. `sudo
apt-get install opam` (e.g. on Ubuntu 20.04) or follow the
[instructions from the opam website](https://opam.ocaml.org/doc/Install.html).
On older Ubuntu versions you will not be able to use their package
manager's opam 1 version, and will need to install opam 2 following the
instructions on the opam website.

Then `opam install linksem` will install the latest release version. 


### With OPAM (github checkout)

In the checkout directory, run `opam pin add linksem .`.

To rebuild and reinstall after local changes, run `opam upgrade --working-dir linksem`  (or `opam upgrade -w linksem`).

### Without OPAM

To build the model from a fresh git checkout (assuming your current working
directory is `linksem`), `cd` into `src` and type `make`.

This will build the Lem model (extracting OCaml files) and build these files
with the OCaml compiler.


## Usage

Linksem is principally intended to be used in other code, but for testing purposes, the `src/main_elf` binary produces output in the style of existing tools:

`src/main_elf <flag> <filename>`

where `<flag>` is one of `--file-header`, `--program-headers`, `--section-headers`, `--relocs`, `--dynamic`, `--in-out`, `--debug-dump=info`.



## Known issues

  1. Currently a bug in Lem prevents 'error.lem' from being extracted correctly
     to OCaml. Therefore any changes to 'error.lem' require special attention,
     namely hand editing 'error.ml', the Lem generated ML file, to add
     parentheses around the infix monadic bind operator '>>=' to avoid an OCaml
     parse error.
  2. Another bug in Lem prevents us from writing large numeric constants in
     their most natural form. Rather, any constant that exceeds the range of the
     OCaml 'int' type must be split into smaller constants that are added or
     multiplied together, due to the Lem parser using 'int' throughout. Where
     this happens the total of the computation (i.e. the constant's value) is
     noted in a comment.
  3. Isabelle extractions of the Lem models require a small amount of hand
     editing to get Isabelle to accept them, due to various bugs in Lem.

Any infelicities or missing pieces of formalisation should be
noted in a camldoc-style comment at the top of the relevant Lem file.

## Funding

This software was developed by the University of Cambridge Computer
Laboratory (Department of Computer Science and Technology), in part
funded by EPSRC Programme Grant EP/K008528/1 [REMS: Rigorous
Engineering for Mainstream
Systems](http://www.cl.cam.ac.uk/~pes20/rems), in part funded from
the European Research Council (ERC) under the European Union’s Horizon
2020 research and innovation programme (grant agreement No 789108,
"ELVER"), and in part funded by Google.
