type uint32
  = Big_int.big_int

(* 2^32 - 1 *)
let max_int =
  Big_int.big_int_of_string "4294967295"
;;

let add l r =
  Big_int.mod_big_int (Big_int.add_big_int l r) max_int
;;

let of_char (c : char) : uint32 =
  Big_int.big_int_of_int (Char.code c)
;;

let of_int (i : int) =
  Big_int.big_int_of_int i
;;

let of_bigint (i : Big_int.big_int) : uint32 =
  Big_int.mod_big_int i max_int
;;

let of_int32 (i : Int32.t) =
  Big_int.big_int_of_int32 i
;;

let to_bigint (u : uint32) : Big_int.big_int = u
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

let to_char u =
  Char.chr (Big_int.int_of_big_int u)
;;

let equal l r =
  Big_int.eq_big_int l r
;;

let of_quad c1 c2 c3 c4 =
  let b1 = Big_int.big_int_of_int (Char.code c1) in
  let b2 = shift_left (Big_int.big_int_of_int (Char.code c2)) 8 in
  let b3 = shift_left (Big_int.big_int_of_int (Char.code c3)) 16 in
  let b4 = shift_left (Big_int.big_int_of_int (Char.code c4)) 24 in
    Big_int.add_big_int b1 (Big_int.add_big_int b2 (Big_int.add_big_int b3 b4))
;;

let of_quad_native c1 c2 c3 c4 =
  let b1 = Uint32.of_int (Char.code c1) in
  let b2 = Uint32.shift_left (Uint32.of_int (Char.code c2)) 8 in
  let b3 = Uint32.shift_left (Uint32.of_int (Char.code c3)) 16 in
  let b4 = Uint32.shift_left (Uint32.of_int (Char.code c4)) 24 in
    Uint32.add b1 (Uint32.add b2 (Uint32.add b3 b4))
;;

let of_dual_native c1 c2 = of_quad_native c1 c2 '\000' '\000'
;;

let to_bytes u : char * char * char * char =
  let b0 = Char.chr (Big_int.int_of_big_int (logand u (Big_int.big_int_of_string "255"))) in
  let b1 = Char.chr (Big_int.int_of_big_int (shift_right (logand u (Big_int.big_int_of_string "65280")) 8)) in
  let b2 = Char.chr (Big_int.int_of_big_int (shift_right (logand u (Big_int.big_int_of_string "16711680")) 16)) in
  let b3 = Char.chr (Big_int.int_of_big_int (shift_right (logand u (Big_int.big_int_of_string "4278190080")) 24)) in
    b3, b2, b1, b0
;;

let to_bytes_native u : char * char * char * char =
  let b0 = Char.chr (Uint32.to_int (Uint32.logand u (Uint32.of_string "255"))) in
  let b1 = Char.chr (Uint32.to_int (Uint32.shift_right (Uint32.logand u (Uint32.of_string "65280")) 8)) in
  let b2 = Char.chr (Uint32.to_int (Uint32.shift_right (Uint32.logand u (Uint32.of_string "16711680")) 16)) in
  let b3 = Char.chr (Uint32.to_int (Uint32.shift_right (Uint32.logand u (Uint32.of_string "4278190080")) 24)) in
    b3, b2, b1, b0
;;

let to_dual_bytes_native u : char * char =
  let (b3, b2, b1, b0) = to_bytes_native u in
    b1, b0
;;