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

let little_endian_uint32 c1 c2 c3 c4 =
  let buffer1 = Uint32_wrapper.shift_left (Uint32_wrapper.of_int (Char.code c4)) 24 in
  let buffer2 = Uint32_wrapper.shift_left (Uint32_wrapper.of_int (Char.code c3)) 16 in
  let buffer3 = Uint32_wrapper.shift_left (Uint32_wrapper.of_int (Char.code c2)) 8 in
  let buffer4 = Uint32_wrapper.of_int (Char.code c1) in
  let res =
    Uint32_wrapper.logor buffer1
      (Uint32_wrapper.logor buffer2
      (Uint32_wrapper.logor buffer3 buffer4)) in
  res
;;

let little_endian_int32 c1 c2 c3 c4 =
  let buffer1 = Int32.shift_left (Int32.of_int (Char.code c4)) 24 in
  let buffer2 = Int32.shift_left (Int32.of_int (Char.code c3)) 16 in
  let buffer3 = Int32.shift_left (Int32.of_int (Char.code c2)) 8 in
  let buffer4 = Int32.of_int (Char.code c1) in
  let res =
    Int32.logor buffer1
      (Int32.logor buffer2
      (Int32.logor buffer3 buffer4))
  in
    res
;;

let little_endian_uint64 c1 c2 c3 c4 c5 c6 c7 c8 =
  let buffer1 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c8)) 56 in
  let buffer2 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c7)) 48 in
  let buffer3 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c6)) 40 in
  let buffer4 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c5)) 32 in
  let buffer5 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c4)) 24 in
  let buffer6 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c3)) 16 in
  let buffer7 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c2)) 8 in
  let buffer8 = Uint64_wrapper.of_int (Char.code c1) in
  let res =
    Uint64_wrapper.logor buffer1
      (Uint64_wrapper.logor buffer2
      (Uint64_wrapper.logor buffer3
      (Uint64_wrapper.logor buffer4
      (Uint64_wrapper.logor buffer5
      (Uint64_wrapper.logor buffer6
      (Uint64_wrapper.logor buffer7 buffer8))))))
  in
    res
;;

let little_endian_int64 c1 c2 c3 c4 c5 c6 c7 c8 =
  let buffer1 = Int64.shift_left (Int64.of_int (Char.code c8)) 56 in
  let buffer2 = Int64.shift_left (Int64.of_int (Char.code c7)) 48 in
  let buffer3 = Int64.shift_left (Int64.of_int (Char.code c6)) 40 in
  let buffer4 = Int64.shift_left (Int64.of_int (Char.code c5)) 32 in
  let buffer5 = Int64.shift_left (Int64.of_int (Char.code c4)) 24 in
  let buffer6 = Int64.shift_left (Int64.of_int (Char.code c3)) 16 in
  let buffer7 = Int64.shift_left (Int64.of_int (Char.code c2)) 8 in
  let buffer8 = Int64.of_int (Char.code c1) in
  let res =
    Int64.logor buffer1
      (Int64.logor buffer2
      (Int64.logor buffer3
      (Int64.logor buffer4
      (Int64.logor buffer5
      (Int64.logor buffer6
      (Int64.logor buffer7 buffer8))))))
  in
    res
;;

let big_endian_uint32 c1 c2 c3 c4 =
  let buffer1 = Uint32_wrapper.shift_left (Uint32_wrapper.of_int (Char.code c1)) 24 in
  let buffer2 = Uint32_wrapper.shift_left (Uint32_wrapper.of_int (Char.code c2)) 16 in
  let buffer3 = Uint32_wrapper.shift_left (Uint32_wrapper.of_int (Char.code c3)) 8 in
  let buffer4 = Uint32_wrapper.of_int (Char.code c4) in
  let res = Uint32_wrapper.logor buffer1 (Uint32_wrapper.logor buffer2 (Uint32_wrapper.logor buffer3 buffer4)) in
  res
;;

let big_endian_int32 c1 c2 c3 c4 =
  let buffer1 = Int32.shift_left (Int32.of_int (Char.code c1)) 24 in
  let buffer2 = Int32.shift_left (Int32.of_int (Char.code c2)) 16 in
  let buffer3 = Int32.shift_left (Int32.of_int (Char.code c3)) 8 in
  let buffer4 = Int32.of_int (Char.code c4) in
  let res =
    Int32.logor buffer1
      (Int32.logor buffer2
      (Int32.logor buffer3 buffer4))
  in
    res
;;

let big_endian_uint64 c1 c2 c3 c4 c5 c6 c7 c8 =
  let buffer1 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c1)) 56 in
  let buffer2 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c2)) 48 in
  let buffer3 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c3)) 40 in
  let buffer4 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c4)) 32 in
  let buffer5 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c5)) 24 in
  let buffer6 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c6)) 16 in
  let buffer7 = Uint64_wrapper.shift_left (Uint64_wrapper.of_int (Char.code c7)) 8 in
  let buffer8 = Uint64_wrapper.of_int (Char.code c8) in
  let res =
    Uint64_wrapper.logor buffer1
      (Uint64_wrapper.logor buffer2
      (Uint64_wrapper.logor buffer3
      (Uint64_wrapper.logor buffer4
      (Uint64_wrapper.logor buffer5
      (Uint64_wrapper.logor buffer6
      (Uint64_wrapper.logor buffer7 buffer8))))))
  in
    res
;;

let big_endian_int64 c1 c2 c3 c4 c5 c6 c7 c8 =
  let buffer1 = Int64.shift_left (Int64.of_int (Char.code c1)) 56 in
  let buffer2 = Int64.shift_left (Int64.of_int (Char.code c2)) 48 in
  let buffer3 = Int64.shift_left (Int64.of_int (Char.code c3)) 40 in
  let buffer4 = Int64.shift_left (Int64.of_int (Char.code c4)) 32 in
  let buffer5 = Int64.shift_left (Int64.of_int (Char.code c5)) 24 in
  let buffer6 = Int64.shift_left (Int64.of_int (Char.code c6)) 16 in
  let buffer7 = Int64.shift_left (Int64.of_int (Char.code c7)) 8 in
  let buffer8 = Int64.of_int (Char.code c8) in
  let res =
    Int64.logor buffer1
      (Int64.logor buffer2
      (Int64.logor buffer3
      (Int64.logor buffer4
      (Int64.logor buffer5
      (Int64.logor buffer6
      (Int64.logor buffer7 buffer8))))))
  in
    res
;;

(** Unsigned char type *)

let read_unsigned_char endian bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (cs, bs1) ->
  return (Uint32_wrapper.of_int (Char.code cs), bs1)
;;

(** ELF address type:
  * 4 byte unsigned type on 32-bit architectures.
  * 8 byte unsigned type on 64-bit architectures.
  *)

let read_elf32_addr_le bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  return (little_endian_uint32 c1 c2 c3 c4, bs4)
;;

let read_elf32_addr_be bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  return (big_endian_uint32 c1 c2 c3 c4, bs4)
;;

let read_elf32_addr endian bs0 =
  match endian with
    | Little -> read_elf32_addr_le bs0
    | Big    -> read_elf32_addr_be bs0
;;

let read_elf64_addr_le bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  Byte_sequence_wrapper.read_byte bs4 >>= fun (c5, bs5) ->
  Byte_sequence_wrapper.read_byte bs5 >>= fun (c6, bs6) ->
  Byte_sequence_wrapper.read_byte bs6 >>= fun (c7, bs7) ->
  Byte_sequence_wrapper.read_byte bs7 >>= fun (c8, bs8) ->
  return (little_endian_uint64 c1 c2 c3 c4 c5 c6 c7 c8, bs8)
;;

let read_elf64_addr_be bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  Byte_sequence_wrapper.read_byte bs4 >>= fun (c5, bs5) ->
  Byte_sequence_wrapper.read_byte bs5 >>= fun (c6, bs6) ->
  Byte_sequence_wrapper.read_byte bs6 >>= fun (c7, bs7) ->
  Byte_sequence_wrapper.read_byte bs7 >>= fun (c8, bs8) ->
  return (big_endian_uint64 c1 c2 c3 c4 c5 c6 c7 c8, bs8)
;;

let read_elf64_addr endian bs0 =
  match endian with
    | Little -> read_elf64_addr_le bs0
    | Big    -> read_elf64_addr_be bs0
;;

(** ELF offset type:
  * 4 byte unsigned type on 32-bit architectures.
  * 8 byte unsigned type on 64-bit architectures.
  *)

let read_elf32_off_le bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  return (little_endian_uint32 c1 c2 c3 c4, bs4)
;;

let read_elf32_off_be bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  return (big_endian_uint32 c1 c2 c3 c4, bs4)
;;

let read_elf32_off endian bs0 =
  match endian with
    | Little -> read_elf32_off_le bs0
    | Big    -> read_elf32_off_be bs0
;;

let read_elf64_off_le bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  Byte_sequence_wrapper.read_byte bs4 >>= fun (c5, bs5) ->
  Byte_sequence_wrapper.read_byte bs5 >>= fun (c6, bs6) ->
  Byte_sequence_wrapper.read_byte bs6 >>= fun (c7, bs7) ->
  Byte_sequence_wrapper.read_byte bs7 >>= fun (c8, bs8) ->
  return (little_endian_uint64 c1 c2 c3 c4 c5 c6 c7 c8, bs8)
;;

let read_elf64_off_be bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  Byte_sequence_wrapper.read_byte bs4 >>= fun (c5, bs5) ->
  Byte_sequence_wrapper.read_byte bs5 >>= fun (c6, bs6) ->
  Byte_sequence_wrapper.read_byte bs6 >>= fun (c7, bs7) ->
  Byte_sequence_wrapper.read_byte bs7 >>= fun (c8, bs8) ->
  return (big_endian_uint64 c1 c2 c3 c4 c5 c6 c7 c8, bs8)
;;

let read_elf64_off endian bs0 =
  match endian with
    | Little -> read_elf64_off_le bs0
    | Big    -> read_elf64_off_be bs0
;;

(** ELF half word type:
  * 2 byte unsigned type on 32-bit architectures.
  * 2 byte unsigned type on 64-bit architectures.
  *)

let read_elf32_half_le bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  let buffer1 = Uint32_wrapper.shift_left (Uint32_wrapper.of_int (Char.code c2)) 8 in
  let buffer2 = Uint32_wrapper.of_int (Char.code c1) in
  return (Uint32_wrapper.logor buffer1 buffer2, bs2)
;;

let read_elf32_half_be bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  let buffer1 = Uint32_wrapper.shift_left (Uint32_wrapper.of_int (Char.code c1)) 8 in
  let buffer2 = Uint32_wrapper.of_int (Char.code c2) in
  return (Uint32_wrapper.logor buffer1 buffer2, bs2)
;;

let read_elf32_half endian bs0 =
  match endian with
    | Little -> read_elf32_half_le bs0
    | Big    -> read_elf32_half_be bs0
;;

let read_elf64_half_le bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  let buffer1 = Uint32_wrapper.shift_left (Uint32_wrapper.of_int (Char.code c2)) 8 in
  let buffer2 = Uint32_wrapper.of_int (Char.code c1) in
  return (Uint32_wrapper.logor buffer1 buffer2, bs2)
;;

let read_elf64_half_be bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  let buffer1 = Uint32_wrapper.shift_left (Uint32_wrapper.of_int (Char.code c1)) 8 in
  let buffer2 = Uint32_wrapper.of_int (Char.code c2) in
  return (Uint32_wrapper.logor buffer1 buffer2, bs2)
;;

let read_elf64_half endian bs0 =
  match endian with
    | Little -> read_elf64_half_le bs0
    | Big    -> read_elf64_half_be bs0
;;

(** ELF word type:
  * 4 byte unsigned type on 32-bit architectures.
  * 4 byte unsigned type on 64-bit architectures.
  *)

let read_elf32_word_le bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  return (little_endian_uint32 c1 c2 c3 c4, bs4)
;;

let read_elf32_word_be bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  return (big_endian_uint32 c1 c2 c3 c4, bs4)
;;

let read_elf32_word endian bs0 =
  match endian with
    | Little -> read_elf32_word_le bs0
    | Big    -> read_elf32_word_be bs0
;;

let read_elf64_word_le bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  return (little_endian_uint32 c1 c2 c3 c4, bs4)
;;

let read_elf64_word_be bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  return (big_endian_uint32 c1 c2 c3 c4, bs4)
;;

let read_elf64_word endian bs0 =
  match endian with
    | Little -> read_elf64_word_le bs0
    | Big    -> read_elf64_word_be bs0
;;

(** ELF signed word type:
  * 4 byte signed type on 32-bit architectures.
  * 4 byte signed type on 64-bit architectures.
  *)

let read_elf32_sword_le bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  return (little_endian_int32 c1 c2 c3 c4, bs4)
;;

let read_elf32_sword_be bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  return (big_endian_int32 c1 c2 c3 c4, bs4)
;;

let read_elf32_sword endian bs0 =
  match endian with
    | Little -> read_elf32_sword_le bs0
    | Big    -> read_elf32_sword_be bs0
;;

let read_elf64_sword_le bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  return (little_endian_int32 c1 c2 c3 c4, bs4)
;;

let read_elf64_sword_be bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  return (big_endian_int32 c1 c2 c3 c4, bs4)
;;

let read_elf64_sword endian bs0 =
  match endian with
    | Little -> read_elf64_sword_le bs0
    | Big    -> read_elf64_sword_be bs0
;;

(** ELF extra wide word type:
  * 8 byte unsigned type on 64-bit architectures.
  *)

let read_elf64_xword_le bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  Byte_sequence_wrapper.read_byte bs4 >>= fun (c5, bs5) ->
  Byte_sequence_wrapper.read_byte bs5 >>= fun (c6, bs6) ->
  Byte_sequence_wrapper.read_byte bs6 >>= fun (c7, bs7) ->
  Byte_sequence_wrapper.read_byte bs7 >>= fun (c8, bs8) ->
  return (little_endian_uint64 c1 c2 c3 c4 c5 c6 c7 c8, bs8)
;;

let read_elf64_xword_be bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  Byte_sequence_wrapper.read_byte bs4 >>= fun (c5, bs5) ->
  Byte_sequence_wrapper.read_byte bs5 >>= fun (c6, bs6) ->
  Byte_sequence_wrapper.read_byte bs6 >>= fun (c7, bs7) ->
  Byte_sequence_wrapper.read_byte bs7 >>= fun (c8, bs8) ->
  return (big_endian_uint64 c1 c2 c3 c4 c5 c6 c7 c8, bs8)
;;

let read_elf64_xword endian bs0 =
  match endian with
    | Little -> read_elf64_xword_le bs0
    | Big    -> read_elf64_xword_be bs0
;;

(** ELF signed extra wide word type:
  * 8 byte signed type on 64-bit architectures.
  *)

let read_elf64_sxword_le bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  Byte_sequence_wrapper.read_byte bs4 >>= fun (c5, bs5) ->
  Byte_sequence_wrapper.read_byte bs5 >>= fun (c6, bs6) ->
  Byte_sequence_wrapper.read_byte bs6 >>= fun (c7, bs7) ->
  Byte_sequence_wrapper.read_byte bs7 >>= fun (c8, bs8) ->
  return (little_endian_int64 c1 c2 c3 c4 c5 c6 c7 c8, bs7)
;;

let read_elf64_sxword_be bs0 =
  Byte_sequence_wrapper.read_byte bs0 >>= fun (c1, bs1) ->
  Byte_sequence_wrapper.read_byte bs1 >>= fun (c2, bs2) ->
  Byte_sequence_wrapper.read_byte bs2 >>= fun (c3, bs3) ->
  Byte_sequence_wrapper.read_byte bs3 >>= fun (c4, bs4) ->
  Byte_sequence_wrapper.read_byte bs4 >>= fun (c5, bs5) ->
  Byte_sequence_wrapper.read_byte bs5 >>= fun (c6, bs6) ->
  Byte_sequence_wrapper.read_byte bs6 >>= fun (c7, bs7) ->
  Byte_sequence_wrapper.read_byte bs7 >>= fun (c8, bs8) ->
  return (big_endian_int64 c1 c2 c3 c4 c5 c6 c7 c8, bs7)
;;

let read_elf64_sxword endian bs0 =
  match endian with
    | Little -> read_elf64_sxword_le bs0
    | Big    -> read_elf64_sxword_be bs0
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
  Big_int.big_int_of_string (Uint32_wrapper.to_string u)
;;

let natural_of_elf32_half u =
  Big_int.big_int_of_string (Uint32_wrapper.to_string u)
;;

let natural_of_elf64_half u =
  Big_int.big_int_of_string (Uint32_wrapper.to_string u)
;;

let natural_of_elf32_word u =
  Big_int.big_int_of_string (Uint32_wrapper.to_string u)
;;

let natural_of_elf64_word u =
  Big_int.big_int_of_string (Uint32_wrapper.to_string u)
;;

let natural_of_elf32_off u =
  Big_int.big_int_of_string (Uint32_wrapper.to_string u)
;;

let natural_of_elf64_off u =
  Big_int.big_int_of_string (Uint64_wrapper.to_string u)
;;

let natural_of_elf32_addr u =
  Big_int.big_int_of_string (Uint32_wrapper.to_string u)
;;

let natural_of_elf64_addr u =
  Big_int.big_int_of_string (Uint64_wrapper.to_string u)
;;

let natural_of_elf64_xword u =
  Big_int.big_int_of_string (Uint64_wrapper.to_string u)
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