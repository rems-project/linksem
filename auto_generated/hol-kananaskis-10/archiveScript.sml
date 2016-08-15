(*Generated by Lem from archive.lem.*)
open HolKernel Parse boolLib bossLib;
open lem_numTheory lem_listTheory lem_basic_classesTheory lem_boolTheory lem_maybeTheory lem_stringTheory lem_assert_extraTheory showTheory missing_pervasivesTheory errorTheory byte_sequenceTheory;

val _ = numLib.prefer_num();



val _ = new_theory "archive"

(*open import Basic_classes*)
(*open import Bool*)
(*open import List*)
(*open import Num*)
(*open import Maybe*)
(*open import String*)
(*open import Show*)
(*open import Assert_extra*)

(*open import Missing_pervasives*)
(*open import Byte_sequence*)
(*open import Error*)

val _ = Hol_datatype `
 archive_entry_header =
  <| name      : string
   ; timestamp : num
   ; uid       : num
   ; gid       : num
   ; mode      : num
   ; size0      : num (* 1GB should be enough *)
   |>`;


val _ = type_abbrev( "archive_global_header" , ``: char
  list``);

(*val string_of_byte_sequence : byte_sequence -> string*)
val _ = Define `
 (string_of_byte_sequence0 seq=  
 ((case seq of
      Sequence bs => IMPLODE (MAP (CHR o w2n) bs)
  )))`;


(*val read_archive_entry_header : natural -> byte_sequence -> error (archive_entry_header * natural * byte_sequence)*)
val _ = Define `
 (read_archive_entry_header seq_length seq=  
 (let magic_bytes = ([(n2w : num -> 8 word(I 96)) (* 0x60 *); (n2w : num -> 8 word(I 10)) (* 0x0a *)]) in
        let header_length =(I 60) in
        (* let _ = Missing_pervasives.errs ("Archive entry header? " ^ (show (take 16 bs)) ^ "? ") in *)
        partition_with_length header_length seq_length seq >>= (\ (header, rest) .  
        offset_and_cut(I 58)(I 2) header >>= (\ magic .  
        offset_and_cut(I 0)(I 16) header >>= (\ name .  
        offset_and_cut(I 16)(I 12) header >>= (\ timestamp_str .  
        offset_and_cut(I 28)(I 6)  header >>= (\ uid_str .  
        offset_and_cut(I 34)(I 6)  header >>= (\ gid_str .  
        offset_and_cut(I 40)(I 8)  header >>= (\ mode_str .  
        offset_and_cut(I 48)(I 10) header >>= (\ size_str .  
        let size1 = (natural_of_decimal_string (string_of_byte_sequence0 size_str)) in 
                (* let _ = Missing_pervasives.errln (": yes, size " ^ (show size)) in *)
        return (<| name := (string_of_byte_sequence0 name); timestamp := ((I 0 : num)) (* FIXME *);
          uid :=(I 0) (* FIXME *) ; gid :=(I 0) (* FIXME *) ; mode :=(I 0) (* FIXME *);
            size0 := ( size1) (* FIXME *) |>, (seq_length - header_length), rest)))))))))))`;


(*val read_archive_global_header : byte_sequence -> error (archive_global_header * byte_sequence)*)
val _ = Define `
 (read_archive_global_header seq=  
 ((case seq of
      Sequence bs =>
            (* let _ = Missing_pervasives.errs ("Archive? " ^ (show (take 16 bs)) ^ "? ")
            in*)
      let chars = (MAP (CHR o w2n) (take(I 8) bs)) in 
        if IMPLODE chars = "!<arch>\n" then
          (* let _ = Missing_pervasives.errln ": yes" in *)
          return (chars, Sequence(drop(I 8) bs))
        else
          (* let _ = Missing_pervasives.errln ": no" in *)
          fail0 "read_archive_global_header: not an archive"
    )))`;


(*val accum_archive_contents : (list (string * byte_sequence)) -> maybe string -> natural -> byte_sequence -> error (list (string * byte_sequence))*)
 val accum_archive_contents_defn = Hol_defn "accum_archive_contents" `
 (accum_archive_contents accum extended_filenames whole_seq_length whole_seq=  
(  
  (* let _ = Missing_pervasives.errs "Can read a header? " in *)if ~ ((byte_sequence$length0 whole_seq) = whole_seq_length) then
    lem_assert_extra$fail (* invariant: whole_seq_length always equal to length of whole_seq, so the length is only
      computed one.  This "fail" needed for Isabelle termination proofs... *)
  else
  (case (read_archive_entry_header whole_seq_length whole_seq) of
      Fail _ => return accum
    | Success (hdr, (seq_length : num), seq) =>
    (case seq of
        Sequence next_bs =>
        (* let _ = Missing_pervasives.errln ("yes; next_bs has length " ^ (show (List.length next_bs))) in *)
        let amount_to_drop =          
(if (hdr.size0 MOD I 2) =I 0 then
            (I hdr.size0)
          else
            (I hdr.size0) +I 1)
        in
        if amount_to_drop =I 0 then
          fail0 "accum_archive_contents: amount to drop from byte sequence is 0"
        else
        (*let _ = Missing_pervasives.errln ("amount_to_drop is " ^ (show amount_to_drop)) in*)
        let chunk = (Sequence(TAKE hdr.size0 next_bs))
        in
        (*let _ = Missing_pervasives.errs ("Processing archive header named " ^ hdr.name)
        in*)
        let (new_accum, (new_extended_filenames :  string option)) =          
(let name = (EXPLODE hdr.name) in
            if name = [#"/"; #" "; #" "; #" "; #" "; #" "; #" "; #" "; #" "; #" "; #" "; #" "; #" "; #" "; #" "; #" "] then
              (* SystemV symbol lookup table; we skip this *) (accum, extended_filenames)
            else
              (case name of
                  x::xs =>
                  if x = #"/" then
                    (case xs of
                        y::ys =>
                        if y = #"/" then
                          (accum, SOME (string_of_byte_sequence0 chunk))
                        else
                          let index = (natural_of_decimal_string (IMPLODE xs)) in
                            (case extended_filenames of 
                                NONE => failwith "corrupt archive: reference to non-existent extended filenames"
                              | SOME s => 
                                let table_suffix = ((case Elf_Local$string_suffix index s of SOME x => x | NONE => "" )) in
                                let index = ((case string_index_of #"/" table_suffix of SOME x => x | NONE => (I (STRLEN table_suffix)) )) in 
                                let ext_name = ((case string_prefix index table_suffix of SOME x => x | NONE => "" )) in
                                  (*let _ = Missing_pervasives.errln ("Got ext_name " ^ ext_name) in*)
                                  (((ext_name, chunk) :: accum), extended_filenames)
                           )
                      | [] =>
                        let index = (natural_of_decimal_string (IMPLODE xs)) in
                          (case extended_filenames of 
                              NONE => failwith "corrupt archive: reference to non-existent extended filenames"
                            | SOME s => 
                              let table_suffix = ((case Elf_Local$string_suffix index s of SOME x => x | NONE => "" )) in
                              let index = ((case string_index_of #"/" table_suffix of SOME x => x | NONE => (I (STRLEN table_suffix)) )) in 
                              let ext_name = ((case string_prefix index table_suffix of SOME x => x | NONE => "" )) in
                                (*let _ = Missing_pervasives.errln ("Got ext_name " ^ ext_name) in*)
                                (((ext_name, chunk) :: accum), extended_filenames)
                         )
                    )
                  else
                    (((hdr.name, chunk) :: accum), extended_filenames)
                | [] => (((hdr.name, chunk) :: accum), extended_filenames)
              ))
        in
          (case (byte_sequence$dropbytes amount_to_drop seq) of
              Fail _ => return accum
            | Success new_seq =>
              accum_archive_contents new_accum new_extended_filenames (seq_length - amount_to_drop) new_seq
          )
    )
  )))`;

val _ = Lib.with_flag (computeLib.auto_import_definitions, false) Defn.save_defn accum_archive_contents_defn;

(*val read_archive : byte_sequence -> error (list (string * byte_sequence))*)
val _ = Define `
 (read_archive bs=    
  (read_archive_global_header bs >>= (\ (hdr, seq) .  
    let result = (accum_archive_contents [] NONE (byte_sequence$length0 seq) seq)  in 
    (* let _ = Missing_pervasives.errln "Finished reading archive" in *)
    (case result of
        Success r => Success (REVERSE r)
        | Fail x => Fail x
    ))))`;

val _ = export_theory()

