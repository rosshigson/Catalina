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
' LMM PASM implementations of affinity multi-threading operations
'
' void * _thread_affinity();
'    return affinity of a thread 
' on entry:
'    r2 = thread id
' on exit:
'    r0 = thread affinity
'
' Catalina Code

DAT ' code segment

' Catalina Export _thread_affinity

 alignl ' align long

C__thread_affinity
 mov RI, r2             ' return ...
 add RI, #THREAD_AFF_OFF*4    
#ifdef LARGE
 PRIMITIVE(#RLNG)
#else
 rdlong BC, RI          ' ... current affinity
#endif
 mov r0, BC
 PRIMITIVE(#RETN)
' end
