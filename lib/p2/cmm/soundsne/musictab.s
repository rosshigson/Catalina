' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export mt_findId

 alignl_label
C_mt_findI_d ' <symbol:mt_findId>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_mt_findI_d_3)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNI1 addrg reg
 alignl_p1
 long I32_JMPA + (@C_mt_findI_d_4)<<S32 ' JUMPV addrg
 alignl_label
C_mt_findI_d_3
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNI1 addrg reg
 alignl_label
C_mt_findI_d_4
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mt_findI_d_6)<<S32 ' EQI4 reg reg
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_mt_findI_d_7)<<S32 ' JUMPV addrg
 alignl_label
C_mt_findI_d_6
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_mt_findI_d_7
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_mt_findI_d_2 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export mt_findName

 alignl_label
C_mt_findN_ame ' <symbol:mt_findName>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_NEGI + (r19)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNI1 addrg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_mt_lookupN_oteI_d)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVII
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mt_findN_ame_9)<<S32 ' EQI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_sj2k_6a9cb76c__curI_tem_L000001 ' reg <- addrg
 word I16A_MOVI + (r20)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A ' CVII
 word I16A_SHLI + (r18)<<D16A + 24<<S16A
 word I16A_SARI + (r18)<<D16A + 24<<S16A ' sign extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVII
 word I16A_SHLI + (r20)<<D16A + 24<<S16A
 word I16A_SARI + (r20)<<D16A + 24<<S16A ' sign extend
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_WRBYTE + (r20)<<D16A + RI<<S16A ' ASGNI1 addrg reg
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI1 reg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_mt_findN_ame_11)<<S32 ' LTI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNI1 addrg reg
 alignl_label
C_mt_findN_ame_11
 alignl_label
C_mt_findN_ame_9
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mt_findN_ame_14)<<S32 ' EQI4 reg reg
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_mt_findN_ame_15)<<S32 ' JUMPV addrg
 alignl_label
C_mt_findN_ame_14
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_mt_findN_ame_15
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_mt_findN_ame_8 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export mt_findNoteOctave

 alignl_label
C_mt_findN_oteO_ctave ' <symbol:mt_findNoteOctave>
 alignl_p1
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNI1 addrg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (12)<<S16A
 alignl_p1
 long I32_BR_A + (@C_mt_findN_oteO_ctave_17)<<S32 ' GTI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_sj2k_6a9cb76c__curI_tem_L000001 ' reg <- addrg
 word I16A_MOVI + (r20)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r2)<<S16A ' CVII
 word I16A_SHLI + (r18)<<D16A + 24<<S16A
 word I16A_SARI + (r18)<<D16A + 24<<S16A ' sign extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_WRBYTE + (r20)<<D16A + RI<<S16A ' ASGNI1 addrg reg
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI1 reg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_mt_findN_oteO_ctave_19)<<S32 ' LTI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNI1 addrg reg
 alignl_label
C_mt_findN_oteO_ctave_19
 alignl_label
C_mt_findN_oteO_ctave_17
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mt_findN_oteO_ctave_22)<<S32 ' EQI4 reg reg
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_mt_findN_oteO_ctave_23)<<S32 ' JUMPV addrg
 alignl_label
C_mt_findN_oteO_ctave_22
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_mt_findN_oteO_ctave_23
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_mt_findN_oteO_ctave_16 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export mt_lookupNoteId

 alignl_label
C_mt_lookupN_oteI_d ' <symbol:mt_lookupNoteId>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_NEGI + (r19)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_mt_lookupN_oteI_d_28)<<S32 ' JUMPV addrg
 alignl_label
C_mt_lookupN_oteI_d_25
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_noteN_ame ' reg <- addrg
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mt_lookupN_oteI_d_29)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_mt_lookupN_oteI_d_27)<<S32 ' JUMPV addrg
 alignl_label
C_mt_lookupN_oteI_d_29
' C_mt_lookupN_oteI_d_26 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_mt_lookupN_oteI_d_28
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (12)<<S16A
 alignl_p1
 long I32_BR_B + (@C_mt_lookupN_oteI_d_25)<<S32 ' LTI4 reg coni
 alignl_label
C_mt_lookupN_oteI_d_27
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVII
 word I16A_SHLI + (r0)<<D16A + 24<<S16A
 word I16A_SARI + (r0)<<D16A + 24<<S16A ' sign extend
' C_mt_lookupN_oteI_d_24 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export mt_getFrequency

 alignl_label
C_mt_getF_requency ' <symbol:mt_getFrequency>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_mt_getF_requency_32_L000033)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mt_getF_requency_34)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_notes+4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRF4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl_label
C_mt_getF_requency_34
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
' C_mt_getF_requency_31 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sj2k2_6a9cb76c_itoa_L000037 ' <symbol:itoa>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (11)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_CMPSI + (r3)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sj2k2_6a9cb76c_itoa_L000037_39)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDI + (r23)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sj2k2_6a9cb76c_itoa_L000037_40)<<S32 ' JUMPV addrg
 alignl_label
C_sj2k2_6a9cb76c_itoa_L000037_39
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sj2k2_6a9cb76c_itoa_L000037_40
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r21)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sj2k2_6a9cb76c_itoa_L000037_41
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_ADD + (r20)<<D16A + (r1)<<S16A ' ADDU (2)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sj2k2_6a9cb76c_itoa_L000037_42 ' (symbol refcount = 0)
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sj2k2_6a9cb76c_itoa_L000037_41)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sj2k2_6a9cb76c_itoa_L000037_44)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(45)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sj2k2_6a9cb76c_itoa_L000037_44
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_sj2k2_6a9cb76c_itoa_L000037_38 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export mt_getName

 alignl_label
C_mt_getN_ame ' <symbol:mt_getName>
 alignl_p1
 long I32_NEWF + 20<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r23)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mt_getN_ame_47)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_notes+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI1 reg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_notes+2 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI1 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNI1 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_noteN_ame ' reg <- addrg
 word I16A_MOV + (r3)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_strncpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVII
 word I16A_SHLI + (r3)<<D16A + 24<<S16A
 word I16A_SARI + (r3)<<D16A + 24<<S16A ' sign extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sj2k2_6a9cb76c_itoa_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_strncat)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_mt_getN_ame_47
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_mt_getN_ame_46 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export mt_getNote

 alignl_label
C_mt_getN_ote ' <symbol:mt_getNote>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r23)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mt_getN_ote_52)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_notes+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI1 reg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_noteN_ame ' reg <- addrg
 word I16A_MOV + (r3)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_strncpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_mt_getN_ote_52
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_mt_getN_ote_51 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export mt_getOctave

 alignl_label
C_mt_getO_ctave ' <symbol:mt_getOctave>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((-99)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNI1 addrl16 reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mt_getO_ctave_56)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_notes+2 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI1 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNI1 addrl16 reg
 alignl_label
C_mt_getO_ctave_56
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVII
 word I16A_SHLI + (r0)<<D16A + 24<<S16A
 word I16A_SARI + (r0)<<D16A + 24<<S16A ' sign extend
' C_mt_getO_ctave_55 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export mt_getId

 alignl_label
C_mt_getI_d ' <symbol:mt_getId>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(255)<<S32 ' reg <- conli
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mt_getI_d_60)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_notes ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_label
C_mt_getI_d_60
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVII
 word I16A_SHLI + (r0)<<D16A + 24<<S16A
 word I16A_SARI + (r0)<<D16A + 24<<S16A ' sign extend
' C_mt_getI_d_59 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export mt_getNoteId

 alignl_label
C_mt_getN_oteI_d ' <symbol:mt_getNoteId>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(255)<<S32 ' reg <- conli
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mt_getN_oteI_d_63)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_LODA + (@C_sj2k_6a9cb76c__curI_tem_L000001)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_notes+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI1 reg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_label
C_mt_getN_oteI_d_63
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVII
 word I16A_SHLI + (r0)<<D16A + 24<<S16A
 word I16A_SARI + (r0)<<D16A + 24<<S16A ' sign extend
' C_mt_getN_oteI_d_62 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Data

DAT ' uninitialized data segment

 alignl_label
C_sj2k_6a9cb76c__curI_tem_L000001 ' <symbol:_curItem>
 byte 0[1]

' Catalina Code

DAT ' code segment

' Catalina Import notes

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import noteName

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strcmp

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strncat

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strncpy

' Catalina Data

DAT ' uninitialized data segment

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_mt_getF_requency_32_L000033 ' <symbol:32>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
