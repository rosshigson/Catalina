' The use of PRIMITIVE allows the library source files to be (mostly) 
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.
#ifndef PRIMITIVE
#ifdef P2
#ifdef NATIVE
#define PRIMITIVE(op) calld PA, op
#else
#define PRIMITIVE(op) jmp op
#endif
#else
#define PRIMITIVE(op) jmp op
#endif
#endif

'
' LMM PASM implementations of fundamental multi-threading operations
'
' int _thread_ticks(void * block, int ticks);
'    set tick count (takes effect on next context switch):
' on entry:
'    r3 = thread id
'    r2 = tick count (1 tick = ~100 microseconds)
' on exit:
'    r0 = thread id (Z clear) on success
'    r0 = 0 and Z flag set on error
'
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Import _unlocked_check

' Catalina Export _thread_ticks

 alignl ' align long

C__thread_ticks
 PRIMITIVE(#CALA)
 long @C__thread_stall
 mov r4, r3
 PRIMITIVE(#CALA)
 long @C__unlocked_check ' check thread id is valid
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:thr_ticks_done ' if not return with result zero (and Z set)
#else
 PRIMITIVE(#BR_Z)
 long @:thr_ticks_done  ' if not return with result zero (and Z set)
#endif
 mov RI, r3
 add RI, #THREAD_AFF_OFF*4+2
 mov BC, r2
#ifdef LARGE
 PRIMITIVE(#WWRD)
#else
 wrword BC, RI
#endif
 mov r0, r3 wz          ' if ok, return thread block (and Z clr)
:thr_ticks_done
 PRIMITIVE(#CALA)
 long @C__thread_allow
 PRIMITIVE(#RETN)
' end
