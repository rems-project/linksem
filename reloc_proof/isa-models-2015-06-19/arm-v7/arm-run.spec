-----------------------------------------------------------------------
-- Formal Specification of the ARMv7-AR instruction set architecture --
-- (c) Anthony Fox, University of Cambridge                          --
-----------------------------------------------------------------------

define Run

--------------------
-- Instruction fetch
--------------------

construct MachineCode {
   Thumb   :: half
   ThumbEE :: half
   Thumb2  :: half * half
   ARM     :: word
   BadCode :: string
}

MachineCode Fetch =
{  iset = CurrentInstrSet();
   if iset == InstrSet_ARM or Architecture == ARMv4 then
   {  Encoding <- Encoding_ARM;
      ARM (MemA (REG(RName_PC), 4))
   }
   else if iset == InstrSet_Jazelle then
      BadCode ("Fetch")
   else
   {  fpc = REG(RName_PC);
      ireg = MemA (fpc, 2);
      if ireg<15:13> == 0b111 and ireg<12:11> != 0b00 then
      {  Encoding <- Encoding_Thumb2;
         Thumb2 (ireg, MemA (fpc+2, 2))
      }
      else
      {  Encoding <- Encoding_Thumb;
         if iset == InstrSet_Thumb or not HaveThumbEE() then
            Thumb (ireg)
         else
            ThumbEE (ireg)
      }
   }
}

-----------------------
-- Instruction decoding
-----------------------

declare undefined :: bool

bool Do (cond::cond, defined::bool) =
{  CurrentCondition <- cond;
   pass = ConditionPassed();
   undefined <- pass and not defined;
   return (pass and defined)
}

instruction Skip () =
   if undefined then
      Undefined (0)
   else
      NoOperation

instruction UndefinedARM (cond::cond) =
{  CurrentCondition <- cond;
   if ConditionPassed() then
      Undefined (0)
   else
      NoOperation
}

instruction UndefinedThumb () = UndefinedARM (ThumbCondition())

unit DECODE_UNPREDICTABLE (mc::MachineCode, s::string) =
   #UNPREDICTABLE
     ( "Decode " :
       match mc
       { case ARM (opc) =>
            [[opc]::bool list] : "; ARM; "
         case Thumb (opc) =>
            [[opc]::bool list] : "; Thumb; "
         case ThumbEE (opc) =>
            [[opc]::bool list] : "; ThumbEE; "
         case Thumb2 (opc1, opc2) =>
            [[opc1]::bool list] : ", " : [[opc2]::bool list] : "; Thumb2; "
         case BadCode (x) => x
       } : s )

instruction DecodeHint (cond::bits(4), op::bits(8)) =
   if Architecture == ARMv6T2 or
      op<7:4> == 0b1111 and Encoding == Encoding_ARM and Architecture == ARMv6K
   then
      NoOperation
   else if Do (cond, ArchVersion() >= 7 or
                       Encoding == Encoding_ARM and Architecture == ARMv6K)
   then
      match op
      {  case '00000001'      => Hint (Yield)
         case '00000010'      => Hint (WaitForEvent)
         case '00000011'      => Hint (WaitForInterrupt)
         case '00000100'      => Hint (SendEvent)
         case '1111 : option' => Hint (Debug (option))
         case _               => NoOperation
      }
   else
      Skip ()

-- ~~~~~~~~~~~~~~~~
-- UADD16,  SADD16
-- UASX,    SASX
-- USAX,    SSAX
-- USUB16,  SSUB16
-- UADD8,   SADD8
-- USUB8,   SSUB8
-- UQADD16, QADD16
-- UQASX,   QASX
-- UQSAX,   QSAX
-- UQSUB16, QSUB16
-- UQADD8,  QADD8
-- UQSUB8,  QSUB8
-- UHADD16, SHADD16
-- UHASX,   SHASX
-- UHSAX,   SHSAX
-- UHSUB16, SHSUB16
-- UHADD8,  SHADD8
-- UHSUB8,  SHSUB8
-- ~~~~~~~~~~~~~~~~
instruction DecodeParallelAdditionSubtraction
    (op1::bits(2), op2::bits(3), U::bits(1), Rd::reg, Rn::reg, Rm::reg) =
  return
   (if U == 1 then
      match (op1, op2)
      { case '01', '0 x' => SIMD (UnsignedAddSub16 (x, Rd, Rn, Rm))
        case '01', '100' => SIMD (UnsignedAddSub8 (false, Rd, Rn, Rm))
        case '01', '111' => SIMD (UnsignedAddSub8 (true, Rd, Rn, Rm))
        case '10', '0 x' => SIMD (UnsignedSaturatingAddSub16 (x, Rd, Rn, Rm))
        case '10', '100' => SIMD (UnsignedSaturatingAddSub8 (false, Rd, Rn, Rm))
        case '10', '111' => SIMD (UnsignedSaturatingAddSub8 (true, Rd, Rn, Rm))
        case '11', '0 x' => SIMD (UnsignedHalvingAddSub16 (x, Rd, Rn, Rm))
        case '11', '100' => SIMD (UnsignedHalvingAddSub8 (false, Rd, Rn, Rm))
        case '11', '111' => SIMD (UnsignedHalvingAddSub8 (true, Rd, Rn, Rm))
        case _ => Undefined (0)
      }
    else
      match (op1, op2)
      { case '01', '0 x' => SIMD (SignedAddSub16 (x, Rd, Rn, Rm))
        case '01', '100' => SIMD (SignedAddSub8 (false, Rd, Rn, Rm))
        case '01', '111' => SIMD (SignedAddSub8 (true, Rd, Rn, Rm))
        case '10', '0 x' => SIMD (SignedSaturatingAddSub16 (x, Rd, Rn, Rm))
        case '10', '100' => SIMD (SignedSaturatingAddSub8 (false, Rd, Rn, Rm))
        case '10', '111' => SIMD (SignedSaturatingAddSub8 (true, Rd, Rn, Rm))
        case '11', '0 x' => SIMD (SignedHalvingAddSub16 (x, Rd, Rn, Rm))
        case '11', '100' => SIMD (SignedHalvingAddSub8 (false, Rd, Rn, Rm))
        case '11', '111' => SIMD (SignedHalvingAddSub8 (true, Rd, Rn, Rm))
        case _ => Undefined (0)
      }
   )

pattern {
   m A B D I E F H M N P R S U W
   J1 J2 tb sh sz DN                          ` 1
   imod typ imm2                              ` 2
   Rdn imm3                                   ` 3
   m1 mask option cond imm4 imm4L imm4H       ` 4
   Rm Rn Rd Rt RdLo RdHi Vn Vd Vm             ` 4
   lsb msb mode imm5                          ` 5
   imm6                                       ` 6
   imm7                                       ` 7
   imm8                                       ` 8
   imm10 imm10L imm10H                        ` 10
   imm11                                      ` 11
   imm12                                      ` 12
   imm24                                      ` 24
}

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- VFP Decoder
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{- For case with no VFP
instruction VFP () = Undefined (0)
unit DecodeVFP (w::word) = ()
-}

VFP DecodeVFP (w::word) =
   match w<27:0>
   {
      case '1101 U D 0 L Rn Vd 101 sz imm8' =>
        {
           single_reg = sz == 0;
           add = U == 1;
           imm32 = ZeroExtend (imm8 : '00');
           d = if single_reg then Vd : D else D : Vd;
           if L == 1 then
              vldr (single_reg, add, d, Rn, imm32)
           else
              vstr (single_reg, add, d, Rn, imm32)
        }
      case '11100 D op1`2 Vn Vd 101 sz N op2`1 M 0 Vm' =>
        {
           dp_operation = sz == 1;
           d, n, m = if dp_operation then
                        D : Vd, N : Vn, M : Vm
                     else
                        Vd : D, Vn : N, Vm : M;
           match op1
           {
             case '00' => vmla_vmls (dp_operation, op2 == 0, d, n, m)
             case '01' => { typ = if op2 == 1 then
                                     VFPNegMul_VNMLA
                                  else
                                     VFPNegMul_VNMLS;
                            vneg_mul (dp_operation, typ, d, n, m)
                          }
             case '10' => if op2 == 1 then
                             vneg_mul (dp_operation, VFPNegMul_VNMUL, d, n, m)
                          else
                             vmul (dp_operation, d, n, m)
             case '11' => if op2 == 1 then
                             vsub (dp_operation, d, n, m)
                          else
                             vadd (dp_operation, d, n, m)
           }
        }
      case '11101 D 11 0000 Vd 101 sz 01 M 0 Vm' =>
        {
           single_register = sz == '0';
           d, m = if single_register then
                     Vd : D, Vm : M
                  else
                     D : Vd, M : Vm;
           vmov (single_register, d, m)
        }
      case '11101 D 11 0100 Vd 101 sz E 1 M 0 Vm' =>
        if E == '1' then -- quiet_nan_exc
        {
           dp_operation = sz == 1;
           d, m = if dp_operation then D : Vd, M : Vm else Vd : D, Vm : M;
           vcmp (dp_operation, d, Some (m))
        }
        else UndefinedVFP
      case '11101 D 11 0101 Vd 101 sz E 1 (0) 0 (0000)' =>
        if E == '1' then -- quiet_nan_exc
        {
           dp_operation = sz == 1;
           d = if dp_operation then D : Vd else Vd : D;
           vcmp (dp_operation, d, None)
        }
        else UndefinedVFP
      case '11101 D 11 imm4H Vd 101 sz (0) 0 (0) 0 imm4L' =>
        {
           single_register = sz == '0';
           imm64 = VFPExpandImm (imm4H : imm4L, single_register);
           d = if single_register then Vd : D else D : Vd;
           vmov_imm (single_register, d, imm64)
        }
      case '11101 111 0001 Rt 1010 (000) 1 (0000)' =>
        if Rt == 13 then
           #UNPREDICTABLE ("DecodeVFP: mrs")
        else
           vmrs (Rt)
      case _ => UndefinedVFP
   }

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 32-bit ARM Decoder
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

instruction DecodeARM(w::word) = {
 mc = ARM (w);
 cond = w<31:28>;
 if cond == 15 then
   match w<27:0>
   {
     -- 1 ~~~~~~~~~~~~~~~~~~~~~~~
     -- SETEND <endian_specifier>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00010000 (000) 1 (000000) : E : (0) 0000 (0000)' =>
        if Do (0b1110, ArchVersion() >= 6) then
           System (Setend (E == 1))
        else
           Skip ()

     -- 2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- CPS<effect> <iflags>{, #<mode>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00010000 : imod : M : 0 (0000000) : A : I : F : 0 : mode' =>
        if Do (0b1110, ArchVersion() >= 6) then
        {  when mode != 0b00000 and M == 0 or
                imod<1> == (A:I:F == 0b000) or
                imod == 0b00 and M == 0 or imod == 0b01 do
              DECODE_UNPREDICTABLE (mc, "ChangeProcessorState");
           enable = imod == 0b10;
           disable = imod == 0b11;
           affectA = A == 1;
           affectI = I == 1;
           affectF = F == 1;
           changemode = if M == 1 then Some (mode) else None;
           System
             (ChangeProcessorState
                (enable, disable, affectA, affectI, affectF, changemode))
        }
        else
           Skip ()

     -- 3 ~~~~~~~~~~~~~~~~~~~~~
     -- PLI [<Rn>, #+/-<imm12>]
     -- PLI <label>
     -- ~~~~~~~~~~~~~~~~~~~~~~~
     case '0100 : U : 101 : Rn : (1111) : imm12' =>
        if Do (0b1110, ArchVersion() >= 7) then
        {  add = U == 1;
           imm32 = ZeroExtend (imm12);
           Hint (PreloadInstruction (add, Rn, immediate_form1 (imm32)))
        }
        else
           Skip ()

     -- 4 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- PLI [<Rn>,+/-<Rm>{,<shift>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0110 : U : 101 : Rn : (1111) : imm5 : typ : 0 : Rm' =>
        if Do (0b1110, ArchVersion() >= 7) then
        {  when Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "PreloadInstruction (register)");
           add = U == 1;
           shift_t, shift_n = DecodeImmShift (typ, imm5);
           m = register_form1 (Rm, shift_t, shift_n);
           Hint (PreloadInstruction (add, Rn, m))
        }
        else
           Skip ()

     -- 5 ~~~
     -- CLREX
     -- ~~~~~
     case '01010111 (1) (111) (1111) (0000) 0001 (1111)' =>
        if Do (0b1110, Architecture in set {ARMv6K,ARMv7_A,ARMv7_R}) then
           ClearExclusive
        else
           Skip ()

     -- 6 ~~~~~~~~~~
     -- DSB <option>
     -- ~~~~~~~~~~~~
     case '01010111 1111 1111 0000 0100 : option' =>
        if Do (0b1110, ArchVersion() >= 7) then
           Hint (DataSynchronizationBarrier (option))
        else
           Skip ()

     -- 7 ~~~~~~~~~~
     -- DMB <option>
     -- ~~~~~~~~~~~~
     case '01010111 (1111) (1111) (0000) 0101 : option' =>
        if Do (0b1110, ArchVersion() >= 7) then
           Hint (DataMemoryBarrier (option))
        else
           Skip ()

     -- 8 ~~~~~~~~~~
     -- ISB <option>
     -- ~~~~~~~~~~~~
     case '01010111 (1111) (1111) (0000) 0110 : option' =>
        if Do (0b1110, ArchVersion() >= 7) then
           Hint (InstructionSynchronizationBarrier (option))
        else
           Skip ()

     -- 9 ~~~~~~~~~
     -- PLD <label>
     -- ~~~~~~~~~~~
     case '0101 : U : (1) 01 1111 (1111) : imm12' =>
        if Do (0b1110, HaveDSPSupport()) then
        {  add = U == 1;
           imm32 = ZeroExtend (imm12);
           Hint (PreloadDataLiteral (add, imm32))
        }
        else
           Skip ()

     -- 10 ~~~~~~~~~~~~~~~~~~~~~~~
     -- PLD{W} [<Rn>, #+/-<imm12>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0101 : U : R : 01 : Rn : (1111) : imm12' =>
        if Do (0b1110, R == 1 and ArchVersion() >= 7 and
                                   Extension_Multiprocessing in Extensions or
                         R == 0 and HaveDSPSupport()) then
        {  add = U == 1;
           is_pldw = R == 0;
           imm32 = ZeroExtend (imm12);
           Hint (PreloadData (add, is_pldw, Rn, immediate_form1 (imm32)))
        }
        else
           Skip ()

     -- 11 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- PLD{W} [<Rn>, +/-<Rm>{, <shift>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0111 : U : R : 01 : Rn : (1111) : imm5 : typ : 0 : Rm' =>
        if Do (0b1110, R == 1 and ArchVersion() >= 7 and
                                   Extension_Multiprocessing in Extensions or
                         R == 0 and HaveDSPSupport()) then
        {  is_pldw = R == 0;
           when Rm == 15 or (Rn == 15 and is_pldw) do
              DECODE_UNPREDICTABLE (mc, "PreloadData (register)");
           add = U == 1;
           shift_t, shift_n = DecodeImmShift (typ, imm5);
           m = register_form1 (Rm, shift_t, shift_n);
           Hint (PreloadData (add, is_pldw, Rn, m))
        }
        else
           Skip ()

     -- 12 ~~~~~~~~~~~~~~~~~~~~~~~~
     -- SRS{<amode>} SP{!}, #<mode>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '100 : P : U : 1 : W : 0 (1101)(0000)(0101)(000) : mode' =>
        if Do (0b1110, ArchVersion() >= 6) then
        {  wback = W == 1;
           increment = U == 1;
           wordhigher = P == U;
           System (StoreReturnState (increment, wordhigher, wback, mode))
        }
        else
           Skip ()

     -- 13 ~~~~~~~~~~~~~~~~~
     -- RFE{<amode>} <Rn>{!}
     -- ~~~~~~~~~~~~~~~~~~~~
     case '100 : P : U : 0 : W : 1 : Rn : (0000)(1010)(00000000)' =>
        if Do (0b1110, ArchVersion() >= 6) then
        {  when Rn == 15 do
              DECODE_UNPREDICTABLE (mc, "ReturnFromException");
           wback = W == 1;
           increment = U == 1;
           wordhigher = P == U;
           System (ReturnFromException (increment, wordhigher, wback, Rn))
        }
        else
           Skip ()

     -- 14 ~~~~~~~~
     -- BLX <label>
     -- ~~~~~~~~~~~
     case '101 : H : imm24' =>
        if Do (0b1110, ArchVersion() >= 5) then
        {  imm32 = SignExtend (imm24 : H : '0');
           targetInstrSet = InstrSet_Thumb;
           Branch (BranchLinkExchangeImmediate (targetInstrSet, imm32))
        }
        else
           Skip ()

     -- 15 ~~~~~~~~~~~~~~
     -- Unconditional ARM
     -- ~~~~~~~~~~~~~~~~~
     case _ =>
        if ArchVersion() >= 5 then
           Undefined (0)
        else
        {  DECODE_UNPREDICTABLE (mc, "");
           UNKNOWN
        }
   }
 else
   match w<27:0>
   {
     -- 1 ~~~~~~~~~~~~~
     -- UDF<c> #<imm16>
     -- ~~~~~~~~~~~~~~~
     case '011 11111 : imm12 : 1111 : imm4' =>
        {  imm32 = ZeroExtend (imm12 : imm4);
           CurrentCondition <- cond;
           if ConditionPassed() then
              Undefined (imm32)
           else
              NoOperation
        }

     -- 2 ~~~~~~~~~~~~~~~~~~~~~~~
     -- MRS<c> <Rd>, <banked_reg>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00010 : R : 00 : m1 : Rd : (00) 1 : m : 0000 (0000)' =>
        if Do (cond, HaveVirtExt()) then
        {  when Rd == 15 do
              DECODE_UNPREDICTABLE (mc, "MoveToRegisterFromBankedOrSpecial");
           read_spsr = R == 1;
           SYSm = m : m1;
           System (MoveToRegisterFromBankedOrSpecial (read_spsr, SYSm, Rd))
        }
        else
           Skip ()

     -- 3 ~~~~~~~~~~~~~~~~~~~~~
     -- MRS<c> <Rd>, <spec_reg>
     -- ~~~~~~~~~~~~~~~~~~~~~~~
     case '00010 : R : 00 (1111) : Rd : (00) 0 (0) 0000 (0000)'
       =>
        if Do (cond, true) then
        {  when Rd == 15 do
              DECODE_UNPREDICTABLE (mc, "MoveToRegisterFromSpecial");
           read_spsr = R == 1;
           System (MoveToRegisterFromSpecial (read_spsr, Rd))
        }
        else
           Skip ()

     -- 4 ~~~~~~~~~~~~~~~~~~~~~~~
     -- MSR<c> <banked_reg>, <Rd>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00010 : R : 10 : m1 : (1111) (00) 1 : m : 0000 : Rn' =>
        if Do (cond, HaveVirtExt()) then
        {  when Rn in set {13, 15} do
              DECODE_UNPREDICTABLE (mc, "MoveToBankedOrSpecialRegister");
           write_spsr = R == 1;
           SYSm = m : m1;
           System (MoveToBankedOrSpecialRegister (write_spsr, SYSm, Rn))
        }
        else
           Skip ()

     -- 5 ~~~~~~~~~~~~~~~~~~~~~
     -- MSR<c> <spec_reg>, <Rn>
     -- ~~~~~~~~~~~~~~~~~~~~~~~
     case '00010 : R : 10 : mask : (1111) (00) 0 (0) 0000 : Rn' =>
        if Do (cond, true) then
        {  when Rn == 15 or mask == 0b0000 do
              DECODE_UNPREDICTABLE (mc, "MoveToSpecialFromRegister");
           write_spsr = R == 1;
           System (MoveToSpecialFromRegister (write_spsr, Rn, mask))
        }
        else
           Skip ()

     -- 6 ~~~~~~~~
     -- BX<c> <Rm>
     -- ~~~~~~~~~~
     case '00010010 (1111) (1111) (1111) 0001 : Rm' =>
        if Do (cond, Architecture != ARMv4) then
           Branch (BranchExchange (Rm))
        else
           Skip ()

     -- 7 ~~~~~~~~~~~~~~~
     -- CLZ<c> <Rd>, <Rm>
     -- ~~~~~~~~~~~~~~~~~
     case '00010110 (1111) : Rd : (1111) 0001 : Rm' =>
        if Do (cond, ArchVersion() >= 5) then
        {  when Rd == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "CountLeadingZeroes");
           Data (CountLeadingZeroes (Rd, Rm))
        }
        else
           Skip ()

     -- 8 ~~~~~~~~~
     -- BLX<c> <Rm>
     -- ~~~~~~~~~~~
     case '00010010 (1111) (1111) (1111) 0011 : Rm' =>
        if Do (cond, ArchVersion() >= 5) then
        {  when Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "BranchLinkExchangeRegister");
           Branch (BranchLinkExchangeRegister (Rm))
        }
        else
           Skip ()

     -- 9 ~~~~~~~~~~~~~~~~~~~~~~~
     -- QADD<c> <Rd>, <Rm>, <Rn>
     -- QSUB<c> <Rd>, <Rm>, <Rn>
     -- QDADD<c> <Rd>, <Rm>, <Rn>
     -- QDSUB<c> <Rd>, <Rm>, <Rn>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00010: opc`2 : 0 : Rn : Rd : (0000) 0101 : Rm' =>
        if Do (cond, HaveDSPSupport()) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "SaturatingAddSubtract");
           Media (SaturatingAddSubtract (opc, Rd, Rm, Rn))
        }
        else
           Skip ()

     -- 10 ~~~~~~~~~~
     -- BKPT #<imm16>
     -- ~~~~~~~~~~~~~
     case '00010010 : imm12 : 0111 : imm4' =>
        if ArchVersion() >= 5 then
        {  when cond != 0b1110 do
              DECODE_UNPREDICTABLE (mc, "Breakpoint");
           CurrentCondition <- cond;
           imm32 = ZeroExtend (imm12 : imm4);
           Hint (Breakpoint (imm32))
        }
        else
        {  if Do (cond, false) then
              Undefined (0)
           else
              NoOperation
        }

     -- 11 ~~~~~~~
     -- HVC #<imm>
     -- ~~~~~~~~~~
     case '00010100 : imm12 : 0111 : imm4' =>
        if Do (cond, HaveVirtExt()) then
        {  when cond != 0b1110 do
              DECODE_UNPREDICTABLE (mc, "HypervisorCall");
           imm16 = imm12 : imm4;
           System (HypervisorCall (imm16))
        }
        else
           Skip ()

     -- 12 ~~~~~~~~~~~~~
     -- SMC<c> {#}<imm4>
     -- ~~~~~~~~~~~~~~~~
     case '0001011 0 (000000000000) 0111 : imm4' =>
        if Do (cond, HaveSecurityExt()) then
           System (SecureMonitorCall (imm4))
        else
           Skip ()

     -- 13 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SMLA<x><y><c> <Rd>, <Rn>, <Rm>, <Ra>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00010000 : Rd : Ra : Rm : 1 : M : N : 0 : Rn' =>
        if Do (cond, HaveDSPSupport()) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 or Ra == 15 do
              DECODE_UNPREDICTABLE (mc, "Signed16Multiply32Accumulate");
           n_high = N == 1;
           m_high = M == 1;
           Multiply
             (Signed16Multiply32Accumulate (m_high, n_high, Rd, Rn, Rm, Ra))
        }
        else
           Skip ()

     -- 14 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SMLAW<y><c> <Rd>, <Rn>, <Rm>, <Ra>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00010010 : Rd : Ra : Rm : 1 : M : 0 0 : Rn' =>
        if Do (cond, HaveDSPSupport()) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 or Ra == 15 do
              DECODE_UNPREDICTABLE (mc, "Signed16x32Multiply32Accumulate");
           m_high = M == 1;
           Multiply (Signed16x32Multiply32Accumulate (m_high, Rd, Rn, Rm, Ra))
        }
        else
           Skip ()

     -- 15 ~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SMULW<y><c> <Rd>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00010010 : Rd : (0000) : Rm : 1 : M : 1 0 : Rn' =>
        if Do (cond, HaveDSPSupport()) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "Signed16x32Multiply32Result");
           m_high = M == 1;
           Multiply (Signed16x32Multiply32Result (m_high, Rd, Rn, Rm))
        }
        else
           Skip ()

     -- 16 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SMLAL<y><c> <RdLo>, <RdHi>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00010100 : RdHi : RdLo : Rm : 1 : M : N : 0 : Rn' =>
        if Do (cond, HaveDSPSupport()) then
        {  when RdLo == 15 or RdHi == 15 or Rn == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "Signed16Multiply64Accumulate");
           n_high = N == 1;
           m_high = M == 1;
           Multiply
             (Signed16Multiply64Accumulate (m_high, n_high, RdHi, RdLo, Rn, Rm))
        }
        else
           Skip ()

     -- 17 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SMUL<x><y><c> <Rd>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00010110 : Rd : (0000) : Rm : 1 : M : N : 0 : Rn' =>
        if Do (cond, HaveDSPSupport()) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "Signed16Multiply32Result");
           n_high = N == 1;
           m_high = M == 1;
           Multiply (Signed16Multiply32Result (m_high, n_high, Rd, Rn, Rm))
        }
        else
           Skip ()

     -- 18 ~~~~~~~~~~~~~~~
     -- SUBS<c> PC, LR, #0
     -- ERET<c>
     -- ~~~~~~~~~~~~~~~~~~
     case '00010110 000000000000 0110 1110' =>
        if Do (cond, HaveVirtExt()) then
           System (ExceptionReturn)
        else
           Skip ()

     -- 19 ~~~~~~
     -- Undefined
     -- ~~~~~~~~~
     case '000 10 _`2 0 _`12 0 _`7' =>
        Undefined (0)

     -- 20 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- <opc>{S}<c> <Rd>, <Rn>, <Rm>, <shift>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '000 : opc`4 : S : Rn : Rd : imm5 : typ : 0 : Rm' =>
        if Do (cond, true) then
        {  setflags = S == 1;
           shift_t, shift_n = DecodeImmShift (typ, imm5);
           if opc<3:2> == '10' then
              Data (TestCompareRegister (opc<1:0>, Rn, Rm, shift_t, shift_n))
           else if opc in set {'1101', '1111'} then
              Data (ShiftImmediate (opc<1>, setflags, Rd, Rm, shift_t, shift_n))
           else
              Data (Register (opc, setflags, Rd, Rn, Rm, shift_t, shift_n))
        }
        else
           Skip ()

     -- 21 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- <opc>{S}<c> <Rd>, <Rn>, <Rm>, <type> <Rs>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '000 : opc`4 : S : Rn : Rd : Rs : 0 : typ : 1 : Rm' =>
        if Do (cond, true) then
        {  when Rd == 15 and opc<3:2> != '10' or
                Rn == 15 or Rm == 15 or Rs == 15 do
              DECODE_UNPREDICTABLE (mc, "RegisterShiftedRegister");
           setflags = S == 1;
           shift_t = DecodeRegShift (typ);
           if opc == '1101' or opc == '1111' then
              Data (ShiftRegister (opc<1>, setflags, Rd, Rm, shift_t, Rs))
           else
              Data (RegisterShiftedRegister
                (opc, setflags, Rd, Rn, Rm, shift_t, Rs))
        }
        else
           Skip ()

     -- 22 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- MLA{S}<c> <Rd>, <Rn>, <Rm>, <Ra>
     -- MUL{S}<c> <Rd>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '000000 : A : S : Rd : Ra : Rm : 1001 : Rn' =>
        if Do (cond, true) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 or A == 1 and Ra == 15 or
                ArchVersion() < 6 and Rd == Rn do
              DECODE_UNPREDICTABLE (mc, "Multiply");
           setflags = S == 1;
           if A == 1 then
              Multiply (MultiplyAccumulate (setflags, Rd, Rn, Rm, Ra))
           else
              Multiply (Multiply32 (setflags, Rd, Rn, Rm))
        }
        else
           Skip ()

     -- 23 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- UMAAL<c> <RdLo>, <RdHi>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00000100 : RdHi : RdLo : Rm : 1001 : Rn' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when RdHi == 15 or RdLo == 15 or Rn == 15 or Rm == 15 or
                RdHi == RdLo do
              DECODE_UNPREDICTABLE (mc, "MultiplyAccumulateAccumulate");
           Multiply (MultiplyAccumulateAccumulate (RdHi, RdLo, Rn, Rm))
        }
        else
           Skip ()

     -- 24 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- MLS<c> <Rd>, <Rn>, <Rm>, <Ra>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00000110 : Rd : Ra : Rm : 1001 : Rn' =>
        if Do (cond, HaveThumb2()) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 or Ra == 15 do
              DECODE_UNPREDICTABLE (mc, "MultiplySubtract");
           Multiply (MultiplySubtract (Rd, Rn, Rm, Ra))
        }
        else
           Skip ()

     -- 25 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- UMLAL{S}<c> <RdLo>, <RdHi>, <Rn>, <Rm>
     -- SMLAL{S}<c> <RdLo>, <RdHi>, <Rn>, <Rm>
     -- UMULL{S}<c> <RdLo>, <RdHi>, <Rn>, <Rm>
     -- SMULL{S}<c> <RdLo>, <RdHi>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00001 : I : A : S : RdHi : RdLo : Rm : 1001 : Rn' =>
        if Do (cond, true) then
        {  when RdLo == 15 or RdHi == 15 or Rn == 15 or Rm == 15 or
                RdHi == RdLo or
                ArchVersion() < 6 and (RdHi == Rn or RdLo == Rn) do
              DECODE_UNPREDICTABLE (mc, "MultiplyLong");
           accumulate = A == 1;
           signed = I == 1;
           setflags = S == 1;
           Multiply
             (MultiplyLong (accumulate, signed, setflags, RdHi, RdLo, Rn, Rm))
        }
        else
           Skip ()

     -- 26 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SWP{B}<c> <Rt>, <Rt2>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00010 : B : 00 : Rn : Rt : (0000) 1001 : Rt2' =>
        if Do (cond, true) then
        {  when Rt == 15 or Rt2 == 15 or Rn == 15 or Rn == Rt or Rn == Rt2 do
              DECODE_UNPREDICTABLE (mc, "Swap");
           b = B == 1;
           Swap (b, Rt, Rt2, Rn)
        }
        else
           Skip ()

     -- 27 ~~~~~~~~~~~~~~~~~~~~~~~~
     -- STREX<c> <Rd>, <Rt>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0001100 0 : Rn : Rd : (1111) 1001 : Rt' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rt == 15 or Rn == 15 or
                Rd == Rn or Rd == Rt do
              DECODE_UNPREDICTABLE (mc, "StoreExclusive");
           Store (StoreExclusive (Rd, Rt, Rn, 0))
        }
        else
           Skip ()

     -- 28 ~~~~~~~~~~~~~~~~~~
     -- LDREX<c> <Rt>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~
     case '0001100 1 : Rn : Rt : (1111) 1001 (1111)' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rt == 15 or Rn == 15 do
              DECODE_UNPREDICTABLE (mc, "LoadExclusive");
           Load (LoadExclusive (Rt, Rn, 0))
        }
        else
           Skip ()

     -- 29 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STREXD<c> <Rd>, <Rt>, <Rt2>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0001101 0 : Rn : Rd : (1111) 1001 : Rt' =>
        if Do (cond, Architecture in set {ARMv6K,ARMv7_A,ARMv7_R}) then
        {  Rt2 = Rt + 1;
           when Rd == 15 or Rt<0> or Rt == 0b1110 or Rn == 15 or
                Rd == Rn or Rd == Rt or Rd == Rt2 do
              DECODE_UNPREDICTABLE (mc, "StoreExclusiveDoubleword");
           Store (StoreExclusiveDoubleword (Rd, Rt, Rt2, Rn))
        }
        else
           Skip ()

     -- 30 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDREXD<c> <Rt>, <Rt2>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0001101 1 : Rn : Rt : (1111) 1001 (1111)' =>
        if Do (cond, Architecture in set {ARMv6K,ARMv7_A,ARMv7_R}) then
        {  Rt2 = Rt + 1;
           when Rt<0> or Rt == 0b1110 or Rn == 15 do
              DECODE_UNPREDICTABLE (mc, "LoadExclusiveDoubleword");
           Load (LoadExclusiveDoubleword (Rt, Rt2, Rn))
        }
        else
           Skip ()

     -- 31 ~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STREXB<c> <Rd>, <Rt>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0001110 0 : Rn : Rd : (1111) 1001 : Rt' =>
        if Do (cond, Architecture in set {ARMv6K,ARMv7_A,ARMv7_R}) then
        {  when Rd == 15 or Rt == 15 or Rn == 15 or Rd == Rn or Rd == Rt do
              DECODE_UNPREDICTABLE (mc, "StoreExclusiveByte");
           Store (StoreExclusiveByte (Rd, Rt, Rn))
        }
        else
           Skip ()

     -- 32 ~~~~~~~~~~~~~~~~~~~
     -- LDREXB<c> <Rt>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~~
     case '0001110 1 : Rn : Rt : (1111) 1001 (1111)' =>
        if Do (cond, Architecture in set {ARMv6K,ARMv7_A,ARMv7_R}) then
        {  when Rt == 15 or Rn == 15 do
              DECODE_UNPREDICTABLE (mc, "LoadExclusiveByte");
           Load (LoadExclusiveByte (Rt, Rn))
        }
        else
           Skip ()

     -- 33 ~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STREXH<c> <Rd>, <Rt>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0001111 0 : Rn : Rd : (1111) 1001 : Rt' =>
        if Do (cond, Architecture in set {ARMv6K,ARMv7_A,ARMv7_R}) then
        {  when Rd == 15 or Rt == 15 or Rn == 15 or Rd == Rn or Rd == Rt do
              DECODE_UNPREDICTABLE (mc, "StoreExclusiveHalf");
           Store (StoreExclusiveHalf (Rd, Rt, Rn))
        }
        else
           Skip ()

     -- 34 ~~~~~~~~~~~~~~~~~~~
     -- LDREXH<c> <Rt>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~~
     case '0001111 1 : Rn : Rt : (1111) 1001 (1111)' =>
        if Do (cond, Architecture in set {ARMv6K,ARMv7_A,ARMv7_R}) then
        {  when Rt == 15 or Rn == 15 do
              DECODE_UNPREDICTABLE (mc, "LoadExclusiveHalf");
           Load (LoadExclusiveHalf (Rt, Rn))
        }
        else
           Skip ()

     -- 35 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRHT<c> <Rt>, [<Rn>], +/-<Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '000 0 : U : 0 1 0 : Rn : Rt : (0000) 1011 : Rm' =>
        if Do (cond, HaveThumb2()) then
        {  when Rt == 15 or Rn == 15 or Rn == Rt or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "StoreHalfUnprivileged");
           add = U == 1;
           postindex = true;
           m = register_form2 (Rm);
           Store (StoreHalfUnprivileged (add, postindex, Rt, Rn, m))
        }
        else
           Skip ()

     -- 36 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRH<c> <Rt>, [<Rn>, +/-<Rm>]{!}
     -- STRH<c> <Rt>, [<Rn>], +/-<Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '000 : P : U : 0 : W : 0 : Rn : Rt : (0000) 1011 : Rm' =>
        if Do (cond, true) then
        {  wback = P == 0 or W == 1;
           when Rt == 15 or Rm == 15 or wback and (Rn == 15 or Rn == Rt) or
                ArchVersion() < 6 and wback and Rm == Rn do
              DECODE_UNPREDICTABLE (mc, "StoreHalf");
           index = P == 1;
           add = U == 1;
           shift_t, shift_n = SRType_LSL, 0;
           m = register_form1 (Rm, shift_t, shift_n);
           Store (StoreHalf (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 37 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR{S}HT<c> <Rt>, [<Rn>], +/-<Rm>
     -- LDRSBT<c>   <Rt>, [<Rn>], +/-<Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case ('000 0 : U : 0 1 1 : Rn : Rt : (0000) 1 : S : H : 1 : Rm') =>
        if Do (cond, (H <> 0 or S == 1) and HaveThumb2()) then
        {  when Rt == 15 or Rn == 15 or Rn == Rt or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "LoadHalf/Byte (unprivileged)");
           add = U == 1;
           postindex = true;
           unsigned = S == 0;
           m = register_form2 (Rm);
           if H == 1 then
              Load (LoadHalfUnprivileged (unsigned, add, postindex, Rt, Rn, m))
           else
              Load (LoadSignedByteUnprivileged (add, postindex, Rt, Rn, m))
        }
        else
           Skip ()

     -- 38 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR{S}H<c> <Rt>, [<Rn>], +/-<Rm>
     -- LDRSB<c>   <Rt>, [<Rn>], +/-<Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case ('000 : P : U : 0 : W : 1 : Rn :
            Rt : (0000) 1 : S : H : 1 : Rm') =>
        if Do (cond, H <> 0 or S == 1) then
        {  wback = P == 0 or W == 1;
           when Rt == 15 or Rm == 15 or
                ArchVersion() < 6 and wback and Rm == Rn do
              DECODE_UNPREDICTABLE (mc, "LoadHalf/Byte");
           index = P == 1;
           add = U == 1;
           shift_t, shift_n = SRType_LSL, 0;
           unsigned = S == 0;
           m = register_form1 (Rm, shift_t, shift_n);
           if H == 1 then
              Load (LoadHalf (unsigned, add, index, wback, Rt, Rn, m))
           else
              Load (LoadByte (unsigned, add, index, wback, Rt, Rn, m)) -- Signed
        }
        else
           Skip ()

     -- 39 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDRD<c> <Rt>, <Rt2>, [<Rn>, #+/-<Rm>]{!}
     -- LDRD<c> <Rt>, <Rt2>, [<Rn>], #+/-<Rm>
     -- STRD<c> <Rt>, <Rt2>, [<Rn>, #+/-<Rm>]{!}
     -- STRD<c> <Rt>, <Rt2>, [<Rn>], #+/-<Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '000 : P : U : 0 : W : 0 : Rn : Rt : (0000) 11 : S : 1 : Rm' =>
        if Do (cond, HaveDSPSupport()) then
        {  Rt2 = Rt + 1;
           wback = P == 0 or W == 1;
           store = S == 1;
           when Rt<0> or P == 0 and W == 1 or
                Rt2 == 15 or Rm == 15 or
                not store and (Rm == Rt or Rm == Rt2) or
                wback and (Rn == 15 or Rn == Rt or Rn == Rt2) or
                ArchVersion() < 6 and wback and Rm == Rn do
              DECODE_UNPREDICTABLE (mc, "Load/StoreDual (register)");
           index = P == 1;
           add = U == 1;
           m = register_form2 (Rm);
           if store then
              Store (StoreDual (add, index, wback, Rt, Rt2, Rn, m))
           else
              Load (LoadDual (add, index, wback, Rt, Rt2, Rn, m))
        }
        else
           Skip ()

     -- 40 ~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDRD<c> <Rt>, <Rt2>, <label>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '000 (1) : U : 1 (0) 01111 : Rt : imm4H : 1101 : imm4L' =>
        if Do (cond, HaveDSPSupport()) then
        {  Rt2 = Rt + 1;
           when Rt<0> or Rt2 == 15 do
              DECODE_UNPREDICTABLE (mc, "LoadDual (literal)");
           add = U == 1;
           imm32 = ZeroExtend (imm4H : imm4L);
           Load (LoadDualLiteral (add, Rt, Rt2, imm32))
        }
        else
           Skip ()

     -- 41 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDRD<c> <Rt>, <Rt2>, [<Rn>{, #+/-<imm8>}]
     -- LDRD<c> <Rt>, <Rt2>, [<Rn>]{, #+/-<imm8>}
     -- LDRD<c> <Rt>, <Rt2>, [<Rn>, #+/-<imm8>]!
     -- STRD<c> <Rt>, <Rt2>, [<Rn>{, #+/-<imm8>}]
     -- STRD<c> <Rt>, <Rt2>, [<Rn>]{, #+/-<imm8>}
     -- STRD<c> <Rt>, <Rt2>, [<Rn>, #+/-<imm8>]!
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '000 : P : U : 1 : W : 0 : Rn :
           Rt : imm4H : 11 : S : 1 : imm4L' =>
        if Do (cond, HaveDSPSupport()) then
        {  Rt2 = Rt + 1;
           wback = P == 0 or W == 1;
           when Rt<0> or P == 0 and W == 1 or
                wback and (S == '1' and Rn == 15 or Rn == Rt or Rn == Rt2) or
                Rt2 == 15 do
              DECODE_UNPREDICTABLE (mc, "Load/StoreDual (immediate)");
           index = P == 1;
           add = U == 1;
           imm32 = ZeroExtend (imm4H : imm4L);
           m = immediate_form2 (imm32);
           if S == '1' then
              Store (StoreDual (add, index, wback, Rt, Rt2, Rn, m))
           else
              Load (LoadDual (add, index, wback, Rt, Rt2, Rn, m))
        }
        else
           Skip ()

     -- 42 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR{S}HT<c> <Rt>, [<Rn>]{, #+/-<imm8>}
     -- LDRSBT<c>   <Rt>, [<Rn>]{, #+/-<imm8>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case ('000 0 : U : 1 1 1 : Rn :
            Rt : imm4H : 1 : S : H : 1 : imm4L') =>
        if Do (cond, (H <> 0 or S == 1) and HaveThumb2()) then
        {  when Rt == 15 or Rn == 15 or Rn == Rt do
              DECODE_UNPREDICTABLE (mc, "LoadHalf/Byte (unprivileged)");
           postindex = true;
           add = U == 1;
           unsigned = S == 0;
           imm32 = ZeroExtend (imm4H:imm4L);
           m = immediate_form2 (imm32);
           if H == 1 then
              Load (LoadHalfUnprivileged (unsigned, add, postindex, Rt, Rn, m))
           else
              Load (LoadSignedByteUnprivileged (add, postindex, Rt, Rn, m))
        }
        else
           Skip ()

     -- 43 ~~~~~~~~~~~~~~~~~~~~~
     -- LDR{S}H<c> <Rt>, <label>
     -- LDRSB<c>   <Rt>, <label>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~
     case ('000 (1) : U : 1 (0) 1 1111 :
            Rt : imm4H : 1 : S : H : 1 : imm4L') =>
        if Do (cond, H <> 0 or S == 1) then
        {  when Rt == 15 do
              DECODE_UNPREDICTABLE (mc, "LoadHalf/Byte (literal)");
           add = U == 1;
           unsigned = S == 0;
           imm32 = ZeroExtend (imm4H:imm4L);
           if H == 1 then
              Load (LoadHalfLiteral (unsigned, add, Rt, imm32))
           else
              Load (LoadByteLiteral (unsigned, add, Rt, imm32))
        }
        else
           Skip ()

     -- 44 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR{S}H<c> <Rt>, [<Rn>{, #+/-<imm8>}]
     -- LDR{S}H<c> <Rt>, [<Rn>], #+/-<imm8>
     -- LDR{S}H<c> <Rt>, [<Rn>, #+/-<imm8>]!
     -- LDRSB<c> <Rt>, [<Rn>{, #+/-<imm8>}]
     -- LDRSB<c> <Rt>, [<Rn>], #+/-<imm8>
     -- LDRSB<c> <Rt>, [<Rn>, #+/-<imm8>]!
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case ('000 : P : U : 1 : W : 1 : Rn :
            Rt : imm4H : 1 : S : H : 1 : imm4L') =>
        if Do (cond, H <> 0 or S == 1) then
        {  wback = P == 0 or W == 1;
           when Rt == 15 or (wback and Rn == Rt) do
              DECODE_UNPREDICTABLE (mc, "LoadHalf/Byte (immediate)");
           half = H == 1;
           index = P == 1;
           add = U == 1;
           unsigned = S == 0;
           imm32 = ZeroExtend (imm4H:imm4L);
           m = immediate_form1 (imm32);
           if H == 1 then
              Load (LoadHalf (unsigned, add, index, wback, Rt, Rn, m))
           else
              Load (LoadByte (unsigned, add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 45 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRHT<c> <Rt>, [<Rn>]{, #+/-<imm8>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0000 : U : 110 : Rn : Rt : imm4H : 1011 : imm4L' =>
        if Do (cond, HaveThumb2()) then
        {  when Rt == 15 or Rn == 15 or Rn == Rt do
              DECODE_UNPREDICTABLE (mc, "StoreHalf (immediate)");
           add = U == 1;
           postindex = true;
           imm32 = ZeroExtend (imm4H:imm4L);
           m = immediate_form2 (imm32);
           Store (StoreHalfUnprivileged (add, postindex, Rt, Rn, m))
        }
        else
           Skip ()

     -- 46 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRH<c> <Rt>, [<Rn>{, #+/-<imm8>}]
     -- STRH<c> <Rt>, [<Rn>], #+/-<imm8>
     -- STRH<c> <Rt>, [<Rn>, #+/-<imm8>]!
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case ('000 : P : U : 1 : W : 0 : Rn :
            Rt : imm4H : 1011 : imm4L') =>
        if Do (cond, true) then
        {  wback = P == 0 or W == 1;
           when Rt == 15 or (wback and (Rn == 15 or Rn == Rt)) do
              DECODE_UNPREDICTABLE (mc, "StoreHalf (immediate)");
           index = P == 1;
           add = U == 1;
           imm32 = ZeroExtend (imm4H:imm4L);
           m = immediate_form1 (imm32);
           Store (StoreHalf (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 47 ~~~~~~~~~~~~~~~~~~~
     -- MOVT<c> <Rd>, #<imm16>
     -- MOVW<c> <Rd>, #<imm16>
     -- ~~~~~~~~~~~~~~~~~~~~~~
     case '0011 0 : H : 00 : imm4 : Rd : imm12' =>
        if Do (cond, HaveThumb2()) then
        {  when Rd == 15 do
              DECODE_UNPREDICTABLE (mc, "MoveTopHalfword");
           imm16 = imm4:imm12;
           high = H == 1;
           Data (MoveHalfword (high, Rd, imm16))
        }
        else
           Skip ()

     -- 48 ~~
     -- Hints
     -- ~~~~~
     case '00110 0 10 0000 (1111) (0000) : op`8' =>
        DecodeHint (cond, op)

     -- 49 ~~~~~~~~~~~~~~~~~~~~~~~~
     -- MSR<c> <spec_reg>, #<const>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00110 : R : 10 : mask : (1111) : imm12' =>
        if Do (cond, true) then
        {  when mask == 0b0000 do
              DECODE_UNPREDICTABLE (mc, "MoveToSpecialFromImmediate");
           write_spsr = R == 1;
           imm32 = ARMExpandImm (imm12);
           System (MoveToSpecialFromImmediate (write_spsr, imm32, mask))
        }
        else
           Skip ()

     -- 50 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- <opc>{S}<c> <Rd>, <Rn>, #<const>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '00 1 : opc`4 : S : Rn : Rd : imm12' =>
        if Do (cond, true) then
        {  setflags = S == 1;
           match opc
           {  case '11 : N : 1' =>
                Data (Move (setflags, [N], Rd, imm12))
              case '10 : op'  =>
                Data (TestCompareImmediate (op, Rn, imm12))
              case _ =>
                Data (ArithLogicImmediate (opc, setflags, Rd, Rn, imm12))
           }
        }
        else
           Skip ()

     -- 51 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STR{B}T<c> <Rt>, [<Rn>]{, #+/-<imm12>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '010 0 : U : B : 1 0 : Rn : Rt : imm12' =>
        if Do (cond, true) then
        {  when B == 1 and Rt == 15 or Rn == 15 or Rn == Rt do
              DECODE_UNPREDICTABLE (mc, "StoreUnprivileged (immediate)");
           add = U == 1;
           postindex = true;
           imm32 = ZeroExtend (imm12);
           m = immediate_form1 (imm32);
           if B == 1 then
              Store (StoreByteUnprivileged (add, postindex, Rt, Rn, m))
           else
              Store (StoreUnprivileged (add, postindex, Rt, Rn, m))
        }
        else
           Skip ()

     -- 52 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STR{B}<c> <Rt>, [<Rn>{, #+/-<imm12>}]
     -- STR{B}<c> <Rt>, [<Rn>], #+/-<imm12>
     -- STR{B}<c> <Rt>, [<Rn>, #+/-<imm12>]!
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '010 : P : U : B : W : 0 : Rn : Rt : imm12' =>
        if Do (cond, true) then
        {  wback = P == 0 or W == 1;
           when B == 1 and Rt == 15 or wback and (Rn == 15 or Rn == Rt) do
              DECODE_UNPREDICTABLE (mc, "Store (immediate)");
           add = U == 1;
           index = P == 1;
           imm32 = ZeroExtend (imm12);
           m = immediate_form1 (imm32);
           if B == 1 then
              Store (StoreByte (add, index, wback, Rt, Rn, m))
           else
              Store (StoreWord (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 53 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR{B}T<c> <Rt>, [<Rn>]{, #+/-<imm12>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '010 0 : U : B : 1 1 : Rn : Rt : imm12' =>
        if Do (cond, true) then
        {  when Rt == 15 or Rn == 15 or Rn == Rt do
              DECODE_UNPREDICTABLE (mc, "LoadUnprivileged (immediate)");
           add = U == 1;
           postindex = true;
           imm32 = ZeroExtend (imm12);
           m = immediate_form1 (imm32);
           if B == 1 then
              Load (LoadByteUnprivileged (add, postindex, Rt, Rn, m))
           else
              Load (LoadUnprivileged (add, postindex, Rt, Rn, m))
        }
        else
           Skip ()

     -- 54 ~~~~~~~~~~~~~~~~~~~~
     -- LDR{B}<c> <Rt>, <label>
     -- ~~~~~~~~~~~~~~~~~~~~~~~
     case '010 (1) : U : B : (0) 1 1111 : Rt : imm12' =>
        if Do (cond, true) then
        {  when B == 1 and Rt == 15 do
              DECODE_UNPREDICTABLE (mc, "LoadByte (literal)");
           add = U == 1;
           imm32 = ZeroExtend (imm12);
           if B == 1 then
              Load (LoadByteLiteral (true, add, Rt, imm32))
           else
              Load (LoadLiteral (add, Rt, imm32))
        }
        else
           Skip ()

     -- 55 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR{B}<c> <Rt>, [<Rn>{, #+/-<imm12>}]
     -- LDR{B}<c> <Rt>, [<Rn>], #+/-<imm12>
     -- LDR{B}<c> <Rt>, [<Rn>, #+/-<imm12>]!
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '010 : P : U : B : W : 1 : Rn : Rt : imm12' =>
        if Do (cond, true) then
        {  wback = P == 0 or W == 1;
           when B == 1 and Rt == 15 or wback and Rn == Rt do
              DECODE_UNPREDICTABLE (mc, "LoadWord/Byte (immediate)");
           add = U == 1;
           index = P == 1;
           imm32 = ZeroExtend (imm12);
           m = immediate_form1 (imm32);
           if B == 1 then
              Load (LoadByte (true, add, index, wback, Rt, Rn, m))
           else
              Load (LoadWord (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 56 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STR{B}T<c> <Rt>, [<Rn>], +/-<Rm>{, <shift>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '011 0 : U : B : 1 0 : Rn : Rt : imm5 : typ : 0 : Rm' =>
        if Do (cond, true) then
        {  when B == 1 and Rt == 15 or Rn == 15 or Rn == Rt or Rm == 15 or
                ArchVersion() < 6 and Rm == Rn do
              DECODE_UNPREDICTABLE (mc, "StoreUnprivileged (regiser)");
           add = U == 1;
           postindex = true;
           shift_t, shift_n = DecodeImmShift (typ, imm5);
           m = register_form1 (Rm, shift_t, shift_n);
           if B == 1 then
              Store (StoreByteUnprivileged (add, postindex, Rt, Rn, m))
           else
              Store (StoreUnprivileged (add, postindex, Rt, Rn, m))
        }
        else
           Skip ()

     -- 57 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STR{B}<c> <Rt>, [<Rn>, +/-<Rm>{, <shift>}]{!}
     -- STR{B}<c> <Rt>, [<Rn>], +/-<Rm>{, <shift>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '011 : P : U : B : W : 0 : Rn : Rt : imm5 : typ : 0 : Rm' =>
        if Do (cond, true) then
        {  wback = P == 0 or W == 1;
           when B == 1 and Rt == 15 or Rm == 15 or
                wback and (Rn == 15 or Rn == Rt) or
                ArchVersion() < 6 and wback and Rm == Rn do
              DECODE_UNPREDICTABLE (mc, "Store (regiser)");
           add = U == 1;
           index = P == 1;
           shift_t, shift_n = DecodeImmShift (typ, imm5);
           m = register_form1 (Rm, shift_t, shift_n);
           if B == 1 then
              Store (StoreByte (add, index, wback, Rt, Rn, m))
           else
              Store (StoreWord (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 58 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR{B}T<c> <Rt>, [<Rn>], +/-<Rm>{, <shift>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '011 0 : U : B : 1 1 : Rn : Rt : imm5 : typ : 0 : Rm' =>
        if Do (cond, true) then
        {  when Rt == 15 or Rn == 15 or Rn == Rt or Rm == 15 or
                ArchVersion() < 6 and Rm == Rn do
              DECODE_UNPREDICTABLE (mc, "LoadUnprivileged (regiser)");
           add = U == 1;
           postindex = true;
           shift_t, shift_n = DecodeImmShift (typ, imm5);
           m = register_form1 (Rm, shift_t, shift_n);
           if B == 1 then
              Load (LoadByteUnprivileged (add, postindex, Rt, Rn, m))
           else
              Load (LoadUnprivileged (add, postindex, Rt, Rn, m))
        }
        else
           Skip ()

     -- 59 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR{B}<c> <Rt>, [<Rn>, +/-<Rm>{, <shift>}]{!}
     -- LDR{B}<c> <Rt>, [<Rn>], +/-<Rm>{, <shift>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '011 : P : U : B : W : 1 : Rn : Rt : imm5 : typ : 0 : Rm' =>
        if Do (cond, true) then
        {  wback = P == 0 or W == 1;
           when B == 1 and Rt == 15 or Rm == 15 or
                wback and (Rn == 15 or Rn == Rt) or
                ArchVersion() < 6 and wback and Rm == Rn do
              DECODE_UNPREDICTABLE (mc, "LoadWord/Byte (regiser)");
           add = U == 1;
           index = P == 1;
           shift_t, shift_n = DecodeImmShift (typ, imm5);
           m = register_form1 (Rm, shift_t, shift_n);
           if B == 1 then
              Load (LoadByte (true, add, index, wback, Rt, Rn, m))
           else
              Load (LoadWord (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 60 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- Parallel addition and subtraction
     -- <opc><c> <Rd>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01100 : U : op1`2 : Rn : Rd : (1111) : op2`3 : 1 : Rm' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "Parallel addition and subtraction");
           DecodeParallelAdditionSubtraction (op1, op2, U, Rd, Rn, Rm)
        }
        else
           Skip ()

     -- 61 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- PKHBT<c> <Rd>, <Rn>, <Rm>{, LSL #<imm>}
     -- PKHTB<c> <Rd>, <Rn>, <Rm>{, ASR #<imm>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01101000 : Rn : Rd : imm5 : tb : 01 : Rm' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "PackHalfword");
           tbform = tb == 1;
           shift_t, shift_n = DecodeImmShift (tb : 0, imm5);
           Media (PackHalfword (shift_t, shift_n, tbform, Rd, Rn, Rm))
        }
        else
           Skip ()

     -- 62 ~~~~~~~~~~~~~~~~~~~~
     -- SEL<c> <Rd>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~
     case '01101000 : Rn : Rd : (1111) 1011 : Rm' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "SelectBytes");
           Media (SelectBytes (Rd, Rn, Rm))
        }
        else
           Skip ()

     -- 63 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SSAT<c> <Rd>, #<imm>, <Rn>{, <shift>}
     -- USAT<c> <Rd>, #<imm5>, <Rn>{, <shift>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01101: U : 1 : sat_imm`5 : Rd : imm5 : sh : 01 : Rn' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rn == 15 do
              DECODE_UNPREDICTABLE (mc, "Saturate");
           unsigned = U == 1;
           saturate_to = if unsigned then [sat_imm] else [sat_imm] + 0n1;
           shift_t, shift_n = DecodeImmShift (sh:0, imm5);
           Media (Saturate (shift_t, shift_n, saturate_to, unsigned, Rd, Rn))
        }
        else
           Skip ()

     -- 64 ~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SSAT16<c> <Rd>, #<imm>, <Rn>
     -- USAT16<c> <Rd>, #<imm>, <Rn>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01101: U : 10 : sat_imm`4 : Rd : (1111) 0011 : Rn' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rn == 15 do
              DECODE_UNPREDICTABLE (mc, "Saturate16");
           unsigned = U == 1;
           saturate_to = if unsigned then [sat_imm] else [sat_imm] + 0n1;
           Media (Saturate16 (saturate_to, unsigned, Rd, Rn))
        }
        else
           Skip ()

     -- 65 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SXTB16<c>  <Rd>, <Rm>{, <rotation>}
     -- UXTB16<c>  <Rd>, <Rm>{, <rotation>}
     -- SXTAB16<c> <Rd>, <Rn>, <Rm>{, <rotation>}
     -- UXTAB16<c> <Rd>, <Rn>, <Rm>{, <rotation>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01101: U : 00 : Rn : Rd : rotate`2 : (00) 0111 : Rm' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "ExtendByte16");
           unsigned = U == 1;
           rotation = [rotate : '000'];
           Media (ExtendByte16 (unsigned, Rd, Rn, Rm, rotation))
        }
        else
           Skip ()

     -- 66 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SXTB<c>  <Rd>, <Rm>{, <rotation>}
     -- UXTB<c>  <Rd>, <Rm>{, <rotation>}
     -- SXTAB<c> <Rd>, <Rn>, <Rm>{, <rotation>}
     -- UXTAB<c> <Rd>, <Rn>, <Rm>{, <rotation>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01101: U : 10 : Rn : Rd : rotate`2 : (00) 0111 : Rm' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "ExtendByte");
           unsigned = U == 1;
           rotation = [rotate : '000'];
           Media (ExtendByte (unsigned, Rd, Rn, Rm, rotation))
        }
        else
           Skip ()

     -- 67 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SXTH<c>  <Rd>, <Rm>{, <rotation>}
     -- UXTH<c>  <Rd>, <Rm>{, <rotation>}
     -- SXTAH<c> <Rd>, <Rn>, <Rm>{, <rotation>}
     -- UXTAH<c> <Rd>, <Rn>, <Rm>{, <rotation>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01101: U : 11 : Rn : Rd : rotate`2 : (00) 0111 : Rm' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "ExtendHalfword");
           unsigned = U == 1;
           rotation = [rotate : '000'];
           Media (ExtendHalfword (unsigned, Rd, Rn, Rm, rotation))
        }
        else
           Skip ()

     -- 68 ~~~~~~~~~~~~~~
     -- REV<c> <Rd>, <Rm>
     -- ~~~~~~~~~~~~~~~~~
     case '01101 0 11 (1111) : Rd : (1111) 0011 : Rm' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "ByteReverse");
           Media (ByteReverse (Rd, Rm))
        }
        else
           Skip ()

     -- 69 ~~~~~~~~~~~~~~~~
     -- REV16<c> <Rd>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~
     case '01101 0 11 (1111) : Rd : (1111) 1011 : Rm' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "ByteReversePackedHalfword");
           Media (ByteReversePackedHalfword (Rd, Rm))
        }
        else
           Skip ()

     -- 70 ~~~~~~~~~~~~~~~~
     -- REVSH<c> <Rd>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~
     case '01101 1 11 (1111) : Rd : (1111) 1011 : Rm' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "ByteReverseSignedHalfword");
           Media (ByteReverseSignedHalfword (Rd, Rm))
        }
        else
           Skip ()

     -- 71 ~~~~~~~~~~~~~~~
     -- RBIT<c> <Rd>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~
     case '01101 1 11 (1111) : Rd : (1111) 0011 : Rm' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "ReverseBits");
           Media (ReverseBits (Rd, Rm))
        }
        else
           Skip ()

     -- 72 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SMUAD{X}<c> <Rd>, <Rn>, <Rm>
     -- SMUSD{X}<c> <Rd>, <Rn>, <Rm>
     -- SMLAD{X}<c> <Rd>, <Rn>, <Rm>, <Ra>
     -- SMLSD{X}<c> <Rd>, <Rn>, <Rm>, <Ra>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01110000 : Rd : Ra : Rm : 0 : S : M : 1 : Rn' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "SignedMultiplyDual");
           sub = S == 1;
           m_swap = M == 1;
           Multiply (SignedMultiplyDual (sub, m_swap, Rd, Rn, Rm, Ra))
        }
        else
           Skip ()

     -- 73 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SMLALD{X}<c> <RdLo>, <RdHi>, <Rn>, <Rm>
     -- SMLSLD{X}<c> <RdLo>, <RdHi>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01110100 : RdHi : RdLo : Rm : 0 : S : M : 1 : Rn' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when RdLo == 15 or RdHi == 15 or Rn == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "SignedMultiplyLongDual");
           sub = S == 1;
           m_swap = M == 1;
           Multiply (SignedMultiplyLongDual (sub, m_swap, RdHi, RdLo, Rn, Rm))
        }
        else
           Skip ()

     -- 74 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SMMUL{R}<c> <Rd>, <Rn>, <Rm>
     -- SMMLA{R}<c> <Rd>, <Rn>, <Rm>, <Ra>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01110101 : Rd : Ra : Rm : 00  : R : 1 : Rn' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "SignedMostSignificantMultiply");
           round = R == 1;
           Multiply (SignedMostSignificantMultiply (round, Rd, Rn, Rm, Ra))
        }
        else
           Skip ()

     -- 75 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SMMLS{R}<c> <Rd>, <Rn>, <Rm>, <Ra>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01110101 : Rd : Ra : Rm : 11 : R : 1 : Rn' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 or Ra == 15 do
              DECODE_UNPREDICTABLE
                (mc, "SignedMostSignificantMultiplySubtract");
           round = R == 1;
           Multiply
             (SignedMostSignificantMultiplySubtract (round, Rd, Rn, Rm, Ra))
        }
        else
           Skip ()

     -- 76 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- USAD8<c>  <Rd>, <Rn>, <Rm>
     -- USADA8<c> <Rd>, <Rn>, <Rm>, <Ra>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01111000 : Rd : Ra : Rm : 0001 : Rn' =>
        if Do (cond, ArchVersion() >= 6) then
        {  when Rd == 15 or Rn == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "UnsignedSumAbsoluteDifferences");
           SIMD (UnsignedSumAbsoluteDifferences (Rd, Rn, Rm, Ra))
        }
        else
           Skip ()

     -- 77 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SBFX<c> <Rd>, <Rn>, #<lsb>, #<width>
     -- UBFX<c> <Rd>, <Rn>, #<lsb>, #<width>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '01111 : U : 1 : widthm1`5 : Rd : lsb : 101 : Rn' =>
        if Do (cond, ArchVersion() >= 6) then
        {  lsbit = [lsb];
           widthminus1 = [widthm1];
           when Rd == 15 or Rn == 15 or 0n31 < lsbit + widthminus1 do
              DECODE_UNPREDICTABLE (mc, "BitFieldExtract");
           unsigned = U == 1;
           Media (BitFieldExtract (unsigned, Rd, Rn, lsbit, widthminus1))
        }
        else
           Skip ()

     -- 78 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- BFC<c> <Rd>, #<lsb>, #<width>
     -- BFI<c> <Rd>, <Rn>, #<lsb>, #<width>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0111110 : msb`5 : Rd : lsb : 001 : Rn' =>
        if Do (cond, ArchVersion() >= 6) then
        {  lsbit = [lsb]::nat;
           msbit = [msb];
           when Rd == 15 or msbit < lsbit do
              DECODE_UNPREDICTABLE (mc, "BitFieldClearOrInsert");
           Media (BitFieldClearOrInsert (Rd, Rn, lsbit, msbit))
        }
        else
           Skip ()

     -- 79 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STM{<amode>}<c> <Rn>, <registers>^
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '100 : P : U : 1 (0) 0 : Rn : registers`16' =>
        if Do (cond, true) then
        {  when Rn == 15 or BitCount (registers) < 1 do
              DECODE_UNPREDICTABLE (mc, "StoreMultipleUserRegisters");
           increment = U == 1;
           wordhigher = P == U;
           Store
             (StoreMultipleUserRegisters (increment, wordhigher, Rn, registers))
        }
        else
           Skip ()

     -- 80 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STM{<amode>}<c> <Rn>{!}, <registers>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '100 : P : U : 0 : W : 0 : Rn : registers`16' =>
        if Do (cond, true) then
        {  when Rn == 15 or BitCount (registers) < 1 do
              DECODE_UNPREDICTABLE (mc, "StoreMultiple");
           index = P == 1;
           increment = U == 1;
           wback = W == 1;
           Store (StoreMultiple (increment, index, wback, Rn, registers))
        }
        else
           Skip ()

     -- 81 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDM{<amode>}<c> <Rn>, <registers_without_pc>^
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '100 : P : U : 1 (0) 1 : Rn : 0 : registers`15' =>
        if Do (cond, true) then
        {  when Rn == 15 or BitCount (registers) < 1 do
              DECODE_UNPREDICTABLE (mc, "LoadMultipleUserRegisters");
           increment = U == 1;
           wordhigher = P == U;
           Load
              (LoadMultipleUserRegisters (increment, wordhigher, Rn, registers))
        }
        else
           Skip ()

     -- 82 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDM{<amode>}<c> <Rn>{!}, <registers_with_pc>^
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '100 : P : U : 1 : W : 1 : Rn : 1 : registers`15' =>
        if Do (cond, true) then
        {  wback = W == 1;
           when Rn == 15 or wback and registers<[Rn]> and ArchVersion() >= 7 do
              DECODE_UNPREDICTABLE (mc, "LoadMultipleExceptionReturn");
           increment = U == 1;
           wordhigher = P == U;
           Load
             (LoadMultipleExceptionReturn
                (increment, wordhigher, wback, Rn, registers))
        }
        else
           Skip ()

     -- 83 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDM{<amode>}<c> <Rn>{!}, <registers>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '100 : P : U : 0 : W : 1 : Rn : registers`16' =>
        if Do (cond, true) then
        {  wback = W == 1;
           when Rn == 15 or BitCount (registers) < 1 or
                wback and registers<[Rn]> and ArchVersion() >= 7 do
              DECODE_UNPREDICTABLE (mc, "LoadMultiple");
           index = P == 1;
           increment = U == 1;
           Load (LoadMultiple (increment, index, wback, Rn, registers))
        }
        else
           Skip ()

     -- 84 ~~~~~~~~~
     -- B<c> <label>
     -- ~~~~~~~~~~~~
     case '1010 : imm24' =>
        if Do (cond, true) then
        {  imm32 = SignExtend (imm24 : '00');
           Branch (BranchTarget (imm32))
        }
        else
           Skip ()

     -- 85 ~~~~~~~~~~
     -- BL<c> <label>
     -- ~~~~~~~~~~~~~
     case '1011 : imm24' =>
        if Do (cond, true) then
        {  imm32 = SignExtend (imm24 : '00');
           targetInstrSet = InstrSet_ARM;
           Branch (BranchLinkExchangeImmediate (targetInstrSet, imm32))
        }
        else
           Skip ()

     -- 86 ~~~~~~~~~~~~
     -- SVC<c> {#}<imm>
     -- ~~~~~~~~~~~~~~~
     case '1111 : imm24' =>
        if Do (cond, true) then
        {  imm32 = SignExtend (imm24);
           System (SupervisorCall (imm32))
        }
        else
           Skip ()

     -- 87 ~~
     -- VFP
     -- ~~~~~
     case '11 _ 101 _`9' =>
        if Do (cond, Extension_VFP in Extensions) then
           VFP (DecodeVFP (w))
        else
           Skip ()

     -- 88 ~~~~~~~~~~~~
     -- Everything else
     -- ~~~~~~~~~~~~~~~

     case _ => UndefinedARM (cond)
   }
}

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 16-bit Thumb Decoder
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

instruction DecodeThumb (h::half) =
{  mc = Thumb (h);
   match h
   {
     -- 1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- ADDS   <Rd>, <Rn>, <Rm>   (Outside IT block)
     -- ADD<c> <Rd>, <Rn>, <Rm>   (Inside IT block)
     -- SUBS   <Rd>, <Rn>, <Rm>   (Outside IT block)
     -- SUB<c> <Rd>, <Rn>, <Rm>   (Inside IT block)
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '000 11 0 : S : Rm`3 : Rn`3 : Rd`3' =>
        if Do (ThumbCondition(), true) then
        {  d = [Rd];
           n = [Rn];
           m = [Rm];
           setflags = not InITBlock();
           shift_t, shift_n = SRType_LSL, 0;
           opc = if S == 1 then 0b0010 else 0b0100;
           Data (Register (opc, setflags, d, n, m, shift_t, shift_n))
        }
        else
           Skip ()

     -- 2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- ADDS   <Rd>, <Rn>, #<imm3>  (Outside IT block)
     -- ADD<c> <Rd>, <Rn>, #<imm3>  (Inside IT block)
     -- SUBS   <Rd>, <Rn>, #<imm3>  (Outside IT block)
     -- SUB<c> <Rd>, <Rn>, #<imm3>  (Inside IT block)
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '000 11 1 : S : imm3 : Rn`3 : Rd`3' =>
        if Do (ThumbCondition(), true) then
        {  d = [Rd];
           n = [Rn];
           setflags = not InITBlock();
           imm12 = ZeroExtend (imm3);
           opc = if S == 1 then 0b0010 else 0b0100;
           Data (ArithLogicImmediate (opc, setflags, d, n, imm12))
        }
        else
           Skip ()

     -- 3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- <opc>S   <Rd>, <Rm>, #<imm5>   (Outside IT block)
     -- <opc><c> <Rd>, <Rm>, #<imm5>   (Inside IT block)
     -- where <opc> in {LSL,LSR,ASR}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '000 : opc`2 : imm5 : Rm`3 : Rd`3' =>
        if Do (ThumbCondition(), true) then
        {  d = [Rd];
           m = [Rm];
           setflags = not InITBlock();
           shift_t, shift_n = DecodeImmShift (opc, imm5);
           Data (ShiftImmediate (false, setflags, d, m, shift_t, shift_n))
        }
        else
           Skip ()

     -- 4 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- MOVS   <Rd>, #<imm8>  (Outside IT block)
     -- MOV<c> <Rd>, #<imm8>  (Inside IT block)
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '001 00 : Rd`3 : imm8' =>
        if Do (ThumbCondition(), true) then
        {  d = [Rd];
           imm12 = ZeroExtend (imm8);
           setflags = not InITBlock();
           negate = false;
           Data (Move (setflags, negate, d, imm12))
        }
        else
           Skip ()

     -- 5 ~~~~~~~~~~~~~~~~~~
     -- CMP<c> <Rn>, #<imm8>
     -- ~~~~~~~~~~~~~~~~~~~~
     case '001 01 : Rn`3 : imm8' =>
        if Do (ThumbCondition(), true) then
        {  n = [Rn];
           imm12 = ZeroExtend (imm8);
           Data (TestCompareImmediate ('10', n, imm12))
        }
        else
           Skip ()

     -- 6 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- ADDS   <Rdn>, #<imm8>  (Outside IT block)
     -- ADD<c> <Rdn>, #<imm8>  (Inside IT block)
     -- SUBS   <Rdn>, #<imm8>  (Outside IT block)
     -- SUB<c> <Rdn>, #<imm8>  (Inside IT block)
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '001 1 : S : Rdn : imm8' =>
        if Do (ThumbCondition(), true) then
        {  d = [Rdn];
           n = d;
           setflags = not InITBlock();
           imm12 = ZeroExtend (imm8);
           opc = if S == 1 then 0b0010 else 0b0100;
           Data (ArithLogicImmediate (opc, setflags, d, n, imm12))
        }
        else
           Skip ()

     -- 7 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- <opc>S   <Rdn>, <Rm>        (Outside IT block)
     -- <opc><c> <Rdn>, <Rm>        (Inside IT block)
     -- where <opc> in AND, EOR, ADC, SBC, ORR, BIC, LSL, LSR, ASR, ROR
     --
     -- <opc>S   <Rn>, <Rm>
     -- <opc><c> <Rn>, <Rm>
     -- where <opc> in TST, CMP, CMN
     --
     -- RSBS     <Rd>, <Rn>, #0     (Outside IT block)
     -- RSB<c>   <Rd>, <Rn>, #0     (Inside IT block)
     -- MULS     <Rdm>, <Rm>        (Outside IT block)
     -- MUL<c>   <Rdm>, <Rm>        (Inside IT block)
     -- MVNS     <Rd>, <Rm>         (Outside IT block)
     -- MVN<c>   <Rd>, <Rm>         (Inside IT block)
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '010000 : opc`4 : Rx`3 : Ry`3' =>
        if Do (ThumbCondition(), true) then
           match opc
           { case '0000' or '0001' or '0101' or '0110' or '1100' or '1110' =>
             -- AND, EOR, ADC, SBC, ORR, BIC
               {  d = [Ry];
                  n = d;
                  m = [Rx];
                  setflags = not InITBlock();
                  shift_t, shift_n = SRType_LSL, 0;
                  Data (Register (opc, setflags, d, n, m, shift_t, shift_n))
               }
             case '0010' or '0011' or '0100' =>
             -- LSL, LSR, ASR
               {  d = [Ry];
                  n = d;
                  m = [Rx];
                  setflags = not InITBlock();
                  shift_t = DecodeRegShift ([opc - 2]);
                  Data (ShiftRegister (false, setflags, d, n, shift_t, m))
               }
             case '0111' =>
             -- ROR
               {  d = [Ry];
                  n = d;
                  m = [Rx];
                  setflags = not InITBlock();
                  Data (ShiftRegister (false, setflags, d, n, SRType_ROR, m))
               }
             case '1000' or '1010' or '1011' =>
             -- TST, CMP, CMN
               {  n = [Ry];
                  m = [Rx];
                  setflags = true;
                  shift_t, shift_n = SRType_LSL, 0;
                  Data (TestCompareRegister (opc<1:0>, n, m, shift_t, shift_n))
               }
             case '1001' =>
             -- RSB
               {  d = [Ry];
                  n = [Rx];
                  setflags = not InITBlock();
                  Data (ArithLogicImmediate (0b0011, setflags, d, n, 0))
               }
             case '1101' =>
             -- MUL
               {  d = [Ry];
                  n = [Rx];
                  when ArchVersion() < 6 and d == n do
                     DECODE_UNPREDICTABLE (mc, "Multiply");
                  m = d;
                  setflags = not InITBlock();
                  Multiply (Multiply32 (setflags, d, n, m))
               }
             case '1111' =>
             -- MVN
               {  d = [Ry];
                  m = [Rx];
                  setflags = not InITBlock();
                  shift_t, shift_n = SRType_LSL, 0;
                  Data (ShiftImmediate (true, setflags, d, m, shift_t, shift_n))
               }
           }
        else
           Skip ()

     -- 8 ~~~~~~~~~~~~~~~~
     -- ADD<c> <Rdn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~
     case '010001 00 : DN : Rm : Rdn' =>
        if Do (ThumbCondition(), Msb (Rm) or DN == 1 or HaveThumb2()) then
        {  d = DN : Rdn;
           n = d;
           when n == 15 and Rm == 15 or
                d == 15 and InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "ADD");
           setflags = false;
           shift_t, shift_n = SRType_LSL, 0;
           Data (Register (0b0100, setflags, d, n, Rm, shift_t, shift_n))
        }
        else
           Skip ()

     -- 9 ~~~~~~~~~~~
     -- Unpredictable
     -- ~~~~~~~~~~~~~
     case '010001 0100 _`6' =>
        #UNPREDICTABLE("Thumb: 010001 0100 _")

     -- 10 ~~~~~~~~~~~~~~
     -- CMP<c> <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~
     case '010001 01 : N : Rm : Rn`3' =>
        if Do (ThumbCondition(), true) then
        {  n = N : Rn;
           when n <+ 8 and Rm <+ 8 or n == 15 or Rm == 15 do
              DECODE_UNPREDICTABLE (mc, "CMP");
           Data (TestCompareRegister ('10', n, Rm, SRType_LSL, 0))
        }
        else
           Skip ()

     -- 11 ~~~~~~~~~~~~~~~
     -- MOV<c> <Rd>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~
     case '010001 10 : D : Rm : Rd`3' =>
        if Do (ThumbCondition(),
                 Msb (Rm) or D == 1 or ArchVersion() >= 6) then
        {  d = D : Rd;
           when d == 15 and InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "MOV");
           setflags = false;
           shift_t, shift_n = SRType_LSL, 0;
           Data (ShiftImmediate (false, setflags, d, Rm, shift_t, shift_n))
        }
        else
           Skip ()

     -- 12 ~~~~~~~~
     -- BX<c> <Rm>
     -- ~~~~~~~~~~~
     case '010001 11 0 : Rm : (000)' =>
        if Do (ThumbCondition(), true) then
        {  when InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "BranchExchange");
           Branch (BranchExchange (Rm))
        }
        else
           Skip ()

     -- 13 ~~~~~~~~
     -- BLX<c> <Rm>
     -- ~~~~~~~~~~~
     case '010001 11 1 : Rm : (000)' =>
        if Do (ThumbCondition(), ArchVersion() >= 5) then
        {  when Rm == 15 or InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "BranchLinkExchangeRegister");
           Branch (BranchLinkExchangeRegister (Rm))
        }
        else
           Skip ()

     -- 14 ~~~~~~~~~~~~~~~~~
     -- LDR<c> <Rt>, <label>
     -- ~~~~~~~~~~~~~~~~~~~~
     case '01001 : Rt`3 : imm8' =>
        if Do (ThumbCondition(), true) then
        {  add = true;
           imm32 = ZeroExtend (imm8 : '00');
           Load (LoadLiteral (add, [Rt], imm32))
        }
        else
           Skip ()

     -- 15 ~~~~~~~~~~~~~~~~~~~~~~~~
     -- STR<c>   <Rt>, [<Rn>, <Rm>]
     -- STRH<c>  <Rt>, [<Rn>, <Rm>]
     -- STRB<c>  <Rt>, [<Rn>, <Rm>]
     -- LDRSB<c> <Rt>, [<Rn>, <Rm>]
     -- LDR<c>   <Rt>, [<Rn>, <Rm>]
     -- LDRH<c>  <Rt>, [<Rn>, <Rm>]
     -- LDRB<c>  <Rt>, [<Rn>, <Rm>]
     -- LDRSH<c> <Rt>, [<Rn>, <Rm>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0101 : opc`3 : Rm`3 : Rn`3 : Rt`3' =>
        if Do (ThumbCondition(), true) then
        {  index = true;
           add = true;
           wback = false;
           shift_t, shift_n = SRType_LSL, 0;
           m = register_form1 ([Rm], shift_t, shift_n);
           match opc
           { case '000' => Store (StoreWord (add, index, wback, [Rt], [Rn], m))
             case '001' => Store (StoreHalf (add, index, wback, [Rt], [Rn], m))
             case '010' => Store (StoreByte (add, index, wback, [Rt], [Rn], m))
             case '011' =>
                Load (LoadByte (false, add, index, wback, [Rt], [Rn], m))
             case '100' =>
                Load (LoadWord (add, index, wback, [Rt], [Rn], m))
             case '101' =>
                Load (LoadHalf (true, add, index, wback, [Rt], [Rn], m))
             case '110' =>
                Load (LoadByte (true, add, index, wback, [Rt], [Rn], m))
             case '111' =>
                Load (LoadHalf (false, add, index, wback, [Rt], [Rn], m))
           }
        }
        else
           Skip ()

     -- 16 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STR<c> <Rt>, [<Rn>{, #<imm>}]
     -- LDR<c> <Rt>, [<Rn>{, #<imm>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0110 : L : imm5 : Rn`3 : Rt`3' =>
        if Do (ThumbCondition(), true) then
        {  index = true;
           add = true;
           wback = false;
           imm32 = ZeroExtend (imm5 : '00');
           m = immediate_form1 (imm32);
           if L == 1 then
              Load (LoadWord (add, index, wback, [Rt], [Rn], m))
           else
              Store (StoreWord (add, index, wback, [Rt], [Rn], m))
        }
        else
           Skip ()

     -- 17 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRB<c> <Rt>, [<Rn>{, #<imm>}]
     -- LDRB<c> <Rt>, [<Rn>{, #<imm>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0111 : L : imm5 : Rn`3 : Rt`3' =>
        if Do (ThumbCondition(), true) then
        {  index = true;
           add = true;
           wback = false;
           imm32 = ZeroExtend (imm5);
           m = immediate_form1 (imm32);
           if L == 1 then
              Load (LoadByte (true, add, index, wback, [Rt], [Rn], m))
           else
              Store (StoreByte (add, index, wback, [Rt], [Rn], m))
        }
        else
           Skip ()

     -- 18 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRH<c> <Rt>, [<Rn>{, #<imm>}]
     -- LDRH<c> <Rt>, [<Rn>{, #<imm>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1000 : L : imm5 : Rn`3 : Rt`3' =>
        if Do (ThumbCondition(), true) then
        {  index = true;
           add = true;
           wback = false;
           imm32 = ZeroExtend (imm5 : '0');
           m = immediate_form1 (imm32);
           if L == 1 then
              Load (LoadHalf (true, add, index, wback, [Rt], [Rn], m))
           else
              Store (StoreHalf (add, index, wback, [Rt], [Rn], m))
        }
        else
           Skip ()

     -- 19 ~~~~~~~~~~~~~~~~~~~~~~
     -- STR<c> <Rt>, [SP, #<imm>]
     -- LDR<c> <Rt>, [SP, #<imm>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1001 : L : Rt`3 : imm8' =>
        if Do (ThumbCondition(), true) then
        {  index = true;
           add = true;
           wback = false;
           imm32 = ZeroExtend (imm8 : '00');
           m = immediate_form1 (imm32);
           if L == 1 then
              Load (LoadWord (add, index, wback, [Rt], 13, m))
           else
              Store (StoreWord (add, index, wback, [Rt], 13, m))
        }
        else
           Skip ()

     -- 20 ~~~~~~~~~~~~~~~~~~~~
     -- ADR<c> <Rd>, <label>
     -- ADD<c> <Rd>, SP, #<imm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~
     case '1010 : S : Rd`3 : imm8' =>
        if Do (ThumbCondition(), true) then
        {  imm12 = '1111' : imm8;
           Rn = if S == 1 then 13 else 15;
           Data (ArithLogicImmediate (0b0100, false, [Rd], Rn, imm12))
        }
        else
           Skip ()

     -- 21 ~~~~~~~~~~~~~~~~~~
     -- ADD<c> SP, SP, #<imm>
     -- SUB<c> SP, SP, #<imm>
     -- ~~~~~~~~~~~~~~~~~~~~~
     case '1011 0000 : S : imm7' =>
        if Do (ThumbCondition(), true) then
        {  imm12 = '11110' : imm7;
           opc = if S == 1 then 0b0010 else 0b0100;
           Data (ArithLogicImmediate (opc, false, 13, 13, imm12))
        }
        else
           Skip ()

     -- 22 ~~~~~~~~~~~~~~~~~
     -- CB{N}Z <Rn>, <label>
     -- ~~~~~~~~~~~~~~~~~~~~
     case '1011 : op`1 : 0 : i`1 : 1 : imm5 : Rn`3' =>
        if Do (0b1110, HaveThumb2()) then
        {  when InITBlock() do
              DECODE_UNPREDICTABLE (mc, "CompareBranch");
           imm32 = ZeroExtend (i : imm5 : '0');
           nonzero = op == 1;
           Branch (CompareBranch (nonzero, [Rn], imm32))
        }
        else
           Skip ()

     -- 23 ~~~~~~~~~~~~~~~
     -- SXTH<c> <Rd>, <Rm>
     -- UXTH<c> <Rd>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~
     case '1011 0010 : U : 0 : Rm`3 : Rd`3' =>
        if Do (ThumbCondition(), ArchVersion() >= 6) then
        {  unsigned = U == 1;
           Media (ExtendHalfword (unsigned, [Rd], 15, [Rm], 0))
        }
        else
           Skip ()

     -- 24 ~~~~~~~~~~~~~~~
     -- SXTB<c> <Rd>, <Rm>
     -- UXTB<c> <Rd>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~
     case '1011 0010 : U : 1 : Rm`3 : Rd`3' =>
        if Do (ThumbCondition(), ArchVersion() >= 6) then
        {  unsigned = U == 1;
           Media (ExtendByte (unsigned, [Rd], 15, [Rm], 0))
        }
        else
           Skip ()

     -- 25 ~~~~~~~~~~~~~~~~
     -- PUSH<c> <registers>
     -- ~~~~~~~~~~~~~~~~~~~
     case '1011 010 : M : register_list`8' =>
        if Do (ThumbCondition(), true) then
        {  registers = '0' : M : '000000' : register_list;
           when BitCount (registers) < 1 do
              DECODE_UNPREDICTABLE (mc, "StoreMultiple");
           increment = false;
           index = true;
           wback = true;
           Store (StoreMultiple (increment, index, wback, 13, registers))
        }
        else
           Skip ()

     -- 26 ~~~~~~~~~~~~~~~~~~~~~~
     -- SETEND <endian_specifier>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1011 0110 010 (1) : E : (000)' =>
        if Do (0b1110, ArchVersion() >= 6) then
        {  when InITBlock() do
              DECODE_UNPREDICTABLE (mc, "Setend");
           set_bigend = E == 1;
           System (Setend (set_bigend))
        }
        else
           Skip ()

     -- 27 ~~~~~~~~~~~~~~~~~
     -- CPS<effect> <iflags>
     -- ~~~~~~~~~~~~~~~~~~~~
     case '1011 0110 011 : im`1 : (0) : A : I : F' =>
        if Do (0b1110, ArchVersion() >= 6) then
        {  when A : I : F == 000 or InITBlock() do
              DECODE_UNPREDICTABLE (mc, "ChangeProcessorState");
           enable = im == 0;
           affectA = A == 1;
           affectI = I == 1;
           affectF = F == 1;
           System (ChangeProcessorState
                     (enable, not enable, affectA, affectI, affectF, None))
        }
        else
           Skip ()

     -- 28 ~~~~~~~~~~~~~~~~
     -- REV<c>   <Rd>, <Rn>
     -- REV16<c> <Rd>, <Rn>
     -- REVSH<c> <Rd>, <Rn>
     -- ~~~~~~~~~~~~~~~~~~~
     case '1011 1010 : opc`2 : Rm`3 : Rd`3' =>
        if Do (ThumbCondition(), ArchVersion() >= 6) then
           match opc
           { case '00' => Media (ByteReverse ([Rd], [Rm]))
             case '01' => Media (ByteReversePackedHalfword ([Rd], [Rm]))
             case '11' => Media (ByteReverseSignedHalfword ([Rd], [Rm]))
             case _    => Undefined (0)
           }
        else
           Skip ()

     -- 29 ~~~~~~~~~~~~~~~
     -- POP<c> <registers>
     -- ~~~~~~~~~~~~~~~~~~
     case '1011 110 : P : register_list`8' =>
        if Do (ThumbCondition(), true) then
        {  registers = P : '0000000' : register_list;
           when BitCount (registers) < 1 or
                registers<15> and InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "LoadMultiple");
           increment = true;
           index = false;
           wback = true;
           Load (LoadMultiple (increment, index, wback, 13, registers))
        }
        else
           Skip ()

     -- 30 ~~~~~~~~
     -- BKPT #<imm>
     -- ~~~~~~~~~~~
     case '1011 1110 : imm8' =>
        if Do (0b1110, ArchVersion() >= 5) then
        {  imm32 = ZeroExtend (imm8);
           Hint (Breakpoint (imm32))
        }
        else
           Skip ()

     -- 31 ~~~~~
     -- NOP<c>
     -- YIELD<c>
     -- WFE<c>
     -- WFI<c>
     -- SEV<c>
     -- ~~~~~~~~
     case '1011 1111 : op`4 : 0000' =>
        DecodeHint (ThumbCondition(), ZeroExtend (op))

     -- 31 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- IT{<x>{<y>{<z>}}} <firstcond>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1011 1111 : firstcond`4 : mask' =>
        if Do (0b1110, HaveThumb2()) then
        {  when firstcond == 0b1111 or
                firstcond == 0b1110 and BitCount (mask) != 1 or
                InITBlock() do
              DECODE_UNPREDICTABLE (mc, "IfThen");
           IfThen (firstcond, mask)
        }
        else
           Skip ()

     -- 33 ~~~~~~~~~~~~~~~~~~~~~~
     -- STM<c> <Rn>!, <registers>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1100 0 : Rn`3 : register_list`8' =>
        if Do (ThumbCondition(), true) then
        {  registers = [register_list];
           when BitCount (registers) < 1 do
              DECODE_UNPREDICTABLE (mc, "StoreMultiple");
           increment = true;
           index = false;
           wback = true;
           Store (StoreMultiple (increment, index, wback, [Rn], registers))
        }
        else
           Skip ()

     -- 34 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDM<c> <Rn>!, <registers>  (<Rn> not included in <registers>)
     -- LDM<c> <Rn>, <registers>   (<Rn> included in <registers>)
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1100 1 : Rn`3 : register_list`8' =>
        if Do (ThumbCondition(), true) then
        {  registers = [register_list];
           when BitCount (registers) < 1 do
              DECODE_UNPREDICTABLE (mc, "LoadMultiple");
           increment = true;
           index = false;
           wback = not registers<[Rn]>;
           Load (LoadMultiple (increment, index, wback, [Rn], registers))
        }
        else
           Skip ()

     -- 35 ~~~~~~~~~~~
     -- UDF<c> #<imm8>
     -- ~~~~~~~~~~~~~~
     case '1101 1110 : imm8' =>
        if Do (ThumbCondition(), true) then
        {  imm32 = ZeroExtend (imm8);
           Undefined (imm32)
        }
        else
           Skip ()

     -- 36 ~~~~~~~~~~~~~
     -- SVC<c> {#}<imm>
     -- ~~~~~~~~~~~~~~~~
     case '1101 1111 : imm8' =>
        if Do (ThumbCondition(), true) then
           System (SupervisorCall (ZeroExtend (imm8)))
        else
           Skip ()

     -- 37 ~~~~~~~~~
     -- B<c> <label>
     -- ~~~~~~~~~~~~
     case '1101 : cond : imm8' =>
        if Do (cond, true) then
        {  when InITBlock() do
              DECODE_UNPREDICTABLE (mc, "BranchTarget");
           imm32 = SignExtend (imm8 : '0');
           Branch (BranchTarget (imm32))
        }
        else
           Skip ()

     -- 38 ~~~~~~~~~
     -- B<c> <label>
     -- ~~~~~~~~~~~~
     case '11100 : imm11' =>
        if Do (ThumbCondition(), true) then
        {  when InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "BranchTarget");
           imm32 = SignExtend (imm11 : '0');
           Branch (BranchTarget (imm32))
        }
        else
           Skip ()

     -- 39 ~~~~~~~~~~~~
     -- Everything else
     -- ~~~~~~~~~~~~~~~

     case _ => UndefinedThumb()
   }
}

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 16-bit ThumbEE Decoder
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

instruction DecodeThumbEE (h::half) =
{  mc = Thumb (h);
   match h
   {
     -- 1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STR<c>   <Rt>, [<Rn>, <Rm>, LSL #2]
     -- STRH<c>  <Rt>, [<Rn>, <Rm>, LSL #1]
     -- LDR<c>   <Rt>, [<Rn>, <Rm>, LSL #2]
     -- LDRH<c>  <Rt>, [<Rn>, <Rm>, LSL #1]
     -- LDRSH<c> <Rt>, [<Rn>, <Rm>, LSL #1]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '0101 : opc`3 : Rm`3 : Rn`3 : Rt`3' =>
        if Do (ThumbCondition(), true) then
        {  index = true;
           add = true;
           wback = false;
           m = [Rm];
           m1 = register_form1 (m, SRType_LSL, 1);
           m2 = register_form1 (m, SRType_LSL, 2);
           match opc
           { case '000' => Store (StoreWord (add, index, wback, [Rt], [Rn], m2))
             case '001' => Store (StoreHalf (add, index, wback, [Rt], [Rn], m1))
             case '100' =>
                Load (LoadWord (add, index, wback, [Rt], [Rn], m2))
             case '101' =>
                Load (LoadHalf (true, add, index, wback, [Rt], [Rn], m1))
             case '111' =>
                Load (LoadHalf (false, add, index, wback, [Rt], [Rn], m1))
             case _ => DecodeThumb (h)
           }
        }
        else
           Skip ()

     -- 2 ~~~~~~~~~~~~~~~~~~~~~~~~~
     -- HBP<c> #<imm>, #<HandlerID>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1100 0000 : imm3 : handler`5' =>
        if Do (ThumbCondition(), true) then
        {  when InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "HandlerBranchParameter");
           imm32 = ZeroExtend (imm3);
           handler_offset = ZeroExtend (handler : '00000');
           Branch (HandlerBranchParameter (imm32, handler_offset))
        }
        else
           Skip ()

     -- 3 ~~~~~~~
     -- Undefined
     -- ~~~~~~~~~
     case '1100 0001 _' =>
        Undefined (0)

     -- 4 ~~~~~~~~~~~~~~~~~~~
     -- HB{L}<c> #<HandlerID>
     -- ~~~~~~~~~~~~~~~~~~~~~
     case '1100 001 : L : handler`8' =>
        if Do (ThumbCondition(), true) then
        {  when InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "HandlerBranchLink");
           generate_link = L == 1;
           handler_offset = ZeroExtend (handler : '00000');
           Branch (HandlerBranchLink (generate_link, handler_offset))
        }
        else
           Skip ()

     -- 5 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- HBLP<c> #<imm>, #<HandlerID>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1100 01 : imm5 : handler`5' =>
        if Do (ThumbCondition(), true) then
        {  when InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "HandlerBranchLinkParameter");
           imm32 = ZeroExtend (imm5);
           handler_offset = ZeroExtend (handler : '00000');
           Branch (HandlerBranchLinkParameter (imm32, handler_offset))
        }
        else
           Skip ()

     -- 6 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR<c> <Rt>, [<Rn>{, #-<imm>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1100 100 : imm3 : Rn`3 : Rt`3' =>
        if Do (ThumbCondition(), true) then
        {  index = true;
           add = false;
           wback = false;
           imm32 = ZeroExtend (imm3 : '00');
           m = immediate_form1 (imm32);
           Load (LoadWord (add, index, wback, [Rt], [Rn], m))
        }
        else
           Skip ()

     -- 7 ~~~~~~~~~~~~~~~~
     -- CHKA<c> <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~
     case '1100 1010 : N : Rm : Rn`3' =>
        if Do (ThumbCondition(), true) then
        {  n = N : Rn;
           when n == 15 or Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "CheckArray");
           Branch (CheckArray (Rm, n))
        }
        else
           Skip ()

     -- 8 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR<c> <Rt>, [R10{, #-<imm>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1100 1011 : imm5 : Rt`3' =>
        if Do (ThumbCondition(), true) then
        {  index = true;
           add = true;
           wback = false;
           imm32 = ZeroExtend (imm5 : '00');
           m = immediate_form1 (imm32);
           Load (LoadWord (add, index, wback, [Rt], 10, m))
        }
        else
           Skip ()

     -- 9 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR<c> <Rt>, [R9{, #-<imm>}]
     -- STR<c> <Rt>, [R9{, #-<imm>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1100 11 : S : imm6 : Rt`3' =>
        if Do (ThumbCondition(), true) then
        {  index = true;
           add = true;
           wback = false;
           imm32 = ZeroExtend (imm6 : '00');
           m = immediate_form1 (imm32);
           if S == 1 then
              Store (StoreWord (add, index, wback, [Rt], 9, m))
           else
              Load (LoadWord (add, index, wback, [Rt], 9, m))
        }
        else
           Skip ()

     -- 10 ~~~~~~~~~~~~~~~~~~~~~
     -- ThumbEE reverts to Thumb
     -- ~~~~~~~~~~~~~~~~~~~~~~~~
     case ireg => DecodeThumb (ireg)

   }
}

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 2 * 16-bit Thumb-2 Decoder
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

instruction DecodeThumb2 (h::half * half) =
{  mc = Thumb2 (h);
   match h
   {
     -- 1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STM<c>.W <Rn>{!}, <registers>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1110100 010 : W : 0 : Rn', '(0) : M : (0) : register_list' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  registers = '0' : M : '0' :  register_list;
           wback = W == 1;
           when Rn == 15 or BitCount(registers) < 2 or
                wback and registers<[Rn]> do
              DECODE_UNPREDICTABLE (mc, "StoreMultiple");
           index = false;
           increment = true;
           Store (StoreMultiple (increment, index, wback, Rn, registers))
        }
        else
           Skip ()

     -- 2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- PUSH<c>.W <registers>
     -- STMDB<c>  <Rn>{!}, <registers>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1110100 100 : W : 0 : Rn', '(0) : M : (0) : register_list' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  registers = '0' : M : '0' :  register_list;
           wback = W == 1;
           when Rn == 15 or BitCount(registers) < 2 or
                wback and registers<[Rn]> do -- will be false when n = 13 (PUSH)
              DECODE_UNPREDICTABLE (mc, "StoreMultiple");
           index = true;
           increment = false;
           Store (StoreMultiple (increment, index, wback, Rn, registers))
        }
        else
           Skip ()

     -- 3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDM<c>.W <Rn>{!}, <registers>
     -- POP<c>.W <registers>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1110100 010 : W : 1 : Rn', 'P : M : (0) : register_list' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  registers = P : M : '0' :  register_list;
           wback = W == 1;
           when Rn == 15 or BitCount(registers) < 2 or P == 1 and M == 1 or
                registers<15> and InITBlock() and not LastInITBlock() or
                wback and registers<[Rn]> do
              DECODE_UNPREDICTABLE (mc, "LoadMultiple");
           index = false;
           increment = true;
           Load (LoadMultiple (increment, index, wback, Rn, registers))
        }
        else
           Skip ()

     -- 4 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDMDB<c>.W <Rn>{!}, <registers>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1110100 100 : W : 1 : Rn', 'P : M : (0) : register_list' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  registers = P : M : '0' :  register_list;
           wback = W == 1;
           when Rn == 15 or BitCount(registers) < 2 or P == 1 and M == 1 or
                registers<15> and InITBlock() and not LastInITBlock() or
                wback and registers<[Rn]> do
              DECODE_UNPREDICTABLE (mc, "LoadMultiple");
           index = true;
           increment = false;
           Load (LoadMultiple (increment, index, wback, Rn, registers))
        }
        else
           Skip ()

     -- 5 ~~~~~~~~~~~~~~~~~~~~~~~
     -- SRSDB<c> SP{!}, #<mode>
     -- SRS{IA}<c> SP{!}, #<mode>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1110100 : op`2 : 0 : W : 0 (1101)', '(11000000000) : mode' =>
        if Do (ThumbCondition(), op in set {'00', '11'} and HaveThumb2()) then
        {  when CurrentInstrSet() == InstrSet_ThumbEE do
              DECODE_UNPREDICTABLE (mc, "StoreReturnState");
           wback = W == 1;
           increment = op == '11';
           wordhigher = false;
           System (StoreReturnState (increment, wordhigher, wback, mode))
        }
        else
           Skip ()

     -- 6 ~~~~~~~~~~~~~~~~
     -- RFEDB<c> <Rn>{!}
     -- RFE{IA}<c> <Rn>{!}
     -- ~~~~~~~~~~~~~~~~~~
     case '1110100 : op`2 : 0 : W : 1 : Rn', '(1100000000000000)' =>
        if Do (ThumbCondition(), op in set {'00', '11'} and HaveThumb2()) then
        {  when CurrentInstrSet() == InstrSet_ThumbEE or Rn == 15 or
                InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "ReturnFromException");
           wback = W == 1;
           increment = op == '11';
           wordhigher = false;
           System (ReturnFromException (increment, wordhigher, wback, Rn))
        }
        else
           Skip ()

     -- 7 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STREX<c> <Rd>, <Rt>, [<Rn>{, #<imm>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1110100 00 1 0 0 : Rn', 'Rt : Rd : imm8' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} or Rt in set {13,15} or Rn == 15 or
                Rd == Rn or Rd == Rt do
              DECODE_UNPREDICTABLE (mc, "StoreExclusive");
           imm32 = ZeroExtend (imm8 : '00');
           Store (StoreExclusive (Rd, Rt, Rn, imm32))
        }
        else
           Skip ()

     -- 8 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDREX<c> <Rt>, [<Rn>{, #<imm>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1110100 00 1 0 1 : Rn', 'Rt : Rd : imm8' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rt in set {13,15} or Rn == 15 do
              DECODE_UNPREDICTABLE (mc, "StoreExclusive");
           imm32 = ZeroExtend (imm8 : '00');
           Load (LoadExclusive (Rt, Rn, imm32))
        }
        else
           Skip ()

     -- 9 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STREXB<c> <Rd>, <Rt>, [<Rn>]
     -- STREXH<c> <Rd>, <Rt>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11101 000110 0 : Rn', 'Rt : (1111) 010 : H : Rd' =>
        if Do (ThumbCondition(), ArchVersion() >= 7) then
        {  when Rd in set {13,15} or Rt in set {13,15} or Rn == 15 or
                Rd == Rn or Rd == Rt do
              DECODE_UNPREDICTABLE (mc, "StoreExclusive: Byte or Halfword");
           if H == 1 then
              Store (StoreExclusiveHalf (Rd, Rt, Rn))
           else
              Store (StoreExclusiveByte (Rd, Rt, Rn))
        }
        else
           Skip ()

     -- 10 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STREXD<c> <Rd>, <Rt>, <Rt2>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11101 000110 0 : Rn', 'Rt : Rt2 : 0111 : Rd' =>
        if Do (ThumbCondition(), ArchVersion() >= 7) then
        {  when Rd in set {13,15} or Rt in set {13,15} or Rt2 in set {13,15} or
                Rn == 15 or Rd == Rn or Rd == Rt do
              DECODE_UNPREDICTABLE (mc, "StoreExclusivDoubleword");
           Store (StoreExclusiveDoubleword (Rd, Rt, Rt2, Rn))
        }
        else
           Skip ()

     -- 11 ~~~~~~~~~~~~~~~~~~~~~~~~
     -- TBH<c> [<Rn>, <Rm>, LSL #1]
     -- TBB<c> [<Rn>, <Rm>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11101 000110 1 : Rn', '(1111) (0000) 000 : H : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rn == 13 or Rm in set {13,15} or
                InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "TableBranchByte");
           is_tbh = H == 1;
           Branch (TableBranchByte (is_tbh, Rm, Rn))
        }
        else
           Skip ()

     -- 12 ~~~~~~~~~~~~~~~~~~~
     -- LDREXB<c> <Rt>, [<Rn>]
     -- LDREXH<c> <Rt>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~~
     case '11101 000110 1 : Rn', 'Rt : (1111) 010 : H : Rd' =>
        if Do (ThumbCondition(), ArchVersion() >= 7) then
        {  when Rt in set {13,15} or Rn == 15 do
              DECODE_UNPREDICTABLE (mc, "LoadExclusive: Byte or Halfword");
           if H == 1 then
              Load (LoadExclusiveHalf (Rt, Rn))
           else
              Load (LoadExclusiveByte (Rt, Rn))
        }
        else
           Skip ()

     -- 13 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDREXD<c> <Rt>, <Rt2>, [<Rn>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11101 000110 1 : Rn', 'Rt : Rt2 : 0111 (1111)' =>
        if Do (ThumbCondition(), ArchVersion() >= 7) then
        {  when Rt in set {13,15} or Rt2 in set {13,15} or Rt == Rt2 or
                Rn == 15
              do DECODE_UNPREDICTABLE (mc, "LoadExclusiveDoubleword");
           Load (LoadExclusiveDoubleword (Rt, Rt2, Rn))
        }
        else
           Skip ()

     -- 14 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRD<c> <Rt>, <Rt2>, [<Rn>{, #+/-<imm>}]
     -- STRD<c> <Rt>, <Rt2>, [<Rn>], #+/-<imm>
     -- STRD<c> <Rt>, <Rt2>, [<Rn>, #+/-<imm>]!
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1110100 : P : U : 1 : W : 0 : Rn', 'Rt : Rt2 : imm8' =>
        if Do (ThumbCondition(), (P == '1' or W == '1') and HaveThumb2()) then
        {  wback = W == 1;
           when wback and (Rn == Rt or Rn == Rt2) or
                Rn == 15 or Rt in set {13,15} or Rt2 in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "StoreDual");
           index = P == 1;
           add = U == 1;
           imm32 = ZeroExtend (imm8 : '00');
           m = immediate_form2 (imm32);
           Store (StoreDual (add, index, wback, Rt, Rt2, Rn, m))
        }
        else
           Skip ()

     -- 15 ~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDRD<c> <Rt>, <Rt2>, <label>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1110100 : P : U : 1 : W : 1 1111', 'Rt : Rt2 : imm8' =>
        if Do (ThumbCondition(), (P == '1' or W == '1') and HaveThumb2()) then
        {  when Rt in set {13,15} or Rt2 in set {13,15} or Rt == Rt2 or
                W == 1 do
              DECODE_UNPREDICTABLE (mc, "LoadDual: literal");
           imm32 = ZeroExtend (imm8 : '00');
           add = U == 1;
           Load (LoadDualLiteral (add, Rt, Rt2, imm32))
        }
        else
           Skip ()

     -- 16 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDRD<c> <Rt>, <Rt2>, [<Rn>{, #+/-<imm>}]
     -- LDRD<c> <Rt>, <Rt2>, [<Rn>], #+/-<imm>
     -- LDRD<c> <Rt>, <Rt2>, [<Rn>, #+/-<imm>]!
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1110100 : P : U : 1 : W : 1 : Rn', 'Rt : Rt2 : imm8' =>
        if Do (ThumbCondition(), (P == '1' or W == '1') and HaveThumb2()) then
        {  wback = W == 1;
           when wback and (Rn == Rt or Rn == Rt2) or
                Rt in set {13,15} or Rt2 in set {13,15} or Rt == Rt2 do
              DECODE_UNPREDICTABLE (mc, "LoadDual");
           index = P == 1;
           add = U == 1;
           imm32 = ZeroExtend (imm8 : '00');
           m = immediate_form2 (imm32);
           Load (LoadDual (add, index, wback, Rt, Rt2, Rn, m))
        }
        else
           Skip ()

     -- 17 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- TST<c>.W    <Rn>, <Rm>{, <shift>}
     -- AND{S}<c>.W <Rd>, <Rn>, <Rm>{, <shift>}
     -- BIC{S}<c>.W <Rd>, <Rn>, <Rm>{, <shift>}
     -- MOV{S}<c>.W <Rd>, <Rm>{, <shift>}
     -- ORR{S}<c>.W <Rd>, <Rn>, <Rm>{, <shift>}
     -- ORN{S}<c>.W <Rd>, <Rn>, <Rm>{, <shift>}
     -- MVN{S}<c>.W <Rd>, <Rn>, <Rm>{, <shift>}
     -- TEQ<c>.W    <Rn>, <Rm>{, <shift>}
     -- PKHBT<c>    <Rd>, <Rn>, <Rm>{, LSL #<imm>}
     -- PKHTB<c>    <Rd>, <Rn>, <Rm>{, ASR #<imm>}
     -- CMN<c>.W    <Rn>, <Rm>{, <shift>}
     -- ADD{S}<c>.W <Rd>, <Rn>, <Rm>{, <shift>}
     -- ADC{S}<c>.W <Rd>, <Rn>, <Rm>{, <shift>}
     -- SBC{S}<c>.W <Rd>, <Rn>, <Rm>{, <shift>}
     -- CMP<c>.W    <Rn>, <Rm>{, <shift>}
     -- SUB{S}<c>.W <Rd>, <Rn>, <Rm>{, <shift>}
     -- RSB{S}<c>.W <Rd>, <Rn>, <Rm>{, <shift>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '1110101 : op : S : Rn', '(0) : imm3 : Rd : imm2 : typ : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  shift_t, shift_n = DecodeImmShift (typ, imm3 : imm2);
           setflags = S == 1;
           match op, Rn, Rd, S
           { case '0000', _, '1111', '1' =>
               { when Rn in set {13,15} or Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "TST (register)");
                 Data (TestCompareRegister ('00', Rn, Rm, shift_t, shift_n))
               }
             case '0000', _ =>
               { when Rd == 13 or (Rd == 15 and not setflags) or
                      Rn in set {13,15} or Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "AND (register)");
                 Data
                   (Register (0b0000, setflags, Rd, Rn, Rm, shift_t, shift_n))
               }
             case '0001', _ =>
               { when Rd in set {13,15} or Rn in set {13,15} or
                      Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "BIC (register)");
                 Data
                   (Register (0b1110, setflags, Rd, Rn, Rm, shift_t, shift_n))
               }
             case '0010', '1111', _ =>
               { if typ == 0 and imm3 == 0 and imm2 == 0 then
                 {  when setflags and (Rd in set {13,15} or Rm in set {13,15})
                         or not setflags and
                         (Rd == 15 or Rm == 15 or (Rd == 13 and Rm == 13)) do
                       DECODE_UNPREDICTABLE (mc, "MOV (register)")
                 }
                 else
                    when Rd in set {13,15} or Rm in set {13,15} do
                       DECODE_UNPREDICTABLE (mc, "SHIFT (register)");
                 Data
                   (ShiftImmediate (false, setflags, Rd, Rm, shift_t, shift_n))
               }
             case '0010', _ =>
               { when Rd in set {13,15} or Rn == 13 or Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "ORR (register)");
                 Data
                   (Register (0b1100, setflags, Rd, Rn, Rm, shift_t, shift_n))
               }
             case '0011', '1111', _ =>
               { when Rd in set {13,15} or Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "MVN (register)");
                 Data
                   (ShiftImmediate (true, setflags, Rd, Rm, shift_t, shift_n))
               }
             case '0011', _ =>
               { when Rd in set {13,15} or Rn == 13 or Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "ORN (register)");
                 Data
                   (Register (0b1111, setflags, Rd, Rn, Rm, shift_t, shift_n))
               }
             case '0100', _, '1111', '1' =>
               { when Rn in set {13,15} or Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "TEQ (register)");
                 Data (TestCompareRegister ('01', Rn, Rm, shift_t, shift_n))
               }
             case '0100', _ =>
               { when Rd == 13 or (Rd == 15 and not setflags) or
                      Rn in set {13,15} or Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "EOR (register)");
                 Data
                   (Register (0b0001, setflags, Rd, Rn, Rm, shift_t, shift_n))
               }
             case '0110', _, _, '0' =>
               if typ<0> then
                 Undefined (0)
               else
               { when Rd in set {13,15} or Rn in set {13,15} or
                      Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "PackHalfword");
                 tbform = typ<1>;
                 Media (PackHalfword (shift_t, shift_n, tbform, Rd, Rn, Rm))
               }
             case '1000', _, '1111', '1' =>
               { when Rn == 15 or Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "CMN (register)");
                 Data (TestCompareRegister ('11', Rn, Rm, shift_t, shift_n))
               }
             case '1000', _ =>
               { when Rd == 13 or (Rd == 15 and not setflags) or Rn == 15 or
                      Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "ADD (register)");
                 shift_t, shift_n = DecodeImmShift (typ, imm3 : imm2);
                 Data
                   (Register (0b0100, setflags, Rd, Rn, Rm, shift_t, shift_n))
               }
             case '1010', _ =>
               { when Rd in set {13,15} or Rn in set {13,15} or
                      Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "ADC (register)");
                 Data
                   (Register (0b0101, setflags, Rd, Rn, Rm, shift_t, shift_n))
               }
             case '1011', _ =>
               { when Rd in set {13,15} or Rn in set {13,15} or
                      Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "SBC (register)");
                 Data
                   (Register (0b0110, setflags, Rd, Rn, Rm, shift_t, shift_n))
               }
             case '1101', _, '1111', '1' =>
               { when Rn == 15 or Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "CMP (register)");
                 Data (TestCompareRegister ('10', Rn, Rm, shift_t, shift_n))
               }
             case '1101', _ =>
               { when Rd == 13 or (Rd == 15 and not setflags) or Rn == 15 or
                      Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "SUB (register)");
                 Data
                   (Register (0b0010, setflags, Rd, Rn, Rm, shift_t, shift_n))
               }
             case '1110', _ =>
               { when Rd in set {13,15} or Rn in set {13,15} or
                      Rm in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "RSB (register)");
                 Data
                   (Register (0b0011, setflags, Rd, Rn, Rm, shift_t, shift_n))
               }
             case _ => Undefined (0)
           }
        }
        else
           Skip ()

     -- 18 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- TST<c>      <Rn>, #<const>
     -- TEQ<c>      <Rn>, #<const>
     -- CMN<c>      <Rn>, #<const>
     -- CMP<c>      <Rn>, #<const>
     -- MOV{S}<c>.W <Rd>, #<const>
     -- MVN{S}<c>   <Rd>, #<const>
     -- AND{S}<c>   <Rd>, <Rn>, #<const>
     -- BIC{S}<c>   <Rd>, <Rn>, #<const>
     -- ORR{S}<c>   <Rd>, <Rn>, #<const>
     -- ORN{S}<c>   <Rd>, <Rn>, #<const>
     -- EOR{S}<c>   <Rd>, <Rn>, #<const>
     -- ADD{S}<c>   <Rd>, <Rn>, #<const>
     -- ADC{S}<c>   <Rd>, <Rn>, #<const>
     -- SBC{S}<c>   <Rd>, <Rn>, #<const>
     -- SUB{S}<c>   <Rd>, <Rn>, #<const>
     -- RSB{S}<c>   <Rd>, <Rn>, #<const>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11110 : i : 0 : op`4 : S : Rn', '0 : imm3 : Rd : imm8' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  imm12 = i : imm3 : imm8;
           imm32, carry = ThumbExpandImm_C (imm12, CPSR.C);
           setflags = S == 1;
           match op, Rn, Rd, S
           { case '0000', _, '1111', '1' =>
               { when Rn in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "TST (immediate)");
                 Data (TestCompareImmediate ('00', Rn, imm12))
               }
             case '0000', _ =>
               { when Rd == 13 or (Rd == 15 and not setflags) or
                      Rn in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "AND (immediate)");
                 Data
                   (ArithLogicImmediate (0b0000, setflags, Rd, Rn, imm12))
               }
             case '0001', _ =>
               { when Rd in set {13,15} or Rn in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "BIC (immediate)");
                 Data
                   (ArithLogicImmediate (0b1110, setflags, Rd, Rn, imm12))
               }
             case '0010', '1111', _ =>
               { when Rd in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "MOV (immediate)");
                 Data (Move (setflags, false, Rd, imm12))
               }
             case '0010', _ =>
               { when Rd in set {13,15} or Rn == 13 do
                    DECODE_UNPREDICTABLE (mc, "ORR (immediate)");
                 Data
                   (ArithLogicImmediate (0b1100, setflags, Rd, Rn, imm12))
               }
             case '0011', '1111', _ =>
               { when Rd in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "MVN (immediate)");
                 Data (Move (setflags, true, Rd, imm12))
               }
             case '0011', _ =>
               { when Rd in set {13,15} or Rn == 13 do
                    DECODE_UNPREDICTABLE (mc, "ORN (immediate)");
                 Data
                   (ArithLogicImmediate (0b1111, setflags, Rd, Rn, imm12))
               }
             case '0100', _, '1111', '1' =>
               { when Rn in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "TEQ (immediate)");
                 Data (TestCompareImmediate ('01', Rn, imm12))
               }
             case '0100', _ =>
               { when Rd == 13 or (Rd == 15 and not setflags) or
                      Rn in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "EOR (immediate)");
                 Data
                   (ArithLogicImmediate (0b0001, setflags, Rd, Rn, imm12))
               }
             case '1000', _, '1111', '1' =>
               { when Rn == 15 do
                    DECODE_UNPREDICTABLE (mc, "CMN (immediate)");
                 Data (TestCompareImmediate ('11', Rn, imm12))
               }
             case '1000', _ =>
               { when Rd == 13 or (Rd == 15 and not setflags) or Rn == 15 do
                    DECODE_UNPREDICTABLE (mc, "ADD (immediate)");
                 Data (ArithLogicImmediate (0b0100, setflags, Rd, Rn, imm12))
               }
             case '1010', _ =>
               { when Rd in set {13,15} or Rn in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "ADC (immediate)");
                 Data (ArithLogicImmediate (0b0101, setflags, Rd, Rn, imm12))
               }
             case '1011', _ =>
               { when Rd in set {13,15} or Rn in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "SBC (immediate)");
                 Data (ArithLogicImmediate (0b0110, setflags, Rd, Rn, imm12))
               }
             case '1101', _, '1111', '1' =>
               { when Rn == 15 do
                    DECODE_UNPREDICTABLE (mc, "CMP (immediate)");
                 Data (TestCompareImmediate ('10', Rn, imm12))
               }
             case '1101', _ =>
               { when Rd == 13 or (Rd == 15 and not setflags) or Rn == 15 do
                    DECODE_UNPREDICTABLE (mc, "SUB (immediate)");
                 Data (ArithLogicImmediate (0b0010, setflags, Rd, Rn, imm12))
               }
             case '1110', _ =>
               { when Rd in set {13,15} or Rn in set {13,15} do
                    DECODE_UNPREDICTABLE (mc, "RSB (immediate)");
                 Data (ArithLogicImmediate (0b0011, setflags, Rd, Rn, imm12))
               }
             case _ => Undefined (0)
           }
        }
        else
           Skip ()

     -- 19 ~~~~~~~~~~~~~~~~~~~~~~~~~
     -- ADDW<c> <Rd>, <Rn>, #<imm12>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11110 : i : 1 00000 : Rn', '0 : imm3 : Rd : imm8' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "ADDW (immediate)");
           imm12 = i : imm3 : imm8;
           Data (AddSub (false, Rd, Rn, imm12))
        }
        else
           Skip ()

     -- 20 ~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SUBW<c> <Rd>, <Rn>, #<imm12>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11110 : i : 1 01010 : Rn', '0 : imm3 : Rd : imm8' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "SUBW (immediate)");
           imm12 = i : imm3 : imm8;
           Data (AddSub (true, Rd, Rn, imm12))
        }
        else
           Skip ()

     -- 21 ~~~~~~~~~~~~~~~~~~~
     -- MOVW<c> <Rd>, #<imm16>
     -- MOVT<c> <Rd>, #<imm16>
     -- ~~~~~~~~~~~~~~~~~~~~~~
     case '11110 : i : 10 : H : 100 : imm4', '0 : imm3 : Rd : imm8' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "MOVT or MOVW (immediate)");
           imm16 = imm4 : i : imm3 : imm8;
           high = H == 1;
           Data (MoveHalfword (high, Rd, imm16))
        }
        else
           Skip ()

     -- 22 ~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SSAT16<c> <Rd>, #<imm>, <Rn>
     -- USAT16<c> <Rd>, #<imm>, <Rn>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11110 (0) 11 : U : 0 1 0 : Rn', '0 000 : Rd : 00 (00) : sat_imm`4' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} or Rn in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "Saturate16");
           unsigned = U == 1;
           sarurate_to = if unsigned then [sat_imm] else [sat_imm] + 0n1;
           Media (Saturate16 (sarurate_to, unsigned, Rd, Rn))
        }
        else
           Skip ()

     -- 23 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SSAT<c> <Rd>, #<imm5>, <Rn>{, <shift>}
     -- USAT<c> <Rd>, #<imm5>, <Rn>{, <shift>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11110 (0) 11 : U : 0 : sh : 0 : Rn',
          '0 : imm3 : Rd : imm2 : (0) : sat_imm`5' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} or Rn in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "Saturate");
           unsigned = U == 1;
           sarurate_to = if unsigned then [sat_imm] else [sat_imm] + 0n1;
           shift_t, shift_n = DecodeImmShift (sh : '0', imm3 : imm2);
           Media (Saturate (shift_t, shift_n, sarurate_to, unsigned, Rd, Rn))
        }
        else
           Skip ()

     -- 24 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SBFX<c> <Rd>, <Rn>, #<lsb>, #<width>
     -- UBFX<c> <Rd>, <Rn>, #<lsb>, #<width>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11110 (0) 11 : U : 100 : Rn',
          '0 : imm3 : Rd : imm2 : (0) : widthm1`5' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  widthminus1 = [widthm1];
           lsbit = [imm3 : imm2];
           when Rd in set {13,15} or Rn in set {13,15} or
                0n31 < lsbit + widthminus1 do
              DECODE_UNPREDICTABLE (mc, "BitFieldExtract");
           unsigned = U == 1;
           Media (BitFieldExtract (unsigned, Rd, Rn, lsbit, widthminus1))
        }
        else
           Skip ()

     -- 25 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- BFC<c> <Rd>, #<lsb>, #<width>
     -- BFI<c> <Rd>, <Rn>, #<lsb>, #<width>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11110 (0) 11 0 110 : Rn', '0 : imm3 : Rd : imm2 : (0) : msb`5' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  msbit = [msb]::nat;
           lsbit = [imm3 : imm2];
           when Rd in set {13,15} or Rn == 13 or msbit < lsbit do
              DECODE_UNPREDICTABLE (mc, "BitFieldClearOrInsert");
           Media (BitFieldClearOrInsert (Rd, Rn, lsbit, msbit))
        }
        else
           Skip ()

     -- 26 ~~~~~~~~~~~~~~~~~~~~~~
     -- MSR<c> <banked_reg>, <Rn>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11110 011100 : R : Rn', '10 (0) 0 : m1`4 : (00) 1 : m : (0000)' =>
        if Do (ThumbCondition(), HaveVirtExt()) then
        {  when Rn in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "MoveToBankedOrSpecialRegister");
           write_spsr = R == 1;
           SYSm = m : m1;
           System (MoveToBankedOrSpecialRegister (write_spsr, SYSm, Rn))
        }
        else
           Skip ()

     -- 27 ~~~~~~~~~~~~~~~~~~~~
     -- MSR<c> <spec_reg>, <Rn>
     -- ~~~~~~~~~~~~~~~~~~~~~~~
     case '11110 011100 : R : Rn', '10 (0) 0 : mask`4 : (00) 0 (00000)' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when mask == 0 or Rn in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "MoveToSpecialFromRegister");
           write_spsr = R == 1;
           System (MoveToSpecialFromRegister (write_spsr, Rn, mask))
        }
        else
           Skip ()

     -- 28 ~~
     -- Hints
     -- ~~~~~
     case '11110 011101 0 (1111)', '10 (0) 0 (0) 000 : op`8' =>
         DecodeHint (ThumbCondition(), op)

     -- 29 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- CPS<effect>.W <iflags>{, #<mode>}
     -- CPS #<mode>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11110 011101 0 (1111)',
          '10 (0) 0 (0) : imod`2 : M : A : I : F : mode' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when mode != 0 and M == 0 or
                imod<1> == (A : I : F == 0) or
                imod == '01' or InITBlock() do
              DECODE_UNPREDICTABLE (mc, "ChangeProcessorState");
           enable = imod == '10';
           disable = imod == '11';
           changemode = if M == 1 then Some (mode) else None;
           affectA = A == 1;
           affectI = I == 1;
           affectF = F == 1;
           System
             (ChangeProcessorState
                (enable, disable, affectA, affectI, affectF, changemode))
        }
        else
           Skip ()

     -- 30 ~~~
     -- ENTERX
     -- LEAVEX
     -- ~~~~~~
     case '11110011101 1 (1111)', '10 (0) 0 (1111) 000 : J : (1111)' =>
        if Do (ThumbCondition(), HaveThumbEE()) and
           not (CurrentInstrSet() == InstrSet_Thumb and J == 0) then
        {  when InITBlock() do
              DECODE_UNPREDICTABLE (mc, "EnterxLeavex");
           is_enterx = J == 1;
           System (EnterxLeavex (is_enterx))
        }
        else
           Skip ()

     -- 31 ~~~~~~~~~~~~
     -- CLREX<c>
     -- DSB<c> <option>
     -- DMB<c> <option>
     -- ISB<c> <option>
     -- ~~~~~~~~~~~~~~~
     case '11110011101 1 (1111)', '10 (0) 0 (1111) : op`4 : option`4' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  match op
           { case '0010' => ClearExclusive
             case '0100' => Hint (DataSynchronizationBarrier (option))
             case '0101' => Hint (DataMemoryBarrier (option))
             case '0110' => Hint (InstructionSynchronizationBarrier (option))
             case _ =>
               if ArchVersion() >= 7 then
                  Undefined (0)
               else
               {  DECODE_UNPREDICTABLE (mc, "Miscellaneous control");
                  UNKNOWN
               }
           }
        }
        else
           Skip ()

     -- 32 ~~~~~~~~~~~~~~~
     -- SUBS<c> PC, LR, #0
     -- ERET<c>
     -- ~~~~~~~~~~~~~~~~~~
     case '11110011110 1 (1111)', '10 (0) 0 (1111) : imm8' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  if HaveVirtExt() and imm8 == 0 then
              System (ExceptionReturn)
           else
           {  when CurrentInstrSet() == InstrSet_ThumbEE or
                   InITBlock() and not LastInITBlock() do
                 DECODE_UNPREDICTABLE (mc, "SUBS<c> PC, LR, #0");
              imm12 = ZeroExtend (imm8);
              if CurrentModeIsHyp() then
                 Undefined (0)
              else
                 Data (ArithLogicImmediate (0b0010, true, 15, 14, imm12))
           }
        }
        else
           Skip ()

     -- 33 ~~~~~~~~~~~~~~~~~~~~~~
     -- MRS<c> <Rd>, <banked_reg>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11110 011111 : R : m1', '10 (0) 0 : Rd : (00) 1 : m : (0000)' =>
        if Do (ThumbCondition(), HaveVirtExt()) then
        {  when Rd in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "MoveToRegisterFromBankedOrSpecial");
           write_spsr = R == 1;
           SYSm = m : m1;
           System (MoveToRegisterFromBankedOrSpecial (write_spsr, SYSm, Rd))
        }
        else
           Skip ()

     -- 34 ~~~~~~~~~~~~~~~~~~~~
     -- MRS<c> <Rd>, <spec_reg>
     -- ~~~~~~~~~~~~~~~~~~~~~~~
     case '11110 011111 : R : (1111)', '10 (0) 0 : Rd : (00) 0 (00000)' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "MoveToRegisterFromSpecial");
           write_spsr = R == 1;
           System (MoveToRegisterFromSpecial (write_spsr, Rd))
        }
        else
           Skip ()

     -- 35 ~~~~~~~
     -- HVC #<imm>
     -- ~~~~~~~~~~
     case '11110 1111110 : imm4', '1000 : imm12' =>
        if Do (ThumbCondition(), HaveVirtExt()) then
        {  when InITBlock() do
              DECODE_UNPREDICTABLE (mc, "HypervisorCall");
           imm16 = imm4 : imm12;
           System (HypervisorCall (imm16))
        }
        else
           Skip ()

     -- 36 ~~~~~~~~~~~
     -- SMC<c> #<imm4>
     -- ~~~~~~~~~~~~~~
     case '11110 1111111 : imm4', '1000 (000000000000)' =>
        if Do (ThumbCondition(),
                 HaveSecurityExt() and Architecture <> ARMv6K) then
        {  when InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "SecureMonitorCall");
           System (SecureMonitorCall (imm4))
        }
        else
           Skip ()

     -- 37 ~~~~~~~~~~~~~
     -- UDF<c>.W <imm16>
     -- ~~~~~~~~~~~~~~~~
     case '11110 1111111 : imm4', '1010 : imm12' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  imm32 = ZeroExtend (imm4 : imm12);
           Undefined (imm32)
        }
        else
           Skip ()

     -- 38 ~~~~~~~~~~~
     -- B<c>.W <label>
     -- ~~~~~~~~~~~~~~
     case '11110 : S : cond : imm6', '10 : J1 : 0 : J2 : imm11' =>
        if Do (cond, HaveThumb2()) then
        {  when InITBlock() do
              DECODE_UNPREDICTABLE (mc, "BranchTarget");
           imm32 = SignExtend (S : J2 : J1 : imm6 : imm11 : '0');
           Branch (BranchTarget (imm32))
        }
        else
           Skip ()

     -- 39 ~~~~~~~~~~~
     -- B<c>.W <label>
     -- BL<c> <label>
     -- ~~~~~~~~~~~~~~
     case '11110 : S : imm10', '1 : L : J1 : 1 : J2 : imm11' =>
        if Do (ThumbCondition(),
                 L == 1 and J1 == 1 and J1 == J2 or HaveThumb2()) then
        {  when InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc,
                 "BranchTarget or BranchLinkExchangeImmediate");
           I1 = ~(J1 ?? S);
           I2 = ~(J2 ?? S);
           imm32 = SignExtend (S : I1 : I2 : imm10 : imm11 : '0');
           targetInstrSet = InstrSet_Thumb;
           if L == 1 then
              Branch (BranchLinkExchangeImmediate (targetInstrSet, imm32))
           else
              Branch (BranchTarget (imm32))
        }
        else
           Skip ()

     -- 40 ~~~~~~~~~~~
     -- BLX<c> <label>
     -- ~~~~~~~~~~~~~~
     case '11110 : S : imm10H', '11 : J1 : 0 : J2 : imm10L: H' =>
        if Do (ThumbCondition(),
                 not (CurrentInstrSet() == InstrSet_ThumbEE or H == 1) and
                 if J1 == 1 and J1 == J2 then
                    ArchVersion () >= 5
                 else
                    HaveThumb2()) then
        {  when InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "BranchLinkExchangeImmediate");
           I1 = ~(J1 ?? S);
           I2 = ~(J2 ?? S);
           imm32 = SignExtend (S : I1 : I2 : imm10H : imm10L : '00');
           targetInstrSet = InstrSet_ARM;
           Branch (BranchLinkExchangeImmediate (targetInstrSet, imm32))
        }
        else
           Skip ()

     -- 41 ~~~~~~~~~~~
     case '11111 000 _ 0 1 1 1111', '1111 _' =>
        {  DECODE_UNPREDICTABLE (mc, "PreloadDataLiteral");
           UNKNOWN
        }

     -- 42 ~~~~~~~~~~~
     -- PLD<c> <label>
     -- ~~~~~~~~~~~~~~
     case '11111 000 : U : 0 (0) 1 1111', '1111 : imm12' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  imm32 = ZeroExtend (imm12);
           add = U == 1;
           Hint (PreloadDataLiteral (add, imm32))
        }
        else
           Skip ()

     -- 43 ~~~~~~~~~~~
     -- PLI<c> <label>
     -- ~~~~~~~~~~~~~~
     case '11111 001: U : 001 1111', '1111 : imm12' =>
        if Do (ThumbCondition(), ArchVersion() >= 7) then
        {  imm32 = ZeroExtend (imm12);
           add = U == 1;
           Rn = 15;
           Hint (PreloadInstruction (add, Rn, immediate_form1 (imm32)))
        }
        else
           Skip ()

     -- 44 ~~~~~~~~~~~
     -- PLI<c> <label>
     -- ~~~~~~~~~~~~~~
     case '11111 001 1 001 : Rn', '1111 : imm12' =>
        if Do (ThumbCondition(), ArchVersion() >= 7) then
        {  imm32 = ZeroExtend (imm12);
           add = true;
           Hint (PreloadInstruction (add, Rn, immediate_form1 (imm32)))
        }
        else
           Skip ()

     -- 45 ~~~~~~~~~~~~~~~~~~~~~~~
     -- PLD{W}<c> [<Rn>, #<imm12>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00010 : W : 1 : Rn', '1111 : imm12' =>
        if Do (ThumbCondition(),
                 if W == 1 then HaveMPExt() else HaveThumb2()) then
        {  imm32 = ZeroExtend (imm12);
           add = true;
           is_pldw = W == 1;
           Hint (PreloadData (add, is_pldw, Rn, immediate_form1 (imm32)))
        }
        else
           Skip ()

     -- 46 ~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00 1 _ 011 1111', '1111 _' =>
        NoOperation

     -- 47 ~~~~~~~~~~~~~~~~~~~~~
     -- LDR{S}B<c> <Rt>, <label>
     -- LDR{S}H<c> <Rt>, <label>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00 : S : U : 0 : H : 1 1111', 'Rt : imm12' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rt == 13 do
              DECODE_UNPREDICTABLE (mc, "LoadByteLiteral/LoadHalfLiteral");
           imm32 = ZeroExtend (imm12);
           add = U == 1;
           unsigned = S == 0;
           if H == 1 then
              Load (LoadHalfLiteral (unsigned, add, Rt, imm32))
           else
              Load (LoadByteLiteral (unsigned, add, Rt, imm32))
        }
        else
           Skip ()

     -- 48 ~~~~~~~~~~~~~~~~~~~
     -- LDR<c>.W <Rt>, <label>
     -- ~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00 0 : U : 1 0 1 1111', 'Rt : imm12' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rt == 15 and InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "LoadLiteral");
           imm32 = ZeroExtend (imm12);
           add = U == 1;
           Load (LoadLiteral (add, Rt, imm32))
        }
        else
           Skip ()

     -- 49 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR{S}B<c> <Rt>, [<Rn>{, #<imm12>}]
     -- LDR{S}H<c> <Rt>, [<Rn>{, #<imm12>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00 : S : 10 : H : 1 : Rn', 'Rt : imm12' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rt == 13 do
              DECODE_UNPREDICTABLE (mc, "LoadByte/LoadHalf (immediate)");
           add = true;
           index = true;
           wback = false;
           imm32 = ZeroExtend (imm12);
           m = immediate_form1 (imm32);
           unsigned = S == 0;
           if H == 1 then
              Load (LoadHalf (unsigned, add, index, wback, Rt, Rn, m))
           else
              Load (LoadByte (unsigned, add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 50 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR<c>.W <Rt>, [<Rn>, <Rm>{, #<imm12>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00 0 11 0 1 : Rn', 'Rt : imm12' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rt == 15 and InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "LoadWord");
           add = true;
           index = true;
           wback = false;
           imm32 = ZeroExtend (imm12);
           m = immediate_form1 (imm32);
           Load (LoadWord (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 51 ~~~~~~~~~~~~~~~~~~~~~~~
     -- PLD{W}<c> [<Rn>, #-<imm8>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00000 : W : 1 : Rn', '1111 1100 : imm8' =>
        if Do (ThumbCondition(),
                 if W == 1 then HaveMPExt() else HaveThumb2()) then
        {  imm32 = ZeroExtend (imm8);
           add = false;
           is_pldw = W == 1;
           Hint (PreloadData (add, is_pldw, Rn, immediate_form1 (imm32)))
        }
        else
           Skip ()

     -- 52 ~~~~~~~~~~~~~~~~~~~~
     -- PLI<c> [<Rn>, #-<imm8>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 0010001 : Rn', '1111 1100 : imm8' =>
        if Do (ThumbCondition(), ArchVersion() >= 7) then
        {  imm32 = ZeroExtend (imm8);
           add = false;
           Hint (PreloadInstruction (add, Rn, immediate_form1 (imm32)))
        }
        else
           Skip ()

     -- 53 ~~~~~~
     -- Undefined
     -- ~~~~~~~~~
     case '11111 00 _`1 00 _`1 1 _`4', '_`4 1 0 _`1 0 _`8' =>
        Undefined (0)

     -- 54 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR{S}BT<c> <Rt>, [<Rn>, #<imm8>]
     -- LDR{S}HT<c> <Rt>, [<Rn>, #<imm8>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00 : S : 00 : H : 1 : Rn', 'Rt : 1110 : imm8' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rt in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "LoadUnprivileged");
           add = true;
           postindex = false;
           unsigned = S == 0;
           imm32 = ZeroExtend (imm8);
           m = immediate_form2 (imm32);
           if H == 1 then
              Load (LoadHalfUnprivileged (unsigned, add, postindex, Rt, Rn, m))
           else if unsigned then
              Load
                (LoadByteUnprivileged
                   (add, postindex, Rt, Rn, immediate_form1 (imm32)))
           else
              Load (LoadSignedByteUnprivileged (add, postindex, Rt, Rn, m))
        }
        else
           Skip ()

     -- 55 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00 1 00 1 1 _', '1111 1100 _' =>
        NoOperation

     -- 56 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR{S}B<c> <Rt>, [<Rn>, #-<imm8>]
     -- LDR{S}B<c> <Rt>, [<Rn>], #+/-<imm8>
     -- LDR{S}B<c> <Rt>, [<Rn>, #+/-<imm8>]!
     -- LDR{S}H<c> <Rt>, [<Rn>, #-<imm8>]
     -- LDR{S}H<c> <Rt>, [<Rn>], #+/-<imm8>
     -- LDR{S}H<c> <Rt>, [<Rn>, #+/-<imm8>]!
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00 : S : 00 : H : 1 : Rn', 'Rt : 1 : P : U : W : imm8' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  wback = W == 1;
           when Rt == 13 or (Rt == 15 and wback) or (wback and Rn == Rt) do
              DECODE_UNPREDICTABLE (mc, "Load (immediate)");
           add = U == 1;
           index = P == 1;
           unsigned = S == 0;
           imm32 = ZeroExtend (imm8);
           m = immediate_form1 (imm32);
           if H == 1 then
              Load (LoadHalf (unsigned, add, index, wback, Rt, Rn, m))
           else
              Load (LoadByte (unsigned, add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 57 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDRT<c> <Rt>, [<Rn>, #<imm8>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 000 0 101 : Rn', 'Rt : 1110 : imm8' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rt in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "LoadUnprivileged");
           add = true;
           postindex = false;
           imm32 = ZeroExtend (imm8);
           m = immediate_form1 (imm32);
           Load (LoadUnprivileged (add, postindex, Rt, Rn, m))
        }
        else
           Skip ()

     -- 58 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR<c> <Rt>, [<Rn>, #-<imm8>]
     -- LDR<c> <Rt>, [<Rn>], #+/-<imm8>
     -- LDR<c> <Rt>, [<Rn>, #+/-<imm8>]!
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 000 0 101 : Rn', 'Rt : 1 : P : U : W : imm8' =>
        if Do (ThumbCondition(), (P == '1' or W == '1') and HaveThumb2()) then
        {  wback = W == 1;
           when wback and Rn == Rt or
                Rt == 15 and InITBlock() and not LastInITBlock() do
              DECODE_UNPREDICTABLE (mc, "LoadWord");
           add = U == 1;
           index = P == 1;
           imm32 = ZeroExtend (imm8);
           m = immediate_form1 (imm32);
           Load (LoadWord (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 59 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- PLD{W}<c> [<Rn>, <Rm>{, LSL #<imm2>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00000 : W : 1 : Rn', '1111 000000 : imm2 : Rm' =>
        if Do (ThumbCondition(),
                 if W == 1 then HaveMPExt() else HaveThumb2()) then
        {  when Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "PreloadData");
           add = true;
           is_pldw = W == 1;
           shift_t, shift_n = SRType_LSL, [imm2];
           m = register_form1 (Rm, shift_t, shift_n);
           Hint (PreloadData (add, is_pldw, Rn, m))
        }
        else
           Skip ()

     -- 60 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- PLI<c> [<Rn>, <Rm>{, LSL #<imm2>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00100 0 1 : Rn', '1111 000000 : imm2 : Rm' =>
        if Do (ThumbCondition(), ArchVersion() >= 7) then
        {  when Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "PreloadInstruction");
           add = true;
           shift_t, shift_n = SRType_LSL, [imm2];
           m = register_form1 (Rm, shift_t, shift_n);
           Hint (PreloadInstruction (add, Rn, m))
        }
        else
           Skip ()

     -- 61 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00 1 00 1 1 _', '1111 000000 _' =>
        NoOperation

     -- 62 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR{S}B<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
     -- LDR{S}H<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00 : S : 00 : H : 1 : Rn', 'Rt : 000000 : imm2 : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rt == 13 or Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "Load (register)");
           add = true;
           index = true;
           wback = false;
           unsigned = S == 0;
           shift_t, shift_n = SRType_LSL, [imm2];
           m = register_form1 (Rm, shift_t, shift_n);
           if H == 1 then
              Load (LoadHalf (unsigned, add, index, wback, Rt, Rn, m))
           else
              Load (LoadByte (unsigned, add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 63 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LDR<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 000 0 101 : Rn', 'Rt : 000000 : imm2 : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rt == 15 and InITBlock() and not LastInITBlock() or
                Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "LoadWord");
           add = true;
           index = true;
           wback = false;
           shift_t, shift_n = SRType_LSL, [imm2];
           m = register_form1 (Rm, shift_t, shift_n);
           Load (LoadWord (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 64 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRB<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
     -- STRH<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 0000100 : Rn', 'Rt : 000000 : imm2 : Rm' =>
        if Do (ThumbCondition(), Rn <> 15 and HaveThumb2()) then
        {  when Rt == 15 or Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "Store (register)");
           add = true;
           index = true;
           wback = false;
           shift_t, shift_n = SRType_LSL, [imm2];
           m = register_form1 (Rm, shift_t, shift_n);
           Store (StoreWord (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 65 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRB<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
     -- STRH<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00000 : H : 0 : Rn', 'Rt : 000000 : imm2 : Rm' =>
        if Do (ThumbCondition(), Rn <> 15 and HaveThumb2()) then
        {  when Rt in set {13, 15} or Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "StoreByte/Half (register)");
           add = true;
           index = true;
           wback = false;
           shift_t, shift_n = SRType_LSL, [imm2];
           m = register_form1 (Rm, shift_t, shift_n);
           if H == 1 then
              Store (StoreHalf (add, index, wback, Rt, Rn, m))
           else
              Store (StoreByte (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 66 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRT<c> <Rt>, [<Rn>, #<imm8>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 0000100 : Rn', 'Rt : 1110 : imm8' =>
        if Do (ThumbCondition(), Rn <> 15 and HaveThumb2()) then
        {  when Rt in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "StoreUnprivileged");
           add = true;
           postindex = false;
           imm32 = ZeroExtend (imm8);
           m = immediate_form1 (imm32);
           Store (StoreUnprivileged (add, postindex, Rt, Rn, m))
        }
        else
           Skip ()

     -- 67 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRBT<c> <Rt>, [<Rn>, #<imm8>]
     -- STRHT<c> <Rt>, [<Rn>, #<imm8>]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00000 : H : 0 : Rn', 'Rt : 1110 : imm8' =>
        if Do (ThumbCondition(), Rn <> 15 and HaveThumb2()) then
        {  when Rt in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "StoreByte/HalfUnprivileged");
           add = true;
           postindex = false;
           imm32 = ZeroExtend (imm8);
           m1 = immediate_form1 (imm32);
           m2 = immediate_form2 (imm32);
           if H == 1 then
              Store (StoreHalfUnprivileged (add, postindex, Rt, Rn, m2))
           else
              Store (StoreByteUnprivileged (add, postindex, Rt, Rn, m1))
        }
        else
           Skip ()

     -- 68 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STR<c> <Rt>, [<Rn>, #-<imm8>]
     -- STR<c> <Rt>, [<Rn>], #+/-<imm8>
     -- STR<c> <Rt>, [<Rn>, #+/-<imm8>]!
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 0000100 : Rn', 'Rt : 1 : P : U : W : imm8' =>
        if Do (ThumbCondition(),
                 Rn <> 15 and (P == '1' or W == '1') and HaveThumb2()) then
        {  wback = W == 1;
           when Rt == 15 or (wback and Rn == Rt) do
              DECODE_UNPREDICTABLE (mc, "Store (immediate)");
           add = U == 1;
           index = P == 1;
           imm32 = ZeroExtend (imm8);
           m = immediate_form1 (imm32);
           Store (StoreWord (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 69 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRB<c> <Rt>, [<Rn>, #-<imm8>]
     -- STRB<c> <Rt>, [<Rn>], #+/-<imm8>
     -- STRB<c> <Rt>, [<Rn>, #+/-<imm8>]!
     -- STRH<c> <Rt>, [<Rn>, #-<imm8>]
     -- STRH<c> <Rt>, [<Rn>], #+/-<imm8>
     -- STRH<c> <Rt>, [<Rn>, #+/-<imm8>]!
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00000 : H : 0 : Rn', 'Rt : 1 : P : U : W : imm8' =>
        if Do (ThumbCondition(),
                 Rn <> 15 and (P == '1' or W == '1') and HaveThumb2()) then
        {  wback = W == 1;
           when Rt in set {13, 15} or (wback and Rn == Rt) do
              DECODE_UNPREDICTABLE (mc, "StoreByte/Half (immediate)");
           add = U == 1;
           index = P == 1;
           imm32 = ZeroExtend (imm8);
           m = immediate_form1 (imm32);
           if H == 1 then
              Store (StoreHalf (add, index, wback, Rt, Rn, m))
           else
              Store (StoreByte (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 70 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STR<c>.W <Rt>, [<Rn>{, #<imm12>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 0001100 : Rn', 'Rt : imm12' =>
        if Do (ThumbCondition(), Rn <> 15 and HaveThumb2()) then
        {  when Rt == 15 do
              DECODE_UNPREDICTABLE (mc, "Store (immediate)");
           add = true;
           index = true;
           wback = false;
           imm32 = ZeroExtend (imm12);
           m = immediate_form1 (imm32);
           Store (StoreWord (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 71 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- STRB<c> <Rt>, [<Rn>{, #<imm12>}]
     -- STRH<c> <Rt>, [<Rn>{, #<imm12>}]
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 00010 : H : 0 : Rn', 'Rt : imm12' =>
        if Do (ThumbCondition(), Rn <> 15 and HaveThumb2()) then
        {  when Rt in set {13, 15} do
              DECODE_UNPREDICTABLE (mc, "StoreByte/Half (immediate)");
           add = true;
           index = true;
           wback = false;
           imm32 = ZeroExtend (imm12);
           m = immediate_form1 (imm32);
           if H == 1 then
              Store (StoreHalf (add, index, wback, Rt, Rn, m))
           else
              Store (StoreByte (add, index, wback, Rt, Rn, m))
        }
        else
           Skip ()

     -- 72 ~~~~~~~~~~~~~~~~~~~~~~~~~
     -- LSL{S}<c>.W <Rd>, <Rn>, <Rm>
     -- LSR{S}<c>.W <Rd>, <Rn>, <Rm>
     -- ASR{S}<c>.W <Rd>, <Rn>, <Rm>
     -- ROR{S}<c>.W <Rd>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 0100 : op`2 : S : Rn', '1111 : Rd : 0000 : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} or Rn in set {13,15} or Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "Shift (register)");
           setflags = S == 1;
           shift_t = DecodeRegShift (op);
           Data (ShiftRegister (false, setflags, Rd, Rn, shift_t, Rm))
        }
        else
           Skip ()

     -- 73 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- SXTAH<c> <Rd>, <Rn>, <Rm>{, <rotation>}
     -- UXTAH<c> <Rd>, <Rn>, <Rm>{, <rotation>}
     -- SXTH<c> <Rd>, <Rm>{, <rotation>}
     -- UXTH<c> <Rd>, <Rm>{, <rotation>}
     -- SXTAB16<c> <Rd>, <Rn>, <Rm>{, <rotation>}
     -- UXTAB16<c> <Rd>, <Rn>, <Rm>{, <rotation>}
     -- SXTB16<c> <Rd>, <Rm>{, <rotation>}
     -- UXTB16<c> <Rd>, <Rm>{, <rotation>}
     -- SXTAB<c> <Rd>, <Rn>, <Rm>{, <rotation>}
     -- UXTAB<c> <Rd>, <Rn>, <Rm>{, <rotation>}
     -- SXTB<c> <Rd>, <Rm>{, <rotation>}
     -- UXTB<c> <Rd>, <Rm>{, <rotation>}
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 0100 : op`2 : U : Rn', '1111 : Rd : 1 (0) : rotate`2 : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} or Rn == 13 or Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "Extend (register)");
           unsigned = U == 1;
           rotation = [rotate : '000'];
           args = unsigned, Rd, Rn, Rm, rotation;
           match op
           { case '00' => Media (ExtendHalfword (args))
             case '01' => Media (ExtendByte16 (args))
             case '10' => Media (ExtendByte (args))
             case '11' => Undefined (0)
           }
        }
        else
           Skip ()

     -- 74 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- Parallel addition and subtraction
     -- <opc><c> <Rd>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 0101 : op1`3 : Rn', '1111 : Rd : 0 : U : op2`2 : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} or Rn in set {13,15} or Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "Parallel addition and subtraction");
           opc = match op1
                 { case '001' => '000'
                   case '010' => '001'
                   case '110' => '010'
                   case '101' => '011'
                   case '000' => '100'
                   case '100' => '111'
                   case _     => '101'
                 };
           DecodeParallelAdditionSubtraction (op2 + 1, opc, U, Rd, Rn, Rm)
        }
        else
           Skip ()

     -- 75 ~~~~~~~~~~~~~~~~~~~~~~
     -- QADD<c> <Rd>, <Rm>, <Rn>
     -- QSUB<c> <Rd>, <Rm>, <Rn>
     -- QDADD<c> <Rd>, <Rm>, <Rn>
     -- QDSUB<c> <Rd>, <Rm>, <Rn>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 0101000 : Rn', '1111 : Rd : 10 : op2`2 : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} or Rn in set {13,15} or Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "SaturatingAddSubtract");
           opc = Reverse (op2);
           Media (SaturatingAddSubtract (opc, Rd, Rm, Rn))
        }
        else
           Skip ()

     -- 76 ~~~~~~~~~~~~~~~~~~
     -- REV<c>.W <Rd>, <Rm>
     -- REV16<c>.W <Rd>, <Rm>
     -- RBIT<c> <Rd>, <Rm>
     -- REVSH<c>.W <Rd>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~
     case '11111 0101001 : Rn', '1111 : Rd : 10 : op2`2 : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rn <> Rm or Rd in set {13,15} or Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "Reverses");
           match op2
           { case '00' => Media (ByteReverse (Rd, Rm))
             case '01' => Media (ByteReversePackedHalfword (Rd, Rm))
             case '10' => Media (ReverseBits (Rd, Rm))
             case '11' => Media (ByteReverseSignedHalfword (Rd, Rm))
           }
        }
        else
           Skip ()

     -- 77 ~~~~~~~~~~~~~~~~~~~~
     -- SEL<c> <Rd>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 0101010 : Rn', '1111 : Rd : 1000 : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} or Rn in set {13,15} or Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "SelectBytes");
           Media (SelectBytes (Rd, Rn, Rm))
        }
        else
           Skip ()

     -- 78 ~~~~~~~~~~~~~~
     -- CLZ<c> <Rd>, <Rm>
     -- ~~~~~~~~~~~~~~~~~
     case '11111 0101011 : Rn', '1111 : Rd : 1000 : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rn <> Rm or Rd in set {13,15} or Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "CountLeadingZeroes");
           Data (CountLeadingZeroes (Rd, Rm))
        }
        else
           Skip ()

     -- 79 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- Multiply, multiply accumulate, and absolute difference
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 0110 : opc`3 : Rn', 'Ra : Rd : 00 : N : M : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when Rd in set {13,15} or Rn in set {13,15} or Rm in set {13,15} or
                Ra == 13 do
              DECODE_UNPREDICTABLE (mc, "Multiplies and absolute difference");
           match opc, Ra, N == 1, M == 1
           { case '000', '1111', false, false =>
               Multiply (Multiply32 (false, Rd, Rn, Rm))
             case '000', _, false, false =>
               Multiply (MultiplyAccumulate (false, Rd, Rn, Rm, Ra))
             case '000', '1111', false, true =>
               {  DECODE_UNPREDICTABLE (mc, "MultiplySubtract"); UNKNOWN }
             case '000', _, false, true =>
               Multiply (MultiplySubtract (Rd, Rn, Rm, Ra))
             case '001', '1111', n_high, m_high =>
               Multiply (Signed16Multiply32Result (m_high, n_high, Rd, Rn, Rm))
             case '001', _, n_high, m_high =>
               Multiply
                 (Signed16Multiply32Accumulate (m_high, n_high, Rd, Rn, Rm, Ra))
             case '010', _, false, m_swap =>
               Multiply (SignedMultiplyDual (false, m_swap, Rd, Rn, Rm, Ra))
             case '011', '1111', false, m_high =>
               Multiply (Signed16x32Multiply32Result (m_high, Rd, Rn, Rm))
             case '011', _, false, m_high =>
               Multiply
                 (Signed16x32Multiply32Accumulate (m_high, Rd, Rn, Rm, Ra))
             case '100', _, false, m_swap =>
               Multiply (SignedMultiplyDual (true, m_swap, Rd, Rn, Rm, Ra))
             case '101', _, false, round =>
               Multiply (SignedMostSignificantMultiply (round, Rd, Rn, Rm, Ra))
             case '110', '1111', false, _ =>
               { DECODE_UNPREDICTABLE
                    (mc, "SignedMostSignificantMultiplySubtract"); UNKNOWN }
             case '110', _, false, round =>
               Multiply
                 (SignedMostSignificantMultiplySubtract (round, Rd, Rn, Rm, Ra))
             case '111', _, false, false =>
               SIMD (UnsignedSumAbsoluteDifferences (Rd, Rn, Rm, Ra))
             case _ => Undefined (0)
           }
        }
        else
           Skip ()

     -- 80 ~~~~~~~~~~~~~~~~~~~~~
     -- SDIV<c> <Rd>, <Rn>, <Rm>
     -- UDIV<c> <Rd>, <Rn>, <Rm>
     -- ~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 01110 : U : 1 : Rn', '(1111) : Rd : 1111 : Rm' =>
        if Do (ThumbCondition(),
                 HaveVirtExt() or Architecture == ARMv7_R) then
        {  when Rd in set {13,15} or Rn in set {13,15} or Rm in set {13,15} do
              DECODE_UNPREDICTABLE (mc, "Divide");
           unsigned = U == 1;
           Divide (unsigned, Rd, Rn, Rm)
        }
        else
           Skip ()

     -- 81 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     -- Long multiply, long multiply accumulate
     -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     case '11111 0111 : op1`3 : Rn', 'RdLo : RdHi : op2`4 : Rm' =>
        if Do (ThumbCondition(), HaveThumb2()) then
        {  when RdLo in set {13,15} or RdHi in set {13,15} or
                Rn in set {13,15} or Rm in set {13,15} or RdHi == RdLo do
              DECODE_UNPREDICTABLE
                (mc, "Long multiply, long multiply accumulate");
           match op1, op2
           { case 'A : U : 0', '0000' =>
               {  accumulate = A == 1;
                  signed = U == 0;
                  Multiply (MultiplyLong
                     (accumulate, signed, false, RdHi, RdLo, Rn, Rm))
               }
             case '100', '10 : N : M' =>
               {  n_high = N == 1;
                  m_high = M == 1;
                  Multiply (Signed16Multiply64Accumulate
                     (m_high, n_high, RdHi, RdLo, Rn, Rm))
               }
             case '10 : S', '11 0 : M' =>
               {  sub = S == 1;
                  m_swap = M == 1;
                  Multiply (SignedMultiplyLongDual
                     (sub,  m_swap, RdHi, RdLo, Rn, Rm))
               }
             case '110', '0110' =>
               Multiply (MultiplyAccumulateAccumulate (RdHi, RdLo, Rn, Rm))
             case _ => Undefined (0)
           }
        }
        else
           Skip ()

     -- 82 ~~~~~~~~~~~~
     -- Everything else
     -- ~~~~~~~~~~~~~~~

     case _ => UndefinedThumb()
   }
}

clear patterns

------------
-- Top-level
------------

instruction Decode (mc::MachineCode) =
   match mc
   {
     case ARM (w) => DecodeARM (w)
     case Thumb (h) => DecodeThumb (h)
     case ThumbEE (h) => DecodeThumbEE (h)
     case Thumb2 (hs) => DecodeThumb2 (hs)
     case BadCode (s) => #UNPREDICTABLE (s)
   }

unit Next = { Run (Decode (Fetch)); ITAdvance() }

unit NextN (n::nat) = when 0 < n and not undefined do { Next; NextN (n - 1) }
