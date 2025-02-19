' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wifi_Read_Response_Data

 alignl ' align long
C_wifi_R_ead_R_esponse_D_ata ' <symbol:wifi_Read_Response_Data>
 calld PA,#NEWF
 sub SP, #268
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-272)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_wifi_R_ead_R_esponse_D_ata_3 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_2
 mov r2, ##1000 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 if_ae jmp #\C_wifi_R_ead_R_esponse_D_ata_5 ' GEI4
 mov r0, #15 ' reg <- coni
 jmp #\@C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_5
C_wifi_R_ead_R_esponse_D_ata_3
 cmps r15,  #254 wz
 if_nz jmp #\C_wifi_R_ead_R_esponse_D_ata_2 ' NEI4
 jmp #\@C_wifi_R_ead_R_esponse_D_ata_8 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_7
 mov r2, ##1000 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 if_ae jmp #\C_wifi_R_ead_R_esponse_D_ata_10 ' GEI4
 mov r0, #15 ' reg <- coni
 jmp #\@C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_10
 cmps r15,  #13 wz
 if_z jmp #\C_wifi_R_ead_R_esponse_D_ata_12 ' EQI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-264) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_wifi_R_ead_R_esponse_D_ata_13 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_12
 cmps r13,  #3 wcz
 if_b jmp #\C_wifi_R_ead_R_esponse_D_ata_14 ' LTI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-268) ' reg ARG ADDRLi
 mov r4, ##@C_wifi_R_ead_R_esponse_D_ata_16_L000017 ' reg ARG ADDRG
 mov r5, FP
 sub r5, #-(-264) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_isscanf
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #83 wz
 if_nz jmp #\C_wifi_R_ead_R_esponse_D_ata_18 ' NEI4
 cmps r13,  #2 wz
 if_nz jmp #\C_wifi_R_ead_R_esponse_D_ata_18 ' NEI4
 rdlong r22, r21 ' reg <- INDIRI4 reg
 mov r20, ##512 ' reg <- con
 cmps r22, r20 wcz
 if_a jmp #\C_wifi_R_ead_R_esponse_D_ata_20 ' GTI4
 mov r11, #0 ' reg <- coni
 jmp #\@C_wifi_R_ead_R_esponse_D_ata_25 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_22
 mov r2, ##1000 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 if_ae jmp #\C_wifi_R_ead_R_esponse_D_ata_26 ' GEI4
 mov r0, #15 ' reg <- coni
 jmp #\@C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
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
 if_b jmp #\C_wifi_R_ead_R_esponse_D_ata_22 ' LTI4
 mov r22, r11 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_20
 mov r0, #16 ' reg <- coni
 jmp #\@C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_18
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_nz jmp #\C_wifi_R_ead_R_esponse_D_ata_28 ' NEI4
 cmps r13,  #2 wz
 if_nz jmp #\C_wifi_R_ead_R_esponse_D_ata_28 ' NEI4
 rdlong r22, r21 ' reg <- INDIRI4 reg
 wrlong r22, r23 ' ASGNI4 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #14 wcz
 if_a jmp #\C_wifi_R_ead_R_esponse_D_ata_30 ' GTI4
 rdlong r0, r23 ' reg <- INDIRI4 reg
 jmp #\@C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_30
C_wifi_R_ead_R_esponse_D_ata_28
C_wifi_R_ead_R_esponse_D_ata_14
 mov r0, #16 ' reg <- coni
 jmp #\@C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_13
C_wifi_R_ead_R_esponse_D_ata_8
 cmps r13,  #256 wcz
 if_b jmp #\C_wifi_R_ead_R_esponse_D_ata_7 ' LTI4
 mov r0, #16 ' reg <- coni
C_wifi_R_ead_R_esponse_D_ata_1
 calld PA,#POPM ' restore registers
 add SP, #268 ' framesize
 calld PA,#RETF


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
