' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export wifi_init

 alignl_label
C_wifi_init ' <symbol:wifi_init>
 long 0

' Catalina Export wifi_pin_di

 alignl_label
C_wifi_pin_di ' <symbol:wifi_pin_di>
 long -1

' Catalina Export wifi_pin_do

 alignl_label
C_wifi_pin_do ' <symbol:wifi_pin_do>
 long -1

' Catalina Export wifi_pin_res

 alignl_label
C_wifi_pin_res ' <symbol:wifi_pin_res>
 long -1

' Catalina Export wifi_pin_pgm

 alignl_label
C_wifi_pin_pgm ' <symbol:wifi_pin_pgm>
 long -1

' Catalina Export wifi_pin_brk

 alignl_label
C_wifi_pin_brk ' <symbol:wifi_pin_brk>
 long -1

' Catalina Export wifi_Send_Command

' Catalina Code

DAT ' code segment

 alignl_label
C_wifi_S_end_C_ommand ' <symbol:wifi_Send_Command>
 alignl_p1
 long I32_NEWF + 260<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 alignl_p1
 long I32_MOVI + RI<<D32 + (256)<<S32
 word I16A_CMP + (r0)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRBE + (@C_wifi_S_end_C_ommand_2)<<S32 ' LEU4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_S_end_C_ommand_1)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_S_end_C_ommand_2
 word I16A_MOVI + (r2)<<D16A + (13)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r4)<<D32 + (254)<<S32 ' reg ARG coni
 word I16B_LODL + (r5)<<D16B
 alignl_p1
 long @C_wifi_S_end_C_ommand_4_L000005 ' reg ARG ADDRG
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16B_PSHL ' stack ARG ADDRL
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_isprintf)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s_str)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s_txflush)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_wifi_S_end_C_ommand_1
 word I16B_POPM + 65<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export wifi_Send_Command_With_Data

 alignl_label
C_wifi_S_end_C_ommand_W_ith_D_ata ' <symbol:wifi_Send_Command_With_Data>
 alignl_p1
 long I32_NEWF + 260<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 alignl_p1
 long I32_MOVI + RI<<D32 + (256)<<S32
 word I16A_CMP + (r0)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRBE + (@C_wifi_S_end_C_ommand_W_ith_D_ata_7)<<S32 ' LEU4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_S_end_C_ommand_W_ith_D_ata_6)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_S_end_C_ommand_W_ith_D_ata_7
 word I16A_MOVI + (r2)<<D16A + (13)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r4)<<D32 + (254)<<S32 ' reg ARG coni
 word I16B_LODL + (r5)<<D16B
 alignl_p1
 long @C_wifi_S_end_C_ommand_4_L000005 ' reg ARG ADDRG
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16B_PSHL ' stack ARG ADDRL
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_isprintf)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s_str)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_wifi_S_end_C_ommand_W_ith_D_ata_12)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_S_end_C_ommand_W_ith_D_ata_9
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s_tx)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (30)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_S_end_C_ommand_W_ith_D_ata_13)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s_txflush)<<S32 ' CALL addrg
 alignl_label
C_wifi_S_end_C_ommand_W_ith_D_ata_13
' C_wifi_S_end_C_ommand_W_ith_D_ata_10 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_wifi_S_end_C_ommand_W_ith_D_ata_12
 word I16A_CMPS + (r17)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_S_end_C_ommand_W_ith_D_ata_9)<<S32 ' LTI4 reg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s_txflush)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_wifi_S_end_C_ommand_W_ith_D_ata_6
 word I16B_POPM + 65<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export wifi_timed_rx

 alignl_label
C_wifi_timed_rx ' <symbol:wifi_timed_rx>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_wifi_timed_rx_17)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_timed_rx_16
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPS + (r22)<<D16A + (r23)<<S16A
 alignl_p1
 long I32_BRBE + (@C_wifi_timed_rx_19)<<S32 ' LEI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_wifi_timed_rx_15)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_timed_rx_19
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_label
C_wifi_timed_rx_17
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s_rxcount)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_wifi_timed_rx_16)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s_rx)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_label
C_wifi_timed_rx_15
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export wifi_Read_Value

 alignl_label
C_wifi_R_ead_V_alue ' <symbol:wifi_Read_Value>
 alignl_p1
 long I32_NEWF + 268<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODF + ((-272)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl32 reg
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_V_alue_23)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_V_alue_22
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((1000)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_timed_rx)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_wifi_R_ead_V_alue_25)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (15)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_V_alue_21)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_V_alue_25
 alignl_label
C_wifi_R_ead_V_alue_23
 alignl_p1
 long I32_MOVI + RI<<D32 + (254)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_V_alue_22)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_V_alue_28)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_V_alue_27
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((1000)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_timed_rx)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_wifi_R_ead_V_alue_30)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (15)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_V_alue_21)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_V_alue_30
 word I16A_CMPSI + (r19)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_wifi_R_ead_V_alue_32)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_V_alue_33)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_V_alue_32
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_CMPSI + (r17)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_R_ead_V_alue_34)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_wifi_R_ead_V_alue_36_L000037 ' reg ARG ADDRG
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_isscanf)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl32
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (83)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_V_alue_38)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_V_alue_21)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_V_alue_38
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl32
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (69)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_V_alue_40)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODF + ((-272)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_wifi_R_ead_V_alue_45_L000046 ' reg ARG ADDRG
 alignl_p1
 long I32_LODF + ((-261)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_isscanf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_V_alue_42)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODF + ((-272)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_CMPI + (r22)<<D16A + (14)<<S16A
 alignl_p1
 long I32_BR_A + (@C_wifi_R_ead_V_alue_42)<<S32 ' GTU4 reg coni
 alignl_p1
 long I32_LODF + ((-272)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_V_alue_21)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_V_alue_42
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_V_alue_21)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_V_alue_40
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_V_alue_21)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_V_alue_34
 alignl_label
C_wifi_R_ead_V_alue_33
 alignl_label
C_wifi_R_ead_V_alue_28
 word I16A_CMPS + (r17)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_R_ead_V_alue_27)<<S32 ' LTI4 reg reg
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_label
C_wifi_R_ead_V_alue_21
 word I16B_POPM + 67<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export wifi_Read_Code

 alignl_label
C_wifi_R_ead_C_ode ' <symbol:wifi_Read_Code>
 alignl_p1
 long I32_NEWF + 264<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_C_ode_49)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_C_ode_48
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((1000)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_timed_rx)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_wifi_R_ead_C_ode_51)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (15)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_C_ode_47)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_C_ode_51
 alignl_label
C_wifi_R_ead_C_ode_49
 alignl_p1
 long I32_MOVI + RI<<D32 + (254)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_C_ode_48)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_C_ode_54)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_C_ode_53
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((1000)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_timed_rx)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_wifi_R_ead_C_ode_56)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (15)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_C_ode_47)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_C_ode_56
 word I16A_CMPSI + (r21)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_wifi_R_ead_C_ode_58)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_C_ode_59)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_C_ode_58
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_CMPSI + (r19)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_R_ead_C_ode_60)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_wifi_R_ead_C_ode_62_L000063 ' reg ARG ADDRG
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_isscanf)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl32
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (83)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_C_ode_64)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_C_ode_64)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_C_ode_47)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_C_ode_64
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl32
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (69)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_C_ode_66)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_C_ode_66)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (14)<<S16A
 alignl_p1
 long I32_BR_A + (@C_wifi_R_ead_C_ode_68)<<S32 ' GTI4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_C_ode_47)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_C_ode_68
 alignl_label
C_wifi_R_ead_C_ode_66
 alignl_label
C_wifi_R_ead_C_ode_60
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_C_ode_47)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_C_ode_59
 alignl_label
C_wifi_R_ead_C_ode_54
 alignl_p1
 long I32_MOVI + RI<<D32 + (256)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_R_ead_C_ode_53)<<S32 ' LTI4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_label
C_wifi_R_ead_C_ode_47
 word I16B_POPM + 66<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export wifi_Read_Id

 alignl_label
C_wifi_R_ead_I_d ' <symbol:wifi_Read_Id>
 alignl_p1
 long I32_NEWF + 268<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODF + ((-272)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl32 reg
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_I_d_72)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_I_d_71
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_timed_rx)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_wifi_R_ead_I_d_74)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (15)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_I_d_70)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_I_d_74
 alignl_label
C_wifi_R_ead_I_d_72
 alignl_p1
 long I32_MOVI + RI<<D32 + (254)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_I_d_71)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_I_d_77)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_I_d_76
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((1000)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_timed_rx)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_wifi_R_ead_I_d_79)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (15)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_I_d_70)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_I_d_79
 word I16A_CMPSI + (r19)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_wifi_R_ead_I_d_81)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_I_d_82)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_I_d_81
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_CMPSI + (r17)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_R_ead_I_d_83)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODF + ((-272)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_wifi_R_ead_C_ode_62_L000063 ' reg ARG ADDRG
 alignl_p1
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_isscanf)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl32
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (83)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_I_d_85)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_I_d_85)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODF + ((-272)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_I_d_70)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_I_d_85
 alignl_p1
 long I32_LODF + ((-268)&$FFFFFF)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl32
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (69)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_I_d_87)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_R_ead_I_d_87)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODF + ((-272)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_CMPI + (r22)<<D16A + (14)<<S16A
 alignl_p1
 long I32_BR_A + (@C_wifi_R_ead_I_d_89)<<S32 ' GTU4 reg coni
 alignl_p1
 long I32_LODF + ((-272)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODF + ((-272)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_I_d_70)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_I_d_89
 alignl_label
C_wifi_R_ead_I_d_87
 alignl_label
C_wifi_R_ead_I_d_83
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_R_ead_I_d_70)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_R_ead_I_d_82
 alignl_label
C_wifi_R_ead_I_d_77
 alignl_p1
 long I32_MOVI + RI<<D32 + (256)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_R_ead_I_d_76)<<S32 ' LTI4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_label
C_wifi_R_ead_I_d_70
 word I16B_POPM + 67<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export wifi_DO_PIN

 alignl_label
C_wifi_D_O__P_I_N_ ' <symbol:wifi_DO_PIN>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
' loading argument C_wifi_D_O__P_I_N__92_L000093 to PASM eliminated
'START PASM ... 
 word I16B_PASM
 alignl

'... END PASM
' call to PASM eliminated
' loading argument C_wifi_D_O__P_I_N__94_L000095 to PASM eliminated
'START PASM ... 
 mov r0, #(_WIFI_DO & $1FF)

'... END PASM
' call to PASM eliminated
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_wifi_D_O__P_I_N__91 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export wifi_DI_PIN

 alignl_label
C_wifi_D_I__P_I_N_ ' <symbol:wifi_DI_PIN>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
' loading argument C_wifi_D_O__P_I_N__92_L000093 to PASM eliminated
'START PASM ... 
 word I16B_PASM
 alignl

'... END PASM
' call to PASM eliminated
' loading argument C_wifi_D_I__P_I_N__97_L000098 to PASM eliminated
'START PASM ... 
 mov r0, #(_WIFI_DI & $1FF)

'... END PASM
' call to PASM eliminated
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_wifi_D_I__P_I_N__96 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export wifi_PGM_PIN

 alignl_label
C_wifi_P_G_M__P_I_N_ ' <symbol:wifi_PGM_PIN>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
' loading argument C_wifi_D_O__P_I_N__92_L000093 to PASM eliminated
'START PASM ... 
 word I16B_PASM
 alignl

'... END PASM
' call to PASM eliminated
' loading argument C_wifi_P_G_M__P_I_N__100_L000101 to PASM eliminated
'START PASM ... 
 mov r0, #(_WIFI_PGM & $1FF)

'... END PASM
' call to PASM eliminated
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_wifi_P_G_M__P_I_N__99 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export wifi_RES_PIN

 alignl_label
C_wifi_R_E_S__P_I_N_ ' <symbol:wifi_RES_PIN>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
' loading argument C_wifi_D_O__P_I_N__92_L000093 to PASM eliminated
'START PASM ... 
 word I16B_PASM
 alignl

'... END PASM
' call to PASM eliminated
' loading argument C_wifi_R_E_S__P_I_N__103_L000104 to PASM eliminated
'START PASM ... 
 mov r0, #(_WIFI_RES & $1FF)

'... END PASM
' call to PASM eliminated
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_wifi_R_E_S__P_I_N__102 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export wifi_BRK_PIN

 alignl_label
C_wifi_B_R_K__P_I_N_ ' <symbol:wifi_BRK_PIN>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
' loading argument C_wifi_D_O__P_I_N__92_L000093 to PASM eliminated
'START PASM ... 
 word I16B_PASM
 alignl

'... END PASM
' call to PASM eliminated
' loading argument C_wifi_B_R_K__P_I_N__106_L000107 to PASM eliminated
'START PASM ... 
 mov r0, #(_WIFI_BRK & $1FF)

'... END PASM
' call to PASM eliminated
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_wifi_B_R_K__P_I_N__105 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export drvlow

 alignl_label
C_drvlow ' <symbol:drvlow>
' loading argument C_drvlow_109_L000110 to PASM eliminated
'START PASM ... 
 word I16B_PASM
 alignl
'... END PASM
' call to PASM eliminated
' loading argument C_drvlow_111_L000112 to PASM eliminated
'START PASM ... 
 drvl r2

'... END PASM
' call to PASM eliminated
' C_drvlow_108 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

' Catalina Export drvhigh

 alignl_label
C_drvhigh ' <symbol:drvhigh>
' loading argument C_drvlow_109_L000110 to PASM eliminated
'START PASM ... 
 word I16B_PASM
 alignl
'... END PASM
' call to PASM eliminated
' loading argument C_drvhigh_114_L000115 to PASM eliminated
'START PASM ... 
 drvh r2

'... END PASM
' call to PASM eliminated
' C_drvhigh_113 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

' Catalina Export input

 alignl_label
C_input ' <symbol:input>
' loading argument C_drvlow_109_L000110 to PASM eliminated
'START PASM ... 
 word I16B_PASM
 alignl
'... END PASM
' call to PASM eliminated
' loading argument C_input_117_L000118 to PASM eliminated
'START PASM ... 
 dirl r2

'... END PASM
' call to PASM eliminated
' C_input_116 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

' Catalina Export output

 alignl_label
C_output ' <symbol:output>
' loading argument C_drvlow_109_L000110 to PASM eliminated
'START PASM ... 
 word I16B_PASM
 alignl
'... END PASM
' call to PASM eliminated
' loading argument C_output_120_L000121 to PASM eliminated
'START PASM ... 
 dirh r2

'... END PASM
' call to PASM eliminated
' C_output_119 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

' Catalina Export wifi_BREAK

 alignl_label
C_wifi_B_R_E_A_K_ ' <symbol:wifi_BREAK>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_wifi_pin_brk)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_B_R_E_A_K__123)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (63)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_wifi_B_R_E_A_K__123)<<S32 ' GTI4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (100)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_wifi_pin_brk)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_drvlow)<<S32 ' CALL addrg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (200)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_wifi_pin_brk)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_input)<<S32 ' CALL addrg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (100)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_label
C_wifi_B_R_E_A_K__123
' C_wifi_B_R_E_A_K__122 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export wifi_RESET

 alignl_label
C_wifi_R_E_S_E_T_ ' <symbol:wifi_RESET>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_wifi_pin_res)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_R_E_S_E_T__126)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (63)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_wifi_R_E_S_E_T__126)<<S32 ' GTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_wifi_pin_res)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_drvlow)<<S32 ' CALL addrg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (200)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_wifi_pin_res)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_drvhigh)<<S32 ' CALL addrg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (500)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_label
C_wifi_R_E_S_E_T__126
' C_wifi_R_E_S_E_T__125 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export wifi_PGM

 alignl_label
C_wifi_P_G_M_ ' <symbol:wifi_PGM>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_wifi_pin_pgm)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_P_G_M__129)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (63)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_wifi_P_G_M__129)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_wifi_P_G_M__131
 alignl_p1
 long I32_LODI + (@C_wifi_pin_pgm)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_drvlow)<<S32 ' CALL addrg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (100)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_wifi_pin_pgm)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_drvhigh)<<S32 ' CALL addrg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (100)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
' C_wifi_P_G_M__132 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_B + (@C_wifi_P_G_M__131)<<S32 ' LTI4 reg coni
 alignl_label
C_wifi_P_G_M__129
' C_wifi_P_G_M__128 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export wifi_OK

 alignl_label
C_wifi_O_K_ ' <symbol:wifi_OK>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_wifi_init)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_O_K__136)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_O_K__135)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_O_K__136
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_wifi_O_K__138_L000139 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_S_end_C_ommand)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_O_K__140)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_R_ead_C_ode)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_wifi_O_K__140
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_wifi_O_K__135
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export wifi_INIT

 alignl_label
C_wifi_I_N_I_T_ ' <symbol:wifi_INIT>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_wifi_init)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_I_N_I_T__143)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODA + (@C_wifi_pin_di)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_LODA + (@C_wifi_pin_do)<<S32
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_LODA + (@C_wifi_pin_brk)<<S32
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_wifi_pin_res ' reg <- addrg
 alignl_p1
 long I32_LODA + (@C_wifi_pin_res)<<S32
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_LODA + (@C_wifi_pin_pgm)<<S32
 word I16A_WRLONG + (r17)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_R_E_S_E_T_)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_wifi_pin_pgm)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_wifi_P_G_M_)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s_rxflush)<<S32 ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_wifi_init)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_CALA + (@C_wifi_O_K_)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wifi_I_N_I_T__145)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wifi_I_N_I_T__142)<<S32 ' JUMPV addrg
 alignl_label
C_wifi_I_N_I_T__145
 alignl_label
C_wifi_I_N_I_T__143
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_wifi_init)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_label
C_wifi_I_N_I_T__142
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export wifi_AUTO

 alignl_label
C_wifi_A_U_T_O_ ' <symbol:wifi_AUTO>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $554000<<S32 ' save registers
 alignl_p1
 long I32_CALA + (@C_wifi_D_I__P_I_N_)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_wifi_D_O__P_I_N_)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_wifi_B_R_K__P_I_N_)<<S32 ' CALL addrg
 word I16A_MOV + (r18)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_wifi_R_E_S__P_I_N_)<<S32 ' CALL addrg
 word I16A_MOV + (r16)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_wifi_P_G_M__P_I_N_)<<S32 ' CALL addrg
 word I16A_MOV + (r14)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r14)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r16)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r18)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_wifi_I_N_I_T_)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_wifi_A_U_T_O__147 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import isprintf

' Catalina Import isscanf

' Catalina Import s_str

' Catalina Import s_txflush

' Catalina Import s_tx

' Catalina Import s_rx

' Catalina Import s_rxcount

' Catalina Import s_rxflush

' Catalina Import strlen

' Catalina Import _waitms

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_wifi_O_K__138_L000139 ' <symbol:138>
 byte 0

 alignl_label
C_wifi_R_ead_C_ode_62_L000063 ' <symbol:62>
 byte 61
 byte 37
 byte 99
 byte 44
 byte 37
 byte 117
 byte 0

 alignl_label
C_wifi_R_ead_V_alue_45_L000046 ' <symbol:45>
 byte 37
 byte 117
 byte 0

 alignl_label
C_wifi_R_ead_V_alue_36_L000037 ' <symbol:36>
 byte 61
 byte 37
 byte 99
 byte 44
 byte 37
 byte 115
 byte 0

 alignl_label
C_wifi_S_end_C_ommand_4_L000005 ' <symbol:4>
 byte 37
 byte 99
 byte 37
 byte 115
 byte 37
 byte 99
 byte 0

' Catalina Code

DAT ' code segment
' end
