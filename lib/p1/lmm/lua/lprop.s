' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sg4o14_6695052c_luapropeller_funcs_L000039 ' <symbol:luapropeller_funcs>
 long @C_sg4o15_6695052c_40_L000041
 long @C_sg4o_6695052c_propeller_setenv_L000003
 long @C_sg4o16_6695052c_42_L000043
 long @C_sg4o1_6695052c_propeller_unsetenv_L000004
 long @C_sg4o17_6695052c_44_L000045
 long @C_sg4o2_6695052c_propeller_getpin_L000005
 long @C_sg4o18_6695052c_46_L000047
 long @C_sg4o3_6695052c_propeller_setpin_L000006
 long @C_sg4o19_6695052c_48_L000049
 long @C_sg4o4_6695052c_propeller_togglepin_L000007
 long @C_sg4o1a_6695052c_50_L000051
 long @C_sg4o5_6695052c_propeller_sleep_L000008
 long @C_sg4o1b_6695052c_52_L000053
 long @C_sg4o6_6695052c_propeller_msleep_L000009
 long @C_sg4o1c_6695052c_54_L000055
 long @C_sg4o7_6695052c_propeller_sbrk_L000010
 long @C_sg4o1d_6695052c_56_L000057
 long @C_sg4o8_6695052c_propeller_version_L000011
 long @C_sg4o1e_6695052c_58_L000059
 long @C_sg4o9_6695052c_propeller_mount_L000012
 long @C_sg4o1f_6695052c_60_L000061
 long @C_sg4oa_6695052c_propeller_scan_L000013
 long @C_sg4o1g_6695052c_62_L000063
 long @C_sg4ob_6695052c_propeller_execute_L000014
 long @C_sg4o1h_6695052c_64_L000065
 long @C_sg4oc_6695052c_propeller_k_get_L000015
 long @C_sg4o1i_6695052c_66_L000067
 long @C_sg4od_6695052c_propeller_k_wait_L000016
 long @C_sg4o1j_6695052c_68_L000069
 long @C_sg4oe_6695052c_propeller_k_new_L000017
 long @C_sg4o1k_6695052c_70_L000071
 long @C_sg4of_6695052c_propeller_k_ready_L000018
 long @C_sg4o1l_6695052c_72_L000073
 long @C_sg4og_6695052c_propeller_k_clear_L000019
 long @C_sg4o1m_6695052c_74_L000075
 long @C_sg4oh_6695052c_propeller_m_button_L000020
 long @C_sg4o1n_6695052c_76_L000077
 long @C_sg4oi_6695052c_propeller_m_abs_x_L000021
 long @C_sg4o1o_6695052c_78_L000079
 long @C_sg4oj_6695052c_propeller_m_abs_y_L000022
 long @C_sg4o1p_6695052c_80_L000081
 long @C_sg4ok_6695052c_propeller_m_delta_x_L000023
 long @C_sg4o1q_6695052c_82_L000083
 long @C_sg4ol_6695052c_propeller_m_delta_y_L000024
 long @C_sg4o1r_6695052c_84_L000085
 long @C_sg4om_6695052c_propeller_m_reset_L000025
 long @C_sg4o1s_6695052c_86_L000087
 long @C_sg4on_6695052c_propeller_m_bound_limits_L000026
 long @C_sg4o1t_6695052c_88_L000089
 long @C_sg4oo_6695052c_propeller_m_bound_scales_L000027
 long @C_sg4o1u_6695052c_90_L000091
 long @C_sg4op_6695052c_propeller_m_bound_x_L000028
 long @C_sg4o1v_6695052c_92_L000093
 long @C_sg4oq_6695052c_propeller_m_bound_y_L000029
 long @C_sg4o20_6695052c_94_L000095
 long @C_sg4or_6695052c_propeller_t_geometry_L000030
 long @C_sg4o21_6695052c_96_L000097
 long @C_sg4os_6695052c_propeller_t_char_L000031
 long @C_sg4o22_6695052c_98_L000099
 long @C_sg4ot_6695052c_propeller_t_mode_L000032
 long @C_sg4o23_6695052c_100_L000101
 long @C_sg4ou_6695052c_propeller_t_setpos_L000033
 long @C_sg4o24_6695052c_102_L000103
 long @C_sg4ov_6695052c_propeller_t_getpos_L000034
 long @C_sg4o25_6695052c_104_L000105
 long @C_sg4o10_6695052c_propeller_t_scroll_L000035
 long @C_sg4o26_6695052c_106_L000107
 long @C_sg4o11_6695052c_propeller_t_color_L000036
 long @C_sg4o27_6695052c_108_L000109
 long @C_sg4o12_6695052c_propeller_t_color_fg_L000037
 long @C_sg4o28_6695052c_110_L000111
 long @C_sg4o13_6695052c_propeller_t_color_bg_L000038
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sg4o_6695052c_propeller_setenv_L000003 ' <symbol:propeller_setenv>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $c00000 ' save registers
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
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
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
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_setenv
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sg4o_6695052c_propeller_setenv_L000003_112 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sg4o1_6695052c_propeller_unsetenv_L000004 ' <symbol:propeller_unsetenv>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
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
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_unsetenv ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sg4o1_6695052c_propeller_unsetenv_L000004_113 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg4o2_6695052c_propeller_getpin_L000005 ' <symbol:propeller_getpin>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz,wc
 jmp #BR_B
 long @C_sg4o2_6695052c_propeller_getpin_L000005_118 ' LTI4
 cmps r21,  #31 wz,wc
 jmp #BRBE
 long @C_sg4o2_6695052c_propeller_getpin_L000005_117 ' LEI4
C_sg4o2_6695052c_propeller_getpin_L000005_118
 jmp #LODL
 long @C_sg4o2_6695052c_propeller_getpin_L000005_115_L000116
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sg4o2_6695052c_propeller_getpin_L000005_117
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
 long @C_getpin ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sg4o2_6695052c_propeller_getpin_L000005_114 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4o3_6695052c_propeller_setpin_L000006 ' <symbol:propeller_setpin>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
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
 cmps r21,  #0 wz,wc
 jmp #BR_B
 long @C_sg4o3_6695052c_propeller_setpin_L000006_121 ' LTI4
 cmps r21,  #31 wz,wc
 jmp #BRBE
 long @C_sg4o3_6695052c_propeller_setpin_L000006_120 ' LEI4
C_sg4o3_6695052c_propeller_setpin_L000006_121
 jmp #LODL
 long @C_sg4o2_6695052c_propeller_getpin_L000005_115_L000116
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sg4o3_6695052c_propeller_setpin_L000006_120
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sg4o3_6695052c_propeller_setpin_L000006_124 ' EQI4
 cmps r19,  #1 wz
 jmp #BR_Z
 long @C_sg4o3_6695052c_propeller_setpin_L000006_124 ' EQI4
 jmp #LODL
 long @C_sg4o3_6695052c_propeller_setpin_L000006_122_L000123
 mov r2, RI ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sg4o3_6695052c_propeller_setpin_L000006_124
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
 long @C_setpin
 add SP, #4 ' CALL addrg
 mov r0, #0 ' RET coni
' C_sg4o3_6695052c_propeller_setpin_L000006_119 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4o4_6695052c_propeller_togglepin_L000007 ' <symbol:propeller_togglepin>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz,wc
 jmp #BR_B
 long @C_sg4o4_6695052c_propeller_togglepin_L000007_127 ' LTI4
 cmps r21,  #31 wz,wc
 jmp #BRBE
 long @C_sg4o4_6695052c_propeller_togglepin_L000007_126 ' LEI4
C_sg4o4_6695052c_propeller_togglepin_L000007_127
 jmp #LODL
 long @C_sg4o2_6695052c_propeller_getpin_L000005_115_L000116
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sg4o4_6695052c_propeller_togglepin_L000007_126
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
 long @C_togglepin ' CALL addrg
 mov r0, #0 ' RET coni
' C_sg4o4_6695052c_propeller_togglepin_L000007_125 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4o5_6695052c_propeller_sleep_L000008 ' <symbol:propeller_sleep>
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
 long @C_sg4o5_6695052c_propeller_sleep_L000008_129 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz,wc
 jmp #BRAE
 long @C_sg4o5_6695052c_propeller_sleep_L000008_133 ' GEI4
 jmp #LODL
 long @C_sg4o5_6695052c_propeller_sleep_L000008_131_L000132
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sg4o5_6695052c_propeller_sleep_L000008_133
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_sg4o5_6695052c_propeller_sleep_L000008_134 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitsec ' CALL addrg
C_sg4o5_6695052c_propeller_sleep_L000008_134
C_sg4o5_6695052c_propeller_sleep_L000008_129
 mov r0, #0 ' RET coni
' C_sg4o5_6695052c_propeller_sleep_L000008_128 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4o6_6695052c_propeller_msleep_L000009 ' <symbol:propeller_msleep>
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
 long @C_sg4o6_6695052c_propeller_msleep_L000009_137 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz,wc
 jmp #BRAE
 long @C_sg4o6_6695052c_propeller_msleep_L000009_141 ' GEI4
 jmp #LODL
 long @C_sg4o6_6695052c_propeller_msleep_L000009_139_L000140
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sg4o6_6695052c_propeller_msleep_L000009_141
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_sg4o6_6695052c_propeller_msleep_L000009_142 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_sg4o6_6695052c_propeller_msleep_L000009_142
C_sg4o6_6695052c_propeller_msleep_L000009_137
 mov r0, #0 ' RET coni
' C_sg4o6_6695052c_propeller_msleep_L000009_136 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4o7_6695052c_propeller_sbrk_L000010 ' <symbol:propeller_sbrk>
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
 long @C_sg4o7_6695052c_propeller_sbrk_L000010_145 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sg4o7_6695052c_propeller_sbrk_L000010_147 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_malloc_defragment ' CALL addrg
C_sg4o7_6695052c_propeller_sbrk_L000010_147
C_sg4o7_6695052c_propeller_sbrk_L000010_145
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sbrk ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sg4o7_6695052c_propeller_sbrk_L000010_144 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4o8_6695052c_propeller_version_L000011 ' <symbol:propeller_version>
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
 long @C_sg4o8_6695052c_propeller_version_L000011_150 ' LEI4
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
 long @C_sg4o8_6695052c_propeller_version_L000011_154_L000155
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sg4o8_6695052c_propeller_version_L000011_152 ' NEI4
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg4o8_6695052c_propeller_version_L000011_151 ' JUMPV addrg
C_sg4o8_6695052c_propeller_version_L000011_152
 jmp #LODL
 long @C_sg4o8_6695052c_propeller_version_L000011_158_L000159
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sg4o8_6695052c_propeller_version_L000011_156 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg4o8_6695052c_propeller_version_L000011_151 ' JUMPV addrg
C_sg4o8_6695052c_propeller_version_L000011_156
 jmp #LODL
 long 640
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg4o8_6695052c_propeller_version_L000011_151 ' JUMPV addrg
C_sg4o8_6695052c_propeller_version_L000011_150
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
C_sg4o8_6695052c_propeller_version_L000011_151
 mov r0, #1 ' RET coni
' C_sg4o8_6695052c_propeller_version_L000011_149 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4o9_6695052c_propeller_mount_L000012 ' <symbol:propeller_mount>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_mountF_atV_olume ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sg4o9_6695052c_propeller_mount_L000012_160 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sg4o2f_6695052c_nulldir_L000161 ' <symbol:nulldir>
 byte 47
 byte 0

 alignl ' align long
C_sg4o2g_6695052c_nullpattern_L000162 ' <symbol:nullpattern>
 byte 42
 byte 0

 alignl ' align long
C_sg4o2h_6695052c_match_function_L000163 ' <symbol:match_function>
 long -2

 alignl ' align long
C_sg4o2i_6695052c_match_state_L000164 ' <symbol:match_state>
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sg4o2j_6695052c_match_callback_L000165 ' <symbol:match_callback>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sg4o2h_6695052c_match_function_L000163
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sg4o2j_6695052c_match_callback_L000165_167 ' EQI4
 jmp #LODI
 long @C_sg4o2i_6695052c_match_state_L000164
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sg4o2j_6695052c_match_callback_L000165_167 ' EQU4
 jmp #LODI
 long @C_sg4o2h_6695052c_match_function_L000163
 mov r2, RI ' reg ARG INDIR ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_sg4o2i_6695052c_match_state_L000164
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sg4o2i_6695052c_match_state_L000164
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sg4o2i_6695052c_match_state_L000164
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sg4o2i_6695052c_match_state_L000164
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, #3 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHA
 long @C_sg4o2i_6695052c_match_state_L000164 ' stack ARG INDIR ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_sg4o2j_6695052c_match_callback_L000165_168 ' JUMPV addrg
C_sg4o2j_6695052c_match_callback_L000165_167
 jmp #LODL
 long @C_sg4o2j_6695052c_match_callback_L000165_169_L000170
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_printf ' CALL addrg
C_sg4o2j_6695052c_match_callback_L000165_168
' C_sg4o2j_6695052c_match_callback_L000165_166 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4oa_6695052c_propeller_scan_L000013 ' <symbol:propeller_scan>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #1 wz,wc
 jmp #BR_B
 long @C_sg4oa_6695052c_propeller_scan_L000013_172 ' LTI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_sg4oa_6695052c_propeller_scan_L000013_176 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_iscfunction
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sg4oa_6695052c_propeller_scan_L000013_174 ' EQI4
C_sg4oa_6695052c_propeller_scan_L000013_176
 jmp #LODL
 long @C_sg4oa_6695052c_propeller_scan_L000013_177_L000178
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sg4oa_6695052c_propeller_scan_L000013_174
C_sg4oa_6695052c_propeller_scan_L000013_172
 cmps r21,  #2 wz,wc
 jmp #BR_B
 long @C_sg4oa_6695052c_propeller_scan_L000013_179 ' LTI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sg4oa_6695052c_propeller_scan_L000013_181 ' NEU4
 jmp #LODL
 long @C_sg4o2f_6695052c_nulldir_L000161
 mov r19, RI ' reg <- addrg
C_sg4oa_6695052c_propeller_scan_L000013_181
C_sg4oa_6695052c_propeller_scan_L000013_179
 cmps r21,  #3 wz,wc
 jmp #BR_B
 long @C_sg4oa_6695052c_propeller_scan_L000013_183 ' LTI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sg4oa_6695052c_propeller_scan_L000013_185 ' NEU4
 jmp #LODL
 long @C_sg4o2g_6695052c_nullpattern_L000162
 mov r17, RI ' reg <- addrg
C_sg4oa_6695052c_propeller_scan_L000013_185
C_sg4oa_6695052c_propeller_scan_L000013_183
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_sg4oa_6695052c_propeller_scan_L000013_187 ' LEI4
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 neg r22, r22 ' NEGI4
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1001000
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__ref
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_sg4o2h_6695052c_match_function_L000163
 wrlong r0, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_sg4o2i_6695052c_match_state_L000164
 wrlong r23, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_sg4o2j_6695052c_match_callback_L000165
 mov r2, RI ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_doD_ir
 add SP, #8 ' CALL addrg
 jmp #LODI
 long @C_sg4o2h_6695052c_match_function_L000163
 mov r2, RI ' reg ARG INDIR ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__unref
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_sg4o2h_6695052c_match_function_L000163
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_sg4o2i_6695052c_match_state_L000164
 wrlong r22, RI ' ASGNP4 addrg reg
C_sg4oa_6695052c_propeller_scan_L000013_187
 mov r0, #0 ' RET coni
' C_sg4oa_6695052c_propeller_scan_L000013_171 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4ob_6695052c_propeller_execute_L000014 ' <symbol:propeller_execute>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r19, RI ' reg <- con
 jmp #LODL
 long 0
 mov r17, RI ' reg <- con
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
 mov r13, #0 ' reg <- coni
 cmps r21,  #1 wz,wc
 jmp #BRAE
 long @C_sg4ob_6695052c_propeller_execute_L000014_190 ' GEI4
 jmp #LODL
 long -4
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sg4ob_6695052c_propeller_execute_L000014_189 ' JUMPV addrg
C_sg4ob_6695052c_propeller_execute_L000014_190
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r21,  #2 wz,wc
 jmp #BR_B
 long @C_sg4ob_6695052c_propeller_execute_L000014_192 ' LTI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_sg4ob_6695052c_propeller_execute_L000014_192
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sg4ob_6695052c_propeller_execute_L000014_194 ' NEU4
 jmp #LODL
 long -3
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sg4ob_6695052c_propeller_execute_L000014_189 ' JUMPV addrg
C_sg4ob_6695052c_propeller_execute_L000014_194
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sg4ob_6695052c_propeller_execute_L000014_196 ' NEU4
 jmp #LODL
 long @C_sg4ob_6695052c_propeller_execute_L000014_198_L000199
 mov r17, RI ' reg <- addrg
C_sg4ob_6695052c_propeller_execute_L000014_196
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_remove ' CALL addrg
 jmp #LODL
 long @C_sg4ob_6695052c_propeller_execute_L000014_200_L000201
 mov r2, RI ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sg4ob_6695052c_propeller_execute_L000014_202 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov r5, r19 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_fwrite
 add SP, #12 ' CALL addrg
 mov r20, r13 ' CVI, CVU or LOAD
 cmp r0, r20 wz
 jmp #BRNZ
 long @C_sg4ob_6695052c_propeller_execute_L000014_204 ' NEU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fclose ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_exit ' CALL addrg
 jmp #LODL
 long -4
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sg4ob_6695052c_propeller_execute_L000014_189 ' JUMPV addrg
C_sg4ob_6695052c_propeller_execute_L000014_204
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fclose ' CALL addrg
 jmp #LODL
 long -2
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sg4ob_6695052c_propeller_execute_L000014_189 ' JUMPV addrg
C_sg4ob_6695052c_propeller_execute_L000014_202
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
C_sg4ob_6695052c_propeller_execute_L000014_189
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4oc_6695052c_propeller_k_get_L000015 ' <symbol:propeller_k_get>
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
 mov r0, #1 ' RET coni
' C_sg4oc_6695052c_propeller_k_get_L000015_206 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4od_6695052c_propeller_k_wait_L000016 ' <symbol:propeller_k_wait>
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
 mov r0, #1 ' RET coni
' C_sg4od_6695052c_propeller_k_wait_L000016_207 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4oe_6695052c_propeller_k_new_L000017 ' <symbol:propeller_k_new>
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
 mov r0, #1 ' RET coni
' C_sg4oe_6695052c_propeller_k_new_L000017_208 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4of_6695052c_propeller_k_ready_L000018 ' <symbol:propeller_k_ready>
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
 mov r0, #1 ' RET coni
' C_sg4of_6695052c_propeller_k_ready_L000018_209 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4og_6695052c_propeller_k_clear_L000019 ' <symbol:propeller_k_clear>
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
 mov r0, #1 ' RET coni
' C_sg4og_6695052c_propeller_k_clear_L000019_210 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4oh_6695052c_propeller_m_button_L000020 ' <symbol:propeller_m_button>
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
 long @C_sg4oh_6695052c_propeller_m_button_L000020_212 ' LEI4
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg4oh_6695052c_propeller_m_button_L000020_211 ' JUMPV addrg
C_sg4oh_6695052c_propeller_m_button_L000020_212
 mov r0, #0 ' RET coni
C_sg4oh_6695052c_propeller_m_button_L000020_211
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4oi_6695052c_propeller_m_abs_x_L000021 ' <symbol:propeller_m_abs_x>
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
 mov r0, #1 ' RET coni
' C_sg4oi_6695052c_propeller_m_abs_x_L000021_214 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4oj_6695052c_propeller_m_abs_y_L000022 ' <symbol:propeller_m_abs_y>
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
 mov r0, #1 ' RET coni
' C_sg4oj_6695052c_propeller_m_abs_y_L000022_215 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4ok_6695052c_propeller_m_delta_x_L000023 ' <symbol:propeller_m_delta_x>
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
 mov r0, #1 ' RET coni
' C_sg4ok_6695052c_propeller_m_delta_x_L000023_216 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4ol_6695052c_propeller_m_delta_y_L000024 ' <symbol:propeller_m_delta_y>
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
 mov r0, #1 ' RET coni
' C_sg4ol_6695052c_propeller_m_delta_y_L000024_217 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4om_6695052c_propeller_m_reset_L000025 ' <symbol:propeller_m_reset>
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
 mov r0, #1 ' RET coni
' C_sg4om_6695052c_propeller_m_reset_L000025_218 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4on_6695052c_propeller_m_bound_limits_L000026 ' <symbol:propeller_m_bound_limits>
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
 long @C_sg4on_6695052c_propeller_m_bound_limits_L000026_220 ' LEI4
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg4on_6695052c_propeller_m_bound_limits_L000026_219 ' JUMPV addrg
C_sg4on_6695052c_propeller_m_bound_limits_L000026_220
 mov r0, #0 ' RET coni
C_sg4on_6695052c_propeller_m_bound_limits_L000026_219
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4oo_6695052c_propeller_m_bound_scales_L000027 ' <symbol:propeller_m_bound_scales>
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
 long @C_sg4oo_6695052c_propeller_m_bound_scales_L000027_223 ' LEI4
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg4oo_6695052c_propeller_m_bound_scales_L000027_222 ' JUMPV addrg
C_sg4oo_6695052c_propeller_m_bound_scales_L000027_223
 mov r0, #0 ' RET coni
C_sg4oo_6695052c_propeller_m_bound_scales_L000027_222
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4op_6695052c_propeller_m_bound_x_L000028 ' <symbol:propeller_m_bound_x>
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
 mov r0, #1 ' RET coni
' C_sg4op_6695052c_propeller_m_bound_x_L000028_225 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4oq_6695052c_propeller_m_bound_y_L000029 ' <symbol:propeller_m_bound_y>
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
 mov r0, #1 ' RET coni
' C_sg4oq_6695052c_propeller_m_bound_y_L000029_226 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4or_6695052c_propeller_t_geometry_L000030 ' <symbol:propeller_t_geometry>
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
 mov r0, #1 ' RET coni
' C_sg4or_6695052c_propeller_t_geometry_L000030_227 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4os_6695052c_propeller_t_char_L000031 ' <symbol:propeller_t_char>
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
 long @C_sg4os_6695052c_propeller_t_char_L000031_229 ' LEI4
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg4os_6695052c_propeller_t_char_L000031_228 ' JUMPV addrg
C_sg4os_6695052c_propeller_t_char_L000031_229
 mov r0, #0 ' RET coni
C_sg4os_6695052c_propeller_t_char_L000031_228
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4ot_6695052c_propeller_t_mode_L000032 ' <symbol:propeller_t_mode>
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
 long @C_sg4ot_6695052c_propeller_t_mode_L000032_232 ' LEI4
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg4ot_6695052c_propeller_t_mode_L000032_231 ' JUMPV addrg
C_sg4ot_6695052c_propeller_t_mode_L000032_232
 mov r0, #0 ' RET coni
C_sg4ot_6695052c_propeller_t_mode_L000032_231
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4ou_6695052c_propeller_t_setpos_L000033 ' <symbol:propeller_t_setpos>
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
 long @C_sg4ou_6695052c_propeller_t_setpos_L000033_235 ' LEI4
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg4ou_6695052c_propeller_t_setpos_L000033_234 ' JUMPV addrg
C_sg4ou_6695052c_propeller_t_setpos_L000033_235
 mov r0, #0 ' RET coni
C_sg4ou_6695052c_propeller_t_setpos_L000033_234
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4ov_6695052c_propeller_t_getpos_L000034 ' <symbol:propeller_t_getpos>
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
 long @C_sg4ov_6695052c_propeller_t_getpos_L000034_238 ' LEI4
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg4ov_6695052c_propeller_t_getpos_L000034_237 ' JUMPV addrg
C_sg4ov_6695052c_propeller_t_getpos_L000034_238
 mov r0, #0 ' RET coni
C_sg4ov_6695052c_propeller_t_getpos_L000034_237
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4o10_6695052c_propeller_t_scroll_L000035 ' <symbol:propeller_t_scroll>
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
 long @C_sg4o10_6695052c_propeller_t_scroll_L000035_241 ' LEI4
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg4o10_6695052c_propeller_t_scroll_L000035_240 ' JUMPV addrg
C_sg4o10_6695052c_propeller_t_scroll_L000035_241
 mov r0, #0 ' RET coni
C_sg4o10_6695052c_propeller_t_scroll_L000035_240
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4o11_6695052c_propeller_t_color_L000036 ' <symbol:propeller_t_color>
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
 long @C_sg4o11_6695052c_propeller_t_color_L000036_244 ' LEI4
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg4o11_6695052c_propeller_t_color_L000036_243 ' JUMPV addrg
C_sg4o11_6695052c_propeller_t_color_L000036_244
 mov r0, #0 ' RET coni
C_sg4o11_6695052c_propeller_t_color_L000036_243
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4o12_6695052c_propeller_t_color_fg_L000037 ' <symbol:propeller_t_color_fg>
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
 long @C_sg4o12_6695052c_propeller_t_color_fg_L000037_247 ' LEI4
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg4o12_6695052c_propeller_t_color_fg_L000037_246 ' JUMPV addrg
C_sg4o12_6695052c_propeller_t_color_fg_L000037_247
 mov r0, #0 ' RET coni
C_sg4o12_6695052c_propeller_t_color_fg_L000037_246
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg4o13_6695052c_propeller_t_color_bg_L000038 ' <symbol:propeller_t_color_bg>
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
 long @C_sg4o13_6695052c_propeller_t_color_bg_L000038_250 ' LEI4
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg4o13_6695052c_propeller_t_color_bg_L000038_249 ' JUMPV addrg
C_sg4o13_6695052c_propeller_t_color_bg_L000038_250
 mov r0, #0 ' RET coni
C_sg4o13_6695052c_propeller_t_color_bg_L000038_249
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaopen_propeller

 alignl ' align long
C_luaopen_propeller ' <symbol:luaopen_propeller>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 jmp #LODI
 long @C_luaopen_propeller_253_L000254
 mov r3, RI ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #36 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_sg4o14_6695052c_luapropeller_funcs_L000039
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' RET coni
' C_luaopen_propeller_252 ' (symbol refcount = 0)
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

' Catalina Import exit

' Catalina Import strlen

' Catalina Import strcmp

' Catalina Import sbrk

' Catalina Import unsetenv

' Catalina Import setenv

' Catalina Import doDir

' Catalina Import mountFatVolume

' Catalina Import togglepin

' Catalina Import setpin

' Catalina Import getpin

' Catalina Import _waitsec

' Catalina Import _waitms

' Catalina Import malloc_defragment

' Catalina Import luaL_setfuncs

' Catalina Import luaL_unref

' Catalina Import luaL_ref

' Catalina Import luaL_error

' Catalina Import luaL_checkinteger

' Catalina Import luaL_checklstring

' Catalina Import luaL_argerror

' Catalina Import luaL_checkversion_

' Catalina Import fwrite

' Catalina Import printf

' Catalina Import fopen

' Catalina Import fclose

' Catalina Import remove

' Catalina Import lua_callk

' Catalina Import lua_createtable

' Catalina Import lua_rawgeti

' Catalina Import lua_pushstring

' Catalina Import lua_pushinteger

' Catalina Import lua_tolstring

' Catalina Import lua_toboolean

' Catalina Import lua_type

' Catalina Import lua_iscfunction

' Catalina Import lua_settop

' Catalina Import lua_gettop

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_propeller_253_L000254 ' <symbol:253>
 long $43fc0000 ' float

 alignl ' align long
C_sg4ob_6695052c_propeller_execute_L000014_200_L000201 ' <symbol:200>
 byte 119
 byte 0

 alignl ' align long
C_sg4ob_6695052c_propeller_execute_L000014_198_L000199 ' <symbol:198>
 byte 69
 byte 88
 byte 69
 byte 67
 byte 79
 byte 78
 byte 67
 byte 69
 byte 46
 byte 84
 byte 88
 byte 84
 byte 0

 alignl ' align long
C_sg4oa_6695052c_propeller_scan_L000013_177_L000178 ' <symbol:177>
 byte 102
 byte 105
 byte 114
 byte 115
 byte 116
 byte 32
 byte 97
 byte 114
 byte 103
 byte 117
 byte 109
 byte 101
 byte 110
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
 byte 97
 byte 32
 byte 76
 byte 117
 byte 97
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
C_sg4o2j_6695052c_match_callback_L000165_169_L000170 ' <symbol:169>
 byte 110
 byte 111
 byte 32
 byte 109
 byte 97
 byte 116
 byte 99
 byte 104
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 33
 byte 10
 byte 0

 alignl ' align long
C_sg4o8_6695052c_propeller_version_L000011_158_L000159 ' <symbol:158>
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
C_sg4o8_6695052c_propeller_version_L000011_154_L000155 ' <symbol:154>
 byte 108
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_sg4o6_6695052c_propeller_msleep_L000009_139_L000140 ' <symbol:139>
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
C_sg4o5_6695052c_propeller_sleep_L000008_131_L000132 ' <symbol:131>
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
C_sg4o3_6695052c_propeller_setpin_L000006_122_L000123 ' <symbol:122>
 byte 115
 byte 116
 byte 97
 byte 116
 byte 101
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 48
 byte 32
 byte 111
 byte 114
 byte 32
 byte 49
 byte 0

 alignl ' align long
C_sg4o2_6695052c_propeller_getpin_L000005_115_L000116 ' <symbol:115>
 byte 112
 byte 105
 byte 110
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 105
 byte 110
 byte 32
 byte 114
 byte 97
 byte 110
 byte 103
 byte 101
 byte 32
 byte 48
 byte 32
 byte 46
 byte 46
 byte 32
 byte 51
 byte 49
 byte 0

 alignl ' align long
C_sg4o28_6695052c_110_L000111 ' <symbol:110>
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
C_sg4o27_6695052c_108_L000109 ' <symbol:108>
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
C_sg4o26_6695052c_106_L000107 ' <symbol:106>
 byte 116
 byte 95
 byte 99
 byte 111
 byte 108
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_sg4o25_6695052c_104_L000105 ' <symbol:104>
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
C_sg4o24_6695052c_102_L000103 ' <symbol:102>
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
C_sg4o23_6695052c_100_L000101 ' <symbol:100>
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
C_sg4o22_6695052c_98_L000099 ' <symbol:98>
 byte 116
 byte 95
 byte 109
 byte 111
 byte 100
 byte 101
 byte 0

 alignl ' align long
C_sg4o21_6695052c_96_L000097 ' <symbol:96>
 byte 116
 byte 95
 byte 99
 byte 104
 byte 97
 byte 114
 byte 0

 alignl ' align long
C_sg4o20_6695052c_94_L000095 ' <symbol:94>
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
C_sg4o1v_6695052c_92_L000093 ' <symbol:92>
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
C_sg4o1u_6695052c_90_L000091 ' <symbol:90>
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
C_sg4o1t_6695052c_88_L000089 ' <symbol:88>
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
C_sg4o1s_6695052c_86_L000087 ' <symbol:86>
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
C_sg4o1r_6695052c_84_L000085 ' <symbol:84>
 byte 109
 byte 95
 byte 114
 byte 101
 byte 115
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_sg4o1q_6695052c_82_L000083 ' <symbol:82>
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
C_sg4o1p_6695052c_80_L000081 ' <symbol:80>
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
C_sg4o1o_6695052c_78_L000079 ' <symbol:78>
 byte 109
 byte 95
 byte 97
 byte 98
 byte 115
 byte 95
 byte 121
 byte 0

 alignl ' align long
C_sg4o1n_6695052c_76_L000077 ' <symbol:76>
 byte 109
 byte 95
 byte 97
 byte 98
 byte 115
 byte 95
 byte 120
 byte 0

 alignl ' align long
C_sg4o1m_6695052c_74_L000075 ' <symbol:74>
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
C_sg4o1l_6695052c_72_L000073 ' <symbol:72>
 byte 107
 byte 95
 byte 99
 byte 108
 byte 101
 byte 97
 byte 114
 byte 0

 alignl ' align long
C_sg4o1k_6695052c_70_L000071 ' <symbol:70>
 byte 107
 byte 95
 byte 114
 byte 101
 byte 97
 byte 100
 byte 121
 byte 0

 alignl ' align long
C_sg4o1j_6695052c_68_L000069 ' <symbol:68>
 byte 107
 byte 95
 byte 110
 byte 101
 byte 119
 byte 0

 alignl ' align long
C_sg4o1i_6695052c_66_L000067 ' <symbol:66>
 byte 107
 byte 95
 byte 119
 byte 97
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_sg4o1h_6695052c_64_L000065 ' <symbol:64>
 byte 107
 byte 95
 byte 103
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_sg4o1g_6695052c_62_L000063 ' <symbol:62>
 byte 101
 byte 120
 byte 101
 byte 99
 byte 117
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_sg4o1f_6695052c_60_L000061 ' <symbol:60>
 byte 115
 byte 99
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_sg4o1e_6695052c_58_L000059 ' <symbol:58>
 byte 109
 byte 111
 byte 117
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_sg4o1d_6695052c_56_L000057 ' <symbol:56>
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_sg4o1c_6695052c_54_L000055 ' <symbol:54>
 byte 115
 byte 98
 byte 114
 byte 107
 byte 0

 alignl ' align long
C_sg4o1b_6695052c_52_L000053 ' <symbol:52>
 byte 109
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_sg4o1a_6695052c_50_L000051 ' <symbol:50>
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_sg4o19_6695052c_48_L000049 ' <symbol:48>
 byte 116
 byte 111
 byte 103
 byte 103
 byte 108
 byte 101
 byte 112
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sg4o18_6695052c_46_L000047 ' <symbol:46>
 byte 115
 byte 101
 byte 116
 byte 112
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sg4o17_6695052c_44_L000045 ' <symbol:44>
 byte 103
 byte 101
 byte 116
 byte 112
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sg4o16_6695052c_42_L000043 ' <symbol:42>
 byte 117
 byte 110
 byte 115
 byte 101
 byte 116
 byte 101
 byte 110
 byte 118
 byte 0

 alignl ' align long
C_sg4o15_6695052c_40_L000041 ' <symbol:40>
 byte 115
 byte 101
 byte 116
 byte 101
 byte 110
 byte 118
 byte 0

' Catalina Code

DAT ' code segment
' end
