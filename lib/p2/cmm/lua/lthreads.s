' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sjc8_67da3ff4_mutex_channel_list_L000005 ' <symbol:mutex_channel_list>
 long 0
 long $0
 long $0
 long 0

 alignl ' align long
C_sjc81_67da3ff4_mutex_recycle_list_L000006 ' <symbol:mutex_recycle_list>
 long 0
 long $0
 long $0
 long 0

 alignl ' align long
C_sjc83_67da3ff4_recyclemax_L000008 ' <symbol:recyclemax>
 long 0

' Catalina Export stacksize

 alignl ' align long
C_stacksize ' <symbol:stacksize>
 long 4000

 alignl ' align long
C_sjc84_67da3ff4_chanls_L000009 ' <symbol:chanls>
 long $0

' Catalina Export cond_mainls_sendrecv

 alignl ' align long
C_cond_mainls_sendrecv ' <symbol:cond_mainls_sendrecv>
 long 0
 long $0

 alignl ' align long
C_sjc86_67da3ff4_mutex_mainls_L000011 ' <symbol:mutex_mainls>
 long 0
 long $0
 long $0
 long 0

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjc817_67da3ff4_luathread_funcs_L000044 ' <symbol:luathread_funcs>
 long @C_sjc818_67da3ff4_45_L000046
 long @C_sjc88_67da3ff4_threads_create_newproc_L000013
 long @C_sjc819_67da3ff4_47_L000048
 long @C_sjc89_67da3ff4_threads_wait_L000014
 long @C_sjc81a_67da3ff4_49_L000050
 long @C_sjc8a_67da3ff4_threads_send_L000015
 long @C_sjc81b_67da3ff4_51_L000052
 long @C_sjc8b_67da3ff4_threads_receive_L000016
 long @C_sjc81c_67da3ff4_53_L000054
 long @C_sjc8c_67da3ff4_threads_create_channel_L000017
 long @C_sjc81d_67da3ff4_55_L000056
 long @C_sjc8d_67da3ff4_threads_destroy_channel_L000018
 long @C_sjc81e_67da3ff4_57_L000058
 long @C_sjc8e_67da3ff4_threads_set_numworkers_L000019
 long @C_sjc81f_67da3ff4_59_L000060
 long @C_sjc8f_67da3ff4_threads_get_numworkers_L000020
 long @C_sjc81g_67da3ff4_61_L000062
 long @C_sjc8g_67da3ff4_threads_recycle_set_L000021
 long @C_sjc81h_67da3ff4_63_L000064
 long @C_sjc8n_67da3ff4_threads_lock_L000028
 long @C_sjc81i_67da3ff4_65_L000066
 long @C_sjc8p_67da3ff4_threads_trylock_L000030
 long @C_sjc81j_67da3ff4_67_L000068
 long @C_sjc8o_67da3ff4_threads_unlock_L000029
 long @C_sjc81k_67da3ff4_69_L000070
 long @C_sjc8q_67da3ff4_threads_wait_for_L000031
 long @C_sjc81l_67da3ff4_71_L000072
 long @C_sjc8r_67da3ff4_threads_signal_L000032
 long @C_sjc81m_67da3ff4_73_L000074
 long @C_sjc8s_67da3ff4_threads_broadcast_L000033
 long @C_sjc81n_67da3ff4_75_L000076
 long @C_sjc8t_67da3ff4_threads_rendezvous_L000034
 long @C_sjc81o_67da3ff4_77_L000078
 long @C_sjc8u_67da3ff4_threads_shared_L000035
 long @C_sjc81p_67da3ff4_79_L000080
 long @C_sjc8v_67da3ff4_threads_update_L000036
 long @C_sjc81q_67da3ff4_81_L000082
 long @C_sjc810_67da3ff4_threads_export_L000037
 long @C_sjc81r_67da3ff4_83_L000084
 long @C_sjc8h_67da3ff4_threads_send_async_L000022
 long @C_sjc81s_67da3ff4_85_L000086
 long @C_sjc8i_67da3ff4_threads_receive_async_L000023
 long @C_sjc81t_67da3ff4_87_L000088
 long @C_sjc8l_67da3ff4_threads_sleep_L000026
 long @C_sjc81u_67da3ff4_89_L000090
 long @C_sjc8m_67da3ff4_threads_msleep_L000027
 long @C_sjc81v_67da3ff4_91_L000092
 long @C_sjc8j_67da3ff4_threads_print_L000024
 long @C_sjc820_67da3ff4_93_L000094
 long @C_sjc8k_67da3ff4_threads_print_raw_L000025
 long @C_sjc821_67da3ff4_95_L000096
 long @C_sjc811_67da3ff4_threads_sbrk_L000038
 long @C_sjc822_67da3ff4_97_L000098
 long @C_sjc812_67da3ff4_threads_stacksize_L000039
 long @C_sjc823_67da3ff4_99_L000100
 long @C_sjc815_67da3ff4_threads_factories_L000042
 long @C_sjc824_67da3ff4_101_L000102
 long @C_sjc813_67da3ff4_threads_factory_L000040
 long @C_sjc825_67da3ff4_103_L000104
 long @C_sjc814_67da3ff4_threads_version_L000041
 long @C_sjc826_67da3ff4_105_L000106
 long @C_sjc88_67da3ff4_threads_create_newproc_L000013
 long @C_sjc827_67da3ff4_107_L000108
 long @C_sjc8e_67da3ff4_threads_set_numworkers_L000019
 long @C_sjc828_67da3ff4_109_L000110
 long @C_sjc8c_67da3ff4_threads_create_channel_L000017
 long @C_sjc829_67da3ff4_111_L000112
 long @C_sjc8c_67da3ff4_threads_create_channel_L000017
 long @C_sjc82a_67da3ff4_113_L000114
 long @C_sjc8c_67da3ff4_threads_create_channel_L000017
 long @C_sjc82b_67da3ff4_115_L000116
 long @C_sjc8d_67da3ff4_threads_destroy_channel_L000018
 long @C_sjc82c_67da3ff4_117_L000118
 long @C_sjc8a_67da3ff4_threads_send_L000015
 long @C_sjc82d_67da3ff4_119_L000120
 long @C_sjc8b_67da3ff4_threads_receive_L000016
 long @C_sjc82e_67da3ff4_121_L000122
 long @C_sjc8h_67da3ff4_threads_send_async_L000022
 long @C_sjc82f_67da3ff4_123_L000124
 long @C_sjc8i_67da3ff4_threads_receive_async_L000023
 long $0
 long $0

' Catalina Export list_insert

' Catalina Code

DAT ' code segment

 alignl ' align long
C_list_insert ' <symbol:list_insert>
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_list_insert_126)<<S32 ' NEU4 reg coni
 word I16A_WRLONG + (r2)<<D16A + (r3)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_list_insert_127)<<S32 ' JUMPV addrg
 alignl ' align long
C_list_insert_126
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_list_insert_127
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_list_insert_125 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export list_remove

 alignl ' align long
C_list_remove ' <symbol:list_remove>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_list_remove_129)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_JMPA + (@C_list_remove_128)<<S32 ' JUMPV addrg
 alignl ' align long
C_list_remove_129
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C_list_remove_128
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export list_count

 alignl ' align long
C_list_count ' <symbol:list_count>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
' C_list_count_131 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export list_init

 alignl ' align long
C_list_init ' <symbol:list_init>
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_list_init_132 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc82g_67da3ff4_channel_create_L000133 ' <symbol:channel_create>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82g_67da3ff4_channel_create_L000133_135_L000136 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (72)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_newuserdatauv)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_list_init)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_list_init)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_init)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_init)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_init)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_init)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_sjc82g_67da3ff4_channel_create_L000133_134 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc82i_67da3ff4_channel_unlocked_get_L000137 ' <symbol:channel_unlocked_get>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82g_67da3ff4_channel_create_L000133_135_L000136 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_touserdata)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
' C_sjc82i_67da3ff4_channel_unlocked_get_L000137_138 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc82j_67da3ff4_channel_locked_get_L000139 ' <symbol:channel_locked_get>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc82j_67da3ff4_channel_locked_get_L000139_148)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139_144)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82j_67da3ff4_channel_locked_get_L000139_143
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_wait)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 alignl ' align long
C_sjc82j_67da3ff4_channel_locked_get_L000139_144
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc82i_67da3ff4_channel_unlocked_get_L000137)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc82j_67da3ff4_channel_locked_get_L000139_146)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_trylock)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc82j_67da3ff4_channel_locked_get_L000139_143)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sjc82j_67da3ff4_channel_locked_get_L000139_146
 alignl ' align long
 long I32_JMPA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139_142)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82j_67da3ff4_channel_locked_get_L000139_147
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 alignl ' align long
C_sjc82j_67da3ff4_channel_locked_get_L000139_148
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc82i_67da3ff4_channel_unlocked_get_L000137)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc82j_67da3ff4_channel_locked_get_L000139_150)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_trylock)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc82j_67da3ff4_channel_locked_get_L000139_147)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sjc82j_67da3ff4_channel_locked_get_L000139_150
 alignl ' align long
C_sjc82j_67da3ff4_channel_locked_get_L000139_142
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_sjc82j_67da3ff4_channel_locked_get_L000139_140 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luathread_unlock_channel

 alignl ' align long
C_luathread_unlock_channel ' <symbol:luathread_unlock_channel>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_signal)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
' C_luathread_unlock_channel_151 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luathread_recycle_insert

 alignl ' align long
C_luathread_recycle_insert ' <symbol:luathread_recycle_insert>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc81_67da3ff4_mutex_recycle_list_L000006 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82_67da3ff4_recycle_list_L000007 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_list_count)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sjc83_67da3ff4_recyclemax_L000008)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_luathread_recycle_insert_153)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luathread_get_state)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_close)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luathread_recycle_insert_154)<<S32 ' JUMPV addrg
 alignl ' align long
C_luathread_recycle_insert_153
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc82_67da3ff4_recycle_list_L000007 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_list_insert)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luathread_recycle_insert_154
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc81_67da3ff4_mutex_recycle_list_L000006 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
' C_luathread_recycle_insert_152 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luathread_queue_sender

 alignl ' align long
C_luathread_queue_sender ' <symbol:luathread_queue_sender>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_list_insert)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_luathread_queue_sender_155 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luathread_queue_receiver

 alignl ' align long
C_luathread_queue_receiver ' <symbol:luathread_queue_receiver>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_list_insert)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_luathread_queue_receiver_156 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc82k_67da3ff4_luathread_loadbuffer_L000157 ' <symbol:luathread_loadbuffer>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaL__loadbufferx)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc82k_67da3ff4_luathread_loadbuffer_L000157_159)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_RDLONG + (r4)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_RDLONG + (r2)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_close)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc82k_67da3ff4_luathread_loadbuffer_L000157_159
' C_sjc82k_67da3ff4_luathread_loadbuffer_L000157_158 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161 ' <symbol:luathread_copyvalues>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_checkstack)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_163)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_165_L000166 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_167_L000168 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_162)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_163
 word I16A_MOVI + (r19)<<D16A + (2)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_172)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_169
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_173)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_173)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_204_L000206 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_204_L000206 ' <symbol:204>
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_181
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_176
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_173
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_177
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_180
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_182

' Catalina Code

DAT ' code segment
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_176
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_174)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_177
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_isinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_178)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tonumberx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_174)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_178
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tonumberx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushnumber)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_174)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_180
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushlstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_174)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_181
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_174)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_182
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_184)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_183
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_186)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_188)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_188)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_197_L000199 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_197_L000199 ' <symbol:197>
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_196
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_191
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_188
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_192
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_195

' Catalina Code

DAT ' code segment
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_191
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_189)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_192
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_isinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_193)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tonumberx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_194)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_193
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tonumberx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushnumber)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_194
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_189)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_195
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_189)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_196
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_189)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_188
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_189
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_186
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_184
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_next)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_183)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_174)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_173
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_typename)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_200_L000201 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_typename)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc82l_67da3ff4_luathread_copyvalues_L000161_202_L000203 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_162)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_174
' C_sjc82l_67da3ff4_luathread_copyvalues_L000161_170 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_172
 word I16A_CMPS + (r19)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161_169)<<S32 ' LEI4 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_162
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc82u_67da3ff4_luathread_getself_L000207 ' <symbol:luathread_getself>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82u_67da3ff4_luathread_getself_L000207_209_L000210 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_touserdata)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
' C_sjc82u_67da3ff4_luathread_getself_L000207_208 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc830_67da3ff4_luathread_new_L000211 ' <symbol:luathread_new>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_luaL__newstate)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (20)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_newuserdatauv)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82u_67da3ff4_luathread_getself_L000207_209_L000210 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc87_67da3ff4_luathread_openlualibs_L000012)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc816_67da3ff4_luathread_loadlib_L000043 ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_sjc830_67da3ff4_luathread_new_L000211_213_L000214 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__requiref)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaopen_propeller ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_sjc830_67da3ff4_luathread_new_L000211_215_L000216 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__requiref)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaopen_coroutine ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_sjc830_67da3ff4_luathread_new_L000211_217_L000218 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__requiref)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_WRLONG + (r21)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_sjc830_67da3ff4_luathread_new_L000211_212 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc834_67da3ff4_luathread_join_workers_L000219 ' <symbol:luathread_join_workers>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_sched_join_workers)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_close)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_sjc834_67da3ff4_luathread_join_workers_L000219_220 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc835_67da3ff4_writer_L000221 ' <symbol:writer>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r15)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc835_67da3ff4_writer_L000221_223)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r15)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__buffinit)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc835_67da3ff4_writer_L000221_223
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__addlstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_sjc835_67da3ff4_writer_L000221_222 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc836_67da3ff4_func_dump_L000225 ' <symbol:func_dump>
 alignl ' align long
 long I32_NEWF + 280<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-284)&$FFFFFF)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 word I16A_MOVI + (r2)<<D16A + (6)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checktype)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODF + ((-280)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 alignl ' align long
 long I32_LODF + ((-284)&$FFFFFF)<<S32
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRL
 alignl ' align long
 long I32_LODF + ((-280)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_sjc835_67da3ff4_writer_L000221 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_dump)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc836_67da3ff4_func_dump_L000225_227)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc836_67da3ff4_func_dump_L000225_229_L000230 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sjc836_67da3ff4_func_dump_L000225_226)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc836_67da3ff4_func_dump_L000225_227
 alignl ' align long
 long I32_LODF + ((-276)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaL__pushresult)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc836_67da3ff4_func_dump_L000225_226
 word I16B_POPM + 70<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232 ' <symbol:luathread_copyupvalues>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_235)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_234
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_237)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_237)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_sjc838_67da3ff4_luathread_copyupvalues_L000232_251_L000253 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_251_L000253 ' <symbol:251>
 long @C_sjc838_67da3ff4_luathread_copyupvalues_L000232_245
 long @C_sjc838_67da3ff4_luathread_copyupvalues_L000232_240
 long @C_sjc838_67da3ff4_luathread_copyupvalues_L000232_237
 long @C_sjc838_67da3ff4_luathread_copyupvalues_L000232_241
 long @C_sjc838_67da3ff4_luathread_copyupvalues_L000232_244
 long @C_sjc838_67da3ff4_luathread_copyupvalues_L000232_246

' Catalina Code

DAT ' code segment
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_240
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_238)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_241
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_isinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_242)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tonumberx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_238)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_242
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tonumberx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushnumber)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_238)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_244
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushlstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_238)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_245
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_238)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_246
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rawgeti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r4)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_compare)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_247)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rawgeti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_238)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_247
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_237
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_typename)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc838_67da3ff4_luathread_copyupvalues_L000232_249_L000250 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_233)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_238
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setupvalue)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_254)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc838_67da3ff4_luathread_copyupvalues_L000232_256_L000257 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_233)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_254
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_235
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getupvalue)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232_234)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_233
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8g_67da3ff4_threads_recycle_set_L000021 ' <symbol:threads_recycle_set>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sjc8g_67da3ff4_threads_recycle_set_L000021_261)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8g_67da3ff4_threads_recycle_set_L000021_259_L000260 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc8g_67da3ff4_threads_recycle_set_L000021_261
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc81_67da3ff4_mutex_recycle_list_L000006 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_sjc83_67da3ff4_recyclemax_L000008)<<S32
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_sjc8g_67da3ff4_threads_recycle_set_L000021_263)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8g_67da3ff4_threads_recycle_set_L000021_262
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82_67da3ff4_recycle_list_L000007 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_list_remove)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r2)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_close)<<S32 ' CALL addrg
 alignl ' align long
C_sjc8g_67da3ff4_threads_recycle_set_L000021_263
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82_67da3ff4_recycle_list_L000007 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_list_count)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sjc83_67da3ff4_recyclemax_L000008)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sjc8g_67da3ff4_threads_recycle_set_L000021_262)<<S32 ' GTI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc81_67da3ff4_mutex_recycle_list_L000006 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_sjc8g_67da3ff4_threads_recycle_set_L000021_258 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc89_67da3ff4_threads_wait_L000014 ' <symbol:threads_wait>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc89_67da3ff4_threads_wait_L000014_266)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc8q_67da3ff4_threads_wait_for_L000031)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sjc89_67da3ff4_threads_wait_L000014_265)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc89_67da3ff4_threads_wait_L000014_266
 alignl ' align long
 long I32_CALA + (@C_sched_wait)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C__thread_stall)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_malloc_defragment)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C__thread_allow)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_gc)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_gc)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_sjc89_67da3ff4_threads_wait_L000014_265
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8e_67da3ff4_threads_set_numworkers_L000019 ' <symbol:threads_set_numworkers>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc8e_67da3ff4_threads_set_numworkers_L000019_269)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sjc8e_67da3ff4_threads_set_numworkers_L000019_273)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8e_67da3ff4_threads_set_numworkers_L000019_271_L000272 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc8e_67da3ff4_threads_set_numworkers_L000019_273
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sched_set_numworkers)<<S32 ' CALL addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8e_67da3ff4_threads_set_numworkers_L000019_274)<<S32 ' NEI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8e_67da3ff4_threads_set_numworkers_L000019_276_L000277 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc8e_67da3ff4_threads_set_numworkers_L000019_274
 alignl ' align long
 long I32_CALA + (@C__thread_stall)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_malloc_defragment)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C__thread_allow)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_gc)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_gc)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc8e_67da3ff4_threads_set_numworkers_L000019_269
 alignl ' align long
 long I32_CALA + (@C_sched_get_numworkers)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sjc8e_67da3ff4_threads_set_numworkers_L000019_268 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8f_67da3ff4_threads_get_numworkers_L000020 ' <symbol:threads_get_numworkers>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_sched_get_numworkers)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sjc8f_67da3ff4_threads_get_numworkers_L000020_278 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc88_67da3ff4_threads_create_newproc_L000013 ' <symbol:threads_create_newproc>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (6)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_280)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc836_67da3ff4_func_dump_L000225)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_282)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc88_67da3ff4_threads_create_newproc_L000013_284_L000285 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_279)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc88_67da3ff4_threads_create_newproc_L000013_282
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_281)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc88_67da3ff4_threads_create_newproc_L000013_280
 word I16A_CMPSI + (r15)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_286)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_typename)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc88_67da3ff4_threads_create_newproc_L000013_288_L000289 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_279)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc88_67da3ff4_threads_create_newproc_L000013_286
 alignl ' align long
C_sjc88_67da3ff4_threads_create_newproc_L000013_281
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc81_67da3ff4_mutex_recycle_list_L000006 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sjc83_67da3ff4_recyclemax_L000008)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_290)<<S32 ' LEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82_67da3ff4_recycle_list_L000007 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_list_remove)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_292)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc830_67da3ff4_luathread_new_L000211)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_291)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc88_67da3ff4_threads_create_newproc_L000013_292
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_RDLONG + (r3)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_291)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc88_67da3ff4_threads_create_newproc_L000013_290
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc830_67da3ff4_luathread_new_L000211)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjc88_67da3ff4_threads_create_newproc_L000013_291
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc81_67da3ff4_mutex_recycle_list_L000006 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_sjc82k_67da3ff4_luathread_loadbuffer_L000157)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPSI + (r15)<<D16A + (6)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_294)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sjc838_67da3ff4_luathread_copyupvalues_L000232)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_296)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luathread_recycle_insert)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc88_67da3ff4_threads_create_newproc_L000013_279)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc88_67da3ff4_threads_create_newproc_L000013_296
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc88_67da3ff4_threads_create_newproc_L000013_294
 alignl ' align long
 long I32_CALA + (@C_sched_inc_lpcount)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sched_queue_proc)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc88_67da3ff4_threads_create_newproc_L000013_279
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8a_67da3ff4_threads_send_L000015 ' <symbol:threads_send>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8a_67da3ff4_threads_send_L000015_299)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8a_67da3ff4_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8a_67da3ff4_threads_send_L000015_298)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8a_67da3ff4_threads_send_L000015_299
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_list_remove)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8a_67da3ff4_threads_send_L000015_303)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r2)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODI + (@C_sjc85_67da3ff4_mainlp_L000010)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8a_67da3ff4_threads_send_L000015_305)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc86_67da3ff4_mutex_mainls_L000011 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_cond_mainls_sendrecv ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_signal)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc86_67da3ff4_mutex_mainls_L000011 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8a_67da3ff4_threads_send_L000015_306)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8a_67da3ff4_threads_send_L000015_305
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sched_queue_proc)<<S32 ' CALL addrg
 alignl ' align long
C_sjc8a_67da3ff4_threads_send_L000015_306
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luathread_unlock_channel)<<S32 ' CALL addrg
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8a_67da3ff4_threads_send_L000015_307)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8a_67da3ff4_threads_send_L000015_298)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8a_67da3ff4_threads_send_L000015_307
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8a_67da3ff4_threads_send_L000015_298)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8a_67da3ff4_threads_send_L000015_303
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc85_67da3ff4_mainlp_L000010)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8a_67da3ff4_threads_send_L000015_309)<<S32 ' NEU4 reg reg
 alignl ' align long
 long I32_LODA + (@C_sjc85_67da3ff4_mainlp_L000010+12)<<S32
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc85_67da3ff4_mainlp_L000010 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luathread_queue_sender)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luathread_unlock_channel)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc86_67da3ff4_mutex_mainls_L000011 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc86_67da3ff4_mutex_mainls_L000011 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_cond_mainls_sendrecv ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_wait)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc86_67da3ff4_mutex_mainls_L000011 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sjc85_67da3ff4_mainlp_L000010+8)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8a_67da3ff4_threads_send_L000015_298)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8a_67da3ff4_threads_send_L000015_309
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc82u_67da3ff4_luathread_getself_L000207)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8a_67da3ff4_threads_send_L000015_313)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_sjc8a_67da3ff4_threads_send_L000015_313
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_yieldk)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjc8a_67da3ff4_threads_send_L000015_298
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8h_67da3ff4_threads_send_async_L000022 ' <symbol:threads_send_async>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8h_67da3ff4_threads_send_async_L000022_316)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8a_67da3ff4_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8h_67da3ff4_threads_send_async_L000022_315)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8h_67da3ff4_threads_send_async_L000022_316
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_list_remove)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8h_67da3ff4_threads_send_async_L000022_318)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r2)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODI + (@C_sjc85_67da3ff4_mainlp_L000010)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8h_67da3ff4_threads_send_async_L000022_320)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc86_67da3ff4_mutex_mainls_L000011 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_cond_mainls_sendrecv ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_signal)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc86_67da3ff4_mutex_mainls_L000011 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8h_67da3ff4_threads_send_async_L000022_321)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8h_67da3ff4_threads_send_async_L000022_320
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sched_queue_proc)<<S32 ' CALL addrg
 alignl ' align long
C_sjc8h_67da3ff4_threads_send_async_L000022_321
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luathread_unlock_channel)<<S32 ' CALL addrg
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8h_67da3ff4_threads_send_async_L000022_322)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8h_67da3ff4_threads_send_async_L000022_315)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8h_67da3ff4_threads_send_async_L000022_322
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8h_67da3ff4_threads_send_async_L000022_315)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8h_67da3ff4_threads_send_async_L000022_318
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luathread_unlock_channel)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8h_67da3ff4_threads_send_async_L000022_324_L000325 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
C_sjc8h_67da3ff4_threads_send_async_L000022_315
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8n_67da3ff4_threads_lock_L000028 ' <symbol:threads_lock>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8n_67da3ff4_threads_lock_L000028_330)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8a_67da3ff4_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8n_67da3ff4_threads_lock_L000028_326)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8n_67da3ff4_threads_lock_L000028_329
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjc8n_67da3ff4_threads_lock_L000028_330
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8n_67da3ff4_threads_lock_L000028_332)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_trylock)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8n_67da3ff4_threads_lock_L000028_329)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sjc8n_67da3ff4_threads_lock_L000028_332
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8n_67da3ff4_threads_lock_L000028_333)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8n_67da3ff4_threads_lock_L000028_326)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8n_67da3ff4_threads_lock_L000028_333
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc8n_67da3ff4_threads_lock_L000028_326
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8p_67da3ff4_threads_trylock_L000030 ' <symbol:threads_trylock>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8p_67da3ff4_threads_trylock_L000030_336)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8a_67da3ff4_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8p_67da3ff4_threads_trylock_L000030_335)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8p_67da3ff4_threads_trylock_L000030_336
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_trylock)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8p_67da3ff4_threads_trylock_L000030_338)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8p_67da3ff4_threads_trylock_L000030_339)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8p_67da3ff4_threads_trylock_L000030_338
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc8p_67da3ff4_threads_trylock_L000030_339
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc8p_67da3ff4_threads_trylock_L000030_335
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8o_67da3ff4_threads_unlock_L000029 ' <symbol:threads_unlock>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8o_67da3ff4_threads_unlock_L000029_341)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8a_67da3ff4_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8o_67da3ff4_threads_unlock_L000029_340)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8o_67da3ff4_threads_unlock_L000029_341
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8o_67da3ff4_threads_unlock_L000029_343)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8o_67da3ff4_threads_unlock_L000029_344)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8o_67da3ff4_threads_unlock_L000029_343
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc8o_67da3ff4_threads_unlock_L000029_344
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc8o_67da3ff4_threads_unlock_L000029_340
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8q_67da3ff4_threads_wait_for_L000031 ' <symbol:threads_wait_for>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8q_67da3ff4_threads_wait_for_L000031_346)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8q_67da3ff4_threads_wait_for_L000031_348_L000349 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8q_67da3ff4_threads_wait_for_L000031_345)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8q_67da3ff4_threads_wait_for_L000031_346
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8q_67da3ff4_threads_wait_for_L000031_350)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8a_67da3ff4_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8q_67da3ff4_threads_wait_for_L000031_345)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8q_67da3ff4_threads_wait_for_L000031_350
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_wait)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc8q_67da3ff4_threads_wait_for_L000031_345
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8r_67da3ff4_threads_signal_L000032 ' <symbol:threads_signal>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8r_67da3ff4_threads_signal_L000032_353)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8a_67da3ff4_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8r_67da3ff4_threads_signal_L000032_352)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8r_67da3ff4_threads_signal_L000032_353
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_signal)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc8r_67da3ff4_threads_signal_L000032_352
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8s_67da3ff4_threads_broadcast_L000033 ' <symbol:threads_broadcast>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8s_67da3ff4_threads_broadcast_L000033_356)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8a_67da3ff4_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8s_67da3ff4_threads_broadcast_L000033_355)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8s_67da3ff4_threads_broadcast_L000033_356
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_broadcast)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc8s_67da3ff4_threads_broadcast_L000033_355
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8t_67da3ff4_threads_rendezvous_L000034 ' <symbol:threads_rendezvous>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8t_67da3ff4_threads_rendezvous_L000034_362)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8a_67da3ff4_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8t_67da3ff4_threads_rendezvous_L000034_358)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8t_67da3ff4_threads_rendezvous_L000034_361
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjc8t_67da3ff4_threads_rendezvous_L000034_362
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8t_67da3ff4_threads_rendezvous_L000034_364)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_trylock)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8t_67da3ff4_threads_rendezvous_L000034_361)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sjc8t_67da3ff4_threads_rendezvous_L000034_364
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8t_67da3ff4_threads_rendezvous_L000034_365)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8t_67da3ff4_threads_rendezvous_L000034_358)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8t_67da3ff4_threads_rendezvous_L000034_365
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_broadcast)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_wait)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8t_67da3ff4_threads_rendezvous_L000034_367)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8a_67da3ff4_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8t_67da3ff4_threads_rendezvous_L000034_358)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8t_67da3ff4_threads_rendezvous_L000034_367
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_broadcast)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc8t_67da3ff4_threads_rendezvous_L000034_358
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc83l_67da3ff4_simple_type_L000369 ' <symbol:simple_type>
 alignl ' align long
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc83l_67da3ff4_simple_type_L000369_376)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc83l_67da3ff4_simple_type_L000369_376)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc83l_67da3ff4_simple_type_L000369_376)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc83l_67da3ff4_simple_type_L000369_372)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sjc83l_67da3ff4_simple_type_L000369_376
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sjc83l_67da3ff4_simple_type_L000369_373)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83l_67da3ff4_simple_type_L000369_372
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sjc83l_67da3ff4_simple_type_L000369_373
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_sjc83l_67da3ff4_simple_type_L000369_370 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377 ' <symbol:luathread_movevalues>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_checkstack)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_379)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_378)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_379
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_384)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_381
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_385)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_385)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_412_L000414 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_412_L000414 ' <symbol:412>
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_393
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_388
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_385
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_389
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_392
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_394

' Catalina Code

DAT ' code segment
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_388
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_386)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_389
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_isinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_390)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tonumberx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_386)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_390
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tonumberx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushnumber)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_386)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_392
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushlstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_386)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_393
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_386)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_394
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_396)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_395
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_398)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_400)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_400)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_409_L000411 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_409_L000411 ' <symbol:409>
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_408
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_403
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_400
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_404
 long @C_sjc83m_67da3ff4_luathread_movevalues_L000377_407

' Catalina Code

DAT ' code segment
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_403
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_401)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_404
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_isinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_405)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tonumberx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_406)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_405
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tonumberx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushnumber)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_406
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_401)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_407
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_401)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_408
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_401)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_400
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_401
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_398
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_396
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_next)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_395)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_386)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_385
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_378)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_386
' C_sjc83m_67da3ff4_luathread_movevalues_L000377_382 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_384
 word I16A_CMPS + (r19)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377_381)<<S32 ' LEI4 reg reg
 word I16A_NEG + (r22)<<D16A + (r17)<<S16A ' NEGI4
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc83m_67da3ff4_luathread_movevalues_L000377_378
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035 ' <symbol:threads_shared>
 alignl ' align long
 long I32_NEWF + 136<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8u_67da3ff4_threads_shared_L000035_416)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_418_L000419 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8u_67da3ff4_threads_shared_L000035_415)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_416
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8u_67da3ff4_threads_shared_L000035_420)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_422_L000423 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8u_67da3ff4_threads_shared_L000035_415)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_420
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (46)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8u_67da3ff4_threads_shared_L000035_424)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8u_67da3ff4_threads_shared_L000035_426)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_426
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8u_67da3ff4_threads_shared_L000035_425)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8u_67da3ff4_threads_shared_L000035_415)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_424
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (127)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-140)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strncpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-13)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODF + ((-140)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtok)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8u_67da3ff4_threads_shared_L000035_435)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8u_67da3ff4_threads_shared_L000035_433)<<S32 ' EQI4 reg coni
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_435
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8u_67da3ff4_threads_shared_L000035_415)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_433
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtok)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtok)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sjc8u_67da3ff4_threads_shared_L000035_437)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_436
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_gettable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8u_67da3ff4_threads_shared_L000035_439)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_441_L000442 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8u_67da3ff4_threads_shared_L000035_415)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_439
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtok)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_437
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8u_67da3ff4_threads_shared_L000035_436)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8u_67da3ff4_threads_shared_L000035_443)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_443
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8u_67da3ff4_threads_shared_L000035_445)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8u_67da3ff4_threads_shared_L000035_415)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_445
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_425
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_447_L000448 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_415
 word I16B_POPM + 34<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037 ' <symbol:threads_export>
 alignl ' align long
 long I32_NEWF + 136<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc810_67da3ff4_threads_export_L000037_450)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc810_67da3ff4_threads_export_L000037_452_L000453 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc810_67da3ff4_threads_export_L000037_449)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_450
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc810_67da3ff4_threads_export_L000037_454)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc810_67da3ff4_threads_export_L000037_456_L000457 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc810_67da3ff4_threads_export_L000037_449)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_454
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (46)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc810_67da3ff4_threads_export_L000037_458)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc810_67da3ff4_threads_export_L000037_460)<<S32 ' LEI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc810_67da3ff4_threads_export_L000037_460)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc810_67da3ff4_threads_export_L000037_464)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc810_67da3ff4_threads_export_L000037_462)<<S32 ' EQI4 reg coni
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_464
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_462
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_460
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-140)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-140)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc810_67da3ff4_threads_export_L000037_459)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_setglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc810_67da3ff4_threads_export_L000037_449)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_458
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (127)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-136)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strncpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-9)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODF + ((-136)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtok)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc810_67da3ff4_threads_export_L000037_470)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc810_67da3ff4_threads_export_L000037_468)<<S32 ' EQI4 reg coni
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_470
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc810_67da3ff4_threads_export_L000037_471_L000472 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc810_67da3ff4_threads_export_L000037_449)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_468
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc810_67da3ff4_threads_export_L000037_473)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_setglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_473
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtok)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtok)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sjc810_67da3ff4_threads_export_L000037_476)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_475
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_gettable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc810_67da3ff4_threads_export_L000037_478)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc810_67da3ff4_threads_export_L000037_471_L000472 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc810_67da3ff4_threads_export_L000037_449)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_478
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_gettable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc810_67da3ff4_threads_export_L000037_480)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_gettable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_480
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtok)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_476
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc810_67da3ff4_threads_export_L000037_475)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_gettable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc810_67da3ff4_threads_export_L000037_482)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_gettable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc810_67da3ff4_threads_export_L000037_484)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_gettable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_484
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_482
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-140)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc810_67da3ff4_threads_export_L000037_449)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_459
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc810_67da3ff4_threads_export_L000037_486_L000487 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
C_sjc810_67da3ff4_threads_export_L000037_449
 word I16B_POPM + 34<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8v_67da3ff4_threads_update_L000036 ' <symbol:threads_update>
 alignl ' align long
 long I32_NEWF + 136<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8v_67da3ff4_threads_update_L000036_489)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8v_67da3ff4_threads_update_L000036_491_L000492 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8v_67da3ff4_threads_update_L000036_488)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8v_67da3ff4_threads_update_L000036_489
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc83l_67da3ff4_simple_type_L000369)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8v_67da3ff4_threads_update_L000036_493)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8v_67da3ff4_threads_update_L000036_495_L000496 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8v_67da3ff4_threads_update_L000036_488)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8v_67da3ff4_threads_update_L000036_493
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8v_67da3ff4_threads_update_L000036_497)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8v_67da3ff4_threads_update_L000036_499_L000500 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8v_67da3ff4_threads_update_L000036_488)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8v_67da3ff4_threads_update_L000036_497
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (46)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8v_67da3ff4_threads_update_L000036_501)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-140)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-140)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8v_67da3ff4_threads_update_L000036_502)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_setglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8v_67da3ff4_threads_update_L000036_488)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8v_67da3ff4_threads_update_L000036_501
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (127)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-136)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strncpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-9)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODF + ((-136)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtok)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8v_67da3ff4_threads_update_L000036_506)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_setglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc8v_67da3ff4_threads_update_L000036_506
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtok)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtok)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sjc8v_67da3ff4_threads_update_L000036_509)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8v_67da3ff4_threads_update_L000036_508
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_gettable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8v_67da3ff4_threads_update_L000036_511)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_gettable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc8v_67da3ff4_threads_update_L000036_511
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtok)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjc8v_67da3ff4_threads_update_L000036_509
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8v_67da3ff4_threads_update_L000036_508)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc83m_67da3ff4_luathread_movevalues_L000377)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-140)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8v_67da3ff4_threads_update_L000036_488)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8v_67da3ff4_threads_update_L000036_502
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8v_67da3ff4_threads_update_L000036_513_L000514 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
C_sjc8v_67da3ff4_threads_update_L000036_488
 word I16B_POPM + 34<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8i_67da3ff4_threads_receive_async_L000023 ' <symbol:threads_receive_async>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_CMPSI + (r22)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8i_67da3ff4_threads_receive_async_L000023_516)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8i_67da3ff4_threads_receive_async_L000023_516)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc8b_67da3ff4_threads_receive_L000016)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sjc8i_67da3ff4_threads_receive_async_L000023_515)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8i_67da3ff4_threads_receive_async_L000023_516
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc8b_67da3ff4_threads_receive_L000016)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjc8i_67da3ff4_threads_receive_async_L000023_515
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016 ' <symbol:threads_receive>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $faae00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r10)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8b_67da3ff4_threads_receive_L000016_519)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8b_67da3ff4_threads_receive_L000016_520)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_519
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_520
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8b_67da3ff4_threads_receive_L000016_522)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r9)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8b_67da3ff4_threads_receive_L000016_523)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_522
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_523
 word I16A_MOV + (r2)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82j_67da3ff4_channel_locked_get_L000139)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8b_67da3ff4_threads_receive_L000016_524)<<S32 ' NEU4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8b_67da3ff4_threads_receive_L000016_526)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8b_67da3ff4_threads_receive_L000016_528_L000529 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8b_67da3ff4_threads_receive_L000016_518)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_526
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8b_67da3ff4_threads_receive_L000016_530_L000531 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8b_67da3ff4_threads_receive_L000016_518)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_524
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_list_remove)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8b_67da3ff4_threads_receive_L000016_532)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r3)<<D16A + (r13)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sjc82l_67da3ff4_luathread_copyvalues_L000161)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8b_67da3ff4_threads_receive_L000016_534)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_RDLONG + (r3)<<D16A + (r13)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_sjc8b_67da3ff4_threads_receive_L000016_535)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_534
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_535
 word I16A_RDLONG + (r22)<<D16A + (r13)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODI + (@C_sjc85_67da3ff4_mainlp_L000010)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8b_67da3ff4_threads_receive_L000016_536)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc86_67da3ff4_mutex_mainls_L000011 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_cond_mainls_sendrecv ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_signal)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc86_67da3ff4_mutex_mainls_L000011 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8b_67da3ff4_threads_receive_L000016_537)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_536
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sched_queue_proc)<<S32 ' CALL addrg
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_537
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luathread_unlock_channel)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r19)<<S16A ' SUBI/P (3)
 alignl ' align long
 long I32_JMPA + (@C_sjc8b_67da3ff4_threads_receive_L000016_518)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_532
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8b_67da3ff4_threads_receive_L000016_538)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luathread_unlock_channel)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8b_67da3ff4_threads_receive_L000016_528_L000529 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8b_67da3ff4_threads_receive_L000016_518)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_538
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc85_67da3ff4_mainlp_L000010)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8b_67da3ff4_threads_receive_L000016_540)<<S32 ' NEU4 reg reg
 alignl ' align long
 long I32_LODA + (@C_sjc85_67da3ff4_mainlp_L000010+12)<<S32
 word I16A_WRLONG + (r15)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc85_67da3ff4_mainlp_L000010 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luathread_queue_receiver)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luathread_unlock_channel)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc86_67da3ff4_mutex_mainls_L000011 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc86_67da3ff4_mutex_mainls_L000011 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_cond_mainls_sendrecv ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_wait)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc86_67da3ff4_mutex_mainls_L000011 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sjc85_67da3ff4_mainlp_L000010+8)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8b_67da3ff4_threads_receive_L000016_518)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_540
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc82u_67da3ff4_luathread_getself_L000207)<<S32 ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8b_67da3ff4_threads_receive_L000016_544)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_544
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_yieldk)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjc8b_67da3ff4_threads_receive_L000016_518
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8c_67da3ff4_threads_create_channel_L000017 ' <symbol:threads_create_channel>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc82i_67da3ff4_channel_unlocked_get_L000137)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8c_67da3ff4_threads_create_channel_L000017_547)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8c_67da3ff4_threads_create_channel_L000017_549_L000550 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8c_67da3ff4_threads_create_channel_L000017_546)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8c_67da3ff4_threads_create_channel_L000017_547
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc82g_67da3ff4_channel_create_L000133)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc8c_67da3ff4_threads_create_channel_L000017_546
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8d_67da3ff4_threads_destroy_channel_L000018 ' <symbol:threads_destroy_channel>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_lock)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjc82i_67da3ff4_channel_unlocked_get_L000137)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8d_67da3ff4_threads_destroy_channel_L000018_552)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_trylock)<<S32 ' CALL addrg
 alignl ' align long
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_552
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8d_67da3ff4_threads_destroy_channel_L000018_554)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8a_67da3ff4_threads_send_L000015_301_L000302 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8d_67da3ff4_threads_destroy_channel_L000018_551)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_554
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82g_67da3ff4_channel_create_L000133_135_L000136 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_broadcast)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_broadcast)<<S32 ' CALL addrg
 word I16B_LODL + (r19)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8d_67da3ff4_threads_destroy_channel_L000018_556)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8d_67da3ff4_threads_destroy_channel_L000018_558_L000559 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_556
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8d_67da3ff4_threads_destroy_channel_L000018_560)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8d_67da3ff4_threads_destroy_channel_L000018_563)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_562
 word I16A_RDLONG + (r2)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r3)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sched_queue_proc)<<S32 ' CALL addrg
 alignl ' align long
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_563
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_list_remove)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8d_67da3ff4_threads_destroy_channel_L000018_562)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_560
 word I16B_LODL + (r19)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8d_67da3ff4_threads_destroy_channel_L000018_565)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8d_67da3ff4_threads_destroy_channel_L000018_567_L000568 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (12)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_565
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8d_67da3ff4_threads_destroy_channel_L000018_569)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8d_67da3ff4_threads_destroy_channel_L000018_572)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_571
 word I16A_RDLONG + (r2)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r3)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sched_queue_proc)<<S32 ' CALL addrg
 alignl ' align long
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_572
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_list_remove)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8d_67da3ff4_threads_destroy_channel_L000018_571)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_569
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8_67da3ff4_mutex_channel_list_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_destroy)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_destroy)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_unlock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_cond_destroy)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_mutex_destroy)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_551
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc811_67da3ff4_threads_sbrk_L000038 ' <symbol:threads_sbrk>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc811_67da3ff4_threads_sbrk_L000038_575)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc811_67da3ff4_threads_sbrk_L000038_577)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__thread_stall)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_malloc_defragment)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C__thread_allow)<<S32 ' CALL addrg
 alignl ' align long
C_sjc811_67da3ff4_threads_sbrk_L000038_577
 alignl ' align long
C_sjc811_67da3ff4_threads_sbrk_L000038_575
 alignl ' align long
 long I32_CALA + (@C__thread_stall)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_CALA + (@C__thread_allow)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sjc811_67da3ff4_threads_sbrk_L000038_574 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc812_67da3ff4_threads_stacksize_L000039 ' <symbol:threads_stacksize>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc812_67da3ff4_threads_stacksize_L000039_580)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sjc812_67da3ff4_threads_stacksize_L000039_584)<<S32 ' GTI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc812_67da3ff4_threads_stacksize_L000039_582_L000583 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc812_67da3ff4_threads_stacksize_L000039_584
 alignl ' align long
 long I32_LODA + (@C_stacksize)<<S32
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
C_sjc812_67da3ff4_threads_stacksize_L000039_580
 alignl ' align long
 long I32_LODI + (@C_stacksize)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sjc812_67da3ff4_threads_stacksize_L000039_579 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc815_67da3ff4_threads_factories_L000042 ' <symbol:threads_factories>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc815_67da3ff4_threads_factories_L000042_586)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sjc815_67da3ff4_threads_factories_L000042_590)<<S32 ' GTI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc815_67da3ff4_threads_factories_L000042_588_L000589 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc815_67da3ff4_threads_factories_L000042_590
 word I16A_CMPSI + (r21)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc815_67da3ff4_threads_factories_L000042_591)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (16)<<S16A ' reg <- coni
 alignl ' align long
C_sjc815_67da3ff4_threads_factories_L000042_591
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sched_set_numfactories)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sjc815_67da3ff4_threads_factories_L000042_587)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc815_67da3ff4_threads_factories_L000042_586
 alignl ' align long
 long I32_CALA + (@C_sched_get_numfactories)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjc815_67da3ff4_threads_factories_L000042_587
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sjc815_67da3ff4_threads_factories_L000042_585 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc813_67da3ff4_threads_factory_L000040 ' <symbol:threads_factory>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc813_67da3ff4_threads_factory_L000040_594)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sjc813_67da3ff4_threads_factory_L000040_596)<<S32 ' GTI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc815_67da3ff4_threads_factories_L000042_588_L000589 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc813_67da3ff4_threads_factory_L000040_596
 word I16A_CMPSI + (r21)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc813_67da3ff4_threads_factory_L000040_597)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (16)<<S16A ' reg <- coni
 alignl ' align long
C_sjc813_67da3ff4_threads_factory_L000040_597
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sched_set_factory)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sjc813_67da3ff4_threads_factory_L000040_595)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc813_67da3ff4_threads_factory_L000040_594
 alignl ' align long
 long I32_CALA + (@C_sched_get_factory)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjc813_67da3ff4_threads_factory_L000040_595
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sjc813_67da3ff4_threads_factory_L000040_593 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc814_67da3ff4_threads_version_L000041 ' <symbol:threads_version>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc814_67da3ff4_threads_version_L000041_600)<<S32 ' LEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc814_67da3ff4_threads_version_L000041_604_L000605 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc814_67da3ff4_threads_version_L000041_602)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (504)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc814_67da3ff4_threads_version_L000041_601)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc814_67da3ff4_threads_version_L000041_602
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc814_67da3ff4_threads_version_L000041_608_L000609 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc814_67da3ff4_threads_version_L000041_606)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc814_67da3ff4_threads_version_L000041_601)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc814_67da3ff4_threads_version_L000041_606
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((740)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc814_67da3ff4_threads_version_L000041_601)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc814_67da3ff4_threads_version_L000041_600
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (504)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_sjc814_67da3ff4_threads_version_L000041_601
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sjc814_67da3ff4_threads_version_L000041_599 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8l_67da3ff4_threads_sleep_L000026 ' <symbol:threads_sleep>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc8l_67da3ff4_threads_sleep_L000026_611)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sjc8l_67da3ff4_threads_sleep_L000026_615)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8l_67da3ff4_threads_sleep_L000026_613_L000614 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc8l_67da3ff4_threads_sleep_L000026_615
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc8l_67da3ff4_threads_sleep_L000026_616)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_sleep)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8l_67da3ff4_threads_sleep_L000026_612)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8l_67da3ff4_threads_sleep_L000026_616
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8l_67da3ff4_threads_sleep_L000026_612)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8l_67da3ff4_threads_sleep_L000026_611
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
 alignl ' align long
C_sjc8l_67da3ff4_threads_sleep_L000026_612
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_sjc8l_67da3ff4_threads_sleep_L000026_610 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8m_67da3ff4_threads_msleep_L000027 ' <symbol:threads_msleep>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc8m_67da3ff4_threads_msleep_L000027_619)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sjc8m_67da3ff4_threads_msleep_L000027_623)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8m_67da3ff4_threads_msleep_L000027_621_L000622 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc8m_67da3ff4_threads_msleep_L000027_623
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc8m_67da3ff4_threads_msleep_L000027_624)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_msleep)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8m_67da3ff4_threads_msleep_L000027_620)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8m_67da3ff4_threads_msleep_L000027_624
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8m_67da3ff4_threads_msleep_L000027_620)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8m_67da3ff4_threads_msleep_L000027_619
 alignl ' align long
 long I32_CALA + (@C_pthread_yield)<<S32 ' CALL addrg
 alignl ' align long
C_sjc8m_67da3ff4_threads_msleep_L000027_620
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_sjc8m_67da3ff4_threads_msleep_L000027_618 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024 ' <symbol:threads_print>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8j_67da3ff4_threads_print_L000024_627)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_isstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8j_67da3ff4_threads_print_L000024_629)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_631_L000632 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8j_67da3ff4_threads_print_L000024_628)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_629
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8j_67da3ff4_threads_print_L000024_633)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_635_L000636 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8j_67da3ff4_threads_print_L000024_628)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_633
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8j_67da3ff4_threads_print_L000024_637)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8j_67da3ff4_threads_print_L000024_644)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_639_L000640 ' reg <- addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8j_67da3ff4_threads_print_L000024_645)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_644
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_641_L000642 ' reg <- addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_645
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8j_67da3ff4_threads_print_L000024_628)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_637
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_typename)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_topointer)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_646_L000647 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8j_67da3ff4_threads_print_L000024_628)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_627
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8j_67da3ff4_threads_print_L000024_651)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_648
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc8j_67da3ff4_threads_print_L000024_652)<<S32 ' LEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_654_L000655 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32 ' CALL addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_652
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_isstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8j_67da3ff4_threads_print_L000024_656)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8j_67da3ff4_threads_print_L000024_657)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_656
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8j_67da3ff4_threads_print_L000024_658)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_660_L000661 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8j_67da3ff4_threads_print_L000024_659)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_658
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8j_67da3ff4_threads_print_L000024_662)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8j_67da3ff4_threads_print_L000024_669)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_664_L000665 ' reg <- addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8j_67da3ff4_threads_print_L000024_670)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_669
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_666_L000667 ' reg <- addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_670
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8j_67da3ff4_threads_print_L000024_663)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_662
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_typename)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_topointer)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_671_L000672 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_663
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_659
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_657
' C_sjc8j_67da3ff4_threads_print_L000024_649 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_651
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc8j_67da3ff4_threads_print_L000024_648)<<S32 ' LEI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_673_L000674 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32 ' CALL addrg
 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_628
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_sjc8j_67da3ff4_threads_print_L000024_626 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc8k_67da3ff4_threads_print_raw_L000025 ' <symbol:threads_print_raw>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sjc8k_67da3ff4_threads_print_raw_L000025_679)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8k_67da3ff4_threads_print_raw_L000025_676
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_isstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8k_67da3ff4_threads_print_raw_L000025_680)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8k_67da3ff4_threads_print_raw_L000025_681)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8k_67da3ff4_threads_print_raw_L000025_680
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8k_67da3ff4_threads_print_raw_L000025_682)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_660_L000661 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8k_67da3ff4_threads_print_raw_L000025_683)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8k_67da3ff4_threads_print_raw_L000025_682
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sjc8k_67da3ff4_threads_print_raw_L000025_684)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sjc8k_67da3ff4_threads_print_raw_L000025_687)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_664_L000665 ' reg <- addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8k_67da3ff4_threads_print_raw_L000025_688)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8k_67da3ff4_threads_print_raw_L000025_687
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_666_L000667 ' reg <- addrg
 alignl ' align long
C_sjc8k_67da3ff4_threads_print_raw_L000025_688
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sjc8k_67da3ff4_threads_print_raw_L000025_685)<<S32 ' JUMPV addrg
 alignl ' align long
C_sjc8k_67da3ff4_threads_print_raw_L000025_684
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_typename)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_topointer)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_sjc8j_67da3ff4_threads_print_L000024_671_L000672 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_pthread_printf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sjc8k_67da3ff4_threads_print_raw_L000025_685
 alignl ' align long
C_sjc8k_67da3ff4_threads_print_raw_L000025_683
 alignl ' align long
C_sjc8k_67da3ff4_threads_print_raw_L000025_681
' C_sjc8k_67da3ff4_threads_print_raw_L000025_677 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_sjc8k_67da3ff4_threads_print_raw_L000025_679
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjc8k_67da3ff4_threads_print_raw_L000025_676)<<S32 ' LEI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_sjc8k_67da3ff4_threads_print_raw_L000025_675 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luathread_get_channel

 alignl ' align long
C_luathread_get_channel ' <symbol:luathread_get_channel>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
' C_luathread_get_channel_689 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export luathread_get_status

 alignl ' align long
C_luathread_get_status ' <symbol:luathread_get_status>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
' C_luathread_get_status_690 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export luathread_set_status

 alignl ' align long
C_luathread_set_status ' <symbol:luathread_set_status>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_luathread_set_status_691 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export luathread_get_state

 alignl ' align long
C_luathread_get_state ' <symbol:luathread_get_state>
 word I16A_RDLONG + (r0)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
' C_luathread_get_state_692 ' (symbol refcount = 0)
 word I16B_RETN
 alignl ' align long
 alignl ' align long

' Catalina Export luathread_get_numargs

 alignl ' align long
C_luathread_get_numargs ' <symbol:luathread_get_numargs>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
' C_luathread_get_numargs_693 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export luathread_set_numargs

 alignl ' align long
C_luathread_set_numargs ' <symbol:luathread_set_numargs>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_luathread_set_numargs_694 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc84u_67da3ff4_luathread_reglualib_L000695 ' <symbol:luathread_reglualib>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc84u_67da3ff4_luathread_reglualib_L000695_697_L000698 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc84u_67da3ff4_luathread_reglualib_L000695_699_L000700 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushcclosure)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_sjc84u_67da3ff4_luathread_reglualib_L000695_696 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc87_67da3ff4_luathread_openlualibs_L000012 ' <symbol:luathread_openlualibs>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaopen_base ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_sjc87_67da3ff4_luathread_openlualibs_L000012_702_L000703 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__requiref)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaopen_package ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_sjc84u_67da3ff4_luathread_reglualib_L000695_697_L000698 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__requiref)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_io ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc87_67da3ff4_luathread_openlualibs_L000012_704_L000705 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sjc84u_67da3ff4_luathread_reglualib_L000695)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_os ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc87_67da3ff4_luathread_openlualibs_L000012_706_L000707 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sjc84u_67da3ff4_luathread_reglualib_L000695)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_table ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc87_67da3ff4_luathread_openlualibs_L000012_708_L000709 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sjc84u_67da3ff4_luathread_reglualib_L000695)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_string ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc87_67da3ff4_luathread_openlualibs_L000012_710_L000711 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sjc84u_67da3ff4_luathread_reglualib_L000695)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_math ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc87_67da3ff4_luathread_openlualibs_L000012_712_L000713 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sjc84u_67da3ff4_luathread_reglualib_L000695)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_debug ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc87_67da3ff4_luathread_openlualibs_L000012_714_L000715 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sjc84u_67da3ff4_luathread_reglualib_L000695)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_coroutine ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc830_67da3ff4_luathread_new_L000211_217_L000218 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sjc84u_67da3ff4_luathread_reglualib_L000695)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_utf8 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc87_67da3ff4_luathread_openlualibs_L000012_716_L000717 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sjc84u_67da3ff4_luathread_reglualib_L000695)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_propeller ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc830_67da3ff4_luathread_new_L000211_215_L000216 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sjc84u_67da3ff4_luathread_reglualib_L000695)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_sjc87_67da3ff4_luathread_openlualibs_L000012_701 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaopen_threads

 alignl ' align long
C_luaopen_threads ' <symbol:luaopen_threads>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (68)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_LODI + (@C_luaopen_threads_719_L000720)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checkversion_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (40)<<S32 ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc817_67da3ff4_luathread_funcs_L000044 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__setfuncs)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__pthread_init_lock_pool)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_sjc85_67da3ff4_mainlp_L000010)<<S32
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_sjc85_67da3ff4_mainlp_L000010+4)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_sjc85_67da3ff4_mainlp_L000010+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 alignl ' align long
 long I32_LODA + (@C_sjc85_67da3ff4_mainlp_L000010+12)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 alignl ' align long
 long I32_LODA + (@C_sjc85_67da3ff4_mainlp_L000010+16)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82_67da3ff4_recycle_list_L000007 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_list_init)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_luaL__newstate)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc82g_67da3ff4_channel_create_L000133_135_L000136 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_setglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaopen_base ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_sjc87_67da3ff4_luathread_openlualibs_L000012_702_L000703 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__requiref)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODI + (@C_sjc84_67da3ff4_chanls_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_newuserdatauv)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_threads_725_L000726 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_threads_727_L000728 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__newmetatable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_threads_729_L000730 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc834_67da3ff4_luathread_join_workers_L000219 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushcclosure)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_rawset)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_threads_725_L000726 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaopen_threads_727_L000728 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_setmetatable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C_sched_init)<<S32 ' CALL addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaopen_threads_731)<<S32 ' NEI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sjc8e_67da3ff4_threads_set_numworkers_L000019_276_L000277 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaopen_threads_731
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_luaopen_threads_718 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sjc816_67da3ff4_luathread_loadlib_L000043 ' <symbol:luathread_loadlib>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (68)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_LODI + (@C_luaopen_threads_719_L000720)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checkversion_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (40)<<S32 ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sjc817_67da3ff4_luathread_funcs_L000044 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__setfuncs)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sjc816_67da3ff4_luathread_loadlib_L000043_733 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _pthread_init_lock_pool

' Catalina Import sbrk

' Catalina Import _thread_stall

' Catalina Import luaopen_propeller

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sjc85_67da3ff4_mainlp_L000010 ' <symbol:mainlp>
 byte 0[20]

 alignl ' align long
C_sjc82_67da3ff4_recycle_list_L000007 ' <symbol:recycle_list>
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
C_sjc87_67da3ff4_luathread_openlualibs_L000012_716_L000717 ' <symbol:716>
 byte 117
 byte 116
 byte 102
 byte 56
 byte 0

 alignl ' align long
C_sjc87_67da3ff4_luathread_openlualibs_L000012_714_L000715 ' <symbol:714>
 byte 100
 byte 101
 byte 98
 byte 117
 byte 103
 byte 0

 alignl ' align long
C_sjc87_67da3ff4_luathread_openlualibs_L000012_712_L000713 ' <symbol:712>
 byte 109
 byte 97
 byte 116
 byte 104
 byte 0

 alignl ' align long
C_sjc87_67da3ff4_luathread_openlualibs_L000012_710_L000711 ' <symbol:710>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_sjc87_67da3ff4_luathread_openlualibs_L000012_708_L000709 ' <symbol:708>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_sjc87_67da3ff4_luathread_openlualibs_L000012_706_L000707 ' <symbol:706>
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_sjc87_67da3ff4_luathread_openlualibs_L000012_704_L000705 ' <symbol:704>
 byte 105
 byte 111
 byte 0

 alignl ' align long
C_sjc87_67da3ff4_luathread_openlualibs_L000012_702_L000703 ' <symbol:702>
 byte 95
 byte 71
 byte 0

 alignl ' align long
C_sjc84u_67da3ff4_luathread_reglualib_L000695_699_L000700 ' <symbol:699>
 byte 112
 byte 114
 byte 101
 byte 108
 byte 111
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_sjc84u_67da3ff4_luathread_reglualib_L000695_697_L000698 ' <symbol:697>
 byte 112
 byte 97
 byte 99
 byte 107
 byte 97
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_673_L000674 ' <symbol:673>
 byte 10
 byte 0

 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_671_L000672 ' <symbol:671>
 byte 37
 byte 115
 byte 58
 byte 37
 byte 88
 byte 0

 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_666_L000667 ' <symbol:666>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_664_L000665 ' <symbol:664>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_660_L000661 ' <symbol:660>
 byte 110
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_654_L000655 ' <symbol:654>
 byte 9
 byte 0

 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_646_L000647 ' <symbol:646>
 byte 37
 byte 115
 byte 58
 byte 37
 byte 108
 byte 88
 byte 10
 byte 0

 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_641_L000642 ' <symbol:641>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 10
 byte 0

 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_639_L000640 ' <symbol:639>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 10
 byte 0

 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_635_L000636 ' <symbol:635>
 byte 110
 byte 105
 byte 108
 byte 10
 byte 0

 alignl ' align long
C_sjc8j_67da3ff4_threads_print_L000024_631_L000632 ' <symbol:631>
 byte 37
 byte 115
 byte 10
 byte 0

 alignl ' align long
C_sjc8m_67da3ff4_threads_msleep_L000027_621_L000622 ' <symbol:621>
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
C_sjc8l_67da3ff4_threads_sleep_L000026_613_L000614 ' <symbol:613>
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
C_sjc814_67da3ff4_threads_version_L000041_608_L000609 ' <symbol:608>
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
C_sjc814_67da3ff4_threads_version_L000041_604_L000605 ' <symbol:604>
 byte 108
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_sjc815_67da3ff4_threads_factories_L000042_588_L000589 ' <symbol:588>
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
C_sjc812_67da3ff4_threads_stacksize_L000039_582_L000583 ' <symbol:582>
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
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_567_L000568 ' <symbol:567>
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
C_sjc8d_67da3ff4_threads_destroy_channel_L000018_558_L000559 ' <symbol:558>
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
C_sjc8c_67da3ff4_threads_create_channel_L000017_549_L000550 ' <symbol:549>
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
C_sjc8b_67da3ff4_threads_receive_L000016_530_L000531 ' <symbol:530>
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
C_sjc8b_67da3ff4_threads_receive_L000016_528_L000529 ' <symbol:528>
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
C_sjc8v_67da3ff4_threads_update_L000036_513_L000514 ' <symbol:513>
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
C_sjc8v_67da3ff4_threads_update_L000036_499_L000500 ' <symbol:499>
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
C_sjc8v_67da3ff4_threads_update_L000036_495_L000496 ' <symbol:495>
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
C_sjc8v_67da3ff4_threads_update_L000036_491_L000492 ' <symbol:491>
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
C_sjc810_67da3ff4_threads_export_L000037_486_L000487 ' <symbol:486>
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
C_sjc810_67da3ff4_threads_export_L000037_471_L000472 ' <symbol:471>
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
C_sjc810_67da3ff4_threads_export_L000037_456_L000457 ' <symbol:456>
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
C_sjc810_67da3ff4_threads_export_L000037_452_L000453 ' <symbol:452>
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
C_sjc8u_67da3ff4_threads_shared_L000035_447_L000448 ' <symbol:447>
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
C_sjc8u_67da3ff4_threads_shared_L000035_441_L000442 ' <symbol:441>
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
C_sjc8u_67da3ff4_threads_shared_L000035_431_L000432 ' <symbol:431>
 byte 46
 byte 0

 alignl ' align long
C_sjc8u_67da3ff4_threads_shared_L000035_422_L000423 ' <symbol:422>
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
C_sjc8u_67da3ff4_threads_shared_L000035_418_L000419 ' <symbol:418>
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
C_sjc8q_67da3ff4_threads_wait_for_L000031_348_L000349 ' <symbol:348>
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
C_sjc8h_67da3ff4_threads_send_async_L000022_324_L000325 ' <symbol:324>
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
C_sjc8a_67da3ff4_threads_send_L000015_301_L000302 ' <symbol:301>
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
C_sjc88_67da3ff4_threads_create_newproc_L000013_288_L000289 ' <symbol:288>
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
C_sjc88_67da3ff4_threads_create_newproc_L000013_284_L000285 ' <symbol:284>
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
C_sjc8e_67da3ff4_threads_set_numworkers_L000019_276_L000277 ' <symbol:276>
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
C_sjc8e_67da3ff4_threads_set_numworkers_L000019_271_L000272 ' <symbol:271>
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
C_sjc8g_67da3ff4_threads_recycle_set_L000021_259_L000260 ' <symbol:259>
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
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_256_L000257 ' <symbol:256>
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
C_sjc838_67da3ff4_luathread_copyupvalues_L000232_249_L000250 ' <symbol:249>
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
C_sjc836_67da3ff4_func_dump_L000225_229_L000230 ' <symbol:229>
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
C_sjc830_67da3ff4_luathread_new_L000211_217_L000218 ' <symbol:217>
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
C_sjc830_67da3ff4_luathread_new_L000211_215_L000216 ' <symbol:215>
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
C_sjc830_67da3ff4_luathread_new_L000211_213_L000214 ' <symbol:213>
 byte 116
 byte 104
 byte 114
 byte 101
 byte 97
 byte 100
 byte 115
 byte 0

 alignl ' align long
C_sjc82u_67da3ff4_luathread_getself_L000207_209_L000210 ' <symbol:209>
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
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_202_L000203 ' <symbol:202>
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
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_200_L000201 ' <symbol:200>
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
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_167_L000168 ' <symbol:167>
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
C_sjc82l_67da3ff4_luathread_copyvalues_L000161_165_L000166 ' <symbol:165>
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
C_sjc82g_67da3ff4_channel_create_L000133_135_L000136 ' <symbol:135>
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
C_sjc82f_67da3ff4_123_L000124 ' <symbol:123>
 byte 97
 byte 103
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_sjc82e_67da3ff4_121_L000122 ' <symbol:121>
 byte 97
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_sjc82d_67da3ff4_119_L000120 ' <symbol:119>
 byte 103
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_sjc82c_67da3ff4_117_L000118 ' <symbol:117>
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_sjc82b_67da3ff4_115_L000116 ' <symbol:115>
 byte 100
 byte 101
 byte 115
 byte 116
 byte 114
 byte 111
 byte 121
 byte 0

 alignl ' align long
C_sjc82a_67da3ff4_113_L000114 ' <symbol:113>
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
C_sjc829_67da3ff4_111_L000112 ' <symbol:111>
 byte 109
 byte 117
 byte 116
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_sjc828_67da3ff4_109_L000110 ' <symbol:109>
 byte 99
 byte 104
 byte 97
 byte 110
 byte 110
 byte 101
 byte 108
 byte 0

 alignl ' align long
C_sjc827_67da3ff4_107_L000108 ' <symbol:107>
 byte 119
 byte 111
 byte 114
 byte 107
 byte 101
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_sjc826_67da3ff4_105_L000106 ' <symbol:105>
 byte 110
 byte 101
 byte 119
 byte 0

 alignl ' align long
C_sjc825_67da3ff4_103_L000104 ' <symbol:103>
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_sjc824_67da3ff4_101_L000102 ' <symbol:101>
 byte 102
 byte 97
 byte 99
 byte 116
 byte 111
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sjc823_67da3ff4_99_L000100 ' <symbol:99>
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
C_sjc822_67da3ff4_97_L000098 ' <symbol:97>
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
C_sjc821_67da3ff4_95_L000096 ' <symbol:95>
 byte 115
 byte 98
 byte 114
 byte 107
 byte 0

 alignl ' align long
C_sjc820_67da3ff4_93_L000094 ' <symbol:93>
 byte 111
 byte 117
 byte 116
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_sjc81v_67da3ff4_91_L000092 ' <symbol:91>
 byte 112
 byte 114
 byte 105
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_sjc81u_67da3ff4_89_L000090 ' <symbol:89>
 byte 109
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_sjc81t_67da3ff4_87_L000088 ' <symbol:87>
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_sjc81s_67da3ff4_85_L000086 ' <symbol:85>
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
C_sjc81r_67da3ff4_83_L000084 ' <symbol:83>
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
C_sjc81q_67da3ff4_81_L000082 ' <symbol:81>
 byte 101
 byte 120
 byte 112
 byte 111
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_sjc81p_67da3ff4_79_L000080 ' <symbol:79>
 byte 117
 byte 112
 byte 100
 byte 97
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_sjc81o_67da3ff4_77_L000078 ' <symbol:77>
 byte 115
 byte 104
 byte 97
 byte 114
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_sjc81n_67da3ff4_75_L000076 ' <symbol:75>
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
C_sjc81m_67da3ff4_73_L000074 ' <symbol:73>
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
C_sjc81l_67da3ff4_71_L000072 ' <symbol:71>
 byte 115
 byte 105
 byte 103
 byte 110
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_sjc81k_67da3ff4_69_L000070 ' <symbol:69>
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
C_sjc81j_67da3ff4_67_L000068 ' <symbol:67>
 byte 117
 byte 110
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_sjc81i_67da3ff4_65_L000066 ' <symbol:65>
 byte 116
 byte 114
 byte 121
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_sjc81h_67da3ff4_63_L000064 ' <symbol:63>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_sjc81g_67da3ff4_61_L000062 ' <symbol:61>
 byte 114
 byte 101
 byte 99
 byte 121
 byte 99
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_sjc81f_67da3ff4_59_L000060 ' <symbol:59>
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
C_sjc81e_67da3ff4_57_L000058 ' <symbol:57>
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
C_sjc81d_67da3ff4_55_L000056 ' <symbol:55>
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
C_sjc81c_67da3ff4_53_L000054 ' <symbol:53>
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
C_sjc81b_67da3ff4_51_L000052 ' <symbol:51>
 byte 114
 byte 101
 byte 99
 byte 101
 byte 105
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_sjc81a_67da3ff4_49_L000050 ' <symbol:49>
 byte 115
 byte 101
 byte 110
 byte 100
 byte 0

 alignl ' align long
C_sjc819_67da3ff4_47_L000048 ' <symbol:47>
 byte 119
 byte 97
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_sjc818_67da3ff4_45_L000046 ' <symbol:45>
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
