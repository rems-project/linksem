# Claude: the instructions given for the `dwarf/` validation harness, verbatim

Claude: the owner's instructions for the `linksem readelf` tool and the
`validation/dwarf/` harness, as given in the conversations of 19 September
2026, in order (recovered from the session transcripts on 30 September 2026,
when he asked that every linksem validation directory keep the prompts and
general rules it was built under).  The plan they led to is
`../../../notes/notes006-2026-09-19-dwarf-validation-plan.md`, and the issues
found and fixed are in `../../../notes/notes007-2026-09-19-linksem-issues-from-validation.md`.
The general rules are in `notes002-2026-09-30-general-instructions.md`.

1. (2026-09-19 08:50) Now return to cross-checking linksem against readelf/objdump/dwarfdump.  Leaving all the linksem lem definitions in src/ unchanged, add a new src_ocaml/ directory containing a new top-level `linksem`, written with the ocaml cmdliner package, that implements a command `linksem readelf` with the same flags and behaviour as `main_elf.lem`. For those flags, the output should be byte-identical to the corresponding output of readelf (with --wide), as before.

2. (2026-09-19 09:11) Commit that.

3. (2026-09-19 09:13) Are there any additional readelf flags that could straightforwardly be supported by `linksem readelf`, without changes (or with only very small changes) to the src/*.lem files?

4. (2026-09-19 09:21) Do the Essentially Fre, Small, and Moderate things

5. (2026-09-19 10:15) commit these

6. (2026-09-19 10:27) in general, how do the readelf and objdump and dwarfdump reading and printing of dwarf differ?

7. (2026-09-19 10:46) what test suites do other people use for checking binutils, llvm-dwarfdump, and libdwarf on?

8. (2026-09-19 10:49) what did the linksem paper (in OOPSLA) and repository use for testing?

9. (2026-09-19 11:00) Write a plan to write scripts, in appropriate subdirectories of validation, to fetch from the web all the relevant tests from the above: binutils/testuite/binutils-all, llvm/test/DebugInfo, llvm/test/tools/llvm-dwarfdump, llvm/unittests/DebugInfo/DWARF, libdwarf-regressiontests, elfutils.  And to compare `linksem readelf` against the appropriate other tools for all those, to check both the parsing of dwarf data and the pretty-printing of it, reporting the results sensibly - both to see the overall results and to be support later debugging of any discrepencies.  Because the tools have slightly different output formats, we expect to add other subcommands to linksem (eg `linksem dwarfdump`, `linksem llvm-dwarfdump`) and add flags to the existing pretty printers in dwarf.lem to lightly adapt their behaviour as needed (eg to match the indentation used by each tool).

10. (2026-09-19 11:29) do that

11. (2026-09-19 11:31) Add explanation of what's useful to test and why, if you didn't already.  Test both object files and fully linked binaries, where feasible.  FOr the LICENSE test, prepend "apart from that, " to the last clause.

12. (2026-09-19 13:39) For the LICENCE text, I should have said "apart from the message texts and name tables, they contain no source copied from binutils".  And you have to stick to that, unless there's a _very_ good reason otherwise, in which case you must ask.

13. (2026-09-19 13:46) Additionally: while testing, incrementally accumulate a list of the issues in linksem/src/*.lem that need to be fixed, clustering related issues together, and describing the minimal clean fix (in the style of the existing definitions).  Report progress every few minutes
   
   === 508b4ffa: 33 user turns

14. (2026-09-19 14:46) Mark B13 and A13 as deferred for now. Commit the notes. Then apply all these fixes, commiting (after sanity checking) each one separately, so we can figure out which was responsible if we later discover that one was broken.

15. (2026-09-19 17:01) move the name-table generators into validation/common and commit those.  Then commit the validation harness and an overall commit with a message including (a) a brief summary of all this work, then (b) your message above (Notes/Fixes/Verification and the first of the Two things to know, then (c) the whole of notes007.

16. (2026-09-19 17:04) make a reworked version of quickcheck.py and commit that, before the "overall commit"

17. (2026-09-19 17:09) The commit messages should not refer to re-readdwarf-experiments for notes.  Instead, notes007 should move to linksem/notes

18. (2026-09-19 17:13) yes, move notes006-2026-09-19-dwarf-validation-plan.md likewise

19. (2026-09-19 17:51) ❯ FYI: I've moved re-readdwarf-experiments to readdwarf-private-3
   
   === 842a9479: 9 user turns
