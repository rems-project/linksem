open Buffer
open Error
open List

type byte_sequence = {
  bytes: Bytes.t;
  start: int;
  len: int
}

let of_bytes b =
  { bytes = b; start = 0; len = Bytes.length b }

let length bs =
  bs.len

let capacity bs =
  (Bytes.length bs.bytes) - bs.start

let empty = { bytes = Bytes.empty; start = 0; len = 0 }

let acquire (filename : string) =
  let ic = open_in_bin filename in
  let len = in_channel_length ic in
  let b = Bytes.create len in
  really_input ic b 0 len;
  close_in ic;
  Success (of_bytes b)

let serialise (filename : string) bs =
  let oc = open_out_bin filename in
  output oc bs.bytes bs.start bs.len;
  close_out oc;
  Success ()

let get bs i =
  Bytes.get bs.bytes (bs.start + i)

let unsafe_get bs i =
  Bytes.unsafe_get bs.bytes (bs.start + i)

let read_char bs =
  if length bs = 0 then Fail "read_char: sequence is empty"
  else Success (unsafe_get bs 0, { bs with start = bs.start + 1; len = bs.len - 1 })

let find_byte bs b =
  match Bytes.index_from_opt bs.bytes bs.start b with
  | Some i ->
    let i = i - bs.start in
    if i < bs.len then Some i else None
  | None -> None

let make len c =
  of_bytes (Bytes.make len c)

let concat l = match l with
  | [] -> empty
  | [bs] -> bs
  | bs::_ ->
    let buf = Buffer.create bs.len in
    List.iter (fun bs ->
      Buffer.add_subbytes buf bs.bytes bs.start bs.len
    ) l;
    of_bytes (Buffer.to_bytes buf)

let zero_pad_to_length len bs =
  let pad = bs.len - len in
  if pad <= 0 then
    bs
  else
    let grow = (capacity bs) - len in
    let prev_len = Bytes.length bs.bytes in
    let b = if grow > 0 then
      Bytes.extend bs.bytes 0 grow
    else
      bs.bytes
    in
    Bytes.fill b prev_len pad '0';
    { bs with bytes = b; len = bs.len + pad }

let to_string bs =
  Bytes.sub_string bs.bytes bs.start bs.len

let rec list_init_tailrec_aux acc i n f =
  if i >= n then acc
  else list_init_tailrec_aux (f i :: acc) (i+1) n f

let list_init len f =
  List.rev (list_init_tailrec_aux [] 0 len f)

(* Note: byte lists are lame *)
let to_char_list bs =
  (* TODO: OCaml >= 4.06 has List.init, use that instead *)
  list_init bs.len (fun i -> unsafe_get bs i)

let from_char_list l =
  let n = List.length l in
  let res = Bytes.create n in
  let rec from_at i = function
    | [] -> ()
    | c :: xc -> Bytes.unsafe_set res i c; from_at (i+1) xc
  in
  from_at 0 l;
  of_bytes res

exception Different of int

let compare bs1 bs2 =
  let d = bs2.len - bs1.len in
  if d <> 0 then
    d
  else if bs1.len = 0 then
    0
  else
    try
      for i = 0 to bs1.len - 1 do
        let c1 = get bs1 i in
        let c2 = get bs2 i in
        let d = (int_of_char c2) - (int_of_char c1) in
        if d <> 0 then
          raise (Different d)
      done;
      0
    with Different d -> d

let equal bs1 bs2 =
  compare bs1 bs2 = 0

let dropbytes len bs =
  if len > bs.len then
    Fail "dropbytes: cannot drop more bytes than are contained in sequence"
  else
    (* TODO: maybe shrink the bytes? *)
    Success { bs with start = bs.start + len; len = bs.len - len }

let takebytes len bs =
  if len > bs.len then
    Fail "takebytes: cannot take more bytes than are contained in sequence"
  else
    Success { bs with len }

(* Lem bindings, OCaml implementation *)

let big_num_length bs =
  Nat_big_num.of_int (length bs)

let big_num_find_byte bs b=
  match find_byte bs b with
  | Some i -> Some (Nat_big_num.of_int i)
  | None -> None

let big_num_make len c =
  make (Nat_big_num.to_int len) c

let big_num_zero_pad_to_length len bs =
  zero_pad_to_length (Nat_big_num.to_int len) bs

let big_num_dropbytes len bs =
  dropbytes (Nat_big_num.to_int len) bs

let big_num_takebytes len bs =
  takebytes (Nat_big_num.to_int len) bs

let takebytes_with_length count bs_length bs =
  if length bs <> (Nat_big_num.to_int bs_length) then
    fail "takebytes_with_length: invalid length"
  else
    big_num_takebytes count bs

(* Lem bindings, generic implementation *)

let char_list_of_byte_list l = l

let acquire_byte_list filename =
  match acquire filename with
  | Success bs -> Success (to_char_list bs)
  | Fail msg -> Fail msg

let serialise_byte_list filename l =
  serialise filename (from_char_list l)
