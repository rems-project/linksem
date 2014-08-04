(*Generated by Lem from elf_string_table.lem.*)
open Elf_header
open Elf_section_header
open Elf_types

open Bitstring
open Error
open Missing_pervasives

open Lem_basic_classes
open Lem_list
open Lem_maybe
open Lem_num
open Lem_string

let get_strings_of_string_table bs =	
(let strings = (Bitstring.string_of_bitstring bs) in
	  Ml_bindings.split_string_on_char strings '\000')

let read_elf32_string_table hdr sections bs : ( string list) error =	
((match sections with
		| None -> return []
		| Some sections ->
	    let idx = (Int64.to_int hdr.elf32_shstrndx) in
			let string_table  = (Lem_list.list_index sections idx) in
				(match string_table with
					| None -> Fail "read_elf32_string_table: string table index too large"
					| Some string_table ->
         			let offset        = (Int64.to_int string_table.elf32_sh_offset) in
			        let size          = (Int64.to_int string_table.elf32_sh_size) in
			        let (_, initial)  = (Utility.partition_bitstring (offset * 8) bs) in
			        let (relevant, _) = (Utility.partition_bitstring (size * 8) initial) in
				        return (get_strings_of_string_table relevant)
				)
	))
	
let string_of_elf32_string_table tbl =  
("String table contents:" ^ ("\n\t" ^    
(List.fold_right (^) tbl "" ^ "\n\n")))
