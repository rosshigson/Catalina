' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_skn8n_696de09a_luapropeller_funcs_L000029 ' <symbol:luapropeller_funcs>
 long @C_skn8o_696de09a_30_L000031
 long @C_skn8_696de09a_propeller_cogid_L000006
 long @C_skn8p_696de09a_32_L000033
 long @C_skn81_696de09a_propeller_locknew_L000007
 long @C_skn8q_696de09a_34_L000035
 long @C_skn82_696de09a_propeller_lockclr_L000008
 long @C_skn8r_696de09a_36_L000037
 long @C_skn83_696de09a_propeller_lockset_L000009
 long @C_skn8s_696de09a_38_L000039
 long @C_skn84_696de09a_propeller_lockret_L000010
 long @C_skn8t_696de09a_40_L000041
 long @C_skn85_696de09a_propeller_locktry_L000011
 long @C_skn8u_696de09a_42_L000043
 long @C_skn86_696de09a_propeller_lockrel_L000012
 long @C_skn8v_696de09a_44_L000045
 long @C_skn87_696de09a_propeller_clkfreq_L000013
 long @C_skn810_696de09a_46_L000047
 long @C_skn88_696de09a_propeller_clkmode_L000014
 long @C_skn811_696de09a_48_L000049
 long @C_skn89_696de09a_propeller_getcnt_L000015
 long @C_skn812_696de09a_50_L000051
 long @C_skn8a_696de09a_propeller_muldiv64_L000016
 long @C_skn813_696de09a_52_L000053
 long @C_skn8b_696de09a_propeller_setenv_L000017
 long @C_skn814_696de09a_54_L000055
 long @C_skn8c_696de09a_propeller_unsetenv_L000018
 long @C_skn815_696de09a_56_L000057
 long @C_skn8d_696de09a_propeller_getpin_L000019
 long @C_skn816_696de09a_58_L000059
 long @C_skn8e_696de09a_propeller_setpin_L000020
 long @C_skn817_696de09a_60_L000061
 long @C_skn8f_696de09a_propeller_togglepin_L000021
 long @C_skn818_696de09a_62_L000063
 long @C_skn8g_696de09a_propeller_sleep_L000022
 long @C_skn819_696de09a_64_L000065
 long @C_skn8h_696de09a_propeller_msleep_L000023
 long @C_skn81a_696de09a_66_L000067
 long @C_skn8i_696de09a_propeller_sbrk_L000024
 long @C_skn81b_696de09a_68_L000069
 long @C_skn8j_696de09a_propeller_version_L000025
 long @C_skn81c_696de09a_70_L000071
 long @C_skn8k_696de09a_propeller_mount_L000026
 long @C_skn81d_696de09a_72_L000073
 long @C_skn8l_696de09a_propeller_scan_L000027
 long @C_skn81e_696de09a_74_L000075
 long @C_skn8m_696de09a_propeller_execute_L000028
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_skn8_696de09a_propeller_cogid_L000006 ' <symbol:propeller_cogid>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn8_696de09a_propeller_cogid_L000006_76 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn81_696de09a_propeller_locknew_L000007 ' <symbol:propeller_locknew>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__locknew ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn81_696de09a_propeller_locknew_L000007_77 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn82_696de09a_propeller_lockclr_L000008 ' <symbol:propeller_lockclr>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockclr ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn82_696de09a_propeller_lockclr_L000008_78 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_skn83_696de09a_propeller_lockset_L000009 ' <symbol:propeller_lockset>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockset ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn83_696de09a_propeller_lockset_L000009_79 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_skn84_696de09a_propeller_lockret_L000010 ' <symbol:propeller_lockret>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockret ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_skn84_696de09a_propeller_lockret_L000010_80 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_skn85_696de09a_propeller_locktry_L000011 ' <symbol:propeller_locktry>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locktry ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn85_696de09a_propeller_locktry_L000011_81 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_skn86_696de09a_propeller_lockrel_L000012 ' <symbol:propeller_lockrel>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockrel ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_skn86_696de09a_propeller_lockrel_L000012_82 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_skn87_696de09a_propeller_clkfreq_L000013 ' <symbol:propeller_clkfreq>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn87_696de09a_propeller_clkfreq_L000013_83 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn88_696de09a_propeller_clkmode_L000014 ' <symbol:propeller_clkmode>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockmode ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn88_696de09a_propeller_clkmode_L000014_84 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn89_696de09a_propeller_getcnt_L000015 ' <symbol:propeller_getcnt>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__cnthl ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
' C_skn89_696de09a_propeller_getcnt_L000015_85 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_skn8a_696de09a_propeller_muldiv64_L000016 ' <symbol:propeller_muldiv64>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__muldiv64
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn8a_696de09a_propeller_muldiv64_L000016_87 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_skn8b_696de09a_propeller_setenv_L000017 ' <symbol:propeller_setenv>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, ##0 ' reg ARG con
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
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
 calld PA,#CALA
 long @C_setenv
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn8b_696de09a_propeller_setenv_L000017_88 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_skn8c_696de09a_propeller_unsetenv_L000018 ' <symbol:propeller_unsetenv>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_unsetenv ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn8c_696de09a_propeller_unsetenv_L000018_89 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_skn8d_696de09a_propeller_getpin_L000019 ' <symbol:propeller_getpin>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_b jmp #\C_skn8d_696de09a_propeller_getpin_L000019_94 ' LTI4
 cmps r21,  #63 wcz
 if_be jmp #\C_skn8d_696de09a_propeller_getpin_L000019_93 ' LEI4
C_skn8d_696de09a_propeller_getpin_L000019_94
 mov r2, ##@C_skn8d_696de09a_propeller_getpin_L000019_91_L000092 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_skn8d_696de09a_propeller_getpin_L000019_93
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getpin ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn8d_696de09a_propeller_getpin_L000019_90 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn8e_696de09a_propeller_setpin_L000020 ' <symbol:propeller_setpin>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_b jmp #\C_skn8e_696de09a_propeller_setpin_L000020_97 ' LTI4
 cmps r21,  #63 wcz
 if_be jmp #\C_skn8e_696de09a_propeller_setpin_L000020_96 ' LEI4
C_skn8e_696de09a_propeller_setpin_L000020_97
 mov r2, ##@C_skn8d_696de09a_propeller_getpin_L000019_91_L000092 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_skn8e_696de09a_propeller_setpin_L000020_96
 cmps r19,  #0 wz
 if_z jmp #\C_skn8e_696de09a_propeller_setpin_L000020_100 ' EQI4
 cmps r19,  #1 wz
 if_z jmp #\C_skn8e_696de09a_propeller_setpin_L000020_100 ' EQI4
 mov r2, ##@C_skn8e_696de09a_propeller_setpin_L000020_98_L000099 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_skn8e_696de09a_propeller_setpin_L000020_100
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_setpin
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_skn8e_696de09a_propeller_setpin_L000020_95 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn8f_696de09a_propeller_togglepin_L000021 ' <symbol:propeller_togglepin>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_b jmp #\C_skn8f_696de09a_propeller_togglepin_L000021_103 ' LTI4
 cmps r21,  #63 wcz
 if_be jmp #\C_skn8f_696de09a_propeller_togglepin_L000021_102 ' LEI4
C_skn8f_696de09a_propeller_togglepin_L000021_103
 mov r2, ##@C_skn8d_696de09a_propeller_getpin_L000019_91_L000092 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_skn8f_696de09a_propeller_togglepin_L000021_102
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_togglepin ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_skn8f_696de09a_propeller_togglepin_L000021_101 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn8g_696de09a_propeller_sleep_L000022 ' <symbol:propeller_sleep>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_skn8g_696de09a_propeller_sleep_L000022_105 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_ae jmp #\C_skn8g_696de09a_propeller_sleep_L000022_109 ' GEI4
 mov r2, ##@C_skn8g_696de09a_propeller_sleep_L000022_107_L000108 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_skn8g_696de09a_propeller_sleep_L000022_109
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r21,  #0 wcz
 if_be jmp #\C_skn8g_696de09a_propeller_sleep_L000022_110 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitsec ' CALL addrg
C_skn8g_696de09a_propeller_sleep_L000022_110
C_skn8g_696de09a_propeller_sleep_L000022_105
 mov r0, #0 ' reg <- coni
' C_skn8g_696de09a_propeller_sleep_L000022_104 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn8h_696de09a_propeller_msleep_L000023 ' <symbol:propeller_msleep>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_skn8h_696de09a_propeller_msleep_L000023_113 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_ae jmp #\C_skn8h_696de09a_propeller_msleep_L000023_117 ' GEI4
 mov r2, ##@C_skn8h_696de09a_propeller_msleep_L000023_115_L000116 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_skn8h_696de09a_propeller_msleep_L000023_117
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r21,  #0 wcz
 if_be jmp #\C_skn8h_696de09a_propeller_msleep_L000023_118 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitms ' CALL addrg
C_skn8h_696de09a_propeller_msleep_L000023_118
C_skn8h_696de09a_propeller_msleep_L000023_113
 mov r0, #0 ' reg <- coni
' C_skn8h_696de09a_propeller_msleep_L000023_112 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn8i_696de09a_propeller_sbrk_L000024 ' <symbol:propeller_sbrk>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_skn8i_696de09a_propeller_sbrk_L000024_121 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_skn8i_696de09a_propeller_sbrk_L000024_123 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_malloc_defragment ' CALL addrg
C_skn8i_696de09a_propeller_sbrk_L000024_123
C_skn8i_696de09a_propeller_sbrk_L000024_121
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sbrk ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn8i_696de09a_propeller_sbrk_L000024_120 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn8j_696de09a_propeller_version_L000025 ' <symbol:propeller_version>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_skn8j_696de09a_propeller_version_L000025_126 ' LEI4
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##@C_skn8j_696de09a_propeller_version_L000025_130_L000131 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_skn8j_696de09a_propeller_version_L000025_128 ' NEI4
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_skn8j_696de09a_propeller_version_L000025_127 ' JUMPV addrg
C_skn8j_696de09a_propeller_version_L000025_128
 mov r2, ##@C_skn8j_696de09a_propeller_version_L000025_134_L000135 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_skn8j_696de09a_propeller_version_L000025_132 ' NEI4
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_skn8j_696de09a_propeller_version_L000025_127 ' JUMPV addrg
C_skn8j_696de09a_propeller_version_L000025_132
 mov r2, ##810 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_skn8j_696de09a_propeller_version_L000025_127 ' JUMPV addrg
C_skn8j_696de09a_propeller_version_L000025_126
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
C_skn8j_696de09a_propeller_version_L000025_127
 mov r0, #1 ' reg <- coni
' C_skn8j_696de09a_propeller_version_L000025_125 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn8k_696de09a_propeller_mount_L000026 ' <symbol:propeller_mount>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_mountF_atV_olume ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_skn8k_696de09a_propeller_mount_L000026_136 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_skn81l_696de09a_nulldir_L000137 ' <symbol:nulldir>
 byte 47
 byte 0

 alignl ' align long
C_skn81m_696de09a_nullpattern_L000138 ' <symbol:nullpattern>
 byte 42
 byte 0

 alignl ' align long
C_skn81n_696de09a_match_function_L000139 ' <symbol:match_function>
 long -2

 alignl ' align long
C_skn81o_696de09a_match_state_L000140 ' <symbol:match_state>
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_skn81p_696de09a_match_callback_L000141 ' <symbol:match_callback>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##@C_skn81n_696de09a_match_function_L000139
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_z jmp #\C_skn81p_696de09a_match_callback_L000141_143 ' EQI4
 mov r22, ##@C_skn81o_696de09a_match_state_L000140
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_skn81p_696de09a_match_callback_L000141_143 ' EQU4
 mov r2, ##@C_skn81n_696de09a_match_function_L000139
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, ##@C_skn81o_696de09a_match_state_L000140
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_skn81o_696de09a_match_state_L000140
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_skn81o_696de09a_match_state_L000140
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_skn81o_696de09a_match_state_L000140
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, #3 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 rdlong RI, ##@C_skn81o_696de09a_match_state_L000140
 wrlong RI, --PTRA ' stack ARG INDIR ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 jmp #\@C_skn81p_696de09a_match_callback_L000141_144 ' JUMPV addrg
C_skn81p_696de09a_match_callback_L000141_143
 mov r2, ##@C_skn81p_696de09a_match_callback_L000141_145_L000146 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_printf ' CALL addrg
C_skn81p_696de09a_match_callback_L000141_144
' C_skn81p_696de09a_match_callback_L000141_142 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn8l_696de09a_propeller_scan_L000027 ' <symbol:propeller_scan>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #1 wcz
 if_b jmp #\C_skn8l_696de09a_propeller_scan_L000027_148 ' LTI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #6 wz
 if_nz jmp #\C_skn8l_696de09a_propeller_scan_L000027_152 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_iscfunction
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_skn8l_696de09a_propeller_scan_L000027_150 ' EQI4
C_skn8l_696de09a_propeller_scan_L000027_152
 mov r2, ##@C_skn8l_696de09a_propeller_scan_L000027_153_L000154 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_skn8l_696de09a_propeller_scan_L000027_150
C_skn8l_696de09a_propeller_scan_L000027_148
 cmps r21,  #2 wcz
 if_b jmp #\C_skn8l_696de09a_propeller_scan_L000027_155 ' LTI4
 mov r2, ##0 ' reg ARG con
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_skn8l_696de09a_propeller_scan_L000027_157  ' NEU4
 mov r19, ##@C_skn81l_696de09a_nulldir_L000137 ' reg <- addrg
C_skn8l_696de09a_propeller_scan_L000027_157
C_skn8l_696de09a_propeller_scan_L000027_155
 cmps r21,  #3 wcz
 if_b jmp #\C_skn8l_696de09a_propeller_scan_L000027_159 ' LTI4
 mov r2, ##0 ' reg ARG con
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_skn8l_696de09a_propeller_scan_L000027_161  ' NEU4
 mov r17, ##@C_skn81m_696de09a_nullpattern_L000138 ' reg <- addrg
C_skn8l_696de09a_propeller_scan_L000027_161
C_skn8l_696de09a_propeller_scan_L000027_159
 cmps r21,  #0 wcz
 if_be jmp #\C_skn8l_696de09a_propeller_scan_L000027_163 ' LEI4
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 neg r22, r22 ' NEGI4
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##-1001000 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__ref
 add SP, #4 ' CALL addrg
 wrlong r0, ##@C_skn81n_696de09a_match_function_L000139 ' ASGNI4 addrg reg
 wrlong r23, ##@C_skn81o_696de09a_match_state_L000140 ' ASGNP4 addrg reg
 mov r2, ##@C_skn81p_696de09a_match_callback_L000141 ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_doD_ir
 add SP, #8 ' CALL addrg
 mov r2, ##@C_skn81n_696de09a_match_function_L000139
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__unref
 add SP, #8 ' CALL addrg
 mov r22, ##-2 ' reg <- con
 wrlong r22, ##@C_skn81n_696de09a_match_function_L000139 ' ASGNI4 addrg reg
 mov r22, ##0 ' reg <- con
 wrlong r22, ##@C_skn81o_696de09a_match_state_L000140 ' ASGNP4 addrg reg
C_skn8l_696de09a_propeller_scan_L000027_163
 mov r0, #0 ' reg <- coni
' C_skn8l_696de09a_propeller_scan_L000027_147 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_skn8m_696de09a_propeller_execute_L000028 ' <symbol:propeller_execute>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r19, ##0 ' reg <- con
 mov r17, ##0 ' reg <- con
 mov r15, ##0 ' reg <- con
 mov r13, #0 ' reg <- coni
 cmps r21,  #1 wcz
 if_ae jmp #\C_skn8m_696de09a_propeller_execute_L000028_166 ' GEI4
 mov r0, ##-4 ' RET con
 jmp #\@C_skn8m_696de09a_propeller_execute_L000028_165 ' JUMPV addrg
C_skn8m_696de09a_propeller_execute_L000028_166
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r21,  #2 wcz
 if_b jmp #\C_skn8m_696de09a_propeller_execute_L000028_168 ' LTI4
 mov r2, ##0 ' reg ARG con
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_skn8m_696de09a_propeller_execute_L000028_168
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_skn8m_696de09a_propeller_execute_L000028_170  ' NEU4
 mov r0, ##-3 ' RET con
 jmp #\@C_skn8m_696de09a_propeller_execute_L000028_165 ' JUMPV addrg
C_skn8m_696de09a_propeller_execute_L000028_170
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_skn8m_696de09a_propeller_execute_L000028_172  ' NEU4
 mov r17, ##@C_skn8m_696de09a_propeller_execute_L000028_174_L000175 ' reg <- addrg
C_skn8m_696de09a_propeller_execute_L000028_172
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_remove ' CALL addrg
 mov r2, ##@C_skn8m_696de09a_propeller_execute_L000028_176_L000177 ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_skn8m_696de09a_propeller_execute_L000028_178 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov r5, r19 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fwrite
 add SP, #12 ' CALL addrg
 mov r20, r13 ' CVI, CVU or LOAD
 cmp r0, r20 wz
 if_nz jmp #\C_skn8m_696de09a_propeller_execute_L000028_180  ' NEU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fclose ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_exit ' CALL addrg
 mov r0, ##-4 ' RET con
 jmp #\@C_skn8m_696de09a_propeller_execute_L000028_165 ' JUMPV addrg
C_skn8m_696de09a_propeller_execute_L000028_180
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fclose ' CALL addrg
 mov r0, ##-2 ' RET con
 jmp #\@C_skn8m_696de09a_propeller_execute_L000028_165 ' JUMPV addrg
C_skn8m_696de09a_propeller_execute_L000028_178
 mov r0, ##-1 ' RET con
C_skn8m_696de09a_propeller_execute_L000028_165
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaopen_propeller

 alignl ' align long
C_luaopen_propeller ' <symbol:luaopen_propeller>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 mov r3, ##@C_luaopen_propeller_183_L000184
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #23 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_skn8n_696de09a_luapropeller_funcs_L000029 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_luaopen_propeller_182 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import doDir

' Catalina Import mountFatVolume

' Catalina Import _cnthl

' Catalina Import _muldiv64

' Catalina Import _lockrel

' Catalina Import _locktry

' Catalina Import _lockret

' Catalina Import _locknew

' Catalina Import sbrk

' Catalina Import togglepin

' Catalina Import setpin

' Catalina Import getpin

' Catalina Import _waitsec

' Catalina Import _waitms

' Catalina Import malloc_defragment

' Catalina Import _lockclr

' Catalina Import _lockset

' Catalina Import _cogid

' Catalina Import _clockmode

' Catalina Import _clockfreq

' Catalina Import unsetenv

' Catalina Import setenv

' Catalina Import exit

' Catalina Import strlen

' Catalina Import strcmp

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
C_luaopen_propeller_183_L000184 ' <symbol:183>
 long $43fc0000 ' float

 alignl ' align long
C_skn8m_696de09a_propeller_execute_L000028_176_L000177 ' <symbol:176>
 byte 119
 byte 0

 alignl ' align long
C_skn8m_696de09a_propeller_execute_L000028_174_L000175 ' <symbol:174>
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
C_skn8l_696de09a_propeller_scan_L000027_153_L000154 ' <symbol:153>
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
C_skn81p_696de09a_match_callback_L000141_145_L000146 ' <symbol:145>
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
C_skn8j_696de09a_propeller_version_L000025_134_L000135 ' <symbol:134>
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
C_skn8j_696de09a_propeller_version_L000025_130_L000131 ' <symbol:130>
 byte 108
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_skn8h_696de09a_propeller_msleep_L000023_115_L000116 ' <symbol:115>
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
C_skn8g_696de09a_propeller_sleep_L000022_107_L000108 ' <symbol:107>
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
C_skn8e_696de09a_propeller_setpin_L000020_98_L000099 ' <symbol:98>
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
C_skn8d_696de09a_propeller_getpin_L000019_91_L000092 ' <symbol:91>
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
 byte 54
 byte 51
 byte 0

 alignl ' align long
C_skn81e_696de09a_74_L000075 ' <symbol:74>
 byte 101
 byte 120
 byte 101
 byte 99
 byte 117
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_skn81d_696de09a_72_L000073 ' <symbol:72>
 byte 115
 byte 99
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_skn81c_696de09a_70_L000071 ' <symbol:70>
 byte 109
 byte 111
 byte 117
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_skn81b_696de09a_68_L000069 ' <symbol:68>
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_skn81a_696de09a_66_L000067 ' <symbol:66>
 byte 115
 byte 98
 byte 114
 byte 107
 byte 0

 alignl ' align long
C_skn819_696de09a_64_L000065 ' <symbol:64>
 byte 109
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_skn818_696de09a_62_L000063 ' <symbol:62>
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_skn817_696de09a_60_L000061 ' <symbol:60>
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
C_skn816_696de09a_58_L000059 ' <symbol:58>
 byte 115
 byte 101
 byte 116
 byte 112
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_skn815_696de09a_56_L000057 ' <symbol:56>
 byte 103
 byte 101
 byte 116
 byte 112
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_skn814_696de09a_54_L000055 ' <symbol:54>
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
C_skn813_696de09a_52_L000053 ' <symbol:52>
 byte 115
 byte 101
 byte 116
 byte 101
 byte 110
 byte 118
 byte 0

 alignl ' align long
C_skn812_696de09a_50_L000051 ' <symbol:50>
 byte 109
 byte 117
 byte 108
 byte 100
 byte 105
 byte 118
 byte 54
 byte 52
 byte 0

 alignl ' align long
C_skn811_696de09a_48_L000049 ' <symbol:48>
 byte 103
 byte 101
 byte 116
 byte 99
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_skn810_696de09a_46_L000047 ' <symbol:46>
 byte 99
 byte 108
 byte 111
 byte 99
 byte 107
 byte 109
 byte 111
 byte 100
 byte 101
 byte 0

 alignl ' align long
C_skn8v_696de09a_44_L000045 ' <symbol:44>
 byte 99
 byte 108
 byte 111
 byte 99
 byte 107
 byte 102
 byte 114
 byte 101
 byte 113
 byte 0

 alignl ' align long
C_skn8u_696de09a_42_L000043 ' <symbol:42>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 114
 byte 101
 byte 108
 byte 0

 alignl ' align long
C_skn8t_696de09a_40_L000041 ' <symbol:40>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 116
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_skn8s_696de09a_38_L000039 ' <symbol:38>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 114
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_skn8r_696de09a_36_L000037 ' <symbol:36>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 115
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_skn8q_696de09a_34_L000035 ' <symbol:34>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 99
 byte 108
 byte 114
 byte 0

 alignl ' align long
C_skn8p_696de09a_32_L000033 ' <symbol:32>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 110
 byte 101
 byte 119
 byte 0

 alignl ' align long
C_skn8o_696de09a_30_L000031 ' <symbol:30>
 byte 99
 byte 111
 byte 103
 byte 105
 byte 100
 byte 0

' Catalina Code

DAT ' code segment
' end
