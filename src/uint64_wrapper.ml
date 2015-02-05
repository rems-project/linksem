type uint64
  = Big_int.big_int

(* 2^64 - 1 *)
let max_int =
  let x = Big_int.big_int_of_string "4294967296" in
  let y = Big_int.mult_big_int x (Big_int.big_int_of_int 2) in
    Big_int.sub_big_int y (Big_int.big_int_of_int 1)
;;

let add l r =
  Big_int.mod_big_int (Big_int.add_big_int l r) max_int
;;

let minus l r =
  Big_int.mod_big_int (Big_int.sub_big_int l r) max_int
;;

let of_int i =
  Big_int.big_int_of_int i
;;

let of_int64 (i : Int64.t) =
  Big_int.big_int_of_int64 i
;;

let shift_left i s =
  Big_int.mod_big_int (Big_int.shift_left_big_int i s) max_int
;;

let shift_right i s =
  Big_int.mod_big_int (Big_int.shift_right_big_int i s) max_int
;;

let logand l r =
  Big_int.mod_big_int (Big_int.and_big_int l r) max_int
;;

let logor l r =
  Big_int.mod_big_int (Big_int.or_big_int l r) max_int
;;

let to_string l =
  Big_int.string_of_big_int l
;;

let equal l r =
  Big_int.eq_big_int l r
;;

let of_oct c1 c2 c3 c4 c5 c6 c7 c8 =
  let b1 = Big_int.big_int_of_int (Char.code c1) in
  let b2 = shift_left (Big_int.big_int_of_int (Char.code c2)) 8 in
  let b3 = shift_left (Big_int.big_int_of_int (Char.code c3)) 16 in
  let b4 = shift_left (Big_int.big_int_of_int (Char.code c4)) 24 in
  let b5 = shift_left (Big_int.big_int_of_int (Char.code c5)) 32 in
  let b6 = shift_left (Big_int.big_int_of_int (Char.code c6)) 40 in
  let b7 = shift_left (Big_int.big_int_of_int (Char.code c7)) 48 in
  let b8 = shift_left (Big_int.big_int_of_int (Char.code c8)) 56 in
    Big_int.add_big_int b1 (Big_int.add_big_int b2
      (Big_int.add_big_int b3 (Big_int.add_big_int b4
        (Big_int.add_big_int b5 (Big_int.add_big_int b6
          (Big_int.add_big_int b7 b8))))))
;;

let to_bigint (u : uint64) : Big_int.big_int =
  u
;;

let of_bigint (u : Big_int.big_int) : uint64 =
  Big_int.mod_big_int u max_int
;;

let to_bytes u : char * char * char * char * char * char * char * char =
  let u1 = Big_int.mult_big_int (Big_int.big_int_of_string "4278190080") (Big_int.big_int_of_string "255") in (* 0xFF00000000 *)
  let u2 = Big_int.mult_big_int (Big_int.big_int_of_string "4278190080") (Big_int.big_int_of_string "65280") in (* 0xFF0000000000 *)
  let u3 = Big_int.mult_big_int (Big_int.big_int_of_string "4278190080") (Big_int.big_int_of_string "16711680") in (* 0xFF000000000000 *)
  let u4 = Big_int.mult_big_int (Big_int.big_int_of_string "4278190080") (Big_int.big_int_of_string "4278190080") in (* 0xFF00000000000000 *)
  let b0 = Char.chr (Big_int.int_of_big_int (logand u (Big_int.big_int_of_string "255"))) in (* 0xFF *)
  let b1 = Char.chr (Big_int.int_of_big_int (shift_right (logand u (Big_int.big_int_of_string "65280")) 8)) in (* 0xFF00 *)
  let b2 = Char.chr (Big_int.int_of_big_int (shift_right (logand u (Big_int.big_int_of_string "16711680")) 16)) in (* 0xFF0000 *)
  let b3 = Char.chr (Big_int.int_of_big_int (shift_right (logand u (Big_int.big_int_of_string "4278190080")) 24)) in (* 0xFF000000 *)
  let b4 = Char.chr (Big_int.int_of_big_int (shift_right (logand u u1) 32)) in (* 0xFF00000000 *)
  let b5 = Char.chr (Big_int.int_of_big_int (shift_right (logand u u2) 40)) in (* 0xFF0000000000 *)
  let b6 = Char.chr (Big_int.int_of_big_int (shift_right (logand u u3) 48)) in (* 0xFF000000000000 *)
  let b7 = Char.chr (Big_int.int_of_big_int (shift_right (logand u u4) 56)) in (* 0xFF00000000000000 *)
    b7, b6, b5, b4, b3, b2, b1, b0
;;