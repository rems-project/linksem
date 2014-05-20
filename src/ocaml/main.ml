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
    Elf_header.read_elf32_header bitstream >>= fun (header, bitstream') ->
    let size, entry_size = Elf_header.get_program_header_table_size_and_entries header in
    Elf_program_header_table.read_elf32_program_header_table size entry_size bitstream' >>= fun (ptbl, bitstream'') ->
    	if Elf_header.is_section_header_table_present header then
		    let size, entry_size, offset = Elf_header.get_section_header_table_size_entries_and_offset header in
    			Elf_section.read_elf32_section_header_table size entry_size offset bitstream >>= fun (sections, bitstream''') ->
    			Elf_string_table.read_elf32_string_table header sections bitstream >>= fun string_table ->
    			let strings = Elf_string_table.get_strings_of_string_table string_table in
    			Elf_symbol_tables.read_elf32_symbol_tables sections bitstream >>= fun symbol_tables ->
    			return symbol_tables
    	else
    		return []
  in
    match parse with
      | Error err -> failwith err
      | Success s ->
      	let mapped = List.map Elf_symbol_tables.string_of_symbol_table_entry s in
      	let concat = BatString.concat "\n\n" mapped in
      		Printf.printf "%s\n" concat
;;
  
