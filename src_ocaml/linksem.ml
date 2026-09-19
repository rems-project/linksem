(* Claude: this file is largely written by Claude (19 September 2026).

   `linksem`: a command-line front end to the linksem library, built with
   cmdliner.  Its `readelf` subcommand takes readelf's display options and
   produces, for each, output byte-identical to `readelf --wide` (binutils
   2.42), plus main_elf's `--in-out` and the DWARF dump styles.  Everything
   that traverses or formats ELF and DWARF data lives in the Lem sources
   (src/adaptors/harness_interface.lem, src/dwarf.lem); this file only
   parses the command line, selects and sequences the library's printers in
   readelf's order, and does the I/O. *)

open Cmdliner

let ( >>= ) = Error.bind

(*** the dumps ******************************************************************)

type debug_dump_style = Abbrev | Info_readelf | Raw | Resolved | Objdump | Analysis

type dump =
  | File_header
  | Section_headers
  | Section_details
  | Section_groups
  | Program_headers
  | Dynamic
  | Relocs
  | Unwind
  | Symbols
  | Dyn_syms
  | Histogram
  | Version_info
  | Debug_dump of debug_dump_style
  | Notes
  | Arch_specific
  | In_out

(* readelf's order of presentation (process_object in readelf.c): the
   section dumps requested with -x and -p come between Version_info and the
   DWARF dumps, and are handled separately *)
let dump_order = function
  | File_header -> 0 | Section_headers -> 1 | Section_details -> 1 | Section_groups -> 2
  | Program_headers -> 3 | Dynamic -> 4 | Relocs -> 5 | Unwind -> 6 | Symbols -> 7
  | Dyn_syms -> 8 | Histogram -> 9 | Version_info -> 10
  | Debug_dump Abbrev -> 12 | Debug_dump _ -> 13
  | Notes -> 14 | Arch_specific -> 15 | In_out -> 16

let string_of_reloc_type mach =
  let is m = Nat_big_num.equal mach m in
  if is Elf_header.elf_ma_ppc64 then Abi_power64_relocation.string_of_ppc64_relocation_type
  else if is Elf_header.elf_ma_386 then Abi_x86_relocation.string_of_x86_relocation_type
  else if is Elf_header.elf_ma_aarch64 then Abi_aarch64_relocation.string_of_aarch64_relocation_type
  else if is Elf_header.elf_ma_x86_64 then Abi_amd64_relocation.string_of_amd64_relocation_type
  else fun _ -> "Cannot deduce ABI"

let interpret_data_relocation mach ef symtab_map sidx rel =
  if Nat_big_num.equal mach Elf_header.elf_ma_aarch64 then
    Abi_aarch64_symbolic_relocation.aarch64_data_relocation_interpreter ef symtab_map sidx rel
  else Error.fail "Unsupported machine"

let elf_class bs0 =
  Error.repeatM' Elf_header.ei_nident bs0
    (Elf_types_native_uint.read_unsigned_char Endianness.default_endianness) >>= fun (ident, _) ->
  match List.nth_opt ident 4 with
  | None -> Error.fail "ELF ident transcription error"
  | Some c -> Error.return (Uint32_wrapper.to_bigint c)

(* the GNU and (for lack of anything better, as in main_elf) PowerPC dynamic
   tag conventions, passed to the printers that read the dynamic section *)
let os_ranges = Gnu_ext_dynamic.gnu_ext_os_additional_ranges
let os_tag = Gnu_ext_dynamic.gnu_ext_tag_correspondence_of_tag
let proc_tag64 = Abi_power64_dynamic.abi_power64_tag_correspondence_of_tag
let os_dyn64 = Gnu_ext_dynamic.gnu_ext_elf64_value_of_elf64_dyn
let proc_dyn64 = Abi_power64_dynamic.abi_power64_elf64_value_of_elf64_dyn

(* Some text to print, or None for a dump that prints nothing (as readelf does
   for -I on a file without hash tables, or -n without notes) *)
let some s = Error.return (Some s)
let text s = if s = "" then None else Some s

let dump_elf32 bs0 dump =
  let open Elf_file in
  let read = Elf_file.read_elf32_file bs0 in
  match dump with
  | File_header ->
      Elf_header.read_elf32_header bs0 >>= fun (hdr, _) ->
      some (Harness_interface.harness_string_of_elf32_file_header hdr)
  | Program_headers ->
      read >>= fun f1 ->
      get_elf32_file_section_header_string_table f1 >>= fun stbl ->
      some (Harness_interface.harness_string_of_elf32_program_headers
        Gnu_ext_program_header_table.string_of_gnu_ext_segment_type
        Nat_big_num.to_string
        f1.elf32_file_header f1.elf32_file_program_header_table f1.elf32_file_section_header_table
        stbl bs0)
  | Section_headers ->
      read >>= fun f1 ->
      get_elf32_file_section_header_string_table f1 >>= fun stbl ->
      some (Harness_interface.harness_string_of_elf32_section_headers
        Gnu_ext_section_header_table.string_of_gnu_ext_section_type
        (Harness_interface.harness_string_of_proc_section_type
           (Uint32_wrapper.to_bigint f1.elf32_file_header.Elf_header.elf32_machine))
        Harness_interface.harness_string_of_user_section_type
        f1.elf32_file_header f1.elf32_file_section_header_table stbl)
  | Relocs ->
      read >>= fun f1 ->
      let mach = Uint32_wrapper.to_bigint f1.elf32_file_header.Elf_header.elf32_machine in
      some (Harness_interface.harness_string_of_elf32_relocs f1 (string_of_reloc_type mach) bs0)
  | Symbols ->
      read >>= fun f1 ->
      some (Harness_interface.harness_string_of_elf32_syms f1 bs0)
  | Dynamic ->
      read >>= fun f1 ->
      let so = Elf_header.is_elf32_shared_object_file f1.elf32_file_header in
      some (Harness_interface.harness_string_of_elf32_dynamic_section
        f1 bs0 os_ranges os_tag os_tag
        (fun x -> Elf_dynamic.string_of_dynamic_tag so x os_ranges
                    Gnu_ext_dynamic.string_of_gnu_ext_dynamic_tag
                    (fun _ -> "proc: from main_elf"))
        Gnu_ext_dynamic.gnu_ext_elf32_value_of_elf32_dyn
        (fun _ _ -> Error.fail "proc: from main_elf"))
  | In_out ->
      read >>= fun f1 ->
      (match Elf_file.bytes_of_elf32_file f1 with
       | Error.Fail f -> some f
       | Error.Success s -> some (Harness_interface.harness_hexdump s))
  | _ -> Error.fail "not implemented for ELF32"

let dump_elf64 ~with_header file bs0 dump =
  let open Elf_file in
  let read = Elf_file.read_elf64_file bs0 in
  let machine f1 = Uint32_wrapper.to_bigint f1.elf64_file_header.Elf_header.elf64_machine in
  let section_type_namers f1 =
    ( Gnu_ext_section_header_table.string_of_gnu_ext_section_type,
      Harness_interface.harness_string_of_proc_section_type (machine f1),
      Harness_interface.harness_string_of_user_section_type ) in
  match dump with
  | File_header ->
      Elf_header.read_elf64_header bs0 >>= fun (hdr, _) ->
      some (Harness_interface.harness_string_of_elf64_file_header hdr)
  | Program_headers ->
      read >>= fun f1 ->
      get_elf64_file_section_header_string_table f1 >>= fun stbl ->
      let printer =
        if with_header then Harness_interface.harness_string_of_elf64_program_headers_body
        else Harness_interface.harness_string_of_elf64_program_headers in
      some (printer
        Gnu_ext_program_header_table.string_of_gnu_ext_segment_type
        Nat_big_num.to_string
        f1.elf64_file_header f1.elf64_file_program_header_table f1.elf64_file_section_header_table
        stbl bs0)
  | Section_headers ->
      read >>= fun f1 ->
      get_elf64_file_section_header_string_table f1 >>= fun stbl ->
      let (os, proc, usr) = section_type_namers f1 in
      let printer =
        if with_header then Harness_interface.harness_string_of_elf64_section_headers_body
        else Harness_interface.harness_string_of_elf64_section_headers in
      some (printer os proc usr f1.elf64_file_header f1.elf64_file_section_header_table stbl)
  | Section_details ->
      read >>= fun f1 ->
      get_elf64_file_section_header_string_table f1 >>= fun stbl ->
      let (os, proc, usr) = section_type_namers f1 in
      let printer =
        if with_header then Harness_interface.harness_string_of_elf64_section_details_body
        else Harness_interface.harness_string_of_elf64_section_details in
      some (printer os proc usr f1.elf64_file_header f1.elf64_file_section_header_table stbl bs0)
  | Section_groups ->
      read >>= fun f1 ->
      get_elf64_file_section_header_string_table f1 >>= fun stbl ->
      some (Harness_interface.harness_string_of_elf64_section_groups f1 stbl bs0)
  | Relocs ->
      read >>= fun f1 ->
      some (Harness_interface.harness_string_of_elf64_relocs f1 (string_of_reloc_type (machine f1)) bs0)
  | Unwind ->
      read >>= fun f1 ->
      some (Harness_interface.harness_string_of_elf64_unwind f1.elf64_file_header)
  | Symbols ->
      read >>= fun f1 ->
      some (Harness_interface.harness_string_of_elf64_syms f1 bs0 os_ranges os_tag proc_tag64 os_dyn64 proc_dyn64)
  | Dyn_syms ->
      read >>= fun f1 ->
      Error.return (text (Harness_interface.harness_string_of_elf64_dyn_syms f1 bs0 os_ranges os_tag proc_tag64 os_dyn64 proc_dyn64))
  | Histogram ->
      read >>= fun f1 ->
      Error.return (text (Harness_interface.harness_string_of_elf64_histogram f1 bs0 os_ranges os_tag proc_tag64))
  | Version_info ->
      read >>= fun f1 ->
      get_elf64_file_section_header_string_table f1 >>= fun stbl ->
      some (Harness_interface.harness_string_of_elf64_version_sections f1 stbl bs0)
  | Notes ->
      read >>= fun f1 ->
      get_elf64_file_section_header_string_table f1 >>= fun stbl ->
      Error.return (text (Harness_interface.harness_string_of_elf64_notes f1 stbl bs0))
  | Arch_specific ->
      read >>= fun f1 ->
      (match Harness_interface.harness_elf64_arch_specific_unsupported f1.elf64_file_header with
       | Some msg -> prerr_endline ("linksem: Warning: " ^ msg)
       | None -> ());
      Error.return None
  | Dynamic ->
      read >>= fun f1 ->
      let so = Elf_header.is_elf64_shared_object_file f1.elf64_file_header in
      some (Harness_interface.harness_string_of_elf64_dynamic_section
        f1 bs0 os_ranges os_tag proc_tag64
        (fun x -> Elf_dynamic.string_of_dynamic_tag so x os_ranges
                    Gnu_ext_dynamic.string_of_gnu_ext_dynamic_tag
                    Abi_power64_dynamic.string_of_abi_power64_dynamic_tag)
        os_dyn64 proc_dyn64)
  | In_out ->
      read >>= fun f1 ->
      (match Elf_file.bytes_of_elf64_file f1 with
       | Error.Fail f -> some f
       | Error.Success s -> some (Harness_interface.harness_hexdump s))
  | Debug_dump style ->
      read >>= fun f1 ->
      let mach = machine f1 in
      let interp = interpret_data_relocation mach in
      let regname = Dwarf.objdump_regname mach in
      some
        (match style with
         | Abbrev -> Dwarf.harness_string_of_elf64_debug_abbrev_like_readelf f1 interp
         | Info_readelf -> Dwarf.harness_string_of_elf64_debug_info_like_readelf f1 interp regname
         | Raw -> Dwarf.harness_string_of_elf64_debug_info_raw f1 interp
         | Resolved -> Dwarf.harness_string_of_elf64_debug_info_resolved f1 interp regname
         | Objdump ->
             let little = (Elf_header.get_elf64_header_endianness f1.elf64_file_header = Endianness.Little) in
             "\n" ^ file ^ ":     file format " ^ Dwarf.objdump_target_name_64 mach little ^ "\n\n"
             ^ Dwarf.harness_string_of_elf64_like_objdump f1 interp regname
         | Analysis -> Dwarf.harness_string_of_elf64_debug_info_section f1 interp)

(* the -x and -p dumps: the library resolves the section names or numbers,
   orders the dumps as readelf does and reports the sections that do not exist *)
let section_dumps_elf64 bs0 hex_specs string_specs =
  let open Elf_file in
  Elf_file.read_elf64_file bs0 >>= fun f1 ->
  get_elf64_file_section_header_string_table f1 >>= fun stbl ->
  Error.return (Harness_interface.harness_string_of_elf64_section_dumps f1 stbl bs0 hex_specs string_specs)

let warn msg = prerr_endline ("linksem: Warning: " ^ msg)

(* as main_elf: each dump on stdout followed by a newline, "[!]: <error>" on
   stderr for a failure; unlike main_elf, a failure gives exit status 1 *)
let readelf (dumps : dump list) (hex_specs : string list) (string_specs : string list) (file : string) : unit =
  let with_header = List.mem File_header dumps in
  let dumps =
    List.filter (fun d ->
      (* -t takes precedence over -S, and -s already shows .dynsym *)
      not (d = Section_headers && List.mem Section_details dumps)
      && not (d = Dyn_syms && List.mem Symbols dumps)) dumps in
  let dumps = List.stable_sort (fun d1 d2 -> compare (dump_order d1) (dump_order d2)) dumps in
  let ok = ref true in
  let report = function
    | Error.Success (Some "") -> ()   (* Claude: a dump with nothing to say, e.g. -s without symbol tables *)
    | Error.Success (Some s) -> print_endline s
    | Error.Success None -> ()
    | Error.Fail err -> prerr_endline ("[!]: " ^ err); ok := false in
  let run bs0 cls dump =
    if Nat_big_num.equal cls Elf_header.elf_class_32 then dump_elf32 bs0 dump
    else if Nat_big_num.equal cls Elf_header.elf_class_64 then dump_elf64 ~with_header file bs0 dump
    else Error.fail "ELF ident transcription error" in
  (match Byte_sequence.acquire file >>= fun bs0 -> elf_class bs0 >>= fun cls -> Error.return (bs0, cls) with
   | Error.Fail err -> report (Error.Fail err)
   | Error.Success (bs0, cls) ->
       let before, after = List.partition (fun d -> dump_order d <= 10) dumps in
       List.iter (fun d -> report (run bs0 cls d)) before;
       if hex_specs <> [] || string_specs <> [] then begin
         if Nat_big_num.equal cls Elf_header.elf_class_64 then
           match section_dumps_elf64 bs0 hex_specs string_specs with
           | Error.Success (texts, warnings) ->
               List.iter print_endline texts;
               List.iter warn warnings
           | Error.Fail err -> report (Error.Fail err)
         else report (Error.fail "section dumps are not implemented for ELF32")
       end;
       List.iter (fun d -> report (run bs0 cls d)) after);
  if not !ok then exit 1

(*** command line *****************************************************************)

let debug_dump_styles =
  [ ("abbrev", Abbrev); ("info", Resolved); ("info<readelf>", Info_readelf); ("info<resolved>", Resolved)
  ; ("info<raw>", Raw); ("info<objdump>", Objdump); ("info<analysis>", Analysis) ]

let readelf_cmd =
  let flag names doc = Arg.(value & flag & info names ~doc) in
  let file_header = flag ["h"; "file-header"] "Display the ELF file header." in
  let program_headers = flag ["l"; "program-headers"; "segments"] "Display the program headers." in
  let section_headers = flag ["S"; "section-headers"; "sections"] "Display the section headers." in
  let section_groups = flag ["g"; "section-groups"] "Display the section groups." in
  let section_details = flag ["t"; "section-details"] "Display the section details." in
  let headers = flag ["e"; "headers"] "Equivalent to: -h -l -S." in
  let symbols = flag ["s"; "symbols"; "syms"] "Display the symbol tables." in
  let dyn_syms = flag ["dyn-syms"] "Display the dynamic symbol table." in
  let notes = flag ["n"; "notes"] "Display the contents of note sections (if present)." in
  let relocs = flag ["r"; "relocs"] "Display the relocations (if present)." in
  let unwind = flag ["u"; "unwind"] "Display the unwind info (if present); for AArch64 this is readelf's message that it is unsupported." in
  let dynamic = flag ["d"; "dynamic"] "Display the dynamic section (if present)." in
  let version_info = flag ["V"; "version-info"] "Display the version sections (if present)." in
  let arch_specific = flag ["A"; "arch-specific"] "Display architecture specific information (if any); readelf prints none for AArch64 and x86." in
  let histogram = flag ["I"; "histogram"] "Display histogram of bucket list lengths." in
  let all = flag ["a"; "all"] "Equivalent to: -h -l -S -g -s -r -u -d -V -A -I -n (as readelf actually does)." in
  let hex_dump =
    Arg.(value & opt_all string [] & info ["x"; "hex-dump"] ~docv:"SECTION"
           ~doc:"Dump the contents of section $(docv) (a number or a name) as bytes.") in
  let string_dump =
    Arg.(value & opt_all string [] & info ["p"; "string-dump"] ~docv:"SECTION"
           ~doc:"Dump the contents of section $(docv) (a number or a name) as strings.") in
  let in_out = flag ["in-out"] "Re-serialise the file and display it as a hex dump (as hexdump -v)." in
  let wide = flag ["W"; "wide"] "Accepted for compatibility with readelf; the output is always in readelf's wide format." in
  let debug_dump =
    let doc =
      "Display DWARF debugging information.  $(docv) is a comma-separated list of: $(b,abbrev) \
       (.debug_abbrev as readelf and objdump print it); $(b,info<readelf>) (.debug_info as \
       $(b,readelf --debug-dump=info) prints it without $(b,--wide)); $(b,info<objdump>) (.debug_abbrev \
       and .debug_info, byte-identical to $(b,objdump --dwarf=abbrev,info)); $(b,info) or \
       $(b,info<resolved>) (linksem's DIE tree with strings, references, types, files, expressions \
       and location/range lists resolved); $(b,info<raw>) (exactly what the parser stored); \
       $(b,info<analysis>) (linksem's full DWARF analysis: DIE tree, frame, line, location and \
       inlined-subroutine information).  The angle brackets need quoting from the shell.  ELF64 only." in
    Arg.(value & opt_all (list (enum debug_dump_styles)) [] & info ["debug-dump"] ~docv:"STYLES" ~doc) in
  let file = Arg.(required & pos 0 (some file) None & info [] ~docv:"FILE" ~doc:"The ELF file.") in
  let select h l s g t e y dy n r u d v a i all x p io dd _wide file =
    let picks =
      List.filter_map (fun (b, d) -> if b then Some d else None)
        (* readelf's -a also displays section groups, unwind information and notes *)
        [ (h || e || all, File_header); (l || e || all, Program_headers); (s || e || all, Section_headers)
        ; (g || all, Section_groups); (t, Section_details); (y || all, Symbols); (dy, Dyn_syms); (n || all, Notes)
        ; (r || all, Relocs); (u || all, Unwind); (d || all, Dynamic); (v || all, Version_info)
        ; (a || all, Arch_specific); (i || all, Histogram); (io, In_out) ]
      @ List.map (fun st -> Debug_dump st) (List.concat dd) in
    match picks, x, p with
    | [], [], [] -> `Error (true, "no dump requested: give at least one of the display options")
    | _ -> `Ok (readelf picks x p file) in
  let doc = "display information about an ELF file, in the format of readelf --wide" in
  let man = [
    `S Manpage.s_description;
    `P "Reads $(i,FILE) with the linksem ELF and DWARF library and prints the requested \
        information.  For each readelf-style option the output is intended to be byte-identical \
        to $(b,readelf -W) (binutils 2.42) with the same option on the same file, so that the two \
        can be compared with $(b,diff).  Several options may be combined; the dumps are printed in \
        readelf's order, with the same adjustments readelf makes (for example $(b,-h) suppresses \
        the summary lines of $(b,-l) and $(b,-S)).  Only $(b,-h -l -S -r -s -d --in-out) are \
        implemented for ELF32 files.";
    `S "LIMITATIONS";
    `P "readelf's decoding of ARM, IA-64 and PA-RISC unwind tables and of the attribute sections \
        of ARM, RISC-V, MIPS, PowerPC and other machines ($(b,-u), $(b,-A)) is not reproduced; \
        core-file notes are named only for the common note types; $(b,--debug-dump) has readelf's \
        format only for $(b,abbrev) and the non-wide $(b,info).";
    `S Manpage.s_examples;
    `P "$(mname) readelf --section-headers kvm_nvhe.o";
    `P "$(mname) readelf -x .rodata -p .comment kvm_nvhe.o";
    `P "$(mname) readelf '--debug-dump=abbrev,info<readelf>' kvm_nvhe.o | diff - <(readelf --debug-dump=abbrev,info kvm_nvhe.o)";
  ] in
  Cmd.v (Cmd.info "readelf" ~doc ~man)
    Term.(ret (const select $ file_header $ program_headers $ section_headers $ section_groups
               $ section_details $ headers $ symbols $ dyn_syms $ notes $ relocs $ unwind $ dynamic
               $ version_info $ arch_specific $ histogram $ all $ hex_dump $ string_dump $ in_out
               $ debug_dump $ wide $ file))

let main_cmd =
  let doc = "the linksem ELF and DWARF library, from the command line" in
  let man = [
    `S Manpage.s_description;
    `P "linksem is a formal model of ELF and DWARF, written in Lem.  This tool exposes its \
        readers and printers for testing and for cross-checking against the binutils.";
  ] in
  Cmd.group (Cmd.info "linksem" ~version:Version.version ~doc ~man) [readelf_cmd]

let () = exit (Cmd.eval main_cmd)
