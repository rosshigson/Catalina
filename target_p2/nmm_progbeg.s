CON

' the following file contains common #defines:

#include "Catalina_defines.inc"

' the following file contains common constants:

#include <Catalina_constants.inc>

' Include the appropriate NMM Kernel ...

#if defined(ALTERNATE)
#error : Alternate Kernel not yet supported in NMM mode
#elif defined(libthreads)
#include "Catalina_NMM_threaded.spin2"
#else
#include "Catalina_NMM.spin2"
#endif  

#include "Catalina_reserved.inc"

DAT

'------------------------------------------------------------------------------
 orgh

 alignl ' align long

DAT

 org $200

' Pre-C initialization. This code is loaded and executed from the LUT RAM by
' all static kernels, and must fit in the area $200 - $2FF.

' After initialization, this space is available as general LUT RAM ...

LUT_STARTUP

_C_init
 hubset  #$F0          
 hubset  ##_CLOCKINIT 
 waitx   ##_CLOCKWAIT
 mov     r0,##_CLOCKFREQ
 wrlong  r0,#$14
 mov     r0,##_CLOCKMODE
 wrlong  r0,#$18
 hubset  r0
#ifndef NO_PLUGINS
 call    #INITIALIZE_REGISTRY
#ifndef NO_ARGS
 call    #INITIALIZE_ARGUMENTS
#endif
 call    #INITIALIZE_PLUGINS
#endif
#ifndef NO_ARGS
 rdlong  r3, ##ARGC_ADDR    ' load argc
 rdlong  r2, ##ARGV_ADDR    ' load argv
#endif
#ifdef BLACKBOX
 call    #INITIALIZE_BLACKCAT
#endif

' <<<INSERT INITIAL PASM HERE (if any - must fit in LUT RAM) >>>

 rdlong  SP, ##FREE_MEM     ' set up initial stack pointer

#ifdef libthreads
 call    #INITIALIZE_THREAD ' must be done after we set up SP!
#endif

 jmp     #C_main            ' start executing NMM C code

#ifndef NO_PLUGINS
#include "Catalina_plugins.inc"
#endif

#ifndef NO_ARGS
#include "Catalina_arguments.inc"
#endif

#ifdef libthreads
#include "Catalina_threading.inc"
#endif

#ifdef BLACKBOX
#include "Catalina_blackcat.inc"
#endif

LUT_STARTUP_END

 fit $300

' Common Kernel library functions. This code is loaded and started by all
' kernels (static and dynamic) and must fit in the area $300 - $3FF ...

 orgf $300

LUT_LIBRARY

' include any necessary kernel library functions. This code is loaded and
' executed from the LUT RAM ...

#include "Catalina_kernel_library.inc"

#include "Catalina_NMM_kernel_library.inc"

#ifdef libthreads
#include "Catalina_thread_library.inc"
#endif

LUT_LIBRARY_END

 fit $400

 orgh

'------------------------------------------------------------------------------

#ifdef DEBUG_LED

#include "debug_led.inc"

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

' Catalina Export _sys_plugin

 alignl ' align long

C__sys_plugin
 PRIMITIVE(#SYSP)
 PRIMITIVE(#RETN)

' Catalina Import main


