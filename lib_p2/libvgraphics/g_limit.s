'#line 1 "g_limit.e"











'
' implement g_limit
'

' Catalina Code

DAT ' code segment

' Catalina Export g_limit

 alignl ' align long

C_g_limit
 mov r0, r4

 cmps r0, r2 wcz



 if_a mov r0, r2

 cmps r0, r3 wcz



 if_b mov r0, r3
 PRIMITIVE(#RETN)
' end
