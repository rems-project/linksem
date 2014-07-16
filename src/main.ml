open Error
open Pre_main
open Elf

let acquire_bitstring =
	let path_to_target = "/usr/bin/ld" in
  try
    let bitstring = Bitstring.bitstring_of_file path_to_target in
    return bitstring
  with _ ->
    Fail ("acquire_bitstring: cannot open file" ^ path_to_target)

let _ =
	let _ = Printf.printf "Starting...\n" in
	let result = acquire_bitstring >>= read_elf32 in
		match result with
			| Fail err  -> Printf.printf "Fail\n%s\n" err
			| Success s ->	Printf.printf "Success\n%s\n" (string_of_elf32 s)
