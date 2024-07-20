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


