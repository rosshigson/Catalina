' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sr64_6880505d_K_ernel_lock_L000004 ' <symbol:Kernel_lock>
 long -1

 alignl ' align long
C_sr641_6880505d_P_thread_L_ock_L000005 ' <symbol:Pthread_Lock>
 long -1

 alignl ' align long
C_sr642_6880505d_P_rintf_L_ock_L000006 ' <symbol:Printf_Lock>
 long -1

 alignl ' align long
C_sr643_6880505d_O_nce_L_ock_L000007 ' <symbol:Once_Lock>
 long -1

 alignl ' align long
C_sr644_6880505d_concurrency_L000008 ' <symbol:concurrency>
 long 0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sr645_6880505d__ensure_lock_L000009 ' <symbol:_ensure_lock>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_a jmp #\C_sr645_6880505d__ensure_lock_L000009_11 ' GTI4
 mov r2, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__thread_locknew ' CALL addrg
 wrlong r0, r23 ' ASGNI4 reg reg
C_sr645_6880505d__ensure_lock_L000009_11
' C_sr645_6880505d__ensure_lock_L000009_10 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export _pthread_init_lock_pool

 alignl ' align long
C__pthread_init_lock_pool ' <symbol:_pthread_init_lock_pool>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_sr64_6880505d_K_ernel_lock_L000004
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C__pthread_init_lock_pool_14 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__locknew ' CALL addrg
 wrlong r0, ##@C_sr64_6880505d_K_ernel_lock_L000004 ' ASGNI4 addrg reg
 mov r2, ##@C_sr64_6880505d_K_ernel_lock_L000004
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__thread_set_lock ' CALL addrg
C__pthread_init_lock_pool_14
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 mov r22, ##@C_sr641_6880505d_P_thread_L_ock_L000005
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C__pthread_init_lock_pool_16 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__locknew ' CALL addrg
 wrlong r0, ##@C_sr641_6880505d_P_thread_L_ock_L000005 ' ASGNI4 addrg reg
 mov r2, ##@C_sr641_6880505d_P_thread_L_ock_L000005
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##1002 ' reg ARG con
 mov r4, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_init_lock_pool
 add SP, #8 ' CALL addrg
C__pthread_init_lock_pool_16
 mov r2, ##@C_sr642_6880505d_P_rintf_L_ock_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sr645_6880505d__ensure_lock_L000009 ' CALL addrg
 mov r2, ##@C_sr643_6880505d_O_nce_L_ock_L000007 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sr645_6880505d__ensure_lock_L000009 ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C__pthread_init_lock_pool_18 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sr645_6880505d__ensure_lock_L000009 ' CALL addrg
C__pthread_init_lock_pool_18
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
' C__pthread_init_lock_pool_13 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_yield

 alignl ' align long
C_pthread_yield ' <symbol:pthread_yield>
 calld PA,#NEWF
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
' C_pthread_yield_20 ' (symbol refcount = 0)
 calld PA,#RETF


' Catalina Export pthread_sleep

 alignl ' align long
C_pthread_sleep ' <symbol:pthread_sleep>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##1000 ' reg <- con
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__thread_wait ' CALL addrg
' C_pthread_sleep_21 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_msleep

 alignl ' align long
C_pthread_msleep ' <symbol:pthread_msleep>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__thread_wait ' CALL addrg
' C_pthread_msleep_22 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_usleep

 alignl ' align long
C_pthread_usleep ' <symbol:pthread_usleep>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##1000 ' reg <- con
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__thread_wait ' CALL addrg
' C_pthread_usleep_23 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_printf

 alignl ' align long
C_pthread_printf ' <symbol:pthread_printf>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r2, ##@C_sr642_6880505d_P_rintf_L_ock_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 jmp #\@C_pthread_printf_26 ' JUMPV addrg
C_pthread_printf_25
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
C_pthread_printf_26
 mov r2, ##@C_sr642_6880505d_P_rintf_L_ock_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_pthread_printf_25 ' EQI4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_vprintf
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, ##@C_sr642_6880505d_P_rintf_L_ock_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_pthread_printf_24 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export pthread_printf_ln

 alignl ' align long
C_pthread_printf_ln ' <symbol:pthread_printf_ln>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r2, ##@C_sr642_6880505d_P_rintf_L_ock_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 jmp #\@C_pthread_printf_ln_31 ' JUMPV addrg
C_pthread_printf_ln_30
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
C_pthread_printf_ln_31
 mov r2, ##@C_sr642_6880505d_P_rintf_L_ock_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_pthread_printf_ln_30 ' EQI4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_vprintf
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, ##@C_pthread_printf_ln_34_L000035 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_t_printf ' CALL addrg
 mov r2, ##@C_sr642_6880505d_P_rintf_L_ock_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_pthread_printf_ln_29 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export pthread_lock_check

 alignl ' align long
C_pthread_lock_check ' <symbol:pthread_lock_check>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_get_lock ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_pthread_lock_check_37_L000038 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
 mov r22, ##@C_sr641_6880505d_P_thread_L_ock_L000005
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_ae jmp #\C_pthread_lock_check_39 ' GEI4
 mov r2, ##@C_pthread_lock_check_41_L000042 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_t_printf ' CALL addrg
 jmp #\@C_pthread_lock_check_40 ' JUMPV addrg
C_pthread_lock_check_39
 mov r2, ##@C_sr641_6880505d_P_thread_L_ock_L000005
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##@C_pthread_lock_check_43_L000044 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
 mov r22, ##@C_sr642_6880505d_P_rintf_L_ock_L000006
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_ae jmp #\C_pthread_lock_check_45 ' GEI4
 mov r2, ##@C_pthread_lock_check_47_L000048 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_t_printf ' CALL addrg
 jmp #\@C_pthread_lock_check_46 ' JUMPV addrg
C_pthread_lock_check_45
 mov r2, ##@C_sr642_6880505d_P_rintf_L_ock_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##@C_pthread_lock_check_49_L000050 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
 mov r2, ##@C_sr642_6880505d_P_rintf_L_ock_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_pthread_lock_check_51 ' NEI4
 mov r2, ##@C_pthread_lock_check_53_L000054 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_t_printf ' CALL addrg
C_pthread_lock_check_51
 mov r2, ##@C_sr642_6880505d_P_rintf_L_ock_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
C_pthread_lock_check_46
C_pthread_lock_check_40
' C_pthread_lock_check_36 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_self

 alignl ' align long
C_pthread_self ' <symbol:pthread_self>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_id ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__thread_extended ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_pthread_self_55 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_equal

 alignl ' align long
C_pthread_equal ' <symbol:pthread_equal>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_pthread_equal_58  ' NEU4
 mov r23, #1 ' reg <- coni
 jmp #\@C_pthread_equal_59 ' JUMPV addrg
C_pthread_equal_58
 mov r23, #0 ' reg <- coni
C_pthread_equal_59
 mov r0, r23 ' CVI, CVU or LOAD
' C_pthread_equal_56 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sr64d_6880505d_dummy_function_L000060 ' <symbol:dummy_function>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_id ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 rdlong r2, r21 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_set_extended
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r22
 calld PA,#CALI ' CALL indirect
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_self ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sr64d_6880505d_dummy_function_L000060_62 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_exit ' CALL addrg
C_sr64d_6880505d_dummy_function_L000060_62
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_sr64d_6880505d_dummy_function_L000060_61 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export pthread_create

 alignl ' align long
C_pthread_create ' <symbol:pthread_create>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 mov r2, #44 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_malloc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_create_65 ' EQU4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_create_67  ' NEU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_attr_init ' CALL addrg
 jmp #\@C_pthread_create_68 ' JUMPV addrg
C_pthread_create_67
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_attr_copy
 add SP, #4 ' CALL addrg
C_pthread_create_68
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #20 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_create_69  ' NEU4
 mov r22, r15
 adds r22, #40 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r15
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r2, r22 ' ADDU
 add r2, r20 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_malloc ' CALL addrg
 mov r20, r15
 adds r20, #4 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 jmp #\@C_pthread_create_70 ' JUMPV addrg
C_pthread_create_69
 mov r22, r15
 adds r22, #40 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_pthread_create_70
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_create_71 ' EQU4
 mov r2, r15
 adds r2, #16 ' ADDP4 coni
 mov r22, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r15
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov r5, ##@C_sr64d_6880505d_dummy_function_L000060 ' reg ARG ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_start
 add SP, #12 ' CALL addrg
 wrlong r0, r15 ' ASGNP4 reg reg
 wrlong r15, r23 ' ASGNP4 reg reg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_create_73  ' NEU4
 mov r22, #11 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_create_64 ' JUMPV addrg
C_pthread_create_73
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r20, r15
 adds r20, #24 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_ticks
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_pthread_create_64 ' JUMPV addrg
C_pthread_create_71
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
C_pthread_create_65
 mov r22, #11 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
C_pthread_create_64
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sr64e_6880505d_foreman_L000075 ' <symbol:foreman>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##@C_sr64_6880505d_K_ernel_lock_L000004
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__thread_set_lock ' CALL addrg
 jmp #\@C_sr64e_6880505d_foreman_L000075_78 ' JUMPV addrg
C_sr64e_6880505d_foreman_L000075_77
 mov r2, #100 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__thread_wait ' CALL addrg
C_sr64e_6880505d_foreman_L000075_78
 jmp #\@C_sr64e_6880505d_foreman_L000075_77 ' JUMPV addrg
 mov r0, #0 ' reg <- coni
' C_sr64e_6880505d_foreman_L000075_76 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_createaffinity

 alignl ' align long
C_pthread_createaffinity ' <symbol:pthread_createaffinity>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_pthread_createaffinity_83 ' EQU4
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_pthread_createaffinity_81  ' NEU4
C_pthread_createaffinity_83
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_createaffinity_80 ' JUMPV addrg
C_pthread_createaffinity_81
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r21 ' ADDI/P
 adds r4, r23 ' ADDI/P (3)
 mov r5, ##@C_sr64e_6880505d_foreman_L000075 ' reg ARG ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_cog
 add SP, #12 ' CALL addrg
 wrlong r0, r19 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_b jmp #\C_pthread_createaffinity_84 ' LTI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_pthread_createaffinity_80 ' JUMPV addrg
C_pthread_createaffinity_84
 mov r22, #11 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
C_pthread_createaffinity_80
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_setaffinity

 alignl ' align long
C_pthread_setaffinity ' <symbol:pthread_setaffinity>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r21 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_setaffinity_90 ' EQU4
 cmps r21,  #0 wcz
 if_b jmp #\C_pthread_setaffinity_90 ' LTI4
 cmps r21,  #16 wcz
 if_b jmp #\C_pthread_setaffinity_87 ' LTI4
C_pthread_setaffinity_90
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_setaffinity_86 ' JUMPV addrg
C_pthread_setaffinity_87
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wz
 if_z jmp #\C_pthread_setaffinity_91 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_affinity_change
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_pthread_setaffinity_93 ' EQI4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_pthread_setaffinity_86 ' JUMPV addrg
C_pthread_setaffinity_93
 mov r22, #11 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_setaffinity_86 ' JUMPV addrg
C_pthread_setaffinity_91
 mov r0, #0 ' reg <- coni
C_pthread_setaffinity_86
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_getaffinity

 alignl ' align long
C_pthread_getaffinity ' <symbol:pthread_getaffinity>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_pthread_getaffinity_98 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_pthread_getaffinity_96  ' NEU4
C_pthread_getaffinity_98
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_getaffinity_95 ' JUMPV addrg
C_pthread_getaffinity_96
 mov r22, r3
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_getaffinity_95
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export pthread_once

 alignl ' align long
C_pthread_once ' <symbol:pthread_once>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##@C_sr643_6880505d_O_nce_L_ock_L000007 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r2, ##@C_sr643_6880505d_O_nce_L_ock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_once_100  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_once_99 ' JUMPV addrg
C_pthread_once_100
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_pthread_once_102 ' NEI4
 mov r22, #1 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 mov RI, r21
 calld PA,#CALI ' CALL indirect
C_pthread_once_102
 mov r2, ##@C_sr643_6880505d_O_nce_L_ock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##@C__P_thread_P_ool ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_pthread_once_99
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_detach

 alignl ' align long
C_pthread_detach ' <symbol:pthread_detach>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_detach_105  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_detach_104 ' JUMPV addrg
C_pthread_detach_105
 mov r22, r2
 adds r22, #32 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_detach_104
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export pthread_setconcurrency

 alignl ' align long
C_pthread_setconcurrency ' <symbol:pthread_setconcurrency>
 wrlong r2, ##@C_sr644_6880505d_concurrency_L000008 ' ASGNI4 addrg reg
 mov r0, #0 ' reg <- coni
' C_pthread_setconcurrency_107 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export pthread_getconcurrency

 alignl ' align long
C_pthread_getconcurrency ' <symbol:pthread_getconcurrency>
 mov r0, ##@C_sr644_6880505d_concurrency_L000008
 rdlong r0, r0 ' reg <- INDIRI4 addrg
' C_pthread_getconcurrency_108 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export pthread_getcpuclockid

 alignl ' align long
C_pthread_getcpuclockid ' <symbol:pthread_getcpuclockid>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_pthread_getcpuclockid_112 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_pthread_getcpuclockid_110  ' NEU4
C_pthread_getcpuclockid_112
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_getcpuclockid_109 ' JUMPV addrg
C_pthread_getcpuclockid_110
 mov r22, #2 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
C_pthread_getcpuclockid_109
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import pthread_attr_copy

' Catalina Import _thread_stall

' Catalina Import _locknew

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export _Pthread_Pool

 alignl ' align long
C__P_thread_P_ool ' <symbol:_Pthread_Pool>
 byte 0[1007]

' Catalina Code

DAT ' code segment

' Catalina Import _thread_cog

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _cogid

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import t_vprintf

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import t_printf

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import malloc

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import free

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_attr_init

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_exit

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import errno

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_allow

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_wait

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_lockset

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_lockclr

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_locknew

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_init_lock_pool

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_yield

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_start

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_affinity_change

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_set_extended

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_extended

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_ticks

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_set_lock

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_get_lock

' Catalina Data

DAT ' uninitialized data segment

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_pthread_lock_check_53_L000054 ' <symbol:53>
 byte 80
 byte 82
 byte 73
 byte 78
 byte 84
 byte 70
 byte 32
 byte 76
 byte 79
 byte 67
 byte 75
 byte 32
 byte 70
 byte 65
 byte 73
 byte 76
 byte 69
 byte 68
 byte 33
 byte 10
 byte 0

 alignl ' align long
C_pthread_lock_check_49_L000050 ' <symbol:49>
 byte 80
 byte 82
 byte 73
 byte 78
 byte 84
 byte 70
 byte 32
 byte 76
 byte 79
 byte 67
 byte 75
 byte 32
 byte 105
 byte 115
 byte 32
 byte 37
 byte 100
 byte 10
 byte 0

 alignl ' align long
C_pthread_lock_check_47_L000048 ' <symbol:47>
 byte 78
 byte 79
 byte 32
 byte 80
 byte 82
 byte 73
 byte 78
 byte 84
 byte 70
 byte 32
 byte 76
 byte 79
 byte 67
 byte 75
 byte 33
 byte 10
 byte 0

 alignl ' align long
C_pthread_lock_check_43_L000044 ' <symbol:43>
 byte 80
 byte 84
 byte 72
 byte 82
 byte 69
 byte 65
 byte 68
 byte 32
 byte 76
 byte 79
 byte 67
 byte 75
 byte 32
 byte 105
 byte 115
 byte 32
 byte 37
 byte 100
 byte 10
 byte 0

 alignl ' align long
C_pthread_lock_check_41_L000042 ' <symbol:41>
 byte 78
 byte 79
 byte 32
 byte 80
 byte 84
 byte 72
 byte 82
 byte 69
 byte 65
 byte 68
 byte 32
 byte 76
 byte 79
 byte 67
 byte 75
 byte 33
 byte 10
 byte 0

 alignl ' align long
C_pthread_lock_check_37_L000038 ' <symbol:37>
 byte 75
 byte 69
 byte 82
 byte 78
 byte 69
 byte 76
 byte 32
 byte 76
 byte 79
 byte 67
 byte 75
 byte 32
 byte 105
 byte 115
 byte 32
 byte 37
 byte 100
 byte 10
 byte 0

 alignl ' align long
C_pthread_printf_ln_34_L000035 ' <symbol:34>
 byte 10
 byte 0

' Catalina Code

DAT ' code segment
' end
