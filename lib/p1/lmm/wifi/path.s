' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export wifi_PATH

 alignl ' align long
C_wifi_P_A_T_H_ ' <symbol:wifi_PATH>
 jmp #NEWF
 sub SP, #260
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_wifi_init
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_wifi_P_A_T_H__2 ' NEI4
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_P_A_T_H__1 ' JUMPV addrg
C_wifi_P_A_T_H__2
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_wifi_P_A_T_H__4_L000005
 mov r3, RI ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-264) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_isprintf
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-264) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_S_end_C_ommand ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_wifi_P_A_T_H__6 ' NEI4
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_wifi_R_ead_V_alue
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_wifi_P_A_T_H__6
 mov r0, r19 ' CVI, CVU or LOAD
C_wifi_P_A_T_H__1
 jmp #POPM ' restore registers
 add SP, #260 ' framesize
 jmp #RETF


' Catalina Import wifi_Read_Value

' Catalina Import wifi_Send_Command

' Catalina Import isprintf

' Catalina Import wifi_init

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_wifi_P_A_T_H__4_L000005 ' <symbol:4>
 byte 80
 byte 65
 byte 84
 byte 72
 byte 58
 byte 37
 byte 117
 byte 0

' Catalina Code

DAT ' code segment
' end
