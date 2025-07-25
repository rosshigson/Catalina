' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wifi_JOIN

 alignl_label
C_wifi_J_O_I_N_ ' <symbol:wifi_JOIN>
 alignl_p1
 long I32_NEWF + 264<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_wifi_init)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_J_O_I_N__2)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_J_O_I_N__1)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_J_O_I_N__2
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_wifi_J_O_I_N__4_L000005 ' reg ARG ADDRG
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_isprintf)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_S_end_C_ommand)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_J_O_I_N__6)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_R_ead_C_ode)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_wifi_J_O_I_N__6
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_wifi_J_O_I_N__1
 word I16B_POPM + 66<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import wifi_Read_Code

' Catalina Import wifi_Send_Command

' Catalina Import isprintf

' Catalina Import wifi_init

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_wifi_J_O_I_N__4_L000005 ' <symbol:4>
 byte 74
 byte 79
 byte 73
 byte 78
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
