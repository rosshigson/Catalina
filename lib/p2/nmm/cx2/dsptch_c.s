' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _dispatch_C_bg

 alignl ' align long
C__dispatch_C__bg ' <symbol:_dispatch_C_bg>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__registry ' CALL addrg
 shl r22, #2 ' LSHI4 coni
 mov r20, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r19, r22 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNU4 reg reg
 jmp #\@C__dispatch_C__bg_7 ' JUMPV addrg
C__dispatch_C__bg_6
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C__dispatch_C__bg_9 ' EQU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 mov RI, r21
 calld PA,#CALI ' CALL indirect
C__dispatch_C__bg_9
C__dispatch_C__bg_7
 rdlong r22, r19 ' reg <- INDIRU4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C__dispatch_C__bg_6 ' EQI4
 mov r15, r17
 sar r15, #24 ' RSHI4 coni
 cmps r15,  #0 wcz
 if_be jmp #\C__dispatch_C__bg_11 ' LEI4
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C__dispatch_C__bg_11
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_b jmp #\C__dispatch_C__bg_14 ' LTI4
 cmps r22,  #6 wcz
 if_a jmp #\C__dispatch_C__bg_14 ' GTI4
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C__dispatch_C__bg_21_L000023 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__dispatch_C__bg_21_L000023 ' <symbol:21>
 long @C__dispatch_C__bg_15
 long @C__dispatch_C__bg_16
 long @C__dispatch_C__bg_17
 long @C__dispatch_C__bg_18
 long @C__dispatch_C__bg_19
 long @C__dispatch_C__bg_15
 long @C__dispatch_C__bg_20

' Catalina Code

DAT ' code segment
C__dispatch_C__bg_15
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##16777215 ' reg <- con
 and r22, r17 ' BANDI/U (2)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r22
 calld PA,#CALI ' CALL indirect
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #\@C__dispatch_C__bg_14 ' JUMPV addrg
C__dispatch_C__bg_16
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##16777215 ' reg <- con
 and r22, r17 ' BANDI/U (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r22
 calld PA,#CALI ' CALL indirect
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #\@C__dispatch_C__bg_14 ' JUMPV addrg
C__dispatch_C__bg_17
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##16777215 ' reg <- con
 and r22, r17 ' BANDI/U (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r2, r20 ' reg <- INDIRI4 reg
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r22
 calld PA,#CALI
 add SP, #4 ' CALL indirect
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #\@C__dispatch_C__bg_14 ' JUMPV addrg
C__dispatch_C__bg_18
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##16777215 ' reg <- con
 and r22, r17 ' BANDI/U (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r2, r20 ' reg <- INDIRF4 reg
 rdlong r3, r22 ' reg <- INDIRF4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r22
 calld PA,#CALI
 add SP, #4 ' CALL indirect
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C__dispatch_C__bg_14 ' JUMPV addrg
C__dispatch_C__bg_19
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##16777215 ' reg <- con
 and r22, r17 ' BANDI/U (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r2, r20 ' reg <- INDIRF4 reg
 rdlong r3, r22 ' reg <- INDIRF4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r22
 calld PA,#CALI
 add SP, #4 ' CALL indirect
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C__dispatch_C__bg_14 ' JUMPV addrg
C__dispatch_C__bg_20
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##16777215 ' reg <- con
 and r22, r17 ' BANDI/U (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r22
 calld PA,#CALI ' CALL indirect
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
C__dispatch_C__bg_14
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNU4 reg reg
' C__dispatch_C__bg_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


' Catalina Import _cogid

' Catalina Import _registry
' end
