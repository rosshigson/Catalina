' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sf98q_67e4d7df_luahmi_funcs_L000030 ' <symbol:luahmi_funcs>
 long @C_sf98r_67e4d7df_31_L000032
 long @C_sf98_67e4d7df_hmi_version_L000004
 long @C_sf98s_67e4d7df_33_L000034
 long @C_sf981_67e4d7df_hmi_k_get_L000005
 long @C_sf98t_67e4d7df_35_L000036
 long @C_sf982_67e4d7df_hmi_k_wait_L000006
 long @C_sf98u_67e4d7df_37_L000038
 long @C_sf983_67e4d7df_hmi_k_new_L000007
 long @C_sf98v_67e4d7df_39_L000040
 long @C_sf984_67e4d7df_hmi_k_ready_L000008
 long @C_sf9810_67e4d7df_41_L000042
 long @C_sf985_67e4d7df_hmi_k_clear_L000009
 long @C_sf9811_67e4d7df_43_L000044
 long @C_sf986_67e4d7df_hmi_m_button_L000010
 long @C_sf9812_67e4d7df_45_L000046
 long @C_sf987_67e4d7df_hmi_m_abs_x_L000011
 long @C_sf9813_67e4d7df_47_L000048
 long @C_sf988_67e4d7df_hmi_m_abs_y_L000012
 long @C_sf9814_67e4d7df_49_L000050
 long @C_sf989_67e4d7df_hmi_m_delta_x_L000013
 long @C_sf9815_67e4d7df_51_L000052
 long @C_sf98a_67e4d7df_hmi_m_delta_y_L000014
 long @C_sf9816_67e4d7df_53_L000054
 long @C_sf98b_67e4d7df_hmi_m_reset_L000015
 long @C_sf9817_67e4d7df_55_L000056
 long @C_sf98c_67e4d7df_hmi_m_bound_limits_L000016
 long @C_sf9818_67e4d7df_57_L000058
 long @C_sf98d_67e4d7df_hmi_m_bound_scales_L000017
 long @C_sf9819_67e4d7df_59_L000060
 long @C_sf98e_67e4d7df_hmi_m_bound_x_L000018
 long @C_sf981a_67e4d7df_61_L000062
 long @C_sf98f_67e4d7df_hmi_m_bound_y_L000019
 long @C_sf981b_67e4d7df_63_L000064
 long @C_sf98g_67e4d7df_hmi_t_geometry_L000020
 long @C_sf981c_67e4d7df_65_L000066
 long @C_sf98h_67e4d7df_hmi_t_char_L000021
 long @C_sf981d_67e4d7df_67_L000068
 long @C_sf98i_67e4d7df_hmi_t_mode_L000022
 long @C_sf981e_67e4d7df_69_L000070
 long @C_sf98j_67e4d7df_hmi_t_setpos_L000023
 long @C_sf981f_67e4d7df_71_L000072
 long @C_sf98k_67e4d7df_hmi_t_getpos_L000024
 long @C_sf981g_67e4d7df_73_L000074
 long @C_sf98l_67e4d7df_hmi_t_scroll_L000025
 long @C_sf981h_67e4d7df_75_L000076
 long @C_sf98m_67e4d7df_hmi_t_color_L000026
 long @C_sf981i_67e4d7df_77_L000078
 long @C_sf98n_67e4d7df_hmi_t_color_fg_L000027
 long @C_sf981j_67e4d7df_79_L000080
 long @C_sf98o_67e4d7df_hmi_t_color_bg_L000028
 long @C_sf981k_67e4d7df_81_L000082
 long @C_sf98p_67e4d7df_hmi_t_string_L000029
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sf98p_67e4d7df_hmi_t_string_L000029 ' <symbol:hmi_t_string>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf98p_67e4d7df_hmi_t_string_L000029_84 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_string
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sf98p_67e4d7df_hmi_t_string_L000029_83 ' JUMPV addrg
C_sf98p_67e4d7df_hmi_t_string_L000029_84
 mov r0, #0 ' reg <- coni
C_sf98p_67e4d7df_hmi_t_string_L000029_83
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98_67e4d7df_hmi_version_L000004 ' <symbol:hmi_version>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf98_67e4d7df_hmi_version_L000004_87 ' LEI4
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
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_sf98_67e4d7df_hmi_version_L000004_91_L000092
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sf98_67e4d7df_hmi_version_L000004_89 ' NEI4
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sf98_67e4d7df_hmi_version_L000004_88 ' JUMPV addrg
C_sf98_67e4d7df_hmi_version_L000004_89
 jmp #LODL
 long @C_sf98_67e4d7df_hmi_version_L000004_95_L000096
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sf98_67e4d7df_hmi_version_L000004_93 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sf98_67e4d7df_hmi_version_L000004_88 ' JUMPV addrg
C_sf98_67e4d7df_hmi_version_L000004_93
 jmp #LODL
 long 810
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sf98_67e4d7df_hmi_version_L000004_88 ' JUMPV addrg
C_sf98_67e4d7df_hmi_version_L000004_87
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
C_sf98_67e4d7df_hmi_version_L000004_88
 mov r0, #1 ' reg <- coni
' C_sf98_67e4d7df_hmi_version_L000004_86 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf981_67e4d7df_hmi_k_get_L000005 ' <symbol:hmi_k_get>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_k_get ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf981_67e4d7df_hmi_k_get_L000005_97 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf982_67e4d7df_hmi_k_wait_L000006 ' <symbol:hmi_k_wait>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_k_wait ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf982_67e4d7df_hmi_k_wait_L000006_98 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf983_67e4d7df_hmi_k_new_L000007 ' <symbol:hmi_k_new>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_k_new ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf983_67e4d7df_hmi_k_new_L000007_99 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf984_67e4d7df_hmi_k_ready_L000008 ' <symbol:hmi_k_ready>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_k_ready ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf984_67e4d7df_hmi_k_ready_L000008_100 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf985_67e4d7df_hmi_k_clear_L000009 ' <symbol:hmi_k_clear>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_k_clear ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf985_67e4d7df_hmi_k_clear_L000009_101 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf986_67e4d7df_hmi_m_button_L000010 ' <symbol:hmi_m_button>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf986_67e4d7df_hmi_m_button_L000010_103 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_m_button ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sf986_67e4d7df_hmi_m_button_L000010_102 ' JUMPV addrg
C_sf986_67e4d7df_hmi_m_button_L000010_103
 mov r0, #0 ' reg <- coni
C_sf986_67e4d7df_hmi_m_button_L000010_102
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf987_67e4d7df_hmi_m_abs_x_L000011 ' <symbol:hmi_m_abs_x>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_m_abs_x ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf987_67e4d7df_hmi_m_abs_x_L000011_105 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf988_67e4d7df_hmi_m_abs_y_L000012 ' <symbol:hmi_m_abs_y>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_m_abs_y ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf988_67e4d7df_hmi_m_abs_y_L000012_106 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf989_67e4d7df_hmi_m_delta_x_L000013 ' <symbol:hmi_m_delta_x>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_m_delta_x ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf989_67e4d7df_hmi_m_delta_x_L000013_107 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98a_67e4d7df_hmi_m_delta_y_L000014 ' <symbol:hmi_m_delta_y>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_m_delta_x ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf98a_67e4d7df_hmi_m_delta_y_L000014_108 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98b_67e4d7df_hmi_m_reset_L000015 ' <symbol:hmi_m_reset>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_m_reset ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf98b_67e4d7df_hmi_m_reset_L000015_109 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98c_67e4d7df_hmi_m_bound_limits_L000016 ' <symbol:hmi_m_bound_limits>
 jmp #NEWF
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf98c_67e4d7df_hmi_m_bound_limits_L000016_111 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r19
 jmp #PSHL ' stack ARG
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_m_bound_limits
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sf98c_67e4d7df_hmi_m_bound_limits_L000016_110 ' JUMPV addrg
C_sf98c_67e4d7df_hmi_m_bound_limits_L000016_111
 mov r0, #0 ' reg <- coni
C_sf98c_67e4d7df_hmi_m_bound_limits_L000016_110
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98d_67e4d7df_hmi_m_bound_scales_L000017 ' <symbol:hmi_m_bound_scales>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf98d_67e4d7df_hmi_m_bound_scales_L000017_114 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_m_bound_scales
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sf98d_67e4d7df_hmi_m_bound_scales_L000017_113 ' JUMPV addrg
C_sf98d_67e4d7df_hmi_m_bound_scales_L000017_114
 mov r0, #0 ' reg <- coni
C_sf98d_67e4d7df_hmi_m_bound_scales_L000017_113
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98e_67e4d7df_hmi_m_bound_x_L000018 ' <symbol:hmi_m_bound_x>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_m_bound_x ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf98e_67e4d7df_hmi_m_bound_x_L000018_116 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98f_67e4d7df_hmi_m_bound_y_L000019 ' <symbol:hmi_m_bound_y>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_m_bound_y ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf98f_67e4d7df_hmi_m_bound_y_L000019_117 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98g_67e4d7df_hmi_t_geometry_L000020 ' <symbol:hmi_t_geometry>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_t_geometry ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sf98g_67e4d7df_hmi_t_geometry_L000020_118 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98h_67e4d7df_hmi_t_char_L000021 ' <symbol:hmi_t_char>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf98h_67e4d7df_hmi_t_char_L000021_120 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_char
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sf98h_67e4d7df_hmi_t_char_L000021_119 ' JUMPV addrg
C_sf98h_67e4d7df_hmi_t_char_L000021_120
 mov r0, #0 ' reg <- coni
C_sf98h_67e4d7df_hmi_t_char_L000021_119
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98i_67e4d7df_hmi_t_mode_L000022 ' <symbol:hmi_t_mode>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf98i_67e4d7df_hmi_t_mode_L000022_123 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_mode
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sf98i_67e4d7df_hmi_t_mode_L000022_122 ' JUMPV addrg
C_sf98i_67e4d7df_hmi_t_mode_L000022_123
 mov r0, #0 ' reg <- coni
C_sf98i_67e4d7df_hmi_t_mode_L000022_122
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98j_67e4d7df_hmi_t_setpos_L000023 ' <symbol:hmi_t_setpos>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf98j_67e4d7df_hmi_t_setpos_L000023_126 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_setpos
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sf98j_67e4d7df_hmi_t_setpos_L000023_125 ' JUMPV addrg
C_sf98j_67e4d7df_hmi_t_setpos_L000023_126
 mov r0, #0 ' reg <- coni
C_sf98j_67e4d7df_hmi_t_setpos_L000023_125
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98k_67e4d7df_hmi_t_getpos_L000024 ' <symbol:hmi_t_getpos>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf98k_67e4d7df_hmi_t_getpos_L000024_129 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_t_getpos ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sf98k_67e4d7df_hmi_t_getpos_L000024_128 ' JUMPV addrg
C_sf98k_67e4d7df_hmi_t_getpos_L000024_129
 mov r0, #0 ' reg <- coni
C_sf98k_67e4d7df_hmi_t_getpos_L000024_128
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98l_67e4d7df_hmi_t_scroll_L000025 ' <symbol:hmi_t_scroll>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf98l_67e4d7df_hmi_t_scroll_L000025_132 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_scroll
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sf98l_67e4d7df_hmi_t_scroll_L000025_131 ' JUMPV addrg
C_sf98l_67e4d7df_hmi_t_scroll_L000025_132
 mov r0, #0 ' reg <- coni
C_sf98l_67e4d7df_hmi_t_scroll_L000025_131
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98m_67e4d7df_hmi_t_color_L000026 ' <symbol:hmi_t_color>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf98m_67e4d7df_hmi_t_color_L000026_135 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_color
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sf98m_67e4d7df_hmi_t_color_L000026_134 ' JUMPV addrg
C_sf98m_67e4d7df_hmi_t_color_L000026_135
 mov r0, #0 ' reg <- coni
C_sf98m_67e4d7df_hmi_t_color_L000026_134
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98n_67e4d7df_hmi_t_color_fg_L000027 ' <symbol:hmi_t_color_fg>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf98n_67e4d7df_hmi_t_color_fg_L000027_138 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_color_fg
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sf98n_67e4d7df_hmi_t_color_fg_L000027_137 ' JUMPV addrg
C_sf98n_67e4d7df_hmi_t_color_fg_L000027_138
 mov r0, #0 ' reg <- coni
C_sf98n_67e4d7df_hmi_t_color_fg_L000027_137
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf98o_67e4d7df_hmi_t_color_bg_L000028 ' <symbol:hmi_t_color_bg>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sf98o_67e4d7df_hmi_t_color_bg_L000028_141 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_color_bg
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sf98o_67e4d7df_hmi_t_color_bg_L000028_140 ' JUMPV addrg
C_sf98o_67e4d7df_hmi_t_color_bg_L000028_141
 mov r0, #0 ' reg <- coni
C_sf98o_67e4d7df_hmi_t_color_bg_L000028_140
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaopen_hmi

 alignl ' align long
C_luaopen_hmi ' <symbol:luaopen_hmi>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 jmp #LODI
 long @C_luaopen_hmi_144_L000145
 mov r3, RI ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #26 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_sf98q_67e4d7df_luahmi_funcs_L000030
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_luaopen_hmi_143 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import t_color_bg

' Catalina Import t_color_fg

' Catalina Import t_color

' Catalina Import t_scroll

' Catalina Import t_getpos

' Catalina Import t_setpos

' Catalina Import t_mode

' Catalina Import t_char

' Catalina Import t_geometry

' Catalina Import m_bound_y

' Catalina Import m_bound_x

' Catalina Import m_bound_scales

' Catalina Import m_bound_limits

' Catalina Import m_reset

' Catalina Import m_delta_x

' Catalina Import m_abs_y

' Catalina Import m_abs_x

' Catalina Import m_button

' Catalina Import k_clear

' Catalina Import k_ready

' Catalina Import k_new

' Catalina Import k_wait

' Catalina Import k_get

' Catalina Import t_string

' Catalina Import strcmp

' Catalina Import luaL_setfuncs

' Catalina Import luaL_checkinteger

' Catalina Import luaL_checklstring

' Catalina Import luaL_checkversion_

' Catalina Import lua_createtable

' Catalina Import lua_pushinteger

' Catalina Import lua_settop

' Catalina Import lua_gettop

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_hmi_144_L000145 ' <symbol:144>
 long $43fc0000 ' float

 alignl ' align long
C_sf98_67e4d7df_hmi_version_L000004_95_L000096 ' <symbol:95>
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
C_sf98_67e4d7df_hmi_version_L000004_91_L000092 ' <symbol:91>
 byte 108
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_sf981k_67e4d7df_81_L000082 ' <symbol:81>
 byte 116
 byte 95
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_sf981j_67e4d7df_79_L000080 ' <symbol:79>
 byte 116
 byte 95
 byte 99
 byte 111
 byte 108
 byte 111
 byte 114
 byte 95
 byte 98
 byte 103
 byte 0

 alignl ' align long
C_sf981i_67e4d7df_77_L000078 ' <symbol:77>
 byte 116
 byte 95
 byte 99
 byte 111
 byte 108
 byte 111
 byte 114
 byte 95
 byte 102
 byte 103
 byte 0

 alignl ' align long
C_sf981h_67e4d7df_75_L000076 ' <symbol:75>
 byte 116
 byte 95
 byte 99
 byte 111
 byte 108
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_sf981g_67e4d7df_73_L000074 ' <symbol:73>
 byte 116
 byte 95
 byte 115
 byte 99
 byte 114
 byte 111
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_sf981f_67e4d7df_71_L000072 ' <symbol:71>
 byte 116
 byte 95
 byte 103
 byte 101
 byte 116
 byte 112
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_sf981e_67e4d7df_69_L000070 ' <symbol:69>
 byte 116
 byte 95
 byte 115
 byte 101
 byte 116
 byte 112
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_sf981d_67e4d7df_67_L000068 ' <symbol:67>
 byte 116
 byte 95
 byte 109
 byte 111
 byte 100
 byte 101
 byte 0

 alignl ' align long
C_sf981c_67e4d7df_65_L000066 ' <symbol:65>
 byte 116
 byte 95
 byte 99
 byte 104
 byte 97
 byte 114
 byte 0

 alignl ' align long
C_sf981b_67e4d7df_63_L000064 ' <symbol:63>
 byte 116
 byte 95
 byte 103
 byte 101
 byte 111
 byte 109
 byte 101
 byte 116
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sf981a_67e4d7df_61_L000062 ' <symbol:61>
 byte 109
 byte 95
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 95
 byte 121
 byte 0

 alignl ' align long
C_sf9819_67e4d7df_59_L000060 ' <symbol:59>
 byte 109
 byte 95
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 95
 byte 120
 byte 0

 alignl ' align long
C_sf9818_67e4d7df_57_L000058 ' <symbol:57>
 byte 109
 byte 95
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 95
 byte 115
 byte 99
 byte 97
 byte 108
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_sf9817_67e4d7df_55_L000056 ' <symbol:55>
 byte 109
 byte 95
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 95
 byte 108
 byte 105
 byte 109
 byte 105
 byte 116
 byte 115
 byte 0

 alignl ' align long
C_sf9816_67e4d7df_53_L000054 ' <symbol:53>
 byte 109
 byte 95
 byte 114
 byte 101
 byte 115
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_sf9815_67e4d7df_51_L000052 ' <symbol:51>
 byte 109
 byte 95
 byte 100
 byte 101
 byte 108
 byte 116
 byte 97
 byte 95
 byte 121
 byte 0

 alignl ' align long
C_sf9814_67e4d7df_49_L000050 ' <symbol:49>
 byte 109
 byte 95
 byte 100
 byte 101
 byte 108
 byte 116
 byte 97
 byte 95
 byte 120
 byte 0

 alignl ' align long
C_sf9813_67e4d7df_47_L000048 ' <symbol:47>
 byte 109
 byte 95
 byte 97
 byte 98
 byte 115
 byte 95
 byte 121
 byte 0

 alignl ' align long
C_sf9812_67e4d7df_45_L000046 ' <symbol:45>
 byte 109
 byte 95
 byte 97
 byte 98
 byte 115
 byte 95
 byte 120
 byte 0

 alignl ' align long
C_sf9811_67e4d7df_43_L000044 ' <symbol:43>
 byte 109
 byte 95
 byte 98
 byte 117
 byte 116
 byte 116
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_sf9810_67e4d7df_41_L000042 ' <symbol:41>
 byte 107
 byte 95
 byte 99
 byte 108
 byte 101
 byte 97
 byte 114
 byte 0

 alignl ' align long
C_sf98v_67e4d7df_39_L000040 ' <symbol:39>
 byte 107
 byte 95
 byte 114
 byte 101
 byte 97
 byte 100
 byte 121
 byte 0

 alignl ' align long
C_sf98u_67e4d7df_37_L000038 ' <symbol:37>
 byte 107
 byte 95
 byte 110
 byte 101
 byte 119
 byte 0

 alignl ' align long
C_sf98t_67e4d7df_35_L000036 ' <symbol:35>
 byte 107
 byte 95
 byte 119
 byte 97
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_sf98s_67e4d7df_33_L000034 ' <symbol:33>
 byte 107
 byte 95
 byte 103
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_sf98r_67e4d7df_31_L000032 ' <symbol:31>
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 0

' Catalina Code

DAT ' code segment
' end
