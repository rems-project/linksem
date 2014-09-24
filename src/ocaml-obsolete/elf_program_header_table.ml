open Error_monad

type elf_program_header_entry =
  { p_type   : Int64.t
  ; p_offset : Int64.t
  ; p_vaddr  : Int64.t
  ; p_paddr  : Int64.t
  ; p_filesz : Int64.t
  ; p_memsz  : Int64.t
  ; p_flags  : Int64.t
  ; p_align  : Int64.t
  }

type elf_program_header_table = elf_program_header_entry list
;;

let elf32_p_type_width = 32
let elf32_p_offset_width = 32
let elf32_p_vaddr_width = 32
let elf32_p_paddr_width = 32
let elf32_p_filesz_width = 32
let elf32_p_memsz_width = 32
let elf32_p_flags_width = 32
let elf32_p_align_width = 32

let elf32_program_header_entry_size =
  elf32_p_type_width +
  elf32_p_offset_width +
  elf32_p_vaddr_width +
  elf32_p_paddr_width +
  elf32_p_filesz_width +
  elf32_p_memsz_width +
  elf32_p_flags_width +
  elf32_p_align_width
;;

let string_of_elf_program_header_entry hdr =
  BatString.concat "\n" [
    "ELF program header type: " ^ Utility.hex_string_of_int64 hdr.p_type
  ; "ELF segment offset: " ^ Utility.hex_string_of_int64 hdr.p_offset
  ; "ELF segment virtual address: " ^ Utility.hex_string_of_int64 hdr.p_vaddr
  ; "ELF segment physical address: " ^ Utility.hex_string_of_int64 hdr.p_paddr
  ; "ELF segment size in file image (bytes): " ^ Utility.hex_string_of_int64 hdr.p_filesz
  ; "ELF segment size in memory image (bytes): " ^ Utility.hex_string_of_int64 hdr.p_memsz
  ; "ELF segment flags: " ^ Utility.hex_string_of_int64 hdr.p_flags
  ]

let string_of_elf_program_header_table tbl =
  BatString.concat "\n\n" (List.map string_of_elf_program_header_entry tbl)
;;

let read_elf32_program_header_entry bitstring =
  bitmatch bitstring with
    | { p_type   : elf32_p_type_width   : littleendian
      ; p_offset : elf32_p_offset_width : littleendian
      ; p_vaddr  : elf32_p_vaddr_width  : littleendian
      ; p_paddr  : elf32_p_paddr_width  : littleendian
      ; p_filesz : elf32_p_filesz_width : littleendian
      ; p_memsz  : elf32_p_memsz_width  : littleendian
      ; p_flags  : elf32_p_flags_width  : littleendian
      ; p_align  : elf32_p_align_width  : littleendian
      } ->
        Success {
          p_type; p_offset; p_vaddr; p_paddr; p_filesz
        ; p_memsz; p_flags; p_align
        }
    | { _ } -> Error "Cannot read ELF program header entry"

let read_elf32_program_header_table num size bitstring =
  let rec go bitstring =
    if Bitstring.bitstring_length bitstring = 0 then
      return []
    else if Bitstring.bitstring_length bitstring < 0 then
      Error "read_elf32_program_header_table: invalid bitstring length"
    else
      let eat, rest = Utility.partition_bitstring size bitstring in
      read_elf32_program_header_entry eat >>= fun entry ->
      go rest >>= fun tail ->
      return (entry::tail)
  in
    let eat, rest = Utility.partition_bitstring (num * size) bitstring in
    go eat >>= fun entries ->
    return (entries, rest)
;;