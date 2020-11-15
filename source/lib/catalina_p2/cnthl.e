
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

' Catalina Export _cnthl

 alignl ' align long

C__cnthl
#ifdef NATIVE
 getct r1 wc
 getct r0
#else
 mov RI, #3
 PRIMITIVE(#SPEC)
#endif
 wrlong r0, r2
 add r2, #4
 wrlong r1, r2
 PRIMITIVE(#RETN)
' end


