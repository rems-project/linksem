type uint32
  = Big_int.big_int

(* 2^32 - 1 *)
let max_int =
  Big_int.big_int_of_string "4294967295"
;;

let add l r =
  Big_int.mod_big_int (Big_int.add_big_int l r) max_int
;;

let of_int (i : int) =
  Big_int.big_int_of_int i
;;

let of_int32 (i : Int32.t) =
  Big_int.big_int_of_int32 i
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