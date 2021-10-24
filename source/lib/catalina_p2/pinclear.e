
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

' Catalina Export _pinclear

 alignl ' align long

 ' r2 = pins
C__pinclear
#ifndef NO_INTERRUPTS
 stalli
#endif
 dirl  r2
 wrpin r2, #0
#ifndef NO_INTERRUPTS
 allowi
#endif
 PRIMITIVE(#RETN)
' end


