open Error_monad

type elf_section =
  { sh_name      : Int64.t
  ; sh_type      : Int64.t
  ; sh_flags     : Int64.t
  ; sh_addr      : Int64.t
  ; sh_offset    : Int64.t
  ; sh_size      : Int64.t
  ; sh_link      : Int64.t
  ; sh_info      : Int64.t
  ; sh_addralign : Int64.t
  ; sh_entsize   : Int64.t
  }

let elf32_sh_name_width = 32
let elf32_sh_type_width = 32
let elf32_sh_flags_width = 32
let elf32_sh_addr_width = 32
let elf32_sh_offset_width = 32
let elf32_sh_size_width = 32
let elf32_sh_link_width = 32
let elf32_sh_info_width = 32
let elf32_sh_addralign_width = 32
let elf32_sh_entsize_width = 32

let elf32_section_size =
  elf32_sh_name_width +
  elf32_sh_type_width +
  elf32_sh_flags_width +
  elf32_sh_addr_width +
  elf32_sh_offset_width +
  elf32_sh_size_width +
  elf32_sh_link_width +
  elf32_sh_info_width +
  elf32_sh_addralign_width +
  elf32_sh_entsize_width
;;

let string_of_elf_section sect =
  BatString.concat "\n" [
    "ELF section name index: " ^ Utility.hex_string_of_int64 sect.sh_name
  ; "ELF section type: " ^ Utility.hex_string_of_int64 sect.sh_type
  ; "ELF section flags: " ^ Utility.hex_string_of_int64 sect.sh_flags
  ; "ELF section start address: " ^ Utility.hex_string_of_int64 sect.sh_addr
  ; "ELF section start offset: " ^ Utility.hex_string_of_int64 sect.sh_offset
  ; "ELF section size (bytes): " ^ Utility.hex_string_of_int64 sect.sh_size
  ; "ELF section link: " ^ Utility.hex_string_of_int64 sect.sh_link
  ; "ELF section address alignment: " ^ Utility.hex_string_of_int64 sect.sh_addralign
  ; "ELF section entity size (bytes): " ^ Utility.hex_string_of_int64 sect.sh_entsize
  ]
;;

let string_of_elf_sections sects =
  BatString.concat "\n\n" (List.map string_of_elf_section sects)
;;

let read_elf32_section bitstring =
  bitmatch bitstring with
    | { sh_name      : elf32_sh_name_width      : littleendian;
        sh_type      : elf32_sh_type_width      : littleendian;
        sh_flags     : elf32_sh_flags_width     : littleendian;
        sh_addr      : elf32_sh_addr_width      : littleendian;
        sh_offset    : elf32_sh_offset_width    : littleendian;
        sh_size      : elf32_sh_size_width      : littleendian;
        sh_link      : elf32_sh_link_width      : littleendian;
        sh_info      : elf32_sh_info_width      : littleendian;
        sh_addralign : elf32_sh_addralign_width : littleendian;
        sh_entsize   : elf32_sh_entsize_width   : littleendian
      } ->
        Success {
          sh_name; sh_type; sh_flags; sh_addr; sh_offset; sh_size;
          sh_link; sh_info; sh_addralign; sh_entsize
        }
    | { _ } -> Error "read_elf32_section: cannot read section"
;;

let read_elf32_sections size entry_size bitstream =
  let rec go bitstream =
    if Bitstring.bitstring_length bitstream = 0 then
      return []
    else if Bitstring.bitstring_length bitstream < 0 then
      let _ = Logging.log_error ("read_elf32_sections: " ^ string_of_int (Bitstring.bitstring_length bitstream)) in
      Error "read_elf32_sections: invalid bitstream length"
    else
      let eat, rest = Utility.partition_bitstring entry_size bitstream in
      let _ = Logging.log_info ("read_elf32_sections: " ^ string_of_int (Bitstring.bitstring_length eat)) in
      read_elf32_section eat >>= fun sect ->
      go rest                >>= fun tail ->
      return (sect::tail)
  in
    let eat, rest = Utility.partition_bitstring (size * entry_size) bitstream in
    go eat >>= fun entries ->
    return (entries, rest)
;;