open Error_monad

let obtain_bitstream =
  let path_to_target = "/usr/bin/ld" in
  try
    let bitstream = Bitstring.bitstring_of_file path_to_target in
    return bitstream
  with _ ->
    Error "Cannot open file"

let _ =
  let parse =
    obtain_bitstream >>= fun bitstream ->
    Elf_header.read_elf32_header bitstream >>= fun (header, bitstream) ->
    let size, entry_size = Elf_header.get_program_header_table_size_and_entries header in
    Elf_program_header_table.read_elf32_program_header_table size entry_size bitstream >>= fun (ptbl, bitstream) ->
    let size, entry_size = Elf_header.get_section_size_and_entries header in
    Elf_section.read_elf32_sections size entry_size bitstream >>= fun (sections, bitstream) ->
    return sections
  in
    match parse with
      | Error err -> failwith err
      | Success s -> Printf.printf "%s\n" (Elf_section.string_of_elf_sections s)
;;
  
