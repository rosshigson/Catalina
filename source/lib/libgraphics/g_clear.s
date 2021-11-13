' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_clear

 alignl ' align long
C_g_clear ' <symbol:g_clear>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
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
 mov r3, #0 ' reg ARG coni
 mov r22, ##@C_G__V_A_R_+8
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_g_memset
 add SP, #8 ' CALL addrg
' C_g_clear_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import g_memset

' Catalina Import _setcommand

' Catalina Import G_VAR
' end
