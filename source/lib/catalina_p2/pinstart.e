
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

' Catalina Export _pinstart

 alignl ' align long

 ' r2 = yval
 ' r3 = xval
 ' r4 = mode
 ' r5 = pins
C__pinstart
 dirl  r5
 wrpin r4, r5
 wxpin r3, r5
 wypin r2, r5
 dirh  r5
 PRIMITIVE(#RETN)
' end


