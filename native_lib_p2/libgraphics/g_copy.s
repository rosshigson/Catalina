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
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_g_copy_4  ' NEU4
 mov r22, ##@C_G__V_A_R_+8
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r23, r22 ' CVI, CVU or LOAD
 mov r22, ##@C__display_base
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_z jmp #\C_g_copy_7 ' EQU4
 mov r2, #0 ' reg ARG coni
 mov r3, #15 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__setcommand
 add SP, #4 ' CALL addrg
 mov r2, ##@C_G__V_A_R_+12
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r22, ##@C__display_base
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_g_memmove
 add SP, #8 ' CALL addrg
C_g_copy_7
C_g_copy_4
' C_g_copy_3 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import g_memmove

' Catalina Import _setcommand

' Catalina Import _display_base

' Catalina Import G_VAR
' end
