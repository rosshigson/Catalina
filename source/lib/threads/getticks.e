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
' int _thread_get_ticks(void * block);
'    return current tick count :
' on entry:
'    r2 = thread id
' on exit:
'    r0 = current tick count (zero if thread id invalid)
'
'
' Catalina Code

DAT ' code segment

' Catalina Import _unlocked_check

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Export _thread_get_ticks

 alignl ' align long

C__thread_get_ticks
 PRIMITIVE(#CALA)
 long @C__thread_stall
 mov r4, r2
 PRIMITIVE(#CALA)
 long @C__unlocked_check ' check thread id is valid
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:thr_get_ticks_done ' if not return with result zero (and Z set)
#else
 PRIMITIVE(#BR_Z)
 long @:thr_get_ticks_done  ' if not return with result zero (and Z set)
#endif
 mov RI, r2
 add RI, #THREAD_AFF_OFF*4+2
#ifdef LARGE
 PRIMITIVE(#RWRD)
 mov r0,BC
#else
 rdword r0, RI
#endif
:thr_get_ticks_done
 PRIMITIVE(#CALA)
 long @C__thread_allow
 PRIMITIVE(#RETN)
' end
