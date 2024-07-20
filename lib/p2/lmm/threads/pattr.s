' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export pthread_attr_init

 alignl ' align long
C_pthread_attr_init ' <symbol:pthread_attr_init>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_attr_init_3 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_init_2 ' JUMPV addrg
C_pthread_attr_init_3
 mov r2, #44 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 jmp #LODL
 long 4000
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov r20, #100 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_init_2
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export pthread_attr_destroy

 alignl ' align long
C_pthread_attr_destroy ' <symbol:pthread_attr_destroy>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_attr_destroy_6 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_destroy_5 ' JUMPV addrg
C_pthread_attr_destroy_6
 mov r0, #0 ' RET coni
C_pthread_attr_destroy_5
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_copy

 alignl ' align long
C_pthread_attr_copy ' <symbol:pthread_attr_copy>
 jmp #NEWF
 jmp #PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #44 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r0, #0 ' RET coni
' C_pthread_attr_copy_8 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export pthread_attr_setstack

 alignl ' align long
C_pthread_attr_setstack ' <symbol:pthread_attr_setstack>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r4 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_attr_setstack_10 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_setstack_9 ' JUMPV addrg
C_pthread_attr_setstack_10
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 wrlong r3, r22 ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #8 ' ADDP4 coni
 wrlong r2, r22 ' ASGNU4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_setstack_9
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_getstack

 alignl ' align long
C_pthread_attr_getstack ' <symbol:pthread_attr_getstack>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r4 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_attr_getstack_13 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_getstack_12 ' JUMPV addrg
C_pthread_attr_getstack_13
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r3 ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r2 ' ASGNU4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_getstack_12
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_setstacksize

 alignl ' align long
C_pthread_attr_setstacksize ' <symbol:pthread_attr_setstacksize>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_attr_setstacksize_16 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_setstacksize_15 ' JUMPV addrg
C_pthread_attr_setstacksize_16
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 wrlong r2, r22 ' ASGNU4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_setstacksize_15
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_getstacksize

 alignl ' align long
C_pthread_attr_getstacksize ' <symbol:pthread_attr_getstacksize>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_attr_getstacksize_19 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_getstacksize_18 ' JUMPV addrg
C_pthread_attr_getstacksize_19
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r2 ' ASGNU4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_getstacksize_18
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_setguardsize

 alignl ' align long
C_pthread_attr_setguardsize ' <symbol:pthread_attr_setguardsize>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_attr_setguardsize_22 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_setguardsize_21 ' JUMPV addrg
C_pthread_attr_setguardsize_22
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 wrlong r2, r22 ' ASGNU4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_setguardsize_21
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_getguardsize

 alignl ' align long
C_pthread_attr_getguardsize ' <symbol:pthread_attr_getguardsize>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_attr_getguardsize_27 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_attr_getguardsize_25 ' NEU4
C_pthread_attr_getguardsize_27
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_getguardsize_24 ' JUMPV addrg
C_pthread_attr_getguardsize_25
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r2 ' ASGNU4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_getguardsize_24
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_setdetachstate

 alignl ' align long
C_pthread_attr_setdetachstate ' <symbol:pthread_attr_setdetachstate>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_attr_setdetachstate_31 ' EQU4
 cmps r2,  #1 wz
 jmp #BR_Z
 long @C_pthread_attr_setdetachstate_29 ' EQI4
 cmps r2,  #0 wz
 jmp #BR_Z
 long @C_pthread_attr_setdetachstate_29 ' EQI4
C_pthread_attr_setdetachstate_31
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_setdetachstate_28 ' JUMPV addrg
C_pthread_attr_setdetachstate_29
 mov r22, r3
 adds r22, #32 ' ADDP4 coni
 wrlong r2, r22 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_setdetachstate_28
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_getdetachstate

 alignl ' align long
C_pthread_attr_getdetachstate ' <symbol:pthread_attr_getdetachstate>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_attr_getdetachstate_35 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_attr_getdetachstate_33 ' NEU4
C_pthread_attr_getdetachstate_35
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_getdetachstate_32 ' JUMPV addrg
C_pthread_attr_getdetachstate_33
 mov r22, r3
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_getdetachstate_32
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_setscope

 alignl ' align long
C_pthread_attr_setscope ' <symbol:pthread_attr_setscope>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_attr_setscope_39 ' EQU4
 cmps r2,  #1 wz
 jmp #BR_Z
 long @C_pthread_attr_setscope_37 ' EQI4
 cmps r2,  #0 wz
 jmp #BR_Z
 long @C_pthread_attr_setscope_37 ' EQI4
C_pthread_attr_setscope_39
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_setscope_36 ' JUMPV addrg
C_pthread_attr_setscope_37
 mov r0, #0 ' RET coni
C_pthread_attr_setscope_36
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_getscope

 alignl ' align long
C_pthread_attr_getscope ' <symbol:pthread_attr_getscope>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_attr_getscope_43 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_attr_getscope_41 ' NEU4
C_pthread_attr_getscope_43
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_getscope_40 ' JUMPV addrg
C_pthread_attr_getscope_41
 mov r22, #1 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_getscope_40
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_setschedpolicy

 alignl ' align long
C_pthread_attr_setschedpolicy ' <symbol:pthread_attr_setschedpolicy>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_attr_setschedpolicy_47 ' EQU4
 cmps r2,  #0 wz
 jmp #BR_Z
 long @C_pthread_attr_setschedpolicy_45 ' EQI4
C_pthread_attr_setschedpolicy_47
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_setschedpolicy_44 ' JUMPV addrg
C_pthread_attr_setschedpolicy_45
 mov r0, #0 ' RET coni
C_pthread_attr_setschedpolicy_44
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_getschedpolicy

 alignl ' align long
C_pthread_attr_getschedpolicy ' <symbol:pthread_attr_getschedpolicy>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_attr_getschedpolicy_51 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_attr_getschedpolicy_49 ' NEU4
C_pthread_attr_getschedpolicy_51
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_getschedpolicy_48 ' JUMPV addrg
C_pthread_attr_getschedpolicy_49
 mov r22, #0 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_getschedpolicy_48
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_setschedparam

 alignl ' align long
C_pthread_attr_setschedparam ' <symbol:pthread_attr_setschedparam>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_attr_setschedparam_56 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_attr_setschedparam_56 ' EQU4
 rdlong r22, r2 ' reg <- INDIRI4 reg
 cmps r22,  #1 wcz
 jmp #BRAE
 long @C_pthread_attr_setschedparam_53 ' GEI4
C_pthread_attr_setschedparam_56
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_setschedparam_52 ' JUMPV addrg
C_pthread_attr_setschedparam_53
 mov r22, r3
 adds r22, #28 ' ADDP4 coni
 rdlong r20, r2 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_setschedparam_52
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_attr_getschedparam

 alignl ' align long
C_pthread_attr_getschedparam ' <symbol:pthread_attr_getschedparam>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_attr_getschedparam_60 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_attr_getschedparam_58 ' NEU4
C_pthread_attr_getschedparam_60
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_attr_getschedparam_57 ' JUMPV addrg
C_pthread_attr_getschedparam_58
 mov r22, r3
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_attr_getschedparam_57
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_setschedparam

 alignl ' align long
C_pthread_setschedparam ' <symbol:pthread_setschedparam>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_setschedparam_65 ' EQU4
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_setschedparam_65 ' EQU4
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #1 wcz
 jmp #BRAE
 long @C_pthread_setschedparam_62 ' GEI4
C_pthread_setschedparam_65
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_setschedparam_61 ' JUMPV addrg
C_pthread_setschedparam_62
 rdlong r2, r19 ' reg <- INDIRI4 reg
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__thread_ticks
 add SP, #4 ' CALL addrg
 mov r0, #0 ' RET coni
C_pthread_setschedparam_61
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export pthread_getschedparam

 alignl ' align long
C_pthread_getschedparam ' <symbol:pthread_getschedparam>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_getschedparam_69 ' EQU4
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_getschedparam_67 ' NEU4
C_pthread_getschedparam_69
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_getschedparam_66 ' JUMPV addrg
C_pthread_getschedparam_67
 mov r22, #0 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__thread_get_ticks ' CALL addrg
 wrlong r0, r19 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_getschedparam_66
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import memcpy

' Catalina Import _cogid

' Catalina Import memset

' Catalina Import errno

' Catalina Import _thread_get_ticks

' Catalina Import _thread_ticks
' end
