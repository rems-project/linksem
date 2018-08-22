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

let dirname p =
  let l = Ml_bindings.split_string_on_char p '/' in
  let (l, _) = pop_last l in
  String.concat "/" l

let readlink p =
  try
    return (Unix.readlink p)
  with Unix.Unix_error (code, name, arg) ->
    Error.fail ("readlink: " ^ (Unix.error_message code))

let is_abs_path p =
  String.get p 0 = '/'

let rec normalize' first l =
  match l with
    | s :: ".." :: t -> normalize' false t
    | "" :: t ->
      let t = normalize' false t in
      if first then "" :: t else t
    | s :: t -> s :: (normalize' false t)
    | [] -> []

let normalize p =
  let l = Ml_bindings.split_string_on_char p '/' in
  let l = normalize' true l in
  String.concat "/" l

let to_absolute working_dir p =
  if is_abs_path p then
    normalize p
  else
    normalize (working_dir ^ "/" ^ p)

let readlink_abs root p =
  match readlink p with
    | Success target ->
      let target =
        if is_abs_path target then
          root ^ target
        else
          let l = Ml_bindings.split_string_on_char p '/' in
          let l = replace_last l target in
          String.concat "/" l
      in
      return target
    | Fail err ->
      Error.fail err

(* TODO: this doesn't support relative paths *)
let rec realpath_in' root p =
  match readlink_abs root p with
    | Success p -> (
      match realpath_in' root p with
        | Success p -> (
          let l = Ml_bindings.split_string_on_char p '/' in
          let (l, maybe_last) = pop_last l in
          match (l, maybe_last) with
            | ([""], _) | (_, None) -> return p
            | (_, Some filename) -> (
              let parent = String.concat "/" l in
              match realpath_in' root parent with
                | Success parent -> return (parent ^ "/" ^ filename)
                | Fail err -> Error.fail err
              )
          )
        | Fail err -> Error.fail err
      )
    | Fail _ ->
      (* TODO: this is ugly, but this is OCaml *)
      return p

let rec realpath_in root p =
  match realpath_in' root p with
    | Success p -> return (normalize p)
    | Fail err -> Error.fail err

(* The OCaml's stdlib is retarded and doesn't have realpath *)
let realpath p =
  realpath_in "" p

let readdir dirname =
  try
    let a = Sys.readdir dirname in
    return (Array.to_list a)
  with Sys_error err ->
    Error.fail ("readdir: " ^ err)
