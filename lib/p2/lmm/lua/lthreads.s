' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s1ts_696ddd97_mutex_channel_list_L000005 ' <symbol:mutex_channel_list>
 long 0
 long $0
 long $0
 long 0

 alignl ' align long
C_s1ts1_696ddd97_mutex_recycle_list_L000006 ' <symbol:mutex_recycle_list>
 long 0
 long $0
 long $0
 long 0

 alignl ' align long
C_s1ts3_696ddd97_recyclemax_L000008 ' <symbol:recyclemax>
 long 0

' Catalina Export stacksize

 alignl ' align long
C_stacksize ' <symbol:stacksize>
 long 4000

 alignl ' align long
C_s1ts4_696ddd97_chanls_L000009 ' <symbol:chanls>
 long $0

' Catalina Export cond_mainls_sendrecv

 alignl ' align long
C_cond_mainls_sendrecv ' <symbol:cond_mainls_sendrecv>
 long 0
 long $0

 alignl ' align long
C_s1ts6_696ddd97_mutex_mainls_L000011 ' <symbol:mutex_mainls>
 long 0
 long $0
 long $0
 long 0

 alignl ' align long
C_s1ts7_696ddd97_mutex_memopt_L000012 ' <symbol:mutex_memopt>
 long 0
 long $0
 long $0
 long 0

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s1ts19_696ddd97_luathread_funcs_L000046 ' <symbol:luathread_funcs>
 long @C_s1ts1a_696ddd97_47_L000048
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014
 long @C_s1ts1b_696ddd97_49_L000050
 long @C_s1tsa_696ddd97_threads_wait_L000015
 long @C_s1ts1c_696ddd97_51_L000052
 long @C_s1tsb_696ddd97_threads_send_L000016
 long @C_s1ts1d_696ddd97_53_L000054
 long @C_s1tsc_696ddd97_threads_receive_L000017
 long @C_s1ts1e_696ddd97_55_L000056
 long @C_s1tsd_696ddd97_threads_create_channel_L000018
 long @C_s1ts1f_696ddd97_57_L000058
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019
 long @C_s1ts1g_696ddd97_59_L000060
 long @C_s1tsf_696ddd97_threads_set_numworkers_L000020
 long @C_s1ts1h_696ddd97_61_L000062
 long @C_s1tsg_696ddd97_threads_get_numworkers_L000021
 long @C_s1ts1i_696ddd97_63_L000064
 long @C_s1tsh_696ddd97_threads_recycle_set_L000022
 long @C_s1ts1j_696ddd97_65_L000066
 long @C_s1tso_696ddd97_threads_lock_L000029
 long @C_s1ts1k_696ddd97_67_L000068
 long @C_s1tsq_696ddd97_threads_trylock_L000031
 long @C_s1ts1l_696ddd97_69_L000070
 long @C_s1tsp_696ddd97_threads_unlock_L000030
 long @C_s1ts1m_696ddd97_71_L000072
 long @C_s1tsr_696ddd97_threads_wait_for_L000032
 long @C_s1ts1n_696ddd97_73_L000074
 long @C_s1tss_696ddd97_threads_signal_L000033
 long @C_s1ts1o_696ddd97_75_L000076
 long @C_s1tst_696ddd97_threads_broadcast_L000034
 long @C_s1ts1p_696ddd97_77_L000078
 long @C_s1tsu_696ddd97_threads_rendezvous_L000035
 long @C_s1ts1q_696ddd97_79_L000080
 long @C_s1tsv_696ddd97_threads_shared_L000036
 long @C_s1ts1r_696ddd97_81_L000082
 long @C_s1ts10_696ddd97_threads_update_L000037
 long @C_s1ts1s_696ddd97_83_L000084
 long @C_s1ts11_696ddd97_threads_export_L000038
 long @C_s1ts1t_696ddd97_85_L000086
 long @C_s1tsi_696ddd97_threads_send_async_L000023
 long @C_s1ts1u_696ddd97_87_L000088
 long @C_s1tsj_696ddd97_threads_receive_async_L000024
 long @C_s1ts1v_696ddd97_89_L000090
 long @C_s1tsm_696ddd97_threads_sleep_L000027
 long @C_s1ts20_696ddd97_91_L000092
 long @C_s1tsn_696ddd97_threads_msleep_L000028
 long @C_s1ts21_696ddd97_93_L000094
 long @C_s1tsk_696ddd97_threads_print_L000025
 long @C_s1ts22_696ddd97_95_L000096
 long @C_s1tsl_696ddd97_threads_print_raw_L000026
 long @C_s1ts23_696ddd97_97_L000098
 long @C_s1ts12_696ddd97_threads_sbrk_L000039
 long @C_s1ts24_696ddd97_99_L000100
 long @C_s1ts13_696ddd97_threads_stacksize_L000040
 long @C_s1ts25_696ddd97_101_L000102
 long @C_s1ts16_696ddd97_threads_factories_L000043
 long @C_s1ts26_696ddd97_103_L000104
 long @C_s1ts14_696ddd97_threads_factory_L000041
 long @C_s1ts27_696ddd97_105_L000106
 long @C_s1ts15_696ddd97_threads_version_L000042
 long @C_s1ts28_696ddd97_107_L000108
 long @C_s1ts17_696ddd97_threads_gc_L000044
 long @C_s1ts29_696ddd97_109_L000110
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014
 long @C_s1ts2a_696ddd97_111_L000112
 long @C_s1tsf_696ddd97_threads_set_numworkers_L000020
 long @C_s1ts2b_696ddd97_113_L000114
 long @C_s1tsd_696ddd97_threads_create_channel_L000018
 long @C_s1ts2c_696ddd97_115_L000116
 long @C_s1tsd_696ddd97_threads_create_channel_L000018
 long @C_s1ts2d_696ddd97_117_L000118
 long @C_s1tsd_696ddd97_threads_create_channel_L000018
 long @C_s1ts2e_696ddd97_119_L000120
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019
 long @C_s1ts2f_696ddd97_121_L000122
 long @C_s1tsb_696ddd97_threads_send_L000016
 long @C_s1ts2g_696ddd97_123_L000124
 long @C_s1tsc_696ddd97_threads_receive_L000017
 long @C_s1ts2h_696ddd97_125_L000126
 long @C_s1tsi_696ddd97_threads_send_async_L000023
 long @C_s1ts2i_696ddd97_127_L000128
 long @C_s1tsj_696ddd97_threads_receive_async_L000024
 long $0
 long $0

' Catalina Export list_insert

' Catalina Code

DAT ' code segment

 alignl ' align long
C_list_insert ' <symbol:list_insert>
 jmp #PSHM
 long $500000 ' save registers
 rdlong r22, r3 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_list_insert_130 ' NEU4
 wrlong r2, r3 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_list_insert_131 ' JUMPV addrg
C_list_insert_130
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 wrlong r2, r22 ' ASGNP4 reg reg
C_list_insert_131
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 wrlong r2, r22 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_list_insert_129 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export list_remove

 alignl ' align long
C_list_remove ' <symbol:list_remove>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 rdlong r22, r2 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_list_remove_133 ' EQU4
 rdlong r22, r2 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r2 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_list_remove_132 ' JUMPV addrg
C_list_remove_133
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_list_remove_132
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export list_count

 alignl ' align long
C_list_count ' <symbol:list_count>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_list_count_135 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export list_init

 alignl ' align long
C_list_init ' <symbol:list_init>
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 wrlong r22, r2 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_list_init_136 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s1ts2j_696ddd97_channel_create_L000137 ' <symbol:channel_create>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long @C_s1ts2j_696ddd97_channel_create_L000137_139_L000140
 mov r2, RI ' reg ARG ADDRG
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, #72 ' reg ARG coni
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_newuserdatauv
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_init ' CALL addrg
 mov r2, r21
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_init ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21
 adds r3, #24 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_mutex_init
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21
 adds r3, #40 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_mutex_init
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21
 adds r3, #56 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_cond_init
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21
 adds r3, #64 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_cond_init
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
' C_s1ts2j_696ddd97_channel_create_L000137_138 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts2l_696ddd97_channel_unlocked_get_L000141 ' <symbol:channel_unlocked_get>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_s1ts2j_696ddd97_channel_create_L000137_139_L000140
 mov r2, RI ' reg ARG ADDRG
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_s1ts2l_696ddd97_channel_unlocked_get_L000141_142 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s1ts2m_696ddd97_channel_locked_get_L000143 ' <symbol:channel_locked_get>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143_152 ' EQI4
 jmp #JMPA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143_148 ' JUMPV addrg
C_s1ts2m_696ddd97_channel_locked_get_L000143_147
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov r3, r19
 adds r3, #56 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
C_s1ts2m_696ddd97_channel_locked_get_L000143_148
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1ts2l_696ddd97_channel_unlocked_get_L000141 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143_150 ' EQU4
 mov r2, r19
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143_147 ' NEI4
C_s1ts2m_696ddd97_channel_locked_get_L000143_150
 jmp #JMPA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143_146 ' JUMPV addrg
C_s1ts2m_696ddd97_channel_locked_get_L000143_151
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
C_s1ts2m_696ddd97_channel_locked_get_L000143_152
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1ts2l_696ddd97_channel_unlocked_get_L000141 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143_154 ' EQU4
 mov r2, r19
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143_151 ' NEI4
C_s1ts2m_696ddd97_channel_locked_get_L000143_154
C_s1ts2m_696ddd97_channel_locked_get_L000143_146
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
' C_s1ts2m_696ddd97_channel_locked_get_L000143_144 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luathread_unlock_channel

 alignl ' align long
C_luathread_unlock_channel ' <symbol:luathread_unlock_channel>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, r23
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r23
 adds r2, #56 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_signal ' CALL addrg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
' C_luathread_unlock_channel_155 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luathread_recycle_insert

 alignl ' align long
C_luathread_recycle_insert ' <symbol:luathread_recycle_insert>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_s1ts1_696ddd97_mutex_recycle_list_L000006
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long @C_s1ts2_696ddd97_recycle_list_L000007
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_count ' CALL addrg
 jmp #LODI
 long @C_s1ts3_696ddd97_recyclemax_L000008
 mov r20, RI ' reg <- INDIRI4 addrg
 cmps r0, r20 wcz
 jmp #BR_B
 long @C_luathread_recycle_insert_157 ' LTI4
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_close ' CALL addrg
 jmp #JMPA
 long @C_luathread_recycle_insert_158 ' JUMPV addrg
C_luathread_recycle_insert_157
 mov r2, #0 ' reg ARG coni
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gc
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1ts2_696ddd97_recycle_list_L000007
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_list_insert
 add SP, #4 ' CALL addrg
C_luathread_recycle_insert_158
 jmp #LODL
 long @C_s1ts1_696ddd97_mutex_recycle_list_L000006
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
' C_luathread_recycle_insert_156 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luathread_queue_sender

 alignl ' align long
C_luathread_queue_sender ' <symbol:luathread_queue_sender>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_list_insert
 add SP, #4 ' CALL addrg
' C_luathread_queue_sender_159 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luathread_queue_receiver

 alignl ' align long
C_luathread_queue_receiver ' <symbol:luathread_queue_receiver>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #12 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_list_insert
 add SP, #4 ' CALL addrg
' C_luathread_queue_receiver_160 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts2n_696ddd97_luathread_loadbuffer_L000161 ' <symbol:luathread_loadbuffer>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 rdlong r22, r21 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaL__loadbufferx
 add SP, #16 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s1ts2n_696ddd97_luathread_loadbuffer_L000161_163 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 rdlong r4, r21 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 rdlong r2, r21 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_close ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_s1ts2n_696ddd97_luathread_loadbuffer_L000161_163
' C_s1ts2n_696ddd97_luathread_loadbuffer_L000161_162 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s1ts2o_696ddd97_luathread_copyvalues_L000165 ' <symbol:luathread_copyvalues>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_checkstack
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_167 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_169_L000170
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_171_L000172
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_166 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_167
 mov r19, #2 ' reg <- coni
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_176 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_173
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 jmp #BR_B
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_177 ' LTI4
 cmps r15,  #5 wcz
 jmp #BR_A
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_177 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_208_L000210
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_208_L000210 ' <symbol:208>
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_185
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_180
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_177
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_181
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_184
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_186

' Catalina Code

DAT ' code segment
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_180
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_178 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_181
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_182 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_178 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_182
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_178 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_184
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_178 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_185
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_178 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_186
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_188 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_187
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #4 wz
 jmp #BRNZ
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_190 ' NEI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r13,  #0 wcz
 jmp #BR_B
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_192 ' LTI4
 cmps r13,  #4 wcz
 jmp #BR_A
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_192 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_201_L000203
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_201_L000203 ' <symbol:201>
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_200
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_195
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_192
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_196
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_199

' Catalina Code

DAT ' code segment
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_195
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_193 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_196
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_197 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_198 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_197
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_198
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_193 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_199
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_193 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_200
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_193 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_192
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_193
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_190
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_188
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
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_187 ' NEI4
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_178 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_177
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_204_L000205
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_206_L000207
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_166 ' JUMPV addrg
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_178
' C_s1ts2o_696ddd97_luathread_copyvalues_L000165_174 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_176
 cmps r19, r17 wcz
 jmp #BRBE
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165_173 ' LEI4
 mov r0, #1 ' RET coni
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_166
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s1ts31_696ddd97_luathread_getself_L000211 ' <symbol:luathread_getself>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_s1ts31_696ddd97_luathread_getself_L000211_213_L000214
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_s1ts31_696ddd97_luathread_getself_L000211_212 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s1ts33_696ddd97_luathread_new_L000215 ' <symbol:luathread_new>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_luaL__newstate ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, #20 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_newuserdatauv
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1ts31_696ddd97_luathread_getself_L000211_213_L000214
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1ts8_696ddd97_luathread_openlualibs_L000013 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C_s1ts18_696ddd97_luathread_loadlib_L000045
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts33_696ddd97_luathread_new_L000215_217_L000218
 mov r4, RI ' reg ARG ADDRG
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C_luaopen_propeller
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts33_696ddd97_luathread_new_L000215_219_L000220
 mov r4, RI ' reg ARG ADDRG
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C_luaopen_coroutine
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts33_696ddd97_luathread_new_L000215_221_L000222
 mov r4, RI ' reg ARG ADDRG
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 wrlong r21, r19 ' ASGNP4 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
' C_s1ts33_696ddd97_luathread_new_L000215_216 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts37_696ddd97_luathread_join_workers_L000223 ' <symbol:luathread_join_workers>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sched_join_workers ' CALL addrg
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_close ' CALL addrg
 mov r0, #0 ' RET coni
' C_s1ts37_696ddd97_luathread_join_workers_L000223_224 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s1ts38_696ddd97_codebuff_L000225 ' <symbol:codebuff>
 long $0

 alignl ' align long
C_s1ts39_696ddd97_buffsize_L000226 ' <symbol:buffsize>
 long 0

 alignl ' align long
C_s1ts3a_696ddd97_usedsize_L000227 ' <symbol:usedsize>
 long 0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s1ts3b_696ddd97_writer_L000228 ' <symbol:writer>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_s1ts39_696ddd97_buffsize_L000226
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s1ts3b_696ddd97_writer_L000228_230 ' NEI4
 mov r2, r19
 add r2, #100 ' ADDU4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_malloc ' CALL addrg
 jmp #LODL
 long @C_s1ts38_696ddd97_codebuff_L000225
 wrlong r0, RI ' ASGNP4 addrg reg
 jmp #LODI
 long @C_s1ts38_696ddd97_codebuff_L000225
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1ts3b_696ddd97_writer_L000228_232 ' EQU4
 mov r22, r19
 add r22, #100 ' ADDU4 coni
 jmp #LODL
 long @C_s1ts39_696ddd97_buffsize_L000226
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #JMPA
 long @C_s1ts3b_696ddd97_writer_L000228_231 ' JUMPV addrg
C_s1ts3b_696ddd97_writer_L000228_232
 jmp #LODL
 long @C_s1ts3b_696ddd97_writer_L000228_234_L000235
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_printf ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s1ts3b_696ddd97_writer_L000228_229 ' JUMPV addrg
C_s1ts3b_696ddd97_writer_L000228_230
 jmp #LODI
 long @C_s1ts3a_696ddd97_usedsize_L000227
 mov r22, RI ' reg <- INDIRI4 addrg
 add r22, r19 ' ADDU (1)
 add r22, #1 ' ADDU4 coni
 jmp #LODI
 long @C_s1ts39_696ddd97_buffsize_L000226
 mov r20, RI ' reg <- INDIRI4 addrg
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C_s1ts3b_696ddd97_writer_L000228_236' LTU4
 jmp #LODI
 long @C_s1ts3a_696ddd97_usedsize_L000227
 mov r22, RI ' reg <- INDIRI4 addrg
 add r22, r19 ' ADDU (1)
 mov r2, r22
 add r2, #100 ' ADDU4 coni
 jmp #LODL
 long @C_s1ts38_696ddd97_codebuff_L000225
 mov r22, RI ' reg <- addrg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_realloc
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts38_696ddd97_codebuff_L000225
 wrlong r0, RI ' ASGNP4 addrg reg
 jmp #LODI
 long @C_s1ts38_696ddd97_codebuff_L000225
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1ts3b_696ddd97_writer_L000228_238 ' EQU4
 jmp #LODI
 long @C_s1ts3a_696ddd97_usedsize_L000227
 mov r22, RI ' reg <- INDIRI4 addrg
 add r22, r19 ' ADDU (1)
 add r22, #100 ' ADDU4 coni
 jmp #LODL
 long @C_s1ts39_696ddd97_buffsize_L000226
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #JMPA
 long @C_s1ts3b_696ddd97_writer_L000228_239 ' JUMPV addrg
C_s1ts3b_696ddd97_writer_L000228_238
 jmp #LODL
 long @C_s1ts3b_696ddd97_writer_L000228_240_L000241
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_printf ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s1ts3b_696ddd97_writer_L000228_229 ' JUMPV addrg
C_s1ts3b_696ddd97_writer_L000228_239
C_s1ts3b_696ddd97_writer_L000228_236
C_s1ts3b_696ddd97_writer_L000228_231
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_s1ts3b_696ddd97_writer_L000228_245 ' JUMPV addrg
C_s1ts3b_696ddd97_writer_L000228_242
 jmp #LODI
 long @C_s1ts3a_696ddd97_usedsize_L000227
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODI
 long @C_s1ts38_696ddd97_codebuff_L000225
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r15 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #LODL
 long @C_s1ts3a_696ddd97_usedsize_L000227
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODL
 long @C_s1ts3a_696ddd97_usedsize_L000227
 wrlong r22, RI ' ASGNI4 addrg reg
' C_s1ts3b_696ddd97_writer_L000228_243 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_s1ts3b_696ddd97_writer_L000228_245
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22, r19 wcz 
 jmp #BR_B
 long @C_s1ts3b_696ddd97_writer_L000228_242' LTU4
 jmp #LODI
 long @C_s1ts3a_696ddd97_usedsize_L000227
 mov r15, RI ' reg <- INDIRI4 addrg
 jmp #JMPA
 long @C_s1ts3b_696ddd97_writer_L000228_249 ' JUMPV addrg
C_s1ts3b_696ddd97_writer_L000228_246
 jmp #LODI
 long @C_s1ts38_696ddd97_codebuff_L000225
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, r15 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_s1ts3b_696ddd97_writer_L000228_247 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_s1ts3b_696ddd97_writer_L000228_249
 jmp #LODI
 long @C_s1ts39_696ddd97_buffsize_L000226
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r15, r22 wcz
 jmp #BR_B
 long @C_s1ts3b_696ddd97_writer_L000228_246 ' LTI4
 mov r0, #0 ' RET coni
C_s1ts3b_696ddd97_writer_L000228_229
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts12_696ddd97_threads_sbrk_L000039 ' <symbol:threads_sbrk>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 jmp #BRBE
 long @C_s1ts12_696ddd97_threads_sbrk_L000039_251 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1ts12_696ddd97_threads_sbrk_L000039_253 ' EQI4
 jmp #LODL
 long @C_s1ts7_696ddd97_mutex_memopt_L000012
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_malloc_defragment ' CALL addrg
 jmp #LODL
 long @C_s1ts7_696ddd97_mutex_memopt_L000012
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
C_s1ts12_696ddd97_threads_sbrk_L000039_253
C_s1ts12_696ddd97_threads_sbrk_L000039_251
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sbrk ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s1ts12_696ddd97_threads_sbrk_L000039_250 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts17_696ddd97_threads_gc_L000044 ' <symbol:threads_gc>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 jmp #LODL
 long @C_s1ts7_696ddd97_mutex_memopt_L000012
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gc
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 jmp #BRBE
 long @C_s1ts17_696ddd97_threads_gc_L000044_256 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_s1ts17_696ddd97_threads_gc_L000044_258 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sbrk ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s1ts17_696ddd97_threads_gc_L000044_258
 cmps r19,  #1 wz
 jmp #BRNZ
 long @C_s1ts17_696ddd97_threads_gc_L000044_260 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_malloc_defragment ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sbrk ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s1ts17_696ddd97_threads_gc_L000044_260
 cmps r19,  #2 wz
 jmp #BRNZ
 long @C_s1ts17_696ddd97_threads_gc_L000044_262 ' NEI4
 jmp #LODI
 long @C_s1ts38_696ddd97_codebuff_L000225
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1ts17_696ddd97_threads_gc_L000044_264 ' EQU4
 jmp #LODI
 long @C_s1ts3a_696ddd97_usedsize_L000227
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s1ts17_696ddd97_threads_gc_L000044_264 ' NEI4
 jmp #LODI
 long @C_s1ts38_696ddd97_codebuff_L000225
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_free ' CALL addrg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_s1ts38_696ddd97_codebuff_L000225
 wrlong r22, RI ' ASGNP4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_s1ts3a_696ddd97_usedsize_L000227
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_s1ts39_696ddd97_buffsize_L000226
 wrlong r22, RI ' ASGNI4 addrg reg
C_s1ts17_696ddd97_threads_gc_L000044_264
C_s1ts17_696ddd97_threads_gc_L000044_262
C_s1ts17_696ddd97_threads_gc_L000044_256
 jmp #LODL
 long @C_s1ts7_696ddd97_mutex_memopt_L000012
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s1ts17_696ddd97_threads_gc_L000044_255 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts3e_696ddd97_func_dump_L000266 ' <symbol:func_dump>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_s1ts3a_696ddd97_usedsize_L000227
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r2, #6 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 jmp #LODL
 long @C_s1ts3b_696ddd97_writer_L000228
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_dump
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1ts3e_696ddd97_func_dump_L000266_268 ' EQI4
 jmp #LODL
 long @C_s1ts3e_696ddd97_func_dump_L000266_270_L000271
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s1ts3e_696ddd97_func_dump_L000266_267 ' JUMPV addrg
C_s1ts3e_696ddd97_func_dump_L000266_268
 mov r0, #1 ' RET coni
C_s1ts3e_696ddd97_func_dump_L000266_267
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272 ' <symbol:luathread_copyupvalues>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_275 ' JUMPV addrg
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_274
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r13,  #0 wcz
 jmp #BR_B
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_277 ' LTI4
 cmps r13,  #5 wcz
 jmp #BR_A
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_277 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_291_L000293
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_291_L000293 ' <symbol:291>
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_285
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_280
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_277
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_281
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_284
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_286

' Catalina Code

DAT ' code segment
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_280
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_278 ' JUMPV addrg
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_281
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_282 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_278 ' JUMPV addrg
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_282
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_278 ' JUMPV addrg
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_284
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_278 ' JUMPV addrg
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_285
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #JMPA
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_278 ' JUMPV addrg
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_286
 mov r2, #2 ' reg ARG coni
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r4, RI ' reg ARG con
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_compare
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_287 ' EQI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_278 ' JUMPV addrg
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_287
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_277
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_289_L000290
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_273 ' JUMPV addrg
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_278
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setupvalue
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_294 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_296_L000297
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_273 ' JUMPV addrg
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_294
 adds r17, #1 ' ADDI4 coni
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_275
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getupvalue
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_274 ' NEU4
 mov r0, #1 ' RET coni
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_273
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s1tsh_696ddd97_threads_recycle_set_L000022 ' <symbol:threads_recycle_set>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wcz
 jmp #BRAE
 long @C_s1tsh_696ddd97_threads_recycle_set_L000022_301 ' GEI4
 jmp #LODL
 long @C_s1tsh_696ddd97_threads_recycle_set_L000022_299_L000300
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s1tsh_696ddd97_threads_recycle_set_L000022_301
 jmp #LODL
 long @C_s1ts1_696ddd97_mutex_recycle_list_L000006
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long @C_s1ts3_696ddd97_recyclemax_L000008
 wrlong r19, RI ' ASGNI4 addrg reg
 jmp #JMPA
 long @C_s1tsh_696ddd97_threads_recycle_set_L000022_303 ' JUMPV addrg
C_s1tsh_696ddd97_threads_recycle_set_L000022_302
 jmp #LODL
 long @C_s1ts2_696ddd97_recycle_list_L000007
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_remove ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r2, r21 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_close ' CALL addrg
C_s1tsh_696ddd97_threads_recycle_set_L000022_303
 jmp #LODL
 long @C_s1ts2_696ddd97_recycle_list_L000007
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_count ' CALL addrg
 jmp #LODI
 long @C_s1ts3_696ddd97_recyclemax_L000008
 mov r20, RI ' reg <- INDIRI4 addrg
 cmps r0, r20 wcz
 jmp #BR_A
 long @C_s1tsh_696ddd97_threads_recycle_set_L000022_302 ' GTI4
 jmp #LODL
 long @C_s1ts1_696ddd97_mutex_recycle_list_L000006
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 mov r0, #0 ' RET coni
' C_s1tsh_696ddd97_threads_recycle_set_L000022_298 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsa_696ddd97_threads_wait_L000015 ' <symbol:threads_wait>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 jmp #BRBE
 long @C_s1tsa_696ddd97_threads_wait_L000015_306 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1tsr_696ddd97_threads_wait_for_L000032 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s1tsa_696ddd97_threads_wait_L000015_305 ' JUMPV addrg
C_s1tsa_696ddd97_threads_wait_L000015_306
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sched_wait ' CALL addrg
 mov r0, #0 ' RET coni
C_s1tsa_696ddd97_threads_wait_L000015_305
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsf_696ddd97_threads_set_numworkers_L000020 ' <symbol:threads_set_numworkers>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 jmp #BRBE
 long @C_s1tsf_696ddd97_threads_set_numworkers_L000020_309 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 jmp #BRAE
 long @C_s1tsf_696ddd97_threads_set_numworkers_L000020_313 ' GEI4
 jmp #LODL
 long @C_s1tsf_696ddd97_threads_set_numworkers_L000020_311_L000312
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s1tsf_696ddd97_threads_set_numworkers_L000020_313
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sched_set_numworkers ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C_s1tsf_696ddd97_threads_set_numworkers_L000020_314 ' NEI4
 jmp #LODL
 long @C_s1tsf_696ddd97_threads_set_numworkers_L000020_316_L000317
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_s1tsf_696ddd97_threads_set_numworkers_L000020_314
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
C_s1tsf_696ddd97_threads_set_numworkers_L000020_309
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sched_get_numworkers ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s1tsf_696ddd97_threads_set_numworkers_L000020_308 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsg_696ddd97_threads_get_numworkers_L000021 ' <symbol:threads_get_numworkers>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sched_get_numworkers ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s1tsg_696ddd97_threads_get_numworkers_L000021_318 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts9_696ddd97_threads_create_newproc_L000014 ' <symbol:threads_create_newproc>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1ts7_696ddd97_mutex_memopt_L000012
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r15,  #6 wz
 jmp #BRNZ
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_320 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1ts3e_696ddd97_func_dump_L000266 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #1 wz
 jmp #BR_Z
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_321 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_324_L000325
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts7_696ddd97_mutex_memopt_L000012
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_319 ' JUMPV addrg
C_s1ts9_696ddd97_threads_create_newproc_L000014_320
 cmps r15,  #4 wz
 jmp #BR_Z
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_326 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_328_L000329
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_s1ts7_696ddd97_mutex_memopt_L000012
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_319 ' JUMPV addrg
C_s1ts9_696ddd97_threads_create_newproc_L000014_326
C_s1ts9_696ddd97_threads_create_newproc_L000014_321
 jmp #LODL
 long @C_s1ts1_696ddd97_mutex_recycle_list_L000006
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODI
 long @C_s1ts3_696ddd97_recyclemax_L000008
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 jmp #BRBE
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_330 ' LEI4
 jmp #LODL
 long @C_s1ts2_696ddd97_recycle_list_L000007
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_remove ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_332 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1ts33_696ddd97_luathread_new_L000215 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_331 ' JUMPV addrg
C_s1ts9_696ddd97_threads_create_newproc_L000014_332
 mov r2, #0 ' reg ARG coni
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_331 ' JUMPV addrg
C_s1ts9_696ddd97_threads_create_newproc_L000014_330
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1ts33_696ddd97_luathread_new_L000215 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s1ts9_696ddd97_threads_create_newproc_L000014_331
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #LODL
 long @C_s1ts1_696ddd97_mutex_recycle_list_L000006
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 cmps r15,  #6 wz
 jmp #BRNZ
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_334 ' NEI4
 jmp #LODI
 long @C_s1ts3a_696ddd97_usedsize_L000227
 mov r22, RI ' reg <- INDIRI4 addrg
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts38_696ddd97_codebuff_L000225
 mov r3, RI ' reg ARG INDIR ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2n_696ddd97_luathread_loadbuffer_L000161
 add SP, #12 ' CALL addrg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_s1ts3a_696ddd97_usedsize_L000227
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r2, r13 ' CVI, CVU or LOAD
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts3g_696ddd97_luathread_copyupvalues_L000272
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_335 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_recycle_insert ' CALL addrg
 jmp #LODL
 long @C_s1ts7_696ddd97_mutex_memopt_L000012
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1ts9_696ddd97_threads_create_newproc_L000014_319 ' JUMPV addrg
C_s1ts9_696ddd97_threads_create_newproc_L000014_334
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2n_696ddd97_luathread_loadbuffer_L000161
 add SP, #12 ' CALL addrg
C_s1ts9_696ddd97_threads_create_newproc_L000014_335
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sched_inc_lpcount ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sched_queue_proc ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts7_696ddd97_mutex_memopt_L000012
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #1 ' RET coni
C_s1ts9_696ddd97_threads_create_newproc_L000014_319
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s1tsb_696ddd97_threads_send_L000016 ' <symbol:threads_send>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tsb_696ddd97_threads_send_L000016_339 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r13 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsb_696ddd97_threads_send_L000016_341_L000342
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsb_696ddd97_threads_send_L000016_338 ' JUMPV addrg
C_s1tsb_696ddd97_threads_send_L000016_339
 mov r2, r19
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_remove ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tsb_696ddd97_threads_send_L000016_343 ' EQU4
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r20, r17
 adds r20, #8 ' ADDP4 coni
 mov r22, r0
 subs r22, #1 ' SUBI4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 rdlong r22, r17 ' reg <- INDIRP4 reg
 jmp #LODI
 long @C_s1ts5_696ddd97_mainlp_L000010
 mov r20, RI ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s1tsb_696ddd97_threads_send_L000016_345 ' NEU4
 jmp #LODL
 long @C_s1ts6_696ddd97_mutex_mainls_L000011
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long @C_cond_mainls_sendrecv
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_signal ' CALL addrg
 jmp #LODL
 long @C_s1ts6_696ddd97_mutex_mainls_L000011
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #JMPA
 long @C_s1tsb_696ddd97_threads_send_L000016_346 ' JUMPV addrg
C_s1tsb_696ddd97_threads_send_L000016_345
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sched_queue_proc ' CALL addrg
C_s1tsb_696ddd97_threads_send_L000016_346
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_unlock_channel ' CALL addrg
 cmps r21,  #1 wz
 jmp #BRNZ
 long @C_s1tsb_696ddd97_threads_send_L000016_347 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s1tsb_696ddd97_threads_send_L000016_338 ' JUMPV addrg
C_s1tsb_696ddd97_threads_send_L000016_347
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsb_696ddd97_threads_send_L000016_338 ' JUMPV addrg
C_s1tsb_696ddd97_threads_send_L000016_343
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts5_696ddd97_mainlp_L000010
 mov r20, RI ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s1tsb_696ddd97_threads_send_L000016_349 ' NEU4
 jmp #LODL
 long @C_s1ts5_696ddd97_mainlp_L000010+12
 wrlong r19, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_s1ts5_696ddd97_mainlp_L000010
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_queue_sender ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_unlock_channel ' CALL addrg
 jmp #LODL
 long @C_s1ts6_696ddd97_mutex_mainls_L000011
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long @C_s1ts6_696ddd97_mutex_mainls_L000011
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_cond_mainls_sendrecv
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts6_696ddd97_mutex_mainls_L000011
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #LODI
 long @C_s1ts5_696ddd97_mainlp_L000010+8
 mov r0, RI ' reg <- INDIRI4 addrg
 jmp #JMPA
 long @C_s1tsb_696ddd97_threads_send_L000016_338 ' JUMPV addrg
C_s1tsb_696ddd97_threads_send_L000016_349
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1ts31_696ddd97_luathread_getself_L000211 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tsb_696ddd97_threads_send_L000016_353 ' EQU4
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
C_s1tsb_696ddd97_threads_send_L000016_353
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_yieldk
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s1tsb_696ddd97_threads_send_L000016_338
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsi_696ddd97_threads_send_async_L000023 ' <symbol:threads_send_async>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tsi_696ddd97_threads_send_async_L000023_356 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsb_696ddd97_threads_send_L000016_341_L000342
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsi_696ddd97_threads_send_async_L000023_355 ' JUMPV addrg
C_s1tsi_696ddd97_threads_send_async_L000023_356
 mov r2, r19
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_remove ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tsi_696ddd97_threads_send_async_L000023_358 ' EQU4
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r20, r17
 adds r20, #8 ' ADDP4 coni
 mov r22, r0
 subs r22, #1 ' SUBI4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 rdlong r22, r17 ' reg <- INDIRP4 reg
 jmp #LODI
 long @C_s1ts5_696ddd97_mainlp_L000010
 mov r20, RI ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s1tsi_696ddd97_threads_send_async_L000023_360 ' NEU4
 jmp #LODL
 long @C_s1ts6_696ddd97_mutex_mainls_L000011
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long @C_cond_mainls_sendrecv
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_signal ' CALL addrg
 jmp #LODL
 long @C_s1ts6_696ddd97_mutex_mainls_L000011
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #JMPA
 long @C_s1tsi_696ddd97_threads_send_async_L000023_361 ' JUMPV addrg
C_s1tsi_696ddd97_threads_send_async_L000023_360
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sched_queue_proc ' CALL addrg
C_s1tsi_696ddd97_threads_send_async_L000023_361
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_unlock_channel ' CALL addrg
 cmps r21,  #1 wz
 jmp #BRNZ
 long @C_s1tsi_696ddd97_threads_send_async_L000023_362 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s1tsi_696ddd97_threads_send_async_L000023_355 ' JUMPV addrg
C_s1tsi_696ddd97_threads_send_async_L000023_362
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsi_696ddd97_threads_send_async_L000023_355 ' JUMPV addrg
C_s1tsi_696ddd97_threads_send_async_L000023_358
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_unlock_channel ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsi_696ddd97_threads_send_async_L000023_364_L000365
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
C_s1tsi_696ddd97_threads_send_async_L000023_355
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tso_696ddd97_threads_lock_L000029 ' <symbol:threads_lock>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tso_696ddd97_threads_lock_L000029_370 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsb_696ddd97_threads_send_L000016_341_L000342
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tso_696ddd97_threads_lock_L000029_366 ' JUMPV addrg
C_s1tso_696ddd97_threads_lock_L000029_369
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s1tso_696ddd97_threads_lock_L000029_370
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tso_696ddd97_threads_lock_L000029_372 ' EQU4
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1tso_696ddd97_threads_lock_L000029_369 ' NEI4
C_s1tso_696ddd97_threads_lock_L000029_372
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tso_696ddd97_threads_lock_L000029_373 ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s1tso_696ddd97_threads_lock_L000029_366 ' JUMPV addrg
C_s1tso_696ddd97_threads_lock_L000029_373
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
C_s1tso_696ddd97_threads_lock_L000029_366
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsq_696ddd97_threads_trylock_L000031 ' <symbol:threads_trylock>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tsq_696ddd97_threads_trylock_L000031_376 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsb_696ddd97_threads_send_L000016_341_L000342
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsq_696ddd97_threads_trylock_L000031_375 ' JUMPV addrg
C_s1tsq_696ddd97_threads_trylock_L000031_376
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1tsq_696ddd97_threads_trylock_L000031_378 ' NEI4
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1tsq_696ddd97_threads_trylock_L000031_379 ' JUMPV addrg
C_s1tsq_696ddd97_threads_trylock_L000031_378
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
C_s1tsq_696ddd97_threads_trylock_L000031_379
 mov r0, #1 ' RET coni
C_s1tsq_696ddd97_threads_trylock_L000031_375
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsp_696ddd97_threads_unlock_L000030 ' <symbol:threads_unlock>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tsp_696ddd97_threads_unlock_L000030_381 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsb_696ddd97_threads_send_L000016_341_L000342
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsp_696ddd97_threads_unlock_L000030_380 ' JUMPV addrg
C_s1tsp_696ddd97_threads_unlock_L000030_381
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1tsp_696ddd97_threads_unlock_L000030_383 ' NEI4
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1tsp_696ddd97_threads_unlock_L000030_384 ' JUMPV addrg
C_s1tsp_696ddd97_threads_unlock_L000030_383
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
C_s1tsp_696ddd97_threads_unlock_L000030_384
 mov r0, #1 ' RET coni
C_s1tsp_696ddd97_threads_unlock_L000030_380
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsr_696ddd97_threads_wait_for_L000032 ' <symbol:threads_wait_for>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #1 wz
 jmp #BR_Z
 long @C_s1tsr_696ddd97_threads_wait_for_L000032_386 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1tsr_696ddd97_threads_wait_for_L000032_388_L000389
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsr_696ddd97_threads_wait_for_L000032_385 ' JUMPV addrg
C_s1tsr_696ddd97_threads_wait_for_L000032_386
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tsr_696ddd97_threads_wait_for_L000032_390 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsb_696ddd97_threads_send_L000016_341_L000342
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsr_696ddd97_threads_wait_for_L000032_385 ' JUMPV addrg
C_s1tsr_696ddd97_threads_wait_for_L000032_390
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov r3, r21
 adds r3, #64 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
C_s1tsr_696ddd97_threads_wait_for_L000032_385
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tss_696ddd97_threads_signal_L000033 ' <symbol:threads_signal>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tss_696ddd97_threads_signal_L000033_393 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsb_696ddd97_threads_send_L000016_341_L000342
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tss_696ddd97_threads_signal_L000033_392 ' JUMPV addrg
C_s1tss_696ddd97_threads_signal_L000033_393
 mov r2, r21
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_signal ' CALL addrg
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
C_s1tss_696ddd97_threads_signal_L000033_392
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tst_696ddd97_threads_broadcast_L000034 ' <symbol:threads_broadcast>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tst_696ddd97_threads_broadcast_L000034_396 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsb_696ddd97_threads_send_L000016_341_L000342
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tst_696ddd97_threads_broadcast_L000034_395 ' JUMPV addrg
C_s1tst_696ddd97_threads_broadcast_L000034_396
 mov r2, r21
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_broadcast ' CALL addrg
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
C_s1tst_696ddd97_threads_broadcast_L000034_395
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsu_696ddd97_threads_rendezvous_L000035 ' <symbol:threads_rendezvous>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tsu_696ddd97_threads_rendezvous_L000035_402 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsb_696ddd97_threads_send_L000016_341_L000342
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsu_696ddd97_threads_rendezvous_L000035_398 ' JUMPV addrg
C_s1tsu_696ddd97_threads_rendezvous_L000035_401
 mov r2, r19
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_s1tsu_696ddd97_threads_rendezvous_L000035_402
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tsu_696ddd97_threads_rendezvous_L000035_404 ' EQU4
 mov r2, r19
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1tsu_696ddd97_threads_rendezvous_L000035_401 ' NEI4
C_s1tsu_696ddd97_threads_rendezvous_L000035_404
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tsu_696ddd97_threads_rendezvous_L000035_405 ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s1tsu_696ddd97_threads_rendezvous_L000035_398 ' JUMPV addrg
C_s1tsu_696ddd97_threads_rendezvous_L000035_405
 mov r2, r19
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_broadcast ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, r19
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r19
 adds r2, #40 ' ADDP4 coni
 mov r3, r19
 adds r3, #64 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tsu_696ddd97_threads_rendezvous_L000035_407 ' NEU4
 mov r2, r19
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsb_696ddd97_threads_send_L000016_341_L000342
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsu_696ddd97_threads_rendezvous_L000035_398 ' JUMPV addrg
C_s1tsu_696ddd97_threads_rendezvous_L000035_407
 mov r2, r19
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r19
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_broadcast ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, r19
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
C_s1tsu_696ddd97_threads_rendezvous_L000035_398
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts3t_696ddd97_simple_type_L000409 ' <symbol:simple_type>
 jmp #PSHM
 long $800000 ' save registers
 cmps r2,  #0 wz
 jmp #BR_Z
 long @C_s1ts3t_696ddd97_simple_type_L000409_416 ' EQI4
 cmps r2,  #3 wz
 jmp #BR_Z
 long @C_s1ts3t_696ddd97_simple_type_L000409_416 ' EQI4
 cmps r2,  #1 wz
 jmp #BR_Z
 long @C_s1ts3t_696ddd97_simple_type_L000409_416 ' EQI4
 cmps r2,  #4 wz
 jmp #BRNZ
 long @C_s1ts3t_696ddd97_simple_type_L000409_412 ' NEI4
C_s1ts3t_696ddd97_simple_type_L000409_416
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_s1ts3t_696ddd97_simple_type_L000409_413 ' JUMPV addrg
C_s1ts3t_696ddd97_simple_type_L000409_412
 mov r23, #0 ' reg <- coni
C_s1ts3t_696ddd97_simple_type_L000409_413
 mov r0, r23 ' CVI, CVU or LOAD
' C_s1ts3t_696ddd97_simple_type_L000409_410 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s1ts3u_696ddd97_luathread_movevalues_L000417 ' <symbol:luathread_movevalues>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_checkstack
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_419 ' NEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_418 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_419
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_424 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_421
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 jmp #BR_B
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_425 ' LTI4
 cmps r15,  #5 wcz
 jmp #BR_A
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_425 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_452_L000454
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s1ts3u_696ddd97_luathread_movevalues_L000417_452_L000454 ' <symbol:452>
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_433
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_428
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_425
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_429
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_432
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_434

' Catalina Code

DAT ' code segment
C_s1ts3u_696ddd97_luathread_movevalues_L000417_428
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_426 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_429
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_430 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_426 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_430
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_426 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_432
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_426 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_433
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_426 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_434
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_436 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_435
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #4 wz
 jmp #BRNZ
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_438 ' NEI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r13,  #0 wcz
 jmp #BR_B
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_440 ' LTI4
 cmps r13,  #4 wcz
 jmp #BR_A
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_440 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_449_L000451
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s1ts3u_696ddd97_luathread_movevalues_L000417_449_L000451 ' <symbol:449>
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_448
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_443
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_440
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_444
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_447

' Catalina Code

DAT ' code segment
C_s1ts3u_696ddd97_luathread_movevalues_L000417_443
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_441 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_444
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_445 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_446 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_445
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_446
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_441 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_447
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_441 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_448
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_441 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_440
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_441
C_s1ts3u_696ddd97_luathread_movevalues_L000417_438
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_436
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
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_435 ' NEI4
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_426 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_425
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_418 ' JUMPV addrg
C_s1ts3u_696ddd97_luathread_movevalues_L000417_426
' C_s1ts3u_696ddd97_luathread_movevalues_L000417_422 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s1ts3u_696ddd97_luathread_movevalues_L000417_424
 cmps r19, r17 wcz
 jmp #BRBE
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417_421 ' LEI4
 neg r22, r17 ' NEGI4
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
C_s1ts3u_696ddd97_luathread_movevalues_L000417_418
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s1tsv_696ddd97_threads_shared_L000036 ' <symbol:threads_shared>
 jmp #NEWF
 sub SP, #136
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_s1tsv_696ddd97_threads_shared_L000036_456 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_458_L000459
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsv_696ddd97_threads_shared_L000036_455 ' JUMPV addrg
C_s1tsv_696ddd97_threads_shared_L000036_456
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tsv_696ddd97_threads_shared_L000036_460 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_462_L000463
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsv_696ddd97_threads_shared_L000036_455 ' JUMPV addrg
C_s1tsv_696ddd97_threads_shared_L000036_460
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #46 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tsv_696ddd97_threads_shared_L000036_464 ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BRNZ
 long @C_s1tsv_696ddd97_threads_shared_L000036_466 ' NEI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
C_s1tsv_696ddd97_threads_shared_L000036_466
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_s1tsv_696ddd97_threads_shared_L000036_465 ' NEI4
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s1tsv_696ddd97_threads_shared_L000036_455 ' JUMPV addrg
C_s1tsv_696ddd97_threads_shared_L000036_464
 mov r2, #127 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-140) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -13
 wrbyte r22, RI ' ASGNU1 addrl reg
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_471_L000472
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-140) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s1tsv_696ddd97_threads_shared_L000036_475 ' EQI4
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BR_Z
 long @C_s1tsv_696ddd97_threads_shared_L000036_473 ' EQI4
C_s1tsv_696ddd97_threads_shared_L000036_475
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s1tsv_696ddd97_threads_shared_L000036_455 ' JUMPV addrg
C_s1tsv_696ddd97_threads_shared_L000036_473
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_471_L000472
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_471_L000472
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s1tsv_696ddd97_threads_shared_L000036_477 ' JUMPV addrg
C_s1tsv_696ddd97_threads_shared_L000036_476
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BR_Z
 long @C_s1tsv_696ddd97_threads_shared_L000036_479 ' EQI4
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_481_L000482
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsv_696ddd97_threads_shared_L000036_455 ' JUMPV addrg
C_s1tsv_696ddd97_threads_shared_L000036_479
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r19, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_471_L000472
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s1tsv_696ddd97_threads_shared_L000036_477
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tsv_696ddd97_threads_shared_L000036_476 ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BRNZ
 long @C_s1tsv_696ddd97_threads_shared_L000036_483 ' NEI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
C_s1tsv_696ddd97_threads_shared_L000036_483
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_s1tsv_696ddd97_threads_shared_L000036_485 ' NEI4
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s1tsv_696ddd97_threads_shared_L000036_455 ' JUMPV addrg
C_s1tsv_696ddd97_threads_shared_L000036_485
C_s1tsv_696ddd97_threads_shared_L000036_465
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_487_L000488
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' RET coni
C_s1tsv_696ddd97_threads_shared_L000036_455
 jmp #POPM ' restore registers
 add SP, #136 ' framesize
 jmp #RETF


 alignl ' align long
C_s1ts11_696ddd97_threads_export_L000038 ' <symbol:threads_export>
 jmp #NEWF
 sub SP, #136
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_s1ts11_696ddd97_threads_export_L000038_490 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1ts11_696ddd97_threads_export_L000038_492_L000493
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1ts11_696ddd97_threads_export_L000038_489 ' JUMPV addrg
C_s1ts11_696ddd97_threads_export_L000038_490
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1ts11_696ddd97_threads_export_L000038_494 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1ts11_696ddd97_threads_export_L000038_496_L000497
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1ts11_696ddd97_threads_export_L000038_489 ' JUMPV addrg
C_s1ts11_696ddd97_threads_export_L000038_494
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #46 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1ts11_696ddd97_threads_export_L000038_498 ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 jmp #BRBE
 long @C_s1ts11_696ddd97_threads_export_L000038_500 ' LEI4
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BRNZ
 long @C_s1ts11_696ddd97_threads_export_L000038_500 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s1ts11_696ddd97_threads_export_L000038_504 ' EQI4
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BR_Z
 long @C_s1ts11_696ddd97_threads_export_L000038_502 ' EQI4
C_s1ts11_696ddd97_threads_export_L000038_504
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
C_s1ts11_696ddd97_threads_export_L000038_502
C_s1ts11_696ddd97_threads_export_L000038_500
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -140
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-140) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_s1ts11_696ddd97_threads_export_L000038_499 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_s1ts11_696ddd97_threads_export_L000038_489 ' JUMPV addrg
C_s1ts11_696ddd97_threads_export_L000038_498
 mov r2, #127 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-136) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -9
 wrbyte r22, RI ' ASGNU1 addrl reg
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_471_L000472
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-136) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
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
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s1ts11_696ddd97_threads_export_L000038_510 ' EQI4
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BR_Z
 long @C_s1ts11_696ddd97_threads_export_L000038_508 ' EQI4
C_s1ts11_696ddd97_threads_export_L000038_510
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1ts11_696ddd97_threads_export_L000038_511_L000512
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1ts11_696ddd97_threads_export_L000038_489 ' JUMPV addrg
C_s1ts11_696ddd97_threads_export_L000038_508
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BR_Z
 long @C_s1ts11_696ddd97_threads_export_L000038_513 ' EQI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
C_s1ts11_696ddd97_threads_export_L000038_513
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_471_L000472
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_471_L000472
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s1ts11_696ddd97_threads_export_L000038_516 ' JUMPV addrg
C_s1ts11_696ddd97_threads_export_L000038_515
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BR_Z
 long @C_s1ts11_696ddd97_threads_export_L000038_518 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1ts11_696ddd97_threads_export_L000038_511_L000512
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1ts11_696ddd97_threads_export_L000038_489 ' JUMPV addrg
C_s1ts11_696ddd97_threads_export_L000038_518
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BR_Z
 long @C_s1ts11_696ddd97_threads_export_L000038_520 ' EQI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
C_s1ts11_696ddd97_threads_export_L000038_520
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r21, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_471_L000472
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_s1ts11_696ddd97_threads_export_L000038_516
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1ts11_696ddd97_threads_export_L000038_515 ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BRNZ
 long @C_s1ts11_696ddd97_threads_export_L000038_522 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BR_Z
 long @C_s1ts11_696ddd97_threads_export_L000038_524 ' EQI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
C_s1ts11_696ddd97_threads_export_L000038_524
C_s1ts11_696ddd97_threads_export_L000038_522
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -140
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_s1ts11_696ddd97_threads_export_L000038_489 ' JUMPV addrg
C_s1ts11_696ddd97_threads_export_L000038_499
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1ts11_696ddd97_threads_export_L000038_526_L000527
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' RET coni
C_s1ts11_696ddd97_threads_export_L000038_489
 jmp #POPM ' restore registers
 add SP, #136 ' framesize
 jmp #RETF


 alignl ' align long
C_s1ts10_696ddd97_threads_update_L000037 ' <symbol:threads_update>
 jmp #NEWF
 sub SP, #136
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #2 wz
 jmp #BR_Z
 long @C_s1ts10_696ddd97_threads_update_L000037_529 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1ts10_696ddd97_threads_update_L000037_531_L000532
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1ts10_696ddd97_threads_update_L000037_528 ' JUMPV addrg
C_s1ts10_696ddd97_threads_update_L000037_529
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1ts3t_696ddd97_simple_type_L000409 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1ts10_696ddd97_threads_update_L000037_533 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1ts10_696ddd97_threads_update_L000037_535_L000536
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1ts10_696ddd97_threads_update_L000037_528 ' JUMPV addrg
C_s1ts10_696ddd97_threads_update_L000037_533
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1ts10_696ddd97_threads_update_L000037_537 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1ts10_696ddd97_threads_update_L000037_539_L000540
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1ts10_696ddd97_threads_update_L000037_528 ' JUMPV addrg
C_s1ts10_696ddd97_threads_update_L000037_537
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #46 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1ts10_696ddd97_threads_update_L000037_541 ' NEU4
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -140
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-140) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_s1ts10_696ddd97_threads_update_L000037_542 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_s1ts10_696ddd97_threads_update_L000037_528 ' JUMPV addrg
C_s1ts10_696ddd97_threads_update_L000037_541
 mov r2, #127 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-136) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -9
 wrbyte r22, RI ' ASGNU1 addrl reg
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_471_L000472
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-136) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BR_Z
 long @C_s1ts10_696ddd97_threads_update_L000037_546 ' EQI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
C_s1ts10_696ddd97_threads_update_L000037_546
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_471_L000472
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_471_L000472
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s1ts10_696ddd97_threads_update_L000037_549 ' JUMPV addrg
C_s1ts10_696ddd97_threads_update_L000037_548
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BR_Z
 long @C_s1ts10_696ddd97_threads_update_L000037_551 ' EQI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
C_s1ts10_696ddd97_threads_update_L000037_551
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r21, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsv_696ddd97_threads_shared_L000036_471_L000472
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_s1ts10_696ddd97_threads_update_L000037_549
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1ts10_696ddd97_threads_update_L000037_548 ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts3u_696ddd97_luathread_movevalues_L000417
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -140
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_s1ts10_696ddd97_threads_update_L000037_528 ' JUMPV addrg
C_s1ts10_696ddd97_threads_update_L000037_542
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long @C_s1ts10_696ddd97_threads_update_L000037_553_L000554
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' RET coni
C_s1ts10_696ddd97_threads_update_L000037_528
 jmp #POPM ' restore registers
 add SP, #136 ' framesize
 jmp #RETF


 alignl ' align long
C_s1tsj_696ddd97_threads_receive_async_L000024 ' <symbol:threads_receive_async>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #2 ' reg <- coni
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s1tsj_696ddd97_threads_receive_async_L000024_556 ' NEI4
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1tsj_696ddd97_threads_receive_async_L000024_556 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1tsc_696ddd97_threads_receive_L000017 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s1tsj_696ddd97_threads_receive_async_L000024_555 ' JUMPV addrg
C_s1tsj_696ddd97_threads_receive_async_L000024_556
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1tsc_696ddd97_threads_receive_L000017 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s1tsj_696ddd97_threads_receive_async_L000024_555
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsc_696ddd97_threads_receive_L000017 ' <symbol:threads_receive>
 jmp #NEWF
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1tsc_696ddd97_threads_receive_L000017_559 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_s1tsc_696ddd97_threads_receive_L000017_560 ' JUMPV addrg
C_s1tsc_696ddd97_threads_receive_L000017_559
 mov r17, #0 ' reg <- coni
C_s1tsc_696ddd97_threads_receive_L000017_560
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_s1tsc_696ddd97_threads_receive_L000017_562 ' NEI4
 mov r7, #1 ' reg <- coni
 jmp #JMPA
 long @C_s1tsc_696ddd97_threads_receive_L000017_563 ' JUMPV addrg
C_s1tsc_696ddd97_threads_receive_L000017_562
 mov r7, #0 ' reg <- coni
C_s1tsc_696ddd97_threads_receive_L000017_563
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r9 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2m_696ddd97_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tsc_696ddd97_threads_receive_L000017_564 ' NEU4
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s1tsc_696ddd97_threads_receive_L000017_566 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r9 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsc_696ddd97_threads_receive_L000017_568_L000569
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsc_696ddd97_threads_receive_L000017_558 ' JUMPV addrg
C_s1tsc_696ddd97_threads_receive_L000017_566
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r9 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsc_696ddd97_threads_receive_L000017_570_L000571
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsc_696ddd97_threads_receive_L000017_558 ' JUMPV addrg
C_s1tsc_696ddd97_threads_receive_L000017_564
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_remove ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tsc_696ddd97_threads_receive_L000017_572 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 rdlong r3, r13 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts2o_696ddd97_luathread_copyvalues_L000165
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #1 wz
 jmp #BRNZ
 long @C_s1tsc_696ddd97_threads_receive_L000017_574 ' NEI4
 mov r2, #1 ' reg ARG coni
 rdlong r3, r13 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s1tsc_696ddd97_threads_receive_L000017_575 ' JUMPV addrg
C_s1tsc_696ddd97_threads_receive_L000017_574
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_s1tsc_696ddd97_threads_receive_L000017_575
 rdlong r22, r13 ' reg <- INDIRP4 reg
 jmp #LODI
 long @C_s1ts5_696ddd97_mainlp_L000010
 mov r20, RI ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s1tsc_696ddd97_threads_receive_L000017_576 ' NEU4
 jmp #LODL
 long @C_s1ts6_696ddd97_mutex_mainls_L000011
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long @C_cond_mainls_sendrecv
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_signal ' CALL addrg
 jmp #LODL
 long @C_s1ts6_696ddd97_mutex_mainls_L000011
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #JMPA
 long @C_s1tsc_696ddd97_threads_receive_L000017_577 ' JUMPV addrg
C_s1tsc_696ddd97_threads_receive_L000017_576
 mov r2, r13 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sched_queue_proc ' CALL addrg
C_s1tsc_696ddd97_threads_receive_L000017_577
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_unlock_channel ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22 ' SUBI/P
 subs r0, r19 ' SUBI/P (3)
 jmp #JMPA
 long @C_s1tsc_696ddd97_threads_receive_L000017_558 ' JUMPV addrg
C_s1tsc_696ddd97_threads_receive_L000017_572
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s1tsc_696ddd97_threads_receive_L000017_578 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_unlock_channel ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r9 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsc_696ddd97_threads_receive_L000017_568_L000569
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsc_696ddd97_threads_receive_L000017_558 ' JUMPV addrg
C_s1tsc_696ddd97_threads_receive_L000017_578
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts5_696ddd97_mainlp_L000010
 mov r20, RI ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s1tsc_696ddd97_threads_receive_L000017_580 ' NEU4
 jmp #LODL
 long @C_s1ts5_696ddd97_mainlp_L000010+12
 wrlong r15, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_s1ts5_696ddd97_mainlp_L000010
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_queue_receiver ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luathread_unlock_channel ' CALL addrg
 jmp #LODL
 long @C_s1ts6_696ddd97_mutex_mainls_L000011
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 jmp #LODL
 long @C_s1ts6_696ddd97_mutex_mainls_L000011
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_cond_mainls_sendrecv
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts6_696ddd97_mutex_mainls_L000011
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #LODI
 long @C_s1ts5_696ddd97_mainlp_L000010+8
 mov r0, RI ' reg <- INDIRI4 addrg
 jmp #JMPA
 long @C_s1tsc_696ddd97_threads_receive_L000017_558 ' JUMPV addrg
C_s1tsc_696ddd97_threads_receive_L000017_580
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1ts31_696ddd97_luathread_getself_L000211 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tsc_696ddd97_threads_receive_L000017_584 ' EQU4
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r11
 adds r22, #12 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
C_s1tsc_696ddd97_threads_receive_L000017_584
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_yieldk
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s1tsc_696ddd97_threads_receive_L000017_558
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsd_696ddd97_threads_create_channel_L000018 ' <symbol:threads_create_channel>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1ts2l_696ddd97_channel_unlocked_get_L000141 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tsd_696ddd97_threads_create_channel_L000018_587 ' EQU4
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsd_696ddd97_threads_create_channel_L000018_589_L000590
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tsd_696ddd97_threads_create_channel_L000018_586 ' JUMPV addrg
C_s1tsd_696ddd97_threads_create_channel_L000018_587
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1ts2j_696ddd97_channel_create_L000137 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
C_s1tsd_696ddd97_threads_create_channel_L000018_586
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tse_696ddd97_threads_destroy_channel_L000019 ' <symbol:threads_destroy_channel>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1ts2l_696ddd97_channel_unlocked_get_L000141 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_592 ' EQU4
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_trylock ' CALL addrg
C_s1tse_696ddd97_threads_destroy_channel_L000019_592
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_594 ' NEU4
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsb_696ddd97_threads_send_L000016_341_L000342
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_591 ' JUMPV addrg
C_s1tse_696ddd97_threads_destroy_channel_L000019_594
 jmp #LODL
 long @C_s1ts2j_696ddd97_channel_create_L000137_139_L000140
 mov r2, RI ' reg ARG ADDRG
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_broadcast ' CALL addrg
 mov r2, r21
 adds r2, #56 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_broadcast ' CALL addrg
 jmp #LODL
 long 0
 mov r19, RI ' reg <- con
 rdlong r22, r21 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_596 ' EQU4
 mov r2, r15 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_598_L000599
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r19, r21 ' CVI, CVU or LOAD
C_s1tse_696ddd97_threads_destroy_channel_L000019_596
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_600 ' EQU4
 jmp #JMPA
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_603 ' JUMPV addrg
C_s1tse_696ddd97_threads_destroy_channel_L000019_602
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 rdlong r3, r17 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sched_queue_proc ' CALL addrg
C_s1tse_696ddd97_threads_destroy_channel_L000019_603
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_remove ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_602 ' NEU4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s1tse_696ddd97_threads_destroy_channel_L000019_600
 jmp #LODL
 long 0
 mov r19, RI ' reg <- con
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_605 ' EQU4
 mov r2, r15 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_607_L000608
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r19, r21
 adds r19, #12 ' ADDP4 coni
C_s1tse_696ddd97_threads_destroy_channel_L000019_605
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_609 ' EQU4
 jmp #JMPA
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_612 ' JUMPV addrg
C_s1tse_696ddd97_threads_destroy_channel_L000019_611
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 rdlong r3, r17 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sched_queue_proc ' CALL addrg
C_s1tse_696ddd97_threads_destroy_channel_L000019_612
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_remove ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1tse_696ddd97_threads_destroy_channel_L000019_611 ' NEU4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s1tse_696ddd97_threads_destroy_channel_L000019_609
 jmp #LODL
 long @C_s1ts_696ddd97_mutex_channel_list_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r21
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_destroy ' CALL addrg
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_destroy ' CALL addrg
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r21
 adds r2, #56 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_cond_destroy ' CALL addrg
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_mutex_destroy ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
C_s1tse_696ddd97_threads_destroy_channel_L000019_591
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts13_696ddd97_threads_stacksize_L000040 ' <symbol:threads_stacksize>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 jmp #BRBE
 long @C_s1ts13_696ddd97_threads_stacksize_L000040_615 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 jmp #BR_A
 long @C_s1ts13_696ddd97_threads_stacksize_L000040_619 ' GTI4
 jmp #LODL
 long @C_s1ts13_696ddd97_threads_stacksize_L000040_617_L000618
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s1ts13_696ddd97_threads_stacksize_L000040_619
 jmp #LODL
 long @C_stacksize
 wrlong r21, RI ' ASGNI4 addrg reg
C_s1ts13_696ddd97_threads_stacksize_L000040_615
 jmp #LODI
 long @C_stacksize
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s1ts13_696ddd97_threads_stacksize_L000040_614 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts16_696ddd97_threads_factories_L000043 ' <symbol:threads_factories>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 jmp #BRBE
 long @C_s1ts16_696ddd97_threads_factories_L000043_621 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 jmp #BR_A
 long @C_s1ts16_696ddd97_threads_factories_L000043_625 ' GTI4
 jmp #LODL
 long @C_s1ts16_696ddd97_threads_factories_L000043_623_L000624
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s1ts16_696ddd97_threads_factories_L000043_625
 cmps r21,  #16 wcz
 jmp #BRBE
 long @C_s1ts16_696ddd97_threads_factories_L000043_626 ' LEI4
 mov r21, #16 ' reg <- coni
C_s1ts16_696ddd97_threads_factories_L000043_626
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sched_set_numfactories ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s1ts16_696ddd97_threads_factories_L000043_622 ' JUMPV addrg
C_s1ts16_696ddd97_threads_factories_L000043_621
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sched_get_numfactories ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s1ts16_696ddd97_threads_factories_L000043_622
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s1ts16_696ddd97_threads_factories_L000043_620 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts14_696ddd97_threads_factory_L000041 ' <symbol:threads_factory>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 jmp #BRBE
 long @C_s1ts14_696ddd97_threads_factory_L000041_629 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 jmp #BR_A
 long @C_s1ts14_696ddd97_threads_factory_L000041_631 ' GTI4
 jmp #LODL
 long @C_s1ts16_696ddd97_threads_factories_L000043_623_L000624
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s1ts14_696ddd97_threads_factory_L000041_631
 cmps r21,  #16 wcz
 jmp #BRBE
 long @C_s1ts14_696ddd97_threads_factory_L000041_632 ' LEI4
 mov r21, #16 ' reg <- coni
C_s1ts14_696ddd97_threads_factory_L000041_632
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sched_set_factory ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s1ts14_696ddd97_threads_factory_L000041_630 ' JUMPV addrg
C_s1ts14_696ddd97_threads_factory_L000041_629
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sched_get_factory ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s1ts14_696ddd97_threads_factory_L000041_630
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s1ts14_696ddd97_threads_factory_L000041_628 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts15_696ddd97_threads_version_L000042 ' <symbol:threads_version>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 jmp #BRBE
 long @C_s1ts15_696ddd97_threads_version_L000042_635 ' LEI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1ts15_696ddd97_threads_version_L000042_639_L000640
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1ts15_696ddd97_threads_version_L000042_637 ' NEI4
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts15_696ddd97_threads_version_L000042_636 ' JUMPV addrg
C_s1ts15_696ddd97_threads_version_L000042_637
 jmp #LODL
 long @C_s1ts15_696ddd97_threads_version_L000042_643_L000644
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1ts15_696ddd97_threads_version_L000042_641 ' NEI4
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts15_696ddd97_threads_version_L000042_636 ' JUMPV addrg
C_s1ts15_696ddd97_threads_version_L000042_641
 jmp #LODL
 long 885
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1ts15_696ddd97_threads_version_L000042_636 ' JUMPV addrg
C_s1ts15_696ddd97_threads_version_L000042_635
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
C_s1ts15_696ddd97_threads_version_L000042_636
 mov r0, #1 ' RET coni
' C_s1ts15_696ddd97_threads_version_L000042_634 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsm_696ddd97_threads_sleep_L000027 ' <symbol:threads_sleep>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 jmp #BRBE
 long @C_s1tsm_696ddd97_threads_sleep_L000027_646 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 jmp #BRAE
 long @C_s1tsm_696ddd97_threads_sleep_L000027_650 ' GEI4
 jmp #LODL
 long @C_s1tsm_696ddd97_threads_sleep_L000027_648_L000649
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s1tsm_696ddd97_threads_sleep_L000027_650
 cmps r21,  #0 wcz
 jmp #BRBE
 long @C_s1tsm_696ddd97_threads_sleep_L000027_651 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_sleep ' CALL addrg
 jmp #JMPA
 long @C_s1tsm_696ddd97_threads_sleep_L000027_647 ' JUMPV addrg
C_s1tsm_696ddd97_threads_sleep_L000027_651
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 jmp #JMPA
 long @C_s1tsm_696ddd97_threads_sleep_L000027_647 ' JUMPV addrg
C_s1tsm_696ddd97_threads_sleep_L000027_646
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
C_s1tsm_696ddd97_threads_sleep_L000027_647
 mov r0, #0 ' RET coni
' C_s1tsm_696ddd97_threads_sleep_L000027_645 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsn_696ddd97_threads_msleep_L000028 ' <symbol:threads_msleep>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 jmp #BRBE
 long @C_s1tsn_696ddd97_threads_msleep_L000028_654 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 jmp #BRAE
 long @C_s1tsn_696ddd97_threads_msleep_L000028_658 ' GEI4
 jmp #LODL
 long @C_s1tsn_696ddd97_threads_msleep_L000028_656_L000657
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s1tsn_696ddd97_threads_msleep_L000028_658
 cmps r21,  #0 wcz
 jmp #BRBE
 long @C_s1tsn_696ddd97_threads_msleep_L000028_659 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_msleep ' CALL addrg
 jmp #JMPA
 long @C_s1tsn_696ddd97_threads_msleep_L000028_655 ' JUMPV addrg
C_s1tsn_696ddd97_threads_msleep_L000028_659
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
 jmp #JMPA
 long @C_s1tsn_696ddd97_threads_msleep_L000028_655 ' JUMPV addrg
C_s1tsn_696ddd97_threads_msleep_L000028_654
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_pthread_yield ' CALL addrg
C_s1tsn_696ddd97_threads_msleep_L000028_655
 mov r0, #0 ' RET coni
' C_s1tsn_696ddd97_threads_msleep_L000028_653 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsk_696ddd97_threads_print_L000025 ' <symbol:threads_print>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #1 wz
 jmp #BRNZ
 long @C_s1tsk_696ddd97_threads_print_L000025_662 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1tsk_696ddd97_threads_print_L000025_664 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_666_L000667
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_printf
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s1tsk_696ddd97_threads_print_L000025_663 ' JUMPV addrg
C_s1tsk_696ddd97_threads_print_L000025_664
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1tsk_696ddd97_threads_print_L000025_668 ' NEI4
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_670_L000671
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_printf ' CALL addrg
 jmp #JMPA
 long @C_s1tsk_696ddd97_threads_print_L000025_663 ' JUMPV addrg
C_s1tsk_696ddd97_threads_print_L000025_668
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #1 wz
 jmp #BRNZ
 long @C_s1tsk_696ddd97_threads_print_L000025_672 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s1tsk_696ddd97_threads_print_L000025_679 ' EQI4
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_674_L000675
 mov r17, RI ' reg <- addrg
 jmp #JMPA
 long @C_s1tsk_696ddd97_threads_print_L000025_680 ' JUMPV addrg
C_s1tsk_696ddd97_threads_print_L000025_679
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_676_L000677
 mov r17, RI ' reg <- addrg
C_s1tsk_696ddd97_threads_print_L000025_680
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_printf ' CALL addrg
 jmp #JMPA
 long @C_s1tsk_696ddd97_threads_print_L000025_663 ' JUMPV addrg
C_s1tsk_696ddd97_threads_print_L000025_672
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_topointer
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_681_L000682
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_printf
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s1tsk_696ddd97_threads_print_L000025_663 ' JUMPV addrg
C_s1tsk_696ddd97_threads_print_L000025_662
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_s1tsk_696ddd97_threads_print_L000025_686 ' JUMPV addrg
C_s1tsk_696ddd97_threads_print_L000025_683
 cmps r21,  #1 wcz
 jmp #BRBE
 long @C_s1tsk_696ddd97_threads_print_L000025_687 ' LEI4
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_689_L000690
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_printf ' CALL addrg
C_s1tsk_696ddd97_threads_print_L000025_687
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1tsk_696ddd97_threads_print_L000025_691 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_printf ' CALL addrg
 jmp #JMPA
 long @C_s1tsk_696ddd97_threads_print_L000025_692 ' JUMPV addrg
C_s1tsk_696ddd97_threads_print_L000025_691
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1tsk_696ddd97_threads_print_L000025_693 ' NEI4
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_695_L000696
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_printf ' CALL addrg
 jmp #JMPA
 long @C_s1tsk_696ddd97_threads_print_L000025_694 ' JUMPV addrg
C_s1tsk_696ddd97_threads_print_L000025_693
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #1 wz
 jmp #BRNZ
 long @C_s1tsk_696ddd97_threads_print_L000025_697 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s1tsk_696ddd97_threads_print_L000025_704 ' EQI4
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_699_L000700
 mov r17, RI ' reg <- addrg
 jmp #JMPA
 long @C_s1tsk_696ddd97_threads_print_L000025_705 ' JUMPV addrg
C_s1tsk_696ddd97_threads_print_L000025_704
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_701_L000702
 mov r17, RI ' reg <- addrg
C_s1tsk_696ddd97_threads_print_L000025_705
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_printf ' CALL addrg
 jmp #JMPA
 long @C_s1tsk_696ddd97_threads_print_L000025_698 ' JUMPV addrg
C_s1tsk_696ddd97_threads_print_L000025_697
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_topointer
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_706_L000707
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_printf
 add SP, #8 ' CALL addrg
C_s1tsk_696ddd97_threads_print_L000025_698
C_s1tsk_696ddd97_threads_print_L000025_694
C_s1tsk_696ddd97_threads_print_L000025_692
' C_s1tsk_696ddd97_threads_print_L000025_684 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_s1tsk_696ddd97_threads_print_L000025_686
 cmps r21, r19 wcz
 jmp #BRBE
 long @C_s1tsk_696ddd97_threads_print_L000025_683 ' LEI4
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_708_L000709
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_printf ' CALL addrg
C_s1tsk_696ddd97_threads_print_L000025_663
 mov r0, #0 ' RET coni
' C_s1tsk_696ddd97_threads_print_L000025_661 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1tsl_696ddd97_threads_print_raw_L000026 ' <symbol:threads_print_raw>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_s1tsl_696ddd97_threads_print_raw_L000026_714 ' JUMPV addrg
C_s1tsl_696ddd97_threads_print_raw_L000026_711
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1tsl_696ddd97_threads_print_raw_L000026_715 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_printf ' CALL addrg
 jmp #JMPA
 long @C_s1tsl_696ddd97_threads_print_raw_L000026_716 ' JUMPV addrg
C_s1tsl_696ddd97_threads_print_raw_L000026_715
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s1tsl_696ddd97_threads_print_raw_L000026_717 ' NEI4
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_695_L000696
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_printf ' CALL addrg
 jmp #JMPA
 long @C_s1tsl_696ddd97_threads_print_raw_L000026_718 ' JUMPV addrg
C_s1tsl_696ddd97_threads_print_raw_L000026_717
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #1 wz
 jmp #BRNZ
 long @C_s1tsl_696ddd97_threads_print_raw_L000026_719 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s1tsl_696ddd97_threads_print_raw_L000026_722 ' EQI4
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_699_L000700
 mov r17, RI ' reg <- addrg
 jmp #JMPA
 long @C_s1tsl_696ddd97_threads_print_raw_L000026_723 ' JUMPV addrg
C_s1tsl_696ddd97_threads_print_raw_L000026_722
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_701_L000702
 mov r17, RI ' reg <- addrg
C_s1tsl_696ddd97_threads_print_raw_L000026_723
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_printf ' CALL addrg
 jmp #JMPA
 long @C_s1tsl_696ddd97_threads_print_raw_L000026_720 ' JUMPV addrg
C_s1tsl_696ddd97_threads_print_raw_L000026_719
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_topointer
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s1tsk_696ddd97_threads_print_L000025_706_L000707
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_pthread_printf
 add SP, #8 ' CALL addrg
C_s1tsl_696ddd97_threads_print_raw_L000026_720
C_s1tsl_696ddd97_threads_print_raw_L000026_718
C_s1tsl_696ddd97_threads_print_raw_L000026_716
' C_s1tsl_696ddd97_threads_print_raw_L000026_712 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_s1tsl_696ddd97_threads_print_raw_L000026_714
 cmps r21, r19 wcz
 jmp #BRBE
 long @C_s1tsl_696ddd97_threads_print_raw_L000026_711 ' LEI4
 mov r0, #0 ' RET coni
' C_s1tsl_696ddd97_threads_print_raw_L000026_710 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luathread_get_channel

 alignl ' align long
C_luathread_get_channel ' <symbol:luathread_get_channel>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_luathread_get_channel_724 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luathread_get_status

 alignl ' align long
C_luathread_get_status ' <symbol:luathread_get_status>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_luathread_get_status_725 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luathread_set_status

 alignl ' align long
C_luathread_set_status ' <symbol:luathread_set_status>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 wrlong r2, r22 ' ASGNI4 reg reg
' C_luathread_set_status_726 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luathread_get_state

 alignl ' align long
C_luathread_get_state ' <symbol:luathread_get_state>
 rdlong r0, r2 ' reg <- INDIRP4 reg
' C_luathread_get_state_727 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export luathread_get_numargs

 alignl ' align long
C_luathread_get_numargs ' <symbol:luathread_get_numargs>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_luathread_get_numargs_728 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luathread_set_numargs

 alignl ' align long
C_luathread_set_numargs ' <symbol:luathread_set_numargs>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 wrlong r2, r22 ' ASGNI4 reg reg
' C_luathread_set_numargs_729 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s1ts56_696ddd97_luathread_reglualib_L000730 ' <symbol:luathread_reglualib>
 jmp #NEWF
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_s1ts56_696ddd97_luathread_reglualib_L000730_732_L000733
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s1ts56_696ddd97_luathread_reglualib_L000730_734_L000735
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_s1ts56_696ddd97_luathread_reglualib_L000730_731 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts8_696ddd97_luathread_openlualibs_L000013 ' <symbol:luathread_openlualibs>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_luaopen_base
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts8_696ddd97_luathread_openlualibs_L000013_737_L000738
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C_luaopen_package
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts56_696ddd97_luathread_reglualib_L000730_732_L000733
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_luaopen_io
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts8_696ddd97_luathread_openlualibs_L000013_739_L000740
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts56_696ddd97_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_luaopen_os
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts8_696ddd97_luathread_openlualibs_L000013_741_L000742
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts56_696ddd97_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_luaopen_table
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts8_696ddd97_luathread_openlualibs_L000013_743_L000744
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts56_696ddd97_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_luaopen_string
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts8_696ddd97_luathread_openlualibs_L000013_745_L000746
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts56_696ddd97_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_luaopen_math
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts8_696ddd97_luathread_openlualibs_L000013_747_L000748
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts56_696ddd97_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_luaopen_debug
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts8_696ddd97_luathread_openlualibs_L000013_749_L000750
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts56_696ddd97_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_luaopen_coroutine
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts33_696ddd97_luathread_new_L000215_221_L000222
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts56_696ddd97_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_luaopen_utf8
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts8_696ddd97_luathread_openlualibs_L000013_751_L000752
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts56_696ddd97_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_luaopen_propeller
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts33_696ddd97_luathread_new_L000215_219_L000220
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1ts56_696ddd97_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
' C_s1ts8_696ddd97_luathread_openlualibs_L000013_736 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaopen_threads

 alignl ' align long
C_luaopen_threads ' <symbol:luaopen_threads>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 jmp #LODI
 long @C_luaopen_threads_754_L000755
 mov r3, RI ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #41 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_s1ts19_696ddd97_luathread_funcs_L000046
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 jmp #LODL
 long @C_s1ts5_696ddd97_mainlp_L000010
 wrlong r23, RI ' ASGNP4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_s1ts5_696ddd97_mainlp_L000010+4
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_s1ts5_696ddd97_mainlp_L000010+8
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_s1ts5_696ddd97_mainlp_L000010+12
 wrlong r22, RI ' ASGNP4 addrg reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_s1ts5_696ddd97_mainlp_L000010+16
 wrlong r22, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_s1ts2_696ddd97_recycle_list_L000007
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_list_init ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_luaL__newstate ' CALL addrg
 jmp #LODL
 long @C_s1ts4_696ddd97_chanls_L000009
 wrlong r0, RI ' ASGNP4 addrg reg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_s1ts2j_696ddd97_channel_create_L000137_139_L000140
 mov r2, RI ' reg ARG ADDRG
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C_luaopen_base
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_s1ts8_696ddd97_luathread_openlualibs_L000013_737_L000738
 mov r4, RI ' reg ARG ADDRG
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r5, RI ' reg ARG INDIR ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODI
 long @C_s1ts4_696ddd97_chanls_L000009
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_newuserdatauv
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_luaopen_threads_760_L000761
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_luaopen_threads_762_L000763
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__newmetatable
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_luaopen_threads_764_L000765
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_s1ts37_696ddd97_luathread_join_workers_L000223
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
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
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_luaopen_threads_760_L000761
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_luaopen_threads_762_L000763
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setmetatable
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
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sched_init ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C_luaopen_threads_766 ' NEI4
 jmp #LODL
 long @C_s1tsf_696ddd97_threads_set_numworkers_L000020_316_L000317
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_luaopen_threads_766
 mov r0, #1 ' RET coni
' C_luaopen_threads_753 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1ts18_696ddd97_luathread_loadlib_L000045 ' <symbol:luathread_loadlib>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 jmp #LODI
 long @C_luaopen_threads_754_L000755
 mov r3, RI ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #41 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_s1ts19_696ddd97_luathread_funcs_L000046
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s1ts18_696ddd97_luathread_loadlib_L000045_768 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import luaopen_propeller

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_s1ts5_696ddd97_mainlp_L000010 ' <symbol:mainlp>
 byte 0[20]

 alignl ' align long
C_s1ts2_696ddd97_recycle_list_L000007 ' <symbol:recycle_list>
 byte 0[12]

' Catalina Code

DAT ' code segment

' Catalina Import sbrk

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import malloc_defragment

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sched_get_factory

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sched_set_factory

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sched_get_numfactories

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sched_set_numfactories

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sched_get_numworkers

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sched_set_numworkers

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sched_inc_lpcount

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sched_queue_proc

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sched_wait

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sched_join_workers

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sched_init

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaopen_package

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaopen_debug

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaopen_math

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaopen_utf8

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaopen_string

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaopen_os

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaopen_io

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaopen_table

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaopen_coroutine

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaopen_base

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_requiref

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_setfuncs

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_newstate

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_loadbufferx

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_error

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_newmetatable

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_checktype

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_checkinteger

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_checklstring

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_argerror

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_checkversion_

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_setupvalue

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_getupvalue

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_next

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_gc

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_yieldk

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_dump

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_setmetatable

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_rawset

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_setfield

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_settable

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_setglobal

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_newuserdatauv

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_createtable

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_rawgeti

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_getfield

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_gettable

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_getglobal

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_pushboolean

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_pushcclosure

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_pushfstring

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_pushstring

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_pushlstring

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_pushinteger

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_pushnumber

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_pushnil

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_compare

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_topointer

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_touserdata

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_tolstring

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_toboolean

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_tonumberx

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_typename

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_type

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_isinteger

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_isstring

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_checkstack

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_rotate

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_settop

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_gettop

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import lua_close

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strtok

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strchr

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strcmp

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strncpy

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import realloc

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

' Catalina Import _pthread_init_lock_pool

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_printf

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_msleep

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_sleep

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_yield

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_cond_broadcast

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

' Catalina Import pthread_cond_destroy

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_cond_init

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_mutex_destroy

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_mutex_init

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_mutex_trylock

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

' Catalina Import printf

' Catalina Data

DAT ' uninitialized data segment

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_threads_764_L000765 ' <symbol:764>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

 alignl ' align long
C_luaopen_threads_762_L000763 ' <symbol:762>
 byte 76
 byte 85
 byte 65
 byte 84
 byte 72
 byte 82
 byte 69
 byte 65
 byte 68
 byte 95
 byte 70
 byte 73
 byte 78
 byte 65
 byte 76
 byte 73
 byte 90
 byte 69
 byte 82
 byte 95
 byte 77
 byte 84
 byte 0

 alignl ' align long
C_luaopen_threads_760_L000761 ' <symbol:760>
 byte 76
 byte 85
 byte 65
 byte 84
 byte 72
 byte 82
 byte 69
 byte 65
 byte 68
 byte 95
 byte 70
 byte 73
 byte 78
 byte 65
 byte 76
 byte 73
 byte 90
 byte 69
 byte 82
 byte 95
 byte 85
 byte 68
 byte 65
 byte 84
 byte 65
 byte 0

 alignl ' align long
C_luaopen_threads_754_L000755 ' <symbol:754>
 long $43fc0000 ' float

 alignl ' align long
C_s1ts8_696ddd97_luathread_openlualibs_L000013_751_L000752 ' <symbol:751>
 byte 117
 byte 116
 byte 102
 byte 56
 byte 0

 alignl ' align long
C_s1ts8_696ddd97_luathread_openlualibs_L000013_749_L000750 ' <symbol:749>
 byte 100
 byte 101
 byte 98
 byte 117
 byte 103
 byte 0

 alignl ' align long
C_s1ts8_696ddd97_luathread_openlualibs_L000013_747_L000748 ' <symbol:747>
 byte 109
 byte 97
 byte 116
 byte 104
 byte 0

 alignl ' align long
C_s1ts8_696ddd97_luathread_openlualibs_L000013_745_L000746 ' <symbol:745>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s1ts8_696ddd97_luathread_openlualibs_L000013_743_L000744 ' <symbol:743>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s1ts8_696ddd97_luathread_openlualibs_L000013_741_L000742 ' <symbol:741>
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_s1ts8_696ddd97_luathread_openlualibs_L000013_739_L000740 ' <symbol:739>
 byte 105
 byte 111
 byte 0

 alignl ' align long
C_s1ts8_696ddd97_luathread_openlualibs_L000013_737_L000738 ' <symbol:737>
 byte 95
 byte 71
 byte 0

 alignl ' align long
C_s1ts56_696ddd97_luathread_reglualib_L000730_734_L000735 ' <symbol:734>
 byte 112
 byte 114
 byte 101
 byte 108
 byte 111
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_s1ts56_696ddd97_luathread_reglualib_L000730_732_L000733 ' <symbol:732>
 byte 112
 byte 97
 byte 99
 byte 107
 byte 97
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_s1tsk_696ddd97_threads_print_L000025_708_L000709 ' <symbol:708>
 byte 10
 byte 0

 alignl ' align long
C_s1tsk_696ddd97_threads_print_L000025_706_L000707 ' <symbol:706>
 byte 37
 byte 115
 byte 58
 byte 37
 byte 88
 byte 0

 alignl ' align long
C_s1tsk_696ddd97_threads_print_L000025_701_L000702 ' <symbol:701>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_s1tsk_696ddd97_threads_print_L000025_699_L000700 ' <symbol:699>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_s1tsk_696ddd97_threads_print_L000025_695_L000696 ' <symbol:695>
 byte 110
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_s1tsk_696ddd97_threads_print_L000025_689_L000690 ' <symbol:689>
 byte 9
 byte 0

 alignl ' align long
C_s1tsk_696ddd97_threads_print_L000025_681_L000682 ' <symbol:681>
 byte 37
 byte 115
 byte 58
 byte 37
 byte 108
 byte 88
 byte 10
 byte 0

 alignl ' align long
C_s1tsk_696ddd97_threads_print_L000025_676_L000677 ' <symbol:676>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 10
 byte 0

 alignl ' align long
C_s1tsk_696ddd97_threads_print_L000025_674_L000675 ' <symbol:674>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 10
 byte 0

 alignl ' align long
C_s1tsk_696ddd97_threads_print_L000025_670_L000671 ' <symbol:670>
 byte 110
 byte 105
 byte 108
 byte 10
 byte 0

 alignl ' align long
C_s1tsk_696ddd97_threads_print_L000025_666_L000667 ' <symbol:666>
 byte 37
 byte 115
 byte 10
 byte 0

 alignl ' align long
C_s1tsn_696ddd97_threads_msleep_L000028_656_L000657 ' <symbol:656>
 byte 109
 byte 115
 byte 101
 byte 99
 byte 115
 byte 32
 byte 109
 byte 117
 byte 115
 byte 116
 byte 32
 byte 98
 byte 101
 byte 32
 byte 122
 byte 101
 byte 114
 byte 111
 byte 32
 byte 111
 byte 114
 byte 32
 byte 112
 byte 111
 byte 115
 byte 105
 byte 116
 byte 105
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s1tsm_696ddd97_threads_sleep_L000027_648_L000649 ' <symbol:648>
 byte 115
 byte 101
 byte 99
 byte 115
 byte 32
 byte 109
 byte 117
 byte 115
 byte 116
 byte 32
 byte 98
 byte 101
 byte 32
 byte 122
 byte 101
 byte 114
 byte 111
 byte 32
 byte 111
 byte 114
 byte 32
 byte 112
 byte 111
 byte 115
 byte 105
 byte 116
 byte 105
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s1ts15_696ddd97_threads_version_L000042_643_L000644 ' <symbol:643>
 byte 104
 byte 97
 byte 114
 byte 100
 byte 119
 byte 97
 byte 114
 byte 101
 byte 0

 alignl ' align long
C_s1ts15_696ddd97_threads_version_L000042_639_L000640 ' <symbol:639>
 byte 108
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_s1ts16_696ddd97_threads_factories_L000043_623_L000624 ' <symbol:623>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 102
 byte 97
 byte 99
 byte 116
 byte 111
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_s1ts13_696ddd97_threads_stacksize_L000040_617_L000618 ' <symbol:617>
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 115
 byte 105
 byte 122
 byte 101
 byte 32
 byte 109
 byte 117
 byte 115
 byte 116
 byte 32
 byte 98
 byte 101
 byte 32
 byte 112
 byte 111
 byte 115
 byte 105
 byte 116
 byte 105
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s1tse_696ddd97_threads_destroy_channel_L000019_607_L000608 ' <symbol:607>
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 100
 byte 101
 byte 115
 byte 116
 byte 114
 byte 111
 byte 121
 byte 101
 byte 100
 byte 32
 byte 119
 byte 104
 byte 105
 byte 108
 byte 101
 byte 32
 byte 119
 byte 97
 byte 105
 byte 116
 byte 105
 byte 110
 byte 103
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 115
 byte 101
 byte 110
 byte 100
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_s1tse_696ddd97_threads_destroy_channel_L000019_598_L000599 ' <symbol:598>
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 100
 byte 101
 byte 115
 byte 116
 byte 114
 byte 111
 byte 121
 byte 101
 byte 100
 byte 32
 byte 119
 byte 104
 byte 105
 byte 108
 byte 101
 byte 32
 byte 119
 byte 97
 byte 105
 byte 116
 byte 105
 byte 110
 byte 103
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 114
 byte 101
 byte 99
 byte 101
 byte 105
 byte 118
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_s1tsd_696ddd97_threads_create_channel_L000018_589_L000590 ' <symbol:589>
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 97
 byte 108
 byte 114
 byte 101
 byte 97
 byte 100
 byte 121
 byte 32
 byte 101
 byte 120
 byte 105
 byte 115
 byte 116
 byte 115
 byte 0

 alignl ' align long
C_s1tsc_696ddd97_threads_receive_L000017_570_L000571 ' <symbol:570>
 byte 114
 byte 101
 byte 99
 byte 101
 byte 105
 byte 118
 byte 101
 byte 114
 byte 58
 byte 32
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 100
 byte 111
 byte 101
 byte 115
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 101
 byte 120
 byte 105
 byte 115
 byte 116
 byte 0

 alignl ' align long
C_s1tsc_696ddd97_threads_receive_L000017_568_L000569 ' <symbol:568>
 byte 110
 byte 111
 byte 32
 byte 115
 byte 101
 byte 110
 byte 100
 byte 101
 byte 114
 byte 115
 byte 32
 byte 119
 byte 97
 byte 105
 byte 116
 byte 105
 byte 110
 byte 103
 byte 32
 byte 111
 byte 110
 byte 32
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_s1ts10_696ddd97_threads_update_L000037_553_L000554 ' <symbol:553>
 byte 117
 byte 112
 byte 100
 byte 97
 byte 116
 byte 101
 byte 58
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 101
 byte 110
 byte 111
 byte 117
 byte 103
 byte 104
 byte 32
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 32
 byte 111
 byte 114
 byte 32
 byte 117
 byte 110
 byte 115
 byte 117
 byte 112
 byte 112
 byte 111
 byte 114
 byte 116
 byte 101
 byte 100
 byte 32
 byte 116
 byte 121
 byte 112
 byte 101
 byte 10
 byte 0

 alignl ' align long
C_s1ts10_696ddd97_threads_update_L000037_539_L000540 ' <symbol:539>
 byte 117
 byte 112
 byte 100
 byte 97
 byte 116
 byte 101
 byte 58
 byte 32
 byte 107
 byte 101
 byte 121
 byte 32
 byte 109
 byte 117
 byte 115
 byte 116
 byte 32
 byte 98
 byte 101
 byte 32
 byte 97
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s1ts10_696ddd97_threads_update_L000037_535_L000536 ' <symbol:535>
 byte 117
 byte 112
 byte 100
 byte 97
 byte 116
 byte 101
 byte 58
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 109
 byte 117
 byte 115
 byte 116
 byte 32
 byte 98
 byte 101
 byte 32
 byte 97
 byte 32
 byte 115
 byte 105
 byte 109
 byte 112
 byte 108
 byte 101
 byte 32
 byte 116
 byte 121
 byte 112
 byte 101
 byte 0

 alignl ' align long
C_s1ts10_696ddd97_threads_update_L000037_531_L000532 ' <symbol:531>
 byte 117
 byte 112
 byte 100
 byte 97
 byte 116
 byte 101
 byte 58
 byte 32
 byte 105
 byte 110
 byte 99
 byte 111
 byte 114
 byte 114
 byte 101
 byte 99
 byte 116
 byte 32
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 32
 byte 111
 byte 102
 byte 32
 byte 97
 byte 114
 byte 103
 byte 117
 byte 109
 byte 101
 byte 110
 byte 116
 byte 115
 byte 0

 alignl ' align long
C_s1ts11_696ddd97_threads_export_L000038_526_L000527 ' <symbol:526>
 byte 101
 byte 120
 byte 112
 byte 111
 byte 114
 byte 116
 byte 58
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 101
 byte 110
 byte 111
 byte 117
 byte 103
 byte 104
 byte 32
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 32
 byte 111
 byte 114
 byte 32
 byte 117
 byte 110
 byte 115
 byte 117
 byte 112
 byte 112
 byte 111
 byte 114
 byte 116
 byte 101
 byte 100
 byte 32
 byte 116
 byte 121
 byte 112
 byte 101
 byte 10
 byte 0

 alignl ' align long
C_s1ts11_696ddd97_threads_export_L000038_511_L000512 ' <symbol:511>
 byte 101
 byte 120
 byte 112
 byte 111
 byte 114
 byte 116
 byte 58
 byte 32
 byte 107
 byte 101
 byte 121
 byte 32
 byte 37
 byte 115
 byte 32
 byte 100
 byte 111
 byte 101
 byte 115
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 101
 byte 120
 byte 105
 byte 115
 byte 116
 byte 10
 byte 0

 alignl ' align long
C_s1ts11_696ddd97_threads_export_L000038_496_L000497 ' <symbol:496>
 byte 101
 byte 120
 byte 112
 byte 111
 byte 114
 byte 116
 byte 58
 byte 32
 byte 107
 byte 101
 byte 121
 byte 32
 byte 109
 byte 117
 byte 115
 byte 116
 byte 32
 byte 98
 byte 101
 byte 32
 byte 97
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s1ts11_696ddd97_threads_export_L000038_492_L000493 ' <symbol:492>
 byte 101
 byte 120
 byte 112
 byte 111
 byte 114
 byte 116
 byte 58
 byte 32
 byte 105
 byte 110
 byte 99
 byte 111
 byte 114
 byte 114
 byte 101
 byte 99
 byte 116
 byte 32
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 32
 byte 111
 byte 102
 byte 32
 byte 97
 byte 114
 byte 103
 byte 117
 byte 109
 byte 101
 byte 110
 byte 116
 byte 115
 byte 0

 alignl ' align long
C_s1tsv_696ddd97_threads_shared_L000036_487_L000488 ' <symbol:487>
 byte 115
 byte 104
 byte 97
 byte 114
 byte 101
 byte 100
 byte 58
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 101
 byte 110
 byte 111
 byte 117
 byte 103
 byte 104
 byte 32
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 32
 byte 111
 byte 114
 byte 32
 byte 117
 byte 110
 byte 115
 byte 117
 byte 112
 byte 112
 byte 111
 byte 114
 byte 116
 byte 101
 byte 100
 byte 32
 byte 116
 byte 121
 byte 112
 byte 101
 byte 10
 byte 0

 alignl ' align long
C_s1tsv_696ddd97_threads_shared_L000036_481_L000482 ' <symbol:481>
 byte 115
 byte 104
 byte 97
 byte 114
 byte 101
 byte 100
 byte 58
 byte 32
 byte 107
 byte 101
 byte 121
 byte 32
 byte 37
 byte 115
 byte 32
 byte 100
 byte 111
 byte 101
 byte 115
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 101
 byte 120
 byte 105
 byte 115
 byte 116
 byte 10
 byte 0

 alignl ' align long
C_s1tsv_696ddd97_threads_shared_L000036_471_L000472 ' <symbol:471>
 byte 46
 byte 0

 alignl ' align long
C_s1tsv_696ddd97_threads_shared_L000036_462_L000463 ' <symbol:462>
 byte 115
 byte 104
 byte 97
 byte 114
 byte 101
 byte 100
 byte 58
 byte 32
 byte 107
 byte 101
 byte 121
 byte 32
 byte 109
 byte 117
 byte 115
 byte 116
 byte 32
 byte 98
 byte 101
 byte 32
 byte 97
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s1tsv_696ddd97_threads_shared_L000036_458_L000459 ' <symbol:458>
 byte 115
 byte 104
 byte 97
 byte 114
 byte 101
 byte 100
 byte 58
 byte 32
 byte 105
 byte 110
 byte 99
 byte 111
 byte 114
 byte 114
 byte 101
 byte 99
 byte 116
 byte 32
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 32
 byte 111
 byte 102
 byte 32
 byte 97
 byte 114
 byte 103
 byte 117
 byte 109
 byte 101
 byte 110
 byte 116
 byte 115
 byte 0

 alignl ' align long
C_s1tsr_696ddd97_threads_wait_for_L000032_388_L000389 ' <symbol:388>
 byte 119
 byte 97
 byte 105
 byte 116
 byte 95
 byte 102
 byte 111
 byte 114
 byte 58
 byte 32
 byte 105
 byte 110
 byte 99
 byte 111
 byte 114
 byte 114
 byte 101
 byte 99
 byte 116
 byte 32
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 32
 byte 111
 byte 102
 byte 32
 byte 97
 byte 114
 byte 103
 byte 117
 byte 109
 byte 101
 byte 110
 byte 116
 byte 115
 byte 0

 alignl ' align long
C_s1tsi_696ddd97_threads_send_async_L000023_364_L000365 ' <symbol:364>
 byte 110
 byte 111
 byte 32
 byte 114
 byte 101
 byte 99
 byte 101
 byte 105
 byte 118
 byte 101
 byte 114
 byte 115
 byte 32
 byte 119
 byte 97
 byte 105
 byte 116
 byte 105
 byte 110
 byte 103
 byte 32
 byte 111
 byte 110
 byte 32
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_s1tsb_696ddd97_threads_send_L000016_341_L000342 ' <symbol:341>
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 100
 byte 111
 byte 101
 byte 115
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 101
 byte 120
 byte 105
 byte 115
 byte 116
 byte 0

 alignl ' align long
C_s1ts9_696ddd97_threads_create_newproc_L000014_328_L000329 ' <symbol:328>
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 117
 byte 115
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 116
 byte 111
 byte 32
 byte 99
 byte 114
 byte 101
 byte 97
 byte 116
 byte 101
 byte 32
 byte 97
 byte 32
 byte 110
 byte 101
 byte 119
 byte 32
 byte 112
 byte 114
 byte 111
 byte 99
 byte 101
 byte 115
 byte 115
 byte 0

 alignl ' align long
C_s1ts9_696ddd97_threads_create_newproc_L000014_324_L000325 ' <symbol:324>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 100
 byte 117
 byte 109
 byte 112
 byte 105
 byte 110
 byte 103
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 116
 byte 111
 byte 32
 byte 98
 byte 105
 byte 110
 byte 97
 byte 114
 byte 121
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s1tsf_696ddd97_threads_set_numworkers_L000020_316_L000317 ' <symbol:316>
 byte 102
 byte 97
 byte 105
 byte 108
 byte 101
 byte 100
 byte 32
 byte 116
 byte 111
 byte 32
 byte 99
 byte 114
 byte 101
 byte 97
 byte 116
 byte 101
 byte 32
 byte 119
 byte 111
 byte 114
 byte 107
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_s1tsf_696ddd97_threads_set_numworkers_L000020_311_L000312 ' <symbol:311>
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 32
 byte 111
 byte 102
 byte 32
 byte 119
 byte 111
 byte 114
 byte 107
 byte 101
 byte 114
 byte 115
 byte 32
 byte 109
 byte 117
 byte 115
 byte 116
 byte 32
 byte 98
 byte 101
 byte 32
 byte 122
 byte 101
 byte 114
 byte 111
 byte 32
 byte 111
 byte 114
 byte 32
 byte 112
 byte 111
 byte 115
 byte 105
 byte 116
 byte 105
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s1tsh_696ddd97_threads_recycle_set_L000022_299_L000300 ' <symbol:299>
 byte 114
 byte 101
 byte 99
 byte 121
 byte 99
 byte 108
 byte 101
 byte 32
 byte 108
 byte 105
 byte 109
 byte 105
 byte 116
 byte 32
 byte 109
 byte 117
 byte 115
 byte 116
 byte 32
 byte 98
 byte 101
 byte 32
 byte 122
 byte 101
 byte 114
 byte 111
 byte 32
 byte 111
 byte 114
 byte 32
 byte 112
 byte 111
 byte 115
 byte 105
 byte 116
 byte 105
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_296_L000297 ' <symbol:296>
 byte 102
 byte 97
 byte 105
 byte 108
 byte 101
 byte 100
 byte 32
 byte 116
 byte 111
 byte 32
 byte 115
 byte 101
 byte 116
 byte 32
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_s1ts3g_696ddd97_luathread_copyupvalues_L000272_289_L000290 ' <symbol:289>
 byte 102
 byte 97
 byte 105
 byte 108
 byte 101
 byte 100
 byte 32
 byte 116
 byte 111
 byte 32
 byte 99
 byte 111
 byte 112
 byte 121
 byte 32
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 111
 byte 102
 byte 32
 byte 117
 byte 110
 byte 115
 byte 117
 byte 112
 byte 112
 byte 111
 byte 114
 byte 116
 byte 101
 byte 100
 byte 32
 byte 116
 byte 121
 byte 112
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_s1ts3e_696ddd97_func_dump_L000266_270_L000271 ' <symbol:270>
 byte 117
 byte 110
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 116
 byte 111
 byte 32
 byte 100
 byte 117
 byte 109
 byte 112
 byte 32
 byte 103
 byte 105
 byte 118
 byte 101
 byte 110
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_s1ts3b_696ddd97_writer_L000228_240_L000241 ' <symbol:240>
 byte 67
 byte 65
 byte 78
 byte 78
 byte 79
 byte 84
 byte 32
 byte 82
 byte 69
 byte 65
 byte 76
 byte 76
 byte 79
 byte 67
 byte 65
 byte 84
 byte 69
 byte 32
 byte 67
 byte 79
 byte 68
 byte 69
 byte 32
 byte 66
 byte 85
 byte 70
 byte 70
 byte 69
 byte 82
 byte 10
 byte 0

 alignl ' align long
C_s1ts3b_696ddd97_writer_L000228_234_L000235 ' <symbol:234>
 byte 67
 byte 65
 byte 78
 byte 78
 byte 79
 byte 84
 byte 32
 byte 65
 byte 76
 byte 76
 byte 79
 byte 67
 byte 65
 byte 84
 byte 69
 byte 32
 byte 67
 byte 79
 byte 68
 byte 69
 byte 32
 byte 66
 byte 85
 byte 70
 byte 70
 byte 69
 byte 82
 byte 10
 byte 0

 alignl ' align long
C_s1ts33_696ddd97_luathread_new_L000215_221_L000222 ' <symbol:221>
 byte 99
 byte 111
 byte 114
 byte 111
 byte 117
 byte 116
 byte 105
 byte 110
 byte 101
 byte 0

 alignl ' align long
C_s1ts33_696ddd97_luathread_new_L000215_219_L000220 ' <symbol:219>
 byte 112
 byte 114
 byte 111
 byte 112
 byte 101
 byte 108
 byte 108
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_s1ts33_696ddd97_luathread_new_L000215_217_L000218 ' <symbol:217>
 byte 116
 byte 104
 byte 114
 byte 101
 byte 97
 byte 100
 byte 115
 byte 0

 alignl ' align long
C_s1ts31_696ddd97_luathread_getself_L000211_213_L000214 ' <symbol:213>
 byte 76
 byte 85
 byte 65
 byte 84
 byte 72
 byte 82
 byte 69
 byte 65
 byte 68
 byte 95
 byte 76
 byte 80
 byte 95
 byte 85
 byte 68
 byte 65
 byte 84
 byte 65
 byte 0

 alignl ' align long
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_206_L000207 ' <symbol:206>
 byte 102
 byte 97
 byte 105
 byte 108
 byte 101
 byte 100
 byte 32
 byte 116
 byte 111
 byte 32
 byte 115
 byte 101
 byte 110
 byte 100
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 111
 byte 102
 byte 32
 byte 117
 byte 110
 byte 115
 byte 117
 byte 112
 byte 112
 byte 111
 byte 114
 byte 116
 byte 101
 byte 100
 byte 32
 byte 116
 byte 121
 byte 112
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_204_L000205 ' <symbol:204>
 byte 102
 byte 97
 byte 105
 byte 108
 byte 101
 byte 100
 byte 32
 byte 116
 byte 111
 byte 32
 byte 114
 byte 101
 byte 99
 byte 101
 byte 105
 byte 118
 byte 101
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 111
 byte 102
 byte 32
 byte 117
 byte 110
 byte 115
 byte 117
 byte 112
 byte 112
 byte 111
 byte 114
 byte 116
 byte 101
 byte 100
 byte 32
 byte 116
 byte 121
 byte 112
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_171_L000172 ' <symbol:171>
 byte 110
 byte 111
 byte 116
 byte 32
 byte 101
 byte 110
 byte 111
 byte 117
 byte 103
 byte 104
 byte 32
 byte 115
 byte 112
 byte 97
 byte 99
 byte 101
 byte 32
 byte 105
 byte 110
 byte 32
 byte 116
 byte 104
 byte 101
 byte 32
 byte 114
 byte 101
 byte 99
 byte 101
 byte 105
 byte 118
 byte 101
 byte 114
 byte 39
 byte 115
 byte 32
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s1ts2o_696ddd97_luathread_copyvalues_L000165_169_L000170 ' <symbol:169>
 byte 110
 byte 111
 byte 116
 byte 32
 byte 101
 byte 110
 byte 111
 byte 117
 byte 103
 byte 104
 byte 32
 byte 115
 byte 112
 byte 97
 byte 99
 byte 101
 byte 32
 byte 105
 byte 110
 byte 32
 byte 116
 byte 104
 byte 101
 byte 32
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s1ts2j_696ddd97_channel_create_L000137_139_L000140 ' <symbol:139>
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 116
 byte 98
 byte 0

 alignl ' align long
C_s1ts2i_696ddd97_127_L000128 ' <symbol:127>
 byte 97
 byte 103
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_s1ts2h_696ddd97_125_L000126 ' <symbol:125>
 byte 97
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_s1ts2g_696ddd97_123_L000124 ' <symbol:123>
 byte 103
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_s1ts2f_696ddd97_121_L000122 ' <symbol:121>
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_s1ts2e_696ddd97_119_L000120 ' <symbol:119>
 byte 100
 byte 101
 byte 115
 byte 116
 byte 114
 byte 111
 byte 121
 byte 0

 alignl ' align long
C_s1ts2d_696ddd97_117_L000118 ' <symbol:117>
 byte 99
 byte 111
 byte 110
 byte 100
 byte 105
 byte 116
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_s1ts2c_696ddd97_115_L000116 ' <symbol:115>
 byte 109
 byte 117
 byte 116
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_s1ts2b_696ddd97_113_L000114 ' <symbol:113>
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 0

 alignl ' align long
C_s1ts2a_696ddd97_111_L000112 ' <symbol:111>
 byte 119
 byte 111
 byte 114
 byte 107
 byte 101
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_s1ts29_696ddd97_109_L000110 ' <symbol:109>
 byte 110
 byte 101
 byte 119
 byte 0

 alignl ' align long
C_s1ts28_696ddd97_107_L000108 ' <symbol:107>
 byte 103
 byte 99
 byte 0

 alignl ' align long
C_s1ts27_696ddd97_105_L000106 ' <symbol:105>
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_s1ts26_696ddd97_103_L000104 ' <symbol:103>
 byte 102
 byte 97
 byte 99
 byte 116
 byte 111
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_s1ts25_696ddd97_101_L000102 ' <symbol:101>
 byte 102
 byte 97
 byte 99
 byte 116
 byte 111
 byte 114
 byte 105
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_s1ts24_696ddd97_99_L000100 ' <symbol:99>
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 115
 byte 105
 byte 122
 byte 101
 byte 0

 alignl ' align long
C_s1ts23_696ddd97_97_L000098 ' <symbol:97>
 byte 115
 byte 98
 byte 114
 byte 107
 byte 0

 alignl ' align long
C_s1ts22_696ddd97_95_L000096 ' <symbol:95>
 byte 111
 byte 117
 byte 116
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_s1ts21_696ddd97_93_L000094 ' <symbol:93>
 byte 112
 byte 114
 byte 105
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_s1ts20_696ddd97_91_L000092 ' <symbol:91>
 byte 109
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_s1ts1v_696ddd97_89_L000090 ' <symbol:89>
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_s1ts1u_696ddd97_87_L000088 ' <symbol:87>
 byte 114
 byte 101
 byte 99
 byte 101
 byte 105
 byte 118
 byte 101
 byte 95
 byte 97
 byte 115
 byte 121
 byte 110
 byte 99
 byte 0

 alignl ' align long
C_s1ts1t_696ddd97_85_L000086 ' <symbol:85>
 byte 115
 byte 101
 byte 110
 byte 100
 byte 95
 byte 97
 byte 115
 byte 121
 byte 110
 byte 99
 byte 0

 alignl ' align long
C_s1ts1s_696ddd97_83_L000084 ' <symbol:83>
 byte 101
 byte 120
 byte 112
 byte 111
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_s1ts1r_696ddd97_81_L000082 ' <symbol:81>
 byte 117
 byte 112
 byte 100
 byte 97
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_s1ts1q_696ddd97_79_L000080 ' <symbol:79>
 byte 115
 byte 104
 byte 97
 byte 114
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_s1ts1p_696ddd97_77_L000078 ' <symbol:77>
 byte 114
 byte 101
 byte 110
 byte 100
 byte 101
 byte 122
 byte 118
 byte 111
 byte 117
 byte 115
 byte 0

 alignl ' align long
C_s1ts1o_696ddd97_75_L000076 ' <symbol:75>
 byte 98
 byte 114
 byte 111
 byte 97
 byte 100
 byte 99
 byte 97
 byte 115
 byte 116
 byte 0

 alignl ' align long
C_s1ts1n_696ddd97_73_L000074 ' <symbol:73>
 byte 115
 byte 105
 byte 103
 byte 110
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_s1ts1m_696ddd97_71_L000072 ' <symbol:71>
 byte 119
 byte 97
 byte 105
 byte 116
 byte 95
 byte 102
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_s1ts1l_696ddd97_69_L000070 ' <symbol:69>
 byte 117
 byte 110
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s1ts1k_696ddd97_67_L000068 ' <symbol:67>
 byte 116
 byte 114
 byte 121
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s1ts1j_696ddd97_65_L000066 ' <symbol:65>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s1ts1i_696ddd97_63_L000064 ' <symbol:63>
 byte 114
 byte 101
 byte 99
 byte 121
 byte 99
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s1ts1h_696ddd97_61_L000062 ' <symbol:61>
 byte 103
 byte 101
 byte 116
 byte 110
 byte 117
 byte 109
 byte 119
 byte 111
 byte 114
 byte 107
 byte 101
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_s1ts1g_696ddd97_59_L000060 ' <symbol:59>
 byte 115
 byte 101
 byte 116
 byte 110
 byte 117
 byte 109
 byte 119
 byte 111
 byte 114
 byte 107
 byte 101
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_s1ts1f_696ddd97_57_L000058 ' <symbol:57>
 byte 100
 byte 101
 byte 108
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 0

 alignl ' align long
C_s1ts1e_696ddd97_55_L000056 ' <symbol:55>
 byte 110
 byte 101
 byte 119
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 0

 alignl ' align long
C_s1ts1d_696ddd97_53_L000054 ' <symbol:53>
 byte 114
 byte 101
 byte 99
 byte 101
 byte 105
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s1ts1c_696ddd97_51_L000052 ' <symbol:51>
 byte 115
 byte 101
 byte 110
 byte 100
 byte 0

 alignl ' align long
C_s1ts1b_696ddd97_49_L000050 ' <symbol:49>
 byte 119
 byte 97
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_s1ts1a_696ddd97_47_L000048 ' <symbol:47>
 byte 110
 byte 101
 byte 119
 byte 112
 byte 114
 byte 111
 byte 99
 byte 0

' Catalina Code

DAT ' code segment
' end
