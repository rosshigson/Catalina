' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export pthread_mutex_lock

 alignl ' align long
C_pthread_mutex_lock ' <symbol:pthread_mutex_lock>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_mutex_lock_3 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutex_lock_2 ' JUMPV addrg
C_pthread_mutex_lock_3
 mov r2, r23
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_pthread_mutex_lock_5 ' NEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_mutex_lock_7 ' EQU4
 mov r22, #16 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutex_lock_2 ' JUMPV addrg
C_pthread_mutex_lock_7
C_pthread_mutex_lock_5
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_self ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_pthread_mutex_lock_9 ' NEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_pthread_mutex_lock_11 ' EQU4
 jmp #JMPA
 long @C_pthread_mutex_lock_14 ' JUMPV addrg
C_pthread_mutex_lock_13
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_yield ' CALL addrg
C_pthread_mutex_lock_14
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C__P_thread_P_ool
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_pthread_mutex_lock_13 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_pthread_mutex_lock_2 ' JUMPV addrg
C_pthread_mutex_lock_11
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $7fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_pthread_mutex_lock_16 ' GEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_pthread_mutex_lock_2 ' JUMPV addrg
C_pthread_mutex_lock_16
 mov r22, #11 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutex_lock_2 ' JUMPV addrg
C_pthread_mutex_lock_9
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_pthread_mutex_lock_21 ' NEU4
 mov r22, #35 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutex_lock_2 ' JUMPV addrg
C_pthread_mutex_lock_20
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_yield ' CALL addrg
C_pthread_mutex_lock_21
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C__P_thread_P_ool
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_pthread_mutex_lock_20 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_mutex_lock_2
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export pthread_mutex_unlock

 alignl ' align long
C_pthread_mutex_unlock ' <symbol:pthread_mutex_unlock>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_mutex_unlock_26 ' EQU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_pthread_mutex_unlock_24 ' GTI4
C_pthread_mutex_unlock_26
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutex_unlock_23 ' JUMPV addrg
C_pthread_mutex_unlock_24
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_self ' CALL addrg
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_mutex_unlock_27 ' EQU4
 mov r22, #1 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutex_unlock_23 ' JUMPV addrg
C_pthread_mutex_unlock_27
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_pthread_mutex_unlock_29 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r22,  #1 wz,wc 
 jmp #BRBE
 long @C_pthread_mutex_unlock_31 ' LEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_pthread_mutex_unlock_32 ' JUMPV addrg
C_pthread_mutex_unlock_31
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C__P_thread_P_ool
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
C_pthread_mutex_unlock_32
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_yield ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_pthread_mutex_unlock_23 ' JUMPV addrg
C_pthread_mutex_unlock_29
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C__P_thread_P_ool
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_yield ' CALL addrg
 mov r0, #0 ' reg <- coni
C_pthread_mutex_unlock_23
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _pthread_init_lock_pool

' Catalina Import _Pthread_Pool

' Catalina Import pthread_self

' Catalina Import errno

' Catalina Import _thread_lockset

' Catalina Import _thread_lockclr

' Catalina Import _thread_yield
' end
