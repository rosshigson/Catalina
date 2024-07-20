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
' int _thread_set_extended(void * block, void *extended);
'    set extended attribute (assumed to be a pointer):
' on entry:
'    r3 = thread id
'    r2 = extended attribute
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

' Catalina Export _thread_set_extended

 alignl ' align long

C__thread_set_extended
 PRIMITIVE(#CALA)
 long @C__thread_stall
 mov r4, r3
 PRIMITIVE(#CALA)
 long @C__unlocked_check ' check thread id is valid
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:thr_extended_done ' if not return with result zero (and Z set)
#else
 PRIMITIVE(#BR_Z)
 long @:thr_extended_done  ' if not return with result zero (and Z set)
#endif
 mov RI, r3
 add RI, #THREAD_EXT_OFF*4
 mov BC, r2
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI
#endif
 mov r0, r3 wz          ' if ok, return thread block (and Z clr)
:thr_extended_done
 PRIMITIVE(#CALA)
 long @C__thread_allow
 PRIMITIVE(#RETN)
' end
