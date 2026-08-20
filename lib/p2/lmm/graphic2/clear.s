' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_clear

 alignl ' align long
C_g_clear ' <symbol:g_clear>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, FP
 sub r23, #-(-36) ' reg <- addrli
 jmp #LODI
 long @C_G__V_A_R_+32
 mov r22, RI ' reg <- INDIRP4 addrg
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #16 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_clear_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


' Catalina Import _setcommand

' Catalina Import G_VAR
' end
