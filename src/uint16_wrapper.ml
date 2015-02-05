type uint16 = Big_int.big_int

(* 2^16 - 1 *)
let max_int = Big_int.big_int_of_string "65535"
;;

let of_bigint (i : Big_int.big_int) =
  Big_int.mod_big_int i max_int
;;

let to_bigint (u : uint16) = u
;;

let of_dual c1 c2 = assert false
;;

let to_bytes u = assert false
;;

let to_string (u : uint16) =
  Big_int.string_of_big_int u
;;

let equal u1 u2 =
  Big_int.eq_big_int u1 u2
;; 