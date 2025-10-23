' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export pthread_mutex_timedlock

 alignl ' align long
C_pthread_mutex_timedlock ' <symbol:pthread_mutex_timedlock>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_mutex_timedlock_3  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_mutex_timedlock_2 ' JUMPV addrg
C_pthread_mutex_timedlock_3
 mov r2, r23
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_pthread_mutex_timedlock_5 ' NEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_mutex_timedlock_7 ' EQU4
 mov r22, #16 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_mutex_timedlock_2 ' JUMPV addrg
C_pthread_mutex_timedlock_7
C_pthread_mutex_timedlock_5
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_self ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #2 wz
 if_nz jmp #\C_pthread_mutex_timedlock_9 ' NEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_z jmp #\C_pthread_mutex_timedlock_11 ' EQU4
 jmp #\@C_pthread_mutex_timedlock_14 ' JUMPV addrg
C_pthread_mutex_timedlock_13
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_clock_gettime
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_clock_compare
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wcz
 if_b jmp #\C_pthread_mutex_timedlock_16 ' LTI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_pthread_mutex_timedlock_15 ' JUMPV addrg
C_pthread_mutex_timedlock_16
 mov r2, #10 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_msleep ' CALL addrg
C_pthread_mutex_timedlock_14
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_pthread_mutex_timedlock_13 ' EQI4
C_pthread_mutex_timedlock_15
 cmps r17,  #0 wz
 if_z jmp #\C_pthread_mutex_timedlock_18 ' EQI4
 mov r22, #60 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_mutex_timedlock_2 ' JUMPV addrg
C_pthread_mutex_timedlock_18
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_pthread_mutex_timedlock_2 ' JUMPV addrg
C_pthread_mutex_timedlock_11
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$7fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_ae jmp #\C_pthread_mutex_timedlock_20 ' GEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_pthread_mutex_timedlock_2 ' JUMPV addrg
C_pthread_mutex_timedlock_20
 mov r22, #11 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_mutex_timedlock_2 ' JUMPV addrg
C_pthread_mutex_timedlock_9
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_pthread_mutex_timedlock_25  ' NEU4
 mov r22, #35 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_mutex_timedlock_2 ' JUMPV addrg
C_pthread_mutex_timedlock_24
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_clock_gettime
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_clock_compare
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wcz
 if_b jmp #\C_pthread_mutex_timedlock_27 ' LTI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_pthread_mutex_timedlock_26 ' JUMPV addrg
C_pthread_mutex_timedlock_27
 mov r2, #10 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_msleep ' CALL addrg
C_pthread_mutex_timedlock_25
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_pthread_mutex_timedlock_24 ' EQI4
C_pthread_mutex_timedlock_26
 cmps r17,  #0 wz
 if_z jmp #\C_pthread_mutex_timedlock_29 ' EQI4
 mov r22, #60 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_mutex_timedlock_2 ' JUMPV addrg
C_pthread_mutex_timedlock_29
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_mutex_timedlock_2
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Import _Pthread_Pool

' Catalina Import _pthread_init_lock_pool

' Catalina Import pthread_msleep

' Catalina Import pthread_self

' Catalina Import clock_compare

' Catalina Import clock_gettime

' Catalina Import errno

' Catalina Import _thread_lockset
' end
