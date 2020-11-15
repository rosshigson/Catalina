' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fopen

 alignl ' align long
C_fopen ' <symbol:fopen>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $faaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r11, #0 ' reg <- coni
 mov r9, #0 ' reg <- coni
 mov r17, ##0 ' reg <- con
 mov r15, #0 ' reg <- coni
 mov r22, ##@C___iolock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_fopen_4 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__locknew ' CALL addrg
 wrlong r0, ##@C___iolock ' ASGNI4 addrg reg
C_fopen_4
 mov r22, ##@C___iolock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_fopen_6 ' NEI4
 jmp #\@C_fopen_8 ' JUMPV addrg
C_fopen_6
 mov r2, ##@C___iolock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
 mov r19, #0 ' reg <- coni
 jmp #\@C_fopen_12 ' JUMPV addrg
C_fopen_9
 cmps r19,  #7 wcz
 if_b jmp #\C_fopen_14 ' LTI4
 jmp #\@C_fopen_8 ' JUMPV addrg
C_fopen_14
' C_fopen_10 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_fopen_12
 mov r22, #24 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##@C___iotab+8 ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_fopen_9 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r7, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r22, #114 ' reg <- coni
 cmps r7, r22 wz
 if_z jmp #\C_fopen_19 ' EQI4
 cmps r7, r22 wcz
 if_a jmp #\C_fopen_23 ' GTI4
' C_fopen_22 ' (symbol refcount = 0)
 cmps r7,  #97 wz
 if_z jmp #\C_fopen_21 ' EQI4
 jmp #\@C_fopen_8 ' JUMPV addrg
C_fopen_23
 cmps r7,  #119 wz
 if_z jmp #\C_fopen_20 ' EQI4
 jmp #\@C_fopen_8 ' JUMPV addrg
C_fopen_19
 or r15, #129 ' BORI4 coni
 mov r11, #0 ' reg <- coni
 jmp #\@C_fopen_25 ' JUMPV addrg
C_fopen_20
 or r15, #258 ' BORI4 coni
 mov r11, #1 ' reg <- coni
 mov r9, #48 ' reg <- coni
 jmp #\@C_fopen_25 ' JUMPV addrg
C_fopen_21
 mov r22, ##770 ' reg <- con
 or r15, r22 ' BORI/U (1)
 mov r11, #1 ' reg <- coni
 or r9, #80 ' BORI4 coni
 jmp #\@C_fopen_25 ' JUMPV addrg
C_fopen_24
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #43 ' reg <- coni
 cmps r22, r20 wz
 if_z jmp #\C_fopen_31 ' EQI4
 cmps r22, r20 wcz
 if_b jmp #\C_fopen_26 ' LTI4
' C_fopen_32 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #98 wz
 if_z jmp #\C_fopen_25 ' EQI4
 jmp #\@C_fopen_26 ' JUMPV addrg
C_fopen_31
 mov r11, #2 ' reg <- coni
 or r15, #3 ' BORI4 coni
C_fopen_25
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_fopen_24 ' NEI4
C_fopen_26
 mov r22, r9
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_fopen_35 ' NEI4
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__open
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 cmps r0, r20 wcz
 if_ae jmp #\C_fopen_33 ' GEI4
 mov r22, r9
 and r22, #16 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_fopen_33 ' EQI4
C_fopen_35
 mov r2, #438 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__creat
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 cmps r0, r20 wcz
 if_be jmp #\C_fopen_36 ' LEI4
 mov r22, r15
 or r22, #1 ' BORI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_fopen_36 ' EQI4
 mov r2, r13 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__close ' CALL addrg
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__open
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
C_fopen_36
C_fopen_33
 cmps r13,  #0 wcz
 if_ae jmp #\C_fopen_38 ' GEI4
 jmp #\@C_fopen_8 ' JUMPV addrg
C_fopen_38
 mov r22, #24 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r13 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##@C___iotab ' reg <- addrg
 mov r17, r0 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 mov r22, #3 ' reg <- coni
 mov r20, r15
 and r20, #3 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_fopen_40 ' NEI4
 mov r22, ##-385 ' reg <- con
 and r15, r22 ' BANDI/U (1)
C_fopen_40
 mov r22, #0 ' reg <- coni
 wrlong r22, r17 ' ASGNI4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 wrlong r13, r22 ' ASGNI4 reg reg
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 wrlong r15, r22 ' ASGNI4 reg reg
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, ##@C___iolock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_fopen_3 ' JUMPV addrg
C_fopen_8
 mov r22, ##@C___iolock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_fopen_42 ' EQI4
 mov r2, ##@C___iolock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_fopen_42
 mov r0, r17 ' CVI, CVU or LOAD
C_fopen_3
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _close

' Catalina Import _creat

' Catalina Import _open

' Catalina Import __iolock

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _locknew

' Catalina Import __iotab
' end
