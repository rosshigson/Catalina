' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export mktime

 alignl ' align long
C_mktime ' <symbol:mktime>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $ffaa80 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 rdlong r18, r23 ' reg <- INDIRI4 reg
 mov r16, #60 ' reg <- coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 adds r20, r0 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, #60 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 wrlong r1, r23 ' ASGNI4 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_mktime_2 ' GEI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 adds r22, #60 ' ADDI4 coni
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_mktime_2
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r23
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 mov r16, #60 ' reg <- coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 adds r20, r0 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, #60 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 wrlong r1, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_mktime_4 ' GEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #60 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_mktime_4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #24 ' reg <- coni
 rdlong r18, r22 ' reg <- INDIRI4 reg
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r18, r22 ' reg <- INDIRI4 reg
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 wrlong r1, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_mktime_6 ' GEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #24 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 subs r21, #1 ' SUBI4 coni
C_mktime_6
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 mov r16, #12 ' reg <- coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 adds r20, r0 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, #12 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 wrlong r1, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_mktime_8 ' GEI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #12 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_mktime_8
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 adds r21, r22 ' ADDI/P (1)
 jmp #\@C_mktime_11 ' JUMPV addrg
C_mktime_10
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1900 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 subs r22, #1 ' SUBI4 coni
 mov r20, #0 ' reg <- coni
 mov r18, #4 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_14 ' NEI4
 mov r18, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_16 ' NEI4
 mov r18, #400 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_14 ' NEI4
C_mktime_16
 mov r22, #366 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_mktime_15 ' JUMPV addrg
C_mktime_14
 mov r22, #365 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_mktime_15
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r21, r22 ' ADDI/P (1)
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_mktime_11
 cmps r21,  #0 wcz
 if_b jmp #\C_mktime_10 ' LTI4
 jmp #\@C_mktime_18 ' JUMPV addrg
C_mktime_17
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1900 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, #4 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_22 ' NEI4
 mov r18, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_24 ' NEI4
 mov r18, #400 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_22 ' NEI4
C_mktime_24
 mov r22, #366 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_mktime_23 ' JUMPV addrg
C_mktime_22
 mov r22, #365 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_mktime_23
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r21, r22 ' SUBI/P (1)
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_mktime_18
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1900 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, #4 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_25 ' NEI4
 mov r18, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_27 ' NEI4
 mov r18, #400 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_25 ' NEI4
C_mktime_27
 mov r22, #366 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_mktime_26 ' JUMPV addrg
C_mktime_25
 mov r22, #365 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_mktime_26
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r21, r22 wcz
 if_ae jmp #\C_mktime_17 ' GEI4
 jmp #\@C_mktime_29 ' JUMPV addrg
C_mktime_28
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1900 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, #4 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_33 ' NEI4
 mov r18, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_35 ' NEI4
 mov r18, #400 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_33 ' NEI4
C_mktime_35
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_mktime_34 ' JUMPV addrg
C_mktime_33
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C_mktime_34
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, #48 ' reg <- coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##@C__ytab ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r21, r22 ' SUBI/P (1)
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 cmps r20,  #12 wz
 if_nz jmp #\C_mktime_36 ' NEI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_mktime_36
C_mktime_29
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1900 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, #4 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_38 ' NEI4
 mov r18, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_40 ' NEI4
 mov r18, #400 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_mktime_38 ' NEI4
C_mktime_40
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_mktime_39 ' JUMPV addrg
C_mktime_38
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C_mktime_39
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, #48 ' reg <- coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##@C__ytab ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r21, r22 wcz
 if_ae jmp #\C_mktime_28 ' GEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__tzset ' CALL addrg
 mov r19, ##1970 ' reg <- con
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1900 ' reg <- con
 subs r20, r19
 neg r20, r20 ' SUBI/P (2)
 cmps r22, r20 wcz
 if_ae jmp #\C_mktime_41 ' GEI4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_mktime_1 ' JUMPV addrg
C_mktime_41
 mov r15, #0 ' reg <- coni
 mov r21, #0 ' reg <- coni
 mov r9, #0 ' reg <- coni
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1900 ' reg <- con
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 mov r22, ##5883516 ' reg <- con
 mov r20, r17 ' SUBI/P
 subs r20, r19 ' SUBI/P (3)
 cmps r22, r20 wcz
 if_ae jmp #\C_mktime_43 ' GEI4
 adds r9, #1 ' ADDI4 coni
C_mktime_43
 mov r22, r17 ' SUBI/P
 subs r22, r19 ' SUBI/P (3)
 mov r20, #365 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r22 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r21, r0 ' CVI, CVU or LOAD
 mov r20, ##2147483647 ' reg <- con
 subs r20, r21 ' SUBI/P (1)
 mov r18, #4 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r0
 adds r22, #1 ' ADDI4 coni
 cmps r20, r22 wcz
 if_ae jmp #\C_mktime_45 ' GEI4
 adds r9, #1 ' ADDI4 coni
C_mktime_45
 mov r22, #4 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r1 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_mktime_48 ' EQI4
 mov r20, #4 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r22, r1 wcz
 if_ae jmp #\C_mktime_48 ' GEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_mktime_49 ' JUMPV addrg
C_mktime_48
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_mktime_49
 mov r22, r17 ' SUBI/P
 subs r22, r19 ' SUBI/P (3)
 mov r20, #4 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, r0 ' ADDI/P (2)
 adds r21, r22 ' ADDI/P (1)
 mov r22, #100 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r1 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_mktime_51 ' EQI4
 mov r20, #100 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r22, r1 wcz
 if_ae jmp #\C_mktime_51 ' GEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_mktime_52 ' JUMPV addrg
C_mktime_51
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_mktime_52
 mov r22, r17 ' SUBI/P
 subs r22, r19 ' SUBI/P (3)
 mov r20, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, r0 ' ADDI/P (2)
 subs r21, r22 ' SUBI/P (1)
 mov r22, #400 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r1 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_mktime_54 ' EQI4
 mov r20, #400 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r22, r1 wcz
 if_ae jmp #\C_mktime_54 ' GEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_mktime_55 ' JUMPV addrg
C_mktime_54
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
C_mktime_55
 mov r22, r17 ' SUBI/P
 subs r22, r19 ' SUBI/P (3)
 mov r20, #400 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, r0 ' ADDI/P (2)
 adds r21, r22 ' ADDI/P (1)
 mov r22, #0 ' reg <- coni
 mov r13, r22 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #\@C_mktime_57 ' JUMPV addrg
C_mktime_56
 mov r22, #0 ' reg <- coni
 mov r20, #4 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r22 wz
 if_nz jmp #\C_mktime_60 ' NEI4
 mov r20, #100 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r22 wz
 if_nz jmp #\C_mktime_62 ' NEI4
 mov r20, #400 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r22 wz
 if_nz jmp #\C_mktime_60 ' NEI4
C_mktime_62
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_mktime_61 ' JUMPV addrg
C_mktime_60
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_mktime_61
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, #48 ' reg <- coni
 mov r18, FP
 sub r18, #-(-28) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##@C__ytab ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r11, r22 ' ADDI/P (1)
 adds r13, #1 ' ADDI4 coni
C_mktime_57
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r13, r22 wcz
 if_b jmp #\C_mktime_56 ' LTI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 adds r11, r22 ' ADDI/P (1)
 mov r22, r21 ' ADDI/P
 adds r22, r11 ' ADDI/P (3)
 cmps r22,  #0 wcz
 if_ae jmp #\C_mktime_63 ' GEI4
 adds r9, #1 ' ADDI4 coni
C_mktime_63
 adds r21, r11 ' ADDI/P (1)
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 wrlong r11, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDI4 coni
 mov r18, #7 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 wrlong r1, r22 ' ASGNI4 reg reg
 mov r22, #60 ' reg <- coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r20, r0 ' ADDI/P (2)
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 rdlong r22, r23 ' reg <- INDIRI4 reg
 adds r22, r0 ' ADDI/P (2)
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, ##$ffffffff ' reg <- con
 sub r22, r15 ' SUBU (1)
 mov r20, ##$15180 ' reg <- con
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r0, r22 wcz 
 if_ae jmp #\C_mktime_65 ' GEU4
 adds r9, #1 ' ADDI4 coni
C_mktime_65
 mov r22, ##86400 ' reg <- con
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r21 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 add r15, r22 ' ADDU (1)
 mov r22, ##@C__timezone
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_be jmp #\C_mktime_70 ' LEI4
 mov r20, ##$ffffffff ' reg <- con
 mov RI, r20
 sub RI, r22
 mov r22, RI ' SUBU (2)
 cmp r22, r15 wcz 
 if_b jmp #\C_mktime_69 ' LTU4
C_mktime_70
 mov r22, ##@C__timezone
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_ae jmp #\C_mktime_67 ' GEI4
 neg r22, r22 ' NEGI4
 cmp r15, r22 wcz 
 if_ae jmp #\C_mktime_67 ' GEU4
C_mktime_69
 adds r9, #1 ' ADDI4 coni
C_mktime_67
 mov r22, ##@C__timezone
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 add r15, r22 ' ADDU (1)
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_mktime_71 ' GEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__dstget ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 jmp #\@C_mktime_72 ' JUMPV addrg
C_mktime_71
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_mktime_73 ' EQI4
 mov r22, ##@C__dst_off
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r7, r22 ' CVI, CVU or LOAD
 jmp #\@C_mktime_74 ' JUMPV addrg
C_mktime_73
 mov r7, #0 ' reg <- coni
C_mktime_74
C_mktime_72
 cmp r7, r15 wcz 
 if_be jmp #\C_mktime_75 ' LEU4
 adds r9, #1 ' ADDI4 coni
C_mktime_75
 sub r15, r7 ' SUBU (1)
 cmps r9,  #0 wz
 if_z jmp #\C_mktime_77 ' EQI4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_mktime_1 ' JUMPV addrg
C_mktime_77
 cmp r15, r15 wz
 if_z jmp #\C_mktime_79 ' EQU4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_mktime_1 ' JUMPV addrg
C_mktime_79
 mov r0, r15 ' CVI, CVU or LOAD
C_mktime_1
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


' Catalina Import _dst_off

' Catalina Import _timezone

' Catalina Import _dstget

' Catalina Import _tzset

' Catalina Import _ytab
' end
