' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export pthread_rwlock_timedwrlock

 alignl ' align long
C_pthread_rwlock_timedwrlock ' <symbol:pthread_rwlock_timedwrlock>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, ##0 ' reg <- con
 mov r19, #0 ' reg <- coni
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_rwlock_timedwrlock_5  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_rwlock_timedwrlock_4 ' JUMPV addrg
C_pthread_rwlock_timedwrlock_5
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 jmp #\@C_pthread_rwlock_timedwrlock_8 ' JUMPV addrg
C_pthread_rwlock_timedwrlock_10
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
 if_b jmp #\C_pthread_rwlock_timedwrlock_13 ' LTI4
 mov r19, #1 ' reg <- coni
 jmp #\@C_pthread_rwlock_timedwrlock_12 ' JUMPV addrg
C_pthread_rwlock_timedwrlock_13
 mov r2, #10 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_msleep ' CALL addrg
C_pthread_rwlock_timedwrlock_11
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_pthread_rwlock_timedwrlock_10 ' EQI4
C_pthread_rwlock_timedwrlock_12
 cmps r19,  #0 wz
 if_z jmp #\C_pthread_rwlock_timedwrlock_15 ' EQI4
 mov r22, #60 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_rwlock_timedwrlock_4 ' JUMPV addrg
C_pthread_rwlock_timedwrlock_15
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 if_nz jmp #\C_pthread_rwlock_timedwrlock_17 ' NEI4
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 if_nz jmp #\C_pthread_rwlock_timedwrlock_17 ' NEI4
 mov r2, #12 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_malloc ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_rwlock_timedwrlock_19  ' NEU4
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov r22, #11 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_rwlock_timedwrlock_4 ' JUMPV addrg
C_pthread_rwlock_timedwrlock_19
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_self ' CALL addrg
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_pthread_rwlock_timedwrlock_4 ' JUMPV addrg
C_pthread_rwlock_timedwrlock_17
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
C_pthread_rwlock_timedwrlock_8
 jmp #\@C_pthread_rwlock_timedwrlock_11 ' JUMPV addrg
 mov r0, #0 ' reg <- coni
C_pthread_rwlock_timedwrlock_4
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Import _pthread_init_lock_pool

' Catalina Import _Pthread_Pool

' Catalina Import malloc

' Catalina Import pthread_msleep

' Catalina Import pthread_self

' Catalina Import clock_compare

' Catalina Import clock_gettime

' Catalina Import errno

' Catalina Import _thread_lockset

' Catalina Import _thread_lockclr
' end
