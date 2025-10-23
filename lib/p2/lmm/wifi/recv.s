' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wifi_RECV

 alignl ' align long
C_wifi_R_E_C_V_ ' <symbol:wifi_RECV>
 jmp #NEWF
 sub SP, #264
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_wifi_init
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_wifi_R_E_C_V__2 ' NEI4
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_R_E_C_V__1 ' JUMPV addrg
C_wifi_R_E_C_V__2
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_wifi_R_E_C_V__4_L000005
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
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BRNZ
 long @C_wifi_R_E_C_V__6 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, FP
 sub r5, #-(-268) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_wifi_R_ead_R_esponse_D_ata
 add SP, #12 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_wifi_R_E_C_V__6
 mov r0, r15 ' CVI, CVU or LOAD
C_wifi_R_E_C_V__1
 jmp #POPM ' restore registers
 add SP, #264 ' framesize
 jmp #RETF


' Catalina Import wifi_Read_Response_Data

' Catalina Import wifi_Send_Command

' Catalina Import wifi_init

' Catalina Import isprintf

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_wifi_R_E_C_V__4_L000005 ' <symbol:4>
 byte 82
 byte 69
 byte 67
 byte 86
 byte 58
 byte 37
 byte 100
 byte 44
 byte 37
 byte 100
 byte 0

' Catalina Code

DAT ' code segment
' end
