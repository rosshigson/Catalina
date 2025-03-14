' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export mutex_sched

 alignl ' align long
C_mutex_sched ' <symbol:mutex_sched>
 long 0
 long $0
 long $0
 long 0

' Catalina Export mutex_lp_count

 alignl ' align long
C_mutex_lp_count ' <symbol:mutex_lp_count>
 long 0
 long $0
 long $0
 long 0

' Catalina Export cond_wakeup_worker

 alignl ' align long
C_cond_wakeup_worker ' <symbol:cond_wakeup_worker>
 long 0
 long $0

' Catalina Export cond_no_active_lp

 alignl ' align long
C_cond_no_active_lp ' <symbol:cond_no_active_lp>
 long 0
 long $0

 alignl ' align long
C_sho0_67d10db4_workerls_L000005 ' <symbol:workerls>
 long $0

' Catalina Export lpcount

 alignl ' align long
C_lpcount ' <symbol:lpcount>
 long 0

' Catalina Export workerscount

 alignl ' align long
C_workerscount ' <symbol:workerscount>
 long 0

' Catalina Export destroyworkers

 alignl ' align long
C_destroyworkers ' <symbol:destroyworkers>
 long 0

' Catalina Export factories

 alignl ' align long
C_factories ' <symbol:factories>
 long 1

' Catalina Export next_factory

 alignl ' align long
C_next_factory ' <symbol:next_factory>
 long 1

' Catalina Export workermain

' Catalina Code

DAT ' code segment

 alignl ' align long
C_workermain ' <symbol:workermain>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_self ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long @C_workermain_8_L000009
 mov r2, RI ' reg ARG ADDRG
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlightuserdata
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawset
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #JMPA
 long @C_workermain_11 ' JUMPV addrg
C_workermain_10
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #JMPA
 long @C_workermain_14 ' JUMPV addrg
C_workermain_13
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_cond_wakeup_worker
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
C_workermain_14
 jmp #LODL
 long @C_ready_lp_list
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_count ' CALL addrg
 mov r20, #0 ' reg <- coni
 cmps r0, r20 wz
 jmp #BRNZ
 long @C_workermain_16 ' NEI4
 jmp #LODI
 long @C_destroyworkers
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C_workermain_13 ' LEI4
C_workermain_16
 jmp #LODI
 long @C_destroyworkers
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_workermain_17 ' LEI4
 jmp #LODL
 long @C_destroyworkers
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODL
 long @C_destroyworkers
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_workerscount
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODL
 long @C_workerscount
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_workermain_8_L000009
 mov r2, RI ' reg ARG ADDRG
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlightuserdata
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawset
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_cond_wakeup_worker
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_signal ' CALL addrg
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_exit ' CALL addrg
C_workermain_17
 jmp #LODL
 long @C_ready_lp_list
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_remove ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_get_state ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_get_numargs ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r20 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 mov r5, r22 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_resume
 add SP, #12 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luathread_set_numargs
 add SP, #4 ' CALL addrg
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_workermain_19 ' NEI4
 mov r2, #4 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luathread_set_status
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_recycle_insert ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sho01_67d10db4_sched_dec_lpcount_L000006 ' CALL addrg
 jmp #JMPA
 long @C_workermain_20 ' JUMPV addrg
C_workermain_19
 cmps r19,  #1 wz
 jmp #BRNZ
 long @C_workermain_21 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_get_status ' CALL addrg
 cmps r0,  #2 wz
 jmp #BRNZ
 long @C_workermain_23 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_queue_sender ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_get_channel ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_unlock_channel ' CALL addrg
 jmp #JMPA
 long @C_workermain_22 ' JUMPV addrg
C_workermain_23
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_get_status ' CALL addrg
 cmps r0,  #3 wz
 jmp #BRNZ
 long @C_workermain_25 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_queue_receiver ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_get_channel ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_unlock_channel ' CALL addrg
 jmp #JMPA
 long @C_workermain_22 ' JUMPV addrg
C_workermain_25
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_ready_lp_list
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_list_insert
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #JMPA
 long @C_workermain_22 ' JUMPV addrg
C_workermain_21
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_get_state ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_workermain_27_L000028
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C___stderr
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_get_state ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_close ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sho01_67d10db4_sched_dec_lpcount_L000006 ' CALL addrg
C_workermain_22
C_workermain_20
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
C_workermain_11
 jmp #JMPA
 long @C_workermain_10 ' JUMPV addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
' C_workermain_7 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sho01_67d10db4_sched_dec_lpcount_L000006 ' <symbol:sched_dec_lpcount>
 jmp #NEWF
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODL
 long @C_mutex_lp_count
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long @C_lpcount
 mov r22, RI ' reg <- addrg
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 jmp #LODL
 long @C_lpcount
 wrlong r20, RI ' ASGNI4 addrg reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sho01_67d10db4_sched_dec_lpcount_L000006_30 ' NEI4
 jmp #LODL
 long @C_cond_no_active_lp
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_signal ' CALL addrg
C_sho01_67d10db4_sched_dec_lpcount_L000006_30
 jmp #LODL
 long @C_mutex_lp_count
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
' C_sho01_67d10db4_sched_dec_lpcount_L000006_29 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export sched_inc_lpcount

 alignl ' align long
C_sched_inc_lpcount ' <symbol:sched_inc_lpcount>
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODL
 long @C_mutex_lp_count
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long @C_lpcount
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODL
 long @C_lpcount
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_mutex_lp_count
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
' C_sched_inc_lpcount_32 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sched_init_34_L000035 ' <symbol:34>
 long 127

' Catalina Export sched_init

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sched_init ' <symbol:sched_init>
 jmp #NEWF
 sub SP, #52
 jmp #PSHM
 long $f00000 ' save registers
 mov r0, FP
 sub r0, #-(-56) ' reg <- addrli
 jmp #LODL
 long @C_sched_init_34_L000035
 mov r1, RI ' reg <- addrg
 jmp #CPYB
 long 4 ' ASGNB
 mov r2, FP
 sub r2, #-(-52) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_attr_init ' CALL addrg
 jmp #LODI
 long @C_stacksize
 mov r22, RI ' reg <- INDIRI4 addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_attr_setstacksize
 add SP, #4 ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_id ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #131 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__thread_ticks
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-56) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_attr_setschedparam
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 jmp #LODL
 long @C_factories
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_next_factory
 wrlong r22, RI ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 jmp #LODL
 long @C_factory
 wrlong r0, RI ' ASGNI4 addrg reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_factory+4
 wrlong r22, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_ready_lp_list
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_init ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_luaL__newstate ' CALL addrg
 jmp #LODL
 long @C_sho0_67d10db4_workerls_L000005
 wrlong r0, RI ' ASGNP4 addrg reg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_workermain_8_L000009
 mov r2, RI ' reg ARG ADDRG
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_sched_init_40 ' JUMPV addrg
C_sched_init_37
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long @C_workermain
 mov r3, RI ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-52) ' reg ARG ADDRLi
 mov r5, FP
 sub r5, #-(-8) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_create
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C_sched_init_41 ' EQI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sched_init_33 ' JUMPV addrg
C_sched_init_41
 jmp #LODI
 long @C_factories
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #1 wz,wc
 jmp #BRBE
 long @C_sched_init_43 ' LEI4
 jmp #LODI
 long @C_next_factory
 mov r22, RI ' reg <- INDIRI4 addrg
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_factory-8
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_setaffinity
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 jmp #LODL
 long @C_next_factory
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODI
 long @C_factories
 mov r20, RI ' reg <- INDIRI4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r1
 adds r22, #1 ' ADDI4 coni
 jmp #LODL
 long @C_next_factory
 wrlong r22, RI ' ASGNI4 addrg reg
C_sched_init_43
 jmp #LODL
 long @C_workerscount
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODL
 long @C_workerscount
 wrlong r22, RI ' ASGNI4 addrg reg
' C_sched_init_38 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_sched_init_40
 cmps r21,  #0 wz,wc
 jmp #BR_B
 long @C_sched_init_37 ' LTI4
 mov r2, FP
 sub r2, #-(-52) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_attr_destroy ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 mov r0, #0 ' RET coni
C_sched_init_33
 jmp #POPM ' restore registers
 add SP, #52 ' framesize
 jmp #RETF


' Catalina Export sched_set_numworkers

 alignl ' align long
C_sched_set_numworkers ' <symbol:sched_set_numworkers>
 jmp #NEWF
 sub SP, #48
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-48) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_attr_init ' CALL addrg
 jmp #LODI
 long @C_stacksize
 mov r22, RI ' reg <- INDIRI4 addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-48) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_attr_setstacksize
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODI
 long @C_workerscount
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r23, r22 wz,wc
 jmp #BRBE
 long @C_sched_set_numworkers_47 ' LEI4
 jmp #LODI
 long @C_workerscount
 mov r22, RI ' reg <- INDIRI4 addrg
 mov r17, r23 ' SUBI/P
 subs r17, r22 ' SUBI/P (3)
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sched_set_numworkers_52 ' JUMPV addrg
C_sched_set_numworkers_49
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long @C_workermain
 mov r3, RI ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-48) ' reg ARG ADDRLi
 mov r5, FP
 sub r5, #-(-52) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_create
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_sched_set_numworkers_53 ' EQI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sched_set_numworkers_46 ' JUMPV addrg
C_sched_set_numworkers_53
 jmp #LODI
 long @C_factories
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #1 wz,wc
 jmp #BRBE
 long @C_sched_set_numworkers_55 ' LEI4
 jmp #LODI
 long @C_next_factory
 mov r22, RI ' reg <- INDIRI4 addrg
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_factory-8
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-52)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_setaffinity
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 jmp #LODL
 long @C_next_factory
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODI
 long @C_factories
 mov r20, RI ' reg <- INDIRI4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r1
 adds r22, #1 ' ADDI4 coni
 jmp #LODL
 long @C_next_factory
 wrlong r22, RI ' ASGNI4 addrg reg
C_sched_set_numworkers_55
 jmp #LODL
 long @C_workerscount
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODL
 long @C_workerscount
 wrlong r22, RI ' ASGNI4 addrg reg
' C_sched_set_numworkers_50 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sched_set_numworkers_52
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_sched_set_numworkers_49 ' LTI4
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #JMPA
 long @C_sched_set_numworkers_48 ' JUMPV addrg
C_sched_set_numworkers_47
 jmp #LODI
 long @C_workerscount
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r23, r22 wz,wc
 jmp #BRAE
 long @C_sched_set_numworkers_58 ' GEI4
 jmp #LODI
 long @C_workerscount
 mov r22, RI ' reg <- INDIRI4 addrg
 subs r22, r23 ' SUBI/P (1)
 jmp #LODL
 long @C_destroyworkers
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_cond_wakeup_worker
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_signal ' CALL addrg
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #JMPA
 long @C_sched_set_numworkers_59 ' JUMPV addrg
C_sched_set_numworkers_58
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
C_sched_set_numworkers_59
C_sched_set_numworkers_48
 mov r2, FP
 sub r2, #-(-48) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_attr_destroy ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 mov r0, #0 ' RET coni
C_sched_set_numworkers_46
 jmp #POPM ' restore registers
 add SP, #48 ' framesize
 jmp #RETF


' Catalina Export sched_get_numworkers

 alignl ' align long
C_sched_get_numworkers ' <symbol:sched_get_numworkers>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODI
 long @C_workerscount
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_sched_get_numworkers_60 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export sched_set_numfactories

 alignl ' align long
C_sched_set_numfactories ' <symbol:sched_set_numfactories>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 cmps r23,  #1 wz,wc
 jmp #BR_B
 long @C_sched_set_numfactories_62 ' LTI4
 cmps r23,  #8 wz,wc
 jmp #BR_A
 long @C_sched_set_numfactories_62 ' GTI4
 jmp #LODI
 long @C_factories
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r23, r22 wz,wc
 jmp #BRBE
 long @C_sched_set_numfactories_64 ' LEI4
 jmp #LODI
 long @C_factories
 mov r21, RI ' reg <- INDIRI4 addrg
 jmp #JMPA
 long @C_sched_set_numfactories_69 ' JUMPV addrg
C_sched_set_numfactories_66
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_stall ' CALL addrg
 mov r2, #252 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_malloc ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_allow ' CALL addrg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sched_set_numfactories_70 ' EQU4
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #252 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_createaffinity
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sched_set_numfactories_72 ' NEI4
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_factory
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_factory+4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r19, r22 ' ASGNP4 reg reg
 jmp #LODL
 long @C_factories
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODL
 long @C_factories
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #JMPA
 long @C_sched_set_numfactories_73 ' JUMPV addrg
C_sched_set_numfactories_72
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_stall ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_free ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_allow ' CALL addrg
 jmp #JMPA
 long @C_sched_set_numfactories_65 ' JUMPV addrg
C_sched_set_numfactories_73
C_sched_set_numfactories_70
' C_sched_set_numfactories_67 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_sched_set_numfactories_69
 cmps r21, r23 wz,wc
 jmp #BR_B
 long @C_sched_set_numfactories_66 ' LTI4
 jmp #JMPA
 long @C_sched_set_numfactories_65 ' JUMPV addrg
C_sched_set_numfactories_64
 jmp #LODI
 long @C_factories
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22, r23 wz,wc
 jmp #BRBE
 long @C_sched_set_numfactories_75 ' LEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sched_get_numworkers ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sched_set_numworkers ' CALL addrg
 jmp #JMPA
 long @C_sched_set_numfactories_78 ' JUMPV addrg
C_sched_set_numfactories_77
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
C_sched_set_numfactories_78
 jmp #LODI
 long @C_workerscount
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_sched_set_numfactories_77 ' GTI4
 mov r21, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sched_set_numfactories_83 ' JUMPV addrg
C_sched_set_numfactories_80
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_factory
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__cogstop ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_stall ' CALL addrg
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_factory+4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_free ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_allow ' CALL addrg
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_factory
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_factory+4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
' C_sched_set_numfactories_81 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_sched_set_numfactories_83
 jmp #LODI
 long @C_factories
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r21, r22 wz,wc
 jmp #BR_B
 long @C_sched_set_numfactories_80 ' LTI4
 jmp #LODL
 long @C_factories
 wrlong r23, RI ' ASGNI4 addrg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sched_set_numworkers ' CALL addrg
C_sched_set_numfactories_75
C_sched_set_numfactories_65
C_sched_set_numfactories_62
 jmp #LODI
 long @C_factories
 mov r0, RI ' reg <- INDIRI4 addrg
' C_sched_set_numfactories_61 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export sched_get_numfactories

 alignl ' align long
C_sched_get_numfactories ' <symbol:sched_get_numfactories>
 jmp #LODI
 long @C_factories
 mov r0, RI ' reg <- INDIRI4 addrg
' C_sched_get_numfactories_86 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export sched_set_factory

 alignl ' align long
C_sched_set_factory ' <symbol:sched_set_factory>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sched_get_factory ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, r23
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_factory-8
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r23 wz
 jmp #BR_Z
 long @C_sched_set_factory_89 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_self ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sched_set_factory_91 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_id ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__thread_affinity_change
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNI4 addrl reg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sched_set_factory_93 ' EQI4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sched_set_factory_87 ' JUMPV addrg
C_sched_set_factory_93
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_sched_set_factory_87 ' JUMPV addrg
C_sched_set_factory_91
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_setaffinity
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNI4 addrl reg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sched_set_factory_95 ' NEI4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sched_set_factory_87 ' JUMPV addrg
C_sched_set_factory_95
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_sched_set_factory_87 ' JUMPV addrg
C_sched_set_factory_89
 mov r0, #1 ' RET coni
C_sched_set_factory_87
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export sched_get_factory

 alignl ' align long
C_sched_get_factory ' <symbol:sched_get_factory>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r23, #0 ' reg <- coni
 jmp #JMPA
 long @C_sched_get_factory_101 ' JUMPV addrg
C_sched_get_factory_98
 mov r22, r23
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long @C_factory
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r21 wz
 jmp #BRNZ
 long @C_sched_get_factory_102 ' NEI4
 mov r0, r23
 adds r0, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_sched_get_factory_97 ' JUMPV addrg
C_sched_get_factory_102
' C_sched_get_factory_99 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_sched_get_factory_101
 jmp #LODI
 long @C_factories
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r23, r22 wz,wc
 jmp #BR_B
 long @C_sched_get_factory_98 ' LTI4
 mov r0, #1 ' RET coni
C_sched_get_factory_97
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export sched_queue_proc

 alignl ' align long
C_sched_queue_proc ' <symbol:sched_queue_proc>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_ready_lp_list
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_list_insert
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luathread_set_status
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_cond_wakeup_worker
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_signal ' CALL addrg
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
' C_sched_queue_proc_104 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export sched_join_workers

 alignl ' align long
C_sched_join_workers ' <symbol:sched_join_workers>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_luaL__newstate ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sched_join_workers_106_L000107
 mov r21, RI ' reg <- addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sched_wait ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long @C_workermain_8_L000009
 mov r2, RI ' reg ARG ADDRG
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #JMPA
 long @C_sched_join_workers_109 ' JUMPV addrg
C_sched_join_workers_108
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlightuserdata
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawset
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_sched_join_workers_109
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_next
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sched_join_workers_108 ' NEI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C_workerscount
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODL
 long @C_destroyworkers
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_cond_wakeup_worker
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_signal ' CALL addrg
 jmp #LODL
 long @C_mutex_sched
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #JMPA
 long @C_sched_join_workers_112 ' JUMPV addrg
C_sched_join_workers_111
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_join
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_sched_join_workers_112
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_next
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sched_join_workers_111 ' NEI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C_sho0_67d10db4_workerls_L000005
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_close ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_close ' CALL addrg
' C_sched_join_workers_105 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export sched_wait

 alignl ' align long
C_sched_wait ' <symbol:sched_wait>
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODL
 long @C_mutex_lp_count
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODI
 long @C_lpcount
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sched_wait_115 ' EQI4
 jmp #LODL
 long @C_mutex_lp_count
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_cond_no_active_lp
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
C_sched_wait_115
 jmp #LODL
 long @C_mutex_lp_count
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
' C_sched_wait_114 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _thread_stall

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export factory

 alignl ' align long
C_factory ' <symbol:factory>
 byte 0[64]

' Catalina Code

DAT ' code segment

' Catalina Import stacksize

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export ready_lp_list

 alignl ' align long
C_ready_lp_list ' <symbol:ready_lp_list>
 byte 0[12]

' Catalina Code

DAT ' code segment

' Catalina Import _cogstop

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _cogid

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import list_count

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import list_remove

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import list_insert

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import list_init

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luathread_set_numargs

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luathread_get_numargs

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luathread_get_state

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luathread_set_status

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luathread_get_status

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luathread_recycle_insert

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luathread_queue_receiver

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luathread_queue_sender

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luathread_get_channel

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luathread_unlock_channel

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_newstate

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_checklstring

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_next

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_resume

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_rawset

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_setglobal

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_createtable

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_getglobal

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_pushlightuserdata

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_pushboolean

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_pushnil

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_touserdata

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_settop

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_close

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

' Catalina Import pthread_setaffinity

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_createaffinity

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_yield

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_cond_signal

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_cond_wait

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_mutex_unlock

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_mutex_lock

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_attr_setschedparam

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_attr_setstacksize

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_attr_destroy

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

' Catalina Import pthread_join

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_create

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_self

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_allow

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_affinity_change

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

' Catalina Import fprintf

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import __stderr

' Catalina Data

DAT ' uninitialized data segment

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sched_join_workers_106_L000107 ' <symbol:106>
 byte 119
 byte 111
 byte 114
 byte 107
 byte 101
 byte 114
 byte 115
 byte 116
 byte 98
 byte 99
 byte 111
 byte 112
 byte 121
 byte 0

 alignl ' align long
C_workermain_27_L000028 ' <symbol:27>
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 32
 byte 108
 byte 117
 byte 97
 byte 95
 byte 83
 byte 116
 byte 97
 byte 116
 byte 101
 byte 32
 byte 40
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 58
 byte 32
 byte 37
 byte 115
 byte 41
 byte 10
 byte 0

 alignl ' align long
C_workermain_8_L000009 ' <symbol:8>
 byte 119
 byte 111
 byte 114
 byte 107
 byte 101
 byte 114
 byte 116
 byte 98
 byte 0

' Catalina Code

DAT ' code segment
' end
