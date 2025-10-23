' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export wifi_REPLY

 alignl ' align long
C_wifi_R_E_P_L_Y_ ' <symbol:wifi_REPLY>
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
 long @C_wifi_R_E_P_L_Y__2 ' NEI4
 mov r0, #16 ' reg <- coni
 jmp #JMPA
 long @C_wifi_R_E_P_L_Y__1 ' JUMPV addrg
C_wifi_R_E_P_L_Y__2
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 sub SP, #16 ' stack space for reg ARGs
 jmp #LODL
 long @C_wifi_R_E_P_L_Y__4_L000005
 jmp #PSHL ' stack ARG ADDRG
 mov RI, FP
 sub RI, #-(-264)
 jmp #PSHL ' stack ARG ADDRLi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_isprintf
 add SP, #20 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-264) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_wifi_S_end_C_ommand_W_ith_D_ata
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BRNZ
 long @C_wifi_R_E_P_L_Y__6 ' NEI4
 mov r2, FP
 sub r2, #-(-268) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_R_ead_C_ode ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_wifi_R_E_P_L_Y__6
 mov r0, r15 ' CVI, CVU or LOAD
C_wifi_R_E_P_L_Y__1
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
C_wifi_R_E_P_L_Y__4_L000005 ' <symbol:4>
 byte 82
 byte 69
 byte 80
 byte 76
 byte 89
 byte 58
 byte 37
 byte 100
 byte 44
 byte 37
 byte 100
 byte 44
 byte 37
 byte 100
 byte 44
 byte 37
 byte 100
 byte 0

' Catalina Code

DAT ' code segment
' end
