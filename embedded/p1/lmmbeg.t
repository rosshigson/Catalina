' LCC 4.2 for Parallax Propeller
' (Catalina code generator by Ross Higson)
'
CON

#include "Constants.inc"

PUB Base : addr
   addr := @@0 ' Catalina Base Address

' Catalina Import main

CON
'
' first 2 longs reserved (for POD)
'
INIT    = $02
LODL    = $03
LODI    = $04
LODF    = $05
PSHL    = $06
PSHB    = $07
CPYB    = $08
NEWF    = $09
RETF    = $0a
CALA    = $0b
RETN    = $0c
CALI    = $0d
JMPA    = $0e
JMPI    = $0f
DIVS    = $10
DIVU    = $11
MULT    = $12
BR_Z    = $13
BRNZ    = $14
BRAE    = $15
BR_A    = $16
BRBE    = $17
BR_B    = $18
SYSP    = $19
PSHA    = $1a
FADD    = $1b
FSUB    = $1c
FMUL    = $1d
FDIV    = $1e
FCMP    = $1f
FLIN    = $20
INFL    = $21
PSHM    = $22
POPM    = $23
PSHF    = $24
RLNG    = $25
RWRD    = $26
RBYT    = $27
WLNG    = $28
WWRD    = $29
WBYT    = $2a
'           
PC      = $2b
SP      = $2c
FP      = $2d
RI      = $2e
BC      = $2f
BA      = $30
BZ      = $31
CS      = $32
'     
r0      = $33
r1      = $34
r2      = $35
r3      = $36
r4      = $37
r5      = $38
r6      = $39
r7      = $3a
r8      = $3b
r9      = $3c
r10     = $3d
r11     = $3e
r12     = $3f
r13     = $40
r14     = $41
r15     = $42
r16     = $43
r17     = $44
r18     = $45
r19     = $46
'
r20     = $47
r21     = $48
r22     = $49
r23     = $4a
'
Bit31   = $4b
all_1s  = $4c
cviu_m1 = $4d
cviu_m2 = $4e
top8    = $4f
low24   = $50
'
DAT
' 
   org $51
init_B0                        ' must match init_B0 in Catalina_LMM.spin (and
                               ' variants), Catalina_XMM.spin, lmm_progbeg.s, 
                               ' emm_progbeg.s, smm_progbeg.s, xmm_progbeg.s
                               ' and LMM_INIT_B0_OFF in Catalina_Common.spin 
                               ' and catbind.c
' 
init_BZ long  @sbrkinit '$51   ' end of code / start of heap
init_PC long  @C_main   '$52   ' the initial PC
'
' seglayout specifies the layout of the segments (0, 1, 2, 3, 4, 5, 6)
'
seglayout
        long  SEGMENT_LAYOUT
'
' segtable contains the start address of each of the segments
'
segtable
        long  @Catalina_Code
        long  @Catalina_Cnst
        long  @Catalina_Init
        long  @Catalina_Data
        long  @Catalina_Ends
        long  @Catalina_RO_Base
        long  @Catalina_RW_Base
        long  @Catalina_RO_Ends
        long  @Catalina_RW_Ends
'
' initial file is catalina_progbeg.s

' Catalina Code
'
DAT ' code segment

 long ' align long
'
' Initial PASM goes here (if any) ...
'
'
' Catalina Init

DAT ' initalized data segment

' Catalina Export errno

 long ' align long

C_errno long 0

' Catalina Code

DAT ' code segment

#ifndef NO_EXIT
' Catalina Export _exit

 long ' align long

C__exit
#ifdef NO_REBOOT
 jmp #JMPA
 long @C__exit
#else
 mov r0,#$80
 clkset r0
#endif
#endif

' Catalina Export _sys_plugin

C__sys_plugin
 jmp #SYSP
 jmp #RETN

#ifndef NO_ARGS

' Catalina Export arg_setup

'
' C_arg_setup : setup argc in r3 and argv in r2
'
C_arg_setup
 jmp #LODL                 ' point to argc address
 long @C_argc_locn
#ifdef LARGE
 jmp #RLNG
#elseifdef SMALL
 jmp #RLNG
#else
 rdlong BC,RI
#endif 
 rdword r3,BC              ' load argc
 add BC,#2
 rdword r2,BC              ' load argv
 jmp #RETN                 ' done
' end

#endif

' Catalina Init

DAT ' initalized data segment

#ifndef NO_ARGS

C_argc_locn
 long $7E6C                ' must match value in Catalina_Common.spin

#endif


