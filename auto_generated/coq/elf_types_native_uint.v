(* Generated by Lem from elf_types_native_uint.lem. *)

Require Import Arith.
Require Import Bool.
Require Import List.
Require Import String.
Require Import Program.Wf.

Require Import coqharness.

Open Scope nat_scope.
Open Scope string_scope.

Require Import lem_basic_classes.
Require Export lem_basic_classes.

Require Import lem_bool.
Require Export lem_bool.

Require Import lem_num.
Require Export lem_num.

Require Import lem_string.
Require Export lem_string.

Require Import lem_assert_extra.
Require Export lem_assert_extra.


Require Import endianness.
Require Export endianness.


Require Import byte_sequence.
Require Export byte_sequence.

Require Import error.
Require Export error.

Require Import missing_pervasives.
Require Export missing_pervasives.

Require Import show.
Require Export show.






(* 

(** unsigned char type and bindings *)

Inductive unsigned_char : Type := .
Definition unsigned_char_default: unsigned_char  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)


Definition natural_of_byte  (b : elf_types_local.byte )
     : nat :=  nat_of_unsigned_char (unsigned_char_of_byte b).
(* [?]: removed value specification. *)

Definition read_unsigned_char  (endian : endianness ) (bs0 : byte_sequence )  : error ((unsigned_char *byte_sequence ) % type):= 
  byte_sequence.read_char bs0 >>= 
  (fun (p : (elf_types_local.byte *byte_sequence ) % type) =>
     match ( (p) ) with ( (u1,  bs1)) =>
       return0 (unsigned_char_of_byte u1, bs1) end).
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_unsigned_char  (u : unsigned_char )  : list (elf_types_local.byte ):=  [byte_of_unsigned_char u].
(* [?]: removed value specification. *)

(* [?]: removed top-level value definition. *)

Instance x42_Eq : Eq unsigned_char := {
   isEqual  :=  unsigned_char_equal;
   isInequal   l  r :=  negb (unsigned_char_equal l r)
}.

(* 

Instance x41_Show : Show unsigned_char := {
	 show  :=  string_of_unsigned_char
}.
 *)
(* 

(** ELF address type:
  * 4 byte unsigned type on 32-bit architectures.
  * 8 byte unsigned type on 64-bit architectures.
  *)

Inductive elf32_addr : Type := .
Definition elf32_addr_default: elf32_addr  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition read_elf32_addr  (endian : endianness ) (bs0 : byte_sequence )  : error ((elf32_addr *byte_sequence ) % type):= 
  match ( endian) with 
    | Little =>
      byte_sequence.read_4_bytes_le bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4),  bs1)) =>
       return0 (elf32_addr_of_quad b4 b3 b2 b1, bs1) end)
    | Big    =>
      byte_sequence.read_4_bytes_be bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4),  bs1)) =>
       return0 (elf32_addr_of_quad b4 b3 b2 b1, bs1) end)
  end.
(* [?]: removed value specification. *)

(* [?]: removed top-level value definition. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_elf32_addr  (endian : endianness ) (w : elf32_addr )  : list (elf_types_local.byte ):= 
  match ( endian) with 
    | Little => match ( quad_of_elf32_addr w) with (b0,  b1,  b2,  b3) => [b0; b1; b2; b3]
 end
    | Big    => match ( quad_of_elf32_addr w) with (b0,  b1,  b2,  b3) => [b3; b2; b1; b0]
 end
  end.

Instance x40_Eq : Eq elf32_addr := {
   isEqual  :=  elf32_addr_equal;
   isInequal   l  r :=  negb (elf32_addr_equal l r)
}.

(* 

Instance x39_Show : Show elf32_addr := {
	 show  :=  string_of_elf32_addr
}.
 *)
(* 

(** elf64_addr type and bindings *)

Inductive elf64_addr : Type := .
Definition elf64_addr_default: elf64_addr  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition read_elf64_addr  (endian : endianness ) (bs0 : byte_sequence )  : error ((elf64_addr *byte_sequence ) % type):= 
  match ( endian) with 
    | Little =>
      byte_sequence.read_8_bytes_le bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4,  b5,  b6,  b7,  b8),  bs1)) =>
       return0 (elf64_addr_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1) end)
    | Big    =>
      byte_sequence.read_8_bytes_be bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4,  b5,  b6,  b7,  b8),  bs1)) =>
       return0 (elf64_addr_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1) end)
  end.
(* [?]: removed value specification. *)

(* [?]: removed top-level value definition. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_elf64_addr  (endian : endianness ) (w : elf64_addr )  : list (elf_types_local.byte ):= 
  match ( endian) with 
    | Little => match ( oct_of_elf64_addr w) with (b0,  b1,  b2,  b3,  b4,  b5,  b6,  b7) =>
   [b0; b1; b2; b3; b4; b5; b6; b7] end
    | Big    => match ( oct_of_elf64_addr w) with (b0,  b1,  b2,  b3,  b4,  b5,  b6,  b7) =>
   [b7; b6; b5; b4; b3; b2; b1; b0] end
  end.
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)


Instance x38_Eq : Eq elf64_addr := {
   isEqual  :=  elf64_addr_equal;
   isInequal   l  r :=  negb (elf64_addr_equal l r)
}.

(* 

Instance x37_Show : Show elf64_addr := {
   show  :=  string_of_elf64_addr
}.
 *)
(* 

(** ELF half word type:
  * 2 byte unsigned type on 32-bit architectures.
  * 2 byte unsigned type on 64-bit architectures.
  *)

Inductive elf32_half : Type := .
Definition elf32_half_default: elf32_half  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition read_elf32_half  (endian : endianness ) (bs0 : byte_sequence )  : error ((elf32_half *byte_sequence ) % type):= 
  match ( endian) with 
    | Little =>
      byte_sequence.read_2_bytes_le bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2),  bs1)) =>
       return0 (elf32_half_of_dual b2 b1, bs1) end)
    | Big    =>
      byte_sequence.read_2_bytes_be bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2),  bs1)) =>
       return0 (elf32_half_of_dual b2 b1, bs1) end)
  end.
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed top-level value definition. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_elf32_half  (endian : endianness ) (h : elf32_half )  : list (elf_types_local.byte ):= 
  match ( endian) with 
    | Little => match ( dual_of_elf32_half h) with (b0,  b1) => [b0; b1] end
    | Big    => match ( dual_of_elf32_half h) with (b0,  b1) => [b1; b0] end
  end.

Instance x36_Eq : Eq elf32_half := {
   isEqual  :=  elf32_half_equal;
   isInequal   l  r :=  negb (elf32_half_equal l r)
}.

(* 

Instance x35_Show : Show elf32_half := {
	 show  :=  string_of_elf32_half
}.
 *)
(* 

(** elf64_half type and bindings *)

Inductive elf64_half : Type := .
Definition elf64_half_default: elf64_half  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition read_elf64_half  (endian : endianness ) (bs0 : byte_sequence )  : error ((elf64_half *byte_sequence ) % type):= 
  match ( endian) with 
    | Big =>
      byte_sequence.read_2_bytes_be bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2),  bs1)) =>
       return0 (elf64_half_of_dual b2 b1, bs1) end)
    | Little =>
      byte_sequence.read_2_bytes_le bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2),  bs1)) =>
       return0 (elf64_half_of_dual b2 b1, bs1) end)
  end.
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed top-level value definition. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_elf64_half  (endian : endianness ) (w : elf64_half )  : list (elf_types_local.byte ):= 
  match ( endian) with 
    | Big => match ( dual_of_elf64_half w) with (b0,  b1) => [b1; b0] end
    | Little    => match ( dual_of_elf64_half w) with (b0,  b1) => [b0; b1] end
  end.

Instance x34_Eq : Eq elf64_half := {
   isEqual  :=  elf64_half_equal;
   isInequal   l  r :=  negb (elf64_half_equal l r)
}.

(* 

Instance x33_Show : Show elf64_half := {
   show  :=  string_of_elf64_half
}.
 *)
(* 

(*
instance (Ord elf64_half)
    let compare = 
    let (<) = 
    let (<=) = 
    let (>) = 
    let (>=) = 
end
*)

(** ELF offset type:
  * 4 byte unsigned type on 32-bit architectures.
  * 8 byte unsigned type on 64-bit architectures.
  *)

Inductive elf32_off : Type := .
Definition elf32_off_default: elf32_off  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition read_elf32_off  (endian : endianness ) (bs0 : byte_sequence )  : error ((elf32_off *byte_sequence ) % type):= 
  match ( endian) with 
    | Little =>
      byte_sequence.read_4_bytes_le bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4),  bs1)) =>
       return0 (elf32_off_of_quad b4 b3 b2 b1, bs1) end)
    | Big    =>
      byte_sequence.read_4_bytes_be bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4),  bs1)) =>
       return0 (elf32_off_of_quad b4 b3 b2 b1, bs1) end)
  end.
(* [?]: removed value specification. *)

(* [?]: removed top-level value definition. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_elf32_off  (endian : endianness ) (w : elf32_off )  : list (elf_types_local.byte ):= 
  match ( endian) with 
    | Little => match ( quad_of_elf32_off w) with (b0,  b1,  b2,  b3) => [b0; b1; b2; b3]
 end
    | Big    => match ( quad_of_elf32_off w) with (b0,  b1,  b2,  b3) => [b3; b2; b1; b0]
 end
  end.

Instance x32_Eq : Eq elf32_off := {
   isEqual  :=  elf32_off_equal;
   isInequal   l  r :=  negb (elf32_off_equal l r)
}.

(* 

Instance x31_Show : Show elf32_off := {
	 show  :=  string_of_elf32_off
}.
 *)
(* 

(** elf64_off type and bindings *)

Inductive elf64_off : Type := .
Definition elf64_off_default: elf64_off  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition read_elf64_off  (endian : endianness ) (bs0 : byte_sequence )  : error ((elf64_off *byte_sequence ) % type):= 
  match ( endian) with 
    | Little =>
      byte_sequence.read_8_bytes_le bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4,  b5,  b6,  b7,  b8),  bs1)) =>
       return0 (elf64_off_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1) end)
    | Big    =>
      byte_sequence.read_8_bytes_be bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4,  b5,  b6,  b7,  b8),  bs1)) =>
       return0 (elf64_off_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1) end)
  end.
(* [?]: removed value specification. *)

(* [?]: removed top-level value definition. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_elf64_off  (endian : endianness ) (w : elf64_off )  : list (elf_types_local.byte ):= 
  match ( endian) with 
    | Little => match ( oct_of_elf64_off w) with (b0,  b1,  b2,  b3,  b4,  b5,  b6,  b7) =>
   [b0; b1; b2; b3; b4; b5; b6; b7] end
    | Big    => match ( oct_of_elf64_off w) with (b0,  b1,  b2,  b3,  b4,  b5,  b6,  b7) =>
   [b7; b6; b5; b4; b3; b2; b1; b0] end
  end.

Instance x30_Eq : Eq elf64_off := {
   isEqual  :=  elf64_off_equal;
   isInequal   l  r :=  negb (elf64_off_equal l r)
}.

(* 

Instance x29_Show : Show elf64_off := {
   show  :=  string_of_elf64_off
}.
 *)
(* 

(** ELF word type:
  * 4 byte unsigned type on 32-bit architectures.
  * 4 byte unsigned type on 64-bit architectures.
  *)

Inductive elf32_word : Type := .
Definition elf32_word_default: elf32_word  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition read_elf32_word  (endian : endianness ) (bs0 : byte_sequence )  : error ((elf32_word *byte_sequence ) % type):= 
  match ( endian) with 
    | Little =>
      byte_sequence.read_4_bytes_le bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4),  bs1)) =>
       return0 (elf32_word_of_quad b4 b3 b2 b1, bs1) end)
    | Big    =>
      byte_sequence.read_4_bytes_be bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4),  bs1)) =>
       return0 (elf32_word_of_quad b4 b3 b2 b1, bs1) end)
  end.
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed top-level value definition. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_elf32_word  (endian : endianness ) (w : elf32_word )  : list (elf_types_local.byte ):= 
  match ( endian) with 
    | Little => match ( quad_of_elf32_word w) with (b0,  b1,  b2,  b3) => [b0; b1; b2; b3]
 end
    | Big    => match ( quad_of_elf32_word w) with (b0,  b1,  b2,  b3) => [b3; b2; b1; b0]
 end
  end.

Instance x28_Eq : Eq elf32_word := {
   isEqual  :=  elf32_word_equal;
   isInequal   l  r :=  negb (elf32_word_equal l r)
}.

(* 

Instance x27_Show : Show elf32_word := {
	 show  :=  string_of_elf32_word
}.
 *)
(* 

(** elf64_word type and bindings *)

Inductive elf64_word : Type := .
Definition elf64_word_default: elf64_word  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition read_elf64_word  (endian : endianness ) (bs0 : byte_sequence )  : error ((elf64_word *byte_sequence ) % type):= 
  match ( endian) with 
    | Little =>
      byte_sequence.read_4_bytes_le bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4),  bs1)) =>
       return0 (elf64_word_of_quad b4 b3 b2 b1, bs1) end)
    | Big    =>
      byte_sequence.read_4_bytes_be bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4),  bs1)) =>
       return0 (elf64_word_of_quad b4 b3 b2 b1, bs1) end)
  end.
(* [?]: removed value specification. *)

(* [?]: removed top-level value definition. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_elf64_word  (endian : endianness ) (w : elf64_word )  : list (elf_types_local.byte ):= 
  match ( endian) with 
    | Little => match ( quad_of_elf64_word w) with (b0,  b1,  b2,  b3) => [b0; b1; b2; b3]
 end
    | Big    => match ( quad_of_elf64_word w) with (b0,  b1,  b2,  b3) => [b3; b2; b1; b0]
 end
  end.

Instance x26_Eq : Eq elf64_word := {
   isEqual  :=  elf64_word_equal;
   isInequal   l  r :=  negb (elf64_word_equal l r)
}.

(* 

Instance x25_Show : Show elf64_word := {
   show  :=  string_of_elf64_word
}.
 *)
(* 

(** ELF signed word type:
  * 4 byte signed type on 32-bit architectures.
  * 4 byte signed type on 64-bit architectures.
  *)

Inductive elf32_sword : Type := .
Definition elf32_sword_default: elf32_sword  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition read_elf32_sword  (endian : endianness ) (bs0 : byte_sequence )  : error ((elf32_sword *byte_sequence ) % type):= 
  match ( endian) with 
    | Little =>
      byte_sequence.read_4_bytes_le bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4),  bs1)) =>
       return0 (elf32_sword_of_quad b4 b3 b2 b1, bs1) end)
    | Big    =>
      byte_sequence.read_4_bytes_be bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4),  bs1)) =>
       return0 (elf32_sword_of_quad b4 b3 b2 b1, bs1) end)
  end.
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_elf32_sword  (endian : endianness ) (w : elf32_sword )  : list (elf_types_local.byte ):= 
  match ( endian) with 
    | Little => match ( quad_of_elf32_sword w) with (b0,  b1,  b2,  b3) => [b0; b1; b2; b3]
 end
    | Big    => match ( quad_of_elf32_sword w) with (b0,  b1,  b2,  b3) => [b3; b2; b1; b0]
 end
  end.
(* 

Instance x24_Show : Show elf32_sword := {
	 show  :=  string_of_elf32_sword
}.
 *)
(* 

(** elf64_sword type and bindings *)

Inductive elf64_sword : Type := .
Definition elf64_sword_default: elf64_sword  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition read_elf64_sword  (endian : endianness ) (bs0 : byte_sequence )  : error ((elf64_sword *byte_sequence ) % type):= 
  match ( endian) with 
    | Little =>
      byte_sequence.read_4_bytes_le bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4),  bs1)) =>
       return0 (elf64_sword_of_quad b4 b3 b2 b1, bs1) end)
    | Big    =>
      byte_sequence.read_4_bytes_be bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4),  bs1)) =>
       return0 (elf64_sword_of_quad b4 b3 b2 b1, bs1) end)
  end.
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_elf64_sword  (endian : endianness ) (w : elf64_sword )  : list (elf_types_local.byte ):= 
  match ( endian) with 
    | Little => match ( quad_of_elf64_sword w) with (b0,  b1,  b2,  b3) => [b0; b1; b2; b3]
 end
    | Big    => match ( quad_of_elf64_sword w) with (b0,  b1,  b2,  b3) => [b3; b2; b1; b0]
 end
  end.
(* 

Instance x23_Show : Show elf64_sword := {
   show  :=  string_of_elf64_sword
}.
 *)
(* 

(** ELF extra wide word type:
  * 8 byte unsigned type on 64-bit architectures.
  *)

Inductive elf64_xword : Type := .
Definition elf64_xword_default: elf64_xword  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition read_elf64_xword  (endian : endianness ) (bs0 : byte_sequence )  : error ((elf64_xword *byte_sequence ) % type):= 
  match ( endian) with 
    | Little =>
      byte_sequence.read_8_bytes_le bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4,  b5,  b6,  b7,  b8),  bs1)) =>
       return0 (elf64_xword_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1) end)
    | Big    =>
      byte_sequence.read_8_bytes_be bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4,  b5,  b6,  b7,  b8),  bs1)) =>
       return0 (elf64_xword_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1) end)
  end.
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed top-level value definition. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_elf64_xword  (endian : endianness ) (x : elf64_xword )  : list (elf_types_local.byte ):= 
  match ( endian) with 
    | Little => match ( oct_of_elf64_xword x) with
     (b0,  b1,  b2,  b3,  b4,  b5,  b6,  b7) =>
   [b0; b1; b2; b3; b4; b5; b6; b7] end
    | Big    => match ( oct_of_elf64_xword x) with
     (b0,  b1,  b2,  b3,  b4,  b5,  b6,  b7) =>
   [b7; b6; b5; b4; b3; b2; b1; b0] end
  end.

Instance x22_Eq : Eq elf64_xword := {
   isEqual  :=  elf64_xword_equal;
   isInequal   l  r :=  negb (elf64_xword_equal l r)
}.

(* 

Instance x21_Show : Show elf64_xword := {
   show  :=  string_of_elf64_xword
}.
 *)
(* 

(** ELF signed extra wide word type:
  * 8 byte signed type on 64-bit architectures.
  *)

Inductive elf64_sxword : Type := .
Definition elf64_sxword_default: elf64_sxword  := DAEMON. *)
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition read_elf64_sxword  (endian : endianness ) (bs0 : byte_sequence )  : error ((elf64_sxword *byte_sequence ) % type):= 
  match ( endian) with 
    | Little =>
      byte_sequence.read_8_bytes_le bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4,  b5,  b6,  b7,  b8),  bs1)) =>
       return0 (elf64_sxword_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1) end)
    | Big    =>
      byte_sequence.read_8_bytes_be bs0 >>= 
  (fun (p : (((elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte *elf_types_local.byte ) % type)*byte_sequence ) % type) =>
     match ( (p) ) with ( ((b1,  b2,  b3,  b4,  b5,  b6,  b7,  b8),  bs1)) =>
       return0 (elf64_sxword_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1) end)
  end.
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition bytes_of_elf64_sxword  (endian : endianness ) (w : elf64_sxword )  : list (elf_types_local.byte ):= 
  match ( endian) with 
    | Little => match (oct_of_elf64_sxword w) with (b0,  b1,  b2,  b3,  b4,  b5,  b6,  b7) =>
   [b0; b1; b2; b3; b4; b5; b6; b7] end
    | Big    => match (oct_of_elf64_sxword w) with (b0,  b1,  b2,  b3,  b4,  b5,  b6,  b7) =>
   [b7; b6; b5; b4; b3; b2; b1; b0] end
  end.
(* 

Instance x20_Show : Show elf64_sxword := {
   show  :=  string_of_elf64_sxword
}.
 *)
(* [?]: removed value specification. *)

(* 
Definition natural_land  (m : nat ) (n : nat )  : nat := 
  (* For Isabelle backend...*)
  nat_of_elf64_xword (elf64_xword_land (elf64_xword_of_nat m) (elf64_xword_of_nat n)). *)
(* [?]: removed value specification. *)

(* 
Definition natural_lor  (m : nat ) (n : nat )  : nat := 
  (* For Isabelle backend...*)
  nat_of_elf64_xword (elf64_xword_lor (elf64_xword_of_nat m) (elf64_xword_of_nat n)). *)
(* [?]: removed value specification. *)

(* 
Definition natural_lxor  (m : nat ) (n : nat )  : nat := 
  (* For Isabelle backend...*)
  nat_of_elf64_xword (elf64_xword_lxor (elf64_xword_of_nat m) (elf64_xword_of_nat n)). *)
