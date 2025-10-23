' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_snrk_68f73704_N_anO_rI_nf_L000001 ' <symbol:NanOrInf>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODF
 long -8
 wrlong r23, RI ' ASGNF4 addrl reg
 jmp #LODL
 long $7f800000
 mov r22, RI ' reg <- con
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 and r20, r22 ' BANDI/U (1)
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_snrk_68f73704_N_anO_rI_nf_L000001_3 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $7fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_snrk_68f73704_N_anO_rI_nf_L000001_5 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $80000000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_snrk_68f73704_N_anO_rI_nf_L000001_7 ' EQU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk_68f73704_N_anO_rI_nf_L000001_8 ' JUMPV addrg
C_snrk_68f73704_N_anO_rI_nf_L000001_7
 mov r22, r19
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk_68f73704_N_anO_rI_nf_L000001_9 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #43 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk_68f73704_N_anO_rI_nf_L000001_9
C_snrk_68f73704_N_anO_rI_nf_L000001_8
 jmp #LODL
 long @C_snrk_68f73704_N_anO_rI_nf_L000001_11_L000012
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r0, r21
 adds r0, #3 ' ADDP4 coni
 jmp #JMPA
 long @C_snrk_68f73704_N_anO_rI_nf_L000001_2 ' JUMPV addrg
C_snrk_68f73704_N_anO_rI_nf_L000001_5
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $80000000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_snrk_68f73704_N_anO_rI_nf_L000001_13 ' EQU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk_68f73704_N_anO_rI_nf_L000001_14 ' JUMPV addrg
C_snrk_68f73704_N_anO_rI_nf_L000001_13
 mov r22, r19
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk_68f73704_N_anO_rI_nf_L000001_15 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #43 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk_68f73704_N_anO_rI_nf_L000001_15
C_snrk_68f73704_N_anO_rI_nf_L000001_14
 jmp #LODL
 long @C_snrk_68f73704_N_anO_rI_nf_L000001_17_L000018
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r0, r21
 adds r0, #3 ' ADDP4 coni
 jmp #JMPA
 long @C_snrk_68f73704_N_anO_rI_nf_L000001_2 ' JUMPV addrg
C_snrk_68f73704_N_anO_rI_nf_L000001_3
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_snrk_68f73704_N_anO_rI_nf_L000001_2
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_snrk3_68f73704__pfloat_L000019 ' <symbol:_pfloat>
 jmp #NEWF
 sub SP, #92
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snrk_68f73704_N_anO_rI_nf_L000001
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_snrk3_68f73704__pfloat_L000019_21 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_snrk3_68f73704__pfloat_L000019_20 ' JUMPV addrg
C_snrk3_68f73704__pfloat_L000019_21
 mov r2, FP
 sub r2, #-(-96) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C__fcvt
 add SP, #16 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk3_68f73704__pfloat_L000019_23 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk3_68f73704__pfloat_L000019_24 ' JUMPV addrg
C_snrk3_68f73704__pfloat_L000019_23
 mov r22, r17
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk3_68f73704__pfloat_L000019_25 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #43 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk3_68f73704__pfloat_L000019_26 ' JUMPV addrg
C_snrk3_68f73704__pfloat_L000019_25
 mov r22, r17
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk3_68f73704__pfloat_L000019_27 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #32 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk3_68f73704__pfloat_L000019_27
C_snrk3_68f73704__pfloat_L000019_26
C_snrk3_68f73704__pfloat_L000019_24
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BR_A
 long @C_snrk3_68f73704__pfloat_L000019_29 ' GTI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #48 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk3_68f73704__pfloat_L000019_29
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r13, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_snrk3_68f73704__pfloat_L000019_34 ' JUMPV addrg
C_snrk3_68f73704__pfloat_L000019_31
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk3_68f73704__pfloat_L000019_35 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov r15, r20
 adds r15, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk3_68f73704__pfloat_L000019_36 ' JUMPV addrg
C_snrk3_68f73704__pfloat_L000019_35
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #48 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk3_68f73704__pfloat_L000019_36
' C_snrk3_68f73704__pfloat_L000019_32 ' (symbol refcount = 0)
 subs r13, #1 ' SUBI4 coni
C_snrk3_68f73704__pfloat_L000019_34
 cmps r13,  #0 wcz
 jmp #BR_A
 long @C_snrk3_68f73704__pfloat_L000019_31 ' GTI4
 mov r13, r19 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 cmps r19, r22 wcz
 jmp #BR_A
 long @C_snrk3_68f73704__pfloat_L000019_39 ' GTI4
 mov r20, r17
 and r20, #8 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_snrk3_68f73704__pfloat_L000019_41 ' EQI4
C_snrk3_68f73704__pfloat_L000019_39
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk3_68f73704__pfloat_L000019_41 ' JUMPV addrg
C_snrk3_68f73704__pfloat_L000019_40
 mov r22, r13
 subs r22, #1 ' SUBI4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_snrk3_68f73704__pfloat_L000019_43 ' GEI4
 jmp #JMPA
 long @C_snrk3_68f73704__pfloat_L000019_46 ' JUMPV addrg
C_snrk3_68f73704__pfloat_L000019_43
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #48 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk3_68f73704__pfloat_L000019_41
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 cmps r22,  #0 wcz
 jmp #BRBE
 long @C_snrk3_68f73704__pfloat_L000019_40 ' LEI4
 jmp #JMPA
 long @C_snrk3_68f73704__pfloat_L000019_46 ' JUMPV addrg
C_snrk3_68f73704__pfloat_L000019_45
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk3_68f73704__pfloat_L000019_48 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov r15, r20
 adds r15, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk3_68f73704__pfloat_L000019_49 ' JUMPV addrg
C_snrk3_68f73704__pfloat_L000019_48
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #48 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk3_68f73704__pfloat_L000019_49
C_snrk3_68f73704__pfloat_L000019_46
 mov r22, r13
 subs r22, #1 ' SUBI4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_snrk3_68f73704__pfloat_L000019_45 ' GEI4
 mov r0, r21 ' CVI, CVU or LOAD
C_snrk3_68f73704__pfloat_L000019_20
 jmp #POPM ' restore registers
 add SP, #92 ' framesize
 jmp #RETF


 alignl ' align long
C_snrk4_68f73704__pscien_L000050 ' <symbol:_pscien>
 jmp #NEWF
 sub SP, #92
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snrk_68f73704_N_anO_rI_nf_L000001
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_snrk4_68f73704__pscien_L000050_52 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_snrk4_68f73704__pscien_L000050_51 ' JUMPV addrg
C_snrk4_68f73704__pscien_L000050_52
 mov r2, FP
 sub r2, #-(-96) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, r19
 adds r5, #1 ' ADDI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C__ecvt
 add SP, #16 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk4_68f73704__pscien_L000050_54 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk4_68f73704__pscien_L000050_55 ' JUMPV addrg
C_snrk4_68f73704__pscien_L000050_54
 mov r22, r17
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk4_68f73704__pscien_L000050_56 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #43 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk4_68f73704__pscien_L000050_57 ' JUMPV addrg
C_snrk4_68f73704__pscien_L000050_56
 mov r22, r17
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk4_68f73704__pscien_L000050_58 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #32 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk4_68f73704__pscien_L000050_58
C_snrk4_68f73704__pscien_L000050_57
C_snrk4_68f73704__pscien_L000050_55
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov r15, r20
 adds r15, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 cmps r19, r22 wcz
 jmp #BR_A
 long @C_snrk4_68f73704__pscien_L000050_62 ' GTI4
 mov r20, r17
 and r20, #8 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_snrk4_68f73704__pscien_L000050_64 ' EQI4
C_snrk4_68f73704__pscien_L000050_62
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk4_68f73704__pscien_L000050_64 ' JUMPV addrg
C_snrk4_68f73704__pscien_L000050_63
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk4_68f73704__pscien_L000050_66 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov r15, r20
 adds r15, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk4_68f73704__pscien_L000050_67 ' JUMPV addrg
C_snrk4_68f73704__pscien_L000050_66
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #48 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk4_68f73704__pscien_L000050_67
C_snrk4_68f73704__pscien_L000050_64
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_snrk4_68f73704__pscien_L000050_63 ' GEI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #101 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #LODI
 long @C_snrk4_68f73704__pscien_L000050_70_L000071
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_Z
 long @C_snrk4_68f73704__pscien_L000050_68 ' EQF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_snrk4_68f73704__pscien_L000050_68
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_snrk4_68f73704__pscien_L000050_72 ' GEI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_snrk4_68f73704__pscien_L000050_73 ' JUMPV addrg
C_snrk4_68f73704__pscien_L000050_72
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #43 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk4_68f73704__pscien_L000050_73
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #100 wcz
 jmp #BR_B
 long @C_snrk4_68f73704__pscien_L000050_74 ' LTI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #100 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 jmp #LODF
 long -8
 wrlong r1, RI ' ASGNI4 addrl reg
C_snrk4_68f73704__pscien_L000050_74
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #10 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #10 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r1
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
C_snrk4_68f73704__pscien_L000050_51
 jmp #POPM ' restore registers
 add SP, #92 ' framesize
 jmp #RETF


 alignl ' align long
C_snrk6_68f73704__gcvt_L000076 ' <symbol:_gcvt>
 jmp #NEWF
 sub SP, #96
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r9, r21 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snrk_68f73704_N_anO_rI_nf_L000001
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_snrk6_68f73704__gcvt_L000076_78 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_77 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_78
 mov r2, FP
 sub r2, #-(-96) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C__ecvt
 add SP, #16 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r13, r19 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk6_68f73704__gcvt_L000076_80 ' EQI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_81 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_80
 mov r22, r17
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk6_68f73704__gcvt_L000076_82 ' EQI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #43 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_83 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_82
 mov r22, r17
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk6_68f73704__gcvt_L000076_84 ' EQI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #32 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk6_68f73704__gcvt_L000076_84
C_snrk6_68f73704__gcvt_L000076_83
C_snrk6_68f73704__gcvt_L000076_81
 mov r22, r17
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_snrk6_68f73704__gcvt_L000076_86 ' NEI4
 mov r11, r9
 subs r11, #1 ' SUBI4 coni
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_91 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_88
 subs r9, #1 ' SUBI4 coni
' C_snrk6_68f73704__gcvt_L000076_89 ' (symbol refcount = 0)
 subs r11, #1 ' SUBI4 coni
C_snrk6_68f73704__gcvt_L000076_91
 cmps r11,  #0 wcz
 jmp #BRBE
 long @C_snrk6_68f73704__gcvt_L000076_92 ' LEI4
 mov r22, r11 ' ADDI/P
 adds r22, r15 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 jmp #BR_Z
 long @C_snrk6_68f73704__gcvt_L000076_88 ' EQI4
C_snrk6_68f73704__gcvt_L000076_92
C_snrk6_68f73704__gcvt_L000076_86
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long -3
 mov r20, RI ' reg <- con
 cmps r22, r20 wcz
 jmp #BR_B
 long @C_snrk6_68f73704__gcvt_L000076_95 ' LTI4
 mov r20, r21
 adds r20, #1 ' ADDI4 coni
 cmps r22, r20 wcz
 jmp #BR_B
 long @C_snrk6_68f73704__gcvt_L000076_93 ' LTI4
C_snrk6_68f73704__gcvt_L000076_95
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov r15, r20
 adds r15, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r9,  #1 wcz
 jmp #BR_A
 long @C_snrk6_68f73704__gcvt_L000076_98 ' GTI4
 mov r22, r17
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snrk6_68f73704__gcvt_L000076_100 ' EQI4
C_snrk6_68f73704__gcvt_L000076_98
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_100 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_99
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov r15, r20
 adds r15, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk6_68f73704__gcvt_L000076_100
 mov r22, r9
 subs r22, #1 ' SUBI4 coni
 mov r9, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 jmp #BR_A
 long @C_snrk6_68f73704__gcvt_L000076_99 ' GTI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #101 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_snrk6_68f73704__gcvt_L000076_102 ' GEI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_103 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_102
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #43 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk6_68f73704__gcvt_L000076_103
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #100 wcz
 jmp #BRAE
 long @C_snrk6_68f73704__gcvt_L000076_107 ' GEI4
 jmp #LODL
 long -100
 mov r20, RI ' reg <- con
 cmps r22, r20 wcz
 jmp #BR_A
 long @C_snrk6_68f73704__gcvt_L000076_105 ' GTI4
C_snrk6_68f73704__gcvt_L000076_107
 mov r7, #3 ' reg <- coni
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_106 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_105
 mov r7, #2 ' reg <- coni
C_snrk6_68f73704__gcvt_L000076_106
 adds r13, r7 ' ADDI/P (2)
 mov r22, #0 ' reg <- coni
 wrbyte r22, r13 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #100 wcz
 jmp #BRAE
 long @C_snrk6_68f73704__gcvt_L000076_115 ' GEI4
 jmp #LODL
 long -100
 mov r20, RI ' reg <- con
 cmps r22, r20 wcz
 jmp #BR_A
 long @C_snrk6_68f73704__gcvt_L000076_113 ' GTI4
C_snrk6_68f73704__gcvt_L000076_115
 mov r22, #3 ' reg <- coni
 jmp #LODF
 long -100
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_114 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_113
 mov r22, #2 ' reg <- coni
 jmp #LODF
 long -100
 wrlong r22, RI ' ASGNI4 addrl reg
C_snrk6_68f73704__gcvt_L000076_114
 mov r22, FP
 sub r22, #-(-100) ' reg <- addrli
 rdlong r11, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_111 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_108
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r13 ' ADDI/P (2)
 mov r13, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #10 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r1
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
' C_snrk6_68f73704__gcvt_L000076_109 ' (symbol refcount = 0)
 subs r11, #1 ' SUBI4 coni
C_snrk6_68f73704__gcvt_L000076_111
 cmps r11,  #0 wcz
 jmp #BR_A
 long @C_snrk6_68f73704__gcvt_L000076_108 ' GTI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_77 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_93
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BR_A
 long @C_snrk6_68f73704__gcvt_L000076_116 ' GTI4
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 jmp #BR_Z
 long @C_snrk6_68f73704__gcvt_L000076_121 ' EQI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #48 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_121 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_120
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #48 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk6_68f73704__gcvt_L000076_121
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_snrk6_68f73704__gcvt_L000076_120 ' LTI4
C_snrk6_68f73704__gcvt_L000076_116
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_126 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_123
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov r15, r20
 adds r15, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r11, r22 wz
 jmp #BRNZ
 long @C_snrk6_68f73704__gcvt_L000076_127 ' NEI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk6_68f73704__gcvt_L000076_127
' C_snrk6_68f73704__gcvt_L000076_124 ' (symbol refcount = 0)
 adds r11, #1 ' ADDI4 coni
C_snrk6_68f73704__gcvt_L000076_126
 cmps r11, r9 wcz
 jmp #BRBE
 long @C_snrk6_68f73704__gcvt_L000076_123 ' LEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r11, r22 wcz
 jmp #BR_A
 long @C_snrk6_68f73704__gcvt_L000076_129 ' GTI4
 jmp #JMPA
 long @C_snrk6_68f73704__gcvt_L000076_132 ' JUMPV addrg
C_snrk6_68f73704__gcvt_L000076_131
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #48 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk6_68f73704__gcvt_L000076_132
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 jmp #BRBE
 long @C_snrk6_68f73704__gcvt_L000076_131 ' LEI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_snrk6_68f73704__gcvt_L000076_129
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r13 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #46 wz
 jmp #BRNZ
 long @C_snrk6_68f73704__gcvt_L000076_134 ' NEI4
 mov r22, r17
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_snrk6_68f73704__gcvt_L000076_134 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r13, r22 ' ADDI/P (1)
C_snrk6_68f73704__gcvt_L000076_134
 mov r22, #0 ' reg <- coni
 wrbyte r22, r13 ' ASGNU1 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
C_snrk6_68f73704__gcvt_L000076_77
 jmp #POPM ' restore registers
 add SP, #96 ' framesize
 jmp #RETF


' Catalina Export _f_print

 alignl ' align long
C__f_print ' <symbol:_f_print>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r21 ' CVI, CVU or LOAD
 mov r22, r23
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__f_print_137 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
 jmp #JMPA
 long @C__f_print_138 ' JUMPV addrg
C__f_print_137
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
C__f_print_138
 mov r13, r19 ' CVUI
 and r13, cviu_m1 ' zero extend
 mov r22, #69 ' reg <- coni
 cmps r13, r22 wz
 jmp #BR_Z
 long @C__f_print_143 ' EQI4
 cmps r13,  #70 wz
 jmp #BR_Z
 long @C__f_print_142 ' EQI4
 cmps r13,  #71 wz
 jmp #BR_Z
 long @C__f_print_144 ' EQI4
 cmps r13, r22 wcz
 jmp #BR_B
 long @C__f_print_139 ' LTI4
' C__f_print_145 ' (symbol refcount = 0)
 cmps r13,  #101 wz
 jmp #BR_Z
 long @C__f_print_143 ' EQI4
 cmps r13,  #102 wz
 jmp #BR_Z
 long @C__f_print_142 ' EQI4
 cmps r13,  #103 wz
 jmp #BR_Z
 long @C__f_print_144 ' EQI4
 jmp #JMPA
 long @C__f_print_139 ' JUMPV addrg
C__f_print_142
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_snrk3_68f73704__pfloat_L000019
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__f_print_140 ' JUMPV addrg
C__f_print_143
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_snrk4_68f73704__pscien_L000050
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__f_print_140 ' JUMPV addrg
C__f_print_144
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_snrk6_68f73704__gcvt_L000076
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 adds r21, r0 ' ADDI/P (2)
C__f_print_139
C__f_print_140
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C__f_print_148 ' EQI4
 cmps r22,  #71 wz
 jmp #BRNZ
 long @C__f_print_146 ' NEI4
C__f_print_148
 jmp #JMPA
 long @C__f_print_150 ' JUMPV addrg
C__f_print_149
 adds r15, #1 ' ADDP4 coni
C__f_print_150
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__f_print_152 ' EQI4
 cmps r22,  #101 wz
 jmp #BRNZ
 long @C__f_print_149 ' NEI4
C__f_print_152
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #101 wz
 jmp #BRNZ
 long @C__f_print_147 ' NEI4
 mov r22, #69 ' reg <- coni
 wrbyte r22, r15 ' ASGNU1 reg reg
 jmp #JMPA
 long @C__f_print_147 ' JUMPV addrg
C__f_print_146
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #70 wz
 jmp #BRNZ
 long @C__f_print_155 ' NEI4
 jmp #JMPA
 long @C__f_print_158 ' JUMPV addrg
C__f_print_157
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #97 ' SUBI4 coni
 cmp r22,  #26 wcz 
 jmp #BRAE
 long @C__f_print_160 ' GEU4
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_toupper ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 wrbyte r22, r15 ' ASGNU1 reg reg
C__f_print_160
 adds r15, #1 ' ADDP4 coni
C__f_print_158
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__f_print_157 ' NEI4
C__f_print_155
C__f_print_147
 mov r0, r21 ' CVI, CVU or LOAD
' C__f_print_136 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import _fcvt

' Catalina Import _ecvt

' Catalina Import toupper

' Catalina Import strlen

' Catalina Import strcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_snrk4_68f73704__pscien_L000050_70_L000071 ' <symbol:70>
 long $0 ' float

 alignl ' align long
C_snrk_68f73704_N_anO_rI_nf_L000001_17_L000018 ' <symbol:17>
 byte 110
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_snrk_68f73704_N_anO_rI_nf_L000001_11_L000012 ' <symbol:11>
 byte 105
 byte 110
 byte 102
 byte 0

' Catalina Code

DAT ' code segment
' end
