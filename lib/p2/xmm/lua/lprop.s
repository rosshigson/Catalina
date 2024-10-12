' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sf5ko_6709f8af_luapropeller_funcs_L000028 ' <symbol:luapropeller_funcs>
 long @C_sf5kp_6709f8af_29_L000030
 long @C_sf5k_6709f8af_propeller_cogid_L000004
 long @C_sf5kq_6709f8af_31_L000032
 long @C_sf5k1_6709f8af_propeller_locknew_L000005
 long @C_sf5kr_6709f8af_33_L000034
 long @C_sf5k2_6709f8af_propeller_lockclr_L000006
 long @C_sf5ks_6709f8af_35_L000036
 long @C_sf5k3_6709f8af_propeller_lockset_L000007
 long @C_sf5kt_6709f8af_37_L000038
 long @C_sf5k4_6709f8af_propeller_lockret_L000008
 long @C_sf5ku_6709f8af_39_L000040
 long @C_sf5k5_6709f8af_propeller_locktry_L000009
 long @C_sf5kv_6709f8af_41_L000042
 long @C_sf5k6_6709f8af_propeller_lockrel_L000010
 long @C_sf5k10_6709f8af_43_L000044
 long @C_sf5k7_6709f8af_propeller_clkfreq_L000011
 long @C_sf5k11_6709f8af_45_L000046
 long @C_sf5k8_6709f8af_propeller_clkmode_L000012
 long @C_sf5k12_6709f8af_47_L000048
 long @C_sf5k9_6709f8af_propeller_getcnt_L000013
 long @C_sf5k13_6709f8af_49_L000050
 long @C_sf5ka_6709f8af_propeller_muldiv64_L000014
 long @C_sf5k14_6709f8af_51_L000052
 long @C_sf5kc_6709f8af_propeller_setenv_L000016
 long @C_sf5k15_6709f8af_53_L000054
 long @C_sf5kd_6709f8af_propeller_unsetenv_L000017
 long @C_sf5k16_6709f8af_55_L000056
 long @C_sf5ke_6709f8af_propeller_getpin_L000018
 long @C_sf5k17_6709f8af_57_L000058
 long @C_sf5kf_6709f8af_propeller_setpin_L000019
 long @C_sf5k18_6709f8af_59_L000060
 long @C_sf5kg_6709f8af_propeller_togglepin_L000020
 long @C_sf5k19_6709f8af_61_L000062
 long @C_sf5kh_6709f8af_propeller_sleep_L000021
 long @C_sf5k1a_6709f8af_63_L000064
 long @C_sf5ki_6709f8af_propeller_msleep_L000022
 long @C_sf5k1b_6709f8af_65_L000066
 long @C_sf5kj_6709f8af_propeller_sbrk_L000023
 long @C_sf5k1c_6709f8af_67_L000068
 long @C_sf5kk_6709f8af_propeller_version_L000024
 long @C_sf5k1d_6709f8af_69_L000070
 long @C_sf5kl_6709f8af_propeller_mount_L000025
 long @C_sf5k1e_6709f8af_71_L000072
 long @C_sf5km_6709f8af_propeller_scan_L000026
 long @C_sf5k1f_6709f8af_73_L000074
 long @C_sf5kn_6709f8af_propeller_execute_L000027
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sf5k_6709f8af_propeller_cogid_L000004 ' <symbol:propeller_cogid>
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
' C_sf5k_6709f8af_propeller_cogid_L000004_75 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5k1_6709f8af_propeller_locknew_L000005 ' <symbol:propeller_locknew>
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
' C_sf5k1_6709f8af_propeller_locknew_L000005_76 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5k2_6709f8af_propeller_lockclr_L000006 ' <symbol:propeller_lockclr>
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
' C_sf5k2_6709f8af_propeller_lockclr_L000006_77 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sf5k3_6709f8af_propeller_lockset_L000007 ' <symbol:propeller_lockset>
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
' C_sf5k3_6709f8af_propeller_lockset_L000007_78 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sf5k4_6709f8af_propeller_lockret_L000008 ' <symbol:propeller_lockret>
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
' C_sf5k4_6709f8af_propeller_lockret_L000008_79 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sf5k5_6709f8af_propeller_locktry_L000009 ' <symbol:propeller_locktry>
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
' C_sf5k5_6709f8af_propeller_locktry_L000009_80 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sf5k6_6709f8af_propeller_lockrel_L000010 ' <symbol:propeller_lockrel>
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
' C_sf5k6_6709f8af_propeller_lockrel_L000010_81 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sf5k7_6709f8af_propeller_clkfreq_L000011 ' <symbol:propeller_clkfreq>
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
' C_sf5k7_6709f8af_propeller_clkfreq_L000011_82 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5k8_6709f8af_propeller_clkmode_L000012 ' <symbol:propeller_clkmode>
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
' C_sf5k8_6709f8af_propeller_clkmode_L000012_83 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5k9_6709f8af_propeller_getcnt_L000013 ' <symbol:propeller_getcnt>
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
' C_sf5k9_6709f8af_propeller_getcnt_L000013_84 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sf5ka_6709f8af_propeller_muldiv64_L000014 ' <symbol:propeller_muldiv64>
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
' C_sf5ka_6709f8af_propeller_muldiv64_L000014_86 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sf5kc_6709f8af_propeller_setenv_L000016 ' <symbol:propeller_setenv>
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
' C_sf5kc_6709f8af_propeller_setenv_L000016_87 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sf5kd_6709f8af_propeller_unsetenv_L000017 ' <symbol:propeller_unsetenv>
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
' C_sf5kd_6709f8af_propeller_unsetenv_L000017_88 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sf5ke_6709f8af_propeller_getpin_L000018 ' <symbol:propeller_getpin>
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
 long @C_sf5ke_6709f8af_propeller_getpin_L000018_93 ' LTI4
 cmps r21,  #63 wz,wc
 jmp #BRBE
 long @C_sf5ke_6709f8af_propeller_getpin_L000018_92 ' LEI4
C_sf5ke_6709f8af_propeller_getpin_L000018_93
 jmp #LODL
 long @C_sf5ke_6709f8af_propeller_getpin_L000018_90_L000091
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sf5ke_6709f8af_propeller_getpin_L000018_92
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
' C_sf5ke_6709f8af_propeller_getpin_L000018_89 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5kf_6709f8af_propeller_setpin_L000019 ' <symbol:propeller_setpin>
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
 long @C_sf5kf_6709f8af_propeller_setpin_L000019_96 ' LTI4
 cmps r21,  #63 wz,wc
 jmp #BRBE
 long @C_sf5kf_6709f8af_propeller_setpin_L000019_95 ' LEI4
C_sf5kf_6709f8af_propeller_setpin_L000019_96
 jmp #LODL
 long @C_sf5ke_6709f8af_propeller_getpin_L000018_90_L000091
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sf5kf_6709f8af_propeller_setpin_L000019_95
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sf5kf_6709f8af_propeller_setpin_L000019_99 ' EQI4
 cmps r19,  #1 wz
 jmp #BR_Z
 long @C_sf5kf_6709f8af_propeller_setpin_L000019_99 ' EQI4
 jmp #LODL
 long @C_sf5kf_6709f8af_propeller_setpin_L000019_97_L000098
 mov r2, RI ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sf5kf_6709f8af_propeller_setpin_L000019_99
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
' C_sf5kf_6709f8af_propeller_setpin_L000019_94 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5kg_6709f8af_propeller_togglepin_L000020 ' <symbol:propeller_togglepin>
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
 long @C_sf5kg_6709f8af_propeller_togglepin_L000020_102 ' LTI4
 cmps r21,  #63 wz,wc
 jmp #BRBE
 long @C_sf5kg_6709f8af_propeller_togglepin_L000020_101 ' LEI4
C_sf5kg_6709f8af_propeller_togglepin_L000020_102
 jmp #LODL
 long @C_sf5ke_6709f8af_propeller_getpin_L000018_90_L000091
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sf5kg_6709f8af_propeller_togglepin_L000020_101
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
' C_sf5kg_6709f8af_propeller_togglepin_L000020_100 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5kh_6709f8af_propeller_sleep_L000021 ' <symbol:propeller_sleep>
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
 long @C_sf5kh_6709f8af_propeller_sleep_L000021_104 ' LEI4
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
 long @C_sf5kh_6709f8af_propeller_sleep_L000021_108 ' GEI4
 jmp #LODL
 long @C_sf5kh_6709f8af_propeller_sleep_L000021_106_L000107
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sf5kh_6709f8af_propeller_sleep_L000021_108
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_sf5kh_6709f8af_propeller_sleep_L000021_109 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitsec ' CALL addrg
C_sf5kh_6709f8af_propeller_sleep_L000021_109
C_sf5kh_6709f8af_propeller_sleep_L000021_104
 mov r0, #0 ' reg <- coni
' C_sf5kh_6709f8af_propeller_sleep_L000021_103 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5ki_6709f8af_propeller_msleep_L000022 ' <symbol:propeller_msleep>
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
 long @C_sf5ki_6709f8af_propeller_msleep_L000022_112 ' LEI4
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
 long @C_sf5ki_6709f8af_propeller_msleep_L000022_116 ' GEI4
 jmp #LODL
 long @C_sf5ki_6709f8af_propeller_msleep_L000022_114_L000115
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sf5ki_6709f8af_propeller_msleep_L000022_116
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_sf5ki_6709f8af_propeller_msleep_L000022_117 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_sf5ki_6709f8af_propeller_msleep_L000022_117
C_sf5ki_6709f8af_propeller_msleep_L000022_112
 mov r0, #0 ' reg <- coni
' C_sf5ki_6709f8af_propeller_msleep_L000022_111 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5kj_6709f8af_propeller_sbrk_L000023 ' <symbol:propeller_sbrk>
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
 long @C_sf5kj_6709f8af_propeller_sbrk_L000023_120 ' LEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sf5kj_6709f8af_propeller_sbrk_L000023_122 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_malloc_defragment ' CALL addrg
C_sf5kj_6709f8af_propeller_sbrk_L000023_122
C_sf5kj_6709f8af_propeller_sbrk_L000023_120
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
' C_sf5kj_6709f8af_propeller_sbrk_L000023_119 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5kk_6709f8af_propeller_version_L000024 ' <symbol:propeller_version>
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
 long @C_sf5kk_6709f8af_propeller_version_L000024_125 ' LEI4
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
 long @C_sf5kk_6709f8af_propeller_version_L000024_129_L000130
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sf5kk_6709f8af_propeller_version_L000024_127 ' NEI4
 mov r2, #504 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sf5kk_6709f8af_propeller_version_L000024_126 ' JUMPV addrg
C_sf5kk_6709f8af_propeller_version_L000024_127
 jmp #LODL
 long @C_sf5kk_6709f8af_propeller_version_L000024_133_L000134
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sf5kk_6709f8af_propeller_version_L000024_131 ' NEI4
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sf5kk_6709f8af_propeller_version_L000024_126 ' JUMPV addrg
C_sf5kk_6709f8af_propeller_version_L000024_131
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
 long @C_sf5kk_6709f8af_propeller_version_L000024_126 ' JUMPV addrg
C_sf5kk_6709f8af_propeller_version_L000024_125
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
C_sf5kk_6709f8af_propeller_version_L000024_126
 mov r0, #1 ' reg <- coni
' C_sf5kk_6709f8af_propeller_version_L000024_124 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5kl_6709f8af_propeller_mount_L000025 ' <symbol:propeller_mount>
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
' C_sf5kl_6709f8af_propeller_mount_L000025_135 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sf5k1m_6709f8af_nulldir_L000136 ' <symbol:nulldir>
 byte 47
 byte 0

 alignl ' align long
C_sf5k1n_6709f8af_nullpattern_L000137 ' <symbol:nullpattern>
 byte 42
 byte 0

 alignl ' align long
C_sf5k1o_6709f8af_match_function_L000138 ' <symbol:match_function>
 long -2

 alignl ' align long
C_sf5k1p_6709f8af_match_state_L000139 ' <symbol:match_state>
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sf5k1q_6709f8af_match_callback_L000140 ' <symbol:match_callback>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sf5k1o_6709f8af_match_function_L000138
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sf5k1q_6709f8af_match_callback_L000140_142 ' EQI4
 jmp #LODI
 long @C_sf5k1p_6709f8af_match_state_L000139
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sf5k1q_6709f8af_match_callback_L000140_142 ' EQU4
 jmp #LODI
 long @C_sf5k1o_6709f8af_match_function_L000138
 mov r2, RI ' reg ARG INDIR ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 jmp #LODI
 long @C_sf5k1p_6709f8af_match_state_L000139
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sf5k1p_6709f8af_match_state_L000139
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sf5k1p_6709f8af_match_state_L000139
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sf5k1p_6709f8af_match_state_L000139
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
 long @C_sf5k1p_6709f8af_match_state_L000139 ' stack ARG INDIR ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_sf5k1q_6709f8af_match_callback_L000140_143 ' JUMPV addrg
C_sf5k1q_6709f8af_match_callback_L000140_142
 jmp #LODL
 long @C_sf5k1q_6709f8af_match_callback_L000140_144_L000145
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_printf ' CALL addrg
C_sf5k1q_6709f8af_match_callback_L000140_143
' C_sf5k1q_6709f8af_match_callback_L000140_141 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5km_6709f8af_propeller_scan_L000026 ' <symbol:propeller_scan>
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
 long @C_sf5km_6709f8af_propeller_scan_L000026_147 ' LTI4
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
 long @C_sf5km_6709f8af_propeller_scan_L000026_151 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_iscfunction
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sf5km_6709f8af_propeller_scan_L000026_149 ' EQI4
C_sf5km_6709f8af_propeller_scan_L000026_151
 jmp #LODL
 long @C_sf5km_6709f8af_propeller_scan_L000026_152_L000153
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sf5km_6709f8af_propeller_scan_L000026_149
C_sf5km_6709f8af_propeller_scan_L000026_147
 cmps r21,  #2 wz,wc
 jmp #BR_B
 long @C_sf5km_6709f8af_propeller_scan_L000026_154 ' LTI4
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
 long @C_sf5km_6709f8af_propeller_scan_L000026_156 ' NEU4
 jmp #LODL
 long @C_sf5k1m_6709f8af_nulldir_L000136
 mov r19, RI ' reg <- addrg
C_sf5km_6709f8af_propeller_scan_L000026_156
C_sf5km_6709f8af_propeller_scan_L000026_154
 cmps r21,  #3 wz,wc
 jmp #BR_B
 long @C_sf5km_6709f8af_propeller_scan_L000026_158 ' LTI4
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
 long @C_sf5km_6709f8af_propeller_scan_L000026_160 ' NEU4
 jmp #LODL
 long @C_sf5k1n_6709f8af_nullpattern_L000137
 mov r17, RI ' reg <- addrg
C_sf5km_6709f8af_propeller_scan_L000026_160
C_sf5km_6709f8af_propeller_scan_L000026_158
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_sf5km_6709f8af_propeller_scan_L000026_162 ' LEI4
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
 long @C_sf5k1o_6709f8af_match_function_L000138
 mov BC, r0
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long @C_sf5k1p_6709f8af_match_state_L000139
 mov BC, r23
 jmp #WLNG ' ASGNP4 addrg reg
 jmp #LODL
 long @C_sf5k1q_6709f8af_match_callback_L000140
 mov r2, RI ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_doD_ir
 add SP, #8 ' CALL addrg
 jmp #LODI
 long @C_sf5k1o_6709f8af_match_function_L000138
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
 long @C_sf5k1o_6709f8af_match_function_L000138
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_sf5k1p_6709f8af_match_state_L000139
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
C_sf5km_6709f8af_propeller_scan_L000026_162
 mov r0, #0 ' reg <- coni
' C_sf5km_6709f8af_propeller_scan_L000026_146 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5kn_6709f8af_propeller_execute_L000027 ' <symbol:propeller_execute>
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
 long @C_sf5kn_6709f8af_propeller_execute_L000027_165 ' GEI4
 jmp #LODL
 long -4
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sf5kn_6709f8af_propeller_execute_L000027_164 ' JUMPV addrg
C_sf5kn_6709f8af_propeller_execute_L000027_165
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
 long @C_sf5kn_6709f8af_propeller_execute_L000027_167 ' LTI4
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
C_sf5kn_6709f8af_propeller_execute_L000027_167
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
 long @C_sf5kn_6709f8af_propeller_execute_L000027_169 ' NEU4
 jmp #LODL
 long -3
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sf5kn_6709f8af_propeller_execute_L000027_164 ' JUMPV addrg
C_sf5kn_6709f8af_propeller_execute_L000027_169
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sf5kn_6709f8af_propeller_execute_L000027_171 ' NEU4
 jmp #LODL
 long @C_sf5kn_6709f8af_propeller_execute_L000027_173_L000174
 mov r17, RI ' reg <- addrg
C_sf5kn_6709f8af_propeller_execute_L000027_171
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_remove ' CALL addrg
 jmp #LODL
 long @C_sf5kn_6709f8af_propeller_execute_L000027_175_L000176
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
 long @C_sf5kn_6709f8af_propeller_execute_L000027_177 ' EQU4
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
 long @C_sf5kn_6709f8af_propeller_execute_L000027_179 ' NEU4
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
 long @C_sf5kn_6709f8af_propeller_execute_L000027_164 ' JUMPV addrg
C_sf5kn_6709f8af_propeller_execute_L000027_179
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fclose ' CALL addrg
 jmp #LODL
 long -2
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sf5kn_6709f8af_propeller_execute_L000027_164 ' JUMPV addrg
C_sf5kn_6709f8af_propeller_execute_L000027_177
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
C_sf5kn_6709f8af_propeller_execute_L000027_164
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sf5k1v_6709f8af_propeller_k_get_L000181 ' <symbol:propeller_k_get>
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
' C_sf5k1v_6709f8af_propeller_k_get_L000181_182 ' (symbol refcount = 0)
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
 long @C_luaopen_propeller_184_L000185
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
 long @C_sf5ko_6709f8af_luapropeller_funcs_L000028
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_luaopen_propeller_183 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import k_get

' Catalina Import exit

' Catalina Import sbrk

' Catalina Import unsetenv

' Catalina Import setenv

' Catalina Import doDir

' Catalina Import mountFatVolume

' Catalina Import _cnthl

' Catalina Import _muldiv64

' Catalina Import _lockrel

' Catalina Import _locktry

' Catalina Import _lockret

' Catalina Import _locknew

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
C_luaopen_propeller_184_L000185 ' <symbol:184>
 long $43fc0000 ' float

 alignl ' align long
C_sf5kn_6709f8af_propeller_execute_L000027_175_L000176 ' <symbol:175>
 byte 119
 byte 0

 alignl ' align long
C_sf5kn_6709f8af_propeller_execute_L000027_173_L000174 ' <symbol:173>
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
C_sf5km_6709f8af_propeller_scan_L000026_152_L000153 ' <symbol:152>
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
C_sf5k1q_6709f8af_match_callback_L000140_144_L000145 ' <symbol:144>
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
C_sf5kk_6709f8af_propeller_version_L000024_133_L000134 ' <symbol:133>
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
C_sf5kk_6709f8af_propeller_version_L000024_129_L000130 ' <symbol:129>
 byte 108
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_sf5ki_6709f8af_propeller_msleep_L000022_114_L000115 ' <symbol:114>
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
C_sf5kh_6709f8af_propeller_sleep_L000021_106_L000107 ' <symbol:106>
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
C_sf5kf_6709f8af_propeller_setpin_L000019_97_L000098 ' <symbol:97>
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
C_sf5ke_6709f8af_propeller_getpin_L000018_90_L000091 ' <symbol:90>
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
C_sf5k1f_6709f8af_73_L000074 ' <symbol:73>
 byte 101
 byte 120
 byte 101
 byte 99
 byte 117
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_sf5k1e_6709f8af_71_L000072 ' <symbol:71>
 byte 115
 byte 99
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_sf5k1d_6709f8af_69_L000070 ' <symbol:69>
 byte 109
 byte 111
 byte 117
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_sf5k1c_6709f8af_67_L000068 ' <symbol:67>
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_sf5k1b_6709f8af_65_L000066 ' <symbol:65>
 byte 115
 byte 98
 byte 114
 byte 107
 byte 0

 alignl ' align long
C_sf5k1a_6709f8af_63_L000064 ' <symbol:63>
 byte 109
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_sf5k19_6709f8af_61_L000062 ' <symbol:61>
 byte 115
 byte 108
 byte 101
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_sf5k18_6709f8af_59_L000060 ' <symbol:59>
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
C_sf5k17_6709f8af_57_L000058 ' <symbol:57>
 byte 115
 byte 101
 byte 116
 byte 112
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sf5k16_6709f8af_55_L000056 ' <symbol:55>
 byte 103
 byte 101
 byte 116
 byte 112
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sf5k15_6709f8af_53_L000054 ' <symbol:53>
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
C_sf5k14_6709f8af_51_L000052 ' <symbol:51>
 byte 115
 byte 101
 byte 116
 byte 101
 byte 110
 byte 118
 byte 0

 alignl ' align long
C_sf5k13_6709f8af_49_L000050 ' <symbol:49>
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
C_sf5k12_6709f8af_47_L000048 ' <symbol:47>
 byte 103
 byte 101
 byte 116
 byte 99
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_sf5k11_6709f8af_45_L000046 ' <symbol:45>
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
C_sf5k10_6709f8af_43_L000044 ' <symbol:43>
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
C_sf5kv_6709f8af_41_L000042 ' <symbol:41>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 114
 byte 101
 byte 108
 byte 0

 alignl ' align long
C_sf5ku_6709f8af_39_L000040 ' <symbol:39>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 116
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sf5kt_6709f8af_37_L000038 ' <symbol:37>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 114
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_sf5ks_6709f8af_35_L000036 ' <symbol:35>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 115
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_sf5kr_6709f8af_33_L000034 ' <symbol:33>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 99
 byte 108
 byte 114
 byte 0

 alignl ' align long
C_sf5kq_6709f8af_31_L000032 ' <symbol:31>
 byte 108
 byte 111
 byte 99
 byte 107
 byte 110
 byte 101
 byte 119
 byte 0

 alignl ' align long
C_sf5kp_6709f8af_29_L000030 ' <symbol:29>
 byte 99
 byte 111
 byte 103
 byte 105
 byte 100
 byte 0

' Catalina Code

DAT ' code segment
' end
