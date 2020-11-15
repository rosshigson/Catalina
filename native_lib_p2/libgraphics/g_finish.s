' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_finish

 alignl ' align long
C_g_finish ' <symbol:g_finish>
 mov r2, #0 ' reg ARG coni
 mov r3, #15 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_finish_1 ' (symbol refcount = 0)
 PRIMITIVE(#RETN)


' Catalina Import _setcommand
' end
