open String
open Sys
open Unix

open Error

let rec replace_last l v =
  match l with
    | [] -> [v]
    | [_] -> [v]
    | h :: t -> h :: (replace_last t v)

(* The OCaml's stdlib is retarded and doesn't have realpath *)
let rec realpath p =
  try
    let target = Unix.readlink p in
    let p = if String.get target 0 <> '/' then
      let l = String.split_on_char '/' p in
      let l = replace_last l target in
      String.concat "/" l
    else
      target
    in
    realpath p
  with Unix.Unix_error _ -> p

let readdir dirname =
  try
    return (Sys.readdir dirname)
  with Sys_error err ->
    fail ("readdir: " ^ err)
