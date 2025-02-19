' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wifi_REPLY

 alignl ' align long
C_wifi_R_E_P_L_Y_ ' <symbol:wifi_REPLY>
 alignl ' align long
 long I32_NEWF + 264<<S32
 alignl ' align long
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_wifi_init)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_wifi_R_E_P_L_Y__2)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_wifi_R_E_P_L_Y__1)<<S32 ' JUMPV addrg
 alignl ' align long
C_wifi_R_E_P_L_Y__2
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_LODA + (@C_wifi_R_E_P_L_Y__4_L000005)<<S32
 word I16B_PSHL ' stack ARG ADDRG
 alignl ' align long
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16B_PSHL ' stack ARG ADDRL
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_isprintf)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_wifi_S_end_C_ommand_W_ith_D_ata)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_wifi_R_E_P_L_Y__6)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODF + ((-268)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_wifi_R_ead_C_ode)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_wifi_R_E_P_L_Y__6
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_wifi_R_E_P_L_Y__1
 word I16B_POPM + 66<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import wifi_Read_Code

' Catalina Import wifi_Send_Command_With_Data

' Catalina Import isprintf

' Catalina Import wifi_init

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
