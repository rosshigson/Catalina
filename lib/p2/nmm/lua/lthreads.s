' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s85g_696de09b_mutex_channel_list_L000005 ' <symbol:mutex_channel_list>
 long 0
 long $0
 long $0
 long 0

 alignl ' align long
C_s85g1_696de09b_mutex_recycle_list_L000006 ' <symbol:mutex_recycle_list>
 long 0
 long $0
 long $0
 long 0

 alignl ' align long
C_s85g3_696de09b_recyclemax_L000008 ' <symbol:recyclemax>
 long 0

' Catalina Export stacksize

 alignl ' align long
C_stacksize ' <symbol:stacksize>
 long 4000

 alignl ' align long
C_s85g4_696de09b_chanls_L000009 ' <symbol:chanls>
 long $0

' Catalina Export cond_mainls_sendrecv

 alignl ' align long
C_cond_mainls_sendrecv ' <symbol:cond_mainls_sendrecv>
 long 0
 long $0

 alignl ' align long
C_s85g6_696de09b_mutex_mainls_L000011 ' <symbol:mutex_mainls>
 long 0
 long $0
 long $0
 long 0

 alignl ' align long
C_s85g7_696de09b_mutex_memopt_L000012 ' <symbol:mutex_memopt>
 long 0
 long $0
 long $0
 long 0

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s85g19_696de09b_luathread_funcs_L000046 ' <symbol:luathread_funcs>
 long @C_s85g1a_696de09b_47_L000048
 long @C_s85g9_696de09b_threads_create_newproc_L000014
 long @C_s85g1b_696de09b_49_L000050
 long @C_s85ga_696de09b_threads_wait_L000015
 long @C_s85g1c_696de09b_51_L000052
 long @C_s85gb_696de09b_threads_send_L000016
 long @C_s85g1d_696de09b_53_L000054
 long @C_s85gc_696de09b_threads_receive_L000017
 long @C_s85g1e_696de09b_55_L000056
 long @C_s85gd_696de09b_threads_create_channel_L000018
 long @C_s85g1f_696de09b_57_L000058
 long @C_s85ge_696de09b_threads_destroy_channel_L000019
 long @C_s85g1g_696de09b_59_L000060
 long @C_s85gf_696de09b_threads_set_numworkers_L000020
 long @C_s85g1h_696de09b_61_L000062
 long @C_s85gg_696de09b_threads_get_numworkers_L000021
 long @C_s85g1i_696de09b_63_L000064
 long @C_s85gh_696de09b_threads_recycle_set_L000022
 long @C_s85g1j_696de09b_65_L000066
 long @C_s85go_696de09b_threads_lock_L000029
 long @C_s85g1k_696de09b_67_L000068
 long @C_s85gq_696de09b_threads_trylock_L000031
 long @C_s85g1l_696de09b_69_L000070
 long @C_s85gp_696de09b_threads_unlock_L000030
 long @C_s85g1m_696de09b_71_L000072
 long @C_s85gr_696de09b_threads_wait_for_L000032
 long @C_s85g1n_696de09b_73_L000074
 long @C_s85gs_696de09b_threads_signal_L000033
 long @C_s85g1o_696de09b_75_L000076
 long @C_s85gt_696de09b_threads_broadcast_L000034
 long @C_s85g1p_696de09b_77_L000078
 long @C_s85gu_696de09b_threads_rendezvous_L000035
 long @C_s85g1q_696de09b_79_L000080
 long @C_s85gv_696de09b_threads_shared_L000036
 long @C_s85g1r_696de09b_81_L000082
 long @C_s85g10_696de09b_threads_update_L000037
 long @C_s85g1s_696de09b_83_L000084
 long @C_s85g11_696de09b_threads_export_L000038
 long @C_s85g1t_696de09b_85_L000086
 long @C_s85gi_696de09b_threads_send_async_L000023
 long @C_s85g1u_696de09b_87_L000088
 long @C_s85gj_696de09b_threads_receive_async_L000024
 long @C_s85g1v_696de09b_89_L000090
 long @C_s85gm_696de09b_threads_sleep_L000027
 long @C_s85g20_696de09b_91_L000092
 long @C_s85gn_696de09b_threads_msleep_L000028
 long @C_s85g21_696de09b_93_L000094
 long @C_s85gk_696de09b_threads_print_L000025
 long @C_s85g22_696de09b_95_L000096
 long @C_s85gl_696de09b_threads_print_raw_L000026
 long @C_s85g23_696de09b_97_L000098
 long @C_s85g12_696de09b_threads_sbrk_L000039
 long @C_s85g24_696de09b_99_L000100
 long @C_s85g13_696de09b_threads_stacksize_L000040
 long @C_s85g25_696de09b_101_L000102
 long @C_s85g16_696de09b_threads_factories_L000043
 long @C_s85g26_696de09b_103_L000104
 long @C_s85g14_696de09b_threads_factory_L000041
 long @C_s85g27_696de09b_105_L000106
 long @C_s85g15_696de09b_threads_version_L000042
 long @C_s85g28_696de09b_107_L000108
 long @C_s85g17_696de09b_threads_gc_L000044
 long @C_s85g29_696de09b_109_L000110
 long @C_s85g9_696de09b_threads_create_newproc_L000014
 long @C_s85g2a_696de09b_111_L000112
 long @C_s85gf_696de09b_threads_set_numworkers_L000020
 long @C_s85g2b_696de09b_113_L000114
 long @C_s85gd_696de09b_threads_create_channel_L000018
 long @C_s85g2c_696de09b_115_L000116
 long @C_s85gd_696de09b_threads_create_channel_L000018
 long @C_s85g2d_696de09b_117_L000118
 long @C_s85gd_696de09b_threads_create_channel_L000018
 long @C_s85g2e_696de09b_119_L000120
 long @C_s85ge_696de09b_threads_destroy_channel_L000019
 long @C_s85g2f_696de09b_121_L000122
 long @C_s85gb_696de09b_threads_send_L000016
 long @C_s85g2g_696de09b_123_L000124
 long @C_s85gc_696de09b_threads_receive_L000017
 long @C_s85g2h_696de09b_125_L000126
 long @C_s85gi_696de09b_threads_send_async_L000023
 long @C_s85g2i_696de09b_127_L000128
 long @C_s85gj_696de09b_threads_receive_async_L000024
 long $0
 long $0

' Catalina Export list_insert

' Catalina Code

DAT ' code segment

 alignl ' align long
C_list_insert ' <symbol:list_insert>
 calld PA,#PSHM
 long $500000 ' save registers
 rdlong r22, r3 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_list_insert_130  ' NEU4
 wrlong r2, r3 ' ASGNP4 reg reg
 jmp #\@C_list_insert_131 ' JUMPV addrg
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
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_list_insert_129 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export list_remove

 alignl ' align long
C_list_remove ' <symbol:list_remove>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $500000 ' save registers
 rdlong r22, r2 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_list_remove_133 ' EQU4
 rdlong r22, r2 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
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
 jmp #\@C_list_remove_132 ' JUMPV addrg
C_list_remove_133
 mov r0, ##0 ' RET con
C_list_remove_132
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export list_count

 alignl ' align long
C_list_count ' <symbol:list_count>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_list_count_135 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export list_init

 alignl ' align long
C_list_init ' <symbol:list_init>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##0 ' reg <- con
 wrlong r22, r2 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_list_init_136 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s85g2j_696de09b_channel_create_L000137 ' <symbol:channel_create>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_s85g2j_696de09b_channel_create_L000137_139_L000140 ' reg ARG ADDRG
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, #72 ' reg ARG coni
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_newuserdatauv
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_init ' CALL addrg
 mov r2, r21
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_init ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r3, r21
 adds r3, #24 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_mutex_init
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r3, r21
 adds r3, #40 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_mutex_init
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r3, r21
 adds r3, #56 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_cond_init
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r3, r21
 adds r3, #64 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_cond_init
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
' C_s85g2j_696de09b_channel_create_L000137_138 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g2l_696de09b_channel_unlocked_get_L000141 ' <symbol:channel_unlocked_get>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_s85g2j_696de09b_channel_create_L000137_139_L000140 ' reg ARG ADDRG
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##-1 ' reg ARG con
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, ##-3 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_s85g2l_696de09b_channel_unlocked_get_L000141_142 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s85g2m_696de09b_channel_locked_get_L000143 ' <symbol:channel_locked_get>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 cmps r21,  #0 wz
 if_z jmp #\C_s85g2m_696de09b_channel_locked_get_L000143_152 ' EQI4
 jmp #\@C_s85g2m_696de09b_channel_locked_get_L000143_148 ' JUMPV addrg
C_s85g2m_696de09b_channel_locked_get_L000143_147
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov r3, r19
 adds r3, #56 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
C_s85g2m_696de09b_channel_locked_get_L000143_148
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85g2l_696de09b_channel_unlocked_get_L000141 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85g2m_696de09b_channel_locked_get_L000143_150 ' EQU4
 mov r2, r19
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85g2m_696de09b_channel_locked_get_L000143_147 ' NEI4
C_s85g2m_696de09b_channel_locked_get_L000143_150
 jmp #\@C_s85g2m_696de09b_channel_locked_get_L000143_146 ' JUMPV addrg
C_s85g2m_696de09b_channel_locked_get_L000143_151
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
C_s85g2m_696de09b_channel_locked_get_L000143_152
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85g2l_696de09b_channel_unlocked_get_L000141 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85g2m_696de09b_channel_locked_get_L000143_154 ' EQU4
 mov r2, r19
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85g2m_696de09b_channel_locked_get_L000143_151 ' NEI4
C_s85g2m_696de09b_channel_locked_get_L000143_154
C_s85g2m_696de09b_channel_locked_get_L000143_146
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
' C_s85g2m_696de09b_channel_locked_get_L000143_144 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luathread_unlock_channel

 alignl ' align long
C_luathread_unlock_channel ' <symbol:luathread_unlock_channel>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, r23
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r23
 adds r2, #56 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_signal ' CALL addrg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
' C_luathread_unlock_channel_155 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luathread_recycle_insert

 alignl ' align long
C_luathread_recycle_insert ' <symbol:luathread_recycle_insert>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_s85g1_696de09b_mutex_recycle_list_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_s85g2_696de09b_recycle_list_L000007 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_count ' CALL addrg
 mov r20, ##@C_s85g3_696de09b_recyclemax_L000008
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 cmps r0, r20 wcz
 if_b jmp #\C_luathread_recycle_insert_157 ' LTI4
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_close ' CALL addrg
 jmp #\@C_luathread_recycle_insert_158 ' JUMPV addrg
C_luathread_recycle_insert_157
 mov r2, #0 ' reg ARG coni
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g2_696de09b_recycle_list_L000007 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_list_insert
 add SP, #4 ' CALL addrg
C_luathread_recycle_insert_158
 mov r2, ##@C_s85g1_696de09b_mutex_recycle_list_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
' C_luathread_recycle_insert_156 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luathread_queue_sender

 alignl ' align long
C_luathread_queue_sender ' <symbol:luathread_queue_sender>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_list_insert
 add SP, #4 ' CALL addrg
' C_luathread_queue_sender_159 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luathread_queue_receiver

 alignl ' align long
C_luathread_queue_receiver ' <symbol:luathread_queue_receiver>
 calld PA,#NEWF
 calld PA,#PSHM
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
 calld PA,#CALA
 long @C_list_insert
 add SP, #4 ' CALL addrg
' C_luathread_queue_receiver_160 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g2n_696de09b_luathread_loadbuffer_L000161 ' <symbol:luathread_loadbuffer>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 rdlong r22, r21 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaL__loadbufferx
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_s85g2n_696de09b_luathread_loadbuffer_L000161_163 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 rdlong r4, r21 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 rdlong r2, r21 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_close ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_s85g2n_696de09b_luathread_loadbuffer_L000161_163
' C_s85g2n_696de09b_luathread_loadbuffer_L000161_162 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s85g2o_696de09b_luathread_copyvalues_L000165 ' <symbol:luathread_copyvalues>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_checkstack
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85g2o_696de09b_luathread_copyvalues_L000165_167 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85g2o_696de09b_luathread_copyvalues_L000165_169_L000170 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85g2o_696de09b_luathread_copyvalues_L000165_171_L000172 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_166 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_167
 mov r19, #2 ' reg <- coni
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_176 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_173
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 if_b jmp #\C_s85g2o_696de09b_luathread_copyvalues_L000165_177 ' LTI4
 cmps r15,  #5 wcz
 if_a jmp #\C_s85g2o_696de09b_luathread_copyvalues_L000165_177 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s85g2o_696de09b_luathread_copyvalues_L000165_208_L000210 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s85g2o_696de09b_luathread_copyvalues_L000165_208_L000210 ' <symbol:208>
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165_185
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165_180
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165_177
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165_181
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165_184
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165_186

' Catalina Code

DAT ' code segment
C_s85g2o_696de09b_luathread_copyvalues_L000165_180
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_178 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_181
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85g2o_696de09b_luathread_copyvalues_L000165_182 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 calld PA,#INFL ' CVFI4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_178 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_182
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_178 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_184
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_178 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_185
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_178 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_186
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_188 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_187
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #4 wz
 if_nz jmp #\C_s85g2o_696de09b_luathread_copyvalues_L000165_190 ' NEI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r13,  #0 wcz
 if_b jmp #\C_s85g2o_696de09b_luathread_copyvalues_L000165_192 ' LTI4
 cmps r13,  #4 wcz
 if_a jmp #\C_s85g2o_696de09b_luathread_copyvalues_L000165_192 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s85g2o_696de09b_luathread_copyvalues_L000165_201_L000203 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s85g2o_696de09b_luathread_copyvalues_L000165_201_L000203 ' <symbol:201>
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165_200
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165_195
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165_192
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165_196
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165_199

' Catalina Code

DAT ' code segment
C_s85g2o_696de09b_luathread_copyvalues_L000165_195
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, ##-3 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_193 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_196
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85g2o_696de09b_luathread_copyvalues_L000165_197 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 calld PA,#INFL ' CVFI4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_198 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_197
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_198
 mov r2, ##-3 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_193 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_199
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-3 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_193 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_200
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##-3 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_193 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_192
 mov r2, ##-2 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_193
C_s85g2o_696de09b_luathread_copyvalues_L000165_190
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_188
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_next
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85g2o_696de09b_luathread_copyvalues_L000165_187 ' NEI4
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_178 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_177
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g2o_696de09b_luathread_copyvalues_L000165_204_L000205 ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g2o_696de09b_luathread_copyvalues_L000165_206_L000207 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_s85g2o_696de09b_luathread_copyvalues_L000165_166 ' JUMPV addrg
C_s85g2o_696de09b_luathread_copyvalues_L000165_178
' C_s85g2o_696de09b_luathread_copyvalues_L000165_174 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s85g2o_696de09b_luathread_copyvalues_L000165_176
 cmps r19, r17 wcz
 if_be jmp #\C_s85g2o_696de09b_luathread_copyvalues_L000165_173 ' LEI4
 mov r0, #1 ' reg <- coni
C_s85g2o_696de09b_luathread_copyvalues_L000165_166
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s85g31_696de09b_luathread_getself_L000211 ' <symbol:luathread_getself>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_s85g31_696de09b_luathread_getself_L000211_213_L000214 ' reg ARG ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_s85g31_696de09b_luathread_getself_L000211_212 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s85g33_696de09b_luathread_new_L000215 ' <symbol:luathread_new>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_luaL__newstate ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, #20 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_newuserdatauv
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_s85g31_696de09b_luathread_getself_L000211_213_L000214 ' reg ARG ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85g8_696de09b_luathread_openlualibs_L000013 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_s85g18_696de09b_luathread_loadlib_L000045 ' reg ARG ADDRG
 mov r4, ##@C_s85g33_696de09b_luathread_new_L000215_217_L000218 ' reg ARG ADDRG
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_luaopen_propeller ' reg ARG ADDRG
 mov r4, ##@C_s85g33_696de09b_luathread_new_L000215_219_L000220 ' reg ARG ADDRG
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_luaopen_coroutine ' reg ARG ADDRG
 mov r4, ##@C_s85g33_696de09b_luathread_new_L000215_221_L000222 ' reg ARG ADDRG
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 wrlong r21, r19 ' ASGNP4 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
' C_s85g33_696de09b_luathread_new_L000215_216 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g37_696de09b_luathread_join_workers_L000223 ' <symbol:luathread_join_workers>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sched_join_workers ' CALL addrg
 mov r2, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_close ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_s85g37_696de09b_luathread_join_workers_L000223_224 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s85g38_696de09b_codebuff_L000225 ' <symbol:codebuff>
 long $0

 alignl ' align long
C_s85g39_696de09b_buffsize_L000226 ' <symbol:buffsize>
 long 0

 alignl ' align long
C_s85g3a_696de09b_usedsize_L000227 ' <symbol:usedsize>
 long 0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s85g3b_696de09b_writer_L000228 ' <symbol:writer>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, ##@C_s85g39_696de09b_buffsize_L000226
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_nz jmp #\C_s85g3b_696de09b_writer_L000228_230 ' NEI4
 mov r2, r19
 add r2, #100 ' ADDU4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_malloc ' CALL addrg
 wrlong r0, ##@C_s85g38_696de09b_codebuff_L000225 ' ASGNP4 addrg reg
 mov r22, ##@C_s85g38_696de09b_codebuff_L000225
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_s85g3b_696de09b_writer_L000228_232 ' EQU4
 mov r22, r19
 add r22, #100 ' ADDU4 coni
 wrlong r22, ##@C_s85g39_696de09b_buffsize_L000226 ' ASGNI4 addrg reg
 jmp #\@C_s85g3b_696de09b_writer_L000228_231 ' JUMPV addrg
C_s85g3b_696de09b_writer_L000228_232
 mov r2, ##@C_s85g3b_696de09b_writer_L000228_234_L000235 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_printf ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s85g3b_696de09b_writer_L000228_229 ' JUMPV addrg
C_s85g3b_696de09b_writer_L000228_230
 mov r22, ##@C_s85g3a_696de09b_usedsize_L000227
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 add r22, r19 ' ADDU (1)
 add r22, #1 ' ADDU4 coni
 mov r20, ##@C_s85g39_696de09b_buffsize_L000226
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_s85g3b_696de09b_writer_L000228_236 ' LTU4
 mov r22, ##@C_s85g3a_696de09b_usedsize_L000227
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 add r22, r19 ' ADDU (1)
 mov r2, r22
 add r2, #100 ' ADDU4 coni
 mov r22, ##@C_s85g38_696de09b_codebuff_L000225 ' reg <- addrg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_realloc
 add SP, #4 ' CALL addrg
 wrlong r0, ##@C_s85g38_696de09b_codebuff_L000225 ' ASGNP4 addrg reg
 mov r22, ##@C_s85g38_696de09b_codebuff_L000225
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_s85g3b_696de09b_writer_L000228_238 ' EQU4
 mov r22, ##@C_s85g3a_696de09b_usedsize_L000227
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 add r22, r19 ' ADDU (1)
 add r22, #100 ' ADDU4 coni
 wrlong r22, ##@C_s85g39_696de09b_buffsize_L000226 ' ASGNI4 addrg reg
 jmp #\@C_s85g3b_696de09b_writer_L000228_239 ' JUMPV addrg
C_s85g3b_696de09b_writer_L000228_238
 mov r2, ##@C_s85g3b_696de09b_writer_L000228_240_L000241 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_printf ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s85g3b_696de09b_writer_L000228_229 ' JUMPV addrg
C_s85g3b_696de09b_writer_L000228_239
C_s85g3b_696de09b_writer_L000228_236
C_s85g3b_696de09b_writer_L000228_231
 mov r15, #0 ' reg <- coni
 jmp #\@C_s85g3b_696de09b_writer_L000228_245 ' JUMPV addrg
C_s85g3b_696de09b_writer_L000228_242
 mov r22, ##@C_s85g3a_696de09b_usedsize_L000227
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##@C_s85g38_696de09b_codebuff_L000225
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r15 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##@C_s85g3a_696de09b_usedsize_L000227 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 wrlong r22, ##@C_s85g3a_696de09b_usedsize_L000227 ' ASGNI4 addrg reg
' C_s85g3b_696de09b_writer_L000228_243 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_s85g3b_696de09b_writer_L000228_245
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22, r19 wcz 
 if_b jmp #\C_s85g3b_696de09b_writer_L000228_242 ' LTU4
 mov r15, ##@C_s85g3a_696de09b_usedsize_L000227
 rdlong r15, r15 ' reg <- INDIRI4 addrg
 jmp #\@C_s85g3b_696de09b_writer_L000228_249 ' JUMPV addrg
C_s85g3b_696de09b_writer_L000228_246
 mov r22, ##@C_s85g38_696de09b_codebuff_L000225
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 adds r22, r15 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_s85g3b_696de09b_writer_L000228_247 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_s85g3b_696de09b_writer_L000228_249
 mov r22, ##@C_s85g39_696de09b_buffsize_L000226
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r15, r22 wcz
 if_b jmp #\C_s85g3b_696de09b_writer_L000228_246 ' LTI4
 mov r0, #0 ' reg <- coni
C_s85g3b_696de09b_writer_L000228_229
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g12_696de09b_threads_sbrk_L000039 ' <symbol:threads_sbrk>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_s85g12_696de09b_threads_sbrk_L000039_251 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85g12_696de09b_threads_sbrk_L000039_253 ' EQI4
 mov r2, ##@C_s85g7_696de09b_mutex_memopt_L000012 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_malloc_defragment ' CALL addrg
 mov r2, ##@C_s85g7_696de09b_mutex_memopt_L000012 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
C_s85g12_696de09b_threads_sbrk_L000039_253
C_s85g12_696de09b_threads_sbrk_L000039_251
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sbrk ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s85g12_696de09b_threads_sbrk_L000039_250 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g17_696de09b_threads_gc_L000044 ' <symbol:threads_gc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 mov r2, ##@C_s85g7_696de09b_mutex_memopt_L000012 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_s85g17_696de09b_threads_gc_L000044_256 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz
 if_nz jmp #\C_s85g17_696de09b_threads_gc_L000044_258 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sbrk ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s85g17_696de09b_threads_gc_L000044_258
 cmps r19,  #1 wz
 if_nz jmp #\C_s85g17_696de09b_threads_gc_L000044_260 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_malloc_defragment ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sbrk ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s85g17_696de09b_threads_gc_L000044_260
 cmps r19,  #2 wz
 if_nz jmp #\C_s85g17_696de09b_threads_gc_L000044_262 ' NEI4
 mov r22, ##@C_s85g38_696de09b_codebuff_L000225
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_s85g17_696de09b_threads_gc_L000044_264 ' EQU4
 mov r22, ##@C_s85g3a_696de09b_usedsize_L000227
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_nz jmp #\C_s85g17_696de09b_threads_gc_L000044_264 ' NEI4
 mov r2, ##@C_s85g38_696de09b_codebuff_L000225
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov r22, ##0 ' reg <- con
 wrlong r22, ##@C_s85g38_696de09b_codebuff_L000225 ' ASGNP4 addrg reg
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_s85g3a_696de09b_usedsize_L000227 ' ASGNI4 addrg reg
 wrlong r22, ##@C_s85g39_696de09b_buffsize_L000226 ' ASGNI4 addrg reg
C_s85g17_696de09b_threads_gc_L000044_264
C_s85g17_696de09b_threads_gc_L000044_262
C_s85g17_696de09b_threads_gc_L000044_256
 mov r2, ##@C_s85g7_696de09b_mutex_memopt_L000012 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s85g17_696de09b_threads_gc_L000044_255 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g3e_696de09b_func_dump_L000266 ' <symbol:func_dump>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_s85g3a_696de09b_usedsize_L000227 ' ASGNI4 addrg reg
 mov r2, #6 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, ##0 ' reg ARG con
 mov r4, ##@C_s85g3b_696de09b_writer_L000228 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_dump
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85g3e_696de09b_func_dump_L000266_268 ' EQI4
 mov r2, ##@C_s85g3e_696de09b_func_dump_L000266_270_L000271 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s85g3e_696de09b_func_dump_L000266_267 ' JUMPV addrg
C_s85g3e_696de09b_func_dump_L000266_268
 mov r0, #1 ' reg <- coni
C_s85g3e_696de09b_func_dump_L000266_267
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s85g3g_696de09b_luathread_copyupvalues_L000272 ' <symbol:luathread_copyupvalues>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #1 ' reg <- coni
 jmp #\@C_s85g3g_696de09b_luathread_copyupvalues_L000272_275 ' JUMPV addrg
C_s85g3g_696de09b_luathread_copyupvalues_L000272_274
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r13,  #0 wcz
 if_b jmp #\C_s85g3g_696de09b_luathread_copyupvalues_L000272_277 ' LTI4
 cmps r13,  #5 wcz
 if_a jmp #\C_s85g3g_696de09b_luathread_copyupvalues_L000272_277 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s85g3g_696de09b_luathread_copyupvalues_L000272_291_L000293 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s85g3g_696de09b_luathread_copyupvalues_L000272_291_L000293 ' <symbol:291>
 long @C_s85g3g_696de09b_luathread_copyupvalues_L000272_285
 long @C_s85g3g_696de09b_luathread_copyupvalues_L000272_280
 long @C_s85g3g_696de09b_luathread_copyupvalues_L000272_277
 long @C_s85g3g_696de09b_luathread_copyupvalues_L000272_281
 long @C_s85g3g_696de09b_luathread_copyupvalues_L000272_284
 long @C_s85g3g_696de09b_luathread_copyupvalues_L000272_286

' Catalina Code

DAT ' code segment
C_s85g3g_696de09b_luathread_copyupvalues_L000272_280
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g3g_696de09b_luathread_copyupvalues_L000272_278 ' JUMPV addrg
C_s85g3g_696de09b_luathread_copyupvalues_L000272_281
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85g3g_696de09b_luathread_copyupvalues_L000272_282 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 calld PA,#INFL ' CVFI4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g3g_696de09b_luathread_copyupvalues_L000272_278 ' JUMPV addrg
C_s85g3g_696de09b_luathread_copyupvalues_L000272_282
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g3g_696de09b_luathread_copyupvalues_L000272_278 ' JUMPV addrg
C_s85g3g_696de09b_luathread_copyupvalues_L000272_284
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 jmp #\@C_s85g3g_696de09b_luathread_copyupvalues_L000272_278 ' JUMPV addrg
C_s85g3g_696de09b_luathread_copyupvalues_L000272_285
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_s85g3g_696de09b_luathread_copyupvalues_L000272_278 ' JUMPV addrg
C_s85g3g_696de09b_luathread_copyupvalues_L000272_286
 mov r2, #2 ' reg ARG coni
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##-2 ' reg ARG con
 mov r4, ##-1 ' reg ARG con
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_compare
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85g3g_696de09b_luathread_copyupvalues_L000272_287 ' EQI4
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 jmp #\@C_s85g3g_696de09b_luathread_copyupvalues_L000272_278 ' JUMPV addrg
C_s85g3g_696de09b_luathread_copyupvalues_L000272_287
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s85g3g_696de09b_luathread_copyupvalues_L000272_277
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g3g_696de09b_luathread_copyupvalues_L000272_289_L000290 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_s85g3g_696de09b_luathread_copyupvalues_L000272_273 ' JUMPV addrg
C_s85g3g_696de09b_luathread_copyupvalues_L000272_278
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setupvalue
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85g3g_696de09b_luathread_copyupvalues_L000272_294  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85g3g_696de09b_luathread_copyupvalues_L000272_296_L000297 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_s85g3g_696de09b_luathread_copyupvalues_L000272_273 ' JUMPV addrg
C_s85g3g_696de09b_luathread_copyupvalues_L000272_294
 adds r17, #1 ' ADDI4 coni
C_s85g3g_696de09b_luathread_copyupvalues_L000272_275
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getupvalue
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85g3g_696de09b_luathread_copyupvalues_L000272_274  ' NEU4
 mov r0, #1 ' reg <- coni
C_s85g3g_696de09b_luathread_copyupvalues_L000272_273
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s85gh_696de09b_threads_recycle_set_L000022 ' <symbol:threads_recycle_set>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wcz
 if_ae jmp #\C_s85gh_696de09b_threads_recycle_set_L000022_301 ' GEI4
 mov r2, ##@C_s85gh_696de09b_threads_recycle_set_L000022_299_L000300 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s85gh_696de09b_threads_recycle_set_L000022_301
 mov r2, ##@C_s85g1_696de09b_mutex_recycle_list_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 wrlong r19, ##@C_s85g3_696de09b_recyclemax_L000008 ' ASGNI4 addrg reg
 jmp #\@C_s85gh_696de09b_threads_recycle_set_L000022_303 ' JUMPV addrg
C_s85gh_696de09b_threads_recycle_set_L000022_302
 mov r2, ##@C_s85g2_696de09b_recycle_list_L000007 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r2, r21 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_close ' CALL addrg
C_s85gh_696de09b_threads_recycle_set_L000022_303
 mov r2, ##@C_s85g2_696de09b_recycle_list_L000007 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_count ' CALL addrg
 mov r20, ##@C_s85g3_696de09b_recyclemax_L000008
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 cmps r0, r20 wcz
 if_a jmp #\C_s85gh_696de09b_threads_recycle_set_L000022_302 ' GTI4
 mov r2, ##@C_s85g1_696de09b_mutex_recycle_list_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_s85gh_696de09b_threads_recycle_set_L000022_298 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85ga_696de09b_threads_wait_L000015 ' <symbol:threads_wait>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_be jmp #\C_s85ga_696de09b_threads_wait_L000015_306 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85gr_696de09b_threads_wait_for_L000032 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s85ga_696de09b_threads_wait_L000015_305 ' JUMPV addrg
C_s85ga_696de09b_threads_wait_L000015_306
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sched_wait ' CALL addrg
 mov r0, #0 ' reg <- coni
C_s85ga_696de09b_threads_wait_L000015_305
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gf_696de09b_threads_set_numworkers_L000020 ' <symbol:threads_set_numworkers>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_s85gf_696de09b_threads_set_numworkers_L000020_309 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_ae jmp #\C_s85gf_696de09b_threads_set_numworkers_L000020_313 ' GEI4
 mov r2, ##@C_s85gf_696de09b_threads_set_numworkers_L000020_311_L000312 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s85gf_696de09b_threads_set_numworkers_L000020_313
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_set_numworkers ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_s85gf_696de09b_threads_set_numworkers_L000020_314 ' NEI4
 mov r2, ##@C_s85gf_696de09b_threads_set_numworkers_L000020_316_L000317 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_s85gf_696de09b_threads_set_numworkers_L000020_314
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
C_s85gf_696de09b_threads_set_numworkers_L000020_309
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sched_get_numworkers ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s85gf_696de09b_threads_set_numworkers_L000020_308 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gg_696de09b_threads_get_numworkers_L000021 ' <symbol:threads_get_numworkers>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sched_get_numworkers ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s85gg_696de09b_threads_get_numworkers_L000021_318 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g9_696de09b_threads_create_newproc_L000014 ' <symbol:threads_create_newproc>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_s85g7_696de09b_mutex_memopt_L000012 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r15,  #6 wz
 if_nz jmp #\C_s85g9_696de09b_threads_create_newproc_L000014_320 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85g3e_696de09b_func_dump_L000266 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #1 wz
 if_z jmp #\C_s85g9_696de09b_threads_create_newproc_L000014_321 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85g9_696de09b_threads_create_newproc_L000014_324_L000325 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g7_696de09b_mutex_memopt_L000012 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85g9_696de09b_threads_create_newproc_L000014_319 ' JUMPV addrg
C_s85g9_696de09b_threads_create_newproc_L000014_320
 cmps r15,  #4 wz
 if_z jmp #\C_s85g9_696de09b_threads_create_newproc_L000014_326 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g9_696de09b_threads_create_newproc_L000014_328_L000329 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r2, ##@C_s85g7_696de09b_mutex_memopt_L000012 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85g9_696de09b_threads_create_newproc_L000014_319 ' JUMPV addrg
C_s85g9_696de09b_threads_create_newproc_L000014_326
C_s85g9_696de09b_threads_create_newproc_L000014_321
 mov r2, ##@C_s85g1_696de09b_mutex_recycle_list_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r22, ##@C_s85g3_696de09b_recyclemax_L000008
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_be jmp #\C_s85g9_696de09b_threads_create_newproc_L000014_330 ' LEI4
 mov r2, ##@C_s85g2_696de09b_recycle_list_L000007 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85g9_696de09b_threads_create_newproc_L000014_332  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85g33_696de09b_luathread_new_L000215 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_s85g9_696de09b_threads_create_newproc_L000014_331 ' JUMPV addrg
C_s85g9_696de09b_threads_create_newproc_L000014_332
 mov r2, #0 ' reg ARG coni
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g9_696de09b_threads_create_newproc_L000014_331 ' JUMPV addrg
C_s85g9_696de09b_threads_create_newproc_L000014_330
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85g33_696de09b_luathread_new_L000215 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s85g9_696de09b_threads_create_newproc_L000014_331
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
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, ##@C_s85g1_696de09b_mutex_recycle_list_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 cmps r15,  #6 wz
 if_nz jmp #\C_s85g9_696de09b_threads_create_newproc_L000014_334 ' NEI4
 mov r22, ##@C_s85g3a_696de09b_usedsize_L000227
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g38_696de09b_codebuff_L000225
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2n_696de09b_luathread_loadbuffer_L000161
 add SP, #12 ' CALL addrg
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_s85g3a_696de09b_usedsize_L000227 ' ASGNI4 addrg reg
 mov r2, r13 ' CVI, CVU or LOAD
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g3g_696de09b_luathread_copyupvalues_L000272
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85g9_696de09b_threads_create_newproc_L000014_335 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_recycle_insert ' CALL addrg
 mov r2, ##@C_s85g7_696de09b_mutex_memopt_L000012 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85g9_696de09b_threads_create_newproc_L000014_319 ' JUMPV addrg
C_s85g9_696de09b_threads_create_newproc_L000014_334
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
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
 calld PA,#CALA
 long @C_s85g2n_696de09b_luathread_loadbuffer_L000161
 add SP, #12 ' CALL addrg
C_s85g9_696de09b_threads_create_newproc_L000014_335
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sched_inc_lpcount ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_queue_proc ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g7_696de09b_mutex_memopt_L000012 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s85g9_696de09b_threads_create_newproc_L000014_319
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s85gb_696de09b_threads_send_L000016 ' <symbol:threads_send>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gb_696de09b_threads_send_L000016_339  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gb_696de09b_threads_send_L000016_341_L000342 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gb_696de09b_threads_send_L000016_338 ' JUMPV addrg
C_s85gb_696de09b_threads_send_L000016_339
 mov r2, r19
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85gb_696de09b_threads_send_L000016_343 ' EQU4
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r20, r17
 adds r20, #8 ' ADDP4 coni
 mov r22, r0
 subs r22, #1 ' SUBI4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 rdlong r22, r17 ' reg <- INDIRP4 reg
 mov r20, ##@C_s85g5_696de09b_mainlp_L000010
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_s85gb_696de09b_threads_send_L000016_345  ' NEU4
 mov r2, ##@C_s85g6_696de09b_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_cond_mainls_sendrecv ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_signal ' CALL addrg
 mov r2, ##@C_s85g6_696de09b_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #\@C_s85gb_696de09b_threads_send_L000016_346 ' JUMPV addrg
C_s85gb_696de09b_threads_send_L000016_345
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_queue_proc ' CALL addrg
C_s85gb_696de09b_threads_send_L000016_346
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 cmps r21,  #1 wz
 if_nz jmp #\C_s85gb_696de09b_threads_send_L000016_347 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s85gb_696de09b_threads_send_L000016_338 ' JUMPV addrg
C_s85gb_696de09b_threads_send_L000016_347
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gb_696de09b_threads_send_L000016_338 ' JUMPV addrg
C_s85gb_696de09b_threads_send_L000016_343
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##@C_s85g5_696de09b_mainlp_L000010
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_s85gb_696de09b_threads_send_L000016_349  ' NEU4
 wrlong r19, ##@C_s85g5_696de09b_mainlp_L000010+12 ' ASGNP4 addrg reg
 mov r2, ##@C_s85g5_696de09b_mainlp_L000010 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_queue_sender ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 mov r2, ##@C_s85g6_696de09b_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_s85g6_696de09b_mutex_mainls_L000011 ' reg ARG ADDRG
 mov r3, ##@C_cond_mainls_sendrecv ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g6_696de09b_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, ##@C_s85g5_696de09b_mainlp_L000010+8
 rdlong r0, r0 ' reg <- INDIRI4 addrg
 jmp #\@C_s85gb_696de09b_threads_send_L000016_338 ' JUMPV addrg
C_s85gb_696de09b_threads_send_L000016_349
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85g31_696de09b_luathread_getself_L000211 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85gb_696de09b_threads_send_L000016_353 ' EQU4
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
C_s85gb_696de09b_threads_send_L000016_353
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_yieldk
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s85gb_696de09b_threads_send_L000016_338
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gi_696de09b_threads_send_async_L000023 ' <symbol:threads_send_async>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gi_696de09b_threads_send_async_L000023_356  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gb_696de09b_threads_send_L000016_341_L000342 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gi_696de09b_threads_send_async_L000023_355 ' JUMPV addrg
C_s85gi_696de09b_threads_send_async_L000023_356
 mov r2, r19
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85gi_696de09b_threads_send_async_L000023_358 ' EQU4
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r20, r17
 adds r20, #8 ' ADDP4 coni
 mov r22, r0
 subs r22, #1 ' SUBI4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 rdlong r22, r17 ' reg <- INDIRP4 reg
 mov r20, ##@C_s85g5_696de09b_mainlp_L000010
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_s85gi_696de09b_threads_send_async_L000023_360  ' NEU4
 mov r2, ##@C_s85g6_696de09b_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_cond_mainls_sendrecv ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_signal ' CALL addrg
 mov r2, ##@C_s85g6_696de09b_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #\@C_s85gi_696de09b_threads_send_async_L000023_361 ' JUMPV addrg
C_s85gi_696de09b_threads_send_async_L000023_360
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_queue_proc ' CALL addrg
C_s85gi_696de09b_threads_send_async_L000023_361
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 cmps r21,  #1 wz
 if_nz jmp #\C_s85gi_696de09b_threads_send_async_L000023_362 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s85gi_696de09b_threads_send_async_L000023_355 ' JUMPV addrg
C_s85gi_696de09b_threads_send_async_L000023_362
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gi_696de09b_threads_send_async_L000023_355 ' JUMPV addrg
C_s85gi_696de09b_threads_send_async_L000023_358
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gi_696de09b_threads_send_async_L000023_364_L000365 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
C_s85gi_696de09b_threads_send_async_L000023_355
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85go_696de09b_threads_lock_L000029 ' <symbol:threads_lock>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85go_696de09b_threads_lock_L000029_370  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gb_696de09b_threads_send_L000016_341_L000342 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85go_696de09b_threads_lock_L000029_366 ' JUMPV addrg
C_s85go_696de09b_threads_lock_L000029_369
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s85go_696de09b_threads_lock_L000029_370
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85go_696de09b_threads_lock_L000029_372 ' EQU4
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 if_nz jmp #\C_s85go_696de09b_threads_lock_L000029_369 ' NEI4
C_s85go_696de09b_threads_lock_L000029_372
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85go_696de09b_threads_lock_L000029_373  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s85go_696de09b_threads_lock_L000029_366 ' JUMPV addrg
C_s85go_696de09b_threads_lock_L000029_373
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s85go_696de09b_threads_lock_L000029_366
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gq_696de09b_threads_trylock_L000031 ' <symbol:threads_trylock>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gq_696de09b_threads_trylock_L000031_376  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gb_696de09b_threads_send_L000016_341_L000342 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gq_696de09b_threads_trylock_L000031_375 ' JUMPV addrg
C_s85gq_696de09b_threads_trylock_L000031_376
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85gq_696de09b_threads_trylock_L000031_378 ' NEI4
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #\@C_s85gq_696de09b_threads_trylock_L000031_379 ' JUMPV addrg
C_s85gq_696de09b_threads_trylock_L000031_378
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
C_s85gq_696de09b_threads_trylock_L000031_379
 mov r0, #1 ' reg <- coni
C_s85gq_696de09b_threads_trylock_L000031_375
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gp_696de09b_threads_unlock_L000030 ' <symbol:threads_unlock>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gp_696de09b_threads_unlock_L000030_381  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gb_696de09b_threads_send_L000016_341_L000342 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gp_696de09b_threads_unlock_L000030_380 ' JUMPV addrg
C_s85gp_696de09b_threads_unlock_L000030_381
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85gp_696de09b_threads_unlock_L000030_383 ' NEI4
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #\@C_s85gp_696de09b_threads_unlock_L000030_384 ' JUMPV addrg
C_s85gp_696de09b_threads_unlock_L000030_383
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
C_s85gp_696de09b_threads_unlock_L000030_384
 mov r0, #1 ' reg <- coni
C_s85gp_696de09b_threads_unlock_L000030_380
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gr_696de09b_threads_wait_for_L000032 ' <symbol:threads_wait_for>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #1 wz
 if_z jmp #\C_s85gr_696de09b_threads_wait_for_L000032_386 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85gr_696de09b_threads_wait_for_L000032_388_L000389 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gr_696de09b_threads_wait_for_L000032_385 ' JUMPV addrg
C_s85gr_696de09b_threads_wait_for_L000032_386
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gr_696de09b_threads_wait_for_L000032_390  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gb_696de09b_threads_send_L000016_341_L000342 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gr_696de09b_threads_wait_for_L000032_385 ' JUMPV addrg
C_s85gr_696de09b_threads_wait_for_L000032_390
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov r3, r21
 adds r3, #64 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s85gr_696de09b_threads_wait_for_L000032_385
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gs_696de09b_threads_signal_L000033 ' <symbol:threads_signal>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gs_696de09b_threads_signal_L000033_393  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gb_696de09b_threads_send_L000016_341_L000342 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gs_696de09b_threads_signal_L000033_392 ' JUMPV addrg
C_s85gs_696de09b_threads_signal_L000033_393
 mov r2, r21
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_signal ' CALL addrg
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s85gs_696de09b_threads_signal_L000033_392
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gt_696de09b_threads_broadcast_L000034 ' <symbol:threads_broadcast>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gt_696de09b_threads_broadcast_L000034_396  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gb_696de09b_threads_send_L000016_341_L000342 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gt_696de09b_threads_broadcast_L000034_395 ' JUMPV addrg
C_s85gt_696de09b_threads_broadcast_L000034_396
 mov r2, r21
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_broadcast ' CALL addrg
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s85gt_696de09b_threads_broadcast_L000034_395
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gu_696de09b_threads_rendezvous_L000035 ' <symbol:threads_rendezvous>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gu_696de09b_threads_rendezvous_L000035_402  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gb_696de09b_threads_send_L000016_341_L000342 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gu_696de09b_threads_rendezvous_L000035_398 ' JUMPV addrg
C_s85gu_696de09b_threads_rendezvous_L000035_401
 mov r2, r19
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_s85gu_696de09b_threads_rendezvous_L000035_402
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85gu_696de09b_threads_rendezvous_L000035_404 ' EQU4
 mov r2, r19
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 if_nz jmp #\C_s85gu_696de09b_threads_rendezvous_L000035_401 ' NEI4
C_s85gu_696de09b_threads_rendezvous_L000035_404
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gu_696de09b_threads_rendezvous_L000035_405  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s85gu_696de09b_threads_rendezvous_L000035_398 ' JUMPV addrg
C_s85gu_696de09b_threads_rendezvous_L000035_405
 mov r2, r19
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_broadcast ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, r19
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r19
 adds r2, #40 ' ADDP4 coni
 mov r3, r19
 adds r3, #64 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gu_696de09b_threads_rendezvous_L000035_407  ' NEU4
 mov r2, r19
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gb_696de09b_threads_send_L000016_341_L000342 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gu_696de09b_threads_rendezvous_L000035_398 ' JUMPV addrg
C_s85gu_696de09b_threads_rendezvous_L000035_407
 mov r2, r19
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r19
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_broadcast ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, r19
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s85gu_696de09b_threads_rendezvous_L000035_398
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g3t_696de09b_simple_type_L000409 ' <symbol:simple_type>
 calld PA,#PSHM
 long $800000 ' save registers
 cmps r2,  #0 wz
 if_z jmp #\C_s85g3t_696de09b_simple_type_L000409_416 ' EQI4
 cmps r2,  #3 wz
 if_z jmp #\C_s85g3t_696de09b_simple_type_L000409_416 ' EQI4
 cmps r2,  #1 wz
 if_z jmp #\C_s85g3t_696de09b_simple_type_L000409_416 ' EQI4
 cmps r2,  #4 wz
 if_nz jmp #\C_s85g3t_696de09b_simple_type_L000409_412 ' NEI4
C_s85g3t_696de09b_simple_type_L000409_416
 mov r23, #1 ' reg <- coni
 jmp #\@C_s85g3t_696de09b_simple_type_L000409_413 ' JUMPV addrg
C_s85g3t_696de09b_simple_type_L000409_412
 mov r23, #0 ' reg <- coni
C_s85g3t_696de09b_simple_type_L000409_413
 mov r0, r23 ' CVI, CVU or LOAD
' C_s85g3t_696de09b_simple_type_L000409_410 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s85g3u_696de09b_luathread_movevalues_L000417 ' <symbol:luathread_movevalues>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_checkstack
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85g3u_696de09b_luathread_movevalues_L000417_419 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_418 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_419
 mov r19, #1 ' reg <- coni
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_424 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_421
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 if_b jmp #\C_s85g3u_696de09b_luathread_movevalues_L000417_425 ' LTI4
 cmps r15,  #5 wcz
 if_a jmp #\C_s85g3u_696de09b_luathread_movevalues_L000417_425 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s85g3u_696de09b_luathread_movevalues_L000417_452_L000454 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s85g3u_696de09b_luathread_movevalues_L000417_452_L000454 ' <symbol:452>
 long @C_s85g3u_696de09b_luathread_movevalues_L000417_433
 long @C_s85g3u_696de09b_luathread_movevalues_L000417_428
 long @C_s85g3u_696de09b_luathread_movevalues_L000417_425
 long @C_s85g3u_696de09b_luathread_movevalues_L000417_429
 long @C_s85g3u_696de09b_luathread_movevalues_L000417_432
 long @C_s85g3u_696de09b_luathread_movevalues_L000417_434

' Catalina Code

DAT ' code segment
C_s85g3u_696de09b_luathread_movevalues_L000417_428
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_426 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_429
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85g3u_696de09b_luathread_movevalues_L000417_430 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 calld PA,#INFL ' CVFI4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_426 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_430
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_426 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_432
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_426 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_433
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_426 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_434
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_436 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_435
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #4 wz
 if_nz jmp #\C_s85g3u_696de09b_luathread_movevalues_L000417_438 ' NEI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r13,  #0 wcz
 if_b jmp #\C_s85g3u_696de09b_luathread_movevalues_L000417_440 ' LTI4
 cmps r13,  #4 wcz
 if_a jmp #\C_s85g3u_696de09b_luathread_movevalues_L000417_440 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s85g3u_696de09b_luathread_movevalues_L000417_449_L000451 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s85g3u_696de09b_luathread_movevalues_L000417_449_L000451 ' <symbol:449>
 long @C_s85g3u_696de09b_luathread_movevalues_L000417_448
 long @C_s85g3u_696de09b_luathread_movevalues_L000417_443
 long @C_s85g3u_696de09b_luathread_movevalues_L000417_440
 long @C_s85g3u_696de09b_luathread_movevalues_L000417_444
 long @C_s85g3u_696de09b_luathread_movevalues_L000417_447

' Catalina Code

DAT ' code segment
C_s85g3u_696de09b_luathread_movevalues_L000417_443
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, ##-3 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_441 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_444
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85g3u_696de09b_luathread_movevalues_L000417_445 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 calld PA,#INFL ' CVFI4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_446 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_445
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_446
 mov r2, ##-3 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_441 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_447
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-3 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_441 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_448
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##-3 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_441 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_440
 mov r2, ##-2 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_441
C_s85g3u_696de09b_luathread_movevalues_L000417_438
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_436
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_next
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85g3u_696de09b_luathread_movevalues_L000417_435 ' NEI4
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_426 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_425
 mov r0, #0 ' reg <- coni
 jmp #\@C_s85g3u_696de09b_luathread_movevalues_L000417_418 ' JUMPV addrg
C_s85g3u_696de09b_luathread_movevalues_L000417_426
' C_s85g3u_696de09b_luathread_movevalues_L000417_422 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s85g3u_696de09b_luathread_movevalues_L000417_424
 cmps r19, r17 wcz
 if_be jmp #\C_s85g3u_696de09b_luathread_movevalues_L000417_421 ' LEI4
 neg r22, r17 ' NEGI4
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s85g3u_696de09b_luathread_movevalues_L000417_418
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s85gv_696de09b_threads_shared_L000036 ' <symbol:threads_shared>
 calld PA,#NEWF
 sub SP, #136
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_z jmp #\C_s85gv_696de09b_threads_shared_L000036_456 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_458_L000459 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gv_696de09b_threads_shared_L000036_455 ' JUMPV addrg
C_s85gv_696de09b_threads_shared_L000036_456
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gv_696de09b_threads_shared_L000036_460  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_462_L000463 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gv_696de09b_threads_shared_L000036_455 ' JUMPV addrg
C_s85gv_696de09b_threads_shared_L000036_460
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #46 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gv_696de09b_threads_shared_L000036_464  ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_nz jmp #\C_s85gv_696de09b_threads_shared_L000036_466 ' NEI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
C_s85gv_696de09b_threads_shared_L000036_466
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g3u_696de09b_luathread_movevalues_L000417
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_s85gv_696de09b_threads_shared_L000036_465 ' NEI4
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s85gv_696de09b_threads_shared_L000036_455 ' JUMPV addrg
C_s85gv_696de09b_threads_shared_L000036_464
 mov r2, #127 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-140) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-13)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-140) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s85gv_696de09b_threads_shared_L000036_475 ' EQI4
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_s85gv_696de09b_threads_shared_L000036_473 ' EQI4
C_s85gv_696de09b_threads_shared_L000036_475
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s85gv_696de09b_threads_shared_L000036_455 ' JUMPV addrg
C_s85gv_696de09b_threads_shared_L000036_473
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_s85gv_696de09b_threads_shared_L000036_477 ' JUMPV addrg
C_s85gv_696de09b_threads_shared_L000036_476
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_s85gv_696de09b_threads_shared_L000036_479 ' EQI4
 mov r2, ##-3 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gv_696de09b_threads_shared_L000036_481_L000482 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gv_696de09b_threads_shared_L000036_455 ' JUMPV addrg
C_s85gv_696de09b_threads_shared_L000036_479
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r19, r21 ' CVI, CVU or LOAD
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s85gv_696de09b_threads_shared_L000036_477
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gv_696de09b_threads_shared_L000036_476  ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##-1 ' reg ARG con
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_nz jmp #\C_s85gv_696de09b_threads_shared_L000036_483 ' NEI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
C_s85gv_696de09b_threads_shared_L000036_483
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g3u_696de09b_luathread_movevalues_L000417
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_s85gv_696de09b_threads_shared_L000036_485 ' NEI4
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s85gv_696de09b_threads_shared_L000036_455 ' JUMPV addrg
C_s85gv_696de09b_threads_shared_L000036_485
C_s85gv_696de09b_threads_shared_L000036_465
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_487_L000488 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' reg <- coni
C_s85gv_696de09b_threads_shared_L000036_455
 calld PA,#POPM ' restore registers
 add SP, #136 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s85g11_696de09b_threads_export_L000038 ' <symbol:threads_export>
 calld PA,#NEWF
 sub SP, #136
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_z jmp #\C_s85g11_696de09b_threads_export_L000038_490 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85g11_696de09b_threads_export_L000038_492_L000493 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85g11_696de09b_threads_export_L000038_489 ' JUMPV addrg
C_s85g11_696de09b_threads_export_L000038_490
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85g11_696de09b_threads_export_L000038_494  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85g11_696de09b_threads_export_L000038_496_L000497 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85g11_696de09b_threads_export_L000038_489 ' JUMPV addrg
C_s85g11_696de09b_threads_export_L000038_494
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #46 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85g11_696de09b_threads_export_L000038_498  ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_be jmp #\C_s85g11_696de09b_threads_export_L000038_500 ' LEI4
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_nz jmp #\C_s85g11_696de09b_threads_export_L000038_500 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s85g11_696de09b_threads_export_L000038_504 ' EQI4
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_s85g11_696de09b_threads_export_L000038_502 ' EQI4
C_s85g11_696de09b_threads_export_L000038_504
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
C_s85g11_696de09b_threads_export_L000038_502
C_s85g11_696de09b_threads_export_L000038_500
 mov r2, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g3u_696de09b_luathread_movevalues_L000417
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-140)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-140) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_s85g11_696de09b_threads_export_L000038_499 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_s85g11_696de09b_threads_export_L000038_489 ' JUMPV addrg
C_s85g11_696de09b_threads_export_L000038_498
 mov r2, #127 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-136) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-9)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-136) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s85g11_696de09b_threads_export_L000038_510 ' EQI4
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_s85g11_696de09b_threads_export_L000038_508 ' EQI4
C_s85g11_696de09b_threads_export_L000038_510
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g11_696de09b_threads_export_L000038_511_L000512 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85g11_696de09b_threads_export_L000038_489 ' JUMPV addrg
C_s85g11_696de09b_threads_export_L000038_508
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_s85g11_696de09b_threads_export_L000038_513 ' EQI4
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
C_s85g11_696de09b_threads_export_L000038_513
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_s85g11_696de09b_threads_export_L000038_516 ' JUMPV addrg
C_s85g11_696de09b_threads_export_L000038_515
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_s85g11_696de09b_threads_export_L000038_518 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g11_696de09b_threads_export_L000038_511_L000512 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85g11_696de09b_threads_export_L000038_489 ' JUMPV addrg
C_s85g11_696de09b_threads_export_L000038_518
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_s85g11_696de09b_threads_export_L000038_520 ' EQI4
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
C_s85g11_696de09b_threads_export_L000038_520
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r21, r19 ' CVI, CVU or LOAD
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_s85g11_696de09b_threads_export_L000038_516
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85g11_696de09b_threads_export_L000038_515  ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_nz jmp #\C_s85g11_696de09b_threads_export_L000038_522 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_s85g11_696de09b_threads_export_L000038_524 ' EQI4
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
C_s85g11_696de09b_threads_export_L000038_524
C_s85g11_696de09b_threads_export_L000038_522
 mov r2, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g3u_696de09b_luathread_movevalues_L000417
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-140)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_s85g11_696de09b_threads_export_L000038_489 ' JUMPV addrg
C_s85g11_696de09b_threads_export_L000038_499
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85g11_696de09b_threads_export_L000038_526_L000527 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' reg <- coni
C_s85g11_696de09b_threads_export_L000038_489
 calld PA,#POPM ' restore registers
 add SP, #136 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s85g10_696de09b_threads_update_L000037 ' <symbol:threads_update>
 calld PA,#NEWF
 sub SP, #136
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #2 wz
 if_z jmp #\C_s85g10_696de09b_threads_update_L000037_529 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85g10_696de09b_threads_update_L000037_531_L000532 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85g10_696de09b_threads_update_L000037_528 ' JUMPV addrg
C_s85g10_696de09b_threads_update_L000037_529
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85g3t_696de09b_simple_type_L000409 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85g10_696de09b_threads_update_L000037_533 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85g10_696de09b_threads_update_L000037_535_L000536 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85g10_696de09b_threads_update_L000037_528 ' JUMPV addrg
C_s85g10_696de09b_threads_update_L000037_533
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85g10_696de09b_threads_update_L000037_537  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85g10_696de09b_threads_update_L000037_539_L000540 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85g10_696de09b_threads_update_L000037_528 ' JUMPV addrg
C_s85g10_696de09b_threads_update_L000037_537
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #46 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85g10_696de09b_threads_update_L000037_541  ' NEU4
 mov r2, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g3u_696de09b_luathread_movevalues_L000417
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-140)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-140) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_s85g10_696de09b_threads_update_L000037_542 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_s85g10_696de09b_threads_update_L000037_528 ' JUMPV addrg
C_s85g10_696de09b_threads_update_L000037_541
 mov r2, #127 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-136) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-9)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-136) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_s85g10_696de09b_threads_update_L000037_546 ' EQI4
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
C_s85g10_696de09b_threads_update_L000037_546
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_s85g10_696de09b_threads_update_L000037_549 ' JUMPV addrg
C_s85g10_696de09b_threads_update_L000037_548
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_s85g10_696de09b_threads_update_L000037_551 ' EQI4
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, ##-3 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
C_s85g10_696de09b_threads_update_L000037_551
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r21, r19 ' CVI, CVU or LOAD
 mov r2, ##@C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_s85g10_696de09b_threads_update_L000037_549
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85g10_696de09b_threads_update_L000037_548  ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g3u_696de09b_luathread_movevalues_L000417
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-140)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, ##-3 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_s85g10_696de09b_threads_update_L000037_528 ' JUMPV addrg
C_s85g10_696de09b_threads_update_L000037_542
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_s85g10_696de09b_threads_update_L000037_553_L000554 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' reg <- coni
C_s85g10_696de09b_threads_update_L000037_528
 calld PA,#POPM ' restore registers
 add SP, #136 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s85gj_696de09b_threads_receive_async_L000024 ' <symbol:threads_receive_async>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #2 ' reg <- coni
 cmps r22, r20 wz
 if_nz jmp #\C_s85gj_696de09b_threads_receive_async_L000024_556 ' NEI4
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85gj_696de09b_threads_receive_async_L000024_556 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85gc_696de09b_threads_receive_L000017 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s85gj_696de09b_threads_receive_async_L000024_555 ' JUMPV addrg
C_s85gj_696de09b_threads_receive_async_L000024_556
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85gc_696de09b_threads_receive_L000017 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s85gj_696de09b_threads_receive_async_L000024_555
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gc_696de09b_threads_receive_L000017 ' <symbol:threads_receive>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85gc_696de09b_threads_receive_L000017_559 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_s85gc_696de09b_threads_receive_L000017_560 ' JUMPV addrg
C_s85gc_696de09b_threads_receive_L000017_559
 mov r17, #0 ' reg <- coni
C_s85gc_696de09b_threads_receive_L000017_560
 cmps r17,  #0 wz
 if_nz jmp #\C_s85gc_696de09b_threads_receive_L000017_562 ' NEI4
 mov r7, #1 ' reg <- coni
 jmp #\@C_s85gc_696de09b_threads_receive_L000017_563 ' JUMPV addrg
C_s85gc_696de09b_threads_receive_L000017_562
 mov r7, #0 ' reg <- coni
C_s85gc_696de09b_threads_receive_L000017_563
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r9 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2m_696de09b_channel_locked_get_L000143
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85gc_696de09b_threads_receive_L000017_564  ' NEU4
 cmps r17,  #0 wz
 if_z jmp #\C_s85gc_696de09b_threads_receive_L000017_566 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gc_696de09b_threads_receive_L000017_568_L000569 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gc_696de09b_threads_receive_L000017_558 ' JUMPV addrg
C_s85gc_696de09b_threads_receive_L000017_566
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gc_696de09b_threads_receive_L000017_570_L000571 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gc_696de09b_threads_receive_L000017_558 ' JUMPV addrg
C_s85gc_696de09b_threads_receive_L000017_564
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85gc_696de09b_threads_receive_L000017_572 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 rdlong r3, r13 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g2o_696de09b_luathread_copyvalues_L000165
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #1 wz
 if_nz jmp #\C_s85gc_696de09b_threads_receive_L000017_574 ' NEI4
 mov r2, #1 ' reg ARG coni
 rdlong r3, r13 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_s85gc_696de09b_threads_receive_L000017_575 ' JUMPV addrg
C_s85gc_696de09b_threads_receive_L000017_574
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_s85gc_696de09b_threads_receive_L000017_575
 rdlong r22, r13 ' reg <- INDIRP4 reg
 mov r20, ##@C_s85g5_696de09b_mainlp_L000010
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_s85gc_696de09b_threads_receive_L000017_576  ' NEU4
 mov r2, ##@C_s85g6_696de09b_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_cond_mainls_sendrecv ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_signal ' CALL addrg
 mov r2, ##@C_s85g6_696de09b_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #\@C_s85gc_696de09b_threads_receive_L000017_577 ' JUMPV addrg
C_s85gc_696de09b_threads_receive_L000017_576
 mov r2, r13 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_queue_proc ' CALL addrg
C_s85gc_696de09b_threads_receive_L000017_577
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22 ' SUBI/P
 subs r0, r19 ' SUBI/P (3)
 jmp #\@C_s85gc_696de09b_threads_receive_L000017_558 ' JUMPV addrg
C_s85gc_696de09b_threads_receive_L000017_572
 cmps r17,  #0 wz
 if_z jmp #\C_s85gc_696de09b_threads_receive_L000017_578 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gc_696de09b_threads_receive_L000017_568_L000569 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gc_696de09b_threads_receive_L000017_558 ' JUMPV addrg
C_s85gc_696de09b_threads_receive_L000017_578
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##@C_s85g5_696de09b_mainlp_L000010
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_s85gc_696de09b_threads_receive_L000017_580  ' NEU4
 wrlong r15, ##@C_s85g5_696de09b_mainlp_L000010+12 ' ASGNP4 addrg reg
 mov r2, ##@C_s85g5_696de09b_mainlp_L000010 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_queue_receiver ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 mov r2, ##@C_s85g6_696de09b_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_s85g6_696de09b_mutex_mainls_L000011 ' reg ARG ADDRG
 mov r3, ##@C_cond_mainls_sendrecv ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g6_696de09b_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, ##@C_s85g5_696de09b_mainlp_L000010+8
 rdlong r0, r0 ' reg <- INDIRI4 addrg
 jmp #\@C_s85gc_696de09b_threads_receive_L000017_558 ' JUMPV addrg
C_s85gc_696de09b_threads_receive_L000017_580
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85g31_696de09b_luathread_getself_L000211 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85gc_696de09b_threads_receive_L000017_584 ' EQU4
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r11
 adds r22, #12 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
C_s85gc_696de09b_threads_receive_L000017_584
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_yieldk
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s85gc_696de09b_threads_receive_L000017_558
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gd_696de09b_threads_create_channel_L000018 ' <symbol:threads_create_channel>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85g2l_696de09b_channel_unlocked_get_L000141 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85gd_696de09b_threads_create_channel_L000018_587 ' EQU4
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gd_696de09b_threads_create_channel_L000018_589_L000590 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85gd_696de09b_threads_create_channel_L000018_586 ' JUMPV addrg
C_s85gd_696de09b_threads_create_channel_L000018_587
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85g2j_696de09b_channel_create_L000137 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s85gd_696de09b_threads_create_channel_L000018_586
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85ge_696de09b_threads_destroy_channel_L000019 ' <symbol:threads_destroy_channel>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s85g2l_696de09b_channel_unlocked_get_L000141 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85ge_696de09b_threads_destroy_channel_L000019_592 ' EQU4
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_trylock ' CALL addrg
C_s85ge_696de09b_threads_destroy_channel_L000019_592
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85ge_696de09b_threads_destroy_channel_L000019_594  ' NEU4
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gb_696de09b_threads_send_L000016_341_L000342 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s85ge_696de09b_threads_destroy_channel_L000019_591 ' JUMPV addrg
C_s85ge_696de09b_threads_destroy_channel_L000019_594
 mov r2, ##@C_s85g2j_696de09b_channel_create_L000137_139_L000140 ' reg ARG ADDRG
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_broadcast ' CALL addrg
 mov r2, r21
 adds r2, #56 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_broadcast ' CALL addrg
 mov r19, ##0 ' reg <- con
 rdlong r22, r21 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s85ge_696de09b_threads_destroy_channel_L000019_596 ' EQU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##@C_s85ge_696de09b_threads_destroy_channel_L000019_598_L000599 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r19, r21 ' CVI, CVU or LOAD
C_s85ge_696de09b_threads_destroy_channel_L000019_596
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85ge_696de09b_threads_destroy_channel_L000019_600 ' EQU4
 jmp #\@C_s85ge_696de09b_threads_destroy_channel_L000019_603 ' JUMPV addrg
C_s85ge_696de09b_threads_destroy_channel_L000019_602
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 rdlong r3, r17 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_queue_proc ' CALL addrg
C_s85ge_696de09b_threads_destroy_channel_L000019_603
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85ge_696de09b_threads_destroy_channel_L000019_602  ' NEU4
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s85ge_696de09b_threads_destroy_channel_L000019_600
 mov r19, ##0 ' reg <- con
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s85ge_696de09b_threads_destroy_channel_L000019_605 ' EQU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##@C_s85ge_696de09b_threads_destroy_channel_L000019_607_L000608 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r19, r21
 adds r19, #12 ' ADDP4 coni
C_s85ge_696de09b_threads_destroy_channel_L000019_605
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s85ge_696de09b_threads_destroy_channel_L000019_609 ' EQU4
 jmp #\@C_s85ge_696de09b_threads_destroy_channel_L000019_612 ' JUMPV addrg
C_s85ge_696de09b_threads_destroy_channel_L000019_611
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 rdlong r3, r17 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_queue_proc ' CALL addrg
C_s85ge_696de09b_threads_destroy_channel_L000019_612
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s85ge_696de09b_threads_destroy_channel_L000019_611  ' NEU4
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s85ge_696de09b_threads_destroy_channel_L000019_609
 mov r2, ##@C_s85g_696de09b_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r21
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_destroy ' CALL addrg
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_destroy ' CALL addrg
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r21
 adds r2, #56 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_destroy ' CALL addrg
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_destroy ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s85ge_696de09b_threads_destroy_channel_L000019_591
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g13_696de09b_threads_stacksize_L000040 ' <symbol:threads_stacksize>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_s85g13_696de09b_threads_stacksize_L000040_615 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_a jmp #\C_s85g13_696de09b_threads_stacksize_L000040_619 ' GTI4
 mov r2, ##@C_s85g13_696de09b_threads_stacksize_L000040_617_L000618 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s85g13_696de09b_threads_stacksize_L000040_619
 wrlong r21, ##@C_stacksize ' ASGNI4 addrg reg
C_s85g13_696de09b_threads_stacksize_L000040_615
 mov r2, ##@C_stacksize
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s85g13_696de09b_threads_stacksize_L000040_614 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g16_696de09b_threads_factories_L000043 ' <symbol:threads_factories>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_s85g16_696de09b_threads_factories_L000043_621 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_a jmp #\C_s85g16_696de09b_threads_factories_L000043_625 ' GTI4
 mov r2, ##@C_s85g16_696de09b_threads_factories_L000043_623_L000624 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s85g16_696de09b_threads_factories_L000043_625
 cmps r21,  #16 wcz
 if_be jmp #\C_s85g16_696de09b_threads_factories_L000043_626 ' LEI4
 mov r21, #16 ' reg <- coni
C_s85g16_696de09b_threads_factories_L000043_626
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_set_numfactories ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_s85g16_696de09b_threads_factories_L000043_622 ' JUMPV addrg
C_s85g16_696de09b_threads_factories_L000043_621
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sched_get_numfactories ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s85g16_696de09b_threads_factories_L000043_622
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s85g16_696de09b_threads_factories_L000043_620 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g14_696de09b_threads_factory_L000041 ' <symbol:threads_factory>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_s85g14_696de09b_threads_factory_L000041_629 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_a jmp #\C_s85g14_696de09b_threads_factory_L000041_631 ' GTI4
 mov r2, ##@C_s85g16_696de09b_threads_factories_L000043_623_L000624 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s85g14_696de09b_threads_factory_L000041_631
 cmps r21,  #16 wcz
 if_be jmp #\C_s85g14_696de09b_threads_factory_L000041_632 ' LEI4
 mov r21, #16 ' reg <- coni
C_s85g14_696de09b_threads_factory_L000041_632
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_set_factory ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_s85g14_696de09b_threads_factory_L000041_630 ' JUMPV addrg
C_s85g14_696de09b_threads_factory_L000041_629
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sched_get_factory ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s85g14_696de09b_threads_factory_L000041_630
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s85g14_696de09b_threads_factory_L000041_628 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g15_696de09b_threads_version_L000042 ' <symbol:threads_version>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_s85g15_696de09b_threads_version_L000042_635 ' LEI4
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_s85g15_696de09b_threads_version_L000042_639_L000640 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85g15_696de09b_threads_version_L000042_637 ' NEI4
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g15_696de09b_threads_version_L000042_636 ' JUMPV addrg
C_s85g15_696de09b_threads_version_L000042_637
 mov r2, ##@C_s85g15_696de09b_threads_version_L000042_643_L000644 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85g15_696de09b_threads_version_L000042_641 ' NEI4
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g15_696de09b_threads_version_L000042_636 ' JUMPV addrg
C_s85g15_696de09b_threads_version_L000042_641
 mov r2, ##885 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_s85g15_696de09b_threads_version_L000042_636 ' JUMPV addrg
C_s85g15_696de09b_threads_version_L000042_635
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
C_s85g15_696de09b_threads_version_L000042_636
 mov r0, #1 ' reg <- coni
' C_s85g15_696de09b_threads_version_L000042_634 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gm_696de09b_threads_sleep_L000027 ' <symbol:threads_sleep>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_s85gm_696de09b_threads_sleep_L000027_646 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_ae jmp #\C_s85gm_696de09b_threads_sleep_L000027_650 ' GEI4
 mov r2, ##@C_s85gm_696de09b_threads_sleep_L000027_648_L000649 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s85gm_696de09b_threads_sleep_L000027_650
 cmps r21,  #0 wcz
 if_be jmp #\C_s85gm_696de09b_threads_sleep_L000027_651 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_sleep ' CALL addrg
 jmp #\@C_s85gm_696de09b_threads_sleep_L000027_647 ' JUMPV addrg
C_s85gm_696de09b_threads_sleep_L000027_651
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 jmp #\@C_s85gm_696de09b_threads_sleep_L000027_647 ' JUMPV addrg
C_s85gm_696de09b_threads_sleep_L000027_646
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
C_s85gm_696de09b_threads_sleep_L000027_647
 mov r0, #0 ' reg <- coni
' C_s85gm_696de09b_threads_sleep_L000027_645 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gn_696de09b_threads_msleep_L000028 ' <symbol:threads_msleep>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_s85gn_696de09b_threads_msleep_L000028_654 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_ae jmp #\C_s85gn_696de09b_threads_msleep_L000028_658 ' GEI4
 mov r2, ##@C_s85gn_696de09b_threads_msleep_L000028_656_L000657 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s85gn_696de09b_threads_msleep_L000028_658
 cmps r21,  #0 wcz
 if_be jmp #\C_s85gn_696de09b_threads_msleep_L000028_659 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_msleep ' CALL addrg
 jmp #\@C_s85gn_696de09b_threads_msleep_L000028_655 ' JUMPV addrg
C_s85gn_696de09b_threads_msleep_L000028_659
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 jmp #\@C_s85gn_696de09b_threads_msleep_L000028_655 ' JUMPV addrg
C_s85gn_696de09b_threads_msleep_L000028_654
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
C_s85gn_696de09b_threads_msleep_L000028_655
 mov r0, #0 ' reg <- coni
' C_s85gn_696de09b_threads_msleep_L000028_653 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gk_696de09b_threads_print_L000025 ' <symbol:threads_print>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #1 wz
 if_nz jmp #\C_s85gk_696de09b_threads_print_L000025_662 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85gk_696de09b_threads_print_L000025_664 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_s85gk_696de09b_threads_print_L000025_666_L000667 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_printf
 add SP, #4 ' CALL addrg
 jmp #\@C_s85gk_696de09b_threads_print_L000025_663 ' JUMPV addrg
C_s85gk_696de09b_threads_print_L000025_664
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85gk_696de09b_threads_print_L000025_668 ' NEI4
 mov r2, ##@C_s85gk_696de09b_threads_print_L000025_670_L000671 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_s85gk_696de09b_threads_print_L000025_663 ' JUMPV addrg
C_s85gk_696de09b_threads_print_L000025_668
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #1 wz
 if_nz jmp #\C_s85gk_696de09b_threads_print_L000025_672 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s85gk_696de09b_threads_print_L000025_679 ' EQI4
 mov r17, ##@C_s85gk_696de09b_threads_print_L000025_674_L000675 ' reg <- addrg
 jmp #\@C_s85gk_696de09b_threads_print_L000025_680 ' JUMPV addrg
C_s85gk_696de09b_threads_print_L000025_679
 mov r17, ##@C_s85gk_696de09b_threads_print_L000025_676_L000677 ' reg <- addrg
C_s85gk_696de09b_threads_print_L000025_680
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_s85gk_696de09b_threads_print_L000025_663 ' JUMPV addrg
C_s85gk_696de09b_threads_print_L000025_672
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_topointer
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_s85gk_696de09b_threads_print_L000025_681_L000682 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_printf
 add SP, #8 ' CALL addrg
 jmp #\@C_s85gk_696de09b_threads_print_L000025_663 ' JUMPV addrg
C_s85gk_696de09b_threads_print_L000025_662
 mov r21, #1 ' reg <- coni
 jmp #\@C_s85gk_696de09b_threads_print_L000025_686 ' JUMPV addrg
C_s85gk_696de09b_threads_print_L000025_683
 cmps r21,  #1 wcz
 if_be jmp #\C_s85gk_696de09b_threads_print_L000025_687 ' LEI4
 mov r2, ##@C_s85gk_696de09b_threads_print_L000025_689_L000690 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
C_s85gk_696de09b_threads_print_L000025_687
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85gk_696de09b_threads_print_L000025_691 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_s85gk_696de09b_threads_print_L000025_692 ' JUMPV addrg
C_s85gk_696de09b_threads_print_L000025_691
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85gk_696de09b_threads_print_L000025_693 ' NEI4
 mov r2, ##@C_s85gk_696de09b_threads_print_L000025_695_L000696 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_s85gk_696de09b_threads_print_L000025_694 ' JUMPV addrg
C_s85gk_696de09b_threads_print_L000025_693
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #1 wz
 if_nz jmp #\C_s85gk_696de09b_threads_print_L000025_697 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s85gk_696de09b_threads_print_L000025_704 ' EQI4
 mov r17, ##@C_s85gk_696de09b_threads_print_L000025_699_L000700 ' reg <- addrg
 jmp #\@C_s85gk_696de09b_threads_print_L000025_705 ' JUMPV addrg
C_s85gk_696de09b_threads_print_L000025_704
 mov r17, ##@C_s85gk_696de09b_threads_print_L000025_701_L000702 ' reg <- addrg
C_s85gk_696de09b_threads_print_L000025_705
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_s85gk_696de09b_threads_print_L000025_698 ' JUMPV addrg
C_s85gk_696de09b_threads_print_L000025_697
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_topointer
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_s85gk_696de09b_threads_print_L000025_706_L000707 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_printf
 add SP, #8 ' CALL addrg
C_s85gk_696de09b_threads_print_L000025_698
C_s85gk_696de09b_threads_print_L000025_694
C_s85gk_696de09b_threads_print_L000025_692
' C_s85gk_696de09b_threads_print_L000025_684 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_s85gk_696de09b_threads_print_L000025_686
 cmps r21, r19 wcz
 if_be jmp #\C_s85gk_696de09b_threads_print_L000025_683 ' LEI4
 mov r2, ##@C_s85gk_696de09b_threads_print_L000025_708_L000709 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
C_s85gk_696de09b_threads_print_L000025_663
 mov r0, #0 ' reg <- coni
' C_s85gk_696de09b_threads_print_L000025_661 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85gl_696de09b_threads_print_raw_L000026 ' <symbol:threads_print_raw>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r21, #1 ' reg <- coni
 jmp #\@C_s85gl_696de09b_threads_print_raw_L000026_714 ' JUMPV addrg
C_s85gl_696de09b_threads_print_raw_L000026_711
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s85gl_696de09b_threads_print_raw_L000026_715 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_s85gl_696de09b_threads_print_raw_L000026_716 ' JUMPV addrg
C_s85gl_696de09b_threads_print_raw_L000026_715
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s85gl_696de09b_threads_print_raw_L000026_717 ' NEI4
 mov r2, ##@C_s85gk_696de09b_threads_print_L000025_695_L000696 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_s85gl_696de09b_threads_print_raw_L000026_718 ' JUMPV addrg
C_s85gl_696de09b_threads_print_raw_L000026_717
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #1 wz
 if_nz jmp #\C_s85gl_696de09b_threads_print_raw_L000026_719 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s85gl_696de09b_threads_print_raw_L000026_722 ' EQI4
 mov r17, ##@C_s85gk_696de09b_threads_print_L000025_699_L000700 ' reg <- addrg
 jmp #\@C_s85gl_696de09b_threads_print_raw_L000026_723 ' JUMPV addrg
C_s85gl_696de09b_threads_print_raw_L000026_722
 mov r17, ##@C_s85gk_696de09b_threads_print_L000025_701_L000702 ' reg <- addrg
C_s85gl_696de09b_threads_print_raw_L000026_723
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_s85gl_696de09b_threads_print_raw_L000026_720 ' JUMPV addrg
C_s85gl_696de09b_threads_print_raw_L000026_719
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_topointer
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_s85gk_696de09b_threads_print_L000025_706_L000707 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_printf
 add SP, #8 ' CALL addrg
C_s85gl_696de09b_threads_print_raw_L000026_720
C_s85gl_696de09b_threads_print_raw_L000026_718
C_s85gl_696de09b_threads_print_raw_L000026_716
' C_s85gl_696de09b_threads_print_raw_L000026_712 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_s85gl_696de09b_threads_print_raw_L000026_714
 cmps r21, r19 wcz
 if_be jmp #\C_s85gl_696de09b_threads_print_raw_L000026_711 ' LEI4
 mov r0, #0 ' reg <- coni
' C_s85gl_696de09b_threads_print_raw_L000026_710 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luathread_get_channel

 alignl ' align long
C_luathread_get_channel ' <symbol:luathread_get_channel>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_luathread_get_channel_724 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luathread_get_status

 alignl ' align long
C_luathread_get_status ' <symbol:luathread_get_status>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_luathread_get_status_725 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luathread_set_status

 alignl ' align long
C_luathread_set_status ' <symbol:luathread_set_status>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 wrlong r2, r22 ' ASGNI4 reg reg
' C_luathread_set_status_726 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luathread_get_state

 alignl ' align long
C_luathread_get_state ' <symbol:luathread_get_state>
 rdlong r0, r2 ' reg <- INDIRP4 reg
' C_luathread_get_state_727 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export luathread_get_numargs

 alignl ' align long
C_luathread_get_numargs ' <symbol:luathread_get_numargs>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_luathread_get_numargs_728 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luathread_set_numargs

 alignl ' align long
C_luathread_set_numargs ' <symbol:luathread_set_numargs>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 wrlong r2, r22 ' ASGNI4 reg reg
' C_luathread_set_numargs_729 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s85g56_696de09b_luathread_reglualib_L000730 ' <symbol:luathread_reglualib>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, ##@C_s85g56_696de09b_luathread_reglualib_L000730_732_L000733 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s85g56_696de09b_luathread_reglualib_L000730_734_L000735 ' reg ARG ADDRG
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##-3 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_s85g56_696de09b_luathread_reglualib_L000730_731 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g8_696de09b_luathread_openlualibs_L000013 ' <symbol:luathread_openlualibs>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_luaopen_base ' reg ARG ADDRG
 mov r4, ##@C_s85g8_696de09b_luathread_openlualibs_L000013_737_L000738 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_luaopen_package ' reg ARG ADDRG
 mov r4, ##@C_s85g56_696de09b_luathread_reglualib_L000730_732_L000733 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##@C_luaopen_io ' reg ARG ADDRG
 mov r3, ##@C_s85g8_696de09b_luathread_openlualibs_L000013_739_L000740 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g56_696de09b_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_os ' reg ARG ADDRG
 mov r3, ##@C_s85g8_696de09b_luathread_openlualibs_L000013_741_L000742 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g56_696de09b_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_table ' reg ARG ADDRG
 mov r3, ##@C_s85g8_696de09b_luathread_openlualibs_L000013_743_L000744 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g56_696de09b_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_string ' reg ARG ADDRG
 mov r3, ##@C_s85g8_696de09b_luathread_openlualibs_L000013_745_L000746 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g56_696de09b_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_math ' reg ARG ADDRG
 mov r3, ##@C_s85g8_696de09b_luathread_openlualibs_L000013_747_L000748 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g56_696de09b_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_debug ' reg ARG ADDRG
 mov r3, ##@C_s85g8_696de09b_luathread_openlualibs_L000013_749_L000750 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g56_696de09b_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_coroutine ' reg ARG ADDRG
 mov r3, ##@C_s85g33_696de09b_luathread_new_L000215_221_L000222 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g56_696de09b_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_utf8 ' reg ARG ADDRG
 mov r3, ##@C_s85g8_696de09b_luathread_openlualibs_L000013_751_L000752 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g56_696de09b_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_propeller ' reg ARG ADDRG
 mov r3, ##@C_s85g33_696de09b_luathread_new_L000215_219_L000220 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s85g56_696de09b_luathread_reglualib_L000730
 add SP, #8 ' CALL addrg
' C_s85g8_696de09b_luathread_openlualibs_L000013_736 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaopen_threads

 alignl ' align long
C_luaopen_threads ' <symbol:luaopen_threads>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 mov r3, ##@C_luaopen_threads_754_L000755
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #41 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_s85g19_696de09b_luathread_funcs_L000046 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 wrlong r23, ##@C_s85g5_696de09b_mainlp_L000010 ' ASGNP4 addrg reg
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_s85g5_696de09b_mainlp_L000010+4 ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_s85g5_696de09b_mainlp_L000010+8 ' ASGNI4 addrg reg
 mov r22, ##0 ' reg <- con
 wrlong r22, ##@C_s85g5_696de09b_mainlp_L000010+12 ' ASGNP4 addrg reg
 mov r22, ##0 ' reg <- con
 wrlong r22, ##@C_s85g5_696de09b_mainlp_L000010+16 ' ASGNP4 addrg reg
 mov r2, ##@C_s85g2_696de09b_recycle_list_L000007 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_init ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_luaL__newstate ' CALL addrg
 wrlong r0, ##@C_s85g4_696de09b_chanls_L000009 ' ASGNP4 addrg reg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, ##@C_s85g2j_696de09b_channel_create_L000137_139_L000140 ' reg ARG ADDRG
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_luaopen_base ' reg ARG ADDRG
 mov r4, ##@C_s85g8_696de09b_luathread_openlualibs_L000013_737_L000738 ' reg ARG ADDRG
 mov r5, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r5, r5
 ' reg ARG INDIR ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_s85g4_696de09b_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_newuserdatauv
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_threads_760_L000761 ' reg ARG ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_threads_762_L000763 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__newmetatable
 add SP, #4 ' CALL addrg
 mov r2, ##@C_luaopen_threads_764_L000765 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_s85g37_696de09b_luathread_join_workers_L000223 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 mov r2, ##-3 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawset
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##@C_luaopen_threads_760_L000761 ' reg ARG ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_threads_762_L000763 ' reg ARG ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setmetatable
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sched_init ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_luaopen_threads_766 ' NEI4
 mov r2, ##@C_s85gf_696de09b_threads_set_numworkers_L000020_316_L000317 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_luaopen_threads_766
 mov r0, #1 ' reg <- coni
' C_luaopen_threads_753 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s85g18_696de09b_luathread_loadlib_L000045 ' <symbol:luathread_loadlib>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 mov r3, ##@C_luaopen_threads_754_L000755
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #41 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_s85g19_696de09b_luathread_funcs_L000046 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s85g18_696de09b_luathread_loadlib_L000045_768 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import luaopen_propeller

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_s85g5_696de09b_mainlp_L000010 ' <symbol:mainlp>
 byte 0[20]

 alignl ' align long
C_s85g2_696de09b_recycle_list_L000007 ' <symbol:recycle_list>
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
C_s85g8_696de09b_luathread_openlualibs_L000013_751_L000752 ' <symbol:751>
 byte 117
 byte 116
 byte 102
 byte 56
 byte 0

 alignl ' align long
C_s85g8_696de09b_luathread_openlualibs_L000013_749_L000750 ' <symbol:749>
 byte 100
 byte 101
 byte 98
 byte 117
 byte 103
 byte 0

 alignl ' align long
C_s85g8_696de09b_luathread_openlualibs_L000013_747_L000748 ' <symbol:747>
 byte 109
 byte 97
 byte 116
 byte 104
 byte 0

 alignl ' align long
C_s85g8_696de09b_luathread_openlualibs_L000013_745_L000746 ' <symbol:745>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s85g8_696de09b_luathread_openlualibs_L000013_743_L000744 ' <symbol:743>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s85g8_696de09b_luathread_openlualibs_L000013_741_L000742 ' <symbol:741>
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_s85g8_696de09b_luathread_openlualibs_L000013_739_L000740 ' <symbol:739>
 byte 105
 byte 111
 byte 0

 alignl ' align long
C_s85g8_696de09b_luathread_openlualibs_L000013_737_L000738 ' <symbol:737>
 byte 95
 byte 71
 byte 0

 alignl ' align long
C_s85g56_696de09b_luathread_reglualib_L000730_734_L000735 ' <symbol:734>
 byte 112
 byte 114
 byte 101
 byte 108
 byte 111
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_s85g56_696de09b_luathread_reglualib_L000730_732_L000733 ' <symbol:732>
 byte 112
 byte 97
 byte 99
 byte 107
 byte 97
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_s85gk_696de09b_threads_print_L000025_708_L000709 ' <symbol:708>
 byte 10
 byte 0

 alignl ' align long
C_s85gk_696de09b_threads_print_L000025_706_L000707 ' <symbol:706>
 byte 37
 byte 115
 byte 58
 byte 37
 byte 88
 byte 0

 alignl ' align long
C_s85gk_696de09b_threads_print_L000025_701_L000702 ' <symbol:701>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_s85gk_696de09b_threads_print_L000025_699_L000700 ' <symbol:699>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_s85gk_696de09b_threads_print_L000025_695_L000696 ' <symbol:695>
 byte 110
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_s85gk_696de09b_threads_print_L000025_689_L000690 ' <symbol:689>
 byte 9
 byte 0

 alignl ' align long
C_s85gk_696de09b_threads_print_L000025_681_L000682 ' <symbol:681>
 byte 37
 byte 115
 byte 58
 byte 37
 byte 108
 byte 88
 byte 10
 byte 0

 alignl ' align long
C_s85gk_696de09b_threads_print_L000025_676_L000677 ' <symbol:676>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 10
 byte 0

 alignl ' align long
C_s85gk_696de09b_threads_print_L000025_674_L000675 ' <symbol:674>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 10
 byte 0

 alignl ' align long
C_s85gk_696de09b_threads_print_L000025_670_L000671 ' <symbol:670>
 byte 110
 byte 105
 byte 108
 byte 10
 byte 0

 alignl ' align long
C_s85gk_696de09b_threads_print_L000025_666_L000667 ' <symbol:666>
 byte 37
 byte 115
 byte 10
 byte 0

 alignl ' align long
C_s85gn_696de09b_threads_msleep_L000028_656_L000657 ' <symbol:656>
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
C_s85gm_696de09b_threads_sleep_L000027_648_L000649 ' <symbol:648>
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
C_s85g15_696de09b_threads_version_L000042_643_L000644 ' <symbol:643>
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
C_s85g15_696de09b_threads_version_L000042_639_L000640 ' <symbol:639>
 byte 108
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_s85g16_696de09b_threads_factories_L000043_623_L000624 ' <symbol:623>
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
C_s85g13_696de09b_threads_stacksize_L000040_617_L000618 ' <symbol:617>
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
C_s85ge_696de09b_threads_destroy_channel_L000019_607_L000608 ' <symbol:607>
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
C_s85ge_696de09b_threads_destroy_channel_L000019_598_L000599 ' <symbol:598>
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
C_s85gd_696de09b_threads_create_channel_L000018_589_L000590 ' <symbol:589>
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
C_s85gc_696de09b_threads_receive_L000017_570_L000571 ' <symbol:570>
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
C_s85gc_696de09b_threads_receive_L000017_568_L000569 ' <symbol:568>
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
C_s85g10_696de09b_threads_update_L000037_553_L000554 ' <symbol:553>
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
C_s85g10_696de09b_threads_update_L000037_539_L000540 ' <symbol:539>
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
C_s85g10_696de09b_threads_update_L000037_535_L000536 ' <symbol:535>
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
C_s85g10_696de09b_threads_update_L000037_531_L000532 ' <symbol:531>
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
C_s85g11_696de09b_threads_export_L000038_526_L000527 ' <symbol:526>
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
C_s85g11_696de09b_threads_export_L000038_511_L000512 ' <symbol:511>
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
C_s85g11_696de09b_threads_export_L000038_496_L000497 ' <symbol:496>
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
C_s85g11_696de09b_threads_export_L000038_492_L000493 ' <symbol:492>
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
C_s85gv_696de09b_threads_shared_L000036_487_L000488 ' <symbol:487>
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
C_s85gv_696de09b_threads_shared_L000036_481_L000482 ' <symbol:481>
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
C_s85gv_696de09b_threads_shared_L000036_471_L000472 ' <symbol:471>
 byte 46
 byte 0

 alignl ' align long
C_s85gv_696de09b_threads_shared_L000036_462_L000463 ' <symbol:462>
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
C_s85gv_696de09b_threads_shared_L000036_458_L000459 ' <symbol:458>
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
C_s85gr_696de09b_threads_wait_for_L000032_388_L000389 ' <symbol:388>
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
C_s85gi_696de09b_threads_send_async_L000023_364_L000365 ' <symbol:364>
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
C_s85gb_696de09b_threads_send_L000016_341_L000342 ' <symbol:341>
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
C_s85g9_696de09b_threads_create_newproc_L000014_328_L000329 ' <symbol:328>
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
C_s85g9_696de09b_threads_create_newproc_L000014_324_L000325 ' <symbol:324>
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
C_s85gf_696de09b_threads_set_numworkers_L000020_316_L000317 ' <symbol:316>
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
C_s85gf_696de09b_threads_set_numworkers_L000020_311_L000312 ' <symbol:311>
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
C_s85gh_696de09b_threads_recycle_set_L000022_299_L000300 ' <symbol:299>
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
C_s85g3g_696de09b_luathread_copyupvalues_L000272_296_L000297 ' <symbol:296>
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
C_s85g3g_696de09b_luathread_copyupvalues_L000272_289_L000290 ' <symbol:289>
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
C_s85g3e_696de09b_func_dump_L000266_270_L000271 ' <symbol:270>
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
C_s85g3b_696de09b_writer_L000228_240_L000241 ' <symbol:240>
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
C_s85g3b_696de09b_writer_L000228_234_L000235 ' <symbol:234>
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
C_s85g33_696de09b_luathread_new_L000215_221_L000222 ' <symbol:221>
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
C_s85g33_696de09b_luathread_new_L000215_219_L000220 ' <symbol:219>
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
C_s85g33_696de09b_luathread_new_L000215_217_L000218 ' <symbol:217>
 byte 116
 byte 104
 byte 114
 byte 101
 byte 97
 byte 100
 byte 115
 byte 0

 alignl ' align long
C_s85g31_696de09b_luathread_getself_L000211_213_L000214 ' <symbol:213>
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
C_s85g2o_696de09b_luathread_copyvalues_L000165_206_L000207 ' <symbol:206>
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
C_s85g2o_696de09b_luathread_copyvalues_L000165_204_L000205 ' <symbol:204>
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
C_s85g2o_696de09b_luathread_copyvalues_L000165_171_L000172 ' <symbol:171>
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
C_s85g2o_696de09b_luathread_copyvalues_L000165_169_L000170 ' <symbol:169>
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
C_s85g2j_696de09b_channel_create_L000137_139_L000140 ' <symbol:139>
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
C_s85g2i_696de09b_127_L000128 ' <symbol:127>
 byte 97
 byte 103
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_s85g2h_696de09b_125_L000126 ' <symbol:125>
 byte 97
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_s85g2g_696de09b_123_L000124 ' <symbol:123>
 byte 103
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_s85g2f_696de09b_121_L000122 ' <symbol:121>
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_s85g2e_696de09b_119_L000120 ' <symbol:119>
 byte 100
 byte 101
 byte 115
 byte 116
 byte 114
 byte 111
 byte 121
 byte 0

 alignl ' align long
C_s85g2d_696de09b_117_L000118 ' <symbol:117>
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
C_s85g2c_696de09b_115_L000116 ' <symbol:115>
 byte 109
 byte 117
 byte 116
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_s85g2b_696de09b_113_L000114 ' <symbol:113>
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 0

 alignl ' align long
C_s85g2a_696de09b_111_L000112 ' <symbol:111>
 byte 119
 byte 111
 byte 114
 byte 107
 byte 101
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_s85g29_696de09b_109_L000110 ' <symbol:109>
 byte 110
 byte 101
 byte 119
 byte 0

 alignl ' align long
C_s85g28_696de09b_107_L000108 ' <symbol:107>
 byte 103
 byte 99
 byte 0

 alignl ' align long
C_s85g27_696de09b_105_L000106 ' <symbol:105>
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_s85g26_696de09b_103_L000104 ' <symbol:103>
 byte 102
 byte 97
 byte 99
 byte 116
 byte 111
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_s85g25_696de09b_101_L000102 ' <symbol:101>
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
C_s85g24_696de09b_99_L000100 ' <symbol:99>
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
C_s85g23_696de09b_97_L000098 ' <symbol:97>
 byte 115
 byte 98
 byte 114
 byte 107
 byte 0

 alignl ' align long
C_s85g22_696de09b_95_L000096 ' <symbol:95>
 byte 111
 byte 117
 byte 116
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_s85g21_696de09b_93_L000094 ' <symbol:93>
 byte 112
 byte 114
 byte 105
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_s85g20_696de09b_91_L000092 ' <symbol:91>
 byte 109
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_s85g1v_696de09b_89_L000090 ' <symbol:89>
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_s85g1u_696de09b_87_L000088 ' <symbol:87>
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
C_s85g1t_696de09b_85_L000086 ' <symbol:85>
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
C_s85g1s_696de09b_83_L000084 ' <symbol:83>
 byte 101
 byte 120
 byte 112
 byte 111
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_s85g1r_696de09b_81_L000082 ' <symbol:81>
 byte 117
 byte 112
 byte 100
 byte 97
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_s85g1q_696de09b_79_L000080 ' <symbol:79>
 byte 115
 byte 104
 byte 97
 byte 114
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_s85g1p_696de09b_77_L000078 ' <symbol:77>
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
C_s85g1o_696de09b_75_L000076 ' <symbol:75>
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
C_s85g1n_696de09b_73_L000074 ' <symbol:73>
 byte 115
 byte 105
 byte 103
 byte 110
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_s85g1m_696de09b_71_L000072 ' <symbol:71>
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
C_s85g1l_696de09b_69_L000070 ' <symbol:69>
 byte 117
 byte 110
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s85g1k_696de09b_67_L000068 ' <symbol:67>
 byte 116
 byte 114
 byte 121
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s85g1j_696de09b_65_L000066 ' <symbol:65>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s85g1i_696de09b_63_L000064 ' <symbol:63>
 byte 114
 byte 101
 byte 99
 byte 121
 byte 99
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s85g1h_696de09b_61_L000062 ' <symbol:61>
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
C_s85g1g_696de09b_59_L000060 ' <symbol:59>
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
C_s85g1f_696de09b_57_L000058 ' <symbol:57>
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
C_s85g1e_696de09b_55_L000056 ' <symbol:55>
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
C_s85g1d_696de09b_53_L000054 ' <symbol:53>
 byte 114
 byte 101
 byte 99
 byte 101
 byte 105
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s85g1c_696de09b_51_L000052 ' <symbol:51>
 byte 115
 byte 101
 byte 110
 byte 100
 byte 0

 alignl ' align long
C_s85g1b_696de09b_49_L000050 ' <symbol:49>
 byte 119
 byte 97
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_s85g1a_696de09b_47_L000048 ' <symbol:47>
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
