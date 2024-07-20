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

' Catalina Export _waitcnt

 alignl ' align long

C__waitcnt
#ifdef P2
 mov r0, #0
 addct1 r0, r2
 waitct1 
#else
 waitcnt r2, #0
#endif
 PRIMITIVE(#RETN)
' end

