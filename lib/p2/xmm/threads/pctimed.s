' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_pthread_cond_timedwait_3_L000004 ' <symbol:3>
 long 0
 long $0
 long $0

' Catalina Export pthread_cond_timedwait

' Catalina Code

DAT ' code segment

 alignl ' align long
C_pthread_cond_timedwait ' <symbol:pthread_cond_timedwait>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r0, FP
 sub r0, #-(-24) ' reg <- addrli
 jmp #LODL
 long @C_pthread_cond_timedwait_3_L000004
 mov r1, RI ' reg <- addrg
 jmp #CPYB
 long 12 ' ASGNB
 mov r22, #0 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_cond_timedwait_7 ' EQU4
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_cond_timedwait_5 ' NEU4
C_pthread_cond_timedwait_7
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_cond_timedwait_2 ' JUMPV addrg
C_pthread_cond_timedwait_5
 mov r2, r21
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #JMPA
 long @C_pthread_cond_timedwait_10 ' JUMPV addrg
C_pthread_cond_timedwait_9
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov RI, r23
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_clock_gettime
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_clock_compare
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BR_B
 long @C_pthread_cond_timedwait_12 ' LTI4
 jmp #JMPA
 long @C_pthread_cond_timedwait_11 ' JUMPV addrg
C_pthread_cond_timedwait_12
 mov r2, #10 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_msleep ' CALL addrg
C_pthread_cond_timedwait_10
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_cond_timedwait_9 ' EQI4
C_pthread_cond_timedwait_11
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_cond_timedwait_14 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_pthread_cond_timedwait_2 ' JUMPV addrg
C_pthread_cond_timedwait_14
 mov r22, #60 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
C_pthread_cond_timedwait_2
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


' Catalina Export pthread_condattr_setclock

 alignl ' align long
C_pthread_condattr_setclock ' <symbol:pthread_condattr_setclock>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_condattr_setclock_17 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_condattr_setclock_16 ' JUMPV addrg
C_pthread_condattr_setclock_17
 mov RI, r3
 mov BC, r2
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_condattr_setclock_16
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_condattr_getclock

 alignl ' align long
C_pthread_condattr_getclock ' <symbol:pthread_condattr_getclock>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_condattr_getclock_20 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_condattr_getclock_19 ' JUMPV addrg
C_pthread_condattr_getclock_20
 mov RI, r3
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_condattr_getclock_19
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _pthread_init_lock_pool

' Catalina Import pthread_msleep

' Catalina Import pthread_mutex_unlock

' Catalina Import pthread_mutex_lock

' Catalina Import clock_compare

' Catalina Import clock_gettime

' Catalina Import errno
' end
