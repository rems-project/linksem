type uint64 = Nat_big_num.num

(* 2^64 - 1 *)
let max_int =
  Nat_big_num.sub
    (Nat_big_num.pow_int_positive 2 64)
    (Nat_big_num.of_int 1)
;;

let add l r =
  Nat_big_num.modulus (Nat_big_num.add l r) max_int
;;

let minus l r =
  Nat_big_num.modulus (Nat_big_num.sub l r) max_int
;;

let of_string s =
  Nat_big_num.modulus (Nat_big_num.of_string s) max_int
;;

let of_int i =
  Nat_big_num.modulus (Nat_big_num.of_int i) max_int
;;

let of_int64 (i : Int64.t) =
  Nat_big_num.modulus (Nat_big_num.of_int64 i) max_int
;;

let shift_left i s =
  Nat_big_num.modulus (Nat_big_num.shift_left i s) max_int
;;

let shift_right i s =
  Nat_big_num.modulus (Nat_big_num.shift_right i s) max_int
;;

let logand l r =
  Nat_big_num.modulus (Nat_big_num.bitwise_and l r) max_int
;;

let logor l r =
  Nat_big_num.modulus (Nat_big_num.bitwise_or l r) max_int
;;

let to_string l =
  Nat_big_num.to_string l
;;

let to_int u =
  Nat_big_num.to_int u
;;

let equal l r =
  Nat_big_num.equal l r
;;

let of_oct c1 c2 c3 c4 c5 c6 c7 c8 =
  let b1 = Nat_big_num.of_int (Char.code c1) in
  let b2 = Nat_big_num.shift_left (Nat_big_num.of_int (Char.code c2)) 8 in
  let b3 = Nat_big_num.shift_left (Nat_big_num.of_int (Char.code c3)) 16 in
  let b4 = Nat_big_num.shift_left (Nat_big_num.of_int (Char.code c4)) 24 in
  let b5 = Nat_big_num.shift_left (Nat_big_num.of_int (Char.code c5)) 32 in
  let b6 = Nat_big_num.shift_left (Nat_big_num.of_int (Char.code c6)) 40 in
  let b7 = Nat_big_num.shift_left (Nat_big_num.of_int (Char.code c7)) 48 in
  let b8 = Nat_big_num.shift_left (Nat_big_num.of_int (Char.code c8)) 56 in
    Nat_big_num.add b1 b2
    |> Nat_big_num.add b3
    |> Nat_big_num.add b4
    |> Nat_big_num.add b5
    |> Nat_big_num.add b6
    |> Nat_big_num.add b7
    |> Nat_big_num.add b8
;;

let to_bigint (u : uint64) : Nat_big_num.num =
  u
;;

let of_bigint (u : Nat_big_num.num) : uint64 =
  Nat_big_num.modulus u max_int
;;

let to_bytes u : char * char * char * char * char * char * char * char =
  let ff = of_string "255" in
  let b0 = logand u ff |> to_int |> Char.chr in
  let u = shift_right u 8 in
  let b1 = logand u ff |> to_int |> Char.chr in
  let u = shift_right u 8 in
  let b2 = logand u ff |> to_int |> Char.chr in
  let u = shift_right u 8 in
  let b3 = logand u ff |> to_int |> Char.chr in
  let u = shift_right u 8 in
  let b4 = logand u ff |> to_int |> Char.chr in
  let u = shift_right u 8 in
  let b5 = logand u ff |> to_int |> Char.chr in
  let u = shift_right u 8 in
  let b6 = logand u ff |> to_int |> Char.chr in
  let u = shift_right u 8 in
  let b7 = logand u ff |> to_int |> Char.chr in
    b0,b1,b2,b3,b4,b5,b6,b7
;;
