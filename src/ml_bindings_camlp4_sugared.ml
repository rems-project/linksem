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

let bitstring_length bs =
  Big_int.big_int_of_int (Bitstring.bitstring_length bs)
;;

let create_bitstring len =
  if Big_int.is_int_big_int len then
    Bitstring.create_bitstring (Big_int.int_of_big_int len)
  else
    failwith "create_bitstring: length too big"

let make_bitstring len cs =
  if Big_int.is_int_big_int len then
    Bitstring.make_bitstring (Big_int.int_of_big_int len) cs
  else
    failwith "make_bitstring: length too big"

let partition_bitstring size bitstring =
  if Big_int.is_int_big_int size then
    let cut = Big_int.int_of_big_int size in
      Bitstring.takebits cut bitstring, Bitstring.dropbits cut bitstring
  else
    failwith "partition_bitstring: size too large"
;;

let acquire_bitstring path_to_target =
  try
    let bitstring = Bitstring.bitstring_of_file path_to_target in
    return bitstring
  with _ ->
    Fail ("acquire_bitstring: cannot open file" ^ path_to_target)

(** Unsigned char type *)

let read_unsigned_char_le bs rest =
  bitmatch bs with
    | { unsigned : 8 : littleendian } -> return (Uint32.of_int unsigned, rest)
    | { _ } -> Fail "read_unsigned_char_le"
;;

let read_unsigned_char_be bs rest =
  bitmatch bs with
    | { unsigned : 8 : bigendian } -> return (Uint32.of_int unsigned, rest)
    | { _ } -> Fail "read_unsigned_char_be"
;;

let read_unsigned_char endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 8) bs in
    match endian with
      | Little -> read_unsigned_char_le cut rest
      | Big    -> read_unsigned_char_be cut rest
;;

(** ELF address type:
  * 4 byte unsigned type on 32-bit architectures.
  * 8 byte unsigned type on 64-bit architectures.
  *)

let read_elf32_addr_le bs rest =
  bitmatch bs with
    | { addr : 32 : littleendian } -> return (Uint32.of_int32 addr, rest)
    | { _ } -> Fail "read_elf32_addr_le"
;;

let read_elf32_addr_be bs rest =
  bitmatch bs with
    | { addr : 32 : bigendian } -> return (Uint32.of_int32 addr, rest)
    | { _ } -> Fail "read_elf32_addr_be"
;;

let read_elf32_addr endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 32) bs in
  	match endian with
      | Little -> read_elf32_addr_le cut rest
      | Big    -> read_elf32_addr_be cut rest
;;

let read_elf64_addr_le bs rest =
  bitmatch bs with
    | { addr : 64 : littleendian } -> return (Uint64.of_int64 addr, rest)
    | { _ } -> Fail "read_elf64_addr_le"
;;

let read_elf64_addr_be bs rest =
  bitmatch bs with
    | { addr : 64 : bigendian } -> return (Uint64.of_int64 addr, rest)
    | { _ } -> Fail "read_elf64_addr_be"
;;

let read_elf64_addr endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 64) bs in
    match endian with
      | Little -> read_elf64_addr_le cut rest
      | Big    -> read_elf64_addr_be cut rest
;;

(** ELF offset type:
  * 4 byte unsigned type on 32-bit architectures.
  * 8 byte unsigned type on 64-bit architectures.
  *)
let read_elf32_off_le bs rest =
  bitmatch bs with
    | { off : 32 : littleendian } -> return (Uint32.of_int32 off, rest)
    | { _ } -> Fail "read_elf32_off_le"
;;

let read_elf32_off_be bs rest =
  bitmatch bs with
    | { off : 32 : bigendian } -> return (Uint32.of_int32 off, rest)
    | { _ } -> Fail "read_elf32_off_be"
;;

let read_elf32_off endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 32) bs in
    match endian with
      | Little -> read_elf32_off_le cut rest
      | Big    -> read_elf32_off_be cut rest
;;

let read_elf64_off_le bs rest =
  bitmatch bs with
    | { off : 64 : littleendian } -> return (Uint64.of_int64 off, rest)
    | { _ } -> Fail "read_elf64_off_le"
;;

let read_elf64_off_be bs rest =
  bitmatch bs with
    | { off : 64: bigendian } -> return (Uint64.of_int64 off, rest)
    | { _ } -> Fail "read_elf64_off_be"
;;

let read_elf64_off endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 64) bs in
    match endian with
      | Little -> read_elf64_off_le cut rest
      | Big    -> read_elf64_off_be cut rest
;;

(** ELF half word type:
  * 2 byte unsigned type on 32-bit architectures.
  * 2 byte unsigned type on 64-bit architecutres.
  *)

let read_elf32_half_le bs rest =
  bitmatch bs with
    | { half : 16 : littleendian } -> return (Uint32.of_int half, rest)
    | { _ } -> Fail "read_elf32_half_le"
;;

let read_elf32_half_be bs rest =
  bitmatch bs with
    | { half : 16 : bigendian } -> return (Uint32.of_int half, rest)
    | { _ } -> Fail "read_elf32_half_be"
;;

let read_elf32_half endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 16) bs in
    match endian with
      | Little -> read_elf32_half_le cut rest
      | Big    -> read_elf32_half_be cut rest
;;

let read_elf64_half_le bs rest =
  bitmatch bs with
    | { half : 16 : littleendian } -> return (Uint32.of_int half, rest)
    | { _ } -> Fail "read_elf64_half_le"
;;

let read_elf64_half_be bs rest =
  bitmatch bs with
    | { half : 16 : bigendian } -> return (Uint32.of_int half, rest)
    | { _ } -> Fail "read_elf64_half_be"
;;

let read_elf64_half endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 16) bs in
    match endian with
      | Little -> read_elf64_half_le cut rest
      | Big    -> read_elf64_half_be cut rest
;;

(** ELF word type:
  * 4 byte unsigned type on 32-bit architectures.
  * 4 byte unsigned type on 32-bit architectures.
  *)

let read_elf32_word_le bs rest =
  bitmatch bs with
    | { word : 32 : littleendian } -> return (Uint32.of_int32 word, rest)
    | { _ } -> Fail "read_elf32_word_le"
;;

let read_elf32_word_be bs rest =
  bitmatch bs with
    | { word : 32 : bigendian } -> return (Uint32.of_int32 word, rest)
    | { _ } -> Fail "read_elf32_word_be"
;;

let read_elf32_word endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 32) bs in
    match endian with
      | Little -> read_elf32_word_le cut rest
      | Big    -> read_elf32_word_be cut rest
;;

let read_elf64_word_le bs rest =
  bitmatch bs with
    | { word : 32 : littleendian } -> return (Uint32.of_int32 word, rest)
    | { _ } -> Fail "read_elf64_word_le"
;;

let read_elf64_word_be bs rest =
  bitmatch bs with
    | { word : 32 : bigendian } -> return (Uint32.of_int32 word, rest)
    | { _ } -> Fail "read_elf64_word_be"
;;

let read_elf64_word endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 32) bs in
    match endian with
      | Little -> read_elf64_word_le cut rest
      | Big    -> read_elf64_word_be cut rest
;;

(** ELF signed word type:
  * 4 byte signed type on 32-bit architectures
  * 4 byte signed type on 64-bit architectures
  *)

let read_elf32_sword_le bs rest =
  bitmatch bs with
    | { word : 32 : littleendian } -> return (word, rest)
    | { _ } -> Fail "read_elf32_sword_le"
;;

let read_elf32_sword_be bs rest =
  bitmatch bs with
    | { word : 32 : bigendian } -> return (word, rest)
    | { _ } -> Fail "read_elf32_sword_be"
;;

let read_elf32_sword endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 32) bs in
    match endian with
      | Little -> read_elf32_sword_le cut rest
      | Big    -> read_elf32_sword_be cut rest
;;

let read_elf64_sword_le bs rest =
  bitmatch bs with
    | { word : 32 : littleendian } -> return (word, rest)
    | { _ } -> Fail "read_elf64_sword_le"
;;

let read_elf64_sword_be bs rest =
  bitmatch bs with
    | { word : 32 : bigendian } -> return (word, rest)
    | { _ } -> Fail "read_elf64_sword_be"
;;

let read_elf64_sword endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 32) bs in
    match endian with
      | Little -> read_elf64_sword_le cut rest
      | Big    -> read_elf64_sword_be cut rest
;;

(** ELF extra wide word type:
  * 8 byte unsigned type on 64-bit architectures.
  *)

let read_elf64_xword_le bs rest =
  bitmatch bs with
    | { addr : 64 : littleendian } -> return (Uint64.of_int64 addr, rest)
    | { _ } -> Fail "read_elf64_xword_le"
;;

let read_elf64_xword_be bs rest =
  bitmatch bs with
    | { addr : 64 : bigendian } -> return (Uint64.of_int64 addr, rest)
    | { _ } -> Fail "read_elf64_xword_be"
;;

let read_elf64_xword endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 64) bs in
    match endian with
      | Little -> read_elf64_xword_le cut rest
      | Big    -> read_elf64_xword_be cut rest
;;

(** ELF signed extra wide word type:
  * 8 byte signed type on 64-bit architectures.
  *)

let read_elf64_sxword_le bs rest =
  bitmatch bs with
    | { addr : 64 : littleendian } -> return (addr, rest)
    | { _ } -> Fail "read_elf64_sxword_le"
;;

let read_elf64_sxword_be bs rest =
  bitmatch bs with
    | { addr : 64 : bigendian } -> return (addr, rest)
    | { _ } -> Fail "read_elf64_sxword_be"
;;

let read_elf64_sxword endian bs =
  let cut, rest = partition_bitstring (Big_int.big_int_of_int 64) bs in
    match endian with
      | Little -> read_elf64_sxword_le cut rest
      | Big    -> read_elf64_sxword_be cut rest
;;

(** Misc. string operations. *)

let split_string_on_char strings c =
  let enum    = BatString.enum strings in
  let groups  = BatEnum.group (fun char -> char <> c) enum in
  let enums   = BatEnum.map BatString.of_enum groups in
  	BatList.of_enum enums
;;

let string_suffix index str =
  if Big_int.lt_big_int index (Big_int.big_int_of_int 0) ||
    (Big_int.gt_big_int index (Big_int.big_int_of_int (String.length str))) then
    None
  else
    try
      if Big_int.is_int_big_int index then
        Some (String.sub str (Big_int.int_of_big_int index)
          (String.length str - (Big_int.int_of_big_int index)))
      else
        failwith "string_suffix: index too large"
    with
    | _ -> None
;;

let natural_of_unsigned_char u =
  Big_int.big_int_of_string (Uint32.to_string u)
;;

let natural_of_elf32_half u =
  Big_int.big_int_of_string (Uint32.to_string u)
;;

let natural_of_elf64_half u =
  Big_int.big_int_of_string (Uint32.to_string u)
;;

let natural_of_elf32_word u =
  Big_int.big_int_of_string (Uint32.to_string u)
;;

let natural_of_elf64_word u =
  Big_int.big_int_of_string (Uint32.to_string u)
;;

let natural_of_elf32_off u =
  Big_int.big_int_of_string (Uint32.to_string u)
;;

let natural_of_elf64_off u =
  Big_int.big_int_of_string (Uint64.to_string u)
;;

let natural_of_elf32_addr u =
  Big_int.big_int_of_string (Uint32.to_string u)
;;

let natural_of_elf64_addr u =
  Big_int.big_int_of_string (Uint64.to_string u)
;;

let natural_of_elf64_xword u =
  Big_int.big_int_of_string (Uint64.to_string u)
;;

let rec list_index_big_int index xs =
  match xs with
    | []    -> None
    | x::xs ->
      if Big_int.eq_big_int index Big_int.zero_big_int then
        Some x
      else
        list_index_big_int (Big_int.sub_big_int index (Big_int.big_int_of_int 1)) xs
;;