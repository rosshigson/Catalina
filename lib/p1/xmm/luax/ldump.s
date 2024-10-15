' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_snok_670edb71_dumpB_lock_L000013 ' <symbol:dumpBlock>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_snok_670edb71_dumpB_lock_L000013_15 ' NEI4
 cmp r19,  #0 wz
 jmp #BR_Z
 long @C_snok_670edb71_dumpB_lock_L000013_15 ' EQU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 mov RI, r22
 jmp #CALI
 add SP, #12 ' CALL indirect
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
C_snok_670edb71_dumpB_lock_L000013_15
' C_snok_670edb71_dumpB_lock_L000013_14 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_snok1_670edb71_dumpB_yte_L000017 ' <symbol:dumpByte>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok_670edb71_dumpB_lock_L000013
 add SP, #8 ' CALL addrg
' C_snok1_670edb71_dumpB_yte_L000017_18 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_snok2_670edb71_dumpS_ize_L000019 ' <symbol:dumpSize>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
C_snok2_670edb71_dumpS_ize_L000019_21
 mov r22, r19
 adds r22, #1 ' ADDI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, #5 ' reg <- coni
 mov RI, r20
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, r21
 and r20, #127 ' BANDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 shr r21, #7 ' RSHU4 coni
' C_snok2_670edb71_dumpS_ize_L000019_22 ' (symbol refcount = 0)
 cmp r21,  #0 wz
 jmp #BRNZ
 long @C_snok2_670edb71_dumpS_ize_L000019_21 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #128 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-7) ' reg <- addrli
 mov r3, r22 ' SUBI/P
 subs r3, r19 ' SUBI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok_670edb71_dumpB_lock_L000013
 add SP, #8 ' CALL addrg
' C_snok2_670edb71_dumpS_ize_L000019_20 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_snok3_670edb71_dumpI_nt_L000027 ' <symbol:dumpInt>
 jmp #NEWF
 jmp #PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok2_670edb71_dumpS_ize_L000019
 add SP, #4 ' CALL addrg
' C_snok3_670edb71_dumpI_nt_L000027_28 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_snok4_670edb71_dumpN_umber_L000029 ' <symbol:dumpNumber>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r2, RI ' spill reg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 add r3, #12 ' reg ARG ADDRFi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok_670edb71_dumpB_lock_L000013
 add SP, #8 ' CALL addrg
' C_snok4_670edb71_dumpN_umber_L000029_30 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_snok5_670edb71_dumpI_nteger_L000031 ' <symbol:dumpInteger>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r2, RI ' spill reg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 add r3, #12 ' reg ARG ADDRFi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok_670edb71_dumpB_lock_L000013
 add SP, #8 ' CALL addrg
' C_snok5_670edb71_dumpI_nteger_L000031_32 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_snok6_670edb71_dumpS_tring_L000033 ' <symbol:dumpString>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_snok6_670edb71_dumpS_tring_L000033_35 ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok2_670edb71_dumpS_ize_L000019
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_snok6_670edb71_dumpS_tring_L000033_36 ' JUMPV addrg
C_snok6_670edb71_dumpS_tring_L000033_35
 mov r22, #4 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_snok6_670edb71_dumpS_tring_L000033_38 ' NEI4
 mov r22, r21
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_snok6_670edb71_dumpS_tring_L000033_39 ' JUMPV addrg
C_snok6_670edb71_dumpS_tring_L000033_38
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRU4 reg
C_snok6_670edb71_dumpS_tring_L000033_39
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNU4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r2, r22
 add r2, #1 ' ADDU4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok2_670edb71_dumpS_ize_L000019
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok_670edb71_dumpB_lock_L000013
 add SP, #8 ' CALL addrg
C_snok6_670edb71_dumpS_tring_L000033_36
' C_snok6_670edb71_dumpS_tring_L000033_34 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_snok7_670edb71_dumpC_ode_L000040 ' <symbol:dumpCode>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov r22, r21
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok_670edb71_dumpB_lock_L000013
 add SP, #8 ' CALL addrg
' C_snok7_670edb71_dumpC_ode_L000040_41 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_snok9_670edb71_dumpC_onstants_L000043 ' <symbol:dumpConstants>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_snok9_670edb71_dumpC_onstants_L000043_48 ' JUMPV addrg
C_snok9_670edb71_dumpC_onstants_L000043_45
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r15, r22
 and r15, #63 ' BANDI4 coni
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
 mov r22, #3 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_snok9_670edb71_dumpC_onstants_L000043_52 ' EQI4
 cmps r15,  #4 wz
 jmp #BR_Z
 long @C_snok9_670edb71_dumpC_onstants_L000043_53 ' EQI4
 cmps r15, r22 wz,wc
 jmp #BR_B
 long @C_snok9_670edb71_dumpC_onstants_L000043_49 ' LTI4
' C_snok9_670edb71_dumpC_onstants_L000043_54 ' (symbol refcount = 0)
 cmps r15,  #19 wz
 jmp #BR_Z
 long @C_snok9_670edb71_dumpC_onstants_L000043_51 ' EQI4
 cmps r15,  #20 wz
 jmp #BR_Z
 long @C_snok9_670edb71_dumpC_onstants_L000043_53 ' EQI4
 jmp #JMPA
 long @C_snok9_670edb71_dumpC_onstants_L000043_49 ' JUMPV addrg
C_snok9_670edb71_dumpC_onstants_L000043_51
 mov RI, r13
 jmp #RLNG
 mov r2, BC ' reg <- INDIRF4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok4_670edb71_dumpN_umber_L000029
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_snok9_670edb71_dumpC_onstants_L000043_50 ' JUMPV addrg
C_snok9_670edb71_dumpC_onstants_L000043_52
 mov RI, r13
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok5_670edb71_dumpI_nteger_L000031
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_snok9_670edb71_dumpC_onstants_L000043_50 ' JUMPV addrg
C_snok9_670edb71_dumpC_onstants_L000043_53
 mov RI, r13
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok6_670edb71_dumpS_tring_L000033
 add SP, #4 ' CALL addrg
C_snok9_670edb71_dumpC_onstants_L000043_49
C_snok9_670edb71_dumpC_onstants_L000043_50
' C_snok9_670edb71_dumpC_onstants_L000043_46 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_snok9_670edb71_dumpC_onstants_L000043_48
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_snok9_670edb71_dumpC_onstants_L000043_45 ' LTI4
' C_snok9_670edb71_dumpC_onstants_L000043_44 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_snoka_670edb71_dumpP_rotos_L000055 ' <symbol:dumpProtos>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_snoka_670edb71_dumpP_rotos_L000055_60 ' JUMPV addrg
C_snoka_670edb71_dumpP_rotos_L000055_57
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok8_670edb71_dumpF_unction_L000042
 add SP, #8 ' CALL addrg
' C_snoka_670edb71_dumpP_rotos_L000055_58 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_snoka_670edb71_dumpP_rotos_L000055_60
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_snoka_670edb71_dumpP_rotos_L000055_57 ' LTI4
' C_snoka_670edb71_dumpP_rotos_L000055_56 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_snokb_670edb71_dumpU_pvalues_L000061 ' <symbol:dumpUpvalues>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_snokb_670edb71_dumpU_pvalues_L000061_66 ' JUMPV addrg
C_snokb_670edb71_dumpU_pvalues_L000061_63
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
' C_snokb_670edb71_dumpU_pvalues_L000061_64 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_snokb_670edb71_dumpU_pvalues_L000061_66
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_snokb_670edb71_dumpU_pvalues_L000061_63 ' LTI4
' C_snokb_670edb71_dumpU_pvalues_L000061_62 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_snokc_670edb71_dumpD_ebug_L000067 ' <symbol:dumpDebug>
 jmp #NEWF
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snokc_670edb71_dumpD_ebug_L000067_70 ' EQI4
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_snokc_670edb71_dumpD_ebug_L000067_71 ' JUMPV addrg
C_snokc_670edb71_dumpD_ebug_L000067_70
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
C_snokc_670edb71_dumpD_ebug_L000067_71
 mov r17, r15 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov r20, r17 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #64 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok_670edb71_dumpB_lock_L000013
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snokc_670edb71_dumpD_ebug_L000067_73 ' EQI4
 mov r13, #0 ' reg <- coni
 jmp #JMPA
 long @C_snokc_670edb71_dumpD_ebug_L000067_74 ' JUMPV addrg
C_snokc_670edb71_dumpD_ebug_L000067_73
 mov r22, r21
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRI4 reg
C_snokc_670edb71_dumpD_ebug_L000067_74
 mov r17, r13 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_snokc_670edb71_dumpD_ebug_L000067_78 ' JUMPV addrg
C_snokc_670edb71_dumpD_ebug_L000067_75
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #68 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #68 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
' C_snokc_670edb71_dumpD_ebug_L000067_76 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_snokc_670edb71_dumpD_ebug_L000067_78
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_snokc_670edb71_dumpD_ebug_L000067_75 ' LTI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snokc_670edb71_dumpD_ebug_L000067_80 ' EQI4
 mov r11, #0 ' reg <- coni
 jmp #JMPA
 long @C_snokc_670edb71_dumpD_ebug_L000067_81 ' JUMPV addrg
C_snokc_670edb71_dumpD_ebug_L000067_80
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r11, BC ' reg <- INDIRI4 reg
C_snokc_670edb71_dumpD_ebug_L000067_81
 mov r17, r11 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_snokc_670edb71_dumpD_ebug_L000067_85 ' JUMPV addrg
C_snokc_670edb71_dumpD_ebug_L000067_82
 mov r22, #12 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok6_670edb71_dumpS_tring_L000033
 add SP, #4 ' CALL addrg
 mov r22, #12 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
 mov r22, #12 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
' C_snokc_670edb71_dumpD_ebug_L000067_83 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_snokc_670edb71_dumpD_ebug_L000067_85
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_snokc_670edb71_dumpD_ebug_L000067_82 ' LTI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snokc_670edb71_dumpD_ebug_L000067_87 ' EQI4
 mov r9, #0 ' reg <- coni
 jmp #JMPA
 long @C_snokc_670edb71_dumpD_ebug_L000067_88 ' JUMPV addrg
C_snokc_670edb71_dumpD_ebug_L000067_87
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r9, BC ' reg <- INDIRI4 reg
C_snokc_670edb71_dumpD_ebug_L000067_88
 mov r17, r9 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_snokc_670edb71_dumpD_ebug_L000067_92 ' JUMPV addrg
C_snokc_670edb71_dumpD_ebug_L000067_89
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok6_670edb71_dumpS_tring_L000033
 add SP, #4 ' CALL addrg
' C_snokc_670edb71_dumpD_ebug_L000067_90 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_snokc_670edb71_dumpD_ebug_L000067_92
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_snokc_670edb71_dumpD_ebug_L000067_89 ' LTI4
' C_snokc_670edb71_dumpD_ebug_L000067_68 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_snok8_670edb71_dumpF_unction_L000042 ' <symbol:dumpFunction>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_snok8_670edb71_dumpF_unction_L000042_96 ' NEI4
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_snok8_670edb71_dumpF_unction_L000042_94 ' NEU4
C_snok8_670edb71_dumpF_unction_L000042_96
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok6_670edb71_dumpS_tring_L000033
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_snok8_670edb71_dumpF_unction_L000042_95 ' JUMPV addrg
C_snok8_670edb71_dumpF_unction_L000042_94
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok6_670edb71_dumpS_tring_L000033
 add SP, #4 ' CALL addrg
C_snok8_670edb71_dumpF_unction_L000042_95
 mov r22, r21
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #44 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok3_670edb71_dumpI_nt_L000027
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok7_670edb71_dumpC_ode_L000040
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok9_670edb71_dumpC_onstants_L000043
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snokb_670edb71_dumpU_pvalues_L000061
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snoka_670edb71_dumpP_rotos_L000055
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snokc_670edb71_dumpD_ebug_L000067
 add SP, #4 ' CALL addrg
' C_snok8_670edb71_dumpF_unction_L000042_93 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_snokd_670edb71_dumpH_eader_L000097 ' <symbol:dumpHeader>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #4 ' reg ARG coni
 jmp #LODL
 long @C_snokd_670edb71_dumpH_eader_L000097_99_L000100
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok_670edb71_dumpB_lock_L000013
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_snokd_670edb71_dumpH_eader_L000097_101_L000102
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 shl r22, #4 ' LSHI4 coni
 jmp #LODL
 long 768
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 jmp #LODL
 long @C_snokd_670edb71_dumpH_eader_L000097_103_L000104
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 addrg
 and r20, cviu_m1 ' zero extend
 subs r20, #48 ' SUBI4 coni
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
 mov r2, #6 ' reg ARG coni
 jmp #LODL
 long @C_snokd_670edb71_dumpH_eader_L000097_105_L000106
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok_670edb71_dumpB_lock_L000013
 add SP, #8 ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 22136
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok5_670edb71_dumpI_nteger_L000031
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C_snokd_670edb71_dumpH_eader_L000097_107_L000108
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok4_670edb71_dumpN_umber_L000029
 add SP, #4 ' CALL addrg
' C_snokd_670edb71_dumpH_eader_L000097_98 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaU_dump

 alignl ' align long
C_luaU__dump ' <symbol:luaU_dump>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r17, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_snokd_670edb71_dumpH_eader_L000097 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok1_670edb71_dumpB_yte_L000017
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-24) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_snok8_670edb71_dumpF_unction_L000042
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_luaU__dump_109 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_snokd_670edb71_dumpH_eader_L000097_107_L000108 ' <symbol:107>
 long $43b94000 ' float

 alignl ' align long
C_snokd_670edb71_dumpH_eader_L000097_105_L000106 ' <symbol:105>
 byte 25
 byte 147
 byte 13
 byte 10
 byte 26
 byte 10
 byte 0

 alignl ' align long
C_snokd_670edb71_dumpH_eader_L000097_103_L000104 ' <symbol:103>
 byte 52
 byte 0

 alignl ' align long
C_snokd_670edb71_dumpH_eader_L000097_101_L000102 ' <symbol:101>
 byte 53
 byte 0

 alignl ' align long
C_snokd_670edb71_dumpH_eader_L000097_99_L000100 ' <symbol:99>
 byte 27
 byte 76
 byte 117
 byte 97
 byte 0

' Catalina Code

DAT ' code segment
' end
