open Error_monad

type elf_header =
  { e_ident     : Bitstring.bitstring;
    e_type      : Int64.t;
    e_machine   : Int64.t;
    e_version   : Int64.t;
    e_entry     : Int64.t;
    e_phoff     : Int64.t;
    e_shoff     : Int64.t;
    e_flags     : Int64.t;
    e_ehsize    : Int64.t;
    e_phentsize : Int64.t;
    e_phnum     : Int64.t;
    e_shentsize : Int64.t;
    e_shnum     : Int64.t;
    e_shstrndx  : Int64.t;
  }

let get_program_header_table_size_and_entries hdr =
  let size = Int64.to_int hdr.e_phnum in
  let entry_size = Int64.to_int hdr.e_phentsize * 8 in
    size, entry_size
;;

let get_section_header_table_size_entries_and_offset hdr =
  let size = Int64.to_int hdr.e_shnum in
  let entry_size = Int64.to_int hdr.e_shentsize * 8 in
  let offset = Int64.to_int hdr.e_shoff * 8 in
    size, entry_size, offset
;;

let is_section_header_table_present hdr =
	Int64.to_int hdr.e_shoff != 0
;;

let elf32_magic_number_width = 4 * 8
let elf32_e_ident_width = 12 * 8
let elf32_e_type_width = 16
let elf32_e_machine_width = 16
let elf32_e_version_width = 32
let elf32_e_entry_width = 32
let elf32_e_phoff_width = 32
let elf32_e_shoff_width = 32
let elf32_e_flags_width = 32
let elf32_e_ehsize_width = 16
let elf32_e_phentsize_width = 16
let elf32_e_phnum_width = 16
let elf32_e_shentsize_width = 16
let elf32_e_shnum_width = 16
let elf32_e_shstrndx_width = 16

let elf32_header_size =
  elf32_magic_number_width +
  elf32_e_ident_width +
  elf32_e_type_width +
  elf32_e_machine_width +
  elf32_e_version_width +
  elf32_e_entry_width +
  elf32_e_phoff_width +
  elf32_e_shoff_width +
  elf32_e_flags_width +
  elf32_e_ehsize_width +
  elf32_e_phentsize_width +
  elf32_e_phnum_width +
  elf32_e_shentsize_width +
  elf32_e_shnum_width +
  elf32_e_shstrndx_width
;;

let string_of_elf_header (hdr : elf_header) : string =
  let string_of_type e =
    let e = Int64.to_int e in
    if e = 0 then
      "No file type"
    else if e = 1 then
      "Relocatable file type"
    else if e = 2 then
      "Executable file type"
    else if e = 3 then
      "Shared object file"
    else if e = 4 then
      "Core file"
    else if e >= 65024 && e <= 65279 then
      "Operating system specific"
    else if e >= 65280 && e <= 65535 then
      "Processor specific"
    else
      "Unknown file type"
  in
  let string_of_version e =
    let i = Int64.to_int e in
    if i = 0 then
      "Invalid version"
    else if i = 1 then
      "Current version"
    else
      "Future version"
  in
  BatString.concat "\n" [
    "ELF identifier: " ^ Bitstring.string_of_bitstring hdr.e_ident
  ; "ELF file type: "  ^ string_of_type hdr.e_type
  ; "ELF machine architecture: " ^ Utility.decimal_string_of_int64 hdr.e_machine
  ; "ELF file version: " ^ string_of_version hdr.e_version
  ; "ELF entry point: " ^ Utility.hex_string_of_int64 hdr.e_entry
  ; "ELF program header table offset: " ^ Utility.hex_string_of_int64 hdr.e_phoff
  ; "ELF section header table offset: " ^ Utility.hex_string_of_int64 hdr.e_shoff
  ; "ELF flags: " ^ Utility.hex_string_of_int64 hdr.e_flags
  ; "ELF header size (bytes): " ^ Utility.decimal_string_of_int64 hdr.e_ehsize
  ; "ELF program header table entry size (bytes): " ^ Utility.decimal_string_of_int64 hdr.e_phentsize
  ; "ELF program header table entries: " ^ Utility.decimal_string_of_int64 hdr.e_phnum
  ; "ELF section header table entry size (bytes): " ^ Utility.decimal_string_of_int64 hdr.e_shentsize
  ; "ELF section header table entries: " ^ Utility.decimal_string_of_int64 hdr.e_shnum
  ; "ELF string table index: " ^ Utility.hex_string_of_int64 hdr.e_shstrndx
  ]
;;

let read_elf32_header bitstring =
  let eat, rest = Utility.partition_bitstring elf32_header_size bitstring in
    bitmatch eat with
    | { 0x7f        : 8;
        "ELF"       : 24                      : string;
        e_ident     : elf32_e_ident_width     : bitstring;    (* ELF header *)
        e_type      : elf32_e_type_width      : littleendian; (* ELF file type *)
        e_machine   : elf32_e_machine_width   : littleendian; (* ELF machine architecture *)
        e_version   : elf32_e_version_width   : littleendian; (* ELF file version *)
        e_entry     : elf32_e_entry_width     : littleendian;
        e_phoff     : elf32_e_phoff_width     : littleendian;
        e_shoff     : elf32_e_shoff_width     : littleendian;
        e_flags     : elf32_e_flags_width     : littleendian;
        e_ehsize    : elf32_e_ehsize_width    : littleendian;
        e_phentsize : elf32_e_phentsize_width : littleendian;
        e_phnum     : elf32_e_phnum_width     : littleendian;
        e_shentsize : elf32_e_shentsize_width : littleendian;
        e_shnum     : elf32_e_shnum_width     : littleendian;
        e_shstrndx  : elf32_e_shstrndx_width  : littleendian
      } ->
       Success ({
         e_ident; e_type; e_machine; e_version; e_entry; e_phoff; e_shoff;
         e_flags; e_ehsize; e_phentsize; e_phnum; e_shentsize; e_shnum;
         e_shstrndx
       }, rest)
  | { _ } -> Error "Cannot read ELF header"
;;
