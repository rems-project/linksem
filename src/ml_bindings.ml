open Error
open Utility

let read_unsigned_char bs =
  let cut, rest = Utility.partition_bitstring 8 bs in
	bitmatch cut with
		| { unsigned : 8 : littleendian } -> return (Int64.of_int unsigned, rest)
		| { _ } -> Fail "read_unsigned_char"
;;

let read_elf32_addr bs =
  let cut, rest = Utility.partition_bitstring 32 bs in
	bitmatch cut with
		| { addr : 32 : littleendian } -> return (Int64.of_int32 addr, rest)
		| { _ } -> Fail "read_elf32_addr"
;;

let read_elf32_off bs =
  let cut, rest = Utility.partition_bitstring 32 bs in
	bitmatch cut with
		| { off : 32 : littleendian } -> return (Int64.of_int32 off, rest)
		| { _ } -> Fail "read_elf32_off"
;;

let read_elf32_half bs =
  let cut, rest = Utility.partition_bitstring 16 bs in
	bitmatch cut with
		| { half : 16 : littleendian } -> return (Int64.of_int half, rest)
		| { _ } -> Fail "read_elf32_half"
;;

let read_elf32_word bs =
  let cut, rest = Utility.partition_bitstring 32 bs in
	bitmatch cut with
		| { word : 32 : littleendian } -> return (Int64.of_int32 word, rest)
		| { _ } -> Fail "read_elf32_word"
;;

let split_string_on_char strings c =
	let enum    = BatString.enum strings in
	let groups  = BatEnum.group (fun char -> char <> c) enum in
  let enums   = BatEnum.map BatString.of_enum groups in
  	BatList.of_enum enums
;;
