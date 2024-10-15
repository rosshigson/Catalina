' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export pthread_rwlock_rdlock

 alignl ' align long
C_pthread_rwlock_rdlock ' <symbol:pthread_rwlock_rdlock>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, ##0 ' reg <- con
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_rwlock_rdlock_5  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_rwlock_rdlock_4 ' JUMPV addrg
C_pthread_rwlock_rdlock_5
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r2, #12 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_malloc ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_rwlock_rdlock_7  ' NEU4
 mov r22, #11 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_rwlock_rdlock_4 ' JUMPV addrg
C_pthread_rwlock_rdlock_7
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_self ' CALL addrg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 jmp #\@C_pthread_rwlock_rdlock_10 ' JUMPV addrg
C_pthread_rwlock_rdlock_9
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_pthread_rwlock_rdlock_12 ' NEI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_rwlock_rdlock_12  ' NEU4
 jmp #\@C_pthread_rwlock_rdlock_11 ' JUMPV addrg
C_pthread_rwlock_rdlock_12
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
C_pthread_rwlock_rdlock_10
 jmp #\@C_pthread_rwlock_rdlock_9 ' JUMPV addrg
C_pthread_rwlock_rdlock_11
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
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
C_pthread_rwlock_rdlock_4
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_rwlock_wrlock

 alignl ' align long
C_pthread_rwlock_wrlock ' <symbol:pthread_rwlock_wrlock>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, ##0 ' reg <- con
 mov r19, ##0 ' reg <- con
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_rwlock_wrlock_15  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_rwlock_wrlock_14 ' JUMPV addrg
C_pthread_rwlock_wrlock_15
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r2, #12 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_malloc ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_rwlock_wrlock_17  ' NEU4
 mov r22, #11 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_rwlock_wrlock_14 ' JUMPV addrg
C_pthread_rwlock_wrlock_17
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_self ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 jmp #\@C_pthread_rwlock_wrlock_20 ' JUMPV addrg
C_pthread_rwlock_wrlock_19
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 if_nz jmp #\C_pthread_rwlock_wrlock_22 ' NEI4
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 if_nz jmp #\C_pthread_rwlock_wrlock_22 ' NEI4
 jmp #\@C_pthread_rwlock_wrlock_21 ' JUMPV addrg
C_pthread_rwlock_wrlock_22
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_sleep ' CALL addrg
C_pthread_rwlock_wrlock_20
 jmp #\@C_pthread_rwlock_wrlock_19 ' JUMPV addrg
C_pthread_rwlock_wrlock_21
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
C_pthread_rwlock_wrlock_14
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_rwlock_unlock

 alignl ' align long
C_pthread_rwlock_unlock ' <symbol:pthread_rwlock_unlock>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_rwlock_unlock_27 ' EQU4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_a jmp #\C_pthread_rwlock_unlock_25 ' GTI4
C_pthread_rwlock_unlock_27
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_rwlock_unlock_24 ' JUMPV addrg
C_pthread_rwlock_unlock_25
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_self ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 mov r21, ##0 ' reg <- con
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 jmp #\@C_pthread_rwlock_unlock_29 ' JUMPV addrg
C_pthread_rwlock_unlock_28
 mov r21, r19 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
C_pthread_rwlock_unlock_29
 mov r22, #0 ' reg <- coni
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_pthread_rwlock_unlock_32 ' EQU4
 mov r20, r19
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_z jmp #\C_pthread_rwlock_unlock_32 ' EQU4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_pthread_rwlock_unlock_28  ' NEU4
C_pthread_rwlock_unlock_32
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_rwlock_unlock_33 ' EQU4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_pthread_rwlock_unlock_33  ' NEU4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_rwlock_unlock_35  ' NEU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, r19
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_pthread_rwlock_unlock_36 ' JUMPV addrg
C_pthread_rwlock_unlock_35
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, r19
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_pthread_rwlock_unlock_36
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_pthread_rwlock_unlock_24 ' JUMPV addrg
C_pthread_rwlock_unlock_33
 mov r21, ##0 ' reg <- con
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 jmp #\@C_pthread_rwlock_unlock_38 ' JUMPV addrg
C_pthread_rwlock_unlock_37
 mov r21, r19 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
C_pthread_rwlock_unlock_38
 mov r22, #0 ' reg <- coni
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_pthread_rwlock_unlock_41 ' EQU4
 mov r20, r19
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_z jmp #\C_pthread_rwlock_unlock_41 ' EQU4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_pthread_rwlock_unlock_37  ' NEU4
C_pthread_rwlock_unlock_41
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_rwlock_unlock_42 ' EQU4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_pthread_rwlock_unlock_42  ' NEU4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_rwlock_unlock_44  ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r19
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_pthread_rwlock_unlock_45 ' JUMPV addrg
C_pthread_rwlock_unlock_44
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, r19
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_pthread_rwlock_unlock_45
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_pthread_rwlock_unlock_24 ' JUMPV addrg
C_pthread_rwlock_unlock_42
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
C_pthread_rwlock_unlock_24
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _pthread_init_lock_pool

' Catalina Import _Pthread_Pool

' Catalina Import malloc

' Catalina Import free

' Catalina Import pthread_sleep

' Catalina Import pthread_self

' Catalina Import errno

' Catalina Import _thread_lockset

' Catalina Import _thread_lockclr

' Catalina Import _thread_yield
' end
