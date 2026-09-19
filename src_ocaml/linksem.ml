(* Claude: this file is largely written by Claude (19 September 2026).

   `linksem`: a command-line front end to the linksem library, built with
   cmdliner.  Its `readelf` subcommand has the same flags and behaviour as
   src/main_elf.lem (whose Lem definitions are left unchanged): for each of
   the readelf-style flags the output is intended to be byte-identical to
   `readelf --wide` with the same flag, and the DWARF dumps and the
   `--in-out` hex dump are as main_elf produces them.  The library calls
   below are exactly those of main_elf.lem. *)

open Cmdliner

let ( >>= ) = Error.bind

(*** the dumps ******************************************************************)

type debug_dump_style = Raw | Resolved | Objdump | Analysis

type dump =
  | File_header
  | Program_headers
  | Section_headers
  | Relocs
  | Symbols
  | Dynamic
  | In_out
  | Debug_dump of debug_dump_style

(* readelf's own order of presentation, used when several dumps are requested *)
let dump_order = function
  | File_header -> 0 | Section_headers -> 1 | Program_headers -> 2 | Dynamic -> 3
  | Relocs -> 4 | Symbols -> 5 | In_out -> 6 | Debug_dump _ -> 7

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

(* the --in-out hex dump, in the format of `hexdump -v`: 16 bytes per line as
   eight little-endian byte pairs, short final line padded with blank fields,
   then a final line with the total length *)
let hexdump bs : string =
  let bytes =
    Array.of_list
      (List.map (fun b -> Nat_big_num.to_int (Elf_types_native_uint.natural_of_byte b))
         (Byte_sequence.byte_list_of_byte_sequence bs)) in
  let n = Array.length bytes in
  let buf = Buffer.create (3 * n + 16) in
  let rec row off =
    if off >= n then Buffer.add_string buf (Printf.sprintf "%07x" n)
    else begin
      let k = min 16 (n - off) in
      let pairs = (k + 1) / 2 in
      let group g =
        let i = off + 2 * g in
        if i + 1 < off + k then Printf.sprintf "%02x%02x" bytes.(i + 1) bytes.(i)
        else Printf.sprintf "00%02x" bytes.(i) in
      let fields = List.init pairs group in
      let fields =
        if k = 16 then fields
        else fields @ [String.concat " " (List.init (8 - pairs) (fun _ -> "    "))] in
      Buffer.add_string buf (Printf.sprintf "%07x %s\n" off (String.concat " " fields));
      row (off + 16)
    end in
  row 0;
  Buffer.contents buf

let elf_class bs0 =
  Error.repeatM' Elf_header.ei_nident bs0
    (Elf_types_native_uint.read_unsigned_char Endianness.default_endianness) >>= fun (ident, _) ->
  match List.nth_opt ident 4 with
  | None -> Error.fail "ELF ident transcription error"
  | Some c -> Error.return (Uint32_wrapper.to_bigint c)

let dump_elf32 bs0 dump =
  let open Elf_file in
  let read = Elf_file.read_elf32_file bs0 in
  match dump with
  | File_header ->
      Elf_header.read_elf32_header bs0 >>= fun (hdr, _) ->
      Error.return (Harness_interface.harness_string_of_elf32_file_header hdr)
  | Program_headers ->
      read >>= fun f1 ->
      get_elf32_file_section_header_string_table f1 >>= fun stbl ->
      Error.return (Harness_interface.harness_string_of_elf32_program_headers
        Gnu_ext_program_header_table.string_of_gnu_ext_segment_type
        Nat_big_num.to_string
        f1.elf32_file_header f1.elf32_file_program_header_table f1.elf32_file_section_header_table
        stbl bs0)
  | Section_headers ->
      read >>= fun f1 ->
      get_elf32_file_section_header_string_table f1 >>= fun stbl ->
      Error.return (Harness_interface.harness_string_of_elf32_section_headers
        Gnu_ext_section_header_table.string_of_gnu_ext_section_type
        (Harness_interface.harness_string_of_proc_section_type
           (Uint32_wrapper.to_bigint f1.elf32_file_header.Elf_header.elf32_machine))
        Harness_interface.harness_string_of_user_section_type
        f1.elf32_file_header f1.elf32_file_section_header_table stbl)
  | Relocs ->
      read >>= fun f1 ->
      let mach = Uint32_wrapper.to_bigint f1.elf32_file_header.Elf_header.elf32_machine in
      Error.return (Harness_interface.harness_string_of_elf32_relocs f1 (string_of_reloc_type mach) bs0)
  | Symbols ->
      read >>= fun f1 ->
      Error.return (Harness_interface.harness_string_of_elf32_syms f1 bs0)
  | Dynamic ->
      read >>= fun f1 ->
      let so = Elf_header.is_elf32_shared_object_file f1.elf32_file_header in
      Error.return (Harness_interface.harness_string_of_elf32_dynamic_section
        f1 bs0
        Gnu_ext_dynamic.gnu_ext_os_additional_ranges
        Gnu_ext_dynamic.gnu_ext_tag_correspondence_of_tag
        Gnu_ext_dynamic.gnu_ext_tag_correspondence_of_tag
        (fun x -> Elf_dynamic.string_of_dynamic_tag so x
                    Gnu_ext_dynamic.gnu_ext_os_additional_ranges
                    Gnu_ext_dynamic.string_of_gnu_ext_dynamic_tag
                    (fun _ -> "proc: from main_elf"))
        Gnu_ext_dynamic.gnu_ext_elf32_value_of_elf32_dyn
        (fun _ _ -> Error.fail "proc: from main_elf"))
  | In_out ->
      read >>= fun f1 ->
      (match Elf_file.bytes_of_elf32_file f1 with
       | Error.Fail f -> Error.return f
       | Error.Success s -> Error.return (hexdump s))
  | Debug_dump _ -> Error.fail "not implemented"

let dump_elf64 file bs0 dump =
  let open Elf_file in
  let read = Elf_file.read_elf64_file bs0 in
  let machine f1 = Uint32_wrapper.to_bigint f1.elf64_file_header.Elf_header.elf64_machine in
  match dump with
  | File_header ->
      Elf_header.read_elf64_header bs0 >>= fun (hdr, _) ->
      Error.return (Harness_interface.harness_string_of_elf64_file_header hdr)
  | Program_headers ->
      read >>= fun f1 ->
      get_elf64_file_section_header_string_table f1 >>= fun stbl ->
      Error.return (Harness_interface.harness_string_of_elf64_program_headers
        Gnu_ext_program_header_table.string_of_gnu_ext_segment_type
        Nat_big_num.to_string
        f1.elf64_file_header f1.elf64_file_program_header_table f1.elf64_file_section_header_table
        stbl bs0)
  | Section_headers ->
      read >>= fun f1 ->
      get_elf64_file_section_header_string_table f1 >>= fun stbl ->
      Error.return (Harness_interface.harness_string_of_elf64_section_headers
        Gnu_ext_section_header_table.string_of_gnu_ext_section_type
        (Harness_interface.harness_string_of_proc_section_type (machine f1))
        Harness_interface.harness_string_of_user_section_type
        f1.elf64_file_header f1.elf64_file_section_header_table stbl)
  | Relocs ->
      read >>= fun f1 ->
      Error.return (Harness_interface.harness_string_of_elf64_relocs f1 (string_of_reloc_type (machine f1)) bs0)
  | Symbols ->
      read >>= fun f1 ->
      Error.return (Harness_interface.harness_string_of_elf64_syms
        f1 bs0
        Gnu_ext_dynamic.gnu_ext_os_additional_ranges
        Gnu_ext_dynamic.gnu_ext_tag_correspondence_of_tag
        Abi_power64_dynamic.abi_power64_tag_correspondence_of_tag (* ABI! *)
        Gnu_ext_dynamic.gnu_ext_elf64_value_of_elf64_dyn
        Abi_power64_dynamic.abi_power64_elf64_value_of_elf64_dyn) (* ABI! *)
  | Dynamic ->
      read >>= fun f1 ->
      let so = Elf_header.is_elf64_shared_object_file f1.elf64_file_header in
      Error.return (Harness_interface.harness_string_of_elf64_dynamic_section
        f1 bs0
        Gnu_ext_dynamic.gnu_ext_os_additional_ranges
        Gnu_ext_dynamic.gnu_ext_tag_correspondence_of_tag
        Abi_power64_dynamic.abi_power64_tag_correspondence_of_tag (* ABI! *)
        (fun x -> Elf_dynamic.string_of_dynamic_tag so x
                    Gnu_ext_dynamic.gnu_ext_os_additional_ranges
                    Gnu_ext_dynamic.string_of_gnu_ext_dynamic_tag
                    Abi_power64_dynamic.string_of_abi_power64_dynamic_tag)
        Gnu_ext_dynamic.gnu_ext_elf64_value_of_elf64_dyn
        Abi_power64_dynamic.abi_power64_elf64_value_of_elf64_dyn) (* ABI! *)
  | In_out ->
      read >>= fun f1 ->
      (match Elf_file.bytes_of_elf64_file f1 with
       | Error.Fail f -> Error.return f
       | Error.Success s -> Error.return (hexdump s))
  | Debug_dump style ->
      read >>= fun f1 ->
      let mach = machine f1 in
      let interp = interpret_data_relocation mach in
      Error.return
        (match style with
         | Raw -> Dwarf.harness_string_of_elf64_debug_info_raw f1 interp
         | Resolved ->
             Dwarf.harness_string_of_elf64_debug_info_resolved f1 interp (Dwarf.objdump_regname mach)
         | Objdump ->
             let little = (Elf_header.get_elf64_header_endianness f1.elf64_file_header = Endianness.Little) in
             "\n" ^ file ^ ":     file format " ^ Dwarf.objdump_target_name_64 mach little ^ "\n\n"
             ^ Dwarf.harness_string_of_elf64_like_objdump f1 interp (Dwarf.objdump_regname mach)
         | Analysis -> Dwarf.harness_string_of_elf64_debug_info_section f1 interp)

let run_dump file bs0 dump =
  elf_class bs0 >>= fun cls ->
  if Nat_big_num.equal cls Elf_header.elf_class_32 then dump_elf32 bs0 dump
  else if Nat_big_num.equal cls Elf_header.elf_class_64 then dump_elf64 file bs0 dump
  else Error.fail "ELF ident transcription error"

(* as main_elf: the dump on stdout, or "[!]: <error>" on stderr; unlike
   main_elf, a failure gives a non-zero exit status *)
let readelf (dumps : dump list) (file : string) : unit =
  let dumps = List.stable_sort (fun d1 d2 -> compare (dump_order d1) (dump_order d2)) dumps in
  let ok = ref true in
  List.iter
    (fun dump ->
      match Byte_sequence.acquire file >>= fun bs0 -> run_dump file bs0 dump with
      | Error.Success s -> print_endline s
      | Error.Fail err -> prerr_endline ("[!]: " ^ err); ok := false)
    dumps;
  if not !ok then exit 1

(*** command line *****************************************************************)

let debug_dump_styles =
  [ ("info", Resolved); ("info<resolved>", Resolved); ("info<raw>", Raw);
    ("info<objdump>", Objdump); ("info<analysis>", Analysis) ]

let readelf_cmd =
  let flag names doc = Arg.(value & flag & info names ~doc) in
  let file_header = flag ["h"; "file-header"] "Display the ELF file header (as readelf -W --file-header)." in
  let program_headers = flag ["l"; "program-headers"; "segments"] "Display the program headers (as readelf -W --program-headers)." in
  let section_headers = flag ["S"; "section-headers"; "sections"] "Display the section headers (as readelf -W --section-headers)." in
  let relocs = flag ["r"; "relocs"] "Display the relocations (as readelf -W --relocs)." in
  let symbols = flag ["s"; "symbols"; "syms"] "Display the symbol tables (as readelf -W --symbols)." in
  let dynamic = flag ["d"; "dynamic"] "Display the dynamic section (as readelf -W --dynamic)." in
  let in_out = flag ["in-out"] "Re-serialise the file and display it as a hex dump (as hexdump -v)." in
  let wide = flag ["W"; "wide"] "Accepted for compatibility with readelf; the output is always in readelf's wide format." in
  let debug_dump =
    let doc =
      "Display the DWARF .debug_info section.  $(docv) is $(b,info) or $(b,info<resolved>) \
       (the DIE tree with strings, references, types, files, expressions and location/range \
       lists resolved), $(b,info<raw>) (exactly what the parser stored, nothing resolved), \
       $(b,info<objdump>) (.debug_info and .debug_abbrev, byte-identical to \
       $(b,objdump --dwarf=abbrev,info)), or $(b,info<analysis>) (linksem's full DWARF analysis: \
       DIE tree, frame, line, location and inlined-subroutine information).  The angle brackets \
       need quoting from the shell.  ELF64 only." in
    Arg.(value & opt (some (enum debug_dump_styles)) None & info ["debug-dump"] ~docv:"STYLE" ~doc) in
  let file = Arg.(required & pos 0 (some file) None & info [] ~docv:"FILE" ~doc:"The ELF file.") in
  let select h l s r y d io dd _wide file =
    let dumps =
      List.filter_map (fun (b, d) -> if b then Some d else None)
        [ (h, File_header); (l, Program_headers); (s, Section_headers); (r, Relocs);
          (y, Symbols); (d, Dynamic); (io, In_out) ]
      @ (match dd with Some style -> [Debug_dump style] | None -> []) in
    match dumps with
    | [] -> `Error (true, "no dump requested: give at least one of the display options")
    | _ -> `Ok (readelf dumps file) in
  let doc = "display information about an ELF file, in the format of readelf --wide" in
  let man = [
    `S Manpage.s_description;
    `P "Reads $(i,FILE) with the linksem ELF and DWARF library and prints the requested \
        information.  For each of the readelf-style options the output is intended to be \
        byte-identical to $(b,readelf -W) with the same option on the same file, so that \
        the two can be compared with $(b,diff).  When several options are given the dumps \
        are printed in readelf's order, each as it would be printed on its own.";
    `S Manpage.s_examples;
    `P "$(mname) readelf --section-headers kvm_nvhe.o";
    `P "$(mname) readelf '--debug-dump=info<objdump>' kvm_nvhe.o | diff - <(objdump --dwarf=abbrev,info kvm_nvhe.o)";
  ] in
  Cmd.v (Cmd.info "readelf" ~doc ~man)
    Term.(ret (const select $ file_header $ program_headers $ section_headers $ relocs $ symbols
               $ dynamic $ in_out $ debug_dump $ wide $ file))

let main_cmd =
  let doc = "the linksem ELF and DWARF library, from the command line" in
  let man = [
    `S Manpage.s_description;
    `P "linksem is a formal model of ELF and DWARF, written in Lem.  This tool exposes its \
        readers and printers for testing and for cross-checking against the binutils.";
  ] in
  Cmd.group (Cmd.info "linksem" ~version:Version.version ~doc ~man) [readelf_cmd]

let () = exit (Cmd.eval main_cmd)
