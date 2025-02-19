' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wifi_SET

 alignl ' align long
C_wifi_S_E_T_ ' <symbol:wifi_SET>
 calld PA,#NEWF
 sub SP, #264
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C_wifi_init
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_nz jmp #\C_wifi_S_E_T__2 ' NEI4
 mov r0, #16 ' reg <- coni
 jmp #\@C_wifi_S_E_T__1 ' JUMPV addrg
C_wifi_S_E_T__2
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, ##@C_wifi_S_E_T__4_L000005 ' reg ARG ADDRG
 mov r5, FP
 sub r5, #-(-264) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_isprintf
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-264) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_wifi_S_end_C_ommand ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz
 if_nz jmp #\C_wifi_S_E_T__6 ' NEI4
 mov r2, FP
 sub r2, #-(-268) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_wifi_R_ead_C_ode ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_wifi_S_E_T__6
 mov r0, r19 ' CVI, CVU or LOAD
C_wifi_S_E_T__1
 calld PA,#POPM ' restore registers
 add SP, #264 ' framesize
 calld PA,#RETF


' Catalina Import wifi_Read_Code

' Catalina Import wifi_Send_Command

' Catalina Import isprintf

' Catalina Import wifi_init

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_wifi_S_E_T__4_L000005 ' <symbol:4>
 byte 83
 byte 69
 byte 84
 byte 58
 byte 37
 byte 115
 byte 44
 byte 37
 byte 115
 byte 0

' Catalina Code

DAT ' code segment
' end
