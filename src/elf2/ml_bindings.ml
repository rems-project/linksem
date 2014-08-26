open Endianness
open Error

let decimal_string_of_int64 e =
  let i = Int64.to_int e in
    string_of_int i
;;

let hex_string_of_int64 (e : Int64.t) : string =
  let i = Int64.to_int e in
    Printf.sprintf "0x%x" i
;;

let partition_bitstring size bitstring =
    Bitstring.takebits size bitstring, Bitstring.dropbits size bitstring
;;

let acquire_bitstring path_to_target =
  try
    let bitstring = Bitstring.bitstring_of_file path_to_target in
    return bitstring
  with _ ->
    Fail ("acquire_bitstring: cannot open file" ^ path_to_target)

let read_unsigned_char_le bs rest =
  bitmatch bs with
    | { unsigned : 8 : littleendian } -> return (Int64.of_int unsigned, rest)
    | { _ } -> Fail "read_unsigned_char_le"
;;

let read_unsigned_char_be bs rest =
  bitmatch bs with
    | { unsigned : 8 : bigendian } -> return (Int64.of_int unsigned, rest)
    | { _ } -> Fail "read_unsigned_char_be"
;;

let read_unsigned_char endian bs =
  let cut, rest = partition_bitstring 8 bs in
    match endian with
      | Little -> read_unsigned_char_le cut rest
      | Big    -> read_unsigned_char_be cut rest
;;

let read_elf32_addr_le bs rest =
  bitmatch bs with
    | { addr : 32 : littleendian } -> return (Int64.of_int32 addr, rest)
    | { _ } -> Fail "read_elf32_addr_le"
;;

let read_elf32_addr_be bs rest =
  bitmatch bs with
    | { addr : 32 : bigendian } -> return (Int64.of_int32 addr, rest)
    | { _ } -> Fail "read_elf32_addr_be"
;;

let read_elf32_addr endian bs =
  let cut, rest = partition_bitstring 32 bs in
  	match endian with
      | Little -> read_elf32_addr_le cut rest
      | Big    -> read_elf32_addr_be cut rest
;;

let read_elf32_off_le bs rest =
  bitmatch bs with
    | { off : 32 : littleendian } -> return (Int64.of_int32 off, rest)
    | { _ } -> Fail "read_elf32_off_le"
;;

let read_elf32_off_be bs rest =
  bitmatch bs with
    | { off : 32 : bigendian } -> return (Int64.of_int32 off, rest)
    | { _ } -> Fail "read_elf32_off_be"
;;

let read_elf32_off endian bs =
  let cut, rest = partition_bitstring 32 bs in
    match endian with
      | Little -> read_elf32_off_le cut rest
      | Big    -> read_elf32_off_be cut rest
;;

let read_elf32_half_le bs rest =
  bitmatch bs with
    | { half : 16 : littleendian } -> return (Int64.of_int half, rest)
    | { _ } -> Fail "read_elf32_half_le"
;;

let read_elf32_half_be bs rest =
  bitmatch bs with
    | { half : 16 : bigendian } -> return (Int64.of_int half, rest)
    | { _ } -> Fail "read_elf32_half_be"
;;

let read_elf32_half endian bs =
  let cut, rest = partition_bitstring 16 bs in
    match endian with
      | Little -> read_elf32_half_le cut rest
      | Big    -> read_elf32_half_be cut rest
;;

let read_elf32_word_le bs rest =
  bitmatch bs with
    | { word : 32 : littleendian } -> return (Int64.of_int32 word, rest)
    | { _ } -> Fail "read_elf32_word_le"
;;

let read_elf32_word_be bs rest =
  bitmatch bs with
    | { word : 32 : bigendian } -> return (Int64.of_int32 word, rest)
    | { _ } -> Fail "read_elf32_word_be"
;;

let read_elf32_word endian bs =
  let cut, rest = partition_bitstring 32 bs in
    match endian with
      | Little -> read_elf32_word_le cut rest
      | Big    -> read_elf32_word_be cut rest
;;

let split_string_on_char strings c =
  let enum    = BatString.enum strings in
  let groups  = BatEnum.group (fun char -> char <> c) enum in
  let enums   = BatEnum.map BatString.of_enum groups in
  	BatList.of_enum enums
;;