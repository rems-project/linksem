open Big_int

open Error

type t =
  char list
;;

let one_big_int : big_int =
  add_int_big_int 1 zero_big_int
;;

let acquire (fname : string) : t error =
  let char_list = ref [] in
  try
    let ic = open_in_bin fname in
    while true do
      let c = input_char ic in
      let _ = char_list := c :: !char_list in
        ()
    done;
    let _ = close_in ic in
    Fail "acquire: the impossible happened"
  with End_of_file ->
    Success (List.rev !char_list)
;;

let serialise (fname : string) (bytes : t) : unit error =
  let rec go oc bytes =
    match bytes with
      | []    -> ()
      | x::xs -> output_char oc x; go oc xs
  in
    try
      let oc = open_out_bin fname in
      let _  = go oc bytes in
      let _  = close_out oc in
        Success ()
    with _ ->
      Fail "serialise: unable to open file for writing"
;;

let read_byte (ts : t) : (char * t) error =
  match ts with
    | []    -> fail "read_byte: sequence empty"
    | x::xs -> Success (x, xs)
;;

let empty : t =
  []
;;

let rec create (m : big_int) (c : char) : t =
  if eq_big_int m zero_big_int then
    []
  else
    c :: create (sub_big_int m one_big_int) c
;;

let length (ts : t) : big_int =
  List.fold_right (fun x y -> add_big_int y one_big_int) ts zero_big_int
;;

let concat (ts : t list) : t =
  List.fold_right (@) ts []
;;

let from_byte_lists (ts : char list list) =
  List.flatten ts
;;

let rec takebytes (m : big_int) (ts : t) : t error =
  if gt_big_int m (length ts) then
    Fail "takebytes: byte sequence is not of sufficient length"
  else
    match ts with
      | []    ->
        if eq_big_int m zero_big_int then
          Success []
        else
          Fail "takebytes: unable to take more bytes"
      | x::xs ->
        if eq_big_int m zero_big_int then
          Success []
        else
          takebytes (sub_big_int m one_big_int) xs >>= fun tail ->
          Success (x::tail)
;;

let rec dropbytes (m : big_int) (ts : t) : t error =
  if gt_big_int m (length ts) then
    Fail "dropbytes: byte sequence is not of sufficient length"
  else
    match ts with
      | []    ->
        if eq_big_int m zero_big_int then
          Success []
        else
          Fail "dropbytes: unable to drop more bytes"
      | x::xs ->
        if eq_big_int m zero_big_int then
          Success (x::xs)
        else
          dropbytes (sub_big_int m one_big_int) xs
;;

let equal (left : t) (right : t) : bool =
  let rec go left right =
    match left, right with
      | [], [] -> true
      | x::xs, y::ys ->
          x = y && xs = ys
      | _, _ -> false
  in
    go left right
;;

let string_of_byte_sequence (ts : t) : string =
  let rec go ts index buffer =
    match ts with
      | []    -> buffer
      | x::xs ->
        let _ = String.set buffer index x in
          go xs (index + 1) buffer
  in
    if gt_big_int (length ts) (big_int_of_int Sys.max_string_length) then
      "string_of_byte_sequence: sequence too large for OCaml strings"
    else
      go ts 0 (String.create (int_of_big_int (length ts)))
;;

let bytes_of_unsigned_char (u : Uint32_wrapper.uint32) =
  assert false
;;