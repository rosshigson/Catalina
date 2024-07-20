' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_text

 alignl ' align long
C_g_text ' <symbol:g_text>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_G__V_A_R_+96
 mov r17, RI ' reg <- addrg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long @C_G__V_A_R_+96+16
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_G__V_A_R_+96+12
 mov r3, RI ' reg ARG ADDRG
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_g_justify
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_G__V_A_R_+96
 mov r22, RI ' reg <- addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #11 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_text_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _setcommand

' Catalina Import g_justify

' Catalina Import G_VAR
' end
