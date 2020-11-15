
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
' implement g_sar
'

' Catalina Code

DAT ' code segment

' Catalina Export g_sar

 alignl ' align long

C_g_sar
 mov r0, r3
 sar r0, r2
 PRIMITIVE(#RETN)
' end
