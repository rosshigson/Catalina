' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export pthread_barrier_destroy

 alignl ' align long
C_pthread_barrier_destroy ' <symbol:pthread_barrier_destroy>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_barrier_destroy_3  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_barrier_destroy_2 ' JUMPV addrg
C_pthread_barrier_destroy_3
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_pthread_barrier_destroy_5 ' LEI4
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockret
 add SP, #4 ' CALL addrg
C_pthread_barrier_destroy_5
 mov r22, ##-1 ' reg <- con
 wrlong r22, r23 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 mov r0, #0 ' reg <- coni
C_pthread_barrier_destroy_2
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_barrier_init

 alignl ' align long
C_pthread_barrier_init ' <symbol:pthread_barrier_init>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_pthread_barrier_init_10 ' EQU4
 cmp r19, r22 wz
 if_nz jmp #\C_pthread_barrier_init_8  ' NEU4
C_pthread_barrier_init_10
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_barrier_init_7 ' JUMPV addrg
C_pthread_barrier_init_8
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_pthread_barrier_init_11 ' LEI4
 mov r22, #16 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_barrier_init_7 ' JUMPV addrg
C_pthread_barrier_init_11
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 mov r2, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__thread_locknew ' CALL addrg
 wrlong r0, r23 ' ASGNI4 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_a jmp #\C_pthread_barrier_init_13 ' GTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 mov r22, #11 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_barrier_init_7 ' JUMPV addrg
C_pthread_barrier_init_13
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 mov r0, #0 ' reg <- coni
C_pthread_barrier_init_7
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_pthread_barrier_wait_16_L000017 ' <symbol:16>
 long 0
 long $0
 long $0

' Catalina Export pthread_barrier_wait

' Catalina Code

DAT ' code segment

 alignl ' align long
C_pthread_barrier_wait ' <symbol:pthread_barrier_wait>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r0, FP
 sub r0, #-(-16) ' reg <- addrli
 mov r1, ##@C_pthread_barrier_wait_16_L000017 ' reg <- addrg
 calld PA,#CPYB
 long 12 ' ASGNB
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_barrier_wait_20 ' EQU4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_a jmp #\C_pthread_barrier_wait_18 ' GTI4
C_pthread_barrier_wait_20
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_barrier_wait_15 ' JUMPV addrg
C_pthread_barrier_wait_18
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_pthread_barrier_wait_22  ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
C_pthread_barrier_wait_22
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 jmp #\@C_pthread_barrier_wait_25 ' JUMPV addrg
C_pthread_barrier_wait_24
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
C_pthread_barrier_wait_25
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_barrier_wait_24 ' EQU4
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 jmp #\@C_pthread_barrier_wait_28 ' JUMPV addrg
C_pthread_barrier_wait_27
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
C_pthread_barrier_wait_28
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 cmp r22, r20 wz
 if_nz jmp #\C_pthread_barrier_wait_27  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_barrier_wait_31  ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_pthread_barrier_wait_15 ' JUMPV addrg
C_pthread_barrier_wait_31
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 mov r0, #0 ' reg <- coni
C_pthread_barrier_wait_15
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export pthread_barrierattr_init

 alignl ' align long
C_pthread_barrierattr_init ' <symbol:pthread_barrierattr_init>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_barrierattr_init_34  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_barrierattr_init_33 ' JUMPV addrg
C_pthread_barrierattr_init_34
 mov r22, #0 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_barrierattr_init_33
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export pthread_barrierattr_destroy

 alignl ' align long
C_pthread_barrierattr_destroy ' <symbol:pthread_barrierattr_destroy>
 mov r0, #0 ' reg <- coni
' C_pthread_barrierattr_destroy_36 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export pthread_barrierattr_getpshared

 alignl ' align long
C_pthread_barrierattr_getpshared ' <symbol:pthread_barrierattr_getpshared>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_pthread_barrierattr_getpshared_40 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_pthread_barrierattr_getpshared_38  ' NEU4
C_pthread_barrierattr_getpshared_40
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_barrierattr_getpshared_37 ' JUMPV addrg
C_pthread_barrierattr_getpshared_38
 mov r22, #0 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_barrierattr_getpshared_37
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export pthread_barrierattr_setpshared

 alignl ' align long
C_pthread_barrierattr_setpshared ' <symbol:pthread_barrierattr_setpshared>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_barrierattr_setpshared_44 ' EQU4
 rdlong r22, r2 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_pthread_barrierattr_setpshared_42 ' EQI4
 cmps r22,  #1 wz
 if_z jmp #\C_pthread_barrierattr_setpshared_42 ' EQI4
C_pthread_barrierattr_setpshared_44
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_barrierattr_setpshared_41 ' JUMPV addrg
C_pthread_barrierattr_setpshared_42
 mov r0, #0 ' reg <- coni
C_pthread_barrierattr_setpshared_41
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import _Pthread_Pool

' Catalina Import _pthread_init_lock_pool

' Catalina Import errno

' Catalina Import _thread_allow

' Catalina Import _thread_stall

' Catalina Import _thread_lockset

' Catalina Import _thread_lockclr

' Catalina Import _thread_lockret

' Catalina Import _thread_locknew

' Catalina Import _thread_yield
' end
