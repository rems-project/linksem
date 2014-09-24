open Elf_header
open Elf_section

open Error_monad

open Bitstring

let read_elf32_string_table hdr sections bitstring =
	let index = Int64.to_int hdr.e_shstrndx in
		if index > List.length sections then
			Error "read_elf32_string_table: string table index too large"
		else
			let string_table = List.nth sections index in
			let offset       = Int64.to_int string_table.sh_offset in
			let size         = Int64.to_int string_table.sh_size in
			let _, initial   = Utility.partition_bitstring (offset * 8) bitstring in
			let relevant, _  = Utility.partition_bitstring (size * 8) initial in
				return relevant
;;

let get_strings_of_string_table bitstring =
	let strings = Bitstring.string_of_bitstring bitstring in
	let enum    = BatString.enum strings in
	let groups  = BatEnum.group (fun char -> char <> '\000') enum in
  let enums   = BatEnum.map BatString.of_enum groups in
  	BatList.of_enum enums
;;
