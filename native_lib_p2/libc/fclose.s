' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fclose

 alignl ' align long
C_fclose ' <symbol:fclose>
 PRIMITIVE(#PSHM)
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r22, ##@C___iolock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_fclose_4 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__locknew ' CALL addrg
 wrlong r0, ##@C___iolock ' ASGNI4 addrg reg
C_fclose_4
 mov r22, ##@C___iolock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_fclose_6 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_fclose_3 ' JUMPV addrg
C_fclose_6
 mov r2, ##@C___iolock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
 mov r21, #0 ' reg <- coni
C_fclose_8
 mov r22, #24 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r21 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r23 ' CVI, CVU or LOAD
 mov r18, ##@C___iotab ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r18 ' ADDI/P (3)
 cmp r20, r22 wz
 if_nz jmp #\C_fclose_12  ' NEU4
 jmp #\@C_fclose_10 ' JUMPV addrg
C_fclose_12
' C_fclose_9 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #8 wcz
 if_b jmp #\C_fclose_8 ' LTI4
C_fclose_10
 cmps r21,  #8 wcz
 if_b jmp #\C_fclose_14 ' LTI4
 mov r19, ##-1 ' reg <- con
 jmp #\@C_fclose_16 ' JUMPV addrg
C_fclose_14
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_fflush ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_fclose_17 ' EQI4
 mov r19, ##-1 ' reg <- con
C_fclose_17
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__close ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_fclose_19 ' EQI4
 mov r19, ##-1 ' reg <- con
C_fclose_19
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_fclose_21 ' EQI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_fclose_21 ' EQU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C___iobuff ' reg <- addrg
 cmp r22, r20 wz
 if_nz jmp #\C_fclose_23  ' NEU4
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C___ioused ' ASGNI4 addrg reg
 jmp #\@C_fclose_24 ' JUMPV addrg
C_fclose_23
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #2 wcz
 if_b jmp #\C_fclose_25 ' LTI4
C_fclose_25
C_fclose_24
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
C_fclose_21
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_fclose_16
 mov r2, ##@C___iolock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
C_fclose_3
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _close

' Catalina Import __iobuff

' Catalina Import __ioused

' Catalina Import __iolock

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _locknew

' Catalina Import fflush

' Catalina Import __iotab
' end
