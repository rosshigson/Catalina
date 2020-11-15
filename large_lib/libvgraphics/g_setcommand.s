'#line 1 "g_setcommand.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





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
 jmp #LODI
 long @C__vgi_cog
 mov r3, RI
 jmp #SYSP
 jmp #RETN
' end    C__setcommand

