' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export pthread_setcancelstate

 alignl ' align long
C_pthread_setcancelstate ' <symbol:pthread_setcancelstate>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_self ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_setcancelstate_7 ' EQU4
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C_pthread_setcancelstate_5 ' EQI4
 cmps r23,  #1 wz
 jmp #BR_Z
 long @C_pthread_setcancelstate_5 ' EQI4
C_pthread_setcancelstate_7
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_setcancelstate_4 ' JUMPV addrg
C_pthread_setcancelstate_5
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_pthread_setcancelstate_8 ' NEU4
 mov r22, #1 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_pthread_setcancelstate_9 ' JUMPV addrg
C_pthread_setcancelstate_8
 mov r22, r19
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #36 ' ADDP4 coni
 wrlong r23, r22 ' ASGNI4 reg reg
C_pthread_setcancelstate_9
 mov r0, #0 ' RET coni
C_pthread_setcancelstate_4
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export pthread_cancel

 alignl ' align long
C_pthread_cancel ' <symbol:pthread_cancel>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 cmp r23,  #0 wz
 jmp #BR_Z
 long @C_pthread_cancel_13 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r23, r20 wz
 jmp #BRNZ
 long @C_pthread_cancel_11 ' NEU4
C_pthread_cancel_13
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_cancel_10 ' JUMPV addrg
C_pthread_cancel_11
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_cancel_14 ' EQI4
 mov r22, #16 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_cancel_10 ' JUMPV addrg
C_pthread_cancel_14
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_pthread_cancel_16 ' NEU4
 mov r22, #3 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_cancel_10 ' JUMPV addrg
C_pthread_cancel_16
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__thread_stop ' CALL addrg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_cancel_18 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_free ' CALL addrg
C_pthread_cancel_18
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_free ' CALL addrg
 mov r0, #0 ' RET coni
C_pthread_cancel_10
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import free

' Catalina Import pthread_self

' Catalina Import errno

' Catalina Import _thread_stop
' end
