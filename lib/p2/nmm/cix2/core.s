' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export jsll_mul

 alignl ' align long
C_jsll_mul ' <symbol:jsll_mul>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fd0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r2, r19 ' reg <- INDIRU4 reg
 rdlong r3, r21 ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_jsll_mul32
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r21
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 rdlong r16, r19 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r18, r16 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 rdlong r18, r21 ' reg <- INDIRU4 reg
 mov r16, r19
 adds r16, #4 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r18, r16 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r18, r0 ' ADDU (1)
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
' C_jsll_mul_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export jsll_mul32

 alignl ' align long
C_jsll_mul32 ' <symbol:jsll_mul32>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r22, #16 ' reg <- coni
 mov r21, r3 ' RSHU
 shr r21, r22 ' RSHU (3)
 mov r20, ##$ffff ' reg <- con
 mov r19, r3 ' BANDI/U
 and r19, r20 ' BANDI/U (3)
 mov r17, r2 ' RSHU
 shr r17, r22 ' RSHU (3)
 mov r15, r2 ' BANDI/U
 and r15, r20 ' BANDI/U (3)
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r19, r15 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r13, r0 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r19, r17 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r23, r0 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r21, r15 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r11, r0 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r21, r17 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov RI, r13
 shr RI, r22
 mov r22, RI ' RSHU (2)
 add r23, r22 ' ADDU (1)
 add r23, r11 ' ADDU (1)
 cmp r23, r11 wcz 
 if_ae jmp #\C_jsll_mul32_3 ' GEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$10000 ' reg <- con
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_jsll_mul32_3
 mov r22, ##$ffff ' reg <- con
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
' C_jsll_mul32_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export jsll_udivmod

 alignl ' align long
C_jsll_udivmod ' <symbol:jsll_udivmod>
 calld PA,#NEWF
 sub SP, #40
 calld PA,#PSHM
 long $ffa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 rdlong r22, r19 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_jsll_udivmod_8  ' NEU4
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_jsll_udivmod_10 ' LEU4
 rdlong r2, r17 ' reg <- INDIRU4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_jsll_udivmod_12 ' EQI4
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r18, RI ' ASGNU4 addrli reg
 mov RI, r20
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
C_jsll_udivmod_12
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
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov r5, FP
 sub r5, #-(-16) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sal41_6af551d5_norm_udivmod32_L000006
 add SP, #12 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_jsll_udivmod_11 ' JUMPV addrg
C_jsll_udivmod_10
 rdlong r22, r17 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_jsll_udivmod_14  ' NEU4
 mov r22, #1 ' reg <- coni
 rdlong r20, r17 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 wrlong r0, r17 ' ASGNU4 reg reg
C_jsll_udivmod_14
 rdlong r2, r17 ' reg <- INDIRU4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_jsll_udivmod_16 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_jsll_udivmod_17 ' JUMPV addrg
C_jsll_udivmod_16
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #32 ' reg <- coni
 subs r20, r22 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrbyte r20, RI ' ASGNU1 addrli reg
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
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r18, r22 ' RSHU
 shr r18, r20 ' RSHU (3)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r18, RI ' ASGNU4 addrli reg
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r16 ' LSHI/U
 shl r22, r18 ' LSHI/U (3)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
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
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, FP
 sub r5, #-(-20) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sal41_6af551d5_norm_udivmod32_L000006
 add SP, #12 ' CALL addrg
C_jsll_udivmod_17
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
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov r5, FP
 sub r5, #-(-16) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sal41_6af551d5_norm_udivmod32_L000006
 add SP, #12 ' CALL addrg
C_jsll_udivmod_11
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_jsll_udivmod_9 ' EQU4
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
 jmp #\@C_jsll_udivmod_9 ' JUMPV addrg
C_jsll_udivmod_8
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_jsll_udivmod_20 ' LEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_jsll_udivmod_21 ' EQU4
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
 jmp #\@C_jsll_udivmod_21 ' JUMPV addrg
C_jsll_udivmod_20
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_jsll_udivmod_24 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_a jmp #\C_jsll_udivmod_28 ' GTU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_jsll_udivmod_26 ' LTU4
C_jsll_udivmod_28
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
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
 cmp r22, r20 wcz 
 if_ae jmp #\C_jsll_udivmod_30 ' GEU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_jsll_udivmod_31 ' JUMPV addrg
C_jsll_udivmod_30
 mov r13, #0 ' reg <- coni
C_jsll_udivmod_31
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
 jmp #\@C_jsll_udivmod_27 ' JUMPV addrg
C_jsll_udivmod_26
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
C_jsll_udivmod_27
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_jsll_udivmod_25 ' EQU4
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
 jmp #\@C_jsll_udivmod_25 ' JUMPV addrg
C_jsll_udivmod_24
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #32 ' reg <- coni
 subs r20, r22 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrbyte r20, RI ' ASGNU1 addrli reg
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdlong r18, r20 ' reg <- INDIRU4 reg
 mov RI, r18
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 rdlong r18, r17 ' reg <- INDIRU4 reg
 mov r16, FP
 sub r16, #-(-24) ' reg <- addrli
 rdbyte r16, r16 ' reg <- CVUI4 INDIRU1 reg
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
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r18, r22 ' RSHU
 shr r18, r20 ' RSHU (3)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r18, RI ' ASGNU4 addrli reg
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r16 ' LSHI/U
 shl r22, r18 ' LSHI/U (3)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
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
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, FP
 sub r5, #-(-16) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sal41_6af551d5_norm_udivmod32_L000006
 add SP, #12 ' CALL addrg
 rdlong r2, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_jsll_mul32
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wcz 
 if_a jmp #\C_jsll_udivmod_38 ' GTU4
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_jsll_udivmod_34  ' NEU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_jsll_udivmod_34 ' LEU4
C_jsll_udivmod_38
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_jsll_udivmod_42 ' GEU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_jsll_udivmod_43 ' JUMPV addrg
C_jsll_udivmod_42
 mov r13, #0 ' reg <- coni
C_jsll_udivmod_43
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, r13 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
C_jsll_udivmod_34
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_jsll_udivmod_44 ' EQU4
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
 cmp r22, r20 wcz 
 if_ae jmp #\C_jsll_udivmod_48 ' GEU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_jsll_udivmod_49 ' JUMPV addrg
C_jsll_udivmod_48
 mov r13, #0 ' reg <- coni
C_jsll_udivmod_49
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
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
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
C_jsll_udivmod_44
C_jsll_udivmod_25
C_jsll_udivmod_21
C_jsll_udivmod_9
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_jsll_udivmod_50 ' EQU4
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
C_jsll_udivmod_50
' C_jsll_udivmod_7 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #40 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005 ' <symbol:CountLeadingZeros>
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r21, #32 ' reg <- coni
 mov r22, r2
 shr r22, #16 ' RSHU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_53 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #16 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_53
 mov r22, r2
 shr r22, #8 ' RSHU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_55 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #8 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_55
 mov r22, r2
 shr r22, #4 ' RSHU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_57 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #4 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_57
 mov r22, r2
 shr r22, #2 ' RSHU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_59 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #2 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_59
 mov r22, r2
 shr r22, #1 ' RSHU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_61 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_61
 mov r22, r2
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_63 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_63
 mov r0, r21 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_sal4_6af551d5_C_ountL_eadingZ_eros_L000005_52 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sal41_6af551d5_norm_udivmod32_L000006 ' <symbol:norm_udivmod32>
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r22, #16 ' reg <- coni
 mov r17, r2 ' RSHU
 shr r17, r22 ' RSHU (3)
 mov r20, ##$ffff ' reg <- con
 mov r11, r2 ' BANDI/U
 and r11, r20 ' BANDI/U (3)
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 rdlong r18, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r18, r17 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r23, r1 ' CVI, CVU or LOAD
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r17 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r15, r0 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r15, r11 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r21, r0 ' CVI, CVU or LOAD
 mov r20, r23
 shl r20, #16 ' LSHU4 coni
 rdlong r18, r3 ' reg <- INDIRU4 reg
 mov RI, r18
 shr RI, r22
 mov r22, RI ' RSHU (2)
 mov r23, r20 ' BORI/U
 or r23, r22 ' BORI/U (3)
 cmp r23, r21 wcz 
 if_ae jmp #\C_sal41_6af551d5_norm_udivmod32_L000006_66 ' GEU4
 sub r15, #1 ' SUBU4 coni
 add r23, r2 ' ADDU (1)
 cmp r23, r2 wcz 
 if_b jmp #\C_sal41_6af551d5_norm_udivmod32_L000006_68 ' LTU4
 cmp r23, r21 wcz 
 if_ae jmp #\C_sal41_6af551d5_norm_udivmod32_L000006_68 ' GEU4
 sub r15, #1 ' SUBU4 coni
 add r23, r2 ' ADDU (1)
C_sal41_6af551d5_norm_udivmod32_L000006_68
C_sal41_6af551d5_norm_udivmod32_L000006_66
 sub r23, r21 ' SUBU (1)
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r23, r17 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r19, r1 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r23, r17 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r13, r0 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r13, r11 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r19
 shl r22, #16 ' LSHU4 coni
 rdlong r20, r3 ' reg <- INDIRU4 reg
 mov r18, ##$ffff ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r19, r22 ' BORI/U
 or r19, r20 ' BORI/U (3)
 cmp r19, r21 wcz 
 if_ae jmp #\C_sal41_6af551d5_norm_udivmod32_L000006_70 ' GEU4
 sub r13, #1 ' SUBU4 coni
 add r19, r2 ' ADDU (1)
 cmp r19, r2 wcz 
 if_b jmp #\C_sal41_6af551d5_norm_udivmod32_L000006_72 ' LTU4
 cmp r19, r21 wcz 
 if_ae jmp #\C_sal41_6af551d5_norm_udivmod32_L000006_72 ' GEU4
 sub r13, #1 ' SUBU4 coni
 add r19, r2 ' ADDU (1)
C_sal41_6af551d5_norm_udivmod32_L000006_72
C_sal41_6af551d5_norm_udivmod32_L000006_70
 mov r22, r15
 shl r22, #16 ' LSHU4 coni
 or r22, r13 ' BORI/U (1)
 wrlong r22, r5 ' ASGNU4 reg reg
 mov r22, r19 ' SUBU
 sub r22, r21 ' SUBU (3)
 wrlong r22, r4 ' ASGNU4 reg reg
' C_sal41_6af551d5_norm_udivmod32_L000006_65 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export jsll_div

 alignl ' align long
C_jsll_div ' <symbol:jsll_div>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_jsll_div_76 ' GEI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_jsll_div_77 ' JUMPV addrg
C_jsll_div_76
 mov r15, #0 ' reg <- coni
C_jsll_div_77
 mov r22, r15 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_jsll_div_78 ' EQI4
 rdlong r22, r21 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_jsll_div_82 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_jsll_div_83 ' JUMPV addrg
C_jsll_div_82
 mov r13, #0 ' reg <- coni
C_jsll_div_83
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 subs r22, r13 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_jsll_div_79 ' JUMPV addrg
C_jsll_div_78
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
C_jsll_div_79
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_jsll_div_84 ' GEI4
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 xor r22, #1 ' BXORI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_jsll_div_87 ' EQI4
 mov r13, #1 ' reg <- coni
 jmp #\@C_jsll_div_88 ' JUMPV addrg
C_jsll_div_87
 mov r13, #0 ' reg <- coni
C_jsll_div_88
 mov r22, r13 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 rdlong r22, r19 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_jsll_div_91 ' EQU4
 mov r11, #1 ' reg <- coni
 jmp #\@C_jsll_div_92 ' JUMPV addrg
C_jsll_div_91
 mov r11, #0 ' reg <- coni
C_jsll_div_92
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 subs r22, r11 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_jsll_div_85 ' JUMPV addrg
C_jsll_div_84
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
C_jsll_div_85
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-20) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-36) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, ##0 ' reg ARG con
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_jsll_udivmod
 add SP, #12 ' CALL addrg
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_jsll_div_93 ' EQI4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 wrlong r22, r23 ' ASGNU4 reg reg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_jsll_div_96 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_jsll_div_97 ' JUMPV addrg
C_jsll_div_96
 mov r13, #0 ' reg <- coni
C_jsll_div_97
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 neg r20, r20 ' NEGI4
 subs r20, r13 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_jsll_div_93
' C_jsll_div_74 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Export jsll_mod

 alignl ' align long
C_jsll_mod ' <symbol:jsll_mod>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_jsll_mod_100 ' GEI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_jsll_mod_101 ' JUMPV addrg
C_jsll_mod_100
 mov r15, #0 ' reg <- coni
C_jsll_mod_101
 mov r22, r15 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_jsll_mod_102 ' EQI4
 rdlong r22, r21 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_jsll_mod_106 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_jsll_mod_107 ' JUMPV addrg
C_jsll_mod_106
 mov r13, #0 ' reg <- coni
C_jsll_mod_107
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 subs r22, r13 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_jsll_mod_103 ' JUMPV addrg
C_jsll_mod_102
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
C_jsll_mod_103
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_jsll_mod_108 ' GEI4
 rdlong r22, r19 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_jsll_mod_112 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_jsll_mod_113 ' JUMPV addrg
C_jsll_mod_112
 mov r13, #0 ' reg <- coni
C_jsll_mod_113
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 subs r22, r13 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_jsll_mod_109 ' JUMPV addrg
C_jsll_mod_108
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
C_jsll_mod_109
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-20) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-36) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, ##0 ' reg ARG con
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_jsll_udivmod
 add SP, #12 ' CALL addrg
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_jsll_mod_114 ' EQI4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 wrlong r22, r23 ' ASGNU4 reg reg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_jsll_mod_117 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_jsll_mod_118 ' JUMPV addrg
C_jsll_mod_117
 mov r13, #0 ' reg <- coni
C_jsll_mod_118
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 neg r20, r20 ' NEGI4
 subs r20, r13 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_jsll_mod_114
' C_jsll_mod_98 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Export jsll_shl

 alignl ' align long
C_jsll_shl ' <symbol:jsll_shl>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $554000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_jsll_shl_120 ' EQI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r22
 and r20, #31 ' BANDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r20, RI ' ASGNU1 addrli reg
 cmps r22,  #32 wcz
 if_ae jmp #\C_jsll_shl_122 ' GEI4
 rdlong r22, r3 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r20 ' LSHI/U (1)
 wrlong r22, r4 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
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
 jmp #\@C_jsll_shl_121 ' JUMPV addrg
C_jsll_shl_122
 mov r22, #0 ' reg <- coni
 wrlong r22, r4 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r3 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r20, r18 ' LSHI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_jsll_shl_121 ' JUMPV addrg
C_jsll_shl_120
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, r3 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
C_jsll_shl_121
' C_jsll_shl_119 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export jsll_shr

 alignl ' align long
C_jsll_shr ' <symbol:jsll_shr>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_jsll_shr_125 ' EQI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r22
 and r20, #31 ' BANDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r20, RI ' ASGNU1 addrli reg
 cmps r22,  #32 wcz
 if_ae jmp #\C_jsll_shr_127 ' GEI4
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
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
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
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 sar r20, r18 ' RSHI (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_jsll_shr_126 ' JUMPV addrg
C_jsll_shr_127
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 sar r22, r20 ' RSHI (1)
 wrlong r22, r4 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sar r20, #31 ' RSHI4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_jsll_shr_126 ' JUMPV addrg
C_jsll_shr_125
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, r3 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
C_jsll_shr_126
' C_jsll_shr_124 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export jsll_ushr

 alignl ' align long
C_jsll_ushr ' <symbol:jsll_ushr>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_jsll_ushr_130 ' EQI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r22
 and r20, #31 ' BANDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r20, RI ' ASGNU1 addrli reg
 cmps r22,  #32 wcz
 if_ae jmp #\C_jsll_ushr_132 ' GEI4
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
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
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
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shr r20, r18 ' RSHU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_jsll_ushr_131 ' JUMPV addrg
C_jsll_ushr_132
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shr r22, r20 ' RSHU (1)
 wrlong r22, r4 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_jsll_ushr_131 ' JUMPV addrg
C_jsll_ushr_130
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, r3 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
C_jsll_ushr_131
' C_jsll_ushr_129 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export rhll_real_cmp

 alignl ' align long
C_rhll_real_cmp ' <symbol:rhll_real_cmp>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ff0000 ' save registers
 mov r22, r3
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_rhll_real_cmp_135 ' NEI4
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #60 wz
 if_nz jmp #\C_rhll_real_cmp_137 ' NEI4
 jmp #\@C_rhll_real_cmp_139 ' JUMPV addrg
C_rhll_real_cmp_137
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #62 wz
 if_nz jmp #\C_rhll_real_cmp_136 ' NEI4
 jmp #\@C_rhll_real_cmp_142 ' JUMPV addrg
C_rhll_real_cmp_139
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r22 ' CVI, CVU or LOAD
 mov r16, r20 ' CVI, CVU or LOAD
 cmps r18, r16 wcz
 if_b jmp #\C_rhll_real_cmp_147 ' LTI4
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_cmp_145  ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmps r22, r20 wcz
 if_ae jmp #\C_rhll_real_cmp_145 ' GEI4
C_rhll_real_cmp_147
 mov r23, #1 ' reg <- coni
 jmp #\@C_rhll_real_cmp_146 ' JUMPV addrg
C_rhll_real_cmp_145
 mov r23, #0 ' reg <- coni
C_rhll_real_cmp_146
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_rhll_real_cmp_134 ' JUMPV addrg
C_rhll_real_cmp_142
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r22 ' CVI, CVU or LOAD
 mov r16, r20 ' CVI, CVU or LOAD
 cmps r18, r16 wcz
 if_a jmp #\C_rhll_real_cmp_151 ' GTI4
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_cmp_149  ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmps r22, r20 wcz
 if_be jmp #\C_rhll_real_cmp_149 ' LEI4
C_rhll_real_cmp_151
 mov r21, #1 ' reg <- coni
 jmp #\@C_rhll_real_cmp_150 ' JUMPV addrg
C_rhll_real_cmp_149
 mov r21, #0 ' reg <- coni
C_rhll_real_cmp_150
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_rhll_real_cmp_134 ' JUMPV addrg
C_rhll_real_cmp_135
 mov r22, r3
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #61 wz
 if_nz jmp #\C_rhll_real_cmp_153 ' NEI4
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #33 wz
 if_nz jmp #\C_rhll_real_cmp_155 ' NEI4
 jmp #\@C_rhll_real_cmp_157 ' JUMPV addrg
C_rhll_real_cmp_155
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #61 wz
 if_nz jmp #\C_rhll_real_cmp_158 ' NEI4
 jmp #\@C_rhll_real_cmp_160 ' JUMPV addrg
C_rhll_real_cmp_158
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #60 wz
 if_nz jmp #\C_rhll_real_cmp_161 ' NEI4
 jmp #\@C_rhll_real_cmp_163 ' JUMPV addrg
C_rhll_real_cmp_161
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #62 wz
 if_nz jmp #\C_rhll_real_cmp_183 ' NEI4
 jmp #\@C_rhll_real_cmp_166 ' JUMPV addrg
C_rhll_real_cmp_157
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_cmp_171  ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_z jmp #\C_rhll_real_cmp_169 ' EQU4
C_rhll_real_cmp_171
 mov r23, #1 ' reg <- coni
 jmp #\@C_rhll_real_cmp_170 ' JUMPV addrg
C_rhll_real_cmp_169
 mov r23, #0 ' reg <- coni
C_rhll_real_cmp_170
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_rhll_real_cmp_134 ' JUMPV addrg
C_rhll_real_cmp_160
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_cmp_173  ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_cmp_173  ' NEU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_rhll_real_cmp_174 ' JUMPV addrg
C_rhll_real_cmp_173
 mov r21, #0 ' reg <- coni
C_rhll_real_cmp_174
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_rhll_real_cmp_134 ' JUMPV addrg
C_rhll_real_cmp_163
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r22 ' CVI, CVU or LOAD
 mov r16, r20 ' CVI, CVU or LOAD
 cmps r18, r16 wcz
 if_b jmp #\C_rhll_real_cmp_178 ' LTI4
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_cmp_176  ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmps r22, r20 wcz
 if_a jmp #\C_rhll_real_cmp_176 ' GTI4
C_rhll_real_cmp_178
 mov r19, #1 ' reg <- coni
 jmp #\@C_rhll_real_cmp_177 ' JUMPV addrg
C_rhll_real_cmp_176
 mov r19, #0 ' reg <- coni
C_rhll_real_cmp_177
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_rhll_real_cmp_134 ' JUMPV addrg
C_rhll_real_cmp_166
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r22 ' CVI, CVU or LOAD
 mov r16, r20 ' CVI, CVU or LOAD
 cmps r18, r16 wcz
 if_a jmp #\C_rhll_real_cmp_182 ' GTI4
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_cmp_180  ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmps r22, r20 wcz
 if_b jmp #\C_rhll_real_cmp_180 ' LTI4
C_rhll_real_cmp_182
 mov r17, #1 ' reg <- coni
 jmp #\@C_rhll_real_cmp_181 ' JUMPV addrg
C_rhll_real_cmp_180
 mov r17, #0 ' reg <- coni
C_rhll_real_cmp_181
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_rhll_real_cmp_134 ' JUMPV addrg
C_rhll_real_cmp_183
C_rhll_real_cmp_153
C_rhll_real_cmp_136
 mov r0, #0 ' reg <- coni
C_rhll_real_cmp_134
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export rhll_real_ucmp

 alignl ' align long
C_rhll_real_ucmp ' <symbol:rhll_real_ucmp>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r22, r3
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_rhll_real_ucmp_185 ' NEI4
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #60 wz
 if_nz jmp #\C_rhll_real_ucmp_187 ' NEI4
 jmp #\@C_rhll_real_ucmp_189 ' JUMPV addrg
C_rhll_real_ucmp_187
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #62 wz
 if_nz jmp #\C_rhll_real_ucmp_186 ' NEI4
 jmp #\@C_rhll_real_ucmp_192 ' JUMPV addrg
C_rhll_real_ucmp_189
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_rhll_real_ucmp_197 ' LTU4
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_ucmp_195  ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_rhll_real_ucmp_195 ' GEU4
C_rhll_real_ucmp_197
 mov r23, #1 ' reg <- coni
 jmp #\@C_rhll_real_ucmp_196 ' JUMPV addrg
C_rhll_real_ucmp_195
 mov r23, #0 ' reg <- coni
C_rhll_real_ucmp_196
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_rhll_real_ucmp_184 ' JUMPV addrg
C_rhll_real_ucmp_192
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_a jmp #\C_rhll_real_ucmp_201 ' GTU4
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_ucmp_199  ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_rhll_real_ucmp_199 ' LEU4
C_rhll_real_ucmp_201
 mov r21, #1 ' reg <- coni
 jmp #\@C_rhll_real_ucmp_200 ' JUMPV addrg
C_rhll_real_ucmp_199
 mov r21, #0 ' reg <- coni
C_rhll_real_ucmp_200
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_rhll_real_ucmp_184 ' JUMPV addrg
C_rhll_real_ucmp_185
 mov r22, r3
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #61 wz
 if_nz jmp #\C_rhll_real_ucmp_203 ' NEI4
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #33 wz
 if_nz jmp #\C_rhll_real_ucmp_205 ' NEI4
 jmp #\@C_rhll_real_ucmp_207 ' JUMPV addrg
C_rhll_real_ucmp_205
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #61 wz
 if_nz jmp #\C_rhll_real_ucmp_208 ' NEI4
 jmp #\@C_rhll_real_ucmp_210 ' JUMPV addrg
C_rhll_real_ucmp_208
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #60 wz
 if_nz jmp #\C_rhll_real_ucmp_211 ' NEI4
 jmp #\@C_rhll_real_ucmp_213 ' JUMPV addrg
C_rhll_real_ucmp_211
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #62 wz
 if_nz jmp #\C_rhll_real_ucmp_233 ' NEI4
 jmp #\@C_rhll_real_ucmp_216 ' JUMPV addrg
C_rhll_real_ucmp_207
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_ucmp_221  ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_z jmp #\C_rhll_real_ucmp_219 ' EQU4
C_rhll_real_ucmp_221
 mov r23, #1 ' reg <- coni
 jmp #\@C_rhll_real_ucmp_220 ' JUMPV addrg
C_rhll_real_ucmp_219
 mov r23, #0 ' reg <- coni
C_rhll_real_ucmp_220
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_rhll_real_ucmp_184 ' JUMPV addrg
C_rhll_real_ucmp_210
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_ucmp_223  ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_ucmp_223  ' NEU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_rhll_real_ucmp_224 ' JUMPV addrg
C_rhll_real_ucmp_223
 mov r21, #0 ' reg <- coni
C_rhll_real_ucmp_224
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_rhll_real_ucmp_184 ' JUMPV addrg
C_rhll_real_ucmp_213
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_rhll_real_ucmp_228 ' LTU4
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_ucmp_226  ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_a jmp #\C_rhll_real_ucmp_226 ' GTU4
C_rhll_real_ucmp_228
 mov r19, #1 ' reg <- coni
 jmp #\@C_rhll_real_ucmp_227 ' JUMPV addrg
C_rhll_real_ucmp_226
 mov r19, #0 ' reg <- coni
C_rhll_real_ucmp_227
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_rhll_real_ucmp_184 ' JUMPV addrg
C_rhll_real_ucmp_216
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_a jmp #\C_rhll_real_ucmp_232 ' GTU4
 cmp r22, r20 wz
 if_nz jmp #\C_rhll_real_ucmp_230  ' NEU4
 rdlong r22, r4 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_rhll_real_ucmp_230 ' LTU4
C_rhll_real_ucmp_232
 mov r17, #1 ' reg <- coni
 jmp #\@C_rhll_real_ucmp_231 ' JUMPV addrg
C_rhll_real_ucmp_230
 mov r17, #0 ' reg <- coni
C_rhll_real_ucmp_231
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_rhll_real_ucmp_184 ' JUMPV addrg
C_rhll_real_ucmp_233
C_rhll_real_ucmp_203
C_rhll_real_ucmp_186
 mov r0, #0 ' reg <- coni
C_rhll_real_ucmp_184
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF

' end
