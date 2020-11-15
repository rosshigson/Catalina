
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
' Call the graphics plugin
' on entry:
'   r2 = parameter
'   r3 = command
'

' Catalina Import _vgi_cog

' Catalina Code

DAT ' code segment

' Catalina Export _setcommand

 alignl ' align long

C__setcommand
 shl r3, #16
 or  r2, r3
 PRIMITIVE(#LODI)
 long @C__vgi_cog
 mov r3, RI
 PRIMITIVE(#SYSP)
 PRIMITIVE(#RETN)
' end    C__setcommand

