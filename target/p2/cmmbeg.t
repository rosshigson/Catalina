CON

' the following file contains common #defines:

#include "define.inc"

' the following file contains common constants:

#include <constant.inc>

#if defined(QUICKBUILD) || defined(QUICKFORCE)

#define DEFINE_COMPACT_CONSTANTS
#include <compact.inc>

CON

#if defined(libthreads)
' NOTE: These have to match the compiled threaded Compact kernel ...
t1       = $27
t2       = $28
t3       = $29
t4       = $2a
t5       = $2b
t6       = $2c
req      = $55
ticks    = $1e4
flags    = $1e5
TP       = $1e6
lock     = $1e7
TRY_KERNEL_LOCK = $3a3
REL_KERNEL_LOCK = $3aa
TRY_POOL_LOCK   = $3af
REL_POOL_LOCK   = $3b6
CMM_force       = $393
#endif

DEBUG_OVERLAY = $56
lockbits      = $1ea
DEBUG_VECTORS = $1eb


' Include the CMM layout information ...

#include "reserve.inc"

#endif

#if !defined(QUICKBUILD) && !defined(QUICKFORCE)

' NOT a Quick Build

' Include the appropriate CMM Kernel ...

#if defined(ALTERNATE)
#error : ALTERNATE KERNEL NOT SUPPORTED ON PROPELLER 2
#elif defined(libthreads)
#include "cmmt.t"
#else
#include "cmm.t"
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

#include "cmmklib.inc"

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
 long I32_JMPA + (@C__exit)<<S32
#else
#ifndef NO_DELAY_ON_EXIT
 long I32_LODI + (@C__exit_1)<<S32
 word I16A_MOV + r0<<D16A + RI<<S16A
 word I16A_SHRI + r0<<D16A + 6<<S16A
 word I16B_EXEC
 alignl ' align long
 waitx r0
#else
 word I16B_EXEC
 alignl ' align long
#endif
 hubset ##(1<<28) 
#endif

#endif

' Catalina Init

#ifndef NO_EXIT

DAT ' initialized data segment

#ifndef NO_DELAY_ON_EXIT
C__exit_1 long @CLKFREQ
#endif

#endif

' Catalina Code

DAT ' code segment

' Catalina Export _sys_plugin

 alignl ' align long

C__sys_plugin
 word I16B_SYSP
 word I16B_RETN
' end

 alignl ' align long

#ifndef NO_ARGS

' Catalina Export arg_setup

'
' C_arg_setup : This function must exist because it is invoked by the CMM code 
'               generator, but on the P2 arguments are set up by the code in
'               "argument.inc". This function will be inlined (i.e. 
'               effectively removed) by the optimizer
'
 alignl ' align long
C_arg_setup
 word I16B_RETN             ' done
 alignl ' align long
' end

#endif

#ifdef DEBUG_LED

#include "debugled.inc"

#endif  

' Catalina Import main
      
