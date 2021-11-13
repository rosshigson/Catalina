'#line 1 "g_sar.e"











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
