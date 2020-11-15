' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_clear

 long ' align long
C_g_clear ' <symbol:g_clear>
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_g_flush ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__db_setcommand
 add SP, #4 ' CALL addrg
' C_g_clear_1 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Import _db_setcommand

' Catalina Import g_flush
' end
