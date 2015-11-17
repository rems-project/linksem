Require Import Ascii.

Axiom byte : Type.

Axiom null_byte : byte.
Axiom nat_of_byte : byte -> nat.
Axiom byte_of_nat : nat -> byte.
Axiom char_list_of_byte_list : list byte -> list ascii.

Axiom unsigned_char : Type.

Axiom nat_of_unsigned_char : unsigned_char -> nat.
Axiom unsigned_char_of_nat : nat -> unsigned_char.
Axiom unsigned_char_land : unsigned_char -> unsigned_char -> unsigned_char.
Axiom unsigned_char_lor : unsigned_char -> unsigned_char -> unsigned_char.
Axiom unsigned_char_lshift : nat -> unsigned_char -> unsigned_char.
Axiom unsigned_char_rshift : nat -> unsigned_char -> unsigned_char.
Axiom unsigned_char_plus : unsigned_char -> unsigned_char -> unsigned_char.
Axiom unsigned_char_of_byte : byte -> unsigned_char.
Axiom byte_of_unsigned_char : unsigned_char -> byte.
Axiom unsigned_char_equal : unsigned_char -> unsigned_char -> bool.