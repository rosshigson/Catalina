' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_smd0_686cc1e2_dummynode__L000013 ' <symbol:dummynode_>
 long $0
 byte $10
 byte $0
 byte 0[2]
 long 0
 long $0

 alignl ' align long
C_smd01_686cc1e2_absentkey_L000014 ' <symbol:absentkey>
 long $0
 byte $20
 byte 0[3]

' Catalina Code

DAT ' code segment

 alignl ' align long
C_smd02_686cc1e2_hashint_L000015 ' <symbol:hashint>
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' CVI, CVU or LOAD
 jmp #LODL
 long $7fffffff
 mov r22, RI ' reg <- con
 cmp r23, r22 wz,wc 
 jmp #BR_A
 long @C_smd02_686cc1e2_hashint_L000015_17 ' GTU4
 mov r22, #1 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov r18, r3
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 or r22, #1 ' BORI4 coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r1
 shl r22, #4 ' LSHI4 coni
 mov r20, r3
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_smd02_686cc1e2_hashint_L000015_16 ' JUMPV addrg
C_smd02_686cc1e2_hashint_L000015_17
 mov r22, #1 ' reg <- coni
 mov r20, r3
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 or r22, #1 ' BORI4 coni
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r22, r1
 shl r22, #4 ' LSHU4 coni
 mov r20, r3
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_smd02_686cc1e2_hashint_L000015_16
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_smd03_686cc1e2_l_hashfloat_L000019 ' <symbol:l_hashfloat>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_frexp
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_smd03_686cc1e2_l_hashfloat_L000019_21_L000022
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_smd03_686cc1e2_l_hashfloat_L000019_26_L000027
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_smd03_686cc1e2_l_hashfloat_L000019_28 ' LTF4
 jmp #LODI
 long @C_smd03_686cc1e2_l_hashfloat_L000019_21_L000022
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_smd03_686cc1e2_l_hashfloat_L000019_28 ' GEF4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_smd03_686cc1e2_l_hashfloat_L000019_23 ' NEI4
C_smd03_686cc1e2_l_hashfloat_L000019_28
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_smd03_686cc1e2_l_hashfloat_L000019_20 ' JUMPV addrg
C_smd03_686cc1e2_l_hashfloat_L000019_23
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 add r22, r20 ' ADDU (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $7fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_smd03_686cc1e2_l_hashfloat_L000019_30 ' GTU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRU4 reg
 jmp #JMPA
 long @C_smd03_686cc1e2_l_hashfloat_L000019_31 ' JUMPV addrg
C_smd03_686cc1e2_l_hashfloat_L000019_30
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r21, r22
 xor r21, all_1s ' BCOMU4
C_smd03_686cc1e2_l_hashfloat_L000019_31
 mov r0, r21 ' CVI, CVU or LOAD
C_smd03_686cc1e2_l_hashfloat_L000019_20
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_smd06_686cc1e2_mainpositionT_V__L000032 ' <symbol:mainpositionTV>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r22
 and r19, #63 ' BANDI4 coni
 cmps r19,  #1 wz,wc
 jmp #BR_B
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_34 ' LTI4
 cmps r19,  #4 wz,wc
 jmp #BR_A
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_45 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_46_L000048-4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_smd06_686cc1e2_mainpositionT_V__L000032_46_L000048 ' <symbol:46>
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_41
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_43
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_37
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_39

' Catalina Code

DAT ' code segment
C_smd06_686cc1e2_mainpositionT_V__L000032_45
 cmps r19,  #17 wz,wc
 jmp #BR_B
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_34 ' LTI4
 cmps r19,  #22 wz,wc
 jmp #BR_A
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_34 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_50_L000052-68
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_smd06_686cc1e2_mainpositionT_V__L000032_50_L000052 ' <symbol:50>
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_42
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_34
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_38
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_40
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_34
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_44

' Catalina Code

DAT ' code segment
C_smd06_686cc1e2_mainpositionT_V__L000032_37
 rdlong r22, r21 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd02_686cc1e2_hashint_L000015
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_33 ' JUMPV addrg
C_smd06_686cc1e2_mainpositionT_V__L000032_38
 rdlong r22, r21 ' reg <- INDIRF4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_smd03_686cc1e2_l_hashfloat_L000019 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #1 ' reg <- coni
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r20, r18 ' LSHI/U (1)
 subs r20, #1 ' SUBI4 coni
 or r20, #1 ' BORI4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r1
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_33 ' JUMPV addrg
C_smd06_686cc1e2_mainpositionT_V__L000032_39
 rdlong r22, r21 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 and r22, r20 ' BANDI/U (2)
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_33 ' JUMPV addrg
C_smd06_686cc1e2_mainpositionT_V__L000032_40
 rdlong r22, r21 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaS__hashlongstr ' CALL addrg
 mov r20, #1 ' reg <- coni
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r20, r18 ' LSHI/U (1)
 subs r20, #1 ' SUBI4 coni
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_33 ' JUMPV addrg
C_smd06_686cc1e2_mainpositionT_V__L000032_41
 mov r22, #0 ' reg <- coni
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_33 ' JUMPV addrg
C_smd06_686cc1e2_mainpositionT_V__L000032_42
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 and r22, #1 ' BANDI4 coni
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_33 ' JUMPV addrg
C_smd06_686cc1e2_mainpositionT_V__L000032_43
 rdlong r22, r21 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 or r22, #1 ' BORI4 coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r22, r1
 shl r22, #4 ' LSHU4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_33 ' JUMPV addrg
C_smd06_686cc1e2_mainpositionT_V__L000032_44
 rdlong r22, r21 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 or r22, #1 ' BORI4 coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r22, r1
 shl r22, #4 ' LSHU4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_smd06_686cc1e2_mainpositionT_V__L000032_33 ' JUMPV addrg
C_smd06_686cc1e2_mainpositionT_V__L000032_34
 rdlong r22, r21 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 or r22, #1 ' BORI4 coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r22, r1
 shl r22, #4 ' LSHU4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_smd06_686cc1e2_mainpositionT_V__L000032_33
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_smd0b_686cc1e2_mainpositionfromnode_L000054 ' <symbol:mainpositionfromnode>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, FP
 sub r19, #-(-12) ' reg <- addrli
 mov r17, r21 ' CVI, CVU or LOAD
 mov r0, r19 ' CVI, CVU or LOAD
 mov r1, r17
 adds r1, #12 ' ADDP4 coni
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd06_686cc1e2_mainpositionT_V__L000032
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_smd0b_686cc1e2_mainpositionfromnode_L000054_55 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_smd0c_686cc1e2_equalkey_L000056 ' <symbol:equalkey>
 jmp #NEWF
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_smd0c_686cc1e2_equalkey_L000056_58 ' EQI4
 mov r18, #0 ' reg <- coni
 cmps r19, r18 wz
 jmp #BR_Z
 long @C_smd0c_686cc1e2_equalkey_L000056_61 ' EQI4
 cmps r20,  #11 wz
 jmp #BRNZ
 long @C_smd0c_686cc1e2_equalkey_L000056_61 ' NEI4
 and r22, #64 ' BANDI4 coni
 cmps r22, r18 wz
 jmp #BRNZ
 long @C_smd0c_686cc1e2_equalkey_L000056_58 ' NEI4
C_smd0c_686cc1e2_equalkey_L000056_61
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_57 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_58
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 cmps r17,  #17 wz
 jmp #BR_Z
 long @C_smd0c_686cc1e2_equalkey_L000056_65 ' EQI4
 cmps r17,  #19 wz
 jmp #BR_Z
 long @C_smd0c_686cc1e2_equalkey_L000056_70 ' EQI4
 mov r22, #22 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_smd0c_686cc1e2_equalkey_L000056_78 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_A
 long @C_smd0c_686cc1e2_equalkey_L000056_87 ' GTI4
' C_smd0c_686cc1e2_equalkey_L000056_86 ' (symbol refcount = 0)
 cmps r17,  #0 wz,wc
 jmp #BR_B
 long @C_smd0c_686cc1e2_equalkey_L000056_62 ' LTI4
 cmps r17,  #3 wz,wc
 jmp #BR_A
 long @C_smd0c_686cc1e2_equalkey_L000056_62 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_smd0c_686cc1e2_equalkey_L000056_88_L000090
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_smd0c_686cc1e2_equalkey_L000056_88_L000090 ' <symbol:88>
 long @C_smd0c_686cc1e2_equalkey_L000056_65
 long @C_smd0c_686cc1e2_equalkey_L000056_65
 long @C_smd0c_686cc1e2_equalkey_L000056_74
 long @C_smd0c_686cc1e2_equalkey_L000056_66

' Catalina Code

DAT ' code segment
C_smd0c_686cc1e2_equalkey_L000056_87
 cmps r17,  #84 wz
 jmp #BR_Z
 long @C_smd0c_686cc1e2_equalkey_L000056_82 ' EQI4
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_62 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_65
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_57 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_66
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_smd0c_686cc1e2_equalkey_L000056_68 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_69 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_68
 mov r15, #0 ' reg <- coni
C_smd0c_686cc1e2_equalkey_L000056_69
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_57 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_70
 rdlong r22, r23 ' reg <- INDIRF4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_smd0c_686cc1e2_equalkey_L000056_72 ' NEF4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_73 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_72
 mov r13, #0 ' reg <- coni
C_smd0c_686cc1e2_equalkey_L000056_73
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_57 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_74
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_smd0c_686cc1e2_equalkey_L000056_76 ' NEU4
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_77 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_76
 mov r11, #0 ' reg <- coni
C_smd0c_686cc1e2_equalkey_L000056_77
 mov r0, r11 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_57 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_78
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_smd0c_686cc1e2_equalkey_L000056_80 ' NEU4
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_81 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_80
 mov r9, #0 ' reg <- coni
C_smd0c_686cc1e2_equalkey_L000056_81
 mov r0, r9 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_57 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_82
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__eqlngstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_57 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_62
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_smd0c_686cc1e2_equalkey_L000056_84 ' NEU4
 mov r7, #1 ' reg <- coni
 jmp #JMPA
 long @C_smd0c_686cc1e2_equalkey_L000056_85 ' JUMPV addrg
C_smd0c_686cc1e2_equalkey_L000056_84
 mov r7, #0 ' reg <- coni
C_smd0c_686cc1e2_equalkey_L000056_85
 mov r0, r7 ' CVI, CVU or LOAD
C_smd0c_686cc1e2_equalkey_L000056_57
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaH_realasize

 alignl ' align long
C_luaH__realasize ' <symbol:luaH_realasize>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__realasize_94 ' EQI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__realasize_92 ' NEU4
C_luaH__realasize_94
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRU4 reg
 jmp #JMPA
 long @C_luaH__realasize_91 ' JUMPV addrg
C_luaH__realasize_92
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRU4 reg
 mov r22, r23
 shr r22, #1 ' RSHU4 coni
 or r23, r22 ' BORI/U (1)
 mov r22, r23
 shr r22, #2 ' RSHU4 coni
 or r23, r22 ' BORI/U (1)
 mov r22, r23
 shr r22, #4 ' RSHU4 coni
 or r23, r22 ' BORI/U (1)
 mov r22, r23
 shr r22, #8 ' RSHU4 coni
 or r23, r22 ' BORI/U (1)
 mov r22, r23
 shr r22, #16 ' RSHU4 coni
 or r23, r22 ' BORI/U (1)
 add r23, #1 ' ADDU4 coni
 mov r0, r23 ' CVI, CVU or LOAD
C_luaH__realasize_91
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_smd0f_686cc1e2_ispow2realasize_L000095 ' <symbol:ispow2realasize>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_smd0f_686cc1e2_ispow2realasize_L000095_100 ' NEI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_smd0f_686cc1e2_ispow2realasize_L000095_98 ' NEU4
C_smd0f_686cc1e2_ispow2realasize_L000095_100
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_smd0f_686cc1e2_ispow2realasize_L000095_99 ' JUMPV addrg
C_smd0f_686cc1e2_ispow2realasize_L000095_98
 mov r23, #0 ' reg <- coni
C_smd0f_686cc1e2_ispow2realasize_L000095_99
 mov r0, r23 ' CVI, CVU or LOAD
' C_smd0f_686cc1e2_ispow2realasize_L000095_96 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_smd0g_686cc1e2_setlimittosize_L000101 ' <symbol:setlimittosize>
 jmp #NEWF
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__realasize ' CALL addrg
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long $ffffff7f
 mov r18, RI ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_smd0g_686cc1e2_setlimittosize_L000101_102 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_smd0h_686cc1e2_getgeneric_L000103 ' <symbol:getgeneric>
 jmp #NEWF
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd06_686cc1e2_mainpositionT_V__L000032
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_smd0h_686cc1e2_getgeneric_L000103_105
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0c_686cc1e2_equalkey_L000056
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_smd0h_686cc1e2_getgeneric_L000103_109 ' EQI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd0h_686cc1e2_getgeneric_L000103_104 ' JUMPV addrg
C_smd0h_686cc1e2_getgeneric_L000103_109
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 jmp #BRNZ
 long @C_smd0h_686cc1e2_getgeneric_L000103_111 ' NEI4
 jmp #LODL
 long @C_smd01_686cc1e2_absentkey_L000014
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_smd0h_686cc1e2_getgeneric_L000103_104 ' JUMPV addrg
C_smd0h_686cc1e2_getgeneric_L000103_111
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 adds r17, r22 ' ADDI/P (2)
 jmp #JMPA
 long @C_smd0h_686cc1e2_getgeneric_L000103_105 ' JUMPV addrg
C_smd0h_686cc1e2_getgeneric_L000103_104
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_smd0i_686cc1e2_arrayindex_L000113 ' <symbol:arrayindex>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 jmp #LODL
 long $1fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_smd0i_686cc1e2_arrayindex_L000113_115 ' GEU4
 mov r0, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd0i_686cc1e2_arrayindex_L000113_114 ' JUMPV addrg
C_smd0i_686cc1e2_arrayindex_L000113_115
 mov r0, #0 ' RET coni
C_smd0i_686cc1e2_arrayindex_L000113_114
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_smd0j_686cc1e2_findindex_L000117 ' <symbol:findindex>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_smd0j_686cc1e2_findindex_L000117_119 ' NEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_smd0j_686cc1e2_findindex_L000117_118 ' JUMPV addrg
C_smd0j_686cc1e2_findindex_L000117_119
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_smd0j_686cc1e2_findindex_L000117_122 ' NEI4
 rdlong r2, r19 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_smd0i_686cc1e2_arrayindex_L000113 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd0j_686cc1e2_findindex_L000117_123 ' JUMPV addrg
C_smd0j_686cc1e2_findindex_L000117_122
 mov r13, #0 ' reg <- coni
C_smd0j_686cc1e2_findindex_L000117_123
 mov r15, r13 ' CVI, CVU or LOAD
 mov r22, r15
 sub r22, #1 ' SUBU4 coni
 cmp r22, r17 wz,wc 
 jmp #BRAE
 long @C_smd0j_686cc1e2_findindex_L000117_124 ' GEU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd0j_686cc1e2_findindex_L000117_118 ' JUMPV addrg
C_smd0j_686cc1e2_findindex_L000117_124
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0h_686cc1e2_getgeneric_L000103
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #32 wz
 jmp #BRNZ
 long @C_smd0j_686cc1e2_findindex_L000117_126 ' NEI4
 jmp #LODL
 long @C_smd0j_686cc1e2_findindex_L000117_128_L000129
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_smd0j_686cc1e2_findindex_L000117_126
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #16 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15
 add r22, #1 ' ADDU4 coni
 mov r0, r22 ' ADDU
 add r0, r17 ' ADDU (3)
C_smd0j_686cc1e2_findindex_L000117_118
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaH_next

 alignl ' align long
C_luaH__next ' <symbol:luaH_next>
 jmp #NEWF
 jmp #PSHM
 long $feaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__realasize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0j_686cc1e2_findindex_L000117
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__next_134 ' JUMPV addrg
C_luaH__next_131
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__next_135 ' EQI4
 mov r13, r19 ' CVI, CVU or LOAD
 mov r22, r17
 add r22, #1 ' ADDU4 coni
 wrlong r22, r13 ' ASGNI4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r13, r19
 adds r13, #8 ' ADDP4 coni
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_luaH__next_130 ' JUMPV addrg
C_luaH__next_135
' C_luaH__next_132 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_luaH__next_134
 cmp r17, r15 wz,wc 
 jmp #BR_B
 long @C_luaH__next_131' LTU4
 sub r17, r15 ' SUBU (1)
 jmp #JMPA
 long @C_luaH__next_140 ' JUMPV addrg
C_luaH__next_137
 mov r22, r17
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__next_141 ' EQI4
 mov r22, r17
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r11, r19 ' CVI, CVU or LOAD
 mov r9, r13 ' CVI, CVU or LOAD
 mov r0, r11 ' CVI, CVU or LOAD
 mov r1, r9
 adds r1, #12 ' ADDP4 coni
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, r9
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r11, r19
 adds r11, #8 ' ADDP4 coni
 mov r9, r13 ' CVI, CVU or LOAD
 mov r0, r11 ' CVI, CVU or LOAD
 mov r1, r9 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, r9
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_luaH__next_130 ' JUMPV addrg
C_luaH__next_141
' C_luaH__next_138 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_luaH__next_140
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, #1 ' reg <- coni
 mov r18, r21
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r20, r18 ' LSHI/U (1)
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_luaH__next_137 ' LTI4
 mov r0, #0 ' RET coni
C_luaH__next_130
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_smd0l_686cc1e2_freehash_L000143 ' <symbol:freehash>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_smd0l_686cc1e2_freehash_L000143_145 ' EQU4
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 mov r2, r22
 shl r2, #4 ' LSHU4 coni
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
C_smd0l_686cc1e2_freehash_L000143_145
' C_smd0l_686cc1e2_freehash_L000143_144 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_smd0m_686cc1e2_computesizes_L000147 ' <symbol:computesizes>
 jmp #PSHM
 long $fa8000 ' save registers
 mov r21, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 mov r15, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_smd0m_686cc1e2_computesizes_L000147_152 ' JUMPV addrg
C_smd0m_686cc1e2_computesizes_L000147_149
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 adds r22, r3 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r21, r22 ' ADDU (1)
 mov r22, r23
 shr r22, #1 ' RSHU4 coni
 cmp r21, r22 wz,wc 
 jmp #BRBE
 long @C_smd0m_686cc1e2_computesizes_L000147_153 ' LEU4
 mov r15, r23 ' CVI, CVU or LOAD
 mov r17, r21 ' CVI, CVU or LOAD
C_smd0m_686cc1e2_computesizes_L000147_153
' C_smd0m_686cc1e2_computesizes_L000147_150 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 shl r23, #1 ' LSHU4 coni
C_smd0m_686cc1e2_computesizes_L000147_152
 cmp r23,  #0 wz
 jmp #BR_Z
 long @C_smd0m_686cc1e2_computesizes_L000147_155 ' EQU4
 rdlong r22, r2 ' reg <- INDIRU4 reg
 mov r20, r23
 shr r20, #1 ' RSHU4 coni
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_smd0m_686cc1e2_computesizes_L000147_149 ' GTU4
C_smd0m_686cc1e2_computesizes_L000147_155
 wrlong r17, r2 ' ASGNU4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_smd0m_686cc1e2_computesizes_L000147_148 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_smd0n_686cc1e2_countint_L000156 ' <symbol:countint>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_smd0i_686cc1e2_arrayindex_L000113 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_smd0n_686cc1e2_countint_L000156_158 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaO__ceillog2 ' CALL addrg
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_smd0n_686cc1e2_countint_L000156_157 ' JUMPV addrg
C_smd0n_686cc1e2_countint_L000156_158
 mov r0, #0 ' RET coni
C_smd0n_686cc1e2_countint_L000156_157
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_smd0o_686cc1e2_numusearray_L000160 ' <symbol:numusearray>
 jmp #PSHM
 long $faa800 ' save registers
 mov r15, #0 ' reg <- coni
 mov r23, #1 ' reg <- coni
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRU4 reg
 mov r21, #0 ' reg <- coni
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_smd0o_686cc1e2_numusearray_L000160_165 ' JUMPV addrg
C_smd0o_686cc1e2_numusearray_L000160_162
 mov r11, #0 ' reg <- coni
 mov r13, r19 ' CVI, CVU or LOAD
 cmp r13, r17 wz,wc 
 jmp #BRBE
 long @C_smd0o_686cc1e2_numusearray_L000160_173 ' LEU4
 mov r13, r17 ' CVI, CVU or LOAD
 cmp r23, r13 wz,wc 
 jmp #BRBE
 long @C_smd0o_686cc1e2_numusearray_L000160_173 ' LEU4
 jmp #JMPA
 long @C_smd0o_686cc1e2_numusearray_L000160_164 ' JUMPV addrg
C_smd0o_686cc1e2_numusearray_L000160_170
 mov r22, r23
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_smd0o_686cc1e2_numusearray_L000160_174 ' EQI4
 add r11, #1 ' ADDU4 coni
C_smd0o_686cc1e2_numusearray_L000160_174
' C_smd0o_686cc1e2_numusearray_L000160_171 ' (symbol refcount = 0)
 add r23, #1 ' ADDU4 coni
C_smd0o_686cc1e2_numusearray_L000160_173
 cmp r23, r13 wz,wc 
 jmp #BRBE
 long @C_smd0o_686cc1e2_numusearray_L000160_170 ' LEU4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 adds r22, r2 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r11 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 add r15, r11 ' ADDU (1)
' C_smd0o_686cc1e2_numusearray_L000160_163 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 shl r19, #1 ' LSHU4 coni
C_smd0o_686cc1e2_numusearray_L000160_165
 cmps r21,  #31 wz,wc
 jmp #BRBE
 long @C_smd0o_686cc1e2_numusearray_L000160_162 ' LEI4
C_smd0o_686cc1e2_numusearray_L000160_164
 mov r0, r15 ' CVI, CVU or LOAD
' C_smd0o_686cc1e2_numusearray_L000160_161 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_smd0p_686cc1e2_numusehash_L000176 ' <symbol:numusehash>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r17, r22 ' LSHI/U
 shl r17, r20 ' LSHI/U (3)
 jmp #JMPA
 long @C_smd0p_686cc1e2_numusehash_L000176_179 ' JUMPV addrg
C_smd0p_686cc1e2_numusehash_L000176_178
 mov r22, r17
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_smd0p_686cc1e2_numusehash_L000176_181 ' EQI4
 mov r22, r11
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_smd0p_686cc1e2_numusehash_L000176_183 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r11
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0n_686cc1e2_countint_L000156
 add SP, #4 ' CALL addrg
 adds r13, r0 ' ADDI/P (1)
C_smd0p_686cc1e2_numusehash_L000176_183
 adds r15, #1 ' ADDI4 coni
C_smd0p_686cc1e2_numusehash_L000176_181
C_smd0p_686cc1e2_numusehash_L000176_179
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 subs r17, #1 ' SUBI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_smd0p_686cc1e2_numusehash_L000176_178 ' NEI4
 rdlong r22, r19 ' reg <- INDIRU4 reg
 mov r20, r13 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (1)
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_smd0p_686cc1e2_numusehash_L000176_177 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_smd0q_686cc1e2_setnodevector_L000185 ' <symbol:setnodevector>
 jmp #NEWF
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmp r19,  #0 wz
 jmp #BRNZ
 long @C_smd0q_686cc1e2_setnodevector_L000185_187 ' NEU4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long @C_smd0_686cc1e2_dummynode__L000013
 mov r20, RI ' reg <- addrg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #7 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_smd0q_686cc1e2_setnodevector_L000185_188 ' JUMPV addrg
C_smd0q_686cc1e2_setnodevector_L000185_187
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaO__ceillog2 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #30 wz,wc
 jmp #BR_A
 long @C_smd0q_686cc1e2_setnodevector_L000185_191 ' GTI4
 mov r22, #1 ' reg <- coni
 shl r22, r15 ' LSHI/U (1)
 jmp #LODL
 long $fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_smd0q_686cc1e2_setnodevector_L000185_189 ' LEU4
C_smd0q_686cc1e2_setnodevector_L000185_191
 jmp #LODL
 long @C_smd0q_686cc1e2_setnodevector_L000185_192_L000193
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_smd0q_686cc1e2_setnodevector_L000185_189
 mov r22, #1 ' reg <- coni
 shl r22, r15 ' LSHI/U (1)
 mov r19, r22 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r19
 shl r3, #4 ' LSHU4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_smd0q_686cc1e2_setnodevector_L000185_197 ' JUMPV addrg
C_smd0q_686cc1e2_setnodevector_L000185_194
 mov r22, r17
 shl r22, #4 ' LSHI4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r13
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_smd0q_686cc1e2_setnodevector_L000185_195 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_smd0q_686cc1e2_setnodevector_L000185_197
 mov r22, r19 ' CVI, CVU or LOAD
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_smd0q_686cc1e2_setnodevector_L000185_194 ' LTI4
 mov r22, r21
 adds r22, #7 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, r19
 shl r20, #4 ' LSHU4 coni
 mov r18, r21
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_smd0q_686cc1e2_setnodevector_L000185_188
' C_smd0q_686cc1e2_setnodevector_L000185_186 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_smd0s_686cc1e2_reinsert_L000198 ' <symbol:reinsert>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r15, r22 ' LSHI/U
 shl r15, r20 ' LSHI/U (3)
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_smd0s_686cc1e2_reinsert_L000198_203 ' JUMPV addrg
C_smd0s_686cc1e2_reinsert_L000198_200
 mov r22, r17
 shl r22, #4 ' LSHI4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_smd0s_686cc1e2_reinsert_L000198_204 ' EQI4
 mov r11, FP
 sub r11, #-(-12) ' reg <- addrli
 mov r9, r13 ' CVI, CVU or LOAD
 mov r0, r11 ' CVI, CVU or LOAD
 mov r1, r9
 adds r1, #12 ' ADDP4 coni
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, r9
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__set
 add SP, #12 ' CALL addrg
C_smd0s_686cc1e2_reinsert_L000198_204
' C_smd0s_686cc1e2_reinsert_L000198_201 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_smd0s_686cc1e2_reinsert_L000198_203
 cmps r17, r15 wz,wc
 jmp #BR_B
 long @C_smd0s_686cc1e2_reinsert_L000198_200 ' LTI4
' C_smd0s_686cc1e2_reinsert_L000198_199 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_smd0t_686cc1e2_exchangehashpart_L000206 ' <symbol:exchangehashpart>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r3
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 jmp #LODF
 long -8
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r3
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r3
 adds r22, #7 ' ADDP4 coni
 mov r20, r2
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 mov r20, r2
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #20 ' ADDP4 coni
 mov r20, r2
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #7 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
' C_smd0t_686cc1e2_exchangehashpart_L000206_207 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export luaH_resize

 alignl ' align long
C_luaH__resize ' <symbol:luaH_resize>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_smd0g_686cc1e2_setlimittosize_L000101 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0q_686cc1e2_setnodevector_L000185
 add SP, #8 ' CALL addrg
 cmp r19, r13 wz,wc 
 jmp #BRAE
 long @C_luaH__resize_209 ' GEU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0t_686cc1e2_exchangehashpart_L000206
 add SP, #4 ' CALL addrg
 mov r15, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__resize_214 ' JUMPV addrg
C_luaH__resize_211
 mov r22, r15
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__resize_215 ' EQI4
 mov r22, r15
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r22, r15
 add r22, #1 ' ADDU4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__setint
 add SP, #12 ' CALL addrg
C_luaH__resize_215
' C_luaH__resize_212 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_luaH__resize_214
 cmp r15, r13 wz,wc 
 jmp #BR_B
 long @C_luaH__resize_211' LTU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 wrlong r13, r22 ' ASGNU4 reg reg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0t_686cc1e2_exchangehashpart_L000206
 add SP, #4 ' CALL addrg
C_luaH__resize_209
 mov r2, r19
 shl r2, #3 ' LSHU4 coni
 mov r3, r13
 shl r3, #3 ' LSHU4 coni
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__realloc_
 add SP, #12 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r20, r11 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_luaH__resize_217 ' NEU4
 cmp r19, r22 wz
 jmp #BR_Z
 long @C_luaH__resize_217 ' EQU4
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0l_686cc1e2_freehash_L000143
 add SP, #4 ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
C_luaH__resize_217
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0t_686cc1e2_exchangehashpart_L000206
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 wrlong r11, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r15, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__resize_222 ' JUMPV addrg
C_luaH__resize_219
 mov r22, r15
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_luaH__resize_220 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_luaH__resize_222
 cmp r15, r19 wz,wc 
 jmp #BR_B
 long @C_luaH__resize_219' LTU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0s_686cc1e2_reinsert_L000198
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0l_686cc1e2_freehash_L000143
 add SP, #4 ' CALL addrg
' C_luaH__resize_208 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


' Catalina Export luaH_resizearray

 alignl ' align long
C_luaH__resizearray ' <symbol:luaH_resizearray>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__resizearray_225 ' NEU4
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaH__resizearray_226 ' JUMPV addrg
C_luaH__resizearray_225
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r17, r22 ' LSHI/U
 shl r17, r20 ' LSHI/U (3)
C_luaH__resizearray_226
 jmp #LODF
 long -8
 wrlong r17, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__resize
 add SP, #12 ' CALL addrg
' C_luaH__resizearray_223 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_smd0u_686cc1e2_rehash_L000227 ' <symbol:rehash>
 jmp #NEWF
 sub SP, #136
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
C_smd0u_686cc1e2_rehash_L000227_229
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-132) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
' C_smd0u_686cc1e2_rehash_L000227_230 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #31 wz,wc
 jmp #BRBE
 long @C_smd0u_686cc1e2_rehash_L000227_229 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_smd0g_686cc1e2_setlimittosize_L000101 ' CALL addrg
 mov r2, FP
 sub r2, #-(-132) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0o_686cc1e2_numusearray_L000160
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -136
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r15, r22 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-132) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0p_686cc1e2_numusehash_L000176
 add SP, #8 ' CALL addrg
 adds r15, r0 ' ADDI/P (1)
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_smd0u_686cc1e2_rehash_L000227_233 ' NEI4
 mov r2, FP
 sub r2, #-(-132) ' reg ARG ADDRLi
 rdlong r3, r19 ' reg <- INDIRI4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0n_686cc1e2_countint_L000156
 add SP, #4 ' CALL addrg
 mov r20, FP
 sub r20, #-(-136) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r22, r0 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (2)
 jmp #LODF
 long -136
 wrlong r22, RI ' ASGNU4 addrl reg
C_smd0u_686cc1e2_rehash_L000227_233
 adds r15, #1 ' ADDI4 coni
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-132) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0m_686cc1e2_computesizes_L000147
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -140
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-136) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r2, r22 ' SUBU
 sub r2, r20 ' SUBU (3)
 mov RI, FP
 sub RI, #-(-140)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__resize
 add SP, #12 ' CALL addrg
' C_smd0u_686cc1e2_rehash_L000227_228 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #136 ' framesize
 jmp #RETF


' Catalina Export luaH_new

 alignl ' align long
C_luaH__new ' <symbol:luaH_new>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #32 ' reg ARG coni
 mov r3, #5 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__newobj
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, #63 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0q_686cc1e2_setnodevector_L000185
 add SP, #8 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
' C_luaH__new_235 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaH_free

 alignl ' align long
C_luaH__free ' <symbol:luaH_free>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0l_686cc1e2_freehash_L000143
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__realasize ' CALL addrg
 mov r2, r0
 shl r2, #3 ' LSHU4 coni
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r2, #32 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
' C_luaH__free_236 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_smd0v_686cc1e2_getfreepos_L000237 ' <symbol:getfreepos>
 jmp #PSHM
 long $540000 ' save registers
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_smd0v_686cc1e2_getfreepos_L000237_239 ' EQU4
 jmp #JMPA
 long @C_smd0v_686cc1e2_getfreepos_L000237_242 ' JUMPV addrg
C_smd0v_686cc1e2_getfreepos_L000237_241
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -16
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_smd0v_686cc1e2_getfreepos_L000237_244 ' NEI4
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_smd0v_686cc1e2_getfreepos_L000237_238 ' JUMPV addrg
C_smd0v_686cc1e2_getfreepos_L000237_244
C_smd0v_686cc1e2_getfreepos_L000237_242
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r2
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_smd0v_686cc1e2_getfreepos_L000237_241 ' GTU4
C_smd0v_686cc1e2_getfreepos_L000237_239
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_smd0v_686cc1e2_getfreepos_L000237_238
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaH_newkey

 alignl ' align long
C_luaH__newkey ' <symbol:luaH_newkey>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $ffa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__newkey_247 ' NEI4
 jmp #LODL
 long @C_luaH__newkey_249_L000250
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaH__newkey_248 ' JUMPV addrg
C_luaH__newkey_247
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaH__newkey_251 ' NEI4
 rdlong r22, r19 ' reg <- INDIRF4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaH__newkey_253 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r19, FP
 sub r19, #-(-12) ' reg <- addrli
 jmp #JMPA
 long @C_luaH__newkey_254 ' JUMPV addrg
C_luaH__newkey_253
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_Z
 long @C_luaH__newkey_255 ' EQF4
 jmp #LODL
 long @C_luaH__newkey_257_L000258
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaH__newkey_255
C_luaH__newkey_254
C_luaH__newkey_251
C_luaH__newkey_248
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__newkey_259 ' NEI4
 jmp #JMPA
 long @C_luaH__newkey_246 ' JUMPV addrg
C_luaH__newkey_259
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd06_686cc1e2_mainpositionT_V__L000032
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__newkey_263 ' NEI4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__newkey_261 ' NEU4
C_luaH__newkey_263
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_smd0v_686cc1e2_getfreepos_L000237 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__newkey_264 ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0u_686cc1e2_rehash_L000227
 add SP, #8 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__set
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_luaH__newkey_246 ' JUMPV addrg
C_luaH__newkey_264
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0b_686cc1e2_mainpositionfromnode_L000054
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_luaH__newkey_266 ' EQU4
 jmp #JMPA
 long @C_luaH__newkey_269 ' JUMPV addrg
C_luaH__newkey_268
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 adds r13, r22 ' ADDI/P (2)
C_luaH__newkey_269
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaH__newkey_268 ' NEU4
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov r20, r11 ' CVI, CVU or LOAD
 mov r18, r13 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, #16 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 wrlong r0, r22 ' ASGNI4 reg reg
 mov r0, r11 ' CVI, CVU or LOAD
 mov r1, r15 ' CVI, CVU or LOAD
 jmp #CPYB
 long 16 ' ASGNB
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__newkey_271 ' EQI4
 mov r22, r11
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r15 ' CVI, CVU or LOAD
 mov r16, r11 ' CVI, CVU or LOAD
 sub r18, r16 ' SUBU (1)
 mov r16, #16 ' reg <- coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 adds r20, r0 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_luaH__newkey_271
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaH__newkey_267 ' JUMPV addrg
C_luaH__newkey_266
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__newkey_273 ' EQI4
 mov r22, r11
 adds r22, #8 ' ADDP4 coni
 mov r20, r15
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #4 ' LSHI4 coni
 adds r20, r15 ' ADDI/P (1)
 mov r18, r11 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, #16 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 wrlong r0, r22 ' ASGNI4 reg reg
C_luaH__newkey_273
' C_luaH__newkey_274 ' (symbol refcount = 0)
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov r20, r11 ' CVI, CVU or LOAD
 mov r18, r15 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, #16 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 wrlong r0, r22 ' ASGNI4 reg reg
 mov r15, r11 ' CVI, CVU or LOAD
C_luaH__newkey_267
C_luaH__newkey_261
 mov r13, r15 ' CVI, CVU or LOAD
 mov r11, r19 ' CVI, CVU or LOAD
 mov r0, r13
 adds r0, #12 ' ADDP4 coni
 mov r1, r11 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #5 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaH__newkey_276 ' EQI4
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaH__newkey_276 ' EQI4
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaH__newkey_276 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaH__newkey_276 ' JUMPV addrg
C_luaH__newkey_276
 mov r13, r15 ' CVI, CVU or LOAD
 mov r11, r17 ' CVI, CVU or LOAD
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaH__newkey_246
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


' Catalina Export luaH_getint

 alignl ' align long
C_luaH__getint ' <symbol:luaH_getint>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_luaH__getint_278 ' GEU4
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_luaH__getint_277 ' JUMPV addrg
C_luaH__getint_278
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getint_280 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r20, r22 ' BANDI/U (2)
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_luaH__getint_280 ' EQU4
 mov r20, r21 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_luaH__getint_282 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__realasize ' CALL addrg
 sub r20, #1 ' SUBU4 coni
 cmp r20, r0 wz,wc 
 jmp #BRAE
 long @C_luaH__getint_280 ' GEU4
C_luaH__getint_282
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_luaH__getint_277 ' JUMPV addrg
C_luaH__getint_280
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd02_686cc1e2_hashint_L000015
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_luaH__getint_283
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaH__getint_287 ' NEI4
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r21 wz
 jmp #BRNZ
 long @C_luaH__getint_287 ' NEI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__getint_277 ' JUMPV addrg
C_luaH__getint_287
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRI4 reg
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_luaH__getint_289 ' NEI4
 jmp #JMPA
 long @C_luaH__getint_285 ' JUMPV addrg
C_luaH__getint_289
 mov r22, r17
 shl r22, #4 ' LSHI4 coni
 adds r19, r22 ' ADDI/P (2)
 jmp #JMPA
 long @C_luaH__getint_283 ' JUMPV addrg
C_luaH__getint_285
 jmp #LODL
 long @C_smd01_686cc1e2_absentkey_L000014
 mov r0, RI ' reg <- addrg
C_luaH__getint_277
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaH_getshortstr

 alignl ' align long
C_luaH__getshortstr ' <symbol:luaH_getshortstr>
 jmp #PSHM
 long $f40000 ' save registers
 mov r22, #1 ' reg <- coni
 mov r20, r2
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r3
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 and r22, r20 ' BANDI/U (2)
 shl r22, #4 ' LSHI4 coni
 mov r20, r3
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r23, r22 ' ADDI/P
 adds r23, r20 ' ADDI/P (3)
C_luaH__getshortstr_292
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #68 wz
 jmp #BRNZ
 long @C_luaH__getshortstr_296 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaH__getshortstr_296 ' NEU4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__getshortstr_291 ' JUMPV addrg
C_luaH__getshortstr_296
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRI4 reg
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_luaH__getshortstr_298 ' NEI4
 jmp #LODL
 long @C_smd01_686cc1e2_absentkey_L000014
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_luaH__getshortstr_291 ' JUMPV addrg
C_luaH__getshortstr_298
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 adds r23, r22 ' ADDI/P (2)
 jmp #JMPA
 long @C_luaH__getshortstr_292 ' JUMPV addrg
C_luaH__getshortstr_291
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaH_getstr

 alignl ' align long
C_luaH__getstr ' <symbol:luaH_getstr>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #4 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaH__getstr_301 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__getstr_300 ' JUMPV addrg
C_luaH__getstr_301
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -20
 wrlong r21, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0h_686cc1e2_getgeneric_L000103
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaH__getstr_300
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export luaH_get

 alignl ' align long
C_luaH__get ' <symbol:luaH_get>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r22
 and r19, #63 ' BANDI4 coni
 mov r22, #0 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_luaH__get_309 ' EQI4
 cmps r19,  #3 wz
 jmp #BR_Z
 long @C_luaH__get_308 ' EQI4
 cmps r19,  #4 wz
 jmp #BR_Z
 long @C_luaH__get_307 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_luaH__get_304 ' LTI4
' C_luaH__get_313 ' (symbol refcount = 0)
 cmps r19,  #19 wz
 jmp #BR_Z
 long @C_luaH__get_310 ' EQI4
 jmp #JMPA
 long @C_luaH__get_304 ' JUMPV addrg
C_luaH__get_307
 rdlong r2, r21 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__get_303 ' JUMPV addrg
C_luaH__get_308
 rdlong r2, r21 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__get_303 ' JUMPV addrg
C_luaH__get_309
 jmp #LODL
 long @C_smd01_686cc1e2_absentkey_L000014
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_luaH__get_303 ' JUMPV addrg
C_luaH__get_310
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 rdlong r4, r21 ' reg <- INDIRF4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaH__get_311 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__get_303 ' JUMPV addrg
C_luaH__get_311
C_luaH__get_304
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd0h_686cc1e2_getgeneric_L000103
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaH__get_303
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaH_finishset

 alignl ' align long
C_luaH__finishset ' <symbol:luaH_finishset>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #32 wz
 jmp #BRNZ
 long @C_luaH__finishset_315 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__newkey
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_luaH__finishset_316 ' JUMPV addrg
C_luaH__finishset_315
 jmp #LODF
 long -8
 wrlong r19, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -12
 wrlong r17, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaH__finishset_316
' C_luaH__finishset_314 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaH_set

 alignl ' align long
C_luaH__set ' <symbol:luaH_set>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaH__finishset
 add SP, #16 ' CALL addrg
' C_luaH__set_317 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaH_setint

 alignl ' align long
C_luaH__setint ' <symbol:luaH_setint>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #32 wz
 jmp #BRNZ
 long @C_luaH__setint_319 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__newkey
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_luaH__setint_320 ' JUMPV addrg
C_luaH__setint_319
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -16
 wrlong r17, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaH__setint_320
' C_luaH__setint_318 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_smd012_686cc1e2_hash_search_L000321 ' <symbol:hash_search>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmp r21,  #0 wz
 jmp #BRNZ
 long @C_smd012_686cc1e2_hash_search_L000321_323 ' NEU4
 add r21, #1 ' ADDU4 coni
C_smd012_686cc1e2_hash_search_L000321_323
C_smd012_686cc1e2_hash_search_L000321_325
 mov r19, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long $3fffffff
 mov r22, RI ' reg <- con
 cmp r21, r22 wz,wc 
 jmp #BR_A
 long @C_smd012_686cc1e2_hash_search_L000321_328 ' GTU4
 shl r21, #1 ' LSHU4 coni
 jmp #JMPA
 long @C_smd012_686cc1e2_hash_search_L000321_329 ' JUMPV addrg
C_smd012_686cc1e2_hash_search_L000321_328
 jmp #LODL
 long $7fffffff
 mov r21, RI ' reg <- con
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_smd012_686cc1e2_hash_search_L000321_330 ' NEI4
 jmp #JMPA
 long @C_smd012_686cc1e2_hash_search_L000321_333 ' JUMPV addrg
C_smd012_686cc1e2_hash_search_L000321_330
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd012_686cc1e2_hash_search_L000321_322 ' JUMPV addrg
C_smd012_686cc1e2_hash_search_L000321_329
' C_smd012_686cc1e2_hash_search_L000321_326 ' (symbol refcount = 0)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_smd012_686cc1e2_hash_search_L000321_325 ' NEI4
 jmp #JMPA
 long @C_smd012_686cc1e2_hash_search_L000321_333 ' JUMPV addrg
C_smd012_686cc1e2_hash_search_L000321_332
 mov r22, r19 ' ADDU
 add r22, r21 ' ADDU (3)
 mov r17, r22
 shr r17, #1 ' RSHU4 coni
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_smd012_686cc1e2_hash_search_L000321_335 ' NEI4
 mov r21, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd012_686cc1e2_hash_search_L000321_336 ' JUMPV addrg
C_smd012_686cc1e2_hash_search_L000321_335
 mov r19, r17 ' CVI, CVU or LOAD
C_smd012_686cc1e2_hash_search_L000321_336
C_smd012_686cc1e2_hash_search_L000321_333
 mov r22, r21 ' SUBU
 sub r22, r19 ' SUBU (3)
 cmp r22,  #1 wz,wc 
 jmp #BR_A
 long @C_smd012_686cc1e2_hash_search_L000321_332 ' GTU4
 mov r0, r19 ' CVI, CVU or LOAD
C_smd012_686cc1e2_hash_search_L000321_322
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_smd013_686cc1e2_binsearch_L000337 ' <symbol:binsearch>
 jmp #PSHM
 long $c00000 ' save registers
 jmp #JMPA
 long @C_smd013_686cc1e2_binsearch_L000337_340 ' JUMPV addrg
C_smd013_686cc1e2_binsearch_L000337_339
 mov r22, r3 ' ADDU
 add r22, r2 ' ADDU (3)
 mov r23, r22
 shr r23, #1 ' RSHU4 coni
 mov r22, r23
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 adds r22, r4 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_smd013_686cc1e2_binsearch_L000337_342 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_smd013_686cc1e2_binsearch_L000337_343 ' JUMPV addrg
C_smd013_686cc1e2_binsearch_L000337_342
 mov r3, r23 ' CVI, CVU or LOAD
C_smd013_686cc1e2_binsearch_L000337_343
C_smd013_686cc1e2_binsearch_L000337_340
 mov r22, r2 ' SUBU
 sub r22, r3 ' SUBU (3)
 cmp r22,  #1 wz,wc 
 jmp #BR_A
 long @C_smd013_686cc1e2_binsearch_L000337_339 ' GTU4
 mov r0, r3 ' CVI, CVU or LOAD
' C_smd013_686cc1e2_binsearch_L000337_338 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaH_getn

 alignl ' align long
C_luaH__getn ' <symbol:luaH_getn>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRU4 reg
 cmp r21,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_345 ' EQU4
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__getn_345 ' NEI4
 mov r22, #2 ' reg <- coni
 cmp r21, r22 wz,wc 
 jmp #BR_B
 long @C_luaH__getn_347' LTU4
 mov r22, r21
 sub r22, #2 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_347 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_smd0f_686cc1e2_ispow2realasize_L000095 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_349 ' EQI4
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_349 ' EQU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, r21
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #128 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaH__getn_349
 mov r0, r21
 sub r0, #1 ' SUBU4 coni
 jmp #JMPA
 long @C_luaH__getn_344 ' JUMPV addrg
C_luaH__getn_347
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd013_686cc1e2_binsearch_L000337
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_smd0f_686cc1e2_ispow2realasize_L000095 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_351 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__realasize ' CALL addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r22, r0
 shr r22, #1 ' RSHU4 coni
 cmp r20, r22 wz,wc 
 jmp #BRBE
 long @C_luaH__getn_351 ' LEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #128 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaH__getn_351
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
 jmp #JMPA
 long @C_luaH__getn_344 ' JUMPV addrg
C_luaH__getn_345
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_353 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_353 ' EQU4
 mov r22, r21
 shl r22, #3 ' LSHU4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__getn_355 ' NEI4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__getn_344 ' JUMPV addrg
C_luaH__getn_355
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__realasize ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__getn_357 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd013_686cc1e2_binsearch_L000337
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
 jmp #JMPA
 long @C_luaH__getn_344 ' JUMPV addrg
C_luaH__getn_357
C_luaH__getn_353
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_361 ' EQU4
 mov r22, r21
 add r22, #1 ' ADDU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__getn_359 ' NEI4
C_luaH__getn_361
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__getn_344 ' JUMPV addrg
C_luaH__getn_359
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smd012_686cc1e2_hash_search_L000321
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaH__getn_344
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import luaV_flttointeger

' Catalina Import luaS_eqlngstr

' Catalina Import luaS_hashlongstr

' Catalina Import luaC_barrierback_

' Catalina Import luaC_newobj

' Catalina Import luaD_throw

' Catalina Import luaG_runerror

' Catalina Import luaM_malloc_

' Catalina Import luaM_free_

' Catalina Import luaM_realloc_

' Catalina Import luaO_ceillog2

' Catalina Import frexp

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaH__newkey_257_L000258 ' <symbol:257>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 32
 byte 105
 byte 115
 byte 32
 byte 78
 byte 97
 byte 78
 byte 0

 alignl ' align long
C_luaH__newkey_249_L000250 ' <symbol:249>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 32
 byte 105
 byte 115
 byte 32
 byte 110
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_smd0q_686cc1e2_setnodevector_L000185_192_L000193 ' <symbol:192>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 111
 byte 118
 byte 101
 byte 114
 byte 102
 byte 108
 byte 111
 byte 119
 byte 0

 alignl ' align long
C_smd0j_686cc1e2_findindex_L000117_128_L000129 ' <symbol:128>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 107
 byte 101
 byte 121
 byte 32
 byte 116
 byte 111
 byte 32
 byte 39
 byte 110
 byte 101
 byte 120
 byte 116
 byte 39
 byte 0

 alignl ' align long
C_smd03_686cc1e2_l_hashfloat_L000019_26_L000027 ' <symbol:26>
 long $cf000000 ' float

 alignl ' align long
C_smd03_686cc1e2_l_hashfloat_L000019_21_L000022 ' <symbol:21>
 long $4f000000 ' float

' Catalina Code

DAT ' code segment
' end
