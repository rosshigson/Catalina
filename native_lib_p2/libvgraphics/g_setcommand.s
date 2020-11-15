'#line 1 "g_setcommand.e"











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

