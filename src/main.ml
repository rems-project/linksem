open Error

open Elf_header

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
		acquire_bitstring >>= fun bs ->
		read_elf32_elf_header bs
	in
		match result with
			| Success s -> Printf.printf "success...\n"
			| Fail err -> Printf.printf "%s\n" err
