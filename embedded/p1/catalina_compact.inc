'
' v3.7  - first (beta) version
'
' v3.13 - combined all floating point ops into one (I16B_FLTP) and added 
'         relative jumps (I16B_JRXX) - the latter are currently only used
'         by the Optimizer, since the offsets cannot be calculated during
'         compilation, only during binding.
'
' Catalina Compact Instruction set constants:
'
CON

R0      = 0
R1      = 1
R2      = 2
R3      = 3
R4      = 4
R5      = 5
R6      = 6
R7      = 7
R8      = 8
R9      = 9
R10     = 10
R11     = 11
R12     = 12
R13     = 13
R14     = 14
R15     = 15
R16     = 16
R17     = 17
R18     = 18
R19     = 19
R20     = 20
R21     = 21
R22     = 22
R23     = 23
PC      = 24
SP      = 25
FP      = 26
RI      = 27
BC      = 28
BA      = 29
BZ      = 30
CS      = 31

INST_OFF     = $25  ' must match INST_OFF     in Catalina_CMM.spin
FC_TMP       = $27  ' must match FC_TMP       in Catalina_CMM.spin
FC_START     = $53  ' must match FC_START     in Catalina_CMM.spin

' for CMM, some kernel modifications are required when debugging ...

#ifdef BLACKBOX

DEBUG_ADJUST = $6c  ' must match DEBUG_ADJUST in Catalina_CMM.Spin
FC_INLINE    = $71  ' must macth FC_INLINE    in catalina_CMM.spin
EXEC_STOP    = $72  ' must match EXEC_STOP    in Catalina_CMM.spin
DECODE_OFF   = $74  ' must match DECODE_OFF   in Catalina_CMM.spin
FC_RETURN    = $1e2 ' must match FC_RETURN    in Catalina_CMM.spin 

#else

FC_INLINE    = $6f  ' must macth FC_INLINE    in catalina_CMM.spin
EXEC_STOP    = $70  ' must match EXEC_STOP    in Catalina_CMM.spin
#ifdef libthreads
FC_RETURN    = $1e8 ' must match FC_RETURN    in Catalina_CMM_threaded.spin
#else
FC_RETURN    = $1e2 ' must match FC_RETURN    in Catalina_CMM.spin
#endif

#endif

' 16 bit operations (set a):
' ==========================
'
' ppppp <5 bits dst> <5 bits src> 0 ==> 32 such operations
'
S16A = 1 ' amount to shift src left 
D16A = 6 ' amount to shift dst left 
'
I16A_NOP    = %00000_00000_00000_0  '  NOP         ' no operation
I16A_MOV    = %00001_00000_00000_0  '  MOV    d,s  ' move register
I16A_RDBYTE = %00010_00000_00000_0  '  RDBYTE d,s  '
I16A_RDWORD = %00011_00000_00000_0  '  RDWORD d,s  '
I16A_RDLONG = %00100_00000_00000_0  '  RDLONG d,s  '
I16A_WRBYTE = %00101_00000_00000_0  '  WRBYTE d,s  '
I16A_WRWORD = %00110_00000_00000_0  '  WRWORD d,s  '
I16A_WRLONG = %00111_00000_00000_0  '  WRLONG d,s  '
I16A_ADD    = %01000_00000_00000_0  '  ADD    d s  '
I16A_ADDS   = %01001_00000_00000_0  '  ADDS   d,s  '
I16A_AND    = %01010_00000_00000_0  '  AND    d,s  '
I16A_OR     = %01011_00000_00000_0  '  OR     d,s  '
I16A_XOR    = %01100_00000_00000_0  '  XOR    d,s  '
I16A_SUB    = %01101_00000_00000_0  '  SUB    d,s  '
I16A_SUBS   = %01110_00000_00000_0  '  SUBS   d,s  '
I16A_CMP    = %01111_00000_00000_0  '  CMP    d,s  ' compare d with s (unsigned)
I16A_CMPS   = %10000_00000_00000_0  '  CMPS   d,s  ' compare d with s (signed)
I16A_NEG    = %10001_00000_00000_0  '  NEG    d,s  ' move negative
I16A_SHL    = %10010_00000_00000_0  '  SHL    d,s  ' shift left d by s
I16A_SHR    = %10011_00000_00000_0  '  SHR    d,s  ' shift right d by s             
I16A_SAR    = %10100_00000_00000_0  '  SAR    d,s  ' shift arithmetic right d by s             
I16A_SHLI   = %10101_00000_00000_0  '  SHLI   d,#s ' shift left d by s (short immediate - 5 bits)
I16A_SHRI   = %10110_00000_00000_0  '  SHRI   d,#s ' shift right d by s (short immediate - 5 bits) 
I16A_SARI   = %10111_00000_00000_0  '  SARI   d,#s ' shift arithmetic right d by s (short immediate - 5 bits) 
I16A_ADDI   = %11000_00000_00000_0  '  ADDI   d,#s ' add s to d (short immediate - 5 bits)
I16A_SUBI   = %11001_00000_00000_0  '  SUBI   d,#s ' sub s from d (short immediate - 5 bits)
I16A_MOVI   = %11010_00000_00000_0  '  MOVI   d,#s ' mov s to d (short immediate - 5 bits)
I16A_ADDSI  = %11011_00000_00000_0  '  ADDSI  d,#s ' adds s to d (short immediate - 5 bits)     
I16A_SUBSI  = %11100_00000_00000_0  '  SUBSI  d,#s ' subs s from d (short immediate - 5 bits)   
I16A_CMPI   = %11101_00000_00000_0  '  CMP    d,#s ' compare d with s (unsigned short immediate - 5 bits) 
I16A_CMPSI  = %11110_00000_00000_0  '  CMPS   d,#s ' compare d with s (signed short immediate - 5 bits)   
I16A_NEGI   = %11111_00000_00000_0  '  NEGI   d,#s ' move negative s to d (short immediate - 5 bits)
'
' 16 bit operations (set b):
' ==========================
'
' ppppp <9 bit src or dst or param> 01 ==> 32 such operations
'
S16B = 2 ' amount to shift parameter left (same for src and dst)
D16B = 2 ' amount to shift parameter left (same for src and dst)

I16B_LODF   = %00000_000000000_01  '  LODF  s   ' load FP + s to RI (s is signed - 9 bits)
I16B_RETF   = %00001_000000000_01  '  RETF  s   ' release frame of size s (immediate - 9 bits) and return
I16B_RETN   = %00010_000000000_01  '  RETN      ' return (next inst must be long aligned!)
I16B_POPM   = %00011_000000000_01  '  POPM  p   ' pop multiple registers, pop frame (size lower 7 bits of p) if bit 8 clear, return if bit 9 clear
I16B_JMPI   = %00100_000000000_01  '  JMPI      ' jump indirect
I16B_CALI   = %00101_000000000_01  '  CALI      ' call indirect
I16B_PSHL   = %00110_000000000_01  '  PSHL      ' push RI onto stack
I16B_DIVS   = %00111_000000000_01  '  DIVS      ' signed division r0 & r1
I16B_DIVU   = %01000_000000000_01  '  DIVU      ' unsigned division r0 & r1
I16B_MULT   = %01001_000000000_01  '  MULT      ' multiplication r0 & r1
I16B_FLTP   = %01010_000000000_01  '  FLTP  p   ' floating point plugin            (p is float operation)  was I16B_FADD 
I16B_RJ_Z   = %01011_000000000_01  '  RJ_Z  s   ' relative jump if Z set           (s is signed - 9 bits)  was I16B_FSUB 
I16B_RJNZ   = %01100_000000000_01  '  RJNZ  s   ' relative jump if Z clr           (s is signed - 9 bits)  was I16B_FMUL 
I16B_RJAE   = %01101_000000000_01  '  RJAE  s   ' relative jump if C clr           (s is signed - 9 bits)  was I16B_FDIV 
I16B_RJ_A   = %01110_000000000_01  '  RJ_A  s   ' relative jump if C clr and Z clr (s is signed - 9 bits)  was I16B_FCMP 
I16B_RJBE   = %01111_000000000_01  '  RJBE  s   ' relative jump if C set or Z set  (s is signed - 9 bits)  was I16B_FLIN 
I16B_RJ_B   = %10000_000000000_01  '  RJ_B  s   ' relative jump if C set           (s is signed - 9 bits)  was I16B_INFL 
I16B_SYSP   = %10001_000000000_01  '  SYSP      ' system plugin
I16B_EXEC   = %10010_000000000_01  '  EXEC      ' execute multiple longs as PASM instruction
I16B_SIGN   = %10011_000000000_01  '  SIGN  d   ' toggle sign bit (bit 31) of d
I16B_CPL    = %10100_000000000_01  '  COMP  d   ' complement d
I16B_TRN1   = %10101_000000000_01  '  TRN1  d   ' truncate byte in d
I16B_TRN2   = %10110_000000000_01  '  TRN2  d   ' truncate word in d
I16B_LODL   = %10111_000000000_01  '  LODL  d   ' load d with long at next 32 bit boundary
I16B_BRKP   = %11000_000000000_01  '  BRKP      ' breakpoint (reserved for debugger)
I16B_FCACHE = %11001_000000000_01  '  FCACHE p  ' Load FCACHE with the next p longs and execute (p <= 25, including exit)
I16B_PASM   = %11010_000000000_01  '  PASM      ' execute next long as PASM instruction
I16B_CPREP  = %11011_000000000_01  '  CPREP p   ' mov 4*(top 5 bit of s) (immediate) to BC, sub 4*(lower 4 bits of s) (immediate) from SP
I16B_JMPR   = %11100_000000000_01  '  JMPR  s   ' jump relative (s is signed - 9 bits)
'
' floating point plugin operations (used in I16B_FLTP):
'
FADD  = 1 ' (was I16B_FADD)
FSUB  = 2 ' (was I16B_FSUB)
FMUL  = 3 ' (was I16B_FMUL)
FDIV  = 4 ' (was I16B_FFIV)
FLIN  = 5 ' (was I16B_FLIN)
INFL  = 6 ' (was I16B_INFL)
FRND  = 7 ' (was no equiv)
FSQR  = 8 ' (was no equiv)
FCMP  = 9 ' (was I16B_FCMP)
'
'
' 32 bit operations:
' ==================
'
' pppppp <24 bits> 11                                  \
'   or                                                 | 
' pppppp <6 bits unused> <9 bits dst> <9 bits src> 11  | ==> 64 such operations 
'   or                                                 |
' pppppp <5 bits dst> <19 bits src> 11                 /
'                                      
S32  = 2  ' amount to shift source left
D32  = 11 ' amount to shift destination left (for all except I32_LODS)
D32S = 21 ' amount to shift destination left (for I32_LODS only)
'
I32_JMPA   = %000000___000000000000000000000000_11  '  JMPA  s   ' jump s
I32_CALA   = %000001___000000000000000000000000_11  '  CALA  s   ' call s
I32_LODI   = %000010___000000000000000000000000_11  '  LODI  s   ' load long from s to RI 
I32_PSHA   = %000011___000000000000000000000000_11  '  PSHA  s   ' push long from s
I32_PSHF   = %000100___000000000000000000000000_11  '  PSHF  s   ' push long from FP + s (s is signed)
I32_PSHM   = %000101___000000000000000000000000_11  '  PSHM  s   ' push multiple registers
I32_BR_Z   = %000110___000000000000000000000000_11  '  BR_Z  s   ' branch if z  (to  s)
I32_BRNZ   = %000111___000000000000000000000000_11  '  BRNZ  s   ' branch if nz (to  s)
I32_BRAE   = %001000___000000000000000000000000_11  '  BRAE  s   ' branch if ae (to  s)
I32_BR_A   = %001001___000000000000000000000000_11  '  BR_A  s   ' branch if a  (to  s)
I32_BRBE   = %001010___000000000000000000000000_11  '  BRBE  s   ' branch if be (to  s)
I32_BR_B   = %001011___000000000000000000000000_11  '  BR_B  s   ' branch if b  (to  s)
I32_PSHB   = %001100___000000000000000000000000_11  '  PSHB  s   ' push s bytes from r0 to stack
I32_CPYB   = %001101___000000000000000000000000_11  '  CPYB  s   ' copy s bytes from r1 to r0 
I32_LODA   = %001110___000000000000000000000000_11  '  LODA  s   ' load 24 bit immediate value (e.g. addr) to RI 
I32_NEWF   = %001111___000000000000000000000000_11  '  NEWF  s   ' new frame of size s
I32_RETF   = %010000___000000000000000000000000_11  '  RETF  s   ' release frame of size s and return
I32_LODF   = %010001___000000000000000000000000_11  '  LODF  s   ' load FP + s to RI (s is signed)
I32_MOV    = %010010_000000_000000000_000000000_11  '  MOVA  d,s ' move s to d (allows any src/dst)
I32_MOVI   = %010011_000000_000000000_000000000_11  '  MOVI  d,s ' move s to d (long immediate - 9 bits)
I32_SPILL  = %010100_000000_000000000_000000000_11  '  SPILL d     spill register d to stack (for variadic)
I32_CPREP  = %010101_000000_000000000_000000000_11  '  CPREP d,s ' mov s (immediate) to BC, sub d (immediate) from SP
I32_LODS   = %010110__00000_0000000000000000000_11  '  LODS  d,s ' load 19 bits (signed immediate) to d
'
' Example instructions:
'
'    word I16A_MOV + r0<<D16A + r1<<S16A
'    word I16A_SHRI + r0<<D16A + $16<<S16A
'    long I32_JMPA + @FUNCTION<<S32
'    long I32_MOVI + R1<<I32D + $1FF<<S32
'    word I16B_RETN
'
' Important notes:
'
' The I16B_PASM instruction can be used for executing a SINGLE "normal" PASM 
' instruction that does not have "compact" representations, such as CLKSET, 
' COGID, COGSTOP, COGSTART, WAITCNT, LOCKCLR, LOCKNEW, LOCKRET, LOCKSET, 
' WAITCNT, WAITPEQ, WAITPNE and WAITVID. For example:
'
'    word I16B_PASM
'    COGID r0
'
' The I16B_EXEC instruction can be used to execute a SEQUENCE of "normal" 
' PASM instructions. The sequence of "normal" instructions initiated by 
' I16B_EXEC must be terminated by the special instruction "jmp #EXEC_STOP". 
' For example:
'
'    word I16B_EXEC
'    waitcnt r0,r1
'    lockset r2
'    jmp #EXEC_STOP
'
' NOTE that when using I16B_EXEC or I16B_PASM to execute "normal" PASM 
' instructions which modify the PASM - e.g. CALL instructions cannot be
' used, nor can MOVD, MOVI or MOV (on the Propeller 1) or SETS, SETI or
' SETD (on the Propeller 2). Also, note that on the Propeller 2 you 
' cannot assume that insructions are executed immediately after each 
' other even if it looks like they will be - so instructions like 
' SETQ may not work as expected.
'
' For CALL instructions, it is easiest to do these from "compact" PASM, 
' not "normal" PASM (i.e. not using I16B_EVAL or I16B_PASM). For example:
'
'        word I16B_EXEC                ' start executing "normal" PASM
'        mov r0,#1                     ' arguments to function
'        jmp #EXEC_STOP                ' stop executing "normal" PASM
'        long I32_CALA + @func<<S32    ' call function using "compact" PASM
'        long I32_JMPA + @next<<S32    ' jump to code following function
' func                                 ' embedded PASM function
'        word I16B_EXEC                ' start executing "normal" PASM
'        or dira,r0                    ' perform ...
'        xor outa,r0                   ' ... the function 
'        jmp #EXEC_STOP                ' stop executing "normal" PASM
'        word I16B_RETN                ' return to function caller
' next
'
' When writing code to use "I16B_FCACHE", you cannot use JMP instructions.
' Instead, add or subtract a suitable value from the kernel PC register. 
' To automatically calculate the offset to add or subtract, use labels. 
' For example, in the following case we want to jump backwards to Label_1, 
' so we insert Label_2 immediately AFTER the instruction which will 
' perform the jump - this allows us to calculate the offset to use.
' In this case we want to jump backwards, so we subtract the value 
' #(@Label_2-@Label_1) from the PC. We also use labels to calculate
' the size of the code to FCACHE:
'        
' word I16B_FCACHE + ((@FC_end-@FC_start)/4)<<S16B
'        alignl
' FC_start
'        mov r,#15
' Label_1
'        sub r1,#1 wz
'  if_nz sub PC,#(@Label_2-@Label_1)   ' jump backwards to Label_1
'        alignl
' Label_2
'        jmp #FC_RETURN
'        alignl
' FC_end
'
' On the P2, we use "alignl" to force P1-style alignment of longs. This is
' not required on the P1, but we may still emit the "alignl" keyword, so for
' the P1 we define it to do the same, which effectively does nothing ...
'
#ifndef P2
#ifndef alignl
#define alignl long
#endif
#endif

