open Endianness
open Error

let id_char (i : char) = i
;;

let natural_of_char (i: char) = Uint32_wrapper.to_bigint (Uint32_wrapper.of_char i)
;;

let bytes_of_int32 (i : Int32.t) = assert false
;;

let bytes_of_int64 (i : Int64.t) = assert false
;;

let int32_of_quad c1 c2 c3 c4 =
  let b1 = Int32.of_int (Char.code c1) in
  let b2 = Int32.shift_left (Int32.of_int (Char.code c2)) 8 in
  let b3 = Int32.shift_left (Int32.of_int (Char.code c3)) 16 in
  let b4 = Int32.shift_left (Int32.of_int (Char.code c4)) 24 in
    Int32.add b1 (Int32.add b2 (Int32.add b3 b4))
;;

let int64_of_oct c1 c2 c3 c4 c5 c6 c7 c8 =
  let b1 = Int64.of_int (Char.code c1) in
  let b2 = Int64.shift_left (Int64.of_int (Char.code c2)) 8 in
  let b3 = Int64.shift_left (Int64.of_int (Char.code c3)) 16 in
  let b4 = Int64.shift_left (Int64.of_int (Char.code c4)) 24 in
  let b5 = Int64.shift_left (Int64.of_int (Char.code c5)) 32 in
  let b6 = Int64.shift_left (Int64.of_int (Char.code c6)) 40 in
  let b7 = Int64.shift_left (Int64.of_int (Char.code c7)) 48 in
  let b8 = Int64.shift_left (Int64.of_int (Char.code c8)) 56 in
    Int64.add b1 (Int64.add b2 (Int64.add b3 (Int64.add b4
        (Int64.add b5 (Int64.add b6 (Int64.add b7 b8))))))
;;

let char_of_bigint (i : Big_int.big_int) : char =
  let i = Big_int.int_of_big_int i in
    Char.chr i
;;

let decimal_string_of_int64 e =
  let i = Int64.to_int e in
    string_of_int i
;;

let hex_string_of_int64 (e : Int64.t) : string =
  let i = Int64.to_int e in
    Printf.sprintf "0x%x" i
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

let argv_list = Array.to_list Sys.argv
