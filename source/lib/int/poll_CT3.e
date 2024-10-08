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

' Catalina Export _poll_CT3

 alignl ' align long

C__poll_C_T_3
   POLLCT3 wc
 if_c mov r0, #1
 if_nc mov r0, #0
   PRIMITIVE(#RETN)
' end

