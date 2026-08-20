' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_copy

 alignl ' align long
C_g_copy ' <symbol:g_copy>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, FP
 sub r21, #-(-36) ' reg <- addrli
 mov r22, ##@C_G__V_A_R_+32
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #17 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_copy_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Import _setcommand

' Catalina Import G_VAR
' end
