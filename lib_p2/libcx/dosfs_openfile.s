' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_OpenFile

 alignl ' align long
C_D_F_S__O_penF_ile ' <symbol:DFS_OpenFile>
 PRIMITIVE(#NEWF)
 sub SP, #132
 PRIMITIVE(#PSHM)
 long $feaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, #28 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, r17
 adds r22, #9 ' ADDP4 coni
 wrbyte r21, r22 ' ASGNU1 reg reg
 mov r2, #64 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-96) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -33
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r2, FP
 sub r2, #-(-96) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_9 ' EQI4
 mov r0, #4 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_8
 mov r2, FP
 sub r2, #-(-95) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-96) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcpy
 add SP, #4 ' CALL addrg
C_D_F_S__O_penF_ile_9
 mov r22, FP
 sub r22, #-(-96) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_8 ' EQI4
 mov r15, FP
 sub r15, #-(-96) ' reg <- addrli
C_D_F_S__O_penF_ile_12
' C_D_F_S__O_penF_ile_13 ' (symbol refcount = 0)
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__O_penF_ile_12 ' NEI4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 adds r15, r22 ' ADDI/P (1)
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_16 ' JUMPV addrg
C_D_F_S__O_penF_ile_15
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 adds r15, r22 ' ADDI/P (1)
C_D_F_S__O_penF_ile_16
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-96) ' reg <- addrli
 cmp r22, r20 wcz 
 PRIMITIVE(#BRBE)
 long @C_D_F_S__O_penF_ile_18 ' LEU4
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__O_penF_ile_15 ' NEI4
C_D_F_S__O_penF_ile_18
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__O_penF_ile_19 ' NEI4
 adds r15, #1 ' ADDP4 coni
C_D_F_S__O_penF_ile_19
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-124) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__C_anonicalT_oD_ir
 add SP, #4 ' CALL addrg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-96) ' reg <- addrli
 cmp r22, r20 wcz 
 PRIMITIVE(#BRBE)
 long @C_D_F_S__O_penF_ile_21 ' LEU4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 adds r15, r22 ' ADDI/P (1)
C_D_F_S__O_penF_ile_21
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_25 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-96) ' reg <- addrli
 cmp r22, r20 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__O_penF_ile_23 ' NEU4
C_D_F_S__O_penF_ile_25
 mov r22, #0 ' reg <- coni
 wrbyte r22, r15 ' ASGNU1 reg reg
C_D_F_S__O_penF_ile_23
 PRIMITIVE(#LODF)
 long -104
 wrlong r19, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODF)
 long -128
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-96) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__O_penD_ir
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_30 ' EQU4
 mov r0, #3 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_29
 mov r2, #11 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-124) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__O_penF_ile_32 ' NEI4
 mov r22, FP
 sub r22, #-(-21) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_34 ' EQI4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #6 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_34 ' EQI4
 cmps r22,  #4 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_34 ' EQI4
 mov r0, #3 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_34
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__O_penF_ile_37 ' NEU4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-108) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_38 ' JUMPV addrg
C_D_F_S__O_penF_ile_37
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-112) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 mov r18, r22
 adds r18, #20 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r18, r17
 adds r18, #4 ' ADDP4 coni
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r0 ' ADDU (1)
 mov r20, FP
 sub r20, #-(-108) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 add r22, r20 ' ADDU (1)
 wrlong r22, r18 ' ASGNU4 reg reg
C_D_F_S__O_penF_ile_38
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-107) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 subs r20, #1 ' SUBI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__O_penF_ile_42 ' NEI4
 mov r22, r17
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-6) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, FP
 sub r18, #-(-5) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #8 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #16 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, FP
 sub r18, #-(-11) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #24 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_43 ' JUMPV addrg
C_D_F_S__O_penF_ile_42
 mov r22, r17
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-6) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, FP
 sub r18, #-(-5) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #8 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_D_F_S__O_penF_ile_43
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov r20, r17
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, FP
 sub r18, #-(-3) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #8 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, FP
 sub r18, #-(-2) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #16 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, FP
 sub r18, #-(-1) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #24 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, #0 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_32
C_D_F_S__O_penF_ile_30
 mov r2, FP
 sub r2, #-(-32) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-112) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__G_etN_ext
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_29 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_54 ' EQI4
 mov r2, FP
 sub r2, #-(-32) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-112) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-96) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__G_etF_reeD_irE_nt
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_56 ' EQI4
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_56
 mov r2, #32 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-124) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, #32 ' reg <- coni
 PRIMITIVE(#LODF)
 long -18
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #8 ' reg <- coni
 PRIMITIVE(#LODF)
 long -17
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #17 ' reg <- coni
 PRIMITIVE(#LODF)
 long -16
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #52 ' reg <- coni
 PRIMITIVE(#LODF)
 long -15
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #17 ' reg <- coni
 PRIMITIVE(#LODF)
 long -14
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #52 ' reg <- coni
 PRIMITIVE(#LODF)
 long -13
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #32 ' reg <- coni
 PRIMITIVE(#LODF)
 long -10
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #8 ' reg <- coni
 PRIMITIVE(#LODF)
 long -9
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #17 ' reg <- coni
 PRIMITIVE(#LODF)
 long -8
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #52 ' reg <- coni
 PRIMITIVE(#LODF)
 long -7
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #6 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__O_penF_ile_68 ' NEI4
 mov r22, FP
 sub r22, #-(-21) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 or r22, #16 ' BORI4 coni
 PRIMITIVE(#LODF)
 long -21
 wrbyte r22, RI ' ASGNU1 addrl reg
C_D_F_S__O_penF_ile_68
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__G_etF_reeF_A_T_
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13
 and r22, #255 ' BANDU4 coni
 PRIMITIVE(#LODF)
 long -6
 wrbyte r22, RI ' ASGNU1 addrl reg
 PRIMITIVE(#LODL)
 long $ff00
 mov r22, RI ' reg <- con
 and r22, r13 ' BANDI/U (2)
 shr r22, #8 ' RSHU4 coni
 PRIMITIVE(#LODF)
 long -5
 wrbyte r22, RI ' ASGNU1 addrl reg
 PRIMITIVE(#LODL)
 long $ff0000
 mov r22, RI ' reg <- con
 and r22, r13 ' BANDI/U (2)
 shr r22, #16 ' RSHU4 coni
 PRIMITIVE(#LODF)
 long -12
 wrbyte r22, RI ' ASGNU1 addrl reg
 PRIMITIVE(#LODL)
 long $ff000000
 mov r22, RI ' reg <- con
 and r22, r13 ' BANDI/U (2)
 shr r22, #24 ' RSHU4 coni
 PRIMITIVE(#LODF)
 long -11
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__O_penF_ile_75 ' NEU4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-108) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_76 ' JUMPV addrg
C_D_F_S__O_penF_ile_75
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-112) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 mov r18, r22
 adds r18, #20 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r18, r17
 adds r18, #4 ' ADDP4 coni
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r0 ' ADDU (1)
 mov r20, FP
 sub r20, #-(-108) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 add r22, r20 ' ADDU (1)
 wrlong r22, r18 ' ASGNU4 reg reg
C_D_F_S__O_penF_ile_76
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-107) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 subs r20, #1 ' SUBI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #20 ' ADDP4 coni
 wrlong r13, r22 ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 wrlong r13, r22 ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r4, r19 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_80 ' EQU4
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_80
 mov r2, #32 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-32) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-107) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 shl r22, #5 ' LSHI4 coni
 subs r22, #32 ' SUBI4 coni
 mov r4, r22 ' ADDI/P
 adds r4, r19 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r4, r19 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_83 ' EQU4
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_83
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r11, r22 ' CVUI
 and r11, cviu_m1 ' zero extend
 cmps r11,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_88 ' EQI4
 cmps r11,  #1 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_89 ' EQI4
 cmps r11,  #2 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__O_penF_ile_90 ' EQI4
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_85 ' JUMPV addrg
C_D_F_S__O_penF_ile_88
 mov r0, #7 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_89
 PRIMITIVE(#LODL)
 long $fff8
 mov r13, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_86 ' JUMPV addrg
C_D_F_S__O_penF_ile_90
 PRIMITIVE(#LODL)
 long $ffffff8
 mov r13, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_86 ' JUMPV addrg
C_D_F_S__O_penF_ile_85
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_86
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -132
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #20 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r4, FP
 sub r4, #-(-132) ' reg ARG ADDRLi
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 PRIMITIVE(#PSHF)
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_D_F_S__S_etF_A_T_
 add SP, #16 ' CALL addrg
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #6 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__O_penF_ile_91 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 mov r18, r22
 adds r18, #20 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r7, r22 ' ADDU
 add r7, r0 ' ADDU (3)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 add r22, r7 ' ADDU (2)
 mov r9, r22
 sub r9, #1 ' SUBU4 coni
 mov r22, FP
 sub r22, #-(-128) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #2 wcz 
 PRIMITIVE(#BR_A)
 long @C_D_F_S__O_penF_ile_93 ' GTU4
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -128
 wrlong r22, RI ' ASGNU4 addrl reg
C_D_F_S__O_penF_ile_93
 PRIMITIVE(#LODL)
 long 512
 mov r2, RI ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memset
 add SP, #8 ' CALL addrg
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_98 ' JUMPV addrg
C_D_F_S__O_penF_ile_95
 mov r2, #1 ' reg ARG coni
 mov r3, r9 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
' C_D_F_S__O_penF_ile_96 ' (symbol refcount = 0)
 sub r9, #1 ' SUBU4 coni
C_D_F_S__O_penF_ile_98
 cmp r9, r7 wcz 
 PRIMITIVE(#BR_A)
 long @C_D_F_S__O_penF_ile_95 ' GTU4
 mov r2, #11 ' reg ARG coni
 PRIMITIVE(#LODL)
 long @C_D_F_S__O_penF_ile_99_L000100
 mov r3, RI ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -3
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -2
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -1
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r2, #32 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-32) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 PRIMITIVE(#LODL)
 long @C_D_F_S__O_penF_ile_105_L000106
 mov r3, RI ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-128) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #255 ' BANDU4 coni
 PRIMITIVE(#LODF)
 long -6
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, FP
 sub r22, #-(-128) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ff00
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shr r22, #8 ' RSHU4 coni
 PRIMITIVE(#LODF)
 long -5
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, FP
 sub r22, #-(-128) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ff0000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shr r22, #16 ' RSHU4 coni
 PRIMITIVE(#LODF)
 long -12
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, FP
 sub r22, #-(-128) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ff000000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shr r22, #24 ' RSHU4 coni
 PRIMITIVE(#LODF)
 long -11
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #32 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-32) ' reg ARG ADDRLi
 mov r4, r19
 adds r4, #32 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r7 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
C_D_F_S__O_penF_ile_91
 mov r0, #0 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_54
 mov r0, #3 ' RET coni
C_D_F_S__O_penF_ile_4
 PRIMITIVE(#POPM) ' restore registers
 add SP, #132 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import DFS_SetFAT

' Catalina Import DFS_GetFreeFAT

' Catalina Import DFS_GetFreeDirEnt

' Catalina Import DFS_CanonicalToDir

' Catalina Import DFS_GetNext

' Catalina Import DFS_OpenDir

' Catalina Import DFS_WriteSector

' Catalina Import DFS_ReadSector

' Catalina Import memset

' Catalina Import strcmp

' Catalina Import memcmp

' Catalina Import strncpy

' Catalina Import strcpy

' Catalina Import memcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_D_F_S__O_penF_ile_105_L000106 ' <symbol:105>
 byte 46
 byte 46
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 0

 alignl ' align long
C_D_F_S__O_penF_ile_99_L000100 ' <symbol:99>
 byte 46
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 0

' Catalina Code

DAT ' code segment
' end
