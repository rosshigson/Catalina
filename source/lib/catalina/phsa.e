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

' Catalina Export _phsa

 alignl ' align long

C__phsa
#ifdef P2
 ERROR: "phsa not implemented on the P2"
#else
 mov r0, PHSA
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, PHSA
 mov PHSA, r2
#endif
 PRIMITIVE(#RETN)
' end

