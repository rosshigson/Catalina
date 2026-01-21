' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s9v4_696dded2_dummynode__L000015 ' <symbol:dummynode_>
 long $0
 byte $10
 byte $0
 byte 0[2]
 long 0
 long $0

 alignl ' align long
C_s9v41_696dded2_absentkey_L000016 ' <symbol:absentkey>
 long $0
 byte $20
 byte 0[3]

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s9v42_696dded2_hashint_L000017 ' <symbol:hashint>
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' CVI, CVU or LOAD
 jmp #LODL
 long $7fffffff
 mov r22, RI ' reg <- con
 cmp r23, r22 wz,wc 
 jmp #BR_A
 long @C_s9v42_696dded2_hashint_L000017_19 ' GTU4
 mov r22, #1 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov r18, r3
 adds r18, #7 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
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
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_s9v42_696dded2_hashint_L000017_18 ' JUMPV addrg
C_s9v42_696dded2_hashint_L000017_19
 mov r22, #1 ' reg <- coni
 mov r20, r3
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
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
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_s9v42_696dded2_hashint_L000017_18
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s9v43_696dded2_l_hashfloat_L000021 ' <symbol:l_hashfloat>
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
 long @C_s9v43_696dded2_l_hashfloat_L000021_23_L000024
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s9v43_696dded2_l_hashfloat_L000021_28_L000029
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_s9v43_696dded2_l_hashfloat_L000021_30 ' LTF4
 jmp #LODI
 long @C_s9v43_696dded2_l_hashfloat_L000021_23_L000024
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s9v43_696dded2_l_hashfloat_L000021_30 ' GEF4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9v43_696dded2_l_hashfloat_L000021_25 ' NEI4
C_s9v43_696dded2_l_hashfloat_L000021_30
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_s9v43_696dded2_l_hashfloat_L000021_22 ' JUMPV addrg
C_s9v43_696dded2_l_hashfloat_L000021_25
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $7fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_s9v43_696dded2_l_hashfloat_L000021_32 ' GTU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRU4 regl
 jmp #JMPA
 long @C_s9v43_696dded2_l_hashfloat_L000021_33 ' JUMPV addrg
C_s9v43_696dded2_l_hashfloat_L000021_32
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r21, r22
 xor r21, all_1s ' BCOMU4
C_s9v43_696dded2_l_hashfloat_L000021_33
 mov r0, r21 ' CVI, CVU or LOAD
C_s9v43_696dded2_l_hashfloat_L000021_22
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_s9v46_696dded2_mainpositionT_V__L000034 ' <symbol:mainpositionTV>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r22
 and r19, #63 ' BANDI4 coni
 cmps r19,  #1 wz,wc
 jmp #BR_B
 long @C_s9v46_696dded2_mainpositionT_V__L000034_36 ' LTI4
 cmps r19,  #4 wz,wc
 jmp #BR_A
 long @C_s9v46_696dded2_mainpositionT_V__L000034_47 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s9v46_696dded2_mainpositionT_V__L000034_48_L000050-4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s9v46_696dded2_mainpositionT_V__L000034_48_L000050 ' <symbol:48>
 long @C_s9v46_696dded2_mainpositionT_V__L000034_43
 long @C_s9v46_696dded2_mainpositionT_V__L000034_45
 long @C_s9v46_696dded2_mainpositionT_V__L000034_39
 long @C_s9v46_696dded2_mainpositionT_V__L000034_41

' Catalina Code

DAT ' code segment
C_s9v46_696dded2_mainpositionT_V__L000034_47
 cmps r19,  #17 wz,wc
 jmp #BR_B
 long @C_s9v46_696dded2_mainpositionT_V__L000034_36 ' LTI4
 cmps r19,  #22 wz,wc
 jmp #BR_A
 long @C_s9v46_696dded2_mainpositionT_V__L000034_36 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s9v46_696dded2_mainpositionT_V__L000034_52_L000054-68
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s9v46_696dded2_mainpositionT_V__L000034_52_L000054 ' <symbol:52>
 long @C_s9v46_696dded2_mainpositionT_V__L000034_44
 long @C_s9v46_696dded2_mainpositionT_V__L000034_36
 long @C_s9v46_696dded2_mainpositionT_V__L000034_40
 long @C_s9v46_696dded2_mainpositionT_V__L000034_42
 long @C_s9v46_696dded2_mainpositionT_V__L000034_36
 long @C_s9v46_696dded2_mainpositionT_V__L000034_46

' Catalina Code

DAT ' code segment
C_s9v46_696dded2_mainpositionT_V__L000034_39
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v42_696dded2_hashint_L000017
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v46_696dded2_mainpositionT_V__L000034_35 ' JUMPV addrg
C_s9v46_696dded2_mainpositionT_V__L000034_40
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s9v43_696dded2_l_hashfloat_L000021 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #1 ' reg <- coni
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
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
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_s9v46_696dded2_mainpositionT_V__L000034_35 ' JUMPV addrg
C_s9v46_696dded2_mainpositionT_V__L000034_41
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 and r22, r20 ' BANDI/U (2)
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_s9v46_696dded2_mainpositionT_V__L000034_35 ' JUMPV addrg
C_s9v46_696dded2_mainpositionT_V__L000034_42
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaS__hashlongstr ' CALL addrg
 mov r20, #1 ' reg <- coni
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r20, r18 ' LSHI/U (1)
 subs r20, #1 ' SUBI4 coni
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_s9v46_696dded2_mainpositionT_V__L000034_35 ' JUMPV addrg
C_s9v46_696dded2_mainpositionT_V__L000034_43
 mov r22, #0 ' reg <- coni
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_s9v46_696dded2_mainpositionT_V__L000034_35 ' JUMPV addrg
C_s9v46_696dded2_mainpositionT_V__L000034_44
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 and r22, #1 ' BANDI4 coni
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_s9v46_696dded2_mainpositionT_V__L000034_35 ' JUMPV addrg
C_s9v46_696dded2_mainpositionT_V__L000034_45
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
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
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_s9v46_696dded2_mainpositionT_V__L000034_35 ' JUMPV addrg
C_s9v46_696dded2_mainpositionT_V__L000034_46
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
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
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_s9v46_696dded2_mainpositionT_V__L000034_35 ' JUMPV addrg
C_s9v46_696dded2_mainpositionT_V__L000034_36
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
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
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_s9v46_696dded2_mainpositionT_V__L000034_35
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s9v4b_696dded2_mainpositionfromnode_L000056 ' <symbol:mainpositionfromnode>
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
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v46_696dded2_mainpositionT_V__L000034
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s9v4b_696dded2_mainpositionfromnode_L000056_57 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s9v4c_696dded2_equalkey_L000058 ' <symbol:equalkey>
 jmp #NEWF
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_s9v4c_696dded2_equalkey_L000058_60 ' EQI4
 mov r18, #0 ' reg <- coni
 cmps r19, r18 wz
 jmp #BR_Z
 long @C_s9v4c_696dded2_equalkey_L000058_63 ' EQI4
 cmps r20,  #11 wz
 jmp #BRNZ
 long @C_s9v4c_696dded2_equalkey_L000058_63 ' NEI4
 and r22, #64 ' BANDI4 coni
 cmps r22, r18 wz
 jmp #BRNZ
 long @C_s9v4c_696dded2_equalkey_L000058_60 ' NEI4
C_s9v4c_696dded2_equalkey_L000058_63
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_59 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_60
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 cmps r17,  #17 wz
 jmp #BR_Z
 long @C_s9v4c_696dded2_equalkey_L000058_67 ' EQI4
 cmps r17,  #19 wz
 jmp #BR_Z
 long @C_s9v4c_696dded2_equalkey_L000058_72 ' EQI4
 mov r22, #22 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_s9v4c_696dded2_equalkey_L000058_80 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_A
 long @C_s9v4c_696dded2_equalkey_L000058_89 ' GTI4
' C_s9v4c_696dded2_equalkey_L000058_88 ' (symbol refcount = 0)
 cmps r17,  #0 wz,wc
 jmp #BR_B
 long @C_s9v4c_696dded2_equalkey_L000058_64 ' LTI4
 cmps r17,  #3 wz,wc
 jmp #BR_A
 long @C_s9v4c_696dded2_equalkey_L000058_64 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s9v4c_696dded2_equalkey_L000058_90_L000092
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s9v4c_696dded2_equalkey_L000058_90_L000092 ' <symbol:90>
 long @C_s9v4c_696dded2_equalkey_L000058_67
 long @C_s9v4c_696dded2_equalkey_L000058_67
 long @C_s9v4c_696dded2_equalkey_L000058_76
 long @C_s9v4c_696dded2_equalkey_L000058_68

' Catalina Code

DAT ' code segment
C_s9v4c_696dded2_equalkey_L000058_89
 cmps r17,  #84 wz
 jmp #BR_Z
 long @C_s9v4c_696dded2_equalkey_L000058_84 ' EQI4
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_64 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_67
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_59 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_68
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s9v4c_696dded2_equalkey_L000058_70 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_71 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_70
 mov r15, #0 ' reg <- coni
C_s9v4c_696dded2_equalkey_L000058_71
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_59 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_72
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRF4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_s9v4c_696dded2_equalkey_L000058_74 ' NEF4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_75 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_74
 mov r13, #0 ' reg <- coni
C_s9v4c_696dded2_equalkey_L000058_75
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_59 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_76
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s9v4c_696dded2_equalkey_L000058_78 ' NEU4
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_79 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_78
 mov r11, #0 ' reg <- coni
C_s9v4c_696dded2_equalkey_L000058_79
 mov r0, r11 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_59 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_80
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s9v4c_696dded2_equalkey_L000058_82 ' NEU4
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_83 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_82
 mov r9, #0 ' reg <- coni
C_s9v4c_696dded2_equalkey_L000058_83
 mov r0, r9 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_59 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_84
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov RI, r23
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__eqlngstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_59 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_64
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s9v4c_696dded2_equalkey_L000058_86 ' NEU4
 mov r7, #1 ' reg <- coni
 jmp #JMPA
 long @C_s9v4c_696dded2_equalkey_L000058_87 ' JUMPV addrg
C_s9v4c_696dded2_equalkey_L000058_86
 mov r7, #0 ' reg <- coni
C_s9v4c_696dded2_equalkey_L000058_87
 mov r0, r7 ' CVI, CVU or LOAD
C_s9v4c_696dded2_equalkey_L000058_59
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaH_realasize

 alignl ' align long
C_luaH__realasize ' <symbol:luaH_realasize>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__realasize_96 ' EQI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__realasize_94 ' NEU4
C_luaH__realasize_96
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRU4 reg
 jmp #JMPA
 long @C_luaH__realasize_93 ' JUMPV addrg
C_luaH__realasize_94
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRU4 reg
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
C_luaH__realasize_93
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s9v4f_696dded2_ispow2realasize_L000097 ' <symbol:ispow2realasize>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9v4f_696dded2_ispow2realasize_L000097_102 ' NEI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s9v4f_696dded2_ispow2realasize_L000097_100 ' NEU4
C_s9v4f_696dded2_ispow2realasize_L000097_102
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_s9v4f_696dded2_ispow2realasize_L000097_101 ' JUMPV addrg
C_s9v4f_696dded2_ispow2realasize_L000097_100
 mov r23, #0 ' reg <- coni
C_s9v4f_696dded2_ispow2realasize_L000097_101
 mov r0, r23 ' CVI, CVU or LOAD
' C_s9v4f_696dded2_ispow2realasize_L000097_98 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s9v4g_696dded2_setlimittosize_L000103 ' <symbol:setlimittosize>
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
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long $ffffff7f
 mov r18, RI ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRU4 reg
' C_s9v4g_696dded2_setlimittosize_L000103_104 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9v4h_696dded2_getgeneric_L000105 ' <symbol:getgeneric>
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
 long @C_s9v46_696dded2_mainpositionT_V__L000034
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_s9v4h_696dded2_getgeneric_L000105_107
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4c_696dded2_equalkey_L000058
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s9v4h_696dded2_getgeneric_L000105_111 ' EQI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v4h_696dded2_getgeneric_L000105_106 ' JUMPV addrg
C_s9v4h_696dded2_getgeneric_L000105_111
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 jmp #BRNZ
 long @C_s9v4h_696dded2_getgeneric_L000105_113 ' NEI4
 jmp #LODL
 long @C_s9v41_696dded2_absentkey_L000016
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_s9v4h_696dded2_getgeneric_L000105_106 ' JUMPV addrg
C_s9v4h_696dded2_getgeneric_L000105_113
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 adds r17, r22 ' ADDI/P (2)
 jmp #JMPA
 long @C_s9v4h_696dded2_getgeneric_L000105_107 ' JUMPV addrg
C_s9v4h_696dded2_getgeneric_L000105_106
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9v4i_696dded2_arrayindex_L000115 ' <symbol:arrayindex>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 jmp #LODL
 long $1fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s9v4i_696dded2_arrayindex_L000115_117 ' GEU4
 mov r0, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v4i_696dded2_arrayindex_L000115_116 ' JUMPV addrg
C_s9v4i_696dded2_arrayindex_L000115_117
 mov r0, #0 ' reg <- coni
C_s9v4i_696dded2_arrayindex_L000115_116
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s9v4j_696dded2_findindex_L000119 ' <symbol:findindex>
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
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9v4j_696dded2_findindex_L000119_121 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_s9v4j_696dded2_findindex_L000119_120 ' JUMPV addrg
C_s9v4j_696dded2_findindex_L000119_121
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_s9v4j_696dded2_findindex_L000119_124 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s9v4i_696dded2_arrayindex_L000115 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v4j_696dded2_findindex_L000119_125 ' JUMPV addrg
C_s9v4j_696dded2_findindex_L000119_124
 mov r13, #0 ' reg <- coni
C_s9v4j_696dded2_findindex_L000119_125
 mov r15, r13 ' CVI, CVU or LOAD
 mov r22, r15
 sub r22, #1 ' SUBU4 coni
 cmp r22, r17 wz,wc 
 jmp #BRAE
 long @C_s9v4j_696dded2_findindex_L000119_126 ' GEU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v4j_696dded2_findindex_L000119_120 ' JUMPV addrg
C_s9v4j_696dded2_findindex_L000119_126
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4h_696dded2_getgeneric_L000105
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #32 wz
 jmp #BRNZ
 long @C_s9v4j_696dded2_findindex_L000119_128 ' NEI4
 jmp #LODL
 long @C_s9v4j_696dded2_findindex_L000119_130_L000131
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_s9v4j_696dded2_findindex_L000119_128
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
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
C_s9v4j_696dded2_findindex_L000119_120
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
 long @C_s9v4j_696dded2_findindex_L000119
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__next_136 ' JUMPV addrg
C_luaH__next_133
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__next_137 ' EQI4
 mov r13, r19 ' CVI, CVU or LOAD
 mov r22, r17
 add r22, #1 ' ADDU4 coni
 mov RI, r13
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r13, r19
 adds r13, #8 ' ADDP4 coni
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
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
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaH__next_132 ' JUMPV addrg
C_luaH__next_137
' C_luaH__next_134 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_luaH__next_136
 cmp r17, r15 wz,wc 
 jmp #BR_B
 long @C_luaH__next_133' LTU4
 sub r17, r15 ' SUBU (1)
 jmp #JMPA
 long @C_luaH__next_142 ' JUMPV addrg
C_luaH__next_139
 mov r22, r17
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__next_143 ' EQI4
 mov r22, r17
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
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
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
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
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaH__next_132 ' JUMPV addrg
C_luaH__next_143
' C_luaH__next_140 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_luaH__next_142
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, #1 ' reg <- coni
 mov r18, r21
 adds r18, #7 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r20, r18 ' LSHI/U (1)
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_luaH__next_139 ' LTI4
 mov r0, #0 ' reg <- coni
C_luaH__next_132
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9v4l_696dded2_freehash_L000145 ' <symbol:freehash>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s9v4l_696dded2_freehash_L000145_147 ' EQU4
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 mov r2, r22
 shl r2, #4 ' LSHU4 coni
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
C_s9v4l_696dded2_freehash_L000145_147
' C_s9v4l_696dded2_freehash_L000145_146 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9v4m_696dded2_computesizes_L000149 ' <symbol:computesizes>
 jmp #PSHM
 long $fa8000 ' save registers
 mov r21, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 mov r15, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_s9v4m_696dded2_computesizes_L000149_154 ' JUMPV addrg
C_s9v4m_696dded2_computesizes_L000149_151
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 adds r22, r3 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r21, r22 ' ADDU (1)
 mov r22, r23
 shr r22, #1 ' RSHU4 coni
 cmp r21, r22 wz,wc 
 jmp #BRBE
 long @C_s9v4m_696dded2_computesizes_L000149_155 ' LEU4
 mov r15, r23 ' CVI, CVU or LOAD
 mov r17, r21 ' CVI, CVU or LOAD
C_s9v4m_696dded2_computesizes_L000149_155
' C_s9v4m_696dded2_computesizes_L000149_152 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 shl r23, #1 ' LSHU4 coni
C_s9v4m_696dded2_computesizes_L000149_154
 cmp r23,  #0 wz
 jmp #BR_Z
 long @C_s9v4m_696dded2_computesizes_L000149_157 ' EQU4
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, r23
 shr r20, #1 ' RSHU4 coni
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_s9v4m_696dded2_computesizes_L000149_151 ' GTU4
C_s9v4m_696dded2_computesizes_L000149_157
 mov RI, r2
 mov BC, r17
 jmp #WLNG ' ASGNU4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_s9v4m_696dded2_computesizes_L000149_150 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s9v4n_696dded2_countint_L000158 ' <symbol:countint>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s9v4i_696dded2_arrayindex_L000115 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s9v4n_696dded2_countint_L000158_160 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaO__ceillog2 ' CALL addrg
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 adds r22, r21 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_s9v4n_696dded2_countint_L000158_159 ' JUMPV addrg
C_s9v4n_696dded2_countint_L000158_160
 mov r0, #0 ' reg <- coni
C_s9v4n_696dded2_countint_L000158_159
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s9v4o_696dded2_numusearray_L000162 ' <symbol:numusearray>
 jmp #PSHM
 long $faa800 ' save registers
 mov r15, #0 ' reg <- coni
 mov r23, #1 ' reg <- coni
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRU4 reg
 mov r21, #0 ' reg <- coni
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_s9v4o_696dded2_numusearray_L000162_167 ' JUMPV addrg
C_s9v4o_696dded2_numusearray_L000162_164
 mov r11, #0 ' reg <- coni
 mov r13, r19 ' CVI, CVU or LOAD
 cmp r13, r17 wz,wc 
 jmp #BRBE
 long @C_s9v4o_696dded2_numusearray_L000162_175 ' LEU4
 mov r13, r17 ' CVI, CVU or LOAD
 cmp r23, r13 wz,wc 
 jmp #BRBE
 long @C_s9v4o_696dded2_numusearray_L000162_175 ' LEU4
 jmp #JMPA
 long @C_s9v4o_696dded2_numusearray_L000162_166 ' JUMPV addrg
C_s9v4o_696dded2_numusearray_L000162_172
 mov r22, r23
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9v4o_696dded2_numusearray_L000162_176 ' EQI4
 add r11, #1 ' ADDU4 coni
C_s9v4o_696dded2_numusearray_L000162_176
' C_s9v4o_696dded2_numusearray_L000162_173 ' (symbol refcount = 0)
 add r23, #1 ' ADDU4 coni
C_s9v4o_696dded2_numusearray_L000162_175
 cmp r23, r13 wz,wc 
 jmp #BRBE
 long @C_s9v4o_696dded2_numusearray_L000162_172 ' LEU4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 adds r22, r2 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, r11 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 add r15, r11 ' ADDU (1)
' C_s9v4o_696dded2_numusearray_L000162_165 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 shl r19, #1 ' LSHU4 coni
C_s9v4o_696dded2_numusearray_L000162_167
 cmps r21,  #31 wz,wc
 jmp #BRBE
 long @C_s9v4o_696dded2_numusearray_L000162_164 ' LEI4
C_s9v4o_696dded2_numusearray_L000162_166
 mov r0, r15 ' CVI, CVU or LOAD
' C_s9v4o_696dded2_numusearray_L000162_163 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s9v4p_696dded2_numusehash_L000178 ' <symbol:numusehash>
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
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r17, r22 ' LSHI/U
 shl r17, r20 ' LSHI/U (3)
 jmp #JMPA
 long @C_s9v4p_696dded2_numusehash_L000178_181 ' JUMPV addrg
C_s9v4p_696dded2_numusehash_L000178_180
 mov r22, r17
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9v4p_696dded2_numusehash_L000178_183 ' EQI4
 mov r22, r11
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_s9v4p_696dded2_numusehash_L000178_185 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r11
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4n_696dded2_countint_L000158
 add SP, #4 ' CALL addrg
 adds r13, r0 ' ADDI/P (1)
C_s9v4p_696dded2_numusehash_L000178_185
 adds r15, #1 ' ADDI4 coni
C_s9v4p_696dded2_numusehash_L000178_183
C_s9v4p_696dded2_numusehash_L000178_181
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 subs r17, #1 ' SUBI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9v4p_696dded2_numusehash_L000178_180 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, r13 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (1)
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_s9v4p_696dded2_numusehash_L000178_179 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9v4q_696dded2_setnodevector_L000187 ' <symbol:setnodevector>
 jmp #NEWF
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmp r19,  #0 wz
 jmp #BRNZ
 long @C_s9v4q_696dded2_setnodevector_L000187_189 ' NEU4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long @C_s9v4_696dded2_dummynode__L000015
 mov r20, RI ' reg <- addrg
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #7 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_s9v4q_696dded2_setnodevector_L000187_190 ' JUMPV addrg
C_s9v4q_696dded2_setnodevector_L000187_189
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaO__ceillog2 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #30 wz,wc
 jmp #BR_A
 long @C_s9v4q_696dded2_setnodevector_L000187_193 ' GTI4
 mov r22, #1 ' reg <- coni
 shl r22, r15 ' LSHI/U (1)
 jmp #LODL
 long $fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_s9v4q_696dded2_setnodevector_L000187_191 ' LEU4
C_s9v4q_696dded2_setnodevector_L000187_193
 jmp #LODL
 long @C_s9v4q_696dded2_setnodevector_L000187_194_L000195
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_s9v4q_696dded2_setnodevector_L000187_191
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
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_s9v4q_696dded2_setnodevector_L000187_199 ' JUMPV addrg
C_s9v4q_696dded2_setnodevector_L000187_196
 mov r22, r17
 shl r22, #4 ' LSHI4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r13
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_s9v4q_696dded2_setnodevector_L000187_197 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_s9v4q_696dded2_setnodevector_L000187_199
 mov r22, r19 ' CVI, CVU or LOAD
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_s9v4q_696dded2_setnodevector_L000187_196 ' LTI4
 mov r22, r21
 adds r22, #7 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, r19
 shl r20, #4 ' LSHU4 coni
 mov r18, r21
 adds r18, #16 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_s9v4q_696dded2_setnodevector_L000187_190
' C_s9v4q_696dded2_setnodevector_L000187_188 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9v4s_696dded2_reinsert_L000200 ' <symbol:reinsert>
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
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r15, r22 ' LSHI/U
 shl r15, r20 ' LSHI/U (3)
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_s9v4s_696dded2_reinsert_L000200_205 ' JUMPV addrg
C_s9v4s_696dded2_reinsert_L000200_202
 mov r22, r17
 shl r22, #4 ' LSHI4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
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
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9v4s_696dded2_reinsert_L000200_206 ' EQI4
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
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
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
C_s9v4s_696dded2_reinsert_L000200_206
' C_s9v4s_696dded2_reinsert_L000200_203 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_s9v4s_696dded2_reinsert_L000200_205
 cmps r17, r15 wz,wc
 jmp #BR_B
 long @C_s9v4s_696dded2_reinsert_L000200_202 ' LTI4
' C_s9v4s_696dded2_reinsert_L000200_201 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s9v4t_696dded2_exchangehashpart_L000208 ' <symbol:exchangehashpart>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r3
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r3
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r3
 adds r22, #7 ' ADDP4 coni
 mov r20, r2
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 mov r20, r2
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #20 ' ADDP4 coni
 mov r20, r2
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #7 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
' C_s9v4t_696dded2_exchangehashpart_L000208_209 ' (symbol refcount = 0)
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
 long @C_s9v4g_696dded2_setlimittosize_L000103 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4q_696dded2_setnodevector_L000187
 add SP, #8 ' CALL addrg
 cmp r19, r13 wz,wc 
 jmp #BRAE
 long @C_luaH__resize_211 ' GEU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNU4 reg reg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4t_696dded2_exchangehashpart_L000208
 add SP, #4 ' CALL addrg
 mov r15, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__resize_216 ' JUMPV addrg
C_luaH__resize_213
 mov r22, r15
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__resize_217 ' EQI4
 mov r22, r15
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
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
C_luaH__resize_217
' C_luaH__resize_214 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_luaH__resize_216
 cmp r15, r13 wz,wc 
 jmp #BR_B
 long @C_luaH__resize_213' LTU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r13
 jmp #WLNG ' ASGNU4 reg reg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4t_696dded2_exchangehashpart_L000208
 add SP, #4 ' CALL addrg
C_luaH__resize_211
 mov r2, r19
 shl r2, #3 ' LSHU4 coni
 mov r3, r13
 shl r3, #3 ' LSHU4 coni
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
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
 long @C_luaH__resize_219 ' NEU4
 cmp r19, r22 wz
 jmp #BR_Z
 long @C_luaH__resize_219 ' EQU4
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4l_696dded2_freehash_L000145
 add SP, #4 ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
C_luaH__resize_219
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4t_696dded2_exchangehashpart_L000208
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 mov BC, r11
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNU4 reg reg
 mov r15, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__resize_224 ' JUMPV addrg
C_luaH__resize_221
 mov r22, r15
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaH__resize_222 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_luaH__resize_224
 cmp r15, r19 wz,wc 
 jmp #BR_B
 long @C_luaH__resize_221' LTU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4s_696dded2_reinsert_L000200
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4l_696dded2_freehash_L000145
 add SP, #4 ' CALL addrg
' C_luaH__resize_210 ' (symbol refcount = 0)
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
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__resizearray_227 ' NEU4
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaH__resizearray_228 ' JUMPV addrg
C_luaH__resizearray_227
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r17, r22 ' LSHI/U
 shl r17, r20 ' LSHI/U (3)
C_luaH__resizearray_228
 mov RI, FP
 sub RI, #-(-8)
 wrlong r17, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__resize
 add SP, #12 ' CALL addrg
' C_luaH__resizearray_225 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s9v4u_696dded2_rehash_L000229 ' <symbol:rehash>
 jmp #NEWF
 sub SP, #136
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
C_s9v4u_696dded2_rehash_L000229_231
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-132) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s9v4u_696dded2_rehash_L000229_232 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #31 wz,wc
 jmp #BRBE
 long @C_s9v4u_696dded2_rehash_L000229_231 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s9v4g_696dded2_setlimittosize_L000103 ' CALL addrg
 mov r2, FP
 sub r2, #-(-132) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4o_696dded2_numusearray_L000162
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-136)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r15, r22 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-132) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4p_696dded2_numusehash_L000178
 add SP, #8 ' CALL addrg
 adds r15, r0 ' ADDI/P (1)
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_s9v4u_696dded2_rehash_L000229_235 ' NEI4
 mov r2, FP
 sub r2, #-(-132) ' reg ARG ADDRLi
 mov RI, r19
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4n_696dded2_countint_L000158
 add SP, #4 ' CALL addrg
 mov r20, FP
 sub r20, #-(-136) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov r22, r0 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-136)
 wrlong r22, RI ' ASGNU4 addrli reg
C_s9v4u_696dded2_rehash_L000229_235
 adds r15, #1 ' ADDI4 coni
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-132) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4m_696dded2_computesizes_L000149
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-140)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-136) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
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
' C_s9v4u_696dded2_rehash_L000229_230 ' (symbol refcount = 0)
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRP4 regl
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, #63 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4q_696dded2_setnodevector_L000187
 add SP, #8 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
' C_luaH__new_237 ' (symbol refcount = 0)
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
 long @C_s9v4l_696dded2_freehash_L000145
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__realasize ' CALL addrg
 mov r2, r0
 shl r2, #3 ' LSHU4 coni
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
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
' C_luaH__free_238 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9v4v_696dded2_getfreepos_L000239 ' <symbol:getfreepos>
 jmp #PSHM
 long $540000 ' save registers
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s9v4v_696dded2_getfreepos_L000239_241 ' EQU4
 jmp #JMPA
 long @C_s9v4v_696dded2_getfreepos_L000239_244 ' JUMPV addrg
C_s9v4v_696dded2_getfreepos_L000239_243
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -16
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9v4v_696dded2_getfreepos_L000239_246 ' NEI4
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_s9v4v_696dded2_getfreepos_L000239_240 ' JUMPV addrg
C_s9v4v_696dded2_getfreepos_L000239_246
C_s9v4v_696dded2_getfreepos_L000239_244
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r2
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_s9v4v_696dded2_getfreepos_L000239_243 ' GTU4
C_s9v4v_696dded2_getfreepos_L000239_241
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_s9v4v_696dded2_getfreepos_L000239_240
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s9v410_696dded2_luaH__newkey_L000248 ' <symbol:luaH_newkey>
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
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9v410_696dded2_luaH__newkey_L000248_250 ' NEI4
 jmp #LODL
 long @C_s9v410_696dded2_luaH__newkey_L000248_252_L000253
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s9v410_696dded2_luaH__newkey_L000248_251 ' JUMPV addrg
C_s9v410_696dded2_luaH__newkey_L000248_250
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_s9v410_696dded2_luaH__newkey_L000248_254 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRF4 reg
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
 jmp #CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s9v410_696dded2_luaH__newkey_L000248_256 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r19, FP
 sub r19, #-(-12) ' reg <- addrli
 jmp #JMPA
 long @C_s9v410_696dded2_luaH__newkey_L000248_257 ' JUMPV addrg
C_s9v410_696dded2_luaH__newkey_L000248_256
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_Z
 long @C_s9v410_696dded2_luaH__newkey_L000248_258 ' EQF4
 jmp #LODL
 long @C_s9v410_696dded2_luaH__newkey_L000248_260_L000261
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_s9v410_696dded2_luaH__newkey_L000248_258
C_s9v410_696dded2_luaH__newkey_L000248_257
C_s9v410_696dded2_luaH__newkey_L000248_254
C_s9v410_696dded2_luaH__newkey_L000248_251
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9v410_696dded2_luaH__newkey_L000248_262 ' NEI4
 jmp #JMPA
 long @C_s9v410_696dded2_luaH__newkey_L000248_249 ' JUMPV addrg
C_s9v410_696dded2_luaH__newkey_L000248_262
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v46_696dded2_mainpositionT_V__L000034
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9v410_696dded2_luaH__newkey_L000248_266 ' NEI4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s9v410_696dded2_luaH__newkey_L000248_264 ' NEU4
C_s9v410_696dded2_luaH__newkey_L000248_266
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s9v4v_696dded2_getfreepos_L000239 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s9v410_696dded2_luaH__newkey_L000248_267 ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4u_696dded2_rehash_L000229
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
 long @C_s9v410_696dded2_luaH__newkey_L000248_249 ' JUMPV addrg
C_s9v410_696dded2_luaH__newkey_L000248_267
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4b_696dded2_mainpositionfromnode_L000056
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_s9v410_696dded2_luaH__newkey_L000248_269 ' EQU4
 jmp #JMPA
 long @C_s9v410_696dded2_luaH__newkey_L000248_272 ' JUMPV addrg
C_s9v410_696dded2_luaH__newkey_L000248_271
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 adds r13, r22 ' ADDI/P (2)
C_s9v410_696dded2_luaH__newkey_L000248_272
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s9v410_696dded2_luaH__newkey_L000248_271 ' NEU4
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov r20, r11 ' CVI, CVU or LOAD
 mov r18, r13 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, #16 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, r11 ' CVI, CVU or LOAD
 mov r1, r15 ' CVI, CVU or LOAD
 jmp #CPYB
 long 16 ' ASGNB
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9v410_696dded2_luaH__newkey_L000248_274 ' EQI4
 mov r22, r11
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r15 ' CVI, CVU or LOAD
 mov r16, r11 ' CVI, CVU or LOAD
 sub r18, r16 ' SUBU (1)
 mov r16, #16 ' reg <- coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 adds r20, r0 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_s9v410_696dded2_luaH__newkey_L000248_274
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_s9v410_696dded2_luaH__newkey_L000248_270 ' JUMPV addrg
C_s9v410_696dded2_luaH__newkey_L000248_269
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9v410_696dded2_luaH__newkey_L000248_276 ' EQI4
 mov r22, r11
 adds r22, #8 ' ADDP4 coni
 mov r20, r15
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 shl r20, #4 ' LSHI4 coni
 adds r20, r15 ' ADDI/P (1)
 mov r18, r11 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, #16 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
C_s9v410_696dded2_luaH__newkey_L000248_276
' C_s9v410_696dded2_luaH__newkey_L000248_277 ' (symbol refcount = 0)
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov r20, r11 ' CVI, CVU or LOAD
 mov r18, r15 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, #16 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r15, r11 ' CVI, CVU or LOAD
C_s9v410_696dded2_luaH__newkey_L000248_270
C_s9v410_696dded2_luaH__newkey_L000248_264
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
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9v410_696dded2_luaH__newkey_L000248_279 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s9v410_696dded2_luaH__newkey_L000248_279 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s9v410_696dded2_luaH__newkey_L000248_279 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s9v410_696dded2_luaH__newkey_L000248_279 ' JUMPV addrg
 jmp #JMPA
 long @C_s9v410_696dded2_luaH__newkey_L000248_279 ' JUMPV addrg
C_s9v410_696dded2_luaH__newkey_L000248_279
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
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s9v410_696dded2_luaH__newkey_L000248_249
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


' Catalina Export luaH_getint

 alignl ' align long
C_luaH__getint ' <symbol:luaH_getint>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRU4 reg
 mov r22, r21 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 cmp r22, r19 wz,wc 
 jmp #BRAE
 long @C_luaH__getint_283 ' GEU4
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_luaH__getint_282 ' JUMPV addrg
C_luaH__getint_283
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getint_285 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 mov r20, r19
 sub r20, #1 ' SUBU4 coni
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 cmp r22, r19 wz,wc 
 jmp #BRAE
 long @C_luaH__getint_285 ' GEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_luaH__getint_282 ' JUMPV addrg
C_luaH__getint_285
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v42_696dded2_hashint_L000017
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_luaH__getint_287
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaH__getint_291 ' NEI4
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22, r21 wz
 jmp #BRNZ
 long @C_luaH__getint_291 ' NEI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__getint_282 ' JUMPV addrg
C_luaH__getint_291
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 jmp #BRNZ
 long @C_luaH__getint_293 ' NEI4
 jmp #JMPA
 long @C_luaH__getint_289 ' JUMPV addrg
C_luaH__getint_293
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 adds r17, r22 ' ADDI/P (2)
 jmp #JMPA
 long @C_luaH__getint_287 ' JUMPV addrg
C_luaH__getint_289
 jmp #LODL
 long @C_s9v41_696dded2_absentkey_L000016
 mov r0, RI ' reg <- addrg
C_luaH__getint_282
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
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r3
 adds r18, #7 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r22, r18 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 and r22, r20 ' BANDI/U (2)
 shl r22, #4 ' LSHI4 coni
 mov r20, r3
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r23, r22 ' ADDI/P
 adds r23, r20 ' ADDI/P (3)
C_luaH__getshortstr_296
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #68 wz
 jmp #BRNZ
 long @C_luaH__getshortstr_300 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaH__getshortstr_300 ' NEU4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__getshortstr_295 ' JUMPV addrg
C_luaH__getshortstr_300
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRI4 reg
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_luaH__getshortstr_302 ' NEI4
 jmp #LODL
 long @C_s9v41_696dded2_absentkey_L000016
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_luaH__getshortstr_295 ' JUMPV addrg
C_luaH__getshortstr_302
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 adds r23, r22 ' ADDI/P (2)
 jmp #JMPA
 long @C_luaH__getshortstr_296 ' JUMPV addrg
C_luaH__getshortstr_295
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
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaH__getstr_305 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__getstr_304 ' JUMPV addrg
C_luaH__getstr_305
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4h_696dded2_getgeneric_L000105
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaH__getstr_304
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
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r22
 and r19, #63 ' BANDI4 coni
 mov r22, #0 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_luaH__get_313 ' EQI4
 cmps r19,  #3 wz
 jmp #BR_Z
 long @C_luaH__get_312 ' EQI4
 cmps r19,  #4 wz
 jmp #BR_Z
 long @C_luaH__get_311 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_luaH__get_308 ' LTI4
' C_luaH__get_317 ' (symbol refcount = 0)
 cmps r19,  #19 wz
 jmp #BR_Z
 long @C_luaH__get_314 ' EQI4
 jmp #JMPA
 long @C_luaH__get_308 ' JUMPV addrg
C_luaH__get_311
 mov RI, r21
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__get_307 ' JUMPV addrg
C_luaH__get_312
 mov RI, r21
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__get_307 ' JUMPV addrg
C_luaH__get_313
 jmp #LODL
 long @C_s9v41_696dded2_absentkey_L000016
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_luaH__get_307 ' JUMPV addrg
C_luaH__get_314
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov RI, r21
 jmp #RLNG
 mov r4, BC ' reg <- INDIRF4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaH__get_315 ' EQI4
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
 long @C_luaH__get_307 ' JUMPV addrg
C_luaH__get_315
C_luaH__get_308
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v4h_696dded2_getgeneric_L000105
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaH__get_307
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
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #32 wz
 jmp #BRNZ
 long @C_luaH__finishset_319 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v410_696dded2_luaH__newkey_L000248
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_luaH__finishset_320 ' JUMPV addrg
C_luaH__finishset_319
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaH__finishset_320
' C_luaH__finishset_318 ' (symbol refcount = 0)
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
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaH__finishset
 add SP, #16 ' CALL addrg
' C_luaH__set_321 ' (symbol refcount = 0)
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #32 wz
 jmp #BRNZ
 long @C_luaH__setint_323 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v410_696dded2_luaH__newkey_L000248
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_luaH__setint_324 ' JUMPV addrg
C_luaH__setint_323
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaH__setint_324
' C_luaH__setint_322 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_s9v413_696dded2_hash_search_L000325 ' <symbol:hash_search>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmp r21,  #0 wz
 jmp #BRNZ
 long @C_s9v413_696dded2_hash_search_L000325_327 ' NEU4
 add r21, #1 ' ADDU4 coni
C_s9v413_696dded2_hash_search_L000325_327
C_s9v413_696dded2_hash_search_L000325_329
 mov r19, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long $3fffffff
 mov r22, RI ' reg <- con
 cmp r21, r22 wz,wc 
 jmp #BR_A
 long @C_s9v413_696dded2_hash_search_L000325_332 ' GTU4
 shl r21, #1 ' LSHU4 coni
 jmp #JMPA
 long @C_s9v413_696dded2_hash_search_L000325_333 ' JUMPV addrg
C_s9v413_696dded2_hash_search_L000325_332
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
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9v413_696dded2_hash_search_L000325_334 ' NEI4
 jmp #JMPA
 long @C_s9v413_696dded2_hash_search_L000325_337 ' JUMPV addrg
C_s9v413_696dded2_hash_search_L000325_334
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v413_696dded2_hash_search_L000325_326 ' JUMPV addrg
C_s9v413_696dded2_hash_search_L000325_333
' C_s9v413_696dded2_hash_search_L000325_330 ' (symbol refcount = 0)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9v413_696dded2_hash_search_L000325_329 ' NEI4
 jmp #JMPA
 long @C_s9v413_696dded2_hash_search_L000325_337 ' JUMPV addrg
C_s9v413_696dded2_hash_search_L000325_336
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
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9v413_696dded2_hash_search_L000325_339 ' NEI4
 mov r21, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v413_696dded2_hash_search_L000325_340 ' JUMPV addrg
C_s9v413_696dded2_hash_search_L000325_339
 mov r19, r17 ' CVI, CVU or LOAD
C_s9v413_696dded2_hash_search_L000325_340
C_s9v413_696dded2_hash_search_L000325_337
 mov r22, r21 ' SUBU
 sub r22, r19 ' SUBU (3)
 cmp r22,  #1 wz,wc 
 jmp #BR_A
 long @C_s9v413_696dded2_hash_search_L000325_336 ' GTU4
 mov r0, r19 ' CVI, CVU or LOAD
C_s9v413_696dded2_hash_search_L000325_326
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9v414_696dded2_binsearch_L000341 ' <symbol:binsearch>
 jmp #PSHM
 long $c00000 ' save registers
 jmp #JMPA
 long @C_s9v414_696dded2_binsearch_L000341_344 ' JUMPV addrg
C_s9v414_696dded2_binsearch_L000341_343
 mov r22, r3 ' ADDU
 add r22, r2 ' ADDU (3)
 mov r23, r22
 shr r23, #1 ' RSHU4 coni
 mov r22, r23
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 adds r22, r4 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9v414_696dded2_binsearch_L000341_346 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9v414_696dded2_binsearch_L000341_347 ' JUMPV addrg
C_s9v414_696dded2_binsearch_L000341_346
 mov r3, r23 ' CVI, CVU or LOAD
C_s9v414_696dded2_binsearch_L000341_347
C_s9v414_696dded2_binsearch_L000341_344
 mov r22, r2 ' SUBU
 sub r22, r3 ' SUBU (3)
 cmp r22,  #1 wz,wc 
 jmp #BR_A
 long @C_s9v414_696dded2_binsearch_L000341_343 ' GTU4
 mov r0, r3 ' CVI, CVU or LOAD
' C_s9v414_696dded2_binsearch_L000341_342 ' (symbol refcount = 0)
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
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRU4 reg
 cmp r21,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_349 ' EQU4
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__getn_349 ' NEI4
 mov r22, #2 ' reg <- coni
 cmp r21, r22 wz,wc 
 jmp #BR_B
 long @C_luaH__getn_351' LTU4
 mov r22, r21
 sub r22, #2 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_351 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s9v4f_696dded2_ispow2realasize_L000097 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_353 ' EQI4
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_353 ' EQU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, r21
 sub r20, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #128 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaH__getn_353
 mov r0, r21
 sub r0, #1 ' SUBU4 coni
 jmp #JMPA
 long @C_luaH__getn_348 ' JUMPV addrg
C_luaH__getn_351
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v414_696dded2_binsearch_L000341
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s9v4f_696dded2_ispow2realasize_L000097 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_355 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__realasize ' CALL addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov r22, r0
 shr r22, #1 ' RSHU4 coni
 cmp r20, r22 wz,wc 
 jmp #BRBE
 long @C_luaH__getn_355 ' LEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #128 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaH__getn_355
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 regl
 jmp #JMPA
 long @C_luaH__getn_348 ' JUMPV addrg
C_luaH__getn_349
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_357 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_357 ' EQU4
 mov r22, r21
 shl r22, #3 ' LSHU4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__getn_359 ' NEI4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__getn_348 ' JUMPV addrg
C_luaH__getn_359
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
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__getn_361 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRU4 reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v414_696dded2_binsearch_L000341
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 regl
 jmp #JMPA
 long @C_luaH__getn_348 ' JUMPV addrg
C_luaH__getn_361
C_luaH__getn_357
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaH__getn_365 ' EQU4
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
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaH__getn_363 ' NEI4
C_luaH__getn_365
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaH__getn_348 ' JUMPV addrg
C_luaH__getn_363
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9v413_696dded2_hash_search_L000325
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaH__getn_348
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
C_s9v410_696dded2_luaH__newkey_L000248_260_L000261 ' <symbol:260>
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
C_s9v410_696dded2_luaH__newkey_L000248_252_L000253 ' <symbol:252>
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
C_s9v4q_696dded2_setnodevector_L000187_194_L000195 ' <symbol:194>
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
C_s9v4j_696dded2_findindex_L000119_130_L000131 ' <symbol:130>
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
C_s9v43_696dded2_l_hashfloat_L000021_28_L000029 ' <symbol:28>
 long $cf000000 ' float

 alignl ' align long
C_s9v43_696dded2_l_hashfloat_L000021_23_L000024 ' <symbol:23>
 long $4f000000 ' float

' Catalina Code

DAT ' code segment
' end
