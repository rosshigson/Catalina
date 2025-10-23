' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export wifi_LISTEN

 alignl ' align long
C_wifi_L_I_S_T_E_N_ ' <symbol:wifi_LISTEN>
 jmp #NEWF
 sub SP, #260
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_wifi_init
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_wifi_L_I_S_T_E_N__2 ' NEI4
 mov r0, #16 ' reg <- coni
 jmp #JMPA
 long @C_wifi_L_I_S_T_E_N__1 ' JUMPV addrg
C_wifi_L_I_S_T_E_N__2
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #247 wz
 jmp #BRNZ
 long @C_wifi_L_I_S_T_E_N__4 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_wifi_L_I_S_T_E_N__6_L000007
 mov r3, RI ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-264) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_isprintf
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_wifi_L_I_S_T_E_N__5 ' JUMPV addrg
C_wifi_L_I_S_T_E_N__4
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #246 wz
 jmp #BRNZ
 long @C_wifi_L_I_S_T_E_N__8 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_wifi_L_I_S_T_E_N__10_L000011
 mov r3, RI ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-264) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_isprintf
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_wifi_L_I_S_T_E_N__9 ' JUMPV addrg
C_wifi_L_I_S_T_E_N__8
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #245 wz
 jmp #BRNZ
 long @C_wifi_L_I_S_T_E_N__12 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_wifi_L_I_S_T_E_N__14_L000015
 mov r3, RI ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-264) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_isprintf
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_wifi_L_I_S_T_E_N__13 ' JUMPV addrg
C_wifi_L_I_S_T_E_N__12
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVUI
 and r3, cviu_m1 ' zero extend
 jmp #LODL
 long @C_wifi_L_I_S_T_E_N__16_L000017
 mov r4, RI ' reg ARG ADDRG
 mov r5, FP
 sub r5, #-(-264) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_isprintf
 add SP, #12 ' CALL addrg
C_wifi_L_I_S_T_E_N__13
C_wifi_L_I_S_T_E_N__9
C_wifi_L_I_S_T_E_N__5
 mov r2, FP
 sub r2, #-(-264) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_S_end_C_ommand ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_wifi_L_I_S_T_E_N__18 ' NEI4
 jmp #LODL
 long 1000
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_wifi_R_ead_I_d
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_wifi_L_I_S_T_E_N__1 ' JUMPV addrg
C_wifi_L_I_S_T_E_N__18
 mov r0, #16 ' reg <- coni
C_wifi_L_I_S_T_E_N__1
 jmp #POPM ' restore registers
 add SP, #260 ' framesize
 jmp #RETF


' Catalina Import wifi_Read_Id

' Catalina Import wifi_Send_Command

' Catalina Import wifi_init

' Catalina Import isprintf

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_wifi_L_I_S_T_E_N__16_L000017 ' <symbol:16>
 byte 76
 byte 73
 byte 83
 byte 84
 byte 69
 byte 78
 byte 58
 byte 37
 byte 99
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_wifi_L_I_S_T_E_N__14_L000015 ' <symbol:14>
 byte 76
 byte 73
 byte 83
 byte 84
 byte 69
 byte 78
 byte 58
 byte 84
 byte 67
 byte 80
 byte 44
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_wifi_L_I_S_T_E_N__10_L000011 ' <symbol:10>
 byte 76
 byte 73
 byte 83
 byte 84
 byte 69
 byte 78
 byte 58
 byte 87
 byte 83
 byte 44
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_wifi_L_I_S_T_E_N__6_L000007 ' <symbol:6>
 byte 76
 byte 73
 byte 83
 byte 84
 byte 69
 byte 78
 byte 58
 byte 72
 byte 84
 byte 84
 byte 80
 byte 44
 byte 37
 byte 115
 byte 0

' Catalina Code

DAT ' code segment
' end
