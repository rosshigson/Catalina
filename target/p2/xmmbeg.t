CON

' the following file contains common #defines:

#include "define.inc"

' the following file contains common constants:

#include <constant.inc>

DAT

' Include the XMM layout information ...

#include "reserve.inc"

#ifdef SMALL

' For the small address model, we just pad the prologue out to $200
' (+ $10 for historical reasons to do with the P1 file layout)

Catalina_Prologue_Pad
        byte $00[@RESERVED + $200 + $10 - @Catalina_Prologue_Pad]

#endif

#ifdef LARGE

' For the large address model, we force the code segment to start at the
' XMM_BASE_ADDRESS (which is typically the size of Hub RAM) plus $200 to 
' allow space for the prologue.
' We fill the unused space with zeroes - it will be removed from the image
' later (to save space).

Catalina_Prologue_Pad
        byte $00[XMM_BASE_ADDRESS + $200 - @Catalina_Prologue_Pad]

#endif



' Catalina Cnst

 DAT ' cnst segment

#ifdef SMALL

#include <presbrk.inc>

#endif

' Catalina Code

 DAT ' cnst segment

CON

' The following must match xmm.t and xmmd.t:

INIT    = $00
SPEC    = $01
LODL    = $02
LODI    = $03
LODF    = $04
PSHL    = $05
PSHB    = $06
CPYB    = $07
NEWF    = $08
RETF    = $09
CALA    = $0a
RETN    = $0b
CALI    = $0c
JMPA    = $0d
JMPI    = $0e
DIVS    = $0f
DIVU    = $10
MULT    = $11
BR_Z    = $12
BRNZ    = $13
BRAE    = $14
BR_A    = $15
BRBE    = $16
BR_B    = $17
SYSP    = $18
PSHA    = $19
FADD    = $1a
FSUB    = $1b
FMUL    = $1c
FDIV    = $1d
FCMP    = $1e
FLIN    = $1f
INFL    = $20
PSHM    = $21
POPM    = $22
PSHF    = $23
RLNG    = $24
RWRD    = $25
RBYT    = $26
WLNG    = $27
WWRD    = $28
WBYT    = $29

PC      = $2b
SP      = $2c
FP      = $2d
RI      = $2e
BC      = $2f

CS      = $32

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
r20     = $47
r21     = $48
r22     = $49
r23     = $4a

Bit31   = $4b
all_1s  = $4c
cviu_m1 = $4d
cviu_m2 = $4e
top8    = $4f
low24   = $50

lockbits = $1ea 

DAT 

' Catalina Init

DAT ' initalized data segment

' Catalina Export errno

 alignl ' align long

C_errno long 0

' Catalina Code

DAT ' code segment

#ifndef NO_EXIT
' Catalina Export _exit

 alignl ' align long

C__exit
#ifdef NO_REBOOT
 jmp #JMPA
 long @C__exit
#else
#ifndef NO_DELAY_ON_EXIT
 jmp #LODI
 long @C__exit_1
 shr RI,#6
 waitx RI
#endif
 mov r0,#1
 shl r0,#28
 hubset r0
#endif
#endif
' end

' Catalina Init

DAT ' initialized data segment

#ifndef NO_DELAY_ON_EXIT
C__exit_1 long @CLKFREQ
#endif

' Catalina Code

DAT ' code segment

' Catalina Export _sys_plugin

 alignl ' align long

C__sys_plugin
 jmp #SYSP
 jmp #RETN
' end

#ifndef NO_ARGS

' Catalina Export arg_setup

'
' C_arg_setup : This function must exist because it is invoked by the XMM code 
'               generator, but on the P2 arguments are set up by the code in
'               "argument.inc". This function will be inlined (i.e. 
'               effectively removed) by the optimizer
'

' Catalina Export arg_setup

 alignl ' align long

C_arg_setup
 jmp #RETN                        ' done

' end

#endif  

#ifdef DEBUG_LED

#include "debugled.inc"

#endif

#ifdef SMALL

#ifdef VGA

' we need to include these in SMALL XMM programs to make the compile work,
' because we have included the pre_sbrk portions in the compilation since 
' they need to be included in what we copy to hub RAM.

#if !(defined(NO_KEYBOARD) && defined(NO_MOUSE))
#include <cogkbma.t>
#endif
#if (!defined(NO_KEYBOARD) && !defined(NO_MOUSE))
#include <cogkbmb.t>

#endif

#endif

#endif

' Catalina Import main

