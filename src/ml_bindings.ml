open Error
open Utility

let read_unsigned_char bs =
  let cut, rest = Utility.partition_bitstring 32 bs in
	bitmatch cut with
		| { unsigned : 32 : littleendian } -> return (unsigned, rest)
		| { _ } -> Error "read_unsigned_char"
;;

let read_elf32_addr bs
  let cut, rest = Utility.partition_bitstring 32 bs in
	bitmatch cut with
		| { addr : 32 : littleendian } -> return (addr, rest)
		| { _ } -> Error "read_elf32_addr"
;;

let read_elf32_half bs =
  let cut, rest = Utility.partition_bitstring 16 bs in
	bitmatch cut with
		| { half : 16 : littleendian } -> return (half, rest)
		| { _ } -> Error "read_unsigned_char"
;;

let read_elf32_word bs =
  let cut, rest = Utility.partition_bitstring 32 bs in
	bitmatch cut with
		| { word : 32 : littleendian } -> return (word, rest)
		| { _ } -> Error "read_unsigned_char"
;;
