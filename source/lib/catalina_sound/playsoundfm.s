' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export PlaySoundFM

 alignl ' align long
C_P_layS_oundF_M_ ' <symbol:PlaySoundFM>
 PRIMITIVE(#NEWF)
 PRIMITIVE(#PSHM)
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, ##@C__sound_buffer
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_P_layS_oundF_M__3  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__initialize_sound ' CALL addrg
C_P_layS_oundF_M__3
 mov r22, #7 ' reg <- coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 adds r22, #4 ' ADDI4 coni
 mov r20, ##@C__sound_buffer
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 mov r22, ##@C__sound_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_P_layS_oundF_M__8 ' LTI4
 mov r2, ##@C__sound_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_P_layS_oundF_M__7
C_P_layS_oundF_M__8
 rdlong r22, r15 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_P_layS_oundF_M__7  ' NEU4
 mov r22, #7 ' reg <- coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 adds r22, #4 ' ADDI4 coni
 adds r22, #4 ' ADDI4 coni
 mov r20, ##@C__sound_buffer
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #4 ' ADDP4 coni
 wrlong r23, r22 ' ASGNU4 reg reg
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNU4 reg reg
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #4 ' ADDP4 coni
 wrlong r17, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$80000000 ' reg <- con
 or r22, r20 ' BORI/U (1)
 wrlong r22, r15 ' ASGNU4 reg reg
 mov r22, ##@C__sound_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_P_layS_oundF_M__10 ' LTI4
 mov r2, ##@C__sound_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_P_layS_oundF_M__10
' C_P_layS_oundF_M__2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETF)


' Catalina Import _initialize_sound

' Catalina Import _sound_lock

' Catalina Import _sound_buffer

' Catalina Import _release_lock

' Catalina Import _acquire_lock
' end
