CON

' the following file contains common #defines:

#include "define.inc"

' the following file contains common constants:

#include <constant.inc>

#if defined(QUICKBUILD) || defined(QUICKFORCE)

' Include the NMM layout information ...

#include "reserve.inc"

CON

' The following must match nmm.t and nmmd.t:

INIT    = $00
PSHB    = $01
CPYB    = $02
NEWF    = $03
RETF    = $04
CALA    = $05
RETN    = $06
CALI    = $07
DIVS    = $08
SYSP    = $09
FADD    = $0a
FSUB    = $0b
FMUL    = $0c
FDIV    = $0d
FCMP    = $0e
FLIN    = $0f
INFL    = $10
PSHM    = $11
POPM    = $12
PSHF    = $13

RI      = $14
BC      = $15

r0      = $16
r1      = $17
r2      = $18
r3      = $19
r4      = $1a
r5      = $1b 
r6      = $1c 
r7      = $1d 
r8      = $2e 
r9      = $2f 
r10     = $20 
r11     = $21 
r12     = $22 
r13     = $23 
r14     = $24 
r15     = $25 
r16     = $26 
r17     = $27 
r18     = $28 
r19     = $29
r20     = $2a
r21     = $2b
r22     = $2c
r23     = $2d
                             
Save_PC = $2e
Save_FP = $2f
Save_SP = $30
Save_PA = $31

Bit31   = $32
all_1s  = $33
cviu_m1 = $34
cviu_m2 = $35
top8    = $36
low24   = $37
req     = $38
reg     = $39

DEBUG_OVERLAY = $43
lockbits      = $1ea 
DEBUG_VECTORS = $1eb

SP      = $1f8
FP      = $1f9

Register_Services = $24a

#if defined(libthreads)
TRY_KERNEL_LOCK = $371
REL_KERNEL_LOCK = $378
TRY_POOL_LOCK   = $37d
REL_POOL_LOCK   = $384
ticks           = $1e7
TP              = $1e8
lock            = $1e9
NMM_force       = $f6
#endif

#endif

#if !defined(QUICKBUILD) && !defined(QUICKFORCE)

' NOT a Quick Build

' Include the appropriate NMM Kernel ...

#if defined(ALTERNATE)
#error : ALTERNATE KERNEL NOT YET SUPPORTED ON THE PROPELLER 2 
#elif defined(libthreads)
#include "nmmt.t"
#else
#include "nmm.t"
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

#include "nmmklib.inc"

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
 jmp #@C__exit
#else
#ifndef NO_DELAY_ON_EXIT
 rdlong r0,##CLKFREQ
 shr r0,#6
 waitx r0
#endif
 mov r0,#1
 shl r0,#28
 hubset r0
#endif

#endif

' Catalina Code

DAT ' code segment

' Catalina Export _sys_plugin

 alignl ' align long

C__sys_plugin
 calld PA,#SYSP
 calld PA,#RETN

#ifdef DEBUG_LED

#include "debugled.inc"

#endif

' Catalina Import main


