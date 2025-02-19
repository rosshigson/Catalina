' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export wifi_init

 alignl ' align long
C_wifi_init ' <symbol:wifi_init>
 long 0

' Catalina Export wifi_pin_di

 alignl ' align long
C_wifi_pin_di ' <symbol:wifi_pin_di>
 long -1

' Catalina Export wifi_pin_do

 alignl ' align long
C_wifi_pin_do ' <symbol:wifi_pin_do>
 long -1

' Catalina Export wifi_pin_res

 alignl ' align long
C_wifi_pin_res ' <symbol:wifi_pin_res>
 long -1

' Catalina Export wifi_pin_pgm

 alignl ' align long
C_wifi_pin_pgm ' <symbol:wifi_pin_pgm>
 long -1

' Catalina Export wifi_pin_brk

 alignl ' align long
C_wifi_pin_brk ' <symbol:wifi_pin_brk>
 long -1

' Catalina Export wifi_Send_Command

' Catalina Code

DAT ' code segment

 alignl ' align long
C_wifi_S_end_C_ommand ' <symbol:wifi_Send_Command>
 jmp #NEWF
 sub SP, #260
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 cmp r0,  #256 wcz 
 jmp #BRBE
 long @C_wifi_S_end_C_ommand_2 ' LEU4
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_S_end_C_ommand_1 ' JUMPV addrg
C_wifi_S_end_C_ommand_2
 mov r2, #13 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #254 ' reg ARG coni
 jmp #LODL
 long @C_wifi_S_end_C_ommand_4_L000005
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-264)
 jmp #PSHL ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_isprintf
 add SP, #16 ' CALL addrg
 mov r2, FP
 sub r2, #-(-264) ' reg ARG ADDRLi
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s_str
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s_txflush ' CALL addrg
 mov r0, #0 ' RET coni
C_wifi_S_end_C_ommand_1
 jmp #POPM ' restore registers
 add SP, #260 ' framesize
 jmp #RETF


' Catalina Export wifi_Send_Command_With_Data

 alignl ' align long
C_wifi_S_end_C_ommand_W_ith_D_ata ' <symbol:wifi_Send_Command_With_Data>
 jmp #NEWF
 sub SP, #260
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 cmp r0,  #256 wcz 
 jmp #BRBE
 long @C_wifi_S_end_C_ommand_W_ith_D_ata_7 ' LEU4
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_S_end_C_ommand_W_ith_D_ata_6 ' JUMPV addrg
C_wifi_S_end_C_ommand_W_ith_D_ata_7
 mov r2, #13 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #254 ' reg ARG coni
 jmp #LODL
 long @C_wifi_S_end_C_ommand_4_L000005
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-264)
 jmp #PSHL ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_isprintf
 add SP, #16 ' CALL addrg
 mov r2, FP
 sub r2, #-(-264) ' reg ARG ADDRLi
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s_str
 add SP, #4 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_wifi_S_end_C_ommand_W_ith_D_ata_12 ' JUMPV addrg
C_wifi_S_end_C_ommand_W_ith_D_ata_9
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s_tx
 add SP, #4 ' CALL addrg
 mov r22, #30 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1,  #0 wz
 jmp #BRNZ
 long @C_wifi_S_end_C_ommand_W_ith_D_ata_13 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s_txflush ' CALL addrg
C_wifi_S_end_C_ommand_W_ith_D_ata_13
' C_wifi_S_end_C_ommand_W_ith_D_ata_10 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_wifi_S_end_C_ommand_W_ith_D_ata_12
 cmps r17, r19 wcz
 jmp #BR_B
 long @C_wifi_S_end_C_ommand_W_ith_D_ata_9 ' LTI4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s_txflush ' CALL addrg
 mov r0, #0 ' RET coni
C_wifi_S_end_C_ommand_W_ith_D_ata_6
 jmp #POPM ' restore registers
 add SP, #260 ' framesize
 jmp #RETF


' Catalina Export wifi_timed_rx

 alignl ' align long
C_wifi_timed_rx ' <symbol:wifi_timed_rx>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_wifi_timed_rx_17 ' JUMPV addrg
C_wifi_timed_rx_16
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDI4 coni
 cmps r22, r23 wcz
 jmp #BRBE
 long @C_wifi_timed_rx_19 ' LEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_wifi_timed_rx_15 ' JUMPV addrg
C_wifi_timed_rx_19
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_wifi_timed_rx_17
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s_rxcount ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_wifi_timed_rx_16 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s_rx ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_wifi_timed_rx_15
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export wifi_Read_Value

 alignl ' align long
C_wifi_R_ead_V_alue ' <symbol:wifi_Read_Value>
 jmp #NEWF
 sub SP, #268
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -272
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C_wifi_R_ead_V_alue_23 ' JUMPV addrg
C_wifi_R_ead_V_alue_22
 jmp #LODL
 long 1000
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wcz
 jmp #BRAE
 long @C_wifi_R_ead_V_alue_25 ' GEI4
 mov r0, #15 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_V_alue_21 ' JUMPV addrg
C_wifi_R_ead_V_alue_25
C_wifi_R_ead_V_alue_23
 cmps r19,  #254 wz
 jmp #BRNZ
 long @C_wifi_R_ead_V_alue_22 ' NEI4
 jmp #JMPA
 long @C_wifi_R_ead_V_alue_28 ' JUMPV addrg
C_wifi_R_ead_V_alue_27
 jmp #LODL
 long 1000
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wcz
 jmp #BRAE
 long @C_wifi_R_ead_V_alue_30 ' GEI4
 mov r0, #15 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_V_alue_21 ' JUMPV addrg
C_wifi_R_ead_V_alue_30
 cmps r19,  #13 wz
 jmp #BR_Z
 long @C_wifi_R_ead_V_alue_32 ' EQI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-264) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, r19 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_wifi_R_ead_V_alue_33 ' JUMPV addrg
C_wifi_R_ead_V_alue_32
 mov r22, FP
 sub r22, #-(-264) ' reg <- addrli
 adds r22, r17 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r17,  #3 wcz
 jmp #BR_B
 long @C_wifi_R_ead_V_alue_34 ' LTI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-268) ' reg ARG ADDRLi
 jmp #LODL
 long @C_wifi_R_ead_V_alue_36_L000037
 mov r4, RI ' reg ARG ADDRG
 mov r5, FP
 sub r5, #-(-264) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_isscanf
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #83 wz
 jmp #BRNZ
 long @C_wifi_R_ead_V_alue_38 ' NEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_V_alue_21 ' JUMPV addrg
C_wifi_R_ead_V_alue_38
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BRNZ
 long @C_wifi_R_ead_V_alue_40 ' NEI4
 mov r2, FP
 sub r2, #-(-272) ' reg ARG ADDRLi
 jmp #LODL
 long @C_wifi_R_ead_V_alue_45_L000046
 mov r3, RI ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-261) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_isscanf
 add SP, #8 ' CALL addrg
 cmps r0,  #1 wz
 jmp #BRNZ
 long @C_wifi_R_ead_V_alue_42 ' NEI4
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #14 wcz 
 jmp #BR_A
 long @C_wifi_R_ead_V_alue_42 ' GTU4
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_wifi_R_ead_V_alue_21 ' JUMPV addrg
C_wifi_R_ead_V_alue_42
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_V_alue_21 ' JUMPV addrg
C_wifi_R_ead_V_alue_40
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_V_alue_21 ' JUMPV addrg
C_wifi_R_ead_V_alue_34
C_wifi_R_ead_V_alue_33
C_wifi_R_ead_V_alue_28
 cmps r17, r21 wcz
 jmp #BR_B
 long @C_wifi_R_ead_V_alue_27 ' LTI4
 mov r0, #16 ' RET coni
C_wifi_R_ead_V_alue_21
 jmp #POPM ' restore registers
 add SP, #268 ' framesize
 jmp #RETF


' Catalina Export wifi_Read_Code

 alignl ' align long
C_wifi_R_ead_C_ode ' <symbol:wifi_Read_Code>
 jmp #NEWF
 sub SP, #264
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_wifi_R_ead_C_ode_49 ' JUMPV addrg
C_wifi_R_ead_C_ode_48
 jmp #LODL
 long 1000
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 jmp #BRAE
 long @C_wifi_R_ead_C_ode_51 ' GEI4
 mov r0, #15 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_C_ode_47 ' JUMPV addrg
C_wifi_R_ead_C_ode_51
C_wifi_R_ead_C_ode_49
 cmps r21,  #254 wz
 jmp #BRNZ
 long @C_wifi_R_ead_C_ode_48 ' NEI4
 jmp #JMPA
 long @C_wifi_R_ead_C_ode_54 ' JUMPV addrg
C_wifi_R_ead_C_ode_53
 jmp #LODL
 long 1000
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 jmp #BRAE
 long @C_wifi_R_ead_C_ode_56 ' GEI4
 mov r0, #15 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_C_ode_47 ' JUMPV addrg
C_wifi_R_ead_C_ode_56
 cmps r21,  #13 wz
 jmp #BR_Z
 long @C_wifi_R_ead_C_ode_58 ' EQI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-264) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, r21 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_wifi_R_ead_C_ode_59 ' JUMPV addrg
C_wifi_R_ead_C_ode_58
 mov r22, FP
 sub r22, #-(-264) ' reg <- addrli
 adds r22, r19 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r19,  #3 wcz
 jmp #BR_B
 long @C_wifi_R_ead_C_ode_60 ' LTI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-268) ' reg ARG ADDRLi
 jmp #LODL
 long @C_wifi_R_ead_C_ode_62_L000063
 mov r4, RI ' reg ARG ADDRG
 mov r5, FP
 sub r5, #-(-264) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_isscanf
 add SP, #12 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #83 wz
 jmp #BRNZ
 long @C_wifi_R_ead_C_ode_64 ' NEI4
 cmps r19,  #2 wz
 jmp #BRNZ
 long @C_wifi_R_ead_C_ode_64 ' NEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_C_ode_47 ' JUMPV addrg
C_wifi_R_ead_C_ode_64
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BRNZ
 long @C_wifi_R_ead_C_ode_66 ' NEI4
 cmps r19,  #2 wz
 jmp #BRNZ
 long @C_wifi_R_ead_C_ode_66 ' NEI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #14 wcz
 jmp #BR_A
 long @C_wifi_R_ead_C_ode_68 ' GTI4
 rdlong r0, r23 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_wifi_R_ead_C_ode_47 ' JUMPV addrg
C_wifi_R_ead_C_ode_68
C_wifi_R_ead_C_ode_66
C_wifi_R_ead_C_ode_60
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_C_ode_47 ' JUMPV addrg
C_wifi_R_ead_C_ode_59
C_wifi_R_ead_C_ode_54
 cmps r19,  #256 wcz
 jmp #BR_B
 long @C_wifi_R_ead_C_ode_53 ' LTI4
 mov r0, #16 ' RET coni
C_wifi_R_ead_C_ode_47
 jmp #POPM ' restore registers
 add SP, #264 ' framesize
 jmp #RETF


' Catalina Export wifi_Read_Id

 alignl ' align long
C_wifi_R_ead_I_d ' <symbol:wifi_Read_Id>
 jmp #NEWF
 sub SP, #268
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -272
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C_wifi_R_ead_I_d_72 ' JUMPV addrg
C_wifi_R_ead_I_d_71
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wcz
 jmp #BRAE
 long @C_wifi_R_ead_I_d_74 ' GEI4
 mov r0, #15 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_I_d_70 ' JUMPV addrg
C_wifi_R_ead_I_d_74
C_wifi_R_ead_I_d_72
 cmps r19,  #254 wz
 jmp #BRNZ
 long @C_wifi_R_ead_I_d_71 ' NEI4
 jmp #JMPA
 long @C_wifi_R_ead_I_d_77 ' JUMPV addrg
C_wifi_R_ead_I_d_76
 jmp #LODL
 long 1000
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wcz
 jmp #BRAE
 long @C_wifi_R_ead_I_d_79 ' GEI4
 mov r0, #15 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_I_d_70 ' JUMPV addrg
C_wifi_R_ead_I_d_79
 cmps r19,  #13 wz
 jmp #BR_Z
 long @C_wifi_R_ead_I_d_81 ' EQI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-264) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, r19 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_wifi_R_ead_I_d_82 ' JUMPV addrg
C_wifi_R_ead_I_d_81
 mov r22, FP
 sub r22, #-(-264) ' reg <- addrli
 adds r22, r17 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r17,  #3 wcz
 jmp #BR_B
 long @C_wifi_R_ead_I_d_83 ' LTI4
 mov r2, FP
 sub r2, #-(-272) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-268) ' reg ARG ADDRLi
 jmp #LODL
 long @C_wifi_R_ead_C_ode_62_L000063
 mov r4, RI ' reg ARG ADDRG
 mov r5, FP
 sub r5, #-(-264) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_isscanf
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #83 wz
 jmp #BRNZ
 long @C_wifi_R_ead_I_d_85 ' NEI4
 cmps r17,  #2 wz
 jmp #BRNZ
 long @C_wifi_R_ead_I_d_85 ' NEI4
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_I_d_70 ' JUMPV addrg
C_wifi_R_ead_I_d_85
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BRNZ
 long @C_wifi_R_ead_I_d_87 ' NEI4
 cmps r17,  #2 wz
 jmp #BRNZ
 long @C_wifi_R_ead_I_d_87 ' NEI4
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #14 wcz 
 jmp #BR_A
 long @C_wifi_R_ead_I_d_89 ' GTU4
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_wifi_R_ead_I_d_70 ' JUMPV addrg
C_wifi_R_ead_I_d_89
C_wifi_R_ead_I_d_87
C_wifi_R_ead_I_d_83
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_I_d_70 ' JUMPV addrg
C_wifi_R_ead_I_d_82
C_wifi_R_ead_I_d_77
 cmps r17,  #256 wcz
 jmp #BR_B
 long @C_wifi_R_ead_I_d_76 ' LTI4
 mov r0, #16 ' RET coni
C_wifi_R_ead_I_d_70
 jmp #POPM ' restore registers
 add SP, #268 ' framesize
 jmp #RETF


' Catalina Export wifi_DO_PIN

 alignl ' align long
C_wifi_D_O__P_I_N_ ' <symbol:wifi_DO_PIN>
 jmp #PSHM
 long $400000 ' save registers
' loading argument C_wifi_D_O__P_I_N__92_L000093 to PASM eliminated
'START PASM ... 
 mov r0, #(_WIFI_DO & $1FF)

'... END PASM
' call to PASM eliminated
 mov r22, r0 ' CVI, CVU or LOAD
' C_wifi_D_O__P_I_N__91 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export wifi_DI_PIN

 alignl ' align long
C_wifi_D_I__P_I_N_ ' <symbol:wifi_DI_PIN>
 jmp #PSHM
 long $400000 ' save registers
' loading argument C_wifi_D_I__P_I_N__95_L000096 to PASM eliminated
'START PASM ... 
 mov r0, #(_WIFI_DI & $1FF)

'... END PASM
' call to PASM eliminated
 mov r22, r0 ' CVI, CVU or LOAD
' C_wifi_D_I__P_I_N__94 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export wifi_PGM_PIN

 alignl ' align long
C_wifi_P_G_M__P_I_N_ ' <symbol:wifi_PGM_PIN>
 jmp #PSHM
 long $400000 ' save registers
' loading argument C_wifi_P_G_M__P_I_N__98_L000099 to PASM eliminated
'START PASM ... 
 mov r0, #(_WIFI_PGM & $1FF)

'... END PASM
' call to PASM eliminated
 mov r22, r0 ' CVI, CVU or LOAD
' C_wifi_P_G_M__P_I_N__97 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export wifi_RES_PIN

 alignl ' align long
C_wifi_R_E_S__P_I_N_ ' <symbol:wifi_RES_PIN>
 jmp #PSHM
 long $400000 ' save registers
' loading argument C_wifi_R_E_S__P_I_N__101_L000102 to PASM eliminated
'START PASM ... 
 mov r0, #(_WIFI_RES & $1FF)

'... END PASM
' call to PASM eliminated
 mov r22, r0 ' CVI, CVU or LOAD
' C_wifi_R_E_S__P_I_N__100 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export wifi_BRK_PIN

 alignl ' align long
C_wifi_B_R_K__P_I_N_ ' <symbol:wifi_BRK_PIN>
 jmp #PSHM
 long $400000 ' save registers
' loading argument C_wifi_B_R_K__P_I_N__104_L000105 to PASM eliminated
'START PASM ... 
 mov r0, #(_WIFI_BRK & $1FF)

'... END PASM
' call to PASM eliminated
 mov r22, r0 ' CVI, CVU or LOAD
' C_wifi_B_R_K__P_I_N__103 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export drvlow

 alignl ' align long
C_drvlow ' <symbol:drvlow>
' loading argument C_drvlow_107_L000108 to PASM eliminated
'START PASM ... 
 drvl r2

'... END PASM
' call to PASM eliminated
' C_drvlow_106 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export drvhigh

 alignl ' align long
C_drvhigh ' <symbol:drvhigh>
' loading argument C_drvhigh_110_L000111 to PASM eliminated
'START PASM ... 
 drvh r2

'... END PASM
' call to PASM eliminated
' C_drvhigh_109 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export input

 alignl ' align long
C_input ' <symbol:input>
' loading argument C_input_113_L000114 to PASM eliminated
'START PASM ... 
 dirl r2

'... END PASM
' call to PASM eliminated
' C_input_112 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export output

 alignl ' align long
C_output ' <symbol:output>
' loading argument C_output_116_L000117 to PASM eliminated
'START PASM ... 
 dirh r2

'... END PASM
' call to PASM eliminated
' C_output_115 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export wifi_BREAK

 alignl ' align long
C_wifi_B_R_E_A_K_ ' <symbol:wifi_BREAK>
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODI
 long @C_wifi_pin_brk
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_wifi_B_R_E_A_K__119 ' LTI4
 cmps r22,  #63 wcz
 jmp #BR_A
 long @C_wifi_B_R_E_A_K__119 ' GTI4
 mov r2, #100 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
 jmp #LODI
 long @C_wifi_pin_brk
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_drvlow ' CALL addrg
 mov r2, #200 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
 jmp #LODI
 long @C_wifi_pin_brk
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_input ' CALL addrg
 mov r2, #100 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_wifi_B_R_E_A_K__119
' C_wifi_B_R_E_A_K__118 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export wifi_RESET

 alignl ' align long
C_wifi_R_E_S_E_T_ ' <symbol:wifi_RESET>
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODI
 long @C_wifi_pin_res
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_wifi_R_E_S_E_T__122 ' LTI4
 cmps r22,  #63 wcz
 jmp #BR_A
 long @C_wifi_R_E_S_E_T__122 ' GTI4
 jmp #LODI
 long @C_wifi_pin_res
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_drvlow ' CALL addrg
 mov r2, #200 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
 jmp #LODI
 long @C_wifi_pin_res
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_drvhigh ' CALL addrg
 mov r2, #100 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_wifi_R_E_S_E_T__122
' C_wifi_R_E_S_E_T__121 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export wifi_PGM

 alignl ' align long
C_wifi_P_G_M_ ' <symbol:wifi_PGM>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 jmp #LODI
 long @C_wifi_pin_pgm
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_wifi_P_G_M__125 ' LTI4
 cmps r22,  #63 wcz
 jmp #BR_A
 long @C_wifi_P_G_M__125 ' GTI4
 mov r23, #0 ' reg <- coni
C_wifi_P_G_M__127
 jmp #LODI
 long @C_wifi_pin_pgm
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_drvlow ' CALL addrg
 mov r2, #100 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
 jmp #LODI
 long @C_wifi_pin_pgm
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_drvhigh ' CALL addrg
 mov r2, #100 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
' C_wifi_P_G_M__128 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #4 wcz
 jmp #BR_B
 long @C_wifi_P_G_M__127 ' LTI4
C_wifi_P_G_M__125
' C_wifi_P_G_M__124 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export wifi_OK

 alignl ' align long
C_wifi_O_K_ ' <symbol:wifi_OK>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 jmp #LODI
 long @C_wifi_init
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_wifi_O_K__132 ' NEI4
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_O_K__131 ' JUMPV addrg
C_wifi_O_K__132
 jmp #LODL
 long @C_wifi_O_K__134_L000135
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_S_end_C_ommand ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmps r23,  #0 wz
 jmp #BRNZ
 long @C_wifi_O_K__136 ' NEI4
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_R_ead_C_ode ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_wifi_O_K__136
 mov r0, r23 ' CVI, CVU or LOAD
C_wifi_O_K__131
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export wifi_INIT

 alignl ' align long
C_wifi_I_N_I_T_ ' <symbol:wifi_INIT>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_wifi_init
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_wifi_I_N_I_T__139 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_wifi_pin_di
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_wifi_pin_do
 wrlong r23, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_wifi_pin_brk
 wrlong r21, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_wifi_pin_res
 mov r22, RI ' reg <- addrg
 jmp #LODL
 long @C_wifi_pin_res
 wrlong r19, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_wifi_pin_pgm
 wrlong r17, RI ' ASGNI4 addrg reg
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_R_E_S_E_T_ ' CALL addrg
 jmp #LODI
 long @C_wifi_pin_pgm
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_P_G_M_ ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s_rxflush ' CALL addrg
 mov r22, #1 ' reg <- coni
 jmp #LODL
 long @C_wifi_init
 wrlong r22, RI ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_wifi_O_K_ ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_wifi_I_N_I_T__141 ' NEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_wifi_I_N_I_T__138 ' JUMPV addrg
C_wifi_I_N_I_T__141
C_wifi_I_N_I_T__139
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_wifi_init
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, #16 ' RET coni
C_wifi_I_N_I_T__138
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export wifi_AUTO

 alignl ' align long
C_wifi_A_U_T_O_ ' <symbol:wifi_AUTO>
 jmp #NEWF
 jmp #PSHM
 long $554000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_wifi_D_I__P_I_N_ ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_wifi_D_O__P_I_N_ ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_wifi_B_R_K__P_I_N_ ' CALL addrg
 mov r18, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_wifi_R_E_S__P_I_N_ ' CALL addrg
 mov r16, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_wifi_P_G_M__P_I_N_ ' CALL addrg
 mov r14, r0 ' CVI, CVU or LOAD
 mov r2, r14 ' CVI, CVU or LOAD
 mov r3, r16 ' CVI, CVU or LOAD
 mov r4, r18 ' CVI, CVU or LOAD
 mov r5, r20 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_wifi_I_N_I_T_
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_wifi_A_U_T_O__143 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import s_rxflush

' Catalina Import isscanf

' Catalina Import s_rx

' Catalina Import s_rxcount

' Catalina Import s_tx

' Catalina Import s_txflush

' Catalina Import s_str

' Catalina Import isprintf

' Catalina Import strlen

' Catalina Import _waitms

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_wifi_O_K__134_L000135 ' <symbol:134>
 byte 0

 alignl ' align long
C_wifi_R_ead_C_ode_62_L000063 ' <symbol:62>
 byte 61
 byte 37
 byte 99
 byte 44
 byte 37
 byte 117
 byte 0

 alignl ' align long
C_wifi_R_ead_V_alue_45_L000046 ' <symbol:45>
 byte 37
 byte 117
 byte 0

 alignl ' align long
C_wifi_R_ead_V_alue_36_L000037 ' <symbol:36>
 byte 61
 byte 37
 byte 99
 byte 44
 byte 37
 byte 115
 byte 0

 alignl ' align long
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
