' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s2hg_619c56d5_maxE_xponent_L000003 ' <symbol:maxExponent>
 long 511

 alignl ' align long
C_s2hg1_619c56d5_powersO_f10_L000004 ' <symbol:powersOf10>
 long $41200000 ' float
 long $42c80000 ' float
 long $461c4000 ' float
 long $4cbebc20 ' float
 long $5a0e1bca ' float
 long $749dc5ae ' float
 long $7f800000 ' float
 long $7f800000 ' float
 long $7f800000 ' float

' Catalina Export strtod

' Catalina Code

DAT ' code segment

 alignl ' align long
C_strtod ' <symbol:strtod>
 PRIMITIVE(#NEWF)
 sub SP, #32
 PRIMITIVE(#PSHM)
 long $faaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r15, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r19, r23 ' CVI, CVU or LOAD
 jmp #\@C_strtod_7 ' JUMPV addrg
C_strtod_6
 adds r19, #1 ' ADDP4 coni
C_strtod_7
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_strtod_6 ' NEI4
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #45 wz
 if_nz jmp #\C_strtod_10 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r19, #1 ' ADDP4 coni
 jmp #\@C_strtod_11 ' JUMPV addrg
C_strtod_10
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #43 wz
 if_nz jmp #\C_strtod_12 ' NEI4
 adds r19, #1 ' ADDP4 coni
C_strtod_12
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_strtod_11
 mov r9, ##-1 ' reg <- con
 mov r13, #0 ' reg <- coni
C_strtod_14
 rdbyte r17, r19 ' reg <- CVUI4 INDIRU1 reg
 mov r22, r17
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_b jmp #\C_strtod_18 ' LTU4
 cmps r17,  #46 wz
 if_nz jmp #\C_strtod_22 ' NEI4
 cmps r9,  #0 wcz
 if_b jmp #\C_strtod_20 ' LTI4
C_strtod_22
 jmp #\@C_strtod_16 ' JUMPV addrg
C_strtod_20
 mov r9, r13 ' CVI, CVU or LOAD
C_strtod_18
 adds r19, #1 ' ADDP4 coni
' C_strtod_15 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
 jmp #\@C_strtod_14 ' JUMPV addrg
C_strtod_16
 mov RI, FP
 sub RI, #-(-20)
 wrlong r19, RI ' ASGNP4 addrli reg
 subs r19, r13 ' SUBI/P (1)
 cmps r9,  #0 wcz
 if_ae jmp #\C_strtod_23 ' GEI4
 mov r9, r13 ' CVI, CVU or LOAD
 jmp #\@C_strtod_24 ' JUMPV addrg
C_strtod_23
 subs r13, #1 ' SUBI4 coni
C_strtod_24
 cmps r13,  #18 wcz
 if_be jmp #\C_strtod_25 ' LEI4
 mov r22, #18 ' reg <- coni
 mov r20, r9
 subs r20, #18 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r20, RI ' ASGNI4 addrli reg
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #\@C_strtod_26 ' JUMPV addrg
C_strtod_25
 mov r22, r9 ' SUBI/P
 subs r22, r13 ' SUBI/P (3)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C_strtod_26
 cmps r13,  #0 wz
 if_nz jmp #\C_strtod_27 ' NEI4
 mov r22, ##@C_strtod_29_L000030
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r19, r23 ' CVI, CVU or LOAD
 jmp #\@C_strtod_31 ' JUMPV addrg
C_strtod_27
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_strtod_35 ' JUMPV addrg
C_strtod_32
 rdbyte r17, r19 ' reg <- CVUI4 INDIRU1 reg
 adds r19, #1 ' ADDP4 coni
 cmps r17,  #46 wz
 if_nz jmp #\C_strtod_36 ' NEI4
 rdbyte r17, r19 ' reg <- CVUI4 INDIRU1 reg
 adds r19, #1 ' ADDP4 coni
C_strtod_36
 mov r22, #10 ' reg <- coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r17
 subs r20, #48 ' SUBI4 coni
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
' C_strtod_33 ' (symbol refcount = 0)
 subs r13, #1 ' SUBI4 coni
C_strtod_35
 cmps r13,  #9 wcz
 if_a jmp #\C_strtod_32 ' GTI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_strtod_41 ' JUMPV addrg
C_strtod_38
 rdbyte r17, r19 ' reg <- CVUI4 INDIRU1 reg
 adds r19, #1 ' ADDP4 coni
 cmps r17,  #46 wz
 if_nz jmp #\C_strtod_42 ' NEI4
 rdbyte r17, r19 ' reg <- CVUI4 INDIRU1 reg
 adds r19, #1 ' ADDP4 coni
C_strtod_42
 mov r22, #10 ' reg <- coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r17
 subs r20, #48 ' SUBI4 coni
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
' C_strtod_39 ' (symbol refcount = 0)
 subs r13, #1 ' SUBI4 coni
C_strtod_41
 cmps r13,  #0 wcz
 if_a jmp #\C_strtod_38 ' GTI4
 mov r22, ##@C_strtod_44_L000045
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r0, r20 ' reg <- INDIRI4 reg
 PRIMITIVE(#FLIN) ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FMUL) ' MULF4
 mov RI, FP
 sub RI, #-(-32)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#FLIN) ' CVIF4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FADD) ' ADDF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_strtod_48 ' EQI4
 cmps r22,  #101 wz
 if_nz jmp #\C_strtod_46 ' NEI4
C_strtod_48
 adds r19, #1 ' ADDP4 coni
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #45 wz
 if_nz jmp #\C_strtod_49 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r19, #1 ' ADDP4 coni
 jmp #\@C_strtod_54 ' JUMPV addrg
C_strtod_49
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #43 wz
 if_nz jmp #\C_strtod_51 ' NEI4
 adds r19, #1 ' ADDP4 coni
C_strtod_51
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_strtod_54 ' JUMPV addrg
C_strtod_53
 mov r22, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 rdbyte r20, r19 ' reg <- CVUI4 INDIRU1 reg
 subs r20, #48 ' SUBI4 coni
 mov r15, r0 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 adds r19, #1 ' ADDP4 coni
C_strtod_54
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_b jmp #\C_strtod_53 ' LTU4
C_strtod_46
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_strtod_56 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r15, r22
 neg r15, r15 ' SUBI/P (2)
 jmp #\@C_strtod_57 ' JUMPV addrg
C_strtod_56
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r15, r22 ' ADDI/P (2)
C_strtod_57
 cmps r15,  #0 wcz
 if_ae jmp #\C_strtod_58 ' GEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 neg r15, r15 ' NEGI4
 jmp #\@C_strtod_59 ' JUMPV addrg
C_strtod_58
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
C_strtod_59
 mov r22, ##@C_s2hg_619c56d5_maxE_xponent_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r15, r22 wcz
 if_be jmp #\C_strtod_60 ' LEI4
 mov r15, ##@C_s2hg_619c56d5_maxE_xponent_L000003
 rdlong r15, r15 ' reg <- INDIRI4 addrg
 mov r22, #34 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
C_strtod_60
 mov r7, ##@C_strtod_62_L000063
 rdlong r7, r7 ' reg <- INDIRF4 addrg
 mov r11, ##@C_s2hg1_619c56d5_powersO_f10_L000004 ' reg <- addrg
 jmp #\@C_strtod_67 ' JUMPV addrg
C_strtod_64
 mov r22, r15
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_strtod_68 ' EQI4
 rdlong r22, r11 ' reg <- INDIRF4 reg
 mov r0, r7 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r7, r0 ' CVI, CVU or LOAD
C_strtod_68
' C_strtod_65 ' (symbol refcount = 0)
 sar r15, #1 ' RSHI4 coni
 adds r11, #4 ' ADDP4 coni
C_strtod_67
 cmps r15,  #0 wz
 if_nz jmp #\C_strtod_64 ' NEI4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_strtod_70 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r7 ' setup r0/r1 (2)
 PRIMITIVE(#FDIV) ' DIVF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 jmp #\@C_strtod_71 ' JUMPV addrg
C_strtod_70
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r7 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
C_strtod_71
C_strtod_31
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_strtod_72 ' EQU4
 wrlong r19, r21 ' ASGNP4 reg reg
C_strtod_72
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_strtod_74 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r22
 xor r0, Bit31 ' NEGF4
 jmp #\@C_strtod_5 ' JUMPV addrg
C_strtod_74
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 reg
C_strtod_5
 PRIMITIVE(#POPM) ' restore registers
 add SP, #32 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import errno

' Catalina Import __ctype

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_strtod_62_L000063 ' <symbol:62>
 long $3f800000 ' float

 alignl ' align long
C_strtod_44_L000045 ' <symbol:44>
 long $4e6e6b28 ' float

 alignl ' align long
C_strtod_29_L000030 ' <symbol:29>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
