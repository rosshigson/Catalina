' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export pthread_rwlock_init

 alignl ' align long
C_pthread_rwlock_init ' <symbol:pthread_rwlock_init>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_rwlock_init_3 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_rwlock_init_2 ' JUMPV addrg
C_pthread_rwlock_init_3
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_pthread_rwlock_init_5 ' GTI4
 mov r22, #11 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_rwlock_init_2 ' JUMPV addrg
C_pthread_rwlock_init_5
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_rwlock_init_2
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export pthread_rwlock_destroy

 alignl ' align long
C_pthread_rwlock_destroy ' <symbol:pthread_rwlock_destroy>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_rwlock_destroy_8 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_rwlock_destroy_7 ' JUMPV addrg
C_pthread_rwlock_destroy_8
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_stall ' CALL addrg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_pthread_rwlock_destroy_10 ' LEI4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C__P_thread_P_ool
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__thread_lockret
 add SP, #4 ' CALL addrg
C_pthread_rwlock_destroy_10
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_allow ' CALL addrg
 mov r0, #0 ' reg <- coni
C_pthread_rwlock_destroy_7
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export pthread_rwlockattr_init

 alignl ' align long
C_pthread_rwlockattr_init ' <symbol:pthread_rwlockattr_init>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_rwlockattr_init_13 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_rwlockattr_init_12 ' JUMPV addrg
C_pthread_rwlockattr_init_13
 mov r22, #0 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_rwlockattr_init_12
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_rwlockattr_destroy

 alignl ' align long
C_pthread_rwlockattr_destroy ' <symbol:pthread_rwlockattr_destroy>
 mov r0, #0 ' reg <- coni
' C_pthread_rwlockattr_destroy_15 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export pthread_rwlockattr_setpshared

 alignl ' align long
C_pthread_rwlockattr_setpshared ' <symbol:pthread_rwlockattr_setpshared>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_rwlockattr_setpshared_19 ' EQU4
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_rwlockattr_setpshared_17 ' EQI4
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_pthread_rwlockattr_setpshared_17 ' EQI4
C_pthread_rwlockattr_setpshared_19
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_rwlockattr_setpshared_16 ' JUMPV addrg
C_pthread_rwlockattr_setpshared_17
 mov r0, #0 ' reg <- coni
C_pthread_rwlockattr_setpshared_16
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_rwlockattr_getpshared

 alignl ' align long
C_pthread_rwlockattr_getpshared ' <symbol:pthread_rwlockattr_getpshared>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_rwlockattr_getpshared_23 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_rwlockattr_getpshared_21 ' NEU4
C_pthread_rwlockattr_getpshared_23
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_rwlockattr_getpshared_20 ' JUMPV addrg
C_pthread_rwlockattr_getpshared_21
 mov r22, #0 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_rwlockattr_getpshared_20
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _Pthread_Pool

' Catalina Import _pthread_init_lock_pool

' Catalina Import errno

' Catalina Import _thread_allow

' Catalina Import _thread_stall

' Catalina Import _thread_lockret
' end
