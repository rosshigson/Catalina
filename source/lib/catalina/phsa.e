
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

