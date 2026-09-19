open Endianness
open Error

open Printf
open Unix

let string_of_unix_time (tm : Nat_big_num.num) =
  let num  = Nat_big_num.to_int64 tm in
  let tm   = Unix.gmtime (Int64.to_float num) in
  let day  = tm.tm_mday in
  let mon  = 1 + tm.tm_mon in
  let year = 1900 + tm.tm_year in
  let hour = tm.tm_hour in
  let min  = tm.tm_min in
  let sec  = tm.tm_sec in
    Printf.sprintf "%i-%02i-%02iT%02i:%02i:%02i" year mon day hour min sec  (* Claude: readelf zero-pads month and day *)

let hex_string_of_nat_pad2 i : string =
  Printf.sprintf "%02i" i
;;

(* Claude: hexadecimal rendering of a big integer by repeated division, so that
   unsigned 64-bit values of 2^63 and above work; the previous versions went
   through Int64 and failed on them (e.g. section addresses of
   0xffffffff00000000).  Negative values get a leading "-". *)
let hex_of_big_int (i : Nat_big_num.num) : string =
  let sixteen = Nat_big_num.of_int 16 in
  let digit d = "0123456789abcdef".[d] in
  let rec go n acc =
    if Nat_big_num.equal n Nat_big_num.zero then acc
    else go (Nat_big_num.div n sixteen) (digit (Nat_big_num.to_int (Nat_big_num.modulus n sixteen)) :: acc)
  in
  let magnitude n = match go n [] with [] -> "0" | ds -> String.init (List.length ds) (List.nth ds) in
  if Nat_big_num.less i Nat_big_num.zero then "-" ^ magnitude (Nat_big_num.negate i) else magnitude i

let hex_string_of_big_int_pad width i : string =
  let s = hex_of_big_int i in
  if String.length s >= width then s else String.make (width - String.length s) '0' ^ s

let hex_string_of_big_int_pad6 i = hex_string_of_big_int_pad 6 i
let hex_string_of_big_int_pad7 i = hex_string_of_big_int_pad 7 i
let hex_string_of_big_int_pad2 i = hex_string_of_big_int_pad 2 i
let hex_string_of_big_int_pad4 i = hex_string_of_big_int_pad 4 i
let hex_string_of_big_int_pad5 i = hex_string_of_big_int_pad 5 i
let hex_string_of_big_int_pad8 i = hex_string_of_big_int_pad 8 i
let hex_string_of_big_int_pad16 i = hex_string_of_big_int_pad 16 i
let hex_string_of_big_int_no_padding i = hex_of_big_int i
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

let string_suffix index str =
  if (* index < 0 *) Nat_big_num.less index (Nat_big_num.of_int 0) ||
     (* index > length str *) (Nat_big_num.greater index (Nat_big_num.of_int (String.length str))) then
    None
  else
  	let idx = Nat_big_num.to_int index in
  		Some (String.sub str idx (String.length str - idx))
;;

let string_prefix index str =
  if (* index < 0 *) Nat_big_num.less index (Nat_big_num.of_int 0) ||
     (* index > length str *) (Nat_big_num.greater index (Nat_big_num.of_int (String.length str))) then
    None
  else
  	let idx = Nat_big_num.to_int index in
  		Some (String.sub str 0 idx)
;;

let string_index_of (c: char) (s : string) = try Some(Nat_big_num.of_int (String.index s c))
    with Not_found -> None
;;

(* Claude: [string_index_of_from c i s] is the index of the first [c] in [s] at
   or after position [i], if any; [None] if [i] is out of range or there is no
   such character.  Unlike searching a suffix produced by [string_suffix], this
   does not copy the tail of [s]. *)
let string_index_of_from (c: char) (i : Nat_big_num.num) (s : string) =
  if Nat_big_num.less i (Nat_big_num.of_int 0) ||
     Nat_big_num.greater i (Nat_big_num.of_int (String.length s)) then
    None
  else
    match String.index_from_opt s (Nat_big_num.to_int i) c with
      | Some j -> Some (Nat_big_num.of_int j)
      | None   -> None
;;

(* Claude: [string_sub i n s] is the substring of [s] of length [n] starting at
   position [i], or [None] if that range does not lie within [s]. *)
let string_sub (i : Nat_big_num.num) (n : Nat_big_num.num) (s : string) =
  let len = Nat_big_num.of_int (String.length s) in
  if Nat_big_num.less i (Nat_big_num.of_int 0) ||
     Nat_big_num.less n (Nat_big_num.of_int 0) ||
     Nat_big_num.greater (Nat_big_num.add i n) len then
    None
  else
    Some (String.sub s (Nat_big_num.to_int i) (Nat_big_num.to_int n))
;;

let find_substring (sub: string) (s : string) =
    try Some(Nat_big_num.of_int (Str.search_forward (Str.regexp_string sub) s 0))
    with Not_found -> None
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
;;

let nat_big_num_of_uint64 x = x
(*
    (* Nat_big_num can only be made from signed integers at present.
     * Workaround: make an int64, and if negative, add the high bit
     * in the big-num domain. *)
    let via_int64 = Uint64.to_int64 x
    in
    if Int64.compare via_int64 Int64.zero >= 0 then Nat_big_num.of_int64 via_int64
    else
        let two_to_63 = Uint64.shift_left (Uint64.of_int 1) 63 in
        let lower_by_2_to_63 = Uint64.sub x two_to_63 in
        (Nat_big_num.add
            (Nat_big_num.of_int64 (Uint64.to_int64 lower_by_2_to_63))
            (Nat_big_num.shift_left (Nat_big_num.of_int 1) 63)
        )
*)

(* TODO: String.split_on_char is not available on old OCaml versions *)
(* let split_string_on_char s c = String.split_on_char c s *)
let split_string_on_char str c =
  if str = "" then []
  else
    let rec loop acc offset =
      try (
        let index = String.rindex_from str offset c in
        if index = offset then
          loop (""::acc) (index - 1)
        else
          let token = String.sub str (index + 1) (offset - index) in
          loop (token::acc) (index - 1)
      ) with Not_found -> (String.sub str 0 (offset + 1))::acc
    in
    loop [] (String.length str - 1)

let string_replace s substr repl =
  (* Why the hell do we need to use the whole regexp machinery for simple string
     replacements? *)
  let r = Str.regexp_string substr in
  Str.global_replace r repl s
