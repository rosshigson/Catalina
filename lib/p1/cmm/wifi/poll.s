' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001 ' <symbol:wifi_Poll_Response>
 alignl_p1
 long I32_NEWF + 264<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl32 reg
 alignl_p1
 long I32_JMPA + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_4)<<S32 ' JUMPV addrg
 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_3
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((1000)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_timed_rx)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_6)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (15)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_2)<<S32 ' JUMPV addrg
 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_6
 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_4
 alignl_p1
 long I32_MOVI + RI<<D32 + (254)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_3)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_9)<<S32 ' JUMPV addrg
 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_8
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((1000)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_timed_rx)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_11)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (15)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_2)<<S32 ' JUMPV addrg
 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_11
 word I16A_CMPSI + (r17)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_13)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_14)<<S32 ' JUMPV addrg
 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_13
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_17_L000018 ' reg ARG ADDRG
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_isscanf)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_15)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (69)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_19)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_JMPA + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_2)<<S32 ' JUMPV addrg
 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_19
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r5)<<D16B
 alignl_p1
 long @C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_23_L000024 ' reg ARG ADDRG
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16B_PSHL ' stack ARG ADDRL
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_isscanf)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_21)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_2)<<S32 ' JUMPV addrg
 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_21
 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_15
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_2)<<S32 ' JUMPV addrg
 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_14
 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_9
 alignl_p1
 long I32_MOVI + RI<<D32 + (256)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_8)<<S32 ' LTI4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_2
 word I16B_POPM + 66<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export wifi_POLL

 alignl_label
C_wifi_P_O_L_L_ ' <symbol:wifi_POLL>
 alignl_p1
 long I32_NEWF + 260<<S32
 alignl_p1
 long I32_PSHM + $eaa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_wifi_init)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_P_O_L_L__26)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_P_O_L_L__25)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_P_O_L_L__26
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_P_O_L_L__28)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_wifi_P_O_L_L__30_L000031 ' reg ARG ADDRG
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcpy)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_wifi_P_O_L_L__29)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_P_O_L_L__28
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_wifi_P_O_L_L__32_L000033 ' reg ARG ADDRG
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_isprintf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_wifi_P_O_L_L__29
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_S_end_C_ommand)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_P_O_L_L__34)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_P_O_L_L__36)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r13)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (78)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_wifi_P_O_L_L__41)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (80)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_wifi_P_O_L_L__41)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (83)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_wifi_P_O_L_L__41)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (83)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_wifi_P_O_L_L__43)<<S32 ' GTI4 reg coni
' C_wifi_P_O_L_L__42 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (68)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_wifi_P_O_L_L__41)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (71)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_wifi_P_O_L_L__41)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_wifi_P_O_L_L__38)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_P_O_L_L__43
 alignl_p1
 long I32_MOVI + RI<<D32 + (87)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_wifi_P_O_L_L__41)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_wifi_P_O_L_L__41)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_wifi_P_O_L_L__38)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_P_O_L_L__41
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_P_O_L_L__25)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_P_O_L_L__38
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_P_O_L_L__25)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_P_O_L_L__36
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(69)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r22)<<D16A + (r21)<<S16A ' ASGNU1 reg reg
 word I16A_WRLONG + (r15)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_P_O_L_L__25)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_P_O_L_L__34
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_label
C_wifi_P_O_L_L__25
 word I16B_POPM + 65<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import wifi_Send_Command

' Catalina Import wifi_timed_rx

' Catalina Import wifi_init

' Catalina Import isprintf

' Catalina Import isscanf

' Catalina Import strcpy

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_wifi_P_O_L_L__32_L000033 ' <symbol:32>
 byte 80
 byte 79
 byte 76
 byte 76
 byte 58
 byte 37
 byte 100
 byte 0

 alignl_label
C_wifi_P_O_L_L__30_L000031 ' <symbol:30>
 byte 80
 byte 79
 byte 76
 byte 76
 byte 0

 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_23_L000024 ' <symbol:23>
 byte 61
 byte 37
 byte 99
 byte 44
 byte 37
 byte 117
 byte 44
 byte 37
 byte 117
 byte 0

 alignl_label
C_s63g_68f738d0_wifi_P_oll_R_esponse_L000001_17_L000018 ' <symbol:17>
 byte 61
 byte 37
 byte 99
 byte 44
 byte 37
 byte 117
 byte 0

' Catalina Code

DAT ' code segment
' end
