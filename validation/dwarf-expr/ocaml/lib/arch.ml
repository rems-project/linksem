(* Claude: the two target architectures of the harness.  For each: the DWARF register
   numbering, the register values the test program establishes before it stops at
   dw_here, the CFA rule in force there, and the assembler text of the program.
   Which assembler, linker, debugger and emulator to use for an architecture is
   decided by scripts/pipeline.py from what is installed on the host. *)

type regval =
  | Const of Z.t      (* a constant *)
  | Mem of int        (* the address dw_mem + offset *)

type t = {
  name : string;
  regnames : (int * string) list;          (* DWARF register number -> debugger register name *)
  regs : (int * regval) list;              (* register values at dw_here (by DWARF number) *)
  cfa_reg : int;                           (* at dw_here, CFA = register cfa_reg + cfa_off *)
  cfa_off : int;
  fake_fp : Z.t;                           (* the (fake) frame-pointer value loaded into cfa_reg *)
  fn_type : string;                        (* .type directive attribute: @function or %function *)
  progbits : string;                       (* @progbits or %progbits *)
  prologue : string;                       (* establishes the frame; ends with cfa_reg as the CFA register *)
  set_reg : int -> regval -> string;       (* one instruction loading a register *)
  exit_seq : string;                       (* exit(0) without returning *)
}

let z = Z.of_string

(* the register values, shared by both architectures (numbers are DWARF numbers) *)
let values = [
  0,  Mem 0;                          (* address of the known memory block *)
  1,  Const (z "0x10");
  2,  Const (z "0xffffffffffffffff"); (* -1 *)
  3,  Const (z "0x8000000000000000"); (* most negative *)
  4,  Const (z "0x7fffffffffffffff"); (* most positive *)
  5,  Mem 128;
  8,  Const (z "1");
  9,  Const (z "0x0101010101010101");
  10, Const (z "0x1234567890abcdef");
  11, Const (z "0");
  12, Const (z "63");
  13, Const (z "64");
  14, Const (z "0xfffffffffffffff0"); (* -16 *)
  15, Mem 255;
]

let fake_fp = z "0x700000000000"

let x86_64 =
  let regnames = [0,"rax"; 1,"rdx"; 2,"rcx"; 3,"rbx"; 4,"rsi"; 5,"rdi"; 6,"rbp"; 7,"rsp";
                  8,"r8"; 9,"r9"; 10,"r10"; 11,"r11"; 12,"r12"; 13,"r13"; 14,"r14"; 15,"r15"; 16,"rip"] in
  let name_of r = List.assoc r regnames in
  { name = "x86_64"; regnames;
    regs = values @ [6, Const fake_fp];
    cfa_reg = 6; cfa_off = 16; fake_fp;
    fn_type = "@function"; progbits = "@progbits";
    prologue = "\tpush %rbp\n\t.cfi_def_cfa_offset 16\n\t.cfi_offset %rbp, -16\n\tmov %rsp, %rbp\n\t.cfi_def_cfa_register %rbp\n";
    set_reg = (fun r v -> match v with
        | Const c -> Printf.sprintf "\tmovabs $0x%s, %%%s\n" (Z.format "x" c) (name_of r)
        | Mem off -> Printf.sprintf "\tlea dw_mem+%d(%%rip), %%%s\n" off (name_of r));
    exit_seq = "\tmov $60, %eax\n\txor %edi, %edi\n\tsyscall\n" }

let aarch64 =
  let regnames = List.init 31 (fun i -> (i, Printf.sprintf "x%d" i)) @ [31, "sp"] in
  let name_of r = List.assoc r regnames in
  { name = "aarch64"; regnames;
    regs = values @ [29, Const fake_fp];
    cfa_reg = 29; cfa_off = 16; fake_fp;
    fn_type = "%function"; progbits = "%progbits";
    prologue = "\tstp x29, x30, [sp, #-16]!\n\t.cfi_def_cfa_offset 16\n\t.cfi_offset 29, -16\n\t.cfi_offset 30, -8\n\tmov x29, sp\n\t.cfi_def_cfa_register 29\n";
    set_reg = (fun r v -> match v with
        | Const c -> Printf.sprintf "\tldr %s, =0x%s\n" (name_of r) (Z.format "x" c)
        | Mem off -> Printf.sprintf "\tldr %s, =dw_mem+%d\n" (name_of r) off);
    exit_seq = "\tmov x8, #93\n\tmov x0, #0\n\tsvc #0\n" }

let all = [x86_64; aarch64]
let of_name n = match List.find_opt (fun a -> a.name = n) all with Some a -> a | None -> failwith ("unknown architecture " ^ n)

(* the 256 bytes of dw_mem: byte i is (37 i + 11) mod 256, so all bytes differ *)
let mem_size = 256
let mem_byte i = (37 * i + 11) land 0xff
