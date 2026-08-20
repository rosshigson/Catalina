' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_textmode

 alignl ' align long
C_g_textmode ' <symbol:g_textmode>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, FP
 sub r15, #-(-20) ' reg <- addrli
 jmp #LODL
 long @C_G__V_A_R_+8
 wrlong r23, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_G__V_A_R_+12
 wrlong r23, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_G__V_A_R_+16
 wrlong r19, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_G__V_A_R_+20
 wrlong r17, RI ' ASGNI4 addrg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 wrlong r23, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 wrlong r17, r15 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #13 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_textmode_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import _setcommand

' Catalina Import G_VAR
' end
