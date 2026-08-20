' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_plot

 alignl ' align long
C_g_plot ' <symbol:g_plot>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
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
 mov r3, #4 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_plot_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


' Catalina Import _setcommand
' end
