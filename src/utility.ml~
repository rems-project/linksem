let partition_bitstring size bitstring =
	let _ = Printf.printf "Partitioning bitstring at %i...\n" size in
  Bitstring.takebits size bitstring, Bitstring.dropbits size bitstring
;;

let decimal_string_of_int64 e =
  let i = Int64.to_int e in
    string_of_int i
;;

let hex_string_of_int64 (e : Int64.t) : string =
  let i = Int64.to_int e in
    Printf.sprintf "0x%x" i
;;
