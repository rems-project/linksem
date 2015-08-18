-----------------------------------------------------------------------
-- Formal Specification of the ARMv7-AR instruction set architecture --
-- (c) Anthony Fox, University of Cambridge                          --
-----------------------------------------------------------------------

-- Preliminaries

-----------------------------------
-- Word sizes (32-bit architecture)
-----------------------------------

type reg  = bits(4)
type cond = bits(4)
type byte = bits(8)
type half = bits(16)
type word = bits(32)

---------------------------
-- Specification exceptions
---------------------------

exception ASSERT :: string
exception UNPREDICTABLE :: string
exception IMPLEMENTATION_DEFINED :: string
exception AlignmentFault :: word

------------------------
-- Architecture versions
------------------------

construct Architecture {
   ARMv4    ARMv4T
   ARMv5T   ARMv5TE
   ARMv6    ARMv6K    ARMv6T2
   ARMv7_A  ARMv7_R
}

declare Architecture :: Architecture

nat ArchVersion() =
   match Architecture
   { case ARMv4 or ARMv4T            => 4
     case ARMv5T or ARMv5TE          => 5
     case ARMv6 or ARMv6K or ARMv6T2 => 6
     case ARMv7_A or ARMv7_R         => 7
   }

--------------------------
-- Architecture extensions
--------------------------

construct Extensions {
   Extension_ThumbEE
   Extension_Security
   Extension_Multiprocessing
   Extension_Virtualization
   Extension_VFP
   Extension_AdvanvedSIMD
}

declare Extensions :: Extensions set

bool HaveDSPSupport() = Architecture notin set {ARMv4, ARMv4T, ARMv5T}

bool HaveThumb2() = Architecture in set {ARMv6T2, ARMv7_A, ARMv7_R}

bool HaveThumbEE() =
   Architecture == ARMv7_A or
   Architecture == ARMv7_R and Extension_ThumbEE in Extensions

bool HaveMPExt() =
   ArchVersion() >= 7 and Extension_Multiprocessing in Extensions

bool HaveSecurityExt() =
   Architecture in set {ARMv6K, ARMv7_A} and Extension_Security in Extensions

bool HaveVirtExt() =
   ArchVersion() >= 7 and Extension_Virtualization in Extensions

----------------------------------
-- Program Status Registers (PSRs)
----------------------------------

register PSR :: word {
   31:    N     -- Condition flag (Negative)
   30:    Z     -- Condition flag (Zero)
   29:    C     -- Condition flag (Carry)
   28:    V     -- Condition flag (oVerflow)
   27:    Q     -- Cumulative saturation flag
   15-10,
   26-25: IT    -- If-Then
   24:    J     -- Jazelle bit
   23-20: RAZ!  -- reserved
   19-16: GE    -- Greater-equal flags (SIMD)
   9:     E     -- Endian bit (T: Big, F: Little)
   8:     A     -- Asynchronous abort disable
   7:     I     -- Interrupt disable
   6:     F     -- Fast interrupt disable
   5:     T     -- Thumb mode
   4-0:   M     -- Mode field
}

declare {
   CPSR     :: PSR
   SPSR_fiq :: PSR
   SPSR_irq :: PSR
   SPSR_svc :: PSR
   SPSR_mon :: PSR
   SPSR_abt :: PSR
   SPSR_hyp :: PSR
   SPSR_und :: PSR
}

-----------------
-- CP14 registers
-----------------

record CP14 {
   TEEHBR :: word -- ThumbEE Handler Base Register
}

declare CP14 :: CP14

-----------------
-- CP15 registers
-----------------

-- System Control Register (PMSA)

register SCTLR :: word {
   31:    IE    -- Instruction endianness (T: Big, F: Little)
   30:    TE    -- Thumb exception enable (T: Handled in Thumb state, F: in ARM)
   29-28: RAZ!
   27:    NMFI  -- Non-maskable fast interupts (T: non-maskable, F: maskable)
   26:    RAZ!
   25:    EE    -- Exception endianness (T: Big, F: Little)
   24:    VE    -- Interrupt vectors enable
   23:    RAO!
   22:    U     -- Alignment model
   21:    FI    -- Fast interrupts configuration
   20:    RAZ!
   19:    DZ    -- Divide by Zero fault enable
   18:    RAO!
   17:    BR    -- Background region bit
   16:    RAO!
   15:    RAZ!
   14:    RR    -- Round Robin bit
   13:    V     -- Vectors bit
   12:    I     -- Instruction cache enable
   11:    Z     -- Branch prediction enable
   10:    SW    -- SWP/SWPB enable
   9-8:   RAZ!
   7:     B     -- Endian model
   6-3:   RAO!
   2:     C     -- Cache enable bit
   1:     A     -- Alignment check enable bit
   0:     M     -- MPU enable bit
}

-- Hyp System Control Register (VMSA)

register HSCTLR :: word {
   31:    RAZ!
   30:    TE      -- Thumb exception enable
   29-28: RAO!
   27-26: RAZ!
   25:    EE      -- Exception endianness
   24:    RAZ!
   23-22: RAO!
   21:    FI      -- Fast interrupts configuration
   20:    RAZ!
   19:    WXN     -- Write permission implies XN
   18:    RAO!
   17:    RAZ!
   16:    RAO!
   15-13: RAZ!
   12:    I       -- Instruction cache enable
   11:    RAO!
   10-7:  RAZ!
   6:     RAO!
   5:     CP15BEN -- CP15 barrier enable
   4-3:   RAO!
   2:     C       -- Cache enable bit
   1:     A       -- Alignment check enable bit
   0:     M       -- MPU enable bit
}

-- Hyp System Control Register (VMSA)

register HSR :: word {
   31-26: EC   -- Exception class
   25:    IL   -- Instruction length
   24-0:  ISS  -- Instruction-specific syndrome
}

-- Secure Configuration Register (VMSA only)

register SCR :: word {
   31-10: UNK!
   9:     SIF   -- Secure instruction fetch
   8:     HCE   -- Hyp Call enable
   7:     SCD   -- Secure Monitor Call disable
   6:     nET   -- Not early termination (T: disable early termination)
   5:     AW    -- "A" bit writable
   4:     FW    -- "F" bit writable
   3:     EA    -- External abort handler (T: Monitor mode, F: Abort mode)
   2:     FIQ   -- FIQ handler (T: Monitor mode, F: Abort mode)
   1:     IRQ   -- IRQ handler (T: Monitor mode, F: Abort mode)
   0:     NS    -- Non secure bit
}

-- Non-Secure Access Control Register (VMSA only)

register NSACR :: word {
   31-21: UNK!
   20:    NSTRCDIS  -- Disable Non-secure access to CP14 trace registers
   19:    RFR       -- Reserve FIQ registers
   18-16: UNK!      -- Implemenation defined
   15:    NSASEDIS  -- Disable non-secure Advanced SIMD functionality
   14:    NSD32DIS  -- Disable non-secure use of D16-D31 of the VFP registers
   13-0:  cp        -- Non-secure acceess to copreocessor cp<n>
}

-- Hyp Configuration Register (VMSA, Virtualization Extensions only)

register HCR :: word {
   31-28: UNK!
   27:    TGE       -- Trap general exceptions
   26:    TVM       -- Trap virtual memory controls
   25:    TTLB      -- Trap TLB maintenance operations
   24:    TPU       -- Trap cache maintenance to point of unification operations
   23:    TPC       -- Trap cache maintenance to point of coherency operations
   22:    TSW       -- Trap set/way cache maintenance operations
   21:    TAC       -- Trap ACTLR accesses
   20:    TIDCP     -- Trap lockdown
   19:    TSC       -- Trap SMC instruction
   18-15: TID       -- Trap ID register groups
   14:    TWE       -- Trap WFE instruction
   13:    TWI       -- Trap WFI instruction
   12:    DC        -- Default cacheable
   11-10: BSU       -- Barrier shareability upgrade
   9:     FB        -- Force broadcast
   8:     VA        -- Virtual asynchronous abort
   7:     VI        -- Virtual IRQ
   6:     VF        -- Virtual FIQ
   5:     AMO       -- Overides CPSR.A bit
   4:     IMO       -- Overides CPSR.I bit
   3:     FMO       -- Overides CPSR.F bit
   2:     PTW       -- Protected table walk
   1:     SWIO      -- Set/way invalidation override
   0:     VM        -- Virtualization MMU enable bit
}

{-
-- Coprocessor Access Control Register (PMSA)

register CPACR :: word {
  31:    ASEDIS  -- Disable Adcanced SIMD functionality
  30:    D32DIS  -- Disable use of D16-D31 of the floating-point register file
  29:    RAZ!
  28:    TRCDIS  -- Disable CP14 access to trace registers
  27-26: cp13    -- Access rights for coprocessor
  25-24: cp12
  23-22: cp11
  21-20: cp10
  19-18: cp9
  17-16: cp8
  15-14: cp7
  13-12: cp6
  11-10: cp5
  9-8:   cp4
  7-6:   cp3
  5-4:   cp2
  3-2:   cp1
  1-0:   cp0
}
-}

record CP15 {
   SCTLR  :: SCTLR
   HSCTLR :: HSCTLR
   SCR    :: SCR    -- VMSA only
   NSACR  :: NSACR  -- VMSA only
   VBAR   :: word   -- VMSA only
   MVBAR  :: word   -- VMSA only
   HSR    :: HSR    -- VMSA only
   HCR    :: HCR    -- VMSA only
}

declare CP15 :: CP15

------------------------
-- Mode/state operations
------------------------

int ProcessorID() = 0

bool IsExternalAbort() = UNKNOWN

bool IsSecure() =
   not HaveSecurityExt() or not CP15.SCR.NS or CPSR.M == 0b10110 -- Monitor mode

bool UnalignedSupport() =
{  v = ArchVersion();
   return v >= 7 or (v == 6 and CP15.SCTLR.U)
}

bool BadMode (mode::bits(5)) =
   match mode
   { case '10000' => false              -- User mode
     case '10001' => false              -- FIQ mode
     case '10010' => false              -- IRQ mode
     case '10011' => false              -- Supervisor mode
     case '10110' => !HaveSecurityExt() -- Monitor mode
     case '10111' => false              -- Abort mode
     case '11010' => !HaveVirtExt()     -- Hyp mode
     case '11011' => false              -- Undefined mode
     case '11111' => false              -- System mode
     case _ => true
   }

bool CurrentModeIsNotUser() =
{  when BadMode (CPSR.M) do #UNPREDICTABLE("BadMode: " : [CPSR.M]);
   not CPSR.M == 0b10000
}

bool CurrentModeIsUserOrSystem() =
{  when BadMode (CPSR.M) do #UNPREDICTABLE("BadMode: " : [CPSR.M]);
   ( CPSR.M in set { 0b10000, 0b11111 } )
}

bool CurrentModeIsHyp() =
{  when BadMode (CPSR.M) do #UNPREDICTABLE("BadMode: " : [CPSR.M]);
   return CPSR.M == 0b11010
}

bool IntegerZeroDivideTrappingEnabled() = CP15.SCTLR.DZ

component ISETSTATE :: bits(2)
{  value = [CPSR.J] : [CPSR.T]
   assign value =
   {  CPSR.J <- value<1>;
      CPSR.T <- value<0>
   }
}

construct InstrSet {
   InstrSet_ARM  InstrSet_Thumb  InstrSet_Jazelle  InstrSet_ThumbEE
}

construct Encoding {
   Encoding_Thumb  Encoding_Thumb2  Encoding_ARM
}

declare Encoding :: Encoding

InstrSet CurrentInstrSet() =
   match ISETSTATE
   { case '00' => InstrSet_ARM
     case '01' => InstrSet_Thumb
     case '10' => InstrSet_Jazelle
     case '11' => InstrSet_ThumbEE
   }

unit SelectInstrSet (iset::InstrSet) =
   match iset
   { case InstrSet_ARM =>
        if CurrentInstrSet() == InstrSet_ThumbEE then
           #UNPREDICTABLE("SelectInstrSet")
        else
           ISETSTATE <- 0b00
     case InstrSet_Thumb =>
        ISETSTATE <- 0b01
     case InstrSet_Jazelle =>
        ISETSTATE <- 0b10
     case InstrSet_ThumbEE =>
        ISETSTATE <- 0b11
   }

component ITSTATE :: byte
{  value = ( if HaveThumb2() then CPSR.IT else 0b00000000 )
   assign value = CPSR.IT <- value
}

unit ITAdvance() =
   when HaveThumb2() and Encoding != Encoding_ARM do
      if ITSTATE<2:0> == 0b000 then
         ITSTATE <- 0b00000000
      else
         ITSTATE<4:0> <- ITSTATE<4:0> << 1

bool InITBlock() = ITSTATE<3:0> != 0b0000
bool LastInITBlock() = ITSTATE<3:0> == 0b1000

bits(4) ThumbCondition () =
   if ITSTATE == 0b00000000 then
      0b1110
   else if CPSR.IT<3:0> != 0b0000 then
      CPSR.IT<7:4>
   else
      #UNPREDICTABLE("ThumbCondition")

bool BigEndian() = ( CPSR.E )

-- Exclusive monitor stubs - implementation defined

unit SetExclusiveMonitors (address::word, n::nat) = ()
bool ExclusiveMonitorsPass (address::word, n::nat) = UNKNOWN
unit ClearExclusiveLocal (id::int) = ()

-- Conditional instructions

declare CurrentCondition :: cond

cond CurrentCond() = return CurrentCondition

bool ConditionPassed() =
{  cond = CurrentCond();

   -- Evaluate base condition
   result = match cond<3:1>
            {  case '000' => CPSR.Z                           -- EQ or NE
               case '001' => CPSR.C                           -- CS or CC
               case '010' => CPSR.N                           -- MI or PL
               case '011' => CPSR.V                           -- VS or VC
               case '100' => CPSR.C and not CPSR.Z            -- HI or LS
               case '101' => CPSR.N == CPSR.V                 -- GE or LT
               case '110' => CPSR.N == CPSR.V and not CPSR.Z  -- GT or LE
               case '111' => true                             -- AL
            };

   -- Condition flag values in the set '111x' indicate the instruction is
   -- always run.  Otherwise, invert condition if necessary.
   if cond<0> and cond != 0b1111 then
      not result
   else
      result
}

-----------------
-- PSR operations
-----------------

component SPSR :: PSR
{  value =
      if BadMode (CPSR.M) then
         #UNPREDICTABLE("SPSR: BadMode: " : [CPSR.M])
      else
         match CPSR.M
         { case '10001' => SPSR_fiq  -- FIQ mode
           case '10010' => SPSR_irq  -- IRQ mode
           case '10011' => SPSR_svc  -- Supervisor mode
           case '10110' => SPSR_mon  -- Monitor mode
           case '10111' => SPSR_abt  -- Abort mode
           case '11010' => SPSR_hyp  -- Hyp mode
           case '11011' => SPSR_und  -- Undefined mode
           case _ => #UNPREDICTABLE("SPSR")
         }
   assign value =
      if BadMode (CPSR.M) then
         #UNPREDICTABLE("SPSR: BadMode: " : [CPSR.M])
      else
         match CPSR.M
         { case '10001' => SPSR_fiq <- value  -- FIQ mode
           case '10010' => SPSR_irq <- value  -- IRQ mode
           case '10011' => SPSR_svc <- value  -- Supervisor mode
           case '10110' => SPSR_mon <- value  -- Monitor mode
           case '10111' => SPSR_abt <- value  -- Abort mode
           case '11010' => SPSR_hyp <- value  -- Hyp mode
           case '11011' => SPSR_und <- value  -- Undefined mode
           case _ => #UNPREDICTABLE("SPSR")
         }
}

unit CPSRWriteByInstr (value::word, bytemask::bits(4), is_excpt_return::bool) =
{  privileged = CurrentModeIsNotUser();
   nmfi = CP15.SCTLR.NMFI;

   when bytemask<3> do
   {  &CPSR<31:27> <- value<31:27>;    -- N, Z, C, V, Q flags
      when is_excpt_return do
         &CPSR<26:24> <- value<26:24>  -- IT<1:0>, J state bits
   };

   when bytemask<2> do
      -- bits <23:20> are reserved SBZP bits
      &CPSR<19:16> <- value<19:16>;    -- GE<3:0> flags

   when bytemask<1> do
   {  when is_excpt_return do
         &CPSR<15:10> <- value<15:10>; -- IT<7:2> state bits
      &CPSR<9> <- value<9>;            -- E bit is user-writable
      when privileged and (IsSecure() or CP15.SCR.AW) do
         &CPSR<8> <- value<8>          -- A interrupt mask
   };

   when bytemask<0> do
   {  when privileged do
         &CPSR<7> <- value<7>;         -- I interrupt mask
      when privileged and (not nmfi or not value<6>) and
           (IsSecure() or CP15.SCR.FW or HaveVirtExt()) do
         &CPSR<6> <- value<6>;         -- F interrupt mask
      when is_excpt_return do
         &CPSR<5> <- value<5>;         -- T state bit
      when privileged do
         if BadMode (value<4:0>) then
            #UNPREDICTABLE("CPSRWriteByInstr: BadMode: " : [value<4:0>])
         else 
         { -- Check for attempts to enter modes only permitted in Secure state
           -- from Non-secure state. These are Monitor mode ('10110'), and FIQ
           -- mode ('10001') if the Security Extensions have reserved it. The
           -- definition of UNPREDICTABLE does not permit the resulting
           -- behavior to be a security hole.
           when not IsSecure() and value<4:0> == 0b10110 do
              #UNPREDICTABLE("CPSRWriteByInstr");
           when not IsSecure() and value<4:0> == 0b10001 and CP15.NSACR.RFR do
              #UNPREDICTABLE("CPSRWriteByInstr");
           -- There is no Hyp mode ('11010') in Secure state, so that is
           -- UNPREDICTABLE
           when not CP15.SCR.NS and value<4:0> == 0b11010 do
              #UNPREDICTABLE("CPSRWriteByInstr");
           -- Cannot move into Hyp mode directly from a Non-secure PL1 mode
           when !IsSecure() and CPSR.M != 0b11010 and value<4:0> == 0b11010 do
              #UNPREDICTABLE("CPSRWriteByInstr");
           -- Cannot move out of Hyp mode with this function except on an
           -- exception return
           when CPSR.M == 0b11010 and value<4:0> != 0b11010 and
                !is_excpt_return do
              #UNPREDICTABLE("CPSRWriteByInstr");

           &CPSR<4:0> <- value<4:0>    -- M<4:0> mode bits
         }
   }
}

unit SPSRWriteByInstr (value::word, bytemask::bits(4)) =
{  when CurrentModeIsUserOrSystem() do #UNPREDICTABLE("SPSRWriteByInstr");

   when bytemask<3> do
      &SPSR<31:24> <- value<31:24>;  -- N, Z, C, V, Q flags, IT<1:0>,
                                     -- J state bits

   when bytemask<2> do
      -- bits <23:20> are reserved SBZP bits
      &SPSR<19:16> <- value<19:16>;  -- GE<3:0> flags

   when bytemask<1> do
      &SPSR<15:8> <- value<15:8>;    -- IT<7:2> state bits, E bit, A mask

   when bytemask<0> do
   {  &SPSR<7:5> <- value<7:5>;      -- I, F masks, T state bit
      if BadMode (value<4:0>) then   -- Mode bits
         #UNPREDICTABLE("SPSRWriteByInstr: BadMode: " : [value<4:0>])
      else
         &SPSR<4:0> <- value<4:0>
   }
}

-------------------------------------
-- General Purpose Registers (banked)
-------------------------------------

construct RName {
   RName_0usr   RName_1usr   RName_2usr   RName_3usr  RName_4usr   RName_5usr
   RName_6usr   RName_7usr   RName_8usr   RName_8fiq  RName_9usr   RName_9fiq
   RName_10usr  RName_10fiq  RName_11usr  RName_11fiq RName_12usr  RName_12fiq
   RName_SPusr  RName_SPfiq  RName_SPirq  RName_SPsvc
   RName_SPabt  RName_SPund  RName_SPmon  RName_SPhyp
   RName_LRusr  RName_LRfiq  RName_LRirq  RName_LRsvc
   RName_LRabt  RName_LRund  RName_LRmon
   RName_PC
}

declare REG :: RName -> word
declare ELR_hyp :: word

RName RBankSelect (mode::bits(5),
                   usr::RName, fiq::RName, irq::RName, svc::RName,
                   abt::RName, und::RName, mon::RName, hyp::RName) =
   if BadMode (mode) then
      #UNPREDICTABLE("RBankSelect: BadMode" : [mode])
   else
      match mode
      { case '10000' => usr  -- User mode
        case '10001' => fiq  -- FIQ mode
        case '10010' => irq  -- IRQ mode
        case '10011' => svc  -- Supervisor mode
        case '10110' => mon  -- Monitor mode
        case '10111' => abt  -- Abort mode
        case '11010' => hyp  -- Hyp mode
        case '11011' => und  -- Undefined mode
        case '11111' => usr  -- System mode uses User mode registers
      }

RName RfiqBankSelect (mode::bits(5), usr::RName, fiq::RName) =
   RBankSelect (mode, usr, fiq, usr, usr, usr, usr, usr, usr)

RName LookUpRName (n::reg, mode::bits(5)) =
   match n
   { case 0  => RName_0usr
     case 1  => RName_1usr
     case 2  => RName_2usr
     case 3  => RName_3usr
     case 4  => RName_4usr
     case 5  => RName_5usr
     case 6  => RName_6usr
     case 7  => RName_7usr
     case 8  => RfiqBankSelect (mode, RName_8usr, RName_8fiq)
     case 9  => RfiqBankSelect (mode, RName_9usr, RName_9fiq)
     case 10 => RfiqBankSelect (mode, RName_10usr, RName_10fiq)
     case 11 => RfiqBankSelect (mode, RName_11usr, RName_11fiq)
     case 12 => RfiqBankSelect (mode, RName_12usr, RName_12fiq)
     case 13 => RBankSelect (mode, RName_SPusr, RName_SPfiq, RName_SPirq,
                             RName_SPsvc, RName_SPabt, RName_SPund,
                             RName_SPmon, RName_SPhyp)
     case 14 => RBankSelect (mode, RName_LRusr, RName_LRfiq, RName_LRirq,
                             RName_LRsvc, RName_LRabt, RName_LRund,
                             RName_LRmon, RName_LRusr)
     case 15 => #ASSERT("LookUpRName: n >= 0 and n <= 14")
   }

component Rmode (n::reg, mode::bits(5)) :: word
{  value =
   {
      -- In Non-secure state, check for attempted use of Monitor mode
      -- ('10110'), or of FIQ mode ('10001') when the Security Extensions are
      -- reserving the FIQ registers. The definition of UNPREDICTABLE does not
      -- permit this to be a security hole.
      notSecure = not IsSecure();
      when notSecure and mode == 0b10110 do #UNPREDICTABLE("Rmode");
      when notSecure and mode == 0b10001 and
           CP15.NSACR.RFR do #UNPREDICTABLE("Rmode");
      REG(LookUpRName (n, mode))
   }
   assign value =
   {
      notSecure = not IsSecure();
      when notSecure and mode == 0b10110 do #UNPREDICTABLE("Rmode");
      when notSecure and mode == 0b10001
           and CP15.NSACR.RFR do #UNPREDICTABLE("Rmode");

     -- Writes of non word-aligned values to SP are only permitted in ARM state.
      when n == 13 and value<1:0> != 0 and CurrentInstrSet() != InstrSet_ARM do
         #UNPREDICTABLE("Rmode");

      REG(LookUpRName (n, mode)) <- value
   }
}

component R (n::reg) :: word
{  value =
      if n == 15 then
      {  offset = if CurrentInstrSet() == InstrSet_ARM then 8 else 4;
         return (REG(RName_PC) + offset)
      }
      else
         return (Rmode(n, CPSR.M))
   assign value =
      -- n >= 0 and n <= 14 asserted in LookUpRName
      Rmode(n, CPSR.M) <- value
}

component SP :: word { value = R(13) assign value = R(13) <- value }
component LR :: word { value = R(14) assign value = R(14) <- value }
word PC = R(15)

unit BranchTo (address::word) = REG(RName_PC) <- address

word PCStoreValue() =
   -- This function returns the PC value. On architecture versions before
   -- ARMv7, it is permitted to instead return PC+4, provided it does so
   -- consistently. It is used only to describe ARM instructions, so it returns
   -- the address of the current instruction plus 8 (normally) or 12 (when the
   -- alternative is permitted).
   return PC

unit BranchWritePC (address::word) =
   if CurrentInstrSet() == InstrSet_ARM then
   {  when ArchVersion() < 6 and address<1:0> != 0b00 do
         #UNPREDICTABLE("BranchWritePC");
      BranchTo (address<31:2> : '00')
   }
   else -- ARM reference has extra logic for Jazelle here
      BranchTo (address<31:1> : '0')

unit BXWritePC (address::word) =
   if CurrentInstrSet() == InstrSet_ThumbEE then
      if address<0> then
         BranchTo (address<31:1> : '0') -- Remain in ThumbEE state
      else
         #UNPREDICTABLE("BXWritePC")
   else
      if address<0> then
      {  SelectInstrSet(InstrSet_Thumb);
         BranchTo (address<31:1> : '0')
      }
      else if not address<1> then
      {  SelectInstrSet(InstrSet_ARM);
         BranchTo (address)
      }
      else -- address<1:0> == 0b10
         #UNPREDICTABLE("BXWritePC")

unit LoadWritePC (address::word) =
   if ArchVersion() >= 5 then
      BXWritePC (address)
   else
      BranchWritePC (address)

unit ALUWritePC (address::word) =
   if ArchVersion() >= 7 and CurrentInstrSet() == InstrSet_ARM then
      BXWritePC (address)
   else
      BranchWritePC (address)

nat ThisInstrLength() = if Encoding == Encoding_Thumb then 16 else 32

unit IncPC() =
   BranchTo (REG (RName_PC) + if ThisInstrLength() == 16 then 2 else 4)

--------------
-- Main Memory
--------------

declare MEM :: word -> byte

bool list mem1 (address::word) = [MEM(address)]

component mem (address::word, size::nat) :: bool list
{  value =
      match size
      { case 1 => (mem1(address + 0))<7:0>
        case 2 => (mem1(address + 1) : mem1(address + 0))<15:0>
        case 4 => (mem1(address + 3) : mem1(address + 2) :
                   mem1(address + 1) : mem1(address + 0))<31:0>
        case 8 => (mem1(address + 7) : mem1(address + 6) :
                   mem1(address + 5) : mem1(address + 4) :
                   mem1(address + 3) : mem1(address + 2) :
                   mem1(address + 1) : mem1(address + 0))<63:0>
        case _ => #ASSERT("mem: size in {1, 2, 4, 8}")
      }
   assign value =
      match size
      { case 1 =>   MEM(address + 0) <- [value<7:0>]
        case 2 => { MEM(address + 0) <- [value<7:0>];
                    MEM(address + 1) <- [value<15:8>]
                  }
        case 4 => { MEM(address + 0) <- [value<7:0>];
                    MEM(address + 1) <- [value<15:8>];
                    MEM(address + 2) <- [value<23:16>];
                    MEM(address + 3) <- [value<31:24>]
                  }
        case 8 => { MEM(address + 0) <- [value<7:0>];
                    MEM(address + 1) <- [value<15:8>];
                    MEM(address + 2) <- [value<23:16>];
                    MEM(address + 3) <- [value<31:24>];
                    MEM(address + 4) <- [value<39:32>];
                    MEM(address + 5) <- [value<47:40>];
                    MEM(address + 6) <- [value<55:48>];
                    MEM(address + 7) <- [value<63:56>]
                  }
        case _ => #ASSERT("mem: size in {1, 2, 4, 8}")
      }
}

bool list BigEndianReverse (value::bool list, n::nat) =
   match n
   { case 1 => value<7:0>
     case 2 => value<7:0> : value<15:8>
     case 4 => value<7:0> : value<15:8> : value<23:16> : value<31:24>
     case 8 => value<7:0> : value<15:8> : value<23:16> : value<31:24> :
               value<39:32> : value<47:40> : value<55:48> : value<63:56>
     case _ => #ASSERT("BigEndianReverse: n in {1, 2, 4, 8}")
   }

bits(N) Align (w::bits(N), n::nat) = [n * ([w] div n)]

bool Aligned (w::bits(N), n::nat) = w == Align (w, n)

component MemA_with_priv
            (address::word, size::nat, privileged::bool) :: bits(N)
            with N in 8,16,32,64
{  value =
   {  -- when 8 * size <> N do
      --   #ASSERT("MemA_with_priv: 8 * " : [size] : "<>" : [N]);
      var VA;

      -- Sort out aligment
      if Aligned (address, size) then
         VA <- address
      else if CP15.SCTLR.A or CP15.SCTLR.U then
         #AlignmentFault(address)
      else -- if legacy non alignment-checking configuration
         VA <- Align (address, size);

      -- Memory array access, and sort out endianness
      var value = mem(VA, size);
      when CPSR.E do
         value <- BigEndianReverse (value, size);

      return [value]
   }

   assign value =
   {
      var VA;

      -- Sort out aligment
      if Aligned (address, size) then
         VA <- address
      else if CP15.SCTLR.A or CP15.SCTLR.U then
         #AlignmentFault(address)
      else -- if legacy non alignment-checking configuration
         VA <- Align (address, size);

      -- Sort out endianness, then memory array access
      end_value = if CPSR.E then BigEndianReverse ([value], size) else [value];

      mem(VA, size) <- end_value
   }
}

component MemA_unpriv (address::word, size::nat) :: bits(N) with N in 8,16,32,64
{  value = MemA_with_priv (address, size, false)
   assign value = MemA_with_priv (address, size, false) <- value
}

component MemA (address::word, size::nat) :: bits(N) with N in 8,16,32,64
{  value = MemA_with_priv (address, size, CurrentModeIsNotUser())
   assign value =
     MemA_with_priv (address, size, CurrentModeIsNotUser()) <- value
}

component MemU_with_priv
             (address::word, size::nat, privileged::bool) :: bits(N)
             with N in 8,16,32,64
{  value =
   {  -- when 8 * size <> N do
      --   #ASSERT("MemU_with_priv: 8 * " : [size] : "<>" : [N]);
      var value = 0s0 ^ 64;

      -- Legacy non alignment-checking configuration forces accesses
      -- to be aligned
      VA = if not CP15.SCTLR.A and not CP15.SCTLR.U then
              Align(address, size)
           else
              address;

      -- Do aligned acess, take alignment failt, or do sequence of bytes
      if Aligned (VA, size) then
         value <- [MemA_with_priv (VA, size, privileged)::bits(N)]
      else if CP15.SCTLR.A then
         #AlignmentFault(address)
      else { -- if unaligned access, not SCTLR.A, and SCTLR.U
         for i in 0 .. size - 1 do
            value<8*i+7:8*i> <- [MemA_with_priv (VA+[i], 1, privileged)::byte];
         when CPSR.E do
            value <- BigEndianReverse (value, size)
      };

      return [value]
   }

   assign value =
   {
      -- Legacy non alignment-checking configuration forces accesses
      -- to be aligned
      VA = if not CP15.SCTLR.A and not CP15.SCTLR.U then
              Align (address, size)
           else
              address;

      -- Do aligned acess, take alignment failt, or do sequence of bytes
      if Aligned (VA, size) then
         MemA_with_priv (VA, size, privileged) <- value
      else if CP15.SCTLR.A then
         #AlignmentFault(address)
      else { -- if unaligned access, not SCTLR.A, and SCTLR.U
         v = if CPSR.E then BigEndianReverse ([value], size) else [value];
         for i in 0 .. size - 1 do
            MemA_with_priv (VA + [i], 1, privileged) <- [v<8*i+7:8*i>]::byte
      }
   }
}

component MemU_unpriv (address::word, size::nat) :: bits(N) with N in 8,16,32,64
{  value = MemU_with_priv (address, size, false)
   assign value = MemU_with_priv (address, size, false) <- value
}

component MemU (address::word, size::nat) :: bits(N) with N in 8,16,32,64
{  value = MemU_with_priv (address, size, CurrentModeIsNotUser())
   assign value =
     MemU_with_priv (address, size, CurrentModeIsNotUser()) <- value
}

bool NullCheckIfThumbEE (n::reg) =
{  var EndOfInstruction = false;
   when CurrentInstrSet() == InstrSet_ThumbEE do
      if n == 15 then
         when Align (PC, 4) == 0 do #UNPREDICTABLE("NullCheckIfThumbEE")
      else if n == 13 then
         when SP == 0 do #UNPREDICTABLE("NullCheckIfThumbEE")
      else when R(n) == 0 do
      {  LR <- PC<31:1> : '1'; -- PC holds this instruction’s address plus 4
         ITSTATE <- 0b00000000;
         BranchWritePC (CP14.TEEHBR - 4);
         EndOfInstruction <- true
      };
   return (not EndOfInstruction)
}

--------------------------------
-- Bit and arithmetic operations
--------------------------------

int HighestSetBit (w::bits(N)) = if w == 0 then -1 else [Log2 (w)]

nat CountLeadingZeroBits (w::bits(N)) = [[N] - 0i1 - HighestSetBit (w)]

nat LowestSetBit (w::bits(N)) = CountLeadingZeroBits (Reverse (w))

nat BitCount (w::bits(N)) =
{  var result = 0;
   for i in 0 .. N - 1 do
      when w<i> do result <- result + 0n1;
   return result
}

bits(N) SignExtendFrom (w::bits(N), p::nat) =
{  s = N - 1 - p;
   return w << s >> s
}

bits(N) Extend (unsigned::bool, w::bits(M)) =
   if unsigned then ZeroExtend (w) else SignExtend (w)

int UInt (w::bits(N)) = [[w]::nat]

-- Saturating arithmetic --

bits(M) * bool SignedSatQ (i::int, N::nat) =
{  when M < N do #ASSERT("SignedSatQ: M < N");
   max = [(2 ** (N - 1)) :: nat] :: int;
   if i > max - 1 then
      [max - 1], true
   else if i < -max then
      [-max], true
   else
      [i], false
}

bits(M) * bool UnsignedSatQ (i::int, N::nat) =
{  when M < N do #ASSERT("UnsignedSatQ: M < N");
   max = [(2 ** N - 1) :: nat] :: int;
   if i > max then
      [max], true
   else if i < 0 then
      0, true
   else
      [i], false
}

bits(M) SignedSat (i::int, N::nat) = Fst (SignedSatQ (i, N))
bits(M) UnsignedSat (i::int, N::nat) = Fst (UnsignedSatQ (i, N))

-- Shifts --

bits(N) * bool LSL_C (x::bits(N), shift::nat) =
{  when shift == 0 do #ASSERT "LSL_C";
   extended_x = [x] : (0s0 ^ shift);
   ( x << shift, extended_x<N> )
}

bits(N) LSL (x::bits(N), shift::nat) =
   if shift == 0 then
      x
   else
      Fst (LSL_C (x, shift))

bits(N) * bool LSR_C (x::bits(N), shift::nat) =
{  when shift == 0 do #ASSERT "LSR_C";
   ( x >>+ shift, shift <= N and x<shift-1> )
}

bits(N) LSR (x::bits(N), shift::nat) =
   if shift == 0 then
      x
   else
      Fst (LSR_C (x, shift))

bits(N) * bool ASR_C (x::bits(N), shift::nat) =
{  when shift == 0 do #ASSERT "ASR_C";
   ( x >> shift, x<Min(N, shift)-1> )
}

bits(N) ASR (x::bits(N), shift::nat) =
   if shift == 0 then
      x
   else
      Fst (ASR_C (x, shift))

bits(N) * bool ROR_C (x::bits(N), shift::nat) =
{  when shift == 0 do #ASSERT "ROR_C";
   result = x #>> shift;
   ( result, Msb (result) )
}

bits(N) ROR (x::bits(N), shift::nat) =
   if shift == 0 then
      x
   else
      Fst (ROR_C (x, shift))

bits(N) * bool RRX_C (x::bits(N), carry_in::bool) =
{  result = [[carry_in] : ([x]::bool list)<N-1:1>] :: bits(N);
   ( result, x<0> )
}

bits(N) RRX (x::bits(N), carry_in::bool) =
   Fst (RRX_C (x, carry_in))

-- Decode immediate values

construct SRType { SRType_LSL SRType_LSR SRType_ASR SRType_ROR SRType_RRX }

SRType * nat DecodeImmShift (typ::bits(2), imm5::bits(5)) =
   match typ
   { case '00' => SRType_LSL, [imm5]
     case '01' => SRType_LSR, if imm5 == 0b00000 then 32 else [imm5]
     case '10' => SRType_ASR, if imm5 == 0b00000 then 32 else [imm5]
     case '11' => if imm5 == 0b00000 then SRType_RRX, 1 else SRType_ROR, [imm5]
   }

SRType DecodeRegShift (typ::bits(2)) =
   match typ
   { case '00' => SRType_LSL
     case '01' => SRType_LSR
     case '10' => SRType_ASR
     case '11' => SRType_ROR
   }

bits(N) * bool Shift_C
                 (value::bits(N), typ::SRType, amount::nat, carry_in::bool) =
{  -- when typ == SRType_RRX and amount != 1 do #ASSERT("Shift_C");

   if amount == 0 then
      value, carry_in
   else
      match typ
      { case SRType_LSL => LSL_C (value, amount)
        case SRType_LSR => LSR_C (value, amount)
        case SRType_ASR => ASR_C (value, amount)
        case SRType_ROR => ROR_C (value, amount)
        case SRType_RRX => RRX_C (value, carry_in)
      }
}

bits(N) Shift (value::bits(N), typ::SRType, amount::nat, carry_in::bool) =
   Fst (Shift_C (value, typ, amount, carry_in))

word * bool ARMExpandImm_C (imm12::bits(12), carry_in::bool) =
{  unroatated_value = ZeroExtend (imm12<7:0>);
   Shift_C (unroatated_value, SRType_ROR, 0n2 * [imm12<11:8>], carry_in)
}

word ARMExpandImm (imm12::bits(12)) =
   -- APSR.C argument to following function call does not affect the imm32
   -- result
   Fst (ARMExpandImm_C (imm12, CPSR.C))

word * bool ThumbExpandImm_C (imm12::bits(12), carry_in::bool) =
   if imm12<11:10> == 0b00 then
   {  imm32 = match imm12<9:8>
              { case '00' =>
                  ZeroExtend (imm12<7:0>)
                case '01' =>
                  if imm12<7:0> == 0b00000000 then
                     #UNPREDICTABLE("ThumbExpandImm_C")
                  else
                     '00000000' : imm12<7:0> : '00000000' : imm12<7:0>
                case '10' =>
                  if imm12<7:0> == 0b00000000 then
                     #UNPREDICTABLE("ThumbExpandImm_C")
                  else
                     imm12<7:0> : '00000000' : imm12<7:0> : '00000000'
                case '11' =>
                  if imm12<7:0> == 0b00000000 then
                     #UNPREDICTABLE("ThumbExpandImm_C")
                  else
                     imm12<7:0> : imm12<7:0> : imm12<7:0> : imm12<7:0>
              };
      return imm32, carry_in
   }
   else
   {  unroatated_value = ZeroExtend ('1' : imm12<6:0>);
      return (ROR_C (unroatated_value, [imm12<11:7>]))
   }

word * bool ExpandImm_C (imm12::bits(12), carry_in::bool) =
   if Encoding == Encoding_Thumb2 then
      ThumbExpandImm_C (imm12, carry_in)
   else
      ARMExpandImm_C (imm12, carry_in)

{-
word ThumbExpandImm (imm12::bits(12)) =
   -- APSR.C argument to following function call does not affect the imm32
   -- result
   Fst (ThumbExpandImm_C (imm12, CPSR.C))
-}

-- Data processing operations

bits(N) * bool * bool AddWithCarry (x::bits(N), y::bits(N), carry_in::bool) =
{  unsigned_sum = [x] + [y] + [carry_in] :: nat;
   signed_sum = [x] + [y] + [carry_in] :: int;
   result = [unsigned_sum]::bits(N);
   carry_out = [result] != unsigned_sum;
   overflow = [result] != signed_sum;
   return result, carry_out, overflow
}

word * bool * bool DataProcessingALU (opc::bits(4), a::word, b::word, c::bool) =
   match opc
   { case '0000' or '1000' => a && b, c, UNKNOWN          -- AND, TST
     case '0001' or '1001' => a ?? b, c, UNKNOWN          -- EOR, TEQ
     case '0010' or '1010' => AddWithCarry (a, ~b, true)  -- SUB, CMP
     case '0011'           => AddWithCarry (~a, b, true)  -- RSB
     case '0100' or '1011' => AddWithCarry (a, b, false)  -- ADD, CMN
     case '0101'           => AddWithCarry (a, b, c)      -- ADC
     case '0110'           => AddWithCarry (a, ~b, c)     -- SBC
     case '0111'           => AddWithCarry (~a, b, c)     -- RSC
     case '1100'           => a || b, c, UNKNOWN          -- ORR
     case '1101'           => b, c, UNKNOWN               -- MOV
     case '1110'           => a && ~b, c, UNKNOWN         -- BIC
     case '1111'           => a || ~b, c, UNKNOWN         -- MVN, ORN
   }

bool ArithmeticOpcode (opc::bits(4)) =
   (opc<2> or opc<1>) and not (opc<3> and opc<2>)

---------------------
-- Exception handling
---------------------

word ExcVectorBase() =
   if CP15.SCTLR.V then -- Hivecs selected, base = 0xFFFF000
      0xFFFF000
   else if HaveSecurityExt() then
      CP15.VBAR
   else
      0x00000000

unit EnterMonitorMode
       (new_spsr_value::PSR, new_lr_value::word, vect_offset::word) =
{  CPSR.M <- 0b10110;
   SPSR <- new_spsr_value;
   R(14) <- new_lr_value;
   CPSR.J <- false;
   CPSR.T <- CP15.SCTLR.TE;
   CPSR.E <- CP15.SCTLR.EE;
   CPSR.A <- true;
   CPSR.F <- true;
   CPSR.I <- true;
   CPSR.IT <- 0b00000000;
   BranchTo (CP15.MVBAR + vect_offset)
}

unit EnterHypMode
       (new_spsr_value::PSR, new_lr_value::word, vect_offset::word) =
{  CPSR.M <- 0b11010;
   SPSR <- new_spsr_value;
   R(14) <- new_lr_value;
   CPSR.J <- false;
   CPSR.T <- CP15.SCTLR.TE;
   CPSR.E <- CP15.SCTLR.EE;
   CPSR.A <- true;
   CPSR.F <- true;
   CPSR.I <- true;
   CPSR.IT <- 0b00000000;
   BranchTo (CP15.MVBAR + vect_offset)
}

unit TakeReset() =
{  -- Enter Supervisor mode and (if relevant) Secure state, and reset CP15.
   -- This affects the banked versions and values of various registers accessed
   -- later in the code.  Also reset other system components.
   CPSR.M <- 0b10011;
   when HaveSecurityExt() do CP15.SCR.NS <- false;

   -- A bunch of system level logic from the ARM reference is missing here
   -- ResetCP15Registers() ??

   -- Further CPSR changes: all interrupts disabled, IT state reset,
   -- instruction set and endianness according to the SCTLR values produced
   -- by the above call to ResetCP15Registers().

   CPSR.I <- true;  CPSR.F <- true;  CPSR.A <- true;
   CPSR.IT <- 0b00000000;
   CPSR.J <- false;  CPSR.T <- CP15.SCTLR.TE;  -- TE=0: ARM, TE=1: Thumb
   CPSR.E <- CP15.SCTLR.EE;  -- EE=0: little-endian, EE=1: big-endian

   -- All registers, bits and fields not reset by the above pseudocode or by
   -- the BranchTo() call below are UNKNOWN bitstrings after reset. In
   -- particular, the return information registers R14_svc and SPSR_svc have
   -- UNKNOWN values, so that it is impossible to return from a reset in an
   -- architecturally defined way.

   -- Branch to Reset vector
   BranchTo (ExcVectorBase() + 0)
}

unit TakeUndefInstrException() =
{  -- Determine return information. SPSR is to be the current CPSR, and LR is
   -- to be the current PC minus 2 for Thumb or 4 for ARM, to change the PC
   -- offsets of 4 or 8 respectively from the address of the current
   -- instruction into the required return address offsets of 2 or 4
   -- respectively.
   new_lr_value = if CPSR.T then PC-2 else PC-4;
   new_spsr_value = CPSR;
   vect_offset = 4;

   -- Check whether to take exception to Hyp mode if in Hyp mode then stay in
   -- Hyp mode
   take_to_hyp = HaveVirtExt() and HaveSecurityExt() and
                 CP15.SCR.NS and CPSR.M == 0b11010;
   -- if HCR.TGE is set, take to Hyp mode through Hyp Trap vector
   route_to_hyp = HaveVirtExt() and HaveSecurityExt() and !IsSecure() and
                  CP15.HCR.TGE and CPSR.M == 0b10000;
   -- User mode if HCR.TGE == '1' and in a Non-secure PL1 mode, the effect is
   -- UNPREDICTABLE

   return_offset = if CPSR.T then 2 else 4;
   preferred_exceptn_return = new_lr_value - return_offset;
   if take_to_hyp then
      -- Note that whatever called TakeUndefInstrException() will have set the
      -- HSR
      EnterHypMode(new_spsr_value, preferred_exceptn_return, vect_offset)
   else if route_to_hyp then
      -- Note that whatever called TakeUndefInstrException() will have set the
      -- HSR
      EnterHypMode(new_spsr_value, preferred_exceptn_return, 20)
   else
   {  -- Enter Undefined (‘11011’) mode, and ensure Secure state if initially in
      -- Monitor (‘10110’) mode. This affects the banked versions of various
      -- registers accessed later in the code.
      when CPSR.M == 0b10110 do CP15.SCR.NS <- false;
      CPSR.M <- 0b11011;

      -- Write return information to registers, and make further CPSR
      -- changes: IRQs disabled, IT state reset, instruction set and endianness
      -- to SCTLR-configured values.
      SPSR <- new_spsr_value;
      R(14) <- new_lr_value;
      CPSR.I <- true;
      CPSR.IT <- 0b00000000;
      CPSR.J <- false;  CPSR.T <- CP15.SCTLR.TE; -- TE=0: ARM, TE=1: Thumb
      CPSR.E <- CP15.SCTLR.EE; -- EE=0: little-endian, EE=1: big-endian

      -- Branch to Undefined Instruction vector.
      BranchTo (ExcVectorBase() + vect_offset)
   }
}

unit TakeSVCException() =
{  -- Determine return information. SPSR is to be the current CPSR, after
   -- changing the IT[] bits to give them the correct values for the following
   -- instruction, and LR is to be the current PC minus 2 for Thumb or 4 for
   -- ARM, to change the PC offsets of 4 or 8 respectively from the address of
   -- the current instruction into the required address of the next instruction
   -- (the SVC instruction having size 2 or 4 bytes respectively).
   ITAdvance();
   new_lr_value = if CPSR.T then PC-2 else PC-4;
   new_spsr_value = CPSR;
   vect_offset = 8;

   -- Check whether to take exception to Hyp mode if in Hyp mode then stay in
   -- Hyp mode
   take_to_hyp = HaveVirtExt() and HaveSecurityExt() and
                 CP15.SCR.NS and CPSR.M == 0b11010;
   -- if HCR.TGE is set, take to Hyp mode through Hyp Trap vector
   route_to_hyp = HaveVirtExt() and HaveSecurityExt() and !IsSecure() and
                  CP15.HCR.TGE and CPSR.M == 0b10000;
   -- User mode if HCR.TGE == '1' and in a Non-secure PL1 mode, the effect is
   -- UNPREDICTABLE

   preferred_exceptn_return = new_lr_value;
   if take_to_hyp then
      -- Note that whatever called TakeUndefInstrException() will have set the
      -- HSR
      EnterHypMode(new_spsr_value, preferred_exceptn_return, vect_offset)
   else if route_to_hyp then
      -- Note that whatever called TakeUndefInstrException() will have set the
      -- HSR
      EnterHypMode(new_spsr_value, preferred_exceptn_return, 20)
   else
   {  -- Enter Supervisor (‘10011’) mode, and ensure Secure state if initially
      -- in Monitor (‘10110’) mode. This affects the banked versions of various
      -- registers accessed later in the code.
      when CPSR.M == 0b10110 do CP15.SCR.NS <- false;
      CPSR.M <- 0b10011;

      -- Write return information to registers, and make further CPSR changes:
      -- IRQs disabled, IT state reset, instruction set and endianness to
      -- SCTLR-configured values.
      SPSR <- new_spsr_value;
      R(14) <- new_lr_value;
      CPSR.I <- true;
      CPSR.IT <- 0b00000000;
      CPSR.J <- false;  CPSR.T <- CP15.SCTLR.TE; -- TE=0: ARM, TE=1: Thumb
      CPSR.E <- CP15.SCTLR.EE; -- EE=0: little-endian, EE=1: big-endian

      -- Branch to SVC vector.
      BranchTo (ExcVectorBase() + vect_offset)
   }
}

unit TakeSMCException() =
{  -- Determine return information. SPSR is to be the current CPSR, after
   -- changing the IT[] bits to give them the correct values for the following
   -- instruction, and LR is to be the current PC minus 0 for Thumb or 4 for
   -- ARM, to change the PC offsets of 4 or 8 respectively from the address of
   -- the current instruction into the required address of the next instruction
   -- (with the SMC instruction always being 4 bytes in length).
   ITAdvance();
   new_lr_value = if CPSR.T then PC else PC-4;
   new_spsr_value = CPSR;
   vect_offset = 8;

   -- Enter Monitor (‘10110’) mode, and ensure Secure state if initially in
   -- Monitor mode.  This affects the banked versions of various registers
   -- accessed later in the code.
   when CPSR.M == 0b10110 do CP15.SCR.NS <- false;
   CPSR.M <- 0b10110;

   EnterMonitorMode (new_spsr_value, new_lr_value, vect_offset)
}

unit TakeHVCException() =
{  -- Determine return information. SPSR is to be the current CPSR, after
   -- changing the IT[] bits to give them the correct values for the following
   -- instruction, and LR is to be the current PC minus 0 for Thumb or 4 for
   -- ARM, to change the PC offsets of 4 or 8 respectively from the address of
   -- the current instruction into the required address of the next instruction
   -- (with the HVC instruction always being 4 bytes in length).
   ITAdvance();
   preferred_exceptn_return = if CPSR.T then PC else PC - 4;
   new_spsr_value = CPSR;

   -- Enter Hyp mode. HVC pseudocode has checked that use of HVC is valid.
   -- Required vector offset depends on whether current mode is Hyp mode.
   if CPSR.M == 0b11010 then
      EnterHypMode (new_spsr_value, preferred_exceptn_return, 8)
   else
      EnterHypMode (new_spsr_value, preferred_exceptn_return, 20)
}

unit TakeDataAbortException() =
{  -- Determine return information. SPSR is to be the current CPSR, and LR is
   -- to be the current PC plus 4 for Thumb or 0 for ARM, to change the PC
   -- offsets of 4 or 8 respectively from the address of the current
   -- instruction into the required address of the current instruction plus 8.
   -- For an asynchronous abort, the PC and CPSR are considered to have already
   -- moved on to their values for the instruction following the instruction
   -- boundary at which the exception occurred.

   new_lr_value = if CPSR.T then PC+4 else PC;
   new_spsr_value = CPSR;
   vect_offset = 16;
   preferred_exceptn_return = new_lr_value - 8;

   -- Determine whether this is an external abort to be routed to Monitor mode.
   route_to_monitor = HaveSecurityExt() and CP15.SCR.EA and IsExternalAbort();

   -- Check whether to take exception to Hyp mode
   -- if in Hyp mode then stay in Hyp mode
   take_to_hyp = HaveVirtExt() and HaveSecurityExt() and CP15.SCR.NS and
                 CPSR.M == 0b11010;
   -- otherwise, check whether to take to Hyp mode through Hyp Trap vector
   route_to_hyp = false;
   -- if HCR.TGE == '1' and in a Non-secure PL1 mode, the effect is
   -- UNPREDICTABLE

   if route_to_monitor then
   {  -- Ensure Secure state if initially in Monitor ('10110') mode. This
      -- affects the Banked versions of various registers accessed later in the
      -- code.
      when CPSR.M == 0b10110 do CP15.SCR.NS <- false;
      EnterMonitorMode (new_spsr_value, new_lr_value, vect_offset)
   }
   else if take_to_hyp then
      -- Note that whatever called TakePrefetchAbortException() will have set
      -- the HSR
      EnterHypMode (new_spsr_value, preferred_exceptn_return, vect_offset)
   else if route_to_hyp then
      EnterHypMode (new_spsr_value, preferred_exceptn_return, 20)
   else
   {  -- Handle in Abort mode. Ensure Secure state if initially in Monitor
      -- mode. This affects the Banked versions of various registers accessed
      -- later in the code.
      when HaveSecurityExt() and CPSR.M == 0b10110 do CP15.SCR.NS <- false;
      CPSR.M <- 0b10111;

      -- Write return information to registers, and make further CPSR changes:
      -- IRQs disabled, other interrupts disabled if appropriate, IT state
      -- reset, instruction set and endianness to SCTLR-configured values.
      SPSR <- new_spsr_value;
      R(14) <- new_lr_value;
      CPSR.I <- true;
      when not HaveSecurityExt() or HaveVirtExt() or not CP15.SCR.NS or
           CP15.SCR.AW do
        CPSR.A <- true;
      CPSR.IT <- 0b00000000;
      CPSR.J <- false;  CPSR.T <- CP15.SCTLR.TE; -- TE=0: ARM, TE=1: Thumb
      CPSR.E <- CP15.SCTLR.EE; -- EE=0: little-endian, EE=1: big-endian

      BranchTo (ExcVectorBase() + vect_offset)
   }
}

unit TakePrefetchAbortException() =
{  -- Determine return information. SPSR is to be the current CPSR, and LR is
   -- to be the current PC minus 0 for Thumb or 4 for ARM, to change the PC
   -- offsets of 4 or 8 respectively from the address of the current
   -- instruction into the required address of the current instruction plus 4.
   new_lr_value = if CPSR.T then PC else PC-4;
   new_spsr_value = CPSR;
   vect_offset = 12;
   preferred_exceptn_return = new_lr_value - 4;

   -- Determine whether this is an external abort to be routed to Monitor mode.
   route_to_monitor = HaveSecurityExt() and CP15.SCR.EA and IsExternalAbort();

   -- Check whether to take exception to Hyp mode
   -- if in Hyp mode then stay in Hyp mode
   take_to_hyp = HaveVirtExt() and HaveSecurityExt() and CP15.SCR.NS and
                 CPSR.M == 0b11010;
   -- otherwise, check whether to take to Hyp mode through Hyp Trap vector
   -- route_to_hyp = ??  **Hard to model this**
   route_to_hyp = false;
   -- if HCR.TGE == '1' and in a Non-secure PL1 mode, the effect is
   -- UNPREDICTABLE

   if route_to_monitor then
   {  -- Ensure Secure state if initially in Monitor ('10110') mode. This
      -- affects the Banked versions of various registers accessed later in the
      -- code.
      when CPSR.M == 0b10110 do CP15.SCR.NS <- false;
      EnterMonitorMode (new_spsr_value, new_lr_value, vect_offset)
   }
   else if take_to_hyp then
      -- Note that whatever called TakePrefetchAbortException() will have set
      -- the HSR
      EnterHypMode (new_spsr_value, preferred_exceptn_return, vect_offset)
   else if route_to_hyp then
      EnterHypMode (new_spsr_value, preferred_exceptn_return, 20)
   else
   {  -- Handle in Abort mode. Ensure Secure state if initially in Monitor
      -- mode. This affects the Banked versions of various registers accessed
      -- later in the code.
      when HaveSecurityExt() and CPSR.M == 0b10110 do CP15.SCR.NS <- false;
      CPSR.M <- 0b10111;

      -- Write return information to registers, and make further CPSR changes:
      -- IRQs disabled, other interrupts disabled if appropriate, IT state
      -- reset, instruction set and endianness to SCTLR-configured values.
      SPSR <- new_spsr_value;
      R(14) <- new_lr_value;
      CPSR.I <- true;
      when not HaveSecurityExt() or HaveVirtExt() or not CP15.SCR.NS or
           CP15.SCR.AW do
        CPSR.A <- true;
      CPSR.IT <- 0b00000000;
      CPSR.J <- false;  CPSR.T <- CP15.SCTLR.TE; -- TE=0: ARM, TE=1: Thumb
      CPSR.E <- CP15.SCTLR.EE; -- EE=0: little-endian, EE=1: big-endian

      BranchTo (ExcVectorBase() + vect_offset)
   }
}

unit TakePhysicalIRQException() =
{  -- Determine return information. SPSR is to be the current CPSR, and LR is
   -- to be the current PC minus 0 for Thumb or 4 for ARM, to change the PC
   -- offsets of 4 or 8 respectively from the address of the current
   -- instruction into the required address of the instruction boundary at
   -- which the interrupt occurred plus 4. For this purpose, the PC and CPSR
   -- are considered to have already moved on to their values for the
   -- instruction following that boundary.
   new_lr_value = if CPSR.T then PC else PC-4;
   new_spsr_value = CPSR;
   vect_offset = 24;

   -- Determine whether IRQs are routed to Monitor mode.
   route_to_monitor = HaveSecurityExt() and CP15.SCR.IRQ;

   -- Determine whether IRQs are routed to Hyp mode.
   route_to_hyp = (HaveVirtExt() and HaveSecurityExt() and not CP15.SCR.IRQ and
                   CP15.HCR.IMO and not IsSecure()) or CPSR.M == 0b11010;

   if route_to_monitor then
   {  -- Ensure Secure state if initially in Monitor ('10110') mode. This
      -- affects the Banked versions of various registers accessed later in the
      -- code.
      when CPSR.M == 0b10110 do CP15.SCR.NS <- false;
      EnterMonitorMode (new_spsr_value, new_lr_value, vect_offset)
   }
   else if route_to_hyp then
   {  CP15.HSR <- UNKNOWN;
      preferred_exceptn_return = new_lr_value - 4;
      EnterHypMode (new_spsr_value, preferred_exceptn_return, vect_offset)
   }
   else
   {  -- Handle in IRQ mode. Ensure Secure state if initially in Monitor mode.
      -- This affects the Banked versions of various registers accessed later
      -- in the code.
      when CPSR.M == 0b10110 do CP15.SCR.NS <- false;
      CPSR.M <- 0b10010;

      -- Write return information to registers, and make further CPSR changes:
      -- IRQs disabled, other interrupts disabled if appropriate, IT state
      -- reset, instruction set and endianness to SCTLR-configured values.
      SPSR <- new_spsr_value;
      R(14) <- new_lr_value;
      CPSR.I <- true;
      when not HaveSecurityExt() or HaveVirtExt() or not CP15.SCR.NS or
           CP15.SCR.AW do
        CPSR.A <- true;

      CPSR.IT <- 0b00000000;
      CPSR.J <- false;  CPSR.T <- CP15.SCTLR.TE; -- TE=0: ARM, TE=1: Thumb
      CPSR.E <- CP15.SCTLR.EE; -- EE=0: little-endian, EE=1: big-endian

      -- Branch to correct IRQ vector.
      if CP15.SCTLR.VE then
         #IMPLEMENTATION_DEFINED("branch to an IRQ vector")
      else
         BranchTo (ExcVectorBase() + vect_offset)
   }
}

unit TakeVirtualIRQException() =
{  -- Determine return information. SPSR is to be the current CPSR, and LR is
   -- to be the current PC minus 0 for Thumb or 4 for ARM, to change the PC
   -- offsets of 4 or 8 respectively from the address of the current
   -- instruction into the required address of the instruction boundary at
   -- which the interrupt occurred plus 4. For this purpose, the PC and CPSR
   -- are considered to have already moved on to their values for the
   -- instruction following that boundary.
   new_lr_value = if CPSR.T then PC else PC-4;
   new_spsr_value = CPSR;
   vect_offset = 24;

   CPSR.M <- 0b10010;

   -- Write return information to registers, and make further CPSR changes:
   -- IRQs disabled, other interrupts disabled if appropriate, IT state
   -- reset, instruction set and endianness to SCTLR-configured values.
   SPSR <- new_spsr_value;
   R(14) <- new_lr_value;
   CPSR.I <- true;
   CPSR.A <- true;
   CPSR.IT <- 0b00000000;
   CPSR.J <- false;  CPSR.T <- CP15.SCTLR.TE; -- TE=0: ARM, TE=1: Thumb
   CPSR.E <- CP15.SCTLR.EE; -- EE=0: little-endian, EE=1: big-endian

   -- Branch to correct IRQ vector.
   if CP15.SCTLR.VE then
      #IMPLEMENTATION_DEFINED("branch to an IRQ vector")
   else
      BranchTo (ExcVectorBase() + vect_offset)
}

unit TakePhysicalFIQException() =
{  -- Determine return information. SPSR is to be the current CPSR, and LR is
   -- to be the current PC minus 0 for Thumb or 4 for ARM, to change the PC
   -- offsets of 4 or 8 respectively from the address of the current
   -- instruction into the required address of the instruction boundary at
   -- which the interrupt occurred plus 4. For this purpose, the PC and CPSR
   -- are considered to have already moved on to their values for the
   -- instruction following that boundary.
   new_lr_value = if CPSR.T then PC else PC-4;
   new_spsr_value = CPSR;
   vect_offset = 28;

   -- Determine whether FIQs are routed to Monitor mode.
   route_to_monitor = HaveSecurityExt() and CP15.SCR.FIQ;

   -- Determine whether FIQs are routed to Hyp mode.
   route_to_hyp = (HaveVirtExt() and HaveSecurityExt() and not CP15.SCR.FIQ and
                   CP15.HCR.FMO and not IsSecure()) or CPSR.M == 0b11010;

   if route_to_monitor then
   {  -- Ensure Secure state if initially in Monitor ('10110') mode. This
      -- affects the Banked versions of various registers accessed later in the
      -- code.
      when CPSR.M == 0b10110 do CP15.SCR.NS <- false;
      EnterMonitorMode (new_spsr_value, new_lr_value, vect_offset)
   }
   else if route_to_hyp then
   {  CP15.HSR <- UNKNOWN;
      preferred_exceptn_return = new_lr_value - 4;
      EnterHypMode (new_spsr_value, preferred_exceptn_return, vect_offset)
   }
   else
   {  -- Handle in FIQ mode. Ensure Secure state if initially in Monitor mode.
      -- This affects the Banked versions of various registers accessed later
      -- in the code.
      when CPSR.M == 0b10110 do CP15.SCR.NS <- false;
      CPSR.M <- 0b10001;

      -- Write return information to registers, and make further CPSR changes:
      -- FIQs disabled, other interrupts disabled if appropriate, IT state
      -- reset, instruction set and endianness to SCTLR-configured values.
      SPSR <- new_spsr_value;
      R(14) <- new_lr_value;
      CPSR.I <- true;
      when not HaveSecurityExt() or HaveVirtExt() or not CP15.SCR.NS or
           CP15.SCR.FW do
        CPSR.F <- true;
      when not HaveSecurityExt() or HaveVirtExt() or not CP15.SCR.NS or
           CP15.SCR.AW do
        CPSR.A <- true;

      CPSR.IT <- 0b00000000;
      CPSR.J <- false;  CPSR.T <- CP15.SCTLR.TE; -- TE=0: ARM, TE=1: Thumb
      CPSR.E <- CP15.SCTLR.EE; -- EE=0: little-endian, EE=1: big-endian

      -- Branch to correct FIQ vector.
      if CP15.SCTLR.VE then
         #IMPLEMENTATION_DEFINED("branch to an FIQ vector")
      else
         BranchTo (ExcVectorBase() + vect_offset)
    }
}

unit TakeVirtualFIQException() =
{  -- Determine return information. SPSR is to be the current CPSR, and LR is
   -- to be the current PC minus 0 for Thumb or 4 for ARM, to change the PC
   -- offsets of 4 or 8 respectively from the address of the current
   -- instruction into the required address of the instruction boundary at
   -- which the interrupt occurred plus 4. For this purpose, the PC and CPSR
   -- are considered to have already moved on to their values for the
   -- instruction following that boundary.
   new_lr_value = if CPSR.T then PC else PC-4;
   new_spsr_value = CPSR;
   vect_offset = 28;

   CPSR.M <- 0b10001;

   -- Write return information to registers, and make further CPSR changes:
   -- FIQs disabled, other interrupts disabled if appropriate, IT state
   -- reset, instruction set and endianness to SCTLR-configured values.
   SPSR <- new_spsr_value;
   R(14) <- new_lr_value;
   CPSR.I <- true;
   CPSR.F <- true;
   CPSR.A <- true;
   CPSR.IT <- 0b00000000;
   CPSR.J <- false;  CPSR.T <- CP15.SCTLR.TE; -- TE=0: ARM, TE=1: Thumb
   CPSR.E <- CP15.SCTLR.EE; -- EE=0: little-endian, EE=1: big-endian

   -- Branch to correct FIQ vector.
   if CP15.SCTLR.VE then
      #IMPLEMENTATION_DEFINED("branch to an FIQ vector")
   else
      BranchTo (ExcVectorBase() + vect_offset)
}

unit TakeHypTrapException() =
{  -- HypTrapException is caused by executing an instruction that is trapped to
   -- Hyp mode as a result of a trap set by a bit in the HCR, HCPTR, HSTR or
   -- HDCR. By definition, it can only be generated in a Non-secure mode other
   -- than Hyp mode.  Note that, when a Supervisor Call exception is taken to
   -- Hyp mode because HCR.TGE==1, this is not a trap of the SVC instruction.
   -- See the TakeSVCException() pseudocode for this case.
   preferred_exceptn_return = if CPSR.T then PC-4 else PC-8;
   new_spsr_value = CPSR;
   EnterHypMode (new_spsr_value, preferred_exceptn_return, 20)
}

unit WriteHSR (ec::bits(6), HSRString::bits(25)) =
{  var HSRValue = 0;
   HSRValue<31:26> <- ec;

   -- HSR.IL not valid for Prefetch Aborts (0x20, 0x21) and Data Aborts (0x24,
   -- 0x25) for which the ISS information is not valid.
   when ec<5:3> != 0b100 or ec<2> and HSRString<24> do
      HSRValue<25> <- ThisInstrLength() == 32;

   -- Condition code valid for EC[5:4] nonzero
   if ec<5:4> == 0b00 and ec<3:0> != 0b0000 then
      if CurrentInstrSet() == InstrSet_ARM then
      {  -- in the ARM instruction set
         HSRValue<24> <- true;
         HSRValue<23:20> <- CurrentCond()
      }
      else
      {  HSRValue<24> <- UNKNOWN; -- IMPLEMENTATION_DEFINED
         when HSRValue<24> do
            if ConditionPassed() then
               HSRValue<23:20> <- if UNKNOWN then CurrentCond() else 0b1110
            else
               HSRValue<23:20> <- CurrentCond();
         HSRValue<19:0> <- HSRString<19:0>
      }
   else
      HSRValue<24:0> <- HSRString;

   CP15.&HSR <- HSRValue
}

unit CallSupervisor (immediate::half) =
{  when CurrentModeIsHyp() or
        HaveVirtExt() and not IsSecure() and not CurrentModeIsNotUser() and
        CP15.HCR.TGE do
   {  -- will be taken to Hyp mode so must set HSR
      var HSRString = 0;
      HSRString<15:0> <- if CurrentCond() == 0b1110 then immediate else UNKNOWN;
      WriteHSR (0b010010, HSRString)
   };
   TakeSVCException()
}

unit CallHypervisor (immediate::half) =
{  HSRString = immediate : 0;
   WriteHSR (0b010010, HSRString);
   TakeHVCException()
}

----------------------------------------------------
-- Support for Banked register transfer instructions
----------------------------------------------------

unit BankedRegisterAccessValid (SYSm::bits(5), mode::bits(5)) =
   if SYSm<4:3> == 0b00 then
      if SYSm<2:0> == 0b111 then
         #UNPREDICTABLE("BankedRegisterAccessValid")
      else if SYSm<2:0> == 0b110 then
         when mode in set { 0b11010, 0b11111 } do
            #UNPREDICTABLE("BankedRegisterAccessValid")
      else if SYSm<2:0> == 0b101 then
         when mode == 0b11111 do
            #UNPREDICTABLE("BankedRegisterAccessValid")
      else when mode != 0b10001 do
         #UNPREDICTABLE("BankedRegisterAccessValid")
   else if SYSm<4:3> == 0b01 then
      when SYSm<2:0> == 0b111 or mode == 0b10001 or
           CP15.NSACR.RFR and not IsSecure() do
         #UNPREDICTABLE("BankedRegisterAccessValid")
   else when SYSm<4:3> == 0b11 do
      if not SYSm<2> then
         #UNPREDICTABLE("BankedRegisterAccessValid")
      else if not SYSm<1> then
         when not IsSecure() or mode == 0b10110 do
            #UNPREDICTABLE("BankedRegisterAccessValid")
      else
         when mode != 0b10110 do
            #UNPREDICTABLE("BankedRegisterAccessValid")

unit SPSRAccessValid (SYSm::bits(5), mode::bits(5)) =
   match SYSm
   { case '01110' =>                                 -- SPSR_fiq
        when not IsSecure() and CP15.NSACR.RFR or    -- 10001 is FIQ mode
             mode == 0b10001 do
           #UNPREDICTABLE("SPSRAccessValid")
     case '10000' =>                                 -- SPSR_irq
        when mode == 0b10010 do                      -- 10010 is IRQ mode
           #UNPREDICTABLE("SPSRAccessValid")
     case '10010' =>                                 -- SPSR_svc
        when mode == 0b10011 do                      -- 10011 is Supervisor mode
           #UNPREDICTABLE("SPSRAccessValid")
     case '10100' =>                                 -- SPSR_abt
        when mode == 0b10111 do                      -- 10111 is Abort mode
           #UNPREDICTABLE("SPSRAccessValid")
     case '10110' =>                                 -- SPSR_und
        when mode == 0b11011 do                      -- 11011 is Undefined mode
           #UNPREDICTABLE("SPSRAccessValid")
     case '11100' =>                                 -- SPSR_mon
        when mode == 0b10110 or not IsSecure() do    -- 10110 is Monitor mode
           #UNPREDICTABLE("SPSRAccessValid")
     case '11110' =>                                 -- SPSR_hyp
        when mode != 0b10110 do
           #UNPREDICTABLE("SPSRAccessValid")
     case _ => #UNPREDICTABLE("SPSRAccessValid")
   }
