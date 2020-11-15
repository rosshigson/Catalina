' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fflush

 alignl ' align long
C_fflush ' <symbol:fflush>
 PRIMITIVE(#NEWF)
 sub SP, #8
 PRIMITIVE(#PSHM)
 long $ff0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_fflush_2  ' NEU4
 mov r21, #0 ' reg <- coni
C_fflush_4
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
 mov r20, ##@C___iotab+8 ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20,  #0 wz
 if_z jmp #\C_fflush_8 ' EQI4
 mov r20, ##@C___iotab ' reg <- addrg
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_fflush ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_fflush_8 ' EQI4
 mov r17, ##-1 ' reg <- con
C_fflush_8
' C_fflush_5 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #8 wcz
 if_b jmp #\C_fflush_4 ' LTI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_fflush_1 ' JUMPV addrg
C_fflush_2
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_fflush_13 ' EQU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 and r18, #128 ' BANDI4 coni
 cmps r18, r20 wz
 if_nz jmp #\C_fflush_11 ' NEI4
 and r22, #256 ' BANDI4 coni
 cmps r22, r20 wz
 if_nz jmp #\C_fflush_11 ' NEI4
C_fflush_13
 mov r0, #0 ' reg <- coni
 jmp #\@C_fflush_1 ' JUMPV addrg
C_fflush_11
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_fflush_14 ' EQI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_fflush_16 ' EQU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_fflush_16 ' NEI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_fflush_16
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__lseek
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_fflush_18 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, ##-385 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
C_fflush_18
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_fflush_1 ' JUMPV addrg
C_fflush_14
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_fflush_20 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_fflush_1 ' JUMPV addrg
C_fflush_20
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_fflush_22 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, ##-257 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
C_fflush_22
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r18, r22 ' reg <- INDIRP4 reg
 rdlong r16, r20 ' reg <- INDIRP4 reg
 sub r18, r16 ' SUBU (1)
 mov r19, r18 ' CVI, CVU or LOAD
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 cmps r19,  #0 wcz
 if_a jmp #\C_fflush_24 ' GTI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_fflush_1 ' JUMPV addrg
C_fflush_24
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##512 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_z jmp #\C_fflush_26 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__lseek
 add SP, #8 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_fflush_28 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, ##-1 ' RET con
 jmp #\@C_fflush_1 ' JUMPV addrg
C_fflush_28
C_fflush_26
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__write
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wz
 if_nz jmp #\C_fflush_30 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_fflush_1 ' JUMPV addrg
C_fflush_30
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, ##-1 ' RET con
C_fflush_1
 PRIMITIVE(#POPM) ' restore registers
 add SP, #8 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export __cleanup

 alignl ' align long
C___cleanup ' <symbol:__cleanup>
' C___cleanup_32 ' (symbol refcount = 0)
 PRIMITIVE(#RETN)


' Catalina Import _lseek

' Catalina Import _write

' Catalina Import __iotab
' end
