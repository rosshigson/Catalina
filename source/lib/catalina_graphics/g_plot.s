' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_plot

 alignl ' align long
C_g_plot ' <symbol:g_plot>
 PRIMITIVE(#PSHM)
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, ##@C_G__V_A_R_+84 ' reg <- addrg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #4 ' ADDP4 coni
 wrlong r23, r22 ' ASGNI4 reg reg
 wrlong r21, r19 ' ASGNI4 reg reg
 mov r22, ##@C_G__V_A_R_+84 ' reg <- addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #4 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_plot_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _setcommand

' Catalina Import G_VAR
' end
