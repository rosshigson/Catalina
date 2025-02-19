' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export wifi_CLOSE

 alignl ' align long
C_wifi_C_L_O_S_E_ ' <symbol:wifi_CLOSE>
 jmp #NEWF
 sub SP, #264
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_wifi_init
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_wifi_C_L_O_S_E__2 ' NEI4
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_C_L_O_S_E__1 ' JUMPV addrg
C_wifi_C_L_O_S_E__2
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_wifi_C_L_O_S_E__4_L000005
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
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_wifi_C_L_O_S_E__6 ' NEI4
 mov r2, FP
 sub r2, #-(-268) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_R_ead_C_ode ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_wifi_C_L_O_S_E__6
 mov r0, r21 ' CVI, CVU or LOAD
C_wifi_C_L_O_S_E__1
 jmp #POPM ' restore registers
 add SP, #264 ' framesize
 jmp #RETF


' Catalina Import wifi_Read_Code

' Catalina Import wifi_Send_Command

' Catalina Import isprintf

' Catalina Import wifi_init

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_wifi_C_L_O_S_E__4_L000005 ' <symbol:4>
 byte 67
 byte 76
 byte 79
 byte 83
 byte 69
 byte 58
 byte 37
 byte 117
 byte 0

' Catalina Code

DAT ' code segment
' end
