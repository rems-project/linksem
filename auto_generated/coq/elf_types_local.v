Require Import Ascii.
Require Import Coq.Numbers.BinNums.

Local Open Scope Z_scope.

Axiom byte : Type.

Axiom null_byte : byte.
Axiom null_char : ascii.
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

Axiom elf32_addr : Type.

Axiom nat_of_elf32_addr : elf32_addr -> nat.
Axiom elf32_addr_of_nat : nat -> elf32_addr.
Axiom elf32_addr_land : elf32_addr -> elf32_addr -> elf32_addr.
Axiom elf32_addr_lor : elf32_addr -> elf32_addr -> elf32_addr.
Axiom elf32_addr_lshift : nat -> elf32_addr -> elf32_addr.
Axiom elf32_addr_rshift : nat -> elf32_addr -> elf32_addr.
Axiom elf32_addr_plus : elf32_addr -> elf32_addr -> elf32_addr.
Axiom elf32_addr_equal : elf32_addr -> elf32_addr -> bool.
Axiom elf32_addr_of_quad : byte -> byte -> byte -> byte -> elf32_addr.
Axiom quad_of_elf32_addr : elf32_addr -> (byte * byte * byte * byte).

Axiom elf64_addr : Type.

Axiom nat_of_elf64_addr : elf64_addr -> nat.
Axiom elf64_addr_of_nat : nat -> elf64_addr.
Axiom elf64_addr_land : elf64_addr -> elf64_addr -> elf64_addr.
Axiom elf64_addr_lor : elf64_addr -> elf64_addr -> elf64_addr.
Axiom elf64_addr_lshift : nat -> elf64_addr -> elf64_addr.
Axiom elf64_addr_rshift : nat -> elf64_addr -> elf64_addr.
Axiom elf64_addr_plus : elf64_addr -> elf64_addr -> elf64_addr.
Axiom elf64_addr_equal : elf64_addr -> elf64_addr -> bool.
Axiom elf64_addr_of_oct : byte -> byte -> byte -> byte -> byte -> byte -> byte -> byte -> elf64_addr.
Axiom oct_of_elf64_addr : elf64_addr -> (byte * byte * byte * byte * byte * byte * byte * byte).

Axiom elf32_half : Type.

Axiom nat_of_elf32_half : elf32_half -> nat.
Axiom elf32_half_of_nat : nat -> elf32_half.
Axiom elf32_half_land : elf32_half -> elf32_half -> elf32_half.
Axiom elf32_half_lor : elf32_half -> elf32_half -> elf32_half.
Axiom elf32_half_lshift : nat -> elf32_half -> elf32_half.
Axiom elf32_half_rshift : nat -> elf32_half -> elf32_half.
Axiom elf32_half_plus : elf32_half -> elf32_half -> elf32_half.
Axiom elf32_half_equal : elf32_half -> elf32_half -> bool.
Axiom elf32_half_of_dual : byte -> byte -> elf32_half.
Axiom dual_of_elf32_half : elf32_half -> (byte * byte).

Axiom elf64_half : Type.

Axiom nat_of_elf64_half : elf64_half -> nat.
Axiom elf64_half_of_nat : nat -> elf64_half.
Axiom elf64_half_land : elf64_half -> elf64_half -> elf64_half.
Axiom elf64_half_lor : elf64_half -> elf64_half -> elf64_half.
Axiom elf64_half_lshift : nat -> elf64_half -> elf64_half.
Axiom elf64_half_rshift : nat -> elf64_half -> elf64_half.
Axiom elf64_half_plus : elf64_half -> elf64_half -> elf64_half.
Axiom elf64_half_equal : elf64_half -> elf64_half -> bool.
Axiom elf64_half_of_dual : byte -> byte -> elf64_half.
Axiom dual_of_elf64_half : elf64_half -> (byte * byte).

Axiom elf32_off : Type.

Axiom nat_of_elf32_off : elf32_off -> nat.
Axiom elf32_off_of_nat : nat -> elf32_off.
Axiom elf32_off_land : elf32_off -> elf32_off -> elf32_off.
Axiom elf32_off_lor : elf32_off -> elf32_off -> elf32_off.
Axiom elf32_off_lshift : nat -> elf32_off -> elf32_off.
Axiom elf32_off_rshift : nat -> elf32_off -> elf32_off.
Axiom elf32_off_plus : elf32_off -> elf32_off -> elf32_off.
Axiom elf32_off_equal : elf32_off -> elf32_off -> bool.
Axiom elf32_off_of_quad : byte -> byte -> byte -> byte -> elf32_off.
Axiom quad_of_elf32_off : elf32_off -> (byte * byte * byte * byte).

Axiom elf64_off : Type.

Axiom nat_of_elf64_off : elf64_off -> nat.
Axiom elf64_off_of_nat : nat -> elf64_off.
Axiom elf64_off_land : elf64_off -> elf64_off -> elf64_off.
Axiom elf64_off_lor : elf64_off -> elf64_off -> elf64_off.
Axiom elf64_off_lshift : nat -> elf64_off -> elf64_off.
Axiom elf64_off_rshift : nat -> elf64_off -> elf64_off.
Axiom elf64_off_plus : elf64_off -> elf64_off -> elf64_off.
Axiom elf64_off_equal : elf64_off -> elf64_off -> bool.
Axiom elf64_off_of_oct : byte -> byte -> byte -> byte -> byte -> byte -> byte -> byte -> elf64_off.
Axiom oct_of_elf64_off : elf64_off -> (byte * byte * byte * byte * byte * byte * byte * byte).

Axiom elf32_word : Type.

Axiom nat_of_elf32_word : elf32_word -> nat.
Axiom elf32_word_of_nat : nat -> elf32_word.
Axiom elf32_word_land : elf32_word -> elf32_word -> elf32_word.
Axiom elf32_word_lor : elf32_word -> elf32_word -> elf32_word.
Axiom elf32_word_lshift : nat -> elf32_word -> elf32_word.
Axiom elf32_word_rshift : nat -> elf32_word -> elf32_word.
Axiom elf32_word_plus : elf32_word -> elf32_word -> elf32_word.
Axiom elf32_word_equal : elf32_word -> elf32_word -> bool.
Axiom elf32_word_of_quad : byte -> byte -> byte -> byte -> elf32_word.
Axiom quad_of_elf32_word : elf32_word -> (byte * byte * byte * byte).

Axiom elf64_word : Type.

Axiom nat_of_elf64_word : elf64_word -> nat.
Axiom elf64_word_of_nat : nat -> elf64_word.
Axiom elf64_word_land : elf64_word -> elf64_word -> elf64_word.
Axiom elf64_word_lor : elf64_word -> elf64_word -> elf64_word.
Axiom elf64_word_lshift : nat -> elf64_word -> elf64_word.
Axiom elf64_word_rshift : nat -> elf64_word -> elf64_word.
Axiom elf64_word_plus : elf64_word -> elf64_word -> elf64_word.
Axiom elf64_word_equal : elf64_word -> elf64_word -> bool.
Axiom elf64_word_of_quad : byte -> byte -> byte -> byte -> elf64_word.
Axiom quad_of_elf64_word : elf64_word -> (byte * byte * byte * byte).

Axiom elf32_sword : Type.

Axiom int_of_elf32_sword : elf32_sword -> Z.
Axiom elf32_sword_of_int : Z -> elf32_sword.
Axiom elf32_sword_land : elf32_sword -> elf32_sword -> elf32_sword.
Axiom elf32_sword_lor : elf32_sword -> elf32_sword -> elf32_sword.
Axiom elf32_sword_lshift : nat -> elf32_sword -> elf32_sword.
Axiom elf32_sword_rshift : nat -> elf32_sword -> elf32_sword.
Axiom elf32_sword_plus : elf32_sword -> elf32_sword -> elf32_sword.
Axiom elf32_sword_equal : elf32_sword -> elf32_sword -> bool.
Axiom elf32_sword_of_quad : byte -> byte -> byte -> byte -> elf32_sword.
Axiom quad_of_elf32_sword : elf32_sword -> (byte * byte * byte * byte).

Axiom elf64_sword : Type.

Axiom int_of_elf64_sword : elf64_sword -> Z.
Axiom elf64_sword_of_int : Z -> elf64_sword.
Axiom elf64_sword_land : elf64_sword -> elf64_sword -> elf64_sword.
Axiom elf64_sword_lor : elf64_sword -> elf64_sword -> elf64_sword.
Axiom elf64_sword_lshift : nat -> elf64_sword -> elf64_sword.
Axiom elf64_sword_rshift : nat -> elf64_sword -> elf64_sword.
Axiom elf64_sword_plus : elf64_sword -> elf64_sword -> elf64_sword.
Axiom elf64_sword_equal : elf64_sword -> elf64_sword -> bool.
Axiom elf64_sword_of_quad : byte -> byte -> byte -> byte -> elf64_sword.
Axiom quad_of_elf64_sword : elf64_sword -> (byte * byte * byte * byte).

Axiom elf64_xword : Type.

Axiom nat_of_elf64_xword : elf64_xword -> nat.
Axiom elf64_xword_of_nat : nat -> elf64_xword.
Axiom elf64_xword_land : elf64_xword -> elf64_xword -> elf64_xword.
Axiom elf64_xword_lor : elf64_xword -> elf64_xword -> elf64_xword.
Axiom elf64_xword_lshift : nat -> elf64_xword -> elf64_xword.
Axiom elf64_xword_rshift : nat -> elf64_xword -> elf64_xword.
Axiom elf64_xword_plus : elf64_xword -> elf64_xword -> elf64_xword.
Axiom elf64_xword_equal : elf64_xword -> elf64_xword -> bool.
Axiom elf64_xword_of_oct : byte -> byte -> byte -> byte -> byte -> byte -> byte -> byte -> elf64_xword.
Axiom oct_of_elf64_xword : elf64_xword -> (byte * byte * byte * byte * byte * byte * byte * byte).

Axiom elf64_sxword : Type.

Axiom int_of_elf64_sxword : elf64_sxword -> Z.
Axiom elf64_sxword_of_int : Z -> elf64_sxword.
Axiom elf64_sxword_land : elf64_sxword -> elf64_sxword -> elf64_sxword.
Axiom elf64_sxword_lor : elf64_sxword -> elf64_sxword -> elf64_sxword.
Axiom elf64_sxword_lshift : nat -> elf64_sxword -> elf64_sxword.
Axiom elf64_sxword_rshift : nat -> elf64_sxword -> elf64_sxword.
Axiom elf64_sxword_plus : elf64_sxword -> elf64_sxword -> elf64_sxword.
Axiom elf64_sxword_equal : elf64_sxword -> elf64_sxword -> bool.
Axiom elf64_sxword_of_oct : byte -> byte -> byte -> byte -> byte -> byte -> byte -> byte -> elf64_sxword.
Axiom oct_of_elf64_sxword : elf64_sxword -> (byte * byte * byte * byte * byte * byte * byte * byte).