' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_color

 alignl ' align long
C_g_color ' <symbol:g_color>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, FP
 sub r21, #-(-36) ' reg <- addrli
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #4 ' ADDP4 coni
 mov r20, r23
 and r20, #3 ' BANDI4 coni
 shl r20, #2 ' LSHI4 coni
 jmp #LODL
 long @C_G__V_A_R_+36
 mov r18, RI ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #2 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_color_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


' Catalina Import _setcommand

' Catalina Import G_VAR
' end
