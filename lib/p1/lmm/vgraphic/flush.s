' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_flush

 alignl ' align long
C_g_flush ' <symbol:g_flush>
 jmp #NEWF
 mov r2, #0 ' reg ARG coni
 mov r3, #14 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_flush_1 ' (symbol refcount = 0)
 jmp #RETF


' Catalina Import _setcommand
' end
