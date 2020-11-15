
#ifndef P2
' Until we modify the P1 compilation process to include calling spinpp, 
' we must explicitly define this here and preprocess all the library 
' files to create different libraries for the P1 and the P2. This allows 
' us to keep the library source files (mostly) identical for the P1 and P2.
#ifndef PRIMITIVE
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
 cmps r0, r2 wc,wz
 if_a mov r0, r2
 cmps r0, r3 wc,wz
 if_b mov r0, r3
 PRIMITIVE(#RETN)
' end
