# The missing link: explaining ELF linking, semantically

## Artefact submission

This is the artefact submission for the 2016 OOPSLA SPLASH submission "The missing link: explaining ELF linking, semantically" by Kell, Mulligan, and Sewell.  There are two main components of the artefact submission: the ELF and linker formalisation in Lem itself, and the Isabelle-2016 sample proof relating to AMD64 relocation and termination proof, using a derived Isabelle version of our Lem model.  We will now detail how the artefact reviewer can assess both of these components:

### ELF formalisation and linker

To build the ELF/linker formalisation, first install OCaml 4.01.0 (easiest using the OPAM tool: `https://opam.ocaml.org/`).  Next, in the `linker/` subdirectory of our artefact submission, type `make`.  This will first build Lem and its library, then build the ocaml-uint library supplied in the `contrib` directory, before invoking Lem on the ELF/linker formalisation, finally invoking the OCaml compiler on the generated OCaml source code.  After this process is complete, an executable (`main_link.opt`) will reside in the `linker/src` subdirectory.

To invoke the linker/link-checker, just run `main_link.opt` with the usual GNU ld command-line syntax. The easiest way to exercise it is to run the `run.sh` symlinks in any of the subdirectories under `test`, which are already link jobs of the supported form. If you choose to run it on your own
link jobs, note that all linker inputs must be specified explicitly by their path in the filesystem, (the `-l` option is not yet supported) and that some linker output of the specified name should already exist (as a minimum, a placeholder ELF file of the intended ABI). The output from the executable specification is created in a new file, named with the suffix `.test-out` added.

The `linker/src` subdirectory contains the following:

  1. The `abis/` subdirectory, which contains the formalisation of various aspects of the AARCH64, AMD64, Power64, MIPS64, and X86 ABIs, in analogously named subdirectories.

  2. The `adaptors/` subdirectory, which contains simplified interfaces to the linker/ELF code that external tools such as PPCMem2 use for reading ELF files.

  3. The `gnu_extensions/` subdirectory, which contains the formalisation of various aspects of the GNU extensions for ELF, which the Linux ecosystem relies upon.

  4. All other files, barring several ML files, contain the ELF/linker formalisation proper, in Lem.  The few ML files contain utility code needed by the OCaml extraction of our ELF/linker model, or contain (as in the case of `error.ml`) hand edited ML code produced by Lem to work around bugs in the Lem system.

### Isabelle-2016 relocation and termination proof

Checking the relocation and termination proof first requires the installation of Isabelle-2016.  The following instructions detail how this can be installed and correctly set up, ready to check our proofs:

  1. Assuming the reviewer is on Linux, download the Isabelle-2016 distribution from the official Isabelle site, or using the following direct download link: `https://isabelle.in.tum.de/dist/Isabelle2016_app.tar.gz`.  Installation instructions for Microsoft Windows and MacOS are available from the official Isabelle website, though Linux is by far the best supported platform.

  2. Extract the downloaded `tar` file into a local directory, using the following command: `tar -xzf Isabelle2016_app.tar.gz`.  This should create a new directory called `Isabelle2016`.  Add this directory to your path.

  3. The `Isabelle2016` executable should now be invokable from your terminal, if the `Isabelle2016` directory was correctly added to your path.  Invoke `Isabelle2016`.  This should open the Isabelle/jEdit interface and start building the Isabelle/HOL object logic (depending on the speed of your computer, this should take up to ten minutes).  Once the HOL object logic has been successfully built, the "build logic" popup window should disappear and a jEdit editor should be on screen.

  4. This concludes the installation of Isabelle-2016.

To check our relocation proof (in the `prf` subdirectory of our artefact submission) do the following:

  1. Assuming our artefact submission has been extracted to `$LINKSEM_ARTEFACT`, invoke `Isabelle2016 $LINKSEM_ARTEFACT/ELF_Relocation_Proof.thy`.  This file is the top-level relocation proof theory script.  This contains both the proof of the sample theorem, discussed in our paper submission, and also imports the termination proofs, as well as (transitively) importing all Isabelle theory files derived from our Lem model.

  2. After opening the file, and after a brief pause, Isabelle2016 will produce a popup window asking whether the dependencies of the `ELF_Relocation_Proof` theory script should be opened and checked.  Click "yes".  Isabelle will proceed to open and transitively check all dependencies concurrently.  Isabelle's progress can be monitored by clicking the "Theories" tab on the right hand side of the editor pane.  This can be interpreted as follows:

    a. Any red band in a theory's progress box indicates that Isabelle has encountered an error when processing that theory.  If we have correctly submitted our artefact, this should not happen.

    b. Any yellow band in a theory's progress box indicates a proof step has caused some informative message to be produced by Isabelle for the user's benefit.  This output can be safely ignored as it does not affect correctness of the proof being processed.

    c. Any purple band in a theory's progress box indicates that Isabelle is still working to check a proof step or definition (note Isabelle is able to concurrently check theories using multiple cores, so progress should still be being made checking other theories if this happens).  Some proof steps in our proof require longer than others, though none should take longer than a minute to process.  Ultimately, Isabelle should be able to process `ELF_Relocation_Proof` and all of its dependencies within 15 minutes, even on a very slow machine.

  The dependencies fall into four different classes:

    a. The Isabelle extraction of our Lem linker and ELF model, which makes up the bulk of the dependencies.  These file can be surveyed by opening the `Import_everything` theory, which acts as a top-level import,

    b. An Isabelle extraction of Anthony Fox's X86_64 model, and supporting files for his proprietary `L3` tool,

    c. Supporting files for Lem extracted code (i.e. the Lem standard library extracted to Isabelle), consisting of files beginning with `Lem_`,

    d. Handwritten supporting files for the Lem Isabelle extraction, providing missing definitions, handwritten bindings for Lem types in Isabelle, and similar content.  The most important of these is the file `ELF_Types_Local.thy` which provides bindings for ELF-specific types, and operations over them, in terms of the Isabelle Word library for bitvectors and machine words.

  3. After at most 15 minutes, Isabelle should have reached the bottom of `ELF_Relocation_Proof` (i.e. there should be no purple bands in the ELF_Relocation_Proof box in the theories side-panel, nor should there be any purple lines on the right-hand side of the editor gutter when the ELF_Relocation_Proof.thy file is open) and checking the proof should be complete.  At the very bottom of the `ELF_Relocation_Proof` file is the theorem `correctness` which encodes the sample correctness property for AMD64 relocation which was mentioned in our paper submission.  For reviewers not familiar with Isabelle, the following should now be checked:

    a. The theory `Termination` provides termination proofs for the majority of our definitions in the linker and ELF model (non-recursive definitions do not require termination proofs, and some simple recursive functions can be deduced as terminating automatically).  The referee can check whether any termination proof of e.g. `foo`, is really a termination proof by typing `thm foo.simps` in the Isabelle editor pane directly after the purported termination proof.  This will display the generated simplification theorems for the function `foo`, which is only generated by Isabelle's function package after a successful termination proof.  Moving the `thm` command up before the termination proof in question will demonstrate that this is the case, as the command will now fail.

    b. No theory file contains any `axiomatization` blocks to introduce axioms into our proof scripts, nor does any file contain any `sorry` or `oops` commands to force Isabelle to accept an incomplete or faulty proof as being complete.  Our proof is completed using only Isabelle's standard datatype, definition, and recursive function packages, and all proofs are complete.

    c. The `ELF_Relocation_Proof` file contains the correctness property which we claim it does in the paper submission.  The reviewer may check the statement of correctness by examining the `correctness` definition at the top of `ELF_Relocation_Proof`.

**NOTE**: the Isabelle extraction of the linker and ELF model is derived from a slightly older version of the Lem model than is distributed in the second component of the artefact submission, due to a need to stabilise the definitions used in the proof.  We are currently working on updating the proof to use the latest version of the model, and also generalise the proof itself to work with more relocation and machine instruction types.  This was made known to the referee's during the author rebuttal period in the primary review stage.
