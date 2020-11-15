
#ifndef P2
' Until we modify the P1 compilation process to include calling spinpp, 
' we must explicitly define this here and preprocess all the library 
' files to create different libraries for the P1 and the P2. This allows 
' us to keep the library source files (mostly) identical for the P1 and P2.
#ifndef PRIMITIVE
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


