' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_OpenFile

 alignl ' align long
C_D_F_S__O_penF_ile ' <symbol:DFS_OpenFile>
 calld PA,#NEWF
 sub SP, #132
 calld PA,#PSHM
 long $ffaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, #28 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, r17
 adds r22, #9 ' ADDP4 coni
 wrbyte r21, r22 ' ASGNU1 reg reg
 mov r2, #64 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-100) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-37)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, FP
 sub r2, #-(-100) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_D_F_S__O_penF_ile_9 ' EQI4
 mov r0, #4 ' reg <- coni
 jmp #\@C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_8
 mov r2, FP
 sub r2, #-(-99) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-100) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
C_D_F_S__O_penF_ile_9
 mov r22, FP
 sub r22, #-(-100) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #47 wz
 if_z jmp #\C_D_F_S__O_penF_ile_8 ' EQI4
 mov r15, FP
 sub r15, #-(-100) ' reg <- addrli
C_D_F_S__O_penF_ile_12
' C_D_F_S__O_penF_ile_13 ' (symbol refcount = 0)
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_D_F_S__O_penF_ile_12 ' NEI4
 mov r22, ##-1 ' reg <- con
 adds r15, r22 ' ADDI/P (1)
 jmp #\@C_D_F_S__O_penF_ile_16 ' JUMPV addrg
C_D_F_S__O_penF_ile_15
 mov r22, ##-1 ' reg <- con
 adds r15, r22 ' ADDI/P (1)
C_D_F_S__O_penF_ile_16
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-100) ' reg <- addrli
 cmp r22, r20 wcz 
 if_be jmp #\C_D_F_S__O_penF_ile_18 ' LEU4
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #47 wz
 if_nz jmp #\C_D_F_S__O_penF_ile_15 ' NEI4
C_D_F_S__O_penF_ile_18
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #47 wz
 if_nz jmp #\C_D_F_S__O_penF_ile_19 ' NEI4
 adds r15, #1 ' ADDP4 coni
C_D_F_S__O_penF_ile_19
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-128) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__C_anonicalT_oD_ir
 add SP, #4 ' CALL addrg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-100) ' reg <- addrli
 cmp r22, r20 wcz 
 if_be jmp #\C_D_F_S__O_penF_ile_21 ' LEU4
 mov r22, ##-1 ' reg <- con
 adds r15, r22 ' ADDI/P (1)
C_D_F_S__O_penF_ile_21
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #47 wz
 if_z jmp #\C_D_F_S__O_penF_ile_25 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-100) ' reg <- addrli
 cmp r22, r20 wz
 if_nz jmp #\C_D_F_S__O_penF_ile_23  ' NEU4
C_D_F_S__O_penF_ile_25
 mov r22, #0 ' reg <- coni
 wrbyte r22, r15 ' ASGNU1 reg reg
C_D_F_S__O_penF_ile_23
 mov RI, FP
 sub RI, #-(-108)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-132)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, FP
 sub r2, #-(-116) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-100) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__O_penD_ir
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_D_F_S__O_penF_ile_30 ' EQU4
 mov r0, #3 ' reg <- coni
 jmp #\@C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_29
 mov r2, #11 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-128) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_D_F_S__O_penF_ile_32 ' NEI4
 mov r22, FP
 sub r22, #-(-25) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_D_F_S__O_penF_ile_34 ' EQI4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #6 wz
 if_z jmp #\C_D_F_S__O_penF_ile_34 ' EQI4
 cmps r22,  #4 wz
 if_z jmp #\C_D_F_S__O_penF_ile_34 ' EQI4
 mov r0, #3 ' reg <- coni
 jmp #\@C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_34
 mov r22, FP
 sub r22, #-(-25) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_D_F_S__O_penF_ile_37 ' NEI4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #6 wz
 if_z jmp #\C_D_F_S__O_penF_ile_40 ' EQI4
 cmps r22,  #4 wz
 if_nz jmp #\C_D_F_S__O_penF_ile_37 ' NEI4
C_D_F_S__O_penF_ile_40
 mov r0, #3 ' reg <- coni
 jmp #\@C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_37
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_D_F_S__O_penF_ile_41  ' NEU4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-112) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_D_F_S__O_penF_ile_42 ' JUMPV addrg
C_D_F_S__O_penF_ile_41
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 mov r18, r22
 adds r18, #48 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 mov r16, FP
 sub r16, #-(-116) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 reg
 sub r16, #2 ' SUBU4 coni
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r16, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r18 ' ADDU
 add r22, r0 ' ADDU (3)
 mov r18, FP
 sub r18, #-(-112) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 add r22, r18 ' ADDU (1)
 wrlong r22, r20 ' ASGNU4 reg reg
C_D_F_S__O_penF_ile_42
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-111) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 subs r20, #1 ' SUBI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_nz jmp #\C_D_F_S__O_penF_ile_46 ' NEI4
 mov r22, r17
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-10) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r18, FP
 sub r18, #-(-9) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r18, #8 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r18, #16 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, FP
 sub r18, #-(-15) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r18, #24 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_D_F_S__O_penF_ile_47 ' JUMPV addrg
C_D_F_S__O_penF_ile_46
 mov r22, r17
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-10) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r18, FP
 sub r18, #-(-9) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r18, #8 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_D_F_S__O_penF_ile_47
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov r20, r17
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r18, FP
 sub r18, #-(-7) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r18, #8 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, FP
 sub r18, #-(-6) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r18, #16 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, FP
 sub r18, #-(-5) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r18, #24 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_32
C_D_F_S__O_penF_ile_30
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-116) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__G_etN_ext
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_D_F_S__O_penF_ile_29 ' EQU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_D_F_S__O_penF_ile_58 ' EQI4
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-116) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-100) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__G_etF_reeD_irE_nt
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_D_F_S__O_penF_ile_60 ' EQI4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_60
 mov r2, #32 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-128) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-23)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_D_F_S__F_A_T_time ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-136)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-22)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #8 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-136)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-21)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #8 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-136)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #8 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-136)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-19)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-18)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-19) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-17)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-22) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-14)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-21) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-13)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-19) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-11)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #6 wz
 if_nz jmp #\C_D_F_S__O_penF_ile_79 ' NEI4
 mov r22, FP
 sub r22, #-(-25) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #16 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-25)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_D_F_S__O_penF_ile_79
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__G_etF_reeF_A_T_
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-10)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, ##$ff00 ' reg <- con
 and r22, r13 ' BANDI/U (2)
 shr r22, #8 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-9)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, ##$ff0000 ' reg <- con
 and r22, r13 ' BANDI/U (2)
 shr r22, #16 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, ##$ff000000 ' reg <- con
 and r22, r13 ' BANDI/U (2)
 shr r22, #24 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-15)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_D_F_S__O_penF_ile_86  ' NEU4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-112) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_D_F_S__O_penF_ile_87 ' JUMPV addrg
C_D_F_S__O_penF_ile_86
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 mov r18, r22
 adds r18, #48 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 mov r16, FP
 sub r16, #-(-116) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 reg
 sub r16, #2 ' SUBU4 coni
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r16, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r18 ' ADDU
 add r22, r0 ' ADDU (3)
 mov r18, FP
 sub r18, #-(-112) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 add r22, r18 ' ADDU (1)
 wrlong r22, r20 ' ASGNU4 reg reg
C_D_F_S__O_penF_ile_87
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-111) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
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
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_D_F_S__O_penF_ile_91 ' EQU4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_91
 mov r2, #32 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-111) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 shl r22, #5 ' LSHI4 coni
 subs r22, #32 ' SUBI4 coni
 mov r4, r22 ' ADDI/P
 adds r4, r19 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
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
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_D_F_S__O_penF_ile_94 ' EQU4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_94
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r11, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r11,  #0 wz
 if_z jmp #\C_D_F_S__O_penF_ile_99 ' EQI4
 cmps r11,  #1 wz
 if_z jmp #\C_D_F_S__O_penF_ile_100 ' EQI4
 cmps r11,  #2 wz
 if_z jmp #\C_D_F_S__O_penF_ile_101 ' EQI4
 jmp #\@C_D_F_S__O_penF_ile_96 ' JUMPV addrg
C_D_F_S__O_penF_ile_99
 mov r0, #7 ' reg <- coni
 jmp #\@C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_100
 mov r13, ##$fff8 ' reg <- con
 jmp #\@C_D_F_S__O_penF_ile_97 ' JUMPV addrg
C_D_F_S__O_penF_ile_101
 mov r13, ##$ffffff8 ' reg <- con
 jmp #\@C_D_F_S__O_penF_ile_97 ' JUMPV addrg
C_D_F_S__O_penF_ile_96
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_97
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-136)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #20 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r4, FP
 sub r4, #-(-136) ' reg ARG ADDRLi
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_D_F_S__S_etF_A_T_
 add SP, #16 ' CALL addrg
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #6 wz
 if_nz jmp #\C_D_F_S__O_penF_ile_102 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r17
 adds r18, #20 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r18, #2 ' SUBU4 coni
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r18, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r7, r20 ' ADDU
 add r7, r0 ' ADDU (3)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 add r22, r7 ' ADDU (2)
 mov r9, r22
 sub r9, #1 ' SUBU4 coni
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #2 wcz 
 if_a jmp #\C_D_F_S__O_penF_ile_104 ' GTU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-132)
 wrlong r22, RI ' ASGNU4 addrli reg
C_D_F_S__O_penF_ile_104
 mov r2, ##512 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 jmp #\@C_D_F_S__O_penF_ile_109 ' JUMPV addrg
C_D_F_S__O_penF_ile_106
 mov r2, #1 ' reg ARG coni
 mov r3, r9 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
' C_D_F_S__O_penF_ile_107 ' (symbol refcount = 0)
 sub r9, #1 ' SUBU4 coni
C_D_F_S__O_penF_ile_109
 cmp r9, r7 wcz 
 if_a jmp #\C_D_F_S__O_penF_ile_106 ' GTU4
 mov r2, #11 ' reg ARG coni
 mov r3, ##@C_D_F_S__O_penF_ile_110_L000111 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-7)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-6)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-5)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, #32 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 mov r3, ##@C_D_F_S__O_penF_ile_116_L000117 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-10)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ff00 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shr r22, #8 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-9)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ff0000 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shr r22, #16 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ff000000 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shr r22, #24 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-15)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #32 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r19
 adds r4, #32 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r7 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
C_D_F_S__O_penF_ile_102
 mov r0, #0 ' reg <- coni
 jmp #\@C_D_F_S__O_penF_ile_4 ' JUMPV addrg
C_D_F_S__O_penF_ile_58
 mov r0, #3 ' reg <- coni
C_D_F_S__O_penF_ile_4
 calld PA,#POPM ' restore registers
 add SP, #132 ' framesize
 calld PA,#RETF


' Catalina Import DFS_SetFAT

' Catalina Import DFS_GetFreeFAT

' Catalina Import DFS_FATtime

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
C_D_F_S__O_penF_ile_116_L000117 ' <symbol:116>
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
C_D_F_S__O_penF_ile_110_L000111 ' <symbol:110>
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
