open Error
open Pre_main

let acquire_bitstring =
	let path_to_target = "/usr/bin/ld" in
  try
    let bitstring = Bitstring.bitstring_of_file path_to_target in
    return bitstring
  with _ ->
    Fail ("acquire_bitstring: cannot open file" ^ path_to_target)

let _ =
	let _ = Printf.printf "Starting...\n" in
	let result =
		acquire_bitstring >>= fun bs0 ->
		Elf_header.read_elf32_elf_header bs0 >>= fun (elf_header, bs1) ->
		let size, entry_size = Elf_header.program_header_table_size_and_entry_size elf_header in
		Elf_program_header_table.read_elf32_program_header_table (size * entry_size) bs1 >>= fun (program_header_table, bs2) ->
		return program_header_table
	in
		match result with
			| Fail err  -> Printf.printf "Fail: %s\n" err
			| Success s ->	Printf.printf "%s\n" (display s)
