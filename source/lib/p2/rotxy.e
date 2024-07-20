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

' Catalina Code

DAT ' code segment

' Catalina Export _rotxy

 alignl ' align long

C__rotxy
 ' r2 = t
 ' r3 = addr of coord (x)
 ' r4 = addr of result struct (x)
#ifndef NO_INTERRUPTS
 stalli
#endif
 rdlong r0, r3
 add r3,#4
 rdlong r1, r3
#ifdef NATIVE
 setq r1
 qrotate r0, r2
#else
 mov RI, #2
 PRIMITIVE(#SPEC)
#endif
 getqx r0
 getqy r1
 wrlong r0, r4
 add r4, #4
 wrlong r1, r4
#ifndef NO_INTERRUPTS
 allowi
#endif
 PRIMITIVE(#RETN)
' end


