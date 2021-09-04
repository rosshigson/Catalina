
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

' Catalina Export _muldiv64

 alignl ' align long

 ' r4 = mult1
 ' r3 = mult2
 ' r2 = divisor
C__muldiv64
#ifndef NO_INTERRUPTS
 stalli
#endif
 qmul r3, r4 ' mult1 * mult2
 getqx r0 ' get lower 32 bits of product
 getqy r1 ' get upper 32 bits of product
#ifdef NATIVE
 setq  r1 ' set upper 32 bits of product
 qdiv  r0, r2 ' divide product by divisor
#else
 mov RI, #4
 PRIMITIVE(#SPEC)
#endif
 getqx r0 ' get quotient of division
#ifndef NO_INTERRUPTS
 allowi
#endif
 PRIMITIVE(#RETN)
' end


