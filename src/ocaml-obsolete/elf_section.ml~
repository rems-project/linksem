open Error_monad

type elf_section_header =
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

let elf32_section_header_size =
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

let string_of_elf_section_type ty =
	if Int64.of_string "0" = ty then
		"NULL"
	else if Int64.of_string "1" = ty then
		"PROGBITS"
	else if Int64.of_string "2" = ty then
		"SYMTAB"
	else if Int64.of_string "3" = ty then
		"STRTAB"
	else if Int64.of_string "4" = ty then
		"RELA"
	else if Int64.of_string "5" = ty then
		"HASH"
	else if Int64.of_string "6" = ty then
		"DYNAMIC"
	else if Int64.of_string "7" = ty then
		"NOTE"
	else if Int64.of_string "8" = ty then
		"NOBITS"
	else if Int64.of_string "9" = ty then
		"REL"
	else if Int64.of_string "10" = ty then
		"SHLIB"
	else if Int64.of_string "11" = ty then
		"DYNSYM"
	else if Int64.of_string "14" = ty then
		"INIT_ARRAY"
	else if Int64.of_string "15" = ty then
		"FINI_ARRAY"
	else if Int64.of_string "16" = ty then
		"PREINIT_ARRAY"
	else if Int64.of_string "17" = ty then
		"GROUP"
	else if Int64.of_string "18" = ty then
		"SYMTAB_SHNDX"
	else if Int64.of_string "0x60000000" = ty then
		"LOOS"
	else if Int64.of_string "0x6fffffff" = ty then
		"HIOS"
	else if Int64.of_string "0x70000000" = ty then
		"LOPROC"
	else if Int64.of_string "0x7fffffff" = ty then
		"HIPROC"
	else if Int64.of_string "0x80000000" = ty then
		"LOUSER"
	else if Int64.of_string "0xffffffff" = ty then
		"HIUSER"
	else
		"ABI specific or unspecified"
;;

let string_of_elf_section_header sect =
  BatString.concat "\n" [
    "ELF section name index: " ^ Utility.hex_string_of_int64 sect.sh_name
  ; "ELF section type: " ^ string_of_elf_section_type sect.sh_type
  ; "ELF section flags: " ^ Utility.hex_string_of_int64 sect.sh_flags
  ; "ELF section start address: " ^ Utility.hex_string_of_int64 sect.sh_addr
  ; "ELF section start offset: " ^ Utility.hex_string_of_int64 sect.sh_offset
  ; "ELF section size (bytes): " ^ Utility.hex_string_of_int64 sect.sh_size
  ; "ELF section link: " ^ Utility.hex_string_of_int64 sect.sh_link
  ; "ELF section address alignment: " ^ Utility.hex_string_of_int64 sect.sh_addralign
  ; "ELF section entity size (bytes): " ^ Utility.hex_string_of_int64 sect.sh_entsize
  ]
;;

let string_of_elf_section_header_table sects =
  BatString.concat "\n\n" (List.map string_of_elf_section_header sects)
;;

let read_elf32_section_header bitstring =
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
    | { _ } -> Error "read_elf32_section_header: cannot read section"
;;

let read_elf32_section_header_table size entry_size offset bitstream =
  let rec go bitstream =
    if Bitstring.bitstring_length bitstream = 0 then
      return []
    else if Bitstring.bitstring_length bitstream < 0 then
        Error "read_elf32_section_header_table: invalid bitstream length"
    else
      let eat, rest = Utility.partition_bitstring entry_size bitstream in
        read_elf32_section_header eat >>= fun sect ->
        go rest                       >>= fun tail ->
        return (sect::tail)
  in
    let prefix, relevant = Utility.partition_bitstring offset bitstream in
    let eat, rest = Utility.partition_bitstring (size * entry_size) relevant in
      go eat >>= fun entries ->
      return (entries, rest)
;;
