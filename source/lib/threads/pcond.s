' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_pthread_cond_wait_3_L000004 ' <symbol:3>
 long 0
 long $0
 long $0

' Catalina Export pthread_cond_wait

' Catalina Code

DAT ' code segment

 alignl ' align long
C_pthread_cond_wait ' <symbol:pthread_cond_wait>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r0, FP
 sub r0, #-(-16) ' reg <- addrli
 mov r1, ##@C_pthread_cond_wait_3_L000004 ' reg <- addrg
 calld PA,#CPYB
 long 12 ' ASGNB
 mov r22, #0 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_pthread_cond_wait_7 ' EQU4
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_pthread_cond_wait_5  ' NEU4
C_pthread_cond_wait_7
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_cond_wait_2 ' JUMPV addrg
C_pthread_cond_wait_5
 mov r2, r21
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #\@C_pthread_cond_wait_10 ' JUMPV addrg
C_pthread_cond_wait_9
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
C_pthread_cond_wait_10
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_pthread_cond_wait_9 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r0, #0 ' reg <- coni
C_pthread_cond_wait_2
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export pthread_cond_signal

 alignl ' align long
C_pthread_cond_signal ' <symbol:pthread_cond_signal>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_cond_signal_13  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_cond_signal_12 ' JUMPV addrg
C_pthread_cond_signal_13
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_cond_signal_15 ' EQU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, #1 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
C_pthread_cond_signal_15
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
 mov r0, #0 ' reg <- coni
C_pthread_cond_signal_12
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_cond_broadcast

 alignl ' align long
C_pthread_cond_broadcast ' <symbol:pthread_cond_broadcast>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_cond_broadcast_18  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_cond_broadcast_17 ' JUMPV addrg
C_pthread_cond_broadcast_18
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 jmp #\@C_pthread_cond_broadcast_21 ' JUMPV addrg
C_pthread_cond_broadcast_20
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, #1 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
C_pthread_cond_broadcast_21
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_cond_broadcast_20  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
 mov r0, #0 ' reg <- coni
C_pthread_cond_broadcast_17
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _thread_stall

' Catalina Import _pthread_init_lock_pool

' Catalina Import pthread_mutex_unlock

' Catalina Import pthread_mutex_lock

' Catalina Import errno

' Catalina Import _thread_allow

' Catalina Import _thread_yield
' end
