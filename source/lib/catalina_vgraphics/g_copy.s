' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_copy

 alignl ' align long
C_g_copy ' <symbol:g_copy>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_g_flush ' CALL addrg
 cmps r23,  #0 wz
 if_z jmp #\C_g_copy_4 ' EQI4
 mov r22, ##@C_G__V_A_R_+140 ' reg <- addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #3 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__db_setcommand
 add SP, #4 ' CALL addrg
C_g_copy_4
' C_g_copy_3 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _db_setcommand

' Catalina Import g_flush

' Catalina Import G_VAR
' end
