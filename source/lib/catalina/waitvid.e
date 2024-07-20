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

' Catalina Export _waitvid

 alignl ' align long

C__waitvid
#ifdef P2
 ERROR: "waitvid not implemented on the P2"
#else
 waitvid r3, r2
#endif
 PRIMITIVE(#RETN)
' end

