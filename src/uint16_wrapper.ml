type uint16 = Big_int.big_int

(* 2^16 - 1 *)
let max_int = Big_int.big_int_of_string "65535"
;;

let of_bigint (i : Big_int.big_int) =
  Big_int.mod_big_int i max_int
;;

let to_bigint (u : uint16) = u
;;

let shift_left i s =
  Big_int.mod_big_int (Big_int.shift_left_big_int i s) max_int
;;

let shift_right i s =
  Big_int.mod_big_int (Big_int.shift_right_big_int i s) max_int
;;

let of_dual c1 c2 =
  let b1 = Big_int.big_int_of_int (Char.code c1) in
  let b2 = shift_left (Big_int.big_int_of_int (Char.code c2)) 8 in
    Big_int.add_big_int b1 b2
;;

let to_bytes u = assert false
;;

let to_string (u : uint16) =
  Big_int.string_of_big_int u
;;

let equal u1 u2 =
  Big_int.eq_big_int u1 u2
;; 