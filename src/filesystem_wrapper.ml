open String
open Sys
open Unix

open Error

let rec replace_last l v =
  match l with
    | [] -> [v]
    | [_] -> [v]
    | h :: t -> h :: (replace_last t v)

let rec pop_last l =
  match l with
    | [] -> ([], None)
    | [last] -> ([], Some last)
    | h :: t ->
      let (t, maybe_last) = pop_last t in
      (h :: t, maybe_last)

let readlink p =
  try
    return (Unix.readlink p)
  with Unix.Unix_error (code, name, arg) ->
    Error.fail ("readlink: " ^ (Unix.error_message code))

let is_abs_path p =
  String.get p 0 = '/'

let readlink_abs p =
  match readlink p with
    | Success target ->
      let target =
        if is_abs_path target then
          target
        else
          let l = String.split_on_char '/' p in
          let l = replace_last l target in
          String.concat "/" l
      in
      return target
    | Fail err ->
      Error.fail err

(* The OCaml's stdlib is retarded and doesn't have realpath *)
(* TODO: this doesn't support relative paths *)
let rec realpath p =
  match readlink_abs p with
    | Success p -> (
      match realpath p with
        | Success p -> (
          let l = String.split_on_char '/' p in
          let (l, maybe_last) = pop_last l in
          match (l, maybe_last) with
            | ([""], _) | (_, None) -> return p
            | (_, Some filename) -> (
              let parent = String.concat "/" l in
              match realpath parent with
                | Success parent -> return (parent ^ "/" ^ filename)
                | Fail err -> Error.fail err
              )
          )
        | Fail err -> Error.fail err
      )
    | Fail _ ->
      (* TODO: this is ugly, but this is OCaml *)
      return p

let readdir dirname =
  try
    let a = Sys.readdir dirname in
    return (Array.to_list a)
  with Sys_error err ->
    Error.fail ("readdir: " ^ err)
