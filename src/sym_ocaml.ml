(* module type Nat_big_num = sig
  type num
  val zero : num
  val succ : num -> num
  val pred : num -> num
  val pred_nat : num -> num
  val negate : num -> num

  val add : num -> num -> num
  val sub : num -> num -> num
  val sub_nat : num -> num -> num
  val div : num -> num -> num
  val mul : num -> num -> num
  val pow_int : num -> int -> num
  val pow_int_positive : int -> int -> num


  val quomod : num -> num -> num * num
  val abs : num -> num
  val modulus : num -> num -> num

  val min : num -> num -> num
  val max : num -> num -> num

  val less : num -> num -> bool
  val greater : num -> num -> bool
  val less_equal : num -> num -> bool
  val greater_equal : num -> num -> bool

  val compare : num -> num -> int
  val equal : num -> num -> bool

  val bitwise_or : num -> num -> num
  val bitwise_and : num -> num -> num
  val bitwise_xor : num -> num -> num
  val shift_left : num -> int -> num
  val shift_right : num -> int -> num

  val extract_num : num -> int -> int -> num

  val of_int : int -> num
  val of_int32 : Int32.t -> num
  val of_int64 : Int64.t -> num

  val to_int : num -> int
  val to_int32 : num -> Int32.t
  val to_int64 : num -> Int64.t

  val to_string : num -> string
  val of_string : string -> num
  val of_string_nat : string -> num
  val integerDiv_t : num -> num -> num
  val integerRem_t : num -> num -> num
  val integerRem_f : num -> num -> num
end

module Make (Nat_big_num : Nat_big_num) = struct *)
(* TODO remove ^ hack for the language server to work *)


let fail s = failwith ("Symbolic operation failed: " ^ s)

(* TODO context? *)
module Num = struct
  module NBN = Nat_big_num
  
  type t =
  | Offset of string * NBN.num
  | Absolute of NBN.num

  let ppf p = function
  | Absolute x -> p x
  | Offset (s,x) -> s^"+"^p x

  let to_string = ppf NBN.to_string

  let section s =
    if String.starts_with ~prefix:".debug" s then
      Absolute NBN.zero
    else
      Offset (s, NBN.zero)

  let of_num x = Absolute x

  let to_num x = match x with
  | Absolute x -> x
  | _ -> fail ("to_num " ^ to_string x)

  let add x y = match (x,y) with
  | (Absolute x, Absolute y) -> Absolute (NBN.add x y)
  | (Offset (s, x), Absolute y) -> Offset (s, NBN.add x y)
  | (Absolute x, Offset (s, y)) -> Offset (s, NBN.add x y)
  | _ -> fail ("add "^to_string x^" "^to_string y)

  let sub x y =
    match (x, y) with
      | (Absolute x, Absolute y) -> Absolute (NBN.sub x y)
      | (Offset (s, x), Absolute y) -> Offset (s, NBN.sub x y)
      | (Offset (s, x'), Offset (t, y')) ->
          if s = t then
            Absolute (NBN.sub x' y')
          else
            fail ("sub "^to_string x^" "^to_string y)
      | _ -> fail ("sub "^to_string x^" "^to_string y)
    
  let sub_nat x y =
    match (x, y) with
      | (Absolute x, Absolute y) -> Absolute (NBN.sub_nat x y)
      | (Offset (s, x'), Absolute y') ->
          if NBN.greater_equal x' y' then
            Offset (s, NBN.sub_nat x' y')
          else
            fail ("sub_nat "^to_string x^" "^to_string y)
      | (Offset (s, x'), Offset (t, y')) ->
          if s = t then
            Absolute (NBN.sub_nat x' y')
          else
            fail ("sub_nat "^to_string x^" "^to_string y)
      | _ -> fail ("sub_nat "^to_string x^" "^to_string y)
  
  let map f x = of_num (f(to_num x))

  let map2 f x y = of_num (f(to_num x)(to_num y))

  let mul = map2 NBN.mul
  let div = map2 NBN.div

  let modulus x y =
    if match y with
      | Absolute(y) -> NBN.greater_equal y (NBN.pow_int (NBN.of_int 2) 64)
      | _ -> false
    then
      x
    else
      map2 NBN.modulus x y
  
  let comp f a b = match (a, b) with
  | (Absolute a, Absolute b) -> f a b
  | (Offset (s, a'), Offset(t, b')) -> if s = t then
      f a' b'
    else
      fail ("comp "^to_string a^" "^to_string b)
  | _ -> fail ("comp "^to_string a^" "^to_string b)

  let compare = comp NBN.compare
  let less = comp NBN.less
  let greater = comp NBN.greater
  let less_equal = comp NBN.less_equal
  let greater_equal = comp NBN.greater_equal
  let equal = comp NBN.equal

  let expect_nonneg x =
    let nonneg = match x with
    | Absolute x -> NBN.greater_equal x NBN.zero
    | Offset (s, x) -> NBN.greater_equal x NBN.zero
    in
    if nonneg then
      x
    else
      fail (to_string x^" can be negative")
end

(* end *)
