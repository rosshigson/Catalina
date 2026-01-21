' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wifi_SEND_DATA

 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A_ ' <symbol:wifi_SEND_DATA>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $eaaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_wifi_init
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_wifi_S_E_N_D__D_A_T_A__2 ' NEI4
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_S_E_N_D__D_A_T_A__1 ' JUMPV addrg
C_wifi_S_E_N_D__D_A_T_A__2
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 cmps r19, r22 wcz
 jmp #BR_A
 long @C_wifi_S_E_N_D__D_A_T_A__4 ' GTI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_wifi_R_E_P_L_Y_
 add SP, #16 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_wifi_S_E_N_D__D_A_T_A__5 ' JUMPV addrg
C_wifi_S_E_N_D__D_A_T_A__4
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 cmps r19, r22 wcz
 jmp #BRBE
 long @C_wifi_S_E_N_D__D_A_T_A__6 ' LEI4
 jmp #LODL
 long 512
 mov r11, RI ' reg <- con
 mov r15, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_wifi_S_E_N_D__D_A_T_A__7 ' JUMPV addrg
C_wifi_S_E_N_D__D_A_T_A__6
 mov r11, r19 ' CVI, CVU or LOAD
 mov r15, #0 ' reg <- coni
C_wifi_S_E_N_D__D_A_T_A__7
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_wifi_R_E_P_L_Y_
 add SP, #16 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 mov r9, r22 ' CVI, CVU or LOAD
 subs r15, r22 ' SUBI/P (1)
 jmp #JMPA
 long @C_wifi_S_E_N_D__D_A_T_A__9 ' JUMPV addrg
C_wifi_S_E_N_D__D_A_T_A__8
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 cmps r15, r22 wcz
 jmp #BRBE
 long @C_wifi_S_E_N_D__D_A_T_A__11 ' LEI4
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 subs r15, r22 ' SUBI/P (1)
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_wifi_S_E_N_D__D_A_T_A__12 ' JUMPV addrg
C_wifi_S_E_N_D__D_A_T_A__11
 mov r11, r15 ' CVI, CVU or LOAD
 mov r15, #0 ' reg <- coni
C_wifi_S_E_N_D__D_A_T_A__12
 mov r2, r9 ' ADDI/P
 adds r2, r17 ' ADDI/P (3)
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_wifi_S_E_N_D_
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r13,  #0 wz
 jmp #BRNZ
 long @C_wifi_S_E_N_D__D_A_T_A__13 ' NEI4
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_R_ead_C_ode ' CALL addrg
C_wifi_S_E_N_D__D_A_T_A__13
 adds r9, r11 ' ADDI/P (1)
C_wifi_S_E_N_D__D_A_T_A__9
 mov r22, #0 ' reg <- coni
 cmps r13, r22 wz
 jmp #BRNZ
 long @C_wifi_S_E_N_D__D_A_T_A__15 ' NEI4
 cmps r15, r22 wcz
 jmp #BR_A
 long @C_wifi_S_E_N_D__D_A_T_A__8 ' GTI4
C_wifi_S_E_N_D__D_A_T_A__15
C_wifi_S_E_N_D__D_A_T_A__5
 mov r0, r13 ' CVI, CVU or LOAD
C_wifi_S_E_N_D__D_A_T_A__1
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import wifi_Read_Code

' Catalina Import wifi_init

' Catalina Import wifi_REPLY

' Catalina Import wifi_SEND
' end
