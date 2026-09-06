' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export mt_findId

 alignl ' align long
C_mt_findI_d ' <symbol:mt_findId>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #128 wcz
 jmp #BRAE
 long @C_mt_findI_d_3 ' GEI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 wrbyte r22, RI ' ASGNI1 addrg reg
 jmp #JMPA
 long @C_mt_findI_d_4 ' JUMPV addrg
C_mt_findI_d_3
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 wrbyte r22, RI ' ASGNI1 addrg reg
C_mt_findI_d_4
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_mt_findI_d_6 ' EQI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_mt_findI_d_7 ' JUMPV addrg
C_mt_findI_d_6
 mov r23, #0 ' reg <- coni
C_mt_findI_d_7
 mov r0, r23 ' CVI, CVU or LOAD
' C_mt_findI_d_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export mt_findName

 alignl ' align long
C_mt_findN_ame ' <symbol:mt_findName>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 wrbyte r22, RI ' ASGNI1 addrg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_mt_lookupN_oteI_d ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVII
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_mt_findN_ame_9 ' EQI4
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 mov r22, RI ' reg <- addrg
 mov r20, #12 ' reg <- coni
 mov r18, r21 ' CVII
 shl r18, #24
 sar r18, #24 ' sign extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r19 ' CVII
 shl r20, #24
 sar r20, #24 ' sign extend
 adds r20, r0 ' ADDI/P (2)
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 wrbyte r20, RI ' ASGNI1 addrg reg
 rdbyte r22, r22 ' reg <- INDIRI1 reg
 shl r22, #24
 sar r22, #24 ' sign extend
 cmps r22,  #128 wcz
 jmp #BR_B
 long @C_mt_findN_ame_11 ' LTI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 wrbyte r22, RI ' ASGNI1 addrg reg
C_mt_findN_ame_11
C_mt_findN_ame_9
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_mt_findN_ame_14 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_mt_findN_ame_15 ' JUMPV addrg
C_mt_findN_ame_14
 mov r17, #0 ' reg <- coni
C_mt_findN_ame_15
 mov r0, r17 ' CVI, CVU or LOAD
' C_mt_findN_ame_8 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export mt_findNoteOctave

 alignl ' align long
C_mt_findN_oteO_ctave ' <symbol:mt_findNoteOctave>
 jmp #PSHM
 long $d40000 ' save registers
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 wrbyte r22, RI ' ASGNI1 addrg reg
 mov r22, r3 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #12 wcz
 jmp #BR_A
 long @C_mt_findN_oteO_ctave_17 ' GTI4
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 mov r22, RI ' reg <- addrg
 mov r20, #12 ' reg <- coni
 mov r18, r2 ' CVII
 shl r18, #24
 sar r18, #24 ' sign extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r3 ' CVUI
 and r20, cviu_m1 ' zero extend
 adds r20, r0 ' ADDI/P (2)
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 wrbyte r20, RI ' ASGNI1 addrg reg
 rdbyte r22, r22 ' reg <- INDIRI1 reg
 shl r22, #24
 sar r22, #24 ' sign extend
 cmps r22,  #128 wcz
 jmp #BR_B
 long @C_mt_findN_oteO_ctave_19 ' LTI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 wrbyte r22, RI ' ASGNI1 addrg reg
C_mt_findN_oteO_ctave_19
C_mt_findN_oteO_ctave_17
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_mt_findN_oteO_ctave_22 ' EQI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_mt_findN_oteO_ctave_23 ' JUMPV addrg
C_mt_findN_oteO_ctave_22
 mov r23, #0 ' reg <- coni
C_mt_findN_oteO_ctave_23
 mov r0, r23 ' CVI, CVU or LOAD
' C_mt_findN_oteO_ctave_16 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export mt_lookupNoteId

 alignl ' align long
C_mt_lookupN_oteI_d ' <symbol:mt_lookupNoteId>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_mt_lookupN_oteI_d_28 ' JUMPV addrg
C_mt_lookupN_oteI_d_25
 mov r22, #3 ' reg <- coni
 mov r20, r21 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_noteN_ame
 mov r22, RI ' reg <- addrg
 mov r2, r0 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_mt_lookupN_oteI_d_29 ' NEI4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_mt_lookupN_oteI_d_27 ' JUMPV addrg
C_mt_lookupN_oteI_d_29
' C_mt_lookupN_oteI_d_26 ' (symbol refcount = 0)
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 adds r22, #1 ' ADDI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
C_mt_lookupN_oteI_d_28
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #12 wcz
 jmp #BR_B
 long @C_mt_lookupN_oteI_d_25 ' LTI4
C_mt_lookupN_oteI_d_27
 mov r0, r19 ' CVII
 shl r0, #24
 sar r0, #24 ' sign extend
' C_mt_lookupN_oteI_d_24 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export mt_getFrequency

 alignl ' align long
C_mt_getF_requency ' <symbol:mt_getFrequency>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODI
 long @C_mt_getF_requency_32_L000033
 mov r22, RI ' reg <- INDIRF4 addrg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_mt_getF_requency_34 ' EQI4
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_notes+4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
C_mt_getF_requency_34
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 reg
' C_mt_getF_requency_31 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sq8k2_6a9cb4d6_itoa_L000037 ' <symbol:itoa>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r21, r2
 adds r21, #11 ' ADDP4 coni
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 cmps r3,  #0 wcz
 jmp #BRAE
 long @C_sq8k2_6a9cb4d6_itoa_L000037_39 ' GEI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r3
 adds r22, #1 ' ADDI4 coni
 neg r22, r22 ' NEGI4
 mov r23, r22
 add r23, #1 ' ADDU4 coni
 jmp #JMPA
 long @C_sq8k2_6a9cb4d6_itoa_L000037_40 ' JUMPV addrg
C_sq8k2_6a9cb4d6_itoa_L000037_39
 mov r23, r3 ' CVI, CVU or LOAD
C_sq8k2_6a9cb4d6_itoa_L000037_40
 mov r22, #0 ' reg <- coni
 wrbyte r22, r21 ' ASGNU1 reg reg
C_sq8k2_6a9cb4d6_itoa_L000037_41
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, #10 ' reg <- coni
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r1
 add r20, #48 ' ADDU4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #10 ' reg <- coni
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r23, r0 ' CVI, CVU or LOAD
' C_sq8k2_6a9cb4d6_itoa_L000037_42 ' (symbol refcount = 0)
 cmp r23,  #0 wz
 jmp #BRNZ
 long @C_sq8k2_6a9cb4d6_itoa_L000037_41 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sq8k2_6a9cb4d6_itoa_L000037_44 ' EQI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sq8k2_6a9cb4d6_itoa_L000037_44
 mov r0, r21 ' CVI, CVU or LOAD
' C_sq8k2_6a9cb4d6_itoa_L000037_38 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export mt_getName

 alignl ' align long
C_mt_getN_ame ' <symbol:mt_getName>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 wrbyte r22, r23 ' ASGNU1 reg reg
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_mt_getN_ame_47 ' EQI4
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_notes+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRI1 reg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODF
 long -8
 wrbyte r22, RI ' ASGNU1 addrl reg
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_notes+2
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRI1 reg
 jmp #LODF
 long -12
 wrbyte r22, RI ' ASGNI1 addrl reg
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_noteN_ame
 mov r22, RI ' reg <- addrg
 mov r3, r0 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRI1 reg
 mov r3, r22 ' CVII
 shl r3, #24
 sar r3, #24 ' sign extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq8k2_6a9cb4d6_itoa_L000037
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r21 ' CVUI
 and r20, cviu_m1 ' zero extend
 subs r20, #1 ' SUBI4 coni
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strncat
 add SP, #8 ' CALL addrg
C_mt_getN_ame_47
 mov r0, r23 ' CVI, CVU or LOAD
' C_mt_getN_ame_46 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


' Catalina Export mt_getNote

 alignl ' align long
C_mt_getN_ote ' <symbol:mt_getNote>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 wrbyte r22, r23 ' ASGNU1 reg reg
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_mt_getN_ote_52 ' EQI4
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_notes+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRI1 reg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODF
 long -8
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_noteN_ame
 mov r22, RI ' reg <- addrg
 mov r3, r0 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
C_mt_getN_ote_52
 mov r0, r23 ' CVI, CVU or LOAD
' C_mt_getN_ote_51 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export mt_getOctave

 alignl ' align long
C_mt_getO_ctave ' <symbol:mt_getOctave>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODL
 long -99
 mov r22, RI ' reg <- con
 jmp #LODF
 long -8
 wrbyte r22, RI ' ASGNI1 addrl reg
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_mt_getO_ctave_56 ' EQI4
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_notes+2
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRI1 reg
 jmp #LODF
 long -8
 wrbyte r22, RI ' ASGNI1 addrl reg
C_mt_getO_ctave_56
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRI1 reg
 mov r0, r22 ' CVII
 shl r0, #24
 sar r0, #24 ' sign extend
' C_mt_getO_ctave_55 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export mt_getId

 alignl ' align long
C_mt_getI_d ' <symbol:mt_getId>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #255 ' reg <- coni
 jmp #LODF
 long -8
 wrbyte r22, RI ' ASGNU1 addrl reg
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_mt_getI_d_60 ' EQI4
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_notes
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 jmp #LODF
 long -8
 wrbyte r22, RI ' ASGNU1 addrl reg
C_mt_getI_d_60
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22 ' CVII
 shl r0, #24
 sar r0, #24 ' sign extend
' C_mt_getI_d_59 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export mt_getNoteId

 alignl ' align long
C_mt_getN_oteI_d ' <symbol:mt_getNoteId>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #255 ' reg <- coni
 jmp #LODF
 long -8
 wrbyte r22, RI ' ASGNU1 addrl reg
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_mt_getN_oteI_d_63 ' EQI4
 jmp #LODL
 long @C_sq8k_6a9cb4d6__curI_tem_L000001
 rdbyte r22, RI ' reg <- INDIRI1 addrg
 shl r22, #24
 sar r22, #24 ' sign extend
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_notes+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRI1 reg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODF
 long -8
 wrbyte r22, RI ' ASGNU1 addrl reg
C_mt_getN_oteI_d_63
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22 ' CVII
 shl r0, #24
 sar r0, #24 ' sign extend
' C_mt_getN_oteI_d_62 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sq8k_6a9cb4d6__curI_tem_L000001 ' <symbol:_curItem>
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

 alignl ' align long
C_mt_getF_requency_32_L000033 ' <symbol:32>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
