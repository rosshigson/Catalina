' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export wifi_Read_Response_Data

 alignl ' align long
C_wifi_R_ead_R_esponse_D_ata ' <symbol:wifi_Read_Response_Data>
 jmp #NEWF
 sub SP, #268
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-272)
 wrlong r22, RI ' ASGNI4 addrli reg
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
 cmps r15,  #0 wz,wc
 jmp #BRAE
 long @C_wifi_R_ead_R_esponse_D_ata_5 ' GEI4
 mov r0, #15 ' reg <- coni
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
 cmps r15,  #0 wz,wc
 jmp #BRAE
 long @C_wifi_R_ead_R_esponse_D_ata_10 ' GEI4
 mov r0, #15 ' reg <- coni
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
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_13 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_12
 cmps r13,  #3 wz,wc
 jmp #BR_B
 long @C_wifi_R_ead_R_esponse_D_ata_14 ' LTI4
 mov r22, FP
 sub r22, #-(-264) ' reg <- addrli
 adds r22, r13 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
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
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #83 wz
 jmp #BRNZ
 long @C_wifi_R_ead_R_esponse_D_ata_18 ' NEI4
 cmps r11,  #2 wz
 jmp #BRNZ
 long @C_wifi_R_ead_R_esponse_D_ata_18 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22, r19 wz,wc
 jmp #BR_A
 long @C_wifi_R_ead_R_esponse_D_ata_20 ' GTI4
 mov r9, #0 ' reg <- coni
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
 cmps r15,  #0 wz,wc
 jmp #BRAE
 long @C_wifi_R_ead_R_esponse_D_ata_26 ' GEI4
 mov r0, #15 ' reg <- coni
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_26
 mov r22, r9 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_wifi_R_ead_R_esponse_D_ata_23 ' (symbol refcount = 0)
 adds r9, #1 ' ADDI4 coni
C_wifi_R_ead_R_esponse_D_ata_25
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r9, r22 wz,wc
 jmp #BR_B
 long @C_wifi_R_ead_R_esponse_D_ata_22 ' LTI4
 mov r22, r9 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_20
 mov r0, #16 ' reg <- coni
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_18
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 jmp #BRNZ
 long @C_wifi_R_ead_R_esponse_D_ata_28 ' NEI4
 cmps r11,  #2 wz
 jmp #BRNZ
 long @C_wifi_R_ead_R_esponse_D_ata_28 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_wifi_R_ead_R_esponse_D_ata_30 ' LEI4
 cmps r22,  #14 wz,wc
 jmp #BR_A
 long @C_wifi_R_ead_R_esponse_D_ata_30 ' GTI4
 mov RI, r23
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_30
 mov r0, #16 ' reg <- coni
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_28
C_wifi_R_ead_R_esponse_D_ata_14
 mov r0, #16 ' reg <- coni
 jmp #JMPA
 long @C_wifi_R_ead_R_esponse_D_ata_1 ' JUMPV addrg
C_wifi_R_ead_R_esponse_D_ata_13
C_wifi_R_ead_R_esponse_D_ata_8
 cmps r13,  #256 wz,wc
 jmp #BR_B
 long @C_wifi_R_ead_R_esponse_D_ata_7 ' LTI4
 mov r0, #16 ' reg <- coni
C_wifi_R_ead_R_esponse_D_ata_1
 jmp #POPM ' restore registers
 add SP, #268 ' framesize
 jmp #RETF


' Catalina Import wifi_timed_rx

' Catalina Import isscanf

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
