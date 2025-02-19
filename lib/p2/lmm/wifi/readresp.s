' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wifi_Read_Response_Data

 alignl ' align long
C_wifi_R_ead_R_esponse_D_ata ' <symbol:wifi_Read_Response_Data>
 jmp #NEWF
 sub SP, #268
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -272
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_3 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_2
 jmp #LODL
 long 1000
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 jmp #BRAE
 long @C_wifi_R_ead_R_esponse_D_ata_5 ' GEI4
 mov r0, #15 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_5
C_wifi_R_ead_R_esponse_D_ata_3
 cmps r15,  #254 wz
 jmp #BRNZ
 long @C_wifi_R_ead_R_esponse_D_ata_2 ' NEI4
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_8 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_7
 jmp #LODL
 long 1000
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 jmp #BRAE
 long @C_wifi_R_ead_R_esponse_D_ata_10 ' GEI4
 mov r0, #15 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_10
 cmps r15,  #13 wz
 jmp #BR_Z
 long @C_wifi_R_ead_R_esponse_D_ata_12 ' EQI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-264) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_13 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_12
 cmps r13,  #3 wcz
 jmp #BR_B
 long @C_wifi_R_ead_R_esponse_D_ata_14 ' LTI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-268) ' reg ARG ADDRLi
 jmp #LODL
 long @C_wifi_R_ead_R_esponse_D_ata_16_L000017
 mov r4, RI ' reg ARG ADDRG
 mov r5, FP
 sub r5, #-(-264) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_isscanf
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #83 wz
 jmp #BRNZ
 long @C_wifi_R_ead_R_esponse_D_ata_18 ' NEI4
 cmps r13,  #2 wz
 jmp #BRNZ
 long @C_wifi_R_ead_R_esponse_D_ata_18 ' NEI4
 rdlong r22, r21 ' reg <- INDIRI4 reg
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 cmps r22, r20 wcz
 jmp #BR_A
 long @C_wifi_R_ead_R_esponse_D_ata_20 ' GTI4
 mov r11, #0 ' reg <- coni
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_25 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_22
 jmp #LODL
 long 1000
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 jmp #BRAE
 long @C_wifi_R_ead_R_esponse_D_ata_26 ' GEI4
 mov r0, #15 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_26
 mov r22, r11 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_wifi_R_ead_R_esponse_D_ata_23 ' (symbol refcount = 0)
 adds r11, #1 ' ADDI4 coni
C_wifi_R_ead_R_esponse_D_ata_25
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r11, r22 wcz
 jmp #BR_B
 long @C_wifi_R_ead_R_esponse_D_ata_22 ' LTI4
 mov r22, r11 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_20
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_18
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BRNZ
 long @C_wifi_R_ead_R_esponse_D_ata_28 ' NEI4
 cmps r13,  #2 wz
 jmp #BRNZ
 long @C_wifi_R_ead_R_esponse_D_ata_28 ' NEI4
 rdlong r22, r21 ' reg <- INDIRI4 reg
 wrlong r22, r23 ' ASGNI4 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #14 wcz
 jmp #BR_A
 long @C_wifi_R_ead_R_esponse_D_ata_30 ' GTI4
 rdlong r0, r23 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_30
C_wifi_R_ead_R_esponse_D_ata_28
C_wifi_R_ead_R_esponse_D_ata_14
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_13
C_wifi_R_ead_R_esponse_D_ata_8
 cmps r13,  #256 wcz
 jmp #BR_B
 long @C_wifi_R_ead_R_esponse_D_ata_7 ' LTI4
 mov r0, #16 ' RET coni
C_wifi_R_ead_R_esponse_D_ata_1
 jmp #POPM ' restore registers
 add SP, #268 ' framesize
 jmp #RETF


' Catalina Import isscanf

' Catalina Import wifi_timed_rx

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
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
