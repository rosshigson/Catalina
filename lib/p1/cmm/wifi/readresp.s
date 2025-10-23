' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wifi_Read_Response_Data

 alignl_label
C_wifi_R_ead_R_esponse_D_ata ' <symbol:wifi_Read_Response_Data>
 alignl_p1
 long I32_NEWF + 268<<S32
 alignl_p1
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODF + ((-272)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_R_esponse_D_ata_3)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_2
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((1000)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_timed_rx)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_wifi_R_ead_R_esponse_D_ata_5)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (15)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_R_esponse_D_ata_1)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_5
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_3
 alignl_p1
 long I32_MOVI + RI<<D32 + (254)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_R_esponse_D_ata_2)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_R_esponse_D_ata_8)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_7
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((1000)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_timed_rx)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_wifi_R_ead_R_esponse_D_ata_10)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (15)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_R_esponse_D_ata_1)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_10
 word I16A_CMPSI + (r15)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_wifi_R_ead_R_esponse_D_ata_12)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r13)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_R_esponse_D_ata_13)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_12
 word I16A_CMPSI + (r13)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_R_ead_R_esponse_D_ata_14)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_wifi_R_ead_R_esponse_D_ata_16_L000017 ' reg ARG ADDRG
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_isscanf)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl32
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (83)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_R_esponse_D_ata_18)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_R_esponse_D_ata_18)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_wifi_R_ead_R_esponse_D_ata_20)<<S32 ' GTI4 reg reg
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_R_esponse_D_ata_25)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_22
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((1000)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_timed_rx)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_wifi_R_ead_R_esponse_D_ata_26)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (15)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_R_esponse_D_ata_1)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_26
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_wifi_R_ead_R_esponse_D_ata_23 ' (symbol refcount = 0)
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_25
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r11)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_R_ead_R_esponse_D_ata_22)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_R_esponse_D_ata_1)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_20
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_R_esponse_D_ata_1)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_18
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl32
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (69)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_R_esponse_D_ata_28)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_R_esponse_D_ata_28)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (14)<<S16A
 alignl_p1
 long I32_BR_A + (@C_wifi_R_ead_R_esponse_D_ata_30)<<S32 ' GTI4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_R_esponse_D_ata_1)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_30
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_28
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_14
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_R_esponse_D_ata_1)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_13
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_8
 alignl_p1
 long I32_MOVI + RI<<D32 + (256)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_R_ead_R_esponse_D_ata_7)<<S32 ' LTI4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_label
C_wifi_R_ead_R_esponse_D_ata_1
 word I16B_POPM + 67<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import wifi_timed_rx

' Catalina Import isscanf

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_wifi_R_ead_R_esponse_D_ata_16_L000017 ' <symbol:16>
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
