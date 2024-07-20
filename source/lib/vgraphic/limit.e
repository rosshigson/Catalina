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

'
' implement g_limit
'

' Catalina Code

DAT ' code segment

' Catalina Export g_limit

 alignl ' align long

C_g_limit
 mov r0, r4
#ifdef P2
 cmps r0, r2 wcz
#else
 cmps r0, r2 wc,wz
#endif
 if_a mov r0, r2
#ifdef P2
 cmps r0, r3 wcz
#else
 cmps r0, r3 wc,wz
#endif
 if_b mov r0, r3
 PRIMITIVE(#RETN)
' end
