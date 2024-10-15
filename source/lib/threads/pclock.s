' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export clock_getcpuclockid

 alignl ' align long
C_clock_getcpuclockid ' <symbol:clock_getcpuclockid>
 mov r0, #0 ' reg <- coni
' C_clock_getcpuclockid_2 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export clock_getres

 alignl ' align long
C_clock_getres ' <symbol:clock_getres>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_clock_getres_4  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##-1 ' RET con
 jmp #\@C_clock_getres_3 ' JUMPV addrg
C_clock_getres_4
 cmps r3,  #4 wz
 if_nz jmp #\C_clock_getres_6 ' NEI4
 mov r22, #1 ' reg <- coni
 wrlong r22, r2 ' ASGNU4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_clock_getres_7 ' JUMPV addrg
C_clock_getres_6
 mov r22, #0 ' reg <- coni
 wrlong r22, r2 ' ASGNU4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov r20, ##1000000 ' reg <- con
 wrlong r20, r22 ' ASGNI4 reg reg
C_clock_getres_7
 mov r0, #0 ' reg <- coni
C_clock_getres_3
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export clock_gettime

 alignl ' align long
C_clock_gettime ' <symbol:clock_gettime>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_clock_gettime_9  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##-1 ' RET con
 jmp #\@C_clock_gettime_8 ' JUMPV addrg
C_clock_gettime_9
 cmps r23,  #4 wz
 if_nz jmp #\C_clock_gettime_11 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_time ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_clock_gettime_12 ' JUMPV addrg
C_clock_gettime_11
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_clock ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##1000 ' reg <- con
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 wrlong r0, r21 ' ASGNU4 reg reg
 mov r22, ##1000 ' reg <- con
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r18, r22 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r1 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNI4 reg reg
C_clock_gettime_12
 mov r0, #0 ' reg <- coni
C_clock_gettime_8
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export clock_settime

 alignl ' align long
C_clock_settime ' <symbol:clock_settime>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_clock_settime_14  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##-1 ' RET con
 jmp #\@C_clock_settime_13 ' JUMPV addrg
C_clock_settime_14
 cmps r23,  #4 wz
 if_nz jmp #\C_clock_settime_16 ' NEI4
 rdlong r2, r21 ' reg <- INDIRU4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__settime ' CALL addrg
 jmp #\@C_clock_settime_17 ' JUMPV addrg
C_clock_settime_16
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##-1 ' RET con
 jmp #\@C_clock_settime_13 ' JUMPV addrg
C_clock_settime_17
 mov r0, #0 ' reg <- coni
C_clock_settime_13
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export clock_normalize

 alignl ' align long
C_clock_normalize ' <symbol:clock_normalize>
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1000000000 ' reg <- con
 cmps r22, r20 wcz
 if_be jmp #\C_clock_normalize_19 ' LEI4
 rdlong r22, r2 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, ##1000000000 ' reg <- con
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (1)
 wrlong r22, r2 ' ASGNU4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, ##1000000000 ' reg <- con
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 wrlong r1, r22 ' ASGNI4 reg reg
C_clock_normalize_19
' C_clock_normalize_18 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export clock_compare

 alignl ' align long
C_clock_compare ' <symbol:clock_compare>
 calld PA,#PSHM
 long $500000 ' save registers
 rdlong r22, r3 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_clock_compare_22 ' LEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_clock_compare_21 ' JUMPV addrg
C_clock_compare_22
 rdlong r22, r3 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_clock_compare_24 ' GEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_clock_compare_21 ' JUMPV addrg
C_clock_compare_24
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_be jmp #\C_clock_compare_26 ' LEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_clock_compare_21 ' JUMPV addrg
C_clock_compare_26
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_ae jmp #\C_clock_compare_28 ' GEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_clock_compare_21 ' JUMPV addrg
C_clock_compare_28
 mov r0, #0 ' reg <- coni
C_clock_compare_21
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export clock_sub

 alignl ' align long
C_clock_sub ' <symbol:clock_sub>
 calld PA,#PSHM
 long $550000 ' save registers
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_b jmp #\C_clock_sub_31 ' LTI4
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r2
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 subs r20, r18 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_clock_sub_32 ' JUMPV addrg
C_clock_sub_31
 rdlong r22, r3 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 wrlong r22, r3 ' ASGNU4 reg reg
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, ##1000000000 ' reg <- con
 mov r16, r2
 adds r16, #4 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRI4 reg
 subs r18, r16 ' SUBI/P (1)
 subs r20, r18 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
C_clock_sub_32
 rdlong r22, r3 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 wrlong r22, r3 ' ASGNU4 reg reg
' C_clock_sub_30 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export clock_add

 alignl ' align long
C_clock_add ' <symbol:clock_add>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 rdlong r20, r21 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 wrlong r22, r23 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r21
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_clock_normalize ' CALL addrg
' C_clock_add_33 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export clock_nanosleep

 alignl ' align long
C_clock_nanosleep ' <symbol:clock_nanosleep>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_clock_nanosleep_35  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##-1 ' RET con
 jmp #\@C_clock_nanosleep_34 ' JUMPV addrg
C_clock_nanosleep_35
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_clock_gettime
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_clock_nanosleep_37 ' NEI4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##-1 ' RET con
 jmp #\@C_clock_nanosleep_34 ' JUMPV addrg
C_clock_nanosleep_37
 mov r22, r21
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_clock_nanosleep_39 ' EQI4
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_clock_compare
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_clock_nanosleep_40 ' LEI4
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_clock_sub
 add SP, #4 ' CALL addrg
 mov r22, ##$f4240 ' reg <- con
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1000 ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (2)
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_msleep ' CALL addrg
 jmp #\@C_clock_nanosleep_40 ' JUMPV addrg
C_clock_nanosleep_39
 mov r22, ##$f4240 ' reg <- con
 rdlong r20, r19 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1000 ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (2)
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_msleep ' CALL addrg
C_clock_nanosleep_40
 mov r0, #0 ' reg <- coni
C_clock_nanosleep_34
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


' Catalina Export nanosleep

 alignl ' align long
C_nanosleep ' <symbol:nanosleep>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_clock_nanosleep
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_nanosleep_44 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import pthread_msleep

' Catalina Import _settime

' Catalina Import time

' Catalina Import clock

' Catalina Import errno
' end
