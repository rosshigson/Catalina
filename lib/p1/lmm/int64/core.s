' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export jsll_mul

 alignl ' align long
C_jsll_mul ' <symbol:jsll_mul>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fd0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r2, r19 ' reg <- INDIRU4 reg
 rdlong r3, r21 ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_mul32
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r21
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 rdlong r16, r19 ' reg <- INDIRU4 reg
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNU4 addrl reg
 rdlong r18, r21 ' reg <- INDIRU4 reg
 mov r16, r19
 adds r16, #4 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRU4 reg
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r18, r0 ' ADDU (1)
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
' C_jsll_mul_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export jsll_mul32

 alignl ' align long
C_jsll_mul32 ' <symbol:jsll_mul32>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fea800 ' save registers
 mov r22, #16 ' reg <- coni
 mov r21, r3 ' RSHU
 shr r21, r22 ' RSHU (3)
 jmp #LODL
 long $ffff
 mov r20, RI ' reg <- con
 mov r19, r3 ' BANDI/U
 and r19, r20 ' BANDI/U (3)
 mov r17, r2 ' RSHU
 shr r17, r22 ' RSHU (3)
 mov r15, r2 ' BANDI/U
 and r15, r20 ' BANDI/U (3)
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r13, r0 ' CVI, CVU or LOAD
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r23, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r11, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNU4 addrl reg
 mov RI, r13
 shr RI, r22
 mov r22, RI ' RSHU (2)
 add r23, r22 ' ADDU (1)
 add r23, r11 ' ADDU (1)
 cmp r23, r11 wz,wc 
 jmp #BRAE
 long @C_jsll_mul32_4 ' GEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $10000
 mov r20, RI ' reg <- con
 add r22, r20 ' ADDU (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
C_jsll_mul32_4
 jmp #LODL
 long $ffff
 mov r22, RI ' reg <- con
 mov r20, r23 ' BANDI/U
 and r20, r22 ' BANDI/U (3)
 shl r20, #16 ' LSHU4 coni
 and r22, r13 ' BANDI/U (2)
 add r22, r20 ' ADDU (2)
 wrlong r22, r4 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r23
 shr r18, #16 ' RSHU4 coni
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
' C_jsll_mul32_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sa3k_6ac84bb4_norm_udivmod32_L000006 ' <symbol:norm_udivmod32>
 jmp #PSHM
 long $fea800 ' save registers
 mov r22, #16 ' reg <- coni
 mov r17, r2 ' RSHU
 shr r17, r22 ' RSHU (3)
 jmp #LODL
 long $ffff
 mov r20, RI ' reg <- con
 mov r11, r2 ' BANDI/U
 and r11, r20 ' BANDI/U (3)
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 rdlong r18, r20 ' reg <- INDIRU4 reg
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r23, r1 ' CVI, CVU or LOAD
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r15, r0 ' CVI, CVU or LOAD
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r21, r0 ' CVI, CVU or LOAD
 mov r20, r23
 shl r20, #16 ' LSHU4 coni
 rdlong r18, r3 ' reg <- INDIRU4 reg
 mov RI, r18
 shr RI, r22
 mov r22, RI ' RSHU (2)
 mov r23, r20 ' BORI/U
 or r23, r22 ' BORI/U (3)
 cmp r23, r21 wz,wc 
 jmp #BRAE
 long @C_sa3k_6ac84bb4_norm_udivmod32_L000006_8 ' GEU4
 sub r15, #1 ' SUBU4 coni
 add r23, r2 ' ADDU (1)
 cmp r23, r2 wz,wc 
 jmp #BR_B
 long @C_sa3k_6ac84bb4_norm_udivmod32_L000006_10' LTU4
 cmp r23, r21 wz,wc 
 jmp #BRAE
 long @C_sa3k_6ac84bb4_norm_udivmod32_L000006_10 ' GEU4
 sub r15, #1 ' SUBU4 coni
 add r23, r2 ' ADDU (1)
C_sa3k_6ac84bb4_norm_udivmod32_L000006_10
C_sa3k_6ac84bb4_norm_udivmod32_L000006_8
 sub r23, r21 ' SUBU (1)
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r19, r1 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r13, r0 ' CVI, CVU or LOAD
 mov r0, r13 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r19
 shl r22, #16 ' LSHU4 coni
 rdlong r20, r3 ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r19, r22 ' BORI/U
 or r19, r20 ' BORI/U (3)
 cmp r19, r21 wz,wc 
 jmp #BRAE
 long @C_sa3k_6ac84bb4_norm_udivmod32_L000006_12 ' GEU4
 sub r13, #1 ' SUBU4 coni
 add r19, r2 ' ADDU (1)
 cmp r19, r2 wz,wc 
 jmp #BR_B
 long @C_sa3k_6ac84bb4_norm_udivmod32_L000006_14' LTU4
 cmp r19, r21 wz,wc 
 jmp #BRAE
 long @C_sa3k_6ac84bb4_norm_udivmod32_L000006_14 ' GEU4
 sub r13, #1 ' SUBU4 coni
 add r19, r2 ' ADDU (1)
C_sa3k_6ac84bb4_norm_udivmod32_L000006_14
C_sa3k_6ac84bb4_norm_udivmod32_L000006_12
 mov r22, r15
 shl r22, #16 ' LSHU4 coni
 or r22, r13 ' BORI/U (1)
 wrlong r22, r5 ' ASGNU4 reg reg
 mov r22, r19 ' SUBU
 sub r22, r21 ' SUBU (3)
 wrlong r22, r4 ' ASGNU4 reg reg
' C_sa3k_6ac84bb4_norm_udivmod32_L000006_7 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016 ' <symbol:CountLeadingZeros>
 jmp #PSHM
 long $e00000 ' save registers
 mov r21, #32 ' reg <- coni
 mov r22, r2
 shr r22, #16 ' RSHU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_18 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #16 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_18
 mov r22, r2
 shr r22, #8 ' RSHU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_20 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #8 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_20
 mov r22, r2
 shr r22, #4 ' RSHU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_22 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #4 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_22
 mov r22, r2
 shr r22, #2 ' RSHU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_24 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #2 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_24
 mov r22, r2
 shr r22, #1 ' RSHU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_26 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_26
 mov r22, r2
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_28 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_28
 mov r0, r21 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016_17 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export jsll_udivmod

 alignl ' align long
C_jsll_udivmod ' <symbol:jsll_udivmod>
 jmp #NEWF
 sub SP, #40
 jmp #PSHM
 long $ffa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 rdlong r22, r19 ' reg <- INDIRU4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_jsll_udivmod_31 ' NEU4
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_jsll_udivmod_33 ' LEU4
 rdlong r2, r17 ' reg <- INDIRU4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_udivmod_35 ' EQI4
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, r15 ' CVUI
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 wrlong r22, r17 ' ASGNU4 reg reg
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, r22 ' LSHI/U (1)
 mov r16, #32 ' reg <- coni
 subs r16, r22 ' SUBI/P (1)
 and r16, cviu_m1 ' zero extend
 mov RI, r20
 shr RI, r16
 mov r16, RI ' RSHU (2)
 or r18, r16 ' BORI/U (1)
 jmp #LODF
 long -8
 wrlong r18, RI ' ASGNU4 addrl reg
 mov RI, r20
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
C_jsll_udivmod_35
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 rdlong r2, r17 ' reg <- INDIRU4 reg
 mov r0, FP
 sub r0, #-(-36) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov r5, FP
 sub r5, #-(-16) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sa3k_6ac84bb4_norm_udivmod32_L000006
 add SP, #12 ' CALL addrg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C_jsll_udivmod_34 ' JUMPV addrg
C_jsll_udivmod_33
 rdlong r22, r17 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_jsll_udivmod_37 ' NEU4
 mov r22, #1 ' reg <- coni
 rdlong r20, r17 ' reg <- INDIRU4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 wrlong r0, r17 ' ASGNU4 reg reg
C_jsll_udivmod_37
 rdlong r2, r17 ' reg <- INDIRU4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_jsll_udivmod_39 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C_jsll_udivmod_40 ' JUMPV addrg
C_jsll_udivmod_39
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #32 ' reg <- coni
 subs r20, r22 ' SUBI/P (1)
 jmp #LODF
 long -24
 wrbyte r20, RI ' ASGNU1 addrl reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 mov RI, r20
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 wrlong r22, r17 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, r22 ' RSHU
 shr r18, r20 ' RSHU (3)
 jmp #LODF
 long -28
 wrlong r18, RI ' ASGNU4 addrl reg
 mov r18, r15 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r16, FP
 sub r16, #-(-12) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r22, r18 ' LSHI/U (1)
 mov RI, r16
 shr RI, r20
 mov r20, RI ' RSHU (2)
 or r22, r20 ' BORI/U (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r16 ' LSHI/U
 shl r22, r18 ' LSHI/U (3)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 rdlong r2, r17 ' reg <- INDIRU4 reg
 mov r0, FP
 sub r0, #-(-36) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, FP
 sub r5, #-(-20) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sa3k_6ac84bb4_norm_udivmod32_L000006
 add SP, #12 ' CALL addrg
C_jsll_udivmod_40
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 rdlong r2, r17 ' reg <- INDIRU4 reg
 mov r0, FP
 sub r0, #-(-36) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov r5, FP
 sub r5, #-(-16) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sa3k_6ac84bb4_norm_udivmod32_L000006
 add SP, #12 ' CALL addrg
C_jsll_udivmod_34
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_udivmod_32 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r15 ' CVUI
 and r20, cviu_m1 ' zero extend
 shr r22, r20 ' RSHU (1)
 wrlong r22, r21 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_jsll_udivmod_32 ' JUMPV addrg
C_jsll_udivmod_31
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_jsll_udivmod_43 ' LEU4
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_udivmod_44 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r21 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_jsll_udivmod_44 ' JUMPV addrg
C_jsll_udivmod_43
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sa3k1_6ac84bb4_C_ountL_eadingZ_eros_L000016 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_jsll_udivmod_47 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_jsll_udivmod_51 ' GTU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_jsll_udivmod_49' LTU4
C_jsll_udivmod_51
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 rdlong r22, r19 ' reg <- INDIRU4 reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_jsll_udivmod_53 ' GEU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_udivmod_54 ' JUMPV addrg
C_jsll_udivmod_53
 mov r13, #0 ' reg <- coni
C_jsll_udivmod_54
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r17
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r20, r18 ' SUBU (1)
 mov r18, r13 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 rdlong r22, r19 ' reg <- INDIRU4 reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 wrlong r22, r19 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_jsll_udivmod_50 ' JUMPV addrg
C_jsll_udivmod_49
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNU4 addrl reg
C_jsll_udivmod_50
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_udivmod_48 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r21 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_jsll_udivmod_48 ' JUMPV addrg
C_jsll_udivmod_47
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #32 ' reg <- coni
 subs r20, r22 ' SUBI/P (1)
 jmp #LODF
 long -24
 wrbyte r20, RI ' ASGNU1 addrl reg
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdlong r18, r20 ' reg <- INDIRU4 reg
 mov RI, r18
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 rdlong r18, r17 ' reg <- INDIRU4 reg
 mov r16, FP
 sub r16, #-(-24) ' reg <- addrli
 rdbyte r16, r16 ' reg <- INDIRU1 reg
 and r16, cviu_m1 ' zero extend
 shr r18, r16 ' RSHU (1)
 or r22, r18 ' BORI/U (1)
 wrlong r22, r20 ' ASGNU4 reg reg
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, r15 ' CVUI
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 wrlong r22, r17 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, r22 ' RSHU
 shr r18, r20 ' RSHU (3)
 jmp #LODF
 long -28
 wrlong r18, RI ' ASGNU4 addrl reg
 mov r18, r15 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r16, FP
 sub r16, #-(-12) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r22, r18 ' LSHI/U (1)
 mov RI, r16
 shr RI, r20
 mov r20, RI ' RSHU (2)
 or r22, r20 ' BORI/U (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r16 ' LSHI/U
 shl r22, r18 ' LSHI/U (3)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r0, FP
 sub r0, #-(-44) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, FP
 sub r5, #-(-16) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sa3k_6ac84bb4_norm_udivmod32_L000006
 add SP, #12 ' CALL addrg
 rdlong r2, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_mul32
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz,wc 
 jmp #BR_A
 long @C_jsll_udivmod_61 ' GTU4
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_jsll_udivmod_57 ' NEU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_jsll_udivmod_57 ' LEU4
C_jsll_udivmod_61
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_jsll_udivmod_65 ' GEU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_udivmod_66 ' JUMPV addrg
C_jsll_udivmod_65
 mov r13, #0 ' reg <- coni
C_jsll_udivmod_66
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, r13 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNU4 addrl reg
C_jsll_udivmod_57
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_udivmod_67 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 rdlong r22, r19 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_jsll_udivmod_71 ' GEU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_udivmod_72 ' JUMPV addrg
C_jsll_udivmod_71
 mov r13, #0 ' reg <- coni
C_jsll_udivmod_72
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-32) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r20, r18 ' SUBU (1)
 mov r18, r13 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 rdlong r22, r19 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 rdlong r20, r19 ' reg <- INDIRU4 reg
 mov r18, r15 ' CVUI
 and r18, cviu_m1 ' zero extend
 shr r20, r18 ' RSHU (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r21 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r15 ' CVUI
 and r18, cviu_m1 ' zero extend
 shr r20, r18 ' RSHU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_jsll_udivmod_67
C_jsll_udivmod_48
C_jsll_udivmod_44
C_jsll_udivmod_32
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_udivmod_73 ' EQU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r23 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C_jsll_udivmod_73
' C_jsll_udivmod_30 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #40 ' framesize
 jmp #RETF


' Catalina Export jsll_div

 alignl ' align long
C_jsll_div ' <symbol:jsll_div>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_jsll_div_77 ' GEI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_div_78 ' JUMPV addrg
C_jsll_div_77
 mov r15, #0 ' reg <- coni
C_jsll_div_78
 mov r17, r15 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 jmp #BR_Z
 long @C_jsll_div_79 ' EQU4
 rdlong r22, r21 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_div_83 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_div_84 ' JUMPV addrg
C_jsll_div_83
 mov r13, #0 ' reg <- coni
C_jsll_div_84
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 subs r22, r13 ' SUBI/P (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C_jsll_div_80 ' JUMPV addrg
C_jsll_div_79
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
C_jsll_div_80
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_jsll_div_85 ' GEI4
 xor r17, #1 ' BXORU4 coni
 rdlong r22, r19 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_div_89 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_div_90 ' JUMPV addrg
C_jsll_div_89
 mov r13, #0 ' reg <- coni
C_jsll_div_90
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 subs r22, r13 ' SUBI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C_jsll_div_86 ' JUMPV addrg
C_jsll_div_85
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
C_jsll_div_86
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-20) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-36) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_udivmod
 add SP, #12 ' CALL addrg
 cmp r17,  #0 wz
 jmp #BR_Z
 long @C_jsll_div_91 ' EQU4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 wrlong r22, r23 ' ASGNU4 reg reg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_div_94 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_div_95 ' JUMPV addrg
C_jsll_div_94
 mov r13, #0 ' reg <- coni
C_jsll_div_95
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 neg r20, r20 ' NEGI4
 subs r20, r13 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_jsll_div_91
' C_jsll_div_75 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


' Catalina Export jsll_mod

 alignl ' align long
C_jsll_mod ' <symbol:jsll_mod>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_jsll_mod_98 ' GEI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_mod_99 ' JUMPV addrg
C_jsll_mod_98
 mov r15, #0 ' reg <- coni
C_jsll_mod_99
 mov r17, r15 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 jmp #BR_Z
 long @C_jsll_mod_100 ' EQU4
 rdlong r22, r21 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_mod_104 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_mod_105 ' JUMPV addrg
C_jsll_mod_104
 mov r13, #0 ' reg <- coni
C_jsll_mod_105
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 subs r22, r13 ' SUBI/P (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C_jsll_mod_101 ' JUMPV addrg
C_jsll_mod_100
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
C_jsll_mod_101
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_jsll_mod_106 ' GEI4
 rdlong r22, r19 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_mod_110 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_mod_111 ' JUMPV addrg
C_jsll_mod_110
 mov r13, #0 ' reg <- coni
C_jsll_mod_111
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 subs r22, r13 ' SUBI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C_jsll_mod_107 ' JUMPV addrg
C_jsll_mod_106
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
C_jsll_mod_107
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-20) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-36) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r5, RI ' reg ARG con
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_udivmod
 add SP, #12 ' CALL addrg
 cmp r17,  #0 wz
 jmp #BR_Z
 long @C_jsll_mod_112 ' EQU4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 wrlong r22, r23 ' ASGNU4 reg reg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_mod_115 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_mod_116 ' JUMPV addrg
C_jsll_mod_115
 mov r13, #0 ' reg <- coni
C_jsll_mod_116
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 neg r20, r20 ' NEGI4
 subs r20, r13 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_jsll_mod_112
' C_jsll_mod_96 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


' Catalina Export jsll_shl

 alignl ' align long
C_jsll_shl ' <symbol:jsll_shl>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $554000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_shl_118 ' EQI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r22
 and r20, #31 ' BANDI4 coni
 jmp #LODF
 long -8
 wrbyte r20, RI ' ASGNU1 addrl reg
 cmps r22,  #32 wz,wc
 jmp #BRAE
 long @C_jsll_shl_120 ' GEI4
 rdlong r22, r3 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 wrlong r22, r4 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r20, r18 ' LSHI/U (1)
 rdlong r18, r3 ' reg <- INDIRU4 reg
 mov r16, #32 ' reg <- coni
 mov r14, r2 ' CVUI
 and r14, cviu_m1 ' zero extend
 subs r16, r14 ' SUBI/P (1)
 and r16, cviu_m1 ' zero extend
 shr r18, r16 ' RSHU (1)
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_jsll_shl_119 ' JUMPV addrg
C_jsll_shl_120
 mov r22, #0 ' reg <- coni
 wrlong r22, r4 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r3 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r20, r18 ' LSHI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_jsll_shl_119 ' JUMPV addrg
C_jsll_shl_118
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, r3 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
C_jsll_shl_119
' C_jsll_shl_117 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export jsll_shr

 alignl ' align long
C_jsll_shr ' <symbol:jsll_shr>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $540000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_shr_123 ' EQI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r22
 and r20, #31 ' BANDI4 coni
 jmp #LODF
 long -8
 wrbyte r20, RI ' ASGNU1 addrl reg
 cmps r22,  #32 wz,wc
 jmp #BRAE
 long @C_jsll_shr_125 ' GEI4
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #32 ' reg <- coni
 mov r18, r2 ' CVUI
 and r18, cviu_m1 ' zero extend
 subs r20, r18 ' SUBI/P (1)
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 rdlong r20, r3 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shr r20, r18 ' RSHU (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r4 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 sar r20, r18 ' RSHI (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_jsll_shr_124 ' JUMPV addrg
C_jsll_shr_125
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 sar r22, r20 ' RSHI (1)
 wrlong r22, r4 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sar r20, #31 ' RSHI4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_jsll_shr_124 ' JUMPV addrg
C_jsll_shr_123
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, r3 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
C_jsll_shr_124
' C_jsll_shr_122 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export jsll_ushr

 alignl ' align long
C_jsll_ushr ' <symbol:jsll_ushr>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $540000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_ushr_128 ' EQI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r22
 and r20, #31 ' BANDI4 coni
 jmp #LODF
 long -8
 wrbyte r20, RI ' ASGNU1 addrl reg
 cmps r22,  #32 wz,wc
 jmp #BRAE
 long @C_jsll_ushr_130 ' GEI4
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #32 ' reg <- coni
 mov r18, r2 ' CVUI
 and r18, cviu_m1 ' zero extend
 subs r20, r18 ' SUBI/P (1)
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 rdlong r20, r3 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shr r20, r18 ' RSHU (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r4 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shr r20, r18 ' RSHU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_jsll_ushr_129 ' JUMPV addrg
C_jsll_ushr_130
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shr r22, r20 ' RSHU (1)
 wrlong r22, r4 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_jsll_ushr_129 ' JUMPV addrg
C_jsll_ushr_128
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, r3 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
C_jsll_ushr_129
' C_jsll_ushr_127 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export rhll_real_cmp

 alignl ' align long
C_rhll_real_cmp ' <symbol:rhll_real_cmp>
 jmp #PSHM
 long $ff8000 ' save registers
 mov r22, r3
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_rhll_real_cmp_133 ' NEI4
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 mov r23, r22 ' CVUI
 and r23, cviu_m1 ' zero extend
 cmps r23,  #60 wz
 jmp #BR_Z
 long @C_rhll_real_cmp_138 ' EQI4
 cmps r23,  #62 wz
 jmp #BR_Z
 long @C_rhll_real_cmp_143 ' EQI4
 jmp #JMPA
 long @C_rhll_real_cmp_134 ' JUMPV addrg
C_rhll_real_cmp_138
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r22 ' CVI, CVU or LOAD
 mov r16, r20 ' CVI, CVU or LOAD
 cmps r18, r16 wz,wc
 jmp #BR_B
 long @C_rhll_real_cmp_142 ' LTI4
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_cmp_140 ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_rhll_real_cmp_140 ' GEI4
C_rhll_real_cmp_142
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_rhll_real_cmp_141 ' JUMPV addrg
C_rhll_real_cmp_140
 mov r21, #0 ' reg <- coni
C_rhll_real_cmp_141
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_rhll_real_cmp_132 ' JUMPV addrg
C_rhll_real_cmp_143
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r22 ' CVI, CVU or LOAD
 mov r16, r20 ' CVI, CVU or LOAD
 cmps r18, r16 wz,wc
 jmp #BR_A
 long @C_rhll_real_cmp_147 ' GTI4
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_cmp_145 ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C_rhll_real_cmp_145 ' LEI4
C_rhll_real_cmp_147
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_rhll_real_cmp_146 ' JUMPV addrg
C_rhll_real_cmp_145
 mov r19, #0 ' reg <- coni
C_rhll_real_cmp_146
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_rhll_real_cmp_132 ' JUMPV addrg
C_rhll_real_cmp_133
 mov r22, r3
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #61 wz
 jmp #BRNZ
 long @C_rhll_real_cmp_148 ' NEI4
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 mov r23, r22 ' CVUI
 and r23, cviu_m1 ' zero extend
 mov r22, #33 ' reg <- coni
 cmps r23, r22 wz
 jmp #BR_Z
 long @C_rhll_real_cmp_153 ' EQI4
 cmps r23, r22 wz,wc
 jmp #BR_B
 long @C_rhll_real_cmp_151 ' LTI4
' C_rhll_real_cmp_172 ' (symbol refcount = 0)
 cmps r23,  #60 wz
 jmp #BR_Z
 long @C_rhll_real_cmp_162 ' EQI4
 cmps r23,  #61 wz
 jmp #BR_Z
 long @C_rhll_real_cmp_158 ' EQI4
 cmps r23,  #62 wz
 jmp #BR_Z
 long @C_rhll_real_cmp_167 ' EQI4
 jmp #JMPA
 long @C_rhll_real_cmp_151 ' JUMPV addrg
C_rhll_real_cmp_153
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_cmp_157 ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_rhll_real_cmp_155 ' EQU4
C_rhll_real_cmp_157
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_rhll_real_cmp_156 ' JUMPV addrg
C_rhll_real_cmp_155
 mov r21, #0 ' reg <- coni
C_rhll_real_cmp_156
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_rhll_real_cmp_132 ' JUMPV addrg
C_rhll_real_cmp_158
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_cmp_160 ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_cmp_160 ' NEU4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_rhll_real_cmp_161 ' JUMPV addrg
C_rhll_real_cmp_160
 mov r19, #0 ' reg <- coni
C_rhll_real_cmp_161
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_rhll_real_cmp_132 ' JUMPV addrg
C_rhll_real_cmp_162
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r22 ' CVI, CVU or LOAD
 mov r16, r20 ' CVI, CVU or LOAD
 cmps r18, r16 wz,wc
 jmp #BR_B
 long @C_rhll_real_cmp_166 ' LTI4
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_cmp_164 ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C_rhll_real_cmp_164 ' GTI4
C_rhll_real_cmp_166
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_rhll_real_cmp_165 ' JUMPV addrg
C_rhll_real_cmp_164
 mov r17, #0 ' reg <- coni
C_rhll_real_cmp_165
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_rhll_real_cmp_132 ' JUMPV addrg
C_rhll_real_cmp_167
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r22 ' CVI, CVU or LOAD
 mov r16, r20 ' CVI, CVU or LOAD
 cmps r18, r16 wz,wc
 jmp #BR_A
 long @C_rhll_real_cmp_171 ' GTI4
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_cmp_169 ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_rhll_real_cmp_169 ' LTI4
C_rhll_real_cmp_171
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_rhll_real_cmp_170 ' JUMPV addrg
C_rhll_real_cmp_169
 mov r15, #0 ' reg <- coni
C_rhll_real_cmp_170
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_rhll_real_cmp_132 ' JUMPV addrg
C_rhll_real_cmp_151
C_rhll_real_cmp_148
C_rhll_real_cmp_134
 mov r0, #0 ' RET coni
C_rhll_real_cmp_132
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export rhll_real_ucmp

 alignl ' align long
C_rhll_real_ucmp ' <symbol:rhll_real_ucmp>
 jmp #PSHM
 long $fa8000 ' save registers
 mov r22, r3
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_rhll_real_ucmp_174 ' NEI4
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 mov r23, r22 ' CVUI
 and r23, cviu_m1 ' zero extend
 cmps r23,  #60 wz
 jmp #BR_Z
 long @C_rhll_real_ucmp_179 ' EQI4
 cmps r23,  #62 wz
 jmp #BR_Z
 long @C_rhll_real_ucmp_184 ' EQI4
 jmp #JMPA
 long @C_rhll_real_ucmp_175 ' JUMPV addrg
C_rhll_real_ucmp_179
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_rhll_real_ucmp_183' LTU4
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_ucmp_181 ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_rhll_real_ucmp_181 ' GEU4
C_rhll_real_ucmp_183
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_rhll_real_ucmp_182 ' JUMPV addrg
C_rhll_real_ucmp_181
 mov r21, #0 ' reg <- coni
C_rhll_real_ucmp_182
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_rhll_real_ucmp_173 ' JUMPV addrg
C_rhll_real_ucmp_184
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_rhll_real_ucmp_188 ' GTU4
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_ucmp_186 ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_rhll_real_ucmp_186 ' LEU4
C_rhll_real_ucmp_188
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_rhll_real_ucmp_187 ' JUMPV addrg
C_rhll_real_ucmp_186
 mov r19, #0 ' reg <- coni
C_rhll_real_ucmp_187
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_rhll_real_ucmp_173 ' JUMPV addrg
C_rhll_real_ucmp_174
 mov r22, r3
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #61 wz
 jmp #BRNZ
 long @C_rhll_real_ucmp_189 ' NEI4
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 mov r23, r22 ' CVUI
 and r23, cviu_m1 ' zero extend
 mov r22, #33 ' reg <- coni
 cmps r23, r22 wz
 jmp #BR_Z
 long @C_rhll_real_ucmp_194 ' EQI4
 cmps r23, r22 wz,wc
 jmp #BR_B
 long @C_rhll_real_ucmp_192 ' LTI4
' C_rhll_real_ucmp_213 ' (symbol refcount = 0)
 cmps r23,  #60 wz
 jmp #BR_Z
 long @C_rhll_real_ucmp_203 ' EQI4
 cmps r23,  #61 wz
 jmp #BR_Z
 long @C_rhll_real_ucmp_199 ' EQI4
 cmps r23,  #62 wz
 jmp #BR_Z
 long @C_rhll_real_ucmp_208 ' EQI4
 jmp #JMPA
 long @C_rhll_real_ucmp_192 ' JUMPV addrg
C_rhll_real_ucmp_194
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_ucmp_198 ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_rhll_real_ucmp_196 ' EQU4
C_rhll_real_ucmp_198
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_rhll_real_ucmp_197 ' JUMPV addrg
C_rhll_real_ucmp_196
 mov r21, #0 ' reg <- coni
C_rhll_real_ucmp_197
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_rhll_real_ucmp_173 ' JUMPV addrg
C_rhll_real_ucmp_199
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_ucmp_201 ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_ucmp_201 ' NEU4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_rhll_real_ucmp_202 ' JUMPV addrg
C_rhll_real_ucmp_201
 mov r19, #0 ' reg <- coni
C_rhll_real_ucmp_202
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_rhll_real_ucmp_173 ' JUMPV addrg
C_rhll_real_ucmp_203
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_rhll_real_ucmp_207' LTU4
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_ucmp_205 ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_rhll_real_ucmp_205 ' GTU4
C_rhll_real_ucmp_207
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_rhll_real_ucmp_206 ' JUMPV addrg
C_rhll_real_ucmp_205
 mov r17, #0 ' reg <- coni
C_rhll_real_ucmp_206
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_rhll_real_ucmp_173 ' JUMPV addrg
C_rhll_real_ucmp_208
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_rhll_real_ucmp_212 ' GTU4
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_rhll_real_ucmp_210 ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_rhll_real_ucmp_210' LTU4
C_rhll_real_ucmp_212
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_rhll_real_ucmp_211 ' JUMPV addrg
C_rhll_real_ucmp_210
 mov r15, #0 ' reg <- coni
C_rhll_real_ucmp_211
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_rhll_real_ucmp_173 ' JUMPV addrg
C_rhll_real_ucmp_192
C_rhll_real_ucmp_189
C_rhll_real_ucmp_175
 mov r0, #0 ' RET coni
C_rhll_real_ucmp_173
 jmp #POPM ' restore registers
 jmp #RETN

' end
