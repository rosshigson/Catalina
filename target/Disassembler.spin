{{
***************************
* Disassembler for        *
* Propeller assembly code *
*  (C) 2007 Thomas Kliche *
***************************

Revision History
----------------
 1.1 on 29 March 2007
     - fixed in getNextPC when debug step into at jmpret
     - fixed in getConditionStr, ifNC was missing
     - removed object dependency
     - added method getPrintableStr to format data as printable characters
       which is useful in hexadecimal view
     - some code optimizations

 1.0 on 18 March 2007
     - first public version

...................................................................................................

This is a disassembler to decode assembly instructions of the Propeller. You can use it like
following example.

OBJ
  screen : "TV_Text"
  disasm : "Disassembler"

PUB start
  screen.start(12)

PUB showInstruction(addr, instr)
'addr  - the address of instruction
'instr - the long of assembly instruction

  disasm.decode(instr)                 'this must be always called first
  screen.hex(addr, 3)
  screen.out(" ")
  screen.str(disasm.getConditionStr)   'show condition if available
  screen.out(" ")
  screen.str(disasm.getInstructionStr) 'show instruction mnemonic
  screen.out(" ")
  screen.str(disasm.getDestSrcStr)     'show destination and source of instruction
  screen.out(" ")
  screen.str(disasm.getEffectStr)      'show effects if available


The disassembler depends on the object AsmDebug.spin. Please keep in mind to update the OBJ section
of this file to your named debug file. Otherwise it will not work.

---------------------------------------------------------------------------------------------------
}}
CON

  'command for communication with debug kernel
  CMD_RDCOGDATA   = 3                                   'read data from Cog memory
  CMD_RDMAINDATA  = 1

  FLAG_I         = %0001
  FLAG_R         = %0010
  FLAG_C         = %0100
  FLAG_Z         = %1000

  MSK_ADDR       = $1FF
  MSK_COND_FLAGS = $F
  MSK_OPCODE     = $3F

  'some operation codes
  OPC_CALL       = $17
  OPC_AND        = $18
  OPC_SUB        = $21
  OPC_CMPS       = $30
  OPC_CMPSX      = $31
  OPC_SUBX       = $33

  TYPE_BYTE      = 0
  TYPE_WORD      = 1
  TYPE_LONG      = 3

VAR

  byte  DestAddrVisible
  byte  SrcAddrVisible
  byte  EffectVisible
  byte  NextIsLong

  byte  Effect[9]
  byte  DestAddr[5]
  byte  SrcAddr[6]
  byte  Temp[10]

  byte  InstrOpcode
  byte  InstrCond
  byte  InstrFlags
  word  InstrDest
  word  InstrSrc

OBJ
  common : "Catalina_Common"

PUB decode(instrCode)

  NextIsLong := FALSE
  InstrSrc := instrCode & MSK_ADDR
  InstrDest := (instrCode >>= 9) & MSK_ADDR
  InstrCond := (instrCode >>= 9) & MSK_COND_FLAGS
  InstrFlags := (instrCode >>= 4) & MSK_COND_FLAGS
  InstrOpcode := (instrCode >> 4) & MSK_OPCODE


PUB getConditionStr : condStr

  condStr := lookupz(InstrCond: @never_always, @ifNZaNC, @ifZaNC, @ifNC, {
}                               @ifNZaC, @ifNZ, @ifZneC, @ifNZoNC, {
}                               @ifZaC, @ifZeqC, @ifZ, @ifZoNC,    {
}                               @ifC, @ifNZoC, @ifZoC, @never_always)


PUB getInstructionStr : instruction

  DestAddrVisible := TRUE
  SrcAddrVisible := TRUE
  EffectVisible := TRUE
  
  if InstrOpCode =< $3F
    bytemove(@Temp,@CogOpName + InstrOpCode * 8, 8)
  else
    bytemove(@Temp, string("N.A."), 5)
    DestAddrVisible := FALSE
    SrcAddrVisible := FALSE
     
  
  case InstrOpcode
    $00:
      EffectVisible := FALSE
      if InstrCond
        if (InstrFlags & FLAG_R) == FLAG_R
          bytemove(@Temp, string("rdbyte"), 7)
        else
          bytemove(@Temp, string("wrbyte"), 7)
      else
        DestAddrVisible := FALSE
        SrcAddrVisible := FALSE

    $01:
      EffectVisible := FALSE
      if (InstrFlags & FLAG_R) == FLAG_R
        bytemove(@Temp, string("rdword"), 7)

    $02:
      EffectVisible := FALSE
      if (InstrFlags & FLAG_R) == FLAG_R
        bytemove(@Temp, string("rdlong"), 7)

    $03:
      EffectVisible := FALSE
      if (InstrFlags & FLAG_I) == FLAG_I
        SrcAddrVisible := FALSE
        case InstrSrc & 7
          0:
            bytemove(@Temp, string("clkset"), 7)

          1:
            bytemove(@Temp, string("cogid"), 6)

          2:
            bytemove(@Temp, string("coginit"), 8)
            EffectVisible := TRUE

          3:
            bytemove(@Temp, string("cogstop"), 8)

          4:
            bytemove(@Temp, string("locknew"), 8)
            EffectVisible := TRUE

          5:
            bytemove(@Temp, string("lockret"), 8)

          6:
            bytemove(@Temp, string("lockset"), 8)
            EffectVisible := TRUE

          7:
            bytemove(@Temp, string("lockclr"), 8)
            EffectVisible := TRUE

    $17:
      EffectVisible := FALSE
      if (InstrFlags & FLAG_I) == FLAG_I
        DestAddrVisible := FALSE
        if (InstrFlags & FLAG_R) == FLAG_R
          bytemove(@Temp, string("call"), 5)
        elseif InstrSrc == 0
          bytemove(@Temp, string("ret"), 4)
        else
          if opcodeLMM(@Temp)
             SrcAddrVisible := FALSE
             
      else
        if (InstrFlags & FLAG_R) == FLAG_R
          bytemove(@Temp, string("jmpret"), 7)
        else
          if opcodeLMM(@Temp)
             SrcAddrVisible := FALSE
          DestAddrVisible := FALSE

    $18:
      if (InstrFlags & FLAG_R) == FLAG_R
        bytemove(@Temp, string("and"), 4)

    $21:
      if (InstrFlags & FLAG_R) == FLAG_R
        bytemove(@Temp, string("sub"), 4)

    $33:
      if (InstrFlags & FLAG_R) == FLAG_R
        bytemove(@Temp, string("subx"), 5)


  instruction := @Temp

PRI opcodeLMM (Dest) : LMM

  if (InstrSrc => common#LMM_FIRST_OPCODE) and (InstrSrc =< common#LMM_LAST_OPCODE)
    LMM := TRUE
    bytemove (Dest, getLMMOpName(InstrSrc), 5)
  else
    LMM := FALSE

  case InstrSrc
    $03,$04,$05,$07,$08:
      NextIsLong := TRUE
    $13 .. $18:
      NextIsLong := TRUE
    $0b,$0e,$1a,$22,$23,$24:
      NextIsLong := TRUE
    other:
      NextIsLong := FALSE

PUB ResetNext
   NextIsLong := FALSE

PUB nextIsData : data
   data := NextIsLong
   NextIsLong := FALSE

PUB getDestSrcStr (LMM) : destSrc | size

  size := 0
  if DestAddrVisible
    getDestinationStr (LMM)
    bytemove(@Temp, @DestAddr, strsize(@DestAddr))
    size += strsize(@DestAddr)
    BYTE[@Temp][size++] := ","
    bytemove(@DestAddr, @Temp, strsize(@Temp))

  if SrcAddrVisible
    getSourceStr (LMM)
    if DestAddrVisible
      bytemove(@Temp, @DestAddr, strsize(@DestAddr))

    bytemove(@Temp + size, @SrcAddr, strsize(@SrcAddr))
    size += strsize(@SrcAddr)

  BYTE[@Temp][size] := 0
  destSrc := @Temp


PUB getEffectStr : effStr | size

  size := 0
  if InstrOpcode > 3 AND (InstrOpcode == OPC_CMPS OR InstrOpcode == OPC_CMPSX)
    if (InstrFlags & FLAG_R) == FLAG_R
      bytemove(@Effect + size, @effWR, 2)
      size += 2

  if InstrOpcode > 3 AND InstrOpcode <> OPC_CALL AND InstrOpcode <> OPC_AND {
}                    AND InstrOpcode <> OPC_SUB AND InstrOpcode <> OPC_SUBX
    if (InstrFlags & FLAG_R) == 0
      bytemove(@Effect + size, @effNR, 2)
      size += 2

  if InstrFlags & FLAG_Z == FLAG_Z
    if size > 0
      BYTE[@Effect][size++] := ","

    bytemove(@Effect + size, @effZ, 2)
    size += 2

  if InstrFlags & FLAG_C == FLAG_C
    if size > 0
      BYTE[@Effect][size++] := ","

    bytemove(@Effect + size, @effC, 2)
    size += 2

  BYTE[@Effect][size] := 0

  effStr := @Effect


PUB getNextPC(pc, flags, dbgParPtr, stepInto, LMM) : nextPC | data, incr

  if LMM
    incr := 4
  else
    incr := 1
  
  case InstrCond
    0:
      InstrOpcode := 0

    1:
      if (flags & (FLAG_Z | FLAG_C)) <> 0
      InstrOpcode := 0

    2:
      if (flags & (FLAG_Z | FLAG_C)) <> FLAG_Z
        InstrOpcode := 0

    3:
      if (flags & FLAG_C) <> 0
        InstrOpcode := 0

    4:
      if (flags & (FLAG_Z | FLAG_C)) <> FLAG_C
        InstrOpcode := 0

    5:
      if (flags & FLAG_Z) <> 0
        InstrOpcode := 0

    6:
      if (flags & FLAG_Z) == (flags & FLAG_C) << 1
        InstrOpcode := 0

    7:
      if (flags & FLAG_Z) <> 0 OR (flags & FLAG_C) <> 0
        InstrOpcode := 0

    8:
      if (flags & (FLAG_Z | FLAG_C)) <> (FLAG_Z | FLAG_C)
        InstrOpcode := 0

    9:
      if (flags & FLAG_Z) <> (flags & FLAG_C) << 1
        InstrOpcode := 0

    10:
      if (flags & FLAG_Z) <> FLAG_Z
        InstrOpcode := 0

    11:
      if (flags & FLAG_Z) <> FLAG_Z OR (flags & FLAG_C) <> 0
        InstrOpcode := 0

    12:
      if (flags & FLAG_C) <> FLAG_C
        InstrOpcode := 0

    13:
      if (flags & FLAG_Z) <> 0 OR (flags & FLAG_C) <> FLAG_C
        InstrOpcode := 0

    14:
      if (flags & FLAG_Z) <> FLAG_Z OR (flags & FLAG_C) <> FLAG_C
        InstrOpcode := 0


  case InstrOpcode
    $17: 'call, ret, jmpret, jmp
      if (InstrFlags & FLAG_I) == FLAG_I
        if (InstrFlags & FLAG_R) == FLAG_R              'call
          if stepInto
            nextPC := InstrSrc
          else
            nextPC := pc + incr
        elseif InstrSrc == 0                            'ret
          nextPC := InstrSrc
        else                                            'jmp
          if LMM
            nextPC := getNextLMM(pc, flags, dbgParPtr, InstrSrc, stepInto)
          else
            nextPC := InstrSrc
      else
        if (InstrFlags & FLAG_R) == FLAG_R              'jmpret
          if stepInto
            data := getData(dbgParPtr, InstrSrc, LMM)
            nextPC := data
          else
            nextPC := pc + incr
        else                                            'jmp
          if LMM
            nextPC := getNextLMM(pc, flags, dbgParPtr, InstrSrc, stepInto)
          else
            nextPC := InstrSrc

    $39: 'djnz
      data := getData(dbgParPtr, InstrDest, LMM)
      if (data - 1) <> 0
        nextPC := InstrSrc
      else
        nextPC := pc + incr

    $3A: 'tjnz
      data := getData(dbgParPtr, InstrDest, LMM)
      if data <> 0
        nextPC := InstrSrc
      else
        nextPC := pc + incr

    $3B: 'tjz
      data := getData(dbgParPtr, InstrDest, LMM)
      if data == 0
        nextPC := InstrSrc
      else
        nextPC := pc + incr

    other:
      nextPC := pc + incr


PUB getPrintableStr(value, type) : printable | byteValue, i

  repeat i from 0 to type
    byteValue := (value & $FF)
    value >>= 8
    case byteValue
      $20..$7F:
        BYTE[@Temp][i] := byteValue

      other:
        BYTE[@Temp][i] := "."

  BYTE[@Temp][type + 1] := 0
  printable := @Temp

PUB getLMMRegName (reg) : addr
  if (reg => common#LMM_FIRST_REG_OFF) and (reg =< common#LMM_LAST_REG_OFF)
    addr := @LMMRegName + 4 * (reg - common#LMM_FIRST_REG_OFF)
  else
    addr := @LMMRegErr

PUB getLMMOpName (reg) : addr
  if (reg => common#LMM_FIRST_OPCODE) and (reg =< common#LMM_LAST_OPCODE)
    addr := @LMMOpName + 5 * (reg - common#LMM_FIRST_OPCODE)
  else
    addr := @LMMOpBlank

PRI regLMM(reg) 

  bytemove(@Temp, getLMMRegName(reg), 4)
    

PRI getDestinationStr (LMM) : destination | size

  size := 0
  if DestAddrVisible
    if LMM and (InstrDest => common#LMM_FIRST_REG_OFF) and (InstrDest =< common#LMM_LAST_REG_OFF)
       regLMM(InstrDest)    
    else
      hex(InstrDest, 3)
      BYTE[@DestAddr][size++] := "$"
    bytemove(@DestAddr + size, @Temp, strsize(@Temp))
    size += strsize(@Temp)

  BYTE[@DestAddr][size] := 0
  destination := @DestAddr


PRI getSourceStr (LMM) : source | size

  size := 0
  if SrcAddrVisible
    if ((InstrFlags & FLAG_I) <> FLAG_I) and LMM and (InstrSrc => common#LMM_FIRST_REG_OFF) and (InstrSrc =< common#LMM_LAST_REG_OFF)
       regLMM(InstrSrc)    
    else
      hex(InstrSrc, 3)
      if (InstrFlags & FLAG_I) == FLAG_I
        BYTE[@SrcAddr][size++] := "#"

      BYTE[@SrcAddr][size++] := "$"
    bytemove(@SrcAddr + size, @Temp, strsize(@Temp))
    size += strsize(@Temp)

  BYTE[@SrcAddr][size] := 0
  source := @SrcAddr


PRI hex(value, digits) | i

  value <<= (8 - digits) << 2
  repeat i from 1 to digits
    BYTE[@Temp][i - 1] := lookupz((value <-= 4) & $F : "0".."9", "A".."F")

  BYTE[@Temp][digits] := 0


PRI getData(dbgParPtr, addr, LMM) : data

  LONG[dbgParPtr][1] := addr
  if LMM
    LONG[dbgParPtr] := CMD_RDMAINDATA
  else
    LONG[dbgParPtr] := CMD_RDCOGDATA
  repeat until LONG[dbgParPtr] == 0

  data := LONG[dbgParPtr][2]


PRI getNextLMM(addr, flags, dbgParPtr, LMM_Instr, stepInto) : next_addr | aType, FP, SP

  case LMM_Instr
    common#LMM_INIT:
      aType := 7
      
    common#LMM_LODL, common#LMM_LODI, common#LMM_LODF, common#LMM_PSHA, common#LMM_PSHF, common#LMM_PSHM, common#LMM_POPM:
      aType := 2
      
    common#LMM_PSHB, common#LMM_CPYB:
      aType := 2
       
    common#LMM_CALA:
      ' if stepInto, next address is next long plus base address, otherwise + 8
      if stepInto
        aType := 4
      else
        aType := 2

    common#LMM_CALI:
      if stepInto
        ' read RI
        aType := 3
      else
        aType := 2
             
    common#LMM_RETN:
      ' read SP, then read address address from stack
      aType := 5
      
    common#LMM_RETF:
      ' read FP, then read address from frame
      aType := 6

    common#LMM_JMPA:
      ' read next long
      aType := 4

    common#LMM_JMPI:
      ' read RI
      aType := 3
    
    common#LMM_BR_Z:
      'if condition, next address is next long, otherwise + 8
      if (flags & FLAG_Z) <> 0
        aType := 4
      else
        aType := 2
      
    common#LMM_BRNZ:
      'if condition, next address is next long, otherwise + 8
      if (flags & FLAG_Z) == 0
        aType := 4
      else
        aType := 2
      
    common#LMM_BRAE:
      'if condition, next address is next long, otherwise + 8
      if (flags & FLAG_C) == 0
        aType := 4
      else
        aType := 2
        
    common#LMM_BR_A:
      'if condition, next address is next long, otherwise + 8
      if (flags & FLAG_Z) == 0 AND (flags & FLAG_C) == 0
        aType := 4
      else
        aType := 2
      
    common#LMM_BRBE:
      'if condition, next address is next long, otherwise + 8
      if (flags & FLAG_Z) <> 0 OR (flags & FLAG_C) <> 0
        aType := 4
      else
        aType := 2
        
    common#LMM_BR_B:
      'if condition, next address is next long, otherwise + 8
      if (flags & FLAG_C) <> 0
        aType := 4
      else
        aType := 2

    other:
      aType := 0

  case aType
    2: ' next instruction is after an intermediate long
      next_addr := addr + 8 
      
    3: ' next instruction is at address in RI
      next_addr := getData(dbgParPtr, common#LMM_RI_OFF, FALSE)
      
    4: ' next instruction is at next long
      next_addr := getData(dbgParPtr, addr + 4, TRUE)
      ' next_addr += getData(dbgParPtr, common#LMM_BA_OFF, FALSE)
      
    5: ' next instruction is at address on stack 
      SP := getData(dbgParPtr, common#LMM_SP_OFF, FALSE)
      next_addr := getData(dbgParPtr, SP, TRUE)
      
    6: ' next address is saved at the frame pointer + 4
      FP := getData(dbgParPtr, common#LMM_FP_OFF, FALSE)
      next_addr := getData(dbgParPtr, FP + 4, TRUE)
    
    7: ' special case - next address is initial PC
      next_addr := getData(dbgParPtr, $49, FALSE)
      next_addr := next_addr << 2 + 8
      
    other: ' next instruction follows immediately
      next_addr := addr + 4
       

    

DAT

effNR         byte  "nr",0
effWR         byte  "wr",0
effC          byte  "wc",0
effZ          byte  "wz",0

conditionTable
never_always  byte  0         'never or always
ifNZaNC       byte  "NZ&NC",0
ifZaNC        byte  "Z&NC",0
ifNC          byte  "NC",0
ifNZaC        byte  "NZ&C",0
ifNZ          byte  "NZ",0
ifZneC        byte  "Z<>C",0
ifNZoNC       byte  "NZ/NC",0
ifZaC         byte  "Z&C",0
ifZeqC        byte  "Z=C",0
ifZ           byte  "Z",0
ifZoNC        byte  "Z/NC",0
ifC           byte  "C",0
ifNZoC        byte  "NZ/C",0
ifZoC         byte  "Z/C",0
'
LMMOpBlank    byte "    ",0

LMMOpName     byte "INIT",0
              byte "LODL",0
              byte "LODI",0
              byte "LODF",0
              byte "PSHL",0
              byte "PSHB",0
              byte "CPYB",0
              byte "NEWF",0
              byte "RETF",0
              byte "CALA",0
              byte "RETN",0
              byte "CALI",0
              byte "JMPA",0
              byte "JMPI",0
              byte "DIVS",0
              byte "DIVU",0
              byte "MULT",0
              byte "BR_Z",0
              byte "BRNZ",0
              byte "BRAE",0
              byte "BR_A",0
              byte "BRBE",0
              byte "BR_B",0
              byte "SYSP",0
              byte "PSHA",0
              byte "FADD",0
              byte "FSUB",0
              byte "FMUL",0
              byte "FDIV",0
              byte "FCMP",0
              byte "FLIN",0
              byte "INFL",0
              byte "PSHM",0
              byte "POPM",0
              byte "PSHF",0
              byte "RLNG",0
              byte "RWRD",0
              byte "RBYT",0
              byte "WLNG",0
              byte "WWRD",0
              byte "WBYT",0

LMMRegErr     byte "err",0
  
LMMRegName    byte "PC",0,0 
              byte "SP",0,0 
              byte "FP",0,0 
              byte "RI",0,0 
              byte "BC",0,0 
              byte "BA",0,0 
              byte "BZ",0,0
              byte "CS",0,0 
              byte "r0",0,0 
              byte "r1",0,0 
              byte "r2",0,0 
              byte "r3",0,0 
              byte "r4",0,0
              byte "r5",0,0
              byte "r6",0,0
              byte "r7",0,0
              byte "r8",0,0
              byte "r9",0,0
              byte "r10",0
              byte "r11",0 
              byte "r12",0 
              byte "r13",0 
              byte "r14",0 
              byte "r15",0
              byte "r16",0
              byte "r17",0
              byte "r18",0
              byte "r19",0
              byte "r20",0
              byte "r21",0
              byte "r22",0
              byte "r23",0

CogOpName     byte "nop",0,0,0,0,0   ' $00
              byte "wrword",0,0      ' $01
              byte "wrlong",0,0      ' $02
              byte "hubop",0,0,0     ' $03
              byte "mul",0,0,0,0,0   ' $04
              byte "muls",0,0,0,0    ' $05
              byte "enc",0,0,0,0,0   ' $06
              byte "ones",0,0,0,0    ' $07
              byte "ror",0,0,0,0,0   ' $08
              byte "rol",0,0,0,0,0   ' $09
              byte "shr",0,0,0,0,0   ' $0a
              byte "shl",0,0,0,0,0   ' $0b
              byte "rcr",0,0,0,0,0   ' $0c
              byte "rcl",0,0,0,0,0   ' $0d
              byte "sar",0,0,0,0,0   ' $0e
              byte "rev",0,0,0,0,0   ' $0f
              byte "mins",0,0,0,0    ' $10
              byte "maxs",0,0,0,0    ' $11
              byte "min",0,0,0,0,0   ' $12
              byte "max",0,0,0,0,0   ' $13
              byte "movs",0,0,0,0    ' $14
              byte "movd",0,0,0,0    ' $15
              byte "movi",0,0,0,0    ' $16
              byte "jmp",0,0,0,0,0   ' $17
              byte "test",0,0,0,0    ' $18
              byte "andn",0,0,0,0    ' $19
              byte "or",0,0,0,0,0,0  ' $1a
              byte "xor",0,0,0,0,0   ' $1b
              byte "muxc",0,0,0,0    ' $1c
              byte "muxnc",0,0,0     ' $1d
              byte "muxz",0,0,0,0    ' $1e
              byte "muxnz",0,0,0     ' $1f
              byte "add",0,0,0,0,0   ' $20
              byte "cmp",0,0,0,0,0   ' $21
              byte "addabs",0,0      ' $22
              byte "subabs",0,0      ' $23
              byte "sumc",0,0,0,0    ' $24
              byte "sumnc",0,0,0     ' $25
              byte "sumz",0,0,0,0    ' $26
              byte "sumnz",0,0,0     ' $27
              byte "mov",0,0,0,0,0   ' $28
              byte "neg",0,0,0,0,0   ' $29
              byte "abs",0,0,0,0,0   ' $2a
              byte "absneg",0,0      ' $2b
              byte "negc",0,0,0,0    ' $2c
              byte "negnc",0,0,0     ' $2d
              byte "negz",0,0,0,0    ' $2e
              byte "negnz",0,0,0     ' $2f
              byte "cmps",0,0,0,0    ' $30
              byte "cpmsx",0,0,0     ' $31
              byte "addx",0,0,0,0    ' $32
              byte "cmpx",0,0,0,0    ' $33
              byte "adds",0,0,0,0    ' $34
              byte "subs",0,0,0,0    ' $35
              byte "addsx",0,0,0     ' $36
              byte "subsx",0,0,0     ' $37
              byte "cmpsub",0,0      ' $38
              byte "djnz",0,0,0,0    ' $39
              byte "tjnz",0,0,0,0    ' $3a
              byte "tjz",0,0,0,0,0   ' $3b
              byte "waitpeq",0       ' $3c
              byte "waitpne",0       ' $3d
              byte "waitcnt",0       ' $3e
              byte "waitvid",0       ' $3f
   
