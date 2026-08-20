' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_line

 alignl ' align long
C_g_line ' <symbol:g_line>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, FP
 sub r19, #-(-36) ' reg <- addrli
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #4 ' ADDP4 coni
 wrlong r23, r22 ' ASGNI4 reg reg
 wrlong r21, r19 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #5 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_line_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Import _setcommand
' end
