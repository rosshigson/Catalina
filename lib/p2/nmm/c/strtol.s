' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strtol

 alignl ' align long
C_strtol ' <symbol:strtol>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7f4_6880504d_string2long_L000003
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_strtol_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export strtoul

 alignl ' align long
C_strtoul ' <symbol:strtoul>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7f4_6880504d_string2long_L000003
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_strtoul_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7f4_6880504d_string2long_L000003 ' <symbol:string2long>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r21, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 mov r15, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r5, RI ' ASGNP4 addrli reg
 mov r22, r4 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s7f4_6880504d_string2long_L000003_10 ' EQU4
 wrlong r5, r4 ' ASGNP4 reg reg
 jmp #\@C_s7f4_6880504d_string2long_L000003_10 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_9
 adds r5, #1 ' ADDP4 coni
C_s7f4_6880504d_string2long_L000003_10
 rdbyte r22, r5 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_9 ' NEI4
 rdbyte r19, r5 ' reg <- CVUI4 INDIRU1 reg
 cmps r19,  #45 wz
 if_z jmp #\C_s7f4_6880504d_string2long_L000003_15 ' EQI4
 cmps r19,  #43 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_13 ' NEI4
C_s7f4_6880504d_string2long_L000003_15
 cmps r19,  #45 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_16 ' NEI4
 mov r15, ##-1 ' reg <- con
C_s7f4_6880504d_string2long_L000003_16
 adds r5, #1 ' ADDP4 coni
C_s7f4_6880504d_string2long_L000003_13
 mov RI, FP
 sub RI, #-(-8)
 wrlong r5, RI ' ASGNP4 addrli reg
 cmps r3,  #0 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_18 ' NEI4
 rdbyte r22, r5 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_20 ' NEI4
 mov r22, r5
 adds r22, #1 ' ADDP4 coni
 mov r5, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #120 wz
 if_z jmp #\C_s7f4_6880504d_string2long_L000003_24 ' EQI4
 rdbyte r22, r5 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #88 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_22 ' NEI4
C_s7f4_6880504d_string2long_L000003_24
 mov r3, #16 ' reg <- coni
 adds r5, #1 ' ADDP4 coni
 jmp #\@C_s7f4_6880504d_string2long_L000003_29 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_22
 mov r3, #8 ' reg <- coni
 jmp #\@C_s7f4_6880504d_string2long_L000003_29 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_20
 mov r3, #10 ' reg <- coni
 jmp #\@C_s7f4_6880504d_string2long_L000003_29 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_18
 cmps r3,  #16 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_29 ' NEI4
 rdbyte r22, r5 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_29 ' NEI4
 mov r22, r5
 adds r22, #1 ' ADDP4 coni
 mov r5, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #120 wz
 if_z jmp #\C_s7f4_6880504d_string2long_L000003_27 ' EQI4
 rdbyte r22, r5 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #88 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_29 ' NEI4
C_s7f4_6880504d_string2long_L000003_27
 adds r5, #1 ' ADDP4 coni
 jmp #\@C_s7f4_6880504d_string2long_L000003_29 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_28
 cmps r17,  #0 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_32 ' NEI4
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #3 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s7f4_6880504d_string2long_L000003_34 ' EQI4
 mov r22, r19
 subs r22, #65 ' SUBI4 coni
 cmp r22,  #26 wcz 
 if_ae jmp #\C_s7f4_6880504d_string2long_L000003_38 ' GEU4
 mov r13, r19
 subs r13, #65 ' SUBI4 coni
 jmp #\@C_s7f4_6880504d_string2long_L000003_39 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_38
 mov r13, r19
 subs r13, #97 ' SUBI4 coni
C_s7f4_6880504d_string2long_L000003_39
 mov r22, r13
 adds r22, #10 ' ADDI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #\@C_s7f4_6880504d_string2long_L000003_35 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_34
 mov r22, r19
 subs r22, #48 ' SUBI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
C_s7f4_6880504d_string2long_L000003_35
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r23, r22 wcz 
 if_b jmp #\C_s7f4_6880504d_string2long_L000003_40 ' LTU4
 jmp #\@C_s7f4_6880504d_string2long_L000003_30 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_40
 mov r22, ##$ffffffff ' reg <- con
 sub r22, r23 ' SUBU (1)
 mov r20, r3 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r21, r0 wcz 
 if_be jmp #\C_s7f4_6880504d_string2long_L000003_42 ' LEU4
 adds r17, #1 ' ADDI4 coni
 jmp #\@C_s7f4_6880504d_string2long_L000003_43 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_42
 mov r22, r3 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r21, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r21, r0 ' ADDU
 add r21, r23 ' ADDU (3)
C_s7f4_6880504d_string2long_L000003_43
C_s7f4_6880504d_string2long_L000003_32
 adds r5, #1 ' ADDP4 coni
C_s7f4_6880504d_string2long_L000003_29
 rdbyte r22, r5 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22 ' CVI, CVU or LOAD
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_b jmp #\C_s7f4_6880504d_string2long_L000003_28 ' LTU4
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #3 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_28 ' NEI4
C_s7f4_6880504d_string2long_L000003_30
 mov r22, r4 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s7f4_6880504d_string2long_L000003_44 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r5 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_46  ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r4 ' ASGNP4 reg reg
 jmp #\@C_s7f4_6880504d_string2long_L000003_47 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_46
 wrlong r5, r4 ' ASGNP4 reg reg
C_s7f4_6880504d_string2long_L000003_47
C_s7f4_6880504d_string2long_L000003_44
 cmps r17,  #0 wz
 if_nz jmp #\C_s7f4_6880504d_string2long_L000003_48 ' NEI4
 mov r22, #0 ' reg <- coni
 cmps r2, r22 wz
 if_z jmp #\C_s7f4_6880504d_string2long_L000003_50 ' EQI4
 cmps r15, r22 wcz
 if_ae jmp #\C_s7f4_6880504d_string2long_L000003_53 ' GEI4
 mov r22, ##$80000000 ' reg <- con
 cmp r21, r22 wcz 
 if_a jmp #\C_s7f4_6880504d_string2long_L000003_52 ' GTU4
C_s7f4_6880504d_string2long_L000003_53
 cmps r15,  #0 wcz
 if_be jmp #\C_s7f4_6880504d_string2long_L000003_50 ' LEI4
 mov r22, ##$7fffffff ' reg <- con
 cmp r21, r22 wcz 
 if_be jmp #\C_s7f4_6880504d_string2long_L000003_50 ' LEU4
C_s7f4_6880504d_string2long_L000003_52
 adds r17, #1 ' ADDI4 coni
C_s7f4_6880504d_string2long_L000003_50
C_s7f4_6880504d_string2long_L000003_48
 cmps r17,  #0 wz
 if_z jmp #\C_s7f4_6880504d_string2long_L000003_54 ' EQI4
 mov r22, #34 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 cmps r2,  #0 wz
 if_z jmp #\C_s7f4_6880504d_string2long_L000003_56 ' EQI4
 cmps r15,  #0 wcz
 if_ae jmp #\C_s7f4_6880504d_string2long_L000003_58 ' GEI4
 mov r0, ##$80000000 ' RET con
 jmp #\@C_s7f4_6880504d_string2long_L000003_6 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_58
 mov r0, ##$7fffffff ' RET con
 jmp #\@C_s7f4_6880504d_string2long_L000003_6 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_56
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_s7f4_6880504d_string2long_L000003_6 ' JUMPV addrg
C_s7f4_6880504d_string2long_L000003_54
 mov r22, r15 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r21 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
C_s7f4_6880504d_string2long_L000003_6
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Import errno

' Catalina Import __ctype
' end
