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


