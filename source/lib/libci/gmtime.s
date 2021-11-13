' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_gmtime_br_time_L000003 ' <symbol:br_time>
 byte 0[36]

' Catalina Export gmtime

' Catalina Code

DAT ' code segment

 alignl ' align long
C_gmtime ' <symbol:gmtime>
 PRIMITIVE(#PSHM)
 long $feaa00 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, ##@C_gmtime_br_time_L000003 ' reg <- addrg
 rdlong r13, r23 ' reg <- INDIRU4 reg
 mov r15, ##1970 ' reg <- con
 mov r22, ##$15180 ' reg <- con
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r13, r22 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r1 ' CVI, CVU or LOAD
 mov r19, r20 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r13, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, #60 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r19, r22 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r1 ' CVI, CVU or LOAD
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r22, ##3600 ' reg <- con
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r19, r22 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r1 ' CVI, CVU or LOAD
 mov r20, #60 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r22, ##3600 ' reg <- con
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r19, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r22, r17
 add r22, #4 ' ADDU4 coni
 mov r20, #7 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #24 ' ADDP4 coni
 mov r22, r1 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNI4 reg reg
 jmp #\@C_gmtime_5 ' JUMPV addrg
C_gmtime_4
 mov r22, #4 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r20, #0 ' reg <- coni
 cmps r1, r20 wz
 if_nz jmp #\C_gmtime_9 ' NEI4
 mov r22, #100 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_gmtime_11 ' NEI4
 mov r22, #400 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r22, r1 ' CVI, CVU or LOAD
 cmps r22, r20 wz
 if_nz jmp #\C_gmtime_9 ' NEI4
C_gmtime_11
 mov r11, #366 ' reg <- coni
 jmp #\@C_gmtime_10 ' JUMPV addrg
C_gmtime_9
 mov r11, #365 ' reg <- coni
C_gmtime_10
 mov r22, r11 ' CVI, CVU or LOAD
 sub r17, r22 ' SUBU (1)
 adds r15, #1 ' ADDI4 coni
C_gmtime_5
 mov r22, #4 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r20, #0 ' reg <- coni
 cmps r1, r20 wz
 if_nz jmp #\C_gmtime_12 ' NEI4
 mov r22, #100 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_gmtime_14 ' NEI4
 mov r22, #400 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r22, r1 ' CVI, CVU or LOAD
 cmps r22, r20 wz
 if_nz jmp #\C_gmtime_12 ' NEI4
C_gmtime_14
 mov r11, #366 ' reg <- coni
 jmp #\@C_gmtime_13 ' JUMPV addrg
C_gmtime_12
 mov r11, #365 ' reg <- coni
C_gmtime_13
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r17, r22 wcz 
 if_ae jmp #\C_gmtime_4 ' GEU4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, ##1900 ' reg <- con
 subs r20, r15
 neg r20, r20 ' SUBI/P (2)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_gmtime_16 ' JUMPV addrg
C_gmtime_15
 mov r22, #4 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r20, #0 ' reg <- coni
 cmps r1, r20 wz
 if_nz jmp #\C_gmtime_20 ' NEI4
 mov r22, #100 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_gmtime_22 ' NEI4
 mov r22, #400 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r22, r1 ' CVI, CVU or LOAD
 cmps r22, r20 wz
 if_nz jmp #\C_gmtime_20 ' NEI4
C_gmtime_22
 mov r9, #1 ' reg <- coni
 jmp #\@C_gmtime_21 ' JUMPV addrg
C_gmtime_20
 mov r9, #0 ' reg <- coni
C_gmtime_21
 mov r22, #48 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r9 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 mov r18, ##@C__ytab ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r18 ' ADDI/P (3)
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sub r17, r22 ' SUBU (1)
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_gmtime_16
 mov r22, #4 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r20, #0 ' reg <- coni
 cmps r1, r20 wz
 if_nz jmp #\C_gmtime_23 ' NEI4
 mov r22, #100 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_gmtime_25 ' NEI4
 mov r22, #400 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r22, r1 ' CVI, CVU or LOAD
 cmps r22, r20 wz
 if_nz jmp #\C_gmtime_23 ' NEI4
C_gmtime_25
 mov r9, #1 ' reg <- coni
 jmp #\@C_gmtime_24 ' JUMPV addrg
C_gmtime_23
 mov r9, #0 ' reg <- coni
C_gmtime_24
 mov r22, #48 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r9 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 mov r18, ##@C__ytab ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r18 ' ADDI/P (3)
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmp r17, r22 wcz 
 if_ae jmp #\C_gmtime_15 ' GEU4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, r17
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_gmtime_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _ytab
' end
