type ('a, 'b) error =
  | Error of 'a
  | Success of 'b
;;

let map f e =
  match e with
    | Error err -> Error err
    | Success s -> Success (f s)
;;

let (<$>) = map
;;

let (<*>) f x =
  match f, x with
    | Success f', Success x' -> Success (f' x')
    | Success f', Error e    -> Error e
    | Error e   , _          -> Error e
;;

let (>>=) (err : ('a, 'b) error) (f : 'b -> ('a, 'c) error) : ('a, 'c) error  =
  match err with
  | Error e   -> Error e
  | Success s -> f s
;;

let (>>) (f : ('a, 'b) error) (g : ('a, 'c) error) = f >>= fun _ -> g
;; 

let return (s : 'b) : ('a, 'b) error = Success s
;;