' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_suskn_696dded1_luapropeller_funcs_L000029 ' <symbol:luapropeller_funcs>
 long @C_susko_696dded1_30_L000031
 long @C_susk_696dded1_propeller_cogid_L000006
 long @C_suskp_696dded1_32_L000033
 long @C_susk1_696dded1_propeller_locknew_L000007
 long @C_suskq_696dded1_34_L000035
 long @C_susk2_696dded1_propeller_lockclr_L000008
 long @C_suskr_696dded1_36_L000037
 long @C_susk3_696dded1_propeller_lockset_L000009
 long @C_susks_696dded1_38_L000039
 long @C_susk4_696dded1_propeller_lockret_L000010
 long @C_suskt_696dded1_40_L000041
 long @C_susk5_696dded1_propeller_locktry_L000011
 long @C_susku_696dded1_42_L000043
 long @C_susk6_696dded1_propeller_lockrel_L000012
 long @C_suskv_696dded1_44_L000045
 long @C_susk7_696dded1_propeller_clkfreq_L000013
 long @C_susk10_696dded1_46_L000047
 long @C_susk8_696dded1_propeller_clkmode_L000014
 long @C_susk11_696dded1_48_L000049
 long @C_susk9_696dded1_propeller_getcnt_L000015
 long @C_susk12_696dded1_50_L000051
 long @C_suska_696dded1_propeller_muldiv64_L000016
 long @C_susk13_696dded1_52_L000053
 long @C_suskb_696dded1_propeller_setenv_L000017
 long @C_susk14_696dded1_54_L000055
 long @C_suskc_696dded1_propeller_unsetenv_L000018
 long @C_susk15_696dded1_56_L000057
 long @C_suskd_696dded1_propeller_getpin_L000019
 long @C_susk16_696dded1_58_L000059
 long @C_suske_696dded1_propeller_setpin_L000020
 long @C_susk17_696dded1_60_L000061
 long @C_suskf_696dded1_propeller_togglepin_L000021
 long @C_susk18_696dded1_62_L000063
 long @C_suskg_696dded1_propeller_sleep_L000022
 long @C_susk19_696dded1_64_L000065
 long @C_suskh_696dded1_propeller_msleep_L000023
 long @C_susk1a_696dded1_66_L000067
 long @C_suski_696dded1_propeller_sbrk_L000024
 long @C_susk1b_696dded1_68_L000069
 long @C_suskj_696dded1_propeller_version_L000025
 long @C_susk1c_696dded1_70_L000071
 long @C_suskk_696dded1_propeller_mount_L000026
 long @C_susk1d_696dded1_72_L000073
 long @C_suskl_696dded1_propeller_scan_L000027
 long @C_susk1e_696dded1_74_L000075
 long @C_suskm_696dded1_propeller_execute_L000028
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_susk_696dded1_propeller_cogid_L000006 ' <symbol:propeller_cogid>
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
 mov r0, #1 ' reg <- coni
' C_susk_696dded1_propeller_cogid_L000006_76 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_susk1_696dded1_propeller_locknew_L000007 ' <symbol:propeller_locknew>
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
 mov r0, #1 ' reg <- coni
' C_susk1_696dded1_propeller_locknew_L000007_77 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_susk2_696dded1_propeller_lockclr_L000008 ' <symbol:propeller_lockclr>
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
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
 mov r0, #1 ' reg <- coni
' C_susk2_696dded1_propeller_lockclr_L000008_78 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_susk3_696dded1_propeller_lockset_L000009 ' <symbol:propeller_lockset>
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
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
 mov r0, #1 ' reg <- coni
' C_susk3_696dded1_propeller_lockset_L000009_79 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_susk4_696dded1_propeller_lockret_L000010 ' <symbol:propeller_lockret>
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockret ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_susk4_696dded1_propeller_lockret_L000010_80 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_susk5_696dded1_propeller_locktry_L000011 ' <symbol:propeller_locktry>
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locktry ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_susk5_696dded1_propeller_locktry_L000011_81 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_susk6_696dded1_propeller_lockrel_L000012 ' <symbol:propeller_lockrel>
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockrel ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_susk6_696dded1_propeller_lockrel_L000012_82 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_susk7_696dded1_propeller_clkfreq_L000013 ' <symbol:propeller_clkfreq>
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
 mov r0, #1 ' reg <- coni
' C_susk7_696dded1_propeller_clkfreq_L000013_83 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_susk8_696dded1_propeller_clkmode_L000014 ' <symbol:propeller_clkmode>
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
 mov r0, #1 ' reg <- coni
' C_susk8_696dded1_propeller_clkmode_L000014_84 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_susk9_696dded1_propeller_getcnt_L000015 ' <symbol:propeller_getcnt>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__cnthl ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
' C_susk9_696dded1_propeller_getcnt_L000015_85 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_suska_696dded1_propeller_muldiv64_L000016 ' <symbol:propeller_muldiv64>
 jmp #NEWF
 sub SP, #12
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__muldiv64
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
' C_suska_696dded1_propeller_muldiv64_L000016_87 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_suskb_696dded1_propeller_setenv_L000017 ' <symbol:propeller_setenv>
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
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
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 mov r0, #1 ' reg <- coni
' C_suskb_696dded1_propeller_setenv_L000017_88 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_suskc_696dded1_propeller_unsetenv_L000018 ' <symbol:propeller_unsetenv>
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
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
 mov r0, #1 ' reg <- coni
' C_suskc_696dded1_propeller_unsetenv_L000018_89 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_suskd_696dded1_propeller_getpin_L000019 ' <symbol:propeller_getpin>
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
 long @C_suskd_696dded1_propeller_getpin_L000019_94 ' LTI4
 cmps r21,  #63 wz,wc
 jmp #BRBE
 long @C_suskd_696dded1_propeller_getpin_L000019_93 ' LEI4
C_suskd_696dded1_propeller_getpin_L000019_94
 jmp #LODL
 long @C_suskd_696dded1_propeller_getpin_L000019_91_L000092
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_suskd_696dded1_propeller_getpin_L000019_93
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
 mov r0, #1 ' reg <- coni
' C_suskd_696dded1_propeller_getpin_L000019_90 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_suske_696dded1_propeller_setpin_L000020 ' <symbol:propeller_setpin>
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
 long @C_suske_696dded1_propeller_setpin_L000020_97 ' LTI4
 cmps r21,  #63 wz,wc
 jmp #BRBE
 long @C_suske_696dded1_propeller_setpin_L000020_96 ' LEI4
C_suske_696dded1_propeller_setpin_L000020_97
 jmp #LODL
 long @C_suskd_696dded1_propeller_getpin_L000019_91_L000092
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_suske_696dded1_propeller_setpin_L000020_96
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_suske_696dded1_propeller_setpin_L000020_100 ' EQI4
 cmps r19,  #1 wz
 jmp #BR_Z
 long @C_suske_696dded1_propeller_setpin_L000020_100 ' EQI4
 jmp #LODL
 long @C_suske_696dded1_propeller_setpin_L000020_98_L000099
 mov r2, RI ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_suske_696dded1_propeller_setpin_L000020_100
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
 mov r0, #0 ' reg <- coni
' C_suske_696dded1_propeller_setpin_L000020_95 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_suskf_696dded1_propeller_togglepin_L000021 ' <symbol:propeller_togglepin>
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
 long @C_suskf_696dded1_propeller_togglepin_L000021_103 ' LTI4
 cmps r21,  #63 wz,wc
 jmp #BRBE
 long @C_suskf_696dded1_propeller_togglepin_L000021_102 ' LEI4
C_suskf_696dded1_propeller_togglepin_L000021_103
 jmp #LODL
 long @C_suskd_696dded1_propeller_getpin_L000019_91_L000092
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_suskf_696dded1_propeller_togglepin_L000021_102
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
 mov r0, #0 ' reg <- coni
' C_suskf_696dded1_propeller_togglepin_L000021_101 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_suskg_696dded1_propeller_sleep_L000022 ' <symbol:propeller_sleep>
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
 long @C_suskg_696dded1_propeller_sleep_L000022_105 ' LEI4
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
 long @C_suskg_696dded1_propeller_sleep_L000022_109 ' GEI4
 jmp #LODL
 long @C_suskg_696dded1_propeller_sleep_L000022_107_L000108
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_suskg_696dded1_propeller_sleep_L000022_109
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_suskg_696dded1_propeller_sleep_L000022_110 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitsec ' CALL addrg
C_suskg_696dded1_propeller_sleep_L000022_110
C_suskg_696dded1_propeller_sleep_L000022_105
 mov r0, #0 ' reg <- coni
' C_suskg_696dded1_propeller_sleep_L000022_104 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_suskh_696dded1_propeller_msleep_L000023 ' <symbol:propeller_msleep>
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
 long @C_suskh_696dded1_propeller_msleep_L000023_113 ' LEI4
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
 long @C_suskh_696dded1_propeller_msleep_L000023_117 ' GEI4
 jmp #LODL
 long @C_suskh_696dded1_propeller_msleep_L000023_115_L000116
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_suskh_696dded1_propeller_msleep_L000023_117
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_suskh_696dded1_propeller_msleep_L000023_118 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_suskh_696dded1_propeller_msleep_L000023_118
C_suskh_696dded1_propeller_msleep_L000023_113
 mov r0, #0 ' reg <- coni
' C_suskh_696dded1_propeller_msleep_L000023_112 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_suski_696dded1_propeller_sbrk_L000024 ' <symbol:propeller_sbrk>
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
 long @C_suski_696dded1_propeller_sbrk_L000024_121 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_suski_696dded1_propeller_sbrk_L000024_123 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_malloc_defragment ' CALL addrg
C_suski_696dded1_propeller_sbrk_L000024_123
C_suski_696dded1_propeller_sbrk_L000024_121
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
 mov r0, #1 ' reg <- coni
' C_suski_696dded1_propeller_sbrk_L000024_120 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_suskj_696dded1_propeller_version_L000025 ' <symbol:propeller_version>
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
 long @C_suskj_696dded1_propeller_version_L000025_126 ' LEI4
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
 long @C_suskj_696dded1_propeller_version_L000025_130_L000131
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_suskj_696dded1_propeller_version_L000025_128 ' NEI4
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_suskj_696dded1_propeller_version_L000025_127 ' JUMPV addrg
C_suskj_696dded1_propeller_version_L000025_128
 jmp #LODL
 long @C_suskj_696dded1_propeller_version_L000025_134_L000135
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_suskj_696dded1_propeller_version_L000025_132 ' NEI4
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_suskj_696dded1_propeller_version_L000025_127 ' JUMPV addrg
C_suskj_696dded1_propeller_version_L000025_132
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
 long @C_suskj_696dded1_propeller_version_L000025_127 ' JUMPV addrg
C_suskj_696dded1_propeller_version_L000025_126
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
C_suskj_696dded1_propeller_version_L000025_127
 mov r0, #1 ' reg <- coni
' C_suskj_696dded1_propeller_version_L000025_125 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_suskk_696dded1_propeller_mount_L000026 ' <symbol:propeller_mount>
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
 mov r0, #1 ' reg <- coni
' C_suskk_696dded1_propeller_mount_L000026_136 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_susk1l_696dded1_nulldir_L000137 ' <symbol:nulldir>
 byte 47
 byte 0

 alignl ' align long
C_susk1m_696dded1_nullpattern_L000138 ' <symbol:nullpattern>
 byte 42
 byte 0

 alignl ' align long
C_susk1n_696dded1_match_function_L000139 ' <symbol:match_function>
 long -2

 alignl ' align long
C_susk1o_696dded1_match_state_L000140 ' <symbol:match_state>
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_susk1p_696dded1_match_callback_L000141 ' <symbol:match_callback>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_susk1n_696dded1_match_function_L000139
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_susk1p_696dded1_match_callback_L000141_143 ' EQI4
 jmp #LODI
 long @C_susk1o_696dded1_match_state_L000140
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_susk1p_696dded1_match_callback_L000141_143 ' EQU4
 jmp #LODI
 long @C_susk1n_696dded1_match_function_L000139
 mov r2, RI ' reg ARG INDIR ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_susk1o_696dded1_match_state_L000140
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_susk1o_696dded1_match_state_L000140
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_susk1o_696dded1_match_state_L000140
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_susk1o_696dded1_match_state_L000140
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
 long @C_susk1o_696dded1_match_state_L000140 ' stack ARG INDIR ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_susk1p_696dded1_match_callback_L000141_144 ' JUMPV addrg
C_susk1p_696dded1_match_callback_L000141_143
 jmp #LODL
 long @C_susk1p_696dded1_match_callback_L000141_145_L000146
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_printf ' CALL addrg
C_susk1p_696dded1_match_callback_L000141_144
' C_susk1p_696dded1_match_callback_L000141_142 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_suskl_696dded1_propeller_scan_L000027 ' <symbol:propeller_scan>
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
 long @C_suskl_696dded1_propeller_scan_L000027_148 ' LTI4
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
 long @C_suskl_696dded1_propeller_scan_L000027_152 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_iscfunction
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_suskl_696dded1_propeller_scan_L000027_150 ' EQI4
C_suskl_696dded1_propeller_scan_L000027_152
 jmp #LODL
 long @C_suskl_696dded1_propeller_scan_L000027_153_L000154
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_suskl_696dded1_propeller_scan_L000027_150
C_suskl_696dded1_propeller_scan_L000027_148
 cmps r21,  #2 wz,wc
 jmp #BR_B
 long @C_suskl_696dded1_propeller_scan_L000027_155 ' LTI4
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
 long @C_suskl_696dded1_propeller_scan_L000027_157 ' NEU4
 jmp #LODL
 long @C_susk1l_696dded1_nulldir_L000137
 mov r19, RI ' reg <- addrg
C_suskl_696dded1_propeller_scan_L000027_157
C_suskl_696dded1_propeller_scan_L000027_155
 cmps r21,  #3 wz,wc
 jmp #BR_B
 long @C_suskl_696dded1_propeller_scan_L000027_159 ' LTI4
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
 long @C_suskl_696dded1_propeller_scan_L000027_161 ' NEU4
 jmp #LODL
 long @C_susk1m_696dded1_nullpattern_L000138
 mov r17, RI ' reg <- addrg
C_suskl_696dded1_propeller_scan_L000027_161
C_suskl_696dded1_propeller_scan_L000027_159
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_suskl_696dded1_propeller_scan_L000027_163 ' LEI4
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
 long @C_susk1n_696dded1_match_function_L000139
 mov BC, r0
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long @C_susk1o_696dded1_match_state_L000140
 mov BC, r23
 jmp #WLNG ' ASGNP4 addrg reg
 jmp #LODL
 long @C_susk1p_696dded1_match_callback_L000141
 mov r2, RI ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_doD_ir
 add SP, #8 ' CALL addrg
 jmp #LODI
 long @C_susk1n_696dded1_match_function_L000139
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
 long @C_susk1n_696dded1_match_function_L000139
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_susk1o_696dded1_match_state_L000140
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
C_suskl_696dded1_propeller_scan_L000027_163
 mov r0, #0 ' reg <- coni
' C_suskl_696dded1_propeller_scan_L000027_147 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_suskm_696dded1_propeller_execute_L000028 ' <symbol:propeller_execute>
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
 long @C_suskm_696dded1_propeller_execute_L000028_166 ' GEI4
 jmp #LODL
 long -4
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_suskm_696dded1_propeller_execute_L000028_165 ' JUMPV addrg
C_suskm_696dded1_propeller_execute_L000028_166
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
 long @C_suskm_696dded1_propeller_execute_L000028_168 ' LTI4
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
C_suskm_696dded1_propeller_execute_L000028_168
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
 long @C_suskm_696dded1_propeller_execute_L000028_170 ' NEU4
 jmp #LODL
 long -3
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_suskm_696dded1_propeller_execute_L000028_165 ' JUMPV addrg
C_suskm_696dded1_propeller_execute_L000028_170
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_suskm_696dded1_propeller_execute_L000028_172 ' NEU4
 jmp #LODL
 long @C_suskm_696dded1_propeller_execute_L000028_174_L000175
 mov r17, RI ' reg <- addrg
C_suskm_696dded1_propeller_execute_L000028_172
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_remove ' CALL addrg
 jmp #LODL
 long @C_suskm_696dded1_propeller_execute_L000028_176_L000177
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
 long @C_suskm_696dded1_propeller_execute_L000028_178 ' EQU4
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
 long @C_suskm_696dded1_propeller_execute_L000028_180 ' NEU4
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
 long @C_suskm_696dded1_propeller_execute_L000028_165 ' JUMPV addrg
C_suskm_696dded1_propeller_execute_L000028_180
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fclose ' CALL addrg
 jmp #LODL
 long -2
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_suskm_696dded1_propeller_execute_L000028_165 ' JUMPV addrg
C_suskm_696dded1_propeller_execute_L000028_178
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
C_suskm_696dded1_propeller_execute_L000028_165
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
 long @C_luaopen_propeller_183_L000184
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
 long @C_suskn_696dded1_luapropeller_funcs_L000029
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_luaopen_propeller_182 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


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
C_suskm_696dded1_propeller_execute_L000028_176_L000177 ' <symbol:176>
 byte 119
 byte 0

 alignl ' align long
C_suskm_696dded1_propeller_execute_L000028_174_L000175 ' <symbol:174>
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
C_suskl_696dded1_propeller_scan_L000027_153_L000154 ' <symbol:153>
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
C_susk1p_696dded1_match_callback_L000141_145_L000146 ' <symbol:145>
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
C_suskj_696dded1_propeller_version_L000025_134_L000135 ' <symbol:134>
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
C_suskj_696dded1_propeller_version_L000025_130_L000131 ' <symbol:130>
 byte 108
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_suskh_696dded1_propeller_msleep_L000023_115_L000116 ' <symbol:115>
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
C_suskg_696dded1_propeller_sleep_L000022_107_L000108 ' <symbol:107>
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
C_suske_696dded1_propeller_setpin_L000020_98_L000099 ' <symbol:98>
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
C_suskd_696dded1_propeller_getpin_L000019_91_L000092 ' <symbol:91>
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
C_susk1e_696dded1_74_L000075 ' <symbol:74>
 byte 101
 byte 120
 byte 101
 byte 99
 byte 117
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_susk1d_696dded1_72_L000073 ' <symbol:72>
 byte 115
 byte 99
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_susk1c_696dded1_70_L000071 ' <symbol:70>
 byte 109
 byte 111
 byte 117
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_susk1b_696dded1_68_L000069 ' <symbol:68>
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_susk1a_696dded1_66_L000067 ' <symbol:66>
 byte 115
 byte 98
 byte 114
 byte 107
 byte 0

 alignl ' align long
C_susk19_696dded1_64_L000065 ' <symbol:64>
 byte 109
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_susk18_696dded1_62_L000063 ' <symbol:62>
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_susk17_696dded1_60_L000061 ' <symbol:60>
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
C_susk16_696dded1_58_L000059 ' <symbol:58>
 byte 115
 byte 101
 byte 116
 byte 112
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_susk15_696dded1_56_L000057 ' <symbol:56>
 byte 103
 byte 101
 byte 116
 byte 112
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_susk14_696dded1_54_L000055 ' <symbol:54>
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
C_susk13_696dded1_52_L000053 ' <symbol:52>
 byte 115
 byte 101
 byte 116
 byte 101
 byte 110
 byte 118
 byte 0

 alignl ' align long
C_susk12_696dded1_50_L000051 ' <symbol:50>
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
C_susk11_696dded1_48_L000049 ' <symbol:48>
 byte 103
 byte 101
 byte 116
 byte 99
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_susk10_696dded1_46_L000047 ' <symbol:46>
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
C_suskv_696dded1_44_L000045 ' <symbol:44>
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
C_susku_696dded1_42_L000043 ' <symbol:42>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 114
 byte 101
 byte 108
 byte 0

 alignl ' align long
C_suskt_696dded1_40_L000041 ' <symbol:40>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 116
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_susks_696dded1_38_L000039 ' <symbol:38>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 114
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_suskr_696dded1_36_L000037 ' <symbol:36>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 115
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_suskq_696dded1_34_L000035 ' <symbol:34>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 99
 byte 108
 byte 114
 byte 0

 alignl ' align long
C_suskp_696dded1_32_L000033 ' <symbol:32>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 110
 byte 101
 byte 119
 byte 0

 alignl ' align long
C_susko_696dded1_30_L000031 ' <symbol:30>
 byte 99
 byte 111
 byte 103
 byte 105
 byte 100
 byte 0

' Catalina Code

DAT ' code segment
' end
