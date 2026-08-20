' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_textmode

 alignl ' align long
C_g_textmode ' <symbol:g_textmode>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, FP
 sub r15, #-(-20) ' reg <- addrli
 wrlong r23, ##@C_G__V_A_R_+8 ' ASGNI4 addrg reg
 wrlong r23, ##@C_G__V_A_R_+12 ' ASGNI4 addrg reg
 wrlong r19, ##@C_G__V_A_R_+16 ' ASGNI4 addrg reg
 wrlong r17, ##@C_G__V_A_R_+20 ' ASGNI4 addrg reg
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
 calld PA,#CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_textmode_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Import _setcommand

' Catalina Import G_VAR
' end
