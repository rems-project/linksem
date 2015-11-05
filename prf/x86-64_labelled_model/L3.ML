(*  Title: L3.thy
    Author: Anthony Fox, University of Cambridge

Importer for L3 instruction set specification language.
*)

signature L3 =
sig
  datatype monop =
      Abs
    | BNot
    | Bin
    | Cardinality
    | Cast of Term.typ
    | Dec
    | Difference
    | Drop
    | Element
    | Flat
    | FPAbs of bool
    | FPAdd of bool
    | FPEqual of bool
    | FPIsNaN of bool
    | FPLess of bool
    | FPMul of bool
    | FPNeg of bool
    | FPSub of bool
    | Fst
    | Head
    | Hex
    | IndexOf
    | Intersect
    | IsAlpha
    | IsAlphaNum
    | IsDigit
    | IsHexDigit
    | IsLower
    | IsMember
    | IsSome
    | IsSpace
    | IsSubset
    | IsUpper
    | K1 of Term.typ
    | Length
    | Log
    | Max
    | Min
    | Msb
    | Neg
    | Not
    | PadLeft
    | PadRight
    | QuotRem
    | Remove
    | RemoveExcept
    | RemoveDuplicates
    | Rev
    | SE of Term.typ
    | Size
    | Smax
    | Smin
    | Snd
    | SofL
    | Some
    | Tail
    | Take
    | ToLower
    | ToUpper
    | Union
    | Update
    | ValOf

  datatype binop =
      Add
    | And
    | Asr
    | BAnd
    | BOr
    | BXor
    | Bit
    | Div
    | Exp
    | Fld
    | Ge
    | Gt
    | In
    | Insert
    | Le
    | Lsl
    | Lsr
    | Lt
    | Mdfy
    | Mod
    | Mul
    | Or
    | Quot
    | Rem
    | Rep
    | Rol
    | Ror
    | Splitl
    | Splitr
    | Sub
    | Tok
    | Uge
    | Ugt
    | Ule
    | Ult

  val w1 : Term.typ
  val w4 : Term.typ
  val w8 : Term.typ
  val w16 : Term.typ
  val w32 : Term.typ
  val w64 : Term.typ

  val lc : string * string * Context.theory -> Term.term
  val li : int -> Term.term
  val le : Term.typ -> Term.term
  val lf : Term.term
  val ln : int -> Term.term
  val lnl : Term.typ -> Term.term
  val lo : Term.typ -> Term.term
  val ls : string -> Term.term
  val lsc : char -> Term.term
  val lt : Term.term
  val lu : Term.term
  val lv : string -> Term.term
  val lw : int * int -> Term.term
  val lx : Term.typ -> Term.term
  val ly : int * string -> Term.term

  val var : string * Term.typ -> Term.term
  val var_a : Term.typ -> Term.term
  val var_b : string -> Term.term
  val var_i : string -> Term.term
  val var_n : string -> Term.term
  val var_s : string -> Term.term
  val var_u : string -> Term.term
  val var_v : string -> Term.term
  val var_w : string * int -> Term.term

  val mb : Term.term * Term.term -> Term.term
  val md : Term.term * Term.typ -> Term.term
  val mn : Term.term * Term.term -> Term.term
  val mr : Term.term -> Term.term
  val mu : Term.term * Term.typ -> Term.term
  val mw : Term.term -> Term.term

  val apply : Term.term * Term.term -> Term.term
  val bfi : Term.term * Term.term * Term.term * Term.term -> Term.term
  val bop : binop * Term.term * Term.term -> Term.term
  val call : string * Term.typ * Term.term * Context.theory -> Term.term
  val cc : Term.term list -> Term.term
  val close : Term.term * Term.term -> Term.term
  val const : string * Term.typ * Context.theory -> Term.term
  val cs : Term.term * (Term.term * Term.term) list * Proof.context -> Term.term
  val foreach : Term.term -> Term.term
  val forloop : Term.term -> Term.term
  val fupd : Term.term * Term.term * Term.term -> Term.term
  val eq : Term.term * Term.term -> Term.term
  val ex : Term.term * Term.term * Term.term * Term.typ -> Term.term
  val itb : (Term.term * Term.term) list * Term.term -> Term.term
  val ite : Term.term * Term.term * Term.term -> Term.term
  val let' : Term.term * Term.term * Term.term -> Term.term
  val ll : Term.term list -> Term.term
  val llc : Term.term list * Term.term -> Term.term
  val mop : monop * Term.term -> Term.term
  val record : string * Term.term list * Context.theory -> Term.term
  val rep : Term.term * Term.term * Term.typ -> Term.term
  val rupd : string * Term.term * Context.theory -> Term.term
  val sl : Term.term list -> Term.term
  val tp : Term.term list -> Term.term

  val def : string * Term.term -> unit
  val function : string * Term.term * Term.term -> unit
end

structure L3 : L3 =
struct
datatype monop =
    Abs
  | BNot
  | Bin
  | Cardinality
  | Cast of Term.typ
  | Dec
  | Difference
  | Drop
  | Element
  | Flat
  | FPAbs of bool
  | FPAdd of bool
  | FPEqual of bool
  | FPIsNaN of bool
  | FPLess of bool
  | FPMul of bool
  | FPNeg of bool
  | FPSub of bool
  | Fst
  | Head
  | Hex
  | IndexOf
  | Intersect
  | IsAlpha
  | IsAlphaNum
  | IsDigit
  | IsHexDigit
  | IsLower
  | IsMember
  | IsSome
  | IsSpace
  | IsSubset
  | IsUpper
  | K1 of Term.typ
  | Length
  | Log
  | Max
  | Min
  | Msb
  | Neg
  | Not
  | PadLeft
  | PadRight
  | QuotRem
  | Remove
  | RemoveExcept
  | RemoveDuplicates
  | Rev
  | SE of Term.typ
  | Size
  | Smax
  | Smin
  | Snd
  | SofL
  | Some
  | Tail
  | Take
  | ToLower
  | ToUpper
  | Union
  | Update
  | ValOf

datatype binop =
    Add
  | And
  | Asr
  | BAnd
  | BOr
  | BXor
  | Bit
  | Div
  | Exp
  | Fld
  | Ge
  | Gt
  | In
  | Insert
  | Le
  | Lsl
  | Lsr
  | Lt
  | Mdfy
  | Mod
  | Mul
  | Or
  | Quot
  | Rem
  | Rep
  | Rol
  | Ror
  | Splitl
  | Splitr
  | Sub
  | Tok
  | Uge
  | Ugt
  | Ule
  | Ult

val bitstringT = @{typ "bool list"}
fun optionT ty = Term.Type (@{type_name option}, [ty])
fun setT ty = Term.Type (@{type_name set}, [ty])
fun wordT a = Term.Type (@{type_name word}, [Term.TFree ("'" ^ a, ["Type_Length.len"])])
fun is_wordT (Term.Type (@{type_name word}, [_])) = true
  | is_wordT _ = false
fun dest_listT (Term.Type (@{type_name list}, [ty])) = ty
  | dest_listT ty = raise TYPE ("dest_listT: list type expected", [ty], [])
fun dest_optionT (Term.Type (@{type_name option}, [ty])) = ty
  | dest_optionT ty = raise TYPE ("dest_optionT: list type expected", [ty], [])

fun gen_dest_prod tm =
  HOLogic.dest_prod tm handle TERM ("dest_prod", [_]) => (HOLogic.mk_fst tm, HOLogic.mk_snd tm)

val w1  = Word_Lib.mk_wordT 1
val w4  = Word_Lib.mk_wordT 4
val w8  = Word_Lib.mk_wordT 8
val w16 = Word_Lib.mk_wordT 16
val w32 = Word_Lib.mk_wordT 32
val w64 = Word_Lib.mk_wordT 64

(* Boolean literals *)
val lt = @{term True}
val lf = @{term False}

(* bit-string literal *)
local
  val bool_of_bit = fn #"1" => lt | #"0" => lf | _ => raise Fail "bool_of_bit"
in
  fun lv s = HOLogic.mk_list HOLogic.boolT (List.map bool_of_bit (String.explode s))
end

(* integer literal *)
fun li i =  HOLogic.mk_number HOLogic.intT i

(* natural literal *)
fun ln i =  HOLogic.mk_number HOLogic.natT i

(* bit-vector literal *)
fun lw (i, n) = HOLogic.mk_number (Word_Lib.mk_wordT n) i
fun ly (i, n) = HOLogic.mk_number (wordT n) i

(* character and string literals *)
local
  fun mk_nib i = Term.Const ("String.nibble.Nibble" ^ Int.fmt StringCvt.HEX i, HOLogic.nibbleT)
in
  fun lsc c =
    let
      val (hi, lo) = IntInf.divMod (Char.ord c, 16)
    in
      Const(@{const_name String.Char}, HOLogic.nibbleT --> (HOLogic.nibbleT --> HOLogic.charT)) $
            mk_nib hi $ mk_nib lo
    end
  fun ls s = HOLogic.mk_list HOLogic.charT (map lsc (String.explode s))
end

(* enumerated type constant *)
fun lc (name, ty, thy) =
   let
     val full = Sign.full_name thy
     val bind_name = Binding.qualify false ty (Binding.make (name, Position.none))
     val bind_ty = Binding.make (ty, Position.none)
   in
     Term.Const (full bind_name, Term.Type (full bind_ty, []))
   end

(* undefined value *)
fun lx ty = Term.Const (@{const_name undefined}, ty)

(* unit value *)
val lu = @{term Product_Type.Unity}

(* empty set *)
fun le ty = Term.Const(@{const_name bot}, setT ty)

(* nil list *)
fun lnl ty = Term.Const (@{const_name List.list.Nil}, HOLogic.listT ty)

(* none option *)
fun lo ty = Term.Const (@{const_name None}, optionT ty)

(* local constant *)
fun const (f, ty, thy) =
  let
    val binding =
      case String.fields (fn c => c = #".") f of
         [_] => Binding.make (f, Position.none)
       | [t, n] => Binding.qualify false t (Binding.make (n, Position.none))
       | _ => raise Fail "const: too many qualifiers"
  in
    Term.Const (Sign.full_name thy binding, ty)
  end

(* function application *)
fun call (f, ty, tm, thy) = const (f, Term.type_of tm --> ty, thy) $ tm

(* variables *)
val var = Term.Free

local
  val anon = Unsynchronized.ref 0
  fun anon_suffix () = (if !anon = 0 then "" else Int.toString (!anon)) before anon := !anon + 1
in
  fun reset_anon () = anon := 0
  fun var_a ty = var ("_" ^ anon_suffix (), ty)
end

fun var_u v = var (v, HOLogic.unitT)
fun var_b v = var (v, HOLogic.boolT)
fun var_n v = var (v, HOLogic.natT)
fun var_i v = var (v, HOLogic.intT)
fun var_s v = var (v, HOLogic.stringT)
fun var_v v = var (v, bitstringT)
fun var_w (v, i) = var (v, Word_Lib.mk_wordT i)

(* closure *)
fun close (tm1, tm2) = HOLogic.tupled_lambda tm1 tm2

(* application *)
fun apply (f, x) = f $ x

(* tuples *)
fun tp l =
  let
    val (f, lst) = Library.split_last l
  in
    List.foldr HOLogic.mk_prod lst f
  end

(* function update *)
fun fupd (m, i, e) =
  let
    val ty1 = Term.type_of i
    val ty2 = Term.type_of e
    val ty3 = ty1 --> ty2
  in
    (Term.Const (@{const_name fun_upd}, ty3 --> ty1 --> ty2 --> ty3) $ m $ i) $ e
  end

(* pattern matching *)
fun cs (m, l, ctxt) = Case_Translation.make_case ctxt Case_Translation.Quiet Name.context m l

(* let-expression *)
fun let' (v, e, b) =
  let
    val ty1 = Term.type_of v
    val ty2 = Term.type_of b
  in
    Term.Const (@{const_name Let}, ty1 --> (ty1 --> ty2) --> ty2) $ e $ close (v, b)
  end

(* set of list *)
val sl = fn [] => raise Fail "sl: empty"
          | l as (h::_) =>
              let
                val ty = Term.type_of h
              in
                Term.Const (@{const_name set}, HOLogic.listT ty --> setT ty) $ HOLogic.mk_list ty l
              end

(* lists *)
val ll = fn [] => raise Fail "ll: empty"
          | l as (h::_) => HOLogic.mk_list (Term.type_of h) l

local
  fun mk_cons (h, t) = HOLogic.cons_const (Term.type_of h) $ h $ t
in
  val llc =
    fn ([], tm) =>
         HOLogic.mk_split (HOLogic.cons_const (fst (HOLogic.dest_prodT (Term.type_of tm)))) $ tm
     | (l, tm) =>  List.foldr mk_cons tm l
end

(* concatenation *)
local
  fun is_listT (Term.Type ("List.list", [_])) = true
    | is_listT _ = false
  fun mk_word_concat (w1, w2) =
    let
      val ty1 = Term.type_of w1
      val i1 = Word_Lib.dest_wordT ty1
      val ty2 = Term.type_of w2
      val i2 = Word_Lib.dest_wordT ty2
      val ty3 = Word_Lib.mk_wordT (i1 + i2)
    in
      Term.Const (@{const_name word_cat}, ty1 --> ty2 --> ty3) $ w1 $ w2
    end
    handle TYPE ("dest_wordT", _, _) => raise Fail "cc: word concat of unknown size"
in
  fun cc [] = raise Fail "cc: empty"
    | cc [_] = raise Fail "cc: one element"
    | cc l =
        let
          val (fnt, lst) = Library.split_last l
          val ty = Term.type_of lst
        in
          if is_listT ty then
            if List.length l = 2 then
              Term.Const (@{const_name append}, ty --> ty --> ty) $ hd l $ lst
            else
              Term.Const (@{const_name concat}, HOLogic.listT ty --> ty) $ HOLogic.mk_list ty l
          else
             List.foldr mk_word_concat lst fnt
        end
end

(* word replicate *)
fun rep (w, n, ty) =
  Term.Const ("L3_Lib.word_replicate", HOLogic.natT --> Term.type_of w --> ty) $ n $ w

(* records *)
fun mk_K_1 (tm, ty) = Term.absfree ("_", ty) tm

fun record (_, [], _) = raise Fail "rec: empty"
  | record (name, l, thy) =
    let
      fun mk n = Sign.full_name thy (Binding.qualify false name (Binding.make (n, Position.none)))
      val rty = Term.Type (mk (name ^ "_ext"), [HOLogic.unitT])
      val ty = List.foldr (op -->) rty (List.map Term.type_of l)
    in
      List.foldl (fn (a, b) => b $ a) (Term.Const (mk "make", ty)) l
    end

fun rupd (f, tm, thy) =
  let
    val (tm1, tm2) = gen_dest_prod tm
    val (rty, fty) = HOLogic.dest_prodT (Term.type_of tm)
  in
    call (f ^ "_update", rty --> rty, mk_K_1 (tm2, fty), thy) $ tm1
  end

(* if-then-else *)
fun ite (i, t, e) =
  if i = lt
     then t
  else if i = lf
     then e
  else let
         val ty = Term.type_of t
       in
         Term.Const (@{const_name If}, HOLogic.boolT --> ty --> ty --> ty) $ i $ t $ e
       end

fun itb (l, e) = List.foldr (fn ((i, t), e) => ite (i, t, e)) e l

(* extract *)
fun ex (x, h, l, ty) =
  (if ty = bitstringT then
     Term.Const ("L3_Lib.bitstring_field",
                 HOLogic.natT --> HOLogic.natT --> bitstringT --> bitstringT)
   else
     Term.Const ("L3_Lib.word_extract",
                 HOLogic.natT --> HOLogic.natT --> Term.type_of x --> ty)) $ h $ l $ x

(* bit-field insert *)
fun bfi (h, l, x1, x2) =
  let
    val ty1 = Term.type_of x1
    val ty2 = Term.type_of x2
    val name = if ty1 = bitstringT then "bitstring_field_insert" else "word_bit_field_insert"
  in
    Term.Const
      ("L3_Lib." ^ name, HOLogic.natT --> HOLogic.natT --> ty1 --> ty2 --> ty2) $ h $ l $ x1 $ x2
  end

(* equality *)
val eq = HOLogic.mk_eq

(* Monad operations *)
fun monadT (a_ty, s_ty) = s_ty --> HOLogic.mk_prodT (a_ty, s_ty)

fun mu (tm, ty) =
  let
    val t_ty = Term.type_of tm
  in
    Term.Const ("L3_Lib.return", t_ty --> monadT (t_ty, ty)) $ tm
  end

fun mb (f_tm, g_tm) =
  let
    val g_ty = Term.type_of g_tm
  in
    Term.Const ("L3_Lib.bind", Term.type_of f_tm --> g_ty --> Term.range_type g_ty) $ f_tm $ g_tm
  end

fun mr tm =
  let
    val ty = Term.type_of tm
    val (s_ty, a_ty) = Term.dest_funT ty
  in
    Term.Const ("L3_Lib.read_state", ty --> monadT (a_ty, s_ty)) $ tm
  end

fun mw tm =
  let
    val ty = Term.type_of tm
    val s_ty = Term.range_type ty
  in
    Term.Const
      ("L3_Lib.update_state", ty --> monadT (HOLogic.unitT, s_ty)) $ tm
  end

fun mn (v, tm) =
  let
    val b_ty = Term.type_of v
    val ty = Term.type_of tm
    val p_ty = Term.range_type ty
    val (a_ty, p_ty) = HOLogic.dest_prodT p_ty
    val s_ty = snd (HOLogic.dest_prodT p_ty)
  in
    Term.Const ("L3_Lib.extend_state", b_ty --> ty --> monadT (a_ty, s_ty)) $ v $ tm
  end

fun md (tm, ty) =
  let
    val t_ty = Term.type_of tm
    val (a_ty, s_ty) = HOLogic.dest_prodT (Term.range_type t_ty)
  in
    Term.Const ("L3_Lib.trim_state", t_ty --> monadT (a_ty, HOLogic.mk_prodT (ty, s_ty))) $ tm
  end

fun forloop tm =
  let
    val ty = Term.type_of tm
    val sty = ty |> HOLogic.dest_prodT |> snd
                 |> HOLogic.dest_prodT |> snd
                 |> Term.range_type
                 |> Term.domain_type
  in
    Term.Const ("L3_Lib.for_loop", ty --> sty --> HOLogic.mk_prodT (HOLogic.unitT, sty)) $ tm
  end

fun foreach tm =
  let
    val ty = Term.type_of tm
    val sty = ty |> HOLogic.dest_prodT |> snd
                 |> Term.range_type
                 |> Term.domain_type
  in
    Term.Const ("L3_Lib.foreach_loop", ty --> sty --> HOLogic.mk_prodT (HOLogic.unitT, sty)) $ tm
  end

(* primitive unary operations *)

local
  val inst = Term.map_types o Term.typ_subst_atomic
  fun pick (a, b) tm = (if is_wordT (Term.type_of tm) then a else b) tm
  datatype l3_prim_type = Bool | Char | Word | Nat | Int | Bitstring | String | Other of string * string
  fun l3_prim_type ty =
    if ty = HOLogic.boolT then Bool
    else if ty = HOLogic.charT then Char
    else if ty = HOLogic.natT then Nat
    else if ty = HOLogic.intT then Int
    else if ty = HOLogic.stringT then String
    else if ty = bitstringT then Bitstring
    else if is_wordT ty then Word
    else case ty of
            Term.Type (s, []) =>
               (case String.fields (fn c => c = #".") s of
                   [thy, name] => Other (thy, name)
                 | _ => raise Fail ("l3_prim_type: " ^ s))
          | _ => raise Fail "l3_prim_type: not cast type"
  fun mk_comb s f tm = Term.Const (s, let val ty = Term.type_of tm in ty --> f ty end) $ tm
  fun mk_split2 s f tm =
    let
      val (tm1, tm2) = HOLogic.dest_prod tm
      val ty1 = Term.type_of tm1
      val ty2 =  Term.type_of tm2
    in
      Term.Const (s, ty1 --> ty2 --> f (ty1, ty2)) $ tm1 $ tm2
    end
    handle TERM ("dest_prod", [_]) =>
      let
        val (ty1, ty2) = HOLogic.dest_prodT (Term.type_of tm)
      in
        HOLogic.mk_split (Term.Const (s, ty1 --> ty2 --> f (ty1, ty2))) $ tm
      end
  fun mk_split3 s f tm =
    let
      val (tm1, tm2) = gen_dest_prod tm
      val (tm2, tm3) = gen_dest_prod tm2
      val ty1 = Term.type_of tm1
      val ty2 =  Term.type_of tm2
      val ty3 =  Term.type_of tm3
    in
      Term.Const (s, ty1 --> ty2 --> ty3 --> f (ty1, ty2, ty3)) $ tm1 $ tm2 $ tm3
    end
  fun mk_min tm =
    let
      val ty = Term.type_of tm
      val ty1 = fst (HOLogic.dest_prodT ty)
    in
      if is_wordT ty1 then
        Term.Const ("L3_Lib.unsigned_min", ty --> ty1) $ tm
      else
        mk_split2 @{const_name min} fst tm
    end
  fun mk_max tm =
    let
      val ty = Term.type_of tm
      val ty1 = fst (HOLogic.dest_prodT ty)
    in
      if is_wordT ty1 then
        Term.Const ("L3_Lib.unsigned_max", ty --> ty1) $ tm
      else
        mk_split2 @{const_name max} fst tm
    end
  val el_tm = @{term "\<lambda>(e, l). nth l e"}
  fun mk_element tm =
    let
      val (tm1, tm2) = HOLogic.dest_prod tm
      val ty = Term.type_of tm2
    in
      Term.Const (@{const_name nth}, ty --> HOLogic.natT --> dest_listT ty) $ tm2 $ tm1
    end
    handle TERM ("dest_prod", [_]) =>
      let
        val ty = dest_listT (snd (HOLogic.dest_prodT (Term.type_of tm)))
      in
        inst [(@{typ 'a}, ty)] el_tm $ tm
      end
  val update_tm = @{term "\<lambda>(e, v, l). list_update l e v"}
  fun mk_update tm =
    let
      val (tm1, tm2) = HOLogic.dest_prod tm
      val (tm2, tm3) = HOLogic.dest_prod tm2
      val lty = Term.type_of tm3
      val vty = dest_listT lty
    in
      Term.Const (@{const_name list_update}, lty --> HOLogic.natT --> vty --> lty) $
      tm3 $ tm1 $ tm2
    end
    handle TERM ("dest_prod", [_]) =>
      let
        val ty = tm |> Term.type_of
                    |> HOLogic.dest_prodT |> snd
                    |> HOLogic.dest_prodT |> fst
      in
        inst [(@{typ 'a}, ty)] update_tm $ tm
      end
  fun mk_int_abs tm = @{term "abs::int => int"} $ tm
  val mk_word_abs = mk_comb "L3_Lib.word_abs" Library.I
  val mk_word_1comp = mk_comb @{const_name uminus} Library.I
  val mk_some = mk_comb @{const_name Some} (fn ty => optionT ty)
  val mk_the = mk_comb @{const_name the} (fn ty => dest_optionT ty)
  val mk_is_some = mk_comb "L3_Lib.is_some" (fn _ => HOLogic.boolT)
  fun mk_nat_from_string s tm =
    Term.Const ("L3_Lib.nat_from_" ^ s ^ "_string", @{typ "string => nat option"}) $ tm
  fun mk_is_char s tm = Term.Const ("L3_Lib.is_" ^ s, @{typ "char \<Rightarrow> bool"}) $ tm
  fun mk_to s tm =
    @{term "map::(char \<Rightarrow> char) \<Rightarrow> string => string"} $
    Term.Const ("L3_Lib.to_" ^ s, @{typ "char \<Rightarrow> char"}) $ tm
  val mk_card = mk_comb @{const_name card} (fn _ => HOLogic.natT)
  fun mk_sign_extend ty = mk_comb @{const_name scast} (fn _ => ty)
  val mk_size = mk_comb @{const_name size} (fn _ => HOLogic.natT)
  val mk_word_msb = mk_comb @{const_name msb} (fn _ => HOLogic.boolT)
  val mk_word_rev = mk_comb @{const_name word_reverse} Library.I
  val mk_rev = mk_comb @{const_name rev} Library.I
  val mk_uminus = mk_comb @{const_name uminus} Library.I
  val mk_quot_rem = mk_comb "L3_Lib.quot_rem" Library.I
  val mk_log2 = mk_comb "L3_Lib.log2" Library.I
  val mk_word_log2 = mk_comb "L3_Lib.word_log2" Library.I
  val mk_set = mk_comb @{const_name set} (HOLogic.mk_setT o dest_listT)
  val mk_flat = mk_comb @{const_name concat} dest_listT
  val mk_hd = mk_comb @{const_name hd} dest_listT
  val mk_tl = mk_comb @{const_name tl} Library.I
  val mk_index_of = mk_comb "L3_Lib.index_of" (fn _ => optionT HOLogic.natT)
  fun mk_remove e =
    mk_comb ("L3_Lib.remove" ^ (if e then "_except" else "")) (snd o HOLogic.dest_prodT)
  val mk_remove_duplicates = mk_comb "L3_Lib.remove_duplicates" Library.I
  val mk_ord = mk_comb "L3_Lib.Ord" (fn _ => HOLogic.natT)
  val mk_chr = mk_comb "L3_Lib.Chr" (fn _ => HOLogic.charT)
  val mk_nat_to_bitstring = mk_comb "L3_Lib.nat_to_bitstring" (fn _ => bitstringT)
  val mk_bitstring_to_nat = mk_comb "L3_Lib.bitstring_to_nat" (fn _ => HOLogic.natT)
  fun mk_bitstring_to_word ty tm = Term.Const (@{const_name of_bl}, bitstringT --> ty) $ tm
  fun mk_word_of_int ty tm =
    Term.Const (@{const_name word_of_int}, HOLogic.intT --> ty) $ tm
  val mk_uint = mk_comb @{const_name uint} (fn _ => HOLogic.intT)
  val mk_sint = mk_comb @{const_name sint} (fn _ => HOLogic.intT)
  fun mk_word_to_nat tm = @{term "nat::int \<Rightarrow> nat"} $ mk_uint tm
  val mk_nat_to_dec_string = mk_comb "L3_Lib.nat_to_dec_string" (fn _ => HOLogic.stringT)
  val mk_nat_to_hex_string = mk_comb "L3_Lib.nat_to_hex_string" (fn _ => HOLogic.stringT)
  val mk_int_to_dec_string = mk_comb "L3_Lib.int_to_dec_string" (fn _ => HOLogic.stringT)
  fun mk_enum_to_nat (p, s) = mk_comb (p ^ "." ^ s ^ "_to_nat") (fn _ => HOLogic.natT)
  fun mk_enum_to_string (p, s) = mk_comb (p ^ "." ^ s ^ "_to_string") (fn _ => HOLogic.stringT)
  fun mk_nat_to_enum (p, s) =
    mk_comb (p ^ "." ^ "nat_to_" ^ s) (fn _ => Term.Type (p ^ "." ^ s, []))
  fun mk_string_to_enum (p, s) =
    mk_comb (p ^ "." ^ "string_to_" ^ s) (fn _ => Term.Type (p ^ "." ^ s, []))
  fun fp_prefix b s = "L3_Lib.fp" ^ (if b then "64_" else "32_") ^ s
  fun mk_fp_abs b = mk_comb (fp_prefix b "abs") Library.I
  fun mk_fp_negate b = mk_comb (fp_prefix b "negate") Library.I
  fun mk_fp_is_nan b = mk_comb (fp_prefix b "is_nan") (fn _ => HOLogic.boolT)
  fun mk_fp_equal b = mk_split2 (fp_prefix b "equal") (Library.K HOLogic.boolT)
  fun mk_fp_less b = mk_split2 (fp_prefix b "less") (Library.K HOLogic.boolT)
  fun mk_fp_add b = mk_split3 (fp_prefix b "add") (fn (_, ty, _) => ty)
  fun mk_fp_sub b = mk_split3 (fp_prefix b "sub") (fn (_, ty, _) => ty)
  fun mk_fp_mul b = mk_split3 (fp_prefix b "mul") (fn (_, ty, _) => ty)
  fun pick_cast ty tm =
    let
      val ty1 = Term.type_of tm
    in
      case l3_prim_type ty1 of
         Bool =>
           (case l3_prim_type ty of
               Bool => tm
             | Char => ite (tm, @{term "CHR ''t''"}, @{term "CHR ''f''"})
             | Word => ite (tm, HOLogic.mk_number ty 1, HOLogic.mk_number ty 0)
             | Nat => ite (tm, @{term "1::nat"}, @{term "0::nat"})
             | Int => ite (tm, @{term "1::int"}, @{term "0::int"})
             | Bitstring => ite (tm, @{term "[True]"}, @{term "[False]"})
             | String =>  ite (tm, @{term "''true''"}, @{term "''false''"})
             | Other _ => raise Fail "pick_cast: bool \<rightarrow> enum not supported")
       | Char =>
           (case l3_prim_type ty of
               Bool => HOLogic.mk_eq (tm, @{term "CHR ''t''"})
             | Char => tm
             | Word => mk_word_of_int ty (@{term "int::nat \<Rightarrow> int"} $ mk_ord tm)
             | Nat => mk_ord tm
             | Int => @{term "int::nat => int"} $ mk_ord tm
             | Bitstring => mk_nat_to_bitstring (mk_ord tm)
             | String => @{term "Cons::char => string => string"} $ tm $ @{term "''''"}
             | Other s => mk_nat_to_enum s (mk_ord tm))
       | Word =>
           (case l3_prim_type ty of
               Bool => HOLogic.mk_not (HOLogic.mk_eq (tm, HOLogic.mk_number ty1 0))
             | Char => mk_chr (mk_word_to_nat tm)
             | Word => mk_word_of_int ty (mk_uint tm)
             | Nat => mk_word_to_nat tm
             | Int => mk_sint tm
             | Bitstring => mk_nat_to_bitstring (mk_word_to_nat tm)
             | String => mk_nat_to_hex_string (mk_word_to_nat tm)
             | Other s => mk_nat_to_enum s (mk_word_to_nat tm))
       | Nat =>
           (case l3_prim_type ty of
               Bool => HOLogic.mk_not (HOLogic.mk_eq (tm, @{term "0::nat"}))
             | Char => mk_chr tm
             | Word => mk_word_of_int ty (@{term "int::nat \<Rightarrow> int"} $ tm)
             | Nat => tm
             | Int => @{term "int::nat \<Rightarrow> int"} $ tm
             | Bitstring => mk_nat_to_bitstring tm
             | String => mk_nat_to_dec_string tm
             | Other s => mk_nat_to_enum s tm)
       | Int =>
           (case l3_prim_type ty of
               Bool => HOLogic.mk_not (HOLogic.mk_eq (tm, @{term "0::int"}))
             | Char => mk_chr (@{term "nat::int \<Rightarrow> nat"} $ tm)
             | Word => mk_word_of_int ty tm
             | Nat => @{term "nat::int \<Rightarrow> nat"} $ tm
             | Int => tm
             | Bitstring => mk_nat_to_bitstring (@{term "nat::int \<Rightarrow> nat"} $ tm)
             | String => mk_int_to_dec_string tm
             | Other s => mk_nat_to_enum s (@{term "nat::int \<Rightarrow> nat"} $ tm))
       | Bitstring =>
           (case l3_prim_type ty of
               Bool => HOLogic.mk_not (HOLogic.mk_eq (mk_bitstring_to_nat tm, @{term "0::nat"}))
             | Char => mk_chr (mk_bitstring_to_nat tm)
             | Word => mk_bitstring_to_word ty tm
             | Nat => mk_bitstring_to_nat tm
             | Int => @{term "int::nat \<Rightarrow> int"} $ mk_bitstring_to_nat tm
             | Bitstring => tm
             | String => @{term "map (\<lambda>b. if b then CHR ''1'' else CHR ''0'')"} $ tm
             | Other s => mk_nat_to_enum s (mk_bitstring_to_nat tm))
       | String =>
           (case l3_prim_type ty of
               Bool => mk_comb "L3_Lib.string_to_bool" (fn _ => HOLogic.boolT) tm
             | Char => @{term "string_to_char::string => char"} $ tm
             | Word => mk_word_of_int ty (@{term "int::nat \<Rightarrow> int"} $
                                          (mk_comb "L3_Lib.hex_string_to_nat" (fn _ => HOLogic.natT) tm))
             | Nat => mk_comb "L3_Lib.dec_string_to_nat" (fn _ => HOLogic.natT) tm
             | Int => mk_comb "L3_Lib.dec_string_to_int" (fn _ => HOLogic.intT) tm
             | Bitstring => @{term "map (\<lambda>c. c = CHR ''1'' \<or> c = CHR ''T'')"} $ tm
             | String => tm
             | Other s => mk_string_to_enum s tm)
       | Other s =>
           (case l3_prim_type ty of
               Bool => raise Fail "pick_cast: enum \<rightarrow> bool not supported"
             | Char => mk_chr (mk_enum_to_nat s tm)
             | Word => mk_word_of_int ty (@{term "int::nat \<Rightarrow> int"} $ mk_enum_to_nat s tm)
             | Nat => mk_enum_to_nat s tm
             | Int => @{term "int::nat \<Rightarrow> int"} $ mk_enum_to_nat s tm
             | Bitstring => mk_nat_to_bitstring (mk_enum_to_nat s tm)
             | String => mk_enum_to_string s tm
             | Other s2 => mk_nat_to_enum s2 (mk_enum_to_nat s tm))
    end
in
  val mk_word_to_nat = mk_word_to_nat
  fun mop (m: monop, x) =
    (case m of
        Abs => pick (mk_word_abs, mk_int_abs)
      | BNot => mk_word_1comp
      | Bin => mk_nat_from_string "bin"
      | Cardinality => mk_card
      | Cast ty => pick_cast ty
      | Dec => mk_nat_from_string "dec"
      | Difference => mk_split2 @{const_name minus} fst
      | Drop => mk_split2 @{const_name drop} snd
      | Element => mk_element
      | Flat => mk_flat
      | FPAbs double => mk_fp_abs double
      | FPEqual double => mk_fp_equal double
      | FPIsNaN double => mk_fp_is_nan double
      | FPLess double => mk_fp_less double
      | FPNeg double => mk_fp_negate double
      | FPAdd double => mk_fp_add double
      | FPSub double => mk_fp_sub double
      | FPMul double => mk_fp_mul double
      | Fst => HOLogic.mk_fst
      | Head => mk_hd
      | Hex => mk_nat_from_string "hex"
      | IndexOf => mk_index_of
      | Intersect => mk_split2 @{const_name inf} fst
      | IsAlpha => mk_is_char "alpha"
      | IsAlphaNum => mk_is_char "alpha_num"
      | IsDigit => mk_is_char "digit"
      | IsHexDigit => mk_is_char "hex_digit"
      | IsLower => mk_is_char "lower"
      | IsMember => mk_split2 @{const_name ListMem} (Library.K HOLogic.boolT)
      | IsSome => mk_is_some
      | IsSpace => mk_is_char "space"
      | IsSubset => mk_split2 @{const_name less} (Library.K HOLogic.boolT)
      | IsUpper => mk_is_char "upper"
      | K1 ty => (fn tm => mk_K_1 (tm, ty))
      | Length => mk_size
      | Log => pick (mk_word_log2, mk_log2)
      | Max => mk_max
      | Min => mk_min
      | Msb => mk_word_msb
      | Neg => mk_uminus
      | Not => HOLogic.mk_not
      | PadLeft => mk_split3 "L3_Lib.pad_left" (fn (_, _, ty) => ty)
      | PadRight => mk_split3 "L3_Lib.pad_right" (fn (_, _, ty) => ty)
      | QuotRem => mk_quot_rem
      | Remove => mk_remove false
      | RemoveExcept => mk_remove true
      | RemoveDuplicates => mk_remove_duplicates
      | Rev => pick (mk_word_rev, mk_rev)
      | SE ty => mk_sign_extend ty
      | Size => mk_size
      | Smax => mk_split2 @{const_name max} fst
      | Smin => mk_split2 @{const_name min} fst
      | Snd => HOLogic.mk_snd
      | SofL => mk_set
      | Some => mk_some
      | Tail => mk_tl
      | Take => mk_split2 @{const_name take} snd
      | ToLower => mk_to "lower"
      | ToUpper => mk_to "upper"
      | Union => mk_split2 @{const_name sup} fst
      | Update => mk_update
      | ValOf => mk_the
     ) x
end

local
  fun flip f (a, b) = f (b, a)
  fun pick (a, b, c, d) (tm1, tm2: term) : term =
    let
      val ty = Term.type_of tm1
    in
      Option.valOf
        (if is_wordT ty then SOME a
         else if Option.isSome b andalso ty = bitstringT then b
         else if Option.isSome c andalso ty = HOLogic.natT then c
         else if Option.isSome d andalso ty = HOLogic.intT then d
         else raise Fail "Bop: pick") (tm1, tm2)
    end
  fun shift a (tm1, tm2) = a (tm1, if is_wordT (Term.type_of tm2) then mk_word_to_nat tm2 else tm2)
  fun shift2 (a, b) (tms as (tm1, _)) =
    if Term.type_of tm1 = bitstringT then a tms else shift b tms
  fun mk_comb2 s f (tm1, tm2) =
    Term.Const (s, let val ty1 = Term.type_of tm1 and ty2 = Term.type_of tm2
                   in ty1 --> ty2 --> f (ty1, ty2) end) $ tm1 $ tm2
  val mk_bitstring_shiftl = mk_comb2 "L3_Lib.bitstring_shiftl" fst
  val mk_bitstring_shiftr = mk_comb2 "L3_Lib.bitstring_shiftr" fst
  val mk_bitstring_rotate = mk_comb2 "L3_Lib.bitstring_rotate" fst
  val mk_word_shiftl = mk_comb2 @{const_name shiftl} fst
  val mk_word_shiftr = mk_comb2 @{const_name shiftr} fst
  val mk_word_sshiftr = mk_comb2 @{const_name sshiftr} fst
  val mk_word_rotl = flip (mk_comb2 @{const_name word_rotl} snd)
  val mk_word_rotr = flip (mk_comb2 @{const_name word_rotr} snd)
  val mk_word_and = mk_comb2 @{const_name bitAND} fst
  val mk_word_or = mk_comb2 @{const_name bitOR} fst
  val mk_word_xor = mk_comb2 @{const_name bitXOR} fst
  val mk_band = mk_comb2 "L3_Lib.band" fst
  val mk_bor = mk_comb2 "L3_Lib.bor" fst
  val mk_bxor = mk_comb2 "L3_Lib.bxor" fst
  fun mk_replicate tm =
    @{term "concat::bool list list => bool list"} $
    mk_comb2 @{const_name replicate} (HOLogic.listT o snd) tm
  val mk_insert = mk_comb2 @{const_name insert} snd
  val mk_minus = mk_comb2 @{const_name minus} fst
  val mk_plus = mk_comb2 @{const_name plus} fst
  val mk_times = mk_comb2 @{const_name times} fst
  val mk_div = mk_comb2 @{const_name div} fst
  val mk_mod = mk_comb2 @{const_name mod} fst
  val mk_quot = mk_comb2 "L3_Lib.quot" fst
  val mk_rem = mk_comb2 "L3_Lib.rem" fst
  val mk_word_quot = mk_comb2 "L3_Lib.word_quot" fst
  val mk_word_rem = mk_comb2 "L3_Lib.word_rem" fst
  val mk_power = mk_comb2 @{const_name power} fst
  val mk_less = mk_comb2 @{const_name less} (fn _ => HOLogic.boolT)
  val mk_less_eq = mk_comb2 @{const_name less_eq} (fn _ => HOLogic.boolT)
  val mk_word_sless = mk_comb2 @{const_name word_sless} (fn _ => HOLogic.boolT)
  val mk_word_sle = mk_comb2 @{const_name word_sle} (fn _ => HOLogic.boolT)
  val mk_word_test_bit = mk_comb2 @{const_name test_bit} (fn _ => HOLogic.boolT)
  val mk_bitstring_test_bit = mk_comb2 "L3_Lib.bitstring_test_bit" (fn _ => HOLogic.boolT)
  val mk_splitl = mk_comb2 "L3_Lib.splitl" (fn (_, ty) => HOLogic.mk_prodT (ty, ty))
  val mk_splitr = mk_comb2 "L3_Lib.splitr" (fn (_, ty) => HOLogic.mk_prodT (ty, ty))
  val mk_fields = mk_comb2 "L3_Lib.fields" (fn _ => @{typ "string list"})
  val mk_tokens = mk_comb2 "L3_Lib.tokens" (fn _ => @{typ "string list"})
  fun mk_word_modify (tm1, tm2) =
    let
      val ty1 = Term.type_of tm1
      val ty2 = Term.type_of tm2
    in
      Term.Const ("L3_Lib.word_modify", HOLogic.mk_prodT (ty1, ty2) --> ty2) $
      HOLogic.mk_prod (tm1, tm2)
    end
in
  fun bop (b: binop, x, y) =
  (x, y) |>
  (case b of
      And => HOLogic.mk_conj
    | BAnd => pick (mk_word_and, SOME mk_band, NONE, NONE)
    | BOr => pick (mk_word_or, SOME mk_bor, NONE, NONE)
    | BXor => pick (mk_word_xor, SOME mk_bxor, NONE, NONE)
    | Bit => pick (mk_word_test_bit, SOME mk_bitstring_test_bit, NONE, NONE)
    | In => HOLogic.mk_mem
    | Insert => mk_insert
    | Mdfy => mk_word_modify
    | Or => HOLogic.mk_disj
    | Uge => flip mk_less_eq
    | Ugt => flip mk_less
    | Ule => mk_less_eq
    | Ult => mk_less
    | Ge => flip (pick (mk_word_sle, NONE, SOME mk_less_eq, SOME mk_less_eq))
    | Gt => flip (pick (mk_word_sless, NONE, SOME mk_less, SOME mk_less))
    | Le => pick (mk_word_sle, NONE, SOME mk_less_eq, SOME mk_less_eq)
    | Lt => pick (mk_word_sless, NONE, SOME mk_less, SOME mk_less)
    | Splitl => mk_splitl
    | Splitr => mk_splitr
    | Fld => mk_fields
    | Tok => mk_tokens
    | Add => mk_plus
    | Sub => mk_minus
    | Mul => mk_times
    | Exp => mk_power
    | Div => mk_div
    | Mod => mk_mod
    | Quot => pick (mk_word_quot, NONE, NONE, SOME mk_quot)
    | Rem => pick (mk_word_rem, NONE, NONE, SOME mk_rem)
    | Asr => shift mk_word_sshiftr
    | Rol => shift mk_word_rotl
    | Lsl => shift2 (mk_bitstring_shiftl, mk_word_shiftl)
    | Lsr => shift2 (mk_bitstring_shiftr, mk_word_shiftr)
    | Ror => shift2 (mk_bitstring_rotate, mk_word_rotr)
    | Rep => mk_replicate)
end

(* declaring functions and definitions *)
local
(*  fun default_termination lthy =
    snd (Function.prove_termination NONE (Function_Common.termination_prover_tac lthy) lthy) *)
  fun prim_add_fun s tm =
    Named_Target.init ""
    #> Function.add_function [(Binding.make (s, Position.none), NONE, Mixfix.NoSyn)]
         [(Attrib.empty_binding, HOLogic.mk_Trueprop tm)] Function_Common.default_config
         (fn ctxt => Pat_Completeness.pat_completeness_tac ctxt 1
                     THEN Classical.clarify_tac ctxt 1
                     THEN Clasimp.auto_tac ctxt)
    #> snd
    #> Local_Theory.exit_global
  fun define s tm = Context.>> (Context.map_theory (prim_add_fun s tm))
in
  fun function (s, a, b) =
    let
      val ty = Term.type_of a --> Term.type_of b
    in
      writeln ("Defining: \"" ^ s ^ "\"")
      ; reset_anon ()
      ; define s (HOLogic.mk_eq (var (s, ty) $ a, b))
    end
end

local
  fun prim_add_def s tm =
    Named_Target.init ""
    #> Specification.definition (NONE, ((Thm.def_binding (Binding.make (s, Position.none)), []), tm))
    #> snd
    #> Local_Theory.exit_global
  fun define s tm = Context.>> (Context.map_theory (prim_add_def s tm))
in
  fun def (s, tm) =
    ( writeln ("Defining: \"" ^ s ^ "\"")
    ; reset_anon ()
    ; define s (Logic.mk_equals (Term.Free (s, Term.type_of tm), tm))
    )
end
end
