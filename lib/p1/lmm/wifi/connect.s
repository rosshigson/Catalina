' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export wifi_CONNECT

 alignl ' align long
C_wifi_C_O_N_N_E_C_T_ ' <symbol:wifi_CONNECT>
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
 long @C_wifi_C_O_N_N_E_C_T__2 ' NEI4
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_C_O_N_N_E_C_T__1 ' JUMPV addrg
C_wifi_C_O_N_N_E_C_T__2
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_wifi_C_O_N_N_E_C_T__4_L000005
 mov r4, RI ' reg ARG ADDRG
 mov r5, FP
 sub r5, #-(-264) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_isprintf
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-264) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_S_end_C_ommand ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_wifi_C_O_N_N_E_C_T__6 ' NEI4
 jmp #LODL
 long 1000000
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
 long @C_wifi_C_O_N_N_E_C_T__1 ' JUMPV addrg
C_wifi_C_O_N_N_E_C_T__6
 mov r0, #16 ' RET coni
C_wifi_C_O_N_N_E_C_T__1
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
C_wifi_C_O_N_N_E_C_T__4_L000005 ' <symbol:4>
 byte 67
 byte 79
 byte 78
 byte 78
 byte 69
 byte 67
 byte 84
 byte 58
 byte 37
 byte 115
 byte 44
 byte 37
 byte 117
 byte 0

' Catalina Code

DAT ' code segment
' end
