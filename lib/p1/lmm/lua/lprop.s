' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sogsn_696ddd00_luapropeller_funcs_L000029 ' <symbol:luapropeller_funcs>
 long @C_sogso_696ddd00_30_L000031
 long @C_sogs_696ddd00_propeller_cogid_L000006
 long @C_sogsp_696ddd00_32_L000033
 long @C_sogs1_696ddd00_propeller_locknew_L000007
 long @C_sogsq_696ddd00_34_L000035
 long @C_sogs2_696ddd00_propeller_lockclr_L000008
 long @C_sogsr_696ddd00_36_L000037
 long @C_sogs3_696ddd00_propeller_lockset_L000009
 long @C_sogss_696ddd00_38_L000039
 long @C_sogs4_696ddd00_propeller_lockret_L000010
 long @C_sogst_696ddd00_40_L000041
 long @C_sogs5_696ddd00_propeller_locktry_L000011
 long @C_sogsu_696ddd00_42_L000043
 long @C_sogs6_696ddd00_propeller_lockrel_L000012
 long @C_sogsv_696ddd00_44_L000045
 long @C_sogs7_696ddd00_propeller_clkfreq_L000013
 long @C_sogs10_696ddd00_46_L000047
 long @C_sogs8_696ddd00_propeller_clkmode_L000014
 long @C_sogs11_696ddd00_48_L000049
 long @C_sogs9_696ddd00_propeller_getcnt_L000015
 long @C_sogs12_696ddd00_50_L000051
 long @C_sogsa_696ddd00_propeller_muldiv64_L000016
 long @C_sogs13_696ddd00_52_L000053
 long @C_sogsb_696ddd00_propeller_setenv_L000017
 long @C_sogs14_696ddd00_54_L000055
 long @C_sogsc_696ddd00_propeller_unsetenv_L000018
 long @C_sogs15_696ddd00_56_L000057
 long @C_sogsd_696ddd00_propeller_getpin_L000019
 long @C_sogs16_696ddd00_58_L000059
 long @C_sogse_696ddd00_propeller_setpin_L000020
 long @C_sogs17_696ddd00_60_L000061
 long @C_sogsf_696ddd00_propeller_togglepin_L000021
 long @C_sogs18_696ddd00_62_L000063
 long @C_sogsg_696ddd00_propeller_sleep_L000022
 long @C_sogs19_696ddd00_64_L000065
 long @C_sogsh_696ddd00_propeller_msleep_L000023
 long @C_sogs1a_696ddd00_66_L000067
 long @C_sogsi_696ddd00_propeller_sbrk_L000024
 long @C_sogs1b_696ddd00_68_L000069
 long @C_sogsj_696ddd00_propeller_version_L000025
 long @C_sogs1c_696ddd00_70_L000071
 long @C_sogsk_696ddd00_propeller_mount_L000026
 long @C_sogs1d_696ddd00_72_L000073
 long @C_sogsl_696ddd00_propeller_scan_L000027
 long @C_sogs1e_696ddd00_74_L000075
 long @C_sogsm_696ddd00_propeller_execute_L000028
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sogs_696ddd00_propeller_cogid_L000006 ' <symbol:propeller_cogid>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sogs_696ddd00_propeller_cogid_L000006_76 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogs1_696ddd00_propeller_locknew_L000007 ' <symbol:propeller_locknew>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sogs1_696ddd00_propeller_locknew_L000007_77 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogs2_696ddd00_propeller_lockclr_L000008 ' <symbol:propeller_lockclr>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sogs2_696ddd00_propeller_lockclr_L000008_78 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sogs3_696ddd00_propeller_lockset_L000009 ' <symbol:propeller_lockset>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sogs3_696ddd00_propeller_lockset_L000009_79 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sogs4_696ddd00_propeller_lockret_L000010 ' <symbol:propeller_lockret>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockret ' CALL addrg
 mov r0, #0 ' RET coni
' C_sogs4_696ddd00_propeller_lockret_L000010_80 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sogs5_696ddd00_propeller_locktry_L000011 ' <symbol:propeller_locktry>
 mov r0, #0 ' RET coni
' C_sogs5_696ddd00_propeller_locktry_L000011_81 ' (symbol refcount = 0)
 jmp #RETN


 alignl ' align long
C_sogs6_696ddd00_propeller_lockrel_L000012 ' <symbol:propeller_lockrel>
 mov r0, #0 ' RET coni
' C_sogs6_696ddd00_propeller_lockrel_L000012_82 ' (symbol refcount = 0)
 jmp #RETN


 alignl ' align long
C_sogs7_696ddd00_propeller_clkfreq_L000013 ' <symbol:propeller_clkfreq>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sogs7_696ddd00_propeller_clkfreq_L000013_83 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogs8_696ddd00_propeller_clkmode_L000014 ' <symbol:propeller_clkmode>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockmode ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sogs8_696ddd00_propeller_clkmode_L000014_84 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogs9_696ddd00_propeller_getcnt_L000015 ' <symbol:propeller_getcnt>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #2 ' RET coni
' C_sogs9_696ddd00_propeller_getcnt_L000015_85 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogsa_696ddd00_propeller_muldiv64_L000016 ' <symbol:propeller_muldiv64>
 mov r0, #0 ' RET coni
' C_sogsa_696ddd00_propeller_muldiv64_L000016_86 ' (symbol refcount = 0)
 jmp #RETN


 alignl ' align long
C_sogsb_696ddd00_propeller_setenv_L000017 ' <symbol:propeller_setenv>
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
' C_sogsb_696ddd00_propeller_setenv_L000017_87 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sogsc_696ddd00_propeller_unsetenv_L000018 ' <symbol:propeller_unsetenv>
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
' C_sogsc_696ddd00_propeller_unsetenv_L000018_88 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sogsd_696ddd00_propeller_getpin_L000019 ' <symbol:propeller_getpin>
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
 long @C_sogsd_696ddd00_propeller_getpin_L000019_93 ' LTI4
 cmps r21,  #31 wz,wc
 jmp #BRBE
 long @C_sogsd_696ddd00_propeller_getpin_L000019_92 ' LEI4
C_sogsd_696ddd00_propeller_getpin_L000019_93
 jmp #LODL
 long @C_sogsd_696ddd00_propeller_getpin_L000019_90_L000091
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sogsd_696ddd00_propeller_getpin_L000019_92
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
' C_sogsd_696ddd00_propeller_getpin_L000019_89 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogse_696ddd00_propeller_setpin_L000020 ' <symbol:propeller_setpin>
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
 long @C_sogse_696ddd00_propeller_setpin_L000020_96 ' LTI4
 cmps r21,  #31 wz,wc
 jmp #BRBE
 long @C_sogse_696ddd00_propeller_setpin_L000020_95 ' LEI4
C_sogse_696ddd00_propeller_setpin_L000020_96
 jmp #LODL
 long @C_sogsd_696ddd00_propeller_getpin_L000019_90_L000091
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sogse_696ddd00_propeller_setpin_L000020_95
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sogse_696ddd00_propeller_setpin_L000020_99 ' EQI4
 cmps r19,  #1 wz
 jmp #BR_Z
 long @C_sogse_696ddd00_propeller_setpin_L000020_99 ' EQI4
 jmp #LODL
 long @C_sogse_696ddd00_propeller_setpin_L000020_97_L000098
 mov r2, RI ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sogse_696ddd00_propeller_setpin_L000020_99
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
' C_sogse_696ddd00_propeller_setpin_L000020_94 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogsf_696ddd00_propeller_togglepin_L000021 ' <symbol:propeller_togglepin>
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
 long @C_sogsf_696ddd00_propeller_togglepin_L000021_102 ' LTI4
 cmps r21,  #31 wz,wc
 jmp #BRBE
 long @C_sogsf_696ddd00_propeller_togglepin_L000021_101 ' LEI4
C_sogsf_696ddd00_propeller_togglepin_L000021_102
 jmp #LODL
 long @C_sogsd_696ddd00_propeller_getpin_L000019_90_L000091
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sogsf_696ddd00_propeller_togglepin_L000021_101
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
' C_sogsf_696ddd00_propeller_togglepin_L000021_100 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogsg_696ddd00_propeller_sleep_L000022 ' <symbol:propeller_sleep>
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
 long @C_sogsg_696ddd00_propeller_sleep_L000022_104 ' LEI4
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
 long @C_sogsg_696ddd00_propeller_sleep_L000022_108 ' GEI4
 jmp #LODL
 long @C_sogsg_696ddd00_propeller_sleep_L000022_106_L000107
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sogsg_696ddd00_propeller_sleep_L000022_108
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_sogsg_696ddd00_propeller_sleep_L000022_109 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitsec ' CALL addrg
C_sogsg_696ddd00_propeller_sleep_L000022_109
C_sogsg_696ddd00_propeller_sleep_L000022_104
 mov r0, #0 ' RET coni
' C_sogsg_696ddd00_propeller_sleep_L000022_103 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogsh_696ddd00_propeller_msleep_L000023 ' <symbol:propeller_msleep>
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
 long @C_sogsh_696ddd00_propeller_msleep_L000023_112 ' LEI4
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
 long @C_sogsh_696ddd00_propeller_msleep_L000023_116 ' GEI4
 jmp #LODL
 long @C_sogsh_696ddd00_propeller_msleep_L000023_114_L000115
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sogsh_696ddd00_propeller_msleep_L000023_116
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_sogsh_696ddd00_propeller_msleep_L000023_117 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_sogsh_696ddd00_propeller_msleep_L000023_117
C_sogsh_696ddd00_propeller_msleep_L000023_112
 mov r0, #0 ' RET coni
' C_sogsh_696ddd00_propeller_msleep_L000023_111 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogsi_696ddd00_propeller_sbrk_L000024 ' <symbol:propeller_sbrk>
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
 long @C_sogsi_696ddd00_propeller_sbrk_L000024_120 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sogsi_696ddd00_propeller_sbrk_L000024_122 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_malloc_defragment ' CALL addrg
C_sogsi_696ddd00_propeller_sbrk_L000024_122
C_sogsi_696ddd00_propeller_sbrk_L000024_120
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
' C_sogsi_696ddd00_propeller_sbrk_L000024_119 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogsj_696ddd00_propeller_version_L000025 ' <symbol:propeller_version>
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
 long @C_sogsj_696ddd00_propeller_version_L000025_125 ' LEI4
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
 long @C_sogsj_696ddd00_propeller_version_L000025_129_L000130
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sogsj_696ddd00_propeller_version_L000025_127 ' NEI4
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sogsj_696ddd00_propeller_version_L000025_126 ' JUMPV addrg
C_sogsj_696ddd00_propeller_version_L000025_127
 jmp #LODL
 long @C_sogsj_696ddd00_propeller_version_L000025_133_L000134
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sogsj_696ddd00_propeller_version_L000025_131 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sogsj_696ddd00_propeller_version_L000025_126 ' JUMPV addrg
C_sogsj_696ddd00_propeller_version_L000025_131
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
 long @C_sogsj_696ddd00_propeller_version_L000025_126 ' JUMPV addrg
C_sogsj_696ddd00_propeller_version_L000025_125
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
C_sogsj_696ddd00_propeller_version_L000025_126
 mov r0, #1 ' RET coni
' C_sogsj_696ddd00_propeller_version_L000025_124 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogsk_696ddd00_propeller_mount_L000026 ' <symbol:propeller_mount>
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
' C_sogsk_696ddd00_propeller_mount_L000026_135 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sogs1l_696ddd00_nulldir_L000136 ' <symbol:nulldir>
 byte 47
 byte 0

 alignl ' align long
C_sogs1m_696ddd00_nullpattern_L000137 ' <symbol:nullpattern>
 byte 42
 byte 0

 alignl ' align long
C_sogs1n_696ddd00_match_function_L000138 ' <symbol:match_function>
 long -2

 alignl ' align long
C_sogs1o_696ddd00_match_state_L000139 ' <symbol:match_state>
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sogs1p_696ddd00_match_callback_L000140 ' <symbol:match_callback>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sogs1n_696ddd00_match_function_L000138
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sogs1p_696ddd00_match_callback_L000140_142 ' EQI4
 jmp #LODI
 long @C_sogs1o_696ddd00_match_state_L000139
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sogs1p_696ddd00_match_callback_L000140_142 ' EQU4
 jmp #LODI
 long @C_sogs1n_696ddd00_match_function_L000138
 mov r2, RI ' reg ARG INDIR ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_sogs1o_696ddd00_match_state_L000139
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sogs1o_696ddd00_match_state_L000139
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sogs1o_696ddd00_match_state_L000139
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sogs1o_696ddd00_match_state_L000139
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
 long @C_sogs1o_696ddd00_match_state_L000139 ' stack ARG INDIR ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_sogs1p_696ddd00_match_callback_L000140_143 ' JUMPV addrg
C_sogs1p_696ddd00_match_callback_L000140_142
 jmp #LODL
 long @C_sogs1p_696ddd00_match_callback_L000140_144_L000145
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_printf ' CALL addrg
C_sogs1p_696ddd00_match_callback_L000140_143
' C_sogs1p_696ddd00_match_callback_L000140_141 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogsl_696ddd00_propeller_scan_L000027 ' <symbol:propeller_scan>
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
 long @C_sogsl_696ddd00_propeller_scan_L000027_147 ' LTI4
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
 long @C_sogsl_696ddd00_propeller_scan_L000027_151 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_iscfunction
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sogsl_696ddd00_propeller_scan_L000027_149 ' EQI4
C_sogsl_696ddd00_propeller_scan_L000027_151
 jmp #LODL
 long @C_sogsl_696ddd00_propeller_scan_L000027_152_L000153
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sogsl_696ddd00_propeller_scan_L000027_149
C_sogsl_696ddd00_propeller_scan_L000027_147
 cmps r21,  #2 wz,wc
 jmp #BR_B
 long @C_sogsl_696ddd00_propeller_scan_L000027_154 ' LTI4
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
 long @C_sogsl_696ddd00_propeller_scan_L000027_156 ' NEU4
 jmp #LODL
 long @C_sogs1l_696ddd00_nulldir_L000136
 mov r19, RI ' reg <- addrg
C_sogsl_696ddd00_propeller_scan_L000027_156
C_sogsl_696ddd00_propeller_scan_L000027_154
 cmps r21,  #3 wz,wc
 jmp #BR_B
 long @C_sogsl_696ddd00_propeller_scan_L000027_158 ' LTI4
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
 long @C_sogsl_696ddd00_propeller_scan_L000027_160 ' NEU4
 jmp #LODL
 long @C_sogs1m_696ddd00_nullpattern_L000137
 mov r17, RI ' reg <- addrg
C_sogsl_696ddd00_propeller_scan_L000027_160
C_sogsl_696ddd00_propeller_scan_L000027_158
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_sogsl_696ddd00_propeller_scan_L000027_162 ' LEI4
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
 long @C_sogs1n_696ddd00_match_function_L000138
 wrlong r0, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_sogs1o_696ddd00_match_state_L000139
 wrlong r23, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_sogs1p_696ddd00_match_callback_L000140
 mov r2, RI ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_doD_ir
 add SP, #8 ' CALL addrg
 jmp #LODI
 long @C_sogs1n_696ddd00_match_function_L000138
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
 long @C_sogs1n_696ddd00_match_function_L000138
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_sogs1o_696ddd00_match_state_L000139
 wrlong r22, RI ' ASGNP4 addrg reg
C_sogsl_696ddd00_propeller_scan_L000027_162
 mov r0, #0 ' RET coni
' C_sogsl_696ddd00_propeller_scan_L000027_146 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sogsm_696ddd00_propeller_execute_L000028 ' <symbol:propeller_execute>
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
 long @C_sogsm_696ddd00_propeller_execute_L000028_165 ' GEI4
 jmp #LODL
 long -4
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sogsm_696ddd00_propeller_execute_L000028_164 ' JUMPV addrg
C_sogsm_696ddd00_propeller_execute_L000028_165
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
 long @C_sogsm_696ddd00_propeller_execute_L000028_167 ' LTI4
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
C_sogsm_696ddd00_propeller_execute_L000028_167
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
 long @C_sogsm_696ddd00_propeller_execute_L000028_169 ' NEU4
 jmp #LODL
 long -3
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sogsm_696ddd00_propeller_execute_L000028_164 ' JUMPV addrg
C_sogsm_696ddd00_propeller_execute_L000028_169
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sogsm_696ddd00_propeller_execute_L000028_171 ' NEU4
 jmp #LODL
 long @C_sogsm_696ddd00_propeller_execute_L000028_173_L000174
 mov r17, RI ' reg <- addrg
C_sogsm_696ddd00_propeller_execute_L000028_171
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_remove ' CALL addrg
 jmp #LODL
 long @C_sogsm_696ddd00_propeller_execute_L000028_175_L000176
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
 long @C_sogsm_696ddd00_propeller_execute_L000028_177 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
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
 long @C_sogsm_696ddd00_propeller_execute_L000028_179 ' NEU4
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
 long @C_sogsm_696ddd00_propeller_execute_L000028_164 ' JUMPV addrg
C_sogsm_696ddd00_propeller_execute_L000028_179
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fclose ' CALL addrg
 jmp #LODL
 long -2
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sogsm_696ddd00_propeller_execute_L000028_164 ' JUMPV addrg
C_sogsm_696ddd00_propeller_execute_L000028_177
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
C_sogsm_696ddd00_propeller_execute_L000028_164
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
 long @C_luaopen_propeller_182_L000183
 mov r3, RI ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #23 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_sogsn_696ddd00_luapropeller_funcs_L000029
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' RET coni
' C_luaopen_propeller_181 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import doDir

' Catalina Import mountFatVolume

' Catalina Import sbrk

' Catalina Import togglepin

' Catalina Import setpin

' Catalina Import getpin

' Catalina Import _waitsec

' Catalina Import _waitms

' Catalina Import malloc_defragment

' Catalina Import _cnt

' Catalina Import _lockclr

' Catalina Import _lockset

' Catalina Import _lockret

' Catalina Import _locknew

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
C_luaopen_propeller_182_L000183 ' <symbol:182>
 long $43fc0000 ' float

 alignl ' align long
C_sogsm_696ddd00_propeller_execute_L000028_175_L000176 ' <symbol:175>
 byte 119
 byte 0

 alignl ' align long
C_sogsm_696ddd00_propeller_execute_L000028_173_L000174 ' <symbol:173>
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
C_sogsl_696ddd00_propeller_scan_L000027_152_L000153 ' <symbol:152>
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
C_sogs1p_696ddd00_match_callback_L000140_144_L000145 ' <symbol:144>
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
C_sogsj_696ddd00_propeller_version_L000025_133_L000134 ' <symbol:133>
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
C_sogsj_696ddd00_propeller_version_L000025_129_L000130 ' <symbol:129>
 byte 108
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_sogsh_696ddd00_propeller_msleep_L000023_114_L000115 ' <symbol:114>
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
C_sogsg_696ddd00_propeller_sleep_L000022_106_L000107 ' <symbol:106>
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
C_sogse_696ddd00_propeller_setpin_L000020_97_L000098 ' <symbol:97>
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
C_sogsd_696ddd00_propeller_getpin_L000019_90_L000091 ' <symbol:90>
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
C_sogs1e_696ddd00_74_L000075 ' <symbol:74>
 byte 101
 byte 120
 byte 101
 byte 99
 byte 117
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_sogs1d_696ddd00_72_L000073 ' <symbol:72>
 byte 115
 byte 99
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_sogs1c_696ddd00_70_L000071 ' <symbol:70>
 byte 109
 byte 111
 byte 117
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_sogs1b_696ddd00_68_L000069 ' <symbol:68>
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_sogs1a_696ddd00_66_L000067 ' <symbol:66>
 byte 115
 byte 98
 byte 114
 byte 107
 byte 0

 alignl ' align long
C_sogs19_696ddd00_64_L000065 ' <symbol:64>
 byte 109
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_sogs18_696ddd00_62_L000063 ' <symbol:62>
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_sogs17_696ddd00_60_L000061 ' <symbol:60>
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
C_sogs16_696ddd00_58_L000059 ' <symbol:58>
 byte 115
 byte 101
 byte 116
 byte 112
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sogs15_696ddd00_56_L000057 ' <symbol:56>
 byte 103
 byte 101
 byte 116
 byte 112
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sogs14_696ddd00_54_L000055 ' <symbol:54>
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
C_sogs13_696ddd00_52_L000053 ' <symbol:52>
 byte 115
 byte 101
 byte 116
 byte 101
 byte 110
 byte 118
 byte 0

 alignl ' align long
C_sogs12_696ddd00_50_L000051 ' <symbol:50>
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
C_sogs11_696ddd00_48_L000049 ' <symbol:48>
 byte 103
 byte 101
 byte 116
 byte 99
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_sogs10_696ddd00_46_L000047 ' <symbol:46>
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
C_sogsv_696ddd00_44_L000045 ' <symbol:44>
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
C_sogsu_696ddd00_42_L000043 ' <symbol:42>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 114
 byte 101
 byte 108
 byte 0

 alignl ' align long
C_sogst_696ddd00_40_L000041 ' <symbol:40>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 116
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sogss_696ddd00_38_L000039 ' <symbol:38>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 114
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_sogsr_696ddd00_36_L000037 ' <symbol:36>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 115
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_sogsq_696ddd00_34_L000035 ' <symbol:34>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 99
 byte 108
 byte 114
 byte 0

 alignl ' align long
C_sogsp_696ddd00_32_L000033 ' <symbol:32>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 110
 byte 101
 byte 119
 byte 0

 alignl ' align long
C_sogso_696ddd00_30_L000031 ' <symbol:30>
 byte 99
 byte 111
 byte 103
 byte 105
 byte 100
 byte 0

' Catalina Code

DAT ' code segment
' end
