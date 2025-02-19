' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wifi_CLOSE

 alignl ' align long
C_wifi_C_L_O_S_E_ ' <symbol:wifi_CLOSE>
 alignl ' align long
 long I32_NEWF + 264<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_wifi_init)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_wifi_C_L_O_S_E__2)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_wifi_C_L_O_S_E__1)<<S32 ' JUMPV addrg
 alignl ' align long
C_wifi_C_L_O_S_E__2
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_wifi_C_L_O_S_E__4_L000005 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_isprintf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_wifi_S_end_C_ommand)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_wifi_C_L_O_S_E__6)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODF + ((-268)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_wifi_R_ead_C_ode)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_wifi_C_L_O_S_E__6
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_wifi_C_L_O_S_E__1
 word I16B_POPM + 66<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

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
