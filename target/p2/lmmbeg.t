CON

' the following file contains common #defines:

#include "define.inc"

' the following file contains common constants:

#include <constant.inc>

#ifdef QUICKBUILD

' Include the LMM layout information ...

#include "reserve.inc"

CON

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

DEBUG_OVERLAY     = $5a
lockbits          = $1ea 
DEBUG_VECTORS     = $1eb
Register_Services = $24c

#if defined(libthreads)
TRY_KERNEL_LOCK = $371
REL_KERNEL_LOCK = $378
TRY_POOL_LOCK   = $37d
REL_POOL_LOCK   = $384
ticks           = $1e6
flags           = $1e7
TP              = $1e8
lock            = $1e9
LMM_force       = $144
#endif

#endif

#ifndef QUICKBUILD

' NOT a Quick Build

' Include the appropriate LMM Kernel ...

#if defined(ALTERNATE)
#error : ALTERNATE KERNEL NOT YET SUPPORTED IN LMM MODE
#elif defined(libthreads)
#include "lmmt.t"
#else
#include "lmm.t"
#endif  

#include "reserve.inc"

#ifdef BLACKBOX
#include "blackcat.inc"
#endif

 orgh

 alignl ' align long

DAT

 org $200

' Pre-C initialization. This code is loaded and executed from the LUT RAM by
' all static kernels, and must fit in the area $200 - $2FF.
'
' After initialization, this space is available as general LUT RAM ...

LUT_STARTUP

#include "c_init.inc"

#ifndef NO_PLUGINS
#include "plugsup.inc"
#endif

#if !defined(NO_ARGS) || !defined(NO_ENV)
#include "argument.inc"
#endif

#ifdef libthreads
#include "thread.inc"
#endif

LUT_STARTUP_END

 fit $300

' Common Kernel library functions. This code is loaded and started by all
' kernels (static and dynamic) and must fit in the area $300 - $3FF ...

 orgf $300

LUT_LIBRARY

' include any necessary kernel library functions. This code is loaded and
' executed from the LUT RAM ...

#include "klib.inc"

#include "lmmklib.inc"

#ifdef libthreads
#include "thlib.inc"
#endif

LUT_LIBRARY_END

 fit $400

 orgh

#endif

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

' Catalina Init

#ifndef NO_EXIT

DAT ' initialized data segment

 alignl ' align long

#ifndef NO_DELAY_ON_EXIT
C__exit_1 long @CLKFREQ
#endif

#endif

' Catalina Code

DAT ' code segment

' Catalina Export _sys_plugin

 alignl ' align long

C__sys_plugin
 jmp #SYSP
 jmp #RETN

#ifdef DEBUG_LED

#include "debugled.inc"

#endif

' Catalina Import main

