' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_smv8_670edcd7_mutex_channel_list_L000005 ' <symbol:mutex_channel_list>
 long 0
 long $0
 long $0
 long 0

 alignl ' align long
C_smv81_670edcd7_mutex_recycle_list_L000006 ' <symbol:mutex_recycle_list>
 long 0
 long $0
 long $0
 long 0

 alignl ' align long
C_smv83_670edcd7_recyclemax_L000008 ' <symbol:recyclemax>
 long 0

' Catalina Export stacksize

 alignl ' align long
C_stacksize ' <symbol:stacksize>
 long 4000

 alignl ' align long
C_smv84_670edcd7_chanls_L000009 ' <symbol:chanls>
 long $0

' Catalina Export cond_mainls_sendrecv

 alignl ' align long
C_cond_mainls_sendrecv ' <symbol:cond_mainls_sendrecv>
 long 0
 long $0

 alignl ' align long
C_smv86_670edcd7_mutex_mainls_L000011 ' <symbol:mutex_mainls>
 long 0
 long $0
 long $0
 long 0

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_smv817_670edcd7_luathread_funcs_L000044 ' <symbol:luathread_funcs>
 long @C_smv818_670edcd7_45_L000046
 long @C_smv88_670edcd7_threads_create_newproc_L000013
 long @C_smv819_670edcd7_47_L000048
 long @C_smv89_670edcd7_threads_wait_L000014
 long @C_smv81a_670edcd7_49_L000050
 long @C_smv8a_670edcd7_threads_send_L000015
 long @C_smv81b_670edcd7_51_L000052
 long @C_smv8b_670edcd7_threads_receive_L000016
 long @C_smv81c_670edcd7_53_L000054
 long @C_smv8c_670edcd7_threads_create_channel_L000017
 long @C_smv81d_670edcd7_55_L000056
 long @C_smv8d_670edcd7_threads_destroy_channel_L000018
 long @C_smv81e_670edcd7_57_L000058
 long @C_smv8e_670edcd7_threads_set_numworkers_L000019
 long @C_smv81f_670edcd7_59_L000060
 long @C_smv8f_670edcd7_threads_get_numworkers_L000020
 long @C_smv81g_670edcd7_61_L000062
 long @C_smv8g_670edcd7_threads_recycle_set_L000021
 long @C_smv81h_670edcd7_63_L000064
 long @C_smv8n_670edcd7_threads_lock_L000028
 long @C_smv81i_670edcd7_65_L000066
 long @C_smv8p_670edcd7_threads_trylock_L000030
 long @C_smv81j_670edcd7_67_L000068
 long @C_smv8o_670edcd7_threads_unlock_L000029
 long @C_smv81k_670edcd7_69_L000070
 long @C_smv8q_670edcd7_threads_wait_for_L000031
 long @C_smv81l_670edcd7_71_L000072
 long @C_smv8r_670edcd7_threads_signal_L000032
 long @C_smv81m_670edcd7_73_L000074
 long @C_smv8s_670edcd7_threads_broadcast_L000033
 long @C_smv81n_670edcd7_75_L000076
 long @C_smv8t_670edcd7_threads_rendezvous_L000034
 long @C_smv81o_670edcd7_77_L000078
 long @C_smv8u_670edcd7_threads_shared_L000035
 long @C_smv81p_670edcd7_79_L000080
 long @C_smv8v_670edcd7_threads_update_L000036
 long @C_smv81q_670edcd7_81_L000082
 long @C_smv810_670edcd7_threads_export_L000037
 long @C_smv81r_670edcd7_83_L000084
 long @C_smv8h_670edcd7_threads_send_async_L000022
 long @C_smv81s_670edcd7_85_L000086
 long @C_smv8i_670edcd7_threads_receive_async_L000023
 long @C_smv81t_670edcd7_87_L000088
 long @C_smv8l_670edcd7_threads_sleep_L000026
 long @C_smv81u_670edcd7_89_L000090
 long @C_smv8m_670edcd7_threads_msleep_L000027
 long @C_smv81v_670edcd7_91_L000092
 long @C_smv8j_670edcd7_threads_print_L000024
 long @C_smv820_670edcd7_93_L000094
 long @C_smv8k_670edcd7_threads_print_raw_L000025
 long @C_smv821_670edcd7_95_L000096
 long @C_smv811_670edcd7_threads_sbrk_L000038
 long @C_smv822_670edcd7_97_L000098
 long @C_smv812_670edcd7_threads_stacksize_L000039
 long @C_smv823_670edcd7_99_L000100
 long @C_smv815_670edcd7_threads_factories_L000042
 long @C_smv824_670edcd7_101_L000102
 long @C_smv813_670edcd7_threads_factory_L000040
 long @C_smv825_670edcd7_103_L000104
 long @C_smv814_670edcd7_threads_version_L000041
 long @C_smv826_670edcd7_105_L000106
 long @C_smv88_670edcd7_threads_create_newproc_L000013
 long @C_smv827_670edcd7_107_L000108
 long @C_smv8e_670edcd7_threads_set_numworkers_L000019
 long @C_smv828_670edcd7_109_L000110
 long @C_smv8c_670edcd7_threads_create_channel_L000017
 long @C_smv829_670edcd7_111_L000112
 long @C_smv8c_670edcd7_threads_create_channel_L000017
 long @C_smv82a_670edcd7_113_L000114
 long @C_smv8c_670edcd7_threads_create_channel_L000017
 long @C_smv82b_670edcd7_115_L000116
 long @C_smv8d_670edcd7_threads_destroy_channel_L000018
 long @C_smv82c_670edcd7_117_L000118
 long @C_smv8a_670edcd7_threads_send_L000015
 long @C_smv82d_670edcd7_119_L000120
 long @C_smv8b_670edcd7_threads_receive_L000016
 long @C_smv82e_670edcd7_121_L000122
 long @C_smv8h_670edcd7_threads_send_async_L000022
 long @C_smv82f_670edcd7_123_L000124
 long @C_smv8i_670edcd7_threads_receive_async_L000023
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
 if_nz jmp #\C_list_insert_126  ' NEU4
 wrlong r2, r3 ' ASGNP4 reg reg
 jmp #\@C_list_insert_127 ' JUMPV addrg
C_list_insert_126
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 wrlong r2, r22 ' ASGNP4 reg reg
C_list_insert_127
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
' C_list_insert_125 ' (symbol refcount = 0)
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
 if_z jmp #\C_list_remove_129 ' EQU4
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
 jmp #\@C_list_remove_128 ' JUMPV addrg
C_list_remove_129
 mov r0, ##0 ' RET con
C_list_remove_128
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
' C_list_count_131 ' (symbol refcount = 0)
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
' C_list_init_132 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_smv82g_670edcd7_channel_create_L000133 ' <symbol:channel_create>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_smv82g_670edcd7_channel_create_L000133_135_L000136 ' reg ARG ADDRG
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, #72 ' reg ARG coni
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
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
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
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
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
' C_smv82g_670edcd7_channel_create_L000133_134 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv82i_670edcd7_channel_unlocked_get_L000137 ' <symbol:channel_unlocked_get>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_smv82g_670edcd7_channel_create_L000133_135_L000136 ' reg ARG ADDRG
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##-1 ' reg ARG con
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
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
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
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
' C_smv82i_670edcd7_channel_unlocked_get_L000137_138 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_smv82j_670edcd7_channel_locked_get_L000139 ' <symbol:channel_locked_get>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 cmps r21,  #0 wz
 if_z jmp #\C_smv82j_670edcd7_channel_locked_get_L000139_148 ' EQI4
 jmp #\@C_smv82j_670edcd7_channel_locked_get_L000139_144 ' JUMPV addrg
C_smv82j_670edcd7_channel_locked_get_L000139_143
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov r3, r19
 adds r3, #56 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
C_smv82j_670edcd7_channel_locked_get_L000139_144
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_smv82i_670edcd7_channel_unlocked_get_L000137 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv82j_670edcd7_channel_locked_get_L000139_146 ' EQU4
 mov r2, r19
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv82j_670edcd7_channel_locked_get_L000139_143 ' NEI4
C_smv82j_670edcd7_channel_locked_get_L000139_146
 jmp #\@C_smv82j_670edcd7_channel_locked_get_L000139_142 ' JUMPV addrg
C_smv82j_670edcd7_channel_locked_get_L000139_147
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
C_smv82j_670edcd7_channel_locked_get_L000139_148
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_smv82i_670edcd7_channel_unlocked_get_L000137 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv82j_670edcd7_channel_locked_get_L000139_150 ' EQU4
 mov r2, r19
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv82j_670edcd7_channel_locked_get_L000139_147 ' NEI4
C_smv82j_670edcd7_channel_locked_get_L000139_150
C_smv82j_670edcd7_channel_locked_get_L000139_142
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
' C_smv82j_670edcd7_channel_locked_get_L000139_140 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luathread_unlock_channel

 alignl ' align long
C_luathread_unlock_channel ' <symbol:luathread_unlock_channel>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
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
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
' C_luathread_unlock_channel_151 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luathread_recycle_insert

 alignl ' align long
C_luathread_recycle_insert ' <symbol:luathread_recycle_insert>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_smv81_670edcd7_mutex_recycle_list_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_smv82_670edcd7_recycle_list_L000007 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_count ' CALL addrg
 mov r20, ##@C_smv83_670edcd7_recyclemax_L000008
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 cmps r0, r20 wcz
 if_b jmp #\C_luathread_recycle_insert_153 ' LTI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_get_state ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_close ' CALL addrg
 jmp #\@C_luathread_recycle_insert_154 ' JUMPV addrg
C_luathread_recycle_insert_153
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_smv82_670edcd7_recycle_list_L000007 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_list_insert
 add SP, #4 ' CALL addrg
C_luathread_recycle_insert_154
 mov r2, ##@C_smv81_670edcd7_mutex_recycle_list_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
' C_luathread_recycle_insert_152 ' (symbol refcount = 0)
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
' C_luathread_queue_sender_155 ' (symbol refcount = 0)
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
' C_luathread_queue_receiver_156 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv82k_670edcd7_luathread_loadbuffer_L000157 ' <symbol:luathread_loadbuffer>
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
 if_z jmp #\C_smv82k_670edcd7_luathread_loadbuffer_L000157_159 ' EQI4
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
C_smv82k_670edcd7_luathread_loadbuffer_L000157_159
' C_smv82k_670edcd7_luathread_loadbuffer_L000157_158 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_smv82l_670edcd7_luathread_copyvalues_L000161 ' <symbol:luathread_copyvalues>
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
 if_nz jmp #\C_smv82l_670edcd7_luathread_copyvalues_L000161_163 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv82l_670edcd7_luathread_copyvalues_L000161_165_L000166 ' reg ARG ADDRG
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
 mov r2, ##@C_smv82l_670edcd7_luathread_copyvalues_L000161_167_L000168 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_162 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_163
 mov r19, #2 ' reg <- coni
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_172 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_169
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 if_b jmp #\C_smv82l_670edcd7_luathread_copyvalues_L000161_173 ' LTI4
 cmps r15,  #5 wcz
 if_a jmp #\C_smv82l_670edcd7_luathread_copyvalues_L000161_173 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_smv82l_670edcd7_luathread_copyvalues_L000161_204_L000206 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_smv82l_670edcd7_luathread_copyvalues_L000161_204_L000206 ' <symbol:204>
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161_181
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161_176
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161_173
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161_177
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161_180
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161_182

' Catalina Code

DAT ' code segment
C_smv82l_670edcd7_luathread_copyvalues_L000161_176
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
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_174 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_177
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_smv82l_670edcd7_luathread_copyvalues_L000161_178 ' EQI4
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
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_174 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_178
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
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_174 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_180
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
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_174 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_181
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_174 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_182
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
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_184 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_183
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #4 wz
 if_nz jmp #\C_smv82l_670edcd7_luathread_copyvalues_L000161_186 ' NEI4
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
 if_b jmp #\C_smv82l_670edcd7_luathread_copyvalues_L000161_188 ' LTI4
 cmps r13,  #4 wcz
 if_a jmp #\C_smv82l_670edcd7_luathread_copyvalues_L000161_188 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_smv82l_670edcd7_luathread_copyvalues_L000161_197_L000199 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_smv82l_670edcd7_luathread_copyvalues_L000161_197_L000199 ' <symbol:197>
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161_196
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161_191
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161_188
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161_192
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161_195

' Catalina Code

DAT ' code segment
C_smv82l_670edcd7_luathread_copyvalues_L000161_191
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
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_189 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_192
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_smv82l_670edcd7_luathread_copyvalues_L000161_193 ' EQI4
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
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_194 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_193
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
C_smv82l_670edcd7_luathread_copyvalues_L000161_194
 mov r2, ##-3 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_189 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_195
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
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_189 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_196
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
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_189 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_188
 mov r2, ##-2 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_189
C_smv82l_670edcd7_luathread_copyvalues_L000161_186
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_184
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_next
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv82l_670edcd7_luathread_copyvalues_L000161_183 ' NEI4
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_174 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_173
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
 mov r3, ##@C_smv82l_670edcd7_luathread_copyvalues_L000161_200_L000201 ' reg ARG ADDRG
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
 mov r3, ##@C_smv82l_670edcd7_luathread_copyvalues_L000161_202_L000203 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_smv82l_670edcd7_luathread_copyvalues_L000161_162 ' JUMPV addrg
C_smv82l_670edcd7_luathread_copyvalues_L000161_174
' C_smv82l_670edcd7_luathread_copyvalues_L000161_170 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_smv82l_670edcd7_luathread_copyvalues_L000161_172
 cmps r19, r17 wcz
 if_be jmp #\C_smv82l_670edcd7_luathread_copyvalues_L000161_169 ' LEI4
 mov r0, #1 ' reg <- coni
C_smv82l_670edcd7_luathread_copyvalues_L000161_162
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_smv82u_670edcd7_luathread_getself_L000207 ' <symbol:luathread_getself>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_smv82u_670edcd7_luathread_getself_L000207_209_L000210 ' reg ARG ADDRG
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
' C_smv82u_670edcd7_luathread_getself_L000207_208 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_smv830_670edcd7_luathread_new_L000211 ' <symbol:luathread_new>
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
 mov r2, ##@C_smv82u_670edcd7_luathread_getself_L000207_209_L000210 ' reg ARG ADDRG
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
 long @C_smv87_670edcd7_luathread_openlualibs_L000012 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_smv816_670edcd7_luathread_loadlib_L000043 ' reg ARG ADDRG
 mov r4, ##@C_smv830_670edcd7_luathread_new_L000211_213_L000214 ' reg ARG ADDRG
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
 mov r4, ##@C_smv830_670edcd7_luathread_new_L000211_215_L000216 ' reg ARG ADDRG
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
 mov r4, ##@C_smv830_670edcd7_luathread_new_L000211_217_L000218 ' reg ARG ADDRG
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
' C_smv830_670edcd7_luathread_new_L000211_212 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv834_670edcd7_luathread_join_workers_L000219 ' <symbol:luathread_join_workers>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sched_join_workers ' CALL addrg
 mov r2, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_close ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_smv834_670edcd7_luathread_join_workers_L000219_220 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv835_670edcd7_writer_L000221 ' <symbol:writer>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r17 ' CVI, CVU or LOAD
 rdlong r22, r15 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_smv835_670edcd7_writer_L000221_223 ' NEI4
 mov r22, #1 ' reg <- coni
 wrlong r22, r15 ' ASGNI4 reg reg
 mov r2, r15
 adds r2, #4 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
C_smv835_670edcd7_writer_L000221_223
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r15
 adds r4, #4 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_smv835_670edcd7_writer_L000221_222 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv836_670edcd7_func_dump_L000225 ' <symbol:func_dump>
 calld PA,#NEWF
 sub SP, #280
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-284)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #6 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-280)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-284)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-280) ' reg ARG ADDRLi
 mov r4, ##@C_smv835_670edcd7_writer_L000221 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_dump
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_smv836_670edcd7_func_dump_L000225_227 ' EQI4
 mov r2, ##@C_smv836_670edcd7_func_dump_L000225_229_L000230 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_smv836_670edcd7_func_dump_L000225_226 ' JUMPV addrg
C_smv836_670edcd7_func_dump_L000225_227
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
 mov r0, #1 ' reg <- coni
C_smv836_670edcd7_func_dump_L000225_226
 calld PA,#POPM ' restore registers
 add SP, #280 ' framesize
 calld PA,#RETF


 alignl ' align long
C_smv838_670edcd7_luathread_copyupvalues_L000232 ' <symbol:luathread_copyupvalues>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #1 ' reg <- coni
 jmp #\@C_smv838_670edcd7_luathread_copyupvalues_L000232_235 ' JUMPV addrg
C_smv838_670edcd7_luathread_copyupvalues_L000232_234
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 if_b jmp #\C_smv838_670edcd7_luathread_copyupvalues_L000232_237 ' LTI4
 cmps r15,  #5 wcz
 if_a jmp #\C_smv838_670edcd7_luathread_copyupvalues_L000232_237 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_smv838_670edcd7_luathread_copyupvalues_L000232_251_L000253 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_smv838_670edcd7_luathread_copyupvalues_L000232_251_L000253 ' <symbol:251>
 long @C_smv838_670edcd7_luathread_copyupvalues_L000232_245
 long @C_smv838_670edcd7_luathread_copyupvalues_L000232_240
 long @C_smv838_670edcd7_luathread_copyupvalues_L000232_237
 long @C_smv838_670edcd7_luathread_copyupvalues_L000232_241
 long @C_smv838_670edcd7_luathread_copyupvalues_L000232_244
 long @C_smv838_670edcd7_luathread_copyupvalues_L000232_246

' Catalina Code

DAT ' code segment
C_smv838_670edcd7_luathread_copyupvalues_L000232_240
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
 jmp #\@C_smv838_670edcd7_luathread_copyupvalues_L000232_238 ' JUMPV addrg
C_smv838_670edcd7_luathread_copyupvalues_L000232_241
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_smv838_670edcd7_luathread_copyupvalues_L000232_242 ' EQI4
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
 jmp #\@C_smv838_670edcd7_luathread_copyupvalues_L000232_238 ' JUMPV addrg
C_smv838_670edcd7_luathread_copyupvalues_L000232_242
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
 jmp #\@C_smv838_670edcd7_luathread_copyupvalues_L000232_238 ' JUMPV addrg
C_smv838_670edcd7_luathread_copyupvalues_L000232_244
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
 jmp #\@C_smv838_670edcd7_luathread_copyupvalues_L000232_238 ' JUMPV addrg
C_smv838_670edcd7_luathread_copyupvalues_L000232_245
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_smv838_670edcd7_luathread_copyupvalues_L000232_238 ' JUMPV addrg
C_smv838_670edcd7_luathread_copyupvalues_L000232_246
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
 if_z jmp #\C_smv838_670edcd7_luathread_copyupvalues_L000232_247 ' EQI4
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
 jmp #\@C_smv838_670edcd7_luathread_copyupvalues_L000232_238 ' JUMPV addrg
C_smv838_670edcd7_luathread_copyupvalues_L000232_247
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_smv838_670edcd7_luathread_copyupvalues_L000232_237
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
 mov r3, ##@C_smv838_670edcd7_luathread_copyupvalues_L000232_249_L000250 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_smv838_670edcd7_luathread_copyupvalues_L000232_233 ' JUMPV addrg
C_smv838_670edcd7_luathread_copyupvalues_L000232_238
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
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv838_670edcd7_luathread_copyupvalues_L000232_254  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv838_670edcd7_luathread_copyupvalues_L000232_256_L000257 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_smv838_670edcd7_luathread_copyupvalues_L000232_233 ' JUMPV addrg
C_smv838_670edcd7_luathread_copyupvalues_L000232_254
 adds r17, #1 ' ADDI4 coni
C_smv838_670edcd7_luathread_copyupvalues_L000232_235
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getupvalue
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv838_670edcd7_luathread_copyupvalues_L000232_234  ' NEU4
 mov r0, #1 ' reg <- coni
C_smv838_670edcd7_luathread_copyupvalues_L000232_233
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_smv8g_670edcd7_threads_recycle_set_L000021 ' <symbol:threads_recycle_set>
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
 if_ae jmp #\C_smv8g_670edcd7_threads_recycle_set_L000021_261 ' GEI4
 mov r2, ##@C_smv8g_670edcd7_threads_recycle_set_L000021_259_L000260 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_smv8g_670edcd7_threads_recycle_set_L000021_261
 mov r2, ##@C_smv81_670edcd7_mutex_recycle_list_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 wrlong r19, ##@C_smv83_670edcd7_recyclemax_L000008 ' ASGNI4 addrg reg
 jmp #\@C_smv8g_670edcd7_threads_recycle_set_L000021_263 ' JUMPV addrg
C_smv8g_670edcd7_threads_recycle_set_L000021_262
 mov r2, ##@C_smv82_670edcd7_recycle_list_L000007 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r2, r21 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_close ' CALL addrg
C_smv8g_670edcd7_threads_recycle_set_L000021_263
 mov r2, ##@C_smv82_670edcd7_recycle_list_L000007 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_count ' CALL addrg
 mov r20, ##@C_smv83_670edcd7_recyclemax_L000008
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 cmps r0, r20 wcz
 if_a jmp #\C_smv8g_670edcd7_threads_recycle_set_L000021_262 ' GTI4
 mov r2, ##@C_smv81_670edcd7_mutex_recycle_list_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_smv8g_670edcd7_threads_recycle_set_L000021_258 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv89_670edcd7_threads_wait_L000014 ' <symbol:threads_wait>
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
 if_be jmp #\C_smv89_670edcd7_threads_wait_L000014_266 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_smv8q_670edcd7_threads_wait_for_L000031 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_smv89_670edcd7_threads_wait_L000014_265 ' JUMPV addrg
C_smv89_670edcd7_threads_wait_L000014_266
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sched_wait ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_malloc_defragment ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_smv89_670edcd7_threads_wait_L000014_265
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8e_670edcd7_threads_set_numworkers_L000019 ' <symbol:threads_set_numworkers>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_smv8e_670edcd7_threads_set_numworkers_L000019_269 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_ae jmp #\C_smv8e_670edcd7_threads_set_numworkers_L000019_273 ' GEI4
 mov r2, ##@C_smv8e_670edcd7_threads_set_numworkers_L000019_271_L000272 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_smv8e_670edcd7_threads_set_numworkers_L000019_273
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_set_numworkers ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_smv8e_670edcd7_threads_set_numworkers_L000019_274 ' NEI4
 mov r2, ##@C_smv8e_670edcd7_threads_set_numworkers_L000019_276_L000277 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_smv8e_670edcd7_threads_set_numworkers_L000019_274
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_malloc_defragment ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #8 ' CALL addrg
C_smv8e_670edcd7_threads_set_numworkers_L000019_269
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
' C_smv8e_670edcd7_threads_set_numworkers_L000019_268 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8f_670edcd7_threads_get_numworkers_L000020 ' <symbol:threads_get_numworkers>
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
' C_smv8f_670edcd7_threads_get_numworkers_L000020_278 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv88_670edcd7_threads_create_newproc_L000013 ' <symbol:threads_create_newproc>
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
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r15,  #6 wz
 if_nz jmp #\C_smv88_670edcd7_threads_create_newproc_L000013_280 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_smv836_670edcd7_func_dump_L000225 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #1 wz
 if_z jmp #\C_smv88_670edcd7_threads_create_newproc_L000013_282 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv88_670edcd7_threads_create_newproc_L000013_284_L000285 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv88_670edcd7_threads_create_newproc_L000013_279 ' JUMPV addrg
C_smv88_670edcd7_threads_create_newproc_L000013_282
 mov r2, #1 ' reg ARG coni
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #\@C_smv88_670edcd7_threads_create_newproc_L000013_281 ' JUMPV addrg
C_smv88_670edcd7_threads_create_newproc_L000013_280
 cmps r15,  #4 wz
 if_z jmp #\C_smv88_670edcd7_threads_create_newproc_L000013_286 ' EQI4
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
 mov r3, ##@C_smv88_670edcd7_threads_create_newproc_L000013_288_L000289 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv88_670edcd7_threads_create_newproc_L000013_279 ' JUMPV addrg
C_smv88_670edcd7_threads_create_newproc_L000013_286
C_smv88_670edcd7_threads_create_newproc_L000013_281
 mov r2, ##@C_smv81_670edcd7_mutex_recycle_list_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r22, ##@C_smv83_670edcd7_recyclemax_L000008
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_be jmp #\C_smv88_670edcd7_threads_create_newproc_L000013_290 ' LEI4
 mov r2, ##@C_smv82_670edcd7_recycle_list_L000007 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv88_670edcd7_threads_create_newproc_L000013_292  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_smv830_670edcd7_luathread_new_L000211 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_smv88_670edcd7_threads_create_newproc_L000013_291 ' JUMPV addrg
C_smv88_670edcd7_threads_create_newproc_L000013_292
 mov r2, #0 ' reg ARG coni
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #\@C_smv88_670edcd7_threads_create_newproc_L000013_291 ' JUMPV addrg
C_smv88_670edcd7_threads_create_newproc_L000013_290
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_smv830_670edcd7_luathread_new_L000211 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_smv88_670edcd7_threads_create_newproc_L000013_291
 mov r2, ##@C_smv81_670edcd7_mutex_recycle_list_L000006 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
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
 long @C_smv82k_670edcd7_luathread_loadbuffer_L000157
 add SP, #12 ' CALL addrg
 cmps r15,  #6 wz
 if_nz jmp #\C_smv88_670edcd7_threads_create_newproc_L000013_294 ' NEI4
 mov r2, r13
 adds r2, #1 ' ADDI4 coni
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv838_670edcd7_luathread_copyupvalues_L000232
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv88_670edcd7_threads_create_newproc_L000013_296 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_recycle_insert ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv88_670edcd7_threads_create_newproc_L000013_279 ' JUMPV addrg
C_smv88_670edcd7_threads_create_newproc_L000013_296
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_smv88_670edcd7_threads_create_newproc_L000013_294
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
 mov r0, #1 ' reg <- coni
C_smv88_670edcd7_threads_create_newproc_L000013_279
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_smv8a_670edcd7_threads_send_L000015 ' <symbol:threads_send>
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
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8a_670edcd7_threads_send_L000015_299  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8a_670edcd7_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8a_670edcd7_threads_send_L000015_298 ' JUMPV addrg
C_smv8a_670edcd7_threads_send_L000015_299
 mov r2, r19
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv8a_670edcd7_threads_send_L000015_303 ' EQU4
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161
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
 mov r20, ##@C_smv85_670edcd7_mainlp_L000010
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_smv8a_670edcd7_threads_send_L000015_305  ' NEU4
 mov r2, ##@C_smv86_670edcd7_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_cond_mainls_sendrecv ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_signal ' CALL addrg
 mov r2, ##@C_smv86_670edcd7_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #\@C_smv8a_670edcd7_threads_send_L000015_306 ' JUMPV addrg
C_smv8a_670edcd7_threads_send_L000015_305
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_queue_proc ' CALL addrg
C_smv8a_670edcd7_threads_send_L000015_306
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 cmps r21,  #1 wz
 if_nz jmp #\C_smv8a_670edcd7_threads_send_L000015_307 ' NEI4
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
 jmp #\@C_smv8a_670edcd7_threads_send_L000015_298 ' JUMPV addrg
C_smv8a_670edcd7_threads_send_L000015_307
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8a_670edcd7_threads_send_L000015_298 ' JUMPV addrg
C_smv8a_670edcd7_threads_send_L000015_303
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##@C_smv85_670edcd7_mainlp_L000010
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_smv8a_670edcd7_threads_send_L000015_309  ' NEU4
 wrlong r19, ##@C_smv85_670edcd7_mainlp_L000010+12 ' ASGNP4 addrg reg
 mov r2, ##@C_smv85_670edcd7_mainlp_L000010 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_queue_sender ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 mov r2, ##@C_smv86_670edcd7_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_smv86_670edcd7_mutex_mainls_L000011 ' reg ARG ADDRG
 mov r3, ##@C_cond_mainls_sendrecv ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv86_670edcd7_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, ##@C_smv85_670edcd7_mainlp_L000010+8
 rdlong r0, r0 ' reg <- INDIRI4 addrg
 jmp #\@C_smv8a_670edcd7_threads_send_L000015_298 ' JUMPV addrg
C_smv8a_670edcd7_threads_send_L000015_309
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_smv82u_670edcd7_luathread_getself_L000207 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv8a_670edcd7_threads_send_L000015_313 ' EQU4
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
C_smv8a_670edcd7_threads_send_L000015_313
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
C_smv8a_670edcd7_threads_send_L000015_298
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8h_670edcd7_threads_send_async_L000022 ' <symbol:threads_send_async>
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
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8h_670edcd7_threads_send_async_L000022_316  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8a_670edcd7_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8h_670edcd7_threads_send_async_L000022_315 ' JUMPV addrg
C_smv8h_670edcd7_threads_send_async_L000022_316
 mov r2, r19
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv8h_670edcd7_threads_send_async_L000022_318 ' EQU4
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161
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
 mov r20, ##@C_smv85_670edcd7_mainlp_L000010
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_smv8h_670edcd7_threads_send_async_L000022_320  ' NEU4
 mov r2, ##@C_smv86_670edcd7_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_cond_mainls_sendrecv ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_signal ' CALL addrg
 mov r2, ##@C_smv86_670edcd7_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #\@C_smv8h_670edcd7_threads_send_async_L000022_321 ' JUMPV addrg
C_smv8h_670edcd7_threads_send_async_L000022_320
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_queue_proc ' CALL addrg
C_smv8h_670edcd7_threads_send_async_L000022_321
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 cmps r21,  #1 wz
 if_nz jmp #\C_smv8h_670edcd7_threads_send_async_L000022_322 ' NEI4
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
 jmp #\@C_smv8h_670edcd7_threads_send_async_L000022_315 ' JUMPV addrg
C_smv8h_670edcd7_threads_send_async_L000022_322
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8h_670edcd7_threads_send_async_L000022_315 ' JUMPV addrg
C_smv8h_670edcd7_threads_send_async_L000022_318
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8h_670edcd7_threads_send_async_L000022_324_L000325 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
C_smv8h_670edcd7_threads_send_async_L000022_315
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8n_670edcd7_threads_lock_L000028 ' <symbol:threads_lock>
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
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8n_670edcd7_threads_lock_L000028_330  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8a_670edcd7_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8n_670edcd7_threads_lock_L000028_326 ' JUMPV addrg
C_smv8n_670edcd7_threads_lock_L000028_329
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
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_smv8n_670edcd7_threads_lock_L000028_330
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv8n_670edcd7_threads_lock_L000028_332 ' EQU4
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 if_nz jmp #\C_smv8n_670edcd7_threads_lock_L000028_329 ' NEI4
C_smv8n_670edcd7_threads_lock_L000028_332
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8n_670edcd7_threads_lock_L000028_333  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_smv8n_670edcd7_threads_lock_L000028_326 ' JUMPV addrg
C_smv8n_670edcd7_threads_lock_L000028_333
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
C_smv8n_670edcd7_threads_lock_L000028_326
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8p_670edcd7_threads_trylock_L000030 ' <symbol:threads_trylock>
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
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8p_670edcd7_threads_trylock_L000030_336  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8a_670edcd7_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8p_670edcd7_threads_trylock_L000030_335 ' JUMPV addrg
C_smv8p_670edcd7_threads_trylock_L000030_336
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv8p_670edcd7_threads_trylock_L000030_338 ' NEI4
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
 jmp #\@C_smv8p_670edcd7_threads_trylock_L000030_339 ' JUMPV addrg
C_smv8p_670edcd7_threads_trylock_L000030_338
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
C_smv8p_670edcd7_threads_trylock_L000030_339
 mov r0, #1 ' reg <- coni
C_smv8p_670edcd7_threads_trylock_L000030_335
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8o_670edcd7_threads_unlock_L000029 ' <symbol:threads_unlock>
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
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8o_670edcd7_threads_unlock_L000029_341  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8a_670edcd7_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8o_670edcd7_threads_unlock_L000029_340 ' JUMPV addrg
C_smv8o_670edcd7_threads_unlock_L000029_341
 mov r2, r21
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv8o_670edcd7_threads_unlock_L000029_343 ' NEI4
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
 jmp #\@C_smv8o_670edcd7_threads_unlock_L000029_344 ' JUMPV addrg
C_smv8o_670edcd7_threads_unlock_L000029_343
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
C_smv8o_670edcd7_threads_unlock_L000029_344
 mov r0, #1 ' reg <- coni
C_smv8o_670edcd7_threads_unlock_L000029_340
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8q_670edcd7_threads_wait_for_L000031 ' <symbol:threads_wait_for>
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
 if_z jmp #\C_smv8q_670edcd7_threads_wait_for_L000031_346 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv8q_670edcd7_threads_wait_for_L000031_348_L000349 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8q_670edcd7_threads_wait_for_L000031_345 ' JUMPV addrg
C_smv8q_670edcd7_threads_wait_for_L000031_346
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8q_670edcd7_threads_wait_for_L000031_350  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8a_670edcd7_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8q_670edcd7_threads_wait_for_L000031_345 ' JUMPV addrg
C_smv8q_670edcd7_threads_wait_for_L000031_350
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
C_smv8q_670edcd7_threads_wait_for_L000031_345
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8r_670edcd7_threads_signal_L000032 ' <symbol:threads_signal>
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
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8r_670edcd7_threads_signal_L000032_353  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8a_670edcd7_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8r_670edcd7_threads_signal_L000032_352 ' JUMPV addrg
C_smv8r_670edcd7_threads_signal_L000032_353
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
C_smv8r_670edcd7_threads_signal_L000032_352
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8s_670edcd7_threads_broadcast_L000033 ' <symbol:threads_broadcast>
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
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8s_670edcd7_threads_broadcast_L000033_356  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8a_670edcd7_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8s_670edcd7_threads_broadcast_L000033_355 ' JUMPV addrg
C_smv8s_670edcd7_threads_broadcast_L000033_356
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
C_smv8s_670edcd7_threads_broadcast_L000033_355
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8t_670edcd7_threads_rendezvous_L000034 ' <symbol:threads_rendezvous>
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
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8t_670edcd7_threads_rendezvous_L000034_362  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8a_670edcd7_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8t_670edcd7_threads_rendezvous_L000034_358 ' JUMPV addrg
C_smv8t_670edcd7_threads_rendezvous_L000034_361
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
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_smv8t_670edcd7_threads_rendezvous_L000034_362
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv8t_670edcd7_threads_rendezvous_L000034_364 ' EQU4
 mov r2, r19
 adds r2, #40 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_trylock ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 if_nz jmp #\C_smv8t_670edcd7_threads_rendezvous_L000034_361 ' NEI4
C_smv8t_670edcd7_threads_rendezvous_L000034_364
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8t_670edcd7_threads_rendezvous_L000034_365  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_smv8t_670edcd7_threads_rendezvous_L000034_358 ' JUMPV addrg
C_smv8t_670edcd7_threads_rendezvous_L000034_365
 mov r2, r19
 adds r2, #64 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_broadcast ' CALL addrg
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
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8t_670edcd7_threads_rendezvous_L000034_367  ' NEU4
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
 mov r3, ##@C_smv8a_670edcd7_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8t_670edcd7_threads_rendezvous_L000034_358 ' JUMPV addrg
C_smv8t_670edcd7_threads_rendezvous_L000034_367
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
C_smv8t_670edcd7_threads_rendezvous_L000034_358
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv83l_670edcd7_simple_type_L000369 ' <symbol:simple_type>
 calld PA,#PSHM
 long $800000 ' save registers
 cmps r2,  #0 wz
 if_z jmp #\C_smv83l_670edcd7_simple_type_L000369_376 ' EQI4
 cmps r2,  #3 wz
 if_z jmp #\C_smv83l_670edcd7_simple_type_L000369_376 ' EQI4
 cmps r2,  #1 wz
 if_z jmp #\C_smv83l_670edcd7_simple_type_L000369_376 ' EQI4
 cmps r2,  #4 wz
 if_nz jmp #\C_smv83l_670edcd7_simple_type_L000369_372 ' NEI4
C_smv83l_670edcd7_simple_type_L000369_376
 mov r23, #1 ' reg <- coni
 jmp #\@C_smv83l_670edcd7_simple_type_L000369_373 ' JUMPV addrg
C_smv83l_670edcd7_simple_type_L000369_372
 mov r23, #0 ' reg <- coni
C_smv83l_670edcd7_simple_type_L000369_373
 mov r0, r23 ' CVI, CVU or LOAD
' C_smv83l_670edcd7_simple_type_L000369_370 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_smv83m_670edcd7_luathread_movevalues_L000377 ' <symbol:luathread_movevalues>
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
 if_nz jmp #\C_smv83m_670edcd7_luathread_movevalues_L000377_379 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_378 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_379
 mov r19, #1 ' reg <- coni
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_384 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_381
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 if_b jmp #\C_smv83m_670edcd7_luathread_movevalues_L000377_385 ' LTI4
 cmps r15,  #5 wcz
 if_a jmp #\C_smv83m_670edcd7_luathread_movevalues_L000377_385 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_smv83m_670edcd7_luathread_movevalues_L000377_412_L000414 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_smv83m_670edcd7_luathread_movevalues_L000377_412_L000414 ' <symbol:412>
 long @C_smv83m_670edcd7_luathread_movevalues_L000377_393
 long @C_smv83m_670edcd7_luathread_movevalues_L000377_388
 long @C_smv83m_670edcd7_luathread_movevalues_L000377_385
 long @C_smv83m_670edcd7_luathread_movevalues_L000377_389
 long @C_smv83m_670edcd7_luathread_movevalues_L000377_392
 long @C_smv83m_670edcd7_luathread_movevalues_L000377_394

' Catalina Code

DAT ' code segment
C_smv83m_670edcd7_luathread_movevalues_L000377_388
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
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_386 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_389
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_smv83m_670edcd7_luathread_movevalues_L000377_390 ' EQI4
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
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_386 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_390
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
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_386 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_392
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
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_386 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_393
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_386 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_394
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_396 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_395
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #4 wz
 if_nz jmp #\C_smv83m_670edcd7_luathread_movevalues_L000377_398 ' NEI4
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
 if_b jmp #\C_smv83m_670edcd7_luathread_movevalues_L000377_400 ' LTI4
 cmps r13,  #4 wcz
 if_a jmp #\C_smv83m_670edcd7_luathread_movevalues_L000377_400 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_smv83m_670edcd7_luathread_movevalues_L000377_409_L000411 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_smv83m_670edcd7_luathread_movevalues_L000377_409_L000411 ' <symbol:409>
 long @C_smv83m_670edcd7_luathread_movevalues_L000377_408
 long @C_smv83m_670edcd7_luathread_movevalues_L000377_403
 long @C_smv83m_670edcd7_luathread_movevalues_L000377_400
 long @C_smv83m_670edcd7_luathread_movevalues_L000377_404
 long @C_smv83m_670edcd7_luathread_movevalues_L000377_407

' Catalina Code

DAT ' code segment
C_smv83m_670edcd7_luathread_movevalues_L000377_403
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
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_401 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_404
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_smv83m_670edcd7_luathread_movevalues_L000377_405 ' EQI4
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
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_406 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_405
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
C_smv83m_670edcd7_luathread_movevalues_L000377_406
 mov r2, ##-3 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_401 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_407
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
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_401 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_408
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
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_401 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_400
 mov r2, ##-2 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_401
C_smv83m_670edcd7_luathread_movevalues_L000377_398
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_396
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_next
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv83m_670edcd7_luathread_movevalues_L000377_395 ' NEI4
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_386 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_385
 mov r0, #0 ' reg <- coni
 jmp #\@C_smv83m_670edcd7_luathread_movevalues_L000377_378 ' JUMPV addrg
C_smv83m_670edcd7_luathread_movevalues_L000377_386
' C_smv83m_670edcd7_luathread_movevalues_L000377_382 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_smv83m_670edcd7_luathread_movevalues_L000377_384
 cmps r19, r17 wcz
 if_be jmp #\C_smv83m_670edcd7_luathread_movevalues_L000377_381 ' LEI4
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
C_smv83m_670edcd7_luathread_movevalues_L000377_378
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_smv8u_670edcd7_threads_shared_L000035 ' <symbol:threads_shared>
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
 if_z jmp #\C_smv8u_670edcd7_threads_shared_L000035_416 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_418_L000419 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8u_670edcd7_threads_shared_L000035_415 ' JUMPV addrg
C_smv8u_670edcd7_threads_shared_L000035_416
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8u_670edcd7_threads_shared_L000035_420  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_422_L000423 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8u_670edcd7_threads_shared_L000035_415 ' JUMPV addrg
C_smv8u_670edcd7_threads_shared_L000035_420
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
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
 if_nz jmp #\C_smv8u_670edcd7_threads_shared_L000035_424  ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_nz jmp #\C_smv8u_670edcd7_threads_shared_L000035_426 ' NEI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
C_smv8u_670edcd7_threads_shared_L000035_426
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv83m_670edcd7_luathread_movevalues_L000377
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_smv8u_670edcd7_threads_shared_L000035_425 ' NEI4
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_smv8u_670edcd7_threads_shared_L000035_415 ' JUMPV addrg
C_smv8u_670edcd7_threads_shared_L000035_424
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
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-140) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_smv8u_670edcd7_threads_shared_L000035_435 ' EQI4
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_smv8u_670edcd7_threads_shared_L000035_433 ' EQI4
C_smv8u_670edcd7_threads_shared_L000035_435
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_smv8u_670edcd7_threads_shared_L000035_415 ' JUMPV addrg
C_smv8u_670edcd7_threads_shared_L000035_433
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_smv8u_670edcd7_threads_shared_L000035_437 ' JUMPV addrg
C_smv8u_670edcd7_threads_shared_L000035_436
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_smv8u_670edcd7_threads_shared_L000035_439 ' EQI4
 mov r2, ##-3 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
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
 mov r3, ##@C_smv8u_670edcd7_threads_shared_L000035_441_L000442 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8u_670edcd7_threads_shared_L000035_415 ' JUMPV addrg
C_smv8u_670edcd7_threads_shared_L000035_439
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r19, r21 ' CVI, CVU or LOAD
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_smv8u_670edcd7_threads_shared_L000035_437
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8u_670edcd7_threads_shared_L000035_436  ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##-1 ' reg ARG con
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_nz jmp #\C_smv8u_670edcd7_threads_shared_L000035_443 ' NEI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
C_smv8u_670edcd7_threads_shared_L000035_443
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv83m_670edcd7_luathread_movevalues_L000377
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_smv8u_670edcd7_threads_shared_L000035_445 ' NEI4
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_smv8u_670edcd7_threads_shared_L000035_415 ' JUMPV addrg
C_smv8u_670edcd7_threads_shared_L000035_445
C_smv8u_670edcd7_threads_shared_L000035_425
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_447_L000448 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' reg <- coni
C_smv8u_670edcd7_threads_shared_L000035_415
 calld PA,#POPM ' restore registers
 add SP, #136 ' framesize
 calld PA,#RETF


 alignl ' align long
C_smv810_670edcd7_threads_export_L000037 ' <symbol:threads_export>
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
 if_z jmp #\C_smv810_670edcd7_threads_export_L000037_450 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv810_670edcd7_threads_export_L000037_452_L000453 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv810_670edcd7_threads_export_L000037_449 ' JUMPV addrg
C_smv810_670edcd7_threads_export_L000037_450
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv810_670edcd7_threads_export_L000037_454  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv810_670edcd7_threads_export_L000037_456_L000457 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv810_670edcd7_threads_export_L000037_449 ' JUMPV addrg
C_smv810_670edcd7_threads_export_L000037_454
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
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
 if_nz jmp #\C_smv810_670edcd7_threads_export_L000037_458  ' NEU4
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
 if_be jmp #\C_smv810_670edcd7_threads_export_L000037_460 ' LEI4
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_nz jmp #\C_smv810_670edcd7_threads_export_L000037_460 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_smv810_670edcd7_threads_export_L000037_464 ' EQI4
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_smv810_670edcd7_threads_export_L000037_462 ' EQI4
C_smv810_670edcd7_threads_export_L000037_464
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
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
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
C_smv810_670edcd7_threads_export_L000037_462
C_smv810_670edcd7_threads_export_L000037_460
 mov r2, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv83m_670edcd7_luathread_movevalues_L000377
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-140)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-140) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_smv810_670edcd7_threads_export_L000037_459 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_smv810_670edcd7_threads_export_L000037_449 ' JUMPV addrg
C_smv810_670edcd7_threads_export_L000037_458
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
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
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
 if_z jmp #\C_smv810_670edcd7_threads_export_L000037_470 ' EQI4
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_smv810_670edcd7_threads_export_L000037_468 ' EQI4
C_smv810_670edcd7_threads_export_L000037_470
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv810_670edcd7_threads_export_L000037_471_L000472 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv810_670edcd7_threads_export_L000037_449 ' JUMPV addrg
C_smv810_670edcd7_threads_export_L000037_468
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_smv810_670edcd7_threads_export_L000037_473 ' EQI4
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
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
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
C_smv810_670edcd7_threads_export_L000037_473
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_smv810_670edcd7_threads_export_L000037_476 ' JUMPV addrg
C_smv810_670edcd7_threads_export_L000037_475
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
 if_z jmp #\C_smv810_670edcd7_threads_export_L000037_478 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv810_670edcd7_threads_export_L000037_471_L000472 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv810_670edcd7_threads_export_L000037_449 ' JUMPV addrg
C_smv810_670edcd7_threads_export_L000037_478
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_smv810_670edcd7_threads_export_L000037_480 ' EQI4
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
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
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
C_smv810_670edcd7_threads_export_L000037_480
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
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r21, r19 ' CVI, CVU or LOAD
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_smv810_670edcd7_threads_export_L000037_476
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv810_670edcd7_threads_export_L000037_475  ' NEU4
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
 if_nz jmp #\C_smv810_670edcd7_threads_export_L000037_482 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_smv810_670edcd7_threads_export_L000037_484 ' EQI4
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
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
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
C_smv810_670edcd7_threads_export_L000037_484
C_smv810_670edcd7_threads_export_L000037_482
 mov r2, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv83m_670edcd7_luathread_movevalues_L000377
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-140)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_smv810_670edcd7_threads_export_L000037_449 ' JUMPV addrg
C_smv810_670edcd7_threads_export_L000037_459
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv810_670edcd7_threads_export_L000037_486_L000487 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' reg <- coni
C_smv810_670edcd7_threads_export_L000037_449
 calld PA,#POPM ' restore registers
 add SP, #136 ' framesize
 calld PA,#RETF


 alignl ' align long
C_smv8v_670edcd7_threads_update_L000036 ' <symbol:threads_update>
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
 if_z jmp #\C_smv8v_670edcd7_threads_update_L000036_489 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv8v_670edcd7_threads_update_L000036_491_L000492 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8v_670edcd7_threads_update_L000036_488 ' JUMPV addrg
C_smv8v_670edcd7_threads_update_L000036_489
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
 long @C_smv83l_670edcd7_simple_type_L000369 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv8v_670edcd7_threads_update_L000036_493 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv8v_670edcd7_threads_update_L000036_495_L000496 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8v_670edcd7_threads_update_L000036_488 ' JUMPV addrg
C_smv8v_670edcd7_threads_update_L000036_493
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8v_670edcd7_threads_update_L000036_497  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv8v_670edcd7_threads_update_L000036_499_L000500 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8v_670edcd7_threads_update_L000036_488 ' JUMPV addrg
C_smv8v_670edcd7_threads_update_L000036_497
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
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
 if_nz jmp #\C_smv8v_670edcd7_threads_update_L000036_501  ' NEU4
 mov r2, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv83m_670edcd7_luathread_movevalues_L000377
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-140)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-140) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_smv8v_670edcd7_threads_update_L000036_502 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_smv8v_670edcd7_threads_update_L000036_488 ' JUMPV addrg
C_smv8v_670edcd7_threads_update_L000036_501
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
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-136) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_smv8v_670edcd7_threads_update_L000036_506 ' EQI4
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
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
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
C_smv8v_670edcd7_threads_update_L000036_506
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_smv8v_670edcd7_threads_update_L000036_509 ' JUMPV addrg
C_smv8v_670edcd7_threads_update_L000036_508
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_smv8v_670edcd7_threads_update_L000036_511 ' EQI4
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
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
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, ##-3 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
C_smv8v_670edcd7_threads_update_L000036_511
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r21, r19 ' CVI, CVU or LOAD
 mov r2, ##@C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtok
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_smv8v_670edcd7_threads_update_L000036_509
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8v_670edcd7_threads_update_L000036_508  ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv83m_670edcd7_luathread_movevalues_L000377
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-140)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, ##-3 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settable
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_smv8v_670edcd7_threads_update_L000036_488 ' JUMPV addrg
C_smv8v_670edcd7_threads_update_L000036_502
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_smv8v_670edcd7_threads_update_L000036_513_L000514 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, #2 ' reg <- coni
C_smv8v_670edcd7_threads_update_L000036_488
 calld PA,#POPM ' restore registers
 add SP, #136 ' framesize
 calld PA,#RETF


 alignl ' align long
C_smv8i_670edcd7_threads_receive_async_L000023 ' <symbol:threads_receive_async>
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
 if_nz jmp #\C_smv8i_670edcd7_threads_receive_async_L000023_516 ' NEI4
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_smv8i_670edcd7_threads_receive_async_L000023_516 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_smv8b_670edcd7_threads_receive_L000016 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_smv8i_670edcd7_threads_receive_async_L000023_515 ' JUMPV addrg
C_smv8i_670edcd7_threads_receive_async_L000023_516
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
 long @C_smv8b_670edcd7_threads_receive_L000016 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_smv8i_670edcd7_threads_receive_async_L000023_515
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8b_670edcd7_threads_receive_L000016 ' <symbol:threads_receive>
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
 if_z jmp #\C_smv8b_670edcd7_threads_receive_L000016_519 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_smv8b_670edcd7_threads_receive_L000016_520 ' JUMPV addrg
C_smv8b_670edcd7_threads_receive_L000016_519
 mov r17, #0 ' reg <- coni
C_smv8b_670edcd7_threads_receive_L000016_520
 cmps r17,  #0 wz
 if_nz jmp #\C_smv8b_670edcd7_threads_receive_L000016_522 ' NEI4
 mov r7, #1 ' reg <- coni
 jmp #\@C_smv8b_670edcd7_threads_receive_L000016_523 ' JUMPV addrg
C_smv8b_670edcd7_threads_receive_L000016_522
 mov r7, #0 ' reg <- coni
C_smv8b_670edcd7_threads_receive_L000016_523
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r9 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv82j_670edcd7_channel_locked_get_L000139
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8b_670edcd7_threads_receive_L000016_524  ' NEU4
 cmps r17,  #0 wz
 if_z jmp #\C_smv8b_670edcd7_threads_receive_L000016_526 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8b_670edcd7_threads_receive_L000016_528_L000529 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8b_670edcd7_threads_receive_L000016_518 ' JUMPV addrg
C_smv8b_670edcd7_threads_receive_L000016_526
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8b_670edcd7_threads_receive_L000016_530_L000531 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8b_670edcd7_threads_receive_L000016_518 ' JUMPV addrg
C_smv8b_670edcd7_threads_receive_L000016_524
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv8b_670edcd7_threads_receive_L000016_532 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 rdlong r3, r13 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv82l_670edcd7_luathread_copyvalues_L000161
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #1 wz
 if_nz jmp #\C_smv8b_670edcd7_threads_receive_L000016_534 ' NEI4
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
 jmp #\@C_smv8b_670edcd7_threads_receive_L000016_535 ' JUMPV addrg
C_smv8b_670edcd7_threads_receive_L000016_534
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_smv8b_670edcd7_threads_receive_L000016_535
 rdlong r22, r13 ' reg <- INDIRP4 reg
 mov r20, ##@C_smv85_670edcd7_mainlp_L000010
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_smv8b_670edcd7_threads_receive_L000016_536  ' NEU4
 mov r2, ##@C_smv86_670edcd7_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_cond_mainls_sendrecv ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_signal ' CALL addrg
 mov r2, ##@C_smv86_670edcd7_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 jmp #\@C_smv8b_670edcd7_threads_receive_L000016_537 ' JUMPV addrg
C_smv8b_670edcd7_threads_receive_L000016_536
 mov r2, r13 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_queue_proc ' CALL addrg
C_smv8b_670edcd7_threads_receive_L000016_537
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
 jmp #\@C_smv8b_670edcd7_threads_receive_L000016_518 ' JUMPV addrg
C_smv8b_670edcd7_threads_receive_L000016_532
 cmps r17,  #0 wz
 if_z jmp #\C_smv8b_670edcd7_threads_receive_L000016_538 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8b_670edcd7_threads_receive_L000016_528_L000529 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8b_670edcd7_threads_receive_L000016_518 ' JUMPV addrg
C_smv8b_670edcd7_threads_receive_L000016_538
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##@C_smv85_670edcd7_mainlp_L000010
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_smv8b_670edcd7_threads_receive_L000016_540  ' NEU4
 wrlong r15, ##@C_smv85_670edcd7_mainlp_L000010+12 ' ASGNP4 addrg reg
 mov r2, ##@C_smv85_670edcd7_mainlp_L000010 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_queue_receiver ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luathread_unlock_channel ' CALL addrg
 mov r2, ##@C_smv86_670edcd7_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, ##@C_smv86_670edcd7_mutex_mainls_L000011 ' reg ARG ADDRG
 mov r3, ##@C_cond_mainls_sendrecv ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_cond_wait
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv86_670edcd7_mutex_mainls_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r0, ##@C_smv85_670edcd7_mainlp_L000010+8
 rdlong r0, r0 ' reg <- INDIRI4 addrg
 jmp #\@C_smv8b_670edcd7_threads_receive_L000016_518 ' JUMPV addrg
C_smv8b_670edcd7_threads_receive_L000016_540
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_smv82u_670edcd7_luathread_getself_L000207 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv8b_670edcd7_threads_receive_L000016_544 ' EQU4
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r11
 adds r22, #12 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
C_smv8b_670edcd7_threads_receive_L000016_544
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
C_smv8b_670edcd7_threads_receive_L000016_518
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8c_670edcd7_threads_create_channel_L000017 ' <symbol:threads_create_channel>
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
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_smv82i_670edcd7_channel_unlocked_get_L000137 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv8c_670edcd7_threads_create_channel_L000017_547 ' EQU4
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8c_670edcd7_threads_create_channel_L000017_549_L000550 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8c_670edcd7_threads_create_channel_L000017_546 ' JUMPV addrg
C_smv8c_670edcd7_threads_create_channel_L000017_547
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_smv82g_670edcd7_channel_create_L000133 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_smv8c_670edcd7_threads_create_channel_L000017_546
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8d_670edcd7_threads_destroy_channel_L000018 ' <symbol:threads_destroy_channel>
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
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_lock ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_smv82i_670edcd7_channel_unlocked_get_L000137 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv8d_670edcd7_threads_destroy_channel_L000018_552 ' EQU4
 mov r2, r21
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_trylock ' CALL addrg
C_smv8d_670edcd7_threads_destroy_channel_L000018_552
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8d_670edcd7_threads_destroy_channel_L000018_554  ' NEU4
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_mutex_unlock ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8a_670edcd7_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_smv8d_670edcd7_threads_destroy_channel_L000018_551 ' JUMPV addrg
C_smv8d_670edcd7_threads_destroy_channel_L000018_554
 mov r2, ##@C_smv82g_670edcd7_channel_create_L000133_135_L000136 ' reg ARG ADDRG
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
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
 if_z jmp #\C_smv8d_670edcd7_threads_destroy_channel_L000018_556 ' EQU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8d_670edcd7_threads_destroy_channel_L000018_558_L000559 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r19, r21 ' CVI, CVU or LOAD
C_smv8d_670edcd7_threads_destroy_channel_L000018_556
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv8d_670edcd7_threads_destroy_channel_L000018_560 ' EQU4
 jmp #\@C_smv8d_670edcd7_threads_destroy_channel_L000018_563 ' JUMPV addrg
C_smv8d_670edcd7_threads_destroy_channel_L000018_562
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
C_smv8d_670edcd7_threads_destroy_channel_L000018_563
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8d_670edcd7_threads_destroy_channel_L000018_562  ' NEU4
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_smv8d_670edcd7_threads_destroy_channel_L000018_560
 mov r19, ##0 ' reg <- con
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_smv8d_670edcd7_threads_destroy_channel_L000018_565 ' EQU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##@C_smv8d_670edcd7_threads_destroy_channel_L000018_567_L000568 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r19, r21
 adds r19, #12 ' ADDP4 coni
C_smv8d_670edcd7_threads_destroy_channel_L000018_565
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_smv8d_670edcd7_threads_destroy_channel_L000018_569 ' EQU4
 jmp #\@C_smv8d_670edcd7_threads_destroy_channel_L000018_572 ' JUMPV addrg
C_smv8d_670edcd7_threads_destroy_channel_L000018_571
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
C_smv8d_670edcd7_threads_destroy_channel_L000018_572
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_remove ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_smv8d_670edcd7_threads_destroy_channel_L000018_571  ' NEU4
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_smv8d_670edcd7_threads_destroy_channel_L000018_569
 mov r2, ##@C_smv8_670edcd7_mutex_channel_list_L000005 ' reg ARG ADDRG
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
C_smv8d_670edcd7_threads_destroy_channel_L000018_551
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv811_670edcd7_threads_sbrk_L000038 ' <symbol:threads_sbrk>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_smv811_670edcd7_threads_sbrk_L000038_575 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_smv811_670edcd7_threads_sbrk_L000038_577 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_malloc_defragment ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
C_smv811_670edcd7_threads_sbrk_L000038_577
C_smv811_670edcd7_threads_sbrk_L000038_575
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sbrk ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_smv811_670edcd7_threads_sbrk_L000038_574 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv812_670edcd7_threads_stacksize_L000039 ' <symbol:threads_stacksize>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_smv812_670edcd7_threads_stacksize_L000039_580 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_a jmp #\C_smv812_670edcd7_threads_stacksize_L000039_584 ' GTI4
 mov r2, ##@C_smv812_670edcd7_threads_stacksize_L000039_582_L000583 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_smv812_670edcd7_threads_stacksize_L000039_584
 wrlong r21, ##@C_stacksize ' ASGNI4 addrg reg
C_smv812_670edcd7_threads_stacksize_L000039_580
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
' C_smv812_670edcd7_threads_stacksize_L000039_579 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv815_670edcd7_threads_factories_L000042 ' <symbol:threads_factories>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_smv815_670edcd7_threads_factories_L000042_586 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_a jmp #\C_smv815_670edcd7_threads_factories_L000042_590 ' GTI4
 mov r2, ##@C_smv815_670edcd7_threads_factories_L000042_588_L000589 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_smv815_670edcd7_threads_factories_L000042_590
 cmps r21,  #16 wcz
 if_be jmp #\C_smv815_670edcd7_threads_factories_L000042_591 ' LEI4
 mov r21, #16 ' reg <- coni
C_smv815_670edcd7_threads_factories_L000042_591
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_set_numfactories ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_smv815_670edcd7_threads_factories_L000042_587 ' JUMPV addrg
C_smv815_670edcd7_threads_factories_L000042_586
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sched_get_numfactories ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_smv815_670edcd7_threads_factories_L000042_587
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_smv815_670edcd7_threads_factories_L000042_585 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv813_670edcd7_threads_factory_L000040 ' <symbol:threads_factory>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_smv813_670edcd7_threads_factory_L000040_594 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_a jmp #\C_smv813_670edcd7_threads_factory_L000040_596 ' GTI4
 mov r2, ##@C_smv815_670edcd7_threads_factories_L000042_588_L000589 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_smv813_670edcd7_threads_factory_L000040_596
 cmps r21,  #16 wcz
 if_be jmp #\C_smv813_670edcd7_threads_factory_L000040_597 ' LEI4
 mov r21, #16 ' reg <- coni
C_smv813_670edcd7_threads_factory_L000040_597
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sched_set_factory ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_smv813_670edcd7_threads_factory_L000040_595 ' JUMPV addrg
C_smv813_670edcd7_threads_factory_L000040_594
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sched_get_factory ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_smv813_670edcd7_threads_factory_L000040_595
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_smv813_670edcd7_threads_factory_L000040_593 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv814_670edcd7_threads_version_L000041 ' <symbol:threads_version>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_smv814_670edcd7_threads_version_L000041_600 ' LEI4
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_smv814_670edcd7_threads_version_L000041_604_L000605 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv814_670edcd7_threads_version_L000041_602 ' NEI4
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_smv814_670edcd7_threads_version_L000041_601 ' JUMPV addrg
C_smv814_670edcd7_threads_version_L000041_602
 mov r2, ##@C_smv814_670edcd7_threads_version_L000041_608_L000609 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv814_670edcd7_threads_version_L000041_606 ' NEI4
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_smv814_670edcd7_threads_version_L000041_601 ' JUMPV addrg
C_smv814_670edcd7_threads_version_L000041_606
 mov r2, ##740 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_smv814_670edcd7_threads_version_L000041_601 ' JUMPV addrg
C_smv814_670edcd7_threads_version_L000041_600
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
C_smv814_670edcd7_threads_version_L000041_601
 mov r0, #1 ' reg <- coni
' C_smv814_670edcd7_threads_version_L000041_599 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8l_670edcd7_threads_sleep_L000026 ' <symbol:threads_sleep>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_smv8l_670edcd7_threads_sleep_L000026_611 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_ae jmp #\C_smv8l_670edcd7_threads_sleep_L000026_615 ' GEI4
 mov r2, ##@C_smv8l_670edcd7_threads_sleep_L000026_613_L000614 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_smv8l_670edcd7_threads_sleep_L000026_615
 cmps r21,  #0 wcz
 if_be jmp #\C_smv8l_670edcd7_threads_sleep_L000026_616 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_sleep ' CALL addrg
 jmp #\@C_smv8l_670edcd7_threads_sleep_L000026_612 ' JUMPV addrg
C_smv8l_670edcd7_threads_sleep_L000026_616
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 jmp #\@C_smv8l_670edcd7_threads_sleep_L000026_612 ' JUMPV addrg
C_smv8l_670edcd7_threads_sleep_L000026_611
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
C_smv8l_670edcd7_threads_sleep_L000026_612
 mov r0, #0 ' reg <- coni
' C_smv8l_670edcd7_threads_sleep_L000026_610 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8m_670edcd7_threads_msleep_L000027 ' <symbol:threads_msleep>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_smv8m_670edcd7_threads_msleep_L000027_619 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_ae jmp #\C_smv8m_670edcd7_threads_msleep_L000027_623 ' GEI4
 mov r2, ##@C_smv8m_670edcd7_threads_msleep_L000027_621_L000622 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_smv8m_670edcd7_threads_msleep_L000027_623
 cmps r21,  #0 wcz
 if_be jmp #\C_smv8m_670edcd7_threads_msleep_L000027_624 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_msleep ' CALL addrg
 jmp #\@C_smv8m_670edcd7_threads_msleep_L000027_620 ' JUMPV addrg
C_smv8m_670edcd7_threads_msleep_L000027_624
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
 jmp #\@C_smv8m_670edcd7_threads_msleep_L000027_620 ' JUMPV addrg
C_smv8m_670edcd7_threads_msleep_L000027_619
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_pthread_yield ' CALL addrg
C_smv8m_670edcd7_threads_msleep_L000027_620
 mov r0, #0 ' reg <- coni
' C_smv8m_670edcd7_threads_msleep_L000027_618 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8j_670edcd7_threads_print_L000024 ' <symbol:threads_print>
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
 if_nz jmp #\C_smv8j_670edcd7_threads_print_L000024_627 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_smv8j_670edcd7_threads_print_L000024_629 ' EQI4
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
 mov r3, ##@C_smv8j_670edcd7_threads_print_L000024_631_L000632 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_printf
 add SP, #4 ' CALL addrg
 jmp #\@C_smv8j_670edcd7_threads_print_L000024_628 ' JUMPV addrg
C_smv8j_670edcd7_threads_print_L000024_629
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv8j_670edcd7_threads_print_L000024_633 ' NEI4
 mov r2, ##@C_smv8j_670edcd7_threads_print_L000024_635_L000636 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_smv8j_670edcd7_threads_print_L000024_628 ' JUMPV addrg
C_smv8j_670edcd7_threads_print_L000024_633
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #1 wz
 if_nz jmp #\C_smv8j_670edcd7_threads_print_L000024_637 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_smv8j_670edcd7_threads_print_L000024_644 ' EQI4
 mov r17, ##@C_smv8j_670edcd7_threads_print_L000024_639_L000640 ' reg <- addrg
 jmp #\@C_smv8j_670edcd7_threads_print_L000024_645 ' JUMPV addrg
C_smv8j_670edcd7_threads_print_L000024_644
 mov r17, ##@C_smv8j_670edcd7_threads_print_L000024_641_L000642 ' reg <- addrg
C_smv8j_670edcd7_threads_print_L000024_645
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_smv8j_670edcd7_threads_print_L000024_628 ' JUMPV addrg
C_smv8j_670edcd7_threads_print_L000024_637
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
 mov r4, ##@C_smv8j_670edcd7_threads_print_L000024_646_L000647 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_printf
 add SP, #8 ' CALL addrg
 jmp #\@C_smv8j_670edcd7_threads_print_L000024_628 ' JUMPV addrg
C_smv8j_670edcd7_threads_print_L000024_627
 mov r21, #1 ' reg <- coni
 jmp #\@C_smv8j_670edcd7_threads_print_L000024_651 ' JUMPV addrg
C_smv8j_670edcd7_threads_print_L000024_648
 cmps r21,  #1 wcz
 if_be jmp #\C_smv8j_670edcd7_threads_print_L000024_652 ' LEI4
 mov r2, ##@C_smv8j_670edcd7_threads_print_L000024_654_L000655 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
C_smv8j_670edcd7_threads_print_L000024_652
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_smv8j_670edcd7_threads_print_L000024_656 ' EQI4
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
 jmp #\@C_smv8j_670edcd7_threads_print_L000024_657 ' JUMPV addrg
C_smv8j_670edcd7_threads_print_L000024_656
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv8j_670edcd7_threads_print_L000024_658 ' NEI4
 mov r2, ##@C_smv8j_670edcd7_threads_print_L000024_660_L000661 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_smv8j_670edcd7_threads_print_L000024_659 ' JUMPV addrg
C_smv8j_670edcd7_threads_print_L000024_658
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #1 wz
 if_nz jmp #\C_smv8j_670edcd7_threads_print_L000024_662 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_smv8j_670edcd7_threads_print_L000024_669 ' EQI4
 mov r17, ##@C_smv8j_670edcd7_threads_print_L000024_664_L000665 ' reg <- addrg
 jmp #\@C_smv8j_670edcd7_threads_print_L000024_670 ' JUMPV addrg
C_smv8j_670edcd7_threads_print_L000024_669
 mov r17, ##@C_smv8j_670edcd7_threads_print_L000024_666_L000667 ' reg <- addrg
C_smv8j_670edcd7_threads_print_L000024_670
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_smv8j_670edcd7_threads_print_L000024_663 ' JUMPV addrg
C_smv8j_670edcd7_threads_print_L000024_662
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
 mov r4, ##@C_smv8j_670edcd7_threads_print_L000024_671_L000672 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_printf
 add SP, #8 ' CALL addrg
C_smv8j_670edcd7_threads_print_L000024_663
C_smv8j_670edcd7_threads_print_L000024_659
C_smv8j_670edcd7_threads_print_L000024_657
' C_smv8j_670edcd7_threads_print_L000024_649 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_smv8j_670edcd7_threads_print_L000024_651
 cmps r21, r19 wcz
 if_be jmp #\C_smv8j_670edcd7_threads_print_L000024_648 ' LEI4
 mov r2, ##@C_smv8j_670edcd7_threads_print_L000024_673_L000674 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
C_smv8j_670edcd7_threads_print_L000024_628
 mov r0, #0 ' reg <- coni
' C_smv8j_670edcd7_threads_print_L000024_626 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv8k_670edcd7_threads_print_raw_L000025 ' <symbol:threads_print_raw>
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
 jmp #\@C_smv8k_670edcd7_threads_print_raw_L000025_679 ' JUMPV addrg
C_smv8k_670edcd7_threads_print_raw_L000025_676
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_smv8k_670edcd7_threads_print_raw_L000025_680 ' EQI4
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
 jmp #\@C_smv8k_670edcd7_threads_print_raw_L000025_681 ' JUMPV addrg
C_smv8k_670edcd7_threads_print_raw_L000025_680
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_smv8k_670edcd7_threads_print_raw_L000025_682 ' NEI4
 mov r2, ##@C_smv8j_670edcd7_threads_print_L000024_660_L000661 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_smv8k_670edcd7_threads_print_raw_L000025_683 ' JUMPV addrg
C_smv8k_670edcd7_threads_print_raw_L000025_682
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #1 wz
 if_nz jmp #\C_smv8k_670edcd7_threads_print_raw_L000025_684 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_smv8k_670edcd7_threads_print_raw_L000025_687 ' EQI4
 mov r17, ##@C_smv8j_670edcd7_threads_print_L000024_664_L000665 ' reg <- addrg
 jmp #\@C_smv8k_670edcd7_threads_print_raw_L000025_688 ' JUMPV addrg
C_smv8k_670edcd7_threads_print_raw_L000025_687
 mov r17, ##@C_smv8j_670edcd7_threads_print_L000024_666_L000667 ' reg <- addrg
C_smv8k_670edcd7_threads_print_raw_L000025_688
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_printf ' CALL addrg
 jmp #\@C_smv8k_670edcd7_threads_print_raw_L000025_685 ' JUMPV addrg
C_smv8k_670edcd7_threads_print_raw_L000025_684
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
 mov r4, ##@C_smv8j_670edcd7_threads_print_L000024_671_L000672 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pthread_printf
 add SP, #8 ' CALL addrg
C_smv8k_670edcd7_threads_print_raw_L000025_685
C_smv8k_670edcd7_threads_print_raw_L000025_683
C_smv8k_670edcd7_threads_print_raw_L000025_681
' C_smv8k_670edcd7_threads_print_raw_L000025_677 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_smv8k_670edcd7_threads_print_raw_L000025_679
 cmps r21, r19 wcz
 if_be jmp #\C_smv8k_670edcd7_threads_print_raw_L000025_676 ' LEI4
 mov r0, #0 ' reg <- coni
' C_smv8k_670edcd7_threads_print_raw_L000025_675 ' (symbol refcount = 0)
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
' C_luathread_get_channel_689 ' (symbol refcount = 0)
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
' C_luathread_get_status_690 ' (symbol refcount = 0)
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
' C_luathread_set_status_691 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luathread_get_state

 alignl ' align long
C_luathread_get_state ' <symbol:luathread_get_state>
 rdlong r0, r2 ' reg <- INDIRP4 reg
' C_luathread_get_state_692 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export luathread_get_numargs

 alignl ' align long
C_luathread_get_numargs ' <symbol:luathread_get_numargs>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_luathread_get_numargs_693 ' (symbol refcount = 0)
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
' C_luathread_set_numargs_694 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_smv84u_670edcd7_luathread_reglualib_L000695 ' <symbol:luathread_reglualib>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, ##@C_smv84u_670edcd7_luathread_reglualib_L000695_697_L000698 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##@C_smv84u_670edcd7_luathread_reglualib_L000695_699_L000700 ' reg ARG ADDRG
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
' C_smv84u_670edcd7_luathread_reglualib_L000695_696 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv87_670edcd7_luathread_openlualibs_L000012 ' <symbol:luathread_openlualibs>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_luaopen_base ' reg ARG ADDRG
 mov r4, ##@C_smv87_670edcd7_luathread_openlualibs_L000012_702_L000703 ' reg ARG ADDRG
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
 mov r4, ##@C_smv84u_670edcd7_luathread_reglualib_L000695_697_L000698 ' reg ARG ADDRG
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
 mov r3, ##@C_smv87_670edcd7_luathread_openlualibs_L000012_704_L000705 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv84u_670edcd7_luathread_reglualib_L000695
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_os ' reg ARG ADDRG
 mov r3, ##@C_smv87_670edcd7_luathread_openlualibs_L000012_706_L000707 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv84u_670edcd7_luathread_reglualib_L000695
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_table ' reg ARG ADDRG
 mov r3, ##@C_smv87_670edcd7_luathread_openlualibs_L000012_708_L000709 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv84u_670edcd7_luathread_reglualib_L000695
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_string ' reg ARG ADDRG
 mov r3, ##@C_smv87_670edcd7_luathread_openlualibs_L000012_710_L000711 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv84u_670edcd7_luathread_reglualib_L000695
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_math ' reg ARG ADDRG
 mov r3, ##@C_smv87_670edcd7_luathread_openlualibs_L000012_712_L000713 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv84u_670edcd7_luathread_reglualib_L000695
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_debug ' reg ARG ADDRG
 mov r3, ##@C_smv87_670edcd7_luathread_openlualibs_L000012_714_L000715 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv84u_670edcd7_luathread_reglualib_L000695
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_coroutine ' reg ARG ADDRG
 mov r3, ##@C_smv830_670edcd7_luathread_new_L000211_217_L000218 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv84u_670edcd7_luathread_reglualib_L000695
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_utf8 ' reg ARG ADDRG
 mov r3, ##@C_smv87_670edcd7_luathread_openlualibs_L000012_716_L000717 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv84u_670edcd7_luathread_reglualib_L000695
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_propeller ' reg ARG ADDRG
 mov r3, ##@C_smv830_670edcd7_luathread_new_L000211_215_L000216 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_smv84u_670edcd7_luathread_reglualib_L000695
 add SP, #8 ' CALL addrg
' C_smv87_670edcd7_luathread_openlualibs_L000012_701 ' (symbol refcount = 0)
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
 mov r3, ##@C_luaopen_threads_719_L000720
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #40 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_smv817_670edcd7_luathread_funcs_L000044 ' reg ARG ADDRG
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
 wrlong r23, ##@C_smv85_670edcd7_mainlp_L000010 ' ASGNP4 addrg reg
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_smv85_670edcd7_mainlp_L000010+4 ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_smv85_670edcd7_mainlp_L000010+8 ' ASGNI4 addrg reg
 mov r22, ##0 ' reg <- con
 wrlong r22, ##@C_smv85_670edcd7_mainlp_L000010+12 ' ASGNP4 addrg reg
 mov r22, ##0 ' reg <- con
 wrlong r22, ##@C_smv85_670edcd7_mainlp_L000010+16 ' ASGNP4 addrg reg
 mov r2, ##@C_smv82_670edcd7_recycle_list_L000007 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_list_init ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_luaL__newstate ' CALL addrg
 wrlong r0, ##@C_smv84_670edcd7_chanls_L000009 ' ASGNP4 addrg reg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, ##@C_smv82g_670edcd7_channel_create_L000133_135_L000136 ' reg ARG ADDRG
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_luaopen_base ' reg ARG ADDRG
 mov r4, ##@C_smv87_670edcd7_luathread_openlualibs_L000012_702_L000703 ' reg ARG ADDRG
 mov r5, ##@C_smv84_670edcd7_chanls_L000009
 rdlong r5, r5
 ' reg ARG INDIR ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__requiref
 add SP, #12 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##@C_smv84_670edcd7_chanls_L000009
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
 mov r2, ##@C_luaopen_threads_725_L000726 ' reg ARG ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_threads_727_L000728 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__newmetatable
 add SP, #4 ' CALL addrg
 mov r2, ##@C_luaopen_threads_729_L000730 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_smv834_670edcd7_luathread_join_workers_L000219 ' reg ARG ADDRG
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
 mov r2, ##@C_luaopen_threads_725_L000726 ' reg ARG ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_threads_727_L000728 ' reg ARG ADDRG
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
 if_nz jmp #\C_luaopen_threads_731 ' NEI4
 mov r2, ##@C_smv8e_670edcd7_threads_set_numworkers_L000019_276_L000277 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_luaopen_threads_731
 mov r0, #1 ' reg <- coni
' C_luaopen_threads_718 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_smv816_670edcd7_luathread_loadlib_L000043 ' <symbol:luathread_loadlib>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 mov r3, ##@C_luaopen_threads_719_L000720
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #40 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_smv817_670edcd7_luathread_funcs_L000044 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_smv816_670edcd7_luathread_loadlib_L000043_733 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _pthread_init_lock_pool

' Catalina Import sbrk

' Catalina Import _thread_stall

' Catalina Import luaopen_propeller

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_smv85_670edcd7_mainlp_L000010 ' <symbol:mainlp>
 byte 0[20]

 alignl ' align long
C_smv82_670edcd7_recycle_list_L000007 ' <symbol:recycle_list>
 byte 0[12]

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

' Catalina Import luaL_pushresult

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_addlstring

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import luaL_buffinit

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

' Catalina Import _thread_allow

' Catalina Data

DAT ' uninitialized data segment

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_threads_729_L000730 ' <symbol:729>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

 alignl ' align long
C_luaopen_threads_727_L000728 ' <symbol:727>
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
C_luaopen_threads_725_L000726 ' <symbol:725>
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
C_luaopen_threads_719_L000720 ' <symbol:719>
 long $43fc0000 ' float

 alignl ' align long
C_smv87_670edcd7_luathread_openlualibs_L000012_716_L000717 ' <symbol:716>
 byte 117
 byte 116
 byte 102
 byte 56
 byte 0

 alignl ' align long
C_smv87_670edcd7_luathread_openlualibs_L000012_714_L000715 ' <symbol:714>
 byte 100
 byte 101
 byte 98
 byte 117
 byte 103
 byte 0

 alignl ' align long
C_smv87_670edcd7_luathread_openlualibs_L000012_712_L000713 ' <symbol:712>
 byte 109
 byte 97
 byte 116
 byte 104
 byte 0

 alignl ' align long
C_smv87_670edcd7_luathread_openlualibs_L000012_710_L000711 ' <symbol:710>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_smv87_670edcd7_luathread_openlualibs_L000012_708_L000709 ' <symbol:708>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_smv87_670edcd7_luathread_openlualibs_L000012_706_L000707 ' <symbol:706>
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_smv87_670edcd7_luathread_openlualibs_L000012_704_L000705 ' <symbol:704>
 byte 105
 byte 111
 byte 0

 alignl ' align long
C_smv87_670edcd7_luathread_openlualibs_L000012_702_L000703 ' <symbol:702>
 byte 95
 byte 71
 byte 0

 alignl ' align long
C_smv84u_670edcd7_luathread_reglualib_L000695_699_L000700 ' <symbol:699>
 byte 112
 byte 114
 byte 101
 byte 108
 byte 111
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_smv84u_670edcd7_luathread_reglualib_L000695_697_L000698 ' <symbol:697>
 byte 112
 byte 97
 byte 99
 byte 107
 byte 97
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_smv8j_670edcd7_threads_print_L000024_673_L000674 ' <symbol:673>
 byte 10
 byte 0

 alignl ' align long
C_smv8j_670edcd7_threads_print_L000024_671_L000672 ' <symbol:671>
 byte 37
 byte 115
 byte 58
 byte 37
 byte 88
 byte 0

 alignl ' align long
C_smv8j_670edcd7_threads_print_L000024_666_L000667 ' <symbol:666>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_smv8j_670edcd7_threads_print_L000024_664_L000665 ' <symbol:664>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_smv8j_670edcd7_threads_print_L000024_660_L000661 ' <symbol:660>
 byte 110
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_smv8j_670edcd7_threads_print_L000024_654_L000655 ' <symbol:654>
 byte 9
 byte 0

 alignl ' align long
C_smv8j_670edcd7_threads_print_L000024_646_L000647 ' <symbol:646>
 byte 37
 byte 115
 byte 58
 byte 37
 byte 108
 byte 88
 byte 10
 byte 0

 alignl ' align long
C_smv8j_670edcd7_threads_print_L000024_641_L000642 ' <symbol:641>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 10
 byte 0

 alignl ' align long
C_smv8j_670edcd7_threads_print_L000024_639_L000640 ' <symbol:639>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 10
 byte 0

 alignl ' align long
C_smv8j_670edcd7_threads_print_L000024_635_L000636 ' <symbol:635>
 byte 110
 byte 105
 byte 108
 byte 10
 byte 0

 alignl ' align long
C_smv8j_670edcd7_threads_print_L000024_631_L000632 ' <symbol:631>
 byte 37
 byte 115
 byte 10
 byte 0

 alignl ' align long
C_smv8m_670edcd7_threads_msleep_L000027_621_L000622 ' <symbol:621>
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
C_smv8l_670edcd7_threads_sleep_L000026_613_L000614 ' <symbol:613>
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
C_smv814_670edcd7_threads_version_L000041_608_L000609 ' <symbol:608>
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
C_smv814_670edcd7_threads_version_L000041_604_L000605 ' <symbol:604>
 byte 108
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_smv815_670edcd7_threads_factories_L000042_588_L000589 ' <symbol:588>
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
C_smv812_670edcd7_threads_stacksize_L000039_582_L000583 ' <symbol:582>
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
C_smv8d_670edcd7_threads_destroy_channel_L000018_567_L000568 ' <symbol:567>
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
C_smv8d_670edcd7_threads_destroy_channel_L000018_558_L000559 ' <symbol:558>
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
C_smv8c_670edcd7_threads_create_channel_L000017_549_L000550 ' <symbol:549>
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
C_smv8b_670edcd7_threads_receive_L000016_530_L000531 ' <symbol:530>
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
C_smv8b_670edcd7_threads_receive_L000016_528_L000529 ' <symbol:528>
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
C_smv8v_670edcd7_threads_update_L000036_513_L000514 ' <symbol:513>
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
C_smv8v_670edcd7_threads_update_L000036_499_L000500 ' <symbol:499>
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
C_smv8v_670edcd7_threads_update_L000036_495_L000496 ' <symbol:495>
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
C_smv8v_670edcd7_threads_update_L000036_491_L000492 ' <symbol:491>
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
C_smv810_670edcd7_threads_export_L000037_486_L000487 ' <symbol:486>
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
C_smv810_670edcd7_threads_export_L000037_471_L000472 ' <symbol:471>
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
C_smv810_670edcd7_threads_export_L000037_456_L000457 ' <symbol:456>
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
C_smv810_670edcd7_threads_export_L000037_452_L000453 ' <symbol:452>
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
C_smv8u_670edcd7_threads_shared_L000035_447_L000448 ' <symbol:447>
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
C_smv8u_670edcd7_threads_shared_L000035_441_L000442 ' <symbol:441>
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
C_smv8u_670edcd7_threads_shared_L000035_431_L000432 ' <symbol:431>
 byte 46
 byte 0

 alignl ' align long
C_smv8u_670edcd7_threads_shared_L000035_422_L000423 ' <symbol:422>
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
C_smv8u_670edcd7_threads_shared_L000035_418_L000419 ' <symbol:418>
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
C_smv8q_670edcd7_threads_wait_for_L000031_348_L000349 ' <symbol:348>
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
C_smv8h_670edcd7_threads_send_async_L000022_324_L000325 ' <symbol:324>
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
C_smv8a_670edcd7_threads_send_L000015_301_L000302 ' <symbol:301>
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
C_smv88_670edcd7_threads_create_newproc_L000013_288_L000289 ' <symbol:288>
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
C_smv88_670edcd7_threads_create_newproc_L000013_284_L000285 ' <symbol:284>
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
C_smv8e_670edcd7_threads_set_numworkers_L000019_276_L000277 ' <symbol:276>
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
C_smv8e_670edcd7_threads_set_numworkers_L000019_271_L000272 ' <symbol:271>
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
C_smv8g_670edcd7_threads_recycle_set_L000021_259_L000260 ' <symbol:259>
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
C_smv838_670edcd7_luathread_copyupvalues_L000232_256_L000257 ' <symbol:256>
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
C_smv838_670edcd7_luathread_copyupvalues_L000232_249_L000250 ' <symbol:249>
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
C_smv836_670edcd7_func_dump_L000225_229_L000230 ' <symbol:229>
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
C_smv830_670edcd7_luathread_new_L000211_217_L000218 ' <symbol:217>
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
C_smv830_670edcd7_luathread_new_L000211_215_L000216 ' <symbol:215>
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
C_smv830_670edcd7_luathread_new_L000211_213_L000214 ' <symbol:213>
 byte 116
 byte 104
 byte 114
 byte 101
 byte 97
 byte 100
 byte 115
 byte 0

 alignl ' align long
C_smv82u_670edcd7_luathread_getself_L000207_209_L000210 ' <symbol:209>
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
C_smv82l_670edcd7_luathread_copyvalues_L000161_202_L000203 ' <symbol:202>
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
C_smv82l_670edcd7_luathread_copyvalues_L000161_200_L000201 ' <symbol:200>
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
C_smv82l_670edcd7_luathread_copyvalues_L000161_167_L000168 ' <symbol:167>
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
C_smv82l_670edcd7_luathread_copyvalues_L000161_165_L000166 ' <symbol:165>
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
C_smv82g_670edcd7_channel_create_L000133_135_L000136 ' <symbol:135>
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
C_smv82f_670edcd7_123_L000124 ' <symbol:123>
 byte 97
 byte 103
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_smv82e_670edcd7_121_L000122 ' <symbol:121>
 byte 97
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_smv82d_670edcd7_119_L000120 ' <symbol:119>
 byte 103
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_smv82c_670edcd7_117_L000118 ' <symbol:117>
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_smv82b_670edcd7_115_L000116 ' <symbol:115>
 byte 100
 byte 101
 byte 115
 byte 116
 byte 114
 byte 111
 byte 121
 byte 0

 alignl ' align long
C_smv82a_670edcd7_113_L000114 ' <symbol:113>
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
C_smv829_670edcd7_111_L000112 ' <symbol:111>
 byte 109
 byte 117
 byte 116
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_smv828_670edcd7_109_L000110 ' <symbol:109>
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 0

 alignl ' align long
C_smv827_670edcd7_107_L000108 ' <symbol:107>
 byte 119
 byte 111
 byte 114
 byte 107
 byte 101
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_smv826_670edcd7_105_L000106 ' <symbol:105>
 byte 110
 byte 101
 byte 119
 byte 0

 alignl ' align long
C_smv825_670edcd7_103_L000104 ' <symbol:103>
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_smv824_670edcd7_101_L000102 ' <symbol:101>
 byte 102
 byte 97
 byte 99
 byte 116
 byte 111
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_smv823_670edcd7_99_L000100 ' <symbol:99>
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
C_smv822_670edcd7_97_L000098 ' <symbol:97>
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
C_smv821_670edcd7_95_L000096 ' <symbol:95>
 byte 115
 byte 98
 byte 114
 byte 107
 byte 0

 alignl ' align long
C_smv820_670edcd7_93_L000094 ' <symbol:93>
 byte 111
 byte 117
 byte 116
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_smv81v_670edcd7_91_L000092 ' <symbol:91>
 byte 112
 byte 114
 byte 105
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_smv81u_670edcd7_89_L000090 ' <symbol:89>
 byte 109
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_smv81t_670edcd7_87_L000088 ' <symbol:87>
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_smv81s_670edcd7_85_L000086 ' <symbol:85>
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
C_smv81r_670edcd7_83_L000084 ' <symbol:83>
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
C_smv81q_670edcd7_81_L000082 ' <symbol:81>
 byte 101
 byte 120
 byte 112
 byte 111
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_smv81p_670edcd7_79_L000080 ' <symbol:79>
 byte 117
 byte 112
 byte 100
 byte 97
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_smv81o_670edcd7_77_L000078 ' <symbol:77>
 byte 115
 byte 104
 byte 97
 byte 114
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_smv81n_670edcd7_75_L000076 ' <symbol:75>
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
C_smv81m_670edcd7_73_L000074 ' <symbol:73>
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
C_smv81l_670edcd7_71_L000072 ' <symbol:71>
 byte 115
 byte 105
 byte 103
 byte 110
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_smv81k_670edcd7_69_L000070 ' <symbol:69>
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
C_smv81j_670edcd7_67_L000068 ' <symbol:67>
 byte 117
 byte 110
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_smv81i_670edcd7_65_L000066 ' <symbol:65>
 byte 116
 byte 114
 byte 121
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_smv81h_670edcd7_63_L000064 ' <symbol:63>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_smv81g_670edcd7_61_L000062 ' <symbol:61>
 byte 114
 byte 101
 byte 99
 byte 121
 byte 99
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_smv81f_670edcd7_59_L000060 ' <symbol:59>
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
C_smv81e_670edcd7_57_L000058 ' <symbol:57>
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
C_smv81d_670edcd7_55_L000056 ' <symbol:55>
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
C_smv81c_670edcd7_53_L000054 ' <symbol:53>
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
C_smv81b_670edcd7_51_L000052 ' <symbol:51>
 byte 114
 byte 101
 byte 99
 byte 101
 byte 105
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_smv81a_670edcd7_49_L000050 ' <symbol:49>
 byte 115
 byte 101
 byte 110
 byte 100
 byte 0

 alignl ' align long
C_smv819_670edcd7_47_L000048 ' <symbol:47>
 byte 119
 byte 97
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_smv818_670edcd7_45_L000046 ' <symbol:45>
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
