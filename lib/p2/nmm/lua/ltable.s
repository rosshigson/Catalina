' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sa44_67ea42b8_dummynode__L000013 ' <symbol:dummynode_>
 long $0
 byte $10
 byte $0
 byte 0[2]
 long 0
 long $0

 alignl ' align long
C_sa441_67ea42b8_absentkey_L000014 ' <symbol:absentkey>
 long $0
 byte $20
 byte 0[3]

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sa442_67ea42b8_hashint_L000015 ' <symbol:hashint>
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r23, r2 ' CVI, CVU or LOAD
 mov r22, ##$7fffffff ' reg <- con
 cmp r23, r22 wcz 
 if_a jmp #\C_sa442_67ea42b8_hashint_L000015_17 ' GTU4
 mov r22, #1 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov r18, r3
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 or r22, #1 ' BORI4 coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r1
 shl r22, #4 ' LSHI4 coni
 mov r20, r3
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_sa442_67ea42b8_hashint_L000015_16 ' JUMPV addrg
C_sa442_67ea42b8_hashint_L000015_17
 mov r22, #1 ' reg <- coni
 mov r20, r3
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r20 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 or r22, #1 ' BORI4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r23, r22 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r1
 shl r22, #4 ' LSHU4 coni
 mov r20, r3
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_sa442_67ea42b8_hashint_L000015_16
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sa443_67ea42b8_l_hashfloat_L000019 ' <symbol:l_hashfloat>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_frexp
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##@C_sa443_67ea42b8_l_hashfloat_L000019_21_L000022
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sa443_67ea42b8_l_hashfloat_L000019_26_L000027
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_b jmp #\C_sa443_67ea42b8_l_hashfloat_L000019_28 ' LTF4
 mov r22, ##@C_sa443_67ea42b8_l_hashfloat_L000019_21_L000022
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_sa443_67ea42b8_l_hashfloat_L000019_28 ' GEF4
 mov r0, r23 ' CVI, CVU or LOAD
 calld PA,#INFL ' CVFI4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sa443_67ea42b8_l_hashfloat_L000019_23 ' NEI4
C_sa443_67ea42b8_l_hashfloat_L000019_28
 mov r0, #0 ' reg <- coni
 jmp #\@C_sa443_67ea42b8_l_hashfloat_L000019_20 ' JUMPV addrg
C_sa443_67ea42b8_l_hashfloat_L000019_23
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$7fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_a jmp #\C_sa443_67ea42b8_l_hashfloat_L000019_30 ' GTU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRU4 reg
 jmp #\@C_sa443_67ea42b8_l_hashfloat_L000019_31 ' JUMPV addrg
C_sa443_67ea42b8_l_hashfloat_L000019_30
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r21, r22
 xor r21, all_1s ' BCOMU4
C_sa443_67ea42b8_l_hashfloat_L000019_31
 mov r0, r21 ' CVI, CVU or LOAD
C_sa443_67ea42b8_l_hashfloat_L000019_20
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sa446_67ea42b8_mainpositionT_V__L000032 ' <symbol:mainpositionTV>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #63 ' BANDI4 coni
 cmps r19,  #1 wcz
 if_b jmp #\C_sa446_67ea42b8_mainpositionT_V__L000032_34 ' LTI4
 cmps r19,  #4 wcz
 if_a jmp #\C_sa446_67ea42b8_mainpositionT_V__L000032_45 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sa446_67ea42b8_mainpositionT_V__L000032_46_L000048-4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sa446_67ea42b8_mainpositionT_V__L000032_46_L000048 ' <symbol:46>
 long @C_sa446_67ea42b8_mainpositionT_V__L000032_41
 long @C_sa446_67ea42b8_mainpositionT_V__L000032_43
 long @C_sa446_67ea42b8_mainpositionT_V__L000032_37
 long @C_sa446_67ea42b8_mainpositionT_V__L000032_39

' Catalina Code

DAT ' code segment
C_sa446_67ea42b8_mainpositionT_V__L000032_45
 cmps r19,  #17 wcz
 if_b jmp #\C_sa446_67ea42b8_mainpositionT_V__L000032_34 ' LTI4
 cmps r19,  #22 wcz
 if_a jmp #\C_sa446_67ea42b8_mainpositionT_V__L000032_34 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sa446_67ea42b8_mainpositionT_V__L000032_50_L000052-68 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sa446_67ea42b8_mainpositionT_V__L000032_50_L000052 ' <symbol:50>
 long @C_sa446_67ea42b8_mainpositionT_V__L000032_42
 long @C_sa446_67ea42b8_mainpositionT_V__L000032_34
 long @C_sa446_67ea42b8_mainpositionT_V__L000032_38
 long @C_sa446_67ea42b8_mainpositionT_V__L000032_40
 long @C_sa446_67ea42b8_mainpositionT_V__L000032_34
 long @C_sa446_67ea42b8_mainpositionT_V__L000032_44

' Catalina Code

DAT ' code segment
C_sa446_67ea42b8_mainpositionT_V__L000032_37
 rdlong r22, r21 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa442_67ea42b8_hashint_L000015
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sa446_67ea42b8_mainpositionT_V__L000032_33 ' JUMPV addrg
C_sa446_67ea42b8_mainpositionT_V__L000032_38
 rdlong r22, r21 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa443_67ea42b8_l_hashfloat_L000019 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #1 ' reg <- coni
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r20, r18 ' LSHI/U (1)
 subs r20, #1 ' SUBI4 coni
 or r20, #1 ' BORI4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r1
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_sa446_67ea42b8_mainpositionT_V__L000032_33 ' JUMPV addrg
C_sa446_67ea42b8_mainpositionT_V__L000032_39
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 and r22, r20 ' BANDI/U (2)
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_sa446_67ea42b8_mainpositionT_V__L000032_33 ' JUMPV addrg
C_sa446_67ea42b8_mainpositionT_V__L000032_40
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaS__hashlongstr ' CALL addrg
 mov r20, #1 ' reg <- coni
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
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
 jmp #\@C_sa446_67ea42b8_mainpositionT_V__L000032_33 ' JUMPV addrg
C_sa446_67ea42b8_mainpositionT_V__L000032_41
 mov r22, #0 ' reg <- coni
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_sa446_67ea42b8_mainpositionT_V__L000032_33 ' JUMPV addrg
C_sa446_67ea42b8_mainpositionT_V__L000032_42
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r20 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 and r22, #1 ' BANDI4 coni
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_sa446_67ea42b8_mainpositionT_V__L000032_33 ' JUMPV addrg
C_sa446_67ea42b8_mainpositionT_V__L000032_43
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 or r22, #1 ' BORI4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r1
 shl r22, #4 ' LSHU4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_sa446_67ea42b8_mainpositionT_V__L000032_33 ' JUMPV addrg
C_sa446_67ea42b8_mainpositionT_V__L000032_44
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 or r22, #1 ' BORI4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r1
 shl r22, #4 ' LSHU4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_sa446_67ea42b8_mainpositionT_V__L000032_33 ' JUMPV addrg
C_sa446_67ea42b8_mainpositionT_V__L000032_34
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 or r22, #1 ' BORI4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r1
 shl r22, #4 ' LSHU4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_sa446_67ea42b8_mainpositionT_V__L000032_33
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sa44b_67ea42b8_mainpositionfromnode_L000054 ' <symbol:mainpositionfromnode>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, FP
 sub r19, #-(-12) ' reg <- addrli
 mov r17, r21 ' CVI, CVU or LOAD
 mov r0, r19 ' CVI, CVU or LOAD
 mov r1, r17
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
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
 calld PA,#CALA
 long @C_sa446_67ea42b8_mainpositionT_V__L000032
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sa44b_67ea42b8_mainpositionfromnode_L000054_55 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sa44c_67ea42b8_equalkey_L000056 ' <symbol:equalkey>
 calld PA,#NEWF
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_z jmp #\C_sa44c_67ea42b8_equalkey_L000056_58 ' EQI4
 mov r18, #0 ' reg <- coni
 cmps r19, r18 wz
 if_z jmp #\C_sa44c_67ea42b8_equalkey_L000056_61 ' EQI4
 cmps r20,  #11 wz
 if_nz jmp #\C_sa44c_67ea42b8_equalkey_L000056_61 ' NEI4
 and r22, #64 ' BANDI4 coni
 cmps r22, r18 wz
 if_nz jmp #\C_sa44c_67ea42b8_equalkey_L000056_58 ' NEI4
C_sa44c_67ea42b8_equalkey_L000056_61
 mov r0, #0 ' reg <- coni
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_57 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_58
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r17, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r17,  #17 wz
 if_z jmp #\C_sa44c_67ea42b8_equalkey_L000056_65 ' EQI4
 cmps r17,  #19 wz
 if_z jmp #\C_sa44c_67ea42b8_equalkey_L000056_70 ' EQI4
 mov r22, #22 ' reg <- coni
 cmps r17, r22 wz
 if_z jmp #\C_sa44c_67ea42b8_equalkey_L000056_78 ' EQI4
 cmps r17, r22 wcz
 if_a jmp #\C_sa44c_67ea42b8_equalkey_L000056_87 ' GTI4
' C_sa44c_67ea42b8_equalkey_L000056_86 ' (symbol refcount = 0)
 cmps r17,  #0 wcz
 if_b jmp #\C_sa44c_67ea42b8_equalkey_L000056_62 ' LTI4
 cmps r17,  #3 wcz
 if_a jmp #\C_sa44c_67ea42b8_equalkey_L000056_62 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sa44c_67ea42b8_equalkey_L000056_88_L000090 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sa44c_67ea42b8_equalkey_L000056_88_L000090 ' <symbol:88>
 long @C_sa44c_67ea42b8_equalkey_L000056_65
 long @C_sa44c_67ea42b8_equalkey_L000056_65
 long @C_sa44c_67ea42b8_equalkey_L000056_74
 long @C_sa44c_67ea42b8_equalkey_L000056_66

' Catalina Code

DAT ' code segment
C_sa44c_67ea42b8_equalkey_L000056_87
 cmps r17,  #84 wz
 if_z jmp #\C_sa44c_67ea42b8_equalkey_L000056_82 ' EQI4
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_62 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_65
 mov r0, #1 ' reg <- coni
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_57 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_66
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_sa44c_67ea42b8_equalkey_L000056_68 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_69 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_68
 mov r15, #0 ' reg <- coni
C_sa44c_67ea42b8_equalkey_L000056_69
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_57 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_70
 rdlong r22, r23 ' reg <- INDIRF4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_sa44c_67ea42b8_equalkey_L000056_72 ' NEF4
 mov r13, #1 ' reg <- coni
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_73 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_72
 mov r13, #0 ' reg <- coni
C_sa44c_67ea42b8_equalkey_L000056_73
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_57 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_74
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_sa44c_67ea42b8_equalkey_L000056_76  ' NEU4
 mov r11, #1 ' reg <- coni
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_77 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_76
 mov r11, #0 ' reg <- coni
C_sa44c_67ea42b8_equalkey_L000056_77
 mov r0, r11 ' CVI, CVU or LOAD
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_57 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_78
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_sa44c_67ea42b8_equalkey_L000056_80  ' NEU4
 mov r9, #1 ' reg <- coni
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_81 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_80
 mov r9, #0 ' reg <- coni
C_sa44c_67ea42b8_equalkey_L000056_81
 mov r0, r9 ' CVI, CVU or LOAD
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_57 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_82
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__eqlngstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_57 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_62
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_sa44c_67ea42b8_equalkey_L000056_84  ' NEU4
 mov r7, #1 ' reg <- coni
 jmp #\@C_sa44c_67ea42b8_equalkey_L000056_85 ' JUMPV addrg
C_sa44c_67ea42b8_equalkey_L000056_84
 mov r7, #0 ' reg <- coni
C_sa44c_67ea42b8_equalkey_L000056_85
 mov r0, r7 ' CVI, CVU or LOAD
C_sa44c_67ea42b8_equalkey_L000056_57
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaH_realasize

 alignl ' align long
C_luaH__realasize ' <symbol:luaH_realasize>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaH__realasize_94 ' EQI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_luaH__realasize_92  ' NEU4
C_luaH__realasize_94
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRU4 reg
 jmp #\@C_luaH__realasize_91 ' JUMPV addrg
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
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sa44f_67ea42b8_ispow2realasize_L000095 ' <symbol:ispow2realasize>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sa44f_67ea42b8_ispow2realasize_L000095_100 ' NEI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_sa44f_67ea42b8_ispow2realasize_L000095_98  ' NEU4
C_sa44f_67ea42b8_ispow2realasize_L000095_100
 mov r23, #1 ' reg <- coni
 jmp #\@C_sa44f_67ea42b8_ispow2realasize_L000095_99 ' JUMPV addrg
C_sa44f_67ea42b8_ispow2realasize_L000095_98
 mov r23, #0 ' reg <- coni
C_sa44f_67ea42b8_ispow2realasize_L000095_99
 mov r0, r23 ' CVI, CVU or LOAD
' C_sa44f_67ea42b8_ispow2realasize_L000095_96 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sa44g_67ea42b8_setlimittosize_L000101 ' <symbol:setlimittosize>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__realasize ' CALL addrg
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##$ffffff7f ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_sa44g_67ea42b8_setlimittosize_L000101_102 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sa44h_67ea42b8_getgeneric_L000103 ' <symbol:getgeneric>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa446_67ea42b8_mainpositionT_V__L000032
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_sa44h_67ea42b8_getgeneric_L000103_105
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44c_67ea42b8_equalkey_L000056
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sa44h_67ea42b8_getgeneric_L000103_109 ' EQI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sa44h_67ea42b8_getgeneric_L000103_104 ' JUMPV addrg
C_sa44h_67ea42b8_getgeneric_L000103_109
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 if_nz jmp #\C_sa44h_67ea42b8_getgeneric_L000103_111 ' NEI4
 mov r0, ##@C_sa441_67ea42b8_absentkey_L000014 ' reg <- addrg
 jmp #\@C_sa44h_67ea42b8_getgeneric_L000103_104 ' JUMPV addrg
C_sa44h_67ea42b8_getgeneric_L000103_111
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 adds r17, r22 ' ADDI/P (2)
 jmp #\@C_sa44h_67ea42b8_getgeneric_L000103_105 ' JUMPV addrg
C_sa44h_67ea42b8_getgeneric_L000103_104
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sa44i_67ea42b8_arrayindex_L000113 ' <symbol:arrayindex>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 mov r20, ##$1fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_ae jmp #\C_sa44i_67ea42b8_arrayindex_L000113_115 ' GEU4
 mov r0, r2 ' CVI, CVU or LOAD
 jmp #\@C_sa44i_67ea42b8_arrayindex_L000113_114 ' JUMPV addrg
C_sa44i_67ea42b8_arrayindex_L000113_115
 mov r0, #0 ' reg <- coni
C_sa44i_67ea42b8_arrayindex_L000113_114
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sa44j_67ea42b8_findindex_L000117 ' <symbol:findindex>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sa44j_67ea42b8_findindex_L000117_119 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sa44j_67ea42b8_findindex_L000117_118 ' JUMPV addrg
C_sa44j_67ea42b8_findindex_L000117_119
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_sa44j_67ea42b8_findindex_L000117_122 ' NEI4
 rdlong r2, r19 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa44i_67ea42b8_arrayindex_L000113 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #\@C_sa44j_67ea42b8_findindex_L000117_123 ' JUMPV addrg
C_sa44j_67ea42b8_findindex_L000117_122
 mov r13, #0 ' reg <- coni
C_sa44j_67ea42b8_findindex_L000117_123
 mov r15, r13 ' CVI, CVU or LOAD
 mov r22, r15
 sub r22, #1 ' SUBU4 coni
 cmp r22, r17 wcz 
 if_ae jmp #\C_sa44j_67ea42b8_findindex_L000117_124 ' GEU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_sa44j_67ea42b8_findindex_L000117_118 ' JUMPV addrg
C_sa44j_67ea42b8_findindex_L000117_124
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44h_67ea42b8_getgeneric_L000103
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #32 wz
 if_nz jmp #\C_sa44j_67ea42b8_findindex_L000117_126 ' NEI4
 mov r2, ##@C_sa44j_67ea42b8_findindex_L000117_128_L000129 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_sa44j_67ea42b8_findindex_L000117_126
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
 calld PA,#DIVS ' DIVI
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15
 add r22, #1 ' ADDU4 coni
 mov r0, r22 ' ADDU
 add r0, r17 ' ADDU (3)
C_sa44j_67ea42b8_findindex_L000117_118
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaH_next

 alignl ' align long
C_luaH__next ' <symbol:luaH_next>
 calld PA,#NEWF
 calld PA,#PSHM
 long $feaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__realasize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44j_67ea42b8_findindex_L000117
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaH__next_134 ' JUMPV addrg
C_luaH__next_131
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaH__next_135 ' EQI4
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
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaH__next_130 ' JUMPV addrg
C_luaH__next_135
' C_luaH__next_132 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_luaH__next_134
 cmp r17, r15 wcz 
 if_b jmp #\C_luaH__next_131 ' LTU4
 sub r17, r15 ' SUBU (1)
 jmp #\@C_luaH__next_140 ' JUMPV addrg
C_luaH__next_137
 mov r22, r17
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaH__next_141 ' EQI4
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
 calld PA,#CPYB
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
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, r9
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaH__next_130 ' JUMPV addrg
C_luaH__next_141
' C_luaH__next_138 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_luaH__next_140
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, #1 ' reg <- coni
 mov r18, r21
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r20, r18 ' LSHI/U (1)
 cmps r22, r20 wcz
 if_b jmp #\C_luaH__next_137 ' LTI4
 mov r0, #0 ' reg <- coni
C_luaH__next_130
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sa44l_67ea42b8_freehash_L000143 ' <symbol:freehash>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sa44l_67ea42b8_freehash_L000143_145 ' EQU4
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r20 ' LSHI/U (1)
 mov r2, r22
 shl r2, #4 ' LSHU4 coni
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
C_sa44l_67ea42b8_freehash_L000143_145
' C_sa44l_67ea42b8_freehash_L000143_144 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sa44m_67ea42b8_computesizes_L000147 ' <symbol:computesizes>
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r21, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 mov r15, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 mov r23, #1 ' reg <- coni
 jmp #\@C_sa44m_67ea42b8_computesizes_L000147_152 ' JUMPV addrg
C_sa44m_67ea42b8_computesizes_L000147_149
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 adds r22, r3 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r21, r22 ' ADDU (1)
 mov r22, r23
 shr r22, #1 ' RSHU4 coni
 cmp r21, r22 wcz 
 if_be jmp #\C_sa44m_67ea42b8_computesizes_L000147_153 ' LEU4
 mov r15, r23 ' CVI, CVU or LOAD
 mov r17, r21 ' CVI, CVU or LOAD
C_sa44m_67ea42b8_computesizes_L000147_153
' C_sa44m_67ea42b8_computesizes_L000147_150 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 shl r23, #1 ' LSHU4 coni
C_sa44m_67ea42b8_computesizes_L000147_152
 cmp r23,  #0 wz
 if_z jmp #\C_sa44m_67ea42b8_computesizes_L000147_155 ' EQU4
 rdlong r22, r2 ' reg <- INDIRU4 reg
 mov r20, r23
 shr r20, #1 ' RSHU4 coni
 cmp r22, r20 wcz 
 if_a jmp #\C_sa44m_67ea42b8_computesizes_L000147_149 ' GTU4
C_sa44m_67ea42b8_computesizes_L000147_155
 wrlong r17, r2 ' ASGNU4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_sa44m_67ea42b8_computesizes_L000147_148 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sa44n_67ea42b8_countint_L000156 ' <symbol:countint>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa44i_67ea42b8_arrayindex_L000113 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sa44n_67ea42b8_countint_L000156_158 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaO__ceillog2 ' CALL addrg
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sa44n_67ea42b8_countint_L000156_157 ' JUMPV addrg
C_sa44n_67ea42b8_countint_L000156_158
 mov r0, #0 ' reg <- coni
C_sa44n_67ea42b8_countint_L000156_157
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sa44o_67ea42b8_numusearray_L000160 ' <symbol:numusearray>
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r15, #0 ' reg <- coni
 mov r23, #1 ' reg <- coni
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRU4 reg
 mov r21, #0 ' reg <- coni
 mov r19, #1 ' reg <- coni
 jmp #\@C_sa44o_67ea42b8_numusearray_L000160_165 ' JUMPV addrg
C_sa44o_67ea42b8_numusearray_L000160_162
 mov r11, #0 ' reg <- coni
 mov r13, r19 ' CVI, CVU or LOAD
 cmp r13, r17 wcz 
 if_be jmp #\C_sa44o_67ea42b8_numusearray_L000160_173 ' LEU4
 mov r13, r17 ' CVI, CVU or LOAD
 cmp r23, r13 wcz 
 if_be jmp #\C_sa44o_67ea42b8_numusearray_L000160_173 ' LEU4
 jmp #\@C_sa44o_67ea42b8_numusearray_L000160_164 ' JUMPV addrg
C_sa44o_67ea42b8_numusearray_L000160_170
 mov r22, r23
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sa44o_67ea42b8_numusearray_L000160_174 ' EQI4
 add r11, #1 ' ADDU4 coni
C_sa44o_67ea42b8_numusearray_L000160_174
' C_sa44o_67ea42b8_numusearray_L000160_171 ' (symbol refcount = 0)
 add r23, #1 ' ADDU4 coni
C_sa44o_67ea42b8_numusearray_L000160_173
 cmp r23, r13 wcz 
 if_be jmp #\C_sa44o_67ea42b8_numusearray_L000160_170 ' LEU4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 adds r22, r2 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r11 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 add r15, r11 ' ADDU (1)
' C_sa44o_67ea42b8_numusearray_L000160_163 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 shl r19, #1 ' LSHU4 coni
C_sa44o_67ea42b8_numusearray_L000160_165
 cmps r21,  #31 wcz
 if_be jmp #\C_sa44o_67ea42b8_numusearray_L000160_162 ' LEI4
C_sa44o_67ea42b8_numusearray_L000160_164
 mov r0, r15 ' CVI, CVU or LOAD
' C_sa44o_67ea42b8_numusearray_L000160_161 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sa44p_67ea42b8_numusehash_L000176 ' <symbol:numusehash>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r17, r22 ' LSHI/U
 shl r17, r20 ' LSHI/U (3)
 jmp #\@C_sa44p_67ea42b8_numusehash_L000176_179 ' JUMPV addrg
C_sa44p_67ea42b8_numusehash_L000176_178
 mov r22, r17
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sa44p_67ea42b8_numusehash_L000176_181 ' EQI4
 mov r22, r11
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_sa44p_67ea42b8_numusehash_L000176_183 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r11
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44n_67ea42b8_countint_L000156
 add SP, #4 ' CALL addrg
 adds r13, r0 ' ADDI/P (1)
C_sa44p_67ea42b8_numusehash_L000176_183
 adds r15, #1 ' ADDI4 coni
C_sa44p_67ea42b8_numusehash_L000176_181
C_sa44p_67ea42b8_numusehash_L000176_179
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 subs r17, #1 ' SUBI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sa44p_67ea42b8_numusehash_L000176_178 ' NEI4
 rdlong r22, r19 ' reg <- INDIRU4 reg
 mov r20, r13 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (1)
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_sa44p_67ea42b8_numusehash_L000176_177 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sa44q_67ea42b8_setnodevector_L000185 ' <symbol:setnodevector>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmp r19,  #0 wz
 if_nz jmp #\C_sa44q_67ea42b8_setnodevector_L000185_187  ' NEU4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, ##@C_sa44_67ea42b8_dummynode__L000013 ' reg <- addrg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #7 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_sa44q_67ea42b8_setnodevector_L000185_188 ' JUMPV addrg
C_sa44q_67ea42b8_setnodevector_L000185_187
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaO__ceillog2 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #30 wcz
 if_a jmp #\C_sa44q_67ea42b8_setnodevector_L000185_191 ' GTI4
 mov r22, #1 ' reg <- coni
 shl r22, r15 ' LSHI/U (1)
 mov r20, ##$fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_sa44q_67ea42b8_setnodevector_L000185_189 ' LEU4
C_sa44q_67ea42b8_setnodevector_L000185_191
 mov r2, ##@C_sa44q_67ea42b8_setnodevector_L000185_192_L000193 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_sa44q_67ea42b8_setnodevector_L000185_189
 mov r22, #1 ' reg <- coni
 shl r22, r15 ' LSHI/U (1)
 mov r19, r22 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r19
 shl r3, #4 ' LSHU4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r17, #0 ' reg <- coni
 jmp #\@C_sa44q_67ea42b8_setnodevector_L000185_197 ' JUMPV addrg
C_sa44q_67ea42b8_setnodevector_L000185_194
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
' C_sa44q_67ea42b8_setnodevector_L000185_195 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_sa44q_67ea42b8_setnodevector_L000185_197
 mov r22, r19 ' CVI, CVU or LOAD
 cmps r17, r22 wcz
 if_b jmp #\C_sa44q_67ea42b8_setnodevector_L000185_194 ' LTI4
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
C_sa44q_67ea42b8_setnodevector_L000185_188
' C_sa44q_67ea42b8_setnodevector_L000185_186 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sa44s_67ea42b8_reinsert_L000198 ' <symbol:reinsert>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $faaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r15, r22 ' LSHI/U
 shl r15, r20 ' LSHI/U (3)
 mov r17, #0 ' reg <- coni
 jmp #\@C_sa44s_67ea42b8_reinsert_L000198_203 ' JUMPV addrg
C_sa44s_67ea42b8_reinsert_L000198_200
 mov r22, r17
 shl r22, #4 ' LSHI4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sa44s_67ea42b8_reinsert_L000198_204 ' EQI4
 mov r11, FP
 sub r11, #-(-12) ' reg <- addrli
 mov r9, r13 ' CVI, CVU or LOAD
 mov r0, r11 ' CVI, CVU or LOAD
 mov r1, r9
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
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
 calld PA,#CALA
 long @C_luaH__set
 add SP, #12 ' CALL addrg
C_sa44s_67ea42b8_reinsert_L000198_204
' C_sa44s_67ea42b8_reinsert_L000198_201 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_sa44s_67ea42b8_reinsert_L000198_203
 cmps r17, r15 wcz
 if_b jmp #\C_sa44s_67ea42b8_reinsert_L000198_200 ' LTI4
' C_sa44s_67ea42b8_reinsert_L000198_199 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sa44t_67ea42b8_exchangehashpart_L000206 ' <symbol:exchangehashpart>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r3
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r3
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
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
' C_sa44t_67ea42b8_exchangehashpart_L000206_207 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export luaH_resize

 alignl ' align long
C_luaH__resize ' <symbol:luaH_resize>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa44g_67ea42b8_setlimittosize_L000101 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44q_67ea42b8_setnodevector_L000185
 add SP, #8 ' CALL addrg
 cmp r19, r13 wcz 
 if_ae jmp #\C_luaH__resize_209 ' GEU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44t_67ea42b8_exchangehashpart_L000206
 add SP, #4 ' CALL addrg
 mov r15, r19 ' CVI, CVU or LOAD
 jmp #\@C_luaH__resize_214 ' JUMPV addrg
C_luaH__resize_211
 mov r22, r15
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaH__resize_215 ' EQI4
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
 calld PA,#CALA
 long @C_luaH__setint
 add SP, #12 ' CALL addrg
C_luaH__resize_215
' C_luaH__resize_212 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_luaH__resize_214
 cmp r15, r13 wcz 
 if_b jmp #\C_luaH__resize_211 ' LTU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 wrlong r13, r22 ' ASGNU4 reg reg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44t_67ea42b8_exchangehashpart_L000206
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
 calld PA,#CALA
 long @C_luaM__realloc_
 add SP, #12 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r20, r11 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_luaH__resize_217  ' NEU4
 cmp r19, r22 wz
 if_z jmp #\C_luaH__resize_217 ' EQU4
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44l_67ea42b8_freehash_L000143
 add SP, #4 ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
C_luaH__resize_217
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44t_67ea42b8_exchangehashpart_L000206
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 wrlong r11, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r15, r13 ' CVI, CVU or LOAD
 jmp #\@C_luaH__resize_222 ' JUMPV addrg
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
 cmp r15, r19 wcz 
 if_b jmp #\C_luaH__resize_219 ' LTU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44s_67ea42b8_reinsert_L000198
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44l_67ea42b8_freehash_L000143
 add SP, #4 ' CALL addrg
' C_luaH__resize_208 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Export luaH_resizearray

 alignl ' align long
C_luaH__resizearray ' <symbol:luaH_resizearray>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaH__resizearray_225  ' NEU4
 mov r17, #0 ' reg <- coni
 jmp #\@C_luaH__resizearray_226 ' JUMPV addrg
C_luaH__resizearray_225
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r17, r22 ' LSHI/U
 shl r17, r20 ' LSHI/U (3)
C_luaH__resizearray_226
 mov RI, FP
 sub RI, #-(-8)
 wrlong r17, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__resize
 add SP, #12 ' CALL addrg
' C_luaH__resizearray_223 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sa44u_67ea42b8_rehash_L000227 ' <symbol:rehash>
 calld PA,#NEWF
 sub SP, #136
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
C_sa44u_67ea42b8_rehash_L000227_229
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-132) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
' C_sa44u_67ea42b8_rehash_L000227_230 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #31 wcz
 if_be jmp #\C_sa44u_67ea42b8_rehash_L000227_229 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa44g_67ea42b8_setlimittosize_L000101 ' CALL addrg
 mov r2, FP
 sub r2, #-(-132) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44o_67ea42b8_numusearray_L000160
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-136)
 wrlong r0, RI ' ASGNU4 addrli reg
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
 calld PA,#CALA
 long @C_sa44p_67ea42b8_numusehash_L000176
 add SP, #8 ' CALL addrg
 adds r15, r0 ' ADDI/P (1)
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_sa44u_67ea42b8_rehash_L000227_233 ' NEI4
 mov r2, FP
 sub r2, #-(-132) ' reg ARG ADDRLi
 rdlong r3, r19 ' reg <- INDIRI4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44n_67ea42b8_countint_L000156
 add SP, #4 ' CALL addrg
 mov r20, FP
 sub r20, #-(-136) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r22, r0 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-136)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sa44u_67ea42b8_rehash_L000227_233
 adds r15, #1 ' ADDI4 coni
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-132) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44m_67ea42b8_computesizes_L000147
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-140)
 wrlong r0, RI ' ASGNU4 addrli reg
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
 calld PA,#CALA
 long @C_luaH__resize
 add SP, #12 ' CALL addrg
' C_sa44u_67ea42b8_rehash_L000227_228 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #136 ' framesize
 calld PA,#RETF


' Catalina Export luaH_new

 alignl ' align long
C_luaH__new ' <symbol:luaH_new>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #32 ' reg ARG coni
 mov r3, #5 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__newobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, #63 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
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
 calld PA,#CALA
 long @C_sa44q_67ea42b8_setnodevector_L000185
 add SP, #8 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
' C_luaH__new_235 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaH_free

 alignl ' align long
C_luaH__free ' <symbol:luaH_free>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44l_67ea42b8_freehash_L000143
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__realasize ' CALL addrg
 mov r2, r0
 shl r2, #3 ' LSHU4 coni
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r2, #32 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
' C_luaH__free_236 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sa44v_67ea42b8_getfreepos_L000237 ' <symbol:getfreepos>
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sa44v_67ea42b8_getfreepos_L000237_239 ' EQU4
 jmp #\@C_sa44v_67ea42b8_getfreepos_L000237_242 ' JUMPV addrg
C_sa44v_67ea42b8_getfreepos_L000237_241
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-16 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sa44v_67ea42b8_getfreepos_L000237_244 ' NEI4
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #\@C_sa44v_67ea42b8_getfreepos_L000237_238 ' JUMPV addrg
C_sa44v_67ea42b8_getfreepos_L000237_244
C_sa44v_67ea42b8_getfreepos_L000237_242
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r2
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_a jmp #\C_sa44v_67ea42b8_getfreepos_L000237_241 ' GTU4
C_sa44v_67ea42b8_getfreepos_L000237_239
 mov r0, ##0 ' RET con
C_sa44v_67ea42b8_getfreepos_L000237_238
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaH_newkey

 alignl ' align long
C_luaH__newkey ' <symbol:luaH_newkey>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $ffa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaH__newkey_247 ' NEI4
 mov r2, ##@C_luaH__newkey_249_L000250 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
 jmp #\@C_luaH__newkey_248 ' JUMPV addrg
C_luaH__newkey_247
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaH__newkey_251 ' NEI4
 rdlong r22, r19 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaH__newkey_253 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
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
 jmp #\@C_luaH__newkey_254 ' JUMPV addrg
C_luaH__newkey_253
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_z jmp #\C_luaH__newkey_255 ' EQF4
 mov r2, ##@C_luaH__newkey_257_L000258 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaH__newkey_255
C_luaH__newkey_254
C_luaH__newkey_251
C_luaH__newkey_248
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaH__newkey_259 ' NEI4
 jmp #\@C_luaH__newkey_246 ' JUMPV addrg
C_luaH__newkey_259
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa446_67ea42b8_mainpositionT_V__L000032
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaH__newkey_263 ' NEI4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaH__newkey_261  ' NEU4
C_luaH__newkey_263
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa44v_67ea42b8_getfreepos_L000237 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaH__newkey_264  ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44u_67ea42b8_rehash_L000227
 add SP, #8 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__set
 add SP, #12 ' CALL addrg
 jmp #\@C_luaH__newkey_246 ' JUMPV addrg
C_luaH__newkey_264
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44b_67ea42b8_mainpositionfromnode_L000054
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_z jmp #\C_luaH__newkey_266 ' EQU4
 jmp #\@C_luaH__newkey_269 ' JUMPV addrg
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
 if_nz jmp #\C_luaH__newkey_268  ' NEU4
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov r20, r11 ' CVI, CVU or LOAD
 mov r18, r13 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, #16 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 wrlong r0, r22 ' ASGNI4 reg reg
 mov r0, r11 ' CVI, CVU or LOAD
 mov r1, r15 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 16 ' ASGNB
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaH__newkey_271 ' EQI4
 mov r22, r11
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r15 ' CVI, CVU or LOAD
 mov r16, r11 ' CVI, CVU or LOAD
 sub r18, r16 ' SUBU (1)
 mov r16, #16 ' reg <- coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
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
 jmp #\@C_luaH__newkey_267 ' JUMPV addrg
C_luaH__newkey_266
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaH__newkey_273 ' EQI4
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
 calld PA,#DIVS ' DIVI
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
 calld PA,#DIVS ' DIVI
 wrlong r0, r22 ' ASGNI4 reg reg
 mov r15, r11 ' CVI, CVU or LOAD
C_luaH__newkey_267
C_luaH__newkey_261
 mov r13, r15 ' CVI, CVU or LOAD
 mov r11, r19 ' CVI, CVU or LOAD
 mov r0, r13
 adds r0, #12 ' ADDP4 coni
 mov r1, r11 ' CVI, CVU or LOAD
 calld PA,#CPYB
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
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaH__newkey_276 ' EQI4
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaH__newkey_276 ' EQI4
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaH__newkey_276 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_luaH__newkey_276 ' JUMPV addrg
C_luaH__newkey_276
 mov r13, r15 ' CVI, CVU or LOAD
 mov r11, r17 ' CVI, CVU or LOAD
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaH__newkey_246
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


' Catalina Export luaH_getint

 alignl ' align long
C_luaH__getint ' <symbol:luaH_getint>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_luaH__getint_278 ' GEU4
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_luaH__getint_277 ' JUMPV addrg
C_luaH__getint_278
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaH__getint_280 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r20, r22 ' BANDI/U (2)
 cmp r20,  #0 wz
 if_z jmp #\C_luaH__getint_280 ' EQU4
 mov r20, r21 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 cmp r20, r22 wz
 if_z jmp #\C_luaH__getint_282 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__realasize ' CALL addrg
 sub r20, #1 ' SUBU4 coni
 cmp r20, r0 wcz 
 if_ae jmp #\C_luaH__getint_280 ' GEU4
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
 jmp #\@C_luaH__getint_277 ' JUMPV addrg
C_luaH__getint_280
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa442_67ea42b8_hashint_L000015
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_luaH__getint_283
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaH__getint_287 ' NEI4
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r21 wz
 if_nz jmp #\C_luaH__getint_287 ' NEI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_luaH__getint_277 ' JUMPV addrg
C_luaH__getint_287
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRI4 reg
 cmps r17,  #0 wz
 if_nz jmp #\C_luaH__getint_289 ' NEI4
 jmp #\@C_luaH__getint_285 ' JUMPV addrg
C_luaH__getint_289
 mov r22, r17
 shl r22, #4 ' LSHI4 coni
 adds r19, r22 ' ADDI/P (2)
 jmp #\@C_luaH__getint_283 ' JUMPV addrg
C_luaH__getint_285
 mov r0, ##@C_sa441_67ea42b8_absentkey_L000014 ' reg <- addrg
C_luaH__getint_277
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaH_getshortstr

 alignl ' align long
C_luaH__getshortstr ' <symbol:luaH_getshortstr>
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r22, #1 ' reg <- coni
 mov r20, r2
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r3
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
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
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #68 wz
 if_nz jmp #\C_luaH__getshortstr_296 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_luaH__getshortstr_296  ' NEU4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_luaH__getshortstr_291 ' JUMPV addrg
C_luaH__getshortstr_296
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRI4 reg
 cmps r21,  #0 wz
 if_nz jmp #\C_luaH__getshortstr_298 ' NEI4
 mov r0, ##@C_sa441_67ea42b8_absentkey_L000014 ' reg <- addrg
 jmp #\@C_luaH__getshortstr_291 ' JUMPV addrg
C_luaH__getshortstr_298
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 adds r23, r22 ' ADDI/P (2)
 jmp #\@C_luaH__getshortstr_292 ' JUMPV addrg
C_luaH__getshortstr_291
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaH_getstr

 alignl ' align long
C_luaH__getstr ' <symbol:luaH_getstr>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #4 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaH__getstr_301 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaH__getstr_300 ' JUMPV addrg
C_luaH__getstr_301
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r21, RI ' ASGNP4 addrli reg
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
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44h_67ea42b8_getgeneric_L000103
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaH__getstr_300
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Export luaH_get

 alignl ' align long
C_luaH__get ' <symbol:luaH_get>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #63 ' BANDI4 coni
 mov r22, #0 ' reg <- coni
 cmps r19, r22 wz
 if_z jmp #\C_luaH__get_309 ' EQI4
 cmps r19,  #3 wz
 if_z jmp #\C_luaH__get_308 ' EQI4
 cmps r19,  #4 wz
 if_z jmp #\C_luaH__get_307 ' EQI4
 cmps r19, r22 wcz
 if_b jmp #\C_luaH__get_304 ' LTI4
' C_luaH__get_313 ' (symbol refcount = 0)
 cmps r19,  #19 wz
 if_z jmp #\C_luaH__get_310 ' EQI4
 jmp #\@C_luaH__get_304 ' JUMPV addrg
C_luaH__get_307
 rdlong r2, r21 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaH__get_303 ' JUMPV addrg
C_luaH__get_308
 rdlong r2, r21 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaH__get_303 ' JUMPV addrg
C_luaH__get_309
 mov r0, ##@C_sa441_67ea42b8_absentkey_L000014 ' reg <- addrg
 jmp #\@C_luaH__get_303 ' JUMPV addrg
C_luaH__get_310
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 rdlong r4, r21 ' reg <- INDIRF4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaH__get_311 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaH__get_303 ' JUMPV addrg
C_luaH__get_311
C_luaH__get_304
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa44h_67ea42b8_getgeneric_L000103
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaH__get_303
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaH_finishset

 alignl ' align long
C_luaH__finishset ' <symbol:luaH_finishset>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #32 wz
 if_nz jmp #\C_luaH__finishset_315 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__newkey
 add SP, #12 ' CALL addrg
 jmp #\@C_luaH__finishset_316 ' JUMPV addrg
C_luaH__finishset_315
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
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
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export luaH_set

 alignl ' align long
C_luaH__set ' <symbol:luaH_set>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaH__finishset
 add SP, #16 ' CALL addrg
' C_luaH__set_317 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaH_setint

 alignl ' align long
C_luaH__setint ' <symbol:luaH_setint>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #32 wz
 if_nz jmp #\C_luaH__setint_319 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
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
 calld PA,#CALA
 long @C_luaH__newkey
 add SP, #12 ' CALL addrg
 jmp #\@C_luaH__setint_320 ' JUMPV addrg
C_luaH__setint_319
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
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
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sa4412_67ea42b8_hash_search_L000321 ' <symbol:hash_search>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmp r21,  #0 wz
 if_nz jmp #\C_sa4412_67ea42b8_hash_search_L000321_323  ' NEU4
 add r21, #1 ' ADDU4 coni
C_sa4412_67ea42b8_hash_search_L000321_323
C_sa4412_67ea42b8_hash_search_L000321_325
 mov r19, r21 ' CVI, CVU or LOAD
 mov r22, ##$3fffffff ' reg <- con
 cmp r21, r22 wcz 
 if_a jmp #\C_sa4412_67ea42b8_hash_search_L000321_328 ' GTU4
 shl r21, #1 ' LSHU4 coni
 jmp #\@C_sa4412_67ea42b8_hash_search_L000321_329 ' JUMPV addrg
C_sa4412_67ea42b8_hash_search_L000321_328
 mov r21, ##$7fffffff ' reg <- con
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sa4412_67ea42b8_hash_search_L000321_330 ' NEI4
 jmp #\@C_sa4412_67ea42b8_hash_search_L000321_333 ' JUMPV addrg
C_sa4412_67ea42b8_hash_search_L000321_330
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sa4412_67ea42b8_hash_search_L000321_322 ' JUMPV addrg
C_sa4412_67ea42b8_hash_search_L000321_329
' C_sa4412_67ea42b8_hash_search_L000321_326 ' (symbol refcount = 0)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sa4412_67ea42b8_hash_search_L000321_325 ' NEI4
 jmp #\@C_sa4412_67ea42b8_hash_search_L000321_333 ' JUMPV addrg
C_sa4412_67ea42b8_hash_search_L000321_332
 mov r22, r19 ' ADDU
 add r22, r21 ' ADDU (3)
 mov r17, r22
 shr r17, #1 ' RSHU4 coni
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sa4412_67ea42b8_hash_search_L000321_335 ' NEI4
 mov r21, r17 ' CVI, CVU or LOAD
 jmp #\@C_sa4412_67ea42b8_hash_search_L000321_336 ' JUMPV addrg
C_sa4412_67ea42b8_hash_search_L000321_335
 mov r19, r17 ' CVI, CVU or LOAD
C_sa4412_67ea42b8_hash_search_L000321_336
C_sa4412_67ea42b8_hash_search_L000321_333
 mov r22, r21 ' SUBU
 sub r22, r19 ' SUBU (3)
 cmp r22,  #1 wcz 
 if_a jmp #\C_sa4412_67ea42b8_hash_search_L000321_332 ' GTU4
 mov r0, r19 ' CVI, CVU or LOAD
C_sa4412_67ea42b8_hash_search_L000321_322
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sa4413_67ea42b8_binsearch_L000337 ' <symbol:binsearch>
 calld PA,#PSHM
 long $c00000 ' save registers
 jmp #\@C_sa4413_67ea42b8_binsearch_L000337_340 ' JUMPV addrg
C_sa4413_67ea42b8_binsearch_L000337_339
 mov r22, r3 ' ADDU
 add r22, r2 ' ADDU (3)
 mov r23, r22
 shr r23, #1 ' RSHU4 coni
 mov r22, r23
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 adds r22, r4 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sa4413_67ea42b8_binsearch_L000337_342 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #\@C_sa4413_67ea42b8_binsearch_L000337_343 ' JUMPV addrg
C_sa4413_67ea42b8_binsearch_L000337_342
 mov r3, r23 ' CVI, CVU or LOAD
C_sa4413_67ea42b8_binsearch_L000337_343
C_sa4413_67ea42b8_binsearch_L000337_340
 mov r22, r2 ' SUBU
 sub r22, r3 ' SUBU (3)
 cmp r22,  #1 wcz 
 if_a jmp #\C_sa4413_67ea42b8_binsearch_L000337_339 ' GTU4
 mov r0, r3 ' CVI, CVU or LOAD
' C_sa4413_67ea42b8_binsearch_L000337_338 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaH_getn

 alignl ' align long
C_luaH__getn ' <symbol:luaH_getn>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRU4 reg
 cmp r21,  #0 wz
 if_z jmp #\C_luaH__getn_345 ' EQU4
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaH__getn_345 ' NEI4
 mov r22, #2 ' reg <- coni
 cmp r21, r22 wcz 
 if_b jmp #\C_luaH__getn_347 ' LTU4
 mov r22, r21
 sub r22, #2 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaH__getn_347 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa44f_67ea42b8_ispow2realasize_L000095 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaH__getn_349 ' EQI4
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_z jmp #\C_luaH__getn_349 ' EQU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, r21
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #128 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaH__getn_349
 mov r0, r21
 sub r0, #1 ' SUBU4 coni
 jmp #\@C_luaH__getn_344 ' JUMPV addrg
C_luaH__getn_347
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa4413_67ea42b8_binsearch_L000337
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa44f_67ea42b8_ispow2realasize_L000095 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_luaH__getn_351 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__realasize ' CALL addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r22, r0
 shr r22, #1 ' RSHU4 coni
 cmp r20, r22 wcz 
 if_be jmp #\C_luaH__getn_351 ' LEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #128 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaH__getn_351
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
 jmp #\@C_luaH__getn_344 ' JUMPV addrg
C_luaH__getn_345
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaH__getn_353 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_z jmp #\C_luaH__getn_353 ' EQU4
 mov r22, r21
 shl r22, #3 ' LSHU4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaH__getn_355 ' NEI4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_luaH__getn_344 ' JUMPV addrg
C_luaH__getn_355
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
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
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaH__getn_357 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa4413_67ea42b8_binsearch_L000337
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
 jmp #\@C_luaH__getn_344 ' JUMPV addrg
C_luaH__getn_357
C_luaH__getn_353
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_luaH__getn_361 ' EQU4
 mov r22, r21
 add r22, #1 ' ADDU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaH__getn_359 ' NEI4
C_luaH__getn_361
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_luaH__getn_344 ' JUMPV addrg
C_luaH__getn_359
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa4412_67ea42b8_hash_search_L000321
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaH__getn_344
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


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
C_sa44q_67ea42b8_setnodevector_L000185_192_L000193 ' <symbol:192>
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
C_sa44j_67ea42b8_findindex_L000117_128_L000129 ' <symbol:128>
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
C_sa443_67ea42b8_l_hashfloat_L000019_26_L000027 ' <symbol:26>
 long $cf000000 ' float

 alignl ' align long
C_sa443_67ea42b8_l_hashfloat_L000019_21_L000022 ' <symbol:21>
 long $4f000000 ' float

' Catalina Code

DAT ' code segment
' end
