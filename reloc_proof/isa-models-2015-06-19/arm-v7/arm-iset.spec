-----------------------------------------------------------------------
-- Formal Specification of the ARMv7-AR instruction set architecture --
-- (c) Anthony Fox, University of Cambridge                          --
-----------------------------------------------------------------------

-- Instruction semantics

-- ~~~~~~~~~~~~~~~~~~~
-- T,A: B<c>   <label>
-- T2:  B<c>.W <label>
-- ~~~~~~~~~~~~~~~~~~~

define Branch > BranchTarget
   ( imm32 :: bits(32) )
   =
   BranchWritePC (PC + imm32)

-- ~~~~~~~~~~~~~~~
-- T,A: BX<c> <Rm>
-- ~~~~~~~~~~~~~~~

define Branch > BranchExchange
   ( m :: reg )
   =
   BXWritePC (R (m))

-- ~~~~~~~~~~~~~~~~~~~
-- T,A: BL<c>  <label>
-- T,A: BLX<c> <label>
-- ~~~~~~~~~~~~~~~~~~~

define Branch > BranchLinkExchangeImmediate
   ( targetInstrSet :: InstrSet,
     imm32          :: bits(32) )
   =
{  if CurrentInstrSet() == InstrSet_ARM then
      LR <- PC - 4
   else
      LR <- PC<31:1> : '1';
   targetAddress = if targetInstrSet == InstrSet_ARM then
                      Align (PC, 4) + imm32
                   else
                      PC + imm32;
   SelectInstrSet (targetInstrSet);
   BranchWritePC (targetAddress)
}

-- ~~~~~~~~~~~~~~~~
-- T,A: BLX<c> <Rm>
-- ~~~~~~~~~~~~~~~~

define Branch > BranchLinkExchangeRegister
   ( m :: reg )
   =
{  target = R(m);
   if CurrentInstrSet() == InstrSet_ARM then
   {  next_instr_addr = PC - 4;
      LR <- next_instr_addr
   }
   else
   {  next_instr_addr = PC - 2;
      LR <- next_instr_addr<31:1> : '1'
   };
   BXWritePC (target)
}

-- ~~~~~~~~~~~~~~~~~~~~~~~
-- T: CB{N}Z <Rn>, <label>
-- ~~~~~~~~~~~~~~~~~~~~~~~

define Branch > CompareBranch
   ( nonzero :: bool,
     n       :: reg,
     imm32   :: word )
   =
   if nonzero <> R(n) == 0 then
      BranchWritePC (PC + imm32)
   else
      IncPC()

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: TBH<c> [<Rn>, <Rm>, LSL #1]
-- T2: TBB<c> [<Rn>, <Rm>]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Branch > TableBranchByte
   ( is_tbh :: bool,
     m      :: reg,
     n      :: reg )
   =
   when NullCheckIfThumbEE(n) do
   {  halfwords = if is_tbh then
                     MemU (R(n) + LSL (R(m), 1), 2)::half
                  else
                     MemU (R(n) + R(m), 1);
      BranchWritePC (PC + 2 * [halfwords])
   }

-- ~~~~~~~~~~~~~~~~~~~~~~
-- TX: CHKA<c> <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~

define Branch > CheckArray
      ( m :: reg,
        n :: reg )
   =
   if R(n) <=+ R(m) then
   {  LR <- PC<31:1> : '1';
      ITSTATE <- 0b00000000;
      BranchWritePC (CP14.TEEHBR - 8)
   }
   else
      IncPC()

-- ~~~~~~~~~~~~~~~~~~~~~~~~~
-- TX: HB{L}<c> #<HandlerID>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~

define Branch > HandlerBranchLink
   ( generate_link  :: bool,
     handler_offset :: word )
   =
{  when generate_link do
   {  next_instr_addr = PC - 2;
      LR <- next_instr_addr<31:1> : '1'
   };
   BranchWritePC (CP14.TEEHBR + handler_offset)
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- TX: HBLP<c> #<imm>, #<HandlerID>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Branch > HandlerBranchLinkParameter
   ( imm32          :: word,
     handler_offset :: word )
   =
{  R(8) <- imm32;
   next_instr_addr = PC - 2;
   LR <- next_instr_addr<31:1> : '1';
   BranchWritePC (CP14.TEEHBR + handler_offset)
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- TX: HBP<c> #<imm>, #<HandlerID>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Branch > HandlerBranchParameter
   ( imm32          :: word,
     handler_offset :: word )
   =
{  R(8) <- imm32;
   BranchWritePC (CP14.TEEHBR + handler_offset)
}

-- ~~~~~~~~~~
-- T2: ENTERX
-- T2: LEAVEX
-- ~~~~~~~~~~

define System > EnterxLeavex
   ( is_enterx :: bool )
   =
   if is_enterx then
      if CurrentModeIsHyp() then
         TakeUndefInstrException()
      else
      {  SelectInstrSet (InstrSet_ThumbEE);
         IncPC()
      }
   else
   {  SelectInstrSet (InstrSet_Thumb);
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T: IT{<x>{<y>{<z>}}} <firstcond>
-- where <x>, <y> and <z> are T or E
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define IfThen
   ( firstcond :: bits(4),
     mask      :: bits(4) )
   =
{  CPSR.IT <- firstcond : mask;
   IncPC();
   Encoding <- Encoding_ARM -- this prevents ITSTATE from being advanced
                            -- before the next instruction is run
}

-- ~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: CLZ<c> <Rd>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~

define Data > CountLeadingZeroes
   ( d :: reg,
     m :: reg )
   =
{  R(d) <- [CountLeadingZeroBits (R(m))];
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: MOVT<c> <Rd>, #<imm16>
-- T2,A: MOVW<c> <Rd>, #<imm16>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Data > MoveHalfword
   ( high  :: bool,
     d     :: reg,
     imm16 :: bits(16) )
   =
{  if high then
      R(d)<31:16> <- imm16
      -- R(d)<15:0> unchanged
   else
      R(d) <- ZeroExtend (imm16);
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- For opc in {AND,EOR,ADC,SBC,ORR,BIC,ADD,SUB,RSB,RSC,ORN}
-- T,T2,A: <opc>{S}<c>{.W} <Rd>, <Rn>, #<const>
-- T,T2,A: <opc>{S}<c>{.W} <Rd>, <Rn>, <Rm>
-- T2,A:   <opc>{S}<c>{.W} <Rd>, <Rn>, <Rm>, <shift>
--
-- For opc in {MOV,MVN}
-- T,T2,A: <opc>{S}<c>{.W} <Rd>, #<const>
-- T,T2,A: <opc>{S}<c>{.W} <Rd>, <Rm>
-- T2,A:   <opc>{S}<c>{.W} <Rd>, <Rm>, <shift>
--
-- For opc in {TST,CMN,TEQ,CMP}
-- T,T2,A: <opc><c>{.W} <Rn>, #<const>
-- T,T2,A: <opc><c>{.W} <Rn>, <Rm>
-- T2,A:   <opc><c>{.W} <Rn>, <Rm>, <shift>
--
-- For opc in {LSL,LSR,ASR,ROR}
-- T,T2,A: <opc>S{.W} <Rd>, <Rm>, #<const>
-- T,T2,A: <opc>S{.W} <Rd>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- - - - -
-- d <> 15
-- - - - -

unit DataProcessing
   ( opc      :: bits(4),
     setflags :: bool,
     d        :: reg,
     n        :: reg,
     imm32    :: word,
     C        :: bool )
   =
{  rn = if opc == 0b1101 or -- MOV
           opc == 0b1111 and n == 15 -- MVN
           then 0
        else if opc in set {0b0100, 0b0010} and n == 15 and not setflags
           then Align (PC, 4)
        else R(n);

   result, carry, overflow = DataProcessingALU (opc, rn, imm32, CPSR.C);

   when opc<3:2> != 0b10 do
      R(d) <- result;

   when setflags do
   {  CPSR.N <- result<31>;
      CPSR.Z <- result == 0;
      if ArithmeticOpcode (opc) then
      {
         CPSR.C <- carry;
         CPSR.V <- overflow
      }
      else
         CPSR.C <- C
   };

   IncPC()
}

-- - - - -
-- d == 15
-- - - - -

unit DataProcessingPC
   ( opc      :: bits(4),
     setflags :: bool,
     n        :: reg,
     imm32    :: word )
   =
{  rn = if opc == 0b1101 or -- MOV
           opc == 0b1111 and n == 15 -- MVN
           then 0
        else if opc in set {0b0100, 0b0010} and n == 15 and not setflags
           then Align (PC, 4)
        else R(n);

   result, _, _ = DataProcessingALU (opc, rn, imm32, CPSR.C);

   if setflags then
   {  if CurrentModeIsHyp() then
         TakeUndefInstrException()
      else if CurrentModeIsUserOrSystem() then
         #UNPREDICTABLE("DataProcessingPC")
      else
      {  CPSRWriteByInstr (&SPSR, 0b1111, true);
         -- Return to Hyp mode in ThumbEE is UNPREDICTABLE
         if CPSR.M == 0b11010 and
            CurrentInstrSet() == InstrSet_ThumbEE then
            #UNPREDICTABLE("DataProcessingPC")
         else
            BranchWritePC (result)
      }
   }
   else
      ALUWritePC (result)
}

-- - - - - - - - - -
-- Immediate Operand
-- - - - - - - - - -

define Data > Move
   ( setflags :: bool,
     negate   :: bool,
     d        :: reg,
     imm12    :: bits(12) )
   =
{  opc = '11' : [negate]`1 : '1';
   imm32, carry = ExpandImm_C (imm12, CPSR.C);
   if d == 15 then
      DataProcessingPC (opc, setflags, 15, imm32)
   else
      DataProcessing (opc, setflags, d, 15, imm32, carry)
}

define Data > TestCompareImmediate
   ( op       :: bits(2),
     n        :: reg,
     imm12    :: bits(12) )
   =
{  imm32, carry = ExpandImm_C (imm12, CPSR.C);
   DataProcessing ('10' : op, true, UNKNOWN, n, imm32, carry)
}

define Data > ArithLogicImmediate
   ( opc      :: bits(4),
     setflags :: bool,
     d        :: reg,
     n        :: reg,
     imm12    :: bits(12) )
   =
{  imm32, carry = ExpandImm_C (imm12, CPSR.C);
   if d == 15 then
      DataProcessingPC (opc, setflags, n, imm32)
   else
      DataProcessing (opc, setflags, d, n, imm32, carry)
}

-- - - - - - - - - -
-- Register Operand
-- - - - - - - - - -

unit doRegister
   ( opc      :: bits(4),
     setflags :: bool,
     d        :: reg,
     n        :: reg,
     m        :: reg,
     shift_t  :: SRType,
     shift_n  :: nat )
   =
{  shifted, carry = Shift_C (R(m), shift_t, shift_n, CPSR.C);
   if d == 15 then
      DataProcessingPC (opc, setflags, n, shifted)
   else
      DataProcessing (opc, setflags, d, n, shifted, carry)
}

define Data > Register
   ( opc      :: bits(4),
     setflags :: bool,
     d        :: reg,
     n        :: reg,
     m        :: reg,
     shift_t  :: SRType,
     shift_n  :: nat )
   =
   doRegister (opc, setflags, d, n, m, shift_t, shift_n)

-- - - - - - - - - - - - - - - -
-- TST, TEQ, CMP, CMN (register)
-- - - - - - - - - - - - - - - -

define Data > TestCompareRegister
   ( opc      :: bits(2),
     n        :: reg,
     m        :: reg,
     shift_t  :: SRType,
     shift_n  :: nat )
   =
   doRegister ('10' : opc, true, 0, n, m, shift_t, shift_n)

-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- MOV, MVN (register), LSL, LSR, ASR, ROR (immediate)
-- - - - - - - - - - - - - - - - - - - - - - - - - - -

define Data > ShiftImmediate
   ( negate   :: bool,
     setflags :: bool,
     d        :: reg,
     m        :: reg,
     shift_t  :: SRType,
     shift_n  :: nat )
   =
   if negate then
      doRegister (0b1111, setflags, d, 15, m, shift_t, shift_n)
   else
      doRegister (0b1101, setflags, d, UNKNOWN, m, shift_t, shift_n)

-- - - - - - - - - - - - - - - - - -
-- Register-Shifted-Register Operand
-- - - - - - - - - - - - - - - - - -

unit doRegisterShiftedRegister
   ( opc      :: bits(4),
     setflags :: bool,
     d        :: reg,
     n        :: reg,
     m        :: reg,
     shift_t  :: SRType,
     s        :: reg )
   =
{  shifted, carry = Shift_C (R(m), shift_t, [R(s)<7:0>], CPSR.C);
   DataProcessing (opc, setflags, d, n, shifted, carry)
}

define Data > RegisterShiftedRegister
   ( opc      :: bits(4),
     setflags :: bool,
     d        :: reg,
     n        :: reg,
     m        :: reg,
     shift_t  :: SRType,
     s        :: reg )
   =
   doRegisterShiftedRegister (opc, setflags, d, n, m, shift_t, s)

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- MVN (register-shifted register), LSL, LSR, ASR, ROR (register)
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

define Data > ShiftRegister
   ( negate   :: bool,
     setflags :: bool,
     d        :: reg,
     n        :: reg,
     shift_t  :: SRType,
     m        :: reg )
   =
   if negate then
      doRegisterShiftedRegister (0b1111, setflags, d, 15, n, shift_t, m)
   else
      doRegisterShiftedRegister (0b1101, setflags, d, UNKNOWN, n, shift_t, m)

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ADDW<c> <Rd>, <Rn>, #<imm12>
-- SUBW<c> <Rd>, <Rn>, #<imm12>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Data > AddSub
   ( sub      :: bool,
     d        :: reg,
     n        :: reg,
     imm12    :: bits(12) )
   =
{  opc = if sub then '0010' else '0100';
   imm32 = ZeroExtend (imm12);
   DataProcessing (opc, false, d, n, imm32, UNKNOWN)
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: QADD<c> <Rd>, <Rm>, <Rn>  ; opc = 0
-- T2,A: QSUB<c> <Rd>, <Rm>, <Rn>  ; opc = 1
-- T2,A: QDADD<c> <Rd>, <Rm>, <Rn> ; opc = 2
-- T2,A: QDSUB<c> <Rd>, <Rm>, <Rn> ; opc = 3
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Media > SaturatingAddSubtract
   ( opc :: bits(2),
     d   :: reg,
     m   :: reg,
     n   :: reg )
   =
{  var result;
   var sat;
   match opc
   { case '00' => { r, s = SignedSatQ ([R(m)] + [R(n)], 32);
                    result <- r;
                    sat <- s
                  }
     case '01' => { r, s = SignedSatQ ([R(m)] - [R(n)], 32);
                    result <- r;
                    sat <- s
                  }
     case '10' => { doubled::word, sat1 = SignedSatQ (2 * [R(n)], 32);
                    r, sat2 = SignedSatQ ([R(m)] + [doubled], 32);
                    result <- r;
                    sat <- sat1 or sat2
                  }
     case '11' => { doubled::word, sat1 = SignedSatQ (2 * [R(n)], 32);
                    r, sat2 = SignedSatQ ([R(m)] - [doubled], 32);
                    result <- r;
                    sat <- sat1 or sat2
                  }
   };
   R(d) <- result;
   when sat do
     CPSR.Q <- true;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T:  MULS      <Rdm>, <Rn>, <Rdm>     (Outside IT block)
-- T:  MUL<c>    <Rdm>, <Rn>, <Rdm>     (Inside IT block)
-- T2: MUL<c>    <Rd>, <Rn>, <Rm>
-- A:  MUL{S}<c> <Rd>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > Multiply32
   ( setflags   :: bool,
     d          :: reg,
     n          :: reg,
     m          :: reg )
   =
{  rn = R(n);
   rm = R(m);
   result = rn * rm;
   R(d) <- result;
   when setflags do
   {  CPSR.N <- result<31>;
      CPSR.Z <- result == 0;
      when ArchVersion() == 4 do
         CPSR.C <- UNKNOWN(rn,rm,CPSR.C)
   };
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: MLA<c>    <Rd>, <Rn>, <Rm>, <Ra>
-- A:  MLA{S}<c> <Rd>, <Rn>, <Rm>, <Ra>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > MultiplyAccumulate
   ( setflags   :: bool,
     d          :: reg,
     n          :: reg,
     m          :: reg,
     a          :: reg )
   =
{  rn = R(n);
   rm = R(m);
   ra = R(a);
   result = rn * rm + ra;
   R(d) <- result;
   when setflags do
   {  CPSR.N <- result<31>;
      CPSR.Z <- result == 0;
      when ArchVersion() == 4 do
         CPSR.C <- UNKNOWN(rn,rm,ra,CPSR.C)
   };
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: UMULL<c>    <RdLo>, <RdHi>, <Rn>, <Rm>
-- A:  UMULL{S}<c> <RdLo>, <RdHi>, <Rn>, <Rm>
-- T2: UMLAL<c>    <RdLo>, <RdHi>, <Rn>, <Rm>
-- A:  UMLAL{S}<c> <RdLo>, <RdHi>, <Rn>, <Rm>
-- T2: SMULL<c>    <RdLo>, <RdHi>, <Rn>, <Rm>
-- A:  SMULL{S}<c> <RdLo>, <RdHi>, <Rn>, <Rm>
-- T2: SMLAL<c>    <RdLo>, <RdHi>, <Rn>, <Rm>
-- A:  SMLAL{S}<c> <RdLo>, <RdHi>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > MultiplyLong
   ( accumulate :: bool,
     signed     :: bool,
     setflags   :: bool,
     dhi        :: reg,
     dlo        :: reg,
     n          :: reg,
     m          :: reg )
   =
{  rn = R(n);
   rm = R(m);
   rdhi = R(dhi);
   rdlo = R(dlo);
   result = (if signed then
                SignExtend (rn) * SignExtend (rm)
             else
                ZeroExtend (rn) * ZeroExtend (rm)) +
            (if accumulate then rdhi : rdlo else 0) :: bits(64);
   R(dhi) <- result<63:32>;
   R(dlo) <- result<31:0>;
   when setflags do
   {  CPSR.N <- result<63>;
      CPSR.Z <- result == 0;
      when ArchVersion() == 4 do
      {  CPSR.C <- UNKNOWN(rn,rm,rdhi,rdlo,CPSR.C);
         CPSR.V <- UNKNOWN(rn,rm,rdhi,rdlo,CPSR.V)
      }
   };
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: UMAAL<c> <RdLo>, <RdHi>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > MultiplyAccumulateAccumulate
   ( dhi :: reg,
     dlo :: reg,
     n   :: reg,
     m   :: reg )
   =
{  result = ZeroExtend (R(n)) * ZeroExtend (R(m)) +
            ZeroExtend (R(dhi)) + ZeroExtend (R(dlo)) :: bits(64);
   R(dhi) <- result<63:32>;
   R(dlo) <- result<31:0>;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: MLS<c> <Rd>, <Rn>, <Rm>, <Ra>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > MultiplySubtract
   ( d :: reg,
     n :: reg,
     m :: reg,
     a :: reg )
   =
{  R(d) <- R(a) - R(m) * R(n);
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SMLA<x><y><c> <Rd>, <Rn>, <Rm>, <Ra>
-- where <x> and <y> are T (top) or B (bottom)
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > Signed16Multiply32Accumulate
   ( m_high :: bool,
     n_high :: bool,
     d      :: reg,
     n      :: reg,
     m      :: reg,
     a      :: reg )
   =
{  operand1 = if n_high then R(n)<31:16> else R(n)<15:0>;
   operand2 = if m_high then R(m)<31:16> else R(m)<15:0>;
   result = [operand1] * [operand2] + [R(a)] :: int;
   result32 = [result];
   R(d) <- result32;
   when result != [result32] do
     CPSR.Q <- true;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SMUL<x><y><c> <Rd>, <Rn>, <Rm>
-- where <x> and <y> are T (top) or B (bottom)
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > Signed16Multiply32Result
   ( m_high :: bool,
     n_high :: bool,
     d      :: reg,
     n      :: reg,
     m      :: reg )
   =
{  operand1 = if n_high then R(n)<31:16> else R(n)<15:0>;
   operand2 = if m_high then R(m)<31:16> else R(m)<15:0>;
   result = [operand1] * [operand2] :: int;
   R(d) <- [result];
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SMLAW<y><c> <Rd>, <Rn>, <Rm>, <Ra>
-- where <y> is T (top) or B (bottom)
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > Signed16x32Multiply32Accumulate
   ( m_high :: bool,
     d      :: reg,
     n      :: reg,
     m      :: reg,
     a      :: reg )
   =
{  operand2 = if m_high then R(m)<31:16> else R(m)<15:0>;
   sh16 = 0i2 ** 16;
   result = ([R(n)] * [operand2] + [R(a)] * sh16) div sh16;
   result32 = [result];
   R(d) <- result32;
   when result != [result32] do
     CPSR.Q <- true;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SMULW<y><c> <Rd>, <Rn>, <Rm>
-- where <y> is T (top) or B (bottom)
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > Signed16x32Multiply32Result
   ( m_high :: bool,
     d      :: reg,
     n      :: reg,
     m      :: reg )
   =
{  operand2 = if m_high then R(m)<31:16> else R(m)<15:0>;
   result = ([R(n)] * [operand2] :: int) div 0i2 ** 16;
   R(d) <- [result];
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SMLAL<x><y><c> <RdLo>, RdHi>, <Rn>, <Rm>
-- where <x> and <y> are T (top) or B (bottom)
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > Signed16Multiply64Accumulate
   ( m_high :: bool,
     n_high :: bool,
     dhi    :: reg,
     dlo    :: reg,
     n      :: reg,
     m      :: reg )
   =
{  operand1 = if n_high then R(n)<31:16> else R(n)<15:0>;
   operand2 = if m_high then R(m)<31:16> else R(m)<15:0>;
   result = [operand1] * [operand2] + [R(dhi) : R(dlo)] :: int;
   result64 = [result] :: bits(64);
   R(dhi) <- result64<63:32>;
   R(dlo) <- result64<31:0>;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SMUAD{X}<c> <Rd>, <Rn>, <Rm>
-- T2,A: SMUSD{X}<c> <Rd>, <Rn>, <Rm>
-- T2,A: SMLAD{X}<c> <Rd>, <Rn>, <Rm>, <Ra>
-- T2,A: SMLSD{X}<c> <Rd>, <Rn>, <Rm>, <Ra>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > SignedMultiplyDual
   ( sub    :: bool,
     m_swap :: bool,
     d      :: reg,
     n      :: reg,
     m      :: reg,
     a      :: reg )
   =
{  operand2 = if m_swap then ROR (R(m), 16) else R(m);
   product1 = [R(n)<15:0>] * [operand2<15:0>] :: int;
   product2 = [R(n)<31:16>] * [operand2<31:16>] :: int;
   acc = if a == 15 then 0 else R(a);
   result = if sub then
               product1 - product2 + [acc]
            else
               product1 + product2 + [acc];
   result32 = [result];
   R(d) <- result32;
   when result != [result32] do
     CPSR.Q <- true;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SMLALD{X}<c> <RdLo>, <RdHi>, <Rn>, <Rm>
-- T2,A: SMLSLD{X}<c> <RdLo>, <RdHi>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > SignedMultiplyLongDual
   ( sub    :: bool,
     m_swap :: bool,
     dhi    :: reg,
     dlo    :: reg,
     n      :: reg,
     m      :: reg )
   =
{  Rn = R(n);
   operand2 = if m_swap then ROR (R(m), 16) else R(m);
   product1 = [Rn<15:0>] * [operand2<15:0>] :: int;
   product2 = [Rn<31:16>] * [operand2<31:16>] :: int;
   acc = R(dhi) : R(dlo);
   result = if sub then
               product1 - product2 + [acc]
            else
               product1 + product2 + [acc];
   result64 = [result] :: bits(64);
   R(dhi) <- result64<63:32>;
   R(dlo) <- result64<31:0>;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SMMUL{R}<c> <Rd>, <Rn>, <Rm>
-- T2,A: SMMLA{R}<c> <Rd>, <Rn>, <Rm>, <Ra>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > SignedMostSignificantMultiply
   ( round :: bool,
     d     :: reg,
     n     :: reg,
     m     :: reg,
     a     :: reg )
   =
{  acc = if a == 15 then 0 else R(a);
   result = [[acc]`64 << 32] + [R(n)] * [R(m)] :: int;
   result = if round then result + 0x80000000 else result;
   R(d) <- ([result]`64)<63:32>;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SMMLS{R}<c> <Rd>, <Rn>, <Rm>, <Ra>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Multiply > SignedMostSignificantMultiplySubtract
   ( round :: bool,
     d     :: reg,
     n     :: reg,
     m     :: reg,
     a     :: reg )
   =
{  result = [[R(a)]`64 << 32] - [R(n)] * [R(m)] :: int;
   result = if round then result + 0x80000000 else result;
   R(d) <- ([result]`64)<63:32>;
   IncPC()
}


--------------------------
-- Basic SIMD Instructions
--------------------------

-- - - - - - - -
-- Signed 16-bit
-- - - - - - - -

int * int SignedParallelAddSub16 (op::bits(2), n::reg, m::reg) =
{  Rn = R(n);
   Rm = R(m);
   match op
   { case '00' =>
        [Rn<15:0>] + [Rm<15:0>],
        [Rn<31:16>] + [Rm<31:16>]
     case '01' =>
        [Rn<15:0>] - [Rm<31:16>],
        [Rn<31:16>] + [Rm<15:0>]
     case '10' =>
        [Rn<15:0>] + [Rm<31:16>],
        [Rn<31:16>] - [Rm<15:0>]
     case '11' =>
        [Rn<15:0>] - [Rm<15:0>],
        [Rn<31:16>] - [Rm<31:16>]
   }
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SADD16<c> <Rd>, <Rn>, <Rm> ; op = 0
-- T2,A: SASX<c>   <Rd>, <Rn>, <Rm> ; op = 1
-- T2,A: SSAX<c>   <Rd>, <Rn>, <Rm> ; op = 2
-- T2,A: SSUB16<c> <Rd>, <Rn>, <Rm> ; op = 3
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > SignedAddSub16
   ( op :: bits(2),
     d  :: reg,
     n  :: reg,
     m  :: reg )
   =
{  res1, res2 = SignedParallelAddSub16 (op, n, m);
   R(d) <- [res2]::half : [res1];
   CPSR.GE<1:0> <- if res1 >= 0 then 0b11 else 0b00;
   CPSR.GE<3:2> <- if res2 >= 0 then 0b11 else 0b00;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: QADD16<c> <Rd>, <Rn>, <Rm> ; op = 0
-- T2,A: QASX<c>   <Rd>, <Rn>, <Rm> ; op = 1
-- T2,A: QSAX<c>   <Rd>, <Rn>, <Rm> ; op = 2
-- T2,A: QSUB16<c> <Rd>, <Rn>, <Rm> ; op = 3
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > SignedSaturatingAddSub16
   ( op :: bits(2),
     d  :: reg,
     n  :: reg,
     m  :: reg )
   =
{  res1, res2 = SignedParallelAddSub16 (op, n, m);
   R(d) <- SignedSat (res2, 16)::half : SignedSat (res1, 16);
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SHADD16<c> <Rd>, <Rn>, <Rm> ; op = 0
-- T2,A: SHASX<c>   <Rd>, <Rn>, <Rm> ; op = 1
-- T2,A: SHSAX<c>   <Rd>, <Rn>, <Rm> ; op = 2
-- T2,A: SHSUB16<c> <Rd>, <Rn>, <Rm> ; op = 3
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > SignedHalvingAddSub16
   ( op :: bits(2),
     d  :: reg,
     n  :: reg,
     m  :: reg )
   =
{  res1, res2 = SignedParallelAddSub16 (op, n, m);
   R(d) <- [res2 div 2]::half : [res1 div 2];
   IncPC()
}

-- - - - - - - -
-- Signed 8-bit
-- - - - - - - -

int * int * int * int SignedParallelAddSub8 (sub::bool, n::reg, m::reg) =
{  Rn = R(n);
   Rm = R(m);
   if sub then
      [Rn<7:0>] - [Rm<7:0>],
      [Rn<15:8>] - [Rm<15:8>],
      [Rn<23:16>] - [Rm<23:16>],
      [Rn<31:24>] - [Rm<31:24>]
   else
      [Rn<7:0>] + [Rm<7:0>],
      [Rn<15:8>] + [Rm<15:8>],
      [Rn<23:16>] + [Rm<23:16>],
      [Rn<31:24>] + [Rm<31:24>]
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SADD8<c> <Rd>, <Rn>, <Rm>
-- T2,A: SSUB8<c> <Rd>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > SignedAddSub8
   ( sub :: bool,
     d   :: reg,
     n   :: reg,
     m   :: reg )
   =
{  res1, res2, res3, res4 = SignedParallelAddSub8 (sub, n, m);
   R(d) <- [res4]::byte : [res3]::byte : [res2]::byte : [res1];
   CPSR.GE<0> <- res1 >= 0;
   CPSR.GE<1> <- res2 >= 0;
   CPSR.GE<2> <- res3 >= 0;
   CPSR.GE<3> <- res4 >= 0;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: QADD8<c> <Rd>, <Rn>, <Rm>
-- T2,A: QSUB8<c> <Rd>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > SignedSaturatingAddSub8
   ( sub :: bool,
     d   :: reg,
     n   :: reg,
     m   :: reg )
   =
{  res1, res2, res3, res4 = SignedParallelAddSub8 (sub, n, m);
   R(d) <- SignedSat (res4, 8)::byte : SignedSat (res3, 8)::byte :
           SignedSat (res2, 8)::byte : SignedSat (res1, 8);
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SHADD8<c> <Rd>, <Rn>, <Rm>
-- T2,A: SHSUB8<c> <Rd>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > SignedHalvingAddSub8
   ( sub :: bool,
     d   :: reg,
     n   :: reg,
     m   :: reg )
   =
{  res1, res2, res3, res4 = SignedParallelAddSub8 (sub, n, m);
   R(d) <- [res4 div 2]::byte : [res3 div 2]::byte :
           [res2 div 2]::byte : [res1 div 2];
   IncPC()
}

-- - - - - - - - -
-- Unsigned 16-bit
-- - - - - - - - -

int * int UnsignedParallelAddSub16 (op::bits(2), n::reg, m::reg) =
{  Rn = R(n);
   Rm = R(m);
   match op
   { case '00' =>
        UInt (Rn<15:0>) + UInt (Rm<15:0>),
        UInt (Rn<31:16>) + UInt (Rm<31:16>)
     case '01' =>
        UInt (Rn<15:0>) - UInt (Rm<31:16>),
        UInt (Rn<31:16>) + UInt (Rm<15:0>)
     case '10' =>
        UInt (Rn<15:0>) + UInt (Rm<31:16>),
        UInt (Rn<31:16>) - UInt (Rm<15:0>)
     case '11' =>
        UInt (Rn<15:0>) - UInt (Rm<15:0>),
        UInt (Rn<31:16>) - UInt (Rm<31:16>)
   }
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: UADD16<c> <Rd>, <Rn>, <Rm> ; op = 0
-- T2,A: UASX<c>   <Rd>, <Rn>, <Rm> ; op = 1
-- T2,A: USAX<c>   <Rd>, <Rn>, <Rm> ; op = 2
-- T2,A: USUB16<c> <Rd>, <Rn>, <Rm> ; op = 3
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > UnsignedAddSub16
   ( op :: bits(2),
     d  :: reg,
     n  :: reg,
     m  :: reg )
   =
{  res1, res2 = UnsignedParallelAddSub16 (op, n, m);
   R(d) <- [res2]::half : [res1];
   CPSR.GE<1:0> <- if res1 >= (if op in set {1,3} then 0 else 0x10000)
                      then 0b11
                      else 0b00;
   CPSR.GE<3:2> <- if res2 >= (if op in set {2,3} then 0 else 0x10000) then
                      0b11
                   else
                      0b00;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: UQADD16<c> <Rd>, <Rn>, <Rm> ; op = 0
-- T2,A: UQASX<c>   <Rd>, <Rn>, <Rm> ; op = 1
-- T2,A: UQSAX<c>   <Rd>, <Rn>, <Rm> ; op = 2
-- T2,A: UQSUB16<c> <Rd>, <Rn>, <Rm> ; op = 3
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > UnsignedSaturatingAddSub16
   ( op :: bits(2),
     d  :: reg,
     n  :: reg,
     m  :: reg )
   =
{  res1, res2 = UnsignedParallelAddSub16 (op, n, m);
   R(d) <- UnsignedSat (res2, 16)::half : UnsignedSat (res1, 16);
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: UHADD16<c> <Rd>, <Rn>, <Rm> ; op = 0
-- T2,A: UHASX<c>   <Rd>, <Rn>, <Rm> ; op = 1
-- T2,A: UHSAX<c>   <Rd>, <Rn>, <Rm> ; op = 2
-- T2,A: UHSUB16<c> <Rd>, <Rn>, <Rm> ; op = 3
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > UnsignedHalvingAddSub16
   ( op :: bits(2),
     d  :: reg,
     n  :: reg,
     m  :: reg )
   =
{  res1, res2 = UnsignedParallelAddSub16 (op, n, m);
   R(d) <- [res2 div 2]::half : [res1 div 2];
   IncPC()
}

-- - - - - - - - -
-- Unsigned 8-bit
-- - - - - - - - -

int * int * int * int UnsignedParallelAddSub8 (sub::bool, n::reg, m::reg) =
{  Rn = R(n);
   Rm = R(m);
   if sub then
      UInt (Rn<7:0>) - UInt (Rm<7:0>),
      UInt (Rn<15:8>) - UInt (Rm<15:8>),
      UInt (Rn<23:16>) - UInt (Rm<23:16>),
      UInt (Rn<31:24>) - UInt (Rm<31:24>)
   else
      UInt (Rn<7:0>) + UInt (Rm<7:0>),
      UInt (Rn<15:8>) + UInt (Rm<15:8>),
      UInt (Rn<23:16>) + UInt (Rm<23:16>),
      UInt (Rn<31:24>) + UInt (Rm<31:24>)
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: UADD8<c> <Rd>, <Rn>, <Rm>
-- T2,A: USUB8<c> <Rd>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > UnsignedAddSub8
   ( sub :: bool,
     d   :: reg,
     n   :: reg,
     m   :: reg )
   =
{  res1, res2, res3, res4 = UnsignedParallelAddSub8 (sub, n, m);
   R(d) <- [res4]::byte : [res3]::byte : [res2]::byte : [res1];
   ge_lim = if sub then 0 else 0x100;
   CPSR.GE<0> <- res1 >= ge_lim;
   CPSR.GE<1> <- res2 >= ge_lim;
   CPSR.GE<2> <- res3 >= ge_lim;
   CPSR.GE<3> <- res4 >= ge_lim;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: UQADD8<c> <Rd>, <Rn>, <Rm>
-- T2,A: UQSUB8<c> <Rd>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > UnsignedSaturatingAddSub8
   ( sub :: bool,
     d   :: reg,
     n   :: reg,
     m   :: reg )
   =
{  res1, res2, res3, res4 = UnsignedParallelAddSub8 (sub, n, m);
   R(d) <- UnsignedSat (res4, 8)::byte : UnsignedSat (res3, 8)::byte :
           UnsignedSat (res2, 8)::byte : UnsignedSat (res1, 8);
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: UHADD8<c> <Rd>, <Rn>, <Rm>
-- T2,A: UHSUB8<c> <Rd>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > UnsignedHalvingAddSub8
   ( sub :: bool,
     d   :: reg,
     n   :: reg,
     m   :: reg )
   =
{  res1, res2, res3, res4 = UnsignedParallelAddSub8 (sub, n, m);
   R(d) <- [res4 div 2]::byte : [res3 div 2]::byte :
           [res2 div 2]::byte : [res1 div 2];
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: USAD8<c>  <Rd>, <Rn>, <Rm>
-- T2,A: USADA8<c> <Rd>, <Rn>, <Rm>, <Ra>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define SIMD > UnsignedSumAbsoluteDifferences
   ( d :: reg,
     n :: reg,
     m :: reg,
     a :: reg )
   =
{  acc = if a == 15 then 0 else R(a);
   Rn = R(n);
   Rm = R(m);
   absdiff1 = Abs (UInt (Rn<7:0>)   - UInt (Rm<7:0>));
   absdiff2 = Abs (UInt (Rn<15:8>)  - UInt (Rm<15:8>));
   absdiff3 = Abs (UInt (Rn<23:16>) - UInt (Rm<23:16>));
   absdiff4 = Abs (UInt (Rn<31:24>) - UInt (Rm<31:24>));
   result = UInt (acc) + absdiff1 + absdiff2 + absdiff3 + absdiff4;
   R(d) <- [result];
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: SDIV<c> <Rd>, <Rn>, <Rm>
-- T2: UDIV<c> <Rd>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

unit GenerateIntegerZeroDivide() = TakeUndefInstrException()

define Divide
   ( unsigned :: bool,
     d        :: reg,
     n        :: reg,
     m        :: reg )
   =
   if R(m) == 0 then
      if IntegerZeroDivideTrappingEnabled() then
         GenerateIntegerZeroDivide()
      else
      {  R(d) <- 0;
         IncPC()
      }
   else
   {  R(d) <- if unsigned then R(n) div R(m) else R(n) quot R(m);
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: PKHBT<c> <Rd>, <Rn>, <Rm>{, LSL #<imm>}
-- T2,A: PKHTB<c> <Rd>, <Rn>, <Rm>{, ASR #<imm>}
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Media > PackHalfword
   ( shift_t :: SRType,
     shift_n :: nat,
     tbform  :: bool,
     d       :: reg,
     n       :: reg,
     m       :: reg )
   =
{  operand2 = Shift (R(m), shift_t, shift_n, CPSR.C);
   bot = if tbform then operand2<15:0> else R(n)<15:0>;
   top = if tbform then R(n)<31:16> else operand2<31:16>;
   R(d) <- top : bot;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SSAT<c> <Rd>, #<imm>, <Rn>{, <shift>}
-- T2,A: USAT<c> <Rd>, #<imm5>, <Rn>{, <shift>}
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Media > Saturate
   ( shift_t     :: SRType,
     shift_n     :: nat,
     saturate_to :: nat,
     unsigned    :: bool,
     d           :: reg,
     n           :: reg )
   =
{  operand = Shift (R(n), shift_t, shift_n, CPSR.C);
   result, sat = if unsigned then
                    UnsignedSatQ ([operand], saturate_to)
                 else
                    SignedSatQ ([operand], saturate_to);
   R(d) <- if unsigned then result else SignExtendFrom (result, saturate_to);
   when sat do
     CPSR.Q <- true;
   IncPC()
}


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SSAT16<c> <Rd>, #<imm>, <Rn>
-- T2,A: USAT16<c> <Rd>, #<imm>, <Rn>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Media > Saturate16
   ( saturate_to :: nat,
     unsigned    :: bool,
     d           :: reg,
     n           :: reg )
   =
{  Rn = R(n);
   (result1::half, sat1), (result2, sat2) =
      if unsigned then
         UnsignedSatQ ([Rn<15:0>], saturate_to),
         UnsignedSatQ ([Rn<31:16>], saturate_to)
      else
         SignedSatQ ([Rn<15:0>], saturate_to),
         SignedSatQ ([Rn<31:16>], saturate_to);
   R(d) <- if unsigned then
              result2 : result1
           else
              SignExtendFrom (result2, saturate_to) :
              SignExtendFrom (result1, saturate_to);
   when sat1 or sat2 do
     CPSR.Q <- true;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T:    SXTB<c>   <Rd>, <Rm>
-- T:    UXTB<c>   <Rd>, <Rm>
-- T2:   SXTB<c>.W <Rd>, <Rm>{, <rotation>}
-- T2:   UXTB<c>.W <Rd>, <Rm>{, <rotation>}
-- A:    SXTB<c>   <Rd>, <Rm>{, <rotation>}
-- A:    UXTB<c>   <Rd>, <Rm>{, <rotation>}
-- T2,A: SXTAB<c>  <Rd>, <Rn>, <Rm>{, <rotation>}
-- T2,A: UXTAB<c>  <Rd>, <Rn>, <Rm>{, <rotation>}
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Media > ExtendByte
   ( unsigned :: bool,
     d        :: reg,
     n        :: reg,
     m        :: reg,
     rotation :: nat )
   =
{  acc = if n == 15 then 0 else R(n);
   rotated = ROR (R(m), rotation);
   R(d) <- acc + Extend (unsigned, rotated<7:0>);
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SXTB16<c>  <Rd>, <Rm>{, <rotation>}
-- T2,A: UXTB16<c>  <Rd>, <Rm>{, <rotation>}
-- T2,A: SXTAB16<c> <Rd>, <Rn>, <Rm>{, <rotation>}
-- T2,A: UXTAB16<c> <Rd>, <Rn>, <Rm>{, <rotation>}
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Media > ExtendByte16
   ( unsigned :: bool,
     d        :: reg,
     n        :: reg,
     m        :: reg,
     rotation :: nat )
   =
{  acc = if n == 15 then 0 else R(n);
   rotated = ROR (R(m), rotation);
   r1 = acc<15:0> + Extend (unsigned, rotated<7:0>);
   r2 = acc<31:16> + Extend (unsigned, rotated<23:16>);
   R(d) <- r2 : r1;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T:    SXTH<c>   <Rd>, <Rm>
-- T:    UXTH<c>   <Rd>, <Rm>
-- T2:   SXTH<c>.W <Rd>, <Rm>{, <rotation>}
-- T2:   UXTH<c>.W <Rd>, <Rm>{, <rotation>}
-- A:    SXTH<c>   <Rd>, <Rm>{, <rotation>}
-- A:    UXTH<c>   <Rd>, <Rm>{, <rotation>}
-- T2,A: SXTAH<c>  <Rd>, <Rn>, <Rm>{, <rotation>}
-- T2,A: UXTAH<c>  <Rd>, <Rn>, <Rm>{, <rotation>}
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Media > ExtendHalfword
   ( unsigned :: bool,
     d        :: reg,
     n        :: reg,
     m        :: reg,
     rotation :: nat )
   =
{  acc = if n == 15 then 0 else R(n);
   rotated = ROR (R(m), rotation);
   R(d) <- acc + Extend (unsigned, rotated<15:0>);
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SEL<c> <Rd>, <Rn>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Media > SelectBytes
   ( d :: reg,
     n :: reg,
     m :: reg )
   =
{  Rn = R(n);
   Rm = R(m);
   r1 = if CPSR.GE<0> then Rn<7:0> else Rm<7:0>;
   r2 = if CPSR.GE<1> then Rn<15:8> else Rm<15:8>;
   r3 = if CPSR.GE<2> then Rn<23:16> else Rm<23:16>;
   r4 = if CPSR.GE<3> then Rn<31:24> else Rm<31:24>;
   R(d) <- r4 : r3 : r2 : r1;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~
-- T,A: REV<c>   <Rd>, <Rm>
-- T2:  REV<c>.W <Rd>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~

define Media > ByteReverse
   ( d :: reg,
     m :: reg )
   =
{  Rm = R(m);
   R(d) <- Rm<7:0> : Rm<15:8> : Rm<23:16> : Rm<31:24>;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T,A: REV16<c>   <Rd>, <Rm>
-- T2:  REV16<c>.W <Rd>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~

define Media > ByteReversePackedHalfword
   ( d :: reg,
     m :: reg )
   =
{  Rm = R(m);
   R(d) <- Rm<23:16> : Rm<31:24> : Rm<7:0> : Rm<15:8>;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T,A: REVSH<c>   <Rd>, <Rm>
-- T2:  REVSH<c>.W <Rd>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~

define Media > ByteReverseSignedHalfword
   ( d :: reg,
     m :: reg )
   =
{  Rm = R(m);
   R(d) <- SignExtend (Rm<7:0>) : Rm<15:8>;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: RBIT<c> <Rd>, <Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~

define Media > ReverseBits
   ( d :: reg,
     m :: reg )
   =
{  R(d) <- Reverse (R(m));
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: SBFX<c> <Rd>, <Rn>, #<lsb>, #<width>
-- T2,A: UBFX<c> <Rd>, <Rn>, #<lsb>, #<width>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Media > BitFieldExtract
   ( unsigned    :: bool,
     d           :: reg,
     n           :: reg,
     lsbit       :: nat,
     widthminus1 :: nat )
   =
{  msbit = lsbit + widthminus1;
   R(d) <- if unsigned then
              R(n)<msbit:lsbit>
           else
              SignExtendFrom (R(n)<msbit:lsbit>, widthminus1);
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: BFC<c> <Rd>, #<lsb>, #<width>
-- T2,A: BFI<c> <Rd>, <Rn>, #<lsb>, #<width>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Media > BitFieldClearOrInsert
   ( d     :: reg,
     n     :: reg,
     lsbit :: nat,
     msbit :: nat )
   =
{  field = [if n == 15 then 0 else R(n)]::bool list;
   var result = [R(d)]::bool list;
   result<msbit:lsbit> <- field<msbit-lsbit:0>;
   R(d) <- [result];
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T:  LDR<c>   <Rt>, [<Rn>{, #<imm>}]
-- T:  LDR<c>   <Rt>, [SP{, #<imm>}]
-- T2: LDR<c>.W <Rt>, [<Rn>{, #<imm12>}]
-- T2: LDR<c>   <Rt>, [<Rn>{, #-<imm8>}]
-- T2: LDR<c>   <Rt>, [<Rn>], #+/-<imm8>
-- T2: LDR<c>   <Rt>, [<Rn>, #+/-<imm8>]!
-- A:  LDR<c>   <Rt>, [<Rn>{, #+/-<imm12>}]
-- A:  LDR<c>   <Rt>, [<Rn>], #+/-<imm12>
-- A:  LDR<c>   <Rt>, [<Rn>, #+/-<imm12>]!
-- T:  LDR<c>   <Rt>, [<Rn>, <Rm>]
-- T2: LDR<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
-- A:  LDR<c>   <Rt>, [<Rn>, +/-<Rm>{, <shift>}]{!}
-- A:  LDR<c>   <Rt>, [<Rn>], +/-<Rm>{, <shift>}
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

construct offset1
{  register_form1 :: reg * SRType * nat
   immediate_form1 :: word
}

define Load > LoadWord
   ( add   :: bool,
     index :: bool,
     wback :: bool,
     t     :: reg,
     n     :: reg,
     m     :: offset1 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form1 (m, shift_t, shift_n) =>
                         Shift (R(m), shift_t, shift_n, CPSR.C)
                 case immediate_form1 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if index then offset_addr else Rn;
      data = MemU(address, 4);
      when wback do R(n) <- offset_addr;
      if t == 15 then
         if Aligned (address, 4) then
            LoadWritePC (data)
         else
            #UNPREDICTABLE("Load")
      else
      {  R(t) <- if UnalignedSupport() or Aligned (address, 4) then
                    data
                 else -- Can only apply before ARMv7
                    if Encoding == Encoding_ARM then
                       ROR (data, 8 * [address<1:0>])
                    else
                       UNKNOWN;
         IncPC()
      }
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T:  LDR<c>   <Rt>, <label>
-- T2: LDR<c>.W <Rt>, <label>
-- A:  LDR<c>   <Rt>, <label>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadLiteral
   ( add   :: bool,
     t     :: reg,
     imm32 :: word )
   =
   when NullCheckIfThumbEE(15) do
   {  base = Align (PC, 4);
      address = if add then base + imm32 else base - imm32;
      data = MemU(address, 4);
      if t == 15 then
         if Aligned (address, 4) then
            LoadWritePC (data)
         else
            #UNPREDICTABLE("LoadLiteral")
      else
      {  R(t) <- if UnalignedSupport() or Aligned (address, 4) then
                    data
                 else -- Can only apply before ARMv7
                    if Encoding == Encoding_ARM then
                       ROR (data, 8 * [address<1:0>])
                    else
                       UNKNOWN;
         IncPC()
      }
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: LDRT<c> <Rt>, [<Rn>{, #<imm8>}]
-- A:  LDRT<c> <Rt>, [<Rn>]{, #+/-<imm12>}
-- A:  LDRT<c> <Rt>, [<Rn>], +/-<Rm>{, <shift>}
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadUnprivileged
   ( add       :: bool,
     postindex :: bool,
     t         :: reg,
     n         :: reg,
     m         :: offset1 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form1 (m, shift_t, shift_n) =>
                         Shift (R(m), shift_t, shift_n, CPSR.C)
                 case immediate_form1 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if postindex then Rn else offset_addr;
      data = MemU_unpriv(address, 4);
      when postindex do R(n) <- offset_addr;
      R(t) <- if UnalignedSupport() or Aligned (address, 4) then
                 data
              else -- Can only apply before ARMv7
                 if Encoding == Encoding_ARM then
                    ROR (data, 8 * [address<1:0>])
                 else
                    UNKNOWN;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T:    LDRB<c>   <Rt>, [<Rn>{, #<imm>}]
-- T:    LDRB<c>   <Rt>, [SP{, #<imm>}]
-- T2:   LDRB<c>.W <Rt>, [<Rn>{, #<imm12>}]
-- T2:   LDRB<c>   <Rt>, [<Rn>{, #-<imm8>}]
-- T2:   LDRB<c>   <Rt>, [<Rn>], #+/-<imm8>
-- T2:   LDRB<c>   <Rt>, [<Rn>, #+/-<imm8>]!
-- A:    LDRB<c>   <Rt>, [<Rn>{, #+/-<imm12>}]
-- A:    LDRB<c>   <Rt>, [<Rn>], #+/-<imm12>
-- A:    LDRB<c>   <Rt>, [<Rn>, #+/-<imm12>]!
-- T:    LDRB<c>   <Rt>, [<Rn>, <Rm>]
-- T2:   LDRB<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
-- A:    LDRB<c>   <Rt>, [<Rn>, +/-<Rm>{, <shift>}]{!}
-- A:    LDRB<c>   <Rt>, [<Rn>], +/-<Rm>{, <shift>}
--
-- T2:   LDRSB<c>.W <Rt>, [<Rn>{, #<imm12>}]
-- T2:   LDRSB<c>   <Rt>, [<Rn>{, #-<imm8>}]
-- A:    LDRSB<c>   <Rt>, [<Rn>{, #+/-<imm8>}]
-- T2,A: LDRSB<c>   <Rt>, [<Rn>], #+/-<imm8>
-- T2,A: LDRSB<c>   <Rt>, [<Rn>, #+/-<imm8>]!
-- T:    LDRSB<c>   <Rt>, [<Rn>, <Rm>]
-- T2:   LDRSB<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
-- A:    LDRSB<c>   <Rt>, [<Rn>, +/-<Rm>]{!}
-- A:    LDRSB<c>   <Rt>, [<Rn>], +/-<Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadByte
   ( unsigned :: bool,
     add      :: bool,
     index    :: bool,
     wback    :: bool,
     t        :: reg,
     n        :: reg,
     m        :: offset1 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form1 (m, shift_t, shift_n) =>
                         Shift (R(m), shift_t, shift_n, CPSR.C)
                 case immediate_form1 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if index then offset_addr else Rn;
      R(t) <- Extend (unsigned, MemU(address, 1)::byte);
      when wback do R(n) <- offset_addr;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: LDR{S}B<c> <Rt>, <label>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadByteLiteral
   ( unsigned :: bool,
     add      :: bool,
     t        :: reg,
     imm32    :: word )
   =
   when NullCheckIfThumbEE(15) do
   {  base = Align (PC, 4);
      address = if add then base + imm32 else base - imm32;
      R(t) <- Extend (unsigned, MemU(address, 1)::byte);
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: LDRBT<c> <Rt>, [<Rn>{, #<imm8>}]
-- A:  LDRBT<c> <Rt>, [<Rn>]{, #+/-<imm12>}
-- A:  LDRBT<c> <Rt>, [<Rn>], +/-<Rm>{, <shift>}
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadByteUnprivileged
   ( add       :: bool,
     postindex :: bool,
     t         :: reg,
     n         :: reg,
     m         :: offset1 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form1 (m, shift_t, shift_n) =>
                         Shift (R(m), shift_t, shift_n, CPSR.C)
                 case immediate_form1 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if postindex then Rn else offset_addr;
      R(t) <- ZeroExtend (MemU_unpriv(address, 1)::byte);
      when postindex do R(n) <- offset_addr;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: LDRSBT<c> <Rt>, [<Rn>{, #<imm8>}]
-- A:  LDRSBT<c> <Rt>, [<Rn>]{, #+/-<imm8>}
-- A:  LDRSBT<c> <Rt>, [<Rn>], +/-<Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

construct offset2
{  register_form2 :: reg
   immediate_form2 :: word
}

define Load > LoadSignedByteUnprivileged
   ( add       :: bool,
     postindex :: bool,
     t         :: reg,
     n         :: reg,
     m         :: offset2 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form2 (m) => R(m)
                 case immediate_form2 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if postindex then Rn else offset_addr;
      R(t) <- SignExtend (MemU_unpriv(address, 1)::byte);
      when postindex do R(n) <- offset_addr;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T:    LDR{S}H<c>   <Rt>, [<Rn>{, #<imm>}]
-- T2:   LDR{S}H<c>.W <Rt>, [<Rn>{, #<imm12>}]
-- T2:   LDR{S}H<c>   <Rt>, [<Rn>{, #-<imm8>}]
-- A:    LDR{S}H<c>   <Rt>, [<Rn>{, #+/-<imm8>}]
-- T2,A: LDR{S}H<c>   <Rt>, [<Rn>], #+/-<imm8>
-- T2,A: LDR{S}H<c>   <Rt>, [<Rn>, #+/-<imm8>]!
-- T:    LDR{S}H<c>   <Rt>, [<Rn>, <Rm>]
-- T2:   LDR{S}H<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
-- A:    LDR{S}H<c>   <Rt>, [<Rn>, +/-<Rm>]{!}
-- A:    LDR{S}H<c>   <Rt>, [<Rn>], +/-<Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadHalf
   ( unsigned :: bool,
     add      :: bool,
     index    :: bool,
     wback    :: bool,
     t        :: reg,
     n        :: reg,
     m        :: offset1 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form1 (m, shift_t, shift_n) =>
                         Shift (R(m), shift_t, shift_n, CPSR.C)
                 case immediate_form1 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if index then offset_addr else Rn;
      data = MemU(address, 2)::half;
      when wback do R(n) <- offset_addr;
      R(t) <- if UnalignedSupport() or Aligned (address, 2) then
                 Extend (unsigned, data)
              else -- Can only apply before ARMv7
                 UNKNOWN;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: LDR{S}H<c> <Rt>, <label>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadHalfLiteral
   ( unsigned :: bool,
     add      :: bool,
     t        :: reg,
     imm32    :: word )
   =
   when NullCheckIfThumbEE(15) do
   {  base = Align (PC, 4);
      address = if add then base + imm32 else base - imm32;
      data = MemU(address, 2)::half;
      R(t) <- if UnalignedSupport() or Aligned (address, 2) then
                 Extend (unsigned, data)
              else -- Can only apply before ARMv7
                 UNKNOWN;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: LDR{S}HT<c> <Rt>, [<Rn>{, #<imm8>}]
-- A:  LDR{S}HT<c> <Rt>, [<Rn>]{, #+/-<imm8>}
-- A:  LDR{S}HT<c> <Rt>, [<Rn>], +/-<Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadHalfUnprivileged
   ( unsigned  :: bool,
     add       :: bool,
     postindex :: bool,
     t         :: reg,
     n         :: reg,
     m         :: offset2 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form2 (m) => R(m)
                 case immediate_form2 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if postindex then Rn else offset_addr;
      data = MemU_unpriv(address, 2)::half;
      when postindex do R(n) <- offset_addr;
      R(t) <- if UnalignedSupport() or Aligned (address, 2) then
                 Extend (unsigned, data)
              else -- Can only apply before ARMv7
                 UNKNOWN;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T,A:  POP<c>   <registers>
-- T2:   POP<c>.W <registers>
-- T:    LDM<c>   <Rn>!, <registers>   (<Rn> not included in <registers>)
-- T:    LDM<c>   <Rn>, <registers>    (<Rn> included in <registers>)
-- T2:   LDM<c>.W <Rn>{!}, <registers>
-- A:    LDM<c>   <Rn>{!}, <registers>
-- A:    LDMDA<c> <Rn>{!}, <registers>
-- T2,A: LDMDB<c> <Rn>{!}, <registers>
-- A:    LDMIB<c> <Rn>{!}, <registers>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadMultiple
   ( increment :: bool,
     index     :: bool,
     wback     :: bool,
     n         :: reg,
     registers :: bits(16) )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      length = 4 * [BitCount (registers)];
      var address = if increment then Rn else Rn - length;
      when index == increment do address <- address + 4;
      for i in 0 .. 14 do
         when registers<i> do
         {  R([i]) <- MemA(address, 4);
            address <- address + 4
         };
      if registers<15> then
         LoadWritePC (MemA(address, 4))
      else
         IncPC();
      when wback do -- must be false when system and not registers<15>
         if registers<[n]> then
            R(n) <- UNKNOWN
         else
            R(n) <- if increment then Rn + length else Rn - length
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- A: LDM{<amode>}<c> <Rn>{!}, <registers_with_pc>^
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadMultipleExceptionReturn
   ( increment  :: bool,
     wordhigher :: bool,
     wback      :: bool,
     n          :: reg,
     registers  :: bits(15) )
   =
{  when CurrentModeIsHyp() do TakeUndefInstrException();
   when CurrentModeIsUserOrSystem() do
      #UNPREDICTABLE("LoadMultipleExceptionReturn");
   Rn = R(n);
   length = 4 * [BitCount (registers)] + 4;
   var address = if increment then Rn else Rn - length;
   when wordhigher do address <- address + 4;
   for i in 0 .. 14 do
      when registers<i> do
      {  R([i]) <- MemA(address, 4);
         address <- address + 4
      };
   new_pc_value = MemA(address, 4);
   when wback do
      if registers<[n]> then
         R(n) <- UNKNOWN
      else
         R(n) <- if increment then Rn + length else Rn - length;
   CPSRWriteByInstr (&SPSR, 0b1111, true);
   BranchWritePC (new_pc_value)
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- A: LDM{<amode>}<c> <Rn>, <registers_without_pc>^
-- where <amode> is DA, DB, IA or IB.
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadMultipleUserRegisters
   ( increment  :: bool,
     wordhigher :: bool,
     n          :: reg,
     registers  :: bits(15) )
   =
{  when CurrentModeIsHyp() do TakeUndefInstrException();
   when CurrentModeIsUserOrSystem() do
      #UNPREDICTABLE("LoadMultipleUserRegisters");
   length = 4 * [BitCount (registers)];
   var address = if increment then R(n) else R(n) - length;
   when wordhigher do address <- address + 4;
   for i in 0 .. 14 do
      when registers<i> do
      {  -- Load User mode (‘10000’) register
         Rmode([i], 0b10000) <- MemA(address, 4);
         address <- address + 4
      };
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: LDRD<c> <Rt>, <Rt2>, [<Rn>{, #+/-<imm>}]
-- T2: LDRD<c> <Rt>, <Rt2>, [<Rn>], #+/-<imm>
-- T2: LDRD<c> <Rt>, <Rt2>, [<Rn>, #+/-<imm>]!
-- A:  LDRD<c> <Rt>, <Rt2>, [<Rn>{, #+/-<imm8>}]
-- A:  LDRD<c> <Rt>, <Rt2>, [<Rn>], #+/-<imm8>
-- A:  LDRD<c> <Rt>, <Rt2>, [<Rn>, #+/-<imm8>]!
-- A:  LDRD<c> <Rt>, <Rt2>, [<Rn>, #+/-<Rm>]{!}
-- A:  LDRD<c> <Rt>, <Rt2>, [<Rn>], #+/-<Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadDual
   ( add   :: bool,
     index :: bool,
     wback :: bool,
     t     :: reg,
     t2    :: reg,
     n     :: reg,
     m     :: offset2 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form2 (m) => R(m)
                 case immediate_form2 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if index then offset_addr else Rn;
      R(t) <- MemA(address, 4);
      R(t2) <- MemA(address + 4, 4);
      when wback do R(n) <- offset_addr;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: LDRD<c> <Rt>, <Rt2>, <label>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadDualLiteral
   ( add   :: bool,
     t     :: reg,
     t2    :: reg,
     imm32 :: word )
   =
   when NullCheckIfThumbEE(15) do
   {  address = if add then Align (PC, 4) + imm32 else Align (PC, 4) - imm32;
      R(t) <- MemA(address, 4);
      R(t2) <- MemA(address + 4, 4);
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: LDREX<c> <Rt>, [<Rn>{, #<imm>}]
-- A:  LDREX<c> <Rt>, [<Rn>]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadExclusive
   ( t     :: reg,
     n     :: reg,
     imm32 :: word )
   =
   when NullCheckIfThumbEE(n) do
   {  address = R(n) + imm32;
      SetExclusiveMonitors (address, 4);
      R(t) <- MemA(address,4);
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: LDREXB<c> <Rt>, [<Rn>]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadExclusiveByte
   ( t :: reg,
     n :: reg )
   =
   when NullCheckIfThumbEE(n) do
   {  address = R(n);
      SetExclusiveMonitors (address, 1);
      R(t) <- ZeroExtend (MemA(address,1)::byte);
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: LDREXH<c> <Rt>, [<Rn>]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadExclusiveHalf
   ( t :: reg,
     n :: reg )
   =
   when NullCheckIfThumbEE(n) do
   {  address = R(n);
      SetExclusiveMonitors (address, 2);
      R(t) <- ZeroExtend (MemA(address,2)::half);
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: LDREXD<c> <Rt>, <Rt2>, [<Rn>]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Load > LoadExclusiveDoubleword
   ( t  :: reg,
     t2 :: reg,
     n  :: reg )
   =
   when NullCheckIfThumbEE(n) do
   {  address = R(n);
      SetExclusiveMonitors (address, 8);
      value = MemA(address,8)`64;
      -- Extract words from 64-bit loaded value such that R[t] is loaded from
      -- address and R[t2] from address+4.
      R(t) <- if BigEndian() then value<63:32> else value<31:0>;
      R(t2) <- if BigEndian() then value<31:0> else value<63:32>;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T:  STR<c>   <Rt>, [<Rn>{, #<imm>}]
-- T:  STR<c>   <Rt>, [SP{, #<imm>}]
-- T2: STR<c>.W <Rt>, [<Rn>{, #<imm12>}]
-- T2: STR<c>   <Rt>, [<Rn>{, #-<imm8>}]
-- T2: STR<c>   <Rt>, [<Rn>], #+/-<imm8>
-- T2: STR<c>   <Rt>, [<Rn>, #+/-<imm8>]!
-- A:  STR<c>   <Rt>, [<Rn>{, #+/-<imm12>}]
-- A:  STR<c>   <Rt>, [<Rn>], #+/-<imm12>
-- A:  STR<c>   <Rt>, [<Rn>, #+/-<imm12>]!
-- T:  STR<c>   <Rt>, [<Rn>, <Rm>]
-- T2: STR<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
-- A:  STR<c>   <Rt>, [<Rn>, +/-<Rm>{, <shift>}]{!}
-- A:  STR<c>   <Rt>, [<Rn>], +/-<Rm>{, <shift>}
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreWord
   ( add   :: bool,
     index :: bool,
     wback :: bool,
     t     :: reg,
     n     :: reg,
     m     :: offset1 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form1 (m, shift_t, shift_n) =>
                         Shift (R(m), shift_t, shift_n, CPSR.C)
                 case immediate_form1 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if index then offset_addr else Rn;
      data = if t == 15 then -- Only possible for ARM encoding
                PCStoreValue()
             else
                R(t);
      if UnalignedSupport() or Aligned (address, 4) or
         CurrentInstrSet() == InstrSet_ARM then
         MemU(address,4) <- data
      else -- Can only occur before ARMv7
         MemU(address,4) <- UNKNOWN::word;
      when wback do R(n) <- offset_addr;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: STRT<c> <Rt>, [<Rn>{, #<imm8>}]
-- A:  STRT<c> <Rt>, [<Rn>]{, #+/-<imm12>}
-- A:  STRT<c> <Rt>, [<Rn>], +/-<Rm>{, <shift>}
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreUnprivileged
   ( add       :: bool,
     postindex :: bool,
     t         :: reg,
     n         :: reg,
     m         :: offset1 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form1 (m, shift_t, shift_n) =>
                         Shift (R(m), shift_t, shift_n, CPSR.C)
                 case immediate_form1 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if postindex then Rn else offset_addr;
      data = if t == 15 then -- Only possible for ARM encoding
                PCStoreValue()
             else
                R(t);
      if UnalignedSupport() or Aligned (address, 4) or
         CurrentInstrSet() == InstrSet_ARM then
         MemU_unpriv(address,4) <- data
      else -- Can only occur before ARMv7
         MemU_unpriv(address,4) <- UNKNOWN::word;
      when postindex do R(n) <- offset_addr;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T:  STRB<c>   <Rt>, [<Rn>{, #<imm>}]
-- T2: STRB<c>.W <Rt>, [<Rn>{, #<imm12>}]
-- T2: STRB<c>   <Rt>, [<Rn>{, #-<imm8>}]
-- T2: STRB<c>   <Rt>, [<Rn>], #+/-<imm8>
-- T2: STRB<c>   <Rt>, [<Rn>, #+/-<imm8>]!
-- A:  STRB<c>   <Rt>, [<Rn>{, #+/-<imm12>}]
-- A:  STRB<c>   <Rt>, [<Rn>], #+/-<imm12>
-- A:  STRB<c>   <Rt>, [<Rn>, #+/-<imm12>]!
-- T:  STRB<c>   <Rt>, [<Rn>, <Rm>]
-- T2: STRB<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
-- A:  STRB<c>   <Rt>, [<Rn>, +/-<Rm>{, <shift>}]{!}
-- A:  STRB<c>   <Rt>, [<Rn>], +/-<Rm>{, <shift>}
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreByte
   ( add   :: bool,
     index :: bool,
     wback :: bool,
     t     :: reg,
     n     :: reg,
     m     :: offset1 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form1 (m, shift_t, shift_n) =>
                         Shift (R(m), shift_t, shift_n, CPSR.C)
                 case immediate_form1 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if index then offset_addr else Rn;
      MemU(address,1) <- R(t)<7:0>;
      when wback do R(n) <- offset_addr;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: STRBT<c> <Rt>, [<Rn>{, #<imm8>}]
-- A:  STRBT<c> <Rt>, [<Rn>]{, #+/-<imm12>}
-- A:  STRBT<c> <Rt>, [<Rn>], +/-<Rm>{, <shift>}
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreByteUnprivileged
   ( add       :: bool,
     postindex :: bool,
     t         :: reg,
     n         :: reg,
     m         :: offset1 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form1 (m, shift_t, shift_n) =>
                         Shift (R(m), shift_t, shift_n, CPSR.C)
                 case immediate_form1 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if postindex then Rn else offset_addr;
      MemU_unpriv(address,1) <- R(t)<7:0>;
      when postindex do R(n) <- offset_addr;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T:    STRH<c>   <Rt>, [<Rn>{, #<imm>}]
-- T2:   STRH<c>.W <Rt>, [<Rn>{, #<imm12>}]
-- T2:   STRH<c>   <Rt>, [<Rn>{, #-<imm8>}]
-- A:    STRH<c>   <Rt>, [<Rn>{, #+/-<imm8>}]
-- T2,A: STRH<c>   <Rt>, [<Rn>], #+/-<imm8>
-- T2,A: STRH<c>   <Rt>, [<Rn>, #+/-<imm8>]!
-- T:    STRH<c>   <Rt>, [<Rn>, <Rm>]
-- T2:   STRH<c>.W <Rt>, [<Rn>, <Rm>{, LSL #<imm2>}]
-- A:    STRH<c>   <Rt>, [<Rn>, +/-<Rm>]{!}
-- A:    STRH<c>   <Rt>, [<Rn>], +/-<Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreHalf
   ( add   :: bool,
     index :: bool,
     wback :: bool,
     t     :: reg,
     n     :: reg,
     m     :: offset1 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form1 (m, shift_t, shift_n) =>
                         Shift (R(m), shift_t, shift_n, CPSR.C)
                 case immediate_form1 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if index then offset_addr else Rn;
      if UnalignedSupport() or Aligned (address, 2) then
         MemU(address,2) <- R(t)<15:0>
      else -- Can only occur before ARMv7
         MemU(address,2) <- UNKNOWN::half;
      when wback do R(n) <- offset_addr;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: STRHT<c> <Rt>, [<Rn>{, #<imm8>}]
-- A:  STRHT<c> <Rt>, [<Rn>]{, #+/-<imm8>}
-- A:  STRHT<c> <Rt>, [<Rn>], +/-<Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreHalfUnprivileged
   ( add       :: bool,
     postindex :: bool,
     t         :: reg,
     n         :: reg,
     m         :: offset2 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form2 (m) => R(m)
                 case immediate_form2 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if postindex then Rn else offset_addr;
      if UnalignedSupport() or Aligned (address, 2) then
         MemU_unpriv(address,2) <- R(t)<15:0>
      else -- Can only occur before ARMv7
         MemU_unpriv(address,2) <- UNKNOWN::half;
      when postindex do R(n) <- offset_addr;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T,A:  PUSH<c>   <registers>
-- T2:   PUSH<c>.W <registers>
-- T:    STM<c>    <Rn>!, <registers>
-- T2:   STM<c>.W  <Rn>{!}, <registers>
-- A:    STM<c>    <Rn>{!}, <registers>
-- A:    STMDA<c>  <Rn>{!}, <registers>
-- T2,A: STMDB<c>  <Rn>{!}, <registers>
-- A:    STMIB<c>  <Rn>{!}, <registers>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreMultiple
   ( increment :: bool,
     index     :: bool,
     wback     :: bool,
     n         :: reg,
     registers :: bits(16) )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      length = 4 * [BitCount (registers)];
      lowest = LowestSetBit (registers);
      var address = if increment then Rn else Rn - length;
      when index == increment do address <- address + 4;
      for i in 0 .. 14 do
         when registers<[i]> do
         {  if [i] == n and wback and i != lowest then
               MemA(address,4) <- UNKNOWN::word
            else
               MemA(address,4) <- R([i]);
            address <- address + 4
         };
      when registers<15> do
         MemA(address,4) <- PCStoreValue();
      when wback do
         R(n) <- if increment then Rn + length else Rn - length;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- A: STM{<amode>}<c> <Rn>, <registers>^
-- where <amode> is DA, DB, IA or IB.
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreMultipleUserRegisters
   ( increment  :: bool,
     wordhigher :: bool,
     n          :: reg,
     registers  :: bits(16) )
   =
{  when CurrentModeIsHyp() do TakeUndefInstrException();
   when CurrentModeIsUserOrSystem() do
      #UNPREDICTABLE("StoreMultipleUserRegisters");
   length = 4 * [BitCount (registers)];
   var address = if increment then R(n) else R(n) - length;
   when wordhigher do address <- address + 4;
   for i in 0 .. 14 do
      when registers<[i]> do -- Store User mode (‘10000’) register
      {  MemA(address,4) <- Rmode([i], 0b10000);
         address <- address + 4
      };
   when registers<15> do
      MemA(address,4) <- PCStoreValue();
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: STRD<c> <Rt>, <Rt2>, [<Rn>{, #+/-<imm>}]
-- T2: STRD<c> <Rt>, <Rt2>, [<Rn>], #+/-<imm>
-- T2: STRD<c> <Rt>, <Rt2>, [<Rn>, #+/-<imm>]!
-- A:  STRD<c> <Rt>, <Rt2>, [<Rn>{, #+/-<imm8>}]
-- A:  STRD<c> <Rt>, <Rt2>, [<Rn>], #+/-<imm8>
-- A:  STRD<c> <Rt>, <Rt2>, [<Rn>, #+/-<imm8>]!
-- A:  STRD<c> <Rt>, <Rt2>, [<Rn>, #+/-<Rm>]{!}
-- A:  STRD<c> <Rt>, <Rt2>, [<Rn>], #+/-<Rm>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreDual
   ( add   :: bool,
     index :: bool,
     wback :: bool,
     t     :: reg,
     t2    :: reg,
     n     :: reg,
     m     :: offset2 )
   =
   when NullCheckIfThumbEE(n) do
   {  Rn = R(n);
      offset = match m
               { case register_form2 (m) => R(m)
                 case immediate_form2 (imm32) => imm32
               };
      offset_addr = if add then Rn + offset else Rn - offset;
      address = if index then offset_addr else Rn;
      MemA(address, 4) <- R(t);
      MemA(address + 4, 4) <- R(t2);
      when wback do R(n) <- offset_addr;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: STREX<c> <Rd>, <Rt>, [<Rn>{, #<imm>}]
-- A:  STREX<c> <Rd>, <Rt>, [<Rn>]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreExclusive
   ( d     :: reg,
     t     :: reg,
     n     :: reg,
     imm32 :: word )
   =
   when NullCheckIfThumbEE(n) do
   {  address = R(n) + imm32;
      if ExclusiveMonitorsPass (address, 4) then
      {  MemA(address, 4) <- R(t);
         R(d) <- 0
      }
      else
         R(d) <- 1;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: STREXB<c> <Rd>, <Rt>, [<Rn>]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreExclusiveByte
   ( d :: reg,
     t :: reg,
     n :: reg )
   =
   when NullCheckIfThumbEE(n) do
   {  address = R(n);
      if ExclusiveMonitorsPass (address, 1) then
      {  MemA(address, 1) <- R(t)<7:0>;
         R(d) <- 0
      }
      else
         R(d) <- 1;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: STREXH<c> <Rd>, <Rt>, [<Rn>]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreExclusiveHalf
   ( d :: reg,
     t :: reg,
     n :: reg )
   =
   when NullCheckIfThumbEE(n) do
   {  address = R(n);
      if ExclusiveMonitorsPass (address, 2) then
      {  MemA(address, 2) <- R(t)<15:0>;
         R(d) <- 0
      }
      else
         R(d) <- 1;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- STREXD<c> <Rd>, <Rt>, <Rt2>, [<Rn>]
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Store > StoreExclusiveDoubleword
   ( d  :: reg,
     t  :: reg,
     t2 :: reg,
     n  :: reg )
   =
   when NullCheckIfThumbEE(n) do
   {  address = R(n);
      value = if BigEndian() then R(t) : R(t2) else R(t2) : R(t);
      if ExclusiveMonitorsPass (address, 8) then
      {  MemA(address, 8) <- value;
         R(d) <- 0
      }
      else
         R(d) <- 1;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: CLREX<c>
-- A:  CLREX
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define ClearExclusive =
{  ClearExclusiveLocal (ProcessorID());
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- A: SWP{B}<c> <Rt>, <Rt2>, [<Rn>]   (deprecated for version >= 6)
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define Swap
   ( b  :: bool,
     t  :: reg,
     t2 :: reg,
     n  :: reg )
   =
{  -- The MemA[] accesses in the next two statements are locked together,
   -- that is, the memory system must ensure that no other access to the
   -- same location can occur between them.
   Rn = R(n);
   if b then -- SWPB
   {  data = MemA(Rn, 1)::byte;
      MemA(Rn, 1) <- R(t2)<7:0>;
      R(t) <- ZeroExtend(data)
   }
   else      -- SWP
   {  data = MemA(Rn, 4);
      MemA(Rn, 4) <-R(t2);
      -- Rotation in the following will always be by zero in ARMv7, due to
      -- alignment checks, but can be nonzero in legacy configurations.
      R(t) <- ROR (data, 0n8 * [Rn<1:0>])
   };
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T:    CPS<effect>   <iflags>
-- T2:   CPS<effect>.W <iflags>{, #<mode>}
-- A:    CPS<effect>   <iflags>{, #<mode>}
-- T2,A: CPS           #<mode>
-- where <effect> is IE or ID
--       <iflags> is one or more of a, i and f.
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define System > ChangeProcessorState
   ( enable     :: bool,
     disable    :: bool,
     affectA    :: bool,
     affectI    :: bool,
     affectF    :: bool,
     changemode :: bits(5) option )
   =
{  when CurrentModeIsNotUser() do
   {  var cpsr_val = CPSR;
      when enable do
      {  when affectA do cpsr_val.A <- false;
         when affectI do cpsr_val.I <- false;
         when affectF do cpsr_val.F <- false
      };
      when disable do
      {  when affectA do cpsr_val.A <- true;
         when affectI do cpsr_val.I <- true;
         when affectF do cpsr_val.F <- true
      };
      match changemode {
         case Some (mode) => cpsr_val.M <- mode
         case None => nothing
      };
      CPSRWriteByInstr (&cpsr_val, 0b1111, false);
      when CPSR.M == 0b11010 and CurrentInstrSet() == InstrSet_ThumbEE do
         #UNPREDICTABLE("ChangeProcessorState")
   };
   IncPC()
}

-- ~~~~~~~~~~~~~~
-- T2, A: ERET<c>
-- ~~~~~~~~~~~~~~

define System > ExceptionReturn =
   if CurrentModeIsUserOrSystem() or
      CurrentInstrSet() == InstrSet_ThumbEE then
      #UNPREDICTABLE("ExceptionReturn")
   else
   {  new_pc_value = if CurrentModeIsHyp() then ELR_hyp else R(14);
      CPSRWriteByInstr (&SPSR, 0b1111, true);
      if CPSR.M == 0b11010 and CurrentInstrSet() == InstrSet_ThumbEE then
         #UNPREDICTABLE("ExceptionReturn")
      else
         BranchWritePC (new_pc_value)
   }

-- ~~~~~~~~~~~~~~~~~~~~
-- T2,A: HVC {#}<imm16>
-- ~~~~~~~~~~~~~~~~~~~~

define System > HypervisorCall
   ( imm16 :: half )
   =
   if not HaveVirtExt() or IsSecure() or not CurrentModeIsNotUser() then
      #UNPREDICTABLE ("HypervisorCall")
   else if not CP15.SCR.HCE then
      if CurrentModeIsHyp() then
         #UNPREDICTABLE ("HypervisorCall")
      else
         TakeUndefInstrException()
   else
      CallHypervisor (imm16)

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: MRS<c> <Rd>, <spec_reg>
-- where <spec_reg> is APSR, CPSR or SPSR.
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define System > MoveToRegisterFromSpecial
   ( read_spsr :: bool,
     d         :: reg )
   =
{  if read_spsr then
      if CurrentModeIsUserOrSystem() then
         #UNPREDICTABLE("MoveToRegisterFromSpecial")
      else
         R(d) <- &SPSR
   else
      -- CPSR is read with execution state bits other than E masked out.
      R(d) <- &CPSR && 0b11111000_11111111_00000011_11011111;
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- MRS<c> <Rd>, <banked_reg>
-- where <banked_reg> is <Rm>_<mode>, ELR_hyp or SPSR_<mode>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define System > MoveToRegisterFromBankedOrSpecial
   ( read_spsr :: bool,
     SYSm      :: bits(5),
     d         :: reg )
   =
   if not CurrentModeIsNotUser() then
      #UNPREDICTABLE("MoveToRegisterFromBankedOrSpecial")
   else
   {  mode = CPSR.M;
      if read_spsr then
      {  SPSRAccessValid(SYSm, mode);    -- Check for UNPREDICTABLE cases
         match SYSm
         {  case '01110' => R(d) <- &SPSR_fiq
            case '10000' => R(d) <- &SPSR_irq
            case '10010' => R(d) <- &SPSR_svc
            case '10100' => R(d) <- &SPSR_abt
            case '10110' => R(d) <- &SPSR_und
            case '11100' => R(d) <- &SPSR_mon
            case '11110' => R(d) <- &SPSR_hyp
            case _ => nothing
         }
      }
      else
      {  BankedRegisterAccessValid(SYSm, mode);
                                         -- Check for UNPREDICTABLE cases
         if SYSm<4:3> == 0b00 then       -- Access the User registers
         {  m = [SYSm<2:0>] + 8;
            R(d) <- Rmode(m, 0b10000)
         }
         else if SYSm<4:3> == 0b01 then  -- Access the FIQ registers
         {  m = [SYSm<2:0>] + 8;
            R(d) <- Rmode(m, 0b10001)
         }
         else if SYSm<4:3> == 0b11 then
            if not SYSm<1> then          -- Access the Monitor registers
            {  m = 14 - [SYSm<0>]::reg;  -- LR when SYSm<0> == 0, otherwise SP
               R(d) <- Rmode(m, 0b10110)
            }
            else                         -- Access the Hyp registers
               if SYSm<0> then
                  R(d) <- Rmode(13, 0b11010)
               else
                  R(d) <- ELR_hyp
         else                            -- Other Banked registers
         {  var targetmode;              -- (SYSm<4:3> == '10' case)
            targetmode<0> <- SYSm<2> or SYSm<1>;
            targetmode<1> <- true;
            targetmode<2> <- SYSm<2> and not SYSm<1>;
            targetmode<3> <- SYSm<2> and SYSm<1>;
            targetmode<4> <- true;
            if mode == targetmode then
               #UNPREDICTABLE("MoveToRegisterFromBankedOrSpecial")
            else
            {  m = 14 - [SYSm<0>]::reg; -- LR when SYSm<0> == 0, otherwise SP
               R(d) <- Rmode(m, targetmode)
            }
         }
      };
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- A: MSR<c> <spec_reg>, #<const>
-- where <spec_reg> is APSR_<bits>, CPSR_<fields> or SPSR_<fields>
--       <bits>     is nzcvq, g, or nzcvqg
--       <fields>   is one or more of c, x, s and f.
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define System > MoveToSpecialFromImmediate
   ( write_spsr :: bool,
     imm32      :: word,
     mask       :: bits(4) )
   =
{  if write_spsr then
      SPSRWriteByInstr (imm32, mask)
   else
   {  CPSRWriteByInstr (imm32, mask, false);
      when CPSR.M == 0b11010 and CurrentInstrSet() == InstrSet_ThumbEE do
         #UNPREDICTABLE("MoveToSpecialFromImmediate")
   };
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2,A: MSR<c> <spec_reg>, <Rn>
-- where <spec_reg> is APSR_<bits>, CPSR_<fields> or SPSR_<fields>
--       <bits>     is nzcvq, g, or nzcvqg
--       <fields>   is one or more of c, x, s and f.
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define System > MoveToSpecialFromRegister
   ( write_spsr :: bool,
     n          :: reg,
     mask       :: bits(4) )
   =
{  if write_spsr then
      SPSRWriteByInstr (R(n), mask)
   else
   {  CPSRWriteByInstr (R(n), mask, false);
      when CPSR.M == 0b11010 and CurrentInstrSet() == InstrSet_ThumbEE do
         #UNPREDICTABLE("MoveToSpecialFromRegister")
   };
   IncPC()
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- MSR<c> <banked_reg>, <Rn>
-- where <banked_reg> is <Rm>_<mode>, ELR_hyp or SPSR_<mode>
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define System > MoveToBankedOrSpecialRegister
   ( write_spsr :: bool,
     SYSm       :: bits(5),
     n          :: reg )
   =
   if not CurrentModeIsNotUser() then
      #UNPREDICTABLE("MoveToBankedOrSpecialRegister")
   else
   {  mode = CPSR.M;
      if write_spsr then
      {  SPSRAccessValid(SYSm, mode);    -- Check for UNPREDICTABLE cases
         match SYSm
         {  case '01110' => &SPSR_fiq <- R(n)
            case '10000' => &SPSR_irq <- R(n)
            case '10010' => &SPSR_svc <- R(n)
            case '10100' => &SPSR_abt <- R(n)
            case '10110' => &SPSR_und <- R(n)
            case '11100' => &SPSR_mon <- R(n)
            case '11110' => &SPSR_hyp <- R(n)
            case _ => nothing
         }
      }
      else
      {  BankedRegisterAccessValid(SYSm, mode);
                                         -- Check for UNPREDICTABLE cases
         if SYSm<4:3> == 0b00 then       -- Access the User registers
         {  m = [SYSm<2:0>] + 8;
            Rmode(m, 0b10000) <- R(n)
         }
         else if SYSm<4:3> == 0b01 then  -- Access the FIQ registers
         {  m = [SYSm<2:0>] + 8;
            Rmode(m, 0b10001) <- R(n)
         }
         else if SYSm<4:3> == 0b11 then
            if not SYSm<1> then          -- Access the Monitor registers
            {  m = 14 - [SYSm<0>]::reg;  -- LR when SYSm<0> == 0, otherwise SP
               Rmode(m, 0b10110) <- R(n)
            }
            else                         -- Access the Hyp registers
               if SYSm<0> then           --   access SP_hyp
                  Rmode(13, 0b11010) <- R(n)
               else
                  ELR_hyp <- R(n)
         else                            -- Other Banked registers
         {  var targetmode;              -- (SYSm<4:3> == '10' case)
            targetmode<0> <- SYSm<2> or SYSm<1>;
            targetmode<1> <- true;
            targetmode<2> <- SYSm<2> and not SYSm<1>;
            targetmode<3> <- SYSm<2> and SYSm<1>;
            targetmode<4> <- true;
            if mode == targetmode then
               #UNPREDICTABLE("MoveToBankedOrSpecialRegister")
            else
            {  m = 14 - [SYSm<0>]::reg;  -- LR when SYSm<0> == 0, otherwise SP
               Rmode(m, targetmode) <- R(n)
            }
         }
      };
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: RFEDB<c>     <Rn>{!}
-- T2: RFE{IA}<c>   <Rn>{!}
-- A:  RFE{<amode>} <Rn>{!}
-- where <amode> is DA, DB, IA or IB.
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define System > ReturnFromException
   ( increment  :: bool,
     wordhigher :: bool,
     wback      :: bool,
     n::reg )
   =
   if CurrentModeIsHyp() then
      TakeUndefInstrException()
   else if not CurrentModeIsNotUser() or
           CurrentInstrSet() == InstrSet_ThumbEE
      then #UNPREDICTABLE("ReturnFromException")
   else
   {  Rn = R(n);
      address = if increment then Rn else Rn - 8;
      address = if wordhigher then address + 4 else address;
      when wback do R(n) <- if increment then Rn + 8 else Rn - 8;
      new_pc_value = MemA(address, 4);
      CPSRWriteByInstr (MemA(address + 4, 4), 0b1111, true);
      if CPSR.M == 0b11010 and CPSR.J and CPSR.T then
         #UNPREDICTABLE("ReturnFromException")
      else
         BranchWritePC (new_pc_value)
   }

-- ~~~~~~~~~~~~~~~~
-- SMC<c> {#}<imm4>
-- ~~~~~~~~~~~~~~~~

define System > SecureMonitorCall (imm4::bits(4)) =
   if HaveSecurityExt() and CurrentModeIsNotUser() then
      if HaveVirtExt() and not IsSecure() and not CurrentModeIsHyp() and
         CP15.HCR.TSC then
      {  HSRString = 0;
         WriteHSR (0b010011, HSRString);
         TakeHypTrapException()
      }
      else
         if CP15.SCR.SCD then
            if IsSecure() then
               #UNPREDICTABLE("SecureMonitorCall")
            else
               TakeUndefInstrException()
         else
            TakeSMCException()
   else
      TakeUndefInstrException()

-- ~~~~~~~~~~~~~~~~
-- SVC<c> {#}<imm>
-- ~~~~~~~~~~~~~~~~

define System > SupervisorCall
   ( imm32 :: word )
   =
   CallSupervisor(imm32<15:0>)

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T2: SRSDB<c>     SP{!}, #<mode>
-- T2: SRS{IA}<c>   SP{!}, #<mode>
-- A:  SRS{<amode>} SP{!}, #<mode>
-- where <amode> is DA, DB, IA or IB.
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define System > StoreReturnState
   ( increment  :: bool,
     wordhigher :: bool,
     wback      :: bool,
     mode       :: bits(5) )
   =
   if CurrentModeIsHyp() then
      TakeUndefInstrException()
   else if CurrentModeIsUserOrSystem() or
           CurrentInstrSet() == InstrSet_ThumbEE
      then #UNPREDICTABLE("StoreReturnState")
   else if mode == 0b11010 then -- Check for attempt to access Hyp mode SP
      #UNPREDICTABLE("StoreReturnState")
   else
   {  when not IsSecure() do
         -- In Non-secure state, check for attempts to access Monitor mode
         -- ('10110'), or FIQ when the Security Extensions are reserving the
         -- FIQ registers. The definition of UNPREDICTABLE does not permit
         -- this to be a security hole.
         when mode == 0b10110 or (mode == 0b10001 and CP15.NSACR.RFR) do
            #UNPREDICTABLE("StoreReturnState");
      base = Rmode(13,mode);
      address = if increment then base else base - 8;
      address = if wordhigher then address + 4 else address;
      MemA(address,4) <- LR;
      MemA(address+4,4) <- &SPSR;
      when wback do
         Rmode(13,mode) <- if increment then base + 8 else base - 8;
      IncPC()
   }

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- T,A: SETEND <endian_specifier>
-- where <endian_specifier> is BE or LE.
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

define System > Setend
   ( set_bigend :: bool )
   =
{  CPSR.E <- set_bigend;
   IncPC()
}

-------------------------------------------------------
-- Stubs for Hints and other Miscellaneous instructions
-------------------------------------------------------

define Undefined (imm32::word) = TakeUndefInstrException()

-- All treated as NO-OPs.

define NoOperation = IncPC()

define Hint > Breakpoint (imm32::word) = IncPC()
define Hint > Debug (option::bits(4)) = IncPC()
define Hint > DataMemoryBarrier (option::bits(4)) = IncPC()
define Hint > DataSynchronizationBarrier (option::bits(4)) = IncPC()
define Hint > InstructionSynchronizationBarrier (option::bits(4)) = IncPC()
define Hint > PreloadData (add::bool,is_pldw::bool,n::reg,m::offset1) = IncPC()
define Hint > PreloadDataLiteral (add::bool, imm32::word) = IncPC()
define Hint > PreloadInstruction (add::bool, n::reg, m::offset1) = IncPC()
define Hint > SendEvent = IncPC()
define Hint > WaitForEvent = IncPC()
define Hint > WaitForInterrupt = IncPC()
define Hint > Yield = IncPC()
