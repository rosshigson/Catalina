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


