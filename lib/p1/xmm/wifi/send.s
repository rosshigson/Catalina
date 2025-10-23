' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export wifi_SEND

 alignl ' align long
C_wifi_S_E_N_D_ ' <symbol:wifi_SEND>
 jmp #NEWF
 sub SP, #264
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
 long @C_wifi_S_E_N_D__2 ' NEI4
 mov r0, #16 ' reg <- coni
 jmp #JMPA
 long @C_wifi_S_E_N_D__1 ' JUMPV addrg
C_wifi_S_E_N_D__2
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_wifi_S_E_N_D__4_L000005
 mov r4, RI ' reg ARG ADDRG
 mov r5, FP
 sub r5, #-(-264) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_isprintf
 add SP, #12 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-264) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_wifi_S_end_C_ommand_W_ith_D_ata
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_wifi_S_E_N_D__6 ' NEI4
 mov r2, FP
 sub r2, #-(-268) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_R_ead_C_ode ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_wifi_S_E_N_D__6
 mov r0, r17 ' CVI, CVU or LOAD
C_wifi_S_E_N_D__1
 jmp #POPM ' restore registers
 add SP, #264 ' framesize
 jmp #RETF


' Catalina Import wifi_Read_Code

' Catalina Import wifi_Send_Command_With_Data

' Catalina Import wifi_init

' Catalina Import isprintf

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_wifi_S_E_N_D__4_L000005 ' <symbol:4>
 byte 83
 byte 69
 byte 78
 byte 68
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
