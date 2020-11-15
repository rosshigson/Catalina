' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C___fillbuf_ch_L000005 ' <symbol:ch>
 byte 0[8]

' Catalina Export __fillbuf

' Catalina Code

DAT ' code segment

 alignl ' align long
C___fillbuf ' <symbol:__fillbuf>
 PRIMITIVE(#PSHM)
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C___iolock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C___fillbuf_6 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__locknew ' CALL addrg
 wrlong r0, ##@C___iolock ' ASGNI4 addrg reg
C___fillbuf_6
 mov r22, ##@C___iolock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C___fillbuf_8 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C___fillbuf_3 ' JUMPV addrg
C___fillbuf_8
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C___fillbuf_10 ' GEI4
 mov r0, ##-1 ' RET con
 jmp #\@C___fillbuf_3 ' JUMPV addrg
C___fillbuf_10
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #48 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C___fillbuf_12 ' EQI4
 mov r0, ##-1 ' RET con
 jmp #\@C___fillbuf_3 ' JUMPV addrg
C___fillbuf_12
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C___fillbuf_14 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, ##-1 ' RET con
 jmp #\@C___fillbuf_3 ' JUMPV addrg
C___fillbuf_14
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C___fillbuf_16 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, ##-1 ' RET con
 jmp #\@C___fillbuf_3 ' JUMPV addrg
C___fillbuf_16
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C___fillbuf_18 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #128 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C___fillbuf_18
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C___fillbuf_20 ' NEI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C___fillbuf_20  ' NEU4
 mov r2, ##@C___iolock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##@C___iotab ' reg <- addrg
 cmp r22, r20 wz
 if_nz jmp #\C___fillbuf_22  ' NEU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, ##@C___iostdb ' reg <- addrg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #128 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C___fillbuf_23 ' JUMPV addrg
C___fillbuf_22
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##@C___iotab+24 ' reg <- addrg
 cmp r22, r20 wz
 if_nz jmp #\C___fillbuf_24  ' NEU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, ##@C___iostdb+128 ' reg <- addrg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #128 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C___fillbuf_25 ' JUMPV addrg
C___fillbuf_24
 mov r22, #0 ' reg <- coni
 mov r20, ##@C___ioused
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 cmps r20, r22 wz
 if_nz jmp #\C___fillbuf_28 ' NEI4
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 and r20, #4 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C___fillbuf_28 ' NEI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, ##@C___iobuff ' reg <- addrg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, ##512 ' reg <- con
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #1 ' reg <- coni
 wrlong r22, ##@C___ioused ' ASGNI4 addrg reg
C___fillbuf_28
C___fillbuf_25
C___fillbuf_23
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C___fillbuf_30  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #4 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C___fillbuf_31 ' JUMPV addrg
C___fillbuf_30
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #8 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C___fillbuf_31
 mov r2, ##@C___iolock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C___fillbuf_20
 mov r21, #0 ' reg <- coni
C___fillbuf_32
 mov r22, #24 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r21 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##@C___iotab+8 ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C___fillbuf_36 ' EQI4
 mov r22, #24 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r21 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##@C___iotab+8 ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C___fillbuf_39 ' EQI4
 mov r22, #24 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r21 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##@C___iotab ' reg <- addrg
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_fflush ' CALL addrg
C___fillbuf_39
C___fillbuf_36
' C___fillbuf_33 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #8 wcz
 if_b jmp #\C___fillbuf_32 ' LTI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C___fillbuf_42  ' NEU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, ##@C___fillbuf_ch_L000005 ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C___fillbuf_42
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__read
 add SP, #8 ' CALL addrg
 wrlong r0, r23 ' ASGNI4 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_a jmp #\C___fillbuf_44 ' GTI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C___fillbuf_46 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #16 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C___fillbuf_47 ' JUMPV addrg
C___fillbuf_46
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C___fillbuf_47
 mov r0, ##-1 ' RET con
 jmp #\@C___fillbuf_3 ' JUMPV addrg
C___fillbuf_44
 rdlong r22, r23 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r0, r20 ' reg <- CVUI4 INDIRU1 reg
C___fillbuf_3
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _read

' Catalina Import __iostdb

' Catalina Import __iobuff

' Catalina Import __ioused

' Catalina Import __iolock

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _locknew

' Catalina Import fflush

' Catalina Import __iotab
' end
