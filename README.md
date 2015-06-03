# README

## Introduction

This repository contains work relating to an ongoing project to formalise the
process of linking object code. Toward this end, the project contains:

  * A formalisation of the core ELF file format, the de facto standard executable
    and linkable file format on Linux and related systems.
  * A partial formalisation of various aspects of the AMD64, PowerPC64 and AArch64
    Application Binary Interfaces (ABIs) sufficient to extract data from an ELF
    binary, produce a process image, and hand off to a loader for execution.
    Various other bits and pieces of these ABIs have also been formalised on an
    ad hoc basis.
  * A partial formalisation of what it means to correctly (statically) link
    object code together. To properly do this the command line interface of the
    GNU linker and the semantics of AT&T linker script must also be formalised.
  * A nascent formalisation of the DWARF debugging format, often embedded in
    ELF executables.
    
All formalisation work is being carried out in the Lem specification tool.
    
The ELF formalisation (and parts of the ABI formalisation) are currently also
being used as a subcomponent of the 'ppcmem2' architectural exploration tool.
    
## Contributors

Main contributors to the formalisation are: Stephen Kell, Dominic Mulligan and
Peter Sewell.

Current clients of the formalisation are: Shaked Flur, Kathy Gray,
Christopher Pulte, and Susmit Sarkar.

## Directory structure

The top-level directory structure is as follows:

  * 'auto_generated' contains proof assistant theories automatically extracted
    from the base models by the Lem tool. Note that these theories are extracted
    on an ad hoc basis and are not guaranteed to be in lock-step with the latest
    specification from which they are derived.
  * 'contrib' contains useful and/or necessary library code from third-parties
    needed to build the formalisation.
  * 'doc' contains various specifications, standards documents and/or other
    useful documents necessary for the formalisation.
  * 'src' contains the latest formalisation. It is further divided into the
    following subdirectories:
      * 'abis' contains Lem code specific to the formalisation of Application
      Binary Interfaces. Each ABI considered has a further dedicated subdirectory
      below 'abis'.
      * 'adaptors' contains Lem code providing a simplified interface to various
      external tools that rely on the formalisation in 'src'. For example, the
      file 'src/adaptors/sail_interface.lem' presents a simplified interface for
      extracting executable process information to the 'ppcmem2'/'sail' project.
  * 'talks' contains the LaTeX source code of talks and other publicity material
    relating to the linking formalisation.
  * 'test' contains example ELF binaries for multiple platforms/ABIs to test the
    various formalisations against.
    
## Build process

To build the model from a fresh Mercurial checkout (assuming your current working
directory is 'linksem'):

  1. 'cd contrib && make'
  2. 'cd ../src'
  3. 'make'
  
This will make all dependencies in 'contrib', build the Lem model (extracting
OCaml files) and build these files with the OCaml compiler.

To only run Lem (OCaml backend) on the source model, producing ML files but not
building them, use 'make lem-all-ocaml' in Step 3 above instead of 'make'.
    
## Known issues

Currently a bug in Lem prevents 'error.lem' from being extracted correctly to
OCaml. Therefore any changes to 'error.lem' require special attention, namely
hand editing 'error.ml', the Lem generated ML file, to add parentheses around
the infix monadic bind operator '>>=' to avoid an OCaml parse error.

All other issues, infelicities or missing pieces of formalisation should be
noted in a camldoc-style comment at the top of the relevant Lem file.
