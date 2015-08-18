---------------------------------------------------------------------------
-- Model of the 64-bit MIPS ISA (MIPS III with some extra instructions)
-- (c) Anthony Fox, University of Cambridge
---------------------------------------------------------------------------

{-

val () = Runtime.LoadF "mips-base.spec, mips.spec"
val () = HolExport.spec ("mips-base.spec, mips.spec", "hol/mips")

-}

--================================================
-- Instructions
--================================================

bool NotWordValue(value::dword) =
{  top = value<63:32>;
   if value<31> then
      top <> 0xFFFF_FFFF
   else
      top <> 0x0
}

-----------------------------------
-- ADDI rt, rs, immediate
-----------------------------------
define ArithI > ADDI (rs::reg, rt::reg, immediate::bits(16)) =
{
   when NotWordValue (GPR(rs)) do #UNPREDICTABLE("ADDI: NotWordValue");
   temp = GPR(rs)<32:0> + SignExtend (immediate);
   if temp<32> <> temp<31> then
      SignalException (Ov)
   else
      GPR(rt) <- SignExtend (temp<31:0>)
}

-----------------------------------
-- ADDIU rt, rs, immediate
-----------------------------------
define ArithI > ADDIU (rs::reg, rt::reg, immediate::bits(16)) =
{
   when NotWordValue (GPR(rs)) do #UNPREDICTABLE("ADDIU: NotWordValue");
   temp = GPR(rs)<31:0> + SignExtend (immediate);
   GPR(rt) <- SignExtend (temp)
}

-----------------------------------
-- DADDI rt, rs, immediate
-----------------------------------
define ArithI > DADDI (rs::reg, rt::reg, immediate::bits(16)) =
{
   temp`65 = SignExtend (GPR(rs)) + SignExtend (immediate);
   if temp<64> <> temp<63> then
      SignalException (Ov)
   else
      GPR(rt) <- temp<63:0>
}

-----------------------------------
-- DADDIU rt, rs, immediate
-----------------------------------
define ArithI > DADDIU (rs::reg, rt::reg, immediate::bits(16)) =
   GPR(rt) <- GPR(rs) + SignExtend (immediate)

-----------------------------------
-- SLTI rt, rs, immediate
-----------------------------------
define ArithI > SLTI (rs::reg, rt::reg, immediate::bits(16)) =
   GPR(rt) <- [GPR(rs) < SignExtend (immediate)]

-----------------------------------
-- SLTIU rt, rs, immediate
-----------------------------------
define ArithI > SLTIU (rs::reg, rt::reg, immediate::bits(16)) =
   GPR(rt) <- [GPR(rs) <+ SignExtend (immediate)]

-----------------------------------
-- ANDI rt, rs, immediate
-----------------------------------
define ArithI > ANDI (rs::reg, rt::reg, immediate::bits(16)) =
   GPR(rt) <- GPR(rs) && ZeroExtend (immediate)

-----------------------------------
-- ORI rt, rs, immediate
-----------------------------------
define ArithI > ORI (rs::reg, rt::reg, immediate::bits(16)) =
   GPR(rt) <- GPR(rs) || ZeroExtend (immediate)

-----------------------------------
-- XORI rt, rs, immediate
-----------------------------------
define ArithI > XORI (rs::reg, rt::reg, immediate::bits(16)) =
   GPR(rt) <- GPR(rs) ?? ZeroExtend (immediate)

-----------------------------------
-- LUI rt, immediate
-----------------------------------
define ArithI > LUI (rt::reg, immediate::bits(16)) =
   GPR(rt) <- SignExtend (immediate : 0`16)

-----------------------------------
-- ADD rd, rs, rt
-----------------------------------
define ArithR > ADD (rs::reg, rt::reg, rd::reg) =
{
   when NotWordValue (GPR(rs)) or NotWordValue (GPR(rt))
     do #UNPREDICTABLE("ADD: NotWordValue");
   temp = GPR(rs)<32:0> + GPR(rt)<32:0>;
   if temp<32> <> temp<31> then
      SignalException (Ov)
   else
      GPR(rd) <- SignExtend (temp<31:0>)
}

-----------------------------------
-- ADDU rd, rs, rt
-----------------------------------
define ArithR > ADDU (rs::reg, rt::reg, rd::reg) =
{
   when NotWordValue (GPR(rs)) or NotWordValue (GPR(rt))
     do #UNPREDICTABLE("ADDU: NotWordValue");
   temp = GPR(rs)<31:0> + GPR(rt)<31:0>;
   GPR(rd) <- SignExtend (temp)
}

-----------------------------------
-- SUB rd, rs, rt
-----------------------------------
define ArithR > SUB (rs::reg, rt::reg, rd::reg) =
{
   when NotWordValue (GPR(rs)) or NotWordValue (GPR(rt))
     do #UNPREDICTABLE("SUB: NotWordValue");
   temp = GPR(rs)<32:0> - GPR(rt)<32:0>;
   if temp<32> <> temp<31> then
      SignalException (Ov)
   else
      GPR(rd) <- SignExtend (temp<31:0>)
}

-----------------------------------
-- SUBU rd, rs, rt
-----------------------------------
define ArithR > SUBU (rs::reg, rt::reg, rd::reg) =
{
   when NotWordValue (GPR(rs)) or NotWordValue (GPR(rt))
     do #UNPREDICTABLE("SUBU: NotWordValue");
   temp = GPR(rs)<31:0> - GPR(rt)<31:0>;
   GPR(rd) <- SignExtend (temp)
}

-----------------------------------
-- DADD rd, rs, rt
-----------------------------------
define ArithR > DADD (rs::reg, rt::reg, rd::reg) =
{
   temp`65 = SignExtend (GPR(rs)) + SignExtend (GPR(rt));
   if temp<64> <> temp<63> then
      SignalException (Ov)
   else
      GPR(rd) <- temp<63:0>
}

-----------------------------------
-- DADDU rd, rs, rt
-----------------------------------
define ArithR > DADDU (rs::reg, rt::reg, rd::reg) =
   GPR(rd) <- GPR(rs) + GPR(rt)

-----------------------------------
-- DSUB rd, rs, rt
-----------------------------------
define ArithR > DSUB (rs::reg, rt::reg, rd::reg) =
{
   temp`65 = SignExtend (GPR(rs)) - SignExtend (GPR(rt));
   if temp<64> <> temp<63> then
      SignalException (Ov)
   else
      GPR(rd) <- temp<63:0>
}

-----------------------------------
-- DSUBU rd, rs, rt
-----------------------------------
define ArithR > DSUBU (rs::reg, rt::reg, rd::reg) =
   GPR(rd) <- GPR(rs) - GPR(rt)

-----------------------------------
-- SLT rd, rs, rt
-----------------------------------
define ArithR > SLT (rs::reg, rt::reg, rd::reg) =
   GPR(rd) <- [GPR(rs) < GPR(rt)]

-----------------------------------
-- SLTU rd, rs, rt
-----------------------------------
define ArithR > SLTU (rs::reg, rt::reg, rd::reg) =
   GPR(rd) <- [GPR(rs) <+ GPR(rt)]

-----------------------------------
-- AND rd, rs, rt
-----------------------------------
define ArithR > AND (rs::reg, rt::reg, rd::reg) =
   GPR(rd) <- GPR(rs) && GPR(rt)

-----------------------------------
-- OR rd, rs, rt
-----------------------------------
define ArithR > OR (rs::reg, rt::reg, rd::reg) =
   GPR(rd) <- GPR(rs) || GPR(rt)

-----------------------------------
-- XOR rd, rs, rt
-----------------------------------
define ArithR > XOR (rs::reg, rt::reg, rd::reg) =
   GPR(rd) <- GPR(rs) ?? GPR(rt)

-----------------------------------
-- NOR rd, rs, rt
-----------------------------------
define ArithR > NOR (rs::reg, rt::reg, rd::reg) =
   GPR(rd) <- ~(GPR(rs) || GPR(rt))

-----------------------------------
-- MOVN rd, rs, rt
-----------------------------------
define ArithR > MOVN (rs::reg, rt::reg, rd::reg) =
   when GPR(rt) <> 0 do
      GPR(rd) <- GPR(rs)

-----------------------------------
-- MOVZ rd, rs, rt
-----------------------------------
define ArithR > MOVZ (rs::reg, rt::reg, rd::reg) =
   when GPR(rt) == 0 do
      GPR(rd) <- GPR(rs)

-----------------------------------
-- MADD rs, rt
-----------------------------------
define MultDiv > MADD (rs::reg, rt::reg) =
{
   when NotWordValue (GPR(rs)) or NotWordValue (GPR(rt))
     do #UNPREDICTABLE("MADD: NotWordValue");
   temp`64 = (HI<31:0> : LO<31:0>) +
             SignExtend (GPR(rs)<31:0>) * SignExtend (GPR(rt)<31:0>);
   HI <- SignExtend (temp<63:32>);
   LO <- SignExtend (temp<31:0>)
}

-----------------------------------
-- MADDU rs, rt
-----------------------------------
define MultDiv > MADDU (rs::reg, rt::reg) =
{
   when NotWordValue (GPR(rs)) or NotWordValue (GPR(rt))
     do #UNPREDICTABLE("MADDU: NotWordValue");
   temp`64 = (HI<31:0> : LO<31:0>) +
             ZeroExtend (GPR(rs)<31:0>) * ZeroExtend (GPR(rt)<31:0>);
   HI <- SignExtend (temp<63:32>);
   LO <- SignExtend (temp<31:0>)
}

-----------------------------------
-- MSUB rs, rt
-----------------------------------
define MultDiv > MSUB (rs::reg, rt::reg) =
{
   when NotWordValue (GPR(rs)) or NotWordValue (GPR(rt))
     do #UNPREDICTABLE("MSUB: NotWordValue");
   temp`64 = (HI<31:0> : LO<31:0>) -
             SignExtend (GPR(rs)<31:0>) * SignExtend (GPR(rt)<31:0>);
   HI <- SignExtend (temp<63:32>);
   LO <- SignExtend (temp<31:0>)
}

-----------------------------------
-- MSUBU rs, rt
-----------------------------------
define MultDiv > MSUBU (rs::reg, rt::reg) =
{
   when NotWordValue (GPR(rs)) or NotWordValue (GPR(rt))
     do #UNPREDICTABLE("MSUBU: NotWordValue");
   temp`64 = (HI<31:0> : LO<31:0>) -
             ZeroExtend (GPR(rs)<31:0>) * ZeroExtend (GPR(rt)<31:0>);
   HI <- SignExtend (temp<63:32>);
   LO <- SignExtend (temp<31:0>)
}

-----------------------------------
-- MUL rd, rs, rt
-----------------------------------
define MultDiv > MUL (rs::reg, rt::reg, rd::reg) =
{
   when NotWordValue (GPR(rs)) or NotWordValue (GPR(rt))
     do #UNPREDICTABLE("MUL: NotWordValue");
   GPR(rd) <- SignExtend (GPR(rs)<31:0> * GPR(rt)<31:0>);
   lo <- None;
   hi <- None
}

-----------------------------------
-- MULT rs, rt
-----------------------------------
define MultDiv > MULT (rs::reg, rt::reg) =
{
   when NotWordValue (GPR(rs)) or NotWordValue (GPR(rt))
     do #UNPREDICTABLE("MULT: NotWordValue");
   prod`64 = SignExtend (GPR(rs)<31:0>) * SignExtend (GPR(rt)<31:0>);
   LO <- SignExtend (prod<31:0>);
   HI <- SignExtend (prod<63:32>)
}

-----------------------------------
-- MULTU rs, rt
-----------------------------------
define MultDiv > MULTU (rs::reg, rt::reg) =
{
   when NotWordValue (GPR(rs)) or NotWordValue (GPR(rt))
     do #UNPREDICTABLE("MULTU: NotWordValue");
   prod`64 = ZeroExtend (GPR(rs)<31:0>) * ZeroExtend (GPR(rt)<31:0>);
   LO <- SignExtend (prod<31:0>);
   HI <- SignExtend (prod<63:32>)
}

-----------------------------------
-- DMULT rs, rt
-----------------------------------
define MultDiv > DMULT (rs::reg, rt::reg) =
{
   prod`128 = SignExtend (GPR(rs)) * SignExtend (GPR(rt));
   LO <- prod<63:0>;
   HI <- prod<127:64>
}

-----------------------------------
-- DMULTU rs, rt
-----------------------------------
define MultDiv > DMULTU (rs::reg, rt::reg) =
{
   prod`128 = ZeroExtend (GPR(rs)) * ZeroExtend (GPR(rt));
   LO <- prod<63:0>;
   HI <- prod<127:64>
}

-----------------------------------
-- DIV rs, rt
-----------------------------------
define MultDiv > DIV (rs::reg, rt::reg) =
{
   s = GPR(rs);
   t = GPR(rt);
   when NotWordValue (s) or NotWordValue (t)
     do #UNPREDICTABLE("DIV: NotWordValue");
   if t == 0 then
   {
      lo <- None;
      hi <- None
   }
   else
   {
      q = s<31:0> quot t<31:0>;
      r = s<31:0> rem t<31:0>;
      LO <- SignExtend (q);
      HI <- SignExtend (r)
   }
}

-----------------------------------
-- DIVU rs, rt
-----------------------------------
define MultDiv > DIVU (rs::reg, rt::reg) =
{
   s = GPR(rs);
   t = GPR(rt);
   when NotWordValue (s) or NotWordValue (t)
     do #UNPREDICTABLE("DIVU: NotWordValue");
   if t == 0 then
   {
      lo <- None;
      hi <- None
   }
   else
   {
      q = s<31:0> div t<31:0>;
      r = s<31:0> mod t<31:0>;
      LO <- SignExtend (q);
      HI <- SignExtend (r)
   }
}

-----------------------------------
-- DDIV rs, rt
-----------------------------------
define MultDiv > DDIV (rs::reg, rt::reg) =
{
   t = GPR(rt);
   if t == 0 then
   {
      lo <- None;
      hi <- None
   }
   else
   {
      s = GPR(rs);
      LO <- s quot t;
      HI <- s rem t
   }
}

-----------------------------------
-- DDIVU rs, rt
-----------------------------------
define MultDiv > DDIVU (rs::reg, rt::reg) =
{
   t = GPR(rt);
   if t == 0 then
   {
      lo <- None;
      hi <- None
   }
   else
   {
      s = GPR(rs);
      LO <- s div t;
      HI <- s mod t
   }
}

-----------------------------------
-- MFHI rd
-----------------------------------
define MultDiv > MFHI (rd::reg) =
   GPR(rd) <- HI

-----------------------------------
-- MFLO rd
-----------------------------------
define MultDiv > MFLO (rd::reg) =
   GPR(rd) <- LO

-----------------------------------
-- MTHI rs
-----------------------------------
define MultDiv > MTHI (rs::reg) =
   HI <- GPR(rs)

-----------------------------------
-- MTLO rs
-----------------------------------
define MultDiv > MTLO (rs::reg) =
   LO <- GPR(rs)

-----------------------------------
-- SLL rd, rt, sa
-----------------------------------
define Shift > SLL (rt::reg, rd::reg, sa::bits(5)) =
   GPR(rd) <- SignExtend (GPR(rt)<31:0> << [sa])

-----------------------------------
-- SRL rd, rt, sa
-----------------------------------
define Shift > SRL (rt::reg, rd::reg, sa::bits(5)) =
{
   when NotWordValue (GPR(rt)) do #UNPREDICTABLE("SRL: NotWordValue");
   GPR(rd) <- SignExtend (GPR(rt)<31:0> >>+ [sa])
}

-----------------------------------
-- SRA rd, rt, sa
-----------------------------------
define Shift > SRA (rt::reg, rd::reg, sa::bits(5)) =
{
   when NotWordValue (GPR(rt)) do #UNPREDICTABLE("SRA: NotWordValue");
   GPR(rd) <- SignExtend (GPR(rt)<31:0> >> [sa])
}

-----------------------------------
-- SLLV rd, rt, rs
-----------------------------------
define Shift > SLLV (rs::reg, rt::reg, rd::reg) =
{
   sa = GPR(rs)<4:0>;
   GPR(rd) <- SignExtend (GPR(rt)<31:0> << [sa])
}

-----------------------------------
-- SRLV rd, rt, rs
-----------------------------------
define Shift > SRLV (rs::reg, rt::reg, rd::reg) =
{
   when NotWordValue (GPR(rt)) do #UNPREDICTABLE("SRLV: NotWordValue");
   sa = GPR(rs)<4:0>;
   GPR(rd) <- SignExtend (GPR(rt)<31:0> >>+ [sa])
}

-----------------------------------
-- SRAV rd, rt, rs
-----------------------------------
define Shift > SRAV (rs::reg, rt::reg, rd::reg) =
{
   when NotWordValue (GPR(rt)) do #UNPREDICTABLE("SRAV: NotWordValue");
   sa = GPR(rs)<4:0>;
   GPR(rd) <- SignExtend (GPR(rt)<31:0> >> [sa])
}

-----------------------------------
-- DSLL rd, rt, sa
-----------------------------------
define Shift > DSLL (rt::reg, rd::reg, sa::bits(5)) =
   GPR(rd) <- GPR(rt) << [sa]

-----------------------------------
-- DSRL rd, rt, sa
-----------------------------------
define Shift > DSRL (rt::reg, rd::reg, sa::bits(5)) =
   GPR(rd) <- GPR(rt) >>+ [sa]

-----------------------------------
-- DSRA rd, rt, sa
-----------------------------------
define Shift > DSRA (rt::reg, rd::reg, sa::bits(5)) =
   GPR(rd) <- GPR(rt) >> [sa]

-----------------------------------
-- DSLLV rd, rt, rs
-----------------------------------
define Shift > DSLLV (rs::reg, rt::reg, rd::reg) =
{
   sa = GPR(rs)<5:0>;
   GPR(rd) <- GPR(rt) << [sa]
}

-----------------------------------
-- DSRLV rd, rt, rs
-----------------------------------
define Shift > DSRLV (rs::reg, rt::reg, rd::reg) =
{
   sa = GPR(rs)<5:0>;
   GPR(rd) <- GPR(rt) >>+ [sa]
}

-----------------------------------
-- DSRAV rd, rt, rs
-----------------------------------
define Shift > DSRAV (rs::reg, rt::reg, rd::reg) =
{
   sa = GPR(rs)<5:0>;
   GPR(rd) <- GPR(rt) >> [sa]
}

-----------------------------------
-- DSLL32 rd, rt, sa
-----------------------------------
define Shift > DSLL32 (rt::reg, rd::reg, sa::bits(5)) =
   GPR(rd) <- GPR(rt) << ([sa] + 0n32)

-----------------------------------
-- DSRL32 rd, rt, sa
-----------------------------------
define Shift > DSRL32 (rt::reg, rd::reg, sa::bits(5)) =
   GPR(rd) <- GPR(rt) >>+ ([sa] + 0n32)

-----------------------------------
-- DSRA32 rd, rt, sa
-----------------------------------
define Shift > DSRA32 (rt::reg, rd::reg, sa::bits(5)) =
   GPR(rd) <- GPR(rt) >> ([sa] + 0n32)

-----------------------------------
-- TGE rs, rt
-----------------------------------
define Trap > TGE (rs::reg, rt::reg) =
   when GPR(rs) >= GPR(rt) do SignalException (Tr)

-----------------------------------
-- TGEU rs, rt
-----------------------------------
define Trap > TGEU (rs::reg, rt::reg) =
   when GPR(rs) >=+ GPR(rt) do SignalException (Tr)

-----------------------------------
-- TLT rs, rt
-----------------------------------
define Trap > TLT (rs::reg, rt::reg) =
   when GPR(rs) < GPR(rt) do SignalException (Tr)

-----------------------------------
-- TLTU rs, rt
-----------------------------------
define Trap > TLTU (rs::reg, rt::reg) =
   when GPR(rs) <+ GPR(rt) do SignalException (Tr)

-----------------------------------
-- TEQ rs, rt
-----------------------------------
define Trap > TEQ (rs::reg, rt::reg) =
   when GPR(rs) == GPR(rt) do SignalException (Tr)

-----------------------------------
-- TNE rs, rt
-----------------------------------
define Trap > TNE (rs::reg, rt::reg) =
   when GPR(rs) <> GPR(rt) do SignalException (Tr)

-----------------------------------
-- TGEI rs, immediate
-----------------------------------
define Trap > TGEI (rs::reg, immediate::bits(16)) =
   when GPR(rs) >= SignExtend (immediate) do SignalException (Tr)

-----------------------------------
-- TGEIU rs, immediate
-----------------------------------
define Trap > TGEIU (rs::reg, immediate::bits(16)) =
   when GPR(rs) >=+ SignExtend (immediate) do SignalException (Tr)

-----------------------------------
-- TLTI rs, immediate
-----------------------------------
define Trap > TLTI (rs::reg, immediate::bits(16)) =
   when GPR(rs) < SignExtend (immediate) do SignalException (Tr)

-----------------------------------
-- TLTIU rs, immediate
-----------------------------------
define Trap > TLTIU (rs::reg, immediate::bits(16)) =
   when GPR(rs) <+ SignExtend (immediate) do SignalException (Tr)

-----------------------------------
-- TEQI rs, immediate
-----------------------------------
define Trap > TEQI (rs::reg, immediate::bits(16)) =
   when GPR(rs) == SignExtend (immediate) do SignalException (Tr)

-----------------------------------
-- TNEI rs, immediate
-----------------------------------
define Trap > TNEI (rs::reg, immediate::bits(16)) =
   when GPR(rs) <> SignExtend (immediate) do SignalException (Tr)

-----------------------------------
-- LB  rt, offset(base)
-- LBU rt, offset(base)
-- LH  rt, offset(base)
-- LHU rt, offset(base)
-- LW  rt, offset(base)
-- LWU rt, offset(base)
-- LL  rt, offset(base)
-- LD  rt, offset(base)
-- LDU rt, offset(base)
-- LLD rt, offset(base)
-----------------------------------
unit loadByte (base::reg, rt::reg, offset::bits(16), unsigned::bool) =
{
   vAddr = SignExtend (offset) + GPR(base);
   pAddr, CCA = AddressTranslation (vAddr, DATA, LOAD);
   when not exceptionSignalled do
   {
      pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? ReverseEndian^3);
      memdoubleword = LoadMemory (CCA, BYTE, pAddr, vAddr, DATA);
      byte = vAddr<2:0> ?? BigEndianCPU^3;
      membyte`8 = memdoubleword <7 + 8 * [byte] : 8 * [byte]>;
      GPR(rt) <- if unsigned then ZeroExtend (membyte)
                 else SignExtend (membyte);
      LLbit <- None
   }
}

unit loadHalf (base::reg, rt::reg, offset::bits(16), unsigned::bool) =
{
   vAddr = SignExtend (offset) + GPR(base);
   if vAddr<0> then
   {
      CP0.BadVAddr <- vAddr;
      SignalException (AdEL)
   }
   else
   {
      pAddr, CCA = AddressTranslation (vAddr, DATA, LOAD);
      when not exceptionSignalled do
      {
         pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? (ReverseEndian^2 : '0'));
         memdoubleword = LoadMemory (CCA, HALFWORD, pAddr, vAddr, DATA);
         byte = vAddr<2:0> ?? (BigEndianCPU^2 : '0');
         memhalf`16 = memdoubleword <15 + 8 * [byte] : 8 * [byte]>;
         GPR(rt) <- if unsigned then
                        ZeroExtend (memhalf)
                     else
                        SignExtend (memhalf);
         LLbit <- None
      }
   }
}

unit loadWord (link::bool, base::reg, rt::reg, offset::bits(16),
               unsigned::bool) =
{
   vAddr = SignExtend (offset) + GPR(base);
   if vAddr<1:0> <> '00' then
   {
      CP0.BadVAddr <- vAddr;
      SignalException (AdEL)
   }
   else
   {
      pAddr, CCA = AddressTranslation (vAddr, DATA, LOAD);
      when not exceptionSignalled do
      {
         pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? (ReverseEndian : '00'));
         memdoubleword = LoadMemory (CCA, WORD, pAddr, vAddr, DATA);
         byte = vAddr<2:0> ?? (BigEndianCPU : '00');
         memword`32 = memdoubleword <31 + 8 * [byte] : 8 * [byte]>;
         GPR(rt) <- if unsigned then
                        ZeroExtend (memword)
                     else
                        SignExtend (memword);
         if link then
         {
            LLbit <- Some (true);
            CP0.LLAddr <- [pAddr]
         }
         else
            LLbit <- None
      }
   }
}

unit loadDoubleword (link::bool, base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   if vAddr<2:0> <> '000' then
   {
      CP0.BadVAddr <- vAddr;
      SignalException (AdEL)
   }
   else
   {
      pAddr, CCA = AddressTranslation (vAddr, DATA, LOAD);
      when not exceptionSignalled do
      {
         memdoubleword = LoadMemory (CCA, DOUBLEWORD, pAddr, vAddr, DATA);
         GPR(rt) <- memdoubleword;
         if link then
         {
            LLbit <- Some (true);
            CP0.LLAddr <- [pAddr]
         }
         else
            LLbit <- None
      }
   }
}

--

define Load > LB (base::reg, rt::reg, offset::bits(16)) =
   loadByte (base, rt, offset, false)

define Load > LBU (base::reg, rt::reg, offset::bits(16)) =
   loadByte (base, rt, offset, true)

define Load > LH (base::reg, rt::reg, offset::bits(16)) =
   loadHalf (base, rt, offset, false)

define Load > LHU (base::reg, rt::reg, offset::bits(16)) =
   loadHalf (base, rt, offset, true)

define Load > LW (base::reg, rt::reg, offset::bits(16)) =
   loadWord (false, base, rt, offset, false)

define Load > LWU (base::reg, rt::reg, offset::bits(16)) =
   loadWord (false, base, rt, offset, true)

define Load > LL (base::reg, rt::reg, offset::bits(16)) =
   loadWord (true, base, rt, offset, false)

define Load > LD (base::reg, rt::reg, offset::bits(16)) =
   loadDoubleword (false, base, rt, offset)

define Load > LLD (base::reg, rt::reg, offset::bits(16)) =
   loadDoubleword (true, base, rt, offset)

-----------------------------------
-- LWL rt, offset(base)
-----------------------------------
define Load > LWL (base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   pAddr, CCA = AddressTranslation (vAddr, DATA, LOAD);
   when not exceptionSignalled do
   {
      pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? ReverseEndian^3);
      pAddr = if BigEndianMem then pAddr else pAddr && ~0b111;
      byte = vAddr<1:0> ?? BigEndianCPU^2;
      word = vAddr<2:2> ?? BigEndianCPU;
      memdoubleword = LoadMemory (CCA, '0' : byte, pAddr, vAddr, DATA);
      temp`32 =
         match word, byte
         {
            case 0, 0 => memdoubleword <7:0>   : GPR(rt)<23:0>
            case 0, 1 => memdoubleword <15:0>  : GPR(rt)<15:0>
            case 0, 2 => memdoubleword <23:0>  : GPR(rt)<7:0>
            case 0, 3 => memdoubleword <31:0>
            case 1, 0 => memdoubleword <39:32> : GPR(rt)<23:0>
            case 1, 1 => memdoubleword <47:32> : GPR(rt)<15:0>
            case 1, 2 => memdoubleword <55:32> : GPR(rt)<7:0>
            case 1, 3 => memdoubleword <63:32>
         };
      GPR(rt) <- SignExtend (temp);
      LLbit <- None
   }
}

-----------------------------------
-- LWR rt, offset(base)
-----------------------------------
define Load > LWR (base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   pAddr, CCA = AddressTranslation (vAddr, DATA, LOAD);
   when not exceptionSignalled do
   {
      pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? ReverseEndian^3);
      pAddr = if BigEndianMem then pAddr else pAddr && ~0b111;
      byte = vAddr<1:0> ?? BigEndianCPU^2;
      word = vAddr<2:2> ?? BigEndianCPU;
      memdoubleword = LoadMemory (CCA, WORD - ('0' : byte), pAddr, vAddr, DATA);
      temp`32 =
         match word, byte
         {
            case 0, 0 =>                  memdoubleword <31:0>
            case 0, 1 => GPR(rt)<31:24> : memdoubleword <31:8>
            case 0, 2 => GPR(rt)<31:16> : memdoubleword <31:16>
            case 0, 3 => GPR(rt)<31:8>  : memdoubleword <31:24>
            case 1, 0 =>                  memdoubleword <63:32>
            case 1, 1 => GPR(rt)<31:24> : memdoubleword <63:40>
            case 1, 2 => GPR(rt)<31:16> : memdoubleword <63:48>
            case 1, 3 => GPR(rt)<31:8>  : memdoubleword <63:56>
         };
      GPR(rt) <- SignExtend (temp);
      -- alternative specification when byte specification <> 0 is
      -- GPR(rt)<31:0> <- temp
      LLbit <- None
   }
}

-----------------------------------
-- LDL rt, offset(base)
-----------------------------------
define Load > LDL (base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   pAddr, CCA = AddressTranslation (vAddr, DATA, LOAD);
   when not exceptionSignalled do
   {
      pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? ReverseEndian^3);
      pAddr = if BigEndianMem then pAddr else pAddr && ~0b111;
      byte = vAddr<2:0> ?? BigEndianCPU^3;
      memdoubleword = LoadMemory (CCA, byte, pAddr, vAddr, DATA);
      GPR(rt) <-
         match byte
         {
            case 0 => memdoubleword <7:0>  : GPR(rt)<55:0>
            case 1 => memdoubleword <15:0> : GPR(rt)<47:0>
            case 2 => memdoubleword <23:0> : GPR(rt)<39:0>
            case 3 => memdoubleword <31:0> : GPR(rt)<31:0>
            case 4 => memdoubleword <39:0> : GPR(rt)<23:0>
            case 5 => memdoubleword <47:0> : GPR(rt)<15:0>
            case 6 => memdoubleword <55:0> : GPR(rt)<7:0>
            case 7 => memdoubleword <63:0>
         };
      LLbit <- None
   }
}

-----------------------------------
-- LDR rt, offset(base)
-----------------------------------
define Load > LDR (base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   pAddr, CCA = AddressTranslation (vAddr, DATA, LOAD);
   when not exceptionSignalled do
   {
      pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? ReverseEndian^3);
      pAddr = if BigEndianMem then pAddr else pAddr && ~0b111;
      byte = vAddr<2:0> ?? BigEndianCPU^3;
      memdoubleword = LoadMemory (CCA, DOUBLEWORD - byte, pAddr, vAddr, DATA);
      GPR(rt) <-
         match byte
         {
            case 0 =>                  memdoubleword <63:0>
            case 1 => GPR(rt)<63:56> : memdoubleword <63:8>
            case 2 => GPR(rt)<63:48> : memdoubleword <63:16>
            case 3 => GPR(rt)<63:40> : memdoubleword <63:24>
            case 4 => GPR(rt)<63:32> : memdoubleword <63:32>
            case 5 => GPR(rt)<63:24> : memdoubleword <63:40>
            case 6 => GPR(rt)<63:16> : memdoubleword <63:48>
            case 7 => GPR(rt)<63:8>  : memdoubleword <63:56>
         };
      LLbit <- None
   }
}

-----------------------------------
-- SB rt, offset(base)
-----------------------------------
define Store > SB (base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   pAddr, CCA = AddressTranslation (vAddr, DATA, STORE);
   when not exceptionSignalled do
   {
      pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? ReverseEndian^3);
      bytesel = vAddr<2:0> ?? BigEndianCPU^3;
      datadoubleword = GPR(rt) << (0n8 * [bytesel]);
      StoreMemory (CCA, BYTE, datadoubleword, pAddr, vAddr, DATA);
      LLbit <- None
   }
}

-----------------------------------
-- SH rt, offset(base)
-----------------------------------
define Store > SH (base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   if vAddr<0> then
   {
      CP0.BadVAddr <- vAddr;
      SignalException (AdES)
   }
   else
   {
      pAddr, CCA = AddressTranslation (vAddr, DATA, STORE);
      when not exceptionSignalled do
      {
         pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? (ReverseEndian^2 : '0'));
         bytesel = vAddr<2:0> ?? (BigEndianCPU^2 : '0');
         datadoubleword = GPR(rt) << (0n8 * [bytesel]);
         StoreMemory (CCA, HALFWORD, datadoubleword, pAddr, vAddr, DATA);
         LLbit <- None
      }
   }
}

-----------------------------------
-- SW  rt, offset(base)
-- SC  rt, offset(base)
-- SD  rt, offset(base)
-- SCD rt, offset(base)
-----------------------------------
unit storeWord (base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   if vAddr<1:0> <> '00' then
   {
      CP0.BadVAddr <- vAddr;
      SignalException (AdES)
   }
   else
   {
      pAddr, CCA = AddressTranslation (vAddr, DATA, STORE);
      when not exceptionSignalled do
      {
         pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? (ReverseEndian : '00'));
         bytesel = vAddr<2:0> ?? (BigEndianCPU : '00');
         datadoubleword = GPR(rt) << (0n8 * [bytesel]);
         StoreMemory (CCA, WORD, datadoubleword, pAddr, vAddr, DATA)
      }
   }
}

unit storeDoubleword (base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   if vAddr<2:0> <> '000' then
   {
      CP0.BadVAddr <- vAddr;
      SignalException (AdES)
   }
   else
   {
      pAddr, CCA = AddressTranslation (vAddr, DATA, STORE);
      when not exceptionSignalled do
      {
         datadoubleword = GPR(rt);
         StoreMemory (CCA, DOUBLEWORD, datadoubleword, pAddr, vAddr, DATA)
      }
   }
}

--

define Store > SW (base::reg, rt::reg, offset::bits(16)) =
{
   storeWord (base, rt, offset);
   LLbit <- None
}

define Store > SD (base::reg, rt::reg, offset::bits(16)) =
{
   storeDoubleword (base, rt, offset);
   LLbit <- None
}

define Store > SC (base::reg, rt::reg, offset::bits(16)) =
   match LLbit
   {
      case None => #UNPREDICTABLE("SC: LLbit not set")
      case Some (false) => GPR(rt) <- 0
      case Some (true) =>
        {
           storeWord (base, rt, offset);
           GPR(rt) <- 1
        }
   }

define Store > SCD (base::reg, rt::reg, offset::bits(16)) =
   match LLbit
   {
      case None => #UNPREDICTABLE("SCD: LLbit not set")
      case Some (false) => GPR(rt) <- 0
      case Some (true) =>
        {
           storeDoubleword (base, rt, offset);
           GPR(rt) <- 1
        }
   }

-----------------------------------
-- SWL rt, offset(base)
-----------------------------------
define Store > SWL (base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   pAddr, CCA = AddressTranslation (vAddr, DATA, STORE);
   when not exceptionSignalled do
   {
      pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? ReverseEndian^3);
      pAddr = if BigEndianMem then pAddr else pAddr && ~0b11;
      byte = vAddr<1:0> ?? BigEndianCPU^2;
      word = vAddr<2:2> ?? BigEndianCPU;
      datadoubleword`64 =
         match byte
         {
           case 0 => [GPR(rt)<31:24>]
           case 1 => [GPR(rt)<31:16>]
           case 2 => [GPR(rt)<31:8>]
           case 3 => [GPR(rt)<31:0>]
         };
      datadoubleword =
         if word == '1' then datadoubleword << 32 else datadoubleword;
      StoreMemory (CCA, [byte], datadoubleword, pAddr, vAddr, DATA)
   }
}

-----------------------------------
-- SWR rt, offset(base)
-----------------------------------
define Store > SWR (base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   pAddr, CCA = AddressTranslation (vAddr, DATA, STORE);
   when not exceptionSignalled do
   {
      pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? ReverseEndian^3);
      pAddr = if BigEndianMem then pAddr && ~0b11 else pAddr;
      byte = vAddr<1:0> ?? BigEndianCPU^2;
      word = vAddr<2:2> ?? BigEndianCPU;
      datadoubleword =
         match word, byte
         {
            case 0, 0 => [GPR(rt)<31:0>]
            case 0, 1 => [GPR(rt)<23:0>] << 8
            case 0, 2 => [GPR(rt)<15:0>] << 16
            case 0, 3 => [GPR(rt)<7:0>]  << 24
            case 1, 0 => [GPR(rt)<31:0>] << 32
            case 1, 1 => [GPR(rt)<23:0>] << 40
            case 1, 2 => [GPR(rt)<15:0>] << 48
            case 1, 3 => [GPR(rt)<7:0>]  << 56
         };
      StoreMemory (CCA, WORD - [byte], datadoubleword,  pAddr, vAddr, DATA)
   }
}

-----------------------------------
-- SDL rt, offset(base)
-----------------------------------
define Store > SDL (base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   pAddr, CCA = AddressTranslation (vAddr, DATA, STORE);
   when not exceptionSignalled do
   {
      pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? ReverseEndian^3);
      pAddr = if BigEndianMem then pAddr else pAddr && ~0b111;
      byte = vAddr<2:0> ?? BigEndianCPU^3;
      datadoubleword =
         match byte
         {
            case 0 => [GPR(rt)<63:56>]
            case 1 => [GPR(rt)<63:48>]
            case 2 => [GPR(rt)<63:40>]
            case 3 => [GPR(rt)<63:32>]
            case 4 => [GPR(rt)<63:24>]
            case 5 => [GPR(rt)<63:16>]
            case 6 => [GPR(rt)<63:8>]
            case 7 =>  GPR(rt)
         };
      StoreMemory (CCA, byte, datadoubleword,  pAddr, vAddr, DATA)
   }
}

-----------------------------------
-- SDR rt, offset(base)
-----------------------------------
define Store > SDR (base::reg, rt::reg, offset::bits(16)) =
{
   vAddr = SignExtend (offset) + GPR(base);
   pAddr, CCA = AddressTranslation (vAddr, DATA, STORE);
   when not exceptionSignalled do
   {
      pAddr = pAddr<PSIZE - 1 : 3> : (pAddr<2:0> ?? ReverseEndian^3);
      pAddr = if BigEndianMem then pAddr && ~0b111 else pAddr;
      byte = vAddr<2:0> ?? BigEndianCPU^3;
      datadoubleword =
         match byte
         {
            case 0 =>  GPR(rt)
            case 1 => [GPR(rt)<55:0>] << 8
            case 2 => [GPR(rt)<47:0>] << 16
            case 3 => [GPR(rt)<39:0>] << 24
            case 4 => [GPR(rt)<31:0>] << 32
            case 5 => [GPR(rt)<23:0>] << 40
            case 6 => [GPR(rt)<15:0>] << 48
            case 7 => [GPR(rt)<7:0>] << 56
         };
      StoreMemory (CCA, DOUBLEWORD - byte, datadoubleword,  pAddr, vAddr, DATA)
   }
}

-----------------------------------
-- SYNC stype
-----------------------------------
define SYNC (stype::bits(5)) = nothing

-----------------------------------
-- BREAK
-----------------------------------
define BREAK = SignalException (Bp)

-----------------------------------
-- SYSCALL
-----------------------------------
define SYSCALL = SignalException (Sys)

-----------------------------------
-- ERET
-----------------------------------
define ERET =
   if IsSome (BranchDelay) then
      #UNPREDICTABLE ("ERET follows branch")
   else if CP0.Status.CU0 or KernelMode then
   {
      if CP0.Status.ERL then
      {
         PC <- CP0.ErrorEPC - 4;
         CP0.Status.ERL <- false
      }
      else
      {
         PC <- CP0.EPC - 4;
         CP0.Status.EXL <- false
      };
      LLbit <- Some (false)
   }
   else
     SignalException (CpU)

-----------------------------------
-- MTC0 rt, rd
-- MTC0 rt, rd, sel
-----------------------------------
define CP > MTC0 (rt::reg, rd::reg, sel::bits(3)) =
   -- Will need adapting for EntryLo1 and EntryLo0
   if CP0.Status.CU0 or KernelMode then
      CPR (0, rd, sel) <- GPR(rt)
   else
      SignalException (CpU)

-----------------------------------
-- DMTC0 rt, rd
-- DMTC0 rt, rd, sel
-----------------------------------
define CP > DMTC0 (rt::reg, rd::reg, sel::bits(3)) =
   if CP0.Status.CU0 or KernelMode then
      CPR (0, rd, sel) <- GPR(rt)
   else
      SignalException (CpU)

-----------------------------------
-- MFC0 rt, rd
-- MFC0 rt, rd, sel
-----------------------------------
define CP > MFC0 (rt::reg, rd::reg, sel::bits(3)) =
   -- Will need adapting for EntryLo1 and EntryLo0; see manual entry for MFC0
   if CP0.Status.CU0 or KernelMode then
      GPR(rt) <- SignExtend (CPR (0, rd, sel)<31:0>)
   else
      SignalException (CpU)

-----------------------------------
-- DMFC0 rt, rd
-- DMFC0 rt, rd, sel
-----------------------------------
define CP > DMFC0 (rt::reg, rd::reg, sel::bits(3)) =
   if CP0.Status.CU0 or KernelMode then
      GPR(rt) <- CPR (0, rd, sel)
   else
      SignalException (CpU)

-----------------------------------
-- J target
-----------------------------------
define Branch > J (instr_index::bits(26)) =
   BranchTo <- Some (false, (PC<63:28> : instr_index : '00'))

-----------------------------------
-- JAL target
-----------------------------------
define Branch > JAL (instr_index::bits(26)) =
{
   GPR(31) <- PC + 8;
   BranchTo <- Some (false, PC<63:28> : instr_index : '00')
}

-----------------------------------
-- JR rs
-----------------------------------
define Branch > JR (rs::reg) =
   BranchTo <- Some (false, GPR(rs))

-----------------------------------
-- JALR rs (rd = 31 implied)
-- JALR rd, rs
-----------------------------------
define Branch > JALR (rs::reg, rd::reg) =
{
   temp = GPR(rs);
   GPR(rd) <- PC + 8;
   BranchTo <- Some (false, temp)
}

unit ConditionalBranch (b::bool, offset::bits(16)) =
   BranchTo <- Some (if b then (false, PC + 4 + SignExtend (offset) << 2)
                     else (true, PC + 4))

unit ConditionalBranchLikely (b::bool, offset::bits(16)) =
   if b then
      BranchTo <- Some (false, PC + 4 + SignExtend (offset) << 2)
   else if IsSome (BranchDelay) then
      BranchTo <- Some (true, PC + 8)
   else
      PC <- PC + 4

-----------------------------------
-- BEQ rs, rt, offset
-----------------------------------
define Branch > BEQ (rs::reg, rt::reg, offset::bits(16)) =
   ConditionalBranch (GPR(rs) == GPR(rt), offset)

-----------------------------------
-- BNE rs, rt, offset
-----------------------------------
define Branch > BNE (rs::reg, rt::reg, offset::bits(16)) =
   ConditionalBranch (GPR(rs) <> GPR(rt), offset)

-----------------------------------
-- BLEZ rs, offset
-----------------------------------
define Branch > BLEZ (rs::reg, offset::bits(16)) =
   ConditionalBranch (GPR(rs) <= 0, offset)

-----------------------------------
-- BGTZ rs, offset
-----------------------------------
define Branch > BGTZ (rs::reg, offset::bits(16)) =
   ConditionalBranch (GPR(rs) > 0, offset)

-----------------------------------
-- BLTZ rs, offset
-----------------------------------
define Branch > BLTZ (rs::reg, offset::bits(16)) =
   ConditionalBranch (GPR(rs) < 0, offset)

-----------------------------------
-- BGEZ rs, offset
-----------------------------------
define Branch > BGEZ (rs::reg, offset::bits(16)) =
   ConditionalBranch (GPR(rs) >= 0, offset)

-----------------------------------
-- BLTZAL rs, offset
-----------------------------------
define Branch > BLTZAL (rs::reg, offset::bits(16)) =
{
   temp = GPR(rs);
   GPR(31) <- PC + 8;
   ConditionalBranch (temp < 0, offset)
}

-----------------------------------
-- BGEZAL rs, offset
-----------------------------------
define Branch > BGEZAL (rs::reg, offset::bits(16)) =
{
   temp = GPR(rs);
   GPR(31) <- PC + 8;
   ConditionalBranch (temp >= 0, offset)
}

-----------------------------------
-- BEQL rs, rt, offset
-----------------------------------
define Branch > BEQL (rs::reg, rt::reg, offset::bits(16)) =
   ConditionalBranchLikely (GPR(rs) == GPR(rt), offset)

-----------------------------------
-- BNEL rs, rt, offset
-----------------------------------
define Branch > BNEL (rs::reg, rt::reg, offset::bits(16)) =
   ConditionalBranchLikely (GPR(rs) <> GPR(rt), offset)

-----------------------------------
-- BLEZL rs, offset
-----------------------------------
define Branch > BLEZL (rs::reg, offset::bits(16)) =
   ConditionalBranchLikely (GPR(rs) <= 0, offset)

-----------------------------------
-- BGTZL rs, offset
-----------------------------------
define Branch > BGTZL (rs::reg, offset::bits(16)) =
   ConditionalBranchLikely (GPR(rs) > 0, offset)

-----------------------------------
-- BLTZL rs, offset
-----------------------------------
define Branch > BLTZL (rs::reg, offset::bits(16)) =
   ConditionalBranchLikely (GPR(rs) < 0, offset)

-----------------------------------
-- BGEZL rs, offset
-----------------------------------
define Branch > BGEZL (rs::reg, offset::bits(16)) =
   ConditionalBranchLikely (GPR(rs) >= 0, offset)

-----------------------------------
-- BLTZALL rs, offset
-----------------------------------
define Branch > BLTZALL (rs::reg, offset::bits(16)) =
{
   temp = GPR(rs);
   GPR(31) <- PC + 8;
   ConditionalBranchLikely (temp < 0, offset)
}

-----------------------------------
-- BGEZALL rs, offset
-----------------------------------
define Branch > BGEZALL (rs::reg, offset::bits(16)) =
{
   temp = GPR(rs);
   GPR(31) <- PC + 8;
   ConditionalBranchLikely (temp >= 0, offset)
}

-----------------------------------
-- WAIT (implemented as no-op)
-----------------------------------

define WAIT = ()


--------------------------------------------------
-- Stub TLB instructions
--------------------------------------------------

--------
-- TLBP
--------
define TLBP = SignalException (ResI)

--------
-- TLBR
--------
define TLBR = SignalException (ResI)

--------
-- TLBWI
--------
define TLBWI = SignalException (ResI)

--------
-- TLBWR
--------
define TLBWR = SignalException (ResI)

-------------------------
-- CACHE op, offset(base)
-------------------------
define CACHE (base::reg, opn::bits(5), offset::bits(16)) =
   SignalException (ResI)

-------------------------
-- RDHWR rt, rd
-------------------------
define RDHWR (rt::reg, rd::reg) = SignalException (ResI)

-----------------------------------
-- Rerserved instruction, i.e. unsuccessful decode.
-----------------------------------
define ReservedInstruction =
   SignalException (ResI)

define Unpredictable = #UNPREDICTABLE("Unpredictable instruction")

define Run

-------------------------------------------------------
-- Not implemented:
--
-- LWCz, SWCz, MTCz, MFCz, CTCz, CFCz, COPz, BCzT, BCzF
-- DMFCz, DMTCz, LDCz, SDCz
-- BCzTL, BCzFL
-- CACHE
-- Floating-point
-- RDHWR
-------------------------------------------------------

--================================================
-- Instruction decoding
--================================================

instruction Decode (w::word) =
{
   match w
   {
      case '000 000 00000 rt rd imm5 000 000' => Shift (SLL (rt, rd, imm5))
      case '000 000 00000 rt rd imm5 000 010' => Shift (SRL (rt, rd, imm5))
      case '000 000 00000 rt rd imm5 000 011' => Shift (SRA (rt, rd, imm5))
      case '000 000 rs rt rd 00000 000 100' => Shift (SLLV (rs, rt, rd))
      case '000 000 rs rt rd 00000 000 110' => Shift (SRLV (rs, rt, rd))
      case '000 000 rs rt rd 00000 000 111' => Shift (SRAV (rs, rt, rd))
      case '000 000 rs 00000 00000 hint 001 000' => Branch (JR (rs))
      case '000 000 rs 00000 rd hint 001 001' => Branch (JALR (rs, rd))
      case '000 000 rs rt rd 00000 001 010' => ArithR (MOVZ (rs, rt, rd))
      case '000 000 rs rt rd 00000 001 011' => ArithR (MOVN (rs, rt, rd))
      case '000 000 00000 code 001 100' => SYSCALL
      case '000 000 00000 code 001 101' => BREAK
      case '000 000 00000 00000 00000 imm5 001 111' => SYNC (imm5)
      case '000 000 00000 00000 rd 00000 010 000' => MultDiv (MFHI (rd))
      case '000 000 rs 00000 00000 00000 010 001' => MultDiv (MTHI (rs))
      case '000 000 00000 00000 rd 00000 010 010' => MultDiv (MFLO (rd))
      case '000 000 rs 00000 00000 00000 010 011' => MultDiv (MTLO (rs))
      case '000 000 rs rt rd 00000 010 100' => Shift (DSLLV (rs, rt, rd))
      case '000 000 rs rt rd 00000 010 110' => Shift (DSRLV (rs, rt, rd))
      case '000 000 rs rt rd 00000 010 111' => Shift (DSRAV (rs, rt, rd))
      case '000 000 rs rt 00000 00000 011 000' => MultDiv (MULT (rs, rt))
      case '000 000 rs rt 00000 00000 011 001' => MultDiv (MULTU (rs, rt))
      case '000 000 rs rt 00000 00000 011 010' => MultDiv (DIV (rs, rt))
      case '000 000 rs rt 00000 00000 011 011' => MultDiv (DIVU (rs, rt))
      case '000 000 rs rt 00000 00000 011 100' => MultDiv (DMULT (rs, rt))
      case '000 000 rs rt 00000 00000 011 101' => MultDiv (DMULTU (rs, rt))
      case '000 000 rs rt 00000 00000 011 110' => MultDiv (DDIV (rs, rt))
      case '000 000 rs rt 00000 00000 011 111' => MultDiv (DDIVU (rs, rt))
      case '000 000 rs rt rd 00000 100 000' => ArithR (ADD (rs, rt, rd))
      case '000 000 rs rt rd 00000 100 001' => ArithR (ADDU (rs, rt, rd))
      case '000 000 rs rt rd 00000 100 010' => ArithR (SUB (rs, rt, rd))
      case '000 000 rs rt rd 00000 100 011' => ArithR (SUBU (rs, rt, rd))
      case '000 000 rs rt rd 00000 100 100' => ArithR (AND (rs, rt, rd))
      case '000 000 rs rt rd 00000 100 101' => ArithR (OR (rs, rt, rd))
      case '000 000 rs rt rd 00000 100 110' => ArithR (XOR (rs, rt, rd))
      case '000 000 rs rt rd 00000 100 111' => ArithR (NOR (rs, rt, rd))
      case '000 000 rs rt rd 00000 101 010' => ArithR (SLT (rs, rt, rd))
      case '000 000 rs rt rd 00000 101 011' => ArithR (SLTU (rs, rt, rd))
      case '000 000 rs rt rd 00000 101 100' => ArithR (DADD (rs, rt, rd))
      case '000 000 rs rt rd 00000 101 101' => ArithR (DADDU (rs, rt, rd))
      case '000 000 rs rt rd 00000 101 110' => ArithR (DSUB (rs, rt, rd))
      case '000 000 rs rt rd 00000 101 111' => ArithR (DSUBU (rs, rt, rd))
      case '000 000 rs rt code 110 000' => Trap (TGE (rs, rt))
      case '000 000 rs rt code 110 001' => Trap (TGEU (rs, rt))
      case '000 000 rs rt code 110 010' => Trap (TLT (rs, rt))
      case '000 000 rs rt code 110 011' => Trap (TLTU (rs, rt))
      case '000 000 rs rt code 110 100' => Trap (TEQ (rs, rt))
      case '000 000 rs rt code 110 110' => Trap (TNE (rs, rt))
      case '000 000 00000 rt rd imm5 111 000' => Shift (DSLL (rt, rd, imm5))
      case '000 000 00000 rt rd imm5 111 010' => Shift (DSRL (rt, rd, imm5))
      case '000 000 00000 rt rd imm5 111 011' => Shift (DSRA (rt, rd, imm5))
      case '000 000 00000 rt rd imm5 111 100' => Shift (DSLL32 (rt, rd, imm5))
      case '000 000 00000 rt rd imm5 111 110' => Shift (DSRL32 (rt, rd, imm5))
      case '000 000 00000 rt rd imm5 111 111' => Shift (DSRA32 (rt, rd, imm5))
      case '000 001 rs 00 000 immediate' => Branch (BLTZ (rs, immediate))
      case '000 001 rs 00 001 immediate' => Branch (BGEZ (rs, immediate))
      case '000 001 rs 00 010 immediate' => Branch (BLTZL (rs, immediate))
      case '000 001 rs 00 011 immediate' => Branch (BGEZL (rs, immediate))
      case '000 001 rs 01 000 immediate' => Trap (TGEI (rs, immediate))
      case '000 001 rs 01 001 immediate' => Trap (TGEIU (rs, immediate))
      case '000 001 rs 01 010 immediate' => Trap (TLTI (rs, immediate))
      case '000 001 rs 01 011 immediate' => Trap (TLTIU (rs, immediate))
      case '000 001 rs 01 100 immediate' => Trap (TEQI (rs, immediate))
      case '000 001 rs 01 110 immediate' => Trap (TNEI (rs, immediate))
      case '000 001 11111 10 0 _`2 immediate' => Unpredictable
      case '000 001 rs 10 000 immediate' => Branch (BLTZAL (rs, immediate))
      case '000 001 rs 10 001 immediate' => Branch (BGEZAL (rs, immediate))
      case '000 001 rs 10 010 immediate' => Branch (BLTZALL (rs, immediate))
      case '000 001 rs 10 011 immediate' => Branch (BGEZALL (rs, immediate))
      case '000 010 immediate' => Branch (J (immediate))
      case '000 011 immediate' => Branch (JAL (immediate))
      case '010 000 10000000000000000000 000001' => TLBR
      case '010 000 10000000000000000000 000010' => TLBWI
      case '010 000 10000000000000000000 000110' => TLBWR
      case '010 000 10000000000000000000 001000' => TLBP
      case '010 000 10000000000000000000 011000' => ERET
      case '010 000 00 000 rt rd 00000000 sel' => CP (MFC0 (rt, rd, sel))
      case '010 000 00 001 rt rd 00000000 sel' => CP (DMFC0 (rt, rd, sel))
      case '010 000 00 100 rt rd 00000000 sel' => CP (MTC0 (rt, rd, sel))
      case '010 000 00 101 rt rd 00000000 sel' => CP (DMTC0 (rt, rd, sel))
      case '000 110 rs 00000 immediate' => Branch (BLEZ (rs, immediate))
      case '000 111 rs 00000 immediate' => Branch (BGTZ (rs, immediate))
      case '001 111 00000 rt immediate' => ArithI (LUI (rt, immediate))
      case '010 110 rs 00000 immediate' => Branch (BLEZL (rs, immediate))
      case '010 111 rs 00000 immediate' => Branch (BGTZL (rs, immediate))
      case '011 100 rs rt 00000 00000 000000' => MultDiv (MADD (rs, rt))
      case '011 100 rs rt 00000 00000 000001' => MultDiv (MADDU (rs, rt))
      case '011 100 rs rt 00000 00000 000100' => MultDiv (MSUB (rs, rt))
      case '011 100 rs rt 00000 00000 000101' => MultDiv (MSUBU (rs, rt))
      case '011 100 rs rt rd 00000 000010' => MultDiv (MUL (rs, rt, rd))
      case '000 100 rs rt immediate' => Branch (BEQ (rs, rt, immediate))
      case '000 101 rs rt immediate' => Branch (BNE (rs, rt, immediate))
      case '001 000 rs rt immediate' => ArithI (ADDI (rs, rt, immediate))
      case '001 001 rs rt immediate' => ArithI (ADDIU (rs, rt, immediate))
      case '001 010 rs rt immediate' => ArithI (SLTI (rs, rt, immediate))
      case '001 011 rs rt immediate' => ArithI (SLTIU (rs, rt, immediate))
      case '001 100 rs rt immediate' => ArithI (ANDI (rs, rt, immediate))
      case '001 101 rs rt immediate' => ArithI (ORI (rs, rt, immediate))
      case '001 110 rs rt immediate' => ArithI (XORI (rs, rt, immediate))
      case '010 100 rs rt immediate' => Branch (BEQL (rs, rt, immediate))
      case '010 101 rs rt immediate' => Branch (BNEL (rs, rt, immediate))
      case '011 000 rs rt immediate' => ArithI (DADDI (rs, rt, immediate))
      case '011 001 rs rt immediate' => ArithI (DADDIU (rs, rt, immediate))
      case '011 010 rs rt immediate' => Load (LDL (rs, rt, immediate))
      case '011 011 rs rt immediate' => Load (LDR (rs, rt, immediate))
      case '100 000 rs rt immediate' => Load (LB (rs, rt, immediate))
      case '100 001 rs rt immediate' => Load (LH (rs, rt, immediate))
      case '100 010 rs rt immediate' => Load (LWL (rs, rt, immediate))
      case '100 011 rs rt immediate' => Load (LW (rs, rt, immediate))
      case '100 100 rs rt immediate' => Load (LBU (rs, rt, immediate))
      case '100 101 rs rt immediate' => Load (LHU (rs, rt, immediate))
      case '100 110 rs rt immediate' => Load (LWR (rs, rt, immediate))
      case '100 111 rs rt immediate' => Load (LWU (rs, rt, immediate))
      case '101 000 rs rt immediate' => Store (SB (rs, rt, immediate))
      case '101 001 rs rt immediate' => Store (SH (rs, rt, immediate))
      case '101 010 rs rt immediate' => Store (SWL (rs, rt, immediate))
      case '101 011 rs rt immediate' => Store (SW (rs, rt, immediate))
      case '101 100 rs rt immediate' => Store (SDL (rs, rt, immediate))
      case '101 101 rs rt immediate' => Store (SDR (rs, rt, immediate))
      case '101 110 rs rt immediate' => Store (SWR (rs, rt, immediate))
      case '110 000 rs rt immediate' => Load (LL (rs, rt, immediate))
      case '110 100 rs rt immediate' => Load (LLD (rs, rt, immediate))
      case '110 111 rs rt immediate' => Load (LD (rs, rt, immediate))
      case '111 000 rs rt immediate' => Store (SC (rs, rt, immediate))
      case '111 100 rs rt immediate' => Store (SCD (rs, rt, immediate))
      case '111 111 rs rt immediate' => Store (SD (rs, rt, immediate))
      case '101 111 base opn immediate' => CACHE (base, opn, immediate)
      case '011 111 00000 rt rd 00000 111011' => RDHWR (rt, rd)
      case '010 000 1000 0000 0000 0000 0000 100000' => WAIT
      case _ => ReservedInstruction
   }
}

--================================================
-- The next state function
--================================================

unit Next =
{
   match Fetch
   {
      case Some (w) => Run (Decode (w))
      case None => nothing
   } ;
   match BranchDelay, BranchTo
   {
      case None, None => PC <- PC + 4
      case None, Some (true, addr) =>  -- untaken branch
      {
         BranchDelay <- Some (None);
         BranchTo <- None;
         PC <- addr
      }
      case None, Some (false, addr) => -- delayed branch
      {
         BranchDelay <- Some (Some (addr));
         BranchTo <- None;
         PC <- PC + 4
      }
      case Some (None), None =>
      {
         BranchDelay <- None;
         PC <- PC + 4
      }
      case Some (Some (addr)), None =>
      {
         BranchDelay <- None;
         PC <- addr
      }
      case _ => #UNPREDICTABLE ("Branch follows branch")
   };
   exceptionSignalled <- false;
   CP0.Count <- CP0.Count + 1
}
