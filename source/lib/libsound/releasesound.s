' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export ReleaseSound

 alignl ' align long
C_R_eleaseS_ound ' <symbol:ReleaseSound>
 PRIMITIVE(#PSHM)
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C__sound_buffer
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_R_eleaseS_ound_3  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__initialize_sound ' CALL addrg
C_R_eleaseS_ound_3
 mov r22, #7 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 adds r22, #4 ' ADDI4 coni
 mov r20, ##@C__sound_buffer
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 mov r21, r22 ' ADDI/P
 adds r21, r20 ' ADDI/P (3)
 mov r22, ##@C__sound_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_R_eleaseS_ound_8 ' LTI4
 mov r2, ##@C__sound_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_R_eleaseS_ound_7
C_R_eleaseS_ound_8
 rdlong r22, r21 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_R_eleaseS_ound_7  ' NEU4
 mov r22, ##$80000008 ' reg <- con
 wrlong r22, r21 ' ASGNU4 reg reg
 mov r22, ##@C__sound_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_R_eleaseS_ound_10 ' LTI4
 mov r2, ##@C__sound_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_R_eleaseS_ound_10
' C_R_eleaseS_ound_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _initialize_sound

' Catalina Import _sound_lock

' Catalina Import _sound_buffer

' Catalina Import _release_lock

' Catalina Import _acquire_lock
' end
