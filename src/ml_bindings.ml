open Endianness
open Error

open Printf

let hex_string_of_nat_pad2 i : string =
  Printf.sprintf "%02i" i
;;

let hex_string_of_big_int_pad6 i : string =
  let i0 = Nat_big_num.to_int i in
    Printf.sprintf "%06x" i0
;;

let hex_string_of_big_int_pad2 i : string =
  let i0 = Nat_big_num.to_int i in
    Printf.sprintf "%02x" i0
;;

let hex_string_of_big_int_pad5 i : string =
  let i0 = Nat_big_num.to_int i in
    Printf.sprintf "%05x" i0
;;

let hex_string_of_big_int_pad8 i : string =
  let i0 = Nat_big_num.to_int i in
    Printf.sprintf "%08x" i0
;;

let hex_string_of_big_int_no_padding i : string =
  let i0 = Nat_big_num.to_int i in
    Printf.sprintf "%x" i0
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
  if Nat_big_num.less index (Nat_big_num.of_int 0) ||
    (Nat_big_num.greater index (Nat_big_num.of_int (String.length str))) then
    None
  else
  	let idx = Nat_big_num.to_int index in
  		Some (String.sub str idx (String.length str - idx))
;;

let rec list_index_big_int index xs =
  match xs with
    | []    -> None
    | x::xs ->
      if Nat_big_num.equal index (Nat_big_num.of_int 0) then
        Some x
      else
        list_index_big_int (Nat_big_num.sub index (Nat_big_num.of_int 1)) xs
;;

let argv_list = Array.to_list Sys.argv
