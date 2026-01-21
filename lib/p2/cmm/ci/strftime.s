' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_s3bo_696ddfec_s_prnt_L000001 ' <symbol:s_prnt>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 alignl_p1
 long I32_JMPA + (@C_s3bo_696ddfec_s_prnt_L000001_4)<<S32 ' JUMPV addrg
 alignl_label
C_s3bo_696ddfec_s_prnt_L000001_3
 word I16A_CMPI + (r4)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3bo_696ddfec_s_prnt_L000001_6)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3bo_696ddfec_s_prnt_L000001_5)<<S32 ' JUMPV addrg
 alignl_label
C_s3bo_696ddfec_s_prnt_L000001_6
 word I16A_MOV + (r22)<<D16A + (r5)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r5)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_SUBI + (r4)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_s3bo_696ddfec_s_prnt_L000001_4
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3bo_696ddfec_s_prnt_L000001_3)<<S32 ' GTI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3bo_696ddfec_s_prnt_L000001_8)<<S32 ' GEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3bo_696ddfec_s_prnt_L000001_3)<<S32 ' NEI4 reg coni
 alignl_label
C_s3bo_696ddfec_s_prnt_L000001_8
 alignl_label
C_s3bo_696ddfec_s_prnt_L000001_5
 word I16A_MOV + (r0)<<D16A + (r5)<<S16A ' CVI, CVU or LOAD
' C_s3bo_696ddfec_s_prnt_L000001_2 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_s3bo1_696ddfec_u_prnt_L000009 ' <symbol:u_prnt>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r20)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3bo1_696ddfec_u_prnt_L000009_13)<<S32 ' GTI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3bo1_696ddfec_u_prnt_L000009_11)<<S32 ' GEI4 reg coni
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3bo1_696ddfec_u_prnt_L000009_11)<<S32 ' EQU4 reg coni
 alignl_label
C_s3bo1_696ddfec_u_prnt_L000009_13
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3bo1_696ddfec_u_prnt_L000009_15)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r15)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r15)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3bo1_696ddfec_u_prnt_L000009_16)<<S32 ' JUMPV addrg
 alignl_label
C_s3bo1_696ddfec_u_prnt_L000009_15
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3bo1_696ddfec_u_prnt_L000009_16
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3bo1_696ddfec_u_prnt_L000009_11
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3bo1_696ddfec_u_prnt_L000009_17)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3bo1_696ddfec_u_prnt_L000009_17
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_s3bo1_696ddfec_u_prnt_L000009_10 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export strftime

 alignl_label
C_strftime ' <symbol:strftime>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $feae00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_strftime_20)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_strftime_19)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_20
 alignl_p1
 long I32_CALA + (@C__tzset)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_strftime_23)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_25
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_SUBI + (r21)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl_label
C_strftime_26
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_29)<<S32 ' EQU4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_29)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_strftime_25)<<S32 ' NEI4 reg coni
 alignl_label
C_strftime_29
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_32)<<S32 ' EQU4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_strftime_30)<<S32 ' NEI4 reg coni
 alignl_label
C_strftime_32
 alignl_p1
 long I32_JMPA + (@C_strftime_24)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_30
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r15)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r11)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (83)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_strftime_83)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_strftime_84)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_strftime_85_L000087-332 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_strftime_85_L000087 ' <symbol:85>
 long @C_strftime_59
 long @C_strftime_81
 long @C_strftime_60
 long @C_strftime_81
 long @C_strftime_62
 long @C_strftime_68
 long @C_strftime_74
 long @C_strftime_75
 long @C_strftime_81
 long @C_strftime_81
 long @C_strftime_81
 long @C_strftime_81
 long @C_strftime_81
 long @C_strftime_81
 long @C_strftime_36
 long @C_strftime_38
 long @C_strftime_40
 long @C_strftime_45

' Catalina Code

DAT ' code segment
 alignl_label
C_strftime_83
 alignl_p1
 long I32_MOVI + RI<<D32 + (65)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_37)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (66)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_39)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (66)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_strftime_90)<<S32 ' GTI4 reg coni
' C_strftime_89 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_79)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_strftime_81)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_90
 alignl_p1
 long I32_MOVI + RI<<D32 + (72)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_46)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (73)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_47)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (77)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_50)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_strftime_81)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_84
 alignl_p1
 long I32_MOVI + RI<<D32 + (112)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_51)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (112)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_strftime_92)<<S32 ' GTI4 reg coni
' C_strftime_91 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (106)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_48)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (109)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_49)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_strftime_81)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_92
 alignl_p1
 long I32_MOVI + RI<<D32 + (119)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_61)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_63)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (121)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_73)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_strftime_81)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_36
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__days ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo_696ddfec_s_prnt_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_37
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__days ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo_696ddfec_s_prnt_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_38
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__months ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo_696ddfec_s_prnt_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_39
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__months ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo_696ddfec_s_prnt_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_40
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_strftime_41_L000042 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_strftime)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_43)<<S32 ' EQU4 reg coni
 word I16A_SUB + (r21)<<D16A + (r13)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_44)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_43
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_strftime_44
 word I16A_ADDS + (r23)<<D16A + (r13)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_45
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_46
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_47
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (11)<<S16A ' ADDI4 reg coni
 word I16A_MOVI + (r20)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r1)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_48
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_49
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_50
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_51
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (12)<<S16A
 alignl_p1
 long I32_BRAE + (@C_strftime_57)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r10)<<D16B
 alignl_p1
 long @C_strftime_52_L000053 ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C_strftime_58)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_57
 word I16B_LODL + (r10)<<D16B
 alignl_p1
 long @C_strftime_54_L000055 ' reg <- addrg
 alignl_label
C_strftime_58
 word I16A_MOV + (r3)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo_696ddfec_s_prnt_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_59
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_60
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOVI + (r22)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r18)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r20)<<D16A + (r18)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r3)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_61
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_62
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOVI + (r22)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r18)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r18)<<D16A + (6)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_SUBS + (r20)<<D16A + (r1)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r3)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_63
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_strftime_64_L000065 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_strftime)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_66)<<S32 ' EQU4 reg coni
 word I16A_SUB + (r21)<<D16A + (r13)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_67)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_66
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_strftime_67
 word I16A_ADDS + (r23)<<D16A + (r13)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_68
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_strftime_69_L000070 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_strftime)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_71)<<S32 ' EQU4 reg coni
 word I16A_SUB + (r21)<<D16A + (r13)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_72)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_71
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_strftime_72
 word I16A_ADDS + (r23)<<D16A + (r13)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_73
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r3)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_74
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((1900)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo1_696ddfec_u_prnt_L000009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_75
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_strftime_77)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r9)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_strftime_78)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_77
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_strftime_78
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__tzname ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3bo_696ddfec_s_prnt_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_79
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(37)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_SUBI + (r21)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_strftime_34)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_80
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_label
C_strftime_81
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_strftime_80)<<S32 ' NEI4 reg coni
 alignl_label
C_strftime_34
 alignl_label
C_strftime_23
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_93)<<S32 ' EQU4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_strftime_26)<<S32 ' NEI4 reg coni
 alignl_label
C_strftime_93
 alignl_label
C_strftime_24
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strftime_94)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r23)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_strftime_19)<<S32 ' JUMPV addrg
 alignl_label
C_strftime_94
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_strftime_19
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _tzname

' Catalina Import _tzset

' Catalina Import _months

' Catalina Import _days

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_strftime_69_L000070 ' <symbol:69>
 byte 37
 byte 72
 byte 58
 byte 37
 byte 77
 byte 58
 byte 37
 byte 83
 byte 0

 alignl_label
C_strftime_64_L000065 ' <symbol:64>
 byte 37
 byte 97
 byte 32
 byte 37
 byte 98
 byte 32
 byte 37
 byte 100
 byte 32
 byte 37
 byte 89
 byte 0

 alignl_label
C_strftime_54_L000055 ' <symbol:54>
 byte 80
 byte 77
 byte 0

 alignl_label
C_strftime_52_L000053 ' <symbol:52>
 byte 65
 byte 77
 byte 0

 alignl_label
C_strftime_41_L000042 ' <symbol:41>
 byte 37
 byte 97
 byte 32
 byte 37
 byte 98
 byte 32
 byte 37
 byte 100
 byte 32
 byte 37
 byte 72
 byte 58
 byte 37
 byte 77
 byte 58
 byte 37
 byte 83
 byte 32
 byte 37
 byte 89
 byte 0

' Catalina Code

DAT ' code segment
' end
